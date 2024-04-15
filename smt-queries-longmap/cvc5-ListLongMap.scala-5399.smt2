; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72018 () Bool)

(assert start!72018)

(declare-fun b!836268 () Bool)

(declare-fun e!466560 () Bool)

(declare-fun tp_is_empty!15269 () Bool)

(declare-fun tp!47465 () Bool)

(assert (=> b!836268 (= e!466560 (and tp_is_empty!15269 tp!47465))))

(declare-fun res!568983 () Bool)

(declare-fun e!466562 () Bool)

(assert (=> start!72018 (=> (not res!568983) (not e!466562))))

(declare-datatypes ((B!1200 0))(
  ( (B!1201 (val!7682 Int)) )
))
(declare-datatypes ((tuple2!10232 0))(
  ( (tuple2!10233 (_1!5127 (_ BitVec 64)) (_2!5127 B!1200)) )
))
(declare-datatypes ((List!15988 0))(
  ( (Nil!15985) (Cons!15984 (h!17115 tuple2!10232) (t!22350 List!15988)) )
))
(declare-fun l!390 () List!15988)

(declare-fun isStrictlySorted!453 (List!15988) Bool)

(assert (=> start!72018 (= res!568983 (isStrictlySorted!453 l!390))))

(assert (=> start!72018 e!466562))

(assert (=> start!72018 e!466560))

(declare-fun b!836265 () Bool)

(declare-fun res!568982 () Bool)

(assert (=> b!836265 (=> (not res!568982) (not e!466562))))

(assert (=> b!836265 (= res!568982 (is-Cons!15984 l!390))))

(declare-fun b!836267 () Bool)

(declare-fun e!466561 () Bool)

(declare-datatypes ((List!15989 0))(
  ( (Nil!15986) (Cons!15985 (h!17116 (_ BitVec 64)) (t!22351 List!15989)) )
))
(declare-fun lt!380180 () List!15989)

(declare-fun length!21 (List!15989) Int)

(declare-fun length!22 (List!15988) Int)

(assert (=> b!836267 (= e!466561 (not (= (length!21 lt!380180) (length!22 l!390))))))

(declare-fun b!836266 () Bool)

(assert (=> b!836266 (= e!466562 e!466561)))

(declare-fun res!568984 () Bool)

(assert (=> b!836266 (=> res!568984 e!466561)))

(declare-fun isStrictlySortedLong!0 (List!15989) Bool)

(assert (=> b!836266 (= res!568984 (not (isStrictlySortedLong!0 lt!380180)))))

(declare-fun getKeysList!6 (List!15988) List!15989)

(assert (=> b!836266 (= lt!380180 (Cons!15985 (_1!5127 (h!17115 l!390)) (getKeysList!6 (t!22350 l!390))))))

(assert (= (and start!72018 res!568983) b!836265))

(assert (= (and b!836265 res!568982) b!836266))

(assert (= (and b!836266 (not res!568984)) b!836267))

(assert (= (and start!72018 (is-Cons!15984 l!390)) b!836268))

(declare-fun m!780979 () Bool)

(assert (=> start!72018 m!780979))

(declare-fun m!780981 () Bool)

(assert (=> b!836267 m!780981))

(declare-fun m!780983 () Bool)

(assert (=> b!836267 m!780983))

(declare-fun m!780985 () Bool)

(assert (=> b!836266 m!780985))

(declare-fun m!780987 () Bool)

(assert (=> b!836266 m!780987))

(push 1)

(assert tp_is_empty!15269)

(assert (not b!836268))

(assert (not b!836267))

(assert (not start!72018))

(assert (not b!836266))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107411 () Bool)

(declare-fun size!22880 (List!15989) Int)

(assert (=> d!107411 (= (length!21 lt!380180) (size!22880 lt!380180))))

(declare-fun bs!23456 () Bool)

(assert (= bs!23456 d!107411))

(declare-fun m!780993 () Bool)

(assert (=> bs!23456 m!780993))

(assert (=> b!836267 d!107411))

(declare-fun d!107415 () Bool)

(declare-fun size!22882 (List!15988) Int)

(assert (=> d!107415 (= (length!22 l!390) (size!22882 l!390))))

(declare-fun bs!23457 () Bool)

(assert (= bs!23457 d!107415))

(declare-fun m!780995 () Bool)

(assert (=> bs!23457 m!780995))

(assert (=> b!836267 d!107415))

(declare-fun d!107417 () Bool)

(declare-fun res!568995 () Bool)

(declare-fun e!466573 () Bool)

(assert (=> d!107417 (=> res!568995 e!466573)))

(assert (=> d!107417 (= res!568995 (or (is-Nil!15985 l!390) (is-Nil!15985 (t!22350 l!390))))))

