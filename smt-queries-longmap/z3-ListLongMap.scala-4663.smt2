; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64878 () Bool)

(assert start!64878)

(declare-datatypes ((array!41197 0))(
  ( (array!41198 (arr!19714 (Array (_ BitVec 32) (_ BitVec 64))) (size!20134 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41197)

(declare-fun b!731782 () Bool)

(declare-fun e!409551 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7270 0))(
  ( (MissingZero!7270 (index!31448 (_ BitVec 32))) (Found!7270 (index!31449 (_ BitVec 32))) (Intermediate!7270 (undefined!8082 Bool) (index!31450 (_ BitVec 32)) (x!62584 (_ BitVec 32))) (Undefined!7270) (MissingVacant!7270 (index!31451 (_ BitVec 32))) )
))
(declare-fun lt!324271 () SeekEntryResult!7270)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41197 (_ BitVec 32)) SeekEntryResult!7270)

(assert (=> b!731782 (= e!409551 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19714 a!3186) j!159) a!3186 mask!3328) lt!324271))))

(declare-fun b!731783 () Bool)

(declare-fun e!409553 () Bool)

(declare-fun e!409547 () Bool)

(assert (=> b!731783 (= e!409553 e!409547)))

(declare-fun res!491571 () Bool)

(assert (=> b!731783 (=> (not res!491571) (not e!409547))))

(declare-fun lt!324278 () SeekEntryResult!7270)

(declare-fun lt!324275 () SeekEntryResult!7270)

(assert (=> b!731783 (= res!491571 (= lt!324278 lt!324275))))

(declare-fun lt!324277 () (_ BitVec 64))

(declare-fun lt!324272 () array!41197)

