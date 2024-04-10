; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7212 () Bool)

(assert start!7212)

(declare-fun res!27000 () Bool)

(declare-fun e!29431 () Bool)

(assert (=> start!7212 (=> (not res!27000) (not e!29431))))

(declare-datatypes ((B!874 0))(
  ( (B!875 (val!1024 Int)) )
))
(declare-datatypes ((tuple2!1696 0))(
  ( (tuple2!1697 (_1!859 (_ BitVec 64)) (_2!859 B!874)) )
))
(declare-datatypes ((List!1242 0))(
  ( (Nil!1239) (Cons!1238 (h!1818 tuple2!1696) (t!4267 List!1242)) )
))
(declare-fun l!812 () List!1242)

(declare-fun isStrictlySorted!233 (List!1242) Bool)

(assert (=> start!7212 (= res!27000 (isStrictlySorted!233 l!812))))

(assert (=> start!7212 e!29431))

(declare-fun e!29432 () Bool)

(assert (=> start!7212 e!29432))

(declare-fun b!46196 () Bool)

(declare-fun ListPrimitiveSize!44 (List!1242) Int)

(assert (=> b!46196 (= e!29431 (< (ListPrimitiveSize!44 l!812) 0))))

(declare-fun b!46197 () Bool)

(declare-fun tp_is_empty!1971 () Bool)

(declare-fun tp!6086 () Bool)

(assert (=> b!46197 (= e!29432 (and tp_is_empty!1971 tp!6086))))

(assert (= (and start!7212 res!27000) b!46196))

(get-info :version)

(assert (= (and start!7212 ((_ is Cons!1238) l!812)) b!46197))

(declare-fun m!40639 () Bool)

(assert (=> start!7212 m!40639))

(declare-fun m!40641 () Bool)

(assert (=> b!46196 m!40641))

(check-sat (not b!46196) (not start!7212) (not b!46197) tp_is_empty!1971)
(check-sat)
(get-model)

(declare-fun d!9037 () Bool)

(declare-fun lt!20278 () Int)

(assert (=> d!9037 (>= lt!20278 0)))

(declare-fun e!29451 () Int)

(assert (=> d!9037 (= lt!20278 e!29451)))

(declare-fun c!6246 () Bool)

(assert (=> d!9037 (= c!6246 ((_ is Nil!1239) l!812))))

(assert (=> d!9037 (= (ListPrimitiveSize!44 l!812) lt!20278)))

(declare-fun b!46218 () Bool)

(assert (=> b!46218 (= e!29451 0)))

(declare-fun b!46219 () Bool)

(assert (=> b!46219 (= e!29451 (+ 1 (ListPrimitiveSize!44 (t!4267 l!812))))))

(assert (= (and d!9037 c!6246) b!46218))

(assert (= (and d!9037 (not c!6246)) b!46219))

(declare-fun m!40649 () Bool)

(assert (=> b!46219 m!40649))

(assert (=> b!46196 d!9037))

(declare-fun d!9043 () Bool)

(declare-fun res!27020 () Bool)

(declare-fun e!29465 () Bool)

(assert (=> d!9043 (=> res!27020 e!29465)))

(assert (=> d!9043 (= res!27020 (or ((_ is Nil!1239) l!812) ((_ is Nil!1239) (t!4267 l!812))))))

(assert (=> d!9043 (= (isStrictlySorted!233 l!812) e!29465)))

(declare-fun b!46240 () Bool)

(declare-fun e!29466 () Bool)

(assert (=> b!46240 (= e!29465 e!29466)))

(declare-fun res!27021 () Bool)

(assert (=> b!46240 (=> (not res!27021) (not e!29466))))

(assert (=> b!46240 (= res!27021 (bvslt (_1!859 (h!1818 l!812)) (_1!859 (h!1818 (t!4267 l!812)))))))

(declare-fun b!46241 () Bool)

(assert (=> b!46241 (= e!29466 (isStrictlySorted!233 (t!4267 l!812)))))

(assert (= (and d!9043 (not res!27020)) b!46240))

(assert (= (and b!46240 res!27021) b!46241))

(declare-fun m!40655 () Bool)

(assert (=> b!46241 m!40655))

(assert (=> start!7212 d!9043))

(declare-fun b!46249 () Bool)

(declare-fun e!29471 () Bool)

(declare-fun tp!6095 () Bool)

(assert (=> b!46249 (= e!29471 (and tp_is_empty!1971 tp!6095))))

(assert (=> b!46197 (= tp!6086 e!29471)))

(assert (= (and b!46197 ((_ is Cons!1238) (t!4267 l!812))) b!46249))

(check-sat (not b!46219) (not b!46241) (not b!46249) tp_is_empty!1971)
(check-sat)
