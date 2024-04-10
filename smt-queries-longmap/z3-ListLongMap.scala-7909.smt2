; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98200 () Bool)

(assert start!98200)

(declare-fun b_free!23901 () Bool)

(declare-fun b_next!23901 () Bool)

(assert (=> start!98200 (= b_free!23901 (not b_next!23901))))

(declare-fun tp!84406 () Bool)

(declare-fun b_and!38585 () Bool)

(assert (=> start!98200 (= tp!84406 b_and!38585)))

(declare-fun res!755192 () Bool)

(declare-fun e!643240 () Bool)

(assert (=> start!98200 (=> (not res!755192) (not e!643240))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73719 0))(
  ( (array!73720 (arr!35512 (Array (_ BitVec 32) (_ BitVec 64))) (size!36048 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73719)

(assert (=> start!98200 (= res!755192 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36048 _keys!1208))))))

(assert (=> start!98200 e!643240))

(declare-fun tp_is_empty!28431 () Bool)

(assert (=> start!98200 tp_is_empty!28431))

(declare-fun array_inv!27242 (array!73719) Bool)

(assert (=> start!98200 (array_inv!27242 _keys!1208)))

(assert (=> start!98200 true))

(assert (=> start!98200 tp!84406))

(declare-datatypes ((V!43035 0))(
  ( (V!43036 (val!14272 Int)) )
))
(declare-datatypes ((ValueCell!13506 0))(
  ( (ValueCellFull!13506 (v!16905 V!43035)) (EmptyCell!13506) )
))
(declare-datatypes ((array!73721 0))(
  ( (array!73722 (arr!35513 (Array (_ BitVec 32) ValueCell!13506)) (size!36049 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73721)

(declare-fun e!643233 () Bool)

(declare-fun array_inv!27243 (array!73721) Bool)

(assert (=> start!98200 (and (array_inv!27243 _values!996) e!643233)))

(declare-fun b!1130236 () Bool)

(declare-fun e!643239 () Bool)

(assert (=> b!1130236 (= e!643240 e!643239)))

(declare-fun res!755194 () Bool)

(assert (=> b!1130236 (=> (not res!755194) (not e!643239))))

(declare-fun lt!501875 () array!73719)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73719 (_ BitVec 32)) Bool)

(assert (=> b!1130236 (= res!755194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501875 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1130236 (= lt!501875 (array!73720 (store (arr!35512 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36048 _keys!1208)))))

(declare-fun b!1130237 () Bool)

(declare-datatypes ((tuple2!17978 0))(
  ( (tuple2!17979 (_1!9000 (_ BitVec 64)) (_2!9000 V!43035)) )
))
(declare-datatypes ((List!24742 0))(
  ( (Nil!24739) (Cons!24738 (h!25947 tuple2!17978) (t!35635 List!24742)) )
))
(declare-datatypes ((ListLongMap!15947 0))(
  ( (ListLongMap!15948 (toList!7989 List!24742)) )
))
(declare-fun call!48286 () ListLongMap!15947)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!48289 () ListLongMap!15947)

(declare-fun e!643232 () Bool)

(declare-fun -!1168 (ListLongMap!15947 (_ BitVec 64)) ListLongMap!15947)

(assert (=> b!1130237 (= e!643232 (= call!48286 (-!1168 call!48289 k0!934)))))

(declare-fun b!1130238 () Bool)

(declare-fun e!643236 () Bool)

(declare-fun e!643242 () Bool)

(assert (=> b!1130238 (= e!643236 e!643242)))

(declare-fun res!755198 () Bool)

(assert (=> b!1130238 (=> res!755198 e!643242)))

(assert (=> b!1130238 (= res!755198 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!43035)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!501881 () ListLongMap!15947)

(declare-fun minValue!944 () V!43035)

(declare-fun lt!501887 () array!73721)

(declare-fun getCurrentListMapNoExtraKeys!4476 (array!73719 array!73721 (_ BitVec 32) (_ BitVec 32) V!43035 V!43035 (_ BitVec 32) Int) ListLongMap!15947)

(assert (=> b!1130238 (= lt!501881 (getCurrentListMapNoExtraKeys!4476 lt!501875 lt!501887 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2552 (Int (_ BitVec 64)) V!43035)

(assert (=> b!1130238 (= lt!501887 (array!73722 (store (arr!35513 _values!996) i!673 (ValueCellFull!13506 (dynLambda!2552 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36049 _values!996)))))

(declare-fun lt!501884 () ListLongMap!15947)

(assert (=> b!1130238 (= lt!501884 (getCurrentListMapNoExtraKeys!4476 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!44464 () Bool)

(declare-fun mapRes!44464 () Bool)

(declare-fun tp!84407 () Bool)

(declare-fun e!643241 () Bool)

(assert (=> mapNonEmpty!44464 (= mapRes!44464 (and tp!84407 e!643241))))

(declare-fun mapKey!44464 () (_ BitVec 32))

(declare-fun mapValue!44464 () ValueCell!13506)

(declare-fun mapRest!44464 () (Array (_ BitVec 32) ValueCell!13506))

(assert (=> mapNonEmpty!44464 (= (arr!35513 _values!996) (store mapRest!44464 mapKey!44464 mapValue!44464))))

(declare-fun b!1130239 () Bool)

(assert (=> b!1130239 (= e!643241 tp_is_empty!28431)))

(declare-fun b!1130240 () Bool)

(declare-fun e!643228 () Bool)

(declare-fun e!643235 () Bool)

(assert (=> b!1130240 (= e!643228 e!643235)))

(declare-fun res!755189 () Bool)

(assert (=> b!1130240 (=> res!755189 e!643235)))

(assert (=> b!1130240 (= res!755189 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36048 _keys!1208))))))

(declare-datatypes ((Unit!37026 0))(
  ( (Unit!37027) )
))
(declare-fun lt!501883 () Unit!37026)

(declare-fun e!643234 () Unit!37026)

(assert (=> b!1130240 (= lt!501883 e!643234)))

(declare-fun c!109994 () Bool)

(declare-fun lt!501880 () Bool)

(assert (=> b!1130240 (= c!109994 (and (not lt!501880) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1130240 (= lt!501880 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1130241 () Bool)

(declare-fun res!755195 () Bool)

(assert (=> b!1130241 (=> (not res!755195) (not e!643240))))

(declare-datatypes ((List!24743 0))(
  ( (Nil!24740) (Cons!24739 (h!25948 (_ BitVec 64)) (t!35636 List!24743)) )
))
(declare-fun arrayNoDuplicates!0 (array!73719 (_ BitVec 32) List!24743) Bool)

(assert (=> b!1130241 (= res!755195 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24740))))

(declare-fun bm!48282 () Bool)

(declare-fun lt!501879 () ListLongMap!15947)

(declare-fun call!48287 () Bool)

(declare-fun call!48285 () ListLongMap!15947)

(declare-fun contains!6512 (ListLongMap!15947 (_ BitVec 64)) Bool)

(assert (=> bm!48282 (= call!48287 (contains!6512 (ite c!109994 lt!501879 call!48285) k0!934))))

(declare-fun bm!48283 () Bool)

(declare-fun call!48291 () ListLongMap!15947)

(assert (=> bm!48283 (= call!48285 call!48291)))

(declare-fun b!1130242 () Bool)

(declare-fun res!755200 () Bool)

(assert (=> b!1130242 (=> (not res!755200) (not e!643240))))

(assert (=> b!1130242 (= res!755200 (= (select (arr!35512 _keys!1208) i!673) k0!934))))

(declare-fun b!1130243 () Bool)

(declare-fun call!48288 () Bool)

(assert (=> b!1130243 call!48288))

(declare-fun lt!501882 () Unit!37026)

(declare-fun call!48290 () Unit!37026)

(assert (=> b!1130243 (= lt!501882 call!48290)))

(declare-fun e!643229 () Unit!37026)

(assert (=> b!1130243 (= e!643229 lt!501882)))

(declare-fun b!1130244 () Bool)

(declare-fun e!643237 () Unit!37026)

(declare-fun Unit!37028 () Unit!37026)

(assert (=> b!1130244 (= e!643237 Unit!37028)))

(declare-fun b!1130245 () Bool)

(declare-fun res!755193 () Bool)

(assert (=> b!1130245 (=> (not res!755193) (not e!643240))))

(assert (=> b!1130245 (= res!755193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1130246 () Bool)

(declare-fun lt!501877 () Unit!37026)

(assert (=> b!1130246 (= e!643237 lt!501877)))

(assert (=> b!1130246 (= lt!501877 call!48290)))

(assert (=> b!1130246 call!48288))

(declare-fun c!109992 () Bool)

(declare-fun lt!501876 () ListLongMap!15947)

(declare-fun bm!48284 () Bool)

(declare-fun +!3439 (ListLongMap!15947 tuple2!17978) ListLongMap!15947)

(assert (=> bm!48284 (= call!48291 (+!3439 lt!501876 (ite (or c!109994 c!109992) (tuple2!17979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!17979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun bm!48285 () Bool)

(assert (=> bm!48285 (= call!48286 (getCurrentListMapNoExtraKeys!4476 lt!501875 lt!501887 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!48286 () Bool)

(assert (=> bm!48286 (= call!48288 call!48287)))

(declare-fun b!1130247 () Bool)

(assert (=> b!1130247 (= e!643234 e!643229)))

(assert (=> b!1130247 (= c!109992 (and (not lt!501880) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1130248 () Bool)

(declare-fun c!109993 () Bool)

(assert (=> b!1130248 (= c!109993 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!501880))))

(assert (=> b!1130248 (= e!643229 e!643237)))

(declare-fun b!1130249 () Bool)

(declare-fun res!755199 () Bool)

(assert (=> b!1130249 (=> (not res!755199) (not e!643239))))

(assert (=> b!1130249 (= res!755199 (arrayNoDuplicates!0 lt!501875 #b00000000000000000000000000000000 Nil!24740))))

(declare-fun b!1130250 () Bool)

(declare-fun e!643238 () Bool)

(assert (=> b!1130250 (= e!643233 (and e!643238 mapRes!44464))))

(declare-fun condMapEmpty!44464 () Bool)

(declare-fun mapDefault!44464 () ValueCell!13506)

(assert (=> b!1130250 (= condMapEmpty!44464 (= (arr!35513 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13506)) mapDefault!44464)))))

(declare-fun b!1130251 () Bool)

(declare-fun res!755202 () Bool)

(assert (=> b!1130251 (=> (not res!755202) (not e!643240))))

(assert (=> b!1130251 (= res!755202 (and (= (size!36049 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36048 _keys!1208) (size!36049 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1130252 () Bool)

(assert (=> b!1130252 (= e!643235 true)))

(declare-fun lt!501886 () Bool)

(declare-fun getCurrentListMap!4422 (array!73719 array!73721 (_ BitVec 32) (_ BitVec 32) V!43035 V!43035 (_ BitVec 32) Int) ListLongMap!15947)

(assert (=> b!1130252 (= lt!501886 (contains!6512 (getCurrentListMap!4422 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun call!48292 () Unit!37026)

(declare-fun bm!48287 () Bool)

(declare-fun addStillContains!701 (ListLongMap!15947 (_ BitVec 64) V!43035 (_ BitVec 64)) Unit!37026)

(assert (=> bm!48287 (= call!48292 (addStillContains!701 lt!501876 (ite (or c!109994 c!109992) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!109994 c!109992) zeroValue!944 minValue!944) k0!934))))

(declare-fun mapIsEmpty!44464 () Bool)

(assert (=> mapIsEmpty!44464 mapRes!44464))

(declare-fun b!1130253 () Bool)

(declare-fun res!755190 () Bool)

(assert (=> b!1130253 (=> (not res!755190) (not e!643240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1130253 (= res!755190 (validMask!0 mask!1564))))

(declare-fun b!1130254 () Bool)

(assert (=> b!1130254 (= e!643239 (not e!643236))))

(declare-fun res!755196 () Bool)

(assert (=> b!1130254 (=> res!755196 e!643236)))

(assert (=> b!1130254 (= res!755196 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1130254 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501885 () Unit!37026)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73719 (_ BitVec 64) (_ BitVec 32)) Unit!37026)

(assert (=> b!1130254 (= lt!501885 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1130255 () Bool)

(declare-fun e!643231 () Bool)

(assert (=> b!1130255 (= e!643242 e!643231)))

(declare-fun res!755197 () Bool)

(assert (=> b!1130255 (=> res!755197 e!643231)))

(assert (=> b!1130255 (= res!755197 (not (= (select (arr!35512 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1130255 e!643232))

(declare-fun c!109995 () Bool)

(assert (=> b!1130255 (= c!109995 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!501874 () Unit!37026)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!421 (array!73719 array!73721 (_ BitVec 32) (_ BitVec 32) V!43035 V!43035 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37026)

(assert (=> b!1130255 (= lt!501874 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!421 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130256 () Bool)

(assert (=> b!1130256 (= e!643232 (= call!48286 call!48289))))

(declare-fun b!1130257 () Bool)

(declare-fun res!755203 () Bool)

(assert (=> b!1130257 (=> (not res!755203) (not e!643240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1130257 (= res!755203 (validKeyInArray!0 k0!934))))

(declare-fun bm!48288 () Bool)

(assert (=> bm!48288 (= call!48290 call!48292)))

(declare-fun bm!48289 () Bool)

(assert (=> bm!48289 (= call!48289 (getCurrentListMapNoExtraKeys!4476 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1130258 () Bool)

(assert (=> b!1130258 (= e!643238 tp_is_empty!28431)))

(declare-fun b!1130259 () Bool)

(declare-fun res!755201 () Bool)

(assert (=> b!1130259 (=> (not res!755201) (not e!643240))))

(assert (=> b!1130259 (= res!755201 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36048 _keys!1208))))))

(declare-fun b!1130260 () Bool)

(declare-fun lt!501873 () Unit!37026)

(assert (=> b!1130260 (= e!643234 lt!501873)))

(declare-fun lt!501878 () Unit!37026)

(assert (=> b!1130260 (= lt!501878 call!48292)))

(assert (=> b!1130260 (= lt!501879 call!48291)))

(assert (=> b!1130260 call!48287))

(assert (=> b!1130260 (= lt!501873 (addStillContains!701 lt!501879 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1130260 (contains!6512 (+!3439 lt!501879 (tuple2!17979 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1130261 () Bool)

(assert (=> b!1130261 (= e!643231 e!643228)))

(declare-fun res!755191 () Bool)

(assert (=> b!1130261 (=> res!755191 e!643228)))

(assert (=> b!1130261 (= res!755191 (not (contains!6512 lt!501876 k0!934)))))

(assert (=> b!1130261 (= lt!501876 (getCurrentListMapNoExtraKeys!4476 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98200 res!755192) b!1130253))

(assert (= (and b!1130253 res!755190) b!1130251))

(assert (= (and b!1130251 res!755202) b!1130245))

(assert (= (and b!1130245 res!755193) b!1130241))

(assert (= (and b!1130241 res!755195) b!1130259))

(assert (= (and b!1130259 res!755201) b!1130257))

(assert (= (and b!1130257 res!755203) b!1130242))

(assert (= (and b!1130242 res!755200) b!1130236))

(assert (= (and b!1130236 res!755194) b!1130249))

(assert (= (and b!1130249 res!755199) b!1130254))

(assert (= (and b!1130254 (not res!755196)) b!1130238))

(assert (= (and b!1130238 (not res!755198)) b!1130255))

(assert (= (and b!1130255 c!109995) b!1130237))

(assert (= (and b!1130255 (not c!109995)) b!1130256))

(assert (= (or b!1130237 b!1130256) bm!48285))

(assert (= (or b!1130237 b!1130256) bm!48289))

(assert (= (and b!1130255 (not res!755197)) b!1130261))

(assert (= (and b!1130261 (not res!755191)) b!1130240))

(assert (= (and b!1130240 c!109994) b!1130260))

(assert (= (and b!1130240 (not c!109994)) b!1130247))

(assert (= (and b!1130247 c!109992) b!1130243))

(assert (= (and b!1130247 (not c!109992)) b!1130248))

(assert (= (and b!1130248 c!109993) b!1130246))

(assert (= (and b!1130248 (not c!109993)) b!1130244))

(assert (= (or b!1130243 b!1130246) bm!48288))

(assert (= (or b!1130243 b!1130246) bm!48283))

(assert (= (or b!1130243 b!1130246) bm!48286))

(assert (= (or b!1130260 bm!48286) bm!48282))

(assert (= (or b!1130260 bm!48288) bm!48287))

(assert (= (or b!1130260 bm!48283) bm!48284))

(assert (= (and b!1130240 (not res!755189)) b!1130252))

(assert (= (and b!1130250 condMapEmpty!44464) mapIsEmpty!44464))

(assert (= (and b!1130250 (not condMapEmpty!44464)) mapNonEmpty!44464))

(get-info :version)

(assert (= (and mapNonEmpty!44464 ((_ is ValueCellFull!13506) mapValue!44464)) b!1130239))

(assert (= (and b!1130250 ((_ is ValueCellFull!13506) mapDefault!44464)) b!1130258))

(assert (= start!98200 b!1130250))

(declare-fun b_lambda!18871 () Bool)

(assert (=> (not b_lambda!18871) (not b!1130238)))

(declare-fun t!35634 () Bool)

(declare-fun tb!8713 () Bool)

(assert (=> (and start!98200 (= defaultEntry!1004 defaultEntry!1004) t!35634) tb!8713))

(declare-fun result!17987 () Bool)

(assert (=> tb!8713 (= result!17987 tp_is_empty!28431)))

(assert (=> b!1130238 t!35634))

(declare-fun b_and!38587 () Bool)

(assert (= b_and!38585 (and (=> t!35634 result!17987) b_and!38587)))

(declare-fun m!1043437 () Bool)

(assert (=> b!1130255 m!1043437))

(declare-fun m!1043439 () Bool)

(assert (=> b!1130255 m!1043439))

(declare-fun m!1043441 () Bool)

(assert (=> bm!48289 m!1043441))

(declare-fun m!1043443 () Bool)

(assert (=> bm!48285 m!1043443))

(declare-fun m!1043445 () Bool)

(assert (=> mapNonEmpty!44464 m!1043445))

(declare-fun m!1043447 () Bool)

(assert (=> bm!48287 m!1043447))

(declare-fun m!1043449 () Bool)

(assert (=> b!1130260 m!1043449))

(declare-fun m!1043451 () Bool)

(assert (=> b!1130260 m!1043451))

(assert (=> b!1130260 m!1043451))

(declare-fun m!1043453 () Bool)

(assert (=> b!1130260 m!1043453))

(declare-fun m!1043455 () Bool)

(assert (=> bm!48282 m!1043455))

(declare-fun m!1043457 () Bool)

(assert (=> b!1130237 m!1043457))

(declare-fun m!1043459 () Bool)

(assert (=> b!1130261 m!1043459))

(assert (=> b!1130261 m!1043441))

(declare-fun m!1043461 () Bool)

(assert (=> b!1130249 m!1043461))

(declare-fun m!1043463 () Bool)

(assert (=> b!1130257 m!1043463))

(declare-fun m!1043465 () Bool)

(assert (=> bm!48284 m!1043465))

(declare-fun m!1043467 () Bool)

(assert (=> b!1130238 m!1043467))

(declare-fun m!1043469 () Bool)

(assert (=> b!1130238 m!1043469))

(declare-fun m!1043471 () Bool)

(assert (=> b!1130238 m!1043471))

(declare-fun m!1043473 () Bool)

(assert (=> b!1130238 m!1043473))

(declare-fun m!1043475 () Bool)

(assert (=> b!1130236 m!1043475))

(declare-fun m!1043477 () Bool)

(assert (=> b!1130236 m!1043477))

(declare-fun m!1043479 () Bool)

(assert (=> start!98200 m!1043479))

(declare-fun m!1043481 () Bool)

(assert (=> start!98200 m!1043481))

(declare-fun m!1043483 () Bool)

(assert (=> b!1130242 m!1043483))

(declare-fun m!1043485 () Bool)

(assert (=> b!1130253 m!1043485))

(declare-fun m!1043487 () Bool)

(assert (=> b!1130241 m!1043487))

(declare-fun m!1043489 () Bool)

(assert (=> b!1130245 m!1043489))

(declare-fun m!1043491 () Bool)

(assert (=> b!1130254 m!1043491))

(declare-fun m!1043493 () Bool)

(assert (=> b!1130254 m!1043493))

(declare-fun m!1043495 () Bool)

(assert (=> b!1130252 m!1043495))

(assert (=> b!1130252 m!1043495))

(declare-fun m!1043497 () Bool)

(assert (=> b!1130252 m!1043497))

(check-sat (not mapNonEmpty!44464) (not b!1130255) (not b!1130249) (not b!1130261) tp_is_empty!28431 (not b!1130260) b_and!38587 (not bm!48285) (not b!1130253) (not b!1130245) (not bm!48284) (not start!98200) (not b!1130257) (not b_lambda!18871) (not b!1130238) (not b!1130236) (not bm!48282) (not b!1130252) (not b!1130237) (not b!1130241) (not bm!48289) (not b!1130254) (not bm!48287) (not b_next!23901))
(check-sat b_and!38587 (not b_next!23901))
