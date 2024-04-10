; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5170 () Bool)

(assert start!5170)

(declare-fun res!22824 () Bool)

(declare-fun e!23988 () Bool)

(assert (=> start!5170 (=> (not res!22824) (not e!23988))))

(declare-datatypes ((B!776 0))(
  ( (B!777 (val!888 Int)) )
))
(declare-fun b!99 () B!776)

(declare-datatypes ((tuple2!1436 0))(
  ( (tuple2!1437 (_1!729 (_ BitVec 64)) (_2!729 B!776)) )
))
(declare-datatypes ((List!998 0))(
  ( (Nil!995) (Cons!994 (h!1562 tuple2!1436) (t!3831 List!998)) )
))
(declare-datatypes ((ListLongMap!1013 0))(
  ( (ListLongMap!1014 (toList!522 List!998)) )
))
(declare-fun lm!264 () ListLongMap!1013)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!473 (List!998 tuple2!1436) Bool)

(assert (=> start!5170 (= res!22824 (contains!473 (toList!522 lm!264) (tuple2!1437 a!526 b!99)))))

(assert (=> start!5170 e!23988))

(declare-fun e!23989 () Bool)

(declare-fun inv!1683 (ListLongMap!1013) Bool)

(assert (=> start!5170 (and (inv!1683 lm!264) e!23989)))

(assert (=> start!5170 true))

(declare-fun tp_is_empty!1699 () Bool)

(assert (=> start!5170 tp_is_empty!1699))

(declare-fun b!37830 () Bool)

(declare-fun isStrictlySorted!194 (List!998) Bool)

(assert (=> b!37830 (= e!23988 (not (isStrictlySorted!194 (toList!522 lm!264))))))

(declare-fun b!37831 () Bool)

(declare-fun tp!5606 () Bool)

(assert (=> b!37831 (= e!23989 tp!5606)))

(assert (= (and start!5170 res!22824) b!37830))

(assert (= start!5170 b!37831))

(declare-fun m!30559 () Bool)

(assert (=> start!5170 m!30559))

(declare-fun m!30561 () Bool)

(assert (=> start!5170 m!30561))

(declare-fun m!30563 () Bool)

(assert (=> b!37830 m!30563))

(push 1)

(assert (not b!37830))

(assert (not start!5170))

(assert (not b!37831))

(assert tp_is_empty!1699)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6101 () Bool)

(declare-fun res!22839 () Bool)

(declare-fun e!24010 () Bool)

(assert (=> d!6101 (=> res!22839 e!24010)))

(assert (=> d!6101 (= res!22839 (or (is-Nil!995 (toList!522 lm!264)) (is-Nil!995 (t!3831 (toList!522 lm!264)))))))

(assert (=> d!6101 (= (isStrictlySorted!194 (toList!522 lm!264)) e!24010)))

(declare-fun b!37852 () Bool)

(declare-fun e!24011 () Bool)

(assert (=> b!37852 (= e!24010 e!24011)))

(declare-fun res!22840 () Bool)

(assert (=> b!37852 (=> (not res!22840) (not e!24011))))

(assert (=> b!37852 (= res!22840 (bvslt (_1!729 (h!1562 (toList!522 lm!264))) (_1!729 (h!1562 (t!3831 (toList!522 lm!264))))))))

(declare-fun b!37853 () Bool)

(assert (=> b!37853 (= e!24011 (isStrictlySorted!194 (t!3831 (toList!522 lm!264))))))

(assert (= (and d!6101 (not res!22839)) b!37852))

(assert (= (and b!37852 res!22840) b!37853))

(declare-fun m!30577 () Bool)

(assert (=> b!37853 m!30577))

(assert (=> b!37830 d!6101))

(declare-fun d!6107 () Bool)

(declare-fun lt!13931 () Bool)

(declare-fun content!19 (List!998) (Set tuple2!1436))

(assert (=> d!6107 (= lt!13931 (set.member (tuple2!1437 a!526 b!99) (content!19 (toList!522 lm!264))))))

(declare-fun e!24025 () Bool)

(assert (=> d!6107 (= lt!13931 e!24025)))

(declare-fun res!22854 () Bool)

(assert (=> d!6107 (=> (not res!22854) (not e!24025))))

(assert (=> d!6107 (= res!22854 (is-Cons!994 (toList!522 lm!264)))))

(assert (=> d!6107 (= (contains!473 (toList!522 lm!264) (tuple2!1437 a!526 b!99)) lt!13931)))

(declare-fun b!37866 () Bool)

(declare-fun e!24024 () Bool)

(assert (=> b!37866 (= e!24025 e!24024)))

(declare-fun res!22853 () Bool)

(assert (=> b!37866 (=> res!22853 e!24024)))

(assert (=> b!37866 (= res!22853 (= (h!1562 (toList!522 lm!264)) (tuple2!1437 a!526 b!99)))))

(declare-fun b!37867 () Bool)

(assert (=> b!37867 (= e!24024 (contains!473 (t!3831 (toList!522 lm!264)) (tuple2!1437 a!526 b!99)))))

(assert (= (and d!6107 res!22854) b!37866))

(assert (= (and b!37866 (not res!22853)) b!37867))

(declare-fun m!30587 () Bool)

(assert (=> d!6107 m!30587))

(declare-fun m!30589 () Bool)

(assert (=> d!6107 m!30589))

(declare-fun m!30591 () Bool)

(assert (=> b!37867 m!30591))

(assert (=> start!5170 d!6107))

(declare-fun d!6113 () Bool)

(assert (=> d!6113 (= (inv!1683 lm!264) (isStrictlySorted!194 (toList!522 lm!264)))))

(declare-fun bs!1504 () Bool)

(assert (= bs!1504 d!6113))

(assert (=> bs!1504 m!30563))

(assert (=> start!5170 d!6113))

(declare-fun b!37876 () Bool)

(declare-fun e!24032 () Bool)

(declare-fun tp!5615 () Bool)

(assert (=> b!37876 (= e!24032 (and tp_is_empty!1699 tp!5615))))

(assert (=> b!37831 (= tp!5606 e!24032)))

(assert (= (and b!37831 (is-Cons!994 (toList!522 lm!264))) b!37876))

(push 1)

(assert tp_is_empty!1699)

(assert (not d!6107))

(assert (not b!37876))

(assert (not b!37853))

(assert (not d!6113))

(assert (not b!37867))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

