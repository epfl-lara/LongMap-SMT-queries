; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53616 () Bool)

(assert start!53616)

(declare-fun b!583998 () Bool)

(declare-fun e!334505 () Bool)

(assert (=> b!583998 (= e!334505 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265464 () (_ BitVec 32))

(declare-datatypes ((array!36517 0))(
  ( (array!36518 (arr!17533 (Array (_ BitVec 32) (_ BitVec 64))) (size!17897 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36517)

(declare-datatypes ((SeekEntryResult!5973 0))(
  ( (MissingZero!5973 (index!26119 (_ BitVec 32))) (Found!5973 (index!26120 (_ BitVec 32))) (Intermediate!5973 (undefined!6785 Bool) (index!26121 (_ BitVec 32)) (x!54954 (_ BitVec 32))) (Undefined!5973) (MissingVacant!5973 (index!26122 (_ BitVec 32))) )
))
(declare-fun lt!265465 () SeekEntryResult!5973)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36517 (_ BitVec 32)) SeekEntryResult!5973)

(assert (=> b!583998 (= lt!265465 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265464 vacantSpotIndex!68 (select (arr!17533 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583999 () Bool)

(declare-fun res!371821 () Bool)

(declare-fun e!334506 () Bool)

(assert (=> b!583999 (=> (not res!371821) (not e!334506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36517 (_ BitVec 32)) Bool)

(assert (=> b!583999 (= res!371821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584000 () Bool)

(assert (=> b!584000 (= e!334506 e!334505)))

(declare-fun res!371815 () Bool)

(assert (=> b!584000 (=> (not res!371815) (not e!334505))))

(assert (=> b!584000 (= res!371815 (and (bvsge lt!265464 #b00000000000000000000000000000000) (bvslt lt!265464 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584000 (= lt!265464 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584001 () Bool)

(declare-fun e!334503 () Bool)

(assert (=> b!584001 (= e!334503 e!334506)))

(declare-fun res!371817 () Bool)

(assert (=> b!584001 (=> (not res!371817) (not e!334506))))

(declare-fun lt!265463 () SeekEntryResult!5973)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584001 (= res!371817 (or (= lt!265463 (MissingZero!5973 i!1108)) (= lt!265463 (MissingVacant!5973 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36517 (_ BitVec 32)) SeekEntryResult!5973)

(assert (=> b!584001 (= lt!265463 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584002 () Bool)

(declare-fun res!371824 () Bool)

(assert (=> b!584002 (=> (not res!371824) (not e!334506))))

(assert (=> b!584002 (= res!371824 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17533 a!2986) j!136) a!2986 mask!3053) (Found!5973 j!136)))))

(declare-fun b!584003 () Bool)

(declare-fun res!371816 () Bool)

(assert (=> b!584003 (=> (not res!371816) (not e!334503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584003 (= res!371816 (validKeyInArray!0 k0!1786))))

(declare-fun b!584004 () Bool)

(declare-fun res!371825 () Bool)

(assert (=> b!584004 (=> (not res!371825) (not e!334503))))

(assert (=> b!584004 (= res!371825 (and (= (size!17897 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17897 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17897 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584006 () Bool)

(declare-fun res!371822 () Bool)

(assert (=> b!584006 (=> (not res!371822) (not e!334503))))

(assert (=> b!584006 (= res!371822 (validKeyInArray!0 (select (arr!17533 a!2986) j!136)))))

(declare-fun b!584007 () Bool)

(declare-fun res!371823 () Bool)

(assert (=> b!584007 (=> (not res!371823) (not e!334503))))

(declare-fun arrayContainsKey!0 (array!36517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584007 (= res!371823 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584008 () Bool)

(declare-fun res!371814 () Bool)

(assert (=> b!584008 (=> (not res!371814) (not e!334506))))

(declare-datatypes ((List!11574 0))(
  ( (Nil!11571) (Cons!11570 (h!12615 (_ BitVec 64)) (t!17802 List!11574)) )
))
(declare-fun arrayNoDuplicates!0 (array!36517 (_ BitVec 32) List!11574) Bool)

(assert (=> b!584008 (= res!371814 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11571))))

(declare-fun b!584009 () Bool)

(declare-fun res!371818 () Bool)

(assert (=> b!584009 (=> (not res!371818) (not e!334506))))

(assert (=> b!584009 (= res!371818 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17533 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17533 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584005 () Bool)

(declare-fun res!371819 () Bool)

(assert (=> b!584005 (=> (not res!371819) (not e!334506))))

(assert (=> b!584005 (= res!371819 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17533 a!2986) index!984) (select (arr!17533 a!2986) j!136))) (not (= (select (arr!17533 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!371820 () Bool)

(assert (=> start!53616 (=> (not res!371820) (not e!334503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53616 (= res!371820 (validMask!0 mask!3053))))

(assert (=> start!53616 e!334503))

(assert (=> start!53616 true))

(declare-fun array_inv!13329 (array!36517) Bool)

(assert (=> start!53616 (array_inv!13329 a!2986)))

(assert (= (and start!53616 res!371820) b!584004))

(assert (= (and b!584004 res!371825) b!584006))

(assert (= (and b!584006 res!371822) b!584003))

(assert (= (and b!584003 res!371816) b!584007))

(assert (= (and b!584007 res!371823) b!584001))

(assert (= (and b!584001 res!371817) b!583999))

(assert (= (and b!583999 res!371821) b!584008))

(assert (= (and b!584008 res!371814) b!584009))

(assert (= (and b!584009 res!371818) b!584002))

(assert (= (and b!584002 res!371824) b!584005))

(assert (= (and b!584005 res!371819) b!584000))

(assert (= (and b!584000 res!371815) b!583998))

(declare-fun m!562401 () Bool)

(assert (=> b!584001 m!562401))

(declare-fun m!562403 () Bool)

(assert (=> b!584009 m!562403))

(declare-fun m!562405 () Bool)

(assert (=> b!584009 m!562405))

(declare-fun m!562407 () Bool)

(assert (=> b!584009 m!562407))

(declare-fun m!562409 () Bool)

(assert (=> b!583998 m!562409))

(assert (=> b!583998 m!562409))

(declare-fun m!562411 () Bool)

(assert (=> b!583998 m!562411))

(assert (=> b!584002 m!562409))

(assert (=> b!584002 m!562409))

(declare-fun m!562413 () Bool)

(assert (=> b!584002 m!562413))

(declare-fun m!562415 () Bool)

(assert (=> b!584005 m!562415))

(assert (=> b!584005 m!562409))

(declare-fun m!562417 () Bool)

(assert (=> b!584007 m!562417))

(declare-fun m!562419 () Bool)

(assert (=> start!53616 m!562419))

(declare-fun m!562421 () Bool)

(assert (=> start!53616 m!562421))

(declare-fun m!562423 () Bool)

(assert (=> b!584003 m!562423))

(declare-fun m!562425 () Bool)

(assert (=> b!584008 m!562425))

(declare-fun m!562427 () Bool)

(assert (=> b!584000 m!562427))

(assert (=> b!584006 m!562409))

(assert (=> b!584006 m!562409))

(declare-fun m!562429 () Bool)

(assert (=> b!584006 m!562429))

(declare-fun m!562431 () Bool)

(assert (=> b!583999 m!562431))

(check-sat (not b!584003) (not b!583998) (not b!584006) (not b!584008) (not start!53616) (not b!584007) (not b!584000) (not b!583999) (not b!584001) (not b!584002))
(check-sat)
