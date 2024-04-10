; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106828 () Bool)

(assert start!106828)

(declare-fun b!1267652 () Bool)

(declare-fun res!843844 () Bool)

(declare-fun e!722170 () Bool)

(assert (=> b!1267652 (=> (not res!843844) (not e!722170))))

(declare-datatypes ((B!2090 0))(
  ( (B!2091 (val!16380 Int)) )
))
(declare-datatypes ((tuple2!21278 0))(
  ( (tuple2!21279 (_1!10650 (_ BitVec 64)) (_2!10650 B!2090)) )
))
(declare-datatypes ((List!28372 0))(
  ( (Nil!28369) (Cons!28368 (h!29577 tuple2!21278) (t!41899 List!28372)) )
))
(declare-fun l!874 () List!28372)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!688 (List!28372 (_ BitVec 64)) Bool)

(assert (=> b!1267652 (= res!843844 (not (containsKey!688 (t!41899 l!874) key!235)))))

(declare-fun b!1267653 () Bool)

(declare-fun res!843841 () Bool)

(assert (=> b!1267653 (=> (not res!843841) (not e!722170))))

(declare-fun isStrictlySorted!829 (List!28372) Bool)

(assert (=> b!1267653 (= res!843841 (isStrictlySorted!829 (t!41899 l!874)))))

(declare-fun b!1267654 () Bool)

(declare-fun res!843843 () Bool)

(assert (=> b!1267654 (=> (not res!843843) (not e!722170))))

(assert (=> b!1267654 (= res!843843 (is-Cons!28368 l!874))))

(declare-fun b!1267655 () Bool)

(declare-fun removeStrictlySorted!167 (List!28372 (_ BitVec 64)) List!28372)

(assert (=> b!1267655 (= e!722170 (not (= (removeStrictlySorted!167 l!874 key!235) l!874)))))

(assert (=> b!1267655 (= (removeStrictlySorted!167 (t!41899 l!874) key!235) (t!41899 l!874))))

(declare-datatypes ((Unit!42222 0))(
  ( (Unit!42223) )
))
(declare-fun lt!574344 () Unit!42222)

(declare-fun lemmaRemoveStrictlySortedNotPresentPreserves!7 (List!28372 (_ BitVec 64)) Unit!42222)

(assert (=> b!1267655 (= lt!574344 (lemmaRemoveStrictlySortedNotPresentPreserves!7 (t!41899 l!874) key!235))))

(declare-fun b!1267656 () Bool)

(declare-fun res!843842 () Bool)

(assert (=> b!1267656 (=> (not res!843842) (not e!722170))))

(assert (=> b!1267656 (= res!843842 (not (containsKey!688 l!874 key!235)))))

(declare-fun res!843840 () Bool)

(assert (=> start!106828 (=> (not res!843840) (not e!722170))))

(assert (=> start!106828 (= res!843840 (isStrictlySorted!829 l!874))))

(assert (=> start!106828 e!722170))

(declare-fun e!722171 () Bool)

(assert (=> start!106828 e!722171))

(assert (=> start!106828 true))

(declare-fun b!1267657 () Bool)

(declare-fun tp_is_empty!32611 () Bool)

(declare-fun tp!96641 () Bool)

(assert (=> b!1267657 (= e!722171 (and tp_is_empty!32611 tp!96641))))

(assert (= (and start!106828 res!843840) b!1267656))

(assert (= (and b!1267656 res!843842) b!1267654))

(assert (= (and b!1267654 res!843843) b!1267653))

(assert (= (and b!1267653 res!843841) b!1267652))

(assert (= (and b!1267652 res!843844) b!1267655))

(assert (= (and start!106828 (is-Cons!28368 l!874)) b!1267657))

(declare-fun m!1166811 () Bool)

(assert (=> b!1267652 m!1166811))

(declare-fun m!1166813 () Bool)

(assert (=> b!1267656 m!1166813))

(declare-fun m!1166815 () Bool)

