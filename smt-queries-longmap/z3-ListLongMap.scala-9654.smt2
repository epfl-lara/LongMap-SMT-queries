; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114286 () Bool)

(assert start!114286)

(declare-fun b!1355341 () Bool)

(declare-fun res!899675 () Bool)

(declare-fun e!770156 () Bool)

(assert (=> b!1355341 (=> (not res!899675) (not e!770156))))

(declare-datatypes ((List!31651 0))(
  ( (Nil!31648) (Cons!31647 (h!32865 (_ BitVec 64)) (t!46301 List!31651)) )
))
(declare-fun acc!759 () List!31651)

(declare-fun contains!9363 (List!31651 (_ BitVec 64)) Bool)

(assert (=> b!1355341 (= res!899675 (not (contains!9363 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355342 () Bool)

(declare-fun e!770155 () Bool)

(assert (=> b!1355342 (= e!770155 false)))

(declare-fun lt!598580 () Bool)

(declare-fun lt!598579 () List!31651)

(declare-datatypes ((array!92359 0))(
  ( (array!92360 (arr!44623 (Array (_ BitVec 32) (_ BitVec 64))) (size!45174 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92359)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92359 (_ BitVec 32) List!31651) Bool)

(assert (=> b!1355342 (= lt!598580 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598579))))

(declare-fun b!1355343 () Bool)

(declare-fun res!899680 () Bool)

(assert (=> b!1355343 (=> (not res!899680) (not e!770156))))

(assert (=> b!1355343 (= res!899680 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355345 () Bool)

(declare-fun e!770157 () Bool)

(assert (=> b!1355345 (= e!770157 e!770155)))

(declare-fun res!899682 () Bool)

(assert (=> b!1355345 (=> (not res!899682) (not e!770155))))

(assert (=> b!1355345 (= res!899682 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!754 (List!31651 (_ BitVec 64)) List!31651)

(assert (=> b!1355345 (= lt!598579 ($colon$colon!754 acc!759 (select (arr!44623 a!3742) from!3120)))))

(declare-fun b!1355346 () Bool)

(declare-datatypes ((Unit!44390 0))(
  ( (Unit!44391) )
))
(declare-fun e!770154 () Unit!44390)

(declare-fun Unit!44392 () Unit!44390)

(assert (=> b!1355346 (= e!770154 Unit!44392)))

(declare-fun b!1355347 () Bool)

(declare-fun res!899676 () Bool)

(assert (=> b!1355347 (=> (not res!899676) (not e!770156))))

(assert (=> b!1355347 (= res!899676 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31648))))

(declare-fun b!1355348 () Bool)

(declare-fun lt!598582 () Unit!44390)

(assert (=> b!1355348 (= e!770154 lt!598582)))

(declare-fun lt!598584 () Unit!44390)

(declare-fun lemmaListSubSeqRefl!0 (List!31651) Unit!44390)

(assert (=> b!1355348 (= lt!598584 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!740 (List!31651 List!31651) Bool)

(assert (=> b!1355348 (subseq!740 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92359 List!31651 List!31651 (_ BitVec 32)) Unit!44390)

(assert (=> b!1355348 (= lt!598582 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!754 acc!759 (select (arr!44623 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355348 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355349 () Bool)

(declare-fun res!899674 () Bool)

(assert (=> b!1355349 (=> (not res!899674) (not e!770156))))

(assert (=> b!1355349 (= res!899674 (not (contains!9363 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355350 () Bool)

(declare-fun res!899677 () Bool)

(assert (=> b!1355350 (=> (not res!899677) (not e!770155))))

(assert (=> b!1355350 (= res!899677 (not (contains!9363 lt!598579 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355351 () Bool)

(declare-fun res!899678 () Bool)

(assert (=> b!1355351 (=> (not res!899678) (not e!770156))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355351 (= res!899678 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355352 () Bool)

(declare-fun res!899679 () Bool)

(assert (=> b!1355352 (=> (not res!899679) (not e!770155))))

(declare-fun noDuplicate!2194 (List!31651) Bool)

(assert (=> b!1355352 (= res!899679 (noDuplicate!2194 lt!598579))))

(declare-fun b!1355353 () Bool)

(assert (=> b!1355353 (= e!770156 e!770157)))

(declare-fun res!899673 () Bool)

(assert (=> b!1355353 (=> (not res!899673) (not e!770157))))

(declare-fun lt!598583 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355353 (= res!899673 (and (not (= from!3120 i!1404)) lt!598583))))

(declare-fun lt!598581 () Unit!44390)

(assert (=> b!1355353 (= lt!598581 e!770154)))

(declare-fun c!127282 () Bool)

(assert (=> b!1355353 (= c!127282 lt!598583)))

(assert (=> b!1355353 (= lt!598583 (validKeyInArray!0 (select (arr!44623 a!3742) from!3120)))))

(declare-fun b!1355354 () Bool)

(declare-fun res!899684 () Bool)

(assert (=> b!1355354 (=> (not res!899684) (not e!770156))))

(assert (=> b!1355354 (= res!899684 (noDuplicate!2194 acc!759))))

(declare-fun res!899685 () Bool)

(assert (=> start!114286 (=> (not res!899685) (not e!770156))))

(assert (=> start!114286 (= res!899685 (and (bvslt (size!45174 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45174 a!3742))))))

(assert (=> start!114286 e!770156))

(assert (=> start!114286 true))

(declare-fun array_inv!33904 (array!92359) Bool)

(assert (=> start!114286 (array_inv!33904 a!3742)))

(declare-fun b!1355344 () Bool)

(declare-fun res!899683 () Bool)

(assert (=> b!1355344 (=> (not res!899683) (not e!770156))))

(assert (=> b!1355344 (= res!899683 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45174 a!3742)))))

(declare-fun b!1355355 () Bool)

(declare-fun res!899672 () Bool)

(assert (=> b!1355355 (=> (not res!899672) (not e!770155))))

(assert (=> b!1355355 (= res!899672 (not (contains!9363 lt!598579 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355356 () Bool)

(declare-fun res!899681 () Bool)

(assert (=> b!1355356 (=> (not res!899681) (not e!770156))))

(assert (=> b!1355356 (= res!899681 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45174 a!3742))))))

(assert (= (and start!114286 res!899685) b!1355354))

(assert (= (and b!1355354 res!899684) b!1355349))

(assert (= (and b!1355349 res!899674) b!1355341))

(assert (= (and b!1355341 res!899675) b!1355347))

(assert (= (and b!1355347 res!899676) b!1355343))

(assert (= (and b!1355343 res!899680) b!1355356))

(assert (= (and b!1355356 res!899681) b!1355351))

(assert (= (and b!1355351 res!899678) b!1355344))

(assert (= (and b!1355344 res!899683) b!1355353))

(assert (= (and b!1355353 c!127282) b!1355348))

(assert (= (and b!1355353 (not c!127282)) b!1355346))

(assert (= (and b!1355353 res!899673) b!1355345))

(assert (= (and b!1355345 res!899682) b!1355352))

(assert (= (and b!1355352 res!899679) b!1355355))

(assert (= (and b!1355355 res!899672) b!1355350))

(assert (= (and b!1355350 res!899677) b!1355342))

(declare-fun m!1242109 () Bool)

(assert (=> b!1355351 m!1242109))

(declare-fun m!1242111 () Bool)

(assert (=> b!1355345 m!1242111))

(assert (=> b!1355345 m!1242111))

(declare-fun m!1242113 () Bool)

(assert (=> b!1355345 m!1242113))

(declare-fun m!1242115 () Bool)

(assert (=> b!1355343 m!1242115))

(declare-fun m!1242117 () Bool)

(assert (=> b!1355355 m!1242117))

(declare-fun m!1242119 () Bool)

(assert (=> b!1355352 m!1242119))

(assert (=> b!1355353 m!1242111))

(assert (=> b!1355353 m!1242111))

(declare-fun m!1242121 () Bool)

(assert (=> b!1355353 m!1242121))

(declare-fun m!1242123 () Bool)

(assert (=> b!1355342 m!1242123))

(declare-fun m!1242125 () Bool)

(assert (=> b!1355349 m!1242125))

(declare-fun m!1242127 () Bool)

(assert (=> b!1355347 m!1242127))

(declare-fun m!1242129 () Bool)

(assert (=> start!114286 m!1242129))

(declare-fun m!1242131 () Bool)

(assert (=> b!1355354 m!1242131))

(declare-fun m!1242133 () Bool)

(assert (=> b!1355350 m!1242133))

(declare-fun m!1242135 () Bool)

(assert (=> b!1355348 m!1242135))

(assert (=> b!1355348 m!1242111))

(assert (=> b!1355348 m!1242113))

(declare-fun m!1242137 () Bool)

(assert (=> b!1355348 m!1242137))

(declare-fun m!1242139 () Bool)

(assert (=> b!1355348 m!1242139))

(assert (=> b!1355348 m!1242111))

(assert (=> b!1355348 m!1242113))

(declare-fun m!1242141 () Bool)

(assert (=> b!1355348 m!1242141))

(declare-fun m!1242143 () Bool)

(assert (=> b!1355341 m!1242143))

(check-sat (not b!1355349) (not b!1355351) (not b!1355345) (not b!1355355) (not start!114286) (not b!1355352) (not b!1355347) (not b!1355354) (not b!1355353) (not b!1355348) (not b!1355343) (not b!1355342) (not b!1355350) (not b!1355341))
(check-sat)
