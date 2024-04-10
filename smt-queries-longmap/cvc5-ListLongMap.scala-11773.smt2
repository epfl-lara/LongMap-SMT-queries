; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138212 () Bool)

(assert start!138212)

(declare-fun res!1082719 () Bool)

(declare-fun e!885087 () Bool)

(assert (=> start!138212 (=> (not res!1082719) (not e!885087))))

(declare-datatypes ((B!2978 0))(
  ( (B!2979 (val!19851 Int)) )
))
(declare-datatypes ((tuple2!25870 0))(
  ( (tuple2!25871 (_1!12946 (_ BitVec 64)) (_2!12946 B!2978)) )
))
(declare-datatypes ((List!36971 0))(
  ( (Nil!36968) (Cons!36967 (h!38510 tuple2!25870) (t!51889 List!36971)) )
))
(declare-fun l!556 () List!36971)

(declare-fun isStrictlySorted!1193 (List!36971) Bool)

(assert (=> start!138212 (= res!1082719 (isStrictlySorted!1193 l!556))))

(assert (=> start!138212 e!885087))

(declare-fun e!885086 () Bool)

(assert (=> start!138212 e!885086))

(assert (=> start!138212 true))

(declare-fun b!1585308 () Bool)

(declare-fun res!1082720 () Bool)

(assert (=> b!1585308 (=> (not res!1082720) (not e!885087))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1585308 (= res!1082720 (and (is-Cons!36967 l!556) (bvslt (_1!12946 (h!38510 l!556)) newKey!21)))))

(declare-fun b!1585309 () Bool)

(declare-fun ListPrimitiveSize!226 (List!36971) Int)

(assert (=> b!1585309 (= e!885087 (>= (ListPrimitiveSize!226 (t!51889 l!556)) (ListPrimitiveSize!226 l!556)))))

(declare-fun b!1585310 () Bool)

(declare-fun tp_is_empty!39511 () Bool)

(declare-fun tp!115242 () Bool)

(assert (=> b!1585310 (= e!885086 (and tp_is_empty!39511 tp!115242))))

(assert (= (and start!138212 res!1082719) b!1585308))

(assert (= (and b!1585308 res!1082720) b!1585309))

(assert (= (and start!138212 (is-Cons!36967 l!556)) b!1585310))

(declare-fun m!1454199 () Bool)

(assert (=> start!138212 m!1454199))

(declare-fun m!1454201 () Bool)

(assert (=> b!1585309 m!1454201))

(declare-fun m!1454203 () Bool)

(assert (=> b!1585309 m!1454203))

(push 1)

(assert (not start!138212))

(assert (not b!1585309))

(assert (not b!1585310))

(assert tp_is_empty!39511)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167655 () Bool)

(declare-fun res!1082743 () Bool)

(declare-fun e!885116 () Bool)

(assert (=> d!167655 (=> res!1082743 e!885116)))

(assert (=> d!167655 (= res!1082743 (or (is-Nil!36968 l!556) (is-Nil!36968 (t!51889 l!556))))))

(assert (=> d!167655 (= (isStrictlySorted!1193 l!556) e!885116)))

(declare-fun b!1585351 () Bool)

(declare-fun e!885117 () Bool)

(assert (=> b!1585351 (= e!885116 e!885117)))

(declare-fun res!1082744 () Bool)

(assert (=> b!1585351 (=> (not res!1082744) (not e!885117))))

(assert (=> b!1585351 (= res!1082744 (bvslt (_1!12946 (h!38510 l!556)) (_1!12946 (h!38510 (t!51889 l!556)))))))

(declare-fun b!1585352 () Bool)

(assert (=> b!1585352 (= e!885117 (isStrictlySorted!1193 (t!51889 l!556)))))

(assert (= (and d!167655 (not res!1082743)) b!1585351))

(assert (= (and b!1585351 res!1082744) b!1585352))

(declare-fun m!1454221 () Bool)

(assert (=> b!1585352 m!1454221))

(assert (=> start!138212 d!167655))

(declare-fun d!167661 () Bool)

(declare-fun lt!677365 () Int)

(assert (=> d!167661 (>= lt!677365 0)))

(declare-fun e!885127 () Int)

(assert (=> d!167661 (= lt!677365 e!885127)))

(declare-fun c!146971 () Bool)

(assert (=> d!167661 (= c!146971 (is-Nil!36968 (t!51889 l!556)))))

(assert (=> d!167661 (= (ListPrimitiveSize!226 (t!51889 l!556)) lt!677365)))

(declare-fun b!1585364 () Bool)

(assert (=> b!1585364 (= e!885127 0)))

(declare-fun b!1585365 () Bool)

(assert (=> b!1585365 (= e!885127 (+ 1 (ListPrimitiveSize!226 (t!51889 (t!51889 l!556)))))))

(assert (= (and d!167661 c!146971) b!1585364))

(assert (= (and d!167661 (not c!146971)) b!1585365))

(declare-fun m!1454225 () Bool)

(assert (=> b!1585365 m!1454225))

(assert (=> b!1585309 d!167661))

(declare-fun d!167665 () Bool)

(declare-fun lt!677366 () Int)

(assert (=> d!167665 (>= lt!677366 0)))

(declare-fun e!885128 () Int)

(assert (=> d!167665 (= lt!677366 e!885128)))

(declare-fun c!146972 () Bool)

(assert (=> d!167665 (= c!146972 (is-Nil!36968 l!556))))

(assert (=> d!167665 (= (ListPrimitiveSize!226 l!556) lt!677366)))

(declare-fun b!1585366 () Bool)

(assert (=> b!1585366 (= e!885128 0)))

(declare-fun b!1585367 () Bool)

(assert (=> b!1585367 (= e!885128 (+ 1 (ListPrimitiveSize!226 (t!51889 l!556))))))

(assert (= (and d!167665 c!146972) b!1585366))

(assert (= (and d!167665 (not c!146972)) b!1585367))

(assert (=> b!1585367 m!1454201))

(assert (=> b!1585309 d!167665))

