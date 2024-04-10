; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97354 () Bool)

(assert start!97354)

(declare-fun b_free!23325 () Bool)

(declare-fun b_next!23325 () Bool)

(assert (=> start!97354 (= b_free!23325 (not b_next!23325))))

(declare-fun tp!82274 () Bool)

(declare-fun b_and!37485 () Bool)

(assert (=> start!97354 (= tp!82274 b_and!37485)))

(declare-fun b!1109519 () Bool)

(declare-fun e!632849 () Bool)

(declare-fun tp_is_empty!27585 () Bool)

(assert (=> b!1109519 (= e!632849 tp_is_empty!27585)))

(declare-datatypes ((V!41907 0))(
  ( (V!41908 (val!13849 Int)) )
))
(declare-fun zeroValue!944 () V!41907)

(declare-datatypes ((array!72087 0))(
  ( (array!72088 (arr!34696 (Array (_ BitVec 32) (_ BitVec 64))) (size!35232 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72087)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46668 () Bool)

(declare-datatypes ((tuple2!17506 0))(
  ( (tuple2!17507 (_1!8764 (_ BitVec 64)) (_2!8764 V!41907)) )
))
(declare-datatypes ((List!24190 0))(
  ( (Nil!24187) (Cons!24186 (h!25395 tuple2!17506) (t!34561 List!24190)) )
))
(declare-datatypes ((ListLongMap!15475 0))(
  ( (ListLongMap!15476 (toList!7753 List!24190)) )
))
(declare-fun call!46672 () ListLongMap!15475)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13083 0))(
  ( (ValueCellFull!13083 (v!16482 V!41907)) (EmptyCell!13083) )
))
(declare-datatypes ((array!72089 0))(
  ( (array!72090 (arr!34697 (Array (_ BitVec 32) ValueCell!13083)) (size!35233 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72089)

(declare-fun minValue!944 () V!41907)

(declare-fun getCurrentListMapNoExtraKeys!4247 (array!72087 array!72089 (_ BitVec 32) (_ BitVec 32) V!41907 V!41907 (_ BitVec 32) Int) ListLongMap!15475)

(assert (=> bm!46668 (= call!46672 (getCurrentListMapNoExtraKeys!4247 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109520 () Bool)

(declare-fun e!632850 () Bool)

(declare-fun e!632847 () Bool)

(assert (=> b!1109520 (= e!632850 e!632847)))

(declare-fun res!740428 () Bool)

(assert (=> b!1109520 (=> (not res!740428) (not e!632847))))

(declare-fun lt!496000 () array!72087)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72087 (_ BitVec 32)) Bool)

(assert (=> b!1109520 (= res!740428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496000 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1109520 (= lt!496000 (array!72088 (store (arr!34696 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35232 _keys!1208)))))

(declare-fun mapNonEmpty!43195 () Bool)

(declare-fun mapRes!43195 () Bool)

(declare-fun tp!82273 () Bool)

(declare-fun e!632852 () Bool)

(assert (=> mapNonEmpty!43195 (= mapRes!43195 (and tp!82273 e!632852))))

(declare-fun mapKey!43195 () (_ BitVec 32))

(declare-fun mapRest!43195 () (Array (_ BitVec 32) ValueCell!13083))

(declare-fun mapValue!43195 () ValueCell!13083)

(assert (=> mapNonEmpty!43195 (= (arr!34697 _values!996) (store mapRest!43195 mapKey!43195 mapValue!43195))))

(declare-fun b!1109522 () Bool)

(declare-fun e!632853 () Bool)

(declare-fun call!46671 () ListLongMap!15475)

(assert (=> b!1109522 (= e!632853 (= call!46671 call!46672))))

(declare-fun b!1109523 () Bool)

(declare-fun res!740430 () Bool)

(assert (=> b!1109523 (=> (not res!740430) (not e!632850))))

(assert (=> b!1109523 (= res!740430 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35232 _keys!1208))))))

(declare-fun b!1109524 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1029 (ListLongMap!15475 (_ BitVec 64)) ListLongMap!15475)

(assert (=> b!1109524 (= e!632853 (= call!46671 (-!1029 call!46672 k0!934)))))

(declare-fun b!1109525 () Bool)

(declare-fun res!740433 () Bool)

(assert (=> b!1109525 (=> (not res!740433) (not e!632850))))

(assert (=> b!1109525 (= res!740433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109526 () Bool)

(declare-fun res!740436 () Bool)

(assert (=> b!1109526 (=> (not res!740436) (not e!632850))))

(assert (=> b!1109526 (= res!740436 (and (= (size!35233 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35232 _keys!1208) (size!35233 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1109527 () Bool)

(declare-fun res!740432 () Bool)

(assert (=> b!1109527 (=> (not res!740432) (not e!632850))))

(assert (=> b!1109527 (= res!740432 (= (select (arr!34696 _keys!1208) i!673) k0!934))))

(declare-fun bm!46669 () Bool)

(declare-fun dynLambda!2377 (Int (_ BitVec 64)) V!41907)

(assert (=> bm!46669 (= call!46671 (getCurrentListMapNoExtraKeys!4247 lt!496000 (array!72090 (store (arr!34697 _values!996) i!673 (ValueCellFull!13083 (dynLambda!2377 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35233 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109528 () Bool)

(declare-fun res!740429 () Bool)

(assert (=> b!1109528 (=> (not res!740429) (not e!632847))))

(declare-datatypes ((List!24191 0))(
  ( (Nil!24188) (Cons!24187 (h!25396 (_ BitVec 64)) (t!34562 List!24191)) )
))
(declare-fun arrayNoDuplicates!0 (array!72087 (_ BitVec 32) List!24191) Bool)

(assert (=> b!1109528 (= res!740429 (arrayNoDuplicates!0 lt!496000 #b00000000000000000000000000000000 Nil!24188))))

(declare-fun res!740435 () Bool)

(assert (=> start!97354 (=> (not res!740435) (not e!632850))))

(assert (=> start!97354 (= res!740435 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35232 _keys!1208))))))

(assert (=> start!97354 e!632850))

(assert (=> start!97354 tp_is_empty!27585))

(declare-fun array_inv!26700 (array!72087) Bool)

(assert (=> start!97354 (array_inv!26700 _keys!1208)))

(assert (=> start!97354 true))

(assert (=> start!97354 tp!82274))

(declare-fun e!632848 () Bool)

(declare-fun array_inv!26701 (array!72089) Bool)

(assert (=> start!97354 (and (array_inv!26701 _values!996) e!632848)))

(declare-fun b!1109521 () Bool)

(assert (=> b!1109521 (= e!632852 tp_is_empty!27585)))

(declare-fun b!1109529 () Bool)

(declare-fun res!740434 () Bool)

(assert (=> b!1109529 (=> (not res!740434) (not e!632850))))

(assert (=> b!1109529 (= res!740434 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24188))))

(declare-fun b!1109530 () Bool)

(declare-fun res!740437 () Bool)

(assert (=> b!1109530 (=> (not res!740437) (not e!632850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109530 (= res!740437 (validKeyInArray!0 k0!934))))

(declare-fun b!1109531 () Bool)

(declare-fun res!740427 () Bool)

(assert (=> b!1109531 (=> (not res!740427) (not e!632850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109531 (= res!740427 (validMask!0 mask!1564))))

(declare-fun b!1109532 () Bool)

(assert (=> b!1109532 (= e!632848 (and e!632849 mapRes!43195))))

(declare-fun condMapEmpty!43195 () Bool)

(declare-fun mapDefault!43195 () ValueCell!13083)

(assert (=> b!1109532 (= condMapEmpty!43195 (= (arr!34697 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13083)) mapDefault!43195)))))

(declare-fun mapIsEmpty!43195 () Bool)

(assert (=> mapIsEmpty!43195 mapRes!43195))

(declare-fun b!1109533 () Bool)

(declare-fun e!632851 () Bool)

(assert (=> b!1109533 (= e!632847 (not e!632851))))

(declare-fun res!740431 () Bool)

(assert (=> b!1109533 (=> res!740431 e!632851)))

(assert (=> b!1109533 (= res!740431 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35232 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109533 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36412 0))(
  ( (Unit!36413) )
))
(declare-fun lt!495999 () Unit!36412)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72087 (_ BitVec 64) (_ BitVec 32)) Unit!36412)

(assert (=> b!1109533 (= lt!495999 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1109534 () Bool)

(assert (=> b!1109534 (= e!632851 true)))

(assert (=> b!1109534 e!632853))

(declare-fun c!109179 () Bool)

(assert (=> b!1109534 (= c!109179 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496001 () Unit!36412)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!275 (array!72087 array!72089 (_ BitVec 32) (_ BitVec 32) V!41907 V!41907 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36412)

(assert (=> b!1109534 (= lt!496001 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!275 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97354 res!740435) b!1109531))

(assert (= (and b!1109531 res!740427) b!1109526))

(assert (= (and b!1109526 res!740436) b!1109525))

(assert (= (and b!1109525 res!740433) b!1109529))

(assert (= (and b!1109529 res!740434) b!1109523))

(assert (= (and b!1109523 res!740430) b!1109530))

(assert (= (and b!1109530 res!740437) b!1109527))

(assert (= (and b!1109527 res!740432) b!1109520))

(assert (= (and b!1109520 res!740428) b!1109528))

(assert (= (and b!1109528 res!740429) b!1109533))

(assert (= (and b!1109533 (not res!740431)) b!1109534))

(assert (= (and b!1109534 c!109179) b!1109524))

(assert (= (and b!1109534 (not c!109179)) b!1109522))

(assert (= (or b!1109524 b!1109522) bm!46669))

(assert (= (or b!1109524 b!1109522) bm!46668))

(assert (= (and b!1109532 condMapEmpty!43195) mapIsEmpty!43195))

(assert (= (and b!1109532 (not condMapEmpty!43195)) mapNonEmpty!43195))

(get-info :version)

(assert (= (and mapNonEmpty!43195 ((_ is ValueCellFull!13083) mapValue!43195)) b!1109521))

(assert (= (and b!1109532 ((_ is ValueCellFull!13083) mapDefault!43195)) b!1109519))

(assert (= start!97354 b!1109532))

(declare-fun b_lambda!18347 () Bool)

(assert (=> (not b_lambda!18347) (not bm!46669)))

(declare-fun t!34560 () Bool)

(declare-fun tb!8191 () Bool)

(assert (=> (and start!97354 (= defaultEntry!1004 defaultEntry!1004) t!34560) tb!8191))

(declare-fun result!16943 () Bool)

(assert (=> tb!8191 (= result!16943 tp_is_empty!27585)))

(assert (=> bm!46669 t!34560))

(declare-fun b_and!37487 () Bool)

(assert (= b_and!37485 (and (=> t!34560 result!16943) b_and!37487)))

(declare-fun m!1027777 () Bool)

(assert (=> b!1109531 m!1027777))

(declare-fun m!1027779 () Bool)

(assert (=> b!1109530 m!1027779))

(declare-fun m!1027781 () Bool)

(assert (=> b!1109529 m!1027781))

(declare-fun m!1027783 () Bool)

(assert (=> start!97354 m!1027783))

(declare-fun m!1027785 () Bool)

(assert (=> start!97354 m!1027785))

(declare-fun m!1027787 () Bool)

(assert (=> b!1109525 m!1027787))

(declare-fun m!1027789 () Bool)

(assert (=> bm!46668 m!1027789))

(declare-fun m!1027791 () Bool)

(assert (=> b!1109520 m!1027791))

(declare-fun m!1027793 () Bool)

(assert (=> b!1109520 m!1027793))

(declare-fun m!1027795 () Bool)

(assert (=> b!1109534 m!1027795))

(declare-fun m!1027797 () Bool)

(assert (=> mapNonEmpty!43195 m!1027797))

(declare-fun m!1027799 () Bool)

(assert (=> b!1109527 m!1027799))

(declare-fun m!1027801 () Bool)

(assert (=> b!1109524 m!1027801))

(declare-fun m!1027803 () Bool)

(assert (=> b!1109533 m!1027803))

(declare-fun m!1027805 () Bool)

(assert (=> b!1109533 m!1027805))

(declare-fun m!1027807 () Bool)

(assert (=> bm!46669 m!1027807))

(declare-fun m!1027809 () Bool)

(assert (=> bm!46669 m!1027809))

(declare-fun m!1027811 () Bool)

(assert (=> bm!46669 m!1027811))

(declare-fun m!1027813 () Bool)

(assert (=> b!1109528 m!1027813))

(check-sat (not bm!46669) (not b!1109520) (not start!97354) b_and!37487 (not bm!46668) (not b!1109533) (not b!1109530) (not b_next!23325) (not b!1109528) (not b!1109531) (not b!1109525) (not b!1109529) (not b!1109534) tp_is_empty!27585 (not b!1109524) (not mapNonEmpty!43195) (not b_lambda!18347))
(check-sat b_and!37487 (not b_next!23325))
