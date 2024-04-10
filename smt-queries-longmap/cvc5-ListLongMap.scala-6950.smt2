; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87540 () Bool)

(assert start!87540)

(declare-fun b!1013483 () Bool)

(assert (=> b!1013483 true))

(assert (=> b!1013483 true))

(declare-fun b!1013480 () Bool)

(declare-fun res!680411 () Bool)

(declare-fun e!570119 () Bool)

(assert (=> b!1013480 (=> res!680411 e!570119)))

(declare-datatypes ((B!1406 0))(
  ( (B!1407 (val!11787 Int)) )
))
(declare-datatypes ((tuple2!15120 0))(
  ( (tuple2!15121 (_1!7571 (_ BitVec 64)) (_2!7571 B!1406)) )
))
(declare-datatypes ((List!21409 0))(
  ( (Nil!21406) (Cons!21405 (h!22603 tuple2!15120) (t!30410 List!21409)) )
))
(declare-fun l!412 () List!21409)

(declare-fun isEmpty!816 (List!21409) Bool)

(assert (=> b!1013480 (= res!680411 (isEmpty!816 (t!30410 l!412)))))

(declare-fun b!1013481 () Bool)

(declare-fun res!680408 () Bool)

(declare-fun e!570121 () Bool)

(assert (=> b!1013481 (=> (not res!680408) (not e!570121))))

(declare-fun value!115 () B!1406)

(assert (=> b!1013481 (= res!680408 (and (is-Cons!21405 l!412) (= (_2!7571 (h!22603 l!412)) value!115)))))

(declare-fun res!680407 () Bool)

(assert (=> start!87540 (=> (not res!680407) (not e!570121))))

(declare-fun isStrictlySorted!561 (List!21409) Bool)

(assert (=> start!87540 (= res!680407 (isStrictlySorted!561 l!412))))

(assert (=> start!87540 e!570121))

(declare-fun e!570118 () Bool)

(assert (=> start!87540 e!570118))

(declare-fun tp_is_empty!23473 () Bool)

(assert (=> start!87540 tp_is_empty!23473))

(declare-fun b!1013482 () Bool)

(declare-fun e!570120 () Bool)

(assert (=> b!1013482 (= e!570121 e!570120)))

(declare-fun res!680409 () Bool)

(assert (=> b!1013482 (=> (not res!680409) (not e!570120))))

(declare-datatypes ((List!21410 0))(
  ( (Nil!21407) (Cons!21406 (h!22604 (_ BitVec 64)) (t!30411 List!21410)) )
))
(declare-fun lt!448017 () List!21410)

(declare-fun isEmpty!817 (List!21410) Bool)

(assert (=> b!1013482 (= res!680409 (not (isEmpty!817 lt!448017)))))

(declare-fun getKeysOf!37 (List!21409 B!1406) List!21410)

(assert (=> b!1013482 (= lt!448017 (getKeysOf!37 (t!30410 l!412) value!115))))

(declare-fun res!680412 () Bool)

(assert (=> b!1013483 (=> res!680412 e!570119)))

(declare-fun lambda!509 () Int)

(declare-fun forall!230 (List!21410 Int) Bool)

(assert (=> b!1013483 (= res!680412 (not (forall!230 lt!448017 lambda!509)))))

(declare-fun b!1013484 () Bool)

(assert (=> b!1013484 (= e!570120 e!570119)))

(declare-fun res!680410 () Bool)

(assert (=> b!1013484 (=> res!680410 e!570119)))

(assert (=> b!1013484 (= res!680410 (not (isStrictlySorted!561 (t!30410 l!412))))))

(declare-fun b!1013485 () Bool)

(declare-fun head!932 (List!21409) tuple2!15120)

(assert (=> b!1013485 (= e!570119 (bvsge (_1!7571 (h!22603 l!412)) (_1!7571 (head!932 (t!30410 l!412)))))))

(declare-fun b!1013486 () Bool)

(declare-fun tp!70445 () Bool)

(assert (=> b!1013486 (= e!570118 (and tp_is_empty!23473 tp!70445))))

