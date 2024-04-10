; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97366 () Bool)

(assert start!97366)

(declare-fun b_free!23337 () Bool)

(declare-fun b_next!23337 () Bool)

(assert (=> start!97366 (= b_free!23337 (not b_next!23337))))

(declare-fun tp!82309 () Bool)

(declare-fun b_and!37509 () Bool)

(assert (=> start!97366 (= tp!82309 b_and!37509)))

(declare-fun b!1109819 () Bool)

(declare-fun e!632994 () Bool)

(declare-datatypes ((V!41923 0))(
  ( (V!41924 (val!13855 Int)) )
))
(declare-datatypes ((tuple2!17518 0))(
  ( (tuple2!17519 (_1!8770 (_ BitVec 64)) (_2!8770 V!41923)) )
))
(declare-datatypes ((List!24201 0))(
  ( (Nil!24198) (Cons!24197 (h!25406 tuple2!17518) (t!34584 List!24201)) )
))
(declare-datatypes ((ListLongMap!15487 0))(
  ( (ListLongMap!15488 (toList!7759 List!24201)) )
))
(declare-fun call!46707 () ListLongMap!15487)

(declare-fun call!46708 () ListLongMap!15487)

(assert (=> b!1109819 (= e!632994 (= call!46707 call!46708))))

(declare-fun b!1109820 () Bool)

(declare-fun res!740629 () Bool)

(declare-fun e!632992 () Bool)

(assert (=> b!1109820 (=> (not res!740629) (not e!632992))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109820 (= res!740629 (validKeyInArray!0 k0!934))))

(declare-fun b!1109821 () Bool)

(declare-fun e!632997 () Bool)

(assert (=> b!1109821 (= e!632992 e!632997)))

(declare-fun res!740630 () Bool)

(assert (=> b!1109821 (=> (not res!740630) (not e!632997))))

(declare-datatypes ((array!72111 0))(
  ( (array!72112 (arr!34708 (Array (_ BitVec 32) (_ BitVec 64))) (size!35244 (_ BitVec 32))) )
))
(declare-fun lt!496053 () array!72111)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72111 (_ BitVec 32)) Bool)

(assert (=> b!1109821 (= res!740630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496053 mask!1564))))

(declare-fun _keys!1208 () array!72111)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1109821 (= lt!496053 (array!72112 (store (arr!34708 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35244 _keys!1208)))))

(declare-fun b!1109822 () Bool)

(declare-fun res!740625 () Bool)

