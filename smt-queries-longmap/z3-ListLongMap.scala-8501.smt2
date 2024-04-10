; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103616 () Bool)

(assert start!103616)

(declare-fun b!1241188 () Bool)

(declare-fun res!828043 () Bool)

(declare-fun e!703515 () Bool)

(assert (=> b!1241188 (=> (not res!828043) (not e!703515))))

(declare-datatypes ((B!1834 0))(
  ( (B!1835 (val!15679 Int)) )
))
(declare-datatypes ((tuple2!20230 0))(
  ( (tuple2!20231 (_1!10126 (_ BitVec 64)) (_2!10126 B!1834)) )
))
(declare-datatypes ((List!27344 0))(
  ( (Nil!27341) (Cons!27340 (h!28549 tuple2!20230) (t!40807 List!27344)) )
))
(declare-fun l!644 () List!27344)

(declare-fun isStrictlySorted!746 (List!27344) Bool)

(assert (=> b!1241188 (= res!828043 (isStrictlySorted!746 (t!40807 l!644)))))

(declare-fun res!828045 () Bool)

(assert (=> start!103616 (=> (not res!828045) (not e!703515))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103616 (= res!828045 (not (= key1!25 key2!15)))))

(assert (=> start!103616 e!703515))

(assert (=> start!103616 true))

(declare-fun e!703514 () Bool)

(assert (=> start!103616 e!703514))

(declare-fun tp_is_empty!31233 () Bool)

(assert (=> start!103616 tp_is_empty!31233))

(declare-fun b!1241189 () Bool)

(declare-fun res!828044 () Bool)

(assert (=> b!1241189 (=> (not res!828044) (not e!703515))))

(assert (=> b!1241189 (= res!828044 (isStrictlySorted!746 l!644))))

(declare-fun b!1241190 () Bool)

(declare-fun tp!92612 () Bool)

(assert (=> b!1241190 (= e!703514 (and tp_is_empty!31233 tp!92612))))

(declare-fun b!1241191 () Bool)

(declare-fun res!828046 () Bool)

(assert (=> b!1241191 (=> (not res!828046) (not e!703515))))

(get-info :version)

(assert (=> b!1241191 (= res!828046 ((_ is Cons!27340) l!644))))

(declare-fun v1!20 () B!1834)

(declare-fun b!1241192 () Bool)

(declare-fun insertStrictlySorted!432 (List!27344 (_ BitVec 64) B!1834) List!27344)

(assert (=> b!1241192 (= e!703515 (not (isStrictlySorted!746 (insertStrictlySorted!432 l!644 key1!25 v1!20))))))

(declare-fun removeStrictlySorted!125 (List!27344 (_ BitVec 64)) List!27344)

