; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103606 () Bool)

(assert start!103606)

(declare-fun res!827986 () Bool)

(declare-fun e!703457 () Bool)

(assert (=> start!103606 (=> (not res!827986) (not e!703457))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103606 (= res!827986 (not (= key1!25 key2!15)))))

(assert (=> start!103606 e!703457))

(assert (=> start!103606 true))

(declare-fun e!703458 () Bool)

(assert (=> start!103606 e!703458))

(declare-fun tp_is_empty!31231 () Bool)

(assert (=> start!103606 tp_is_empty!31231))

(declare-fun b!1241085 () Bool)

(declare-fun res!827985 () Bool)

(assert (=> b!1241085 (=> (not res!827985) (not e!703457))))

(declare-datatypes ((B!1832 0))(
  ( (B!1833 (val!15678 Int)) )
))
(declare-datatypes ((tuple2!20312 0))(
  ( (tuple2!20313 (_1!10167 (_ BitVec 64)) (_2!10167 B!1832)) )
))
(declare-datatypes ((List!27405 0))(
  ( (Nil!27402) (Cons!27401 (h!28610 tuple2!20312) (t!40859 List!27405)) )
))
(declare-fun l!644 () List!27405)

(declare-fun isStrictlySorted!741 (List!27405) Bool)

(assert (=> b!1241085 (= res!827985 (isStrictlySorted!741 l!644))))

(declare-fun b!1241086 () Bool)

(declare-fun res!827988 () Bool)

(assert (=> b!1241086 (=> (not res!827988) (not e!703457))))

(assert (=> b!1241086 (= res!827988 (isStrictlySorted!741 (t!40859 l!644)))))

(declare-fun v1!20 () B!1832)

(declare-fun b!1241087 () Bool)

(declare-fun insertStrictlySorted!432 (List!27405 (_ BitVec 64) B!1832) List!27405)

(assert (=> b!1241087 (= e!703457 (not (isStrictlySorted!741 (insertStrictlySorted!432 l!644 key1!25 v1!20))))))

(declare-fun removeStrictlySorted!124 (List!27405 (_ BitVec 64)) List!27405)

