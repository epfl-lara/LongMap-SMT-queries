; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64082 () Bool)

(assert start!64082)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40794 0))(
  ( (array!40795 (arr!19523 (Array (_ BitVec 32) (_ BitVec 64))) (size!19944 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40794)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!719800 () Bool)

(declare-fun e!403744 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7120 0))(
  ( (MissingZero!7120 (index!30848 (_ BitVec 32))) (Found!7120 (index!30849 (_ BitVec 32))) (Intermediate!7120 (undefined!7932 Bool) (index!30850 (_ BitVec 32)) (x!61858 (_ BitVec 32))) (Undefined!7120) (MissingVacant!7120 (index!30851 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40794 (_ BitVec 32)) SeekEntryResult!7120)

(assert (=> b!719800 (= e!403744 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19523 a!3186) j!159) a!3186 mask!3328) (Found!7120 j!159)))))

(declare-fun b!719801 () Bool)

(declare-fun res!482335 () Bool)

(declare-fun e!403745 () Bool)

(assert (=> b!719801 (=> (not res!482335) (not e!403745))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719801 (= res!482335 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19523 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!719802 () Bool)

(assert (=> b!719802 (= e!403745 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!719803 () Bool)

(declare-fun res!482338 () Bool)

(declare-fun e!403743 () Bool)

(assert (=> b!719803 (=> (not res!482338) (not e!403743))))

(assert (=> b!719803 (= res!482338 (and (= (size!19944 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19944 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19944 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719804 () Bool)

(declare-fun res!482331 () Bool)

(declare-fun e!403747 () Bool)

(assert (=> b!719804 (=> (not res!482331) (not e!403747))))

(declare-datatypes ((List!13564 0))(
  ( (Nil!13561) (Cons!13560 (h!14608 (_ BitVec 64)) (t!19870 List!13564)) )
))
(declare-fun arrayNoDuplicates!0 (array!40794 (_ BitVec 32) List!13564) Bool)

(assert (=> b!719804 (= res!482331 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13561))))

(declare-fun b!719805 () Bool)

(declare-fun res!482336 () Bool)

(assert (=> b!719805 (=> (not res!482336) (not e!403745))))

(assert (=> b!719805 (= res!482336 e!403744)))

(declare-fun c!79104 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719805 (= c!79104 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!719807 () Bool)

(assert (=> b!719807 (= e!403743 e!403747)))

(declare-fun res!482334 () Bool)

(assert (=> b!719807 (=> (not res!482334) (not e!403747))))

(declare-fun lt!319462 () SeekEntryResult!7120)

(assert (=> b!719807 (= res!482334 (or (= lt!319462 (MissingZero!7120 i!1173)) (= lt!319462 (MissingVacant!7120 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40794 (_ BitVec 32)) SeekEntryResult!7120)

(assert (=> b!719807 (= lt!319462 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719808 () Bool)

(declare-fun res!482332 () Bool)

(assert (=> b!719808 (=> (not res!482332) (not e!403743))))

(declare-fun arrayContainsKey!0 (array!40794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719808 (= res!482332 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719809 () Bool)

(declare-fun res!482333 () Bool)

(assert (=> b!719809 (=> (not res!482333) (not e!403747))))

(assert (=> b!719809 (= res!482333 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19944 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19944 a!3186))))))

(declare-fun b!719810 () Bool)

(declare-fun res!482337 () Bool)

(assert (=> b!719810 (=> (not res!482337) (not e!403747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40794 (_ BitVec 32)) Bool)

(assert (=> b!719810 (= res!482337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719811 () Bool)

(assert (=> b!719811 (= e!403747 e!403745)))

(declare-fun res!482330 () Bool)

(assert (=> b!719811 (=> (not res!482330) (not e!403745))))

(declare-fun lt!319463 () SeekEntryResult!7120)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40794 (_ BitVec 32)) SeekEntryResult!7120)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719811 (= res!482330 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19523 a!3186) j!159) mask!3328) (select (arr!19523 a!3186) j!159) a!3186 mask!3328) lt!319463))))

(assert (=> b!719811 (= lt!319463 (Intermediate!7120 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!482329 () Bool)

(assert (=> start!64082 (=> (not res!482329) (not e!403743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64082 (= res!482329 (validMask!0 mask!3328))))

(assert (=> start!64082 e!403743))

(assert (=> start!64082 true))

(declare-fun array_inv!15406 (array!40794) Bool)

(assert (=> start!64082 (array_inv!15406 a!3186)))

(declare-fun b!719806 () Bool)

(assert (=> b!719806 (= e!403744 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19523 a!3186) j!159) a!3186 mask!3328) lt!319463))))

(declare-fun b!719812 () Bool)

(declare-fun res!482339 () Bool)

(assert (=> b!719812 (=> (not res!482339) (not e!403743))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719812 (= res!482339 (validKeyInArray!0 k0!2102))))

(declare-fun b!719813 () Bool)

(declare-fun res!482340 () Bool)

(assert (=> b!719813 (=> (not res!482340) (not e!403743))))

(assert (=> b!719813 (= res!482340 (validKeyInArray!0 (select (arr!19523 a!3186) j!159)))))

(assert (= (and start!64082 res!482329) b!719803))

(assert (= (and b!719803 res!482338) b!719813))

(assert (= (and b!719813 res!482340) b!719812))

(assert (= (and b!719812 res!482339) b!719808))

(assert (= (and b!719808 res!482332) b!719807))

(assert (= (and b!719807 res!482334) b!719810))

(assert (= (and b!719810 res!482337) b!719804))

(assert (= (and b!719804 res!482331) b!719809))

(assert (= (and b!719809 res!482333) b!719811))

(assert (= (and b!719811 res!482330) b!719801))

(assert (= (and b!719801 res!482335) b!719805))

(assert (= (and b!719805 c!79104) b!719806))

(assert (= (and b!719805 (not c!79104)) b!719800))

(assert (= (and b!719805 res!482336) b!719802))

(declare-fun m!674573 () Bool)

(assert (=> b!719812 m!674573))

(declare-fun m!674575 () Bool)

(assert (=> b!719806 m!674575))

(assert (=> b!719806 m!674575))

(declare-fun m!674577 () Bool)

(assert (=> b!719806 m!674577))

(assert (=> b!719813 m!674575))

(assert (=> b!719813 m!674575))

(declare-fun m!674579 () Bool)

(assert (=> b!719813 m!674579))

(declare-fun m!674581 () Bool)

(assert (=> b!719810 m!674581))

(declare-fun m!674583 () Bool)

(assert (=> b!719807 m!674583))

(assert (=> b!719800 m!674575))

(assert (=> b!719800 m!674575))

(declare-fun m!674585 () Bool)

(assert (=> b!719800 m!674585))

(declare-fun m!674587 () Bool)

(assert (=> b!719808 m!674587))

(declare-fun m!674589 () Bool)

(assert (=> b!719804 m!674589))

(assert (=> b!719811 m!674575))

(assert (=> b!719811 m!674575))

(declare-fun m!674591 () Bool)

(assert (=> b!719811 m!674591))

(assert (=> b!719811 m!674591))

(assert (=> b!719811 m!674575))

(declare-fun m!674593 () Bool)

(assert (=> b!719811 m!674593))

(declare-fun m!674595 () Bool)

(assert (=> start!64082 m!674595))

(declare-fun m!674597 () Bool)

(assert (=> start!64082 m!674597))

(declare-fun m!674599 () Bool)

(assert (=> b!719801 m!674599))

(check-sat (not b!719808) (not b!719813) (not start!64082) (not b!719800) (not b!719807) (not b!719811) (not b!719806) (not b!719810) (not b!719804) (not b!719812))
(check-sat)
