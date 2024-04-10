; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52300 () Bool)

(assert start!52300)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!570754 () Bool)

(declare-fun e!328260 () Bool)

(declare-datatypes ((SeekEntryResult!5619 0))(
  ( (MissingZero!5619 (index!24703 (_ BitVec 32))) (Found!5619 (index!24704 (_ BitVec 32))) (Intermediate!5619 (undefined!6431 Bool) (index!24705 (_ BitVec 32)) (x!53575 (_ BitVec 32))) (Undefined!5619) (MissingVacant!5619 (index!24706 (_ BitVec 32))) )
))
(declare-fun lt!260207 () SeekEntryResult!5619)

(declare-fun lt!260204 () SeekEntryResult!5619)

(declare-datatypes ((array!35760 0))(
  ( (array!35761 (arr!17170 (Array (_ BitVec 32) (_ BitVec 64))) (size!17534 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35760)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35760 (_ BitVec 32)) SeekEntryResult!5619)

(assert (=> b!570754 (= e!328260 (= lt!260204 (seekKeyOrZeroReturnVacant!0 (x!53575 lt!260207) (index!24705 lt!260207) (index!24705 lt!260207) (select (arr!17170 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570755 () Bool)

(declare-fun res!360544 () Bool)

(declare-fun e!328256 () Bool)

(assert (=> b!570755 (=> (not res!360544) (not e!328256))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!570755 (= res!360544 (and (= (size!17534 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17534 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17534 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570756 () Bool)

(declare-fun e!328255 () Bool)

(assert (=> b!570756 (= e!328255 e!328260)))

(declare-fun res!360535 () Bool)

(assert (=> b!570756 (=> res!360535 e!328260)))

(get-info :version)

(assert (=> b!570756 (= res!360535 (or (undefined!6431 lt!260207) (not ((_ is Intermediate!5619) lt!260207)) (= (select (arr!17170 a!3118) (index!24705 lt!260207)) (select (arr!17170 a!3118) j!142)) (= (select (arr!17170 a!3118) (index!24705 lt!260207)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570757 () Bool)

(declare-fun res!360545 () Bool)

(assert (=> b!570757 (=> (not res!360545) (not e!328256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570757 (= res!360545 (validKeyInArray!0 (select (arr!17170 a!3118) j!142)))))

(declare-fun b!570758 () Bool)

(declare-fun e!328258 () Bool)

(assert (=> b!570758 (= e!328256 e!328258)))

(declare-fun res!360540 () Bool)

(assert (=> b!570758 (=> (not res!360540) (not e!328258))))

(declare-fun lt!260206 () SeekEntryResult!5619)

(assert (=> b!570758 (= res!360540 (or (= lt!260206 (MissingZero!5619 i!1132)) (= lt!260206 (MissingVacant!5619 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35760 (_ BitVec 32)) SeekEntryResult!5619)

(assert (=> b!570758 (= lt!260206 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!570759 () Bool)

(declare-fun res!360539 () Bool)

(assert (=> b!570759 (=> (not res!360539) (not e!328258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35760 (_ BitVec 32)) Bool)

(assert (=> b!570759 (= res!360539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570761 () Bool)

(declare-fun res!360541 () Bool)

(assert (=> b!570761 (=> (not res!360541) (not e!328256))))

(declare-fun arrayContainsKey!0 (array!35760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570761 (= res!360541 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570762 () Bool)

(declare-fun e!328257 () Bool)

(assert (=> b!570762 (= e!328257 (not true))))

(assert (=> b!570762 e!328255))

(declare-fun res!360537 () Bool)

(assert (=> b!570762 (=> (not res!360537) (not e!328255))))

(assert (=> b!570762 (= res!360537 (= lt!260204 (Found!5619 j!142)))))

(assert (=> b!570762 (= lt!260204 (seekEntryOrOpen!0 (select (arr!17170 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!570762 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17940 0))(
  ( (Unit!17941) )
))
(declare-fun lt!260205 () Unit!17940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35760 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17940)

(assert (=> b!570762 (= lt!260205 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570763 () Bool)

(declare-fun res!360538 () Bool)

(assert (=> b!570763 (=> (not res!360538) (not e!328256))))

(assert (=> b!570763 (= res!360538 (validKeyInArray!0 k0!1914))))

(declare-fun b!570764 () Bool)

(assert (=> b!570764 (= e!328258 e!328257)))

(declare-fun res!360536 () Bool)

(assert (=> b!570764 (=> (not res!360536) (not e!328257))))

(declare-fun lt!260209 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35760 (_ BitVec 32)) SeekEntryResult!5619)

(assert (=> b!570764 (= res!360536 (= lt!260207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260209 (select (store (arr!17170 a!3118) i!1132 k0!1914) j!142) (array!35761 (store (arr!17170 a!3118) i!1132 k0!1914) (size!17534 a!3118)) mask!3119)))))

(declare-fun lt!260208 () (_ BitVec 32))

(assert (=> b!570764 (= lt!260207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260208 (select (arr!17170 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570764 (= lt!260209 (toIndex!0 (select (store (arr!17170 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570764 (= lt!260208 (toIndex!0 (select (arr!17170 a!3118) j!142) mask!3119))))

(declare-fun b!570760 () Bool)

(declare-fun res!360543 () Bool)

(assert (=> b!570760 (=> (not res!360543) (not e!328258))))

(declare-datatypes ((List!11250 0))(
  ( (Nil!11247) (Cons!11246 (h!12270 (_ BitVec 64)) (t!17478 List!11250)) )
))
(declare-fun arrayNoDuplicates!0 (array!35760 (_ BitVec 32) List!11250) Bool)

(assert (=> b!570760 (= res!360543 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11247))))

(declare-fun res!360542 () Bool)

(assert (=> start!52300 (=> (not res!360542) (not e!328256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52300 (= res!360542 (validMask!0 mask!3119))))

(assert (=> start!52300 e!328256))

(assert (=> start!52300 true))

(declare-fun array_inv!12966 (array!35760) Bool)

(assert (=> start!52300 (array_inv!12966 a!3118)))

(assert (= (and start!52300 res!360542) b!570755))

(assert (= (and b!570755 res!360544) b!570757))

(assert (= (and b!570757 res!360545) b!570763))

(assert (= (and b!570763 res!360538) b!570761))

(assert (= (and b!570761 res!360541) b!570758))

(assert (= (and b!570758 res!360540) b!570759))

(assert (= (and b!570759 res!360539) b!570760))

(assert (= (and b!570760 res!360543) b!570764))

(assert (= (and b!570764 res!360536) b!570762))

(assert (= (and b!570762 res!360537) b!570756))

(assert (= (and b!570756 (not res!360535)) b!570754))

(declare-fun m!549649 () Bool)

(assert (=> b!570764 m!549649))

(declare-fun m!549651 () Bool)

(assert (=> b!570764 m!549651))

(assert (=> b!570764 m!549649))

(assert (=> b!570764 m!549649))

(declare-fun m!549653 () Bool)

(assert (=> b!570764 m!549653))

(declare-fun m!549655 () Bool)

(assert (=> b!570764 m!549655))

(assert (=> b!570764 m!549655))

(declare-fun m!549657 () Bool)

(assert (=> b!570764 m!549657))

(declare-fun m!549659 () Bool)

(assert (=> b!570764 m!549659))

(assert (=> b!570764 m!549655))

(declare-fun m!549661 () Bool)

(assert (=> b!570764 m!549661))

(declare-fun m!549663 () Bool)

(assert (=> b!570759 m!549663))

(declare-fun m!549665 () Bool)

(assert (=> start!52300 m!549665))

(declare-fun m!549667 () Bool)

(assert (=> start!52300 m!549667))

(declare-fun m!549669 () Bool)

(assert (=> b!570763 m!549669))

(declare-fun m!549671 () Bool)

(assert (=> b!570758 m!549671))

(assert (=> b!570762 m!549649))

(assert (=> b!570762 m!549649))

(declare-fun m!549673 () Bool)

(assert (=> b!570762 m!549673))

(declare-fun m!549675 () Bool)

(assert (=> b!570762 m!549675))

(declare-fun m!549677 () Bool)

(assert (=> b!570762 m!549677))

(assert (=> b!570754 m!549649))

(assert (=> b!570754 m!549649))

(declare-fun m!549679 () Bool)

(assert (=> b!570754 m!549679))

(declare-fun m!549681 () Bool)

(assert (=> b!570761 m!549681))

(declare-fun m!549683 () Bool)

(assert (=> b!570756 m!549683))

(assert (=> b!570756 m!549649))

(assert (=> b!570757 m!549649))

(assert (=> b!570757 m!549649))

(declare-fun m!549685 () Bool)

(assert (=> b!570757 m!549685))

(declare-fun m!549687 () Bool)

(assert (=> b!570760 m!549687))

(check-sat (not b!570761) (not b!570760) (not b!570759) (not b!570763) (not b!570758) (not b!570764) (not b!570757) (not start!52300) (not b!570754) (not b!570762))
(check-sat)
