; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100076 () Bool)

(assert start!100076)

(declare-fun b_free!25655 () Bool)

(declare-fun b_next!25655 () Bool)

(assert (=> start!100076 (= b_free!25655 (not b_next!25655))))

(declare-fun tp!89679 () Bool)

(declare-fun b_and!42177 () Bool)

(assert (=> start!100076 (= tp!89679 b_and!42177)))

(declare-fun b!1193066 () Bool)

(declare-fun e!678101 () Bool)

(declare-fun e!678104 () Bool)

(assert (=> b!1193066 (= e!678101 e!678104)))

(declare-fun res!793729 () Bool)

(assert (=> b!1193066 (=> res!793729 e!678104)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193066 (= res!793729 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45373 0))(
  ( (V!45374 (val!15149 Int)) )
))
(declare-fun zeroValue!944 () V!45373)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19476 0))(
  ( (tuple2!19477 (_1!9749 (_ BitVec 64)) (_2!9749 V!45373)) )
))
(declare-datatypes ((List!26220 0))(
  ( (Nil!26217) (Cons!26216 (h!27425 tuple2!19476) (t!38867 List!26220)) )
))
(declare-datatypes ((ListLongMap!17445 0))(
  ( (ListLongMap!17446 (toList!8738 List!26220)) )
))
(declare-fun lt!542458 () ListLongMap!17445)

(declare-datatypes ((array!77153 0))(
  ( (array!77154 (arr!37226 (Array (_ BitVec 32) (_ BitVec 64))) (size!37762 (_ BitVec 32))) )
))
(declare-fun lt!542457 () array!77153)

(declare-fun minValue!944 () V!45373)

(declare-datatypes ((ValueCell!14383 0))(
  ( (ValueCellFull!14383 (v!17787 V!45373)) (EmptyCell!14383) )
))
(declare-datatypes ((array!77155 0))(
  ( (array!77156 (arr!37227 (Array (_ BitVec 32) ValueCell!14383)) (size!37763 (_ BitVec 32))) )
))
(declare-fun lt!542460 () array!77155)

(declare-fun getCurrentListMapNoExtraKeys!5179 (array!77153 array!77155 (_ BitVec 32) (_ BitVec 32) V!45373 V!45373 (_ BitVec 32) Int) ListLongMap!17445)

(assert (=> b!1193066 (= lt!542458 (getCurrentListMapNoExtraKeys!5179 lt!542457 lt!542460 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77155)

(declare-fun dynLambda!3109 (Int (_ BitVec 64)) V!45373)

(assert (=> b!1193066 (= lt!542460 (array!77156 (store (arr!37227 _values!996) i!673 (ValueCellFull!14383 (dynLambda!3109 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37763 _values!996)))))

(declare-fun _keys!1208 () array!77153)

(declare-fun lt!542456 () ListLongMap!17445)

(assert (=> b!1193066 (= lt!542456 (getCurrentListMapNoExtraKeys!5179 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1193067 () Bool)

(declare-fun res!793726 () Bool)

(declare-fun e!678102 () Bool)

(assert (=> b!1193067 (=> (not res!793726) (not e!678102))))

(declare-datatypes ((List!26221 0))(
  ( (Nil!26218) (Cons!26217 (h!27426 (_ BitVec 64)) (t!38868 List!26221)) )
))
(declare-fun arrayNoDuplicates!0 (array!77153 (_ BitVec 32) List!26221) Bool)

(assert (=> b!1193067 (= res!793726 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26218))))

(declare-fun b!1193068 () Bool)

(declare-fun e!678103 () Bool)

(assert (=> b!1193068 (= e!678102 e!678103)))

(declare-fun res!793724 () Bool)

(assert (=> b!1193068 (=> (not res!793724) (not e!678103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77153 (_ BitVec 32)) Bool)

(assert (=> b!1193068 (= res!793724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542457 mask!1564))))

(assert (=> b!1193068 (= lt!542457 (array!77154 (store (arr!37226 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37762 _keys!1208)))))

(declare-fun b!1193069 () Bool)

(declare-fun res!793725 () Bool)

(assert (=> b!1193069 (=> (not res!793725) (not e!678102))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1193069 (= res!793725 (= (select (arr!37226 _keys!1208) i!673) k!934))))

(declare-fun b!1193070 () Bool)

(declare-fun res!793734 () Bool)

(assert (=> b!1193070 (=> (not res!793734) (not e!678102))))

(assert (=> b!1193070 (= res!793734 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37762 _keys!1208))))))

(declare-fun b!1193071 () Bool)

(assert (=> b!1193071 (= e!678104 true)))

(declare-fun -!1763 (ListLongMap!17445 (_ BitVec 64)) ListLongMap!17445)

(assert (=> b!1193071 (= (getCurrentListMapNoExtraKeys!5179 lt!542457 lt!542460 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1763 (getCurrentListMapNoExtraKeys!5179 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39580 0))(
  ( (Unit!39581) )
))
(declare-fun lt!542455 () Unit!39580)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!972 (array!77153 array!77155 (_ BitVec 32) (_ BitVec 32) V!45373 V!45373 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39580)

(assert (=> b!1193071 (= lt!542455 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!972 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193072 () Bool)

(declare-fun res!793732 () Bool)

(assert (=> b!1193072 (=> (not res!793732) (not e!678102))))

(assert (=> b!1193072 (= res!793732 (and (= (size!37763 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37762 _keys!1208) (size!37763 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!793730 () Bool)

(assert (=> start!100076 (=> (not res!793730) (not e!678102))))

(assert (=> start!100076 (= res!793730 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37762 _keys!1208))))))

(assert (=> start!100076 e!678102))

(declare-fun tp_is_empty!30185 () Bool)

(assert (=> start!100076 tp_is_empty!30185))

(declare-fun array_inv!28382 (array!77153) Bool)

(assert (=> start!100076 (array_inv!28382 _keys!1208)))

(assert (=> start!100076 true))

(assert (=> start!100076 tp!89679))

(declare-fun e!678099 () Bool)

(declare-fun array_inv!28383 (array!77155) Bool)

(assert (=> start!100076 (and (array_inv!28383 _values!996) e!678099)))

(declare-fun b!1193073 () Bool)

(declare-fun res!793731 () Bool)

(assert (=> b!1193073 (=> (not res!793731) (not e!678102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193073 (= res!793731 (validKeyInArray!0 k!934))))

(declare-fun b!1193074 () Bool)

(declare-fun e!678106 () Bool)

(declare-fun mapRes!47105 () Bool)

(assert (=> b!1193074 (= e!678099 (and e!678106 mapRes!47105))))

(declare-fun condMapEmpty!47105 () Bool)

(declare-fun mapDefault!47105 () ValueCell!14383)

