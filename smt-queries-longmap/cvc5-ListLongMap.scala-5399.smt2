; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72204 () Bool)

(assert start!72204)

(declare-fun res!569435 () Bool)

(declare-fun e!467288 () Bool)

(assert (=> start!72204 (=> (not res!569435) (not e!467288))))

(declare-datatypes ((B!1200 0))(
  ( (B!1201 (val!7682 Int)) )
))
(declare-datatypes ((tuple2!10148 0))(
  ( (tuple2!10149 (_1!5085 (_ BitVec 64)) (_2!5085 B!1200)) )
))
(declare-datatypes ((List!15893 0))(
  ( (Nil!15890) (Cons!15889 (h!17026 tuple2!10148) (t!22256 List!15893)) )
))
(declare-fun l!390 () List!15893)

(declare-fun isStrictlySorted!445 (List!15893) Bool)

(assert (=> start!72204 (= res!569435 (isStrictlySorted!445 l!390))))

(assert (=> start!72204 e!467288))

(declare-fun e!467290 () Bool)

(assert (=> start!72204 e!467290))

(declare-fun b!837405 () Bool)

(declare-fun res!569436 () Bool)

(assert (=> b!837405 (=> (not res!569436) (not e!467288))))

(assert (=> b!837405 (= res!569436 (is-Cons!15889 l!390))))

(declare-fun b!837407 () Bool)

(declare-fun e!467289 () Bool)

(declare-datatypes ((List!15894 0))(
  ( (Nil!15891) (Cons!15890 (h!17027 (_ BitVec 64)) (t!22257 List!15894)) )
))
(declare-fun lt!380777 () List!15894)

(declare-fun length!21 (List!15894) Int)

(declare-fun length!22 (List!15893) Int)

(assert (=> b!837407 (= e!467289 (not (= (length!21 lt!380777) (length!22 l!390))))))

(declare-fun b!837408 () Bool)

(declare-fun tp_is_empty!15269 () Bool)

(declare-fun tp!47465 () Bool)

(assert (=> b!837408 (= e!467290 (and tp_is_empty!15269 tp!47465))))

(declare-fun b!837406 () Bool)

(assert (=> b!837406 (= e!467288 e!467289)))

(declare-fun res!569434 () Bool)

(assert (=> b!837406 (=> res!569434 e!467289)))

(declare-fun isStrictlySortedLong!0 (List!15894) Bool)

(assert (=> b!837406 (= res!569434 (not (isStrictlySortedLong!0 lt!380777)))))

(declare-fun getKeysList!6 (List!15893) List!15894)

(assert (=> b!837406 (= lt!380777 (Cons!15890 (_1!5085 (h!17026 l!390)) (getKeysList!6 (t!22256 l!390))))))

(assert (= (and start!72204 res!569435) b!837405))

(assert (= (and b!837405 res!569436) b!837406))

(assert (= (and b!837406 (not res!569434)) b!837407))

(assert (= (and start!72204 (is-Cons!15889 l!390)) b!837408))

(declare-fun m!783021 () Bool)

(assert (=> start!72204 m!783021))

(declare-fun m!783023 () Bool)

(assert (=> b!837407 m!783023))

(declare-fun m!783025 () Bool)

(assert (=> b!837407 m!783025))

(declare-fun m!783027 () Bool)

(assert (=> b!837406 m!783027))

(declare-fun m!783029 () Bool)

(assert (=> b!837406 m!783029))

(push 1)

(assert (not start!72204))

(assert (not b!837408))

(assert tp_is_empty!15269)

(assert (not b!837406))

(assert (not b!837407))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107927 () Bool)

(declare-fun res!569445 () Bool)

(declare-fun e!467299 () Bool)

(assert (=> d!107927 (=> res!569445 e!467299)))

(assert (=> d!107927 (= res!569445 (or (is-Nil!15891 lt!380777) (is-Nil!15891 (t!22257 lt!380777))))))

(assert (=> d!107927 (= (isStrictlySortedLong!0 lt!380777) e!467299)))

(declare-fun b!837417 () Bool)

(declare-fun e!467300 () Bool)

(assert (=> b!837417 (= e!467299 e!467300)))

(declare-fun res!569446 () Bool)

(assert (=> b!837417 (=> (not res!569446) (not e!467300))))

(assert (=> b!837417 (= res!569446 (bvslt (h!17027 lt!380777) (h!17027 (t!22257 lt!380777))))))

(declare-fun b!837418 () Bool)

(assert (=> b!837418 (= e!467300 (isStrictlySortedLong!0 (t!22257 lt!380777)))))

(assert (= (and d!107927 (not res!569445)) b!837417))

(assert (= (and b!837417 res!569446) b!837418))

(declare-fun m!783035 () Bool)

