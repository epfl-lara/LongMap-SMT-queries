; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1724 () Bool)

(assert start!1724)

(declare-fun b!12118 () Bool)

(declare-fun e!7235 () Bool)

(declare-fun tp_is_empty!615 () Bool)

(declare-fun tp!2045 () Bool)

(assert (=> b!12118 (= e!7235 (and tp_is_empty!615 tp!2045))))

(declare-fun b!12119 () Bool)

(declare-fun e!7233 () Bool)

(declare-fun e!7234 () Bool)

(assert (=> b!12119 (= e!7233 e!7234)))

(declare-fun res!9877 () Bool)

(assert (=> b!12119 (=> (not res!9877) (not e!7234))))

(declare-datatypes ((B!442 0))(
  ( (B!443 (val!316 Int)) )
))
(declare-datatypes ((Option!48 0))(
  ( (Some!47 (v!1362 B!442)) (None!46) )
))
(declare-fun lt!3102 () Option!48)

(declare-fun key!303 () (_ BitVec 64))

(declare-datatypes ((tuple2!432 0))(
  ( (tuple2!433 (_1!216 (_ BitVec 64)) (_2!216 B!442)) )
))
(declare-datatypes ((List!368 0))(
  ( (Nil!365) (Cons!364 (h!930 tuple2!432) (t!2755 List!368)) )
))
(declare-fun l!1094 () List!368)

(declare-fun getValueByKey!42 (List!368 (_ BitVec 64)) Option!48)

(assert (=> b!12119 (= res!9877 (= (getValueByKey!42 l!1094 key!303) lt!3102))))

(declare-fun v!194 () B!442)

(assert (=> b!12119 (= lt!3102 (Some!47 v!194))))

(declare-fun b!12120 () Bool)

(declare-fun e!7232 () Bool)

(assert (=> b!12120 (= e!7234 e!7232)))

(declare-fun res!9876 () Bool)

(assert (=> b!12120 (=> res!9876 e!7232)))

(declare-fun isStrictlySorted!61 (List!368) Bool)

(assert (=> b!12120 (= res!9876 (not (isStrictlySorted!61 (t!2755 l!1094))))))

(declare-fun b!12121 () Bool)

(assert (=> b!12121 (= e!7232 (not (= (getValueByKey!42 (t!2755 l!1094) key!303) lt!3102)))))

(declare-fun b!12122 () Bool)

(declare-fun res!9875 () Bool)

(assert (=> b!12122 (=> (not res!9875) (not e!7234))))

(get-info :version)

(assert (=> b!12122 (= res!9875 (and ((_ is Cons!364) l!1094) (not (= (_1!216 (h!930 l!1094)) key!303))))))

(declare-fun res!9874 () Bool)

(assert (=> start!1724 (=> (not res!9874) (not e!7233))))

(assert (=> start!1724 (= res!9874 (isStrictlySorted!61 l!1094))))

(assert (=> start!1724 e!7233))

(assert (=> start!1724 e!7235))

(assert (=> start!1724 tp_is_empty!615))

(assert (=> start!1724 true))

(assert (= (and start!1724 res!9874) b!12119))

(assert (= (and b!12119 res!9877) b!12122))

(assert (= (and b!12122 res!9875) b!12120))

(assert (= (and b!12120 (not res!9876)) b!12121))

(assert (= (and start!1724 ((_ is Cons!364) l!1094)) b!12118))

(declare-fun m!8371 () Bool)

(assert (=> b!12119 m!8371))

(declare-fun m!8373 () Bool)

(assert (=> b!12120 m!8373))

(declare-fun m!8375 () Bool)

(assert (=> b!12121 m!8375))

(declare-fun m!8377 () Bool)

(assert (=> start!1724 m!8377))

(check-sat tp_is_empty!615 (not start!1724) (not b!12121) (not b!12118) (not b!12120) (not b!12119))
(check-sat)
(get-model)

(declare-fun d!1689 () Bool)

(declare-fun res!9894 () Bool)

(declare-fun e!7252 () Bool)

(assert (=> d!1689 (=> res!9894 e!7252)))

(assert (=> d!1689 (= res!9894 (or ((_ is Nil!365) l!1094) ((_ is Nil!365) (t!2755 l!1094))))))

(assert (=> d!1689 (= (isStrictlySorted!61 l!1094) e!7252)))

(declare-fun b!12142 () Bool)

(declare-fun e!7253 () Bool)

(assert (=> b!12142 (= e!7252 e!7253)))

(declare-fun res!9895 () Bool)

(assert (=> b!12142 (=> (not res!9895) (not e!7253))))

(assert (=> b!12142 (= res!9895 (bvslt (_1!216 (h!930 l!1094)) (_1!216 (h!930 (t!2755 l!1094)))))))

(declare-fun b!12143 () Bool)

(assert (=> b!12143 (= e!7253 (isStrictlySorted!61 (t!2755 l!1094)))))

(assert (= (and d!1689 (not res!9894)) b!12142))

(assert (= (and b!12142 res!9895) b!12143))

(assert (=> b!12143 m!8373))

