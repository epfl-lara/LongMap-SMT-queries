; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1764 () Bool)

(assert start!1764)

(declare-fun b!12402 () Bool)

(declare-fun res!9994 () Bool)

(declare-fun e!7408 () Bool)

(assert (=> b!12402 (=> (not res!9994) (not e!7408))))

(declare-datatypes ((B!452 0))(
  ( (B!453 (val!321 Int)) )
))
(declare-datatypes ((Option!53 0))(
  ( (Some!52 (v!1367 B!452)) (None!51) )
))
(declare-fun lt!3134 () Option!53)

(declare-fun key!303 () (_ BitVec 64))

(declare-datatypes ((tuple2!442 0))(
  ( (tuple2!443 (_1!221 (_ BitVec 64)) (_2!221 B!452)) )
))
(declare-datatypes ((List!373 0))(
  ( (Nil!370) (Cons!369 (h!935 tuple2!442) (t!2760 List!373)) )
))
(declare-fun l!1094 () List!373)

(declare-fun getValueByKey!47 (List!373 (_ BitVec 64)) Option!53)

(assert (=> b!12402 (= res!9994 (= (getValueByKey!47 (t!2760 l!1094) key!303) lt!3134))))

(declare-fun b!12403 () Bool)

(declare-fun e!7407 () Bool)

(assert (=> b!12403 (= e!7407 e!7408)))

(declare-fun res!9993 () Bool)

(assert (=> b!12403 (=> (not res!9993) (not e!7408))))

(assert (=> b!12403 (= res!9993 (= (getValueByKey!47 l!1094 key!303) lt!3134))))

(declare-fun v!194 () B!452)

(assert (=> b!12403 (= lt!3134 (Some!52 v!194))))

(declare-fun b!12404 () Bool)

(declare-fun lt!3133 () tuple2!442)

(declare-fun contains!183 (List!373 tuple2!442) Bool)

(assert (=> b!12404 (= e!7408 (not (contains!183 l!1094 lt!3133)))))

(assert (=> b!12404 (contains!183 (t!2760 l!1094) lt!3133)))

(assert (=> b!12404 (= lt!3133 (tuple2!443 key!303 v!194))))

(declare-datatypes ((Unit!264 0))(
  ( (Unit!265) )
))
(declare-fun lt!3135 () Unit!264)

(declare-fun lemmaGetValueByKeyImpliesContainsTuple!4 (List!373 (_ BitVec 64) B!452) Unit!264)

(assert (=> b!12404 (= lt!3135 (lemmaGetValueByKeyImpliesContainsTuple!4 (t!2760 l!1094) key!303 v!194))))

(declare-fun b!12405 () Bool)

(declare-fun res!9995 () Bool)

(assert (=> b!12405 (=> (not res!9995) (not e!7408))))

(assert (=> b!12405 (= res!9995 (and (is-Cons!369 l!1094) (not (= (_1!221 (h!935 l!1094)) key!303))))))

(declare-fun res!9997 () Bool)

(assert (=> start!1764 (=> (not res!9997) (not e!7407))))

(declare-fun isStrictlySorted!66 (List!373) Bool)

(assert (=> start!1764 (= res!9997 (isStrictlySorted!66 l!1094))))

(assert (=> start!1764 e!7407))

(declare-fun e!7409 () Bool)

(assert (=> start!1764 e!7409))

(declare-fun tp_is_empty!625 () Bool)

(assert (=> start!1764 tp_is_empty!625))

(assert (=> start!1764 true))

(declare-fun b!12406 () Bool)

(declare-fun tp!2078 () Bool)

(assert (=> b!12406 (= e!7409 (and tp_is_empty!625 tp!2078))))

(declare-fun b!12407 () Bool)

(declare-fun res!9996 () Bool)

(assert (=> b!12407 (=> (not res!9996) (not e!7408))))

(assert (=> b!12407 (= res!9996 (isStrictlySorted!66 (t!2760 l!1094)))))

(assert (= (and start!1764 res!9997) b!12403))

(assert (= (and b!12403 res!9993) b!12405))

(assert (= (and b!12405 res!9995) b!12407))

(assert (= (and b!12407 res!9996) b!12402))

(assert (= (and b!12402 res!9994) b!12404))

(assert (= (and start!1764 (is-Cons!369 l!1094)) b!12406))

(declare-fun m!8453 () Bool)

(assert (=> b!12407 m!8453))

(declare-fun m!8455 () Bool)

(assert (=> b!12403 m!8455))

(declare-fun m!8457 () Bool)

(assert (=> b!12402 m!8457))

(declare-fun m!8459 () Bool)

