; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65536 () Bool)

(assert start!65536)

(declare-fun b!748108 () Bool)

(declare-fun e!417602 () Bool)

(declare-fun e!417600 () Bool)

(assert (=> b!748108 (= e!417602 e!417600)))

(declare-fun res!504598 () Bool)

(assert (=> b!748108 (=> (not res!504598) (not e!417600))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7568 0))(
  ( (MissingZero!7568 (index!32640 (_ BitVec 32))) (Found!7568 (index!32641 (_ BitVec 32))) (Intermediate!7568 (undefined!8380 Bool) (index!32642 (_ BitVec 32)) (x!63582 (_ BitVec 32))) (Undefined!7568) (MissingVacant!7568 (index!32643 (_ BitVec 32))) )
))
(declare-fun lt!332551 () SeekEntryResult!7568)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41709 0))(
  ( (array!41710 (arr!19968 (Array (_ BitVec 32) (_ BitVec 64))) (size!20389 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41709)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41709 (_ BitVec 32)) SeekEntryResult!7568)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748108 (= res!504598 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19968 a!3186) j!159) mask!3328) (select (arr!19968 a!3186) j!159) a!3186 mask!3328) lt!332551))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748108 (= lt!332551 (Intermediate!7568 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748109 () Bool)

(declare-fun e!417599 () Bool)

(assert (=> b!748109 (= e!417599 e!417602)))

(declare-fun res!504600 () Bool)

(assert (=> b!748109 (=> (not res!504600) (not e!417602))))

(declare-fun lt!332548 () SeekEntryResult!7568)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!748109 (= res!504600 (or (= lt!332548 (MissingZero!7568 i!1173)) (= lt!332548 (MissingVacant!7568 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41709 (_ BitVec 32)) SeekEntryResult!7568)

(assert (=> b!748109 (= lt!332548 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!417603 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!748110 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41709 (_ BitVec 32)) SeekEntryResult!7568)

(assert (=> b!748110 (= e!417603 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19968 a!3186) j!159) a!3186 mask!3328) (Found!7568 j!159)))))

(declare-fun b!748111 () Bool)

(declare-fun res!504599 () Bool)

