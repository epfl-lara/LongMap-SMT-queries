; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75032 () Bool)

(assert start!75032)

(declare-datatypes ((B!1230 0))(
  ( (B!1231 (val!8921 Int)) )
))
(declare-datatypes ((tuple2!11836 0))(
  ( (tuple2!11837 (_1!5929 (_ BitVec 64)) (_2!5929 B!1230)) )
))
(declare-datatypes ((List!17637 0))(
  ( (Nil!17634) (Cons!17633 (h!18764 tuple2!11836) (t!24914 List!17637)) )
))
(declare-datatypes ((ListLongMap!10605 0))(
  ( (ListLongMap!10606 (toList!5318 List!17637)) )
))
(declare-fun lm!210 () ListLongMap!10605)

(declare-fun isStrictlySorted!464 (List!17637) Bool)

(assert (=> start!75032 (not (isStrictlySorted!464 (toList!5318 lm!210)))))

(declare-fun e!492513 () Bool)

(declare-fun inv!29363 (ListLongMap!10605) Bool)

(assert (=> start!75032 (and (inv!29363 lm!210) e!492513)))

(declare-fun b!884983 () Bool)

(declare-fun tp!54200 () Bool)

(assert (=> b!884983 (= e!492513 tp!54200)))

(assert (= start!75032 b!884983))

(declare-fun m!825243 () Bool)

(assert (=> start!75032 m!825243))

(declare-fun m!825245 () Bool)

(assert (=> start!75032 m!825245))

(push 1)

(assert (not start!75032))

(assert (not b!884983))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109295 () Bool)

(declare-fun res!601173 () Bool)

(declare-fun e!492530 () Bool)

(assert (=> d!109295 (=> res!601173 e!492530)))

(assert (=> d!109295 (= res!601173 (or (is-Nil!17634 (toList!5318 lm!210)) (is-Nil!17634 (t!24914 (toList!5318 lm!210)))))))

(assert (=> d!109295 (= (isStrictlySorted!464 (toList!5318 lm!210)) e!492530)))

(declare-fun b!885000 () Bool)

(declare-fun e!492531 () Bool)

(assert (=> b!885000 (= e!492530 e!492531)))

(declare-fun res!601174 () Bool)

(assert (=> b!885000 (=> (not res!601174) (not e!492531))))

(assert (=> b!885000 (= res!601174 (bvslt (_1!5929 (h!18764 (toList!5318 lm!210))) (_1!5929 (h!18764 (t!24914 (toList!5318 lm!210))))))))

(declare-fun b!885001 () Bool)

(assert (=> b!885001 (= e!492531 (isStrictlySorted!464 (t!24914 (toList!5318 lm!210))))))

(assert (= (and d!109295 (not res!601173)) b!885000))

(assert (= (and b!885000 res!601174) b!885001))

(declare-fun m!825251 () Bool)

(assert (=> b!885001 m!825251))

(assert (=> start!75032 d!109295))

(declare-fun d!109303 () Bool)

(assert (=> d!109303 (= (inv!29363 lm!210) (isStrictlySorted!464 (toList!5318 lm!210)))))

(declare-fun bs!24803 () Bool)

(assert (= bs!24803 d!109303))

(assert (=> bs!24803 m!825243))

(assert (=> start!75032 d!109303))

(declare-fun b!885016 () Bool)