(assert (= (and start!87540 res!680407) b!1013481))

(assert (= (and b!1013481 res!680408) b!1013482))

(assert (= (and b!1013482 res!680409) b!1013484))

(assert (= (and b!1013484 (not res!680410)) b!1013480))

(assert (= (and b!1013480 (not res!680411)) b!1013483))

(assert (= (and b!1013483 (not res!680412)) b!1013485))

(assert (= (and start!87540 (is-Cons!21405 l!412)) b!1013486))

(declare-fun m!936429 () Bool)

(assert (=> b!1013483 m!936429))

(declare-fun m!936431 () Bool)

(assert (=> b!1013480 m!936431))

(declare-fun m!936433 () Bool)

(assert (=> b!1013485 m!936433))

(declare-fun m!936435 () Bool)

(assert (=> b!1013484 m!936435))

(declare-fun m!936437 () Bool)

(assert (=> b!1013482 m!936437))

(declare-fun m!936439 () Bool)

(assert (=> b!1013482 m!936439))

(declare-fun m!936441 () Bool)

(assert (=> start!87540 m!936441))

(push 1)

(assert (not b!1013484))

(assert (not b!1013483))

(assert (not b!1013485))

(assert (not b!1013486))

(assert (not b!1013480))

(assert (not start!87540))

(assert tp_is_empty!23473)

(assert (not b!1013482))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120465 () Bool)

(declare-fun res!680465 () Bool)

(declare-fun e!570162 () Bool)

(assert (=> d!120465 (=> res!680465 e!570162)))

(assert (=> d!120465 (= res!680465 (or (is-Nil!21406 (t!30410 l!412)) (is-Nil!21406 (t!30410 (t!30410 l!412)))))))

(assert (=> d!120465 (= (isStrictlySorted!561 (t!30410 l!412)) e!570162)))

(declare-fun b!1013557 () Bool)

(declare-fun e!570163 () Bool)

(assert (=> b!1013557 (= e!570162 e!570163)))

(declare-fun res!680466 () Bool)

(assert (=> b!1013557 (=> (not res!680466) (not e!570163))))

(assert (=> b!1013557 (= res!680466 (bvslt (_1!7571 (h!22603 (t!30410 l!412))) (_1!7571 (h!22603 (t!30410 (t!30410 l!412))))))))

(declare-fun b!1013558 () Bool)

(assert (=> b!1013558 (= e!570163 (isStrictlySorted!561 (t!30410 (t!30410 l!412))))))

(assert (= (and d!120465 (not res!680465)) b!1013557))

(assert (= (and b!1013557 res!680466) b!1013558))

(declare-fun m!936475 () Bool)

(assert (=> b!1013558 m!936475))

(assert (=> b!1013484 d!120465))

(declare-fun d!120471 () Bool)

(declare-fun res!680471 () Bool)

(declare-fun e!570168 () Bool)

(assert (=> d!120471 (=> res!680471 e!570168)))

(assert (=> d!120471 (= res!680471 (is-Nil!21407 lt!448017))))

(assert (=> d!120471 (= (forall!230 lt!448017 lambda!509) e!570168)))

(declare-fun b!1013563 () Bool)

(declare-fun e!570169 () Bool)

(assert (=> b!1013563 (= e!570168 e!570169)))

(declare-fun res!680472 () Bool)

(assert (=> b!1013563 (=> (not res!680472) (not e!570169))))

(declare-fun dynLambda!1884 (Int (_ BitVec 64)) Bool)

(assert (=> b!1013563 (= res!680472 (dynLambda!1884 lambda!509 (h!22604 lt!448017)))))

(declare-fun b!1013564 () Bool)

(assert (=> b!1013564 (= e!570169 (forall!230 (t!30411 lt!448017) lambda!509))))

(assert (= (and d!120471 (not res!680471)) b!1013563))

(assert (= (and b!1013563 res!680472) b!1013564))

(declare-fun b_lambda!15255 () Bool)

(assert (=> (not b_lambda!15255) (not b!1013563)))

(declare-fun m!936477 () Bool)

