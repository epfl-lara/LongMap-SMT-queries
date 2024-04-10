; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1744 () Bool)

(assert start!1744)

(declare-fun res!9957 () Bool)

(declare-fun e!7331 () Bool)

(assert (=> start!1744 (=> (not res!9957) (not e!7331))))

(declare-datatypes ((B!450 0))(
  ( (B!451 (val!320 Int)) )
))
(declare-datatypes ((tuple2!440 0))(
  ( (tuple2!441 (_1!220 (_ BitVec 64)) (_2!220 B!450)) )
))
(declare-datatypes ((List!372 0))(
  ( (Nil!369) (Cons!368 (h!934 tuple2!440) (t!2759 List!372)) )
))
(declare-fun l!1094 () List!372)

(declare-fun isStrictlySorted!65 (List!372) Bool)

(assert (=> start!1744 (= res!9957 (isStrictlySorted!65 l!1094))))

(assert (=> start!1744 e!7331))

(declare-fun e!7329 () Bool)

(assert (=> start!1744 e!7329))

(declare-fun tp_is_empty!623 () Bool)

(assert (=> start!1744 tp_is_empty!623))

(assert (=> start!1744 true))

(declare-fun b!12273 () Bool)

(declare-fun res!9958 () Bool)

(declare-fun e!7330 () Bool)

(assert (=> b!12273 (=> (not res!9958) (not e!7330))))

(declare-fun key!303 () (_ BitVec 64))

(declare-datatypes ((Option!52 0))(
  ( (Some!51 (v!1366 B!450)) (None!50) )
))
(declare-fun lt!3114 () Option!52)

(declare-fun getValueByKey!46 (List!372 (_ BitVec 64)) Option!52)

(assert (=> b!12273 (= res!9958 (= (getValueByKey!46 (t!2759 l!1094) key!303) lt!3114))))

(declare-fun b!12274 () Bool)

(declare-fun res!9954 () Bool)

(assert (=> b!12274 (=> (not res!9954) (not e!7330))))

(assert (=> b!12274 (= res!9954 (isStrictlySorted!65 (t!2759 l!1094)))))

(declare-fun b!12275 () Bool)

(declare-fun tp!2066 () Bool)

(assert (=> b!12275 (= e!7329 (and tp_is_empty!623 tp!2066))))

(declare-fun b!12276 () Bool)

(assert (=> b!12276 (= e!7331 e!7330)))

(declare-fun res!9956 () Bool)

(assert (=> b!12276 (=> (not res!9956) (not e!7330))))

(assert (=> b!12276 (= res!9956 (= (getValueByKey!46 l!1094 key!303) lt!3114))))

(declare-fun v!194 () B!450)

(assert (=> b!12276 (= lt!3114 (Some!51 v!194))))

(declare-fun b!12277 () Bool)

(declare-fun res!9955 () Bool)

(assert (=> b!12277 (=> (not res!9955) (not e!7330))))

(assert (=> b!12277 (= res!9955 (and (is-Cons!368 l!1094) (not (= (_1!220 (h!934 l!1094)) key!303))))))

(declare-fun b!12278 () Bool)

(declare-fun ListPrimitiveSize!18 (List!372) Int)

(assert (=> b!12278 (= e!7330 (>= (ListPrimitiveSize!18 (t!2759 l!1094)) (ListPrimitiveSize!18 l!1094)))))

(assert (= (and start!1744 res!9957) b!12276))

(assert (= (and b!12276 res!9956) b!12277))

(assert (= (and b!12277 res!9955) b!12274))

(assert (= (and b!12274 res!9954) b!12273))

(assert (= (and b!12273 res!9958) b!12278))

(assert (= (and start!1744 (is-Cons!368 l!1094)) b!12275))

(declare-fun m!8423 () Bool)

(assert (=> b!12274 m!8423))

(declare-fun m!8425 () Bool)

(assert (=> b!12273 m!8425))

(declare-fun m!8427 () Bool)

(assert (=> start!1744 m!8427))

(declare-fun m!8429 () Bool)

(assert (=> b!12278 m!8429))

(declare-fun m!8431 () Bool)

(assert (=> b!12278 m!8431))

(declare-fun m!8433 () Bool)

(assert (=> b!12276 m!8433))

(push 1)

