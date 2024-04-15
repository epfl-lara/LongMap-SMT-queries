; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56982 () Bool)

(assert start!56982)

(declare-fun b!630594 () Bool)

(declare-datatypes ((Unit!21152 0))(
  ( (Unit!21153) )
))
(declare-fun e!360552 () Unit!21152)

(declare-fun Unit!21154 () Unit!21152)

(assert (=> b!630594 (= e!360552 Unit!21154)))

(assert (=> b!630594 false))

(declare-fun b!630595 () Bool)

(declare-fun e!360549 () Bool)

(assert (=> b!630595 (= e!360549 (not true))))

(declare-fun lt!291172 () Unit!21152)

(assert (=> b!630595 (= lt!291172 e!360552)))

(declare-fun lt!291165 () (_ BitVec 64))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun c!71808 () Bool)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38070 0))(
  ( (array!38071 (arr!18269 (Array (_ BitVec 32) (_ BitVec 64))) (size!18634 (_ BitVec 32))) )
))
(declare-fun lt!291169 () array!38070)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6706 0))(
  ( (MissingZero!6706 (index!29114 (_ BitVec 32))) (Found!6706 (index!29115 (_ BitVec 32))) (Intermediate!6706 (undefined!7518 Bool) (index!29116 (_ BitVec 32)) (x!57863 (_ BitVec 32))) (Undefined!6706) (MissingVacant!6706 (index!29117 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38070 (_ BitVec 32)) SeekEntryResult!6706)

(assert (=> b!630595 (= c!71808 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291165 lt!291169 mask!3053) Undefined!6706))))

(declare-fun e!360550 () Bool)

(assert (=> b!630595 e!360550))

(declare-fun res!407721 () Bool)

(assert (=> b!630595 (=> (not res!407721) (not e!360550))))

(declare-fun lt!291171 () SeekEntryResult!6706)

(declare-fun lt!291170 () (_ BitVec 32))

