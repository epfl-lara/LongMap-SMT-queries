; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114178 () Bool)

(assert start!114178)

(declare-fun b!1353137 () Bool)

(declare-fun res!897793 () Bool)

(declare-fun e!769453 () Bool)

(assert (=> b!1353137 (=> (not res!897793) (not e!769453))))

(declare-datatypes ((List!31597 0))(
  ( (Nil!31594) (Cons!31593 (h!32811 (_ BitVec 64)) (t!46247 List!31597)) )
))
(declare-fun acc!759 () List!31597)

(declare-fun contains!9309 (List!31597 (_ BitVec 64)) Bool)

(assert (=> b!1353137 (= res!897793 (not (contains!9309 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353138 () Bool)

(declare-fun e!769452 () Bool)

(assert (=> b!1353138 (= e!769452 false)))

(declare-fun lt!597822 () Bool)

(declare-datatypes ((array!92251 0))(
  ( (array!92252 (arr!44569 (Array (_ BitVec 32) (_ BitVec 64))) (size!45120 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92251)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92251 (_ BitVec 32) List!31597) Bool)

(assert (=> b!1353138 (= lt!597822 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1353139 () Bool)

(declare-fun res!897797 () Bool)

(assert (=> b!1353139 (=> (not res!897797) (not e!769453))))

(assert (=> b!1353139 (= res!897797 (not (contains!9309 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353140 () Bool)

(declare-fun res!897794 () Bool)

(assert (=> b!1353140 (=> (not res!897794) (not e!769453))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353140 (= res!897794 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45120 a!3742))))))

(declare-fun res!897795 () Bool)

(assert (=> start!114178 (=> (not res!897795) (not e!769453))))

(assert (=> start!114178 (= res!897795 (and (bvslt (size!45120 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45120 a!3742))))))

(assert (=> start!114178 e!769453))

(assert (=> start!114178 true))

(declare-fun array_inv!33850 (array!92251) Bool)

(assert (=> start!114178 (array_inv!33850 a!3742)))

(declare-fun b!1353141 () Bool)

(declare-fun res!897796 () Bool)

(assert (=> b!1353141 (=> (not res!897796) (not e!769453))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353141 (= res!897796 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353142 () Bool)

(assert (=> b!1353142 (= e!769453 e!769452)))

(declare-fun res!897799 () Bool)

(assert (=> b!1353142 (=> (not res!897799) (not e!769452))))

(assert (=> b!1353142 (= res!897799 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44228 0))(
  ( (Unit!44229) )
))
(declare-fun lt!597821 () Unit!44228)

(declare-fun e!769450 () Unit!44228)

(assert (=> b!1353142 (= lt!597821 e!769450)))

(declare-fun c!127120 () Bool)

(assert (=> b!1353142 (= c!127120 (validKeyInArray!0 (select (arr!44569 a!3742) from!3120)))))

(declare-fun b!1353143 () Bool)

(declare-fun Unit!44230 () Unit!44228)

(assert (=> b!1353143 (= e!769450 Unit!44230)))

(declare-fun b!1353144 () Bool)

(declare-fun res!897792 () Bool)

(assert (=> b!1353144 (=> (not res!897792) (not e!769453))))

(declare-fun noDuplicate!2140 (List!31597) Bool)

(assert (=> b!1353144 (= res!897792 (noDuplicate!2140 acc!759))))

(declare-fun b!1353145 () Bool)

(declare-fun res!897801 () Bool)

(assert (=> b!1353145 (=> (not res!897801) (not e!769453))))

(assert (=> b!1353145 (= res!897801 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45120 a!3742)))))

(declare-fun b!1353146 () Bool)

(declare-fun res!897800 () Bool)

(assert (=> b!1353146 (=> (not res!897800) (not e!769453))))

(assert (=> b!1353146 (= res!897800 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353147 () Bool)

(declare-fun lt!597820 () Unit!44228)

(assert (=> b!1353147 (= e!769450 lt!597820)))

(declare-fun lt!597819 () Unit!44228)

(declare-fun lemmaListSubSeqRefl!0 (List!31597) Unit!44228)

(assert (=> b!1353147 (= lt!597819 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!686 (List!31597 List!31597) Bool)

(assert (=> b!1353147 (subseq!686 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92251 List!31597 List!31597 (_ BitVec 32)) Unit!44228)

(declare-fun $colon$colon!700 (List!31597 (_ BitVec 64)) List!31597)

(assert (=> b!1353147 (= lt!597820 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!700 acc!759 (select (arr!44569 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1353147 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353148 () Bool)

(declare-fun res!897798 () Bool)

(assert (=> b!1353148 (=> (not res!897798) (not e!769453))))

(assert (=> b!1353148 (= res!897798 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31594))))

(assert (= (and start!114178 res!897795) b!1353144))

(assert (= (and b!1353144 res!897792) b!1353137))

(assert (= (and b!1353137 res!897793) b!1353139))

(assert (= (and b!1353139 res!897797) b!1353148))

(assert (= (and b!1353148 res!897798) b!1353146))

(assert (= (and b!1353146 res!897800) b!1353140))

(assert (= (and b!1353140 res!897794) b!1353141))

(assert (= (and b!1353141 res!897796) b!1353145))

(assert (= (and b!1353145 res!897801) b!1353142))

(assert (= (and b!1353142 c!127120) b!1353147))

(assert (= (and b!1353142 (not c!127120)) b!1353143))

(assert (= (and b!1353142 res!897799) b!1353138))

(declare-fun m!1240381 () Bool)

(assert (=> b!1353138 m!1240381))

(declare-fun m!1240383 () Bool)

(assert (=> b!1353137 m!1240383))

(declare-fun m!1240385 () Bool)

(assert (=> b!1353139 m!1240385))

(declare-fun m!1240387 () Bool)

(assert (=> b!1353144 m!1240387))

(declare-fun m!1240389 () Bool)

(assert (=> start!114178 m!1240389))

(declare-fun m!1240391 () Bool)

(assert (=> b!1353142 m!1240391))

(assert (=> b!1353142 m!1240391))

(declare-fun m!1240393 () Bool)

(assert (=> b!1353142 m!1240393))

(declare-fun m!1240395 () Bool)

(assert (=> b!1353148 m!1240395))

(declare-fun m!1240397 () Bool)

(assert (=> b!1353141 m!1240397))

(declare-fun m!1240399 () Bool)

(assert (=> b!1353146 m!1240399))

(declare-fun m!1240401 () Bool)

(assert (=> b!1353147 m!1240401))

(assert (=> b!1353147 m!1240391))

(declare-fun m!1240403 () Bool)

(assert (=> b!1353147 m!1240403))

(declare-fun m!1240405 () Bool)

(assert (=> b!1353147 m!1240405))

(assert (=> b!1353147 m!1240381))

(assert (=> b!1353147 m!1240391))

(assert (=> b!1353147 m!1240403))

(declare-fun m!1240407 () Bool)

(assert (=> b!1353147 m!1240407))

(check-sat (not start!114178) (not b!1353148) (not b!1353141) (not b!1353138) (not b!1353147) (not b!1353142) (not b!1353139) (not b!1353144) (not b!1353137) (not b!1353146))
(check-sat)
