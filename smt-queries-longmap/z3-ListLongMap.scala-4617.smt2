; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64338 () Bool)

(assert start!64338)

(declare-fun b!723112 () Bool)

(declare-fun e!405173 () Bool)

(declare-fun e!405172 () Bool)

(assert (=> b!723112 (= e!405173 e!405172)))

(declare-fun res!484738 () Bool)

(assert (=> b!723112 (=> (not res!484738) (not e!405172))))

(declare-fun lt!320562 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!40919 0))(
  ( (array!40920 (arr!19582 (Array (_ BitVec 32) (_ BitVec 64))) (size!20003 (_ BitVec 32))) )
))
(declare-fun lt!320564 () array!40919)

(declare-datatypes ((SeekEntryResult!7182 0))(
  ( (MissingZero!7182 (index!31096 (_ BitVec 32))) (Found!7182 (index!31097 (_ BitVec 32))) (Intermediate!7182 (undefined!7994 Bool) (index!31098 (_ BitVec 32)) (x!62095 (_ BitVec 32))) (Undefined!7182) (MissingVacant!7182 (index!31099 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40919 (_ BitVec 32)) SeekEntryResult!7182)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723112 (= res!484738 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320562 mask!3328) lt!320562 lt!320564 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320562 lt!320564 mask!3328)))))

