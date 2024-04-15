; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64310 () Bool)

(assert start!64310)

(declare-fun b!722689 () Bool)

(declare-fun e!404955 () Bool)

(declare-fun e!404954 () Bool)

(assert (=> b!722689 (= e!404955 e!404954)))

(declare-fun res!484478 () Bool)

(assert (=> b!722689 (=> (not res!484478) (not e!404954))))

(declare-datatypes ((SeekEntryResult!7174 0))(
  ( (MissingZero!7174 (index!31064 (_ BitVec 32))) (Found!7174 (index!31065 (_ BitVec 32))) (Intermediate!7174 (undefined!7986 Bool) (index!31066 (_ BitVec 32)) (x!62074 (_ BitVec 32))) (Undefined!7174) (MissingVacant!7174 (index!31067 (_ BitVec 32))) )
))
(declare-fun lt!320253 () SeekEntryResult!7174)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722689 (= res!484478 (or (= lt!320253 (MissingZero!7174 i!1173)) (= lt!320253 (MissingVacant!7174 i!1173))))))

(declare-datatypes ((array!40908 0))(
  ( (array!40909 (arr!19577 (Array (_ BitVec 32) (_ BitVec 64))) (size!19998 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40908)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40908 (_ BitVec 32)) SeekEntryResult!7174)

(assert (=> b!722689 (= lt!320253 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722690 () Bool)

(declare-fun res!484469 () Bool)

(assert (=> b!722690 (=> (not res!484469) (not e!404955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722690 (= res!484469 (validKeyInArray!0 k0!2102))))

(declare-fun e!404952 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!722691 () Bool)

(declare-fun lt!320254 () SeekEntryResult!7174)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40908 (_ BitVec 32)) SeekEntryResult!7174)

(assert (=> b!722691 (= e!404952 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19577 a!3186) j!159) a!3186 mask!3328) lt!320254))))

(declare-fun res!484475 () Bool)

