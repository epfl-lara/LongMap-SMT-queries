; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64380 () Bool)

(assert start!64380)

(declare-fun b!723015 () Bool)

(declare-fun e!405245 () Bool)

(assert (=> b!723015 (= e!405245 false)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!40894 0))(
  ( (array!40895 (arr!19567 (Array (_ BitVec 32) (_ BitVec 64))) (size!19987 (_ BitVec 32))) )
))
(declare-fun lt!320516 () array!40894)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!320517 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7123 0))(
  ( (MissingZero!7123 (index!30860 (_ BitVec 32))) (Found!7123 (index!30861 (_ BitVec 32))) (Intermediate!7123 (undefined!7935 Bool) (index!30862 (_ BitVec 32)) (x!62015 (_ BitVec 32))) (Undefined!7123) (MissingVacant!7123 (index!30863 (_ BitVec 32))) )
))
(declare-fun lt!320515 () SeekEntryResult!7123)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40894 (_ BitVec 32)) SeekEntryResult!7123)

(assert (=> b!723015 (= lt!320515 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320517 lt!320516 mask!3328))))

(declare-fun lt!320520 () SeekEntryResult!7123)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723015 (= lt!320520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320517 mask!3328) lt!320517 lt!320516 mask!3328))))

(declare-fun a!3186 () array!40894)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!723015 (= lt!320517 (select (store (arr!19567 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723015 (= lt!320516 (array!40895 (store (arr!19567 a!3186) i!1173 k0!2102) (size!19987 a!3186)))))

(declare-fun res!484545 () Bool)

(declare-fun e!405246 () Bool)

(assert (=> start!64380 (=> (not res!484545) (not e!405246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64380 (= res!484545 (validMask!0 mask!3328))))

(assert (=> start!64380 e!405246))

(assert (=> start!64380 true))

(declare-fun array_inv!15426 (array!40894) Bool)

(assert (=> start!64380 (array_inv!15426 a!3186)))

(declare-fun b!723016 () Bool)

(declare-fun res!484549 () Bool)

(assert (=> b!723016 (=> (not res!484549) (not e!405246))))

(declare-fun arrayContainsKey!0 (array!40894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723016 (= res!484549 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!320518 () SeekEntryResult!7123)

(declare-fun b!723017 () Bool)

(declare-fun e!405242 () Bool)

(assert (=> b!723017 (= e!405242 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19567 a!3186) j!159) a!3186 mask!3328) lt!320518))))

(declare-fun b!723018 () Bool)

(declare-fun res!484541 () Bool)

(assert (=> b!723018 (=> (not res!484541) (not e!405246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723018 (= res!484541 (validKeyInArray!0 (select (arr!19567 a!3186) j!159)))))

(declare-fun b!723019 () Bool)

(declare-fun res!484552 () Bool)

(declare-fun e!405244 () Bool)

(assert (=> b!723019 (=> (not res!484552) (not e!405244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40894 (_ BitVec 32)) Bool)

(assert (=> b!723019 (= res!484552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!723020 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40894 (_ BitVec 32)) SeekEntryResult!7123)

(assert (=> b!723020 (= e!405242 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19567 a!3186) j!159) a!3186 mask!3328) (Found!7123 j!159)))))

(declare-fun b!723021 () Bool)

(declare-fun res!484548 () Bool)

(assert (=> b!723021 (=> (not res!484548) (not e!405246))))

(assert (=> b!723021 (= res!484548 (and (= (size!19987 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19987 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19987 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723022 () Bool)

(declare-fun res!484544 () Bool)

(assert (=> b!723022 (=> (not res!484544) (not e!405245))))

(assert (=> b!723022 (= res!484544 e!405242)))

(declare-fun c!79610 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723022 (= c!79610 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723023 () Bool)

(declare-fun res!484542 () Bool)

(assert (=> b!723023 (=> (not res!484542) (not e!405244))))

(assert (=> b!723023 (= res!484542 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19987 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19987 a!3186))))))

(declare-fun b!723024 () Bool)

(assert (=> b!723024 (= e!405246 e!405244)))

(declare-fun res!484543 () Bool)

(assert (=> b!723024 (=> (not res!484543) (not e!405244))))

(declare-fun lt!320519 () SeekEntryResult!7123)

(assert (=> b!723024 (= res!484543 (or (= lt!320519 (MissingZero!7123 i!1173)) (= lt!320519 (MissingVacant!7123 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40894 (_ BitVec 32)) SeekEntryResult!7123)

(assert (=> b!723024 (= lt!320519 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723025 () Bool)

(declare-fun res!484550 () Bool)

(assert (=> b!723025 (=> (not res!484550) (not e!405246))))

(assert (=> b!723025 (= res!484550 (validKeyInArray!0 k0!2102))))

(declare-fun b!723026 () Bool)

(assert (=> b!723026 (= e!405244 e!405245)))

(declare-fun res!484547 () Bool)

(assert (=> b!723026 (=> (not res!484547) (not e!405245))))

(assert (=> b!723026 (= res!484547 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19567 a!3186) j!159) mask!3328) (select (arr!19567 a!3186) j!159) a!3186 mask!3328) lt!320518))))

(assert (=> b!723026 (= lt!320518 (Intermediate!7123 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723027 () Bool)

(declare-fun res!484551 () Bool)

(assert (=> b!723027 (=> (not res!484551) (not e!405245))))

(assert (=> b!723027 (= res!484551 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19567 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723028 () Bool)

(declare-fun res!484546 () Bool)

(assert (=> b!723028 (=> (not res!484546) (not e!405244))))

(declare-datatypes ((List!13476 0))(
  ( (Nil!13473) (Cons!13472 (h!14529 (_ BitVec 64)) (t!19783 List!13476)) )
))
(declare-fun arrayNoDuplicates!0 (array!40894 (_ BitVec 32) List!13476) Bool)

(assert (=> b!723028 (= res!484546 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13473))))

(assert (= (and start!64380 res!484545) b!723021))

(assert (= (and b!723021 res!484548) b!723018))

(assert (= (and b!723018 res!484541) b!723025))

(assert (= (and b!723025 res!484550) b!723016))

(assert (= (and b!723016 res!484549) b!723024))

(assert (= (and b!723024 res!484543) b!723019))

(assert (= (and b!723019 res!484552) b!723028))

(assert (= (and b!723028 res!484546) b!723023))

(assert (= (and b!723023 res!484542) b!723026))

(assert (= (and b!723026 res!484547) b!723027))

(assert (= (and b!723027 res!484551) b!723022))

(assert (= (and b!723022 c!79610) b!723017))

(assert (= (and b!723022 (not c!79610)) b!723020))

(assert (= (and b!723022 res!484544) b!723015))

(declare-fun m!678039 () Bool)

(assert (=> b!723026 m!678039))

(assert (=> b!723026 m!678039))

(declare-fun m!678041 () Bool)

(assert (=> b!723026 m!678041))

(assert (=> b!723026 m!678041))

(assert (=> b!723026 m!678039))

(declare-fun m!678043 () Bool)

(assert (=> b!723026 m!678043))

(declare-fun m!678045 () Bool)

(assert (=> b!723027 m!678045))

(declare-fun m!678047 () Bool)

(assert (=> b!723019 m!678047))

(assert (=> b!723017 m!678039))

(assert (=> b!723017 m!678039))

(declare-fun m!678049 () Bool)

(assert (=> b!723017 m!678049))

(declare-fun m!678051 () Bool)

(assert (=> b!723024 m!678051))

(declare-fun m!678053 () Bool)

(assert (=> b!723015 m!678053))

(declare-fun m!678055 () Bool)

(assert (=> b!723015 m!678055))

(assert (=> b!723015 m!678053))

(declare-fun m!678057 () Bool)

(assert (=> b!723015 m!678057))

(declare-fun m!678059 () Bool)

(assert (=> b!723015 m!678059))

(declare-fun m!678061 () Bool)

(assert (=> b!723015 m!678061))

(declare-fun m!678063 () Bool)

(assert (=> b!723025 m!678063))

(declare-fun m!678065 () Bool)

(assert (=> b!723016 m!678065))

(assert (=> b!723020 m!678039))

(assert (=> b!723020 m!678039))

(declare-fun m!678067 () Bool)

(assert (=> b!723020 m!678067))

(declare-fun m!678069 () Bool)

(assert (=> start!64380 m!678069))

(declare-fun m!678071 () Bool)

(assert (=> start!64380 m!678071))

(declare-fun m!678073 () Bool)

(assert (=> b!723028 m!678073))

(assert (=> b!723018 m!678039))

(assert (=> b!723018 m!678039))

(declare-fun m!678075 () Bool)

(assert (=> b!723018 m!678075))

(check-sat (not b!723018) (not b!723024) (not b!723017) (not b!723028) (not b!723025) (not b!723020) (not b!723016) (not b!723026) (not start!64380) (not b!723015) (not b!723019))
(check-sat)
