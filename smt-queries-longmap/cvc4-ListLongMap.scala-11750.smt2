; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137848 () Bool)

(assert start!137848)

(declare-fun b!1583242 () Bool)

(declare-fun res!1081570 () Bool)

(declare-fun e!883703 () Bool)

(assert (=> b!1583242 (=> (not res!1081570) (not e!883703))))

(declare-datatypes ((B!2844 0))(
  ( (B!2845 (val!19784 Int)) )
))
(declare-datatypes ((tuple2!25736 0))(
  ( (tuple2!25737 (_1!12879 (_ BitVec 64)) (_2!12879 B!2844)) )
))
(declare-datatypes ((List!36904 0))(
  ( (Nil!36901) (Cons!36900 (h!38443 tuple2!25736) (t!51818 List!36904)) )
))
(declare-fun l!1065 () List!36904)

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!984 (List!36904 (_ BitVec 64)) Bool)

(assert (=> b!1583242 (= res!1081570 (containsKey!984 l!1065 key!287))))

(declare-fun res!1081571 () Bool)

(assert (=> start!137848 (=> (not res!1081571) (not e!883703))))

(declare-fun isStrictlySorted!1138 (List!36904) Bool)

(assert (=> start!137848 (= res!1081571 (isStrictlySorted!1138 l!1065))))

(assert (=> start!137848 e!883703))

(declare-fun e!883702 () Bool)

(assert (=> start!137848 e!883702))

(assert (=> start!137848 true))

(declare-fun b!1583243 () Bool)

(declare-fun res!1081572 () Bool)

(assert (=> b!1583243 (=> (not res!1081572) (not e!883703))))

(assert (=> b!1583243 (= res!1081572 (or (not (is-Cons!36900 l!1065)) (= (_1!12879 (h!38443 l!1065)) key!287)))))

(declare-fun b!1583245 () Bool)

(declare-fun tp_is_empty!39377 () Bool)

(declare-fun tp!114917 () Bool)

(assert (=> b!1583245 (= e!883702 (and tp_is_empty!39377 tp!114917))))

(declare-fun b!1583244 () Bool)

(declare-datatypes ((Option!946 0))(
  ( (Some!945 (v!22473 B!2844)) (None!944) )
))
(declare-fun isDefined!611 (Option!946) Bool)

(declare-fun getValueByKey!837 (List!36904 (_ BitVec 64)) Option!946)

(assert (=> b!1583244 (= e!883703 (not (isDefined!611 (getValueByKey!837 l!1065 key!287))))))

(assert (= (and start!137848 res!1081571) b!1583242))

(assert (= (and b!1583242 res!1081570) b!1583243))

(assert (= (and b!1583243 res!1081572) b!1583244))

(assert (= (and start!137848 (is-Cons!36900 l!1065)) b!1583245))

(declare-fun m!1453239 () Bool)

(assert (=> b!1583242 m!1453239))

(declare-fun m!1453241 () Bool)

(assert (=> start!137848 m!1453241))

(declare-fun m!1453243 () Bool)

(assert (=> b!1583244 m!1453243))

(assert (=> b!1583244 m!1453243))

(declare-fun m!1453245 () Bool)

(assert (=> b!1583244 m!1453245))

(push 1)

(assert (not b!1583242))

(assert (not b!1583245))

(assert (not b!1583244))

(assert (not start!137848))

(assert tp_is_empty!39377)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167175 () Bool)

(declare-fun res!1081583 () Bool)

(declare-fun e!883722 () Bool)

(assert (=> d!167175 (=> res!1081583 e!883722)))

(assert (=> d!167175 (= res!1081583 (and (is-Cons!36900 l!1065) (= (_1!12879 (h!38443 l!1065)) key!287)))))

(assert (=> d!167175 (= (containsKey!984 l!1065 key!287) e!883722)))

(declare-fun b!1583272 () Bool)

(declare-fun e!883723 () Bool)

(assert (=> b!1583272 (= e!883722 e!883723)))

(declare-fun res!1081584 () Bool)

(assert (=> b!1583272 (=> (not res!1081584) (not e!883723))))

(assert (=> b!1583272 (= res!1081584 (and (or (not (is-Cons!36900 l!1065)) (bvsle (_1!12879 (h!38443 l!1065)) key!287)) (is-Cons!36900 l!1065) (bvslt (_1!12879 (h!38443 l!1065)) key!287)))))

(declare-fun b!1583273 () Bool)

(assert (=> b!1583273 (= e!883723 (containsKey!984 (t!51818 l!1065) key!287))))

