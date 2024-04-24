; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67378 () Bool)

(assert start!67378)

(declare-fun b!778364 () Bool)

(declare-fun res!526405 () Bool)

(declare-fun e!433148 () Bool)

(assert (=> b!778364 (=> (not res!526405) (not e!433148))))

(declare-fun e!433147 () Bool)

(assert (=> b!778364 (= res!526405 e!433147)))

(declare-fun c!86390 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!778364 (= c!86390 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!778365 () Bool)

(declare-fun res!526399 () Bool)

(assert (=> b!778365 (=> (not res!526399) (not e!433148))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42550 0))(
  ( (array!42551 (arr!20365 (Array (_ BitVec 32) (_ BitVec 64))) (size!20785 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42550)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!778365 (= res!526399 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20365 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778366 () Bool)

(declare-fun res!526394 () Bool)

(declare-fun e!433150 () Bool)

(assert (=> b!778366 (=> (not res!526394) (not e!433150))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778366 (= res!526394 (validKeyInArray!0 k0!2102))))

(declare-fun b!778367 () Bool)

(declare-fun e!433153 () Bool)

(assert (=> b!778367 (= e!433153 true)))

(declare-fun lt!346760 () array!42550)

(declare-datatypes ((SeekEntryResult!7921 0))(
  ( (MissingZero!7921 (index!34052 (_ BitVec 32))) (Found!7921 (index!34053 (_ BitVec 32))) (Intermediate!7921 (undefined!8733 Bool) (index!34054 (_ BitVec 32)) (x!65156 (_ BitVec 32))) (Undefined!7921) (MissingVacant!7921 (index!34055 (_ BitVec 32))) )
))
(declare-fun lt!346763 () SeekEntryResult!7921)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!346765 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42550 (_ BitVec 32)) SeekEntryResult!7921)

(assert (=> b!778367 (= lt!346763 (seekEntryOrOpen!0 lt!346765 lt!346760 mask!3328))))

(declare-fun b!778368 () Bool)

(declare-fun e!433146 () Bool)

(assert (=> b!778368 (= e!433146 e!433148)))

(declare-fun res!526396 () Bool)

(assert (=> b!778368 (=> (not res!526396) (not e!433148))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!346761 () SeekEntryResult!7921)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42550 (_ BitVec 32)) SeekEntryResult!7921)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778368 (= res!526396 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20365 a!3186) j!159) mask!3328) (select (arr!20365 a!3186) j!159) a!3186 mask!3328) lt!346761))))