(assert (=> b!731783 (= lt!324275 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324277 lt!324272 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731783 (= lt!324278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324277 mask!3328) lt!324277 lt!324272 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!731783 (= lt!324277 (select (store (arr!19714 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!731783 (= lt!324272 (array!41198 (store (arr!19714 a!3186) i!1173 k0!2102) (size!20134 a!3186)))))

(declare-fun b!731784 () Bool)

(declare-fun res!491573 () Bool)

(declare-fun e!409554 () Bool)

(assert (=> b!731784 (=> (not res!491573) (not e!409554))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!731784 (= res!491573 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20134 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20134 a!3186))))))

(declare-fun b!731785 () Bool)

(declare-fun res!491584 () Bool)

(declare-fun e!409549 () Bool)

(assert (=> b!731785 (=> (not res!491584) (not e!409549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!731785 (= res!491584 (validKeyInArray!0 (select (arr!19714 a!3186) j!159)))))

(declare-fun b!731786 () Bool)

(declare-fun res!491586 () Bool)

(assert (=> b!731786 (=> (not res!491586) (not e!409554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41197 (_ BitVec 32)) Bool)

(assert (=> b!731786 (= res!491586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!731787 () Bool)

(declare-fun res!491578 () Bool)

(assert (=> b!731787 (=> (not res!491578) (not e!409549))))

(assert (=> b!731787 (= res!491578 (and (= (size!20134 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20134 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20134 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!731788 () Bool)

(declare-fun res!491585 () Bool)

(assert (=> b!731788 (=> (not res!491585) (not e!409549))))

(declare-fun arrayContainsKey!0 (array!41197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!731788 (= res!491585 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!731789 () Bool)

(assert (=> b!731789 (= e!409549 e!409554)))

(declare-fun res!491579 () Bool)

(assert (=> b!731789 (=> (not res!491579) (not e!409554))))

(declare-fun lt!324273 () SeekEntryResult!7270)

(assert (=> b!731789 (= res!491579 (or (= lt!324273 (MissingZero!7270 i!1173)) (= lt!324273 (MissingVacant!7270 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41197 (_ BitVec 32)) SeekEntryResult!7270)

(assert (=> b!731789 (= lt!324273 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!491575 () Bool)

(assert (=> start!64878 (=> (not res!491575) (not e!409549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64878 (= res!491575 (validMask!0 mask!3328))))

(assert (=> start!64878 e!409549))

(assert (=> start!64878 true))

(declare-fun array_inv!15573 (array!41197) Bool)

(assert (=> start!64878 (array_inv!15573 a!3186)))

(declare-fun b!731790 () Bool)

(declare-fun e!409545 () Bool)

(assert (=> b!731790 (= e!409547 (not e!409545))))

(declare-fun res!491583 () Bool)

(assert (=> b!731790 (=> res!491583 e!409545)))

(get-info :version)

(assert (=> b!731790 (= res!491583 (or (not ((_ is Intermediate!7270) lt!324275)) (bvsge x!1131 (x!62584 lt!324275))))))

(declare-fun e!409550 () Bool)

(assert (=> b!731790 e!409550))

(declare-fun res!491576 () Bool)

(assert (=> b!731790 (=> (not res!491576) (not e!409550))))

(assert (=> b!731790 (= res!491576 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24937 0))(
  ( (Unit!24938) )
))
(declare-fun lt!324274 () Unit!24937)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41197 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24937)

(assert (=> b!731790 (= lt!324274 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!731791 () Bool)

(assert (=> b!731791 (= e!409554 e!409553)))

(declare-fun res!491577 () Bool)

(assert (=> b!731791 (=> (not res!491577) (not e!409553))))

(assert (=> b!731791 (= res!491577 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19714 a!3186) j!159) mask!3328) (select (arr!19714 a!3186) j!159) a!3186 mask!3328) lt!324271))))

(assert (=> b!731791 (= lt!324271 (Intermediate!7270 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!731792 () Bool)

(declare-fun res!491574 () Bool)

(assert (=> b!731792 (=> (not res!491574) (not e!409549))))

(assert (=> b!731792 (= res!491574 (validKeyInArray!0 k0!2102))))

(declare-fun b!731793 () Bool)

(declare-fun res!491587 () Bool)

(assert (=> b!731793 (=> (not res!491587) (not e!409553))))

(assert (=> b!731793 (= res!491587 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19714 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!324270 () SeekEntryResult!7270)

(declare-fun b!731794 () Bool)

(declare-fun e!409552 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41197 (_ BitVec 32)) SeekEntryResult!7270)

(assert (=> b!731794 (= e!409552 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19714 a!3186) j!159) a!3186 mask!3328) lt!324270))))

(declare-fun b!731795 () Bool)

(declare-fun e!409548 () Bool)

(assert (=> b!731795 (= e!409545 e!409548)))

(declare-fun res!491581 () Bool)

(assert (=> b!731795 (=> res!491581 e!409548)))

(assert (=> b!731795 (= res!491581 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324276 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731795 (= lt!324276 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!731796 () Bool)

(declare-fun res!491580 () Bool)

(assert (=> b!731796 (=> (not res!491580) (not e!409553))))

(assert (=> b!731796 (= res!491580 e!409551)))

(declare-fun c!80483 () Bool)

(assert (=> b!731796 (= c!80483 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!731797 () Bool)

(assert (=> b!731797 (= e!409551 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19714 a!3186) j!159) a!3186 mask!3328) (Found!7270 j!159)))))

(declare-fun b!731798 () Bool)

(assert (=> b!731798 (= e!409550 e!409552)))

(declare-fun res!491572 () Bool)

(assert (=> b!731798 (=> (not res!491572) (not e!409552))))

(assert (=> b!731798 (= res!491572 (= (seekEntryOrOpen!0 (select (arr!19714 a!3186) j!159) a!3186 mask!3328) lt!324270))))

(assert (=> b!731798 (= lt!324270 (Found!7270 j!159))))

(declare-fun b!731799 () Bool)

(declare-fun res!491582 () Bool)

(assert (=> b!731799 (=> (not res!491582) (not e!409554))))

(declare-datatypes ((List!13623 0))(
  ( (Nil!13620) (Cons!13619 (h!14685 (_ BitVec 64)) (t!19930 List!13623)) )
))
(declare-fun arrayNoDuplicates!0 (array!41197 (_ BitVec 32) List!13623) Bool)

(assert (=> b!731799 (= res!491582 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13620))))

(declare-fun b!731800 () Bool)

(assert (=> b!731800 (= e!409548 true)))

(declare-fun lt!324279 () SeekEntryResult!7270)

(assert (=> b!731800 (= lt!324279 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19714 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!64878 res!491575) b!731787))

(assert (= (and b!731787 res!491578) b!731785))

(assert (= (and b!731785 res!491584) b!731792))

(assert (= (and b!731792 res!491574) b!731788))

(assert (= (and b!731788 res!491585) b!731789))

(assert (= (and b!731789 res!491579) b!731786))

(assert (= (and b!731786 res!491586) b!731799))

(assert (= (and b!731799 res!491582) b!731784))

(assert (= (and b!731784 res!491573) b!731791))

(assert (= (and b!731791 res!491577) b!731793))

(assert (= (and b!731793 res!491587) b!731796))

(assert (= (and b!731796 c!80483) b!731782))

(assert (= (and b!731796 (not c!80483)) b!731797))

(assert (= (and b!731796 res!491580) b!731783))

(assert (= (and b!731783 res!491571) b!731790))

(assert (= (and b!731790 res!491576) b!731798))

(assert (= (and b!731798 res!491572) b!731794))

(assert (= (and b!731790 (not res!491583)) b!731795))

(assert (= (and b!731795 (not res!491581)) b!731800))

(declare-fun m!685611 () Bool)

(assert (=> b!731788 m!685611))

(declare-fun m!685613 () Bool)

(assert (=> b!731785 m!685613))

(assert (=> b!731785 m!685613))

(declare-fun m!685615 () Bool)

(assert (=> b!731785 m!685615))

(assert (=> b!731800 m!685613))

(assert (=> b!731800 m!685613))

(declare-fun m!685617 () Bool)

(assert (=> b!731800 m!685617))

(declare-fun m!685619 () Bool)

(assert (=> b!731795 m!685619))

(declare-fun m!685621 () Bool)

(assert (=> b!731792 m!685621))

(declare-fun m!685623 () Bool)

(assert (=> b!731790 m!685623))

(declare-fun m!685625 () Bool)

(assert (=> b!731790 m!685625))

(declare-fun m!685627 () Bool)

(assert (=> b!731786 m!685627))

(declare-fun m!685629 () Bool)

(assert (=> b!731799 m!685629))

(assert (=> b!731798 m!685613))

(assert (=> b!731798 m!685613))

(declare-fun m!685631 () Bool)

(assert (=> b!731798 m!685631))

(assert (=> b!731791 m!685613))

(assert (=> b!731791 m!685613))

(declare-fun m!685633 () Bool)

(assert (=> b!731791 m!685633))

(assert (=> b!731791 m!685633))

(assert (=> b!731791 m!685613))

(declare-fun m!685635 () Bool)

(assert (=> b!731791 m!685635))

(declare-fun m!685637 () Bool)

(assert (=> b!731783 m!685637))

(declare-fun m!685639 () Bool)

(assert (=> b!731783 m!685639))

(declare-fun m!685641 () Bool)

(assert (=> b!731783 m!685641))

(declare-fun m!685643 () Bool)

(assert (=> b!731783 m!685643))

(declare-fun m!685645 () Bool)

(assert (=> b!731783 m!685645))

(assert (=> b!731783 m!685639))

(assert (=> b!731797 m!685613))

(assert (=> b!731797 m!685613))

(assert (=> b!731797 m!685617))

(assert (=> b!731782 m!685613))

(assert (=> b!731782 m!685613))

(declare-fun m!685647 () Bool)

(assert (=> b!731782 m!685647))

(assert (=> b!731794 m!685613))

(assert (=> b!731794 m!685613))

(declare-fun m!685649 () Bool)

(assert (=> b!731794 m!685649))

(declare-fun m!685651 () Bool)

(assert (=> b!731793 m!685651))

(declare-fun m!685653 () Bool)

(assert (=> start!64878 m!685653))

(declare-fun m!685655 () Bool)

(assert (=> start!64878 m!685655))

(declare-fun m!685657 () Bool)

(assert (=> b!731789 m!685657))

(check-sat (not start!64878) (not b!731794) (not b!731785) (not b!731783) (not b!731799) (not b!731795) (not b!731782) (not b!731798) (not b!731790) (not b!731800) (not b!731792) (not b!731789) (not b!731786) (not b!731791) (not b!731797) (not b!731788))
(check-sat)
