; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93294 () Bool)

(assert start!93294)

(declare-fun b!1057126 () Bool)

(declare-fun res!705136 () Bool)

(declare-fun e!600960 () Bool)

(assert (=> b!1057126 (=> (not res!705136) (not e!600960))))

(declare-datatypes ((array!66634 0))(
  ( (array!66635 (arr!32038 (Array (_ BitVec 32) (_ BitVec 64))) (size!32575 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66634)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057126 (= res!705136 (= (select (arr!32038 a!3488) i!1381) k0!2747))))

(declare-fun b!1057127 () Bool)

(declare-fun e!600964 () Bool)

(assert (=> b!1057127 (= e!600960 e!600964)))

(declare-fun res!705135 () Bool)

(assert (=> b!1057127 (=> (not res!705135) (not e!600964))))

(declare-fun lt!466441 () array!66634)

(declare-fun arrayContainsKey!0 (array!66634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057127 (= res!705135 (arrayContainsKey!0 lt!466441 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057127 (= lt!466441 (array!66635 (store (arr!32038 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32575 a!3488)))))

(declare-fun res!705140 () Bool)

(assert (=> start!93294 (=> (not res!705140) (not e!600960))))

(assert (=> start!93294 (= res!705140 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32575 a!3488)) (bvslt (size!32575 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93294 e!600960))

(assert (=> start!93294 true))

(declare-fun array_inv!24820 (array!66634) Bool)

(assert (=> start!93294 (array_inv!24820 a!3488)))

(declare-fun b!1057128 () Bool)

(declare-fun e!600963 () Bool)

(assert (=> b!1057128 (= e!600964 e!600963)))

(declare-fun res!705137 () Bool)

(assert (=> b!1057128 (=> (not res!705137) (not e!600963))))

(declare-fun lt!466442 () (_ BitVec 32))

(assert (=> b!1057128 (= res!705137 (not (= lt!466442 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66634 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057128 (= lt!466442 (arrayScanForKey!0 lt!466441 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057129 () Bool)

(declare-fun e!600958 () Bool)

(assert (=> b!1057129 (= e!600963 (not e!600958))))

(declare-fun res!705142 () Bool)

(assert (=> b!1057129 (=> res!705142 e!600958)))

(assert (=> b!1057129 (= res!705142 (bvsle lt!466442 i!1381))))

(declare-fun e!600962 () Bool)

(assert (=> b!1057129 e!600962))

(declare-fun res!705141 () Bool)

(assert (=> b!1057129 (=> (not res!705141) (not e!600962))))

(assert (=> b!1057129 (= res!705141 (= (select (store (arr!32038 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466442) k0!2747))))

(declare-fun b!1057130 () Bool)

(declare-fun res!705139 () Bool)

(assert (=> b!1057130 (=> (not res!705139) (not e!600960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057130 (= res!705139 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057131 () Bool)

(declare-fun res!705138 () Bool)

(assert (=> b!1057131 (=> (not res!705138) (not e!600960))))

(declare-datatypes ((List!22320 0))(
  ( (Nil!22317) (Cons!22316 (h!23534 (_ BitVec 64)) (t!31619 List!22320)) )
))
(declare-fun arrayNoDuplicates!0 (array!66634 (_ BitVec 32) List!22320) Bool)

(assert (=> b!1057131 (= res!705138 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22317))))

(declare-fun b!1057132 () Bool)

(declare-fun e!600961 () Bool)

(assert (=> b!1057132 (= e!600962 e!600961)))

(declare-fun res!705143 () Bool)

(assert (=> b!1057132 (=> res!705143 e!600961)))

(assert (=> b!1057132 (= res!705143 (bvsle lt!466442 i!1381))))

(declare-fun b!1057133 () Bool)

(assert (=> b!1057133 (= e!600958 true)))

(assert (=> b!1057133 false))

(declare-datatypes ((Unit!34603 0))(
  ( (Unit!34604) )
))
(declare-fun lt!466438 () Unit!34603)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66634 (_ BitVec 64) (_ BitVec 32) List!22320) Unit!34603)

(assert (=> b!1057133 (= lt!466438 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22317))))

(assert (=> b!1057133 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!466439 () Unit!34603)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66634 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34603)

(assert (=> b!1057133 (= lt!466439 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!466442 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1057133 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22317)))

(declare-fun lt!466440 () Unit!34603)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66634 (_ BitVec 32) (_ BitVec 32)) Unit!34603)

(assert (=> b!1057133 (= lt!466440 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1057134 () Bool)

(assert (=> b!1057134 (= e!600961 (arrayContainsKey!0 a!3488 k0!2747 lt!466442))))

(assert (= (and start!93294 res!705140) b!1057131))

(assert (= (and b!1057131 res!705138) b!1057130))

(assert (= (and b!1057130 res!705139) b!1057126))

(assert (= (and b!1057126 res!705136) b!1057127))

(assert (= (and b!1057127 res!705135) b!1057128))

(assert (= (and b!1057128 res!705137) b!1057129))

(assert (= (and b!1057129 res!705141) b!1057132))

(assert (= (and b!1057132 (not res!705143)) b!1057134))

(assert (= (and b!1057129 (not res!705142)) b!1057133))

(declare-fun m!977453 () Bool)

(assert (=> start!93294 m!977453))

(declare-fun m!977455 () Bool)

(assert (=> b!1057126 m!977455))

(declare-fun m!977457 () Bool)

(assert (=> b!1057134 m!977457))

(declare-fun m!977459 () Bool)

(assert (=> b!1057131 m!977459))

(declare-fun m!977461 () Bool)

(assert (=> b!1057133 m!977461))

(declare-fun m!977463 () Bool)

(assert (=> b!1057133 m!977463))

(declare-fun m!977465 () Bool)

(assert (=> b!1057133 m!977465))

(declare-fun m!977467 () Bool)

(assert (=> b!1057133 m!977467))

(declare-fun m!977469 () Bool)

(assert (=> b!1057133 m!977469))

(declare-fun m!977471 () Bool)

(assert (=> b!1057130 m!977471))

(declare-fun m!977473 () Bool)

(assert (=> b!1057129 m!977473))

(declare-fun m!977475 () Bool)

(assert (=> b!1057129 m!977475))

(declare-fun m!977477 () Bool)

(assert (=> b!1057128 m!977477))

(declare-fun m!977479 () Bool)

(assert (=> b!1057127 m!977479))

(assert (=> b!1057127 m!977473))

(check-sat (not b!1057130) (not b!1057134) (not b!1057133) (not b!1057128) (not b!1057127) (not b!1057131) (not start!93294))
(check-sat)
