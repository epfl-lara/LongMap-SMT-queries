; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87496 () Bool)

(assert start!87496)

(declare-fun res!680331 () Bool)

(declare-fun e!569977 () Bool)

(assert (=> start!87496 (=> (not res!680331) (not e!569977))))

(declare-datatypes ((B!1398 0))(
  ( (B!1399 (val!11783 Int)) )
))
(declare-datatypes ((tuple2!15112 0))(
  ( (tuple2!15113 (_1!7567 (_ BitVec 64)) (_2!7567 B!1398)) )
))
(declare-datatypes ((List!21402 0))(
  ( (Nil!21399) (Cons!21398 (h!22596 tuple2!15112) (t!30403 List!21402)) )
))
(declare-fun l!412 () List!21402)

(declare-fun isStrictlySorted!557 (List!21402) Bool)

(assert (=> start!87496 (= res!680331 (isStrictlySorted!557 l!412))))

(assert (=> start!87496 e!569977))

(declare-fun e!569976 () Bool)

(assert (=> start!87496 e!569976))

(declare-fun tp_is_empty!23465 () Bool)

(assert (=> start!87496 tp_is_empty!23465))

(declare-fun b!1013223 () Bool)

(declare-fun res!680330 () Bool)

(assert (=> b!1013223 (=> (not res!680330) (not e!569977))))

(declare-fun value!115 () B!1398)

(assert (=> b!1013223 (= res!680330 (and (is-Cons!21398 l!412) (= (_2!7567 (h!22596 l!412)) value!115)))))

(declare-fun b!1013224 () Bool)

(declare-fun ListPrimitiveSize!102 (List!21402) Int)

(assert (=> b!1013224 (= e!569977 (>= (ListPrimitiveSize!102 (t!30403 l!412)) (ListPrimitiveSize!102 l!412)))))

(declare-fun b!1013225 () Bool)

(declare-fun tp!70415 () Bool)

(assert (=> b!1013225 (= e!569976 (and tp_is_empty!23465 tp!70415))))

(assert (= (and start!87496 res!680331) b!1013223))

(assert (= (and b!1013223 res!680330) b!1013224))

(assert (= (and start!87496 (is-Cons!21398 l!412)) b!1013225))

(declare-fun m!936339 () Bool)

(assert (=> start!87496 m!936339))

(declare-fun m!936341 () Bool)

(assert (=> b!1013224 m!936341))

(declare-fun m!936343 () Bool)

(assert (=> b!1013224 m!936343))

(push 1)

(assert (not b!1013224))

(assert (not start!87496))

(assert (not b!1013225))

(assert tp_is_empty!23465)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120411 () Bool)

(declare-fun lt!447892 () Int)

(assert (=> d!120411 (>= lt!447892 0)))

(declare-fun e!569987 () Int)

(assert (=> d!120411 (= lt!447892 e!569987)))

(declare-fun c!102421 () Bool)

(assert (=> d!120411 (= c!102421 (is-Nil!21399 (t!30403 l!412)))))

(assert (=> d!120411 (= (ListPrimitiveSize!102 (t!30403 l!412)) lt!447892)))

(declare-fun b!1013244 () Bool)

(assert (=> b!1013244 (= e!569987 0)))

(declare-fun b!1013245 () Bool)

(assert (=> b!1013245 (= e!569987 (+ 1 (ListPrimitiveSize!102 (t!30403 (t!30403 l!412)))))))

(assert (= (and d!120411 c!102421) b!1013244))

(assert (= (and d!120411 (not c!102421)) b!1013245))

(declare-fun m!936349 () Bool)

(assert (=> b!1013245 m!936349))

(assert (=> b!1013224 d!120411))

(declare-fun d!120419 () Bool)

(declare-fun lt!447894 () Int)

(assert (=> d!120419 (>= lt!447894 0)))

(declare-fun e!569993 () Int)

(assert (=> d!120419 (= lt!447894 e!569993)))

(declare-fun c!102423 () Bool)

(assert (=> d!120419 (= c!102423 (is-Nil!21399 l!412))))

(assert (=> d!120419 (= (ListPrimitiveSize!102 l!412) lt!447894)))

(declare-fun b!1013252 () Bool)

(assert (=> b!1013252 (= e!569993 0)))

(declare-fun b!1013253 () Bool)

(assert (=> b!1013253 (= e!569993 (+ 1 (ListPrimitiveSize!102 (t!30403 l!412))))))

(assert (= (and d!120419 c!102423) b!1013252))

(assert (= (and d!120419 (not c!102423)) b!1013253))

(assert (=> b!1013253 m!936341))

(assert (=> b!1013224 d!120419))

(declare-fun d!120423 () Bool)

(declare-fun res!680346 () Bool)

(declare-fun e!570007 () Bool)

(assert (=> d!120423 (=> res!680346 e!570007)))

(assert (=> d!120423 (= res!680346 (or (is-Nil!21399 l!412) (is-Nil!21399 (t!30403 l!412))))))

(assert (=> d!120423 (= (isStrictlySorted!557 l!412) e!570007)))

(declare-fun b!1013269 () Bool)

(declare-fun e!570008 () Bool)

(assert (=> b!1013269 (= e!570007 e!570008)))

(declare-fun res!680347 () Bool)

(assert (=> b!1013269 (=> (not res!680347) (not e!570008))))

(assert (=> b!1013269 (= res!680347 (bvslt (_1!7567 (h!22596 l!412)) (_1!7567 (h!22596 (t!30403 l!412)))))))

(declare-fun b!1013270 () Bool)

(assert (=> b!1013270 (= e!570008 (isStrictlySorted!557 (t!30403 l!412)))))

(assert (= (and d!120423 (not res!680346)) b!1013269))

(assert (= (and b!1013269 res!680347) b!1013270))

(declare-fun m!936353 () Bool)

(assert (=> b!1013270 m!936353))

(assert (=> start!87496 d!120423))

(declare-fun b!1013281 () Bool)

(declare-fun e!570015 () Bool)

(declare-fun tp!70423 () Bool)

(assert (=> b!1013281 (= e!570015 (and tp_is_empty!23465 tp!70423))))

(assert (=> b!1013225 (= tp!70415 e!570015)))

(assert (= (and b!1013225 (is-Cons!21398 (t!30403 l!412))) b!1013281))

(push 1)

