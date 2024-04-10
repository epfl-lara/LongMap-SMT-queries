; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64342 () Bool)

(assert start!64342)

(declare-fun b!723202 () Bool)

(declare-fun res!484817 () Bool)

(declare-fun e!405207 () Bool)

(assert (=> b!723202 (=> (not res!484817) (not e!405207))))

(declare-fun e!405212 () Bool)

(assert (=> b!723202 (= res!484817 e!405212)))

(declare-fun c!79570 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723202 (= c!79570 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723203 () Bool)

(declare-fun res!484806 () Bool)

(declare-fun e!405210 () Bool)

(assert (=> b!723203 (=> (not res!484806) (not e!405210))))

(declare-datatypes ((array!40923 0))(
  ( (array!40924 (arr!19584 (Array (_ BitVec 32) (_ BitVec 64))) (size!20005 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40923)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!723203 (= res!484806 (and (= (size!20005 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20005 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20005 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!484807 () Bool)

(assert (=> start!64342 (=> (not res!484807) (not e!405210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64342 (= res!484807 (validMask!0 mask!3328))))

(assert (=> start!64342 e!405210))

(assert (=> start!64342 true))

(declare-fun array_inv!15380 (array!40923) Bool)

(assert (=> start!64342 (array_inv!15380 a!3186)))

(declare-fun b!723204 () Bool)

(declare-fun res!484813 () Bool)

(declare-fun e!405208 () Bool)

(assert (=> b!723204 (=> (not res!484813) (not e!405208))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!723204 (= res!484813 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20005 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20005 a!3186))))))

(declare-fun b!723205 () Bool)

(assert (=> b!723205 (= e!405208 e!405207)))

(declare-fun res!484811 () Bool)

(assert (=> b!723205 (=> (not res!484811) (not e!405207))))

(declare-datatypes ((SeekEntryResult!7184 0))(
  ( (MissingZero!7184 (index!31104 (_ BitVec 32))) (Found!7184 (index!31105 (_ BitVec 32))) (Intermediate!7184 (undefined!7996 Bool) (index!31106 (_ BitVec 32)) (x!62105 (_ BitVec 32))) (Undefined!7184) (MissingVacant!7184 (index!31107 (_ BitVec 32))) )
))
(declare-fun lt!320592 () SeekEntryResult!7184)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40923 (_ BitVec 32)) SeekEntryResult!7184)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723205 (= res!484811 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19584 a!3186) j!159) mask!3328) (select (arr!19584 a!3186) j!159) a!3186 mask!3328) lt!320592))))

