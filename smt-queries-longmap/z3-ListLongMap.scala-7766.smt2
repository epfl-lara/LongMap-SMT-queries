; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97576 () Bool)

(assert start!97576)

(declare-fun b_free!23311 () Bool)

(declare-fun b_next!23311 () Bool)

(assert (=> start!97576 (= b_free!23311 (not b_next!23311))))

(declare-fun tp!82232 () Bool)

(declare-fun b_and!37465 () Bool)

(assert (=> start!97576 (= tp!82232 b_and!37465)))

(declare-fun b!1110484 () Bool)

(declare-fun res!740719 () Bool)

(declare-fun e!633534 () Bool)

(assert (=> b!1110484 (=> (not res!740719) (not e!633534))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110484 (= res!740719 (validMask!0 mask!1564))))

(declare-fun b!1110485 () Bool)

(declare-fun e!633532 () Bool)

(assert (=> b!1110485 (= e!633532 true)))

(declare-fun e!633531 () Bool)

(assert (=> b!1110485 e!633531))

(declare-fun c!109562 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110485 (= c!109562 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!41889 0))(
  ( (V!41890 (val!13842 Int)) )
))
(declare-fun zeroValue!944 () V!41889)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((ValueCell!13076 0))(
  ( (ValueCellFull!13076 (v!16471 V!41889)) (EmptyCell!13076) )
))
(declare-datatypes ((array!72093 0))(
  ( (array!72094 (arr!34693 (Array (_ BitVec 32) ValueCell!13076)) (size!35230 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72093)

(declare-fun minValue!944 () V!41889)

(declare-datatypes ((array!72095 0))(
  ( (array!72096 (arr!34694 (Array (_ BitVec 32) (_ BitVec 64))) (size!35231 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72095)

(declare-datatypes ((Unit!36377 0))(
  ( (Unit!36378) )
))
(declare-fun lt!496452 () Unit!36377)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!283 (array!72095 array!72093 (_ BitVec 32) (_ BitVec 32) V!41889 V!41889 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36377)

(assert (=> b!1110485 (= lt!496452 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43174 () Bool)

(declare-fun mapRes!43174 () Bool)

(assert (=> mapIsEmpty!43174 mapRes!43174))

(declare-fun b!1110486 () Bool)

(declare-fun res!740728 () Bool)

(assert (=> b!1110486 (=> (not res!740728) (not e!633534))))

(declare-datatypes ((List!24192 0))(
  ( (Nil!24189) (Cons!24188 (h!25406 (_ BitVec 64)) (t!34541 List!24192)) )
))
(declare-fun arrayNoDuplicates!0 (array!72095 (_ BitVec 32) List!24192) Bool)

(assert (=> b!1110486 (= res!740728 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24189))))

(declare-fun b!1110487 () Bool)

(declare-fun res!740727 () Bool)

(assert (=> b!1110487 (=> (not res!740727) (not e!633534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110487 (= res!740727 (validKeyInArray!0 k0!934))))

(declare-fun b!1110488 () Bool)

(declare-fun e!633529 () Bool)

(declare-fun e!633533 () Bool)

(assert (=> b!1110488 (= e!633529 (and e!633533 mapRes!43174))))

(declare-fun condMapEmpty!43174 () Bool)

(declare-fun mapDefault!43174 () ValueCell!13076)

(assert (=> b!1110488 (= condMapEmpty!43174 (= (arr!34693 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13076)) mapDefault!43174)))))

(declare-fun b!1110489 () Bool)

(declare-fun e!633528 () Bool)

(assert (=> b!1110489 (= e!633528 (not e!633532))))

(declare-fun res!740722 () Bool)

(assert (=> b!1110489 (=> res!740722 e!633532)))

(assert (=> b!1110489 (= res!740722 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35231 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110489 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496453 () Unit!36377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72095 (_ BitVec 64) (_ BitVec 32)) Unit!36377)

(assert (=> b!1110489 (= lt!496453 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1110490 () Bool)

(declare-fun e!633527 () Bool)

(declare-fun tp_is_empty!27571 () Bool)

(assert (=> b!1110490 (= e!633527 tp_is_empty!27571)))

(declare-fun b!1110492 () Bool)

(declare-datatypes ((tuple2!17506 0))(
  ( (tuple2!17507 (_1!8764 (_ BitVec 64)) (_2!8764 V!41889)) )
))
(declare-datatypes ((List!24193 0))(
  ( (Nil!24190) (Cons!24189 (h!25407 tuple2!17506) (t!34542 List!24193)) )
))
(declare-datatypes ((ListLongMap!15483 0))(
  ( (ListLongMap!15484 (toList!7757 List!24193)) )
))
(declare-fun call!46696 () ListLongMap!15483)

(declare-fun call!46697 () ListLongMap!15483)

(declare-fun -!1012 (ListLongMap!15483 (_ BitVec 64)) ListLongMap!15483)

(assert (=> b!1110492 (= e!633531 (= call!46697 (-!1012 call!46696 k0!934)))))

(declare-fun b!1110493 () Bool)

(assert (=> b!1110493 (= e!633534 e!633528)))

(declare-fun res!740721 () Bool)

(assert (=> b!1110493 (=> (not res!740721) (not e!633528))))

(declare-fun lt!496451 () array!72095)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72095 (_ BitVec 32)) Bool)

(assert (=> b!1110493 (= res!740721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496451 mask!1564))))

(assert (=> b!1110493 (= lt!496451 (array!72096 (store (arr!34694 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35231 _keys!1208)))))

(declare-fun b!1110494 () Bool)

(declare-fun res!740720 () Bool)

(assert (=> b!1110494 (=> (not res!740720) (not e!633534))))

(assert (=> b!1110494 (= res!740720 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35231 _keys!1208))))))

(declare-fun b!1110495 () Bool)

(declare-fun res!740723 () Bool)

(assert (=> b!1110495 (=> (not res!740723) (not e!633534))))

(assert (=> b!1110495 (= res!740723 (= (select (arr!34694 _keys!1208) i!673) k0!934))))

(declare-fun b!1110496 () Bool)

(declare-fun res!740718 () Bool)

(assert (=> b!1110496 (=> (not res!740718) (not e!633528))))

(assert (=> b!1110496 (= res!740718 (arrayNoDuplicates!0 lt!496451 #b00000000000000000000000000000000 Nil!24189))))

(declare-fun b!1110497 () Bool)

(assert (=> b!1110497 (= e!633533 tp_is_empty!27571)))

(declare-fun bm!46693 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4292 (array!72095 array!72093 (_ BitVec 32) (_ BitVec 32) V!41889 V!41889 (_ BitVec 32) Int) ListLongMap!15483)

(declare-fun dynLambda!2405 (Int (_ BitVec 64)) V!41889)

(assert (=> bm!46693 (= call!46697 (getCurrentListMapNoExtraKeys!4292 lt!496451 (array!72094 (store (arr!34693 _values!996) i!673 (ValueCellFull!13076 (dynLambda!2405 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35230 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110498 () Bool)

(declare-fun res!740725 () Bool)

(assert (=> b!1110498 (=> (not res!740725) (not e!633534))))

(assert (=> b!1110498 (= res!740725 (and (= (size!35230 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35231 _keys!1208) (size!35230 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110491 () Bool)

(assert (=> b!1110491 (= e!633531 (= call!46697 call!46696))))

(declare-fun res!740724 () Bool)

(assert (=> start!97576 (=> (not res!740724) (not e!633534))))

(assert (=> start!97576 (= res!740724 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35231 _keys!1208))))))

(assert (=> start!97576 e!633534))

(assert (=> start!97576 tp_is_empty!27571))

(declare-fun array_inv!26728 (array!72095) Bool)

(assert (=> start!97576 (array_inv!26728 _keys!1208)))

(assert (=> start!97576 true))

(assert (=> start!97576 tp!82232))

(declare-fun array_inv!26729 (array!72093) Bool)

(assert (=> start!97576 (and (array_inv!26729 _values!996) e!633529)))

(declare-fun bm!46694 () Bool)

(assert (=> bm!46694 (= call!46696 (getCurrentListMapNoExtraKeys!4292 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110499 () Bool)

(declare-fun res!740726 () Bool)

(assert (=> b!1110499 (=> (not res!740726) (not e!633534))))

(assert (=> b!1110499 (= res!740726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43174 () Bool)

(declare-fun tp!82231 () Bool)

(assert (=> mapNonEmpty!43174 (= mapRes!43174 (and tp!82231 e!633527))))

(declare-fun mapKey!43174 () (_ BitVec 32))

(declare-fun mapRest!43174 () (Array (_ BitVec 32) ValueCell!13076))

(declare-fun mapValue!43174 () ValueCell!13076)

(assert (=> mapNonEmpty!43174 (= (arr!34693 _values!996) (store mapRest!43174 mapKey!43174 mapValue!43174))))

(assert (= (and start!97576 res!740724) b!1110484))

(assert (= (and b!1110484 res!740719) b!1110498))

(assert (= (and b!1110498 res!740725) b!1110499))

(assert (= (and b!1110499 res!740726) b!1110486))

(assert (= (and b!1110486 res!740728) b!1110494))

(assert (= (and b!1110494 res!740720) b!1110487))

(assert (= (and b!1110487 res!740727) b!1110495))

(assert (= (and b!1110495 res!740723) b!1110493))

(assert (= (and b!1110493 res!740721) b!1110496))

(assert (= (and b!1110496 res!740718) b!1110489))

(assert (= (and b!1110489 (not res!740722)) b!1110485))

(assert (= (and b!1110485 c!109562) b!1110492))

(assert (= (and b!1110485 (not c!109562)) b!1110491))

(assert (= (or b!1110492 b!1110491) bm!46693))

(assert (= (or b!1110492 b!1110491) bm!46694))

(assert (= (and b!1110488 condMapEmpty!43174) mapIsEmpty!43174))

(assert (= (and b!1110488 (not condMapEmpty!43174)) mapNonEmpty!43174))

(get-info :version)

(assert (= (and mapNonEmpty!43174 ((_ is ValueCellFull!13076) mapValue!43174)) b!1110490))

(assert (= (and b!1110488 ((_ is ValueCellFull!13076) mapDefault!43174)) b!1110497))

(assert (= start!97576 b!1110488))

(declare-fun b_lambda!18341 () Bool)

(assert (=> (not b_lambda!18341) (not bm!46693)))

(declare-fun t!34540 () Bool)

(declare-fun tb!8169 () Bool)

(assert (=> (and start!97576 (= defaultEntry!1004 defaultEntry!1004) t!34540) tb!8169))

(declare-fun result!16907 () Bool)

(assert (=> tb!8169 (= result!16907 tp_is_empty!27571)))

(assert (=> bm!46693 t!34540))

(declare-fun b_and!37467 () Bool)

(assert (= b_and!37465 (and (=> t!34540 result!16907) b_and!37467)))

(declare-fun m!1029183 () Bool)

(assert (=> b!1110496 m!1029183))

(declare-fun m!1029185 () Bool)

(assert (=> mapNonEmpty!43174 m!1029185))

(declare-fun m!1029187 () Bool)

(assert (=> b!1110499 m!1029187))

(declare-fun m!1029189 () Bool)

(assert (=> b!1110484 m!1029189))

(declare-fun m!1029191 () Bool)

(assert (=> b!1110487 m!1029191))

(declare-fun m!1029193 () Bool)

(assert (=> b!1110495 m!1029193))

(declare-fun m!1029195 () Bool)

(assert (=> b!1110485 m!1029195))

(declare-fun m!1029197 () Bool)

(assert (=> b!1110489 m!1029197))

(declare-fun m!1029199 () Bool)

(assert (=> b!1110489 m!1029199))

(declare-fun m!1029201 () Bool)

(assert (=> bm!46693 m!1029201))

(declare-fun m!1029203 () Bool)

(assert (=> bm!46693 m!1029203))

(declare-fun m!1029205 () Bool)

(assert (=> bm!46693 m!1029205))

(declare-fun m!1029207 () Bool)

(assert (=> b!1110492 m!1029207))

(declare-fun m!1029209 () Bool)

(assert (=> b!1110486 m!1029209))

(declare-fun m!1029211 () Bool)

(assert (=> bm!46694 m!1029211))

(declare-fun m!1029213 () Bool)

(assert (=> b!1110493 m!1029213))

(declare-fun m!1029215 () Bool)

(assert (=> b!1110493 m!1029215))

(declare-fun m!1029217 () Bool)

(assert (=> start!97576 m!1029217))

(declare-fun m!1029219 () Bool)

(assert (=> start!97576 m!1029219))

(check-sat (not b!1110485) (not b!1110493) b_and!37467 (not bm!46694) (not mapNonEmpty!43174) (not b!1110486) (not b!1110484) (not start!97576) (not b!1110489) (not b!1110487) (not b!1110492) tp_is_empty!27571 (not b!1110499) (not b_lambda!18341) (not b!1110496) (not b_next!23311) (not bm!46693))
(check-sat b_and!37467 (not b_next!23311))