(assert (=> b!1241087 (= (insertStrictlySorted!432 (removeStrictlySorted!124 (t!40859 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!124 (insertStrictlySorted!432 (t!40859 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41100 0))(
  ( (Unit!41101) )
))
(declare-fun lt!561921 () Unit!41100)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!13 (List!27405 (_ BitVec 64) B!1832 (_ BitVec 64)) Unit!41100)

(assert (=> b!1241087 (= lt!561921 (lemmaInsertAndRemoveStrictlySortedCommutative!13 (t!40859 l!644) key1!25 v1!20 key2!15))))

(declare-fun b!1241088 () Bool)

(declare-fun res!827987 () Bool)

(assert (=> b!1241088 (=> (not res!827987) (not e!703457))))

(get-info :version)

(assert (=> b!1241088 (= res!827987 ((_ is Cons!27401) l!644))))

(declare-fun b!1241089 () Bool)

(declare-fun tp!92609 () Bool)

(assert (=> b!1241089 (= e!703458 (and tp_is_empty!31231 tp!92609))))

(assert (= (and start!103606 res!827986) b!1241085))

(assert (= (and b!1241085 res!827985) b!1241088))

(assert (= (and b!1241088 res!827987) b!1241086))

(assert (= (and b!1241086 res!827988) b!1241087))

(assert (= (and start!103606 ((_ is Cons!27401) l!644)) b!1241089))

(declare-fun m!1143813 () Bool)

(assert (=> b!1241085 m!1143813))

(declare-fun m!1143815 () Bool)

(assert (=> b!1241086 m!1143815))

(declare-fun m!1143817 () Bool)

(assert (=> b!1241087 m!1143817))

(declare-fun m!1143819 () Bool)

(assert (=> b!1241087 m!1143819))

(assert (=> b!1241087 m!1143817))

(declare-fun m!1143821 () Bool)

(assert (=> b!1241087 m!1143821))

(declare-fun m!1143823 () Bool)

(assert (=> b!1241087 m!1143823))

(assert (=> b!1241087 m!1143821))

(declare-fun m!1143825 () Bool)

(assert (=> b!1241087 m!1143825))

(declare-fun m!1143827 () Bool)

(assert (=> b!1241087 m!1143827))

(assert (=> b!1241087 m!1143825))

(declare-fun m!1143829 () Bool)

(assert (=> b!1241087 m!1143829))

(check-sat (not b!1241085) tp_is_empty!31231 (not b!1241089) (not b!1241087) (not b!1241086))
(check-sat)
(get-model)

(declare-fun b!1241154 () Bool)

(declare-fun e!703499 () List!27405)

(declare-fun e!703497 () List!27405)

(assert (=> b!1241154 (= e!703499 e!703497)))

(declare-fun c!121357 () Bool)

(assert (=> b!1241154 (= c!121357 (and ((_ is Cons!27401) (insertStrictlySorted!432 (t!40859 l!644) key1!25 v1!20)) (not (= (_1!10167 (h!28610 (insertStrictlySorted!432 (t!40859 l!644) key1!25 v1!20))) key2!15))))))

(declare-fun b!1241155 () Bool)

(assert (=> b!1241155 (= e!703497 Nil!27402)))

(declare-fun d!136299 () Bool)

(declare-fun e!703498 () Bool)

(assert (=> d!136299 e!703498))

(declare-fun res!828031 () Bool)

(assert (=> d!136299 (=> (not res!828031) (not e!703498))))

(declare-fun lt!561932 () List!27405)

(assert (=> d!136299 (= res!828031 (isStrictlySorted!741 lt!561932))))

(assert (=> d!136299 (= lt!561932 e!703499)))

(declare-fun c!121358 () Bool)

(assert (=> d!136299 (= c!121358 (and ((_ is Cons!27401) (insertStrictlySorted!432 (t!40859 l!644) key1!25 v1!20)) (= (_1!10167 (h!28610 (insertStrictlySorted!432 (t!40859 l!644) key1!25 v1!20))) key2!15)))))

(assert (=> d!136299 (isStrictlySorted!741 (insertStrictlySorted!432 (t!40859 l!644) key1!25 v1!20))))

(assert (=> d!136299 (= (removeStrictlySorted!124 (insertStrictlySorted!432 (t!40859 l!644) key1!25 v1!20) key2!15) lt!561932)))

(declare-fun b!1241156 () Bool)

(assert (=> b!1241156 (= e!703499 (t!40859 (insertStrictlySorted!432 (t!40859 l!644) key1!25 v1!20)))))

(declare-fun b!1241157 () Bool)

(declare-fun $colon$colon!619 (List!27405 tuple2!20312) List!27405)

(assert (=> b!1241157 (= e!703497 ($colon$colon!619 (removeStrictlySorted!124 (t!40859 (insertStrictlySorted!432 (t!40859 l!644) key1!25 v1!20)) key2!15) (h!28610 (insertStrictlySorted!432 (t!40859 l!644) key1!25 v1!20))))))

(declare-fun b!1241158 () Bool)

(declare-fun containsKey!603 (List!27405 (_ BitVec 64)) Bool)

(assert (=> b!1241158 (= e!703498 (not (containsKey!603 lt!561932 key2!15)))))

(assert (= (and d!136299 c!121358) b!1241156))

(assert (= (and d!136299 (not c!121358)) b!1241154))

(assert (= (and b!1241154 c!121357) b!1241157))

(assert (= (and b!1241154 (not c!121357)) b!1241155))

(assert (= (and d!136299 res!828031) b!1241158))

(declare-fun m!1143871 () Bool)

(assert (=> d!136299 m!1143871))

(assert (=> d!136299 m!1143821))

(declare-fun m!1143873 () Bool)

(assert (=> d!136299 m!1143873))

(declare-fun m!1143875 () Bool)

(assert (=> b!1241157 m!1143875))

(assert (=> b!1241157 m!1143875))

(declare-fun m!1143877 () Bool)

(assert (=> b!1241157 m!1143877))

(declare-fun m!1143879 () Bool)

(assert (=> b!1241158 m!1143879))

(assert (=> b!1241087 d!136299))

(declare-fun bm!61198 () Bool)

(declare-fun c!121394 () Bool)

(declare-fun e!703544 () List!27405)

(declare-fun call!61202 () List!27405)

(assert (=> bm!61198 (= call!61202 ($colon$colon!619 e!703544 (ite c!121394 (h!28610 (removeStrictlySorted!124 (t!40859 l!644) key2!15)) (tuple2!20313 key1!25 v1!20))))))

(declare-fun c!121392 () Bool)

(assert (=> bm!61198 (= c!121392 c!121394)))

(declare-fun bm!61199 () Bool)

(declare-fun call!61203 () List!27405)

(assert (=> bm!61199 (= call!61203 call!61202)))

(declare-fun bm!61200 () Bool)

(declare-fun call!61201 () List!27405)

(assert (=> bm!61200 (= call!61201 call!61203)))

(declare-fun b!1241235 () Bool)

(declare-fun c!121391 () Bool)

(assert (=> b!1241235 (= c!121391 (and ((_ is Cons!27401) (removeStrictlySorted!124 (t!40859 l!644) key2!15)) (bvsgt (_1!10167 (h!28610 (removeStrictlySorted!124 (t!40859 l!644) key2!15))) key1!25)))))

(declare-fun e!703543 () List!27405)

(declare-fun e!703542 () List!27405)

(assert (=> b!1241235 (= e!703543 e!703542)))

(declare-fun b!1241236 () Bool)

(assert (=> b!1241236 (= e!703542 call!61201)))

(declare-fun b!1241237 () Bool)

(declare-fun e!703540 () List!27405)

(assert (=> b!1241237 (= e!703540 call!61202)))

(declare-fun b!1241238 () Bool)

(assert (=> b!1241238 (= e!703542 call!61201)))

(declare-fun b!1241239 () Bool)

(declare-fun res!828044 () Bool)

(declare-fun e!703541 () Bool)

(assert (=> b!1241239 (=> (not res!828044) (not e!703541))))

(declare-fun lt!561943 () List!27405)

(assert (=> b!1241239 (= res!828044 (containsKey!603 lt!561943 key1!25))))

(declare-fun b!1241241 () Bool)

(assert (=> b!1241241 (= e!703544 (insertStrictlySorted!432 (t!40859 (removeStrictlySorted!124 (t!40859 l!644) key2!15)) key1!25 v1!20))))

(declare-fun b!1241242 () Bool)

(declare-fun contains!7359 (List!27405 tuple2!20312) Bool)

(assert (=> b!1241242 (= e!703541 (contains!7359 lt!561943 (tuple2!20313 key1!25 v1!20)))))

(declare-fun b!1241240 () Bool)

(assert (=> b!1241240 (= e!703543 call!61203)))

(declare-fun d!136309 () Bool)

(assert (=> d!136309 e!703541))

(declare-fun res!828045 () Bool)

(assert (=> d!136309 (=> (not res!828045) (not e!703541))))

(assert (=> d!136309 (= res!828045 (isStrictlySorted!741 lt!561943))))

(assert (=> d!136309 (= lt!561943 e!703540)))

(assert (=> d!136309 (= c!121394 (and ((_ is Cons!27401) (removeStrictlySorted!124 (t!40859 l!644) key2!15)) (bvslt (_1!10167 (h!28610 (removeStrictlySorted!124 (t!40859 l!644) key2!15))) key1!25)))))

(assert (=> d!136309 (isStrictlySorted!741 (removeStrictlySorted!124 (t!40859 l!644) key2!15))))

(assert (=> d!136309 (= (insertStrictlySorted!432 (removeStrictlySorted!124 (t!40859 l!644) key2!15) key1!25 v1!20) lt!561943)))

(declare-fun b!1241243 () Bool)

(assert (=> b!1241243 (= e!703540 e!703543)))

(declare-fun c!121393 () Bool)

(assert (=> b!1241243 (= c!121393 (and ((_ is Cons!27401) (removeStrictlySorted!124 (t!40859 l!644) key2!15)) (= (_1!10167 (h!28610 (removeStrictlySorted!124 (t!40859 l!644) key2!15))) key1!25)))))

(declare-fun b!1241244 () Bool)

(assert (=> b!1241244 (= e!703544 (ite c!121393 (t!40859 (removeStrictlySorted!124 (t!40859 l!644) key2!15)) (ite c!121391 (Cons!27401 (h!28610 (removeStrictlySorted!124 (t!40859 l!644) key2!15)) (t!40859 (removeStrictlySorted!124 (t!40859 l!644) key2!15))) Nil!27402)))))

(assert (= (and d!136309 c!121394) b!1241237))

(assert (= (and d!136309 (not c!121394)) b!1241243))

(assert (= (and b!1241243 c!121393) b!1241240))

(assert (= (and b!1241243 (not c!121393)) b!1241235))

(assert (= (and b!1241235 c!121391) b!1241238))

(assert (= (and b!1241235 (not c!121391)) b!1241236))

(assert (= (or b!1241238 b!1241236) bm!61200))

(assert (= (or b!1241240 bm!61200) bm!61199))

(assert (= (or b!1241237 bm!61199) bm!61198))

(assert (= (and bm!61198 c!121392) b!1241241))

(assert (= (and bm!61198 (not c!121392)) b!1241244))

(assert (= (and d!136309 res!828045) b!1241239))

(assert (= (and b!1241239 res!828044) b!1241242))

(declare-fun m!1143901 () Bool)

(assert (=> b!1241239 m!1143901))

(declare-fun m!1143903 () Bool)

(assert (=> d!136309 m!1143903))

(assert (=> d!136309 m!1143825))

(declare-fun m!1143905 () Bool)

(assert (=> d!136309 m!1143905))

(declare-fun m!1143907 () Bool)

(assert (=> b!1241242 m!1143907))

(declare-fun m!1143909 () Bool)

(assert (=> b!1241241 m!1143909))

(declare-fun m!1143911 () Bool)

(assert (=> bm!61198 m!1143911))

(assert (=> b!1241087 d!136309))

(declare-fun d!136315 () Bool)

(declare-fun res!828060 () Bool)

(declare-fun e!703563 () Bool)

(assert (=> d!136315 (=> res!828060 e!703563)))

(assert (=> d!136315 (= res!828060 (or ((_ is Nil!27402) (insertStrictlySorted!432 l!644 key1!25 v1!20)) ((_ is Nil!27402) (t!40859 (insertStrictlySorted!432 l!644 key1!25 v1!20)))))))

(assert (=> d!136315 (= (isStrictlySorted!741 (insertStrictlySorted!432 l!644 key1!25 v1!20)) e!703563)))

(declare-fun b!1241275 () Bool)

(declare-fun e!703564 () Bool)

(assert (=> b!1241275 (= e!703563 e!703564)))

(declare-fun res!828061 () Bool)

(assert (=> b!1241275 (=> (not res!828061) (not e!703564))))

(assert (=> b!1241275 (= res!828061 (bvslt (_1!10167 (h!28610 (insertStrictlySorted!432 l!644 key1!25 v1!20))) (_1!10167 (h!28610 (t!40859 (insertStrictlySorted!432 l!644 key1!25 v1!20))))))))

(declare-fun b!1241276 () Bool)

(assert (=> b!1241276 (= e!703564 (isStrictlySorted!741 (t!40859 (insertStrictlySorted!432 l!644 key1!25 v1!20))))))

(assert (= (and d!136315 (not res!828060)) b!1241275))

(assert (= (and b!1241275 res!828061) b!1241276))

(declare-fun m!1143935 () Bool)

(assert (=> b!1241276 m!1143935))

(assert (=> b!1241087 d!136315))

(declare-fun bm!61210 () Bool)

(declare-fun e!703574 () List!27405)

(declare-fun c!121410 () Bool)

(declare-fun call!61214 () List!27405)

(assert (=> bm!61210 (= call!61214 ($colon$colon!619 e!703574 (ite c!121410 (h!28610 l!644) (tuple2!20313 key1!25 v1!20))))))

(declare-fun c!121408 () Bool)

(assert (=> bm!61210 (= c!121408 c!121410)))

(declare-fun bm!61211 () Bool)

(declare-fun call!61215 () List!27405)

(assert (=> bm!61211 (= call!61215 call!61214)))

(declare-fun bm!61212 () Bool)

(declare-fun call!61213 () List!27405)

(assert (=> bm!61212 (= call!61213 call!61215)))

(declare-fun b!1241287 () Bool)

(declare-fun c!121407 () Bool)

(assert (=> b!1241287 (= c!121407 (and ((_ is Cons!27401) l!644) (bvsgt (_1!10167 (h!28610 l!644)) key1!25)))))

(declare-fun e!703573 () List!27405)

(declare-fun e!703572 () List!27405)

(assert (=> b!1241287 (= e!703573 e!703572)))

(declare-fun b!1241288 () Bool)

(assert (=> b!1241288 (= e!703572 call!61213)))

(declare-fun b!1241289 () Bool)

(declare-fun e!703570 () List!27405)

(assert (=> b!1241289 (= e!703570 call!61214)))

(declare-fun b!1241290 () Bool)

(assert (=> b!1241290 (= e!703572 call!61213)))

(declare-fun b!1241291 () Bool)

(declare-fun res!828064 () Bool)

(declare-fun e!703571 () Bool)

(assert (=> b!1241291 (=> (not res!828064) (not e!703571))))

(declare-fun lt!561947 () List!27405)

(assert (=> b!1241291 (= res!828064 (containsKey!603 lt!561947 key1!25))))

(declare-fun b!1241293 () Bool)

(assert (=> b!1241293 (= e!703574 (insertStrictlySorted!432 (t!40859 l!644) key1!25 v1!20))))

(declare-fun b!1241294 () Bool)

(assert (=> b!1241294 (= e!703571 (contains!7359 lt!561947 (tuple2!20313 key1!25 v1!20)))))

(declare-fun b!1241292 () Bool)

(assert (=> b!1241292 (= e!703573 call!61215)))

(declare-fun d!136323 () Bool)

(assert (=> d!136323 e!703571))

(declare-fun res!828065 () Bool)

(assert (=> d!136323 (=> (not res!828065) (not e!703571))))

(assert (=> d!136323 (= res!828065 (isStrictlySorted!741 lt!561947))))

(assert (=> d!136323 (= lt!561947 e!703570)))

(assert (=> d!136323 (= c!121410 (and ((_ is Cons!27401) l!644) (bvslt (_1!10167 (h!28610 l!644)) key1!25)))))

(assert (=> d!136323 (isStrictlySorted!741 l!644)))

(assert (=> d!136323 (= (insertStrictlySorted!432 l!644 key1!25 v1!20) lt!561947)))

(declare-fun b!1241295 () Bool)

(assert (=> b!1241295 (= e!703570 e!703573)))

(declare-fun c!121409 () Bool)

(assert (=> b!1241295 (= c!121409 (and ((_ is Cons!27401) l!644) (= (_1!10167 (h!28610 l!644)) key1!25)))))

(declare-fun b!1241296 () Bool)

(assert (=> b!1241296 (= e!703574 (ite c!121409 (t!40859 l!644) (ite c!121407 (Cons!27401 (h!28610 l!644) (t!40859 l!644)) Nil!27402)))))

(assert (= (and d!136323 c!121410) b!1241289))

(assert (= (and d!136323 (not c!121410)) b!1241295))

(assert (= (and b!1241295 c!121409) b!1241292))

(assert (= (and b!1241295 (not c!121409)) b!1241287))

(assert (= (and b!1241287 c!121407) b!1241290))

(assert (= (and b!1241287 (not c!121407)) b!1241288))

(assert (= (or b!1241290 b!1241288) bm!61212))

(assert (= (or b!1241292 bm!61212) bm!61211))

(assert (= (or b!1241289 bm!61211) bm!61210))

(assert (= (and bm!61210 c!121408) b!1241293))

(assert (= (and bm!61210 (not c!121408)) b!1241296))

(assert (= (and d!136323 res!828065) b!1241291))

(assert (= (and b!1241291 res!828064) b!1241294))

(declare-fun m!1143947 () Bool)

(assert (=> b!1241291 m!1143947))

(declare-fun m!1143951 () Bool)

(assert (=> d!136323 m!1143951))

(assert (=> d!136323 m!1143813))

(declare-fun m!1143953 () Bool)

(assert (=> b!1241294 m!1143953))

(assert (=> b!1241293 m!1143821))

(declare-fun m!1143955 () Bool)

(assert (=> bm!61210 m!1143955))

(assert (=> b!1241087 d!136323))

(declare-fun d!136327 () Bool)

(assert (=> d!136327 (= (insertStrictlySorted!432 (removeStrictlySorted!124 (t!40859 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!124 (insertStrictlySorted!432 (t!40859 l!644) key1!25 v1!20) key2!15))))

(declare-fun lt!561955 () Unit!41100)

(declare-fun choose!1848 (List!27405 (_ BitVec 64) B!1832 (_ BitVec 64)) Unit!41100)

(assert (=> d!136327 (= lt!561955 (choose!1848 (t!40859 l!644) key1!25 v1!20 key2!15))))

(assert (=> d!136327 (not (= key1!25 key2!15))))

(assert (=> d!136327 (= (lemmaInsertAndRemoveStrictlySortedCommutative!13 (t!40859 l!644) key1!25 v1!20 key2!15) lt!561955)))

(declare-fun bs!34919 () Bool)

(assert (= bs!34919 d!136327))

(declare-fun m!1143975 () Bool)

(assert (=> bs!34919 m!1143975))

(assert (=> bs!34919 m!1143821))

(assert (=> bs!34919 m!1143823))

(assert (=> bs!34919 m!1143825))

(assert (=> bs!34919 m!1143827))

(assert (=> bs!34919 m!1143821))

(assert (=> bs!34919 m!1143825))

(assert (=> b!1241087 d!136327))

(declare-fun bm!61219 () Bool)

(declare-fun e!703594 () List!27405)

(declare-fun c!121424 () Bool)

(declare-fun call!61223 () List!27405)

(assert (=> bm!61219 (= call!61223 ($colon$colon!619 e!703594 (ite c!121424 (h!28610 (t!40859 l!644)) (tuple2!20313 key1!25 v1!20))))))

(declare-fun c!121422 () Bool)

(assert (=> bm!61219 (= c!121422 c!121424)))

(declare-fun bm!61220 () Bool)

(declare-fun call!61224 () List!27405)

(assert (=> bm!61220 (= call!61224 call!61223)))

(declare-fun bm!61221 () Bool)

(declare-fun call!61222 () List!27405)

(assert (=> bm!61221 (= call!61222 call!61224)))

(declare-fun b!1241324 () Bool)

(declare-fun c!121421 () Bool)

(assert (=> b!1241324 (= c!121421 (and ((_ is Cons!27401) (t!40859 l!644)) (bvsgt (_1!10167 (h!28610 (t!40859 l!644))) key1!25)))))

(declare-fun e!703593 () List!27405)

(declare-fun e!703592 () List!27405)

(assert (=> b!1241324 (= e!703593 e!703592)))

(declare-fun b!1241325 () Bool)

(assert (=> b!1241325 (= e!703592 call!61222)))

(declare-fun b!1241326 () Bool)

(declare-fun e!703590 () List!27405)

(assert (=> b!1241326 (= e!703590 call!61223)))

(declare-fun b!1241327 () Bool)

(assert (=> b!1241327 (= e!703592 call!61222)))

(declare-fun b!1241328 () Bool)

(declare-fun res!828073 () Bool)

(declare-fun e!703591 () Bool)

(assert (=> b!1241328 (=> (not res!828073) (not e!703591))))

(declare-fun lt!561957 () List!27405)

(assert (=> b!1241328 (= res!828073 (containsKey!603 lt!561957 key1!25))))

(declare-fun b!1241330 () Bool)

(assert (=> b!1241330 (= e!703594 (insertStrictlySorted!432 (t!40859 (t!40859 l!644)) key1!25 v1!20))))

(declare-fun b!1241331 () Bool)

(assert (=> b!1241331 (= e!703591 (contains!7359 lt!561957 (tuple2!20313 key1!25 v1!20)))))

(declare-fun b!1241329 () Bool)

(assert (=> b!1241329 (= e!703593 call!61224)))

(declare-fun d!136337 () Bool)

(assert (=> d!136337 e!703591))

(declare-fun res!828074 () Bool)

(assert (=> d!136337 (=> (not res!828074) (not e!703591))))

(assert (=> d!136337 (= res!828074 (isStrictlySorted!741 lt!561957))))

(assert (=> d!136337 (= lt!561957 e!703590)))

(assert (=> d!136337 (= c!121424 (and ((_ is Cons!27401) (t!40859 l!644)) (bvslt (_1!10167 (h!28610 (t!40859 l!644))) key1!25)))))

(assert (=> d!136337 (isStrictlySorted!741 (t!40859 l!644))))

(assert (=> d!136337 (= (insertStrictlySorted!432 (t!40859 l!644) key1!25 v1!20) lt!561957)))

(declare-fun b!1241332 () Bool)

(assert (=> b!1241332 (= e!703590 e!703593)))

(declare-fun c!121423 () Bool)

(assert (=> b!1241332 (= c!121423 (and ((_ is Cons!27401) (t!40859 l!644)) (= (_1!10167 (h!28610 (t!40859 l!644))) key1!25)))))

(declare-fun b!1241333 () Bool)

(assert (=> b!1241333 (= e!703594 (ite c!121423 (t!40859 (t!40859 l!644)) (ite c!121421 (Cons!27401 (h!28610 (t!40859 l!644)) (t!40859 (t!40859 l!644))) Nil!27402)))))

(assert (= (and d!136337 c!121424) b!1241326))

(assert (= (and d!136337 (not c!121424)) b!1241332))

(assert (= (and b!1241332 c!121423) b!1241329))

(assert (= (and b!1241332 (not c!121423)) b!1241324))

(assert (= (and b!1241324 c!121421) b!1241327))

(assert (= (and b!1241324 (not c!121421)) b!1241325))

(assert (= (or b!1241327 b!1241325) bm!61221))

(assert (= (or b!1241329 bm!61221) bm!61220))

(assert (= (or b!1241326 bm!61220) bm!61219))

(assert (= (and bm!61219 c!121422) b!1241330))

(assert (= (and bm!61219 (not c!121422)) b!1241333))

(assert (= (and d!136337 res!828074) b!1241328))

(assert (= (and b!1241328 res!828073) b!1241331))

(declare-fun m!1143989 () Bool)

(assert (=> b!1241328 m!1143989))

(declare-fun m!1143991 () Bool)

(assert (=> d!136337 m!1143991))

(assert (=> d!136337 m!1143815))

(declare-fun m!1143993 () Bool)

(assert (=> b!1241331 m!1143993))

(declare-fun m!1143995 () Bool)

(assert (=> b!1241330 m!1143995))

(declare-fun m!1143997 () Bool)

(assert (=> bm!61219 m!1143997))

(assert (=> b!1241087 d!136337))

(declare-fun b!1241339 () Bool)

(declare-fun e!703600 () List!27405)

(declare-fun e!703598 () List!27405)

(assert (=> b!1241339 (= e!703600 e!703598)))

(declare-fun c!121425 () Bool)

(assert (=> b!1241339 (= c!121425 (and ((_ is Cons!27401) (t!40859 l!644)) (not (= (_1!10167 (h!28610 (t!40859 l!644))) key2!15))))))

(declare-fun b!1241340 () Bool)

(assert (=> b!1241340 (= e!703598 Nil!27402)))

(declare-fun d!136339 () Bool)

(declare-fun e!703599 () Bool)

(assert (=> d!136339 e!703599))

(declare-fun res!828075 () Bool)

(assert (=> d!136339 (=> (not res!828075) (not e!703599))))

(declare-fun lt!561961 () List!27405)

(assert (=> d!136339 (= res!828075 (isStrictlySorted!741 lt!561961))))

(assert (=> d!136339 (= lt!561961 e!703600)))

(declare-fun c!121426 () Bool)

(assert (=> d!136339 (= c!121426 (and ((_ is Cons!27401) (t!40859 l!644)) (= (_1!10167 (h!28610 (t!40859 l!644))) key2!15)))))

(assert (=> d!136339 (isStrictlySorted!741 (t!40859 l!644))))

(assert (=> d!136339 (= (removeStrictlySorted!124 (t!40859 l!644) key2!15) lt!561961)))

(declare-fun b!1241341 () Bool)

(assert (=> b!1241341 (= e!703600 (t!40859 (t!40859 l!644)))))

(declare-fun b!1241342 () Bool)

(assert (=> b!1241342 (= e!703598 ($colon$colon!619 (removeStrictlySorted!124 (t!40859 (t!40859 l!644)) key2!15) (h!28610 (t!40859 l!644))))))

(declare-fun b!1241343 () Bool)

(assert (=> b!1241343 (= e!703599 (not (containsKey!603 lt!561961 key2!15)))))

(assert (= (and d!136339 c!121426) b!1241341))

(assert (= (and d!136339 (not c!121426)) b!1241339))

(assert (= (and b!1241339 c!121425) b!1241342))

(assert (= (and b!1241339 (not c!121425)) b!1241340))

(assert (= (and d!136339 res!828075) b!1241343))

(declare-fun m!1144001 () Bool)

(assert (=> d!136339 m!1144001))

(assert (=> d!136339 m!1143815))

(declare-fun m!1144003 () Bool)

(assert (=> b!1241342 m!1144003))

(assert (=> b!1241342 m!1144003))

(declare-fun m!1144005 () Bool)

(assert (=> b!1241342 m!1144005))

(declare-fun m!1144007 () Bool)

(assert (=> b!1241343 m!1144007))

(assert (=> b!1241087 d!136339))

(declare-fun d!136343 () Bool)

(declare-fun res!828078 () Bool)

(declare-fun e!703606 () Bool)

(assert (=> d!136343 (=> res!828078 e!703606)))

(assert (=> d!136343 (= res!828078 (or ((_ is Nil!27402) (t!40859 l!644)) ((_ is Nil!27402) (t!40859 (t!40859 l!644)))))))

(assert (=> d!136343 (= (isStrictlySorted!741 (t!40859 l!644)) e!703606)))

(declare-fun b!1241354 () Bool)

(declare-fun e!703607 () Bool)

(assert (=> b!1241354 (= e!703606 e!703607)))

(declare-fun res!828079 () Bool)

(assert (=> b!1241354 (=> (not res!828079) (not e!703607))))

(assert (=> b!1241354 (= res!828079 (bvslt (_1!10167 (h!28610 (t!40859 l!644))) (_1!10167 (h!28610 (t!40859 (t!40859 l!644))))))))

(declare-fun b!1241355 () Bool)

(assert (=> b!1241355 (= e!703607 (isStrictlySorted!741 (t!40859 (t!40859 l!644))))))

(assert (= (and d!136343 (not res!828078)) b!1241354))

(assert (= (and b!1241354 res!828079) b!1241355))

(declare-fun m!1144009 () Bool)

(assert (=> b!1241355 m!1144009))

(assert (=> b!1241086 d!136343))

(declare-fun d!136345 () Bool)

(declare-fun res!828080 () Bool)

(declare-fun e!703608 () Bool)

(assert (=> d!136345 (=> res!828080 e!703608)))

(assert (=> d!136345 (= res!828080 (or ((_ is Nil!27402) l!644) ((_ is Nil!27402) (t!40859 l!644))))))

(assert (=> d!136345 (= (isStrictlySorted!741 l!644) e!703608)))

(declare-fun b!1241356 () Bool)

(declare-fun e!703609 () Bool)

(assert (=> b!1241356 (= e!703608 e!703609)))

(declare-fun res!828081 () Bool)

(assert (=> b!1241356 (=> (not res!828081) (not e!703609))))

(assert (=> b!1241356 (= res!828081 (bvslt (_1!10167 (h!28610 l!644)) (_1!10167 (h!28610 (t!40859 l!644)))))))

(declare-fun b!1241357 () Bool)

(assert (=> b!1241357 (= e!703609 (isStrictlySorted!741 (t!40859 l!644)))))

(assert (= (and d!136345 (not res!828080)) b!1241356))

(assert (= (and b!1241356 res!828081) b!1241357))

(assert (=> b!1241357 m!1143815))

(assert (=> b!1241085 d!136345))

(declare-fun b!1241369 () Bool)

(declare-fun e!703617 () Bool)

(declare-fun tp!92621 () Bool)

(assert (=> b!1241369 (= e!703617 (and tp_is_empty!31231 tp!92621))))

(assert (=> b!1241089 (= tp!92609 e!703617)))

(assert (= (and b!1241089 ((_ is Cons!27401) (t!40859 l!644))) b!1241369))

(check-sat (not b!1241331) (not bm!61198) (not d!136309) (not b!1241276) (not d!136339) (not b!1241241) (not b!1241342) (not b!1241328) (not b!1241343) (not b!1241330) (not d!136327) (not b!1241158) (not b!1241157) (not b!1241239) (not b!1241291) (not b!1241369) (not bm!61210) (not d!136323) (not b!1241242) (not d!136299) (not b!1241355) tp_is_empty!31231 (not bm!61219) (not b!1241293) (not b!1241357) (not d!136337) (not b!1241294))
(check-sat)
