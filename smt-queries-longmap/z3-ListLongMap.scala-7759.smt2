; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97292 () Bool)

(assert start!97292)

(declare-fun b_free!23269 () Bool)

(declare-fun b_next!23269 () Bool)

(assert (=> start!97292 (= b_free!23269 (not b_next!23269))))

(declare-fun tp!82105 () Bool)

(declare-fun b_and!37349 () Bool)

(assert (=> start!97292 (= tp!82105 b_and!37349)))

(declare-fun b!1107978 () Bool)

(declare-fun e!632093 () Bool)

(declare-fun e!632091 () Bool)

(declare-fun mapRes!43111 () Bool)

(assert (=> b!1107978 (= e!632093 (and e!632091 mapRes!43111))))

(declare-fun condMapEmpty!43111 () Bool)

(declare-datatypes ((V!41833 0))(
  ( (V!41834 (val!13821 Int)) )
))
(declare-datatypes ((ValueCell!13055 0))(
  ( (ValueCellFull!13055 (v!16453 V!41833)) (EmptyCell!13055) )
))
(declare-datatypes ((array!71876 0))(
  ( (array!71877 (arr!34591 (Array (_ BitVec 32) ValueCell!13055)) (size!35129 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71876)

(declare-fun mapDefault!43111 () ValueCell!13055)

(assert (=> b!1107978 (= condMapEmpty!43111 (= (arr!34591 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13055)) mapDefault!43111)))))

(declare-fun b!1107979 () Bool)

(declare-fun res!739437 () Bool)

(declare-fun e!632087 () Bool)

(assert (=> b!1107979 (=> (not res!739437) (not e!632087))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107979 (= res!739437 (validKeyInArray!0 k0!934))))

(declare-fun b!1107980 () Bool)

(declare-fun e!632088 () Bool)

(declare-fun tp_is_empty!27529 () Bool)

(assert (=> b!1107980 (= e!632088 tp_is_empty!27529)))

(declare-fun e!632090 () Bool)

(declare-fun b!1107981 () Bool)

(declare-datatypes ((tuple2!17516 0))(
  ( (tuple2!17517 (_1!8769 (_ BitVec 64)) (_2!8769 V!41833)) )
))
(declare-datatypes ((List!24173 0))(
  ( (Nil!24170) (Cons!24169 (h!25378 tuple2!17516) (t!34479 List!24173)) )
))
(declare-datatypes ((ListLongMap!15485 0))(
  ( (ListLongMap!15486 (toList!7758 List!24173)) )
))
(declare-fun call!46481 () ListLongMap!15485)

(declare-fun call!46480 () ListLongMap!15485)

(declare-fun -!980 (ListLongMap!15485 (_ BitVec 64)) ListLongMap!15485)

(assert (=> b!1107981 (= e!632090 (= call!46480 (-!980 call!46481 k0!934)))))

(declare-fun zeroValue!944 () V!41833)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71878 0))(
  ( (array!71879 (arr!34592 (Array (_ BitVec 32) (_ BitVec 64))) (size!35130 (_ BitVec 32))) )
))
(declare-fun lt!495547 () array!71878)

(declare-fun minValue!944 () V!41833)

(declare-fun bm!46477 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4275 (array!71878 array!71876 (_ BitVec 32) (_ BitVec 32) V!41833 V!41833 (_ BitVec 32) Int) ListLongMap!15485)

(declare-fun dynLambda!2342 (Int (_ BitVec 64)) V!41833)

