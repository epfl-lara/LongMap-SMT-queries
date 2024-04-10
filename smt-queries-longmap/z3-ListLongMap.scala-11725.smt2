; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137366 () Bool)

(assert start!137366)

(declare-fun b!1581277 () Bool)

(declare-fun res!1080307 () Bool)

(declare-fun e!882301 () Bool)

(assert (=> b!1581277 (=> (not res!1080307) (not e!882301))))

(declare-datatypes ((B!2692 0))(
  ( (B!2693 (val!19708 Int)) )
))
(declare-datatypes ((tuple2!25568 0))(
  ( (tuple2!25569 (_1!12795 (_ BitVec 64)) (_2!12795 B!2692)) )
))
(declare-datatypes ((List!36828 0))(
  ( (Nil!36825) (Cons!36824 (h!38367 tuple2!25568) (t!51742 List!36828)) )
))
(declare-fun l!1390 () List!36828)

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!932 (List!36828 (_ BitVec 64)) Bool)

(assert (=> b!1581277 (= res!1080307 (containsKey!932 (t!51742 l!1390) key!405))))

(declare-fun b!1581278 () Bool)

(declare-fun res!1080301 () Bool)

(assert (=> b!1581278 (=> (not res!1080301) (not e!882301))))

(declare-fun lt!676911 () tuple2!25568)

(declare-fun contains!10500 (List!36828 tuple2!25568) Bool)

(assert (=> b!1581278 (= res!1080301 (contains!10500 (t!51742 l!1390) lt!676911))))

(declare-fun b!1581279 () Bool)

(declare-fun e!882302 () Bool)

(declare-datatypes ((tuple2!25570 0))(
  ( (tuple2!25571 (_1!12796 tuple2!25568) (_2!12796 List!36828)) )
))
(declare-datatypes ((Option!921 0))(
  ( (Some!920 (v!22433 tuple2!25570)) (None!919) )
))
(declare-fun lt!676910 () Option!921)

(get-info :version)

(declare-fun get!26814 (Option!921) tuple2!25570)

(assert (=> b!1581279 (= e!882302 (not ((_ is Nil!36825) (_2!12796 (get!26814 lt!676910)))))))

(declare-fun b!1581280 () Bool)

(declare-fun e!882305 () Bool)

(declare-fun tp_is_empty!39237 () Bool)

(declare-fun tp!114563 () Bool)

(assert (=> b!1581280 (= e!882305 (and tp_is_empty!39237 tp!114563))))

(declare-fun b!1581281 () Bool)

(declare-fun ListPrimitiveSize!197 (List!36828) Int)

(assert (=> b!1581281 (= e!882301 (>= (ListPrimitiveSize!197 (t!51742 l!1390)) (ListPrimitiveSize!197 l!1390)))))

(declare-fun b!1581282 () Bool)

(declare-fun res!1080302 () Bool)

(declare-fun e!882304 () Bool)

(assert (=> b!1581282 (=> (not res!1080302) (not e!882304))))

(assert (=> b!1581282 (= res!1080302 (containsKey!932 l!1390 key!405))))

(declare-fun b!1581283 () Bool)

(declare-fun e!882303 () Bool)

(assert (=> b!1581283 (= e!882304 e!882303)))

(declare-fun res!1080304 () Bool)

(assert (=> b!1581283 (=> (not res!1080304) (not e!882303))))

(assert (=> b!1581283 (= res!1080304 (contains!10500 l!1390 lt!676911))))

(declare-fun value!194 () B!2692)

(assert (=> b!1581283 (= lt!676911 (tuple2!25569 key!405 value!194))))

(declare-fun b!1581284 () Bool)

(declare-fun res!1080303 () Bool)

(assert (=> b!1581284 (=> (not res!1080303) (not e!882301))))

(assert (=> b!1581284 (= res!1080303 (and (or (not ((_ is Cons!36824) l!1390)) (not (= (_1!12795 (h!38367 l!1390)) key!405))) ((_ is Cons!36824) l!1390)))))

