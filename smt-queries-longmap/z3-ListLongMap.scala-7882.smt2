; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98038 () Bool)

(assert start!98038)

(declare-fun b_free!23739 () Bool)

(declare-fun b_next!23739 () Bool)

(assert (=> start!98038 (= b_free!23739 (not b_next!23739))))

(declare-fun tp!83920 () Bool)

(declare-fun b_and!38261 () Bool)

(assert (=> start!98038 (= tp!83920 b_and!38261)))

(declare-fun b!1125256 () Bool)

(declare-fun e!640543 () Bool)

(declare-fun e!640538 () Bool)

(assert (=> b!1125256 (= e!640543 e!640538)))

(declare-fun res!751886 () Bool)

(assert (=> b!1125256 (=> res!751886 e!640538)))

(declare-datatypes ((V!42819 0))(
  ( (V!42820 (val!14191 Int)) )
))
(declare-datatypes ((tuple2!17830 0))(
  ( (tuple2!17831 (_1!8926 (_ BitVec 64)) (_2!8926 V!42819)) )
))
(declare-datatypes ((List!24609 0))(
  ( (Nil!24606) (Cons!24605 (h!25814 tuple2!17830) (t!35340 List!24609)) )
))
(declare-datatypes ((ListLongMap!15799 0))(
  ( (ListLongMap!15800 (toList!7915 List!24609)) )
))
(declare-fun lt!499783 () ListLongMap!15799)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6452 (ListLongMap!15799 (_ BitVec 64)) Bool)

(assert (=> b!1125256 (= res!751886 (not (contains!6452 lt!499783 k0!934)))))

(declare-fun zeroValue!944 () V!42819)