(assert (=> b!1267655 m!1166815))

(declare-fun m!1166817 () Bool)

(assert (=> b!1267655 m!1166817))

(declare-fun m!1166819 () Bool)

(assert (=> b!1267655 m!1166819))

(declare-fun m!1166821 () Bool)

(assert (=> start!106828 m!1166821))

(declare-fun m!1166823 () Bool)

(assert (=> b!1267653 m!1166823))

(push 1)

(assert (not b!1267652))

(assert tp_is_empty!32611)

(assert (not start!106828))

(assert (not b!1267657))

(assert (not b!1267653))

(assert (not b!1267655))

(assert (not b!1267656))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139525 () Bool)

(declare-fun res!843879 () Bool)

(declare-fun e!722188 () Bool)

(assert (=> d!139525 (=> res!843879 e!722188)))

(assert (=> d!139525 (= res!843879 (and (is-Cons!28368 (t!41899 l!874)) (= (_1!10650 (h!29577 (t!41899 l!874))) key!235)))))

(assert (=> d!139525 (= (containsKey!688 (t!41899 l!874) key!235) e!722188)))

(declare-fun b!1267698 () Bool)

(declare-fun e!722189 () Bool)

(assert (=> b!1267698 (= e!722188 e!722189)))

(declare-fun res!843880 () Bool)

(assert (=> b!1267698 (=> (not res!843880) (not e!722189))))

(assert (=> b!1267698 (= res!843880 (and (or (not (is-Cons!28368 (t!41899 l!874))) (bvsle (_1!10650 (h!29577 (t!41899 l!874))) key!235)) (is-Cons!28368 (t!41899 l!874)) (bvslt (_1!10650 (h!29577 (t!41899 l!874))) key!235)))))

(declare-fun b!1267699 () Bool)

(assert (=> b!1267699 (= e!722189 (containsKey!688 (t!41899 (t!41899 l!874)) key!235))))

(assert (= (and d!139525 (not res!843879)) b!1267698))

(assert (= (and b!1267698 res!843880) b!1267699))

(declare-fun m!1166853 () Bool)

(assert (=> b!1267699 m!1166853))

(assert (=> b!1267652 d!139525))

(declare-fun d!139527 () Bool)

(declare-fun res!843881 () Bool)

(declare-fun e!722190 () Bool)

(assert (=> d!139527 (=> res!843881 e!722190)))

(assert (=> d!139527 (= res!843881 (and (is-Cons!28368 l!874) (= (_1!10650 (h!29577 l!874)) key!235)))))

(assert (=> d!139527 (= (containsKey!688 l!874 key!235) e!722190)))

(declare-fun b!1267700 () Bool)

(declare-fun e!722191 () Bool)

(assert (=> b!1267700 (= e!722190 e!722191)))

(declare-fun res!843882 () Bool)

(assert (=> b!1267700 (=> (not res!843882) (not e!722191))))

(assert (=> b!1267700 (= res!843882 (and (or (not (is-Cons!28368 l!874)) (bvsle (_1!10650 (h!29577 l!874)) key!235)) (is-Cons!28368 l!874) (bvslt (_1!10650 (h!29577 l!874)) key!235)))))

(declare-fun b!1267701 () Bool)

(assert (=> b!1267701 (= e!722191 (containsKey!688 (t!41899 l!874) key!235))))

(assert (= (and d!139527 (not res!843881)) b!1267700))

(assert (= (and b!1267700 res!843882) b!1267701))

(assert (=> b!1267701 m!1166811))

(assert (=> b!1267656 d!139527))

(declare-fun d!139529 () Bool)

(declare-fun e!722204 () Bool)

(assert (=> d!139529 e!722204))

(declare-fun res!843889 () Bool)

(assert (=> d!139529 (=> (not res!843889) (not e!722204))))

(declare-fun lt!574353 () List!28372)

(assert (=> d!139529 (= res!843889 (isStrictlySorted!829 lt!574353))))

(declare-fun e!722202 () List!28372)

