; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66780 () Bool)

(assert start!66780)

(declare-fun b!769796 () Bool)

(declare-fun e!428631 () Bool)

(declare-fun e!428637 () Bool)

(assert (=> b!769796 (= e!428631 (not e!428637))))

(declare-fun res!520650 () Bool)

(assert (=> b!769796 (=> res!520650 e!428637)))

(declare-datatypes ((SeekEntryResult!7871 0))(
  ( (MissingZero!7871 (index!33852 (_ BitVec 32))) (Found!7871 (index!33853 (_ BitVec 32))) (Intermediate!7871 (undefined!8683 Bool) (index!33854 (_ BitVec 32)) (x!64786 (_ BitVec 32))) (Undefined!7871) (MissingVacant!7871 (index!33855 (_ BitVec 32))) )
))
(declare-fun lt!342545 () SeekEntryResult!7871)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!769796 (= res!520650 (or (not (is-Intermediate!7871 lt!342545)) (bvsge x!1131 (x!64786 lt!342545))))))

(declare-fun e!428635 () Bool)

(assert (=> b!769796 e!428635))

(declare-fun res!520642 () Bool)

(assert (=> b!769796 (=> (not res!520642) (not e!428635))))

(declare-datatypes ((array!42342 0))(
  ( (array!42343 (arr!20271 (Array (_ BitVec 32) (_ BitVec 64))) (size!20692 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42342)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42342 (_ BitVec 32)) Bool)

(assert (=> b!769796 (= res!520642 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26498 0))(
  ( (Unit!26499) )
))
(declare-fun lt!342551 () Unit!26498)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42342 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26498)

(assert (=> b!769796 (= lt!342551 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769797 () Bool)

(declare-fun res!520645 () Bool)

(declare-fun e!428639 () Bool)

(assert (=> b!769797 (=> (not res!520645) (not e!428639))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769797 (= res!520645 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20271 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769798 () Bool)

(declare-fun res!520649 () Bool)

(declare-fun e!428634 () Bool)

(assert (=> b!769798 (=> (not res!520649) (not e!428634))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769798 (= res!520649 (validKeyInArray!0 (select (arr!20271 a!3186) j!159)))))

(declare-fun b!769799 () Bool)

(declare-fun res!520644 () Bool)

(assert (=> b!769799 (=> (not res!520644) (not e!428634))))

(assert (=> b!769799 (= res!520644 (and (= (size!20692 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20692 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20692 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769800 () Bool)

(declare-fun e!428632 () Bool)

(assert (=> b!769800 (= e!428635 e!428632)))

(declare-fun res!520648 () Bool)

(assert (=> b!769800 (=> (not res!520648) (not e!428632))))

(declare-fun lt!342549 () SeekEntryResult!7871)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42342 (_ BitVec 32)) SeekEntryResult!7871)

(assert (=> b!769800 (= res!520648 (= (seekEntryOrOpen!0 (select (arr!20271 a!3186) j!159) a!3186 mask!3328) lt!342549))))

(assert (=> b!769800 (= lt!342549 (Found!7871 j!159))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!342543 () SeekEntryResult!7871)

(declare-fun b!769801 () Bool)

(declare-fun e!428638 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42342 (_ BitVec 32)) SeekEntryResult!7871)

(assert (=> b!769801 (= e!428638 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20271 a!3186) j!159) a!3186 mask!3328) lt!342543))))

(declare-fun b!769802 () Bool)

(declare-fun res!520638 () Bool)

(assert (=> b!769802 (=> (not res!520638) (not e!428634))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769802 (= res!520638 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769803 () Bool)

(declare-fun e!428630 () Bool)

(assert (=> b!769803 (= e!428634 e!428630)))

(declare-fun res!520639 () Bool)

(assert (=> b!769803 (=> (not res!520639) (not e!428630))))

(declare-fun lt!342541 () SeekEntryResult!7871)

(assert (=> b!769803 (= res!520639 (or (= lt!342541 (MissingZero!7871 i!1173)) (= lt!342541 (MissingVacant!7871 i!1173))))))

(assert (=> b!769803 (= lt!342541 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!769804 () Bool)

(assert (=> b!769804 (= e!428639 e!428631)))

(declare-fun res!520652 () Bool)

(assert (=> b!769804 (=> (not res!520652) (not e!428631))))

(declare-fun lt!342544 () SeekEntryResult!7871)

(assert (=> b!769804 (= res!520652 (= lt!342544 lt!342545))))

(declare-fun lt!342550 () array!42342)

(declare-fun lt!342547 () (_ BitVec 64))

(assert (=> b!769804 (= lt!342545 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342547 lt!342550 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769804 (= lt!342544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342547 mask!3328) lt!342547 lt!342550 mask!3328))))

(assert (=> b!769804 (= lt!342547 (select (store (arr!20271 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!769804 (= lt!342550 (array!42343 (store (arr!20271 a!3186) i!1173 k!2102) (size!20692 a!3186)))))

(declare-fun b!769805 () Bool)

(declare-fun res!520651 () Bool)

(assert (=> b!769805 (=> (not res!520651) (not e!428634))))

(assert (=> b!769805 (= res!520651 (validKeyInArray!0 k!2102))))

(declare-fun b!769806 () Bool)

(assert (=> b!769806 (= e!428630 e!428639)))

(declare-fun res!520637 () Bool)

(assert (=> b!769806 (=> (not res!520637) (not e!428639))))

(assert (=> b!769806 (= res!520637 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20271 a!3186) j!159) mask!3328) (select (arr!20271 a!3186) j!159) a!3186 mask!3328) lt!342543))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769806 (= lt!342543 (Intermediate!7871 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769807 () Bool)

(declare-fun res!520640 () Bool)

(assert (=> b!769807 (=> (not res!520640) (not e!428630))))

(declare-datatypes ((List!14273 0))(
  ( (Nil!14270) (Cons!14269 (h!15368 (_ BitVec 64)) (t!20588 List!14273)) )
))
(declare-fun arrayNoDuplicates!0 (array!42342 (_ BitVec 32) List!14273) Bool)

(assert (=> b!769807 (= res!520640 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14270))))

(declare-fun res!520641 () Bool)

(assert (=> start!66780 (=> (not res!520641) (not e!428634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66780 (= res!520641 (validMask!0 mask!3328))))

(assert (=> start!66780 e!428634))

(assert (=> start!66780 true))

(declare-fun array_inv!16067 (array!42342) Bool)

(assert (=> start!66780 (array_inv!16067 a!3186)))

(declare-fun b!769808 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42342 (_ BitVec 32)) SeekEntryResult!7871)

(assert (=> b!769808 (= e!428632 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20271 a!3186) j!159) a!3186 mask!3328) lt!342549))))

(declare-fun b!769809 () Bool)

(assert (=> b!769809 (= e!428637 true)))

(declare-fun lt!342546 () Unit!26498)

(declare-fun e!428633 () Unit!26498)

(assert (=> b!769809 (= lt!342546 e!428633)))

(declare-fun c!84976 () Bool)

(assert (=> b!769809 (= c!84976 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!342548 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769809 (= lt!342548 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769810 () Bool)

(declare-fun Unit!26500 () Unit!26498)

(assert (=> b!769810 (= e!428633 Unit!26500)))

(assert (=> b!769810 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342548 (select (arr!20271 a!3186) j!159) a!3186 mask!3328) lt!342543)))

(declare-fun b!769811 () Bool)

(declare-fun res!520646 () Bool)

(assert (=> b!769811 (=> (not res!520646) (not e!428639))))

(assert (=> b!769811 (= res!520646 e!428638)))

(declare-fun c!84975 () Bool)

(assert (=> b!769811 (= c!84975 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769812 () Bool)

(declare-fun Unit!26501 () Unit!26498)

(assert (=> b!769812 (= e!428633 Unit!26501)))

(declare-fun lt!342542 () SeekEntryResult!7871)

(assert (=> b!769812 (= lt!342542 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20271 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769812 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342548 resIntermediateIndex!5 (select (arr!20271 a!3186) j!159) a!3186 mask!3328) (Found!7871 j!159))))

(declare-fun b!769813 () Bool)

(declare-fun res!520647 () Bool)

(assert (=> b!769813 (=> (not res!520647) (not e!428630))))

(assert (=> b!769813 (= res!520647 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20692 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20692 a!3186))))))

(declare-fun b!769814 () Bool)

(assert (=> b!769814 (= e!428638 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20271 a!3186) j!159) a!3186 mask!3328) (Found!7871 j!159)))))

