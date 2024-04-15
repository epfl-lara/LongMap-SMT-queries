; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50396 () Bool)

(assert start!50396)

(declare-fun b!550972 () Bool)

(declare-fun res!343892 () Bool)

(declare-fun e!318009 () Bool)

(assert (=> b!550972 (=> (not res!343892) (not e!318009))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34744 0))(
  ( (array!34745 (arr!16685 (Array (_ BitVec 32) (_ BitVec 64))) (size!17050 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34744)

(assert (=> b!550972 (= res!343892 (and (= (size!17050 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17050 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17050 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550973 () Bool)

(declare-fun res!343896 () Bool)

(assert (=> b!550973 (=> (not res!343896) (not e!318009))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550973 (= res!343896 (validKeyInArray!0 k0!1914))))

(declare-fun b!550974 () Bool)

(declare-fun e!318007 () Bool)

(assert (=> b!550974 (= e!318007 (not true))))

(declare-fun e!318008 () Bool)

(assert (=> b!550974 e!318008))

(declare-fun res!343893 () Bool)

(assert (=> b!550974 (=> (not res!343893) (not e!318008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34744 (_ BitVec 32)) Bool)

(assert (=> b!550974 (= res!343893 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17022 0))(
  ( (Unit!17023) )
))
(declare-fun lt!250557 () Unit!17022)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17022)

(assert (=> b!550974 (= lt!250557 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550975 () Bool)

(assert (=> b!550975 (= e!318009 e!318007)))

(declare-fun res!343894 () Bool)

(assert (=> b!550975 (=> (not res!343894) (not e!318007))))

(declare-datatypes ((SeekEntryResult!5131 0))(
  ( (MissingZero!5131 (index!22751 (_ BitVec 32))) (Found!5131 (index!22752 (_ BitVec 32))) (Intermediate!5131 (undefined!5943 Bool) (index!22753 (_ BitVec 32)) (x!51692 (_ BitVec 32))) (Undefined!5131) (MissingVacant!5131 (index!22754 (_ BitVec 32))) )
))
(declare-fun lt!250558 () SeekEntryResult!5131)

(assert (=> b!550975 (= res!343894 (or (= lt!250558 (MissingZero!5131 i!1132)) (= lt!250558 (MissingVacant!5131 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34744 (_ BitVec 32)) SeekEntryResult!5131)

(assert (=> b!550975 (= lt!250558 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!343898 () Bool)

(assert (=> start!50396 (=> (not res!343898) (not e!318009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50396 (= res!343898 (validMask!0 mask!3119))))

(assert (=> start!50396 e!318009))

(assert (=> start!50396 true))

(declare-fun array_inv!12568 (array!34744) Bool)

(assert (=> start!50396 (array_inv!12568 a!3118)))

(declare-fun b!550976 () Bool)

(declare-fun res!343895 () Bool)

(assert (=> b!550976 (=> (not res!343895) (not e!318009))))

(declare-fun arrayContainsKey!0 (array!34744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550976 (= res!343895 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550977 () Bool)

(assert (=> b!550977 (= e!318008 (= (seekEntryOrOpen!0 (select (arr!16685 a!3118) j!142) a!3118 mask!3119) (Found!5131 j!142)))))

(declare-fun b!550978 () Bool)

(declare-fun res!343897 () Bool)

(assert (=> b!550978 (=> (not res!343897) (not e!318007))))

(declare-datatypes ((List!10804 0))(
  ( (Nil!10801) (Cons!10800 (h!11779 (_ BitVec 64)) (t!17023 List!10804)) )
))
(declare-fun arrayNoDuplicates!0 (array!34744 (_ BitVec 32) List!10804) Bool)

(assert (=> b!550978 (= res!343897 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10801))))

(declare-fun b!550979 () Bool)

(declare-fun res!343900 () Bool)

(assert (=> b!550979 (=> (not res!343900) (not e!318007))))

(assert (=> b!550979 (= res!343900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550980 () Bool)

(declare-fun res!343899 () Bool)

(assert (=> b!550980 (=> (not res!343899) (not e!318009))))

(assert (=> b!550980 (= res!343899 (validKeyInArray!0 (select (arr!16685 a!3118) j!142)))))

(declare-fun b!550981 () Bool)

(declare-fun res!343901 () Bool)

(assert (=> b!550981 (=> (not res!343901) (not e!318007))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34744 (_ BitVec 32)) SeekEntryResult!5131)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550981 (= res!343901 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16685 a!3118) j!142) mask!3119) (select (arr!16685 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16685 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16685 a!3118) i!1132 k0!1914) j!142) (array!34745 (store (arr!16685 a!3118) i!1132 k0!1914) (size!17050 a!3118)) mask!3119)))))

(assert (= (and start!50396 res!343898) b!550972))

(assert (= (and b!550972 res!343892) b!550980))

(assert (= (and b!550980 res!343899) b!550973))

(assert (= (and b!550973 res!343896) b!550976))

(assert (= (and b!550976 res!343895) b!550975))

(assert (= (and b!550975 res!343894) b!550979))

(assert (= (and b!550979 res!343900) b!550978))

(assert (= (and b!550978 res!343897) b!550981))

(assert (= (and b!550981 res!343901) b!550974))

(assert (= (and b!550974 res!343893) b!550977))

(declare-fun m!527417 () Bool)

(assert (=> b!550978 m!527417))

(declare-fun m!527419 () Bool)

(assert (=> b!550977 m!527419))

(assert (=> b!550977 m!527419))

(declare-fun m!527421 () Bool)

(assert (=> b!550977 m!527421))

(declare-fun m!527423 () Bool)

(assert (=> b!550973 m!527423))

(declare-fun m!527425 () Bool)

(assert (=> b!550974 m!527425))

(declare-fun m!527427 () Bool)

(assert (=> b!550974 m!527427))

(assert (=> b!550980 m!527419))

(assert (=> b!550980 m!527419))

(declare-fun m!527429 () Bool)

(assert (=> b!550980 m!527429))

(assert (=> b!550981 m!527419))

(declare-fun m!527431 () Bool)

(assert (=> b!550981 m!527431))

(assert (=> b!550981 m!527419))

(declare-fun m!527433 () Bool)

(assert (=> b!550981 m!527433))

(declare-fun m!527435 () Bool)

(assert (=> b!550981 m!527435))

(assert (=> b!550981 m!527433))

(declare-fun m!527437 () Bool)

(assert (=> b!550981 m!527437))

(assert (=> b!550981 m!527431))

(assert (=> b!550981 m!527419))

(declare-fun m!527439 () Bool)

(assert (=> b!550981 m!527439))

(declare-fun m!527441 () Bool)

(assert (=> b!550981 m!527441))

(assert (=> b!550981 m!527433))

(assert (=> b!550981 m!527435))

(declare-fun m!527443 () Bool)

(assert (=> b!550976 m!527443))

(declare-fun m!527445 () Bool)

(assert (=> b!550975 m!527445))

(declare-fun m!527447 () Bool)

(assert (=> b!550979 m!527447))

(declare-fun m!527449 () Bool)

(assert (=> start!50396 m!527449))

(declare-fun m!527451 () Bool)

(assert (=> start!50396 m!527451))

(check-sat (not b!550977) (not b!550973) (not b!550981) (not b!550976) (not start!50396) (not b!550974) (not b!550978) (not b!550975) (not b!550980) (not b!550979))
(check-sat)
