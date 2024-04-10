; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52294 () Bool)

(assert start!52294)

(declare-fun b!570655 () Bool)

(declare-fun e!328204 () Bool)

(declare-fun e!328202 () Bool)

(assert (=> b!570655 (= e!328204 e!328202)))

(declare-fun res!360446 () Bool)

(assert (=> b!570655 (=> (not res!360446) (not e!328202))))

(declare-datatypes ((SeekEntryResult!5616 0))(
  ( (MissingZero!5616 (index!24691 (_ BitVec 32))) (Found!5616 (index!24692 (_ BitVec 32))) (Intermediate!5616 (undefined!6428 Bool) (index!24693 (_ BitVec 32)) (x!53564 (_ BitVec 32))) (Undefined!5616) (MissingVacant!5616 (index!24694 (_ BitVec 32))) )
))
(declare-fun lt!260151 () SeekEntryResult!5616)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!570655 (= res!360446 (or (= lt!260151 (MissingZero!5616 i!1132)) (= lt!260151 (MissingVacant!5616 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35754 0))(
  ( (array!35755 (arr!17167 (Array (_ BitVec 32) (_ BitVec 64))) (size!17531 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35754)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35754 (_ BitVec 32)) SeekEntryResult!5616)

(assert (=> b!570655 (= lt!260151 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!570656 () Bool)

(declare-fun res!360443 () Bool)

(assert (=> b!570656 (=> (not res!360443) (not e!328202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35754 (_ BitVec 32)) Bool)

(assert (=> b!570656 (= res!360443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570657 () Bool)

(declare-fun e!328205 () Bool)

(assert (=> b!570657 (= e!328205 (not true))))

(declare-fun e!328201 () Bool)

(assert (=> b!570657 e!328201))

(declare-fun res!360444 () Bool)

(assert (=> b!570657 (=> (not res!360444) (not e!328201))))

(declare-fun lt!260152 () SeekEntryResult!5616)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!570657 (= res!360444 (= lt!260152 (Found!5616 j!142)))))

(assert (=> b!570657 (= lt!260152 (seekEntryOrOpen!0 (select (arr!17167 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!570657 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17934 0))(
  ( (Unit!17935) )
))
(declare-fun lt!260155 () Unit!17934)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35754 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17934)

(assert (=> b!570657 (= lt!260155 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570658 () Bool)

(assert (=> b!570658 (= e!328202 e!328205)))

(declare-fun res!360436 () Bool)

(assert (=> b!570658 (=> (not res!360436) (not e!328205))))

(declare-fun lt!260154 () SeekEntryResult!5616)

(declare-fun lt!260150 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35754 (_ BitVec 32)) SeekEntryResult!5616)

(assert (=> b!570658 (= res!360436 (= lt!260154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260150 (select (store (arr!17167 a!3118) i!1132 k0!1914) j!142) (array!35755 (store (arr!17167 a!3118) i!1132 k0!1914) (size!17531 a!3118)) mask!3119)))))

(declare-fun lt!260153 () (_ BitVec 32))

(assert (=> b!570658 (= lt!260154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260153 (select (arr!17167 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570658 (= lt!260150 (toIndex!0 (select (store (arr!17167 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570658 (= lt!260153 (toIndex!0 (select (arr!17167 a!3118) j!142) mask!3119))))

(declare-fun b!570659 () Bool)

(declare-fun res!360437 () Bool)

(assert (=> b!570659 (=> (not res!360437) (not e!328204))))

(assert (=> b!570659 (= res!360437 (and (= (size!17531 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17531 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17531 a!3118)) (not (= i!1132 j!142))))))

(declare-fun e!328203 () Bool)

(declare-fun b!570661 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35754 (_ BitVec 32)) SeekEntryResult!5616)

(assert (=> b!570661 (= e!328203 (= lt!260152 (seekKeyOrZeroReturnVacant!0 (x!53564 lt!260154) (index!24693 lt!260154) (index!24693 lt!260154) (select (arr!17167 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570662 () Bool)

(declare-fun res!360441 () Bool)

(assert (=> b!570662 (=> (not res!360441) (not e!328204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570662 (= res!360441 (validKeyInArray!0 k0!1914))))

(declare-fun b!570663 () Bool)

(assert (=> b!570663 (= e!328201 e!328203)))

(declare-fun res!360445 () Bool)

(assert (=> b!570663 (=> res!360445 e!328203)))

(get-info :version)

(assert (=> b!570663 (= res!360445 (or (undefined!6428 lt!260154) (not ((_ is Intermediate!5616) lt!260154)) (= (select (arr!17167 a!3118) (index!24693 lt!260154)) (select (arr!17167 a!3118) j!142)) (= (select (arr!17167 a!3118) (index!24693 lt!260154)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!360438 () Bool)

(assert (=> start!52294 (=> (not res!360438) (not e!328204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52294 (= res!360438 (validMask!0 mask!3119))))

(assert (=> start!52294 e!328204))

(assert (=> start!52294 true))

(declare-fun array_inv!12963 (array!35754) Bool)

(assert (=> start!52294 (array_inv!12963 a!3118)))

(declare-fun b!570660 () Bool)

(declare-fun res!360442 () Bool)

(assert (=> b!570660 (=> (not res!360442) (not e!328202))))

(declare-datatypes ((List!11247 0))(
  ( (Nil!11244) (Cons!11243 (h!12267 (_ BitVec 64)) (t!17475 List!11247)) )
))
(declare-fun arrayNoDuplicates!0 (array!35754 (_ BitVec 32) List!11247) Bool)

(assert (=> b!570660 (= res!360442 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11244))))

(declare-fun b!570664 () Bool)

(declare-fun res!360440 () Bool)

(assert (=> b!570664 (=> (not res!360440) (not e!328204))))

(assert (=> b!570664 (= res!360440 (validKeyInArray!0 (select (arr!17167 a!3118) j!142)))))

(declare-fun b!570665 () Bool)

(declare-fun res!360439 () Bool)

(assert (=> b!570665 (=> (not res!360439) (not e!328204))))

(declare-fun arrayContainsKey!0 (array!35754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570665 (= res!360439 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!52294 res!360438) b!570659))

(assert (= (and b!570659 res!360437) b!570664))

(assert (= (and b!570664 res!360440) b!570662))

(assert (= (and b!570662 res!360441) b!570665))

(assert (= (and b!570665 res!360439) b!570655))

(assert (= (and b!570655 res!360446) b!570656))

(assert (= (and b!570656 res!360443) b!570660))

(assert (= (and b!570660 res!360442) b!570658))

(assert (= (and b!570658 res!360436) b!570657))

(assert (= (and b!570657 res!360444) b!570663))

(assert (= (and b!570663 (not res!360445)) b!570661))

(declare-fun m!549529 () Bool)

(assert (=> b!570662 m!549529))

(declare-fun m!549531 () Bool)

(assert (=> b!570665 m!549531))

(declare-fun m!549533 () Bool)

(assert (=> start!52294 m!549533))

(declare-fun m!549535 () Bool)

(assert (=> start!52294 m!549535))

(declare-fun m!549537 () Bool)

(assert (=> b!570664 m!549537))

(assert (=> b!570664 m!549537))

(declare-fun m!549539 () Bool)

(assert (=> b!570664 m!549539))

(declare-fun m!549541 () Bool)

(assert (=> b!570656 m!549541))

(assert (=> b!570661 m!549537))

(assert (=> b!570661 m!549537))

(declare-fun m!549543 () Bool)

(assert (=> b!570661 m!549543))

(declare-fun m!549545 () Bool)

(assert (=> b!570663 m!549545))

(assert (=> b!570663 m!549537))

(assert (=> b!570658 m!549537))

(declare-fun m!549547 () Bool)

(assert (=> b!570658 m!549547))

(assert (=> b!570658 m!549537))

(declare-fun m!549549 () Bool)

(assert (=> b!570658 m!549549))

(assert (=> b!570658 m!549537))

(declare-fun m!549551 () Bool)

(assert (=> b!570658 m!549551))

(assert (=> b!570658 m!549549))

(declare-fun m!549553 () Bool)

(assert (=> b!570658 m!549553))

(assert (=> b!570658 m!549549))

(declare-fun m!549555 () Bool)

(assert (=> b!570658 m!549555))

(declare-fun m!549557 () Bool)

(assert (=> b!570658 m!549557))

(assert (=> b!570657 m!549537))

(assert (=> b!570657 m!549537))

(declare-fun m!549559 () Bool)

(assert (=> b!570657 m!549559))

(declare-fun m!549561 () Bool)

(assert (=> b!570657 m!549561))

(declare-fun m!549563 () Bool)

(assert (=> b!570657 m!549563))

(declare-fun m!549565 () Bool)

(assert (=> b!570660 m!549565))

(declare-fun m!549567 () Bool)

(assert (=> b!570655 m!549567))

(check-sat (not b!570661) (not start!52294) (not b!570657) (not b!570664) (not b!570656) (not b!570665) (not b!570658) (not b!570655) (not b!570662) (not b!570660))
(check-sat)
