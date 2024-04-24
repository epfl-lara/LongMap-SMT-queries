; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97648 () Bool)

(assert start!97648)

(declare-fun b_free!23383 () Bool)

(declare-fun b_next!23383 () Bool)

(assert (=> start!97648 (= b_free!23383 (not b_next!23383))))

(declare-fun tp!82448 () Bool)

(declare-fun b_and!37609 () Bool)

(assert (=> start!97648 (= tp!82448 b_and!37609)))

(declare-fun b!1112284 () Bool)

(declare-fun e!634393 () Bool)

(declare-fun e!634397 () Bool)

(assert (=> b!1112284 (= e!634393 (not e!634397))))

(declare-fun res!741915 () Bool)

(assert (=> b!1112284 (=> res!741915 e!634397)))

(declare-datatypes ((array!72237 0))(
  ( (array!72238 (arr!34765 (Array (_ BitVec 32) (_ BitVec 64))) (size!35302 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72237)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1112284 (= res!741915 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35302 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112284 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36435 0))(
  ( (Unit!36436) )
))
(declare-fun lt!496777 () Unit!36435)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72237 (_ BitVec 64) (_ BitVec 32)) Unit!36435)

(assert (=> b!1112284 (= lt!496777 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1112285 () Bool)

(declare-fun res!741907 () Bool)

(assert (=> b!1112285 (=> (not res!741907) (not e!634393))))

(declare-fun lt!496775 () array!72237)

(declare-datatypes ((List!24258 0))(
  ( (Nil!24255) (Cons!24254 (h!25472 (_ BitVec 64)) (t!34679 List!24258)) )
))
(declare-fun arrayNoDuplicates!0 (array!72237 (_ BitVec 32) List!24258) Bool)

(assert (=> b!1112285 (= res!741907 (arrayNoDuplicates!0 lt!496775 #b00000000000000000000000000000000 Nil!24255))))

(declare-fun b!1112286 () Bool)

(declare-fun e!634394 () Bool)

(declare-fun tp_is_empty!27643 () Bool)

(assert (=> b!1112286 (= e!634394 tp_is_empty!27643)))

(declare-fun b!1112287 () Bool)

(declare-fun res!741916 () Bool)

(declare-fun e!634396 () Bool)

(assert (=> b!1112287 (=> (not res!741916) (not e!634396))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72237 (_ BitVec 32)) Bool)

(assert (=> b!1112287 (= res!741916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1112288 () Bool)

(declare-fun res!741911 () Bool)

(assert (=> b!1112288 (=> (not res!741911) (not e!634396))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41985 0))(
  ( (V!41986 (val!13878 Int)) )
))
(declare-datatypes ((ValueCell!13112 0))(
  ( (ValueCellFull!13112 (v!16507 V!41985)) (EmptyCell!13112) )
))
(declare-datatypes ((array!72239 0))(
  ( (array!72240 (arr!34766 (Array (_ BitVec 32) ValueCell!13112)) (size!35303 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72239)

(assert (=> b!1112288 (= res!741911 (and (= (size!35303 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35302 _keys!1208) (size!35303 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112289 () Bool)

(declare-fun res!741906 () Bool)

(assert (=> b!1112289 (=> (not res!741906) (not e!634396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112289 (= res!741906 (validKeyInArray!0 k0!934))))

(declare-fun res!741909 () Bool)

(assert (=> start!97648 (=> (not res!741909) (not e!634396))))

(assert (=> start!97648 (= res!741909 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35302 _keys!1208))))))

(assert (=> start!97648 e!634396))

(assert (=> start!97648 tp_is_empty!27643))

(declare-fun array_inv!26790 (array!72237) Bool)

(assert (=> start!97648 (array_inv!26790 _keys!1208)))

(assert (=> start!97648 true))

(assert (=> start!97648 tp!82448))

(declare-fun e!634395 () Bool)

(declare-fun array_inv!26791 (array!72239) Bool)

(assert (=> start!97648 (and (array_inv!26791 _values!996) e!634395)))

(declare-fun b!1112290 () Bool)

(assert (=> b!1112290 (= e!634397 true)))

(declare-fun e!634398 () Bool)

(assert (=> b!1112290 e!634398))

(declare-fun c!109670 () Bool)

(assert (=> b!1112290 (= c!109670 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41985)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!496776 () Unit!36435)

(declare-fun minValue!944 () V!41985)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!308 (array!72237 array!72239 (_ BitVec 32) (_ BitVec 32) V!41985 V!41985 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36435)

(assert (=> b!1112290 (= lt!496776 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!308 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112291 () Bool)

(declare-fun res!741914 () Bool)

(assert (=> b!1112291 (=> (not res!741914) (not e!634396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112291 (= res!741914 (validMask!0 mask!1564))))

(declare-fun b!1112292 () Bool)

(declare-fun res!741912 () Bool)

(assert (=> b!1112292 (=> (not res!741912) (not e!634396))))

(assert (=> b!1112292 (= res!741912 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24255))))

(declare-fun b!1112293 () Bool)

(declare-fun mapRes!43282 () Bool)

(assert (=> b!1112293 (= e!634395 (and e!634394 mapRes!43282))))

(declare-fun condMapEmpty!43282 () Bool)

(declare-fun mapDefault!43282 () ValueCell!13112)

(assert (=> b!1112293 (= condMapEmpty!43282 (= (arr!34766 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13112)) mapDefault!43282)))))

(declare-fun b!1112294 () Bool)

(assert (=> b!1112294 (= e!634396 e!634393)))

(declare-fun res!741908 () Bool)

(assert (=> b!1112294 (=> (not res!741908) (not e!634393))))

(assert (=> b!1112294 (= res!741908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496775 mask!1564))))

(assert (=> b!1112294 (= lt!496775 (array!72238 (store (arr!34765 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35302 _keys!1208)))))

(declare-fun mapNonEmpty!43282 () Bool)

(declare-fun tp!82447 () Bool)

(declare-fun e!634391 () Bool)

(assert (=> mapNonEmpty!43282 (= mapRes!43282 (and tp!82447 e!634391))))

(declare-fun mapValue!43282 () ValueCell!13112)

(declare-fun mapRest!43282 () (Array (_ BitVec 32) ValueCell!13112))

(declare-fun mapKey!43282 () (_ BitVec 32))

(assert (=> mapNonEmpty!43282 (= (arr!34766 _values!996) (store mapRest!43282 mapKey!43282 mapValue!43282))))

(declare-datatypes ((tuple2!17576 0))(
  ( (tuple2!17577 (_1!8799 (_ BitVec 64)) (_2!8799 V!41985)) )
))
(declare-datatypes ((List!24259 0))(
  ( (Nil!24256) (Cons!24255 (h!25473 tuple2!17576) (t!34680 List!24259)) )
))
(declare-datatypes ((ListLongMap!15553 0))(
  ( (ListLongMap!15554 (toList!7792 List!24259)) )
))
(declare-fun call!46912 () ListLongMap!15553)

(declare-fun call!46913 () ListLongMap!15553)

(declare-fun b!1112295 () Bool)

(declare-fun -!1043 (ListLongMap!15553 (_ BitVec 64)) ListLongMap!15553)

(assert (=> b!1112295 (= e!634398 (= call!46913 (-!1043 call!46912 k0!934)))))

(declare-fun bm!46909 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4324 (array!72237 array!72239 (_ BitVec 32) (_ BitVec 32) V!41985 V!41985 (_ BitVec 32) Int) ListLongMap!15553)

(declare-fun dynLambda!2436 (Int (_ BitVec 64)) V!41985)

(assert (=> bm!46909 (= call!46913 (getCurrentListMapNoExtraKeys!4324 lt!496775 (array!72240 (store (arr!34766 _values!996) i!673 (ValueCellFull!13112 (dynLambda!2436 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35303 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112296 () Bool)

(assert (=> b!1112296 (= e!634398 (= call!46913 call!46912))))

(declare-fun b!1112297 () Bool)

(declare-fun res!741910 () Bool)

(assert (=> b!1112297 (=> (not res!741910) (not e!634396))))

(assert (=> b!1112297 (= res!741910 (= (select (arr!34765 _keys!1208) i!673) k0!934))))

(declare-fun bm!46910 () Bool)

(assert (=> bm!46910 (= call!46912 (getCurrentListMapNoExtraKeys!4324 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112298 () Bool)

(declare-fun res!741913 () Bool)

(assert (=> b!1112298 (=> (not res!741913) (not e!634396))))

(assert (=> b!1112298 (= res!741913 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35302 _keys!1208))))))

(declare-fun b!1112299 () Bool)

(assert (=> b!1112299 (= e!634391 tp_is_empty!27643)))

(declare-fun mapIsEmpty!43282 () Bool)

(assert (=> mapIsEmpty!43282 mapRes!43282))

(assert (= (and start!97648 res!741909) b!1112291))

(assert (= (and b!1112291 res!741914) b!1112288))

(assert (= (and b!1112288 res!741911) b!1112287))

(assert (= (and b!1112287 res!741916) b!1112292))

(assert (= (and b!1112292 res!741912) b!1112298))

(assert (= (and b!1112298 res!741913) b!1112289))

(assert (= (and b!1112289 res!741906) b!1112297))

(assert (= (and b!1112297 res!741910) b!1112294))

(assert (= (and b!1112294 res!741908) b!1112285))

(assert (= (and b!1112285 res!741907) b!1112284))

(assert (= (and b!1112284 (not res!741915)) b!1112290))

(assert (= (and b!1112290 c!109670) b!1112295))

(assert (= (and b!1112290 (not c!109670)) b!1112296))

(assert (= (or b!1112295 b!1112296) bm!46909))

(assert (= (or b!1112295 b!1112296) bm!46910))

(assert (= (and b!1112293 condMapEmpty!43282) mapIsEmpty!43282))

(assert (= (and b!1112293 (not condMapEmpty!43282)) mapNonEmpty!43282))

(get-info :version)

(assert (= (and mapNonEmpty!43282 ((_ is ValueCellFull!13112) mapValue!43282)) b!1112299))

(assert (= (and b!1112293 ((_ is ValueCellFull!13112) mapDefault!43282)) b!1112286))

(assert (= start!97648 b!1112293))

(declare-fun b_lambda!18413 () Bool)

(assert (=> (not b_lambda!18413) (not bm!46909)))

(declare-fun t!34678 () Bool)

(declare-fun tb!8241 () Bool)

(assert (=> (and start!97648 (= defaultEntry!1004 defaultEntry!1004) t!34678) tb!8241))

(declare-fun result!17051 () Bool)

(assert (=> tb!8241 (= result!17051 tp_is_empty!27643)))

(assert (=> bm!46909 t!34678))

(declare-fun b_and!37611 () Bool)

(assert (= b_and!37609 (and (=> t!34678 result!17051) b_and!37611)))

(declare-fun m!1030551 () Bool)

(assert (=> b!1112291 m!1030551))

(declare-fun m!1030553 () Bool)

(assert (=> bm!46910 m!1030553))

(declare-fun m!1030555 () Bool)

(assert (=> bm!46909 m!1030555))

(declare-fun m!1030557 () Bool)

(assert (=> bm!46909 m!1030557))

(declare-fun m!1030559 () Bool)

(assert (=> bm!46909 m!1030559))

(declare-fun m!1030561 () Bool)

(assert (=> b!1112287 m!1030561))

(declare-fun m!1030563 () Bool)

(assert (=> b!1112292 m!1030563))

(declare-fun m!1030565 () Bool)

(assert (=> b!1112295 m!1030565))

(declare-fun m!1030567 () Bool)

(assert (=> b!1112289 m!1030567))

(declare-fun m!1030569 () Bool)

(assert (=> b!1112284 m!1030569))

(declare-fun m!1030571 () Bool)

(assert (=> b!1112284 m!1030571))

(declare-fun m!1030573 () Bool)

(assert (=> b!1112285 m!1030573))

(declare-fun m!1030575 () Bool)

(assert (=> b!1112297 m!1030575))

(declare-fun m!1030577 () Bool)

(assert (=> mapNonEmpty!43282 m!1030577))

(declare-fun m!1030579 () Bool)

(assert (=> b!1112294 m!1030579))

(declare-fun m!1030581 () Bool)

(assert (=> b!1112294 m!1030581))

(declare-fun m!1030583 () Bool)

(assert (=> start!97648 m!1030583))

(declare-fun m!1030585 () Bool)

(assert (=> start!97648 m!1030585))

(declare-fun m!1030587 () Bool)

(assert (=> b!1112290 m!1030587))

(check-sat (not b_lambda!18413) (not mapNonEmpty!43282) (not b_next!23383) (not b!1112295) (not b!1112284) (not bm!46910) (not bm!46909) (not b!1112287) (not b!1112290) tp_is_empty!27643 b_and!37611 (not b!1112289) (not start!97648) (not b!1112291) (not b!1112294) (not b!1112285) (not b!1112292))
(check-sat b_and!37611 (not b_next!23383))
