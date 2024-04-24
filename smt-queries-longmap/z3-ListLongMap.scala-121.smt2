; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2052 () Bool)

(assert start!2052)

(declare-fun res!10901 () Bool)

(declare-fun e!8283 () Bool)

(assert (=> start!2052 (=> (not res!10901) (not e!8283))))

(declare-datatypes ((B!524 0))(
  ( (B!525 (val!360 Int)) )
))
(declare-datatypes ((tuple2!516 0))(
  ( (tuple2!517 (_1!258 (_ BitVec 64)) (_2!258 B!524)) )
))
(declare-datatypes ((List!411 0))(
  ( (Nil!408) (Cons!407 (h!973 tuple2!516) (t!2807 List!411)) )
))
(declare-fun l!522 () List!411)

(declare-fun isStrictlySorted!96 (List!411) Bool)

(assert (=> start!2052 (= res!10901 (isStrictlySorted!96 l!522))))

(assert (=> start!2052 e!8283))

(declare-fun e!8284 () Bool)

(assert (=> start!2052 e!8284))

(declare-fun b!13912 () Bool)

(declare-fun ListPrimitiveSize!19 (List!411) Int)

(assert (=> b!13912 (= e!8283 (< (ListPrimitiveSize!19 l!522) 0))))

(declare-fun b!13913 () Bool)

(declare-fun tp_is_empty!703 () Bool)

(declare-fun tp!2267 () Bool)

(assert (=> b!13913 (= e!8284 (and tp_is_empty!703 tp!2267))))

(assert (= (and start!2052 res!10901) b!13912))

(get-info :version)

(assert (= (and start!2052 ((_ is Cons!407) l!522)) b!13913))

(declare-fun m!9333 () Bool)

(assert (=> start!2052 m!9333))

(declare-fun m!9335 () Bool)

(assert (=> b!13912 m!9335))

(check-sat (not start!2052) (not b!13912) (not b!13913) tp_is_empty!703)
(check-sat)
(get-model)

(declare-fun d!2063 () Bool)

(declare-fun res!10912 () Bool)

(declare-fun e!8303 () Bool)

(assert (=> d!2063 (=> res!10912 e!8303)))

(assert (=> d!2063 (= res!10912 (or ((_ is Nil!408) l!522) ((_ is Nil!408) (t!2807 l!522))))))

(assert (=> d!2063 (= (isStrictlySorted!96 l!522) e!8303)))

(declare-fun b!13934 () Bool)

(declare-fun e!8304 () Bool)

(assert (=> b!13934 (= e!8303 e!8304)))

(declare-fun res!10913 () Bool)

(assert (=> b!13934 (=> (not res!10913) (not e!8304))))

(assert (=> b!13934 (= res!10913 (bvslt (_1!258 (h!973 l!522)) (_1!258 (h!973 (t!2807 l!522)))))))

(declare-fun b!13935 () Bool)

(assert (=> b!13935 (= e!8304 (isStrictlySorted!96 (t!2807 l!522)))))

(assert (= (and d!2063 (not res!10912)) b!13934))

(assert (= (and b!13934 res!10913) b!13935))

(declare-fun m!9345 () Bool)

(assert (=> b!13935 m!9345))

(assert (=> start!2052 d!2063))

(declare-fun d!2069 () Bool)

(declare-fun lt!3558 () Int)

(assert (=> d!2069 (>= lt!3558 0)))

(declare-fun e!8312 () Int)

(assert (=> d!2069 (= lt!3558 e!8312)))

(declare-fun c!1272 () Bool)

(assert (=> d!2069 (= c!1272 ((_ is Nil!408) l!522))))

(assert (=> d!2069 (= (ListPrimitiveSize!19 l!522) lt!3558)))

(declare-fun b!13946 () Bool)

(assert (=> b!13946 (= e!8312 0)))

(declare-fun b!13947 () Bool)

(assert (=> b!13947 (= e!8312 (+ 1 (ListPrimitiveSize!19 (t!2807 l!522))))))

(assert (= (and d!2069 c!1272) b!13946))

(assert (= (and d!2069 (not c!1272)) b!13947))

(declare-fun m!9349 () Bool)

(assert (=> b!13947 m!9349))

(assert (=> b!13912 d!2069))

(declare-fun b!13962 () Bool)

(declare-fun e!8323 () Bool)

(declare-fun tp!2276 () Bool)

(assert (=> b!13962 (= e!8323 (and tp_is_empty!703 tp!2276))))

(assert (=> b!13913 (= tp!2267 e!8323)))

(assert (= (and b!13913 ((_ is Cons!407) (t!2807 l!522))) b!13962))

(check-sat (not b!13935) (not b!13947) (not b!13962) tp_is_empty!703)
(check-sat)
