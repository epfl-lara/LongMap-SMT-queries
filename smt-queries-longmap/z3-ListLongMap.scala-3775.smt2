; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51750 () Bool)

(assert start!51750)

(declare-fun b!565753 () Bool)

(declare-fun e!325737 () Bool)

(assert (=> b!565753 (= e!325737 (not true))))

(declare-fun e!325736 () Bool)

(assert (=> b!565753 e!325736))

(declare-fun res!356620 () Bool)

(assert (=> b!565753 (=> (not res!356620) (not e!325736))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!35505 0))(
  ( (array!35506 (arr!17050 (Array (_ BitVec 32) (_ BitVec 64))) (size!17414 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35505)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35505 (_ BitVec 32)) Bool)

(assert (=> b!565753 (= res!356620 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17683 0))(
  ( (Unit!17684) )
))
(declare-fun lt!258022 () Unit!17683)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17683)

(assert (=> b!565753 (= lt!258022 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565754 () Bool)

(declare-fun res!356626 () Bool)

(declare-fun e!325734 () Bool)

(assert (=> b!565754 (=> (not res!356626) (not e!325734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565754 (= res!356626 (validKeyInArray!0 (select (arr!17050 a!3118) j!142)))))

(declare-fun b!565755 () Bool)

(assert (=> b!565755 (= e!325734 e!325737)))

(declare-fun res!356621 () Bool)

(assert (=> b!565755 (=> (not res!356621) (not e!325737))))

(declare-datatypes ((SeekEntryResult!5455 0))(
  ( (MissingZero!5455 (index!24047 (_ BitVec 32))) (Found!5455 (index!24048 (_ BitVec 32))) (Intermediate!5455 (undefined!6267 Bool) (index!24049 (_ BitVec 32)) (x!53071 (_ BitVec 32))) (Undefined!5455) (MissingVacant!5455 (index!24050 (_ BitVec 32))) )
))
(declare-fun lt!258021 () SeekEntryResult!5455)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565755 (= res!356621 (or (= lt!258021 (MissingZero!5455 i!1132)) (= lt!258021 (MissingVacant!5455 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35505 (_ BitVec 32)) SeekEntryResult!5455)

(assert (=> b!565755 (= lt!258021 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565756 () Bool)

(declare-fun res!356624 () Bool)

(assert (=> b!565756 (=> (not res!356624) (not e!325734))))

(declare-fun arrayContainsKey!0 (array!35505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565756 (= res!356624 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565757 () Bool)

(declare-fun res!356617 () Bool)

(assert (=> b!565757 (=> (not res!356617) (not e!325734))))

(assert (=> b!565757 (= res!356617 (validKeyInArray!0 k0!1914))))

(declare-fun b!565758 () Bool)

(declare-fun res!356625 () Bool)

(assert (=> b!565758 (=> (not res!356625) (not e!325734))))

(assert (=> b!565758 (= res!356625 (and (= (size!17414 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17414 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17414 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565759 () Bool)

(declare-fun res!356618 () Bool)

(assert (=> b!565759 (=> (not res!356618) (not e!325737))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35505 (_ BitVec 32)) SeekEntryResult!5455)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565759 (= res!356618 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17050 a!3118) j!142) mask!3119) (select (arr!17050 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17050 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17050 a!3118) i!1132 k0!1914) j!142) (array!35506 (store (arr!17050 a!3118) i!1132 k0!1914) (size!17414 a!3118)) mask!3119)))))

(declare-fun res!356623 () Bool)

(assert (=> start!51750 (=> (not res!356623) (not e!325734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51750 (= res!356623 (validMask!0 mask!3119))))

(assert (=> start!51750 e!325734))

(assert (=> start!51750 true))

(declare-fun array_inv!12909 (array!35505) Bool)

(assert (=> start!51750 (array_inv!12909 a!3118)))

(declare-fun b!565760 () Bool)

(declare-fun res!356622 () Bool)

(assert (=> b!565760 (=> (not res!356622) (not e!325737))))

(declare-datatypes ((List!11037 0))(
  ( (Nil!11034) (Cons!11033 (h!12042 (_ BitVec 64)) (t!17257 List!11037)) )
))
(declare-fun arrayNoDuplicates!0 (array!35505 (_ BitVec 32) List!11037) Bool)

(assert (=> b!565760 (= res!356622 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11034))))

(declare-fun b!565761 () Bool)

(assert (=> b!565761 (= e!325736 (= (seekEntryOrOpen!0 (select (arr!17050 a!3118) j!142) a!3118 mask!3119) (Found!5455 j!142)))))

(declare-fun b!565762 () Bool)

(declare-fun res!356619 () Bool)

(assert (=> b!565762 (=> (not res!356619) (not e!325737))))

(assert (=> b!565762 (= res!356619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51750 res!356623) b!565758))

(assert (= (and b!565758 res!356625) b!565754))

(assert (= (and b!565754 res!356626) b!565757))

(assert (= (and b!565757 res!356617) b!565756))

(assert (= (and b!565756 res!356624) b!565755))

(assert (= (and b!565755 res!356621) b!565762))

(assert (= (and b!565762 res!356619) b!565760))

(assert (= (and b!565760 res!356622) b!565759))

(assert (= (and b!565759 res!356618) b!565753))

(assert (= (and b!565753 res!356620) b!565761))

(declare-fun m!544373 () Bool)

(assert (=> b!565754 m!544373))

(assert (=> b!565754 m!544373))

(declare-fun m!544375 () Bool)

(assert (=> b!565754 m!544375))

(assert (=> b!565759 m!544373))

(declare-fun m!544377 () Bool)

(assert (=> b!565759 m!544377))

(assert (=> b!565759 m!544373))

(declare-fun m!544379 () Bool)

(assert (=> b!565759 m!544379))

(declare-fun m!544381 () Bool)

(assert (=> b!565759 m!544381))

(assert (=> b!565759 m!544379))

(declare-fun m!544383 () Bool)

(assert (=> b!565759 m!544383))

(assert (=> b!565759 m!544377))

(assert (=> b!565759 m!544373))

(declare-fun m!544385 () Bool)

(assert (=> b!565759 m!544385))

(declare-fun m!544387 () Bool)

(assert (=> b!565759 m!544387))

(assert (=> b!565759 m!544379))

(assert (=> b!565759 m!544381))

(declare-fun m!544389 () Bool)

(assert (=> b!565753 m!544389))

(declare-fun m!544391 () Bool)

(assert (=> b!565753 m!544391))

(declare-fun m!544393 () Bool)

(assert (=> b!565757 m!544393))

(assert (=> b!565761 m!544373))

(assert (=> b!565761 m!544373))

(declare-fun m!544395 () Bool)

(assert (=> b!565761 m!544395))

(declare-fun m!544397 () Bool)

(assert (=> b!565756 m!544397))

(declare-fun m!544399 () Bool)

(assert (=> b!565760 m!544399))

(declare-fun m!544401 () Bool)

(assert (=> start!51750 m!544401))

(declare-fun m!544403 () Bool)

(assert (=> start!51750 m!544403))

(declare-fun m!544405 () Bool)

(assert (=> b!565762 m!544405))

(declare-fun m!544407 () Bool)

(assert (=> b!565755 m!544407))

(check-sat (not b!565756) (not b!565757) (not b!565761) (not b!565762) (not b!565755) (not b!565754) (not start!51750) (not b!565753) (not b!565760) (not b!565759))
(check-sat)
