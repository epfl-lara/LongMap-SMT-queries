; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97612 () Bool)

(assert start!97612)

(declare-fun b_free!23347 () Bool)

(declare-fun b_next!23347 () Bool)

(assert (=> start!97612 (= b_free!23347 (not b_next!23347))))

(declare-fun tp!82339 () Bool)

(declare-fun b_and!37537 () Bool)

(assert (=> start!97612 (= tp!82339 b_and!37537)))

(declare-fun mapNonEmpty!43228 () Bool)

(declare-fun mapRes!43228 () Bool)

(declare-fun tp!82340 () Bool)

(declare-fun e!633966 () Bool)

(assert (=> mapNonEmpty!43228 (= mapRes!43228 (and tp!82340 e!633966))))

(declare-fun mapKey!43228 () (_ BitVec 32))

(declare-datatypes ((V!41937 0))(
  ( (V!41938 (val!13860 Int)) )
))
(declare-datatypes ((ValueCell!13094 0))(
  ( (ValueCellFull!13094 (v!16489 V!41937)) (EmptyCell!13094) )
))
(declare-fun mapRest!43228 () (Array (_ BitVec 32) ValueCell!13094))

(declare-datatypes ((array!72165 0))(
  ( (array!72166 (arr!34729 (Array (_ BitVec 32) ValueCell!13094)) (size!35266 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72165)

(declare-fun mapValue!43228 () ValueCell!13094)

(assert (=> mapNonEmpty!43228 (= (arr!34729 _values!996) (store mapRest!43228 mapKey!43228 mapValue!43228))))

(declare-fun b!1111384 () Bool)

(declare-fun res!741318 () Bool)

(declare-fun e!633960 () Bool)

(assert (=> b!1111384 (=> (not res!741318) (not e!633960))))

(declare-datatypes ((array!72167 0))(
  ( (array!72168 (arr!34730 (Array (_ BitVec 32) (_ BitVec 64))) (size!35267 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72167)

(declare-datatypes ((List!24226 0))(
  ( (Nil!24223) (Cons!24222 (h!25440 (_ BitVec 64)) (t!34611 List!24226)) )
))
(declare-fun arrayNoDuplicates!0 (array!72167 (_ BitVec 32) List!24226) Bool)

(assert (=> b!1111384 (= res!741318 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24223))))

(declare-fun b!1111385 () Bool)

(declare-fun res!741317 () Bool)

(assert (=> b!1111385 (=> (not res!741317) (not e!633960))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111385 (= res!741317 (validKeyInArray!0 k0!934))))

(declare-fun b!1111386 () Bool)

(declare-fun e!633959 () Bool)

(declare-fun e!633961 () Bool)

(assert (=> b!1111386 (= e!633959 (and e!633961 mapRes!43228))))

(declare-fun condMapEmpty!43228 () Bool)

(declare-fun mapDefault!43228 () ValueCell!13094)

(assert (=> b!1111386 (= condMapEmpty!43228 (= (arr!34729 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13094)) mapDefault!43228)))))

(declare-fun b!1111387 () Bool)

(declare-fun tp_is_empty!27607 () Bool)

(assert (=> b!1111387 (= e!633966 tp_is_empty!27607)))

(declare-fun res!741316 () Bool)

(assert (=> start!97612 (=> (not res!741316) (not e!633960))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97612 (= res!741316 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35267 _keys!1208))))))

(assert (=> start!97612 e!633960))

(assert (=> start!97612 tp_is_empty!27607))

(declare-fun array_inv!26760 (array!72167) Bool)

(assert (=> start!97612 (array_inv!26760 _keys!1208)))

(assert (=> start!97612 true))

(assert (=> start!97612 tp!82339))

(declare-fun array_inv!26761 (array!72165) Bool)

(assert (=> start!97612 (and (array_inv!26761 _values!996) e!633959)))

(declare-fun b!1111388 () Bool)

(declare-fun e!633963 () Bool)

(assert (=> b!1111388 (= e!633960 e!633963)))

(declare-fun res!741321 () Bool)

(assert (=> b!1111388 (=> (not res!741321) (not e!633963))))

(declare-fun lt!496615 () array!72167)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72167 (_ BitVec 32)) Bool)

