; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52190 () Bool)

(assert start!52190)

(declare-fun b!569626 () Bool)

(declare-fun res!359794 () Bool)

(declare-fun e!327606 () Bool)

(assert (=> b!569626 (=> (not res!359794) (not e!327606))))

(declare-datatypes ((array!35722 0))(
  ( (array!35723 (arr!17153 (Array (_ BitVec 32) (_ BitVec 64))) (size!17518 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35722)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569626 (= res!359794 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569627 () Bool)

(declare-fun res!359787 () Bool)

(assert (=> b!569627 (=> (not res!359787) (not e!327606))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!569627 (= res!359787 (and (= (size!17518 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17518 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17518 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569628 () Bool)

(declare-fun res!359788 () Bool)

(assert (=> b!569628 (=> (not res!359788) (not e!327606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569628 (= res!359788 (validKeyInArray!0 k0!1914))))

(declare-fun b!569629 () Bool)

(declare-fun e!327603 () Bool)

(assert (=> b!569629 (= e!327603 (not true))))

(declare-fun e!327605 () Bool)

(assert (=> b!569629 e!327605))

(declare-fun res!359793 () Bool)

(assert (=> b!569629 (=> (not res!359793) (not e!327605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35722 (_ BitVec 32)) Bool)

(assert (=> b!569629 (= res!359793 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17886 0))(
  ( (Unit!17887) )
))
(declare-fun lt!259563 () Unit!17886)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17886)

(assert (=> b!569629 (= lt!259563 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569630 () Bool)

(declare-fun res!359795 () Bool)

(assert (=> b!569630 (=> (not res!359795) (not e!327603))))

(assert (=> b!569630 (= res!359795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569631 () Bool)

(declare-fun res!359792 () Bool)

(assert (=> b!569631 (=> (not res!359792) (not e!327603))))

(declare-datatypes ((List!11272 0))(
  ( (Nil!11269) (Cons!11268 (h!12289 (_ BitVec 64)) (t!17491 List!11272)) )
))
(declare-fun arrayNoDuplicates!0 (array!35722 (_ BitVec 32) List!11272) Bool)

(assert (=> b!569631 (= res!359792 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11269))))

(declare-fun res!359789 () Bool)

(assert (=> start!52190 (=> (not res!359789) (not e!327606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52190 (= res!359789 (validMask!0 mask!3119))))

(assert (=> start!52190 e!327606))

(assert (=> start!52190 true))

(declare-fun array_inv!13036 (array!35722) Bool)

(assert (=> start!52190 (array_inv!13036 a!3118)))

(declare-fun b!569632 () Bool)

(declare-datatypes ((SeekEntryResult!5599 0))(
  ( (MissingZero!5599 (index!24623 (_ BitVec 32))) (Found!5599 (index!24624 (_ BitVec 32))) (Intermediate!5599 (undefined!6411 Bool) (index!24625 (_ BitVec 32)) (x!53501 (_ BitVec 32))) (Undefined!5599) (MissingVacant!5599 (index!24626 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35722 (_ BitVec 32)) SeekEntryResult!5599)

(assert (=> b!569632 (= e!327605 (= (seekEntryOrOpen!0 (select (arr!17153 a!3118) j!142) a!3118 mask!3119) (Found!5599 j!142)))))

(declare-fun b!569633 () Bool)

(assert (=> b!569633 (= e!327606 e!327603)))

(declare-fun res!359786 () Bool)

(assert (=> b!569633 (=> (not res!359786) (not e!327603))))

(declare-fun lt!259564 () SeekEntryResult!5599)

(assert (=> b!569633 (= res!359786 (or (= lt!259564 (MissingZero!5599 i!1132)) (= lt!259564 (MissingVacant!5599 i!1132))))))

(assert (=> b!569633 (= lt!259564 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569634 () Bool)

(declare-fun res!359790 () Bool)

(assert (=> b!569634 (=> (not res!359790) (not e!327606))))

(assert (=> b!569634 (= res!359790 (validKeyInArray!0 (select (arr!17153 a!3118) j!142)))))

(declare-fun b!569635 () Bool)

(declare-fun res!359791 () Bool)

(assert (=> b!569635 (=> (not res!359791) (not e!327603))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35722 (_ BitVec 32)) SeekEntryResult!5599)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569635 (= res!359791 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17153 a!3118) j!142) mask!3119) (select (arr!17153 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17153 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17153 a!3118) i!1132 k0!1914) j!142) (array!35723 (store (arr!17153 a!3118) i!1132 k0!1914) (size!17518 a!3118)) mask!3119)))))

(assert (= (and start!52190 res!359789) b!569627))

(assert (= (and b!569627 res!359787) b!569634))

(assert (= (and b!569634 res!359790) b!569628))

(assert (= (and b!569628 res!359788) b!569626))

(assert (= (and b!569626 res!359794) b!569633))

(assert (= (and b!569633 res!359786) b!569630))

(assert (= (and b!569630 res!359795) b!569631))

(assert (= (and b!569631 res!359792) b!569635))

(assert (= (and b!569635 res!359791) b!569629))

(assert (= (and b!569629 res!359793) b!569632))

(declare-fun m!548021 () Bool)

(assert (=> b!569632 m!548021))

(assert (=> b!569632 m!548021))

(declare-fun m!548023 () Bool)

(assert (=> b!569632 m!548023))

(declare-fun m!548025 () Bool)

(assert (=> b!569628 m!548025))

(declare-fun m!548027 () Bool)

(assert (=> b!569629 m!548027))

(declare-fun m!548029 () Bool)

(assert (=> b!569629 m!548029))

(declare-fun m!548031 () Bool)

(assert (=> start!52190 m!548031))

(declare-fun m!548033 () Bool)

(assert (=> start!52190 m!548033))

(assert (=> b!569634 m!548021))

(assert (=> b!569634 m!548021))

(declare-fun m!548035 () Bool)

(assert (=> b!569634 m!548035))

(declare-fun m!548037 () Bool)

(assert (=> b!569633 m!548037))

(declare-fun m!548039 () Bool)

(assert (=> b!569631 m!548039))

(assert (=> b!569635 m!548021))

(declare-fun m!548041 () Bool)

(assert (=> b!569635 m!548041))

(assert (=> b!569635 m!548021))

(declare-fun m!548043 () Bool)

(assert (=> b!569635 m!548043))

(declare-fun m!548045 () Bool)

(assert (=> b!569635 m!548045))

(assert (=> b!569635 m!548043))

(declare-fun m!548047 () Bool)

(assert (=> b!569635 m!548047))

(assert (=> b!569635 m!548041))

(assert (=> b!569635 m!548021))

(declare-fun m!548049 () Bool)

(assert (=> b!569635 m!548049))

(declare-fun m!548051 () Bool)

(assert (=> b!569635 m!548051))

(assert (=> b!569635 m!548043))

(assert (=> b!569635 m!548045))

(declare-fun m!548053 () Bool)

(assert (=> b!569626 m!548053))

(declare-fun m!548055 () Bool)

(assert (=> b!569630 m!548055))

(check-sat (not b!569626) (not b!569628) (not b!569631) (not b!569633) (not b!569630) (not b!569635) (not start!52190) (not b!569632) (not b!569634) (not b!569629))
(check-sat)
