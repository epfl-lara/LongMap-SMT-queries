; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106266 () Bool)

(assert start!106266)

(declare-fun b!1264608 () Bool)

(declare-fun res!842177 () Bool)

(declare-fun e!720155 () Bool)

(assert (=> b!1264608 (=> (not res!842177) (not e!720155))))

(declare-datatypes ((B!1922 0))(
  ( (B!1923 (val!16296 Int)) )
))
(declare-datatypes ((tuple2!21192 0))(
  ( (tuple2!21193 (_1!10607 (_ BitVec 64)) (_2!10607 B!1922)) )
))
(declare-datatypes ((List!28372 0))(
  ( (Nil!28369) (Cons!28368 (h!29577 tuple2!21192) (t!41884 List!28372)) )
))
(declare-datatypes ((ListLongMap!19065 0))(
  ( (ListLongMap!19066 (toList!9548 List!28372)) )
))
(declare-fun lm!212 () ListLongMap!19065)

(declare-fun isStrictlySorted!771 (List!28372) Bool)

(assert (=> b!1264608 (= res!842177 (isStrictlySorted!771 (toList!9548 lm!212)))))

(declare-fun b!1264609 () Bool)

(declare-fun res!842176 () Bool)

(assert (=> b!1264609 (=> (not res!842176) (not e!720155))))

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun containsKey!632 (List!28372 (_ BitVec 64)) Bool)

(assert (=> b!1264609 (= res!842176 (not (containsKey!632 (toList!9548 lm!212) a1!67)))))

(declare-fun b!1264610 () Bool)

(declare-fun b1!78 () B!1922)

(declare-fun -!2106 (ListLongMap!19065 (_ BitVec 64)) ListLongMap!19065)

(declare-fun +!4303 (ListLongMap!19065 tuple2!21192) ListLongMap!19065)

(assert (=> b!1264610 (= e!720155 (not (= (-!2106 (+!4303 lm!212 (tuple2!21193 a1!67 b1!78)) a1!67) lm!212)))))

(declare-fun removeStrictlySorted!146 (List!28372 (_ BitVec 64)) List!28372)

(declare-fun insertStrictlySorted!454 (List!28372 (_ BitVec 64) B!1922) List!28372)

(assert (=> b!1264610 (= (removeStrictlySorted!146 (insertStrictlySorted!454 (toList!9548 lm!212) a1!67 b1!78) a1!67) (toList!9548 lm!212))))

(declare-datatypes ((Unit!42012 0))(
  ( (Unit!42013) )
))
(declare-fun lt!573700 () Unit!42012)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!1 (List!28372 (_ BitVec 64) B!1922) Unit!42012)

(assert (=> b!1264610 (= lt!573700 (lemmaInsertStrictlySortedThenRemoveIsSame!1 (toList!9548 lm!212) a1!67 b1!78))))

(declare-fun b!1264611 () Bool)

(declare-fun e!720154 () Bool)

(declare-fun tp!96239 () Bool)

(assert (=> b!1264611 (= e!720154 tp!96239)))

(declare-fun res!842178 () Bool)

(assert (=> start!106266 (=> (not res!842178) (not e!720155))))

(declare-fun contains!7597 (ListLongMap!19065 (_ BitVec 64)) Bool)

(assert (=> start!106266 (= res!842178 (not (contains!7597 lm!212 a1!67)))))

(assert (=> start!106266 e!720155))

(declare-fun inv!44088 (ListLongMap!19065) Bool)

(assert (=> start!106266 (and (inv!44088 lm!212) e!720154)))

(assert (=> start!106266 true))

(declare-fun tp_is_empty!32455 () Bool)

(assert (=> start!106266 tp_is_empty!32455))

(assert (= (and start!106266 res!842178) b!1264608))

(assert (= (and b!1264608 res!842177) b!1264609))

(assert (= (and b!1264609 res!842176) b!1264610))

(assert (= start!106266 b!1264611))

(declare-fun m!1164653 () Bool)

(assert (=> b!1264608 m!1164653))

(declare-fun m!1164655 () Bool)

(assert (=> b!1264609 m!1164655))

(declare-fun m!1164657 () Bool)

(assert (=> b!1264610 m!1164657))

(declare-fun m!1164659 () Bool)

(assert (=> b!1264610 m!1164659))

(declare-fun m!1164661 () Bool)

(assert (=> b!1264610 m!1164661))

(declare-fun m!1164663 () Bool)

