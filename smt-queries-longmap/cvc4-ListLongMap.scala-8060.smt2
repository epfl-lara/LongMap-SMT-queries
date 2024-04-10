; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99204 () Bool)

(assert start!99204)

(declare-fun b_free!24809 () Bool)

(declare-fun b_next!24809 () Bool)

(assert (=> start!99204 (= b_free!24809 (not b_next!24809))))

(declare-fun tp!87138 () Bool)

(declare-fun b_and!40467 () Bool)

(assert (=> start!99204 (= tp!87138 b_and!40467)))

(declare-fun b!1168065 () Bool)

(declare-fun res!774946 () Bool)

(declare-fun e!663872 () Bool)

(assert (=> b!1168065 (=> (not res!774946) (not e!663872))))

(declare-datatypes ((array!75501 0))(
  ( (array!75502 (arr!36401 (Array (_ BitVec 32) (_ BitVec 64))) (size!36937 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75501)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1168065 (= res!774946 (= (select (arr!36401 _keys!1208) i!673) k!934))))

(declare-fun res!774943 () Bool)

(assert (=> start!99204 (=> (not res!774943) (not e!663872))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99204 (= res!774943 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36937 _keys!1208))))))

(assert (=> start!99204 e!663872))

(declare-fun tp_is_empty!29339 () Bool)

(assert (=> start!99204 tp_is_empty!29339))

(declare-fun array_inv!27826 (array!75501) Bool)

(assert (=> start!99204 (array_inv!27826 _keys!1208)))

(assert (=> start!99204 true))

(assert (=> start!99204 tp!87138))

