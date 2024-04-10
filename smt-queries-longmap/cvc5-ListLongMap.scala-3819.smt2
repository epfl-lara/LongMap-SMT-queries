; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52400 () Bool)

(assert start!52400)

(declare-fun b!571763 () Bool)

(declare-fun e!328861 () Bool)

(declare-fun e!328863 () Bool)

(assert (=> b!571763 (= e!328861 e!328863)))

(declare-fun res!361280 () Bool)

(assert (=> b!571763 (=> res!361280 e!328863)))

(declare-datatypes ((SeekEntryResult!5636 0))(
  ( (MissingZero!5636 (index!24771 (_ BitVec 32))) (Found!5636 (index!24772 (_ BitVec 32))) (Intermediate!5636 (undefined!6448 Bool) (index!24773 (_ BitVec 32)) (x!53649 (_ BitVec 32))) (Undefined!5636) (MissingVacant!5636 (index!24774 (_ BitVec 32))) )
))
(declare-fun lt!260771 () SeekEntryResult!5636)

(assert (=> b!571763 (= res!361280 (or (undefined!6448 lt!260771) (not (is-Intermediate!5636 lt!260771))))))

(declare-fun b!571764 () Bool)

(declare-fun res!361275 () Bool)

(declare-fun e!328860 () Bool)

(assert (=> b!571764 (=> (not res!361275) (not e!328860))))

