; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2130 () Bool)

(assert start!2130)

(declare-fun res!11122 () Bool)

(declare-fun e!8587 () Bool)

(assert (=> start!2130 (=> (not res!11122) (not e!8587))))

(declare-datatypes ((B!542 0))(
  ( (B!543 (val!369 Int)) )
))
(declare-datatypes ((tuple2!538 0))(
  ( (tuple2!539 (_1!269 (_ BitVec 64)) (_2!269 B!542)) )
))
(declare-datatypes ((List!424 0))(
  ( (Nil!421) (Cons!420 (h!986 tuple2!538) (t!2823 List!424)) )
))
(declare-fun l!522 () List!424)

(declare-fun isStrictlySorted!111 (List!424) Bool)

(assert (=> start!2130 (= res!11122 (isStrictlySorted!111 l!522))))

(assert (=> start!2130 e!8587))

(declare-fun e!8588 () Bool)

(assert (=> start!2130 e!8588))

(declare-fun tp_is_empty!721 () Bool)

(assert (=> start!2130 tp_is_empty!721))

(declare-fun b!14349 () Bool)

(declare-fun res!11121 () Bool)

(assert (=> b!14349 (=> (not res!11121) (not e!8587))))

(declare-fun value!159 () B!542)

(assert (=> b!14349 (= res!11121 (and (not (= (_2!269 (h!986 l!522)) value!159)) (is-Cons!420 l!522)))))

(declare-fun b!14350 () Bool)

(declare-fun ListPrimitiveSize!25 (List!424) Int)

(assert (=> b!14350 (= e!8587 (>= (ListPrimitiveSize!25 (t!2823 l!522)) (ListPrimitiveSize!25 l!522)))))

(declare-fun b!14351 () Bool)

(declare-fun tp!2324 () Bool)

(assert (=> b!14351 (= e!8588 (and tp_is_empty!721 tp!2324))))

(assert (= (and start!2130 res!11122) b!14349))

(assert (= (and b!14349 res!11121) b!14350))

(assert (= (and start!2130 (is-Cons!420 l!522)) b!14351))

(declare-fun m!9611 () Bool)

(assert (=> start!2130 m!9611))

(declare-fun m!9613 () Bool)

(assert (=> b!14350 m!9613))

(declare-fun m!9615 () Bool)

(assert (=> b!14350 m!9615))

(push 1)

(assert (not start!2130))

(assert (not b!14350))

(assert (not b!14351))

(assert tp_is_empty!721)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2243 () Bool)

(declare-fun res!11147 () Bool)

(declare-fun e!8613 () Bool)

(assert (=> d!2243 (=> res!11147 e!8613)))

(assert (=> d!2243 (= res!11147 (or (is-Nil!421 l!522) (is-Nil!421 (t!2823 l!522))))))

(assert (=> d!2243 (= (isStrictlySorted!111 l!522) e!8613)))

(declare-fun b!14384 () Bool)

(declare-fun e!8615 () Bool)

(assert (=> b!14384 (= e!8613 e!8615)))

(declare-fun res!11149 () Bool)

(assert (=> b!14384 (=> (not res!11149) (not e!8615))))

(assert (=> b!14384 (= res!11149 (bvslt (_1!269 (h!986 l!522)) (_1!269 (h!986 (t!2823 l!522)))))))

(declare-fun b!14385 () Bool)

(assert (=> b!14385 (= e!8615 (isStrictlySorted!111 (t!2823 l!522)))))

(assert (= (and d!2243 (not res!11147)) b!14384))

(assert (= (and b!14384 res!11149) b!14385))

(declare-fun m!9629 () Bool)

(assert (=> b!14385 m!9629))

(assert (=> start!2130 d!2243))

(declare-fun d!2248 () Bool)

(declare-fun lt!3602 () Int)

(assert (=> d!2248 (>= lt!3602 0)))

(declare-fun e!8626 () Int)

(assert (=> d!2248 (= lt!3602 e!8626)))

(declare-fun c!1342 () Bool)

(assert (=> d!2248 (= c!1342 (is-Nil!421 (t!2823 l!522)))))

(assert (=> d!2248 (= (ListPrimitiveSize!25 (t!2823 l!522)) lt!3602)))

(declare-fun b!14402 () Bool)

(assert (=> b!14402 (= e!8626 0)))

(declare-fun b!14403 () Bool)

(assert (=> b!14403 (= e!8626 (+ 1 (ListPrimitiveSize!25 (t!2823 (t!2823 l!522)))))))

(assert (= (and d!2248 c!1342) b!14402))

(assert (= (and d!2248 (not c!1342)) b!14403))

(declare-fun m!9637 () Bool)

(assert (=> b!14403 m!9637))

(assert (=> b!14350 d!2248))

(declare-fun d!2255 () Bool)

(declare-fun lt!3605 () Int)

(assert (=> d!2255 (>= lt!3605 0)))

(declare-fun e!8629 () Int)

(assert (=> d!2255 (= lt!3605 e!8629)))

(declare-fun c!1345 () Bool)

(assert (=> d!2255 (= c!1345 (is-Nil!421 l!522))))

(assert (=> d!2255 (= (ListPrimitiveSize!25 l!522) lt!3605)))

(declare-fun b!14408 () Bool)

(assert (=> b!14408 (= e!8629 0)))

(declare-fun b!14409 () Bool)

(assert (=> b!14409 (= e!8629 (+ 1 (ListPrimitiveSize!25 (t!2823 l!522))))))

(assert (= (and d!2255 c!1345) b!14408))

(assert (= (and d!2255 (not c!1345)) b!14409))

(assert (=> b!14409 m!9613))

(assert (=> b!14350 d!2255))

(declare-fun b!14424 () Bool)

(declare-fun e!8637 () Bool)

(declare-fun tp!2337 () Bool)

(assert (=> b!14424 (= e!8637 (and tp_is_empty!721 tp!2337))))

(assert (=> b!14351 (= tp!2324 e!8637)))

(assert (= (and b!14351 (is-Cons!420 (t!2823 l!522))) b!14424))

(push 1)

(assert (not b!14385))

(assert (not b!14424))

(assert (not b!14403))

(assert tp_is_empty!721)

(assert (not b!14409))

(check-sat)

