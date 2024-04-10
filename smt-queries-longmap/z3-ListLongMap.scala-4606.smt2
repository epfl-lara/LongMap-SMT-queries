; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64272 () Bool)

(assert start!64272)

(declare-fun b!721734 () Bool)

(declare-fun e!404674 () Bool)

(assert (=> b!721734 (= e!404674 false)))

(declare-fun lt!320147 () Bool)

(declare-fun e!404673 () Bool)

(assert (=> b!721734 (= lt!320147 e!404673)))

(declare-fun c!79465 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721734 (= c!79465 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721735 () Bool)

(declare-fun res!483549 () Bool)

(declare-fun e!404672 () Bool)

(assert (=> b!721735 (=> (not res!483549) (not e!404672))))

(declare-datatypes ((array!40853 0))(
  ( (array!40854 (arr!19549 (Array (_ BitVec 32) (_ BitVec 64))) (size!19970 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40853)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721735 (= res!483549 (validKeyInArray!0 (select (arr!19549 a!3186) j!159)))))

(declare-fun b!721736 () Bool)

(declare-fun res!483557 () Bool)

(declare-fun e!404675 () Bool)

(assert (=> b!721736 (=> (not res!483557) (not e!404675))))

(declare-datatypes ((List!13551 0))(
  ( (Nil!13548) (Cons!13547 (h!14601 (_ BitVec 64)) (t!19866 List!13551)) )
))
(declare-fun arrayNoDuplicates!0 (array!40853 (_ BitVec 32) List!13551) Bool)

(assert (=> b!721736 (= res!483557 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13548))))

(declare-datatypes ((SeekEntryResult!7149 0))(
  ( (MissingZero!7149 (index!30964 (_ BitVec 32))) (Found!7149 (index!30965 (_ BitVec 32))) (Intermediate!7149 (undefined!7961 Bool) (index!30966 (_ BitVec 32)) (x!61974 (_ BitVec 32))) (Undefined!7149) (MissingVacant!7149 (index!30967 (_ BitVec 32))) )
))
(declare-fun lt!320145 () SeekEntryResult!7149)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!721737 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40853 (_ BitVec 32)) SeekEntryResult!7149)

(assert (=> b!721737 (= e!404673 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19549 a!3186) j!159) a!3186 mask!3328) lt!320145)))))

(declare-fun b!721738 () Bool)

(declare-fun res!483554 () Bool)

(assert (=> b!721738 (=> (not res!483554) (not e!404672))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721738 (= res!483554 (and (= (size!19970 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19970 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19970 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721739 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40853 (_ BitVec 32)) SeekEntryResult!7149)

(assert (=> b!721739 (= e!404673 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19549 a!3186) j!159) a!3186 mask!3328) (Found!7149 j!159))))))

(declare-fun b!721740 () Bool)

(declare-fun res!483552 () Bool)

