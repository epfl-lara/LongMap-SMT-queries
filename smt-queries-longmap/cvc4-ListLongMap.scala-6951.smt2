; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87586 () Bool)

(assert start!87586)

(declare-fun b!1013725 () Bool)

(assert (=> b!1013725 true))

(assert (=> b!1013725 true))

(declare-fun b!1013724 () Bool)

(declare-fun e!570259 () Bool)

(declare-datatypes ((B!1416 0))(
  ( (B!1417 (val!11792 Int)) )
))
(declare-datatypes ((tuple2!15130 0))(
  ( (tuple2!15131 (_1!7576 (_ BitVec 64)) (_2!7576 B!1416)) )
))
(declare-datatypes ((List!21419 0))(
  ( (Nil!21416) (Cons!21415 (h!22613 tuple2!15130) (t!30420 List!21419)) )
))
(declare-fun l!412 () List!21419)

(declare-fun ListPrimitiveSize!108 (List!21419) Int)

(assert (=> b!1013724 (= e!570259 (>= (ListPrimitiveSize!108 (t!30420 l!412)) (ListPrimitiveSize!108 l!412)))))

(declare-datatypes ((Unit!33140 0))(
  ( (Unit!33141) )
))
(declare-fun lt!448158 () Unit!33140)

(declare-fun e!570258 () Unit!33140)

(assert (=> b!1013724 (= lt!448158 e!570258)))

(declare-fun c!102516 () Bool)

(declare-datatypes ((List!21420 0))(
  ( (Nil!21417) (Cons!21416 (h!22614 (_ BitVec 64)) (t!30421 List!21420)) )
))
(declare-fun lt!448156 () List!21420)

(declare-fun isEmpty!824 (List!21420) Bool)

(assert (=> b!1013724 (= c!102516 (not (isEmpty!824 lt!448156)))))

(declare-fun value!115 () B!1416)

(declare-fun getKeysOf!42 (List!21419 B!1416) List!21420)

(assert (=> b!1013724 (= lt!448156 (getKeysOf!42 (t!30420 l!412) value!115))))

(declare-fun res!680507 () Bool)

(assert (=> start!87586 (=> (not res!680507) (not e!570259))))

(declare-fun isStrictlySorted!566 (List!21419) Bool)

(assert (=> start!87586 (= res!680507 (isStrictlySorted!566 l!412))))

(assert (=> start!87586 e!570259))

(declare-fun e!570257 () Bool)

(assert (=> start!87586 e!570257))

(declare-fun tp_is_empty!23483 () Bool)

(assert (=> start!87586 tp_is_empty!23483))

(declare-fun lt!448157 () Unit!33140)

(assert (=> b!1013725 (= e!570258 lt!448157)))

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!30 (List!21419 List!21420 B!1416 tuple2!15130) Unit!33140)

(assert (=> b!1013725 (= lt!448157 (lemmaForallGetValueByKeySameWithASmallerHead!30 (t!30420 l!412) lt!448156 value!115 (h!22613 l!412)))))

(declare-fun lambda!551 () Int)

(declare-fun forall!235 (List!21420 Int) Bool)

(assert (=> b!1013725 (forall!235 lt!448156 lambda!551)))

(declare-fun b!1013726 () Bool)

(declare-fun res!680508 () Bool)

(assert (=> b!1013726 (=> (not res!680508) (not e!570259))))

(assert (=> b!1013726 (= res!680508 (and (is-Cons!21415 l!412) (= (_2!7576 (h!22613 l!412)) value!115)))))

(declare-fun b!1013727 () Bool)

(declare-fun tp!70469 () Bool)

(assert (=> b!1013727 (= e!570257 (and tp_is_empty!23483 tp!70469))))

(declare-fun b!1013728 () Bool)

(declare-fun Unit!33142 () Unit!33140)

(assert (=> b!1013728 (= e!570258 Unit!33142)))

(assert (= (and start!87586 res!680507) b!1013726))

(assert (= (and b!1013726 res!680508) b!1013724))

(assert (= (and b!1013724 c!102516) b!1013725))

(assert (= (and b!1013724 (not c!102516)) b!1013728))

(assert (= (and start!87586 (is-Cons!21415 l!412)) b!1013727))

(declare-fun m!936553 () Bool)

(assert (=> b!1013724 m!936553))

(declare-fun m!936555 () Bool)

(assert (=> b!1013724 m!936555))

(declare-fun m!936557 () Bool)

(assert (=> b!1013724 m!936557))

(declare-fun m!936559 () Bool)

(assert (=> b!1013724 m!936559))

(declare-fun m!936561 () Bool)

(assert (=> start!87586 m!936561))

(declare-fun m!936563 () Bool)

(assert (=> b!1013725 m!936563))

(declare-fun m!936565 () Bool)

(assert (=> b!1013725 m!936565))

(push 1)

(assert (not b!1013727))

(assert (not start!87586))

(assert (not b!1013725))

(assert (not b!1013724))

(assert tp_is_empty!23483)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bs!28953 () Bool)

(declare-fun b!1013795 () Bool)

(assert (= bs!28953 (and b!1013795 b!1013725)))

(declare-fun lambda!568 () Int)

(assert (=> bs!28953 (= (= (t!30420 l!412) l!412) (= lambda!568 lambda!551))))

(assert (=> b!1013795 true))

(assert (=> b!1013795 true))

(declare-fun bs!28954 () Bool)

(declare-fun d!120523 () Bool)

(assert (= bs!28954 (and d!120523 b!1013725)))

(declare-fun lambda!569 () Int)

(assert (=> bs!28954 (= (= (Cons!21415 (h!22613 l!412) (t!30420 l!412)) l!412) (= lambda!569 lambda!551))))

(declare-fun bs!28955 () Bool)

(assert (= bs!28955 (and d!120523 b!1013795)))

(assert (=> bs!28955 (= (= (Cons!21415 (h!22613 l!412) (t!30420 l!412)) (t!30420 l!412)) (= lambda!569 lambda!568))))

(assert (=> d!120523 true))

(assert (=> d!120523 true))

(assert (=> d!120523 true))

(assert (=> d!120523 (forall!235 lt!448156 lambda!569)))

(declare-fun lt!448196 () Unit!33140)

(declare-fun choose!1631 (List!21419 List!21420 B!1416 tuple2!15130) Unit!33140)

(assert (=> d!120523 (= lt!448196 (choose!1631 (t!30420 l!412) lt!448156 value!115 (h!22613 l!412)))))

(declare-fun e!570293 () Bool)

(assert (=> d!120523 e!570293))

(declare-fun res!680538 () Bool)

(assert (=> d!120523 (=> (not res!680538) (not e!570293))))

(assert (=> d!120523 (= res!680538 (isStrictlySorted!566 (t!30420 l!412)))))

(assert (=> d!120523 (= (lemmaForallGetValueByKeySameWithASmallerHead!30 (t!30420 l!412) lt!448156 value!115 (h!22613 l!412)) lt!448196)))

(declare-fun b!1013794 () Bool)

(declare-fun res!680537 () Bool)

(assert (=> b!1013794 (=> (not res!680537) (not e!570293))))

(declare-fun isEmpty!827 (List!21419) Bool)

(assert (=> b!1013794 (= res!680537 (not (isEmpty!827 (t!30420 l!412))))))

(declare-fun res!680536 () Bool)

(assert (=> b!1013795 (=> (not res!680536) (not e!570293))))

(assert (=> b!1013795 (= res!680536 (forall!235 lt!448156 lambda!568))))

(declare-fun b!1013796 () Bool)

