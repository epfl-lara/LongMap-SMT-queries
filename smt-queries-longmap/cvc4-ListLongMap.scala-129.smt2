; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2236 () Bool)

(assert start!2236)

(declare-fun res!11449 () Bool)

(declare-fun e!9007 () Bool)

(assert (=> start!2236 (=> (not res!11449) (not e!9007))))

(declare-datatypes ((B!576 0))(
  ( (B!577 (val!386 Int)) )
))
(declare-datatypes ((tuple2!572 0))(
  ( (tuple2!573 (_1!286 (_ BitVec 64)) (_2!286 B!576)) )
))
(declare-datatypes ((List!441 0))(
  ( (Nil!438) (Cons!437 (h!1003 tuple2!572) (t!2843 List!441)) )
))
(declare-datatypes ((ListLongMap!403 0))(
  ( (ListLongMap!404 (toList!217 List!441)) )
))
(declare-fun thiss!177 () ListLongMap!403)

(declare-fun size!501 (List!441) Int)

(assert (=> start!2236 (= res!11449 (< (size!501 (toList!217 thiss!177)) 2147483647))))

(assert (=> start!2236 e!9007))

(declare-fun e!9008 () Bool)

(declare-fun inv!738 (ListLongMap!403) Bool)

(assert (=> start!2236 (and (inv!738 thiss!177) e!9008)))

(declare-fun b!14953 () Bool)

(declare-fun isStrictlySorted!128 (List!441) Bool)

(assert (=> b!14953 (= e!9007 (not (isStrictlySorted!128 (toList!217 thiss!177))))))

(declare-fun b!14954 () Bool)

(declare-fun tp!2414 () Bool)

(assert (=> b!14954 (= e!9008 tp!2414)))

(assert (= (and start!2236 res!11449) b!14953))

(assert (= start!2236 b!14954))

(declare-fun m!9959 () Bool)

(assert (=> start!2236 m!9959))

(declare-fun m!9961 () Bool)

(assert (=> start!2236 m!9961))

(declare-fun m!9963 () Bool)

(assert (=> b!14953 m!9963))

(push 1)

(assert (not start!2236))

(assert (not b!14953))

(assert (not b!14954))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2441 () Bool)

(declare-fun lt!3645 () Int)

(assert (=> d!2441 (>= lt!3645 0)))

(declare-fun e!9017 () Int)

(assert (=> d!2441 (= lt!3645 e!9017)))

(declare-fun c!1418 () Bool)

(assert (=> d!2441 (= c!1418 (is-Nil!438 (toList!217 thiss!177)))))

(assert (=> d!2441 (= (size!501 (toList!217 thiss!177)) lt!3645)))

(declare-fun b!14971 () Bool)

(assert (=> b!14971 (= e!9017 0)))

(declare-fun b!14972 () Bool)

(assert (=> b!14972 (= e!9017 (+ 1 (size!501 (t!2843 (toList!217 thiss!177)))))))

(assert (= (and d!2441 c!1418) b!14971))

(assert (= (and d!2441 (not c!1418)) b!14972))

(declare-fun m!9969 () Bool)

(assert (=> b!14972 m!9969))

(assert (=> start!2236 d!2441))

(declare-fun d!2447 () Bool)

(assert (=> d!2447 (= (inv!738 thiss!177) (isStrictlySorted!128 (toList!217 thiss!177)))))

(declare-fun bs!614 () Bool)

(assert (= bs!614 d!2447))

(assert (=> bs!614 m!9963))

(assert (=> start!2236 d!2447))

(declare-fun d!2453 () Bool)

(declare-fun res!11466 () Bool)

(declare-fun e!9034 () Bool)

(assert (=> d!2453 (=> res!11466 e!9034)))

(assert (=> d!2453 (= res!11466 (or (is-Nil!438 (toList!217 thiss!177)) (is-Nil!438 (t!2843 (toList!217 thiss!177)))))))

(assert (=> d!2453 (= (isStrictlySorted!128 (toList!217 thiss!177)) e!9034)))

(declare-fun b!14989 () Bool)

(declare-fun e!9035 () Bool)

(assert (=> b!14989 (= e!9034 e!9035)))

(declare-fun res!11467 () Bool)

(assert (=> b!14989 (=> (not res!11467) (not e!9035))))

(assert (=> b!14989 (= res!11467 (bvslt (_1!286 (h!1003 (toList!217 thiss!177))) (_1!286 (h!1003 (t!2843 (toList!217 thiss!177))))))))

(declare-fun b!14990 () Bool)

(assert (=> b!14990 (= e!9035 (isStrictlySorted!128 (t!2843 (toList!217 thiss!177))))))

(assert (= (and d!2453 (not res!11466)) b!14989))

(assert (= (and b!14989 res!11467) b!14990))

