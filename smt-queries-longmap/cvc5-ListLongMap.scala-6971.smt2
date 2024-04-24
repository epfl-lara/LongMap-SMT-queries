; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88372 () Bool)

(assert start!88372)

(declare-fun b!1017837 () Bool)

(assert (=> b!1017837 true))

(assert (=> b!1017837 true))

(declare-fun res!682319 () Bool)

(declare-fun e!572678 () Bool)

(assert (=> start!88372 (=> (not res!682319) (not e!572678))))

(declare-datatypes ((B!1536 0))(
  ( (B!1537 (val!11852 Int)) )
))
(declare-datatypes ((tuple2!15254 0))(
  ( (tuple2!15255 (_1!7638 (_ BitVec 64)) (_2!7638 B!1536)) )
))
(declare-datatypes ((List!21516 0))(
  ( (Nil!21513) (Cons!21512 (h!22719 tuple2!15254) (t!30509 List!21516)) )
))
(declare-fun l!1114 () List!21516)

(declare-fun isStrictlySorted!608 (List!21516) Bool)

(assert (=> start!88372 (= res!682319 (isStrictlySorted!608 l!1114))))

(assert (=> start!88372 e!572678))

(declare-fun e!572679 () Bool)

(assert (=> start!88372 e!572679))

(assert (=> start!88372 true))

(declare-fun tp_is_empty!23603 () Bool)

(assert (=> start!88372 tp_is_empty!23603))

(declare-fun b!1017833 () Bool)

(declare-fun e!572680 () Bool)

(assert (=> b!1017833 (= e!572678 (not e!572680))))

(declare-fun res!682315 () Bool)

(assert (=> b!1017833 (=> (not res!682315) (not e!572680))))

(declare-fun lt!449788 () List!21516)

(assert (=> b!1017833 (= res!682315 (isStrictlySorted!608 lt!449788))))

(declare-fun newHead!31 () tuple2!15254)

(assert (=> b!1017833 (= lt!449788 (Cons!21512 newHead!31 l!1114))))

(declare-datatypes ((List!21517 0))(
  ( (Nil!21514) (Cons!21513 (h!22720 (_ BitVec 64)) (t!30510 List!21517)) )
))
(declare-fun keys!40 () List!21517)

(declare-fun containsKey!494 (List!21516 (_ BitVec 64)) Bool)

(assert (=> b!1017833 (containsKey!494 l!1114 (h!22720 keys!40))))

(declare-datatypes ((Unit!33250 0))(
  ( (Unit!33251) )
))
(declare-fun lt!449789 () Unit!33250)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!12 (List!21516 (_ BitVec 64)) Unit!33250)

(assert (=> b!1017833 (= lt!449789 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!12 l!1114 (h!22720 keys!40)))))

(declare-fun b!1017834 () Bool)

(declare-fun tp!70781 () Bool)

(assert (=> b!1017834 (= e!572679 (and tp_is_empty!23603 tp!70781))))

(declare-fun b!1017835 () Bool)

(declare-fun res!682317 () Bool)

(assert (=> b!1017835 (=> (not res!682317) (not e!572678))))

(assert (=> b!1017835 (= res!682317 (is-Cons!21513 keys!40))))

(declare-fun b!1017836 () Bool)

(assert (=> b!1017836 (= e!572680 (containsKey!494 lt!449788 (h!22720 keys!40)))))

(declare-fun res!682320 () Bool)

(assert (=> b!1017837 (=> (not res!682320) (not e!572678))))

(declare-fun lambda!1025 () Int)

(declare-fun forall!284 (List!21517 Int) Bool)

(assert (=> b!1017837 (= res!682320 (forall!284 keys!40 lambda!1025))))

(declare-fun b!1017838 () Bool)

(declare-fun res!682318 () Bool)

(assert (=> b!1017838 (=> (not res!682318) (not e!572678))))

(declare-fun head!965 (List!21516) tuple2!15254)

(assert (=> b!1017838 (= res!682318 (bvslt (_1!7638 newHead!31) (_1!7638 (head!965 l!1114))))))

(declare-fun b!1017839 () Bool)

(declare-fun res!682316 () Bool)

