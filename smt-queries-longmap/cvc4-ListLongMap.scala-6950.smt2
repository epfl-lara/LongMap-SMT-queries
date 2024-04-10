; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87544 () Bool)

(assert start!87544)

(declare-fun b!1013532 () Bool)

(assert (=> b!1013532 true))

(assert (=> b!1013532 true))

(declare-fun b!1013530 () Bool)

(declare-fun res!680444 () Bool)

(declare-fun e!570143 () Bool)

(assert (=> b!1013530 (=> res!680444 e!570143)))

(declare-datatypes ((B!1410 0))(
  ( (B!1411 (val!11789 Int)) )
))
(declare-datatypes ((tuple2!15124 0))(
  ( (tuple2!15125 (_1!7573 (_ BitVec 64)) (_2!7573 B!1410)) )
))
(declare-datatypes ((List!21413 0))(
  ( (Nil!21410) (Cons!21409 (h!22607 tuple2!15124) (t!30414 List!21413)) )
))
(declare-fun l!412 () List!21413)

(declare-fun isEmpty!820 (List!21413) Bool)

(assert (=> b!1013530 (= res!680444 (isEmpty!820 (t!30414 l!412)))))

(declare-fun b!1013531 () Bool)

(declare-fun head!934 (List!21413) tuple2!15124)

(assert (=> b!1013531 (= e!570143 (bvsge (_1!7573 (h!22607 l!412)) (_1!7573 (head!934 (t!30414 l!412)))))))

(declare-fun res!680446 () Bool)

(declare-fun e!570144 () Bool)

(assert (=> start!87544 (=> (not res!680446) (not e!570144))))

(declare-fun isStrictlySorted!563 (List!21413) Bool)

(assert (=> start!87544 (= res!680446 (isStrictlySorted!563 l!412))))

(assert (=> start!87544 e!570144))

(declare-fun e!570142 () Bool)

(assert (=> start!87544 e!570142))

(declare-fun tp_is_empty!23477 () Bool)

(assert (=> start!87544 tp_is_empty!23477))

(declare-fun res!680448 () Bool)

(assert (=> b!1013532 (=> res!680448 e!570143)))

(declare-datatypes ((List!21414 0))(
  ( (Nil!21411) (Cons!21410 (h!22608 (_ BitVec 64)) (t!30415 List!21414)) )
))
(declare-fun lt!448023 () List!21414)

(declare-fun lambda!515 () Int)

(declare-fun forall!232 (List!21414 Int) Bool)

(assert (=> b!1013532 (= res!680448 (not (forall!232 lt!448023 lambda!515)))))

(declare-fun b!1013533 () Bool)

(declare-fun e!570145 () Bool)

(assert (=> b!1013533 (= e!570144 e!570145)))

(declare-fun res!680447 () Bool)

(assert (=> b!1013533 (=> (not res!680447) (not e!570145))))

(declare-fun isEmpty!821 (List!21414) Bool)

(assert (=> b!1013533 (= res!680447 (not (isEmpty!821 lt!448023)))))

(declare-fun value!115 () B!1410)

(declare-fun getKeysOf!39 (List!21413 B!1410) List!21414)

(assert (=> b!1013533 (= lt!448023 (getKeysOf!39 (t!30414 l!412) value!115))))

(declare-fun b!1013534 () Bool)

(declare-fun tp!70451 () Bool)

(assert (=> b!1013534 (= e!570142 (and tp_is_empty!23477 tp!70451))))

(declare-fun b!1013535 () Bool)

(declare-fun res!680445 () Bool)

(assert (=> b!1013535 (=> (not res!680445) (not e!570144))))

(assert (=> b!1013535 (= res!680445 (and (is-Cons!21409 l!412) (= (_2!7573 (h!22607 l!412)) value!115)))))

(declare-fun b!1013536 () Bool)

(assert (=> b!1013536 (= e!570145 e!570143)))

(declare-fun res!680443 () Bool)

(assert (=> b!1013536 (=> res!680443 e!570143)))

(assert (=> b!1013536 (= res!680443 (not (isStrictlySorted!563 (t!30414 l!412))))))

