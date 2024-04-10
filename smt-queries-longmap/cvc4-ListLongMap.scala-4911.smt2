; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67714 () Bool)

(assert start!67714)

(declare-datatypes ((array!42754 0))(
  ( (array!42755 (arr!20465 (Array (_ BitVec 32) (_ BitVec 64))) (size!20886 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42754)

(declare-fun b!785345 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!436608 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8065 0))(
  ( (MissingZero!8065 (index!34628 (_ BitVec 32))) (Found!8065 (index!34629 (_ BitVec 32))) (Intermediate!8065 (undefined!8877 Bool) (index!34630 (_ BitVec 32)) (x!65573 (_ BitVec 32))) (Undefined!8065) (MissingVacant!8065 (index!34631 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42754 (_ BitVec 32)) SeekEntryResult!8065)

(assert (=> b!785345 (= e!436608 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20465 a!3186) j!159) a!3186 mask!3328) (Found!8065 j!159)))))

(declare-fun b!785346 () Bool)

(declare-fun res!531586 () Bool)

(declare-fun e!436610 () Bool)

(assert (=> b!785346 (=> (not res!531586) (not e!436610))))

(declare-fun lt!350167 () (_ BitVec 64))

(declare-fun lt!350159 () array!42754)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42754 (_ BitVec 32)) SeekEntryResult!8065)

(assert (=> b!785346 (= res!531586 (= (seekEntryOrOpen!0 lt!350167 lt!350159 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350167 lt!350159 mask!3328)))))

(declare-fun b!785347 () Bool)

(declare-fun res!531597 () Bool)

(declare-fun e!436616 () Bool)

(assert (=> b!785347 (=> (not res!531597) (not e!436616))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785347 (= res!531597 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20886 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20886 a!3186))))))

(declare-fun lt!350166 () SeekEntryResult!8065)

(declare-fun e!436613 () Bool)

(declare-fun b!785349 () Bool)

(assert (=> b!785349 (= e!436613 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20465 a!3186) j!159) a!3186 mask!3328) lt!350166))))

(declare-fun b!785350 () Bool)

(declare-datatypes ((Unit!27148 0))(
  ( (Unit!27149) )
))
(declare-fun e!436605 () Unit!27148)

(declare-fun Unit!27150 () Unit!27148)

(assert (=> b!785350 (= e!436605 Unit!27150)))

(assert (=> b!785350 false))

(declare-fun b!785351 () Bool)

(declare-fun lt!350164 () SeekEntryResult!8065)

(declare-fun lt!350161 () SeekEntryResult!8065)

(assert (=> b!785351 (= e!436610 (= lt!350164 lt!350161))))

(declare-fun b!785352 () Bool)

(declare-fun res!531601 () Bool)

(declare-fun e!436609 () Bool)

(assert (=> b!785352 (=> (not res!531601) (not e!436609))))

(assert (=> b!785352 (= res!531601 e!436608)))

(declare-fun c!87289 () Bool)

