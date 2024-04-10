; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100320 () Bool)

(assert start!100320)

(declare-fun b_free!25707 () Bool)

(declare-fun b_next!25707 () Bool)

(assert (=> start!100320 (= b_free!25707 (not b_next!25707))))

(declare-fun tp!90068 () Bool)

(declare-fun b_and!42283 () Bool)

(assert (=> start!100320 (= tp!90068 b_and!42283)))

(declare-fun mapIsEmpty!47417 () Bool)

(declare-fun mapRes!47417 () Bool)

(assert (=> mapIsEmpty!47417 mapRes!47417))

(declare-fun b!1197263 () Bool)

(declare-fun res!796793 () Bool)

(declare-fun e!680160 () Bool)

(assert (=> b!1197263 (=> (not res!796793) (not e!680160))))

(declare-datatypes ((array!77553 0))(
  ( (array!77554 (arr!37423 (Array (_ BitVec 32) (_ BitVec 64))) (size!37959 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77553)

(declare-datatypes ((List!26331 0))(
  ( (Nil!26328) (Cons!26327 (h!27536 (_ BitVec 64)) (t!39030 List!26331)) )
))
(declare-fun arrayNoDuplicates!0 (array!77553 (_ BitVec 32) List!26331) Bool)

(assert (=> b!1197263 (= res!796793 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26328))))

(declare-fun b!1197264 () Bool)

(declare-fun e!680162 () Bool)

(declare-fun e!680161 () Bool)

(assert (=> b!1197264 (= e!680162 (not e!680161))))

(declare-fun res!796796 () Bool)

(assert (=> b!1197264 (=> res!796796 e!680161)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1197264 (= res!796796 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37959 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197264 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39700 0))(
  ( (Unit!39701) )
))
(declare-fun lt!543226 () Unit!39700)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77553 (_ BitVec 64) (_ BitVec 32)) Unit!39700)

(assert (=> b!1197264 (= lt!543226 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1197265 () Bool)

(declare-fun e!680166 () Bool)

(declare-fun e!680164 () Bool)

(assert (=> b!1197265 (= e!680166 (and e!680164 mapRes!47417))))

(declare-fun condMapEmpty!47417 () Bool)

(declare-datatypes ((V!45643 0))(
  ( (V!45644 (val!15250 Int)) )
))
(declare-datatypes ((ValueCell!14484 0))(
  ( (ValueCellFull!14484 (v!17888 V!45643)) (EmptyCell!14484) )
))
(declare-datatypes ((array!77555 0))(
  ( (array!77556 (arr!37424 (Array (_ BitVec 32) ValueCell!14484)) (size!37960 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77555)

(declare-fun mapDefault!47417 () ValueCell!14484)

(assert (=> b!1197265 (= condMapEmpty!47417 (= (arr!37424 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14484)) mapDefault!47417)))))

(declare-fun b!1197266 () Bool)

(assert (=> b!1197266 (= e!680160 e!680162)))

(declare-fun res!796794 () Bool)

(assert (=> b!1197266 (=> (not res!796794) (not e!680162))))

(declare-fun lt!543227 () array!77553)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77553 (_ BitVec 32)) Bool)

(assert (=> b!1197266 (= res!796794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543227 mask!1564))))

(assert (=> b!1197266 (= lt!543227 (array!77554 (store (arr!37423 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37959 _keys!1208)))))

(declare-fun zeroValue!944 () V!45643)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19522 0))(
  ( (tuple2!19523 (_1!9772 (_ BitVec 64)) (_2!9772 V!45643)) )
))
(declare-datatypes ((List!26332 0))(
  ( (Nil!26329) (Cons!26328 (h!27537 tuple2!19522) (t!39031 List!26332)) )
))
(declare-datatypes ((ListLongMap!17491 0))(
  ( (ListLongMap!17492 (toList!8761 List!26332)) )
))
(declare-fun call!57243 () ListLongMap!17491)

(declare-fun bm!57239 () Bool)

(declare-fun minValue!944 () V!45643)

(declare-fun getCurrentListMapNoExtraKeys!5201 (array!77553 array!77555 (_ BitVec 32) (_ BitVec 32) V!45643 V!45643 (_ BitVec 32) Int) ListLongMap!17491)

(assert (=> bm!57239 (= call!57243 (getCurrentListMapNoExtraKeys!5201 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!796791 () Bool)

(assert (=> start!100320 (=> (not res!796791) (not e!680160))))

(assert (=> start!100320 (= res!796791 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37959 _keys!1208))))))

(assert (=> start!100320 e!680160))

(declare-fun tp_is_empty!30387 () Bool)

(assert (=> start!100320 tp_is_empty!30387))

(declare-fun array_inv!28522 (array!77553) Bool)

(assert (=> start!100320 (array_inv!28522 _keys!1208)))

(assert (=> start!100320 true))

(assert (=> start!100320 tp!90068))

(declare-fun array_inv!28523 (array!77555) Bool)

(assert (=> start!100320 (and (array_inv!28523 _values!996) e!680166)))

(declare-fun b!1197267 () Bool)

(declare-fun e!680163 () Bool)

(assert (=> b!1197267 (= e!680163 tp_is_empty!30387)))

(declare-fun b!1197268 () Bool)

(declare-fun res!796788 () Bool)

