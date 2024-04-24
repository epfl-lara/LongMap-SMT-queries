; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103964 () Bool)

(assert start!103964)

(declare-fun b!1243262 () Bool)

(declare-fun res!828889 () Bool)

(declare-fun e!704846 () Bool)

(assert (=> b!1243262 (=> (not res!828889) (not e!704846))))

(declare-datatypes ((B!1880 0))(
  ( (B!1881 (val!15702 Int)) )
))
(declare-datatypes ((tuple2!20292 0))(
  ( (tuple2!20293 (_1!10157 (_ BitVec 64)) (_2!10157 B!1880)) )
))
(declare-datatypes ((List!27392 0))(
  ( (Nil!27389) (Cons!27388 (h!28606 tuple2!20292) (t!40847 List!27392)) )
))
(declare-fun l!644 () List!27392)

(get-info :version)

(assert (=> b!1243262 (= res!828889 ((_ is Cons!27388) l!644))))

(declare-fun res!828891 () Bool)

(assert (=> start!103964 (=> (not res!828891) (not e!704846))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103964 (= res!828891 (not (= key1!25 key2!15)))))

(assert (=> start!103964 e!704846))

(assert (=> start!103964 true))

(declare-fun e!704845 () Bool)

(assert (=> start!103964 e!704845))

(declare-fun b!1243263 () Bool)

(declare-fun tp_is_empty!31279 () Bool)

(declare-fun tp!92726 () Bool)

(assert (=> b!1243263 (= e!704845 (and tp_is_empty!31279 tp!92726))))

(declare-fun b!1243264 () Bool)

(declare-fun res!828888 () Bool)

(assert (=> b!1243264 (=> (not res!828888) (not e!704846))))

(declare-fun isStrictlySorted!748 (List!27392) Bool)

(assert (=> b!1243264 (= res!828888 (isStrictlySorted!748 (t!40847 l!644)))))

(declare-fun b!1243265 () Bool)

(declare-fun ListPrimitiveSize!148 (List!27392) Int)

(assert (=> b!1243265 (= e!704846 (>= (ListPrimitiveSize!148 (t!40847 l!644)) (ListPrimitiveSize!148 l!644)))))

(declare-fun b!1243266 () Bool)

(declare-fun res!828890 () Bool)

(assert (=> b!1243266 (=> (not res!828890) (not e!704846))))

(assert (=> b!1243266 (= res!828890 (isStrictlySorted!748 l!644))))

(assert (= (and start!103964 res!828891) b!1243266))

(assert (= (and b!1243266 res!828890) b!1243262))

(assert (= (and b!1243262 res!828889) b!1243264))

(assert (= (and b!1243264 res!828888) b!1243265))

(assert (= (and start!103964 ((_ is Cons!27388) l!644)) b!1243263))

(declare-fun m!1146357 () Bool)

(assert (=> b!1243264 m!1146357))

(declare-fun m!1146359 () Bool)

(assert (=> b!1243265 m!1146359))

(declare-fun m!1146361 () Bool)

(assert (=> b!1243265 m!1146361))

(declare-fun m!1146363 () Bool)

(assert (=> b!1243266 m!1146363))

(check-sat (not b!1243263) tp_is_empty!31279 (not b!1243264) (not b!1243266) (not b!1243265))
(check-sat)
(get-model)

(declare-fun d!137029 () Bool)

(declare-fun res!828925 () Bool)

(declare-fun e!704868 () Bool)

(assert (=> d!137029 (=> res!828925 e!704868)))

(assert (=> d!137029 (= res!828925 (or ((_ is Nil!27389) (t!40847 l!644)) ((_ is Nil!27389) (t!40847 (t!40847 l!644)))))))

(assert (=> d!137029 (= (isStrictlySorted!748 (t!40847 l!644)) e!704868)))

(declare-fun b!1243306 () Bool)

(declare-fun e!704870 () Bool)

(assert (=> b!1243306 (= e!704868 e!704870)))

(declare-fun res!828927 () Bool)

(assert (=> b!1243306 (=> (not res!828927) (not e!704870))))

(assert (=> b!1243306 (= res!828927 (bvslt (_1!10157 (h!28606 (t!40847 l!644))) (_1!10157 (h!28606 (t!40847 (t!40847 l!644))))))))

(declare-fun b!1243308 () Bool)