(assert (=> start!1724 d!1689))

(declare-fun b!12169 () Bool)

(declare-fun e!7266 () Option!48)

(declare-fun e!7267 () Option!48)

(assert (=> b!12169 (= e!7266 e!7267)))

(declare-fun c!1054 () Bool)

(assert (=> b!12169 (= c!1054 (and ((_ is Cons!364) l!1094) (not (= (_1!216 (h!930 l!1094)) key!303))))))

(declare-fun b!12168 () Bool)

(assert (=> b!12168 (= e!7266 (Some!47 (_2!216 (h!930 l!1094))))))

(declare-fun b!12171 () Bool)

(assert (=> b!12171 (= e!7267 None!46)))

(declare-fun b!12170 () Bool)

(assert (=> b!12170 (= e!7267 (getValueByKey!42 (t!2755 l!1094) key!303))))

(declare-fun d!1693 () Bool)

(declare-fun c!1053 () Bool)

(assert (=> d!1693 (= c!1053 (and ((_ is Cons!364) l!1094) (= (_1!216 (h!930 l!1094)) key!303)))))

(assert (=> d!1693 (= (getValueByKey!42 l!1094 key!303) e!7266)))

(assert (= (and d!1693 c!1053) b!12168))

(assert (= (and d!1693 (not c!1053)) b!12169))

(assert (= (and b!12169 c!1054) b!12170))

(assert (= (and b!12169 (not c!1054)) b!12171))

(assert (=> b!12170 m!8375))

(assert (=> b!12119 d!1693))

(declare-fun d!1697 () Bool)

(declare-fun res!9896 () Bool)

(declare-fun e!7268 () Bool)

(assert (=> d!1697 (=> res!9896 e!7268)))

(assert (=> d!1697 (= res!9896 (or ((_ is Nil!365) (t!2755 l!1094)) ((_ is Nil!365) (t!2755 (t!2755 l!1094)))))))

(assert (=> d!1697 (= (isStrictlySorted!61 (t!2755 l!1094)) e!7268)))

(declare-fun b!12172 () Bool)

(declare-fun e!7269 () Bool)

(assert (=> b!12172 (= e!7268 e!7269)))

(declare-fun res!9897 () Bool)

(assert (=> b!12172 (=> (not res!9897) (not e!7269))))

(assert (=> b!12172 (= res!9897 (bvslt (_1!216 (h!930 (t!2755 l!1094))) (_1!216 (h!930 (t!2755 (t!2755 l!1094))))))))

(declare-fun b!12173 () Bool)

(assert (=> b!12173 (= e!7269 (isStrictlySorted!61 (t!2755 (t!2755 l!1094))))))

(assert (= (and d!1697 (not res!9896)) b!12172))

(assert (= (and b!12172 res!9897) b!12173))

(declare-fun m!8387 () Bool)

(assert (=> b!12173 m!8387))

(assert (=> b!12120 d!1697))

(declare-fun b!12175 () Bool)

(declare-fun e!7270 () Option!48)

(declare-fun e!7271 () Option!48)

(assert (=> b!12175 (= e!7270 e!7271)))

(declare-fun c!1056 () Bool)

(assert (=> b!12175 (= c!1056 (and ((_ is Cons!364) (t!2755 l!1094)) (not (= (_1!216 (h!930 (t!2755 l!1094))) key!303))))))

(declare-fun b!12174 () Bool)

(assert (=> b!12174 (= e!7270 (Some!47 (_2!216 (h!930 (t!2755 l!1094)))))))

(declare-fun b!12177 () Bool)

(assert (=> b!12177 (= e!7271 None!46)))

(declare-fun b!12176 () Bool)

(assert (=> b!12176 (= e!7271 (getValueByKey!42 (t!2755 (t!2755 l!1094)) key!303))))

(declare-fun d!1699 () Bool)

(declare-fun c!1055 () Bool)

(assert (=> d!1699 (= c!1055 (and ((_ is Cons!364) (t!2755 l!1094)) (= (_1!216 (h!930 (t!2755 l!1094))) key!303)))))

(assert (=> d!1699 (= (getValueByKey!42 (t!2755 l!1094) key!303) e!7270)))

(assert (= (and d!1699 c!1055) b!12174))

(assert (= (and d!1699 (not c!1055)) b!12175))

(assert (= (and b!12175 c!1056) b!12176))

(assert (= (and b!12175 (not c!1056)) b!12177))

(declare-fun m!8389 () Bool)

(assert (=> b!12176 m!8389))

(assert (=> b!12121 d!1699))

(declare-fun b!12190 () Bool)

(declare-fun e!7278 () Bool)

(declare-fun tp!2051 () Bool)

(assert (=> b!12190 (= e!7278 (and tp_is_empty!615 tp!2051))))

(assert (=> b!12118 (= tp!2045 e!7278)))

(assert (= (and b!12118 ((_ is Cons!364) (t!2755 l!1094))) b!12190))

(check-sat tp_is_empty!615 (not b!12190) (not b!12176) (not b!12170) (not b!12173) (not b!12143))
(check-sat)