(assert (=> b!1017839 (=> (not res!682316) (not e!572678))))

(declare-fun isEmpty!889 (List!21516) Bool)

(assert (=> b!1017839 (= res!682316 (not (isEmpty!889 l!1114)))))

(assert (= (and start!88372 res!682319) b!1017839))

(assert (= (and b!1017839 res!682316) b!1017837))

(assert (= (and b!1017837 res!682320) b!1017838))

(assert (= (and b!1017838 res!682318) b!1017835))

(assert (= (and b!1017835 res!682317) b!1017833))

(assert (= (and b!1017833 res!682315) b!1017836))

(assert (= (and start!88372 (is-Cons!21512 l!1114)) b!1017834))

(declare-fun m!939803 () Bool)

(assert (=> b!1017833 m!939803))

(declare-fun m!939805 () Bool)

(assert (=> b!1017833 m!939805))

(declare-fun m!939807 () Bool)

(assert (=> b!1017833 m!939807))

(declare-fun m!939809 () Bool)

(assert (=> b!1017837 m!939809))

(declare-fun m!939811 () Bool)

(assert (=> b!1017836 m!939811))

(declare-fun m!939813 () Bool)

(assert (=> start!88372 m!939813))

(declare-fun m!939815 () Bool)

(assert (=> b!1017839 m!939815))

(declare-fun m!939817 () Bool)

(assert (=> b!1017838 m!939817))

(push 1)

(assert (not b!1017837))

(assert (not b!1017836))

(assert (not start!88372))

(assert (not b!1017834))

(assert tp_is_empty!23603)

(assert (not b!1017833))

(assert (not b!1017839))