(assert (=> b!1264610 m!1164663))

(assert (=> b!1264610 m!1164663))

(declare-fun m!1164665 () Bool)

(assert (=> b!1264610 m!1164665))

(assert (=> b!1264610 m!1164657))

(declare-fun m!1164667 () Bool)

(assert (=> start!106266 m!1164667))

(declare-fun m!1164669 () Bool)

(assert (=> start!106266 m!1164669))

(check-sat (not b!1264611) (not b!1264608) tp_is_empty!32455 (not start!106266) (not b!1264609) (not b!1264610))
(check-sat)
(get-model)

(declare-fun d!138649 () Bool)

(declare-fun res!842201 () Bool)

(declare-fun e!720172 () Bool)

(assert (=> d!138649 (=> res!842201 e!720172)))

(get-info :version)

(assert (=> d!138649 (= res!842201 (and ((_ is Cons!28368) (toList!9548 lm!212)) (= (_1!10607 (h!29577 (toList!9548 lm!212))) a1!67)))))

(assert (=> d!138649 (= (containsKey!632 (toList!9548 lm!212) a1!67) e!720172)))

(declare-fun b!1264640 () Bool)

(declare-fun e!720173 () Bool)

(assert (=> b!1264640 (= e!720172 e!720173)))

(declare-fun res!842202 () Bool)

(assert (=> b!1264640 (=> (not res!842202) (not e!720173))))

(assert (=> b!1264640 (= res!842202 (and (or (not ((_ is Cons!28368) (toList!9548 lm!212))) (bvsle (_1!10607 (h!29577 (toList!9548 lm!212))) a1!67)) ((_ is Cons!28368) (toList!9548 lm!212)) (bvslt (_1!10607 (h!29577 (toList!9548 lm!212))) a1!67)))))

(declare-fun b!1264641 () Bool)

(assert (=> b!1264641 (= e!720173 (containsKey!632 (t!41884 (toList!9548 lm!212)) a1!67))))

(assert (= (and d!138649 (not res!842201)) b!1264640))

(assert (= (and b!1264640 res!842202) b!1264641))

(declare-fun m!1164707 () Bool)

(assert (=> b!1264641 m!1164707))

(assert (=> b!1264609 d!138649))

(declare-fun d!138653 () Bool)

(declare-fun res!842209 () Bool)

(declare-fun e!720182 () Bool)

(assert (=> d!138653 (=> res!842209 e!720182)))

(assert (=> d!138653 (= res!842209 (or ((_ is Nil!28369) (toList!9548 lm!212)) ((_ is Nil!28369) (t!41884 (toList!9548 lm!212)))))))

(assert (=> d!138653 (= (isStrictlySorted!771 (toList!9548 lm!212)) e!720182)))

(declare-fun b!1264652 () Bool)

(declare-fun e!720183 () Bool)

(assert (=> b!1264652 (= e!720182 e!720183)))

(declare-fun res!842210 () Bool)

(assert (=> b!1264652 (=> (not res!842210) (not e!720183))))

(assert (=> b!1264652 (= res!842210 (bvslt (_1!10607 (h!29577 (toList!9548 lm!212))) (_1!10607 (h!29577 (t!41884 (toList!9548 lm!212))))))))

(declare-fun b!1264653 () Bool)

(assert (=> b!1264653 (= e!720183 (isStrictlySorted!771 (t!41884 (toList!9548 lm!212))))))

(assert (= (and d!138653 (not res!842209)) b!1264652))

(assert (= (and b!1264652 res!842210) b!1264653))

(declare-fun m!1164711 () Bool)

(assert (=> b!1264653 m!1164711))

(assert (=> b!1264608 d!138653))

(declare-fun d!138657 () Bool)

(declare-fun e!720205 () Bool)

(assert (=> d!138657 e!720205))

(declare-fun res!842223 () Bool)

(assert (=> d!138657 (=> res!842223 e!720205)))

(declare-fun lt!573736 () Bool)

(assert (=> d!138657 (= res!842223 (not lt!573736))))

(declare-fun lt!573733 () Bool)

(assert (=> d!138657 (= lt!573736 lt!573733)))

(declare-fun lt!573734 () Unit!42012)

(declare-fun e!720206 () Unit!42012)

(assert (=> d!138657 (= lt!573734 e!720206)))

(declare-fun c!123148 () Bool)

(assert (=> d!138657 (= c!123148 lt!573733)))

