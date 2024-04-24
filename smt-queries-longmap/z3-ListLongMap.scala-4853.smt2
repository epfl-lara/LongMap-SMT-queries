; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66934 () Bool)

(assert start!66934)

(declare-fun b!771522 () Bool)

(declare-fun res!521779 () Bool)

(declare-fun e!429587 () Bool)

(assert (=> b!771522 (=> (not res!521779) (not e!429587))))

(declare-datatypes ((array!42376 0))(
  ( (array!42377 (arr!20284 (Array (_ BitVec 32) (_ BitVec 64))) (size!20704 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42376)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!771522 (= res!521779 (validKeyInArray!0 (select (arr!20284 a!3186) j!159)))))

(declare-fun b!771523 () Bool)

(declare-fun res!521780 () Bool)

(assert (=> b!771523 (=> (not res!521780) (not e!429587))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!771523 (= res!521780 (and (= (size!20704 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20704 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20704 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!771524 () Bool)

(declare-datatypes ((Unit!26551 0))(
  ( (Unit!26552) )
))
(declare-fun e!429591 () Unit!26551)

(declare-fun Unit!26553 () Unit!26551)

(assert (=> b!771524 (= e!429591 Unit!26553)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7840 0))(
  ( (MissingZero!7840 (index!33728 (_ BitVec 32))) (Found!7840 (index!33729 (_ BitVec 32))) (Intermediate!7840 (undefined!8652 Bool) (index!33730 (_ BitVec 32)) (x!64814 (_ BitVec 32))) (Undefined!7840) (MissingVacant!7840 (index!33731 (_ BitVec 32))) )
))
(declare-fun lt!343408 () SeekEntryResult!7840)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42376 (_ BitVec 32)) SeekEntryResult!7840)

(assert (=> b!771524 (= lt!343408 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20284 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343417 () (_ BitVec 32))

(assert (=> b!771524 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343417 resIntermediateIndex!5 (select (arr!20284 a!3186) j!159) a!3186 mask!3328) (Found!7840 j!159))))

(declare-fun b!771525 () Bool)

(declare-fun e!429593 () Bool)

(assert (=> b!771525 (= e!429587 e!429593)))

(declare-fun res!521776 () Bool)

(assert (=> b!771525 (=> (not res!521776) (not e!429593))))

(declare-fun lt!343415 () SeekEntryResult!7840)

(assert (=> b!771525 (= res!521776 (or (= lt!343415 (MissingZero!7840 i!1173)) (= lt!343415 (MissingVacant!7840 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42376 (_ BitVec 32)) SeekEntryResult!7840)

(assert (=> b!771525 (= lt!343415 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!771526 () Bool)

(declare-fun res!521781 () Bool)

(assert (=> b!771526 (=> (not res!521781) (not e!429593))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!771526 (= res!521781 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20704 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20704 a!3186))))))

(declare-fun e!429589 () Bool)

(declare-fun b!771527 () Bool)

(assert (=> b!771527 (= e!429589 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20284 a!3186) j!159) a!3186 mask!3328) (Found!7840 j!159)))))

(declare-fun lt!343412 () SeekEntryResult!7840)

(declare-fun b!771528 () Bool)

(declare-fun e!429594 () Bool)

(assert (=> b!771528 (= e!429594 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20284 a!3186) j!159) a!3186 mask!3328) lt!343412))))

(declare-fun b!771529 () Bool)

(declare-fun res!521782 () Bool)

(assert (=> b!771529 (=> (not res!521782) (not e!429593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42376 (_ BitVec 32)) Bool)

(assert (=> b!771529 (= res!521782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!771530 () Bool)

(declare-fun lt!343410 () SeekEntryResult!7840)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42376 (_ BitVec 32)) SeekEntryResult!7840)

(assert (=> b!771530 (= e!429589 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20284 a!3186) j!159) a!3186 mask!3328) lt!343410))))

(declare-fun res!521786 () Bool)

