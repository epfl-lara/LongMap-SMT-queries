; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2190 () Bool)

(assert start!2190)

(declare-fun b!14722 () Bool)

(assert (=> b!14722 true))

(declare-fun res!11316 () Bool)

(declare-fun e!8842 () Bool)

(assert (=> start!2190 (=> (not res!11316) (not e!8842))))

(declare-datatypes ((B!554 0))(
  ( (B!555 (val!375 Int)) )
))
(declare-datatypes ((tuple2!550 0))(
  ( (tuple2!551 (_1!275 (_ BitVec 64)) (_2!275 B!554)) )
))
(declare-datatypes ((List!430 0))(
  ( (Nil!427) (Cons!426 (h!992 tuple2!550) (t!2832 List!430)) )
))
(declare-fun l!522 () List!430)

(declare-fun isStrictlySorted!117 (List!430) Bool)

(assert (=> start!2190 (= res!11316 (isStrictlySorted!117 l!522))))

(assert (=> start!2190 e!8842))

(declare-fun e!8839 () Bool)

(assert (=> start!2190 e!8839))

(declare-fun tp_is_empty!733 () Bool)

(assert (=> start!2190 tp_is_empty!733))

(declare-fun b!14719 () Bool)

(declare-fun e!8840 () Bool)

(declare-fun e!8843 () Bool)

(assert (=> b!14719 (= e!8840 e!8843)))

(declare-fun res!11319 () Bool)

(assert (=> b!14719 (= res!11319 false)))

(assert (=> b!14719 (=> (not res!11319) (not e!8843))))

(declare-fun b!14720 () Bool)

(declare-fun tp!2363 () Bool)

(assert (=> b!14720 (= e!8839 (and tp_is_empty!733 tp!2363))))

(declare-fun b!14721 () Bool)

(declare-fun res!11317 () Bool)

(assert (=> b!14721 (=> (not res!11317) (not e!8842))))

(declare-fun value!159 () B!554)

(assert (=> b!14721 (= res!11317 (and (or (not (is-Cons!426 l!522)) (not (= (_2!275 (h!992 l!522)) value!159))) (or (not (is-Cons!426 l!522)) (= (_2!275 (h!992 l!522)) value!159)) (is-Nil!427 l!522)))))

(declare-fun res!11318 () Bool)

(declare-fun e!8841 () Bool)

(assert (=> b!14722 (=> res!11318 e!8841)))

(declare-fun lambda!176 () Int)

(declare-fun forall!98 (List!430 Int) Bool)

(assert (=> b!14722 (= res!11318 (not (forall!98 Nil!427 lambda!176)))))

(declare-fun b!14723 () Bool)

(assert (=> b!14723 (= e!8841 e!8840)))

(declare-fun c!1394 () Bool)

(declare-fun isEmpty!105 (List!430) Bool)

(assert (=> b!14723 (= c!1394 (isEmpty!105 l!522))))

(declare-fun b!14724 () Bool)

(assert (=> b!14724 (= e!8840 false)))

(declare-fun b!14725 () Bool)

(assert (=> b!14725 (= e!8842 e!8841)))

(declare-fun res!11320 () Bool)

(assert (=> b!14725 (=> res!11320 e!8841)))

(assert (=> b!14725 (= res!11320 false)))

(declare-fun b!14726 () Bool)

(declare-fun head!794 (List!430) tuple2!550)

(assert (=> b!14726 (= e!8843 (bvslt (_1!275 (head!794 Nil!427)) (_1!275 (head!794 l!522))))))

(assert (= (and start!2190 res!11316) b!14721))

(assert (= (and b!14721 res!11317) b!14725))

(assert (= (and b!14725 (not res!11320)) b!14722))

(assert (= (and b!14722 (not res!11318)) b!14723))

(assert (= (and b!14723 c!1394) b!14724))

(assert (= (and b!14723 (not c!1394)) b!14719))

(assert (= (and b!14719 res!11319) b!14726))

(assert (= (and start!2190 (is-Cons!426 l!522)) b!14720))

(declare-fun m!9851 () Bool)

(assert (=> start!2190 m!9851))

(declare-fun m!9853 () Bool)

(assert (=> b!14722 m!9853))

(declare-fun m!9855 () Bool)

(assert (=> b!14723 m!9855))

(declare-fun m!9857 () Bool)

(assert (=> b!14726 m!9857))

(declare-fun m!9859 () Bool)