(assert (=> b!785352 (= c!87289 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785353 () Bool)

(declare-fun e!436607 () Bool)

(assert (=> b!785353 (= e!436607 true)))

(assert (=> b!785353 e!436610))

(declare-fun res!531599 () Bool)

(assert (=> b!785353 (=> (not res!531599) (not e!436610))))

(declare-fun lt!350165 () (_ BitVec 64))

(assert (=> b!785353 (= res!531599 (= lt!350165 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350158 () Unit!27148)

(assert (=> b!785353 (= lt!350158 e!436605)))

(declare-fun c!87288 () Bool)

(assert (=> b!785353 (= c!87288 (= lt!350165 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785354 () Bool)

(declare-fun e!436614 () Bool)

(assert (=> b!785354 (= e!436614 e!436616)))

(declare-fun res!531595 () Bool)

(assert (=> b!785354 (=> (not res!531595) (not e!436616))))

(declare-fun lt!350162 () SeekEntryResult!8065)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785354 (= res!531595 (or (= lt!350162 (MissingZero!8065 i!1173)) (= lt!350162 (MissingVacant!8065 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!785354 (= lt!350162 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!785355 () Bool)

(declare-fun res!531588 () Bool)

(assert (=> b!785355 (=> (not res!531588) (not e!436616))))

(declare-datatypes ((List!14467 0))(
  ( (Nil!14464) (Cons!14463 (h!15586 (_ BitVec 64)) (t!20782 List!14467)) )
))
(declare-fun arrayNoDuplicates!0 (array!42754 (_ BitVec 32) List!14467) Bool)

(assert (=> b!785355 (= res!531588 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14464))))

(declare-fun b!785356 () Bool)

(declare-fun res!531589 () Bool)

(assert (=> b!785356 (=> (not res!531589) (not e!436614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785356 (= res!531589 (validKeyInArray!0 k!2102))))

(declare-fun b!785357 () Bool)

(declare-fun res!531591 () Bool)

(assert (=> b!785357 (=> (not res!531591) (not e!436609))))

(assert (=> b!785357 (= res!531591 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20465 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785358 () Bool)

(declare-fun e!436612 () Bool)

(assert (=> b!785358 (= e!436609 e!436612)))

(declare-fun res!531590 () Bool)

(assert (=> b!785358 (=> (not res!531590) (not e!436612))))

(declare-fun lt!350163 () SeekEntryResult!8065)

(declare-fun lt!350157 () SeekEntryResult!8065)

(assert (=> b!785358 (= res!531590 (= lt!350163 lt!350157))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42754 (_ BitVec 32)) SeekEntryResult!8065)

(assert (=> b!785358 (= lt!350157 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350167 lt!350159 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785358 (= lt!350163 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350167 mask!3328) lt!350167 lt!350159 mask!3328))))

(assert (=> b!785358 (= lt!350167 (select (store (arr!20465 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!785358 (= lt!350159 (array!42755 (store (arr!20465 a!3186) i!1173 k!2102) (size!20886 a!3186)))))

(declare-fun b!785359 () Bool)

(declare-fun res!531585 () Bool)

(assert (=> b!785359 (=> (not res!531585) (not e!436616))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42754 (_ BitVec 32)) Bool)

(assert (=> b!785359 (= res!531585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!531584 () Bool)

(assert (=> start!67714 (=> (not res!531584) (not e!436614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67714 (= res!531584 (validMask!0 mask!3328))))

(assert (=> start!67714 e!436614))

(assert (=> start!67714 true))

(declare-fun array_inv!16261 (array!42754) Bool)

(assert (=> start!67714 (array_inv!16261 a!3186)))

(declare-fun b!785348 () Bool)

(declare-fun res!531594 () Bool)

(assert (=> b!785348 (=> (not res!531594) (not e!436614))))

(declare-fun arrayContainsKey!0 (array!42754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785348 (= res!531594 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785360 () Bool)

(declare-fun res!531592 () Bool)

(assert (=> b!785360 (=> (not res!531592) (not e!436614))))

(assert (=> b!785360 (= res!531592 (validKeyInArray!0 (select (arr!20465 a!3186) j!159)))))

(declare-fun b!785361 () Bool)

(declare-fun Unit!27151 () Unit!27148)

(assert (=> b!785361 (= e!436605 Unit!27151)))

(declare-fun b!785362 () Bool)

(declare-fun res!531596 () Bool)

(assert (=> b!785362 (=> (not res!531596) (not e!436614))))

(assert (=> b!785362 (= res!531596 (and (= (size!20886 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20886 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20886 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785363 () Bool)

(assert (=> b!785363 (= e!436616 e!436609)))

(declare-fun res!531587 () Bool)

(assert (=> b!785363 (=> (not res!531587) (not e!436609))))

(declare-fun lt!350168 () SeekEntryResult!8065)

(assert (=> b!785363 (= res!531587 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20465 a!3186) j!159) mask!3328) (select (arr!20465 a!3186) j!159) a!3186 mask!3328) lt!350168))))

(assert (=> b!785363 (= lt!350168 (Intermediate!8065 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785364 () Bool)

(assert (=> b!785364 (= e!436608 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20465 a!3186) j!159) a!3186 mask!3328) lt!350168))))

(declare-fun b!785365 () Bool)

(declare-fun e!436606 () Bool)

(assert (=> b!785365 (= e!436612 (not e!436606))))

(declare-fun res!531598 () Bool)

(assert (=> b!785365 (=> res!531598 e!436606)))

(assert (=> b!785365 (= res!531598 (or (not (is-Intermediate!8065 lt!350157)) (bvslt x!1131 (x!65573 lt!350157)) (not (= x!1131 (x!65573 lt!350157))) (not (= index!1321 (index!34630 lt!350157)))))))

(assert (=> b!785365 e!436613))

(declare-fun res!531593 () Bool)

(assert (=> b!785365 (=> (not res!531593) (not e!436613))))

(assert (=> b!785365 (= res!531593 (= lt!350164 lt!350166))))

(assert (=> b!785365 (= lt!350166 (Found!8065 j!159))))

(assert (=> b!785365 (= lt!350164 (seekEntryOrOpen!0 (select (arr!20465 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!785365 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350160 () Unit!27148)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42754 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27148)

(assert (=> b!785365 (= lt!350160 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785366 () Bool)

(declare-fun e!436611 () Bool)

(assert (=> b!785366 (= e!436611 e!436607)))

(declare-fun res!531600 () Bool)

(assert (=> b!785366 (=> res!531600 e!436607)))

(assert (=> b!785366 (= res!531600 (= lt!350165 lt!350167))))

(assert (=> b!785366 (= lt!350165 (select (store (arr!20465 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!785367 () Bool)

(assert (=> b!785367 (= e!436606 e!436611)))

(declare-fun res!531602 () Bool)

(assert (=> b!785367 (=> res!531602 e!436611)))

(assert (=> b!785367 (= res!531602 (not (= lt!350161 lt!350166)))))

(assert (=> b!785367 (= lt!350161 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20465 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!67714 res!531584) b!785362))

(assert (= (and b!785362 res!531596) b!785360))

(assert (= (and b!785360 res!531592) b!785356))

(assert (= (and b!785356 res!531589) b!785348))

(assert (= (and b!785348 res!531594) b!785354))

(assert (= (and b!785354 res!531595) b!785359))

(assert (= (and b!785359 res!531585) b!785355))

(assert (= (and b!785355 res!531588) b!785347))

(assert (= (and b!785347 res!531597) b!785363))

(assert (= (and b!785363 res!531587) b!785357))

(assert (= (and b!785357 res!531591) b!785352))

(assert (= (and b!785352 c!87289) b!785364))

(assert (= (and b!785352 (not c!87289)) b!785345))

(assert (= (and b!785352 res!531601) b!785358))

(assert (= (and b!785358 res!531590) b!785365))

(assert (= (and b!785365 res!531593) b!785349))

(assert (= (and b!785365 (not res!531598)) b!785367))

(assert (= (and b!785367 (not res!531602)) b!785366))

(assert (= (and b!785366 (not res!531600)) b!785353))

(assert (= (and b!785353 c!87288) b!785350))

(assert (= (and b!785353 (not c!87288)) b!785361))

(assert (= (and b!785353 res!531599) b!785346))

(assert (= (and b!785346 res!531586) b!785351))

(declare-fun m!727441 () Bool)

(assert (=> b!785346 m!727441))

(declare-fun m!727443 () Bool)

(assert (=> b!785346 m!727443))

(declare-fun m!727445 () Bool)

(assert (=> b!785356 m!727445))

(declare-fun m!727447 () Bool)

(assert (=> b!785357 m!727447))

(declare-fun m!727449 () Bool)

(assert (=> b!785348 m!727449))

(declare-fun m!727451 () Bool)

(assert (=> b!785360 m!727451))

(assert (=> b!785360 m!727451))

(declare-fun m!727453 () Bool)

(assert (=> b!785360 m!727453))

(assert (=> b!785349 m!727451))

(assert (=> b!785349 m!727451))

(declare-fun m!727455 () Bool)

(assert (=> b!785349 m!727455))

(declare-fun m!727457 () Bool)

(assert (=> start!67714 m!727457))

(declare-fun m!727459 () Bool)

(assert (=> start!67714 m!727459))

(assert (=> b!785365 m!727451))

(assert (=> b!785365 m!727451))

(declare-fun m!727461 () Bool)

(assert (=> b!785365 m!727461))

(declare-fun m!727463 () Bool)

(assert (=> b!785365 m!727463))

(declare-fun m!727465 () Bool)

(assert (=> b!785365 m!727465))

(declare-fun m!727467 () Bool)

(assert (=> b!785354 m!727467))

(declare-fun m!727469 () Bool)

(assert (=> b!785359 m!727469))

(assert (=> b!785363 m!727451))

(assert (=> b!785363 m!727451))

(declare-fun m!727471 () Bool)

(assert (=> b!785363 m!727471))

(assert (=> b!785363 m!727471))

(assert (=> b!785363 m!727451))

(declare-fun m!727473 () Bool)

(assert (=> b!785363 m!727473))

(assert (=> b!785364 m!727451))

(assert (=> b!785364 m!727451))

(declare-fun m!727475 () Bool)

(assert (=> b!785364 m!727475))

(declare-fun m!727477 () Bool)

(assert (=> b!785366 m!727477))

(declare-fun m!727479 () Bool)

(assert (=> b!785366 m!727479))

(assert (=> b!785367 m!727451))

(assert (=> b!785367 m!727451))

(declare-fun m!727481 () Bool)

(assert (=> b!785367 m!727481))

(assert (=> b!785358 m!727477))

(declare-fun m!727483 () Bool)

(assert (=> b!785358 m!727483))

(declare-fun m!727485 () Bool)

(assert (=> b!785358 m!727485))

(declare-fun m!727487 () Bool)

(assert (=> b!785358 m!727487))

(assert (=> b!785358 m!727485))

(declare-fun m!727489 () Bool)

(assert (=> b!785358 m!727489))

(assert (=> b!785345 m!727451))

(assert (=> b!785345 m!727451))

(assert (=> b!785345 m!727481))

(declare-fun m!727491 () Bool)

(assert (=> b!785355 m!727491))

(push 1)

