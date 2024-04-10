; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138216 () Bool)

(assert start!138216)

(declare-fun res!1082732 () Bool)

(declare-fun e!885099 () Bool)

(assert (=> start!138216 (=> (not res!1082732) (not e!885099))))

(declare-datatypes ((B!2982 0))(
  ( (B!2983 (val!19853 Int)) )
))
(declare-datatypes ((tuple2!25874 0))(
  ( (tuple2!25875 (_1!12948 (_ BitVec 64)) (_2!12948 B!2982)) )
))
(declare-datatypes ((List!36973 0))(
  ( (Nil!36970) (Cons!36969 (h!38512 tuple2!25874) (t!51891 List!36973)) )
))
(declare-fun l!556 () List!36973)

(declare-fun isStrictlySorted!1195 (List!36973) Bool)

(assert (=> start!138216 (= res!1082732 (isStrictlySorted!1195 l!556))))

(assert (=> start!138216 e!885099))

(declare-fun e!885098 () Bool)

(assert (=> start!138216 e!885098))

(assert (=> start!138216 true))

(declare-fun b!1585326 () Bool)

(declare-fun res!1082731 () Bool)

(assert (=> b!1585326 (=> (not res!1082731) (not e!885099))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1585326 (= res!1082731 (and (is-Cons!36969 l!556) (bvslt (_1!12948 (h!38512 l!556)) newKey!21)))))

(declare-fun b!1585327 () Bool)

(declare-fun ListPrimitiveSize!228 (List!36973) Int)

(assert (=> b!1585327 (= e!885099 (>= (ListPrimitiveSize!228 (t!51891 l!556)) (ListPrimitiveSize!228 l!556)))))

(declare-fun b!1585328 () Bool)

(declare-fun tp_is_empty!39515 () Bool)

(declare-fun tp!115248 () Bool)

(assert (=> b!1585328 (= e!885098 (and tp_is_empty!39515 tp!115248))))

(assert (= (and start!138216 res!1082732) b!1585326))

(assert (= (and b!1585326 res!1082731) b!1585327))

(assert (= (and start!138216 (is-Cons!36969 l!556)) b!1585328))

(declare-fun m!1454211 () Bool)

(assert (=> start!138216 m!1454211))

(declare-fun m!1454213 () Bool)

(assert (=> b!1585327 m!1454213))

(declare-fun m!1454215 () Bool)

(assert (=> b!1585327 m!1454215))

(push 1)

(assert (not start!138216))

(assert (not b!1585327))

(assert (not b!1585328))

(assert tp_is_empty!39515)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167659 () Bool)

(declare-fun res!1082749 () Bool)

(declare-fun e!885125 () Bool)

(assert (=> d!167659 (=> res!1082749 e!885125)))

(assert (=> d!167659 (= res!1082749 (or (is-Nil!36970 l!556) (is-Nil!36970 (t!51891 l!556))))))

(assert (=> d!167659 (= (isStrictlySorted!1195 l!556) e!885125)))

(declare-fun b!1585362 () Bool)

(declare-fun e!885126 () Bool)

(assert (=> b!1585362 (= e!885125 e!885126)))

(declare-fun res!1082750 () Bool)

(assert (=> b!1585362 (=> (not res!1082750) (not e!885126))))

(assert (=> b!1585362 (= res!1082750 (bvslt (_1!12948 (h!38512 l!556)) (_1!12948 (h!38512 (t!51891 l!556)))))))

(declare-fun b!1585363 () Bool)

(assert (=> b!1585363 (= e!885126 (isStrictlySorted!1195 (t!51891 l!556)))))

(assert (= (and d!167659 (not res!1082749)) b!1585362))

(assert (= (and b!1585362 res!1082750) b!1585363))

(declare-fun m!1454223 () Bool)

(assert (=> b!1585363 m!1454223))

(assert (=> start!138216 d!167659))

(declare-fun d!167663 () Bool)

(declare-fun lt!677369 () Int)

(assert (=> d!167663 (>= lt!677369 0)))

(declare-fun e!885134 () Int)

(assert (=> d!167663 (= lt!677369 e!885134)))

(declare-fun c!146975 () Bool)

(assert (=> d!167663 (= c!146975 (is-Nil!36970 (t!51891 l!556)))))

(assert (=> d!167663 (= (ListPrimitiveSize!228 (t!51891 l!556)) lt!677369)))

