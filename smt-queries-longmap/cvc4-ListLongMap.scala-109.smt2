; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1798 () Bool)

(assert start!1798)

(declare-fun b!12599 () Bool)

(declare-fun e!7535 () Bool)

(declare-fun tp_is_empty!635 () Bool)

(declare-fun tp!2102 () Bool)

(assert (=> b!12599 (= e!7535 (and tp_is_empty!635 tp!2102))))

(declare-fun res!10109 () Bool)

(declare-fun e!7534 () Bool)

(assert (=> start!1798 (=> (not res!10109) (not e!7534))))

(declare-datatypes ((B!462 0))(
  ( (B!463 (val!326 Int)) )
))
(declare-datatypes ((tuple2!452 0))(
  ( (tuple2!453 (_1!226 (_ BitVec 64)) (_2!226 B!462)) )
))
(declare-datatypes ((List!378 0))(
  ( (Nil!375) (Cons!374 (h!940 tuple2!452) (t!2765 List!378)) )
))
(declare-fun l!1094 () List!378)

(declare-fun isStrictlySorted!71 (List!378) Bool)

(assert (=> start!1798 (= res!10109 (isStrictlySorted!71 l!1094))))

(assert (=> start!1798 e!7534))

(assert (=> start!1798 e!7535))

(assert (=> start!1798 true))

(assert (=> start!1798 tp_is_empty!635))

(declare-fun b!12597 () Bool)

(declare-fun res!10110 () Bool)

(assert (=> b!12597 (=> (not res!10110) (not e!7534))))

(declare-fun key!303 () (_ BitVec 64))

(assert (=> b!12597 (= res!10110 (or (not (is-Cons!374 l!1094)) (= (_1!226 (h!940 l!1094)) key!303)))))

(declare-fun v!194 () B!462)

(declare-fun b!12598 () Bool)

(declare-fun contains!188 (List!378 tuple2!452) Bool)

(assert (=> b!12598 (= e!7534 (not (contains!188 l!1094 (tuple2!453 key!303 v!194))))))

(declare-fun b!12596 () Bool)

(declare-fun res!10111 () Bool)

(assert (=> b!12596 (=> (not res!10111) (not e!7534))))

(declare-datatypes ((Option!58 0))(
  ( (Some!57 (v!1378 B!462)) (None!56) )
))
(declare-fun getValueByKey!52 (List!378 (_ BitVec 64)) Option!58)

(assert (=> b!12596 (= res!10111 (= (getValueByKey!52 l!1094 key!303) (Some!57 v!194)))))

(assert (= (and start!1798 res!10109) b!12596))

(assert (= (and b!12596 res!10111) b!12597))

(assert (= (and b!12597 res!10110) b!12598))

(assert (= (and start!1798 (is-Cons!374 l!1094)) b!12599))

(declare-fun m!8561 () Bool)

(assert (=> start!1798 m!8561))

(declare-fun m!8563 () Bool)

(assert (=> b!12598 m!8563))

(declare-fun m!8565 () Bool)

(assert (=> b!12596 m!8565))

(push 1)

(assert (not start!1798))

(assert tp_is_empty!635)

(assert (not b!12598))

(assert (not b!12599))

(assert (not b!12596))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1801 () Bool)

(declare-fun res!10128 () Bool)

(declare-fun e!7552 () Bool)

(assert (=> d!1801 (=> res!10128 e!7552)))

(assert (=> d!1801 (= res!10128 (or (is-Nil!375 l!1094) (is-Nil!375 (t!2765 l!1094))))))

(assert (=> d!1801 (= (isStrictlySorted!71 l!1094) e!7552)))

(declare-fun b!12616 () Bool)

(declare-fun e!7553 () Bool)

(assert (=> b!12616 (= e!7552 e!7553)))

(declare-fun res!10129 () Bool)

(assert (=> b!12616 (=> (not res!10129) (not e!7553))))

(assert (=> b!12616 (= res!10129 (bvslt (_1!226 (h!940 l!1094)) (_1!226 (h!940 (t!2765 l!1094)))))))

(declare-fun b!12617 () Bool)

(assert (=> b!12617 (= e!7553 (isStrictlySorted!71 (t!2765 l!1094)))))

(assert (= (and d!1801 (not res!10128)) b!12616))

(assert (= (and b!12616 res!10129) b!12617))

(declare-fun m!8571 () Bool)

(assert (=> b!12617 m!8571))

(assert (=> start!1798 d!1801))

(declare-fun lt!3183 () Bool)

(declare-fun d!1807 () Bool)

(declare-fun content!13 (List!378) (Set tuple2!452))

(assert (=> d!1807 (= lt!3183 (member (tuple2!453 key!303 v!194) (content!13 l!1094)))))

(declare-fun e!7575 () Bool)

(assert (=> d!1807 (= lt!3183 e!7575)))

(declare-fun res!10146 () Bool)

(assert (=> d!1807 (=> (not res!10146) (not e!7575))))

(assert (=> d!1807 (= res!10146 (is-Cons!374 l!1094))))

(assert (=> d!1807 (= (contains!188 l!1094 (tuple2!453 key!303 v!194)) lt!3183)))

(declare-fun b!12642 () Bool)

(declare-fun e!7574 () Bool)

(assert (=> b!12642 (= e!7575 e!7574)))

(declare-fun res!10147 () Bool)

(assert (=> b!12642 (=> res!10147 e!7574)))

(assert (=> b!12642 (= res!10147 (= (h!940 l!1094) (tuple2!453 key!303 v!194)))))

(declare-fun b!12643 () Bool)

(assert (=> b!12643 (= e!7574 (contains!188 (t!2765 l!1094) (tuple2!453 key!303 v!194)))))

(assert (= (and d!1807 res!10146) b!12642))

(assert (= (and b!12642 (not res!10147)) b!12643))

(declare-fun m!8585 () Bool)

(assert (=> d!1807 m!8585))

(declare-fun m!8587 () Bool)

(assert (=> d!1807 m!8587))

(declare-fun m!8591 () Bool)

(assert (=> b!12643 m!8591))

(assert (=> b!12598 d!1807))

(declare-fun d!1813 () Bool)

(declare-fun c!1141 () Bool)

(assert (=> d!1813 (= c!1141 (and (is-Cons!374 l!1094) (= (_1!226 (h!940 l!1094)) key!303)))))

(declare-fun e!7594 () Option!58)

(assert (=> d!1813 (= (getValueByKey!52 l!1094 key!303) e!7594)))

(declare-fun b!12678 () Bool)

(assert (=> b!12678 (= e!7594 (Some!57 (_2!226 (h!940 l!1094))))))

(declare-fun b!12679 () Bool)

(declare-fun e!7595 () Option!58)

(assert (=> b!12679 (= e!7594 e!7595)))

