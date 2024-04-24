; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98278 () Bool)

(assert start!98278)

(declare-fun b_free!23743 () Bool)

(declare-fun b_next!23743 () Bool)

(assert (=> start!98278 (= b_free!23743 (not b_next!23743))))

(declare-fun tp!83932 () Bool)

(declare-fun b_and!38279 () Bool)

(assert (=> start!98278 (= tp!83932 b_and!38279)))

(declare-fun res!752507 () Bool)

(declare-fun e!641461 () Bool)

(assert (=> start!98278 (=> (not res!752507) (not e!641461))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73459 0))(
  ( (array!73460 (arr!35376 (Array (_ BitVec 32) (_ BitVec 64))) (size!35913 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73459)

(assert (=> start!98278 (= res!752507 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35913 _keys!1208))))))

(assert (=> start!98278 e!641461))

(declare-fun tp_is_empty!28273 () Bool)

(assert (=> start!98278 tp_is_empty!28273))

(declare-fun array_inv!27210 (array!73459) Bool)

(assert (=> start!98278 (array_inv!27210 _keys!1208)))

(assert (=> start!98278 true))

(assert (=> start!98278 tp!83932))

(declare-datatypes ((V!42825 0))(
  ( (V!42826 (val!14193 Int)) )
))
(declare-datatypes ((ValueCell!13427 0))(
  ( (ValueCellFull!13427 (v!16822 V!42825)) (EmptyCell!13427) )
))
(declare-datatypes ((array!73461 0))(
  ( (array!73462 (arr!35377 (Array (_ BitVec 32) ValueCell!13427)) (size!35914 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73461)

(declare-fun e!641460 () Bool)

(declare-fun array_inv!27211 (array!73461) Bool)

(assert (=> start!98278 (and (array_inv!27211 _values!996) e!641460)))

(declare-fun b!1126707 () Bool)

(declare-fun e!641462 () Bool)

(declare-fun mapRes!44227 () Bool)

(assert (=> b!1126707 (= e!641460 (and e!641462 mapRes!44227))))

(declare-fun condMapEmpty!44227 () Bool)

(declare-fun mapDefault!44227 () ValueCell!13427)

(assert (=> b!1126707 (= condMapEmpty!44227 (= (arr!35377 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13427)) mapDefault!44227)))))

(declare-fun b!1126708 () Bool)

(declare-fun e!641463 () Bool)

(declare-fun e!641464 () Bool)

(assert (=> b!1126708 (= e!641463 (not e!641464))))

(declare-fun res!752502 () Bool)

(assert (=> b!1126708 (=> res!752502 e!641464)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126708 (= res!752502 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126708 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36881 0))(
  ( (Unit!36882) )
))
(declare-fun lt!500345 () Unit!36881)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73459 (_ BitVec 64) (_ BitVec 32)) Unit!36881)

