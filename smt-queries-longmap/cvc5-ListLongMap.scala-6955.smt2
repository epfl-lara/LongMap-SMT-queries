; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87726 () Bool)

(assert start!87726)

(declare-fun res!680790 () Bool)

(declare-fun e!570724 () Bool)

(assert (=> start!87726 (=> (not res!680790) (not e!570724))))

(declare-datatypes ((B!1436 0))(
  ( (B!1437 (val!11802 Int)) )
))
(declare-datatypes ((tuple2!15150 0))(
  ( (tuple2!15151 (_1!7586 (_ BitVec 64)) (_2!7586 B!1436)) )
))
(declare-datatypes ((List!21436 0))(
  ( (Nil!21433) (Cons!21432 (h!22630 tuple2!15150) (t!30437 List!21436)) )
))
(declare-fun l!412 () List!21436)

(declare-fun isStrictlySorted!576 (List!21436) Bool)

(assert (=> start!87726 (= res!680790 (isStrictlySorted!576 l!412))))

(assert (=> start!87726 e!570724))

(declare-fun e!570723 () Bool)

(assert (=> start!87726 e!570723))

(declare-fun tp_is_empty!23503 () Bool)

(assert (=> start!87726 tp_is_empty!23503))

(declare-fun b!1014525 () Bool)

(declare-fun res!680788 () Bool)

(assert (=> b!1014525 (=> (not res!680788) (not e!570724))))

(declare-fun value!115 () B!1436)

(declare-datatypes ((List!21437 0))(
  ( (Nil!21434) (Cons!21433 (h!22631 (_ BitVec 64)) (t!30438 List!21437)) )
))
(declare-fun isEmpty!836 (List!21437) Bool)

(declare-fun getKeysOf!49 (List!21436 B!1436) List!21437)

(assert (=> b!1014525 (= res!680788 (not (isEmpty!836 (getKeysOf!49 (t!30437 l!412) value!115))))))

(declare-fun b!1014527 () Bool)

(declare-fun tp!70538 () Bool)

(assert (=> b!1014527 (= e!570723 (and tp_is_empty!23503 tp!70538))))

(declare-fun b!1014526 () Bool)

(declare-fun ListPrimitiveSize!115 (List!21436) Int)

(assert (=> b!1014526 (= e!570724 (>= (ListPrimitiveSize!115 (t!30437 l!412)) (ListPrimitiveSize!115 l!412)))))

(declare-fun b!1014524 () Bool)

(declare-fun res!680789 () Bool)

(assert (=> b!1014524 (=> (not res!680789) (not e!570724))))

(assert (=> b!1014524 (= res!680789 (and (not (= (_2!7586 (h!22630 l!412)) value!115)) (is-Cons!21432 l!412)))))

(assert (= (and start!87726 res!680790) b!1014524))

(assert (= (and b!1014524 res!680789) b!1014525))

(assert (= (and b!1014525 res!680788) b!1014526))

(assert (= (and start!87726 (is-Cons!21432 l!412)) b!1014527))

(declare-fun m!937077 () Bool)

(assert (=> start!87726 m!937077))

(declare-fun m!937079 () Bool)

(assert (=> b!1014525 m!937079))

(assert (=> b!1014525 m!937079))

(declare-fun m!937081 () Bool)

(assert (=> b!1014525 m!937081))

(declare-fun m!937083 () Bool)

(assert (=> b!1014526 m!937083))

(declare-fun m!937085 () Bool)

(assert (=> b!1014526 m!937085))

(push 1)

(assert (not b!1014527))

(assert (not b!1014525))

(assert (not start!87726))

(assert (not b!1014526))

(assert tp_is_empty!23503)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120777 () Bool)

(declare-fun res!680819 () Bool)

(declare-fun e!570747 () Bool)

(assert (=> d!120777 (=> res!680819 e!570747)))