(assert (=> d!139529 (= lt!574353 e!722202)))

(declare-fun c!123580 () Bool)

(assert (=> d!139529 (= c!123580 (and (is-Cons!28368 l!874) (= (_1!10650 (h!29577 l!874)) key!235)))))

(assert (=> d!139529 (isStrictlySorted!829 l!874)))

(assert (=> d!139529 (= (removeStrictlySorted!167 l!874 key!235) lt!574353)))

(declare-fun b!1267716 () Bool)

(assert (=> b!1267716 (= e!722202 (t!41899 l!874))))

(declare-fun b!1267717 () Bool)

(declare-fun e!722203 () List!28372)

(assert (=> b!1267717 (= e!722202 e!722203)))

(declare-fun c!123579 () Bool)

(assert (=> b!1267717 (= c!123579 (and (is-Cons!28368 l!874) (not (= (_1!10650 (h!29577 l!874)) key!235))))))

(declare-fun b!1267718 () Bool)

(assert (=> b!1267718 (= e!722203 Nil!28369)))

(declare-fun b!1267719 () Bool)

(assert (=> b!1267719 (= e!722204 (not (containsKey!688 lt!574353 key!235)))))

(declare-fun b!1267720 () Bool)

(declare-fun $colon$colon!650 (List!28372 tuple2!21278) List!28372)

(assert (=> b!1267720 (= e!722203 ($colon$colon!650 (removeStrictlySorted!167 (t!41899 l!874) key!235) (h!29577 l!874)))))

(assert (= (and d!139529 c!123580) b!1267716))

(assert (= (and d!139529 (not c!123580)) b!1267717))

(assert (= (and b!1267717 c!123579) b!1267720))

(assert (= (and b!1267717 (not c!123579)) b!1267718))

(assert (= (and d!139529 res!843889) b!1267719))

(declare-fun m!1166855 () Bool)

(assert (=> d!139529 m!1166855))

(assert (=> d!139529 m!1166821))

(declare-fun m!1166857 () Bool)

(assert (=> b!1267719 m!1166857))

(assert (=> b!1267720 m!1166817))

(assert (=> b!1267720 m!1166817))

(declare-fun m!1166859 () Bool)

(assert (=> b!1267720 m!1166859))

(assert (=> b!1267655 d!139529))

(declare-fun d!139535 () Bool)

(declare-fun e!722207 () Bool)

(assert (=> d!139535 e!722207))

(declare-fun res!843890 () Bool)

(assert (=> d!139535 (=> (not res!843890) (not e!722207))))

(declare-fun lt!574354 () List!28372)

(assert (=> d!139535 (= res!843890 (isStrictlySorted!829 lt!574354))))

(declare-fun e!722205 () List!28372)

(assert (=> d!139535 (= lt!574354 e!722205)))

(declare-fun c!123582 () Bool)

(assert (=> d!139535 (= c!123582 (and (is-Cons!28368 (t!41899 l!874)) (= (_1!10650 (h!29577 (t!41899 l!874))) key!235)))))

(assert (=> d!139535 (isStrictlySorted!829 (t!41899 l!874))))

(assert (=> d!139535 (= (removeStrictlySorted!167 (t!41899 l!874) key!235) lt!574354)))

(declare-fun b!1267721 () Bool)

(assert (=> b!1267721 (= e!722205 (t!41899 (t!41899 l!874)))))

(declare-fun b!1267722 () Bool)

(declare-fun e!722206 () List!28372)

(assert (=> b!1267722 (= e!722205 e!722206)))

(declare-fun c!123581 () Bool)

(assert (=> b!1267722 (= c!123581 (and (is-Cons!28368 (t!41899 l!874)) (not (= (_1!10650 (h!29577 (t!41899 l!874))) key!235))))))

(declare-fun b!1267723 () Bool)

(assert (=> b!1267723 (= e!722206 Nil!28369)))

(declare-fun b!1267724 () Bool)