(assert (=> b!1126708 (= lt!500345 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1126709 () Bool)

(declare-fun res!752499 () Bool)

(assert (=> b!1126709 (=> (not res!752499) (not e!641461))))

(assert (=> b!1126709 (= res!752499 (= (select (arr!35376 _keys!1208) i!673) k0!934))))

(declare-fun b!1126710 () Bool)

(declare-fun res!752509 () Bool)

(assert (=> b!1126710 (=> (not res!752509) (not e!641461))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1126710 (= res!752509 (and (= (size!35914 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35913 _keys!1208) (size!35914 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1126711 () Bool)

(declare-fun e!641466 () Bool)

(assert (=> b!1126711 (= e!641466 tp_is_empty!28273)))

(declare-fun b!1126712 () Bool)

(declare-fun e!641459 () Bool)

(assert (=> b!1126712 (= e!641459 true)))

(declare-datatypes ((tuple2!17850 0))(
  ( (tuple2!17851 (_1!8936 (_ BitVec 64)) (_2!8936 V!42825)) )
))
(declare-datatypes ((List!24640 0))(
  ( (Nil!24637) (Cons!24636 (h!25854 tuple2!17850) (t!35367 List!24640)) )
))
(declare-datatypes ((ListLongMap!15827 0))(
  ( (ListLongMap!15828 (toList!7929 List!24640)) )
))
(declare-fun lt!500346 () ListLongMap!15827)

(declare-fun zeroValue!944 () V!42825)

(declare-fun contains!6479 (ListLongMap!15827 (_ BitVec 64)) Bool)

(declare-fun +!3455 (ListLongMap!15827 tuple2!17850) ListLongMap!15827)

(assert (=> b!1126712 (contains!6479 (+!3455 lt!500346 (tuple2!17851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!500347 () Unit!36881)

(declare-fun addStillContains!681 (ListLongMap!15827 (_ BitVec 64) V!42825 (_ BitVec 64)) Unit!36881)

(assert (=> b!1126712 (= lt!500347 (addStillContains!681 lt!500346 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1126713 () Bool)

(declare-fun res!752511 () Bool)

(assert (=> b!1126713 (=> (not res!752511) (not e!641461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126713 (= res!752511 (validKeyInArray!0 k0!934))))

(declare-fun b!1126714 () Bool)

(declare-fun res!752500 () Bool)

(assert (=> b!1126714 (=> (not res!752500) (not e!641463))))

(declare-fun lt!500344 () array!73459)

(declare-datatypes ((List!24641 0))(
  ( (Nil!24638) (Cons!24637 (h!25855 (_ BitVec 64)) (t!35368 List!24641)) )
))
(declare-fun arrayNoDuplicates!0 (array!73459 (_ BitVec 32) List!24641) Bool)

(assert (=> b!1126714 (= res!752500 (arrayNoDuplicates!0 lt!500344 #b00000000000000000000000000000000 Nil!24638))))

(declare-fun mapIsEmpty!44227 () Bool)

(assert (=> mapIsEmpty!44227 mapRes!44227))

(declare-fun b!1126715 () Bool)

(assert (=> b!1126715 (= e!641461 e!641463)))

(declare-fun res!752512 () Bool)

(assert (=> b!1126715 (=> (not res!752512) (not e!641463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73459 (_ BitVec 32)) Bool)

(assert (=> b!1126715 (= res!752512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500344 mask!1564))))

(assert (=> b!1126715 (= lt!500344 (array!73460 (store (arr!35376 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35913 _keys!1208)))))

(declare-fun b!1126716 () Bool)

(declare-fun res!752498 () Bool)

(assert (=> b!1126716 (=> res!752498 e!641459)))

(assert (=> b!1126716 (= res!752498 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1126717 () Bool)

(assert (=> b!1126717 (= e!641462 tp_is_empty!28273)))

(declare-fun b!1126718 () Bool)

(declare-fun res!752504 () Bool)

(assert (=> b!1126718 (=> (not res!752504) (not e!641461))))

(assert (=> b!1126718 (= res!752504 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35913 _keys!1208))))))

(declare-fun b!1126719 () Bool)

(declare-fun res!752510 () Bool)

(assert (=> b!1126719 (=> (not res!752510) (not e!641461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126719 (= res!752510 (validMask!0 mask!1564))))

(declare-fun b!1126720 () Bool)

(declare-fun e!641465 () Bool)

(assert (=> b!1126720 (= e!641465 e!641459)))

(declare-fun res!752505 () Bool)

(assert (=> b!1126720 (=> res!752505 e!641459)))

(assert (=> b!1126720 (= res!752505 (not (contains!6479 lt!500346 k0!934)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42825)

(declare-fun getCurrentListMapNoExtraKeys!4454 (array!73459 array!73461 (_ BitVec 32) (_ BitVec 32) V!42825 V!42825 (_ BitVec 32) Int) ListLongMap!15827)

(assert (=> b!1126720 (= lt!500346 (getCurrentListMapNoExtraKeys!4454 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44227 () Bool)

(declare-fun tp!83933 () Bool)

(assert (=> mapNonEmpty!44227 (= mapRes!44227 (and tp!83933 e!641466))))

(declare-fun mapValue!44227 () ValueCell!13427)

(declare-fun mapKey!44227 () (_ BitVec 32))

(declare-fun mapRest!44227 () (Array (_ BitVec 32) ValueCell!13427))

(assert (=> mapNonEmpty!44227 (= (arr!35377 _values!996) (store mapRest!44227 mapKey!44227 mapValue!44227))))

(declare-fun b!1126721 () Bool)

(declare-fun e!641457 () Bool)

(declare-fun call!47579 () ListLongMap!15827)

(declare-fun call!47578 () ListLongMap!15827)

(assert (=> b!1126721 (= e!641457 (= call!47579 call!47578))))

(declare-fun b!1126722 () Bool)

(declare-fun res!752506 () Bool)

(assert (=> b!1126722 (=> (not res!752506) (not e!641461))))

(assert (=> b!1126722 (= res!752506 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24638))))

(declare-fun bm!47575 () Bool)

(declare-fun lt!500342 () array!73461)

(assert (=> bm!47575 (= call!47579 (getCurrentListMapNoExtraKeys!4454 lt!500344 lt!500342 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126723 () Bool)

(declare-fun e!641458 () Bool)

(assert (=> b!1126723 (= e!641464 e!641458)))

(declare-fun res!752508 () Bool)

(assert (=> b!1126723 (=> res!752508 e!641458)))

(assert (=> b!1126723 (= res!752508 (not (= from!1455 i!673)))))

(declare-fun lt!500343 () ListLongMap!15827)

(assert (=> b!1126723 (= lt!500343 (getCurrentListMapNoExtraKeys!4454 lt!500344 lt!500342 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2530 (Int (_ BitVec 64)) V!42825)

(assert (=> b!1126723 (= lt!500342 (array!73462 (store (arr!35377 _values!996) i!673 (ValueCellFull!13427 (dynLambda!2530 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35914 _values!996)))))

(declare-fun lt!500340 () ListLongMap!15827)

(assert (=> b!1126723 (= lt!500340 (getCurrentListMapNoExtraKeys!4454 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47576 () Bool)

(assert (=> bm!47576 (= call!47578 (getCurrentListMapNoExtraKeys!4454 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126724 () Bool)

(declare-fun -!1113 (ListLongMap!15827 (_ BitVec 64)) ListLongMap!15827)

(assert (=> b!1126724 (= e!641457 (= call!47579 (-!1113 call!47578 k0!934)))))

(declare-fun b!1126725 () Bool)

(declare-fun res!752501 () Bool)

(assert (=> b!1126725 (=> (not res!752501) (not e!641461))))

(assert (=> b!1126725 (= res!752501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1126726 () Bool)

(assert (=> b!1126726 (= e!641458 e!641465)))

(declare-fun res!752503 () Bool)

(assert (=> b!1126726 (=> res!752503 e!641465)))

(assert (=> b!1126726 (= res!752503 (not (= (select (arr!35376 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1126726 e!641457))

(declare-fun c!110015 () Bool)

(assert (=> b!1126726 (= c!110015 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500341 () Unit!36881)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!375 (array!73459 array!73461 (_ BitVec 32) (_ BitVec 32) V!42825 V!42825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36881)

(assert (=> b!1126726 (= lt!500341 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!375 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98278 res!752507) b!1126719))

(assert (= (and b!1126719 res!752510) b!1126710))

(assert (= (and b!1126710 res!752509) b!1126725))

(assert (= (and b!1126725 res!752501) b!1126722))

(assert (= (and b!1126722 res!752506) b!1126718))

(assert (= (and b!1126718 res!752504) b!1126713))

(assert (= (and b!1126713 res!752511) b!1126709))

(assert (= (and b!1126709 res!752499) b!1126715))

(assert (= (and b!1126715 res!752512) b!1126714))

(assert (= (and b!1126714 res!752500) b!1126708))

(assert (= (and b!1126708 (not res!752502)) b!1126723))

(assert (= (and b!1126723 (not res!752508)) b!1126726))

(assert (= (and b!1126726 c!110015) b!1126724))

(assert (= (and b!1126726 (not c!110015)) b!1126721))

(assert (= (or b!1126724 b!1126721) bm!47576))

(assert (= (or b!1126724 b!1126721) bm!47575))

(assert (= (and b!1126726 (not res!752503)) b!1126720))

(assert (= (and b!1126720 (not res!752505)) b!1126716))

(assert (= (and b!1126716 (not res!752498)) b!1126712))

(assert (= (and b!1126707 condMapEmpty!44227) mapIsEmpty!44227))

(assert (= (and b!1126707 (not condMapEmpty!44227)) mapNonEmpty!44227))

(get-info :version)

(assert (= (and mapNonEmpty!44227 ((_ is ValueCellFull!13427) mapValue!44227)) b!1126711))

(assert (= (and b!1126707 ((_ is ValueCellFull!13427) mapDefault!44227)) b!1126717))

(assert (= start!98278 b!1126707))

(declare-fun b_lambda!18723 () Bool)

(assert (=> (not b_lambda!18723) (not b!1126723)))

(declare-fun t!35366 () Bool)

(declare-fun tb!8547 () Bool)

(assert (=> (and start!98278 (= defaultEntry!1004 defaultEntry!1004) t!35366) tb!8547))

(declare-fun result!17663 () Bool)

(assert (=> tb!8547 (= result!17663 tp_is_empty!28273)))

(assert (=> b!1126723 t!35366))

(declare-fun b_and!38281 () Bool)

(assert (= b_and!38279 (and (=> t!35366 result!17663) b_and!38281)))

(declare-fun m!1041197 () Bool)

(assert (=> b!1126709 m!1041197))

(declare-fun m!1041199 () Bool)

(assert (=> b!1126715 m!1041199))

(declare-fun m!1041201 () Bool)

(assert (=> b!1126715 m!1041201))

(declare-fun m!1041203 () Bool)

(assert (=> b!1126708 m!1041203))

(declare-fun m!1041205 () Bool)

(assert (=> b!1126708 m!1041205))

(declare-fun m!1041207 () Bool)

(assert (=> b!1126723 m!1041207))

(declare-fun m!1041209 () Bool)

(assert (=> b!1126723 m!1041209))

(declare-fun m!1041211 () Bool)

(assert (=> b!1126723 m!1041211))

(declare-fun m!1041213 () Bool)

(assert (=> b!1126723 m!1041213))

(declare-fun m!1041215 () Bool)

(assert (=> mapNonEmpty!44227 m!1041215))

(declare-fun m!1041217 () Bool)

(assert (=> b!1126724 m!1041217))

(declare-fun m!1041219 () Bool)

(assert (=> b!1126726 m!1041219))

(declare-fun m!1041221 () Bool)

(assert (=> b!1126726 m!1041221))

(declare-fun m!1041223 () Bool)

(assert (=> b!1126720 m!1041223))

(declare-fun m!1041225 () Bool)

(assert (=> b!1126720 m!1041225))

(declare-fun m!1041227 () Bool)

(assert (=> b!1126714 m!1041227))

(declare-fun m!1041229 () Bool)

(assert (=> start!98278 m!1041229))

(declare-fun m!1041231 () Bool)

(assert (=> start!98278 m!1041231))

(assert (=> bm!47576 m!1041225))

(declare-fun m!1041233 () Bool)

(assert (=> b!1126713 m!1041233))

(declare-fun m!1041235 () Bool)

(assert (=> b!1126722 m!1041235))

(declare-fun m!1041237 () Bool)

(assert (=> b!1126719 m!1041237))

(declare-fun m!1041239 () Bool)

(assert (=> b!1126712 m!1041239))

(assert (=> b!1126712 m!1041239))

(declare-fun m!1041241 () Bool)

(assert (=> b!1126712 m!1041241))

(declare-fun m!1041243 () Bool)

(assert (=> b!1126712 m!1041243))

(declare-fun m!1041245 () Bool)

(assert (=> bm!47575 m!1041245))

(declare-fun m!1041247 () Bool)

(assert (=> b!1126725 m!1041247))

(check-sat (not bm!47576) b_and!38281 (not b!1126719) tp_is_empty!28273 (not mapNonEmpty!44227) (not b!1126724) (not start!98278) (not b!1126708) (not b!1126725) (not b!1126726) (not b!1126720) (not b!1126723) (not b!1126712) (not b!1126715) (not b!1126713) (not b!1126714) (not b!1126722) (not b_next!23743) (not b_lambda!18723) (not bm!47575))
(check-sat b_and!38281 (not b_next!23743))
