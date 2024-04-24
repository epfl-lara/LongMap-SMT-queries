; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53724 () Bool)

(assert start!53724)

(declare-fun b!585251 () Bool)

(declare-fun res!372966 () Bool)

(declare-fun e!334983 () Bool)

(assert (=> b!585251 (=> (not res!372966) (not e!334983))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36570 0))(
  ( (array!36571 (arr!17557 (Array (_ BitVec 32) (_ BitVec 64))) (size!17921 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36570)

(declare-datatypes ((SeekEntryResult!5953 0))(
  ( (MissingZero!5953 (index!26039 (_ BitVec 32))) (Found!5953 (index!26040 (_ BitVec 32))) (Intermediate!5953 (undefined!6765 Bool) (index!26041 (_ BitVec 32)) (x!55017 (_ BitVec 32))) (Undefined!5953) (MissingVacant!5953 (index!26042 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36570 (_ BitVec 32)) SeekEntryResult!5953)

(assert (=> b!585251 (= res!372966 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17557 a!2986) j!136) a!2986 mask!3053) (Found!5953 j!136)))))

(declare-fun b!585252 () Bool)

(declare-fun res!372964 () Bool)

(declare-fun e!334982 () Bool)

(assert (=> b!585252 (=> (not res!372964) (not e!334982))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585252 (= res!372964 (and (= (size!17921 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17921 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17921 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585253 () Bool)

(assert (=> b!585253 (= e!334982 e!334983)))

(declare-fun res!372972 () Bool)

(assert (=> b!585253 (=> (not res!372972) (not e!334983))))

(declare-fun lt!265828 () SeekEntryResult!5953)

(assert (=> b!585253 (= res!372972 (or (= lt!265828 (MissingZero!5953 i!1108)) (= lt!265828 (MissingVacant!5953 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36570 (_ BitVec 32)) SeekEntryResult!5953)

(assert (=> b!585253 (= lt!265828 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585254 () Bool)

(declare-fun res!372967 () Bool)

(assert (=> b!585254 (=> (not res!372967) (not e!334982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585254 (= res!372967 (validKeyInArray!0 (select (arr!17557 a!2986) j!136)))))

(declare-fun b!585255 () Bool)

(declare-fun res!372969 () Bool)

(assert (=> b!585255 (=> (not res!372969) (not e!334983))))

(declare-datatypes ((List!11505 0))(
  ( (Nil!11502) (Cons!11501 (h!12549 (_ BitVec 64)) (t!17725 List!11505)) )
))
(declare-fun arrayNoDuplicates!0 (array!36570 (_ BitVec 32) List!11505) Bool)

(assert (=> b!585255 (= res!372969 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11502))))

(declare-fun b!585257 () Bool)

(declare-fun res!372973 () Bool)

(assert (=> b!585257 (=> (not res!372973) (not e!334983))))

(assert (=> b!585257 (= res!372973 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17557 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17557 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585258 () Bool)

(declare-fun res!372968 () Bool)

(assert (=> b!585258 (=> (not res!372968) (not e!334983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36570 (_ BitVec 32)) Bool)

(assert (=> b!585258 (= res!372968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585259 () Bool)

(declare-fun res!372970 () Bool)

(assert (=> b!585259 (=> (not res!372970) (not e!334982))))

(assert (=> b!585259 (= res!372970 (validKeyInArray!0 k0!1786))))

(declare-fun b!585260 () Bool)

(declare-fun e!334981 () Bool)

(assert (=> b!585260 (= e!334981 false)))

(declare-fun lt!265826 () SeekEntryResult!5953)

(declare-fun lt!265827 () (_ BitVec 32))

(assert (=> b!585260 (= lt!265826 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265827 vacantSpotIndex!68 (select (arr!17557 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585261 () Bool)

(assert (=> b!585261 (= e!334983 e!334981)))

(declare-fun res!372965 () Bool)

(assert (=> b!585261 (=> (not res!372965) (not e!334981))))

(assert (=> b!585261 (= res!372965 (and (bvsge lt!265827 #b00000000000000000000000000000000) (bvslt lt!265827 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585261 (= lt!265827 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!585262 () Bool)

(declare-fun res!372962 () Bool)

(assert (=> b!585262 (=> (not res!372962) (not e!334983))))

(assert (=> b!585262 (= res!372962 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17557 a!2986) index!984) (select (arr!17557 a!2986) j!136))) (not (= (select (arr!17557 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!372971 () Bool)

(assert (=> start!53724 (=> (not res!372971) (not e!334982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53724 (= res!372971 (validMask!0 mask!3053))))

(assert (=> start!53724 e!334982))

(assert (=> start!53724 true))

(declare-fun array_inv!13416 (array!36570) Bool)

(assert (=> start!53724 (array_inv!13416 a!2986)))

(declare-fun b!585256 () Bool)

(declare-fun res!372963 () Bool)

(assert (=> b!585256 (=> (not res!372963) (not e!334982))))

(declare-fun arrayContainsKey!0 (array!36570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585256 (= res!372963 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53724 res!372971) b!585252))

(assert (= (and b!585252 res!372964) b!585254))

(assert (= (and b!585254 res!372967) b!585259))

(assert (= (and b!585259 res!372970) b!585256))

(assert (= (and b!585256 res!372963) b!585253))

(assert (= (and b!585253 res!372972) b!585258))

(assert (= (and b!585258 res!372968) b!585255))

(assert (= (and b!585255 res!372969) b!585257))

(assert (= (and b!585257 res!372973) b!585251))

(assert (= (and b!585251 res!372966) b!585262))

(assert (= (and b!585262 res!372962) b!585261))

(assert (= (and b!585261 res!372965) b!585260))

(declare-fun m!563687 () Bool)

(assert (=> b!585255 m!563687))

(declare-fun m!563689 () Bool)

(assert (=> b!585254 m!563689))

(assert (=> b!585254 m!563689))

(declare-fun m!563691 () Bool)

(assert (=> b!585254 m!563691))

(assert (=> b!585251 m!563689))

(assert (=> b!585251 m!563689))

(declare-fun m!563693 () Bool)

(assert (=> b!585251 m!563693))

(declare-fun m!563695 () Bool)

(assert (=> start!53724 m!563695))

(declare-fun m!563697 () Bool)

(assert (=> start!53724 m!563697))

(declare-fun m!563699 () Bool)

(assert (=> b!585257 m!563699))

(declare-fun m!563701 () Bool)

(assert (=> b!585257 m!563701))

(declare-fun m!563703 () Bool)

(assert (=> b!585257 m!563703))

(declare-fun m!563705 () Bool)

(assert (=> b!585262 m!563705))

(assert (=> b!585262 m!563689))

(declare-fun m!563707 () Bool)

(assert (=> b!585258 m!563707))

(declare-fun m!563709 () Bool)

(assert (=> b!585253 m!563709))

(assert (=> b!585260 m!563689))

(assert (=> b!585260 m!563689))

(declare-fun m!563711 () Bool)

(assert (=> b!585260 m!563711))

(declare-fun m!563713 () Bool)

(assert (=> b!585259 m!563713))

(declare-fun m!563715 () Bool)

(assert (=> b!585256 m!563715))

(declare-fun m!563717 () Bool)

(assert (=> b!585261 m!563717))

(check-sat (not b!585256) (not b!585261) (not b!585251) (not start!53724) (not b!585259) (not b!585260) (not b!585254) (not b!585253) (not b!585255) (not b!585258))
(check-sat)
