; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64262 () Bool)

(assert start!64262)

(declare-fun b!721688 () Bool)

(declare-fun e!404592 () Bool)

(assert (=> b!721688 (= e!404592 false)))

(declare-fun lt!319942 () Bool)

(declare-fun e!404595 () Bool)

(assert (=> b!721688 (= lt!319942 e!404595)))

(declare-fun c!79410 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721688 (= c!79410 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721689 () Bool)

(declare-fun res!483611 () Bool)

(declare-fun e!404593 () Bool)

(assert (=> b!721689 (=> (not res!483611) (not e!404593))))

(declare-datatypes ((array!40860 0))(
  ( (array!40861 (arr!19553 (Array (_ BitVec 32) (_ BitVec 64))) (size!19974 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40860)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!721689 (= res!483611 (and (= (size!19974 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19974 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19974 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721690 () Bool)

(declare-fun res!483619 () Bool)

(assert (=> b!721690 (=> (not res!483619) (not e!404593))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721690 (= res!483619 (validKeyInArray!0 k0!2102))))

(declare-datatypes ((SeekEntryResult!7150 0))(
  ( (MissingZero!7150 (index!30968 (_ BitVec 32))) (Found!7150 (index!30969 (_ BitVec 32))) (Intermediate!7150 (undefined!7962 Bool) (index!30970 (_ BitVec 32)) (x!61986 (_ BitVec 32))) (Undefined!7150) (MissingVacant!7150 (index!30971 (_ BitVec 32))) )
))
(declare-fun lt!319941 () SeekEntryResult!7150)

(declare-fun b!721691 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40860 (_ BitVec 32)) SeekEntryResult!7150)

(assert (=> b!721691 (= e!404595 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19553 a!3186) j!159) a!3186 mask!3328) lt!319941)))))

(declare-fun b!721692 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40860 (_ BitVec 32)) SeekEntryResult!7150)

(assert (=> b!721692 (= e!404595 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19553 a!3186) j!159) a!3186 mask!3328) (Found!7150 j!159))))))

(declare-fun b!721693 () Bool)

(declare-fun res!483615 () Bool)

(assert (=> b!721693 (=> (not res!483615) (not e!404593))))

(declare-fun arrayContainsKey!0 (array!40860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721693 (= res!483615 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721694 () Bool)

(declare-fun res!483613 () Bool)

(assert (=> b!721694 (=> (not res!483613) (not e!404593))))

(assert (=> b!721694 (= res!483613 (validKeyInArray!0 (select (arr!19553 a!3186) j!159)))))

(declare-fun res!483618 () Bool)

(assert (=> start!64262 (=> (not res!483618) (not e!404593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64262 (= res!483618 (validMask!0 mask!3328))))

(assert (=> start!64262 e!404593))

(assert (=> start!64262 true))

(declare-fun array_inv!15436 (array!40860) Bool)

(assert (=> start!64262 (array_inv!15436 a!3186)))

(declare-fun b!721695 () Bool)

(declare-fun e!404594 () Bool)

(assert (=> b!721695 (= e!404594 e!404592)))

(declare-fun res!483616 () Bool)

(assert (=> b!721695 (=> (not res!483616) (not e!404592))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721695 (= res!483616 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19553 a!3186) j!159) mask!3328) (select (arr!19553 a!3186) j!159) a!3186 mask!3328) lt!319941))))

(assert (=> b!721695 (= lt!319941 (Intermediate!7150 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721696 () Bool)

(declare-fun res!483614 () Bool)

(assert (=> b!721696 (=> (not res!483614) (not e!404594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40860 (_ BitVec 32)) Bool)

(assert (=> b!721696 (= res!483614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721697 () Bool)

(declare-fun res!483620 () Bool)

(assert (=> b!721697 (=> (not res!483620) (not e!404592))))

(assert (=> b!721697 (= res!483620 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19553 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721698 () Bool)

(declare-fun res!483621 () Bool)

(assert (=> b!721698 (=> (not res!483621) (not e!404594))))

(assert (=> b!721698 (= res!483621 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19974 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19974 a!3186))))))

(declare-fun b!721699 () Bool)

(assert (=> b!721699 (= e!404593 e!404594)))

(declare-fun res!483612 () Bool)

(assert (=> b!721699 (=> (not res!483612) (not e!404594))))

(declare-fun lt!319943 () SeekEntryResult!7150)

(assert (=> b!721699 (= res!483612 (or (= lt!319943 (MissingZero!7150 i!1173)) (= lt!319943 (MissingVacant!7150 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40860 (_ BitVec 32)) SeekEntryResult!7150)

(assert (=> b!721699 (= lt!319943 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!721700 () Bool)

(declare-fun res!483617 () Bool)

(assert (=> b!721700 (=> (not res!483617) (not e!404594))))

(declare-datatypes ((List!13594 0))(
  ( (Nil!13591) (Cons!13590 (h!14644 (_ BitVec 64)) (t!19900 List!13594)) )
))
(declare-fun arrayNoDuplicates!0 (array!40860 (_ BitVec 32) List!13594) Bool)

(assert (=> b!721700 (= res!483617 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13591))))

(assert (= (and start!64262 res!483618) b!721689))

(assert (= (and b!721689 res!483611) b!721694))

(assert (= (and b!721694 res!483613) b!721690))

(assert (= (and b!721690 res!483619) b!721693))

(assert (= (and b!721693 res!483615) b!721699))

(assert (= (and b!721699 res!483612) b!721696))

(assert (= (and b!721696 res!483614) b!721700))

(assert (= (and b!721700 res!483617) b!721698))

(assert (= (and b!721698 res!483621) b!721695))

(assert (= (and b!721695 res!483616) b!721697))

(assert (= (and b!721697 res!483620) b!721688))

(assert (= (and b!721688 c!79410) b!721691))

(assert (= (and b!721688 (not c!79410)) b!721692))

(declare-fun m!675851 () Bool)

(assert (=> b!721696 m!675851))

(declare-fun m!675853 () Bool)

(assert (=> b!721693 m!675853))

(declare-fun m!675855 () Bool)

(assert (=> b!721695 m!675855))

(assert (=> b!721695 m!675855))

(declare-fun m!675857 () Bool)

(assert (=> b!721695 m!675857))

(assert (=> b!721695 m!675857))

(assert (=> b!721695 m!675855))

(declare-fun m!675859 () Bool)

(assert (=> b!721695 m!675859))

(declare-fun m!675861 () Bool)

(assert (=> b!721690 m!675861))

(declare-fun m!675863 () Bool)

(assert (=> b!721697 m!675863))

(declare-fun m!675865 () Bool)

(assert (=> b!721699 m!675865))

(assert (=> b!721692 m!675855))

(assert (=> b!721692 m!675855))

(declare-fun m!675867 () Bool)

(assert (=> b!721692 m!675867))

(declare-fun m!675869 () Bool)

(assert (=> start!64262 m!675869))

(declare-fun m!675871 () Bool)

(assert (=> start!64262 m!675871))

(assert (=> b!721691 m!675855))

(assert (=> b!721691 m!675855))

(declare-fun m!675873 () Bool)

(assert (=> b!721691 m!675873))

(assert (=> b!721694 m!675855))

(assert (=> b!721694 m!675855))

(declare-fun m!675875 () Bool)

(assert (=> b!721694 m!675875))

(declare-fun m!675877 () Bool)

(assert (=> b!721700 m!675877))

(check-sat (not b!721696) (not b!721692) (not b!721690) (not b!721694) (not b!721695) (not b!721693) (not b!721699) (not start!64262) (not b!721700) (not b!721691))
(check-sat)
