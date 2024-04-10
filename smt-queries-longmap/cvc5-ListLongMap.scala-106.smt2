; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1722 () Bool)

(assert start!1722)

(declare-fun b!12103 () Bool)

(declare-fun e!7222 () Bool)

(declare-fun e!7220 () Bool)

(assert (=> b!12103 (= e!7222 e!7220)))

(declare-fun res!9865 () Bool)

(assert (=> b!12103 (=> (not res!9865) (not e!7220))))

(declare-datatypes ((B!440 0))(
  ( (B!441 (val!315 Int)) )
))
(declare-datatypes ((Option!47 0))(
  ( (Some!46 (v!1361 B!440)) (None!45) )
))
(declare-fun lt!3099 () Option!47)

(declare-fun key!303 () (_ BitVec 64))

(declare-datatypes ((tuple2!430 0))(
  ( (tuple2!431 (_1!215 (_ BitVec 64)) (_2!215 B!440)) )
))
(declare-datatypes ((List!367 0))(
  ( (Nil!364) (Cons!363 (h!929 tuple2!430) (t!2754 List!367)) )
))
(declare-fun l!1094 () List!367)

(declare-fun getValueByKey!41 (List!367 (_ BitVec 64)) Option!47)

(assert (=> b!12103 (= res!9865 (= (getValueByKey!41 l!1094 key!303) lt!3099))))

(declare-fun v!194 () B!440)

(assert (=> b!12103 (= lt!3099 (Some!46 v!194))))

(declare-fun b!12104 () Bool)

(declare-fun res!9863 () Bool)

(assert (=> b!12104 (=> (not res!9863) (not e!7220))))

(assert (=> b!12104 (= res!9863 (and (is-Cons!363 l!1094) (not (= (_1!215 (h!929 l!1094)) key!303))))))

(declare-fun res!9864 () Bool)

(assert (=> start!1722 (=> (not res!9864) (not e!7222))))

(declare-fun isStrictlySorted!60 (List!367) Bool)

(assert (=> start!1722 (= res!9864 (isStrictlySorted!60 l!1094))))

(assert (=> start!1722 e!7222))

(declare-fun e!7223 () Bool)

(assert (=> start!1722 e!7223))

(declare-fun tp_is_empty!613 () Bool)

(assert (=> start!1722 tp_is_empty!613))

(assert (=> start!1722 true))

(declare-fun b!12105 () Bool)

(declare-fun e!7221 () Bool)

(assert (=> b!12105 (= e!7220 e!7221)))

(declare-fun res!9862 () Bool)

(assert (=> b!12105 (=> res!9862 e!7221)))

(assert (=> b!12105 (= res!9862 (not (isStrictlySorted!60 (t!2754 l!1094))))))

(declare-fun b!12106 () Bool)

(declare-fun tp!2042 () Bool)

(assert (=> b!12106 (= e!7223 (and tp_is_empty!613 tp!2042))))

(declare-fun b!12107 () Bool)

(assert (=> b!12107 (= e!7221 (not (= (getValueByKey!41 (t!2754 l!1094) key!303) lt!3099)))))

(assert (= (and start!1722 res!9864) b!12103))

(assert (= (and b!12103 res!9865) b!12104))

(assert (= (and b!12104 res!9863) b!12105))

(assert (= (and b!12105 (not res!9862)) b!12107))

(assert (= (and start!1722 (is-Cons!363 l!1094)) b!12106))

(declare-fun m!8363 () Bool)

(assert (=> b!12103 m!8363))

(declare-fun m!8365 () Bool)

(assert (=> start!1722 m!8365))

(declare-fun m!8367 () Bool)

(assert (=> b!12105 m!8367))

(declare-fun m!8369 () Bool)

(assert (=> b!12107 m!8369))

(push 1)

(assert (not start!1722))

(assert (not b!12107))

(assert (not b!12103))

(assert (not b!12106))

(assert (not b!12105))

(assert tp_is_empty!613)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!12186 () Bool)

(declare-fun e!7276 () Option!47)

(assert (=> b!12186 (= e!7276 (Some!46 (_2!215 (h!929 l!1094))))))

(declare-fun b!12188 () Bool)

(declare-fun e!7277 () Option!47)

(assert (=> b!12188 (= e!7277 (getValueByKey!41 (t!2754 l!1094) key!303))))

(declare-fun d!1695 () Bool)

(declare-fun c!1059 () Bool)

(assert (=> d!1695 (= c!1059 (and (is-Cons!363 l!1094) (= (_1!215 (h!929 l!1094)) key!303)))))

(assert (=> d!1695 (= (getValueByKey!41 l!1094 key!303) e!7276)))

(declare-fun b!12189 () Bool)

(assert (=> b!12189 (= e!7277 None!45)))

(declare-fun b!12187 () Bool)

(assert (=> b!12187 (= e!7276 e!7277)))

(declare-fun c!1060 () Bool)

(assert (=> b!12187 (= c!1060 (and (is-Cons!363 l!1094) (not (= (_1!215 (h!929 l!1094)) key!303))))))

(assert (= (and d!1695 c!1059) b!12186))

(assert (= (and d!1695 (not c!1059)) b!12187))

(assert (= (and b!12187 c!1060) b!12188))

(assert (= (and b!12187 (not c!1060)) b!12189))

(assert (=> b!12188 m!8369))

(assert (=> b!12103 d!1695))

(declare-fun d!1703 () Bool)

(declare-fun res!9908 () Bool)

(declare-fun e!7289 () Bool)

(assert (=> d!1703 (=> res!9908 e!7289)))

(assert (=> d!1703 (= res!9908 (or (is-Nil!364 l!1094) (is-Nil!364 (t!2754 l!1094))))))

(assert (=> d!1703 (= (isStrictlySorted!60 l!1094) e!7289)))

(declare-fun b!12201 () Bool)

(declare-fun e!7290 () Bool)

(assert (=> b!12201 (= e!7289 e!7290)))

(declare-fun res!9909 () Bool)

(assert (=> b!12201 (=> (not res!9909) (not e!7290))))

(assert (=> b!12201 (= res!9909 (bvslt (_1!215 (h!929 l!1094)) (_1!215 (h!929 (t!2754 l!1094)))))))

(declare-fun b!12202 () Bool)

(assert (=> b!12202 (= e!7290 (isStrictlySorted!60 (t!2754 l!1094)))))

(assert (= (and d!1703 (not res!9908)) b!12201))

(assert (= (and b!12201 res!9909) b!12202))

(assert (=> b!12202 m!8367))

(assert (=> start!1722 d!1703))

(declare-fun d!1707 () Bool)

(declare-fun res!9912 () Bool)

(declare-fun e!7293 () Bool)

(assert (=> d!1707 (=> res!9912 e!7293)))

(assert (=> d!1707 (= res!9912 (or (is-Nil!364 (t!2754 l!1094)) (is-Nil!364 (t!2754 (t!2754 l!1094)))))))

(assert (=> d!1707 (= (isStrictlySorted!60 (t!2754 l!1094)) e!7293)))

(declare-fun b!12205 () Bool)

(declare-fun e!7294 () Bool)

(assert (=> b!12205 (= e!7293 e!7294)))

(declare-fun res!9913 () Bool)

(assert (=> b!12205 (=> (not res!9913) (not e!7294))))

