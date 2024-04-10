; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64340 () Bool)

(assert start!64340)

(declare-fun b!723157 () Bool)

(declare-fun res!484778 () Bool)

(declare-fun e!405194 () Bool)

(assert (=> b!723157 (=> (not res!484778) (not e!405194))))

(declare-datatypes ((array!40921 0))(
  ( (array!40922 (arr!19583 (Array (_ BitVec 32) (_ BitVec 64))) (size!20004 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40921)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40921 (_ BitVec 32)) Bool)

(assert (=> b!723157 (= res!484778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723158 () Bool)

(declare-fun e!405190 () Bool)

(declare-fun e!405191 () Bool)

(assert (=> b!723158 (= e!405190 e!405191)))

(declare-fun res!484772 () Bool)

(assert (=> b!723158 (=> (not res!484772) (not e!405191))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!320575 () (_ BitVec 64))

(declare-fun lt!320576 () array!40921)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7183 0))(
  ( (MissingZero!7183 (index!31100 (_ BitVec 32))) (Found!7183 (index!31101 (_ BitVec 32))) (Intermediate!7183 (undefined!7995 Bool) (index!31102 (_ BitVec 32)) (x!62096 (_ BitVec 32))) (Undefined!7183) (MissingVacant!7183 (index!31103 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40921 (_ BitVec 32)) SeekEntryResult!7183)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723158 (= res!484772 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320575 mask!3328) lt!320575 lt!320576 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320575 lt!320576 mask!3328)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723158 (= lt!320575 (select (store (arr!19583 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!723158 (= lt!320576 (array!40922 (store (arr!19583 a!3186) i!1173 k!2102) (size!20004 a!3186)))))

(declare-fun b!723159 () Bool)

(declare-fun res!484773 () Bool)

(declare-fun e!405193 () Bool)

(assert (=> b!723159 (=> (not res!484773) (not e!405193))))

(declare-fun arrayContainsKey!0 (array!40921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723159 (= res!484773 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723160 () Bool)

(declare-fun res!484776 () Bool)

(assert (=> b!723160 (=> (not res!484776) (not e!405193))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723160 (= res!484776 (validKeyInArray!0 k!2102))))

(declare-fun b!723162 () Bool)

(declare-fun res!484770 () Bool)

(assert (=> b!723162 (=> (not res!484770) (not e!405193))))

(assert (=> b!723162 (= res!484770 (and (= (size!20004 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20004 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20004 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723163 () Bool)

(declare-fun res!484767 () Bool)

(assert (=> b!723163 (=> (not res!484767) (not e!405190))))

(declare-fun e!405189 () Bool)

(assert (=> b!723163 (= res!484767 e!405189)))

(declare-fun c!79567 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723163 (= c!79567 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!723164 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40921 (_ BitVec 32)) SeekEntryResult!7183)

(assert (=> b!723164 (= e!405189 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19583 a!3186) j!159) a!3186 mask!3328) (Found!7183 j!159)))))

(declare-fun b!723165 () Bool)

(declare-fun res!484771 () Bool)

(assert (=> b!723165 (=> (not res!484771) (not e!405194))))

(declare-datatypes ((List!13585 0))(
  ( (Nil!13582) (Cons!13581 (h!14635 (_ BitVec 64)) (t!19900 List!13585)) )
))
(declare-fun arrayNoDuplicates!0 (array!40921 (_ BitVec 32) List!13585) Bool)

(assert (=> b!723165 (= res!484771 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13582))))

(declare-fun b!723166 () Bool)

(declare-fun res!484775 () Bool)

(assert (=> b!723166 (=> (not res!484775) (not e!405193))))

(assert (=> b!723166 (= res!484775 (validKeyInArray!0 (select (arr!19583 a!3186) j!159)))))

(declare-fun b!723167 () Bool)

(assert (=> b!723167 (= e!405194 e!405190)))

(declare-fun res!484774 () Bool)

(assert (=> b!723167 (=> (not res!484774) (not e!405190))))

(declare-fun lt!320577 () SeekEntryResult!7183)

(assert (=> b!723167 (= res!484774 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19583 a!3186) j!159) mask!3328) (select (arr!19583 a!3186) j!159) a!3186 mask!3328) lt!320577))))

(assert (=> b!723167 (= lt!320577 (Intermediate!7183 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723168 () Bool)

(assert (=> b!723168 (= e!405189 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19583 a!3186) j!159) a!3186 mask!3328) lt!320577))))

(declare-fun b!723169 () Bool)

(assert (=> b!723169 (= e!405193 e!405194)))

(declare-fun res!484777 () Bool)

(assert (=> b!723169 (=> (not res!484777) (not e!405194))))

(declare-fun lt!320578 () SeekEntryResult!7183)

(assert (=> b!723169 (= res!484777 (or (= lt!320578 (MissingZero!7183 i!1173)) (= lt!320578 (MissingVacant!7183 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40921 (_ BitVec 32)) SeekEntryResult!7183)

(assert (=> b!723169 (= lt!320578 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!484768 () Bool)

(assert (=> start!64340 (=> (not res!484768) (not e!405193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64340 (= res!484768 (validMask!0 mask!3328))))

(assert (=> start!64340 e!405193))

(assert (=> start!64340 true))

(declare-fun array_inv!15379 (array!40921) Bool)

(assert (=> start!64340 (array_inv!15379 a!3186)))

(declare-fun b!723161 () Bool)

(assert (=> b!723161 (= e!405191 (not true))))

(assert (=> b!723161 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24684 0))(
  ( (Unit!24685) )
))
(declare-fun lt!320579 () Unit!24684)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40921 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24684)

(assert (=> b!723161 (= lt!320579 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723170 () Bool)

(declare-fun res!484766 () Bool)

(assert (=> b!723170 (=> (not res!484766) (not e!405194))))

(assert (=> b!723170 (= res!484766 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20004 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20004 a!3186))))))

(declare-fun b!723171 () Bool)

(declare-fun res!484769 () Bool)

(assert (=> b!723171 (=> (not res!484769) (not e!405190))))

(assert (=> b!723171 (= res!484769 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19583 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64340 res!484768) b!723162))

(assert (= (and b!723162 res!484770) b!723166))

(assert (= (and b!723166 res!484775) b!723160))

(assert (= (and b!723160 res!484776) b!723159))

(assert (= (and b!723159 res!484773) b!723169))

(assert (= (and b!723169 res!484777) b!723157))

(assert (= (and b!723157 res!484778) b!723165))

(assert (= (and b!723165 res!484771) b!723170))

(assert (= (and b!723170 res!484766) b!723167))

(assert (= (and b!723167 res!484774) b!723171))

(assert (= (and b!723171 res!484769) b!723163))

(assert (= (and b!723163 c!79567) b!723168))

(assert (= (and b!723163 (not c!79567)) b!723164))

(assert (= (and b!723163 res!484767) b!723158))

(assert (= (and b!723158 res!484772) b!723161))

(declare-fun m!677617 () Bool)

(assert (=> b!723157 m!677617))

(declare-fun m!677619 () Bool)

(assert (=> b!723166 m!677619))

(assert (=> b!723166 m!677619))

(declare-fun m!677621 () Bool)

(assert (=> b!723166 m!677621))

(declare-fun m!677623 () Bool)

(assert (=> b!723171 m!677623))

(declare-fun m!677625 () Bool)

(assert (=> b!723158 m!677625))

(declare-fun m!677627 () Bool)

(assert (=> b!723158 m!677627))

(declare-fun m!677629 () Bool)

(assert (=> b!723158 m!677629))

(declare-fun m!677631 () Bool)

(assert (=> b!723158 m!677631))

(assert (=> b!723158 m!677627))

(declare-fun m!677633 () Bool)

(assert (=> b!723158 m!677633))

(declare-fun m!677635 () Bool)

(assert (=> start!64340 m!677635))

(declare-fun m!677637 () Bool)

(assert (=> start!64340 m!677637))

(declare-fun m!677639 () Bool)

(assert (=> b!723169 m!677639))

(declare-fun m!677641 () Bool)

(assert (=> b!723160 m!677641))

(assert (=> b!723167 m!677619))

(assert (=> b!723167 m!677619))

(declare-fun m!677643 () Bool)

(assert (=> b!723167 m!677643))

(assert (=> b!723167 m!677643))

(assert (=> b!723167 m!677619))

(declare-fun m!677645 () Bool)

(assert (=> b!723167 m!677645))

(assert (=> b!723168 m!677619))

(assert (=> b!723168 m!677619))

(declare-fun m!677647 () Bool)

(assert (=> b!723168 m!677647))

(declare-fun m!677649 () Bool)

(assert (=> b!723165 m!677649))

(declare-fun m!677651 () Bool)

(assert (=> b!723161 m!677651))

(declare-fun m!677653 () Bool)

(assert (=> b!723161 m!677653))

(assert (=> b!723164 m!677619))

(assert (=> b!723164 m!677619))

(declare-fun m!677655 () Bool)

(assert (=> b!723164 m!677655))

(declare-fun m!677657 () Bool)

(assert (=> b!723159 m!677657))

(push 1)

(assert (not b!723158))

(assert (not b!723164))