(assert (not b!12275))

(assert (not start!1744))

(assert (not b!12273))

(assert (not b!12276))

(assert (not b!12278))

(assert (not b!12274))

(assert tp_is_empty!623)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!12297 () Bool)

(declare-fun e!7346 () Option!52)

(assert (=> b!12297 (= e!7346 (Some!51 (_2!220 (h!934 l!1094))))))

(declare-fun b!12299 () Bool)

(declare-fun e!7347 () Option!52)

(assert (=> b!12299 (= e!7347 (getValueByKey!46 (t!2759 l!1094) key!303))))

(declare-fun b!12300 () Bool)

(assert (=> b!12300 (= e!7347 None!50)))

(declare-fun d!1717 () Bool)

(declare-fun c!1069 () Bool)

(assert (=> d!1717 (= c!1069 (and (is-Cons!368 l!1094) (= (_1!220 (h!934 l!1094)) key!303)))))

(assert (=> d!1717 (= (getValueByKey!46 l!1094 key!303) e!7346)))

(declare-fun b!12298 () Bool)

(assert (=> b!12298 (= e!7346 e!7347)))

(declare-fun c!1070 () Bool)

(assert (=> b!12298 (= c!1070 (and (is-Cons!368 l!1094) (not (= (_1!220 (h!934 l!1094)) key!303))))))

(assert (= (and d!1717 c!1069) b!12297))

(assert (= (and d!1717 (not c!1069)) b!12298))

(assert (= (and b!12298 c!1070) b!12299))

(assert (= (and b!12298 (not c!1070)) b!12300))

(assert (=> b!12299 m!8425))

(assert (=> b!12276 d!1717))

(declare-fun d!1723 () Bool)

(declare-fun res!9977 () Bool)

(declare-fun e!7360 () Bool)

(assert (=> d!1723 (=> res!9977 e!7360)))

(assert (=> d!1723 (= res!9977 (or (is-Nil!369 l!1094) (is-Nil!369 (t!2759 l!1094))))))

(assert (=> d!1723 (= (isStrictlySorted!65 l!1094) e!7360)))

(declare-fun b!12317 () Bool)

(declare-fun e!7361 () Bool)

(assert (=> b!12317 (= e!7360 e!7361)))

(declare-fun res!9978 () Bool)

(assert (=> b!12317 (=> (not res!9978) (not e!7361))))

(assert (=> b!12317 (= res!9978 (bvslt (_1!220 (h!934 l!1094)) (_1!220 (h!934 (t!2759 l!1094)))))))

(declare-fun b!12318 () Bool)

(assert (=> b!12318 (= e!7361 (isStrictlySorted!65 (t!2759 l!1094)))))

(assert (= (and d!1723 (not res!9977)) b!12317))

(assert (= (and b!12317 res!9978) b!12318))

(assert (=> b!12318 m!8423))

(assert (=> start!1744 d!1723))

(declare-fun d!1729 () Bool)

(declare-fun lt!3119 () Int)

(assert (=> d!1729 (>= lt!3119 0)))

(declare-fun e!7368 () Int)

(assert (=> d!1729 (= lt!3119 e!7368)))

(declare-fun c!1081 () Bool)

(assert (=> d!1729 (= c!1081 (is-Nil!369 (t!2759 l!1094)))))

(assert (=> d!1729 (= (ListPrimitiveSize!18 (t!2759 l!1094)) lt!3119)))

(declare-fun b!12331 () Bool)

(assert (=> b!12331 (= e!7368 0)))

(declare-fun b!12332 () Bool)

(assert (=> b!12332 (= e!7368 (+ 1 (ListPrimitiveSize!18 (t!2759 (t!2759 l!1094)))))))

(assert (= (and d!1729 c!1081) b!12331))

(assert (= (and d!1729 (not c!1081)) b!12332))

(declare-fun m!8439 () Bool)

(assert (=> b!12332 m!8439))

(assert (=> b!12278 d!1729))

(declare-fun d!1731 () Bool)

(declare-fun lt!3120 () Int)

(assert (=> d!1731 (>= lt!3120 0)))

(declare-fun e!7369 () Int)

(assert (=> d!1731 (= lt!3120 e!7369)))

(declare-fun c!1082 () Bool)

