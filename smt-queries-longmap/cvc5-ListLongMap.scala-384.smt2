; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7240 () Bool)

(assert start!7240)

(declare-fun b!46331 () Bool)

(declare-fun e!29531 () Bool)

(declare-datatypes ((B!884 0))(
  ( (B!885 (val!1029 Int)) )
))
(declare-datatypes ((tuple2!1706 0))(
  ( (tuple2!1707 (_1!864 (_ BitVec 64)) (_2!864 B!884)) )
))
(declare-datatypes ((List!1247 0))(
  ( (Nil!1244) (Cons!1243 (h!1823 tuple2!1706) (t!4272 List!1247)) )
))
(declare-fun l!812 () List!1247)

(declare-fun ListPrimitiveSize!46 (List!1247) Int)

(assert (=> b!46331 (= e!29531 (>= (ListPrimitiveSize!46 (t!4272 l!812)) (ListPrimitiveSize!46 l!812)))))

(declare-fun b!46330 () Bool)

(declare-fun res!27070 () Bool)

(assert (=> b!46330 (=> (not res!27070) (not e!29531))))

(declare-fun isStrictlySorted!238 (List!1247) Bool)

(assert (=> b!46330 (= res!27070 (isStrictlySorted!238 (t!4272 l!812)))))

(declare-fun b!46332 () Bool)

(declare-fun e!29530 () Bool)

(declare-fun tp_is_empty!1981 () Bool)

(declare-fun tp!6119 () Bool)

(assert (=> b!46332 (= e!29530 (and tp_is_empty!1981 tp!6119))))

(declare-fun res!27072 () Bool)

(assert (=> start!7240 (=> (not res!27072) (not e!29531))))

(assert (=> start!7240 (= res!27072 (isStrictlySorted!238 l!812))))

(assert (=> start!7240 e!29531))

(assert (=> start!7240 e!29530))

(declare-fun b!46329 () Bool)

(declare-fun res!27071 () Bool)

(assert (=> b!46329 (=> (not res!27071) (not e!29531))))

(assert (=> b!46329 (= res!27071 (is-Cons!1243 l!812))))

(assert (= (and start!7240 res!27072) b!46329))

(assert (= (and b!46329 res!27071) b!46330))

(assert (= (and b!46330 res!27070) b!46331))

(assert (= (and start!7240 (is-Cons!1243 l!812)) b!46332))

(declare-fun m!40677 () Bool)

(assert (=> b!46331 m!40677))

(declare-fun m!40679 () Bool)

(assert (=> b!46331 m!40679))

(declare-fun m!40681 () Bool)

(assert (=> b!46330 m!40681))

(declare-fun m!40683 () Bool)

(assert (=> start!7240 m!40683))

(push 1)

(assert (not b!46330))

(assert (not b!46331))

(assert (not start!7240))

(assert (not b!46332))

(assert tp_is_empty!1981)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9065 () Bool)

(declare-fun res!27100 () Bool)

(declare-fun e!29553 () Bool)

(assert (=> d!9065 (=> res!27100 e!29553)))

(assert (=> d!9065 (= res!27100 (or (is-Nil!1244 (t!4272 l!812)) (is-Nil!1244 (t!4272 (t!4272 l!812)))))))

(assert (=> d!9065 (= (isStrictlySorted!238 (t!4272 l!812)) e!29553)))

(declare-fun b!46366 () Bool)

(declare-fun e!29555 () Bool)

(assert (=> b!46366 (= e!29553 e!29555)))

(declare-fun res!27102 () Bool)

(assert (=> b!46366 (=> (not res!27102) (not e!29555))))

(assert (=> b!46366 (= res!27102 (bvslt (_1!864 (h!1823 (t!4272 l!812))) (_1!864 (h!1823 (t!4272 (t!4272 l!812))))))))

(declare-fun b!46368 () Bool)

(assert (=> b!46368 (= e!29555 (isStrictlySorted!238 (t!4272 (t!4272 l!812))))))

