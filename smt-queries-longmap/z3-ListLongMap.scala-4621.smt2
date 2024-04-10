; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64362 () Bool)

(assert start!64362)

(declare-fun b!723657 () Bool)

(declare-fun res!485201 () Bool)

(declare-fun e!405393 () Bool)

(assert (=> b!723657 (=> (not res!485201) (not e!405393))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723657 (= res!485201 (validKeyInArray!0 k0!2102))))

(declare-fun res!485200 () Bool)

(assert (=> start!64362 (=> (not res!485200) (not e!405393))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64362 (= res!485200 (validMask!0 mask!3328))))

(assert (=> start!64362 e!405393))

(assert (=> start!64362 true))

(declare-datatypes ((array!40943 0))(
  ( (array!40944 (arr!19594 (Array (_ BitVec 32) (_ BitVec 64))) (size!20015 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40943)

(declare-fun array_inv!15390 (array!40943) Bool)

(assert (=> start!64362 (array_inv!15390 a!3186)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!405392 () Bool)

(declare-datatypes ((SeekEntryResult!7194 0))(
  ( (MissingZero!7194 (index!31144 (_ BitVec 32))) (Found!7194 (index!31145 (_ BitVec 32))) (Intermediate!7194 (undefined!8006 Bool) (index!31146 (_ BitVec 32)) (x!62139 (_ BitVec 32))) (Undefined!7194) (MissingVacant!7194 (index!31147 (_ BitVec 32))) )
))
(declare-fun lt!320743 () SeekEntryResult!7194)

(declare-fun b!723658 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40943 (_ BitVec 32)) SeekEntryResult!7194)

(assert (=> b!723658 (= e!405392 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19594 a!3186) j!159) a!3186 mask!3328) lt!320743))))

(declare-fun b!723659 () Bool)

(declare-fun res!485208 () Bool)

(declare-fun e!405396 () Bool)

(assert (=> b!723659 (=> (not res!485208) (not e!405396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40943 (_ BitVec 32)) Bool)

(assert (=> b!723659 (= res!485208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723660 () Bool)

(declare-fun res!485205 () Bool)

(assert (=> b!723660 (=> (not res!485205) (not e!405396))))

(declare-datatypes ((List!13596 0))(
  ( (Nil!13593) (Cons!13592 (h!14646 (_ BitVec 64)) (t!19911 List!13596)) )
))
(declare-fun arrayNoDuplicates!0 (array!40943 (_ BitVec 32) List!13596) Bool)

(assert (=> b!723660 (= res!485205 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13593))))

(declare-fun b!723661 () Bool)

(declare-fun res!485202 () Bool)

(assert (=> b!723661 (=> (not res!485202) (not e!405396))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723661 (= res!485202 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20015 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20015 a!3186))))))

(declare-fun b!723662 () Bool)

(declare-fun e!405397 () Bool)

(assert (=> b!723662 (= e!405396 e!405397)))

(declare-fun res!485206 () Bool)

(assert (=> b!723662 (=> (not res!485206) (not e!405397))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723662 (= res!485206 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19594 a!3186) j!159) mask!3328) (select (arr!19594 a!3186) j!159) a!3186 mask!3328) lt!320743))))

(assert (=> b!723662 (= lt!320743 (Intermediate!7194 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723663 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40943 (_ BitVec 32)) SeekEntryResult!7194)

(assert (=> b!723663 (= e!405392 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19594 a!3186) j!159) a!3186 mask!3328) (Found!7194 j!159)))))

(declare-fun e!405394 () Bool)

(declare-fun b!723664 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40943 (_ BitVec 32)) SeekEntryResult!7194)

(assert (=> b!723664 (= e!405394 (= (seekEntryOrOpen!0 (select (arr!19594 a!3186) j!159) a!3186 mask!3328) (Found!7194 j!159)))))

(declare-fun b!723665 () Bool)

(declare-fun e!405395 () Bool)

(assert (=> b!723665 (= e!405395 (not true))))

(assert (=> b!723665 e!405394))

(declare-fun res!485204 () Bool)

(assert (=> b!723665 (=> (not res!485204) (not e!405394))))

(assert (=> b!723665 (= res!485204 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24706 0))(
  ( (Unit!24707) )
))
(declare-fun lt!320744 () Unit!24706)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40943 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24706)

