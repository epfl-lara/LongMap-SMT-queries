; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75188 () Bool)

(assert start!75188)

(declare-fun b!885931 () Bool)

(declare-fun res!601563 () Bool)

(declare-fun e!493104 () Bool)

(assert (=> b!885931 (=> (not res!601563) (not e!493104))))

(declare-datatypes ((B!1296 0))(
  ( (B!1297 (val!8954 Int)) )
))
(declare-datatypes ((tuple2!11902 0))(
  ( (tuple2!11903 (_1!5962 (_ BitVec 64)) (_2!5962 B!1296)) )
))
(declare-datatypes ((List!17670 0))(
  ( (Nil!17667) (Cons!17666 (h!18797 tuple2!11902) (t!24947 List!17670)) )
))
(declare-fun l!906 () List!17670)

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!885931 (= res!601563 (and (is-Cons!17666 l!906) (bvslt (_1!5962 (h!18797 l!906)) key1!49)))))

(declare-fun res!601564 () Bool)

(assert (=> start!75188 (=> (not res!601564) (not e!493104))))

(declare-fun isStrictlySorted!488 (List!17670) Bool)

(assert (=> start!75188 (= res!601564 (isStrictlySorted!488 l!906))))

(assert (=> start!75188 e!493104))

(declare-fun e!493103 () Bool)

(assert (=> start!75188 e!493103))

(assert (=> start!75188 true))

(declare-fun b!885933 () Bool)

(declare-fun ListPrimitiveSize!90 (List!17670) Int)

(assert (=> b!885933 (= e!493104 (>= (ListPrimitiveSize!90 (t!24947 l!906)) (ListPrimitiveSize!90 l!906)))))

(declare-fun b!885934 () Bool)

(declare-fun tp_is_empty!17807 () Bool)

(declare-fun tp!54353 () Bool)

(assert (=> b!885934 (= e!493103 (and tp_is_empty!17807 tp!54353))))

(declare-fun b!885932 () Bool)

(declare-fun res!601562 () Bool)

(assert (=> b!885932 (=> (not res!601562) (not e!493104))))

(assert (=> b!885932 (= res!601562 (isStrictlySorted!488 (t!24947 l!906)))))

(assert (= (and start!75188 res!601564) b!885931))

(assert (= (and b!885931 res!601563) b!885932))

(assert (= (and b!885932 res!601562) b!885933))

(assert (= (and start!75188 (is-Cons!17666 l!906)) b!885934))

(declare-fun m!825899 () Bool)

(assert (=> start!75188 m!825899))

(declare-fun m!825901 () Bool)

(assert (=> b!885933 m!825901))

(declare-fun m!825903 () Bool)

(assert (=> b!885933 m!825903))

(declare-fun m!825905 () Bool)

(assert (=> b!885932 m!825905))

(push 1)

(assert (not start!75188))

(assert (not b!885934))

(assert tp_is_empty!17807)

(assert (not b!885932))

(assert (not b!885933))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109480 () Bool)

(declare-fun lt!401064 () Int)

(assert (=> d!109480 (>= lt!401064 0)))

(declare-fun e!493130 () Int)

(assert (=> d!109480 (= lt!401064 e!493130)))

(declare-fun c!93373 () Bool)

(assert (=> d!109480 (= c!93373 (is-Nil!17667 (t!24947 l!906)))))

(assert (=> d!109480 (= (ListPrimitiveSize!90 (t!24947 l!906)) lt!401064)))

(declare-fun b!885972 () Bool)

(assert (=> b!885972 (= e!493130 0)))

(declare-fun b!885973 () Bool)

(assert (=> b!885973 (= e!493130 (+ 1 (ListPrimitiveSize!90 (t!24947 (t!24947 l!906)))))))

(assert (= (and d!109480 c!93373) b!885972))

(assert (= (and d!109480 (not c!93373)) b!885973))

(declare-fun m!825913 () Bool)

(assert (=> b!885973 m!825913))

(assert (=> b!885933 d!109480))

(declare-fun d!109487 () Bool)

(declare-fun lt!401065 () Int)

(assert (=> d!109487 (>= lt!401065 0)))

(declare-fun e!493131 () Int)

(assert (=> d!109487 (= lt!401065 e!493131)))

(declare-fun c!93374 () Bool)

(assert (=> d!109487 (= c!93374 (is-Nil!17667 l!906))))

(assert (=> d!109487 (= (ListPrimitiveSize!90 l!906) lt!401065)))

(declare-fun b!885974 () Bool)

(assert (=> b!885974 (= e!493131 0)))

(declare-fun b!885975 () Bool)

(assert (=> b!885975 (= e!493131 (+ 1 (ListPrimitiveSize!90 (t!24947 l!906))))))

(assert (= (and d!109487 c!93374) b!885974))

(assert (= (and d!109487 (not c!93374)) b!885975))

(assert (=> b!885975 m!825901))

(assert (=> b!885933 d!109487))

(declare-fun d!109489 () Bool)

(declare-fun res!601585 () Bool)

(declare-fun e!493143 () Bool)

(assert (=> d!109489 (=> res!601585 e!493143)))

(assert (=> d!109489 (= res!601585 (or (is-Nil!17667 (t!24947 l!906)) (is-Nil!17667 (t!24947 (t!24947 l!906)))))))

(assert (=> d!109489 (= (isStrictlySorted!488 (t!24947 l!906)) e!493143)))

(declare-fun b!885989 () Bool)

(declare-fun e!493144 () Bool)

(assert (=> b!885989 (= e!493143 e!493144)))

(declare-fun res!601586 () Bool)

(assert (=> b!885989 (=> (not res!601586) (not e!493144))))

(assert (=> b!885989 (= res!601586 (bvslt (_1!5962 (h!18797 (t!24947 l!906))) (_1!5962 (h!18797 (t!24947 (t!24947 l!906))))))))