(assert (=> b!1013563 m!936477))

(declare-fun m!936479 () Bool)

(assert (=> b!1013564 m!936479))

(assert (=> b!1013483 d!120471))

(declare-fun d!120473 () Bool)

(declare-fun res!680473 () Bool)

(declare-fun e!570170 () Bool)

(assert (=> d!120473 (=> res!680473 e!570170)))

(assert (=> d!120473 (= res!680473 (or (is-Nil!21406 l!412) (is-Nil!21406 (t!30410 l!412))))))

(assert (=> d!120473 (= (isStrictlySorted!561 l!412) e!570170)))

(declare-fun b!1013565 () Bool)

(declare-fun e!570171 () Bool)

(assert (=> b!1013565 (= e!570170 e!570171)))

(declare-fun res!680474 () Bool)

(assert (=> b!1013565 (=> (not res!680474) (not e!570171))))

(assert (=> b!1013565 (= res!680474 (bvslt (_1!7571 (h!22603 l!412)) (_1!7571 (h!22603 (t!30410 l!412)))))))

(declare-fun b!1013566 () Bool)

(assert (=> b!1013566 (= e!570171 (isStrictlySorted!561 (t!30410 l!412)))))

(assert (= (and d!120473 (not res!680473)) b!1013565))

(assert (= (and b!1013565 res!680474) b!1013566))

(assert (=> b!1013566 m!936435))

(assert (=> start!87540 d!120473))

(declare-fun d!120475 () Bool)

(assert (=> d!120475 (= (isEmpty!817 lt!448017) (is-Nil!21407 lt!448017))))

(assert (=> b!1013482 d!120475))

(declare-fun bs!28932 () Bool)

(declare-fun b!1013616 () Bool)

(assert (= bs!28932 (and b!1013616 b!1013483)))

(declare-fun lt!448086 () List!21409)

(declare-fun lambda!531 () Int)

(declare-fun lt!448084 () tuple2!15120)

(assert (=> bs!28932 (= (= (Cons!21405 lt!448084 lt!448086) (t!30410 l!412)) (= lambda!531 lambda!509))))

(assert (=> b!1013616 true))

(assert (=> b!1013616 true))

(assert (=> b!1013616 true))

(declare-fun bs!28934 () Bool)

(declare-fun b!1013615 () Bool)

(assert (= bs!28934 (and b!1013615 b!1013483)))

(declare-fun lt!448095 () tuple2!15120)

(declare-fun lt!448089 () List!21409)

(declare-fun lambda!532 () Int)

(assert (=> bs!28934 (= (= (Cons!21405 lt!448095 lt!448089) (t!30410 l!412)) (= lambda!532 lambda!509))))

(declare-fun bs!28935 () Bool)

(assert (= bs!28935 (and b!1013615 b!1013616)))

(assert (=> bs!28935 (= (= (Cons!21405 lt!448095 lt!448089) (Cons!21405 lt!448084 lt!448086)) (= lambda!532 lambda!531))))

(assert (=> b!1013615 true))

(assert (=> b!1013615 true))

(assert (=> b!1013615 true))

(declare-fun bs!28936 () Bool)

(declare-fun d!120477 () Bool)

(assert (= bs!28936 (and d!120477 b!1013483)))

(declare-fun lambda!533 () Int)

(assert (=> bs!28936 (= lambda!533 lambda!509)))

(declare-fun bs!28937 () Bool)

(assert (= bs!28937 (and d!120477 b!1013616)))

(assert (=> bs!28937 (= (= (t!30410 l!412) (Cons!21405 lt!448084 lt!448086)) (= lambda!533 lambda!531))))

(declare-fun bs!28938 () Bool)

(assert (= bs!28938 (and d!120477 b!1013615)))

(assert (=> bs!28938 (= (= (t!30410 l!412) (Cons!21405 lt!448095 lt!448089)) (= lambda!533 lambda!532))))

(assert (=> d!120477 true))

(assert (=> d!120477 true))

(declare-fun bm!42675 () Bool)

(declare-fun lt!448087 () List!21410)

(declare-fun lt!448090 () List!21410)

