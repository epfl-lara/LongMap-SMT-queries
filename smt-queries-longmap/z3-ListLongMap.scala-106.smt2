; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1722 () Bool)

(assert start!1722)

(declare-datatypes ((B!440 0))(
  ( (B!441 (val!315 Int)) )
))
(declare-datatypes ((Option!47 0))(
  ( (Some!46 (v!1361 B!440)) (None!45) )
))
(declare-fun lt!3099 () Option!47)

(declare-fun key!303 () (_ BitVec 64))

(declare-fun b!12103 () Bool)

(declare-fun e!7220 () Bool)

(declare-datatypes ((tuple2!426 0))(
  ( (tuple2!427 (_1!213 (_ BitVec 64)) (_2!213 B!440)) )
))
(declare-datatypes ((List!363 0))(
  ( (Nil!360) (Cons!359 (h!925 tuple2!426) (t!2750 List!363)) )
))
(declare-fun l!1094 () List!363)

(declare-fun getValueByKey!41 (List!363 (_ BitVec 64)) Option!47)

(assert (=> b!12103 (= e!7220 (not (= (getValueByKey!41 (t!2750 l!1094) key!303) lt!3099)))))

(declare-fun b!12104 () Bool)

(declare-fun res!9864 () Bool)

(declare-fun e!7222 () Bool)

(assert (=> b!12104 (=> (not res!9864) (not e!7222))))

(get-info :version)

(assert (=> b!12104 (= res!9864 (and ((_ is Cons!359) l!1094) (not (= (_1!213 (h!925 l!1094)) key!303))))))

(declare-fun res!9862 () Bool)

(declare-fun e!7223 () Bool)

(assert (=> start!1722 (=> (not res!9862) (not e!7223))))

(declare-fun isStrictlySorted!54 (List!363) Bool)

(assert (=> start!1722 (= res!9862 (isStrictlySorted!54 l!1094))))

(assert (=> start!1722 e!7223))

(declare-fun e!7221 () Bool)

(assert (=> start!1722 e!7221))

(declare-fun tp_is_empty!613 () Bool)

(assert (=> start!1722 tp_is_empty!613))

(assert (=> start!1722 true))

(declare-fun b!12105 () Bool)

(assert (=> b!12105 (= e!7223 e!7222)))

(declare-fun res!9863 () Bool)

(assert (=> b!12105 (=> (not res!9863) (not e!7222))))

(assert (=> b!12105 (= res!9863 (= (getValueByKey!41 l!1094 key!303) lt!3099))))

(declare-fun v!194 () B!440)

(assert (=> b!12105 (= lt!3099 (Some!46 v!194))))

(declare-fun b!12106 () Bool)

(declare-fun tp!2042 () Bool)

(assert (=> b!12106 (= e!7221 (and tp_is_empty!613 tp!2042))))

(declare-fun b!12107 () Bool)

(assert (=> b!12107 (= e!7222 e!7220)))

(declare-fun res!9865 () Bool)

(assert (=> b!12107 (=> res!9865 e!7220)))

(assert (=> b!12107 (= res!9865 (not (isStrictlySorted!54 (t!2750 l!1094))))))

(assert (= (and start!1722 res!9862) b!12105))

(assert (= (and b!12105 res!9863) b!12104))

(assert (= (and b!12104 res!9864) b!12107))

(assert (= (and b!12107 (not res!9865)) b!12103))

(assert (= (and start!1722 ((_ is Cons!359) l!1094)) b!12106))

(declare-fun m!8359 () Bool)

(assert (=> b!12103 m!8359))

(declare-fun m!8361 () Bool)

(assert (=> start!1722 m!8361))

(declare-fun m!8363 () Bool)

(assert (=> b!12105 m!8363))

(declare-fun m!8365 () Bool)

(assert (=> b!12107 m!8365))

(check-sat (not start!1722) (not b!12105) (not b!12106) tp_is_empty!613 (not b!12107) (not b!12103))
(check-sat)
(get-model)

(declare-fun b!12149 () Bool)

(declare-fun e!7253 () Option!47)

(assert (=> b!12149 (= e!7253 None!45)))

(declare-fun b!12147 () Bool)

(declare-fun e!7252 () Option!47)

(assert (=> b!12147 (= e!7252 e!7253)))

(declare-fun c!1046 () Bool)

(assert (=> b!12147 (= c!1046 (and ((_ is Cons!359) l!1094) (not (= (_1!213 (h!925 l!1094)) key!303))))))

(declare-fun b!12148 () Bool)

(assert (=> b!12148 (= e!7253 (getValueByKey!41 (t!2750 l!1094) key!303))))

(declare-fun d!1689 () Bool)

(declare-fun c!1045 () Bool)

(assert (=> d!1689 (= c!1045 (and ((_ is Cons!359) l!1094) (= (_1!213 (h!925 l!1094)) key!303)))))

(assert (=> d!1689 (= (getValueByKey!41 l!1094 key!303) e!7252)))

(declare-fun b!12146 () Bool)

(assert (=> b!12146 (= e!7252 (Some!46 (_2!213 (h!925 l!1094))))))

