; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99868 () Bool)

(assert start!99868)

(declare-fun b_free!25447 () Bool)

(declare-fun b_next!25447 () Bool)

(assert (=> start!99868 (= b_free!25447 (not b_next!25447))))

(declare-fun tp!89055 () Bool)

(declare-fun b_and!41761 () Bool)

(assert (=> start!99868 (= tp!89055 b_and!41761)))

(declare-fun mapNonEmpty!46793 () Bool)

(declare-fun mapRes!46793 () Bool)

(declare-fun tp!89054 () Bool)

(declare-fun e!675580 () Bool)

(assert (=> mapNonEmpty!46793 (= mapRes!46793 (and tp!89054 e!675580))))

(declare-fun mapKey!46793 () (_ BitVec 32))

(declare-datatypes ((V!45097 0))(
  ( (V!45098 (val!15045 Int)) )
))
(declare-datatypes ((ValueCell!14279 0))(
  ( (ValueCellFull!14279 (v!17683 V!45097)) (EmptyCell!14279) )
))
(declare-fun mapRest!46793 () (Array (_ BitVec 32) ValueCell!14279))

(declare-datatypes ((array!76749 0))(
  ( (array!76750 (arr!37024 (Array (_ BitVec 32) ValueCell!14279)) (size!37560 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76749)

(declare-fun mapValue!46793 () ValueCell!14279)

(assert (=> mapNonEmpty!46793 (= (arr!37024 _values!996) (store mapRest!46793 mapKey!46793 mapValue!46793))))

(declare-fun res!789959 () Bool)

(declare-fun e!675581 () Bool)

(assert (=> start!99868 (=> (not res!789959) (not e!675581))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76751 0))(
  ( (array!76752 (arr!37025 (Array (_ BitVec 32) (_ BitVec 64))) (size!37561 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76751)

(assert (=> start!99868 (= res!789959 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37561 _keys!1208))))))

(assert (=> start!99868 e!675581))

(declare-fun tp_is_empty!29977 () Bool)

(assert (=> start!99868 tp_is_empty!29977))

(declare-fun array_inv!28248 (array!76751) Bool)

(assert (=> start!99868 (array_inv!28248 _keys!1208)))

(assert (=> start!99868 true))

(assert (=> start!99868 tp!89055))

(declare-fun e!675582 () Bool)

(declare-fun array_inv!28249 (array!76749) Bool)

(assert (=> start!99868 (and (array_inv!28249 _values!996) e!675582)))

(declare-fun b!1188143 () Bool)

(declare-fun e!675585 () Bool)

(declare-fun e!675584 () Bool)

(assert (=> b!1188143 (= e!675585 e!675584)))

(declare-fun res!789970 () Bool)

(assert (=> b!1188143 (=> res!789970 e!675584)))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1188143 (= res!789970 (not (= (select (arr!37025 _keys!1208) from!1455) k!934)))))

(declare-fun b!1188144 () Bool)

(declare-fun e!675578 () Bool)

(declare-fun e!675583 () Bool)

(assert (=> b!1188144 (= e!675578 e!675583)))

(declare-fun res!789969 () Bool)

(assert (=> b!1188144 (=> res!789969 e!675583)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1188144 (= res!789969 (not (validKeyInArray!0 (select (arr!37025 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19320 0))(
  ( (tuple2!19321 (_1!9671 (_ BitVec 64)) (_2!9671 V!45097)) )
))
(declare-datatypes ((List!26060 0))(
  ( (Nil!26057) (Cons!26056 (h!27265 tuple2!19320) (t!38499 List!26060)) )
))
(declare-datatypes ((ListLongMap!17289 0))(
  ( (ListLongMap!17290 (toList!8660 List!26060)) )
))
(declare-fun lt!540492 () ListLongMap!17289)

(declare-fun lt!540503 () ListLongMap!17289)

(assert (=> b!1188144 (= lt!540492 lt!540503)))

(declare-fun lt!540510 () ListLongMap!17289)

(declare-fun -!1690 (ListLongMap!17289 (_ BitVec 64)) ListLongMap!17289)

(assert (=> b!1188144 (= lt!540503 (-!1690 lt!540510 k!934))))

(declare-fun zeroValue!944 () V!45097)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45097)

(declare-fun lt!540495 () array!76749)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!540501 () array!76751)

(declare-fun getCurrentListMapNoExtraKeys!5101 (array!76751 array!76749 (_ BitVec 32) (_ BitVec 32) V!45097 V!45097 (_ BitVec 32) Int) ListLongMap!17289)

(assert (=> b!1188144 (= lt!540492 (getCurrentListMapNoExtraKeys!5101 lt!540501 lt!540495 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1188144 (= lt!540510 (getCurrentListMapNoExtraKeys!5101 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39415 0))(
  ( (Unit!39416) )
))
(declare-fun lt!540493 () Unit!39415)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!899 (array!76751 array!76749 (_ BitVec 32) (_ BitVec 32) V!45097 V!45097 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39415)

(assert (=> b!1188144 (= lt!540493 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!899 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1188145 () Bool)

(declare-fun e!675576 () Bool)

(declare-fun e!675579 () Bool)

(assert (=> b!1188145 (= e!675576 (not e!675579))))

(declare-fun res!789965 () Bool)

(assert (=> b!1188145 (=> res!789965 e!675579)))

(assert (=> b!1188145 (= res!789965 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188145 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!540509 () Unit!39415)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76751 (_ BitVec 64) (_ BitVec 32)) Unit!39415)

(assert (=> b!1188145 (= lt!540509 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1188146 () Bool)

(declare-fun e!675575 () Unit!39415)

(declare-fun Unit!39417 () Unit!39415)

(assert (=> b!1188146 (= e!675575 Unit!39417)))

(declare-fun b!1188147 () Bool)

(declare-fun res!789968 () Bool)

(assert (=> b!1188147 (=> (not res!789968) (not e!675581))))

(assert (=> b!1188147 (= res!789968 (and (= (size!37560 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37561 _keys!1208) (size!37560 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188148 () Bool)

(declare-fun res!789972 () Bool)

(assert (=> b!1188148 (=> (not res!789972) (not e!675581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76751 (_ BitVec 32)) Bool)

(assert (=> b!1188148 (= res!789972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1188149 () Bool)

(declare-fun res!789973 () Bool)

(assert (=> b!1188149 (=> (not res!789973) (not e!675581))))

(declare-datatypes ((List!26061 0))(
  ( (Nil!26058) (Cons!26057 (h!27266 (_ BitVec 64)) (t!38500 List!26061)) )
))
(declare-fun arrayNoDuplicates!0 (array!76751 (_ BitVec 32) List!26061) Bool)

(assert (=> b!1188149 (= res!789973 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26058))))

(declare-fun b!1188150 () Bool)

(declare-fun res!789960 () Bool)

(assert (=> b!1188150 (=> (not res!789960) (not e!675581))))

(assert (=> b!1188150 (= res!789960 (= (select (arr!37025 _keys!1208) i!673) k!934))))

(declare-fun b!1188151 () Bool)

(declare-fun e!675586 () Bool)

(assert (=> b!1188151 (= e!675582 (and e!675586 mapRes!46793))))

(declare-fun condMapEmpty!46793 () Bool)

(declare-fun mapDefault!46793 () ValueCell!14279)

