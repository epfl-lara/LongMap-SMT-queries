; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67712 () Bool)

(assert start!67712)

(declare-fun b!785276 () Bool)

(declare-fun e!436571 () Bool)

(declare-fun e!436570 () Bool)

(assert (=> b!785276 (= e!436571 e!436570)))

(declare-fun res!531531 () Bool)

(assert (=> b!785276 (=> res!531531 e!436570)))

(declare-datatypes ((SeekEntryResult!8064 0))(
  ( (MissingZero!8064 (index!34624 (_ BitVec 32))) (Found!8064 (index!34625 (_ BitVec 32))) (Intermediate!8064 (undefined!8876 Bool) (index!34626 (_ BitVec 32)) (x!65572 (_ BitVec 32))) (Undefined!8064) (MissingVacant!8064 (index!34627 (_ BitVec 32))) )
))
(declare-fun lt!350131 () SeekEntryResult!8064)

(declare-fun lt!350124 () SeekEntryResult!8064)

(assert (=> b!785276 (= res!531531 (not (= lt!350131 lt!350124)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42752 0))(
  ( (array!42753 (arr!20464 (Array (_ BitVec 32) (_ BitVec 64))) (size!20885 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42752)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42752 (_ BitVec 32)) SeekEntryResult!8064)

(assert (=> b!785276 (= lt!350131 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20464 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785277 () Bool)

(declare-fun e!436579 () Bool)

(declare-fun e!436572 () Bool)

(assert (=> b!785277 (= e!436579 e!436572)))

(declare-fun res!531541 () Bool)

(assert (=> b!785277 (=> (not res!531541) (not e!436572))))

(declare-fun lt!350132 () SeekEntryResult!8064)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785277 (= res!531541 (or (= lt!350132 (MissingZero!8064 i!1173)) (= lt!350132 (MissingVacant!8064 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42752 (_ BitVec 32)) SeekEntryResult!8064)

(assert (=> b!785277 (= lt!350132 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!785278 () Bool)

(declare-datatypes ((Unit!27144 0))(
  ( (Unit!27145) )
))
(declare-fun e!436574 () Unit!27144)

(declare-fun Unit!27146 () Unit!27144)

(assert (=> b!785278 (= e!436574 Unit!27146)))

(declare-fun b!785279 () Bool)

(declare-fun res!531527 () Bool)

(declare-fun e!436576 () Bool)

(assert (=> b!785279 (=> (not res!531527) (not e!436576))))

(assert (=> b!785279 (= res!531527 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20464 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785281 () Bool)

(declare-fun e!436577 () Bool)

(assert (=> b!785281 (= e!436577 (not e!436571))))

(declare-fun res!531545 () Bool)

(assert (=> b!785281 (=> res!531545 e!436571)))

(declare-fun lt!350125 () SeekEntryResult!8064)

(get-info :version)

(assert (=> b!785281 (= res!531545 (or (not ((_ is Intermediate!8064) lt!350125)) (bvslt x!1131 (x!65572 lt!350125)) (not (= x!1131 (x!65572 lt!350125))) (not (= index!1321 (index!34626 lt!350125)))))))

(declare-fun e!436573 () Bool)

(assert (=> b!785281 e!436573))

(declare-fun res!531544 () Bool)

(assert (=> b!785281 (=> (not res!531544) (not e!436573))))

(declare-fun lt!350129 () SeekEntryResult!8064)

(assert (=> b!785281 (= res!531544 (= lt!350129 lt!350124))))

(assert (=> b!785281 (= lt!350124 (Found!8064 j!159))))

(assert (=> b!785281 (= lt!350129 (seekEntryOrOpen!0 (select (arr!20464 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42752 (_ BitVec 32)) Bool)

(assert (=> b!785281 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350127 () Unit!27144)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42752 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27144)

(assert (=> b!785281 (= lt!350127 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785282 () Bool)

(declare-fun lt!350121 () SeekEntryResult!8064)

(declare-fun e!436569 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42752 (_ BitVec 32)) SeekEntryResult!8064)

(assert (=> b!785282 (= e!436569 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20464 a!3186) j!159) a!3186 mask!3328) lt!350121))))

(declare-fun b!785283 () Bool)

(declare-fun res!531543 () Bool)

(assert (=> b!785283 (=> (not res!531543) (not e!436572))))

(assert (=> b!785283 (= res!531543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785284 () Bool)

(declare-fun res!531537 () Bool)

(assert (=> b!785284 (=> (not res!531537) (not e!436579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785284 (= res!531537 (validKeyInArray!0 (select (arr!20464 a!3186) j!159)))))

(declare-fun b!785285 () Bool)

(declare-fun e!436575 () Bool)

(assert (=> b!785285 (= e!436570 e!436575)))

(declare-fun res!531535 () Bool)

(assert (=> b!785285 (=> res!531535 e!436575)))

(declare-fun lt!350128 () (_ BitVec 64))

(declare-fun lt!350122 () (_ BitVec 64))

(assert (=> b!785285 (= res!531535 (= lt!350128 lt!350122))))

(assert (=> b!785285 (= lt!350128 (select (store (arr!20464 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!785286 () Bool)

(declare-fun res!531536 () Bool)

(assert (=> b!785286 (=> (not res!531536) (not e!436576))))

(assert (=> b!785286 (= res!531536 e!436569)))

(declare-fun c!87282 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785286 (= c!87282 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785287 () Bool)

(assert (=> b!785287 (= e!436569 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20464 a!3186) j!159) a!3186 mask!3328) (Found!8064 j!159)))))

(declare-fun b!785280 () Bool)

(declare-fun res!531530 () Bool)

(assert (=> b!785280 (=> (not res!531530) (not e!436579))))

(declare-fun arrayContainsKey!0 (array!42752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785280 (= res!531530 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!531529 () Bool)

(assert (=> start!67712 (=> (not res!531529) (not e!436579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67712 (= res!531529 (validMask!0 mask!3328))))

(assert (=> start!67712 e!436579))

(assert (=> start!67712 true))

(declare-fun array_inv!16260 (array!42752) Bool)

(assert (=> start!67712 (array_inv!16260 a!3186)))

(declare-fun b!785288 () Bool)

(declare-fun res!531533 () Bool)

(assert (=> b!785288 (=> (not res!531533) (not e!436572))))

(declare-datatypes ((List!14466 0))(
  ( (Nil!14463) (Cons!14462 (h!15585 (_ BitVec 64)) (t!20781 List!14466)) )
))
(declare-fun arrayNoDuplicates!0 (array!42752 (_ BitVec 32) List!14466) Bool)

(assert (=> b!785288 (= res!531533 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14463))))

(declare-fun b!785289 () Bool)

(declare-fun Unit!27147 () Unit!27144)

(assert (=> b!785289 (= e!436574 Unit!27147)))

(assert (=> b!785289 false))

(declare-fun b!785290 () Bool)

(assert (=> b!785290 (= e!436573 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20464 a!3186) j!159) a!3186 mask!3328) lt!350124))))

(declare-fun b!785291 () Bool)

(assert (=> b!785291 (= e!436576 e!436577)))

(declare-fun res!531538 () Bool)

(assert (=> b!785291 (=> (not res!531538) (not e!436577))))

(declare-fun lt!350123 () SeekEntryResult!8064)

(assert (=> b!785291 (= res!531538 (= lt!350123 lt!350125))))

(declare-fun lt!350130 () array!42752)

(assert (=> b!785291 (= lt!350125 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350122 lt!350130 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785291 (= lt!350123 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350122 mask!3328) lt!350122 lt!350130 mask!3328))))

(assert (=> b!785291 (= lt!350122 (select (store (arr!20464 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!785291 (= lt!350130 (array!42753 (store (arr!20464 a!3186) i!1173 k0!2102) (size!20885 a!3186)))))

(declare-fun b!785292 () Bool)

(assert (=> b!785292 (= e!436575 true)))

(declare-fun e!436578 () Bool)

(assert (=> b!785292 e!436578))

(declare-fun res!531540 () Bool)

(assert (=> b!785292 (=> (not res!531540) (not e!436578))))

(assert (=> b!785292 (= res!531540 (= lt!350128 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350126 () Unit!27144)

(assert (=> b!785292 (= lt!350126 e!436574)))

(declare-fun c!87283 () Bool)

(assert (=> b!785292 (= c!87283 (= lt!350128 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785293 () Bool)

(assert (=> b!785293 (= e!436578 (= lt!350129 lt!350131))))

(declare-fun b!785294 () Bool)

(declare-fun res!531532 () Bool)

(assert (=> b!785294 (=> (not res!531532) (not e!436579))))

(assert (=> b!785294 (= res!531532 (and (= (size!20885 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20885 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20885 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785295 () Bool)

(declare-fun res!531528 () Bool)

(assert (=> b!785295 (=> (not res!531528) (not e!436578))))

(assert (=> b!785295 (= res!531528 (= (seekEntryOrOpen!0 lt!350122 lt!350130 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350122 lt!350130 mask!3328)))))

(declare-fun b!785296 () Bool)

(assert (=> b!785296 (= e!436572 e!436576)))

(declare-fun res!531539 () Bool)

(assert (=> b!785296 (=> (not res!531539) (not e!436576))))

(assert (=> b!785296 (= res!531539 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20464 a!3186) j!159) mask!3328) (select (arr!20464 a!3186) j!159) a!3186 mask!3328) lt!350121))))

(assert (=> b!785296 (= lt!350121 (Intermediate!8064 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785297 () Bool)

(declare-fun res!531542 () Bool)

(assert (=> b!785297 (=> (not res!531542) (not e!436579))))

(assert (=> b!785297 (= res!531542 (validKeyInArray!0 k0!2102))))

(declare-fun b!785298 () Bool)

(declare-fun res!531534 () Bool)

(assert (=> b!785298 (=> (not res!531534) (not e!436572))))

(assert (=> b!785298 (= res!531534 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20885 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20885 a!3186))))))

(assert (= (and start!67712 res!531529) b!785294))

(assert (= (and b!785294 res!531532) b!785284))

(assert (= (and b!785284 res!531537) b!785297))

(assert (= (and b!785297 res!531542) b!785280))

(assert (= (and b!785280 res!531530) b!785277))

(assert (= (and b!785277 res!531541) b!785283))

(assert (= (and b!785283 res!531543) b!785288))

(assert (= (and b!785288 res!531533) b!785298))

(assert (= (and b!785298 res!531534) b!785296))

(assert (= (and b!785296 res!531539) b!785279))

(assert (= (and b!785279 res!531527) b!785286))

(assert (= (and b!785286 c!87282) b!785282))

(assert (= (and b!785286 (not c!87282)) b!785287))

(assert (= (and b!785286 res!531536) b!785291))

(assert (= (and b!785291 res!531538) b!785281))

(assert (= (and b!785281 res!531544) b!785290))

(assert (= (and b!785281 (not res!531545)) b!785276))

(assert (= (and b!785276 (not res!531531)) b!785285))

(assert (= (and b!785285 (not res!531535)) b!785292))

(assert (= (and b!785292 c!87283) b!785289))

(assert (= (and b!785292 (not c!87283)) b!785278))

(assert (= (and b!785292 res!531540) b!785295))

(assert (= (and b!785295 res!531528) b!785293))

(declare-fun m!727389 () Bool)

(assert (=> b!785283 m!727389))

(declare-fun m!727391 () Bool)

(assert (=> b!785276 m!727391))

(assert (=> b!785276 m!727391))

(declare-fun m!727393 () Bool)

(assert (=> b!785276 m!727393))

(assert (=> b!785296 m!727391))

(assert (=> b!785296 m!727391))

(declare-fun m!727395 () Bool)

(assert (=> b!785296 m!727395))

(assert (=> b!785296 m!727395))

(assert (=> b!785296 m!727391))

(declare-fun m!727397 () Bool)

(assert (=> b!785296 m!727397))

(declare-fun m!727399 () Bool)

(assert (=> b!785288 m!727399))

(assert (=> b!785284 m!727391))

(assert (=> b!785284 m!727391))

(declare-fun m!727401 () Bool)

(assert (=> b!785284 m!727401))

(declare-fun m!727403 () Bool)

(assert (=> b!785285 m!727403))

(declare-fun m!727405 () Bool)

(assert (=> b!785285 m!727405))

(declare-fun m!727407 () Bool)

(assert (=> start!67712 m!727407))

(declare-fun m!727409 () Bool)

(assert (=> start!67712 m!727409))

(assert (=> b!785290 m!727391))

(assert (=> b!785290 m!727391))

(declare-fun m!727411 () Bool)

(assert (=> b!785290 m!727411))

(assert (=> b!785287 m!727391))

(assert (=> b!785287 m!727391))

(assert (=> b!785287 m!727393))

(declare-fun m!727413 () Bool)

(assert (=> b!785280 m!727413))

(declare-fun m!727415 () Bool)

(assert (=> b!785291 m!727415))

(declare-fun m!727417 () Bool)

(assert (=> b!785291 m!727417))

(assert (=> b!785291 m!727403))

(declare-fun m!727419 () Bool)

(assert (=> b!785291 m!727419))

(assert (=> b!785291 m!727415))

(declare-fun m!727421 () Bool)

(assert (=> b!785291 m!727421))

(declare-fun m!727423 () Bool)

(assert (=> b!785279 m!727423))

(declare-fun m!727425 () Bool)

(assert (=> b!785297 m!727425))

(assert (=> b!785282 m!727391))

(assert (=> b!785282 m!727391))

(declare-fun m!727427 () Bool)

(assert (=> b!785282 m!727427))

(declare-fun m!727429 () Bool)

(assert (=> b!785295 m!727429))

(declare-fun m!727431 () Bool)

(assert (=> b!785295 m!727431))

(assert (=> b!785281 m!727391))

(assert (=> b!785281 m!727391))

(declare-fun m!727433 () Bool)

(assert (=> b!785281 m!727433))

(declare-fun m!727435 () Bool)

(assert (=> b!785281 m!727435))

(declare-fun m!727437 () Bool)

(assert (=> b!785281 m!727437))

(declare-fun m!727439 () Bool)

(assert (=> b!785277 m!727439))

(check-sat (not b!785287) (not b!785290) (not b!785291) (not b!785282) (not b!785280) (not b!785296) (not b!785277) (not b!785281) (not b!785284) (not b!785276) (not start!67712) (not b!785288) (not b!785283) (not b!785297) (not b!785295))
(check-sat)
