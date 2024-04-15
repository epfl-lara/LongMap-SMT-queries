; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7230 () Bool)

(assert start!7230)

(declare-fun res!27006 () Bool)

(declare-fun e!29436 () Bool)

(assert (=> start!7230 (=> (not res!27006) (not e!29436))))

(declare-datatypes ((B!878 0))(
  ( (B!879 (val!1026 Int)) )
))
(declare-datatypes ((tuple2!1704 0))(
  ( (tuple2!1705 (_1!863 (_ BitVec 64)) (_2!863 B!878)) )
))
(declare-datatypes ((List!1237 0))(
  ( (Nil!1234) (Cons!1233 (h!1813 tuple2!1704) (t!4261 List!1237)) )
))
(declare-fun l!812 () List!1237)

(declare-fun isStrictlySorted!230 (List!1237) Bool)

(assert (=> start!7230 (= res!27006 (isStrictlySorted!230 l!812))))

(assert (=> start!7230 e!29436))

(declare-fun e!29437 () Bool)

(assert (=> start!7230 e!29437))

(declare-fun b!46195 () Bool)

(declare-fun res!27007 () Bool)

(assert (=> b!46195 (=> (not res!27007) (not e!29436))))

(get-info :version)

(assert (=> b!46195 (= res!27007 ((_ is Cons!1233) l!812))))

(declare-fun b!46196 () Bool)

(assert (=> b!46196 (= e!29436 (not (isStrictlySorted!230 (t!4261 l!812))))))

(declare-fun b!46197 () Bool)

(declare-fun tp_is_empty!1975 () Bool)

(declare-fun tp!6101 () Bool)

(assert (=> b!46197 (= e!29437 (and tp_is_empty!1975 tp!6101))))

(assert (= (and start!7230 res!27006) b!46195))

(assert (= (and b!46195 res!27007) b!46196))

(assert (= (and start!7230 ((_ is Cons!1233) l!812)) b!46197))

(declare-fun m!40577 () Bool)

(assert (=> start!7230 m!40577))

(declare-fun m!40579 () Bool)

(assert (=> b!46196 m!40579))

(check-sat (not b!46196) (not start!7230) (not b!46197) tp_is_empty!1975)
(check-sat)
(get-model)

(declare-fun d!9023 () Bool)

(declare-fun res!27028 () Bool)

(declare-fun e!29458 () Bool)

(assert (=> d!9023 (=> res!27028 e!29458)))

(assert (=> d!9023 (= res!27028 (or ((_ is Nil!1234) (t!4261 l!812)) ((_ is Nil!1234) (t!4261 (t!4261 l!812)))))))

(assert (=> d!9023 (= (isStrictlySorted!230 (t!4261 l!812)) e!29458)))

(declare-fun b!46224 () Bool)

(declare-fun e!29459 () Bool)

(assert (=> b!46224 (= e!29458 e!29459)))

(declare-fun res!27029 () Bool)

(assert (=> b!46224 (=> (not res!27029) (not e!29459))))

(assert (=> b!46224 (= res!27029 (bvslt (_1!863 (h!1813 (t!4261 l!812))) (_1!863 (h!1813 (t!4261 (t!4261 l!812))))))))

(declare-fun b!46225 () Bool)

(assert (=> b!46225 (= e!29459 (isStrictlySorted!230 (t!4261 (t!4261 l!812))))))

(assert (= (and d!9023 (not res!27028)) b!46224))

(assert (= (and b!46224 res!27029) b!46225))

(declare-fun m!40589 () Bool)

(assert (=> b!46225 m!40589))

(assert (=> b!46196 d!9023))

(declare-fun d!9029 () Bool)

(declare-fun res!27032 () Bool)

(declare-fun e!29462 () Bool)

(assert (=> d!9029 (=> res!27032 e!29462)))

(assert (=> d!9029 (= res!27032 (or ((_ is Nil!1234) l!812) ((_ is Nil!1234) (t!4261 l!812))))))

(assert (=> d!9029 (= (isStrictlySorted!230 l!812) e!29462)))

(declare-fun b!46228 () Bool)

(declare-fun e!29463 () Bool)

(assert (=> b!46228 (= e!29462 e!29463)))

(declare-fun res!27033 () Bool)

(assert (=> b!46228 (=> (not res!27033) (not e!29463))))

(assert (=> b!46228 (= res!27033 (bvslt (_1!863 (h!1813 l!812)) (_1!863 (h!1813 (t!4261 l!812)))))))

(declare-fun b!46229 () Bool)

(assert (=> b!46229 (= e!29463 (isStrictlySorted!230 (t!4261 l!812)))))

(assert (= (and d!9029 (not res!27032)) b!46228))

(assert (= (and b!46228 res!27033) b!46229))

(assert (=> b!46229 m!40579))

(assert (=> start!7230 d!9029))

(declare-fun b!46244 () Bool)

(declare-fun e!29474 () Bool)

(declare-fun tp!6112 () Bool)

(assert (=> b!46244 (= e!29474 (and tp_is_empty!1975 tp!6112))))

(assert (=> b!46197 (= tp!6101 e!29474)))

(assert (= (and b!46197 ((_ is Cons!1233) (t!4261 l!812))) b!46244))

(check-sat (not b!46225) (not b!46229) (not b!46244) tp_is_empty!1975)
(check-sat)
