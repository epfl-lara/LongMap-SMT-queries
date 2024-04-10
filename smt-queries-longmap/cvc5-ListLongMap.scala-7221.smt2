; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92388 () Bool)

(assert start!92388)

(declare-fun b!1050450 () Bool)

(declare-fun res!699581 () Bool)

(declare-fun e!596111 () Bool)

(assert (=> b!1050450 (=> (not res!699581) (not e!596111))))

(declare-datatypes ((array!66189 0))(
  ( (array!66190 (arr!31834 (Array (_ BitVec 32) (_ BitVec 64))) (size!32370 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66189)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050450 (= res!699581 (= (select (arr!31834 a!3488) i!1381) k!2747))))

(declare-fun b!1050451 () Bool)

(declare-fun e!596109 () Bool)

(declare-fun e!596108 () Bool)

(assert (=> b!1050451 (= e!596109 e!596108)))

(declare-fun res!699579 () Bool)

(assert (=> b!1050451 (=> res!699579 e!596108)))

(declare-fun lt!463962 () (_ BitVec 32))

(assert (=> b!1050451 (= res!699579 (bvsle lt!463962 i!1381))))

(declare-fun b!1050452 () Bool)

(declare-fun e!596107 () Bool)

(declare-fun e!596113 () Bool)

(assert (=> b!1050452 (= e!596107 (not e!596113))))

(declare-fun res!699584 () Bool)

(assert (=> b!1050452 (=> res!699584 e!596113)))

(assert (=> b!1050452 (= res!699584 (bvsle lt!463962 i!1381))))

(assert (=> b!1050452 e!596109))

(declare-fun res!699582 () Bool)

(assert (=> b!1050452 (=> (not res!699582) (not e!596109))))

(assert (=> b!1050452 (= res!699582 (= (select (store (arr!31834 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463962) k!2747))))

(declare-fun res!699578 () Bool)

(assert (=> start!92388 (=> (not res!699578) (not e!596111))))

(assert (=> start!92388 (= res!699578 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32370 a!3488)) (bvslt (size!32370 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92388 e!596111))

(assert (=> start!92388 true))

(declare-fun array_inv!24614 (array!66189) Bool)

(assert (=> start!92388 (array_inv!24614 a!3488)))

(declare-fun b!1050453 () Bool)

(declare-fun e!596110 () Bool)

(assert (=> b!1050453 (= e!596111 e!596110)))

(declare-fun res!699577 () Bool)

(assert (=> b!1050453 (=> (not res!699577) (not e!596110))))

(declare-fun lt!463961 () array!66189)

(declare-fun arrayContainsKey!0 (array!66189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050453 (= res!699577 (arrayContainsKey!0 lt!463961 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050453 (= lt!463961 (array!66190 (store (arr!31834 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32370 a!3488)))))

(declare-fun b!1050454 () Bool)

(declare-fun res!699576 () Bool)

(assert (=> b!1050454 (=> (not res!699576) (not e!596111))))

(declare-datatypes ((List!22146 0))(
  ( (Nil!22143) (Cons!22142 (h!23351 (_ BitVec 64)) (t!31453 List!22146)) )
))
(declare-fun arrayNoDuplicates!0 (array!66189 (_ BitVec 32) List!22146) Bool)

(assert (=> b!1050454 (= res!699576 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22143))))

(declare-fun b!1050455 () Bool)

(assert (=> b!1050455 (= e!596110 e!596107)))

(declare-fun res!699583 () Bool)

(assert (=> b!1050455 (=> (not res!699583) (not e!596107))))

(assert (=> b!1050455 (= res!699583 (not (= lt!463962 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66189 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050455 (= lt!463962 (arrayScanForKey!0 lt!463961 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050456 () Bool)

(declare-fun res!699580 () Bool)

(assert (=> b!1050456 (=> (not res!699580) (not e!596111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050456 (= res!699580 (validKeyInArray!0 k!2747))))

(declare-fun b!1050457 () Bool)

(assert (=> b!1050457 (= e!596108 (arrayContainsKey!0 a!3488 k!2747 lt!463962))))

(declare-fun b!1050458 () Bool)

(assert (=> b!1050458 (= e!596113 true)))

(assert (=> b!1050458 false))

(declare-datatypes ((Unit!34388 0))(
  ( (Unit!34389) )
))
(declare-fun lt!463960 () Unit!34388)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66189 (_ BitVec 64) (_ BitVec 32) List!22146) Unit!34388)

(assert (=> b!1050458 (= lt!463960 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 i!1381 Nil!22143))))

(assert (=> b!1050458 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!463958 () Unit!34388)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66189 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34388)

(assert (=> b!1050458 (= lt!463958 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463962 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1050458 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22143)))

(declare-fun lt!463959 () Unit!34388)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66189 (_ BitVec 32) (_ BitVec 32)) Unit!34388)

(assert (=> b!1050458 (= lt!463959 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!92388 res!699578) b!1050454))

(assert (= (and b!1050454 res!699576) b!1050456))

(assert (= (and b!1050456 res!699580) b!1050450))

(assert (= (and b!1050450 res!699581) b!1050453))

(assert (= (and b!1050453 res!699577) b!1050455))

(assert (= (and b!1050455 res!699583) b!1050452))

(assert (= (and b!1050452 res!699582) b!1050451))

(assert (= (and b!1050451 (not res!699579)) b!1050457))

(assert (= (and b!1050452 (not res!699584)) b!1050458))

(declare-fun m!971129 () Bool)

(assert (=> b!1050450 m!971129))

(declare-fun m!971131 () Bool)

(assert (=> b!1050458 m!971131))

(declare-fun m!971133 () Bool)

(assert (=> b!1050458 m!971133))

(declare-fun m!971135 () Bool)

(assert (=> b!1050458 m!971135))

(declare-fun m!971137 () Bool)

(assert (=> b!1050458 m!971137))

(declare-fun m!971139 () Bool)

(assert (=> b!1050458 m!971139))

(declare-fun m!971141 () Bool)

(assert (=> b!1050455 m!971141))

(declare-fun m!971143 () Bool)

(assert (=> b!1050453 m!971143))

(declare-fun m!971145 () Bool)

(assert (=> b!1050453 m!971145))

(declare-fun m!971147 () Bool)

(assert (=> b!1050457 m!971147))

(declare-fun m!971149 () Bool)

(assert (=> b!1050454 m!971149))

(declare-fun m!971151 () Bool)

(assert (=> start!92388 m!971151))

(assert (=> b!1050452 m!971145))

(declare-fun m!971153 () Bool)

(assert (=> b!1050452 m!971153))

(declare-fun m!971155 () Bool)

(assert (=> b!1050456 m!971155))

(push 1)

(assert (not start!92388))

(assert (not b!1050455))

(assert (not b!1050457))

(assert (not b!1050458))

(assert (not b!1050453))

(assert (not b!1050456))

(assert (not b!1050454))

(check-sat)