(assert (=> b!1267724 (= e!722207 (not (containsKey!688 lt!574354 key!235)))))

(declare-fun b!1267725 () Bool)

(assert (=> b!1267725 (= e!722206 ($colon$colon!650 (removeStrictlySorted!167 (t!41899 (t!41899 l!874)) key!235) (h!29577 (t!41899 l!874))))))

(assert (= (and d!139535 c!123582) b!1267721))

(assert (= (and d!139535 (not c!123582)) b!1267722))

(assert (= (and b!1267722 c!123581) b!1267725))

(assert (= (and b!1267722 (not c!123581)) b!1267723))

(assert (= (and d!139535 res!843890) b!1267724))

(declare-fun m!1166861 () Bool)

(assert (=> d!139535 m!1166861))

(assert (=> d!139535 m!1166823))

(declare-fun m!1166863 () Bool)

(assert (=> b!1267724 m!1166863))

(declare-fun m!1166865 () Bool)

(assert (=> b!1267725 m!1166865))

(assert (=> b!1267725 m!1166865))

(declare-fun m!1166867 () Bool)

(assert (=> b!1267725 m!1166867))

(assert (=> b!1267655 d!139535))

(declare-fun d!139537 () Bool)

(assert (=> d!139537 (= (removeStrictlySorted!167 (t!41899 l!874) key!235) (t!41899 l!874))))

(declare-fun lt!574357 () Unit!42222)

(declare-fun choose!1892 (List!28372 (_ BitVec 64)) Unit!42222)

(assert (=> d!139537 (= lt!574357 (choose!1892 (t!41899 l!874) key!235))))

(assert (=> d!139537 (isStrictlySorted!829 (t!41899 l!874))))

(assert (=> d!139537 (= (lemmaRemoveStrictlySortedNotPresentPreserves!7 (t!41899 l!874) key!235) lt!574357)))

(declare-fun bs!35903 () Bool)

(assert (= bs!35903 d!139537))

(assert (=> bs!35903 m!1166817))

(declare-fun m!1166869 () Bool)

(assert (=> bs!35903 m!1166869))

(assert (=> bs!35903 m!1166823))

(assert (=> b!1267655 d!139537))

(declare-fun d!139541 () Bool)

(declare-fun res!843909 () Bool)

(declare-fun e!722230 () Bool)

(assert (=> d!139541 (=> res!843909 e!722230)))

(assert (=> d!139541 (= res!843909 (or (is-Nil!28369 (t!41899 l!874)) (is-Nil!28369 (t!41899 (t!41899 l!874)))))))

(assert (=> d!139541 (= (isStrictlySorted!829 (t!41899 l!874)) e!722230)))

(declare-fun b!1267752 () Bool)

(declare-fun e!722231 () Bool)

(assert (=> b!1267752 (= e!722230 e!722231)))

(declare-fun res!843910 () Bool)

(assert (=> b!1267752 (=> (not res!843910) (not e!722231))))

(assert (=> b!1267752 (= res!843910 (bvslt (_1!10650 (h!29577 (t!41899 l!874))) (_1!10650 (h!29577 (t!41899 (t!41899 l!874))))))))

(declare-fun b!1267753 () Bool)

(assert (=> b!1267753 (= e!722231 (isStrictlySorted!829 (t!41899 (t!41899 l!874))))))

(assert (= (and d!139541 (not res!843909)) b!1267752))

(assert (= (and b!1267752 res!843910) b!1267753))

(declare-fun m!1166873 () Bool)

(assert (=> b!1267753 m!1166873))

(assert (=> b!1267653 d!139541))

(declare-fun d!139547 () Bool)

(declare-fun res!843911 () Bool)

(declare-fun e!722232 () Bool)

(assert (=> d!139547 (=> res!843911 e!722232)))

(assert (=> d!139547 (= res!843911 (or (is-Nil!28369 l!874) (is-Nil!28369 (t!41899 l!874))))))

(assert (=> d!139547 (= (isStrictlySorted!829 l!874) e!722232)))

