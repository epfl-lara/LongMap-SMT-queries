; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106832 () Bool)

(assert start!106832)

(declare-fun b!1267688 () Bool)

(declare-fun res!843870 () Bool)

(declare-fun e!722182 () Bool)

(assert (=> b!1267688 (=> (not res!843870) (not e!722182))))

(declare-datatypes ((B!2094 0))(
  ( (B!2095 (val!16382 Int)) )
))
(declare-datatypes ((tuple2!21282 0))(
  ( (tuple2!21283 (_1!10652 (_ BitVec 64)) (_2!10652 B!2094)) )
))
(declare-datatypes ((List!28374 0))(
  ( (Nil!28371) (Cons!28370 (h!29579 tuple2!21282) (t!41901 List!28374)) )
))
(declare-fun l!874 () List!28374)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!690 (List!28374 (_ BitVec 64)) Bool)

(assert (=> b!1267688 (= res!843870 (not (containsKey!690 l!874 key!235)))))

(declare-fun b!1267689 () Bool)

(declare-fun removeStrictlySorted!169 (List!28374 (_ BitVec 64)) List!28374)

(assert (=> b!1267689 (= e!722182 (not (= (removeStrictlySorted!169 l!874 key!235) l!874)))))

(assert (=> b!1267689 (= (removeStrictlySorted!169 (t!41901 l!874) key!235) (t!41901 l!874))))

(declare-datatypes ((Unit!42226 0))(
  ( (Unit!42227) )
))
(declare-fun lt!574350 () Unit!42226)

(declare-fun lemmaRemoveStrictlySortedNotPresentPreserves!9 (List!28374 (_ BitVec 64)) Unit!42226)

(assert (=> b!1267689 (= lt!574350 (lemmaRemoveStrictlySortedNotPresentPreserves!9 (t!41901 l!874) key!235))))

(declare-fun b!1267691 () Bool)

(declare-fun res!843874 () Bool)

(assert (=> b!1267691 (=> (not res!843874) (not e!722182))))

(assert (=> b!1267691 (= res!843874 (is-Cons!28370 l!874))))

(declare-fun b!1267692 () Bool)

(declare-fun res!843873 () Bool)

(assert (=> b!1267692 (=> (not res!843873) (not e!722182))))

(declare-fun isStrictlySorted!831 (List!28374) Bool)

(assert (=> b!1267692 (= res!843873 (isStrictlySorted!831 (t!41901 l!874)))))

(declare-fun b!1267693 () Bool)

(declare-fun res!843872 () Bool)

(assert (=> b!1267693 (=> (not res!843872) (not e!722182))))

(assert (=> b!1267693 (= res!843872 (not (containsKey!690 (t!41901 l!874) key!235)))))

(declare-fun res!843871 () Bool)

(assert (=> start!106832 (=> (not res!843871) (not e!722182))))

(assert (=> start!106832 (= res!843871 (isStrictlySorted!831 l!874))))

(assert (=> start!106832 e!722182))

(declare-fun e!722183 () Bool)

(assert (=> start!106832 e!722183))

(assert (=> start!106832 true))

(declare-fun b!1267690 () Bool)

(declare-fun tp_is_empty!32615 () Bool)

(declare-fun tp!96647 () Bool)

(assert (=> b!1267690 (= e!722183 (and tp_is_empty!32615 tp!96647))))

(assert (= (and start!106832 res!843871) b!1267688))

(assert (= (and b!1267688 res!843870) b!1267691))

(assert (= (and b!1267691 res!843874) b!1267692))

(assert (= (and b!1267692 res!843873) b!1267693))

(assert (= (and b!1267693 res!843872) b!1267689))

(assert (= (and start!106832 (is-Cons!28370 l!874)) b!1267690))

(declare-fun m!1166839 () Bool)

(assert (=> b!1267688 m!1166839))

(declare-fun m!1166841 () Bool)

(assert (=> b!1267689 m!1166841))

(declare-fun m!1166843 () Bool)

(assert (=> b!1267689 m!1166843))

(declare-fun m!1166845 () Bool)

(assert (=> b!1267689 m!1166845))

(declare-fun m!1166847 () Bool)

(assert (=> b!1267693 m!1166847))

(declare-fun m!1166849 () Bool)

(assert (=> start!106832 m!1166849))

(declare-fun m!1166851 () Bool)

(assert (=> b!1267692 m!1166851))