(assert (=> b!778368 (= lt!346761 (Intermediate!7921 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!526398 () Bool)

(assert (=> start!67378 (=> (not res!526398) (not e!433150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67378 (= res!526398 (validMask!0 mask!3328))))

(assert (=> start!67378 e!433150))

(assert (=> start!67378 true))

(declare-fun array_inv!16224 (array!42550) Bool)

(assert (=> start!67378 (array_inv!16224 a!3186)))

(declare-fun b!778369 () Bool)

(declare-fun res!526403 () Bool)

(assert (=> b!778369 (=> (not res!526403) (not e!433150))))

(declare-fun arrayContainsKey!0 (array!42550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778369 (= res!526403 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!778370 () Bool)

(declare-fun res!526402 () Bool)

(assert (=> b!778370 (=> res!526402 e!433153)))

(declare-fun lt!346764 () SeekEntryResult!7921)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!778370 (= res!526402 (or (not (= (select (store (arr!20365 a!3186) i!1173 k0!2102) index!1321) lt!346765)) (undefined!8733 lt!346764)))))

(declare-fun b!778371 () Bool)

(declare-fun res!526397 () Bool)

(assert (=> b!778371 (=> (not res!526397) (not e!433150))))

(assert (=> b!778371 (= res!526397 (and (= (size!20785 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20785 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20785 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!778372 () Bool)

(declare-fun res!526401 () Bool)

(assert (=> b!778372 (=> (not res!526401) (not e!433150))))

(assert (=> b!778372 (= res!526401 (validKeyInArray!0 (select (arr!20365 a!3186) j!159)))))

(declare-fun b!778373 () Bool)

(declare-fun e!433149 () Bool)

(declare-fun lt!346768 () SeekEntryResult!7921)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42550 (_ BitVec 32)) SeekEntryResult!7921)

(assert (=> b!778373 (= e!433149 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20365 a!3186) j!159) a!3186 mask!3328) lt!346768))))

(declare-fun b!778374 () Bool)

(declare-fun e!433151 () Bool)

(assert (=> b!778374 (= e!433151 e!433149)))

(declare-fun res!526400 () Bool)

(assert (=> b!778374 (=> (not res!526400) (not e!433149))))

(assert (=> b!778374 (= res!526400 (= (seekEntryOrOpen!0 (select (arr!20365 a!3186) j!159) a!3186 mask!3328) lt!346768))))

(assert (=> b!778374 (= lt!346768 (Found!7921 j!159))))

(declare-fun b!778375 () Bool)

(declare-fun res!526395 () Bool)

(assert (=> b!778375 (=> (not res!526395) (not e!433146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42550 (_ BitVec 32)) Bool)

(assert (=> b!778375 (= res!526395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!778376 () Bool)

(assert (=> b!778376 (= e!433150 e!433146)))

(declare-fun res!526408 () Bool)

(assert (=> b!778376 (=> (not res!526408) (not e!433146))))

(declare-fun lt!346767 () SeekEntryResult!7921)

(assert (=> b!778376 (= res!526408 (or (= lt!346767 (MissingZero!7921 i!1173)) (= lt!346767 (MissingVacant!7921 i!1173))))))

(assert (=> b!778376 (= lt!346767 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!778377 () Bool)

(declare-fun e!433152 () Bool)

(assert (=> b!778377 (= e!433148 e!433152)))

(declare-fun res!526404 () Bool)

(assert (=> b!778377 (=> (not res!526404) (not e!433152))))

(declare-fun lt!346766 () SeekEntryResult!7921)

(assert (=> b!778377 (= res!526404 (= lt!346766 lt!346764))))

(assert (=> b!778377 (= lt!346764 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346765 lt!346760 mask!3328))))

(assert (=> b!778377 (= lt!346766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346765 mask!3328) lt!346765 lt!346760 mask!3328))))

(assert (=> b!778377 (= lt!346765 (select (store (arr!20365 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!778377 (= lt!346760 (array!42551 (store (arr!20365 a!3186) i!1173 k0!2102) (size!20785 a!3186)))))

(declare-fun b!778378 () Bool)

(declare-fun res!526409 () Bool)

(assert (=> b!778378 (=> (not res!526409) (not e!433146))))

(declare-datatypes ((List!14274 0))(
  ( (Nil!14271) (Cons!14270 (h!15387 (_ BitVec 64)) (t!20581 List!14274)) )
))
(declare-fun arrayNoDuplicates!0 (array!42550 (_ BitVec 32) List!14274) Bool)

(assert (=> b!778378 (= res!526409 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14271))))

(declare-fun b!778379 () Bool)

(assert (=> b!778379 (= e!433147 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20365 a!3186) j!159) a!3186 mask!3328) (Found!7921 j!159)))))

(declare-fun b!778380 () Bool)

(assert (=> b!778380 (= e!433147 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20365 a!3186) j!159) a!3186 mask!3328) lt!346761))))

(declare-fun b!778381 () Bool)

(declare-fun res!526407 () Bool)

(assert (=> b!778381 (=> (not res!526407) (not e!433146))))

(assert (=> b!778381 (= res!526407 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20785 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20785 a!3186))))))

(declare-fun b!778382 () Bool)

(declare-fun res!526410 () Bool)

(assert (=> b!778382 (=> res!526410 e!433153)))

(assert (=> b!778382 (= res!526410 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20365 a!3186) j!159) a!3186 mask!3328) (Found!7921 j!159))))))

(declare-fun b!778383 () Bool)

(assert (=> b!778383 (= e!433152 (not e!433153))))

(declare-fun res!526393 () Bool)

(assert (=> b!778383 (=> res!526393 e!433153)))

(get-info :version)

(assert (=> b!778383 (= res!526393 (or (not ((_ is Intermediate!7921) lt!346764)) (bvslt x!1131 (x!65156 lt!346764)) (not (= x!1131 (x!65156 lt!346764))) (not (= index!1321 (index!34054 lt!346764)))))))

(assert (=> b!778383 e!433151))

(declare-fun res!526406 () Bool)

(assert (=> b!778383 (=> (not res!526406) (not e!433151))))

(assert (=> b!778383 (= res!526406 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26815 0))(
  ( (Unit!26816) )
))
(declare-fun lt!346762 () Unit!26815)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26815)

