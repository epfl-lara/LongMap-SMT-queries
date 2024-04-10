; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75158 () Bool)

(assert start!75158)

(declare-fun res!601477 () Bool)

(declare-fun e!492998 () Bool)

(assert (=> start!75158 (=> (not res!601477) (not e!492998))))

(declare-datatypes ((B!1284 0))(
  ( (B!1285 (val!8948 Int)) )
))
(declare-datatypes ((tuple2!11890 0))(
  ( (tuple2!11891 (_1!5956 (_ BitVec 64)) (_2!5956 B!1284)) )
))
(declare-datatypes ((List!17664 0))(
  ( (Nil!17661) (Cons!17660 (h!18791 tuple2!11890) (t!24941 List!17664)) )
))
(declare-fun l!906 () List!17664)

(declare-fun isStrictlySorted!482 (List!17664) Bool)

(assert (=> start!75158 (= res!601477 (isStrictlySorted!482 l!906))))

(assert (=> start!75158 e!492998))

(declare-fun e!492999 () Bool)

(assert (=> start!75158 e!492999))

(declare-fun b!885780 () Bool)

(declare-fun ListPrimitiveSize!87 (List!17664) Int)

(assert (=> b!885780 (= e!492998 (< (ListPrimitiveSize!87 l!906) 0))))

(declare-fun b!885781 () Bool)

(declare-fun tp_is_empty!17795 () Bool)

(declare-fun tp!54317 () Bool)

(assert (=> b!885781 (= e!492999 (and tp_is_empty!17795 tp!54317))))

(assert (= (and start!75158 res!601477) b!885780))

(assert (= (and start!75158 (is-Cons!17660 l!906)) b!885781))

(declare-fun m!825849 () Bool)

(assert (=> start!75158 m!825849))

(declare-fun m!825851 () Bool)

(assert (=> b!885780 m!825851))

(push 1)

(assert (not b!885780))

(assert (not start!75158))

(assert (not b!885781))

(assert tp_is_empty!17795)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109445 () Bool)

(declare-fun lt!401052 () Int)

(assert (=> d!109445 (>= lt!401052 0)))

(declare-fun e!493007 () Int)

(assert (=> d!109445 (= lt!401052 e!493007)))

(declare-fun c!93361 () Bool)

(assert (=> d!109445 (= c!93361 (is-Nil!17661 l!906))))

(assert (=> d!109445 (= (ListPrimitiveSize!87 l!906) lt!401052)))

(declare-fun b!885796 () Bool)

(assert (=> b!885796 (= e!493007 0)))

(declare-fun b!885797 () Bool)

(assert (=> b!885797 (= e!493007 (+ 1 (ListPrimitiveSize!87 (t!24941 l!906))))))

(assert (= (and d!109445 c!93361) b!885796))

(assert (= (and d!109445 (not c!93361)) b!885797))

(declare-fun m!825855 () Bool)

(assert (=> b!885797 m!825855))

(assert (=> b!885780 d!109445))

(declare-fun d!109451 () Bool)

(declare-fun res!601492 () Bool)

(declare-fun e!493025 () Bool)

(assert (=> d!109451 (=> res!601492 e!493025)))

(assert (=> d!109451 (= res!601492 (or (is-Nil!17661 l!906) (is-Nil!17661 (t!24941 l!906))))))

(assert (=> d!109451 (= (isStrictlySorted!482 l!906) e!493025)))

(declare-fun b!885818 () Bool)

(declare-fun e!493026 () Bool)

(assert (=> b!885818 (= e!493025 e!493026)))

(declare-fun res!601493 () Bool)

(assert (=> b!885818 (=> (not res!601493) (not e!493026))))

(assert (=> b!885818 (= res!601493 (bvslt (_1!5956 (h!18791 l!906)) (_1!5956 (h!18791 (t!24941 l!906)))))))

(declare-fun b!885819 () Bool)

(assert (=> b!885819 (= e!493026 (isStrictlySorted!482 (t!24941 l!906)))))

(assert (= (and d!109451 (not res!601492)) b!885818))

(assert (= (and b!885818 res!601493) b!885819))

(declare-fun m!825861 () Bool)

(assert (=> b!885819 m!825861))

(assert (=> start!75158 d!109451))

(declare-fun b!885831 () Bool)

(declare-fun e!493034 () Bool)

(declare-fun tp!54325 () Bool)

(assert (=> b!885831 (= e!493034 (and tp_is_empty!17795 tp!54325))))