(declare-fun res!1080309 () Bool)

(assert (=> start!137366 (=> (not res!1080309) (not e!882304))))

(declare-fun isStrictlySorted!1086 (List!36828) Bool)

(assert (=> start!137366 (= res!1080309 (isStrictlySorted!1086 l!1390))))

(assert (=> start!137366 e!882304))

(assert (=> start!137366 e!882305))

(assert (=> start!137366 true))

(assert (=> start!137366 tp_is_empty!39237))

(declare-fun b!1581285 () Bool)

(declare-fun res!1080305 () Bool)

(assert (=> b!1581285 (=> (not res!1080305) (not e!882301))))

(assert (=> b!1581285 (= res!1080305 (isStrictlySorted!1086 (t!51742 l!1390)))))

(declare-fun b!1581286 () Bool)

(assert (=> b!1581286 (= e!882303 e!882301)))

(declare-fun res!1080308 () Bool)

(assert (=> b!1581286 (=> (not res!1080308) (not e!882301))))

(assert (=> b!1581286 (= res!1080308 e!882302)))

(declare-fun res!1080306 () Bool)

(assert (=> b!1581286 (=> res!1080306 e!882302)))

(declare-fun isEmpty!1179 (Option!921) Bool)

(assert (=> b!1581286 (= res!1080306 (isEmpty!1179 lt!676910))))

(declare-fun unapply!95 (List!36828) Option!921)

(assert (=> b!1581286 (= lt!676910 (unapply!95 l!1390))))

(assert (= (and start!137366 res!1080309) b!1581282))

(assert (= (and b!1581282 res!1080302) b!1581283))

(assert (= (and b!1581283 res!1080304) b!1581286))

(assert (= (and b!1581286 (not res!1080306)) b!1581279))

(assert (= (and b!1581286 res!1080308) b!1581284))

(assert (= (and b!1581284 res!1080303) b!1581285))

(assert (= (and b!1581285 res!1080305) b!1581277))

(assert (= (and b!1581277 res!1080307) b!1581278))

(assert (= (and b!1581278 res!1080301) b!1581281))

(assert (= (and start!137366 ((_ is Cons!36824) l!1390)) b!1581280))

(declare-fun m!1452321 () Bool)

(assert (=> b!1581282 m!1452321))

(declare-fun m!1452323 () Bool)

(assert (=> b!1581277 m!1452323))

(declare-fun m!1452325 () Bool)

(assert (=> b!1581283 m!1452325))

(declare-fun m!1452327 () Bool)

(assert (=> b!1581285 m!1452327))

(declare-fun m!1452329 () Bool)

(assert (=> b!1581286 m!1452329))

(declare-fun m!1452331 () Bool)

(assert (=> b!1581286 m!1452331))

(declare-fun m!1452333 () Bool)

(assert (=> start!137366 m!1452333))

(declare-fun m!1452335 () Bool)

(assert (=> b!1581281 m!1452335))

(declare-fun m!1452337 () Bool)

(assert (=> b!1581281 m!1452337))

(declare-fun m!1452339 () Bool)

(assert (=> b!1581279 m!1452339))

(declare-fun m!1452341 () Bool)

(assert (=> b!1581278 m!1452341))

(check-sat (not b!1581277) (not b!1581278) (not b!1581286) (not b!1581285) (not b!1581282) (not start!137366) tp_is_empty!39237 (not b!1581281) (not b!1581280) (not b!1581283) (not b!1581279))
(check-sat)
(get-model)

(declare-fun d!166673 () Bool)

(declare-fun lt!676920 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!846 (List!36828) (InoxSet tuple2!25568))

(assert (=> d!166673 (= lt!676920 (select (content!846 (t!51742 l!1390)) lt!676911))))

(declare-fun e!882326 () Bool)

(assert (=> d!166673 (= lt!676920 e!882326)))

(declare-fun res!1080341 () Bool)

(assert (=> d!166673 (=> (not res!1080341) (not e!882326))))

