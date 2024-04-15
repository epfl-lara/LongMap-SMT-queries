; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98174 () Bool)

(assert start!98174)

(declare-fun b_free!23881 () Bool)

(declare-fun b_next!23881 () Bool)

(assert (=> start!98174 (= b_free!23881 (not b_next!23881))))

(declare-fun tp!84346 () Bool)

(declare-fun b_and!38523 () Bool)

(assert (=> start!98174 (= tp!84346 b_and!38523)))

(declare-fun b!1129307 () Bool)

(declare-fun e!642711 () Bool)

(declare-fun tp_is_empty!28411 () Bool)

(assert (=> b!1129307 (= e!642711 tp_is_empty!28411)))

(declare-fun b!1129308 () Bool)

(declare-fun e!642708 () Bool)

(declare-fun e!642707 () Bool)

(assert (=> b!1129308 (= e!642708 e!642707)))

(declare-fun res!754678 () Bool)

(assert (=> b!1129308 (=> res!754678 e!642707)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73604 0))(
  ( (array!73605 (arr!35455 (Array (_ BitVec 32) (_ BitVec 64))) (size!35993 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73604)

(assert (=> b!1129308 (= res!754678 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!35993 _keys!1208))))))

(declare-datatypes ((Unit!36842 0))(
  ( (Unit!36843) )
))
(declare-fun lt!501227 () Unit!36842)

(declare-fun e!642706 () Unit!36842)

(assert (=> b!1129308 (= lt!501227 e!642706)))

(declare-fun c!109846 () Bool)

