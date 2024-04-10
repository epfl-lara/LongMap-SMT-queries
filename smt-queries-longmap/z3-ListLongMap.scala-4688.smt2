; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65190 () Bool)

(assert start!65190)

(declare-fun res!495821 () Bool)

(declare-fun e!412572 () Bool)

(assert (=> start!65190 (=> (not res!495821) (not e!412572))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65190 (= res!495821 (validMask!0 mask!3328))))

(assert (=> start!65190 e!412572))

(assert (=> start!65190 true))

(declare-datatypes ((array!41363 0))(
  ( (array!41364 (arr!19795 (Array (_ BitVec 32) (_ BitVec 64))) (size!20216 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41363)

(declare-fun array_inv!15591 (array!41363) Bool)

(assert (=> start!65190 (array_inv!15591 a!3186)))

(declare-fun b!737620 () Bool)

(declare-fun e!412570 () Bool)

(declare-fun e!412565 () Bool)

(assert (=> b!737620 (= e!412570 e!412565)))

(declare-fun res!495818 () Bool)

(assert (=> b!737620 (=> (not res!495818) (not e!412565))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7395 0))(
  ( (MissingZero!7395 (index!31948 (_ BitVec 32))) (Found!7395 (index!31949 (_ BitVec 32))) (Intermediate!7395 (undefined!8207 Bool) (index!31950 (_ BitVec 32)) (x!62945 (_ BitVec 32))) (Undefined!7395) (MissingVacant!7395 (index!31951 (_ BitVec 32))) )
))
(declare-fun lt!327295 () SeekEntryResult!7395)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41363 (_ BitVec 32)) SeekEntryResult!7395)

(assert (=> b!737620 (= res!495818 (= (seekEntryOrOpen!0 (select (arr!19795 a!3186) j!159) a!3186 mask!3328) lt!327295))))

(assert (=> b!737620 (= lt!327295 (Found!7395 j!159))))

(declare-fun b!737621 () Bool)

(declare-fun e!412573 () Bool)

(declare-fun e!412564 () Bool)

(assert (=> b!737621 (= e!412573 e!412564)))

(declare-fun res!495828 () Bool)

(assert (=> b!737621 (=> (not res!495828) (not e!412564))))

(declare-fun lt!327296 () SeekEntryResult!7395)

(declare-fun lt!327289 () SeekEntryResult!7395)

(assert (=> b!737621 (= res!495828 (= lt!327296 lt!327289))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!327298 () array!41363)

(declare-fun lt!327294 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41363 (_ BitVec 32)) SeekEntryResult!7395)

(assert (=> b!737621 (= lt!327289 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327294 lt!327298 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737621 (= lt!327296 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327294 mask!3328) lt!327294 lt!327298 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!737621 (= lt!327294 (select (store (arr!19795 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!737621 (= lt!327298 (array!41364 (store (arr!19795 a!3186) i!1173 k0!2102) (size!20216 a!3186)))))

(declare-fun b!737622 () Bool)

(declare-fun e!412566 () Bool)

(assert (=> b!737622 (= e!412566 e!412573)))

(declare-fun res!495817 () Bool)

(assert (=> b!737622 (=> (not res!495817) (not e!412573))))

(declare-fun lt!327286 () SeekEntryResult!7395)

(assert (=> b!737622 (= res!495817 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19795 a!3186) j!159) mask!3328) (select (arr!19795 a!3186) j!159) a!3186 mask!3328) lt!327286))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!737622 (= lt!327286 (Intermediate!7395 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737623 () Bool)

(declare-fun res!495824 () Bool)

(assert (=> b!737623 (=> (not res!495824) (not e!412572))))

(assert (=> b!737623 (= res!495824 (and (= (size!20216 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20216 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20216 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737624 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41363 (_ BitVec 32)) SeekEntryResult!7395)

(assert (=> b!737624 (= e!412565 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19795 a!3186) j!159) a!3186 mask!3328) lt!327295))))

(declare-fun b!737625 () Bool)

(declare-fun res!495823 () Bool)

(assert (=> b!737625 (=> (not res!495823) (not e!412572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737625 (= res!495823 (validKeyInArray!0 k0!2102))))

(declare-fun b!737626 () Bool)

(declare-fun lt!327290 () (_ BitVec 32))

(declare-fun e!412567 () Bool)

(declare-fun lt!327291 () SeekEntryResult!7395)

(assert (=> b!737626 (= e!412567 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327290 resIntermediateIndex!5 (select (arr!19795 a!3186) j!159) a!3186 mask!3328) lt!327291)))))

(declare-fun b!737627 () Bool)

(assert (=> b!737627 (= e!412572 e!412566)))

(declare-fun res!495822 () Bool)

(assert (=> b!737627 (=> (not res!495822) (not e!412566))))

(declare-fun lt!327299 () SeekEntryResult!7395)

(assert (=> b!737627 (= res!495822 (or (= lt!327299 (MissingZero!7395 i!1173)) (= lt!327299 (MissingVacant!7395 i!1173))))))

(assert (=> b!737627 (= lt!327299 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!737628 () Bool)

(declare-fun res!495813 () Bool)

(assert (=> b!737628 (=> (not res!495813) (not e!412566))))

(declare-datatypes ((List!13797 0))(
  ( (Nil!13794) (Cons!13793 (h!14865 (_ BitVec 64)) (t!20112 List!13797)) )
))
(declare-fun arrayNoDuplicates!0 (array!41363 (_ BitVec 32) List!13797) Bool)

(assert (=> b!737628 (= res!495813 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13794))))

(declare-fun b!737629 () Bool)

(declare-fun res!495816 () Bool)

(assert (=> b!737629 (=> (not res!495816) (not e!412573))))

(declare-fun e!412574 () Bool)

(assert (=> b!737629 (= res!495816 e!412574)))

(declare-fun c!81286 () Bool)

(assert (=> b!737629 (= c!81286 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!737630 () Bool)

(declare-fun res!495815 () Bool)

(declare-fun e!412563 () Bool)

(assert (=> b!737630 (=> res!495815 e!412563)))

(assert (=> b!737630 (= res!495815 e!412567)))

(declare-fun c!81285 () Bool)

(declare-fun lt!327288 () Bool)

(assert (=> b!737630 (= c!81285 lt!327288)))

(declare-fun b!737631 () Bool)

(declare-fun res!495814 () Bool)

(assert (=> b!737631 (=> (not res!495814) (not e!412566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41363 (_ BitVec 32)) Bool)

(assert (=> b!737631 (= res!495814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737632 () Bool)

(assert (=> b!737632 (= e!412563 true)))

(declare-fun lt!327287 () SeekEntryResult!7395)

(assert (=> b!737632 (= lt!327287 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327290 lt!327294 lt!327298 mask!3328))))

(declare-fun b!737633 () Bool)

(declare-fun e!412571 () Bool)

(assert (=> b!737633 (= e!412564 (not e!412571))))

(declare-fun res!495829 () Bool)

(assert (=> b!737633 (=> res!495829 e!412571)))

(get-info :version)

(assert (=> b!737633 (= res!495829 (or (not ((_ is Intermediate!7395) lt!327289)) (bvsge x!1131 (x!62945 lt!327289))))))

(assert (=> b!737633 (= lt!327291 (Found!7395 j!159))))

(assert (=> b!737633 e!412570))

(declare-fun res!495827 () Bool)

(assert (=> b!737633 (=> (not res!495827) (not e!412570))))

(assert (=> b!737633 (= res!495827 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25176 0))(
  ( (Unit!25177) )
))
(declare-fun lt!327293 () Unit!25176)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41363 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25176)

(assert (=> b!737633 (= lt!327293 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737634 () Bool)

(declare-fun res!495825 () Bool)

(assert (=> b!737634 (=> (not res!495825) (not e!412572))))

(assert (=> b!737634 (= res!495825 (validKeyInArray!0 (select (arr!19795 a!3186) j!159)))))

(declare-fun b!737635 () Bool)

(declare-fun e!412568 () Unit!25176)

(declare-fun Unit!25178 () Unit!25176)

(assert (=> b!737635 (= e!412568 Unit!25178)))

(assert (=> b!737635 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327290 (select (arr!19795 a!3186) j!159) a!3186 mask!3328) lt!327286)))

(declare-fun b!737636 () Bool)

(assert (=> b!737636 (= e!412567 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327290 (select (arr!19795 a!3186) j!159) a!3186 mask!3328) lt!327286)))))

(declare-fun b!737637 () Bool)

(declare-fun res!495830 () Bool)

(assert (=> b!737637 (=> (not res!495830) (not e!412573))))

(assert (=> b!737637 (= res!495830 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19795 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!737638 () Bool)

(declare-fun res!495819 () Bool)

(assert (=> b!737638 (=> (not res!495819) (not e!412566))))

(assert (=> b!737638 (= res!495819 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20216 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20216 a!3186))))))

(declare-fun b!737639 () Bool)

(assert (=> b!737639 (= e!412574 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19795 a!3186) j!159) a!3186 mask!3328) (Found!7395 j!159)))))

