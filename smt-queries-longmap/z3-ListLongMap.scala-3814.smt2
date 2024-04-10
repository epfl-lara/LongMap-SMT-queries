; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52306 () Bool)

(assert start!52306)

(declare-fun b!570853 () Bool)

(declare-fun e!328313 () Bool)

(assert (=> b!570853 (= e!328313 (not true))))

(declare-fun e!328314 () Bool)

(assert (=> b!570853 e!328314))

(declare-fun res!360640 () Bool)

(assert (=> b!570853 (=> (not res!360640) (not e!328314))))

(declare-datatypes ((SeekEntryResult!5622 0))(
  ( (MissingZero!5622 (index!24715 (_ BitVec 32))) (Found!5622 (index!24716 (_ BitVec 32))) (Intermediate!5622 (undefined!6434 Bool) (index!24717 (_ BitVec 32)) (x!53586 (_ BitVec 32))) (Undefined!5622) (MissingVacant!5622 (index!24718 (_ BitVec 32))) )
))
(declare-fun lt!260259 () SeekEntryResult!5622)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!570853 (= res!360640 (= lt!260259 (Found!5622 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35766 0))(
  ( (array!35767 (arr!17173 (Array (_ BitVec 32) (_ BitVec 64))) (size!17537 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35766)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35766 (_ BitVec 32)) SeekEntryResult!5622)

(assert (=> b!570853 (= lt!260259 (seekEntryOrOpen!0 (select (arr!17173 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35766 (_ BitVec 32)) Bool)

(assert (=> b!570853 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17946 0))(
  ( (Unit!17947) )
))
(declare-fun lt!260262 () Unit!17946)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17946)

(assert (=> b!570853 (= lt!260262 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570854 () Bool)

(declare-fun res!360638 () Bool)

(declare-fun e!328309 () Bool)

(assert (=> b!570854 (=> (not res!360638) (not e!328309))))

(assert (=> b!570854 (= res!360638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570855 () Bool)

(declare-fun res!360642 () Bool)

(declare-fun e!328310 () Bool)

(assert (=> b!570855 (=> (not res!360642) (not e!328310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570855 (= res!360642 (validKeyInArray!0 (select (arr!17173 a!3118) j!142)))))

(declare-fun b!570856 () Bool)

(declare-fun res!360636 () Bool)

(assert (=> b!570856 (=> (not res!360636) (not e!328310))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!570856 (= res!360636 (validKeyInArray!0 k0!1914))))

(declare-fun res!360643 () Bool)

(assert (=> start!52306 (=> (not res!360643) (not e!328310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52306 (= res!360643 (validMask!0 mask!3119))))

(assert (=> start!52306 e!328310))

(assert (=> start!52306 true))

(declare-fun array_inv!12969 (array!35766) Bool)

(assert (=> start!52306 (array_inv!12969 a!3118)))

(declare-fun b!570857 () Bool)

(assert (=> b!570857 (= e!328309 e!328313)))

(declare-fun res!360637 () Bool)

(assert (=> b!570857 (=> (not res!360637) (not e!328313))))

(declare-fun lt!260261 () SeekEntryResult!5622)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!260260 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35766 (_ BitVec 32)) SeekEntryResult!5622)

(assert (=> b!570857 (= res!360637 (= lt!260261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260260 (select (store (arr!17173 a!3118) i!1132 k0!1914) j!142) (array!35767 (store (arr!17173 a!3118) i!1132 k0!1914) (size!17537 a!3118)) mask!3119)))))

(declare-fun lt!260263 () (_ BitVec 32))

(assert (=> b!570857 (= lt!260261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260263 (select (arr!17173 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570857 (= lt!260260 (toIndex!0 (select (store (arr!17173 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570857 (= lt!260263 (toIndex!0 (select (arr!17173 a!3118) j!142) mask!3119))))

(declare-fun b!570858 () Bool)

(declare-fun res!360639 () Bool)

(assert (=> b!570858 (=> (not res!360639) (not e!328309))))

(declare-datatypes ((List!11253 0))(
  ( (Nil!11250) (Cons!11249 (h!12273 (_ BitVec 64)) (t!17481 List!11253)) )
))
(declare-fun arrayNoDuplicates!0 (array!35766 (_ BitVec 32) List!11253) Bool)

(assert (=> b!570858 (= res!360639 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11250))))

(declare-fun b!570859 () Bool)

(declare-fun e!328311 () Bool)

(assert (=> b!570859 (= e!328314 e!328311)))

(declare-fun res!360641 () Bool)

(assert (=> b!570859 (=> res!360641 e!328311)))

(get-info :version)

(assert (=> b!570859 (= res!360641 (or (undefined!6434 lt!260261) (not ((_ is Intermediate!5622) lt!260261)) (= (select (arr!17173 a!3118) (index!24717 lt!260261)) (select (arr!17173 a!3118) j!142)) (= (select (arr!17173 a!3118) (index!24717 lt!260261)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570860 () Bool)

(declare-fun res!360635 () Bool)

(assert (=> b!570860 (=> (not res!360635) (not e!328310))))

(declare-fun arrayContainsKey!0 (array!35766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570860 (= res!360635 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570861 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35766 (_ BitVec 32)) SeekEntryResult!5622)

(assert (=> b!570861 (= e!328311 (= lt!260259 (seekKeyOrZeroReturnVacant!0 (x!53586 lt!260261) (index!24717 lt!260261) (index!24717 lt!260261) (select (arr!17173 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570862 () Bool)

(declare-fun res!360634 () Bool)

(assert (=> b!570862 (=> (not res!360634) (not e!328310))))

(assert (=> b!570862 (= res!360634 (and (= (size!17537 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17537 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17537 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570863 () Bool)

(assert (=> b!570863 (= e!328310 e!328309)))

(declare-fun res!360644 () Bool)

(assert (=> b!570863 (=> (not res!360644) (not e!328309))))

(declare-fun lt!260258 () SeekEntryResult!5622)

(assert (=> b!570863 (= res!360644 (or (= lt!260258 (MissingZero!5622 i!1132)) (= lt!260258 (MissingVacant!5622 i!1132))))))

(assert (=> b!570863 (= lt!260258 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52306 res!360643) b!570862))

(assert (= (and b!570862 res!360634) b!570855))

(assert (= (and b!570855 res!360642) b!570856))

(assert (= (and b!570856 res!360636) b!570860))

(assert (= (and b!570860 res!360635) b!570863))

(assert (= (and b!570863 res!360644) b!570854))

(assert (= (and b!570854 res!360638) b!570858))

(assert (= (and b!570858 res!360639) b!570857))

(assert (= (and b!570857 res!360637) b!570853))

(assert (= (and b!570853 res!360640) b!570859))

(assert (= (and b!570859 (not res!360641)) b!570861))

(declare-fun m!549769 () Bool)

(assert (=> start!52306 m!549769))

(declare-fun m!549771 () Bool)

(assert (=> start!52306 m!549771))

(declare-fun m!549773 () Bool)

(assert (=> b!570858 m!549773))

(declare-fun m!549775 () Bool)

(assert (=> b!570861 m!549775))

(assert (=> b!570861 m!549775))

(declare-fun m!549777 () Bool)

(assert (=> b!570861 m!549777))

(assert (=> b!570853 m!549775))

(assert (=> b!570853 m!549775))

(declare-fun m!549779 () Bool)

(assert (=> b!570853 m!549779))

(declare-fun m!549781 () Bool)

(assert (=> b!570853 m!549781))

(declare-fun m!549783 () Bool)

(assert (=> b!570853 m!549783))

(assert (=> b!570855 m!549775))

(assert (=> b!570855 m!549775))

(declare-fun m!549785 () Bool)

(assert (=> b!570855 m!549785))

(declare-fun m!549787 () Bool)

(assert (=> b!570859 m!549787))

(assert (=> b!570859 m!549775))

(declare-fun m!549789 () Bool)

(assert (=> b!570863 m!549789))

(assert (=> b!570857 m!549775))

(declare-fun m!549791 () Bool)

(assert (=> b!570857 m!549791))

(assert (=> b!570857 m!549775))

(declare-fun m!549793 () Bool)

(assert (=> b!570857 m!549793))

(declare-fun m!549795 () Bool)

(assert (=> b!570857 m!549795))

(assert (=> b!570857 m!549793))

(declare-fun m!549797 () Bool)

(assert (=> b!570857 m!549797))

(assert (=> b!570857 m!549775))

(declare-fun m!549799 () Bool)

(assert (=> b!570857 m!549799))

(assert (=> b!570857 m!549793))

(declare-fun m!549801 () Bool)

(assert (=> b!570857 m!549801))

(declare-fun m!549803 () Bool)

(assert (=> b!570854 m!549803))

(declare-fun m!549805 () Bool)

(assert (=> b!570860 m!549805))

(declare-fun m!549807 () Bool)

(assert (=> b!570856 m!549807))

(check-sat (not b!570856) (not b!570863) (not start!52306) (not b!570854) (not b!570861) (not b!570860) (not b!570853) (not b!570857) (not b!570855) (not b!570858))
(check-sat)
