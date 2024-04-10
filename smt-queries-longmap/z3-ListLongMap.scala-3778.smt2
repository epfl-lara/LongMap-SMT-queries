; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51724 () Bool)

(assert start!51724)

(declare-fun res!356825 () Bool)

(declare-fun e!325728 () Bool)

(assert (=> start!51724 (=> (not res!356825) (not e!325728))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51724 (= res!356825 (validMask!0 mask!3119))))

(assert (=> start!51724 e!325728))

(assert (=> start!51724 true))

(declare-datatypes ((array!35532 0))(
  ( (array!35533 (arr!17065 (Array (_ BitVec 32) (_ BitVec 64))) (size!17429 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35532)

(declare-fun array_inv!12861 (array!35532) Bool)

(assert (=> start!51724 (array_inv!12861 a!3118)))

(declare-fun b!565853 () Bool)

(declare-fun e!325725 () Bool)

(assert (=> b!565853 (= e!325728 e!325725)))

(declare-fun res!356830 () Bool)

(assert (=> b!565853 (=> (not res!356830) (not e!325725))))

(declare-datatypes ((SeekEntryResult!5514 0))(
  ( (MissingZero!5514 (index!24283 (_ BitVec 32))) (Found!5514 (index!24284 (_ BitVec 32))) (Intermediate!5514 (undefined!6326 Bool) (index!24285 (_ BitVec 32)) (x!53151 (_ BitVec 32))) (Undefined!5514) (MissingVacant!5514 (index!24286 (_ BitVec 32))) )
))
(declare-fun lt!257971 () SeekEntryResult!5514)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565853 (= res!356830 (or (= lt!257971 (MissingZero!5514 i!1132)) (= lt!257971 (MissingVacant!5514 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35532 (_ BitVec 32)) SeekEntryResult!5514)

(assert (=> b!565853 (= lt!257971 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565854 () Bool)

(declare-fun res!356829 () Bool)

(assert (=> b!565854 (=> (not res!356829) (not e!325728))))

(declare-fun arrayContainsKey!0 (array!35532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565854 (= res!356829 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565855 () Bool)

(declare-fun res!356827 () Bool)

(assert (=> b!565855 (=> (not res!356827) (not e!325725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35532 (_ BitVec 32)) Bool)

(assert (=> b!565855 (= res!356827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565856 () Bool)

(assert (=> b!565856 (= e!325725 (not true))))

(declare-fun e!325727 () Bool)

(assert (=> b!565856 e!325727))

(declare-fun res!356822 () Bool)

(assert (=> b!565856 (=> (not res!356822) (not e!325727))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!565856 (= res!356822 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17730 0))(
  ( (Unit!17731) )
))
(declare-fun lt!257970 () Unit!17730)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35532 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17730)

(assert (=> b!565856 (= lt!257970 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565857 () Bool)

(declare-fun res!356826 () Bool)

(assert (=> b!565857 (=> (not res!356826) (not e!325725))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35532 (_ BitVec 32)) SeekEntryResult!5514)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565857 (= res!356826 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17065 a!3118) j!142) mask!3119) (select (arr!17065 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17065 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17065 a!3118) i!1132 k0!1914) j!142) (array!35533 (store (arr!17065 a!3118) i!1132 k0!1914) (size!17429 a!3118)) mask!3119)))))

(declare-fun b!565858 () Bool)

(declare-fun res!356824 () Bool)

(assert (=> b!565858 (=> (not res!356824) (not e!325728))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565858 (= res!356824 (validKeyInArray!0 (select (arr!17065 a!3118) j!142)))))

(declare-fun b!565859 () Bool)

(declare-fun res!356831 () Bool)

(assert (=> b!565859 (=> (not res!356831) (not e!325725))))

(declare-datatypes ((List!11145 0))(
  ( (Nil!11142) (Cons!11141 (h!12147 (_ BitVec 64)) (t!17373 List!11145)) )
))
(declare-fun arrayNoDuplicates!0 (array!35532 (_ BitVec 32) List!11145) Bool)

(assert (=> b!565859 (= res!356831 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11142))))

(declare-fun b!565860 () Bool)

(declare-fun res!356828 () Bool)

(assert (=> b!565860 (=> (not res!356828) (not e!325728))))

(assert (=> b!565860 (= res!356828 (validKeyInArray!0 k0!1914))))

(declare-fun b!565861 () Bool)

(declare-fun res!356823 () Bool)

(assert (=> b!565861 (=> (not res!356823) (not e!325728))))

(assert (=> b!565861 (= res!356823 (and (= (size!17429 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17429 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17429 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565862 () Bool)

(assert (=> b!565862 (= e!325727 (= (seekEntryOrOpen!0 (select (arr!17065 a!3118) j!142) a!3118 mask!3119) (Found!5514 j!142)))))

(assert (= (and start!51724 res!356825) b!565861))

(assert (= (and b!565861 res!356823) b!565858))

(assert (= (and b!565858 res!356824) b!565860))

(assert (= (and b!565860 res!356828) b!565854))

(assert (= (and b!565854 res!356829) b!565853))

(assert (= (and b!565853 res!356830) b!565855))

(assert (= (and b!565855 res!356827) b!565859))

(assert (= (and b!565859 res!356831) b!565857))

(assert (= (and b!565857 res!356826) b!565856))

(assert (= (and b!565856 res!356822) b!565862))

(declare-fun m!544395 () Bool)

(assert (=> b!565853 m!544395))

(declare-fun m!544397 () Bool)

(assert (=> start!51724 m!544397))

(declare-fun m!544399 () Bool)

(assert (=> start!51724 m!544399))

(declare-fun m!544401 () Bool)

(assert (=> b!565856 m!544401))

(declare-fun m!544403 () Bool)

(assert (=> b!565856 m!544403))

(declare-fun m!544405 () Bool)

(assert (=> b!565860 m!544405))

(declare-fun m!544407 () Bool)

(assert (=> b!565862 m!544407))

(assert (=> b!565862 m!544407))

(declare-fun m!544409 () Bool)

(assert (=> b!565862 m!544409))

(declare-fun m!544411 () Bool)

(assert (=> b!565859 m!544411))

(assert (=> b!565857 m!544407))

(declare-fun m!544413 () Bool)

(assert (=> b!565857 m!544413))

(assert (=> b!565857 m!544407))

(declare-fun m!544415 () Bool)

(assert (=> b!565857 m!544415))

(declare-fun m!544417 () Bool)

(assert (=> b!565857 m!544417))

(assert (=> b!565857 m!544415))

(declare-fun m!544419 () Bool)

(assert (=> b!565857 m!544419))

(assert (=> b!565857 m!544413))

(assert (=> b!565857 m!544407))

(declare-fun m!544421 () Bool)

(assert (=> b!565857 m!544421))

(declare-fun m!544423 () Bool)

(assert (=> b!565857 m!544423))

(assert (=> b!565857 m!544415))

(assert (=> b!565857 m!544417))

(assert (=> b!565858 m!544407))

(assert (=> b!565858 m!544407))

(declare-fun m!544425 () Bool)

(assert (=> b!565858 m!544425))

(declare-fun m!544427 () Bool)

(assert (=> b!565855 m!544427))

(declare-fun m!544429 () Bool)

(assert (=> b!565854 m!544429))

(check-sat (not b!565857) (not b!565854) (not b!565855) (not b!565856) (not b!565853) (not b!565862) (not b!565859) (not start!51724) (not b!565858) (not b!565860))
(check-sat)
