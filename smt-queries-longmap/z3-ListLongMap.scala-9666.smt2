; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114358 () Bool)

(assert start!114358)

(declare-fun b!1356917 () Bool)

(declare-fun res!901040 () Bool)

(declare-fun e!770650 () Bool)

(assert (=> b!1356917 (=> (not res!901040) (not e!770650))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356917 (= res!901040 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356918 () Bool)

(declare-fun res!901039 () Bool)

(assert (=> b!1356918 (=> (not res!901039) (not e!770650))))

(declare-datatypes ((List!31687 0))(
  ( (Nil!31684) (Cons!31683 (h!32901 (_ BitVec 64)) (t!46337 List!31687)) )
))
(declare-fun acc!759 () List!31687)

(declare-fun contains!9399 (List!31687 (_ BitVec 64)) Bool)

(assert (=> b!1356918 (= res!901039 (not (contains!9399 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356920 () Bool)

(declare-fun res!901038 () Bool)

(assert (=> b!1356920 (=> (not res!901038) (not e!770650))))

(declare-datatypes ((array!92431 0))(
  ( (array!92432 (arr!44659 (Array (_ BitVec 32) (_ BitVec 64))) (size!45210 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92431)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92431 (_ BitVec 32) List!31687) Bool)

(assert (=> b!1356920 (= res!901038 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356921 () Bool)

(declare-fun res!901034 () Bool)

(assert (=> b!1356921 (=> (not res!901034) (not e!770650))))

(assert (=> b!1356921 (= res!901034 (not (contains!9399 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356922 () Bool)

(declare-datatypes ((Unit!44498 0))(
  ( (Unit!44499) )
))
(declare-fun e!770649 () Unit!44498)

(declare-fun Unit!44500 () Unit!44498)

(assert (=> b!1356922 (= e!770649 Unit!44500)))

(declare-fun b!1356923 () Bool)

(declare-fun lt!599181 () Unit!44498)

(assert (=> b!1356923 (= e!770649 lt!599181)))

(declare-fun lt!599184 () Unit!44498)

(declare-fun lemmaListSubSeqRefl!0 (List!31687) Unit!44498)

(assert (=> b!1356923 (= lt!599184 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!776 (List!31687 List!31687) Bool)

(assert (=> b!1356923 (subseq!776 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92431 List!31687 List!31687 (_ BitVec 32)) Unit!44498)

(declare-fun $colon$colon!790 (List!31687 (_ BitVec 64)) List!31687)

(assert (=> b!1356923 (= lt!599181 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!790 acc!759 (select (arr!44659 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356923 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356924 () Bool)

(declare-fun res!901033 () Bool)

(assert (=> b!1356924 (=> (not res!901033) (not e!770650))))

(declare-fun noDuplicate!2230 (List!31687) Bool)

(assert (=> b!1356924 (= res!901033 (noDuplicate!2230 acc!759))))

(declare-fun b!1356925 () Bool)

(declare-fun res!901032 () Bool)

(assert (=> b!1356925 (=> (not res!901032) (not e!770650))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356925 (= res!901032 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45210 a!3742))))))

(declare-fun b!1356926 () Bool)

(declare-fun e!770648 () Bool)

(assert (=> b!1356926 (= e!770648 false)))

(declare-fun lt!599180 () Bool)

(assert (=> b!1356926 (= lt!599180 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356927 () Bool)

(assert (=> b!1356927 (= e!770650 e!770648)))

(declare-fun res!901036 () Bool)

(assert (=> b!1356927 (=> (not res!901036) (not e!770648))))

(declare-fun lt!599183 () Bool)

(assert (=> b!1356927 (= res!901036 (and (not (= from!3120 i!1404)) (not lt!599183) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599182 () Unit!44498)

(assert (=> b!1356927 (= lt!599182 e!770649)))

(declare-fun c!127390 () Bool)

(assert (=> b!1356927 (= c!127390 lt!599183)))

(assert (=> b!1356927 (= lt!599183 (validKeyInArray!0 (select (arr!44659 a!3742) from!3120)))))

(declare-fun b!1356928 () Bool)

(declare-fun res!901041 () Bool)

(assert (=> b!1356928 (=> (not res!901041) (not e!770650))))

(assert (=> b!1356928 (= res!901041 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45210 a!3742)))))

(declare-fun b!1356919 () Bool)

(declare-fun res!901035 () Bool)

(assert (=> b!1356919 (=> (not res!901035) (not e!770650))))

(assert (=> b!1356919 (= res!901035 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31684))))

(declare-fun res!901037 () Bool)

(assert (=> start!114358 (=> (not res!901037) (not e!770650))))

(assert (=> start!114358 (= res!901037 (and (bvslt (size!45210 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45210 a!3742))))))

(assert (=> start!114358 e!770650))

(assert (=> start!114358 true))

(declare-fun array_inv!33940 (array!92431) Bool)

(assert (=> start!114358 (array_inv!33940 a!3742)))

(assert (= (and start!114358 res!901037) b!1356924))

(assert (= (and b!1356924 res!901033) b!1356921))

(assert (= (and b!1356921 res!901034) b!1356918))

(assert (= (and b!1356918 res!901039) b!1356919))

(assert (= (and b!1356919 res!901035) b!1356920))

(assert (= (and b!1356920 res!901038) b!1356925))

(assert (= (and b!1356925 res!901032) b!1356917))

(assert (= (and b!1356917 res!901040) b!1356928))

(assert (= (and b!1356928 res!901041) b!1356927))

(assert (= (and b!1356927 c!127390) b!1356923))

(assert (= (and b!1356927 (not c!127390)) b!1356922))

(assert (= (and b!1356927 res!901036) b!1356926))

(declare-fun m!1243357 () Bool)

(assert (=> b!1356923 m!1243357))

(declare-fun m!1243359 () Bool)

(assert (=> b!1356923 m!1243359))

(declare-fun m!1243361 () Bool)

(assert (=> b!1356923 m!1243361))

(declare-fun m!1243363 () Bool)

(assert (=> b!1356923 m!1243363))

(declare-fun m!1243365 () Bool)

(assert (=> b!1356923 m!1243365))

(assert (=> b!1356923 m!1243359))

(assert (=> b!1356923 m!1243361))

(declare-fun m!1243367 () Bool)

(assert (=> b!1356923 m!1243367))

(assert (=> b!1356927 m!1243359))

(assert (=> b!1356927 m!1243359))

(declare-fun m!1243369 () Bool)

(assert (=> b!1356927 m!1243369))

(declare-fun m!1243371 () Bool)

(assert (=> b!1356924 m!1243371))

(declare-fun m!1243373 () Bool)

(assert (=> b!1356917 m!1243373))

(declare-fun m!1243375 () Bool)

(assert (=> b!1356920 m!1243375))

(declare-fun m!1243377 () Bool)

(assert (=> b!1356921 m!1243377))

(declare-fun m!1243379 () Bool)

(assert (=> b!1356919 m!1243379))

(declare-fun m!1243381 () Bool)

(assert (=> start!114358 m!1243381))

(declare-fun m!1243383 () Bool)

(assert (=> b!1356918 m!1243383))

(assert (=> b!1356926 m!1243365))

(check-sat (not b!1356927) (not b!1356919) (not b!1356921) (not b!1356924) (not b!1356918) (not b!1356923) (not b!1356917) (not b!1356920) (not start!114358) (not b!1356926))
(check-sat)
