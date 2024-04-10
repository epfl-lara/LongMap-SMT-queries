; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1700 () Bool)

(assert start!1700)

(declare-fun res!9829 () Bool)

(declare-fun e!7150 () Bool)

(assert (=> start!1700 (=> (not res!9829) (not e!7150))))

(declare-datatypes ((B!436 0))(
  ( (B!437 (val!313 Int)) )
))
(declare-datatypes ((tuple2!426 0))(
  ( (tuple2!427 (_1!213 (_ BitVec 64)) (_2!213 B!436)) )
))
(declare-datatypes ((List!365 0))(
  ( (Nil!362) (Cons!361 (h!927 tuple2!426) (t!2752 List!365)) )
))
(declare-fun l!1094 () List!365)

(declare-fun isStrictlySorted!58 (List!365) Bool)

(assert (=> start!1700 (= res!9829 (isStrictlySorted!58 l!1094))))

(assert (=> start!1700 e!7150))

(declare-fun e!7151 () Bool)

(assert (=> start!1700 e!7151))

(assert (=> start!1700 true))

(declare-fun tp_is_empty!609 () Bool)

(assert (=> start!1700 tp_is_empty!609))

(declare-fun b!11994 () Bool)

(declare-fun res!9828 () Bool)

(assert (=> b!11994 (=> (not res!9828) (not e!7150))))

(declare-fun key!303 () (_ BitVec 64))

(declare-fun v!194 () B!436)

(declare-datatypes ((Option!45 0))(
  ( (Some!44 (v!1359 B!436)) (None!43) )
))
(declare-fun getValueByKey!39 (List!365 (_ BitVec 64)) Option!45)

(assert (=> b!11994 (= res!9828 (= (getValueByKey!39 l!1094 key!303) (Some!44 v!194)))))

(declare-fun b!11995 () Bool)

(declare-fun ListPrimitiveSize!14 (List!365) Int)

(assert (=> b!11995 (= e!7150 (< (ListPrimitiveSize!14 l!1094) 0))))

(declare-fun b!11996 () Bool)

(declare-fun tp!2027 () Bool)

(assert (=> b!11996 (= e!7151 (and tp_is_empty!609 tp!2027))))

(assert (= (and start!1700 res!9829) b!11994))

(assert (= (and b!11994 res!9828) b!11995))

(get-info :version)

(assert (= (and start!1700 ((_ is Cons!361) l!1094)) b!11996))

(declare-fun m!8333 () Bool)

(assert (=> start!1700 m!8333))

(declare-fun m!8335 () Bool)

(assert (=> b!11994 m!8335))

(declare-fun m!8337 () Bool)

(assert (=> b!11995 m!8337))

(check-sat tp_is_empty!609 (not b!11996) (not start!1700) (not b!11995) (not b!11994))
(check-sat)
(get-model)

(declare-fun d!1671 () Bool)

(declare-fun lt!3092 () Int)

(assert (=> d!1671 (>= lt!3092 0)))

(declare-fun e!7168 () Int)

(assert (=> d!1671 (= lt!3092 e!7168)))

(declare-fun c!1018 () Bool)

(assert (=> d!1671 (= c!1018 ((_ is Nil!362) l!1094))))

(assert (=> d!1671 (= (ListPrimitiveSize!14 l!1094) lt!3092)))

(declare-fun b!12020 () Bool)

(assert (=> b!12020 (= e!7168 0)))

(declare-fun b!12021 () Bool)

(assert (=> b!12021 (= e!7168 (+ 1 (ListPrimitiveSize!14 (t!2752 l!1094))))))

(assert (= (and d!1671 c!1018) b!12020))

(assert (= (and d!1671 (not c!1018)) b!12021))

(declare-fun m!8347 () Bool)

(assert (=> b!12021 m!8347))

(assert (=> b!11995 d!1671))

(declare-fun d!1677 () Bool)

(declare-fun res!9850 () Bool)

(declare-fun e!7184 () Bool)

(assert (=> d!1677 (=> res!9850 e!7184)))

(assert (=> d!1677 (= res!9850 (or ((_ is Nil!362) l!1094) ((_ is Nil!362) (t!2752 l!1094))))))

(assert (=> d!1677 (= (isStrictlySorted!58 l!1094) e!7184)))

(declare-fun b!12044 () Bool)

(declare-fun e!7185 () Bool)

(assert (=> b!12044 (= e!7184 e!7185)))

(declare-fun res!9851 () Bool)

(assert (=> b!12044 (=> (not res!9851) (not e!7185))))

(assert (=> b!12044 (= res!9851 (bvslt (_1!213 (h!927 l!1094)) (_1!213 (h!927 (t!2752 l!1094)))))))

(declare-fun b!12045 () Bool)

(assert (=> b!12045 (= e!7185 (isStrictlySorted!58 (t!2752 l!1094)))))

(assert (= (and d!1677 (not res!9850)) b!12044))

(assert (= (and b!12044 res!9851) b!12045))

(declare-fun m!8353 () Bool)

(assert (=> b!12045 m!8353))

(assert (=> start!1700 d!1677))

(declare-fun b!12077 () Bool)

(declare-fun e!7203 () Option!45)

(assert (=> b!12077 (= e!7203 (getValueByKey!39 (t!2752 l!1094) key!303))))

(declare-fun b!12076 () Bool)

(declare-fun e!7202 () Option!45)

(assert (=> b!12076 (= e!7202 e!7203)))

(declare-fun c!1038 () Bool)

(assert (=> b!12076 (= c!1038 (and ((_ is Cons!361) l!1094) (not (= (_1!213 (h!927 l!1094)) key!303))))))

(declare-fun b!12075 () Bool)

(assert (=> b!12075 (= e!7202 (Some!44 (_2!213 (h!927 l!1094))))))

(declare-fun b!12078 () Bool)

(assert (=> b!12078 (= e!7203 None!43)))

(declare-fun d!1683 () Bool)

(declare-fun c!1037 () Bool)

(assert (=> d!1683 (= c!1037 (and ((_ is Cons!361) l!1094) (= (_1!213 (h!927 l!1094)) key!303)))))

(assert (=> d!1683 (= (getValueByKey!39 l!1094 key!303) e!7202)))

(assert (= (and d!1683 c!1037) b!12075))

(assert (= (and d!1683 (not c!1037)) b!12076))

(assert (= (and b!12076 c!1038) b!12077))

(assert (= (and b!12076 (not c!1038)) b!12078))

(declare-fun m!8359 () Bool)

(assert (=> b!12077 m!8359))

(assert (=> b!11994 d!1683))

(declare-fun b!12091 () Bool)

(declare-fun e!7210 () Bool)

(declare-fun tp!2038 () Bool)

(assert (=> b!12091 (= e!7210 (and tp_is_empty!609 tp!2038))))

(assert (=> b!11996 (= tp!2027 e!7210)))

(assert (= (and b!11996 ((_ is Cons!361) (t!2752 l!1094))) b!12091))

(check-sat (not b!12021) tp_is_empty!609 (not b!12077) (not b!12091) (not b!12045))
(check-sat)
