; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66778 () Bool)

(assert start!66778)

(declare-fun b!769736 () Bool)

(declare-fun res!520601 () Bool)

(declare-fun e!428609 () Bool)

(assert (=> b!769736 (=> (not res!520601) (not e!428609))))

(declare-datatypes ((array!42340 0))(
  ( (array!42341 (arr!20270 (Array (_ BitVec 32) (_ BitVec 64))) (size!20691 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42340)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!769736 (= res!520601 (and (= (size!20691 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20691 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20691 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769737 () Bool)

(declare-fun e!428608 () Bool)

(declare-fun e!428607 () Bool)

(assert (=> b!769737 (= e!428608 e!428607)))

(declare-fun res!520599 () Bool)

(assert (=> b!769737 (=> (not res!520599) (not e!428607))))

(declare-datatypes ((SeekEntryResult!7870 0))(
  ( (MissingZero!7870 (index!33848 (_ BitVec 32))) (Found!7870 (index!33849 (_ BitVec 32))) (Intermediate!7870 (undefined!8682 Bool) (index!33850 (_ BitVec 32)) (x!64777 (_ BitVec 32))) (Undefined!7870) (MissingVacant!7870 (index!33851 (_ BitVec 32))) )
))
(declare-fun lt!342518 () SeekEntryResult!7870)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42340 (_ BitVec 32)) SeekEntryResult!7870)

(assert (=> b!769737 (= res!520599 (= (seekEntryOrOpen!0 (select (arr!20270 a!3186) j!159) a!3186 mask!3328) lt!342518))))

(assert (=> b!769737 (= lt!342518 (Found!7870 j!159))))

(declare-fun b!769738 () Bool)

(declare-fun res!520598 () Bool)

(declare-fun e!428605 () Bool)

(assert (=> b!769738 (=> (not res!520598) (not e!428605))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!769738 (= res!520598 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20270 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769739 () Bool)

(declare-fun res!520589 () Bool)

(assert (=> b!769739 (=> (not res!520589) (not e!428605))))

(declare-fun e!428606 () Bool)

(assert (=> b!769739 (= res!520589 e!428606)))

(declare-fun c!84969 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769739 (= c!84969 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769740 () Bool)

(declare-datatypes ((Unit!26494 0))(
  ( (Unit!26495) )
))
(declare-fun e!428603 () Unit!26494)

(declare-fun Unit!26496 () Unit!26494)

(assert (=> b!769740 (= e!428603 Unit!26496)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!342510 () SeekEntryResult!7870)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42340 (_ BitVec 32)) SeekEntryResult!7870)

(assert (=> b!769740 (= lt!342510 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20270 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!342509 () (_ BitVec 32))

(assert (=> b!769740 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342509 resIntermediateIndex!5 (select (arr!20270 a!3186) j!159) a!3186 mask!3328) (Found!7870 j!159))))

(declare-fun b!769741 () Bool)

(declare-fun res!520600 () Bool)

(declare-fun e!428604 () Bool)

(assert (=> b!769741 (=> (not res!520600) (not e!428604))))

(assert (=> b!769741 (= res!520600 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20691 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20691 a!3186))))))

(declare-fun b!769742 () Bool)

(declare-fun res!520604 () Bool)

(assert (=> b!769742 (=> (not res!520604) (not e!428604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42340 (_ BitVec 32)) Bool)

(assert (=> b!769742 (= res!520604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769743 () Bool)

(assert (=> b!769743 (= e!428606 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20270 a!3186) j!159) a!3186 mask!3328) (Found!7870 j!159)))))

(declare-fun b!769744 () Bool)

(assert (=> b!769744 (= e!428604 e!428605)))

(declare-fun res!520594 () Bool)

(assert (=> b!769744 (=> (not res!520594) (not e!428605))))

(declare-fun lt!342511 () SeekEntryResult!7870)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42340 (_ BitVec 32)) SeekEntryResult!7870)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769744 (= res!520594 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20270 a!3186) j!159) mask!3328) (select (arr!20270 a!3186) j!159) a!3186 mask!3328) lt!342511))))

