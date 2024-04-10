; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75172 () Bool)

(assert start!75172)

(declare-fun res!601500 () Bool)

(declare-fun e!493041 () Bool)

(assert (=> start!75172 (=> (not res!601500) (not e!493041))))

(declare-datatypes ((B!1286 0))(
  ( (B!1287 (val!8949 Int)) )
))
(declare-datatypes ((tuple2!11892 0))(
  ( (tuple2!11893 (_1!5957 (_ BitVec 64)) (_2!5957 B!1286)) )
))
(declare-datatypes ((List!17665 0))(
  ( (Nil!17662) (Cons!17661 (h!18792 tuple2!11892) (t!24942 List!17665)) )
))
(declare-fun l!906 () List!17665)

(declare-fun isStrictlySorted!483 (List!17665) Bool)

(assert (=> start!75172 (= res!601500 (isStrictlySorted!483 l!906))))

(assert (=> start!75172 e!493041))

(declare-fun e!493040 () Bool)

(assert (=> start!75172 e!493040))

(assert (=> start!75172 true))

(declare-fun b!885839 () Bool)

(declare-fun res!601501 () Bool)

(assert (=> b!885839 (=> (not res!601501) (not e!493041))))

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!885839 (= res!601501 (and (is-Cons!17661 l!906) (bvslt (_1!5957 (h!18792 l!906)) key1!49)))))

(declare-fun b!885840 () Bool)

(assert (=> b!885840 (= e!493041 (not (isStrictlySorted!483 (t!24942 l!906))))))

(declare-fun b!885841 () Bool)

(declare-fun tp_is_empty!17797 () Bool)

(declare-fun tp!54329 () Bool)

(assert (=> b!885841 (= e!493040 (and tp_is_empty!17797 tp!54329))))

(assert (= (and start!75172 res!601500) b!885839))

(assert (= (and b!885839 res!601501) b!885840))

(assert (= (and start!75172 (is-Cons!17661 l!906)) b!885841))

(declare-fun m!825865 () Bool)

(assert (=> start!75172 m!825865))

(declare-fun m!825867 () Bool)

(assert (=> b!885840 m!825867))

(push 1)

(assert (not start!75172))

(assert (not b!885840))

(assert (not b!885841))

(assert tp_is_empty!17797)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109459 () Bool)

(declare-fun res!601526 () Bool)

(declare-fun e!493069 () Bool)

(assert (=> d!109459 (=> res!601526 e!493069)))

(assert (=> d!109459 (= res!601526 (or (is-Nil!17662 l!906) (is-Nil!17662 (t!24942 l!906))))))

(assert (=> d!109459 (= (isStrictlySorted!483 l!906) e!493069)))

(declare-fun b!885877 () Bool)

(declare-fun e!493070 () Bool)

(assert (=> b!885877 (= e!493069 e!493070)))

(declare-fun res!601527 () Bool)

(assert (=> b!885877 (=> (not res!601527) (not e!493070))))

(assert (=> b!885877 (= res!601527 (bvslt (_1!5957 (h!18792 l!906)) (_1!5957 (h!18792 (t!24942 l!906)))))))

(declare-fun b!885878 () Bool)

(assert (=> b!885878 (= e!493070 (isStrictlySorted!483 (t!24942 l!906)))))

(assert (= (and d!109459 (not res!601526)) b!885877))

(assert (= (and b!885877 res!601527) b!885878))

(assert (=> b!885878 m!825867))

(assert (=> start!75172 d!109459))

(declare-fun d!109465 () Bool)

(declare-fun res!601528 () Bool)

(declare-fun e!493071 () Bool)

(assert (=> d!109465 (=> res!601528 e!493071)))

(assert (=> d!109465 (= res!601528 (or (is-Nil!17662 (t!24942 l!906)) (is-Nil!17662 (t!24942 (t!24942 l!906)))))))

(assert (=> d!109465 (= (isStrictlySorted!483 (t!24942 l!906)) e!493071)))

(declare-fun b!885879 () Bool)

(declare-fun e!493072 () Bool)

(assert (=> b!885879 (= e!493071 e!493072)))

(declare-fun res!601529 () Bool)

(assert (=> b!885879 (=> (not res!601529) (not e!493072))))

(assert (=> b!885879 (= res!601529 (bvslt (_1!5957 (h!18792 (t!24942 l!906))) (_1!5957 (h!18792 (t!24942 (t!24942 l!906))))))))

(declare-fun b!885880 () Bool)

(assert (=> b!885880 (= e!493072 (isStrictlySorted!483 (t!24942 (t!24942 l!906))))))

(assert (= (and d!109465 (not res!601528)) b!885879))

(assert (= (and b!885879 res!601529) b!885880))

(declare-fun m!825879 () Bool)

(assert (=> b!885880 m!825879))

(assert (=> b!885840 d!109465))

(declare-fun b!885885 () Bool)

(declare-fun e!493075 () Bool)

(declare-fun tp!54341 () Bool)

(assert (=> b!885885 (= e!493075 (and tp_is_empty!17797 tp!54341))))

(assert (=> b!885841 (= tp!54329 e!493075)))

(assert (= (and b!885841 (is-Cons!17661 (t!24942 l!906))) b!885885))

(push 1)

