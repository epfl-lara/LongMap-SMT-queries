; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87760 () Bool)

(assert start!87760)

(declare-fun b!1014635 () Bool)

(assert (=> b!1014635 true))

(assert (=> b!1014635 true))

(declare-fun b!1014633 () Bool)

(declare-fun res!680818 () Bool)

(declare-fun e!570768 () Bool)

(assert (=> b!1014633 (=> (not res!680818) (not e!570768))))

(declare-datatypes ((B!1446 0))(
  ( (B!1447 (val!11807 Int)) )
))
(declare-datatypes ((tuple2!15240 0))(
  ( (tuple2!15241 (_1!7631 (_ BitVec 64)) (_2!7631 B!1446)) )
))
(declare-datatypes ((List!21481 0))(
  ( (Nil!21478) (Cons!21477 (h!22675 tuple2!15240) (t!30473 List!21481)) )
))
(declare-fun l!412 () List!21481)

(declare-fun value!115 () B!1446)

(assert (=> b!1014633 (= res!680818 (and (not (= (_2!7631 (h!22675 l!412)) value!115)) (is-Cons!21477 l!412)))))

(declare-fun b!1014634 () Bool)

(declare-fun e!570769 () Bool)

(declare-fun e!570770 () Bool)

(assert (=> b!1014634 (= e!570769 e!570770)))

(declare-fun res!680817 () Bool)

(assert (=> b!1014634 (=> res!680817 e!570770)))

(declare-fun isStrictlySorted!577 (List!21481) Bool)

(assert (=> b!1014634 (= res!680817 (not (isStrictlySorted!577 (t!30473 l!412))))))

(declare-fun res!680815 () Bool)

(assert (=> b!1014635 (=> res!680815 e!570770)))

(declare-datatypes ((List!21482 0))(
  ( (Nil!21479) (Cons!21478 (h!22676 (_ BitVec 64)) (t!30474 List!21482)) )
))
(declare-fun lt!448540 () List!21482)

(declare-fun lambda!746 () Int)

(declare-fun forall!250 (List!21482 Int) Bool)

(assert (=> b!1014635 (= res!680815 (not (forall!250 lt!448540 lambda!746)))))

(declare-fun res!680816 () Bool)

(assert (=> start!87760 (=> (not res!680816) (not e!570768))))

(assert (=> start!87760 (= res!680816 (isStrictlySorted!577 l!412))))

(assert (=> start!87760 e!570768))

(declare-fun e!570767 () Bool)

(assert (=> start!87760 e!570767))

(declare-fun tp_is_empty!23513 () Bool)

(assert (=> start!87760 tp_is_empty!23513))

(declare-fun b!1014636 () Bool)

(declare-fun tp!70563 () Bool)

(assert (=> b!1014636 (= e!570767 (and tp_is_empty!23513 tp!70563))))

(declare-fun b!1014637 () Bool)

(declare-fun res!680814 () Bool)

(assert (=> b!1014637 (=> res!680814 e!570770)))

(declare-fun isEmpty!849 (List!21481) Bool)

(assert (=> b!1014637 (= res!680814 (isEmpty!849 (t!30473 l!412)))))

(declare-fun b!1014638 () Bool)

(declare-fun head!942 (List!21481) tuple2!15240)

(assert (=> b!1014638 (= e!570770 (bvsge (_1!7631 (h!22675 l!412)) (_1!7631 (head!942 (t!30473 l!412)))))))

(declare-fun b!1014639 () Bool)

(assert (=> b!1014639 (= e!570768 e!570769)))

(declare-fun res!680819 () Bool)

(assert (=> b!1014639 (=> (not res!680819) (not e!570769))))

(declare-fun isEmpty!850 (List!21482) Bool)

(assert (=> b!1014639 (= res!680819 (not (isEmpty!850 lt!448540)))))

(declare-fun getKeysOf!54 (List!21481 B!1446) List!21482)

(assert (=> b!1014639 (= lt!448540 (getKeysOf!54 (t!30473 l!412) value!115))))

(assert (= (and start!87760 res!680816) b!1014633))