(assert (=> d!166673 (= res!1080341 ((_ is Cons!36824) (t!51742 l!1390)))))

(assert (=> d!166673 (= (contains!10500 (t!51742 l!1390) lt!676911) lt!676920)))

(declare-fun b!1581321 () Bool)

(declare-fun e!882325 () Bool)

(assert (=> b!1581321 (= e!882326 e!882325)))

(declare-fun res!1080342 () Bool)

(assert (=> b!1581321 (=> res!1080342 e!882325)))

(assert (=> b!1581321 (= res!1080342 (= (h!38367 (t!51742 l!1390)) lt!676911))))

(declare-fun b!1581322 () Bool)

(assert (=> b!1581322 (= e!882325 (contains!10500 (t!51742 (t!51742 l!1390)) lt!676911))))

(assert (= (and d!166673 res!1080341) b!1581321))

(assert (= (and b!1581321 (not res!1080342)) b!1581322))

(declare-fun m!1452365 () Bool)

(assert (=> d!166673 m!1452365))

(declare-fun m!1452367 () Bool)

(assert (=> d!166673 m!1452367))

(declare-fun m!1452369 () Bool)

(assert (=> b!1581322 m!1452369))

(assert (=> b!1581278 d!166673))

(declare-fun d!166677 () Bool)

(declare-fun res!1080349 () Bool)

(declare-fun e!882333 () Bool)

(assert (=> d!166677 (=> res!1080349 e!882333)))

(assert (=> d!166677 (= res!1080349 (or ((_ is Nil!36825) l!1390) ((_ is Nil!36825) (t!51742 l!1390))))))

(assert (=> d!166677 (= (isStrictlySorted!1086 l!1390) e!882333)))

(declare-fun b!1581329 () Bool)

(declare-fun e!882336 () Bool)

(assert (=> b!1581329 (= e!882333 e!882336)))

(declare-fun res!1080351 () Bool)

(assert (=> b!1581329 (=> (not res!1080351) (not e!882336))))

(assert (=> b!1581329 (= res!1080351 (bvslt (_1!12795 (h!38367 l!1390)) (_1!12795 (h!38367 (t!51742 l!1390)))))))

(declare-fun b!1581330 () Bool)

(assert (=> b!1581330 (= e!882336 (isStrictlySorted!1086 (t!51742 l!1390)))))

(assert (= (and d!166677 (not res!1080349)) b!1581329))

(assert (= (and b!1581329 res!1080351) b!1581330))

(assert (=> b!1581330 m!1452327))

(assert (=> start!137366 d!166677))

(declare-fun d!166679 () Bool)

(declare-fun lt!676921 () Bool)

(assert (=> d!166679 (= lt!676921 (select (content!846 l!1390) lt!676911))))

(declare-fun e!882338 () Bool)

(assert (=> d!166679 (= lt!676921 e!882338)))

(declare-fun res!1080353 () Bool)

(assert (=> d!166679 (=> (not res!1080353) (not e!882338))))

(assert (=> d!166679 (= res!1080353 ((_ is Cons!36824) l!1390))))

(assert (=> d!166679 (= (contains!10500 l!1390 lt!676911) lt!676921)))

(declare-fun b!1581333 () Bool)

(declare-fun e!882337 () Bool)

(assert (=> b!1581333 (= e!882338 e!882337)))

(declare-fun res!1080354 () Bool)

(assert (=> b!1581333 (=> res!1080354 e!882337)))

(assert (=> b!1581333 (= res!1080354 (= (h!38367 l!1390) lt!676911))))

(declare-fun b!1581334 () Bool)

(assert (=> b!1581334 (= e!882337 (contains!10500 (t!51742 l!1390) lt!676911))))

(assert (= (and d!166679 res!1080353) b!1581333))

(assert (= (and b!1581333 (not res!1080354)) b!1581334))

(declare-fun m!1452371 () Bool)

(assert (=> d!166679 m!1452371))

(declare-fun m!1452373 () Bool)

(assert (=> d!166679 m!1452373))

(assert (=> b!1581334 m!1452341))

