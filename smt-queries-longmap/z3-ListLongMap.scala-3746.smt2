; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51516 () Bool)

(assert start!51516)

(declare-fun b!563018 () Bool)

(declare-fun res!354066 () Bool)

(declare-fun e!324487 () Bool)

(assert (=> b!563018 (=> (not res!354066) (not e!324487))))

(declare-datatypes ((array!35328 0))(
  ( (array!35329 (arr!16963 (Array (_ BitVec 32) (_ BitVec 64))) (size!17327 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35328)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563018 (= res!354066 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563019 () Bool)

(declare-fun res!354072 () Bool)

(assert (=> b!563019 (=> (not res!354072) (not e!324487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563019 (= res!354072 (validKeyInArray!0 k0!1914))))

(declare-fun b!563020 () Bool)

(declare-fun e!324485 () Bool)

(declare-fun e!324486 () Bool)

(assert (=> b!563020 (= e!324485 e!324486)))

(declare-fun res!354067 () Bool)

(assert (=> b!563020 (=> res!354067 e!324486)))

(declare-fun lt!256791 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5368 0))(
  ( (MissingZero!5368 (index!23699 (_ BitVec 32))) (Found!5368 (index!23700 (_ BitVec 32))) (Intermediate!5368 (undefined!6180 Bool) (index!23701 (_ BitVec 32)) (x!52746 (_ BitVec 32))) (Undefined!5368) (MissingVacant!5368 (index!23702 (_ BitVec 32))) )
))
(declare-fun lt!256795 () SeekEntryResult!5368)

(declare-fun lt!256796 () SeekEntryResult!5368)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!256803 () SeekEntryResult!5368)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!563020 (= res!354067 (or (bvslt (index!23701 lt!256795) #b00000000000000000000000000000000) (bvsge (index!23701 lt!256795) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52746 lt!256795) #b01111111111111111111111111111110) (bvslt (x!52746 lt!256795) #b00000000000000000000000000000000) (not (= lt!256791 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16963 a!3118) i!1132 k0!1914) (index!23701 lt!256795)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256803 lt!256796))))))

(declare-fun lt!256798 () SeekEntryResult!5368)

(declare-fun lt!256802 () SeekEntryResult!5368)

(assert (=> b!563020 (= lt!256798 lt!256802)))

(declare-fun lt!256793 () (_ BitVec 64))

(declare-fun lt!256801 () array!35328)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35328 (_ BitVec 32)) SeekEntryResult!5368)

(assert (=> b!563020 (= lt!256802 (seekKeyOrZeroReturnVacant!0 (x!52746 lt!256795) (index!23701 lt!256795) (index!23701 lt!256795) lt!256793 lt!256801 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35328 (_ BitVec 32)) SeekEntryResult!5368)

(assert (=> b!563020 (= lt!256798 (seekEntryOrOpen!0 lt!256793 lt!256801 mask!3119))))

(declare-fun lt!256799 () SeekEntryResult!5368)

(assert (=> b!563020 (= lt!256799 lt!256803)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!563020 (= lt!256803 (seekKeyOrZeroReturnVacant!0 (x!52746 lt!256795) (index!23701 lt!256795) (index!23701 lt!256795) (select (arr!16963 a!3118) j!142) a!3118 mask!3119))))

(declare-fun res!354065 () Bool)

(assert (=> start!51516 (=> (not res!354065) (not e!324487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51516 (= res!354065 (validMask!0 mask!3119))))

(assert (=> start!51516 e!324487))

(assert (=> start!51516 true))

(declare-fun array_inv!12822 (array!35328) Bool)

(assert (=> start!51516 (array_inv!12822 a!3118)))

(declare-fun b!563021 () Bool)

(declare-fun e!324483 () Bool)

(assert (=> b!563021 (= e!324483 e!324485)))

(declare-fun res!354076 () Bool)

(assert (=> b!563021 (=> res!354076 e!324485)))

(assert (=> b!563021 (= res!354076 (or (= lt!256791 (select (arr!16963 a!3118) j!142)) (= lt!256791 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!563021 (= lt!256791 (select (arr!16963 a!3118) (index!23701 lt!256795)))))

(declare-fun b!563022 () Bool)

(assert (=> b!563022 (= e!324486 true)))

(assert (=> b!563022 (= lt!256803 lt!256802)))

(declare-datatypes ((Unit!17581 0))(
  ( (Unit!17582) )
))
(declare-fun lt!256804 () Unit!17581)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35328 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17581)

(assert (=> b!563022 (= lt!256804 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52746 lt!256795) (index!23701 lt!256795) (index!23701 lt!256795) mask!3119))))

(declare-fun b!563023 () Bool)

(declare-fun e!324489 () Bool)

(assert (=> b!563023 (= e!324489 (not e!324483))))

(declare-fun res!354075 () Bool)

(assert (=> b!563023 (=> res!354075 e!324483)))

(get-info :version)

(assert (=> b!563023 (= res!354075 (or (undefined!6180 lt!256795) (not ((_ is Intermediate!5368) lt!256795))))))

(assert (=> b!563023 (= lt!256799 lt!256796)))

(assert (=> b!563023 (= lt!256796 (Found!5368 j!142))))

(assert (=> b!563023 (= lt!256799 (seekEntryOrOpen!0 (select (arr!16963 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35328 (_ BitVec 32)) Bool)

(assert (=> b!563023 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!256800 () Unit!17581)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17581)

(assert (=> b!563023 (= lt!256800 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563024 () Bool)

(declare-fun res!354068 () Bool)

(declare-fun e!324488 () Bool)

(assert (=> b!563024 (=> (not res!354068) (not e!324488))))

(declare-datatypes ((List!10950 0))(
  ( (Nil!10947) (Cons!10946 (h!11952 (_ BitVec 64)) (t!17170 List!10950)) )
))
(declare-fun arrayNoDuplicates!0 (array!35328 (_ BitVec 32) List!10950) Bool)

(assert (=> b!563024 (= res!354068 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10947))))

(declare-fun b!563025 () Bool)

(declare-fun res!354074 () Bool)

(assert (=> b!563025 (=> (not res!354074) (not e!324488))))

(assert (=> b!563025 (= res!354074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563026 () Bool)

(assert (=> b!563026 (= e!324487 e!324488)))

(declare-fun res!354069 () Bool)

(assert (=> b!563026 (=> (not res!354069) (not e!324488))))

(declare-fun lt!256794 () SeekEntryResult!5368)

(assert (=> b!563026 (= res!354069 (or (= lt!256794 (MissingZero!5368 i!1132)) (= lt!256794 (MissingVacant!5368 i!1132))))))

(assert (=> b!563026 (= lt!256794 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563027 () Bool)

(assert (=> b!563027 (= e!324488 e!324489)))

(declare-fun res!354070 () Bool)

(assert (=> b!563027 (=> (not res!354070) (not e!324489))))

(declare-fun lt!256792 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35328 (_ BitVec 32)) SeekEntryResult!5368)

(assert (=> b!563027 (= res!354070 (= lt!256795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256792 lt!256793 lt!256801 mask!3119)))))

(declare-fun lt!256797 () (_ BitVec 32))

(assert (=> b!563027 (= lt!256795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256797 (select (arr!16963 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563027 (= lt!256792 (toIndex!0 lt!256793 mask!3119))))

(assert (=> b!563027 (= lt!256793 (select (store (arr!16963 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!563027 (= lt!256797 (toIndex!0 (select (arr!16963 a!3118) j!142) mask!3119))))

(assert (=> b!563027 (= lt!256801 (array!35329 (store (arr!16963 a!3118) i!1132 k0!1914) (size!17327 a!3118)))))

(declare-fun b!563028 () Bool)

(declare-fun res!354071 () Bool)

(assert (=> b!563028 (=> (not res!354071) (not e!324487))))

(assert (=> b!563028 (= res!354071 (and (= (size!17327 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17327 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17327 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563029 () Bool)

(declare-fun res!354073 () Bool)

(assert (=> b!563029 (=> (not res!354073) (not e!324487))))

(assert (=> b!563029 (= res!354073 (validKeyInArray!0 (select (arr!16963 a!3118) j!142)))))

(assert (= (and start!51516 res!354065) b!563028))

(assert (= (and b!563028 res!354071) b!563029))

(assert (= (and b!563029 res!354073) b!563019))

(assert (= (and b!563019 res!354072) b!563018))

(assert (= (and b!563018 res!354066) b!563026))

(assert (= (and b!563026 res!354069) b!563025))

(assert (= (and b!563025 res!354074) b!563024))

(assert (= (and b!563024 res!354068) b!563027))

(assert (= (and b!563027 res!354070) b!563023))

(assert (= (and b!563023 (not res!354075)) b!563021))

(assert (= (and b!563021 (not res!354076)) b!563020))

(assert (= (and b!563020 (not res!354067)) b!563022))

(declare-fun m!541319 () Bool)

(assert (=> b!563021 m!541319))

(declare-fun m!541321 () Bool)

(assert (=> b!563021 m!541321))

(assert (=> b!563029 m!541319))

(assert (=> b!563029 m!541319))

(declare-fun m!541323 () Bool)

(assert (=> b!563029 m!541323))

(declare-fun m!541325 () Bool)

(assert (=> start!51516 m!541325))

(declare-fun m!541327 () Bool)

(assert (=> start!51516 m!541327))

(declare-fun m!541329 () Bool)

(assert (=> b!563018 m!541329))

(declare-fun m!541331 () Bool)

(assert (=> b!563019 m!541331))

(declare-fun m!541333 () Bool)

(assert (=> b!563022 m!541333))

(assert (=> b!563027 m!541319))

(declare-fun m!541335 () Bool)

(assert (=> b!563027 m!541335))

(assert (=> b!563027 m!541319))

(declare-fun m!541337 () Bool)

(assert (=> b!563027 m!541337))

(assert (=> b!563027 m!541319))

(declare-fun m!541339 () Bool)

(assert (=> b!563027 m!541339))

(declare-fun m!541341 () Bool)

(assert (=> b!563027 m!541341))

(declare-fun m!541343 () Bool)

(assert (=> b!563027 m!541343))

(declare-fun m!541345 () Bool)

(assert (=> b!563027 m!541345))

(declare-fun m!541347 () Bool)

(assert (=> b!563026 m!541347))

(declare-fun m!541349 () Bool)

(assert (=> b!563025 m!541349))

(assert (=> b!563023 m!541319))

(assert (=> b!563023 m!541319))

(declare-fun m!541351 () Bool)

(assert (=> b!563023 m!541351))

(declare-fun m!541353 () Bool)

(assert (=> b!563023 m!541353))

(declare-fun m!541355 () Bool)

(assert (=> b!563023 m!541355))

(assert (=> b!563020 m!541319))

(assert (=> b!563020 m!541343))

(declare-fun m!541357 () Bool)

(assert (=> b!563020 m!541357))

(assert (=> b!563020 m!541319))

(declare-fun m!541359 () Bool)

(assert (=> b!563020 m!541359))

(declare-fun m!541361 () Bool)

(assert (=> b!563020 m!541361))

(declare-fun m!541363 () Bool)

(assert (=> b!563020 m!541363))

(declare-fun m!541365 () Bool)

(assert (=> b!563024 m!541365))

(check-sat (not b!563026) (not b!563020) (not b!563024) (not b!563018) (not b!563023) (not b!563019) (not b!563027) (not b!563022) (not b!563029) (not b!563025) (not start!51516))
(check-sat)
