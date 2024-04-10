; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2056 () Bool)

(assert start!2056)

(declare-fun res!10909 () Bool)

(declare-fun e!8299 () Bool)

(assert (=> start!2056 (=> (not res!10909) (not e!8299))))

(declare-datatypes ((B!528 0))(
  ( (B!529 (val!362 Int)) )
))
(declare-datatypes ((tuple2!524 0))(
  ( (tuple2!525 (_1!262 (_ BitVec 64)) (_2!262 B!528)) )
))
(declare-datatypes ((List!417 0))(
  ( (Nil!414) (Cons!413 (h!979 tuple2!524) (t!2813 List!417)) )
))
(declare-fun l!522 () List!417)

(declare-fun isStrictlySorted!104 (List!417) Bool)

(assert (=> start!2056 (= res!10909 (isStrictlySorted!104 l!522))))

(assert (=> start!2056 e!8299))

(declare-fun e!8300 () Bool)

(assert (=> start!2056 e!8300))

(declare-fun b!13930 () Bool)

(declare-fun ListPrimitiveSize!21 (List!417) Int)

(assert (=> b!13930 (= e!8299 (< (ListPrimitiveSize!21 l!522) 0))))

(declare-fun b!13931 () Bool)

(declare-fun tp_is_empty!707 () Bool)

(declare-fun tp!2273 () Bool)

(assert (=> b!13931 (= e!8300 (and tp_is_empty!707 tp!2273))))

(assert (= (and start!2056 res!10909) b!13930))

(assert (= (and start!2056 (is-Cons!413 l!522)) b!13931))

(declare-fun m!9349 () Bool)

(assert (=> start!2056 m!9349))

(declare-fun m!9351 () Bool)

(assert (=> b!13930 m!9351))

(push 1)

(assert (not b!13930))

(assert (not start!2056))

(assert (not b!13931))

(assert tp_is_empty!707)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2067 () Bool)

(declare-fun lt!3558 () Int)

(assert (=> d!2067 (>= lt!3558 0)))

(declare-fun e!8310 () Int)

(assert (=> d!2067 (= lt!3558 e!8310)))

(declare-fun c!1273 () Bool)

(assert (=> d!2067 (= c!1273 (is-Nil!414 l!522))))

(assert (=> d!2067 (= (ListPrimitiveSize!21 l!522) lt!3558)))

(declare-fun b!13944 () Bool)

(assert (=> b!13944 (= e!8310 0)))

(declare-fun b!13946 () Bool)

(assert (=> b!13946 (= e!8310 (+ 1 (ListPrimitiveSize!21 (t!2813 l!522))))))

(assert (= (and d!2067 c!1273) b!13944))

(assert (= (and d!2067 (not c!1273)) b!13946))

(declare-fun m!9354 () Bool)

(assert (=> b!13946 m!9354))

(assert (=> b!13930 d!2067))

(declare-fun d!2075 () Bool)

(declare-fun res!10924 () Bool)

(declare-fun e!8324 () Bool)

(assert (=> d!2075 (=> res!10924 e!8324)))

(assert (=> d!2075 (= res!10924 (or (is-Nil!414 l!522) (is-Nil!414 (t!2813 l!522))))))

(assert (=> d!2075 (= (isStrictlySorted!104 l!522) e!8324)))

(declare-fun b!13964 () Bool)

(declare-fun e!8325 () Bool)

(assert (=> b!13964 (= e!8324 e!8325)))

(declare-fun res!10925 () Bool)

(assert (=> b!13964 (=> (not res!10925) (not e!8325))))

(assert (=> b!13964 (= res!10925 (bvslt (_1!262 (h!979 l!522)) (_1!262 (h!979 (t!2813 l!522)))))))

(declare-fun b!13965 () Bool)

(assert (=> b!13965 (= e!8325 (isStrictlySorted!104 (t!2813 l!522)))))

(assert (= (and d!2075 (not res!10924)) b!13964))

(assert (= (and b!13964 res!10925) b!13965))

(declare-fun m!9361 () Bool)

(assert (=> b!13965 m!9361))

(assert (=> start!2056 d!2075))

(declare-fun b!13981 () Bool)

(declare-fun e!8335 () Bool)

(declare-fun tp!2281 () Bool)

(assert (=> b!13981 (= e!8335 (and tp_is_empty!707 tp!2281))))

(assert (=> b!13931 (= tp!2273 e!8335)))

(assert (= (and b!13931 (is-Cons!413 (t!2813 l!522))) b!13981))

(push 1)