(assert (=> b!1243308 (= e!704870 (isStrictlySorted!748 (t!40847 (t!40847 l!644))))))

(assert (= (and d!137029 (not res!828925)) b!1243306))

(assert (= (and b!1243306 res!828927) b!1243308))

(declare-fun m!1146382 () Bool)

(assert (=> b!1243308 m!1146382))

(assert (=> b!1243264 d!137029))

(declare-fun d!137033 () Bool)

(declare-fun res!828929 () Bool)

(declare-fun e!704872 () Bool)

(assert (=> d!137033 (=> res!828929 e!704872)))

(assert (=> d!137033 (= res!828929 (or ((_ is Nil!27389) l!644) ((_ is Nil!27389) (t!40847 l!644))))))

(assert (=> d!137033 (= (isStrictlySorted!748 l!644) e!704872)))

(declare-fun b!1243310 () Bool)

(declare-fun e!704874 () Bool)

(assert (=> b!1243310 (= e!704872 e!704874)))

(declare-fun res!828931 () Bool)

(assert (=> b!1243310 (=> (not res!828931) (not e!704874))))

(assert (=> b!1243310 (= res!828931 (bvslt (_1!10157 (h!28606 l!644)) (_1!10157 (h!28606 (t!40847 l!644)))))))

(declare-fun b!1243312 () Bool)

(assert (=> b!1243312 (= e!704874 (isStrictlySorted!748 (t!40847 l!644)))))

(assert (= (and d!137033 (not res!828929)) b!1243310))

(assert (= (and b!1243310 res!828931) b!1243312))

(assert (=> b!1243312 m!1146357))

(assert (=> b!1243266 d!137033))

(declare-fun d!137036 () Bool)

(declare-fun lt!562660 () Int)

(assert (=> d!137036 (>= lt!562660 0)))

(declare-fun e!704879 () Int)

(assert (=> d!137036 (= lt!562660 e!704879)))

(declare-fun c!121921 () Bool)

(assert (=> d!137036 (= c!121921 ((_ is Nil!27389) (t!40847 l!644)))))

(assert (=> d!137036 (= (ListPrimitiveSize!148 (t!40847 l!644)) lt!562660)))

(declare-fun b!1243321 () Bool)

(assert (=> b!1243321 (= e!704879 0)))

(declare-fun b!1243322 () Bool)

(assert (=> b!1243322 (= e!704879 (+ 1 (ListPrimitiveSize!148 (t!40847 (t!40847 l!644)))))))

(assert (= (and d!137036 c!121921) b!1243321))

(assert (= (and d!137036 (not c!121921)) b!1243322))

(declare-fun m!1146386 () Bool)

(assert (=> b!1243322 m!1146386))

(assert (=> b!1243265 d!137036))

(declare-fun d!137043 () Bool)

(declare-fun lt!562663 () Int)

(assert (=> d!137043 (>= lt!562663 0)))

(declare-fun e!704882 () Int)

(assert (=> d!137043 (= lt!562663 e!704882)))

(declare-fun c!121924 () Bool)

(assert (=> d!137043 (= c!121924 ((_ is Nil!27389) l!644))))

(assert (=> d!137043 (= (ListPrimitiveSize!148 l!644) lt!562663)))

(declare-fun b!1243327 () Bool)

(assert (=> b!1243327 (= e!704882 0)))

(declare-fun b!1243328 () Bool)

(assert (=> b!1243328 (= e!704882 (+ 1 (ListPrimitiveSize!148 (t!40847 l!644))))))

(assert (= (and d!137043 c!121924) b!1243327))

(assert (= (and d!137043 (not c!121924)) b!1243328))

(assert (=> b!1243328 m!1146359))

(assert (=> b!1243265 d!137043))

(declare-fun b!1243337 () Bool)

(declare-fun e!704887 () Bool)

(declare-fun tp!92737 () Bool)

(assert (=> b!1243337 (= e!704887 (and tp_is_empty!31279 tp!92737))))

(assert (=> b!1243263 (= tp!92726 e!704887)))

(assert (= (and b!1243263 ((_ is Cons!27388) (t!40847 l!644))) b!1243337))

(check-sat (not b!1243308) (not b!1243322) tp_is_empty!31279 (not b!1243312) (not b!1243337) (not b!1243328))
(check-sat)
