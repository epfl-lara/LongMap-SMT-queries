; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53724 () Bool)

(assert start!53724)

(declare-fun b!585910 () Bool)

(declare-fun res!373734 () Bool)

(declare-fun e!335121 () Bool)

(assert (=> b!585910 (=> (not res!373734) (not e!335121))))

(declare-datatypes ((array!36625 0))(
  ( (array!36626 (arr!17587 (Array (_ BitVec 32) (_ BitVec 64))) (size!17951 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36625)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585910 (= res!373734 (validKeyInArray!0 (select (arr!17587 a!2986) j!136)))))

(declare-fun b!585911 () Bool)

(declare-fun e!335120 () Bool)

(assert (=> b!585911 (= e!335120 (not true))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265951 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6027 0))(
  ( (MissingZero!6027 (index!26335 (_ BitVec 32))) (Found!6027 (index!26336 (_ BitVec 32))) (Intermediate!6027 (undefined!6839 Bool) (index!26337 (_ BitVec 32)) (x!55152 (_ BitVec 32))) (Undefined!6027) (MissingVacant!6027 (index!26338 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36625 (_ BitVec 32)) SeekEntryResult!6027)

(assert (=> b!585911 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265951 vacantSpotIndex!68 (select (arr!17587 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265951 vacantSpotIndex!68 (select (store (arr!17587 a!2986) i!1108 k0!1786) j!136) (array!36626 (store (arr!17587 a!2986) i!1108 k0!1786) (size!17951 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18174 0))(
  ( (Unit!18175) )
))
(declare-fun lt!265950 () Unit!18174)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18174)

(assert (=> b!585911 (= lt!265950 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265951 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585911 (= lt!265951 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585912 () Bool)

(declare-fun res!373729 () Bool)

(assert (=> b!585912 (=> (not res!373729) (not e!335120))))

(assert (=> b!585912 (= res!373729 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17587 a!2986) j!136) a!2986 mask!3053) (Found!6027 j!136)))))

(declare-fun b!585913 () Bool)

(declare-fun res!373728 () Bool)

(assert (=> b!585913 (=> (not res!373728) (not e!335120))))

(assert (=> b!585913 (= res!373728 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17587 a!2986) index!984) (select (arr!17587 a!2986) j!136))) (not (= (select (arr!17587 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585914 () Bool)

(declare-fun res!373731 () Bool)

(assert (=> b!585914 (=> (not res!373731) (not e!335120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36625 (_ BitVec 32)) Bool)

(assert (=> b!585914 (= res!373731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585915 () Bool)

(assert (=> b!585915 (= e!335121 e!335120)))

(declare-fun res!373726 () Bool)

(assert (=> b!585915 (=> (not res!373726) (not e!335120))))

(declare-fun lt!265949 () SeekEntryResult!6027)

(assert (=> b!585915 (= res!373726 (or (= lt!265949 (MissingZero!6027 i!1108)) (= lt!265949 (MissingVacant!6027 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36625 (_ BitVec 32)) SeekEntryResult!6027)

(assert (=> b!585915 (= lt!265949 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585916 () Bool)

(declare-fun res!373735 () Bool)

(assert (=> b!585916 (=> (not res!373735) (not e!335120))))

(declare-datatypes ((List!11628 0))(
  ( (Nil!11625) (Cons!11624 (h!12669 (_ BitVec 64)) (t!17856 List!11628)) )
))
(declare-fun arrayNoDuplicates!0 (array!36625 (_ BitVec 32) List!11628) Bool)

(assert (=> b!585916 (= res!373735 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11625))))

(declare-fun b!585917 () Bool)

(declare-fun res!373730 () Bool)

(assert (=> b!585917 (=> (not res!373730) (not e!335120))))

(assert (=> b!585917 (= res!373730 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17587 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17587 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585918 () Bool)

(declare-fun res!373736 () Bool)

(assert (=> b!585918 (=> (not res!373736) (not e!335121))))

(assert (=> b!585918 (= res!373736 (validKeyInArray!0 k0!1786))))

(declare-fun b!585919 () Bool)

(declare-fun res!373727 () Bool)

(assert (=> b!585919 (=> (not res!373727) (not e!335121))))

(declare-fun arrayContainsKey!0 (array!36625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585919 (= res!373727 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585920 () Bool)

(declare-fun res!373733 () Bool)

(assert (=> b!585920 (=> (not res!373733) (not e!335121))))

(assert (=> b!585920 (= res!373733 (and (= (size!17951 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17951 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17951 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!373732 () Bool)

(assert (=> start!53724 (=> (not res!373732) (not e!335121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53724 (= res!373732 (validMask!0 mask!3053))))

(assert (=> start!53724 e!335121))

(assert (=> start!53724 true))

(declare-fun array_inv!13383 (array!36625) Bool)

(assert (=> start!53724 (array_inv!13383 a!2986)))

(assert (= (and start!53724 res!373732) b!585920))

(assert (= (and b!585920 res!373733) b!585910))

(assert (= (and b!585910 res!373734) b!585918))

(assert (= (and b!585918 res!373736) b!585919))

(assert (= (and b!585919 res!373727) b!585915))

(assert (= (and b!585915 res!373726) b!585914))

(assert (= (and b!585914 res!373731) b!585916))

(assert (= (and b!585916 res!373735) b!585917))

(assert (= (and b!585917 res!373730) b!585912))

(assert (= (and b!585912 res!373729) b!585913))

(assert (= (and b!585913 res!373728) b!585911))

(declare-fun m!564189 () Bool)

(assert (=> b!585915 m!564189))

(declare-fun m!564191 () Bool)

(assert (=> b!585917 m!564191))

(declare-fun m!564193 () Bool)

(assert (=> b!585917 m!564193))

(declare-fun m!564195 () Bool)

(assert (=> b!585917 m!564195))

(declare-fun m!564197 () Bool)

(assert (=> b!585914 m!564197))

(declare-fun m!564199 () Bool)

(assert (=> b!585916 m!564199))

(declare-fun m!564201 () Bool)

(assert (=> b!585918 m!564201))

(declare-fun m!564203 () Bool)

(assert (=> b!585912 m!564203))

(assert (=> b!585912 m!564203))

(declare-fun m!564205 () Bool)

(assert (=> b!585912 m!564205))

(declare-fun m!564207 () Bool)

(assert (=> b!585911 m!564207))

(declare-fun m!564209 () Bool)

(assert (=> b!585911 m!564209))

(declare-fun m!564211 () Bool)

(assert (=> b!585911 m!564211))

(assert (=> b!585911 m!564203))

(assert (=> b!585911 m!564203))

(declare-fun m!564213 () Bool)

(assert (=> b!585911 m!564213))

(assert (=> b!585911 m!564209))

(declare-fun m!564215 () Bool)

(assert (=> b!585911 m!564215))

(assert (=> b!585911 m!564193))

(declare-fun m!564217 () Bool)

(assert (=> b!585919 m!564217))

(assert (=> b!585910 m!564203))

(assert (=> b!585910 m!564203))

(declare-fun m!564219 () Bool)

(assert (=> b!585910 m!564219))

(declare-fun m!564221 () Bool)

(assert (=> b!585913 m!564221))

(assert (=> b!585913 m!564203))

(declare-fun m!564223 () Bool)

(assert (=> start!53724 m!564223))

(declare-fun m!564225 () Bool)

(assert (=> start!53724 m!564225))

(check-sat (not b!585919) (not b!585910) (not start!53724) (not b!585918) (not b!585912) (not b!585915) (not b!585914) (not b!585911) (not b!585916))
(check-sat)