(assert (=> d!138657 (= lt!573733 (containsKey!632 (toList!9548 lm!212) a1!67))))

(assert (=> d!138657 (= (contains!7597 lm!212 a1!67) lt!573736)))

(declare-fun b!1264684 () Bool)

(declare-fun lt!573735 () Unit!42012)

(assert (=> b!1264684 (= e!720206 lt!573735)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!443 (List!28372 (_ BitVec 64)) Unit!42012)

(assert (=> b!1264684 (= lt!573735 (lemmaContainsKeyImpliesGetValueByKeyDefined!443 (toList!9548 lm!212) a1!67))))

(declare-datatypes ((Option!730 0))(
  ( (Some!729 (v!19004 B!1922)) (None!728) )
))
(declare-fun isDefined!486 (Option!730) Bool)

(declare-fun getValueByKey!679 (List!28372 (_ BitVec 64)) Option!730)

(assert (=> b!1264684 (isDefined!486 (getValueByKey!679 (toList!9548 lm!212) a1!67))))

(declare-fun b!1264685 () Bool)

(declare-fun Unit!42019 () Unit!42012)

(assert (=> b!1264685 (= e!720206 Unit!42019)))

(declare-fun b!1264686 () Bool)

(assert (=> b!1264686 (= e!720205 (isDefined!486 (getValueByKey!679 (toList!9548 lm!212) a1!67)))))

(assert (= (and d!138657 c!123148) b!1264684))

(assert (= (and d!138657 (not c!123148)) b!1264685))

(assert (= (and d!138657 (not res!842223)) b!1264686))

(assert (=> d!138657 m!1164655))

(declare-fun m!1164731 () Bool)

(assert (=> b!1264684 m!1164731))

(declare-fun m!1164733 () Bool)

(assert (=> b!1264684 m!1164733))

(assert (=> b!1264684 m!1164733))

(declare-fun m!1164735 () Bool)

(assert (=> b!1264684 m!1164735))

(assert (=> b!1264686 m!1164733))

(assert (=> b!1264686 m!1164733))

(assert (=> b!1264686 m!1164735))

(assert (=> start!106266 d!138657))

(declare-fun d!138667 () Bool)

(assert (=> d!138667 (= (inv!44088 lm!212) (isStrictlySorted!771 (toList!9548 lm!212)))))

(declare-fun bs!35760 () Bool)

(assert (= bs!35760 d!138667))

(assert (=> bs!35760 m!1164653))

(assert (=> start!106266 d!138667))

(declare-fun d!138669 () Bool)

(assert (=> d!138669 (= (removeStrictlySorted!146 (insertStrictlySorted!454 (toList!9548 lm!212) a1!67 b1!78) a1!67) (toList!9548 lm!212))))

(declare-fun lt!573750 () Unit!42012)

(declare-fun choose!1890 (List!28372 (_ BitVec 64) B!1922) Unit!42012)

(assert (=> d!138669 (= lt!573750 (choose!1890 (toList!9548 lm!212) a1!67 b1!78))))

(assert (=> d!138669 (isStrictlySorted!771 (toList!9548 lm!212))))

(assert (=> d!138669 (= (lemmaInsertStrictlySortedThenRemoveIsSame!1 (toList!9548 lm!212) a1!67 b1!78) lt!573750)))

(declare-fun bs!35762 () Bool)

(assert (= bs!35762 d!138669))

(assert (=> bs!35762 m!1164663))

(assert (=> bs!35762 m!1164663))

(assert (=> bs!35762 m!1164665))

(declare-fun m!1164739 () Bool)

(assert (=> bs!35762 m!1164739))

(assert (=> bs!35762 m!1164653))

(assert (=> b!1264610 d!138669))

(declare-fun b!1264718 () Bool)

(declare-fun e!720227 () List!28372)

(assert (=> b!1264718 (= e!720227 (t!41884 (insertStrictlySorted!454 (toList!9548 lm!212) a1!67 b1!78)))))

(declare-fun b!1264719 () Bool)

(declare-fun e!720226 () List!28372)

(assert (=> b!1264719 (= e!720227 e!720226)))

(declare-fun c!123160 () Bool)

(assert (=> b!1264719 (= c!123160 (and ((_ is Cons!28368) (insertStrictlySorted!454 (toList!9548 lm!212) a1!67 b1!78)) (not (= (_1!10607 (h!29577 (insertStrictlySorted!454 (toList!9548 lm!212) a1!67 b1!78))) a1!67))))))

(declare-fun b!1264720 () Bool)

(assert (=> b!1264720 (= e!720226 Nil!28369)))

(declare-fun b!1264721 () Bool)

(declare-fun e!720225 () Bool)

(declare-fun lt!573763 () List!28372)

(assert (=> b!1264721 (= e!720225 (not (containsKey!632 lt!573763 a1!67)))))

(declare-fun d!138673 () Bool)

(assert (=> d!138673 e!720225))

(declare-fun res!842235 () Bool)

(assert (=> d!138673 (=> (not res!842235) (not e!720225))))

(assert (=> d!138673 (= res!842235 (isStrictlySorted!771 lt!573763))))

(assert (=> d!138673 (= lt!573763 e!720227)))

(declare-fun c!123159 () Bool)

(assert (=> d!138673 (= c!123159 (and ((_ is Cons!28368) (insertStrictlySorted!454 (toList!9548 lm!212) a1!67 b1!78)) (= (_1!10607 (h!29577 (insertStrictlySorted!454 (toList!9548 lm!212) a1!67 b1!78))) a1!67)))))

(assert (=> d!138673 (isStrictlySorted!771 (insertStrictlySorted!454 (toList!9548 lm!212) a1!67 b1!78))))

(assert (=> d!138673 (= (removeStrictlySorted!146 (insertStrictlySorted!454 (toList!9548 lm!212) a1!67 b1!78) a1!67) lt!573763)))

(declare-fun b!1264722 () Bool)

(declare-fun $colon$colon!634 (List!28372 tuple2!21192) List!28372)

(assert (=> b!1264722 (= e!720226 ($colon$colon!634 (removeStrictlySorted!146 (t!41884 (insertStrictlySorted!454 (toList!9548 lm!212) a1!67 b1!78)) a1!67) (h!29577 (insertStrictlySorted!454 (toList!9548 lm!212) a1!67 b1!78))))))

(assert (= (and d!138673 c!123159) b!1264718))

(assert (= (and d!138673 (not c!123159)) b!1264719))

(assert (= (and b!1264719 c!123160) b!1264722))

(assert (= (and b!1264719 (not c!123160)) b!1264720))

(assert (= (and d!138673 res!842235) b!1264721))

(declare-fun m!1164767 () Bool)

(assert (=> b!1264721 m!1164767))

(declare-fun m!1164769 () Bool)

(assert (=> d!138673 m!1164769))

(assert (=> d!138673 m!1164663))

(declare-fun m!1164771 () Bool)

(assert (=> d!138673 m!1164771))

(declare-fun m!1164773 () Bool)

(assert (=> b!1264722 m!1164773))

(assert (=> b!1264722 m!1164773))

(declare-fun m!1164775 () Bool)

(assert (=> b!1264722 m!1164775))

(assert (=> b!1264610 d!138673))

(declare-fun d!138681 () Bool)

(declare-fun e!720243 () Bool)

(assert (=> d!138681 e!720243))

(declare-fun res!842251 () Bool)

(assert (=> d!138681 (=> (not res!842251) (not e!720243))))

(declare-fun lt!573789 () ListLongMap!19065)

(assert (=> d!138681 (= res!842251 (contains!7597 lt!573789 (_1!10607 (tuple2!21193 a1!67 b1!78))))))

(declare-fun lt!573790 () List!28372)

(assert (=> d!138681 (= lt!573789 (ListLongMap!19066 lt!573790))))

(declare-fun lt!573788 () Unit!42012)

(declare-fun lt!573791 () Unit!42012)

(assert (=> d!138681 (= lt!573788 lt!573791)))

(assert (=> d!138681 (= (getValueByKey!679 lt!573790 (_1!10607 (tuple2!21193 a1!67 b1!78))) (Some!729 (_2!10607 (tuple2!21193 a1!67 b1!78))))))

(declare-fun lemmaContainsTupThenGetReturnValue!341 (List!28372 (_ BitVec 64) B!1922) Unit!42012)

(assert (=> d!138681 (= lt!573791 (lemmaContainsTupThenGetReturnValue!341 lt!573790 (_1!10607 (tuple2!21193 a1!67 b1!78)) (_2!10607 (tuple2!21193 a1!67 b1!78))))))

(assert (=> d!138681 (= lt!573790 (insertStrictlySorted!454 (toList!9548 lm!212) (_1!10607 (tuple2!21193 a1!67 b1!78)) (_2!10607 (tuple2!21193 a1!67 b1!78))))))

(assert (=> d!138681 (= (+!4303 lm!212 (tuple2!21193 a1!67 b1!78)) lt!573789)))

(declare-fun b!1264753 () Bool)

(declare-fun res!842250 () Bool)

(assert (=> b!1264753 (=> (not res!842250) (not e!720243))))

(assert (=> b!1264753 (= res!842250 (= (getValueByKey!679 (toList!9548 lt!573789) (_1!10607 (tuple2!21193 a1!67 b1!78))) (Some!729 (_2!10607 (tuple2!21193 a1!67 b1!78)))))))

(declare-fun b!1264754 () Bool)

(declare-fun contains!7601 (List!28372 tuple2!21192) Bool)

(assert (=> b!1264754 (= e!720243 (contains!7601 (toList!9548 lt!573789) (tuple2!21193 a1!67 b1!78)))))

(assert (= (and d!138681 res!842251) b!1264753))

(assert (= (and b!1264753 res!842250) b!1264754))

(declare-fun m!1164793 () Bool)

(assert (=> d!138681 m!1164793))

(declare-fun m!1164795 () Bool)

(assert (=> d!138681 m!1164795))

(declare-fun m!1164797 () Bool)

(assert (=> d!138681 m!1164797))

(declare-fun m!1164799 () Bool)

(assert (=> d!138681 m!1164799))

(declare-fun m!1164801 () Bool)

(assert (=> b!1264753 m!1164801))

(declare-fun m!1164803 () Bool)

(assert (=> b!1264754 m!1164803))

(assert (=> b!1264610 d!138681))

(declare-fun d!138687 () Bool)

(declare-fun lt!573796 () ListLongMap!19065)

(assert (=> d!138687 (not (contains!7597 lt!573796 a1!67))))

(assert (=> d!138687 (= lt!573796 (ListLongMap!19066 (removeStrictlySorted!146 (toList!9548 (+!4303 lm!212 (tuple2!21193 a1!67 b1!78))) a1!67)))))

(assert (=> d!138687 (= (-!2106 (+!4303 lm!212 (tuple2!21193 a1!67 b1!78)) a1!67) lt!573796)))

(declare-fun bs!35765 () Bool)

(assert (= bs!35765 d!138687))

(declare-fun m!1164805 () Bool)

(assert (=> bs!35765 m!1164805))

(declare-fun m!1164807 () Bool)

(assert (=> bs!35765 m!1164807))

(assert (=> b!1264610 d!138687))

(declare-fun e!720294 () List!28372)

(declare-fun b!1264836 () Bool)

(declare-fun c!123197 () Bool)

(declare-fun c!123196 () Bool)

(assert (=> b!1264836 (= e!720294 (ite c!123197 (t!41884 (toList!9548 lm!212)) (ite c!123196 (Cons!28368 (h!29577 (toList!9548 lm!212)) (t!41884 (toList!9548 lm!212))) Nil!28369)))))

(declare-fun b!1264837 () Bool)

(declare-fun e!720293 () List!28372)

(declare-fun call!62340 () List!28372)

(assert (=> b!1264837 (= e!720293 call!62340)))

(declare-fun d!138689 () Bool)

(declare-fun e!720295 () Bool)

(assert (=> d!138689 e!720295))

(declare-fun res!842279 () Bool)

(assert (=> d!138689 (=> (not res!842279) (not e!720295))))

(declare-fun lt!573814 () List!28372)

(assert (=> d!138689 (= res!842279 (isStrictlySorted!771 lt!573814))))

(declare-fun e!720292 () List!28372)

(assert (=> d!138689 (= lt!573814 e!720292)))

(declare-fun c!123199 () Bool)

(assert (=> d!138689 (= c!123199 (and ((_ is Cons!28368) (toList!9548 lm!212)) (bvslt (_1!10607 (h!29577 (toList!9548 lm!212))) a1!67)))))

(assert (=> d!138689 (isStrictlySorted!771 (toList!9548 lm!212))))

(assert (=> d!138689 (= (insertStrictlySorted!454 (toList!9548 lm!212) a1!67 b1!78) lt!573814)))

(declare-fun b!1264838 () Bool)

(assert (=> b!1264838 (= e!720294 (insertStrictlySorted!454 (t!41884 (toList!9548 lm!212)) a1!67 b1!78))))

(declare-fun call!62338 () List!28372)

(declare-fun bm!62335 () Bool)

(assert (=> bm!62335 (= call!62338 ($colon$colon!634 e!720294 (ite c!123199 (h!29577 (toList!9548 lm!212)) (tuple2!21193 a1!67 b1!78))))))

(declare-fun c!123198 () Bool)

(assert (=> bm!62335 (= c!123198 c!123199)))

(declare-fun b!1264839 () Bool)

(assert (=> b!1264839 (= e!720293 call!62340)))

(declare-fun bm!62336 () Bool)

(declare-fun call!62339 () List!28372)

(assert (=> bm!62336 (= call!62339 call!62338)))

(declare-fun b!1264840 () Bool)

(declare-fun e!720296 () List!28372)

(assert (=> b!1264840 (= e!720292 e!720296)))

(assert (=> b!1264840 (= c!123197 (and ((_ is Cons!28368) (toList!9548 lm!212)) (= (_1!10607 (h!29577 (toList!9548 lm!212))) a1!67)))))

(declare-fun b!1264841 () Bool)

(assert (=> b!1264841 (= e!720296 call!62339)))

(declare-fun b!1264842 () Bool)

(assert (=> b!1264842 (= e!720292 call!62338)))

(declare-fun b!1264843 () Bool)

(declare-fun res!842280 () Bool)

(assert (=> b!1264843 (=> (not res!842280) (not e!720295))))

(assert (=> b!1264843 (= res!842280 (containsKey!632 lt!573814 a1!67))))

(declare-fun b!1264844 () Bool)

(assert (=> b!1264844 (= e!720295 (contains!7601 lt!573814 (tuple2!21193 a1!67 b1!78)))))

(declare-fun b!1264845 () Bool)

(assert (=> b!1264845 (= c!123196 (and ((_ is Cons!28368) (toList!9548 lm!212)) (bvsgt (_1!10607 (h!29577 (toList!9548 lm!212))) a1!67)))))

(assert (=> b!1264845 (= e!720296 e!720293)))

(declare-fun bm!62337 () Bool)

(assert (=> bm!62337 (= call!62340 call!62339)))

(assert (= (and d!138689 c!123199) b!1264842))

(assert (= (and d!138689 (not c!123199)) b!1264840))

(assert (= (and b!1264840 c!123197) b!1264841))

(assert (= (and b!1264840 (not c!123197)) b!1264845))

(assert (= (and b!1264845 c!123196) b!1264839))

(assert (= (and b!1264845 (not c!123196)) b!1264837))

(assert (= (or b!1264839 b!1264837) bm!62337))

(assert (= (or b!1264841 bm!62337) bm!62336))

(assert (= (or b!1264842 bm!62336) bm!62335))

(assert (= (and bm!62335 c!123198) b!1264838))

(assert (= (and bm!62335 (not c!123198)) b!1264836))

(assert (= (and d!138689 res!842279) b!1264843))

(assert (= (and b!1264843 res!842280) b!1264844))

(declare-fun m!1164837 () Bool)

(assert (=> b!1264844 m!1164837))

(declare-fun m!1164839 () Bool)

(assert (=> d!138689 m!1164839))

(assert (=> d!138689 m!1164653))

(declare-fun m!1164841 () Bool)

(assert (=> b!1264843 m!1164841))

(declare-fun m!1164845 () Bool)

(assert (=> b!1264838 m!1164845))

(declare-fun m!1164847 () Bool)

(assert (=> bm!62335 m!1164847))

(assert (=> b!1264610 d!138689))

(declare-fun b!1264865 () Bool)

(declare-fun e!720310 () Bool)

(declare-fun tp!96251 () Bool)

(assert (=> b!1264865 (= e!720310 (and tp_is_empty!32455 tp!96251))))

(assert (=> b!1264611 (= tp!96239 e!720310)))

(assert (= (and b!1264611 ((_ is Cons!28368) (toList!9548 lm!212))) b!1264865))

(check-sat (not b!1264843) (not d!138689) (not b!1264722) (not d!138667) (not b!1264684) (not b!1264721) tp_is_empty!32455 (not b!1264753) (not b!1264838) (not d!138673) (not b!1264844) (not b!1264686) (not d!138681) (not b!1264641) (not b!1264653) (not bm!62335) (not d!138687) (not d!138657) (not d!138669) (not b!1264865) (not b!1264754))
(check-sat)