(declare-datatypes ((Unit!33126 0))(
  ( (Unit!33127) )
))
(declare-fun call!42679 () Unit!33126)

(declare-fun c!102494 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!26 (List!21409 List!21410 B!1406 tuple2!15120) Unit!33126)

(assert (=> bm!42675 (= call!42679 (lemmaForallGetValueByKeySameWithASmallerHead!26 (ite c!102494 lt!448086 lt!448089) (ite c!102494 lt!448087 lt!448090) value!115 (ite c!102494 lt!448084 lt!448095)))))

(declare-fun b!1013609 () Bool)

(declare-fun e!570195 () Unit!33126)

(declare-fun Unit!33128 () Unit!33126)

(assert (=> b!1013609 (= e!570195 Unit!33128)))

(declare-fun b!1013610 () Bool)

(declare-fun e!570194 () List!21410)

(assert (=> b!1013610 (= e!570194 Nil!21407)))

(declare-fun b!1013611 () Bool)

(declare-fun e!570192 () List!21410)

(assert (=> b!1013611 (= e!570192 e!570194)))

(declare-fun c!102492 () Bool)

(assert (=> b!1013611 (= c!102492 (and (is-Cons!21405 (t!30410 l!412)) (not (= (_2!7571 (h!22603 (t!30410 l!412))) value!115))))))

(declare-fun bm!42676 () Bool)

(declare-fun call!42678 () List!21410)

(assert (=> bm!42676 (= call!42678 (getKeysOf!37 (t!30410 (t!30410 l!412)) value!115))))

(declare-fun b!1013612 () Bool)

(declare-fun e!570193 () Unit!33126)

(declare-fun Unit!33129 () Unit!33126)

(assert (=> b!1013612 (= e!570193 Unit!33129)))

(declare-fun lt!448092 () List!21410)

(assert (=> d!120477 (forall!230 lt!448092 lambda!533)))

(assert (=> d!120477 (= lt!448092 e!570192)))

(assert (=> d!120477 (= c!102494 (and (is-Cons!21405 (t!30410 l!412)) (= (_2!7571 (h!22603 (t!30410 l!412))) value!115)))))

(assert (=> d!120477 (isStrictlySorted!561 (t!30410 l!412))))

(assert (=> d!120477 (= (getKeysOf!37 (t!30410 l!412) value!115) lt!448092)))

(declare-fun b!1013613 () Bool)

(assert (=> b!1013613 (= e!570192 (Cons!21406 (_1!7571 (h!22603 (t!30410 l!412))) call!42678))))

(declare-fun c!102495 () Bool)

(declare-fun call!42680 () Bool)

(assert (=> b!1013613 (= c!102495 (not call!42680))))

(declare-fun lt!448085 () Unit!33126)

(assert (=> b!1013613 (= lt!448085 e!570193)))

(declare-fun b!1013614 () Bool)

(declare-fun lt!448091 () Unit!33126)

(assert (=> b!1013614 (= lt!448091 e!570195)))

(declare-fun c!102493 () Bool)

(assert (=> b!1013614 (= c!102493 (not call!42680))))

(declare-fun lt!448093 () List!21410)

(assert (=> b!1013614 (= lt!448093 call!42678)))

(assert (=> b!1013614 (= e!570194 call!42678)))

(declare-fun lt!448088 () Unit!33126)

(assert (=> b!1013615 (= e!570195 lt!448088)))

(assert (=> b!1013615 (= lt!448089 (t!30410 (t!30410 l!412)))))

(assert (=> b!1013615 (= lt!448090 call!42678)))

(assert (=> b!1013615 (= lt!448095 (h!22603 (t!30410 l!412)))))

(assert (=> b!1013615 (= lt!448088 call!42679)))

(declare-fun call!42681 () Bool)

(assert (=> b!1013615 call!42681))

(assert (=> b!1013616 call!42681))

(declare-fun lt!448094 () Unit!33126)

(assert (=> b!1013616 (= lt!448094 call!42679)))

(assert (=> b!1013616 (= lt!448084 (h!22603 (t!30410 l!412)))))

