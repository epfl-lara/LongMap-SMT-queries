; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53466 () Bool)

(assert start!53466)

(declare-fun b!581339 () Bool)

(declare-fun res!369053 () Bool)

(declare-fun e!333691 () Bool)

(assert (=> b!581339 (=> (not res!369053) (not e!333691))))

(declare-datatypes ((array!36312 0))(
  ( (array!36313 (arr!17428 (Array (_ BitVec 32) (_ BitVec 64))) (size!17792 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36312)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36312 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581339 (= res!369053 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581340 () Bool)

(declare-fun res!369051 () Bool)

(assert (=> b!581340 (=> (not res!369051) (not e!333691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581340 (= res!369051 (validKeyInArray!0 k0!1786))))

(declare-fun b!581341 () Bool)

(declare-fun e!333692 () Bool)

(assert (=> b!581341 (= e!333692 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5824 0))(
  ( (MissingZero!5824 (index!25523 (_ BitVec 32))) (Found!5824 (index!25524 (_ BitVec 32))) (Intermediate!5824 (undefined!6636 Bool) (index!25525 (_ BitVec 32)) (x!54544 (_ BitVec 32))) (Undefined!5824) (MissingVacant!5824 (index!25526 (_ BitVec 32))) )
))
(declare-fun lt!264961 () SeekEntryResult!5824)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36312 (_ BitVec 32)) SeekEntryResult!5824)

(assert (=> b!581341 (= lt!264961 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17428 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581342 () Bool)

(declare-fun res!369054 () Bool)

(assert (=> b!581342 (=> (not res!369054) (not e!333692))))

(declare-datatypes ((List!11376 0))(
  ( (Nil!11373) (Cons!11372 (h!12420 (_ BitVec 64)) (t!17596 List!11376)) )
))
(declare-fun arrayNoDuplicates!0 (array!36312 (_ BitVec 32) List!11376) Bool)

(assert (=> b!581342 (= res!369054 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11373))))

(declare-fun b!581343 () Bool)

(declare-fun res!369057 () Bool)

(assert (=> b!581343 (=> (not res!369057) (not e!333691))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581343 (= res!369057 (and (= (size!17792 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17792 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17792 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581345 () Bool)

(assert (=> b!581345 (= e!333691 e!333692)))

(declare-fun res!369052 () Bool)

(assert (=> b!581345 (=> (not res!369052) (not e!333692))))

(declare-fun lt!264960 () SeekEntryResult!5824)

(assert (=> b!581345 (= res!369052 (or (= lt!264960 (MissingZero!5824 i!1108)) (= lt!264960 (MissingVacant!5824 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36312 (_ BitVec 32)) SeekEntryResult!5824)

(assert (=> b!581345 (= lt!264960 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!369055 () Bool)

(assert (=> start!53466 (=> (not res!369055) (not e!333691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53466 (= res!369055 (validMask!0 mask!3053))))

(assert (=> start!53466 e!333691))

(assert (=> start!53466 true))

(declare-fun array_inv!13287 (array!36312) Bool)

(assert (=> start!53466 (array_inv!13287 a!2986)))

(declare-fun b!581344 () Bool)

(declare-fun res!369050 () Bool)

(assert (=> b!581344 (=> (not res!369050) (not e!333692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36312 (_ BitVec 32)) Bool)

(assert (=> b!581344 (= res!369050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581346 () Bool)

(declare-fun res!369056 () Bool)

(assert (=> b!581346 (=> (not res!369056) (not e!333692))))

(assert (=> b!581346 (= res!369056 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17428 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17428 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581347 () Bool)

(declare-fun res!369058 () Bool)

(assert (=> b!581347 (=> (not res!369058) (not e!333691))))

(assert (=> b!581347 (= res!369058 (validKeyInArray!0 (select (arr!17428 a!2986) j!136)))))

(assert (= (and start!53466 res!369055) b!581343))

(assert (= (and b!581343 res!369057) b!581347))

(assert (= (and b!581347 res!369058) b!581340))

(assert (= (and b!581340 res!369051) b!581339))

(assert (= (and b!581339 res!369053) b!581345))

(assert (= (and b!581345 res!369052) b!581344))

(assert (= (and b!581344 res!369050) b!581342))

(assert (= (and b!581342 res!369054) b!581346))

(assert (= (and b!581346 res!369056) b!581341))

(declare-fun m!560045 () Bool)

(assert (=> b!581339 m!560045))

(declare-fun m!560047 () Bool)

(assert (=> b!581342 m!560047))

(declare-fun m!560049 () Bool)

(assert (=> b!581346 m!560049))

(declare-fun m!560051 () Bool)

(assert (=> b!581346 m!560051))

(declare-fun m!560053 () Bool)

(assert (=> b!581346 m!560053))

(declare-fun m!560055 () Bool)

(assert (=> b!581341 m!560055))

(assert (=> b!581341 m!560055))

(declare-fun m!560057 () Bool)

(assert (=> b!581341 m!560057))

(declare-fun m!560059 () Bool)

(assert (=> start!53466 m!560059))

(declare-fun m!560061 () Bool)

(assert (=> start!53466 m!560061))

(declare-fun m!560063 () Bool)

(assert (=> b!581345 m!560063))

(assert (=> b!581347 m!560055))

(assert (=> b!581347 m!560055))

(declare-fun m!560065 () Bool)

(assert (=> b!581347 m!560065))

(declare-fun m!560067 () Bool)

(assert (=> b!581340 m!560067))

(declare-fun m!560069 () Bool)

(assert (=> b!581344 m!560069))

(check-sat (not b!581339) (not b!581344) (not b!581345) (not b!581341) (not b!581347) (not b!581342) (not b!581340) (not start!53466))
(check-sat)
