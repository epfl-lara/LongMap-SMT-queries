; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114990 () Bool)

(assert start!114990)

(declare-fun b!1362965 () Bool)

(declare-fun res!906889 () Bool)

(declare-fun e!773014 () Bool)

(assert (=> b!1362965 (=> (not res!906889) (not e!773014))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362965 (= res!906889 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362966 () Bool)

(declare-fun res!906891 () Bool)

(assert (=> b!1362966 (=> (not res!906891) (not e!773014))))

(declare-datatypes ((List!31861 0))(
  ( (Nil!31858) (Cons!31857 (h!33066 (_ BitVec 64)) (t!46541 List!31861)) )
))
(declare-fun acc!759 () List!31861)

(declare-fun contains!9481 (List!31861 (_ BitVec 64)) Bool)

(assert (=> b!1362966 (= res!906891 (not (contains!9481 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362967 () Bool)

(declare-fun res!906890 () Bool)

(assert (=> b!1362967 (=> (not res!906890) (not e!773014))))

(declare-datatypes ((array!92617 0))(
  ( (array!92618 (arr!44742 (Array (_ BitVec 32) (_ BitVec 64))) (size!45294 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92617)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92617 (_ BitVec 32) List!31861) Bool)

(assert (=> b!1362967 (= res!906890 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362968 () Bool)

(declare-fun res!906888 () Bool)

(assert (=> b!1362968 (=> (not res!906888) (not e!773014))))

(assert (=> b!1362968 (= res!906888 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45294 a!3742)))))

(declare-fun b!1362969 () Bool)

(declare-fun res!906892 () Bool)

(assert (=> b!1362969 (=> (not res!906892) (not e!773014))))

(assert (=> b!1362969 (= res!906892 (not (contains!9481 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362970 () Bool)

(declare-datatypes ((Unit!44802 0))(
  ( (Unit!44803) )
))
(declare-fun e!773012 () Unit!44802)

(declare-fun lt!600472 () Unit!44802)

(assert (=> b!1362970 (= e!773012 lt!600472)))

(declare-fun lt!600471 () Unit!44802)

(declare-fun lemmaListSubSeqRefl!0 (List!31861) Unit!44802)

(assert (=> b!1362970 (= lt!600471 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!919 (List!31861 List!31861) Bool)

(assert (=> b!1362970 (subseq!919 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92617 List!31861 List!31861 (_ BitVec 32)) Unit!44802)

(declare-fun $colon$colon!924 (List!31861 (_ BitVec 64)) List!31861)

(assert (=> b!1362970 (= lt!600472 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!924 acc!759 (select (arr!44742 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1362970 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362971 () Bool)

(declare-fun res!906896 () Bool)

(assert (=> b!1362971 (=> (not res!906896) (not e!773014))))

(assert (=> b!1362971 (= res!906896 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31858))))

(declare-fun b!1362972 () Bool)

(declare-fun Unit!44804 () Unit!44802)

(assert (=> b!1362972 (= e!773012 Unit!44804)))

(declare-fun b!1362973 () Bool)

(assert (=> b!1362973 (= e!773014 false)))

(declare-fun lt!600470 () Unit!44802)

(assert (=> b!1362973 (= lt!600470 e!773012)))

(declare-fun c!127481 () Bool)

(assert (=> b!1362973 (= c!127481 (validKeyInArray!0 (select (arr!44742 a!3742) from!3120)))))

(declare-fun res!906893 () Bool)

(assert (=> start!114990 (=> (not res!906893) (not e!773014))))

(assert (=> start!114990 (= res!906893 (and (bvslt (size!45294 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45294 a!3742))))))

(assert (=> start!114990 e!773014))

(assert (=> start!114990 true))

(declare-fun array_inv!33975 (array!92617) Bool)

(assert (=> start!114990 (array_inv!33975 a!3742)))

(declare-fun b!1362974 () Bool)

(declare-fun res!906895 () Bool)

(assert (=> b!1362974 (=> (not res!906895) (not e!773014))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362974 (= res!906895 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45294 a!3742))))))

(declare-fun b!1362975 () Bool)

(declare-fun res!906894 () Bool)

(assert (=> b!1362975 (=> (not res!906894) (not e!773014))))

(declare-fun noDuplicate!2396 (List!31861) Bool)

(assert (=> b!1362975 (= res!906894 (noDuplicate!2396 acc!759))))

(assert (= (and start!114990 res!906893) b!1362975))

(assert (= (and b!1362975 res!906894) b!1362966))

(assert (= (and b!1362966 res!906891) b!1362969))

(assert (= (and b!1362969 res!906892) b!1362971))

(assert (= (and b!1362971 res!906896) b!1362967))

(assert (= (and b!1362967 res!906890) b!1362974))

(assert (= (and b!1362974 res!906895) b!1362965))

(assert (= (and b!1362965 res!906889) b!1362968))

(assert (= (and b!1362968 res!906888) b!1362973))

(assert (= (and b!1362973 c!127481) b!1362970))

(assert (= (and b!1362973 (not c!127481)) b!1362972))

(declare-fun m!1247403 () Bool)

(assert (=> b!1362971 m!1247403))

(declare-fun m!1247405 () Bool)

(assert (=> b!1362965 m!1247405))

(declare-fun m!1247407 () Bool)

(assert (=> b!1362969 m!1247407))

(declare-fun m!1247409 () Bool)

(assert (=> b!1362973 m!1247409))

(assert (=> b!1362973 m!1247409))

(declare-fun m!1247411 () Bool)

(assert (=> b!1362973 m!1247411))

(declare-fun m!1247413 () Bool)

(assert (=> b!1362967 m!1247413))

(declare-fun m!1247415 () Bool)

(assert (=> b!1362975 m!1247415))

(declare-fun m!1247417 () Bool)

(assert (=> b!1362966 m!1247417))

(declare-fun m!1247419 () Bool)

(assert (=> start!114990 m!1247419))

(declare-fun m!1247421 () Bool)

(assert (=> b!1362970 m!1247421))

(assert (=> b!1362970 m!1247409))

(declare-fun m!1247423 () Bool)

(assert (=> b!1362970 m!1247423))

(declare-fun m!1247425 () Bool)

(assert (=> b!1362970 m!1247425))

(declare-fun m!1247427 () Bool)

(assert (=> b!1362970 m!1247427))

(assert (=> b!1362970 m!1247409))

(assert (=> b!1362970 m!1247423))

(declare-fun m!1247429 () Bool)

(assert (=> b!1362970 m!1247429))

(push 1)

(assert (not start!114990))

(assert (not b!1362973))

(assert (not b!1362966))

(assert (not b!1362971))

(assert (not b!1362967))

(assert (not b!1362969))

(assert (not b!1362975))

(assert (not b!1362970))

(assert (not b!1362965))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