(assert (=> b!837418 m!783035))

(assert (=> b!837406 d!107927))

(declare-fun d!107933 () Bool)

(declare-fun e!467322 () Bool)

(assert (=> d!107933 e!467322))

(declare-fun res!569463 () Bool)

(assert (=> d!107933 (=> (not res!569463) (not e!467322))))

(declare-fun lt!380782 () List!15894)

(assert (=> d!107933 (= res!569463 (isStrictlySortedLong!0 lt!380782))))

(declare-fun e!467321 () List!15894)

(assert (=> d!107933 (= lt!380782 e!467321)))

(declare-fun c!91336 () Bool)

(assert (=> d!107933 (= c!91336 (is-Cons!15889 (t!22256 l!390)))))

(assert (=> d!107933 (isStrictlySorted!445 (t!22256 l!390))))

(assert (=> d!107933 (= (getKeysList!6 (t!22256 l!390)) lt!380782)))

(declare-fun b!837443 () Bool)

(assert (=> b!837443 (= e!467321 (Cons!15890 (_1!5085 (h!17026 (t!22256 l!390))) (getKeysList!6 (t!22256 (t!22256 l!390)))))))

(declare-fun b!837444 () Bool)

(assert (=> b!837444 (= e!467321 Nil!15891)))

(declare-fun b!837445 () Bool)

(assert (=> b!837445 (= e!467322 (= (length!21 lt!380782) (length!22 (t!22256 l!390))))))

(assert (= (and d!107933 c!91336) b!837443))

(assert (= (and d!107933 (not c!91336)) b!837444))

(assert (= (and d!107933 res!569463) b!837445))

(declare-fun m!783043 () Bool)

(assert (=> d!107933 m!783043))

(declare-fun m!783045 () Bool)

(assert (=> d!107933 m!783045))

(declare-fun m!783047 () Bool)

(assert (=> b!837443 m!783047))

(declare-fun m!783049 () Bool)

(assert (=> b!837445 m!783049))

(declare-fun m!783051 () Bool)

(assert (=> b!837445 m!783051))

(assert (=> b!837406 d!107933))

(declare-fun d!107941 () Bool)

(declare-fun size!22892 (List!15894) Int)

(assert (=> d!107941 (= (length!21 lt!380777) (size!22892 lt!380777))))

(declare-fun bs!23502 () Bool)

(assert (= bs!23502 d!107941))

(declare-fun m!783053 () Bool)

(assert (=> bs!23502 m!783053))

(assert (=> b!837407 d!107941))

(declare-fun d!107943 () Bool)

(declare-fun size!22893 (List!15893) Int)

(assert (=> d!107943 (= (length!22 l!390) (size!22893 l!390))))

(declare-fun bs!23503 () Bool)

(assert (= bs!23503 d!107943))

(declare-fun m!783055 () Bool)

(assert (=> bs!23503 m!783055))

(assert (=> b!837407 d!107943))

(declare-fun d!107945 () Bool)

(declare-fun res!569478 () Bool)

(declare-fun e!467344 () Bool)

(assert (=> d!107945 (=> res!569478 e!467344)))

(assert (=> d!107945 (= res!569478 (or (is-Nil!15890 l!390) (is-Nil!15890 (t!22256 l!390))))))

(assert (=> d!107945 (= (isStrictlySorted!445 l!390) e!467344)))

(declare-fun b!837473 () Bool)

(declare-fun e!467345 () Bool)

(assert (=> b!837473 (= e!467344 e!467345)))

(declare-fun res!569479 () Bool)

(assert (=> b!837473 (=> (not res!569479) (not e!467345))))

(assert (=> b!837473 (= res!569479 (bvslt (_1!5085 (h!17026 l!390)) (_1!5085 (h!17026 (t!22256 l!390)))))))

(declare-fun b!837474 () Bool)

(assert (=> b!837474 (= e!467345 (isStrictlySorted!445 (t!22256 l!390)))))

(assert (= (and d!107945 (not res!569478)) b!837473))

(assert (= (and b!837473 res!569479) b!837474))

(assert (=> b!837474 m!783045))

(assert (=> start!72204 d!107945))

(declare-fun b!837481 () Bool)

(declare-fun e!467350 () Bool)

(declare-fun tp!47471 () Bool)

(assert (=> b!837481 (= e!467350 (and tp_is_empty!15269 tp!47471))))

(assert (=> b!837408 (= tp!47465 e!467350)))

(assert (= (and b!837408 (is-Cons!15889 (t!22256 l!390))) b!837481))

(push 1)

(assert (not b!837474))

(assert (not d!107933))

(assert (not b!837443))

(assert (not d!107943))

(assert tp_is_empty!15269)

(assert (not b!837445))

(assert (not b!837481))

(assert (not b!837418))

