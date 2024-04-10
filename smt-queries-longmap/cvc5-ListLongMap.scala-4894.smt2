; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67542 () Bool)

(assert start!67542)

(declare-fun res!528600 () Bool)

(declare-fun e!434623 () Bool)

(assert (=> start!67542 (=> (not res!528600) (not e!434623))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67542 (= res!528600 (validMask!0 mask!3328))))

(assert (=> start!67542 e!434623))

(assert (=> start!67542 true))

(declare-datatypes ((array!42645 0))(
  ( (array!42646 (arr!20412 (Array (_ BitVec 32) (_ BitVec 64))) (size!20833 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42645)

(declare-fun array_inv!16208 (array!42645) Bool)

(assert (=> start!67542 (array_inv!16208 a!3186)))

(declare-fun b!781384 () Bool)

(declare-fun res!528594 () Bool)

(assert (=> b!781384 (=> (not res!528594) (not e!434623))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781384 (= res!528594 (validKeyInArray!0 (select (arr!20412 a!3186) j!159)))))

(declare-fun b!781385 () Bool)

(declare-datatypes ((Unit!26936 0))(
  ( (Unit!26937) )
))
(declare-fun e!434621 () Unit!26936)

(declare-fun Unit!26938 () Unit!26936)

(assert (=> b!781385 (= e!434621 Unit!26938)))

(assert (=> b!781385 false))

(declare-fun b!781386 () Bool)

(declare-fun Unit!26939 () Unit!26936)

(assert (=> b!781386 (= e!434621 Unit!26939)))

(declare-fun b!781387 () Bool)

(declare-fun res!528601 () Bool)

(declare-fun e!434626 () Bool)

(assert (=> b!781387 (=> (not res!528601) (not e!434626))))

(declare-datatypes ((List!14414 0))(
  ( (Nil!14411) (Cons!14410 (h!15530 (_ BitVec 64)) (t!20729 List!14414)) )
))
(declare-fun arrayNoDuplicates!0 (array!42645 (_ BitVec 32) List!14414) Bool)

(assert (=> b!781387 (= res!528601 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14411))))

(declare-fun b!781388 () Bool)

(declare-fun res!528589 () Bool)

(assert (=> b!781388 (=> (not res!528589) (not e!434623))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!781388 (= res!528589 (validKeyInArray!0 k!2102))))

(declare-fun b!781389 () Bool)

(declare-fun e!434622 () Bool)

(declare-fun e!434619 () Bool)

(assert (=> b!781389 (= e!434622 (not e!434619))))

(declare-fun res!528587 () Bool)

(assert (=> b!781389 (=> res!528587 e!434619)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8012 0))(
  ( (MissingZero!8012 (index!34416 (_ BitVec 32))) (Found!8012 (index!34417 (_ BitVec 32))) (Intermediate!8012 (undefined!8824 Bool) (index!34418 (_ BitVec 32)) (x!65375 (_ BitVec 32))) (Undefined!8012) (MissingVacant!8012 (index!34419 (_ BitVec 32))) )
))
(declare-fun lt!348204 () SeekEntryResult!8012)

(assert (=> b!781389 (= res!528587 (or (not (is-Intermediate!8012 lt!348204)) (bvslt x!1131 (x!65375 lt!348204)) (not (= x!1131 (x!65375 lt!348204))) (not (= index!1321 (index!34418 lt!348204)))))))

(declare-fun e!434625 () Bool)

(assert (=> b!781389 e!434625))

(declare-fun res!528592 () Bool)

(assert (=> b!781389 (=> (not res!528592) (not e!434625))))

(declare-fun lt!348202 () SeekEntryResult!8012)

(declare-fun lt!348209 () SeekEntryResult!8012)

(assert (=> b!781389 (= res!528592 (= lt!348202 lt!348209))))

(assert (=> b!781389 (= lt!348209 (Found!8012 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42645 (_ BitVec 32)) SeekEntryResult!8012)

(assert (=> b!781389 (= lt!348202 (seekEntryOrOpen!0 (select (arr!20412 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42645 (_ BitVec 32)) Bool)

(assert (=> b!781389 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348201 () Unit!26936)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42645 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26936)

(assert (=> b!781389 (= lt!348201 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!781390 () Bool)

(declare-fun e!434620 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42645 (_ BitVec 32)) SeekEntryResult!8012)

(assert (=> b!781390 (= e!434620 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20412 a!3186) j!159) a!3186 mask!3328) (Found!8012 j!159)))))

(declare-fun b!781391 () Bool)

(declare-fun res!528595 () Bool)

(assert (=> b!781391 (=> res!528595 e!434619)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!348203 () (_ BitVec 64))

(assert (=> b!781391 (= res!528595 (= (select (store (arr!20412 a!3186) i!1173 k!2102) index!1321) lt!348203))))

(declare-fun b!781392 () Bool)

(declare-fun res!528588 () Bool)

(declare-fun e!434627 () Bool)

(assert (=> b!781392 (=> (not res!528588) (not e!434627))))

(assert (=> b!781392 (= res!528588 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20412 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781393 () Bool)

(assert (=> b!781393 (= e!434627 e!434622)))

(declare-fun res!528597 () Bool)

(assert (=> b!781393 (=> (not res!528597) (not e!434622))))

(declare-fun lt!348205 () SeekEntryResult!8012)

(assert (=> b!781393 (= res!528597 (= lt!348205 lt!348204))))

(declare-fun lt!348206 () array!42645)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42645 (_ BitVec 32)) SeekEntryResult!8012)

(assert (=> b!781393 (= lt!348204 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348203 lt!348206 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781393 (= lt!348205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348203 mask!3328) lt!348203 lt!348206 mask!3328))))

(assert (=> b!781393 (= lt!348203 (select (store (arr!20412 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!781393 (= lt!348206 (array!42646 (store (arr!20412 a!3186) i!1173 k!2102) (size!20833 a!3186)))))

(declare-fun b!781394 () Bool)

(assert (=> b!781394 (= e!434623 e!434626)))

(declare-fun res!528591 () Bool)

(assert (=> b!781394 (=> (not res!528591) (not e!434626))))

(declare-fun lt!348200 () SeekEntryResult!8012)

(assert (=> b!781394 (= res!528591 (or (= lt!348200 (MissingZero!8012 i!1173)) (= lt!348200 (MissingVacant!8012 i!1173))))))

(assert (=> b!781394 (= lt!348200 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!781395 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!781395 (= e!434625 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20412 a!3186) j!159) a!3186 mask!3328) lt!348209))))

(declare-fun b!781396 () Bool)

(declare-fun res!528602 () Bool)

(assert (=> b!781396 (=> (not res!528602) (not e!434626))))

(assert (=> b!781396 (= res!528602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!781397 () Bool)

(declare-fun res!528598 () Bool)

(assert (=> b!781397 (=> (not res!528598) (not e!434627))))

(assert (=> b!781397 (= res!528598 e!434620)))

(declare-fun c!86806 () Bool)

(assert (=> b!781397 (= c!86806 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!781398 () Bool)

(assert (=> b!781398 (= e!434626 e!434627)))

(declare-fun res!528599 () Bool)

(assert (=> b!781398 (=> (not res!528599) (not e!434627))))

(declare-fun lt!348208 () SeekEntryResult!8012)

(assert (=> b!781398 (= res!528599 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20412 a!3186) j!159) mask!3328) (select (arr!20412 a!3186) j!159) a!3186 mask!3328) lt!348208))))

(assert (=> b!781398 (= lt!348208 (Intermediate!8012 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!781399 () Bool)

(assert (=> b!781399 (= e!434620 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20412 a!3186) j!159) a!3186 mask!3328) lt!348208))))

(declare-fun b!781400 () Bool)

(assert (=> b!781400 (= e!434619 true)))

(assert (=> b!781400 (= (select (store (arr!20412 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348207 () Unit!26936)

(assert (=> b!781400 (= lt!348207 e!434621)))

(declare-fun c!86805 () Bool)

(assert (=> b!781400 (= c!86805 (= (select (store (arr!20412 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!781401 () Bool)

(declare-fun res!528590 () Bool)

(assert (=> b!781401 (=> res!528590 e!434619)))

(assert (=> b!781401 (= res!528590 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20412 a!3186) j!159) a!3186 mask!3328) lt!348209)))))

(declare-fun b!781402 () Bool)

(declare-fun res!528593 () Bool)

(assert (=> b!781402 (=> (not res!528593) (not e!434623))))

(assert (=> b!781402 (= res!528593 (and (= (size!20833 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20833 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20833 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!781403 () Bool)

(declare-fun res!528596 () Bool)

(assert (=> b!781403 (=> (not res!528596) (not e!434626))))

(assert (=> b!781403 (= res!528596 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20833 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20833 a!3186))))))

(declare-fun b!781404 () Bool)

(declare-fun res!528586 () Bool)

(assert (=> b!781404 (=> (not res!528586) (not e!434623))))

(declare-fun arrayContainsKey!0 (array!42645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781404 (= res!528586 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!67542 res!528600) b!781402))

(assert (= (and b!781402 res!528593) b!781384))

(assert (= (and b!781384 res!528594) b!781388))

(assert (= (and b!781388 res!528589) b!781404))

(assert (= (and b!781404 res!528586) b!781394))

(assert (= (and b!781394 res!528591) b!781396))

(assert (= (and b!781396 res!528602) b!781387))

(assert (= (and b!781387 res!528601) b!781403))

(assert (= (and b!781403 res!528596) b!781398))

(assert (= (and b!781398 res!528599) b!781392))

(assert (= (and b!781392 res!528588) b!781397))

(assert (= (and b!781397 c!86806) b!781399))

(assert (= (and b!781397 (not c!86806)) b!781390))

(assert (= (and b!781397 res!528598) b!781393))

(assert (= (and b!781393 res!528597) b!781389))

(assert (= (and b!781389 res!528592) b!781395))

(assert (= (and b!781389 (not res!528587)) b!781401))

(assert (= (and b!781401 (not res!528590)) b!781391))

(assert (= (and b!781391 (not res!528595)) b!781400))

(assert (= (and b!781400 c!86805) b!781385))

(assert (= (and b!781400 (not c!86805)) b!781386))

(declare-fun m!724427 () Bool)

(assert (=> b!781388 m!724427))

(declare-fun m!724429 () Bool)

(assert (=> b!781393 m!724429))

(declare-fun m!724431 () Bool)

(assert (=> b!781393 m!724431))

(declare-fun m!724433 () Bool)

(assert (=> b!781393 m!724433))

(declare-fun m!724435 () Bool)

(assert (=> b!781393 m!724435))

(assert (=> b!781393 m!724431))

(declare-fun m!724437 () Bool)

(assert (=> b!781393 m!724437))

(declare-fun m!724439 () Bool)

(assert (=> b!781384 m!724439))

(assert (=> b!781384 m!724439))

(declare-fun m!724441 () Bool)

(assert (=> b!781384 m!724441))

(assert (=> b!781400 m!724435))

(declare-fun m!724443 () Bool)

(assert (=> b!781400 m!724443))

(declare-fun m!724445 () Bool)

(assert (=> b!781392 m!724445))

(assert (=> b!781399 m!724439))

(assert (=> b!781399 m!724439))

(declare-fun m!724447 () Bool)

(assert (=> b!781399 m!724447))

(assert (=> b!781395 m!724439))

(assert (=> b!781395 m!724439))

(declare-fun m!724449 () Bool)

(assert (=> b!781395 m!724449))

(declare-fun m!724451 () Bool)

(assert (=> start!67542 m!724451))

(declare-fun m!724453 () Bool)

(assert (=> start!67542 m!724453))

(assert (=> b!781398 m!724439))

(assert (=> b!781398 m!724439))

(declare-fun m!724455 () Bool)

(assert (=> b!781398 m!724455))

(assert (=> b!781398 m!724455))

(assert (=> b!781398 m!724439))

(declare-fun m!724457 () Bool)

(assert (=> b!781398 m!724457))

(assert (=> b!781390 m!724439))

(assert (=> b!781390 m!724439))

(declare-fun m!724459 () Bool)

(assert (=> b!781390 m!724459))

(declare-fun m!724461 () Bool)

(assert (=> b!781404 m!724461))

(assert (=> b!781389 m!724439))

(assert (=> b!781389 m!724439))

(declare-fun m!724463 () Bool)

(assert (=> b!781389 m!724463))

(declare-fun m!724465 () Bool)

(assert (=> b!781389 m!724465))

(declare-fun m!724467 () Bool)

(assert (=> b!781389 m!724467))

(declare-fun m!724469 () Bool)

(assert (=> b!781387 m!724469))

(assert (=> b!781391 m!724435))

(assert (=> b!781391 m!724443))

(declare-fun m!724471 () Bool)

(assert (=> b!781394 m!724471))

(declare-fun m!724473 () Bool)

(assert (=> b!781396 m!724473))

(assert (=> b!781401 m!724439))

(assert (=> b!781401 m!724439))

(assert (=> b!781401 m!724459))

(push 1)

