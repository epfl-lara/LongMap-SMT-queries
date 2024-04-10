; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51616 () Bool)

(assert start!51616)

(declare-fun b!564869 () Bool)

(declare-fun res!356022 () Bool)

(declare-fun e!325274 () Bool)

(assert (=> b!564869 (=> (not res!356022) (not e!325274))))

(declare-datatypes ((array!35481 0))(
  ( (array!35482 (arr!17041 (Array (_ BitVec 32) (_ BitVec 64))) (size!17405 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35481)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564869 (= res!356022 (validKeyInArray!0 (select (arr!17041 a!3118) j!142)))))

(declare-fun b!564870 () Bool)

(declare-fun res!356027 () Bool)

(declare-fun e!325275 () Bool)

(assert (=> b!564870 (=> (not res!356027) (not e!325275))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35481 (_ BitVec 32)) Bool)

(assert (=> b!564870 (= res!356027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564871 () Bool)

(declare-fun res!356023 () Bool)

(assert (=> b!564871 (=> (not res!356023) (not e!325274))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564871 (= res!356023 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564872 () Bool)

(declare-fun res!356024 () Bool)

(assert (=> b!564872 (=> (not res!356024) (not e!325274))))

(assert (=> b!564872 (= res!356024 (validKeyInArray!0 k0!1914))))

(declare-fun b!564873 () Bool)

(declare-fun res!356020 () Bool)

(assert (=> b!564873 (=> (not res!356020) (not e!325275))))

(declare-datatypes ((List!11121 0))(
  ( (Nil!11118) (Cons!11117 (h!12120 (_ BitVec 64)) (t!17349 List!11121)) )
))
(declare-fun arrayNoDuplicates!0 (array!35481 (_ BitVec 32) List!11121) Bool)

(assert (=> b!564873 (= res!356020 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11118))))

(declare-fun b!564874 () Bool)

(declare-fun res!356021 () Bool)

(assert (=> b!564874 (=> (not res!356021) (not e!325274))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564874 (= res!356021 (and (= (size!17405 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17405 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17405 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564875 () Bool)

(assert (=> b!564875 (= e!325275 false)))

(declare-datatypes ((SeekEntryResult!5490 0))(
  ( (MissingZero!5490 (index!24187 (_ BitVec 32))) (Found!5490 (index!24188 (_ BitVec 32))) (Intermediate!5490 (undefined!6302 Bool) (index!24189 (_ BitVec 32)) (x!53057 (_ BitVec 32))) (Undefined!5490) (MissingVacant!5490 (index!24190 (_ BitVec 32))) )
))
(declare-fun lt!257688 () SeekEntryResult!5490)

(declare-fun lt!257689 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35481 (_ BitVec 32)) SeekEntryResult!5490)

(assert (=> b!564875 (= lt!257688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257689 (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142) (array!35482 (store (arr!17041 a!3118) i!1132 k0!1914) (size!17405 a!3118)) mask!3119))))

(declare-fun lt!257687 () SeekEntryResult!5490)

(declare-fun lt!257686 () (_ BitVec 32))

(assert (=> b!564875 (= lt!257687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257686 (select (arr!17041 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564875 (= lt!257689 (toIndex!0 (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!564875 (= lt!257686 (toIndex!0 (select (arr!17041 a!3118) j!142) mask!3119))))

(declare-fun b!564868 () Bool)

(assert (=> b!564868 (= e!325274 e!325275)))

(declare-fun res!356026 () Bool)

(assert (=> b!564868 (=> (not res!356026) (not e!325275))))

(declare-fun lt!257685 () SeekEntryResult!5490)

(assert (=> b!564868 (= res!356026 (or (= lt!257685 (MissingZero!5490 i!1132)) (= lt!257685 (MissingVacant!5490 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35481 (_ BitVec 32)) SeekEntryResult!5490)

(assert (=> b!564868 (= lt!257685 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!356025 () Bool)

(assert (=> start!51616 (=> (not res!356025) (not e!325274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51616 (= res!356025 (validMask!0 mask!3119))))

(assert (=> start!51616 e!325274))

(assert (=> start!51616 true))

(declare-fun array_inv!12837 (array!35481) Bool)

(assert (=> start!51616 (array_inv!12837 a!3118)))

(assert (= (and start!51616 res!356025) b!564874))

(assert (= (and b!564874 res!356021) b!564869))

(assert (= (and b!564869 res!356022) b!564872))

(assert (= (and b!564872 res!356024) b!564871))

(assert (= (and b!564871 res!356023) b!564868))

(assert (= (and b!564868 res!356026) b!564870))

(assert (= (and b!564870 res!356027) b!564873))

(assert (= (and b!564873 res!356020) b!564875))

(declare-fun m!543351 () Bool)

(assert (=> b!564870 m!543351))

(declare-fun m!543353 () Bool)

(assert (=> b!564868 m!543353))

(declare-fun m!543355 () Bool)

(assert (=> b!564875 m!543355))

(declare-fun m!543357 () Bool)

(assert (=> b!564875 m!543357))

(assert (=> b!564875 m!543355))

(declare-fun m!543359 () Bool)

(assert (=> b!564875 m!543359))

(assert (=> b!564875 m!543355))

(declare-fun m!543361 () Bool)

(assert (=> b!564875 m!543361))

(assert (=> b!564875 m!543359))

(declare-fun m!543363 () Bool)

(assert (=> b!564875 m!543363))

(declare-fun m!543365 () Bool)

(assert (=> b!564875 m!543365))

(assert (=> b!564875 m!543359))

(declare-fun m!543367 () Bool)

(assert (=> b!564875 m!543367))

(declare-fun m!543369 () Bool)

(assert (=> b!564873 m!543369))

(declare-fun m!543371 () Bool)

(assert (=> b!564871 m!543371))

(declare-fun m!543373 () Bool)

(assert (=> start!51616 m!543373))

(declare-fun m!543375 () Bool)

(assert (=> start!51616 m!543375))

(declare-fun m!543377 () Bool)

(assert (=> b!564872 m!543377))

(assert (=> b!564869 m!543355))

(assert (=> b!564869 m!543355))

(declare-fun m!543379 () Bool)

(assert (=> b!564869 m!543379))

(check-sat (not b!564870) (not b!564871) (not start!51616) (not b!564873) (not b!564872) (not b!564875) (not b!564869) (not b!564868))
(check-sat)
