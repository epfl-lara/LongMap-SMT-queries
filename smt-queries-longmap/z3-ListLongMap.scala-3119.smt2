; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43848 () Bool)

(assert start!43848)

(declare-fun res!288481 () Bool)

(declare-fun e!285017 () Bool)

(assert (=> start!43848 (=> (not res!288481) (not e!285017))))

(declare-datatypes ((B!1136 0))(
  ( (B!1137 (val!7020 Int)) )
))
(declare-datatypes ((tuple2!9292 0))(
  ( (tuple2!9293 (_1!4657 (_ BitVec 64)) (_2!4657 B!1136)) )
))
(declare-datatypes ((List!9322 0))(
  ( (Nil!9319) (Cons!9318 (h!10174 tuple2!9292) (t!15535 List!9322)) )
))
(declare-fun l!956 () List!9322)

(declare-fun isStrictlySorted!419 (List!9322) Bool)

(assert (=> start!43848 (= res!288481 (isStrictlySorted!419 l!956))))

(assert (=> start!43848 e!285017))

(declare-fun e!285018 () Bool)

(assert (=> start!43848 e!285018))

(assert (=> start!43848 true))

(declare-fun tp_is_empty!13945 () Bool)

(assert (=> start!43848 tp_is_empty!13945))

(declare-fun b!484184 () Bool)

(declare-fun tp!43534 () Bool)

(assert (=> b!484184 (= e!285018 (and tp_is_empty!13945 tp!43534))))

(declare-fun b!484185 () Bool)

(declare-fun e!285016 () Bool)

(assert (=> b!484185 (= e!285017 e!285016)))

(declare-fun res!288483 () Bool)

(assert (=> b!484185 (=> (not res!288483) (not e!285016))))

(declare-fun key!251 () (_ BitVec 64))

(get-info :version)

(assert (=> b!484185 (= res!288483 (and ((_ is Cons!9318) l!956) (bvslt (_1!4657 (h!10174 l!956)) key!251)))))

(declare-fun lt!219145 () List!9322)

(declare-fun value!166 () B!1136)

(declare-fun insertStrictlySorted!239 (List!9322 (_ BitVec 64) B!1136) List!9322)

(assert (=> b!484185 (= lt!219145 (insertStrictlySorted!239 l!956 key!251 value!166))))

(declare-fun b!484186 () Bool)

(declare-fun res!288484 () Bool)

(assert (=> b!484186 (=> (not res!288484) (not e!285016))))

(declare-fun containsKey!384 (List!9322 (_ BitVec 64)) Bool)

(assert (=> b!484186 (= res!288484 (not (containsKey!384 (t!15535 l!956) key!251)))))

(declare-fun b!484187 () Bool)

(declare-fun ListPrimitiveSize!64 (List!9322) Int)

(assert (=> b!484187 (= e!285016 (>= (ListPrimitiveSize!64 (t!15535 l!956)) (ListPrimitiveSize!64 l!956)))))

(declare-fun b!484188 () Bool)

(declare-fun res!288482 () Bool)

(assert (=> b!484188 (=> (not res!288482) (not e!285017))))

(assert (=> b!484188 (= res!288482 (not (containsKey!384 l!956 key!251)))))

(declare-fun b!484189 () Bool)

(declare-fun res!288485 () Bool)

(assert (=> b!484189 (=> (not res!288485) (not e!285016))))

(assert (=> b!484189 (= res!288485 (isStrictlySorted!419 (t!15535 l!956)))))

(assert (= (and start!43848 res!288481) b!484188))

(assert (= (and b!484188 res!288482) b!484185))

(assert (= (and b!484185 res!288483) b!484189))

(assert (= (and b!484189 res!288485) b!484186))

(assert (= (and b!484186 res!288484) b!484187))

(assert (= (and start!43848 ((_ is Cons!9318) l!956)) b!484184))

(declare-fun m!464283 () Bool)

(assert (=> start!43848 m!464283))

(declare-fun m!464285 () Bool)

(assert (=> b!484189 m!464285))

(declare-fun m!464287 () Bool)

(assert (=> b!484186 m!464287))

(declare-fun m!464289 () Bool)

(assert (=> b!484188 m!464289))

(declare-fun m!464291 () Bool)

(assert (=> b!484187 m!464291))

(declare-fun m!464293 () Bool)

(assert (=> b!484187 m!464293))

(declare-fun m!464295 () Bool)

(assert (=> b!484185 m!464295))

