; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138198 () Bool)

(assert start!138198)

(declare-fun res!1082696 () Bool)

(declare-fun e!885044 () Bool)

(assert (=> start!138198 (=> (not res!1082696) (not e!885044))))

(declare-datatypes ((B!2976 0))(
  ( (B!2977 (val!19850 Int)) )
))
(declare-datatypes ((tuple2!25868 0))(
  ( (tuple2!25869 (_1!12945 (_ BitVec 64)) (_2!12945 B!2976)) )
))
(declare-datatypes ((List!36970 0))(
  ( (Nil!36967) (Cons!36966 (h!38509 tuple2!25868) (t!51888 List!36970)) )
))
(declare-fun l!556 () List!36970)

(declare-fun isStrictlySorted!1192 (List!36970) Bool)

(assert (=> start!138198 (= res!1082696 (isStrictlySorted!1192 l!556))))

(assert (=> start!138198 e!885044))

(declare-fun e!885045 () Bool)

(assert (=> start!138198 e!885045))

(declare-fun b!1585249 () Bool)

(declare-fun ListPrimitiveSize!225 (List!36970) Int)

(assert (=> b!1585249 (= e!885044 (< (ListPrimitiveSize!225 l!556) 0))))

(declare-fun b!1585250 () Bool)

(declare-fun tp_is_empty!39509 () Bool)

(declare-fun tp!115230 () Bool)

(assert (=> b!1585250 (= e!885045 (and tp_is_empty!39509 tp!115230))))

(assert (= (and start!138198 res!1082696) b!1585249))

(assert (= (and start!138198 (is-Cons!36966 l!556)) b!1585250))

(declare-fun m!1454183 () Bool)

(assert (=> start!138198 m!1454183))

(declare-fun m!1454185 () Bool)

(assert (=> b!1585249 m!1454185))

(push 1)

(assert (not b!1585249))

(assert (not start!138198))

(assert (not b!1585250))

(assert tp_is_empty!39509)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167641 () Bool)

(declare-fun lt!677355 () Int)

(assert (=> d!167641 (>= lt!677355 0)))

(declare-fun e!885057 () Int)

(assert (=> d!167641 (= lt!677355 e!885057)))

(declare-fun c!146961 () Bool)

(assert (=> d!167641 (= c!146961 (is-Nil!36967 l!556))))

(assert (=> d!167641 (= (ListPrimitiveSize!225 l!556) lt!677355)))

(declare-fun b!1585267 () Bool)

(assert (=> b!1585267 (= e!885057 0)))

(declare-fun b!1585268 () Bool)

(assert (=> b!1585268 (= e!885057 (+ 1 (ListPrimitiveSize!225 (t!51888 l!556))))))

(assert (= (and d!167641 c!146961) b!1585267))

(assert (= (and d!167641 (not c!146961)) b!1585268))

(declare-fun m!1454191 () Bool)

(assert (=> b!1585268 m!1454191))

(assert (=> b!1585249 d!167641))

(declare-fun d!167647 () Bool)

(declare-fun res!1082713 () Bool)

(declare-fun e!885074 () Bool)

(assert (=> d!167647 (=> res!1082713 e!885074)))

(assert (=> d!167647 (= res!1082713 (or (is-Nil!36967 l!556) (is-Nil!36967 (t!51888 l!556))))))

(assert (=> d!167647 (= (isStrictlySorted!1192 l!556) e!885074)))

(declare-fun b!1585292 () Bool)

(declare-fun e!885075 () Bool)

(assert (=> b!1585292 (= e!885074 e!885075)))

(declare-fun res!1082714 () Bool)

(assert (=> b!1585292 (=> (not res!1082714) (not e!885075))))

(assert (=> b!1585292 (= res!1082714 (bvslt (_1!12945 (h!38509 l!556)) (_1!12945 (h!38509 (t!51888 l!556)))))))

(declare-fun b!1585293 () Bool)

(assert (=> b!1585293 (= e!885075 (isStrictlySorted!1192 (t!51888 l!556)))))