(assert (not b!1017838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121729 () Bool)

(declare-fun res!682337 () Bool)

(declare-fun e!572697 () Bool)

(assert (=> d!121729 (=> res!682337 e!572697)))

(assert (=> d!121729 (= res!682337 (is-Nil!21514 keys!40))))

(assert (=> d!121729 (= (forall!284 keys!40 lambda!1025) e!572697)))

(declare-fun b!1017860 () Bool)

(declare-fun e!572698 () Bool)

(assert (=> b!1017860 (= e!572697 e!572698)))

(declare-fun res!682338 () Bool)

(assert (=> b!1017860 (=> (not res!682338) (not e!572698))))

(declare-fun dynLambda!1940 (Int (_ BitVec 64)) Bool)

(assert (=> b!1017860 (= res!682338 (dynLambda!1940 lambda!1025 (h!22720 keys!40)))))

(declare-fun b!1017861 () Bool)

(assert (=> b!1017861 (= e!572698 (forall!284 (t!30510 keys!40) lambda!1025))))

(assert (= (and d!121729 (not res!682337)) b!1017860))

(assert (= (and b!1017860 res!682338) b!1017861))

(declare-fun b_lambda!15529 () Bool)

(assert (=> (not b_lambda!15529) (not b!1017860)))

(declare-fun m!939823 () Bool)

(assert (=> b!1017860 m!939823))

(declare-fun m!939825 () Bool)

(assert (=> b!1017861 m!939825))

(assert (=> b!1017837 d!121729))

(declare-fun d!121731 () Bool)

(assert (=> d!121731 (= (head!965 l!1114) (h!22719 l!1114))))

(assert (=> b!1017838 d!121731))

(declare-fun d!121737 () Bool)

(declare-fun res!682356 () Bool)

(declare-fun e!572716 () Bool)

(assert (=> d!121737 (=> res!682356 e!572716)))

(assert (=> d!121737 (= res!682356 (and (is-Cons!21512 lt!449788) (= (_1!7638 (h!22719 lt!449788)) (h!22720 keys!40))))))

(assert (=> d!121737 (= (containsKey!494 lt!449788 (h!22720 keys!40)) e!572716)))

(declare-fun b!1017879 () Bool)

(declare-fun e!572717 () Bool)

(assert (=> b!1017879 (= e!572716 e!572717)))

(declare-fun res!682357 () Bool)

(assert (=> b!1017879 (=> (not res!682357) (not e!572717))))

(assert (=> b!1017879 (= res!682357 (and (or (not (is-Cons!21512 lt!449788)) (bvsle (_1!7638 (h!22719 lt!449788)) (h!22720 keys!40))) (is-Cons!21512 lt!449788) (bvslt (_1!7638 (h!22719 lt!449788)) (h!22720 keys!40))))))

(declare-fun b!1017880 () Bool)

(assert (=> b!1017880 (= e!572717 (containsKey!494 (t!30509 lt!449788) (h!22720 keys!40)))))

(assert (= (and d!121737 (not res!682356)) b!1017879))

(assert (= (and b!1017879 res!682357) b!1017880))

(declare-fun m!939839 () Bool)

(assert (=> b!1017880 m!939839))

(assert (=> b!1017836 d!121737))

(declare-fun d!121745 () Bool)

(declare-fun res!682380 () Bool)

(declare-fun e!572740 () Bool)

(assert (=> d!121745 (=> res!682380 e!572740)))

(assert (=> d!121745 (= res!682380 (or (is-Nil!21513 lt!449788) (is-Nil!21513 (t!30509 lt!449788))))))

(assert (=> d!121745 (= (isStrictlySorted!608 lt!449788) e!572740)))

(declare-fun b!1017903 () Bool)

(declare-fun e!572741 () Bool)

(assert (=> b!1017903 (= e!572740 e!572741)))

(declare-fun res!682381 () Bool)

(assert (=> b!1017903 (=> (not res!682381) (not e!572741))))

(assert (=> b!1017903 (= res!682381 (bvslt (_1!7638 (h!22719 lt!449788)) (_1!7638 (h!22719 (t!30509 lt!449788)))))))

(declare-fun b!1017904 () Bool)

(assert (=> b!1017904 (= e!572741 (isStrictlySorted!608 (t!30509 lt!449788)))))

(assert (= (and d!121745 (not res!682380)) b!1017903))

(assert (= (and b!1017903 res!682381) b!1017904))

(declare-fun m!939849 () Bool)

(assert (=> b!1017904 m!939849))

(assert (=> b!1017833 d!121745))

(declare-fun d!121757 () Bool)

(declare-fun res!682384 () Bool)

(declare-fun e!572744 () Bool)

(assert (=> d!121757 (=> res!682384 e!572744)))

(assert (=> d!121757 (= res!682384 (and (is-Cons!21512 l!1114) (= (_1!7638 (h!22719 l!1114)) (h!22720 keys!40))))))

(assert (=> d!121757 (= (containsKey!494 l!1114 (h!22720 keys!40)) e!572744)))

(declare-fun b!1017907 () Bool)

(declare-fun e!572745 () Bool)

(assert (=> b!1017907 (= e!572744 e!572745)))

(declare-fun res!682385 () Bool)

(assert (=> b!1017907 (=> (not res!682385) (not e!572745))))

(assert (=> b!1017907 (= res!682385 (and (or (not (is-Cons!21512 l!1114)) (bvsle (_1!7638 (h!22719 l!1114)) (h!22720 keys!40))) (is-Cons!21512 l!1114) (bvslt (_1!7638 (h!22719 l!1114)) (h!22720 keys!40))))))

(declare-fun b!1017908 () Bool)

(assert (=> b!1017908 (= e!572745 (containsKey!494 (t!30509 l!1114) (h!22720 keys!40)))))

(assert (= (and d!121757 (not res!682384)) b!1017907))

(assert (= (and b!1017907 res!682385) b!1017908))

(declare-fun m!939855 () Bool)

(assert (=> b!1017908 m!939855))

(assert (=> b!1017833 d!121757))

(declare-fun d!121759 () Bool)

(assert (=> d!121759 (containsKey!494 l!1114 (h!22720 keys!40))))

(declare-fun lt!449798 () Unit!33250)

(declare-fun choose!1654 (List!21516 (_ BitVec 64)) Unit!33250)

(assert (=> d!121759 (= lt!449798 (choose!1654 l!1114 (h!22720 keys!40)))))

(declare-fun e!572759 () Bool)

(assert (=> d!121759 e!572759))

(declare-fun res!682393 () Bool)

(assert (=> d!121759 (=> (not res!682393) (not e!572759))))

(assert (=> d!121759 (= res!682393 (isStrictlySorted!608 l!1114))))

(assert (=> d!121759 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!12 l!1114 (h!22720 keys!40)) lt!449798)))

