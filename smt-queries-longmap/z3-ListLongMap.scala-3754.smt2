; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51506 () Bool)

(assert start!51506)

(declare-fun b!563344 () Bool)

(declare-fun e!324589 () Bool)

(declare-fun e!324588 () Bool)

(assert (=> b!563344 (= e!324589 e!324588)))

(declare-fun res!354643 () Bool)

(assert (=> b!563344 (=> (not res!354643) (not e!324588))))

(declare-datatypes ((SeekEntryResult!5437 0))(
  ( (MissingZero!5437 (index!23975 (_ BitVec 32))) (Found!5437 (index!23976 (_ BitVec 32))) (Intermediate!5437 (undefined!6249 Bool) (index!23977 (_ BitVec 32)) (x!52871 (_ BitVec 32))) (Undefined!5437) (MissingVacant!5437 (index!23978 (_ BitVec 32))) )
))
(declare-fun lt!257035 () SeekEntryResult!5437)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563344 (= res!354643 (or (= lt!257035 (MissingZero!5437 i!1132)) (= lt!257035 (MissingVacant!5437 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35380 0))(
  ( (array!35381 (arr!16991 (Array (_ BitVec 32) (_ BitVec 64))) (size!17356 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35380)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35380 (_ BitVec 32)) SeekEntryResult!5437)

(assert (=> b!563344 (= lt!257035 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!354645 () Bool)

(assert (=> start!51506 (=> (not res!354645) (not e!324589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51506 (= res!354645 (validMask!0 mask!3119))))

(assert (=> start!51506 e!324589))

(assert (=> start!51506 true))

(declare-fun array_inv!12874 (array!35380) Bool)

(assert (=> start!51506 (array_inv!12874 a!3118)))

(declare-fun b!563345 () Bool)

(declare-fun res!354639 () Bool)

(assert (=> b!563345 (=> (not res!354639) (not e!324588))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35380 (_ BitVec 32)) SeekEntryResult!5437)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563345 (= res!354639 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16991 a!3118) j!142) mask!3119) (select (arr!16991 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16991 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16991 a!3118) i!1132 k0!1914) j!142) (array!35381 (store (arr!16991 a!3118) i!1132 k0!1914) (size!17356 a!3118)) mask!3119)))))

(declare-fun b!563346 () Bool)

(declare-fun e!324591 () Bool)

(assert (=> b!563346 (= e!324591 (= (seekEntryOrOpen!0 (select (arr!16991 a!3118) j!142) a!3118 mask!3119) (Found!5437 j!142)))))

(declare-fun b!563347 () Bool)

(declare-fun res!354638 () Bool)

(assert (=> b!563347 (=> (not res!354638) (not e!324589))))

(assert (=> b!563347 (= res!354638 (and (= (size!17356 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17356 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17356 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563348 () Bool)

(declare-fun res!354644 () Bool)

(assert (=> b!563348 (=> (not res!354644) (not e!324588))))

(declare-datatypes ((List!11110 0))(
  ( (Nil!11107) (Cons!11106 (h!12109 (_ BitVec 64)) (t!17329 List!11110)) )
))
(declare-fun arrayNoDuplicates!0 (array!35380 (_ BitVec 32) List!11110) Bool)

(assert (=> b!563348 (= res!354644 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11107))))

(declare-fun b!563349 () Bool)

(declare-fun res!354640 () Bool)

(assert (=> b!563349 (=> (not res!354640) (not e!324589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563349 (= res!354640 (validKeyInArray!0 (select (arr!16991 a!3118) j!142)))))

(declare-fun b!563350 () Bool)

(declare-fun res!354641 () Bool)

(assert (=> b!563350 (=> (not res!354641) (not e!324588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35380 (_ BitVec 32)) Bool)

(assert (=> b!563350 (= res!354641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563351 () Bool)

(assert (=> b!563351 (= e!324588 (not true))))

(assert (=> b!563351 e!324591))

(declare-fun res!354646 () Bool)

(assert (=> b!563351 (=> (not res!354646) (not e!324591))))

(assert (=> b!563351 (= res!354646 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17634 0))(
  ( (Unit!17635) )
))
(declare-fun lt!257034 () Unit!17634)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17634)

(assert (=> b!563351 (= lt!257034 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563352 () Bool)

(declare-fun res!354647 () Bool)

(assert (=> b!563352 (=> (not res!354647) (not e!324589))))

(declare-fun arrayContainsKey!0 (array!35380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563352 (= res!354647 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563353 () Bool)

(declare-fun res!354642 () Bool)

(assert (=> b!563353 (=> (not res!354642) (not e!324589))))

(assert (=> b!563353 (= res!354642 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51506 res!354645) b!563347))

(assert (= (and b!563347 res!354638) b!563349))

(assert (= (and b!563349 res!354640) b!563353))

(assert (= (and b!563353 res!354642) b!563352))

(assert (= (and b!563352 res!354647) b!563344))

(assert (= (and b!563344 res!354643) b!563350))

(assert (= (and b!563350 res!354641) b!563348))

(assert (= (and b!563348 res!354644) b!563345))

(assert (= (and b!563345 res!354639) b!563351))

(assert (= (and b!563351 res!354646) b!563346))

(declare-fun m!541223 () Bool)

(assert (=> b!563345 m!541223))

(declare-fun m!541225 () Bool)

(assert (=> b!563345 m!541225))

(assert (=> b!563345 m!541223))

(declare-fun m!541227 () Bool)

(assert (=> b!563345 m!541227))

(declare-fun m!541229 () Bool)

(assert (=> b!563345 m!541229))

(assert (=> b!563345 m!541227))

(declare-fun m!541231 () Bool)

(assert (=> b!563345 m!541231))

(assert (=> b!563345 m!541225))

(assert (=> b!563345 m!541223))

(declare-fun m!541233 () Bool)

(assert (=> b!563345 m!541233))

(declare-fun m!541235 () Bool)

(assert (=> b!563345 m!541235))

(assert (=> b!563345 m!541227))

(assert (=> b!563345 m!541229))

(declare-fun m!541237 () Bool)

(assert (=> b!563350 m!541237))

(declare-fun m!541239 () Bool)

(assert (=> b!563348 m!541239))

(declare-fun m!541241 () Bool)

(assert (=> b!563344 m!541241))

(assert (=> b!563346 m!541223))

(assert (=> b!563346 m!541223))

(declare-fun m!541243 () Bool)

(assert (=> b!563346 m!541243))

(declare-fun m!541245 () Bool)

(assert (=> b!563353 m!541245))

(declare-fun m!541247 () Bool)

(assert (=> start!51506 m!541247))

(declare-fun m!541249 () Bool)

(assert (=> start!51506 m!541249))

(declare-fun m!541251 () Bool)

(assert (=> b!563351 m!541251))

(declare-fun m!541253 () Bool)

(assert (=> b!563351 m!541253))

(assert (=> b!563349 m!541223))

(assert (=> b!563349 m!541223))

(declare-fun m!541255 () Bool)

(assert (=> b!563349 m!541255))

(declare-fun m!541257 () Bool)

(assert (=> b!563352 m!541257))

(check-sat (not b!563348) (not b!563346) (not b!563349) (not b!563350) (not b!563345) (not b!563352) (not b!563353) (not start!51506) (not b!563344) (not b!563351))
(check-sat)
