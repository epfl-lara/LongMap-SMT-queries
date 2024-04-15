; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87582 () Bool)

(assert start!87582)

(declare-fun b!1013557 () Bool)

(assert (=> b!1013557 true))

(assert (=> b!1013557 true))

(declare-fun b!1013556 () Bool)

(declare-fun e!570164 () Bool)

(declare-fun tp_is_empty!23479 () Bool)

(declare-fun tp!70464 () Bool)

(assert (=> b!1013556 (= e!570164 (and tp_is_empty!23479 tp!70464))))

(declare-datatypes ((Unit!33025 0))(
  ( (Unit!33026) )
))
(declare-fun e!570162 () Unit!33025)

(declare-fun lt!447938 () Unit!33025)

(assert (=> b!1013557 (= e!570162 lt!447938)))

(declare-datatypes ((List!21450 0))(
  ( (Nil!21447) (Cons!21446 (h!22644 (_ BitVec 64)) (t!30442 List!21450)) )
))
(declare-fun lt!447940 () List!21450)

(declare-datatypes ((B!1412 0))(
  ( (B!1413 (val!11790 Int)) )
))
(declare-fun value!115 () B!1412)

(declare-datatypes ((tuple2!15206 0))(
  ( (tuple2!15207 (_1!7614 (_ BitVec 64)) (_2!7614 B!1412)) )
))
(declare-datatypes ((List!21451 0))(
  ( (Nil!21448) (Cons!21447 (h!22645 tuple2!15206) (t!30443 List!21451)) )
))
(declare-fun l!412 () List!21451)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!31 (List!21451 List!21450 B!1412 tuple2!15206) Unit!33025)

(assert (=> b!1013557 (= lt!447938 (lemmaForallGetValueByKeySameWithASmallerHead!31 (t!30443 l!412) lt!447940 value!115 (h!22645 l!412)))))

(declare-fun lambda!545 () Int)

(declare-fun forall!236 (List!21450 Int) Bool)

(assert (=> b!1013557 (forall!236 lt!447940 lambda!545)))

(declare-fun b!1013558 () Bool)

(declare-fun e!570163 () Bool)

(declare-fun ListPrimitiveSize!106 (List!21451) Int)

(assert (=> b!1013558 (= e!570163 (>= (ListPrimitiveSize!106 (t!30443 l!412)) (ListPrimitiveSize!106 l!412)))))

(declare-fun lt!447939 () Unit!33025)

(assert (=> b!1013558 (= lt!447939 e!570162)))

(declare-fun c!102478 () Bool)

(declare-fun isEmpty!827 (List!21450) Bool)

(assert (=> b!1013558 (= c!102478 (not (isEmpty!827 lt!447940)))))

(declare-fun getKeysOf!40 (List!21451 B!1412) List!21450)

(assert (=> b!1013558 (= lt!447940 (getKeysOf!40 (t!30443 l!412) value!115))))

(declare-fun b!1013559 () Bool)

(declare-fun Unit!33027 () Unit!33025)

(assert (=> b!1013559 (= e!570162 Unit!33027)))

(declare-fun res!680434 () Bool)

(assert (=> start!87582 (=> (not res!680434) (not e!570163))))

(declare-fun isStrictlySorted!560 (List!21451) Bool)

(assert (=> start!87582 (= res!680434 (isStrictlySorted!560 l!412))))

(assert (=> start!87582 e!570163))

(assert (=> start!87582 e!570164))

(assert (=> start!87582 tp_is_empty!23479))

(declare-fun b!1013560 () Bool)

(declare-fun res!680435 () Bool)

(assert (=> b!1013560 (=> (not res!680435) (not e!570163))))

(get-info :version)

(assert (=> b!1013560 (= res!680435 (and ((_ is Cons!21447) l!412) (= (_2!7614 (h!22645 l!412)) value!115)))))

(assert (= (and start!87582 res!680434) b!1013560))

(assert (= (and b!1013560 res!680435) b!1013558))

(assert (= (and b!1013558 c!102478) b!1013557))

(assert (= (and b!1013558 (not c!102478)) b!1013559))

(assert (= (and start!87582 ((_ is Cons!21447) l!412)) b!1013556))

(declare-fun m!935917 () Bool)

