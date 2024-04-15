; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50768 () Bool)

(assert start!50768)

(declare-fun b!555251 () Bool)

(declare-fun res!347806 () Bool)

(declare-fun e!320001 () Bool)

(assert (=> b!555251 (=> (not res!347806) (not e!320001))))

(declare-datatypes ((array!35002 0))(
  ( (array!35003 (arr!16811 (Array (_ BitVec 32) (_ BitVec 64))) (size!17176 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35002)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35002 (_ BitVec 32)) Bool)

(assert (=> b!555251 (= res!347806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!347810 () Bool)

(declare-fun e!319999 () Bool)

(assert (=> start!50768 (=> (not res!347810) (not e!319999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50768 (= res!347810 (validMask!0 mask!3119))))

(assert (=> start!50768 e!319999))

(assert (=> start!50768 true))

(declare-fun array_inv!12694 (array!35002) Bool)

(assert (=> start!50768 (array_inv!12694 a!3118)))

(declare-fun b!555252 () Bool)

(declare-fun res!347807 () Bool)

(assert (=> b!555252 (=> (not res!347807) (not e!320001))))

(declare-datatypes ((List!10930 0))(
  ( (Nil!10927) (Cons!10926 (h!11911 (_ BitVec 64)) (t!17149 List!10930)) )
))
(declare-fun arrayNoDuplicates!0 (array!35002 (_ BitVec 32) List!10930) Bool)

(assert (=> b!555252 (= res!347807 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10927))))

(declare-fun b!555253 () Bool)

(declare-fun res!347805 () Bool)

(assert (=> b!555253 (=> (not res!347805) (not e!319999))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555253 (= res!347805 (and (= (size!17176 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17176 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17176 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555254 () Bool)

(declare-fun res!347811 () Bool)

(assert (=> b!555254 (=> (not res!347811) (not e!319999))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555254 (= res!347811 (validKeyInArray!0 k0!1914))))

(declare-fun b!555255 () Bool)

(assert (=> b!555255 (= e!319999 e!320001)))

(declare-fun res!347809 () Bool)

(assert (=> b!555255 (=> (not res!347809) (not e!320001))))

(declare-datatypes ((SeekEntryResult!5257 0))(
  ( (MissingZero!5257 (index!23255 (_ BitVec 32))) (Found!5257 (index!23256 (_ BitVec 32))) (Intermediate!5257 (undefined!6069 Bool) (index!23257 (_ BitVec 32)) (x!52166 (_ BitVec 32))) (Undefined!5257) (MissingVacant!5257 (index!23258 (_ BitVec 32))) )
))
(declare-fun lt!252238 () SeekEntryResult!5257)

(assert (=> b!555255 (= res!347809 (or (= lt!252238 (MissingZero!5257 i!1132)) (= lt!252238 (MissingVacant!5257 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35002 (_ BitVec 32)) SeekEntryResult!5257)

(assert (=> b!555255 (= lt!252238 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555256 () Bool)

(declare-fun res!347808 () Bool)

(assert (=> b!555256 (=> (not res!347808) (not e!319999))))

(assert (=> b!555256 (= res!347808 (validKeyInArray!0 (select (arr!16811 a!3118) j!142)))))

(declare-fun b!555257 () Bool)

(declare-fun e!319998 () Bool)

(assert (=> b!555257 (= e!320001 e!319998)))

(declare-fun res!347813 () Bool)

(assert (=> b!555257 (=> (not res!347813) (not e!319998))))

(declare-fun lt!252241 () SeekEntryResult!5257)

(declare-fun lt!252236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35002 (_ BitVec 32)) SeekEntryResult!5257)

(assert (=> b!555257 (= res!347813 (= lt!252241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252236 (select (store (arr!16811 a!3118) i!1132 k0!1914) j!142) (array!35003 (store (arr!16811 a!3118) i!1132 k0!1914) (size!17176 a!3118)) mask!3119)))))

(declare-fun lt!252239 () (_ BitVec 32))

(assert (=> b!555257 (= lt!252241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252239 (select (arr!16811 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555257 (= lt!252236 (toIndex!0 (select (store (arr!16811 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555257 (= lt!252239 (toIndex!0 (select (arr!16811 a!3118) j!142) mask!3119))))

(declare-fun b!555258 () Bool)

(declare-fun res!347812 () Bool)

(assert (=> b!555258 (=> (not res!347812) (not e!319999))))

(declare-fun arrayContainsKey!0 (array!35002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555258 (= res!347812 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555259 () Bool)

(assert (=> b!555259 (= e!319998 (not true))))

(declare-fun lt!252237 () SeekEntryResult!5257)

(get-info :version)

(assert (=> b!555259 (and (= lt!252237 (Found!5257 j!142)) (or (undefined!6069 lt!252241) (not ((_ is Intermediate!5257) lt!252241)) (= (select (arr!16811 a!3118) (index!23257 lt!252241)) (select (arr!16811 a!3118) j!142)) (not (= (select (arr!16811 a!3118) (index!23257 lt!252241)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252237 (MissingZero!5257 (index!23257 lt!252241)))))))

(assert (=> b!555259 (= lt!252237 (seekEntryOrOpen!0 (select (arr!16811 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555259 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17274 0))(
  ( (Unit!17275) )
))
(declare-fun lt!252240 () Unit!17274)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17274)

(assert (=> b!555259 (= lt!252240 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50768 res!347810) b!555253))

(assert (= (and b!555253 res!347805) b!555256))

(assert (= (and b!555256 res!347808) b!555254))

(assert (= (and b!555254 res!347811) b!555258))

(assert (= (and b!555258 res!347812) b!555255))

(assert (= (and b!555255 res!347809) b!555251))

(assert (= (and b!555251 res!347806) b!555252))

(assert (= (and b!555252 res!347807) b!555257))

(assert (= (and b!555257 res!347813) b!555259))

(declare-fun m!532469 () Bool)

(assert (=> b!555256 m!532469))

(assert (=> b!555256 m!532469))

(declare-fun m!532471 () Bool)

(assert (=> b!555256 m!532471))

(assert (=> b!555259 m!532469))

(declare-fun m!532473 () Bool)

(assert (=> b!555259 m!532473))

(declare-fun m!532475 () Bool)

(assert (=> b!555259 m!532475))

(declare-fun m!532477 () Bool)

(assert (=> b!555259 m!532477))

(assert (=> b!555259 m!532469))

(declare-fun m!532479 () Bool)

(assert (=> b!555259 m!532479))

(declare-fun m!532481 () Bool)

(assert (=> b!555258 m!532481))

(declare-fun m!532483 () Bool)

(assert (=> b!555252 m!532483))

(declare-fun m!532485 () Bool)

(assert (=> b!555254 m!532485))

(assert (=> b!555257 m!532469))

(declare-fun m!532487 () Bool)

(assert (=> b!555257 m!532487))

(assert (=> b!555257 m!532469))

(declare-fun m!532489 () Bool)

(assert (=> b!555257 m!532489))

(declare-fun m!532491 () Bool)

(assert (=> b!555257 m!532491))

(assert (=> b!555257 m!532469))

(declare-fun m!532493 () Bool)

(assert (=> b!555257 m!532493))

(assert (=> b!555257 m!532489))

(declare-fun m!532495 () Bool)

(assert (=> b!555257 m!532495))

(assert (=> b!555257 m!532489))

(declare-fun m!532497 () Bool)

(assert (=> b!555257 m!532497))

(declare-fun m!532499 () Bool)

(assert (=> b!555255 m!532499))

(declare-fun m!532501 () Bool)

(assert (=> b!555251 m!532501))

(declare-fun m!532503 () Bool)

(assert (=> start!50768 m!532503))

(declare-fun m!532505 () Bool)

(assert (=> start!50768 m!532505))

(check-sat (not b!555258) (not b!555252) (not b!555255) (not b!555256) (not b!555259) (not b!555257) (not b!555251) (not b!555254) (not start!50768))
(check-sat)
