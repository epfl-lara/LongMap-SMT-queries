; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53634 () Bool)

(assert start!53634)

(declare-fun b!584339 () Bool)

(declare-fun res!372297 () Bool)

(declare-fun e!334534 () Bool)

(assert (=> b!584339 (=> (not res!372297) (not e!334534))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36549 0))(
  ( (array!36550 (arr!17549 (Array (_ BitVec 32) (_ BitVec 64))) (size!17914 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36549)

(assert (=> b!584339 (= res!372297 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17549 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17549 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584340 () Bool)

(declare-fun res!372299 () Bool)

(assert (=> b!584340 (=> (not res!372299) (not e!334534))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!584340 (= res!372299 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17549 a!2986) index!984) (select (arr!17549 a!2986) j!136))) (not (= (select (arr!17549 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!372307 () Bool)

(declare-fun e!334535 () Bool)

(assert (=> start!53634 (=> (not res!372307) (not e!334535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53634 (= res!372307 (validMask!0 mask!3053))))

(assert (=> start!53634 e!334535))

(assert (=> start!53634 true))

(declare-fun array_inv!13432 (array!36549) Bool)

(assert (=> start!53634 (array_inv!13432 a!2986)))

(declare-fun b!584341 () Bool)

(assert (=> b!584341 (= e!334535 e!334534)))

(declare-fun res!372300 () Bool)

(assert (=> b!584341 (=> (not res!372300) (not e!334534))))

(declare-datatypes ((SeekEntryResult!5986 0))(
  ( (MissingZero!5986 (index!26171 (_ BitVec 32))) (Found!5986 (index!26172 (_ BitVec 32))) (Intermediate!5986 (undefined!6798 Bool) (index!26173 (_ BitVec 32)) (x!55010 (_ BitVec 32))) (Undefined!5986) (MissingVacant!5986 (index!26174 (_ BitVec 32))) )
))
(declare-fun lt!265384 () SeekEntryResult!5986)

(assert (=> b!584341 (= res!372300 (or (= lt!265384 (MissingZero!5986 i!1108)) (= lt!265384 (MissingVacant!5986 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36549 (_ BitVec 32)) SeekEntryResult!5986)

(assert (=> b!584341 (= lt!265384 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584342 () Bool)

(declare-fun res!372305 () Bool)

(assert (=> b!584342 (=> (not res!372305) (not e!334535))))

(assert (=> b!584342 (= res!372305 (and (= (size!17914 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17914 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17914 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584343 () Bool)

(declare-fun res!372302 () Bool)

(assert (=> b!584343 (=> (not res!372302) (not e!334535))))

(declare-fun arrayContainsKey!0 (array!36549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584343 (= res!372302 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584344 () Bool)

(declare-fun res!372304 () Bool)

(assert (=> b!584344 (=> (not res!372304) (not e!334534))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36549 (_ BitVec 32)) SeekEntryResult!5986)

(assert (=> b!584344 (= res!372304 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17549 a!2986) j!136) a!2986 mask!3053) (Found!5986 j!136)))))

(declare-fun b!584345 () Bool)

(declare-fun res!372303 () Bool)

(assert (=> b!584345 (=> (not res!372303) (not e!334535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584345 (= res!372303 (validKeyInArray!0 k0!1786))))

(declare-fun b!584346 () Bool)

(declare-fun res!372308 () Bool)

(assert (=> b!584346 (=> (not res!372308) (not e!334534))))

(declare-datatypes ((List!11629 0))(
  ( (Nil!11626) (Cons!11625 (h!12670 (_ BitVec 64)) (t!17848 List!11629)) )
))
(declare-fun arrayNoDuplicates!0 (array!36549 (_ BitVec 32) List!11629) Bool)

(assert (=> b!584346 (= res!372308 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11626))))

(declare-fun b!584347 () Bool)

(declare-fun res!372298 () Bool)

(assert (=> b!584347 (=> (not res!372298) (not e!334534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36549 (_ BitVec 32)) Bool)

(assert (=> b!584347 (= res!372298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584348 () Bool)

(declare-fun e!334533 () Bool)

(assert (=> b!584348 (= e!334533 false)))

(declare-fun lt!265383 () (_ BitVec 32))

(declare-fun lt!265382 () SeekEntryResult!5986)

(assert (=> b!584348 (= lt!265382 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265383 vacantSpotIndex!68 (select (arr!17549 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584349 () Bool)

(assert (=> b!584349 (= e!334534 e!334533)))

(declare-fun res!372306 () Bool)

(assert (=> b!584349 (=> (not res!372306) (not e!334533))))

(assert (=> b!584349 (= res!372306 (and (bvsge lt!265383 #b00000000000000000000000000000000) (bvslt lt!265383 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584349 (= lt!265383 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584350 () Bool)

(declare-fun res!372301 () Bool)

(assert (=> b!584350 (=> (not res!372301) (not e!334535))))

(assert (=> b!584350 (= res!372301 (validKeyInArray!0 (select (arr!17549 a!2986) j!136)))))

(assert (= (and start!53634 res!372307) b!584342))

(assert (= (and b!584342 res!372305) b!584350))

(assert (= (and b!584350 res!372301) b!584345))

(assert (= (and b!584345 res!372303) b!584343))

(assert (= (and b!584343 res!372302) b!584341))

(assert (= (and b!584341 res!372300) b!584347))

(assert (= (and b!584347 res!372298) b!584346))

(assert (= (and b!584346 res!372308) b!584339))

(assert (= (and b!584339 res!372297) b!584344))

(assert (= (and b!584344 res!372304) b!584340))

(assert (= (and b!584340 res!372299) b!584349))

(assert (= (and b!584349 res!372306) b!584348))

(declare-fun m!562159 () Bool)

(assert (=> b!584341 m!562159))

(declare-fun m!562161 () Bool)

(assert (=> b!584345 m!562161))

(declare-fun m!562163 () Bool)

(assert (=> b!584339 m!562163))

(declare-fun m!562165 () Bool)

(assert (=> b!584339 m!562165))

(declare-fun m!562167 () Bool)

(assert (=> b!584339 m!562167))

(declare-fun m!562169 () Bool)

(assert (=> b!584343 m!562169))

(declare-fun m!562171 () Bool)

(assert (=> b!584348 m!562171))

(assert (=> b!584348 m!562171))

(declare-fun m!562173 () Bool)

(assert (=> b!584348 m!562173))

(declare-fun m!562175 () Bool)

(assert (=> start!53634 m!562175))

(declare-fun m!562177 () Bool)

(assert (=> start!53634 m!562177))

(declare-fun m!562179 () Bool)

(assert (=> b!584340 m!562179))

(assert (=> b!584340 m!562171))

(assert (=> b!584344 m!562171))

(assert (=> b!584344 m!562171))

(declare-fun m!562181 () Bool)

(assert (=> b!584344 m!562181))

(declare-fun m!562183 () Bool)

(assert (=> b!584349 m!562183))

(assert (=> b!584350 m!562171))

(assert (=> b!584350 m!562171))

(declare-fun m!562185 () Bool)

(assert (=> b!584350 m!562185))

(declare-fun m!562187 () Bool)

(assert (=> b!584346 m!562187))

(declare-fun m!562189 () Bool)

(assert (=> b!584347 m!562189))

(check-sat (not b!584349) (not b!584346) (not b!584344) (not start!53634) (not b!584350) (not b!584341) (not b!584345) (not b!584343) (not b!584348) (not b!584347))
(check-sat)
