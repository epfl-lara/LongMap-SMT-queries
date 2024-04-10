; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114592 () Bool)

(assert start!114592)

(declare-datatypes ((array!92537 0))(
  ( (array!92538 (arr!44709 (Array (_ BitVec 32) (_ BitVec 64))) (size!45259 (_ BitVec 32))) )
))
(declare-fun lt!599715 () array!92537)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun e!771517 () Bool)

(declare-datatypes ((List!31750 0))(
  ( (Nil!31747) (Cons!31746 (h!32955 (_ BitVec 64)) (t!46423 List!31750)) )
))
(declare-fun acc!759 () List!31750)

(declare-fun b!1359802 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92537 (_ BitVec 32) List!31750) Bool)

(assert (=> b!1359802 (= e!771517 (not (arrayNoDuplicates!0 lt!599715 from!3120 acc!759)))))

(assert (=> b!1359802 (arrayNoDuplicates!0 lt!599715 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun a!3742 () array!92537)

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359802 (= lt!599715 (array!92538 (store (arr!44709 a!3742) i!1404 l!3587) (size!45259 a!3742)))))

(declare-datatypes ((Unit!44787 0))(
  ( (Unit!44788) )
))
(declare-fun lt!599718 () Unit!44787)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92537 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31750) Unit!44787)

(assert (=> b!1359802 (= lt!599718 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359803 () Bool)

(declare-fun res!904228 () Bool)

(declare-fun e!771520 () Bool)

(assert (=> b!1359803 (=> (not res!904228) (not e!771520))))

(assert (=> b!1359803 (= res!904228 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45259 a!3742)))))

(declare-fun b!1359804 () Bool)

(declare-fun res!904219 () Bool)

(assert (=> b!1359804 (=> (not res!904219) (not e!771517))))

