; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137788 () Bool)

(assert start!137788)

(declare-fun b!1582943 () Bool)

(declare-fun e!883508 () Bool)

(declare-fun tp_is_empty!39365 () Bool)

(declare-fun tp!114881 () Bool)

(assert (=> b!1582943 (= e!883508 (and tp_is_empty!39365 tp!114881))))

(declare-fun b!1582944 () Bool)

(declare-fun res!1081393 () Bool)

(declare-fun e!883507 () Bool)

(assert (=> b!1582944 (=> (not res!1081393) (not e!883507))))

(declare-datatypes ((B!2832 0))(
  ( (B!2833 (val!19778 Int)) )
))
(declare-datatypes ((tuple2!25724 0))(
  ( (tuple2!25725 (_1!12873 (_ BitVec 64)) (_2!12873 B!2832)) )
))
(declare-datatypes ((List!36898 0))(
  ( (Nil!36895) (Cons!36894 (h!38437 tuple2!25724) (t!51812 List!36898)) )
))
(declare-fun l!1065 () List!36898)

(declare-fun isStrictlySorted!1132 (List!36898) Bool)

(assert (=> b!1582944 (= res!1081393 (isStrictlySorted!1132 (t!51812 l!1065)))))

(declare-fun res!1081392 () Bool)

(assert (=> start!137788 (=> (not res!1081392) (not e!883507))))

(assert (=> start!137788 (= res!1081392 (isStrictlySorted!1132 l!1065))))

(assert (=> start!137788 e!883507))

(assert (=> start!137788 e!883508))

(assert (=> start!137788 true))

(declare-fun b!1582945 () Bool)

(declare-fun res!1081394 () Bool)

(assert (=> b!1582945 (=> (not res!1081394) (not e!883507))))

(declare-fun key!287 () (_ BitVec 64))

(assert (=> b!1582945 (= res!1081394 (and (is-Cons!36894 l!1065) (not (= (_1!12873 (h!38437 l!1065)) key!287))))))

(declare-fun b!1582946 () Bool)

(declare-fun ListPrimitiveSize!210 (List!36898) Int)

(assert (=> b!1582946 (= e!883507 (>= (ListPrimitiveSize!210 (t!51812 l!1065)) (ListPrimitiveSize!210 l!1065)))))

(declare-fun b!1582947 () Bool)

(declare-fun res!1081395 () Bool)

(assert (=> b!1582947 (=> (not res!1081395) (not e!883507))))

(declare-fun containsKey!978 (List!36898 (_ BitVec 64)) Bool)

(assert (=> b!1582947 (= res!1081395 (containsKey!978 (t!51812 l!1065) key!287))))

(declare-fun b!1582948 () Bool)

(declare-fun res!1081391 () Bool)

(assert (=> b!1582948 (=> (not res!1081391) (not e!883507))))

(assert (=> b!1582948 (= res!1081391 (containsKey!978 l!1065 key!287))))

(assert (= (and start!137788 res!1081392) b!1582948))

(assert (= (and b!1582948 res!1081391) b!1582945))

(assert (= (and b!1582945 res!1081394) b!1582944))

(assert (= (and b!1582944 res!1081393) b!1582947))

(assert (= (and b!1582947 res!1081395) b!1582946))

(assert (= (and start!137788 (is-Cons!36894 l!1065)) b!1582943))

(declare-fun m!1453103 () Bool)

(assert (=> b!1582946 m!1453103))

(declare-fun m!1453105 () Bool)

(assert (=> b!1582946 m!1453105))

(declare-fun m!1453107 () Bool)

(assert (=> b!1582947 m!1453107))

(declare-fun m!1453109 () Bool)

(assert (=> b!1582944 m!1453109))

(declare-fun m!1453111 () Bool)

(assert (=> start!137788 m!1453111))

(declare-fun m!1453113 () Bool)

(assert (=> b!1582948 m!1453113))

(push 1)

(assert (not b!1582948))

(assert (not b!1582944))

(assert (not start!137788))

(assert (not b!1582943))

(assert (not b!1582946))

(assert tp_is_empty!39365)

(assert (not b!1582947))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167081 () Bool)

(declare-fun res!1081406 () Bool)

(declare-fun e!883519 () Bool)