(assert (=> b!14726 m!9859))

(push 1)

(assert (not b!14726))

(assert (not b!14723))

(assert (not start!2190))

(assert tp_is_empty!733)

(assert (not b!14722))

(assert (not b!14720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2399 () Bool)

(assert (not d!2399))

(assert (=> b!14726 d!2399))

(declare-fun d!2401 () Bool)

(assert (=> d!2401 (= (head!794 l!522) (h!992 l!522))))

(assert (=> b!14726 d!2401))

(declare-fun d!2405 () Bool)

(declare-fun res!11367 () Bool)

(declare-fun e!8890 () Bool)

(assert (=> d!2405 (=> res!11367 e!8890)))

(assert (=> d!2405 (= res!11367 (is-Nil!427 Nil!427))))

(assert (=> d!2405 (= (forall!98 Nil!427 lambda!176) e!8890)))

(declare-fun b!14797 () Bool)

(declare-fun e!8891 () Bool)

(assert (=> b!14797 (= e!8890 e!8891)))

(declare-fun res!11368 () Bool)

(assert (=> b!14797 (=> (not res!11368) (not e!8891))))

(declare-fun dynLambda!94 (Int tuple2!550) Bool)

(assert (=> b!14797 (= res!11368 (dynLambda!94 lambda!176 (h!992 Nil!427)))))

(declare-fun b!14798 () Bool)

(assert (=> b!14798 (= e!8891 (forall!98 (t!2832 Nil!427) lambda!176))))

(assert (= (and d!2405 (not res!11367)) b!14797))

(assert (= (and b!14797 res!11368) b!14798))

(declare-fun b_lambda!961 () Bool)

(assert (=> (not b_lambda!961) (not b!14797)))

(declare-fun m!9887 () Bool)

(assert (=> b!14797 m!9887))

(declare-fun m!9889 () Bool)

(assert (=> b!14798 m!9889))

(assert (=> b!14722 d!2405))

(declare-fun d!2409 () Bool)

(assert (=> d!2409 (= (isEmpty!105 l!522) (is-Nil!427 l!522))))

(assert (=> b!14723 d!2409))

(declare-fun d!2413 () Bool)

(declare-fun res!11373 () Bool)

(declare-fun e!8899 () Bool)

(assert (=> d!2413 (=> res!11373 e!8899)))

(assert (=> d!2413 (= res!11373 (or (is-Nil!427 l!522) (is-Nil!427 (t!2832 l!522))))))

(assert (=> d!2413 (= (isStrictlySorted!117 l!522) e!8899)))

(declare-fun b!14808 () Bool)

(declare-fun e!8900 () Bool)

(assert (=> b!14808 (= e!8899 e!8900)))

(declare-fun res!11374 () Bool)

(assert (=> b!14808 (=> (not res!11374) (not e!8900))))

(assert (=> b!14808 (= res!11374 (bvslt (_1!275 (h!992 l!522)) (_1!275 (h!992 (t!2832 l!522)))))))

(declare-fun b!14809 () Bool)

(assert (=> b!14809 (= e!8900 (isStrictlySorted!117 (t!2832 l!522)))))

(assert (= (and d!2413 (not res!11373)) b!14808))

(assert (= (and b!14808 res!11374) b!14809))

(declare-fun m!9891 () Bool)

(assert (=> b!14809 m!9891))

(assert (=> start!2190 d!2413))

(declare-fun b!14814 () Bool)

(declare-fun e!8903 () Bool)

(declare-fun tp!2375 () Bool)

(assert (=> b!14814 (= e!8903 (and tp_is_empty!733 tp!2375))))

(assert (=> b!14720 (= tp!2363 e!8903)))

(assert (= (and b!14720 (is-Cons!426 (t!2832 l!522))) b!14814))

(declare-fun b_lambda!965 () Bool)

(assert (= b_lambda!961 (or b!14722 b_lambda!965)))

(declare-fun bs!601 () Bool)

(declare-fun d!2417 () Bool)

(assert (= bs!601 (and d!2417 b!14722)))

(assert (=> bs!601 (= (dynLambda!94 lambda!176 (h!992 Nil!427)) (= (_2!275 (h!992 Nil!427)) value!159))))

(assert (=> b!14797 d!2417))

(push 1)

(assert (not b!14814))

(assert (not b_lambda!965))

(assert tp_is_empty!733)

(assert (not b!14798))

(assert (not b!14809))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

