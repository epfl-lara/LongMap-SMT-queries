; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53644 () Bool)

(assert start!53644)

(declare-fun b!584502 () Bool)

(declare-fun res!372327 () Bool)

(declare-fun e!334673 () Bool)

(assert (=> b!584502 (=> (not res!372327) (not e!334673))))

(declare-datatypes ((array!36545 0))(
  ( (array!36546 (arr!17547 (Array (_ BitVec 32) (_ BitVec 64))) (size!17911 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36545)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584502 (= res!372327 (validKeyInArray!0 (select (arr!17547 a!2986) j!136)))))

(declare-fun b!584503 () Bool)

(declare-fun res!372321 () Bool)

(assert (=> b!584503 (=> (not res!372321) (not e!334673))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!584503 (= res!372321 (validKeyInArray!0 k!1786))))

(declare-fun b!584504 () Bool)

(declare-fun res!372329 () Bool)

(assert (=> b!584504 (=> (not res!372329) (not e!334673))))

(declare-fun arrayContainsKey!0 (array!36545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584504 (= res!372329 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!372328 () Bool)

(assert (=> start!53644 (=> (not res!372328) (not e!334673))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53644 (= res!372328 (validMask!0 mask!3053))))

(assert (=> start!53644 e!334673))

(assert (=> start!53644 true))

(declare-fun array_inv!13343 (array!36545) Bool)

(assert (=> start!53644 (array_inv!13343 a!2986)))

(declare-fun b!584505 () Bool)

(declare-fun e!334671 () Bool)

(declare-fun e!334674 () Bool)

(assert (=> b!584505 (= e!334671 e!334674)))

(declare-fun res!372325 () Bool)

(assert (=> b!584505 (=> (not res!372325) (not e!334674))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265591 () (_ BitVec 32))

(assert (=> b!584505 (= res!372325 (and (bvsge lt!265591 #b00000000000000000000000000000000) (bvslt lt!265591 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584505 (= lt!265591 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584506 () Bool)

(assert (=> b!584506 (= e!334673 e!334671)))

(declare-fun res!372318 () Bool)

(assert (=> b!584506 (=> (not res!372318) (not e!334671))))

(declare-datatypes ((SeekEntryResult!5987 0))(
  ( (MissingZero!5987 (index!26175 (_ BitVec 32))) (Found!5987 (index!26176 (_ BitVec 32))) (Intermediate!5987 (undefined!6799 Bool) (index!26177 (_ BitVec 32)) (x!55008 (_ BitVec 32))) (Undefined!5987) (MissingVacant!5987 (index!26178 (_ BitVec 32))) )
))
(declare-fun lt!265589 () SeekEntryResult!5987)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584506 (= res!372318 (or (= lt!265589 (MissingZero!5987 i!1108)) (= lt!265589 (MissingVacant!5987 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36545 (_ BitVec 32)) SeekEntryResult!5987)

(assert (=> b!584506 (= lt!265589 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!584507 () Bool)

(assert (=> b!584507 (= e!334674 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!265590 () SeekEntryResult!5987)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36545 (_ BitVec 32)) SeekEntryResult!5987)

(assert (=> b!584507 (= lt!265590 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265591 vacantSpotIndex!68 (select (arr!17547 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584508 () Bool)

(declare-fun res!372323 () Bool)

(assert (=> b!584508 (=> (not res!372323) (not e!334671))))

(declare-datatypes ((List!11588 0))(
  ( (Nil!11585) (Cons!11584 (h!12629 (_ BitVec 64)) (t!17816 List!11588)) )
))
(declare-fun arrayNoDuplicates!0 (array!36545 (_ BitVec 32) List!11588) Bool)

(assert (=> b!584508 (= res!372323 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11585))))

(declare-fun b!584509 () Bool)

(declare-fun res!372320 () Bool)

(assert (=> b!584509 (=> (not res!372320) (not e!334673))))

(assert (=> b!584509 (= res!372320 (and (= (size!17911 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17911 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17911 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584510 () Bool)

(declare-fun res!372326 () Bool)

(assert (=> b!584510 (=> (not res!372326) (not e!334671))))

(assert (=> b!584510 (= res!372326 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17547 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17547 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584511 () Bool)

(declare-fun res!372322 () Bool)

(assert (=> b!584511 (=> (not res!372322) (not e!334671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36545 (_ BitVec 32)) Bool)

(assert (=> b!584511 (= res!372322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584512 () Bool)

(declare-fun res!372319 () Bool)

(assert (=> b!584512 (=> (not res!372319) (not e!334671))))

(assert (=> b!584512 (= res!372319 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17547 a!2986) index!984) (select (arr!17547 a!2986) j!136))) (not (= (select (arr!17547 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584513 () Bool)

(declare-fun res!372324 () Bool)

(assert (=> b!584513 (=> (not res!372324) (not e!334671))))

(assert (=> b!584513 (= res!372324 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17547 a!2986) j!136) a!2986 mask!3053) (Found!5987 j!136)))))

(assert (= (and start!53644 res!372328) b!584509))

(assert (= (and b!584509 res!372320) b!584502))

(assert (= (and b!584502 res!372327) b!584503))

(assert (= (and b!584503 res!372321) b!584504))

(assert (= (and b!584504 res!372329) b!584506))

(assert (= (and b!584506 res!372318) b!584511))

(assert (= (and b!584511 res!372322) b!584508))

(assert (= (and b!584508 res!372323) b!584510))

(assert (= (and b!584510 res!372326) b!584513))

(assert (= (and b!584513 res!372324) b!584512))

(assert (= (and b!584512 res!372319) b!584505))

(assert (= (and b!584505 res!372325) b!584507))

(declare-fun m!562849 () Bool)

(assert (=> b!584506 m!562849))

(declare-fun m!562851 () Bool)

(assert (=> b!584502 m!562851))

(assert (=> b!584502 m!562851))

(declare-fun m!562853 () Bool)

(assert (=> b!584502 m!562853))

(declare-fun m!562855 () Bool)

(assert (=> b!584512 m!562855))

(assert (=> b!584512 m!562851))

(assert (=> b!584513 m!562851))

(assert (=> b!584513 m!562851))

(declare-fun m!562857 () Bool)

(assert (=> b!584513 m!562857))

(declare-fun m!562859 () Bool)

(assert (=> b!584503 m!562859))

(declare-fun m!562861 () Bool)

(assert (=> b!584508 m!562861))

(assert (=> b!584507 m!562851))

(assert (=> b!584507 m!562851))

(declare-fun m!562863 () Bool)

(assert (=> b!584507 m!562863))

(declare-fun m!562865 () Bool)

(assert (=> start!53644 m!562865))

(declare-fun m!562867 () Bool)

(assert (=> start!53644 m!562867))

(declare-fun m!562869 () Bool)

(assert (=> b!584511 m!562869))

(declare-fun m!562871 () Bool)

(assert (=> b!584504 m!562871))

(declare-fun m!562873 () Bool)

(assert (=> b!584505 m!562873))

(declare-fun m!562875 () Bool)

(assert (=> b!584510 m!562875))

(declare-fun m!562877 () Bool)

(assert (=> b!584510 m!562877))

(declare-fun m!562879 () Bool)

(assert (=> b!584510 m!562879))

(push 1)

(assert (not start!53644))

(assert (not b!584511))

(assert (not b!584502))

(assert (not b!584506))

(assert (not b!584507))

(assert (not b!584503))

(assert (not b!584513))

(assert (not b!584505))

(assert (not b!584508))

(assert (not b!584504))

(check-sat)

(pop 1)

