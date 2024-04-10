; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92322 () Bool)

(assert start!92322)

(declare-fun b!1049322 () Bool)

(declare-fun res!698451 () Bool)

(declare-fun e!595342 () Bool)

(assert (=> b!1049322 (=> (not res!698451) (not e!595342))))

(declare-datatypes ((array!66123 0))(
  ( (array!66124 (arr!31801 (Array (_ BitVec 32) (_ BitVec 64))) (size!32337 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66123)

(declare-datatypes ((List!22113 0))(
  ( (Nil!22110) (Cons!22109 (h!23318 (_ BitVec 64)) (t!31420 List!22113)) )
))
(declare-fun arrayNoDuplicates!0 (array!66123 (_ BitVec 32) List!22113) Bool)

(assert (=> b!1049322 (= res!698451 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22110))))

(declare-fun lt!463466 () (_ BitVec 32))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun b!1049323 () Bool)

(declare-fun e!595340 () Bool)

(declare-fun arrayContainsKey!0 (array!66123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049323 (= e!595340 (arrayContainsKey!0 a!3488 k!2747 lt!463466))))

(declare-fun b!1049324 () Bool)

(declare-fun res!698455 () Bool)

(declare-fun e!595339 () Bool)

(assert (=> b!1049324 (=> res!698455 e!595339)))

(declare-fun noDuplicate!1491 (List!22113) Bool)

(assert (=> b!1049324 (= res!698455 (not (noDuplicate!1491 Nil!22110)))))

(declare-fun b!1049325 () Bool)

(declare-fun res!698454 () Bool)

(assert (=> b!1049325 (=> (not res!698454) (not e!595342))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049325 (= res!698454 (= (select (arr!31801 a!3488) i!1381) k!2747))))

(declare-fun b!1049326 () Bool)

(declare-fun res!698450 () Bool)

(assert (=> b!1049326 (=> (not res!698450) (not e!595342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049326 (= res!698450 (validKeyInArray!0 k!2747))))

(declare-fun b!1049327 () Bool)

(declare-fun e!595338 () Bool)

(declare-fun e!595337 () Bool)

(assert (=> b!1049327 (= e!595338 e!595337)))

(declare-fun res!698448 () Bool)

(assert (=> b!1049327 (=> (not res!698448) (not e!595337))))

(assert (=> b!1049327 (= res!698448 (not (= lt!463466 i!1381)))))

(declare-fun lt!463463 () array!66123)

(declare-fun arrayScanForKey!0 (array!66123 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049327 (= lt!463466 (arrayScanForKey!0 lt!463463 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049328 () Bool)

(declare-fun e!595341 () Bool)

(assert (=> b!1049328 (= e!595341 e!595340)))

(declare-fun res!698456 () Bool)

(assert (=> b!1049328 (=> res!698456 e!595340)))

(assert (=> b!1049328 (= res!698456 (bvsle lt!463466 i!1381))))

(declare-fun res!698458 () Bool)

(assert (=> start!92322 (=> (not res!698458) (not e!595342))))

(assert (=> start!92322 (= res!698458 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32337 a!3488)) (bvslt (size!32337 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92322 e!595342))

(assert (=> start!92322 true))

(declare-fun array_inv!24581 (array!66123) Bool)

(assert (=> start!92322 (array_inv!24581 a!3488)))

(declare-fun b!1049329 () Bool)

(declare-fun e!595336 () Bool)

(assert (=> b!1049329 (= e!595336 e!595339)))

(declare-fun res!698449 () Bool)

(assert (=> b!1049329 (=> res!698449 e!595339)))

(assert (=> b!1049329 (= res!698449 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32337 a!3488)))))

(assert (=> b!1049329 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34322 0))(
  ( (Unit!34323) )
))
(declare-fun lt!463465 () Unit!34322)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66123 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34322)

(assert (=> b!1049329 (= lt!463465 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463466 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1049329 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22110)))

(declare-fun lt!463464 () Unit!34322)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66123 (_ BitVec 32) (_ BitVec 32)) Unit!34322)

(assert (=> b!1049329 (= lt!463464 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049330 () Bool)

(assert (=> b!1049330 (= e!595342 e!595338)))

(declare-fun res!698459 () Bool)

(assert (=> b!1049330 (=> (not res!698459) (not e!595338))))

(assert (=> b!1049330 (= res!698459 (arrayContainsKey!0 lt!463463 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049330 (= lt!463463 (array!66124 (store (arr!31801 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32337 a!3488)))))

(declare-fun b!1049331 () Bool)

(assert (=> b!1049331 (= e!595339 true)))

(declare-fun lt!463467 () Bool)

(declare-fun contains!6106 (List!22113 (_ BitVec 64)) Bool)

(assert (=> b!1049331 (= lt!463467 (contains!6106 Nil!22110 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049332 () Bool)

(assert (=> b!1049332 (= e!595337 (not e!595336))))

(declare-fun res!698453 () Bool)

(assert (=> b!1049332 (=> res!698453 e!595336)))

(assert (=> b!1049332 (= res!698453 (bvsle lt!463466 i!1381))))

(assert (=> b!1049332 e!595341))

(declare-fun res!698452 () Bool)

(assert (=> b!1049332 (=> (not res!698452) (not e!595341))))

(assert (=> b!1049332 (= res!698452 (= (select (store (arr!31801 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463466) k!2747))))

(declare-fun b!1049333 () Bool)

(declare-fun res!698457 () Bool)

(assert (=> b!1049333 (=> res!698457 e!595339)))

(assert (=> b!1049333 (= res!698457 (contains!6106 Nil!22110 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92322 res!698458) b!1049322))

(assert (= (and b!1049322 res!698451) b!1049326))

(assert (= (and b!1049326 res!698450) b!1049325))

(assert (= (and b!1049325 res!698454) b!1049330))

(assert (= (and b!1049330 res!698459) b!1049327))

(assert (= (and b!1049327 res!698448) b!1049332))

(assert (= (and b!1049332 res!698452) b!1049328))

(assert (= (and b!1049328 (not res!698456)) b!1049323))

(assert (= (and b!1049332 (not res!698453)) b!1049329))

(assert (= (and b!1049329 (not res!698449)) b!1049324))

(assert (= (and b!1049324 (not res!698455)) b!1049333))

(assert (= (and b!1049333 (not res!698457)) b!1049331))

(declare-fun m!970097 () Bool)

(assert (=> b!1049329 m!970097))

(declare-fun m!970099 () Bool)

(assert (=> b!1049329 m!970099))

(declare-fun m!970101 () Bool)

(assert (=> b!1049329 m!970101))

(declare-fun m!970103 () Bool)

(assert (=> b!1049329 m!970103))

(declare-fun m!970105 () Bool)

(assert (=> b!1049327 m!970105))

(declare-fun m!970107 () Bool)

(assert (=> b!1049322 m!970107))

(declare-fun m!970109 () Bool)

(assert (=> b!1049331 m!970109))

(declare-fun m!970111 () Bool)

(assert (=> b!1049324 m!970111))

(declare-fun m!970113 () Bool)

(assert (=> b!1049333 m!970113))

(declare-fun m!970115 () Bool)

(assert (=> start!92322 m!970115))

(declare-fun m!970117 () Bool)

(assert (=> b!1049330 m!970117))

(declare-fun m!970119 () Bool)

(assert (=> b!1049330 m!970119))

(declare-fun m!970121 () Bool)

(assert (=> b!1049323 m!970121))

(declare-fun m!970123 () Bool)

(assert (=> b!1049325 m!970123))

(assert (=> b!1049332 m!970119))

(declare-fun m!970125 () Bool)

(assert (=> b!1049332 m!970125))

(declare-fun m!970127 () Bool)

(assert (=> b!1049326 m!970127))

(push 1)

(assert (not b!1049326))

(assert (not b!1049333))

(assert (not b!1049327))

(assert (not b!1049323))

(assert (not 