(assert (= (and b!1014633 res!680818) b!1014639))

(assert (= (and b!1014639 res!680819) b!1014634))

(assert (= (and b!1014634 (not res!680817)) b!1014637))

(assert (= (and b!1014637 (not res!680814)) b!1014635))

(assert (= (and b!1014635 (not res!680815)) b!1014638))

(assert (= (and start!87760 (is-Cons!21477 l!412)) b!1014636))

(declare-fun m!936569 () Bool)

(assert (=> start!87760 m!936569))

(declare-fun m!936571 () Bool)

(assert (=> b!1014637 m!936571))

(declare-fun m!936573 () Bool)

(assert (=> b!1014635 m!936573))

(declare-fun m!936575 () Bool)

(assert (=> b!1014634 m!936575))

(declare-fun m!936577 () Bool)

(assert (=> b!1014638 m!936577))

(declare-fun m!936579 () Bool)

(assert (=> b!1014639 m!936579))

(declare-fun m!936581 () Bool)

(assert (=> b!1014639 m!936581))

(push 1)

(assert (not b!1014639))

(assert (not b!1014638))

(assert (not b!1014634))

(assert (not start!87760))

(assert (not b!1014637))

(assert (not b!1014635))

(assert tp_is_empty!23513)

(assert (not b!1014636))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120679 () Bool)

(assert (=> d!120679 (= (isEmpty!849 (t!30473 l!412)) (is-Nil!21478 (t!30473 l!412)))))

(assert (=> b!1014637 d!120679))

(declare-fun d!120681 () Bool)

(declare-fun res!680836 () Bool)

(declare-fun e!570787 () Bool)

(assert (=> d!120681 (=> res!680836 e!570787)))

(assert (=> d!120681 (= res!680836 (is-Nil!21479 lt!448540))))

(assert (=> d!120681 (= (forall!250 lt!448540 lambda!746) e!570787)))

(declare-fun b!1014660 () Bool)

(declare-fun e!570788 () Bool)

(assert (=> b!1014660 (= e!570787 e!570788)))

(declare-fun res!680837 () Bool)

(assert (=> b!1014660 (=> (not res!680837) (not e!570788))))

(declare-fun dynLambda!1883 (Int (_ BitVec 64)) Bool)

(assert (=> b!1014660 (= res!680837 (dynLambda!1883 lambda!746 (h!22676 lt!448540)))))

(declare-fun b!1014661 () Bool)

(assert (=> b!1014661 (= e!570788 (forall!250 (t!30474 lt!448540) lambda!746))))

(assert (= (and d!120681 (not res!680836)) b!1014660))

(assert (= (and b!1014660 res!680837) b!1014661))

(declare-fun b_lambda!15351 () Bool)

(assert (=> (not b_lambda!15351) (not b!1014660)))

(declare-fun m!936587 () Bool)

(assert (=> b!1014660 m!936587))

(declare-fun m!936589 () Bool)

(assert (=> b!1014661 m!936589))

(assert (=> b!1014635 d!120681))

(declare-fun d!120687 () Bool)

(declare-fun res!680842 () Bool)

(declare-fun e!570793 () Bool)

(assert (=> d!120687 (=> res!680842 e!570793)))

(assert (=> d!120687 (= res!680842 (or (is-Nil!21478 (t!30473 l!412)) (is-Nil!21478 (t!30473 (t!30473 l!412)))))))

(assert (=> d!120687 (= (isStrictlySorted!577 (t!30473 l!412)) e!570793)))

(declare-fun b!1014666 () Bool)

(declare-fun e!570794 () Bool)

(assert (=> b!1014666 (= e!570793 e!570794)))

(declare-fun res!680843 () Bool)

(assert (=> b!1014666 (=> (not res!680843) (not e!570794))))

(assert (=> b!1014666 (= res!680843 (bvslt (_1!7631 (h!22675 (t!30473 l!412))) (_1!7631 (h!22675 (t!30473 (t!30473 l!412))))))))

(declare-fun b!1014667 () Bool)

