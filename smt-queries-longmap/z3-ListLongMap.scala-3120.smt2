; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43878 () Bool)

(assert start!43878)

(declare-fun b!484415 () Bool)

(declare-fun res!288592 () Bool)

(declare-fun e!285159 () Bool)

(assert (=> b!484415 (=> (not res!288592) (not e!285159))))

(declare-datatypes ((B!1142 0))(
  ( (B!1143 (val!7023 Int)) )
))
(declare-datatypes ((tuple2!9298 0))(
  ( (tuple2!9299 (_1!4660 (_ BitVec 64)) (_2!4660 B!1142)) )
))
(declare-datatypes ((List!9325 0))(
  ( (Nil!9322) (Cons!9321 (h!10177 tuple2!9298) (t!15538 List!9325)) )
))
(declare-fun l!956 () List!9325)

(declare-fun isStrictlySorted!422 (List!9325) Bool)

(assert (=> b!484415 (= res!288592 (isStrictlySorted!422 (t!15538 l!956)))))

(declare-fun b!484416 () Bool)

(declare-fun res!288593 () Bool)

(assert (=> b!484416 (=> (not res!288593) (not e!285159))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!387 (List!9325 (_ BitVec 64)) Bool)

(assert (=> b!484416 (= res!288593 (not (containsKey!387 (t!15538 l!956) key!251)))))

(declare-fun b!484417 () Bool)

(declare-fun lt!219178 () List!9325)

(declare-fun length!11 (List!9325) Int)

(assert (=> b!484417 (= e!285159 (not (= (length!11 lt!219178) (+ 1 (length!11 l!956)))))))

(declare-fun value!166 () B!1142)

(declare-fun insertStrictlySorted!242 (List!9325 (_ BitVec 64) B!1142) List!9325)

(assert (=> b!484417 (= (length!11 (insertStrictlySorted!242 (t!15538 l!956) key!251 value!166)) (+ 1 (length!11 (t!15538 l!956))))))

(declare-datatypes ((Unit!14164 0))(
  ( (Unit!14165) )
))
(declare-fun lt!219177 () Unit!14164)

(declare-fun lemmaAddNewKeyIncrementSize!4 (List!9325 (_ BitVec 64) B!1142) Unit!14164)

(assert (=> b!484417 (= lt!219177 (lemmaAddNewKeyIncrementSize!4 (t!15538 l!956) key!251 value!166))))

(declare-fun b!484418 () Bool)

(declare-fun e!285157 () Bool)

(assert (=> b!484418 (= e!285157 e!285159)))

(declare-fun res!288595 () Bool)

(assert (=> b!484418 (=> (not res!288595) (not e!285159))))

(get-info :version)

(assert (=> b!484418 (= res!288595 (and ((_ is Cons!9321) l!956) (bvslt (_1!4660 (h!10177 l!956)) key!251)))))

(assert (=> b!484418 (= lt!219178 (insertStrictlySorted!242 l!956 key!251 value!166))))

(declare-fun b!484419 () Bool)

(declare-fun e!285158 () Bool)

(declare-fun tp_is_empty!13951 () Bool)

(declare-fun tp!43552 () Bool)

(assert (=> b!484419 (= e!285158 (and tp_is_empty!13951 tp!43552))))

(declare-fun res!288594 () Bool)

(assert (=> start!43878 (=> (not res!288594) (not e!285157))))

(assert (=> start!43878 (= res!288594 (isStrictlySorted!422 l!956))))

(assert (=> start!43878 e!285157))

(assert (=> start!43878 e!285158))

(assert (=> start!43878 true))

(assert (=> start!43878 tp_is_empty!13951))

(declare-fun b!484420 () Bool)

(declare-fun res!288596 () Bool)

(assert (=> b!484420 (=> (not res!288596) (not e!285157))))

(assert (=> b!484420 (= res!288596 (not (containsKey!387 l!956 key!251)))))

(assert (= (and start!43878 res!288594) b!484420))

(assert (= (and b!484420 res!288596) b!484418))

(assert (= (and b!484418 res!288595) b!484415))

(assert (= (and b!484415 res!288592) b!484416))

(assert (= (and b!484416 res!288593) b!484417))

(assert (= (and start!43878 ((_ is Cons!9321) l!956)) b!484419))

(declare-fun m!464373 () Bool)

(assert (=> b!484420 m!464373))

(declare-fun m!464375 () Bool)

(assert (=> start!43878 m!464375))

(declare-fun m!464377 () Bool)

(assert (=> b!484416 m!464377))

(declare-fun m!464379 () Bool)

(assert (=> b!484417 m!464379))

(declare-fun m!464381 () Bool)

(assert (=> b!484417 m!464381))

(declare-fun m!464383 () Bool)

(assert (=> b!484417 m!464383))

(assert (=> b!484417 m!464379))

(declare-fun m!464385 () Bool)

(assert (=> b!484417 m!464385))

(declare-fun m!464387 () Bool)

(assert (=> b!484417 m!464387))

(declare-fun m!464389 () Bool)

(assert (=> b!484417 m!464389))

(declare-fun m!464391 () Bool)

(assert (=> b!484418 m!464391))

(declare-fun m!464393 () Bool)

(assert (=> b!484415 m!464393))

(check-sat (not b!484419) (not b!484417) (not b!484418) (not b!484415) tp_is_empty!13951 (not b!484416) (not start!43878) (not b!484420))
(check-sat)
(get-model)

(declare-fun d!76945 () Bool)

(declare-fun res!288631 () Bool)

(declare-fun e!285182 () Bool)

(assert (=> d!76945 (=> res!288631 e!285182)))

(assert (=> d!76945 (= res!288631 (and ((_ is Cons!9321) (t!15538 l!956)) (= (_1!4660 (h!10177 (t!15538 l!956))) key!251)))))

(assert (=> d!76945 (= (containsKey!387 (t!15538 l!956) key!251) e!285182)))

(declare-fun b!484461 () Bool)

(declare-fun e!285183 () Bool)

(assert (=> b!484461 (= e!285182 e!285183)))

(declare-fun res!288632 () Bool)

(assert (=> b!484461 (=> (not res!288632) (not e!285183))))

(assert (=> b!484461 (= res!288632 (and (or (not ((_ is Cons!9321) (t!15538 l!956))) (bvsle (_1!4660 (h!10177 (t!15538 l!956))) key!251)) ((_ is Cons!9321) (t!15538 l!956)) (bvslt (_1!4660 (h!10177 (t!15538 l!956))) key!251)))))

(declare-fun b!484462 () Bool)

(assert (=> b!484462 (= e!285183 (containsKey!387 (t!15538 (t!15538 l!956)) key!251))))

(assert (= (and d!76945 (not res!288631)) b!484461))

(assert (= (and b!484461 res!288632) b!484462))

(declare-fun m!464439 () Bool)

(assert (=> b!484462 m!464439))

(assert (=> b!484416 d!76945))

(declare-fun d!76947 () Bool)

(declare-fun res!288633 () Bool)

(declare-fun e!285184 () Bool)

(assert (=> d!76947 (=> res!288633 e!285184)))

(assert (=> d!76947 (= res!288633 (and ((_ is Cons!9321) l!956) (= (_1!4660 (h!10177 l!956)) key!251)))))

(assert (=> d!76947 (= (containsKey!387 l!956 key!251) e!285184)))

(declare-fun b!484463 () Bool)

(declare-fun e!285185 () Bool)

(assert (=> b!484463 (= e!285184 e!285185)))

(declare-fun res!288634 () Bool)

(assert (=> b!484463 (=> (not res!288634) (not e!285185))))

(assert (=> b!484463 (= res!288634 (and (or (not ((_ is Cons!9321) l!956)) (bvsle (_1!4660 (h!10177 l!956)) key!251)) ((_ is Cons!9321) l!956) (bvslt (_1!4660 (h!10177 l!956)) key!251)))))

(declare-fun b!484464 () Bool)

(assert (=> b!484464 (= e!285185 (containsKey!387 (t!15538 l!956) key!251))))

(assert (= (and d!76947 (not res!288633)) b!484463))

(assert (= (and b!484463 res!288634) b!484464))

(assert (=> b!484464 m!464377))

(assert (=> b!484420 d!76947))

(declare-fun d!76951 () Bool)

(declare-fun res!288643 () Bool)

(declare-fun e!285194 () Bool)

(assert (=> d!76951 (=> res!288643 e!285194)))

(assert (=> d!76951 (= res!288643 (or ((_ is Nil!9322) (t!15538 l!956)) ((_ is Nil!9322) (t!15538 (t!15538 l!956)))))))

(assert (=> d!76951 (= (isStrictlySorted!422 (t!15538 l!956)) e!285194)))

(declare-fun b!484473 () Bool)

(declare-fun e!285195 () Bool)

(assert (=> b!484473 (= e!285194 e!285195)))

(declare-fun res!288644 () Bool)

(assert (=> b!484473 (=> (not res!288644) (not e!285195))))

(assert (=> b!484473 (= res!288644 (bvslt (_1!4660 (h!10177 (t!15538 l!956))) (_1!4660 (h!10177 (t!15538 (t!15538 l!956))))))))

(declare-fun b!484474 () Bool)

(assert (=> b!484474 (= e!285195 (isStrictlySorted!422 (t!15538 (t!15538 l!956))))))

(assert (= (and d!76951 (not res!288643)) b!484473))

(assert (= (and b!484473 res!288644) b!484474))

(declare-fun m!464441 () Bool)

(assert (=> b!484474 m!464441))

(assert (=> b!484415 d!76951))

(declare-fun d!76953 () Bool)

(declare-fun res!288645 () Bool)

(declare-fun e!285196 () Bool)

(assert (=> d!76953 (=> res!288645 e!285196)))

(assert (=> d!76953 (= res!288645 (or ((_ is Nil!9322) l!956) ((_ is Nil!9322) (t!15538 l!956))))))

(assert (=> d!76953 (= (isStrictlySorted!422 l!956) e!285196)))

(declare-fun b!484475 () Bool)

(declare-fun e!285197 () Bool)

(assert (=> b!484475 (= e!285196 e!285197)))

(declare-fun res!288646 () Bool)

(assert (=> b!484475 (=> (not res!288646) (not e!285197))))

(assert (=> b!484475 (= res!288646 (bvslt (_1!4660 (h!10177 l!956)) (_1!4660 (h!10177 (t!15538 l!956)))))))

(declare-fun b!484476 () Bool)

(assert (=> b!484476 (= e!285197 (isStrictlySorted!422 (t!15538 l!956)))))

(assert (= (and d!76953 (not res!288645)) b!484475))

(assert (= (and b!484475 res!288646) b!484476))

(assert (=> b!484476 m!464393))

(assert (=> start!43878 d!76953))

(declare-fun e!285241 () List!9325)

(declare-fun b!484537 () Bool)

(assert (=> b!484537 (= e!285241 (insertStrictlySorted!242 (t!15538 l!956) key!251 value!166))))

(declare-fun b!484539 () Bool)

(declare-fun res!288677 () Bool)

(declare-fun e!285242 () Bool)

(assert (=> b!484539 (=> (not res!288677) (not e!285242))))

(declare-fun lt!219195 () List!9325)

(assert (=> b!484539 (= res!288677 (containsKey!387 lt!219195 key!251))))

(declare-fun bm!31133 () Bool)

(declare-fun c!58241 () Bool)

(declare-fun call!31138 () List!9325)

(declare-fun $colon$colon!124 (List!9325 tuple2!9298) List!9325)

(assert (=> bm!31133 (= call!31138 ($colon$colon!124 e!285241 (ite c!58241 (h!10177 l!956) (tuple2!9299 key!251 value!166))))))

(declare-fun c!58239 () Bool)

(assert (=> bm!31133 (= c!58239 c!58241)))

(declare-fun d!76955 () Bool)

(assert (=> d!76955 e!285242))

(declare-fun res!288678 () Bool)

(assert (=> d!76955 (=> (not res!288678) (not e!285242))))

(assert (=> d!76955 (= res!288678 (isStrictlySorted!422 lt!219195))))

(declare-fun e!285244 () List!9325)

(assert (=> d!76955 (= lt!219195 e!285244)))

(assert (=> d!76955 (= c!58241 (and ((_ is Cons!9321) l!956) (bvslt (_1!4660 (h!10177 l!956)) key!251)))))

(assert (=> d!76955 (isStrictlySorted!422 l!956)))

(assert (=> d!76955 (= (insertStrictlySorted!242 l!956 key!251 value!166) lt!219195)))

(declare-fun b!484541 () Bool)

(declare-fun e!285243 () List!9325)

(assert (=> b!484541 (= e!285244 e!285243)))

(declare-fun c!58240 () Bool)

(assert (=> b!484541 (= c!58240 (and ((_ is Cons!9321) l!956) (= (_1!4660 (h!10177 l!956)) key!251)))))

(declare-fun bm!31134 () Bool)

(declare-fun call!31136 () List!9325)

(assert (=> bm!31134 (= call!31136 call!31138)))

(declare-fun b!484542 () Bool)

(assert (=> b!484542 (= e!285244 call!31138)))

(declare-fun bm!31135 () Bool)

(declare-fun call!31137 () List!9325)

(assert (=> bm!31135 (= call!31137 call!31136)))

(declare-fun b!484543 () Bool)

(declare-fun contains!2670 (List!9325 tuple2!9298) Bool)

(assert (=> b!484543 (= e!285242 (contains!2670 lt!219195 (tuple2!9299 key!251 value!166)))))

(declare-fun b!484544 () Bool)

(declare-fun c!58238 () Bool)

(assert (=> b!484544 (= c!58238 (and ((_ is Cons!9321) l!956) (bvsgt (_1!4660 (h!10177 l!956)) key!251)))))

(declare-fun e!285240 () List!9325)

(assert (=> b!484544 (= e!285243 e!285240)))

(declare-fun b!484545 () Bool)

(assert (=> b!484545 (= e!285240 call!31137)))

(declare-fun b!484546 () Bool)

(assert (=> b!484546 (= e!285241 (ite c!58240 (t!15538 l!956) (ite c!58238 (Cons!9321 (h!10177 l!956) (t!15538 l!956)) Nil!9322)))))

(declare-fun b!484547 () Bool)

(assert (=> b!484547 (= e!285240 call!31137)))

(declare-fun b!484548 () Bool)

(assert (=> b!484548 (= e!285243 call!31136)))

(assert (= (and d!76955 c!58241) b!484542))

(assert (= (and d!76955 (not c!58241)) b!484541))

(assert (= (and b!484541 c!58240) b!484548))

(assert (= (and b!484541 (not c!58240)) b!484544))

(assert (= (and b!484544 c!58238) b!484545))

(assert (= (and b!484544 (not c!58238)) b!484547))

(assert (= (or b!484545 b!484547) bm!31135))

(assert (= (or b!484548 bm!31135) bm!31134))

(assert (= (or b!484542 bm!31134) bm!31133))

(assert (= (and bm!31133 c!58239) b!484537))

(assert (= (and bm!31133 (not c!58239)) b!484546))

(assert (= (and d!76955 res!288678) b!484539))

(assert (= (and b!484539 res!288677) b!484543))

(declare-fun m!464445 () Bool)

(assert (=> d!76955 m!464445))

(assert (=> d!76955 m!464375))

(declare-fun m!464447 () Bool)

(assert (=> b!484539 m!464447))

(declare-fun m!464449 () Bool)

(assert (=> b!484543 m!464449))

(declare-fun m!464451 () Bool)

(assert (=> bm!31133 m!464451))

(assert (=> b!484537 m!464379))

(assert (=> b!484418 d!76955))

(declare-fun e!285252 () List!9325)

(declare-fun b!484561 () Bool)

(assert (=> b!484561 (= e!285252 (insertStrictlySorted!242 (t!15538 (t!15538 l!956)) key!251 value!166))))

(declare-fun b!484562 () Bool)

(declare-fun res!288679 () Bool)

(declare-fun e!285253 () Bool)

(assert (=> b!484562 (=> (not res!288679) (not e!285253))))

(declare-fun lt!219198 () List!9325)

(assert (=> b!484562 (= res!288679 (containsKey!387 lt!219198 key!251))))

(declare-fun call!31141 () List!9325)

(declare-fun c!58251 () Bool)

(declare-fun bm!31136 () Bool)

(assert (=> bm!31136 (= call!31141 ($colon$colon!124 e!285252 (ite c!58251 (h!10177 (t!15538 l!956)) (tuple2!9299 key!251 value!166))))))

(declare-fun c!58249 () Bool)

(assert (=> bm!31136 (= c!58249 c!58251)))

(declare-fun d!76969 () Bool)

(assert (=> d!76969 e!285253))

(declare-fun res!288680 () Bool)

(assert (=> d!76969 (=> (not res!288680) (not e!285253))))

(assert (=> d!76969 (= res!288680 (isStrictlySorted!422 lt!219198))))

(declare-fun e!285255 () List!9325)

(assert (=> d!76969 (= lt!219198 e!285255)))

(assert (=> d!76969 (= c!58251 (and ((_ is Cons!9321) (t!15538 l!956)) (bvslt (_1!4660 (h!10177 (t!15538 l!956))) key!251)))))

(assert (=> d!76969 (isStrictlySorted!422 (t!15538 l!956))))

(assert (=> d!76969 (= (insertStrictlySorted!242 (t!15538 l!956) key!251 value!166) lt!219198)))

(declare-fun b!484563 () Bool)

(declare-fun e!285254 () List!9325)

(assert (=> b!484563 (= e!285255 e!285254)))

(declare-fun c!58250 () Bool)

(assert (=> b!484563 (= c!58250 (and ((_ is Cons!9321) (t!15538 l!956)) (= (_1!4660 (h!10177 (t!15538 l!956))) key!251)))))

(declare-fun bm!31137 () Bool)

(declare-fun call!31139 () List!9325)

(assert (=> bm!31137 (= call!31139 call!31141)))

(declare-fun b!484564 () Bool)

(assert (=> b!484564 (= e!285255 call!31141)))

(declare-fun bm!31138 () Bool)

(declare-fun call!31140 () List!9325)

(assert (=> bm!31138 (= call!31140 call!31139)))

(declare-fun b!484565 () Bool)

(assert (=> b!484565 (= e!285253 (contains!2670 lt!219198 (tuple2!9299 key!251 value!166)))))

(declare-fun b!484566 () Bool)

(declare-fun c!58248 () Bool)

(assert (=> b!484566 (= c!58248 (and ((_ is Cons!9321) (t!15538 l!956)) (bvsgt (_1!4660 (h!10177 (t!15538 l!956))) key!251)))))

(declare-fun e!285251 () List!9325)

(assert (=> b!484566 (= e!285254 e!285251)))

(declare-fun b!484567 () Bool)

(assert (=> b!484567 (= e!285251 call!31140)))

(declare-fun b!484568 () Bool)

(assert (=> b!484568 (= e!285252 (ite c!58250 (t!15538 (t!15538 l!956)) (ite c!58248 (Cons!9321 (h!10177 (t!15538 l!956)) (t!15538 (t!15538 l!956))) Nil!9322)))))

(declare-fun b!484569 () Bool)

(assert (=> b!484569 (= e!285251 call!31140)))

(declare-fun b!484570 () Bool)

(assert (=> b!484570 (= e!285254 call!31139)))

(assert (= (and d!76969 c!58251) b!484564))

(assert (= (and d!76969 (not c!58251)) b!484563))

(assert (= (and b!484563 c!58250) b!484570))

(assert (= (and b!484563 (not c!58250)) b!484566))

(assert (= (and b!484566 c!58248) b!484567))

(assert (= (and b!484566 (not c!58248)) b!484569))

(assert (= (or b!484567 b!484569) bm!31138))

(assert (= (or b!484570 bm!31138) bm!31137))

(assert (= (or b!484564 bm!31137) bm!31136))

(assert (= (and bm!31136 c!58249) b!484561))

(assert (= (and bm!31136 (not c!58249)) b!484568))

(assert (= (and d!76969 res!288680) b!484562))

(assert (= (and b!484562 res!288679) b!484565))

(declare-fun m!464453 () Bool)

(assert (=> d!76969 m!464453))

(assert (=> d!76969 m!464393))

(declare-fun m!464455 () Bool)

(assert (=> b!484562 m!464455))

(declare-fun m!464457 () Bool)

(assert (=> b!484565 m!464457))

(declare-fun m!464459 () Bool)

(assert (=> bm!31136 m!464459))

(declare-fun m!464461 () Bool)

(assert (=> b!484561 m!464461))

(assert (=> b!484417 d!76969))

(declare-fun d!76971 () Bool)

(declare-fun size!15461 (List!9325) Int)

(assert (=> d!76971 (= (length!11 (insertStrictlySorted!242 (t!15538 l!956) key!251 value!166)) (size!15461 (insertStrictlySorted!242 (t!15538 l!956) key!251 value!166)))))

(declare-fun bs!15397 () Bool)

(assert (= bs!15397 d!76971))

(assert (=> bs!15397 m!464379))

(declare-fun m!464463 () Bool)

(assert (=> bs!15397 m!464463))

(assert (=> b!484417 d!76971))

(declare-fun d!76973 () Bool)

(assert (=> d!76973 (= (length!11 lt!219178) (size!15461 lt!219178))))

(declare-fun bs!15398 () Bool)

(assert (= bs!15398 d!76973))

(declare-fun m!464465 () Bool)

(assert (=> bs!15398 m!464465))

(assert (=> b!484417 d!76973))

(declare-fun d!76975 () Bool)

(assert (=> d!76975 (= (length!11 (insertStrictlySorted!242 (t!15538 l!956) key!251 value!166)) (+ (length!11 (t!15538 l!956)) 1))))

(declare-fun lt!219204 () Unit!14164)

(declare-fun choose!1391 (List!9325 (_ BitVec 64) B!1142) Unit!14164)

(assert (=> d!76975 (= lt!219204 (choose!1391 (t!15538 l!956) key!251 value!166))))

(assert (=> d!76975 (isStrictlySorted!422 (t!15538 l!956))))

(assert (=> d!76975 (= (lemmaAddNewKeyIncrementSize!4 (t!15538 l!956) key!251 value!166) lt!219204)))

(declare-fun bs!15400 () Bool)

(assert (= bs!15400 d!76975))

(assert (=> bs!15400 m!464393))

(declare-fun m!464489 () Bool)

(assert (=> bs!15400 m!464489))

(assert (=> bs!15400 m!464379))

(assert (=> bs!15400 m!464383))

(assert (=> bs!15400 m!464379))

(assert (=> bs!15400 m!464381))

(assert (=> b!484417 d!76975))

(declare-fun d!76985 () Bool)

(assert (=> d!76985 (= (length!11 (t!15538 l!956)) (size!15461 (t!15538 l!956)))))

(declare-fun bs!15401 () Bool)

(assert (= bs!15401 d!76985))

(declare-fun m!464491 () Bool)

(assert (=> bs!15401 m!464491))

(assert (=> b!484417 d!76985))

(declare-fun d!76987 () Bool)

(assert (=> d!76987 (= (length!11 l!956) (size!15461 l!956))))

(declare-fun bs!15402 () Bool)

(assert (= bs!15402 d!76987))

(declare-fun m!464495 () Bool)

(assert (=> bs!15402 m!464495))

(assert (=> b!484417 d!76987))

(declare-fun b!484615 () Bool)

(declare-fun e!285279 () Bool)

(declare-fun tp!43561 () Bool)

(assert (=> b!484615 (= e!285279 (and tp_is_empty!13951 tp!43561))))

(assert (=> b!484419 (= tp!43552 e!285279)))

(assert (= (and b!484419 ((_ is Cons!9321) (t!15538 l!956))) b!484615))

(check-sat (not b!484565) (not d!76987) (not b!484476) (not b!484562) (not b!484462) (not b!484537) (not bm!31133) (not d!76969) tp_is_empty!13951 (not bm!31136) (not b!484474) (not b!484615) (not d!76975) (not d!76985) (not b!484561) (not d!76971) (not b!484539) (not b!484464) (not d!76955) (not d!76973) (not b!484543))
(check-sat)
(get-model)

(declare-fun d!77011 () Bool)

(assert (=> d!77011 (= ($colon$colon!124 e!285252 (ite c!58251 (h!10177 (t!15538 l!956)) (tuple2!9299 key!251 value!166))) (Cons!9321 (ite c!58251 (h!10177 (t!15538 l!956)) (tuple2!9299 key!251 value!166)) e!285252))))

(assert (=> bm!31136 d!77011))

(declare-fun d!77013 () Bool)

(declare-fun lt!219214 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!214 (List!9325) (InoxSet tuple2!9298))

(assert (=> d!77013 (= lt!219214 (select (content!214 lt!219195) (tuple2!9299 key!251 value!166)))))

(declare-fun e!285299 () Bool)

(assert (=> d!77013 (= lt!219214 e!285299)))

(declare-fun res!288703 () Bool)

(assert (=> d!77013 (=> (not res!288703) (not e!285299))))

(assert (=> d!77013 (= res!288703 ((_ is Cons!9321) lt!219195))))

(assert (=> d!77013 (= (contains!2670 lt!219195 (tuple2!9299 key!251 value!166)) lt!219214)))

(declare-fun b!484644 () Bool)

(declare-fun e!285300 () Bool)

(assert (=> b!484644 (= e!285299 e!285300)))

(declare-fun res!288704 () Bool)

(assert (=> b!484644 (=> res!288704 e!285300)))

(assert (=> b!484644 (= res!288704 (= (h!10177 lt!219195) (tuple2!9299 key!251 value!166)))))

(declare-fun b!484645 () Bool)

(assert (=> b!484645 (= e!285300 (contains!2670 (t!15538 lt!219195) (tuple2!9299 key!251 value!166)))))

(assert (= (and d!77013 res!288703) b!484644))

(assert (= (and b!484644 (not res!288704)) b!484645))

(declare-fun m!464535 () Bool)

(assert (=> d!77013 m!464535))

(declare-fun m!464537 () Bool)

(assert (=> d!77013 m!464537))

(declare-fun m!464539 () Bool)

(assert (=> b!484645 m!464539))

(assert (=> b!484543 d!77013))

(assert (=> b!484464 d!76945))

(declare-fun d!77015 () Bool)

(declare-fun res!288705 () Bool)

(declare-fun e!285301 () Bool)

(assert (=> d!77015 (=> res!288705 e!285301)))

(assert (=> d!77015 (= res!288705 (or ((_ is Nil!9322) lt!219195) ((_ is Nil!9322) (t!15538 lt!219195))))))

(assert (=> d!77015 (= (isStrictlySorted!422 lt!219195) e!285301)))

(declare-fun b!484646 () Bool)

(declare-fun e!285302 () Bool)

(assert (=> b!484646 (= e!285301 e!285302)))

(declare-fun res!288706 () Bool)

(assert (=> b!484646 (=> (not res!288706) (not e!285302))))

(assert (=> b!484646 (= res!288706 (bvslt (_1!4660 (h!10177 lt!219195)) (_1!4660 (h!10177 (t!15538 lt!219195)))))))

(declare-fun b!484647 () Bool)

(assert (=> b!484647 (= e!285302 (isStrictlySorted!422 (t!15538 lt!219195)))))

(assert (= (and d!77015 (not res!288705)) b!484646))

(assert (= (and b!484646 res!288706) b!484647))

(declare-fun m!464541 () Bool)

(assert (=> b!484647 m!464541))

(assert (=> d!76955 d!77015))

(assert (=> d!76955 d!76953))

(declare-fun d!77017 () Bool)

(declare-fun lt!219217 () Int)

(assert (=> d!77017 (>= lt!219217 0)))

(declare-fun e!285305 () Int)

(assert (=> d!77017 (= lt!219217 e!285305)))

(declare-fun c!58272 () Bool)

(assert (=> d!77017 (= c!58272 ((_ is Nil!9322) (t!15538 l!956)))))

(assert (=> d!77017 (= (size!15461 (t!15538 l!956)) lt!219217)))

(declare-fun b!484652 () Bool)

(assert (=> b!484652 (= e!285305 0)))

(declare-fun b!484653 () Bool)

(assert (=> b!484653 (= e!285305 (+ 1 (size!15461 (t!15538 (t!15538 l!956)))))))

(assert (= (and d!77017 c!58272) b!484652))

(assert (= (and d!77017 (not c!58272)) b!484653))

(declare-fun m!464543 () Bool)

(assert (=> b!484653 m!464543))

(assert (=> d!76985 d!77017))

(declare-fun d!77019 () Bool)

(declare-fun res!288707 () Bool)

(declare-fun e!285306 () Bool)

(assert (=> d!77019 (=> res!288707 e!285306)))

(assert (=> d!77019 (= res!288707 (and ((_ is Cons!9321) lt!219198) (= (_1!4660 (h!10177 lt!219198)) key!251)))))

(assert (=> d!77019 (= (containsKey!387 lt!219198 key!251) e!285306)))

(declare-fun b!484654 () Bool)

(declare-fun e!285307 () Bool)

(assert (=> b!484654 (= e!285306 e!285307)))

(declare-fun res!288708 () Bool)

(assert (=> b!484654 (=> (not res!288708) (not e!285307))))

(assert (=> b!484654 (= res!288708 (and (or (not ((_ is Cons!9321) lt!219198)) (bvsle (_1!4660 (h!10177 lt!219198)) key!251)) ((_ is Cons!9321) lt!219198) (bvslt (_1!4660 (h!10177 lt!219198)) key!251)))))

(declare-fun b!484655 () Bool)

(assert (=> b!484655 (= e!285307 (containsKey!387 (t!15538 lt!219198) key!251))))

(assert (= (and d!77019 (not res!288707)) b!484654))

(assert (= (and b!484654 res!288708) b!484655))

(declare-fun m!464545 () Bool)

(assert (=> b!484655 m!464545))

(assert (=> b!484562 d!77019))

(declare-fun d!77021 () Bool)

(declare-fun res!288709 () Bool)

(declare-fun e!285308 () Bool)

(assert (=> d!77021 (=> res!288709 e!285308)))

(assert (=> d!77021 (= res!288709 (and ((_ is Cons!9321) (t!15538 (t!15538 l!956))) (= (_1!4660 (h!10177 (t!15538 (t!15538 l!956)))) key!251)))))

(assert (=> d!77021 (= (containsKey!387 (t!15538 (t!15538 l!956)) key!251) e!285308)))

(declare-fun b!484656 () Bool)

(declare-fun e!285309 () Bool)

(assert (=> b!484656 (= e!285308 e!285309)))

(declare-fun res!288710 () Bool)

(assert (=> b!484656 (=> (not res!288710) (not e!285309))))

(assert (=> b!484656 (= res!288710 (and (or (not ((_ is Cons!9321) (t!15538 (t!15538 l!956)))) (bvsle (_1!4660 (h!10177 (t!15538 (t!15538 l!956)))) key!251)) ((_ is Cons!9321) (t!15538 (t!15538 l!956))) (bvslt (_1!4660 (h!10177 (t!15538 (t!15538 l!956)))) key!251)))))

(declare-fun b!484657 () Bool)

(assert (=> b!484657 (= e!285309 (containsKey!387 (t!15538 (t!15538 (t!15538 l!956))) key!251))))

(assert (= (and d!77021 (not res!288709)) b!484656))

(assert (= (and b!484656 res!288710) b!484657))

(declare-fun m!464547 () Bool)

(assert (=> b!484657 m!464547))

(assert (=> b!484462 d!77021))

(assert (=> d!76975 d!76969))

(assert (=> d!76975 d!76971))

(assert (=> d!76975 d!76951))

(assert (=> d!76975 d!76985))

(declare-fun d!77023 () Bool)

(assert (=> d!77023 (= (length!11 (insertStrictlySorted!242 (t!15538 l!956) key!251 value!166)) (+ (length!11 (t!15538 l!956)) 1))))

(assert (=> d!77023 true))

(declare-fun _$9!26 () Unit!14164)

(assert (=> d!77023 (= (choose!1391 (t!15538 l!956) key!251 value!166) _$9!26)))

(declare-fun bs!15412 () Bool)

(assert (= bs!15412 d!77023))

(assert (=> bs!15412 m!464379))

(assert (=> bs!15412 m!464379))

(assert (=> bs!15412 m!464381))

(assert (=> bs!15412 m!464383))

(assert (=> d!76975 d!77023))

(assert (=> b!484537 d!76969))

(declare-fun d!77025 () Bool)

(declare-fun res!288711 () Bool)

(declare-fun e!285310 () Bool)

(assert (=> d!77025 (=> res!288711 e!285310)))

(assert (=> d!77025 (= res!288711 (and ((_ is Cons!9321) lt!219195) (= (_1!4660 (h!10177 lt!219195)) key!251)))))

(assert (=> d!77025 (= (containsKey!387 lt!219195 key!251) e!285310)))

(declare-fun b!484658 () Bool)

(declare-fun e!285311 () Bool)

(assert (=> b!484658 (= e!285310 e!285311)))

(declare-fun res!288712 () Bool)

(assert (=> b!484658 (=> (not res!288712) (not e!285311))))

(assert (=> b!484658 (= res!288712 (and (or (not ((_ is Cons!9321) lt!219195)) (bvsle (_1!4660 (h!10177 lt!219195)) key!251)) ((_ is Cons!9321) lt!219195) (bvslt (_1!4660 (h!10177 lt!219195)) key!251)))))

(declare-fun b!484659 () Bool)

(assert (=> b!484659 (= e!285311 (containsKey!387 (t!15538 lt!219195) key!251))))

(assert (= (and d!77025 (not res!288711)) b!484658))

(assert (= (and b!484658 res!288712) b!484659))

(declare-fun m!464549 () Bool)

(assert (=> b!484659 m!464549))

(assert (=> b!484539 d!77025))

(declare-fun d!77027 () Bool)

(declare-fun res!288713 () Bool)

(declare-fun e!285312 () Bool)

(assert (=> d!77027 (=> res!288713 e!285312)))

(assert (=> d!77027 (= res!288713 (or ((_ is Nil!9322) lt!219198) ((_ is Nil!9322) (t!15538 lt!219198))))))

(assert (=> d!77027 (= (isStrictlySorted!422 lt!219198) e!285312)))

(declare-fun b!484660 () Bool)

(declare-fun e!285313 () Bool)

(assert (=> b!484660 (= e!285312 e!285313)))

(declare-fun res!288714 () Bool)

(assert (=> b!484660 (=> (not res!288714) (not e!285313))))

(assert (=> b!484660 (= res!288714 (bvslt (_1!4660 (h!10177 lt!219198)) (_1!4660 (h!10177 (t!15538 lt!219198)))))))

(declare-fun b!484661 () Bool)

(assert (=> b!484661 (= e!285313 (isStrictlySorted!422 (t!15538 lt!219198)))))

(assert (= (and d!77027 (not res!288713)) b!484660))

(assert (= (and b!484660 res!288714) b!484661))

(declare-fun m!464551 () Bool)

(assert (=> b!484661 m!464551))

(assert (=> d!76969 d!77027))

(assert (=> d!76969 d!76951))

(declare-fun lt!219218 () Bool)

(declare-fun d!77029 () Bool)

(assert (=> d!77029 (= lt!219218 (select (content!214 lt!219198) (tuple2!9299 key!251 value!166)))))

(declare-fun e!285314 () Bool)

(assert (=> d!77029 (= lt!219218 e!285314)))

(declare-fun res!288715 () Bool)

(assert (=> d!77029 (=> (not res!288715) (not e!285314))))

(assert (=> d!77029 (= res!288715 ((_ is Cons!9321) lt!219198))))

(assert (=> d!77029 (= (contains!2670 lt!219198 (tuple2!9299 key!251 value!166)) lt!219218)))

(declare-fun b!484662 () Bool)

(declare-fun e!285315 () Bool)

(assert (=> b!484662 (= e!285314 e!285315)))

(declare-fun res!288716 () Bool)

(assert (=> b!484662 (=> res!288716 e!285315)))

(assert (=> b!484662 (= res!288716 (= (h!10177 lt!219198) (tuple2!9299 key!251 value!166)))))

(declare-fun b!484663 () Bool)

(assert (=> b!484663 (= e!285315 (contains!2670 (t!15538 lt!219198) (tuple2!9299 key!251 value!166)))))

(assert (= (and d!77029 res!288715) b!484662))

(assert (= (and b!484662 (not res!288716)) b!484663))

(declare-fun m!464553 () Bool)

(assert (=> d!77029 m!464553))

(declare-fun m!464555 () Bool)

(assert (=> d!77029 m!464555))

(declare-fun m!464557 () Bool)

(assert (=> b!484663 m!464557))

(assert (=> b!484565 d!77029))

(declare-fun d!77031 () Bool)

(declare-fun lt!219219 () Int)

(assert (=> d!77031 (>= lt!219219 0)))

(declare-fun e!285316 () Int)

(assert (=> d!77031 (= lt!219219 e!285316)))

(declare-fun c!58273 () Bool)

(assert (=> d!77031 (= c!58273 ((_ is Nil!9322) l!956))))

(assert (=> d!77031 (= (size!15461 l!956) lt!219219)))

(declare-fun b!484664 () Bool)

(assert (=> b!484664 (= e!285316 0)))

(declare-fun b!484665 () Bool)

(assert (=> b!484665 (= e!285316 (+ 1 (size!15461 (t!15538 l!956))))))

(assert (= (and d!77031 c!58273) b!484664))

(assert (= (and d!77031 (not c!58273)) b!484665))

(assert (=> b!484665 m!464491))

(assert (=> d!76987 d!77031))

(declare-fun d!77033 () Bool)

(assert (=> d!77033 (= ($colon$colon!124 e!285241 (ite c!58241 (h!10177 l!956) (tuple2!9299 key!251 value!166))) (Cons!9321 (ite c!58241 (h!10177 l!956) (tuple2!9299 key!251 value!166)) e!285241))))

(assert (=> bm!31133 d!77033))

(declare-fun d!77035 () Bool)

(declare-fun lt!219220 () Int)

(assert (=> d!77035 (>= lt!219220 0)))

(declare-fun e!285317 () Int)

(assert (=> d!77035 (= lt!219220 e!285317)))

(declare-fun c!58274 () Bool)

(assert (=> d!77035 (= c!58274 ((_ is Nil!9322) lt!219178))))

(assert (=> d!77035 (= (size!15461 lt!219178) lt!219220)))

(declare-fun b!484666 () Bool)

(assert (=> b!484666 (= e!285317 0)))

(declare-fun b!484667 () Bool)

(assert (=> b!484667 (= e!285317 (+ 1 (size!15461 (t!15538 lt!219178))))))

(assert (= (and d!77035 c!58274) b!484666))

(assert (= (and d!77035 (not c!58274)) b!484667))

(declare-fun m!464559 () Bool)

(assert (=> b!484667 m!464559))

(assert (=> d!76973 d!77035))

(declare-fun d!77037 () Bool)

(declare-fun res!288717 () Bool)

(declare-fun e!285318 () Bool)

(assert (=> d!77037 (=> res!288717 e!285318)))

(assert (=> d!77037 (= res!288717 (or ((_ is Nil!9322) (t!15538 (t!15538 l!956))) ((_ is Nil!9322) (t!15538 (t!15538 (t!15538 l!956))))))))

(assert (=> d!77037 (= (isStrictlySorted!422 (t!15538 (t!15538 l!956))) e!285318)))

(declare-fun b!484668 () Bool)

(declare-fun e!285319 () Bool)

(assert (=> b!484668 (= e!285318 e!285319)))

(declare-fun res!288718 () Bool)

(assert (=> b!484668 (=> (not res!288718) (not e!285319))))

(assert (=> b!484668 (= res!288718 (bvslt (_1!4660 (h!10177 (t!15538 (t!15538 l!956)))) (_1!4660 (h!10177 (t!15538 (t!15538 (t!15538 l!956)))))))))

(declare-fun b!484669 () Bool)

(assert (=> b!484669 (= e!285319 (isStrictlySorted!422 (t!15538 (t!15538 (t!15538 l!956)))))))

(assert (= (and d!77037 (not res!288717)) b!484668))

(assert (= (and b!484668 res!288718) b!484669))

(declare-fun m!464561 () Bool)

(assert (=> b!484669 m!464561))

(assert (=> b!484474 d!77037))

(declare-fun d!77039 () Bool)

(declare-fun lt!219221 () Int)

(assert (=> d!77039 (>= lt!219221 0)))

(declare-fun e!285320 () Int)

(assert (=> d!77039 (= lt!219221 e!285320)))

(declare-fun c!58275 () Bool)

(assert (=> d!77039 (= c!58275 ((_ is Nil!9322) (insertStrictlySorted!242 (t!15538 l!956) key!251 value!166)))))

(assert (=> d!77039 (= (size!15461 (insertStrictlySorted!242 (t!15538 l!956) key!251 value!166)) lt!219221)))

(declare-fun b!484670 () Bool)

(assert (=> b!484670 (= e!285320 0)))

(declare-fun b!484671 () Bool)

(assert (=> b!484671 (= e!285320 (+ 1 (size!15461 (t!15538 (insertStrictlySorted!242 (t!15538 l!956) key!251 value!166)))))))

(assert (= (and d!77039 c!58275) b!484670))

(assert (= (and d!77039 (not c!58275)) b!484671))

(declare-fun m!464563 () Bool)

(assert (=> b!484671 m!464563))

(assert (=> d!76971 d!77039))

(declare-fun e!285322 () List!9325)

(declare-fun b!484672 () Bool)

(assert (=> b!484672 (= e!285322 (insertStrictlySorted!242 (t!15538 (t!15538 (t!15538 l!956))) key!251 value!166))))

(declare-fun b!484673 () Bool)

(declare-fun res!288719 () Bool)

(declare-fun e!285323 () Bool)

(assert (=> b!484673 (=> (not res!288719) (not e!285323))))

(declare-fun lt!219222 () List!9325)

(assert (=> b!484673 (= res!288719 (containsKey!387 lt!219222 key!251))))

(declare-fun c!58279 () Bool)

(declare-fun bm!31157 () Bool)

(declare-fun call!31162 () List!9325)

(assert (=> bm!31157 (= call!31162 ($colon$colon!124 e!285322 (ite c!58279 (h!10177 (t!15538 (t!15538 l!956))) (tuple2!9299 key!251 value!166))))))

(declare-fun c!58277 () Bool)

(assert (=> bm!31157 (= c!58277 c!58279)))

(declare-fun d!77041 () Bool)

(assert (=> d!77041 e!285323))

(declare-fun res!288720 () Bool)

(assert (=> d!77041 (=> (not res!288720) (not e!285323))))

(assert (=> d!77041 (= res!288720 (isStrictlySorted!422 lt!219222))))

(declare-fun e!285325 () List!9325)

(assert (=> d!77041 (= lt!219222 e!285325)))

(assert (=> d!77041 (= c!58279 (and ((_ is Cons!9321) (t!15538 (t!15538 l!956))) (bvslt (_1!4660 (h!10177 (t!15538 (t!15538 l!956)))) key!251)))))

(assert (=> d!77041 (isStrictlySorted!422 (t!15538 (t!15538 l!956)))))

(assert (=> d!77041 (= (insertStrictlySorted!242 (t!15538 (t!15538 l!956)) key!251 value!166) lt!219222)))

(declare-fun b!484674 () Bool)

(declare-fun e!285324 () List!9325)

(assert (=> b!484674 (= e!285325 e!285324)))

(declare-fun c!58278 () Bool)

(assert (=> b!484674 (= c!58278 (and ((_ is Cons!9321) (t!15538 (t!15538 l!956))) (= (_1!4660 (h!10177 (t!15538 (t!15538 l!956)))) key!251)))))

(declare-fun bm!31158 () Bool)

(declare-fun call!31160 () List!9325)

(assert (=> bm!31158 (= call!31160 call!31162)))

(declare-fun b!484675 () Bool)

(assert (=> b!484675 (= e!285325 call!31162)))

(declare-fun bm!31159 () Bool)

(declare-fun call!31161 () List!9325)

(assert (=> bm!31159 (= call!31161 call!31160)))

(declare-fun b!484676 () Bool)

(assert (=> b!484676 (= e!285323 (contains!2670 lt!219222 (tuple2!9299 key!251 value!166)))))

(declare-fun b!484677 () Bool)

(declare-fun c!58276 () Bool)

(assert (=> b!484677 (= c!58276 (and ((_ is Cons!9321) (t!15538 (t!15538 l!956))) (bvsgt (_1!4660 (h!10177 (t!15538 (t!15538 l!956)))) key!251)))))

(declare-fun e!285321 () List!9325)

(assert (=> b!484677 (= e!285324 e!285321)))

(declare-fun b!484678 () Bool)

(assert (=> b!484678 (= e!285321 call!31161)))

(declare-fun b!484679 () Bool)

(assert (=> b!484679 (= e!285322 (ite c!58278 (t!15538 (t!15538 (t!15538 l!956))) (ite c!58276 (Cons!9321 (h!10177 (t!15538 (t!15538 l!956))) (t!15538 (t!15538 (t!15538 l!956)))) Nil!9322)))))

(declare-fun b!484680 () Bool)

(assert (=> b!484680 (= e!285321 call!31161)))

(declare-fun b!484681 () Bool)

(assert (=> b!484681 (= e!285324 call!31160)))

(assert (= (and d!77041 c!58279) b!484675))

(assert (= (and d!77041 (not c!58279)) b!484674))

(assert (= (and b!484674 c!58278) b!484681))

(assert (= (and b!484674 (not c!58278)) b!484677))

(assert (= (and b!484677 c!58276) b!484678))

(assert (= (and b!484677 (not c!58276)) b!484680))

(assert (= (or b!484678 b!484680) bm!31159))

(assert (= (or b!484681 bm!31159) bm!31158))

(assert (= (or b!484675 bm!31158) bm!31157))

(assert (= (and bm!31157 c!58277) b!484672))

(assert (= (and bm!31157 (not c!58277)) b!484679))

(assert (= (and d!77041 res!288720) b!484673))

(assert (= (and b!484673 res!288719) b!484676))

(declare-fun m!464565 () Bool)

(assert (=> d!77041 m!464565))

(assert (=> d!77041 m!464441))

(declare-fun m!464567 () Bool)

(assert (=> b!484673 m!464567))

(declare-fun m!464569 () Bool)

(assert (=> b!484676 m!464569))

(declare-fun m!464571 () Bool)

(assert (=> bm!31157 m!464571))

(declare-fun m!464573 () Bool)

(assert (=> b!484672 m!464573))

(assert (=> b!484561 d!77041))

(assert (=> b!484476 d!76951))

(declare-fun b!484682 () Bool)

(declare-fun e!285326 () Bool)

(declare-fun tp!43568 () Bool)

(assert (=> b!484682 (= e!285326 (and tp_is_empty!13951 tp!43568))))

(assert (=> b!484615 (= tp!43561 e!285326)))

(assert (= (and b!484615 ((_ is Cons!9321) (t!15538 (t!15538 l!956)))) b!484682))

(check-sat (not d!77029) (not b!484653) (not b!484676) (not b!484663) (not b!484669) (not bm!31157) tp_is_empty!13951 (not b!484667) (not b!484682) (not b!484655) (not d!77023) (not b!484661) (not b!484665) (not b!484645) (not b!484673) (not b!484672) (not b!484659) (not b!484657) (not b!484647) (not b!484671) (not d!77041) (not d!77013))
(check-sat)
