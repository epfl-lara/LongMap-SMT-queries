; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27390 () Bool)

(assert start!27390)

(declare-fun b!283487 () Bool)

(declare-fun e!179864 () Bool)

(declare-fun e!179865 () Bool)

(assert (=> b!283487 (= e!179864 e!179865)))

(declare-fun res!146414 () Bool)

(assert (=> b!283487 (=> (not res!146414) (not e!179865))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!283487 (= res!146414 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!14145 0))(
  ( (array!14146 (arr!6713 (Array (_ BitVec 32) (_ BitVec 64))) (size!7065 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14145)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lt!140122 () array!14145)

(assert (=> b!283487 (= lt!140122 (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325)))))

(declare-fun b!283488 () Bool)

(declare-fun e!179863 () Bool)

(assert (=> b!283488 (= e!179863 e!179864)))

(declare-fun res!146408 () Bool)

(assert (=> b!283488 (=> (not res!146408) (not e!179864))))

(declare-datatypes ((SeekEntryResult!1871 0))(
  ( (MissingZero!1871 (index!9654 (_ BitVec 32))) (Found!1871 (index!9655 (_ BitVec 32))) (Intermediate!1871 (undefined!2683 Bool) (index!9656 (_ BitVec 32)) (x!27861 (_ BitVec 32))) (Undefined!1871) (MissingVacant!1871 (index!9657 (_ BitVec 32))) )
))
(declare-fun lt!140121 () SeekEntryResult!1871)

(assert (=> b!283488 (= res!146408 (or (= lt!140121 (MissingZero!1871 i!1267)) (= lt!140121 (MissingVacant!1871 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14145 (_ BitVec 32)) SeekEntryResult!1871)

(assert (=> b!283488 (= lt!140121 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!283489 () Bool)

(declare-fun res!146413 () Bool)

(assert (=> b!283489 (=> (not res!146413) (not e!179863))))

(declare-datatypes ((List!4521 0))(
  ( (Nil!4518) (Cons!4517 (h!5187 (_ BitVec 64)) (t!9603 List!4521)) )
))
(declare-fun arrayNoDuplicates!0 (array!14145 (_ BitVec 32) List!4521) Bool)

(assert (=> b!283489 (= res!146413 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4518))))

(declare-fun b!283490 () Bool)

(declare-fun res!146411 () Bool)

(assert (=> b!283490 (=> (not res!146411) (not e!179865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!283490 (= res!146411 (validKeyInArray!0 (select (arr!6713 a!3325) startIndex!26)))))

(declare-fun res!146409 () Bool)

(assert (=> start!27390 (=> (not res!146409) (not e!179863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27390 (= res!146409 (validMask!0 mask!3868))))

(assert (=> start!27390 e!179863))

(declare-fun array_inv!4676 (array!14145) Bool)

(assert (=> start!27390 (array_inv!4676 a!3325)))

(assert (=> start!27390 true))

(declare-fun b!283491 () Bool)

(declare-fun res!146407 () Bool)

(assert (=> b!283491 (=> (not res!146407) (not e!179863))))

(declare-fun arrayContainsKey!0 (array!14145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!283491 (= res!146407 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun e!179867 () Bool)

(declare-fun b!283492 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14145 (_ BitVec 32)) Bool)

(assert (=> b!283492 (= e!179867 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140122 mask!3868))))

(declare-fun b!283493 () Bool)

(assert (=> b!283493 (= e!179865 (not e!179867))))

(declare-fun res!146412 () Bool)

(assert (=> b!283493 (=> res!146412 e!179867)))

(assert (=> b!283493 (= res!146412 (bvslt startIndex!26 (bvsub (size!7065 a!3325) #b00000000000000000000000000000001)))))

(assert (=> b!283493 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!9026 0))(
  ( (Unit!9027) )
))
(declare-fun lt!140124 () Unit!9026)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9026)

(assert (=> b!283493 (= lt!140124 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!283493 (= (seekEntryOrOpen!0 (select (arr!6713 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) lt!140122 mask!3868))))

(declare-fun lt!140123 () Unit!9026)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9026)

(assert (=> b!283493 (= lt!140123 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!283493 (arrayNoDuplicates!0 lt!140122 #b00000000000000000000000000000000 Nil!4518)))

(declare-fun lt!140125 () Unit!9026)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14145 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4521) Unit!9026)

(assert (=> b!283493 (= lt!140125 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4518))))

(declare-fun b!283494 () Bool)

(declare-fun res!146410 () Bool)

(assert (=> b!283494 (=> (not res!146410) (not e!179864))))

(assert (=> b!283494 (= res!146410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!283495 () Bool)

(declare-fun res!146415 () Bool)

(assert (=> b!283495 (=> (not res!146415) (not e!179863))))

(assert (=> b!283495 (= res!146415 (and (= (size!7065 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7065 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7065 a!3325))))))

(declare-fun b!283496 () Bool)

(declare-fun res!146406 () Bool)

(assert (=> b!283496 (=> (not res!146406) (not e!179863))))

(assert (=> b!283496 (= res!146406 (validKeyInArray!0 k!2581))))

(assert (= (and start!27390 res!146409) b!283495))

(assert (= (and b!283495 res!146415) b!283496))

(assert (= (and b!283496 res!146406) b!283489))

(assert (= (and b!283489 res!146413) b!283491))

(assert (= (and b!283491 res!146407) b!283488))

(assert (= (and b!283488 res!146408) b!283494))

(assert (= (and b!283494 res!146410) b!283487))

(assert (= (and b!283487 res!146414) b!283490))

(assert (= (and b!283490 res!146411) b!283493))

(assert (= (and b!283493 (not res!146412)) b!283492))

(declare-fun m!298389 () Bool)

(assert (=> start!27390 m!298389))

(declare-fun m!298391 () Bool)

(assert (=> start!27390 m!298391))

(declare-fun m!298393 () Bool)

(assert (=> b!283489 m!298393))

(declare-fun m!298395 () Bool)

(assert (=> b!283488 m!298395))

(declare-fun m!298397 () Bool)

(assert (=> b!283494 m!298397))

(declare-fun m!298399 () Bool)

(assert (=> b!283490 m!298399))

(assert (=> b!283490 m!298399))

(declare-fun m!298401 () Bool)

(assert (=> b!283490 m!298401))

(declare-fun m!298403 () Bool)

(assert (=> b!283487 m!298403))

(declare-fun m!298405 () Bool)

(assert (=> b!283491 m!298405))

(declare-fun m!298407 () Bool)

(assert (=> b!283493 m!298407))

(declare-fun m!298409 () Bool)

(assert (=> b!283493 m!298409))

(assert (=> b!283493 m!298403))

(declare-fun m!298411 () Bool)

(assert (=> b!283493 m!298411))

(assert (=> b!283493 m!298399))

(declare-fun m!298413 () Bool)

(assert (=> b!283493 m!298413))

(declare-fun m!298415 () Bool)

(assert (=> b!283493 m!298415))

(assert (=> b!283493 m!298399))

(declare-fun m!298417 () Bool)

(assert (=> b!283493 m!298417))

(declare-fun m!298419 () Bool)

(assert (=> b!283493 m!298419))

(assert (=> b!283493 m!298409))

(declare-fun m!298421 () Bool)

(assert (=> b!283493 m!298421))

(declare-fun m!298423 () Bool)

(assert (=> b!283496 m!298423))

(declare-fun m!298425 () Bool)

(assert (=> b!283492 m!298425))

(push 1)

(assert (not start!27390))

(assert (not b!283492))

(assert (not b!283488))

(assert (not b!283490))

(assert (not b!283496))

(assert (not b!283489))

(assert (not b!283493))

(assert (not b!283491))

(assert (not b!283494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!65383 () Bool)

(assert (=> d!65383 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27390 d!65383))

(declare-fun d!65395 () Bool)

(assert (=> d!65395 (= (array_inv!4676 a!3325) (bvsge (size!7065 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27390 d!65395))

(declare-fun d!65397 () Bool)

(declare-fun res!146503 () Bool)

(declare-fun e!179932 () Bool)

(assert (=> d!65397 (=> res!146503 e!179932)))

(assert (=> d!65397 (= res!146503 (= (select (arr!6713 a!3325) #b00000000000000000000000000000000) k!2581))))

(assert (=> d!65397 (= (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000) e!179932)))

(declare-fun b!283598 () Bool)

(declare-fun e!179933 () Bool)

(assert (=> b!283598 (= e!179932 e!179933)))

(declare-fun res!146504 () Bool)

(assert (=> b!283598 (=> (not res!146504) (not e!179933))))

(assert (=> b!283598 (= res!146504 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7065 a!3325)))))

(declare-fun b!283599 () Bool)

(assert (=> b!283599 (= e!179933 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65397 (not res!146503)) b!283598))

(assert (= (and b!283598 res!146504) b!283599))

(declare-fun m!298533 () Bool)

(assert (=> d!65397 m!298533))

(declare-fun m!298535 () Bool)

(assert (=> b!283599 m!298535))

(assert (=> b!283491 d!65397))

(declare-fun d!65399 () Bool)

(assert (=> d!65399 (= (validKeyInArray!0 k!2581) (and (not (= k!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283496 d!65399))

(declare-fun d!65401 () Bool)

(assert (=> d!65401 (= (validKeyInArray!0 (select (arr!6713 a!3325) startIndex!26)) (and (not (= (select (arr!6713 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6713 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283490 d!65401))

(declare-fun b!283622 () Bool)

(declare-fun e!179953 () Bool)

(declare-fun contains!1994 (List!4521 (_ BitVec 64)) Bool)

(assert (=> b!283622 (= e!179953 (contains!1994 Nil!4518 (select (arr!6713 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25499 () Bool)

(declare-fun call!25502 () Bool)

(declare-fun c!46105 () Bool)

(assert (=> bm!25499 (= call!25502 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46105 (Cons!4517 (select (arr!6713 a!3325) #b00000000000000000000000000000000) Nil!4518) Nil!4518)))))

(declare-fun b!283624 () Bool)

(declare-fun e!179954 () Bool)

(assert (=> b!283624 (= e!179954 call!25502)))

(declare-fun b!283625 () Bool)

(declare-fun e!179951 () Bool)

(assert (=> b!283625 (= e!179951 e!179954)))

(assert (=> b!283625 (= c!46105 (validKeyInArray!0 (select (arr!6713 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283626 () Bool)

(assert (=> b!283626 (= e!179954 call!25502)))

(declare-fun d!65403 () Bool)

(declare-fun res!146519 () Bool)

(declare-fun e!179952 () Bool)

(assert (=> d!65403 (=> res!146519 e!179952)))

(assert (=> d!65403 (= res!146519 (bvsge #b00000000000000000000000000000000 (size!7065 a!3325)))))

(assert (=> d!65403 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4518) e!179952)))

(declare-fun b!283623 () Bool)

(assert (=> b!283623 (= e!179952 e!179951)))

(declare-fun res!146518 () Bool)

(assert (=> b!283623 (=> (not res!146518) (not e!179951))))

(assert (=> b!283623 (= res!146518 (not e!179953))))

(declare-fun res!146517 () Bool)

(assert (=> b!283623 (=> (not res!146517) (not e!179953))))

(assert (=> b!283623 (= res!146517 (validKeyInArray!0 (select (arr!6713 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65403 (not res!146519)) b!283623))

(assert (= (and b!283623 res!146517) b!283622))

(assert (= (and b!283623 res!146518) b!283625))

(assert (= (and b!283625 c!46105) b!283624))

(assert (= (and b!283625 (not c!46105)) b!283626))

(assert (= (or b!283624 b!283626) bm!25499))

(assert (=> b!283622 m!298533))

(assert (=> b!283622 m!298533))

(declare-fun m!298549 () Bool)

(assert (=> b!283622 m!298549))

(assert (=> bm!25499 m!298533))

(declare-fun m!298551 () Bool)

(assert (=> bm!25499 m!298551))

(assert (=> b!283625 m!298533))

(assert (=> b!283625 m!298533))

(declare-fun m!298553 () Bool)

(assert (=> b!283625 m!298553))

(assert (=> b!283623 m!298533))

(assert (=> b!283623 m!298533))

(assert (=> b!283623 m!298553))

(assert (=> b!283489 d!65403))

(declare-fun b!283653 () Bool)

(declare-fun e!179970 () Bool)

(declare-fun call!25505 () Bool)

(assert (=> b!283653 (= e!179970 call!25505)))

(declare-fun b!283654 () Bool)

(declare-fun e!179971 () Bool)

(declare-fun e!179972 () Bool)

(assert (=> b!283654 (= e!179971 e!179972)))

(declare-fun c!46117 () Bool)

(assert (=> b!283654 (= c!46117 (validKeyInArray!0 (select (arr!6713 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!283655 () Bool)

(assert (=> b!283655 (= e!179972 e!179970)))

(declare-fun lt!140194 () (_ BitVec 64))

(assert (=> b!283655 (= lt!140194 (select (arr!6713 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!140192 () Unit!9026)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14145 (_ BitVec 64) (_ BitVec 32)) Unit!9026)

(assert (=> b!283655 (= lt!140192 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140194 #b00000000000000000000000000000000))))

(assert (=> b!283655 (arrayContainsKey!0 a!3325 lt!140194 #b00000000000000000000000000000000)))

(declare-fun lt!140193 () Unit!9026)

(assert (=> b!283655 (= lt!140193 lt!140192)))

(declare-fun res!146524 () Bool)

(assert (=> b!283655 (= res!146524 (= (seekEntryOrOpen!0 (select (arr!6713 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1871 #b00000000000000000000000000000000)))))

(assert (=> b!283655 (=> (not res!146524) (not e!179970))))

(declare-fun b!283656 () Bool)

(assert (=> b!283656 (= e!179972 call!25505)))

(declare-fun d!65407 () Bool)

(declare-fun res!146525 () Bool)

(assert (=> d!65407 (=> res!146525 e!179971)))

(assert (=> d!65407 (= res!146525 (bvsge #b00000000000000000000000000000000 (size!7065 a!3325)))))

(assert (=> d!65407 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!179971)))

(declare-fun bm!25502 () Bool)

(assert (=> bm!25502 (= call!25505 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(assert (= (and d!65407 (not res!146525)) b!283654))

(assert (= (and b!283654 c!46117) b!283655))

(assert (= (and b!283654 (not c!46117)) b!283656))

(assert (= (and b!283655 res!146524) b!283653))

(assert (= (or b!283653 b!283656) bm!25502))

(assert (=> b!283654 m!298533))

(assert (=> b!283654 m!298533))

(assert (=> b!283654 m!298553))

(assert (=> b!283655 m!298533))

(declare-fun m!298569 () Bool)

(assert (=> b!283655 m!298569))

(declare-fun m!298571 () Bool)

(assert (=> b!283655 m!298571))

(assert (=> b!283655 m!298533))

(declare-fun m!298573 () Bool)

(assert (=> b!283655 m!298573))

(declare-fun m!298575 () Bool)

(assert (=> bm!25502 m!298575))

(assert (=> b!283494 d!65407))

(declare-fun b!283707 () Bool)

(declare-fun e!180005 () SeekEntryResult!1871)

(declare-fun e!180004 () SeekEntryResult!1871)

(assert (=> b!283707 (= e!180005 e!180004)))

(declare-fun lt!140223 () (_ BitVec 64))

(declare-fun lt!140224 () SeekEntryResult!1871)

(assert (=> b!283707 (= lt!140223 (select (arr!6713 a!3325) (index!9656 lt!140224)))))

(declare-fun c!46139 () Bool)

(assert (=> b!283707 (= c!46139 (= lt!140223 k!2581))))

(declare-fun b!283708 () Bool)

(assert (=> b!283708 (= e!180004 (Found!1871 (index!9656 lt!140224)))))

(declare-fun d!65411 () Bool)

(declare-fun lt!140222 () SeekEntryResult!1871)

(assert (=> d!65411 (and (or (is-Undefined!1871 lt!140222) (not (is-Found!1871 lt!140222)) (and (bvsge (index!9655 lt!140222) #b00000000000000000000000000000000) (bvslt (index!9655 lt!140222) (size!7065 a!3325)))) (or (is-Undefined!1871 lt!140222) (is-Found!1871 lt!140222) (not (is-MissingZero!1871 lt!140222)) (and (bvsge (index!9654 lt!140222) #b00000000000000000000000000000000) (bvslt (index!9654 lt!140222) (size!7065 a!3325)))) (or (is-Undefined!1871 lt!140222) (is-Found!1871 lt!140222) (is-MissingZero!1871 lt!140222) (not (is-MissingVacant!1871 lt!140222)) (and (bvsge (index!9657 lt!140222) #b00000000000000000000000000000000) (bvslt (index!9657 lt!140222) (size!7065 a!3325)))) (or (is-Undefined!1871 lt!140222) (ite (is-Found!1871 lt!140222) (= (select (arr!6713 a!3325) (index!9655 lt!140222)) k!2581) (ite (is-MissingZero!1871 lt!140222) (= (select (arr!6713 a!3325) (index!9654 lt!140222)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1871 lt!140222) (= (select (arr!6713 a!3325) (index!9657 lt!140222)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65411 (= lt!140222 e!180005)))

(declare-fun c!46137 () Bool)

(assert (=> d!65411 (= c!46137 (and (is-Intermediate!1871 lt!140224) (undefined!2683 lt!140224)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14145 (_ BitVec 32)) SeekEntryResult!1871)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65411 (= lt!140224 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 a!3325 mask!3868))))

(assert (=> d!65411 (validMask!0 mask!3868)))

(assert (=> d!65411 (= (seekEntryOrOpen!0 k!2581 a!3325 mask!3868) lt!140222)))

(declare-fun b!283709 () Bool)

(declare-fun e!180006 () SeekEntryResult!1871)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14145 (_ BitVec 32)) SeekEntryResult!1871)

(assert (=> b!283709 (= e!180006 (seekKeyOrZeroReturnVacant!0 (x!27861 lt!140224) (index!9656 lt!140224) (index!9656 lt!140224) k!2581 a!3325 mask!3868))))

(declare-fun b!283710 () Bool)

(assert (=> b!283710 (= e!180006 (MissingZero!1871 (index!9656 lt!140224)))))

(declare-fun b!283711 () Bool)

(assert (=> b!283711 (= e!180005 Undefined!1871)))

(declare-fun b!283712 () Bool)

(declare-fun c!46138 () Bool)

(assert (=> b!283712 (= c!46138 (= lt!140223 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283712 (= e!180004 e!180006)))

(assert (= (and d!65411 c!46137) b!283711))

(assert (= (and d!65411 (not c!46137)) b!283707))

(assert (= (and b!283707 c!46139) b!283708))

(assert (= (and b!283707 (not c!46139)) b!283712))

(assert (= (and b!283712 c!46138) b!283710))

(assert (= (and b!283712 (not c!46138)) b!283709))

(declare-fun m!298625 () Bool)

(assert (=> b!283707 m!298625))

(declare-fun m!298627 () Bool)

(assert (=> d!65411 m!298627))

(assert (=> d!65411 m!298627))

(declare-fun m!298629 () Bool)

(assert (=> d!65411 m!298629))

(declare-fun m!298631 () Bool)

(assert (=> d!65411 m!298631))

(declare-fun m!298633 () Bool)

(assert (=> d!65411 m!298633))

(assert (=> d!65411 m!298389))

(declare-fun m!298635 () Bool)

(assert (=> d!65411 m!298635))

(declare-fun m!298637 () Bool)

(assert (=> b!283709 m!298637))

(assert (=> b!283488 d!65411))

(declare-fun d!65425 () Bool)

(declare-fun e!180027 () Bool)

(assert (=> d!65425 e!180027))

(declare-fun res!146551 () Bool)

(assert (=> d!65425 (=> (not res!146551) (not e!180027))))

(assert (=> d!65425 (= res!146551 (and (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7065 a!3325)) (and (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7065 a!3325)))) (or (bvslt i!1267 #b00000000000000000000000000000000) (bvsge i!1267 (size!7065 a!3325)) (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7065 a!3325)))) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7065 a!3325))))))

(declare-fun lt!140236 () Unit!9026)

(declare-fun choose!83 (array!14145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9026)

(assert (=> d!65425 (= lt!140236 (choose!83 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> d!65425 (validMask!0 mask!3868)))

(assert (=> d!65425 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868) lt!140236)))

(declare-fun b!283740 () Bool)

(assert (=> b!283740 (= e!180027 (= (seekEntryOrOpen!0 (select (arr!6713 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325)) mask!3868)))))

(assert (= (and d!65425 res!146551) b!283740))

(declare-fun m!298669 () Bool)

(assert (=> d!65425 m!298669))

(assert (=> d!65425 m!298389))

(assert (=> b!283740 m!298409))

(declare-fun m!298671 () Bool)

(assert (=> b!283740 m!298671))

(assert (=> b!283740 m!298403))

(assert (=> b!283740 m!298409))

(assert (=> b!283740 m!298399))

(assert (=> b!283740 m!298399))

(assert (=> b!283740 m!298417))

(assert (=> b!283493 d!65425))

(declare-fun b!283741 () Bool)

(declare-fun e!180029 () SeekEntryResult!1871)

(declare-fun e!180028 () SeekEntryResult!1871)

(assert (=> b!283741 (= e!180029 e!180028)))

(declare-fun lt!140238 () (_ BitVec 64))

(declare-fun lt!140239 () SeekEntryResult!1871)

(assert (=> b!283741 (= lt!140238 (select (arr!6713 a!3325) (index!9656 lt!140239)))))

(declare-fun c!46149 () Bool)

(assert (=> b!283741 (= c!46149 (= lt!140238 (select (arr!6713 a!3325) startIndex!26)))))

(declare-fun b!283742 () Bool)

(assert (=> b!283742 (= e!180028 (Found!1871 (index!9656 lt!140239)))))

(declare-fun d!65433 () Bool)

(declare-fun lt!140237 () SeekEntryResult!1871)

(assert (=> d!65433 (and (or (is-Undefined!1871 lt!140237) (not (is-Found!1871 lt!140237)) (and (bvsge (index!9655 lt!140237) #b00000000000000000000000000000000) (bvslt (index!9655 lt!140237) (size!7065 a!3325)))) (or (is-Undefined!1871 lt!140237) (is-Found!1871 lt!140237) (not (is-MissingZero!1871 lt!140237)) (and (bvsge (index!9654 lt!140237) #b00000000000000000000000000000000) (bvslt (index!9654 lt!140237) (size!7065 a!3325)))) (or (is-Undefined!1871 lt!140237) (is-Found!1871 lt!140237) (is-MissingZero!1871 lt!140237) (not (is-MissingVacant!1871 lt!140237)) (and (bvsge (index!9657 lt!140237) #b00000000000000000000000000000000) (bvslt (index!9657 lt!140237) (size!7065 a!3325)))) (or (is-Undefined!1871 lt!140237) (ite (is-Found!1871 lt!140237) (= (select (arr!6713 a!3325) (index!9655 lt!140237)) (select (arr!6713 a!3325) startIndex!26)) (ite (is-MissingZero!1871 lt!140237) (= (select (arr!6713 a!3325) (index!9654 lt!140237)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1871 lt!140237) (= (select (arr!6713 a!3325) (index!9657 lt!140237)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65433 (= lt!140237 e!180029)))

(declare-fun c!46147 () Bool)

(assert (=> d!65433 (= c!46147 (and (is-Intermediate!1871 lt!140239) (undefined!2683 lt!140239)))))

(assert (=> d!65433 (= lt!140239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6713 a!3325) startIndex!26) mask!3868) (select (arr!6713 a!3325) startIndex!26) a!3325 mask!3868))))

(assert (=> d!65433 (validMask!0 mask!3868)))

(assert (=> d!65433 (= (seekEntryOrOpen!0 (select (arr!6713 a!3325) startIndex!26) a!3325 mask!3868) lt!140237)))

(declare-fun b!283743 () Bool)

(declare-fun e!180030 () SeekEntryResult!1871)

(assert (=> b!283743 (= e!180030 (seekKeyOrZeroReturnVacant!0 (x!27861 lt!140239) (index!9656 lt!140239) (index!9656 lt!140239) (select (arr!6713 a!3325) startIndex!26) a!3325 mask!3868))))

(declare-fun b!283744 () Bool)

(assert (=> b!283744 (= e!180030 (MissingZero!1871 (index!9656 lt!140239)))))

(declare-fun b!283745 () Bool)

(assert (=> b!283745 (= e!180029 Undefined!1871)))

(declare-fun b!283746 () Bool)

(declare-fun c!46148 () Bool)

(assert (=> b!283746 (= c!46148 (= lt!140238 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283746 (= e!180028 e!180030)))

(assert (= (and d!65433 c!46147) b!283745))

(assert (= (and d!65433 (not c!46147)) b!283741))

(assert (= (and b!283741 c!46149) b!283742))

(assert (= (and b!283741 (not c!46149)) b!283746))

(assert (= (and b!283746 c!46148) b!283744))

(assert (= (and b!283746 (not c!46148)) b!283743))

(declare-fun m!298673 () Bool)

(assert (=> b!283741 m!298673))

(assert (=> d!65433 m!298399))

(declare-fun m!298675 () Bool)

(assert (=> d!65433 m!298675))

(assert (=> d!65433 m!298675))

(assert (=> d!65433 m!298399))

(declare-fun m!298677 () Bool)

(assert (=> d!65433 m!298677))

(declare-fun m!298679 () Bool)

(assert (=> d!65433 m!298679))

(declare-fun m!298681 () Bool)

(assert (=> d!65433 m!298681))

(assert (=> d!65433 m!298389))

(declare-fun m!298683 () Bool)

(assert (=> d!65433 m!298683))

(assert (=> b!283743 m!298399))

(declare-fun m!298685 () Bool)

(assert (=> b!283743 m!298685))

(assert (=> b!283493 d!65433))

(declare-fun d!65435 () Bool)

(assert (=> d!65435 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!140245 () Unit!9026)

(declare-fun choose!38 (array!14145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9026)

(assert (=> d!65435 (= lt!140245 (choose!38 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> d!65435 (validMask!0 mask!3868)))

(assert (=> d!65435 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26) lt!140245)))

(declare-fun bs!10072 () Bool)

(assert (= bs!10072 d!65435))

(assert (=> bs!10072 m!298411))

(declare-fun m!298691 () Bool)

(assert (=> bs!10072 m!298691))

(assert (=> bs!10072 m!298389))

(assert (=> b!283493 d!65435))

(declare-fun b!283750 () Bool)

(declare-fun e!180034 () Bool)

(declare-fun call!25511 () Bool)

(assert (=> b!283750 (= e!180034 call!25511)))

(declare-fun b!283751 () Bool)

(declare-fun e!180035 () Bool)

(declare-fun e!180036 () Bool)

(assert (=> b!283751 (= e!180035 e!180036)))

(declare-fun c!46150 () Bool)

(assert (=> b!283751 (= c!46150 (validKeyInArray!0 (select (arr!6713 a!3325) startIndex!26)))))

(declare-fun b!283752 () Bool)

(assert (=> b!283752 (= e!180036 e!180034)))

(declare-fun lt!140248 () (_ BitVec 64))

(assert (=> b!283752 (= lt!140248 (select (arr!6713 a!3325) startIndex!26))))

(declare-fun lt!140246 () Unit!9026)

(assert (=> b!283752 (= lt!140246 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140248 startIndex!26))))

(assert (=> b!283752 (arrayContainsKey!0 a!3325 lt!140248 #b00000000000000000000000000000000)))

(declare-fun lt!140247 () Unit!9026)

(assert (=> b!283752 (= lt!140247 lt!140246)))

(declare-fun res!146555 () Bool)

(assert (=> b!283752 (= res!146555 (= (seekEntryOrOpen!0 (select (arr!6713 a!3325) startIndex!26) a!3325 mask!3868) (Found!1871 startIndex!26)))))

(assert (=> b!283752 (=> (not res!146555) (not e!180034))))

(declare-fun b!283753 () Bool)

(assert (=> b!283753 (= e!180036 call!25511)))

(declare-fun d!65439 () Bool)

(declare-fun res!146556 () Bool)

(assert (=> d!65439 (=> res!146556 e!180035)))

(assert (=> d!65439 (= res!146556 (bvsge startIndex!26 (size!7065 a!3325)))))

(assert (=> d!65439 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868) e!180035)))

(declare-fun bm!25508 () Bool)

(assert (=> bm!25508 (= call!25511 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) a!3325 mask!3868))))

(assert (= (and d!65439 (not res!146556)) b!283751))

(assert (= (and b!283751 c!46150) b!283752))

(assert (= (and b!283751 (not c!46150)) b!283753))

(assert (= (and b!283752 res!146555) b!283750))

(assert (= (or b!283750 b!283753) bm!25508))

(assert (=> b!283751 m!298399))

(assert (=> b!283751 m!298399))

(assert (=> b!283751 m!298401))

(assert (=> b!283752 m!298399))

(declare-fun m!298693 () Bool)

(assert (=> b!283752 m!298693))

(declare-fun m!298695 () Bool)

(assert (=> b!283752 m!298695))

(assert (=> b!283752 m!298399))

(assert (=> b!283752 m!298417))

(declare-fun m!298697 () Bool)

(assert (=> bm!25508 m!298697))

(assert (=> b!283493 d!65439))

(declare-fun b!283754 () Bool)

(declare-fun e!180039 () Bool)

(assert (=> b!283754 (= e!180039 (contains!1994 Nil!4518 (select (arr!6713 lt!140122) #b00000000000000000000000000000000)))))

(declare-fun bm!25509 () Bool)

(declare-fun call!25512 () Bool)

(declare-fun c!46151 () Bool)

(assert (=> bm!25509 (= call!25512 (arrayNoDuplicates!0 lt!140122 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46151 (Cons!4517 (select (arr!6713 lt!140122) #b00000000000000000000000000000000) Nil!4518) Nil!4518)))))

(declare-fun b!283756 () Bool)

(declare-fun e!180040 () Bool)

(assert (=> b!283756 (= e!180040 call!25512)))

(declare-fun b!283757 () Bool)

(declare-fun e!180037 () Bool)

(assert (=> b!283757 (= e!180037 e!180040)))

(assert (=> b!283757 (= c!46151 (validKeyInArray!0 (select (arr!6713 lt!140122) #b00000000000000000000000000000000)))))

(declare-fun b!283758 () Bool)

(assert (=> b!283758 (= e!180040 call!25512)))

(declare-fun d!65441 () Bool)

(declare-fun res!146559 () Bool)

(declare-fun e!180038 () Bool)

(assert (=> d!65441 (=> res!146559 e!180038)))

(assert (=> d!65441 (= res!146559 (bvsge #b00000000000000000000000000000000 (size!7065 lt!140122)))))

(assert (=> d!65441 (= (arrayNoDuplicates!0 lt!140122 #b00000000000000000000000000000000 Nil!4518) e!180038)))

(declare-fun b!283755 () Bool)

(assert (=> b!283755 (= e!180038 e!180037)))

(declare-fun res!146558 () Bool)

(assert (=> b!283755 (=> (not res!146558) (not e!180037))))

(assert (=> b!283755 (= res!146558 (not e!180039))))

(declare-fun res!146557 () Bool)

(assert (=> b!283755 (=> (not res!146557) (not e!180039))))

(assert (=> b!283755 (= res!146557 (validKeyInArray!0 (select (arr!6713 lt!140122) #b00000000000000000000000000000000)))))

(assert (= (and d!65441 (not res!146559)) b!283755))

(assert (= (and b!283755 res!146557) b!283754))

(assert (= (and b!283755 res!146558) b!283757))

(assert (= (and b!283757 c!46151) b!283756))

(assert (= (and b!283757 (not c!46151)) b!283758))

(assert (= (or b!283756 b!283758) bm!25509))

(declare-fun m!298699 () Bool)

(assert (=> b!283754 m!298699))

(assert (=> b!283754 m!298699))

(declare-fun m!298701 () Bool)

(assert (=> b!283754 m!298701))

(assert (=> bm!25509 m!298699))

(declare-fun m!298703 () Bool)

(assert (=> bm!25509 m!298703))

(assert (=> b!283757 m!298699))

(assert (=> b!283757 m!298699))

(declare-fun m!298705 () Bool)

(assert (=> b!283757 m!298705))

(assert (=> b!283755 m!298699))

(assert (=> b!283755 m!298699))

(assert (=> b!283755 m!298705))

(assert (=> b!283493 d!65441))

(declare-fun b!283759 () Bool)

(declare-fun e!180042 () SeekEntryResult!1871)

(declare-fun e!180041 () SeekEntryResult!1871)

(assert (=> b!283759 (= e!180042 e!180041)))

(declare-fun lt!140250 () (_ BitVec 64))

(declare-fun lt!140251 () SeekEntryResult!1871)

(assert (=> b!283759 (= lt!140250 (select (arr!6713 lt!140122) (index!9656 lt!140251)))))

(declare-fun c!46154 () Bool)

(assert (=> b!283759 (= c!46154 (= lt!140250 (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26)))))

(declare-fun b!283760 () Bool)

(assert (=> b!283760 (= e!180041 (Found!1871 (index!9656 lt!140251)))))

(declare-fun lt!140249 () SeekEntryResult!1871)

(declare-fun d!65443 () Bool)

(assert (=> d!65443 (and (or (is-Undefined!1871 lt!140249) (not (is-Found!1871 lt!140249)) (and (bvsge (index!9655 lt!140249) #b00000000000000000000000000000000) (bvslt (index!9655 lt!140249) (size!7065 lt!140122)))) (or (is-Undefined!1871 lt!140249) (is-Found!1871 lt!140249) (not (is-MissingZero!1871 lt!140249)) (and (bvsge (index!9654 lt!140249) #b00000000000000000000000000000000) (bvslt (index!9654 lt!140249) (size!7065 lt!140122)))) (or (is-Undefined!1871 lt!140249) (is-Found!1871 lt!140249) (is-MissingZero!1871 lt!140249) (not (is-MissingVacant!1871 lt!140249)) (and (bvsge (index!9657 lt!140249) #b00000000000000000000000000000000) (bvslt (index!9657 lt!140249) (size!7065 lt!140122)))) (or (is-Undefined!1871 lt!140249) (ite (is-Found!1871 lt!140249) (= (select (arr!6713 lt!140122) (index!9655 lt!140249)) (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26)) (ite (is-MissingZero!1871 lt!140249) (= (select (arr!6713 lt!140122) (index!9654 lt!140249)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1871 lt!140249) (= (select (arr!6713 lt!140122) (index!9657 lt!140249)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65443 (= lt!140249 e!180042)))

(declare-fun c!46152 () Bool)

(assert (=> d!65443 (= c!46152 (and (is-Intermediate!1871 lt!140251) (undefined!2683 lt!140251)))))

(assert (=> d!65443 (= lt!140251 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) mask!3868) (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) lt!140122 mask!3868))))

(assert (=> d!65443 (validMask!0 mask!3868)))

(assert (=> d!65443 (= (seekEntryOrOpen!0 (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) lt!140122 mask!3868) lt!140249)))

(declare-fun e!180043 () SeekEntryResult!1871)

(declare-fun b!283761 () Bool)

(assert (=> b!283761 (= e!180043 (seekKeyOrZeroReturnVacant!0 (x!27861 lt!140251) (index!9656 lt!140251) (index!9656 lt!140251) (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) lt!140122 mask!3868))))

(declare-fun b!283762 () Bool)

(assert (=> b!283762 (= e!180043 (MissingZero!1871 (index!9656 lt!140251)))))

(declare-fun b!283763 () Bool)

(assert (=> b!283763 (= e!180042 Undefined!1871)))

(declare-fun b!283764 () Bool)

(declare-fun c!46153 () Bool)

(assert (=> b!283764 (= c!46153 (= lt!140250 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283764 (= e!180041 e!180043)))

(assert (= (and d!65443 c!46152) b!283763))

(assert (= (and d!65443 (not c!46152)) b!283759))

(assert (= (and b!283759 c!46154) b!283760))

(assert (= (and b!283759 (not c!46154)) b!283764))

(assert (= (and b!283764 c!46153) b!283762))

(assert (= (and b!283764 (not c!46153)) b!283761))

(declare-fun m!298707 () Bool)

(assert (=> b!283759 m!298707))

(assert (=> d!65443 m!298409))

(declare-fun m!298709 () Bool)

(assert (=> d!65443 m!298709))

(assert (=> d!65443 m!298709))

(assert (=> d!65443 m!298409))

(declare-fun m!298711 () Bool)

(assert (=> d!65443 m!298711))

(declare-fun m!298713 () Bool)

(assert (=> d!65443 m!298713))

(declare-fun m!298715 () Bool)

(assert (=> d!65443 m!298715))

(assert (=> d!65443 m!298389))

(declare-fun m!298717 () Bool)

(assert (=> d!65443 m!298717))

(assert (=> b!283761 m!298409))

(declare-fun m!298719 () Bool)

(assert (=> b!283761 m!298719))

(assert (=> b!283493 d!65443))

(declare-fun d!65445 () Bool)

(declare-fun e!180049 () Bool)

(assert (=> d!65445 e!180049))

(declare-fun res!146564 () Bool)

(assert (=> d!65445 (=> (not res!146564) (not e!180049))))

(assert (=> d!65445 (= res!146564 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7065 a!3325))))))

(declare-fun lt!140260 () Unit!9026)

(declare-fun choose!41 (array!14145 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4521) Unit!9026)

(assert (=> d!65445 (= lt!140260 (choose!41 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4518))))

(assert (=> d!65445 (bvslt (size!7065 a!3325) #b01111111111111111111111111111111)))

(assert (=> d!65445 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4518) lt!140260)))

(declare-fun b!283771 () Bool)

(assert (=> b!283771 (= e!180049 (arrayNoDuplicates!0 (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325)) #b00000000000000000000000000000000 Nil!4518))))

(assert (= (and d!65445 res!146564) b!283771))

(declare-fun m!298727 () Bool)

(assert (=> d!65445 m!298727))

(assert (=> b!283771 m!298403))

(declare-fun m!298731 () Bool)

(assert (=> b!283771 m!298731))

(assert (=> b!283493 d!65445))

(declare-fun b!283772 () Bool)

(declare-fun e!180050 () Bool)

(declare-fun call!25514 () Bool)

(assert (=> b!283772 (= e!180050 call!25514)))

(declare-fun b!283773 () Bool)

(declare-fun e!180051 () Bool)

(declare-fun e!180052 () Bool)

(assert (=> b!283773 (= e!180051 e!180052)))

(declare-fun c!46156 () Bool)

(assert (=> b!283773 (= c!46156 (validKeyInArray!0 (select (arr!6713 lt!140122) startIndex!26)))))

(declare-fun b!283774 () Bool)

(assert (=> b!283774 (= e!180052 e!180050)))

(declare-fun lt!140263 () (_ BitVec 64))

(assert (=> b!283774 (= lt!140263 (select (arr!6713 lt!140122) startIndex!26))))

(declare-fun lt!140261 () Unit!9026)

(assert (=> b!283774 (= lt!140261 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140122 lt!140263 startIndex!26))))

(assert (=> b!283774 (arrayContainsKey!0 lt!140122 lt!140263 #b00000000000000000000000000000000)))

(declare-fun lt!140262 () Unit!9026)

(assert (=> b!283774 (= lt!140262 lt!140261)))

(declare-fun res!146565 () Bool)

(assert (=> b!283774 (= res!146565 (= (seekEntryOrOpen!0 (select (arr!6713 lt!140122) startIndex!26) lt!140122 mask!3868) (Found!1871 startIndex!26)))))

(assert (=> b!283774 (=> (not res!146565) (not e!180050))))

(declare-fun b!283775 () Bool)

(assert (=> b!283775 (= e!180052 call!25514)))

(declare-fun d!65451 () Bool)

(declare-fun res!146566 () Bool)

(assert (=> d!65451 (=> res!146566 e!180051)))

(assert (=> d!65451 (= res!146566 (bvsge startIndex!26 (size!7065 lt!140122)))))

(assert (=> d!65451 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140122 mask!3868) e!180051)))

(declare-fun bm!25511 () Bool)

(assert (=> bm!25511 (= call!25514 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!140122 mask!3868))))

(assert (= (and d!65451 (not res!146566)) b!283773))

(assert (= (and b!283773 c!46156) b!283774))

(assert (= (and b!283773 (not c!46156)) b!283775))

(assert (= (and b!283774 res!146565) b!283772))

(assert (= (or b!283772 b!283775) bm!25511))

(declare-fun m!298733 () Bool)

(assert (=> b!283773 m!298733))

(assert (=> b!283773 m!298733))

(declare-fun m!298735 () Bool)

(assert (=> b!283773 m!298735))

(assert (=> b!283774 m!298733))

(declare-fun m!298737 () Bool)

(assert (=> b!283774 m!298737))

(declare-fun m!298739 () Bool)

(assert (=> b!283774 m!298739))

(assert (=> b!283774 m!298733))

(declare-fun m!298741 () Bool)

(assert (=> b!283774 m!298741))

(declare-fun m!298743 () Bool)

(assert (=> bm!25511 m!298743))

(assert (=> b!283492 d!65451))

(push 1)

(assert (not b!283771))

(assert (not b!283654))

(assert (not b!283757))

(assert (not b!283751))

(assert (not b!283761))

(assert (not b!283599))

(assert (not b!283709))

(assert (not bm!25499))

(assert (not b!283752))

(assert (not b!283754))

(assert (not d!65445))

(assert (not b!283773))

(assert (not bm!25511))

(assert (not b!283774))

(assert (not d!65425))

(assert (not bm!25508))

(assert (not b!283655))

(assert (not d!65435))

(assert (not d!65411))

(assert (not b!283622))

(assert (not d!65443))

(assert (not d!65433))

(assert (not b!283755))

(assert (not b!283740))

(assert (not bm!25502))

(assert (not b!283625))

(assert (not bm!25509))

(assert (not b!283743))

(assert (not b!283623))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!140291 () SeekEntryResult!1871)

(declare-fun d!65467 () Bool)

(assert (=> d!65467 (and (or (is-Undefined!1871 lt!140291) (not (is-Found!1871 lt!140291)) (and (bvsge (index!9655 lt!140291) #b00000000000000000000000000000000) (bvslt (index!9655 lt!140291) (size!7065 lt!140122)))) (or (is-Undefined!1871 lt!140291) (is-Found!1871 lt!140291) (not (is-MissingVacant!1871 lt!140291)) (not (= (index!9657 lt!140291) (index!9656 lt!140251))) (and (bvsge (index!9657 lt!140291) #b00000000000000000000000000000000) (bvslt (index!9657 lt!140291) (size!7065 lt!140122)))) (or (is-Undefined!1871 lt!140291) (ite (is-Found!1871 lt!140291) (= (select (arr!6713 lt!140122) (index!9655 lt!140291)) (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26)) (and (is-MissingVacant!1871 lt!140291) (= (index!9657 lt!140291) (index!9656 lt!140251)) (= (select (arr!6713 lt!140122) (index!9657 lt!140291)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!180096 () SeekEntryResult!1871)

(assert (=> d!65467 (= lt!140291 e!180096)))

(declare-fun c!46182 () Bool)

(assert (=> d!65467 (= c!46182 (bvsge (x!27861 lt!140251) #b01111111111111111111111111111110))))

(declare-fun lt!140290 () (_ BitVec 64))

(assert (=> d!65467 (= lt!140290 (select (arr!6713 lt!140122) (index!9656 lt!140251)))))

(assert (=> d!65467 (validMask!0 mask!3868)))

(assert (=> d!65467 (= (seekKeyOrZeroReturnVacant!0 (x!27861 lt!140251) (index!9656 lt!140251) (index!9656 lt!140251) (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) lt!140122 mask!3868) lt!140291)))

(declare-fun e!180097 () SeekEntryResult!1871)

(declare-fun b!283841 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!283841 (= e!180097 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27861 lt!140251) #b00000000000000000000000000000001) (nextIndex!0 (index!9656 lt!140251) (x!27861 lt!140251) mask!3868) (index!9656 lt!140251) (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) lt!140122 mask!3868))))

(declare-fun b!283842 () Bool)

(declare-fun e!180095 () SeekEntryResult!1871)

(assert (=> b!283842 (= e!180095 (Found!1871 (index!9656 lt!140251)))))

(declare-fun b!283843 () Bool)

(declare-fun c!46180 () Bool)

(assert (=> b!283843 (= c!46180 (= lt!140290 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283843 (= e!180095 e!180097)))

(declare-fun b!283844 () Bool)

(assert (=> b!283844 (= e!180097 (MissingVacant!1871 (index!9656 lt!140251)))))

(declare-fun b!283845 () Bool)

(assert (=> b!283845 (= e!180096 e!180095)))

(declare-fun c!46181 () Bool)

(assert (=> b!283845 (= c!46181 (= lt!140290 (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26)))))

(declare-fun b!283846 () Bool)

(assert (=> b!283846 (= e!180096 Undefined!1871)))

(assert (= (and d!65467 c!46182) b!283846))

(assert (= (and d!65467 (not c!46182)) b!283845))

(assert (= (and b!283845 c!46181) b!283842))

(assert (= (and b!283845 (not c!46181)) b!283843))

(assert (= (and b!283843 c!46180) b!283844))

(assert (= (and b!283843 (not c!46180)) b!283841))

(declare-fun m!298815 () Bool)

(assert (=> d!65467 m!298815))

(declare-fun m!298817 () Bool)

(assert (=> d!65467 m!298817))

(assert (=> d!65467 m!298707))

(assert (=> d!65467 m!298389))

(declare-fun m!298819 () Bool)

(assert (=> b!283841 m!298819))

(assert (=> b!283841 m!298819))

(assert (=> b!283841 m!298409))

(declare-fun m!298821 () Bool)

(assert (=> b!283841 m!298821))

(assert (=> b!283761 d!65467))

(declare-fun d!65475 () Bool)

(assert (=> d!65475 (= (validKeyInArray!0 (select (arr!6713 lt!140122) #b00000000000000000000000000000000)) (and (not (= (select (arr!6713 lt!140122) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6713 lt!140122) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283757 d!65475))

(assert (=> b!283755 d!65475))

(declare-fun d!65477 () Bool)

(declare-fun lt!140296 () Bool)

(declare-fun content!192 (List!4521) (Set (_ BitVec 64)))

(assert (=> d!65477 (= lt!140296 (set.member (select (arr!6713 lt!140122) #b00000000000000000000000000000000) (content!192 Nil!4518)))))

(declare-fun e!180110 () Bool)

(assert (=> d!65477 (= lt!140296 e!180110)))

(declare-fun res!146594 () Bool)

(assert (=> d!65477 (=> (not res!146594) (not e!180110))))

(assert (=> d!65477 (= res!146594 (is-Cons!4517 Nil!4518))))

(assert (=> d!65477 (= (contains!1994 Nil!4518 (select (arr!6713 lt!140122) #b00000000000000000000000000000000)) lt!140296)))

(declare-fun b!283862 () Bool)

(declare-fun e!180109 () Bool)

(assert (=> b!283862 (= e!180110 e!180109)))

(declare-fun res!146593 () Bool)

(assert (=> b!283862 (=> res!146593 e!180109)))

(assert (=> b!283862 (= res!146593 (= (h!5187 Nil!4518) (select (arr!6713 lt!140122) #b00000000000000000000000000000000)))))

(declare-fun b!283863 () Bool)

(assert (=> b!283863 (= e!180109 (contains!1994 (t!9603 Nil!4518) (select (arr!6713 lt!140122) #b00000000000000000000000000000000)))))

(assert (= (and d!65477 res!146594) b!283862))

(assert (= (and b!283862 (not res!146593)) b!283863))

(declare-fun m!298839 () Bool)

(assert (=> d!65477 m!298839))

(assert (=> d!65477 m!298699))

(declare-fun m!298841 () Bool)

(assert (=> d!65477 m!298841))

(assert (=> b!283863 m!298699))

(declare-fun m!298843 () Bool)

(assert (=> b!283863 m!298843))

(assert (=> b!283754 d!65477))

(assert (=> b!283751 d!65401))

(declare-fun d!65483 () Bool)

(assert (=> d!65483 (= (seekEntryOrOpen!0 (select (arr!6713 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325)) mask!3868))))

(assert (=> d!65483 true))

(declare-fun _$51!15 () Unit!9026)

(assert (=> d!65483 (= (choose!83 a!3325 i!1267 k!2581 startIndex!26 mask!3868) _$51!15)))

(declare-fun bs!10075 () Bool)

(assert (= bs!10075 d!65483))

(assert (=> bs!10075 m!298399))

(assert (=> bs!10075 m!298417))

(assert (=> bs!10075 m!298403))

(assert (=> bs!10075 m!298409))

(assert (=> bs!10075 m!298671))

(assert (=> bs!10075 m!298409))

(assert (=> bs!10075 m!298399))

(assert (=> d!65425 d!65483))

(assert (=> d!65425 d!65383))

(declare-fun b!283885 () Bool)

(declare-fun e!180126 () Bool)

(declare-fun call!25521 () Bool)

(assert (=> b!283885 (= e!180126 call!25521)))

(declare-fun b!283886 () Bool)

(declare-fun e!180127 () Bool)

(declare-fun e!180128 () Bool)

(assert (=> b!283886 (= e!180127 e!180128)))

(declare-fun c!46193 () Bool)

(assert (=> b!283886 (= c!46193 (validKeyInArray!0 (select (arr!6713 a!3325) (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(declare-fun b!283887 () Bool)

(assert (=> b!283887 (= e!180128 e!180126)))

(declare-fun lt!140308 () (_ BitVec 64))

(assert (=> b!283887 (= lt!140308 (select (arr!6713 a!3325) (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!140306 () Unit!9026)

(assert (=> b!283887 (= lt!140306 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140308 (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!283887 (arrayContainsKey!0 a!3325 lt!140308 #b00000000000000000000000000000000)))

(declare-fun lt!140307 () Unit!9026)

(assert (=> b!283887 (= lt!140307 lt!140306)))

(declare-fun res!146604 () Bool)

(assert (=> b!283887 (= res!146604 (= (seekEntryOrOpen!0 (select (arr!6713 a!3325) (bvadd startIndex!26 #b00000000000000000000000000000001)) a!3325 mask!3868) (Found!1871 (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!283887 (=> (not res!146604) (not e!180126))))

(declare-fun b!283888 () Bool)

(assert (=> b!283888 (= e!180128 call!25521)))

(declare-fun d!65499 () Bool)

(declare-fun res!146605 () Bool)

(assert (=> d!65499 (=> res!146605 e!180127)))

(assert (=> d!65499 (= res!146605 (bvsge (bvadd startIndex!26 #b00000000000000000000000000000001) (size!7065 a!3325)))))

(assert (=> d!65499 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) a!3325 mask!3868) e!180127)))

(declare-fun bm!25518 () Bool)

(assert (=> bm!25518 (= call!25521 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3325 mask!3868))))

(assert (= (and d!65499 (not res!146605)) b!283886))

(assert (= (and b!283886 c!46193) b!283887))

(assert (= (and b!283886 (not c!46193)) b!283888))

(assert (= (and b!283887 res!146604) b!283885))

(assert (= (or b!283885 b!283888) bm!25518))

(declare-fun m!298885 () Bool)

(assert (=> b!283886 m!298885))

(assert (=> b!283886 m!298885))

(declare-fun m!298887 () Bool)

(assert (=> b!283886 m!298887))

(assert (=> b!283887 m!298885))

(declare-fun m!298889 () Bool)

(assert (=> b!283887 m!298889))

(declare-fun m!298891 () Bool)

(assert (=> b!283887 m!298891))

(assert (=> b!283887 m!298885))

(declare-fun m!298893 () Bool)

(assert (=> b!283887 m!298893))

(declare-fun m!298895 () Bool)

(assert (=> bm!25518 m!298895))

(assert (=> bm!25508 d!65499))

(declare-fun d!65501 () Bool)

(assert (=> d!65501 (arrayNoDuplicates!0 (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325)) #b00000000000000000000000000000000 Nil!4518)))

(assert (=> d!65501 true))

(declare-fun _$65!101 () Unit!9026)

(assert (=> d!65501 (= (choose!41 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4518) _$65!101)))

(declare-fun bs!10076 () Bool)

(assert (= bs!10076 d!65501))

(assert (=> bs!10076 m!298403))

(assert (=> bs!10076 m!298731))

(assert (=> d!65445 d!65501))

(declare-fun b!283925 () Bool)

(declare-fun e!180149 () Bool)

(declare-fun lt!140318 () SeekEntryResult!1871)

(assert (=> b!283925 (= e!180149 (bvsge (x!27861 lt!140318) #b01111111111111111111111111111110))))

(declare-fun e!180152 () SeekEntryResult!1871)

(declare-fun b!283926 () Bool)

(assert (=> b!283926 (= e!180152 (Intermediate!1871 true (toIndex!0 (select (arr!6713 a!3325) startIndex!26) mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!283927 () Bool)

(declare-fun e!180153 () SeekEntryResult!1871)

(assert (=> b!283927 (= e!180152 e!180153)))

(declare-fun c!46208 () Bool)

(declare-fun lt!140317 () (_ BitVec 64))

(assert (=> b!283927 (= c!46208 (or (= lt!140317 (select (arr!6713 a!3325) startIndex!26)) (= (bvadd lt!140317 lt!140317) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!283928 () Bool)

(assert (=> b!283928 (and (bvsge (index!9656 lt!140318) #b00000000000000000000000000000000) (bvslt (index!9656 lt!140318) (size!7065 a!3325)))))

(declare-fun res!146620 () Bool)

(assert (=> b!283928 (= res!146620 (= (select (arr!6713 a!3325) (index!9656 lt!140318)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180150 () Bool)

(assert (=> b!283928 (=> res!146620 e!180150)))

(declare-fun b!283929 () Bool)

(assert (=> b!283929 (and (bvsge (index!9656 lt!140318) #b00000000000000000000000000000000) (bvslt (index!9656 lt!140318) (size!7065 a!3325)))))

(declare-fun res!146618 () Bool)

(assert (=> b!283929 (= res!146618 (= (select (arr!6713 a!3325) (index!9656 lt!140318)) (select (arr!6713 a!3325) startIndex!26)))))

(assert (=> b!283929 (=> res!146618 e!180150)))

(declare-fun e!180151 () Bool)

(assert (=> b!283929 (= e!180151 e!180150)))

(declare-fun d!65503 () Bool)

(assert (=> d!65503 e!180149))

(declare-fun c!46206 () Bool)

(assert (=> d!65503 (= c!46206 (and (is-Intermediate!1871 lt!140318) (undefined!2683 lt!140318)))))

(assert (=> d!65503 (= lt!140318 e!180152)))

(declare-fun c!46207 () Bool)

(assert (=> d!65503 (= c!46207 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!65503 (= lt!140317 (select (arr!6713 a!3325) (toIndex!0 (select (arr!6713 a!3325) startIndex!26) mask!3868)))))

(assert (=> d!65503 (validMask!0 mask!3868)))

(assert (=> d!65503 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6713 a!3325) startIndex!26) mask!3868) (select (arr!6713 a!3325) startIndex!26) a!3325 mask!3868) lt!140318)))

(declare-fun b!283930 () Bool)

(assert (=> b!283930 (= e!180153 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!6713 a!3325) startIndex!26) mask!3868) #b00000000000000000000000000000000 mask!3868) (select (arr!6713 a!3325) startIndex!26) a!3325 mask!3868))))

(declare-fun b!283931 () Bool)

(assert (=> b!283931 (= e!180153 (Intermediate!1871 false (toIndex!0 (select (arr!6713 a!3325) startIndex!26) mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!283932 () Bool)

(assert (=> b!283932 (and (bvsge (index!9656 lt!140318) #b00000000000000000000000000000000) (bvslt (index!9656 lt!140318) (size!7065 a!3325)))))

(assert (=> b!283932 (= e!180150 (= (select (arr!6713 a!3325) (index!9656 lt!140318)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!283933 () Bool)

(assert (=> b!283933 (= e!180149 e!180151)))

(declare-fun res!146619 () Bool)

(assert (=> b!283933 (= res!146619 (and (is-Intermediate!1871 lt!140318) (not (undefined!2683 lt!140318)) (bvslt (x!27861 lt!140318) #b01111111111111111111111111111110) (bvsge (x!27861 lt!140318) #b00000000000000000000000000000000) (bvsge (x!27861 lt!140318) #b00000000000000000000000000000000)))))

(assert (=> b!283933 (=> (not res!146619) (not e!180151))))

(assert (= (and d!65503 c!46207) b!283926))

(assert (= (and d!65503 (not c!46207)) b!283927))

(assert (= (and b!283927 c!46208) b!283931))

(assert (= (and b!283927 (not c!46208)) b!283930))

(assert (= (and d!65503 c!46206) b!283925))

(assert (= (and d!65503 (not c!46206)) b!283933))

(assert (= (and b!283933 res!146619) b!283929))

(assert (= (and b!283929 (not res!146618)) b!283928))

(assert (= (and b!283928 (not res!146620)) b!283932))

(assert (=> b!283930 m!298675))

(declare-fun m!298897 () Bool)

(assert (=> b!283930 m!298897))

(assert (=> b!283930 m!298897))

(assert (=> b!283930 m!298399))

(declare-fun m!298899 () Bool)

(assert (=> b!283930 m!298899))

(declare-fun m!298901 () Bool)

(assert (=> b!283932 m!298901))

(assert (=> d!65503 m!298675))

(declare-fun m!298903 () Bool)

(assert (=> d!65503 m!298903))

(assert (=> d!65503 m!298389))

(assert (=> b!283928 m!298901))

(assert (=> b!283929 m!298901))

(assert (=> d!65433 d!65503))

(declare-fun d!65509 () Bool)

(declare-fun lt!140326 () (_ BitVec 32))

(declare-fun lt!140325 () (_ BitVec 32))

(assert (=> d!65509 (= lt!140326 (bvmul (bvxor lt!140325 (bvlshr lt!140325 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!65509 (= lt!140325 ((_ extract 31 0) (bvand (bvxor (select (arr!6713 a!3325) startIndex!26) (bvlshr (select (arr!6713 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!65509 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!146621 (let ((h!5190 ((_ extract 31 0) (bvand (bvxor (select (arr!6713 a!3325) startIndex!26) (bvlshr (select (arr!6713 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!27868 (bvmul (bvxor h!5190 (bvlshr h!5190 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!27868 (bvlshr x!27868 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!146621 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!146621 #b00000000000000000000000000000000))))))

(assert (=> d!65509 (= (toIndex!0 (select (arr!6713 a!3325) startIndex!26) mask!3868) (bvand (bvxor lt!140326 (bvlshr lt!140326 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!65433 d!65509))

(assert (=> d!65433 d!65383))

(declare-fun b!283943 () Bool)

(declare-fun e!180161 () Bool)

(assert (=> b!283943 (= e!180161 (contains!1994 (ite c!46151 (Cons!4517 (select (arr!6713 lt!140122) #b00000000000000000000000000000000) Nil!4518) Nil!4518) (select (arr!6713 lt!140122) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!25519 () Bool)

(declare-fun call!25522 () Bool)

(declare-fun c!46212 () Bool)

(assert (=> bm!25519 (= call!25522 (arrayNoDuplicates!0 lt!140122 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!46212 (Cons!4517 (select (arr!6713 lt!140122) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!46151 (Cons!4517 (select (arr!6713 lt!140122) #b00000000000000000000000000000000) Nil!4518) Nil!4518)) (ite c!46151 (Cons!4517 (select (arr!6713 lt!140122) #b00000000000000000000000000000000) Nil!4518) Nil!4518))))))

(declare-fun b!283945 () Bool)

(declare-fun e!180162 () Bool)

(assert (=> b!283945 (= e!180162 call!25522)))

(declare-fun b!283946 () Bool)

(declare-fun e!180159 () Bool)

(assert (=> b!283946 (= e!180159 e!180162)))

(assert (=> b!283946 (= c!46212 (validKeyInArray!0 (select (arr!6713 lt!140122) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!283947 () Bool)

(assert (=> b!283947 (= e!180162 call!25522)))

(declare-fun d!65513 () Bool)

(declare-fun res!146628 () Bool)

(declare-fun e!180160 () Bool)

(assert (=> d!65513 (=> res!146628 e!180160)))

(assert (=> d!65513 (= res!146628 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7065 lt!140122)))))

(assert (=> d!65513 (= (arrayNoDuplicates!0 lt!140122 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46151 (Cons!4517 (select (arr!6713 lt!140122) #b00000000000000000000000000000000) Nil!4518) Nil!4518)) e!180160)))

(declare-fun b!283944 () Bool)

(assert (=> b!283944 (= e!180160 e!180159)))

(declare-fun res!146627 () Bool)

(assert (=> b!283944 (=> (not res!146627) (not e!180159))))

(assert (=> b!283944 (= res!146627 (not e!180161))))

(declare-fun res!146626 () Bool)

(assert (=> b!283944 (=> (not res!146626) (not e!180161))))

(assert (=> b!283944 (= res!146626 (validKeyInArray!0 (select (arr!6713 lt!140122) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!65513 (not res!146628)) b!283944))

(assert (= (and b!283944 res!146626) b!283943))

(assert (= (and b!283944 res!146627) b!283946))

(assert (= (and b!283946 c!46212) b!283945))

(assert (= (and b!283946 (not c!46212)) b!283947))

(assert (= (or b!283945 b!283947) bm!25519))

(declare-fun m!298913 () Bool)

(assert (=> b!283943 m!298913))

(assert (=> b!283943 m!298913))

(declare-fun m!298915 () Bool)

(assert (=> b!283943 m!298915))

(assert (=> bm!25519 m!298913))

(declare-fun m!298917 () Bool)

(assert (=> bm!25519 m!298917))

(assert (=> b!283946 m!298913))

(assert (=> b!283946 m!298913))

(declare-fun m!298919 () Bool)

(assert (=> b!283946 m!298919))

(assert (=> b!283944 m!298913))

(assert (=> b!283944 m!298913))

(assert (=> b!283944 m!298919))

(assert (=> bm!25509 d!65513))

(declare-fun d!65515 () Bool)

(assert (=> d!65515 (arrayContainsKey!0 a!3325 lt!140248 #b00000000000000000000000000000000)))

(declare-fun lt!140335 () Unit!9026)

(declare-fun choose!13 (array!14145 (_ BitVec 64) (_ BitVec 32)) Unit!9026)

(assert (=> d!65515 (= lt!140335 (choose!13 a!3325 lt!140248 startIndex!26))))

(assert (=> d!65515 (bvsge startIndex!26 #b00000000000000000000000000000000)))

(assert (=> d!65515 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140248 startIndex!26) lt!140335)))

(declare-fun bs!10079 () Bool)

(assert (= bs!10079 d!65515))

(assert (=> bs!10079 m!298695))

(declare-fun m!298921 () Bool)

(assert (=> bs!10079 m!298921))

(assert (=> b!283752 d!65515))

(declare-fun d!65519 () Bool)

(declare-fun res!146631 () Bool)

(declare-fun e!180165 () Bool)

(assert (=> d!65519 (=> res!146631 e!180165)))

(assert (=> d!65519 (= res!146631 (= (select (arr!6713 a!3325) #b00000000000000000000000000000000) lt!140248))))

(assert (=> d!65519 (= (arrayContainsKey!0 a!3325 lt!140248 #b00000000000000000000000000000000) e!180165)))

(declare-fun b!283949 () Bool)

(declare-fun e!180166 () Bool)

(assert (=> b!283949 (= e!180165 e!180166)))

(declare-fun res!146633 () Bool)

(assert (=> b!283949 (=> (not res!146633) (not e!180166))))

(assert (=> b!283949 (= res!146633 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7065 a!3325)))))

(declare-fun b!283951 () Bool)

(assert (=> b!283951 (= e!180166 (arrayContainsKey!0 a!3325 lt!140248 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65519 (not res!146631)) b!283949))

(assert (= (and b!283949 res!146633) b!283951))

(assert (=> d!65519 m!298533))

(declare-fun m!298923 () Bool)

(assert (=> b!283951 m!298923))

(assert (=> b!283752 d!65519))

(assert (=> b!283752 d!65433))

(declare-fun lt!140337 () SeekEntryResult!1871)

(declare-fun d!65521 () Bool)

(assert (=> d!65521 (and (or (is-Undefined!1871 lt!140337) (not (is-Found!1871 lt!140337)) (and (bvsge (index!9655 lt!140337) #b00000000000000000000000000000000) (bvslt (index!9655 lt!140337) (size!7065 a!3325)))) (or (is-Undefined!1871 lt!140337) (is-Found!1871 lt!140337) (not (is-MissingVacant!1871 lt!140337)) (not (= (index!9657 lt!140337) (index!9656 lt!140224))) (and (bvsge (index!9657 lt!140337) #b00000000000000000000000000000000) (bvslt (index!9657 lt!140337) (size!7065 a!3325)))) (or (is-Undefined!1871 lt!140337) (ite (is-Found!1871 lt!140337) (= (select (arr!6713 a!3325) (index!9655 lt!140337)) k!2581) (and (is-MissingVacant!1871 lt!140337) (= (index!9657 lt!140337) (index!9656 lt!140224)) (= (select (arr!6713 a!3325) (index!9657 lt!140337)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!180170 () SeekEntryResult!1871)

(assert (=> d!65521 (= lt!140337 e!180170)))

(declare-fun c!46216 () Bool)

(assert (=> d!65521 (= c!46216 (bvsge (x!27861 lt!140224) #b01111111111111111111111111111110))))

(declare-fun lt!140336 () (_ BitVec 64))

(assert (=> d!65521 (= lt!140336 (select (arr!6713 a!3325) (index!9656 lt!140224)))))

(assert (=> d!65521 (validMask!0 mask!3868)))

(assert (=> d!65521 (= (seekKeyOrZeroReturnVacant!0 (x!27861 lt!140224) (index!9656 lt!140224) (index!9656 lt!140224) k!2581 a!3325 mask!3868) lt!140337)))

(declare-fun b!283955 () Bool)

(declare-fun e!180171 () SeekEntryResult!1871)

(assert (=> b!283955 (= e!180171 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27861 lt!140224) #b00000000000000000000000000000001) (nextIndex!0 (index!9656 lt!140224) (x!27861 lt!140224) mask!3868) (index!9656 lt!140224) k!2581 a!3325 mask!3868))))

(declare-fun b!283956 () Bool)

(declare-fun e!180169 () SeekEntryResult!1871)

(assert (=> b!283956 (= e!180169 (Found!1871 (index!9656 lt!140224)))))

(declare-fun b!283957 () Bool)

(declare-fun c!46214 () Bool)

(assert (=> b!283957 (= c!46214 (= lt!140336 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283957 (= e!180169 e!180171)))

(declare-fun b!283958 () Bool)

(assert (=> b!283958 (= e!180171 (MissingVacant!1871 (index!9656 lt!140224)))))

(declare-fun b!283959 () Bool)

(assert (=> b!283959 (= e!180170 e!180169)))

(declare-fun c!46215 () Bool)

(assert (=> b!283959 (= c!46215 (= lt!140336 k!2581))))

(declare-fun b!283960 () Bool)

(assert (=> b!283960 (= e!180170 Undefined!1871)))

(assert (= (and d!65521 c!46216) b!283960))

(assert (= (and d!65521 (not c!46216)) b!283959))

(assert (= (and b!283959 c!46215) b!283956))

(assert (= (and b!283959 (not c!46215)) b!283957))

(assert (= (and b!283957 c!46214) b!283958))

(assert (= (and b!283957 (not c!46214)) b!283955))

(declare-fun m!298933 () Bool)

(assert (=> d!65521 m!298933))

(declare-fun m!298935 () Bool)

(assert (=> d!65521 m!298935))

(assert (=> d!65521 m!298625))

(assert (=> d!65521 m!298389))

(declare-fun m!298937 () Bool)

(assert (=> b!283955 m!298937))

(assert (=> b!283955 m!298937))

(declare-fun m!298939 () Bool)

(assert (=> b!283955 m!298939))

(assert (=> b!283709 d!65521))

(declare-fun b!283967 () Bool)

(declare-fun e!180175 () Bool)

(declare-fun call!25524 () Bool)

(assert (=> b!283967 (= e!180175 call!25524)))

(declare-fun b!283968 () Bool)

(declare-fun e!180176 () Bool)

(declare-fun e!180177 () Bool)

(assert (=> b!283968 (= e!180176 e!180177)))

(declare-fun c!46220 () Bool)

(assert (=> b!283968 (= c!46220 (validKeyInArray!0 (select (arr!6713 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!283969 () Bool)

(assert (=> b!283969 (= e!180177 e!180175)))

(declare-fun lt!140343 () (_ BitVec 64))

(assert (=> b!283969 (= lt!140343 (select (arr!6713 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!140341 () Unit!9026)

(assert (=> b!283969 (= lt!140341 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140343 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!283969 (arrayContainsKey!0 a!3325 lt!140343 #b00000000000000000000000000000000)))

(declare-fun lt!140342 () Unit!9026)

(assert (=> b!283969 (= lt!140342 lt!140341)))

(declare-fun res!146634 () Bool)

(assert (=> b!283969 (= res!146634 (= (seekEntryOrOpen!0 (select (arr!6713 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3325 mask!3868) (Found!1871 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!283969 (=> (not res!146634) (not e!180175))))

(declare-fun b!283970 () Bool)

(assert (=> b!283970 (= e!180177 call!25524)))

(declare-fun d!65527 () Bool)

(declare-fun res!146635 () Bool)

(assert (=> d!65527 (=> res!146635 e!180176)))

(assert (=> d!65527 (= res!146635 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7065 a!3325)))))

(assert (=> d!65527 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868) e!180176)))

(declare-fun bm!25521 () Bool)

(assert (=> bm!25521 (= call!25524 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3325 mask!3868))))

(assert (= (and d!65527 (not res!146635)) b!283968))

(assert (= (and b!283968 c!46220) b!283969))

(assert (= (and b!283968 (not c!46220)) b!283970))

(assert (= (and b!283969 res!146634) b!283967))

(assert (= (or b!283967 b!283970) bm!25521))

(declare-fun m!298941 () Bool)

(assert (=> b!283968 m!298941))

(assert (=> b!283968 m!298941))

(declare-fun m!298943 () Bool)

(assert (=> b!283968 m!298943))

(assert (=> b!283969 m!298941))

(declare-fun m!298947 () Bool)

(assert (=> b!283969 m!298947))

(declare-fun m!298949 () Bool)

(assert (=> b!283969 m!298949))

(assert (=> b!283969 m!298941))

(declare-fun m!298953 () Bool)

(assert (=> b!283969 m!298953))

(declare-fun m!298955 () Bool)

(assert (=> bm!25521 m!298955))

(assert (=> bm!25502 d!65527))

(declare-fun d!65529 () Bool)

(assert (=> d!65529 (= (validKeyInArray!0 (select (arr!6713 a!3325) #b00000000000000000000000000000000)) (and (not (= (select (arr!6713 a!3325) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6713 a!3325) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283625 d!65529))

(declare-fun d!65531 () Bool)

(assert (=> d!65531 (arrayContainsKey!0 lt!140122 lt!140263 #b00000000000000000000000000000000)))

(declare-fun lt!140344 () Unit!9026)

(assert (=> d!65531 (= lt!140344 (choose!13 lt!140122 lt!140263 startIndex!26))))

(assert (=> d!65531 (bvsge startIndex!26 #b00000000000000000000000000000000)))

(assert (=> d!65531 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140122 lt!140263 startIndex!26) lt!140344)))

(declare-fun bs!10080 () Bool)

(assert (= bs!10080 d!65531))

(assert (=> bs!10080 m!298739))

(declare-fun m!298965 () Bool)

(assert (=> bs!10080 m!298965))

(assert (=> b!283774 d!65531))

(declare-fun d!65535 () Bool)

(declare-fun res!146636 () Bool)

(declare-fun e!180178 () Bool)

(assert (=> d!65535 (=> res!146636 e!180178)))

(assert (=> d!65535 (= res!146636 (= (select (arr!6713 lt!140122) #b00000000000000000000000000000000) lt!140263))))

(assert (=> d!65535 (= (arrayContainsKey!0 lt!140122 lt!140263 #b00000000000000000000000000000000) e!180178)))

(declare-fun b!283971 () Bool)

(declare-fun e!180179 () Bool)

(assert (=> b!283971 (= e!180178 e!180179)))

(declare-fun res!146637 () Bool)

(assert (=> b!283971 (=> (not res!146637) (not e!180179))))

(assert (=> b!283971 (= res!146637 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7065 lt!140122)))))

(declare-fun b!283972 () Bool)

(assert (=> b!283972 (= e!180179 (arrayContainsKey!0 lt!140122 lt!140263 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65535 (not res!146636)) b!283971))

(assert (= (and b!283971 res!146637) b!283972))

(assert (=> d!65535 m!298699))

(declare-fun m!298967 () Bool)

(assert (=> b!283972 m!298967))

(assert (=> b!283774 d!65535))

(declare-fun b!283973 () Bool)

(declare-fun e!180181 () SeekEntryResult!1871)

(declare-fun e!180180 () SeekEntryResult!1871)

(assert (=> b!283973 (= e!180181 e!180180)))

(declare-fun lt!140346 () (_ BitVec 64))

(declare-fun lt!140347 () SeekEntryResult!1871)

(assert (=> b!283973 (= lt!140346 (select (arr!6713 lt!140122) (index!9656 lt!140347)))))

(declare-fun c!46223 () Bool)

(assert (=> b!283973 (= c!46223 (= lt!140346 (select (arr!6713 lt!140122) startIndex!26)))))

(declare-fun b!283974 () Bool)

(assert (=> b!283974 (= e!180180 (Found!1871 (index!9656 lt!140347)))))

(declare-fun d!65537 () Bool)

(declare-fun lt!140345 () SeekEntryResult!1871)

(assert (=> d!65537 (and (or (is-Undefined!1871 lt!140345) (not (is-Found!1871 lt!140345)) (and (bvsge (index!9655 lt!140345) #b00000000000000000000000000000000) (bvslt (index!9655 lt!140345) (size!7065 lt!140122)))) (or (is-Undefined!1871 lt!140345) (is-Found!1871 lt!140345) (not (is-MissingZero!1871 lt!140345)) (and (bvsge (index!9654 lt!140345) #b00000000000000000000000000000000) (bvslt (index!9654 lt!140345) (size!7065 lt!140122)))) (or (is-Undefined!1871 lt!140345) (is-Found!1871 lt!140345) (is-MissingZero!1871 lt!140345) (not (is-MissingVacant!1871 lt!140345)) (and (bvsge (index!9657 lt!140345) #b00000000000000000000000000000000) (bvslt (index!9657 lt!140345) (size!7065 lt!140122)))) (or (is-Undefined!1871 lt!140345) (ite (is-Found!1871 lt!140345) (= (select (arr!6713 lt!140122) (index!9655 lt!140345)) (select (arr!6713 lt!140122) startIndex!26)) (ite (is-MissingZero!1871 lt!140345) (= (select (arr!6713 lt!140122) (index!9654 lt!140345)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1871 lt!140345) (= (select (arr!6713 lt!140122) (index!9657 lt!140345)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65537 (= lt!140345 e!180181)))

(declare-fun c!46221 () Bool)

(assert (=> d!65537 (= c!46221 (and (is-Intermediate!1871 lt!140347) (undefined!2683 lt!140347)))))

(assert (=> d!65537 (= lt!140347 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6713 lt!140122) startIndex!26) mask!3868) (select (arr!6713 lt!140122) startIndex!26) lt!140122 mask!3868))))

(assert (=> d!65537 (validMask!0 mask!3868)))

(assert (=> d!65537 (= (seekEntryOrOpen!0 (select (arr!6713 lt!140122) startIndex!26) lt!140122 mask!3868) lt!140345)))

(declare-fun b!283975 () Bool)

(declare-fun e!180182 () SeekEntryResult!1871)

(assert (=> b!283975 (= e!180182 (seekKeyOrZeroReturnVacant!0 (x!27861 lt!140347) (index!9656 lt!140347) (index!9656 lt!140347) (select (arr!6713 lt!140122) startIndex!26) lt!140122 mask!3868))))

(declare-fun b!283976 () Bool)

(assert (=> b!283976 (= e!180182 (MissingZero!1871 (index!9656 lt!140347)))))

(declare-fun b!283977 () Bool)

(assert (=> b!283977 (= e!180181 Undefined!1871)))

(declare-fun b!283978 () Bool)

(declare-fun c!46222 () Bool)

(assert (=> b!283978 (= c!46222 (= lt!140346 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283978 (= e!180180 e!180182)))

(assert (= (and d!65537 c!46221) b!283977))

(assert (= (and d!65537 (not c!46221)) b!283973))

(assert (= (and b!283973 c!46223) b!283974))

(assert (= (and b!283973 (not c!46223)) b!283978))

(assert (= (and b!283978 c!46222) b!283976))

(assert (= (and b!283978 (not c!46222)) b!283975))

(declare-fun m!298969 () Bool)

(assert (=> b!283973 m!298969))

(assert (=> d!65537 m!298733))

(declare-fun m!298971 () Bool)

(assert (=> d!65537 m!298971))

(assert (=> d!65537 m!298971))

(assert (=> d!65537 m!298733))

(declare-fun m!298973 () Bool)

(assert (=> d!65537 m!298973))

(declare-fun m!298975 () Bool)

(assert (=> d!65537 m!298975))

(declare-fun m!298977 () Bool)

(assert (=> d!65537 m!298977))

(assert (=> d!65537 m!298389))

(declare-fun m!298979 () Bool)

(assert (=> d!65537 m!298979))

(assert (=> b!283975 m!298733))

(declare-fun m!298981 () Bool)

(assert (=> b!283975 m!298981))

(assert (=> b!283774 d!65537))

(declare-fun lt!140349 () SeekEntryResult!1871)

(declare-fun d!65539 () Bool)

(assert (=> d!65539 (and (or (is-Undefined!1871 lt!140349) (not (is-Found!1871 lt!140349)) (and (bvsge (index!9655 lt!140349) #b00000000000000000000000000000000) (bvslt (index!9655 lt!140349) (size!7065 a!3325)))) (or (is-Undefined!1871 lt!140349) (is-Found!1871 lt!140349) (not (is-MissingVacant!1871 lt!140349)) (not (= (index!9657 lt!140349) (index!9656 lt!140239))) (and (bvsge (index!9657 lt!140349) #b00000000000000000000000000000000) (bvslt (index!9657 lt!140349) (size!7065 a!3325)))) (or (is-Undefined!1871 lt!140349) (ite (is-Found!1871 lt!140349) (= (select (arr!6713 a!3325) (index!9655 lt!140349)) (select (arr!6713 a!3325) startIndex!26)) (and (is-MissingVacant!1871 lt!140349) (= (index!9657 lt!140349) (index!9656 lt!140239)) (= (select (arr!6713 a!3325) (index!9657 lt!140349)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!180184 () SeekEntryResult!1871)

(assert (=> d!65539 (= lt!140349 e!180184)))

(declare-fun c!46226 () Bool)

(assert (=> d!65539 (= c!46226 (bvsge (x!27861 lt!140239) #b01111111111111111111111111111110))))

(declare-fun lt!140348 () (_ BitVec 64))

(assert (=> d!65539 (= lt!140348 (select (arr!6713 a!3325) (index!9656 lt!140239)))))

(assert (=> d!65539 (validMask!0 mask!3868)))

(assert (=> d!65539 (= (seekKeyOrZeroReturnVacant!0 (x!27861 lt!140239) (index!9656 lt!140239) (index!9656 lt!140239) (select (arr!6713 a!3325) startIndex!26) a!3325 mask!3868) lt!140349)))

(declare-fun e!180185 () SeekEntryResult!1871)

(declare-fun b!283979 () Bool)

(assert (=> b!283979 (= e!180185 (seekKeyOrZeroReturnVacant!0 (bvadd (x!27861 lt!140239) #b00000000000000000000000000000001) (nextIndex!0 (index!9656 lt!140239) (x!27861 lt!140239) mask!3868) (index!9656 lt!140239) (select (arr!6713 a!3325) startIndex!26) a!3325 mask!3868))))

(declare-fun b!283980 () Bool)

(declare-fun e!180183 () SeekEntryResult!1871)

(assert (=> b!283980 (= e!180183 (Found!1871 (index!9656 lt!140239)))))

(declare-fun b!283981 () Bool)

(declare-fun c!46224 () Bool)

(assert (=> b!283981 (= c!46224 (= lt!140348 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!283981 (= e!180183 e!180185)))

(declare-fun b!283982 () Bool)

(assert (=> b!283982 (= e!180185 (MissingVacant!1871 (index!9656 lt!140239)))))

(declare-fun b!283983 () Bool)

(assert (=> b!283983 (= e!180184 e!180183)))

(declare-fun c!46225 () Bool)

(assert (=> b!283983 (= c!46225 (= lt!140348 (select (arr!6713 a!3325) startIndex!26)))))

(declare-fun b!283984 () Bool)

(assert (=> b!283984 (= e!180184 Undefined!1871)))

(assert (= (and d!65539 c!46226) b!283984))

(assert (= (and d!65539 (not c!46226)) b!283983))

(assert (= (and b!283983 c!46225) b!283980))

(assert (= (and b!283983 (not c!46225)) b!283981))

(assert (= (and b!283981 c!46224) b!283982))

(assert (= (and b!283981 (not c!46224)) b!283979))

(declare-fun m!298983 () Bool)

(assert (=> d!65539 m!298983))

(declare-fun m!298985 () Bool)

(assert (=> d!65539 m!298985))

(assert (=> d!65539 m!298673))

(assert (=> d!65539 m!298389))

(declare-fun m!298987 () Bool)

(assert (=> b!283979 m!298987))

(assert (=> b!283979 m!298987))

(assert (=> b!283979 m!298399))

(declare-fun m!298989 () Bool)

(assert (=> b!283979 m!298989))

(assert (=> b!283743 d!65539))

(declare-fun b!283985 () Bool)

(declare-fun e!180186 () Bool)

(declare-fun lt!140351 () SeekEntryResult!1871)

(assert (=> b!283985 (= e!180186 (bvsge (x!27861 lt!140351) #b01111111111111111111111111111110))))

(declare-fun e!180189 () SeekEntryResult!1871)

(declare-fun b!283986 () Bool)

(assert (=> b!283986 (= e!180189 (Intermediate!1871 true (toIndex!0 (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!283987 () Bool)

(declare-fun e!180190 () SeekEntryResult!1871)

(assert (=> b!283987 (= e!180189 e!180190)))

(declare-fun c!46229 () Bool)

(declare-fun lt!140350 () (_ BitVec 64))

(assert (=> b!283987 (= c!46229 (or (= lt!140350 (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26)) (= (bvadd lt!140350 lt!140350) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!283988 () Bool)

(assert (=> b!283988 (and (bvsge (index!9656 lt!140351) #b00000000000000000000000000000000) (bvslt (index!9656 lt!140351) (size!7065 lt!140122)))))

(declare-fun res!146640 () Bool)

(assert (=> b!283988 (= res!146640 (= (select (arr!6713 lt!140122) (index!9656 lt!140351)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180187 () Bool)

(assert (=> b!283988 (=> res!146640 e!180187)))

(declare-fun b!283989 () Bool)

(assert (=> b!283989 (and (bvsge (index!9656 lt!140351) #b00000000000000000000000000000000) (bvslt (index!9656 lt!140351) (size!7065 lt!140122)))))

(declare-fun res!146638 () Bool)

(assert (=> b!283989 (= res!146638 (= (select (arr!6713 lt!140122) (index!9656 lt!140351)) (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26)))))

(assert (=> b!283989 (=> res!146638 e!180187)))

(declare-fun e!180188 () Bool)

(assert (=> b!283989 (= e!180188 e!180187)))

(declare-fun d!65541 () Bool)

(assert (=> d!65541 e!180186))

(declare-fun c!46227 () Bool)

(assert (=> d!65541 (= c!46227 (and (is-Intermediate!1871 lt!140351) (undefined!2683 lt!140351)))))

(assert (=> d!65541 (= lt!140351 e!180189)))

(declare-fun c!46228 () Bool)

(assert (=> d!65541 (= c!46228 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!65541 (= lt!140350 (select (arr!6713 lt!140122) (toIndex!0 (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) mask!3868)))))

(assert (=> d!65541 (validMask!0 mask!3868)))

(assert (=> d!65541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) mask!3868) (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) lt!140122 mask!3868) lt!140351)))

(declare-fun b!283990 () Bool)

(assert (=> b!283990 (= e!180190 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) mask!3868) #b00000000000000000000000000000000 mask!3868) (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) lt!140122 mask!3868))))

(declare-fun b!283991 () Bool)

(assert (=> b!283991 (= e!180190 (Intermediate!1871 false (toIndex!0 (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!283992 () Bool)

(assert (=> b!283992 (and (bvsge (index!9656 lt!140351) #b00000000000000000000000000000000) (bvslt (index!9656 lt!140351) (size!7065 lt!140122)))))

(assert (=> b!283992 (= e!180187 (= (select (arr!6713 lt!140122) (index!9656 lt!140351)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!283993 () Bool)

(assert (=> b!283993 (= e!180186 e!180188)))

(declare-fun res!146639 () Bool)

(assert (=> b!283993 (= res!146639 (and (is-Intermediate!1871 lt!140351) (not (undefined!2683 lt!140351)) (bvslt (x!27861 lt!140351) #b01111111111111111111111111111110) (bvsge (x!27861 lt!140351) #b00000000000000000000000000000000) (bvsge (x!27861 lt!140351) #b00000000000000000000000000000000)))))

(assert (=> b!283993 (=> (not res!146639) (not e!180188))))

(assert (= (and d!65541 c!46228) b!283986))

(assert (= (and d!65541 (not c!46228)) b!283987))

(assert (= (and b!283987 c!46229) b!283991))

(assert (= (and b!283987 (not c!46229)) b!283990))

(assert (= (and d!65541 c!46227) b!283985))

(assert (= (and d!65541 (not c!46227)) b!283993))

(assert (= (and b!283993 res!146639) b!283989))

(assert (= (and b!283989 (not res!146638)) b!283988))

(assert (= (and b!283988 (not res!146640)) b!283992))

(assert (=> b!283990 m!298709))

(declare-fun m!298993 () Bool)

(assert (=> b!283990 m!298993))

(assert (=> b!283990 m!298993))

(assert (=> b!283990 m!298409))

(declare-fun m!298995 () Bool)

(assert (=> b!283990 m!298995))

(declare-fun m!298997 () Bool)

(assert (=> b!283992 m!298997))

(assert (=> d!65541 m!298709))

(declare-fun m!299001 () Bool)

(assert (=> d!65541 m!299001))

(assert (=> d!65541 m!298389))

(assert (=> b!283988 m!298997))

(assert (=> b!283989 m!298997))

(assert (=> d!65443 d!65541))

(declare-fun d!65549 () Bool)

(declare-fun lt!140357 () (_ BitVec 32))

(declare-fun lt!140356 () (_ BitVec 32))

(assert (=> d!65549 (= lt!140357 (bvmul (bvxor lt!140356 (bvlshr lt!140356 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!65549 (= lt!140356 ((_ extract 31 0) (bvand (bvxor (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) (bvlshr (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!65549 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!146621 (let ((h!5190 ((_ extract 31 0) (bvand (bvxor (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) (bvlshr (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!27868 (bvmul (bvxor h!5190 (bvlshr h!5190 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!27868 (bvlshr x!27868 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!146621 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!146621 #b00000000000000000000000000000000))))))

(assert (=> d!65549 (= (toIndex!0 (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) mask!3868) (bvand (bvxor lt!140357 (bvlshr lt!140357 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!65443 d!65549))

(assert (=> d!65443 d!65383))

(declare-fun b!284002 () Bool)

(declare-fun e!180196 () Bool)

(declare-fun lt!140359 () SeekEntryResult!1871)

(assert (=> b!284002 (= e!180196 (bvsge (x!27861 lt!140359) #b01111111111111111111111111111110))))

(declare-fun b!284003 () Bool)

(declare-fun e!180199 () SeekEntryResult!1871)

(assert (=> b!284003 (= e!180199 (Intermediate!1871 true (toIndex!0 k!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!284004 () Bool)

(declare-fun e!180200 () SeekEntryResult!1871)

(assert (=> b!284004 (= e!180199 e!180200)))

(declare-fun c!46235 () Bool)

(declare-fun lt!140358 () (_ BitVec 64))

(assert (=> b!284004 (= c!46235 (or (= lt!140358 k!2581) (= (bvadd lt!140358 lt!140358) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!284005 () Bool)

(assert (=> b!284005 (and (bvsge (index!9656 lt!140359) #b00000000000000000000000000000000) (bvslt (index!9656 lt!140359) (size!7065 a!3325)))))

(declare-fun res!146645 () Bool)

(assert (=> b!284005 (= res!146645 (= (select (arr!6713 a!3325) (index!9656 lt!140359)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!180197 () Bool)

(assert (=> b!284005 (=> res!146645 e!180197)))

(declare-fun b!284006 () Bool)

(assert (=> b!284006 (and (bvsge (index!9656 lt!140359) #b00000000000000000000000000000000) (bvslt (index!9656 lt!140359) (size!7065 a!3325)))))

(declare-fun res!146643 () Bool)

(assert (=> b!284006 (= res!146643 (= (select (arr!6713 a!3325) (index!9656 lt!140359)) k!2581))))

(assert (=> b!284006 (=> res!146643 e!180197)))

(declare-fun e!180198 () Bool)

(assert (=> b!284006 (= e!180198 e!180197)))

(declare-fun d!65551 () Bool)

(assert (=> d!65551 e!180196))

(declare-fun c!46233 () Bool)

(assert (=> d!65551 (= c!46233 (and (is-Intermediate!1871 lt!140359) (undefined!2683 lt!140359)))))

(assert (=> d!65551 (= lt!140359 e!180199)))

(declare-fun c!46234 () Bool)

(assert (=> d!65551 (= c!46234 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!65551 (= lt!140358 (select (arr!6713 a!3325) (toIndex!0 k!2581 mask!3868)))))

(assert (=> d!65551 (validMask!0 mask!3868)))

(assert (=> d!65551 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2581 mask!3868) k!2581 a!3325 mask!3868) lt!140359)))

(declare-fun b!284007 () Bool)

(assert (=> b!284007 (= e!180200 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2581 mask!3868) #b00000000000000000000000000000000 mask!3868) k!2581 a!3325 mask!3868))))

(declare-fun b!284008 () Bool)

(assert (=> b!284008 (= e!180200 (Intermediate!1871 false (toIndex!0 k!2581 mask!3868) #b00000000000000000000000000000000))))

(declare-fun b!284009 () Bool)

(assert (=> b!284009 (and (bvsge (index!9656 lt!140359) #b00000000000000000000000000000000) (bvslt (index!9656 lt!140359) (size!7065 a!3325)))))

(assert (=> b!284009 (= e!180197 (= (select (arr!6713 a!3325) (index!9656 lt!140359)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!284010 () Bool)

(assert (=> b!284010 (= e!180196 e!180198)))

(declare-fun res!146644 () Bool)

(assert (=> b!284010 (= res!146644 (and (is-Intermediate!1871 lt!140359) (not (undefined!2683 lt!140359)) (bvslt (x!27861 lt!140359) #b01111111111111111111111111111110) (bvsge (x!27861 lt!140359) #b00000000000000000000000000000000) (bvsge (x!27861 lt!140359) #b00000000000000000000000000000000)))))

(assert (=> b!284010 (=> (not res!146644) (not e!180198))))

(assert (= (and d!65551 c!46234) b!284003))

(assert (= (and d!65551 (not c!46234)) b!284004))

(assert (= (and b!284004 c!46235) b!284008))

(assert (= (and b!284004 (not c!46235)) b!284007))

(assert (= (and d!65551 c!46233) b!284002))

(assert (= (and d!65551 (not c!46233)) b!284010))

(assert (= (and b!284010 res!146644) b!284006))

(assert (= (and b!284006 (not res!146643)) b!284005))

(assert (= (and b!284005 (not res!146645)) b!284009))

(assert (=> b!284007 m!298627))

(declare-fun m!299017 () Bool)

(assert (=> b!284007 m!299017))

(assert (=> b!284007 m!299017))

(declare-fun m!299019 () Bool)

(assert (=> b!284007 m!299019))

(declare-fun m!299021 () Bool)

(assert (=> b!284009 m!299021))

(assert (=> d!65551 m!298627))

(declare-fun m!299025 () Bool)

(assert (=> d!65551 m!299025))

(assert (=> d!65551 m!298389))

(assert (=> b!284005 m!299021))

(assert (=> b!284006 m!299021))

(assert (=> d!65411 d!65551))

(declare-fun d!65557 () Bool)

(declare-fun lt!140363 () (_ BitVec 32))

(declare-fun lt!140362 () (_ BitVec 32))

(assert (=> d!65557 (= lt!140363 (bvmul (bvxor lt!140362 (bvlshr lt!140362 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!65557 (= lt!140362 ((_ extract 31 0) (bvand (bvxor k!2581 (bvlshr k!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!65557 (and (bvsge mask!3868 #b00000000000000000000000000000000) (let ((res!146621 (let ((h!5190 ((_ extract 31 0) (bvand (bvxor k!2581 (bvlshr k!2581 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!27868 (bvmul (bvxor h!5190 (bvlshr h!5190 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!27868 (bvlshr x!27868 #b00000000000000000000000000001101)) mask!3868))))) (and (bvslt res!146621 (bvadd mask!3868 #b00000000000000000000000000000001)) (bvsge res!146621 #b00000000000000000000000000000000))))))

(assert (=> d!65557 (= (toIndex!0 k!2581 mask!3868) (bvand (bvxor lt!140363 (bvlshr lt!140363 #b00000000000000000000000000001101)) mask!3868))))

(assert (=> d!65411 d!65557))

(assert (=> d!65411 d!65383))

(assert (=> b!283740 d!65433))

(declare-fun b!284022 () Bool)

(declare-fun e!180209 () SeekEntryResult!1871)

(declare-fun e!180208 () SeekEntryResult!1871)

(assert (=> b!284022 (= e!180209 e!180208)))

(declare-fun lt!140366 () SeekEntryResult!1871)

(declare-fun lt!140365 () (_ BitVec 64))

(assert (=> b!284022 (= lt!140365 (select (arr!6713 (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325))) (index!9656 lt!140366)))))

(declare-fun c!46241 () Bool)

(assert (=> b!284022 (= c!46241 (= lt!140365 (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26)))))

(declare-fun b!284023 () Bool)

(assert (=> b!284023 (= e!180208 (Found!1871 (index!9656 lt!140366)))))

(declare-fun lt!140364 () SeekEntryResult!1871)

(declare-fun d!65559 () Bool)

(assert (=> d!65559 (and (or (is-Undefined!1871 lt!140364) (not (is-Found!1871 lt!140364)) (and (bvsge (index!9655 lt!140364) #b00000000000000000000000000000000) (bvslt (index!9655 lt!140364) (size!7065 (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325)))))) (or (is-Undefined!1871 lt!140364) (is-Found!1871 lt!140364) (not (is-MissingZero!1871 lt!140364)) (and (bvsge (index!9654 lt!140364) #b00000000000000000000000000000000) (bvslt (index!9654 lt!140364) (size!7065 (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325)))))) (or (is-Undefined!1871 lt!140364) (is-Found!1871 lt!140364) (is-MissingZero!1871 lt!140364) (not (is-MissingVacant!1871 lt!140364)) (and (bvsge (index!9657 lt!140364) #b00000000000000000000000000000000) (bvslt (index!9657 lt!140364) (size!7065 (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325)))))) (or (is-Undefined!1871 lt!140364) (ite (is-Found!1871 lt!140364) (= (select (arr!6713 (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325))) (index!9655 lt!140364)) (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26)) (ite (is-MissingZero!1871 lt!140364) (= (select (arr!6713 (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325))) (index!9654 lt!140364)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1871 lt!140364) (= (select (arr!6713 (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325))) (index!9657 lt!140364)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65559 (= lt!140364 e!180209)))

(declare-fun c!46239 () Bool)

(assert (=> d!65559 (= c!46239 (and (is-Intermediate!1871 lt!140366) (undefined!2683 lt!140366)))))

(assert (=> d!65559 (= lt!140366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) mask!3868) (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325)) mask!3868))))

(assert (=> d!65559 (validMask!0 mask!3868)))

(assert (=> d!65559 (= (seekEntryOrOpen!0 (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325)) mask!3868) lt!140364)))

(declare-fun e!180210 () SeekEntryResult!1871)

(declare-fun b!284024 () Bool)

(assert (=> b!284024 (= e!180210 (seekKeyOrZeroReturnVacant!0 (x!27861 lt!140366) (index!9656 lt!140366) (index!9656 lt!140366) (select (store (arr!6713 a!3325) i!1267 k!2581) startIndex!26) (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325)) mask!3868))))

(declare-fun b!284025 () Bool)

(assert (=> b!284025 (= e!180210 (MissingZero!1871 (index!9656 lt!140366)))))

(declare-fun b!284026 () Bool)

(assert (=> b!284026 (= e!180209 Undefined!1871)))

(declare-fun b!284027 () Bool)

(declare-fun c!46240 () Bool)

(assert (=> b!284027 (= c!46240 (= lt!140365 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!284027 (= e!180208 e!180210)))

(assert (= (and d!65559 c!46239) b!284026))

(assert (= (and d!65559 (not c!46239)) b!284022))

(assert (= (and b!284022 c!46241) b!284023))

(assert (= (and b!284022 (not c!46241)) b!284027))

(assert (= (and b!284027 c!46240) b!284025))

(assert (= (and b!284027 (not c!46240)) b!284024))

(declare-fun m!299035 () Bool)

(assert (=> b!284022 m!299035))

(assert (=> d!65559 m!298409))

(assert (=> d!65559 m!298709))

(assert (=> d!65559 m!298709))

(assert (=> d!65559 m!298409))

(declare-fun m!299037 () Bool)

(assert (=> d!65559 m!299037))

(declare-fun m!299039 () Bool)

(assert (=> d!65559 m!299039))

(declare-fun m!299041 () Bool)

(assert (=> d!65559 m!299041))

(assert (=> d!65559 m!298389))

(declare-fun m!299043 () Bool)

(assert (=> d!65559 m!299043))

(assert (=> b!284024 m!298409))

(declare-fun m!299045 () Bool)

(assert (=> b!284024 m!299045))

(assert (=> b!283740 d!65559))

(declare-fun d!65565 () Bool)

(declare-fun res!146653 () Bool)

(declare-fun e!180213 () Bool)

(assert (=> d!65565 (=> res!146653 e!180213)))

(assert (=> d!65565 (= res!146653 (= (select (arr!6713 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k!2581))))

(assert (=> d!65565 (= (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!180213)))

(declare-fun b!284030 () Bool)

(declare-fun e!180214 () Bool)

(assert (=> b!284030 (= e!180213 e!180214)))

(declare-fun res!146654 () Bool)

(assert (=> b!284030 (=> (not res!146654) (not e!180214))))

(assert (=> b!284030 (= res!146654 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!7065 a!3325)))))

(declare-fun b!284031 () Bool)

(assert (=> b!284031 (= e!180214 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!65565 (not res!146653)) b!284030))

(assert (= (and b!284030 res!146654) b!284031))

(assert (=> d!65565 m!298941))

(declare-fun m!299051 () Bool)

(assert (=> b!284031 m!299051))

(assert (=> b!283599 d!65565))

(declare-fun b!284038 () Bool)

(declare-fun e!180218 () Bool)

(declare-fun call!25525 () Bool)

(assert (=> b!284038 (= e!180218 call!25525)))

(declare-fun b!284039 () Bool)

(declare-fun e!180219 () Bool)

(declare-fun e!180220 () Bool)

(assert (=> b!284039 (= e!180219 e!180220)))

(declare-fun c!46245 () Bool)

(assert (=> b!284039 (= c!46245 (validKeyInArray!0 (select (arr!6713 lt!140122) (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(declare-fun b!284040 () Bool)

(assert (=> b!284040 (= e!180220 e!180218)))

(declare-fun lt!140374 () (_ BitVec 64))

(assert (=> b!284040 (= lt!140374 (select (arr!6713 lt!140122) (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(declare-fun lt!140372 () Unit!9026)

(assert (=> b!284040 (= lt!140372 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140122 lt!140374 (bvadd startIndex!26 #b00000000000000000000000000000001)))))

(assert (=> b!284040 (arrayContainsKey!0 lt!140122 lt!140374 #b00000000000000000000000000000000)))

(declare-fun lt!140373 () Unit!9026)

(assert (=> b!284040 (= lt!140373 lt!140372)))

(declare-fun res!146655 () Bool)

(assert (=> b!284040 (= res!146655 (= (seekEntryOrOpen!0 (select (arr!6713 lt!140122) (bvadd startIndex!26 #b00000000000000000000000000000001)) lt!140122 mask!3868) (Found!1871 (bvadd startIndex!26 #b00000000000000000000000000000001))))))

(assert (=> b!284040 (=> (not res!146655) (not e!180218))))

(declare-fun b!284041 () Bool)

(assert (=> b!284041 (= e!180220 call!25525)))

(declare-fun d!65571 () Bool)

(declare-fun res!146656 () Bool)

(assert (=> d!65571 (=> res!146656 e!180219)))

(assert (=> d!65571 (= res!146656 (bvsge (bvadd startIndex!26 #b00000000000000000000000000000001) (size!7065 lt!140122)))))

(assert (=> d!65571 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!140122 mask!3868) e!180219)))

(declare-fun bm!25522 () Bool)

(assert (=> bm!25522 (= call!25525 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!140122 mask!3868))))

(assert (= (and d!65571 (not res!146656)) b!284039))

(assert (= (and b!284039 c!46245) b!284040))

(assert (= (and b!284039 (not c!46245)) b!284041))

(assert (= (and b!284040 res!146655) b!284038))

(assert (= (or b!284038 b!284041) bm!25522))

(declare-fun m!299053 () Bool)

(assert (=> b!284039 m!299053))

(assert (=> b!284039 m!299053))

(declare-fun m!299055 () Bool)

(assert (=> b!284039 m!299055))

(assert (=> b!284040 m!299053))

(declare-fun m!299057 () Bool)

(assert (=> b!284040 m!299057))

(declare-fun m!299061 () Bool)

(assert (=> b!284040 m!299061))

(assert (=> b!284040 m!299053))

(declare-fun m!299065 () Bool)

(assert (=> b!284040 m!299065))

(declare-fun m!299067 () Bool)

(assert (=> bm!25522 m!299067))

(assert (=> bm!25511 d!65571))

(declare-fun d!65573 () Bool)

(declare-fun lt!140375 () Bool)

(assert (=> d!65573 (= lt!140375 (set.member (select (arr!6713 a!3325) #b00000000000000000000000000000000) (content!192 Nil!4518)))))

(declare-fun e!180222 () Bool)

(assert (=> d!65573 (= lt!140375 e!180222)))

(declare-fun res!146658 () Bool)

(assert (=> d!65573 (=> (not res!146658) (not e!180222))))

(assert (=> d!65573 (= res!146658 (is-Cons!4517 Nil!4518))))

(assert (=> d!65573 (= (contains!1994 Nil!4518 (select (arr!6713 a!3325) #b00000000000000000000000000000000)) lt!140375)))

(declare-fun b!284042 () Bool)

(declare-fun e!180221 () Bool)

(assert (=> b!284042 (= e!180222 e!180221)))

(declare-fun res!146657 () Bool)

(assert (=> b!284042 (=> res!146657 e!180221)))

(assert (=> b!284042 (= res!146657 (= (h!5187 Nil!4518) (select (arr!6713 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!284043 () Bool)

(assert (=> b!284043 (= e!180221 (contains!1994 (t!9603 Nil!4518) (select (arr!6713 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65573 res!146658) b!284042))

(assert (= (and b!284042 (not res!146657)) b!284043))

(assert (=> d!65573 m!298839))

(assert (=> d!65573 m!298533))

(declare-fun m!299073 () Bool)

(assert (=> d!65573 m!299073))

(assert (=> b!284043 m!298533))

(declare-fun m!299075 () Bool)

(assert (=> b!284043 m!299075))

(assert (=> b!283622 d!65573))

(declare-fun b!284053 () Bool)

(declare-fun e!180230 () Bool)

(assert (=> b!284053 (= e!180230 (contains!1994 Nil!4518 (select (arr!6713 (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325))) #b00000000000000000000000000000000)))))

(declare-fun bm!25523 () Bool)

(declare-fun c!46249 () Bool)

(declare-fun call!25526 () Bool)

(assert (=> bm!25523 (= call!25526 (arrayNoDuplicates!0 (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46249 (Cons!4517 (select (arr!6713 (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325))) #b00000000000000000000000000000000) Nil!4518) Nil!4518)))))

(declare-fun b!284055 () Bool)

(declare-fun e!180231 () Bool)

(assert (=> b!284055 (= e!180231 call!25526)))

(declare-fun b!284056 () Bool)

(declare-fun e!180228 () Bool)

(assert (=> b!284056 (= e!180228 e!180231)))

(assert (=> b!284056 (= c!46249 (validKeyInArray!0 (select (arr!6713 (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325))) #b00000000000000000000000000000000)))))

(declare-fun b!284057 () Bool)

(assert (=> b!284057 (= e!180231 call!25526)))

(declare-fun d!65577 () Bool)

(declare-fun res!146664 () Bool)

(declare-fun e!180229 () Bool)

(assert (=> d!65577 (=> res!146664 e!180229)))

(assert (=> d!65577 (= res!146664 (bvsge #b00000000000000000000000000000000 (size!7065 (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325)))))))

(assert (=> d!65577 (= (arrayNoDuplicates!0 (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325)) #b00000000000000000000000000000000 Nil!4518) e!180229)))

(declare-fun b!284054 () Bool)

(assert (=> b!284054 (= e!180229 e!180228)))

(declare-fun res!146663 () Bool)

(assert (=> b!284054 (=> (not res!146663) (not e!180228))))

(assert (=> b!284054 (= res!146663 (not e!180230))))

(declare-fun res!146662 () Bool)

(assert (=> b!284054 (=> (not res!146662) (not e!180230))))

(assert (=> b!284054 (= res!146662 (validKeyInArray!0 (select (arr!6713 (array!14146 (store (arr!6713 a!3325) i!1267 k!2581) (size!7065 a!3325))) #b00000000000000000000000000000000)))))

(assert (= (and d!65577 (not res!146664)) b!284054))

(assert (= (and b!284054 res!146662) b!284053))

(assert (= (and b!284054 res!146663) b!284056))

(assert (= (and b!284056 c!46249) b!284055))

(assert (= (and b!284056 (not c!46249)) b!284057))

(assert (= (or b!284055 b!284057) bm!25523))

(declare-fun m!299083 () Bool)

(assert (=> b!284053 m!299083))

(assert (=> b!284053 m!299083))

(declare-fun m!299087 () Bool)

(assert (=> b!284053 m!299087))

(assert (=> bm!25523 m!299083))

(declare-fun m!299089 () Bool)

(assert (=> bm!25523 m!299089))

(assert (=> b!284056 m!299083))

(assert (=> b!284056 m!299083))

(declare-fun m!299091 () Bool)

(assert (=> b!284056 m!299091))

(assert (=> b!284054 m!299083))

(assert (=> b!284054 m!299083))

(assert (=> b!284054 m!299091))

(assert (=> b!283771 d!65577))

(declare-fun d!65581 () Bool)

(assert (=> d!65581 (= (validKeyInArray!0 (select (arr!6713 lt!140122) startIndex!26)) (and (not (= (select (arr!6713 lt!140122) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6713 lt!140122) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!283773 d!65581))

(declare-fun d!65585 () Bool)

(assert (=> d!65585 (arrayContainsKey!0 a!3325 lt!140194 #b00000000000000000000000000000000)))

(declare-fun lt!140382 () Unit!9026)

(assert (=> d!65585 (= lt!140382 (choose!13 a!3325 lt!140194 #b00000000000000000000000000000000))))

(assert (=> d!65585 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!65585 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140194 #b00000000000000000000000000000000) lt!140382)))

(declare-fun bs!10084 () Bool)

(assert (= bs!10084 d!65585))

(assert (=> bs!10084 m!298571))

(declare-fun m!299093 () Bool)

(assert (=> bs!10084 m!299093))

(assert (=> b!283655 d!65585))

(declare-fun d!65587 () Bool)

(declare-fun res!146667 () Bool)

(declare-fun e!180235 () Bool)

(assert (=> d!65587 (=> res!146667 e!180235)))

(assert (=> d!65587 (= res!146667 (= (select (arr!6713 a!3325) #b00000000000000000000000000000000) lt!140194))))

(assert (=> d!65587 (= (arrayContainsKey!0 a!3325 lt!140194 #b00000000000000000000000000000000) e!180235)))

(declare-fun b!284062 () Bool)

(declare-fun e!180236 () Bool)

(assert (=> b!284062 (= e!180235 e!180236)))

(declare-fun res!146668 () Bool)

(assert (=> b!284062 (=> (not res!146668) (not e!180236))))

(assert (=> b!284062 (= res!146668 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7065 a!3325)))))

(declare-fun b!284063 () Bool)

(assert (=> b!284063 (= e!180236 (arrayContainsKey!0 a!3325 lt!140194 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65587 (not res!146667)) b!284062))

(assert (= (and b!284062 res!146668) b!284063))

(assert (=> d!65587 m!298533))

(declare-fun m!299101 () Bool)

(assert (=> b!284063 m!299101))

(assert (=> b!283655 d!65587))

(declare-fun b!284064 () Bool)

(declare-fun e!180238 () SeekEntryResult!1871)

(declare-fun e!180237 () SeekEntryResult!1871)

(assert (=> b!284064 (= e!180238 e!180237)))

(declare-fun lt!140385 () (_ BitVec 64))

(declare-fun lt!140386 () SeekEntryResult!1871)

(assert (=> b!284064 (= lt!140385 (select (arr!6713 a!3325) (index!9656 lt!140386)))))

(declare-fun c!46253 () Bool)

(assert (=> b!284064 (= c!46253 (= lt!140385 (select (arr!6713 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!284065 () Bool)

(assert (=> b!284065 (= e!180237 (Found!1871 (index!9656 lt!140386)))))

(declare-fun d!65589 () Bool)

(declare-fun lt!140384 () SeekEntryResult!1871)

(assert (=> d!65589 (and (or (is-Undefined!1871 lt!140384) (not (is-Found!1871 lt!140384)) (and (bvsge (index!9655 lt!140384) #b00000000000000000000000000000000) (bvslt (index!9655 lt!140384) (size!7065 a!3325)))) (or (is-Undefined!1871 lt!140384) (is-Found!1871 lt!140384) (not (is-MissingZero!1871 lt!140384)) (and (bvsge (index!9654 lt!140384) #b00000000000000000000000000000000) (bvslt (index!9654 lt!140384) (size!7065 a!3325)))) (or (is-Undefined!1871 lt!140384) (is-Found!1871 lt!140384) (is-MissingZero!1871 lt!140384) (not (is-MissingVacant!1871 lt!140384)) (and (bvsge (index!9657 lt!140384) #b00000000000000000000000000000000) (bvslt (index!9657 lt!140384) (size!7065 a!3325)))) (or (is-Undefined!1871 lt!140384) (ite (is-Found!1871 lt!140384) (= (select (arr!6713 a!3325) (index!9655 lt!140384)) (select (arr!6713 a!3325) #b00000000000000000000000000000000)) (ite (is-MissingZero!1871 lt!140384) (= (select (arr!6713 a!3325) (index!9654 lt!140384)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1871 lt!140384) (= (select (arr!6713 a!3325) (index!9657 lt!140384)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65589 (= lt!140384 e!180238)))

(declare-fun c!46251 () Bool)

(assert (=> d!65589 (= c!46251 (and (is-Intermediate!1871 lt!140386) (undefined!2683 lt!140386)))))

(assert (=> d!65589 (= lt!140386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!6713 a!3325) #b00000000000000000000000000000000) mask!3868) (select (arr!6713 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(assert (=> d!65589 (validMask!0 mask!3868)))

(assert (=> d!65589 (= (seekEntryOrOpen!0 (select (arr!6713 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) lt!140384)))

(declare-fun e!180239 () SeekEntryResult!1871)

(declare-fun b!284066 () Bool)

(assert (=> b!284066 (= e!180239 (seekKeyOrZeroReturnVacant!0 (x!27861 lt!140386) (index!9656 lt!140386) (index!9656 lt!140386) (select (arr!6713 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868))))

(declare-fun b!284067 () Bool)

(assert (=> b!284067 (= e!180239 (MissingZero!1871 (index!9656 lt!140386)))))

(declare-fun b!284068 () Bool)

(assert (=> b!284068 (= e!180238 Undefined!1871)))

(declare-fun b!284069 () Bool)

(declare-fun c!46252 () Bool)

(assert (=> b!284069 (= c!46252 (= lt!140385 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!284069 (= e!180237 e!180239)))

(assert (= (and d!65589 c!46251) b!284068))

(assert (= (and d!65589 (not c!46251)) b!284064))

(assert (= (and b!284064 c!46253) b!284065))

(assert (= (and b!284064 (not c!46253)) b!284069))

(assert (= (and b!284069 c!46252) b!284067))

(assert (= (and b!284069 (not c!46252)) b!284066))

(declare-fun m!299109 () Bool)

(assert (=> b!284064 m!299109))

(assert (=> d!65589 m!298533))

(declare-fun m!299111 () Bool)

(assert (=> d!65589 m!299111))

(assert (=> d!65589 m!299111))

(assert (=> d!65589 m!298533))

(declare-fun m!299113 () Bool)

(assert (=> d!65589 m!299113))

(declare-fun m!299115 () Bool)

(assert (=> d!65589 m!299115))

(declare-fun m!299117 () Bool)

(assert (=> d!65589 m!299117))

(assert (=> d!65589 m!298389))

(declare-fun m!299119 () Bool)

(assert (=> d!65589 m!299119))

(assert (=> b!284066 m!298533))

(declare-fun m!299121 () Bool)

(assert (=> b!284066 m!299121))

(assert (=> b!283655 d!65589))

(declare-fun b!284070 () Bool)

(declare-fun e!180242 () Bool)

(assert (=> b!284070 (= e!180242 (contains!1994 (ite c!46105 (Cons!4517 (select (arr!6713 a!3325) #b00000000000000000000000000000000) Nil!4518) Nil!4518) (select (arr!6713 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!25525 () Bool)

(declare-fun c!46254 () Bool)

(declare-fun call!25528 () Bool)

(assert (=> bm!25525 (= call!25528 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!46254 (Cons!4517 (select (arr!6713 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!46105 (Cons!4517 (select (arr!6713 a!3325) #b00000000000000000000000000000000) Nil!4518) Nil!4518)) (ite c!46105 (Cons!4517 (select (arr!6713 a!3325) #b00000000000000000000000000000000) Nil!4518) Nil!4518))))))

(declare-fun b!284072 () Bool)

(declare-fun e!180243 () Bool)

(assert (=> b!284072 (= e!180243 call!25528)))

(declare-fun b!284073 () Bool)

(declare-fun e!180240 () Bool)

(assert (=> b!284073 (= e!180240 e!180243)))

(assert (=> b!284073 (= c!46254 (validKeyInArray!0 (select (arr!6713 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!284074 () Bool)

(assert (=> b!284074 (= e!180243 call!25528)))

(declare-fun d!65591 () Bool)

(declare-fun res!146671 () Bool)

(declare-fun e!180241 () Bool)

(assert (=> d!65591 (=> res!146671 e!180241)))

(assert (=> d!65591 (= res!146671 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7065 a!3325)))))

(assert (=> d!65591 (= (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46105 (Cons!4517 (select (arr!6713 a!3325) #b00000000000000000000000000000000) Nil!4518) Nil!4518)) e!180241)))

(declare-fun b!284071 () Bool)

(assert (=> b!284071 (= e!180241 e!180240)))

(declare-fun res!146670 () Bool)

(assert (=> b!284071 (=> (not res!146670) (not e!180240))))

(assert (=> b!284071 (= res!146670 (not e!180242))))

(declare-fun res!146669 () Bool)

(assert (=> b!284071 (=> (not res!146669) (not e!180242))))

(assert (=> b!284071 (= res!146669 (validKeyInArray!0 (select (arr!6713 a!3325) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!65591 (not res!146671)) b!284071))

(assert (= (and b!284071 res!146669) b!284070))

(assert (= (and b!284071 res!146670) b!284073))

(assert (= (and b!284073 c!46254) b!284072))

(assert (= (and b!284073 (not c!46254)) b!284074))

(assert (= (or b!284072 b!284074) bm!25525))

(assert (=> b!284070 m!298941))

(assert (=> b!284070 m!298941))

(declare-fun m!299123 () Bool)

(assert (=> b!284070 m!299123))

(assert (=> bm!25525 m!298941))

(declare-fun m!299125 () Bool)

(assert (=> bm!25525 m!299125))

(assert (=> b!284073 m!298941))

(assert (=> b!284073 m!298941))

(assert (=> b!284073 m!298943))

(assert (=> b!284071 m!298941))

(assert (=> b!284071 m!298941))

(assert (=> b!284071 m!298943))

(assert (=> bm!25499 d!65591))

(assert (=> d!65435 d!65439))

(declare-fun d!65593 () Bool)

(assert (=> d!65593 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(assert (=> d!65593 true))

(declare-fun _$72!101 () Unit!9026)

(assert (=> d!65593 (= (choose!38 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26) _$72!101)))

(declare-fun bs!10085 () Bool)

(assert (= bs!10085 d!65593))

(assert (=> bs!10085 m!298411))

(assert (=> d!65435 d!65593))

(assert (=> d!65435 d!65383))

(assert (=> b!283654 d!65529))

(assert (=> b!283623 d!65529))

(push 1)

(assert (not b!284040))

(assert (not b!283943))

(assert (not d!65593))

(assert (not b!284043))

(assert (not b!284053))

(assert (not b!283969))

(assert (not d!65537))

(assert (not b!283841))

(assert (not d!65467))

(assert (not b!284066))

(assert (not b!283972))

(assert (not d!65559))

(assert (not bm!25525))

(assert (not d!65541))

(assert (not b!284070))

(assert (not bm!25523))

(assert (not b!283944))

(assert (not d!65501))

(assert (not b!284056))

(assert (not b!284031))

(assert (not d!65589))

(assert (not d!65477))

(assert (not bm!25522))

(assert (not d!65531))

(assert (not b!284039))

(assert (not b!283946))

(assert (not d!65573))

(assert (not b!284071))

(assert (not d!65521))

(assert (not b!284024))

(assert (not b!283886))

(assert (not d!65551))

(assert (not b!283955))

(assert (not b!284054))

(assert (not bm!25519))

(assert (not d!65483))

(assert (not d!65515))

(assert (not bm!25518))

(assert (not d!65503))

(assert (not d!65585))

(assert (not bm!25521))

(assert (not b!283979))

(assert (not b!284073))

(assert (not b!284007))

(assert (not b!283990))

(assert (not b!283930))

(assert (not d!65539))

(assert (not b!283887))

(assert (not b!283975))

(assert (not b!283951))

(assert (not b!283863))

(assert (not b!283968))

(assert (not b!284063))

(check-sat)

(pop 1)

(push 1)

(check-sat)