(assert (=> b!1013616 (= lt!448087 call!42678)))

(assert (=> b!1013616 (= lt!448086 (t!30410 (t!30410 l!412)))))

(assert (=> b!1013616 (= e!570193 lt!448094)))

(declare-fun bm!42677 () Bool)

(assert (=> bm!42677 (= call!42681 (forall!230 (ite c!102494 lt!448087 lt!448090) (ite c!102494 lambda!531 lambda!532)))))

(declare-fun bm!42678 () Bool)

(assert (=> bm!42678 (= call!42680 (isEmpty!817 call!42678))))

(assert (= (and d!120477 c!102494) b!1013613))

(assert (= (and d!120477 (not c!102494)) b!1013611))

(assert (= (and b!1013613 c!102495) b!1013616))

(assert (= (and b!1013613 (not c!102495)) b!1013612))

(assert (= (and b!1013611 c!102492) b!1013614))

(assert (= (and b!1013611 (not c!102492)) b!1013610))

(assert (= (and b!1013614 c!102493) b!1013615))

(assert (= (and b!1013614 (not c!102493)) b!1013609))

(assert (= (or b!1013616 b!1013615) bm!42675))

(assert (= (or b!1013616 b!1013615) bm!42677))

(assert (= (or b!1013613 b!1013616 b!1013614 b!1013615) bm!42676))

(assert (= (or b!1013613 b!1013614) bm!42678))

(declare-fun m!936495 () Bool)

(assert (=> bm!42677 m!936495))

(declare-fun m!936497 () Bool)

(assert (=> bm!42678 m!936497))

(declare-fun m!936499 () Bool)

(assert (=> d!120477 m!936499))

(assert (=> d!120477 m!936435))

(declare-fun m!936501 () Bool)

(assert (=> bm!42675 m!936501))

(declare-fun m!936503 () Bool)

(assert (=> bm!42676 m!936503))

(assert (=> b!1013482 d!120477))

(declare-fun d!120491 () Bool)

(assert (=> d!120491 (= (head!932 (t!30410 l!412)) (h!22603 (t!30410 l!412)))))

(assert (=> b!1013485 d!120491))

(declare-fun d!120493 () Bool)

(assert (=> d!120493 (= (isEmpty!816 (t!30410 l!412)) (is-Nil!21406 (t!30410 l!412)))))

(assert (=> b!1013480 d!120493))

(declare-fun b!1013646 () Bool)

(declare-fun e!570211 () Bool)

(declare-fun tp!70457 () Bool)

(assert (=> b!1013646 (= e!570211 (and tp_is_empty!23473 tp!70457))))

(assert (=> b!1013486 (= tp!70445 e!570211)))

(assert (= (and b!1013486 (is-Cons!21405 (t!30410 l!412))) b!1013646))

(declare-fun b_lambda!15259 () Bool)

(assert (= b_lambda!15255 (or b!1013483 b_lambda!15259)))

(declare-fun bs!28939 () Bool)

(declare-fun d!120495 () Bool)

(assert (= bs!28939 (and d!120495 b!1013483)))

(declare-datatypes ((Option!572 0))(
  ( (Some!571 (v!14422 B!1406)) (None!570) )
))
(declare-fun getValueByKey!521 (List!21409 (_ BitVec 64)) Option!572)

(assert (=> bs!28939 (= (dynLambda!1884 lambda!509 (h!22604 lt!448017)) (= (getValueByKey!521 (t!30410 l!412) (h!22604 lt!448017)) (Some!571 value!115)))))

(declare-fun m!936505 () Bool)

(assert (=> bs!28939 m!936505))

(assert (=> b!1013563 d!120495))

(push 1)

(assert (not b!1013646))

(assert (not b!1013558))

(assert (not bm!42675))

(assert (not b!1013566))

(assert (not bm!42676))

(assert (not bm!42678))

(assert (not bm!42677))

(assert tp_is_empty!23473)

(assert (not b_lambda!15259))

(assert (not d!120477))

(assert (not b!1013564))

(assert (not bs!28939))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