(check-sat (not b!484186) (not start!43848) (not b!484189) (not b!484187) (not b!484188) (not b!484185) tp_is_empty!13945 (not b!484184))
(check-sat)
(get-model)

(declare-fun d!76901 () Bool)

(declare-fun res!288520 () Bool)

(declare-fun e!285041 () Bool)

(assert (=> d!76901 (=> res!288520 e!285041)))

(assert (=> d!76901 (= res!288520 (and ((_ is Cons!9318) (t!15535 l!956)) (= (_1!4657 (h!10174 (t!15535 l!956))) key!251)))))

(assert (=> d!76901 (= (containsKey!384 (t!15535 l!956) key!251) e!285041)))

(declare-fun b!484230 () Bool)

(declare-fun e!285042 () Bool)

(assert (=> b!484230 (= e!285041 e!285042)))

(declare-fun res!288521 () Bool)

(assert (=> b!484230 (=> (not res!288521) (not e!285042))))

(assert (=> b!484230 (= res!288521 (and (or (not ((_ is Cons!9318) (t!15535 l!956))) (bvsle (_1!4657 (h!10174 (t!15535 l!956))) key!251)) ((_ is Cons!9318) (t!15535 l!956)) (bvslt (_1!4657 (h!10174 (t!15535 l!956))) key!251)))))

(declare-fun b!484231 () Bool)

(assert (=> b!484231 (= e!285042 (containsKey!384 (t!15535 (t!15535 l!956)) key!251))))

(assert (= (and d!76901 (not res!288520)) b!484230))

(assert (= (and b!484230 res!288521) b!484231))

(declare-fun m!464325 () Bool)

(assert (=> b!484231 m!464325))

(assert (=> b!484186 d!76901))

(declare-fun d!76905 () Bool)

(declare-fun res!288530 () Bool)

(declare-fun e!285051 () Bool)

(assert (=> d!76905 (=> res!288530 e!285051)))

(assert (=> d!76905 (= res!288530 (or ((_ is Nil!9319) l!956) ((_ is Nil!9319) (t!15535 l!956))))))

(assert (=> d!76905 (= (isStrictlySorted!419 l!956) e!285051)))

(declare-fun b!484240 () Bool)

(declare-fun e!285052 () Bool)

(assert (=> b!484240 (= e!285051 e!285052)))

(declare-fun res!288531 () Bool)

(assert (=> b!484240 (=> (not res!288531) (not e!285052))))

(assert (=> b!484240 (= res!288531 (bvslt (_1!4657 (h!10174 l!956)) (_1!4657 (h!10174 (t!15535 l!956)))))))

(declare-fun b!484241 () Bool)

(assert (=> b!484241 (= e!285052 (isStrictlySorted!419 (t!15535 l!956)))))

(assert (= (and d!76905 (not res!288530)) b!484240))

(assert (= (and b!484240 res!288531) b!484241))

(assert (=> b!484241 m!464285))

(assert (=> start!43848 d!76905))

(declare-fun d!76907 () Bool)

(declare-fun lt!219154 () Int)

(assert (=> d!76907 (>= lt!219154 0)))

(declare-fun e!285061 () Int)

(assert (=> d!76907 (= lt!219154 e!285061)))

(declare-fun c!58176 () Bool)

(assert (=> d!76907 (= c!58176 ((_ is Nil!9319) (t!15535 l!956)))))

(assert (=> d!76907 (= (ListPrimitiveSize!64 (t!15535 l!956)) lt!219154)))

(declare-fun b!484252 () Bool)

(assert (=> b!484252 (= e!285061 0)))

(declare-fun b!484253 () Bool)

(assert (=> b!484253 (= e!285061 (+ 1 (ListPrimitiveSize!64 (t!15535 (t!15535 l!956)))))))

(assert (= (and d!76907 c!58176) b!484252))

(assert (= (and d!76907 (not c!58176)) b!484253))

(declare-fun m!464329 () Bool)

(assert (=> b!484253 m!464329))

(assert (=> b!484187 d!76907))

(declare-fun d!76913 () Bool)

(declare-fun lt!219155 () Int)

(assert (=> d!76913 (>= lt!219155 0)))

(declare-fun e!285062 () Int)

(assert (=> d!76913 (= lt!219155 e!285062)))

(declare-fun c!58177 () Bool)

(assert (=> d!76913 (= c!58177 ((_ is Nil!9319) l!956))))

(assert (=> d!76913 (= (ListPrimitiveSize!64 l!956) lt!219155)))

