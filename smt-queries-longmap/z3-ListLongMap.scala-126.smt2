; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2190 () Bool)

(assert start!2190)

(declare-fun b!14726 () Bool)

(assert (=> b!14726 true))

(declare-fun b!14719 () Bool)

(declare-fun e!8840 () Bool)

(declare-fun tp_is_empty!733 () Bool)

(declare-fun tp!2363 () Bool)

(assert (=> b!14719 (= e!8840 (and tp_is_empty!733 tp!2363))))

(declare-fun res!11320 () Bool)

(declare-fun e!8841 () Bool)

(assert (=> start!2190 (=> (not res!11320) (not e!8841))))

(declare-datatypes ((B!554 0))(
  ( (B!555 (val!375 Int)) )
))
(declare-datatypes ((tuple2!546 0))(
  ( (tuple2!547 (_1!273 (_ BitVec 64)) (_2!273 B!554)) )
))
(declare-datatypes ((List!426 0))(
  ( (Nil!423) (Cons!422 (h!988 tuple2!546) (t!2828 List!426)) )
))
(declare-fun l!522 () List!426)

(declare-fun isStrictlySorted!114 (List!426) Bool)

(assert (=> start!2190 (= res!11320 (isStrictlySorted!114 l!522))))

(assert (=> start!2190 e!8841))

(assert (=> start!2190 e!8840))

(assert (=> start!2190 tp_is_empty!733))

(declare-fun b!14720 () Bool)

(declare-fun e!8843 () Bool)

(declare-fun head!794 (List!426) tuple2!546)

(assert (=> b!14720 (= e!8843 (bvslt (_1!273 (head!794 Nil!423)) (_1!273 (head!794 l!522))))))

(declare-fun b!14721 () Bool)

(declare-fun e!8839 () Bool)

(assert (=> b!14721 (= e!8841 e!8839)))

(declare-fun res!11318 () Bool)

(assert (=> b!14721 (=> res!11318 e!8839)))

(assert (=> b!14721 (= res!11318 false)))

(declare-fun b!14722 () Bool)

(declare-fun e!8842 () Bool)

(assert (=> b!14722 (= e!8839 e!8842)))

(declare-fun c!1394 () Bool)

(declare-fun isEmpty!105 (List!426) Bool)

(assert (=> b!14722 (= c!1394 (isEmpty!105 l!522))))

(declare-fun b!14723 () Bool)

(declare-fun res!11316 () Bool)

(assert (=> b!14723 (=> (not res!11316) (not e!8841))))

(declare-fun value!159 () B!554)

(get-info :version)

(assert (=> b!14723 (= res!11316 (and (or (not ((_ is Cons!422) l!522)) (not (= (_2!273 (h!988 l!522)) value!159))) (or (not ((_ is Cons!422) l!522)) (= (_2!273 (h!988 l!522)) value!159)) ((_ is Nil!423) l!522)))))

(declare-fun b!14724 () Bool)

(assert (=> b!14724 (= e!8842 e!8843)))

(declare-fun res!11317 () Bool)

(assert (=> b!14724 (= res!11317 false)))

(assert (=> b!14724 (=> (not res!11317) (not e!8843))))

(declare-fun b!14725 () Bool)

(assert (=> b!14725 (= e!8842 false)))

(declare-fun res!11319 () Bool)

(assert (=> b!14726 (=> res!11319 e!8839)))

(declare-fun lambda!176 () Int)

(declare-fun forall!98 (List!426 Int) Bool)

(assert (=> b!14726 (= res!11319 (not (forall!98 Nil!423 lambda!176)))))

(assert (= (and start!2190 res!11320) b!14723))

(assert (= (and b!14723 res!11316) b!14721))

(assert (= (and b!14721 (not res!11318)) b!14726))

(assert (= (and b!14726 (not res!11319)) b!14722))

(assert (= (and b!14722 c!1394) b!14725))

(assert (= (and b!14722 (not c!1394)) b!14724))

(assert (= (and b!14724 res!11317) b!14720))

(assert (= (and start!2190 ((_ is Cons!422) l!522)) b!14719))

(declare-fun m!9843 () Bool)

(assert (=> start!2190 m!9843))

(declare-fun m!9845 () Bool)

(assert (=> b!14720 m!9845))

(declare-fun m!9847 () Bool)

(assert (=> b!14720 m!9847))

(declare-fun m!9849 () Bool)

(assert (=> b!14722 m!9849))

