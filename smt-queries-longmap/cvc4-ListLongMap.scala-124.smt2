; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2134 () Bool)

(assert start!2134)

(declare-fun res!11134 () Bool)

(declare-fun e!8600 () Bool)

(assert (=> start!2134 (=> (not res!11134) (not e!8600))))

(declare-datatypes ((B!546 0))(
  ( (B!547 (val!371 Int)) )
))
(declare-datatypes ((tuple2!542 0))(
  ( (tuple2!543 (_1!271 (_ BitVec 64)) (_2!271 B!546)) )
))
(declare-datatypes ((List!426 0))(
  ( (Nil!423) (Cons!422 (h!988 tuple2!542) (t!2825 List!426)) )
))
(declare-fun l!522 () List!426)

(declare-fun isStrictlySorted!113 (List!426) Bool)

(assert (=> start!2134 (= res!11134 (isStrictlySorted!113 l!522))))

(assert (=> start!2134 e!8600))

(declare-fun e!8599 () Bool)

(assert (=> start!2134 e!8599))

(declare-fun tp_is_empty!725 () Bool)

(assert (=> start!2134 tp_is_empty!725))

(declare-fun b!14367 () Bool)

(declare-fun res!11133 () Bool)

(assert (=> b!14367 (=> (not res!11133) (not e!8600))))

(declare-fun value!159 () B!546)

(assert (=> b!14367 (= res!11133 (and (not (= (_2!271 (h!988 l!522)) value!159)) (is-Cons!422 l!522)))))

(declare-fun b!14368 () Bool)

(declare-fun ListPrimitiveSize!27 (List!426) Int)

(assert (=> b!14368 (= e!8600 (>= (ListPrimitiveSize!27 (t!2825 l!522)) (ListPrimitiveSize!27 l!522)))))

(declare-fun b!14369 () Bool)

(declare-fun tp!2330 () Bool)

(assert (=> b!14369 (= e!8599 (and tp_is_empty!725 tp!2330))))

(assert (= (and start!2134 res!11134) b!14367))

(assert (= (and b!14367 res!11133) b!14368))

(assert (= (and start!2134 (is-Cons!422 l!522)) b!14369))

(declare-fun m!9623 () Bool)

(assert (=> start!2134 m!9623))

(declare-fun m!9625 () Bool)

(assert (=> b!14368 m!9625))

(declare-fun m!9627 () Bool)

(assert (=> b!14368 m!9627))

(push 1)

(assert (not start!2134))

(assert (not b!14368))

(assert (not b!14369))

(assert tp_is_empty!725)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2245 () Bool)

(declare-fun res!11148 () Bool)

(declare-fun e!8614 () Bool)

(assert (=> d!2245 (=> res!11148 e!8614)))

(assert (=> d!2245 (= res!11148 (or (is-Nil!423 l!522) (is-Nil!423 (t!2825 l!522))))))

(assert (=> d!2245 (= (isStrictlySorted!113 l!522) e!8614)))

(declare-fun b!14382 () Bool)

(declare-fun e!8616 () Bool)

(assert (=> b!14382 (= e!8614 e!8616)))

(declare-fun res!11150 () Bool)

(assert (=> b!14382 (=> (not res!11150) (not e!8616))))

(assert (=> b!14382 (= res!11150 (bvslt (_1!271 (h!988 l!522)) (_1!271 (h!988 (t!2825 l!522)))))))

(declare-fun b!14383 () Bool)

(assert (=> b!14383 (= e!8616 (isStrictlySorted!113 (t!2825 l!522)))))

(assert (= (and d!2245 (not res!11148)) b!14382))

(assert (= (and b!14382 res!11150) b!14383))

(declare-fun m!9633 () Bool)

(assert (=> b!14383 m!9633))

(assert (=> start!2134 d!2245))

(declare-fun d!2251 () Bool)

(declare-fun lt!3603 () Int)

(assert (=> d!2251 (>= lt!3603 0)))

(declare-fun e!8627 () Int)

(assert (=> d!2251 (= lt!3603 e!8627)))

(declare-fun c!1343 () Bool)

(assert (=> d!2251 (= c!1343 (is-Nil!423 (t!2825 l!522)))))

(assert (=> d!2251 (= (ListPrimitiveSize!27 (t!2825 l!522)) lt!3603)))

(declare-fun b!14404 () Bool)

(assert (=> b!14404 (= e!8627 0)))

(declare-fun b!14405 () Bool)

(assert (=> b!14405 (= e!8627 (+ 1 (ListPrimitiveSize!27 (t!2825 (t!2825 l!522)))))))

(assert (= (and d!2251 c!1343) b!14404))

(assert (= (and d!2251 (not c!1343)) b!14405))

(declare-fun m!9639 () Bool)

(assert (=> b!14405 m!9639))

(assert (=> b!14368 d!2251))

(declare-fun d!2257 () Bool)

(declare-fun lt!3606 () Int)

(assert (=> d!2257 (>= lt!3606 0)))

(declare-fun e!8630 () Int)

(assert (=> d!2257 (= lt!3606 e!8630)))

(declare-fun c!1346 () Bool)

(assert (=> d!2257 (= c!1346 (is-Nil!423 l!522))))

(assert (=> d!2257 (= (ListPrimitiveSize!27 l!522) lt!3606)))

(declare-fun b!14410 () Bool)

(assert (=> b!14410 (= e!8630 0)))

(declare-fun b!14411 () Bool)

(assert (=> b!14411 (= e!8630 (+ 1 (ListPrimitiveSize!27 (t!2825 l!522))))))

(assert (= (and d!2257 c!1346) b!14410))

(assert (= (and d!2257 (not c!1346)) b!14411))

(assert (=> b!14411 m!9625))

(assert (=> b!14368 d!2257))

(declare-fun b!14426 () Bool)

(declare-fun e!8639 () Bool)

(declare-fun tp!2339 () Bool)

(assert (=> b!14426 (= e!8639 (and tp_is_empty!725 tp!2339))))

(assert (=> b!14369 (= tp!2330 e!8639)))

(assert (= (and b!14369 (is-Cons!422 (t!2825 l!522))) b!14426))

(push 1)