(assert (= (and start!87544 res!680446) b!1013535))

(assert (= (and b!1013535 res!680445) b!1013533))

(assert (= (and b!1013533 res!680447) b!1013536))

(assert (= (and b!1013536 (not res!680443)) b!1013530))

(assert (= (and b!1013530 (not res!680444)) b!1013532))

(assert (= (and b!1013532 (not res!680448)) b!1013531))

(assert (= (and start!87544 (is-Cons!21409 l!412)) b!1013534))

(declare-fun m!936457 () Bool)

(assert (=> b!1013536 m!936457))

(declare-fun m!936459 () Bool)

(assert (=> b!1013532 m!936459))

(declare-fun m!936461 () Bool)

(assert (=> start!87544 m!936461))

(declare-fun m!936463 () Bool)

(assert (=> b!1013533 m!936463))

(declare-fun m!936465 () Bool)

(assert (=> b!1013533 m!936465))

(declare-fun m!936467 () Bool)

(assert (=> b!1013530 m!936467))

(declare-fun m!936469 () Bool)

(assert (=> b!1013531 m!936469))

(push 1)

(assert (not b!1013531))

(assert tp_is_empty!23477)

(assert (not b!1013534))

(assert (not b!1013532))

(assert (not b!1013536))

(assert (not b!1013530))

(assert (not start!87544))

(assert (not b!1013533))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120479 () Bool)

(assert (=> d!120479 (= (isEmpty!820 (t!30414 l!412)) (is-Nil!21410 (t!30414 l!412)))))

(assert (=> b!1013530 d!120479))

(declare-fun d!120481 () Bool)

(assert (=> d!120481 (= (isEmpty!821 lt!448023) (is-Nil!21411 lt!448023))))

(assert (=> b!1013533 d!120481))

(declare-fun bs!28940 () Bool)

(declare-fun b!1013649 () Bool)

(assert (= bs!28940 (and b!1013649 b!1013532)))

(declare-fun lt!448127 () tuple2!15124)

(declare-fun lt!448126 () List!21413)

(declare-fun lambda!540 () Int)

(assert (=> bs!28940 (= (= (Cons!21409 lt!448127 lt!448126) (t!30414 l!412)) (= lambda!540 lambda!515))))

(assert (=> b!1013649 true))

(assert (=> b!1013649 true))

(assert (=> b!1013649 true))

(declare-fun bs!28941 () Bool)

(declare-fun b!1013653 () Bool)

(assert (= bs!28941 (and b!1013653 b!1013532)))

(declare-fun lt!448121 () tuple2!15124)

(declare-fun lambda!541 () Int)

(declare-fun lt!448120 () List!21413)

(assert (=> bs!28941 (= (= (Cons!21409 lt!448121 lt!448120) (t!30414 l!412)) (= lambda!541 lambda!515))))

(declare-fun bs!28942 () Bool)

(assert (= bs!28942 (and b!1013653 b!1013649)))

(assert (=> bs!28942 (= (= (Cons!21409 lt!448121 lt!448120) (Cons!21409 lt!448127 lt!448126)) (= lambda!541 lambda!540))))

(assert (=> b!1013653 true))

(assert (=> b!1013653 true))

(assert (=> b!1013653 true))

(declare-fun bs!28943 () Bool)

(declare-fun d!120483 () Bool)

(assert (= bs!28943 (and d!120483 b!1013532)))

(declare-fun lambda!542 () Int)

(assert (=> bs!28943 (= lambda!542 lambda!515)))

(declare-fun bs!28944 () Bool)

(assert (= bs!28944 (and d!120483 b!1013649)))

(assert (=> bs!28944 (= (= (t!30414 l!412) (Cons!21409 lt!448127 lt!448126)) (= lambda!542 lambda!540))))

(declare-fun bs!28945 () Bool)

(assert (= bs!28945 (and d!120483 b!1013653)))

(assert (=> bs!28945 (= (= (t!30414 l!412) (Cons!21409 lt!448121 lt!448120)) (= lambda!542 lambda!541))))

