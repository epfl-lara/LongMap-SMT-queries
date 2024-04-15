; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1726 () Bool)

(assert start!1726)

(declare-fun b!12133 () Bool)

(declare-fun e!7245 () Bool)

(declare-fun e!7247 () Bool)

(assert (=> b!12133 (= e!7245 e!7247)))

(declare-fun res!9886 () Bool)

(assert (=> b!12133 (=> (not res!9886) (not e!7247))))

(declare-fun key!303 () (_ BitVec 64))

(declare-datatypes ((B!444 0))(
  ( (B!445 (val!317 Int)) )
))
(declare-datatypes ((tuple2!430 0))(
  ( (tuple2!431 (_1!215 (_ BitVec 64)) (_2!215 B!444)) )
))
(declare-datatypes ((List!365 0))(
  ( (Nil!362) (Cons!361 (h!927 tuple2!430) (t!2752 List!365)) )
))
(declare-fun l!1094 () List!365)

(declare-datatypes ((Option!49 0))(
  ( (Some!48 (v!1363 B!444)) (None!47) )
))
(declare-fun lt!3105 () Option!49)

(declare-fun getValueByKey!43 (List!365 (_ BitVec 64)) Option!49)

(assert (=> b!12133 (= res!9886 (= (getValueByKey!43 l!1094 key!303) lt!3105))))

(declare-fun v!194 () B!444)

(assert (=> b!12133 (= lt!3105 (Some!48 v!194))))

(declare-fun res!9889 () Bool)

(assert (=> start!1726 (=> (not res!9889) (not e!7245))))

(declare-fun isStrictlySorted!59 (List!365) Bool)

(assert (=> start!1726 (= res!9889 (isStrictlySorted!59 l!1094))))

(assert (=> start!1726 e!7245))

(declare-fun e!7244 () Bool)

(assert (=> start!1726 e!7244))

(declare-fun tp_is_empty!617 () Bool)

(assert (=> start!1726 tp_is_empty!617))

(assert (=> start!1726 true))

(declare-fun b!12134 () Bool)

(declare-fun e!7246 () Bool)

(assert (=> b!12134 (= e!7247 e!7246)))

(declare-fun res!9887 () Bool)

(assert (=> b!12134 (=> res!9887 e!7246)))

(assert (=> b!12134 (= res!9887 (not (isStrictlySorted!59 (t!2752 l!1094))))))

(declare-fun b!12135 () Bool)

(assert (=> b!12135 (= e!7246 (not (= (getValueByKey!43 (t!2752 l!1094) key!303) lt!3105)))))

(declare-fun b!12136 () Bool)

(declare-fun tp!2048 () Bool)

(assert (=> b!12136 (= e!7244 (and tp_is_empty!617 tp!2048))))

(declare-fun b!12137 () Bool)

(declare-fun res!9888 () Bool)

(assert (=> b!12137 (=> (not res!9888) (not e!7247))))

(assert (=> b!12137 (= res!9888 (and (is-Cons!361 l!1094) (not (= (_1!215 (h!927 l!1094)) key!303))))))

(assert (= (and start!1726 res!9889) b!12133))

(assert (= (and b!12133 res!9886) b!12137))

(assert (= (and b!12137 res!9888) b!12134))

(assert (= (and b!12134 (not res!9887)) b!12135))

(assert (= (and start!1726 (is-Cons!361 l!1094)) b!12136))

(declare-fun m!8377 () Bool)

(assert (=> b!12133 m!8377))

(declare-fun m!8379 () Bool)

(assert (=> start!1726 m!8379))

(declare-fun m!8381 () Bool)

(assert (=> b!12134 m!8381))

(declare-fun m!8383 () Bool)

(assert (=> b!12135 m!8383))

(push 1)

(assert (not b!12135))

(assert (not start!1726))

(assert tp_is_empty!617)

(assert (not b!12136))

(assert (not b!12133))