(assert (not d!107941))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107969 () Bool)

(assert (=> d!107969 (= (length!21 lt!380782) (size!22892 lt!380782))))

(declare-fun bs!23508 () Bool)

(assert (= bs!23508 d!107969))

(declare-fun m!783099 () Bool)

(assert (=> bs!23508 m!783099))

(assert (=> b!837445 d!107969))

(declare-fun d!107971 () Bool)

(assert (=> d!107971 (= (length!22 (t!22256 l!390)) (size!22893 (t!22256 l!390)))))

(declare-fun bs!23509 () Bool)

(assert (= bs!23509 d!107971))

(declare-fun m!783101 () Bool)

(assert (=> bs!23509 m!783101))

(assert (=> b!837445 d!107971))

(declare-fun d!107973 () Bool)

(declare-fun res!569489 () Bool)

(declare-fun e!467369 () Bool)

(assert (=> d!107973 (=> res!569489 e!467369)))

(assert (=> d!107973 (= res!569489 (or (is-Nil!15890 (t!22256 l!390)) (is-Nil!15890 (t!22256 (t!22256 l!390)))))))

(assert (=> d!107973 (= (isStrictlySorted!445 (t!22256 l!390)) e!467369)))

(declare-fun b!837509 () Bool)

(declare-fun e!467370 () Bool)

(assert (=> b!837509 (= e!467369 e!467370)))

(declare-fun res!569490 () Bool)

(assert (=> b!837509 (=> (not res!569490) (not e!467370))))

(assert (=> b!837509 (= res!569490 (bvslt (_1!5085 (h!17026 (t!22256 l!390))) (_1!5085 (h!17026 (t!22256 (t!22256 l!390))))))))

(declare-fun b!837510 () Bool)

(assert (=> b!837510 (= e!467370 (isStrictlySorted!445 (t!22256 (t!22256 l!390))))))

(assert (= (and d!107973 (not res!569489)) b!837509))

(assert (= (and b!837509 res!569490) b!837510))

(declare-fun m!783103 () Bool)

(assert (=> b!837510 m!783103))

(assert (=> b!837474 d!107973))

(declare-fun d!107975 () Bool)

(declare-fun res!569491 () Bool)

(declare-fun e!467371 () Bool)

(assert (=> d!107975 (=> res!569491 e!467371)))

(assert (=> d!107975 (= res!569491 (or (is-Nil!15891 lt!380782) (is-Nil!15891 (t!22257 lt!380782))))))

(assert (=> d!107975 (= (isStrictlySortedLong!0 lt!380782) e!467371)))

(declare-fun b!837511 () Bool)

(declare-fun e!467372 () Bool)

(assert (=> b!837511 (= e!467371 e!467372)))

(declare-fun res!569492 () Bool)

(assert (=> b!837511 (=> (not res!569492) (not e!467372))))

(assert (=> b!837511 (= res!569492 (bvslt (h!17027 lt!380782) (h!17027 (t!22257 lt!380782))))))

(declare-fun b!837512 () Bool)

(assert (=> b!837512 (= e!467372 (isStrictlySortedLong!0 (t!22257 lt!380782)))))

(assert (= (and d!107975 (not res!569491)) b!837511))

(assert (= (and b!837511 res!569492) b!837512))

(declare-fun m!783105 () Bool)

(assert (=> b!837512 m!783105))

(assert (=> d!107933 d!107975))

(assert (=> d!107933 d!107973))

(declare-fun d!107977 () Bool)

(declare-fun lt!380796 () Int)

(assert (=> d!107977 (>= lt!380796 0)))

(declare-fun e!467375 () Int)

(assert (=> d!107977 (= lt!380796 e!467375)))

(declare-fun c!91350 () Bool)

(assert (=> d!107977 (= c!91350 (is-Nil!15891 lt!380777))))

(assert (=> d!107977 (= (size!22892 lt!380777) lt!380796)))

(declare-fun b!837517 () Bool)

(assert (=> b!837517 (= e!467375 0)))

(declare-fun b!837518 () Bool)

(assert (=> b!837518 (= e!467375 (+ 1 (size!22892 (t!22257 lt!380777))))))

(assert (= (and d!107977 c!91350) b!837517))

(assert (= (and d!107977 (not c!91350)) b!837518))

(declare-fun m!783107 () Bool)

(assert (=> b!837518 m!783107))

(assert (=> d!107941 d!107977))

(declare-fun d!107979 () Bool)

(declare-fun res!569493 () Bool)

(declare-fun e!467376 () Bool)

(assert (=> d!107979 (=> res!569493 e!467376)))

(assert (=> d!107979 (= res!569493 (or (is-Nil!15891 (t!22257 lt!380777)) (is-Nil!15891 (t!22257 (t!22257 lt!380777)))))))