(assert (=> d!120777 (= res!680819 (or (is-Nil!21433 l!412) (is-Nil!21433 (t!30437 l!412))))))

(assert (=> d!120777 (= (isStrictlySorted!576 l!412) e!570747)))

(declare-fun b!1014562 () Bool)

(declare-fun e!570748 () Bool)

(assert (=> b!1014562 (= e!570747 e!570748)))

(declare-fun res!680820 () Bool)

(assert (=> b!1014562 (=> (not res!680820) (not e!570748))))

(assert (=> b!1014562 (= res!680820 (bvslt (_1!7586 (h!22630 l!412)) (_1!7586 (h!22630 (t!30437 l!412)))))))

(declare-fun b!1014563 () Bool)

(assert (=> b!1014563 (= e!570748 (isStrictlySorted!576 (t!30437 l!412)))))

(assert (= (and d!120777 (not res!680819)) b!1014562))

(assert (= (and b!1014562 res!680820) b!1014563))

(declare-fun m!937109 () Bool)

(assert (=> b!1014563 m!937109))

(assert (=> start!87726 d!120777))

(declare-fun d!120781 () Bool)

(declare-fun lt!448618 () Int)

(assert (=> d!120781 (>= lt!448618 0)))

(declare-fun e!570755 () Int)

(assert (=> d!120781 (= lt!448618 e!570755)))

(declare-fun c!102712 () Bool)

(assert (=> d!120781 (= c!102712 (is-Nil!21433 (t!30437 l!412)))))

(assert (=> d!120781 (= (ListPrimitiveSize!115 (t!30437 l!412)) lt!448618)))

(declare-fun b!1014576 () Bool)

(assert (=> b!1014576 (= e!570755 0)))

(declare-fun b!1014577 () Bool)

(assert (=> b!1014577 (= e!570755 (+ 1 (ListPrimitiveSize!115 (t!30437 (t!30437 l!412)))))))

(assert (= (and d!120781 c!102712) b!1014576))

(assert (= (and d!120781 (not c!102712)) b!1014577))

(declare-fun m!937113 () Bool)

(assert (=> b!1014577 m!937113))

(assert (=> b!1014526 d!120781))

(declare-fun d!120791 () Bool)

(declare-fun lt!448619 () Int)

(assert (=> d!120791 (>= lt!448619 0)))

(declare-fun e!570756 () Int)

(assert (=> d!120791 (= lt!448619 e!570756)))

(declare-fun c!102713 () Bool)

(assert (=> d!120791 (= c!102713 (is-Nil!21433 l!412))))

(assert (=> d!120791 (= (ListPrimitiveSize!115 l!412) lt!448619)))

(declare-fun b!1014578 () Bool)

(assert (=> b!1014578 (= e!570756 0)))

(declare-fun b!1014579 () Bool)

(assert (=> b!1014579 (= e!570756 (+ 1 (ListPrimitiveSize!115 (t!30437 l!412))))))

(assert (= (and d!120791 c!102713) b!1014578))

(assert (= (and d!120791 (not c!102713)) b!1014579))

(assert (=> b!1014579 m!937083))

(assert (=> b!1014526 d!120791))

(declare-fun d!120793 () Bool)

(assert (=> d!120793 (= (isEmpty!836 (getKeysOf!49 (t!30437 l!412) value!115)) (is-Nil!21434 (getKeysOf!49 (t!30437 l!412) value!115)))))

(assert (=> b!1014525 d!120793))

(declare-fun b!1014647 () Bool)

(assert (=> b!1014647 true))

(assert (=> b!1014647 true))

(assert (=> b!1014647 true))

(declare-fun bs!29278 () Bool)

(declare-fun b!1014642 () Bool)

(assert (= bs!29278 (and b!1014642 b!1014647)))

(declare-fun lt!448705 () tuple2!15150)

(declare-fun lt!448698 () List!21436)

(declare-fun lt!448702 () tuple2!15150)