(assert (=> b!1581283 d!166679))

(declare-fun d!166681 () Bool)

(declare-fun res!1080367 () Bool)

(declare-fun e!882351 () Bool)

(assert (=> d!166681 (=> res!1080367 e!882351)))

(assert (=> d!166681 (= res!1080367 (and ((_ is Cons!36824) (t!51742 l!1390)) (= (_1!12795 (h!38367 (t!51742 l!1390))) key!405)))))

(assert (=> d!166681 (= (containsKey!932 (t!51742 l!1390) key!405) e!882351)))

(declare-fun b!1581347 () Bool)

(declare-fun e!882352 () Bool)

(assert (=> b!1581347 (= e!882351 e!882352)))

(declare-fun res!1080368 () Bool)

(assert (=> b!1581347 (=> (not res!1080368) (not e!882352))))

(assert (=> b!1581347 (= res!1080368 (and (or (not ((_ is Cons!36824) (t!51742 l!1390))) (bvsle (_1!12795 (h!38367 (t!51742 l!1390))) key!405)) ((_ is Cons!36824) (t!51742 l!1390)) (bvslt (_1!12795 (h!38367 (t!51742 l!1390))) key!405)))))

(declare-fun b!1581348 () Bool)

(assert (=> b!1581348 (= e!882352 (containsKey!932 (t!51742 (t!51742 l!1390)) key!405))))

(assert (= (and d!166681 (not res!1080367)) b!1581347))

(assert (= (and b!1581347 res!1080368) b!1581348))

(declare-fun m!1452377 () Bool)

(assert (=> b!1581348 m!1452377))

(assert (=> b!1581277 d!166681))

(declare-fun d!166695 () Bool)

(assert (=> d!166695 (= (get!26814 lt!676910) (v!22433 lt!676910))))

(assert (=> b!1581279 d!166695))

(declare-fun d!166697 () Bool)

(assert (=> d!166697 (= (isEmpty!1179 lt!676910) (not ((_ is Some!920) lt!676910)))))

(assert (=> b!1581286 d!166697))

(declare-fun d!166701 () Bool)

(assert (=> d!166701 (= (unapply!95 l!1390) (ite ((_ is Nil!36825) l!1390) None!919 (Some!920 (tuple2!25571 (h!38367 l!1390) (t!51742 l!1390)))))))

(assert (=> b!1581286 d!166701))

(declare-fun d!166703 () Bool)

(declare-fun res!1080379 () Bool)

(declare-fun e!882363 () Bool)

(assert (=> d!166703 (=> res!1080379 e!882363)))

(assert (=> d!166703 (= res!1080379 (or ((_ is Nil!36825) (t!51742 l!1390)) ((_ is Nil!36825) (t!51742 (t!51742 l!1390)))))))

(assert (=> d!166703 (= (isStrictlySorted!1086 (t!51742 l!1390)) e!882363)))

(declare-fun b!1581359 () Bool)

(declare-fun e!882364 () Bool)

(assert (=> b!1581359 (= e!882363 e!882364)))

(declare-fun res!1080380 () Bool)

(assert (=> b!1581359 (=> (not res!1080380) (not e!882364))))

(assert (=> b!1581359 (= res!1080380 (bvslt (_1!12795 (h!38367 (t!51742 l!1390))) (_1!12795 (h!38367 (t!51742 (t!51742 l!1390))))))))

(declare-fun b!1581360 () Bool)

(assert (=> b!1581360 (= e!882364 (isStrictlySorted!1086 (t!51742 (t!51742 l!1390))))))

(assert (= (and d!166703 (not res!1080379)) b!1581359))

(assert (= (and b!1581359 res!1080380) b!1581360))

(declare-fun m!1452381 () Bool)

(assert (=> b!1581360 m!1452381))

(assert (=> b!1581285 d!166703))

(declare-fun d!166707 () Bool)

(declare-fun res!1080385 () Bool)

(declare-fun e!882369 () Bool)

(assert (=> d!166707 (=> res!1080385 e!882369)))