(assert (=> b!1013557 m!935917))

(declare-fun m!935919 () Bool)

(assert (=> b!1013557 m!935919))

(declare-fun m!935921 () Bool)

(assert (=> b!1013558 m!935921))

(declare-fun m!935923 () Bool)

(assert (=> b!1013558 m!935923))

(declare-fun m!935925 () Bool)

(assert (=> b!1013558 m!935925))

(declare-fun m!935927 () Bool)

(assert (=> b!1013558 m!935927))

(declare-fun m!935929 () Bool)

(assert (=> start!87582 m!935929))

(check-sat (not b!1013558) tp_is_empty!23479 (not start!87582) (not b!1013556) (not b!1013557))
(check-sat)
(get-model)

(declare-fun d!120371 () Bool)

(declare-fun res!680452 () Bool)

(declare-fun e!570187 () Bool)

(assert (=> d!120371 (=> res!680452 e!570187)))

(assert (=> d!120371 (= res!680452 (or ((_ is Nil!21448) l!412) ((_ is Nil!21448) (t!30443 l!412))))))

(assert (=> d!120371 (= (isStrictlySorted!560 l!412) e!570187)))

(declare-fun b!1013607 () Bool)

(declare-fun e!570188 () Bool)

(assert (=> b!1013607 (= e!570187 e!570188)))

(declare-fun res!680453 () Bool)

(assert (=> b!1013607 (=> (not res!680453) (not e!570188))))

(assert (=> b!1013607 (= res!680453 (bvslt (_1!7614 (h!22645 l!412)) (_1!7614 (h!22645 (t!30443 l!412)))))))

(declare-fun b!1013608 () Bool)

(assert (=> b!1013608 (= e!570188 (isStrictlySorted!560 (t!30443 l!412)))))

(assert (= (and d!120371 (not res!680452)) b!1013607))

(assert (= (and b!1013607 res!680453) b!1013608))

(declare-fun m!935959 () Bool)

(assert (=> b!1013608 m!935959))

(assert (=> start!87582 d!120371))

(declare-fun bs!28921 () Bool)

(declare-fun b!1013628 () Bool)

(assert (= bs!28921 (and b!1013628 b!1013557)))

(declare-fun lambda!556 () Int)

(assert (=> bs!28921 (= (= (t!30443 l!412) l!412) (= lambda!556 lambda!545))))

(assert (=> b!1013628 true))

(assert (=> b!1013628 true))

(declare-fun bs!28922 () Bool)

(declare-fun d!120373 () Bool)

(assert (= bs!28922 (and d!120373 b!1013557)))

(declare-fun lambda!559 () Int)

(assert (=> bs!28922 (= (= (Cons!21447 (h!22645 l!412) (t!30443 l!412)) l!412) (= lambda!559 lambda!545))))

(declare-fun bs!28923 () Bool)

(assert (= bs!28923 (and d!120373 b!1013628)))

(assert (=> bs!28923 (= (= (Cons!21447 (h!22645 l!412) (t!30443 l!412)) (t!30443 l!412)) (= lambda!559 lambda!556))))

(assert (=> d!120373 true))

(assert (=> d!120373 true))

(assert (=> d!120373 true))

(assert (=> d!120373 (forall!236 lt!447940 lambda!559)))

(declare-fun lt!447965 () Unit!33025)

(declare-fun choose!1639 (List!21451 List!21450 B!1412 tuple2!15206) Unit!33025)

(assert (=> d!120373 (= lt!447965 (choose!1639 (t!30443 l!412) lt!447940 value!115 (h!22645 l!412)))))

(declare-fun e!570197 () Bool)

(assert (=> d!120373 e!570197))

(declare-fun res!680467 () Bool)

(assert (=> d!120373 (=> (not res!680467) (not e!570197))))

(assert (=> d!120373 (= res!680467 (isStrictlySorted!560 (t!30443 l!412)))))

(assert (=> d!120373 (= (lemmaForallGetValueByKeySameWithASmallerHead!31 (t!30443 l!412) lt!447940 value!115 (h!22645 l!412)) lt!447965)))

(declare-fun b!1013627 () Bool)

(declare-fun res!680466 () Bool)