(declare-fun b!769815 () Bool)

(declare-fun res!520643 () Bool)

(assert (=> b!769815 (=> (not res!520643) (not e!428630))))

(assert (=> b!769815 (= res!520643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!66780 res!520641) b!769799))

(assert (= (and b!769799 res!520644) b!769798))

(assert (= (and b!769798 res!520649) b!769805))

(assert (= (and b!769805 res!520651) b!769802))

(assert (= (and b!769802 res!520638) b!769803))

(assert (= (and b!769803 res!520639) b!769815))

(assert (= (and b!769815 res!520643) b!769807))

(assert (= (and b!769807 res!520640) b!769813))

(assert (= (and b!769813 res!520647) b!769806))

(assert (= (and b!769806 res!520637) b!769797))

(assert (= (and b!769797 res!520645) b!769811))

(assert (= (and b!769811 c!84975) b!769801))

(assert (= (and b!769811 (not c!84975)) b!769814))

(assert (= (and b!769811 res!520646) b!769804))

(assert (= (and b!769804 res!520652) b!769796))

(assert (= (and b!769796 res!520642) b!769800))

(assert (= (and b!769800 res!520648) b!769808))

(assert (= (and b!769796 (not res!520650)) b!769809))

(assert (= (and b!769809 c!84976) b!769810))