(assert (not b!12134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1693 () Bool)

(declare-fun res!9900 () Bool)

(declare-fun e!7262 () Bool)

(assert (=> d!1693 (=> res!9900 e!7262)))

(assert (=> d!1693 (= res!9900 (or (is-Nil!362 l!1094) (is-Nil!362 (t!2752 l!1094))))))

(assert (=> d!1693 (= (isStrictlySorted!59 l!1094) e!7262)))

(declare-fun b!12156 () Bool)

(declare-fun e!7263 () Bool)

(assert (=> b!12156 (= e!7262 e!7263)))

(declare-fun res!9901 () Bool)

(assert (=> b!12156 (=> (not res!9901) (not e!7263))))

(assert (=> b!12156 (= res!9901 (bvslt (_1!215 (h!927 l!1094)) (_1!215 (h!927 (t!2752 l!1094)))))))

(declare-fun b!12157 () Bool)

(assert (=> b!12157 (= e!7263 (isStrictlySorted!59 (t!2752 l!1094)))))

(assert (= (and d!1693 (not res!9900)) b!12156))

(assert (= (and b!12156 res!9901) b!12157))

(assert (=> b!12157 m!8381))

(assert (=> start!1726 d!1693))

(declare-fun b!12189 () Bool)

(declare-fun e!7281 () Option!49)

(assert (=> b!12189 (= e!7281 None!47)))

(declare-fun b!12186 () Bool)

(declare-fun e!7280 () Option!49)

(assert (=> b!12186 (= e!7280 (Some!48 (_2!215 (h!927 l!1094))))))

(declare-fun b!12188 () Bool)

(assert (=> b!12188 (= e!7281 (getValueByKey!43 (t!2752 l!1094) key!303))))

(declare-fun d!1695 () Bool)

(declare-fun c!1057 () Bool)

(assert (=> d!1695 (= c!1057 (and (is-Cons!361 l!1094) (= (_1!215 (h!927 l!1094)) key!303)))))

(assert (=> d!1695 (= (getValueByKey!43 l!1094 key!303) e!7280)))

(declare-fun b!12187 () Bool)

(assert (=> b!12187 (= e!7280 e!7281)))

(declare-fun c!1058 () Bool)

(assert (=> b!12187 (= c!1058 (and (is-Cons!361 l!1094) (not (= (_1!215 (h!927 l!1094)) key!303))))))

(assert (= (and d!1695 c!1057) b!12186))

(assert (= (and d!1695 (not c!1057)) b!12187))

(assert (= (and b!12187 c!1058) b!12188))

(assert (= (and b!12187 (not c!1058)) b!12189))

(assert (=> b!12188 m!8383))

(assert (=> b!12133 d!1695))

(declare-fun d!1703 () Bool)

(declare-fun res!9908 () Bool)

(declare-fun e!7284 () Bool)

(assert (=> d!1703 (=> res!9908 e!7284)))

(assert (=> d!1703 (= res!9908 (or (is-Nil!362 (t!2752 l!1094)) (is-Nil!362 (t!2752 (t!2752 l!1094)))))))

(assert (=> d!1703 (= (isStrictlySorted!59 (t!2752 l!1094)) e!7284)))

(declare-fun b!12192 () Bool)

(declare-fun e!7285 () Bool)

(assert (=> b!12192 (= e!7284 e!7285)))

(declare-fun res!9909 () Bool)

(assert (=> b!12192 (=> (not res!9909) (not e!7285))))

(assert (=> b!12192 (= res!9909 (bvslt (_1!215 (h!927 (t!2752 l!1094))) (_1!215 (h!927 (t!2752 (t!2752 l!1094))))))))

(declare-fun b!12193 () Bool)

(assert (=> b!12193 (= e!7285 (isStrictlySorted!59 (t!2752 (t!2752 l!1094))))))

(assert (= (and d!1703 (not res!9908)) b!12192))

(assert (= (and b!12192 res!9909) b!12193))

(declare-fun m!8387 () Bool)

(assert (=> b!12193 m!8387))

(assert (=> b!12134 d!1703))

(declare-fun b!12197 () Bool)

(declare-fun e!7287 () Option!49)

(assert (=> b!12197 (= e!7287 None!47)))

(declare-fun b!12194 () Bool)

(declare-fun e!7286 () Option!49)

(assert (=> b!12194 (= e!7286 (Some!48 (_2!215 (h!927 (t!2752 l!1094)))))))

(declare-fun b!12196 () Bool)

(assert (=> b!12196 (= e!7287 (getValueByKey!43 (t!2752 (t!2752 l!1094)) key!303))))

(declare-fun d!1705 () Bool)

(declare-fun c!1059 () Bool)

(assert (=> d!1705 (= c!1059 (and (is-Cons!361 (t!2752 l!1094)) (= (_1!215 (h!927 (t!2752 l!1094))) key!303)))))

(assert (=> d!1705 (= (getValueByKey!43 (t!2752 l!1094) key!303) e!7286)))

(declare-fun b!12195 () Bool)

(assert (=> b!12195 (= e!7286 e!7287)))

(declare-fun c!1060 () Bool)

(assert (=> b!12195 (= c!1060 (and (is-Cons!361 (t!2752 l!1094)) (not (= (_1!215 (h!927 (t!2752 l!1094))) key!303))))))

(assert (= (and d!1705 c!1059) b!12194))

(assert (= (and d!1705 (not c!1059)) b!12195))

(assert (= (and b!12195 c!1060) b!12196))

(assert (= (and b!12195 (not c!1060)) b!12197))

(declare-fun m!8391 () Bool)

(assert (=> b!12196 m!8391))

(assert (=> b!12135 d!1705))

(declare-fun b!12208 () Bool)

(declare-fun e!7294 () Bool)

(declare-fun tp!2053 () Bool)

(assert (=> b!12208 (= e!7294 (and tp_is_empty!617 tp!2053))))

(assert (=> b!12136 (= tp!2048 e!7294)))

(assert (= (and b!12136 (is-Cons!361 (t!2752 l!1094))) b!12208))

(push 1)

(assert tp_is_empty!617)

(assert (not b!12193))

(assert (not b!12208))

(assert (not b!12196))

(assert (not b!12157))

(assert (not b!12188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

