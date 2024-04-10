; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98080 () Bool)

(assert start!98080)

(declare-fun b_free!23781 () Bool)

(declare-fun b_next!23781 () Bool)

(assert (=> start!98080 (= b_free!23781 (not b_next!23781))))

(declare-fun tp!84046 () Bool)

(declare-fun b_and!38345 () Bool)

(assert (=> start!98080 (= tp!84046 b_and!38345)))

(declare-fun b!1126458 () Bool)

(declare-fun res!752734 () Bool)

(declare-fun e!641187 () Bool)

(assert (=> b!1126458 (=> (not res!752734) (not e!641187))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73485 0))(
  ( (array!73486 (arr!35395 (Array (_ BitVec 32) (_ BitVec 64))) (size!35931 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73485)

(assert (=> b!1126458 (= res!752734 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35931 _keys!1208))))))

(declare-fun b!1126459 () Bool)

(declare-fun e!641178 () Bool)

(declare-fun e!641185 () Bool)

(declare-fun mapRes!44284 () Bool)

(assert (=> b!1126459 (= e!641178 (and e!641185 mapRes!44284))))

(declare-fun condMapEmpty!44284 () Bool)

(declare-datatypes ((V!42875 0))(
  ( (V!42876 (val!14212 Int)) )
))
(declare-datatypes ((ValueCell!13446 0))(
  ( (ValueCellFull!13446 (v!16845 V!42875)) (EmptyCell!13446) )
))
(declare-datatypes ((array!73487 0))(
  ( (array!73488 (arr!35396 (Array (_ BitVec 32) ValueCell!13446)) (size!35932 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73487)

(declare-fun mapDefault!44284 () ValueCell!13446)

(assert (=> b!1126459 (= condMapEmpty!44284 (= (arr!35396 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13446)) mapDefault!44284)))))

(declare-fun b!1126460 () Bool)

(declare-fun e!641184 () Bool)

(assert (=> b!1126460 (= e!641187 e!641184)))

(declare-fun res!752731 () Bool)

(assert (=> b!1126460 (=> (not res!752731) (not e!641184))))

(declare-fun lt!500234 () array!73485)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73485 (_ BitVec 32)) Bool)

(assert (=> b!1126460 (= res!752731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500234 mask!1564))))

(assert (=> b!1126460 (= lt!500234 (array!73486 (store (arr!35395 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35931 _keys!1208)))))

(declare-fun e!641183 () Bool)

(declare-fun b!1126461 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((tuple2!17870 0))(
  ( (tuple2!17871 (_1!8946 (_ BitVec 64)) (_2!8946 V!42875)) )
))
(declare-datatypes ((List!24646 0))(
  ( (Nil!24643) (Cons!24642 (h!25851 tuple2!17870) (t!35419 List!24646)) )
))
(declare-datatypes ((ListLongMap!15839 0))(
  ( (ListLongMap!15840 (toList!7935 List!24646)) )
))
(declare-fun call!47625 () ListLongMap!15839)

(declare-fun call!47626 () ListLongMap!15839)

(declare-fun -!1129 (ListLongMap!15839 (_ BitVec 64)) ListLongMap!15839)

(assert (=> b!1126461 (= e!641183 (= call!47626 (-!1129 call!47625 k0!934)))))

(declare-fun mapNonEmpty!44284 () Bool)

(declare-fun tp!84047 () Bool)

(declare-fun e!641179 () Bool)

(assert (=> mapNonEmpty!44284 (= mapRes!44284 (and tp!84047 e!641179))))

(declare-fun mapRest!44284 () (Array (_ BitVec 32) ValueCell!13446))

(declare-fun mapKey!44284 () (_ BitVec 32))

(declare-fun mapValue!44284 () ValueCell!13446)

(assert (=> mapNonEmpty!44284 (= (arr!35396 _values!996) (store mapRest!44284 mapKey!44284 mapValue!44284))))

(declare-fun b!1126462 () Bool)

(assert (=> b!1126462 (= e!641183 (= call!47626 call!47625))))

(declare-fun b!1126463 () Bool)

(declare-fun e!641186 () Bool)

(assert (=> b!1126463 (= e!641184 (not e!641186))))

(declare-fun res!752735 () Bool)

(assert (=> b!1126463 (=> res!752735 e!641186)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1126463 (= res!752735 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126463 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36918 0))(
  ( (Unit!36919) )
))
(declare-fun lt!500232 () Unit!36918)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73485 (_ BitVec 64) (_ BitVec 32)) Unit!36918)