(declare-fun b!484254 () Bool)

(assert (=> b!484254 (= e!285062 0)))

(declare-fun b!484255 () Bool)

(assert (=> b!484255 (= e!285062 (+ 1 (ListPrimitiveSize!64 (t!15535 l!956))))))

(assert (= (and d!76913 c!58177) b!484254))

(assert (= (and d!76913 (not c!58177)) b!484255))

(assert (=> b!484255 m!464291))

(assert (=> b!484187 d!76913))

(declare-fun d!76915 () Bool)

(declare-fun e!285107 () Bool)

(assert (=> d!76915 e!285107))

(declare-fun res!288553 () Bool)

(assert (=> d!76915 (=> (not res!288553) (not e!285107))))

(declare-fun lt!219167 () List!9322)

(assert (=> d!76915 (= res!288553 (isStrictlySorted!419 lt!219167))))

(declare-fun e!285108 () List!9322)

(assert (=> d!76915 (= lt!219167 e!285108)))

(declare-fun c!58211 () Bool)

(assert (=> d!76915 (= c!58211 (and ((_ is Cons!9318) l!956) (bvslt (_1!4657 (h!10174 l!956)) key!251)))))

(assert (=> d!76915 (isStrictlySorted!419 l!956)))

(assert (=> d!76915 (= (insertStrictlySorted!239 l!956 key!251 value!166) lt!219167)))

(declare-fun b!484334 () Bool)

(declare-fun e!285106 () List!9322)

(declare-fun call!31118 () List!9322)

(assert (=> b!484334 (= e!285106 call!31118)))

(declare-fun bm!31115 () Bool)

(declare-fun call!31120 () List!9322)

(declare-fun call!31119 () List!9322)

(assert (=> bm!31115 (= call!31120 call!31119)))

(declare-fun b!484335 () Bool)

(declare-fun e!285104 () List!9322)

(assert (=> b!484335 (= e!285108 e!285104)))

(declare-fun c!58213 () Bool)

(assert (=> b!484335 (= c!58213 (and ((_ is Cons!9318) l!956) (= (_1!4657 (h!10174 l!956)) key!251)))))

(declare-fun b!484336 () Bool)

(declare-fun res!288552 () Bool)

(assert (=> b!484336 (=> (not res!288552) (not e!285107))))

(assert (=> b!484336 (= res!288552 (containsKey!384 lt!219167 key!251))))

(declare-fun bm!31116 () Bool)

(declare-fun e!285105 () List!9322)

(declare-fun $colon$colon!121 (List!9322 tuple2!9292) List!9322)

(assert (=> bm!31116 (= call!31119 ($colon$colon!121 e!285105 (ite c!58211 (h!10174 l!956) (tuple2!9293 key!251 value!166))))))

(declare-fun c!58212 () Bool)

(assert (=> bm!31116 (= c!58212 c!58211)))

(declare-fun b!484337 () Bool)

(assert (=> b!484337 (= e!285105 (insertStrictlySorted!239 (t!15535 l!956) key!251 value!166))))

(declare-fun b!484338 () Bool)

(declare-fun c!58210 () Bool)

(assert (=> b!484338 (= c!58210 (and ((_ is Cons!9318) l!956) (bvsgt (_1!4657 (h!10174 l!956)) key!251)))))

(assert (=> b!484338 (= e!285104 e!285106)))

(declare-fun b!484339 () Bool)

(assert (=> b!484339 (= e!285104 call!31120)))

(declare-fun b!484340 () Bool)

(assert (=> b!484340 (= e!285106 call!31118)))

(declare-fun b!484341 () Bool)

(assert (=> b!484341 (= e!285105 (ite c!58213 (t!15535 l!956) (ite c!58210 (Cons!9318 (h!10174 l!956) (t!15535 l!956)) Nil!9319)))))

(declare-fun b!484342 () Bool)

(declare-fun contains!2666 (List!9322 tuple2!9292) Bool)

(assert (=> b!484342 (= e!285107 (contains!2666 lt!219167 (tuple2!9293 key!251 value!166)))))

(declare-fun b!484343 () Bool)

(assert (=> b!484343 (= e!285108 call!31119)))

(declare-fun bm!31117 () Bool)

(assert (=> bm!31117 (= call!31118 call!31120)))

(assert (= (and d!76915 c!58211) b!484343))

(assert (= (and d!76915 (not c!58211)) b!484335))

(assert (= (and b!484335 c!58213) b!484339))

(assert (= (and b!484335 (not c!58213)) b!484338))

