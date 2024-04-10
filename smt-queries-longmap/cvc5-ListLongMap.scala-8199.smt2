; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100060 () Bool)

(assert start!100060)

(declare-fun b_free!25639 () Bool)

(declare-fun b_next!25639 () Bool)

(assert (=> start!100060 (= b_free!25639 (not b_next!25639))))

(declare-fun tp!89631 () Bool)

(declare-fun b_and!42145 () Bool)

(assert (=> start!100060 (= tp!89631 b_and!42145)))

(declare-fun b!1192690 () Bool)

(declare-fun res!793439 () Bool)

(declare-fun e!677907 () Bool)

(assert (=> b!1192690 (=> (not res!793439) (not e!677907))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1192690 (= res!793439 (validKeyInArray!0 k!934))))

(declare-fun b!1192691 () Bool)

(declare-fun res!793436 () Bool)

(assert (=> b!1192691 (=> (not res!793436) (not e!677907))))

(declare-datatypes ((array!77123 0))(
  ( (array!77124 (arr!37211 (Array (_ BitVec 32) (_ BitVec 64))) (size!37747 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77123)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1192691 (= res!793436 (= (select (arr!37211 _keys!1208) i!673) k!934))))

(declare-fun b!1192692 () Bool)

(declare-fun e!677913 () Bool)

(assert (=> b!1192692 (= e!677907 e!677913)))

(declare-fun res!793442 () Bool)

(assert (=> b!1192692 (=> (not res!793442) (not e!677913))))

(declare-fun lt!542314 () array!77123)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77123 (_ BitVec 32)) Bool)

(assert (=> b!1192692 (= res!793442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542314 mask!1564))))

