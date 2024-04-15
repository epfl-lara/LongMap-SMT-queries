; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26360 () Bool)

(assert start!26360)

(declare-fun b!273105 () Bool)

(declare-fun res!137153 () Bool)

(declare-fun e!175074 () Bool)

(assert (=> b!273105 (=> (not res!137153) (not e!175074))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273105 (= res!137153 (validKeyInArray!0 k0!2581))))

(declare-fun b!273106 () Bool)

(declare-fun e!175071 () Bool)

(assert (=> b!273106 (= e!175074 e!175071)))

(declare-fun res!137151 () Bool)

(assert (=> b!273106 (=> (not res!137151) (not e!175071))))

(declare-datatypes ((SeekEntryResult!1529 0))(
  ( (MissingZero!1529 (index!8286 (_ BitVec 32))) (Found!1529 (index!8287 (_ BitVec 32))) (Intermediate!1529 (undefined!2341 Bool) (index!8288 (_ BitVec 32)) (x!26613 (_ BitVec 32))) (Undefined!1529) (MissingVacant!1529 (index!8289 (_ BitVec 32))) )
))
(declare-fun lt!136099 () SeekEntryResult!1529)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273106 (= res!137151 (or (= lt!136099 (MissingZero!1529 i!1267)) (= lt!136099 (MissingVacant!1529 i!1267))))))

(declare-datatypes ((array!13446 0))(
  ( (array!13447 (arr!6372 (Array (_ BitVec 32) (_ BitVec 64))) (size!6725 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13446)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13446 (_ BitVec 32)) SeekEntryResult!1529)

(assert (=> b!273106 (= lt!136099 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273107 () Bool)

(declare-fun e!175073 () Bool)

(assert (=> b!273107 (= e!175073 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13446 (_ BitVec 32)) Bool)

(assert (=> b!273107 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8511 0))(
  ( (Unit!8512) )
))
(declare-fun lt!136097 () Unit!8511)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13446 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8511)

(assert (=> b!273107 (= lt!136097 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136098 () array!13446)

(assert (=> b!273107 (= (seekEntryOrOpen!0 (select (arr!6372 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6372 a!3325) i!1267 k0!2581) startIndex!26) lt!136098 mask!3868))))

(declare-fun lt!136100 () Unit!8511)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13446 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8511)

(assert (=> b!273107 (= lt!136100 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4153 0))(
  ( (Nil!4150) (Cons!4149 (h!4816 (_ BitVec 64)) (t!9226 List!4153)) )
))
(declare-fun arrayNoDuplicates!0 (array!13446 (_ BitVec 32) List!4153) Bool)

(assert (=> b!273107 (arrayNoDuplicates!0 lt!136098 #b00000000000000000000000000000000 Nil!4150)))

(declare-fun lt!136101 () Unit!8511)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13446 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4153) Unit!8511)

(assert (=> b!273107 (= lt!136101 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4150))))

(declare-fun res!137149 () Bool)

(assert (=> start!26360 (=> (not res!137149) (not e!175074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26360 (= res!137149 (validMask!0 mask!3868))))

(assert (=> start!26360 e!175074))

(declare-fun array_inv!4344 (array!13446) Bool)

(assert (=> start!26360 (array_inv!4344 a!3325)))

(assert (=> start!26360 true))

(declare-fun b!273108 () Bool)

(assert (=> b!273108 (= e!175071 e!175073)))

(declare-fun res!137154 () Bool)

(assert (=> b!273108 (=> (not res!137154) (not e!175073))))

(assert (=> b!273108 (= res!137154 (not (= startIndex!26 i!1267)))))

(assert (=> b!273108 (= lt!136098 (array!13447 (store (arr!6372 a!3325) i!1267 k0!2581) (size!6725 a!3325)))))

(declare-fun b!273109 () Bool)

(declare-fun res!137152 () Bool)

(assert (=> b!273109 (=> (not res!137152) (not e!175074))))

(assert (=> b!273109 (= res!137152 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4150))))

(declare-fun b!273110 () Bool)

(declare-fun res!137147 () Bool)

(assert (=> b!273110 (=> (not res!137147) (not e!175074))))

(declare-fun arrayContainsKey!0 (array!13446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273110 (= res!137147 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273111 () Bool)

(declare-fun res!137155 () Bool)

(assert (=> b!273111 (=> (not res!137155) (not e!175073))))

(assert (=> b!273111 (= res!137155 (validKeyInArray!0 (select (arr!6372 a!3325) startIndex!26)))))

(declare-fun b!273112 () Bool)

(declare-fun res!137148 () Bool)

(assert (=> b!273112 (=> (not res!137148) (not e!175071))))

(assert (=> b!273112 (= res!137148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273113 () Bool)

(declare-fun res!137150 () Bool)

(assert (=> b!273113 (=> (not res!137150) (not e!175074))))

(assert (=> b!273113 (= res!137150 (and (= (size!6725 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6725 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6725 a!3325))))))

(assert (= (and start!26360 res!137149) b!273113))

(assert (= (and b!273113 res!137150) b!273105))

(assert (= (and b!273105 res!137153) b!273109))

(assert (= (and b!273109 res!137152) b!273110))

(assert (= (and b!273110 res!137147) b!273106))

(assert (= (and b!273106 res!137151) b!273112))

(assert (= (and b!273112 res!137148) b!273108))

(assert (= (and b!273108 res!137154) b!273111))

(assert (= (and b!273111 res!137155) b!273107))

(declare-fun m!287789 () Bool)

(assert (=> b!273107 m!287789))

(declare-fun m!287791 () Bool)

(assert (=> b!273107 m!287791))

(assert (=> b!273107 m!287791))

(declare-fun m!287793 () Bool)

(assert (=> b!273107 m!287793))

(declare-fun m!287795 () Bool)

(assert (=> b!273107 m!287795))

(declare-fun m!287797 () Bool)

(assert (=> b!273107 m!287797))

(declare-fun m!287799 () Bool)

(assert (=> b!273107 m!287799))

(declare-fun m!287801 () Bool)

(assert (=> b!273107 m!287801))

(assert (=> b!273107 m!287797))

(declare-fun m!287803 () Bool)

(assert (=> b!273107 m!287803))

(declare-fun m!287805 () Bool)

(assert (=> b!273107 m!287805))

(declare-fun m!287807 () Bool)

(assert (=> b!273107 m!287807))

(assert (=> b!273108 m!287805))

(declare-fun m!287809 () Bool)

(assert (=> start!26360 m!287809))

(declare-fun m!287811 () Bool)

(assert (=> start!26360 m!287811))

(declare-fun m!287813 () Bool)

(assert (=> b!273105 m!287813))

(declare-fun m!287815 () Bool)

(assert (=> b!273109 m!287815))

(assert (=> b!273111 m!287797))

(assert (=> b!273111 m!287797))

(declare-fun m!287817 () Bool)

(assert (=> b!273111 m!287817))

(declare-fun m!287819 () Bool)

(assert (=> b!273112 m!287819))

(declare-fun m!287821 () Bool)

(assert (=> b!273110 m!287821))

(declare-fun m!287823 () Bool)

(assert (=> b!273106 m!287823))

(check-sat (not b!273105) (not b!273112) (not b!273107) (not b!273106) (not start!26360) (not b!273111) (not b!273109) (not b!273110))
(check-sat)