(declare-datatypes ((array!35797 0))(
  ( (array!35798 (arr!17187 (Array (_ BitVec 32) (_ BitVec 64))) (size!17551 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35797)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571764 (= res!361275 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571765 () Bool)

(declare-fun e!328859 () Bool)

(assert (=> b!571765 (= e!328859 (not true))))

(assert (=> b!571765 e!328861))

(declare-fun res!361278 () Bool)

(assert (=> b!571765 (=> (not res!361278) (not e!328861))))

(declare-fun lt!260773 () SeekEntryResult!5636)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!571765 (= res!361278 (= lt!260773 (Found!5636 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35797 (_ BitVec 32)) SeekEntryResult!5636)

(assert (=> b!571765 (= lt!260773 (seekEntryOrOpen!0 (select (arr!17187 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35797 (_ BitVec 32)) Bool)

(assert (=> b!571765 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17974 0))(
  ( (Unit!17975) )
))
(declare-fun lt!260770 () Unit!17974)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35797 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17974)

(assert (=> b!571765 (= lt!260770 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571766 () Bool)

(declare-fun res!361272 () Bool)

(assert (=> b!571766 (=> (not res!361272) (not e!328860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571766 (= res!361272 (validKeyInArray!0 k!1914))))

(declare-fun b!571767 () Bool)

(declare-fun res!361282 () Bool)

(declare-fun e!328865 () Bool)

(assert (=> b!571767 (=> (not res!361282) (not e!328865))))

(assert (=> b!571767 (= res!361282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571768 () Bool)

(assert (=> b!571768 (= e!328865 e!328859)))

(declare-fun res!361271 () Bool)

(assert (=> b!571768 (=> (not res!361271) (not e!328859))))

(declare-fun lt!260768 () (_ BitVec 64))

(declare-fun lt!260772 () array!35797)

(declare-fun lt!260775 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35797 (_ BitVec 32)) SeekEntryResult!5636)

(assert (=> b!571768 (= res!361271 (= lt!260771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260775 lt!260768 lt!260772 mask!3119)))))

(declare-fun lt!260776 () (_ BitVec 32))

(assert (=> b!571768 (= lt!260771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260776 (select (arr!17187 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571768 (= lt!260775 (toIndex!0 lt!260768 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571768 (= lt!260768 (select (store (arr!17187 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!571768 (= lt!260776 (toIndex!0 (select (arr!17187 a!3118) j!142) mask!3119))))

(assert (=> b!571768 (= lt!260772 (array!35798 (store (arr!17187 a!3118) i!1132 k!1914) (size!17551 a!3118)))))

(declare-fun b!571769 () Bool)

(declare-fun e!328864 () Bool)

(assert (=> b!571769 (= e!328863 e!328864)))

(declare-fun res!361277 () Bool)

(assert (=> b!571769 (=> res!361277 e!328864)))

(declare-fun lt!260774 () (_ BitVec 64))

(assert (=> b!571769 (= res!361277 (or (= lt!260774 (select (arr!17187 a!3118) j!142)) (= lt!260774 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571769 (= lt!260774 (select (arr!17187 a!3118) (index!24773 lt!260771)))))

(declare-fun b!571771 () Bool)

(assert (=> b!571771 (= e!328860 e!328865)))

(declare-fun res!361283 () Bool)

(assert (=> b!571771 (=> (not res!361283) (not e!328865))))

(declare-fun lt!260769 () SeekEntryResult!5636)

(assert (=> b!571771 (= res!361283 (or (= lt!260769 (MissingZero!5636 i!1132)) (= lt!260769 (MissingVacant!5636 i!1132))))))

(assert (=> b!571771 (= lt!260769 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!571772 () Bool)

(declare-fun e!328862 () Bool)

(assert (=> b!571772 (= e!328864 e!328862)))

(declare-fun res!361274 () Bool)

(assert (=> b!571772 (=> (not res!361274) (not e!328862))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35797 (_ BitVec 32)) SeekEntryResult!5636)

(assert (=> b!571772 (= res!361274 (= lt!260773 (seekKeyOrZeroReturnVacant!0 (x!53649 lt!260771) (index!24773 lt!260771) (index!24773 lt!260771) (select (arr!17187 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571773 () Bool)

(declare-fun res!361273 () Bool)

(assert (=> b!571773 (=> (not res!361273) (not e!328860))))

(assert (=> b!571773 (= res!361273 (validKeyInArray!0 (select (arr!17187 a!3118) j!142)))))

(declare-fun b!571774 () Bool)

(assert (=> b!571774 (= e!328862 (= (seekEntryOrOpen!0 lt!260768 lt!260772 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53649 lt!260771) (index!24773 lt!260771) (index!24773 lt!260771) lt!260768 lt!260772 mask!3119)))))

(declare-fun b!571775 () Bool)

(declare-fun res!361276 () Bool)

(assert (=> b!571775 (=> (not res!361276) (not e!328860))))

(assert (=> b!571775 (= res!361276 (and (= (size!17551 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17551 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17551 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!361279 () Bool)

(assert (=> start!52400 (=> (not res!361279) (not e!328860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52400 (= res!361279 (validMask!0 mask!3119))))

(assert (=> start!52400 e!328860))

(assert (=> start!52400 true))

(declare-fun array_inv!12983 (array!35797) Bool)

(assert (=> start!52400 (array_inv!12983 a!3118)))

(declare-fun b!571770 () Bool)

(declare-fun res!361281 () Bool)

(assert (=> b!571770 (=> (not res!361281) (not e!328865))))

(declare-datatypes ((List!11267 0))(
  ( (Nil!11264) (Cons!11263 (h!12290 (_ BitVec 64)) (t!17495 List!11267)) )
))
(declare-fun arrayNoDuplicates!0 (array!35797 (_ BitVec 32) List!11267) Bool)

(assert (=> b!571770 (= res!361281 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11264))))

(assert (= (and start!52400 res!361279) b!571775))

(assert (= (and b!571775 res!361276) b!571773))

(assert (= (and b!571773 res!361273) b!571766))

(assert (= (and b!571766 res!361272) b!571764))

(assert (= (and b!571764 res!361275) b!571771))

(assert (= (and b!571771 res!361283) b!571767))

(assert (= (and b!571767 res!361282) b!571770))

(assert (= (and b!571770 res!361281) b!571768))

(assert (= (and b!571768 res!361271) b!571765))

(assert (= (and b!571765 res!361278) b!571763))

(assert (= (and b!571763 (not res!361280)) b!571769))

(assert (= (and b!571769 (not res!361277)) b!571772))

(assert (= (and b!571772 res!361274) b!571774))

(declare-fun m!550653 () Bool)

(assert (=> b!571765 m!550653))

(assert (=> b!571765 m!550653))

(declare-fun m!550655 () Bool)

(assert (=> b!571765 m!550655))

(declare-fun m!550657 () Bool)

(assert (=> b!571765 m!550657))

(declare-fun m!550659 () Bool)

(assert (=> b!571765 m!550659))

(assert (=> b!571772 m!550653))

(assert (=> b!571772 m!550653))

(declare-fun m!550661 () Bool)

(assert (=> b!571772 m!550661))

(declare-fun m!550663 () Bool)

(assert (=> b!571767 m!550663))

(declare-fun m!550665 () Bool)

(assert (=> b!571770 m!550665))

(declare-fun m!550667 () Bool)

(assert (=> b!571771 m!550667))

(declare-fun m!550669 () Bool)

(assert (=> b!571766 m!550669))

(assert (=> b!571768 m!550653))

(declare-fun m!550671 () Bool)

(assert (=> b!571768 m!550671))

(assert (=> b!571768 m!550653))

(declare-fun m!550673 () Bool)

(assert (=> b!571768 m!550673))

(assert (=> b!571768 m!550653))

(declare-fun m!550675 () Bool)

(assert (=> b!571768 m!550675))

(declare-fun m!550677 () Bool)

(assert (=> b!571768 m!550677))

(declare-fun m!550679 () Bool)

(assert (=> b!571768 m!550679))

(declare-fun m!550681 () Bool)

(assert (=> b!571768 m!550681))

(assert (=> b!571773 m!550653))

(assert (=> b!571773 m!550653))

(declare-fun m!550683 () Bool)

(assert (=> b!571773 m!550683))

(declare-fun m!550685 () Bool)

(assert (=> start!52400 m!550685))

(declare-fun m!550687 () Bool)

(assert (=> start!52400 m!550687))

(declare-fun m!550689 () Bool)

(assert (=> b!571774 m!550689))

(declare-fun m!550691 () Bool)

(assert (=> b!571774 m!550691))

(assert (=> b!571769 m!550653))

(declare-fun m!550693 () Bool)

(assert (=> b!571769 m!550693))

(declare-fun m!550695 () Bool)

(assert (=> b!571764 m!550695))

(push 1)