(assert (= (and b!769809 (not c!84976)) b!769812))

(declare-fun m!715163 () Bool)

(assert (=> start!66780 m!715163))

(declare-fun m!715165 () Bool)

(assert (=> start!66780 m!715165))

(declare-fun m!715167 () Bool)

(assert (=> b!769796 m!715167))

(declare-fun m!715169 () Bool)

(assert (=> b!769796 m!715169))

(declare-fun m!715171 () Bool)

(assert (=> b!769805 m!715171))

(declare-fun m!715173 () Bool)

(assert (=> b!769815 m!715173))

(declare-fun m!715175 () Bool)

(assert (=> b!769800 m!715175))

(assert (=> b!769800 m!715175))

(declare-fun m!715177 () Bool)

(assert (=> b!769800 m!715177))

(assert (=> b!769812 m!715175))

(assert (=> b!769812 m!715175))

(declare-fun m!715179 () Bool)

(assert (=> b!769812 m!715179))

(assert (=> b!769812 m!715175))

(declare-fun m!715181 () Bool)

(assert (=> b!769812 m!715181))

(assert (=> b!769806 m!715175))

(assert (=> b!769806 m!715175))

(declare-fun m!715183 () Bool)

(assert (=> b!769806 m!715183))

(assert (=> b!769806 m!715183))

(assert (=> b!769806 m!715175))

(declare-fun m!715185 () Bool)

(assert (=> b!769806 m!715185))

(assert (=> b!769814 m!715175))

(assert (=> b!769814 m!715175))

(assert (=> b!769814 m!715179))

(assert (=> b!769801 m!715175))

(assert (=> b!769801 m!715175))

(declare-fun m!715187 () Bool)

(assert (=> b!769801 m!715187))

(assert (=> b!769808 m!715175))

(assert (=> b!769808 m!715175))

(declare-fun m!715189 () Bool)

(assert (=> b!769808 m!715189))

(declare-fun m!715191 () Bool)

(assert (=> b!769797 m!715191))

(assert (=> b!769810 m!715175))

(assert (=> b!769810 m!715175))

(declare-fun m!715193 () Bool)

(assert (=> b!769810 m!715193))

(declare-fun m!715195 () Bool)

(assert (=> b!769809 m!715195))

(declare-fun m!715197 () Bool)

(assert (=> b!769807 m!715197))

(declare-fun m!715199 () Bool)

(assert (=> b!769802 m!715199))

(assert (=> b!769798 m!715175))

(assert (=> b!769798 m!715175))

(declare-fun m!715201 () Bool)

(assert (=> b!769798 m!715201))

(declare-fun m!715203 () Bool)

(assert (=> b!769804 m!715203))

(assert (=> b!769804 m!715203))

(declare-fun m!715205 () Bool)

(assert (=> b!769804 m!715205))

(declare-fun m!715207 () Bool)

(assert (=> b!769804 m!715207))

(declare-fun m!715209 () Bool)

(assert (=> b!769804 m!715209))

(declare-fun m!715211 () Bool)

(assert (=> b!769804 m!715211))

(declare-fun m!715213 () Bool)

(assert (=> b!769803 m!715213))

(push 1)

