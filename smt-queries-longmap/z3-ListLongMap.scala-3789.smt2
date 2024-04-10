; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51910 () Bool)

(assert start!51910)

(declare-fun b!567443 () Bool)

(declare-fun res!358037 () Bool)

(declare-fun e!326521 () Bool)

(assert (=> b!567443 (=> (not res!358037) (not e!326521))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35604 0))(
  ( (array!35605 (arr!17098 (Array (_ BitVec 32) (_ BitVec 64))) (size!17462 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35604)

(assert (=> b!567443 (= res!358037 (and (= (size!17462 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17462 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17462 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567444 () Bool)

(declare-fun res!358029 () Bool)

(assert (=> b!567444 (=> (not res!358029) (not e!326521))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567444 (= res!358029 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567445 () Bool)

(declare-fun e!326520 () Bool)

(assert (=> b!567445 (= e!326520 (not true))))

(declare-fun e!326522 () Bool)

(assert (=> b!567445 e!326522))

(declare-fun res!358031 () Bool)

(assert (=> b!567445 (=> (not res!358031) (not e!326522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35604 (_ BitVec 32)) Bool)

(assert (=> b!567445 (= res!358031 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17796 0))(
  ( (Unit!17797) )
))
(declare-fun lt!258517 () Unit!17796)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17796)

(assert (=> b!567445 (= lt!258517 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567446 () Bool)

(assert (=> b!567446 (= e!326521 e!326520)))

(declare-fun res!358028 () Bool)

(assert (=> b!567446 (=> (not res!358028) (not e!326520))))

(declare-datatypes ((SeekEntryResult!5547 0))(
  ( (MissingZero!5547 (index!24415 (_ BitVec 32))) (Found!5547 (index!24416 (_ BitVec 32))) (Intermediate!5547 (undefined!6359 Bool) (index!24417 (_ BitVec 32)) (x!53284 (_ BitVec 32))) (Undefined!5547) (MissingVacant!5547 (index!24418 (_ BitVec 32))) )
))
(declare-fun lt!258516 () SeekEntryResult!5547)

(assert (=> b!567446 (= res!358028 (or (= lt!258516 (MissingZero!5547 i!1132)) (= lt!258516 (MissingVacant!5547 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35604 (_ BitVec 32)) SeekEntryResult!5547)

(assert (=> b!567446 (= lt!258516 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!567447 () Bool)

(declare-fun res!358032 () Bool)

(assert (=> b!567447 (=> (not res!358032) (not e!326520))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35604 (_ BitVec 32)) SeekEntryResult!5547)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567447 (= res!358032 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17098 a!3118) j!142) mask!3119) (select (arr!17098 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17098 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17098 a!3118) i!1132 k0!1914) j!142) (array!35605 (store (arr!17098 a!3118) i!1132 k0!1914) (size!17462 a!3118)) mask!3119)))))

(declare-fun b!567448 () Bool)

(declare-fun res!358030 () Bool)

(assert (=> b!567448 (=> (not res!358030) (not e!326521))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567448 (= res!358030 (validKeyInArray!0 k0!1914))))

(declare-fun res!358035 () Bool)

(assert (=> start!51910 (=> (not res!358035) (not e!326521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51910 (= res!358035 (validMask!0 mask!3119))))

(assert (=> start!51910 e!326521))

(assert (=> start!51910 true))

(declare-fun array_inv!12894 (array!35604) Bool)

(assert (=> start!51910 (array_inv!12894 a!3118)))

(declare-fun b!567449 () Bool)

(assert (=> b!567449 (= e!326522 (= (seekEntryOrOpen!0 (select (arr!17098 a!3118) j!142) a!3118 mask!3119) (Found!5547 j!142)))))

(declare-fun b!567450 () Bool)

(declare-fun res!358036 () Bool)

(assert (=> b!567450 (=> (not res!358036) (not e!326520))))

(declare-datatypes ((List!11178 0))(
  ( (Nil!11175) (Cons!11174 (h!12186 (_ BitVec 64)) (t!17406 List!11178)) )
))
(declare-fun arrayNoDuplicates!0 (array!35604 (_ BitVec 32) List!11178) Bool)

(assert (=> b!567450 (= res!358036 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11175))))

(declare-fun b!567451 () Bool)

(declare-fun res!358033 () Bool)

(assert (=> b!567451 (=> (not res!358033) (not e!326520))))

(assert (=> b!567451 (= res!358033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567452 () Bool)

(declare-fun res!358034 () Bool)

(assert (=> b!567452 (=> (not res!358034) (not e!326521))))

(assert (=> b!567452 (= res!358034 (validKeyInArray!0 (select (arr!17098 a!3118) j!142)))))

(assert (= (and start!51910 res!358035) b!567443))

(assert (= (and b!567443 res!358037) b!567452))

(assert (= (and b!567452 res!358034) b!567448))

(assert (= (and b!567448 res!358030) b!567444))

(assert (= (and b!567444 res!358029) b!567446))

(assert (= (and b!567446 res!358028) b!567451))

(assert (= (and b!567451 res!358033) b!567450))

(assert (= (and b!567450 res!358036) b!567447))

(assert (= (and b!567447 res!358032) b!567445))

(assert (= (and b!567445 res!358031) b!567449))

(declare-fun m!546033 () Bool)

(assert (=> b!567448 m!546033))

(declare-fun m!546035 () Bool)

(assert (=> b!567451 m!546035))

(declare-fun m!546037 () Bool)

(assert (=> b!567452 m!546037))

(assert (=> b!567452 m!546037))

(declare-fun m!546039 () Bool)

(assert (=> b!567452 m!546039))

(assert (=> b!567447 m!546037))

(declare-fun m!546041 () Bool)

(assert (=> b!567447 m!546041))

(assert (=> b!567447 m!546037))

(declare-fun m!546043 () Bool)

(assert (=> b!567447 m!546043))

(declare-fun m!546045 () Bool)

(assert (=> b!567447 m!546045))

(assert (=> b!567447 m!546043))

(declare-fun m!546047 () Bool)

(assert (=> b!567447 m!546047))

(assert (=> b!567447 m!546041))

(assert (=> b!567447 m!546037))

(declare-fun m!546049 () Bool)

(assert (=> b!567447 m!546049))

(declare-fun m!546051 () Bool)

(assert (=> b!567447 m!546051))

(assert (=> b!567447 m!546043))

(assert (=> b!567447 m!546045))

(declare-fun m!546053 () Bool)

(assert (=> b!567444 m!546053))

(declare-fun m!546055 () Bool)

(assert (=> b!567450 m!546055))

(declare-fun m!546057 () Bool)

(assert (=> b!567446 m!546057))

(declare-fun m!546059 () Bool)

(assert (=> b!567445 m!546059))

(declare-fun m!546061 () Bool)

(assert (=> b!567445 m!546061))

(assert (=> b!567449 m!546037))

(assert (=> b!567449 m!546037))

(declare-fun m!546063 () Bool)

(assert (=> b!567449 m!546063))

(declare-fun m!546065 () Bool)

(assert (=> start!51910 m!546065))

(declare-fun m!546067 () Bool)

(assert (=> start!51910 m!546067))

(check-sat (not b!567452) (not b!567446) (not b!567448) (not b!567451) (not b!567450) (not b!567445) (not start!51910) (not b!567447) (not b!567449) (not b!567444))
(check-sat)