(assert (=> bm!46477 (= call!46480 (getCurrentListMapNoExtraKeys!4275 lt!495547 (array!71877 (store (arr!34591 _values!996) i!673 (ValueCellFull!13055 (dynLambda!2342 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35129 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43111 () Bool)

(declare-fun tp!82106 () Bool)

(assert (=> mapNonEmpty!43111 (= mapRes!43111 (and tp!82106 e!632088))))

(declare-fun mapRest!43111 () (Array (_ BitVec 32) ValueCell!13055))

(declare-fun mapValue!43111 () ValueCell!13055)

(declare-fun mapKey!43111 () (_ BitVec 32))

(assert (=> mapNonEmpty!43111 (= (arr!34591 _values!996) (store mapRest!43111 mapKey!43111 mapValue!43111))))

(declare-fun b!1107982 () Bool)

(assert (=> b!1107982 (= e!632091 tp_is_empty!27529)))

(declare-fun b!1107984 () Bool)

(declare-fun res!739440 () Bool)

(assert (=> b!1107984 (=> (not res!739440) (not e!632087))))

(declare-fun _keys!1208 () array!71878)

(assert (=> b!1107984 (= res!739440 (= (select (arr!34592 _keys!1208) i!673) k0!934))))

(declare-fun b!1107985 () Bool)

(assert (=> b!1107985 (= e!632090 (= call!46480 call!46481))))

(declare-fun b!1107986 () Bool)

(declare-fun res!739439 () Bool)

(assert (=> b!1107986 (=> (not res!739439) (not e!632087))))

(assert (=> b!1107986 (= res!739439 (and (= (size!35129 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35130 _keys!1208) (size!35129 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107987 () Bool)

(declare-fun res!739434 () Bool)

(declare-fun e!632089 () Bool)

(assert (=> b!1107987 (=> (not res!739434) (not e!632089))))

(declare-datatypes ((List!24174 0))(
  ( (Nil!24171) (Cons!24170 (h!25379 (_ BitVec 64)) (t!34480 List!24174)) )
))
(declare-fun arrayNoDuplicates!0 (array!71878 (_ BitVec 32) List!24174) Bool)

(assert (=> b!1107987 (= res!739434 (arrayNoDuplicates!0 lt!495547 #b00000000000000000000000000000000 Nil!24171))))

(declare-fun bm!46478 () Bool)

(assert (=> bm!46478 (= call!46481 (getCurrentListMapNoExtraKeys!4275 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107988 () Bool)

(declare-fun e!632092 () Bool)

(assert (=> b!1107988 (= e!632089 (not e!632092))))

(declare-fun res!739435 () Bool)

(assert (=> b!1107988 (=> res!739435 e!632092)))

(assert (=> b!1107988 (= res!739435 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35130 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107988 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36177 0))(
  ( (Unit!36178) )
))
(declare-fun lt!495549 () Unit!36177)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71878 (_ BitVec 64) (_ BitVec 32)) Unit!36177)

(assert (=> b!1107988 (= lt!495549 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107989 () Bool)

(declare-fun res!739443 () Bool)

(assert (=> b!1107989 (=> (not res!739443) (not e!632087))))

(assert (=> b!1107989 (= res!739443 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35130 _keys!1208))))))

(declare-fun b!1107983 () Bool)

(assert (=> b!1107983 (= e!632087 e!632089)))

(declare-fun res!739436 () Bool)

(assert (=> b!1107983 (=> (not res!739436) (not e!632089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71878 (_ BitVec 32)) Bool)

(assert (=> b!1107983 (= res!739436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495547 mask!1564))))

(assert (=> b!1107983 (= lt!495547 (array!71879 (store (arr!34592 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35130 _keys!1208)))))

(declare-fun res!739441 () Bool)

(assert (=> start!97292 (=> (not res!739441) (not e!632087))))

(assert (=> start!97292 (= res!739441 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35130 _keys!1208))))))

(assert (=> start!97292 e!632087))

(assert (=> start!97292 tp_is_empty!27529))

(declare-fun array_inv!26674 (array!71878) Bool)

(assert (=> start!97292 (array_inv!26674 _keys!1208)))

(assert (=> start!97292 true))

(assert (=> start!97292 tp!82105))

(declare-fun array_inv!26675 (array!71876) Bool)

(assert (=> start!97292 (and (array_inv!26675 _values!996) e!632093)))

(declare-fun mapIsEmpty!43111 () Bool)

(assert (=> mapIsEmpty!43111 mapRes!43111))

(declare-fun b!1107990 () Bool)

(declare-fun res!739442 () Bool)

(assert (=> b!1107990 (=> (not res!739442) (not e!632087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107990 (= res!739442 (validMask!0 mask!1564))))

(declare-fun b!1107991 () Bool)

(declare-fun res!739444 () Bool)

(assert (=> b!1107991 (=> (not res!739444) (not e!632087))))

(assert (=> b!1107991 (= res!739444 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24171))))

(declare-fun b!1107992 () Bool)

(assert (=> b!1107992 (= e!632092 true)))

(assert (=> b!1107992 e!632090))

(declare-fun c!109062 () Bool)

(assert (=> b!1107992 (= c!109062 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495548 () Unit!36177)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!253 (array!71878 array!71876 (_ BitVec 32) (_ BitVec 32) V!41833 V!41833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36177)

(assert (=> b!1107992 (= lt!495548 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!253 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107993 () Bool)

(declare-fun res!739438 () Bool)

(assert (=> b!1107993 (=> (not res!739438) (not e!632087))))

(assert (=> b!1107993 (= res!739438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97292 res!739441) b!1107990))

(assert (= (and b!1107990 res!739442) b!1107986))

(assert (= (and b!1107986 res!739439) b!1107993))

(assert (= (and b!1107993 res!739438) b!1107991))

(assert (= (and b!1107991 res!739444) b!1107989))

(assert (= (and b!1107989 res!739443) b!1107979))

(assert (= (and b!1107979 res!739437) b!1107984))

(assert (= (and b!1107984 res!739440) b!1107983))

(assert (= (and b!1107983 res!739436) b!1107987))

(assert (= (and b!1107987 res!739434) b!1107988))

(assert (= (and b!1107988 (not res!739435)) b!1107992))

(assert (= (and b!1107992 c!109062) b!1107981))

(assert (= (and b!1107992 (not c!109062)) b!1107985))

(assert (= (or b!1107981 b!1107985) bm!46477))

(assert (= (or b!1107981 b!1107985) bm!46478))

(assert (= (and b!1107978 condMapEmpty!43111) mapIsEmpty!43111))

(assert (= (and b!1107978 (not condMapEmpty!43111)) mapNonEmpty!43111))

(get-info :version)

(assert (= (and mapNonEmpty!43111 ((_ is ValueCellFull!13055) mapValue!43111)) b!1107980))

(assert (= (and b!1107978 ((_ is ValueCellFull!13055) mapDefault!43111)) b!1107982))

(assert (= start!97292 b!1107978))

(declare-fun b_lambda!18271 () Bool)

(assert (=> (not b_lambda!18271) (not bm!46477)))

(declare-fun t!34478 () Bool)

(declare-fun tb!8127 () Bool)

(assert (=> (and start!97292 (= defaultEntry!1004 defaultEntry!1004) t!34478) tb!8127))

(declare-fun result!16823 () Bool)

(assert (=> tb!8127 (= result!16823 tp_is_empty!27529)))

(assert (=> bm!46477 t!34478))

(declare-fun b_and!37351 () Bool)

(assert (= b_and!37349 (and (=> t!34478 result!16823) b_and!37351)))

(declare-fun m!1026087 () Bool)

(assert (=> bm!46477 m!1026087))

(declare-fun m!1026089 () Bool)

(assert (=> bm!46477 m!1026089))

(declare-fun m!1026091 () Bool)

(assert (=> bm!46477 m!1026091))

(declare-fun m!1026093 () Bool)

(assert (=> b!1107979 m!1026093))

(declare-fun m!1026095 () Bool)

(assert (=> b!1107993 m!1026095))

(declare-fun m!1026097 () Bool)

(assert (=> bm!46478 m!1026097))

(declare-fun m!1026099 () Bool)

(assert (=> b!1107990 m!1026099))

(declare-fun m!1026101 () Bool)

(assert (=> mapNonEmpty!43111 m!1026101))

(declare-fun m!1026103 () Bool)

(assert (=> start!97292 m!1026103))

(declare-fun m!1026105 () Bool)

(assert (=> start!97292 m!1026105))

(declare-fun m!1026107 () Bool)

(assert (=> b!1107991 m!1026107))

(declare-fun m!1026109 () Bool)

(assert (=> b!1107984 m!1026109))

(declare-fun m!1026111 () Bool)

(assert (=> b!1107987 m!1026111))

(declare-fun m!1026113 () Bool)

(assert (=> b!1107992 m!1026113))

(declare-fun m!1026115 () Bool)

(assert (=> b!1107983 m!1026115))

(declare-fun m!1026117 () Bool)

(assert (=> b!1107983 m!1026117))

(declare-fun m!1026119 () Bool)

(assert (=> b!1107981 m!1026119))

(declare-fun m!1026121 () Bool)

(assert (=> b!1107988 m!1026121))

(declare-fun m!1026123 () Bool)

(assert (=> b!1107988 m!1026123))

(check-sat (not b!1107983) (not b!1107993) (not b!1107979) (not mapNonEmpty!43111) (not b_next!23269) (not b!1107992) (not b!1107987) (not bm!46477) (not b!1107990) (not b!1107991) tp_is_empty!27529 (not b!1107981) (not b!1107988) (not bm!46478) (not start!97292) (not b_lambda!18271) b_and!37351)
(check-sat b_and!37351 (not b_next!23269))
