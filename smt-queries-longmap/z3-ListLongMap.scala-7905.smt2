; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98176 () Bool)

(assert start!98176)

(declare-fun b_free!23877 () Bool)

(declare-fun b_next!23877 () Bool)

(assert (=> start!98176 (= b_free!23877 (not b_next!23877))))

(declare-fun tp!84335 () Bool)

(declare-fun b_and!38537 () Bool)

(assert (=> start!98176 (= tp!84335 b_and!38537)))

(declare-fun b!1129276 () Bool)

(declare-fun e!642699 () Bool)

(declare-datatypes ((V!43003 0))(
  ( (V!43004 (val!14260 Int)) )
))
(declare-datatypes ((tuple2!17954 0))(
  ( (tuple2!17955 (_1!8988 (_ BitVec 64)) (_2!8988 V!43003)) )
))
(declare-datatypes ((List!24721 0))(
  ( (Nil!24718) (Cons!24717 (h!25926 tuple2!17954) (t!35590 List!24721)) )
))
(declare-datatypes ((ListLongMap!15923 0))(
  ( (ListLongMap!15924 (toList!7977 List!24721)) )
))
(declare-fun call!48000 () ListLongMap!15923)

(declare-fun call!48002 () ListLongMap!15923)

(assert (=> b!1129276 (= e!642699 (= call!48000 call!48002))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1129277 () Bool)

(declare-fun -!1158 (ListLongMap!15923 (_ BitVec 64)) ListLongMap!15923)

(assert (=> b!1129277 (= e!642699 (= call!48000 (-!1158 call!48002 k0!934)))))

(declare-fun call!48004 () ListLongMap!15923)

(declare-fun lt!501347 () ListLongMap!15923)

(declare-fun c!109850 () Bool)

(declare-fun bm!47994 () Bool)

(declare-fun call!48003 () Bool)

(declare-fun contains!6500 (ListLongMap!15923 (_ BitVec 64)) Bool)

(assert (=> bm!47994 (= call!48003 (contains!6500 (ite c!109850 lt!501347 call!48004) k0!934))))

(declare-fun zeroValue!944 () V!43003)

(declare-datatypes ((array!73671 0))(
  ( (array!73672 (arr!35488 (Array (_ BitVec 32) (_ BitVec 64))) (size!36024 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73671)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!47995 () Bool)

(declare-datatypes ((ValueCell!13494 0))(
  ( (ValueCellFull!13494 (v!16893 V!43003)) (EmptyCell!13494) )
))
(declare-datatypes ((array!73673 0))(
  ( (array!73674 (arr!35489 (Array (_ BitVec 32) ValueCell!13494)) (size!36025 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73673)

(declare-fun minValue!944 () V!43003)

(declare-fun getCurrentListMapNoExtraKeys!4464 (array!73671 array!73673 (_ BitVec 32) (_ BitVec 32) V!43003 V!43003 (_ BitVec 32) Int) ListLongMap!15923)

(assert (=> bm!47995 (= call!48002 (getCurrentListMapNoExtraKeys!4464 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129278 () Bool)

(declare-fun e!642693 () Bool)

(assert (=> b!1129278 (= e!642693 true)))

(declare-fun lt!501338 () Bool)

(declare-fun getCurrentListMap!4414 (array!73671 array!73673 (_ BitVec 32) (_ BitVec 32) V!43003 V!43003 (_ BitVec 32) Int) ListLongMap!15923)

(assert (=> b!1129278 (= lt!501338 (contains!6500 (getCurrentListMap!4414 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun bm!47996 () Bool)

(declare-fun call!47998 () Bool)

(assert (=> bm!47996 (= call!47998 call!48003)))

(declare-fun b!1129279 () Bool)

(declare-fun e!642700 () Bool)

(declare-fun tp_is_empty!28407 () Bool)

(assert (=> b!1129279 (= e!642700 tp_is_empty!28407)))

(declare-fun b!1129280 () Bool)

(declare-datatypes ((Unit!36994 0))(
  ( (Unit!36995) )
))
(declare-fun e!642702 () Unit!36994)

(declare-fun Unit!36996 () Unit!36994)

(assert (=> b!1129280 (= e!642702 Unit!36996)))

(declare-fun bm!47997 () Bool)

(declare-fun call!47997 () Unit!36994)

(declare-fun call!47999 () Unit!36994)

(assert (=> bm!47997 (= call!47997 call!47999)))

(declare-fun b!1129281 () Bool)

(declare-fun res!754656 () Bool)

(declare-fun e!642694 () Bool)

(assert (=> b!1129281 (=> (not res!754656) (not e!642694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73671 (_ BitVec 32)) Bool)

(assert (=> b!1129281 (= res!754656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1129282 () Bool)

(declare-fun c!109851 () Bool)

(declare-fun lt!501341 () Bool)

(assert (=> b!1129282 (= c!109851 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501341))))

(declare-fun e!642692 () Unit!36994)

(assert (=> b!1129282 (= e!642692 e!642702)))

(declare-fun b!1129283 () Bool)

(declare-fun res!754650 () Bool)

(assert (=> b!1129283 (=> (not res!754650) (not e!642694))))

(declare-datatypes ((List!24722 0))(
  ( (Nil!24719) (Cons!24718 (h!25927 (_ BitVec 64)) (t!35591 List!24722)) )
))
(declare-fun arrayNoDuplicates!0 (array!73671 (_ BitVec 32) List!24722) Bool)

(assert (=> b!1129283 (= res!754650 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24719))))

(declare-fun b!1129284 () Bool)

(declare-fun e!642688 () Unit!36994)

(assert (=> b!1129284 (= e!642688 e!642692)))

(declare-fun c!109848 () Bool)

(assert (=> b!1129284 (= c!109848 (and (not lt!501341) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1129285 () Bool)

(declare-fun e!642697 () Bool)

(assert (=> b!1129285 (= e!642697 tp_is_empty!28407)))

(declare-fun res!754657 () Bool)

(assert (=> start!98176 (=> (not res!754657) (not e!642694))))

(assert (=> start!98176 (= res!754657 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36024 _keys!1208))))))

(assert (=> start!98176 e!642694))

(assert (=> start!98176 tp_is_empty!28407))

(declare-fun array_inv!27224 (array!73671) Bool)

(assert (=> start!98176 (array_inv!27224 _keys!1208)))

(assert (=> start!98176 true))

(assert (=> start!98176 tp!84335))

(declare-fun e!642689 () Bool)

(declare-fun array_inv!27225 (array!73673) Bool)

(assert (=> start!98176 (and (array_inv!27225 _values!996) e!642689)))

(declare-fun mapIsEmpty!44428 () Bool)

(declare-fun mapRes!44428 () Bool)

(assert (=> mapIsEmpty!44428 mapRes!44428))

(declare-fun b!1129286 () Bool)

(declare-fun res!754662 () Bool)

(assert (=> b!1129286 (=> (not res!754662) (not e!642694))))

(assert (=> b!1129286 (= res!754662 (and (= (size!36025 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36024 _keys!1208) (size!36025 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1129287 () Bool)

(declare-fun lt!501335 () Unit!36994)

(assert (=> b!1129287 (= e!642688 lt!501335)))

(declare-fun lt!501344 () ListLongMap!15923)

(declare-fun lt!501340 () Unit!36994)

(declare-fun addStillContains!691 (ListLongMap!15923 (_ BitVec 64) V!43003 (_ BitVec 64)) Unit!36994)

(assert (=> b!1129287 (= lt!501340 (addStillContains!691 lt!501344 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun call!48001 () ListLongMap!15923)

(assert (=> b!1129287 (= lt!501347 call!48001)))

(assert (=> b!1129287 call!48003))

(assert (=> b!1129287 (= lt!501335 call!47999)))

(declare-fun +!3428 (ListLongMap!15923 tuple2!17954) ListLongMap!15923)

(assert (=> b!1129287 (contains!6500 (+!3428 lt!501347 (tuple2!17955 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1129288 () Bool)

(assert (=> b!1129288 (= e!642689 (and e!642700 mapRes!44428))))

(declare-fun condMapEmpty!44428 () Bool)

(declare-fun mapDefault!44428 () ValueCell!13494)

(assert (=> b!1129288 (= condMapEmpty!44428 (= (arr!35489 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13494)) mapDefault!44428)))))

(declare-fun bm!47998 () Bool)

(assert (=> bm!47998 (= call!47999 (addStillContains!691 (ite c!109850 lt!501347 lt!501344) (ite c!109850 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!109848 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!109850 minValue!944 (ite c!109848 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1129289 () Bool)

(assert (=> b!1129289 call!47998))

(declare-fun lt!501339 () Unit!36994)

(assert (=> b!1129289 (= lt!501339 call!47997)))

(assert (=> b!1129289 (= e!642692 lt!501339)))

(declare-fun b!1129290 () Bool)

(declare-fun e!642690 () Bool)

(assert (=> b!1129290 (= e!642690 e!642693)))

(declare-fun res!754651 () Bool)

(assert (=> b!1129290 (=> res!754651 e!642693)))

(assert (=> b!1129290 (= res!754651 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36024 _keys!1208))))))

(declare-fun lt!501334 () Unit!36994)

(assert (=> b!1129290 (= lt!501334 e!642688)))

(assert (=> b!1129290 (= c!109850 (and (not lt!501341) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1129290 (= lt!501341 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1129291 () Bool)

(declare-fun res!754659 () Bool)

(declare-fun e!642698 () Bool)

(assert (=> b!1129291 (=> (not res!754659) (not e!642698))))

(declare-fun lt!501337 () array!73671)

(assert (=> b!1129291 (= res!754659 (arrayNoDuplicates!0 lt!501337 #b00000000000000000000000000000000 Nil!24719))))

(declare-fun bm!47999 () Bool)

(declare-fun lt!501342 () array!73673)

(assert (=> bm!47999 (= call!48000 (getCurrentListMapNoExtraKeys!4464 lt!501337 lt!501342 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129292 () Bool)

(declare-fun res!754652 () Bool)

(assert (=> b!1129292 (=> (not res!754652) (not e!642694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129292 (= res!754652 (validKeyInArray!0 k0!934))))

(declare-fun b!1129293 () Bool)

(declare-fun res!754658 () Bool)

(assert (=> b!1129293 (=> (not res!754658) (not e!642694))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129293 (= res!754658 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36024 _keys!1208))))))

(declare-fun b!1129294 () Bool)

(declare-fun lt!501343 () Unit!36994)

(assert (=> b!1129294 (= e!642702 lt!501343)))

(assert (=> b!1129294 (= lt!501343 call!47997)))

(assert (=> b!1129294 call!47998))

(declare-fun b!1129295 () Bool)

(declare-fun e!642691 () Bool)

(assert (=> b!1129295 (= e!642698 (not e!642691))))

(declare-fun res!754663 () Bool)

(assert (=> b!1129295 (=> res!754663 e!642691)))

(assert (=> b!1129295 (= res!754663 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129295 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501336 () Unit!36994)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73671 (_ BitVec 64) (_ BitVec 32)) Unit!36994)

(assert (=> b!1129295 (= lt!501336 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1129296 () Bool)

(declare-fun e!642696 () Bool)

(assert (=> b!1129296 (= e!642691 e!642696)))

(declare-fun res!754655 () Bool)

(assert (=> b!1129296 (=> res!754655 e!642696)))

(assert (=> b!1129296 (= res!754655 (not (= from!1455 i!673)))))

(declare-fun lt!501333 () ListLongMap!15923)

(assert (=> b!1129296 (= lt!501333 (getCurrentListMapNoExtraKeys!4464 lt!501337 lt!501342 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2543 (Int (_ BitVec 64)) V!43003)

(assert (=> b!1129296 (= lt!501342 (array!73674 (store (arr!35489 _values!996) i!673 (ValueCellFull!13494 (dynLambda!2543 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36025 _values!996)))))

(declare-fun lt!501346 () ListLongMap!15923)

(assert (=> b!1129296 (= lt!501346 (getCurrentListMapNoExtraKeys!4464 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!44428 () Bool)

(declare-fun tp!84334 () Bool)

(assert (=> mapNonEmpty!44428 (= mapRes!44428 (and tp!84334 e!642697))))

(declare-fun mapRest!44428 () (Array (_ BitVec 32) ValueCell!13494))

(declare-fun mapValue!44428 () ValueCell!13494)

(declare-fun mapKey!44428 () (_ BitVec 32))

(assert (=> mapNonEmpty!44428 (= (arr!35489 _values!996) (store mapRest!44428 mapKey!44428 mapValue!44428))))

(declare-fun bm!48000 () Bool)

(assert (=> bm!48000 (= call!48004 call!48001)))

(declare-fun b!1129297 () Bool)

(declare-fun res!754654 () Bool)

(assert (=> b!1129297 (=> (not res!754654) (not e!642694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129297 (= res!754654 (validMask!0 mask!1564))))

(declare-fun bm!48001 () Bool)

(assert (=> bm!48001 (= call!48001 (+!3428 lt!501344 (ite (or c!109850 c!109848) (tuple2!17955 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17955 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1129298 () Bool)

(declare-fun res!754649 () Bool)

(assert (=> b!1129298 (=> (not res!754649) (not e!642694))))

(assert (=> b!1129298 (= res!754649 (= (select (arr!35488 _keys!1208) i!673) k0!934))))

(declare-fun b!1129299 () Bool)

(declare-fun e!642701 () Bool)

(assert (=> b!1129299 (= e!642701 e!642690)))

(declare-fun res!754660 () Bool)

(assert (=> b!1129299 (=> res!754660 e!642690)))

(assert (=> b!1129299 (= res!754660 (not (contains!6500 lt!501344 k0!934)))))

(assert (=> b!1129299 (= lt!501344 (getCurrentListMapNoExtraKeys!4464 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129300 () Bool)

(assert (=> b!1129300 (= e!642696 e!642701)))

(declare-fun res!754661 () Bool)

(assert (=> b!1129300 (=> res!754661 e!642701)))

(assert (=> b!1129300 (= res!754661 (not (= (select (arr!35488 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1129300 e!642699))

(declare-fun c!109849 () Bool)

(assert (=> b!1129300 (= c!109849 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501345 () Unit!36994)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!410 (array!73671 array!73673 (_ BitVec 32) (_ BitVec 32) V!43003 V!43003 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36994)

(assert (=> b!1129300 (= lt!501345 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!410 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129301 () Bool)

(assert (=> b!1129301 (= e!642694 e!642698)))

(declare-fun res!754653 () Bool)

(assert (=> b!1129301 (=> (not res!754653) (not e!642698))))

(assert (=> b!1129301 (= res!754653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501337 mask!1564))))

(assert (=> b!1129301 (= lt!501337 (array!73672 (store (arr!35488 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36024 _keys!1208)))))

(assert (= (and start!98176 res!754657) b!1129297))

(assert (= (and b!1129297 res!754654) b!1129286))

(assert (= (and b!1129286 res!754662) b!1129281))

(assert (= (and b!1129281 res!754656) b!1129283))

(assert (= (and b!1129283 res!754650) b!1129293))

(assert (= (and b!1129293 res!754658) b!1129292))

(assert (= (and b!1129292 res!754652) b!1129298))

(assert (= (and b!1129298 res!754649) b!1129301))

(assert (= (and b!1129301 res!754653) b!1129291))

(assert (= (and b!1129291 res!754659) b!1129295))

(assert (= (and b!1129295 (not res!754663)) b!1129296))

(assert (= (and b!1129296 (not res!754655)) b!1129300))

(assert (= (and b!1129300 c!109849) b!1129277))

(assert (= (and b!1129300 (not c!109849)) b!1129276))

(assert (= (or b!1129277 b!1129276) bm!47999))

(assert (= (or b!1129277 b!1129276) bm!47995))

(assert (= (and b!1129300 (not res!754661)) b!1129299))

(assert (= (and b!1129299 (not res!754660)) b!1129290))

(assert (= (and b!1129290 c!109850) b!1129287))

(assert (= (and b!1129290 (not c!109850)) b!1129284))

(assert (= (and b!1129284 c!109848) b!1129289))

(assert (= (and b!1129284 (not c!109848)) b!1129282))

(assert (= (and b!1129282 c!109851) b!1129294))

(assert (= (and b!1129282 (not c!109851)) b!1129280))

(assert (= (or b!1129289 b!1129294) bm!47997))

(assert (= (or b!1129289 b!1129294) bm!48000))

(assert (= (or b!1129289 b!1129294) bm!47996))

(assert (= (or b!1129287 bm!47996) bm!47994))

(assert (= (or b!1129287 bm!47997) bm!47998))

(assert (= (or b!1129287 bm!48000) bm!48001))

(assert (= (and b!1129290 (not res!754651)) b!1129278))

(assert (= (and b!1129288 condMapEmpty!44428) mapIsEmpty!44428))

(assert (= (and b!1129288 (not condMapEmpty!44428)) mapNonEmpty!44428))

(get-info :version)

(assert (= (and mapNonEmpty!44428 ((_ is ValueCellFull!13494) mapValue!44428)) b!1129285))

(assert (= (and b!1129288 ((_ is ValueCellFull!13494) mapDefault!44428)) b!1129279))

(assert (= start!98176 b!1129288))

(declare-fun b_lambda!18847 () Bool)

(assert (=> (not b_lambda!18847) (not b!1129296)))

(declare-fun t!35589 () Bool)

(declare-fun tb!8689 () Bool)

(assert (=> (and start!98176 (= defaultEntry!1004 defaultEntry!1004) t!35589) tb!8689))

(declare-fun result!17939 () Bool)

(assert (=> tb!8689 (= result!17939 tp_is_empty!28407)))

(assert (=> b!1129296 t!35589))

(declare-fun b_and!38539 () Bool)

(assert (= b_and!38537 (and (=> t!35589 result!17939) b_and!38539)))

(declare-fun m!1042693 () Bool)

(assert (=> b!1129278 m!1042693))

(assert (=> b!1129278 m!1042693))

(declare-fun m!1042695 () Bool)

(assert (=> b!1129278 m!1042695))

(declare-fun m!1042697 () Bool)

(assert (=> bm!47998 m!1042697))

(declare-fun m!1042699 () Bool)

(assert (=> bm!47995 m!1042699))

(declare-fun m!1042701 () Bool)

(assert (=> b!1129291 m!1042701))

(declare-fun m!1042703 () Bool)

(assert (=> b!1129281 m!1042703))

(declare-fun m!1042705 () Bool)

(assert (=> b!1129299 m!1042705))

(assert (=> b!1129299 m!1042699))

(declare-fun m!1042707 () Bool)

(assert (=> mapNonEmpty!44428 m!1042707))

(declare-fun m!1042709 () Bool)

(assert (=> start!98176 m!1042709))

(declare-fun m!1042711 () Bool)

(assert (=> start!98176 m!1042711))

(declare-fun m!1042713 () Bool)

(assert (=> b!1129277 m!1042713))

(declare-fun m!1042715 () Bool)

(assert (=> b!1129283 m!1042715))

(declare-fun m!1042717 () Bool)

(assert (=> b!1129295 m!1042717))

(declare-fun m!1042719 () Bool)

(assert (=> b!1129295 m!1042719))

(declare-fun m!1042721 () Bool)

(assert (=> b!1129301 m!1042721))

(declare-fun m!1042723 () Bool)

(assert (=> b!1129301 m!1042723))

(declare-fun m!1042725 () Bool)

(assert (=> bm!47999 m!1042725))

(declare-fun m!1042727 () Bool)

(assert (=> b!1129298 m!1042727))

(declare-fun m!1042729 () Bool)

(assert (=> bm!47994 m!1042729))

(declare-fun m!1042731 () Bool)

(assert (=> b!1129296 m!1042731))

(declare-fun m!1042733 () Bool)

(assert (=> b!1129296 m!1042733))

(declare-fun m!1042735 () Bool)

(assert (=> b!1129296 m!1042735))

(declare-fun m!1042737 () Bool)

(assert (=> b!1129296 m!1042737))

(declare-fun m!1042739 () Bool)

(assert (=> bm!48001 m!1042739))

(declare-fun m!1042741 () Bool)

(assert (=> b!1129297 m!1042741))

(declare-fun m!1042743 () Bool)

(assert (=> b!1129287 m!1042743))

(declare-fun m!1042745 () Bool)

(assert (=> b!1129287 m!1042745))

(assert (=> b!1129287 m!1042745))

(declare-fun m!1042747 () Bool)

(assert (=> b!1129287 m!1042747))

(declare-fun m!1042749 () Bool)

(assert (=> b!1129300 m!1042749))

(declare-fun m!1042751 () Bool)

(assert (=> b!1129300 m!1042751))

(declare-fun m!1042753 () Bool)

(assert (=> b!1129292 m!1042753))

(check-sat (not b!1129291) (not start!98176) (not b!1129283) (not b!1129292) b_and!38539 (not b!1129295) (not bm!48001) (not b!1129297) (not mapNonEmpty!44428) (not b!1129287) (not bm!47998) (not b!1129281) (not bm!47994) (not b!1129277) (not b!1129296) (not b!1129299) tp_is_empty!28407 (not b!1129278) (not b!1129301) (not bm!47995) (not b!1129300) (not b_lambda!18847) (not b_next!23877) (not bm!47999))
(check-sat b_and!38539 (not b_next!23877))
