; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53766 () Bool)

(assert start!53766)

(declare-fun b!586603 () Bool)

(declare-fun res!374422 () Bool)

(declare-fun e!335309 () Bool)

(assert (=> b!586603 (=> (not res!374422) (not e!335309))))

(declare-datatypes ((array!36667 0))(
  ( (array!36668 (arr!17608 (Array (_ BitVec 32) (_ BitVec 64))) (size!17972 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36667)

(declare-datatypes ((List!11649 0))(
  ( (Nil!11646) (Cons!11645 (h!12690 (_ BitVec 64)) (t!17877 List!11649)) )
))
(declare-fun arrayNoDuplicates!0 (array!36667 (_ BitVec 32) List!11649) Bool)

(assert (=> b!586603 (= res!374422 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11646))))

(declare-fun b!586604 () Bool)

(declare-fun res!374428 () Bool)

(assert (=> b!586604 (=> (not res!374428) (not e!335309))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6048 0))(
  ( (MissingZero!6048 (index!26419 (_ BitVec 32))) (Found!6048 (index!26420 (_ BitVec 32))) (Intermediate!6048 (undefined!6860 Bool) (index!26421 (_ BitVec 32)) (x!55229 (_ BitVec 32))) (Undefined!6048) (MissingVacant!6048 (index!26422 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36667 (_ BitVec 32)) SeekEntryResult!6048)

(assert (=> b!586604 (= res!374428 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17608 a!2986) j!136) a!2986 mask!3053) (Found!6048 j!136)))))

(declare-fun b!586605 () Bool)

(declare-fun res!374423 () Bool)

(assert (=> b!586605 (=> (not res!374423) (not e!335309))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!586605 (= res!374423 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17608 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17608 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!374419 () Bool)

(declare-fun e!335308 () Bool)

(assert (=> start!53766 (=> (not res!374419) (not e!335308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53766 (= res!374419 (validMask!0 mask!3053))))

(assert (=> start!53766 e!335308))

(assert (=> start!53766 true))

(declare-fun array_inv!13404 (array!36667) Bool)

(assert (=> start!53766 (array_inv!13404 a!2986)))

(declare-fun b!586606 () Bool)

(declare-fun res!374424 () Bool)

(assert (=> b!586606 (=> (not res!374424) (not e!335308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586606 (= res!374424 (validKeyInArray!0 (select (arr!17608 a!2986) j!136)))))

(declare-fun b!586607 () Bool)

(assert (=> b!586607 (= e!335309 (not true))))

(declare-fun lt!266138 () (_ BitVec 32))

(assert (=> b!586607 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266138 vacantSpotIndex!68 (select (arr!17608 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266138 vacantSpotIndex!68 (select (store (arr!17608 a!2986) i!1108 k0!1786) j!136) (array!36668 (store (arr!17608 a!2986) i!1108 k0!1786) (size!17972 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18216 0))(
  ( (Unit!18217) )
))
(declare-fun lt!266140 () Unit!18216)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36667 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18216)

(assert (=> b!586607 (= lt!266140 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266138 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586607 (= lt!266138 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586608 () Bool)

(declare-fun res!374426 () Bool)

(assert (=> b!586608 (=> (not res!374426) (not e!335309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36667 (_ BitVec 32)) Bool)

(assert (=> b!586608 (= res!374426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586609 () Bool)

(declare-fun res!374425 () Bool)

(assert (=> b!586609 (=> (not res!374425) (not e!335308))))

(assert (=> b!586609 (= res!374425 (validKeyInArray!0 k0!1786))))

(declare-fun b!586610 () Bool)

(declare-fun res!374421 () Bool)

(assert (=> b!586610 (=> (not res!374421) (not e!335309))))

(assert (=> b!586610 (= res!374421 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17608 a!2986) index!984) (select (arr!17608 a!2986) j!136))) (not (= (select (arr!17608 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586611 () Bool)

(declare-fun res!374429 () Bool)

(assert (=> b!586611 (=> (not res!374429) (not e!335308))))

(declare-fun arrayContainsKey!0 (array!36667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586611 (= res!374429 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586612 () Bool)

(declare-fun res!374420 () Bool)

(assert (=> b!586612 (=> (not res!374420) (not e!335308))))

(assert (=> b!586612 (= res!374420 (and (= (size!17972 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17972 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17972 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586613 () Bool)

(assert (=> b!586613 (= e!335308 e!335309)))

(declare-fun res!374427 () Bool)

(assert (=> b!586613 (=> (not res!374427) (not e!335309))))

(declare-fun lt!266139 () SeekEntryResult!6048)

(assert (=> b!586613 (= res!374427 (or (= lt!266139 (MissingZero!6048 i!1108)) (= lt!266139 (MissingVacant!6048 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36667 (_ BitVec 32)) SeekEntryResult!6048)

(assert (=> b!586613 (= lt!266139 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53766 res!374419) b!586612))

(assert (= (and b!586612 res!374420) b!586606))

(assert (= (and b!586606 res!374424) b!586609))

(assert (= (and b!586609 res!374425) b!586611))

(assert (= (and b!586611 res!374429) b!586613))

(assert (= (and b!586613 res!374427) b!586608))

(assert (= (and b!586608 res!374426) b!586603))

(assert (= (and b!586603 res!374422) b!586605))

(assert (= (and b!586605 res!374423) b!586604))

(assert (= (and b!586604 res!374428) b!586610))

(assert (= (and b!586610 res!374421) b!586607))

(declare-fun m!564987 () Bool)

(assert (=> b!586611 m!564987))

(declare-fun m!564989 () Bool)

(assert (=> b!586613 m!564989))

(declare-fun m!564991 () Bool)

(assert (=> b!586610 m!564991))

(declare-fun m!564993 () Bool)

(assert (=> b!586610 m!564993))

(declare-fun m!564995 () Bool)

(assert (=> b!586603 m!564995))

(declare-fun m!564997 () Bool)

(assert (=> b!586605 m!564997))

(declare-fun m!564999 () Bool)

(assert (=> b!586605 m!564999))

(declare-fun m!565001 () Bool)

(assert (=> b!586605 m!565001))

(declare-fun m!565003 () Bool)

(assert (=> start!53766 m!565003))

(declare-fun m!565005 () Bool)

(assert (=> start!53766 m!565005))

(declare-fun m!565007 () Bool)

(assert (=> b!586609 m!565007))

(assert (=> b!586604 m!564993))

(assert (=> b!586604 m!564993))

(declare-fun m!565009 () Bool)

(assert (=> b!586604 m!565009))

(declare-fun m!565011 () Bool)

(assert (=> b!586607 m!565011))

(declare-fun m!565013 () Bool)

(assert (=> b!586607 m!565013))

(assert (=> b!586607 m!564993))

(assert (=> b!586607 m!564999))

(assert (=> b!586607 m!564993))

(declare-fun m!565015 () Bool)

(assert (=> b!586607 m!565015))

(declare-fun m!565017 () Bool)

(assert (=> b!586607 m!565017))

(assert (=> b!586607 m!565013))

(declare-fun m!565019 () Bool)

(assert (=> b!586607 m!565019))

(assert (=> b!586606 m!564993))

(assert (=> b!586606 m!564993))

(declare-fun m!565021 () Bool)

(assert (=> b!586606 m!565021))

(declare-fun m!565023 () Bool)

(assert (=> b!586608 m!565023))

(check-sat (not b!586607) (not b!586613) (not b!586609) (not start!53766) (not b!586611) (not b!586608) (not b!586606) (not b!586603) (not b!586604))
(check-sat)
