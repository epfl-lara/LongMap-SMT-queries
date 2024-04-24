; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98428 () Bool)

(assert start!98428)

(declare-fun b_free!23893 () Bool)

(declare-fun b_next!23893 () Bool)

(assert (=> start!98428 (= b_free!23893 (not b_next!23893))))

(declare-fun tp!84382 () Bool)

(declare-fun b_and!38579 () Bool)

(assert (=> start!98428 (= tp!84382 b_and!38579)))

(declare-datatypes ((V!43025 0))(
  ( (V!43026 (val!14268 Int)) )
))
(declare-fun zeroValue!944 () V!43025)

(declare-fun bm!48253 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((array!73749 0))(
  ( (array!73750 (arr!35521 (Array (_ BitVec 32) (_ BitVec 64))) (size!36058 (_ BitVec 32))) )
))
(declare-fun lt!502222 () array!73749)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13502 0))(
  ( (ValueCellFull!13502 (v!16897 V!43025)) (EmptyCell!13502) )
))
(declare-datatypes ((array!73751 0))(
  ( (array!73752 (arr!35522 (Array (_ BitVec 32) ValueCell!13502)) (size!36059 (_ BitVec 32))) )
))
(declare-fun lt!502208 () array!73751)

(declare-fun minValue!944 () V!43025)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17984 0))(
  ( (tuple2!17985 (_1!9003 (_ BitVec 64)) (_2!9003 V!43025)) )
))
(declare-datatypes ((List!24762 0))(
  ( (Nil!24759) (Cons!24758 (h!25976 tuple2!17984) (t!35639 List!24762)) )
))
(declare-datatypes ((ListLongMap!15961 0))(
  ( (ListLongMap!15962 (toList!7996 List!24762)) )
))
(declare-fun call!48261 () ListLongMap!15961)

(declare-fun getCurrentListMapNoExtraKeys!4515 (array!73749 array!73751 (_ BitVec 32) (_ BitVec 32) V!43025 V!43025 (_ BitVec 32) Int) ListLongMap!15961)

