; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114896 () Bool)

(assert start!114896)

(declare-fun b!1362138 () Bool)

(declare-fun res!906220 () Bool)

(declare-fun e!772646 () Bool)

(assert (=> b!1362138 (=> (not res!906220) (not e!772646))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92580 0))(
  ( (array!92581 (arr!44725 (Array (_ BitVec 32) (_ BitVec 64))) (size!45277 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92580)

(assert (=> b!1362138 (= res!906220 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45277 a!3742)))))

(declare-fun b!1362139 () Bool)

(declare-datatypes ((Unit!44751 0))(
  ( (Unit!44752) )
))
(declare-fun e!772645 () Unit!44751)

(declare-fun Unit!44753 () Unit!44751)

(assert (=> b!1362139 (= e!772645 Unit!44753)))

(declare-fun b!1362140 () Bool)

(declare-fun e!772648 () Bool)

(assert (=> b!1362140 (= e!772646 e!772648)))

(declare-fun res!906211 () Bool)

(assert (=> b!1362140 (=> (not res!906211) (not e!772648))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!600238 () Bool)

(assert (=> b!1362140 (= res!906211 (and (not (= from!3120 i!1404)) lt!600238))))

(declare-fun lt!600240 () Unit!44751)

(assert (=> b!1362140 (= lt!600240 e!772645)))

(declare-fun c!127406 () Bool)

(assert (=> b!1362140 (= c!127406 lt!600238)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362140 (= lt!600238 (validKeyInArray!0 (select (arr!44725 a!3742) from!3120)))))

(declare-fun b!1362141 () Bool)

(declare-fun res!906213 () Bool)

(assert (=> b!1362141 (=> (not res!906213) (not e!772646))))

(declare-datatypes ((List!31844 0))(
  ( (Nil!31841) (Cons!31840 (h!33049 (_ BitVec 64)) (t!46521 List!31844)) )
))
(declare-fun arrayNoDuplicates!0 (array!92580 (_ BitVec 32) List!31844) Bool)

(assert (=> b!1362141 (= res!906213 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31841))))

(declare-fun b!1362142 () Bool)

(declare-fun res!906216 () Bool)

(assert (=> b!1362142 (=> (not res!906216) (not e!772646))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1362142 (= res!906216 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362143 () Bool)

(declare-fun res!906222 () Bool)

(assert (=> b!1362143 (=> (not res!906222) (not e!772646))))

(assert (=> b!1362143 (= res!906222 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45277 a!3742))))))

(declare-fun b!1362144 () Bool)

(declare-fun res!906223 () Bool)

(assert (=> b!1362144 (=> (not res!906223) (not e!772646))))

(declare-fun acc!759 () List!31844)

(declare-fun noDuplicate!2379 (List!31844) Bool)

(assert (=> b!1362144 (= res!906223 (noDuplicate!2379 acc!759))))

(declare-fun b!1362145 () Bool)

(declare-fun res!906219 () Bool)

(declare-fun e!772647 () Bool)

(assert (=> b!1362145 (=> (not res!906219) (not e!772647))))

(declare-fun lt!600236 () List!31844)

(assert (=> b!1362145 (= res!906219 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600236))))

(declare-fun b!1362146 () Bool)

(declare-fun res!906215 () Bool)

(assert (=> b!1362146 (=> (not res!906215) (not e!772647))))

(assert (=> b!1362146 (= res!906215 (noDuplicate!2379 lt!600236))))

(declare-fun b!1362147 () Bool)

(declare-fun res!906221 () Bool)

(assert (=> b!1362147 (=> (not res!906221) (not e!772646))))

(declare-fun contains!9464 (List!31844 (_ BitVec 64)) Bool)

