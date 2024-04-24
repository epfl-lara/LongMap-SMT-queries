; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7234 () Bool)

(assert start!7234)

(declare-fun res!27002 () Bool)

(declare-fun e!29442 () Bool)

(assert (=> start!7234 (=> (not res!27002) (not e!29442))))

(declare-datatypes ((B!878 0))(
  ( (B!879 (val!1026 Int)) )
))
(declare-datatypes ((tuple2!1682 0))(
  ( (tuple2!1683 (_1!852 (_ BitVec 64)) (_2!852 B!878)) )
))
(declare-datatypes ((List!1230 0))(
  ( (Nil!1227) (Cons!1226 (h!1806 tuple2!1682) (t!4255 List!1230)) )
))
(declare-fun l!812 () List!1230)

(declare-fun isStrictlySorted!223 (List!1230) Bool)

(assert (=> start!7234 (= res!27002 (isStrictlySorted!223 l!812))))

(assert (=> start!7234 e!29442))

(declare-fun e!29443 () Bool)

(assert (=> start!7234 e!29443))

(declare-fun b!46204 () Bool)

(declare-fun res!27001 () Bool)

(assert (=> b!46204 (=> (not res!27001) (not e!29442))))

(get-info :version)

(assert (=> b!46204 (= res!27001 ((_ is Cons!1226) l!812))))

(declare-fun b!46205 () Bool)

(assert (=> b!46205 (= e!29442 (not (isStrictlySorted!223 (t!4255 l!812))))))

(declare-fun b!46206 () Bool)

(declare-fun tp_is_empty!1975 () Bool)

(declare-fun tp!6101 () Bool)

(assert (=> b!46206 (= e!29443 (and tp_is_empty!1975 tp!6101))))

(assert (= (and start!7234 res!27002) b!46204))

(assert (= (and b!46204 res!27001) b!46205))

(assert (= (and start!7234 ((_ is Cons!1226) l!812)) b!46206))

(declare-fun m!40535 () Bool)

(assert (=> start!7234 m!40535))

(declare-fun m!40537 () Bool)

(assert (=> b!46205 m!40537))

(check-sat (not start!7234) (not b!46205) (not b!46206) tp_is_empty!1975)
(check-sat)
(get-model)

(declare-fun d!9037 () Bool)

(declare-fun res!27019 () Bool)

(declare-fun e!29460 () Bool)

(assert (=> d!9037 (=> res!27019 e!29460)))

(assert (=> d!9037 (= res!27019 (or ((_ is Nil!1227) l!812) ((_ is Nil!1227) (t!4255 l!812))))))

(assert (=> d!9037 (= (isStrictlySorted!223 l!812) e!29460)))

(declare-fun b!46229 () Bool)

(declare-fun e!29461 () Bool)

(assert (=> b!46229 (= e!29460 e!29461)))

(declare-fun res!27020 () Bool)

(assert (=> b!46229 (=> (not res!27020) (not e!29461))))

(assert (=> b!46229 (= res!27020 (bvslt (_1!852 (h!1806 l!812)) (_1!852 (h!1806 (t!4255 l!812)))))))

(declare-fun b!46230 () Bool)

(assert (=> b!46230 (= e!29461 (isStrictlySorted!223 (t!4255 l!812)))))

(assert (= (and d!9037 (not res!27019)) b!46229))

(assert (= (and b!46229 res!27020) b!46230))

(assert (=> b!46230 m!40537))

(assert (=> start!7234 d!9037))

(declare-fun d!9043 () Bool)

(declare-fun res!27021 () Bool)

(declare-fun e!29462 () Bool)

(assert (=> d!9043 (=> res!27021 e!29462)))

(assert (=> d!9043 (= res!27021 (or ((_ is Nil!1227) (t!4255 l!812)) ((_ is Nil!1227) (t!4255 (t!4255 l!812)))))))

(assert (=> d!9043 (= (isStrictlySorted!223 (t!4255 l!812)) e!29462)))

(declare-fun b!46231 () Bool)

(declare-fun e!29463 () Bool)

(assert (=> b!46231 (= e!29462 e!29463)))

(declare-fun res!27022 () Bool)

(assert (=> b!46231 (=> (not res!27022) (not e!29463))))

(assert (=> b!46231 (= res!27022 (bvslt (_1!852 (h!1806 (t!4255 l!812))) (_1!852 (h!1806 (t!4255 (t!4255 l!812))))))))

(declare-fun b!46232 () Bool)

(assert (=> b!46232 (= e!29463 (isStrictlySorted!223 (t!4255 (t!4255 l!812))))))

(assert (= (and d!9043 (not res!27021)) b!46231))

(assert (= (and b!46231 res!27022) b!46232))

(declare-fun m!40547 () Bool)

(assert (=> b!46232 m!40547))

(assert (=> b!46205 d!9043))

(declare-fun b!46237 () Bool)

(declare-fun e!29466 () Bool)

(declare-fun tp!6110 () Bool)

(assert (=> b!46237 (= e!29466 (and tp_is_empty!1975 tp!6110))))

(assert (=> b!46206 (= tp!6101 e!29466)))

(assert (= (and b!46206 ((_ is Cons!1226) (t!4255 l!812))) b!46237))

(check-sat (not b!46230) (not b!46232) (not b!46237) tp_is_empty!1975)
(check-sat)