(declare-fun m!9851 () Bool)

(assert (=> b!14726 m!9851))

(check-sat (not b!14720) (not b!14719) (not b!14722) (not b!14726) (not start!2190) tp_is_empty!733)
(check-sat)
(get-model)

(declare-fun d!2405 () Bool)

(declare-fun res!11371 () Bool)

(declare-fun e!8894 () Bool)

(assert (=> d!2405 (=> res!11371 e!8894)))

(assert (=> d!2405 (= res!11371 ((_ is Nil!423) Nil!423))))

(assert (=> d!2405 (= (forall!98 Nil!423 lambda!176) e!8894)))

(declare-fun b!14801 () Bool)

(declare-fun e!8895 () Bool)

(assert (=> b!14801 (= e!8894 e!8895)))

(declare-fun res!11372 () Bool)

(assert (=> b!14801 (=> (not res!11372) (not e!8895))))

(declare-fun dynLambda!93 (Int tuple2!546) Bool)

(assert (=> b!14801 (= res!11372 (dynLambda!93 lambda!176 (h!988 Nil!423)))))

(declare-fun b!14802 () Bool)

(assert (=> b!14802 (= e!8895 (forall!98 (t!2828 Nil!423) lambda!176))))

(assert (= (and d!2405 (not res!11371)) b!14801))

(assert (= (and b!14801 res!11372) b!14802))

(declare-fun b_lambda!961 () Bool)

(assert (=> (not b_lambda!961) (not b!14801)))

(declare-fun m!9879 () Bool)

(assert (=> b!14801 m!9879))

(declare-fun m!9881 () Bool)

(assert (=> b!14802 m!9881))

(assert (=> b!14726 d!2405))

(declare-fun d!2409 () Bool)

(assert (=> d!2409 (= (isEmpty!105 l!522) ((_ is Nil!423) l!522))))

(assert (=> b!14722 d!2409))

(declare-fun d!2411 () Bool)

(declare-fun res!11379 () Bool)

(declare-fun e!8905 () Bool)

(assert (=> d!2411 (=> res!11379 e!8905)))

(assert (=> d!2411 (= res!11379 (or ((_ is Nil!423) l!522) ((_ is Nil!423) (t!2828 l!522))))))

(assert (=> d!2411 (= (isStrictlySorted!114 l!522) e!8905)))

(declare-fun b!14814 () Bool)

(declare-fun e!8906 () Bool)

(assert (=> b!14814 (= e!8905 e!8906)))

(declare-fun res!11380 () Bool)

(assert (=> b!14814 (=> (not res!11380) (not e!8906))))

(assert (=> b!14814 (= res!11380 (bvslt (_1!273 (h!988 l!522)) (_1!273 (h!988 (t!2828 l!522)))))))

(declare-fun b!14815 () Bool)

(assert (=> b!14815 (= e!8906 (isStrictlySorted!114 (t!2828 l!522)))))

(assert (= (and d!2411 (not res!11379)) b!14814))

(assert (= (and b!14814 res!11380) b!14815))

(declare-fun m!9887 () Bool)

(assert (=> b!14815 m!9887))

(assert (=> start!2190 d!2411))

(declare-fun d!2421 () Bool)

(assert (not d!2421))

(assert (=> b!14720 d!2421))

(declare-fun d!2423 () Bool)

(assert (=> d!2423 (= (head!794 l!522) (h!988 l!522))))

(assert (=> b!14720 d!2423))

(declare-fun b!14820 () Bool)

(declare-fun e!8909 () Bool)

(declare-fun tp!2375 () Bool)

(assert (=> b!14820 (= e!8909 (and tp_is_empty!733 tp!2375))))

(assert (=> b!14719 (= tp!2363 e!8909)))

(assert (= (and b!14719 ((_ is Cons!422) (t!2828 l!522))) b!14820))

(declare-fun b_lambda!967 () Bool)

(assert (= b_lambda!961 (or b!14726 b_lambda!967)))

(declare-fun bs!601 () Bool)

(declare-fun d!2427 () Bool)

(assert (= bs!601 (and d!2427 b!14726)))

(assert (=> bs!601 (= (dynLambda!93 lambda!176 (h!988 Nil!423)) (= (_2!273 (h!988 Nil!423)) value!159))))

(assert (=> b!14801 d!2427))

(check-sat (not b_lambda!967) tp_is_empty!733 (not b!14802) (not b!14820) (not b!14815))
(check-sat)