(declare-fun b!1267754 () Bool)

(declare-fun e!722233 () Bool)

(assert (=> b!1267754 (= e!722232 e!722233)))

(declare-fun res!843912 () Bool)

(assert (=> b!1267754 (=> (not res!843912) (not e!722233))))

(assert (=> b!1267754 (= res!843912 (bvslt (_1!10650 (h!29577 l!874)) (_1!10650 (h!29577 (t!41899 l!874)))))))

(declare-fun b!1267755 () Bool)

(assert (=> b!1267755 (= e!722233 (isStrictlySorted!829 (t!41899 l!874)))))

(assert (= (and d!139547 (not res!843911)) b!1267754))

(assert (= (and b!1267754 res!843912) b!1267755))

(assert (=> b!1267755 m!1166823))

(assert (=> start!106828 d!139547))

(declare-fun b!1267765 () Bool)

(declare-fun e!722239 () Bool)

(declare-fun tp!96650 () Bool)

(assert (=> b!1267765 (= e!722239 (and tp_is_empty!32611 tp!96650))))

(assert (=> b!1267657 (= tp!96641 e!722239)))

(assert (= (and b!1267657 (is-Cons!28368 (t!41899 l!874))) b!1267765))

(push 1)

(assert (not b!1267699))

(assert (not b!1267725))

(assert (not b!1267724))

(assert (not b!1267720))

(assert (not b!1267755))

(assert (not d!139529))

(assert (not d!139537))

(assert (not b!1267719))

(assert (not b!1267765))

(assert (not b!1267753))

(assert tp_is_empty!32611)

(assert (not d!139535))

(assert (not b!1267701))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139567 () Bool)

(declare-fun res!843935 () Bool)

(declare-fun e!722277 () Bool)

(assert (=> d!139567 (=> res!843935 e!722277)))

(assert (=> d!139567 (= res!843935 (or (is-Nil!28369 lt!574353) (is-Nil!28369 (t!41899 lt!574353))))))

(assert (=> d!139567 (= (isStrictlySorted!829 lt!574353) e!722277)))

(declare-fun b!1267817 () Bool)

(declare-fun e!722278 () Bool)

(assert (=> b!1267817 (= e!722277 e!722278)))

(declare-fun res!843936 () Bool)

(assert (=> b!1267817 (=> (not res!843936) (not e!722278))))

(assert (=> b!1267817 (= res!843936 (bvslt (_1!10650 (h!29577 lt!574353)) (_1!10650 (h!29577 (t!41899 lt!574353)))))))

(declare-fun b!1267818 () Bool)

(assert (=> b!1267818 (= e!722278 (isStrictlySorted!829 (t!41899 lt!574353)))))

(assert (= (and d!139567 (not res!843935)) b!1267817))

(assert (= (and b!1267817 res!843936) b!1267818))

(declare-fun m!1166913 () Bool)

(assert (=> b!1267818 m!1166913))

(assert (=> d!139529 d!139567))

(assert (=> d!139529 d!139547))

(declare-fun d!139569 () Bool)

(assert (=> d!139569 (= ($colon$colon!650 (removeStrictlySorted!167 (t!41899 (t!41899 l!874)) key!235) (h!29577 (t!41899 l!874))) (Cons!28368 (h!29577 (t!41899 l!874)) (removeStrictlySorted!167 (t!41899 (t!41899 l!874)) key!235)))))

(assert (=> b!1267725 d!139569))

(declare-fun d!139571 () Bool)

(declare-fun e!722281 () Bool)

(assert (=> d!139571 e!722281))

(declare-fun res!843937 () Bool)

(assert (=> d!139571 (=> (not res!843937) (not e!722281))))

(declare-fun lt!574372 () List!28372)

(assert (=> d!139571 (= res!843937 (isStrictlySorted!829 lt!574372))))

(declare-fun e!722279 () List!28372)

(assert (=> d!139571 (= lt!574372 e!722279)))