(declare-fun a!3186 () array!40919)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!723112 (= lt!320562 (select (store (arr!19582 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723112 (= lt!320564 (array!40920 (store (arr!19582 a!3186) i!1173 k0!2102) (size!20003 a!3186)))))

(declare-fun b!723113 () Bool)

(declare-fun res!484734 () Bool)

(declare-fun e!405176 () Bool)

(assert (=> b!723113 (=> (not res!484734) (not e!405176))))

(declare-datatypes ((List!13584 0))(
  ( (Nil!13581) (Cons!13580 (h!14634 (_ BitVec 64)) (t!19899 List!13584)) )
))
(declare-fun arrayNoDuplicates!0 (array!40919 (_ BitVec 32) List!13584) Bool)

(assert (=> b!723113 (= res!484734 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13581))))

(declare-fun b!723114 () Bool)

(declare-fun res!484727 () Bool)

(assert (=> b!723114 (=> (not res!484727) (not e!405173))))

(declare-fun e!405175 () Bool)

(assert (=> b!723114 (= res!484727 e!405175)))

(declare-fun c!79564 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723114 (= c!79564 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!484729 () Bool)

(declare-fun e!405174 () Bool)

(assert (=> start!64338 (=> (not res!484729) (not e!405174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64338 (= res!484729 (validMask!0 mask!3328))))

(assert (=> start!64338 e!405174))

(assert (=> start!64338 true))

(declare-fun array_inv!15378 (array!40919) Bool)

(assert (=> start!64338 (array_inv!15378 a!3186)))

(declare-fun b!723115 () Bool)

(declare-fun res!484736 () Bool)

(assert (=> b!723115 (=> (not res!484736) (not e!405174))))

(declare-fun arrayContainsKey!0 (array!40919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723115 (= res!484736 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723116 () Bool)

(declare-fun res!484735 () Bool)

(assert (=> b!723116 (=> (not res!484735) (not e!405173))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!723116 (= res!484735 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19582 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723117 () Bool)

(assert (=> b!723117 (= e!405174 e!405176)))

(declare-fun res!484733 () Bool)

(assert (=> b!723117 (=> (not res!484733) (not e!405176))))

(declare-fun lt!320561 () SeekEntryResult!7182)

(assert (=> b!723117 (= res!484733 (or (= lt!320561 (MissingZero!7182 i!1173)) (= lt!320561 (MissingVacant!7182 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40919 (_ BitVec 32)) SeekEntryResult!7182)

(assert (=> b!723117 (= lt!320561 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723118 () Bool)

(declare-fun res!484731 () Bool)

(assert (=> b!723118 (=> (not res!484731) (not e!405174))))

(assert (=> b!723118 (= res!484731 (and (= (size!20003 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20003 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20003 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723119 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40919 (_ BitVec 32)) SeekEntryResult!7182)

(assert (=> b!723119 (= e!405175 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19582 a!3186) j!159) a!3186 mask!3328) (Found!7182 j!159)))))

(declare-fun lt!320563 () SeekEntryResult!7182)

(declare-fun b!723120 () Bool)

(assert (=> b!723120 (= e!405175 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19582 a!3186) j!159) a!3186 mask!3328) lt!320563))))

(declare-fun b!723121 () Bool)

(declare-fun res!484737 () Bool)

(assert (=> b!723121 (=> (not res!484737) (not e!405176))))

(assert (=> b!723121 (= res!484737 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20003 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20003 a!3186))))))

(declare-fun b!723122 () Bool)

(assert (=> b!723122 (= e!405172 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40919 (_ BitVec 32)) Bool)

(assert (=> b!723122 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24682 0))(
  ( (Unit!24683) )
))
(declare-fun lt!320560 () Unit!24682)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40919 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24682)

(assert (=> b!723122 (= lt!320560 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723123 () Bool)

(declare-fun res!484732 () Bool)

(assert (=> b!723123 (=> (not res!484732) (not e!405174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723123 (= res!484732 (validKeyInArray!0 (select (arr!19582 a!3186) j!159)))))

(declare-fun b!723124 () Bool)

(declare-fun res!484728 () Bool)

(assert (=> b!723124 (=> (not res!484728) (not e!405174))))

(assert (=> b!723124 (= res!484728 (validKeyInArray!0 k0!2102))))

(declare-fun b!723125 () Bool)

(assert (=> b!723125 (= e!405176 e!405173)))

(declare-fun res!484730 () Bool)

(assert (=> b!723125 (=> (not res!484730) (not e!405173))))

(assert (=> b!723125 (= res!484730 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19582 a!3186) j!159) mask!3328) (select (arr!19582 a!3186) j!159) a!3186 mask!3328) lt!320563))))

(assert (=> b!723125 (= lt!320563 (Intermediate!7182 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723126 () Bool)

(declare-fun res!484739 () Bool)

(assert (=> b!723126 (=> (not res!484739) (not e!405176))))

(assert (=> b!723126 (= res!484739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64338 res!484729) b!723118))

(assert (= (and b!723118 res!484731) b!723123))

(assert (= (and b!723123 res!484732) b!723124))

(assert (= (and b!723124 res!484728) b!723115))

(assert (= (and b!723115 res!484736) b!723117))

(assert (= (and b!723117 res!484733) b!723126))

(assert (= (and b!723126 res!484739) b!723113))

(assert (= (and b!723113 res!484734) b!723121))

(assert (= (and b!723121 res!484737) b!723125))

(assert (= (and b!723125 res!484730) b!723116))

(assert (= (and b!723116 res!484735) b!723114))

(assert (= (and b!723114 c!79564) b!723120))

(assert (= (and b!723114 (not c!79564)) b!723119))

(assert (= (and b!723114 res!484727) b!723112))

(assert (= (and b!723112 res!484738) b!723122))

(declare-fun m!677575 () Bool)

(assert (=> b!723120 m!677575))

(assert (=> b!723120 m!677575))

(declare-fun m!677577 () Bool)

(assert (=> b!723120 m!677577))

(declare-fun m!677579 () Bool)

(assert (=> b!723117 m!677579))

(assert (=> b!723119 m!677575))

(assert (=> b!723119 m!677575))

(declare-fun m!677581 () Bool)

(assert (=> b!723119 m!677581))

(declare-fun m!677583 () Bool)

(assert (=> start!64338 m!677583))

(declare-fun m!677585 () Bool)

(assert (=> start!64338 m!677585))

(assert (=> b!723125 m!677575))

(assert (=> b!723125 m!677575))

(declare-fun m!677587 () Bool)

(assert (=> b!723125 m!677587))

(assert (=> b!723125 m!677587))

(assert (=> b!723125 m!677575))

(declare-fun m!677589 () Bool)

(assert (=> b!723125 m!677589))

(declare-fun m!677591 () Bool)

(assert (=> b!723112 m!677591))

(declare-fun m!677593 () Bool)

(assert (=> b!723112 m!677593))

(declare-fun m!677595 () Bool)

(assert (=> b!723112 m!677595))

(assert (=> b!723112 m!677591))

(declare-fun m!677597 () Bool)

(assert (=> b!723112 m!677597))

(declare-fun m!677599 () Bool)

(assert (=> b!723112 m!677599))

(declare-fun m!677601 () Bool)

(assert (=> b!723126 m!677601))

(assert (=> b!723123 m!677575))

(assert (=> b!723123 m!677575))

(declare-fun m!677603 () Bool)

(assert (=> b!723123 m!677603))

(declare-fun m!677605 () Bool)

(assert (=> b!723116 m!677605))

(declare-fun m!677607 () Bool)

(assert (=> b!723124 m!677607))

(declare-fun m!677609 () Bool)

(assert (=> b!723122 m!677609))

(declare-fun m!677611 () Bool)

(assert (=> b!723122 m!677611))

(declare-fun m!677613 () Bool)

(assert (=> b!723115 m!677613))

(declare-fun m!677615 () Bool)

(assert (=> b!723113 m!677615))

(check-sat (not b!723112) (not b!723119) (not b!723125) (not b!723117) (not b!723122) (not b!723123) (not start!64338) (not b!723126) (not b!723113) (not b!723115) (not b!723120) (not b!723124))
(check-sat)
