; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138158 () Bool)

(assert start!138158)

(declare-fun res!1082559 () Bool)

(declare-fun e!884831 () Bool)

(assert (=> start!138158 (=> (not res!1082559) (not e!884831))))

(declare-datatypes ((B!2972 0))(
  ( (B!2973 (val!19848 Int)) )
))
(declare-datatypes ((tuple2!25932 0))(
  ( (tuple2!25933 (_1!12977 (_ BitVec 64)) (_2!12977 B!2972)) )
))
(declare-datatypes ((List!37009 0))(
  ( (Nil!37006) (Cons!37005 (h!38549 tuple2!25932) (t!51919 List!37009)) )
))
(declare-fun l!556 () List!37009)

(declare-fun isStrictlySorted!1188 (List!37009) Bool)

(assert (=> start!138158 (= res!1082559 (isStrictlySorted!1188 l!556))))

(assert (=> start!138158 e!884831))

(declare-fun e!884832 () Bool)

(assert (=> start!138158 e!884832))

(declare-fun b!1584921 () Bool)

(declare-fun ListPrimitiveSize!223 (List!37009) Int)

(assert (=> b!1584921 (= e!884831 (< (ListPrimitiveSize!223 l!556) 0))))

(declare-fun b!1584922 () Bool)

(declare-fun tp_is_empty!39505 () Bool)

(declare-fun tp!115224 () Bool)

(assert (=> b!1584922 (= e!884832 (and tp_is_empty!39505 tp!115224))))

(assert (= (and start!138158 res!1082559) b!1584921))

(get-info :version)

(assert (= (and start!138158 ((_ is Cons!37005) l!556)) b!1584922))

(declare-fun m!1453293 () Bool)

(assert (=> start!138158 m!1453293))

(declare-fun m!1453295 () Bool)

(assert (=> b!1584921 m!1453295))

(check-sat (not start!138158) (not b!1584921) (not b!1584922) tp_is_empty!39505)
(check-sat)
(get-model)

(declare-fun d!167395 () Bool)

(declare-fun res!1082578 () Bool)

(declare-fun e!884857 () Bool)

(assert (=> d!167395 (=> res!1082578 e!884857)))

(assert (=> d!167395 (= res!1082578 (or ((_ is Nil!37006) l!556) ((_ is Nil!37006) (t!51919 l!556))))))

(assert (=> d!167395 (= (isStrictlySorted!1188 l!556) e!884857)))

(declare-fun b!1584947 () Bool)

(declare-fun e!884858 () Bool)

(assert (=> b!1584947 (= e!884857 e!884858)))

(declare-fun res!1082579 () Bool)

(assert (=> b!1584947 (=> (not res!1082579) (not e!884858))))

(assert (=> b!1584947 (= res!1082579 (bvslt (_1!12977 (h!38549 l!556)) (_1!12977 (h!38549 (t!51919 l!556)))))))

(declare-fun b!1584948 () Bool)

(assert (=> b!1584948 (= e!884858 (isStrictlySorted!1188 (t!51919 l!556)))))

(assert (= (and d!167395 (not res!1082578)) b!1584947))

(assert (= (and b!1584947 res!1082579) b!1584948))

(declare-fun m!1453305 () Bool)

(assert (=> b!1584948 m!1453305))

(assert (=> start!138158 d!167395))

(declare-fun d!167401 () Bool)

(declare-fun lt!677073 () Int)

(assert (=> d!167401 (>= lt!677073 0)))

(declare-fun e!884869 () Int)

(assert (=> d!167401 (= lt!677073 e!884869)))

(declare-fun c!146873 () Bool)

(assert (=> d!167401 (= c!146873 ((_ is Nil!37006) l!556))))

(assert (=> d!167401 (= (ListPrimitiveSize!223 l!556) lt!677073)))

(declare-fun b!1584965 () Bool)

(assert (=> b!1584965 (= e!884869 0)))

(declare-fun b!1584966 () Bool)

(assert (=> b!1584966 (= e!884869 (+ 1 (ListPrimitiveSize!223 (t!51919 l!556))))))

(assert (= (and d!167401 c!146873) b!1584965))

(assert (= (and d!167401 (not c!146873)) b!1584966))

(declare-fun m!1453311 () Bool)

(assert (=> b!1584966 m!1453311))

(assert (=> b!1584921 d!167401))

(declare-fun b!1584975 () Bool)

(declare-fun e!884874 () Bool)

(declare-fun tp!115233 () Bool)

(assert (=> b!1584975 (= e!884874 (and tp_is_empty!39505 tp!115233))))

(assert (=> b!1584922 (= tp!115224 e!884874)))

(assert (= (and b!1584922 ((_ is Cons!37005) (t!51919 l!556))) b!1584975))

(check-sat (not b!1584948) (not b!1584966) (not b!1584975) tp_is_empty!39505)
(check-sat)