(declare-fun c!123600 () Bool)

(assert (=> d!139571 (= c!123600 (and (is-Cons!28368 (t!41899 (t!41899 l!874))) (= (_1!10650 (h!29577 (t!41899 (t!41899 l!874)))) key!235)))))

(assert (=> d!139571 (isStrictlySorted!829 (t!41899 (t!41899 l!874)))))

(assert (=> d!139571 (= (removeStrictlySorted!167 (t!41899 (t!41899 l!874)) key!235) lt!574372)))

(declare-fun b!1267819 () Bool)

(assert (=> b!1267819 (= e!722279 (t!41899 (t!41899 (t!41899 l!874))))))

(declare-fun b!1267820 () Bool)

(declare-fun e!722280 () List!28372)

(assert (=> b!1267820 (= e!722279 e!722280)))

(declare-fun c!123599 () Bool)

(assert (=> b!1267820 (= c!123599 (and (is-Cons!28368 (t!41899 (t!41899 l!874))) (not (= (_1!10650 (h!29577 (t!41899 (t!41899 l!874)))) key!235))))))

(declare-fun b!1267821 () Bool)

(assert (=> b!1267821 (= e!722280 Nil!28369)))

(declare-fun b!1267822 () Bool)

(assert (=> b!1267822 (= e!722281 (not (containsKey!688 lt!574372 key!235)))))

(declare-fun b!1267823 () Bool)

(assert (=> b!1267823 (= e!722280 ($colon$colon!650 (removeStrictlySorted!167 (t!41899 (t!41899 (t!41899 l!874))) key!235) (h!29577 (t!41899 (t!41899 l!874)))))))

(assert (= (and d!139571 c!123600) b!1267819))

(assert (= (and d!139571 (not c!123600)) b!1267820))

(assert (= (and b!1267820 c!123599) b!1267823))

(assert (= (and b!1267820 (not c!123599)) b!1267821))

(assert (= (and d!139571 res!843937) b!1267822))

(declare-fun m!1166915 () Bool)

(assert (=> d!139571 m!1166915))

(assert (=> d!139571 m!1166873))

(declare-fun m!1166917 () Bool)

(assert (=> b!1267822 m!1166917))

(declare-fun m!1166919 () Bool)

(assert (=> b!1267823 m!1166919))

(assert (=> b!1267823 m!1166919))

(declare-fun m!1166921 () Bool)

(assert (=> b!1267823 m!1166921))

(assert (=> b!1267725 d!139571))

(assert (=> d!139537 d!139535))

(declare-fun d!139573 () Bool)

(assert (=> d!139573 (= (removeStrictlySorted!167 (t!41899 l!874) key!235) (t!41899 l!874))))

(assert (=> d!139573 true))

(declare-fun _$7!131 () Unit!42222)

(assert (=> d!139573 (= (choose!1892 (t!41899 l!874) key!235) _$7!131)))

(declare-fun bs!35906 () Bool)

(assert (= bs!35906 d!139573))

(assert (=> bs!35906 m!1166817))

(assert (=> d!139537 d!139573))

(assert (=> d!139537 d!139541))

(declare-fun d!139575 () Bool)

(declare-fun res!843938 () Bool)

(declare-fun e!722282 () Bool)

(assert (=> d!139575 (=> res!843938 e!722282)))

(assert (=> d!139575 (= res!843938 (and (is-Cons!28368 lt!574354) (= (_1!10650 (h!29577 lt!574354)) key!235)))))

(assert (=> d!139575 (= (containsKey!688 lt!574354 key!235) e!722282)))

(declare-fun b!1267824 () Bool)

(declare-fun e!722283 () Bool)

(assert (=> b!1267824 (= e!722282 e!722283)))

(declare-fun res!843939 () Bool)

(assert (=> b!1267824 (=> (not res!843939) (not e!722283))))

