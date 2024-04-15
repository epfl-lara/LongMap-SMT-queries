; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113996 () Bool)

(assert start!113996)

(declare-fun res!897879 () Bool)

(declare-fun e!768826 () Bool)

(assert (=> start!113996 (=> (not res!897879) (not e!768826))))

(declare-datatypes ((array!92127 0))(
  ( (array!92128 (arr!44512 (Array (_ BitVec 32) (_ BitVec 64))) (size!45064 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92127)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113996 (= res!897879 (and (bvslt (size!45064 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45064 a!3742))))))

(assert (=> start!113996 e!768826))

(assert (=> start!113996 true))

(declare-fun array_inv!33745 (array!92127) Bool)

(assert (=> start!113996 (array_inv!33745 a!3742)))

(declare-fun b!1352524 () Bool)

(declare-fun res!897876 () Bool)

(assert (=> b!1352524 (=> (not res!897876) (not e!768826))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352524 (= res!897876 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45064 a!3742))))))

(declare-fun b!1352525 () Bool)

(declare-fun res!897878 () Bool)

(assert (=> b!1352525 (=> (not res!897878) (not e!768826))))

(declare-datatypes ((List!31631 0))(
  ( (Nil!31628) (Cons!31627 (h!32836 (_ BitVec 64)) (t!46281 List!31631)) )
))
(declare-fun arrayNoDuplicates!0 (array!92127 (_ BitVec 32) List!31631) Bool)

(assert (=> b!1352525 (= res!897878 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31628))))

(declare-fun b!1352526 () Bool)

(declare-fun res!897875 () Bool)

(assert (=> b!1352526 (=> (not res!897875) (not e!768826))))

(declare-fun acc!759 () List!31631)

(declare-fun contains!9251 (List!31631 (_ BitVec 64)) Bool)

(assert (=> b!1352526 (= res!897875 (not (contains!9251 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352527 () Bool)

(declare-fun e!768829 () Bool)

(assert (=> b!1352527 (= e!768829 false)))

(declare-fun lt!597412 () Bool)

(assert (=> b!1352527 (= lt!597412 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352528 () Bool)

(declare-fun res!897883 () Bool)

(assert (=> b!1352528 (=> (not res!897883) (not e!768826))))

(assert (=> b!1352528 (= res!897883 (not (contains!9251 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352529 () Bool)

(declare-fun res!897880 () Bool)

(assert (=> b!1352529 (=> (not res!897880) (not e!768826))))

(assert (=> b!1352529 (= res!897880 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45064 a!3742)))))

(declare-fun b!1352530 () Bool)

(declare-datatypes ((Unit!44193 0))(
  ( (Unit!44194) )
))
(declare-fun e!768828 () Unit!44193)

(declare-fun Unit!44195 () Unit!44193)

(assert (=> b!1352530 (= e!768828 Unit!44195)))

(declare-fun b!1352531 () Bool)

(declare-fun res!897882 () Bool)

(assert (=> b!1352531 (=> (not res!897882) (not e!768826))))

(declare-fun noDuplicate!2166 (List!31631) Bool)

(assert (=> b!1352531 (= res!897882 (noDuplicate!2166 acc!759))))

(declare-fun b!1352532 () Bool)

(assert (=> b!1352532 (= e!768826 e!768829)))

(declare-fun res!897877 () Bool)

(assert (=> b!1352532 (=> (not res!897877) (not e!768829))))

(assert (=> b!1352532 (= res!897877 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597410 () Unit!44193)

(assert (=> b!1352532 (= lt!597410 e!768828)))

(declare-fun c!126767 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352532 (= c!126767 (validKeyInArray!0 (select (arr!44512 a!3742) from!3120)))))

(declare-fun b!1352533 () Bool)

(declare-fun res!897881 () Bool)

(assert (=> b!1352533 (=> (not res!897881) (not e!768826))))

(assert (=> b!1352533 (= res!897881 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352534 () Bool)

(declare-fun res!897884 () Bool)

(assert (=> b!1352534 (=> (not res!897884) (not e!768826))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352534 (= res!897884 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352535 () Bool)

(declare-fun lt!597409 () Unit!44193)

(assert (=> b!1352535 (= e!768828 lt!597409)))

(declare-fun lt!597411 () Unit!44193)

(declare-fun lemmaListSubSeqRefl!0 (List!31631) Unit!44193)

(assert (=> b!1352535 (= lt!597411 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!707 (List!31631 List!31631) Bool)

(assert (=> b!1352535 (subseq!707 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92127 List!31631 List!31631 (_ BitVec 32)) Unit!44193)

(declare-fun $colon$colon!724 (List!31631 (_ BitVec 64)) List!31631)

(assert (=> b!1352535 (= lt!597409 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!724 acc!759 (select (arr!44512 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352535 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!113996 res!897879) b!1352531))

(assert (= (and b!1352531 res!897882) b!1352528))

(assert (= (and b!1352528 res!897883) b!1352526))

(assert (= (and b!1352526 res!897875) b!1352525))

(assert (= (and b!1352525 res!897878) b!1352533))

(assert (= (and b!1352533 res!897881) b!1352524))

(assert (= (and b!1352524 res!897876) b!1352534))

(assert (= (and b!1352534 res!897884) b!1352529))

(assert (= (and b!1352529 res!897880) b!1352532))

(assert (= (and b!1352532 c!126767) b!1352535))

(assert (= (and b!1352532 (not c!126767)) b!1352530))

(assert (= (and b!1352532 res!897877) b!1352527))

(declare-fun m!1238857 () Bool)

(assert (=> b!1352527 m!1238857))

(declare-fun m!1238859 () Bool)

(assert (=> b!1352526 m!1238859))

(declare-fun m!1238861 () Bool)

(assert (=> b!1352533 m!1238861))

(declare-fun m!1238863 () Bool)

(assert (=> b!1352532 m!1238863))

(assert (=> b!1352532 m!1238863))

(declare-fun m!1238865 () Bool)

(assert (=> b!1352532 m!1238865))

(declare-fun m!1238867 () Bool)

(assert (=> b!1352528 m!1238867))

(declare-fun m!1238869 () Bool)

(assert (=> b!1352525 m!1238869))

(declare-fun m!1238871 () Bool)

(assert (=> b!1352531 m!1238871))

(declare-fun m!1238873 () Bool)

(assert (=> start!113996 m!1238873))

(declare-fun m!1238875 () Bool)

(assert (=> b!1352534 m!1238875))

(declare-fun m!1238877 () Bool)

(assert (=> b!1352535 m!1238877))

(assert (=> b!1352535 m!1238863))

(declare-fun m!1238879 () Bool)

(assert (=> b!1352535 m!1238879))

(declare-fun m!1238881 () Bool)

(assert (=> b!1352535 m!1238881))

(assert (=> b!1352535 m!1238857))

(assert (=> b!1352535 m!1238863))

(assert (=> b!1352535 m!1238879))

(declare-fun m!1238883 () Bool)

(assert (=> b!1352535 m!1238883))

(check-sat (not b!1352527) (not b!1352525) (not b!1352532) (not b!1352528) (not b!1352534) (not b!1352533) (not b!1352526) (not b!1352535) (not start!113996) (not b!1352531))
(check-sat)
