; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100022 () Bool)

(assert start!100022)

(declare-fun b_free!25601 () Bool)

(declare-fun b_next!25601 () Bool)

(assert (=> start!100022 (= b_free!25601 (not b_next!25601))))

(declare-fun tp!89516 () Bool)

(declare-fun b_and!42069 () Bool)

(assert (=> start!100022 (= tp!89516 b_and!42069)))

(declare-fun b!1191797 () Bool)

(declare-fun res!792762 () Bool)

(declare-fun e!677457 () Bool)

(assert (=> b!1191797 (=> (not res!792762) (not e!677457))))

(declare-datatypes ((array!77053 0))(
  ( (array!77054 (arr!37176 (Array (_ BitVec 32) (_ BitVec 64))) (size!37712 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77053)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45301 0))(
  ( (V!45302 (val!15122 Int)) )
))
(declare-datatypes ((ValueCell!14356 0))(
  ( (ValueCellFull!14356 (v!17760 V!45301)) (EmptyCell!14356) )
))
(declare-datatypes ((array!77055 0))(
  ( (array!77056 (arr!37177 (Array (_ BitVec 32) ValueCell!14356)) (size!37713 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77055)

(assert (=> b!1191797 (= res!792762 (and (= (size!37713 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37712 _keys!1208) (size!37713 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191798 () Bool)

(declare-fun res!792757 () Bool)

(assert (=> b!1191798 (=> (not res!792757) (not e!677457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77053 (_ BitVec 32)) Bool)

(assert (=> b!1191798 (= res!792757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!792752 () Bool)

(assert (=> start!100022 (=> (not res!792752) (not e!677457))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100022 (= res!792752 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37712 _keys!1208))))))

(assert (=> start!100022 e!677457))

(declare-fun tp_is_empty!30131 () Bool)

(assert (=> start!100022 tp_is_empty!30131))

(declare-fun array_inv!28350 (array!77053) Bool)

(assert (=> start!100022 (array_inv!28350 _keys!1208)))

(assert (=> start!100022 true))

(assert (=> start!100022 tp!89516))

(declare-fun e!677452 () Bool)

(declare-fun array_inv!28351 (array!77055) Bool)

(assert (=> start!100022 (and (array_inv!28351 _values!996) e!677452)))

(declare-fun mapIsEmpty!47024 () Bool)

(declare-fun mapRes!47024 () Bool)

(assert (=> mapIsEmpty!47024 mapRes!47024))

(declare-fun b!1191799 () Bool)

(declare-fun res!792754 () Bool)

(declare-fun e!677451 () Bool)

(assert (=> b!1191799 (=> (not res!792754) (not e!677451))))

(declare-fun lt!541974 () array!77053)

(declare-datatypes ((List!26181 0))(
  ( (Nil!26178) (Cons!26177 (h!27386 (_ BitVec 64)) (t!38774 List!26181)) )
))
(declare-fun arrayNoDuplicates!0 (array!77053 (_ BitVec 32) List!26181) Bool)

(assert (=> b!1191799 (= res!792754 (arrayNoDuplicates!0 lt!541974 #b00000000000000000000000000000000 Nil!26178))))

(declare-fun b!1191800 () Bool)

(declare-fun e!677454 () Bool)

(assert (=> b!1191800 (= e!677454 true)))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!541971 () array!77055)

(declare-fun minValue!944 () V!45301)

(declare-fun zeroValue!944 () V!45301)

(declare-datatypes ((tuple2!19438 0))(
  ( (tuple2!19439 (_1!9730 (_ BitVec 64)) (_2!9730 V!45301)) )
))
(declare-datatypes ((List!26182 0))(
  ( (Nil!26179) (Cons!26178 (h!27387 tuple2!19438) (t!38775 List!26182)) )
))
(declare-datatypes ((ListLongMap!17407 0))(
  ( (ListLongMap!17408 (toList!8719 List!26182)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5160 (array!77053 array!77055 (_ BitVec 32) (_ BitVec 32) V!45301 V!45301 (_ BitVec 32) Int) ListLongMap!17407)

(declare-fun -!1744 (ListLongMap!17407 (_ BitVec 64)) ListLongMap!17407)

(assert (=> b!1191800 (= (getCurrentListMapNoExtraKeys!5160 lt!541974 lt!541971 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1744 (getCurrentListMapNoExtraKeys!5160 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39536 0))(
  ( (Unit!39537) )
))
(declare-fun lt!541972 () Unit!39536)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!953 (array!77053 array!77055 (_ BitVec 32) (_ BitVec 32) V!45301 V!45301 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39536)

(assert (=> b!1191800 (= lt!541972 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!953 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191801 () Bool)

(declare-fun res!792761 () Bool)

(assert (=> b!1191801 (=> (not res!792761) (not e!677457))))

(assert (=> b!1191801 (= res!792761 (= (select (arr!37176 _keys!1208) i!673) k!934))))

(declare-fun b!1191802 () Bool)

(declare-fun e!677456 () Bool)

(assert (=> b!1191802 (= e!677456 tp_is_empty!30131)))

(declare-fun b!1191803 () Bool)

(declare-fun res!792753 () Bool)

(assert (=> b!1191803 (=> (not res!792753) (not e!677457))))

(assert (=> b!1191803 (= res!792753 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26178))))

(declare-fun b!1191804 () Bool)

(declare-fun e!677455 () Bool)

(assert (=> b!1191804 (= e!677455 e!677454)))

(declare-fun res!792755 () Bool)

(assert (=> b!1191804 (=> res!792755 e!677454)))

(assert (=> b!1191804 (= res!792755 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541970 () ListLongMap!17407)

(assert (=> b!1191804 (= lt!541970 (getCurrentListMapNoExtraKeys!5160 lt!541974 lt!541971 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3093 (Int (_ BitVec 64)) V!45301)

(assert (=> b!1191804 (= lt!541971 (array!77056 (store (arr!37177 _values!996) i!673 (ValueCellFull!14356 (dynLambda!3093 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37713 _values!996)))))

(declare-fun lt!541973 () ListLongMap!17407)

(assert (=> b!1191804 (= lt!541973 (getCurrentListMapNoExtraKeys!5160 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191805 () Bool)

(assert (=> b!1191805 (= e!677451 (not e!677455))))

(declare-fun res!792758 () Bool)

(assert (=> b!1191805 (=> res!792758 e!677455)))

(assert (=> b!1191805 (= res!792758 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191805 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!541969 () Unit!39536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77053 (_ BitVec 64) (_ BitVec 32)) Unit!39536)

(assert (=> b!1191805 (= lt!541969 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1191806 () Bool)

(declare-fun e!677458 () Bool)

(assert (=> b!1191806 (= e!677458 tp_is_empty!30131)))

(declare-fun b!1191807 () Bool)

(declare-fun res!792763 () Bool)

(assert (=> b!1191807 (=> (not res!792763) (not e!677457))))

(assert (=> b!1191807 (= res!792763 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37712 _keys!1208))))))

(declare-fun b!1191808 () Bool)

(assert (=> b!1191808 (= e!677452 (and e!677458 mapRes!47024))))

(declare-fun condMapEmpty!47024 () Bool)

(declare-fun mapDefault!47024 () ValueCell!14356)

