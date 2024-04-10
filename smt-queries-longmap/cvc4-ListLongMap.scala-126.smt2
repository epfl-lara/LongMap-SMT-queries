; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2194 () Bool)

(assert start!2194)

(declare-fun b!14772 () Bool)

(assert (=> b!14772 true))

(declare-fun b!14771 () Bool)

(declare-fun e!8872 () Bool)

(declare-fun tp_is_empty!737 () Bool)

(declare-fun tp!2369 () Bool)

(assert (=> b!14771 (= e!8872 (and tp_is_empty!737 tp!2369))))

(declare-fun res!11347 () Bool)

(declare-fun e!8870 () Bool)

(assert (=> b!14772 (=> res!11347 e!8870)))

(declare-fun lambda!182 () Int)

(declare-datatypes ((B!558 0))(
  ( (B!559 (val!377 Int)) )
))
(declare-datatypes ((tuple2!554 0))(
  ( (tuple2!555 (_1!277 (_ BitVec 64)) (_2!277 B!558)) )
))
(declare-datatypes ((List!432 0))(
  ( (Nil!429) (Cons!428 (h!994 tuple2!554) (t!2834 List!432)) )
))
(declare-fun forall!100 (List!432 Int) Bool)

(assert (=> b!14772 (= res!11347 (not (forall!100 Nil!429 lambda!182)))))

(declare-fun b!14773 () Bool)

(declare-fun e!8869 () Bool)

(declare-fun e!8871 () Bool)

(assert (=> b!14773 (= e!8869 e!8871)))

(declare-fun res!11348 () Bool)

(assert (=> b!14773 (= res!11348 false)))

(assert (=> b!14773 (=> (not res!11348) (not e!8871))))

(declare-fun b!14774 () Bool)

(declare-fun l!522 () List!432)

(declare-fun head!796 (List!432) tuple2!554)

(assert (=> b!14774 (= e!8871 (bvslt (_1!277 (head!796 Nil!429)) (_1!277 (head!796 l!522))))))

(declare-fun b!14775 () Bool)

(declare-fun res!11346 () Bool)

(declare-fun e!8873 () Bool)

(assert (=> b!14775 (=> (not res!11346) (not e!8873))))

(declare-fun value!159 () B!558)

(assert (=> b!14775 (= res!11346 (and (or (not (is-Cons!428 l!522)) (not (= (_2!277 (h!994 l!522)) value!159))) (or (not (is-Cons!428 l!522)) (= (_2!277 (h!994 l!522)) value!159)) (is-Nil!429 l!522)))))

(declare-fun b!14776 () Bool)

(assert (=> b!14776 (= e!8870 e!8869)))

(declare-fun c!1400 () Bool)

(declare-fun isEmpty!107 (List!432) Bool)

(assert (=> b!14776 (= c!1400 (isEmpty!107 l!522))))

(declare-fun b!14777 () Bool)

(assert (=> b!14777 (= e!8873 e!8870)))

(declare-fun res!11349 () Bool)

(assert (=> b!14777 (=> res!11349 e!8870)))

(assert (=> b!14777 (= res!11349 false)))

(declare-fun b!14778 () Bool)

(assert (=> b!14778 (= e!8869 false)))

(declare-fun res!11350 () Bool)

(assert (=> start!2194 (=> (not res!11350) (not e!8873))))

(declare-fun isStrictlySorted!119 (List!432) Bool)

(assert (=> start!2194 (= res!11350 (isStrictlySorted!119 l!522))))

(assert (=> start!2194 e!8873))

(assert (=> start!2194 e!8872))

(assert (=> start!2194 tp_is_empty!737))

(assert (= (and start!2194 res!11350) b!14775))

(assert (= (and b!14775 res!11346) b!14777))

(assert (= (and b!14777 (not res!11349)) b!14772))

(assert (= (and b!14772 (not res!11347)) b!14776))

(assert (= (and b!14776 c!1400) b!14778))

(assert (= (and b!14776 (not c!1400)) b!14773))

(assert (= (and b!14773 res!11348) b!14774))

(assert (= (and start!2194 (is-Cons!428 l!522)) b!14771))

(declare-fun m!9871 () Bool)

(assert (=> b!14772 m!9871))

(declare-fun m!9873 () Bool)

(assert (=> b!14774 m!9873))

(declare-fun m!9875 () Bool)

(assert (=> b!14774 m!9875))

(declare-fun m!9877 () Bool)

(assert (=> b!14776 m!9877))

