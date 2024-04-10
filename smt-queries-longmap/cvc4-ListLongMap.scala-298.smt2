; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5174 () Bool)

(assert start!5174)

(declare-fun res!22830 () Bool)

(declare-fun e!24000 () Bool)

(assert (=> start!5174 (=> (not res!22830) (not e!24000))))

(declare-datatypes ((B!780 0))(
  ( (B!781 (val!890 Int)) )
))
(declare-datatypes ((tuple2!1440 0))(
  ( (tuple2!1441 (_1!731 (_ BitVec 64)) (_2!731 B!780)) )
))
(declare-datatypes ((List!1000 0))(
  ( (Nil!997) (Cons!996 (h!1564 tuple2!1440) (t!3833 List!1000)) )
))
(declare-datatypes ((ListLongMap!1017 0))(
  ( (ListLongMap!1018 (toList!524 List!1000)) )
))
(declare-fun lm!264 () ListLongMap!1017)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun b!99 () B!780)

(declare-fun contains!475 (List!1000 tuple2!1440) Bool)

(assert (=> start!5174 (= res!22830 (contains!475 (toList!524 lm!264) (tuple2!1441 a!526 b!99)))))

(assert (=> start!5174 e!24000))

(declare-fun e!24001 () Bool)

(declare-fun inv!1685 (ListLongMap!1017) Bool)

(assert (=> start!5174 (and (inv!1685 lm!264) e!24001)))

(assert (=> start!5174 true))

(declare-fun tp_is_empty!1703 () Bool)

(assert (=> start!5174 tp_is_empty!1703))

(declare-fun b!37842 () Bool)

(declare-fun isStrictlySorted!196 (List!1000) Bool)

(assert (=> b!37842 (= e!24000 (not (isStrictlySorted!196 (toList!524 lm!264))))))

(declare-fun b!37843 () Bool)

(declare-fun tp!5612 () Bool)

(assert (=> b!37843 (= e!24001 tp!5612)))

(assert (= (and start!5174 res!22830) b!37842))

(assert (= start!5174 b!37843))

(declare-fun m!30571 () Bool)

(assert (=> start!5174 m!30571))

(declare-fun m!30573 () Bool)

(assert (=> start!5174 m!30573))

(declare-fun m!30575 () Bool)

(assert (=> b!37842 m!30575))

(push 1)

(assert (not b!37842))

(assert (not start!5174))

(assert (not b!37843))

(assert tp_is_empty!1703)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6103 () Bool)

(declare-fun res!22845 () Bool)

(declare-fun e!24016 () Bool)

(assert (=> d!6103 (=> res!22845 e!24016)))

(assert (=> d!6103 (= res!22845 (or (is-Nil!997 (toList!524 lm!264)) (is-Nil!997 (t!3833 (toList!524 lm!264)))))))

(assert (=> d!6103 (= (isStrictlySorted!196 (toList!524 lm!264)) e!24016)))

(declare-fun b!37858 () Bool)

(declare-fun e!24017 () Bool)

(assert (=> b!37858 (= e!24016 e!24017)))

(declare-fun res!22846 () Bool)

(assert (=> b!37858 (=> (not res!22846) (not e!24017))))

(assert (=> b!37858 (= res!22846 (bvslt (_1!731 (h!1564 (toList!524 lm!264))) (_1!731 (h!1564 (t!3833 (toList!524 lm!264))))))))

(declare-fun b!37859 () Bool)

(assert (=> b!37859 (= e!24017 (isStrictlySorted!196 (t!3833 (toList!524 lm!264))))))

(assert (= (and d!6103 (not res!22845)) b!37858))

(assert (= (and b!37858 res!22846) b!37859))

(declare-fun m!30579 () Bool)

(assert (=> b!37859 m!30579))

(assert (=> b!37842 d!6103))

(declare-fun lt!13934 () Bool)

(declare-fun d!6109 () Bool)

(declare-fun content!21 (List!1000) (Set tuple2!1440))

(assert (=> d!6109 (= lt!13934 (member (tuple2!1441 a!526 b!99) (content!21 (toList!524 lm!264))))))

(declare-fun e!24033 () Bool)

(assert (=> d!6109 (= lt!13934 e!24033)))

(declare-fun res!22859 () Bool)

(assert (=> d!6109 (=> (not res!22859) (not e!24033))))

(assert (=> d!6109 (= res!22859 (is-Cons!996 (toList!524 lm!264)))))

(assert (=> d!6109 (= (contains!475 (toList!524 lm!264) (tuple2!1441 a!526 b!99)) lt!13934)))

(declare-fun b!37877 () Bool)

(declare-fun e!24034 () Bool)

(assert (=> b!37877 (= e!24033 e!24034)))

(declare-fun res!22860 () Bool)

(assert (=> b!37877 (=> res!22860 e!24034)))

(assert (=> b!37877 (= res!22860 (= (h!1564 (toList!524 lm!264)) (tuple2!1441 a!526 b!99)))))