(assert (=> b!1241192 (= (insertStrictlySorted!432 (removeStrictlySorted!125 (t!40807 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!125 (insertStrictlySorted!432 (t!40807 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41257 0))(
  ( (Unit!41258) )
))
(declare-fun lt!562103 () Unit!41257)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!14 (List!27344 (_ BitVec 64) B!1834 (_ BitVec 64)) Unit!41257)

(assert (=> b!1241192 (= lt!562103 (lemmaInsertAndRemoveStrictlySortedCommutative!14 (t!40807 l!644) key1!25 v1!20 key2!15))))

(assert (= (and start!103616 res!828045) b!1241189))

(assert (= (and b!1241189 res!828044) b!1241191))

(assert (= (and b!1241191 res!828046) b!1241188))

(assert (= (and b!1241188 res!828043) b!1241192))

(assert (= (and start!103616 ((_ is Cons!27340) l!644)) b!1241190))

(declare-fun m!1144363 () Bool)

(assert (=> b!1241188 m!1144363))

(declare-fun m!1144365 () Bool)

(assert (=> b!1241189 m!1144365))

(declare-fun m!1144367 () Bool)

(assert (=> b!1241192 m!1144367))

(declare-fun m!1144369 () Bool)

(assert (=> b!1241192 m!1144369))

(assert (=> b!1241192 m!1144367))

(declare-fun m!1144371 () Bool)

(assert (=> b!1241192 m!1144371))

(declare-fun m!1144373 () Bool)

(assert (=> b!1241192 m!1144373))

(assert (=> b!1241192 m!1144371))

(declare-fun m!1144375 () Bool)

(assert (=> b!1241192 m!1144375))

(declare-fun m!1144377 () Bool)

(assert (=> b!1241192 m!1144377))

(assert (=> b!1241192 m!1144375))

(declare-fun m!1144379 () Bool)

(assert (=> b!1241192 m!1144379))

(check-sat (not b!1241190) (not b!1241192) (not b!1241188) (not b!1241189) tp_is_empty!31233)
(check-sat)
(get-model)

(declare-fun d!136437 () Bool)

(declare-fun res!828075 () Bool)

(declare-fun e!703538 () Bool)

(assert (=> d!136437 (=> res!828075 e!703538)))

(assert (=> d!136437 (= res!828075 (or ((_ is Nil!27341) (t!40807 l!644)) ((_ is Nil!27341) (t!40807 (t!40807 l!644)))))))

(assert (=> d!136437 (= (isStrictlySorted!746 (t!40807 l!644)) e!703538)))

(declare-fun b!1241224 () Bool)

(declare-fun e!703539 () Bool)

(assert (=> b!1241224 (= e!703538 e!703539)))

(declare-fun res!828076 () Bool)

(assert (=> b!1241224 (=> (not res!828076) (not e!703539))))

(assert (=> b!1241224 (= res!828076 (bvslt (_1!10126 (h!28549 (t!40807 l!644))) (_1!10126 (h!28549 (t!40807 (t!40807 l!644))))))))

(declare-fun b!1241225 () Bool)

(assert (=> b!1241225 (= e!703539 (isStrictlySorted!746 (t!40807 (t!40807 l!644))))))

(assert (= (and d!136437 (not res!828075)) b!1241224))

(assert (= (and b!1241224 res!828076) b!1241225))

(declare-fun m!1144403 () Bool)

(assert (=> b!1241225 m!1144403))

(assert (=> b!1241188 d!136437))

(declare-fun b!1241266 () Bool)

(declare-fun e!703564 () Bool)

(declare-fun lt!562115 () List!27344)

(declare-fun containsKey!603 (List!27344 (_ BitVec 64)) Bool)

(assert (=> b!1241266 (= e!703564 (not (containsKey!603 lt!562115 key2!15)))))

(declare-fun b!1241267 () Bool)

(declare-fun e!703566 () List!27344)

(assert (=> b!1241267 (= e!703566 Nil!27341)))

(declare-fun b!1241268 () Bool)

(declare-fun e!703565 () List!27344)

(assert (=> b!1241268 (= e!703565 (t!40807 (insertStrictlySorted!432 (t!40807 l!644) key1!25 v1!20)))))

(declare-fun d!136443 () Bool)

(assert (=> d!136443 e!703564))

(declare-fun res!828085 () Bool)

(assert (=> d!136443 (=> (not res!828085) (not e!703564))))

(assert (=> d!136443 (= res!828085 (isStrictlySorted!746 lt!562115))))

(assert (=> d!136443 (= lt!562115 e!703565)))

(declare-fun c!121383 () Bool)

(assert (=> d!136443 (= c!121383 (and ((_ is Cons!27340) (insertStrictlySorted!432 (t!40807 l!644) key1!25 v1!20)) (= (_1!10126 (h!28549 (insertStrictlySorted!432 (t!40807 l!644) key1!25 v1!20))) key2!15)))))

(assert (=> d!136443 (isStrictlySorted!746 (insertStrictlySorted!432 (t!40807 l!644) key1!25 v1!20))))

(assert (=> d!136443 (= (removeStrictlySorted!125 (insertStrictlySorted!432 (t!40807 l!644) key1!25 v1!20) key2!15) lt!562115)))

(declare-fun b!1241269 () Bool)

(assert (=> b!1241269 (= e!703565 e!703566)))

(declare-fun c!121384 () Bool)

(assert (=> b!1241269 (= c!121384 (and ((_ is Cons!27340) (insertStrictlySorted!432 (t!40807 l!644) key1!25 v1!20)) (not (= (_1!10126 (h!28549 (insertStrictlySorted!432 (t!40807 l!644) key1!25 v1!20))) key2!15))))))

(declare-fun b!1241270 () Bool)

(declare-fun $colon$colon!618 (List!27344 tuple2!20230) List!27344)

(assert (=> b!1241270 (= e!703566 ($colon$colon!618 (removeStrictlySorted!125 (t!40807 (insertStrictlySorted!432 (t!40807 l!644) key1!25 v1!20)) key2!15) (h!28549 (insertStrictlySorted!432 (t!40807 l!644) key1!25 v1!20))))))

(assert (= (and d!136443 c!121383) b!1241268))

(assert (= (and d!136443 (not c!121383)) b!1241269))

(assert (= (and b!1241269 c!121384) b!1241270))

(assert (= (and b!1241269 (not c!121384)) b!1241267))

(assert (= (and d!136443 res!828085) b!1241266))

(declare-fun m!1144425 () Bool)

(assert (=> b!1241266 m!1144425))

(declare-fun m!1144427 () Bool)

(assert (=> d!136443 m!1144427))

(assert (=> d!136443 m!1144371))

(declare-fun m!1144429 () Bool)

(assert (=> d!136443 m!1144429))

(declare-fun m!1144431 () Bool)

(assert (=> b!1241270 m!1144431))

(assert (=> b!1241270 m!1144431))

(declare-fun m!1144433 () Bool)

(assert (=> b!1241270 m!1144433))

(assert (=> b!1241192 d!136443))

(declare-fun b!1241353 () Bool)

(declare-fun e!703613 () List!27344)

(assert (=> b!1241353 (= e!703613 (insertStrictlySorted!432 (t!40807 (removeStrictlySorted!125 (t!40807 l!644) key2!15)) key1!25 v1!20))))

(declare-fun b!1241354 () Bool)

(declare-fun res!828105 () Bool)

(declare-fun e!703612 () Bool)

(assert (=> b!1241354 (=> (not res!828105) (not e!703612))))

(declare-fun lt!562124 () List!27344)

(assert (=> b!1241354 (= res!828105 (containsKey!603 lt!562124 key1!25))))

(declare-fun bm!61223 () Bool)

(declare-fun call!61227 () List!27344)

(declare-fun call!61228 () List!27344)

(assert (=> bm!61223 (= call!61227 call!61228)))

(declare-fun d!136449 () Bool)

(assert (=> d!136449 e!703612))

(declare-fun res!828104 () Bool)

(assert (=> d!136449 (=> (not res!828104) (not e!703612))))

(assert (=> d!136449 (= res!828104 (isStrictlySorted!746 lt!562124))))

(declare-fun e!703609 () List!27344)

(assert (=> d!136449 (= lt!562124 e!703609)))

(declare-fun c!121418 () Bool)

(assert (=> d!136449 (= c!121418 (and ((_ is Cons!27340) (removeStrictlySorted!125 (t!40807 l!644) key2!15)) (bvslt (_1!10126 (h!28549 (removeStrictlySorted!125 (t!40807 l!644) key2!15))) key1!25)))))

(assert (=> d!136449 (isStrictlySorted!746 (removeStrictlySorted!125 (t!40807 l!644) key2!15))))

(assert (=> d!136449 (= (insertStrictlySorted!432 (removeStrictlySorted!125 (t!40807 l!644) key2!15) key1!25 v1!20) lt!562124)))

(declare-fun b!1241355 () Bool)

(declare-fun e!703611 () List!27344)

(assert (=> b!1241355 (= e!703611 call!61228)))

(declare-fun bm!61224 () Bool)

(declare-fun call!61226 () List!27344)

(assert (=> bm!61224 (= call!61226 ($colon$colon!618 e!703613 (ite c!121418 (h!28549 (removeStrictlySorted!125 (t!40807 l!644) key2!15)) (tuple2!20231 key1!25 v1!20))))))

(declare-fun c!121419 () Bool)

(assert (=> bm!61224 (= c!121419 c!121418)))

(declare-fun b!1241356 () Bool)

(declare-fun e!703610 () List!27344)

(assert (=> b!1241356 (= e!703610 call!61227)))

(declare-fun b!1241357 () Bool)

(assert (=> b!1241357 (= e!703609 call!61226)))

(declare-fun b!1241358 () Bool)

(declare-fun c!121417 () Bool)

(assert (=> b!1241358 (= c!121417 (and ((_ is Cons!27340) (removeStrictlySorted!125 (t!40807 l!644) key2!15)) (bvsgt (_1!10126 (h!28549 (removeStrictlySorted!125 (t!40807 l!644) key2!15))) key1!25)))))

(assert (=> b!1241358 (= e!703611 e!703610)))

(declare-fun b!1241359 () Bool)

(assert (=> b!1241359 (= e!703610 call!61227)))

(declare-fun bm!61225 () Bool)

(assert (=> bm!61225 (= call!61228 call!61226)))

(declare-fun b!1241360 () Bool)

(assert (=> b!1241360 (= e!703609 e!703611)))

(declare-fun c!121420 () Bool)

(assert (=> b!1241360 (= c!121420 (and ((_ is Cons!27340) (removeStrictlySorted!125 (t!40807 l!644) key2!15)) (= (_1!10126 (h!28549 (removeStrictlySorted!125 (t!40807 l!644) key2!15))) key1!25)))))

(declare-fun b!1241361 () Bool)

(declare-fun contains!7388 (List!27344 tuple2!20230) Bool)

(assert (=> b!1241361 (= e!703612 (contains!7388 lt!562124 (tuple2!20231 key1!25 v1!20)))))

(declare-fun b!1241362 () Bool)

(assert (=> b!1241362 (= e!703613 (ite c!121420 (t!40807 (removeStrictlySorted!125 (t!40807 l!644) key2!15)) (ite c!121417 (Cons!27340 (h!28549 (removeStrictlySorted!125 (t!40807 l!644) key2!15)) (t!40807 (removeStrictlySorted!125 (t!40807 l!644) key2!15))) Nil!27341)))))

(assert (= (and d!136449 c!121418) b!1241357))

(assert (= (and d!136449 (not c!121418)) b!1241360))

(assert (= (and b!1241360 c!121420) b!1241355))

(assert (= (and b!1241360 (not c!121420)) b!1241358))

(assert (= (and b!1241358 c!121417) b!1241359))

(assert (= (and b!1241358 (not c!121417)) b!1241356))

(assert (= (or b!1241359 b!1241356) bm!61223))

(assert (= (or b!1241355 bm!61223) bm!61225))

(assert (= (or b!1241357 bm!61225) bm!61224))

(assert (= (and bm!61224 c!121419) b!1241353))

(assert (= (and bm!61224 (not c!121419)) b!1241362))

(assert (= (and d!136449 res!828104) b!1241354))

(assert (= (and b!1241354 res!828105) b!1241361))

(declare-fun m!1144463 () Bool)

(assert (=> d!136449 m!1144463))

(assert (=> d!136449 m!1144375))

(declare-fun m!1144466 () Bool)

(assert (=> d!136449 m!1144466))

(declare-fun m!1144471 () Bool)

(assert (=> bm!61224 m!1144471))

(declare-fun m!1144473 () Bool)

(assert (=> b!1241361 m!1144473))

(declare-fun m!1144477 () Bool)

(assert (=> b!1241354 m!1144477))

(declare-fun m!1144481 () Bool)

(assert (=> b!1241353 m!1144481))

(assert (=> b!1241192 d!136449))

(declare-fun d!136461 () Bool)

(declare-fun res!828112 () Bool)

(declare-fun e!703626 () Bool)

(assert (=> d!136461 (=> res!828112 e!703626)))

(assert (=> d!136461 (= res!828112 (or ((_ is Nil!27341) (insertStrictlySorted!432 l!644 key1!25 v1!20)) ((_ is Nil!27341) (t!40807 (insertStrictlySorted!432 l!644 key1!25 v1!20)))))))

(assert (=> d!136461 (= (isStrictlySorted!746 (insertStrictlySorted!432 l!644 key1!25 v1!20)) e!703626)))

(declare-fun b!1241385 () Bool)

(declare-fun e!703627 () Bool)

(assert (=> b!1241385 (= e!703626 e!703627)))

(declare-fun res!828113 () Bool)

(assert (=> b!1241385 (=> (not res!828113) (not e!703627))))

(assert (=> b!1241385 (= res!828113 (bvslt (_1!10126 (h!28549 (insertStrictlySorted!432 l!644 key1!25 v1!20))) (_1!10126 (h!28549 (t!40807 (insertStrictlySorted!432 l!644 key1!25 v1!20))))))))

(declare-fun b!1241386 () Bool)

(assert (=> b!1241386 (= e!703627 (isStrictlySorted!746 (t!40807 (insertStrictlySorted!432 l!644 key1!25 v1!20))))))

(assert (= (and d!136461 (not res!828112)) b!1241385))

(assert (= (and b!1241385 res!828113) b!1241386))

(declare-fun m!1144483 () Bool)

(assert (=> b!1241386 m!1144483))

(assert (=> b!1241192 d!136461))

(declare-fun e!703632 () List!27344)

(declare-fun b!1241387 () Bool)

(assert (=> b!1241387 (= e!703632 (insertStrictlySorted!432 (t!40807 l!644) key1!25 v1!20))))

(declare-fun b!1241388 () Bool)

(declare-fun res!828115 () Bool)

(declare-fun e!703631 () Bool)

(assert (=> b!1241388 (=> (not res!828115) (not e!703631))))

(declare-fun lt!562127 () List!27344)

(assert (=> b!1241388 (= res!828115 (containsKey!603 lt!562127 key1!25))))

(declare-fun bm!61232 () Bool)

(declare-fun call!61236 () List!27344)

(declare-fun call!61237 () List!27344)

(assert (=> bm!61232 (= call!61236 call!61237)))

(declare-fun d!136463 () Bool)

(assert (=> d!136463 e!703631))

(declare-fun res!828114 () Bool)

(assert (=> d!136463 (=> (not res!828114) (not e!703631))))

(assert (=> d!136463 (= res!828114 (isStrictlySorted!746 lt!562127))))

(declare-fun e!703628 () List!27344)

(assert (=> d!136463 (= lt!562127 e!703628)))

(declare-fun c!121430 () Bool)

(assert (=> d!136463 (= c!121430 (and ((_ is Cons!27340) l!644) (bvslt (_1!10126 (h!28549 l!644)) key1!25)))))

(assert (=> d!136463 (isStrictlySorted!746 l!644)))

(assert (=> d!136463 (= (insertStrictlySorted!432 l!644 key1!25 v1!20) lt!562127)))

(declare-fun b!1241389 () Bool)

(declare-fun e!703630 () List!27344)

(assert (=> b!1241389 (= e!703630 call!61237)))

(declare-fun call!61235 () List!27344)

(declare-fun bm!61233 () Bool)

(assert (=> bm!61233 (= call!61235 ($colon$colon!618 e!703632 (ite c!121430 (h!28549 l!644) (tuple2!20231 key1!25 v1!20))))))

(declare-fun c!121431 () Bool)

(assert (=> bm!61233 (= c!121431 c!121430)))

(declare-fun b!1241390 () Bool)

(declare-fun e!703629 () List!27344)

(assert (=> b!1241390 (= e!703629 call!61236)))

(declare-fun b!1241391 () Bool)

(assert (=> b!1241391 (= e!703628 call!61235)))

(declare-fun b!1241392 () Bool)

(declare-fun c!121429 () Bool)

(assert (=> b!1241392 (= c!121429 (and ((_ is Cons!27340) l!644) (bvsgt (_1!10126 (h!28549 l!644)) key1!25)))))

(assert (=> b!1241392 (= e!703630 e!703629)))

(declare-fun b!1241393 () Bool)

(assert (=> b!1241393 (= e!703629 call!61236)))

(declare-fun bm!61234 () Bool)

(assert (=> bm!61234 (= call!61237 call!61235)))

(declare-fun b!1241394 () Bool)

(assert (=> b!1241394 (= e!703628 e!703630)))

(declare-fun c!121432 () Bool)

(assert (=> b!1241394 (= c!121432 (and ((_ is Cons!27340) l!644) (= (_1!10126 (h!28549 l!644)) key1!25)))))

(declare-fun b!1241395 () Bool)

(assert (=> b!1241395 (= e!703631 (contains!7388 lt!562127 (tuple2!20231 key1!25 v1!20)))))

(declare-fun b!1241396 () Bool)

(assert (=> b!1241396 (= e!703632 (ite c!121432 (t!40807 l!644) (ite c!121429 (Cons!27340 (h!28549 l!644) (t!40807 l!644)) Nil!27341)))))

(assert (= (and d!136463 c!121430) b!1241391))

(assert (= (and d!136463 (not c!121430)) b!1241394))

(assert (= (and b!1241394 c!121432) b!1241389))

(assert (= (and b!1241394 (not c!121432)) b!1241392))

(assert (= (and b!1241392 c!121429) b!1241393))

(assert (= (and b!1241392 (not c!121429)) b!1241390))

(assert (= (or b!1241393 b!1241390) bm!61232))

(assert (= (or b!1241389 bm!61232) bm!61234))

(assert (= (or b!1241391 bm!61234) bm!61233))

(assert (= (and bm!61233 c!121431) b!1241387))

(assert (= (and bm!61233 (not c!121431)) b!1241396))

(assert (= (and d!136463 res!828114) b!1241388))

(assert (= (and b!1241388 res!828115) b!1241395))

(declare-fun m!1144493 () Bool)

(assert (=> d!136463 m!1144493))

(assert (=> d!136463 m!1144365))

(declare-fun m!1144495 () Bool)

(assert (=> bm!61233 m!1144495))

(declare-fun m!1144497 () Bool)

(assert (=> b!1241395 m!1144497))

(declare-fun m!1144499 () Bool)

(assert (=> b!1241388 m!1144499))

(assert (=> b!1241387 m!1144371))

(assert (=> b!1241192 d!136463))

(declare-fun d!136467 () Bool)

(assert (=> d!136467 (= (insertStrictlySorted!432 (removeStrictlySorted!125 (t!40807 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!125 (insertStrictlySorted!432 (t!40807 l!644) key1!25 v1!20) key2!15))))

(declare-fun lt!562138 () Unit!41257)

(declare-fun choose!1837 (List!27344 (_ BitVec 64) B!1834 (_ BitVec 64)) Unit!41257)

(assert (=> d!136467 (= lt!562138 (choose!1837 (t!40807 l!644) key1!25 v1!20 key2!15))))

(assert (=> d!136467 (not (= key1!25 key2!15))))

(assert (=> d!136467 (= (lemmaInsertAndRemoveStrictlySortedCommutative!14 (t!40807 l!644) key1!25 v1!20 key2!15) lt!562138)))

(declare-fun bs!34948 () Bool)

(assert (= bs!34948 d!136467))

(assert (=> bs!34948 m!1144375))

(assert (=> bs!34948 m!1144375))

(assert (=> bs!34948 m!1144377))

(assert (=> bs!34948 m!1144371))

(assert (=> bs!34948 m!1144373))

(assert (=> bs!34948 m!1144371))

(declare-fun m!1144515 () Bool)

(assert (=> bs!34948 m!1144515))

(assert (=> b!1241192 d!136467))

(declare-fun b!1241422 () Bool)

(declare-fun e!703650 () List!27344)

(assert (=> b!1241422 (= e!703650 (insertStrictlySorted!432 (t!40807 (t!40807 l!644)) key1!25 v1!20))))

(declare-fun b!1241423 () Bool)

(declare-fun res!828122 () Bool)

(declare-fun e!703649 () Bool)

(assert (=> b!1241423 (=> (not res!828122) (not e!703649))))

(declare-fun lt!562140 () List!27344)

(assert (=> b!1241423 (= res!828122 (containsKey!603 lt!562140 key1!25))))

(declare-fun bm!61241 () Bool)

(declare-fun call!61245 () List!27344)

(declare-fun call!61246 () List!27344)

(assert (=> bm!61241 (= call!61245 call!61246)))

(declare-fun d!136475 () Bool)

(assert (=> d!136475 e!703649))

(declare-fun res!828121 () Bool)

(assert (=> d!136475 (=> (not res!828121) (not e!703649))))

(assert (=> d!136475 (= res!828121 (isStrictlySorted!746 lt!562140))))

(declare-fun e!703646 () List!27344)

(assert (=> d!136475 (= lt!562140 e!703646)))

(declare-fun c!121444 () Bool)

(assert (=> d!136475 (= c!121444 (and ((_ is Cons!27340) (t!40807 l!644)) (bvslt (_1!10126 (h!28549 (t!40807 l!644))) key1!25)))))

(assert (=> d!136475 (isStrictlySorted!746 (t!40807 l!644))))

(assert (=> d!136475 (= (insertStrictlySorted!432 (t!40807 l!644) key1!25 v1!20) lt!562140)))

(declare-fun b!1241424 () Bool)

(declare-fun e!703648 () List!27344)

(assert (=> b!1241424 (= e!703648 call!61246)))

(declare-fun bm!61242 () Bool)

(declare-fun call!61244 () List!27344)

(assert (=> bm!61242 (= call!61244 ($colon$colon!618 e!703650 (ite c!121444 (h!28549 (t!40807 l!644)) (tuple2!20231 key1!25 v1!20))))))

(declare-fun c!121445 () Bool)

(assert (=> bm!61242 (= c!121445 c!121444)))

(declare-fun b!1241425 () Bool)

(declare-fun e!703647 () List!27344)

(assert (=> b!1241425 (= e!703647 call!61245)))

(declare-fun b!1241426 () Bool)

(assert (=> b!1241426 (= e!703646 call!61244)))

(declare-fun b!1241427 () Bool)

(declare-fun c!121443 () Bool)

(assert (=> b!1241427 (= c!121443 (and ((_ is Cons!27340) (t!40807 l!644)) (bvsgt (_1!10126 (h!28549 (t!40807 l!644))) key1!25)))))

(assert (=> b!1241427 (= e!703648 e!703647)))

(declare-fun b!1241428 () Bool)

(assert (=> b!1241428 (= e!703647 call!61245)))

(declare-fun bm!61243 () Bool)

(assert (=> bm!61243 (= call!61246 call!61244)))

(declare-fun b!1241429 () Bool)

(assert (=> b!1241429 (= e!703646 e!703648)))

(declare-fun c!121446 () Bool)

(assert (=> b!1241429 (= c!121446 (and ((_ is Cons!27340) (t!40807 l!644)) (= (_1!10126 (h!28549 (t!40807 l!644))) key1!25)))))

(declare-fun b!1241430 () Bool)

(assert (=> b!1241430 (= e!703649 (contains!7388 lt!562140 (tuple2!20231 key1!25 v1!20)))))

(declare-fun b!1241431 () Bool)

(assert (=> b!1241431 (= e!703650 (ite c!121446 (t!40807 (t!40807 l!644)) (ite c!121443 (Cons!27340 (h!28549 (t!40807 l!644)) (t!40807 (t!40807 l!644))) Nil!27341)))))

(assert (= (and d!136475 c!121444) b!1241426))

(assert (= (and d!136475 (not c!121444)) b!1241429))

(assert (= (and b!1241429 c!121446) b!1241424))

(assert (= (and b!1241429 (not c!121446)) b!1241427))

(assert (= (and b!1241427 c!121443) b!1241428))

(assert (= (and b!1241427 (not c!121443)) b!1241425))

(assert (= (or b!1241428 b!1241425) bm!61241))

(assert (= (or b!1241424 bm!61241) bm!61243))

(assert (= (or b!1241426 bm!61243) bm!61242))

(assert (= (and bm!61242 c!121445) b!1241422))

(assert (= (and bm!61242 (not c!121445)) b!1241431))

(assert (= (and d!136475 res!828121) b!1241423))

(assert (= (and b!1241423 res!828122) b!1241430))

(declare-fun m!1144537 () Bool)

(assert (=> d!136475 m!1144537))

(assert (=> d!136475 m!1144363))

(declare-fun m!1144541 () Bool)

(assert (=> bm!61242 m!1144541))

(declare-fun m!1144547 () Bool)

(assert (=> b!1241430 m!1144547))

(declare-fun m!1144549 () Bool)

(assert (=> b!1241423 m!1144549))

(declare-fun m!1144551 () Bool)

(assert (=> b!1241422 m!1144551))

(assert (=> b!1241192 d!136475))

(declare-fun b!1241445 () Bool)

(declare-fun e!703660 () Bool)

(declare-fun lt!562142 () List!27344)

(assert (=> b!1241445 (= e!703660 (not (containsKey!603 lt!562142 key2!15)))))

(declare-fun b!1241446 () Bool)

(declare-fun e!703662 () List!27344)

(assert (=> b!1241446 (= e!703662 Nil!27341)))

(declare-fun b!1241447 () Bool)

(declare-fun e!703661 () List!27344)

(assert (=> b!1241447 (= e!703661 (t!40807 (t!40807 l!644)))))

(declare-fun d!136483 () Bool)

(assert (=> d!136483 e!703660))

(declare-fun res!828128 () Bool)

(assert (=> d!136483 (=> (not res!828128) (not e!703660))))

(assert (=> d!136483 (= res!828128 (isStrictlySorted!746 lt!562142))))

(assert (=> d!136483 (= lt!562142 e!703661)))

(declare-fun c!121449 () Bool)

(assert (=> d!136483 (= c!121449 (and ((_ is Cons!27340) (t!40807 l!644)) (= (_1!10126 (h!28549 (t!40807 l!644))) key2!15)))))

(assert (=> d!136483 (isStrictlySorted!746 (t!40807 l!644))))

(assert (=> d!136483 (= (removeStrictlySorted!125 (t!40807 l!644) key2!15) lt!562142)))

(declare-fun b!1241448 () Bool)

(assert (=> b!1241448 (= e!703661 e!703662)))

(declare-fun c!121450 () Bool)

(assert (=> b!1241448 (= c!121450 (and ((_ is Cons!27340) (t!40807 l!644)) (not (= (_1!10126 (h!28549 (t!40807 l!644))) key2!15))))))

(declare-fun b!1241449 () Bool)

(assert (=> b!1241449 (= e!703662 ($colon$colon!618 (removeStrictlySorted!125 (t!40807 (t!40807 l!644)) key2!15) (h!28549 (t!40807 l!644))))))

(assert (= (and d!136483 c!121449) b!1241447))

(assert (= (and d!136483 (not c!121449)) b!1241448))

(assert (= (and b!1241448 c!121450) b!1241449))

(assert (= (and b!1241448 (not c!121450)) b!1241446))

(assert (= (and d!136483 res!828128) b!1241445))

(declare-fun m!1144553 () Bool)

(assert (=> b!1241445 m!1144553))

(declare-fun m!1144555 () Bool)

(assert (=> d!136483 m!1144555))

(assert (=> d!136483 m!1144363))

(declare-fun m!1144557 () Bool)

(assert (=> b!1241449 m!1144557))

(assert (=> b!1241449 m!1144557))

(declare-fun m!1144559 () Bool)

(assert (=> b!1241449 m!1144559))

(assert (=> b!1241192 d!136483))

(declare-fun d!136485 () Bool)

(declare-fun res!828129 () Bool)

(declare-fun e!703666 () Bool)

(assert (=> d!136485 (=> res!828129 e!703666)))

(assert (=> d!136485 (= res!828129 (or ((_ is Nil!27341) l!644) ((_ is Nil!27341) (t!40807 l!644))))))

(assert (=> d!136485 (= (isStrictlySorted!746 l!644) e!703666)))

(declare-fun b!1241455 () Bool)

(declare-fun e!703667 () Bool)

(assert (=> b!1241455 (= e!703666 e!703667)))

(declare-fun res!828130 () Bool)

(assert (=> b!1241455 (=> (not res!828130) (not e!703667))))

(assert (=> b!1241455 (= res!828130 (bvslt (_1!10126 (h!28549 l!644)) (_1!10126 (h!28549 (t!40807 l!644)))))))

(declare-fun b!1241456 () Bool)

(assert (=> b!1241456 (= e!703667 (isStrictlySorted!746 (t!40807 l!644)))))

(assert (= (and d!136485 (not res!828129)) b!1241455))

(assert (= (and b!1241455 res!828130) b!1241456))

(assert (=> b!1241456 m!1144363))

(assert (=> b!1241189 d!136485))

(declare-fun b!1241462 () Bool)

(declare-fun e!703671 () Bool)

(declare-fun tp!92624 () Bool)

(assert (=> b!1241462 (= e!703671 (and tp_is_empty!31233 tp!92624))))

(assert (=> b!1241190 (= tp!92612 e!703671)))

(assert (= (and b!1241190 ((_ is Cons!27340) (t!40807 l!644))) b!1241462))

(check-sat (not d!136475) (not b!1241456) (not b!1241225) (not b!1241462) (not b!1241445) (not b!1241449) (not b!1241386) (not b!1241422) (not b!1241361) (not b!1241423) (not b!1241266) (not d!136443) (not d!136483) (not b!1241354) (not b!1241353) (not b!1241388) (not b!1241387) (not bm!61224) (not bm!61233) (not bm!61242) (not d!136449) (not b!1241430) (not d!136467) (not b!1241270) tp_is_empty!31233 (not b!1241395) (not d!136463))
(check-sat)
