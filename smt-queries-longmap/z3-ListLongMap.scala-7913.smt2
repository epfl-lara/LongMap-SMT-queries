; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98224 () Bool)

(assert start!98224)

(declare-fun b_free!23925 () Bool)

(declare-fun b_next!23925 () Bool)

(assert (=> start!98224 (= b_free!23925 (not b_next!23925))))

(declare-fun tp!84478 () Bool)

(declare-fun b_and!38633 () Bool)

(assert (=> start!98224 (= tp!84478 b_and!38633)))

(declare-fun bm!48570 () Bool)

(declare-fun call!48573 () Bool)

(declare-fun call!48578 () Bool)

(assert (=> bm!48570 (= call!48573 call!48578)))

(declare-fun b!1131196 () Bool)

(declare-fun e!643775 () Bool)

(declare-fun e!643777 () Bool)

(assert (=> b!1131196 (= e!643775 e!643777)))

(declare-fun res!755739 () Bool)

(assert (=> b!1131196 (=> (not res!755739) (not e!643777))))

(declare-datatypes ((array!73767 0))(
  ( (array!73768 (arr!35536 (Array (_ BitVec 32) (_ BitVec 64))) (size!36072 (_ BitVec 32))) )
))
(declare-fun lt!502424 () array!73767)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73767 (_ BitVec 32)) Bool)

(assert (=> b!1131196 (= res!755739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502424 mask!1564))))

(declare-fun _keys!1208 () array!73767)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1131196 (= lt!502424 (array!73768 (store (arr!35536 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36072 _keys!1208)))))

(declare-fun b!1131197 () Bool)

(declare-datatypes ((Unit!37057 0))(
  ( (Unit!37058) )
))
(declare-fun e!643780 () Unit!37057)

(declare-fun lt!502416 () Unit!37057)

(assert (=> b!1131197 (= e!643780 lt!502416)))

(declare-fun lt!502418 () Unit!37057)

(declare-fun call!48577 () Unit!37057)

(assert (=> b!1131197 (= lt!502418 call!48577)))

(declare-datatypes ((V!43067 0))(
  ( (V!43068 (val!14284 Int)) )
))
(declare-datatypes ((tuple2!18002 0))(
  ( (tuple2!18003 (_1!9012 (_ BitVec 64)) (_2!9012 V!43067)) )
))
(declare-datatypes ((List!24766 0))(
  ( (Nil!24763) (Cons!24762 (h!25971 tuple2!18002) (t!35683 List!24766)) )
))
(declare-datatypes ((ListLongMap!15971 0))(
  ( (ListLongMap!15972 (toList!8001 List!24766)) )
))
(declare-fun lt!502414 () ListLongMap!15971)

(declare-fun call!48576 () ListLongMap!15971)

(assert (=> b!1131197 (= lt!502414 call!48576)))

(assert (=> b!1131197 call!48578))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!43067)

(declare-fun addStillContains!710 (ListLongMap!15971 (_ BitVec 64) V!43067 (_ BitVec 64)) Unit!37057)

