; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114002 () Bool)

(assert start!114002)

(declare-fun b!1352704 () Bool)

(declare-fun res!898000 () Bool)

(declare-fun e!768897 () Bool)

(assert (=> b!1352704 (=> (not res!898000) (not e!768897))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92184 0))(
  ( (array!92185 (arr!44540 (Array (_ BitVec 32) (_ BitVec 64))) (size!45090 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92184)

(assert (=> b!1352704 (= res!898000 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45090 a!3742))))))

(declare-fun b!1352705 () Bool)

(declare-fun res!898005 () Bool)

(assert (=> b!1352705 (=> (not res!898005) (not e!768897))))

(declare-datatypes ((List!31581 0))(
  ( (Nil!31578) (Cons!31577 (h!32786 (_ BitVec 64)) (t!46239 List!31581)) )
))
(declare-fun acc!759 () List!31581)

(declare-fun contains!9290 (List!31581 (_ BitVec 64)) Bool)

(assert (=> b!1352705 (= res!898005 (not (contains!9290 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352706 () Bool)

(declare-fun res!898002 () Bool)

(assert (=> b!1352706 (=> (not res!898002) (not e!768897))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1352706 (= res!898002 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45090 a!3742)))))

(declare-fun b!1352707 () Bool)

(declare-datatypes ((Unit!44361 0))(
  ( (Unit!44362) )
))
(declare-fun e!768896 () Unit!44361)

(declare-fun Unit!44363 () Unit!44361)

(assert (=> b!1352707 (= e!768896 Unit!44363)))

(declare-fun b!1352708 () Bool)

(declare-fun res!897998 () Bool)

(assert (=> b!1352708 (=> (not res!897998) (not e!768897))))

(declare-fun arrayNoDuplicates!0 (array!92184 (_ BitVec 32) List!31581) Bool)

(assert (=> b!1352708 (= res!897998 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31578))))

(declare-fun b!1352709 () Bool)

(declare-fun res!898003 () Bool)

(assert (=> b!1352709 (=> (not res!898003) (not e!768897))))

(assert (=> b!1352709 (= res!898003 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352710 () Bool)

(declare-fun res!897999 () Bool)

(assert (=> b!1352710 (=> (not res!897999) (not e!768897))))

(declare-fun noDuplicate!2147 (List!31581) Bool)

(assert (=> b!1352710 (= res!897999 (noDuplicate!2147 acc!759))))

(declare-fun res!898006 () Bool)

(assert (=> start!114002 (=> (not res!898006) (not e!768897))))

(assert (=> start!114002 (= res!898006 (and (bvslt (size!45090 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45090 a!3742))))))

(assert (=> start!114002 e!768897))

(assert (=> start!114002 true))

(declare-fun array_inv!33568 (array!92184) Bool)

(assert (=> start!114002 (array_inv!33568 a!3742)))

(declare-fun b!1352711 () Bool)

(declare-fun res!897996 () Bool)

(assert (=> b!1352711 (=> (not res!897996) (not e!768897))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352711 (= res!897996 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352712 () Bool)

(declare-fun res!898001 () Bool)

(assert (=> b!1352712 (=> (not res!898001) (not e!768897))))

(assert (=> b!1352712 (= res!898001 (not (contains!9290 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352713 () Bool)

(declare-fun e!768895 () Bool)

(assert (=> b!1352713 (= e!768897 e!768895)))

(declare-fun res!898004 () Bool)

(assert (=> b!1352713 (=> (not res!898004) (not e!768895))))

(assert (=> b!1352713 (= res!898004 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597632 () Unit!44361)

(assert (=> b!1352713 (= lt!597632 e!768896)))

(declare-fun c!126794 () Bool)

(assert (=> b!1352713 (= c!126794 (validKeyInArray!0 (select (arr!44540 a!3742) from!3120)))))

(declare-fun b!1352714 () Bool)

(declare-fun res!897997 () Bool)

(assert (=> b!1352714 (=> (not res!897997) (not e!768895))))

(assert (=> b!1352714 (= res!897997 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352715 () Bool)

(assert (=> b!1352715 (= e!768895 (not (bvsle from!3120 (size!45090 a!3742))))))

(assert (=> b!1352715 (arrayNoDuplicates!0 (array!92185 (store (arr!44540 a!3742) i!1404 l!3587) (size!45090 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!597634 () Unit!44361)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92184 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31581) Unit!44361)

(assert (=> b!1352715 (= lt!597634 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352716 () Bool)

(declare-fun lt!597631 () Unit!44361)

(assert (=> b!1352716 (= e!768896 lt!597631)))

(declare-fun lt!597633 () Unit!44361)

(declare-fun lemmaListSubSeqRefl!0 (List!31581) Unit!44361)

(assert (=> b!1352716 (= lt!597633 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!710 (List!31581 List!31581) Bool)

(assert (=> b!1352716 (subseq!710 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92184 List!31581 List!31581 (_ BitVec 32)) Unit!44361)

(declare-fun $colon$colon!725 (List!31581 (_ BitVec 64)) List!31581)

(assert (=> b!1352716 (= lt!597631 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!725 acc!759 (select (arr!44540 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352716 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114002 res!898006) b!1352710))

(assert (= (and b!1352710 res!897999) b!1352705))

(assert (= (and b!1352705 res!898005) b!1352712))

(assert (= (and b!1352712 res!898001) b!1352708))

(assert (= (and b!1352708 res!897998) b!1352709))

(assert (= (and b!1352709 res!898003) b!1352704))

(assert (= (and b!1352704 res!898000) b!1352711))

(assert (= (and b!1352711 res!897996) b!1352706))

(assert (= (and b!1352706 res!898002) b!1352713))

(assert (= (and b!1352713 c!126794) b!1352716))

(assert (= (and b!1352713 (not c!126794)) b!1352707))

(assert (= (and b!1352713 res!898004) b!1352714))

(assert (= (and b!1352714 res!897997) b!1352715))

(declare-fun m!1239457 () Bool)

(assert (=> b!1352712 m!1239457))

(declare-fun m!1239459 () Bool)

(assert (=> b!1352708 m!1239459))

(declare-fun m!1239461 () Bool)

(assert (=> b!1352705 m!1239461))

(declare-fun m!1239463 () Bool)

(assert (=> b!1352713 m!1239463))

(assert (=> b!1352713 m!1239463))

(declare-fun m!1239465 () Bool)

(assert (=> b!1352713 m!1239465))

(declare-fun m!1239467 () Bool)

(assert (=> b!1352714 m!1239467))

(declare-fun m!1239469 () Bool)

(assert (=> start!114002 m!1239469))

(declare-fun m!1239471 () Bool)

(assert (=> b!1352711 m!1239471))

(declare-fun m!1239473 () Bool)

(assert (=> b!1352715 m!1239473))

(declare-fun m!1239475 () Bool)

(assert (=> b!1352715 m!1239475))

(declare-fun m!1239477 () Bool)

(assert (=> b!1352715 m!1239477))

(declare-fun m!1239479 () Bool)

(assert (=> b!1352710 m!1239479))

(declare-fun m!1239481 () Bool)

(assert (=> b!1352716 m!1239481))

(assert (=> b!1352716 m!1239463))

(declare-fun m!1239483 () Bool)

(assert (=> b!1352716 m!1239483))

(declare-fun m!1239485 () Bool)

(assert (=> b!1352716 m!1239485))

(assert (=> b!1352716 m!1239467))

(assert (=> b!1352716 m!1239463))

(assert (=> b!1352716 m!1239483))

(declare-fun m!1239487 () Bool)

(assert (=> b!1352716 m!1239487))

(declare-fun m!1239489 () Bool)

(assert (=> b!1352709 m!1239489))

(push 1)

(assert (not b!1352705))

(assert (not b!1352715))

(assert (not b!1352712))

(assert (not b!1352716))

(assert (not start!114002))

(assert (not b!1352711))

(assert (not b!1352714))

(assert (not b!1352708))

(assert (not b!1352710))

(assert (not b!1352709))

(assert (not b!1352713))

(check-sat)

(pop 1)

(push 1)

(check-sat)