(assert (=> bm!48253 (= call!48261 (getCurrentListMapNoExtraKeys!4515 lt!502222 lt!502208 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131243 () Bool)

(declare-fun e!643912 () Bool)

(declare-fun e!643904 () Bool)

(assert (=> b!1131243 (= e!643912 e!643904)))

(declare-fun res!755531 () Bool)

(assert (=> b!1131243 (=> res!755531 e!643904)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1131243 (= res!755531 (not (= from!1455 i!673)))))

(declare-fun lt!502220 () ListLongMap!15961)

(assert (=> b!1131243 (= lt!502220 (getCurrentListMapNoExtraKeys!4515 lt!502222 lt!502208 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73751)

(declare-fun dynLambda!2577 (Int (_ BitVec 64)) V!43025)

(assert (=> b!1131243 (= lt!502208 (array!73752 (store (arr!35522 _values!996) i!673 (ValueCellFull!13502 (dynLambda!2577 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36059 _values!996)))))

(declare-fun _keys!1208 () array!73749)

(declare-fun lt!502217 () ListLongMap!15961)

(assert (=> b!1131243 (= lt!502217 (getCurrentListMapNoExtraKeys!4515 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1131244 () Bool)

(declare-fun call!48258 () Bool)

(assert (=> b!1131244 call!48258))

(declare-datatypes ((Unit!36993 0))(
  ( (Unit!36994) )
))
(declare-fun lt!502210 () Unit!36993)

(declare-fun call!48257 () Unit!36993)

(assert (=> b!1131244 (= lt!502210 call!48257)))

(declare-fun e!643905 () Unit!36993)

(assert (=> b!1131244 (= e!643905 lt!502210)))

(declare-fun b!1131245 () Bool)

(declare-fun e!643907 () Bool)

(declare-fun e!643915 () Bool)

(declare-fun mapRes!44452 () Bool)

(assert (=> b!1131245 (= e!643907 (and e!643915 mapRes!44452))))

(declare-fun condMapEmpty!44452 () Bool)

(declare-fun mapDefault!44452 () ValueCell!13502)

(assert (=> b!1131245 (= condMapEmpty!44452 (= (arr!35522 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13502)) mapDefault!44452)))))

(declare-fun mapNonEmpty!44452 () Bool)

(declare-fun tp!84383 () Bool)

(declare-fun e!643906 () Bool)

(assert (=> mapNonEmpty!44452 (= mapRes!44452 (and tp!84383 e!643906))))

(declare-fun mapRest!44452 () (Array (_ BitVec 32) ValueCell!13502))

(declare-fun mapKey!44452 () (_ BitVec 32))

(declare-fun mapValue!44452 () ValueCell!13502)

(assert (=> mapNonEmpty!44452 (= (arr!35522 _values!996) (store mapRest!44452 mapKey!44452 mapValue!44452))))

(declare-fun b!1131246 () Bool)

(declare-fun res!755541 () Bool)

(declare-fun e!643908 () Bool)

(assert (=> b!1131246 (=> (not res!755541) (not e!643908))))

(declare-datatypes ((List!24763 0))(
  ( (Nil!24760) (Cons!24759 (h!25977 (_ BitVec 64)) (t!35640 List!24763)) )
))
(declare-fun arrayNoDuplicates!0 (array!73749 (_ BitVec 32) List!24763) Bool)

(assert (=> b!1131246 (= res!755541 (arrayNoDuplicates!0 lt!502222 #b00000000000000000000000000000000 Nil!24760))))

(declare-fun b!1131247 () Bool)

(declare-fun res!755540 () Bool)

(declare-fun e!643910 () Bool)

(assert (=> b!1131247 (=> (not res!755540) (not e!643910))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1131247 (= res!755540 (= (select (arr!35521 _keys!1208) i!673) k0!934))))

(declare-fun b!1131248 () Bool)

(declare-fun res!755538 () Bool)

(assert (=> b!1131248 (=> (not res!755538) (not e!643910))))

(assert (=> b!1131248 (= res!755538 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24760))))

(declare-fun b!1131249 () Bool)

(declare-fun res!755542 () Bool)

(assert (=> b!1131249 (=> (not res!755542) (not e!643910))))

(assert (=> b!1131249 (= res!755542 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36058 _keys!1208))))))

(declare-fun b!1131250 () Bool)

(declare-fun tp_is_empty!28423 () Bool)

(assert (=> b!1131250 (= e!643906 tp_is_empty!28423)))

(declare-fun lt!502218 () ListLongMap!15961)

(declare-fun call!48263 () ListLongMap!15961)

(declare-fun lt!502219 () ListLongMap!15961)

(declare-fun bm!48254 () Bool)

(declare-fun c!110355 () Bool)

(declare-fun c!110357 () Bool)

(declare-fun +!3463 (ListLongMap!15961 tuple2!17984) ListLongMap!15961)

(assert (=> bm!48254 (= call!48263 (+!3463 (ite c!110357 lt!502218 lt!502219) (ite c!110357 (tuple2!17985 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110355 (tuple2!17985 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17985 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!48255 () Bool)

(declare-fun call!48260 () ListLongMap!15961)

(assert (=> bm!48255 (= call!48260 call!48263)))

(declare-fun b!1131251 () Bool)

(declare-fun e!643917 () Bool)

(declare-fun e!643911 () Bool)

(assert (=> b!1131251 (= e!643917 e!643911)))

(declare-fun res!755545 () Bool)

(assert (=> b!1131251 (=> res!755545 e!643911)))

(assert (=> b!1131251 (= res!755545 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36058 _keys!1208))))))

(declare-fun lt!502211 () Unit!36993)

(declare-fun e!643903 () Unit!36993)

(assert (=> b!1131251 (= lt!502211 e!643903)))

(declare-fun lt!502216 () Bool)

(assert (=> b!1131251 (= c!110357 (and (not lt!502216) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1131251 (= lt!502216 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1131252 () Bool)

(declare-fun e!643913 () Bool)

(assert (=> b!1131252 (= e!643904 e!643913)))

(declare-fun res!755533 () Bool)

(assert (=> b!1131252 (=> res!755533 e!643913)))

(assert (=> b!1131252 (= res!755533 (not (= (select (arr!35521 _keys!1208) from!1455) k0!934)))))

(declare-fun e!643909 () Bool)

(assert (=> b!1131252 e!643909))

(declare-fun c!110356 () Bool)

(assert (=> b!1131252 (= c!110356 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!502213 () Unit!36993)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!418 (array!73749 array!73751 (_ BitVec 32) (_ BitVec 32) V!43025 V!43025 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36993)

(assert (=> b!1131252 (= lt!502213 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!418 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48256 () Bool)

(declare-fun call!48256 () Unit!36993)

(declare-fun addStillContains!689 (ListLongMap!15961 (_ BitVec 64) V!43025 (_ BitVec 64)) Unit!36993)

(assert (=> bm!48256 (= call!48256 (addStillContains!689 (ite c!110357 lt!502218 lt!502219) (ite c!110357 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110355 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110357 minValue!944 (ite c!110355 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1131253 () Bool)

(assert (=> b!1131253 (= e!643903 e!643905)))

(assert (=> b!1131253 (= c!110355 (and (not lt!502216) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!48257 () Bool)

(declare-fun call!48262 () ListLongMap!15961)

(assert (=> bm!48257 (= call!48262 (getCurrentListMapNoExtraKeys!4515 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1131254 () Bool)

(declare-fun res!755544 () Bool)

(assert (=> b!1131254 (=> (not res!755544) (not e!643910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1131254 (= res!755544 (validKeyInArray!0 k0!934))))

(declare-fun b!1131255 () Bool)

(declare-fun e!643916 () Unit!36993)

(declare-fun lt!502214 () Unit!36993)

(assert (=> b!1131255 (= e!643916 lt!502214)))

(assert (=> b!1131255 (= lt!502214 call!48257)))

(assert (=> b!1131255 call!48258))

(declare-fun b!1131256 () Bool)

(assert (=> b!1131256 (= e!643908 (not e!643912))))

(declare-fun res!755534 () Bool)

(assert (=> b!1131256 (=> res!755534 e!643912)))

(assert (=> b!1131256 (= res!755534 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1131256 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!502215 () Unit!36993)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73749 (_ BitVec 64) (_ BitVec 32)) Unit!36993)

(assert (=> b!1131256 (= lt!502215 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1131257 () Bool)

(declare-fun Unit!36995 () Unit!36993)

(assert (=> b!1131257 (= e!643916 Unit!36995)))

(declare-fun mapIsEmpty!44452 () Bool)

(assert (=> mapIsEmpty!44452 mapRes!44452))

(declare-fun b!1131258 () Bool)

(declare-fun c!110354 () Bool)

(assert (=> b!1131258 (= c!110354 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!502216))))

(assert (=> b!1131258 (= e!643905 e!643916)))

(declare-fun b!1131259 () Bool)

(declare-fun res!755536 () Bool)

(assert (=> b!1131259 (=> (not res!755536) (not e!643910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73749 (_ BitVec 32)) Bool)

(assert (=> b!1131259 (= res!755536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!755539 () Bool)

(assert (=> start!98428 (=> (not res!755539) (not e!643910))))

(assert (=> start!98428 (= res!755539 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36058 _keys!1208))))))

(assert (=> start!98428 e!643910))

(assert (=> start!98428 tp_is_empty!28423))

(declare-fun array_inv!27308 (array!73749) Bool)

(assert (=> start!98428 (array_inv!27308 _keys!1208)))

(assert (=> start!98428 true))

(assert (=> start!98428 tp!84382))

(declare-fun array_inv!27309 (array!73751) Bool)

(assert (=> start!98428 (and (array_inv!27309 _values!996) e!643907)))

(declare-fun bm!48258 () Bool)

(declare-fun call!48259 () Bool)

(assert (=> bm!48258 (= call!48258 call!48259)))

(declare-fun b!1131260 () Bool)

(assert (=> b!1131260 (= e!643909 (= call!48261 call!48262))))

(declare-fun b!1131261 () Bool)

(declare-fun lt!502221 () Unit!36993)

(assert (=> b!1131261 (= e!643903 lt!502221)))

(declare-fun lt!502209 () Unit!36993)

(assert (=> b!1131261 (= lt!502209 (addStillContains!689 lt!502219 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1131261 (= lt!502218 (+!3463 lt!502219 (tuple2!17985 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1131261 call!48259))

(assert (=> b!1131261 (= lt!502221 call!48256)))

(declare-fun contains!6531 (ListLongMap!15961 (_ BitVec 64)) Bool)

(assert (=> b!1131261 (contains!6531 call!48263 k0!934)))

(declare-fun b!1131262 () Bool)

(declare-fun -!1159 (ListLongMap!15961 (_ BitVec 64)) ListLongMap!15961)

(assert (=> b!1131262 (= e!643909 (= call!48261 (-!1159 call!48262 k0!934)))))

(declare-fun b!1131263 () Bool)

(declare-fun res!755537 () Bool)

(assert (=> b!1131263 (=> (not res!755537) (not e!643910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1131263 (= res!755537 (validMask!0 mask!1564))))

(declare-fun b!1131264 () Bool)

(assert (=> b!1131264 (= e!643913 e!643917)))

(declare-fun res!755535 () Bool)

(assert (=> b!1131264 (=> res!755535 e!643917)))

(assert (=> b!1131264 (= res!755535 (not (contains!6531 lt!502219 k0!934)))))

(assert (=> b!1131264 (= lt!502219 (getCurrentListMapNoExtraKeys!4515 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48259 () Bool)

(assert (=> bm!48259 (= call!48257 call!48256)))

(declare-fun b!1131265 () Bool)

(assert (=> b!1131265 (= e!643911 true)))

(declare-fun lt!502212 () Bool)

(declare-fun getCurrentListMap!4427 (array!73749 array!73751 (_ BitVec 32) (_ BitVec 32) V!43025 V!43025 (_ BitVec 32) Int) ListLongMap!15961)

(assert (=> b!1131265 (= lt!502212 (contains!6531 (getCurrentListMap!4427 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1131266 () Bool)

(declare-fun res!755543 () Bool)

(assert (=> b!1131266 (=> (not res!755543) (not e!643910))))

(assert (=> b!1131266 (= res!755543 (and (= (size!36059 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36058 _keys!1208) (size!36059 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1131267 () Bool)

(assert (=> b!1131267 (= e!643910 e!643908)))

(declare-fun res!755532 () Bool)

(assert (=> b!1131267 (=> (not res!755532) (not e!643908))))

(assert (=> b!1131267 (= res!755532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!502222 mask!1564))))

(assert (=> b!1131267 (= lt!502222 (array!73750 (store (arr!35521 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36058 _keys!1208)))))

(declare-fun bm!48260 () Bool)

(assert (=> bm!48260 (= call!48259 (contains!6531 (ite c!110357 lt!502218 call!48260) k0!934))))

(declare-fun b!1131268 () Bool)

(assert (=> b!1131268 (= e!643915 tp_is_empty!28423)))

(assert (= (and start!98428 res!755539) b!1131263))

(assert (= (and b!1131263 res!755537) b!1131266))

(assert (= (and b!1131266 res!755543) b!1131259))

(assert (= (and b!1131259 res!755536) b!1131248))

(assert (= (and b!1131248 res!755538) b!1131249))

(assert (= (and b!1131249 res!755542) b!1131254))

(assert (= (and b!1131254 res!755544) b!1131247))

(assert (= (and b!1131247 res!755540) b!1131267))

(assert (= (and b!1131267 res!755532) b!1131246))

(assert (= (and b!1131246 res!755541) b!1131256))

(assert (= (and b!1131256 (not res!755534)) b!1131243))

(assert (= (and b!1131243 (not res!755531)) b!1131252))

(assert (= (and b!1131252 c!110356) b!1131262))

(assert (= (and b!1131252 (not c!110356)) b!1131260))

(assert (= (or b!1131262 b!1131260) bm!48253))

(assert (= (or b!1131262 b!1131260) bm!48257))

(assert (= (and b!1131252 (not res!755533)) b!1131264))

(assert (= (and b!1131264 (not res!755535)) b!1131251))

(assert (= (and b!1131251 c!110357) b!1131261))

(assert (= (and b!1131251 (not c!110357)) b!1131253))

(assert (= (and b!1131253 c!110355) b!1131244))

(assert (= (and b!1131253 (not c!110355)) b!1131258))

(assert (= (and b!1131258 c!110354) b!1131255))

(assert (= (and b!1131258 (not c!110354)) b!1131257))

(assert (= (or b!1131244 b!1131255) bm!48259))

(assert (= (or b!1131244 b!1131255) bm!48255))

(assert (= (or b!1131244 b!1131255) bm!48258))

(assert (= (or b!1131261 bm!48258) bm!48260))

(assert (= (or b!1131261 bm!48259) bm!48256))

(assert (= (or b!1131261 bm!48255) bm!48254))

(assert (= (and b!1131251 (not res!755545)) b!1131265))

(assert (= (and b!1131245 condMapEmpty!44452) mapIsEmpty!44452))

(assert (= (and b!1131245 (not condMapEmpty!44452)) mapNonEmpty!44452))

(get-info :version)

(assert (= (and mapNonEmpty!44452 ((_ is ValueCellFull!13502) mapValue!44452)) b!1131250))

(assert (= (and b!1131245 ((_ is ValueCellFull!13502) mapDefault!44452)) b!1131268))

(assert (= start!98428 b!1131245))

(declare-fun b_lambda!18873 () Bool)

(assert (=> (not b_lambda!18873) (not b!1131243)))

(declare-fun t!35638 () Bool)

(declare-fun tb!8697 () Bool)

(assert (=> (and start!98428 (= defaultEntry!1004 defaultEntry!1004) t!35638) tb!8697))

(declare-fun result!17963 () Bool)

(assert (=> tb!8697 (= result!17963 tp_is_empty!28423)))

(assert (=> b!1131243 t!35638))

(declare-fun b_and!38581 () Bool)

(assert (= b_and!38579 (and (=> t!35638 result!17963) b_and!38581)))

(declare-fun m!1044867 () Bool)

(assert (=> b!1131263 m!1044867))

(declare-fun m!1044869 () Bool)

(assert (=> b!1131247 m!1044869))

(declare-fun m!1044871 () Bool)

(assert (=> bm!48254 m!1044871))

(declare-fun m!1044873 () Bool)

(assert (=> b!1131248 m!1044873))

(declare-fun m!1044875 () Bool)

(assert (=> b!1131259 m!1044875))

(declare-fun m!1044877 () Bool)

(assert (=> b!1131243 m!1044877))

(declare-fun m!1044879 () Bool)

(assert (=> b!1131243 m!1044879))

(declare-fun m!1044881 () Bool)

(assert (=> b!1131243 m!1044881))

(declare-fun m!1044883 () Bool)

(assert (=> b!1131243 m!1044883))

(declare-fun m!1044885 () Bool)

(assert (=> b!1131267 m!1044885))

(declare-fun m!1044887 () Bool)

(assert (=> b!1131267 m!1044887))

(declare-fun m!1044889 () Bool)

(assert (=> b!1131246 m!1044889))

(declare-fun m!1044891 () Bool)

(assert (=> b!1131254 m!1044891))

(declare-fun m!1044893 () Bool)

(assert (=> b!1131256 m!1044893))

(declare-fun m!1044895 () Bool)

(assert (=> b!1131256 m!1044895))

(declare-fun m!1044897 () Bool)

(assert (=> b!1131252 m!1044897))

(declare-fun m!1044899 () Bool)

(assert (=> b!1131252 m!1044899))

(declare-fun m!1044901 () Bool)

(assert (=> start!98428 m!1044901))

(declare-fun m!1044903 () Bool)

(assert (=> start!98428 m!1044903))

(declare-fun m!1044905 () Bool)

(assert (=> bm!48257 m!1044905))

(declare-fun m!1044907 () Bool)

(assert (=> b!1131262 m!1044907))

(declare-fun m!1044909 () Bool)

(assert (=> mapNonEmpty!44452 m!1044909))

(declare-fun m!1044911 () Bool)

(assert (=> b!1131265 m!1044911))

(assert (=> b!1131265 m!1044911))

(declare-fun m!1044913 () Bool)

(assert (=> b!1131265 m!1044913))

(declare-fun m!1044915 () Bool)

(assert (=> b!1131261 m!1044915))

(declare-fun m!1044917 () Bool)

(assert (=> b!1131261 m!1044917))

(declare-fun m!1044919 () Bool)

(assert (=> b!1131261 m!1044919))

(declare-fun m!1044921 () Bool)

(assert (=> bm!48253 m!1044921))

(declare-fun m!1044923 () Bool)

(assert (=> b!1131264 m!1044923))

(assert (=> b!1131264 m!1044905))

(declare-fun m!1044925 () Bool)

(assert (=> bm!48260 m!1044925))

(declare-fun m!1044927 () Bool)

(assert (=> bm!48256 m!1044927))

(check-sat (not bm!48256) (not bm!48254) (not b!1131263) (not bm!48253) (not b!1131264) (not b!1131265) (not b!1131252) (not b!1131256) (not b!1131267) (not bm!48257) (not b!1131261) (not b!1131254) (not b!1131259) (not b!1131243) (not bm!48260) b_and!38581 (not b!1131262) (not mapNonEmpty!44452) (not start!98428) (not b!1131246) (not b!1131248) (not b_lambda!18873) tp_is_empty!28423 (not b_next!23893))
(check-sat b_and!38581 (not b_next!23893))
