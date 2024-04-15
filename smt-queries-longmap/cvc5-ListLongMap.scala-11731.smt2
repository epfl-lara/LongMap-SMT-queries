; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137502 () Bool)

(assert start!137502)

(declare-fun b!1581629 () Bool)

(declare-fun res!1080629 () Bool)

(declare-fun e!882562 () Bool)

(assert (=> b!1581629 (=> (not res!1080629) (not e!882562))))

(declare-datatypes ((B!2730 0))(
  ( (B!2731 (val!19727 Int)) )
))
(declare-datatypes ((tuple2!25690 0))(
  ( (tuple2!25691 (_1!12856 (_ BitVec 64)) (_2!12856 B!2730)) )
))
(declare-datatypes ((List!36888 0))(
  ( (Nil!36885) (Cons!36884 (h!38428 tuple2!25690) (t!51794 List!36888)) )
))
(declare-fun l!1356 () List!36888)

(assert (=> b!1581629 (= res!1080629 (not (is-Nil!36885 l!1356)))))

(declare-fun b!1581630 () Bool)

(declare-fun res!1080627 () Bool)

(assert (=> b!1581630 (=> (not res!1080627) (not e!882562))))

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!946 (List!36888 (_ BitVec 64)) Bool)

(assert (=> b!1581630 (= res!1080627 (not (containsKey!946 l!1356 key!387)))))

(declare-fun res!1080628 () Bool)

(assert (=> start!137502 (=> (not res!1080628) (not e!882562))))

(declare-fun isStrictlySorted!1100 (List!36888) Bool)

(assert (=> start!137502 (= res!1080628 (isStrictlySorted!1100 l!1356))))

(assert (=> start!137502 e!882562))

(declare-fun e!882563 () Bool)

(assert (=> start!137502 e!882563))

(assert (=> start!137502 true))

(declare-fun b!1581631 () Bool)

(declare-fun e!882561 () Bool)

(assert (=> b!1581631 (= e!882561 (containsKey!946 (t!51794 l!1356) key!387))))

(declare-fun b!1581632 () Bool)

(declare-fun tp_is_empty!39275 () Bool)

(declare-fun tp!114648 () Bool)

(assert (=> b!1581632 (= e!882563 (and tp_is_empty!39275 tp!114648))))

(declare-fun b!1581633 () Bool)

(assert (=> b!1581633 (= e!882562 e!882561)))

(declare-fun res!1080630 () Bool)

(assert (=> b!1581633 (=> res!1080630 e!882561)))

(assert (=> b!1581633 (= res!1080630 (not (isStrictlySorted!1100 (t!51794 l!1356))))))

(assert (= (and start!137502 res!1080628) b!1581630))

(assert (= (and b!1581630 res!1080627) b!1581629))

(assert (= (and b!1581629 res!1080629) b!1581633))

(assert (= (and b!1581633 (not res!1080630)) b!1581631))

(assert (= (and start!137502 (is-Cons!36884 l!1356)) b!1581632))

(declare-fun m!1451795 () Bool)

(assert (=> b!1581630 m!1451795))

(declare-fun m!1451797 () Bool)

(assert (=> start!137502 m!1451797))

(declare-fun m!1451799 () Bool)

(assert (=> b!1581631 m!1451799))

(declare-fun m!1451801 () Bool)

(assert (=> b!1581633 m!1451801))

(push 1)

(assert (not b!1581632))

(assert (not b!1581630))

(assert (not b!1581633))

(assert tp_is_empty!39275)

(assert (not start!137502))

(assert (not b!1581631))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166629 () Bool)

(declare-fun res!1080641 () Bool)

(declare-fun e!882574 () Bool)

(assert (=> d!166629 (=> res!1080641 e!882574)))

(assert (=> d!166629 (= res!1080641 (and (is-Cons!36884 (t!51794 l!1356)) (= (_1!12856 (h!38428 (t!51794 l!1356))) key!387)))))

(assert (=> d!166629 (= (containsKey!946 (t!51794 l!1356) key!387) e!882574)))

(declare-fun b!1581644 () Bool)

(declare-fun e!882575 () Bool)

(assert (=> b!1581644 (= e!882574 e!882575)))

(declare-fun res!1080642 () Bool)

(assert (=> b!1581644 (=> (not res!1080642) (not e!882575))))

(assert (=> b!1581644 (= res!1080642 (and (or (not (is-Cons!36884 (t!51794 l!1356))) (bvsle (_1!12856 (h!38428 (t!51794 l!1356))) key!387)) (is-Cons!36884 (t!51794 l!1356)) (bvslt (_1!12856 (h!38428 (t!51794 l!1356))) key!387)))))

(declare-fun b!1581645 () Bool)

(assert (=> b!1581645 (= e!882575 (containsKey!946 (t!51794 (t!51794 l!1356)) key!387))))

(assert (= (and d!166629 (not res!1080641)) b!1581644))