(assert (=> b!1014667 (= e!570794 (isStrictlySorted!577 (t!30473 (t!30473 l!412))))))

(assert (= (and d!120687 (not res!680842)) b!1014666))

(assert (= (and b!1014666 res!680843) b!1014667))

(declare-fun m!936591 () Bool)

(assert (=> b!1014667 m!936591))

(assert (=> b!1014634 d!120687))

(declare-fun d!120689 () Bool)

(declare-fun res!680844 () Bool)

(declare-fun e!570795 () Bool)

(assert (=> d!120689 (=> res!680844 e!570795)))

(assert (=> d!120689 (= res!680844 (or (is-Nil!21478 l!412) (is-Nil!21478 (t!30473 l!412))))))

(assert (=> d!120689 (= (isStrictlySorted!577 l!412) e!570795)))

(declare-fun b!1014668 () Bool)

(declare-fun e!570796 () Bool)

(assert (=> b!1014668 (= e!570795 e!570796)))

(declare-fun res!680845 () Bool)

(assert (=> b!1014668 (=> (not res!680845) (not e!570796))))

(assert (=> b!1014668 (= res!680845 (bvslt (_1!7631 (h!22675 l!412)) (_1!7631 (h!22675 (t!30473 l!412)))))))

(declare-fun b!1014669 () Bool)

(assert (=> b!1014669 (= e!570796 (isStrictlySorted!577 (t!30473 l!412)))))

(assert (= (and d!120689 (not res!680844)) b!1014668))

(assert (= (and b!1014668 res!680845) b!1014669))

(assert (=> b!1014669 m!936575))

(assert (=> start!87760 d!120689))

(declare-fun d!120691 () Bool)

(assert (=> d!120691 (= (isEmpty!850 lt!448540) (is-Nil!21479 lt!448540))))

(assert (=> b!1014639 d!120691))

(declare-fun bs!29272 () Bool)

(declare-fun b!1014749 () Bool)

(assert (= bs!29272 (and b!1014749 b!1014635)))

(declare-fun lambda!771 () Int)

(declare-fun lt!448648 () List!21481)

(declare-fun lt!448645 () tuple2!15240)

(assert (=> bs!29272 (= (= (Cons!21477 lt!448645 lt!448648) (t!30473 l!412)) (= lambda!771 lambda!746))))

(assert (=> b!1014749 true))

(assert (=> b!1014749 true))

(assert (=> b!1014749 true))

(declare-fun bs!29274 () Bool)

(declare-fun b!1014746 () Bool)

(assert (= bs!29274 (and b!1014746 b!1014635)))

(declare-fun lt!448640 () tuple2!15240)

(declare-fun lambda!772 () Int)

(declare-fun lt!448638 () List!21481)

(assert (=> bs!29274 (= (= (Cons!21477 lt!448640 lt!448638) (t!30473 l!412)) (= lambda!772 lambda!746))))

(declare-fun bs!29275 () Bool)

(assert (= bs!29275 (and b!1014746 b!1014749)))

(assert (=> bs!29275 (= (= (Cons!21477 lt!448640 lt!448638) (Cons!21477 lt!448645 lt!448648)) (= lambda!772 lambda!771))))

(assert (=> b!1014746 true))

(assert (=> b!1014746 true))

(assert (=> b!1014746 true))

(declare-fun bs!29276 () Bool)

(declare-fun d!120693 () Bool)

(assert (= bs!29276 (and d!120693 b!1014635)))

(declare-fun lambda!773 () Int)

(assert (=> bs!29276 (= lambda!773 lambda!746)))

(declare-fun bs!29277 () Bool)

(assert (= bs!29277 (and d!120693 b!1014749)))

(assert (=> bs!29277 (= (= (t!30473 l!412) (Cons!21477 lt!448645 lt!448648)) (= lambda!773 lambda!771))))

(declare-fun bs!29278 () Bool)

(assert (= bs!29278 (and d!120693 b!1014746)))

(assert (=> bs!29278 (= (= (t!30473 l!412) (Cons!21477 lt!448640 lt!448638)) (= lambda!773 lambda!772))))