(declare-fun lambda!726 () Int)

(declare-fun lambda!724 () Int)

(declare-fun lt!448707 () List!21436)

(assert (=> bs!29278 (= (= (Cons!21432 lt!448702 lt!448698) (Cons!21432 lt!448705 lt!448707)) (= lambda!726 lambda!724))))

(assert (=> b!1014642 true))

(assert (=> b!1014642 true))

(assert (=> b!1014642 true))

(declare-fun bs!29280 () Bool)

(declare-fun d!120795 () Bool)

(assert (= bs!29280 (and d!120795 b!1014647)))

(declare-fun lambda!728 () Int)

(assert (=> bs!29280 (= (= (t!30437 l!412) (Cons!21432 lt!448705 lt!448707)) (= lambda!728 lambda!724))))

(declare-fun bs!29282 () Bool)

(assert (= bs!29282 (and d!120795 b!1014642)))

(assert (=> bs!29282 (= (= (t!30437 l!412) (Cons!21432 lt!448702 lt!448698)) (= lambda!728 lambda!726))))

(assert (=> d!120795 true))

(assert (=> d!120795 true))

(declare-fun lt!448696 () List!21437)

(declare-fun forall!243 (List!21437 Int) Bool)

(assert (=> d!120795 (forall!243 lt!448696 lambda!728)))

(declare-fun e!570791 () List!21437)

(assert (=> d!120795 (= lt!448696 e!570791)))

(declare-fun c!102743 () Bool)

(assert (=> d!120795 (= c!102743 (and (is-Cons!21432 (t!30437 l!412)) (= (_2!7586 (h!22630 (t!30437 l!412))) value!115)))))

(assert (=> d!120795 (isStrictlySorted!576 (t!30437 l!412))))

(assert (=> d!120795 (= (getKeysOf!49 (t!30437 l!412) value!115) lt!448696)))

(declare-datatypes ((Unit!33180 0))(
  ( (Unit!33181) )
))
(declare-fun e!570793 () Unit!33180)

(declare-fun lt!448697 () Unit!33180)

(assert (=> b!1014642 (= e!570793 lt!448697)))

(assert (=> b!1014642 (= lt!448698 (t!30437 (t!30437 l!412)))))

(declare-fun lt!448699 () List!21437)

(declare-fun call!42834 () List!21437)

(assert (=> b!1014642 (= lt!448699 call!42834)))

(assert (=> b!1014642 (= lt!448702 (h!22630 (t!30437 l!412)))))

(declare-fun call!42835 () Unit!33180)

(assert (=> b!1014642 (= lt!448697 call!42835)))

(declare-fun call!42837 () Bool)

(assert (=> b!1014642 call!42837))

(declare-fun bm!42831 () Bool)

(assert (=> bm!42831 (= call!42834 (getKeysOf!49 (t!30437 (t!30437 l!412)) value!115))))

(declare-fun b!1014643 () Bool)

(declare-fun Unit!33182 () Unit!33180)

(assert (=> b!1014643 (= e!570793 Unit!33182)))

(declare-fun b!1014644 () Bool)

(declare-fun lt!448700 () Unit!33180)

(assert (=> b!1014644 (= lt!448700 e!570793)))

(declare-fun c!102745 () Bool)

(declare-fun call!42836 () Bool)

(assert (=> b!1014644 (= c!102745 (not call!42836))))

(declare-fun lt!448701 () List!21437)

(assert (=> b!1014644 (= lt!448701 call!42834)))

(declare-fun e!570792 () List!21437)

(assert (=> b!1014644 (= e!570792 call!42834)))

(declare-fun b!1014645 () Bool)

(assert (=> b!1014645 (= e!570791 e!570792)))

(declare-fun c!102744 () Bool)

(assert (=> b!1014645 (= c!102744 (and (is-Cons!21432 (t!30437 l!412)) (not (= (_2!7586 (h!22630 (t!30437 l!412))) value!115))))))