(assert (=> d!167081 (=> res!1081406 e!883519)))

(assert (=> d!167081 (= res!1081406 (and (is-Cons!36894 (t!51812 l!1065)) (= (_1!12873 (h!38437 (t!51812 l!1065))) key!287)))))

(assert (=> d!167081 (= (containsKey!978 (t!51812 l!1065) key!287) e!883519)))

(declare-fun b!1582959 () Bool)

(declare-fun e!883520 () Bool)

(assert (=> b!1582959 (= e!883519 e!883520)))

(declare-fun res!1081407 () Bool)

(assert (=> b!1582959 (=> (not res!1081407) (not e!883520))))

(assert (=> b!1582959 (= res!1081407 (and (or (not (is-Cons!36894 (t!51812 l!1065))) (bvsle (_1!12873 (h!38437 (t!51812 l!1065))) key!287)) (is-Cons!36894 (t!51812 l!1065)) (bvslt (_1!12873 (h!38437 (t!51812 l!1065))) key!287)))))

(declare-fun b!1582960 () Bool)

(assert (=> b!1582960 (= e!883520 (containsKey!978 (t!51812 (t!51812 l!1065)) key!287))))

(assert (= (and d!167081 (not res!1081406)) b!1582959))

(assert (= (and b!1582959 res!1081407) b!1582960))

(declare-fun m!1453115 () Bool)

(assert (=> b!1582960 m!1453115))

(assert (=> b!1582947 d!167081))

(declare-fun d!167087 () Bool)

(declare-fun res!1081412 () Bool)

(declare-fun e!883525 () Bool)

(assert (=> d!167087 (=> res!1081412 e!883525)))

(assert (=> d!167087 (= res!1081412 (and (is-Cons!36894 l!1065) (= (_1!12873 (h!38437 l!1065)) key!287)))))

(assert (=> d!167087 (= (containsKey!978 l!1065 key!287) e!883525)))

(declare-fun b!1582965 () Bool)

(declare-fun e!883526 () Bool)

(assert (=> b!1582965 (= e!883525 e!883526)))

(declare-fun res!1081413 () Bool)

(assert (=> b!1582965 (=> (not res!1081413) (not e!883526))))

(assert (=> b!1582965 (= res!1081413 (and (or (not (is-Cons!36894 l!1065)) (bvsle (_1!12873 (h!38437 l!1065)) key!287)) (is-Cons!36894 l!1065) (bvslt (_1!12873 (h!38437 l!1065)) key!287)))))

(declare-fun b!1582966 () Bool)

(assert (=> b!1582966 (= e!883526 (containsKey!978 (t!51812 l!1065) key!287))))

(assert (= (and d!167087 (not res!1081412)) b!1582965))

(assert (= (and b!1582965 res!1081413) b!1582966))

(assert (=> b!1582966 m!1453107))

(assert (=> b!1582948 d!167087))

(declare-fun d!167089 () Bool)

(declare-fun res!1081426 () Bool)

(declare-fun e!883541 () Bool)

(assert (=> d!167089 (=> res!1081426 e!883541)))

(assert (=> d!167089 (= res!1081426 (or (is-Nil!36895 (t!51812 l!1065)) (is-Nil!36895 (t!51812 (t!51812 l!1065)))))))

(assert (=> d!167089 (= (isStrictlySorted!1132 (t!51812 l!1065)) e!883541)))

(declare-fun b!1582983 () Bool)

(declare-fun e!883542 () Bool)

(assert (=> b!1582983 (= e!883541 e!883542)))

(declare-fun res!1081427 () Bool)

(assert (=> b!1582983 (=> (not res!1081427) (not e!883542))))

(assert (=> b!1582983 (= res!1081427 (bvslt (_1!12873 (h!38437 (t!51812 l!1065))) (_1!12873 (h!38437 (t!51812 (t!51812 l!1065))))))))

(declare-fun b!1582984 () Bool)

(assert (=> b!1582984 (= e!883542 (isStrictlySorted!1132 (t!51812 (t!51812 l!1065))))))

(assert (= (and d!167089 (not res!1081426)) b!1582983))

(assert (= (and b!1582983 res!1081427) b!1582984))

(declare-fun m!1453119 () Bool)