(assert (=> d!120693 true))

(assert (=> d!120693 true))

(declare-fun b!1014744 () Bool)

(declare-datatypes ((Unit!33086 0))(
  ( (Unit!33087) )
))
(declare-fun e!570838 () Unit!33086)

(declare-fun Unit!33088 () Unit!33086)

(assert (=> b!1014744 (= e!570838 Unit!33088)))

(declare-fun bm!42856 () Bool)

(declare-fun call!42859 () Bool)

(declare-fun call!42862 () List!21482)

(assert (=> bm!42856 (= call!42859 (isEmpty!850 call!42862))))

(declare-fun lt!448637 () List!21482)

(declare-fun call!42860 () Unit!33086)

(declare-fun bm!42857 () Bool)

(declare-fun lt!448641 () List!21482)

(declare-fun c!102755 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!43 (List!21481 List!21482 B!1446 tuple2!15240) Unit!33086)

(assert (=> bm!42857 (= call!42860 (lemmaForallGetValueByKeySameWithASmallerHead!43 (ite c!102755 lt!448648 lt!448638) (ite c!102755 lt!448641 lt!448637) value!115 (ite c!102755 lt!448645 lt!448640)))))

(declare-fun call!42861 () Bool)

(declare-fun bm!42858 () Bool)

(assert (=> bm!42858 (= call!42861 (forall!250 (ite c!102755 lt!448641 lt!448637) (ite c!102755 lambda!771 lambda!772)))))

(declare-fun b!1014745 () Bool)

(declare-fun e!570836 () List!21482)

(declare-fun e!570837 () List!21482)

(assert (=> b!1014745 (= e!570836 e!570837)))

(declare-fun c!102756 () Bool)

(assert (=> b!1014745 (= c!102756 (and (is-Cons!21477 (t!30473 l!412)) (not (= (_2!7631 (h!22675 (t!30473 l!412))) value!115))))))

(declare-fun e!570835 () Unit!33086)

(declare-fun lt!448646 () Unit!33086)

(assert (=> b!1014746 (= e!570835 lt!448646)))

(assert (=> b!1014746 (= lt!448638 (t!30473 (t!30473 l!412)))))

(assert (=> b!1014746 (= lt!448637 call!42862)))

(assert (=> b!1014746 (= lt!448640 (h!22675 (t!30473 l!412)))))

(assert (=> b!1014746 (= lt!448646 call!42860)))

(assert (=> b!1014746 call!42861))

(declare-fun b!1014747 () Bool)

(assert (=> b!1014747 (= e!570836 (Cons!21478 (_1!7631 (h!22675 (t!30473 l!412))) call!42862))))

(declare-fun c!102754 () Bool)

(assert (=> b!1014747 (= c!102754 (not call!42859))))

(declare-fun lt!448644 () Unit!33086)

(assert (=> b!1014747 (= lt!448644 e!570838)))

(declare-fun b!1014748 () Bool)

(assert (=> b!1014748 (= e!570837 Nil!21479)))

(declare-fun lt!448642 () List!21482)

(assert (=> d!120693 (forall!250 lt!448642 lambda!773)))

(assert (=> d!120693 (= lt!448642 e!570836)))

(assert (=> d!120693 (= c!102755 (and (is-Cons!21477 (t!30473 l!412)) (= (_2!7631 (h!22675 (t!30473 l!412))) value!115)))))

(assert (=> d!120693 (isStrictlySorted!577 (t!30473 l!412))))

(assert (=> d!120693 (= (getKeysOf!54 (t!30473 l!412) value!115) lt!448642)))

(assert (=> b!1014749 call!42861))

(declare-fun lt!448643 () Unit!33086)

(assert (=> b!1014749 (= lt!448643 call!42860)))

(assert (=> b!1014749 (= lt!448645 (h!22675 (t!30473 l!412)))))

(assert (=> b!1014749 (= lt!448641 call!42862)))

(assert (=> b!1014749 (= lt!448648 (t!30473 (t!30473 l!412)))))

(assert (=> b!1014749 (= e!570838 lt!448643)))