(declare-fun lt!501237 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1129308 (= c!109846 (and (not lt!501237) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1129308 (= lt!501237 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((V!43009 0))(
  ( (V!43010 (val!14262 Int)) )
))
(declare-datatypes ((tuple2!18048 0))(
  ( (tuple2!18049 (_1!9035 (_ BitVec 64)) (_2!9035 V!43009)) )
))
(declare-datatypes ((List!24799 0))(
  ( (Nil!24796) (Cons!24795 (h!26004 tuple2!18048) (t!35663 List!24799)) )
))
(declare-datatypes ((ListLongMap!16017 0))(
  ( (ListLongMap!16018 (toList!8024 List!24799)) )
))
(declare-fun call!48029 () ListLongMap!16017)

(declare-fun e!642697 () Bool)

(declare-fun b!1129309 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!48024 () ListLongMap!16017)

(declare-fun -!1137 (ListLongMap!16017 (_ BitVec 64)) ListLongMap!16017)

(assert (=> b!1129309 (= e!642697 (= call!48024 (-!1137 call!48029 k0!934)))))

(declare-fun zeroValue!944 () V!43009)

(declare-fun call!48023 () Unit!36842)

(declare-fun lt!501229 () ListLongMap!16017)

(declare-fun lt!501235 () ListLongMap!16017)

(declare-fun minValue!944 () V!43009)

(declare-fun c!109847 () Bool)

(declare-fun bm!48019 () Bool)

(declare-fun addStillContains!684 (ListLongMap!16017 (_ BitVec 64) V!43009 (_ BitVec 64)) Unit!36842)

(assert (=> bm!48019 (= call!48023 (addStillContains!684 (ite c!109846 lt!501235 lt!501229) (ite c!109846 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!109847 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!109846 minValue!944 (ite c!109847 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1129310 () Bool)

(declare-fun res!754675 () Bool)

(declare-fun e!642710 () Bool)

(assert (=> b!1129310 (=> (not res!754675) (not e!642710))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129310 (= res!754675 (validKeyInArray!0 k0!934))))

(declare-fun b!1129311 () Bool)

(declare-fun res!754672 () Bool)

(assert (=> b!1129311 (=> (not res!754672) (not e!642710))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13496 0))(
  ( (ValueCellFull!13496 (v!16894 V!43009)) (EmptyCell!13496) )
))
(declare-datatypes ((array!73606 0))(
  ( (array!73607 (arr!35456 (Array (_ BitVec 32) ValueCell!13496)) (size!35994 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73606)

(assert (=> b!1129311 (= res!754672 (and (= (size!35994 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35993 _keys!1208) (size!35994 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1129312 () Bool)

(declare-fun lt!501225 () Unit!36842)

(assert (=> b!1129312 (= e!642706 lt!501225)))

(declare-fun lt!501234 () Unit!36842)

(assert (=> b!1129312 (= lt!501234 (addStillContains!684 lt!501229 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun call!48025 () ListLongMap!16017)

(assert (=> b!1129312 (= lt!501235 call!48025)))

(declare-fun call!48026 () Bool)

(assert (=> b!1129312 call!48026))

(assert (=> b!1129312 (= lt!501225 call!48023)))

(declare-fun contains!6476 (ListLongMap!16017 (_ BitVec 64)) Bool)

(declare-fun +!3466 (ListLongMap!16017 tuple2!18048) ListLongMap!16017)

(assert (=> b!1129312 (contains!6476 (+!3466 lt!501235 (tuple2!18049 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1129313 () Bool)

(declare-fun res!754680 () Bool)

(assert (=> b!1129313 (=> (not res!754680) (not e!642710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129313 (= res!754680 (validMask!0 mask!1564))))

(declare-fun b!1129314 () Bool)

(declare-fun e!642702 () Bool)

(declare-fun e!642709 () Bool)

(assert (=> b!1129314 (= e!642702 e!642709)))

(declare-fun res!754682 () Bool)

(assert (=> b!1129314 (=> res!754682 e!642709)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129314 (= res!754682 (not (= from!1455 i!673)))))

(declare-fun lt!501223 () array!73604)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!501228 () array!73606)

(declare-fun lt!501233 () ListLongMap!16017)

(declare-fun getCurrentListMapNoExtraKeys!4524 (array!73604 array!73606 (_ BitVec 32) (_ BitVec 32) V!43009 V!43009 (_ BitVec 32) Int) ListLongMap!16017)

(assert (=> b!1129314 (= lt!501233 (getCurrentListMapNoExtraKeys!4524 lt!501223 lt!501228 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2530 (Int (_ BitVec 64)) V!43009)

(assert (=> b!1129314 (= lt!501228 (array!73607 (store (arr!35456 _values!996) i!673 (ValueCellFull!13496 (dynLambda!2530 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35994 _values!996)))))

(declare-fun lt!501224 () ListLongMap!16017)

(assert (=> b!1129314 (= lt!501224 (getCurrentListMapNoExtraKeys!4524 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1129315 () Bool)

(assert (=> b!1129315 (= e!642697 (= call!48024 call!48029))))

(declare-fun b!1129316 () Bool)

(declare-fun e!642701 () Unit!36842)

(declare-fun lt!501226 () Unit!36842)

(assert (=> b!1129316 (= e!642701 lt!501226)))

(declare-fun call!48028 () Unit!36842)

(assert (=> b!1129316 (= lt!501226 call!48028)))

(declare-fun call!48022 () Bool)

(assert (=> b!1129316 call!48022))

(declare-fun bm!48020 () Bool)

(declare-fun call!48027 () ListLongMap!16017)

(assert (=> bm!48020 (= call!48027 call!48025)))

(declare-fun b!1129317 () Bool)

(declare-fun e!642705 () Bool)

(assert (=> b!1129317 (= e!642705 e!642708)))

(declare-fun res!754681 () Bool)

(assert (=> b!1129317 (=> res!754681 e!642708)))

(assert (=> b!1129317 (= res!754681 (not (contains!6476 lt!501229 k0!934)))))

(assert (=> b!1129317 (= lt!501229 (getCurrentListMapNoExtraKeys!4524 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48021 () Bool)

(assert (=> bm!48021 (= call!48024 (getCurrentListMapNoExtraKeys!4524 lt!501223 lt!501228 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129318 () Bool)

(declare-fun res!754684 () Bool)

(assert (=> b!1129318 (=> (not res!754684) (not e!642710))))

(assert (=> b!1129318 (= res!754684 (= (select (arr!35455 _keys!1208) i!673) k0!934))))

(declare-fun b!1129319 () Bool)

(assert (=> b!1129319 call!48022))

(declare-fun lt!501236 () Unit!36842)

(assert (=> b!1129319 (= lt!501236 call!48028)))

(declare-fun e!642703 () Unit!36842)

(assert (=> b!1129319 (= e!642703 lt!501236)))

(declare-fun b!1129320 () Bool)

(declare-fun res!754674 () Bool)

(assert (=> b!1129320 (=> (not res!754674) (not e!642710))))

(assert (=> b!1129320 (= res!754674 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35993 _keys!1208))))))

(declare-fun b!1129321 () Bool)

(declare-fun e!642698 () Bool)

(assert (=> b!1129321 (= e!642698 tp_is_empty!28411)))

(declare-fun b!1129322 () Bool)

(declare-fun c!109848 () Bool)

(assert (=> b!1129322 (= c!109848 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501237))))

(assert (=> b!1129322 (= e!642703 e!642701)))

(declare-fun b!1129323 () Bool)

(assert (=> b!1129323 (= e!642709 e!642705)))

(declare-fun res!754679 () Bool)

(assert (=> b!1129323 (=> res!754679 e!642705)))

(assert (=> b!1129323 (= res!754679 (not (= (select (arr!35455 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1129323 e!642697))

(declare-fun c!109845 () Bool)

(assert (=> b!1129323 (= c!109845 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501231 () Unit!36842)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!419 (array!73604 array!73606 (_ BitVec 32) (_ BitVec 32) V!43009 V!43009 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36842)

(assert (=> b!1129323 (= lt!501231 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!419 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48022 () Bool)

(assert (=> bm!48022 (= call!48026 (contains!6476 (ite c!109846 lt!501235 call!48027) k0!934))))

(declare-fun res!754670 () Bool)

(assert (=> start!98174 (=> (not res!754670) (not e!642710))))

(assert (=> start!98174 (= res!754670 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35993 _keys!1208))))))

(assert (=> start!98174 e!642710))

(assert (=> start!98174 tp_is_empty!28411))

(declare-fun array_inv!27278 (array!73604) Bool)

(assert (=> start!98174 (array_inv!27278 _keys!1208)))

(assert (=> start!98174 true))

(assert (=> start!98174 tp!84346))

(declare-fun e!642700 () Bool)

(declare-fun array_inv!27279 (array!73606) Bool)

(assert (=> start!98174 (and (array_inv!27279 _values!996) e!642700)))

(declare-fun bm!48023 () Bool)

(assert (=> bm!48023 (= call!48028 call!48023)))

(declare-fun b!1129324 () Bool)

(assert (=> b!1129324 (= e!642706 e!642703)))

(assert (=> b!1129324 (= c!109847 (and (not lt!501237) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1129325 () Bool)

(declare-fun Unit!36844 () Unit!36842)

(assert (=> b!1129325 (= e!642701 Unit!36844)))

(declare-fun b!1129326 () Bool)

(declare-fun mapRes!44434 () Bool)

(assert (=> b!1129326 (= e!642700 (and e!642711 mapRes!44434))))

(declare-fun condMapEmpty!44434 () Bool)

(declare-fun mapDefault!44434 () ValueCell!13496)

(assert (=> b!1129326 (= condMapEmpty!44434 (= (arr!35456 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13496)) mapDefault!44434)))))

(declare-fun b!1129327 () Bool)

(declare-fun e!642699 () Bool)

(assert (=> b!1129327 (= e!642699 (not e!642702))))

(declare-fun res!754673 () Bool)

(assert (=> b!1129327 (=> res!754673 e!642702)))

(assert (=> b!1129327 (= res!754673 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129327 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501232 () Unit!36842)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73604 (_ BitVec 64) (_ BitVec 32)) Unit!36842)

(assert (=> b!1129327 (= lt!501232 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!48024 () Bool)

(assert (=> bm!48024 (= call!48029 (getCurrentListMapNoExtraKeys!4524 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48025 () Bool)

(assert (=> bm!48025 (= call!48025 (+!3466 lt!501229 (ite (or c!109846 c!109847) (tuple2!18049 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18049 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun mapIsEmpty!44434 () Bool)

(assert (=> mapIsEmpty!44434 mapRes!44434))

(declare-fun b!1129328 () Bool)

(declare-fun res!754677 () Bool)

(assert (=> b!1129328 (=> (not res!754677) (not e!642699))))

(declare-datatypes ((List!24800 0))(
  ( (Nil!24797) (Cons!24796 (h!26005 (_ BitVec 64)) (t!35664 List!24800)) )
))
(declare-fun arrayNoDuplicates!0 (array!73604 (_ BitVec 32) List!24800) Bool)

(assert (=> b!1129328 (= res!754677 (arrayNoDuplicates!0 lt!501223 #b00000000000000000000000000000000 Nil!24797))))

(declare-fun b!1129329 () Bool)

(assert (=> b!1129329 (= e!642707 true)))

(declare-fun lt!501230 () Bool)

(declare-fun getCurrentListMap!4354 (array!73604 array!73606 (_ BitVec 32) (_ BitVec 32) V!43009 V!43009 (_ BitVec 32) Int) ListLongMap!16017)

(assert (=> b!1129329 (= lt!501230 (contains!6476 (getCurrentListMap!4354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1129330 () Bool)

(assert (=> b!1129330 (= e!642710 e!642699)))

(declare-fun res!754683 () Bool)

(assert (=> b!1129330 (=> (not res!754683) (not e!642699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73604 (_ BitVec 32)) Bool)

(assert (=> b!1129330 (= res!754683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501223 mask!1564))))

(assert (=> b!1129330 (= lt!501223 (array!73605 (store (arr!35455 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35993 _keys!1208)))))

(declare-fun b!1129331 () Bool)

(declare-fun res!754671 () Bool)

(assert (=> b!1129331 (=> (not res!754671) (not e!642710))))

(assert (=> b!1129331 (= res!754671 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24797))))

(declare-fun mapNonEmpty!44434 () Bool)

(declare-fun tp!84347 () Bool)

(assert (=> mapNonEmpty!44434 (= mapRes!44434 (and tp!84347 e!642698))))

(declare-fun mapValue!44434 () ValueCell!13496)

(declare-fun mapRest!44434 () (Array (_ BitVec 32) ValueCell!13496))

(declare-fun mapKey!44434 () (_ BitVec 32))

(assert (=> mapNonEmpty!44434 (= (arr!35456 _values!996) (store mapRest!44434 mapKey!44434 mapValue!44434))))

(declare-fun b!1129332 () Bool)

(declare-fun res!754676 () Bool)

(assert (=> b!1129332 (=> (not res!754676) (not e!642710))))

(assert (=> b!1129332 (= res!754676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!48026 () Bool)

(assert (=> bm!48026 (= call!48022 call!48026)))

(assert (= (and start!98174 res!754670) b!1129313))

(assert (= (and b!1129313 res!754680) b!1129311))

(assert (= (and b!1129311 res!754672) b!1129332))

(assert (= (and b!1129332 res!754676) b!1129331))

(assert (= (and b!1129331 res!754671) b!1129320))

(assert (= (and b!1129320 res!754674) b!1129310))

(assert (= (and b!1129310 res!754675) b!1129318))

(assert (= (and b!1129318 res!754684) b!1129330))

(assert (= (and b!1129330 res!754683) b!1129328))

(assert (= (and b!1129328 res!754677) b!1129327))

(assert (= (and b!1129327 (not res!754673)) b!1129314))

(assert (= (and b!1129314 (not res!754682)) b!1129323))

(assert (= (and b!1129323 c!109845) b!1129309))

(assert (= (and b!1129323 (not c!109845)) b!1129315))

(assert (= (or b!1129309 b!1129315) bm!48021))

(assert (= (or b!1129309 b!1129315) bm!48024))

(assert (= (and b!1129323 (not res!754679)) b!1129317))

(assert (= (and b!1129317 (not res!754681)) b!1129308))

(assert (= (and b!1129308 c!109846) b!1129312))

(assert (= (and b!1129308 (not c!109846)) b!1129324))

(assert (= (and b!1129324 c!109847) b!1129319))

(assert (= (and b!1129324 (not c!109847)) b!1129322))

(assert (= (and b!1129322 c!109848) b!1129316))

(assert (= (and b!1129322 (not c!109848)) b!1129325))

(assert (= (or b!1129319 b!1129316) bm!48023))

(assert (= (or b!1129319 b!1129316) bm!48020))

(assert (= (or b!1129319 b!1129316) bm!48026))

(assert (= (or b!1129312 bm!48026) bm!48022))

(assert (= (or b!1129312 bm!48023) bm!48019))

(assert (= (or b!1129312 bm!48020) bm!48025))

(assert (= (and b!1129308 (not res!754678)) b!1129329))

(assert (= (and b!1129326 condMapEmpty!44434) mapIsEmpty!44434))

(assert (= (and b!1129326 (not condMapEmpty!44434)) mapNonEmpty!44434))

(get-info :version)

(assert (= (and mapNonEmpty!44434 ((_ is ValueCellFull!13496) mapValue!44434)) b!1129321))

(assert (= (and b!1129326 ((_ is ValueCellFull!13496) mapDefault!44434)) b!1129307))

(assert (= start!98174 b!1129326))

(declare-fun b_lambda!18833 () Bool)

(assert (=> (not b_lambda!18833) (not b!1129314)))

(declare-fun t!35662 () Bool)

(declare-fun tb!8685 () Bool)

(assert (=> (and start!98174 (= defaultEntry!1004 defaultEntry!1004) t!35662) tb!8685))

(declare-fun result!17939 () Bool)

(assert (=> tb!8685 (= result!17939 tp_is_empty!28411)))

(assert (=> b!1129314 t!35662))

(declare-fun b_and!38525 () Bool)

(assert (= b_and!38523 (and (=> t!35662 result!17939) b_and!38525)))

(declare-fun m!1042185 () Bool)

(assert (=> b!1129314 m!1042185))

(declare-fun m!1042187 () Bool)

(assert (=> b!1129314 m!1042187))

(declare-fun m!1042189 () Bool)

(assert (=> b!1129314 m!1042189))

(declare-fun m!1042191 () Bool)

(assert (=> b!1129314 m!1042191))

(declare-fun m!1042193 () Bool)

(assert (=> b!1129331 m!1042193))

(declare-fun m!1042195 () Bool)

(assert (=> mapNonEmpty!44434 m!1042195))

(declare-fun m!1042197 () Bool)

(assert (=> b!1129310 m!1042197))

(declare-fun m!1042199 () Bool)

(assert (=> bm!48025 m!1042199))

(declare-fun m!1042201 () Bool)

(assert (=> bm!48019 m!1042201))

(declare-fun m!1042203 () Bool)

(assert (=> b!1129332 m!1042203))

(declare-fun m!1042205 () Bool)

(assert (=> start!98174 m!1042205))

(declare-fun m!1042207 () Bool)

(assert (=> start!98174 m!1042207))

(declare-fun m!1042209 () Bool)

(assert (=> b!1129317 m!1042209))

(declare-fun m!1042211 () Bool)

(assert (=> b!1129317 m!1042211))

(declare-fun m!1042213 () Bool)

(assert (=> b!1129327 m!1042213))

(declare-fun m!1042215 () Bool)

(assert (=> b!1129327 m!1042215))

(declare-fun m!1042217 () Bool)

(assert (=> b!1129330 m!1042217))

(declare-fun m!1042219 () Bool)

(assert (=> b!1129330 m!1042219))

(declare-fun m!1042221 () Bool)

(assert (=> bm!48021 m!1042221))

(declare-fun m!1042223 () Bool)

(assert (=> b!1129329 m!1042223))

(assert (=> b!1129329 m!1042223))

(declare-fun m!1042225 () Bool)

(assert (=> b!1129329 m!1042225))

(assert (=> bm!48024 m!1042211))

(declare-fun m!1042227 () Bool)

(assert (=> b!1129312 m!1042227))

(declare-fun m!1042229 () Bool)

(assert (=> b!1129312 m!1042229))

(assert (=> b!1129312 m!1042229))

(declare-fun m!1042231 () Bool)

(assert (=> b!1129312 m!1042231))

(declare-fun m!1042233 () Bool)

(assert (=> b!1129313 m!1042233))

(declare-fun m!1042235 () Bool)

(assert (=> b!1129318 m!1042235))

(declare-fun m!1042237 () Bool)

(assert (=> b!1129323 m!1042237))

(declare-fun m!1042239 () Bool)

(assert (=> b!1129323 m!1042239))

(declare-fun m!1042241 () Bool)

(assert (=> bm!48022 m!1042241))

(declare-fun m!1042243 () Bool)

(assert (=> b!1129328 m!1042243))

(declare-fun m!1042245 () Bool)

(assert (=> b!1129309 m!1042245))

(check-sat (not b!1129332) (not bm!48019) (not b!1129329) (not b!1129310) (not bm!48021) tp_is_empty!28411 (not bm!48025) (not b!1129314) (not b!1129317) (not b!1129309) (not b_lambda!18833) (not b!1129323) (not b!1129327) (not mapNonEmpty!44434) (not start!98174) (not bm!48022) (not b!1129330) (not b_next!23881) (not b!1129331) (not bm!48024) (not b!1129328) b_and!38525 (not b!1129313) (not b!1129312))
(check-sat b_and!38525 (not b_next!23881))
