; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1684 () Bool)

(assert start!1684)

(declare-fun b!11957 () Bool)

(declare-fun res!9816 () Bool)

(declare-fun e!7121 () Bool)

(assert (=> b!11957 (=> (not res!9816) (not e!7121))))

(declare-datatypes ((B!420 0))(
  ( (B!421 (val!305 Int)) )
))
(declare-fun b!100 () B!420)

(declare-fun a!527 () (_ BitVec 64))

(declare-datatypes ((tuple2!410 0))(
  ( (tuple2!411 (_1!205 (_ BitVec 64)) (_2!205 B!420)) )
))
(declare-datatypes ((List!357 0))(
  ( (Nil!354) (Cons!353 (h!919 tuple2!410) (t!2744 List!357)) )
))
(declare-datatypes ((ListLongMap!391 0))(
  ( (ListLongMap!392 (toList!211 List!357)) )
))
(declare-fun lm!265 () ListLongMap!391)

(declare-datatypes ((Option!43 0))(
  ( (Some!42 (v!1357 B!420)) (None!41) )
))
(declare-fun getValueByKey!37 (List!357 (_ BitVec 64)) Option!43)

(assert (=> b!11957 (= res!9816 (= (getValueByKey!37 (toList!211 lm!265) a!527) (Some!42 b!100)))))

(declare-fun b!11958 () Bool)

(declare-fun res!9815 () Bool)

(assert (=> b!11958 (=> (not res!9815) (not e!7121))))

(declare-fun isStrictlySorted!56 (List!357) Bool)

(assert (=> b!11958 (= res!9815 (isStrictlySorted!56 (toList!211 lm!265)))))

(declare-fun b!11959 () Bool)

(assert (=> b!11959 (= e!7121 (not true))))

(declare-fun contains!181 (List!357 tuple2!410) Bool)

(assert (=> b!11959 (contains!181 (toList!211 lm!265) (tuple2!411 a!527 b!100))))

(declare-datatypes ((Unit!262 0))(
  ( (Unit!263) )
))
(declare-fun lt!3087 () Unit!262)

(declare-fun lemmaGetValueByKeyImpliesContainsTuple!3 (List!357 (_ BitVec 64) B!420) Unit!262)

(assert (=> b!11959 (= lt!3087 (lemmaGetValueByKeyImpliesContainsTuple!3 (toList!211 lm!265) a!527 b!100))))

(declare-fun res!9817 () Bool)

(assert (=> start!1684 (=> (not res!9817) (not e!7121))))

(declare-fun contains!182 (ListLongMap!391 (_ BitVec 64)) Bool)

(assert (=> start!1684 (= res!9817 (contains!182 lm!265 a!527))))

(assert (=> start!1684 e!7121))

(declare-fun e!7120 () Bool)

(declare-fun inv!600 (ListLongMap!391) Bool)

(assert (=> start!1684 (and (inv!600 lm!265) e!7120)))

(assert (=> start!1684 true))

(declare-fun tp_is_empty!593 () Bool)

(assert (=> start!1684 tp_is_empty!593))

(declare-fun b!11960 () Bool)

(declare-fun tp!2003 () Bool)

(assert (=> b!11960 (= e!7120 tp!2003)))

(assert (= (and start!1684 res!9817) b!11957))

(assert (= (and b!11957 res!9816) b!11958))

(assert (= (and b!11958 res!9815) b!11959))

(assert (= start!1684 b!11960))

(declare-fun m!8315 () Bool)

(assert (=> b!11957 m!8315))

(declare-fun m!8317 () Bool)

(assert (=> b!11958 m!8317))

(declare-fun m!8319 () Bool)

(assert (=> b!11959 m!8319))

(declare-fun m!8321 () Bool)

(assert (=> b!11959 m!8321))

(declare-fun m!8323 () Bool)

(assert (=> start!1684 m!8323))

(declare-fun m!8325 () Bool)

(assert (=> start!1684 m!8325))

(push 1)

(assert (not b!11958))

(assert (not b!11960))

(assert (not start!1684))

(assert tp_is_empty!593)

(assert (not b!11959))

(assert (not b!11957))

(check-sat)

(pop 1)

(push 1)

