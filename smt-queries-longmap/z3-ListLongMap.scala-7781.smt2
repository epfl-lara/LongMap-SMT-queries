; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97424 () Bool)

(assert start!97424)

(declare-fun b_free!23401 () Bool)

(declare-fun b_next!23401 () Bool)

(assert (=> start!97424 (= b_free!23401 (not b_next!23401))))

(declare-fun tp!82501 () Bool)

(declare-fun b_and!37617 () Bool)

(assert (=> start!97424 (= tp!82501 b_and!37617)))

(declare-datatypes ((V!42009 0))(
  ( (V!42010 (val!13887 Int)) )
))
(declare-fun zeroValue!944 () V!42009)

(declare-fun bm!46873 () Bool)

(declare-datatypes ((array!72132 0))(
  ( (array!72133 (arr!34719 (Array (_ BitVec 32) (_ BitVec 64))) (size!35257 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72132)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17634 0))(
  ( (tuple2!17635 (_1!8828 (_ BitVec 64)) (_2!8828 V!42009)) )
))
(declare-datatypes ((List!24288 0))(
  ( (Nil!24285) (Cons!24284 (h!25493 tuple2!17634) (t!34726 List!24288)) )
))
(declare-datatypes ((ListLongMap!15603 0))(
  ( (ListLongMap!15604 (toList!7817 List!24288)) )
))
(declare-fun call!46877 () ListLongMap!15603)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13121 0))(
  ( (ValueCellFull!13121 (v!16519 V!42009)) (EmptyCell!13121) )
))
(declare-datatypes ((array!72134 0))(
  ( (array!72135 (arr!34720 (Array (_ BitVec 32) ValueCell!13121)) (size!35258 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72134)

(declare-fun minValue!944 () V!42009)

(declare-fun getCurrentListMapNoExtraKeys!4329 (array!72132 array!72134 (_ BitVec 32) (_ BitVec 32) V!42009 V!42009 (_ BitVec 32) Int) ListLongMap!15603)

(assert (=> bm!46873 (= call!46877 (getCurrentListMapNoExtraKeys!4329 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111302 () Bool)

(declare-fun e!633685 () Bool)

(declare-fun e!633687 () Bool)

(assert (=> b!1111302 (= e!633685 (not e!633687))))

(declare-fun res!741617 () Bool)

(assert (=> b!1111302 (=> res!741617 e!633687)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1111302 (= res!741617 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35257 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111302 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36285 0))(
  ( (Unit!36286) )
))
(declare-fun lt!496143 () Unit!36285)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72132 (_ BitVec 64) (_ BitVec 32)) Unit!36285)

(assert (=> b!1111302 (= lt!496143 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1111303 () Bool)

(declare-fun res!741620 () Bool)

(declare-fun e!633683 () Bool)

(assert (=> b!1111303 (=> (not res!741620) (not e!633683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72132 (_ BitVec 32)) Bool)

(assert (=> b!1111303 (= res!741620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1111304 () Bool)

(declare-fun e!633686 () Bool)

(declare-fun call!46876 () ListLongMap!15603)

(assert (=> b!1111304 (= e!633686 (= call!46876 call!46877))))

(declare-fun lt!496142 () array!72132)

(declare-fun bm!46874 () Bool)

(declare-fun dynLambda!2392 (Int (_ BitVec 64)) V!42009)

(assert (=> bm!46874 (= call!46876 (getCurrentListMapNoExtraKeys!4329 lt!496142 (array!72135 (store (arr!34720 _values!996) i!673 (ValueCellFull!13121 (dynLambda!2392 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35258 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111306 () Bool)

(declare-fun e!633690 () Bool)

(declare-fun tp_is_empty!27661 () Bool)

(assert (=> b!1111306 (= e!633690 tp_is_empty!27661)))

(declare-fun b!1111307 () Bool)

(declare-fun -!1030 (ListLongMap!15603 (_ BitVec 64)) ListLongMap!15603)

(assert (=> b!1111307 (= e!633686 (= call!46876 (-!1030 call!46877 k0!934)))))

(declare-fun b!1111308 () Bool)

(declare-fun e!633689 () Bool)

(assert (=> b!1111308 (= e!633689 tp_is_empty!27661)))

(declare-fun b!1111309 () Bool)

(declare-fun res!741622 () Bool)

(assert (=> b!1111309 (=> (not res!741622) (not e!633683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111309 (= res!741622 (validKeyInArray!0 k0!934))))

(declare-fun b!1111310 () Bool)

(declare-fun res!741614 () Bool)

(assert (=> b!1111310 (=> (not res!741614) (not e!633683))))

(assert (=> b!1111310 (= res!741614 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35257 _keys!1208))))))

(declare-fun mapIsEmpty!43309 () Bool)

(declare-fun mapRes!43309 () Bool)

(assert (=> mapIsEmpty!43309 mapRes!43309))

(declare-fun mapNonEmpty!43309 () Bool)

(declare-fun tp!82502 () Bool)

(assert (=> mapNonEmpty!43309 (= mapRes!43309 (and tp!82502 e!633689))))

(declare-fun mapRest!43309 () (Array (_ BitVec 32) ValueCell!13121))

(declare-fun mapValue!43309 () ValueCell!13121)

(declare-fun mapKey!43309 () (_ BitVec 32))

(assert (=> mapNonEmpty!43309 (= (arr!34720 _values!996) (store mapRest!43309 mapKey!43309 mapValue!43309))))

(declare-fun b!1111311 () Bool)

(declare-fun e!633684 () Bool)

(assert (=> b!1111311 (= e!633684 (and e!633690 mapRes!43309))))

(declare-fun condMapEmpty!43309 () Bool)

(declare-fun mapDefault!43309 () ValueCell!13121)

(assert (=> b!1111311 (= condMapEmpty!43309 (= (arr!34720 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13121)) mapDefault!43309)))))

(declare-fun b!1111312 () Bool)

(assert (=> b!1111312 (= e!633683 e!633685)))

(declare-fun res!741615 () Bool)

(assert (=> b!1111312 (=> (not res!741615) (not e!633685))))

(assert (=> b!1111312 (= res!741615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496142 mask!1564))))

(assert (=> b!1111312 (= lt!496142 (array!72133 (store (arr!34719 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35257 _keys!1208)))))

(declare-fun b!1111313 () Bool)

(declare-fun res!741621 () Bool)

(assert (=> b!1111313 (=> (not res!741621) (not e!633683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111313 (= res!741621 (validMask!0 mask!1564))))

(declare-fun b!1111314 () Bool)

(assert (=> b!1111314 (= e!633687 true)))

(assert (=> b!1111314 e!633686))

(declare-fun c!109272 () Bool)

(assert (=> b!1111314 (= c!109272 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496141 () Unit!36285)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!304 (array!72132 array!72134 (_ BitVec 32) (_ BitVec 32) V!42009 V!42009 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36285)

(assert (=> b!1111314 (= lt!496141 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!304 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111315 () Bool)

(declare-fun res!741616 () Bool)

(assert (=> b!1111315 (=> (not res!741616) (not e!633683))))

(declare-datatypes ((List!24289 0))(
  ( (Nil!24286) (Cons!24285 (h!25494 (_ BitVec 64)) (t!34727 List!24289)) )
))
(declare-fun arrayNoDuplicates!0 (array!72132 (_ BitVec 32) List!24289) Bool)

(assert (=> b!1111315 (= res!741616 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24286))))

(declare-fun b!1111316 () Bool)

(declare-fun res!741619 () Bool)

(assert (=> b!1111316 (=> (not res!741619) (not e!633685))))

(assert (=> b!1111316 (= res!741619 (arrayNoDuplicates!0 lt!496142 #b00000000000000000000000000000000 Nil!24286))))

(declare-fun b!1111317 () Bool)

(declare-fun res!741613 () Bool)

(assert (=> b!1111317 (=> (not res!741613) (not e!633683))))

(assert (=> b!1111317 (= res!741613 (and (= (size!35258 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35257 _keys!1208) (size!35258 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1111305 () Bool)

(declare-fun res!741618 () Bool)

(assert (=> b!1111305 (=> (not res!741618) (not e!633683))))

(assert (=> b!1111305 (= res!741618 (= (select (arr!34719 _keys!1208) i!673) k0!934))))

(declare-fun res!741612 () Bool)

(assert (=> start!97424 (=> (not res!741612) (not e!633683))))

(assert (=> start!97424 (= res!741612 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35257 _keys!1208))))))

(assert (=> start!97424 e!633683))

(assert (=> start!97424 tp_is_empty!27661))

(declare-fun array_inv!26764 (array!72132) Bool)

(assert (=> start!97424 (array_inv!26764 _keys!1208)))

(assert (=> start!97424 true))

(assert (=> start!97424 tp!82501))

(declare-fun array_inv!26765 (array!72134) Bool)

(assert (=> start!97424 (and (array_inv!26765 _values!996) e!633684)))

(assert (= (and start!97424 res!741612) b!1111313))

(assert (= (and b!1111313 res!741621) b!1111317))

(assert (= (and b!1111317 res!741613) b!1111303))

(assert (= (and b!1111303 res!741620) b!1111315))

(assert (= (and b!1111315 res!741616) b!1111310))

(assert (= (and b!1111310 res!741614) b!1111309))

(assert (= (and b!1111309 res!741622) b!1111305))

(assert (= (and b!1111305 res!741618) b!1111312))

(assert (= (and b!1111312 res!741615) b!1111316))

(assert (= (and b!1111316 res!741619) b!1111302))

(assert (= (and b!1111302 (not res!741617)) b!1111314))

(assert (= (and b!1111314 c!109272) b!1111307))

(assert (= (and b!1111314 (not c!109272)) b!1111304))

(assert (= (or b!1111307 b!1111304) bm!46874))

(assert (= (or b!1111307 b!1111304) bm!46873))

(assert (= (and b!1111311 condMapEmpty!43309) mapIsEmpty!43309))

(assert (= (and b!1111311 (not condMapEmpty!43309)) mapNonEmpty!43309))

(get-info :version)

(assert (= (and mapNonEmpty!43309 ((_ is ValueCellFull!13121) mapValue!43309)) b!1111308))

(assert (= (and b!1111311 ((_ is ValueCellFull!13121) mapDefault!43309)) b!1111306))

(assert (= start!97424 b!1111311))

(declare-fun b_lambda!18407 () Bool)

(assert (=> (not b_lambda!18407) (not bm!46874)))

(declare-fun t!34725 () Bool)

(declare-fun tb!8259 () Bool)

(assert (=> (and start!97424 (= defaultEntry!1004 defaultEntry!1004) t!34725) tb!8259))

(declare-fun result!17087 () Bool)

(assert (=> tb!8259 (= result!17087 tp_is_empty!27661)))

(assert (=> bm!46874 t!34725))

(declare-fun b_and!37619 () Bool)

(assert (= b_and!37617 (and (=> t!34725 result!17087) b_and!37619)))

(declare-fun m!1028595 () Bool)

(assert (=> bm!46873 m!1028595))

(declare-fun m!1028597 () Bool)

(assert (=> mapNonEmpty!43309 m!1028597))

(declare-fun m!1028599 () Bool)

(assert (=> bm!46874 m!1028599))

(declare-fun m!1028601 () Bool)

(assert (=> bm!46874 m!1028601))

(declare-fun m!1028603 () Bool)

(assert (=> bm!46874 m!1028603))

(declare-fun m!1028605 () Bool)

(assert (=> b!1111302 m!1028605))

(declare-fun m!1028607 () Bool)

(assert (=> b!1111302 m!1028607))

(declare-fun m!1028609 () Bool)

(assert (=> b!1111313 m!1028609))

(declare-fun m!1028611 () Bool)

(assert (=> b!1111307 m!1028611))

(declare-fun m!1028613 () Bool)

(assert (=> start!97424 m!1028613))

(declare-fun m!1028615 () Bool)

(assert (=> start!97424 m!1028615))

(declare-fun m!1028617 () Bool)

(assert (=> b!1111303 m!1028617))

(declare-fun m!1028619 () Bool)

(assert (=> b!1111315 m!1028619))

(declare-fun m!1028621 () Bool)

(assert (=> b!1111314 m!1028621))

(declare-fun m!1028623 () Bool)

(assert (=> b!1111316 m!1028623))

(declare-fun m!1028625 () Bool)

(assert (=> b!1111312 m!1028625))

(declare-fun m!1028627 () Bool)

(assert (=> b!1111312 m!1028627))

(declare-fun m!1028629 () Bool)

(assert (=> b!1111309 m!1028629))

(declare-fun m!1028631 () Bool)

(assert (=> b!1111305 m!1028631))

(check-sat (not b!1111303) (not b!1111312) (not b!1111302) (not start!97424) b_and!37619 (not b!1111313) (not b!1111309) (not bm!46874) (not b_lambda!18407) tp_is_empty!27661 (not b!1111307) (not b!1111314) (not b!1111316) (not mapNonEmpty!43309) (not b!1111315) (not bm!46873) (not b_next!23401))
(check-sat b_and!37619 (not b_next!23401))