(declare-fun b!1014750 () Bool)

(declare-fun lt!448639 () Unit!33086)

(assert (=> b!1014750 (= lt!448639 e!570835)))

(declare-fun c!102757 () Bool)

(assert (=> b!1014750 (= c!102757 (not call!42859))))

(declare-fun lt!448647 () List!21482)

(assert (=> b!1014750 (= lt!448647 call!42862)))

(assert (=> b!1014750 (= e!570837 call!42862)))

(declare-fun bm!42859 () Bool)

(assert (=> bm!42859 (= call!42862 (getKeysOf!54 (t!30473 (t!30473 l!412)) value!115))))

(declare-fun b!1014751 () Bool)

(declare-fun Unit!33093 () Unit!33086)

(assert (=> b!1014751 (= e!570835 Unit!33093)))

(assert (= (and d!120693 c!102755) b!1014747))

(assert (= (and d!120693 (not c!102755)) b!1014745))

(assert (= (and b!1014747 c!102754) b!1014749))

(assert (= (and b!1014747 (not c!102754)) b!1014744))

(assert (= (and b!1014745 c!102756) b!1014750))

(assert (= (and b!1014745 (not c!102756)) b!1014748))

(assert (= (and b!1014750 c!102757) b!1014746))

(assert (= (and b!1014750 (not c!102757)) b!1014751))

(assert (= (or b!1014749 b!1014746) bm!42857))

(assert (= (or b!1014749 b!1014746) bm!42858))

(assert (= (or b!1014747 b!1014749 b!1014750 b!1014746) bm!42859))

(assert (= (or b!1014747 b!1014750) bm!42856))

(declare-fun m!936619 () Bool)

(assert (=> bm!42857 m!936619))

(declare-fun m!936621 () Bool)

(assert (=> bm!42858 m!936621))

(declare-fun m!936623 () Bool)

(assert (=> bm!42856 m!936623))

(declare-fun m!936625 () Bool)

(assert (=> bm!42859 m!936625))

(declare-fun m!936627 () Bool)

(assert (=> d!120693 m!936627))

(assert (=> d!120693 m!936575))

(assert (=> b!1014639 d!120693))

(declare-fun d!120711 () Bool)

(assert (=> d!120711 (= (head!942 (t!30473 l!412)) (h!22675 (t!30473 l!412)))))

(assert (=> b!1014638 d!120711))

(declare-fun b!1014771 () Bool)

(declare-fun e!570852 () Bool)

(declare-fun tp!70569 () Bool)

(assert (=> b!1014771 (= e!570852 (and tp_is_empty!23513 tp!70569))))

(assert (=> b!1014636 (= tp!70563 e!570852)))

(assert (= (and b!1014636 (is-Cons!21477 (t!30473 l!412))) b!1014771))

(declare-fun b_lambda!15355 () Bool)

(assert (= b_lambda!15351 (or b!1014635 b_lambda!15355)))

(declare-fun bs!29279 () Bool)

(declare-fun d!120713 () Bool)

(assert (= bs!29279 (and d!120713 b!1014635)))

(declare-datatypes ((Option!583 0))(
  ( (Some!582 (v!14430 B!1446)) (None!581) )
))
(declare-fun getValueByKey!532 (List!21481 (_ BitVec 64)) Option!583)

(assert (=> bs!29279 (= (dynLambda!1883 lambda!746 (h!22676 lt!448540)) (= (getValueByKey!532 (t!30473 l!412) (h!22676 lt!448540)) (Some!582 value!115)))))

(declare-fun m!936629 () Bool)

(assert (=> bs!29279 m!936629))

(assert (=> b!1014660 d!120713))

(push 1)

(assert (not bm!42856))

(assert (not d!120693))

(assert (not b!1014669))

(assert (not b_lambda!15355))

(assert (not b!1014667))

(assert (not bm!42859))

(assert tp_is_empty!23513)

(assert (not bm!42857))

(assert (not b!1014661))

(assert (not bs!29279))

(assert (not b!1014771))

(assert (not bm!42858))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