(assert (=> b!778383 (= lt!346762 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67378 res!526398) b!778371))

(assert (= (and b!778371 res!526397) b!778372))

(assert (= (and b!778372 res!526401) b!778366))

(assert (= (and b!778366 res!526394) b!778369))

(assert (= (and b!778369 res!526403) b!778376))

(assert (= (and b!778376 res!526408) b!778375))

(assert (= (and b!778375 res!526395) b!778378))

(assert (= (and b!778378 res!526409) b!778381))

(assert (= (and b!778381 res!526407) b!778368))

(assert (= (and b!778368 res!526396) b!778365))

(assert (= (and b!778365 res!526399) b!778364))

(assert (= (and b!778364 c!86390) b!778380))

(assert (= (and b!778364 (not c!86390)) b!778379))

(assert (= (and b!778364 res!526405) b!778377))

(assert (= (and b!778377 res!526404) b!778383))

(assert (= (and b!778383 res!526406) b!778374))

(assert (= (and b!778374 res!526400) b!778373))

(assert (= (and b!778383 (not res!526393)) b!778382))

(assert (= (and b!778382 (not res!526410)) b!778370))

(assert (= (and b!778370 (not res!526402)) b!778367))

(declare-fun m!722603 () Bool)

(assert (=> b!778372 m!722603))

(assert (=> b!778372 m!722603))

(declare-fun m!722605 () Bool)

(assert (=> b!778372 m!722605))

(assert (=> b!778373 m!722603))

(assert (=> b!778373 m!722603))

(declare-fun m!722607 () Bool)

(assert (=> b!778373 m!722607))

(declare-fun m!722609 () Bool)

(assert (=> b!778367 m!722609))

(declare-fun m!722611 () Bool)

(assert (=> b!778375 m!722611))

(declare-fun m!722613 () Bool)

(assert (=> b!778370 m!722613))

(declare-fun m!722615 () Bool)

(assert (=> b!778370 m!722615))

(assert (=> b!778382 m!722603))

(assert (=> b!778382 m!722603))

(declare-fun m!722617 () Bool)

(assert (=> b!778382 m!722617))

(assert (=> b!778380 m!722603))

(assert (=> b!778380 m!722603))

(declare-fun m!722619 () Bool)

(assert (=> b!778380 m!722619))

(declare-fun m!722621 () Bool)

(assert (=> start!67378 m!722621))

(declare-fun m!722623 () Bool)

(assert (=> start!67378 m!722623))

(declare-fun m!722625 () Bool)

(assert (=> b!778376 m!722625))

(declare-fun m!722627 () Bool)

(assert (=> b!778365 m!722627))

(declare-fun m!722629 () Bool)

(assert (=> b!778377 m!722629))

(declare-fun m!722631 () Bool)

(assert (=> b!778377 m!722631))

(declare-fun m!722633 () Bool)

(assert (=> b!778377 m!722633))

(declare-fun m!722635 () Bool)

(assert (=> b!778377 m!722635))

(assert (=> b!778377 m!722631))

(assert (=> b!778377 m!722613))

(assert (=> b!778374 m!722603))

(assert (=> b!778374 m!722603))

(declare-fun m!722637 () Bool)

(assert (=> b!778374 m!722637))

(declare-fun m!722639 () Bool)

(assert (=> b!778378 m!722639))

(assert (=> b!778379 m!722603))

(assert (=> b!778379 m!722603))

(assert (=> b!778379 m!722617))

(assert (=> b!778368 m!722603))

(assert (=> b!778368 m!722603))

(declare-fun m!722641 () Bool)

(assert (=> b!778368 m!722641))

(assert (=> b!778368 m!722641))

(assert (=> b!778368 m!722603))

(declare-fun m!722643 () Bool)

(assert (=> b!778368 m!722643))

(declare-fun m!722645 () Bool)

(assert (=> b!778369 m!722645))

(declare-fun m!722647 () Bool)

(assert (=> b!778383 m!722647))

(declare-fun m!722649 () Bool)

(assert (=> b!778383 m!722649))

(declare-fun m!722651 () Bool)

(assert (=> b!778366 m!722651))

(check-sat (not b!778377) (not b!778378) (not start!67378) (not b!778380) (not b!778367) (not b!778376) (not b!778382) (not b!778366) (not b!778373) (not b!778375) (not b!778369) (not b!778383) (not b!778379) (not b!778372) (not b!778374) (not b!778368))
(check-sat)
