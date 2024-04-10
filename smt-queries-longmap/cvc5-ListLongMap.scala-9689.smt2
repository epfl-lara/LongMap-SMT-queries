; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114470 () Bool)

(assert start!114470)

(declare-fun b!1358454 () Bool)

(declare-fun res!903111 () Bool)

(declare-fun e!771024 () Bool)

(assert (=> b!1358454 (=> (not res!903111) (not e!771024))))

(declare-datatypes ((List!31716 0))(
  ( (Nil!31713) (Cons!31712 (h!32921 (_ BitVec 64)) (t!46386 List!31716)) )
))
(declare-fun acc!759 () List!31716)

(declare-fun noDuplicate!2282 (List!31716) Bool)

(assert (=> b!1358454 (= res!903111 (noDuplicate!2282 acc!759))))

(declare-fun b!1358455 () Bool)

(declare-fun res!903108 () Bool)

(assert (=> b!1358455 (=> (not res!903108) (not e!771024))))

(declare-datatypes ((array!92466 0))(
  ( (array!92467 (arr!44675 (Array (_ BitVec 32) (_ BitVec 64))) (size!45225 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92466)

(declare-fun arrayNoDuplicates!0 (array!92466 (_ BitVec 32) List!31716) Bool)

(assert (=> b!1358455 (= res!903108 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31713))))

(declare-fun res!903112 () Bool)

(assert (=> start!114470 (=> (not res!903112) (not e!771024))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114470 (= res!903112 (and (bvslt (size!45225 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45225 a!3742))))))

(assert (=> start!114470 e!771024))

(assert (=> start!114470 true))

(declare-fun array_inv!33703 (array!92466) Bool)

(assert (=> start!114470 (array_inv!33703 a!3742)))

(declare-fun b!1358456 () Bool)

(declare-fun res!903106 () Bool)

(assert (=> b!1358456 (=> (not res!903106) (not e!771024))))

(declare-fun contains!9425 (List!31716 (_ BitVec 64)) Bool)

(assert (=> b!1358456 (= res!903106 (not (contains!9425 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358457 () Bool)

(assert (=> b!1358457 (= e!771024 false)))

(declare-datatypes ((Unit!44685 0))(
  ( (Unit!44686) )
))
(declare-fun lt!599342 () Unit!44685)

(declare-fun e!771025 () Unit!44685)

(assert (=> b!1358457 (= lt!599342 e!771025)))

(declare-fun c!127115 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358457 (= c!127115 (validKeyInArray!0 (select (arr!44675 a!3742) from!3120)))))

(declare-fun b!1358458 () Bool)

(declare-fun res!903110 () Bool)

(assert (=> b!1358458 (=> (not res!903110) (not e!771024))))

(assert (=> b!1358458 (= res!903110 (not (contains!9425 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358459 () Bool)

(declare-fun lt!599343 () Unit!44685)

(assert (=> b!1358459 (= e!771025 lt!599343)))

(declare-fun lt!599344 () Unit!44685)

(declare-fun lemmaListSubSeqRefl!0 (List!31716) Unit!44685)

(assert (=> b!1358459 (= lt!599344 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!827 (List!31716 List!31716) Bool)

(assert (=> b!1358459 (subseq!827 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92466 List!31716 List!31716 (_ BitVec 32)) Unit!44685)

(declare-fun $colon$colon!830 (List!31716 (_ BitVec 64)) List!31716)

(assert (=> b!1358459 (= lt!599343 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!830 acc!759 (select (arr!44675 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1358459 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358460 () Bool)

(declare-fun res!903107 () Bool)

(assert (=> b!1358460 (=> (not res!903107) (not e!771024))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1358460 (= res!903107 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358461 () Bool)

(declare-fun res!903109 () Bool)

(assert (=> b!1358461 (=> (not res!903109) (not e!771024))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358461 (= res!903109 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45225 a!3742))))))

(declare-fun b!1358462 () Bool)

(declare-fun res!903104 () Bool)

(assert (=> b!1358462 (=> (not res!903104) (not e!771024))))

(assert (=> b!1358462 (= res!903104 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45225 a!3742)))))

(declare-fun b!1358463 () Bool)

(declare-fun Unit!44687 () Unit!44685)

(assert (=> b!1358463 (= e!771025 Unit!44687)))

(declare-fun b!1358464 () Bool)

(declare-fun res!903105 () Bool)

(assert (=> b!1358464 (=> (not res!903105) (not e!771024))))

(assert (=> b!1358464 (= res!903105 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114470 res!903112) b!1358454))

(assert (= (and b!1358454 res!903111) b!1358456))

(assert (= (and b!1358456 res!903106) b!1358458))

(assert (= (and b!1358458 res!903110) b!1358455))

(assert (= (and b!1358455 res!903108) b!1358464))

(assert (= (and b!1358464 res!903105) b!1358461))

(assert (= (and b!1358461 res!903109) b!1358460))

(assert (= (and b!1358460 res!903107) b!1358462))

(assert (= (and b!1358462 res!903104) b!1358457))

(assert (= (and b!1358457 c!127115) b!1358459))

(assert (= (and b!1358457 (not c!127115)) b!1358463))

(declare-fun m!1244035 () Bool)

(assert (=> b!1358459 m!1244035))

(declare-fun m!1244037 () Bool)

(assert (=> b!1358459 m!1244037))

(declare-fun m!1244039 () Bool)

(assert (=> b!1358459 m!1244039))

(declare-fun m!1244041 () Bool)

(assert (=> b!1358459 m!1244041))

(declare-fun m!1244043 () Bool)

(assert (=> b!1358459 m!1244043))

(assert (=> b!1358459 m!1244037))

(assert (=> b!1358459 m!1244039))

(declare-fun m!1244045 () Bool)

(assert (=> b!1358459 m!1244045))

(declare-fun m!1244047 () Bool)

(assert (=> b!1358456 m!1244047))

(assert (=> b!1358457 m!1244037))

(assert (=> b!1358457 m!1244037))

(declare-fun m!1244049 () Bool)

(assert (=> b!1358457 m!1244049))

(declare-fun m!1244051 () Bool)

(assert (=> b!1358454 m!1244051))

(declare-fun m!1244053 () Bool)

(assert (=> b!1358464 m!1244053))

(declare-fun m!1244055 () Bool)

(assert (=> start!114470 m!1244055))

(declare-fun m!1244057 () Bool)

(assert (=> b!1358455 m!1244057))

(declare-fun m!1244059 () Bool)

(assert (=> b!1358458 m!1244059))

(declare-fun m!1244061 () Bool)

(assert (=> b!1358460 m!1244061))

(push 1)

(assert (not b!1358459))

(assert (not b!1358455))

(assert (not b!1358458))

(assert (not b!1358456))

(assert (not b!1358454))

(assert (not b!1358464))

(assert (not start!114470))

(assert (not b!1358457))

(assert (not b!1358460))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