(assert (=> b!1267824 (= res!843939 (and (or (not (is-Cons!28368 lt!574354)) (bvsle (_1!10650 (h!29577 lt!574354)) key!235)) (is-Cons!28368 lt!574354) (bvslt (_1!10650 (h!29577 lt!574354)) key!235)))))

(declare-fun b!1267825 () Bool)

(assert (=> b!1267825 (= e!722283 (containsKey!688 (t!41899 lt!574354) key!235))))

(assert (= (and d!139575 (not res!843938)) b!1267824))

(assert (= (and b!1267824 res!843939) b!1267825))

(declare-fun m!1166923 () Bool)

(assert (=> b!1267825 m!1166923))

(assert (=> b!1267724 d!139575))

(declare-fun d!139577 () Bool)

(declare-fun res!843940 () Bool)

(declare-fun e!722284 () Bool)

(assert (=> d!139577 (=> res!843940 e!722284)))

(assert (=> d!139577 (= res!843940 (and (is-Cons!28368 (t!41899 (t!41899 l!874))) (= (_1!10650 (h!29577 (t!41899 (t!41899 l!874)))) key!235)))))

(assert (=> d!139577 (= (containsKey!688 (t!41899 (t!41899 l!874)) key!235) e!722284)))

(declare-fun b!1267826 () Bool)

(declare-fun e!722285 () Bool)

(assert (=> b!1267826 (= e!722284 e!722285)))

(declare-fun res!843941 () Bool)

(assert (=> b!1267826 (=> (not res!843941) (not e!722285))))

(assert (=> b!1267826 (= res!843941 (and (or (not (is-Cons!28368 (t!41899 (t!41899 l!874)))) (bvsle (_1!10650 (h!29577 (t!41899 (t!41899 l!874)))) key!235)) (is-Cons!28368 (t!41899 (t!41899 l!874))) (bvslt (_1!10650 (h!29577 (t!41899 (t!41899 l!874)))) key!235)))))

(declare-fun b!1267827 () Bool)

(assert (=> b!1267827 (= e!722285 (containsKey!688 (t!41899 (t!41899 (t!41899 l!874))) key!235))))

(assert (= (and d!139577 (not res!843940)) b!1267826))

(assert (= (and b!1267826 res!843941) b!1267827))

(declare-fun m!1166925 () Bool)

(assert (=> b!1267827 m!1166925))

(assert (=> b!1267699 d!139577))

(declare-fun d!139579 () Bool)

(declare-fun res!843942 () Bool)

(declare-fun e!722286 () Bool)

(assert (=> d!139579 (=> res!843942 e!722286)))

(assert (=> d!139579 (= res!843942 (or (is-Nil!28369 lt!574354) (is-Nil!28369 (t!41899 lt!574354))))))

(assert (=> d!139579 (= (isStrictlySorted!829 lt!574354) e!722286)))

(declare-fun b!1267828 () Bool)

(declare-fun e!722287 () Bool)

(assert (=> b!1267828 (= e!722286 e!722287)))

(declare-fun res!843943 () Bool)

(assert (=> b!1267828 (=> (not res!843943) (not e!722287))))

(assert (=> b!1267828 (= res!843943 (bvslt (_1!10650 (h!29577 lt!574354)) (_1!10650 (h!29577 (t!41899 lt!574354)))))))

(declare-fun b!1267829 () Bool)

(assert (=> b!1267829 (= e!722287 (isStrictlySorted!829 (t!41899 lt!574354)))))

(assert (= (and d!139579 (not res!843942)) b!1267828))

(assert (= (and b!1267828 res!843943) b!1267829))

(declare-fun m!1166927 () Bool)

(assert (=> b!1267829 m!1166927))

(assert (=> d!139535 d!139579))

(assert (=> d!139535 d!139541))

(assert (=> b!1267701 d!139525))

(assert (=> b!1267755 d!139541))

(declare-fun d!139581 () Bool)

(assert (=> d!139581 (= ($colon$colon!650 (removeStrictlySorted!167 (t!41899 l!874) key!235) (h!29577 l!874)) (Cons!28368 (h!29577 l!874) (removeStrictlySorted!167 (t!41899 l!874) key!235)))))