(assert (=> b!12404 m!8459))

(declare-fun m!8461 () Bool)

(assert (=> b!12404 m!8461))

(declare-fun m!8463 () Bool)

(assert (=> b!12404 m!8463))

(declare-fun m!8465 () Bool)

(assert (=> start!1764 m!8465))

(push 1)

(assert (not b!12406))

(assert (not start!1764))

(assert (not b!12407))

(assert tp_is_empty!625)

(assert (not b!12403))

(assert (not b!12404))

(assert (not b!12402))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1757 () Bool)

(declare-fun c!1117 () Bool)

(assert (=> d!1757 (= c!1117 (and (is-Cons!369 l!1094) (= (_1!221 (h!935 l!1094)) key!303)))))

(declare-fun e!7452 () Option!53)

(assert (=> d!1757 (= (getValueByKey!47 l!1094 key!303) e!7452)))

(declare-fun b!12485 () Bool)

(declare-fun e!7453 () Option!53)

(assert (=> b!12485 (= e!7452 e!7453)))

(declare-fun c!1118 () Bool)

(assert (=> b!12485 (= c!1118 (and (is-Cons!369 l!1094) (not (= (_1!221 (h!935 l!1094)) key!303))))))

(declare-fun b!12484 () Bool)

(assert (=> b!12484 (= e!7452 (Some!52 (_2!221 (h!935 l!1094))))))

(declare-fun b!12487 () Bool)

(assert (=> b!12487 (= e!7453 None!51)))

(declare-fun b!12486 () Bool)

(assert (=> b!12486 (= e!7453 (getValueByKey!47 (t!2760 l!1094) key!303))))

(assert (= (and d!1757 c!1117) b!12484))

(assert (= (and d!1757 (not c!1117)) b!12485))

(assert (= (and b!12485 c!1118) b!12486))

(assert (= (and b!12485 (not c!1118)) b!12487))

(assert (=> b!12486 m!8457))

(assert (=> b!12403 d!1757))

(declare-fun d!1767 () Bool)

(declare-fun c!1119 () Bool)

(assert (=> d!1767 (= c!1119 (and (is-Cons!369 (t!2760 l!1094)) (= (_1!221 (h!935 (t!2760 l!1094))) key!303)))))

(declare-fun e!7454 () Option!53)

(assert (=> d!1767 (= (getValueByKey!47 (t!2760 l!1094) key!303) e!7454)))

(declare-fun b!12489 () Bool)

(declare-fun e!7455 () Option!53)

(assert (=> b!12489 (= e!7454 e!7455)))

(declare-fun c!1120 () Bool)

(assert (=> b!12489 (= c!1120 (and (is-Cons!369 (t!2760 l!1094)) (not (= (_1!221 (h!935 (t!2760 l!1094))) key!303))))))

(declare-fun b!12488 () Bool)

(assert (=> b!12488 (= e!7454 (Some!52 (_2!221 (h!935 (t!2760 l!1094)))))))

(declare-fun b!12491 () Bool)

(assert (=> b!12491 (= e!7455 None!51)))

(declare-fun b!12490 () Bool)

(assert (=> b!12490 (= e!7455 (getValueByKey!47 (t!2760 (t!2760 l!1094)) key!303))))

(assert (= (and d!1767 c!1119) b!12488))

(assert (= (and d!1767 (not c!1119)) b!12489))

(assert (= (and b!12489 c!1120) b!12490))

(assert (= (and b!12489 (not c!1120)) b!12491))

(declare-fun m!8501 () Bool)

(assert (=> b!12490 m!8501))

(assert (=> b!12402 d!1767))

(declare-fun d!1769 () Bool)

(declare-fun res!10052 () Bool)

(declare-fun e!7472 () Bool)

(assert (=> d!1769 (=> res!10052 e!7472)))

(assert (=> d!1769 (= res!10052 (or (is-Nil!370 (t!2760 l!1094)) (is-Nil!370 (t!2760 (t!2760 l!1094)))))))

(assert (=> d!1769 (= (isStrictlySorted!66 (t!2760 l!1094)) e!7472)))

(declare-fun b!12508 () Bool)

(declare-fun e!7473 () Bool)

(assert (=> b!12508 (= e!7472 e!7473)))

(declare-fun res!10053 () Bool)

(assert (=> b!12508 (=> (not res!10053) (not e!7473))))

(assert (=> b!12508 (= res!10053 (bvslt (_1!221 (h!935 (t!2760 l!1094))) (_1!221 (h!935 (t!2760 (t!2760 l!1094))))))))

(declare-fun b!12509 () Bool)

