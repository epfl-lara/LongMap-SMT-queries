; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51728 () Bool)

(assert start!51728)

(declare-fun b!565913 () Bool)

(declare-fun res!356888 () Bool)

(declare-fun e!325752 () Bool)

(assert (=> b!565913 (=> (not res!356888) (not e!325752))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35536 0))(
  ( (array!35537 (arr!17067 (Array (_ BitVec 32) (_ BitVec 64))) (size!17431 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35536)

(assert (=> b!565913 (= res!356888 (and (= (size!17431 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17431 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17431 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565914 () Bool)

(declare-fun res!356886 () Bool)

(assert (=> b!565914 (=> (not res!356886) (not e!325752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565914 (= res!356886 (validKeyInArray!0 (select (arr!17067 a!3118) j!142)))))

(declare-fun res!356891 () Bool)

(assert (=> start!51728 (=> (not res!356891) (not e!325752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51728 (= res!356891 (validMask!0 mask!3119))))

(assert (=> start!51728 e!325752))

(assert (=> start!51728 true))

(declare-fun array_inv!12863 (array!35536) Bool)

(assert (=> start!51728 (array_inv!12863 a!3118)))

(declare-fun b!565915 () Bool)

(declare-fun res!356882 () Bool)

(declare-fun e!325750 () Bool)

(assert (=> b!565915 (=> (not res!356882) (not e!325750))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5516 0))(
  ( (MissingZero!5516 (index!24291 (_ BitVec 32))) (Found!5516 (index!24292 (_ BitVec 32))) (Intermediate!5516 (undefined!6328 Bool) (index!24293 (_ BitVec 32)) (x!53161 (_ BitVec 32))) (Undefined!5516) (MissingVacant!5516 (index!24294 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35536 (_ BitVec 32)) SeekEntryResult!5516)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565915 (= res!356882 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17067 a!3118) j!142) mask!3119) (select (arr!17067 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17067 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17067 a!3118) i!1132 k!1914) j!142) (array!35537 (store (arr!17067 a!3118) i!1132 k!1914) (size!17431 a!3118)) mask!3119)))))

(declare-fun b!565916 () Bool)

(assert (=> b!565916 (= e!325750 (not true))))

(declare-fun e!325751 () Bool)

(assert (=> b!565916 e!325751))

(declare-fun res!356885 () Bool)

(assert (=> b!565916 (=> (not res!356885) (not e!325751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35536 (_ BitVec 32)) Bool)

(assert (=> b!565916 (= res!356885 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17734 0))(
  ( (Unit!17735) )
))
(declare-fun lt!257983 () Unit!17734)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35536 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17734)

(assert (=> b!565916 (= lt!257983 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565917 () Bool)

(assert (=> b!565917 (= e!325752 e!325750)))

(declare-fun res!356890 () Bool)

(assert (=> b!565917 (=> (not res!356890) (not e!325750))))

(declare-fun lt!257982 () SeekEntryResult!5516)

(assert (=> b!565917 (= res!356890 (or (= lt!257982 (MissingZero!5516 i!1132)) (= lt!257982 (MissingVacant!5516 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35536 (_ BitVec 32)) SeekEntryResult!5516)

(assert (=> b!565917 (= lt!257982 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!565918 () Bool)

(declare-fun res!356887 () Bool)

(assert (=> b!565918 (=> (not res!356887) (not e!325750))))

(declare-datatypes ((List!11147 0))(
  ( (Nil!11144) (Cons!11143 (h!12149 (_ BitVec 64)) (t!17375 List!11147)) )
))
(declare-fun arrayNoDuplicates!0 (array!35536 (_ BitVec 32) List!11147) Bool)

(assert (=> b!565918 (= res!356887 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11144))))

(declare-fun b!565919 () Bool)

(declare-fun res!356883 () Bool)

(assert (=> b!565919 (=> (not res!356883) (not e!325752))))

(declare-fun arrayContainsKey!0 (array!35536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565919 (= res!356883 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565920 () Bool)

(declare-fun res!356889 () Bool)

(assert (=> b!565920 (=> (not res!356889) (not e!325750))))

(assert (=> b!565920 (= res!356889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565921 () Bool)

(declare-fun res!356884 () Bool)

(assert (=> b!565921 (=> (not res!356884) (not e!325752))))

(assert (=> b!565921 (= res!356884 (validKeyInArray!0 k!1914))))

(declare-fun b!565922 () Bool)

(assert (=> b!565922 (= e!325751 (= (seekEntryOrOpen!0 (select (arr!17067 a!3118) j!142) a!3118 mask!3119) (Found!5516 j!142)))))

(assert (= (and start!51728 res!356891) b!565913))

(assert (= (and b!565913 res!356888) b!565914))

(assert (= (and b!565914 res!356886) b!565921))

(assert (= (and b!565921 res!356884) b!565919))

(assert (= (and b!565919 res!356883) b!565917))

(assert (= (and b!565917 res!356890) b!565920))

(assert (= (and b!565920 res!356889) b!565918))

(assert (= (and b!565918 res!356887) b!565915))

(assert (= (and b!565915 res!356882) b!565916))

(assert (= (and b!565916 res!356885) b!565922))

(declare-fun m!544467 () Bool)

(assert (=> b!565922 m!544467))

(assert (=> b!565922 m!544467))

(declare-fun m!544469 () Bool)

(assert (=> b!565922 m!544469))

(declare-fun m!544471 () Bool)

(assert (=> b!565916 m!544471))

(declare-fun m!544473 () Bool)

(assert (=> b!565916 m!544473))

(declare-fun m!544475 () Bool)

(assert (=> b!565918 m!544475))

(assert (=> b!565914 m!544467))

(assert (=> b!565914 m!544467))

(declare-fun m!544477 () Bool)

(assert (=> b!565914 m!544477))

(declare-fun m!544479 () Bool)

(assert (=> b!565917 m!544479))

(declare-fun m!544481 () Bool)

(assert (=> start!51728 m!544481))

(declare-fun m!544483 () Bool)

(assert (=> start!51728 m!544483))

(declare-fun m!544485 () Bool)

(assert (=> b!565921 m!544485))

(assert (=> b!565915 m!544467))

(declare-fun m!544487 () Bool)

(assert (=> b!565915 m!544487))

(assert (=> b!565915 m!544467))

(declare-fun m!544489 () Bool)

(assert (=> b!565915 m!544489))

(declare-fun m!544491 () Bool)

(assert (=> b!565915 m!544491))

(assert (=> b!565915 m!544489))

(declare-fun m!544493 () Bool)

(assert (=> b!565915 m!544493))

(assert (=> b!565915 m!544487))

(assert (=> b!565915 m!544467))

(declare-fun m!544495 () Bool)

(assert (=> b!565915 m!544495))

(declare-fun m!544497 () Bool)

(assert (=> b!565915 m!544497))

(assert (=> b!565915 m!544489))

(assert (=> b!565915 m!544491))

(declare-fun m!544499 () Bool)

(assert (=> b!565920 m!544499))

(declare-fun m!544501 () Bool)

(assert (=> b!565919 m!544501))

(push 1)

