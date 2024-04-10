; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53500 () Bool)

(assert start!53500)

(declare-fun b!582300 () Bool)

(declare-fun res!370122 () Bool)

(declare-fun e!333940 () Bool)

(assert (=> b!582300 (=> (not res!370122) (not e!333940))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36401 0))(
  ( (array!36402 (arr!17475 (Array (_ BitVec 32) (_ BitVec 64))) (size!17839 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36401)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582300 (= res!370122 (and (= (size!17839 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17839 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17839 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582301 () Bool)

(declare-fun res!370118 () Bool)

(declare-fun e!333941 () Bool)

(assert (=> b!582301 (=> (not res!370118) (not e!333941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36401 (_ BitVec 32)) Bool)

(assert (=> b!582301 (= res!370118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582302 () Bool)

(declare-fun res!370119 () Bool)

(assert (=> b!582302 (=> (not res!370119) (not e!333941))))

(declare-datatypes ((List!11516 0))(
  ( (Nil!11513) (Cons!11512 (h!12557 (_ BitVec 64)) (t!17744 List!11516)) )
))
(declare-fun arrayNoDuplicates!0 (array!36401 (_ BitVec 32) List!11516) Bool)

(assert (=> b!582302 (= res!370119 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11513))))

(declare-fun b!582303 () Bool)

(assert (=> b!582303 (= e!333940 e!333941)))

(declare-fun res!370124 () Bool)

(assert (=> b!582303 (=> (not res!370124) (not e!333941))))

(declare-datatypes ((SeekEntryResult!5915 0))(
  ( (MissingZero!5915 (index!25887 (_ BitVec 32))) (Found!5915 (index!25888 (_ BitVec 32))) (Intermediate!5915 (undefined!6727 Bool) (index!25889 (_ BitVec 32)) (x!54744 (_ BitVec 32))) (Undefined!5915) (MissingVacant!5915 (index!25890 (_ BitVec 32))) )
))
(declare-fun lt!265084 () SeekEntryResult!5915)

(assert (=> b!582303 (= res!370124 (or (= lt!265084 (MissingZero!5915 i!1108)) (= lt!265084 (MissingVacant!5915 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36401 (_ BitVec 32)) SeekEntryResult!5915)

(assert (=> b!582303 (= lt!265084 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582304 () Bool)

(declare-fun res!370121 () Bool)

(assert (=> b!582304 (=> (not res!370121) (not e!333940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582304 (= res!370121 (validKeyInArray!0 (select (arr!17475 a!2986) j!136)))))

(declare-fun b!582305 () Bool)

(declare-fun res!370117 () Bool)

(assert (=> b!582305 (=> (not res!370117) (not e!333941))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582305 (= res!370117 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17475 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17475 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582307 () Bool)

(declare-fun res!370120 () Bool)

(assert (=> b!582307 (=> (not res!370120) (not e!333940))))

(declare-fun arrayContainsKey!0 (array!36401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582307 (= res!370120 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582308 () Bool)

(assert (=> b!582308 (= e!333941 false)))

(declare-fun lt!265083 () SeekEntryResult!5915)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36401 (_ BitVec 32)) SeekEntryResult!5915)

(assert (=> b!582308 (= lt!265083 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17475 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582306 () Bool)

(declare-fun res!370123 () Bool)

(assert (=> b!582306 (=> (not res!370123) (not e!333940))))

(assert (=> b!582306 (= res!370123 (validKeyInArray!0 k!1786))))

(declare-fun res!370116 () Bool)

(assert (=> start!53500 (=> (not res!370116) (not e!333940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53500 (= res!370116 (validMask!0 mask!3053))))

(assert (=> start!53500 e!333940))

(assert (=> start!53500 true))

(declare-fun array_inv!13271 (array!36401) Bool)

(assert (=> start!53500 (array_inv!13271 a!2986)))

(assert (= (and start!53500 res!370116) b!582300))

(assert (= (and b!582300 res!370122) b!582304))

(assert (= (and b!582304 res!370121) b!582306))

(assert (= (and b!582306 res!370123) b!582307))

(assert (= (and b!582307 res!370120) b!582303))

(assert (= (and b!582303 res!370124) b!582301))

(assert (= (and b!582301 res!370118) b!582302))

(assert (= (and b!582302 res!370119) b!582305))

(assert (= (and b!582305 res!370117) b!582308))

(declare-fun m!560809 () Bool)

(assert (=> b!582304 m!560809))

(assert (=> b!582304 m!560809))

(declare-fun m!560811 () Bool)

(assert (=> b!582304 m!560811))

(declare-fun m!560813 () Bool)

(assert (=> b!582301 m!560813))

(assert (=> b!582308 m!560809))

(assert (=> b!582308 m!560809))

(declare-fun m!560815 () Bool)

(assert (=> b!582308 m!560815))

(declare-fun m!560817 () Bool)

(assert (=> b!582303 m!560817))

(declare-fun m!560819 () Bool)

(assert (=> b!582307 m!560819))

(declare-fun m!560821 () Bool)

(assert (=> b!582305 m!560821))

(declare-fun m!560823 () Bool)

(assert (=> b!582305 m!560823))

(declare-fun m!560825 () Bool)

(assert (=> b!582305 m!560825))

(declare-fun m!560827 () Bool)

(assert (=> b!582302 m!560827))

(declare-fun m!560829 () Bool)

(assert (=> start!53500 m!560829))

(declare-fun m!560831 () Bool)

(assert (=> start!53500 m!560831))

(declare-fun m!560833 () Bool)

(assert (=> b!582306 m!560833))

(push 1)

(assert (not b!582307))

(assert (not b!582308))

(assert (not start!53500))

(assert (not b!582302))

(assert (not b!582301))

(assert (not b!582306))

(assert (not b!582303))

(assert (not b!582304))

(check-sat)