(assert (=> b!1111388 (= res!741321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496615 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1111388 (= lt!496615 (array!72168 (store (arr!34730 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35267 _keys!1208)))))

(declare-fun b!1111389 () Bool)

(declare-fun res!741319 () Bool)

(assert (=> b!1111389 (=> (not res!741319) (not e!633960))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1111389 (= res!741319 (and (= (size!35266 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35267 _keys!1208) (size!35266 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1111390 () Bool)

(declare-fun e!633964 () Bool)

(assert (=> b!1111390 (= e!633964 true)))

(declare-fun e!633962 () Bool)

(assert (=> b!1111390 e!633962))

(declare-fun c!109616 () Bool)

(assert (=> b!1111390 (= c!109616 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41937)

(declare-datatypes ((Unit!36407 0))(
  ( (Unit!36408) )
))
(declare-fun lt!496613 () Unit!36407)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41937)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!297 (array!72167 array!72165 (_ BitVec 32) (_ BitVec 32) V!41937 V!41937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36407)

(assert (=> b!1111390 (= lt!496613 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!297 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111391 () Bool)

(assert (=> b!1111391 (= e!633963 (not e!633964))))

(declare-fun res!741320 () Bool)

(assert (=> b!1111391 (=> res!741320 e!633964)))

(assert (=> b!1111391 (= res!741320 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35267 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111391 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496614 () Unit!36407)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72167 (_ BitVec 64) (_ BitVec 32)) Unit!36407)

(assert (=> b!1111391 (= lt!496614 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1111392 () Bool)

(declare-fun res!741314 () Bool)

(assert (=> b!1111392 (=> (not res!741314) (not e!633960))))

(assert (=> b!1111392 (= res!741314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1111393 () Bool)

(declare-fun res!741315 () Bool)

(assert (=> b!1111393 (=> (not res!741315) (not e!633963))))

(assert (=> b!1111393 (= res!741315 (arrayNoDuplicates!0 lt!496615 #b00000000000000000000000000000000 Nil!24223))))

(declare-fun b!1111394 () Bool)

(assert (=> b!1111394 (= e!633961 tp_is_empty!27607)))

(declare-fun mapIsEmpty!43228 () Bool)

(assert (=> mapIsEmpty!43228 mapRes!43228))

(declare-fun b!1111395 () Bool)

(declare-fun res!741313 () Bool)

(assert (=> b!1111395 (=> (not res!741313) (not e!633960))))

(assert (=> b!1111395 (= res!741313 (= (select (arr!34730 _keys!1208) i!673) k0!934))))

(declare-fun b!1111396 () Bool)

(declare-fun res!741322 () Bool)

(assert (=> b!1111396 (=> (not res!741322) (not e!633960))))

(assert (=> b!1111396 (= res!741322 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35267 _keys!1208))))))

(declare-fun b!1111397 () Bool)

(declare-datatypes ((tuple2!17542 0))(
  ( (tuple2!17543 (_1!8782 (_ BitVec 64)) (_2!8782 V!41937)) )
))
(declare-datatypes ((List!24227 0))(
  ( (Nil!24224) (Cons!24223 (h!25441 tuple2!17542) (t!34612 List!24227)) )
))
(declare-datatypes ((ListLongMap!15519 0))(
  ( (ListLongMap!15520 (toList!7775 List!24227)) )
))
(declare-fun call!46805 () ListLongMap!15519)

(declare-fun call!46804 () ListLongMap!15519)

(declare-fun -!1029 (ListLongMap!15519 (_ BitVec 64)) ListLongMap!15519)

(assert (=> b!1111397 (= e!633962 (= call!46804 (-!1029 call!46805 k0!934)))))

(declare-fun b!1111398 () Bool)

(declare-fun res!741312 () Bool)

(assert (=> b!1111398 (=> (not res!741312) (not e!633960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111398 (= res!741312 (validMask!0 mask!1564))))

(declare-fun b!1111399 () Bool)

(assert (=> b!1111399 (= e!633962 (= call!46804 call!46805))))

(declare-fun bm!46801 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4308 (array!72167 array!72165 (_ BitVec 32) (_ BitVec 32) V!41937 V!41937 (_ BitVec 32) Int) ListLongMap!15519)

(declare-fun dynLambda!2420 (Int (_ BitVec 64)) V!41937)

(assert (=> bm!46801 (= call!46804 (getCurrentListMapNoExtraKeys!4308 lt!496615 (array!72166 (store (arr!34729 _values!996) i!673 (ValueCellFull!13094 (dynLambda!2420 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35266 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46802 () Bool)

(assert (=> bm!46802 (= call!46805 (getCurrentListMapNoExtraKeys!4308 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97612 res!741316) b!1111398))

(assert (= (and b!1111398 res!741312) b!1111389))

(assert (= (and b!1111389 res!741319) b!1111392))

(assert (= (and b!1111392 res!741314) b!1111384))

(assert (= (and b!1111384 res!741318) b!1111396))

(assert (= (and b!1111396 res!741322) b!1111385))

(assert (= (and b!1111385 res!741317) b!1111395))

(assert (= (and b!1111395 res!741313) b!1111388))

(assert (= (and b!1111388 res!741321) b!1111393))

(assert (= (and b!1111393 res!741315) b!1111391))

(assert (= (and b!1111391 (not res!741320)) b!1111390))

(assert (= (and b!1111390 c!109616) b!1111397))

(assert (= (and b!1111390 (not c!109616)) b!1111399))

(assert (= (or b!1111397 b!1111399) bm!46801))

(assert (= (or b!1111397 b!1111399) bm!46802))

(assert (= (and b!1111386 condMapEmpty!43228) mapIsEmpty!43228))

(assert (= (and b!1111386 (not condMapEmpty!43228)) mapNonEmpty!43228))

(get-info :version)

(assert (= (and mapNonEmpty!43228 ((_ is ValueCellFull!13094) mapValue!43228)) b!1111387))

(assert (= (and b!1111386 ((_ is ValueCellFull!13094) mapDefault!43228)) b!1111394))

(assert (= start!97612 b!1111386))

(declare-fun b_lambda!18377 () Bool)

(assert (=> (not b_lambda!18377) (not bm!46801)))

(declare-fun t!34610 () Bool)

(declare-fun tb!8205 () Bool)

(assert (=> (and start!97612 (= defaultEntry!1004 defaultEntry!1004) t!34610) tb!8205))

(declare-fun result!16979 () Bool)

(assert (=> tb!8205 (= result!16979 tp_is_empty!27607)))

(assert (=> bm!46801 t!34610))

(declare-fun b_and!37539 () Bool)

(assert (= b_and!37537 (and (=> t!34610 result!16979) b_and!37539)))

(declare-fun m!1029867 () Bool)

(assert (=> bm!46802 m!1029867))

(declare-fun m!1029869 () Bool)

(assert (=> b!1111397 m!1029869))

(declare-fun m!1029871 () Bool)

(assert (=> mapNonEmpty!43228 m!1029871))

(declare-fun m!1029873 () Bool)

(assert (=> b!1111384 m!1029873))

(declare-fun m!1029875 () Bool)

(assert (=> b!1111388 m!1029875))

(declare-fun m!1029877 () Bool)

(assert (=> b!1111388 m!1029877))

(declare-fun m!1029879 () Bool)

(assert (=> b!1111398 m!1029879))

(declare-fun m!1029881 () Bool)

(assert (=> start!97612 m!1029881))

(declare-fun m!1029883 () Bool)

(assert (=> start!97612 m!1029883))

(declare-fun m!1029885 () Bool)

(assert (=> bm!46801 m!1029885))

(declare-fun m!1029887 () Bool)

(assert (=> bm!46801 m!1029887))

(declare-fun m!1029889 () Bool)

(assert (=> bm!46801 m!1029889))

(declare-fun m!1029891 () Bool)

(assert (=> b!1111392 m!1029891))

(declare-fun m!1029893 () Bool)

(assert (=> b!1111395 m!1029893))

(declare-fun m!1029895 () Bool)

(assert (=> b!1111391 m!1029895))

(declare-fun m!1029897 () Bool)

(assert (=> b!1111391 m!1029897))

(declare-fun m!1029899 () Bool)

(assert (=> b!1111385 m!1029899))

(declare-fun m!1029901 () Bool)

(assert (=> b!1111390 m!1029901))

(declare-fun m!1029903 () Bool)

(assert (=> b!1111393 m!1029903))

(check-sat (not b!1111398) (not b!1111397) (not b!1111384) (not b!1111393) (not b!1111388) (not start!97612) (not bm!46801) tp_is_empty!27607 (not bm!46802) (not b!1111391) (not b_lambda!18377) (not b!1111385) (not b!1111392) (not mapNonEmpty!43228) (not b_next!23347) (not b!1111390) b_and!37539)
(check-sat b_and!37539 (not b_next!23347))