(assert (= (and d!9065 (not res!27100)) b!46366))

(assert (= (and b!46366 res!27102) b!46368))

(declare-fun m!40701 () Bool)

(assert (=> b!46368 m!40701))

(assert (=> b!46330 d!9065))

(declare-fun d!9071 () Bool)

(declare-fun lt!20289 () Int)

(assert (=> d!9071 (>= lt!20289 0)))

(declare-fun e!29568 () Int)

(assert (=> d!9071 (= lt!20289 e!29568)))

(declare-fun c!6257 () Bool)

(assert (=> d!9071 (= c!6257 (is-Nil!1244 (t!4272 l!812)))))

(assert (=> d!9071 (= (ListPrimitiveSize!46 (t!4272 l!812)) lt!20289)))

(declare-fun b!46385 () Bool)

(assert (=> b!46385 (= e!29568 0)))

(declare-fun b!46386 () Bool)

(assert (=> b!46386 (= e!29568 (+ 1 (ListPrimitiveSize!46 (t!4272 (t!4272 l!812)))))))

(assert (= (and d!9071 c!6257) b!46385))

(assert (= (and d!9071 (not c!6257)) b!46386))

(declare-fun m!40707 () Bool)

(assert (=> b!46386 m!40707))

(assert (=> b!46331 d!9071))

(declare-fun d!9077 () Bool)

(declare-fun lt!20291 () Int)

(assert (=> d!9077 (>= lt!20291 0)))

(declare-fun e!29570 () Int)

(assert (=> d!9077 (= lt!20291 e!29570)))

(declare-fun c!6259 () Bool)

(assert (=> d!9077 (= c!6259 (is-Nil!1244 l!812))))

(assert (=> d!9077 (= (ListPrimitiveSize!46 l!812) lt!20291)))

(declare-fun b!46389 () Bool)

(assert (=> b!46389 (= e!29570 0)))

(declare-fun b!46390 () Bool)

(assert (=> b!46390 (= e!29570 (+ 1 (ListPrimitiveSize!46 (t!4272 l!812))))))

(assert (= (and d!9077 c!6259) b!46389))

(assert (= (and d!9077 (not c!6259)) b!46390))

(assert (=> b!46390 m!40677))

(assert (=> b!46331 d!9077))

(declare-fun d!9081 () Bool)

(declare-fun res!27111 () Bool)

(declare-fun e!29572 () Bool)

(assert (=> d!9081 (=> res!27111 e!29572)))

(assert (=> d!9081 (= res!27111 (or (is-Nil!1244 l!812) (is-Nil!1244 (t!4272 l!812))))))

(assert (=> d!9081 (= (isStrictlySorted!238 l!812) e!29572)))

(declare-fun b!46393 () Bool)

(declare-fun e!29573 () Bool)

(assert (=> b!46393 (= e!29572 e!29573)))

(declare-fun res!27112 () Bool)

(assert (=> b!46393 (=> (not res!27112) (not e!29573))))

(assert (=> b!46393 (= res!27112 (bvslt (_1!864 (h!1823 l!812)) (_1!864 (h!1823 (t!4272 l!812)))))))

(declare-fun b!46394 () Bool)

(assert (=> b!46394 (= e!29573 (isStrictlySorted!238 (t!4272 l!812)))))

(assert (= (and d!9081 (not res!27111)) b!46393))

(assert (= (and b!46393 res!27112) b!46394))

(assert (=> b!46394 m!40681))

(assert (=> start!7240 d!9081))

(declare-fun b!46408 () Bool)

(declare-fun e!29581 () Bool)

(declare-fun tp!6131 () Bool)

(assert (=> b!46408 (= e!29581 (and tp_is_empty!1981 tp!6131))))

(assert (=> b!46332 (= tp!6119 e!29581)))

(assert (= (and b!46332 (is-Cons!1243 (t!4272 l!812))) b!46408))

(push 1)