(assert (=> b!723205 (= lt!320592 (Intermediate!7184 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723206 () Bool)

(declare-fun res!484809 () Bool)

(assert (=> b!723206 (=> (not res!484809) (not e!405208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40923 (_ BitVec 32)) Bool)

(assert (=> b!723206 (= res!484809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723207 () Bool)

(declare-fun res!484816 () Bool)

(assert (=> b!723207 (=> (not res!484816) (not e!405210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723207 (= res!484816 (validKeyInArray!0 (select (arr!19584 a!3186) j!159)))))

(declare-fun b!723208 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40923 (_ BitVec 32)) SeekEntryResult!7184)

(assert (=> b!723208 (= e!405212 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19584 a!3186) j!159) a!3186 mask!3328) (Found!7184 j!159)))))

(declare-fun b!723209 () Bool)

(declare-fun res!484814 () Bool)

(assert (=> b!723209 (=> (not res!484814) (not e!405210))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723209 (= res!484814 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723210 () Bool)

(assert (=> b!723210 (= e!405212 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19584 a!3186) j!159) a!3186 mask!3328) lt!320592))))

(declare-fun b!723211 () Bool)

(assert (=> b!723211 (= e!405210 e!405208)))

(declare-fun res!484808 () Bool)

(assert (=> b!723211 (=> (not res!484808) (not e!405208))))

(declare-fun lt!320594 () SeekEntryResult!7184)

(assert (=> b!723211 (= res!484808 (or (= lt!320594 (MissingZero!7184 i!1173)) (= lt!320594 (MissingVacant!7184 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40923 (_ BitVec 32)) SeekEntryResult!7184)

(assert (=> b!723211 (= lt!320594 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!723212 () Bool)

(declare-fun res!484805 () Bool)

(assert (=> b!723212 (=> (not res!484805) (not e!405208))))

(declare-datatypes ((List!13586 0))(
  ( (Nil!13583) (Cons!13582 (h!14636 (_ BitVec 64)) (t!19901 List!13586)) )
))
(declare-fun arrayNoDuplicates!0 (array!40923 (_ BitVec 32) List!13586) Bool)

(assert (=> b!723212 (= res!484805 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13583))))

(declare-fun b!723213 () Bool)

(declare-fun e!405211 () Bool)

(assert (=> b!723213 (= e!405207 e!405211)))

(declare-fun res!484812 () Bool)

(assert (=> b!723213 (=> (not res!484812) (not e!405211))))

(declare-fun lt!320591 () array!40923)

(declare-fun lt!320590 () (_ BitVec 64))

(assert (=> b!723213 (= res!484812 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320590 mask!3328) lt!320590 lt!320591 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320590 lt!320591 mask!3328)))))

(assert (=> b!723213 (= lt!320590 (select (store (arr!19584 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!723213 (= lt!320591 (array!40924 (store (arr!19584 a!3186) i!1173 k!2102) (size!20005 a!3186)))))

(declare-fun b!723214 () Bool)

(declare-fun res!484810 () Bool)

(assert (=> b!723214 (=> (not res!484810) (not e!405210))))

(assert (=> b!723214 (= res!484810 (validKeyInArray!0 k!2102))))

(declare-fun b!723215 () Bool)

(declare-fun res!484815 () Bool)

(assert (=> b!723215 (=> (not res!484815) (not e!405207))))

(assert (=> b!723215 (= res!484815 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19584 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723216 () Bool)

(assert (=> b!723216 (= e!405211 (not (bvsge mask!3328 #b00000000000000000000000000000000)))))

(assert (=> b!723216 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24686 0))(
  ( (Unit!24687) )
))
(declare-fun lt!320593 () Unit!24686)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24686)

(assert (=> b!723216 (= lt!320593 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!64342 res!484807) b!723203))

(assert (= (and b!723203 res!484806) b!723207))

(assert (= (and b!723207 res!484816) b!723214))

(assert (= (and b!723214 res!484810) b!723209))

(assert (= (and b!723209 res!484814) b!723211))

(assert (= (and b!723211 res!484808) b!723206))

(assert (= (and b!723206 res!484809) b!723212))

(assert (= (and b!723212 res!484805) b!723204))

(assert (= (and b!723204 res!484813) b!723205))

(assert (= (and b!723205 res!484811) b!723215))

(assert (= (and b!723215 res!484815) b!723202))

(assert (= (and b!723202 c!79570) b!723210))

(assert (= (and b!723202 (not c!79570)) b!723208))

(assert (= (and b!723202 res!484817) b!723213))

(assert (= (and b!723213 res!484812) b!723216))

(declare-fun m!677659 () Bool)

(assert (=> b!723208 m!677659))

(assert (=> b!723208 m!677659))

(declare-fun m!677661 () Bool)

(assert (=> b!723208 m!677661))

(declare-fun m!677663 () Bool)

(assert (=> b!723214 m!677663))

(declare-fun m!677665 () Bool)

(assert (=> b!723212 m!677665))

(declare-fun m!677667 () Bool)

(assert (=> b!723211 m!677667))

(declare-fun m!677669 () Bool)

(assert (=> b!723216 m!677669))

(declare-fun m!677671 () Bool)

(assert (=> b!723216 m!677671))

(declare-fun m!677673 () Bool)

(assert (=> start!64342 m!677673))

(declare-fun m!677675 () Bool)

(assert (=> start!64342 m!677675))

(assert (=> b!723207 m!677659))

(assert (=> b!723207 m!677659))

(declare-fun m!677677 () Bool)

(assert (=> b!723207 m!677677))

(declare-fun m!677679 () Bool)

(assert (=> b!723215 m!677679))

(assert (=> b!723210 m!677659))

(assert (=> b!723210 m!677659))

(declare-fun m!677681 () Bool)

(assert (=> b!723210 m!677681))

(declare-fun m!677683 () Bool)

(assert (=> b!723213 m!677683))

(declare-fun m!677685 () Bool)

(assert (=> b!723213 m!677685))

(declare-fun m!677687 () Bool)

(assert (=> b!723213 m!677687))

(declare-fun m!677689 () Bool)

(assert (=> b!723213 m!677689))

(assert (=> b!723213 m!677685))

(declare-fun m!677691 () Bool)

(assert (=> b!723213 m!677691))

(declare-fun m!677693 () Bool)

(assert (=> b!723209 m!677693))

(assert (=> b!723205 m!677659))

(assert (=> b!723205 m!677659))

(declare-fun m!677695 () Bool)

(assert (=> b!723205 m!677695))

(assert (=> b!723205 m!677695))

(assert (=> b!723205 m!677659))

(declare-fun m!677697 () Bool)

(assert (=> b!723205 m!677697))

(declare-fun m!677699 () Bool)

(assert (=> b!723206 m!677699))

(push 1)