(assert (=> b!1582984 m!1453119))

(assert (=> b!1582944 d!167089))

(declare-fun d!167095 () Bool)

(declare-fun lt!677143 () Int)

(assert (=> d!167095 (>= lt!677143 0)))

(declare-fun e!883561 () Int)

(assert (=> d!167095 (= lt!677143 e!883561)))

(declare-fun c!146678 () Bool)

(assert (=> d!167095 (= c!146678 (is-Nil!36895 (t!51812 l!1065)))))

(assert (=> d!167095 (= (ListPrimitiveSize!210 (t!51812 l!1065)) lt!677143)))

(declare-fun b!1583009 () Bool)

(assert (=> b!1583009 (= e!883561 0)))

(declare-fun b!1583010 () Bool)

(assert (=> b!1583010 (= e!883561 (+ 1 (ListPrimitiveSize!210 (t!51812 (t!51812 l!1065)))))))

(assert (= (and d!167095 c!146678) b!1583009))

(assert (= (and d!167095 (not c!146678)) b!1583010))

(declare-fun m!1453129 () Bool)

(assert (=> b!1583010 m!1453129))

(assert (=> b!1582946 d!167095))

(declare-fun d!167107 () Bool)

(declare-fun lt!677144 () Int)

(assert (=> d!167107 (>= lt!677144 0)))

(declare-fun e!883563 () Int)

(assert (=> d!167107 (= lt!677144 e!883563)))

(declare-fun c!146679 () Bool)

(assert (=> d!167107 (= c!146679 (is-Nil!36895 l!1065))))

(assert (=> d!167107 (= (ListPrimitiveSize!210 l!1065) lt!677144)))

(declare-fun b!1583012 () Bool)

(assert (=> b!1583012 (= e!883563 0)))

(declare-fun b!1583013 () Bool)

(assert (=> b!1583013 (= e!883563 (+ 1 (ListPrimitiveSize!210 (t!51812 l!1065))))))

(assert (= (and d!167107 c!146679) b!1583012))

(assert (= (and d!167107 (not c!146679)) b!1583013))

(assert (=> b!1583013 m!1453103))

(assert (=> b!1582946 d!167107))

(declare-fun d!167109 () Bool)

(declare-fun res!1081440 () Bool)

(declare-fun e!883564 () Bool)

(assert (=> d!167109 (=> res!1081440 e!883564)))

(assert (=> d!167109 (= res!1081440 (or (is-Nil!36895 l!1065) (is-Nil!36895 (t!51812 l!1065))))))

(assert (=> d!167109 (= (isStrictlySorted!1132 l!1065) e!883564)))

(declare-fun b!1583014 () Bool)

(declare-fun e!883565 () Bool)

(assert (=> b!1583014 (= e!883564 e!883565)))

(declare-fun res!1081441 () Bool)

(assert (=> b!1583014 (=> (not res!1081441) (not e!883565))))

(assert (=> b!1583014 (= res!1081441 (bvslt (_1!12873 (h!38437 l!1065)) (_1!12873 (h!38437 (t!51812 l!1065)))))))

(declare-fun b!1583015 () Bool)

(assert (=> b!1583015 (= e!883565 (isStrictlySorted!1132 (t!51812 l!1065)))))

(assert (= (and d!167109 (not res!1081440)) b!1583014))

(assert (= (and b!1583014 res!1081441) b!1583015))

(assert (=> b!1583015 m!1453109))

(assert (=> start!137788 d!167109))

(declare-fun b!1583024 () Bool)

(declare-fun e!883570 () Bool)

(declare-fun tp!114887 () Bool)

(assert (=> b!1583024 (= e!883570 (and tp_is_empty!39365 tp!114887))))

(assert (=> b!1582943 (= tp!114881 e!883570)))

(assert (= (and b!1582943 (is-Cons!36894 (t!51812 l!1065))) b!1583024))

(push 1)

(assert (not b!1583015))

(assert (not b!1583024))

(assert (not b!1583010))

(assert (not b!1583013))

(assert (not b!1582966))

(assert (not b!1582984))

(assert tp_is_empty!39365)

(assert (not b!1582960))

(check-sat)

(pop 1)

(push 1)

(check-sat)