(assert (=> b!1362147 (= res!906221 (not (contains!9464 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!906212 () Bool)

(assert (=> start!114896 (=> (not res!906212) (not e!772646))))

(assert (=> start!114896 (= res!906212 (and (bvslt (size!45277 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45277 a!3742))))))

(assert (=> start!114896 e!772646))

(assert (=> start!114896 true))

(declare-fun array_inv!33958 (array!92580) Bool)

(assert (=> start!114896 (array_inv!33958 a!3742)))

(declare-fun b!1362137 () Bool)

(assert (=> b!1362137 (= e!772648 e!772647)))

(declare-fun res!906210 () Bool)

(assert (=> b!1362137 (=> (not res!906210) (not e!772647))))

(assert (=> b!1362137 (= res!906210 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!907 (List!31844 (_ BitVec 64)) List!31844)

(assert (=> b!1362137 (= lt!600236 ($colon$colon!907 acc!759 (select (arr!44725 a!3742) from!3120)))))

(declare-fun b!1362148 () Bool)

(declare-fun res!906218 () Bool)

(assert (=> b!1362148 (=> (not res!906218) (not e!772646))))

(assert (=> b!1362148 (= res!906218 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362149 () Bool)

(declare-fun res!906214 () Bool)

(assert (=> b!1362149 (=> (not res!906214) (not e!772647))))

(assert (=> b!1362149 (= res!906214 (not (contains!9464 lt!600236 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362150 () Bool)

(declare-fun lt!600239 () Unit!44751)

(assert (=> b!1362150 (= e!772645 lt!600239)))

(declare-fun lt!600235 () Unit!44751)

(declare-fun lemmaListSubSeqRefl!0 (List!31844) Unit!44751)

(assert (=> b!1362150 (= lt!600235 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!902 (List!31844 List!31844) Bool)

(assert (=> b!1362150 (subseq!902 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92580 List!31844 List!31844 (_ BitVec 32)) Unit!44751)

(assert (=> b!1362150 (= lt!600239 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!907 acc!759 (select (arr!44725 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1362150 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362151 () Bool)

(declare-fun res!906224 () Bool)

(assert (=> b!1362151 (=> (not res!906224) (not e!772647))))

(assert (=> b!1362151 (= res!906224 (not (contains!9464 lt!600236 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362152 () Bool)

(declare-fun res!906217 () Bool)

(assert (=> b!1362152 (=> (not res!906217) (not e!772646))))

(assert (=> b!1362152 (= res!906217 (not (contains!9464 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362153 () Bool)

(declare-fun lt!600241 () array!92580)

(assert (=> b!1362153 (= e!772647 (not (arrayNoDuplicates!0 lt!600241 from!3120 acc!759)))))

(assert (=> b!1362153 (arrayNoDuplicates!0 lt!600241 (bvadd #b00000000000000000000000000000001 from!3120) lt!600236)))

(assert (=> b!1362153 (= lt!600241 (array!92581 (store (arr!44725 a!3742) i!1404 l!3587) (size!45277 a!3742)))))

(declare-fun lt!600237 () Unit!44751)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92580 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31844) Unit!44751)

(assert (=> b!1362153 (= lt!600237 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!600236))))

(assert (= (and start!114896 res!906212) b!1362144))

(assert (= (and b!1362144 res!906223) b!1362152))

(assert (= (and b!1362152 res!906217) b!1362147))

(assert (= (and b!1362147 res!906221) b!1362141))

(assert (= (and b!1362141 res!906213) b!1362148))

(assert (= (and b!1362148 res!906218) b!1362143))

(assert (= (and b!1362143 res!906222) b!1362142))

(assert (= (and b!1362142 res!906216) b!1362138))

(assert (= (and b!1362138 res!906220) b!1362140))

(assert (= (and b!1362140 c!127406) b!1362150))

(assert (= (and b!1362140 (not c!127406)) b!1362139))

(assert (= (and b!1362140 res!906211) b!1362137))

(assert (= (and b!1362137 res!906210) b!1362146))

(assert (= (and b!1362146 res!906215) b!1362149))

(assert (= (and b!1362149 res!906214) b!1362151))

(assert (= (and b!1362151 res!906224) b!1362145))

(assert (= (and b!1362145 res!906219) b!1362153))

(declare-fun m!1246639 () Bool)

(assert (=> start!114896 m!1246639))

(declare-fun m!1246641 () Bool)

(assert (=> b!1362140 m!1246641))

(assert (=> b!1362140 m!1246641))

(declare-fun m!1246643 () Bool)

(assert (=> b!1362140 m!1246643))

(declare-fun m!1246645 () Bool)

(assert (=> b!1362148 m!1246645))

(declare-fun m!1246647 () Bool)

(assert (=> b!1362144 m!1246647))

(declare-fun m!1246649 () Bool)

(assert (=> b!1362147 m!1246649))

(declare-fun m!1246651 () Bool)

(assert (=> b!1362153 m!1246651))

(declare-fun m!1246653 () Bool)

(assert (=> b!1362153 m!1246653))

(declare-fun m!1246655 () Bool)

(assert (=> b!1362153 m!1246655))

(declare-fun m!1246657 () Bool)

(assert (=> b!1362153 m!1246657))

(declare-fun m!1246659 () Bool)

(assert (=> b!1362142 m!1246659))

(declare-fun m!1246661 () Bool)

(assert (=> b!1362146 m!1246661))

(declare-fun m!1246663 () Bool)

(assert (=> b!1362145 m!1246663))

(declare-fun m!1246665 () Bool)

(assert (=> b!1362149 m!1246665))

(declare-fun m!1246667 () Bool)

(assert (=> b!1362141 m!1246667))

(declare-fun m!1246669 () Bool)

(assert (=> b!1362151 m!1246669))

(declare-fun m!1246671 () Bool)

(assert (=> b!1362150 m!1246671))

(assert (=> b!1362150 m!1246641))

(declare-fun m!1246673 () Bool)

(assert (=> b!1362150 m!1246673))

(declare-fun m!1246675 () Bool)

(assert (=> b!1362150 m!1246675))

(declare-fun m!1246677 () Bool)

(assert (=> b!1362150 m!1246677))

(assert (=> b!1362150 m!1246641))

(assert (=> b!1362150 m!1246673))

(declare-fun m!1246679 () Bool)

(assert (=> b!1362150 m!1246679))

(assert (=> b!1362137 m!1246641))

(assert (=> b!1362137 m!1246641))

(assert (=> b!1362137 m!1246673))

(declare-fun m!1246681 () Bool)

(assert (=> b!1362152 m!1246681))

(check-sat (not b!1362144) (not b!1362147) (not b!1362153) (not b!1362140) (not b!1362148) (not b!1362152) (not b!1362149) (not start!114896) (not b!1362137) (not b!1362151) (not b!1362150) (not b!1362141) (not b!1362146) (not b!1362142) (not b!1362145))
(check-sat)
(get-model)

(declare-fun d!145835 () Bool)

(assert (=> d!145835 (= ($colon$colon!907 acc!759 (select (arr!44725 a!3742) from!3120)) (Cons!31840 (select (arr!44725 a!3742) from!3120) acc!759))))

(assert (=> b!1362137 d!145835))

(declare-fun bm!65356 () Bool)

(declare-fun c!127415 () Bool)

(declare-fun call!65359 () Bool)

(assert (=> bm!65356 (= call!65359 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127415 (Cons!31840 (select (arr!44725 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun e!772690 () Bool)

(declare-fun b!1362266 () Bool)

(assert (=> b!1362266 (= e!772690 (contains!9464 acc!759 (select (arr!44725 a!3742) from!3120)))))

(declare-fun b!1362268 () Bool)

(declare-fun e!772687 () Bool)

(declare-fun e!772688 () Bool)

(assert (=> b!1362268 (= e!772687 e!772688)))

(assert (=> b!1362268 (= c!127415 (validKeyInArray!0 (select (arr!44725 a!3742) from!3120)))))

(declare-fun b!1362267 () Bool)

(assert (=> b!1362267 (= e!772688 call!65359)))

(declare-fun d!145837 () Bool)

(declare-fun res!906321 () Bool)

(declare-fun e!772689 () Bool)

(assert (=> d!145837 (=> res!906321 e!772689)))

(assert (=> d!145837 (= res!906321 (bvsge from!3120 (size!45277 a!3742)))))

(assert (=> d!145837 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!772689)))

(declare-fun b!1362269 () Bool)

(assert (=> b!1362269 (= e!772688 call!65359)))

(declare-fun b!1362270 () Bool)

(assert (=> b!1362270 (= e!772689 e!772687)))

(declare-fun res!906322 () Bool)

(assert (=> b!1362270 (=> (not res!906322) (not e!772687))))

(assert (=> b!1362270 (= res!906322 (not e!772690))))

(declare-fun res!906323 () Bool)

(assert (=> b!1362270 (=> (not res!906323) (not e!772690))))

(assert (=> b!1362270 (= res!906323 (validKeyInArray!0 (select (arr!44725 a!3742) from!3120)))))

(assert (= (and d!145837 (not res!906321)) b!1362270))

(assert (= (and b!1362270 res!906323) b!1362266))

(assert (= (and b!1362270 res!906322) b!1362268))

(assert (= (and b!1362268 c!127415) b!1362267))

(assert (= (and b!1362268 (not c!127415)) b!1362269))

(assert (= (or b!1362267 b!1362269) bm!65356))

(assert (=> bm!65356 m!1246641))

(declare-fun m!1246771 () Bool)

(assert (=> bm!65356 m!1246771))

(assert (=> b!1362266 m!1246641))

(assert (=> b!1362266 m!1246641))

(declare-fun m!1246773 () Bool)

(assert (=> b!1362266 m!1246773))

(assert (=> b!1362268 m!1246641))

(assert (=> b!1362268 m!1246641))

(assert (=> b!1362268 m!1246643))

(assert (=> b!1362270 m!1246641))

(assert (=> b!1362270 m!1246641))

(assert (=> b!1362270 m!1246643))

(assert (=> b!1362148 d!145837))

(declare-fun d!145839 () Bool)

(declare-fun lt!600286 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!695 (List!31844) (InoxSet (_ BitVec 64)))

(assert (=> d!145839 (= lt!600286 (select (content!695 lt!600236) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772695 () Bool)

(assert (=> d!145839 (= lt!600286 e!772695)))

(declare-fun res!906328 () Bool)

(assert (=> d!145839 (=> (not res!906328) (not e!772695))))

(get-info :version)

(assert (=> d!145839 (= res!906328 ((_ is Cons!31840) lt!600236))))

(assert (=> d!145839 (= (contains!9464 lt!600236 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600286)))

(declare-fun b!1362275 () Bool)

(declare-fun e!772696 () Bool)

(assert (=> b!1362275 (= e!772695 e!772696)))

(declare-fun res!906329 () Bool)

(assert (=> b!1362275 (=> res!906329 e!772696)))

(assert (=> b!1362275 (= res!906329 (= (h!33049 lt!600236) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362276 () Bool)

(assert (=> b!1362276 (= e!772696 (contains!9464 (t!46521 lt!600236) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145839 res!906328) b!1362275))

(assert (= (and b!1362275 (not res!906329)) b!1362276))

(declare-fun m!1246775 () Bool)

(assert (=> d!145839 m!1246775))

(declare-fun m!1246777 () Bool)

(assert (=> d!145839 m!1246777))

(declare-fun m!1246779 () Bool)

(assert (=> b!1362276 m!1246779))

(assert (=> b!1362149 d!145839))

(declare-fun d!145841 () Bool)

(assert (=> d!145841 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600289 () Unit!44751)

(declare-fun choose!80 (array!92580 List!31844 List!31844 (_ BitVec 32)) Unit!44751)

(assert (=> d!145841 (= lt!600289 (choose!80 a!3742 ($colon$colon!907 acc!759 (select (arr!44725 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145841 (bvslt (size!45277 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145841 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!907 acc!759 (select (arr!44725 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600289)))

(declare-fun bs!39033 () Bool)

(assert (= bs!39033 d!145841))

(assert (=> bs!39033 m!1246677))

(assert (=> bs!39033 m!1246673))

(declare-fun m!1246781 () Bool)

(assert (=> bs!39033 m!1246781))

(assert (=> b!1362150 d!145841))

(declare-fun b!1362285 () Bool)

(declare-fun e!772707 () Bool)

(declare-fun e!772708 () Bool)

(assert (=> b!1362285 (= e!772707 e!772708)))

(declare-fun res!906340 () Bool)

(assert (=> b!1362285 (=> (not res!906340) (not e!772708))))

(assert (=> b!1362285 (= res!906340 ((_ is Cons!31840) acc!759))))

(declare-fun b!1362288 () Bool)

(declare-fun e!772706 () Bool)

(assert (=> b!1362288 (= e!772706 (subseq!902 acc!759 (t!46521 acc!759)))))

(declare-fun b!1362287 () Bool)

(declare-fun e!772705 () Bool)

(assert (=> b!1362287 (= e!772705 (subseq!902 (t!46521 acc!759) (t!46521 acc!759)))))

(declare-fun b!1362286 () Bool)

(assert (=> b!1362286 (= e!772708 e!772706)))

(declare-fun res!906339 () Bool)

(assert (=> b!1362286 (=> res!906339 e!772706)))

(assert (=> b!1362286 (= res!906339 e!772705)))

(declare-fun res!906341 () Bool)

(assert (=> b!1362286 (=> (not res!906341) (not e!772705))))

(assert (=> b!1362286 (= res!906341 (= (h!33049 acc!759) (h!33049 acc!759)))))

(declare-fun d!145843 () Bool)

(declare-fun res!906338 () Bool)

(assert (=> d!145843 (=> res!906338 e!772707)))

(assert (=> d!145843 (= res!906338 ((_ is Nil!31841) acc!759))))

(assert (=> d!145843 (= (subseq!902 acc!759 acc!759) e!772707)))

(assert (= (and d!145843 (not res!906338)) b!1362285))

(assert (= (and b!1362285 res!906340) b!1362286))

(assert (= (and b!1362286 res!906341) b!1362287))

(assert (= (and b!1362286 (not res!906339)) b!1362288))

(declare-fun m!1246783 () Bool)

(assert (=> b!1362288 m!1246783))

(declare-fun m!1246785 () Bool)

(assert (=> b!1362287 m!1246785))

(assert (=> b!1362150 d!145843))

(declare-fun c!127416 () Bool)

(declare-fun bm!65357 () Bool)

(declare-fun call!65360 () Bool)

(assert (=> bm!65357 (= call!65360 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127416 (Cons!31840 (select (arr!44725 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun e!772712 () Bool)

(declare-fun b!1362289 () Bool)

(assert (=> b!1362289 (= e!772712 (contains!9464 acc!759 (select (arr!44725 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362291 () Bool)

(declare-fun e!772709 () Bool)

(declare-fun e!772710 () Bool)

(assert (=> b!1362291 (= e!772709 e!772710)))

(assert (=> b!1362291 (= c!127416 (validKeyInArray!0 (select (arr!44725 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362290 () Bool)

(assert (=> b!1362290 (= e!772710 call!65360)))

(declare-fun d!145847 () Bool)

(declare-fun res!906342 () Bool)

(declare-fun e!772711 () Bool)

(assert (=> d!145847 (=> res!906342 e!772711)))

(assert (=> d!145847 (= res!906342 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45277 a!3742)))))

(assert (=> d!145847 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!772711)))

(declare-fun b!1362292 () Bool)

(assert (=> b!1362292 (= e!772710 call!65360)))

(declare-fun b!1362293 () Bool)

(assert (=> b!1362293 (= e!772711 e!772709)))

(declare-fun res!906343 () Bool)

(assert (=> b!1362293 (=> (not res!906343) (not e!772709))))

(assert (=> b!1362293 (= res!906343 (not e!772712))))

(declare-fun res!906344 () Bool)

(assert (=> b!1362293 (=> (not res!906344) (not e!772712))))

(assert (=> b!1362293 (= res!906344 (validKeyInArray!0 (select (arr!44725 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145847 (not res!906342)) b!1362293))

(assert (= (and b!1362293 res!906344) b!1362289))

(assert (= (and b!1362293 res!906343) b!1362291))

(assert (= (and b!1362291 c!127416) b!1362290))

(assert (= (and b!1362291 (not c!127416)) b!1362292))

(assert (= (or b!1362290 b!1362292) bm!65357))

(declare-fun m!1246787 () Bool)

(assert (=> bm!65357 m!1246787))

(declare-fun m!1246789 () Bool)

(assert (=> bm!65357 m!1246789))

(assert (=> b!1362289 m!1246787))

(assert (=> b!1362289 m!1246787))

(declare-fun m!1246791 () Bool)

(assert (=> b!1362289 m!1246791))

(assert (=> b!1362291 m!1246787))

(assert (=> b!1362291 m!1246787))

(declare-fun m!1246793 () Bool)

(assert (=> b!1362291 m!1246793))

(assert (=> b!1362293 m!1246787))

(assert (=> b!1362293 m!1246787))

(assert (=> b!1362293 m!1246793))

(assert (=> b!1362150 d!145847))

(assert (=> b!1362150 d!145835))

(declare-fun d!145851 () Bool)

(assert (=> d!145851 (subseq!902 acc!759 acc!759)))

(declare-fun lt!600292 () Unit!44751)

(declare-fun choose!36 (List!31844) Unit!44751)

(assert (=> d!145851 (= lt!600292 (choose!36 acc!759))))

(assert (=> d!145851 (= (lemmaListSubSeqRefl!0 acc!759) lt!600292)))

(declare-fun bs!39034 () Bool)

(assert (= bs!39034 d!145851))

(assert (=> bs!39034 m!1246679))

(declare-fun m!1246795 () Bool)

(assert (=> bs!39034 m!1246795))

(assert (=> b!1362150 d!145851))

(declare-fun d!145853 () Bool)

(assert (=> d!145853 (= (validKeyInArray!0 (select (arr!44725 a!3742) from!3120)) (and (not (= (select (arr!44725 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44725 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1362140 d!145853))

(declare-fun d!145859 () Bool)

(declare-fun lt!600293 () Bool)

(assert (=> d!145859 (= lt!600293 (select (content!695 lt!600236) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772725 () Bool)

(assert (=> d!145859 (= lt!600293 e!772725)))

(declare-fun res!906357 () Bool)

(assert (=> d!145859 (=> (not res!906357) (not e!772725))))

(assert (=> d!145859 (= res!906357 ((_ is Cons!31840) lt!600236))))

(assert (=> d!145859 (= (contains!9464 lt!600236 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600293)))

(declare-fun b!1362306 () Bool)

(declare-fun e!772726 () Bool)

(assert (=> b!1362306 (= e!772725 e!772726)))

(declare-fun res!906358 () Bool)

(assert (=> b!1362306 (=> res!906358 e!772726)))

(assert (=> b!1362306 (= res!906358 (= (h!33049 lt!600236) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362307 () Bool)

(assert (=> b!1362307 (= e!772726 (contains!9464 (t!46521 lt!600236) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145859 res!906357) b!1362306))

(assert (= (and b!1362306 (not res!906358)) b!1362307))

(assert (=> d!145859 m!1246775))

(declare-fun m!1246805 () Bool)

(assert (=> d!145859 m!1246805))

(declare-fun m!1246807 () Bool)

(assert (=> b!1362307 m!1246807))

(assert (=> b!1362151 d!145859))

(declare-fun bm!65358 () Bool)

(declare-fun call!65361 () Bool)

(declare-fun c!127417 () Bool)

(assert (=> bm!65358 (= call!65361 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127417 (Cons!31840 (select (arr!44725 a!3742) #b00000000000000000000000000000000) Nil!31841) Nil!31841)))))

(declare-fun b!1362310 () Bool)

(declare-fun e!772732 () Bool)

(assert (=> b!1362310 (= e!772732 (contains!9464 Nil!31841 (select (arr!44725 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1362312 () Bool)

(declare-fun e!772729 () Bool)

(declare-fun e!772730 () Bool)

(assert (=> b!1362312 (= e!772729 e!772730)))

(assert (=> b!1362312 (= c!127417 (validKeyInArray!0 (select (arr!44725 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1362311 () Bool)

(assert (=> b!1362311 (= e!772730 call!65361)))

(declare-fun d!145863 () Bool)

(declare-fun res!906361 () Bool)

(declare-fun e!772731 () Bool)

(assert (=> d!145863 (=> res!906361 e!772731)))

(assert (=> d!145863 (= res!906361 (bvsge #b00000000000000000000000000000000 (size!45277 a!3742)))))

(assert (=> d!145863 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31841) e!772731)))

(declare-fun b!1362313 () Bool)

(assert (=> b!1362313 (= e!772730 call!65361)))

(declare-fun b!1362314 () Bool)

(assert (=> b!1362314 (= e!772731 e!772729)))

(declare-fun res!906362 () Bool)

(assert (=> b!1362314 (=> (not res!906362) (not e!772729))))

(assert (=> b!1362314 (= res!906362 (not e!772732))))

(declare-fun res!906363 () Bool)

(assert (=> b!1362314 (=> (not res!906363) (not e!772732))))

(assert (=> b!1362314 (= res!906363 (validKeyInArray!0 (select (arr!44725 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!145863 (not res!906361)) b!1362314))

(assert (= (and b!1362314 res!906363) b!1362310))

(assert (= (and b!1362314 res!906362) b!1362312))

(assert (= (and b!1362312 c!127417) b!1362311))

(assert (= (and b!1362312 (not c!127417)) b!1362313))

(assert (= (or b!1362311 b!1362313) bm!65358))

(declare-fun m!1246813 () Bool)

(assert (=> bm!65358 m!1246813))

(declare-fun m!1246815 () Bool)

(assert (=> bm!65358 m!1246815))

(assert (=> b!1362310 m!1246813))

(assert (=> b!1362310 m!1246813))

(declare-fun m!1246817 () Bool)

(assert (=> b!1362310 m!1246817))

(assert (=> b!1362312 m!1246813))

(assert (=> b!1362312 m!1246813))

(declare-fun m!1246819 () Bool)

(assert (=> b!1362312 m!1246819))

(assert (=> b!1362314 m!1246813))

(assert (=> b!1362314 m!1246813))

(assert (=> b!1362314 m!1246819))

(assert (=> b!1362141 d!145863))

(declare-fun d!145867 () Bool)

(declare-fun lt!600294 () Bool)

(assert (=> d!145867 (= lt!600294 (select (content!695 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772733 () Bool)

(assert (=> d!145867 (= lt!600294 e!772733)))

(declare-fun res!906364 () Bool)

(assert (=> d!145867 (=> (not res!906364) (not e!772733))))

(assert (=> d!145867 (= res!906364 ((_ is Cons!31840) acc!759))))

(assert (=> d!145867 (= (contains!9464 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600294)))

(declare-fun b!1362315 () Bool)

(declare-fun e!772734 () Bool)

(assert (=> b!1362315 (= e!772733 e!772734)))

(declare-fun res!906365 () Bool)

(assert (=> b!1362315 (=> res!906365 e!772734)))

(assert (=> b!1362315 (= res!906365 (= (h!33049 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362316 () Bool)

(assert (=> b!1362316 (= e!772734 (contains!9464 (t!46521 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145867 res!906364) b!1362315))

(assert (= (and b!1362315 (not res!906365)) b!1362316))

(declare-fun m!1246821 () Bool)

(assert (=> d!145867 m!1246821))

(declare-fun m!1246823 () Bool)

(assert (=> d!145867 m!1246823))

(declare-fun m!1246825 () Bool)

(assert (=> b!1362316 m!1246825))

(assert (=> b!1362152 d!145867))

(declare-fun d!145869 () Bool)

(assert (=> d!145869 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1362142 d!145869))

(declare-fun call!65362 () Bool)

(declare-fun c!127418 () Bool)

(declare-fun bm!65359 () Bool)

(assert (=> bm!65359 (= call!65362 (arrayNoDuplicates!0 lt!600241 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127418 (Cons!31840 (select (arr!44725 lt!600241) from!3120) acc!759) acc!759)))))

(declare-fun b!1362317 () Bool)

(declare-fun e!772738 () Bool)

(assert (=> b!1362317 (= e!772738 (contains!9464 acc!759 (select (arr!44725 lt!600241) from!3120)))))

(declare-fun b!1362319 () Bool)

(declare-fun e!772735 () Bool)

(declare-fun e!772736 () Bool)

(assert (=> b!1362319 (= e!772735 e!772736)))

(assert (=> b!1362319 (= c!127418 (validKeyInArray!0 (select (arr!44725 lt!600241) from!3120)))))

(declare-fun b!1362318 () Bool)

(assert (=> b!1362318 (= e!772736 call!65362)))

(declare-fun d!145871 () Bool)

(declare-fun res!906366 () Bool)

(declare-fun e!772737 () Bool)

(assert (=> d!145871 (=> res!906366 e!772737)))

(assert (=> d!145871 (= res!906366 (bvsge from!3120 (size!45277 lt!600241)))))

(assert (=> d!145871 (= (arrayNoDuplicates!0 lt!600241 from!3120 acc!759) e!772737)))

(declare-fun b!1362320 () Bool)

(assert (=> b!1362320 (= e!772736 call!65362)))

(declare-fun b!1362321 () Bool)

(assert (=> b!1362321 (= e!772737 e!772735)))

(declare-fun res!906367 () Bool)

(assert (=> b!1362321 (=> (not res!906367) (not e!772735))))

(assert (=> b!1362321 (= res!906367 (not e!772738))))

(declare-fun res!906368 () Bool)

(assert (=> b!1362321 (=> (not res!906368) (not e!772738))))

(assert (=> b!1362321 (= res!906368 (validKeyInArray!0 (select (arr!44725 lt!600241) from!3120)))))

(assert (= (and d!145871 (not res!906366)) b!1362321))

(assert (= (and b!1362321 res!906368) b!1362317))

(assert (= (and b!1362321 res!906367) b!1362319))

(assert (= (and b!1362319 c!127418) b!1362318))

(assert (= (and b!1362319 (not c!127418)) b!1362320))

(assert (= (or b!1362318 b!1362320) bm!65359))

(declare-fun m!1246827 () Bool)

(assert (=> bm!65359 m!1246827))

(declare-fun m!1246829 () Bool)

(assert (=> bm!65359 m!1246829))

(assert (=> b!1362317 m!1246827))

(assert (=> b!1362317 m!1246827))

(declare-fun m!1246831 () Bool)

(assert (=> b!1362317 m!1246831))

(assert (=> b!1362319 m!1246827))

(assert (=> b!1362319 m!1246827))

(declare-fun m!1246833 () Bool)

(assert (=> b!1362319 m!1246833))

(assert (=> b!1362321 m!1246827))

(assert (=> b!1362321 m!1246827))

(assert (=> b!1362321 m!1246833))

(assert (=> b!1362153 d!145871))

(declare-fun c!127419 () Bool)

(declare-fun call!65363 () Bool)

(declare-fun bm!65360 () Bool)

(assert (=> bm!65360 (= call!65363 (arrayNoDuplicates!0 lt!600241 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127419 (Cons!31840 (select (arr!44725 lt!600241) (bvadd #b00000000000000000000000000000001 from!3120)) lt!600236) lt!600236)))))

(declare-fun e!772750 () Bool)

(declare-fun b!1362328 () Bool)

(assert (=> b!1362328 (= e!772750 (contains!9464 lt!600236 (select (arr!44725 lt!600241) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362330 () Bool)

(declare-fun e!772747 () Bool)

(declare-fun e!772748 () Bool)

(assert (=> b!1362330 (= e!772747 e!772748)))

(assert (=> b!1362330 (= c!127419 (validKeyInArray!0 (select (arr!44725 lt!600241) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362329 () Bool)

(assert (=> b!1362329 (= e!772748 call!65363)))

(declare-fun d!145873 () Bool)

(declare-fun res!906377 () Bool)

(declare-fun e!772749 () Bool)

(assert (=> d!145873 (=> res!906377 e!772749)))

(assert (=> d!145873 (= res!906377 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45277 lt!600241)))))

(assert (=> d!145873 (= (arrayNoDuplicates!0 lt!600241 (bvadd #b00000000000000000000000000000001 from!3120) lt!600236) e!772749)))

(declare-fun b!1362331 () Bool)

(assert (=> b!1362331 (= e!772748 call!65363)))

(declare-fun b!1362332 () Bool)

(assert (=> b!1362332 (= e!772749 e!772747)))

(declare-fun res!906378 () Bool)

(assert (=> b!1362332 (=> (not res!906378) (not e!772747))))

(assert (=> b!1362332 (= res!906378 (not e!772750))))

(declare-fun res!906379 () Bool)

(assert (=> b!1362332 (=> (not res!906379) (not e!772750))))

(assert (=> b!1362332 (= res!906379 (validKeyInArray!0 (select (arr!44725 lt!600241) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145873 (not res!906377)) b!1362332))

(assert (= (and b!1362332 res!906379) b!1362328))

(assert (= (and b!1362332 res!906378) b!1362330))

(assert (= (and b!1362330 c!127419) b!1362329))

(assert (= (and b!1362330 (not c!127419)) b!1362331))

(assert (= (or b!1362329 b!1362331) bm!65360))

(declare-fun m!1246835 () Bool)

(assert (=> bm!65360 m!1246835))

(declare-fun m!1246839 () Bool)

(assert (=> bm!65360 m!1246839))

(assert (=> b!1362328 m!1246835))

(assert (=> b!1362328 m!1246835))

(declare-fun m!1246845 () Bool)

(assert (=> b!1362328 m!1246845))

(assert (=> b!1362330 m!1246835))

(assert (=> b!1362330 m!1246835))

(declare-fun m!1246847 () Bool)

(assert (=> b!1362330 m!1246847))

(assert (=> b!1362332 m!1246835))

(assert (=> b!1362332 m!1246835))

(assert (=> b!1362332 m!1246847))

(assert (=> b!1362153 d!145873))

(declare-fun d!145877 () Bool)

(declare-fun e!772769 () Bool)

(assert (=> d!145877 e!772769))

(declare-fun res!906396 () Bool)

(assert (=> d!145877 (=> (not res!906396) (not e!772769))))

(assert (=> d!145877 (= res!906396 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45277 a!3742))))))

(declare-fun lt!600305 () Unit!44751)

(declare-fun choose!53 (array!92580 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31844) Unit!44751)

(assert (=> d!145877 (= lt!600305 (choose!53 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!600236))))

(assert (=> d!145877 (bvslt (size!45277 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145877 (= (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!600236) lt!600305)))

(declare-fun b!1362355 () Bool)

(assert (=> b!1362355 (= e!772769 (arrayNoDuplicates!0 (array!92581 (store (arr!44725 a!3742) i!1404 l!3587) (size!45277 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!600236))))

(assert (= (and d!145877 res!906396) b!1362355))

(declare-fun m!1246865 () Bool)

(assert (=> d!145877 m!1246865))

(assert (=> b!1362355 m!1246655))

(declare-fun m!1246867 () Bool)

(assert (=> b!1362355 m!1246867))

(assert (=> b!1362153 d!145877))

(declare-fun d!145887 () Bool)

(declare-fun res!906410 () Bool)

(declare-fun e!772786 () Bool)

(assert (=> d!145887 (=> res!906410 e!772786)))

(assert (=> d!145887 (= res!906410 ((_ is Nil!31841) acc!759))))

(assert (=> d!145887 (= (noDuplicate!2379 acc!759) e!772786)))

(declare-fun b!1362375 () Bool)

(declare-fun e!772787 () Bool)

(assert (=> b!1362375 (= e!772786 e!772787)))

(declare-fun res!906411 () Bool)

(assert (=> b!1362375 (=> (not res!906411) (not e!772787))))

(assert (=> b!1362375 (= res!906411 (not (contains!9464 (t!46521 acc!759) (h!33049 acc!759))))))

(declare-fun b!1362376 () Bool)

(assert (=> b!1362376 (= e!772787 (noDuplicate!2379 (t!46521 acc!759)))))

(assert (= (and d!145887 (not res!906410)) b!1362375))

(assert (= (and b!1362375 res!906411) b!1362376))

(declare-fun m!1246873 () Bool)

(assert (=> b!1362375 m!1246873))

(declare-fun m!1246877 () Bool)

(assert (=> b!1362376 m!1246877))

(assert (=> b!1362144 d!145887))

(declare-fun c!127425 () Bool)

(declare-fun bm!65366 () Bool)

(declare-fun call!65369 () Bool)

(assert (=> bm!65366 (= call!65369 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127425 (Cons!31840 (select (arr!44725 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) lt!600236) lt!600236)))))

(declare-fun e!772791 () Bool)

(declare-fun b!1362377 () Bool)

(assert (=> b!1362377 (= e!772791 (contains!9464 lt!600236 (select (arr!44725 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362379 () Bool)

(declare-fun e!772788 () Bool)

(declare-fun e!772789 () Bool)

(assert (=> b!1362379 (= e!772788 e!772789)))

(assert (=> b!1362379 (= c!127425 (validKeyInArray!0 (select (arr!44725 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1362378 () Bool)

(assert (=> b!1362378 (= e!772789 call!65369)))

(declare-fun d!145889 () Bool)

(declare-fun res!906412 () Bool)

(declare-fun e!772790 () Bool)

(assert (=> d!145889 (=> res!906412 e!772790)))

(assert (=> d!145889 (= res!906412 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45277 a!3742)))))

(assert (=> d!145889 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600236) e!772790)))

(declare-fun b!1362380 () Bool)

(assert (=> b!1362380 (= e!772789 call!65369)))

(declare-fun b!1362381 () Bool)

(assert (=> b!1362381 (= e!772790 e!772788)))

(declare-fun res!906413 () Bool)

(assert (=> b!1362381 (=> (not res!906413) (not e!772788))))

(assert (=> b!1362381 (= res!906413 (not e!772791))))

(declare-fun res!906414 () Bool)

(assert (=> b!1362381 (=> (not res!906414) (not e!772791))))

(assert (=> b!1362381 (= res!906414 (validKeyInArray!0 (select (arr!44725 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145889 (not res!906412)) b!1362381))

(assert (= (and b!1362381 res!906414) b!1362377))

(assert (= (and b!1362381 res!906413) b!1362379))

(assert (= (and b!1362379 c!127425) b!1362378))

(assert (= (and b!1362379 (not c!127425)) b!1362380))

(assert (= (or b!1362378 b!1362380) bm!65366))

(assert (=> bm!65366 m!1246787))

(declare-fun m!1246881 () Bool)

(assert (=> bm!65366 m!1246881))

(assert (=> b!1362377 m!1246787))

(assert (=> b!1362377 m!1246787))

(declare-fun m!1246883 () Bool)

(assert (=> b!1362377 m!1246883))

(assert (=> b!1362379 m!1246787))

(assert (=> b!1362379 m!1246787))

(assert (=> b!1362379 m!1246793))

(assert (=> b!1362381 m!1246787))

(assert (=> b!1362381 m!1246787))

(assert (=> b!1362381 m!1246793))

(assert (=> b!1362145 d!145889))

(declare-fun d!145893 () Bool)

(assert (=> d!145893 (= (array_inv!33958 a!3742) (bvsge (size!45277 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114896 d!145893))

(declare-fun d!145899 () Bool)

(declare-fun res!906417 () Bool)

(declare-fun e!772794 () Bool)

(assert (=> d!145899 (=> res!906417 e!772794)))

(assert (=> d!145899 (= res!906417 ((_ is Nil!31841) lt!600236))))

(assert (=> d!145899 (= (noDuplicate!2379 lt!600236) e!772794)))

(declare-fun b!1362384 () Bool)

(declare-fun e!772795 () Bool)

(assert (=> b!1362384 (= e!772794 e!772795)))

(declare-fun res!906418 () Bool)

(assert (=> b!1362384 (=> (not res!906418) (not e!772795))))

(assert (=> b!1362384 (= res!906418 (not (contains!9464 (t!46521 lt!600236) (h!33049 lt!600236))))))

(declare-fun b!1362385 () Bool)

(assert (=> b!1362385 (= e!772795 (noDuplicate!2379 (t!46521 lt!600236)))))

(assert (= (and d!145899 (not res!906417)) b!1362384))

(assert (= (and b!1362384 res!906418) b!1362385))

(declare-fun m!1246889 () Bool)

(assert (=> b!1362384 m!1246889))

(declare-fun m!1246891 () Bool)

(assert (=> b!1362385 m!1246891))

(assert (=> b!1362146 d!145899))

(declare-fun d!145901 () Bool)

(declare-fun lt!600307 () Bool)

(assert (=> d!145901 (= lt!600307 (select (content!695 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772800 () Bool)

(assert (=> d!145901 (= lt!600307 e!772800)))

(declare-fun res!906422 () Bool)

(assert (=> d!145901 (=> (not res!906422) (not e!772800))))

(assert (=> d!145901 (= res!906422 ((_ is Cons!31840) acc!759))))

(assert (=> d!145901 (= (contains!9464 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600307)))

(declare-fun b!1362391 () Bool)

(declare-fun e!772801 () Bool)

(assert (=> b!1362391 (= e!772800 e!772801)))

(declare-fun res!906423 () Bool)

(assert (=> b!1362391 (=> res!906423 e!772801)))

(assert (=> b!1362391 (= res!906423 (= (h!33049 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1362392 () Bool)

(assert (=> b!1362392 (= e!772801 (contains!9464 (t!46521 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145901 res!906422) b!1362391))

(assert (= (and b!1362391 (not res!906423)) b!1362392))

(assert (=> d!145901 m!1246821))

(declare-fun m!1246893 () Bool)

(assert (=> d!145901 m!1246893))

(declare-fun m!1246895 () Bool)

(assert (=> b!1362392 m!1246895))

(assert (=> b!1362147 d!145901))

(check-sat (not b!1362377) (not bm!65358) (not b!1362291) (not bm!65356) (not b!1362330) (not b!1362287) (not b!1362266) (not b!1362270) (not b!1362332) (not d!145839) (not d!145851) (not b!1362384) (not b!1362328) (not b!1362276) (not b!1362314) (not b!1362268) (not d!145859) (not b!1362293) (not b!1362317) (not b!1362307) (not d!145901) (not b!1362288) (not b!1362375) (not bm!65357) (not b!1362289) (not bm!65360) (not b!1362321) (not b!1362381) (not b!1362310) (not d!145877) (not b!1362319) (not b!1362385) (not b!1362316) (not b!1362379) (not bm!65366) (not d!145867) (not d!145841) (not b!1362376) (not bm!65359) (not b!1362355) (not b!1362392) (not b!1362312))
(check-sat)