(assert (=> b!1267720 d!139581))

(assert (=> b!1267720 d!139535))

(declare-fun d!139583 () Bool)

(declare-fun res!843944 () Bool)

(declare-fun e!722288 () Bool)

(assert (=> d!139583 (=> res!843944 e!722288)))

(assert (=> d!139583 (= res!843944 (and (is-Cons!28368 lt!574353) (= (_1!10650 (h!29577 lt!574353)) key!235)))))

(assert (=> d!139583 (= (containsKey!688 lt!574353 key!235) e!722288)))

(declare-fun b!1267830 () Bool)

(declare-fun e!722289 () Bool)

(assert (=> b!1267830 (= e!722288 e!722289)))

(declare-fun res!843945 () Bool)

(assert (=> b!1267830 (=> (not res!843945) (not e!722289))))

(assert (=> b!1267830 (= res!843945 (and (or (not (is-Cons!28368 lt!574353)) (bvsle (_1!10650 (h!29577 lt!574353)) key!235)) (is-Cons!28368 lt!574353) (bvslt (_1!10650 (h!29577 lt!574353)) key!235)))))

(declare-fun b!1267831 () Bool)

(assert (=> b!1267831 (= e!722289 (containsKey!688 (t!41899 lt!574353) key!235))))

(assert (= (and d!139583 (not res!843944)) b!1267830))

(assert (= (and b!1267830 res!843945) b!1267831))

(declare-fun m!1166929 () Bool)

(assert (=> b!1267831 m!1166929))

(assert (=> b!1267719 d!139583))

(declare-fun d!139585 () Bool)

(declare-fun res!843946 () Bool)

(declare-fun e!722290 () Bool)

(assert (=> d!139585 (=> res!843946 e!722290)))

(assert (=> d!139585 (= res!843946 (or (is-Nil!28369 (t!41899 (t!41899 l!874))) (is-Nil!28369 (t!41899 (t!41899 (t!41899 l!874))))))))

(assert (=> d!139585 (= (isStrictlySorted!829 (t!41899 (t!41899 l!874))) e!722290)))

(declare-fun b!1267832 () Bool)

(declare-fun e!722291 () Bool)

(assert (=> b!1267832 (= e!722290 e!722291)))

(declare-fun res!843947 () Bool)

(assert (=> b!1267832 (=> (not res!843947) (not e!722291))))

(assert (=> b!1267832 (= res!843947 (bvslt (_1!10650 (h!29577 (t!41899 (t!41899 l!874)))) (_1!10650 (h!29577 (t!41899 (t!41899 (t!41899 l!874)))))))))

(declare-fun b!1267833 () Bool)

(assert (=> b!1267833 (= e!722291 (isStrictlySorted!829 (t!41899 (t!41899 (t!41899 l!874)))))))

(assert (= (and d!139585 (not res!843946)) b!1267832))

(assert (= (and b!1267832 res!843947) b!1267833))

(declare-fun m!1166931 () Bool)

(assert (=> b!1267833 m!1166931))

(assert (=> b!1267753 d!139585))

(declare-fun b!1267834 () Bool)

(declare-fun e!722292 () Bool)

(declare-fun tp!96657 () Bool)

(assert (=> b!1267834 (= e!722292 (and tp_is_empty!32611 tp!96657))))

(assert (=> b!1267765 (= tp!96650 e!722292)))

(assert (= (and b!1267765 (is-Cons!28368 (t!41899 (t!41899 l!874)))) b!1267834))

(push 1)

(assert (not b!1267818))

(assert (not b!1267833))

(assert (not b!1267827))

(assert (not b!1267825))

(assert tp_is_empty!32611)

(assert (not b!1267829))

(assert (not d!139573))

(assert (not b!1267823))

(assert (not b!1267831))

(assert (not b!1267822))

(assert (not d!139571))

(assert (not b!1267834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

