; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114500 () Bool)

(assert start!114500)

(declare-fun b!1358949 () Bool)

(declare-fun res!903515 () Bool)

(declare-fun e!771159 () Bool)

(assert (=> b!1358949 (=> (not res!903515) (not e!771159))))

(declare-datatypes ((List!31731 0))(
  ( (Nil!31728) (Cons!31727 (h!32936 (_ BitVec 64)) (t!46401 List!31731)) )
))
(declare-fun acc!759 () List!31731)

(declare-fun noDuplicate!2297 (List!31731) Bool)

(assert (=> b!1358949 (= res!903515 (noDuplicate!2297 acc!759))))

(declare-fun b!1358950 () Bool)

(declare-fun res!903511 () Bool)

(assert (=> b!1358950 (=> (not res!903511) (not e!771159))))

(declare-fun contains!9440 (List!31731 (_ BitVec 64)) Bool)

(assert (=> b!1358950 (= res!903511 (not (contains!9440 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358951 () Bool)

(declare-datatypes ((Unit!44730 0))(
  ( (Unit!44731) )
))
(declare-fun e!771160 () Unit!44730)

(declare-fun lt!599478 () Unit!44730)

(assert (=> b!1358951 (= e!771160 lt!599478)))

(declare-fun lt!599477 () Unit!44730)

(declare-fun lemmaListSubSeqRefl!0 (List!31731) Unit!44730)

(assert (=> b!1358951 (= lt!599477 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!842 (List!31731 List!31731) Bool)

(assert (=> b!1358951 (subseq!842 acc!759 acc!759)))

(declare-datatypes ((array!92496 0))(
  ( (array!92497 (arr!44690 (Array (_ BitVec 32) (_ BitVec 64))) (size!45240 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92496)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92496 List!31731 List!31731 (_ BitVec 32)) Unit!44730)

(declare-fun $colon$colon!845 (List!31731 (_ BitVec 64)) List!31731)

(assert (=> b!1358951 (= lt!599478 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!845 acc!759 (select (arr!44690 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92496 (_ BitVec 32) List!31731) Bool)

(assert (=> b!1358951 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358952 () Bool)

(declare-fun res!903512 () Bool)

(assert (=> b!1358952 (=> (not res!903512) (not e!771159))))

(assert (=> b!1358952 (= res!903512 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45240 a!3742)))))

(declare-fun b!1358953 () Bool)

(declare-fun res!903516 () Bool)

(assert (=> b!1358953 (=> (not res!903516) (not e!771159))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358953 (= res!903516 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45240 a!3742))))))

(declare-fun b!1358954 () Bool)

(assert (=> b!1358954 (= e!771159 false)))

(declare-fun lt!599479 () Unit!44730)

(assert (=> b!1358954 (= lt!599479 e!771160)))

(declare-fun c!127160 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358954 (= c!127160 (validKeyInArray!0 (select (arr!44690 a!3742) from!3120)))))

(declare-fun res!903517 () Bool)

(assert (=> start!114500 (=> (not res!903517) (not e!771159))))

(assert (=> start!114500 (= res!903517 (and (bvslt (size!45240 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45240 a!3742))))))

(assert (=> start!114500 e!771159))

(assert (=> start!114500 true))

(declare-fun array_inv!33718 (array!92496) Bool)

(assert (=> start!114500 (array_inv!33718 a!3742)))

(declare-fun b!1358955 () Bool)

(declare-fun res!903514 () Bool)

(assert (=> b!1358955 (=> (not res!903514) (not e!771159))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1358955 (= res!903514 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358956 () Bool)

(declare-fun res!903513 () Bool)

(assert (=> b!1358956 (=> (not res!903513) (not e!771159))))

(assert (=> b!1358956 (= res!903513 (not (contains!9440 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358957 () Bool)

(declare-fun res!903509 () Bool)

(assert (=> b!1358957 (=> (not res!903509) (not e!771159))))

(assert (=> b!1358957 (= res!903509 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358958 () Bool)

(declare-fun Unit!44732 () Unit!44730)

(assert (=> b!1358958 (= e!771160 Unit!44732)))

(declare-fun b!1358959 () Bool)

(declare-fun res!903510 () Bool)

(assert (=> b!1358959 (=> (not res!903510) (not e!771159))))

(assert (=> b!1358959 (= res!903510 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31728))))

(assert (= (and start!114500 res!903517) b!1358949))

(assert (= (and b!1358949 res!903515) b!1358950))

(assert (= (and b!1358950 res!903511) b!1358956))

(assert (= (and b!1358956 res!903513) b!1358959))

(assert (= (and b!1358959 res!903510) b!1358957))

(assert (= (and b!1358957 res!903509) b!1358953))

(assert (= (and b!1358953 res!903516) b!1358955))

(assert (= (and b!1358955 res!903514) b!1358952))

(assert (= (and b!1358952 res!903512) b!1358954))

(assert (= (and b!1358954 c!127160) b!1358951))

(assert (= (and b!1358954 (not c!127160)) b!1358958))

(declare-fun m!1244455 () Bool)

(assert (=> b!1358957 m!1244455))

(declare-fun m!1244457 () Bool)

(assert (=> b!1358959 m!1244457))

(declare-fun m!1244459 () Bool)

(assert (=> b!1358955 m!1244459))

(declare-fun m!1244461 () Bool)

(assert (=> b!1358950 m!1244461))

(declare-fun m!1244463 () Bool)

(assert (=> b!1358954 m!1244463))

(assert (=> b!1358954 m!1244463))

(declare-fun m!1244465 () Bool)

(assert (=> b!1358954 m!1244465))

(declare-fun m!1244467 () Bool)

(assert (=> b!1358949 m!1244467))

(declare-fun m!1244469 () Bool)

(assert (=> b!1358951 m!1244469))

(assert (=> b!1358951 m!1244463))

(declare-fun m!1244471 () Bool)

(assert (=> b!1358951 m!1244471))

(declare-fun m!1244473 () Bool)

(assert (=> b!1358951 m!1244473))

(declare-fun m!1244475 () Bool)

(assert (=> b!1358951 m!1244475))

(assert (=> b!1358951 m!1244463))

(assert (=> b!1358951 m!1244471))

(declare-fun m!1244477 () Bool)

(assert (=> b!1358951 m!1244477))

(declare-fun m!1244479 () Bool)

(assert (=> start!114500 m!1244479))

(declare-fun m!1244481 () Bool)

(assert (=> b!1358956 m!1244481))

(push 1)

(assert (not b!1358959))

(assert (not start!114500))

(assert (not b!1358956))

(assert (not b!1358951))

(assert (not b!1358955))

(assert (not b!1358950))

(assert (not b!1358949))

(assert (not b!1358954))

(assert (not b!1358957))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