(assert (=> d!120483 true))

(assert (=> d!120483 true))

(declare-fun b!1013647 () Bool)

(declare-datatypes ((Unit!33130 0))(
  ( (Unit!33131) )
))
(declare-fun lt!448125 () Unit!33130)

(declare-fun e!570212 () Unit!33130)

(assert (=> b!1013647 (= lt!448125 e!570212)))

(declare-fun c!102505 () Bool)

(declare-fun call!42693 () Bool)

(assert (=> b!1013647 (= c!102505 (not call!42693))))

(declare-fun lt!448122 () List!21414)

(declare-fun call!42690 () List!21414)

(assert (=> b!1013647 (= lt!448122 call!42690)))

(declare-fun e!570213 () List!21414)

(assert (=> b!1013647 (= e!570213 call!42690)))

(declare-fun bm!42687 () Bool)

(declare-fun lt!448128 () List!21414)

(declare-fun lt!448123 () List!21414)

(declare-fun c!102504 () Bool)

(declare-fun call!42692 () Unit!33130)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!27 (List!21413 List!21414 B!1410 tuple2!15124) Unit!33130)

(assert (=> bm!42687 (= call!42692 (lemmaForallGetValueByKeySameWithASmallerHead!27 (ite c!102504 lt!448126 lt!448120) (ite c!102504 lt!448123 lt!448128) value!115 (ite c!102504 lt!448127 lt!448121)))))

(declare-fun call!42691 () Bool)

(assert (=> b!1013649 call!42691))

(declare-fun lt!448124 () Unit!33130)

(assert (=> b!1013649 (= lt!448124 call!42692)))

(assert (=> b!1013649 (= lt!448127 (h!22607 (t!30414 l!412)))))

(assert (=> b!1013649 (= lt!448123 call!42690)))

(assert (=> b!1013649 (= lt!448126 (t!30414 (t!30414 l!412)))))

(declare-fun e!570214 () Unit!33130)

(assert (=> b!1013649 (= e!570214 lt!448124)))

(declare-fun bm!42688 () Bool)

(assert (=> bm!42688 (= call!42691 (forall!232 (ite c!102504 lt!448123 lt!448128) (ite c!102504 lambda!540 lambda!541)))))

(declare-fun b!1013650 () Bool)

(assert (=> b!1013650 (= e!570213 Nil!21411)))

(declare-fun b!1013651 () Bool)

(declare-fun e!570215 () List!21414)

(assert (=> b!1013651 (= e!570215 e!570213)))

(declare-fun c!102506 () Bool)

(assert (=> b!1013651 (= c!102506 (and (is-Cons!21409 (t!30414 l!412)) (not (= (_2!7573 (h!22607 (t!30414 l!412))) value!115))))))

(declare-fun bm!42689 () Bool)

(assert (=> bm!42689 (= call!42690 (getKeysOf!39 (t!30414 (t!30414 l!412)) value!115))))

(declare-fun bm!42690 () Bool)

(assert (=> bm!42690 (= call!42693 (isEmpty!821 call!42690))))

(declare-fun b!1013652 () Bool)

(declare-fun Unit!33132 () Unit!33130)

(assert (=> b!1013652 (= e!570212 Unit!33132)))

(declare-fun lt!448131 () Unit!33130)

(assert (=> b!1013653 (= e!570212 lt!448131)))

(assert (=> b!1013653 (= lt!448120 (t!30414 (t!30414 l!412)))))

(assert (=> b!1013653 (= lt!448128 call!42690)))

(assert (=> b!1013653 (= lt!448121 (h!22607 (t!30414 l!412)))))

(assert (=> b!1013653 (= lt!448131 call!42692)))

(assert (=> b!1013653 call!42691))

(declare-fun b!1013654 () Bool)

(assert (=> b!1013654 (= e!570215 (Cons!21410 (_1!7573 (h!22607 (t!30414 l!412))) call!42690))))

(declare-fun c!102507 () Bool)

(assert (=> b!1013654 (= c!102507 (not call!42693))))

(declare-fun lt!448130 () Unit!33130)