(assert (= (and b!484338 c!58210) b!484334))

(assert (= (and b!484338 (not c!58210)) b!484340))

(assert (= (or b!484334 b!484340) bm!31117))

(assert (= (or b!484339 bm!31117) bm!31115))

(assert (= (or b!484343 bm!31115) bm!31116))

(assert (= (and bm!31116 c!58212) b!484337))

(assert (= (and bm!31116 (not c!58212)) b!484341))

(assert (= (and d!76915 res!288553) b!484336))

(assert (= (and b!484336 res!288552) b!484342))

(declare-fun m!464345 () Bool)

(assert (=> b!484342 m!464345))

(declare-fun m!464347 () Bool)

(assert (=> d!76915 m!464347))

(assert (=> d!76915 m!464283))

(declare-fun m!464349 () Bool)

(assert (=> b!484336 m!464349))

(declare-fun m!464351 () Bool)

(assert (=> b!484337 m!464351))

(declare-fun m!464353 () Bool)

(assert (=> bm!31116 m!464353))

(assert (=> b!484185 d!76915))

(declare-fun d!76927 () Bool)

(declare-fun res!288562 () Bool)

(declare-fun e!285115 () Bool)

(assert (=> d!76927 (=> res!288562 e!285115)))

(assert (=> d!76927 (= res!288562 (or ((_ is Nil!9319) (t!15535 l!956)) ((_ is Nil!9319) (t!15535 (t!15535 l!956)))))))

(assert (=> d!76927 (= (isStrictlySorted!419 (t!15535 l!956)) e!285115)))

(declare-fun b!484352 () Bool)

(declare-fun e!285116 () Bool)

(assert (=> b!484352 (= e!285115 e!285116)))

(declare-fun res!288563 () Bool)

(assert (=> b!484352 (=> (not res!288563) (not e!285116))))

(assert (=> b!484352 (= res!288563 (bvslt (_1!4657 (h!10174 (t!15535 l!956))) (_1!4657 (h!10174 (t!15535 (t!15535 l!956))))))))

(declare-fun b!484353 () Bool)

(assert (=> b!484353 (= e!285116 (isStrictlySorted!419 (t!15535 (t!15535 l!956))))))

(assert (= (and d!76927 (not res!288562)) b!484352))

(assert (= (and b!484352 res!288563) b!484353))

(declare-fun m!464355 () Bool)

(assert (=> b!484353 m!464355))

(assert (=> b!484189 d!76927))

(declare-fun d!76929 () Bool)

(declare-fun res!288564 () Bool)

(declare-fun e!285117 () Bool)

(assert (=> d!76929 (=> res!288564 e!285117)))

(assert (=> d!76929 (= res!288564 (and ((_ is Cons!9318) l!956) (= (_1!4657 (h!10174 l!956)) key!251)))))

(assert (=> d!76929 (= (containsKey!384 l!956 key!251) e!285117)))

(declare-fun b!484354 () Bool)

(declare-fun e!285118 () Bool)

(assert (=> b!484354 (= e!285117 e!285118)))

(declare-fun res!288565 () Bool)

(assert (=> b!484354 (=> (not res!288565) (not e!285118))))

(assert (=> b!484354 (= res!288565 (and (or (not ((_ is Cons!9318) l!956)) (bvsle (_1!4657 (h!10174 l!956)) key!251)) ((_ is Cons!9318) l!956) (bvslt (_1!4657 (h!10174 l!956)) key!251)))))

(declare-fun b!484355 () Bool)

(assert (=> b!484355 (= e!285118 (containsKey!384 (t!15535 l!956) key!251))))

(assert (= (and d!76929 (not res!288564)) b!484354))

(assert (= (and b!484354 res!288565) b!484355))

(assert (=> b!484355 m!464287))

(assert (=> b!484188 d!76929))

(declare-fun b!484362 () Bool)

(declare-fun e!285123 () Bool)

(declare-fun tp!43543 () Bool)

(assert (=> b!484362 (= e!285123 (and tp_is_empty!13945 tp!43543))))

(assert (=> b!484184 (= tp!43534 e!285123)))

(assert (= (and b!484184 ((_ is Cons!9318) (t!15535 l!956))) b!484362))

(check-sat (not b!484253) (not b!484336) (not b!484337) (not b!484353) (not b!484255) (not d!76915) (not b!484342) (not bm!31116) tp_is_empty!13945 (not b!484362) (not b!484241) (not b!484231) (not b!484355))
(check-sat)
