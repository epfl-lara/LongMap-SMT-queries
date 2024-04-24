; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114190 () Bool)

(assert start!114190)

(declare-fun b!1353353 () Bool)

(declare-datatypes ((Unit!44246 0))(
  ( (Unit!44247) )
))
(declare-fun e!769525 () Unit!44246)

(declare-fun lt!597891 () Unit!44246)

(assert (=> b!1353353 (= e!769525 lt!597891)))

(declare-fun lt!597894 () Unit!44246)

(declare-datatypes ((List!31603 0))(
  ( (Nil!31600) (Cons!31599 (h!32817 (_ BitVec 64)) (t!46253 List!31603)) )
))
(declare-fun acc!759 () List!31603)

(declare-fun lemmaListSubSeqRefl!0 (List!31603) Unit!44246)

(assert (=> b!1353353 (= lt!597894 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!692 (List!31603 List!31603) Bool)

(assert (=> b!1353353 (subseq!692 acc!759 acc!759)))

(declare-datatypes ((array!92263 0))(
  ( (array!92264 (arr!44575 (Array (_ BitVec 32) (_ BitVec 64))) (size!45126 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92263)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92263 List!31603 List!31603 (_ BitVec 32)) Unit!44246)

(declare-fun $colon$colon!706 (List!31603 (_ BitVec 64)) List!31603)

(assert (=> b!1353353 (= lt!597891 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!706 acc!759 (select (arr!44575 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92263 (_ BitVec 32) List!31603) Bool)

(assert (=> b!1353353 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353354 () Bool)

(declare-fun res!897979 () Bool)

(declare-fun e!769523 () Bool)

(assert (=> b!1353354 (=> (not res!897979) (not e!769523))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353354 (= res!897979 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353355 () Bool)

(declare-fun e!769524 () Bool)

(assert (=> b!1353355 (= e!769524 false)))

(declare-fun lt!597893 () Bool)

(assert (=> b!1353355 (= lt!597893 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1353356 () Bool)

(declare-fun res!897972 () Bool)

(assert (=> b!1353356 (=> (not res!897972) (not e!769523))))

(assert (=> b!1353356 (= res!897972 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353357 () Bool)

(declare-fun res!897974 () Bool)

(assert (=> b!1353357 (=> (not res!897974) (not e!769523))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353357 (= res!897974 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45126 a!3742))))))

(declare-fun res!897978 () Bool)

(assert (=> start!114190 (=> (not res!897978) (not e!769523))))

(assert (=> start!114190 (= res!897978 (and (bvslt (size!45126 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45126 a!3742))))))

(assert (=> start!114190 e!769523))

(assert (=> start!114190 true))

(declare-fun array_inv!33856 (array!92263) Bool)

(assert (=> start!114190 (array_inv!33856 a!3742)))

(declare-fun b!1353358 () Bool)

(declare-fun Unit!44248 () Unit!44246)

(assert (=> b!1353358 (= e!769525 Unit!44248)))

(declare-fun b!1353359 () Bool)

(declare-fun res!897981 () Bool)

(assert (=> b!1353359 (=> (not res!897981) (not e!769523))))

(declare-fun contains!9315 (List!31603 (_ BitVec 64)) Bool)

(assert (=> b!1353359 (= res!897981 (not (contains!9315 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353360 () Bool)

(assert (=> b!1353360 (= e!769523 e!769524)))

(declare-fun res!897980 () Bool)

(assert (=> b!1353360 (=> (not res!897980) (not e!769524))))

(assert (=> b!1353360 (= res!897980 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597892 () Unit!44246)

(assert (=> b!1353360 (= lt!597892 e!769525)))

(declare-fun c!127138 () Bool)

(assert (=> b!1353360 (= c!127138 (validKeyInArray!0 (select (arr!44575 a!3742) from!3120)))))

(declare-fun b!1353361 () Bool)

(declare-fun res!897976 () Bool)

(assert (=> b!1353361 (=> (not res!897976) (not e!769523))))

(assert (=> b!1353361 (= res!897976 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45126 a!3742)))))

(declare-fun b!1353362 () Bool)

(declare-fun res!897975 () Bool)

(assert (=> b!1353362 (=> (not res!897975) (not e!769523))))

(assert (=> b!1353362 (= res!897975 (not (contains!9315 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353363 () Bool)

(declare-fun res!897977 () Bool)

(assert (=> b!1353363 (=> (not res!897977) (not e!769523))))

(declare-fun noDuplicate!2146 (List!31603) Bool)

(assert (=> b!1353363 (= res!897977 (noDuplicate!2146 acc!759))))

(declare-fun b!1353364 () Bool)

(declare-fun res!897973 () Bool)

(assert (=> b!1353364 (=> (not res!897973) (not e!769523))))

(assert (=> b!1353364 (= res!897973 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31600))))

(assert (= (and start!114190 res!897978) b!1353363))

(assert (= (and b!1353363 res!897977) b!1353362))

(assert (= (and b!1353362 res!897975) b!1353359))

(assert (= (and b!1353359 res!897981) b!1353364))

(assert (= (and b!1353364 res!897973) b!1353356))

(assert (= (and b!1353356 res!897972) b!1353357))

(assert (= (and b!1353357 res!897974) b!1353354))

(assert (= (and b!1353354 res!897979) b!1353361))

(assert (= (and b!1353361 res!897976) b!1353360))

(assert (= (and b!1353360 c!127138) b!1353353))

(assert (= (and b!1353360 (not c!127138)) b!1353358))

(assert (= (and b!1353360 res!897980) b!1353355))

(declare-fun m!1240549 () Bool)

(assert (=> b!1353359 m!1240549))

(declare-fun m!1240551 () Bool)

(assert (=> b!1353354 m!1240551))

(declare-fun m!1240553 () Bool)

(assert (=> start!114190 m!1240553))

(declare-fun m!1240555 () Bool)

(assert (=> b!1353356 m!1240555))

(declare-fun m!1240557 () Bool)

(assert (=> b!1353355 m!1240557))

(declare-fun m!1240559 () Bool)

(assert (=> b!1353362 m!1240559))

(declare-fun m!1240561 () Bool)

(assert (=> b!1353353 m!1240561))

(declare-fun m!1240563 () Bool)

(assert (=> b!1353353 m!1240563))

(declare-fun m!1240565 () Bool)

(assert (=> b!1353353 m!1240565))

(declare-fun m!1240567 () Bool)

(assert (=> b!1353353 m!1240567))

(assert (=> b!1353353 m!1240557))

(assert (=> b!1353353 m!1240563))

(assert (=> b!1353353 m!1240565))

(declare-fun m!1240569 () Bool)

(assert (=> b!1353353 m!1240569))

(declare-fun m!1240571 () Bool)

(assert (=> b!1353364 m!1240571))

(assert (=> b!1353360 m!1240563))

(assert (=> b!1353360 m!1240563))

(declare-fun m!1240573 () Bool)

(assert (=> b!1353360 m!1240573))

(declare-fun m!1240575 () Bool)

(assert (=> b!1353363 m!1240575))

(check-sat (not start!114190) (not b!1353355) (not b!1353362) (not b!1353356) (not b!1353363) (not b!1353353) (not b!1353359) (not b!1353360) (not b!1353364) (not b!1353354))
(check-sat)