(assert (=> b!1013654 (= lt!448130 e!570214)))

(declare-fun lt!448129 () List!21414)

(assert (=> d!120483 (forall!232 lt!448129 lambda!542)))

(assert (=> d!120483 (= lt!448129 e!570215)))

(assert (=> d!120483 (= c!102504 (and (is-Cons!21409 (t!30414 l!412)) (= (_2!7573 (h!22607 (t!30414 l!412))) value!115)))))

(assert (=> d!120483 (isStrictlySorted!563 (t!30414 l!412))))

(assert (=> d!120483 (= (getKeysOf!39 (t!30414 l!412) value!115) lt!448129)))

(declare-fun b!1013648 () Bool)

(declare-fun Unit!33133 () Unit!33130)

(assert (=> b!1013648 (= e!570214 Unit!33133)))

(assert (= (and d!120483 c!102504) b!1013654))

(assert (= (and d!120483 (not c!102504)) b!1013651))

(assert (= (and b!1013654 c!102507) b!1013649))

(assert (= (and b!1013654 (not c!102507)) b!1013648))

(assert (= (and b!1013651 c!102506) b!1013647))

(assert (= (and b!1013651 (not c!102506)) b!1013650))

(assert (= (and b!1013647 c!102505) b!1013653))

(assert (= (and b!1013647 (not c!102505)) b!1013652))

(assert (= (or b!1013649 b!1013653) bm!42687))

(assert (= (or b!1013649 b!1013653) bm!42688))

(assert (= (or b!1013654 b!1013649 b!1013647 b!1013653) bm!42689))

(assert (= (or b!1013654 b!1013647) bm!42690))

(declare-fun m!936507 () Bool)

(assert (=> bm!42688 m!936507))

(declare-fun m!936509 () Bool)

(assert (=> d!120483 m!936509))

(assert (=> d!120483 m!936457))

(declare-fun m!936511 () Bool)

(assert (=> bm!42687 m!936511))

(declare-fun m!936513 () Bool)

(assert (=> bm!42690 m!936513))

(declare-fun m!936515 () Bool)

(assert (=> bm!42689 m!936515))

(assert (=> b!1013533 d!120483))

(declare-fun d!120497 () Bool)

(declare-fun res!680481 () Bool)

(declare-fun e!570220 () Bool)

(assert (=> d!120497 (=> res!680481 e!570220)))

(assert (=> d!120497 (= res!680481 (is-Nil!21411 lt!448023))))

(assert (=> d!120497 (= (forall!232 lt!448023 lambda!515) e!570220)))

(declare-fun b!1013661 () Bool)

(declare-fun e!570221 () Bool)

(assert (=> b!1013661 (= e!570220 e!570221)))

(declare-fun res!680482 () Bool)

(assert (=> b!1013661 (=> (not res!680482) (not e!570221))))

(declare-fun dynLambda!1885 (Int (_ BitVec 64)) Bool)

(assert (=> b!1013661 (= res!680482 (dynLambda!1885 lambda!515 (h!22608 lt!448023)))))

(declare-fun b!1013662 () Bool)

(assert (=> b!1013662 (= e!570221 (forall!232 (t!30415 lt!448023) lambda!515))))

(assert (= (and d!120497 (not res!680481)) b!1013661))

(assert (= (and b!1013661 res!680482) b!1013662))

(declare-fun b_lambda!15261 () Bool)

(assert (=> (not b_lambda!15261) (not b!1013661)))

(declare-fun m!936517 () Bool)

(assert (=> b!1013661 m!936517))

(declare-fun m!936519 () Bool)

(assert (=> b!1013662 m!936519))

(assert (=> b!1013532 d!120497))

(declare-fun d!120499 () Bool)

(declare-fun res!680487 () Bool)

(declare-fun e!570226 () Bool)

(assert (=> d!120499 (=> res!680487 e!570226)))

(assert (=> d!120499 (= res!680487 (or (is-Nil!21410 (t!30414 l!412)) (is-Nil!21410 (t!30414 (t!30414 l!412)))))))