(assert (=> b!748111 (=> (not res!504599) (not e!417602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41709 (_ BitVec 32)) Bool)

(assert (=> b!748111 (= res!504599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748112 () Bool)

(declare-fun res!504602 () Bool)

(assert (=> b!748112 (=> (not res!504602) (not e!417599))))

(assert (=> b!748112 (= res!504602 (and (= (size!20389 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20389 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20389 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!417598 () Bool)

(declare-fun lt!332549 () SeekEntryResult!7568)

(declare-fun b!748113 () Bool)

(assert (=> b!748113 (= e!417598 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19968 a!3186) j!159) a!3186 mask!3328) lt!332549))))

(declare-fun b!748114 () Bool)

(declare-fun e!417601 () Bool)

(assert (=> b!748114 (= e!417600 e!417601)))

(declare-fun res!504609 () Bool)

(assert (=> b!748114 (=> (not res!504609) (not e!417601))))

(declare-fun lt!332554 () SeekEntryResult!7568)

(declare-fun lt!332552 () SeekEntryResult!7568)

(assert (=> b!748114 (= res!504609 (= lt!332554 lt!332552))))

(declare-fun lt!332553 () array!41709)

(declare-fun lt!332550 () (_ BitVec 64))

(assert (=> b!748114 (= lt!332552 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332550 lt!332553 mask!3328))))

(assert (=> b!748114 (= lt!332554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332550 mask!3328) lt!332550 lt!332553 mask!3328))))

(assert (=> b!748114 (= lt!332550 (select (store (arr!19968 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!748114 (= lt!332553 (array!41710 (store (arr!19968 a!3186) i!1173 k!2102) (size!20389 a!3186)))))

(declare-fun b!748115 () Bool)

(declare-fun res!504597 () Bool)

(assert (=> b!748115 (=> (not res!504597) (not e!417599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748115 (= res!504597 (validKeyInArray!0 (select (arr!19968 a!3186) j!159)))))

(declare-fun b!748116 () Bool)

(declare-fun res!504604 () Bool)

(declare-fun e!417604 () Bool)

(assert (=> b!748116 (=> res!504604 e!417604)))

(assert (=> b!748116 (= res!504604 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19968 a!3186) j!159) a!3186 mask!3328) lt!332549)))))

(declare-fun b!748117 () Bool)

(declare-fun res!504611 () Bool)

(assert (=> b!748117 (=> (not res!504611) (not e!417602))))

(declare-datatypes ((List!13970 0))(
  ( (Nil!13967) (Cons!13966 (h!15038 (_ BitVec 64)) (t!20285 List!13970)) )
))
(declare-fun arrayNoDuplicates!0 (array!41709 (_ BitVec 32) List!13970) Bool)

(assert (=> b!748117 (= res!504611 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13967))))

(declare-fun b!748118 () Bool)

(declare-fun res!504605 () Bool)

(assert (=> b!748118 (=> res!504605 e!417604)))

(assert (=> b!748118 (= res!504605 (= (select (store (arr!19968 a!3186) i!1173 k!2102) index!1321) lt!332550))))

(declare-fun b!748119 () Bool)

(declare-fun res!504607 () Bool)

(assert (=> b!748119 (=> (not res!504607) (not e!417600))))

(assert (=> b!748119 (= res!504607 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19968 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748120 () Bool)

(assert (=> b!748120 (= e!417604 true)))

(assert (=> b!748120 (= (select (store (arr!19968 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25652 0))(
  ( (Unit!25653) )
))
(declare-fun lt!332547 () Unit!25652)

(declare-fun e!417597 () Unit!25652)

(assert (=> b!748120 (= lt!332547 e!417597)))

(declare-fun c!82137 () Bool)

(assert (=> b!748120 (= c!82137 (= (select (store (arr!19968 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748121 () Bool)

(declare-fun res!504608 () Bool)

(assert (=> b!748121 (=> (not res!504608) (not e!417600))))

(assert (=> b!748121 (= res!504608 e!417603)))

(declare-fun c!82138 () Bool)

(assert (=> b!748121 (= c!82138 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748122 () Bool)

(declare-fun res!504606 () Bool)

(assert (=> b!748122 (=> (not res!504606) (not e!417599))))

(assert (=> b!748122 (= res!504606 (validKeyInArray!0 k!2102))))

(declare-fun b!748123 () Bool)

(assert (=> b!748123 (= e!417601 (not e!417604))))

(declare-fun res!504596 () Bool)

(assert (=> b!748123 (=> res!504596 e!417604)))

(assert (=> b!748123 (= res!504596 (or (not (is-Intermediate!7568 lt!332552)) (bvslt x!1131 (x!63582 lt!332552)) (not (= x!1131 (x!63582 lt!332552))) (not (= index!1321 (index!32642 lt!332552)))))))

(assert (=> b!748123 e!417598))

(declare-fun res!504603 () Bool)

(assert (=> b!748123 (=> (not res!504603) (not e!417598))))

(declare-fun lt!332546 () SeekEntryResult!7568)

(assert (=> b!748123 (= res!504603 (= lt!332546 lt!332549))))

(assert (=> b!748123 (= lt!332549 (Found!7568 j!159))))

(assert (=> b!748123 (= lt!332546 (seekEntryOrOpen!0 (select (arr!19968 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!748123 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332555 () Unit!25652)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25652)

(assert (=> b!748123 (= lt!332555 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!504610 () Bool)

(assert (=> start!65536 (=> (not res!504610) (not e!417599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65536 (= res!504610 (validMask!0 mask!3328))))

(assert (=> start!65536 e!417599))

(assert (=> start!65536 true))

(declare-fun array_inv!15764 (array!41709) Bool)

(assert (=> start!65536 (array_inv!15764 a!3186)))

(declare-fun b!748124 () Bool)

(declare-fun res!504601 () Bool)

(assert (=> b!748124 (=> (not res!504601) (not e!417602))))

(assert (=> b!748124 (= res!504601 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20389 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20389 a!3186))))))

(declare-fun b!748125 () Bool)

(assert (=> b!748125 (= e!417603 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19968 a!3186) j!159) a!3186 mask!3328) lt!332551))))

(declare-fun b!748126 () Bool)

(declare-fun Unit!25654 () Unit!25652)

(assert (=> b!748126 (= e!417597 Unit!25654)))

(assert (=> b!748126 false))

(declare-fun b!748127 () Bool)

(declare-fun res!504595 () Bool)

(assert (=> b!748127 (=> (not res!504595) (not e!417599))))

(declare-fun arrayContainsKey!0 (array!41709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748127 (= res!504595 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748128 () Bool)

(declare-fun Unit!25655 () Unit!25652)

(assert (=> b!748128 (= e!417597 Unit!25655)))

(assert (= (and start!65536 res!504610) b!748112))

(assert (= (and b!748112 res!504602) b!748115))

(assert (= (and b!748115 res!504597) b!748122))

(assert (= (and b!748122 res!504606) b!748127))

(assert (= (and b!748127 res!504595) b!748109))

(assert (= (and b!748109 res!504600) b!748111))

(assert (= (and b!748111 res!504599) b!748117))

(assert (= (and b!748117 res!504611) b!748124))

(assert (= (and b!748124 res!504601) b!748108))

(assert (= (and b!748108 res!504598) b!748119))

(assert (= (and b!748119 res!504607) b!748121))

(assert (= (and b!748121 c!82138) b!748125))

(assert (= (and b!748121 (not c!82138)) b!748110))

(assert (= (and b!748121 res!504608) b!748114))

(assert (= (and b!748114 res!504609) b!748123))

(assert (= (and b!748123 res!504603) b!748113))

(assert (= (and b!748123 (not res!504596)) b!748116))

(assert (= (and b!748116 (not res!504604)) b!748118))

(assert (= (and b!748118 (not res!504605)) b!748120))

(assert (= (and b!748120 c!82137) b!748126))

(assert (= (and b!748120 (not c!82137)) b!748128))

(declare-fun m!698029 () Bool)

(assert (=> b!748113 m!698029))

(assert (=> b!748113 m!698029))

(declare-fun m!698031 () Bool)

(assert (=> b!748113 m!698031))

(declare-fun m!698033 () Bool)

(assert (=> b!748119 m!698033))

(declare-fun m!698035 () Bool)

(assert (=> b!748109 m!698035))

(declare-fun m!698037 () Bool)

(assert (=> b!748114 m!698037))

(declare-fun m!698039 () Bool)

(assert (=> b!748114 m!698039))

(declare-fun m!698041 () Bool)

(assert (=> b!748114 m!698041))

(declare-fun m!698043 () Bool)

(assert (=> b!748114 m!698043))

(declare-fun m!698045 () Bool)

(assert (=> b!748114 m!698045))

(assert (=> b!748114 m!698043))

(assert (=> b!748123 m!698029))

(assert (=> b!748123 m!698029))

(declare-fun m!698047 () Bool)

(assert (=> b!748123 m!698047))

(declare-fun m!698049 () Bool)

(assert (=> b!748123 m!698049))

(declare-fun m!698051 () Bool)

(assert (=> b!748123 m!698051))

(assert (=> b!748120 m!698039))

(declare-fun m!698053 () Bool)

(assert (=> b!748120 m!698053))

(assert (=> b!748118 m!698039))

(assert (=> b!748118 m!698053))

(assert (=> b!748108 m!698029))

(assert (=> b!748108 m!698029))

(declare-fun m!698055 () Bool)

(assert (=> b!748108 m!698055))

(assert (=> b!748108 m!698055))

(assert (=> b!748108 m!698029))

(declare-fun m!698057 () Bool)

(assert (=> b!748108 m!698057))

(declare-fun m!698059 () Bool)

(assert (=> start!65536 m!698059))

(declare-fun m!698061 () Bool)

(assert (=> start!65536 m!698061))

(assert (=> b!748110 m!698029))

(assert (=> b!748110 m!698029))

(declare-fun m!698063 () Bool)

(assert (=> b!748110 m!698063))

(assert (=> b!748115 m!698029))

(assert (=> b!748115 m!698029))

(declare-fun m!698065 () Bool)

(assert (=> b!748115 m!698065))

(declare-fun m!698067 () Bool)

(assert (=> b!748117 m!698067))

(assert (=> b!748125 m!698029))

(assert (=> b!748125 m!698029))

(declare-fun m!698069 () Bool)

(assert (=> b!748125 m!698069))

(declare-fun m!698071 () Bool)

(assert (=> b!748127 m!698071))

(assert (=> b!748116 m!698029))

(assert (=> b!748116 m!698029))

(assert (=> b!748116 m!698063))

(declare-fun m!698073 () Bool)

(assert (=> b!748111 m!698073))

(declare-fun m!698075 () Bool)

(assert (=> b!748122 m!698075))

(push 1)