(assert (=> b!630595 (= res!407721 (= lt!291171 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291170 vacantSpotIndex!68 lt!291165 lt!291169 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38070)

(assert (=> b!630595 (= lt!291171 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291170 vacantSpotIndex!68 (select (arr!18269 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!630595 (= lt!291165 (select (store (arr!18269 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291166 () Unit!21152)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38070 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21152)

(assert (=> b!630595 (= lt!291166 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291170 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630595 (= lt!291170 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!407720 () Bool)

(declare-fun e!360551 () Bool)

(assert (=> start!56982 (=> (not res!407720) (not e!360551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56982 (= res!407720 (validMask!0 mask!3053))))

(assert (=> start!56982 e!360551))

(assert (=> start!56982 true))

(declare-fun array_inv!14152 (array!38070) Bool)

(assert (=> start!56982 (array_inv!14152 a!2986)))

(declare-fun b!630596 () Bool)

(declare-fun res!407712 () Bool)

(assert (=> b!630596 (=> (not res!407712) (not e!360551))))

(assert (=> b!630596 (= res!407712 (and (= (size!18634 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18634 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18634 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630597 () Bool)

(declare-fun res!407717 () Bool)

(declare-fun e!360553 () Bool)

(assert (=> b!630597 (=> (not res!407717) (not e!360553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38070 (_ BitVec 32)) Bool)

(assert (=> b!630597 (= res!407717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630598 () Bool)

(declare-fun Unit!21155 () Unit!21152)

(assert (=> b!630598 (= e!360552 Unit!21155)))

(declare-fun b!630599 () Bool)

(declare-fun lt!291168 () SeekEntryResult!6706)

(assert (=> b!630599 (= e!360550 (= lt!291168 lt!291171))))

(declare-fun b!630600 () Bool)

(declare-fun res!407713 () Bool)

(assert (=> b!630600 (=> (not res!407713) (not e!360553))))

(declare-datatypes ((List!12349 0))(
  ( (Nil!12346) (Cons!12345 (h!13390 (_ BitVec 64)) (t!18568 List!12349)) )
))
(declare-fun arrayNoDuplicates!0 (array!38070 (_ BitVec 32) List!12349) Bool)

(assert (=> b!630600 (= res!407713 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12346))))

(declare-fun b!630601 () Bool)

(declare-fun res!407722 () Bool)

(assert (=> b!630601 (=> (not res!407722) (not e!360551))))

(declare-fun arrayContainsKey!0 (array!38070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630601 (= res!407722 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630602 () Bool)

(assert (=> b!630602 (= e!360551 e!360553)))

(declare-fun res!407715 () Bool)

(assert (=> b!630602 (=> (not res!407715) (not e!360553))))

(declare-fun lt!291167 () SeekEntryResult!6706)

(assert (=> b!630602 (= res!407715 (or (= lt!291167 (MissingZero!6706 i!1108)) (= lt!291167 (MissingVacant!6706 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38070 (_ BitVec 32)) SeekEntryResult!6706)

(assert (=> b!630602 (= lt!291167 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!630603 () Bool)

(declare-fun res!407723 () Bool)

(assert (=> b!630603 (=> (not res!407723) (not e!360551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630603 (= res!407723 (validKeyInArray!0 k0!1786))))

(declare-fun b!630604 () Bool)

(declare-fun e!360555 () Bool)

(assert (=> b!630604 (= e!360553 e!360555)))

(declare-fun res!407714 () Bool)

(assert (=> b!630604 (=> (not res!407714) (not e!360555))))

(assert (=> b!630604 (= res!407714 (= (select (store (arr!18269 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630604 (= lt!291169 (array!38071 (store (arr!18269 a!2986) i!1108 k0!1786) (size!18634 a!2986)))))

(declare-fun b!630605 () Bool)

(declare-fun res!407716 () Bool)

(assert (=> b!630605 (=> (not res!407716) (not e!360553))))

(assert (=> b!630605 (= res!407716 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18269 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630606 () Bool)

(assert (=> b!630606 (= e!360555 e!360549)))

(declare-fun res!407719 () Bool)

(assert (=> b!630606 (=> (not res!407719) (not e!360549))))

(assert (=> b!630606 (= res!407719 (and (= lt!291168 (Found!6706 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18269 a!2986) index!984) (select (arr!18269 a!2986) j!136))) (not (= (select (arr!18269 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!630606 (= lt!291168 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18269 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630607 () Bool)

(declare-fun res!407718 () Bool)

(assert (=> b!630607 (=> (not res!407718) (not e!360551))))

(assert (=> b!630607 (= res!407718 (validKeyInArray!0 (select (arr!18269 a!2986) j!136)))))

(assert (= (and start!56982 res!407720) b!630596))

(assert (= (and b!630596 res!407712) b!630607))

(assert (= (and b!630607 res!407718) b!630603))

(assert (= (and b!630603 res!407723) b!630601))

(assert (= (and b!630601 res!407722) b!630602))

(assert (= (and b!630602 res!407715) b!630597))

(assert (= (and b!630597 res!407717) b!630600))

(assert (= (and b!630600 res!407713) b!630605))

(assert (= (and b!630605 res!407716) b!630604))

(assert (= (and b!630604 res!407714) b!630606))

(assert (= (and b!630606 res!407719) b!630595))

(assert (= (and b!630595 res!407721) b!630599))

(assert (= (and b!630595 c!71808) b!630594))

(assert (= (and b!630595 (not c!71808)) b!630598))

(declare-fun m!605059 () Bool)

(assert (=> start!56982 m!605059))

(declare-fun m!605061 () Bool)

(assert (=> start!56982 m!605061))

(declare-fun m!605063 () Bool)

(assert (=> b!630606 m!605063))

(declare-fun m!605065 () Bool)

(assert (=> b!630606 m!605065))

(assert (=> b!630606 m!605065))

(declare-fun m!605067 () Bool)

(assert (=> b!630606 m!605067))

(declare-fun m!605069 () Bool)

(assert (=> b!630597 m!605069))

(declare-fun m!605071 () Bool)

(assert (=> b!630600 m!605071))

(assert (=> b!630607 m!605065))

(assert (=> b!630607 m!605065))

(declare-fun m!605073 () Bool)

(assert (=> b!630607 m!605073))

(declare-fun m!605075 () Bool)

(assert (=> b!630601 m!605075))

(declare-fun m!605077 () Bool)

(assert (=> b!630604 m!605077))

(declare-fun m!605079 () Bool)

(assert (=> b!630604 m!605079))

(declare-fun m!605081 () Bool)

(assert (=> b!630602 m!605081))

(declare-fun m!605083 () Bool)

(assert (=> b!630595 m!605083))

(declare-fun m!605085 () Bool)

(assert (=> b!630595 m!605085))

(declare-fun m!605087 () Bool)

(assert (=> b!630595 m!605087))

(assert (=> b!630595 m!605077))

(declare-fun m!605089 () Bool)

(assert (=> b!630595 m!605089))

(assert (=> b!630595 m!605065))

(declare-fun m!605091 () Bool)

(assert (=> b!630595 m!605091))

(declare-fun m!605093 () Bool)

(assert (=> b!630595 m!605093))

(assert (=> b!630595 m!605065))

(declare-fun m!605095 () Bool)

(assert (=> b!630603 m!605095))

(declare-fun m!605097 () Bool)

(assert (=> b!630605 m!605097))

(check-sat (not b!630600) (not b!630597) (not start!56982) (not b!630607) (not b!630601) (not b!630603) (not b!630595) (not b!630606) (not b!630602))
(check-sat)
