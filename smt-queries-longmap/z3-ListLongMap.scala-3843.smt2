; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52914 () Bool)

(assert start!52914)

(declare-fun res!364609 () Bool)

(declare-fun e!331701 () Bool)

(assert (=> start!52914 (=> (not res!364609) (not e!331701))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52914 (= res!364609 (validMask!0 mask!3119))))

(assert (=> start!52914 e!331701))

(assert (=> start!52914 true))

(declare-datatypes ((array!35949 0))(
  ( (array!35950 (arr!17254 (Array (_ BitVec 32) (_ BitVec 64))) (size!17618 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35949)

(declare-fun array_inv!13113 (array!35949) Bool)

(assert (=> start!52914 (array_inv!13113 a!3118)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!331704 () Bool)

(declare-fun b!576472 () Bool)

(declare-datatypes ((SeekEntryResult!5659 0))(
  ( (MissingZero!5659 (index!24863 (_ BitVec 32))) (Found!5659 (index!24864 (_ BitVec 32))) (Intermediate!5659 (undefined!6471 Bool) (index!24865 (_ BitVec 32)) (x!53909 (_ BitVec 32))) (Undefined!5659) (MissingVacant!5659 (index!24866 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35949 (_ BitVec 32)) SeekEntryResult!5659)

(assert (=> b!576472 (= e!331704 (= (seekEntryOrOpen!0 (select (arr!17254 a!3118) j!142) a!3118 mask!3119) (Found!5659 j!142)))))

(declare-fun b!576473 () Bool)

(declare-fun e!331703 () Bool)

(assert (=> b!576473 (= e!331703 (not true))))

(assert (=> b!576473 e!331704))

(declare-fun res!364601 () Bool)

(assert (=> b!576473 (=> (not res!364601) (not e!331704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35949 (_ BitVec 32)) Bool)

(assert (=> b!576473 (= res!364601 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18091 0))(
  ( (Unit!18092) )
))
(declare-fun lt!263740 () Unit!18091)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35949 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18091)

(assert (=> b!576473 (= lt!263740 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576474 () Bool)

(declare-fun res!364607 () Bool)

(assert (=> b!576474 (=> (not res!364607) (not e!331701))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576474 (= res!364607 (validKeyInArray!0 k0!1914))))

(declare-fun b!576475 () Bool)

(declare-fun res!364603 () Bool)

(assert (=> b!576475 (=> (not res!364603) (not e!331701))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!576475 (= res!364603 (and (= (size!17618 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17618 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17618 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576476 () Bool)

(declare-fun res!364604 () Bool)

(assert (=> b!576476 (=> (not res!364604) (not e!331701))))

(declare-fun arrayContainsKey!0 (array!35949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576476 (= res!364604 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576477 () Bool)

(assert (=> b!576477 (= e!331701 e!331703)))

(declare-fun res!364600 () Bool)

(assert (=> b!576477 (=> (not res!364600) (not e!331703))))

(declare-fun lt!263739 () SeekEntryResult!5659)

(assert (=> b!576477 (= res!364600 (or (= lt!263739 (MissingZero!5659 i!1132)) (= lt!263739 (MissingVacant!5659 i!1132))))))

(assert (=> b!576477 (= lt!263739 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!576478 () Bool)

(declare-fun res!364606 () Bool)

(assert (=> b!576478 (=> (not res!364606) (not e!331703))))

(assert (=> b!576478 (= res!364606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576479 () Bool)

(declare-fun res!364605 () Bool)

(assert (=> b!576479 (=> (not res!364605) (not e!331701))))

(assert (=> b!576479 (= res!364605 (validKeyInArray!0 (select (arr!17254 a!3118) j!142)))))

(declare-fun b!576480 () Bool)

(declare-fun res!364602 () Bool)

(assert (=> b!576480 (=> (not res!364602) (not e!331703))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35949 (_ BitVec 32)) SeekEntryResult!5659)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576480 (= res!364602 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17254 a!3118) j!142) mask!3119) (select (arr!17254 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17254 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17254 a!3118) i!1132 k0!1914) j!142) (array!35950 (store (arr!17254 a!3118) i!1132 k0!1914) (size!17618 a!3118)) mask!3119)))))

(declare-fun b!576481 () Bool)

(declare-fun res!364608 () Bool)

(assert (=> b!576481 (=> (not res!364608) (not e!331703))))

(declare-datatypes ((List!11241 0))(
  ( (Nil!11238) (Cons!11237 (h!12282 (_ BitVec 64)) (t!17461 List!11241)) )
))
(declare-fun arrayNoDuplicates!0 (array!35949 (_ BitVec 32) List!11241) Bool)

(assert (=> b!576481 (= res!364608 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11238))))

(assert (= (and start!52914 res!364609) b!576475))

(assert (= (and b!576475 res!364603) b!576479))

(assert (= (and b!576479 res!364605) b!576474))

(assert (= (and b!576474 res!364607) b!576476))

(assert (= (and b!576476 res!364604) b!576477))

(assert (= (and b!576477 res!364600) b!576478))

(assert (= (and b!576478 res!364606) b!576481))

(assert (= (and b!576481 res!364608) b!576480))

(assert (= (and b!576480 res!364602) b!576473))

(assert (= (and b!576473 res!364601) b!576472))

(declare-fun m!555539 () Bool)

(assert (=> b!576478 m!555539))

(declare-fun m!555541 () Bool)

(assert (=> b!576477 m!555541))

(declare-fun m!555543 () Bool)

(assert (=> b!576474 m!555543))

(declare-fun m!555545 () Bool)

(assert (=> b!576473 m!555545))

(declare-fun m!555547 () Bool)

(assert (=> b!576473 m!555547))

(declare-fun m!555549 () Bool)

(assert (=> b!576481 m!555549))

(declare-fun m!555551 () Bool)

(assert (=> b!576472 m!555551))

(assert (=> b!576472 m!555551))

(declare-fun m!555553 () Bool)

(assert (=> b!576472 m!555553))

(assert (=> b!576480 m!555551))

(declare-fun m!555555 () Bool)

(assert (=> b!576480 m!555555))

(assert (=> b!576480 m!555551))

(declare-fun m!555557 () Bool)

(assert (=> b!576480 m!555557))

(declare-fun m!555559 () Bool)

(assert (=> b!576480 m!555559))

(assert (=> b!576480 m!555557))

(declare-fun m!555561 () Bool)

(assert (=> b!576480 m!555561))

(assert (=> b!576480 m!555555))

(assert (=> b!576480 m!555551))

(declare-fun m!555563 () Bool)

(assert (=> b!576480 m!555563))

(declare-fun m!555565 () Bool)

(assert (=> b!576480 m!555565))

(assert (=> b!576480 m!555557))

(assert (=> b!576480 m!555559))

(declare-fun m!555567 () Bool)

(assert (=> start!52914 m!555567))

(declare-fun m!555569 () Bool)

(assert (=> start!52914 m!555569))

(assert (=> b!576479 m!555551))

(assert (=> b!576479 m!555551))

(declare-fun m!555571 () Bool)

(assert (=> b!576479 m!555571))

(declare-fun m!555573 () Bool)

(assert (=> b!576476 m!555573))

(check-sat (not b!576472) (not b!576481) (not b!576480) (not b!576478) (not b!576479) (not b!576474) (not start!52914) (not b!576473) (not b!576477) (not b!576476))
(check-sat)
