; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115780 () Bool)

(assert start!115780)

(declare-fun b!1368177 () Bool)

(declare-fun res!910948 () Bool)

(declare-fun e!775528 () Bool)

(assert (=> b!1368177 (=> (not res!910948) (not e!775528))))

(declare-datatypes ((List!31951 0))(
  ( (Nil!31948) (Cons!31947 (h!33165 (_ BitVec 64)) (t!46637 List!31951)) )
))
(declare-fun acc!866 () List!31951)

(declare-fun contains!9636 (List!31951 (_ BitVec 64)) Bool)

(assert (=> b!1368177 (= res!910948 (not (contains!9636 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368178 () Bool)

(declare-fun res!910946 () Bool)

(declare-fun e!775527 () Bool)

(assert (=> b!1368178 (=> (not res!910946) (not e!775527))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92947 0))(
  ( (array!92948 (arr!44896 (Array (_ BitVec 32) (_ BitVec 64))) (size!45447 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92947)

(assert (=> b!1368178 (= res!910946 (bvslt from!3239 (size!45447 a!3861)))))

(declare-fun b!1368179 () Bool)

(declare-fun res!910950 () Bool)

(assert (=> b!1368179 (=> (not res!910950) (not e!775527))))

(assert (=> b!1368179 (= res!910950 (not (contains!9636 acc!866 (select (arr!44896 a!3861) from!3239))))))

(declare-fun b!1368180 () Bool)

(declare-fun res!910956 () Bool)

(assert (=> b!1368180 (=> (not res!910956) (not e!775527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368180 (= res!910956 (validKeyInArray!0 (select (arr!44896 a!3861) from!3239)))))

(declare-fun res!910953 () Bool)

(assert (=> start!115780 (=> (not res!910953) (not e!775528))))

(assert (=> start!115780 (= res!910953 (and (bvslt (size!45447 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45447 a!3861))))))

(assert (=> start!115780 e!775528))

(declare-fun array_inv!34177 (array!92947) Bool)

(assert (=> start!115780 (array_inv!34177 a!3861)))

(assert (=> start!115780 true))

(declare-fun b!1368181 () Bool)

(declare-fun res!910952 () Bool)

(assert (=> b!1368181 (=> (not res!910952) (not e!775528))))

(declare-fun newAcc!98 () List!31951)

(declare-fun subseq!995 (List!31951 List!31951) Bool)

(assert (=> b!1368181 (= res!910952 (subseq!995 newAcc!98 acc!866))))

(declare-fun b!1368182 () Bool)

(declare-fun res!910949 () Bool)

(assert (=> b!1368182 (=> (not res!910949) (not e!775528))))

(assert (=> b!1368182 (= res!910949 (not (contains!9636 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368183 () Bool)

(declare-fun noDuplicate!2467 (List!31951) Bool)

(assert (=> b!1368183 (= e!775527 (not (noDuplicate!2467 newAcc!98)))))

(declare-datatypes ((Unit!45062 0))(
  ( (Unit!45063) )
))
(declare-fun lt!602196 () Unit!45062)

(declare-fun lt!602199 () List!31951)

(declare-fun lt!602197 () List!31951)

(declare-fun noDuplicateSubseq!182 (List!31951 List!31951) Unit!45062)

(assert (=> b!1368183 (= lt!602196 (noDuplicateSubseq!182 lt!602199 lt!602197))))

(declare-fun arrayNoDuplicates!0 (array!92947 (_ BitVec 32) List!31951) Bool)

(assert (=> b!1368183 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602199)))

(declare-fun lt!602195 () Unit!45062)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92947 List!31951 List!31951 (_ BitVec 32)) Unit!45062)

(assert (=> b!1368183 (= lt!602195 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!602197 lt!602199 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1368183 (= lt!602199 (Cons!31947 (select (arr!44896 a!3861) from!3239) newAcc!98))))

(assert (=> b!1368183 (= lt!602197 (Cons!31947 (select (arr!44896 a!3861) from!3239) acc!866))))

(declare-fun b!1368184 () Bool)

(declare-fun res!910951 () Bool)

(assert (=> b!1368184 (=> (not res!910951) (not e!775528))))

(assert (=> b!1368184 (= res!910951 (noDuplicate!2467 acc!866))))

(declare-fun b!1368185 () Bool)

(assert (=> b!1368185 (= e!775528 e!775527)))

(declare-fun res!910947 () Bool)

(assert (=> b!1368185 (=> (not res!910947) (not e!775527))))

(assert (=> b!1368185 (= res!910947 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!602198 () Unit!45062)

(assert (=> b!1368185 (= lt!602198 (noDuplicateSubseq!182 newAcc!98 acc!866))))

(declare-fun b!1368186 () Bool)

(declare-fun res!910955 () Bool)

(assert (=> b!1368186 (=> (not res!910955) (not e!775528))))

(assert (=> b!1368186 (= res!910955 (not (contains!9636 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368187 () Bool)

(declare-fun res!910954 () Bool)

(assert (=> b!1368187 (=> (not res!910954) (not e!775528))))

(assert (=> b!1368187 (= res!910954 (not (contains!9636 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115780 res!910953) b!1368184))

(assert (= (and b!1368184 res!910951) b!1368187))

(assert (= (and b!1368187 res!910954) b!1368177))

(assert (= (and b!1368177 res!910948) b!1368182))

(assert (= (and b!1368182 res!910949) b!1368186))

(assert (= (and b!1368186 res!910955) b!1368181))

(assert (= (and b!1368181 res!910952) b!1368185))

(assert (= (and b!1368185 res!910947) b!1368178))

(assert (= (and b!1368178 res!910946) b!1368180))

(assert (= (and b!1368180 res!910956) b!1368179))

(assert (= (and b!1368179 res!910950) b!1368183))

(declare-fun m!1252741 () Bool)

(assert (=> b!1368182 m!1252741))

(declare-fun m!1252743 () Bool)

(assert (=> start!115780 m!1252743))

(declare-fun m!1252745 () Bool)

(assert (=> b!1368187 m!1252745))

(declare-fun m!1252747 () Bool)

(assert (=> b!1368184 m!1252747))

(declare-fun m!1252749 () Bool)

(assert (=> b!1368179 m!1252749))

(assert (=> b!1368179 m!1252749))

(declare-fun m!1252751 () Bool)

(assert (=> b!1368179 m!1252751))

(assert (=> b!1368180 m!1252749))

(assert (=> b!1368180 m!1252749))

(declare-fun m!1252753 () Bool)

(assert (=> b!1368180 m!1252753))

(declare-fun m!1252755 () Bool)

(assert (=> b!1368183 m!1252755))

(declare-fun m!1252757 () Bool)

(assert (=> b!1368183 m!1252757))

(declare-fun m!1252759 () Bool)

(assert (=> b!1368183 m!1252759))

(declare-fun m!1252761 () Bool)

(assert (=> b!1368183 m!1252761))

(assert (=> b!1368183 m!1252749))

(declare-fun m!1252763 () Bool)

(assert (=> b!1368177 m!1252763))

(declare-fun m!1252765 () Bool)

(assert (=> b!1368181 m!1252765))

(declare-fun m!1252767 () Bool)

(assert (=> b!1368186 m!1252767))

(declare-fun m!1252769 () Bool)

(assert (=> b!1368185 m!1252769))

(declare-fun m!1252771 () Bool)

(assert (=> b!1368185 m!1252771))

(check-sat (not b!1368180) (not b!1368184) (not b!1368186) (not b!1368185) (not start!115780) (not b!1368182) (not b!1368177) (not b!1368187) (not b!1368183) (not b!1368181) (not b!1368179))
(check-sat)
(get-model)

(declare-fun d!147165 () Bool)

(declare-fun lt!602232 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!710 (List!31951) (InoxSet (_ BitVec 64)))

(assert (=> d!147165 (= lt!602232 (select (content!710 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775551 () Bool)

(assert (=> d!147165 (= lt!602232 e!775551)))

(declare-fun res!911028 () Bool)

(assert (=> d!147165 (=> (not res!911028) (not e!775551))))

(get-info :version)

(assert (=> d!147165 (= res!911028 ((_ is Cons!31947) acc!866))))

(assert (=> d!147165 (= (contains!9636 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602232)))

(declare-fun b!1368258 () Bool)

(declare-fun e!775552 () Bool)

(assert (=> b!1368258 (= e!775551 e!775552)))

(declare-fun res!911027 () Bool)

(assert (=> b!1368258 (=> res!911027 e!775552)))

(assert (=> b!1368258 (= res!911027 (= (h!33165 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1368259 () Bool)

(assert (=> b!1368259 (= e!775552 (contains!9636 (t!46637 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147165 res!911028) b!1368258))

(assert (= (and b!1368258 (not res!911027)) b!1368259))

(declare-fun m!1252837 () Bool)

(assert (=> d!147165 m!1252837))

(declare-fun m!1252839 () Bool)

(assert (=> d!147165 m!1252839))

(declare-fun m!1252841 () Bool)

(assert (=> b!1368259 m!1252841))

(assert (=> b!1368187 d!147165))

(declare-fun d!147167 () Bool)

(declare-fun lt!602233 () Bool)

(assert (=> d!147167 (= lt!602233 (select (content!710 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775553 () Bool)

(assert (=> d!147167 (= lt!602233 e!775553)))

(declare-fun res!911030 () Bool)

(assert (=> d!147167 (=> (not res!911030) (not e!775553))))

(assert (=> d!147167 (= res!911030 ((_ is Cons!31947) acc!866))))

(assert (=> d!147167 (= (contains!9636 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602233)))

(declare-fun b!1368260 () Bool)

(declare-fun e!775554 () Bool)

(assert (=> b!1368260 (= e!775553 e!775554)))

(declare-fun res!911029 () Bool)

(assert (=> b!1368260 (=> res!911029 e!775554)))

(assert (=> b!1368260 (= res!911029 (= (h!33165 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1368261 () Bool)

(assert (=> b!1368261 (= e!775554 (contains!9636 (t!46637 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147167 res!911030) b!1368260))

(assert (= (and b!1368260 (not res!911029)) b!1368261))

(assert (=> d!147167 m!1252837))

(declare-fun m!1252843 () Bool)

(assert (=> d!147167 m!1252843))

(declare-fun m!1252845 () Bool)

(assert (=> b!1368261 m!1252845))

(assert (=> b!1368177 d!147167))

(declare-fun d!147169 () Bool)

(declare-fun lt!602234 () Bool)

(assert (=> d!147169 (= lt!602234 (select (content!710 acc!866) (select (arr!44896 a!3861) from!3239)))))

(declare-fun e!775555 () Bool)

(assert (=> d!147169 (= lt!602234 e!775555)))

(declare-fun res!911032 () Bool)

(assert (=> d!147169 (=> (not res!911032) (not e!775555))))

(assert (=> d!147169 (= res!911032 ((_ is Cons!31947) acc!866))))

(assert (=> d!147169 (= (contains!9636 acc!866 (select (arr!44896 a!3861) from!3239)) lt!602234)))

(declare-fun b!1368262 () Bool)

(declare-fun e!775556 () Bool)

(assert (=> b!1368262 (= e!775555 e!775556)))

(declare-fun res!911031 () Bool)

(assert (=> b!1368262 (=> res!911031 e!775556)))

(assert (=> b!1368262 (= res!911031 (= (h!33165 acc!866) (select (arr!44896 a!3861) from!3239)))))

(declare-fun b!1368263 () Bool)

(assert (=> b!1368263 (= e!775556 (contains!9636 (t!46637 acc!866) (select (arr!44896 a!3861) from!3239)))))

(assert (= (and d!147169 res!911032) b!1368262))

(assert (= (and b!1368262 (not res!911031)) b!1368263))

(assert (=> d!147169 m!1252837))

(assert (=> d!147169 m!1252749))

(declare-fun m!1252847 () Bool)

(assert (=> d!147169 m!1252847))

(assert (=> b!1368263 m!1252749))

(declare-fun m!1252849 () Bool)

(assert (=> b!1368263 m!1252849))

(assert (=> b!1368179 d!147169))

(declare-fun d!147171 () Bool)

(assert (=> d!147171 (= (validKeyInArray!0 (select (arr!44896 a!3861) from!3239)) (and (not (= (select (arr!44896 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44896 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1368180 d!147171))

(declare-fun b!1368273 () Bool)

(declare-fun e!775568 () Bool)

(declare-fun e!775566 () Bool)

(assert (=> b!1368273 (= e!775568 e!775566)))

(declare-fun res!911041 () Bool)

(assert (=> b!1368273 (=> res!911041 e!775566)))

(declare-fun e!775567 () Bool)

(assert (=> b!1368273 (= res!911041 e!775567)))

(declare-fun res!911042 () Bool)

(assert (=> b!1368273 (=> (not res!911042) (not e!775567))))

(assert (=> b!1368273 (= res!911042 (= (h!33165 newAcc!98) (h!33165 acc!866)))))

(declare-fun d!147173 () Bool)

(declare-fun res!911044 () Bool)

(declare-fun e!775565 () Bool)

(assert (=> d!147173 (=> res!911044 e!775565)))

(assert (=> d!147173 (= res!911044 ((_ is Nil!31948) newAcc!98))))

(assert (=> d!147173 (= (subseq!995 newAcc!98 acc!866) e!775565)))

(declare-fun b!1368275 () Bool)

(assert (=> b!1368275 (= e!775566 (subseq!995 newAcc!98 (t!46637 acc!866)))))

(declare-fun b!1368272 () Bool)

(assert (=> b!1368272 (= e!775565 e!775568)))

(declare-fun res!911043 () Bool)

(assert (=> b!1368272 (=> (not res!911043) (not e!775568))))

(assert (=> b!1368272 (= res!911043 ((_ is Cons!31947) acc!866))))

(declare-fun b!1368274 () Bool)

(assert (=> b!1368274 (= e!775567 (subseq!995 (t!46637 newAcc!98) (t!46637 acc!866)))))

(assert (= (and d!147173 (not res!911044)) b!1368272))

(assert (= (and b!1368272 res!911043) b!1368273))

(assert (= (and b!1368273 res!911042) b!1368274))

(assert (= (and b!1368273 (not res!911041)) b!1368275))

(declare-fun m!1252851 () Bool)

(assert (=> b!1368275 m!1252851))

(declare-fun m!1252853 () Bool)

(assert (=> b!1368274 m!1252853))

(assert (=> b!1368181 d!147173))

(declare-fun d!147175 () Bool)

(declare-fun lt!602235 () Bool)

(assert (=> d!147175 (= lt!602235 (select (content!710 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775569 () Bool)

(assert (=> d!147175 (= lt!602235 e!775569)))

(declare-fun res!911046 () Bool)

(assert (=> d!147175 (=> (not res!911046) (not e!775569))))

(assert (=> d!147175 (= res!911046 ((_ is Cons!31947) newAcc!98))))

(assert (=> d!147175 (= (contains!9636 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602235)))

(declare-fun b!1368276 () Bool)

(declare-fun e!775570 () Bool)

(assert (=> b!1368276 (= e!775569 e!775570)))

(declare-fun res!911045 () Bool)

(assert (=> b!1368276 (=> res!911045 e!775570)))

(assert (=> b!1368276 (= res!911045 (= (h!33165 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1368277 () Bool)

(assert (=> b!1368277 (= e!775570 (contains!9636 (t!46637 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147175 res!911046) b!1368276))

(assert (= (and b!1368276 (not res!911045)) b!1368277))

(declare-fun m!1252855 () Bool)

(assert (=> d!147175 m!1252855))

(declare-fun m!1252857 () Bool)

(assert (=> d!147175 m!1252857))

(declare-fun m!1252859 () Bool)

(assert (=> b!1368277 m!1252859))

(assert (=> b!1368182 d!147175))

(declare-fun d!147177 () Bool)

(assert (=> d!147177 (= (array_inv!34177 a!3861) (bvsge (size!45447 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115780 d!147177))

(declare-fun d!147179 () Bool)

(declare-fun res!911055 () Bool)

(declare-fun e!775579 () Bool)

(assert (=> d!147179 (=> res!911055 e!775579)))

(assert (=> d!147179 (= res!911055 ((_ is Nil!31948) newAcc!98))))

(assert (=> d!147179 (= (noDuplicate!2467 newAcc!98) e!775579)))

(declare-fun b!1368286 () Bool)

(declare-fun e!775580 () Bool)

(assert (=> b!1368286 (= e!775579 e!775580)))

(declare-fun res!911056 () Bool)

(assert (=> b!1368286 (=> (not res!911056) (not e!775580))))

(assert (=> b!1368286 (= res!911056 (not (contains!9636 (t!46637 newAcc!98) (h!33165 newAcc!98))))))

(declare-fun b!1368287 () Bool)

(assert (=> b!1368287 (= e!775580 (noDuplicate!2467 (t!46637 newAcc!98)))))

(assert (= (and d!147179 (not res!911055)) b!1368286))

(assert (= (and b!1368286 res!911056) b!1368287))

(declare-fun m!1252861 () Bool)

(assert (=> b!1368286 m!1252861))

(declare-fun m!1252863 () Bool)

(assert (=> b!1368287 m!1252863))

(assert (=> b!1368183 d!147179))

(declare-fun d!147185 () Bool)

(assert (=> d!147185 (noDuplicate!2467 lt!602199)))

(declare-fun lt!602246 () Unit!45062)

(declare-fun choose!1998 (List!31951 List!31951) Unit!45062)

(assert (=> d!147185 (= lt!602246 (choose!1998 lt!602199 lt!602197))))

(declare-fun e!775603 () Bool)

(assert (=> d!147185 e!775603))

(declare-fun res!911079 () Bool)

(assert (=> d!147185 (=> (not res!911079) (not e!775603))))

(assert (=> d!147185 (= res!911079 (subseq!995 lt!602199 lt!602197))))

(assert (=> d!147185 (= (noDuplicateSubseq!182 lt!602199 lt!602197) lt!602246)))

(declare-fun b!1368310 () Bool)

(assert (=> b!1368310 (= e!775603 (noDuplicate!2467 lt!602197))))

(assert (= (and d!147185 res!911079) b!1368310))

(declare-fun m!1252885 () Bool)

(assert (=> d!147185 m!1252885))

(declare-fun m!1252887 () Bool)

(assert (=> d!147185 m!1252887))

(declare-fun m!1252889 () Bool)

(assert (=> d!147185 m!1252889))

(declare-fun m!1252891 () Bool)

(assert (=> b!1368310 m!1252891))

(assert (=> b!1368183 d!147185))

(declare-fun bm!65536 () Bool)

(declare-fun c!128065 () Bool)

(declare-fun call!65539 () Bool)

(assert (=> bm!65536 (= call!65539 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!128065 (Cons!31947 (select (arr!44896 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!602199) lt!602199)))))

(declare-fun b!1368355 () Bool)

(declare-fun e!775646 () Bool)

(assert (=> b!1368355 (= e!775646 call!65539)))

(declare-fun b!1368356 () Bool)

(declare-fun e!775647 () Bool)

(assert (=> b!1368356 (= e!775647 e!775646)))

(assert (=> b!1368356 (= c!128065 (validKeyInArray!0 (select (arr!44896 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1368357 () Bool)

(declare-fun e!775648 () Bool)

(assert (=> b!1368357 (= e!775648 (contains!9636 lt!602199 (select (arr!44896 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1368358 () Bool)

(declare-fun e!775645 () Bool)

(assert (=> b!1368358 (= e!775645 e!775647)))

(declare-fun res!911119 () Bool)

(assert (=> b!1368358 (=> (not res!911119) (not e!775647))))

(assert (=> b!1368358 (= res!911119 (not e!775648))))

(declare-fun res!911121 () Bool)

(assert (=> b!1368358 (=> (not res!911121) (not e!775648))))

(assert (=> b!1368358 (= res!911121 (validKeyInArray!0 (select (arr!44896 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1368354 () Bool)

(assert (=> b!1368354 (= e!775646 call!65539)))

(declare-fun d!147195 () Bool)

(declare-fun res!911120 () Bool)

(assert (=> d!147195 (=> res!911120 e!775645)))

(assert (=> d!147195 (= res!911120 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45447 a!3861)))))

(assert (=> d!147195 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602199) e!775645)))

(assert (= (and d!147195 (not res!911120)) b!1368358))

(assert (= (and b!1368358 res!911121) b!1368357))

(assert (= (and b!1368358 res!911119) b!1368356))

(assert (= (and b!1368356 c!128065) b!1368354))

(assert (= (and b!1368356 (not c!128065)) b!1368355))

(assert (= (or b!1368354 b!1368355) bm!65536))

(declare-fun m!1252933 () Bool)

(assert (=> bm!65536 m!1252933))

(declare-fun m!1252935 () Bool)

(assert (=> bm!65536 m!1252935))

(assert (=> b!1368356 m!1252933))

(assert (=> b!1368356 m!1252933))

(declare-fun m!1252937 () Bool)

(assert (=> b!1368356 m!1252937))

(assert (=> b!1368357 m!1252933))

(assert (=> b!1368357 m!1252933))

(declare-fun m!1252939 () Bool)

(assert (=> b!1368357 m!1252939))

(assert (=> b!1368358 m!1252933))

(assert (=> b!1368358 m!1252933))

(assert (=> b!1368358 m!1252937))

(assert (=> b!1368183 d!147195))

(declare-fun d!147217 () Bool)

(assert (=> d!147217 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602199)))

(declare-fun lt!602256 () Unit!45062)

(declare-fun choose!80 (array!92947 List!31951 List!31951 (_ BitVec 32)) Unit!45062)

(assert (=> d!147217 (= lt!602256 (choose!80 a!3861 lt!602197 lt!602199 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!147217 (bvslt (size!45447 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!147217 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!602197 lt!602199 (bvadd #b00000000000000000000000000000001 from!3239)) lt!602256)))

(declare-fun bs!39232 () Bool)

(assert (= bs!39232 d!147217))

(assert (=> bs!39232 m!1252761))

(declare-fun m!1252953 () Bool)

(assert (=> bs!39232 m!1252953))

(assert (=> b!1368183 d!147217))

(declare-fun d!147223 () Bool)

(declare-fun res!911137 () Bool)

(declare-fun e!775667 () Bool)

(assert (=> d!147223 (=> res!911137 e!775667)))

(assert (=> d!147223 (= res!911137 ((_ is Nil!31948) acc!866))))

(assert (=> d!147223 (= (noDuplicate!2467 acc!866) e!775667)))

(declare-fun b!1368380 () Bool)

(declare-fun e!775668 () Bool)

(assert (=> b!1368380 (= e!775667 e!775668)))

(declare-fun res!911138 () Bool)

(assert (=> b!1368380 (=> (not res!911138) (not e!775668))))

(assert (=> b!1368380 (= res!911138 (not (contains!9636 (t!46637 acc!866) (h!33165 acc!866))))))

(declare-fun b!1368381 () Bool)

(assert (=> b!1368381 (= e!775668 (noDuplicate!2467 (t!46637 acc!866)))))

(assert (= (and d!147223 (not res!911137)) b!1368380))

(assert (= (and b!1368380 res!911138) b!1368381))

(declare-fun m!1252955 () Bool)

(assert (=> b!1368380 m!1252955))

(declare-fun m!1252957 () Bool)

(assert (=> b!1368381 m!1252957))

(assert (=> b!1368184 d!147223))

(declare-fun c!128069 () Bool)

(declare-fun bm!65540 () Bool)

(declare-fun call!65543 () Bool)

(assert (=> bm!65540 (= call!65543 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!128069 (Cons!31947 (select (arr!44896 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1368383 () Bool)

(declare-fun e!775670 () Bool)

(assert (=> b!1368383 (= e!775670 call!65543)))

(declare-fun b!1368384 () Bool)

(declare-fun e!775671 () Bool)

(assert (=> b!1368384 (= e!775671 e!775670)))

(assert (=> b!1368384 (= c!128069 (validKeyInArray!0 (select (arr!44896 a!3861) from!3239)))))

(declare-fun b!1368385 () Bool)

(declare-fun e!775672 () Bool)

(assert (=> b!1368385 (= e!775672 (contains!9636 acc!866 (select (arr!44896 a!3861) from!3239)))))

(declare-fun b!1368386 () Bool)

(declare-fun e!775669 () Bool)

(assert (=> b!1368386 (= e!775669 e!775671)))

(declare-fun res!911139 () Bool)

(assert (=> b!1368386 (=> (not res!911139) (not e!775671))))

(assert (=> b!1368386 (= res!911139 (not e!775672))))

(declare-fun res!911141 () Bool)

(assert (=> b!1368386 (=> (not res!911141) (not e!775672))))

(assert (=> b!1368386 (= res!911141 (validKeyInArray!0 (select (arr!44896 a!3861) from!3239)))))

(declare-fun b!1368382 () Bool)

(assert (=> b!1368382 (= e!775670 call!65543)))

(declare-fun d!147225 () Bool)

(declare-fun res!911140 () Bool)

(assert (=> d!147225 (=> res!911140 e!775669)))

(assert (=> d!147225 (= res!911140 (bvsge from!3239 (size!45447 a!3861)))))

(assert (=> d!147225 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!775669)))

(assert (= (and d!147225 (not res!911140)) b!1368386))

(assert (= (and b!1368386 res!911141) b!1368385))

(assert (= (and b!1368386 res!911139) b!1368384))

(assert (= (and b!1368384 c!128069) b!1368382))

(assert (= (and b!1368384 (not c!128069)) b!1368383))

(assert (= (or b!1368382 b!1368383) bm!65540))

(assert (=> bm!65540 m!1252749))

(declare-fun m!1252959 () Bool)

(assert (=> bm!65540 m!1252959))

(assert (=> b!1368384 m!1252749))

(assert (=> b!1368384 m!1252749))

(assert (=> b!1368384 m!1252753))

(assert (=> b!1368385 m!1252749))

(assert (=> b!1368385 m!1252749))

(assert (=> b!1368385 m!1252751))

(assert (=> b!1368386 m!1252749))

(assert (=> b!1368386 m!1252749))

(assert (=> b!1368386 m!1252753))

(assert (=> b!1368185 d!147225))

(declare-fun d!147229 () Bool)

(assert (=> d!147229 (noDuplicate!2467 newAcc!98)))

(declare-fun lt!602261 () Unit!45062)

(assert (=> d!147229 (= lt!602261 (choose!1998 newAcc!98 acc!866))))

(declare-fun e!775675 () Bool)

(assert (=> d!147229 e!775675))

(declare-fun res!911144 () Bool)

(assert (=> d!147229 (=> (not res!911144) (not e!775675))))

(assert (=> d!147229 (= res!911144 (subseq!995 newAcc!98 acc!866))))

(assert (=> d!147229 (= (noDuplicateSubseq!182 newAcc!98 acc!866) lt!602261)))

(declare-fun b!1368389 () Bool)

(assert (=> b!1368389 (= e!775675 (noDuplicate!2467 acc!866))))

(assert (= (and d!147229 res!911144) b!1368389))

(assert (=> d!147229 m!1252755))

(declare-fun m!1252970 () Bool)

(assert (=> d!147229 m!1252970))

(assert (=> d!147229 m!1252765))

(assert (=> b!1368389 m!1252747))

(assert (=> b!1368185 d!147229))

(declare-fun d!147235 () Bool)

(declare-fun lt!602263 () Bool)

(assert (=> d!147235 (= lt!602263 (select (content!710 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775686 () Bool)

(assert (=> d!147235 (= lt!602263 e!775686)))

(declare-fun res!911156 () Bool)

(assert (=> d!147235 (=> (not res!911156) (not e!775686))))

(assert (=> d!147235 (= res!911156 ((_ is Cons!31947) newAcc!98))))

(assert (=> d!147235 (= (contains!9636 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602263)))

(declare-fun b!1368402 () Bool)

(declare-fun e!775687 () Bool)

(assert (=> b!1368402 (= e!775686 e!775687)))

(declare-fun res!911155 () Bool)

(assert (=> b!1368402 (=> res!911155 e!775687)))

(assert (=> b!1368402 (= res!911155 (= (h!33165 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1368403 () Bool)

(assert (=> b!1368403 (= e!775687 (contains!9636 (t!46637 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147235 res!911156) b!1368402))

(assert (= (and b!1368402 (not res!911155)) b!1368403))

(assert (=> d!147235 m!1252855))

(declare-fun m!1252977 () Bool)

(assert (=> d!147235 m!1252977))

(declare-fun m!1252979 () Bool)

(assert (=> b!1368403 m!1252979))

(assert (=> b!1368186 d!147235))

(check-sat (not b!1368356) (not b!1368275) (not b!1368358) (not d!147169) (not b!1368381) (not b!1368261) (not b!1368380) (not b!1368277) (not b!1368403) (not d!147235) (not b!1368385) (not d!147229) (not bm!65540) (not b!1368287) (not b!1368286) (not b!1368259) (not b!1368310) (not b!1368384) (not b!1368357) (not b!1368274) (not bm!65536) (not b!1368386) (not d!147217) (not d!147175) (not b!1368263) (not b!1368389) (not d!147185) (not d!147165) (not d!147167))
(check-sat)
