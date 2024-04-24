; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52170 () Bool)

(assert start!52170)

(declare-fun b!569033 () Bool)

(declare-fun e!327438 () Bool)

(declare-fun e!327440 () Bool)

(assert (=> b!569033 (= e!327438 e!327440)))

(declare-fun res!358946 () Bool)

(assert (=> b!569033 (=> (not res!358946) (not e!327440))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35640 0))(
  ( (array!35641 (arr!17110 (Array (_ BitVec 32) (_ BitVec 64))) (size!17474 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35640)

(declare-fun lt!259253 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5515 0))(
  ( (MissingZero!5515 (index!24287 (_ BitVec 32))) (Found!5515 (index!24288 (_ BitVec 32))) (Intermediate!5515 (undefined!6327 Bool) (index!24289 (_ BitVec 32)) (x!53321 (_ BitVec 32))) (Undefined!5515) (MissingVacant!5515 (index!24290 (_ BitVec 32))) )
))
(declare-fun lt!259250 () SeekEntryResult!5515)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35640 (_ BitVec 32)) SeekEntryResult!5515)

(assert (=> b!569033 (= res!358946 (= lt!259250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259253 (select (store (arr!17110 a!3118) i!1132 k0!1914) j!142) (array!35641 (store (arr!17110 a!3118) i!1132 k0!1914) (size!17474 a!3118)) mask!3119)))))

(declare-fun lt!259252 () (_ BitVec 32))

