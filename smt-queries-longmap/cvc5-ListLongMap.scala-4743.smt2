; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65518 () Bool)

(assert start!65518)

(declare-fun b!747534 () Bool)

(declare-fun e!417352 () Bool)

(declare-fun e!417353 () Bool)

(assert (=> b!747534 (= e!417352 e!417353)))

(declare-fun res!504133 () Bool)

(assert (=> b!747534 (=> (not res!504133) (not e!417353))))

(declare-datatypes ((array!41691 0))(
  ( (array!41692 (arr!19959 (Array (_ BitVec 32) (_ BitVec 64))) (size!20380 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41691)

(declare-datatypes ((SeekEntryResult!7559 0))(
  ( (MissingZero!7559 (index!32604 (_ BitVec 32))) (Found!7559 (index!32605 (_ BitVec 32))) (Intermediate!7559 (undefined!8371 Bool) (index!32606 (_ BitVec 32)) (x!63549 (_ BitVec 32))) (Undefined!7559) (MissingVacant!7559 (index!32607 (_ BitVec 32))) )
))
(declare-fun lt!332283 () SeekEntryResult!7559)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41691 (_ BitVec 32)) SeekEntryResult!7559)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747534 (= res!504133 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19959 a!3186) j!159) mask!3328) (select (arr!19959 a!3186) j!159) a!3186 mask!3328) lt!332283))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747534 (= lt!332283 (Intermediate!7559 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747535 () Bool)

(declare-fun e!417356 () Bool)

(declare-fun lt!332278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747535 (= e!417356 (validKeyInArray!0 lt!332278))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!747536 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!417347 () Bool)

(assert (=> b!747536 (= e!417347 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19959 a!3186) j!159) a!3186 mask!3328) lt!332283))))

(declare-fun b!747537 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41691 (_ BitVec 32)) SeekEntryResult!7559)

(assert (=> b!747537 (= e!417347 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19959 a!3186) j!159) a!3186 mask!3328) (Found!7559 j!159)))))

(declare-fun b!747538 () Bool)

(declare-fun res!504143 () Bool)

(assert (=> b!747538 (=> (not res!504143) (not e!417353))))

(assert (=> b!747538 (= res!504143 e!417347)))

(declare-fun c!82083 () Bool)

