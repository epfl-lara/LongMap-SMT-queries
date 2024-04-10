; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50844 () Bool)

(assert start!50844)

(declare-fun b!556439 () Bool)

(declare-fun res!348856 () Bool)

(declare-fun e!320576 () Bool)

(assert (=> b!556439 (=> (not res!348856) (not e!320576))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35069 0))(
  ( (array!35070 (arr!16844 (Array (_ BitVec 32) (_ BitVec 64))) (size!17208 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35069)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556439 (= res!348856 (and (= (size!17208 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17208 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17208 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556440 () Bool)

(declare-fun res!348853 () Bool)

(declare-fun e!320575 () Bool)

(assert (=> b!556440 (=> (not res!348853) (not e!320575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35069 (_ BitVec 32)) Bool)

(assert (=> b!556440 (= res!348853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556441 () Bool)

(assert (=> b!556441 (= e!320576 e!320575)))

(declare-fun res!348860 () Bool)

(assert (=> b!556441 (=> (not res!348860) (not e!320575))))

(declare-datatypes ((SeekEntryResult!5293 0))(
  ( (MissingZero!5293 (index!23399 (_ BitVec 32))) (Found!5293 (index!23400 (_ BitVec 32))) (Intermediate!5293 (undefined!6105 Bool) (index!23401 (_ BitVec 32)) (x!52287 (_ BitVec 32))) (Undefined!5293) (MissingVacant!5293 (index!23402 (_ BitVec 32))) )
))
(declare-fun lt!252888 () SeekEntryResult!5293)

(assert (=> b!556441 (= res!348860 (or (= lt!252888 (MissingZero!5293 i!1132)) (= lt!252888 (MissingVacant!5293 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35069 (_ BitVec 32)) SeekEntryResult!5293)

(assert (=> b!556441 (= lt!252888 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!556442 () Bool)

(declare-fun res!348854 () Bool)

(assert (=> b!556442 (=> (not res!348854) (not e!320575))))

(declare-datatypes ((List!10924 0))(
  ( (Nil!10921) (Cons!10920 (h!11905 (_ BitVec 64)) (t!17152 List!10924)) )
))
(declare-fun arrayNoDuplicates!0 (array!35069 (_ BitVec 32) List!10924) Bool)

(assert (=> b!556442 (= res!348854 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10921))))

(declare-fun b!556443 () Bool)

(declare-fun res!348859 () Bool)

(assert (=> b!556443 (=> (not res!348859) (not e!320576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556443 (= res!348859 (validKeyInArray!0 (select (arr!16844 a!3118) j!142)))))

(declare-fun res!348852 () Bool)

(assert (=> start!50844 (=> (not res!348852) (not e!320576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50844 (= res!348852 (validMask!0 mask!3119))))

(assert (=> start!50844 e!320576))

(assert (=> start!50844 true))

(declare-fun array_inv!12640 (array!35069) Bool)

(assert (=> start!50844 (array_inv!12640 a!3118)))

(declare-fun lt!252889 () SeekEntryResult!5293)

(declare-fun e!320573 () Bool)

(declare-fun b!556444 () Bool)

(assert (=> b!556444 (= e!320573 (not (or (not (is-Intermediate!5293 lt!252889)) (undefined!6105 lt!252889) (= (select (arr!16844 a!3118) (index!23401 lt!252889)) (select (arr!16844 a!3118) j!142)) (= (select (arr!16844 a!3118) (index!23401 lt!252889)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!320577 () Bool)

(assert (=> b!556444 e!320577))

(declare-fun res!348855 () Bool)

(assert (=> b!556444 (=> (not res!348855) (not e!320577))))

(assert (=> b!556444 (= res!348855 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17360 0))(
  ( (Unit!17361) )
))
(declare-fun lt!252887 () Unit!17360)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35069 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17360)

(assert (=> b!556444 (= lt!252887 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556445 () Bool)

(assert (=> b!556445 (= e!320577 (= (seekEntryOrOpen!0 (select (arr!16844 a!3118) j!142) a!3118 mask!3119) (Found!5293 j!142)))))

(declare-fun b!556446 () Bool)

(declare-fun res!348851 () Bool)

(assert (=> b!556446 (=> (not res!348851) (not e!320576))))

(assert (=> b!556446 (= res!348851 (validKeyInArray!0 k!1914))))

(declare-fun b!556447 () Bool)

(declare-fun res!348858 () Bool)

(assert (=> b!556447 (=> (not res!348858) (not e!320576))))

(declare-fun arrayContainsKey!0 (array!35069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556447 (= res!348858 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556448 () Bool)

(assert (=> b!556448 (= e!320575 e!320573)))

(declare-fun res!348857 () Bool)

(assert (=> b!556448 (=> (not res!348857) (not e!320573))))

(declare-fun lt!252885 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35069 (_ BitVec 32)) SeekEntryResult!5293)

(assert (=> b!556448 (= res!348857 (= lt!252889 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252885 (select (store (arr!16844 a!3118) i!1132 k!1914) j!142) (array!35070 (store (arr!16844 a!3118) i!1132 k!1914) (size!17208 a!3118)) mask!3119)))))

(declare-fun lt!252886 () (_ BitVec 32))

(assert (=> b!556448 (= lt!252889 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252886 (select (arr!16844 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556448 (= lt!252885 (toIndex!0 (select (store (arr!16844 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!556448 (= lt!252886 (toIndex!0 (select (arr!16844 a!3118) j!142) mask!3119))))

(assert (= (and start!50844 res!348852) b!556439))

(assert (= (and b!556439 res!348856) b!556443))

(assert (= (and b!556443 res!348859) b!556446))

(assert (= (and b!556446 res!348851) b!556447))

(assert (= (and b!556447 res!348858) b!556441))

(assert (= (and b!556441 res!348860) b!556440))

(assert (= (and b!556440 res!348853) b!556442))

(assert (= (and b!556442 res!348854) b!556448))

(assert (= (and b!556448 res!348857) b!556444))

(assert (= (and b!556444 res!348855) b!556445))

(declare-fun m!534433 () Bool)

(assert (=> b!556443 m!534433))

(assert (=> b!556443 m!534433))

(declare-fun m!534435 () Bool)

(assert (=> b!556443 m!534435))

(declare-fun m!534437 () Bool)

(assert (=> start!50844 m!534437))

(declare-fun m!534439 () Bool)

(assert (=> start!50844 m!534439))

(declare-fun m!534441 () Bool)

(assert (=> b!556446 m!534441))

(assert (=> b!556445 m!534433))

(assert (=> b!556445 m!534433))

(declare-fun m!534443 () Bool)

(assert (=> b!556445 m!534443))

(declare-fun m!534445 () Bool)

(assert (=> b!556447 m!534445))

(declare-fun m!534447 () Bool)

(assert (=> b!556444 m!534447))

(assert (=> b!556444 m!534433))

(declare-fun m!534449 () Bool)

(assert (=> b!556444 m!534449))

(declare-fun m!534451 () Bool)

(assert (=> b!556444 m!534451))

(declare-fun m!534453 () Bool)

(assert (=> b!556440 m!534453))

(declare-fun m!534455 () Bool)

(assert (=> b!556441 m!534455))

(assert (=> b!556448 m!534433))

(declare-fun m!534457 () Bool)

(assert (=> b!556448 m!534457))

(declare-fun m!534459 () Bool)

(assert (=> b!556448 m!534459))

(declare-fun m!534461 () Bool)

(assert (=> b!556448 m!534461))

(assert (=> b!556448 m!534433))

(declare-fun m!534463 () Bool)

(assert (=> b!556448 m!534463))

(assert (=> b!556448 m!534433))

(assert (=> b!556448 m!534459))

(declare-fun m!534465 () Bool)

(assert (=> b!556448 m!534465))

(assert (=> b!556448 m!534459))

(declare-fun m!534467 () Bool)

(assert (=> b!556448 m!534467))

(declare-fun m!534469 () Bool)

(assert (=> b!556442 m!534469))

(push 1)

(assert (not b!556440))