(assert (=> b!1013627 (=> (not res!680466) (not e!570197))))

(declare-fun isEmpty!831 (List!21451) Bool)

(assert (=> b!1013627 (= res!680466 (not (isEmpty!831 (t!30443 l!412))))))

(declare-fun res!680468 () Bool)

(assert (=> b!1013628 (=> (not res!680468) (not e!570197))))

(assert (=> b!1013628 (= res!680468 (forall!236 lt!447940 lambda!556))))

(declare-fun b!1013629 () Bool)

(declare-fun head!936 (List!21451) tuple2!15206)

(assert (=> b!1013629 (= e!570197 (bvslt (_1!7614 (h!22645 l!412)) (_1!7614 (head!936 (t!30443 l!412)))))))

(assert (= (and d!120373 res!680467) b!1013627))

(assert (= (and b!1013627 res!680466) b!1013628))

(assert (= (and b!1013628 res!680468) b!1013629))

(declare-fun m!935963 () Bool)

(assert (=> d!120373 m!935963))

(declare-fun m!935965 () Bool)

(assert (=> d!120373 m!935965))

(assert (=> d!120373 m!935959))

(declare-fun m!935967 () Bool)

(assert (=> b!1013627 m!935967))

(declare-fun m!935969 () Bool)

(assert (=> b!1013628 m!935969))

(declare-fun m!935971 () Bool)

(assert (=> b!1013629 m!935971))

(assert (=> b!1013557 d!120373))

(declare-fun d!120385 () Bool)

(declare-fun res!680476 () Bool)

(declare-fun e!570203 () Bool)

(assert (=> d!120385 (=> res!680476 e!570203)))

(assert (=> d!120385 (= res!680476 ((_ is Nil!21447) lt!447940))))

(assert (=> d!120385 (= (forall!236 lt!447940 lambda!545) e!570203)))

(declare-fun b!1013643 () Bool)

(declare-fun e!570204 () Bool)

(assert (=> b!1013643 (= e!570203 e!570204)))

(declare-fun res!680477 () Bool)

(assert (=> b!1013643 (=> (not res!680477) (not e!570204))))

(declare-fun dynLambda!1878 (Int (_ BitVec 64)) Bool)

(assert (=> b!1013643 (= res!680477 (dynLambda!1878 lambda!545 (h!22644 lt!447940)))))

(declare-fun b!1013644 () Bool)

(assert (=> b!1013644 (= e!570204 (forall!236 (t!30442 lt!447940) lambda!545))))

(assert (= (and d!120385 (not res!680476)) b!1013643))

(assert (= (and b!1013643 res!680477) b!1013644))

(declare-fun b_lambda!15247 () Bool)

(assert (=> (not b_lambda!15247) (not b!1013643)))

(declare-fun m!935985 () Bool)

(assert (=> b!1013643 m!935985))

(declare-fun m!935987 () Bool)

(assert (=> b!1013644 m!935987))

(assert (=> b!1013557 d!120385))

(declare-fun d!120389 () Bool)

(declare-fun lt!447971 () Int)

(assert (=> d!120389 (>= lt!447971 0)))

(declare-fun e!570217 () Int)

(assert (=> d!120389 (= lt!447971 e!570217)))

(declare-fun c!102491 () Bool)

(assert (=> d!120389 (= c!102491 ((_ is Nil!21448) (t!30443 l!412)))))

(assert (=> d!120389 (= (ListPrimitiveSize!106 (t!30443 l!412)) lt!447971)))

(declare-fun b!1013659 () Bool)

(assert (=> b!1013659 (= e!570217 0)))

(declare-fun b!1013660 () Bool)

(assert (=> b!1013660 (= e!570217 (+ 1 (ListPrimitiveSize!106 (t!30443 (t!30443 l!412)))))))

(assert (= (and d!120389 c!102491) b!1013659))

(assert (= (and d!120389 (not c!102491)) b!1013660))

(declare-fun m!935993 () Bool)

(assert (=> b!1013660 m!935993))

(assert (=> b!1013558 d!120389))

(declare-fun d!120395 () Bool)

(declare-fun lt!447972 () Int)

(assert (=> d!120395 (>= lt!447972 0)))

(declare-fun e!570220 () Int)

