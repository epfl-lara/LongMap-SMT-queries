; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113976 () Bool)

(assert start!113976)

(declare-fun b!1352234 () Bool)

(declare-datatypes ((Unit!44322 0))(
  ( (Unit!44323) )
))
(declare-fun e!768741 () Unit!44322)

(declare-fun lt!597478 () Unit!44322)

(assert (=> b!1352234 (= e!768741 lt!597478)))

(declare-fun lt!597475 () Unit!44322)

(declare-datatypes ((List!31568 0))(
  ( (Nil!31565) (Cons!31564 (h!32773 (_ BitVec 64)) (t!46226 List!31568)) )
))
(declare-fun acc!759 () List!31568)

(declare-fun lemmaListSubSeqRefl!0 (List!31568) Unit!44322)

(assert (=> b!1352234 (= lt!597475 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!697 (List!31568 List!31568) Bool)

(assert (=> b!1352234 (subseq!697 acc!759 acc!759)))

(declare-datatypes ((array!92158 0))(
  ( (array!92159 (arr!44527 (Array (_ BitVec 32) (_ BitVec 64))) (size!45077 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92158)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92158 List!31568 List!31568 (_ BitVec 32)) Unit!44322)

(declare-fun $colon$colon!712 (List!31568 (_ BitVec 64)) List!31568)

(assert (=> b!1352234 (= lt!597478 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!712 acc!759 (select (arr!44527 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92158 (_ BitVec 32) List!31568) Bool)

(assert (=> b!1352234 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352235 () Bool)

(declare-fun res!897606 () Bool)

(declare-fun e!768739 () Bool)

(assert (=> b!1352235 (=> (not res!897606) (not e!768739))))

(assert (=> b!1352235 (= res!897606 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352236 () Bool)

(declare-fun res!897608 () Bool)

(assert (=> b!1352236 (=> (not res!897608) (not e!768739))))

(declare-fun noDuplicate!2134 (List!31568) Bool)

(assert (=> b!1352236 (= res!897608 (noDuplicate!2134 acc!759))))

(declare-fun b!1352237 () Bool)

(declare-fun res!897612 () Bool)

(assert (=> b!1352237 (=> (not res!897612) (not e!768739))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352237 (= res!897612 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45077 a!3742))))))

(declare-fun b!1352239 () Bool)

(declare-fun res!897613 () Bool)

(assert (=> b!1352239 (=> (not res!897613) (not e!768739))))

(declare-fun contains!9277 (List!31568 (_ BitVec 64)) Bool)

(assert (=> b!1352239 (= res!897613 (not (contains!9277 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352240 () Bool)

(declare-fun Unit!44324 () Unit!44322)

(assert (=> b!1352240 (= e!768741 Unit!44324)))

(declare-fun b!1352241 () Bool)

(declare-fun res!897610 () Bool)

(assert (=> b!1352241 (=> (not res!897610) (not e!768739))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352241 (= res!897610 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352242 () Bool)

(declare-fun e!768742 () Bool)

(assert (=> b!1352242 (= e!768742 false)))

(declare-fun lt!597476 () Bool)

(assert (=> b!1352242 (= lt!597476 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352243 () Bool)

(declare-fun res!897607 () Bool)

(assert (=> b!1352243 (=> (not res!897607) (not e!768739))))

(assert (=> b!1352243 (= res!897607 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31565))))

(declare-fun b!1352244 () Bool)

(assert (=> b!1352244 (= e!768739 e!768742)))

(declare-fun res!897609 () Bool)

(assert (=> b!1352244 (=> (not res!897609) (not e!768742))))

(assert (=> b!1352244 (= res!897609 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597477 () Unit!44322)

(assert (=> b!1352244 (= lt!597477 e!768741)))

(declare-fun c!126755 () Bool)

(assert (=> b!1352244 (= c!126755 (validKeyInArray!0 (select (arr!44527 a!3742) from!3120)))))

(declare-fun b!1352245 () Bool)

(declare-fun res!897604 () Bool)

(assert (=> b!1352245 (=> (not res!897604) (not e!768739))))

(assert (=> b!1352245 (= res!897604 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45077 a!3742)))))

(declare-fun res!897605 () Bool)

(assert (=> start!113976 (=> (not res!897605) (not e!768739))))

(assert (=> start!113976 (= res!897605 (and (bvslt (size!45077 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45077 a!3742))))))

(assert (=> start!113976 e!768739))

(assert (=> start!113976 true))

(declare-fun array_inv!33555 (array!92158) Bool)

(assert (=> start!113976 (array_inv!33555 a!3742)))

(declare-fun b!1352238 () Bool)

(declare-fun res!897611 () Bool)

(assert (=> b!1352238 (=> (not res!897611) (not e!768739))))

(assert (=> b!1352238 (= res!897611 (not (contains!9277 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113976 res!897605) b!1352236))

(assert (= (and b!1352236 res!897608) b!1352239))

(assert (= (and b!1352239 res!897613) b!1352238))

(assert (= (and b!1352238 res!897611) b!1352243))

(assert (= (and b!1352243 res!897607) b!1352235))

(assert (= (and b!1352235 res!897606) b!1352237))

(assert (= (and b!1352237 res!897612) b!1352241))

(assert (= (and b!1352241 res!897610) b!1352245))

(assert (= (and b!1352245 res!897604) b!1352244))

(assert (= (and b!1352244 c!126755) b!1352234))

(assert (= (and b!1352244 (not c!126755)) b!1352240))

(assert (= (and b!1352244 res!897609) b!1352242))

(declare-fun m!1239093 () Bool)

(assert (=> b!1352234 m!1239093))

(declare-fun m!1239095 () Bool)

(assert (=> b!1352234 m!1239095))

(declare-fun m!1239097 () Bool)

(assert (=> b!1352234 m!1239097))

(declare-fun m!1239099 () Bool)

(assert (=> b!1352234 m!1239099))

(declare-fun m!1239101 () Bool)

(assert (=> b!1352234 m!1239101))

(assert (=> b!1352234 m!1239095))

(assert (=> b!1352234 m!1239097))

(declare-fun m!1239103 () Bool)

(assert (=> b!1352234 m!1239103))

(declare-fun m!1239105 () Bool)

(assert (=> b!1352236 m!1239105))

(assert (=> b!1352242 m!1239101))

(declare-fun m!1239107 () Bool)

(assert (=> b!1352239 m!1239107))

(declare-fun m!1239109 () Bool)

(assert (=> b!1352241 m!1239109))

(declare-fun m!1239111 () Bool)

(assert (=> start!113976 m!1239111))

(declare-fun m!1239113 () Bool)

(assert (=> b!1352243 m!1239113))

(declare-fun m!1239115 () Bool)

(assert (=> b!1352235 m!1239115))

(assert (=> b!1352244 m!1239095))

(assert (=> b!1352244 m!1239095))

(declare-fun m!1239117 () Bool)

(assert (=> b!1352244 m!1239117))

(declare-fun m!1239119 () Bool)

(assert (=> b!1352238 m!1239119))

(push 1)

(assert (not b!1352243))

(assert (not b!1352244))

