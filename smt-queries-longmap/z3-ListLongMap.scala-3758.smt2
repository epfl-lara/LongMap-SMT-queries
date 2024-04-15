; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51530 () Bool)

(assert start!51530)

(declare-fun b!563713 () Bool)

(declare-fun res!355015 () Bool)

(declare-fun e!324761 () Bool)

(assert (=> b!563713 (=> (not res!355015) (not e!324761))))

(declare-datatypes ((array!35404 0))(
  ( (array!35405 (arr!17003 (Array (_ BitVec 32) (_ BitVec 64))) (size!17368 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35404)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35404 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563713 (= res!355015 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563714 () Bool)

(declare-fun res!355014 () Bool)

(assert (=> b!563714 (=> (not res!355014) (not e!324761))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563714 (= res!355014 (and (= (size!17368 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17368 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17368 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563715 () Bool)

(declare-fun res!355008 () Bool)

(assert (=> b!563715 (=> (not res!355008) (not e!324761))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563715 (= res!355008 (validKeyInArray!0 (select (arr!17003 a!3118) j!142)))))

(declare-fun b!563716 () Bool)

(declare-fun res!355016 () Bool)

(declare-fun e!324760 () Bool)

(assert (=> b!563716 (=> (not res!355016) (not e!324760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35404 (_ BitVec 32)) Bool)

(assert (=> b!563716 (= res!355016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563717 () Bool)

(assert (=> b!563717 (= e!324761 e!324760)))

(declare-fun res!355011 () Bool)

(assert (=> b!563717 (=> (not res!355011) (not e!324760))))

(declare-datatypes ((SeekEntryResult!5449 0))(
  ( (MissingZero!5449 (index!24023 (_ BitVec 32))) (Found!5449 (index!24024 (_ BitVec 32))) (Intermediate!5449 (undefined!6261 Bool) (index!24025 (_ BitVec 32)) (x!52915 (_ BitVec 32))) (Undefined!5449) (MissingVacant!5449 (index!24026 (_ BitVec 32))) )
))
(declare-fun lt!257179 () SeekEntryResult!5449)

(assert (=> b!563717 (= res!355011 (or (= lt!257179 (MissingZero!5449 i!1132)) (= lt!257179 (MissingVacant!5449 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35404 (_ BitVec 32)) SeekEntryResult!5449)

(assert (=> b!563717 (= lt!257179 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun e!324762 () Bool)

(declare-fun b!563718 () Bool)

(assert (=> b!563718 (= e!324762 (= (seekEntryOrOpen!0 (select (arr!17003 a!3118) j!142) a!3118 mask!3119) (Found!5449 j!142)))))

(declare-fun b!563719 () Bool)

(declare-fun res!355007 () Bool)

(assert (=> b!563719 (=> (not res!355007) (not e!324760))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35404 (_ BitVec 32)) SeekEntryResult!5449)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563719 (= res!355007 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17003 a!3118) j!142) mask!3119) (select (arr!17003 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17003 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17003 a!3118) i!1132 k0!1914) j!142) (array!35405 (store (arr!17003 a!3118) i!1132 k0!1914) (size!17368 a!3118)) mask!3119)))))

(declare-fun b!563720 () Bool)

(assert (=> b!563720 (= e!324760 (not true))))

(assert (=> b!563720 e!324762))

(declare-fun res!355012 () Bool)

(assert (=> b!563720 (=> (not res!355012) (not e!324762))))

(assert (=> b!563720 (= res!355012 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17658 0))(
  ( (Unit!17659) )
))
(declare-fun lt!257178 () Unit!17658)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35404 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17658)

(assert (=> b!563720 (= lt!257178 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563721 () Bool)

(declare-fun res!355010 () Bool)

(assert (=> b!563721 (=> (not res!355010) (not e!324761))))

(assert (=> b!563721 (= res!355010 (validKeyInArray!0 k0!1914))))

(declare-fun res!355013 () Bool)

(assert (=> start!51530 (=> (not res!355013) (not e!324761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51530 (= res!355013 (validMask!0 mask!3119))))

(assert (=> start!51530 e!324761))

(assert (=> start!51530 true))

(declare-fun array_inv!12886 (array!35404) Bool)

(assert (=> start!51530 (array_inv!12886 a!3118)))

(declare-fun b!563722 () Bool)

(declare-fun res!355009 () Bool)

(assert (=> b!563722 (=> (not res!355009) (not e!324760))))

(declare-datatypes ((List!11122 0))(
  ( (Nil!11119) (Cons!11118 (h!12121 (_ BitVec 64)) (t!17341 List!11122)) )
))
(declare-fun arrayNoDuplicates!0 (array!35404 (_ BitVec 32) List!11122) Bool)

(assert (=> b!563722 (= res!355009 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11119))))

(assert (= (and start!51530 res!355013) b!563714))

(assert (= (and b!563714 res!355014) b!563715))

(assert (= (and b!563715 res!355008) b!563721))

(assert (= (and b!563721 res!355010) b!563713))

(assert (= (and b!563713 res!355015) b!563717))

(assert (= (and b!563717 res!355011) b!563716))

(assert (= (and b!563716 res!355016) b!563722))

(assert (= (and b!563722 res!355009) b!563719))

(assert (= (and b!563719 res!355007) b!563720))

(assert (= (and b!563720 res!355012) b!563718))

(declare-fun m!541661 () Bool)

(assert (=> b!563717 m!541661))

(declare-fun m!541663 () Bool)

(assert (=> b!563713 m!541663))

(declare-fun m!541665 () Bool)

(assert (=> b!563718 m!541665))

(assert (=> b!563718 m!541665))

(declare-fun m!541667 () Bool)

(assert (=> b!563718 m!541667))

(declare-fun m!541669 () Bool)

(assert (=> b!563720 m!541669))

(declare-fun m!541671 () Bool)

(assert (=> b!563720 m!541671))

(assert (=> b!563715 m!541665))

(assert (=> b!563715 m!541665))

(declare-fun m!541673 () Bool)

(assert (=> b!563715 m!541673))

(declare-fun m!541675 () Bool)

(assert (=> b!563721 m!541675))

(declare-fun m!541677 () Bool)

(assert (=> b!563716 m!541677))

(declare-fun m!541679 () Bool)

(assert (=> b!563722 m!541679))

(assert (=> b!563719 m!541665))

(declare-fun m!541681 () Bool)

(assert (=> b!563719 m!541681))

(assert (=> b!563719 m!541665))

(declare-fun m!541683 () Bool)

(assert (=> b!563719 m!541683))

(declare-fun m!541685 () Bool)

(assert (=> b!563719 m!541685))

(assert (=> b!563719 m!541683))

(declare-fun m!541687 () Bool)

(assert (=> b!563719 m!541687))

(assert (=> b!563719 m!541681))

(assert (=> b!563719 m!541665))

(declare-fun m!541689 () Bool)

(assert (=> b!563719 m!541689))

(declare-fun m!541691 () Bool)

(assert (=> b!563719 m!541691))

(assert (=> b!563719 m!541683))

(assert (=> b!563719 m!541685))

(declare-fun m!541693 () Bool)

(assert (=> start!51530 m!541693))

(declare-fun m!541695 () Bool)

(assert (=> start!51530 m!541695))

(check-sat (not b!563721) (not start!51530) (not b!563716) (not b!563713) (not b!563717) (not b!563718) (not b!563719) (not b!563720) (not b!563722) (not b!563715))
(check-sat)
