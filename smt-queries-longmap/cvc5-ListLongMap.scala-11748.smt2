; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137784 () Bool)

(assert start!137784)

(declare-fun b!1582907 () Bool)

(declare-fun res!1081361 () Bool)

(declare-fun e!883495 () Bool)

(assert (=> b!1582907 (=> (not res!1081361) (not e!883495))))

(declare-datatypes ((B!2828 0))(
  ( (B!2829 (val!19776 Int)) )
))
(declare-datatypes ((tuple2!25720 0))(
  ( (tuple2!25721 (_1!12871 (_ BitVec 64)) (_2!12871 B!2828)) )
))
(declare-datatypes ((List!36896 0))(
  ( (Nil!36893) (Cons!36892 (h!38435 tuple2!25720) (t!51810 List!36896)) )
))
(declare-fun l!1065 () List!36896)

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!976 (List!36896 (_ BitVec 64)) Bool)

(assert (=> b!1582907 (= res!1081361 (containsKey!976 l!1065 key!287))))

(declare-fun b!1582908 () Bool)

(declare-fun res!1081362 () Bool)

(assert (=> b!1582908 (=> (not res!1081362) (not e!883495))))

(declare-fun isStrictlySorted!1130 (List!36896) Bool)

(assert (=> b!1582908 (= res!1081362 (isStrictlySorted!1130 (t!51810 l!1065)))))

(declare-fun b!1582909 () Bool)

(declare-fun e!883496 () Bool)

(declare-fun tp_is_empty!39361 () Bool)

(declare-fun tp!114875 () Bool)

(assert (=> b!1582909 (= e!883496 (and tp_is_empty!39361 tp!114875))))

(declare-fun b!1582910 () Bool)

(declare-fun res!1081365 () Bool)

(assert (=> b!1582910 (=> (not res!1081365) (not e!883495))))

(assert (=> b!1582910 (= res!1081365 (containsKey!976 (t!51810 l!1065) key!287))))

(declare-fun b!1582911 () Bool)

(declare-fun ListPrimitiveSize!208 (List!36896) Int)

(assert (=> b!1582911 (= e!883495 (>= (ListPrimitiveSize!208 (t!51810 l!1065)) (ListPrimitiveSize!208 l!1065)))))

(declare-fun b!1582912 () Bool)

(declare-fun res!1081363 () Bool)

(assert (=> b!1582912 (=> (not res!1081363) (not e!883495))))

(assert (=> b!1582912 (= res!1081363 (and (is-Cons!36892 l!1065) (not (= (_1!12871 (h!38435 l!1065)) key!287))))))

(declare-fun res!1081364 () Bool)

(assert (=> start!137784 (=> (not res!1081364) (not e!883495))))

(assert (=> start!137784 (= res!1081364 (isStrictlySorted!1130 l!1065))))

(assert (=> start!137784 e!883495))

(assert (=> start!137784 e!883496))

(assert (=> start!137784 true))

(assert (= (and start!137784 res!1081364) b!1582907))

(assert (= (and b!1582907 res!1081361) b!1582912))

(assert (= (and b!1582912 res!1081363) b!1582908))

(assert (= (and b!1582908 res!1081362) b!1582910))

(assert (= (and b!1582910 res!1081365) b!1582911))

(assert (= (and start!137784 (is-Cons!36892 l!1065)) b!1582909))

(declare-fun m!1453079 () Bool)

(assert (=> b!1582910 m!1453079))

(declare-fun m!1453081 () Bool)

(assert (=> b!1582908 m!1453081))

(declare-fun m!1453083 () Bool)

(assert (=> b!1582911 m!1453083))

(declare-fun m!1453085 () Bool)

(assert (=> b!1582911 m!1453085))

(declare-fun m!1453087 () Bool)

(assert (=> b!1582907 m!1453087))

(declare-fun m!1453089 () Bool)

(assert (=> start!137784 m!1453089))

(push 1)

(assert (not b!1582909))

(assert tp_is_empty!39361)

(assert (not b!1582908))

(assert (not b!1582911))

(assert (not b!1582907))

(assert (not b!1582910))