(assert (=> d!120395 (= lt!447972 e!570220)))

(declare-fun c!102492 () Bool)

(assert (=> d!120395 (= c!102492 ((_ is Nil!21448) l!412))))

(assert (=> d!120395 (= (ListPrimitiveSize!106 l!412) lt!447972)))

(declare-fun b!1013663 () Bool)

(assert (=> b!1013663 (= e!570220 0)))

(declare-fun b!1013664 () Bool)

(assert (=> b!1013664 (= e!570220 (+ 1 (ListPrimitiveSize!106 (t!30443 l!412))))))

(assert (= (and d!120395 c!102492) b!1013663))

(assert (= (and d!120395 (not c!102492)) b!1013664))

(assert (=> b!1013664 m!935921))

(assert (=> b!1013558 d!120395))

(declare-fun d!120397 () Bool)

(assert (=> d!120397 (= (isEmpty!827 lt!447940) ((_ is Nil!21447) lt!447940))))

(assert (=> b!1013558 d!120397))

(declare-fun bs!28956 () Bool)

(declare-fun b!1013774 () Bool)

(assert (= bs!28956 (and b!1013774 b!1013557)))

(declare-fun lambda!594 () Int)

(declare-fun lt!448083 () List!21451)

(declare-fun lt!448076 () tuple2!15206)

(assert (=> bs!28956 (= (= (Cons!21447 lt!448076 lt!448083) l!412) (= lambda!594 lambda!545))))

(declare-fun bs!28957 () Bool)

(assert (= bs!28957 (and b!1013774 b!1013628)))

(assert (=> bs!28957 (= (= (Cons!21447 lt!448076 lt!448083) (t!30443 l!412)) (= lambda!594 lambda!556))))

(declare-fun bs!28958 () Bool)

(assert (= bs!28958 (and b!1013774 d!120373)))

(assert (=> bs!28958 (= (= (Cons!21447 lt!448076 lt!448083) (Cons!21447 (h!22645 l!412) (t!30443 l!412))) (= lambda!594 lambda!559))))

(assert (=> b!1013774 true))

(assert (=> b!1013774 true))

(assert (=> b!1013774 true))

(declare-fun bs!28959 () Bool)

(declare-fun b!1013772 () Bool)

(assert (= bs!28959 (and b!1013772 b!1013557)))

(declare-fun lt!448085 () tuple2!15206)

(declare-fun lt!448084 () List!21451)

(declare-fun lambda!595 () Int)

(assert (=> bs!28959 (= (= (Cons!21447 lt!448085 lt!448084) l!412) (= lambda!595 lambda!545))))

(declare-fun bs!28960 () Bool)

(assert (= bs!28960 (and b!1013772 b!1013628)))

(assert (=> bs!28960 (= (= (Cons!21447 lt!448085 lt!448084) (t!30443 l!412)) (= lambda!595 lambda!556))))

(declare-fun bs!28961 () Bool)

(assert (= bs!28961 (and b!1013772 d!120373)))

(assert (=> bs!28961 (= (= (Cons!21447 lt!448085 lt!448084) (Cons!21447 (h!22645 l!412) (t!30443 l!412))) (= lambda!595 lambda!559))))

(declare-fun bs!28962 () Bool)

(assert (= bs!28962 (and b!1013772 b!1013774)))

(assert (=> bs!28962 (= (= (Cons!21447 lt!448085 lt!448084) (Cons!21447 lt!448076 lt!448083)) (= lambda!595 lambda!594))))

(assert (=> b!1013772 true))

(assert (=> b!1013772 true))

(assert (=> b!1013772 true))

(declare-fun bs!28963 () Bool)

(declare-fun d!120399 () Bool)

(assert (= bs!28963 (and d!120399 b!1013774)))

(declare-fun lambda!596 () Int)

(assert (=> bs!28963 (= (= (t!30443 l!412) (Cons!21447 lt!448076 lt!448083)) (= lambda!596 lambda!594))))

(declare-fun bs!28964 () Bool)

(assert (= bs!28964 (and d!120399 b!1013557)))

(assert (=> bs!28964 (= (= (t!30443 l!412) l!412) (= lambda!596 lambda!545))))

(declare-fun bs!28965 () Bool)