(assert (=> start!66934 (=> (not res!521786) (not e!429587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66934 (= res!521786 (validMask!0 mask!3328))))

(assert (=> start!66934 e!429587))

(assert (=> start!66934 true))

(declare-fun array_inv!16143 (array!42376) Bool)

(assert (=> start!66934 (array_inv!16143 a!3186)))

(declare-fun b!771521 () Bool)

(declare-fun res!521773 () Bool)

(declare-fun e!429592 () Bool)

(assert (=> b!771521 (=> (not res!521773) (not e!429592))))

(assert (=> b!771521 (= res!521773 e!429589)))

(declare-fun c!85274 () Bool)

(assert (=> b!771521 (= c!85274 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!771531 () Bool)

(declare-fun e!429586 () Bool)

(assert (=> b!771531 (= e!429592 e!429586)))

(declare-fun res!521783 () Bool)

(assert (=> b!771531 (=> (not res!521783) (not e!429586))))

(declare-fun lt!343416 () SeekEntryResult!7840)

(declare-fun lt!343413 () SeekEntryResult!7840)

(assert (=> b!771531 (= res!521783 (= lt!343416 lt!343413))))

(declare-fun lt!343407 () array!42376)

(declare-fun lt!343409 () (_ BitVec 64))

(assert (=> b!771531 (= lt!343413 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343409 lt!343407 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771531 (= lt!343416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343409 mask!3328) lt!343409 lt!343407 mask!3328))))

(assert (=> b!771531 (= lt!343409 (select (store (arr!20284 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!771531 (= lt!343407 (array!42377 (store (arr!20284 a!3186) i!1173 k0!2102) (size!20704 a!3186)))))

(declare-fun b!771532 () Bool)

(assert (=> b!771532 (= e!429593 e!429592)))

(declare-fun res!521787 () Bool)

(assert (=> b!771532 (=> (not res!521787) (not e!429592))))

(assert (=> b!771532 (= res!521787 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20284 a!3186) j!159) mask!3328) (select (arr!20284 a!3186) j!159) a!3186 mask!3328) lt!343410))))

(assert (=> b!771532 (= lt!343410 (Intermediate!7840 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!771533 () Bool)

(declare-fun e!429590 () Bool)

(assert (=> b!771533 (= e!429590 true)))

(declare-fun lt!343414 () Unit!26551)

(assert (=> b!771533 (= lt!343414 e!429591)))

(declare-fun c!85273 () Bool)

(assert (=> b!771533 (= c!85273 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771533 (= lt!343417 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!771534 () Bool)

(declare-fun e!429595 () Bool)

(assert (=> b!771534 (= e!429595 e!429594)))

(declare-fun res!521778 () Bool)

(assert (=> b!771534 (=> (not res!521778) (not e!429594))))

(assert (=> b!771534 (= res!521778 (= (seekEntryOrOpen!0 (select (arr!20284 a!3186) j!159) a!3186 mask!3328) lt!343412))))

(assert (=> b!771534 (= lt!343412 (Found!7840 j!159))))

(declare-fun b!771535 () Bool)

(declare-fun res!521784 () Bool)

(assert (=> b!771535 (=> (not res!521784) (not e!429592))))

(assert (=> b!771535 (= res!521784 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20284 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771536 () Bool)

(declare-fun res!521772 () Bool)

(assert (=> b!771536 (=> (not res!521772) (not e!429587))))

(assert (=> b!771536 (= res!521772 (validKeyInArray!0 k0!2102))))

(declare-fun b!771537 () Bool)

(assert (=> b!771537 (= e!429586 (not e!429590))))

(declare-fun res!521785 () Bool)

(assert (=> b!771537 (=> res!521785 e!429590)))

(get-info :version)

(assert (=> b!771537 (= res!521785 (or (not ((_ is Intermediate!7840) lt!343413)) (bvsge x!1131 (x!64814 lt!343413))))))

(assert (=> b!771537 e!429595))

(declare-fun res!521777 () Bool)

(assert (=> b!771537 (=> (not res!521777) (not e!429595))))

(assert (=> b!771537 (= res!521777 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343411 () Unit!26551)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26551)

(assert (=> b!771537 (= lt!343411 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!771538 () Bool)

(declare-fun res!521775 () Bool)

(assert (=> b!771538 (=> (not res!521775) (not e!429593))))

(declare-datatypes ((List!14193 0))(
  ( (Nil!14190) (Cons!14189 (h!15294 (_ BitVec 64)) (t!20500 List!14193)) )
))
(declare-fun arrayNoDuplicates!0 (array!42376 (_ BitVec 32) List!14193) Bool)

(assert (=> b!771538 (= res!521775 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14190))))

(declare-fun b!771539 () Bool)

(declare-fun res!521774 () Bool)

(assert (=> b!771539 (=> (not res!521774) (not e!429587))))

(declare-fun arrayContainsKey!0 (array!42376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771539 (= res!521774 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!771540 () Bool)

(declare-fun Unit!26554 () Unit!26551)

(assert (=> b!771540 (= e!429591 Unit!26554)))

(assert (=> b!771540 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343417 (select (arr!20284 a!3186) j!159) a!3186 mask!3328) lt!343410)))

(assert (= (and start!66934 res!521786) b!771523))

(assert (= (and b!771523 res!521780) b!771522))

(assert (= (and b!771522 res!521779) b!771536))

(assert (= (and b!771536 res!521772) b!771539))

(assert (= (and b!771539 res!521774) b!771525))

(assert (= (and b!771525 res!521776) b!771529))

(assert (= (and b!771529 res!521782) b!771538))

(assert (= (and b!771538 res!521775) b!771526))

(assert (= (and b!771526 res!521781) b!771532))

(assert (= (and b!771532 res!521787) b!771535))

(assert (= (and b!771535 res!521784) b!771521))

(assert (= (and b!771521 c!85274) b!771530))

(assert (= (and b!771521 (not c!85274)) b!771527))

(assert (= (and b!771521 res!521773) b!771531))

(assert (= (and b!771531 res!521783) b!771537))

(assert (= (and b!771537 res!521777) b!771534))

(assert (= (and b!771534 res!521778) b!771528))

(assert (= (and b!771537 (not res!521785)) b!771533))

(assert (= (and b!771533 c!85273) b!771540))

(assert (= (and b!771533 (not c!85273)) b!771524))

(declare-fun m!717143 () Bool)

(assert (=> b!771532 m!717143))

(assert (=> b!771532 m!717143))

(declare-fun m!717145 () Bool)

(assert (=> b!771532 m!717145))

(assert (=> b!771532 m!717145))

(assert (=> b!771532 m!717143))

(declare-fun m!717147 () Bool)

(assert (=> b!771532 m!717147))

(assert (=> b!771540 m!717143))

(assert (=> b!771540 m!717143))

(declare-fun m!717149 () Bool)

(assert (=> b!771540 m!717149))

(assert (=> b!771527 m!717143))

(assert (=> b!771527 m!717143))

(declare-fun m!717151 () Bool)

(assert (=> b!771527 m!717151))

(declare-fun m!717153 () Bool)

(assert (=> b!771529 m!717153))

(assert (=> b!771530 m!717143))

(assert (=> b!771530 m!717143))

(declare-fun m!717155 () Bool)

(assert (=> b!771530 m!717155))

(declare-fun m!717157 () Bool)

(assert (=> b!771537 m!717157))

(declare-fun m!717159 () Bool)

(assert (=> b!771537 m!717159))

(assert (=> b!771524 m!717143))

(assert (=> b!771524 m!717143))

(assert (=> b!771524 m!717151))

(assert (=> b!771524 m!717143))

(declare-fun m!717161 () Bool)

(assert (=> b!771524 m!717161))

(declare-fun m!717163 () Bool)

(assert (=> b!771538 m!717163))

(assert (=> b!771522 m!717143))

(assert (=> b!771522 m!717143))

(declare-fun m!717165 () Bool)

(assert (=> b!771522 m!717165))

(declare-fun m!717167 () Bool)

(assert (=> start!66934 m!717167))

(declare-fun m!717169 () Bool)

(assert (=> start!66934 m!717169))

(assert (=> b!771528 m!717143))

(assert (=> b!771528 m!717143))

(declare-fun m!717171 () Bool)

(assert (=> b!771528 m!717171))

(declare-fun m!717173 () Bool)

(assert (=> b!771536 m!717173))

(declare-fun m!717175 () Bool)

(assert (=> b!771533 m!717175))

(declare-fun m!717177 () Bool)

(assert (=> b!771525 m!717177))

(assert (=> b!771534 m!717143))

(assert (=> b!771534 m!717143))

(declare-fun m!717179 () Bool)

(assert (=> b!771534 m!717179))

(declare-fun m!717181 () Bool)

(assert (=> b!771539 m!717181))

(declare-fun m!717183 () Bool)

(assert (=> b!771531 m!717183))

(declare-fun m!717185 () Bool)

(assert (=> b!771531 m!717185))

(assert (=> b!771531 m!717185))

(declare-fun m!717187 () Bool)

(assert (=> b!771531 m!717187))

(declare-fun m!717189 () Bool)

(assert (=> b!771531 m!717189))

(declare-fun m!717191 () Bool)

(assert (=> b!771531 m!717191))

(declare-fun m!717193 () Bool)

(assert (=> b!771535 m!717193))

(check-sat (not b!771536) (not b!771524) (not b!771527) (not b!771537) (not b!771529) (not b!771540) (not b!771522) (not start!66934) (not b!771538) (not b!771539) (not b!771530) (not b!771525) (not b!771528) (not b!771532) (not b!771533) (not b!771534) (not b!771531))
(check-sat)
