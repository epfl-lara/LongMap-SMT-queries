; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99212 () Bool)

(assert start!99212)

(declare-fun b_free!24817 () Bool)

(declare-fun b_next!24817 () Bool)

(assert (=> start!99212 (= b_free!24817 (not b_next!24817))))

(declare-fun tp!87161 () Bool)

(declare-fun b_and!40483 () Bool)

(assert (=> start!99212 (= tp!87161 b_and!40483)))

(declare-fun b!1168255 () Bool)

(declare-fun e!663970 () Bool)

(declare-fun e!663965 () Bool)

(assert (=> b!1168255 (= e!663970 e!663965)))

(declare-fun res!775092 () Bool)

(assert (=> b!1168255 (=> res!775092 e!663965)))

(declare-datatypes ((array!75515 0))(
  ( (array!75516 (arr!36408 (Array (_ BitVec 32) (_ BitVec 64))) (size!36944 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75515)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168255 (= res!775092 (not (validKeyInArray!0 (select (arr!36408 _keys!1208) from!1455))))))

(declare-datatypes ((V!44257 0))(
  ( (V!44258 (val!14730 Int)) )
))
(declare-fun zeroValue!944 () V!44257)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13964 0))(
  ( (ValueCellFull!13964 (v!17367 V!44257)) (EmptyCell!13964) )
))
(declare-datatypes ((array!75517 0))(
  ( (array!75518 (arr!36409 (Array (_ BitVec 32) ValueCell!13964)) (size!36945 (_ BitVec 32))) )
))
(declare-fun lt!525949 () array!75517)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun _values!996 () array!75517)

(declare-fun minValue!944 () V!44257)

(declare-fun lt!525948 () array!75515)

(declare-datatypes ((tuple2!18796 0))(
  ( (tuple2!18797 (_1!9409 (_ BitVec 64)) (_2!9409 V!44257)) )
))
(declare-datatypes ((List!25536 0))(
  ( (Nil!25533) (Cons!25532 (h!26741 tuple2!18796) (t!37345 List!25536)) )
))
(declare-datatypes ((ListLongMap!16765 0))(
  ( (ListLongMap!16766 (toList!8398 List!25536)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4862 (array!75515 array!75517 (_ BitVec 32) (_ BitVec 32) V!44257 V!44257 (_ BitVec 32) Int) ListLongMap!16765)

(declare-fun -!1471 (ListLongMap!16765 (_ BitVec 64)) ListLongMap!16765)

(assert (=> b!1168255 (= (getCurrentListMapNoExtraKeys!4862 lt!525948 lt!525949 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1471 (getCurrentListMapNoExtraKeys!4862 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!38548 0))(
  ( (Unit!38549) )
))
(declare-fun lt!525951 () Unit!38548)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!698 (array!75515 array!75517 (_ BitVec 32) (_ BitVec 32) V!44257 V!44257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38548)

(assert (=> b!1168255 (= lt!525951 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!698 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168256 () Bool)

(declare-fun e!663967 () Bool)

(declare-fun e!663964 () Bool)

(assert (=> b!1168256 (= e!663967 e!663964)))

(declare-fun res!775089 () Bool)

(assert (=> b!1168256 (=> (not res!775089) (not e!663964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75515 (_ BitVec 32)) Bool)

(assert (=> b!1168256 (= res!775089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525948 mask!1564))))

(assert (=> b!1168256 (= lt!525948 (array!75516 (store (arr!36408 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36944 _keys!1208)))))

(declare-fun b!1168257 () Bool)

(declare-fun res!775083 () Bool)

(assert (=> b!1168257 (=> (not res!775083) (not e!663967))))

(assert (=> b!1168257 (= res!775083 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36944 _keys!1208))))))

(declare-fun b!1168258 () Bool)

(declare-fun e!663972 () Bool)

(declare-fun tp_is_empty!29347 () Bool)

(assert (=> b!1168258 (= e!663972 tp_is_empty!29347)))

(declare-fun b!1168259 () Bool)

(declare-fun res!775094 () Bool)

(assert (=> b!1168259 (=> (not res!775094) (not e!663964))))

(declare-datatypes ((List!25537 0))(
  ( (Nil!25534) (Cons!25533 (h!26742 (_ BitVec 64)) (t!37346 List!25537)) )
))
(declare-fun arrayNoDuplicates!0 (array!75515 (_ BitVec 32) List!25537) Bool)

(assert (=> b!1168259 (= res!775094 (arrayNoDuplicates!0 lt!525948 #b00000000000000000000000000000000 Nil!25534))))

(declare-fun mapNonEmpty!45845 () Bool)

(declare-fun mapRes!45845 () Bool)

(declare-fun tp!87162 () Bool)

(assert (=> mapNonEmpty!45845 (= mapRes!45845 (and tp!87162 e!663972))))

(declare-fun mapRest!45845 () (Array (_ BitVec 32) ValueCell!13964))

(declare-fun mapValue!45845 () ValueCell!13964)

(declare-fun mapKey!45845 () (_ BitVec 32))

(assert (=> mapNonEmpty!45845 (= (arr!36409 _values!996) (store mapRest!45845 mapKey!45845 mapValue!45845))))

(declare-fun b!1168260 () Bool)

(declare-fun e!663968 () Bool)

(assert (=> b!1168260 (= e!663968 e!663970)))

(declare-fun res!775082 () Bool)

(assert (=> b!1168260 (=> res!775082 e!663970)))

(assert (=> b!1168260 (= res!775082 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!525947 () ListLongMap!16765)

(assert (=> b!1168260 (= lt!525947 (getCurrentListMapNoExtraKeys!4862 lt!525948 lt!525949 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2843 (Int (_ BitVec 64)) V!44257)

(assert (=> b!1168260 (= lt!525949 (array!75518 (store (arr!36409 _values!996) i!673 (ValueCellFull!13964 (dynLambda!2843 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36945 _values!996)))))

(declare-fun lt!525946 () ListLongMap!16765)

(assert (=> b!1168260 (= lt!525946 (getCurrentListMapNoExtraKeys!4862 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168261 () Bool)

(declare-fun res!775091 () Bool)

(assert (=> b!1168261 (=> (not res!775091) (not e!663967))))

(assert (=> b!1168261 (= res!775091 (= (select (arr!36408 _keys!1208) i!673) k!934))))

(declare-fun b!1168262 () Bool)

(declare-fun e!663966 () Bool)

(assert (=> b!1168262 (= e!663966 tp_is_empty!29347)))

(declare-fun b!1168263 () Bool)

(declare-fun res!775093 () Bool)

(assert (=> b!1168263 (=> (not res!775093) (not e!663967))))

(assert (=> b!1168263 (= res!775093 (and (= (size!36945 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36944 _keys!1208) (size!36945 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168264 () Bool)

(declare-fun e!663969 () Bool)

(assert (=> b!1168264 (= e!663969 (and e!663966 mapRes!45845))))

(declare-fun condMapEmpty!45845 () Bool)

(declare-fun mapDefault!45845 () ValueCell!13964)