(assert (= (and d!167175 (not res!1081583)) b!1583272))

(assert (= (and b!1583272 res!1081584) b!1583273))

(declare-fun m!1453253 () Bool)

(assert (=> b!1583273 m!1453253))

(assert (=> b!1583242 d!167175))

(declare-fun d!167185 () Bool)

(declare-fun res!1081589 () Bool)

(declare-fun e!883732 () Bool)

(assert (=> d!167185 (=> res!1081589 e!883732)))

(assert (=> d!167185 (= res!1081589 (or (is-Nil!36901 l!1065) (is-Nil!36901 (t!51818 l!1065))))))

(assert (=> d!167185 (= (isStrictlySorted!1138 l!1065) e!883732)))

(declare-fun b!1583286 () Bool)

(declare-fun e!883733 () Bool)

(assert (=> b!1583286 (= e!883732 e!883733)))

(declare-fun res!1081590 () Bool)

(assert (=> b!1583286 (=> (not res!1081590) (not e!883733))))

(assert (=> b!1583286 (= res!1081590 (bvslt (_1!12879 (h!38443 l!1065)) (_1!12879 (h!38443 (t!51818 l!1065)))))))

(declare-fun b!1583287 () Bool)

(assert (=> b!1583287 (= e!883733 (isStrictlySorted!1138 (t!51818 l!1065)))))

(assert (= (and d!167185 (not res!1081589)) b!1583286))

(assert (= (and b!1583286 res!1081590) b!1583287))

(declare-fun m!1453259 () Bool)

(assert (=> b!1583287 m!1453259))

(assert (=> start!137848 d!167185))

(declare-fun d!167191 () Bool)

(declare-fun isEmpty!1192 (Option!946) Bool)

(assert (=> d!167191 (= (isDefined!611 (getValueByKey!837 l!1065 key!287)) (not (isEmpty!1192 (getValueByKey!837 l!1065 key!287))))))

(declare-fun bs!45896 () Bool)

(assert (= bs!45896 d!167191))

(assert (=> bs!45896 m!1453243))

(declare-fun m!1453261 () Bool)

(assert (=> bs!45896 m!1453261))

(assert (=> b!1583244 d!167191))

(declare-fun b!1583317 () Bool)

(declare-fun e!883757 () Option!946)

(assert (=> b!1583317 (= e!883757 (Some!945 (_2!12879 (h!38443 l!1065))))))

(declare-fun b!1583318 () Bool)

(declare-fun e!883758 () Option!946)

(assert (=> b!1583318 (= e!883757 e!883758)))

(declare-fun c!146725 () Bool)

(assert (=> b!1583318 (= c!146725 (and (is-Cons!36900 l!1065) (not (= (_1!12879 (h!38443 l!1065)) key!287))))))

(declare-fun b!1583320 () Bool)

(assert (=> b!1583320 (= e!883758 None!944)))

(declare-fun d!167193 () Bool)

(declare-fun c!146724 () Bool)

(assert (=> d!167193 (= c!146724 (and (is-Cons!36900 l!1065) (= (_1!12879 (h!38443 l!1065)) key!287)))))

(assert (=> d!167193 (= (getValueByKey!837 l!1065 key!287) e!883757)))

(declare-fun b!1583319 () Bool)

(assert (=> b!1583319 (= e!883758 (getValueByKey!837 (t!51818 l!1065) key!287))))

(assert (= (and d!167193 c!146724) b!1583317))

(assert (= (and d!167193 (not c!146724)) b!1583318))

(assert (= (and b!1583318 c!146725) b!1583319))

(assert (= (and b!1583318 (not c!146725)) b!1583320))

(declare-fun m!1453267 () Bool)

(assert (=> b!1583319 m!1453267))

(assert (=> b!1583244 d!167193))

(declare-fun b!1583331 () Bool)

(declare-fun e!883765 () Bool)

(declare-fun tp!114925 () Bool)

(assert (=> b!1583331 (= e!883765 (and tp_is_empty!39377 tp!114925))))

(assert (=> b!1583245 (= tp!114917 e!883765)))

(assert (= (and b!1583245 (is-Cons!36900 (t!51818 l!1065))) b!1583331))

(push 1)

(assert (not b!1583319))

(assert (not b!1583273))

(assert (not b!1583331))

(assert (not b!1583287))

(assert (not d!167191))

(assert tp_is_empty!39377)

(check-sat)

(pop 1)

(push 1)

(check-sat)

