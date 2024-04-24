; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97570 () Bool)

(assert start!97570)

(declare-fun b_free!23305 () Bool)

(declare-fun b_next!23305 () Bool)

(assert (=> start!97570 (= b_free!23305 (not b_next!23305))))

(declare-fun tp!82214 () Bool)

(declare-fun b_and!37453 () Bool)

(assert (=> start!97570 (= tp!82214 b_and!37453)))

(declare-fun b!1110334 () Bool)

(declare-fun res!740628 () Bool)

(declare-fun e!633456 () Bool)

(assert (=> b!1110334 (=> (not res!740628) (not e!633456))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110334 (= res!740628 (validKeyInArray!0 k0!934))))

(declare-fun res!740629 () Bool)

(assert (=> start!97570 (=> (not res!740629) (not e!633456))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72081 0))(
  ( (array!72082 (arr!34687 (Array (_ BitVec 32) (_ BitVec 64))) (size!35224 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72081)

(assert (=> start!97570 (= res!740629 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35224 _keys!1208))))))

(assert (=> start!97570 e!633456))

(declare-fun tp_is_empty!27565 () Bool)

(assert (=> start!97570 tp_is_empty!27565))

(declare-fun array_inv!26724 (array!72081) Bool)

(assert (=> start!97570 (array_inv!26724 _keys!1208)))

(assert (=> start!97570 true))

(assert (=> start!97570 tp!82214))