(assert (=> d!107417 (= (isStrictlySorted!453 l!390) e!466573)))

(declare-fun b!836279 () Bool)

(declare-fun e!466574 () Bool)

(assert (=> b!836279 (= e!466573 e!466574)))

(declare-fun res!568996 () Bool)

(assert (=> b!836279 (=> (not res!568996) (not e!466574))))

(assert (=> b!836279 (= res!568996 (bvslt (_1!5127 (h!17115 l!390)) (_1!5127 (h!17115 (t!22350 l!390)))))))

(declare-fun b!836280 () Bool)

(assert (=> b!836280 (= e!466574 (isStrictlySorted!453 (t!22350 l!390)))))

(assert (= (and d!107417 (not res!568995)) b!836279))

(assert (= (and b!836279 res!568996) b!836280))

(declare-fun m!781003 () Bool)

(assert (=> b!836280 m!781003))

(assert (=> start!72018 d!107417))

(declare-fun d!107427 () Bool)

(declare-fun res!569013 () Bool)

(declare-fun e!466591 () Bool)

(assert (=> d!107427 (=> res!569013 e!466591)))

(assert (=> d!107427 (= res!569013 (or (is-Nil!15986 lt!380180) (is-Nil!15986 (t!22351 lt!380180))))))

(assert (=> d!107427 (= (isStrictlySortedLong!0 lt!380180) e!466591)))

(declare-fun b!836297 () Bool)

(declare-fun e!466592 () Bool)

(assert (=> b!836297 (= e!466591 e!466592)))

(declare-fun res!569014 () Bool)

(assert (=> b!836297 (=> (not res!569014) (not e!466592))))

(assert (=> b!836297 (= res!569014 (bvslt (h!17116 lt!380180) (h!17116 (t!22351 lt!380180))))))

(declare-fun b!836298 () Bool)

(assert (=> b!836298 (= e!466592 (isStrictlySortedLong!0 (t!22351 lt!380180)))))

(assert (= (and d!107427 (not res!569013)) b!836297))

(assert (= (and b!836297 res!569014) b!836298))

(declare-fun m!781009 () Bool)

(assert (=> b!836298 m!781009))

(assert (=> b!836266 d!107427))

(declare-fun d!107433 () Bool)

(declare-fun e!466609 () Bool)

(assert (=> d!107433 e!466609))

(declare-fun res!569023 () Bool)

(assert (=> d!107433 (=> (not res!569023) (not e!466609))))

(declare-fun lt!380189 () List!15989)

(assert (=> d!107433 (= res!569023 (isStrictlySortedLong!0 lt!380189))))

(declare-fun e!466610 () List!15989)

(assert (=> d!107433 (= lt!380189 e!466610)))

(declare-fun c!90993 () Bool)

(assert (=> d!107433 (= c!90993 (is-Cons!15984 (t!22350 l!390)))))

(assert (=> d!107433 (isStrictlySorted!453 (t!22350 l!390))))

(assert (=> d!107433 (= (getKeysList!6 (t!22350 l!390)) lt!380189)))

(declare-fun b!836325 () Bool)

(assert (=> b!836325 (= e!466610 (Cons!15985 (_1!5127 (h!17115 (t!22350 l!390))) (getKeysList!6 (t!22350 (t!22350 l!390)))))))

(declare-fun b!836326 () Bool)

(assert (=> b!836326 (= e!466610 Nil!15986)))

(declare-fun b!836327 () Bool)

(assert (=> b!836327 (= e!466609 (= (length!21 lt!380189) (length!22 (t!22350 l!390))))))

(assert (= (and d!107433 c!90993) b!836325))

(assert (= (and d!107433 (not c!90993)) b!836326))

(assert (= (and d!107433 res!569023) b!836327))

(declare-fun m!781029 () Bool)

(assert (=> d!107433 m!781029))

(assert (=> d!107433 m!781003))

(declare-fun m!781031 () Bool)

(assert (=> b!836325 m!781031))

(declare-fun m!781033 () Bool)

(assert (=> b!836327 m!781033))

(declare-fun m!781035 () Bool)

(assert (=> b!836327 m!781035))

(assert (=> b!836266 d!107433))

(declare-fun b!836335 () Bool)

(declare-fun e!466616 () Bool)

(declare-fun tp!47471 () Bool)

(assert (=> b!836335 (= e!466616 (and tp_is_empty!15269 tp!47471))))

(assert (=> b!836268 (= tp!47465 e!466616)))

(assert (= (and b!836268 (is-Cons!15984 (t!22350 l!390))) b!836335))

(push 1)

(assert (not d!107433))

(assert tp_is_empty!15269)

(assert (not b!836327))

(assert (not b!836280))

(assert (not d!107411))

(assert (not b!836298))

(assert (not b!836335))

(assert (not b!836325))

