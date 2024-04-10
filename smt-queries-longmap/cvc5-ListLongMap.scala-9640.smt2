; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113978 () Bool)

(assert start!113978)

(declare-fun b!1352270 () Bool)

(declare-fun e!768753 () Bool)

(declare-fun e!768754 () Bool)

(assert (=> b!1352270 (= e!768753 e!768754)))

(declare-fun res!897634 () Bool)

(assert (=> b!1352270 (=> (not res!897634) (not e!768754))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1352270 (= res!897634 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44325 0))(
  ( (Unit!44326) )
))
(declare-fun lt!597487 () Unit!44325)

(declare-fun e!768751 () Unit!44325)

(assert (=> b!1352270 (= lt!597487 e!768751)))

(declare-fun c!126758 () Bool)

(declare-datatypes ((array!92160 0))(
  ( (array!92161 (arr!44528 (Array (_ BitVec 32) (_ BitVec 64))) (size!45078 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92160)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352270 (= c!126758 (validKeyInArray!0 (select (arr!44528 a!3742) from!3120)))))

(declare-fun b!1352271 () Bool)

(declare-fun res!897635 () Bool)

(assert (=> b!1352271 (=> (not res!897635) (not e!768753))))

(declare-datatypes ((List!31569 0))(
  ( (Nil!31566) (Cons!31565 (h!32774 (_ BitVec 64)) (t!46227 List!31569)) )
))
(declare-fun arrayNoDuplicates!0 (array!92160 (_ BitVec 32) List!31569) Bool)

(assert (=> b!1352271 (= res!897635 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31566))))

(declare-fun b!1352272 () Bool)

(declare-fun res!897643 () Bool)

(assert (=> b!1352272 (=> (not res!897643) (not e!768753))))

(declare-fun acc!759 () List!31569)

(assert (=> b!1352272 (= res!897643 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352273 () Bool)

(declare-fun res!897639 () Bool)

(assert (=> b!1352273 (=> (not res!897639) (not e!768753))))

(declare-fun noDuplicate!2135 (List!31569) Bool)

(assert (=> b!1352273 (= res!897639 (noDuplicate!2135 acc!759))))

(declare-fun res!897642 () Bool)

(assert (=> start!113978 (=> (not res!897642) (not e!768753))))

(assert (=> start!113978 (= res!897642 (and (bvslt (size!45078 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45078 a!3742))))))

(assert (=> start!113978 e!768753))

(assert (=> start!113978 true))

(declare-fun array_inv!33556 (array!92160) Bool)

(assert (=> start!113978 (array_inv!33556 a!3742)))

(declare-fun b!1352274 () Bool)

(declare-fun res!897637 () Bool)

(assert (=> b!1352274 (=> (not res!897637) (not e!768753))))

(declare-fun contains!9278 (List!31569 (_ BitVec 64)) Bool)

(assert (=> b!1352274 (= res!897637 (not (contains!9278 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352275 () Bool)

(declare-fun res!897638 () Bool)

(assert (=> b!1352275 (=> (not res!897638) (not e!768753))))

(assert (=> b!1352275 (= res!897638 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45078 a!3742)))))

(declare-fun b!1352276 () Bool)

(declare-fun res!897641 () Bool)

(assert (=> b!1352276 (=> (not res!897641) (not e!768753))))

(assert (=> b!1352276 (= res!897641 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45078 a!3742))))))

(declare-fun b!1352277 () Bool)

(declare-fun lt!597488 () Unit!44325)

(assert (=> b!1352277 (= e!768751 lt!597488)))

(declare-fun lt!597489 () Unit!44325)

(declare-fun lemmaListSubSeqRefl!0 (List!31569) Unit!44325)

(assert (=> b!1352277 (= lt!597489 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!698 (List!31569 List!31569) Bool)

(assert (=> b!1352277 (subseq!698 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92160 List!31569 List!31569 (_ BitVec 32)) Unit!44325)

(declare-fun $colon$colon!713 (List!31569 (_ BitVec 64)) List!31569)

(assert (=> b!1352277 (= lt!597488 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!713 acc!759 (select (arr!44528 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1352277 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1352278 () Bool)

(declare-fun res!897636 () Bool)

(assert (=> b!1352278 (=> (not res!897636) (not e!768753))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1352278 (= res!897636 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352279 () Bool)

(assert (=> b!1352279 (= e!768754 false)))

(declare-fun lt!597490 () Bool)

(assert (=> b!1352279 (= lt!597490 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1352280 () Bool)

(declare-fun res!897640 () Bool)

(assert (=> b!1352280 (=> (not res!897640) (not e!768753))))

(assert (=> b!1352280 (= res!897640 (not (contains!9278 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352281 () Bool)

(declare-fun Unit!44327 () Unit!44325)

(assert (=> b!1352281 (= e!768751 Unit!44327)))

(assert (= (and start!113978 res!897642) b!1352273))

(assert (= (and b!1352273 res!897639) b!1352280))

(assert (= (and b!1352280 res!897640) b!1352274))

(assert (= (and b!1352274 res!897637) b!1352271))

(assert (= (and b!1352271 res!897635) b!1352272))

(assert (= (and b!1352272 res!897643) b!1352276))

(assert (= (and b!1352276 res!897641) b!1352278))

(assert (= (and b!1352278 res!897636) b!1352275))

(assert (= (and b!1352275 res!897638) b!1352270))

(assert (= (and b!1352270 c!126758) b!1352277))

(assert (= (and b!1352270 (not c!126758)) b!1352281))

(assert (= (and b!1352270 res!897634) b!1352279))

(declare-fun m!1239121 () Bool)

(assert (=> b!1352271 m!1239121))

(declare-fun m!1239123 () Bool)

(assert (=> b!1352273 m!1239123))

(declare-fun m!1239125 () Bool)

(assert (=> b!1352270 m!1239125))

(assert (=> b!1352270 m!1239125))

(declare-fun m!1239127 () Bool)

(assert (=> b!1352270 m!1239127))

(declare-fun m!1239129 () Bool)

(assert (=> b!1352277 m!1239129))

(assert (=> b!1352277 m!1239125))

(declare-fun m!1239131 () Bool)

(assert (=> b!1352277 m!1239131))

(declare-fun m!1239133 () Bool)

(assert (=> b!1352277 m!1239133))

(declare-fun m!1239135 () Bool)

(assert (=> b!1352277 m!1239135))

(assert (=> b!1352277 m!1239125))

(assert (=> b!1352277 m!1239131))

(declare-fun m!1239137 () Bool)

(assert (=> b!1352277 m!1239137))

(declare-fun m!1239139 () Bool)

(assert (=> b!1352280 m!1239139))

(declare-fun m!1239141 () Bool)

(assert (=> b!1352272 m!1239141))

(assert (=> b!1352279 m!1239135))

(declare-fun m!1239143 () Bool)

(assert (=> start!113978 m!1239143))

(declare-fun m!1239145 () Bool)

(assert (=> b!1352278 m!1239145))

(declare-fun m!1239147 () Bool)

(assert (=> b!1352274 m!1239147))

(push 1)

