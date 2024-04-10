; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75186 () Bool)

(assert start!75186)

(declare-fun b!885919 () Bool)

(declare-fun res!601554 () Bool)

(declare-fun e!493098 () Bool)

(assert (=> b!885919 (=> (not res!601554) (not e!493098))))

(declare-datatypes ((B!1294 0))(
  ( (B!1295 (val!8953 Int)) )
))
(declare-datatypes ((tuple2!11900 0))(
  ( (tuple2!11901 (_1!5961 (_ BitVec 64)) (_2!5961 B!1294)) )
))
(declare-datatypes ((List!17669 0))(
  ( (Nil!17666) (Cons!17665 (h!18796 tuple2!11900) (t!24946 List!17669)) )
))
(declare-fun l!906 () List!17669)

(declare-fun key1!49 () (_ BitVec 64))

(get-info :version)

(assert (=> b!885919 (= res!601554 (and ((_ is Cons!17665) l!906) (bvslt (_1!5961 (h!18796 l!906)) key1!49)))))

(declare-fun b!885922 () Bool)

(declare-fun e!493097 () Bool)

(declare-fun tp_is_empty!17805 () Bool)

(declare-fun tp!54350 () Bool)

(assert (=> b!885922 (= e!493097 (and tp_is_empty!17805 tp!54350))))

(declare-fun b!885921 () Bool)

(declare-fun ListPrimitiveSize!89 (List!17669) Int)

(assert (=> b!885921 (= e!493098 (>= (ListPrimitiveSize!89 (t!24946 l!906)) (ListPrimitiveSize!89 l!906)))))

(declare-fun res!601553 () Bool)

(assert (=> start!75186 (=> (not res!601553) (not e!493098))))

(declare-fun isStrictlySorted!487 (List!17669) Bool)

(assert (=> start!75186 (= res!601553 (isStrictlySorted!487 l!906))))

(assert (=> start!75186 e!493098))

(assert (=> start!75186 e!493097))

(assert (=> start!75186 true))

(declare-fun b!885920 () Bool)

(declare-fun res!601555 () Bool)

(assert (=> b!885920 (=> (not res!601555) (not e!493098))))

(assert (=> b!885920 (= res!601555 (isStrictlySorted!487 (t!24946 l!906)))))

(assert (= (and start!75186 res!601553) b!885919))

(assert (= (and b!885919 res!601554) b!885920))

(assert (= (and b!885920 res!601555) b!885921))

(assert (= (and start!75186 ((_ is Cons!17665) l!906)) b!885922))

(declare-fun m!825891 () Bool)

(assert (=> b!885921 m!825891))

(declare-fun m!825893 () Bool)

(assert (=> b!885921 m!825893))

(declare-fun m!825895 () Bool)

(assert (=> start!75186 m!825895))

(declare-fun m!825897 () Bool)

(assert (=> b!885920 m!825897))

(check-sat (not b!885921) (not b!885922) tp_is_empty!17805 (not b!885920) (not start!75186))
(check-sat)
(get-model)

(declare-fun d!109471 () Bool)

(declare-fun lt!401056 () Int)

(assert (=> d!109471 (>= lt!401056 0)))

(declare-fun e!493107 () Int)

(assert (=> d!109471 (= lt!401056 e!493107)))

(declare-fun c!93365 () Bool)

(assert (=> d!109471 (= c!93365 ((_ is Nil!17666) (t!24946 l!906)))))

(assert (=> d!109471 (= (ListPrimitiveSize!89 (t!24946 l!906)) lt!401056)))

(declare-fun b!885939 () Bool)

(assert (=> b!885939 (= e!493107 0)))

(declare-fun b!885940 () Bool)

(assert (=> b!885940 (= e!493107 (+ 1 (ListPrimitiveSize!89 (t!24946 (t!24946 l!906)))))))

(assert (= (and d!109471 c!93365) b!885939))

(assert (= (and d!109471 (not c!93365)) b!885940))

(declare-fun m!825907 () Bool)

(assert (=> b!885940 m!825907))

(assert (=> b!885921 d!109471))

(declare-fun d!109473 () Bool)