(assert (=> b!769744 (= lt!342511 (Intermediate!7870 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769745 () Bool)

(declare-fun res!520596 () Bool)

(assert (=> b!769745 (=> (not res!520596) (not e!428609))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769745 (= res!520596 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769746 () Bool)

(declare-fun e!428602 () Bool)

(assert (=> b!769746 (= e!428602 true)))

(declare-fun lt!342513 () Unit!26494)

(assert (=> b!769746 (= lt!342513 e!428603)))

(declare-fun c!84970 () Bool)

(assert (=> b!769746 (= c!84970 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769746 (= lt!342509 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769747 () Bool)

(assert (=> b!769747 (= e!428606 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20270 a!3186) j!159) a!3186 mask!3328) lt!342511))))

(declare-fun b!769748 () Bool)

(declare-fun res!520593 () Bool)

(assert (=> b!769748 (=> (not res!520593) (not e!428609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769748 (= res!520593 (validKeyInArray!0 (select (arr!20270 a!3186) j!159)))))

(declare-fun res!520591 () Bool)

(assert (=> start!66778 (=> (not res!520591) (not e!428609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66778 (= res!520591 (validMask!0 mask!3328))))

(assert (=> start!66778 e!428609))

(assert (=> start!66778 true))

(declare-fun array_inv!16066 (array!42340) Bool)

(assert (=> start!66778 (array_inv!16066 a!3186)))

(declare-fun b!769749 () Bool)

(assert (=> b!769749 (= e!428607 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20270 a!3186) j!159) a!3186 mask!3328) lt!342518))))

(declare-fun b!769750 () Bool)

(declare-fun Unit!26497 () Unit!26494)

(assert (=> b!769750 (= e!428603 Unit!26497)))

(assert (=> b!769750 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342509 (select (arr!20270 a!3186) j!159) a!3186 mask!3328) lt!342511)))

(declare-fun b!769751 () Bool)

(declare-fun e!428600 () Bool)

(assert (=> b!769751 (= e!428600 (not e!428602))))

(declare-fun res!520603 () Bool)

(assert (=> b!769751 (=> res!520603 e!428602)))

(declare-fun lt!342515 () SeekEntryResult!7870)

(assert (=> b!769751 (= res!520603 (or (not (is-Intermediate!7870 lt!342515)) (bvsge x!1131 (x!64777 lt!342515))))))

(assert (=> b!769751 e!428608))

(declare-fun res!520597 () Bool)

(assert (=> b!769751 (=> (not res!520597) (not e!428608))))

(assert (=> b!769751 (= res!520597 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342508 () Unit!26494)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26494)

(assert (=> b!769751 (= lt!342508 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769752 () Bool)

(assert (=> b!769752 (= e!428605 e!428600)))

(declare-fun res!520595 () Bool)

(assert (=> b!769752 (=> (not res!520595) (not e!428600))))

(declare-fun lt!342517 () SeekEntryResult!7870)

(assert (=> b!769752 (= res!520595 (= lt!342517 lt!342515))))

(declare-fun lt!342514 () (_ BitVec 64))

(declare-fun lt!342516 () array!42340)

(assert (=> b!769752 (= lt!342515 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342514 lt!342516 mask!3328))))

(assert (=> b!769752 (= lt!342517 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342514 mask!3328) lt!342514 lt!342516 mask!3328))))

(assert (=> b!769752 (= lt!342514 (select (store (arr!20270 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!769752 (= lt!342516 (array!42341 (store (arr!20270 a!3186) i!1173 k!2102) (size!20691 a!3186)))))

(declare-fun b!769753 () Bool)

(declare-fun res!520592 () Bool)

(assert (=> b!769753 (=> (not res!520592) (not e!428609))))

(assert (=> b!769753 (= res!520592 (validKeyInArray!0 k!2102))))

(declare-fun b!769754 () Bool)

(assert (=> b!769754 (= e!428609 e!428604)))

(declare-fun res!520590 () Bool)

(assert (=> b!769754 (=> (not res!520590) (not e!428604))))

(declare-fun lt!342512 () SeekEntryResult!7870)

(assert (=> b!769754 (= res!520590 (or (= lt!342512 (MissingZero!7870 i!1173)) (= lt!342512 (MissingVacant!7870 i!1173))))))

(assert (=> b!769754 (= lt!342512 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!769755 () Bool)

(declare-fun res!520602 () Bool)

(assert (=> b!769755 (=> (not res!520602) (not e!428604))))

(declare-datatypes ((List!14272 0))(
  ( (Nil!14269) (Cons!14268 (h!15367 (_ BitVec 64)) (t!20587 List!14272)) )
))
(declare-fun arrayNoDuplicates!0 (array!42340 (_ BitVec 32) List!14272) Bool)

(assert (=> b!769755 (= res!520602 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14269))))

(assert (= (and start!66778 res!520591) b!769736))

(assert (= (and b!769736 res!520601) b!769748))

(assert (= (and b!769748 res!520593) b!769753))

(assert (= (and b!769753 res!520592) b!769745))

(assert (= (and b!769745 res!520596) b!769754))

(assert (= (and b!769754 res!520590) b!769742))

(assert (= (and b!769742 res!520604) b!769755))

(assert (= (and b!769755 res!520602) b!769741))

(assert (= (and b!769741 res!520600) b!769744))

(assert (= (and b!769744 res!520594) b!769738))

(assert (= (and b!769738 res!520598) b!769739))

(assert (= (and b!769739 c!84969) b!769747))

(assert (= (and b!769739 (not c!84969)) b!769743))

(assert (= (and b!769739 res!520589) b!769752))

(assert (= (and b!769752 res!520595) b!769751))

(assert (= (and b!769751 res!520597) b!769737))

(assert (= (and b!769737 res!520599) b!769749))

(assert (= (and b!769751 (not res!520603)) b!769746))

(assert (= (and b!769746 c!84970) b!769750))

(assert (= (and b!769746 (not c!84970)) b!769740))

(declare-fun m!715111 () Bool)

(assert (=> b!769742 m!715111))

(declare-fun m!715113 () Bool)

(assert (=> b!769744 m!715113))

(assert (=> b!769744 m!715113))

(declare-fun m!715115 () Bool)

(assert (=> b!769744 m!715115))

(assert (=> b!769744 m!715115))

(assert (=> b!769744 m!715113))

(declare-fun m!715117 () Bool)

(assert (=> b!769744 m!715117))

(assert (=> b!769748 m!715113))

(assert (=> b!769748 m!715113))

(declare-fun m!715119 () Bool)

(assert (=> b!769748 m!715119))

(declare-fun m!715121 () Bool)

(assert (=> b!769745 m!715121))

(declare-fun m!715123 () Bool)

(assert (=> b!769755 m!715123))

(assert (=> b!769747 m!715113))

(assert (=> b!769747 m!715113))

(declare-fun m!715125 () Bool)

(assert (=> b!769747 m!715125))

(declare-fun m!715127 () Bool)

(assert (=> b!769751 m!715127))

(declare-fun m!715129 () Bool)

(assert (=> b!769751 m!715129))

(assert (=> b!769750 m!715113))

(assert (=> b!769750 m!715113))

(declare-fun m!715131 () Bool)

(assert (=> b!769750 m!715131))

(assert (=> b!769740 m!715113))

(assert (=> b!769740 m!715113))

(declare-fun m!715133 () Bool)

(assert (=> b!769740 m!715133))

(assert (=> b!769740 m!715113))

(declare-fun m!715135 () Bool)

(assert (=> b!769740 m!715135))

(declare-fun m!715137 () Bool)

(assert (=> b!769752 m!715137))

(declare-fun m!715139 () Bool)

(assert (=> b!769752 m!715139))

(declare-fun m!715141 () Bool)

(assert (=> b!769752 m!715141))

(declare-fun m!715143 () Bool)

(assert (=> b!769752 m!715143))

(assert (=> b!769752 m!715137))

(declare-fun m!715145 () Bool)

(assert (=> b!769752 m!715145))

(declare-fun m!715147 () Bool)

(assert (=> b!769738 m!715147))

(assert (=> b!769737 m!715113))

(assert (=> b!769737 m!715113))

(declare-fun m!715149 () Bool)

(assert (=> b!769737 m!715149))

(assert (=> b!769749 m!715113))

(assert (=> b!769749 m!715113))

(declare-fun m!715151 () Bool)

(assert (=> b!769749 m!715151))

(assert (=> b!769743 m!715113))

(assert (=> b!769743 m!715113))

(assert (=> b!769743 m!715133))

(declare-fun m!715153 () Bool)

(assert (=> start!66778 m!715153))

(declare-fun m!715155 () Bool)

(assert (=> start!66778 m!715155))

(declare-fun m!715157 () Bool)

(assert (=> b!769753 m!715157))

(declare-fun m!715159 () Bool)

(assert (=> b!769754 m!715159))

(declare-fun m!715161 () Bool)

(assert (=> b!769746 m!715161))

(push 1)