(declare-datatypes ((V!41881 0))(
  ( (V!41882 (val!13839 Int)) )
))
(declare-datatypes ((ValueCell!13073 0))(
  ( (ValueCellFull!13073 (v!16468 V!41881)) (EmptyCell!13073) )
))
(declare-datatypes ((array!72083 0))(
  ( (array!72084 (arr!34688 (Array (_ BitVec 32) ValueCell!13073)) (size!35225 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72083)

(declare-fun e!633458 () Bool)

(declare-fun array_inv!26725 (array!72083) Bool)

(assert (=> start!97570 (and (array_inv!26725 _values!996) e!633458)))

(declare-fun b!1110335 () Bool)

(declare-fun res!740620 () Bool)

(declare-fun e!633461 () Bool)

(assert (=> b!1110335 (=> (not res!740620) (not e!633461))))

(declare-fun lt!496425 () array!72081)

(declare-datatypes ((List!24186 0))(
  ( (Nil!24183) (Cons!24182 (h!25400 (_ BitVec 64)) (t!34529 List!24186)) )
))
(declare-fun arrayNoDuplicates!0 (array!72081 (_ BitVec 32) List!24186) Bool)

(assert (=> b!1110335 (= res!740620 (arrayNoDuplicates!0 lt!496425 #b00000000000000000000000000000000 Nil!24183))))

(declare-fun b!1110336 () Bool)

(declare-fun res!740619 () Bool)

(assert (=> b!1110336 (=> (not res!740619) (not e!633456))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1110336 (= res!740619 (and (= (size!35225 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35224 _keys!1208) (size!35225 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110337 () Bool)

(declare-fun e!633462 () Bool)

(assert (=> b!1110337 (= e!633462 tp_is_empty!27565)))

(declare-fun b!1110338 () Bool)

(declare-fun e!633460 () Bool)

(assert (=> b!1110338 (= e!633460 tp_is_empty!27565)))

(declare-fun mapNonEmpty!43165 () Bool)

(declare-fun mapRes!43165 () Bool)

(declare-fun tp!82213 () Bool)

(assert (=> mapNonEmpty!43165 (= mapRes!43165 (and tp!82213 e!633462))))

(declare-fun mapRest!43165 () (Array (_ BitVec 32) ValueCell!13073))

(declare-fun mapValue!43165 () ValueCell!13073)

(declare-fun mapKey!43165 () (_ BitVec 32))

(assert (=> mapNonEmpty!43165 (= (arr!34688 _values!996) (store mapRest!43165 mapKey!43165 mapValue!43165))))

(declare-fun zeroValue!944 () V!41881)

(declare-datatypes ((tuple2!17500 0))(
  ( (tuple2!17501 (_1!8761 (_ BitVec 64)) (_2!8761 V!41881)) )
))
(declare-datatypes ((List!24187 0))(
  ( (Nil!24184) (Cons!24183 (h!25401 tuple2!17500) (t!34530 List!24187)) )
))
(declare-datatypes ((ListLongMap!15477 0))(
  ( (ListLongMap!15478 (toList!7754 List!24187)) )
))
(declare-fun call!46678 () ListLongMap!15477)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46675 () Bool)

(declare-fun minValue!944 () V!41881)

(declare-fun getCurrentListMapNoExtraKeys!4289 (array!72081 array!72083 (_ BitVec 32) (_ BitVec 32) V!41881 V!41881 (_ BitVec 32) Int) ListLongMap!15477)

(assert (=> bm!46675 (= call!46678 (getCurrentListMapNoExtraKeys!4289 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110339 () Bool)

(declare-fun res!740622 () Bool)

(assert (=> b!1110339 (=> (not res!740622) (not e!633456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72081 (_ BitVec 32)) Bool)

(assert (=> b!1110339 (= res!740622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1110340 () Bool)

(declare-fun res!740621 () Bool)

(assert (=> b!1110340 (=> (not res!740621) (not e!633456))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110340 (= res!740621 (= (select (arr!34687 _keys!1208) i!673) k0!934))))

(declare-fun b!1110341 () Bool)

(declare-fun e!633459 () Bool)

(declare-fun call!46679 () ListLongMap!15477)

(declare-fun -!1010 (ListLongMap!15477 (_ BitVec 64)) ListLongMap!15477)

(assert (=> b!1110341 (= e!633459 (= call!46679 (-!1010 call!46678 k0!934)))))

(declare-fun b!1110342 () Bool)

(assert (=> b!1110342 (= e!633458 (and e!633460 mapRes!43165))))

(declare-fun condMapEmpty!43165 () Bool)

(declare-fun mapDefault!43165 () ValueCell!13073)

(assert (=> b!1110342 (= condMapEmpty!43165 (= (arr!34688 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13073)) mapDefault!43165)))))

(declare-fun bm!46676 () Bool)

(declare-fun dynLambda!2402 (Int (_ BitVec 64)) V!41881)

(assert (=> bm!46676 (= call!46679 (getCurrentListMapNoExtraKeys!4289 lt!496425 (array!72084 (store (arr!34688 _values!996) i!673 (ValueCellFull!13073 (dynLambda!2402 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35225 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43165 () Bool)

(assert (=> mapIsEmpty!43165 mapRes!43165))

(declare-fun b!1110343 () Bool)

(declare-fun e!633457 () Bool)

(assert (=> b!1110343 (= e!633461 (not e!633457))))

(declare-fun res!740625 () Bool)

(assert (=> b!1110343 (=> res!740625 e!633457)))

(assert (=> b!1110343 (= res!740625 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35224 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110343 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36373 0))(
  ( (Unit!36374) )
))
(declare-fun lt!496424 () Unit!36373)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72081 (_ BitVec 64) (_ BitVec 32)) Unit!36373)

(assert (=> b!1110343 (= lt!496424 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1110344 () Bool)

(assert (=> b!1110344 (= e!633459 (= call!46679 call!46678))))

(declare-fun b!1110345 () Bool)

(declare-fun res!740624 () Bool)

(assert (=> b!1110345 (=> (not res!740624) (not e!633456))))

(assert (=> b!1110345 (= res!740624 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24183))))

(declare-fun b!1110346 () Bool)

(declare-fun res!740626 () Bool)

(assert (=> b!1110346 (=> (not res!740626) (not e!633456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110346 (= res!740626 (validMask!0 mask!1564))))

(declare-fun b!1110347 () Bool)

(declare-fun res!740627 () Bool)

(assert (=> b!1110347 (=> (not res!740627) (not e!633456))))

(assert (=> b!1110347 (= res!740627 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35224 _keys!1208))))))

(declare-fun b!1110348 () Bool)

(assert (=> b!1110348 (= e!633456 e!633461)))

(declare-fun res!740623 () Bool)

(assert (=> b!1110348 (=> (not res!740623) (not e!633461))))

(assert (=> b!1110348 (= res!740623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496425 mask!1564))))

(assert (=> b!1110348 (= lt!496425 (array!72082 (store (arr!34687 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35224 _keys!1208)))))

(declare-fun b!1110349 () Bool)

(assert (=> b!1110349 (= e!633457 true)))

(assert (=> b!1110349 e!633459))

(declare-fun c!109553 () Bool)

(assert (=> b!1110349 (= c!109553 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496426 () Unit!36373)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!281 (array!72081 array!72083 (_ BitVec 32) (_ BitVec 32) V!41881 V!41881 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36373)

(assert (=> b!1110349 (= lt!496426 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!281 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97570 res!740629) b!1110346))

(assert (= (and b!1110346 res!740626) b!1110336))

(assert (= (and b!1110336 res!740619) b!1110339))

(assert (= (and b!1110339 res!740622) b!1110345))

(assert (= (and b!1110345 res!740624) b!1110347))

(assert (= (and b!1110347 res!740627) b!1110334))

(assert (= (and b!1110334 res!740628) b!1110340))

(assert (= (and b!1110340 res!740621) b!1110348))

(assert (= (and b!1110348 res!740623) b!1110335))

(assert (= (and b!1110335 res!740620) b!1110343))

(assert (= (and b!1110343 (not res!740625)) b!1110349))

(assert (= (and b!1110349 c!109553) b!1110341))

(assert (= (and b!1110349 (not c!109553)) b!1110344))

(assert (= (or b!1110341 b!1110344) bm!46675))

(assert (= (or b!1110341 b!1110344) bm!46676))

(assert (= (and b!1110342 condMapEmpty!43165) mapIsEmpty!43165))

(assert (= (and b!1110342 (not condMapEmpty!43165)) mapNonEmpty!43165))

(get-info :version)

(assert (= (and mapNonEmpty!43165 ((_ is ValueCellFull!13073) mapValue!43165)) b!1110337))

(assert (= (and b!1110342 ((_ is ValueCellFull!13073) mapDefault!43165)) b!1110338))

(assert (= start!97570 b!1110342))

(declare-fun b_lambda!18335 () Bool)

(assert (=> (not b_lambda!18335) (not bm!46676)))

(declare-fun t!34528 () Bool)

(declare-fun tb!8163 () Bool)

(assert (=> (and start!97570 (= defaultEntry!1004 defaultEntry!1004) t!34528) tb!8163))

(declare-fun result!16895 () Bool)

(assert (=> tb!8163 (= result!16895 tp_is_empty!27565)))

(assert (=> bm!46676 t!34528))

(declare-fun b_and!37455 () Bool)

(assert (= b_and!37453 (and (=> t!34528 result!16895) b_and!37455)))

(declare-fun m!1029069 () Bool)

(assert (=> bm!46675 m!1029069))

(declare-fun m!1029071 () Bool)

(assert (=> b!1110339 m!1029071))

(declare-fun m!1029073 () Bool)

(assert (=> b!1110334 m!1029073))

(declare-fun m!1029075 () Bool)

(assert (=> b!1110343 m!1029075))

(declare-fun m!1029077 () Bool)

(assert (=> b!1110343 m!1029077))

(declare-fun m!1029079 () Bool)

(assert (=> b!1110348 m!1029079))

(declare-fun m!1029081 () Bool)

(assert (=> b!1110348 m!1029081))

(declare-fun m!1029083 () Bool)

(assert (=> b!1110345 m!1029083))

(declare-fun m!1029085 () Bool)

(assert (=> b!1110346 m!1029085))

(declare-fun m!1029087 () Bool)

(assert (=> b!1110341 m!1029087))

(declare-fun m!1029089 () Bool)

(assert (=> start!97570 m!1029089))

(declare-fun m!1029091 () Bool)

(assert (=> start!97570 m!1029091))

(declare-fun m!1029093 () Bool)

(assert (=> mapNonEmpty!43165 m!1029093))

(declare-fun m!1029095 () Bool)

(assert (=> b!1110340 m!1029095))

(declare-fun m!1029097 () Bool)

(assert (=> bm!46676 m!1029097))

(declare-fun m!1029099 () Bool)

(assert (=> bm!46676 m!1029099))

(declare-fun m!1029101 () Bool)

(assert (=> bm!46676 m!1029101))

(declare-fun m!1029103 () Bool)

(assert (=> b!1110349 m!1029103))

(declare-fun m!1029105 () Bool)

(assert (=> b!1110335 m!1029105))

(check-sat (not b!1110335) (not b!1110346) (not b!1110343) (not b!1110349) (not b!1110339) (not b!1110345) (not bm!46676) (not start!97570) tp_is_empty!27565 (not b!1110334) (not b!1110348) (not bm!46675) (not b_lambda!18335) (not b!1110341) (not b_next!23305) b_and!37455 (not mapNonEmpty!43165))
(check-sat b_and!37455 (not b_next!23305))
