; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7244 () Bool)

(assert start!7244)

(declare-fun b!46355 () Bool)

(declare-fun e!29543 () Bool)

(declare-datatypes ((B!888 0))(
  ( (B!889 (val!1031 Int)) )
))
(declare-datatypes ((tuple2!1710 0))(
  ( (tuple2!1711 (_1!866 (_ BitVec 64)) (_2!866 B!888)) )
))
(declare-datatypes ((List!1249 0))(
  ( (Nil!1246) (Cons!1245 (h!1825 tuple2!1710) (t!4274 List!1249)) )
))
(declare-fun l!812 () List!1249)

(declare-fun ListPrimitiveSize!48 (List!1249) Int)

(assert (=> b!46355 (= e!29543 (>= (ListPrimitiveSize!48 (t!4274 l!812)) (ListPrimitiveSize!48 l!812)))))

(declare-fun res!27090 () Bool)

(assert (=> start!7244 (=> (not res!27090) (not e!29543))))

(declare-fun isStrictlySorted!240 (List!1249) Bool)

(assert (=> start!7244 (= res!27090 (isStrictlySorted!240 l!812))))

(assert (=> start!7244 e!29543))

(declare-fun e!29542 () Bool)

(assert (=> start!7244 e!29542))

(declare-fun b!46353 () Bool)

(declare-fun res!27089 () Bool)

(assert (=> b!46353 (=> (not res!27089) (not e!29543))))

(assert (=> b!46353 (= res!27089 (is-Cons!1245 l!812))))

(declare-fun b!46356 () Bool)

(declare-fun tp_is_empty!1985 () Bool)

(declare-fun tp!6125 () Bool)

(assert (=> b!46356 (= e!29542 (and tp_is_empty!1985 tp!6125))))

(declare-fun b!46354 () Bool)

(declare-fun res!27088 () Bool)

(assert (=> b!46354 (=> (not res!27088) (not e!29543))))

(assert (=> b!46354 (= res!27088 (isStrictlySorted!240 (t!4274 l!812)))))

(assert (= (and start!7244 res!27090) b!46353))

(assert (= (and b!46353 res!27089) b!46354))

(assert (= (and b!46354 res!27088) b!46355))

(assert (= (and start!7244 (is-Cons!1245 l!812)) b!46356))

(declare-fun m!40693 () Bool)

(assert (=> b!46355 m!40693))

(declare-fun m!40695 () Bool)

(assert (=> b!46355 m!40695))

(declare-fun m!40697 () Bool)

(assert (=> start!7244 m!40697))

(declare-fun m!40699 () Bool)

(assert (=> b!46354 m!40699))

(push 1)

(assert (not b!46355))

(assert (not b!46354))

(assert (not start!7244))

(assert tp_is_empty!1985)

(assert (not b!46356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9067 () Bool)

(declare-fun res!27109 () Bool)

(declare-fun e!29566 () Bool)

(assert (=> d!9067 (=> res!27109 e!29566)))

(assert (=> d!9067 (= res!27109 (or (is-Nil!1246 (t!4274 l!812)) (is-Nil!1246 (t!4274 (t!4274 l!812)))))))

(assert (=> d!9067 (= (isStrictlySorted!240 (t!4274 l!812)) e!29566)))

(declare-fun b!46383 () Bool)

(declare-fun e!29567 () Bool)

(assert (=> b!46383 (= e!29566 e!29567)))

(declare-fun res!27110 () Bool)

(assert (=> b!46383 (=> (not res!27110) (not e!29567))))

(assert (=> b!46383 (= res!27110 (bvslt (_1!866 (h!1825 (t!4274 l!812))) (_1!866 (h!1825 (t!4274 (t!4274 l!812))))))))

(declare-fun b!46384 () Bool)

(assert (=> b!46384 (= e!29567 (isStrictlySorted!240 (t!4274 (t!4274 l!812))))))

(assert (= (and d!9067 (not res!27109)) b!46383))

(assert (= (and b!46383 res!27110) b!46384))

(declare-fun m!40705 () Bool)

(assert (=> b!46384 m!40705))

(assert (=> b!46354 d!9067))

(declare-fun d!9075 () Bool)

(declare-fun lt!20295 () Int)

(assert (=> d!9075 (>= lt!20295 0)))

(declare-fun e!29582 () Int)

(assert (=> d!9075 (= lt!20295 e!29582)))

(declare-fun c!6263 () Bool)

(assert (=> d!9075 (= c!6263 (is-Nil!1246 (t!4274 l!812)))))

(assert (=> d!9075 (= (ListPrimitiveSize!48 (t!4274 l!812)) lt!20295)))

(declare-fun b!46409 () Bool)

(assert (=> b!46409 (= e!29582 0)))

(declare-fun b!46410 () Bool)

(assert (=> b!46410 (= e!29582 (+ 1 (ListPrimitiveSize!48 (t!4274 (t!4274 l!812)))))))

(assert (= (and d!9075 c!6263) b!46409))

(assert (= (and d!9075 (not c!6263)) b!46410))

(declare-fun m!40711 () Bool)

(assert (=> b!46410 m!40711))

(assert (=> b!46355 d!9075))

(declare-fun d!9083 () Bool)

(declare-fun lt!20296 () Int)

(assert (=> d!9083 (>= lt!20296 0)))

(declare-fun e!29583 () Int)

(assert (=> d!9083 (= lt!20296 e!29583)))

(declare-fun c!6264 () Bool)

(assert (=> d!9083 (= c!6264 (is-Nil!1246 l!812))))

(assert (=> d!9083 (= (ListPrimitiveSize!48 l!812) lt!20296)))

(declare-fun b!46411 () Bool)

(assert (=> b!46411 (= e!29583 0)))

(declare-fun b!46412 () Bool)

(assert (=> b!46412 (= e!29583 (+ 1 (ListPrimitiveSize!48 (t!4274 l!812))))))

(assert (= (and d!9083 c!6264) b!46411))

(assert (= (and d!9083 (not c!6264)) b!46412))

(assert (=> b!46412 m!40693))

(assert (=> b!46355 d!9083))

(declare-fun d!9085 () Bool)

(declare-fun res!27113 () Bool)

(declare-fun e!29584 () Bool)

(assert (=> d!9085 (=> res!27113 e!29584)))

(assert (=> d!9085 (= res!27113 (or (is-Nil!1246 l!812) (is-Nil!1246 (t!4274 l!812))))))

(assert (=> d!9085 (= (isStrictlySorted!240 l!812) e!29584)))