(declare-fun bm!42832 () Bool)

(declare-fun lt!448706 () List!21437)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!37 (List!21436 List!21437 B!1436 tuple2!15150) Unit!33180)

(assert (=> bm!42832 (= call!42835 (lemmaForallGetValueByKeySameWithASmallerHead!37 (ite c!102743 lt!448707 lt!448698) (ite c!102743 lt!448706 lt!448699) value!115 (ite c!102743 lt!448705 lt!448702)))))

(declare-fun b!1014646 () Bool)

(assert (=> b!1014646 (= e!570792 Nil!21434)))

(declare-fun bm!42833 () Bool)

(assert (=> bm!42833 (= call!42837 (forall!243 (ite c!102743 lt!448706 lt!448699) (ite c!102743 lambda!724 lambda!726)))))

(assert (=> b!1014647 call!42837))

(declare-fun lt!448703 () Unit!33180)

(assert (=> b!1014647 (= lt!448703 call!42835)))

(assert (=> b!1014647 (= lt!448705 (h!22630 (t!30437 l!412)))))

(assert (=> b!1014647 (= lt!448706 call!42834)))

(assert (=> b!1014647 (= lt!448707 (t!30437 (t!30437 l!412)))))

(declare-fun e!570794 () Unit!33180)

(assert (=> b!1014647 (= e!570794 lt!448703)))

(declare-fun b!1014648 () Bool)

(declare-fun Unit!33184 () Unit!33180)

(assert (=> b!1014648 (= e!570794 Unit!33184)))

(declare-fun b!1014649 () Bool)

(assert (=> b!1014649 (= e!570791 (Cons!21433 (_1!7586 (h!22630 (t!30437 l!412))) call!42834))))

(declare-fun c!102742 () Bool)

(assert (=> b!1014649 (= c!102742 (not call!42836))))

(declare-fun lt!448704 () Unit!33180)

(assert (=> b!1014649 (= lt!448704 e!570794)))

(declare-fun bm!42834 () Bool)

(assert (=> bm!42834 (= call!42836 (isEmpty!836 call!42834))))

(assert (= (and d!120795 c!102743) b!1014649))

(assert (= (and d!120795 (not c!102743)) b!1014645))

(assert (= (and b!1014649 c!102742) b!1014647))

(assert (= (and b!1014649 (not c!102742)) b!1014648))

(assert (= (and b!1014645 c!102744) b!1014644))

(assert (= (and b!1014645 (not c!102744)) b!1014646))

(assert (= (and b!1014644 c!102745) b!1014642))

(assert (= (and b!1014644 (not c!102745)) b!1014643))

(assert (= (or b!1014647 b!1014642) bm!42832))

(assert (= (or b!1014647 b!1014642) bm!42833))

(assert (= (or b!1014649 b!1014647 b!1014642 b!1014644) bm!42831))

(assert (= (or b!1014649 b!1014644) bm!42834))

(declare-fun m!937121 () Bool)

(assert (=> bm!42832 m!937121))

(declare-fun m!937123 () Bool)

(assert (=> bm!42834 m!937123))

(declare-fun m!937125 () Bool)

(assert (=> d!120795 m!937125))

(assert (=> d!120795 m!937109))

(declare-fun m!937131 () Bool)

(assert (=> bm!42831 m!937131))

(declare-fun m!937137 () Bool)

(assert (=> bm!42833 m!937137))

(assert (=> b!1014525 d!120795))

(declare-fun b!1014671 () Bool)

(declare-fun e!570800 () Bool)

(declare-fun tp!70550 () Bool)

(assert (=> b!1014671 (= e!570800 (and tp_is_empty!23503 tp!70550))))

(assert (=> b!1014527 (= tp!70538 e!570800)))

(assert (= (and b!1014527 (is-Cons!21432 (t!30437 l!412))) b!1014671))

(push 1)