(assert (=> d!107979 (= (isStrictlySortedLong!0 (t!22257 lt!380777)) e!467376)))

(declare-fun b!837519 () Bool)

(declare-fun e!467377 () Bool)

(assert (=> b!837519 (= e!467376 e!467377)))

(declare-fun res!569494 () Bool)

(assert (=> b!837519 (=> (not res!569494) (not e!467377))))

(assert (=> b!837519 (= res!569494 (bvslt (h!17027 (t!22257 lt!380777)) (h!17027 (t!22257 (t!22257 lt!380777)))))))

(declare-fun b!837520 () Bool)

(assert (=> b!837520 (= e!467377 (isStrictlySortedLong!0 (t!22257 (t!22257 lt!380777))))))

(assert (= (and d!107979 (not res!569493)) b!837519))

(assert (= (and b!837519 res!569494) b!837520))

(declare-fun m!783109 () Bool)

(assert (=> b!837520 m!783109))

(assert (=> b!837418 d!107979))

(declare-fun d!107981 () Bool)

(declare-fun e!467379 () Bool)

(assert (=> d!107981 e!467379))

(declare-fun res!569495 () Bool)

(assert (=> d!107981 (=> (not res!569495) (not e!467379))))

(declare-fun lt!380797 () List!15894)

(assert (=> d!107981 (= res!569495 (isStrictlySortedLong!0 lt!380797))))

(declare-fun e!467378 () List!15894)

(assert (=> d!107981 (= lt!380797 e!467378)))

(declare-fun c!91351 () Bool)

(assert (=> d!107981 (= c!91351 (is-Cons!15889 (t!22256 (t!22256 l!390))))))

(assert (=> d!107981 (isStrictlySorted!445 (t!22256 (t!22256 l!390)))))

(assert (=> d!107981 (= (getKeysList!6 (t!22256 (t!22256 l!390))) lt!380797)))

(declare-fun b!837521 () Bool)

(assert (=> b!837521 (= e!467378 (Cons!15890 (_1!5085 (h!17026 (t!22256 (t!22256 l!390)))) (getKeysList!6 (t!22256 (t!22256 (t!22256 l!390))))))))

(declare-fun b!837522 () Bool)

(assert (=> b!837522 (= e!467378 Nil!15891)))

(declare-fun b!837523 () Bool)

(assert (=> b!837523 (= e!467379 (= (length!21 lt!380797) (length!22 (t!22256 (t!22256 l!390)))))))

(assert (= (and d!107981 c!91351) b!837521))

(assert (= (and d!107981 (not c!91351)) b!837522))

(assert (= (and d!107981 res!569495) b!837523))

(declare-fun m!783111 () Bool)

(assert (=> d!107981 m!783111))

(assert (=> d!107981 m!783103))

(declare-fun m!783113 () Bool)

(assert (=> b!837521 m!783113))

(declare-fun m!783115 () Bool)

(assert (=> b!837523 m!783115))

(declare-fun m!783117 () Bool)

(assert (=> b!837523 m!783117))

(assert (=> b!837443 d!107981))

(declare-fun d!107983 () Bool)

(declare-fun lt!380800 () Int)

(assert (=> d!107983 (>= lt!380800 0)))

(declare-fun e!467382 () Int)

(assert (=> d!107983 (= lt!380800 e!467382)))

(declare-fun c!91354 () Bool)

(assert (=> d!107983 (= c!91354 (is-Nil!15890 l!390))))

(assert (=> d!107983 (= (size!22893 l!390) lt!380800)))

(declare-fun b!837528 () Bool)

(assert (=> b!837528 (= e!467382 0)))

(declare-fun b!837529 () Bool)

(assert (=> b!837529 (= e!467382 (+ 1 (size!22893 (t!22256 l!390))))))

(assert (= (and d!107983 c!91354) b!837528))

(assert (= (and d!107983 (not c!91354)) b!837529))

(assert (=> b!837529 m!783101))

(assert (=> d!107943 d!107983))

(declare-fun b!837530 () Bool)

(declare-fun e!467383 () Bool)

(declare-fun tp!47476 () Bool)

(assert (=> b!837530 (= e!467383 (and tp_is_empty!15269 tp!47476))))

(assert (=> b!837481 (= tp!47471 e!467383)))

(assert (= (and b!837481 (is-Cons!15889 (t!22256 (t!22256 l!390)))) b!837530))

(push 1)

(assert (not b!837530))

(assert (not b!837512))

(assert (not b!837529))

(assert (not d!107969))

(assert (not b!837518))

(assert (not b!837521))

(assert (not b!837523))

(assert (not b!837510))

(assert (not b!837520))

(assert (not d!107971))

(assert tp_is_empty!15269)

(assert (not d!107981))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