(push 1)

(assert (not start!106832))

(assert (not b!1267693))

(assert tp_is_empty!32615)

(assert (not b!1267692))

(assert (not b!1267690))

(assert (not b!1267689))

(assert (not b!1267688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1267760 () Bool)

(declare-fun e!722236 () List!28374)

(assert (=> b!1267760 (= e!722236 Nil!28371)))

(declare-fun b!1267761 () Bool)

(declare-fun e!722238 () List!28374)

(assert (=> b!1267761 (= e!722238 e!722236)))

(declare-fun c!123588 () Bool)

(assert (=> b!1267761 (= c!123588 (and (is-Cons!28370 l!874) (not (= (_1!10652 (h!29579 l!874)) key!235))))))

(declare-fun b!1267762 () Bool)

(assert (=> b!1267762 (= e!722238 (t!41901 l!874))))

(declare-fun b!1267763 () Bool)

(declare-fun $colon$colon!651 (List!28374 tuple2!21282) List!28374)

(assert (=> b!1267763 (= e!722236 ($colon$colon!651 (removeStrictlySorted!169 (t!41901 l!874) key!235) (h!29579 l!874)))))

(declare-fun d!139533 () Bool)

(declare-fun e!722237 () Bool)

(assert (=> d!139533 e!722237))

(declare-fun res!843913 () Bool)

(assert (=> d!139533 (=> (not res!843913) (not e!722237))))

(declare-fun lt!574360 () List!28374)

(assert (=> d!139533 (= res!843913 (isStrictlySorted!831 lt!574360))))

(assert (=> d!139533 (= lt!574360 e!722238)))

(declare-fun c!123587 () Bool)

(assert (=> d!139533 (= c!123587 (and (is-Cons!28370 l!874) (= (_1!10652 (h!29579 l!874)) key!235)))))

(assert (=> d!139533 (isStrictlySorted!831 l!874)))

(assert (=> d!139533 (= (removeStrictlySorted!169 l!874 key!235) lt!574360)))

(declare-fun b!1267764 () Bool)

(assert (=> b!1267764 (= e!722237 (not (containsKey!690 lt!574360 key!235)))))

(assert (= (and d!139533 c!123587) b!1267762))

(assert (= (and d!139533 (not c!123587)) b!1267761))

(assert (= (and b!1267761 c!123588) b!1267763))

(assert (= (and b!1267761 (not c!123588)) b!1267760))

(assert (= (and d!139533 res!843913) b!1267764))

(assert (=> b!1267763 m!1166843))

(assert (=> b!1267763 m!1166843))

(declare-fun m!1166877 () Bool)

(assert (=> b!1267763 m!1166877))

(declare-fun m!1166879 () Bool)

(assert (=> d!139533 m!1166879))

(assert (=> d!139533 m!1166849))

(declare-fun m!1166881 () Bool)

(assert (=> b!1267764 m!1166881))

(assert (=> b!1267689 d!139533))

(declare-fun b!1267766 () Bool)

(declare-fun e!722240 () List!28374)

(assert (=> b!1267766 (= e!722240 Nil!28371)))

(declare-fun b!1267767 () Bool)

(declare-fun e!722242 () List!28374)

(assert (=> b!1267767 (= e!722242 e!722240)))

(declare-fun c!123590 () Bool)

(assert (=> b!1267767 (= c!123590 (and (is-Cons!28370 (t!41901 l!874)) (not (= (_1!10652 (h!29579 (t!41901 l!874))) key!235))))))

(declare-fun b!1267768 () Bool)

(assert (=> b!1267768 (= e!722242 (t!41901 (t!41901 l!874)))))

(declare-fun b!1267769 () Bool)

(assert (=> b!1267769 (= e!722240 ($colon$colon!651 (removeStrictlySorted!169 (t!41901 (t!41901 l!874)) key!235) (h!29579 (t!41901 l!874))))))

(declare-fun d!139551 () Bool)

(declare-fun e!722241 () Bool)

(assert (=> d!139551 e!722241))

(declare-fun res!843914 () Bool)

(assert (=> d!139551 (=> (not res!843914) (not e!722241))))

(declare-fun lt!574361 () List!28374)

(assert (=> d!139551 (= res!843914 (isStrictlySorted!831 lt!574361))))

(assert (=> d!139551 (= lt!574361 e!722242)))

(declare-fun c!123589 () Bool)

(assert (=> d!139551 (= c!123589 (and (is-Cons!28370 (t!41901 l!874)) (= (_1!10652 (h!29579 (t!41901 l!874))) key!235)))))

(assert (=> d!139551 (isStrictlySorted!831 (t!41901 l!874))))

(assert (=> d!139551 (= (removeStrictlySorted!169 (t!41901 l!874) key!235) lt!574361)))

(declare-fun b!1267770 () Bool)

(assert (=> b!1267770 (= e!722241 (not (containsKey!690 lt!574361 key!235)))))

(assert (= (and d!139551 c!123589) b!1267768))

(assert (= (and d!139551 (not c!123589)) b!1267767))

(assert (= (and b!1267767 c!123590) b!1267769))

(assert (= (and b!1267767 (not c!123590)) b!1267766))

(assert (= (and d!139551 res!843914) b!1267770))

(declare-fun m!1166883 () Bool)

(assert (=> b!1267769 m!1166883))

(assert (=> b!1267769 m!1166883))

(declare-fun m!1166885 () Bool)

(assert (=> b!1267769 m!1166885))

(declare-fun m!1166887 () Bool)

(assert (=> d!139551 m!1166887))

(assert (=> d!139551 m!1166851))

(declare-fun m!1166889 () Bool)

(assert (=> b!1267770 m!1166889))

(assert (=> b!1267689 d!139551))

(declare-fun d!139553 () Bool)

(assert (=> d!139553 (= (removeStrictlySorted!169 (t!41901 l!874) key!235) (t!41901 l!874))))

(declare-fun lt!574366 () Unit!42226)

(declare-fun choose!1893 (List!28374 (_ BitVec 64)) Unit!42226)

(assert (=> d!139553 (= lt!574366 (choose!1893 (t!41901 l!874) key!235))))

(assert (=> d!139553 (isStrictlySorted!831 (t!41901 l!874))))

(assert (=> d!139553 (= (lemmaRemoveStrictlySortedNotPresentPreserves!9 (t!41901 l!874) key!235) lt!574366)))

(declare-fun bs!35904 () Bool)

(assert (= bs!35904 d!139553))

(assert (=> bs!35904 m!1166843))

(declare-fun m!1166891 () Bool)

(assert (=> bs!35904 m!1166891))

(assert (=> bs!35904 m!1166851))

(assert (=> b!1267689 d!139553))

(declare-fun d!139555 () Bool)

(declare-fun res!843922 () Bool)

(declare-fun e!722256 () Bool)

(assert (=> d!139555 (=> res!843922 e!722256)))

(assert (=> d!139555 (= res!843922 (or (is-Nil!28371 l!874) (is-Nil!28371 (t!41901 l!874))))))

(assert (=> d!139555 (= (isStrictlySorted!831 l!874) e!722256)))

(declare-fun b!1267790 () Bool)

(declare-fun e!722257 () Bool)

(assert (=> b!1267790 (= e!722256 e!722257)))

(declare-fun res!843923 () Bool)

(assert (=> b!1267790 (=> (not res!843923) (not e!722257))))

(assert (=> b!1267790 (= res!843923 (bvslt (_1!10652 (h!29579 l!874)) (_1!10652 (h!29579 (t!41901 l!874)))))))

(declare-fun b!1267791 () Bool)

(assert (=> b!1267791 (= e!722257 (isStrictlySorted!831 (t!41901 l!874)))))

(assert (= (and d!139555 (not res!843922)) b!1267790))

(assert (= (and b!1267790 res!843923) b!1267791))

(assert (=> b!1267791 m!1166851))

(assert (=> start!106832 d!139555))

(declare-fun d!139557 () Bool)

(declare-fun res!843929 () Bool)

(declare-fun e!722265 () Bool)

(assert (=> d!139557 (=> res!843929 e!722265)))

(assert (=> d!139557 (= res!843929 (and (is-Cons!28370 l!874) (= (_1!10652 (h!29579 l!874)) key!235)))))

(assert (=> d!139557 (= (containsKey!690 l!874 key!235) e!722265)))

(declare-fun b!1267801 () Bool)

(declare-fun e!722266 () Bool)

(assert (=> b!1267801 (= e!722265 e!722266)))

(declare-fun res!843930 () Bool)

(assert (=> b!1267801 (=> (not res!843930) (not e!722266))))

(assert (=> b!1267801 (= res!843930 (and (or (not (is-Cons!28370 l!874)) (bvsle (_1!10652 (h!29579 l!874)) key!235)) (is-Cons!28370 l!874) (bvslt (_1!10652 (h!29579 l!874)) key!235)))))

(declare-fun b!1267802 () Bool)

(assert (=> b!1267802 (= e!722266 (containsKey!690 (t!41901 l!874) key!235))))

(assert (= (and d!139557 (not res!843929)) b!1267801))

(assert (= (and b!1267801 res!843930) b!1267802))

(assert (=> b!1267802 m!1166847))

(assert (=> b!1267688 d!139557))

(declare-fun d!139563 () Bool)

(declare-fun res!843931 () Bool)

(declare-fun e!722267 () Bool)

(assert (=> d!139563 (=> res!843931 e!722267)))

(assert (=> d!139563 (= res!843931 (and (is-Cons!28370 (t!41901 l!874)) (= (_1!10652 (h!29579 (t!41901 l!874))) key!235)))))

(assert (=> d!139563 (= (containsKey!690 (t!41901 l!874) key!235) e!722267)))

(declare-fun b!1267803 () Bool)

(declare-fun e!722268 () Bool)

(assert (=> b!1267803 (= e!722267 e!722268)))

(declare-fun res!843932 () Bool)

(assert (=> b!1267803 (=> (not res!843932) (not e!722268))))

(assert (=> b!1267803 (= res!843932 (and (or (not (is-Cons!28370 (t!41901 l!874))) (bvsle (_1!10652 (h!29579 (t!41901 l!874))) key!235)) (is-Cons!28370 (t!41901 l!874)) (bvslt (_1!10652 (h!29579 (t!41901 l!874))) key!235)))))

(declare-fun b!1267804 () Bool)

(assert (=> b!1267804 (= e!722268 (containsKey!690 (t!41901 (t!41901 l!874)) key!235))))

(assert (= (and d!139563 (not res!843931)) b!1267803))

(assert (= (and b!1267803 res!843932) b!1267804))

(declare-fun m!1166909 () Bool)

(assert (=> b!1267804 m!1166909))

(assert (=> b!1267693 d!139563))

(declare-fun d!139565 () Bool)

(declare-fun res!843933 () Bool)

(declare-fun e!722271 () Bool)

(assert (=> d!139565 (=> res!843933 e!722271)))

(assert (=> d!139565 (= res!843933 (or (is-Nil!28371 (t!41901 l!874)) (is-Nil!28371 (t!41901 (t!41901 l!874)))))))

(assert (=> d!139565 (= (isStrictlySorted!831 (t!41901 l!874)) e!722271)))

(declare-fun b!1267809 () Bool)

(declare-fun e!722272 () Bool)

(assert (=> b!1267809 (= e!722271 e!722272)))

(declare-fun res!843934 () Bool)

(assert (=> b!1267809 (=> (not res!843934) (not e!722272))))

(assert (=> b!1267809 (= res!843934 (bvslt (_1!10652 (h!29579 (t!41901 l!874))) (_1!10652 (h!29579 (t!41901 (t!41901 l!874))))))))

(declare-fun b!1267810 () Bool)

(assert (=> b!1267810 (= e!722272 (isStrictlySorted!831 (t!41901 (t!41901 l!874))))))

(assert (= (and d!139565 (not res!843933)) b!1267809))

(assert (= (and b!1267809 res!843934) b!1267810))

(declare-fun m!1166911 () Bool)

(assert (=> b!1267810 m!1166911))

(assert (=> b!1267692 d!139565))

(declare-fun b!1267816 () Bool)

(declare-fun e!722276 () Bool)

(declare-fun tp!96656 () Bool)

(assert (=> b!1267816 (= e!722276 (and tp_is_empty!32615 tp!96656))))

(assert (=> b!1267690 (= tp!96647 e!722276)))

(assert (= (and b!1267690 (is-Cons!28370 (t!41901 l!874))) b!1267816))

(push 1)

(assert (not d!139533))

(assert tp_is_empty!32615)

(assert (not b!1267810))

(assert (not d!139551))

(assert (not b!1267764))

(assert (not b!1267763))

(assert (not d!139553))

(assert (not b!1267804))

(assert (not b!1267802))

(assert (not b!1267769))

(assert (not b!1267791))

(assert (not b!1267770))

(assert (not b!1267816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