(assert (=> b!721740 (=> (not res!483552) (not e!404675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40853 (_ BitVec 32)) Bool)

(assert (=> b!721740 (= res!483552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721741 () Bool)

(declare-fun res!483556 () Bool)

(assert (=> b!721741 (=> (not res!483556) (not e!404675))))

(assert (=> b!721741 (= res!483556 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19970 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19970 a!3186))))))

(declare-fun res!483555 () Bool)

(assert (=> start!64272 (=> (not res!483555) (not e!404672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64272 (= res!483555 (validMask!0 mask!3328))))

(assert (=> start!64272 e!404672))

(assert (=> start!64272 true))

(declare-fun array_inv!15345 (array!40853) Bool)

(assert (=> start!64272 (array_inv!15345 a!3186)))

(declare-fun b!721742 () Bool)

(declare-fun res!483547 () Bool)

(assert (=> b!721742 (=> (not res!483547) (not e!404672))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721742 (= res!483547 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721743 () Bool)

(declare-fun res!483548 () Bool)

(assert (=> b!721743 (=> (not res!483548) (not e!404674))))

(assert (=> b!721743 (= res!483548 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19549 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721744 () Bool)

(declare-fun res!483551 () Bool)

(assert (=> b!721744 (=> (not res!483551) (not e!404672))))

(assert (=> b!721744 (= res!483551 (validKeyInArray!0 k0!2102))))

(declare-fun b!721745 () Bool)

(assert (=> b!721745 (= e!404675 e!404674)))

(declare-fun res!483550 () Bool)

(assert (=> b!721745 (=> (not res!483550) (not e!404674))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721745 (= res!483550 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19549 a!3186) j!159) mask!3328) (select (arr!19549 a!3186) j!159) a!3186 mask!3328) lt!320145))))

(assert (=> b!721745 (= lt!320145 (Intermediate!7149 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721746 () Bool)

(assert (=> b!721746 (= e!404672 e!404675)))

(declare-fun res!483553 () Bool)

(assert (=> b!721746 (=> (not res!483553) (not e!404675))))

(declare-fun lt!320146 () SeekEntryResult!7149)

(assert (=> b!721746 (= res!483553 (or (= lt!320146 (MissingZero!7149 i!1173)) (= lt!320146 (MissingVacant!7149 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40853 (_ BitVec 32)) SeekEntryResult!7149)

(assert (=> b!721746 (= lt!320146 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64272 res!483555) b!721738))

(assert (= (and b!721738 res!483554) b!721735))

(assert (= (and b!721735 res!483549) b!721744))

(assert (= (and b!721744 res!483551) b!721742))

(assert (= (and b!721742 res!483547) b!721746))

(assert (= (and b!721746 res!483553) b!721740))

(assert (= (and b!721740 res!483552) b!721736))

(assert (= (and b!721736 res!483557) b!721741))

(assert (= (and b!721741 res!483556) b!721745))

(assert (= (and b!721745 res!483550) b!721743))

(assert (= (and b!721743 res!483548) b!721734))

(assert (= (and b!721734 c!79465) b!721737))

(assert (= (and b!721734 (not c!79465)) b!721739))

(declare-fun m!676469 () Bool)

(assert (=> b!721743 m!676469))

(declare-fun m!676471 () Bool)

(assert (=> b!721746 m!676471))

(declare-fun m!676473 () Bool)

(assert (=> b!721742 m!676473))

(declare-fun m!676475 () Bool)

(assert (=> b!721736 m!676475))

(declare-fun m!676477 () Bool)

(assert (=> b!721737 m!676477))

(assert (=> b!721737 m!676477))

(declare-fun m!676479 () Bool)

(assert (=> b!721737 m!676479))

(declare-fun m!676481 () Bool)

(assert (=> b!721740 m!676481))

(declare-fun m!676483 () Bool)

(assert (=> start!64272 m!676483))

(declare-fun m!676485 () Bool)

(assert (=> start!64272 m!676485))

(assert (=> b!721735 m!676477))

(assert (=> b!721735 m!676477))

(declare-fun m!676487 () Bool)

(assert (=> b!721735 m!676487))

(declare-fun m!676489 () Bool)

(assert (=> b!721744 m!676489))

(assert (=> b!721745 m!676477))

(assert (=> b!721745 m!676477))

(declare-fun m!676491 () Bool)

(assert (=> b!721745 m!676491))

(assert (=> b!721745 m!676491))

(assert (=> b!721745 m!676477))

(declare-fun m!676493 () Bool)

(assert (=> b!721745 m!676493))

(assert (=> b!721739 m!676477))

(assert (=> b!721739 m!676477))

(declare-fun m!676495 () Bool)

(assert (=> b!721739 m!676495))

(check-sat (not b!721740) (not b!721745) (not start!64272) (not b!721737) (not b!721739) (not b!721744) (not b!721746) (not b!721736) (not b!721742) (not b!721735))
(check-sat)