(assert (=> d!1731 (= c!1082 (is-Nil!369 l!1094))))

(assert (=> d!1731 (= (ListPrimitiveSize!18 l!1094) lt!3120)))

(declare-fun b!12333 () Bool)

(assert (=> b!12333 (= e!7369 0)))

(declare-fun b!12334 () Bool)

(assert (=> b!12334 (= e!7369 (+ 1 (ListPrimitiveSize!18 (t!2759 l!1094))))))

(assert (= (and d!1731 c!1082) b!12333))

(assert (= (and d!1731 (not c!1082)) b!12334))

(assert (=> b!12334 m!8429))

(assert (=> b!12278 d!1731))

(declare-fun b!12339 () Bool)

(declare-fun e!7373 () Option!52)

(assert (=> b!12339 (= e!7373 (Some!51 (_2!220 (h!934 (t!2759 l!1094)))))))

(declare-fun b!12341 () Bool)

(declare-fun e!7374 () Option!52)

(assert (=> b!12341 (= e!7374 (getValueByKey!46 (t!2759 (t!2759 l!1094)) key!303))))

(declare-fun b!12342 () Bool)

(assert (=> b!12342 (= e!7374 None!50)))

(declare-fun d!1735 () Bool)

(declare-fun c!1084 () Bool)

(assert (=> d!1735 (= c!1084 (and (is-Cons!368 (t!2759 l!1094)) (= (_1!220 (h!934 (t!2759 l!1094))) key!303)))))

(assert (=> d!1735 (= (getValueByKey!46 (t!2759 l!1094) key!303) e!7373)))

(declare-fun b!12340 () Bool)

(assert (=> b!12340 (= e!7373 e!7374)))

(declare-fun c!1085 () Bool)

(assert (=> b!12340 (= c!1085 (and (is-Cons!368 (t!2759 l!1094)) (not (= (_1!220 (h!934 (t!2759 l!1094))) key!303))))))

(assert (= (and d!1735 c!1084) b!12339))

(assert (= (and d!1735 (not c!1084)) b!12340))

(assert (= (and b!12340 c!1085) b!12341))

(assert (= (and b!12340 (not c!1085)) b!12342))

(declare-fun m!8445 () Bool)

(assert (=> b!12341 m!8445))

(assert (=> b!12273 d!1735))

(declare-fun d!1741 () Bool)

(declare-fun res!9981 () Bool)

(declare-fun e!7376 () Bool)

(assert (=> d!1741 (=> res!9981 e!7376)))

(assert (=> d!1741 (= res!9981 (or (is-Nil!369 (t!2759 l!1094)) (is-Nil!369 (t!2759 (t!2759 l!1094)))))))

(assert (=> d!1741 (= (isStrictlySorted!65 (t!2759 l!1094)) e!7376)))

(declare-fun b!12345 () Bool)

(declare-fun e!7377 () Bool)

(assert (=> b!12345 (= e!7376 e!7377)))

(declare-fun res!9982 () Bool)

(assert (=> b!12345 (=> (not res!9982) (not e!7377))))

(assert (=> b!12345 (= res!9982 (bvslt (_1!220 (h!934 (t!2759 l!1094))) (_1!220 (h!934 (t!2759 (t!2759 l!1094))))))))

(declare-fun b!12346 () Bool)

(assert (=> b!12346 (= e!7377 (isStrictlySorted!65 (t!2759 (t!2759 l!1094))))))

(assert (= (and d!1741 (not res!9981)) b!12345))

(assert (= (and b!12345 res!9982) b!12346))

(declare-fun m!8447 () Bool)

(assert (=> b!12346 m!8447))

(assert (=> b!12274 d!1741))

(declare-fun b!12351 () Bool)

(declare-fun e!7380 () Bool)

(declare-fun tp!2069 () Bool)

(assert (=> b!12351 (= e!7380 (and tp_is_empty!623 tp!2069))))

(assert (=> b!12275 (= tp!2066 e!7380)))

(assert (= (and b!12275 (is-Cons!368 (t!2759 l!1094))) b!12351))

(push 1)

(assert (not b!12299))

(assert (not b!12334))

(assert (not b!12318))

(assert (not b!12346))

(assert tp_is_empty!623)

(assert (not b!12351))

(assert (not b!12332))

