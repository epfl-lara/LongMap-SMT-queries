; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114962 () Bool)

(assert start!114962)

(declare-fun b!1362503 () Bool)

(declare-fun res!906512 () Bool)

(declare-fun e!772887 () Bool)

(assert (=> b!1362503 (=> (not res!906512) (not e!772887))))

(declare-datatypes ((List!31847 0))(
  ( (Nil!31844) (Cons!31843 (h!33052 (_ BitVec 64)) (t!46527 List!31847)) )
))
(declare-fun acc!759 () List!31847)

(declare-fun noDuplicate!2382 (List!31847) Bool)

(assert (=> b!1362503 (= res!906512 (noDuplicate!2382 acc!759))))

(declare-fun b!1362504 () Bool)

(declare-fun res!906511 () Bool)

(assert (=> b!1362504 (=> (not res!906511) (not e!772887))))

(declare-fun contains!9467 (List!31847 (_ BitVec 64)) Bool)

(assert (=> b!1362504 (= res!906511 (not (contains!9467 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362505 () Bool)

(declare-fun res!906516 () Bool)

(assert (=> b!1362505 (=> (not res!906516) (not e!772887))))

(declare-datatypes ((array!92589 0))(
  ( (array!92590 (arr!44728 (Array (_ BitVec 32) (_ BitVec 64))) (size!45280 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92589)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92589 (_ BitVec 32) List!31847) Bool)

(assert (=> b!1362505 (= res!906516 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!906517 () Bool)

(assert (=> start!114962 (=> (not res!906517) (not e!772887))))

(assert (=> start!114962 (= res!906517 (and (bvslt (size!45280 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45280 a!3742))))))

(assert (=> start!114962 e!772887))

(assert (=> start!114962 true))

(declare-fun array_inv!33961 (array!92589) Bool)

(assert (=> start!114962 (array_inv!33961 a!3742)))

(declare-fun b!1362506 () Bool)

(declare-fun res!906514 () Bool)

(assert (=> b!1362506 (=> (not res!906514) (not e!772887))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362506 (= res!906514 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362507 () Bool)

(declare-datatypes ((Unit!44760 0))(
  ( (Unit!44761) )
))
(declare-fun e!772886 () Unit!44760)

(declare-fun lt!600335 () Unit!44760)

(assert (=> b!1362507 (= e!772886 lt!600335)))

(declare-fun lt!600336 () Unit!44760)

(declare-fun lemmaListSubSeqRefl!0 (List!31847) Unit!44760)

(assert (=> b!1362507 (= lt!600336 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!905 (List!31847 List!31847) Bool)

(assert (=> b!1362507 (subseq!905 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92589 List!31847 List!31847 (_ BitVec 32)) Unit!44760)

(declare-fun $colon$colon!910 (List!31847 (_ BitVec 64)) List!31847)

(assert (=> b!1362507 (= lt!600335 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!910 acc!759 (select (arr!44728 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1362507 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362508 () Bool)

(declare-fun res!906518 () Bool)

(assert (=> b!1362508 (=> (not res!906518) (not e!772887))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362508 (= res!906518 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45280 a!3742))))))

(declare-fun b!1362509 () Bool)

(declare-fun res!906513 () Bool)

(assert (=> b!1362509 (=> (not res!906513) (not e!772887))))

(assert (=> b!1362509 (= res!906513 (not (contains!9467 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362510 () Bool)

(assert (=> b!1362510 (= e!772887 false)))

(declare-fun lt!600337 () Unit!44760)

(assert (=> b!1362510 (= lt!600337 e!772886)))

(declare-fun c!127439 () Bool)

(assert (=> b!1362510 (= c!127439 (validKeyInArray!0 (select (arr!44728 a!3742) from!3120)))))

(declare-fun b!1362511 () Bool)

(declare-fun res!906510 () Bool)

(assert (=> b!1362511 (=> (not res!906510) (not e!772887))))

(assert (=> b!1362511 (= res!906510 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31844))))

(declare-fun b!1362512 () Bool)

(declare-fun Unit!44762 () Unit!44760)

(assert (=> b!1362512 (= e!772886 Unit!44762)))

(declare-fun b!1362513 () Bool)

(declare-fun res!906515 () Bool)

(assert (=> b!1362513 (=> (not res!906515) (not e!772887))))

(assert (=> b!1362513 (= res!906515 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45280 a!3742)))))

(assert (= (and start!114962 res!906517) b!1362503))

(assert (= (and b!1362503 res!906512) b!1362509))

(assert (= (and b!1362509 res!906513) b!1362504))

(assert (= (and b!1362504 res!906511) b!1362511))

(assert (= (and b!1362511 res!906510) b!1362505))

(assert (= (and b!1362505 res!906516) b!1362508))

(assert (= (and b!1362508 res!906518) b!1362506))

(assert (= (and b!1362506 res!906514) b!1362513))

(assert (= (and b!1362513 res!906515) b!1362510))

(assert (= (and b!1362510 c!127439) b!1362507))

(assert (= (and b!1362510 (not c!127439)) b!1362512))

(declare-fun m!1247011 () Bool)

(assert (=> b!1362511 m!1247011))

(declare-fun m!1247013 () Bool)

(assert (=> b!1362503 m!1247013))

(declare-fun m!1247015 () Bool)

(assert (=> b!1362505 m!1247015))

(declare-fun m!1247017 () Bool)

(assert (=> b!1362507 m!1247017))

(declare-fun m!1247019 () Bool)

(assert (=> b!1362507 m!1247019))

(declare-fun m!1247021 () Bool)

(assert (=> b!1362507 m!1247021))

(declare-fun m!1247023 () Bool)

(assert (=> b!1362507 m!1247023))

(declare-fun m!1247025 () Bool)

(assert (=> b!1362507 m!1247025))

(assert (=> b!1362507 m!1247019))

(assert (=> b!1362507 m!1247021))

(declare-fun m!1247027 () Bool)

(assert (=> b!1362507 m!1247027))

(declare-fun m!1247029 () Bool)

(assert (=> b!1362504 m!1247029))

(assert (=> b!1362510 m!1247019))

(assert (=> b!1362510 m!1247019))

(declare-fun m!1247031 () Bool)

(assert (=> b!1362510 m!1247031))

(declare-fun m!1247033 () Bool)

(assert (=> b!1362506 m!1247033))

(declare-fun m!1247035 () Bool)

(assert (=> start!114962 m!1247035))

(declare-fun m!1247037 () Bool)

(assert (=> b!1362509 m!1247037))

(check-sat (not b!1362511) (not b!1362507) (not b!1362510) (not b!1362505) (not b!1362506) (not b!1362509) (not b!1362504) (not start!114962) (not b!1362503))
(check-sat)