(assert (=> b!1126463 (= lt!500232 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1126465 () Bool)

(declare-fun res!752733 () Bool)

(assert (=> b!1126465 (=> (not res!752733) (not e!641187))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1126465 (= res!752733 (and (= (size!35932 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35931 _keys!1208) (size!35932 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1126466 () Bool)

(declare-fun tp_is_empty!28311 () Bool)

(assert (=> b!1126466 (= e!641185 tp_is_empty!28311)))

(declare-fun zeroValue!944 () V!42875)

(declare-fun bm!47622 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42875)

(declare-fun getCurrentListMapNoExtraKeys!4423 (array!73485 array!73487 (_ BitVec 32) (_ BitVec 32) V!42875 V!42875 (_ BitVec 32) Int) ListLongMap!15839)

(assert (=> bm!47622 (= call!47625 (getCurrentListMapNoExtraKeys!4423 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44284 () Bool)

(assert (=> mapIsEmpty!44284 mapRes!44284))

(declare-fun b!1126467 () Bool)

(declare-fun e!641180 () Bool)

(assert (=> b!1126467 (= e!641186 e!641180)))

(declare-fun res!752737 () Bool)

(assert (=> b!1126467 (=> res!752737 e!641180)))

(assert (=> b!1126467 (= res!752737 (not (= from!1455 i!673)))))

(declare-fun lt!500236 () ListLongMap!15839)

(declare-fun lt!500237 () array!73487)

(assert (=> b!1126467 (= lt!500236 (getCurrentListMapNoExtraKeys!4423 lt!500234 lt!500237 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2513 (Int (_ BitVec 64)) V!42875)

(assert (=> b!1126467 (= lt!500237 (array!73488 (store (arr!35396 _values!996) i!673 (ValueCellFull!13446 (dynLambda!2513 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35932 _values!996)))))

(declare-fun lt!500233 () ListLongMap!15839)

(assert (=> b!1126467 (= lt!500233 (getCurrentListMapNoExtraKeys!4423 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1126468 () Bool)

(declare-fun e!641182 () Bool)

(assert (=> b!1126468 (= e!641182 true)))

(declare-fun lt!500231 () Bool)

(declare-fun contains!6468 (ListLongMap!15839 (_ BitVec 64)) Bool)

(assert (=> b!1126468 (= lt!500231 (contains!6468 (getCurrentListMapNoExtraKeys!4423 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1126469 () Bool)

(declare-fun res!752732 () Bool)

(assert (=> b!1126469 (=> (not res!752732) (not e!641187))))

(assert (=> b!1126469 (= res!752732 (= (select (arr!35395 _keys!1208) i!673) k0!934))))

(declare-fun b!1126470 () Bool)

(declare-fun res!752739 () Bool)

(assert (=> b!1126470 (=> (not res!752739) (not e!641187))))

(declare-datatypes ((List!24647 0))(
  ( (Nil!24644) (Cons!24643 (h!25852 (_ BitVec 64)) (t!35420 List!24647)) )
))
(declare-fun arrayNoDuplicates!0 (array!73485 (_ BitVec 32) List!24647) Bool)

(assert (=> b!1126470 (= res!752739 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24644))))

(declare-fun b!1126471 () Bool)

(declare-fun res!752736 () Bool)

(assert (=> b!1126471 (=> (not res!752736) (not e!641187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126471 (= res!752736 (validMask!0 mask!1564))))

(declare-fun b!1126472 () Bool)

(declare-fun res!752738 () Bool)

(assert (=> b!1126472 (=> (not res!752738) (not e!641184))))

(assert (=> b!1126472 (= res!752738 (arrayNoDuplicates!0 lt!500234 #b00000000000000000000000000000000 Nil!24644))))

(declare-fun b!1126473 () Bool)

(assert (=> b!1126473 (= e!641180 e!641182)))

(declare-fun res!752743 () Bool)

(assert (=> b!1126473 (=> res!752743 e!641182)))

(assert (=> b!1126473 (= res!752743 (not (= (select (arr!35395 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1126473 e!641183))

(declare-fun c!109662 () Bool)

(assert (=> b!1126473 (= c!109662 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500235 () Unit!36918)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!380 (array!73485 array!73487 (_ BitVec 32) (_ BitVec 32) V!42875 V!42875 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36918)

(assert (=> b!1126473 (= lt!500235 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!380 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126464 () Bool)

(declare-fun res!752742 () Bool)

(assert (=> b!1126464 (=> (not res!752742) (not e!641187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126464 (= res!752742 (validKeyInArray!0 k0!934))))

(declare-fun res!752741 () Bool)

(assert (=> start!98080 (=> (not res!752741) (not e!641187))))

(assert (=> start!98080 (= res!752741 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35931 _keys!1208))))))

(assert (=> start!98080 e!641187))

(assert (=> start!98080 tp_is_empty!28311))

(declare-fun array_inv!27168 (array!73485) Bool)

(assert (=> start!98080 (array_inv!27168 _keys!1208)))

(assert (=> start!98080 true))

(assert (=> start!98080 tp!84046))

(declare-fun array_inv!27169 (array!73487) Bool)

(assert (=> start!98080 (and (array_inv!27169 _values!996) e!641178)))

(declare-fun b!1126474 () Bool)

(declare-fun res!752740 () Bool)

(assert (=> b!1126474 (=> (not res!752740) (not e!641187))))

(assert (=> b!1126474 (= res!752740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1126475 () Bool)

(assert (=> b!1126475 (= e!641179 tp_is_empty!28311)))

(declare-fun bm!47623 () Bool)

(assert (=> bm!47623 (= call!47626 (getCurrentListMapNoExtraKeys!4423 lt!500234 lt!500237 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98080 res!752741) b!1126471))

(assert (= (and b!1126471 res!752736) b!1126465))

(assert (= (and b!1126465 res!752733) b!1126474))

(assert (= (and b!1126474 res!752740) b!1126470))

(assert (= (and b!1126470 res!752739) b!1126458))

(assert (= (and b!1126458 res!752734) b!1126464))

(assert (= (and b!1126464 res!752742) b!1126469))

(assert (= (and b!1126469 res!752732) b!1126460))

(assert (= (and b!1126460 res!752731) b!1126472))

(assert (= (and b!1126472 res!752738) b!1126463))

(assert (= (and b!1126463 (not res!752735)) b!1126467))

(assert (= (and b!1126467 (not res!752737)) b!1126473))

(assert (= (and b!1126473 c!109662) b!1126461))

(assert (= (and b!1126473 (not c!109662)) b!1126462))

(assert (= (or b!1126461 b!1126462) bm!47623))

(assert (= (or b!1126461 b!1126462) bm!47622))

(assert (= (and b!1126473 (not res!752743)) b!1126468))

(assert (= (and b!1126459 condMapEmpty!44284) mapIsEmpty!44284))

(assert (= (and b!1126459 (not condMapEmpty!44284)) mapNonEmpty!44284))

(get-info :version)

(assert (= (and mapNonEmpty!44284 ((_ is ValueCellFull!13446) mapValue!44284)) b!1126475))

(assert (= (and b!1126459 ((_ is ValueCellFull!13446) mapDefault!44284)) b!1126466))

(assert (= start!98080 b!1126459))

(declare-fun b_lambda!18751 () Bool)

(assert (=> (not b_lambda!18751) (not b!1126467)))

(declare-fun t!35418 () Bool)

(declare-fun tb!8593 () Bool)

(assert (=> (and start!98080 (= defaultEntry!1004 defaultEntry!1004) t!35418) tb!8593))

(declare-fun result!17747 () Bool)

(assert (=> tb!8593 (= result!17747 tp_is_empty!28311)))

(assert (=> b!1126467 t!35418))

(declare-fun b_and!38347 () Bool)

(assert (= b_and!38345 (and (=> t!35418 result!17747) b_and!38347)))

(declare-fun m!1040419 () Bool)

(assert (=> start!98080 m!1040419))

(declare-fun m!1040421 () Bool)

(assert (=> start!98080 m!1040421))

(declare-fun m!1040423 () Bool)

(assert (=> b!1126470 m!1040423))

(declare-fun m!1040425 () Bool)

(assert (=> b!1126461 m!1040425))

(declare-fun m!1040427 () Bool)

(assert (=> mapNonEmpty!44284 m!1040427))

(declare-fun m!1040429 () Bool)

(assert (=> b!1126474 m!1040429))

(declare-fun m!1040431 () Bool)

(assert (=> b!1126460 m!1040431))

(declare-fun m!1040433 () Bool)

(assert (=> b!1126460 m!1040433))

(declare-fun m!1040435 () Bool)

(assert (=> bm!47622 m!1040435))

(declare-fun m!1040437 () Bool)

(assert (=> b!1126469 m!1040437))

(declare-fun m!1040439 () Bool)

(assert (=> b!1126472 m!1040439))

(declare-fun m!1040441 () Bool)

(assert (=> b!1126471 m!1040441))

(declare-fun m!1040443 () Bool)

(assert (=> b!1126473 m!1040443))

(declare-fun m!1040445 () Bool)

(assert (=> b!1126473 m!1040445))

(declare-fun m!1040447 () Bool)

(assert (=> b!1126464 m!1040447))

(declare-fun m!1040449 () Bool)

(assert (=> b!1126463 m!1040449))

(declare-fun m!1040451 () Bool)

(assert (=> b!1126463 m!1040451))

(assert (=> b!1126468 m!1040435))

(assert (=> b!1126468 m!1040435))

(declare-fun m!1040453 () Bool)

(assert (=> b!1126468 m!1040453))

(declare-fun m!1040455 () Bool)

(assert (=> bm!47623 m!1040455))

(declare-fun m!1040457 () Bool)

(assert (=> b!1126467 m!1040457))

(declare-fun m!1040459 () Bool)

(assert (=> b!1126467 m!1040459))

(declare-fun m!1040461 () Bool)

(assert (=> b!1126467 m!1040461))

(declare-fun m!1040463 () Bool)

(assert (=> b!1126467 m!1040463))

(check-sat (not bm!47622) (not mapNonEmpty!44284) (not b_lambda!18751) (not b!1126460) b_and!38347 (not start!98080) (not b!1126467) (not b!1126463) (not b!1126474) (not b!1126470) (not b_next!23781) (not bm!47623) (not b!1126464) (not b!1126468) (not b!1126461) tp_is_empty!28311 (not b!1126472) (not b!1126471) (not b!1126473))
(check-sat b_and!38347 (not b_next!23781))
