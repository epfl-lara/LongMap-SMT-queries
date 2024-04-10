; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138194 () Bool)

(assert start!138194)

(declare-fun res!1082690 () Bool)

(declare-fun e!885032 () Bool)

(assert (=> start!138194 (=> (not res!1082690) (not e!885032))))

(declare-datatypes ((B!2972 0))(
  ( (B!2973 (val!19848 Int)) )
))
(declare-datatypes ((tuple2!25864 0))(
  ( (tuple2!25865 (_1!12943 (_ BitVec 64)) (_2!12943 B!2972)) )
))
(declare-datatypes ((List!36968 0))(
  ( (Nil!36965) (Cons!36964 (h!38507 tuple2!25864) (t!51886 List!36968)) )
))
(declare-fun l!556 () List!36968)

(declare-fun isStrictlySorted!1190 (List!36968) Bool)

(assert (=> start!138194 (= res!1082690 (isStrictlySorted!1190 l!556))))

(assert (=> start!138194 e!885032))

(declare-fun e!885033 () Bool)

(assert (=> start!138194 e!885033))

(declare-fun b!1585237 () Bool)

(declare-fun ListPrimitiveSize!223 (List!36968) Int)

(assert (=> b!1585237 (= e!885032 (< (ListPrimitiveSize!223 l!556) 0))))

(declare-fun b!1585238 () Bool)

(declare-fun tp_is_empty!39505 () Bool)

(declare-fun tp!115224 () Bool)

(assert (=> b!1585238 (= e!885033 (and tp_is_empty!39505 tp!115224))))

(assert (= (and start!138194 res!1082690) b!1585237))

(assert (= (and start!138194 (is-Cons!36964 l!556)) b!1585238))

(declare-fun m!1454175 () Bool)

(assert (=> start!138194 m!1454175))

(declare-fun m!1454177 () Bool)

(assert (=> b!1585237 m!1454177))

(push 1)

(assert (not b!1585237))

(assert (not start!138194))

(assert (not b!1585238))

(assert tp_is_empty!39505)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167639 () Bool)

(declare-fun lt!677354 () Int)

(assert (=> d!167639 (>= lt!677354 0)))

(declare-fun e!885056 () Int)

(assert (=> d!167639 (= lt!677354 e!885056)))

(declare-fun c!146960 () Bool)

(assert (=> d!167639 (= c!146960 (is-Nil!36965 l!556))))

(assert (=> d!167639 (= (ListPrimitiveSize!223 l!556) lt!677354)))

(declare-fun b!1585265 () Bool)

(assert (=> b!1585265 (= e!885056 0)))

(declare-fun b!1585266 () Bool)

(assert (=> b!1585266 (= e!885056 (+ 1 (ListPrimitiveSize!223 (t!51886 l!556))))))

(assert (= (and d!167639 c!146960) b!1585265))

(assert (= (and d!167639 (not c!146960)) b!1585266))

(declare-fun m!1454189 () Bool)

(assert (=> b!1585266 m!1454189))

(assert (=> b!1585237 d!167639))

(declare-fun d!167645 () Bool)

(declare-fun res!1082711 () Bool)

(declare-fun e!885072 () Bool)

(assert (=> d!167645 (=> res!1082711 e!885072)))

(assert (=> d!167645 (= res!1082711 (or (is-Nil!36965 l!556) (is-Nil!36965 (t!51886 l!556))))))

(assert (=> d!167645 (= (isStrictlySorted!1190 l!556) e!885072)))

(declare-fun b!1585288 () Bool)

(declare-fun e!885073 () Bool)

(assert (=> b!1585288 (= e!885072 e!885073)))

(declare-fun res!1082712 () Bool)

(assert (=> b!1585288 (=> (not res!1082712) (not e!885073))))

(assert (=> b!1585288 (= res!1082712 (bvslt (_1!12943 (h!38507 l!556)) (_1!12943 (h!38507 (t!51886 l!556)))))))

(declare-fun b!1585289 () Bool)

(assert (=> b!1585289 (= e!885073 (isStrictlySorted!1190 (t!51886 l!556)))))

(assert (= (and d!167645 (not res!1082711)) b!1585288))

(assert (= (and b!1585288 res!1082712) b!1585289))

(declare-fun m!1454195 () Bool)

(assert (=> b!1585289 m!1454195))

(assert (=> start!138194 d!167645))

(declare-fun b!1585300 () Bool)

(declare-fun e!885080 () Bool)

(declare-fun tp!115238 () Bool)

(assert (=> b!1585300 (= e!885080 (and tp_is_empty!39505 tp!115238))))

(assert (=> b!1585238 (= tp!115224 e!885080)))

(assert (= (and b!1585238 (is-Cons!36964 (t!51886 l!556))) b!1585300))

(push 1)

