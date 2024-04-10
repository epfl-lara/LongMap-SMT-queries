; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2054 () Bool)

(assert start!2054)

(declare-fun res!10906 () Bool)

(declare-fun e!8293 () Bool)

(assert (=> start!2054 (=> (not res!10906) (not e!8293))))

(declare-datatypes ((B!526 0))(
  ( (B!527 (val!361 Int)) )
))
(declare-datatypes ((tuple2!522 0))(
  ( (tuple2!523 (_1!261 (_ BitVec 64)) (_2!261 B!526)) )
))
(declare-datatypes ((List!416 0))(
  ( (Nil!413) (Cons!412 (h!978 tuple2!522) (t!2812 List!416)) )
))
(declare-fun l!522 () List!416)

(declare-fun isStrictlySorted!103 (List!416) Bool)

(assert (=> start!2054 (= res!10906 (isStrictlySorted!103 l!522))))

(assert (=> start!2054 e!8293))

(declare-fun e!8294 () Bool)

(assert (=> start!2054 e!8294))

(declare-fun b!13924 () Bool)

(declare-fun ListPrimitiveSize!20 (List!416) Int)

(assert (=> b!13924 (= e!8293 (< (ListPrimitiveSize!20 l!522) 0))))

(declare-fun b!13925 () Bool)

(declare-fun tp_is_empty!705 () Bool)

(declare-fun tp!2270 () Bool)

(assert (=> b!13925 (= e!8294 (and tp_is_empty!705 tp!2270))))

(assert (= (and start!2054 res!10906) b!13924))

(get-info :version)

(assert (= (and start!2054 ((_ is Cons!412) l!522)) b!13925))

(declare-fun m!9345 () Bool)

(assert (=> start!2054 m!9345))

(declare-fun m!9347 () Bool)

(assert (=> b!13924 m!9347))

(check-sat (not start!2054) (not b!13924) (not b!13925) tp_is_empty!705)
(check-sat)
(get-model)

(declare-fun d!2069 () Bool)

(declare-fun res!10914 () Bool)

(declare-fun e!8311 () Bool)

(assert (=> d!2069 (=> res!10914 e!8311)))

(assert (=> d!2069 (= res!10914 (or ((_ is Nil!413) l!522) ((_ is Nil!413) (t!2812 l!522))))))

(assert (=> d!2069 (= (isStrictlySorted!103 l!522) e!8311)))

(declare-fun b!13948 () Bool)

(declare-fun e!8312 () Bool)

(assert (=> b!13948 (= e!8311 e!8312)))

(declare-fun res!10915 () Bool)

(assert (=> b!13948 (=> (not res!10915) (not e!8312))))

(assert (=> b!13948 (= res!10915 (bvslt (_1!261 (h!978 l!522)) (_1!261 (h!978 (t!2812 l!522)))))))

(declare-fun b!13949 () Bool)

(assert (=> b!13949 (= e!8312 (isStrictlySorted!103 (t!2812 l!522)))))

(assert (= (and d!2069 (not res!10914)) b!13948))

(assert (= (and b!13948 res!10915) b!13949))

(declare-fun m!9357 () Bool)

(assert (=> b!13949 m!9357))

(assert (=> start!2054 d!2069))

(declare-fun d!2077 () Bool)

(declare-fun lt!3561 () Int)

(assert (=> d!2077 (>= lt!3561 0)))

(declare-fun e!8323 () Int)

(assert (=> d!2077 (= lt!3561 e!8323)))

(declare-fun c!1277 () Bool)

(assert (=> d!2077 (= c!1277 ((_ is Nil!413) l!522))))

(assert (=> d!2077 (= (ListPrimitiveSize!20 l!522) lt!3561)))

(declare-fun b!13962 () Bool)

(assert (=> b!13962 (= e!8323 0)))

(declare-fun b!13963 () Bool)

(assert (=> b!13963 (= e!8323 (+ 1 (ListPrimitiveSize!20 (t!2812 l!522))))))

(assert (= (and d!2077 c!1277) b!13962))

(assert (= (and d!2077 (not c!1277)) b!13963))

(declare-fun m!9359 () Bool)

(assert (=> b!13963 m!9359))

(assert (=> b!13924 d!2077))

(declare-fun b!13980 () Bool)

(declare-fun e!8334 () Bool)

(declare-fun tp!2280 () Bool)

(assert (=> b!13980 (= e!8334 (and tp_is_empty!705 tp!2280))))

(assert (=> b!13925 (= tp!2270 e!8334)))

(assert (= (and b!13925 ((_ is Cons!412) (t!2812 l!522))) b!13980))

(check-sat (not b!13949) (not b!13963) (not b!13980) tp_is_empty!705)
(check-sat)