(assert (= (and b!1581644 res!1080642) b!1581645))

(declare-fun m!1451803 () Bool)

(assert (=> b!1581645 m!1451803))

(assert (=> b!1581631 d!166629))

(declare-fun d!166635 () Bool)

(declare-fun res!1080659 () Bool)

(declare-fun e!882592 () Bool)

(assert (=> d!166635 (=> res!1080659 e!882592)))

(assert (=> d!166635 (= res!1080659 (or (is-Nil!36885 (t!51794 l!1356)) (is-Nil!36885 (t!51794 (t!51794 l!1356)))))))

(assert (=> d!166635 (= (isStrictlySorted!1100 (t!51794 l!1356)) e!882592)))

(declare-fun b!1581662 () Bool)

(declare-fun e!882593 () Bool)

(assert (=> b!1581662 (= e!882592 e!882593)))

(declare-fun res!1080660 () Bool)

(assert (=> b!1581662 (=> (not res!1080660) (not e!882593))))

(assert (=> b!1581662 (= res!1080660 (bvslt (_1!12856 (h!38428 (t!51794 l!1356))) (_1!12856 (h!38428 (t!51794 (t!51794 l!1356))))))))

(declare-fun b!1581663 () Bool)

(assert (=> b!1581663 (= e!882593 (isStrictlySorted!1100 (t!51794 (t!51794 l!1356))))))

(assert (= (and d!166635 (not res!1080659)) b!1581662))

(assert (= (and b!1581662 res!1080660) b!1581663))

(declare-fun m!1451807 () Bool)

(assert (=> b!1581663 m!1451807))

(assert (=> b!1581633 d!166635))

(declare-fun d!166641 () Bool)

(declare-fun res!1080663 () Bool)

(declare-fun e!882596 () Bool)

(assert (=> d!166641 (=> res!1080663 e!882596)))

(assert (=> d!166641 (= res!1080663 (or (is-Nil!36885 l!1356) (is-Nil!36885 (t!51794 l!1356))))))

(assert (=> d!166641 (= (isStrictlySorted!1100 l!1356) e!882596)))

(declare-fun b!1581666 () Bool)

(declare-fun e!882597 () Bool)

(assert (=> b!1581666 (= e!882596 e!882597)))

(declare-fun res!1080664 () Bool)

(assert (=> b!1581666 (=> (not res!1080664) (not e!882597))))

(assert (=> b!1581666 (= res!1080664 (bvslt (_1!12856 (h!38428 l!1356)) (_1!12856 (h!38428 (t!51794 l!1356)))))))

(declare-fun b!1581667 () Bool)

(assert (=> b!1581667 (= e!882597 (isStrictlySorted!1100 (t!51794 l!1356)))))

(assert (= (and d!166641 (not res!1080663)) b!1581666))

(assert (= (and b!1581666 res!1080664) b!1581667))

(assert (=> b!1581667 m!1451801))

(assert (=> start!137502 d!166641))

(declare-fun d!166645 () Bool)

(declare-fun res!1080667 () Bool)

(declare-fun e!882600 () Bool)

(assert (=> d!166645 (=> res!1080667 e!882600)))

(assert (=> d!166645 (= res!1080667 (and (is-Cons!36884 l!1356) (= (_1!12856 (h!38428 l!1356)) key!387)))))

(assert (=> d!166645 (= (containsKey!946 l!1356 key!387) e!882600)))

(declare-fun b!1581670 () Bool)

(declare-fun e!882601 () Bool)

(assert (=> b!1581670 (= e!882600 e!882601)))

(declare-fun res!1080668 () Bool)

(assert (=> b!1581670 (=> (not res!1080668) (not e!882601))))

(assert (=> b!1581670 (= res!1080668 (and (or (not (is-Cons!36884 l!1356)) (bvsle (_1!12856 (h!38428 l!1356)) key!387)) (is-Cons!36884 l!1356) (bvslt (_1!12856 (h!38428 l!1356)) key!387)))))

(declare-fun b!1581671 () Bool)

(assert (=> b!1581671 (= e!882601 (containsKey!946 (t!51794 l!1356) key!387))))

(assert (= (and d!166645 (not res!1080667)) b!1581670))

(assert (= (and b!1581670 res!1080668) b!1581671))

(assert (=> b!1581671 m!1451799))

(assert (=> b!1581630 d!166645))

(declare-fun b!1581685 () Bool)

(declare-fun e!882611 () Bool)

(declare-fun tp!114654 () Bool)

(assert (=> b!1581685 (= e!882611 (and tp_is_empty!39275 tp!114654))))

(assert (=> b!1581632 (= tp!114648 e!882611)))

(assert (= (and b!1581632 (is-Cons!36884 (t!51794 l!1356))) b!1581685))

(push 1)

(assert (not b!1581645))

(assert (not b!1581685))

(assert (not b!1581663))

(assert (not b!1581667))

(assert tp_is_empty!39275)

(assert (not b!1581671))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

