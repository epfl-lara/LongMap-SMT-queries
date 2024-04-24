; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97618 () Bool)

(assert start!97618)

(declare-fun b_free!23353 () Bool)

(declare-fun b_next!23353 () Bool)

(assert (=> start!97618 (= b_free!23353 (not b_next!23353))))

(declare-fun tp!82357 () Bool)

(declare-fun b_and!37549 () Bool)

(assert (=> start!97618 (= tp!82357 b_and!37549)))

(declare-fun b!1111534 () Bool)

(declare-fun res!741414 () Bool)

(declare-fun e!634038 () Bool)

(assert (=> b!1111534 (=> (not res!741414) (not e!634038))))

(declare-datatypes ((array!72177 0))(
  ( (array!72178 (arr!34735 (Array (_ BitVec 32) (_ BitVec 64))) (size!35272 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72177)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72177 (_ BitVec 32)) Bool)

(assert (=> b!1111534 (= res!741414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!741415 () Bool)

(assert (=> start!97618 (=> (not res!741415) (not e!634038))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97618 (= res!741415 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35272 _keys!1208))))))

(assert (=> start!97618 e!634038))

(declare-fun tp_is_empty!27613 () Bool)

(assert (=> start!97618 tp_is_empty!27613))

(declare-fun array_inv!26764 (array!72177) Bool)

(assert (=> start!97618 (array_inv!26764 _keys!1208)))

(assert (=> start!97618 true))

(assert (=> start!97618 tp!82357))

(declare-datatypes ((V!41945 0))(
  ( (V!41946 (val!13863 Int)) )
))
(declare-datatypes ((ValueCell!13097 0))(
  ( (ValueCellFull!13097 (v!16492 V!41945)) (EmptyCell!13097) )
))
(declare-datatypes ((array!72179 0))(
  ( (array!72180 (arr!34736 (Array (_ BitVec 32) ValueCell!13097)) (size!35273 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72179)

(declare-fun e!634034 () Bool)

(declare-fun array_inv!26765 (array!72179) Bool)

(assert (=> start!97618 (and (array_inv!26765 _values!996) e!634034)))

(declare-fun b!1111535 () Bool)

(declare-fun res!741418 () Bool)

(assert (=> b!1111535 (=> (not res!741418) (not e!634038))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1111535 (= res!741418 (and (= (size!35273 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35272 _keys!1208) (size!35273 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1111536 () Bool)

(declare-fun e!634032 () Bool)

(assert (=> b!1111536 (= e!634032 tp_is_empty!27613)))

(declare-fun b!1111537 () Bool)

(declare-fun res!741421 () Bool)

(assert (=> b!1111537 (=> (not res!741421) (not e!634038))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1111537 (= res!741421 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35272 _keys!1208))))))

(declare-fun b!1111538 () Bool)

(declare-fun res!741413 () Bool)

(declare-fun e!634037 () Bool)

(assert (=> b!1111538 (=> (not res!741413) (not e!634037))))

(declare-fun lt!496642 () array!72177)

(declare-datatypes ((List!24229 0))(
  ( (Nil!24226) (Cons!24225 (h!25443 (_ BitVec 64)) (t!34620 List!24229)) )
))
(declare-fun arrayNoDuplicates!0 (array!72177 (_ BitVec 32) List!24229) Bool)

(assert (=> b!1111538 (= res!741413 (arrayNoDuplicates!0 lt!496642 #b00000000000000000000000000000000 Nil!24226))))

(declare-fun b!1111539 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((tuple2!17546 0))(
  ( (tuple2!17547 (_1!8784 (_ BitVec 64)) (_2!8784 V!41945)) )
))
(declare-datatypes ((List!24230 0))(
  ( (Nil!24227) (Cons!24226 (h!25444 tuple2!17546) (t!34621 List!24230)) )
))
(declare-datatypes ((ListLongMap!15523 0))(
  ( (ListLongMap!15524 (toList!7777 List!24230)) )
))
(declare-fun call!46822 () ListLongMap!15523)

(declare-fun call!46823 () ListLongMap!15523)

(declare-fun e!634033 () Bool)

(declare-fun -!1031 (ListLongMap!15523 (_ BitVec 64)) ListLongMap!15523)

(assert (=> b!1111539 (= e!634033 (= call!46822 (-!1031 call!46823 k0!934)))))

(declare-fun mapNonEmpty!43237 () Bool)

(declare-fun mapRes!43237 () Bool)

(declare-fun tp!82358 () Bool)

(assert (=> mapNonEmpty!43237 (= mapRes!43237 (and tp!82358 e!634032))))

(declare-fun mapKey!43237 () (_ BitVec 32))

(declare-fun mapRest!43237 () (Array (_ BitVec 32) ValueCell!13097))

(declare-fun mapValue!43237 () ValueCell!13097)

(assert (=> mapNonEmpty!43237 (= (arr!34736 _values!996) (store mapRest!43237 mapKey!43237 mapValue!43237))))

(declare-fun b!1111540 () Bool)

(assert (=> b!1111540 (= e!634033 (= call!46822 call!46823))))

(declare-fun b!1111541 () Bool)

(declare-fun e!634035 () Bool)

(assert (=> b!1111541 (= e!634035 tp_is_empty!27613)))

(declare-fun b!1111542 () Bool)

(declare-fun e!634031 () Bool)

(assert (=> b!1111542 (= e!634031 true)))

(assert (=> b!1111542 e!634033))

(declare-fun c!109625 () Bool)

(assert (=> b!1111542 (= c!109625 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41945)

(declare-datatypes ((Unit!36411 0))(
  ( (Unit!36412) )
))
(declare-fun lt!496641 () Unit!36411)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41945)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!299 (array!72177 array!72179 (_ BitVec 32) (_ BitVec 32) V!41945 V!41945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36411)

(assert (=> b!1111542 (= lt!496641 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!299 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111543 () Bool)

(declare-fun res!741417 () Bool)

(assert (=> b!1111543 (=> (not res!741417) (not e!634038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111543 (= res!741417 (validKeyInArray!0 k0!934))))

(declare-fun b!1111544 () Bool)

(assert (=> b!1111544 (= e!634034 (and e!634035 mapRes!43237))))

(declare-fun condMapEmpty!43237 () Bool)

(declare-fun mapDefault!43237 () ValueCell!13097)

(assert (=> b!1111544 (= condMapEmpty!43237 (= (arr!34736 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13097)) mapDefault!43237)))))

(declare-fun bm!46819 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4310 (array!72177 array!72179 (_ BitVec 32) (_ BitVec 32) V!41945 V!41945 (_ BitVec 32) Int) ListLongMap!15523)

(assert (=> bm!46819 (= call!46823 (getCurrentListMapNoExtraKeys!4310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43237 () Bool)

(assert (=> mapIsEmpty!43237 mapRes!43237))

(declare-fun b!1111545 () Bool)

(assert (=> b!1111545 (= e!634037 (not e!634031))))

(declare-fun res!741420 () Bool)

(assert (=> b!1111545 (=> res!741420 e!634031)))

(assert (=> b!1111545 (= res!741420 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35272 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111545 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496640 () Unit!36411)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72177 (_ BitVec 64) (_ BitVec 32)) Unit!36411)

(assert (=> b!1111545 (= lt!496640 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1111546 () Bool)

(declare-fun res!741412 () Bool)

(assert (=> b!1111546 (=> (not res!741412) (not e!634038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111546 (= res!741412 (validMask!0 mask!1564))))

(declare-fun b!1111547 () Bool)

(declare-fun res!741419 () Bool)

(assert (=> b!1111547 (=> (not res!741419) (not e!634038))))

(assert (=> b!1111547 (= res!741419 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24226))))

(declare-fun b!1111548 () Bool)

(assert (=> b!1111548 (= e!634038 e!634037)))

(declare-fun res!741416 () Bool)

(assert (=> b!1111548 (=> (not res!741416) (not e!634037))))

(assert (=> b!1111548 (= res!741416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496642 mask!1564))))

(assert (=> b!1111548 (= lt!496642 (array!72178 (store (arr!34735 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35272 _keys!1208)))))

(declare-fun bm!46820 () Bool)

(declare-fun dynLambda!2422 (Int (_ BitVec 64)) V!41945)

(assert (=> bm!46820 (= call!46822 (getCurrentListMapNoExtraKeys!4310 lt!496642 (array!72180 (store (arr!34736 _values!996) i!673 (ValueCellFull!13097 (dynLambda!2422 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35273 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111549 () Bool)

(declare-fun res!741411 () Bool)

(assert (=> b!1111549 (=> (not res!741411) (not e!634038))))

(assert (=> b!1111549 (= res!741411 (= (select (arr!34735 _keys!1208) i!673) k0!934))))

(assert (= (and start!97618 res!741415) b!1111546))

(assert (= (and b!1111546 res!741412) b!1111535))

(assert (= (and b!1111535 res!741418) b!1111534))

(assert (= (and b!1111534 res!741414) b!1111547))

(assert (= (and b!1111547 res!741419) b!1111537))

(assert (= (and b!1111537 res!741421) b!1111543))

(assert (= (and b!1111543 res!741417) b!1111549))

(assert (= (and b!1111549 res!741411) b!1111548))

(assert (= (and b!1111548 res!741416) b!1111538))

(assert (= (and b!1111538 res!741413) b!1111545))

(assert (= (and b!1111545 (not res!741420)) b!1111542))

(assert (= (and b!1111542 c!109625) b!1111539))

(assert (= (and b!1111542 (not c!109625)) b!1111540))

(assert (= (or b!1111539 b!1111540) bm!46820))

(assert (= (or b!1111539 b!1111540) bm!46819))

(assert (= (and b!1111544 condMapEmpty!43237) mapIsEmpty!43237))

(assert (= (and b!1111544 (not condMapEmpty!43237)) mapNonEmpty!43237))

(get-info :version)

(assert (= (and mapNonEmpty!43237 ((_ is ValueCellFull!13097) mapValue!43237)) b!1111536))

(assert (= (and b!1111544 ((_ is ValueCellFull!13097) mapDefault!43237)) b!1111541))

(assert (= start!97618 b!1111544))

(declare-fun b_lambda!18383 () Bool)

(assert (=> (not b_lambda!18383) (not bm!46820)))

(declare-fun t!34619 () Bool)

(declare-fun tb!8211 () Bool)

(assert (=> (and start!97618 (= defaultEntry!1004 defaultEntry!1004) t!34619) tb!8211))

(declare-fun result!16991 () Bool)

(assert (=> tb!8211 (= result!16991 tp_is_empty!27613)))

(assert (=> bm!46820 t!34619))

(declare-fun b_and!37551 () Bool)

(assert (= b_and!37549 (and (=> t!34619 result!16991) b_and!37551)))

(declare-fun m!1029981 () Bool)

(assert (=> b!1111534 m!1029981))

(declare-fun m!1029983 () Bool)

(assert (=> start!97618 m!1029983))

(declare-fun m!1029985 () Bool)

(assert (=> start!97618 m!1029985))

(declare-fun m!1029987 () Bool)

(assert (=> b!1111547 m!1029987))

(declare-fun m!1029989 () Bool)

(assert (=> b!1111548 m!1029989))

(declare-fun m!1029991 () Bool)

(assert (=> b!1111548 m!1029991))

(declare-fun m!1029993 () Bool)

(assert (=> bm!46819 m!1029993))

(declare-fun m!1029995 () Bool)

(assert (=> b!1111539 m!1029995))

(declare-fun m!1029997 () Bool)

(assert (=> mapNonEmpty!43237 m!1029997))

(declare-fun m!1029999 () Bool)

(assert (=> b!1111549 m!1029999))

(declare-fun m!1030001 () Bool)

(assert (=> b!1111543 m!1030001))

(declare-fun m!1030003 () Bool)

(assert (=> b!1111545 m!1030003))

(declare-fun m!1030005 () Bool)

(assert (=> b!1111545 m!1030005))

(declare-fun m!1030007 () Bool)

(assert (=> bm!46820 m!1030007))

(declare-fun m!1030009 () Bool)

(assert (=> bm!46820 m!1030009))

(declare-fun m!1030011 () Bool)

(assert (=> bm!46820 m!1030011))

(declare-fun m!1030013 () Bool)

(assert (=> b!1111546 m!1030013))

(declare-fun m!1030015 () Bool)

(assert (=> b!1111538 m!1030015))

(declare-fun m!1030017 () Bool)

(assert (=> b!1111542 m!1030017))

(check-sat (not b_next!23353) (not b!1111542) b_and!37551 tp_is_empty!27613 (not bm!46820) (not b!1111534) (not b_lambda!18383) (not start!97618) (not b!1111547) (not b!1111538) (not b!1111545) (not b!1111543) (not b!1111539) (not b!1111546) (not b!1111548) (not bm!46819) (not mapNonEmpty!43237))
(check-sat b_and!37551 (not b_next!23353))