(assert (=> b!723665 (= lt!320744 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723666 () Bool)

(declare-fun res!485212 () Bool)

(assert (=> b!723666 (=> (not res!485212) (not e!405393))))

(declare-fun arrayContainsKey!0 (array!40943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723666 (= res!485212 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723667 () Bool)

(assert (=> b!723667 (= e!405393 e!405396)))

(declare-fun res!485211 () Bool)

(assert (=> b!723667 (=> (not res!485211) (not e!405396))))

(declare-fun lt!320740 () SeekEntryResult!7194)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723667 (= res!485211 (or (= lt!320740 (MissingZero!7194 i!1173)) (= lt!320740 (MissingVacant!7194 i!1173))))))

(assert (=> b!723667 (= lt!320740 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723668 () Bool)

(declare-fun res!485203 () Bool)

(assert (=> b!723668 (=> (not res!485203) (not e!405397))))

(assert (=> b!723668 (= res!485203 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19594 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723669 () Bool)

(declare-fun res!485209 () Bool)

(assert (=> b!723669 (=> (not res!485209) (not e!405397))))

(assert (=> b!723669 (= res!485209 e!405392)))

(declare-fun c!79600 () Bool)

(assert (=> b!723669 (= c!79600 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723670 () Bool)

(declare-fun res!485210 () Bool)

(assert (=> b!723670 (=> (not res!485210) (not e!405393))))

(assert (=> b!723670 (= res!485210 (validKeyInArray!0 (select (arr!19594 a!3186) j!159)))))

(declare-fun b!723671 () Bool)

(assert (=> b!723671 (= e!405397 e!405395)))

(declare-fun res!485213 () Bool)

(assert (=> b!723671 (=> (not res!485213) (not e!405395))))

(declare-fun lt!320741 () (_ BitVec 64))

(declare-fun lt!320742 () array!40943)

(assert (=> b!723671 (= res!485213 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320741 mask!3328) lt!320741 lt!320742 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320741 lt!320742 mask!3328)))))

(assert (=> b!723671 (= lt!320741 (select (store (arr!19594 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723671 (= lt!320742 (array!40944 (store (arr!19594 a!3186) i!1173 k0!2102) (size!20015 a!3186)))))

(declare-fun b!723672 () Bool)

(declare-fun res!485207 () Bool)

(assert (=> b!723672 (=> (not res!485207) (not e!405393))))

(assert (=> b!723672 (= res!485207 (and (= (size!20015 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20015 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20015 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64362 res!485200) b!723672))

(assert (= (and b!723672 res!485207) b!723670))

(assert (= (and b!723670 res!485210) b!723657))

(assert (= (and b!723657 res!485201) b!723666))

(assert (= (and b!723666 res!485212) b!723667))

(assert (= (and b!723667 res!485211) b!723659))

(assert (= (and b!723659 res!485208) b!723660))

(assert (= (and b!723660 res!485205) b!723661))

(assert (= (and b!723661 res!485202) b!723662))

(assert (= (and b!723662 res!485206) b!723668))

(assert (= (and b!723668 res!485203) b!723669))

(assert (= (and b!723669 c!79600) b!723658))

(assert (= (and b!723669 (not c!79600)) b!723663))

(assert (= (and b!723669 res!485209) b!723671))

(assert (= (and b!723671 res!485213) b!723665))

(assert (= (and b!723665 res!485204) b!723664))

(declare-fun m!678081 () Bool)

(assert (=> b!723660 m!678081))

(declare-fun m!678083 () Bool)

(assert (=> b!723658 m!678083))

(assert (=> b!723658 m!678083))

(declare-fun m!678085 () Bool)

(assert (=> b!723658 m!678085))

(declare-fun m!678087 () Bool)

(assert (=> b!723667 m!678087))

(assert (=> b!723664 m!678083))

(assert (=> b!723664 m!678083))

(declare-fun m!678089 () Bool)

(assert (=> b!723664 m!678089))

(assert (=> b!723662 m!678083))

(assert (=> b!723662 m!678083))

(declare-fun m!678091 () Bool)

(assert (=> b!723662 m!678091))

(assert (=> b!723662 m!678091))

(assert (=> b!723662 m!678083))

(declare-fun m!678093 () Bool)

(assert (=> b!723662 m!678093))

(declare-fun m!678095 () Bool)

(assert (=> b!723665 m!678095))

(declare-fun m!678097 () Bool)

(assert (=> b!723665 m!678097))

(declare-fun m!678099 () Bool)

(assert (=> b!723666 m!678099))

(declare-fun m!678101 () Bool)

(assert (=> b!723659 m!678101))

(declare-fun m!678103 () Bool)

(assert (=> b!723657 m!678103))

(assert (=> b!723670 m!678083))

(assert (=> b!723670 m!678083))

(declare-fun m!678105 () Bool)

(assert (=> b!723670 m!678105))

(declare-fun m!678107 () Bool)

(assert (=> start!64362 m!678107))

(declare-fun m!678109 () Bool)

(assert (=> start!64362 m!678109))

(assert (=> b!723663 m!678083))

(assert (=> b!723663 m!678083))

(declare-fun m!678111 () Bool)

(assert (=> b!723663 m!678111))

(declare-fun m!678113 () Bool)

(assert (=> b!723668 m!678113))

(declare-fun m!678115 () Bool)

(assert (=> b!723671 m!678115))

(declare-fun m!678117 () Bool)

(assert (=> b!723671 m!678117))

(declare-fun m!678119 () Bool)

(assert (=> b!723671 m!678119))

(declare-fun m!678121 () Bool)

(assert (=> b!723671 m!678121))

(assert (=> b!723671 m!678115))

(declare-fun m!678123 () Bool)

(assert (=> b!723671 m!678123))

(check-sat (not b!723659) (not start!64362) (not b!723667) (not b!723665) (not b!723664) (not b!723671) (not b!723658) (not b!723670) (not b!723662) (not b!723666) (not b!723660) (not b!723663) (not b!723657))
(check-sat)