(assert (=> b!747538 (= c!82083 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747539 () Bool)

(declare-fun res!504145 () Bool)

(assert (=> b!747539 (=> (not res!504145) (not e!417352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41691 (_ BitVec 32)) Bool)

(assert (=> b!747539 (= res!504145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747540 () Bool)

(declare-fun res!504146 () Bool)

(assert (=> b!747540 (=> (not res!504146) (not e!417353))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!747540 (= res!504146 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19959 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747541 () Bool)

(declare-fun res!504140 () Bool)

(declare-fun e!417355 () Bool)

(assert (=> b!747541 (=> (not res!504140) (not e!417355))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747541 (= res!504140 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747542 () Bool)

(declare-fun res!504135 () Bool)

(assert (=> b!747542 (=> (not res!504135) (not e!417352))))

(assert (=> b!747542 (= res!504135 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20380 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20380 a!3186))))))

(declare-fun b!747543 () Bool)

(declare-fun res!504141 () Bool)

(assert (=> b!747543 (=> (not res!504141) (not e!417355))))

(assert (=> b!747543 (= res!504141 (and (= (size!20380 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20380 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20380 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747544 () Bool)

(declare-datatypes ((Unit!25616 0))(
  ( (Unit!25617) )
))
(declare-fun e!417349 () Unit!25616)

(declare-fun Unit!25618 () Unit!25616)

(assert (=> b!747544 (= e!417349 Unit!25618)))

(declare-fun b!747545 () Bool)

(declare-fun res!504131 () Bool)

(assert (=> b!747545 (=> (not res!504131) (not e!417355))))

(assert (=> b!747545 (= res!504131 (validKeyInArray!0 (select (arr!19959 a!3186) j!159)))))

(declare-fun res!504129 () Bool)

(assert (=> start!65518 (=> (not res!504129) (not e!417355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65518 (= res!504129 (validMask!0 mask!3328))))

(assert (=> start!65518 e!417355))

(assert (=> start!65518 true))

(declare-fun array_inv!15755 (array!41691) Bool)

(assert (=> start!65518 (array_inv!15755 a!3186)))

(declare-fun b!747546 () Bool)

(declare-fun e!417351 () Bool)

(assert (=> b!747546 (= e!417351 e!417356)))

(declare-fun res!504139 () Bool)

(assert (=> b!747546 (=> res!504139 e!417356)))

(assert (=> b!747546 (= res!504139 (bvslt mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!747546 (= (select (store (arr!19959 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332279 () Unit!25616)

(assert (=> b!747546 (= lt!332279 e!417349)))

(declare-fun c!82084 () Bool)

(assert (=> b!747546 (= c!82084 (= (select (store (arr!19959 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747547 () Bool)

(declare-fun res!504132 () Bool)

(assert (=> b!747547 (=> (not res!504132) (not e!417355))))

(assert (=> b!747547 (= res!504132 (validKeyInArray!0 k!2102))))

(declare-fun b!747548 () Bool)

(declare-fun lt!332280 () SeekEntryResult!7559)

(declare-fun e!417348 () Bool)

(assert (=> b!747548 (= e!417348 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19959 a!3186) j!159) a!3186 mask!3328) lt!332280))))

(declare-fun b!747549 () Bool)

(declare-fun res!504136 () Bool)

(assert (=> b!747549 (=> res!504136 e!417351)))

(assert (=> b!747549 (= res!504136 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19959 a!3186) j!159) a!3186 mask!3328) lt!332280)))))

(declare-fun b!747550 () Bool)

(declare-fun e!417350 () Bool)

(assert (=> b!747550 (= e!417353 e!417350)))

(declare-fun res!504134 () Bool)

(assert (=> b!747550 (=> (not res!504134) (not e!417350))))

(declare-fun lt!332277 () SeekEntryResult!7559)

(declare-fun lt!332281 () SeekEntryResult!7559)

(assert (=> b!747550 (= res!504134 (= lt!332277 lt!332281))))

(declare-fun lt!332282 () array!41691)

(assert (=> b!747550 (= lt!332281 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332278 lt!332282 mask!3328))))

(assert (=> b!747550 (= lt!332277 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332278 mask!3328) lt!332278 lt!332282 mask!3328))))

(assert (=> b!747550 (= lt!332278 (select (store (arr!19959 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!747550 (= lt!332282 (array!41692 (store (arr!19959 a!3186) i!1173 k!2102) (size!20380 a!3186)))))

(declare-fun b!747551 () Bool)

(declare-fun res!504130 () Bool)

(assert (=> b!747551 (=> (not res!504130) (not e!417352))))

(declare-datatypes ((List!13961 0))(
  ( (Nil!13958) (Cons!13957 (h!15029 (_ BitVec 64)) (t!20276 List!13961)) )
))
(declare-fun arrayNoDuplicates!0 (array!41691 (_ BitVec 32) List!13961) Bool)

(assert (=> b!747551 (= res!504130 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13958))))

(declare-fun b!747552 () Bool)

(assert (=> b!747552 (= e!417350 (not e!417351))))

(declare-fun res!504142 () Bool)

(assert (=> b!747552 (=> res!504142 e!417351)))

(assert (=> b!747552 (= res!504142 (or (not (is-Intermediate!7559 lt!332281)) (bvslt x!1131 (x!63549 lt!332281)) (not (= x!1131 (x!63549 lt!332281))) (not (= index!1321 (index!32606 lt!332281)))))))

(assert (=> b!747552 e!417348))

(declare-fun res!504144 () Bool)

(assert (=> b!747552 (=> (not res!504144) (not e!417348))))

(declare-fun lt!332285 () SeekEntryResult!7559)

(assert (=> b!747552 (= res!504144 (= lt!332285 lt!332280))))

(assert (=> b!747552 (= lt!332280 (Found!7559 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41691 (_ BitVec 32)) SeekEntryResult!7559)

(assert (=> b!747552 (= lt!332285 (seekEntryOrOpen!0 (select (arr!19959 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!747552 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332276 () Unit!25616)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41691 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25616)

(assert (=> b!747552 (= lt!332276 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747553 () Bool)

(declare-fun Unit!25619 () Unit!25616)

(assert (=> b!747553 (= e!417349 Unit!25619)))

(assert (=> b!747553 false))

(declare-fun b!747554 () Bool)

(declare-fun res!504138 () Bool)

(assert (=> b!747554 (=> res!504138 e!417351)))

(assert (=> b!747554 (= res!504138 (= (select (store (arr!19959 a!3186) i!1173 k!2102) index!1321) lt!332278))))

(declare-fun b!747555 () Bool)

(assert (=> b!747555 (= e!417355 e!417352)))

(declare-fun res!504137 () Bool)

(assert (=> b!747555 (=> (not res!504137) (not e!417352))))

(declare-fun lt!332284 () SeekEntryResult!7559)

(assert (=> b!747555 (= res!504137 (or (= lt!332284 (MissingZero!7559 i!1173)) (= lt!332284 (MissingVacant!7559 i!1173))))))

(assert (=> b!747555 (= lt!332284 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!65518 res!504129) b!747543))

(assert (= (and b!747543 res!504141) b!747545))

(assert (= (and b!747545 res!504131) b!747547))

(assert (= (and b!747547 res!504132) b!747541))

(assert (= (and b!747541 res!504140) b!747555))

(assert (= (and b!747555 res!504137) b!747539))

(assert (= (and b!747539 res!504145) b!747551))

(assert (= (and b!747551 res!504130) b!747542))

(assert (= (and b!747542 res!504135) b!747534))

(assert (= (and b!747534 res!504133) b!747540))

(assert (= (and b!747540 res!504146) b!747538))

(assert (= (and b!747538 c!82083) b!747536))

(assert (= (and b!747538 (not c!82083)) b!747537))

(assert (= (and b!747538 res!504143) b!747550))

(assert (= (and b!747550 res!504134) b!747552))

(assert (= (and b!747552 res!504144) b!747548))

(assert (= (and b!747552 (not res!504142)) b!747549))

(assert (= (and b!747549 (not res!504136)) b!747554))

(assert (= (and b!747554 (not res!504138)) b!747546))

(assert (= (and b!747546 c!82084) b!747553))

(assert (= (and b!747546 (not c!82084)) b!747544))

(assert (= (and b!747546 (not res!504139)) b!747535))

(declare-fun m!697591 () Bool)

(assert (=> b!747536 m!697591))

(assert (=> b!747536 m!697591))

(declare-fun m!697593 () Bool)

(assert (=> b!747536 m!697593))

(declare-fun m!697595 () Bool)

(assert (=> b!747535 m!697595))

(declare-fun m!697597 () Bool)

(assert (=> b!747554 m!697597))

(declare-fun m!697599 () Bool)

(assert (=> b!747554 m!697599))

(declare-fun m!697601 () Bool)

(assert (=> b!747540 m!697601))

(assert (=> b!747548 m!697591))

(assert (=> b!747548 m!697591))

(declare-fun m!697603 () Bool)

(assert (=> b!747548 m!697603))

(assert (=> b!747552 m!697591))

(assert (=> b!747552 m!697591))

(declare-fun m!697605 () Bool)

(assert (=> b!747552 m!697605))

(declare-fun m!697607 () Bool)

(assert (=> b!747552 m!697607))

(declare-fun m!697609 () Bool)

(assert (=> b!747552 m!697609))

(assert (=> b!747537 m!697591))

(assert (=> b!747537 m!697591))

(declare-fun m!697611 () Bool)

(assert (=> b!747537 m!697611))

(declare-fun m!697613 () Bool)

(assert (=> b!747551 m!697613))

(declare-fun m!697615 () Bool)

(assert (=> b!747550 m!697615))

(declare-fun m!697617 () Bool)

(assert (=> b!747550 m!697617))

(assert (=> b!747550 m!697615))

(assert (=> b!747550 m!697597))

(declare-fun m!697619 () Bool)

(assert (=> b!747550 m!697619))

(declare-fun m!697621 () Bool)

(assert (=> b!747550 m!697621))

(assert (=> b!747545 m!697591))

(assert (=> b!747545 m!697591))

(declare-fun m!697623 () Bool)

(assert (=> b!747545 m!697623))

(declare-fun m!697625 () Bool)

(assert (=> start!65518 m!697625))

(declare-fun m!697627 () Bool)

(assert (=> start!65518 m!697627))

(assert (=> b!747549 m!697591))

(assert (=> b!747549 m!697591))

(assert (=> b!747549 m!697611))

(declare-fun m!697629 () Bool)

(assert (=> b!747555 m!697629))

(declare-fun m!697631 () Bool)

(assert (=> b!747541 m!697631))

(assert (=> b!747546 m!697597))

(assert (=> b!747546 m!697599))

(assert (=> b!747534 m!697591))

(assert (=> b!747534 m!697591))

(declare-fun m!697633 () Bool)

(assert (=> b!747534 m!697633))

(assert (=> b!747534 m!697633))

(assert (=> b!747534 m!697591))

(declare-fun m!697635 () Bool)

(assert (=> b!747534 m!697635))

(declare-fun m!697637 () Bool)

(assert (=> b!747539 m!697637))

(declare-fun m!697639 () Bool)

(assert (=> b!747547 m!697639))

(push 1)

