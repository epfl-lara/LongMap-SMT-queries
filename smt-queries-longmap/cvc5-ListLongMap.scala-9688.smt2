; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114410 () Bool)

(assert start!114410)

(declare-fun b!1358135 () Bool)

(declare-fun res!902821 () Bool)

(declare-fun e!770820 () Bool)

(assert (=> b!1358135 (=> (not res!902821) (not e!770820))))

(declare-datatypes ((List!31713 0))(
  ( (Nil!31710) (Cons!31709 (h!32918 (_ BitVec 64)) (t!46380 List!31713)) )
))
(declare-fun acc!759 () List!31713)

(declare-fun noDuplicate!2279 (List!31713) Bool)

(assert (=> b!1358135 (= res!902821 (noDuplicate!2279 acc!759))))

(declare-fun b!1358136 () Bool)

(declare-fun res!902829 () Bool)

(assert (=> b!1358136 (=> (not res!902829) (not e!770820))))

(declare-datatypes ((array!92457 0))(
  ( (array!92458 (arr!44672 (Array (_ BitVec 32) (_ BitVec 64))) (size!45222 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92457)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92457 (_ BitVec 32) List!31713) Bool)

(assert (=> b!1358136 (= res!902829 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358137 () Bool)

(declare-fun res!902824 () Bool)

(assert (=> b!1358137 (=> (not res!902824) (not e!770820))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358137 (= res!902824 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358138 () Bool)

(declare-fun res!902825 () Bool)

(assert (=> b!1358138 (=> (not res!902825) (not e!770820))))

(declare-fun contains!9422 (List!31713 (_ BitVec 64)) Bool)

(assert (=> b!1358138 (= res!902825 (not (contains!9422 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358139 () Bool)

(declare-fun res!902823 () Bool)

(assert (=> b!1358139 (=> (not res!902823) (not e!770820))))

(assert (=> b!1358139 (= res!902823 (validKeyInArray!0 (select (arr!44672 a!3742) from!3120)))))

(declare-fun b!1358140 () Bool)

(declare-fun e!770821 () Bool)

(assert (=> b!1358140 (= e!770820 (not e!770821))))

(declare-fun res!902827 () Bool)

(assert (=> b!1358140 (=> res!902827 e!770821)))

(assert (=> b!1358140 (= res!902827 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun lt!599280 () List!31713)

(declare-fun $colon$colon!827 (List!31713 (_ BitVec 64)) List!31713)

(assert (=> b!1358140 (= lt!599280 ($colon$colon!827 acc!759 (select (arr!44672 a!3742) from!3120)))))

(declare-fun subseq!824 (List!31713 List!31713) Bool)

(assert (=> b!1358140 (subseq!824 acc!759 acc!759)))

(declare-datatypes ((Unit!44679 0))(
  ( (Unit!44680) )
))
(declare-fun lt!599281 () Unit!44679)

(declare-fun lemmaListSubSeqRefl!0 (List!31713) Unit!44679)

(assert (=> b!1358140 (= lt!599281 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1358141 () Bool)

(declare-fun res!902820 () Bool)

(assert (=> b!1358141 (=> (not res!902820) (not e!770820))))

(assert (=> b!1358141 (= res!902820 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31710))))

(declare-fun b!1358142 () Bool)

(declare-fun res!902822 () Bool)

(assert (=> b!1358142 (=> res!902822 e!770821)))

(assert (=> b!1358142 (= res!902822 (contains!9422 lt!599280 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!902832 () Bool)

(assert (=> start!114410 (=> (not res!902832) (not e!770820))))

(assert (=> start!114410 (= res!902832 (and (bvslt (size!45222 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45222 a!3742))))))

(assert (=> start!114410 e!770820))

(assert (=> start!114410 true))

(declare-fun array_inv!33700 (array!92457) Bool)

(assert (=> start!114410 (array_inv!33700 a!3742)))

(declare-fun b!1358143 () Bool)

(declare-fun res!902819 () Bool)

(assert (=> b!1358143 (=> res!902819 e!770821)))

(assert (=> b!1358143 (= res!902819 (contains!9422 lt!599280 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358144 () Bool)

(declare-fun res!902830 () Bool)

(assert (=> b!1358144 (=> res!902830 e!770821)))

(assert (=> b!1358144 (= res!902830 (not (subseq!824 acc!759 lt!599280)))))

(declare-fun b!1358145 () Bool)

(declare-fun res!902826 () Bool)

(assert (=> b!1358145 (=> (not res!902826) (not e!770820))))

(assert (=> b!1358145 (= res!902826 (not (contains!9422 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358146 () Bool)

(declare-fun res!902833 () Bool)

(assert (=> b!1358146 (=> (not res!902833) (not e!770820))))

(assert (=> b!1358146 (= res!902833 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45222 a!3742)))))

(declare-fun b!1358147 () Bool)

(declare-fun res!902828 () Bool)

(assert (=> b!1358147 (=> res!902828 e!770821)))

(assert (=> b!1358147 (= res!902828 (not (noDuplicate!2279 lt!599280)))))

(declare-fun b!1358148 () Bool)

(assert (=> b!1358148 (= e!770821 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!599280))))

(declare-fun lt!599279 () Unit!44679)

(declare-fun noDuplicateSubseq!134 (List!31713 List!31713) Unit!44679)

(assert (=> b!1358148 (= lt!599279 (noDuplicateSubseq!134 acc!759 lt!599280))))

(declare-fun b!1358149 () Bool)

(declare-fun res!902831 () Bool)

(assert (=> b!1358149 (=> (not res!902831) (not e!770820))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358149 (= res!902831 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45222 a!3742))))))

(assert (= (and start!114410 res!902832) b!1358135))

(assert (= (and b!1358135 res!902821) b!1358138))

(assert (= (and b!1358138 res!902825) b!1358145))

(assert (= (and b!1358145 res!902826) b!1358141))

(assert (= (and b!1358141 res!902820) b!1358136))

(assert (= (and b!1358136 res!902829) b!1358149))

(assert (= (and b!1358149 res!902831) b!1358137))

(assert (= (and b!1358137 res!902824) b!1358146))

(assert (= (and b!1358146 res!902833) b!1358139))

(assert (= (and b!1358139 res!902823) b!1358140))

(assert (= (and b!1358140 (not res!902827)) b!1358147))

(assert (= (and b!1358147 (not res!902828)) b!1358143))

(assert (= (and b!1358143 (not res!902819)) b!1358142))

(assert (= (and b!1358142 (not res!902822)) b!1358144))

(assert (= (and b!1358144 (not res!902830)) b!1358148))

(declare-fun m!1243747 () Bool)

(assert (=> b!1358139 m!1243747))

(assert (=> b!1358139 m!1243747))

(declare-fun m!1243749 () Bool)

(assert (=> b!1358139 m!1243749))

(declare-fun m!1243751 () Bool)

(assert (=> b!1358136 m!1243751))

(declare-fun m!1243753 () Bool)

(assert (=> b!1358135 m!1243753))

(declare-fun m!1243755 () Bool)

(assert (=> b!1358142 m!1243755))

(declare-fun m!1243757 () Bool)

(assert (=> b!1358137 m!1243757))

(declare-fun m!1243759 () Bool)

(assert (=> b!1358144 m!1243759))

(declare-fun m!1243761 () Bool)

(assert (=> b!1358141 m!1243761))

(declare-fun m!1243763 () Bool)

(assert (=> b!1358145 m!1243763))

(declare-fun m!1243765 () Bool)

(assert (=> b!1358148 m!1243765))

(declare-fun m!1243767 () Bool)

(assert (=> b!1358148 m!1243767))

(declare-fun m!1243769 () Bool)

(assert (=> b!1358138 m!1243769))

(assert (=> b!1358140 m!1243747))

(assert (=> b!1358140 m!1243747))

(declare-fun m!1243771 () Bool)

(assert (=> b!1358140 m!1243771))

(declare-fun m!1243773 () Bool)

(assert (=> b!1358140 m!1243773))

(declare-fun m!1243775 () Bool)

(assert (=> b!1358140 m!1243775))

(declare-fun m!1243777 () Bool)

(assert (=> b!1358143 m!1243777))

(declare-fun m!1243779 () Bool)

(assert (=> start!114410 m!1243779))

(declare-fun m!1243781 () Bool)

(assert (=> b!1358147 m!1243781))

(push 1)

(assert (not b!1358142))

(assert (not b!1358141))

(assert (not b!1358145))

(assert (not b!1358143))

(assert (not b!1358138))

(assert (not b!1358147))

(assert (not b!1358139))

(assert (not b!1358135))

(assert (not b!1358136))

(assert (not b!1358144))

(assert (not b!1358148))

(assert (not start!114410))

(assert (not b!1358137))

(assert (not b!1358140))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1358324 () Bool)

(declare-fun e!770918 () Bool)

(declare-fun call!65286 () Bool)

(assert (=> b!1358324 (= e!770918 call!65286)))

(declare-fun b!1358325 () Bool)

(declare-fun e!770917 () Bool)

(declare-fun e!770916 () Bool)

(assert (=> b!1358325 (= e!770917 e!770916)))

(declare-fun res!902992 () Bool)

(assert (=> b!1358325 (=> (not res!902992) (not e!770916))))

(declare-fun e!770915 () Bool)

(assert (=> b!1358325 (= res!902992 (not e!770915))))

(declare-fun res!902991 () Bool)

(assert (=> b!1358325 (=> (not res!902991) (not e!770915))))

(assert (=> b!1358325 (= res!902991 (validKeyInArray!0 (select (arr!44672 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1358326 () Bool)

(assert (=> b!1358326 (= e!770915 (contains!9422 Nil!31710 (select (arr!44672 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65283 () Bool)

(declare-fun c!127107 () Bool)

(assert (=> bm!65283 (= call!65286 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127107 (Cons!31709 (select (arr!44672 a!3742) #b00000000000000000000000000000000) Nil!31710) Nil!31710)))))

(declare-fun b!1358327 () Bool)

(assert (=> b!1358327 (= e!770916 e!770918)))

(assert (=> b!1358327 (= c!127107 (validKeyInArray!0 (select (arr!44672 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1358328 () Bool)

(assert (=> b!1358328 (= e!770918 call!65286)))

(declare-fun d!145371 () Bool)

(declare-fun res!902990 () Bool)

(assert (=> d!145371 (=> res!902990 e!770917)))

(assert (=> d!145371 (= res!902990 (bvsge #b00000000000000000000000000000000 (size!45222 a!3742)))))

(assert (=> d!145371 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31710) e!770917)))

(assert (= (and d!145371 (not res!902990)) b!1358325))

(assert (= (and b!1358325 res!902991) b!1358326))

(assert (= (and b!1358325 res!902992) b!1358327))

(assert (= (and b!1358327 c!127107) b!1358324))

(assert (= (and b!1358327 (not c!127107)) b!1358328))

(assert (= (or b!1358324 b!1358328) bm!65283))

(declare-fun m!1243915 () Bool)

(assert (=> b!1358325 m!1243915))

(assert (=> b!1358325 m!1243915))

(declare-fun m!1243917 () Bool)

(assert (=> b!1358325 m!1243917))

(assert (=> b!1358326 m!1243915))

(assert (=> b!1358326 m!1243915))

(declare-fun m!1243919 () Bool)

(assert (=> b!1358326 m!1243919))

(assert (=> bm!65283 m!1243915))

(declare-fun m!1243921 () Bool)

(assert (=> bm!65283 m!1243921))

(assert (=> b!1358327 m!1243915))

(assert (=> b!1358327 m!1243915))

(assert (=> b!1358327 m!1243917))

(assert (=> b!1358141 d!145371))

(declare-fun d!145381 () Bool)

(assert (=> d!145381 (= ($colon$colon!827 acc!759 (select (arr!44672 a!3742) from!3120)) (Cons!31709 (select (arr!44672 a!3742) from!3120) acc!759))))

(assert (=> b!1358140 d!145381))

(declare-fun b!1358352 () Bool)

(declare-fun e!770939 () Bool)

(assert (=> b!1358352 (= e!770939 (subseq!824 (t!46380 acc!759) (t!46380 acc!759)))))

(declare-fun b!1358353 () Bool)

(declare-fun e!770940 () Bool)

(assert (=> b!1358353 (= e!770940 (subseq!824 acc!759 (t!46380 acc!759)))))

(declare-fun b!1358350 () Bool)

(declare-fun e!770941 () Bool)

(declare-fun e!770942 () Bool)

(assert (=> b!1358350 (= e!770941 e!770942)))

(declare-fun res!903014 () Bool)

(assert (=> b!1358350 (=> (not res!903014) (not e!770942))))

(assert (=> b!1358350 (= res!903014 (is-Cons!31709 acc!759))))

(declare-fun d!145383 () Bool)

(declare-fun res!903013 () Bool)

(assert (=> d!145383 (=> res!903013 e!770941)))

(assert (=> d!145383 (= res!903013 (is-Nil!31710 acc!759))))

(assert (=> d!145383 (= (subseq!824 acc!759 acc!759) e!770941)))

(declare-fun b!1358351 () Bool)

(assert (=> b!1358351 (= e!770942 e!770940)))

(declare-fun res!903015 () Bool)

(assert (=> b!1358351 (=> res!903015 e!770940)))

(assert (=> b!1358351 (= res!903015 e!770939)))

(declare-fun res!903012 () Bool)

(assert (=> b!1358351 (=> (not res!903012) (not e!770939))))

(assert (=> b!1358351 (= res!903012 (= (h!32918 acc!759) (h!32918 acc!759)))))

(assert (= (and d!145383 (not res!903013)) b!1358350))

(assert (= (and b!1358350 res!903014) b!1358351))

(assert (= (and b!1358351 res!903012) b!1358352))

(assert (= (and b!1358351 (not res!903015)) b!1358353))

(declare-fun m!1243931 () Bool)

(assert (=> b!1358352 m!1243931))

(declare-fun m!1243933 () Bool)

(assert (=> b!1358353 m!1243933))

(assert (=> b!1358140 d!145383))

(declare-fun d!145389 () Bool)

(assert (=> d!145389 (subseq!824 acc!759 acc!759)))

(declare-fun lt!599314 () Unit!44679)

(declare-fun choose!36 (List!31713) Unit!44679)

(assert (=> d!145389 (= lt!599314 (choose!36 acc!759))))

(assert (=> d!145389 (= (lemmaListSubSeqRefl!0 acc!759) lt!599314)))

(declare-fun bs!38950 () Bool)

(assert (= bs!38950 d!145389))

(assert (=> bs!38950 m!1243773))

(declare-fun m!1243939 () Bool)

(assert (=> bs!38950 m!1243939))

(assert (=> b!1358140 d!145389))

(declare-fun d!145393 () Bool)

(declare-fun lt!599320 () Bool)

(declare-fun content!683 (List!31713) (Set (_ BitVec 64)))

(assert (=> d!145393 (= lt!599320 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!683 lt!599280)))))

(declare-fun e!770956 () Bool)

(assert (=> d!145393 (= lt!599320 e!770956)))

(declare-fun res!903029 () Bool)

(assert (=> d!145393 (=> (not res!903029) (not e!770956))))

(assert (=> d!145393 (= res!903029 (is-Cons!31709 lt!599280))))

(assert (=> d!145393 (= (contains!9422 lt!599280 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599320)))

(declare-fun b!1358366 () Bool)

(declare-fun e!770955 () Bool)

(assert (=> b!1358366 (= e!770956 e!770955)))

(declare-fun res!903028 () Bool)

(assert (=> b!1358366 (=> res!903028 e!770955)))

(assert (=> b!1358366 (= res!903028 (= (h!32918 lt!599280) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358367 () Bool)

(assert (=> b!1358367 (= e!770955 (contains!9422 (t!46380 lt!599280) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145393 res!903029) b!1358366))

(assert (= (and b!1358366 (not res!903028)) b!1358367))

(declare-fun m!1243943 () Bool)

(assert (=> d!145393 m!1243943))

(declare-fun m!1243945 () Bool)

(assert (=> d!145393 m!1243945))

(declare-fun m!1243947 () Bool)

(assert (=> b!1358367 m!1243947))

(assert (=> b!1358142 d!145393))

(declare-fun d!145397 () Bool)

(declare-fun lt!599321 () Bool)

(assert (=> d!145397 (= lt!599321 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!683 lt!599280)))))

(declare-fun e!770960 () Bool)

(assert (=> d!145397 (= lt!599321 e!770960)))

(declare-fun res!903033 () Bool)

(assert (=> d!145397 (=> (not res!903033) (not e!770960))))

(assert (=> d!145397 (= res!903033 (is-Cons!31709 lt!599280))))

(assert (=> d!145397 (= (contains!9422 lt!599280 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599321)))

(declare-fun b!1358370 () Bool)

(declare-fun e!770959 () Bool)

(assert (=> b!1358370 (= e!770960 e!770959)))

(declare-fun res!903032 () Bool)

(assert (=> b!1358370 (=> res!903032 e!770959)))

(assert (=> b!1358370 (= res!903032 (= (h!32918 lt!599280) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358371 () Bool)

(assert (=> b!1358371 (= e!770959 (contains!9422 (t!46380 lt!599280) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145397 res!903033) b!1358370))

(assert (= (and b!1358370 (not res!903032)) b!1358371))

(assert (=> d!145397 m!1243943))

(declare-fun m!1243953 () Bool)

(assert (=> d!145397 m!1243953))

(declare-fun m!1243955 () Bool)

(assert (=> b!1358371 m!1243955))

(assert (=> b!1358143 d!145397))

(declare-fun d!145401 () Bool)

(declare-fun lt!599322 () Bool)

(assert (=> d!145401 (= lt!599322 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!683 acc!759)))))

(declare-fun e!770962 () Bool)

(assert (=> d!145401 (= lt!599322 e!770962)))

(declare-fun res!903035 () Bool)

(assert (=> d!145401 (=> (not res!903035) (not e!770962))))

(assert (=> d!145401 (= res!903035 (is-Cons!31709 acc!759))))

(assert (=> d!145401 (= (contains!9422 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599322)))

(declare-fun b!1358372 () Bool)

(declare-fun e!770961 () Bool)

(assert (=> b!1358372 (= e!770962 e!770961)))

(declare-fun res!903034 () Bool)

(assert (=> b!1358372 (=> res!903034 e!770961)))

(assert (=> b!1358372 (= res!903034 (= (h!32918 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358373 () Bool)

(assert (=> b!1358373 (= e!770961 (contains!9422 (t!46380 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145401 res!903035) b!1358372))

(assert (= (and b!1358372 (not res!903034)) b!1358373))

(declare-fun m!1243957 () Bool)

(assert (=> d!145401 m!1243957))

(declare-fun m!1243959 () Bool)

