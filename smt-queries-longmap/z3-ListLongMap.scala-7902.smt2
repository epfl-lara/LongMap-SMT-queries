; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98158 () Bool)

(assert start!98158)

(declare-fun b_free!23859 () Bool)

(declare-fun b_next!23859 () Bool)

(assert (=> start!98158 (= b_free!23859 (not b_next!23859))))

(declare-fun tp!84280 () Bool)

(declare-fun b_and!38501 () Bool)

(assert (=> start!98158 (= tp!84280 b_and!38501)))

(declare-fun mapIsEmpty!44401 () Bool)

(declare-fun mapRes!44401 () Bool)

(assert (=> mapIsEmpty!44401 mapRes!44401))

(declare-fun b!1128656 () Bool)

(declare-fun e!642352 () Bool)

(declare-fun tp_is_empty!28389 () Bool)

(assert (=> b!1128656 (= e!642352 tp_is_empty!28389)))

(declare-fun b!1128657 () Bool)

(declare-fun e!642357 () Bool)

(declare-fun e!642354 () Bool)

(assert (=> b!1128657 (= e!642357 e!642354)))

(declare-fun res!754267 () Bool)

(assert (=> b!1128657 (=> res!754267 e!642354)))

(declare-datatypes ((array!73637 0))(
  ( (array!73638 (arr!35471 (Array (_ BitVec 32) (_ BitVec 64))) (size!36007 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73637)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1128657 (= res!754267 (not (= (select (arr!35471 _keys!1208) from!1455) k0!934)))))

(declare-fun e!642355 () Bool)

(assert (=> b!1128657 e!642355))

(declare-fun c!109779 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128657 (= c!109779 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42979 0))(
  ( (V!42980 (val!14251 Int)) )
))
(declare-fun zeroValue!944 () V!42979)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13485 0))(
  ( (ValueCellFull!13485 (v!16884 V!42979)) (EmptyCell!13485) )
))
(declare-datatypes ((array!73639 0))(
  ( (array!73640 (arr!35472 (Array (_ BitVec 32) ValueCell!13485)) (size!36008 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73639)

(declare-fun minValue!944 () V!42979)

(declare-datatypes ((Unit!36976 0))(
  ( (Unit!36977) )
))
(declare-fun lt!501036 () Unit!36976)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!405 (array!73637 array!73639 (_ BitVec 32) (_ BitVec 32) V!42979 V!42979 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36976)

(assert (=> b!1128657 (= lt!501036 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!405 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44401 () Bool)

(declare-fun tp!84281 () Bool)

(declare-fun e!642353 () Bool)

(assert (=> mapNonEmpty!44401 (= mapRes!44401 (and tp!84281 e!642353))))

(declare-fun mapKey!44401 () (_ BitVec 32))

(declare-fun mapRest!44401 () (Array (_ BitVec 32) ValueCell!13485))

(declare-fun mapValue!44401 () ValueCell!13485)

(assert (=> mapNonEmpty!44401 (= (arr!35472 _values!996) (store mapRest!44401 mapKey!44401 mapValue!44401))))

(declare-fun bm!47856 () Bool)

(declare-datatypes ((tuple2!17938 0))(
  ( (tuple2!17939 (_1!8980 (_ BitVec 64)) (_2!8980 V!42979)) )
))
(declare-datatypes ((List!24706 0))(
  ( (Nil!24703) (Cons!24702 (h!25911 tuple2!17938) (t!35557 List!24706)) )
))
(declare-datatypes ((ListLongMap!15907 0))(
  ( (ListLongMap!15908 (toList!7969 List!24706)) )
))
(declare-fun call!47860 () ListLongMap!15907)

(declare-fun getCurrentListMapNoExtraKeys!4456 (array!73637 array!73639 (_ BitVec 32) (_ BitVec 32) V!42979 V!42979 (_ BitVec 32) Int) ListLongMap!15907)

(assert (=> bm!47856 (= call!47860 (getCurrentListMapNoExtraKeys!4456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128658 () Bool)

(declare-fun call!47859 () ListLongMap!15907)

(assert (=> b!1128658 (= e!642355 (= call!47859 call!47860))))

(declare-fun b!1128659 () Bool)

(declare-fun res!754270 () Bool)

(declare-fun e!642351 () Bool)

(assert (=> b!1128659 (=> (not res!754270) (not e!642351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73637 (_ BitVec 32)) Bool)

(assert (=> b!1128659 (= res!754270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1128660 () Bool)

(declare-fun res!754268 () Bool)

(assert (=> b!1128660 (=> (not res!754268) (not e!642351))))

(assert (=> b!1128660 (= res!754268 (and (= (size!36008 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36007 _keys!1208) (size!36008 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!754269 () Bool)

(assert (=> start!98158 (=> (not res!754269) (not e!642351))))

(assert (=> start!98158 (= res!754269 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36007 _keys!1208))))))

(assert (=> start!98158 e!642351))

(assert (=> start!98158 tp_is_empty!28389))

(declare-fun array_inv!27216 (array!73637) Bool)

(assert (=> start!98158 (array_inv!27216 _keys!1208)))

(assert (=> start!98158 true))

(assert (=> start!98158 tp!84280))

(declare-fun e!642349 () Bool)

(declare-fun array_inv!27217 (array!73639) Bool)

(assert (=> start!98158 (and (array_inv!27217 _values!996) e!642349)))

(declare-fun b!1128661 () Bool)

(assert (=> b!1128661 (= e!642353 tp_is_empty!28389)))

(declare-fun b!1128662 () Bool)

(declare-fun res!754271 () Bool)

(assert (=> b!1128662 (=> (not res!754271) (not e!642351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128662 (= res!754271 (validKeyInArray!0 k0!934))))

(declare-fun b!1128663 () Bool)

(declare-fun e!642350 () Bool)

(declare-fun e!642348 () Bool)

(assert (=> b!1128663 (= e!642350 (not e!642348))))

(declare-fun res!754276 () Bool)

(assert (=> b!1128663 (=> res!754276 e!642348)))

(assert (=> b!1128663 (= res!754276 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128663 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501037 () Unit!36976)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73637 (_ BitVec 64) (_ BitVec 32)) Unit!36976)

(assert (=> b!1128663 (= lt!501037 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1128664 () Bool)

(declare-fun res!754274 () Bool)

(assert (=> b!1128664 (=> (not res!754274) (not e!642351))))

(assert (=> b!1128664 (= res!754274 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36007 _keys!1208))))))

(declare-fun b!1128665 () Bool)

(assert (=> b!1128665 (= e!642351 e!642350)))

(declare-fun res!754278 () Bool)

(assert (=> b!1128665 (=> (not res!754278) (not e!642350))))

(declare-fun lt!501040 () array!73637)

(assert (=> b!1128665 (= res!754278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501040 mask!1564))))

(assert (=> b!1128665 (= lt!501040 (array!73638 (store (arr!35471 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36007 _keys!1208)))))

(declare-fun b!1128666 () Bool)

(declare-fun res!754266 () Bool)

(assert (=> b!1128666 (=> (not res!754266) (not e!642350))))

(declare-datatypes ((List!24707 0))(
  ( (Nil!24704) (Cons!24703 (h!25912 (_ BitVec 64)) (t!35558 List!24707)) )
))
(declare-fun arrayNoDuplicates!0 (array!73637 (_ BitVec 32) List!24707) Bool)

(assert (=> b!1128666 (= res!754266 (arrayNoDuplicates!0 lt!501040 #b00000000000000000000000000000000 Nil!24704))))

(declare-fun b!1128667 () Bool)

(assert (=> b!1128667 (= e!642349 (and e!642352 mapRes!44401))))

(declare-fun condMapEmpty!44401 () Bool)

(declare-fun mapDefault!44401 () ValueCell!13485)

(assert (=> b!1128667 (= condMapEmpty!44401 (= (arr!35472 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13485)) mapDefault!44401)))))

(declare-fun b!1128668 () Bool)

(declare-fun res!754275 () Bool)

(assert (=> b!1128668 (=> (not res!754275) (not e!642351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128668 (= res!754275 (validMask!0 mask!1564))))

(declare-fun b!1128669 () Bool)

(declare-fun -!1151 (ListLongMap!15907 (_ BitVec 64)) ListLongMap!15907)

(assert (=> b!1128669 (= e!642355 (= call!47859 (-!1151 call!47860 k0!934)))))

(declare-fun b!1128670 () Bool)

(declare-fun res!754273 () Bool)

(assert (=> b!1128670 (=> res!754273 e!642354)))

(declare-fun contains!6493 (ListLongMap!15907 (_ BitVec 64)) Bool)

(assert (=> b!1128670 (= res!754273 (not (contains!6493 (getCurrentListMapNoExtraKeys!4456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934)))))

(declare-fun b!1128671 () Bool)

(assert (=> b!1128671 (= e!642348 e!642357)))

(declare-fun res!754277 () Bool)

(assert (=> b!1128671 (=> res!754277 e!642357)))

(assert (=> b!1128671 (= res!754277 (not (= from!1455 i!673)))))

(declare-fun lt!501038 () ListLongMap!15907)

(declare-fun lt!501041 () array!73639)

(assert (=> b!1128671 (= lt!501038 (getCurrentListMapNoExtraKeys!4456 lt!501040 lt!501041 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2537 (Int (_ BitVec 64)) V!42979)

(assert (=> b!1128671 (= lt!501041 (array!73640 (store (arr!35472 _values!996) i!673 (ValueCellFull!13485 (dynLambda!2537 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36008 _values!996)))))

(declare-fun lt!501039 () ListLongMap!15907)

(assert (=> b!1128671 (= lt!501039 (getCurrentListMapNoExtraKeys!4456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128672 () Bool)

(declare-fun res!754279 () Bool)

(assert (=> b!1128672 (=> (not res!754279) (not e!642351))))

(assert (=> b!1128672 (= res!754279 (= (select (arr!35471 _keys!1208) i!673) k0!934))))

(declare-fun b!1128673 () Bool)

(assert (=> b!1128673 (= e!642354 (or (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36007 _keys!1208)))))))

(declare-fun bm!47857 () Bool)

(assert (=> bm!47857 (= call!47859 (getCurrentListMapNoExtraKeys!4456 lt!501040 lt!501041 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128674 () Bool)

(declare-fun res!754272 () Bool)

(assert (=> b!1128674 (=> (not res!754272) (not e!642351))))

(assert (=> b!1128674 (= res!754272 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24704))))

(assert (= (and start!98158 res!754269) b!1128668))

(assert (= (and b!1128668 res!754275) b!1128660))

(assert (= (and b!1128660 res!754268) b!1128659))

(assert (= (and b!1128659 res!754270) b!1128674))

(assert (= (and b!1128674 res!754272) b!1128664))

(assert (= (and b!1128664 res!754274) b!1128662))

(assert (= (and b!1128662 res!754271) b!1128672))

(assert (= (and b!1128672 res!754279) b!1128665))

(assert (= (and b!1128665 res!754278) b!1128666))

(assert (= (and b!1128666 res!754266) b!1128663))

(assert (= (and b!1128663 (not res!754276)) b!1128671))

(assert (= (and b!1128671 (not res!754277)) b!1128657))

(assert (= (and b!1128657 c!109779) b!1128669))

(assert (= (and b!1128657 (not c!109779)) b!1128658))

(assert (= (or b!1128669 b!1128658) bm!47856))

(assert (= (or b!1128669 b!1128658) bm!47857))

(assert (= (and b!1128657 (not res!754267)) b!1128670))

(assert (= (and b!1128670 (not res!754273)) b!1128673))

(assert (= (and b!1128667 condMapEmpty!44401) mapIsEmpty!44401))

(assert (= (and b!1128667 (not condMapEmpty!44401)) mapNonEmpty!44401))

(get-info :version)

(assert (= (and mapNonEmpty!44401 ((_ is ValueCellFull!13485) mapValue!44401)) b!1128661))

(assert (= (and b!1128667 ((_ is ValueCellFull!13485) mapDefault!44401)) b!1128656))

(assert (= start!98158 b!1128667))

(declare-fun b_lambda!18829 () Bool)

(assert (=> (not b_lambda!18829) (not b!1128671)))

(declare-fun t!35556 () Bool)

(declare-fun tb!8671 () Bool)

(assert (=> (and start!98158 (= defaultEntry!1004 defaultEntry!1004) t!35556) tb!8671))

(declare-fun result!17903 () Bool)

(assert (=> tb!8671 (= result!17903 tp_is_empty!28389)))

(assert (=> b!1128671 t!35556))

(declare-fun b_and!38503 () Bool)

(assert (= b_and!38501 (and (=> t!35556 result!17903) b_and!38503)))

(declare-fun m!1042213 () Bool)

(assert (=> b!1128663 m!1042213))

(declare-fun m!1042215 () Bool)

(assert (=> b!1128663 m!1042215))

(declare-fun m!1042217 () Bool)

(assert (=> b!1128668 m!1042217))

(declare-fun m!1042219 () Bool)

(assert (=> b!1128671 m!1042219))

(declare-fun m!1042221 () Bool)

(assert (=> b!1128671 m!1042221))

(declare-fun m!1042223 () Bool)

(assert (=> b!1128671 m!1042223))

(declare-fun m!1042225 () Bool)

(assert (=> b!1128671 m!1042225))

(declare-fun m!1042227 () Bool)

(assert (=> b!1128670 m!1042227))

(assert (=> b!1128670 m!1042227))

(declare-fun m!1042229 () Bool)

(assert (=> b!1128670 m!1042229))

(declare-fun m!1042231 () Bool)

(assert (=> b!1128666 m!1042231))

(declare-fun m!1042233 () Bool)

(assert (=> b!1128672 m!1042233))

(assert (=> bm!47856 m!1042227))

(declare-fun m!1042235 () Bool)

(assert (=> start!98158 m!1042235))

(declare-fun m!1042237 () Bool)

(assert (=> start!98158 m!1042237))

(declare-fun m!1042239 () Bool)

(assert (=> b!1128665 m!1042239))

(declare-fun m!1042241 () Bool)

(assert (=> b!1128665 m!1042241))

(declare-fun m!1042243 () Bool)

(assert (=> b!1128674 m!1042243))

(declare-fun m!1042245 () Bool)

(assert (=> bm!47857 m!1042245))

(declare-fun m!1042247 () Bool)

(assert (=> b!1128657 m!1042247))

(declare-fun m!1042249 () Bool)

(assert (=> b!1128657 m!1042249))

(declare-fun m!1042251 () Bool)

(assert (=> mapNonEmpty!44401 m!1042251))

(declare-fun m!1042253 () Bool)

(assert (=> b!1128662 m!1042253))

(declare-fun m!1042255 () Bool)

(assert (=> b!1128669 m!1042255))

(declare-fun m!1042257 () Bool)

(assert (=> b!1128659 m!1042257))

(check-sat b_and!38503 tp_is_empty!28389 (not b!1128669) (not start!98158) (not mapNonEmpty!44401) (not bm!47857) (not b_lambda!18829) (not b_next!23859) (not b!1128668) (not b!1128663) (not b!1128666) (not b!1128657) (not b!1128670) (not bm!47856) (not b!1128665) (not b!1128674) (not b!1128671) (not b!1128662) (not b!1128659))
(check-sat b_and!38503 (not b_next!23859))