(assert (=> b!1359804 (= res!904219 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!904223 () Bool)

(assert (=> start!114592 (=> (not res!904223) (not e!771520))))

(assert (=> start!114592 (= res!904223 (and (bvslt (size!45259 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45259 a!3742))))))

(assert (=> start!114592 e!771520))

(assert (=> start!114592 true))

(declare-fun array_inv!33737 (array!92537) Bool)

(assert (=> start!114592 (array_inv!33737 a!3742)))

(declare-fun b!1359805 () Bool)

(declare-fun res!904227 () Bool)

(assert (=> b!1359805 (=> (not res!904227) (not e!771520))))

(declare-fun noDuplicate!2316 (List!31750) Bool)

(assert (=> b!1359805 (= res!904227 (noDuplicate!2316 acc!759))))

(declare-fun b!1359806 () Bool)

(declare-fun res!904222 () Bool)

(assert (=> b!1359806 (=> (not res!904222) (not e!771520))))

(assert (=> b!1359806 (= res!904222 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31747))))

(declare-fun b!1359807 () Bool)

(declare-fun res!904218 () Bool)

(assert (=> b!1359807 (=> (not res!904218) (not e!771520))))

(assert (=> b!1359807 (= res!904218 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359808 () Bool)

(declare-fun res!904226 () Bool)

(assert (=> b!1359808 (=> (not res!904226) (not e!771520))))

(declare-fun contains!9459 (List!31750 (_ BitVec 64)) Bool)

(assert (=> b!1359808 (= res!904226 (not (contains!9459 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359809 () Bool)

(declare-fun e!771519 () Unit!44787)

(declare-fun lt!599716 () Unit!44787)

(assert (=> b!1359809 (= e!771519 lt!599716)))

(declare-fun lt!599717 () Unit!44787)

(declare-fun lemmaListSubSeqRefl!0 (List!31750) Unit!44787)

(assert (=> b!1359809 (= lt!599717 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!861 (List!31750 List!31750) Bool)

(assert (=> b!1359809 (subseq!861 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92537 List!31750 List!31750 (_ BitVec 32)) Unit!44787)

(declare-fun $colon$colon!864 (List!31750 (_ BitVec 64)) List!31750)

(assert (=> b!1359809 (= lt!599716 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!864 acc!759 (select (arr!44709 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1359809 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359810 () Bool)

(assert (=> b!1359810 (= e!771520 e!771517)))

(declare-fun res!904220 () Bool)

(assert (=> b!1359810 (=> (not res!904220) (not e!771517))))

(assert (=> b!1359810 (= res!904220 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599719 () Unit!44787)

(assert (=> b!1359810 (= lt!599719 e!771519)))

(declare-fun c!127232 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359810 (= c!127232 (validKeyInArray!0 (select (arr!44709 a!3742) from!3120)))))

(declare-fun b!1359811 () Bool)

(declare-fun res!904224 () Bool)

(assert (=> b!1359811 (=> (not res!904224) (not e!771520))))

(assert (=> b!1359811 (= res!904224 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45259 a!3742))))))

(declare-fun b!1359812 () Bool)

(declare-fun res!904221 () Bool)

(assert (=> b!1359812 (=> (not res!904221) (not e!771520))))

(assert (=> b!1359812 (= res!904221 (not (contains!9459 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359813 () Bool)

(declare-fun Unit!44789 () Unit!44787)

(assert (=> b!1359813 (= e!771519 Unit!44789)))

(declare-fun b!1359814 () Bool)

(declare-fun res!904225 () Bool)

(assert (=> b!1359814 (=> (not res!904225) (not e!771520))))

(assert (=> b!1359814 (= res!904225 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114592 res!904223) b!1359805))

(assert (= (and b!1359805 res!904227) b!1359812))

(assert (= (and b!1359812 res!904221) b!1359808))

(assert (= (and b!1359808 res!904226) b!1359806))

(assert (= (and b!1359806 res!904222) b!1359807))

(assert (= (and b!1359807 res!904218) b!1359811))

(assert (= (and b!1359811 res!904224) b!1359814))

(assert (= (and b!1359814 res!904225) b!1359803))

(assert (= (and b!1359803 res!904228) b!1359810))

(assert (= (and b!1359810 c!127232) b!1359809))

(assert (= (and b!1359810 (not c!127232)) b!1359813))

(assert (= (and b!1359810 res!904220) b!1359804))

(assert (= (and b!1359804 res!904219) b!1359802))

(declare-fun m!1245139 () Bool)

(assert (=> b!1359807 m!1245139))

(declare-fun m!1245141 () Bool)

(assert (=> b!1359805 m!1245141))

(declare-fun m!1245143 () Bool)

(assert (=> b!1359812 m!1245143))

(declare-fun m!1245145 () Bool)

(assert (=> b!1359804 m!1245145))

(declare-fun m!1245147 () Bool)

(assert (=> b!1359814 m!1245147))

(declare-fun m!1245149 () Bool)

(assert (=> b!1359806 m!1245149))

(declare-fun m!1245151 () Bool)

(assert (=> start!114592 m!1245151))

(declare-fun m!1245153 () Bool)

(assert (=> b!1359802 m!1245153))

(declare-fun m!1245155 () Bool)

(assert (=> b!1359802 m!1245155))

(declare-fun m!1245157 () Bool)

(assert (=> b!1359802 m!1245157))

(declare-fun m!1245159 () Bool)

(assert (=> b!1359802 m!1245159))

(declare-fun m!1245161 () Bool)

(assert (=> b!1359809 m!1245161))

(declare-fun m!1245163 () Bool)

(assert (=> b!1359809 m!1245163))

(declare-fun m!1245165 () Bool)

(assert (=> b!1359809 m!1245165))

(declare-fun m!1245167 () Bool)

(assert (=> b!1359809 m!1245167))

(assert (=> b!1359809 m!1245145))

(assert (=> b!1359809 m!1245163))

(assert (=> b!1359809 m!1245165))

(declare-fun m!1245169 () Bool)

(assert (=> b!1359809 m!1245169))

(assert (=> b!1359810 m!1245163))

(assert (=> b!1359810 m!1245163))

(declare-fun m!1245171 () Bool)

(assert (=> b!1359810 m!1245171))

(declare-fun m!1245173 () Bool)

(assert (=> b!1359808 m!1245173))

(check-sat (not b!1359810) (not b!1359807) (not b!1359812) (not b!1359805) (not start!114592) (not b!1359809) (not b!1359808) (not b!1359806) (not b!1359804) (not b!1359814) (not b!1359802))
(check-sat)
(get-model)

(declare-fun d!145545 () Bool)

(declare-fun lt!599737 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!687 (List!31750) (InoxSet (_ BitVec 64)))

(assert (=> d!145545 (= lt!599737 (select (content!687 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771537 () Bool)

(assert (=> d!145545 (= lt!599737 e!771537)))

(declare-fun res!904266 () Bool)

(assert (=> d!145545 (=> (not res!904266) (not e!771537))))

(get-info :version)

(assert (=> d!145545 (= res!904266 ((_ is Cons!31746) acc!759))))

(assert (=> d!145545 (= (contains!9459 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599737)))

(declare-fun b!1359858 () Bool)

(declare-fun e!771538 () Bool)

(assert (=> b!1359858 (= e!771537 e!771538)))

(declare-fun res!904267 () Bool)

(assert (=> b!1359858 (=> res!904267 e!771538)))

(assert (=> b!1359858 (= res!904267 (= (h!32955 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359859 () Bool)

(assert (=> b!1359859 (= e!771538 (contains!9459 (t!46423 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145545 res!904266) b!1359858))

(assert (= (and b!1359858 (not res!904267)) b!1359859))

(declare-fun m!1245211 () Bool)

(assert (=> d!145545 m!1245211))

(declare-fun m!1245213 () Bool)

(assert (=> d!145545 m!1245213))

(declare-fun m!1245215 () Bool)

(assert (=> b!1359859 m!1245215))

(assert (=> b!1359812 d!145545))

(declare-fun b!1359870 () Bool)

(declare-fun e!771548 () Bool)

(declare-fun e!771549 () Bool)

(assert (=> b!1359870 (= e!771548 e!771549)))

(declare-fun c!127238 () Bool)

(assert (=> b!1359870 (= c!127238 (validKeyInArray!0 (select (arr!44709 a!3742) from!3120)))))

(declare-fun b!1359871 () Bool)

(declare-fun call!65309 () Bool)

(assert (=> b!1359871 (= e!771549 call!65309)))

(declare-fun b!1359872 () Bool)

(declare-fun e!771550 () Bool)

(assert (=> b!1359872 (= e!771550 e!771548)))

(declare-fun res!904274 () Bool)

(assert (=> b!1359872 (=> (not res!904274) (not e!771548))))

(declare-fun e!771547 () Bool)

(assert (=> b!1359872 (= res!904274 (not e!771547))))

(declare-fun res!904276 () Bool)

(assert (=> b!1359872 (=> (not res!904276) (not e!771547))))

(assert (=> b!1359872 (= res!904276 (validKeyInArray!0 (select (arr!44709 a!3742) from!3120)))))

(declare-fun d!145547 () Bool)

(declare-fun res!904275 () Bool)

(assert (=> d!145547 (=> res!904275 e!771550)))

(assert (=> d!145547 (= res!904275 (bvsge from!3120 (size!45259 a!3742)))))

(assert (=> d!145547 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!771550)))

(declare-fun b!1359873 () Bool)

(assert (=> b!1359873 (= e!771547 (contains!9459 acc!759 (select (arr!44709 a!3742) from!3120)))))

(declare-fun bm!65306 () Bool)

(assert (=> bm!65306 (= call!65309 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127238 (Cons!31746 (select (arr!44709 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1359874 () Bool)

(assert (=> b!1359874 (= e!771549 call!65309)))

(assert (= (and d!145547 (not res!904275)) b!1359872))

(assert (= (and b!1359872 res!904276) b!1359873))

(assert (= (and b!1359872 res!904274) b!1359870))

(assert (= (and b!1359870 c!127238) b!1359871))

(assert (= (and b!1359870 (not c!127238)) b!1359874))

(assert (= (or b!1359871 b!1359874) bm!65306))

(assert (=> b!1359870 m!1245163))

(assert (=> b!1359870 m!1245163))

(assert (=> b!1359870 m!1245171))

(assert (=> b!1359872 m!1245163))

(assert (=> b!1359872 m!1245163))

(assert (=> b!1359872 m!1245171))

(assert (=> b!1359873 m!1245163))

(assert (=> b!1359873 m!1245163))

(declare-fun m!1245217 () Bool)

(assert (=> b!1359873 m!1245217))

(assert (=> bm!65306 m!1245163))

(declare-fun m!1245219 () Bool)

(assert (=> bm!65306 m!1245219))

(assert (=> b!1359807 d!145547))

(declare-fun b!1359875 () Bool)

(declare-fun e!771552 () Bool)

(declare-fun e!771553 () Bool)

(assert (=> b!1359875 (= e!771552 e!771553)))

(declare-fun c!127239 () Bool)

(assert (=> b!1359875 (= c!127239 (validKeyInArray!0 (select (arr!44709 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1359876 () Bool)

(declare-fun call!65310 () Bool)

(assert (=> b!1359876 (= e!771553 call!65310)))

(declare-fun b!1359877 () Bool)

(declare-fun e!771554 () Bool)

(assert (=> b!1359877 (= e!771554 e!771552)))

(declare-fun res!904277 () Bool)

(assert (=> b!1359877 (=> (not res!904277) (not e!771552))))

(declare-fun e!771551 () Bool)

(assert (=> b!1359877 (= res!904277 (not e!771551))))

(declare-fun res!904279 () Bool)

(assert (=> b!1359877 (=> (not res!904279) (not e!771551))))

(assert (=> b!1359877 (= res!904279 (validKeyInArray!0 (select (arr!44709 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!145549 () Bool)

(declare-fun res!904278 () Bool)

(assert (=> d!145549 (=> res!904278 e!771554)))

(assert (=> d!145549 (= res!904278 (bvsge #b00000000000000000000000000000000 (size!45259 a!3742)))))

(assert (=> d!145549 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31747) e!771554)))

(declare-fun b!1359878 () Bool)

(assert (=> b!1359878 (= e!771551 (contains!9459 Nil!31747 (select (arr!44709 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65307 () Bool)

(assert (=> bm!65307 (= call!65310 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127239 (Cons!31746 (select (arr!44709 a!3742) #b00000000000000000000000000000000) Nil!31747) Nil!31747)))))

(declare-fun b!1359879 () Bool)

(assert (=> b!1359879 (= e!771553 call!65310)))

(assert (= (and d!145549 (not res!904278)) b!1359877))

(assert (= (and b!1359877 res!904279) b!1359878))

(assert (= (and b!1359877 res!904277) b!1359875))

(assert (= (and b!1359875 c!127239) b!1359876))

(assert (= (and b!1359875 (not c!127239)) b!1359879))

(assert (= (or b!1359876 b!1359879) bm!65307))

(declare-fun m!1245221 () Bool)

(assert (=> b!1359875 m!1245221))

(assert (=> b!1359875 m!1245221))

(declare-fun m!1245223 () Bool)

(assert (=> b!1359875 m!1245223))

(assert (=> b!1359877 m!1245221))

(assert (=> b!1359877 m!1245221))

(assert (=> b!1359877 m!1245223))

(assert (=> b!1359878 m!1245221))

(assert (=> b!1359878 m!1245221))

(declare-fun m!1245225 () Bool)

(assert (=> b!1359878 m!1245225))

(assert (=> bm!65307 m!1245221))

(declare-fun m!1245227 () Bool)

(assert (=> bm!65307 m!1245227))

(assert (=> b!1359806 d!145549))

(declare-fun d!145551 () Bool)

(assert (=> d!145551 (= (array_inv!33737 a!3742) (bvsge (size!45259 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114592 d!145551))

(declare-fun d!145553 () Bool)

(declare-fun lt!599738 () Bool)

(assert (=> d!145553 (= lt!599738 (select (content!687 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771555 () Bool)

(assert (=> d!145553 (= lt!599738 e!771555)))

(declare-fun res!904280 () Bool)

(assert (=> d!145553 (=> (not res!904280) (not e!771555))))

(assert (=> d!145553 (= res!904280 ((_ is Cons!31746) acc!759))))

(assert (=> d!145553 (= (contains!9459 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599738)))

(declare-fun b!1359880 () Bool)

(declare-fun e!771556 () Bool)

(assert (=> b!1359880 (= e!771555 e!771556)))

(declare-fun res!904281 () Bool)

(assert (=> b!1359880 (=> res!904281 e!771556)))

(assert (=> b!1359880 (= res!904281 (= (h!32955 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359881 () Bool)

(assert (=> b!1359881 (= e!771556 (contains!9459 (t!46423 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145553 res!904280) b!1359880))

(assert (= (and b!1359880 (not res!904281)) b!1359881))

(assert (=> d!145553 m!1245211))

(declare-fun m!1245229 () Bool)

(assert (=> d!145553 m!1245229))

(declare-fun m!1245231 () Bool)

(assert (=> b!1359881 m!1245231))

(assert (=> b!1359808 d!145553))

(declare-fun b!1359882 () Bool)

(declare-fun e!771558 () Bool)

(declare-fun e!771559 () Bool)

(assert (=> b!1359882 (= e!771558 e!771559)))

(declare-fun c!127240 () Bool)

(assert (=> b!1359882 (= c!127240 (validKeyInArray!0 (select (arr!44709 lt!599715) from!3120)))))

(declare-fun b!1359883 () Bool)

(declare-fun call!65311 () Bool)

(assert (=> b!1359883 (= e!771559 call!65311)))

(declare-fun b!1359884 () Bool)

(declare-fun e!771560 () Bool)

(assert (=> b!1359884 (= e!771560 e!771558)))

(declare-fun res!904282 () Bool)

(assert (=> b!1359884 (=> (not res!904282) (not e!771558))))

(declare-fun e!771557 () Bool)

(assert (=> b!1359884 (= res!904282 (not e!771557))))

(declare-fun res!904284 () Bool)

(assert (=> b!1359884 (=> (not res!904284) (not e!771557))))

(assert (=> b!1359884 (= res!904284 (validKeyInArray!0 (select (arr!44709 lt!599715) from!3120)))))

(declare-fun d!145555 () Bool)

(declare-fun res!904283 () Bool)

(assert (=> d!145555 (=> res!904283 e!771560)))

(assert (=> d!145555 (= res!904283 (bvsge from!3120 (size!45259 lt!599715)))))

(assert (=> d!145555 (= (arrayNoDuplicates!0 lt!599715 from!3120 acc!759) e!771560)))

(declare-fun b!1359885 () Bool)

(assert (=> b!1359885 (= e!771557 (contains!9459 acc!759 (select (arr!44709 lt!599715) from!3120)))))

(declare-fun bm!65308 () Bool)

(assert (=> bm!65308 (= call!65311 (arrayNoDuplicates!0 lt!599715 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127240 (Cons!31746 (select (arr!44709 lt!599715) from!3120) acc!759) acc!759)))))

(declare-fun b!1359886 () Bool)

(assert (=> b!1359886 (= e!771559 call!65311)))

(assert (= (and d!145555 (not res!904283)) b!1359884))

(assert (= (and b!1359884 res!904284) b!1359885))

(assert (= (and b!1359884 res!904282) b!1359882))

(assert (= (and b!1359882 c!127240) b!1359883))

(assert (= (and b!1359882 (not c!127240)) b!1359886))

(assert (= (or b!1359883 b!1359886) bm!65308))

(declare-fun m!1245233 () Bool)

(assert (=> b!1359882 m!1245233))

(assert (=> b!1359882 m!1245233))

(declare-fun m!1245235 () Bool)

(assert (=> b!1359882 m!1245235))

(assert (=> b!1359884 m!1245233))

(assert (=> b!1359884 m!1245233))

(assert (=> b!1359884 m!1245235))

(assert (=> b!1359885 m!1245233))

(assert (=> b!1359885 m!1245233))

(declare-fun m!1245237 () Bool)

(assert (=> b!1359885 m!1245237))

(assert (=> bm!65308 m!1245233))

(declare-fun m!1245239 () Bool)

(assert (=> bm!65308 m!1245239))

(assert (=> b!1359802 d!145555))

(declare-fun b!1359887 () Bool)

(declare-fun e!771562 () Bool)

(declare-fun e!771563 () Bool)

(assert (=> b!1359887 (= e!771562 e!771563)))

(declare-fun c!127241 () Bool)

(assert (=> b!1359887 (= c!127241 (validKeyInArray!0 (select (arr!44709 lt!599715) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1359888 () Bool)

(declare-fun call!65312 () Bool)

(assert (=> b!1359888 (= e!771563 call!65312)))

(declare-fun b!1359889 () Bool)

(declare-fun e!771564 () Bool)

(assert (=> b!1359889 (= e!771564 e!771562)))

(declare-fun res!904285 () Bool)

(assert (=> b!1359889 (=> (not res!904285) (not e!771562))))

(declare-fun e!771561 () Bool)

(assert (=> b!1359889 (= res!904285 (not e!771561))))

(declare-fun res!904287 () Bool)

(assert (=> b!1359889 (=> (not res!904287) (not e!771561))))

(assert (=> b!1359889 (= res!904287 (validKeyInArray!0 (select (arr!44709 lt!599715) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!145557 () Bool)

(declare-fun res!904286 () Bool)

(assert (=> d!145557 (=> res!904286 e!771564)))

(assert (=> d!145557 (= res!904286 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45259 lt!599715)))))

(assert (=> d!145557 (= (arrayNoDuplicates!0 lt!599715 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!771564)))

(declare-fun b!1359890 () Bool)

(assert (=> b!1359890 (= e!771561 (contains!9459 acc!759 (select (arr!44709 lt!599715) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun bm!65309 () Bool)

(assert (=> bm!65309 (= call!65312 (arrayNoDuplicates!0 lt!599715 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127241 (Cons!31746 (select (arr!44709 lt!599715) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1359891 () Bool)

(assert (=> b!1359891 (= e!771563 call!65312)))

(assert (= (and d!145557 (not res!904286)) b!1359889))

(assert (= (and b!1359889 res!904287) b!1359890))

(assert (= (and b!1359889 res!904285) b!1359887))

(assert (= (and b!1359887 c!127241) b!1359888))

(assert (= (and b!1359887 (not c!127241)) b!1359891))

(assert (= (or b!1359888 b!1359891) bm!65309))

(declare-fun m!1245241 () Bool)

(assert (=> b!1359887 m!1245241))

(assert (=> b!1359887 m!1245241))

(declare-fun m!1245243 () Bool)

(assert (=> b!1359887 m!1245243))

(assert (=> b!1359889 m!1245241))

(assert (=> b!1359889 m!1245241))

(assert (=> b!1359889 m!1245243))

(assert (=> b!1359890 m!1245241))

(assert (=> b!1359890 m!1245241))

(declare-fun m!1245245 () Bool)

(assert (=> b!1359890 m!1245245))

(assert (=> bm!65309 m!1245241))

(declare-fun m!1245247 () Bool)

(assert (=> bm!65309 m!1245247))

(assert (=> b!1359802 d!145557))

(declare-fun d!145559 () Bool)

(declare-fun e!771567 () Bool)

(assert (=> d!145559 e!771567))

(declare-fun res!904290 () Bool)

(assert (=> d!145559 (=> (not res!904290) (not e!771567))))

(assert (=> d!145559 (= res!904290 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45259 a!3742))))))

(declare-fun lt!599741 () Unit!44787)

(declare-fun choose!53 (array!92537 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31750) Unit!44787)

(assert (=> d!145559 (= lt!599741 (choose!53 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (=> d!145559 (bvslt (size!45259 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145559 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) lt!599741)))

(declare-fun b!1359894 () Bool)

(assert (=> b!1359894 (= e!771567 (arrayNoDuplicates!0 (array!92538 (store (arr!44709 a!3742) i!1404 l!3587) (size!45259 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and d!145559 res!904290) b!1359894))

(declare-fun m!1245249 () Bool)

(assert (=> d!145559 m!1245249))

(assert (=> b!1359894 m!1245157))

(declare-fun m!1245251 () Bool)

(assert (=> b!1359894 m!1245251))

(assert (=> b!1359802 d!145559))

(declare-fun b!1359895 () Bool)

(declare-fun e!771569 () Bool)

(declare-fun e!771570 () Bool)

(assert (=> b!1359895 (= e!771569 e!771570)))

(declare-fun c!127242 () Bool)

(assert (=> b!1359895 (= c!127242 (validKeyInArray!0 (select (arr!44709 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1359896 () Bool)

(declare-fun call!65313 () Bool)

(assert (=> b!1359896 (= e!771570 call!65313)))

(declare-fun b!1359897 () Bool)

(declare-fun e!771571 () Bool)

(assert (=> b!1359897 (= e!771571 e!771569)))

(declare-fun res!904291 () Bool)

(assert (=> b!1359897 (=> (not res!904291) (not e!771569))))

(declare-fun e!771568 () Bool)

(assert (=> b!1359897 (= res!904291 (not e!771568))))

(declare-fun res!904293 () Bool)

(assert (=> b!1359897 (=> (not res!904293) (not e!771568))))

(assert (=> b!1359897 (= res!904293 (validKeyInArray!0 (select (arr!44709 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!145563 () Bool)

(declare-fun res!904292 () Bool)

(assert (=> d!145563 (=> res!904292 e!771571)))

(assert (=> d!145563 (= res!904292 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45259 a!3742)))))

(assert (=> d!145563 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!771571)))

(declare-fun b!1359898 () Bool)

(assert (=> b!1359898 (= e!771568 (contains!9459 acc!759 (select (arr!44709 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun bm!65310 () Bool)

(assert (=> bm!65310 (= call!65313 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127242 (Cons!31746 (select (arr!44709 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1359899 () Bool)

(assert (=> b!1359899 (= e!771570 call!65313)))

(assert (= (and d!145563 (not res!904292)) b!1359897))

(assert (= (and b!1359897 res!904293) b!1359898))

(assert (= (and b!1359897 res!904291) b!1359895))

(assert (= (and b!1359895 c!127242) b!1359896))

(assert (= (and b!1359895 (not c!127242)) b!1359899))

(assert (= (or b!1359896 b!1359899) bm!65310))

(declare-fun m!1245253 () Bool)

(assert (=> b!1359895 m!1245253))

(assert (=> b!1359895 m!1245253))

(declare-fun m!1245255 () Bool)

(assert (=> b!1359895 m!1245255))

(assert (=> b!1359897 m!1245253))

(assert (=> b!1359897 m!1245253))

(assert (=> b!1359897 m!1245255))

(assert (=> b!1359898 m!1245253))

(assert (=> b!1359898 m!1245253))

(declare-fun m!1245257 () Bool)

(assert (=> b!1359898 m!1245257))

(assert (=> bm!65310 m!1245253))

(declare-fun m!1245259 () Bool)

(assert (=> bm!65310 m!1245259))

(assert (=> b!1359804 d!145563))

(declare-fun d!145565 () Bool)

(assert (=> d!145565 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1359814 d!145565))

(declare-fun d!145567 () Bool)

(assert (=> d!145567 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599744 () Unit!44787)

(declare-fun choose!80 (array!92537 List!31750 List!31750 (_ BitVec 32)) Unit!44787)

(assert (=> d!145567 (= lt!599744 (choose!80 a!3742 ($colon$colon!864 acc!759 (select (arr!44709 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145567 (bvslt (size!45259 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145567 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!864 acc!759 (select (arr!44709 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!599744)))

(declare-fun bs!38994 () Bool)

(assert (= bs!38994 d!145567))

(assert (=> bs!38994 m!1245145))

(assert (=> bs!38994 m!1245165))

(declare-fun m!1245269 () Bool)

(assert (=> bs!38994 m!1245269))

(assert (=> b!1359809 d!145567))

(declare-fun d!145573 () Bool)

(declare-fun res!904327 () Bool)

(declare-fun e!771607 () Bool)

(assert (=> d!145573 (=> res!904327 e!771607)))

(assert (=> d!145573 (= res!904327 ((_ is Nil!31747) acc!759))))

(assert (=> d!145573 (= (subseq!861 acc!759 acc!759) e!771607)))

(declare-fun b!1359941 () Bool)

(declare-fun e!771606 () Bool)

(assert (=> b!1359941 (= e!771606 (subseq!861 acc!759 (t!46423 acc!759)))))

(declare-fun b!1359940 () Bool)

(declare-fun e!771609 () Bool)

(assert (=> b!1359940 (= e!771609 (subseq!861 (t!46423 acc!759) (t!46423 acc!759)))))

(declare-fun b!1359938 () Bool)

(declare-fun e!771608 () Bool)

(assert (=> b!1359938 (= e!771607 e!771608)))

(declare-fun res!904326 () Bool)

(assert (=> b!1359938 (=> (not res!904326) (not e!771608))))

(assert (=> b!1359938 (= res!904326 ((_ is Cons!31746) acc!759))))

(declare-fun b!1359939 () Bool)

(assert (=> b!1359939 (= e!771608 e!771606)))

(declare-fun res!904324 () Bool)

(assert (=> b!1359939 (=> res!904324 e!771606)))

(assert (=> b!1359939 (= res!904324 e!771609)))

(declare-fun res!904325 () Bool)

(assert (=> b!1359939 (=> (not res!904325) (not e!771609))))

(assert (=> b!1359939 (= res!904325 (= (h!32955 acc!759) (h!32955 acc!759)))))

(assert (= (and d!145573 (not res!904327)) b!1359938))

(assert (= (and b!1359938 res!904326) b!1359939))

(assert (= (and b!1359939 res!904325) b!1359940))

(assert (= (and b!1359939 (not res!904324)) b!1359941))

(declare-fun m!1245285 () Bool)

(assert (=> b!1359941 m!1245285))

(declare-fun m!1245287 () Bool)

(assert (=> b!1359940 m!1245287))

(assert (=> b!1359809 d!145573))

(assert (=> b!1359809 d!145563))

(declare-fun d!145581 () Bool)

(assert (=> d!145581 (= ($colon$colon!864 acc!759 (select (arr!44709 a!3742) from!3120)) (Cons!31746 (select (arr!44709 a!3742) from!3120) acc!759))))

(assert (=> b!1359809 d!145581))

(declare-fun d!145585 () Bool)

(assert (=> d!145585 (subseq!861 acc!759 acc!759)))

(declare-fun lt!599754 () Unit!44787)

(declare-fun choose!36 (List!31750) Unit!44787)

(assert (=> d!145585 (= lt!599754 (choose!36 acc!759))))

(assert (=> d!145585 (= (lemmaListSubSeqRefl!0 acc!759) lt!599754)))

(declare-fun bs!38996 () Bool)

(assert (= bs!38996 d!145585))

(assert (=> bs!38996 m!1245169))

(declare-fun m!1245299 () Bool)

(assert (=> bs!38996 m!1245299))

(assert (=> b!1359809 d!145585))

(declare-fun d!145589 () Bool)

(assert (=> d!145589 (= (validKeyInArray!0 (select (arr!44709 a!3742) from!3120)) (and (not (= (select (arr!44709 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44709 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1359810 d!145589))

(declare-fun d!145591 () Bool)

(declare-fun res!904354 () Bool)

(declare-fun e!771638 () Bool)

(assert (=> d!145591 (=> res!904354 e!771638)))

(assert (=> d!145591 (= res!904354 ((_ is Nil!31747) acc!759))))

(assert (=> d!145591 (= (noDuplicate!2316 acc!759) e!771638)))

(declare-fun b!1359972 () Bool)

(declare-fun e!771639 () Bool)

(assert (=> b!1359972 (= e!771638 e!771639)))

(declare-fun res!904355 () Bool)

(assert (=> b!1359972 (=> (not res!904355) (not e!771639))))

(assert (=> b!1359972 (= res!904355 (not (contains!9459 (t!46423 acc!759) (h!32955 acc!759))))))

(declare-fun b!1359973 () Bool)

(assert (=> b!1359973 (= e!771639 (noDuplicate!2316 (t!46423 acc!759)))))

(assert (= (and d!145591 (not res!904354)) b!1359972))

(assert (= (and b!1359972 res!904355) b!1359973))

(declare-fun m!1245305 () Bool)

(assert (=> b!1359972 m!1245305))

(declare-fun m!1245307 () Bool)

(assert (=> b!1359973 m!1245307))

(assert (=> b!1359805 d!145591))

(check-sat (not d!145585) (not bm!65310) (not bm!65306) (not b!1359890) (not b!1359889) (not d!145567) (not b!1359870) (not b!1359881) (not b!1359875) (not b!1359877) (not bm!65307) (not bm!65308) (not b!1359887) (not d!145545) (not bm!65309) (not d!145553) (not b!1359894) (not b!1359859) (not b!1359872) (not b!1359972) (not b!1359873) (not b!1359898) (not b!1359973) (not b!1359895) (not b!1359884) (not b!1359940) (not b!1359878) (not b!1359882) (not b!1359897) (not b!1359885) (not b!1359941) (not d!145559))
(check-sat)