(assert (=> b!1197268 (=> (not res!796788) (not e!680160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197268 (= res!796788 (validMask!0 mask!1564))))

(declare-fun call!57242 () ListLongMap!17491)

(declare-fun bm!57240 () Bool)

(declare-fun dynLambda!3125 (Int (_ BitVec 64)) V!45643)

(assert (=> bm!57240 (= call!57242 (getCurrentListMapNoExtraKeys!5201 lt!543227 (array!77556 (store (arr!37424 _values!996) i!673 (ValueCellFull!14484 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1197269 () Bool)

(assert (=> b!1197269 (= e!680164 tp_is_empty!30387)))

(declare-fun b!1197270 () Bool)

(assert (=> b!1197270 (= e!680161 (= (getCurrentListMapNoExtraKeys!5201 lt!543227 (array!77556 (store (arr!37424 _values!996) i!673 (ValueCellFull!14484 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) (getCurrentListMapNoExtraKeys!5201 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004)))))

(declare-fun e!680167 () Bool)

(assert (=> b!1197270 e!680167))

(declare-fun c!117375 () Bool)

(assert (=> b!1197270 (= c!117375 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!543228 () Unit!39700)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!986 (array!77553 array!77555 (_ BitVec 32) (_ BitVec 32) V!45643 V!45643 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39700)

(assert (=> b!1197270 (= lt!543228 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!986 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1197271 () Bool)

(declare-fun res!796789 () Bool)

(assert (=> b!1197271 (=> (not res!796789) (not e!680162))))

(assert (=> b!1197271 (= res!796789 (arrayNoDuplicates!0 lt!543227 #b00000000000000000000000000000000 Nil!26328))))

(declare-fun b!1197272 () Bool)

(declare-fun res!796792 () Bool)

(assert (=> b!1197272 (=> (not res!796792) (not e!680160))))

(assert (=> b!1197272 (= res!796792 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37959 _keys!1208))))))

(declare-fun mapNonEmpty!47417 () Bool)

(declare-fun tp!90069 () Bool)

(assert (=> mapNonEmpty!47417 (= mapRes!47417 (and tp!90069 e!680163))))

(declare-fun mapRest!47417 () (Array (_ BitVec 32) ValueCell!14484))

(declare-fun mapKey!47417 () (_ BitVec 32))

(declare-fun mapValue!47417 () ValueCell!14484)

(assert (=> mapNonEmpty!47417 (= (arr!37424 _values!996) (store mapRest!47417 mapKey!47417 mapValue!47417))))

(declare-fun b!1197273 () Bool)

(declare-fun res!796790 () Bool)

(assert (=> b!1197273 (=> (not res!796790) (not e!680160))))

(assert (=> b!1197273 (= res!796790 (= (select (arr!37423 _keys!1208) i!673) k0!934))))

(declare-fun b!1197274 () Bool)

(declare-fun -!1779 (ListLongMap!17491 (_ BitVec 64)) ListLongMap!17491)

(assert (=> b!1197274 (= e!680167 (= call!57242 (-!1779 call!57243 k0!934)))))

(declare-fun b!1197275 () Bool)

(declare-fun res!796795 () Bool)

(assert (=> b!1197275 (=> (not res!796795) (not e!680160))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197275 (= res!796795 (validKeyInArray!0 k0!934))))

(declare-fun b!1197276 () Bool)

(assert (=> b!1197276 (= e!680167 (= call!57242 call!57243))))

(declare-fun b!1197277 () Bool)

(declare-fun res!796797 () Bool)

(assert (=> b!1197277 (=> (not res!796797) (not e!680160))))

(assert (=> b!1197277 (= res!796797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197278 () Bool)

(declare-fun res!796798 () Bool)

(assert (=> b!1197278 (=> (not res!796798) (not e!680160))))

(assert (=> b!1197278 (= res!796798 (and (= (size!37960 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37959 _keys!1208) (size!37960 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!100320 res!796791) b!1197268))

(assert (= (and b!1197268 res!796788) b!1197278))

(assert (= (and b!1197278 res!796798) b!1197277))

(assert (= (and b!1197277 res!796797) b!1197263))

(assert (= (and b!1197263 res!796793) b!1197272))

(assert (= (and b!1197272 res!796792) b!1197275))

(assert (= (and b!1197275 res!796795) b!1197273))

(assert (= (and b!1197273 res!796790) b!1197266))

(assert (= (and b!1197266 res!796794) b!1197271))

(assert (= (and b!1197271 res!796789) b!1197264))

(assert (= (and b!1197264 (not res!796796)) b!1197270))

(assert (= (and b!1197270 c!117375) b!1197274))

(assert (= (and b!1197270 (not c!117375)) b!1197276))

(assert (= (or b!1197274 b!1197276) bm!57240))

(assert (= (or b!1197274 b!1197276) bm!57239))

(assert (= (and b!1197265 condMapEmpty!47417) mapIsEmpty!47417))

(assert (= (and b!1197265 (not condMapEmpty!47417)) mapNonEmpty!47417))

(get-info :version)

(assert (= (and mapNonEmpty!47417 ((_ is ValueCellFull!14484) mapValue!47417)) b!1197267))

(assert (= (and b!1197265 ((_ is ValueCellFull!14484) mapDefault!47417)) b!1197269))

(assert (= start!100320 b!1197265))

(declare-fun b_lambda!20853 () Bool)

(assert (=> (not b_lambda!20853) (not bm!57240)))

(declare-fun t!39029 () Bool)

(declare-fun tb!10519 () Bool)

(assert (=> (and start!100320 (= defaultEntry!1004 defaultEntry!1004) t!39029) tb!10519))

(declare-fun result!21611 () Bool)

(assert (=> tb!10519 (= result!21611 tp_is_empty!30387)))

(assert (=> bm!57240 t!39029))

(declare-fun b_and!42285 () Bool)

(assert (= b_and!42283 (and (=> t!39029 result!21611) b_and!42285)))

(declare-fun b_lambda!20855 () Bool)

(assert (=> (not b_lambda!20855) (not b!1197270)))

(assert (=> b!1197270 t!39029))

(declare-fun b_and!42287 () Bool)

(assert (= b_and!42285 (and (=> t!39029 result!21611) b_and!42287)))

(declare-fun m!1104285 () Bool)

(assert (=> b!1197271 m!1104285))

(declare-fun m!1104287 () Bool)

(assert (=> b!1197264 m!1104287))

(declare-fun m!1104289 () Bool)

(assert (=> b!1197264 m!1104289))

(declare-fun m!1104291 () Bool)

(assert (=> b!1197277 m!1104291))

(declare-fun m!1104293 () Bool)

(assert (=> start!100320 m!1104293))

(declare-fun m!1104295 () Bool)

(assert (=> start!100320 m!1104295))

(declare-fun m!1104297 () Bool)

(assert (=> b!1197263 m!1104297))

(declare-fun m!1104299 () Bool)

(assert (=> bm!57240 m!1104299))

(declare-fun m!1104301 () Bool)

(assert (=> bm!57240 m!1104301))

(declare-fun m!1104303 () Bool)

(assert (=> bm!57240 m!1104303))

(declare-fun m!1104305 () Bool)

(assert (=> b!1197268 m!1104305))

(declare-fun m!1104307 () Bool)

(assert (=> bm!57239 m!1104307))

(declare-fun m!1104309 () Bool)

(assert (=> b!1197274 m!1104309))

(declare-fun m!1104311 () Bool)

(assert (=> b!1197273 m!1104311))

(declare-fun m!1104313 () Bool)

(assert (=> mapNonEmpty!47417 m!1104313))

(declare-fun m!1104315 () Bool)

(assert (=> b!1197266 m!1104315))

(declare-fun m!1104317 () Bool)

(assert (=> b!1197266 m!1104317))

(declare-fun m!1104319 () Bool)

(assert (=> b!1197270 m!1104319))

(assert (=> b!1197270 m!1104299))

(assert (=> b!1197270 m!1104301))

(declare-fun m!1104321 () Bool)

(assert (=> b!1197270 m!1104321))

(declare-fun m!1104323 () Bool)

(assert (=> b!1197270 m!1104323))

(declare-fun m!1104325 () Bool)

(assert (=> b!1197275 m!1104325))

(check-sat (not b_lambda!20853) (not mapNonEmpty!47417) (not bm!57240) (not b!1197270) (not b!1197275) (not b_lambda!20855) (not b!1197274) (not b!1197264) (not bm!57239) (not b!1197277) (not b!1197268) (not start!100320) (not b_next!25707) (not b!1197263) (not b!1197266) tp_is_empty!30387 b_and!42287 (not b!1197271))
(check-sat b_and!42287 (not b_next!25707))
(get-model)

(declare-fun b_lambda!20861 () Bool)

(assert (= b_lambda!20853 (or (and start!100320 b_free!25707) b_lambda!20861)))

(declare-fun b_lambda!20863 () Bool)

(assert (= b_lambda!20855 (or (and start!100320 b_free!25707) b_lambda!20863)))

(check-sat (not mapNonEmpty!47417) (not b!1197270) (not b!1197275) (not b!1197274) (not b!1197264) (not bm!57239) (not b!1197277) (not b!1197268) (not start!100320) (not bm!57240) (not b_lambda!20861) (not b_next!25707) (not b!1197263) (not b!1197266) tp_is_empty!30387 b_and!42287 (not b_lambda!20863) (not b!1197271))
(check-sat b_and!42287 (not b_next!25707))
(get-model)

(declare-fun bm!57249 () Bool)

(declare-fun call!57252 () ListLongMap!17491)

(assert (=> bm!57249 (= call!57252 (getCurrentListMapNoExtraKeys!5201 lt!543227 (array!77556 (store (arr!37424 _values!996) i!673 (ValueCellFull!14484 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!132355 () Bool)

(declare-fun e!680208 () Bool)

(assert (=> d!132355 e!680208))

(declare-fun res!796842 () Bool)

(assert (=> d!132355 (=> (not res!796842) (not e!680208))))

(declare-fun lt!543253 () ListLongMap!17491)

(declare-fun contains!6864 (ListLongMap!17491 (_ BitVec 64)) Bool)

(assert (=> d!132355 (= res!796842 (not (contains!6864 lt!543253 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!680211 () ListLongMap!17491)

(assert (=> d!132355 (= lt!543253 e!680211)))

(declare-fun c!117387 () Bool)

(assert (=> d!132355 (= c!117387 (bvsge from!1455 (size!37959 lt!543227)))))

(assert (=> d!132355 (validMask!0 mask!1564)))

(assert (=> d!132355 (= (getCurrentListMapNoExtraKeys!5201 lt!543227 (array!77556 (store (arr!37424 _values!996) i!673 (ValueCellFull!14484 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!543253)))

(declare-fun b!1197355 () Bool)

(assert (=> b!1197355 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37959 lt!543227)))))

(assert (=> b!1197355 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37960 (array!77556 (store (arr!37424 _values!996) i!673 (ValueCellFull!14484 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996)))))))

(declare-fun e!680207 () Bool)

(declare-fun apply!958 (ListLongMap!17491 (_ BitVec 64)) V!45643)

(declare-fun get!19106 (ValueCell!14484 V!45643) V!45643)

(assert (=> b!1197355 (= e!680207 (= (apply!958 lt!543253 (select (arr!37423 lt!543227) from!1455)) (get!19106 (select (arr!37424 (array!77556 (store (arr!37424 _values!996) i!673 (ValueCellFull!14484 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996))) from!1455) (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1197356 () Bool)

(declare-fun e!680212 () ListLongMap!17491)

(assert (=> b!1197356 (= e!680212 call!57252)))

(declare-fun b!1197357 () Bool)

(declare-fun res!796841 () Bool)

(assert (=> b!1197357 (=> (not res!796841) (not e!680208))))

(assert (=> b!1197357 (= res!796841 (not (contains!6864 lt!543253 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1197358 () Bool)

(declare-fun e!680206 () Bool)

(declare-fun isEmpty!978 (ListLongMap!17491) Bool)

(assert (=> b!1197358 (= e!680206 (isEmpty!978 lt!543253))))

(declare-fun b!1197359 () Bool)

(declare-fun e!680209 () Bool)

(assert (=> b!1197359 (= e!680209 e!680206)))

(declare-fun c!117388 () Bool)

(assert (=> b!1197359 (= c!117388 (bvslt from!1455 (size!37959 lt!543227)))))

(declare-fun b!1197360 () Bool)

(declare-fun lt!543255 () Unit!39700)

(declare-fun lt!543256 () Unit!39700)

(assert (=> b!1197360 (= lt!543255 lt!543256)))

(declare-fun lt!543258 () (_ BitVec 64))

(declare-fun lt!543257 () ListLongMap!17491)

(declare-fun lt!543252 () V!45643)

(declare-fun lt!543254 () (_ BitVec 64))

(declare-fun +!3947 (ListLongMap!17491 tuple2!19522) ListLongMap!17491)

(assert (=> b!1197360 (not (contains!6864 (+!3947 lt!543257 (tuple2!19523 lt!543258 lt!543252)) lt!543254))))

(declare-fun addStillNotContains!286 (ListLongMap!17491 (_ BitVec 64) V!45643 (_ BitVec 64)) Unit!39700)

(assert (=> b!1197360 (= lt!543256 (addStillNotContains!286 lt!543257 lt!543258 lt!543252 lt!543254))))

(assert (=> b!1197360 (= lt!543254 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1197360 (= lt!543252 (get!19106 (select (arr!37424 (array!77556 (store (arr!37424 _values!996) i!673 (ValueCellFull!14484 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996))) from!1455) (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1197360 (= lt!543258 (select (arr!37423 lt!543227) from!1455))))

(assert (=> b!1197360 (= lt!543257 call!57252)))

(assert (=> b!1197360 (= e!680212 (+!3947 call!57252 (tuple2!19523 (select (arr!37423 lt!543227) from!1455) (get!19106 (select (arr!37424 (array!77556 (store (arr!37424 _values!996) i!673 (ValueCellFull!14484 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996))) from!1455) (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1197361 () Bool)

(assert (=> b!1197361 (= e!680208 e!680209)))

(declare-fun c!117390 () Bool)

(declare-fun e!680210 () Bool)

(assert (=> b!1197361 (= c!117390 e!680210)))

(declare-fun res!796843 () Bool)

(assert (=> b!1197361 (=> (not res!796843) (not e!680210))))

(assert (=> b!1197361 (= res!796843 (bvslt from!1455 (size!37959 lt!543227)))))

(declare-fun b!1197362 () Bool)

(assert (=> b!1197362 (= e!680210 (validKeyInArray!0 (select (arr!37423 lt!543227) from!1455)))))

(assert (=> b!1197362 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1197363 () Bool)

(assert (=> b!1197363 (= e!680211 (ListLongMap!17492 Nil!26329))))

(declare-fun b!1197364 () Bool)

(assert (=> b!1197364 (= e!680206 (= lt!543253 (getCurrentListMapNoExtraKeys!5201 lt!543227 (array!77556 (store (arr!37424 _values!996) i!673 (ValueCellFull!14484 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1197365 () Bool)

(assert (=> b!1197365 (= e!680209 e!680207)))

(assert (=> b!1197365 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37959 lt!543227)))))

(declare-fun res!796840 () Bool)

(assert (=> b!1197365 (= res!796840 (contains!6864 lt!543253 (select (arr!37423 lt!543227) from!1455)))))

(assert (=> b!1197365 (=> (not res!796840) (not e!680207))))

(declare-fun b!1197366 () Bool)

(assert (=> b!1197366 (= e!680211 e!680212)))

(declare-fun c!117389 () Bool)

(assert (=> b!1197366 (= c!117389 (validKeyInArray!0 (select (arr!37423 lt!543227) from!1455)))))

(assert (= (and d!132355 c!117387) b!1197363))

(assert (= (and d!132355 (not c!117387)) b!1197366))

(assert (= (and b!1197366 c!117389) b!1197360))

(assert (= (and b!1197366 (not c!117389)) b!1197356))

(assert (= (or b!1197360 b!1197356) bm!57249))

(assert (= (and d!132355 res!796842) b!1197357))

(assert (= (and b!1197357 res!796841) b!1197361))

(assert (= (and b!1197361 res!796843) b!1197362))

(assert (= (and b!1197361 c!117390) b!1197365))

(assert (= (and b!1197361 (not c!117390)) b!1197359))

(assert (= (and b!1197365 res!796840) b!1197355))

(assert (= (and b!1197359 c!117388) b!1197364))

(assert (= (and b!1197359 (not c!117388)) b!1197358))

(declare-fun b_lambda!20865 () Bool)

(assert (=> (not b_lambda!20865) (not b!1197355)))

(assert (=> b!1197355 t!39029))

(declare-fun b_and!42295 () Bool)

(assert (= b_and!42287 (and (=> t!39029 result!21611) b_and!42295)))

(declare-fun b_lambda!20867 () Bool)

(assert (=> (not b_lambda!20867) (not b!1197360)))

(assert (=> b!1197360 t!39029))

(declare-fun b_and!42297 () Bool)

(assert (= b_and!42295 (and (=> t!39029 result!21611) b_and!42297)))

(declare-fun m!1104369 () Bool)

(assert (=> b!1197362 m!1104369))

(assert (=> b!1197362 m!1104369))

(declare-fun m!1104371 () Bool)

(assert (=> b!1197362 m!1104371))

(declare-fun m!1104373 () Bool)

(assert (=> d!132355 m!1104373))

(assert (=> d!132355 m!1104305))

(declare-fun m!1104375 () Bool)

(assert (=> b!1197357 m!1104375))

(assert (=> b!1197366 m!1104369))

(assert (=> b!1197366 m!1104369))

(assert (=> b!1197366 m!1104371))

(declare-fun m!1104377 () Bool)

(assert (=> b!1197364 m!1104377))

(declare-fun m!1104379 () Bool)

(assert (=> b!1197355 m!1104379))

(assert (=> b!1197355 m!1104379))

(assert (=> b!1197355 m!1104299))

(declare-fun m!1104381 () Bool)

(assert (=> b!1197355 m!1104381))

(assert (=> b!1197355 m!1104299))

(assert (=> b!1197355 m!1104369))

(declare-fun m!1104383 () Bool)

(assert (=> b!1197355 m!1104383))

(assert (=> b!1197355 m!1104369))

(declare-fun m!1104385 () Bool)

(assert (=> b!1197360 m!1104385))

(assert (=> b!1197360 m!1104379))

(assert (=> b!1197360 m!1104379))

(assert (=> b!1197360 m!1104299))

(assert (=> b!1197360 m!1104381))

(declare-fun m!1104387 () Bool)

(assert (=> b!1197360 m!1104387))

(assert (=> b!1197360 m!1104299))

(declare-fun m!1104389 () Bool)

(assert (=> b!1197360 m!1104389))

(assert (=> b!1197360 m!1104369))

(assert (=> b!1197360 m!1104385))

(declare-fun m!1104391 () Bool)

(assert (=> b!1197360 m!1104391))

(assert (=> b!1197365 m!1104369))

(assert (=> b!1197365 m!1104369))

(declare-fun m!1104393 () Bool)

(assert (=> b!1197365 m!1104393))

(declare-fun m!1104395 () Bool)

(assert (=> b!1197358 m!1104395))

(assert (=> bm!57249 m!1104377))

(assert (=> b!1197270 d!132355))

(declare-fun call!57253 () ListLongMap!17491)

(declare-fun bm!57250 () Bool)

(assert (=> bm!57250 (= call!57253 (getCurrentListMapNoExtraKeys!5201 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!132357 () Bool)

(declare-fun e!680215 () Bool)

(assert (=> d!132357 e!680215))

(declare-fun res!796846 () Bool)

(assert (=> d!132357 (=> (not res!796846) (not e!680215))))

(declare-fun lt!543260 () ListLongMap!17491)

(assert (=> d!132357 (= res!796846 (not (contains!6864 lt!543260 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!680218 () ListLongMap!17491)

(assert (=> d!132357 (= lt!543260 e!680218)))

(declare-fun c!117391 () Bool)

(assert (=> d!132357 (= c!117391 (bvsge from!1455 (size!37959 _keys!1208)))))

(assert (=> d!132357 (validMask!0 mask!1564)))

(assert (=> d!132357 (= (getCurrentListMapNoExtraKeys!5201 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004) lt!543260)))

(declare-fun b!1197367 () Bool)

(assert (=> b!1197367 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37959 _keys!1208)))))

(assert (=> b!1197367 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37960 _values!996)))))

(declare-fun e!680214 () Bool)

(assert (=> b!1197367 (= e!680214 (= (apply!958 lt!543260 (select (arr!37423 _keys!1208) from!1455)) (get!19106 (select (arr!37424 _values!996) from!1455) (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1197368 () Bool)

(declare-fun e!680219 () ListLongMap!17491)

(assert (=> b!1197368 (= e!680219 call!57253)))

(declare-fun b!1197369 () Bool)

(declare-fun res!796845 () Bool)

(assert (=> b!1197369 (=> (not res!796845) (not e!680215))))

(assert (=> b!1197369 (= res!796845 (not (contains!6864 lt!543260 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1197370 () Bool)

(declare-fun e!680213 () Bool)

(assert (=> b!1197370 (= e!680213 (isEmpty!978 lt!543260))))

(declare-fun b!1197371 () Bool)

(declare-fun e!680216 () Bool)

(assert (=> b!1197371 (= e!680216 e!680213)))

(declare-fun c!117392 () Bool)

(assert (=> b!1197371 (= c!117392 (bvslt from!1455 (size!37959 _keys!1208)))))

(declare-fun b!1197372 () Bool)

(declare-fun lt!543262 () Unit!39700)

(declare-fun lt!543263 () Unit!39700)

(assert (=> b!1197372 (= lt!543262 lt!543263)))

(declare-fun lt!543264 () ListLongMap!17491)

(declare-fun lt!543261 () (_ BitVec 64))

(declare-fun lt!543259 () V!45643)

(declare-fun lt!543265 () (_ BitVec 64))

(assert (=> b!1197372 (not (contains!6864 (+!3947 lt!543264 (tuple2!19523 lt!543265 lt!543259)) lt!543261))))

(assert (=> b!1197372 (= lt!543263 (addStillNotContains!286 lt!543264 lt!543265 lt!543259 lt!543261))))

(assert (=> b!1197372 (= lt!543261 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1197372 (= lt!543259 (get!19106 (select (arr!37424 _values!996) from!1455) (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1197372 (= lt!543265 (select (arr!37423 _keys!1208) from!1455))))

(assert (=> b!1197372 (= lt!543264 call!57253)))

(assert (=> b!1197372 (= e!680219 (+!3947 call!57253 (tuple2!19523 (select (arr!37423 _keys!1208) from!1455) (get!19106 (select (arr!37424 _values!996) from!1455) (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1197373 () Bool)

(assert (=> b!1197373 (= e!680215 e!680216)))

(declare-fun c!117394 () Bool)

(declare-fun e!680217 () Bool)

(assert (=> b!1197373 (= c!117394 e!680217)))

(declare-fun res!796847 () Bool)

(assert (=> b!1197373 (=> (not res!796847) (not e!680217))))

(assert (=> b!1197373 (= res!796847 (bvslt from!1455 (size!37959 _keys!1208)))))

(declare-fun b!1197374 () Bool)

(assert (=> b!1197374 (= e!680217 (validKeyInArray!0 (select (arr!37423 _keys!1208) from!1455)))))

(assert (=> b!1197374 (bvsge from!1455 #b00000000000000000000000000000000)))

(declare-fun b!1197375 () Bool)

(assert (=> b!1197375 (= e!680218 (ListLongMap!17492 Nil!26329))))

(declare-fun b!1197376 () Bool)

(assert (=> b!1197376 (= e!680213 (= lt!543260 (getCurrentListMapNoExtraKeys!5201 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1197377 () Bool)

(assert (=> b!1197377 (= e!680216 e!680214)))

(assert (=> b!1197377 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvslt from!1455 (size!37959 _keys!1208)))))

(declare-fun res!796844 () Bool)

(assert (=> b!1197377 (= res!796844 (contains!6864 lt!543260 (select (arr!37423 _keys!1208) from!1455)))))

(assert (=> b!1197377 (=> (not res!796844) (not e!680214))))

(declare-fun b!1197378 () Bool)

(assert (=> b!1197378 (= e!680218 e!680219)))

(declare-fun c!117393 () Bool)

(assert (=> b!1197378 (= c!117393 (validKeyInArray!0 (select (arr!37423 _keys!1208) from!1455)))))

(assert (= (and d!132357 c!117391) b!1197375))

(assert (= (and d!132357 (not c!117391)) b!1197378))

(assert (= (and b!1197378 c!117393) b!1197372))

(assert (= (and b!1197378 (not c!117393)) b!1197368))

(assert (= (or b!1197372 b!1197368) bm!57250))

(assert (= (and d!132357 res!796846) b!1197369))

(assert (= (and b!1197369 res!796845) b!1197373))

(assert (= (and b!1197373 res!796847) b!1197374))

(assert (= (and b!1197373 c!117394) b!1197377))

(assert (= (and b!1197373 (not c!117394)) b!1197371))

(assert (= (and b!1197377 res!796844) b!1197367))

(assert (= (and b!1197371 c!117392) b!1197376))

(assert (= (and b!1197371 (not c!117392)) b!1197370))

(declare-fun b_lambda!20869 () Bool)

(assert (=> (not b_lambda!20869) (not b!1197367)))

(assert (=> b!1197367 t!39029))

(declare-fun b_and!42299 () Bool)

(assert (= b_and!42297 (and (=> t!39029 result!21611) b_and!42299)))

(declare-fun b_lambda!20871 () Bool)

(assert (=> (not b_lambda!20871) (not b!1197372)))

(assert (=> b!1197372 t!39029))

(declare-fun b_and!42301 () Bool)

(assert (= b_and!42299 (and (=> t!39029 result!21611) b_and!42301)))

(declare-fun m!1104397 () Bool)

(assert (=> b!1197374 m!1104397))

(assert (=> b!1197374 m!1104397))

(declare-fun m!1104399 () Bool)

(assert (=> b!1197374 m!1104399))

(declare-fun m!1104401 () Bool)

(assert (=> d!132357 m!1104401))

(assert (=> d!132357 m!1104305))

(declare-fun m!1104403 () Bool)

(assert (=> b!1197369 m!1104403))

(assert (=> b!1197378 m!1104397))

(assert (=> b!1197378 m!1104397))

(assert (=> b!1197378 m!1104399))

(declare-fun m!1104405 () Bool)

(assert (=> b!1197376 m!1104405))

(declare-fun m!1104407 () Bool)

(assert (=> b!1197367 m!1104407))

(assert (=> b!1197367 m!1104407))

(assert (=> b!1197367 m!1104299))

(declare-fun m!1104409 () Bool)

(assert (=> b!1197367 m!1104409))

(assert (=> b!1197367 m!1104299))

(assert (=> b!1197367 m!1104397))

(declare-fun m!1104411 () Bool)

(assert (=> b!1197367 m!1104411))

(assert (=> b!1197367 m!1104397))

(declare-fun m!1104413 () Bool)

(assert (=> b!1197372 m!1104413))

(assert (=> b!1197372 m!1104407))

(assert (=> b!1197372 m!1104407))

(assert (=> b!1197372 m!1104299))

(assert (=> b!1197372 m!1104409))

(declare-fun m!1104415 () Bool)

(assert (=> b!1197372 m!1104415))

(assert (=> b!1197372 m!1104299))

(declare-fun m!1104417 () Bool)

(assert (=> b!1197372 m!1104417))

(assert (=> b!1197372 m!1104397))

(assert (=> b!1197372 m!1104413))

(declare-fun m!1104419 () Bool)

(assert (=> b!1197372 m!1104419))

(assert (=> b!1197377 m!1104397))

(assert (=> b!1197377 m!1104397))

(declare-fun m!1104421 () Bool)

(assert (=> b!1197377 m!1104421))

(declare-fun m!1104423 () Bool)

(assert (=> b!1197370 m!1104423))

(assert (=> bm!57250 m!1104405))

(assert (=> b!1197270 d!132357))

(declare-fun bm!57255 () Bool)

(declare-fun call!57258 () ListLongMap!17491)

(assert (=> bm!57255 (= call!57258 (getCurrentListMapNoExtraKeys!5201 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!57259 () ListLongMap!17491)

(declare-fun bm!57256 () Bool)

(assert (=> bm!57256 (= call!57259 (getCurrentListMapNoExtraKeys!5201 (array!77554 (store (arr!37423 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37959 _keys!1208)) (array!77556 (store (arr!37424 _values!996) i!673 (ValueCellFull!14484 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1197385 () Bool)

(declare-fun e!680224 () Bool)

(assert (=> b!1197385 (= e!680224 (= call!57259 (-!1779 call!57258 k0!934)))))

(assert (=> b!1197385 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37960 _values!996)))))

(declare-fun b!1197386 () Bool)

(assert (=> b!1197386 (= e!680224 (= call!57259 call!57258))))

(assert (=> b!1197386 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37960 _values!996)))))

(declare-fun b!1197387 () Bool)

(declare-fun e!680225 () Bool)

(assert (=> b!1197387 (= e!680225 e!680224)))

(declare-fun c!117397 () Bool)

(assert (=> b!1197387 (= c!117397 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun d!132359 () Bool)

(assert (=> d!132359 e!680225))

(declare-fun res!796850 () Bool)

(assert (=> d!132359 (=> (not res!796850) (not e!680225))))

(assert (=> d!132359 (= res!796850 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673)) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37959 _keys!1208)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673) (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37959 _keys!1208))))))))

(declare-fun lt!543268 () Unit!39700)

(declare-fun choose!1784 (array!77553 array!77555 (_ BitVec 32) (_ BitVec 32) V!45643 V!45643 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39700)

(assert (=> d!132359 (= lt!543268 (choose!1784 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> d!132359 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37959 _keys!1208)))))

(assert (=> d!132359 (= (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!986 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!543268)))

(assert (= (and d!132359 res!796850) b!1197387))

(assert (= (and b!1197387 c!117397) b!1197385))

(assert (= (and b!1197387 (not c!117397)) b!1197386))

(assert (= (or b!1197385 b!1197386) bm!57255))

(assert (= (or b!1197385 b!1197386) bm!57256))

(declare-fun b_lambda!20873 () Bool)

(assert (=> (not b_lambda!20873) (not bm!57256)))

(assert (=> bm!57256 t!39029))

(declare-fun b_and!42303 () Bool)

(assert (= b_and!42301 (and (=> t!39029 result!21611) b_and!42303)))

(assert (=> bm!57255 m!1104307))

(assert (=> bm!57256 m!1104317))

(assert (=> bm!57256 m!1104299))

(assert (=> bm!57256 m!1104301))

(declare-fun m!1104425 () Bool)

(assert (=> bm!57256 m!1104425))

(declare-fun m!1104427 () Bool)

(assert (=> b!1197385 m!1104427))

(declare-fun m!1104429 () Bool)

(assert (=> d!132359 m!1104429))

(assert (=> b!1197270 d!132359))

(declare-fun d!132361 () Bool)

(declare-fun res!796859 () Bool)

(declare-fun e!680237 () Bool)

(assert (=> d!132361 (=> res!796859 e!680237)))

(assert (=> d!132361 (= res!796859 (bvsge #b00000000000000000000000000000000 (size!37959 lt!543227)))))

(assert (=> d!132361 (= (arrayNoDuplicates!0 lt!543227 #b00000000000000000000000000000000 Nil!26328) e!680237)))

(declare-fun bm!57259 () Bool)

(declare-fun call!57262 () Bool)

(declare-fun c!117400 () Bool)

(assert (=> bm!57259 (= call!57262 (arrayNoDuplicates!0 lt!543227 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117400 (Cons!26327 (select (arr!37423 lt!543227) #b00000000000000000000000000000000) Nil!26328) Nil!26328)))))

(declare-fun b!1197398 () Bool)

(declare-fun e!680236 () Bool)

(assert (=> b!1197398 (= e!680236 call!57262)))

(declare-fun b!1197399 () Bool)

(declare-fun e!680234 () Bool)

(declare-fun contains!6865 (List!26331 (_ BitVec 64)) Bool)

(assert (=> b!1197399 (= e!680234 (contains!6865 Nil!26328 (select (arr!37423 lt!543227) #b00000000000000000000000000000000)))))

(declare-fun b!1197400 () Bool)

(assert (=> b!1197400 (= e!680236 call!57262)))

(declare-fun b!1197401 () Bool)

(declare-fun e!680235 () Bool)

(assert (=> b!1197401 (= e!680237 e!680235)))

(declare-fun res!796857 () Bool)

(assert (=> b!1197401 (=> (not res!796857) (not e!680235))))

(assert (=> b!1197401 (= res!796857 (not e!680234))))

(declare-fun res!796858 () Bool)

(assert (=> b!1197401 (=> (not res!796858) (not e!680234))))

(assert (=> b!1197401 (= res!796858 (validKeyInArray!0 (select (arr!37423 lt!543227) #b00000000000000000000000000000000)))))

(declare-fun b!1197402 () Bool)

(assert (=> b!1197402 (= e!680235 e!680236)))

(assert (=> b!1197402 (= c!117400 (validKeyInArray!0 (select (arr!37423 lt!543227) #b00000000000000000000000000000000)))))

(assert (= (and d!132361 (not res!796859)) b!1197401))

(assert (= (and b!1197401 res!796858) b!1197399))

(assert (= (and b!1197401 res!796857) b!1197402))

(assert (= (and b!1197402 c!117400) b!1197400))

(assert (= (and b!1197402 (not c!117400)) b!1197398))

(assert (= (or b!1197400 b!1197398) bm!57259))

(declare-fun m!1104431 () Bool)

(assert (=> bm!57259 m!1104431))

(declare-fun m!1104433 () Bool)

(assert (=> bm!57259 m!1104433))

(assert (=> b!1197399 m!1104431))

(assert (=> b!1197399 m!1104431))

(declare-fun m!1104435 () Bool)

(assert (=> b!1197399 m!1104435))

(assert (=> b!1197401 m!1104431))

(assert (=> b!1197401 m!1104431))

(declare-fun m!1104437 () Bool)

(assert (=> b!1197401 m!1104437))

(assert (=> b!1197402 m!1104431))

(assert (=> b!1197402 m!1104431))

(assert (=> b!1197402 m!1104437))

(assert (=> b!1197271 d!132361))

(declare-fun d!132363 () Bool)

(declare-fun res!796862 () Bool)

(declare-fun e!680241 () Bool)

(assert (=> d!132363 (=> res!796862 e!680241)))

(assert (=> d!132363 (= res!796862 (bvsge #b00000000000000000000000000000000 (size!37959 _keys!1208)))))

(assert (=> d!132363 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26328) e!680241)))

(declare-fun bm!57260 () Bool)

(declare-fun call!57263 () Bool)

(declare-fun c!117401 () Bool)

(assert (=> bm!57260 (= call!57263 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!117401 (Cons!26327 (select (arr!37423 _keys!1208) #b00000000000000000000000000000000) Nil!26328) Nil!26328)))))

(declare-fun b!1197403 () Bool)

(declare-fun e!680240 () Bool)

(assert (=> b!1197403 (= e!680240 call!57263)))

(declare-fun b!1197404 () Bool)

(declare-fun e!680238 () Bool)

(assert (=> b!1197404 (= e!680238 (contains!6865 Nil!26328 (select (arr!37423 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1197405 () Bool)

(assert (=> b!1197405 (= e!680240 call!57263)))

(declare-fun b!1197406 () Bool)

(declare-fun e!680239 () Bool)

(assert (=> b!1197406 (= e!680241 e!680239)))

(declare-fun res!796860 () Bool)

(assert (=> b!1197406 (=> (not res!796860) (not e!680239))))

(assert (=> b!1197406 (= res!796860 (not e!680238))))

(declare-fun res!796861 () Bool)

(assert (=> b!1197406 (=> (not res!796861) (not e!680238))))

(assert (=> b!1197406 (= res!796861 (validKeyInArray!0 (select (arr!37423 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1197407 () Bool)

(assert (=> b!1197407 (= e!680239 e!680240)))

(assert (=> b!1197407 (= c!117401 (validKeyInArray!0 (select (arr!37423 _keys!1208) #b00000000000000000000000000000000)))))

(assert (= (and d!132363 (not res!796862)) b!1197406))

(assert (= (and b!1197406 res!796861) b!1197404))

(assert (= (and b!1197406 res!796860) b!1197407))

(assert (= (and b!1197407 c!117401) b!1197405))

(assert (= (and b!1197407 (not c!117401)) b!1197403))

(assert (= (or b!1197405 b!1197403) bm!57260))

(declare-fun m!1104439 () Bool)

(assert (=> bm!57260 m!1104439))

(declare-fun m!1104441 () Bool)

(assert (=> bm!57260 m!1104441))

(assert (=> b!1197404 m!1104439))

(assert (=> b!1197404 m!1104439))

(declare-fun m!1104443 () Bool)

(assert (=> b!1197404 m!1104443))

(assert (=> b!1197406 m!1104439))

(assert (=> b!1197406 m!1104439))

(declare-fun m!1104445 () Bool)

(assert (=> b!1197406 m!1104445))

(assert (=> b!1197407 m!1104439))

(assert (=> b!1197407 m!1104439))

(assert (=> b!1197407 m!1104445))

(assert (=> b!1197263 d!132363))

(declare-fun d!132365 () Bool)

(assert (=> d!132365 (= (array_inv!28522 _keys!1208) (bvsge (size!37959 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!100320 d!132365))

(declare-fun d!132367 () Bool)

(assert (=> d!132367 (= (array_inv!28523 _values!996) (bvsge (size!37960 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!100320 d!132367))

(declare-fun d!132369 () Bool)

(declare-fun res!796868 () Bool)

(declare-fun e!680249 () Bool)

(assert (=> d!132369 (=> res!796868 e!680249)))

(assert (=> d!132369 (= res!796868 (bvsge #b00000000000000000000000000000000 (size!37959 _keys!1208)))))

(assert (=> d!132369 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!680249)))

(declare-fun bm!57263 () Bool)

(declare-fun call!57266 () Bool)

(assert (=> bm!57263 (= call!57266 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1197416 () Bool)

(declare-fun e!680250 () Bool)

(declare-fun e!680248 () Bool)

(assert (=> b!1197416 (= e!680250 e!680248)))

(declare-fun lt!543275 () (_ BitVec 64))

(assert (=> b!1197416 (= lt!543275 (select (arr!37423 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!543276 () Unit!39700)

(assert (=> b!1197416 (= lt!543276 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!543275 #b00000000000000000000000000000000))))

(assert (=> b!1197416 (arrayContainsKey!0 _keys!1208 lt!543275 #b00000000000000000000000000000000)))

(declare-fun lt!543277 () Unit!39700)

(assert (=> b!1197416 (= lt!543277 lt!543276)))

(declare-fun res!796867 () Bool)

(declare-datatypes ((SeekEntryResult!9931 0))(
  ( (MissingZero!9931 (index!42095 (_ BitVec 32))) (Found!9931 (index!42096 (_ BitVec 32))) (Intermediate!9931 (undefined!10743 Bool) (index!42097 (_ BitVec 32)) (x!105870 (_ BitVec 32))) (Undefined!9931) (MissingVacant!9931 (index!42098 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!77553 (_ BitVec 32)) SeekEntryResult!9931)

(assert (=> b!1197416 (= res!796867 (= (seekEntryOrOpen!0 (select (arr!37423 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9931 #b00000000000000000000000000000000)))))

(assert (=> b!1197416 (=> (not res!796867) (not e!680248))))

(declare-fun b!1197417 () Bool)

(assert (=> b!1197417 (= e!680249 e!680250)))

(declare-fun c!117404 () Bool)

(assert (=> b!1197417 (= c!117404 (validKeyInArray!0 (select (arr!37423 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1197418 () Bool)

(assert (=> b!1197418 (= e!680250 call!57266)))

(declare-fun b!1197419 () Bool)

(assert (=> b!1197419 (= e!680248 call!57266)))

(assert (= (and d!132369 (not res!796868)) b!1197417))

(assert (= (and b!1197417 c!117404) b!1197416))

(assert (= (and b!1197417 (not c!117404)) b!1197418))

(assert (= (and b!1197416 res!796867) b!1197419))

(assert (= (or b!1197419 b!1197418) bm!57263))

(declare-fun m!1104447 () Bool)

(assert (=> bm!57263 m!1104447))

(assert (=> b!1197416 m!1104439))

(declare-fun m!1104449 () Bool)

(assert (=> b!1197416 m!1104449))

(declare-fun m!1104451 () Bool)

(assert (=> b!1197416 m!1104451))

(assert (=> b!1197416 m!1104439))

(declare-fun m!1104453 () Bool)

(assert (=> b!1197416 m!1104453))

(assert (=> b!1197417 m!1104439))

(assert (=> b!1197417 m!1104439))

(assert (=> b!1197417 m!1104445))

(assert (=> b!1197277 d!132369))

(declare-fun bm!57264 () Bool)

(declare-fun call!57267 () ListLongMap!17491)

(assert (=> bm!57264 (= call!57267 (getCurrentListMapNoExtraKeys!5201 lt!543227 (array!77556 (store (arr!37424 _values!996) i!673 (ValueCellFull!14484 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!132371 () Bool)

(declare-fun e!680253 () Bool)

(assert (=> d!132371 e!680253))

(declare-fun res!796871 () Bool)

(assert (=> d!132371 (=> (not res!796871) (not e!680253))))

(declare-fun lt!543279 () ListLongMap!17491)

(assert (=> d!132371 (= res!796871 (not (contains!6864 lt!543279 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!680256 () ListLongMap!17491)

(assert (=> d!132371 (= lt!543279 e!680256)))

(declare-fun c!117405 () Bool)

(assert (=> d!132371 (= c!117405 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37959 lt!543227)))))

(assert (=> d!132371 (validMask!0 mask!1564)))

(assert (=> d!132371 (= (getCurrentListMapNoExtraKeys!5201 lt!543227 (array!77556 (store (arr!37424 _values!996) i!673 (ValueCellFull!14484 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!543279)))

(declare-fun b!1197420 () Bool)

(assert (=> b!1197420 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37959 lt!543227)))))

(assert (=> b!1197420 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37960 (array!77556 (store (arr!37424 _values!996) i!673 (ValueCellFull!14484 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996)))))))

(declare-fun e!680252 () Bool)

(assert (=> b!1197420 (= e!680252 (= (apply!958 lt!543279 (select (arr!37423 lt!543227) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19106 (select (arr!37424 (array!77556 (store (arr!37424 _values!996) i!673 (ValueCellFull!14484 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1197421 () Bool)

(declare-fun e!680257 () ListLongMap!17491)

(assert (=> b!1197421 (= e!680257 call!57267)))

(declare-fun b!1197422 () Bool)

(declare-fun res!796870 () Bool)

(assert (=> b!1197422 (=> (not res!796870) (not e!680253))))

(assert (=> b!1197422 (= res!796870 (not (contains!6864 lt!543279 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1197423 () Bool)

(declare-fun e!680251 () Bool)

(assert (=> b!1197423 (= e!680251 (isEmpty!978 lt!543279))))

(declare-fun b!1197424 () Bool)

(declare-fun e!680254 () Bool)

(assert (=> b!1197424 (= e!680254 e!680251)))

(declare-fun c!117406 () Bool)

(assert (=> b!1197424 (= c!117406 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37959 lt!543227)))))

(declare-fun b!1197425 () Bool)

(declare-fun lt!543281 () Unit!39700)

(declare-fun lt!543282 () Unit!39700)

(assert (=> b!1197425 (= lt!543281 lt!543282)))

(declare-fun lt!543284 () (_ BitVec 64))

(declare-fun lt!543280 () (_ BitVec 64))

(declare-fun lt!543283 () ListLongMap!17491)

(declare-fun lt!543278 () V!45643)

(assert (=> b!1197425 (not (contains!6864 (+!3947 lt!543283 (tuple2!19523 lt!543284 lt!543278)) lt!543280))))

(assert (=> b!1197425 (= lt!543282 (addStillNotContains!286 lt!543283 lt!543284 lt!543278 lt!543280))))

(assert (=> b!1197425 (= lt!543280 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1197425 (= lt!543278 (get!19106 (select (arr!37424 (array!77556 (store (arr!37424 _values!996) i!673 (ValueCellFull!14484 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1197425 (= lt!543284 (select (arr!37423 lt!543227) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1197425 (= lt!543283 call!57267)))

(assert (=> b!1197425 (= e!680257 (+!3947 call!57267 (tuple2!19523 (select (arr!37423 lt!543227) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19106 (select (arr!37424 (array!77556 (store (arr!37424 _values!996) i!673 (ValueCellFull!14484 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996))) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1197426 () Bool)

(assert (=> b!1197426 (= e!680253 e!680254)))

(declare-fun c!117408 () Bool)

(declare-fun e!680255 () Bool)

(assert (=> b!1197426 (= c!117408 e!680255)))

(declare-fun res!796872 () Bool)

(assert (=> b!1197426 (=> (not res!796872) (not e!680255))))

(assert (=> b!1197426 (= res!796872 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37959 lt!543227)))))

(declare-fun b!1197427 () Bool)

(assert (=> b!1197427 (= e!680255 (validKeyInArray!0 (select (arr!37423 lt!543227) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1197427 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1197428 () Bool)

(assert (=> b!1197428 (= e!680256 (ListLongMap!17492 Nil!26329))))

(declare-fun b!1197429 () Bool)

(assert (=> b!1197429 (= e!680251 (= lt!543279 (getCurrentListMapNoExtraKeys!5201 lt!543227 (array!77556 (store (arr!37424 _values!996) i!673 (ValueCellFull!14484 (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37960 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1197430 () Bool)

(assert (=> b!1197430 (= e!680254 e!680252)))

(assert (=> b!1197430 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37959 lt!543227)))))

(declare-fun res!796869 () Bool)

(assert (=> b!1197430 (= res!796869 (contains!6864 lt!543279 (select (arr!37423 lt!543227) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1197430 (=> (not res!796869) (not e!680252))))

(declare-fun b!1197431 () Bool)

(assert (=> b!1197431 (= e!680256 e!680257)))

(declare-fun c!117407 () Bool)

(assert (=> b!1197431 (= c!117407 (validKeyInArray!0 (select (arr!37423 lt!543227) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (= (and d!132371 c!117405) b!1197428))

(assert (= (and d!132371 (not c!117405)) b!1197431))

(assert (= (and b!1197431 c!117407) b!1197425))

(assert (= (and b!1197431 (not c!117407)) b!1197421))

(assert (= (or b!1197425 b!1197421) bm!57264))

(assert (= (and d!132371 res!796871) b!1197422))

(assert (= (and b!1197422 res!796870) b!1197426))

(assert (= (and b!1197426 res!796872) b!1197427))

(assert (= (and b!1197426 c!117408) b!1197430))

(assert (= (and b!1197426 (not c!117408)) b!1197424))

(assert (= (and b!1197430 res!796869) b!1197420))

(assert (= (and b!1197424 c!117406) b!1197429))

(assert (= (and b!1197424 (not c!117406)) b!1197423))

(declare-fun b_lambda!20875 () Bool)

(assert (=> (not b_lambda!20875) (not b!1197420)))

(assert (=> b!1197420 t!39029))

(declare-fun b_and!42305 () Bool)

(assert (= b_and!42303 (and (=> t!39029 result!21611) b_and!42305)))

(declare-fun b_lambda!20877 () Bool)

(assert (=> (not b_lambda!20877) (not b!1197425)))

(assert (=> b!1197425 t!39029))

(declare-fun b_and!42307 () Bool)

(assert (= b_and!42305 (and (=> t!39029 result!21611) b_and!42307)))

(declare-fun m!1104455 () Bool)

(assert (=> b!1197427 m!1104455))

(assert (=> b!1197427 m!1104455))

(declare-fun m!1104457 () Bool)

(assert (=> b!1197427 m!1104457))

(declare-fun m!1104459 () Bool)

(assert (=> d!132371 m!1104459))

(assert (=> d!132371 m!1104305))

(declare-fun m!1104461 () Bool)

(assert (=> b!1197422 m!1104461))

(assert (=> b!1197431 m!1104455))

(assert (=> b!1197431 m!1104455))

(assert (=> b!1197431 m!1104457))

(declare-fun m!1104463 () Bool)

(assert (=> b!1197429 m!1104463))

(declare-fun m!1104465 () Bool)

(assert (=> b!1197420 m!1104465))

(assert (=> b!1197420 m!1104465))

(assert (=> b!1197420 m!1104299))

(declare-fun m!1104467 () Bool)

(assert (=> b!1197420 m!1104467))

(assert (=> b!1197420 m!1104299))

(assert (=> b!1197420 m!1104455))

(declare-fun m!1104469 () Bool)

(assert (=> b!1197420 m!1104469))

(assert (=> b!1197420 m!1104455))

(declare-fun m!1104471 () Bool)

(assert (=> b!1197425 m!1104471))

(assert (=> b!1197425 m!1104465))

(assert (=> b!1197425 m!1104465))

(assert (=> b!1197425 m!1104299))

(assert (=> b!1197425 m!1104467))

(declare-fun m!1104473 () Bool)

(assert (=> b!1197425 m!1104473))

(assert (=> b!1197425 m!1104299))

(declare-fun m!1104475 () Bool)

(assert (=> b!1197425 m!1104475))

(assert (=> b!1197425 m!1104455))

(assert (=> b!1197425 m!1104471))

(declare-fun m!1104477 () Bool)

(assert (=> b!1197425 m!1104477))

(assert (=> b!1197430 m!1104455))

(assert (=> b!1197430 m!1104455))

(declare-fun m!1104479 () Bool)

(assert (=> b!1197430 m!1104479))

(declare-fun m!1104481 () Bool)

(assert (=> b!1197423 m!1104481))

(assert (=> bm!57264 m!1104463))

(assert (=> bm!57240 d!132371))

(declare-fun call!57268 () ListLongMap!17491)

(declare-fun bm!57265 () Bool)

(assert (=> bm!57265 (= call!57268 (getCurrentListMapNoExtraKeys!5201 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004))))

(declare-fun d!132373 () Bool)

(declare-fun e!680260 () Bool)

(assert (=> d!132373 e!680260))

(declare-fun res!796875 () Bool)

(assert (=> d!132373 (=> (not res!796875) (not e!680260))))

(declare-fun lt!543286 () ListLongMap!17491)

(assert (=> d!132373 (= res!796875 (not (contains!6864 lt!543286 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!680263 () ListLongMap!17491)

(assert (=> d!132373 (= lt!543286 e!680263)))

(declare-fun c!117409 () Bool)

(assert (=> d!132373 (= c!117409 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37959 _keys!1208)))))

(assert (=> d!132373 (validMask!0 mask!1564)))

(assert (=> d!132373 (= (getCurrentListMapNoExtraKeys!5201 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) lt!543286)))

(declare-fun b!1197432 () Bool)

(assert (=> b!1197432 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37959 _keys!1208)))))

(assert (=> b!1197432 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37960 _values!996)))))

(declare-fun e!680259 () Bool)

(assert (=> b!1197432 (= e!680259 (= (apply!958 lt!543286 (select (arr!37423 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))) (get!19106 (select (arr!37424 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1197433 () Bool)

(declare-fun e!680264 () ListLongMap!17491)

(assert (=> b!1197433 (= e!680264 call!57268)))

(declare-fun b!1197434 () Bool)

(declare-fun res!796874 () Bool)

(assert (=> b!1197434 (=> (not res!796874) (not e!680260))))

(assert (=> b!1197434 (= res!796874 (not (contains!6864 lt!543286 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1197435 () Bool)

(declare-fun e!680258 () Bool)

(assert (=> b!1197435 (= e!680258 (isEmpty!978 lt!543286))))

(declare-fun b!1197436 () Bool)

(declare-fun e!680261 () Bool)

(assert (=> b!1197436 (= e!680261 e!680258)))

(declare-fun c!117410 () Bool)

(assert (=> b!1197436 (= c!117410 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37959 _keys!1208)))))

(declare-fun b!1197437 () Bool)

(declare-fun lt!543288 () Unit!39700)

(declare-fun lt!543289 () Unit!39700)

(assert (=> b!1197437 (= lt!543288 lt!543289)))

(declare-fun lt!543290 () ListLongMap!17491)

(declare-fun lt!543287 () (_ BitVec 64))

(declare-fun lt!543285 () V!45643)

(declare-fun lt!543291 () (_ BitVec 64))

(assert (=> b!1197437 (not (contains!6864 (+!3947 lt!543290 (tuple2!19523 lt!543291 lt!543285)) lt!543287))))

(assert (=> b!1197437 (= lt!543289 (addStillNotContains!286 lt!543290 lt!543291 lt!543285 lt!543287))))

(assert (=> b!1197437 (= lt!543287 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1197437 (= lt!543285 (get!19106 (select (arr!37424 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1197437 (= lt!543291 (select (arr!37423 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1197437 (= lt!543290 call!57268)))

(assert (=> b!1197437 (= e!680264 (+!3947 call!57268 (tuple2!19523 (select (arr!37423 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (get!19106 (select (arr!37424 _values!996) (bvadd #b00000000000000000000000000000001 from!1455)) (dynLambda!3125 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1197438 () Bool)

(assert (=> b!1197438 (= e!680260 e!680261)))

(declare-fun c!117412 () Bool)

(declare-fun e!680262 () Bool)

(assert (=> b!1197438 (= c!117412 e!680262)))

(declare-fun res!796876 () Bool)

(assert (=> b!1197438 (=> (not res!796876) (not e!680262))))

(assert (=> b!1197438 (= res!796876 (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37959 _keys!1208)))))

(declare-fun b!1197439 () Bool)

(assert (=> b!1197439 (= e!680262 (validKeyInArray!0 (select (arr!37423 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1197439 (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))

(declare-fun b!1197440 () Bool)

(assert (=> b!1197440 (= e!680263 (ListLongMap!17492 Nil!26329))))

(declare-fun b!1197441 () Bool)

(assert (=> b!1197441 (= e!680258 (= lt!543286 (getCurrentListMapNoExtraKeys!5201 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455 #b00000000000000000000000000000001) defaultEntry!1004)))))

(declare-fun b!1197442 () Bool)

(assert (=> b!1197442 (= e!680261 e!680259)))

(assert (=> b!1197442 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) (size!37959 _keys!1208)))))

(declare-fun res!796873 () Bool)

(assert (=> b!1197442 (= res!796873 (contains!6864 lt!543286 (select (arr!37423 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (=> b!1197442 (=> (not res!796873) (not e!680259))))

(declare-fun b!1197443 () Bool)

(assert (=> b!1197443 (= e!680263 e!680264)))

(declare-fun c!117411 () Bool)

(assert (=> b!1197443 (= c!117411 (validKeyInArray!0 (select (arr!37423 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455))))))

(assert (= (and d!132373 c!117409) b!1197440))

(assert (= (and d!132373 (not c!117409)) b!1197443))

(assert (= (and b!1197443 c!117411) b!1197437))

(assert (= (and b!1197443 (not c!117411)) b!1197433))

(assert (= (or b!1197437 b!1197433) bm!57265))

(assert (= (and d!132373 res!796875) b!1197434))

(assert (= (and b!1197434 res!796874) b!1197438))

(assert (= (and b!1197438 res!796876) b!1197439))

(assert (= (and b!1197438 c!117412) b!1197442))

(assert (= (and b!1197438 (not c!117412)) b!1197436))

(assert (= (and b!1197442 res!796873) b!1197432))

(assert (= (and b!1197436 c!117410) b!1197441))

(assert (= (and b!1197436 (not c!117410)) b!1197435))

(declare-fun b_lambda!20879 () Bool)

(assert (=> (not b_lambda!20879) (not b!1197432)))

(assert (=> b!1197432 t!39029))

(declare-fun b_and!42309 () Bool)

(assert (= b_and!42307 (and (=> t!39029 result!21611) b_and!42309)))

(declare-fun b_lambda!20881 () Bool)

(assert (=> (not b_lambda!20881) (not b!1197437)))

(assert (=> b!1197437 t!39029))

(declare-fun b_and!42311 () Bool)

(assert (= b_and!42309 (and (=> t!39029 result!21611) b_and!42311)))

(declare-fun m!1104483 () Bool)

(assert (=> b!1197439 m!1104483))

(assert (=> b!1197439 m!1104483))

(declare-fun m!1104485 () Bool)

(assert (=> b!1197439 m!1104485))

(declare-fun m!1104487 () Bool)

(assert (=> d!132373 m!1104487))

(assert (=> d!132373 m!1104305))

(declare-fun m!1104489 () Bool)

(assert (=> b!1197434 m!1104489))

(assert (=> b!1197443 m!1104483))

(assert (=> b!1197443 m!1104483))

(assert (=> b!1197443 m!1104485))

(declare-fun m!1104491 () Bool)

(assert (=> b!1197441 m!1104491))

(declare-fun m!1104493 () Bool)

(assert (=> b!1197432 m!1104493))

(assert (=> b!1197432 m!1104493))

(assert (=> b!1197432 m!1104299))

(declare-fun m!1104495 () Bool)

(assert (=> b!1197432 m!1104495))

(assert (=> b!1197432 m!1104299))

(assert (=> b!1197432 m!1104483))

(declare-fun m!1104497 () Bool)

(assert (=> b!1197432 m!1104497))

(assert (=> b!1197432 m!1104483))

(declare-fun m!1104499 () Bool)

(assert (=> b!1197437 m!1104499))

(assert (=> b!1197437 m!1104493))

(assert (=> b!1197437 m!1104493))

(assert (=> b!1197437 m!1104299))

(assert (=> b!1197437 m!1104495))

(declare-fun m!1104501 () Bool)

(assert (=> b!1197437 m!1104501))

(assert (=> b!1197437 m!1104299))

(declare-fun m!1104503 () Bool)

(assert (=> b!1197437 m!1104503))

(assert (=> b!1197437 m!1104483))

(assert (=> b!1197437 m!1104499))

(declare-fun m!1104505 () Bool)

(assert (=> b!1197437 m!1104505))

(assert (=> b!1197442 m!1104483))

(assert (=> b!1197442 m!1104483))

(declare-fun m!1104507 () Bool)

(assert (=> b!1197442 m!1104507))

(declare-fun m!1104509 () Bool)

(assert (=> b!1197435 m!1104509))

(assert (=> bm!57265 m!1104491))

(assert (=> bm!57239 d!132373))

(declare-fun d!132375 () Bool)

(assert (=> d!132375 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1197275 d!132375))

(declare-fun d!132377 () Bool)

(assert (=> d!132377 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1197268 d!132377))

(declare-fun d!132379 () Bool)

(declare-fun res!796881 () Bool)

(declare-fun e!680269 () Bool)

(assert (=> d!132379 (=> res!796881 e!680269)))

(assert (=> d!132379 (= res!796881 (= (select (arr!37423 _keys!1208) #b00000000000000000000000000000000) k0!934))))

(assert (=> d!132379 (= (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000) e!680269)))

(declare-fun b!1197448 () Bool)

(declare-fun e!680270 () Bool)

(assert (=> b!1197448 (= e!680269 e!680270)))

(declare-fun res!796882 () Bool)

(assert (=> b!1197448 (=> (not res!796882) (not e!680270))))

(assert (=> b!1197448 (= res!796882 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!37959 _keys!1208)))))

(declare-fun b!1197449 () Bool)

(assert (=> b!1197449 (= e!680270 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!132379 (not res!796881)) b!1197448))

(assert (= (and b!1197448 res!796882) b!1197449))

(assert (=> d!132379 m!1104439))

(declare-fun m!1104511 () Bool)

(assert (=> b!1197449 m!1104511))

(assert (=> b!1197264 d!132379))

(declare-fun d!132381 () Bool)

(assert (=> d!132381 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543294 () Unit!39700)

(declare-fun choose!13 (array!77553 (_ BitVec 64) (_ BitVec 32)) Unit!39700)

(assert (=> d!132381 (= lt!543294 (choose!13 _keys!1208 k0!934 i!673))))

(assert (=> d!132381 (bvsge i!673 #b00000000000000000000000000000000)))

(assert (=> d!132381 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673) lt!543294)))

(declare-fun bs!33947 () Bool)

(assert (= bs!33947 d!132381))

(assert (=> bs!33947 m!1104287))

(declare-fun m!1104513 () Bool)

(assert (=> bs!33947 m!1104513))

(assert (=> b!1197264 d!132381))

(declare-fun d!132383 () Bool)

(declare-fun res!796884 () Bool)

(declare-fun e!680272 () Bool)

(assert (=> d!132383 (=> res!796884 e!680272)))

(assert (=> d!132383 (= res!796884 (bvsge #b00000000000000000000000000000000 (size!37959 lt!543227)))))

(assert (=> d!132383 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543227 mask!1564) e!680272)))

(declare-fun bm!57266 () Bool)

(declare-fun call!57269 () Bool)

(assert (=> bm!57266 (= call!57269 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!543227 mask!1564))))

(declare-fun b!1197450 () Bool)

(declare-fun e!680273 () Bool)

(declare-fun e!680271 () Bool)

(assert (=> b!1197450 (= e!680273 e!680271)))

(declare-fun lt!543295 () (_ BitVec 64))

(assert (=> b!1197450 (= lt!543295 (select (arr!37423 lt!543227) #b00000000000000000000000000000000))))

(declare-fun lt!543296 () Unit!39700)

(assert (=> b!1197450 (= lt!543296 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!543227 lt!543295 #b00000000000000000000000000000000))))

(assert (=> b!1197450 (arrayContainsKey!0 lt!543227 lt!543295 #b00000000000000000000000000000000)))

(declare-fun lt!543297 () Unit!39700)

(assert (=> b!1197450 (= lt!543297 lt!543296)))

(declare-fun res!796883 () Bool)

(assert (=> b!1197450 (= res!796883 (= (seekEntryOrOpen!0 (select (arr!37423 lt!543227) #b00000000000000000000000000000000) lt!543227 mask!1564) (Found!9931 #b00000000000000000000000000000000)))))

(assert (=> b!1197450 (=> (not res!796883) (not e!680271))))

(declare-fun b!1197451 () Bool)

(assert (=> b!1197451 (= e!680272 e!680273)))

(declare-fun c!117413 () Bool)

(assert (=> b!1197451 (= c!117413 (validKeyInArray!0 (select (arr!37423 lt!543227) #b00000000000000000000000000000000)))))

(declare-fun b!1197452 () Bool)

(assert (=> b!1197452 (= e!680273 call!57269)))

(declare-fun b!1197453 () Bool)

(assert (=> b!1197453 (= e!680271 call!57269)))

(assert (= (and d!132383 (not res!796884)) b!1197451))

(assert (= (and b!1197451 c!117413) b!1197450))

(assert (= (and b!1197451 (not c!117413)) b!1197452))

(assert (= (and b!1197450 res!796883) b!1197453))

(assert (= (or b!1197453 b!1197452) bm!57266))

(declare-fun m!1104515 () Bool)

(assert (=> bm!57266 m!1104515))

(assert (=> b!1197450 m!1104431))

(declare-fun m!1104517 () Bool)

(assert (=> b!1197450 m!1104517))

(declare-fun m!1104519 () Bool)

(assert (=> b!1197450 m!1104519))

(assert (=> b!1197450 m!1104431))

(declare-fun m!1104521 () Bool)

(assert (=> b!1197450 m!1104521))

(assert (=> b!1197451 m!1104431))

(assert (=> b!1197451 m!1104431))

(assert (=> b!1197451 m!1104437))

(assert (=> b!1197266 d!132383))

(declare-fun d!132385 () Bool)

(declare-fun lt!543300 () ListLongMap!17491)

(assert (=> d!132385 (not (contains!6864 lt!543300 k0!934))))

(declare-fun removeStrictlySorted!92 (List!26332 (_ BitVec 64)) List!26332)

(assert (=> d!132385 (= lt!543300 (ListLongMap!17492 (removeStrictlySorted!92 (toList!8761 call!57243) k0!934)))))

(assert (=> d!132385 (= (-!1779 call!57243 k0!934) lt!543300)))

(declare-fun bs!33948 () Bool)

(assert (= bs!33948 d!132385))

(declare-fun m!1104523 () Bool)

(assert (=> bs!33948 m!1104523))

(declare-fun m!1104525 () Bool)

(assert (=> bs!33948 m!1104525))

(assert (=> b!1197274 d!132385))

(declare-fun b!1197460 () Bool)

(declare-fun e!680279 () Bool)

(assert (=> b!1197460 (= e!680279 tp_is_empty!30387)))

(declare-fun b!1197461 () Bool)

(declare-fun e!680278 () Bool)

(assert (=> b!1197461 (= e!680278 tp_is_empty!30387)))

(declare-fun condMapEmpty!47423 () Bool)

(declare-fun mapDefault!47423 () ValueCell!14484)

(assert (=> mapNonEmpty!47417 (= condMapEmpty!47423 (= mapRest!47417 ((as const (Array (_ BitVec 32) ValueCell!14484)) mapDefault!47423)))))

(declare-fun mapRes!47423 () Bool)

(assert (=> mapNonEmpty!47417 (= tp!90069 (and e!680278 mapRes!47423))))

(declare-fun mapIsEmpty!47423 () Bool)

(assert (=> mapIsEmpty!47423 mapRes!47423))

(declare-fun mapNonEmpty!47423 () Bool)

(declare-fun tp!90078 () Bool)

(assert (=> mapNonEmpty!47423 (= mapRes!47423 (and tp!90078 e!680279))))

(declare-fun mapValue!47423 () ValueCell!14484)

(declare-fun mapKey!47423 () (_ BitVec 32))

(declare-fun mapRest!47423 () (Array (_ BitVec 32) ValueCell!14484))

(assert (=> mapNonEmpty!47423 (= mapRest!47417 (store mapRest!47423 mapKey!47423 mapValue!47423))))

(assert (= (and mapNonEmpty!47417 condMapEmpty!47423) mapIsEmpty!47423))

(assert (= (and mapNonEmpty!47417 (not condMapEmpty!47423)) mapNonEmpty!47423))

(assert (= (and mapNonEmpty!47423 ((_ is ValueCellFull!14484) mapValue!47423)) b!1197460))

(assert (= (and mapNonEmpty!47417 ((_ is ValueCellFull!14484) mapDefault!47423)) b!1197461))

(declare-fun m!1104527 () Bool)

(assert (=> mapNonEmpty!47423 m!1104527))

(declare-fun b_lambda!20883 () Bool)

(assert (= b_lambda!20875 (or (and start!100320 b_free!25707) b_lambda!20883)))

(declare-fun b_lambda!20885 () Bool)

(assert (= b_lambda!20867 (or (and start!100320 b_free!25707) b_lambda!20885)))

(declare-fun b_lambda!20887 () Bool)

(assert (= b_lambda!20871 (or (and start!100320 b_free!25707) b_lambda!20887)))

(declare-fun b_lambda!20889 () Bool)

(assert (= b_lambda!20865 (or (and start!100320 b_free!25707) b_lambda!20889)))

(declare-fun b_lambda!20891 () Bool)

(assert (= b_lambda!20873 (or (and start!100320 b_free!25707) b_lambda!20891)))

(declare-fun b_lambda!20893 () Bool)

(assert (= b_lambda!20869 (or (and start!100320 b_free!25707) b_lambda!20893)))

(declare-fun b_lambda!20895 () Bool)

(assert (= b_lambda!20877 (or (and start!100320 b_free!25707) b_lambda!20895)))

(declare-fun b_lambda!20897 () Bool)

(assert (= b_lambda!20881 (or (and start!100320 b_free!25707) b_lambda!20897)))

(declare-fun b_lambda!20899 () Bool)

(assert (= b_lambda!20879 (or (and start!100320 b_free!25707) b_lambda!20899)))

(check-sat (not d!132359) (not b!1197385) (not b!1197422) (not d!132385) (not b!1197443) (not d!132373) tp_is_empty!30387 (not b_lambda!20895) (not d!132371) (not b!1197451) (not bm!57266) (not b!1197404) (not b!1197355) (not b!1197366) (not b!1197360) (not b!1197407) (not b!1197378) (not b!1197417) (not b!1197423) (not b!1197357) (not b!1197435) (not b!1197439) (not bm!57250) (not b_lambda!20897) (not b!1197374) (not b!1197427) (not b!1197441) (not b!1197376) (not b_lambda!20861) (not b!1197362) (not d!132355) (not b!1197429) (not b_lambda!20883) (not b!1197358) (not bm!57265) (not b_next!25707) (not b_lambda!20893) (not b!1197430) (not b_lambda!20887) (not b!1197364) (not bm!57249) (not b!1197416) (not b!1197402) (not mapNonEmpty!47423) (not b!1197442) (not b!1197370) (not bm!57260) (not b!1197401) (not b!1197420) (not b_lambda!20899) (not bm!57264) (not d!132357) (not b_lambda!20889) (not b!1197369) (not b!1197377) (not b!1197365) (not b!1197367) (not b!1197406) (not b_lambda!20885) b_and!42311 (not b_lambda!20891) (not b!1197425) (not bm!57259) (not d!132381) (not bm!57255) (not b!1197372) (not b!1197399) (not b!1197449) (not b!1197450) (not b!1197431) (not bm!57263) (not b!1197437) (not b!1197432) (not bm!57256) (not b_lambda!20863) (not b!1197434))
(check-sat b_and!42311 (not b_next!25707))
