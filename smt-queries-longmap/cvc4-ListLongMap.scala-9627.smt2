; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113904 () Bool)

(assert start!113904)

(declare-fun b!1350746 () Bool)

(declare-fun res!896204 () Bool)

(declare-fun e!768372 () Bool)

(assert (=> b!1350746 (=> res!896204 e!768372)))

(declare-datatypes ((List!31532 0))(
  ( (Nil!31529) (Cons!31528 (h!32737 (_ BitVec 64)) (t!46190 List!31532)) )
))
(declare-fun acc!759 () List!31532)

(declare-fun lt!597043 () List!31532)

(declare-fun subseq!661 (List!31532 List!31532) Bool)

(assert (=> b!1350746 (= res!896204 (not (subseq!661 acc!759 lt!597043)))))

(declare-fun b!1350747 () Bool)

(declare-fun res!896209 () Bool)

(declare-fun e!768373 () Bool)

(assert (=> b!1350747 (=> (not res!896209) (not e!768373))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1350747 (= res!896209 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1350748 () Bool)

(declare-fun res!896207 () Bool)

(assert (=> b!1350748 (=> (not res!896207) (not e!768373))))

(declare-datatypes ((array!92086 0))(
  ( (array!92087 (arr!44491 (Array (_ BitVec 32) (_ BitVec 64))) (size!45041 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92086)

(declare-fun arrayNoDuplicates!0 (array!92086 (_ BitVec 32) List!31532) Bool)

(assert (=> b!1350748 (= res!896207 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31529))))

(declare-fun b!1350749 () Bool)

(declare-fun res!896213 () Bool)

(assert (=> b!1350749 (=> (not res!896213) (not e!768373))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1350749 (= res!896213 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45041 a!3742)))))

(declare-fun b!1350750 () Bool)

(assert (=> b!1350750 (= e!768373 (not e!768372))))

(declare-fun res!896216 () Bool)

(assert (=> b!1350750 (=> res!896216 e!768372)))

(assert (=> b!1350750 (= res!896216 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!676 (List!31532 (_ BitVec 64)) List!31532)

(assert (=> b!1350750 (= lt!597043 ($colon$colon!676 acc!759 (select (arr!44491 a!3742) from!3120)))))

(assert (=> b!1350750 (subseq!661 acc!759 acc!759)))

(declare-datatypes ((Unit!44236 0))(
  ( (Unit!44237) )
))
(declare-fun lt!597045 () Unit!44236)

(declare-fun lemmaListSubSeqRefl!0 (List!31532) Unit!44236)

(assert (=> b!1350750 (= lt!597045 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1350751 () Bool)

(declare-fun res!896214 () Bool)

(assert (=> b!1350751 (=> (not res!896214) (not e!768373))))

(declare-fun noDuplicate!2098 (List!31532) Bool)

(assert (=> b!1350751 (= res!896214 (noDuplicate!2098 acc!759))))

(declare-fun b!1350752 () Bool)

(declare-fun res!896217 () Bool)

(assert (=> b!1350752 (=> (not res!896217) (not e!768373))))

(declare-fun contains!9241 (List!31532 (_ BitVec 64)) Bool)

(assert (=> b!1350752 (= res!896217 (not (contains!9241 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350753 () Bool)

(declare-fun res!896215 () Bool)

(assert (=> b!1350753 (=> (not res!896215) (not e!768373))))

(assert (=> b!1350753 (= res!896215 (not (contains!9241 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350755 () Bool)

(declare-fun res!896211 () Bool)

(assert (=> b!1350755 (=> res!896211 e!768372)))

(assert (=> b!1350755 (= res!896211 (not (noDuplicate!2098 lt!597043)))))

(declare-fun b!1350756 () Bool)

(declare-fun res!896205 () Bool)

(assert (=> b!1350756 (=> (not res!896205) (not e!768373))))

(assert (=> b!1350756 (= res!896205 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1350757 () Bool)

(declare-fun res!896208 () Bool)

(assert (=> b!1350757 (=> res!896208 e!768372)))

(assert (=> b!1350757 (= res!896208 (contains!9241 lt!597043 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350758 () Bool)

(declare-fun res!896210 () Bool)

(assert (=> b!1350758 (=> (not res!896210) (not e!768373))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1350758 (= res!896210 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45041 a!3742))))))

(declare-fun b!1350759 () Bool)

(declare-fun res!896206 () Bool)

(assert (=> b!1350759 (=> res!896206 e!768372)))

(assert (=> b!1350759 (= res!896206 (contains!9241 lt!597043 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350760 () Bool)

(assert (=> b!1350760 (= e!768372 true)))

(declare-fun lt!597044 () Bool)

(assert (=> b!1350760 (= lt!597044 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597043))))

(declare-fun lt!597046 () Unit!44236)

(declare-fun noDuplicateSubseq!112 (List!31532 List!31532) Unit!44236)

(assert (=> b!1350760 (= lt!597046 (noDuplicateSubseq!112 acc!759 lt!597043))))

(declare-fun res!896212 () Bool)

(assert (=> start!113904 (=> (not res!896212) (not e!768373))))

(assert (=> start!113904 (= res!896212 (and (bvslt (size!45041 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45041 a!3742))))))

(assert (=> start!113904 e!768373))

(assert (=> start!113904 true))

(declare-fun array_inv!33519 (array!92086) Bool)

(assert (=> start!113904 (array_inv!33519 a!3742)))

(declare-fun b!1350754 () Bool)

(declare-fun res!896218 () Bool)

(assert (=> b!1350754 (=> (not res!896218) (not e!768373))))

(assert (=> b!1350754 (= res!896218 (validKeyInArray!0 (select (arr!44491 a!3742) from!3120)))))

(assert (= (and start!113904 res!896212) b!1350751))

(assert (= (and b!1350751 res!896214) b!1350752))

(assert (= (and b!1350752 res!896217) b!1350753))

(assert (= (and b!1350753 res!896215) b!1350748))

(assert (= (and b!1350748 res!896207) b!1350756))

(assert (= (and b!1350756 res!896205) b!1350758))

(assert (= (and b!1350758 res!896210) b!1350747))

(assert (= (and b!1350747 res!896209) b!1350749))

(assert (= (and b!1350749 res!896213) b!1350754))

(assert (= (and b!1350754 res!896218) b!1350750))

(assert (= (and b!1350750 (not res!896216)) b!1350755))

(assert (= (and b!1350755 (not res!896211)) b!1350759))

(assert (= (and b!1350759 (not res!896206)) b!1350757))

(assert (= (and b!1350757 (not res!896208)) b!1350746))

(assert (= (and b!1350746 (not res!896204)) b!1350760))

(declare-fun m!1237909 () Bool)

(assert (=> b!1350746 m!1237909))

(declare-fun m!1237911 () Bool)

(assert (=> b!1350755 m!1237911))

(declare-fun m!1237913 () Bool)

(assert (=> b!1350760 m!1237913))

(declare-fun m!1237915 () Bool)

(assert (=> b!1350760 m!1237915))

(declare-fun m!1237917 () Bool)

(assert (=> b!1350754 m!1237917))

(assert (=> b!1350754 m!1237917))

(declare-fun m!1237919 () Bool)

(assert (=> b!1350754 m!1237919))

(declare-fun m!1237921 () Bool)

(assert (=> b!1350759 m!1237921))

(declare-fun m!1237923 () Bool)

(assert (=> b!1350751 m!1237923))

(declare-fun m!1237925 () Bool)

(assert (=> b!1350748 m!1237925))

(assert (=> b!1350750 m!1237917))

(assert (=> b!1350750 m!1237917))

(declare-fun m!1237927 () Bool)

(assert (=> b!1350750 m!1237927))

(declare-fun m!1237929 () Bool)

(assert (=> b!1350750 m!1237929))

(declare-fun m!1237931 () Bool)

(assert (=> b!1350750 m!1237931))

(declare-fun m!1237933 () Bool)

(assert (=> b!1350752 m!1237933))

(declare-fun m!1237935 () Bool)

(assert (=> b!1350747 m!1237935))

(declare-fun m!1237937 () Bool)

(assert (=> b!1350753 m!1237937))

(declare-fun m!1237939 () Bool)

(assert (=> b!1350756 m!1237939))

(declare-fun m!1237941 () Bool)

(assert (=> start!113904 m!1237941))

(declare-fun m!1237943 () Bool)

(assert (=> b!1350757 m!1237943))

(push 1)

(assert (not b!1350757))

(assert (not b!1350760))

(assert (not b!1350754))

(assert (not b!1350748))

(assert (not b!1350753))

(assert (not b!1350746))

(assert (not b!1350756))

(assert (not start!113904))

(assert (not b!1350750))

(assert (not b!1350755))

(assert (not b!1350759))

(assert (not b!1350751))

(assert (not b!1350747))

(assert (not b!1350752))

(check-sat)

(pop 1)

