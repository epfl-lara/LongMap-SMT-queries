; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51326 () Bool)

(assert start!51326)

(declare-fun b!560011 () Bool)

(declare-fun res!351307 () Bool)

(declare-fun e!322640 () Bool)

(assert (=> b!560011 (=> (not res!351307) (not e!322640))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560011 (= res!351307 (validKeyInArray!0 k0!1914))))

(declare-fun b!560013 () Bool)

(declare-fun e!322636 () Bool)

(declare-fun e!322641 () Bool)

(assert (=> b!560013 (= e!322636 e!322641)))

(declare-fun res!351313 () Bool)

(assert (=> b!560013 (=> (not res!351313) (not e!322641))))

(declare-datatypes ((SeekEntryResult!5347 0))(
  ( (MissingZero!5347 (index!23615 (_ BitVec 32))) (Found!5347 (index!23616 (_ BitVec 32))) (Intermediate!5347 (undefined!6159 Bool) (index!23617 (_ BitVec 32)) (x!52541 (_ BitVec 32))) (Undefined!5347) (MissingVacant!5347 (index!23618 (_ BitVec 32))) )
))
(declare-fun lt!254480 () SeekEntryResult!5347)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35200 0))(
  ( (array!35201 (arr!16901 (Array (_ BitVec 32) (_ BitVec 64))) (size!17266 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35200)

(declare-fun lt!254477 () SeekEntryResult!5347)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35200 (_ BitVec 32)) SeekEntryResult!5347)

(assert (=> b!560013 (= res!351313 (= lt!254480 (seekKeyOrZeroReturnVacant!0 (x!52541 lt!254477) (index!23617 lt!254477) (index!23617 lt!254477) (select (arr!16901 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560014 () Bool)

(declare-fun res!351311 () Bool)

(assert (=> b!560014 (=> (not res!351311) (not e!322640))))

(assert (=> b!560014 (= res!351311 (validKeyInArray!0 (select (arr!16901 a!3118) j!142)))))

(declare-fun b!560015 () Bool)

(declare-fun res!351314 () Bool)

(declare-fun e!322638 () Bool)

(assert (=> b!560015 (=> (not res!351314) (not e!322638))))

(declare-datatypes ((List!11020 0))(
  ( (Nil!11017) (Cons!11016 (h!12019 (_ BitVec 64)) (t!17239 List!11020)) )
))
(declare-fun arrayNoDuplicates!0 (array!35200 (_ BitVec 32) List!11020) Bool)

(assert (=> b!560015 (= res!351314 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11017))))

(declare-fun b!560016 () Bool)

(declare-fun e!322637 () Bool)

(assert (=> b!560016 (= e!322637 e!322636)))

(declare-fun res!351306 () Bool)

(assert (=> b!560016 (=> res!351306 e!322636)))

(declare-fun lt!254475 () (_ BitVec 64))

(assert (=> b!560016 (= res!351306 (or (= lt!254475 (select (arr!16901 a!3118) j!142)) (= lt!254475 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560016 (= lt!254475 (select (arr!16901 a!3118) (index!23617 lt!254477)))))

(declare-fun b!560017 () Bool)

(declare-fun res!351312 () Bool)

(assert (=> b!560017 (=> (not res!351312) (not e!322640))))

(declare-fun arrayContainsKey!0 (array!35200 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560017 (= res!351312 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560018 () Bool)

(declare-fun e!322634 () Bool)

(assert (=> b!560018 (= e!322634 (not true))))

(declare-fun e!322635 () Bool)

(assert (=> b!560018 e!322635))

(declare-fun res!351317 () Bool)

(assert (=> b!560018 (=> (not res!351317) (not e!322635))))

(assert (=> b!560018 (= res!351317 (= lt!254480 (Found!5347 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35200 (_ BitVec 32)) SeekEntryResult!5347)

(assert (=> b!560018 (= lt!254480 (seekEntryOrOpen!0 (select (arr!16901 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35200 (_ BitVec 32)) Bool)

(assert (=> b!560018 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17454 0))(
  ( (Unit!17455) )
))
(declare-fun lt!254478 () Unit!17454)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35200 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17454)

(assert (=> b!560018 (= lt!254478 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560019 () Bool)

(assert (=> b!560019 (= e!322638 e!322634)))

(declare-fun res!351310 () Bool)

(assert (=> b!560019 (=> (not res!351310) (not e!322634))))

(declare-fun lt!254481 () array!35200)

(declare-fun lt!254479 () (_ BitVec 32))

(declare-fun lt!254474 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35200 (_ BitVec 32)) SeekEntryResult!5347)

(assert (=> b!560019 (= res!351310 (= lt!254477 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254479 lt!254474 lt!254481 mask!3119)))))

(declare-fun lt!254482 () (_ BitVec 32))

(assert (=> b!560019 (= lt!254477 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254482 (select (arr!16901 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560019 (= lt!254479 (toIndex!0 lt!254474 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560019 (= lt!254474 (select (store (arr!16901 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560019 (= lt!254482 (toIndex!0 (select (arr!16901 a!3118) j!142) mask!3119))))

(assert (=> b!560019 (= lt!254481 (array!35201 (store (arr!16901 a!3118) i!1132 k0!1914) (size!17266 a!3118)))))

(declare-fun b!560020 () Bool)

(declare-fun res!351308 () Bool)

(assert (=> b!560020 (=> (not res!351308) (not e!322638))))

(assert (=> b!560020 (= res!351308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560012 () Bool)

(assert (=> b!560012 (= e!322635 e!322637)))

(declare-fun res!351315 () Bool)

(assert (=> b!560012 (=> res!351315 e!322637)))

(get-info :version)

(assert (=> b!560012 (= res!351315 (or (undefined!6159 lt!254477) (not ((_ is Intermediate!5347) lt!254477))))))

(declare-fun res!351305 () Bool)

(assert (=> start!51326 (=> (not res!351305) (not e!322640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51326 (= res!351305 (validMask!0 mask!3119))))

(assert (=> start!51326 e!322640))

(assert (=> start!51326 true))

(declare-fun array_inv!12784 (array!35200) Bool)

(assert (=> start!51326 (array_inv!12784 a!3118)))

(declare-fun b!560021 () Bool)

(assert (=> b!560021 (= e!322641 (= (seekEntryOrOpen!0 lt!254474 lt!254481 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52541 lt!254477) (index!23617 lt!254477) (index!23617 lt!254477) lt!254474 lt!254481 mask!3119)))))

(declare-fun b!560022 () Bool)

(declare-fun res!351316 () Bool)

(assert (=> b!560022 (=> (not res!351316) (not e!322640))))

(assert (=> b!560022 (= res!351316 (and (= (size!17266 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17266 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17266 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560023 () Bool)

(assert (=> b!560023 (= e!322640 e!322638)))

(declare-fun res!351309 () Bool)

(assert (=> b!560023 (=> (not res!351309) (not e!322638))))

(declare-fun lt!254476 () SeekEntryResult!5347)

(assert (=> b!560023 (= res!351309 (or (= lt!254476 (MissingZero!5347 i!1132)) (= lt!254476 (MissingVacant!5347 i!1132))))))

(assert (=> b!560023 (= lt!254476 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51326 res!351305) b!560022))

(assert (= (and b!560022 res!351316) b!560014))

(assert (= (and b!560014 res!351311) b!560011))

(assert (= (and b!560011 res!351307) b!560017))

(assert (= (and b!560017 res!351312) b!560023))

(assert (= (and b!560023 res!351309) b!560020))

(assert (= (and b!560020 res!351308) b!560015))

(assert (= (and b!560015 res!351314) b!560019))

(assert (= (and b!560019 res!351310) b!560018))

(assert (= (and b!560018 res!351317) b!560012))

(assert (= (and b!560012 (not res!351315)) b!560016))

(assert (= (and b!560016 (not res!351306)) b!560013))

(assert (= (and b!560013 res!351313) b!560021))

(declare-fun m!537257 () Bool)

(assert (=> b!560015 m!537257))

(declare-fun m!537259 () Bool)

(assert (=> b!560020 m!537259))

(declare-fun m!537261 () Bool)

(assert (=> b!560013 m!537261))

(assert (=> b!560013 m!537261))

(declare-fun m!537263 () Bool)

(assert (=> b!560013 m!537263))

(assert (=> b!560019 m!537261))

(declare-fun m!537265 () Bool)

(assert (=> b!560019 m!537265))

(assert (=> b!560019 m!537261))

(declare-fun m!537267 () Bool)

(assert (=> b!560019 m!537267))

(declare-fun m!537269 () Bool)

(assert (=> b!560019 m!537269))

(assert (=> b!560019 m!537261))

(declare-fun m!537271 () Bool)

(assert (=> b!560019 m!537271))

(declare-fun m!537273 () Bool)

(assert (=> b!560019 m!537273))

(declare-fun m!537275 () Bool)

(assert (=> b!560019 m!537275))

(assert (=> b!560014 m!537261))

(assert (=> b!560014 m!537261))

(declare-fun m!537277 () Bool)

(assert (=> b!560014 m!537277))

(declare-fun m!537279 () Bool)

(assert (=> start!51326 m!537279))

(declare-fun m!537281 () Bool)

(assert (=> start!51326 m!537281))

(assert (=> b!560016 m!537261))

(declare-fun m!537283 () Bool)

(assert (=> b!560016 m!537283))

(declare-fun m!537285 () Bool)

(assert (=> b!560021 m!537285))

(declare-fun m!537287 () Bool)

(assert (=> b!560021 m!537287))

(assert (=> b!560018 m!537261))

(assert (=> b!560018 m!537261))

(declare-fun m!537289 () Bool)

(assert (=> b!560018 m!537289))

(declare-fun m!537291 () Bool)

(assert (=> b!560018 m!537291))

(declare-fun m!537293 () Bool)

(assert (=> b!560018 m!537293))

(declare-fun m!537295 () Bool)

(assert (=> b!560011 m!537295))

(declare-fun m!537297 () Bool)

(assert (=> b!560023 m!537297))

(declare-fun m!537299 () Bool)

(assert (=> b!560017 m!537299))

(check-sat (not b!560018) (not b!560011) (not b!560019) (not start!51326) (not b!560015) (not b!560014) (not b!560023) (not b!560017) (not b!560013) (not b!560020) (not b!560021))
(check-sat)
