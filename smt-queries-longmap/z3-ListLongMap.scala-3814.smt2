; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52292 () Bool)

(assert start!52292)

(declare-datatypes ((SeekEntryResult!5617 0))(
  ( (MissingZero!5617 (index!24695 (_ BitVec 32))) (Found!5617 (index!24696 (_ BitVec 32))) (Intermediate!5617 (undefined!6429 Bool) (index!24697 (_ BitVec 32)) (x!53576 (_ BitVec 32))) (Undefined!5617) (MissingVacant!5617 (index!24698 (_ BitVec 32))) )
))
(declare-fun lt!260009 () SeekEntryResult!5617)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!570549 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!260011 () SeekEntryResult!5617)

(declare-fun e!328120 () Bool)

(declare-datatypes ((array!35761 0))(
  ( (array!35762 (arr!17171 (Array (_ BitVec 32) (_ BitVec 64))) (size!17536 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35761)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35761 (_ BitVec 32)) SeekEntryResult!5617)

(assert (=> b!570549 (= e!328120 (= lt!260009 (seekKeyOrZeroReturnVacant!0 (x!53576 lt!260011) (index!24697 lt!260011) (index!24697 lt!260011) (select (arr!17171 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570550 () Bool)

(declare-fun res!360478 () Bool)

(declare-fun e!328121 () Bool)

(assert (=> b!570550 (=> (not res!360478) (not e!328121))))

(declare-datatypes ((List!11290 0))(
  ( (Nil!11287) (Cons!11286 (h!12310 (_ BitVec 64)) (t!17509 List!11290)) )
))
(declare-fun arrayNoDuplicates!0 (array!35761 (_ BitVec 32) List!11290) Bool)

(assert (=> b!570550 (= res!360478 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11287))))

(declare-fun b!570551 () Bool)

(declare-fun res!360480 () Bool)

(declare-fun e!328118 () Bool)

(assert (=> b!570551 (=> (not res!360480) (not e!328118))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570551 (= res!360480 (validKeyInArray!0 k0!1914))))

(declare-fun b!570552 () Bool)

(declare-fun e!328119 () Bool)

(assert (=> b!570552 (= e!328119 e!328120)))

(declare-fun res!360476 () Bool)

(assert (=> b!570552 (=> res!360476 e!328120)))

(get-info :version)

(assert (=> b!570552 (= res!360476 (or (undefined!6429 lt!260011) (not ((_ is Intermediate!5617) lt!260011)) (= (select (arr!17171 a!3118) (index!24697 lt!260011)) (select (arr!17171 a!3118) j!142)) (= (select (arr!17171 a!3118) (index!24697 lt!260011)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570554 () Bool)

(declare-fun res!360477 () Bool)

(assert (=> b!570554 (=> (not res!360477) (not e!328121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35761 (_ BitVec 32)) Bool)

(assert (=> b!570554 (= res!360477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570555 () Bool)

(declare-fun e!328117 () Bool)

(assert (=> b!570555 (= e!328117 (not true))))

(assert (=> b!570555 e!328119))

(declare-fun res!360482 () Bool)

(assert (=> b!570555 (=> (not res!360482) (not e!328119))))

(assert (=> b!570555 (= res!360482 (= lt!260009 (Found!5617 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35761 (_ BitVec 32)) SeekEntryResult!5617)

(assert (=> b!570555 (= lt!260009 (seekEntryOrOpen!0 (select (arr!17171 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!570555 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17922 0))(
  ( (Unit!17923) )
))
(declare-fun lt!260006 () Unit!17922)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17922)

(assert (=> b!570555 (= lt!260006 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570556 () Bool)

(assert (=> b!570556 (= e!328121 e!328117)))

(declare-fun res!360481 () Bool)

(assert (=> b!570556 (=> (not res!360481) (not e!328117))))

(declare-fun lt!260010 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35761 (_ BitVec 32)) SeekEntryResult!5617)

(assert (=> b!570556 (= res!360481 (= lt!260011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260010 (select (store (arr!17171 a!3118) i!1132 k0!1914) j!142) (array!35762 (store (arr!17171 a!3118) i!1132 k0!1914) (size!17536 a!3118)) mask!3119)))))

(declare-fun lt!260007 () (_ BitVec 32))

(assert (=> b!570556 (= lt!260011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260007 (select (arr!17171 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570556 (= lt!260010 (toIndex!0 (select (store (arr!17171 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570556 (= lt!260007 (toIndex!0 (select (arr!17171 a!3118) j!142) mask!3119))))

(declare-fun b!570553 () Bool)

(assert (=> b!570553 (= e!328118 e!328121)))

(declare-fun res!360479 () Bool)

(assert (=> b!570553 (=> (not res!360479) (not e!328121))))

(declare-fun lt!260008 () SeekEntryResult!5617)

(assert (=> b!570553 (= res!360479 (or (= lt!260008 (MissingZero!5617 i!1132)) (= lt!260008 (MissingVacant!5617 i!1132))))))

(assert (=> b!570553 (= lt!260008 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!360475 () Bool)

(assert (=> start!52292 (=> (not res!360475) (not e!328118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52292 (= res!360475 (validMask!0 mask!3119))))

(assert (=> start!52292 e!328118))

(assert (=> start!52292 true))

(declare-fun array_inv!13054 (array!35761) Bool)

(assert (=> start!52292 (array_inv!13054 a!3118)))

(declare-fun b!570557 () Bool)

(declare-fun res!360474 () Bool)

(assert (=> b!570557 (=> (not res!360474) (not e!328118))))

(declare-fun arrayContainsKey!0 (array!35761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570557 (= res!360474 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570558 () Bool)

(declare-fun res!360472 () Bool)

(assert (=> b!570558 (=> (not res!360472) (not e!328118))))

(assert (=> b!570558 (= res!360472 (and (= (size!17536 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17536 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17536 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570559 () Bool)

(declare-fun res!360473 () Bool)

(assert (=> b!570559 (=> (not res!360473) (not e!328118))))

(assert (=> b!570559 (= res!360473 (validKeyInArray!0 (select (arr!17171 a!3118) j!142)))))

(assert (= (and start!52292 res!360475) b!570558))

(assert (= (and b!570558 res!360472) b!570559))

(assert (= (and b!570559 res!360473) b!570551))

(assert (= (and b!570551 res!360480) b!570557))

(assert (= (and b!570557 res!360474) b!570553))

(assert (= (and b!570553 res!360479) b!570554))

(assert (= (and b!570554 res!360477) b!570550))

(assert (= (and b!570550 res!360478) b!570556))

(assert (= (and b!570556 res!360481) b!570555))

(assert (= (and b!570555 res!360482) b!570552))

(assert (= (and b!570552 (not res!360476)) b!570549))

(declare-fun m!548957 () Bool)

(assert (=> b!570559 m!548957))

(assert (=> b!570559 m!548957))

(declare-fun m!548959 () Bool)

(assert (=> b!570559 m!548959))

(declare-fun m!548961 () Bool)

(assert (=> b!570557 m!548961))

(declare-fun m!548963 () Bool)

(assert (=> b!570553 m!548963))

(declare-fun m!548965 () Bool)

(assert (=> b!570554 m!548965))

(declare-fun m!548967 () Bool)

(assert (=> b!570550 m!548967))

(assert (=> b!570555 m!548957))

(assert (=> b!570555 m!548957))

(declare-fun m!548969 () Bool)

(assert (=> b!570555 m!548969))

(declare-fun m!548971 () Bool)

(assert (=> b!570555 m!548971))

(declare-fun m!548973 () Bool)

(assert (=> b!570555 m!548973))

(assert (=> b!570549 m!548957))

(assert (=> b!570549 m!548957))

(declare-fun m!548975 () Bool)

(assert (=> b!570549 m!548975))

(declare-fun m!548977 () Bool)

(assert (=> b!570552 m!548977))

(assert (=> b!570552 m!548957))

(assert (=> b!570556 m!548957))

(declare-fun m!548979 () Bool)

(assert (=> b!570556 m!548979))

(assert (=> b!570556 m!548957))

(declare-fun m!548981 () Bool)

(assert (=> b!570556 m!548981))

(declare-fun m!548983 () Bool)

(assert (=> b!570556 m!548983))

(declare-fun m!548985 () Bool)

(assert (=> b!570556 m!548985))

(assert (=> b!570556 m!548981))

(declare-fun m!548987 () Bool)

(assert (=> b!570556 m!548987))

(assert (=> b!570556 m!548957))

(declare-fun m!548989 () Bool)

(assert (=> b!570556 m!548989))

(assert (=> b!570556 m!548981))

(declare-fun m!548991 () Bool)

(assert (=> b!570551 m!548991))

(declare-fun m!548993 () Bool)

(assert (=> start!52292 m!548993))

(declare-fun m!548995 () Bool)

(assert (=> start!52292 m!548995))

(check-sat (not b!570555) (not b!570554) (not b!570556) (not b!570551) (not start!52292) (not b!570559) (not b!570557) (not b!570550) (not b!570553) (not b!570549))
(check-sat)
