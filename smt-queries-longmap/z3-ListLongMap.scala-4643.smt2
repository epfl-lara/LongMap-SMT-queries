; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64632 () Bool)

(assert start!64632)

(declare-fun res!488418 () Bool)

(declare-fun e!407457 () Bool)

(assert (=> start!64632 (=> (not res!488418) (not e!407457))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64632 (= res!488418 (validMask!0 mask!3328))))

(assert (=> start!64632 e!407457))

(assert (=> start!64632 true))

(declare-datatypes ((array!41081 0))(
  ( (array!41082 (arr!19660 (Array (_ BitVec 32) (_ BitVec 64))) (size!20081 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41081)

(declare-fun array_inv!15456 (array!41081) Bool)

(assert (=> start!64632 (array_inv!15456 a!3186)))

(declare-fun b!727822 () Bool)

(declare-fun res!488411 () Bool)

(declare-fun e!407458 () Bool)

(assert (=> b!727822 (=> (not res!488411) (not e!407458))))

(declare-fun e!407456 () Bool)

(assert (=> b!727822 (= res!488411 e!407456)))

(declare-fun c!80083 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!727822 (= c!80083 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!727823 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7260 0))(
  ( (MissingZero!7260 (index!31408 (_ BitVec 32))) (Found!7260 (index!31409 (_ BitVec 32))) (Intermediate!7260 (undefined!8072 Bool) (index!31410 (_ BitVec 32)) (x!62402 (_ BitVec 32))) (Undefined!7260) (MissingVacant!7260 (index!31411 (_ BitVec 32))) )
))
(declare-fun lt!322360 () SeekEntryResult!7260)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41081 (_ BitVec 32)) SeekEntryResult!7260)

(assert (=> b!727823 (= e!407456 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19660 a!3186) j!159) a!3186 mask!3328) lt!322360))))

(declare-fun b!727824 () Bool)

(declare-fun res!488414 () Bool)