(assert (=> start!64310 (=> (not res!484475) (not e!404955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64310 (= res!484475 (validMask!0 mask!3328))))

(assert (=> start!64310 e!404955))

(assert (=> start!64310 true))

(declare-fun array_inv!15460 (array!40908) Bool)

(assert (=> start!64310 (array_inv!15460 a!3186)))

(declare-fun b!722692 () Bool)

(declare-fun res!484477 () Bool)

(assert (=> b!722692 (=> (not res!484477) (not e!404955))))

(assert (=> b!722692 (= res!484477 (and (= (size!19998 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19998 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19998 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722693 () Bool)

(declare-fun res!484472 () Bool)

(assert (=> b!722693 (=> (not res!484472) (not e!404954))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722693 (= res!484472 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19998 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19998 a!3186))))))

(declare-fun b!722694 () Bool)

(declare-fun res!484474 () Bool)

(assert (=> b!722694 (=> (not res!484474) (not e!404955))))

(assert (=> b!722694 (= res!484474 (validKeyInArray!0 (select (arr!19577 a!3186) j!159)))))

(declare-fun b!722695 () Bool)

(declare-fun res!484471 () Bool)

(assert (=> b!722695 (=> (not res!484471) (not e!404954))))

(declare-datatypes ((List!13618 0))(
  ( (Nil!13615) (Cons!13614 (h!14668 (_ BitVec 64)) (t!19924 List!13618)) )
))
(declare-fun arrayNoDuplicates!0 (array!40908 (_ BitVec 32) List!13618) Bool)

(assert (=> b!722695 (= res!484471 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13615))))

(declare-fun b!722696 () Bool)

(declare-fun res!484470 () Bool)

(declare-fun e!404953 () Bool)

(assert (=> b!722696 (=> (not res!484470) (not e!404953))))

(assert (=> b!722696 (= res!484470 e!404952)))

(declare-fun c!79482 () Bool)

(assert (=> b!722696 (= c!79482 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722697 () Bool)

(declare-fun res!484476 () Bool)

(assert (=> b!722697 (=> (not res!484476) (not e!404955))))

(declare-fun arrayContainsKey!0 (array!40908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722697 (= res!484476 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722698 () Bool)

(declare-fun res!484473 () Bool)

(assert (=> b!722698 (=> (not res!484473) (not e!404953))))

(assert (=> b!722698 (= res!484473 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19577 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722699 () Bool)

(assert (=> b!722699 (= e!404954 e!404953)))

(declare-fun res!484468 () Bool)

(assert (=> b!722699 (=> (not res!484468) (not e!404953))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722699 (= res!484468 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19577 a!3186) j!159) mask!3328) (select (arr!19577 a!3186) j!159) a!3186 mask!3328) lt!320254))))

(assert (=> b!722699 (= lt!320254 (Intermediate!7174 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722700 () Bool)

(declare-fun res!484479 () Bool)

(assert (=> b!722700 (=> (not res!484479) (not e!404954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40908 (_ BitVec 32)) Bool)

(assert (=> b!722700 (= res!484479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722701 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40908 (_ BitVec 32)) SeekEntryResult!7174)

(assert (=> b!722701 (= e!404952 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19577 a!3186) j!159) a!3186 mask!3328) (Found!7174 j!159)))))

(declare-fun b!722702 () Bool)

(assert (=> b!722702 (= e!404953 false)))

(declare-fun lt!320255 () array!40908)

(declare-fun lt!320256 () (_ BitVec 64))

(declare-fun lt!320258 () SeekEntryResult!7174)

(assert (=> b!722702 (= lt!320258 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320256 lt!320255 mask!3328))))

(declare-fun lt!320257 () SeekEntryResult!7174)

(assert (=> b!722702 (= lt!320257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320256 mask!3328) lt!320256 lt!320255 mask!3328))))

(assert (=> b!722702 (= lt!320256 (select (store (arr!19577 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!722702 (= lt!320255 (array!40909 (store (arr!19577 a!3186) i!1173 k0!2102) (size!19998 a!3186)))))

(assert (= (and start!64310 res!484475) b!722692))

(assert (= (and b!722692 res!484477) b!722694))

(assert (= (and b!722694 res!484474) b!722690))

(assert (= (and b!722690 res!484469) b!722697))

(assert (= (and b!722697 res!484476) b!722689))

(assert (= (and b!722689 res!484478) b!722700))

(assert (= (and b!722700 res!484479) b!722695))

(assert (= (and b!722695 res!484471) b!722693))

(assert (= (and b!722693 res!484472) b!722699))

(assert (= (and b!722699 res!484468) b!722698))

(assert (= (and b!722698 res!484473) b!722696))

(assert (= (and b!722696 c!79482) b!722691))

(assert (= (and b!722696 (not c!79482)) b!722701))

(assert (= (and b!722696 res!484470) b!722702))

(declare-fun m!676661 () Bool)

(assert (=> b!722698 m!676661))

(declare-fun m!676663 () Bool)

(assert (=> b!722689 m!676663))

(declare-fun m!676665 () Bool)

(assert (=> b!722700 m!676665))

(declare-fun m!676667 () Bool)

(assert (=> b!722694 m!676667))

(assert (=> b!722694 m!676667))

(declare-fun m!676669 () Bool)

(assert (=> b!722694 m!676669))

(declare-fun m!676671 () Bool)

(assert (=> b!722702 m!676671))

(declare-fun m!676673 () Bool)

(assert (=> b!722702 m!676673))

(assert (=> b!722702 m!676671))

(declare-fun m!676675 () Bool)

(assert (=> b!722702 m!676675))

(declare-fun m!676677 () Bool)

(assert (=> b!722702 m!676677))

(declare-fun m!676679 () Bool)

(assert (=> b!722702 m!676679))

(declare-fun m!676681 () Bool)

(assert (=> b!722690 m!676681))

(declare-fun m!676683 () Bool)

(assert (=> b!722697 m!676683))

(assert (=> b!722701 m!676667))

(assert (=> b!722701 m!676667))

(declare-fun m!676685 () Bool)

(assert (=> b!722701 m!676685))

(assert (=> b!722699 m!676667))

(assert (=> b!722699 m!676667))

(declare-fun m!676687 () Bool)

(assert (=> b!722699 m!676687))

(assert (=> b!722699 m!676687))

(assert (=> b!722699 m!676667))

(declare-fun m!676689 () Bool)

(assert (=> b!722699 m!676689))

(assert (=> b!722691 m!676667))

(assert (=> b!722691 m!676667))

(declare-fun m!676691 () Bool)

(assert (=> b!722691 m!676691))

(declare-fun m!676693 () Bool)

(assert (=> start!64310 m!676693))

(declare-fun m!676695 () Bool)

(assert (=> start!64310 m!676695))

(declare-fun m!676697 () Bool)

(assert (=> b!722695 m!676697))

(check-sat (not b!722699) (not b!722702) (not b!722701) (not b!722694) (not start!64310) (not b!722691) (not b!722690) (not b!722697) (not b!722700) (not b!722689) (not b!722695))
(check-sat)