(assert (not d!107415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107453 () Bool)

(assert (=> d!107453 (= (length!21 lt!380189) (size!22880 lt!380189))))

(declare-fun bs!23462 () Bool)

(assert (= bs!23462 d!107453))

(declare-fun m!781057 () Bool)

(assert (=> bs!23462 m!781057))

(assert (=> b!836327 d!107453))

(declare-fun d!107455 () Bool)

(assert (=> d!107455 (= (length!22 (t!22350 l!390)) (size!22882 (t!22350 l!390)))))

(declare-fun bs!23463 () Bool)

(assert (= bs!23463 d!107455))

(declare-fun m!781059 () Bool)

(assert (=> bs!23463 m!781059))

(assert (=> b!836327 d!107455))

(declare-fun d!107457 () Bool)

(declare-fun res!569037 () Bool)

(declare-fun e!466641 () Bool)

(assert (=> d!107457 (=> res!569037 e!466641)))

(assert (=> d!107457 (= res!569037 (or (is-Nil!15986 lt!380189) (is-Nil!15986 (t!22351 lt!380189))))))

(assert (=> d!107457 (= (isStrictlySortedLong!0 lt!380189) e!466641)))

(declare-fun b!836369 () Bool)

(declare-fun e!466642 () Bool)

(assert (=> b!836369 (= e!466641 e!466642)))

(declare-fun res!569038 () Bool)

(assert (=> b!836369 (=> (not res!569038) (not e!466642))))

(assert (=> b!836369 (= res!569038 (bvslt (h!17116 lt!380189) (h!17116 (t!22351 lt!380189))))))

(declare-fun b!836370 () Bool)

(assert (=> b!836370 (= e!466642 (isStrictlySortedLong!0 (t!22351 lt!380189)))))

(assert (= (and d!107457 (not res!569037)) b!836369))

(assert (= (and b!836369 res!569038) b!836370))

(declare-fun m!781061 () Bool)

(assert (=> b!836370 m!781061))

(assert (=> d!107433 d!107457))

(declare-fun d!107459 () Bool)

(declare-fun res!569039 () Bool)

(declare-fun e!466643 () Bool)

(assert (=> d!107459 (=> res!569039 e!466643)))

(assert (=> d!107459 (= res!569039 (or (is-Nil!15985 (t!22350 l!390)) (is-Nil!15985 (t!22350 (t!22350 l!390)))))))

(assert (=> d!107459 (= (isStrictlySorted!453 (t!22350 l!390)) e!466643)))

(declare-fun b!836371 () Bool)

(declare-fun e!466644 () Bool)

(assert (=> b!836371 (= e!466643 e!466644)))

(declare-fun res!569040 () Bool)

(assert (=> b!836371 (=> (not res!569040) (not e!466644))))

(assert (=> b!836371 (= res!569040 (bvslt (_1!5127 (h!17115 (t!22350 l!390))) (_1!5127 (h!17115 (t!22350 (t!22350 l!390))))))))

(declare-fun b!836372 () Bool)

(assert (=> b!836372 (= e!466644 (isStrictlySorted!453 (t!22350 (t!22350 l!390))))))

(assert (= (and d!107459 (not res!569039)) b!836371))

(assert (= (and b!836371 res!569040) b!836372))

(declare-fun m!781063 () Bool)

(assert (=> b!836372 m!781063))

(assert (=> d!107433 d!107459))

(declare-fun d!107461 () Bool)

(declare-fun e!466645 () Bool)

(assert (=> d!107461 e!466645))

(declare-fun res!569041 () Bool)

(assert (=> d!107461 (=> (not res!569041) (not e!466645))))

(declare-fun lt!380197 () List!15989)

(assert (=> d!107461 (= res!569041 (isStrictlySortedLong!0 lt!380197))))

(declare-fun e!466646 () List!15989)

(assert (=> d!107461 (= lt!380197 e!466646)))

(declare-fun c!91001 () Bool)

(assert (=> d!107461 (= c!91001 (is-Cons!15984 (t!22350 (t!22350 l!390))))))

(assert (=> d!107461 (isStrictlySorted!453 (t!22350 (t!22350 l!390)))))

(assert (=> d!107461 (= (getKeysList!6 (t!22350 (t!22350 l!390))) lt!380197)))

(declare-fun b!836373 () Bool)

(assert (=> b!836373 (= e!466646 (Cons!15985 (_1!5127 (h!17115 (t!22350 (t!22350 l!390)))) (getKeysList!6 (t!22350 (t!22350 (t!22350 l!390))))))))

(declare-fun b!836374 () Bool)

(assert (=> b!836374 (= e!466646 Nil!15986)))

(declare-fun b!836375 () Bool)

(assert (=> b!836375 (= e!466645 (= (length!21 lt!380197) (length!22 (t!22350 (t!22350 l!390)))))))

(assert (= (and d!107461 c!91001) b!836373))

(assert (= (and d!107461 (not c!91001)) b!836374))

(assert (= (and d!107461 res!569041) b!836375))

(declare-fun m!781065 () Bool)

(assert (=> d!107461 m!781065))

(assert (=> d!107461 m!781063))

(declare-fun m!781067 () Bool)

(assert (=> b!836373 m!781067))

(declare-fun m!781069 () Bool)

(assert (=> b!836375 m!781069))

(declare-fun m!781071 () Bool)

(assert (=> b!836375 m!781071))

(assert (=> b!836325 d!107461))

(declare-fun d!107463 () Bool)

(declare-fun lt!380200 () Int)

(assert (=> d!107463 (>= lt!380200 0)))

(declare-fun e!466649 () Int)

(assert (=> d!107463 (= lt!380200 e!466649)))

(declare-fun c!91004 () Bool)

(assert (=> d!107463 (= c!91004 (is-Nil!15985 l!390))))

(assert (=> d!107463 (= (size!22882 l!390) lt!380200)))

(declare-fun b!836380 () Bool)

(assert (=> b!836380 (= e!466649 0)))

(declare-fun b!836381 () Bool)

(assert (=> b!836381 (= e!466649 (+ 1 (size!22882 (t!22350 l!390))))))

(assert (= (and d!107463 c!91004) b!836380))

(assert (= (and d!107463 (not c!91004)) b!836381))

(assert (=> b!836381 m!781059))

(assert (=> d!107415 d!107463))

(assert (=> b!836280 d!107459))

(declare-fun d!107465 () Bool)

(declare-fun res!569042 () Bool)

(declare-fun e!466650 () Bool)

(assert (=> d!107465 (=> res!569042 e!466650)))

(assert (=> d!107465 (= res!569042 (or (is-Nil!15986 (t!22351 lt!380180)) (is-Nil!15986 (t!22351 (t!22351 lt!380180)))))))

(assert (=> d!107465 (= (isStrictlySortedLong!0 (t!22351 lt!380180)) e!466650)))

(declare-fun b!836382 () Bool)

(declare-fun e!466651 () Bool)

(assert (=> b!836382 (= e!466650 e!466651)))

(declare-fun res!569043 () Bool)

(assert (=> b!836382 (=> (not res!569043) (not e!466651))))

(assert (=> b!836382 (= res!569043 (bvslt (h!17116 (t!22351 lt!380180)) (h!17116 (t!22351 (t!22351 lt!380180)))))))

(declare-fun b!836383 () Bool)

(assert (=> b!836383 (= e!466651 (isStrictlySortedLong!0 (t!22351 (t!22351 lt!380180))))))

(assert (= (and d!107465 (not res!569042)) b!836382))

(assert (= (and b!836382 res!569043) b!836383))

(declare-fun m!781073 () Bool)

(assert (=> b!836383 m!781073))

(assert (=> b!836298 d!107465))

(declare-fun d!107467 () Bool)

(declare-fun lt!380203 () Int)

(assert (=> d!107467 (>= lt!380203 0)))

(declare-fun e!466654 () Int)

(assert (=> d!107467 (= lt!380203 e!466654)))

(declare-fun c!91007 () Bool)

(assert (=> d!107467 (= c!91007 (is-Nil!15986 lt!380180))))

(assert (=> d!107467 (= (size!22880 lt!380180) lt!380203)))

(declare-fun b!836388 () Bool)

(assert (=> b!836388 (= e!466654 0)))

(declare-fun b!836389 () Bool)

(assert (=> b!836389 (= e!466654 (+ 1 (size!22880 (t!22351 lt!380180))))))

(assert (= (and d!107467 c!91007) b!836388))

(assert (= (and d!107467 (not c!91007)) b!836389))

(declare-fun m!781075 () Bool)

(assert (=> b!836389 m!781075))

(assert (=> d!107411 d!107467))

(declare-fun b!836390 () Bool)

(declare-fun e!466655 () Bool)

(declare-fun tp!47476 () Bool)

(assert (=> b!836390 (= e!466655 (and tp_is_empty!15269 tp!47476))))

(assert (=> b!836335 (= tp!47471 e!466655)))

(assert (= (and b!836335 (is-Cons!15984 (t!22350 (t!22350 l!390)))) b!836390))

(push 1)

(assert (not b!836389))

(assert (not b!836383))

(assert (not d!107461))

(assert (not b!836381))

(assert tp_is_empty!15269)

(assert (not b!836375))

(assert (not d!107455))

(assert (not b!836372))

(assert (not b!836373))

(assert (not d!107453))

(assert (not b!836370))

(assert (not b!836390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