(assert (= (and d!1689 c!1045) b!12146))

(assert (= (and d!1689 (not c!1045)) b!12147))

(assert (= (and b!12147 c!1046) b!12148))

(assert (= (and b!12147 (not c!1046)) b!12149))

(assert (=> b!12148 m!8359))

(assert (=> b!12105 d!1689))

(declare-fun d!1693 () Bool)

(declare-fun res!9894 () Bool)

(declare-fun e!7264 () Bool)

(assert (=> d!1693 (=> res!9894 e!7264)))

(assert (=> d!1693 (= res!9894 (or ((_ is Nil!360) (t!2750 l!1094)) ((_ is Nil!360) (t!2750 (t!2750 l!1094)))))))

(assert (=> d!1693 (= (isStrictlySorted!54 (t!2750 l!1094)) e!7264)))

(declare-fun b!12166 () Bool)

(declare-fun e!7265 () Bool)

(assert (=> b!12166 (= e!7264 e!7265)))

(declare-fun res!9895 () Bool)

(assert (=> b!12166 (=> (not res!9895) (not e!7265))))

(assert (=> b!12166 (= res!9895 (bvslt (_1!213 (h!925 (t!2750 l!1094))) (_1!213 (h!925 (t!2750 (t!2750 l!1094))))))))

(declare-fun b!12167 () Bool)

(assert (=> b!12167 (= e!7265 (isStrictlySorted!54 (t!2750 (t!2750 l!1094))))))

(assert (= (and d!1693 (not res!9894)) b!12166))

(assert (= (and b!12166 res!9895) b!12167))

(declare-fun m!8385 () Bool)

(assert (=> b!12167 m!8385))

(assert (=> b!12107 d!1693))

(declare-fun d!1697 () Bool)

(declare-fun res!9896 () Bool)

(declare-fun e!7266 () Bool)

(assert (=> d!1697 (=> res!9896 e!7266)))

(assert (=> d!1697 (= res!9896 (or ((_ is Nil!360) l!1094) ((_ is Nil!360) (t!2750 l!1094))))))

(assert (=> d!1697 (= (isStrictlySorted!54 l!1094) e!7266)))

(declare-fun b!12168 () Bool)

(declare-fun e!7267 () Bool)

(assert (=> b!12168 (= e!7266 e!7267)))

(declare-fun res!9897 () Bool)

(assert (=> b!12168 (=> (not res!9897) (not e!7267))))

(assert (=> b!12168 (= res!9897 (bvslt (_1!213 (h!925 l!1094)) (_1!213 (h!925 (t!2750 l!1094)))))))

(declare-fun b!12169 () Bool)

(assert (=> b!12169 (= e!7267 (isStrictlySorted!54 (t!2750 l!1094)))))

(assert (= (and d!1697 (not res!9896)) b!12168))

(assert (= (and b!12168 res!9897) b!12169))

(assert (=> b!12169 m!8365))

(assert (=> start!1722 d!1697))

(declare-fun b!12173 () Bool)

(declare-fun e!7269 () Option!47)

(assert (=> b!12173 (= e!7269 None!45)))

(declare-fun b!12171 () Bool)

(declare-fun e!7268 () Option!47)

(assert (=> b!12171 (= e!7268 e!7269)))

(declare-fun c!1054 () Bool)

(assert (=> b!12171 (= c!1054 (and ((_ is Cons!359) (t!2750 l!1094)) (not (= (_1!213 (h!925 (t!2750 l!1094))) key!303))))))

(declare-fun b!12172 () Bool)

(assert (=> b!12172 (= e!7269 (getValueByKey!41 (t!2750 (t!2750 l!1094)) key!303))))

(declare-fun d!1699 () Bool)

(declare-fun c!1053 () Bool)

(assert (=> d!1699 (= c!1053 (and ((_ is Cons!359) (t!2750 l!1094)) (= (_1!213 (h!925 (t!2750 l!1094))) key!303)))))

(assert (=> d!1699 (= (getValueByKey!41 (t!2750 l!1094) key!303) e!7268)))

(declare-fun b!12170 () Bool)

(assert (=> b!12170 (= e!7268 (Some!46 (_2!213 (h!925 (t!2750 l!1094)))))))

(assert (= (and d!1699 c!1053) b!12170))

(assert (= (and d!1699 (not c!1053)) b!12171))

(assert (= (and b!12171 c!1054) b!12172))

(assert (= (and b!12171 (not c!1054)) b!12173))

(declare-fun m!8387 () Bool)

(assert (=> b!12172 m!8387))

(assert (=> b!12103 d!1699))

(declare-fun b!12182 () Bool)

(declare-fun e!7276 () Bool)

(declare-fun tp!2051 () Bool)

(assert (=> b!12182 (= e!7276 (and tp_is_empty!613 tp!2051))))

(assert (=> b!12106 (= tp!2042 e!7276)))

(assert (= (and b!12106 ((_ is Cons!359) (t!2750 l!1094))) b!12182))

(check-sat (not b!12148) (not b!12169) (not b!12167) tp_is_empty!613 (not b!12172) (not b!12182))
(check-sat)
