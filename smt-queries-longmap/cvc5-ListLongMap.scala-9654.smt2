; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114062 () Bool)

(assert start!114062)

(declare-fun b!1354042 () Bool)

(declare-fun res!899163 () Bool)

(declare-fun e!769313 () Bool)

(assert (=> b!1354042 (=> (not res!899163) (not e!769313))))

(declare-datatypes ((array!92244 0))(
  ( (array!92245 (arr!44570 (Array (_ BitVec 32) (_ BitVec 64))) (size!45120 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92244)

(declare-datatypes ((List!31611 0))(
  ( (Nil!31608) (Cons!31607 (h!32816 (_ BitVec 64)) (t!46269 List!31611)) )
))
(declare-fun arrayNoDuplicates!0 (array!92244 (_ BitVec 32) List!31611) Bool)

(assert (=> b!1354042 (= res!899163 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31608))))

(declare-fun b!1354043 () Bool)

(declare-fun res!899160 () Bool)

(assert (=> b!1354043 (=> (not res!899160) (not e!769313))))

(declare-fun acc!759 () List!31611)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1354043 (= res!899160 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354044 () Bool)

(declare-datatypes ((Unit!44451 0))(
  ( (Unit!44452) )
))
(declare-fun e!769314 () Unit!44451)

(declare-fun lt!598105 () Unit!44451)

(assert (=> b!1354044 (= e!769314 lt!598105)))

(declare-fun lt!598108 () Unit!44451)

(declare-fun lemmaListSubSeqRefl!0 (List!31611) Unit!44451)

(assert (=> b!1354044 (= lt!598108 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!740 (List!31611 List!31611) Bool)

(assert (=> b!1354044 (subseq!740 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92244 List!31611 List!31611 (_ BitVec 32)) Unit!44451)

(declare-fun $colon$colon!755 (List!31611 (_ BitVec 64)) List!31611)

(assert (=> b!1354044 (= lt!598105 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!755 acc!759 (select (arr!44570 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354044 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354045 () Bool)

(declare-fun e!769312 () Bool)

(assert (=> b!1354045 (= e!769313 e!769312)))

(declare-fun res!899162 () Bool)

(assert (=> b!1354045 (=> (not res!899162) (not e!769312))))

(declare-fun lt!598107 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354045 (= res!899162 (and (not (= from!3120 i!1404)) lt!598107))))

(declare-fun lt!598103 () Unit!44451)

(assert (=> b!1354045 (= lt!598103 e!769314)))

(declare-fun c!126884 () Bool)

(assert (=> b!1354045 (= c!126884 lt!598107)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354045 (= lt!598107 (validKeyInArray!0 (select (arr!44570 a!3742) from!3120)))))

(declare-fun b!1354046 () Bool)

(declare-fun res!899156 () Bool)

(assert (=> b!1354046 (=> (not res!899156) (not e!769313))))

(declare-fun contains!9320 (List!31611 (_ BitVec 64)) Bool)

(assert (=> b!1354046 (= res!899156 (not (contains!9320 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354047 () Bool)

(declare-fun res!899164 () Bool)

(assert (=> b!1354047 (=> (not res!899164) (not e!769313))))

(assert (=> b!1354047 (= res!899164 (not (contains!9320 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354048 () Bool)

(declare-fun res!899154 () Bool)

(declare-fun e!769315 () Bool)

(assert (=> b!1354048 (=> (not res!899154) (not e!769315))))

(declare-fun lt!598106 () List!31611)

(assert (=> b!1354048 (= res!899154 (not (contains!9320 lt!598106 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354049 () Bool)

(declare-fun res!899166 () Bool)

(assert (=> b!1354049 (=> (not res!899166) (not e!769313))))

(assert (=> b!1354049 (= res!899166 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45120 a!3742)))))

(declare-fun b!1354050 () Bool)

(declare-fun res!899158 () Bool)

(assert (=> b!1354050 (=> (not res!899158) (not e!769313))))

(assert (=> b!1354050 (= res!899158 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45120 a!3742))))))

(declare-fun res!899161 () Bool)

(assert (=> start!114062 (=> (not res!899161) (not e!769313))))

(assert (=> start!114062 (= res!899161 (and (bvslt (size!45120 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45120 a!3742))))))

(assert (=> start!114062 e!769313))

(assert (=> start!114062 true))

(declare-fun array_inv!33598 (array!92244) Bool)

(assert (=> start!114062 (array_inv!33598 a!3742)))

(declare-fun b!1354051 () Bool)

(assert (=> b!1354051 (= e!769315 false)))

(declare-fun lt!598104 () Bool)

(assert (=> b!1354051 (= lt!598104 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598106))))

(declare-fun b!1354052 () Bool)

(declare-fun res!899159 () Bool)

(assert (=> b!1354052 (=> (not res!899159) (not e!769315))))

(assert (=> b!1354052 (= res!899159 (not (contains!9320 lt!598106 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354053 () Bool)

(declare-fun Unit!44453 () Unit!44451)

(assert (=> b!1354053 (= e!769314 Unit!44453)))

(declare-fun b!1354054 () Bool)

(declare-fun res!899155 () Bool)

(assert (=> b!1354054 (=> (not res!899155) (not e!769315))))

(declare-fun noDuplicate!2177 (List!31611) Bool)

(assert (=> b!1354054 (= res!899155 (noDuplicate!2177 lt!598106))))

(declare-fun b!1354055 () Bool)

(assert (=> b!1354055 (= e!769312 e!769315)))

(declare-fun res!899157 () Bool)

(assert (=> b!1354055 (=> (not res!899157) (not e!769315))))

(assert (=> b!1354055 (= res!899157 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1354055 (= lt!598106 ($colon$colon!755 acc!759 (select (arr!44570 a!3742) from!3120)))))

(declare-fun b!1354056 () Bool)

(declare-fun res!899165 () Bool)

(assert (=> b!1354056 (=> (not res!899165) (not e!769313))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354056 (= res!899165 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354057 () Bool)

(declare-fun res!899167 () Bool)

(assert (=> b!1354057 (=> (not res!899167) (not e!769313))))

(assert (=> b!1354057 (= res!899167 (noDuplicate!2177 acc!759))))

(assert (= (and start!114062 res!899161) b!1354057))

(assert (= (and b!1354057 res!899167) b!1354047))

(assert (= (and b!1354047 res!899164) b!1354046))

(assert (= (and b!1354046 res!899156) b!1354042))

(assert (= (and b!1354042 res!899163) b!1354043))

(assert (= (and b!1354043 res!899160) b!1354050))

(assert (= (and b!1354050 res!899158) b!1354056))

(assert (= (and b!1354056 res!899165) b!1354049))

(assert (= (and b!1354049 res!899166) b!1354045))

(assert (= (and b!1354045 c!126884) b!1354044))

(assert (= (and b!1354045 (not c!126884)) b!1354053))

(assert (= (and b!1354045 res!899162) b!1354055))

(assert (= (and b!1354055 res!899157) b!1354054))

(assert (= (and b!1354054 res!899155) b!1354048))

(assert (= (and b!1354048 res!899154) b!1354052))

(assert (= (and b!1354052 res!899159) b!1354051))

(declare-fun m!1240513 () Bool)

(assert (=> b!1354045 m!1240513))

(assert (=> b!1354045 m!1240513))

(declare-fun m!1240515 () Bool)

(assert (=> b!1354045 m!1240515))

(declare-fun m!1240517 () Bool)

(assert (=> b!1354044 m!1240517))

(assert (=> b!1354044 m!1240513))

(declare-fun m!1240519 () Bool)

(assert (=> b!1354044 m!1240519))

(declare-fun m!1240521 () Bool)

(assert (=> b!1354044 m!1240521))

(declare-fun m!1240523 () Bool)

(assert (=> b!1354044 m!1240523))

(assert (=> b!1354044 m!1240513))

(assert (=> b!1354044 m!1240519))

(declare-fun m!1240525 () Bool)

(assert (=> b!1354044 m!1240525))

(declare-fun m!1240527 () Bool)

(assert (=> b!1354047 m!1240527))

(declare-fun m!1240529 () Bool)

(assert (=> b!1354043 m!1240529))

(declare-fun m!1240531 () Bool)

(assert (=> start!114062 m!1240531))

(declare-fun m!1240533 () Bool)

(assert (=> b!1354057 m!1240533))

(declare-fun m!1240535 () Bool)

(assert (=> b!1354042 m!1240535))

(declare-fun m!1240537 () Bool)

(assert (=> b!1354052 m!1240537))

(declare-fun m!1240539 () Bool)

(assert (=> b!1354051 m!1240539))

(declare-fun m!1240541 () Bool)

(assert (=> b!1354048 m!1240541))

(assert (=> b!1354055 m!1240513))

(assert (=> b!1354055 m!1240513))

(assert (=> b!1354055 m!1240519))

(declare-fun m!1240543 () Bool)

(assert (=> b!1354054 m!1240543))

(declare-fun m!1240545 () Bool)

(assert (=> b!1354056 m!1240545))

(declare-fun m!1240547 () Bool)

(assert (=> b!1354046 m!1240547))

(push 1)

