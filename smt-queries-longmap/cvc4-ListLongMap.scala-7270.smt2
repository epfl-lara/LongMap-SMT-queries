; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92842 () Bool)

(assert start!92842)

(declare-fun b!1054338 () Bool)

(declare-fun e!598972 () Bool)

(declare-fun e!598975 () Bool)

(assert (=> b!1054338 (= e!598972 e!598975)))

(declare-fun res!703280 () Bool)

(assert (=> b!1054338 (=> (not res!703280) (not e!598975))))

(declare-fun lt!465378 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054338 (= res!703280 (not (= lt!465378 i!1381)))))

(declare-datatypes ((array!66502 0))(
  ( (array!66503 (arr!31983 (Array (_ BitVec 32) (_ BitVec 64))) (size!32519 (_ BitVec 32))) )
))
(declare-fun lt!465376 () array!66502)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66502 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054338 (= lt!465378 (arrayScanForKey!0 lt!465376 k!2747 #b00000000000000000000000000000000))))

(declare-fun e!598976 () Bool)

(declare-fun a!3488 () array!66502)

(declare-fun b!1054339 () Bool)

(declare-fun arrayContainsKey!0 (array!66502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054339 (= e!598976 (arrayContainsKey!0 a!3488 k!2747 lt!465378))))

(declare-fun b!1054340 () Bool)

(declare-fun res!703285 () Bool)

(declare-fun e!598974 () Bool)

(assert (=> b!1054340 (=> (not res!703285) (not e!598974))))

(declare-datatypes ((List!22295 0))(
  ( (Nil!22292) (Cons!22291 (h!23500 (_ BitVec 64)) (t!31602 List!22295)) )
))
(declare-fun arrayNoDuplicates!0 (array!66502 (_ BitVec 32) List!22295) Bool)

(assert (=> b!1054340 (= res!703285 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22292))))

(declare-fun b!1054341 () Bool)

(declare-fun e!598977 () Bool)

(assert (=> b!1054341 (= e!598977 e!598976)))

(declare-fun res!703283 () Bool)

(assert (=> b!1054341 (=> res!703283 e!598976)))

(assert (=> b!1054341 (= res!703283 (bvsle lt!465378 i!1381))))

(declare-fun b!1054342 () Bool)

(declare-fun res!703286 () Bool)

(assert (=> b!1054342 (=> (not res!703286) (not e!598974))))

(assert (=> b!1054342 (= res!703286 (= (select (arr!31983 a!3488) i!1381) k!2747))))

(declare-fun b!1054343 () Bool)

(declare-fun e!598973 () Bool)

(assert (=> b!1054343 (= e!598973 true)))

(assert (=> b!1054343 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22292)))

(declare-datatypes ((Unit!34524 0))(
  ( (Unit!34525) )
))
(declare-fun lt!465377 () Unit!34524)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66502 (_ BitVec 32) (_ BitVec 32)) Unit!34524)

(assert (=> b!1054343 (= lt!465377 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1054344 () Bool)

(declare-fun res!703284 () Bool)

(assert (=> b!1054344 (=> (not res!703284) (not e!598974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054344 (= res!703284 (validKeyInArray!0 k!2747))))

(declare-fun res!703279 () Bool)

(assert (=> start!92842 (=> (not res!703279) (not e!598974))))

(assert (=> start!92842 (= res!703279 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32519 a!3488)) (bvslt (size!32519 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92842 e!598974))

(assert (=> start!92842 true))

(declare-fun array_inv!24763 (array!66502) Bool)

(assert (=> start!92842 (array_inv!24763 a!3488)))

(declare-fun b!1054345 () Bool)

(assert (=> b!1054345 (= e!598975 (not e!598973))))

(declare-fun res!703282 () Bool)

(assert (=> b!1054345 (=> res!703282 e!598973)))

(assert (=> b!1054345 (= res!703282 (bvsle lt!465378 i!1381))))

(assert (=> b!1054345 e!598977))

(declare-fun res!703278 () Bool)

(assert (=> b!1054345 (=> (not res!703278) (not e!598977))))

(assert (=> b!1054345 (= res!703278 (= (select (store (arr!31983 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465378) k!2747))))

(declare-fun b!1054346 () Bool)

(assert (=> b!1054346 (= e!598974 e!598972)))

(declare-fun res!703281 () Bool)

(assert (=> b!1054346 (=> (not res!703281) (not e!598972))))

(assert (=> b!1054346 (= res!703281 (arrayContainsKey!0 lt!465376 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054346 (= lt!465376 (array!66503 (store (arr!31983 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32519 a!3488)))))

(assert (= (and start!92842 res!703279) b!1054340))

(assert (= (and b!1054340 res!703285) b!1054344))

(assert (= (and b!1054344 res!703284) b!1054342))

(assert (= (and b!1054342 res!703286) b!1054346))

(assert (= (and b!1054346 res!703281) b!1054338))

(assert (= (and b!1054338 res!703280) b!1054345))

(assert (= (and b!1054345 res!703278) b!1054341))

(assert (= (and b!1054341 (not res!703283)) b!1054339))

(assert (= (and b!1054345 (not res!703282)) b!1054343))

(declare-fun m!974425 () Bool)

(assert (=> b!1054346 m!974425))

(declare-fun m!974427 () Bool)

(assert (=> b!1054346 m!974427))

(declare-fun m!974429 () Bool)

(assert (=> b!1054340 m!974429))

(assert (=> b!1054345 m!974427))

(declare-fun m!974431 () Bool)

(assert (=> b!1054345 m!974431))

(declare-fun m!974433 () Bool)

(assert (=> b!1054343 m!974433))

(declare-fun m!974435 () Bool)

(assert (=> b!1054343 m!974435))

(declare-fun m!974437 () Bool)

(assert (=> b!1054344 m!974437))

(declare-fun m!974439 () Bool)

(assert (=> b!1054342 m!974439))

(declare-fun m!974441 () Bool)

(assert (=> b!1054339 m!974441))

(declare-fun m!974443 () Bool)

(assert (=> b!1054338 m!974443))

(declare-fun m!974445 () Bool)

(assert (=> start!92842 m!974445))

(push 1)

