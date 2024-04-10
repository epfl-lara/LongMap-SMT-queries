; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2052 () Bool)

(assert start!2052)

(declare-fun res!10903 () Bool)

(declare-fun e!8287 () Bool)

(assert (=> start!2052 (=> (not res!10903) (not e!8287))))

(declare-datatypes ((B!524 0))(
  ( (B!525 (val!360 Int)) )
))
(declare-datatypes ((tuple2!520 0))(
  ( (tuple2!521 (_1!260 (_ BitVec 64)) (_2!260 B!524)) )
))
(declare-datatypes ((List!415 0))(
  ( (Nil!412) (Cons!411 (h!977 tuple2!520) (t!2811 List!415)) )
))
(declare-fun l!522 () List!415)

(declare-fun isStrictlySorted!102 (List!415) Bool)

(assert (=> start!2052 (= res!10903 (isStrictlySorted!102 l!522))))

(assert (=> start!2052 e!8287))

(declare-fun e!8288 () Bool)

(assert (=> start!2052 e!8288))

(declare-fun b!13918 () Bool)

(declare-fun ListPrimitiveSize!19 (List!415) Int)

(assert (=> b!13918 (= e!8287 (< (ListPrimitiveSize!19 l!522) 0))))

(declare-fun b!13919 () Bool)

(declare-fun tp_is_empty!703 () Bool)

(declare-fun tp!2267 () Bool)

(assert (=> b!13919 (= e!8288 (and tp_is_empty!703 tp!2267))))

(assert (= (and start!2052 res!10903) b!13918))

(assert (= (and start!2052 (is-Cons!411 l!522)) b!13919))

(declare-fun m!9341 () Bool)

(assert (=> start!2052 m!9341))

(declare-fun m!9343 () Bool)

(assert (=> b!13918 m!9343))

(push 1)

(assert (not b!13918))

(assert (not start!2052))

(assert (not b!13919))

(assert tp_is_empty!703)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2071 () Bool)

(declare-fun lt!3557 () Int)

(assert (=> d!2071 (>= lt!3557 0)))

(declare-fun e!8309 () Int)

(assert (=> d!2071 (= lt!3557 e!8309)))

(declare-fun c!1274 () Bool)

(assert (=> d!2071 (= c!1274 (is-Nil!412 l!522))))

(assert (=> d!2071 (= (ListPrimitiveSize!19 l!522) lt!3557)))

(declare-fun b!13945 () Bool)

(assert (=> b!13945 (= e!8309 0)))

(declare-fun b!13947 () Bool)

(assert (=> b!13947 (= e!8309 (+ 1 (ListPrimitiveSize!19 (t!2811 l!522))))))

(assert (= (and d!2071 c!1274) b!13945))

(assert (= (and d!2071 (not c!1274)) b!13947))

(declare-fun m!9355 () Bool)

(assert (=> b!13947 m!9355))

(assert (=> b!13918 d!2071))

(declare-fun d!2073 () Bool)

(declare-fun res!10926 () Bool)

(declare-fun e!8326 () Bool)

(assert (=> d!2073 (=> res!10926 e!8326)))

(assert (=> d!2073 (= res!10926 (or (is-Nil!412 l!522) (is-Nil!412 (t!2811 l!522))))))

(assert (=> d!2073 (= (isStrictlySorted!102 l!522) e!8326)))

(declare-fun b!13966 () Bool)

(declare-fun e!8327 () Bool)

(assert (=> b!13966 (= e!8326 e!8327)))

(declare-fun res!10927 () Bool)

(assert (=> b!13966 (=> (not res!10927) (not e!8327))))

(assert (=> b!13966 (= res!10927 (bvslt (_1!260 (h!977 l!522)) (_1!260 (h!977 (t!2811 l!522)))))))

(declare-fun b!13967 () Bool)

(assert (=> b!13967 (= e!8327 (isStrictlySorted!102 (t!2811 l!522)))))

(assert (= (and d!2073 (not res!10926)) b!13966))

(assert (= (and b!13966 res!10927) b!13967))

(declare-fun m!9363 () Bool)

(assert (=> b!13967 m!9363))

(assert (=> start!2052 d!2073))

(declare-fun b!13982 () Bool)

(declare-fun e!8336 () Bool)

(declare-fun tp!2282 () Bool)

(assert (=> b!13982 (= e!8336 (and tp_is_empty!703 tp!2282))))

(assert (=> b!13919 (= tp!2267 e!8336)))

(assert (= (and b!13919 (is-Cons!411 (t!2811 l!522))) b!13982))

(push 1)

(assert (not b!13947))

(assert (not b!13967))

(assert (not b!13982))

(assert tp_is_empty!703)

(check-sat)

