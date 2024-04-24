; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114400 () Bool)

(assert start!114400)

(declare-fun b!1357702 () Bool)

(declare-fun res!901699 () Bool)

(declare-fun e!770902 () Bool)

(assert (=> b!1357702 (=> (not res!901699) (not e!770902))))

(declare-datatypes ((List!31708 0))(
  ( (Nil!31705) (Cons!31704 (h!32922 (_ BitVec 64)) (t!46358 List!31708)) )
))
(declare-fun acc!759 () List!31708)

(declare-fun contains!9420 (List!31708 (_ BitVec 64)) Bool)

(assert (=> b!1357702 (= res!901699 (not (contains!9420 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357703 () Bool)

(declare-fun res!901700 () Bool)

(assert (=> b!1357703 (=> (not res!901700) (not e!770902))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92473 0))(
  ( (array!92474 (arr!44680 (Array (_ BitVec 32) (_ BitVec 64))) (size!45231 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92473)

(assert (=> b!1357703 (= res!901700 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45231 a!3742))))))

(declare-fun b!1357704 () Bool)

(declare-fun res!901695 () Bool)

(assert (=> b!1357704 (=> (not res!901695) (not e!770902))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357704 (= res!901695 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357705 () Bool)

(declare-fun res!901697 () Bool)

(assert (=> b!1357705 (=> (not res!901697) (not e!770902))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1357705 (= res!901697 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45231 a!3742)))))

(declare-fun b!1357706 () Bool)

(declare-fun res!901696 () Bool)

(assert (=> b!1357706 (=> (not res!901696) (not e!770902))))

(declare-fun arrayNoDuplicates!0 (array!92473 (_ BitVec 32) List!31708) Bool)

(assert (=> b!1357706 (= res!901696 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357707 () Bool)

(declare-fun e!770900 () Bool)

(assert (=> b!1357707 (= e!770900 (not true))))

(assert (=> b!1357707 (arrayNoDuplicates!0 (array!92474 (store (arr!44680 a!3742) i!1404 l!3587) (size!45231 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-datatypes ((Unit!44561 0))(
  ( (Unit!44562) )
))
(declare-fun lt!599499 () Unit!44561)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92473 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31708) Unit!44561)

(assert (=> b!1357707 (= lt!599499 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1357708 () Bool)

(declare-fun res!901701 () Bool)

(assert (=> b!1357708 (=> (not res!901701) (not e!770902))))

(assert (=> b!1357708 (= res!901701 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31705))))

(declare-fun b!1357709 () Bool)

(assert (=> b!1357709 (= e!770902 e!770900)))

(declare-fun res!901691 () Bool)

(assert (=> b!1357709 (=> (not res!901691) (not e!770900))))

(declare-fun lt!599497 () Bool)

(assert (=> b!1357709 (= res!901691 (and (not (= from!3120 i!1404)) (not lt!599497) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599496 () Unit!44561)

(declare-fun e!770901 () Unit!44561)

(assert (=> b!1357709 (= lt!599496 e!770901)))

(declare-fun c!127453 () Bool)

(assert (=> b!1357709 (= c!127453 lt!599497)))

(assert (=> b!1357709 (= lt!599497 (validKeyInArray!0 (select (arr!44680 a!3742) from!3120)))))

(declare-fun b!1357710 () Bool)

(declare-fun lt!599495 () Unit!44561)

(assert (=> b!1357710 (= e!770901 lt!599495)))

(declare-fun lt!599498 () Unit!44561)

(declare-fun lemmaListSubSeqRefl!0 (List!31708) Unit!44561)

(assert (=> b!1357710 (= lt!599498 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!797 (List!31708 List!31708) Bool)

(assert (=> b!1357710 (subseq!797 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92473 List!31708 List!31708 (_ BitVec 32)) Unit!44561)

(declare-fun $colon$colon!811 (List!31708 (_ BitVec 64)) List!31708)

(assert (=> b!1357710 (= lt!599495 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!811 acc!759 (select (arr!44680 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1357710 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1357711 () Bool)

(declare-fun res!901698 () Bool)

(assert (=> b!1357711 (=> (not res!901698) (not e!770902))))

(declare-fun noDuplicate!2251 (List!31708) Bool)

(assert (=> b!1357711 (= res!901698 (noDuplicate!2251 acc!759))))

(declare-fun b!1357712 () Bool)

(declare-fun res!901693 () Bool)

(assert (=> b!1357712 (=> (not res!901693) (not e!770902))))

(assert (=> b!1357712 (= res!901693 (not (contains!9420 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357713 () Bool)

(declare-fun res!901692 () Bool)

(assert (=> b!1357713 (=> (not res!901692) (not e!770900))))

(assert (=> b!1357713 (= res!901692 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1357714 () Bool)

(declare-fun Unit!44563 () Unit!44561)

(assert (=> b!1357714 (= e!770901 Unit!44563)))

(declare-fun res!901694 () Bool)

(assert (=> start!114400 (=> (not res!901694) (not e!770902))))

(assert (=> start!114400 (= res!901694 (and (bvslt (size!45231 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45231 a!3742))))))

(assert (=> start!114400 e!770902))

(assert (=> start!114400 true))

(declare-fun array_inv!33961 (array!92473) Bool)

(assert (=> start!114400 (array_inv!33961 a!3742)))

(assert (= (and start!114400 res!901694) b!1357711))

(assert (= (and b!1357711 res!901698) b!1357702))

(assert (= (and b!1357702 res!901699) b!1357712))

(assert (= (and b!1357712 res!901693) b!1357708))

(assert (= (and b!1357708 res!901701) b!1357706))

(assert (= (and b!1357706 res!901696) b!1357703))

(assert (= (and b!1357703 res!901700) b!1357704))

(assert (= (and b!1357704 res!901695) b!1357705))

(assert (= (and b!1357705 res!901697) b!1357709))

(assert (= (and b!1357709 c!127453) b!1357710))

(assert (= (and b!1357709 (not c!127453)) b!1357714))

(assert (= (and b!1357709 res!901691) b!1357713))

(assert (= (and b!1357713 res!901692) b!1357707))

(declare-fun m!1243999 () Bool)

(assert (=> b!1357706 m!1243999))

(declare-fun m!1244001 () Bool)

(assert (=> b!1357710 m!1244001))

(declare-fun m!1244003 () Bool)

(assert (=> b!1357710 m!1244003))

(declare-fun m!1244005 () Bool)

(assert (=> b!1357710 m!1244005))

(declare-fun m!1244007 () Bool)

(assert (=> b!1357710 m!1244007))

(declare-fun m!1244009 () Bool)

(assert (=> b!1357710 m!1244009))

(assert (=> b!1357710 m!1244003))

(assert (=> b!1357710 m!1244005))

(declare-fun m!1244011 () Bool)

(assert (=> b!1357710 m!1244011))

(assert (=> b!1357713 m!1244009))

(assert (=> b!1357709 m!1244003))

(assert (=> b!1357709 m!1244003))

(declare-fun m!1244013 () Bool)

(assert (=> b!1357709 m!1244013))

(declare-fun m!1244015 () Bool)

(assert (=> start!114400 m!1244015))

(declare-fun m!1244017 () Bool)

(assert (=> b!1357708 m!1244017))

(declare-fun m!1244019 () Bool)

(assert (=> b!1357711 m!1244019))

(declare-fun m!1244021 () Bool)

(assert (=> b!1357702 m!1244021))

(declare-fun m!1244023 () Bool)

(assert (=> b!1357712 m!1244023))

(declare-fun m!1244025 () Bool)

(assert (=> b!1357704 m!1244025))

(declare-fun m!1244027 () Bool)

(assert (=> b!1357707 m!1244027))

(declare-fun m!1244029 () Bool)

(assert (=> b!1357707 m!1244029))

(declare-fun m!1244031 () Bool)

(assert (=> b!1357707 m!1244031))

(check-sat (not b!1357709) (not b!1357702) (not start!114400) (not b!1357708) (not b!1357713) (not b!1357712) (not b!1357706) (not b!1357710) (not b!1357704) (not b!1357711) (not b!1357707))
(check-sat)
