; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51408 () Bool)

(assert start!51408)

(declare-fun b!561647 () Bool)

(declare-fun e!323654 () Bool)

(declare-fun e!323650 () Bool)

(assert (=> b!561647 (= e!323654 e!323650)))

(declare-fun res!352808 () Bool)

(assert (=> b!561647 (=> (not res!352808) (not e!323650))))

(declare-datatypes ((SeekEntryResult!5386 0))(
  ( (MissingZero!5386 (index!23771 (_ BitVec 32))) (Found!5386 (index!23772 (_ BitVec 32))) (Intermediate!5386 (undefined!6198 Bool) (index!23773 (_ BitVec 32)) (x!52673 (_ BitVec 32))) (Undefined!5386) (MissingVacant!5386 (index!23774 (_ BitVec 32))) )
))
(declare-fun lt!255658 () SeekEntryResult!5386)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561647 (= res!352808 (or (= lt!255658 (MissingZero!5386 i!1132)) (= lt!255658 (MissingVacant!5386 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35273 0))(
  ( (array!35274 (arr!16937 (Array (_ BitVec 32) (_ BitVec 64))) (size!17301 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35273)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35273 (_ BitVec 32)) SeekEntryResult!5386)

(assert (=> b!561647 (= lt!255658 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!561648 () Bool)

(declare-fun res!352806 () Bool)

(assert (=> b!561648 (=> (not res!352806) (not e!323654))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!561648 (= res!352806 (and (= (size!17301 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17301 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17301 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!352811 () Bool)

(assert (=> start!51408 (=> (not res!352811) (not e!323654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51408 (= res!352811 (validMask!0 mask!3119))))

(assert (=> start!51408 e!323654))

(assert (=> start!51408 true))

(declare-fun array_inv!12733 (array!35273) Bool)

(assert (=> start!51408 (array_inv!12733 a!3118)))

(declare-fun b!561649 () Bool)

(declare-fun res!352810 () Bool)

(assert (=> b!561649 (=> (not res!352810) (not e!323650))))

(declare-datatypes ((List!11017 0))(
  ( (Nil!11014) (Cons!11013 (h!12016 (_ BitVec 64)) (t!17245 List!11017)) )
))
(declare-fun arrayNoDuplicates!0 (array!35273 (_ BitVec 32) List!11017) Bool)

(assert (=> b!561649 (= res!352810 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11014))))

(declare-fun b!561650 () Bool)

(declare-fun e!323652 () Bool)

(declare-fun e!323649 () Bool)

(assert (=> b!561650 (= e!323652 e!323649)))

(declare-fun res!352800 () Bool)

(assert (=> b!561650 (=> res!352800 e!323649)))

(declare-fun lt!255661 () SeekEntryResult!5386)

(assert (=> b!561650 (= res!352800 (or (undefined!6198 lt!255661) (not (is-Intermediate!5386 lt!255661))))))

(declare-fun b!561651 () Bool)

(declare-fun e!323648 () Bool)

(assert (=> b!561651 (= e!323650 e!323648)))

(declare-fun res!352805 () Bool)

(assert (=> b!561651 (=> (not res!352805) (not e!323648))))

(declare-fun lt!255653 () (_ BitVec 32))

(declare-fun lt!255660 () (_ BitVec 64))

(declare-fun lt!255659 () array!35273)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35273 (_ BitVec 32)) SeekEntryResult!5386)

(assert (=> b!561651 (= res!352805 (= lt!255661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255653 lt!255660 lt!255659 mask!3119)))))

(declare-fun lt!255657 () (_ BitVec 32))

(assert (=> b!561651 (= lt!255661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255657 (select (arr!16937 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561651 (= lt!255653 (toIndex!0 lt!255660 mask!3119))))

(assert (=> b!561651 (= lt!255660 (select (store (arr!16937 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!561651 (= lt!255657 (toIndex!0 (select (arr!16937 a!3118) j!142) mask!3119))))

(assert (=> b!561651 (= lt!255659 (array!35274 (store (arr!16937 a!3118) i!1132 k!1914) (size!17301 a!3118)))))

(declare-fun b!561652 () Bool)

(declare-fun res!352801 () Bool)

(assert (=> b!561652 (=> (not res!352801) (not e!323654))))

(declare-fun arrayContainsKey!0 (array!35273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561652 (= res!352801 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561653 () Bool)

(declare-fun e!323655 () Bool)

(declare-fun e!323651 () Bool)

(assert (=> b!561653 (= e!323655 e!323651)))

(declare-fun res!352802 () Bool)

(assert (=> b!561653 (=> (not res!352802) (not e!323651))))

(declare-fun lt!255655 () SeekEntryResult!5386)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35273 (_ BitVec 32)) SeekEntryResult!5386)

(assert (=> b!561653 (= res!352802 (= lt!255655 (seekKeyOrZeroReturnVacant!0 (x!52673 lt!255661) (index!23773 lt!255661) (index!23773 lt!255661) (select (arr!16937 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561654 () Bool)

(declare-fun res!352804 () Bool)

(assert (=> b!561654 (=> (not res!352804) (not e!323654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561654 (= res!352804 (validKeyInArray!0 k!1914))))

(declare-fun b!561655 () Bool)

(declare-fun res!352807 () Bool)

(assert (=> b!561655 (=> (not res!352807) (not e!323654))))

(assert (=> b!561655 (= res!352807 (validKeyInArray!0 (select (arr!16937 a!3118) j!142)))))

(declare-fun b!561656 () Bool)

(assert (=> b!561656 (= e!323648 (not true))))

(assert (=> b!561656 e!323652))

(declare-fun res!352803 () Bool)

(assert (=> b!561656 (=> (not res!352803) (not e!323652))))

(assert (=> b!561656 (= res!352803 (= lt!255655 (Found!5386 j!142)))))

(assert (=> b!561656 (= lt!255655 (seekEntryOrOpen!0 (select (arr!16937 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35273 (_ BitVec 32)) Bool)

(assert (=> b!561656 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17546 0))(
  ( (Unit!17547) )
))
(declare-fun lt!255654 () Unit!17546)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35273 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17546)

(assert (=> b!561656 (= lt!255654 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561657 () Bool)

(assert (=> b!561657 (= e!323651 (= (seekEntryOrOpen!0 lt!255660 lt!255659 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52673 lt!255661) (index!23773 lt!255661) (index!23773 lt!255661) lt!255660 lt!255659 mask!3119)))))

(declare-fun b!561658 () Bool)

(assert (=> b!561658 (= e!323649 e!323655)))

(declare-fun res!352809 () Bool)

(assert (=> b!561658 (=> res!352809 e!323655)))

(declare-fun lt!255656 () (_ BitVec 64))

(assert (=> b!561658 (= res!352809 (or (= lt!255656 (select (arr!16937 a!3118) j!142)) (= lt!255656 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561658 (= lt!255656 (select (arr!16937 a!3118) (index!23773 lt!255661)))))

(declare-fun b!561659 () Bool)

(declare-fun res!352799 () Bool)

(assert (=> b!561659 (=> (not res!352799) (not e!323650))))

(assert (=> b!561659 (= res!352799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51408 res!352811) b!561648))

(assert (= (and b!561648 res!352806) b!561655))

(assert (= (and b!561655 res!352807) b!561654))

(assert (= (and b!561654 res!352804) b!561652))

(assert (= (and b!561652 res!352801) b!561647))

(assert (= (and b!561647 res!352808) b!561659))

(assert (= (and b!561659 res!352799) b!561649))

(assert (= (and b!561649 res!352810) b!561651))

(assert (= (and b!561651 res!352805) b!561656))

(assert (= (and b!561656 res!352803) b!561650))

(assert (= (and b!561650 (not res!352800)) b!561658))

(assert (= (and b!561658 (not res!352809)) b!561653))

(assert (= (and b!561653 res!352802) b!561657))

(declare-fun m!539569 () Bool)

(assert (=> b!561654 m!539569))

(declare-fun m!539571 () Bool)

(assert (=> start!51408 m!539571))

(declare-fun m!539573 () Bool)

(assert (=> start!51408 m!539573))

(declare-fun m!539575 () Bool)

(assert (=> b!561653 m!539575))

(assert (=> b!561653 m!539575))

(declare-fun m!539577 () Bool)

(assert (=> b!561653 m!539577))

(assert (=> b!561655 m!539575))

(assert (=> b!561655 m!539575))

(declare-fun m!539579 () Bool)

(assert (=> b!561655 m!539579))

(declare-fun m!539581 () Bool)

(assert (=> b!561652 m!539581))

(assert (=> b!561658 m!539575))

(declare-fun m!539583 () Bool)

(assert (=> b!561658 m!539583))

(declare-fun m!539585 () Bool)

(assert (=> b!561647 m!539585))

(declare-fun m!539587 () Bool)

(assert (=> b!561649 m!539587))

(assert (=> b!561656 m!539575))

(assert (=> b!561656 m!539575))

(declare-fun m!539589 () Bool)

(assert (=> b!561656 m!539589))

(declare-fun m!539591 () Bool)

(assert (=> b!561656 m!539591))

(declare-fun m!539593 () Bool)

(assert (=> b!561656 m!539593))

(declare-fun m!539595 () Bool)

(assert (=> b!561657 m!539595))

(declare-fun m!539597 () Bool)

(assert (=> b!561657 m!539597))

(declare-fun m!539599 () Bool)

(assert (=> b!561651 m!539599))

(assert (=> b!561651 m!539575))

(declare-fun m!539601 () Bool)

(assert (=> b!561651 m!539601))

(assert (=> b!561651 m!539575))

(declare-fun m!539603 () Bool)

(assert (=> b!561651 m!539603))

(declare-fun m!539605 () Bool)

(assert (=> b!561651 m!539605))

(declare-fun m!539607 () Bool)

(assert (=> b!561651 m!539607))

(assert (=> b!561651 m!539575))

(declare-fun m!539609 () Bool)

(assert (=> b!561651 m!539609))

(declare-fun m!539611 () Bool)

(assert (=> b!561659 m!539611))

(push 1)

