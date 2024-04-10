; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114116 () Bool)

(assert start!114116)

(declare-fun b!1355294 () Bool)

(declare-fun res!900246 () Bool)

(declare-fun e!769697 () Bool)

(assert (=> b!1355294 (=> (not res!900246) (not e!769697))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92298 0))(
  ( (array!92299 (arr!44597 (Array (_ BitVec 32) (_ BitVec 64))) (size!45147 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92298)

(assert (=> b!1355294 (= res!900246 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45147 a!3742)))))

(declare-fun b!1355295 () Bool)

(declare-datatypes ((Unit!44532 0))(
  ( (Unit!44533) )
))
(declare-fun e!769696 () Unit!44532)

(declare-fun Unit!44534 () Unit!44532)

(assert (=> b!1355295 (= e!769696 Unit!44534)))

(declare-fun b!1355296 () Bool)

(declare-fun res!900249 () Bool)

(assert (=> b!1355296 (=> (not res!900249) (not e!769697))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355296 (= res!900249 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355297 () Bool)

(declare-fun res!900247 () Bool)

(assert (=> b!1355297 (=> (not res!900247) (not e!769697))))

(declare-datatypes ((List!31638 0))(
  ( (Nil!31635) (Cons!31634 (h!32843 (_ BitVec 64)) (t!46296 List!31638)) )
))
(declare-fun acc!759 () List!31638)

(declare-fun noDuplicate!2204 (List!31638) Bool)

(assert (=> b!1355297 (= res!900247 (noDuplicate!2204 acc!759))))

(declare-fun b!1355298 () Bool)

(declare-fun res!900245 () Bool)

(assert (=> b!1355298 (=> (not res!900245) (not e!769697))))

(declare-fun contains!9347 (List!31638 (_ BitVec 64)) Bool)

(assert (=> b!1355298 (= res!900245 (not (contains!9347 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355299 () Bool)

(declare-fun res!900248 () Bool)

(assert (=> b!1355299 (=> (not res!900248) (not e!769697))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355299 (= res!900248 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45147 a!3742))))))

(declare-fun b!1355300 () Bool)

(declare-fun res!900244 () Bool)

(assert (=> b!1355300 (=> (not res!900244) (not e!769697))))

(declare-fun arrayNoDuplicates!0 (array!92298 (_ BitVec 32) List!31638) Bool)

(assert (=> b!1355300 (= res!900244 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31635))))

(declare-fun b!1355301 () Bool)

(declare-fun res!900253 () Bool)

(assert (=> b!1355301 (=> (not res!900253) (not e!769697))))

(assert (=> b!1355301 (= res!900253 (not (contains!9347 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355302 () Bool)

(declare-fun lt!598571 () Unit!44532)

(assert (=> b!1355302 (= e!769696 lt!598571)))

(declare-fun lt!598573 () Unit!44532)

(declare-fun lemmaListSubSeqRefl!0 (List!31638) Unit!44532)

(assert (=> b!1355302 (= lt!598573 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!767 (List!31638 List!31638) Bool)

(assert (=> b!1355302 (subseq!767 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92298 List!31638 List!31638 (_ BitVec 32)) Unit!44532)

(declare-fun $colon$colon!782 (List!31638 (_ BitVec 64)) List!31638)

(assert (=> b!1355302 (= lt!598571 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!782 acc!759 (select (arr!44597 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355302 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!900252 () Bool)

(assert (=> start!114116 (=> (not res!900252) (not e!769697))))

(assert (=> start!114116 (= res!900252 (and (bvslt (size!45147 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45147 a!3742))))))

(assert (=> start!114116 e!769697))

(assert (=> start!114116 true))

(declare-fun array_inv!33625 (array!92298) Bool)

(assert (=> start!114116 (array_inv!33625 a!3742)))

(declare-fun b!1355303 () Bool)

(declare-fun res!900251 () Bool)

(assert (=> b!1355303 (=> (not res!900251) (not e!769697))))

(assert (=> b!1355303 (= res!900251 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355304 () Bool)

(declare-fun e!769699 () Bool)

(assert (=> b!1355304 (= e!769699 false)))

(declare-fun lt!598570 () Bool)

(assert (=> b!1355304 (= lt!598570 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355305 () Bool)

(assert (=> b!1355305 (= e!769697 e!769699)))

(declare-fun res!900250 () Bool)

(assert (=> b!1355305 (=> (not res!900250) (not e!769699))))

(declare-fun lt!598569 () Bool)

(assert (=> b!1355305 (= res!900250 (and (not (= from!3120 i!1404)) (not lt!598569) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598572 () Unit!44532)

(assert (=> b!1355305 (= lt!598572 e!769696)))

(declare-fun c!126965 () Bool)

(assert (=> b!1355305 (= c!126965 lt!598569)))

(assert (=> b!1355305 (= lt!598569 (validKeyInArray!0 (select (arr!44597 a!3742) from!3120)))))

(assert (= (and start!114116 res!900252) b!1355297))

(assert (= (and b!1355297 res!900247) b!1355301))

(assert (= (and b!1355301 res!900253) b!1355298))

(assert (= (and b!1355298 res!900245) b!1355300))

(assert (= (and b!1355300 res!900244) b!1355303))

(assert (= (and b!1355303 res!900251) b!1355299))

(assert (= (and b!1355299 res!900248) b!1355296))

(assert (= (and b!1355296 res!900249) b!1355294))

(assert (= (and b!1355294 res!900246) b!1355305))

(assert (= (and b!1355305 c!126965) b!1355302))

(assert (= (and b!1355305 (not c!126965)) b!1355295))

(assert (= (and b!1355305 res!900250) b!1355304))

(declare-fun m!1241509 () Bool)

(assert (=> start!114116 m!1241509))

(declare-fun m!1241511 () Bool)

(assert (=> b!1355296 m!1241511))

(declare-fun m!1241513 () Bool)

(assert (=> b!1355298 m!1241513))

(declare-fun m!1241515 () Bool)

(assert (=> b!1355297 m!1241515))

(declare-fun m!1241517 () Bool)

(assert (=> b!1355305 m!1241517))

(assert (=> b!1355305 m!1241517))

(declare-fun m!1241519 () Bool)

(assert (=> b!1355305 m!1241519))

(declare-fun m!1241521 () Bool)

(assert (=> b!1355302 m!1241521))

(assert (=> b!1355302 m!1241517))

(declare-fun m!1241523 () Bool)

(assert (=> b!1355302 m!1241523))

(declare-fun m!1241525 () Bool)

(assert (=> b!1355302 m!1241525))

(declare-fun m!1241527 () Bool)

(assert (=> b!1355302 m!1241527))

(assert (=> b!1355302 m!1241517))

(assert (=> b!1355302 m!1241523))

(declare-fun m!1241529 () Bool)

(assert (=> b!1355302 m!1241529))

(assert (=> b!1355304 m!1241527))

(declare-fun m!1241531 () Bool)

(assert (=> b!1355300 m!1241531))

(declare-fun m!1241533 () Bool)

(assert (=> b!1355301 m!1241533))

(declare-fun m!1241535 () Bool)

(assert (=> b!1355303 m!1241535))

(push 1)

