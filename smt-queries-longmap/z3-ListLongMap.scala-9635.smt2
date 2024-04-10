; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113950 () Bool)

(assert start!113950)

(declare-fun b!1351766 () Bool)

(declare-fun res!897218 () Bool)

(declare-fun e!768586 () Bool)

(assert (=> b!1351766 (=> (not res!897218) (not e!768586))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92132 0))(
  ( (array!92133 (arr!44514 (Array (_ BitVec 32) (_ BitVec 64))) (size!45064 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92132)

(assert (=> b!1351766 (= res!897218 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45064 a!3742))))))

(declare-fun b!1351767 () Bool)

(declare-datatypes ((Unit!44283 0))(
  ( (Unit!44284) )
))
(declare-fun e!768584 () Unit!44283)

(declare-fun lt!597320 () Unit!44283)

(assert (=> b!1351767 (= e!768584 lt!597320)))

(declare-fun lt!597322 () Unit!44283)

(declare-datatypes ((List!31555 0))(
  ( (Nil!31552) (Cons!31551 (h!32760 (_ BitVec 64)) (t!46213 List!31555)) )
))
(declare-fun acc!759 () List!31555)

(declare-fun lemmaListSubSeqRefl!0 (List!31555) Unit!44283)

(assert (=> b!1351767 (= lt!597322 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!684 (List!31555 List!31555) Bool)

(assert (=> b!1351767 (subseq!684 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92132 List!31555 List!31555 (_ BitVec 32)) Unit!44283)

(declare-fun $colon$colon!699 (List!31555 (_ BitVec 64)) List!31555)

(assert (=> b!1351767 (= lt!597320 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!699 acc!759 (select (arr!44514 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92132 (_ BitVec 32) List!31555) Bool)

(assert (=> b!1351767 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1351768 () Bool)

(declare-fun res!897222 () Bool)

(assert (=> b!1351768 (=> (not res!897222) (not e!768586))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1351768 (= res!897222 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1351769 () Bool)

(declare-fun res!897223 () Bool)

(assert (=> b!1351769 (=> (not res!897223) (not e!768586))))

(declare-fun contains!9264 (List!31555 (_ BitVec 64)) Bool)

(assert (=> b!1351769 (= res!897223 (not (contains!9264 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351770 () Bool)

(declare-fun e!768585 () Bool)

(assert (=> b!1351770 (= e!768586 e!768585)))

(declare-fun res!897214 () Bool)

(assert (=> b!1351770 (=> (not res!897214) (not e!768585))))

(assert (=> b!1351770 (= res!897214 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597319 () Unit!44283)

(assert (=> b!1351770 (= lt!597319 e!768584)))

(declare-fun c!126716 () Bool)

(assert (=> b!1351770 (= c!126716 (validKeyInArray!0 (select (arr!44514 a!3742) from!3120)))))

(declare-fun b!1351771 () Bool)

(declare-fun res!897219 () Bool)

(assert (=> b!1351771 (=> (not res!897219) (not e!768586))))

(assert (=> b!1351771 (= res!897219 (not (contains!9264 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351772 () Bool)

(declare-fun res!897220 () Bool)

(assert (=> b!1351772 (=> (not res!897220) (not e!768586))))

(declare-fun noDuplicate!2121 (List!31555) Bool)

(assert (=> b!1351772 (= res!897220 (noDuplicate!2121 acc!759))))

(declare-fun b!1351773 () Bool)

(declare-fun res!897215 () Bool)

(assert (=> b!1351773 (=> (not res!897215) (not e!768586))))

(assert (=> b!1351773 (= res!897215 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1351774 () Bool)

(declare-fun res!897217 () Bool)

(assert (=> b!1351774 (=> (not res!897217) (not e!768586))))

(assert (=> b!1351774 (= res!897217 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31552))))

(declare-fun b!1351776 () Bool)

(declare-fun Unit!44285 () Unit!44283)

(assert (=> b!1351776 (= e!768584 Unit!44285)))

(declare-fun b!1351777 () Bool)

(declare-fun res!897216 () Bool)

(assert (=> b!1351777 (=> (not res!897216) (not e!768586))))

(assert (=> b!1351777 (= res!897216 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45064 a!3742)))))

(declare-fun b!1351775 () Bool)

(assert (=> b!1351775 (= e!768585 false)))

(declare-fun lt!597321 () Bool)

(assert (=> b!1351775 (= lt!597321 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!897221 () Bool)

(assert (=> start!113950 (=> (not res!897221) (not e!768586))))

(assert (=> start!113950 (= res!897221 (and (bvslt (size!45064 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45064 a!3742))))))

(assert (=> start!113950 e!768586))

(assert (=> start!113950 true))

(declare-fun array_inv!33542 (array!92132) Bool)

(assert (=> start!113950 (array_inv!33542 a!3742)))

(assert (= (and start!113950 res!897221) b!1351772))

(assert (= (and b!1351772 res!897220) b!1351769))

(assert (= (and b!1351769 res!897223) b!1351771))

(assert (= (and b!1351771 res!897219) b!1351774))

(assert (= (and b!1351774 res!897217) b!1351773))

(assert (= (and b!1351773 res!897215) b!1351766))

(assert (= (and b!1351766 res!897218) b!1351768))

(assert (= (and b!1351768 res!897222) b!1351777))

(assert (= (and b!1351777 res!897216) b!1351770))

(assert (= (and b!1351770 c!126716) b!1351767))

(assert (= (and b!1351770 (not c!126716)) b!1351776))

(assert (= (and b!1351770 res!897214) b!1351775))

(declare-fun m!1238729 () Bool)

(assert (=> b!1351770 m!1238729))

(assert (=> b!1351770 m!1238729))

(declare-fun m!1238731 () Bool)

(assert (=> b!1351770 m!1238731))

(declare-fun m!1238733 () Bool)

(assert (=> start!113950 m!1238733))

(declare-fun m!1238735 () Bool)

(assert (=> b!1351769 m!1238735))

(declare-fun m!1238737 () Bool)

(assert (=> b!1351771 m!1238737))

(declare-fun m!1238739 () Bool)

(assert (=> b!1351767 m!1238739))

(assert (=> b!1351767 m!1238729))

(declare-fun m!1238741 () Bool)

(assert (=> b!1351767 m!1238741))

(declare-fun m!1238743 () Bool)

(assert (=> b!1351767 m!1238743))

(declare-fun m!1238745 () Bool)

(assert (=> b!1351767 m!1238745))

(assert (=> b!1351767 m!1238729))

(assert (=> b!1351767 m!1238741))

(declare-fun m!1238747 () Bool)

(assert (=> b!1351767 m!1238747))

(declare-fun m!1238749 () Bool)

(assert (=> b!1351773 m!1238749))

(declare-fun m!1238751 () Bool)

(assert (=> b!1351774 m!1238751))

(declare-fun m!1238753 () Bool)

(assert (=> b!1351772 m!1238753))

(assert (=> b!1351775 m!1238745))

(declare-fun m!1238755 () Bool)

(assert (=> b!1351768 m!1238755))

(check-sat (not b!1351767) (not b!1351768) (not b!1351769) (not b!1351771) (not b!1351773) (not b!1351775) (not b!1351770) (not b!1351772) (not start!113950) (not b!1351774))
(check-sat)
