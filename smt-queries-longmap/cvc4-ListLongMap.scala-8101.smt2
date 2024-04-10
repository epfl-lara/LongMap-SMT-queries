; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99476 () Bool)

(assert start!99476)

(declare-fun b_free!25055 () Bool)

(declare-fun b_next!25055 () Bool)

(assert (=> start!99476 (= b_free!25055 (not b_next!25055))))

(declare-fun tp!87879 () Bool)

(declare-fun b_and!40977 () Bool)

(assert (=> start!99476 (= tp!87879 b_and!40977)))

(declare-fun b!1175649 () Bool)

(declare-fun e!668269 () Bool)

(declare-fun e!668278 () Bool)

(assert (=> b!1175649 (= e!668269 e!668278)))

(declare-fun res!780799 () Bool)

(assert (=> b!1175649 (=> res!780799 e!668278)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1175649 (= res!780799 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44573 0))(
  ( (V!44574 (val!14849 Int)) )
))
(declare-fun zeroValue!944 () V!44573)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14083 0))(
  ( (ValueCellFull!14083 (v!17487 V!44573)) (EmptyCell!14083) )
))
(declare-datatypes ((array!75977 0))(
  ( (array!75978 (arr!36638 (Array (_ BitVec 32) ValueCell!14083)) (size!37174 (_ BitVec 32))) )
))
(declare-fun lt!530431 () array!75977)

(declare-datatypes ((tuple2!18986 0))(
  ( (tuple2!18987 (_1!9504 (_ BitVec 64)) (_2!9504 V!44573)) )
))
(declare-datatypes ((List!25725 0))(
  ( (Nil!25722) (Cons!25721 (h!26930 tuple2!18986) (t!37772 List!25725)) )
))
(declare-datatypes ((ListLongMap!16955 0))(
  ( (ListLongMap!16956 (toList!8493 List!25725)) )
))
(declare-fun lt!530429 () ListLongMap!16955)

(declare-datatypes ((array!75979 0))(
  ( (array!75980 (arr!36639 (Array (_ BitVec 32) (_ BitVec 64))) (size!37175 (_ BitVec 32))) )
))
(declare-fun lt!530433 () array!75979)

(declare-fun minValue!944 () V!44573)

(declare-fun getCurrentListMapNoExtraKeys!4953 (array!75979 array!75977 (_ BitVec 32) (_ BitVec 32) V!44573 V!44573 (_ BitVec 32) Int) ListLongMap!16955)