(assert (not start!137784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167083 () Bool)

(declare-fun res!1081418 () Bool)

(declare-fun e!883531 () Bool)

(assert (=> d!167083 (=> res!1081418 e!883531)))

(assert (=> d!167083 (= res!1081418 (or (is-Nil!36893 (t!51810 l!1065)) (is-Nil!36893 (t!51810 (t!51810 l!1065)))))))

(assert (=> d!167083 (= (isStrictlySorted!1130 (t!51810 l!1065)) e!883531)))

(declare-fun b!1582971 () Bool)

(declare-fun e!883532 () Bool)

(assert (=> b!1582971 (= e!883531 e!883532)))

(declare-fun res!1081419 () Bool)

(assert (=> b!1582971 (=> (not res!1081419) (not e!883532))))

(assert (=> b!1582971 (= res!1081419 (bvslt (_1!12871 (h!38435 (t!51810 l!1065))) (_1!12871 (h!38435 (t!51810 (t!51810 l!1065))))))))

(declare-fun b!1582972 () Bool)

(assert (=> b!1582972 (= e!883532 (isStrictlySorted!1130 (t!51810 (t!51810 l!1065))))))

(assert (= (and d!167083 (not res!1081418)) b!1582971))

(assert (= (and b!1582971 res!1081419) b!1582972))

(declare-fun m!1453117 () Bool)

(assert (=> b!1582972 m!1453117))

(assert (=> b!1582908 d!167083))

(declare-fun d!167091 () Bool)

(declare-fun res!1081432 () Bool)

(declare-fun e!883551 () Bool)

(assert (=> d!167091 (=> res!1081432 e!883551)))

(assert (=> d!167091 (= res!1081432 (and (is-Cons!36892 (t!51810 l!1065)) (= (_1!12871 (h!38435 (t!51810 l!1065))) key!287)))))

(assert (=> d!167091 (= (containsKey!976 (t!51810 l!1065) key!287) e!883551)))

(declare-fun b!1582997 () Bool)

(declare-fun e!883552 () Bool)

(assert (=> b!1582997 (= e!883551 e!883552)))

(declare-fun res!1081433 () Bool)

(assert (=> b!1582997 (=> (not res!1081433) (not e!883552))))

(assert (=> b!1582997 (= res!1081433 (and (or (not (is-Cons!36892 (t!51810 l!1065))) (bvsle (_1!12871 (h!38435 (t!51810 l!1065))) key!287)) (is-Cons!36892 (t!51810 l!1065)) (bvslt (_1!12871 (h!38435 (t!51810 l!1065))) key!287)))))

(declare-fun b!1582998 () Bool)

(assert (=> b!1582998 (= e!883552 (containsKey!976 (t!51810 (t!51810 l!1065)) key!287))))

(assert (= (and d!167091 (not res!1081432)) b!1582997))

(assert (= (and b!1582997 res!1081433) b!1582998))

(declare-fun m!1453125 () Bool)

(assert (=> b!1582998 m!1453125))

(assert (=> b!1582910 d!167091))

(declare-fun d!167103 () Bool)

(declare-fun res!1081438 () Bool)

(declare-fun e!883557 () Bool)

(assert (=> d!167103 (=> res!1081438 e!883557)))

(assert (=> d!167103 (= res!1081438 (or (is-Nil!36893 l!1065) (is-Nil!36893 (t!51810 l!1065))))))

(assert (=> d!167103 (= (isStrictlySorted!1130 l!1065) e!883557)))

(declare-fun b!1583003 () Bool)

(declare-fun e!883558 () Bool)

(assert (=> b!1583003 (= e!883557 e!883558)))

(declare-fun res!1081439 () Bool)

(assert (=> b!1583003 (=> (not res!1081439) (not e!883558))))

(assert (=> b!1583003 (= res!1081439 (bvslt (_1!12871 (h!38435 l!1065)) (_1!12871 (h!38435 (t!51810 l!1065)))))))

(declare-fun b!1583004 () Bool)

(assert (=> b!1583004 (= e!883558 (isStrictlySorted!1130 (t!51810 l!1065)))))

(assert (= (and d!167103 (not res!1081438)) b!1583003))

(assert (= (and b!1583003 res!1081439) b!1583004))

(assert (=> b!1583004 m!1453081))

(assert (=> start!137784 d!167103))

(declare-fun d!167105 () Bool)

(declare-fun lt!677147 () Int)

(assert (=> d!167105 (>= lt!677147 0)))

(declare-fun e!883571 () Int)

(assert (=> d!167105 (= lt!677147 e!883571)))

(declare-fun c!146682 () Bool)

(assert (=> d!167105 (= c!146682 (is-Nil!36893 (t!51810 l!1065)))))

(assert (=> d!167105 (= (ListPrimitiveSize!208 (t!51810 l!1065)) lt!677147)))

(declare-fun b!1583025 () Bool)

(assert (=> b!1583025 (= e!883571 0)))

(declare-fun b!1583026 () Bool)

(assert (=> b!1583026 (= e!883571 (+ 1 (ListPrimitiveSize!208 (t!51810 (t!51810 l!1065)))))))

(assert (= (and d!167105 c!146682) b!1583025))

(assert (= (and d!167105 (not c!146682)) b!1583026))

(declare-fun m!1453131 () Bool)

(assert (=> b!1583026 m!1453131))

(assert (=> b!1582911 d!167105))

(declare-fun d!167111 () Bool)

(declare-fun lt!677148 () Int)

(assert (=> d!167111 (>= lt!677148 0)))

(declare-fun e!883572 () Int)

(assert (=> d!167111 (= lt!677148 e!883572)))

(declare-fun c!146683 () Bool)

(assert (=> d!167111 (= c!146683 (is-Nil!36893 l!1065))))

(assert (=> d!167111 (= (ListPrimitiveSize!208 l!1065) lt!677148)))

(declare-fun b!1583027 () Bool)

(assert (=> b!1583027 (= e!883572 0)))

(declare-fun b!1583028 () Bool)

(assert (=> b!1583028 (= e!883572 (+ 1 (ListPrimitiveSize!208 (t!51810 l!1065))))))

(assert (= (and d!167111 c!146683) b!1583027))

(assert (= (and d!167111 (not c!146683)) b!1583028))

(assert (=> b!1583028 m!1453083))

(assert (=> b!1582911 d!167111))

(declare-fun d!167113 () Bool)

(declare-fun res!1081442 () Bool)

(declare-fun e!883573 () Bool)

(assert (=> d!167113 (=> res!1081442 e!883573)))

(assert (=> d!167113 (= res!1081442 (and (is-Cons!36892 l!1065) (= (_1!12871 (h!38435 l!1065)) key!287)))))

(assert (=> d!167113 (= (containsKey!976 l!1065 key!287) e!883573)))

(declare-fun b!1583029 () Bool)

(declare-fun e!883574 () Bool)

(assert (=> b!1583029 (= e!883573 e!883574)))

(declare-fun res!1081443 () Bool)

(assert (=> b!1583029 (=> (not res!1081443) (not e!883574))))

(assert (=> b!1583029 (= res!1081443 (and (or (not (is-Cons!36892 l!1065)) (bvsle (_1!12871 (h!38435 l!1065)) key!287)) (is-Cons!36892 l!1065) (bvslt (_1!12871 (h!38435 l!1065)) key!287)))))

(declare-fun b!1583030 () Bool)

(assert (=> b!1583030 (= e!883574 (containsKey!976 (t!51810 l!1065) key!287))))

(assert (= (and d!167113 (not res!1081442)) b!1583029))

(assert (= (and b!1583029 res!1081443) b!1583030))

(assert (=> b!1583030 m!1453079))

(assert (=> b!1582907 d!167113))

(declare-fun b!1583035 () Bool)

(declare-fun e!883577 () Bool)

(declare-fun tp!114890 () Bool)

(assert (=> b!1583035 (= e!883577 (and tp_is_empty!39361 tp!114890))))

(assert (=> b!1582909 (= tp!114875 e!883577)))

(assert (= (and b!1582909 (is-Cons!36892 (t!51810 l!1065))) b!1583035))

(push 1)

(assert (not b!1582972))

(assert tp_is_empty!39361)

(assert (not b!1583028))

(assert (not b!1582998))

(assert (not b!1583004))

(assert (not b!1583035))

(assert (not b!1583030))

(assert (not b!1583026))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