(declare-datatypes ((V!44245 0))(
  ( (V!44246 (val!14726 Int)) )
))
(declare-datatypes ((ValueCell!13960 0))(
  ( (ValueCellFull!13960 (v!17363 V!44245)) (EmptyCell!13960) )
))
(declare-datatypes ((array!75503 0))(
  ( (array!75504 (arr!36402 (Array (_ BitVec 32) ValueCell!13960)) (size!36938 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75503)

(declare-fun e!663871 () Bool)

(declare-fun array_inv!27827 (array!75503) Bool)

(assert (=> start!99204 (and (array_inv!27827 _values!996) e!663871)))

(declare-fun b!1168066 () Bool)

(declare-fun e!663870 () Bool)

(declare-fun e!663869 () Bool)

(assert (=> b!1168066 (= e!663870 e!663869)))

(declare-fun res!774941 () Bool)

(assert (=> b!1168066 (=> res!774941 e!663869)))

(assert (=> b!1168066 (= res!774941 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44245)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!18790 0))(
  ( (tuple2!18791 (_1!9406 (_ BitVec 64)) (_2!9406 V!44245)) )
))
(declare-datatypes ((List!25530 0))(
  ( (Nil!25527) (Cons!25526 (h!26735 tuple2!18790) (t!37331 List!25530)) )
))
(declare-datatypes ((ListLongMap!16759 0))(
  ( (ListLongMap!16760 (toList!8395 List!25530)) )
))
(declare-fun lt!525879 () ListLongMap!16759)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!525875 () array!75501)

(declare-fun lt!525874 () array!75503)

(declare-fun minValue!944 () V!44245)

(declare-fun getCurrentListMapNoExtraKeys!4859 (array!75501 array!75503 (_ BitVec 32) (_ BitVec 32) V!44245 V!44245 (_ BitVec 32) Int) ListLongMap!16759)

(assert (=> b!1168066 (= lt!525879 (getCurrentListMapNoExtraKeys!4859 lt!525875 lt!525874 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2840 (Int (_ BitVec 64)) V!44245)

(assert (=> b!1168066 (= lt!525874 (array!75504 (store (arr!36402 _values!996) i!673 (ValueCellFull!13960 (dynLambda!2840 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36938 _values!996)))))

(declare-fun lt!525876 () ListLongMap!16759)

(assert (=> b!1168066 (= lt!525876 (getCurrentListMapNoExtraKeys!4859 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168067 () Bool)

(declare-fun res!774936 () Bool)

(assert (=> b!1168067 (=> (not res!774936) (not e!663872))))

(declare-datatypes ((List!25531 0))(
  ( (Nil!25528) (Cons!25527 (h!26736 (_ BitVec 64)) (t!37332 List!25531)) )
))
(declare-fun arrayNoDuplicates!0 (array!75501 (_ BitVec 32) List!25531) Bool)

(assert (=> b!1168067 (= res!774936 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25528))))

(declare-fun b!1168068 () Bool)

(declare-fun e!663866 () Bool)

(assert (=> b!1168068 (= e!663866 (not e!663870))))

(declare-fun res!774942 () Bool)

(assert (=> b!1168068 (=> res!774942 e!663870)))

(assert (=> b!1168068 (= res!774942 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168068 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38542 0))(
  ( (Unit!38543) )
))
(declare-fun lt!525878 () Unit!38542)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75501 (_ BitVec 64) (_ BitVec 32)) Unit!38542)

(assert (=> b!1168068 (= lt!525878 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1168069 () Bool)

(declare-fun e!663873 () Bool)

(assert (=> b!1168069 (= e!663873 tp_is_empty!29339)))

(declare-fun mapNonEmpty!45833 () Bool)

(declare-fun mapRes!45833 () Bool)

(declare-fun tp!87137 () Bool)

(assert (=> mapNonEmpty!45833 (= mapRes!45833 (and tp!87137 e!663873))))

(declare-fun mapValue!45833 () ValueCell!13960)

(declare-fun mapRest!45833 () (Array (_ BitVec 32) ValueCell!13960))

(declare-fun mapKey!45833 () (_ BitVec 32))

(assert (=> mapNonEmpty!45833 (= (arr!36402 _values!996) (store mapRest!45833 mapKey!45833 mapValue!45833))))

(declare-fun b!1168070 () Bool)

(declare-fun res!774945 () Bool)

(assert (=> b!1168070 (=> (not res!774945) (not e!663872))))

(assert (=> b!1168070 (= res!774945 (and (= (size!36938 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36937 _keys!1208) (size!36938 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168071 () Bool)

(declare-fun e!663868 () Bool)

(assert (=> b!1168071 (= e!663868 tp_is_empty!29339)))

(declare-fun b!1168072 () Bool)

(assert (=> b!1168072 (= e!663872 e!663866)))

(declare-fun res!774947 () Bool)

(assert (=> b!1168072 (=> (not res!774947) (not e!663866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75501 (_ BitVec 32)) Bool)

(assert (=> b!1168072 (= res!774947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525875 mask!1564))))

(assert (=> b!1168072 (= lt!525875 (array!75502 (store (arr!36401 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36937 _keys!1208)))))

(declare-fun b!1168073 () Bool)

(declare-fun res!774938 () Bool)

(assert (=> b!1168073 (=> (not res!774938) (not e!663872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168073 (= res!774938 (validMask!0 mask!1564))))

(declare-fun b!1168074 () Bool)

(declare-fun res!774939 () Bool)

(assert (=> b!1168074 (=> (not res!774939) (not e!663866))))

(assert (=> b!1168074 (= res!774939 (arrayNoDuplicates!0 lt!525875 #b00000000000000000000000000000000 Nil!25528))))

(declare-fun b!1168075 () Bool)

(declare-fun res!774944 () Bool)

(assert (=> b!1168075 (=> (not res!774944) (not e!663872))))

(assert (=> b!1168075 (= res!774944 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36937 _keys!1208))))))

(declare-fun b!1168076 () Bool)

(declare-fun res!774937 () Bool)

(assert (=> b!1168076 (=> (not res!774937) (not e!663872))))

(assert (=> b!1168076 (= res!774937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168077 () Bool)

(assert (=> b!1168077 (= e!663871 (and e!663868 mapRes!45833))))

(declare-fun condMapEmpty!45833 () Bool)

(declare-fun mapDefault!45833 () ValueCell!13960)