(assert (=> b!1131197 (= lt!502416 (addStillContains!710 lt!502414 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun contains!6523 (ListLongMap!15971 (_ BitVec 64)) Bool)

(declare-fun +!3446 (ListLongMap!15971 tuple2!18002) ListLongMap!15971)

(assert (=> b!1131197 (contains!6523 (+!3446 lt!502414 (tuple2!18003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun zeroValue!944 () V!43067)

(declare-fun c!110137 () Bool)

(declare-fun bm!48571 () Bool)

(declare-fun lt!502421 () ListLongMap!15971)

(declare-fun c!110138 () Bool)

(assert (=> bm!48571 (= call!48576 (+!3446 lt!502421 (ite (or c!110138 c!110137) (tuple2!18003 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18003 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1131198 () Bool)

(declare-fun res!755737 () Bool)

(assert (=> b!1131198 (=> (not res!755737) (not e!643775))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13518 0))(
  ( (ValueCellFull!13518 (v!16917 V!43067)) (EmptyCell!13518) )
))
(declare-datatypes ((array!73769 0))(
  ( (array!73770 (arr!35537 (Array (_ BitVec 32) ValueCell!13518)) (size!36073 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73769)

(assert (=> b!1131198 (= res!755737 (and (= (size!36073 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36072 _keys!1208) (size!36073 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1131199 () Bool)

(declare-fun res!755743 () Bool)

(assert (=> b!1131199 (=> (not res!755743) (not e!643775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1131199 (= res!755743 (validKeyInArray!0 k0!934))))

(declare-fun bm!48572 () Bool)

(declare-fun call!48579 () Unit!37057)

(assert (=> bm!48572 (= call!48579 call!48577)))

(declare-fun bm!48573 () Bool)

(declare-fun call!48574 () ListLongMap!15971)

(assert (=> bm!48573 (= call!48578 (contains!6523 (ite c!110138 lt!502414 call!48574) k0!934))))

(declare-fun b!1131201 () Bool)

(declare-fun e!643773 () Bool)

(declare-fun e!643781 () Bool)

(assert (=> b!1131201 (= e!643773 e!643781)))

(declare-fun res!755732 () Bool)

(assert (=> b!1131201 (=> res!755732 e!643781)))

(assert (=> b!1131201 (= res!755732 (not (contains!6523 lt!502421 k0!934)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4488 (array!73767 array!73769 (_ BitVec 32) (_ BitVec 32) V!43067 V!43067 (_ BitVec 32) Int) ListLongMap!15971)

(assert (=> b!1131201 (= lt!502421 (getCurrentListMapNoExtraKeys!4488 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131202 () Bool)

(declare-fun e!643770 () Bool)

(assert (=> b!1131202 (= e!643770 true)))

(declare-fun lt!502419 () Bool)

(declare-fun getCurrentListMap!4431 (array!73767 array!73769 (_ BitVec 32) (_ BitVec 32) V!43067 V!43067 (_ BitVec 32) Int) ListLongMap!15971)

(assert (=> b!1131202 (= lt!502419 (contains!6523 (getCurrentListMap!4431 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1131203 () Bool)

(declare-fun res!755734 () Bool)

(assert (=> b!1131203 (=> (not res!755734) (not e!643775))))

(assert (=> b!1131203 (= res!755734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1131204 () Bool)

(declare-fun res!755741 () Bool)

(assert (=> b!1131204 (=> (not res!755741) (not e!643775))))

(assert (=> b!1131204 (= res!755741 (= (select (arr!35536 _keys!1208) i!673) k0!934))))

(declare-fun b!1131205 () Bool)

(declare-fun e!643774 () Unit!37057)

(declare-fun Unit!37059 () Unit!37057)

(assert (=> b!1131205 (= e!643774 Unit!37059)))

(declare-fun b!1131206 () Bool)

(declare-fun e!643778 () Bool)

(declare-fun e!643769 () Bool)

(assert (=> b!1131206 (= e!643778 e!643769)))

(declare-fun res!755729 () Bool)

(assert (=> b!1131206 (=> res!755729 e!643769)))

(assert (=> b!1131206 (= res!755729 (not (= from!1455 i!673)))))

(declare-fun lt!502420 () ListLongMap!15971)

(declare-fun lt!502423 () array!73769)

(assert (=> b!1131206 (= lt!502420 (getCurrentListMapNoExtraKeys!4488 lt!502424 lt!502423 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2561 (Int (_ BitVec 64)) V!43067)

(assert (=> b!1131206 (= lt!502423 (array!73770 (store (arr!35537 _values!996) i!673 (ValueCellFull!13518 (dynLambda!2561 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36073 _values!996)))))

(declare-fun lt!502426 () ListLongMap!15971)

(assert (=> b!1131206 (= lt!502426 (getCurrentListMapNoExtraKeys!4488 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!48574 () Bool)

(assert (=> bm!48574 (= call!48574 call!48576)))

(declare-fun b!1131207 () Bool)

(declare-fun res!755736 () Bool)

(assert (=> b!1131207 (=> (not res!755736) (not e!643777))))

(declare-datatypes ((List!24767 0))(
  ( (Nil!24764) (Cons!24763 (h!25972 (_ BitVec 64)) (t!35684 List!24767)) )
))
(declare-fun arrayNoDuplicates!0 (array!73767 (_ BitVec 32) List!24767) Bool)

(assert (=> b!1131207 (= res!755736 (arrayNoDuplicates!0 lt!502424 #b00000000000000000000000000000000 Nil!24764))))

(declare-fun b!1131208 () Bool)

(declare-fun lt!502427 () Unit!37057)

(assert (=> b!1131208 (= e!643774 lt!502427)))

(assert (=> b!1131208 (= lt!502427 call!48579)))

(assert (=> b!1131208 call!48573))

(declare-fun b!1131209 () Bool)

(declare-fun e!643779 () Bool)

(declare-fun tp_is_empty!28455 () Bool)

(assert (=> b!1131209 (= e!643779 tp_is_empty!28455)))

(declare-fun b!1131210 () Bool)

(declare-fun res!755740 () Bool)

(assert (=> b!1131210 (=> (not res!755740) (not e!643775))))

(assert (=> b!1131210 (= res!755740 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24764))))

(declare-fun call!48580 () ListLongMap!15971)

(declare-fun b!1131211 () Bool)

(declare-fun call!48575 () ListLongMap!15971)

(declare-fun e!643768 () Bool)

(declare-fun -!1176 (ListLongMap!15971 (_ BitVec 64)) ListLongMap!15971)

(assert (=> b!1131211 (= e!643768 (= call!48575 (-!1176 call!48580 k0!934)))))

(declare-fun mapNonEmpty!44500 () Bool)

(declare-fun mapRes!44500 () Bool)

(declare-fun tp!84479 () Bool)

(declare-fun e!643782 () Bool)

(assert (=> mapNonEmpty!44500 (= mapRes!44500 (and tp!84479 e!643782))))

(declare-fun mapRest!44500 () (Array (_ BitVec 32) ValueCell!13518))

(declare-fun mapValue!44500 () ValueCell!13518)

(declare-fun mapKey!44500 () (_ BitVec 32))

(assert (=> mapNonEmpty!44500 (= (arr!35537 _values!996) (store mapRest!44500 mapKey!44500 mapValue!44500))))

(declare-fun b!1131212 () Bool)

(declare-fun c!110136 () Bool)

(declare-fun lt!502415 () Bool)

(assert (=> b!1131212 (= c!110136 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502415))))

(declare-fun e!643776 () Unit!37057)

(assert (=> b!1131212 (= e!643776 e!643774)))

(declare-fun b!1131213 () Bool)

(assert (=> b!1131213 (= e!643769 e!643773)))

(declare-fun res!755738 () Bool)

(assert (=> b!1131213 (=> res!755738 e!643773)))

(assert (=> b!1131213 (= res!755738 (not (= (select (arr!35536 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1131213 e!643768))

(declare-fun c!110139 () Bool)

(assert (=> b!1131213 (= c!110139 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502422 () Unit!37057)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!430 (array!73767 array!73769 (_ BitVec 32) (_ BitVec 32) V!43067 V!43067 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37057)

(assert (=> b!1131213 (= lt!502422 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!430 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44500 () Bool)

(assert (=> mapIsEmpty!44500 mapRes!44500))

(declare-fun res!755731 () Bool)

(assert (=> start!98224 (=> (not res!755731) (not e!643775))))

(assert (=> start!98224 (= res!755731 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36072 _keys!1208))))))

(assert (=> start!98224 e!643775))

(assert (=> start!98224 tp_is_empty!28455))

(declare-fun array_inv!27260 (array!73767) Bool)

(assert (=> start!98224 (array_inv!27260 _keys!1208)))

(assert (=> start!98224 true))

(assert (=> start!98224 tp!84478))

(declare-fun e!643771 () Bool)

(declare-fun array_inv!27261 (array!73769) Bool)

(assert (=> start!98224 (and (array_inv!27261 _values!996) e!643771)))

(declare-fun b!1131200 () Bool)

(assert (=> b!1131200 (= e!643777 (not e!643778))))

(declare-fun res!755735 () Bool)

(assert (=> b!1131200 (=> res!755735 e!643778)))

(assert (=> b!1131200 (= res!755735 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1131200 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502413 () Unit!37057)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73767 (_ BitVec 64) (_ BitVec 32)) Unit!37057)

(assert (=> b!1131200 (= lt!502413 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1131214 () Bool)

(declare-fun res!755742 () Bool)

(assert (=> b!1131214 (=> (not res!755742) (not e!643775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1131214 (= res!755742 (validMask!0 mask!1564))))

(declare-fun b!1131215 () Bool)

(assert (=> b!1131215 call!48573))

(declare-fun lt!502425 () Unit!37057)

(assert (=> b!1131215 (= lt!502425 call!48579)))

(assert (=> b!1131215 (= e!643776 lt!502425)))

(declare-fun b!1131216 () Bool)

(assert (=> b!1131216 (= e!643780 e!643776)))

(assert (=> b!1131216 (= c!110137 (and (not lt!502415) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1131217 () Bool)

(assert (=> b!1131217 (= e!643771 (and e!643779 mapRes!44500))))

(declare-fun condMapEmpty!44500 () Bool)

(declare-fun mapDefault!44500 () ValueCell!13518)

(assert (=> b!1131217 (= condMapEmpty!44500 (= (arr!35537 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13518)) mapDefault!44500)))))

(declare-fun b!1131218 () Bool)

(assert (=> b!1131218 (= e!643781 e!643770)))

(declare-fun res!755730 () Bool)

(assert (=> b!1131218 (=> res!755730 e!643770)))

(assert (=> b!1131218 (= res!755730 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36072 _keys!1208))))))

(declare-fun lt!502417 () Unit!37057)

(assert (=> b!1131218 (= lt!502417 e!643780)))

(assert (=> b!1131218 (= c!110138 (and (not lt!502415) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1131218 (= lt!502415 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!48575 () Bool)

(assert (=> bm!48575 (= call!48580 (getCurrentListMapNoExtraKeys!4488 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131219 () Bool)

(assert (=> b!1131219 (= e!643768 (= call!48575 call!48580))))

(declare-fun bm!48576 () Bool)

(assert (=> bm!48576 (= call!48575 (getCurrentListMapNoExtraKeys!4488 lt!502424 lt!502423 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131220 () Bool)

(assert (=> b!1131220 (= e!643782 tp_is_empty!28455)))

(declare-fun bm!48577 () Bool)

(assert (=> bm!48577 (= call!48577 (addStillContains!710 lt!502421 (ite (or c!110138 c!110137) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110138 c!110137) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1131221 () Bool)

(declare-fun res!755733 () Bool)

(assert (=> b!1131221 (=> (not res!755733) (not e!643775))))

(assert (=> b!1131221 (= res!755733 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36072 _keys!1208))))))

(assert (= (and start!98224 res!755731) b!1131214))

(assert (= (and b!1131214 res!755742) b!1131198))

(assert (= (and b!1131198 res!755737) b!1131203))

(assert (= (and b!1131203 res!755734) b!1131210))

(assert (= (and b!1131210 res!755740) b!1131221))

(assert (= (and b!1131221 res!755733) b!1131199))

(assert (= (and b!1131199 res!755743) b!1131204))

(assert (= (and b!1131204 res!755741) b!1131196))

(assert (= (and b!1131196 res!755739) b!1131207))

(assert (= (and b!1131207 res!755736) b!1131200))

(assert (= (and b!1131200 (not res!755735)) b!1131206))

(assert (= (and b!1131206 (not res!755729)) b!1131213))

(assert (= (and b!1131213 c!110139) b!1131211))

(assert (= (and b!1131213 (not c!110139)) b!1131219))

(assert (= (or b!1131211 b!1131219) bm!48576))

(assert (= (or b!1131211 b!1131219) bm!48575))

(assert (= (and b!1131213 (not res!755738)) b!1131201))

(assert (= (and b!1131201 (not res!755732)) b!1131218))

(assert (= (and b!1131218 c!110138) b!1131197))

(assert (= (and b!1131218 (not c!110138)) b!1131216))

(assert (= (and b!1131216 c!110137) b!1131215))

(assert (= (and b!1131216 (not c!110137)) b!1131212))

(assert (= (and b!1131212 c!110136) b!1131208))

(assert (= (and b!1131212 (not c!110136)) b!1131205))

(assert (= (or b!1131215 b!1131208) bm!48572))

(assert (= (or b!1131215 b!1131208) bm!48574))

(assert (= (or b!1131215 b!1131208) bm!48570))

(assert (= (or b!1131197 bm!48570) bm!48573))

(assert (= (or b!1131197 bm!48572) bm!48577))

(assert (= (or b!1131197 bm!48574) bm!48571))

(assert (= (and b!1131218 (not res!755730)) b!1131202))

(assert (= (and b!1131217 condMapEmpty!44500) mapIsEmpty!44500))

(assert (= (and b!1131217 (not condMapEmpty!44500)) mapNonEmpty!44500))

(get-info :version)

(assert (= (and mapNonEmpty!44500 ((_ is ValueCellFull!13518) mapValue!44500)) b!1131220))

(assert (= (and b!1131217 ((_ is ValueCellFull!13518) mapDefault!44500)) b!1131209))

(assert (= start!98224 b!1131217))

(declare-fun b_lambda!18895 () Bool)

(assert (=> (not b_lambda!18895) (not b!1131206)))

(declare-fun t!35682 () Bool)

(declare-fun tb!8737 () Bool)

(assert (=> (and start!98224 (= defaultEntry!1004 defaultEntry!1004) t!35682) tb!8737))

(declare-fun result!18035 () Bool)

(assert (=> tb!8737 (= result!18035 tp_is_empty!28455)))

(assert (=> b!1131206 t!35682))

(declare-fun b_and!38635 () Bool)

(assert (= b_and!38633 (and (=> t!35682 result!18035) b_and!38635)))

(declare-fun m!1044181 () Bool)

(assert (=> b!1131204 m!1044181))

(declare-fun m!1044183 () Bool)

(assert (=> b!1131196 m!1044183))

(declare-fun m!1044185 () Bool)

(assert (=> b!1131196 m!1044185))

(declare-fun m!1044187 () Bool)

(assert (=> b!1131201 m!1044187))

(declare-fun m!1044189 () Bool)

(assert (=> b!1131201 m!1044189))

(declare-fun m!1044191 () Bool)

(assert (=> bm!48576 m!1044191))

(declare-fun m!1044193 () Bool)

(assert (=> b!1131199 m!1044193))

(declare-fun m!1044195 () Bool)

(assert (=> b!1131210 m!1044195))

(declare-fun m!1044197 () Bool)

(assert (=> b!1131202 m!1044197))

(assert (=> b!1131202 m!1044197))

(declare-fun m!1044199 () Bool)

(assert (=> b!1131202 m!1044199))

(declare-fun m!1044201 () Bool)

(assert (=> mapNonEmpty!44500 m!1044201))

(declare-fun m!1044203 () Bool)

(assert (=> b!1131211 m!1044203))

(assert (=> bm!48575 m!1044189))

(declare-fun m!1044205 () Bool)

(assert (=> b!1131214 m!1044205))

(declare-fun m!1044207 () Bool)

(assert (=> b!1131207 m!1044207))

(declare-fun m!1044209 () Bool)

(assert (=> start!98224 m!1044209))

(declare-fun m!1044211 () Bool)

(assert (=> start!98224 m!1044211))

(declare-fun m!1044213 () Bool)

(assert (=> bm!48573 m!1044213))

(declare-fun m!1044215 () Bool)

(assert (=> b!1131203 m!1044215))

(declare-fun m!1044217 () Bool)

(assert (=> b!1131206 m!1044217))

(declare-fun m!1044219 () Bool)

(assert (=> b!1131206 m!1044219))

(declare-fun m!1044221 () Bool)

(assert (=> b!1131206 m!1044221))

(declare-fun m!1044223 () Bool)

(assert (=> b!1131206 m!1044223))

(declare-fun m!1044225 () Bool)

(assert (=> bm!48571 m!1044225))

(declare-fun m!1044227 () Bool)

(assert (=> b!1131200 m!1044227))

(declare-fun m!1044229 () Bool)

(assert (=> b!1131200 m!1044229))

(declare-fun m!1044231 () Bool)

(assert (=> bm!48577 m!1044231))

(declare-fun m!1044233 () Bool)

(assert (=> b!1131213 m!1044233))

(declare-fun m!1044235 () Bool)

(assert (=> b!1131213 m!1044235))

(declare-fun m!1044237 () Bool)

(assert (=> b!1131197 m!1044237))

(declare-fun m!1044239 () Bool)

(assert (=> b!1131197 m!1044239))

(assert (=> b!1131197 m!1044239))

(declare-fun m!1044241 () Bool)

(assert (=> b!1131197 m!1044241))

(check-sat (not bm!48571) (not bm!48575) (not b!1131196) (not b_lambda!18895) (not b!1131206) (not b!1131207) (not b!1131197) (not bm!48576) (not b!1131203) (not b_next!23925) (not b!1131200) (not mapNonEmpty!44500) (not b!1131201) (not b!1131214) (not b!1131202) (not bm!48577) (not b!1131199) tp_is_empty!28455 (not start!98224) (not b!1131210) (not b!1131211) (not b!1131213) (not bm!48573) b_and!38635)
(check-sat b_and!38635 (not b_next!23925))