(assert (=> b!727824 (=> (not res!488414) (not e!407457))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!727824 (= res!488414 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!727825 () Bool)

(declare-fun e!407454 () Bool)

(assert (=> b!727825 (= e!407457 e!407454)))

(declare-fun res!488413 () Bool)

(assert (=> b!727825 (=> (not res!488413) (not e!407454))))

(declare-fun lt!322353 () SeekEntryResult!7260)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!727825 (= res!488413 (or (= lt!322353 (MissingZero!7260 i!1173)) (= lt!322353 (MissingVacant!7260 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41081 (_ BitVec 32)) SeekEntryResult!7260)

(assert (=> b!727825 (= lt!322353 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!727826 () Bool)

(declare-fun res!488405 () Bool)

(assert (=> b!727826 (=> (not res!488405) (not e!407458))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!727826 (= res!488405 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19660 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727827 () Bool)

(declare-fun e!407461 () Bool)

(declare-fun e!407462 () Bool)

(assert (=> b!727827 (= e!407461 (not e!407462))))

(declare-fun res!488412 () Bool)

(assert (=> b!727827 (=> res!488412 e!407462)))

(declare-fun lt!322358 () SeekEntryResult!7260)

(get-info :version)

(assert (=> b!727827 (= res!488412 (or (not ((_ is Intermediate!7260) lt!322358)) (bvsge x!1131 (x!62402 lt!322358))))))

(declare-fun e!407455 () Bool)

(assert (=> b!727827 e!407455))

(declare-fun res!488415 () Bool)

(assert (=> b!727827 (=> (not res!488415) (not e!407455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41081 (_ BitVec 32)) Bool)

(assert (=> b!727827 (= res!488415 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24838 0))(
  ( (Unit!24839) )
))
(declare-fun lt!322354 () Unit!24838)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41081 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24838)

(assert (=> b!727827 (= lt!322354 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!727828 () Bool)

(declare-fun res!488417 () Bool)

(assert (=> b!727828 (=> (not res!488417) (not e!407457))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!727828 (= res!488417 (validKeyInArray!0 (select (arr!19660 a!3186) j!159)))))

(declare-fun b!727829 () Bool)

(declare-fun res!488416 () Bool)

(assert (=> b!727829 (=> (not res!488416) (not e!407457))))

(assert (=> b!727829 (= res!488416 (and (= (size!20081 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20081 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20081 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!727830 () Bool)

(assert (=> b!727830 (= e!407454 e!407458)))

(declare-fun res!488410 () Bool)

(assert (=> b!727830 (=> (not res!488410) (not e!407458))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727830 (= res!488410 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19660 a!3186) j!159) mask!3328) (select (arr!19660 a!3186) j!159) a!3186 mask!3328) lt!322360))))

(assert (=> b!727830 (= lt!322360 (Intermediate!7260 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!727831 () Bool)

(declare-fun res!488419 () Bool)

(assert (=> b!727831 (=> (not res!488419) (not e!407454))))

(assert (=> b!727831 (= res!488419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!727832 () Bool)

(declare-fun e!407460 () Bool)

(assert (=> b!727832 (= e!407455 e!407460)))

(declare-fun res!488406 () Bool)

(assert (=> b!727832 (=> (not res!488406) (not e!407460))))

(declare-fun lt!322355 () SeekEntryResult!7260)

(assert (=> b!727832 (= res!488406 (= (seekEntryOrOpen!0 (select (arr!19660 a!3186) j!159) a!3186 mask!3328) lt!322355))))

(assert (=> b!727832 (= lt!322355 (Found!7260 j!159))))

(declare-fun b!727833 () Bool)

(assert (=> b!727833 (= e!407458 e!407461)))

(declare-fun res!488420 () Bool)

(assert (=> b!727833 (=> (not res!488420) (not e!407461))))

(declare-fun lt!322361 () SeekEntryResult!7260)

(assert (=> b!727833 (= res!488420 (= lt!322361 lt!322358))))

(declare-fun lt!322356 () (_ BitVec 64))

(declare-fun lt!322359 () array!41081)

(assert (=> b!727833 (= lt!322358 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322356 lt!322359 mask!3328))))

(assert (=> b!727833 (= lt!322361 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322356 mask!3328) lt!322356 lt!322359 mask!3328))))

(assert (=> b!727833 (= lt!322356 (select (store (arr!19660 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!727833 (= lt!322359 (array!41082 (store (arr!19660 a!3186) i!1173 k0!2102) (size!20081 a!3186)))))

(declare-fun b!727834 () Bool)

(declare-fun lt!322357 () (_ BitVec 32))

(assert (=> b!727834 (= e!407462 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!322357 #b00000000000000000000000000000000) (bvsge lt!322357 (bvadd #b00000000000000000000000000000001 mask!3328)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727834 (= lt!322357 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!727835 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41081 (_ BitVec 32)) SeekEntryResult!7260)

(assert (=> b!727835 (= e!407456 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19660 a!3186) j!159) a!3186 mask!3328) (Found!7260 j!159)))))

(declare-fun b!727836 () Bool)

(declare-fun res!488408 () Bool)

(assert (=> b!727836 (=> (not res!488408) (not e!407457))))

(assert (=> b!727836 (= res!488408 (validKeyInArray!0 k0!2102))))

(declare-fun b!727837 () Bool)

(declare-fun res!488409 () Bool)

(assert (=> b!727837 (=> (not res!488409) (not e!407454))))

(declare-datatypes ((List!13662 0))(
  ( (Nil!13659) (Cons!13658 (h!14718 (_ BitVec 64)) (t!19977 List!13662)) )
))
(declare-fun arrayNoDuplicates!0 (array!41081 (_ BitVec 32) List!13662) Bool)

(assert (=> b!727837 (= res!488409 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13659))))

(declare-fun b!727838 () Bool)

(declare-fun res!488407 () Bool)

(assert (=> b!727838 (=> (not res!488407) (not e!407454))))

(assert (=> b!727838 (= res!488407 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20081 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20081 a!3186))))))

(declare-fun b!727839 () Bool)

(assert (=> b!727839 (= e!407460 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19660 a!3186) j!159) a!3186 mask!3328) lt!322355))))

(assert (= (and start!64632 res!488418) b!727829))

(assert (= (and b!727829 res!488416) b!727828))

(assert (= (and b!727828 res!488417) b!727836))

(assert (= (and b!727836 res!488408) b!727824))

(assert (= (and b!727824 res!488414) b!727825))

(assert (= (and b!727825 res!488413) b!727831))

(assert (= (and b!727831 res!488419) b!727837))

(assert (= (and b!727837 res!488409) b!727838))

(assert (= (and b!727838 res!488407) b!727830))

(assert (= (and b!727830 res!488410) b!727826))

(assert (= (and b!727826 res!488405) b!727822))

(assert (= (and b!727822 c!80083) b!727823))

(assert (= (and b!727822 (not c!80083)) b!727835))

(assert (= (and b!727822 res!488411) b!727833))

(assert (= (and b!727833 res!488420) b!727827))

(assert (= (and b!727827 res!488415) b!727832))

(assert (= (and b!727832 res!488406) b!727839))

(assert (= (and b!727827 (not res!488412)) b!727834))

(declare-fun m!681643 () Bool)

(assert (=> b!727835 m!681643))

(assert (=> b!727835 m!681643))

(declare-fun m!681645 () Bool)

(assert (=> b!727835 m!681645))

(declare-fun m!681647 () Bool)

(assert (=> b!727827 m!681647))

(declare-fun m!681649 () Bool)

(assert (=> b!727827 m!681649))

(declare-fun m!681651 () Bool)

(assert (=> b!727834 m!681651))

(assert (=> b!727828 m!681643))

(assert (=> b!727828 m!681643))

(declare-fun m!681653 () Bool)

(assert (=> b!727828 m!681653))

(assert (=> b!727832 m!681643))

(assert (=> b!727832 m!681643))

(declare-fun m!681655 () Bool)

(assert (=> b!727832 m!681655))

(declare-fun m!681657 () Bool)

(assert (=> b!727824 m!681657))

(declare-fun m!681659 () Bool)

(assert (=> start!64632 m!681659))

(declare-fun m!681661 () Bool)

(assert (=> start!64632 m!681661))

(assert (=> b!727823 m!681643))

(assert (=> b!727823 m!681643))

(declare-fun m!681663 () Bool)

(assert (=> b!727823 m!681663))

(assert (=> b!727839 m!681643))

(assert (=> b!727839 m!681643))

(declare-fun m!681665 () Bool)

(assert (=> b!727839 m!681665))

(declare-fun m!681667 () Bool)

(assert (=> b!727836 m!681667))

(declare-fun m!681669 () Bool)

(assert (=> b!727826 m!681669))

(declare-fun m!681671 () Bool)

(assert (=> b!727833 m!681671))

(declare-fun m!681673 () Bool)

(assert (=> b!727833 m!681673))

(declare-fun m!681675 () Bool)

(assert (=> b!727833 m!681675))

(assert (=> b!727833 m!681671))

(declare-fun m!681677 () Bool)

(assert (=> b!727833 m!681677))

(declare-fun m!681679 () Bool)

(assert (=> b!727833 m!681679))

(assert (=> b!727830 m!681643))

(assert (=> b!727830 m!681643))

(declare-fun m!681681 () Bool)

(assert (=> b!727830 m!681681))

(assert (=> b!727830 m!681681))

(assert (=> b!727830 m!681643))

(declare-fun m!681683 () Bool)

(assert (=> b!727830 m!681683))

(declare-fun m!681685 () Bool)

(assert (=> b!727837 m!681685))

(declare-fun m!681687 () Bool)

(assert (=> b!727825 m!681687))

(declare-fun m!681689 () Bool)

(assert (=> b!727831 m!681689))

(check-sat (not b!727834) (not b!727824) (not b!727825) (not b!727837) (not b!727831) (not b!727833) (not b!727828) (not b!727830) (not b!727835) (not b!727832) (not start!64632) (not b!727827) (not b!727823) (not b!727839) (not b!727836))
(check-sat)