(declare-datatypes ((array!73401 0))(
  ( (array!73402 (arr!35353 (Array (_ BitVec 32) (_ BitVec 64))) (size!35889 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73401)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13425 0))(
  ( (ValueCellFull!13425 (v!16824 V!42819)) (EmptyCell!13425) )
))
(declare-datatypes ((array!73403 0))(
  ( (array!73404 (arr!35354 (Array (_ BitVec 32) ValueCell!13425)) (size!35890 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73403)

(declare-fun minValue!944 () V!42819)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4403 (array!73401 array!73403 (_ BitVec 32) (_ BitVec 32) V!42819 V!42819 (_ BitVec 32) Int) ListLongMap!15799)

(assert (=> b!1125256 (= lt!499783 (getCurrentListMapNoExtraKeys!4403 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125257 () Bool)

(declare-fun call!47500 () ListLongMap!15799)

(declare-fun e!640544 () Bool)

(declare-fun call!47499 () ListLongMap!15799)

(declare-fun -!1117 (ListLongMap!15799 (_ BitVec 64)) ListLongMap!15799)

(assert (=> b!1125257 (= e!640544 (= call!47500 (-!1117 call!47499 k0!934)))))

(declare-fun b!1125258 () Bool)

(declare-fun res!751888 () Bool)

(declare-fun e!640542 () Bool)

(assert (=> b!1125258 (=> (not res!751888) (not e!640542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73401 (_ BitVec 32)) Bool)

(assert (=> b!1125258 (= res!751888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!47496 () Bool)

(declare-fun lt!499779 () array!73403)

(declare-fun lt!499782 () array!73401)

(assert (=> bm!47496 (= call!47500 (getCurrentListMapNoExtraKeys!4403 lt!499782 lt!499779 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44221 () Bool)

(declare-fun mapRes!44221 () Bool)

(declare-fun tp!83921 () Bool)

(declare-fun e!640541 () Bool)

(assert (=> mapNonEmpty!44221 (= mapRes!44221 (and tp!83921 e!640541))))

(declare-fun mapValue!44221 () ValueCell!13425)

(declare-fun mapRest!44221 () (Array (_ BitVec 32) ValueCell!13425))

(declare-fun mapKey!44221 () (_ BitVec 32))

(assert (=> mapNonEmpty!44221 (= (arr!35354 _values!996) (store mapRest!44221 mapKey!44221 mapValue!44221))))

(declare-fun b!1125259 () Bool)

(declare-fun e!640540 () Bool)

(assert (=> b!1125259 (= e!640542 e!640540)))

(declare-fun res!751895 () Bool)

(assert (=> b!1125259 (=> (not res!751895) (not e!640540))))

(assert (=> b!1125259 (= res!751895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499782 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125259 (= lt!499782 (array!73402 (store (arr!35353 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35889 _keys!1208)))))

(declare-fun b!1125260 () Bool)

(declare-fun res!751889 () Bool)

(assert (=> b!1125260 (=> res!751889 e!640538)))

(assert (=> b!1125260 (= res!751889 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1125261 () Bool)

(declare-fun e!640536 () Bool)

(declare-fun e!640545 () Bool)

(assert (=> b!1125261 (= e!640536 e!640545)))

(declare-fun res!751890 () Bool)

(assert (=> b!1125261 (=> res!751890 e!640545)))

(assert (=> b!1125261 (= res!751890 (not (= from!1455 i!673)))))

(declare-fun lt!499781 () ListLongMap!15799)

(assert (=> b!1125261 (= lt!499781 (getCurrentListMapNoExtraKeys!4403 lt!499782 lt!499779 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2496 (Int (_ BitVec 64)) V!42819)

(assert (=> b!1125261 (= lt!499779 (array!73404 (store (arr!35354 _values!996) i!673 (ValueCellFull!13425 (dynLambda!2496 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35890 _values!996)))))

(declare-fun lt!499784 () ListLongMap!15799)

(assert (=> b!1125261 (= lt!499784 (getCurrentListMapNoExtraKeys!4403 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!751893 () Bool)

(assert (=> start!98038 (=> (not res!751893) (not e!640542))))

(assert (=> start!98038 (= res!751893 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35889 _keys!1208))))))

(assert (=> start!98038 e!640542))

(declare-fun tp_is_empty!28269 () Bool)

(assert (=> start!98038 tp_is_empty!28269))

(declare-fun array_inv!27138 (array!73401) Bool)

(assert (=> start!98038 (array_inv!27138 _keys!1208)))

(assert (=> start!98038 true))

(assert (=> start!98038 tp!83920))

(declare-fun e!640537 () Bool)

(declare-fun array_inv!27139 (array!73403) Bool)

(assert (=> start!98038 (and (array_inv!27139 _values!996) e!640537)))

(declare-fun mapIsEmpty!44221 () Bool)

(assert (=> mapIsEmpty!44221 mapRes!44221))

(declare-fun b!1125262 () Bool)

(declare-fun e!640539 () Bool)

(assert (=> b!1125262 (= e!640537 (and e!640539 mapRes!44221))))

(declare-fun condMapEmpty!44221 () Bool)

(declare-fun mapDefault!44221 () ValueCell!13425)

(assert (=> b!1125262 (= condMapEmpty!44221 (= (arr!35354 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13425)) mapDefault!44221)))))

(declare-fun bm!47497 () Bool)

(assert (=> bm!47497 (= call!47499 (getCurrentListMapNoExtraKeys!4403 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125263 () Bool)

(declare-fun res!751898 () Bool)

(assert (=> b!1125263 (=> (not res!751898) (not e!640542))))

(assert (=> b!1125263 (= res!751898 (= (select (arr!35353 _keys!1208) i!673) k0!934))))

(declare-fun b!1125264 () Bool)

(assert (=> b!1125264 (= e!640541 tp_is_empty!28269)))

(declare-fun b!1125265 () Bool)

(declare-fun res!751900 () Bool)

(assert (=> b!1125265 (=> (not res!751900) (not e!640542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125265 (= res!751900 (validKeyInArray!0 k0!934))))

(declare-fun b!1125266 () Bool)

(declare-fun res!751897 () Bool)

(assert (=> b!1125266 (=> (not res!751897) (not e!640542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125266 (= res!751897 (validMask!0 mask!1564))))

(declare-fun b!1125267 () Bool)

(assert (=> b!1125267 (= e!640538 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!35889 _keys!1208))))))

(declare-fun +!3422 (ListLongMap!15799 tuple2!17830) ListLongMap!15799)

(assert (=> b!1125267 (contains!6452 (+!3422 lt!499783 (tuple2!17831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-datatypes ((Unit!36880 0))(
  ( (Unit!36881) )
))
(declare-fun lt!499778 () Unit!36880)

(declare-fun addStillContains!684 (ListLongMap!15799 (_ BitVec 64) V!42819 (_ BitVec 64)) Unit!36880)

(assert (=> b!1125267 (= lt!499778 (addStillContains!684 lt!499783 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1125268 () Bool)

(assert (=> b!1125268 (= e!640544 (= call!47500 call!47499))))

(declare-fun b!1125269 () Bool)

(declare-fun res!751892 () Bool)

(assert (=> b!1125269 (=> (not res!751892) (not e!640540))))

(declare-datatypes ((List!24610 0))(
  ( (Nil!24607) (Cons!24606 (h!25815 (_ BitVec 64)) (t!35341 List!24610)) )
))
(declare-fun arrayNoDuplicates!0 (array!73401 (_ BitVec 32) List!24610) Bool)

(assert (=> b!1125269 (= res!751892 (arrayNoDuplicates!0 lt!499782 #b00000000000000000000000000000000 Nil!24607))))

(declare-fun b!1125270 () Bool)

(assert (=> b!1125270 (= e!640539 tp_is_empty!28269)))

(declare-fun b!1125271 () Bool)

(assert (=> b!1125271 (= e!640540 (not e!640536))))

(declare-fun res!751899 () Bool)

(assert (=> b!1125271 (=> res!751899 e!640536)))

(assert (=> b!1125271 (= res!751899 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125271 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499780 () Unit!36880)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73401 (_ BitVec 64) (_ BitVec 32)) Unit!36880)

(assert (=> b!1125271 (= lt!499780 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1125272 () Bool)

(declare-fun res!751896 () Bool)

(assert (=> b!1125272 (=> (not res!751896) (not e!640542))))

(assert (=> b!1125272 (= res!751896 (and (= (size!35890 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35889 _keys!1208) (size!35890 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125273 () Bool)

(declare-fun res!751887 () Bool)

(assert (=> b!1125273 (=> (not res!751887) (not e!640542))))

(assert (=> b!1125273 (= res!751887 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35889 _keys!1208))))))

(declare-fun b!1125274 () Bool)

(declare-fun res!751891 () Bool)

(assert (=> b!1125274 (=> (not res!751891) (not e!640542))))

(assert (=> b!1125274 (= res!751891 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24607))))

(declare-fun b!1125275 () Bool)

(assert (=> b!1125275 (= e!640545 e!640543)))

(declare-fun res!751894 () Bool)

(assert (=> b!1125275 (=> res!751894 e!640543)))

(assert (=> b!1125275 (= res!751894 (not (= (select (arr!35353 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1125275 e!640544))

(declare-fun c!109599 () Bool)

(assert (=> b!1125275 (= c!109599 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499777 () Unit!36880)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!364 (array!73401 array!73403 (_ BitVec 32) (_ BitVec 32) V!42819 V!42819 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36880)

(assert (=> b!1125275 (= lt!499777 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!364 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98038 res!751893) b!1125266))

(assert (= (and b!1125266 res!751897) b!1125272))

(assert (= (and b!1125272 res!751896) b!1125258))

(assert (= (and b!1125258 res!751888) b!1125274))

(assert (= (and b!1125274 res!751891) b!1125273))

(assert (= (and b!1125273 res!751887) b!1125265))

(assert (= (and b!1125265 res!751900) b!1125263))

(assert (= (and b!1125263 res!751898) b!1125259))

(assert (= (and b!1125259 res!751895) b!1125269))

(assert (= (and b!1125269 res!751892) b!1125271))

(assert (= (and b!1125271 (not res!751899)) b!1125261))

(assert (= (and b!1125261 (not res!751890)) b!1125275))

(assert (= (and b!1125275 c!109599) b!1125257))

(assert (= (and b!1125275 (not c!109599)) b!1125268))

(assert (= (or b!1125257 b!1125268) bm!47496))

(assert (= (or b!1125257 b!1125268) bm!47497))

(assert (= (and b!1125275 (not res!751894)) b!1125256))

(assert (= (and b!1125256 (not res!751886)) b!1125260))

(assert (= (and b!1125260 (not res!751889)) b!1125267))

(assert (= (and b!1125262 condMapEmpty!44221) mapIsEmpty!44221))

(assert (= (and b!1125262 (not condMapEmpty!44221)) mapNonEmpty!44221))

(get-info :version)

(assert (= (and mapNonEmpty!44221 ((_ is ValueCellFull!13425) mapValue!44221)) b!1125264))

(assert (= (and b!1125262 ((_ is ValueCellFull!13425) mapDefault!44221)) b!1125270))

(assert (= start!98038 b!1125262))

(declare-fun b_lambda!18709 () Bool)

(assert (=> (not b_lambda!18709) (not b!1125261)))

(declare-fun t!35339 () Bool)

(declare-fun tb!8551 () Bool)

(assert (=> (and start!98038 (= defaultEntry!1004 defaultEntry!1004) t!35339) tb!8551))

(declare-fun result!17663 () Bool)

(assert (=> tb!8551 (= result!17663 tp_is_empty!28269)))

(assert (=> b!1125261 t!35339))

(declare-fun b_and!38263 () Bool)

(assert (= b_and!38261 (and (=> t!35339 result!17663) b_and!38263)))

(declare-fun m!1039423 () Bool)

(assert (=> start!98038 m!1039423))

(declare-fun m!1039425 () Bool)

(assert (=> start!98038 m!1039425))

(declare-fun m!1039427 () Bool)

(assert (=> b!1125274 m!1039427))

(declare-fun m!1039429 () Bool)

(assert (=> bm!47496 m!1039429))

(declare-fun m!1039431 () Bool)

(assert (=> b!1125265 m!1039431))

(declare-fun m!1039433 () Bool)

(assert (=> b!1125261 m!1039433))

(declare-fun m!1039435 () Bool)

(assert (=> b!1125261 m!1039435))

(declare-fun m!1039437 () Bool)

(assert (=> b!1125261 m!1039437))

(declare-fun m!1039439 () Bool)

(assert (=> b!1125261 m!1039439))

(declare-fun m!1039441 () Bool)

(assert (=> b!1125263 m!1039441))

(declare-fun m!1039443 () Bool)

(assert (=> b!1125275 m!1039443))

(declare-fun m!1039445 () Bool)

(assert (=> b!1125275 m!1039445))

(declare-fun m!1039447 () Bool)

(assert (=> b!1125266 m!1039447))

(declare-fun m!1039449 () Bool)

(assert (=> b!1125269 m!1039449))

(declare-fun m!1039451 () Bool)

(assert (=> b!1125259 m!1039451))

(declare-fun m!1039453 () Bool)

(assert (=> b!1125259 m!1039453))

(declare-fun m!1039455 () Bool)

(assert (=> bm!47497 m!1039455))

(declare-fun m!1039457 () Bool)

(assert (=> b!1125256 m!1039457))

(assert (=> b!1125256 m!1039455))

(declare-fun m!1039459 () Bool)

(assert (=> b!1125257 m!1039459))

(declare-fun m!1039461 () Bool)

(assert (=> mapNonEmpty!44221 m!1039461))

(declare-fun m!1039463 () Bool)

(assert (=> b!1125271 m!1039463))

(declare-fun m!1039465 () Bool)

(assert (=> b!1125271 m!1039465))

(declare-fun m!1039467 () Bool)

(assert (=> b!1125267 m!1039467))

(assert (=> b!1125267 m!1039467))

(declare-fun m!1039469 () Bool)

(assert (=> b!1125267 m!1039469))

(declare-fun m!1039471 () Bool)

(assert (=> b!1125267 m!1039471))

(declare-fun m!1039473 () Bool)

(assert (=> b!1125258 m!1039473))

(check-sat (not b_lambda!18709) (not b!1125259) (not b!1125261) (not b!1125267) (not mapNonEmpty!44221) (not bm!47497) (not b_next!23739) (not b!1125274) (not bm!47496) (not b!1125256) (not b!1125275) (not b!1125257) (not b!1125265) tp_is_empty!28269 (not start!98038) (not b!1125258) (not b!1125266) b_and!38263 (not b!1125269) (not b!1125271))
(check-sat b_and!38263 (not b_next!23739))
