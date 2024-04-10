; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75134 () Bool)

(assert start!75134)

(declare-fun res!601425 () Bool)

(declare-fun e!492893 () Bool)

(assert (=> start!75134 (=> (not res!601425) (not e!492893))))

(declare-datatypes ((B!1272 0))(
  ( (B!1273 (val!8942 Int)) )
))
(declare-datatypes ((tuple2!11878 0))(
  ( (tuple2!11879 (_1!5950 (_ BitVec 64)) (_2!5950 B!1272)) )
))
(declare-datatypes ((List!17658 0))(
  ( (Nil!17655) (Cons!17654 (h!18785 tuple2!11878) (t!24935 List!17658)) )
))
(declare-fun l!906 () List!17658)

(declare-fun isStrictlySorted!479 (List!17658) Bool)

(assert (=> start!75134 (= res!601425 (isStrictlySorted!479 l!906))))

(assert (=> start!75134 e!492893))

(declare-fun e!492894 () Bool)

(assert (=> start!75134 e!492894))

(assert (=> start!75134 true))

(declare-fun tp_is_empty!17783 () Bool)

(assert (=> start!75134 tp_is_empty!17783))

(declare-fun b!885623 () Bool)

(declare-fun res!601426 () Bool)

(assert (=> b!885623 (=> (not res!601426) (not e!492893))))

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!885623 (= res!601426 (or (not (is-Cons!17654 l!906)) (bvsge (_1!5950 (h!18785 l!906)) key1!49)))))

(declare-fun v1!38 () B!1272)

(declare-fun b!885624 () Bool)

(declare-fun insertStrictlySorted!296 (List!17658 (_ BitVec 64) B!1272) List!17658)

(assert (=> b!885624 (= e!492893 (not (isStrictlySorted!479 (insertStrictlySorted!296 l!906 key1!49 v1!38))))))

(declare-fun b!885625 () Bool)

(declare-fun tp!54290 () Bool)

(assert (=> b!885625 (= e!492894 (and tp_is_empty!17783 tp!54290))))

(assert (= (and start!75134 res!601425) b!885623))

(assert (= (and b!885623 res!601426) b!885624))

(assert (= (and start!75134 (is-Cons!17654 l!906)) b!885625))

(declare-fun m!825793 () Bool)

(assert (=> start!75134 m!825793))

(declare-fun m!825795 () Bool)

(assert (=> b!885624 m!825795))

(assert (=> b!885624 m!825795))

(declare-fun m!825797 () Bool)

(assert (=> b!885624 m!825797))

(push 1)

(assert (not start!75134))

(assert (not b!885624))

(assert (not b!885625))

(assert tp_is_empty!17783)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109423 () Bool)

(declare-fun res!601443 () Bool)

(declare-fun e!492911 () Bool)

(assert (=> d!109423 (=> res!601443 e!492911)))

(assert (=> d!109423 (= res!601443 (or (is-Nil!17655 l!906) (is-Nil!17655 (t!24935 l!906))))))

(assert (=> d!109423 (= (isStrictlySorted!479 l!906) e!492911)))

(declare-fun b!885642 () Bool)

(declare-fun e!492912 () Bool)

(assert (=> b!885642 (= e!492911 e!492912)))

(declare-fun res!601444 () Bool)

(assert (=> b!885642 (=> (not res!601444) (not e!492912))))

(assert (=> b!885642 (= res!601444 (bvslt (_1!5950 (h!18785 l!906)) (_1!5950 (h!18785 (t!24935 l!906)))))))

(declare-fun b!885643 () Bool)

(assert (=> b!885643 (= e!492912 (isStrictlySorted!479 (t!24935 l!906)))))

(assert (= (and d!109423 (not res!601443)) b!885642))

(assert (= (and b!885642 res!601444) b!885643))

(declare-fun m!825803 () Bool)

(assert (=> b!885643 m!825803))

(assert (=> start!75134 d!109423))

(declare-fun d!109431 () Bool)

(declare-fun res!601447 () Bool)

(declare-fun e!492915 () Bool)

(assert (=> d!109431 (=> res!601447 e!492915)))

(assert (=> d!109431 (= res!601447 (or (is-Nil!17655 (insertStrictlySorted!296 l!906 key1!49 v1!38)) (is-Nil!17655 (t!24935 (insertStrictlySorted!296 l!906 key1!49 v1!38)))))))

(assert (=> d!109431 (= (isStrictlySorted!479 (insertStrictlySorted!296 l!906 key1!49 v1!38)) e!492915)))

(declare-fun b!885646 () Bool)

(declare-fun e!492916 () Bool)

(assert (=> b!885646 (= e!492915 e!492916)))

(declare-fun res!601448 () Bool)

(assert (=> b!885646 (=> (not res!601448) (not e!492916))))

(assert (=> b!885646 (= res!601448 (bvslt (_1!5950 (h!18785 (insertStrictlySorted!296 l!906 key1!49 v1!38))) (_1!5950 (h!18785 (t!24935 (insertStrictlySorted!296 l!906 key1!49 v1!38))))))))

(declare-fun b!885647 () Bool)

(assert (=> b!885647 (= e!492916 (isStrictlySorted!479 (t!24935 (insertStrictlySorted!296 l!906 key1!49 v1!38))))))

(assert (= (and d!109431 (not res!601447)) b!885646))

(assert (= (and b!885646 res!601448) b!885647))

(declare-fun m!825807 () Bool)

(assert (=> b!885647 m!825807))

(assert (=> b!885624 d!109431))

(declare-fun d!109435 () Bool)

(declare-fun e!492966 () Bool)

(assert (=> d!109435 e!492966))

(declare-fun res!601466 () Bool)

(assert (=> d!109435 (=> (not res!601466) (not e!492966))))

