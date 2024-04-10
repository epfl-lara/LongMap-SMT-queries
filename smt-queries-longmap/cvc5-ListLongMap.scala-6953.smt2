; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87684 () Bool)

(assert start!87684)

(declare-fun res!680714 () Bool)

(declare-fun e!570574 () Bool)

(assert (=> start!87684 (=> (not res!680714) (not e!570574))))

(declare-datatypes ((B!1424 0))(
  ( (B!1425 (val!11796 Int)) )
))
(declare-datatypes ((tuple2!15138 0))(
  ( (tuple2!15139 (_1!7580 (_ BitVec 64)) (_2!7580 B!1424)) )
))
(declare-datatypes ((List!21427 0))(
  ( (Nil!21424) (Cons!21423 (h!22621 tuple2!15138) (t!30428 List!21427)) )
))
(declare-fun l!412 () List!21427)

(declare-fun isStrictlySorted!570 (List!21427) Bool)

(assert (=> start!87684 (= res!680714 (isStrictlySorted!570 l!412))))

(assert (=> start!87684 e!570574))

(declare-fun e!570573 () Bool)

(assert (=> start!87684 e!570573))

(declare-fun tp_is_empty!23491 () Bool)

(assert (=> start!87684 tp_is_empty!23491))

(declare-fun b!1014264 () Bool)

(declare-fun res!680715 () Bool)

(assert (=> b!1014264 (=> (not res!680715) (not e!570574))))

(declare-fun value!115 () B!1424)

(assert (=> b!1014264 (= res!680715 (and (not (= (_2!7580 (h!22621 l!412)) value!115)) (is-Cons!21423 l!412)))))

(declare-fun b!1014265 () Bool)

(declare-fun ListPrimitiveSize!109 (List!21427) Int)

(assert (=> b!1014265 (= e!570574 (>= (ListPrimitiveSize!109 (t!30428 l!412)) (ListPrimitiveSize!109 l!412)))))

(declare-fun b!1014266 () Bool)

(declare-fun tp!70502 () Bool)

(assert (=> b!1014266 (= e!570573 (and tp_is_empty!23491 tp!70502))))

(assert (= (and start!87684 res!680714) b!1014264))

(assert (= (and b!1014264 res!680715) b!1014265))

(assert (= (and start!87684 (is-Cons!21423 l!412)) b!1014266))

(declare-fun m!936981 () Bool)

(assert (=> start!87684 m!936981))

(declare-fun m!936983 () Bool)

(assert (=> b!1014265 m!936983))

(declare-fun m!936985 () Bool)

(assert (=> b!1014265 m!936985))

(push 1)

(assert (not start!87684))

(assert (not b!1014265))

(assert (not b!1014266))

(assert tp_is_empty!23491)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120731 () Bool)

(declare-fun res!680740 () Bool)

(declare-fun e!570599 () Bool)

(assert (=> d!120731 (=> res!680740 e!570599)))

(assert (=> d!120731 (= res!680740 (or (is-Nil!21424 l!412) (is-Nil!21424 (t!30428 l!412))))))

(assert (=> d!120731 (= (isStrictlySorted!570 l!412) e!570599)))

(declare-fun b!1014297 () Bool)

(declare-fun e!570600 () Bool)

(assert (=> b!1014297 (= e!570599 e!570600)))

(declare-fun res!680741 () Bool)

(assert (=> b!1014297 (=> (not res!680741) (not e!570600))))

(assert (=> b!1014297 (= res!680741 (bvslt (_1!7580 (h!22621 l!412)) (_1!7580 (h!22621 (t!30428 l!412)))))))

(declare-fun b!1014298 () Bool)

(assert (=> b!1014298 (= e!570600 (isStrictlySorted!570 (t!30428 l!412)))))

(assert (= (and d!120731 (not res!680740)) b!1014297))

(assert (= (and b!1014297 res!680741) b!1014298))

(declare-fun m!936999 () Bool)

(assert (=> b!1014298 m!936999))

(assert (=> start!87684 d!120731))

(declare-fun d!120735 () Bool)

(declare-fun lt!448477 () Int)

(assert (=> d!120735 (>= lt!448477 0)))

(declare-fun e!570611 () Int)

(assert (=> d!120735 (= lt!448477 e!570611)))

(declare-fun c!102652 () Bool)

(assert (=> d!120735 (= c!102652 (is-Nil!21424 (t!30428 l!412)))))

(assert (=> d!120735 (= (ListPrimitiveSize!109 (t!30428 l!412)) lt!448477)))

(declare-fun b!1014315 () Bool)

(assert (=> b!1014315 (= e!570611 0)))

(declare-fun b!1014316 () Bool)

(assert (=> b!1014316 (= e!570611 (+ 1 (ListPrimitiveSize!109 (t!30428 (t!30428 l!412)))))))

(assert (= (and d!120735 c!102652) b!1014315))

(assert (= (and d!120735 (not c!102652)) b!1014316))

(declare-fun m!937005 () Bool)

(assert (=> b!1014316 m!937005))

(assert (=> b!1014265 d!120735))

(declare-fun d!120741 () Bool)

(declare-fun lt!448478 () Int)

(assert (=> d!120741 (>= lt!448478 0)))

(declare-fun e!570612 () Int)

(assert (=> d!120741 (= lt!448478 e!570612)))

(declare-fun c!102653 () Bool)

(assert (=> d!120741 (= c!102653 (is-Nil!21424 l!412))))

(assert (=> d!120741 (= (ListPrimitiveSize!109 l!412) lt!448478)))

(declare-fun b!1014317 () Bool)

(assert (=> b!1014317 (= e!570612 0)))

(declare-fun b!1014318 () Bool)

(assert (=> b!1014318 (= e!570612 (+ 1 (ListPrimitiveSize!109 (t!30428 l!412))))))

(assert (= (and d!120741 c!102653) b!1014317))

(assert (= (and d!120741 (not c!102653)) b!1014318))

(assert (=> b!1014318 m!936983))

(assert (=> b!1014265 d!120741))

(declare-fun b!1014329 () Bool)

(declare-fun e!570618 () Bool)

(declare-fun tp!70511 () Bool)

(assert (=> b!1014329 (= e!570618 (and tp_is_empty!23491 tp!70511))))

(assert (=> b!1014266 (= tp!70502 e!570618)))

(assert (= (and b!1014266 (is-Cons!21423 (t!30428 l!412))) b!1014329))

(push 1)

