; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52124 () Bool)

(assert start!52124)

(declare-fun b!568833 () Bool)

(declare-fun e!327311 () Bool)

(declare-fun e!327310 () Bool)

(assert (=> b!568833 (= e!327311 e!327310)))

(declare-fun res!358856 () Bool)

(assert (=> b!568833 (=> (not res!358856) (not e!327310))))

(declare-datatypes ((SeekEntryResult!5564 0))(
  ( (MissingZero!5564 (index!24483 (_ BitVec 32))) (Found!5564 (index!24484 (_ BitVec 32))) (Intermediate!5564 (undefined!6376 Bool) (index!24485 (_ BitVec 32)) (x!53367 (_ BitVec 32))) (Undefined!5564) (MissingVacant!5564 (index!24486 (_ BitVec 32))) )
))
(declare-fun lt!259140 () SeekEntryResult!5564)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!568833 (= res!358856 (or (= lt!259140 (MissingZero!5564 i!1132)) (= lt!259140 (MissingVacant!5564 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35647 0))(
  ( (array!35648 (arr!17115 (Array (_ BitVec 32) (_ BitVec 64))) (size!17479 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35647)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35647 (_ BitVec 32)) SeekEntryResult!5564)

(assert (=> b!568833 (= lt!259140 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!568834 () Bool)

(declare-fun e!327312 () Bool)

(assert (=> b!568834 (= e!327310 e!327312)))

(declare-fun res!358851 () Bool)

(assert (=> b!568834 (=> (not res!358851) (not e!327312))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!259141 () (_ BitVec 32))

(declare-fun lt!259139 () SeekEntryResult!5564)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35647 (_ BitVec 32)) SeekEntryResult!5564)

(assert (=> b!568834 (= res!358851 (= lt!259139 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259141 (select (store (arr!17115 a!3118) i!1132 k!1914) j!142) (array!35648 (store (arr!17115 a!3118) i!1132 k!1914) (size!17479 a!3118)) mask!3119)))))

(declare-fun lt!259143 () (_ BitVec 32))

(assert (=> b!568834 (= lt!259139 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259143 (select (arr!17115 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568834 (= lt!259141 (toIndex!0 (select (store (arr!17115 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!568834 (= lt!259143 (toIndex!0 (select (arr!17115 a!3118) j!142) mask!3119))))

(declare-fun b!568835 () Bool)

(declare-fun res!358855 () Bool)

(assert (=> b!568835 (=> (not res!358855) (not e!327311))))

(assert (=> b!568835 (= res!358855 (and (= (size!17479 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17479 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17479 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568836 () Bool)

(declare-fun res!358859 () Bool)

(assert (=> b!568836 (=> (not res!358859) (not e!327310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35647 (_ BitVec 32)) Bool)

(assert (=> b!568836 (= res!358859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568837 () Bool)

(declare-fun res!358857 () Bool)

(assert (=> b!568837 (=> (not res!358857) (not e!327311))))

(declare-fun arrayContainsKey!0 (array!35647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568837 (= res!358857 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568838 () Bool)

(declare-fun res!358852 () Bool)

(assert (=> b!568838 (=> (not res!358852) (not e!327310))))

(declare-datatypes ((List!11195 0))(
  ( (Nil!11192) (Cons!11191 (h!12212 (_ BitVec 64)) (t!17423 List!11195)) )
))
(declare-fun arrayNoDuplicates!0 (array!35647 (_ BitVec 32) List!11195) Bool)

(assert (=> b!568838 (= res!358852 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11192))))

(declare-fun b!568840 () Bool)

(declare-fun res!358858 () Bool)

(assert (=> b!568840 (=> (not res!358858) (not e!327311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568840 (= res!358858 (validKeyInArray!0 (select (arr!17115 a!3118) j!142)))))

(declare-fun b!568841 () Bool)

(assert (=> b!568841 (= e!327312 (not true))))

(declare-fun lt!259144 () SeekEntryResult!5564)

(assert (=> b!568841 (and (= lt!259144 (Found!5564 j!142)) (or (undefined!6376 lt!259139) (not (is-Intermediate!5564 lt!259139)) (= (select (arr!17115 a!3118) (index!24485 lt!259139)) (select (arr!17115 a!3118) j!142)) (not (= (select (arr!17115 a!3118) (index!24485 lt!259139)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259144 (MissingZero!5564 (index!24485 lt!259139)))))))

(assert (=> b!568841 (= lt!259144 (seekEntryOrOpen!0 (select (arr!17115 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!568841 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17830 0))(
  ( (Unit!17831) )
))
(declare-fun lt!259142 () Unit!17830)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35647 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17830)

(assert (=> b!568841 (= lt!259142 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568839 () Bool)

(declare-fun res!358853 () Bool)

(assert (=> b!568839 (=> (not res!358853) (not e!327311))))

(assert (=> b!568839 (= res!358853 (validKeyInArray!0 k!1914))))

(declare-fun res!358854 () Bool)

(assert (=> start!52124 (=> (not res!358854) (not e!327311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52124 (= res!358854 (validMask!0 mask!3119))))

(assert (=> start!52124 e!327311))

(assert (=> start!52124 true))

(declare-fun array_inv!12911 (array!35647) Bool)

(assert (=> start!52124 (array_inv!12911 a!3118)))

(assert (= (and start!52124 res!358854) b!568835))

(assert (= (and b!568835 res!358855) b!568840))

(assert (= (and b!568840 res!358858) b!568839))

(assert (= (and b!568839 res!358853) b!568837))

(assert (= (and b!568837 res!358857) b!568833))

(assert (= (and b!568833 res!358856) b!568836))

(assert (= (and b!568836 res!358859) b!568838))

(assert (= (and b!568838 res!358852) b!568834))

(assert (= (and b!568834 res!358851) b!568841))

(declare-fun m!547317 () Bool)

(assert (=> b!568837 m!547317))

(declare-fun m!547319 () Bool)

(assert (=> b!568838 m!547319))

(declare-fun m!547321 () Bool)

(assert (=> b!568839 m!547321))

(declare-fun m!547323 () Bool)

(assert (=> b!568841 m!547323))

(declare-fun m!547325 () Bool)

(assert (=> b!568841 m!547325))

(declare-fun m!547327 () Bool)

(assert (=> b!568841 m!547327))

(declare-fun m!547329 () Bool)

(assert (=> b!568841 m!547329))

(assert (=> b!568841 m!547323))

(declare-fun m!547331 () Bool)

(assert (=> b!568841 m!547331))

(assert (=> b!568834 m!547323))

(declare-fun m!547333 () Bool)

(assert (=> b!568834 m!547333))

(assert (=> b!568834 m!547323))

(declare-fun m!547335 () Bool)

(assert (=> b!568834 m!547335))

(declare-fun m!547337 () Bool)

(assert (=> b!568834 m!547337))

(assert (=> b!568834 m!547335))

(declare-fun m!547339 () Bool)

(assert (=> b!568834 m!547339))

(assert (=> b!568834 m!547335))

(declare-fun m!547341 () Bool)

(assert (=> b!568834 m!547341))

(assert (=> b!568834 m!547323))

(declare-fun m!547343 () Bool)

(assert (=> b!568834 m!547343))

(declare-fun m!547345 () Bool)

(assert (=> b!568833 m!547345))

(declare-fun m!547347 () Bool)

(assert (=> b!568836 m!547347))

(assert (=> b!568840 m!547323))

(assert (=> b!568840 m!547323))

(declare-fun m!547349 () Bool)

(assert (=> b!568840 m!547349))

(declare-fun m!547351 () Bool)

(assert (=> start!52124 m!547351))

(declare-fun m!547353 () Bool)

(assert (=> start!52124 m!547353))

(push 1)