(assert (=> b!1192692 (= lt!542314 (array!77124 (store (arr!37211 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37747 _keys!1208)))))

(declare-fun mapNonEmpty!47081 () Bool)

(declare-fun mapRes!47081 () Bool)

(declare-fun tp!89630 () Bool)

(declare-fun e!677912 () Bool)

(assert (=> mapNonEmpty!47081 (= mapRes!47081 (and tp!89630 e!677912))))

(declare-datatypes ((V!45353 0))(
  ( (V!45354 (val!15141 Int)) )
))
(declare-datatypes ((ValueCell!14375 0))(
  ( (ValueCellFull!14375 (v!17779 V!45353)) (EmptyCell!14375) )
))
(declare-fun mapRest!47081 () (Array (_ BitVec 32) ValueCell!14375))

(declare-fun mapValue!47081 () ValueCell!14375)

(declare-fun mapKey!47081 () (_ BitVec 32))

(declare-datatypes ((array!77125 0))(
  ( (array!77126 (arr!37212 (Array (_ BitVec 32) ValueCell!14375)) (size!37748 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77125)

(assert (=> mapNonEmpty!47081 (= (arr!37212 _values!996) (store mapRest!47081 mapKey!47081 mapValue!47081))))

(declare-fun b!1192693 () Bool)

(declare-fun res!793438 () Bool)

(assert (=> b!1192693 (=> (not res!793438) (not e!677913))))

(declare-datatypes ((List!26207 0))(
  ( (Nil!26204) (Cons!26203 (h!27412 (_ BitVec 64)) (t!38838 List!26207)) )
))
(declare-fun arrayNoDuplicates!0 (array!77123 (_ BitVec 32) List!26207) Bool)

(assert (=> b!1192693 (= res!793438 (arrayNoDuplicates!0 lt!542314 #b00000000000000000000000000000000 Nil!26204))))

(declare-fun b!1192694 () Bool)

(declare-fun res!793445 () Bool)

(assert (=> b!1192694 (=> (not res!793445) (not e!677907))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1192694 (= res!793445 (and (= (size!37748 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37747 _keys!1208) (size!37748 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!47081 () Bool)

(assert (=> mapIsEmpty!47081 mapRes!47081))

(declare-fun b!1192695 () Bool)

(declare-fun res!793444 () Bool)

(assert (=> b!1192695 (=> (not res!793444) (not e!677907))))

(assert (=> b!1192695 (= res!793444 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26204))))

(declare-fun b!1192696 () Bool)

(declare-fun e!677908 () Bool)

(declare-fun e!677909 () Bool)

(assert (=> b!1192696 (= e!677908 e!677909)))

(declare-fun res!793437 () Bool)

(assert (=> b!1192696 (=> res!793437 e!677909)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1192696 (= res!793437 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45353)

(declare-fun lt!542311 () array!77125)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19464 0))(
  ( (tuple2!19465 (_1!9743 (_ BitVec 64)) (_2!9743 V!45353)) )
))
(declare-datatypes ((List!26208 0))(
  ( (Nil!26205) (Cons!26204 (h!27413 tuple2!19464) (t!38839 List!26208)) )
))
(declare-datatypes ((ListLongMap!17433 0))(
  ( (ListLongMap!17434 (toList!8732 List!26208)) )
))
(declare-fun lt!542315 () ListLongMap!17433)

(declare-fun minValue!944 () V!45353)

(declare-fun getCurrentListMapNoExtraKeys!5173 (array!77123 array!77125 (_ BitVec 32) (_ BitVec 32) V!45353 V!45353 (_ BitVec 32) Int) ListLongMap!17433)

(assert (=> b!1192696 (= lt!542315 (getCurrentListMapNoExtraKeys!5173 lt!542314 lt!542311 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3104 (Int (_ BitVec 64)) V!45353)

(assert (=> b!1192696 (= lt!542311 (array!77126 (store (arr!37212 _values!996) i!673 (ValueCellFull!14375 (dynLambda!3104 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37748 _values!996)))))

(declare-fun lt!542312 () ListLongMap!17433)

(assert (=> b!1192696 (= lt!542312 (getCurrentListMapNoExtraKeys!5173 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!793440 () Bool)

(assert (=> start!100060 (=> (not res!793440) (not e!677907))))

(assert (=> start!100060 (= res!793440 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37747 _keys!1208))))))

(assert (=> start!100060 e!677907))

(declare-fun tp_is_empty!30169 () Bool)

(assert (=> start!100060 tp_is_empty!30169))

(declare-fun array_inv!28372 (array!77123) Bool)

(assert (=> start!100060 (array_inv!28372 _keys!1208)))

(assert (=> start!100060 true))

(assert (=> start!100060 tp!89631))

(declare-fun e!677911 () Bool)

(declare-fun array_inv!28373 (array!77125) Bool)

(assert (=> start!100060 (and (array_inv!28373 _values!996) e!677911)))

(declare-fun b!1192697 () Bool)

(assert (=> b!1192697 (= e!677912 tp_is_empty!30169)))

(declare-fun b!1192698 () Bool)

(declare-fun e!677914 () Bool)

(assert (=> b!1192698 (= e!677914 tp_is_empty!30169)))

(declare-fun b!1192699 () Bool)

(assert (=> b!1192699 (= e!677909 true)))

(declare-fun -!1757 (ListLongMap!17433 (_ BitVec 64)) ListLongMap!17433)

(assert (=> b!1192699 (= (getCurrentListMapNoExtraKeys!5173 lt!542314 lt!542311 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1757 (getCurrentListMapNoExtraKeys!5173 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39568 0))(
  ( (Unit!39569) )
))
(declare-fun lt!542313 () Unit!39568)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!966 (array!77123 array!77125 (_ BitVec 32) (_ BitVec 32) V!45353 V!45353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39568)

(assert (=> b!1192699 (= lt!542313 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!966 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1192700 () Bool)

(assert (=> b!1192700 (= e!677913 (not e!677908))))

(declare-fun res!793441 () Bool)

(assert (=> b!1192700 (=> res!793441 e!677908)))

(assert (=> b!1192700 (= res!793441 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1192700 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!542316 () Unit!39568)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77123 (_ BitVec 64) (_ BitVec 32)) Unit!39568)

(assert (=> b!1192700 (= lt!542316 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1192701 () Bool)

(assert (=> b!1192701 (= e!677911 (and e!677914 mapRes!47081))))

(declare-fun condMapEmpty!47081 () Bool)

(declare-fun mapDefault!47081 () ValueCell!14375)