(assert (=> b!1175649 (= lt!530429 (getCurrentListMapNoExtraKeys!4953 lt!530433 lt!530431 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!530432 () V!44573)

(declare-fun _values!996 () array!75977)

(assert (=> b!1175649 (= lt!530431 (array!75978 (store (arr!36638 _values!996) i!673 (ValueCellFull!14083 lt!530432)) (size!37174 _values!996)))))

(declare-fun dynLambda!2919 (Int (_ BitVec 64)) V!44573)

(assert (=> b!1175649 (= lt!530432 (dynLambda!2919 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!75979)

(declare-fun lt!530423 () ListLongMap!16955)

(assert (=> b!1175649 (= lt!530423 (getCurrentListMapNoExtraKeys!4953 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1175650 () Bool)

(declare-fun res!780802 () Bool)

(declare-fun e!668273 () Bool)

(assert (=> b!1175650 (=> (not res!780802) (not e!668273))))

(declare-datatypes ((List!25726 0))(
  ( (Nil!25723) (Cons!25722 (h!26931 (_ BitVec 64)) (t!37773 List!25726)) )
))
(declare-fun arrayNoDuplicates!0 (array!75979 (_ BitVec 32) List!25726) Bool)

(assert (=> b!1175650 (= res!780802 (arrayNoDuplicates!0 lt!530433 #b00000000000000000000000000000000 Nil!25723))))

(declare-fun b!1175651 () Bool)

(declare-fun e!668276 () Bool)

(declare-fun tp_is_empty!29585 () Bool)

(assert (=> b!1175651 (= e!668276 tp_is_empty!29585)))

(declare-fun b!1175652 () Bool)

(declare-fun e!668275 () Bool)

(assert (=> b!1175652 (= e!668275 e!668273)))

(declare-fun res!780809 () Bool)

(assert (=> b!1175652 (=> (not res!780809) (not e!668273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75979 (_ BitVec 32)) Bool)

(assert (=> b!1175652 (= res!780809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530433 mask!1564))))

(assert (=> b!1175652 (= lt!530433 (array!75980 (store (arr!36639 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37175 _keys!1208)))))

(declare-fun b!1175653 () Bool)

(declare-fun res!780801 () Bool)

(assert (=> b!1175653 (=> (not res!780801) (not e!668275))))

(assert (=> b!1175653 (= res!780801 (and (= (size!37174 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37175 _keys!1208) (size!37174 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175654 () Bool)

(declare-fun res!780811 () Bool)

(assert (=> b!1175654 (=> (not res!780811) (not e!668275))))

(assert (=> b!1175654 (= res!780811 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25723))))

(declare-fun b!1175655 () Bool)

(declare-fun e!668274 () Bool)

(assert (=> b!1175655 (= e!668274 true)))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1175655 (not (= (select (arr!36639 _keys!1208) from!1455) k!934))))

(declare-datatypes ((Unit!38797 0))(
  ( (Unit!38798) )
))
(declare-fun lt!530436 () Unit!38797)

(declare-fun e!668271 () Unit!38797)

(assert (=> b!1175655 (= lt!530436 e!668271)))

(declare-fun c!116706 () Bool)

(assert (=> b!1175655 (= c!116706 (= (select (arr!36639 _keys!1208) from!1455) k!934))))

(declare-fun e!668277 () Bool)

(assert (=> b!1175655 e!668277))

(declare-fun res!780800 () Bool)

(assert (=> b!1175655 (=> (not res!780800) (not e!668277))))

(declare-fun lt!530426 () ListLongMap!16955)

(declare-fun +!3809 (ListLongMap!16955 tuple2!18986) ListLongMap!16955)

(declare-fun get!18707 (ValueCell!14083 V!44573) V!44573)

(assert (=> b!1175655 (= res!780800 (= lt!530429 (+!3809 lt!530426 (tuple2!18987 (select (arr!36639 _keys!1208) from!1455) (get!18707 (select (arr!36638 _values!996) from!1455) lt!530432)))))))

(declare-fun b!1175656 () Bool)

(declare-fun Unit!38799 () Unit!38797)

(assert (=> b!1175656 (= e!668271 Unit!38799)))

(declare-fun b!1175657 () Bool)

(declare-fun res!780807 () Bool)

(assert (=> b!1175657 (=> (not res!780807) (not e!668275))))

(assert (=> b!1175657 (= res!780807 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37175 _keys!1208))))))

(declare-fun b!1175658 () Bool)

(declare-fun res!780808 () Bool)

(assert (=> b!1175658 (=> (not res!780808) (not e!668275))))

(assert (=> b!1175658 (= res!780808 (= (select (arr!36639 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!46205 () Bool)

(declare-fun mapRes!46205 () Bool)

(assert (=> mapIsEmpty!46205 mapRes!46205))

(declare-fun b!1175659 () Bool)

(declare-fun e!668270 () Bool)

(assert (=> b!1175659 (= e!668270 tp_is_empty!29585)))

(declare-fun b!1175660 () Bool)

(declare-fun Unit!38800 () Unit!38797)

(assert (=> b!1175660 (= e!668271 Unit!38800)))

(declare-fun lt!530434 () Unit!38797)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75979 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38797)

(assert (=> b!1175660 (= lt!530434 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175660 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530425 () Unit!38797)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75979 (_ BitVec 32) (_ BitVec 32)) Unit!38797)

(assert (=> b!1175660 (= lt!530425 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1175660 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25723)))

(declare-fun lt!530428 () Unit!38797)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75979 (_ BitVec 64) (_ BitVec 32) List!25726) Unit!38797)

(assert (=> b!1175660 (= lt!530428 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25723))))

(assert (=> b!1175660 false))

(declare-fun b!1175661 () Bool)

(declare-fun res!780806 () Bool)

(assert (=> b!1175661 (=> (not res!780806) (not e!668275))))

(assert (=> b!1175661 (= res!780806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!780797 () Bool)

(assert (=> start!99476 (=> (not res!780797) (not e!668275))))

(assert (=> start!99476 (= res!780797 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37175 _keys!1208))))))

(assert (=> start!99476 e!668275))

(assert (=> start!99476 tp_is_empty!29585))

(declare-fun array_inv!27984 (array!75979) Bool)

(assert (=> start!99476 (array_inv!27984 _keys!1208)))

(assert (=> start!99476 true))

(assert (=> start!99476 tp!87879))

(declare-fun e!668272 () Bool)

(declare-fun array_inv!27985 (array!75977) Bool)

(assert (=> start!99476 (and (array_inv!27985 _values!996) e!668272)))

(declare-fun mapNonEmpty!46205 () Bool)

(declare-fun tp!87878 () Bool)

(assert (=> mapNonEmpty!46205 (= mapRes!46205 (and tp!87878 e!668270))))

(declare-fun mapKey!46205 () (_ BitVec 32))

(declare-fun mapValue!46205 () ValueCell!14083)

(declare-fun mapRest!46205 () (Array (_ BitVec 32) ValueCell!14083))

(assert (=> mapNonEmpty!46205 (= (arr!36638 _values!996) (store mapRest!46205 mapKey!46205 mapValue!46205))))

(declare-fun b!1175662 () Bool)

(declare-fun res!780803 () Bool)

(assert (=> b!1175662 (=> (not res!780803) (not e!668275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175662 (= res!780803 (validMask!0 mask!1564))))

(declare-fun b!1175663 () Bool)

(assert (=> b!1175663 (= e!668273 (not e!668269))))

(declare-fun res!780804 () Bool)

(assert (=> b!1175663 (=> res!780804 e!668269)))

(assert (=> b!1175663 (= res!780804 (bvsgt from!1455 i!673))))

(assert (=> b!1175663 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!530424 () Unit!38797)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75979 (_ BitVec 64) (_ BitVec 32)) Unit!38797)

(assert (=> b!1175663 (= lt!530424 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1175664 () Bool)

(declare-fun res!780805 () Bool)

(assert (=> b!1175664 (=> (not res!780805) (not e!668275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175664 (= res!780805 (validKeyInArray!0 k!934))))

(declare-fun b!1175665 () Bool)

(declare-fun e!668268 () Bool)

(assert (=> b!1175665 (= e!668277 e!668268)))

(declare-fun res!780798 () Bool)

(assert (=> b!1175665 (=> res!780798 e!668268)))

(assert (=> b!1175665 (= res!780798 (not (= (select (arr!36639 _keys!1208) from!1455) k!934)))))

(declare-fun b!1175666 () Bool)

(assert (=> b!1175666 (= e!668272 (and e!668276 mapRes!46205))))

(declare-fun condMapEmpty!46205 () Bool)

(declare-fun mapDefault!46205 () ValueCell!14083)