(declare-fun b!737640 () Bool)

(declare-fun Unit!25179 () Unit!25176)

(assert (=> b!737640 (= e!412568 Unit!25179)))

(declare-fun lt!327292 () SeekEntryResult!7395)

(assert (=> b!737640 (= lt!327292 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19795 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!737640 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327290 resIntermediateIndex!5 (select (arr!19795 a!3186) j!159) a!3186 mask!3328) lt!327291)))

(declare-fun b!737641 () Bool)

(declare-fun res!495826 () Bool)

(assert (=> b!737641 (=> (not res!495826) (not e!412572))))

(declare-fun arrayContainsKey!0 (array!41363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737641 (= res!495826 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737642 () Bool)

(assert (=> b!737642 (= e!412574 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19795 a!3186) j!159) a!3186 mask!3328) lt!327286))))

(declare-fun b!737643 () Bool)

(assert (=> b!737643 (= e!412571 e!412563)))

(declare-fun res!495820 () Bool)

(assert (=> b!737643 (=> res!495820 e!412563)))

(assert (=> b!737643 (= res!495820 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327290 #b00000000000000000000000000000000) (bvsge lt!327290 (size!20216 a!3186))))))

(declare-fun lt!327297 () Unit!25176)

(assert (=> b!737643 (= lt!327297 e!412568)))

(declare-fun c!81284 () Bool)

(assert (=> b!737643 (= c!81284 lt!327288)))

(assert (=> b!737643 (= lt!327288 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737643 (= lt!327290 (nextIndex!0 index!1321 x!1131 mask!3328))))

(assert (= (and start!65190 res!495821) b!737623))

(assert (= (and b!737623 res!495824) b!737634))

(assert (= (and b!737634 res!495825) b!737625))

(assert (= (and b!737625 res!495823) b!737641))

(assert (= (and b!737641 res!495826) b!737627))

(assert (= (and b!737627 res!495822) b!737631))

(assert (= (and b!737631 res!495814) b!737628))

(assert (= (and b!737628 res!495813) b!737638))

(assert (= (and b!737638 res!495819) b!737622))

(assert (= (and b!737622 res!495817) b!737637))

(assert (= (and b!737637 res!495830) b!737629))

(assert (= (and b!737629 c!81286) b!737642))

(assert (= (and b!737629 (not c!81286)) b!737639))

(assert (= (and b!737629 res!495816) b!737621))

(assert (= (and b!737621 res!495828) b!737633))

(assert (= (and b!737633 res!495827) b!737620))

(assert (= (and b!737620 res!495818) b!737624))

(assert (= (and b!737633 (not res!495829)) b!737643))

(assert (= (and b!737643 c!81284) b!737635))

(assert (= (and b!737643 (not c!81284)) b!737640))

(assert (= (and b!737643 (not res!495820)) b!737630))

(assert (= (and b!737630 c!81285) b!737636))

(assert (= (and b!737630 (not c!81285)) b!737626))

(assert (= (and b!737630 (not res!495815)) b!737632))

(declare-fun m!689455 () Bool)

(assert (=> b!737632 m!689455))

(declare-fun m!689457 () Bool)

(assert (=> b!737635 m!689457))

(assert (=> b!737635 m!689457))

(declare-fun m!689459 () Bool)

(assert (=> b!737635 m!689459))

(declare-fun m!689461 () Bool)

(assert (=> b!737633 m!689461))

(declare-fun m!689463 () Bool)

(assert (=> b!737633 m!689463))

(declare-fun m!689465 () Bool)

(assert (=> b!737631 m!689465))

(assert (=> b!737640 m!689457))

(assert (=> b!737640 m!689457))

(declare-fun m!689467 () Bool)

(assert (=> b!737640 m!689467))

(assert (=> b!737640 m!689457))

(declare-fun m!689469 () Bool)

(assert (=> b!737640 m!689469))

(assert (=> b!737626 m!689457))

(assert (=> b!737626 m!689457))

(assert (=> b!737626 m!689469))

(assert (=> b!737622 m!689457))

(assert (=> b!737622 m!689457))

(declare-fun m!689471 () Bool)

(assert (=> b!737622 m!689471))

(assert (=> b!737622 m!689471))

(assert (=> b!737622 m!689457))

(declare-fun m!689473 () Bool)

(assert (=> b!737622 m!689473))

(declare-fun m!689475 () Bool)

(assert (=> b!737628 m!689475))

(assert (=> b!737639 m!689457))

(assert (=> b!737639 m!689457))

(assert (=> b!737639 m!689467))

(assert (=> b!737634 m!689457))

(assert (=> b!737634 m!689457))

(declare-fun m!689477 () Bool)

(assert (=> b!737634 m!689477))

(declare-fun m!689479 () Bool)

(assert (=> start!65190 m!689479))

(declare-fun m!689481 () Bool)

(assert (=> start!65190 m!689481))

(declare-fun m!689483 () Bool)

(assert (=> b!737625 m!689483))

(assert (=> b!737642 m!689457))

(assert (=> b!737642 m!689457))

(declare-fun m!689485 () Bool)

(assert (=> b!737642 m!689485))

(declare-fun m!689487 () Bool)

(assert (=> b!737641 m!689487))

(declare-fun m!689489 () Bool)

(assert (=> b!737627 m!689489))

(declare-fun m!689491 () Bool)

(assert (=> b!737621 m!689491))

(declare-fun m!689493 () Bool)

(assert (=> b!737621 m!689493))

(declare-fun m!689495 () Bool)

(assert (=> b!737621 m!689495))

(assert (=> b!737621 m!689491))

(declare-fun m!689497 () Bool)

(assert (=> b!737621 m!689497))

(declare-fun m!689499 () Bool)

(assert (=> b!737621 m!689499))

(assert (=> b!737624 m!689457))

(assert (=> b!737624 m!689457))

(declare-fun m!689501 () Bool)

(assert (=> b!737624 m!689501))

(declare-fun m!689503 () Bool)

(assert (=> b!737643 m!689503))

(assert (=> b!737620 m!689457))

(assert (=> b!737620 m!689457))

(declare-fun m!689505 () Bool)

(assert (=> b!737620 m!689505))

(declare-fun m!689507 () Bool)

(assert (=> b!737637 m!689507))

(assert (=> b!737636 m!689457))

(assert (=> b!737636 m!689457))

(assert (=> b!737636 m!689459))

(check-sat (not b!737640) (not b!737639) (not b!737641) (not b!737624) (not b!737620) (not b!737628) (not b!737632) (not b!737642) (not start!65190) (not b!737622) (not b!737631) (not b!737633) (not b!737634) (not b!737621) (not b!737627) (not b!737636) (not b!737626) (not b!737643) (not b!737635) (not b!737625))
(check-sat)
