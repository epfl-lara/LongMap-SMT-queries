; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52192 () Bool)

(assert start!52192)

(declare-fun b!569751 () Bool)

(declare-fun res!359774 () Bool)

(declare-fun e!327719 () Bool)

(assert (=> b!569751 (=> (not res!359774) (not e!327719))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35715 0))(
  ( (array!35716 (arr!17149 (Array (_ BitVec 32) (_ BitVec 64))) (size!17513 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35715)

(assert (=> b!569751 (= res!359774 (and (= (size!17513 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17513 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17513 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569752 () Bool)

(declare-fun res!359775 () Bool)

(assert (=> b!569752 (=> (not res!359775) (not e!327719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569752 (= res!359775 (validKeyInArray!0 (select (arr!17149 a!3118) j!142)))))

(declare-fun b!569753 () Bool)

(declare-fun res!359773 () Bool)

(declare-fun e!327720 () Bool)

(assert (=> b!569753 (=> (not res!359773) (not e!327720))))

(declare-datatypes ((List!11229 0))(
  ( (Nil!11226) (Cons!11225 (h!12246 (_ BitVec 64)) (t!17457 List!11229)) )
))
(declare-fun arrayNoDuplicates!0 (array!35715 (_ BitVec 32) List!11229) Bool)

(assert (=> b!569753 (= res!359773 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11226))))

(declare-fun b!569754 () Bool)

(declare-fun res!359771 () Bool)

(assert (=> b!569754 (=> (not res!359771) (not e!327719))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!569754 (= res!359771 (validKeyInArray!0 k0!1914))))

(declare-fun b!569755 () Bool)

(declare-fun e!327717 () Bool)

(assert (=> b!569755 (= e!327720 e!327717)))

(declare-fun res!359769 () Bool)

(assert (=> b!569755 (=> (not res!359769) (not e!327717))))

(declare-fun lt!259752 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5598 0))(
  ( (MissingZero!5598 (index!24619 (_ BitVec 32))) (Found!5598 (index!24620 (_ BitVec 32))) (Intermediate!5598 (undefined!6410 Bool) (index!24621 (_ BitVec 32)) (x!53489 (_ BitVec 32))) (Undefined!5598) (MissingVacant!5598 (index!24622 (_ BitVec 32))) )
))
(declare-fun lt!259754 () SeekEntryResult!5598)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35715 (_ BitVec 32)) SeekEntryResult!5598)

(assert (=> b!569755 (= res!359769 (= lt!259754 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259752 (select (store (arr!17149 a!3118) i!1132 k0!1914) j!142) (array!35716 (store (arr!17149 a!3118) i!1132 k0!1914) (size!17513 a!3118)) mask!3119)))))

(declare-fun lt!259755 () (_ BitVec 32))

(assert (=> b!569755 (= lt!259754 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259755 (select (arr!17149 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569755 (= lt!259752 (toIndex!0 (select (store (arr!17149 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569755 (= lt!259755 (toIndex!0 (select (arr!17149 a!3118) j!142) mask!3119))))

(declare-fun b!569757 () Bool)

(declare-fun res!359777 () Bool)

(assert (=> b!569757 (=> (not res!359777) (not e!327720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35715 (_ BitVec 32)) Bool)

(assert (=> b!569757 (= res!359777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569758 () Bool)

(assert (=> b!569758 (= e!327717 (not true))))

(declare-fun lt!259751 () SeekEntryResult!5598)

(get-info :version)

(assert (=> b!569758 (and (= lt!259751 (Found!5598 j!142)) (or (undefined!6410 lt!259754) (not ((_ is Intermediate!5598) lt!259754)) (= (select (arr!17149 a!3118) (index!24621 lt!259754)) (select (arr!17149 a!3118) j!142)) (not (= (select (arr!17149 a!3118) (index!24621 lt!259754)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259751 (MissingZero!5598 (index!24621 lt!259754)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35715 (_ BitVec 32)) SeekEntryResult!5598)

(assert (=> b!569758 (= lt!259751 (seekEntryOrOpen!0 (select (arr!17149 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569758 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17898 0))(
  ( (Unit!17899) )
))
(declare-fun lt!259753 () Unit!17898)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17898)

(assert (=> b!569758 (= lt!259753 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569759 () Bool)

(declare-fun res!359776 () Bool)

(assert (=> b!569759 (=> (not res!359776) (not e!327719))))

(declare-fun arrayContainsKey!0 (array!35715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569759 (= res!359776 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569756 () Bool)

(assert (=> b!569756 (= e!327719 e!327720)))

(declare-fun res!359772 () Bool)

(assert (=> b!569756 (=> (not res!359772) (not e!327720))))

(declare-fun lt!259756 () SeekEntryResult!5598)

(assert (=> b!569756 (= res!359772 (or (= lt!259756 (MissingZero!5598 i!1132)) (= lt!259756 (MissingVacant!5598 i!1132))))))

(assert (=> b!569756 (= lt!259756 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!359770 () Bool)

(assert (=> start!52192 (=> (not res!359770) (not e!327719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52192 (= res!359770 (validMask!0 mask!3119))))

(assert (=> start!52192 e!327719))

(assert (=> start!52192 true))

(declare-fun array_inv!12945 (array!35715) Bool)

(assert (=> start!52192 (array_inv!12945 a!3118)))

(assert (= (and start!52192 res!359770) b!569751))

(assert (= (and b!569751 res!359774) b!569752))

(assert (= (and b!569752 res!359775) b!569754))

(assert (= (and b!569754 res!359771) b!569759))

(assert (= (and b!569759 res!359776) b!569756))

(assert (= (and b!569756 res!359772) b!569757))

(assert (= (and b!569757 res!359777) b!569753))

(assert (= (and b!569753 res!359773) b!569755))

(assert (= (and b!569755 res!359769) b!569758))

(declare-fun m!548609 () Bool)

(assert (=> start!52192 m!548609))

(declare-fun m!548611 () Bool)

(assert (=> start!52192 m!548611))

(declare-fun m!548613 () Bool)

(assert (=> b!569753 m!548613))

(declare-fun m!548615 () Bool)

(assert (=> b!569755 m!548615))

(declare-fun m!548617 () Bool)

(assert (=> b!569755 m!548617))

(assert (=> b!569755 m!548615))

(declare-fun m!548619 () Bool)

(assert (=> b!569755 m!548619))

(declare-fun m!548621 () Bool)

(assert (=> b!569755 m!548621))

(assert (=> b!569755 m!548619))

(declare-fun m!548623 () Bool)

(assert (=> b!569755 m!548623))

(assert (=> b!569755 m!548615))

(declare-fun m!548625 () Bool)

(assert (=> b!569755 m!548625))

(assert (=> b!569755 m!548619))

(declare-fun m!548627 () Bool)

(assert (=> b!569755 m!548627))

(declare-fun m!548629 () Bool)

(assert (=> b!569757 m!548629))

(assert (=> b!569758 m!548615))

(declare-fun m!548631 () Bool)

(assert (=> b!569758 m!548631))

(declare-fun m!548633 () Bool)

(assert (=> b!569758 m!548633))

(declare-fun m!548635 () Bool)

(assert (=> b!569758 m!548635))

(assert (=> b!569758 m!548615))

(declare-fun m!548637 () Bool)

(assert (=> b!569758 m!548637))

(declare-fun m!548639 () Bool)

(assert (=> b!569756 m!548639))

(assert (=> b!569752 m!548615))

(assert (=> b!569752 m!548615))

(declare-fun m!548641 () Bool)

(assert (=> b!569752 m!548641))

(declare-fun m!548643 () Bool)

(assert (=> b!569754 m!548643))

(declare-fun m!548645 () Bool)

(assert (=> b!569759 m!548645))

(check-sat (not b!569758) (not b!569759) (not b!569752) (not b!569756) (not b!569755) (not b!569757) (not b!569753) (not start!52192) (not b!569754))
(check-sat)
