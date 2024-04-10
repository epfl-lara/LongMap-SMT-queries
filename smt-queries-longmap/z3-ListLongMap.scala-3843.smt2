; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52870 () Bool)

(assert start!52870)

(declare-fun b!576302 () Bool)

(declare-fun res!364540 () Bool)

(declare-fun e!331585 () Bool)

(assert (=> b!576302 (=> (not res!364540) (not e!331585))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35958 0))(
  ( (array!35959 (arr!17260 (Array (_ BitVec 32) (_ BitVec 64))) (size!17624 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35958)

(assert (=> b!576302 (= res!364540 (and (= (size!17624 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17624 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17624 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!364543 () Bool)

(assert (=> start!52870 (=> (not res!364543) (not e!331585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52870 (= res!364543 (validMask!0 mask!3119))))

(assert (=> start!52870 e!331585))

(assert (=> start!52870 true))

(declare-fun array_inv!13056 (array!35958) Bool)

(assert (=> start!52870 (array_inv!13056 a!3118)))

(declare-fun b!576303 () Bool)

(declare-fun res!364536 () Bool)

(assert (=> b!576303 (=> (not res!364536) (not e!331585))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576303 (= res!364536 (validKeyInArray!0 k0!1914))))

(declare-fun b!576304 () Bool)

(declare-fun res!364537 () Bool)

(assert (=> b!576304 (=> (not res!364537) (not e!331585))))

(declare-fun arrayContainsKey!0 (array!35958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576304 (= res!364537 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576305 () Bool)

(declare-fun res!364542 () Bool)

(declare-fun e!331586 () Bool)

(assert (=> b!576305 (=> (not res!364542) (not e!331586))))

(declare-datatypes ((List!11340 0))(
  ( (Nil!11337) (Cons!11336 (h!12378 (_ BitVec 64)) (t!17568 List!11340)) )
))
(declare-fun arrayNoDuplicates!0 (array!35958 (_ BitVec 32) List!11340) Bool)

(assert (=> b!576305 (= res!364542 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11337))))

(declare-fun b!576306 () Bool)

(assert (=> b!576306 (= e!331585 e!331586)))

(declare-fun res!364544 () Bool)

(assert (=> b!576306 (=> (not res!364544) (not e!331586))))

(declare-datatypes ((SeekEntryResult!5709 0))(
  ( (MissingZero!5709 (index!25063 (_ BitVec 32))) (Found!5709 (index!25064 (_ BitVec 32))) (Intermediate!5709 (undefined!6521 Bool) (index!25065 (_ BitVec 32)) (x!53956 (_ BitVec 32))) (Undefined!5709) (MissingVacant!5709 (index!25066 (_ BitVec 32))) )
))
(declare-fun lt!263635 () SeekEntryResult!5709)

(assert (=> b!576306 (= res!364544 (or (= lt!263635 (MissingZero!5709 i!1132)) (= lt!263635 (MissingVacant!5709 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35958 (_ BitVec 32)) SeekEntryResult!5709)

(assert (=> b!576306 (= lt!263635 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!576307 () Bool)

(declare-fun res!364538 () Bool)

(assert (=> b!576307 (=> (not res!364538) (not e!331586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35958 (_ BitVec 32)) Bool)

(assert (=> b!576307 (= res!364538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576308 () Bool)

(declare-fun res!364539 () Bool)

(assert (=> b!576308 (=> (not res!364539) (not e!331586))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35958 (_ BitVec 32)) SeekEntryResult!5709)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576308 (= res!364539 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17260 a!3118) j!142) mask!3119) (select (arr!17260 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17260 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17260 a!3118) i!1132 k0!1914) j!142) (array!35959 (store (arr!17260 a!3118) i!1132 k0!1914) (size!17624 a!3118)) mask!3119)))))

(declare-fun b!576309 () Bool)

(declare-fun res!364535 () Bool)

(assert (=> b!576309 (=> (not res!364535) (not e!331585))))

(assert (=> b!576309 (= res!364535 (validKeyInArray!0 (select (arr!17260 a!3118) j!142)))))

(declare-fun e!331587 () Bool)

(declare-fun b!576310 () Bool)

(assert (=> b!576310 (= e!331587 (= (seekEntryOrOpen!0 (select (arr!17260 a!3118) j!142) a!3118 mask!3119) (Found!5709 j!142)))))

(declare-fun b!576311 () Bool)

(assert (=> b!576311 (= e!331586 (not true))))

(assert (=> b!576311 e!331587))

(declare-fun res!364541 () Bool)

(assert (=> b!576311 (=> (not res!364541) (not e!331587))))

(assert (=> b!576311 (= res!364541 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18120 0))(
  ( (Unit!18121) )
))
(declare-fun lt!263634 () Unit!18120)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35958 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18120)

(assert (=> b!576311 (= lt!263634 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52870 res!364543) b!576302))

(assert (= (and b!576302 res!364540) b!576309))

(assert (= (and b!576309 res!364535) b!576303))

(assert (= (and b!576303 res!364536) b!576304))

(assert (= (and b!576304 res!364537) b!576306))

(assert (= (and b!576306 res!364544) b!576307))

(assert (= (and b!576307 res!364538) b!576305))

(assert (= (and b!576305 res!364542) b!576308))

(assert (= (and b!576308 res!364539) b!576311))

(assert (= (and b!576311 res!364541) b!576310))

(declare-fun m!555237 () Bool)

(assert (=> start!52870 m!555237))

(declare-fun m!555239 () Bool)

(assert (=> start!52870 m!555239))

(declare-fun m!555241 () Bool)

(assert (=> b!576311 m!555241))

(declare-fun m!555243 () Bool)

(assert (=> b!576311 m!555243))

(declare-fun m!555245 () Bool)

(assert (=> b!576305 m!555245))

(declare-fun m!555247 () Bool)

(assert (=> b!576307 m!555247))

(declare-fun m!555249 () Bool)

(assert (=> b!576304 m!555249))

(declare-fun m!555251 () Bool)

(assert (=> b!576308 m!555251))

(declare-fun m!555253 () Bool)

(assert (=> b!576308 m!555253))

(assert (=> b!576308 m!555251))

(declare-fun m!555255 () Bool)

(assert (=> b!576308 m!555255))

(declare-fun m!555257 () Bool)

(assert (=> b!576308 m!555257))

(assert (=> b!576308 m!555255))

(declare-fun m!555259 () Bool)

(assert (=> b!576308 m!555259))

(assert (=> b!576308 m!555253))

(assert (=> b!576308 m!555251))

(declare-fun m!555261 () Bool)

(assert (=> b!576308 m!555261))

(declare-fun m!555263 () Bool)

(assert (=> b!576308 m!555263))

(assert (=> b!576308 m!555255))

(assert (=> b!576308 m!555257))

(declare-fun m!555265 () Bool)

(assert (=> b!576303 m!555265))

(declare-fun m!555267 () Bool)

(assert (=> b!576306 m!555267))

(assert (=> b!576309 m!555251))

(assert (=> b!576309 m!555251))

(declare-fun m!555269 () Bool)

(assert (=> b!576309 m!555269))

(assert (=> b!576310 m!555251))

(assert (=> b!576310 m!555251))

(declare-fun m!555271 () Bool)

(assert (=> b!576310 m!555271))

(check-sat (not b!576310) (not b!576309) (not start!52870) (not b!576306) (not b!576305) (not b!576311) (not b!576303) (not b!576308) (not b!576304) (not b!576307))
(check-sat)
