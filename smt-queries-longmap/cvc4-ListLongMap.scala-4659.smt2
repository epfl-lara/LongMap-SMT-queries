; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64730 () Bool)

(assert start!64730)

(declare-fun b!730468 () Bool)

(declare-fun res!490760 () Bool)

(declare-fun e!408778 () Bool)

(assert (=> b!730468 (=> (not res!490760) (not e!408778))))

(declare-datatypes ((array!41179 0))(
  ( (array!41180 (arr!19709 (Array (_ BitVec 32) (_ BitVec 64))) (size!20130 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41179)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41179 (_ BitVec 32)) Bool)

(assert (=> b!730468 (= res!490760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730469 () Bool)

(declare-fun e!408782 () Bool)

(declare-fun e!408783 () Bool)

(assert (=> b!730469 (= e!408782 e!408783)))

(declare-fun res!490757 () Bool)

(assert (=> b!730469 (=> (not res!490757) (not e!408783))))

(declare-datatypes ((SeekEntryResult!7309 0))(
  ( (MissingZero!7309 (index!31604 (_ BitVec 32))) (Found!7309 (index!31605 (_ BitVec 32))) (Intermediate!7309 (undefined!8121 Bool) (index!31606 (_ BitVec 32)) (x!62579 (_ BitVec 32))) (Undefined!7309) (MissingVacant!7309 (index!31607 (_ BitVec 32))) )
))
(declare-fun lt!323677 () SeekEntryResult!7309)

(declare-fun lt!323683 () SeekEntryResult!7309)

(assert (=> b!730469 (= res!490757 (= lt!323677 lt!323683))))

(declare-fun lt!323681 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!323679 () array!41179)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41179 (_ BitVec 32)) SeekEntryResult!7309)

(assert (=> b!730469 (= lt!323683 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323681 lt!323679 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730469 (= lt!323677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323681 mask!3328) lt!323681 lt!323679 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!730469 (= lt!323681 (select (store (arr!19709 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!730469 (= lt!323679 (array!41180 (store (arr!19709 a!3186) i!1173 k!2102) (size!20130 a!3186)))))

(declare-fun b!730470 () Bool)

(declare-fun e!408779 () Bool)

(assert (=> b!730470 (= e!408779 e!408778)))

(declare-fun res!490766 () Bool)

(assert (=> b!730470 (=> (not res!490766) (not e!408778))))

(declare-fun lt!323676 () SeekEntryResult!7309)

(assert (=> b!730470 (= res!490766 (or (= lt!323676 (MissingZero!7309 i!1173)) (= lt!323676 (MissingVacant!7309 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41179 (_ BitVec 32)) SeekEntryResult!7309)

(assert (=> b!730470 (= lt!323676 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!730471 () Bool)

(declare-fun e!408785 () Bool)

(declare-fun lt!323678 () SeekEntryResult!7309)

(assert (=> b!730471 (= e!408785 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19709 a!3186) j!159) a!3186 mask!3328) lt!323678))))

(declare-fun b!730472 () Bool)

(declare-fun e!408781 () Bool)

(assert (=> b!730472 (= e!408781 true)))

(declare-fun lt!323684 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730472 (= lt!323684 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730473 () Bool)

(declare-fun res!490767 () Bool)

(assert (=> b!730473 (=> (not res!490767) (not e!408782))))

(assert (=> b!730473 (= res!490767 e!408785)))

(declare-fun c!80230 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!730473 (= c!80230 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730474 () Bool)

(declare-fun res!490765 () Bool)

(assert (=> b!730474 (=> (not res!490765) (not e!408778))))

(declare-datatypes ((List!13711 0))(
  ( (Nil!13708) (Cons!13707 (h!14767 (_ BitVec 64)) (t!20026 List!13711)) )
))
(declare-fun arrayNoDuplicates!0 (array!41179 (_ BitVec 32) List!13711) Bool)

(assert (=> b!730474 (= res!490765 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13708))))

(declare-fun res!490770 () Bool)

(assert (=> start!64730 (=> (not res!490770) (not e!408779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64730 (= res!490770 (validMask!0 mask!3328))))

(assert (=> start!64730 e!408779))

(assert (=> start!64730 true))

(declare-fun array_inv!15505 (array!41179) Bool)

(assert (=> start!64730 (array_inv!15505 a!3186)))

(declare-fun b!730475 () Bool)

(declare-fun res!490758 () Bool)

(assert (=> b!730475 (=> (not res!490758) (not e!408779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730475 (= res!490758 (validKeyInArray!0 k!2102))))

(declare-fun b!730476 () Bool)

(declare-fun e!408777 () Bool)

(declare-fun e!408780 () Bool)

(assert (=> b!730476 (= e!408777 e!408780)))

(declare-fun res!490764 () Bool)

(assert (=> b!730476 (=> (not res!490764) (not e!408780))))

(declare-fun lt!323680 () SeekEntryResult!7309)

(assert (=> b!730476 (= res!490764 (= (seekEntryOrOpen!0 (select (arr!19709 a!3186) j!159) a!3186 mask!3328) lt!323680))))

(assert (=> b!730476 (= lt!323680 (Found!7309 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!730477 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41179 (_ BitVec 32)) SeekEntryResult!7309)

(assert (=> b!730477 (= e!408785 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19709 a!3186) j!159) a!3186 mask!3328) (Found!7309 j!159)))))

(declare-fun b!730478 () Bool)

(assert (=> b!730478 (= e!408778 e!408782)))

(declare-fun res!490761 () Bool)

(assert (=> b!730478 (=> (not res!490761) (not e!408782))))

(assert (=> b!730478 (= res!490761 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19709 a!3186) j!159) mask!3328) (select (arr!19709 a!3186) j!159) a!3186 mask!3328) lt!323678))))

(assert (=> b!730478 (= lt!323678 (Intermediate!7309 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730479 () Bool)

(declare-fun res!490768 () Bool)

(assert (=> b!730479 (=> (not res!490768) (not e!408779))))

(assert (=> b!730479 (= res!490768 (and (= (size!20130 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20130 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20130 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730480 () Bool)

(declare-fun res!490769 () Bool)

(assert (=> b!730480 (=> (not res!490769) (not e!408782))))

(assert (=> b!730480 (= res!490769 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19709 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730481 () Bool)

(declare-fun res!490771 () Bool)

(assert (=> b!730481 (=> (not res!490771) (not e!408779))))

(assert (=> b!730481 (= res!490771 (validKeyInArray!0 (select (arr!19709 a!3186) j!159)))))

(declare-fun b!730482 () Bool)

(assert (=> b!730482 (= e!408780 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19709 a!3186) j!159) a!3186 mask!3328) lt!323680))))

(declare-fun b!730483 () Bool)

(declare-fun res!490762 () Bool)

(assert (=> b!730483 (=> (not res!490762) (not e!408779))))

(declare-fun arrayContainsKey!0 (array!41179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730483 (= res!490762 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730484 () Bool)

(assert (=> b!730484 (= e!408783 (not e!408781))))

(declare-fun res!490763 () Bool)

(assert (=> b!730484 (=> res!490763 e!408781)))

(assert (=> b!730484 (= res!490763 (or (not (is-Intermediate!7309 lt!323683)) (bvsge x!1131 (x!62579 lt!323683))))))

(assert (=> b!730484 e!408777))

(declare-fun res!490759 () Bool)

(assert (=> b!730484 (=> (not res!490759) (not e!408777))))

(assert (=> b!730484 (= res!490759 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24936 0))(
  ( (Unit!24937) )
))
(declare-fun lt!323682 () Unit!24936)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41179 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24936)

(assert (=> b!730484 (= lt!323682 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730485 () Bool)

(declare-fun res!490772 () Bool)

(assert (=> b!730485 (=> (not res!490772) (not e!408778))))

(assert (=> b!730485 (= res!490772 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20130 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20130 a!3186))))))

(assert (= (and start!64730 res!490770) b!730479))

(assert (= (and b!730479 res!490768) b!730481))

(assert (= (and b!730481 res!490771) b!730475))

(assert (= (and b!730475 res!490758) b!730483))

(assert (= (and b!730483 res!490762) b!730470))

(assert (= (and b!730470 res!490766) b!730468))

(assert (= (and b!730468 res!490760) b!730474))

(assert (= (and b!730474 res!490765) b!730485))

(assert (= (and b!730485 res!490772) b!730478))

(assert (= (and b!730478 res!490761) b!730480))

(assert (= (and b!730480 res!490769) b!730473))

(assert (= (and b!730473 c!80230) b!730471))

(assert (= (and b!730473 (not c!80230)) b!730477))

(assert (= (and b!730473 res!490767) b!730469))

(assert (= (and b!730469 res!490757) b!730484))

(assert (= (and b!730484 res!490759) b!730476))

(assert (= (and b!730476 res!490764) b!730482))

(assert (= (and b!730484 (not res!490763)) b!730472))

(declare-fun m!683995 () Bool)

(assert (=> b!730481 m!683995))

(assert (=> b!730481 m!683995))

(declare-fun m!683997 () Bool)

(assert (=> b!730481 m!683997))

(assert (=> b!730482 m!683995))

(assert (=> b!730482 m!683995))

(declare-fun m!683999 () Bool)

(assert (=> b!730482 m!683999))

(declare-fun m!684001 () Bool)

(assert (=> b!730484 m!684001))

(declare-fun m!684003 () Bool)

(assert (=> b!730484 m!684003))

(declare-fun m!684005 () Bool)

(assert (=> b!730468 m!684005))

(declare-fun m!684007 () Bool)

(assert (=> b!730470 m!684007))

(assert (=> b!730471 m!683995))

(assert (=> b!730471 m!683995))

(declare-fun m!684009 () Bool)

(assert (=> b!730471 m!684009))

(declare-fun m!684011 () Bool)

(assert (=> b!730480 m!684011))

(declare-fun m!684013 () Bool)

(assert (=> start!64730 m!684013))

(declare-fun m!684015 () Bool)

(assert (=> start!64730 m!684015))

(assert (=> b!730476 m!683995))

(assert (=> b!730476 m!683995))

(declare-fun m!684017 () Bool)

(assert (=> b!730476 m!684017))

(assert (=> b!730477 m!683995))

(assert (=> b!730477 m!683995))

(declare-fun m!684019 () Bool)

(assert (=> b!730477 m!684019))

(declare-fun m!684021 () Bool)

(assert (=> b!730474 m!684021))

(declare-fun m!684023 () Bool)

(assert (=> b!730475 m!684023))

(declare-fun m!684025 () Bool)

(assert (=> b!730472 m!684025))

(assert (=> b!730478 m!683995))

(assert (=> b!730478 m!683995))

(declare-fun m!684027 () Bool)

(assert (=> b!730478 m!684027))

(assert (=> b!730478 m!684027))

(assert (=> b!730478 m!683995))

(declare-fun m!684029 () Bool)

(assert (=> b!730478 m!684029))

(declare-fun m!684031 () Bool)

(assert (=> b!730483 m!684031))

(declare-fun m!684033 () Bool)

(assert (=> b!730469 m!684033))

(declare-fun m!684035 () Bool)

(assert (=> b!730469 m!684035))

(declare-fun m!684037 () Bool)

(assert (=> b!730469 m!684037))

(assert (=> b!730469 m!684035))

(declare-fun m!684039 () Bool)

(assert (=> b!730469 m!684039))

(declare-fun m!684041 () Bool)

(assert (=> b!730469 m!684041))

(push 1)