(declare-fun lt!401057 () Int)

(assert (=> d!109473 (>= lt!401057 0)))

(declare-fun e!493108 () Int)

(assert (=> d!109473 (= lt!401057 e!493108)))

(declare-fun c!93366 () Bool)

(assert (=> d!109473 (= c!93366 ((_ is Nil!17666) l!906))))

(assert (=> d!109473 (= (ListPrimitiveSize!89 l!906) lt!401057)))

(declare-fun b!885941 () Bool)

(assert (=> b!885941 (= e!493108 0)))

(declare-fun b!885942 () Bool)

(assert (=> b!885942 (= e!493108 (+ 1 (ListPrimitiveSize!89 (t!24946 l!906))))))

(assert (= (and d!109473 c!93366) b!885941))

(assert (= (and d!109473 (not c!93366)) b!885942))

(assert (=> b!885942 m!825891))

(assert (=> b!885921 d!109473))

(declare-fun d!109475 () Bool)

(declare-fun res!601569 () Bool)

(declare-fun e!493116 () Bool)

(assert (=> d!109475 (=> res!601569 e!493116)))

(assert (=> d!109475 (= res!601569 (or ((_ is Nil!17666) (t!24946 l!906)) ((_ is Nil!17666) (t!24946 (t!24946 l!906)))))))

(assert (=> d!109475 (= (isStrictlySorted!487 (t!24946 l!906)) e!493116)))

(declare-fun b!885953 () Bool)

(declare-fun e!493117 () Bool)

(assert (=> b!885953 (= e!493116 e!493117)))

(declare-fun res!601570 () Bool)

(assert (=> b!885953 (=> (not res!601570) (not e!493117))))

(assert (=> b!885953 (= res!601570 (bvslt (_1!5961 (h!18796 (t!24946 l!906))) (_1!5961 (h!18796 (t!24946 (t!24946 l!906))))))))

(declare-fun b!885954 () Bool)

(assert (=> b!885954 (= e!493117 (isStrictlySorted!487 (t!24946 (t!24946 l!906))))))

(assert (= (and d!109475 (not res!601569)) b!885953))

(assert (= (and b!885953 res!601570) b!885954))

(declare-fun m!825911 () Bool)

(assert (=> b!885954 m!825911))

(assert (=> b!885920 d!109475))

(declare-fun d!109483 () Bool)

(declare-fun res!601571 () Bool)

(declare-fun e!493119 () Bool)

(assert (=> d!109483 (=> res!601571 e!493119)))

(assert (=> d!109483 (= res!601571 (or ((_ is Nil!17666) l!906) ((_ is Nil!17666) (t!24946 l!906))))))

(assert (=> d!109483 (= (isStrictlySorted!487 l!906) e!493119)))

(declare-fun b!885957 () Bool)

(declare-fun e!493120 () Bool)

(assert (=> b!885957 (= e!493119 e!493120)))

(declare-fun res!601572 () Bool)

(assert (=> b!885957 (=> (not res!601572) (not e!493120))))

(assert (=> b!885957 (= res!601572 (bvslt (_1!5961 (h!18796 l!906)) (_1!5961 (h!18796 (t!24946 l!906)))))))

(declare-fun b!885958 () Bool)

(assert (=> b!885958 (= e!493120 (isStrictlySorted!487 (t!24946 l!906)))))

(assert (= (and d!109483 (not res!601571)) b!885957))

(assert (= (and b!885957 res!601572) b!885958))

(assert (=> b!885958 m!825897))

(assert (=> start!75186 d!109483))

(declare-fun b!885963 () Bool)

(declare-fun e!493123 () Bool)

(declare-fun tp!54356 () Bool)

(assert (=> b!885963 (= e!493123 (and tp_is_empty!17805 tp!54356))))

(assert (=> b!885922 (= tp!54350 e!493123)))

(assert (= (and b!885922 ((_ is Cons!17665) (t!24946 l!906))) b!885963))

(check-sat (not b!885963) (not b!885954) (not b!885958) tp_is_empty!17805 (not b!885942) (not b!885940))
(check-sat)
