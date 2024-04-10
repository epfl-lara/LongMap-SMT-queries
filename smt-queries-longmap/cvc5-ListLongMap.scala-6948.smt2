; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87492 () Bool)

(assert start!87492)

(declare-fun res!680319 () Bool)

(declare-fun e!569965 () Bool)

(assert (=> start!87492 (=> (not res!680319) (not e!569965))))

(declare-datatypes ((B!1394 0))(
  ( (B!1395 (val!11781 Int)) )
))
(declare-datatypes ((tuple2!15108 0))(
  ( (tuple2!15109 (_1!7565 (_ BitVec 64)) (_2!7565 B!1394)) )
))
(declare-datatypes ((List!21400 0))(
  ( (Nil!21397) (Cons!21396 (h!22594 tuple2!15108) (t!30401 List!21400)) )
))
(declare-fun l!412 () List!21400)

(declare-fun isStrictlySorted!555 (List!21400) Bool)

(assert (=> start!87492 (= res!680319 (isStrictlySorted!555 l!412))))

(assert (=> start!87492 e!569965))

(declare-fun e!569964 () Bool)

(assert (=> start!87492 e!569964))

(declare-fun tp_is_empty!23461 () Bool)

(assert (=> start!87492 tp_is_empty!23461))

(declare-fun b!1013205 () Bool)

(declare-fun res!680318 () Bool)

(assert (=> b!1013205 (=> (not res!680318) (not e!569965))))

(declare-fun value!115 () B!1394)

(assert (=> b!1013205 (= res!680318 (and (is-Cons!21396 l!412) (= (_2!7565 (h!22594 l!412)) value!115)))))

(declare-fun b!1013206 () Bool)

(declare-fun ListPrimitiveSize!100 (List!21400) Int)

(assert (=> b!1013206 (= e!569965 (>= (ListPrimitiveSize!100 (t!30401 l!412)) (ListPrimitiveSize!100 l!412)))))

(declare-fun b!1013207 () Bool)

(declare-fun tp!70409 () Bool)

(assert (=> b!1013207 (= e!569964 (and tp_is_empty!23461 tp!70409))))

(assert (= (and start!87492 res!680319) b!1013205))

(assert (= (and b!1013205 res!680318) b!1013206))

(assert (= (and start!87492 (is-Cons!21396 l!412)) b!1013207))

(declare-fun m!936327 () Bool)

(assert (=> start!87492 m!936327))

(declare-fun m!936329 () Bool)

(assert (=> b!1013206 m!936329))

(declare-fun m!936331 () Bool)

(assert (=> b!1013206 m!936331))

(push 1)

(assert (not b!1013206))

(assert (not start!87492))

(assert (not b!1013207))

(assert tp_is_empty!23461)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120407 () Bool)

(declare-fun lt!447887 () Int)

(assert (=> d!120407 (>= lt!447887 0)))

(declare-fun e!569982 () Int)

(assert (=> d!120407 (= lt!447887 e!569982)))

(declare-fun c!102416 () Bool)

(assert (=> d!120407 (= c!102416 (is-Nil!21397 (t!30401 l!412)))))

(assert (=> d!120407 (= (ListPrimitiveSize!100 (t!30401 l!412)) lt!447887)))

(declare-fun b!1013234 () Bool)

(assert (=> b!1013234 (= e!569982 0)))

(declare-fun b!1013235 () Bool)

(assert (=> b!1013235 (= e!569982 (+ 1 (ListPrimitiveSize!100 (t!30401 (t!30401 l!412)))))))

(assert (= (and d!120407 c!102416) b!1013234))

(assert (= (and d!120407 (not c!102416)) b!1013235))

(declare-fun m!936345 () Bool)

(assert (=> b!1013235 m!936345))

(assert (=> b!1013206 d!120407))

(declare-fun d!120413 () Bool)

(declare-fun lt!447890 () Int)

(assert (=> d!120413 (>= lt!447890 0)))

(declare-fun e!569983 () Int)

(assert (=> d!120413 (= lt!447890 e!569983)))

(declare-fun c!102417 () Bool)

(assert (=> d!120413 (= c!102417 (is-Nil!21397 l!412))))

(assert (=> d!120413 (= (ListPrimitiveSize!100 l!412) lt!447890)))

(declare-fun b!1013238 () Bool)

(assert (=> b!1013238 (= e!569983 0)))

(declare-fun b!1013239 () Bool)

(assert (=> b!1013239 (= e!569983 (+ 1 (ListPrimitiveSize!100 (t!30401 l!412))))))

(assert (= (and d!120413 c!102417) b!1013238))

(assert (= (and d!120413 (not c!102417)) b!1013239))

(assert (=> b!1013239 m!936329))

(assert (=> b!1013206 d!120413))

(declare-fun d!120415 () Bool)

(declare-fun res!680336 () Bool)

(declare-fun e!569994 () Bool)

(assert (=> d!120415 (=> res!680336 e!569994)))

(assert (=> d!120415 (= res!680336 (or (is-Nil!21397 l!412) (is-Nil!21397 (t!30401 l!412))))))

(assert (=> d!120415 (= (isStrictlySorted!555 l!412) e!569994)))

(declare-fun b!1013254 () Bool)

(declare-fun e!569995 () Bool)

(assert (=> b!1013254 (= e!569994 e!569995)))

(declare-fun res!680337 () Bool)

(assert (=> b!1013254 (=> (not res!680337) (not e!569995))))

(assert (=> b!1013254 (= res!680337 (bvslt (_1!7565 (h!22594 l!412)) (_1!7565 (h!22594 (t!30401 l!412)))))))

(declare-fun b!1013255 () Bool)

(assert (=> b!1013255 (= e!569995 (isStrictlySorted!555 (t!30401 l!412)))))

(assert (= (and d!120415 (not res!680336)) b!1013254))

(assert (= (and b!1013254 res!680337) b!1013255))

(declare-fun m!936351 () Bool)

(assert (=> b!1013255 m!936351))

(assert (=> start!87492 d!120415))

(declare-fun b!1013260 () Bool)

(declare-fun e!569998 () Bool)

(declare-fun tp!70418 () Bool)

(assert (=> b!1013260 (= e!569998 (and tp_is_empty!23461 tp!70418))))

(assert (=> b!1013207 (= tp!70409 e!569998)))

(assert (= (and b!1013207 (is-Cons!21396 (t!30401 l!412))) b!1013260))

(push 1)

(assert (not b!1013235))

(assert (not b!1013239))

(assert (not b!1013255))

(assert tp_is_empty!23461)

(assert (not b!1013260))

(check-sat)

(pop 1)