(assert (=> b!569033 (= lt!259250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259252 (select (arr!17110 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569033 (= lt!259253 (toIndex!0 (select (store (arr!17110 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569033 (= lt!259252 (toIndex!0 (select (arr!17110 a!3118) j!142) mask!3119))))

(declare-fun b!569034 () Bool)

(assert (=> b!569034 (= e!327440 (not true))))

(declare-fun lt!259251 () SeekEntryResult!5515)

(get-info :version)

(assert (=> b!569034 (and (= lt!259251 (Found!5515 j!142)) (or (undefined!6327 lt!259250) (not ((_ is Intermediate!5515) lt!259250)) (= (select (arr!17110 a!3118) (index!24289 lt!259250)) (select (arr!17110 a!3118) j!142)) (not (= (select (arr!17110 a!3118) (index!24289 lt!259250)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259251 (MissingZero!5515 (index!24289 lt!259250)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35640 (_ BitVec 32)) SeekEntryResult!5515)

(assert (=> b!569034 (= lt!259251 (seekEntryOrOpen!0 (select (arr!17110 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35640 (_ BitVec 32)) Bool)

(assert (=> b!569034 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17803 0))(
  ( (Unit!17804) )
))
(declare-fun lt!259255 () Unit!17803)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17803)

(assert (=> b!569034 (= lt!259255 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569035 () Bool)

(declare-fun res!358953 () Bool)

(assert (=> b!569035 (=> (not res!358953) (not e!327438))))

(assert (=> b!569035 (= res!358953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569036 () Bool)

(declare-fun res!358947 () Bool)

(declare-fun e!327441 () Bool)

(assert (=> b!569036 (=> (not res!358947) (not e!327441))))

(declare-fun arrayContainsKey!0 (array!35640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569036 (= res!358947 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569037 () Bool)

(declare-fun res!358948 () Bool)

(assert (=> b!569037 (=> (not res!358948) (not e!327438))))

(declare-datatypes ((List!11097 0))(
  ( (Nil!11094) (Cons!11093 (h!12117 (_ BitVec 64)) (t!17317 List!11097)) )
))
(declare-fun arrayNoDuplicates!0 (array!35640 (_ BitVec 32) List!11097) Bool)

(assert (=> b!569037 (= res!358948 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11094))))

(declare-fun b!569038 () Bool)

(assert (=> b!569038 (= e!327441 e!327438)))

(declare-fun res!358949 () Bool)

(assert (=> b!569038 (=> (not res!358949) (not e!327438))))

(declare-fun lt!259254 () SeekEntryResult!5515)

(assert (=> b!569038 (= res!358949 (or (= lt!259254 (MissingZero!5515 i!1132)) (= lt!259254 (MissingVacant!5515 i!1132))))))

(assert (=> b!569038 (= lt!259254 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569039 () Bool)

(declare-fun res!358950 () Bool)

(assert (=> b!569039 (=> (not res!358950) (not e!327441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569039 (= res!358950 (validKeyInArray!0 k0!1914))))

(declare-fun res!358952 () Bool)

(assert (=> start!52170 (=> (not res!358952) (not e!327441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52170 (= res!358952 (validMask!0 mask!3119))))

(assert (=> start!52170 e!327441))

(assert (=> start!52170 true))

(declare-fun array_inv!12969 (array!35640) Bool)

(assert (=> start!52170 (array_inv!12969 a!3118)))

(declare-fun b!569040 () Bool)

(declare-fun res!358951 () Bool)

(assert (=> b!569040 (=> (not res!358951) (not e!327441))))

(assert (=> b!569040 (= res!358951 (validKeyInArray!0 (select (arr!17110 a!3118) j!142)))))

(declare-fun b!569041 () Bool)

(declare-fun res!358954 () Bool)

(assert (=> b!569041 (=> (not res!358954) (not e!327441))))

(assert (=> b!569041 (= res!358954 (and (= (size!17474 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17474 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17474 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52170 res!358952) b!569041))

(assert (= (and b!569041 res!358954) b!569040))

(assert (= (and b!569040 res!358951) b!569039))

(assert (= (and b!569039 res!358950) b!569036))

(assert (= (and b!569036 res!358947) b!569038))

(assert (= (and b!569038 res!358949) b!569035))

(assert (= (and b!569035 res!358953) b!569037))

(assert (= (and b!569037 res!358948) b!569033))

(assert (= (and b!569033 res!358946) b!569034))

(declare-fun m!547655 () Bool)

(assert (=> b!569036 m!547655))

(declare-fun m!547657 () Bool)

(assert (=> b!569035 m!547657))

(declare-fun m!547659 () Bool)

(assert (=> start!52170 m!547659))

(declare-fun m!547661 () Bool)

(assert (=> start!52170 m!547661))

(declare-fun m!547663 () Bool)

(assert (=> b!569033 m!547663))

(declare-fun m!547665 () Bool)

(assert (=> b!569033 m!547665))

(assert (=> b!569033 m!547663))

(declare-fun m!547667 () Bool)

(assert (=> b!569033 m!547667))

(declare-fun m!547669 () Bool)

(assert (=> b!569033 m!547669))

(assert (=> b!569033 m!547667))

(declare-fun m!547671 () Bool)

(assert (=> b!569033 m!547671))

(assert (=> b!569033 m!547663))

(declare-fun m!547673 () Bool)

(assert (=> b!569033 m!547673))

(assert (=> b!569033 m!547667))

(declare-fun m!547675 () Bool)

(assert (=> b!569033 m!547675))

(declare-fun m!547677 () Bool)

(assert (=> b!569038 m!547677))

(declare-fun m!547679 () Bool)

(assert (=> b!569037 m!547679))

(declare-fun m!547681 () Bool)

(assert (=> b!569039 m!547681))

(assert (=> b!569034 m!547663))

(declare-fun m!547683 () Bool)

(assert (=> b!569034 m!547683))

(assert (=> b!569034 m!547663))

(declare-fun m!547685 () Bool)

(assert (=> b!569034 m!547685))

(declare-fun m!547687 () Bool)

(assert (=> b!569034 m!547687))

(declare-fun m!547689 () Bool)

(assert (=> b!569034 m!547689))

(assert (=> b!569040 m!547663))

(assert (=> b!569040 m!547663))

(declare-fun m!547691 () Bool)

(assert (=> b!569040 m!547691))

(check-sat (not b!569039) (not b!569033) (not b!569036) (not b!569034) (not start!52170) (not b!569040) (not b!569035) (not b!569037) (not b!569038))
(check-sat)
