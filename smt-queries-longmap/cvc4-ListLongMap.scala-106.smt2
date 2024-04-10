; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1726 () Bool)

(assert start!1726)

(declare-fun b!12133 () Bool)

(declare-fun e!7247 () Bool)

(declare-fun tp_is_empty!617 () Bool)

(declare-fun tp!2048 () Bool)

(assert (=> b!12133 (= e!7247 (and tp_is_empty!617 tp!2048))))

(declare-fun res!9889 () Bool)

(declare-fun e!7246 () Bool)

(assert (=> start!1726 (=> (not res!9889) (not e!7246))))

(declare-datatypes ((B!444 0))(
  ( (B!445 (val!317 Int)) )
))
(declare-datatypes ((tuple2!434 0))(
  ( (tuple2!435 (_1!217 (_ BitVec 64)) (_2!217 B!444)) )
))
(declare-datatypes ((List!369 0))(
  ( (Nil!366) (Cons!365 (h!931 tuple2!434) (t!2756 List!369)) )
))
(declare-fun l!1094 () List!369)

(declare-fun isStrictlySorted!62 (List!369) Bool)

(assert (=> start!1726 (= res!9889 (isStrictlySorted!62 l!1094))))

(assert (=> start!1726 e!7246))

(assert (=> start!1726 e!7247))

(assert (=> start!1726 tp_is_empty!617))

(assert (=> start!1726 true))

(declare-fun b!12134 () Bool)

(declare-fun e!7245 () Bool)

(declare-fun e!7244 () Bool)

(assert (=> b!12134 (= e!7245 e!7244)))

(declare-fun res!9888 () Bool)

(assert (=> b!12134 (=> res!9888 e!7244)))

(assert (=> b!12134 (= res!9888 (not (isStrictlySorted!62 (t!2756 l!1094))))))

(declare-fun b!12135 () Bool)

(assert (=> b!12135 (= e!7246 e!7245)))

(declare-fun res!9886 () Bool)

(assert (=> b!12135 (=> (not res!9886) (not e!7245))))

(declare-datatypes ((Option!49 0))(
  ( (Some!48 (v!1363 B!444)) (None!47) )
))
(declare-fun lt!3105 () Option!49)

(declare-fun key!303 () (_ BitVec 64))

(declare-fun getValueByKey!43 (List!369 (_ BitVec 64)) Option!49)

(assert (=> b!12135 (= res!9886 (= (getValueByKey!43 l!1094 key!303) lt!3105))))

(declare-fun v!194 () B!444)

(assert (=> b!12135 (= lt!3105 (Some!48 v!194))))

(declare-fun b!12136 () Bool)

(declare-fun res!9887 () Bool)

(assert (=> b!12136 (=> (not res!9887) (not e!7245))))

(assert (=> b!12136 (= res!9887 (and (is-Cons!365 l!1094) (not (= (_1!217 (h!931 l!1094)) key!303))))))

(declare-fun b!12137 () Bool)

(assert (=> b!12137 (= e!7244 (not (= (getValueByKey!43 (t!2756 l!1094) key!303) lt!3105)))))

(assert (= (and start!1726 res!9889) b!12135))

(assert (= (and b!12135 res!9886) b!12136))

(assert (= (and b!12136 res!9887) b!12134))

(assert (= (and b!12134 (not res!9888)) b!12137))

(assert (= (and start!1726 (is-Cons!365 l!1094)) b!12133))

(declare-fun m!8379 () Bool)

(assert (=> start!1726 m!8379))

(declare-fun m!8381 () Bool)

(assert (=> b!12134 m!8381))

(declare-fun m!8383 () Bool)

(assert (=> b!12135 m!8383))

(declare-fun m!8385 () Bool)

(assert (=> b!12137 m!8385))

(push 1)

(assert (not b!12137))

(assert tp_is_empty!617)

(assert (not b!12133))

(assert (not start!1726))

(assert (not b!12135))

(assert (not b!12134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1691 () Bool)

(declare-fun c!1057 () Bool)

(assert (=> d!1691 (= c!1057 (and (is-Cons!365 (t!2756 l!1094)) (= (_1!217 (h!931 (t!2756 l!1094))) key!303)))))

(declare-fun e!7272 () Option!49)

(assert (=> d!1691 (= (getValueByKey!43 (t!2756 l!1094) key!303) e!7272)))

(declare-fun b!12183 () Bool)

(declare-fun e!7273 () Option!49)

(assert (=> b!12183 (= e!7273 None!47)))

(declare-fun b!12182 () Bool)

(assert (=> b!12182 (= e!7273 (getValueByKey!43 (t!2756 (t!2756 l!1094)) key!303))))

(declare-fun b!12180 () Bool)

(assert (=> b!12180 (= e!7272 (Some!48 (_2!217 (h!931 (t!2756 l!1094)))))))

(declare-fun b!12181 () Bool)

(assert (=> b!12181 (= e!7272 e!7273)))

(declare-fun c!1058 () Bool)

(assert (=> b!12181 (= c!1058 (and (is-Cons!365 (t!2756 l!1094)) (not (= (_1!217 (h!931 (t!2756 l!1094))) key!303))))))

(assert (= (and d!1691 c!1057) b!12180))

(assert (= (and d!1691 (not c!1057)) b!12181))

(assert (= (and b!12181 c!1058) b!12182))

(assert (= (and b!12181 (not c!1058)) b!12183))

(declare-fun m!8391 () Bool)

(assert (=> b!12182 m!8391))

(assert (=> b!12137 d!1691))

(declare-fun d!1701 () Bool)

(declare-fun res!9906 () Bool)

(declare-fun e!7287 () Bool)

(assert (=> d!1701 (=> res!9906 e!7287)))

(assert (=> d!1701 (= res!9906 (or (is-Nil!366 l!1094) (is-Nil!366 (t!2756 l!1094))))))

(assert (=> d!1701 (= (isStrictlySorted!62 l!1094) e!7287)))

(declare-fun b!12199 () Bool)

(declare-fun e!7288 () Bool)

(assert (=> b!12199 (= e!7287 e!7288)))

(declare-fun res!9907 () Bool)

(assert (=> b!12199 (=> (not res!9907) (not e!7288))))

(assert (=> b!12199 (= res!9907 (bvslt (_1!217 (h!931 l!1094)) (_1!217 (h!931 (t!2756 l!1094)))))))

(declare-fun b!12200 () Bool)

(assert (=> b!12200 (= e!7288 (isStrictlySorted!62 (t!2756 l!1094)))))

