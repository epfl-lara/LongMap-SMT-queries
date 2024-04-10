; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53636 () Bool)

(assert start!53636)

(declare-fun b!584358 () Bool)

(declare-fun res!372183 () Bool)

(declare-fun e!334625 () Bool)

(assert (=> b!584358 (=> (not res!372183) (not e!334625))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36537 0))(
  ( (array!36538 (arr!17543 (Array (_ BitVec 32) (_ BitVec 64))) (size!17907 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36537)

(assert (=> b!584358 (= res!372183 (and (= (size!17907 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17907 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17907 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584360 () Bool)

(declare-fun res!372176 () Bool)

(declare-fun e!334626 () Bool)

(assert (=> b!584360 (=> (not res!372176) (not e!334626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36537 (_ BitVec 32)) Bool)

(assert (=> b!584360 (= res!372176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584361 () Bool)

(declare-fun res!372182 () Bool)

(assert (=> b!584361 (=> (not res!372182) (not e!334626))))

(declare-datatypes ((List!11584 0))(
  ( (Nil!11581) (Cons!11580 (h!12625 (_ BitVec 64)) (t!17812 List!11584)) )
))
(declare-fun arrayNoDuplicates!0 (array!36537 (_ BitVec 32) List!11584) Bool)

(assert (=> b!584361 (= res!372182 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11581))))

(declare-fun b!584362 () Bool)

(declare-fun res!372177 () Bool)

(assert (=> b!584362 (=> (not res!372177) (not e!334625))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584362 (= res!372177 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584363 () Bool)

(declare-fun res!372178 () Bool)

(assert (=> b!584363 (=> (not res!372178) (not e!334625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584363 (= res!372178 (validKeyInArray!0 k!1786))))

(declare-fun b!584364 () Bool)

(declare-fun e!334624 () Bool)

(assert (=> b!584364 (= e!334626 e!334624)))

(declare-fun res!372184 () Bool)

(assert (=> b!584364 (=> (not res!372184) (not e!334624))))

(declare-fun lt!265555 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!584364 (= res!372184 (and (bvsge lt!265555 #b00000000000000000000000000000000) (bvslt lt!265555 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584364 (= lt!265555 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584365 () Bool)

(assert (=> b!584365 (= e!334624 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5983 0))(
  ( (MissingZero!5983 (index!26159 (_ BitVec 32))) (Found!5983 (index!26160 (_ BitVec 32))) (Intermediate!5983 (undefined!6795 Bool) (index!26161 (_ BitVec 32)) (x!54988 (_ BitVec 32))) (Undefined!5983) (MissingVacant!5983 (index!26162 (_ BitVec 32))) )
))
(declare-fun lt!265554 () SeekEntryResult!5983)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36537 (_ BitVec 32)) SeekEntryResult!5983)

(assert (=> b!584365 (= lt!265554 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265555 vacantSpotIndex!68 (select (arr!17543 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584366 () Bool)

(declare-fun res!372181 () Bool)

(assert (=> b!584366 (=> (not res!372181) (not e!334626))))

(assert (=> b!584366 (= res!372181 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17543 a!2986) j!136) a!2986 mask!3053) (Found!5983 j!136)))))

(declare-fun b!584367 () Bool)

(declare-fun res!372174 () Bool)

(assert (=> b!584367 (=> (not res!372174) (not e!334626))))

(assert (=> b!584367 (= res!372174 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17543 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17543 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!372180 () Bool)

(assert (=> start!53636 (=> (not res!372180) (not e!334625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53636 (= res!372180 (validMask!0 mask!3053))))

(assert (=> start!53636 e!334625))

(assert (=> start!53636 true))

(declare-fun array_inv!13339 (array!36537) Bool)

(assert (=> start!53636 (array_inv!13339 a!2986)))

(declare-fun b!584359 () Bool)

(declare-fun res!372185 () Bool)

(assert (=> b!584359 (=> (not res!372185) (not e!334626))))

(assert (=> b!584359 (= res!372185 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17543 a!2986) index!984) (select (arr!17543 a!2986) j!136))) (not (= (select (arr!17543 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584368 () Bool)

(declare-fun res!372175 () Bool)

(assert (=> b!584368 (=> (not res!372175) (not e!334625))))

(assert (=> b!584368 (= res!372175 (validKeyInArray!0 (select (arr!17543 a!2986) j!136)))))

(declare-fun b!584369 () Bool)

(assert (=> b!584369 (= e!334625 e!334626)))

(declare-fun res!372179 () Bool)

(assert (=> b!584369 (=> (not res!372179) (not e!334626))))

(declare-fun lt!265553 () SeekEntryResult!5983)

(assert (=> b!584369 (= res!372179 (or (= lt!265553 (MissingZero!5983 i!1108)) (= lt!265553 (MissingVacant!5983 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36537 (_ BitVec 32)) SeekEntryResult!5983)

(assert (=> b!584369 (= lt!265553 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53636 res!372180) b!584358))

(assert (= (and b!584358 res!372183) b!584368))

(assert (= (and b!584368 res!372175) b!584363))

(assert (= (and b!584363 res!372178) b!584362))

(assert (= (and b!584362 res!372177) b!584369))

(assert (= (and b!584369 res!372179) b!584360))

(assert (= (and b!584360 res!372176) b!584361))

(assert (= (and b!584361 res!372182) b!584367))

(assert (= (and b!584367 res!372174) b!584366))

(assert (= (and b!584366 res!372181) b!584359))

(assert (= (and b!584359 res!372185) b!584364))

(assert (= (and b!584364 res!372184) b!584365))

(declare-fun m!562721 () Bool)

(assert (=> b!584359 m!562721))

(declare-fun m!562723 () Bool)

(assert (=> b!584359 m!562723))

(declare-fun m!562725 () Bool)

(assert (=> b!584364 m!562725))

(declare-fun m!562727 () Bool)

(assert (=> b!584362 m!562727))

(declare-fun m!562729 () Bool)

(assert (=> b!584369 m!562729))

(declare-fun m!562731 () Bool)

(assert (=> b!584367 m!562731))

(declare-fun m!562733 () Bool)

(assert (=> b!584367 m!562733))

(declare-fun m!562735 () Bool)

(assert (=> b!584367 m!562735))

(assert (=> b!584368 m!562723))

(assert (=> b!584368 m!562723))

(declare-fun m!562737 () Bool)

(assert (=> b!584368 m!562737))

(declare-fun m!562739 () Bool)

(assert (=> b!584360 m!562739))

(declare-fun m!562741 () Bool)

(assert (=> start!53636 m!562741))

(declare-fun m!562743 () Bool)

(assert (=> start!53636 m!562743))

(declare-fun m!562745 () Bool)

(assert (=> b!584361 m!562745))

(assert (=> b!584366 m!562723))

(assert (=> b!584366 m!562723))

(declare-fun m!562747 () Bool)

(assert (=> b!584366 m!562747))

(assert (=> b!584365 m!562723))

(assert (=> b!584365 m!562723))

(declare-fun m!562749 () Bool)

(assert (=> b!584365 m!562749))

(declare-fun m!562751 () Bool)

(assert (=> b!584363 m!562751))

(push 1)

(assert (not b!584360))

(assert (not b!584366))

(assert (not b!584368))

(assert (not b!584363))

(assert (not b!584369))

