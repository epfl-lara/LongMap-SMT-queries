; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51404 () Bool)

(assert start!51404)

(declare-fun b!561532 () Bool)

(declare-fun e!323575 () Bool)

(declare-fun e!323570 () Bool)

(assert (=> b!561532 (= e!323575 e!323570)))

(declare-fun res!352836 () Bool)

(assert (=> b!561532 (=> res!352836 e!323570)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255528 () (_ BitVec 64))

(declare-datatypes ((array!35278 0))(
  ( (array!35279 (arr!16940 (Array (_ BitVec 32) (_ BitVec 64))) (size!17305 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35278)

(assert (=> b!561532 (= res!352836 (or (= lt!255528 (select (arr!16940 a!3118) j!142)) (= lt!255528 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5386 0))(
  ( (MissingZero!5386 (index!23771 (_ BitVec 32))) (Found!5386 (index!23772 (_ BitVec 32))) (Intermediate!5386 (undefined!6198 Bool) (index!23773 (_ BitVec 32)) (x!52684 (_ BitVec 32))) (Undefined!5386) (MissingVacant!5386 (index!23774 (_ BitVec 32))) )
))
(declare-fun lt!255535 () SeekEntryResult!5386)

(assert (=> b!561532 (= lt!255528 (select (arr!16940 a!3118) (index!23773 lt!255535)))))

(declare-fun b!561533 () Bool)

(declare-fun e!323571 () Bool)

(assert (=> b!561533 (= e!323571 e!323575)))

(declare-fun res!352837 () Bool)

(assert (=> b!561533 (=> res!352837 e!323575)))

(get-info :version)

(assert (=> b!561533 (= res!352837 (or (undefined!6198 lt!255535) (not ((_ is Intermediate!5386) lt!255535))))))

(declare-fun b!561534 () Bool)

(declare-fun e!323572 () Bool)

(declare-fun e!323576 () Bool)

(assert (=> b!561534 (= e!323572 e!323576)))

(declare-fun res!352831 () Bool)

(assert (=> b!561534 (=> (not res!352831) (not e!323576))))

(declare-fun lt!255529 () SeekEntryResult!5386)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561534 (= res!352831 (or (= lt!255529 (MissingZero!5386 i!1132)) (= lt!255529 (MissingVacant!5386 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35278 (_ BitVec 32)) SeekEntryResult!5386)

(assert (=> b!561534 (= lt!255529 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561535 () Bool)

(declare-fun res!352827 () Bool)

(assert (=> b!561535 (=> (not res!352827) (not e!323576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35278 (_ BitVec 32)) Bool)

(assert (=> b!561535 (= res!352827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561536 () Bool)

(declare-fun res!352832 () Bool)

(assert (=> b!561536 (=> (not res!352832) (not e!323572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561536 (= res!352832 (validKeyInArray!0 k0!1914))))

(declare-fun b!561538 () Bool)

(declare-fun res!352833 () Bool)

(assert (=> b!561538 (=> (not res!352833) (not e!323572))))

(assert (=> b!561538 (= res!352833 (and (= (size!17305 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17305 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17305 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561539 () Bool)

(declare-fun res!352826 () Bool)

(assert (=> b!561539 (=> (not res!352826) (not e!323572))))

(assert (=> b!561539 (= res!352826 (validKeyInArray!0 (select (arr!16940 a!3118) j!142)))))

(declare-fun b!561540 () Bool)

(declare-fun e!323573 () Bool)

(assert (=> b!561540 (= e!323570 e!323573)))

(declare-fun res!352829 () Bool)

(assert (=> b!561540 (=> (not res!352829) (not e!323573))))

(declare-fun lt!255532 () SeekEntryResult!5386)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35278 (_ BitVec 32)) SeekEntryResult!5386)

(assert (=> b!561540 (= res!352829 (= lt!255532 (seekKeyOrZeroReturnVacant!0 (x!52684 lt!255535) (index!23773 lt!255535) (index!23773 lt!255535) (select (arr!16940 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561541 () Bool)

(declare-fun e!323574 () Bool)

(assert (=> b!561541 (= e!323574 (not true))))

(assert (=> b!561541 e!323571))

(declare-fun res!352835 () Bool)

(assert (=> b!561541 (=> (not res!352835) (not e!323571))))

(assert (=> b!561541 (= res!352835 (= lt!255532 (Found!5386 j!142)))))

(assert (=> b!561541 (= lt!255532 (seekEntryOrOpen!0 (select (arr!16940 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561541 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17532 0))(
  ( (Unit!17533) )
))
(declare-fun lt!255527 () Unit!17532)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35278 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17532)

(assert (=> b!561541 (= lt!255527 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561542 () Bool)

(declare-fun res!352830 () Bool)

(assert (=> b!561542 (=> (not res!352830) (not e!323572))))

(declare-fun arrayContainsKey!0 (array!35278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561542 (= res!352830 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561543 () Bool)

(declare-fun lt!255534 () (_ BitVec 64))

(declare-fun lt!255531 () array!35278)

(assert (=> b!561543 (= e!323573 (= (seekEntryOrOpen!0 lt!255534 lt!255531 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52684 lt!255535) (index!23773 lt!255535) (index!23773 lt!255535) lt!255534 lt!255531 mask!3119)))))

(declare-fun b!561544 () Bool)

(assert (=> b!561544 (= e!323576 e!323574)))

(declare-fun res!352838 () Bool)

(assert (=> b!561544 (=> (not res!352838) (not e!323574))))

(declare-fun lt!255533 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35278 (_ BitVec 32)) SeekEntryResult!5386)

(assert (=> b!561544 (= res!352838 (= lt!255535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255533 lt!255534 lt!255531 mask!3119)))))

(declare-fun lt!255530 () (_ BitVec 32))

(assert (=> b!561544 (= lt!255535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255530 (select (arr!16940 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561544 (= lt!255533 (toIndex!0 lt!255534 mask!3119))))

(assert (=> b!561544 (= lt!255534 (select (store (arr!16940 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561544 (= lt!255530 (toIndex!0 (select (arr!16940 a!3118) j!142) mask!3119))))

(assert (=> b!561544 (= lt!255531 (array!35279 (store (arr!16940 a!3118) i!1132 k0!1914) (size!17305 a!3118)))))

(declare-fun res!352828 () Bool)

(assert (=> start!51404 (=> (not res!352828) (not e!323572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51404 (= res!352828 (validMask!0 mask!3119))))

(assert (=> start!51404 e!323572))

(assert (=> start!51404 true))

(declare-fun array_inv!12823 (array!35278) Bool)

(assert (=> start!51404 (array_inv!12823 a!3118)))

(declare-fun b!561537 () Bool)

(declare-fun res!352834 () Bool)

(assert (=> b!561537 (=> (not res!352834) (not e!323576))))

(declare-datatypes ((List!11059 0))(
  ( (Nil!11056) (Cons!11055 (h!12058 (_ BitVec 64)) (t!17278 List!11059)) )
))
(declare-fun arrayNoDuplicates!0 (array!35278 (_ BitVec 32) List!11059) Bool)

(assert (=> b!561537 (= res!352834 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11056))))

(assert (= (and start!51404 res!352828) b!561538))

(assert (= (and b!561538 res!352833) b!561539))

(assert (= (and b!561539 res!352826) b!561536))

(assert (= (and b!561536 res!352832) b!561542))

(assert (= (and b!561542 res!352830) b!561534))

(assert (= (and b!561534 res!352831) b!561535))

(assert (= (and b!561535 res!352827) b!561537))

(assert (= (and b!561537 res!352834) b!561544))

(assert (= (and b!561544 res!352838) b!561541))

(assert (= (and b!561541 res!352835) b!561533))

(assert (= (and b!561533 (not res!352837)) b!561532))

(assert (= (and b!561532 (not res!352836)) b!561540))

(assert (= (and b!561540 res!352829) b!561543))

(declare-fun m!538973 () Bool)

(assert (=> b!561535 m!538973))

(declare-fun m!538975 () Bool)

(assert (=> b!561532 m!538975))

(declare-fun m!538977 () Bool)

(assert (=> b!561532 m!538977))

(declare-fun m!538979 () Bool)

(assert (=> b!561542 m!538979))

(declare-fun m!538981 () Bool)

(assert (=> b!561537 m!538981))

(declare-fun m!538983 () Bool)

(assert (=> b!561536 m!538983))

(assert (=> b!561541 m!538975))

(assert (=> b!561541 m!538975))

(declare-fun m!538985 () Bool)

(assert (=> b!561541 m!538985))

(declare-fun m!538987 () Bool)

(assert (=> b!561541 m!538987))

(declare-fun m!538989 () Bool)

(assert (=> b!561541 m!538989))

(assert (=> b!561539 m!538975))

(assert (=> b!561539 m!538975))

(declare-fun m!538991 () Bool)

(assert (=> b!561539 m!538991))

(declare-fun m!538993 () Bool)

(assert (=> b!561543 m!538993))

(declare-fun m!538995 () Bool)

(assert (=> b!561543 m!538995))

(assert (=> b!561544 m!538975))

(declare-fun m!538997 () Bool)

(assert (=> b!561544 m!538997))

(declare-fun m!538999 () Bool)

(assert (=> b!561544 m!538999))

(assert (=> b!561544 m!538975))

(assert (=> b!561544 m!538975))

(declare-fun m!539001 () Bool)

(assert (=> b!561544 m!539001))

(declare-fun m!539003 () Bool)

(assert (=> b!561544 m!539003))

(declare-fun m!539005 () Bool)

(assert (=> b!561544 m!539005))

(declare-fun m!539007 () Bool)

(assert (=> b!561544 m!539007))

(declare-fun m!539009 () Bool)

(assert (=> start!51404 m!539009))

(declare-fun m!539011 () Bool)

(assert (=> start!51404 m!539011))

(assert (=> b!561540 m!538975))

(assert (=> b!561540 m!538975))

(declare-fun m!539013 () Bool)

(assert (=> b!561540 m!539013))

(declare-fun m!539015 () Bool)

(assert (=> b!561534 m!539015))

(check-sat (not b!561542) (not b!561536) (not b!561535) (not b!561540) (not b!561544) (not b!561537) (not start!51404) (not b!561541) (not b!561534) (not b!561539) (not b!561543))
(check-sat)