(assert (= bs!28965 (and d!120399 b!1013628)))

(assert (=> bs!28965 (= lambda!596 lambda!556)))

(declare-fun bs!28966 () Bool)

(assert (= bs!28966 (and d!120399 b!1013772)))

(assert (=> bs!28966 (= (= (t!30443 l!412) (Cons!21447 lt!448085 lt!448084)) (= lambda!596 lambda!595))))

(declare-fun bs!28967 () Bool)

(assert (= bs!28967 (and d!120399 d!120373)))

(assert (=> bs!28967 (= (= (t!30443 l!412) (Cons!21447 (h!22645 l!412) (t!30443 l!412))) (= lambda!596 lambda!559))))

(assert (=> d!120399 true))

(assert (=> d!120399 true))

(declare-fun b!1013770 () Bool)

(declare-fun e!570280 () List!21450)

(declare-fun e!570279 () List!21450)

(assert (=> b!1013770 (= e!570280 e!570279)))

(declare-fun c!102530 () Bool)

(assert (=> b!1013770 (= c!102530 (and ((_ is Cons!21447) (t!30443 l!412)) (not (= (_2!7614 (h!22645 (t!30443 l!412))) value!115))))))

(declare-fun lt!448080 () List!21450)

(assert (=> d!120399 (forall!236 lt!448080 lambda!596)))

(assert (=> d!120399 (= lt!448080 e!570280)))

(declare-fun c!102531 () Bool)

(assert (=> d!120399 (= c!102531 (and ((_ is Cons!21447) (t!30443 l!412)) (= (_2!7614 (h!22645 (t!30443 l!412))) value!115)))))

(assert (=> d!120399 (isStrictlySorted!560 (t!30443 l!412))))

(assert (=> d!120399 (= (getKeysOf!40 (t!30443 l!412) value!115) lt!448080)))

(declare-fun b!1013771 () Bool)

(declare-fun lt!448079 () Unit!33025)

(declare-fun e!570281 () Unit!33025)

(assert (=> b!1013771 (= lt!448079 e!570281)))

(declare-fun c!102529 () Bool)

(declare-fun call!42703 () Bool)

(assert (=> b!1013771 (= c!102529 (not call!42703))))

(declare-fun lt!448077 () List!21450)

(declare-fun call!42705 () List!21450)

(assert (=> b!1013771 (= lt!448077 call!42705)))

(assert (=> b!1013771 (= e!570279 call!42705)))

(declare-fun lt!448081 () Unit!33025)

(assert (=> b!1013772 (= e!570281 lt!448081)))

(assert (=> b!1013772 (= lt!448084 (t!30443 (t!30443 l!412)))))

(declare-fun lt!448086 () List!21450)

(assert (=> b!1013772 (= lt!448086 call!42705)))

(assert (=> b!1013772 (= lt!448085 (h!22645 (t!30443 l!412)))))

(declare-fun call!42704 () Unit!33025)

(assert (=> b!1013772 (= lt!448081 call!42704)))

(declare-fun call!42706 () Bool)

(assert (=> b!1013772 call!42706))

(declare-fun bm!42700 () Bool)

(declare-fun lt!448087 () List!21450)

(assert (=> bm!42700 (= call!42704 (lemmaForallGetValueByKeySameWithASmallerHead!31 (ite c!102531 lt!448083 lt!448084) (ite c!102531 lt!448087 lt!448086) value!115 (ite c!102531 lt!448076 lt!448085)))))

(declare-fun bm!42701 () Bool)

(assert (=> bm!42701 (= call!42703 (isEmpty!827 call!42705))))

(declare-fun b!1013773 () Bool)

(assert (=> b!1013773 (= e!570279 Nil!21447)))

(declare-fun bm!42702 () Bool)

(assert (=> bm!42702 (= call!42706 (forall!236 (ite c!102531 lt!448087 lt!448086) (ite c!102531 lambda!594 lambda!595)))))

(assert (=> b!1013774 call!42706))

(declare-fun lt!448078 () Unit!33025)

(assert (=> b!1013774 (= lt!448078 call!42704)))

(assert (=> b!1013774 (= lt!448076 (h!22645 (t!30443 l!412)))))