(declare-fun b!1017926 () Bool)

(declare-datatypes ((Option!601 0))(
  ( (Some!600 (v!14451 B!1536)) (None!599) )
))
(declare-fun isDefined!402 (Option!601) Bool)

(declare-fun getValueByKey!550 (List!21516 (_ BitVec 64)) Option!601)

(assert (=> b!1017926 (= e!572759 (isDefined!402 (getValueByKey!550 l!1114 (h!22720 keys!40))))))

(assert (= (and d!121759 res!682393) b!1017926))

(assert (=> d!121759 m!939805))

(declare-fun m!939865 () Bool)

(assert (=> d!121759 m!939865))

(assert (=> d!121759 m!939813))

(declare-fun m!939867 () Bool)

(assert (=> b!1017926 m!939867))

(assert (=> b!1017926 m!939867))

(declare-fun m!939869 () Bool)

(assert (=> b!1017926 m!939869))

(assert (=> b!1017833 d!121759))

(declare-fun d!121769 () Bool)

(assert (=> d!121769 (= (isEmpty!889 l!1114) (is-Nil!21513 l!1114))))

(assert (=> b!1017839 d!121769))

(declare-fun d!121771 () Bool)

(declare-fun res!682394 () Bool)

(declare-fun e!572760 () Bool)

(assert (=> d!121771 (=> res!682394 e!572760)))

(assert (=> d!121771 (= res!682394 (or (is-Nil!21513 l!1114) (is-Nil!21513 (t!30509 l!1114))))))

(assert (=> d!121771 (= (isStrictlySorted!608 l!1114) e!572760)))

(declare-fun b!1017927 () Bool)

(declare-fun e!572761 () Bool)

(assert (=> b!1017927 (= e!572760 e!572761)))

(declare-fun res!682395 () Bool)

(assert (=> b!1017927 (=> (not res!682395) (not e!572761))))

(assert (=> b!1017927 (= res!682395 (bvslt (_1!7638 (h!22719 l!1114)) (_1!7638 (h!22719 (t!30509 l!1114)))))))

(declare-fun b!1017928 () Bool)

(assert (=> b!1017928 (= e!572761 (isStrictlySorted!608 (t!30509 l!1114)))))

(assert (= (and d!121771 (not res!682394)) b!1017927))

(assert (= (and b!1017927 res!682395) b!1017928))

(declare-fun m!939871 () Bool)

(assert (=> b!1017928 m!939871))

(assert (=> start!88372 d!121771))

(declare-fun b!1017933 () Bool)

(declare-fun e!572764 () Bool)

(declare-fun tp!70790 () Bool)

(assert (=> b!1017933 (= e!572764 (and tp_is_empty!23603 tp!70790))))

(assert (=> b!1017834 (= tp!70781 e!572764)))

(assert (= (and b!1017834 (is-Cons!21512 (t!30509 l!1114))) b!1017933))

(declare-fun b_lambda!15539 () Bool)

(assert (= b_lambda!15529 (or b!1017837 b_lambda!15539)))

(declare-fun bs!29543 () Bool)

(declare-fun d!121773 () Bool)

(assert (= bs!29543 (and d!121773 b!1017837)))

(declare-fun value!178 () B!1536)

(assert (=> bs!29543 (= (dynLambda!1940 lambda!1025 (h!22720 keys!40)) (= (getValueByKey!550 l!1114 (h!22720 keys!40)) (Some!600 value!178)))))

(assert (=> bs!29543 m!939867))

(assert (=> b!1017860 d!121773))

(push 1)

(assert (not b!1017904))

(assert (not b!1017861))

(assert tp_is_empty!23603)

(assert (not bs!29543))

(assert (not d!121759))

(assert (not b!1017880))

(assert (not b!1017928))

(assert (not b!1017933))

(assert (not b_lambda!15539))

(assert (not b!1017908))

(assert (not b!1017926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

