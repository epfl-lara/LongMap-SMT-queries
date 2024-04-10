; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52126 () Bool)

(assert start!52126)

(declare-fun b!568860 () Bool)

(declare-fun res!358880 () Bool)

(declare-fun e!327322 () Bool)

(assert (=> b!568860 (=> (not res!358880) (not e!327322))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35649 0))(
  ( (array!35650 (arr!17116 (Array (_ BitVec 32) (_ BitVec 64))) (size!17480 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35649)

(assert (=> b!568860 (= res!358880 (and (= (size!17480 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17480 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17480 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568861 () Bool)

(declare-fun res!358878 () Bool)

(declare-fun e!327321 () Bool)

(assert (=> b!568861 (=> (not res!358878) (not e!327321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35649 (_ BitVec 32)) Bool)

(assert (=> b!568861 (= res!358878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568862 () Bool)

(declare-fun res!358881 () Bool)

(assert (=> b!568862 (=> (not res!358881) (not e!327322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568862 (= res!358881 (validKeyInArray!0 (select (arr!17116 a!3118) j!142)))))

(declare-fun res!358879 () Bool)

(assert (=> start!52126 (=> (not res!358879) (not e!327322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52126 (= res!358879 (validMask!0 mask!3119))))

(assert (=> start!52126 e!327322))

(assert (=> start!52126 true))

(declare-fun array_inv!12912 (array!35649) Bool)

(assert (=> start!52126 (array_inv!12912 a!3118)))

(declare-fun b!568863 () Bool)

(declare-fun e!327323 () Bool)

(assert (=> b!568863 (= e!327321 e!327323)))

(declare-fun res!358885 () Bool)

(assert (=> b!568863 (=> (not res!358885) (not e!327323))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!259159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5565 0))(
  ( (MissingZero!5565 (index!24487 (_ BitVec 32))) (Found!5565 (index!24488 (_ BitVec 32))) (Intermediate!5565 (undefined!6377 Bool) (index!24489 (_ BitVec 32)) (x!53368 (_ BitVec 32))) (Undefined!5565) (MissingVacant!5565 (index!24490 (_ BitVec 32))) )
))
(declare-fun lt!259162 () SeekEntryResult!5565)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35649 (_ BitVec 32)) SeekEntryResult!5565)

(assert (=> b!568863 (= res!358885 (= lt!259162 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259159 (select (store (arr!17116 a!3118) i!1132 k0!1914) j!142) (array!35650 (store (arr!17116 a!3118) i!1132 k0!1914) (size!17480 a!3118)) mask!3119)))))

(declare-fun lt!259160 () (_ BitVec 32))

(assert (=> b!568863 (= lt!259162 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259160 (select (arr!17116 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568863 (= lt!259159 (toIndex!0 (select (store (arr!17116 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!568863 (= lt!259160 (toIndex!0 (select (arr!17116 a!3118) j!142) mask!3119))))

(declare-fun b!568864 () Bool)

(assert (=> b!568864 (= e!327323 (not true))))

(declare-fun lt!259158 () SeekEntryResult!5565)

(get-info :version)

(assert (=> b!568864 (and (= lt!259158 (Found!5565 j!142)) (or (undefined!6377 lt!259162) (not ((_ is Intermediate!5565) lt!259162)) (= (select (arr!17116 a!3118) (index!24489 lt!259162)) (select (arr!17116 a!3118) j!142)) (not (= (select (arr!17116 a!3118) (index!24489 lt!259162)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259158 (MissingZero!5565 (index!24489 lt!259162)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35649 (_ BitVec 32)) SeekEntryResult!5565)

(assert (=> b!568864 (= lt!259158 (seekEntryOrOpen!0 (select (arr!17116 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!568864 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17832 0))(
  ( (Unit!17833) )
))
(declare-fun lt!259161 () Unit!17832)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17832)

(assert (=> b!568864 (= lt!259161 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568865 () Bool)

(assert (=> b!568865 (= e!327322 e!327321)))

(declare-fun res!358882 () Bool)

(assert (=> b!568865 (=> (not res!358882) (not e!327321))))

(declare-fun lt!259157 () SeekEntryResult!5565)

(assert (=> b!568865 (= res!358882 (or (= lt!259157 (MissingZero!5565 i!1132)) (= lt!259157 (MissingVacant!5565 i!1132))))))

(assert (=> b!568865 (= lt!259157 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!568866 () Bool)

(declare-fun res!358884 () Bool)

(assert (=> b!568866 (=> (not res!358884) (not e!327322))))

(assert (=> b!568866 (= res!358884 (validKeyInArray!0 k0!1914))))

(declare-fun b!568867 () Bool)

(declare-fun res!358886 () Bool)

(assert (=> b!568867 (=> (not res!358886) (not e!327321))))

(declare-datatypes ((List!11196 0))(
  ( (Nil!11193) (Cons!11192 (h!12213 (_ BitVec 64)) (t!17424 List!11196)) )
))
(declare-fun arrayNoDuplicates!0 (array!35649 (_ BitVec 32) List!11196) Bool)

(assert (=> b!568867 (= res!358886 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11193))))

(declare-fun b!568868 () Bool)

(declare-fun res!358883 () Bool)

(assert (=> b!568868 (=> (not res!358883) (not e!327322))))

(declare-fun arrayContainsKey!0 (array!35649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568868 (= res!358883 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!52126 res!358879) b!568860))

(assert (= (and b!568860 res!358880) b!568862))

(assert (= (and b!568862 res!358881) b!568866))

(assert (= (and b!568866 res!358884) b!568868))

(assert (= (and b!568868 res!358883) b!568865))

(assert (= (and b!568865 res!358882) b!568861))

(assert (= (and b!568861 res!358878) b!568867))

(assert (= (and b!568867 res!358886) b!568863))

(assert (= (and b!568863 res!358885) b!568864))

(declare-fun m!547355 () Bool)

(assert (=> b!568868 m!547355))

(declare-fun m!547357 () Bool)

(assert (=> b!568864 m!547357))

(declare-fun m!547359 () Bool)

(assert (=> b!568864 m!547359))

(declare-fun m!547361 () Bool)

(assert (=> b!568864 m!547361))

(declare-fun m!547363 () Bool)

(assert (=> b!568864 m!547363))

(assert (=> b!568864 m!547357))

(declare-fun m!547365 () Bool)

(assert (=> b!568864 m!547365))

(declare-fun m!547367 () Bool)

(assert (=> b!568865 m!547367))

(declare-fun m!547369 () Bool)

(assert (=> b!568866 m!547369))

(assert (=> b!568862 m!547357))

(assert (=> b!568862 m!547357))

(declare-fun m!547371 () Bool)

(assert (=> b!568862 m!547371))

(assert (=> b!568863 m!547357))

(declare-fun m!547373 () Bool)

(assert (=> b!568863 m!547373))

(assert (=> b!568863 m!547357))

(assert (=> b!568863 m!547357))

(declare-fun m!547375 () Bool)

(assert (=> b!568863 m!547375))

(declare-fun m!547377 () Bool)

(assert (=> b!568863 m!547377))

(assert (=> b!568863 m!547377))

(declare-fun m!547379 () Bool)

(assert (=> b!568863 m!547379))

(declare-fun m!547381 () Bool)

(assert (=> b!568863 m!547381))

(assert (=> b!568863 m!547377))

(declare-fun m!547383 () Bool)

(assert (=> b!568863 m!547383))

(declare-fun m!547385 () Bool)

(assert (=> b!568867 m!547385))

(declare-fun m!547387 () Bool)

(assert (=> b!568861 m!547387))

(declare-fun m!547389 () Bool)

(assert (=> start!52126 m!547389))

(declare-fun m!547391 () Bool)

(assert (=> start!52126 m!547391))

(check-sat (not b!568864) (not b!568866) (not b!568868) (not start!52126) (not b!568863) (not b!568861) (not b!568865) (not b!568862) (not b!568867))
(check-sat)