(assert (=> b!1013774 (= lt!448087 call!42705)))

(assert (=> b!1013774 (= lt!448083 (t!30443 (t!30443 l!412)))))

(declare-fun e!570278 () Unit!33025)

(assert (=> b!1013774 (= e!570278 lt!448078)))

(declare-fun bm!42703 () Bool)

(assert (=> bm!42703 (= call!42705 (getKeysOf!40 (t!30443 (t!30443 l!412)) value!115))))

(declare-fun b!1013775 () Bool)

(declare-fun Unit!33038 () Unit!33025)

(assert (=> b!1013775 (= e!570278 Unit!33038)))

(declare-fun b!1013776 () Bool)

(assert (=> b!1013776 (= e!570280 (Cons!21446 (_1!7614 (h!22645 (t!30443 l!412))) call!42705))))

(declare-fun c!102532 () Bool)

(assert (=> b!1013776 (= c!102532 (not call!42703))))

(declare-fun lt!448082 () Unit!33025)

(assert (=> b!1013776 (= lt!448082 e!570278)))

(declare-fun b!1013777 () Bool)

(declare-fun Unit!33039 () Unit!33025)

(assert (=> b!1013777 (= e!570281 Unit!33039)))

(assert (= (and d!120399 c!102531) b!1013776))

(assert (= (and d!120399 (not c!102531)) b!1013770))

(assert (= (and b!1013776 c!102532) b!1013774))

(assert (= (and b!1013776 (not c!102532)) b!1013775))

(assert (= (and b!1013770 c!102530) b!1013771))

(assert (= (and b!1013770 (not c!102530)) b!1013773))

(assert (= (and b!1013771 c!102529) b!1013772))

(assert (= (and b!1013771 (not c!102529)) b!1013777))

(assert (= (or b!1013774 b!1013772) bm!42700))

(assert (= (or b!1013774 b!1013772) bm!42702))

(assert (= (or b!1013776 b!1013774 b!1013771 b!1013772) bm!42703))

(assert (= (or b!1013776 b!1013771) bm!42701))

(declare-fun m!936037 () Bool)

(assert (=> bm!42703 m!936037))

(declare-fun m!936039 () Bool)

(assert (=> bm!42700 m!936039))

(declare-fun m!936041 () Bool)

(assert (=> d!120399 m!936041))

(assert (=> d!120399 m!935959))

(declare-fun m!936043 () Bool)

(assert (=> bm!42701 m!936043))

(declare-fun m!936045 () Bool)

(assert (=> bm!42702 m!936045))

(assert (=> b!1013558 d!120399))

(declare-fun b!1013782 () Bool)

(declare-fun e!570284 () Bool)

(declare-fun tp!70479 () Bool)

(assert (=> b!1013782 (= e!570284 (and tp_is_empty!23479 tp!70479))))

(assert (=> b!1013556 (= tp!70464 e!570284)))

(assert (= (and b!1013556 ((_ is Cons!21447) (t!30443 l!412))) b!1013782))

(declare-fun b_lambda!15257 () Bool)

(assert (= b_lambda!15247 (or b!1013557 b_lambda!15257)))

(declare-fun bs!28968 () Bool)

(declare-fun d!120417 () Bool)

(assert (= bs!28968 (and d!120417 b!1013557)))

(declare-datatypes ((Option!578 0))(
  ( (Some!577 (v!14425 B!1412)) (None!576) )
))
(declare-fun getValueByKey!527 (List!21451 (_ BitVec 64)) Option!578)

(assert (=> bs!28968 (= (dynLambda!1878 lambda!545 (h!22644 lt!447940)) (= (getValueByKey!527 l!412 (h!22644 lt!447940)) (Some!577 value!115)))))

(declare-fun m!936047 () Bool)

(assert (=> bs!28968 m!936047))

(assert (=> b!1013643 d!120417))

(check-sat (not d!120399) (not b!1013644) (not bm!42702) (not b!1013664) (not bs!28968) (not b!1013608) (not b!1013627) (not b!1013782) (not b_lambda!15257) (not b!1013629) (not d!120373) (not bm!42703) tp_is_empty!23479 (not bm!42701) (not bm!42700) (not b!1013628) (not b!1013660))
(check-sat)
