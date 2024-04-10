; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5198 () Bool)

(assert start!5198)

(declare-fun res!22875 () Bool)

(declare-fun e!24064 () Bool)

(assert (=> start!5198 (=> (not res!22875) (not e!24064))))

(declare-datatypes ((B!786 0))(
  ( (B!787 (val!893 Int)) )
))
(declare-fun b!99 () B!786)

(declare-datatypes ((tuple2!1446 0))(
  ( (tuple2!1447 (_1!734 (_ BitVec 64)) (_2!734 B!786)) )
))
(declare-datatypes ((List!1003 0))(
  ( (Nil!1000) (Cons!999 (h!1567 tuple2!1446) (t!3836 List!1003)) )
))
(declare-datatypes ((ListLongMap!1023 0))(
  ( (ListLongMap!1024 (toList!527 List!1003)) )
))
(declare-fun lm!264 () ListLongMap!1023)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!478 (List!1003 tuple2!1446) Bool)

(assert (=> start!5198 (= res!22875 (contains!478 (toList!527 lm!264) (tuple2!1447 a!526 b!99)))))

(assert (=> start!5198 e!24064))

(declare-fun e!24063 () Bool)

(declare-fun inv!1693 (ListLongMap!1023) Bool)

(assert (=> start!5198 (and (inv!1693 lm!264) e!24063)))

(assert (=> start!5198 true))

(declare-fun tp_is_empty!1709 () Bool)

(assert (=> start!5198 tp_is_empty!1709))

(declare-fun b!37911 () Bool)

(declare-fun isStrictlySorted!199 (List!1003) Bool)

(assert (=> b!37911 (= e!24064 (not (isStrictlySorted!199 (toList!527 lm!264))))))

(declare-fun containsKey!62 (List!1003 (_ BitVec 64)) Bool)

(assert (=> b!37911 (containsKey!62 (toList!527 lm!264) a!526)))

(declare-datatypes ((Unit!879 0))(
  ( (Unit!880) )
))
(declare-fun lt!13943 () Unit!879)

(declare-fun lemmaContainsTupleThenContainsKey!6 (List!1003 (_ BitVec 64) B!786) Unit!879)

(assert (=> b!37911 (= lt!13943 (lemmaContainsTupleThenContainsKey!6 (toList!527 lm!264) a!526 b!99))))

(declare-fun b!37912 () Bool)

(declare-fun tp!5630 () Bool)

(assert (=> b!37912 (= e!24063 tp!5630)))

(assert (= (and start!5198 res!22875) b!37911))

(assert (= start!5198 b!37912))

(declare-fun m!30621 () Bool)

(assert (=> start!5198 m!30621))

(declare-fun m!30623 () Bool)

(assert (=> start!5198 m!30623))

(declare-fun m!30625 () Bool)

(assert (=> b!37911 m!30625))

(declare-fun m!30627 () Bool)

(assert (=> b!37911 m!30627))

(declare-fun m!30629 () Bool)

(assert (=> b!37911 m!30629))

(push 1)

(assert (not b!37911))

(assert (not start!5198))

(assert (not b!37912))

(assert tp_is_empty!1709)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6125 () Bool)

(declare-fun res!22890 () Bool)

(declare-fun e!24079 () Bool)

(assert (=> d!6125 (=> res!22890 e!24079)))

(assert (=> d!6125 (= res!22890 (or (is-Nil!1000 (toList!527 lm!264)) (is-Nil!1000 (t!3836 (toList!527 lm!264)))))))

(assert (=> d!6125 (= (isStrictlySorted!199 (toList!527 lm!264)) e!24079)))

(declare-fun b!37927 () Bool)

(declare-fun e!24080 () Bool)

(assert (=> b!37927 (= e!24079 e!24080)))

(declare-fun res!22891 () Bool)

(assert (=> b!37927 (=> (not res!22891) (not e!24080))))

(assert (=> b!37927 (= res!22891 (bvslt (_1!734 (h!1567 (toList!527 lm!264))) (_1!734 (h!1567 (t!3836 (toList!527 lm!264))))))))

(declare-fun b!37928 () Bool)

(assert (=> b!37928 (= e!24080 (isStrictlySorted!199 (t!3836 (toList!527 lm!264))))))

(assert (= (and d!6125 (not res!22890)) b!37927))

(assert (= (and b!37927 res!22891) b!37928))

(declare-fun m!30637 () Bool)

(assert (=> b!37928 m!30637))

(assert (=> b!37911 d!6125))

(declare-fun d!6129 () Bool)

(declare-fun res!22910 () Bool)

(declare-fun e!24099 () Bool)

(assert (=> d!6129 (=> res!22910 e!24099)))

(assert (=> d!6129 (= res!22910 (and (is-Cons!999 (toList!527 lm!264)) (= (_1!734 (h!1567 (toList!527 lm!264))) a!526)))))

(assert (=> d!6129 (= (containsKey!62 (toList!527 lm!264) a!526) e!24099)))

(declare-fun b!37945 () Bool)

(declare-fun e!24100 () Bool)

(assert (=> b!37945 (= e!24099 e!24100)))

(declare-fun res!22911 () Bool)

(assert (=> b!37945 (=> (not res!22911) (not e!24100))))

(assert (=> b!37945 (= res!22911 (and (or (not (is-Cons!999 (toList!527 lm!264))) (bvsle (_1!734 (h!1567 (toList!527 lm!264))) a!526)) (is-Cons!999 (toList!527 lm!264)) (bvslt (_1!734 (h!1567 (toList!527 lm!264))) a!526)))))

(declare-fun b!37946 () Bool)

(assert (=> b!37946 (= e!24100 (containsKey!62 (t!3836 (toList!527 lm!264)) a!526))))

(assert (= (and d!6129 (not res!22910)) b!37945))

(assert (= (and b!37945 res!22911) b!37946))

(declare-fun m!30647 () Bool)

(assert (=> b!37946 m!30647))

(assert (=> b!37911 d!6129))

(declare-fun d!6139 () Bool)

(assert (=> d!6139 (containsKey!62 (toList!527 lm!264) a!526)))

(declare-fun lt!13955 () Unit!879)

(declare-fun choose!241 (List!1003 (_ BitVec 64) B!786) Unit!879)

(assert (=> d!6139 (= lt!13955 (choose!241 (toList!527 lm!264) a!526 b!99))))

(declare-fun e!24118 () Bool)

(assert (=> d!6139 e!24118))