(declare-fun m!9879 () Bool)

(assert (=> start!2194 m!9879))

(push 1)

(assert (not b!14771))

(assert (not b!14776))

(assert (not b!14772))

(assert tp_is_empty!737)

(assert (not start!2194))

(assert (not b!14774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2395 () Bool)

(assert (=> d!2395 (= (isEmpty!107 l!522) (is-Nil!429 l!522))))

(assert (=> b!14776 d!2395))

(declare-fun d!2397 () Bool)

(declare-fun res!11355 () Bool)

(declare-fun e!8878 () Bool)

(assert (=> d!2397 (=> res!11355 e!8878)))

(assert (=> d!2397 (= res!11355 (or (is-Nil!429 l!522) (is-Nil!429 (t!2834 l!522))))))

(assert (=> d!2397 (= (isStrictlySorted!119 l!522) e!8878)))

(declare-fun b!14785 () Bool)

(declare-fun e!8879 () Bool)

(assert (=> b!14785 (= e!8878 e!8879)))

(declare-fun res!11356 () Bool)

(assert (=> b!14785 (=> (not res!11356) (not e!8879))))

(assert (=> b!14785 (= res!11356 (bvslt (_1!277 (h!994 l!522)) (_1!277 (h!994 (t!2834 l!522)))))))

(declare-fun b!14786 () Bool)

(assert (=> b!14786 (= e!8879 (isStrictlySorted!119 (t!2834 l!522)))))

(assert (= (and d!2397 (not res!11355)) b!14785))

(assert (= (and b!14785 res!11356) b!14786))

(declare-fun m!9881 () Bool)

(assert (=> b!14786 m!9881))

(assert (=> start!2194 d!2397))

(declare-fun d!2403 () Bool)

(declare-fun res!11365 () Bool)

(declare-fun e!8888 () Bool)

(assert (=> d!2403 (=> res!11365 e!8888)))

(assert (=> d!2403 (= res!11365 (is-Nil!429 Nil!429))))

(assert (=> d!2403 (= (forall!100 Nil!429 lambda!182) e!8888)))

(declare-fun b!14795 () Bool)

(declare-fun e!8889 () Bool)

(assert (=> b!14795 (= e!8888 e!8889)))

(declare-fun res!11366 () Bool)

(assert (=> b!14795 (=> (not res!11366) (not e!8889))))

(declare-fun dynLambda!95 (Int tuple2!554) Bool)

(assert (=> b!14795 (= res!11366 (dynLambda!95 lambda!182 (h!994 Nil!429)))))

(declare-fun b!14796 () Bool)

(assert (=> b!14796 (= e!8889 (forall!100 (t!2834 Nil!429) lambda!182))))

(assert (= (and d!2403 (not res!11365)) b!14795))

(assert (= (and b!14795 res!11366) b!14796))

(declare-fun b_lambda!959 () Bool)

(assert (=> (not b_lambda!959) (not b!14795)))

(declare-fun m!9883 () Bool)

(assert (=> b!14795 m!9883))

(declare-fun m!9885 () Bool)

(assert (=> b!14796 m!9885))

(assert (=> b!14772 d!2403))

(declare-fun d!2407 () Bool)

(assert (not d!2407))

(assert (=> b!14774 d!2407))

(declare-fun d!2411 () Bool)

(assert (=> d!2411 (= (head!796 l!522) (h!994 l!522))))

(assert (=> b!14774 d!2411))

(declare-fun b!14803 () Bool)

(declare-fun e!8894 () Bool)

(declare-fun tp!2372 () Bool)

(assert (=> b!14803 (= e!8894 (and tp_is_empty!737 tp!2372))))

(assert (=> b!14771 (= tp!2369 e!8894)))

(assert (= (and b!14771 (is-Cons!428 (t!2834 l!522))) b!14803))

(declare-fun b_lambda!963 () Bool)

(assert (= b_lambda!959 (or b!14772 b_lambda!963)))

(declare-fun bs!600 () Bool)

(declare-fun d!2415 () Bool)

(assert (= bs!600 (and d!2415 b!14772)))

(assert (=> bs!600 (= (dynLambda!95 lambda!182 (h!994 Nil!429)) (= (_2!277 (h!994 Nil!429)) value!159))))

(assert (=> b!14795 d!2415))

(push 1)

(assert (not b!14796))

(assert (not b_lambda!963))

(assert (not b!14786))

(assert tp_is_empty!737)

(assert (not b!14803))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