(assert (=> d!166707 (= res!1080385 (and ((_ is Cons!36824) l!1390) (= (_1!12795 (h!38367 l!1390)) key!405)))))

(assert (=> d!166707 (= (containsKey!932 l!1390 key!405) e!882369)))

(declare-fun b!1581365 () Bool)

(declare-fun e!882370 () Bool)

(assert (=> b!1581365 (= e!882369 e!882370)))

(declare-fun res!1080386 () Bool)

(assert (=> b!1581365 (=> (not res!1080386) (not e!882370))))

(assert (=> b!1581365 (= res!1080386 (and (or (not ((_ is Cons!36824) l!1390)) (bvsle (_1!12795 (h!38367 l!1390)) key!405)) ((_ is Cons!36824) l!1390) (bvslt (_1!12795 (h!38367 l!1390)) key!405)))))

(declare-fun b!1581366 () Bool)

(assert (=> b!1581366 (= e!882370 (containsKey!932 (t!51742 l!1390) key!405))))

(assert (= (and d!166707 (not res!1080385)) b!1581365))

(assert (= (and b!1581365 res!1080386) b!1581366))

(assert (=> b!1581366 m!1452323))

(assert (=> b!1581282 d!166707))

(declare-fun d!166711 () Bool)

(declare-fun lt!676926 () Int)

(assert (=> d!166711 (>= lt!676926 0)))

(declare-fun e!882379 () Int)

(assert (=> d!166711 (= lt!676926 e!882379)))

(declare-fun c!146583 () Bool)

(assert (=> d!166711 (= c!146583 ((_ is Nil!36825) (t!51742 l!1390)))))

(assert (=> d!166711 (= (ListPrimitiveSize!197 (t!51742 l!1390)) lt!676926)))

(declare-fun b!1581379 () Bool)

(assert (=> b!1581379 (= e!882379 0)))

(declare-fun b!1581380 () Bool)

(assert (=> b!1581380 (= e!882379 (+ 1 (ListPrimitiveSize!197 (t!51742 (t!51742 l!1390)))))))

(assert (= (and d!166711 c!146583) b!1581379))

(assert (= (and d!166711 (not c!146583)) b!1581380))

(declare-fun m!1452387 () Bool)

(assert (=> b!1581380 m!1452387))

(assert (=> b!1581281 d!166711))

(declare-fun d!166719 () Bool)

(declare-fun lt!676929 () Int)

(assert (=> d!166719 (>= lt!676929 0)))

(declare-fun e!882384 () Int)

(assert (=> d!166719 (= lt!676929 e!882384)))

(declare-fun c!146584 () Bool)

(assert (=> d!166719 (= c!146584 ((_ is Nil!36825) l!1390))))

(assert (=> d!166719 (= (ListPrimitiveSize!197 l!1390) lt!676929)))

(declare-fun b!1581385 () Bool)

(assert (=> b!1581385 (= e!882384 0)))

(declare-fun b!1581386 () Bool)

(assert (=> b!1581386 (= e!882384 (+ 1 (ListPrimitiveSize!197 (t!51742 l!1390))))))

(assert (= (and d!166719 c!146584) b!1581385))

(assert (= (and d!166719 (not c!146584)) b!1581386))

(assert (=> b!1581386 m!1452335))

(assert (=> b!1581281 d!166719))

(declare-fun b!1581393 () Bool)

(declare-fun e!882388 () Bool)

(declare-fun tp!114569 () Bool)

(assert (=> b!1581393 (= e!882388 (and tp_is_empty!39237 tp!114569))))

(assert (=> b!1581280 (= tp!114563 e!882388)))

(assert (= (and b!1581280 ((_ is Cons!36824) (t!51742 l!1390))) b!1581393))

(check-sat (not d!166679) (not b!1581360) (not b!1581366) (not b!1581322) (not b!1581330) (not b!1581380) (not b!1581386) (not b!1581393) (not b!1581348) (not d!166673) (not b!1581334) tp_is_empty!39237)
(check-sat)