(assert (=> b!1109822 (=> (not res!740625) (not e!632992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109822 (= res!740625 (validMask!0 mask!1564))))

(declare-fun b!1109823 () Bool)

(declare-fun e!632996 () Bool)

(declare-fun e!632995 () Bool)

(declare-fun mapRes!43213 () Bool)

(assert (=> b!1109823 (= e!632996 (and e!632995 mapRes!43213))))

(declare-fun condMapEmpty!43213 () Bool)

(declare-datatypes ((ValueCell!13089 0))(
  ( (ValueCellFull!13089 (v!16488 V!41923)) (EmptyCell!13089) )
))
(declare-datatypes ((array!72113 0))(
  ( (array!72114 (arr!34709 (Array (_ BitVec 32) ValueCell!13089)) (size!35245 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72113)

(declare-fun mapDefault!43213 () ValueCell!13089)

(assert (=> b!1109823 (= condMapEmpty!43213 (= (arr!34709 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13089)) mapDefault!43213)))))

(declare-fun zeroValue!944 () V!41923)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!41923)

(declare-fun bm!46704 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4253 (array!72111 array!72113 (_ BitVec 32) (_ BitVec 32) V!41923 V!41923 (_ BitVec 32) Int) ListLongMap!15487)

(declare-fun dynLambda!2382 (Int (_ BitVec 64)) V!41923)

(assert (=> bm!46704 (= call!46707 (getCurrentListMapNoExtraKeys!4253 lt!496053 (array!72114 (store (arr!34709 _values!996) i!673 (ValueCellFull!13089 (dynLambda!2382 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35245 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109824 () Bool)

(declare-fun res!740626 () Bool)

(assert (=> b!1109824 (=> (not res!740626) (not e!632997))))

(declare-datatypes ((List!24202 0))(
  ( (Nil!24199) (Cons!24198 (h!25407 (_ BitVec 64)) (t!34585 List!24202)) )
))
(declare-fun arrayNoDuplicates!0 (array!72111 (_ BitVec 32) List!24202) Bool)

(assert (=> b!1109824 (= res!740626 (arrayNoDuplicates!0 lt!496053 #b00000000000000000000000000000000 Nil!24199))))

(declare-fun mapIsEmpty!43213 () Bool)

(assert (=> mapIsEmpty!43213 mapRes!43213))

(declare-fun b!1109825 () Bool)

(declare-fun res!740632 () Bool)

(assert (=> b!1109825 (=> (not res!740632) (not e!632992))))

(assert (=> b!1109825 (= res!740632 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35244 _keys!1208))))))

(declare-fun bm!46705 () Bool)

(assert (=> bm!46705 (= call!46708 (getCurrentListMapNoExtraKeys!4253 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109826 () Bool)

(declare-fun -!1034 (ListLongMap!15487 (_ BitVec 64)) ListLongMap!15487)

(assert (=> b!1109826 (= e!632994 (= call!46707 (-!1034 call!46708 k0!934)))))

(declare-fun b!1109827 () Bool)

(declare-fun e!632993 () Bool)

(declare-fun tp_is_empty!27597 () Bool)

(assert (=> b!1109827 (= e!632993 tp_is_empty!27597)))

(declare-fun res!740633 () Bool)

(assert (=> start!97366 (=> (not res!740633) (not e!632992))))

(assert (=> start!97366 (= res!740633 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35244 _keys!1208))))))

(assert (=> start!97366 e!632992))

(assert (=> start!97366 tp_is_empty!27597))

(declare-fun array_inv!26710 (array!72111) Bool)

(assert (=> start!97366 (array_inv!26710 _keys!1208)))

(assert (=> start!97366 true))

(assert (=> start!97366 tp!82309))

(declare-fun array_inv!26711 (array!72113) Bool)

(assert (=> start!97366 (and (array_inv!26711 _values!996) e!632996)))

(declare-fun b!1109828 () Bool)

(declare-fun e!632990 () Bool)

(assert (=> b!1109828 (= e!632990 true)))

(assert (=> b!1109828 e!632994))

(declare-fun c!109197 () Bool)

(assert (=> b!1109828 (= c!109197 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36424 0))(
  ( (Unit!36425) )
))
(declare-fun lt!496054 () Unit!36424)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!281 (array!72111 array!72113 (_ BitVec 32) (_ BitVec 32) V!41923 V!41923 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36424)

(assert (=> b!1109828 (= lt!496054 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!281 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109829 () Bool)

(declare-fun res!740627 () Bool)

(assert (=> b!1109829 (=> (not res!740627) (not e!632992))))

(assert (=> b!1109829 (= res!740627 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24199))))

(declare-fun b!1109830 () Bool)

(declare-fun res!740631 () Bool)

(assert (=> b!1109830 (=> (not res!740631) (not e!632992))))

(assert (=> b!1109830 (= res!740631 (and (= (size!35245 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35244 _keys!1208) (size!35245 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1109831 () Bool)

(declare-fun res!740635 () Bool)

(assert (=> b!1109831 (=> (not res!740635) (not e!632992))))

(assert (=> b!1109831 (= res!740635 (= (select (arr!34708 _keys!1208) i!673) k0!934))))

(declare-fun b!1109832 () Bool)

(assert (=> b!1109832 (= e!632995 tp_is_empty!27597)))

(declare-fun b!1109833 () Bool)

(declare-fun res!740634 () Bool)

(assert (=> b!1109833 (=> (not res!740634) (not e!632992))))

(assert (=> b!1109833 (= res!740634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109834 () Bool)

(assert (=> b!1109834 (= e!632997 (not e!632990))))

(declare-fun res!740628 () Bool)

(assert (=> b!1109834 (=> res!740628 e!632990)))

(assert (=> b!1109834 (= res!740628 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35244 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109834 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!496055 () Unit!36424)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72111 (_ BitVec 64) (_ BitVec 32)) Unit!36424)

(assert (=> b!1109834 (= lt!496055 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!43213 () Bool)

(declare-fun tp!82310 () Bool)

(assert (=> mapNonEmpty!43213 (= mapRes!43213 (and tp!82310 e!632993))))

(declare-fun mapKey!43213 () (_ BitVec 32))

(declare-fun mapRest!43213 () (Array (_ BitVec 32) ValueCell!13089))

(declare-fun mapValue!43213 () ValueCell!13089)

(assert (=> mapNonEmpty!43213 (= (arr!34709 _values!996) (store mapRest!43213 mapKey!43213 mapValue!43213))))

(assert (= (and start!97366 res!740633) b!1109822))

(assert (= (and b!1109822 res!740625) b!1109830))

(assert (= (and b!1109830 res!740631) b!1109833))

(assert (= (and b!1109833 res!740634) b!1109829))

(assert (= (and b!1109829 res!740627) b!1109825))

(assert (= (and b!1109825 res!740632) b!1109820))

(assert (= (and b!1109820 res!740629) b!1109831))

(assert (= (and b!1109831 res!740635) b!1109821))

(assert (= (and b!1109821 res!740630) b!1109824))

(assert (= (and b!1109824 res!740626) b!1109834))

(assert (= (and b!1109834 (not res!740628)) b!1109828))

(assert (= (and b!1109828 c!109197) b!1109826))

(assert (= (and b!1109828 (not c!109197)) b!1109819))

(assert (= (or b!1109826 b!1109819) bm!46704))

(assert (= (or b!1109826 b!1109819) bm!46705))

(assert (= (and b!1109823 condMapEmpty!43213) mapIsEmpty!43213))

(assert (= (and b!1109823 (not condMapEmpty!43213)) mapNonEmpty!43213))

(get-info :version)

(assert (= (and mapNonEmpty!43213 ((_ is ValueCellFull!13089) mapValue!43213)) b!1109827))

(assert (= (and b!1109823 ((_ is ValueCellFull!13089) mapDefault!43213)) b!1109832))

(assert (= start!97366 b!1109823))

(declare-fun b_lambda!18359 () Bool)

(assert (=> (not b_lambda!18359) (not bm!46704)))

(declare-fun t!34583 () Bool)

(declare-fun tb!8203 () Bool)

(assert (=> (and start!97366 (= defaultEntry!1004 defaultEntry!1004) t!34583) tb!8203))

(declare-fun result!16967 () Bool)

(assert (=> tb!8203 (= result!16967 tp_is_empty!27597)))

(assert (=> bm!46704 t!34583))

(declare-fun b_and!37511 () Bool)

(assert (= b_and!37509 (and (=> t!34583 result!16967) b_and!37511)))

(declare-fun m!1028005 () Bool)

(assert (=> b!1109829 m!1028005))

(declare-fun m!1028007 () Bool)

(assert (=> mapNonEmpty!43213 m!1028007))

(declare-fun m!1028009 () Bool)

(assert (=> b!1109824 m!1028009))

(declare-fun m!1028011 () Bool)

(assert (=> b!1109822 m!1028011))

(declare-fun m!1028013 () Bool)

(assert (=> b!1109828 m!1028013))

(declare-fun m!1028015 () Bool)

(assert (=> b!1109833 m!1028015))

(declare-fun m!1028017 () Bool)

(assert (=> start!97366 m!1028017))

(declare-fun m!1028019 () Bool)

(assert (=> start!97366 m!1028019))

(declare-fun m!1028021 () Bool)

(assert (=> b!1109834 m!1028021))

(declare-fun m!1028023 () Bool)

(assert (=> b!1109834 m!1028023))

(declare-fun m!1028025 () Bool)

(assert (=> bm!46705 m!1028025))

(declare-fun m!1028027 () Bool)

(assert (=> b!1109826 m!1028027))

(declare-fun m!1028029 () Bool)

(assert (=> b!1109820 m!1028029))

(declare-fun m!1028031 () Bool)

(assert (=> bm!46704 m!1028031))

(declare-fun m!1028033 () Bool)

(assert (=> bm!46704 m!1028033))

(declare-fun m!1028035 () Bool)

(assert (=> bm!46704 m!1028035))

(declare-fun m!1028037 () Bool)

(assert (=> b!1109831 m!1028037))

(declare-fun m!1028039 () Bool)

(assert (=> b!1109821 m!1028039))

(declare-fun m!1028041 () Bool)

(assert (=> b!1109821 m!1028041))

(check-sat (not b_lambda!18359) (not b!1109828) (not b!1109834) (not b!1109821) b_and!37511 (not b_next!23337) (not bm!46705) (not b!1109826) (not bm!46704) (not b!1109822) (not b!1109833) (not b!1109824) (not b!1109820) tp_is_empty!27597 (not b!1109829) (not mapNonEmpty!43213) (not start!97366))
(check-sat b_and!37511 (not b_next!23337))
