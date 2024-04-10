; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53730 () Bool)

(assert start!53730)

(declare-fun b!586009 () Bool)

(declare-fun res!373825 () Bool)

(declare-fun e!335148 () Bool)

(assert (=> b!586009 (=> (not res!373825) (not e!335148))))

(declare-datatypes ((array!36631 0))(
  ( (array!36632 (arr!17590 (Array (_ BitVec 32) (_ BitVec 64))) (size!17954 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36631)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36631 (_ BitVec 32)) Bool)

(assert (=> b!586009 (= res!373825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586010 () Bool)

(declare-fun res!373833 () Bool)

(declare-fun e!335147 () Bool)

(assert (=> b!586010 (=> (not res!373833) (not e!335147))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586010 (= res!373833 (and (= (size!17954 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17954 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17954 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586011 () Bool)

(declare-fun res!373835 () Bool)

(assert (=> b!586011 (=> (not res!373835) (not e!335148))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!586011 (= res!373835 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17590 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17590 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586012 () Bool)

(declare-fun res!373831 () Bool)

(assert (=> b!586012 (=> (not res!373831) (not e!335148))))

(declare-datatypes ((SeekEntryResult!6030 0))(
  ( (MissingZero!6030 (index!26347 (_ BitVec 32))) (Found!6030 (index!26348 (_ BitVec 32))) (Intermediate!6030 (undefined!6842 Bool) (index!26349 (_ BitVec 32)) (x!55163 (_ BitVec 32))) (Undefined!6030) (MissingVacant!6030 (index!26350 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36631 (_ BitVec 32)) SeekEntryResult!6030)

(assert (=> b!586012 (= res!373831 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17590 a!2986) j!136) a!2986 mask!3053) (Found!6030 j!136)))))

(declare-fun res!373834 () Bool)

(assert (=> start!53730 (=> (not res!373834) (not e!335147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53730 (= res!373834 (validMask!0 mask!3053))))

(assert (=> start!53730 e!335147))

(assert (=> start!53730 true))

(declare-fun array_inv!13386 (array!36631) Bool)

(assert (=> start!53730 (array_inv!13386 a!2986)))

(declare-fun b!586013 () Bool)

(assert (=> b!586013 (= e!335148 (not true))))

(declare-fun lt!265978 () (_ BitVec 32))

(assert (=> b!586013 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265978 vacantSpotIndex!68 (select (arr!17590 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265978 vacantSpotIndex!68 (select (store (arr!17590 a!2986) i!1108 k0!1786) j!136) (array!36632 (store (arr!17590 a!2986) i!1108 k0!1786) (size!17954 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18180 0))(
  ( (Unit!18181) )
))
(declare-fun lt!265976 () Unit!18180)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36631 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18180)

(assert (=> b!586013 (= lt!265976 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265978 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586013 (= lt!265978 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586014 () Bool)

(assert (=> b!586014 (= e!335147 e!335148)))

(declare-fun res!373826 () Bool)

(assert (=> b!586014 (=> (not res!373826) (not e!335148))))

(declare-fun lt!265977 () SeekEntryResult!6030)

(assert (=> b!586014 (= res!373826 (or (= lt!265977 (MissingZero!6030 i!1108)) (= lt!265977 (MissingVacant!6030 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36631 (_ BitVec 32)) SeekEntryResult!6030)

(assert (=> b!586014 (= lt!265977 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586015 () Bool)

(declare-fun res!373830 () Bool)

(assert (=> b!586015 (=> (not res!373830) (not e!335147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586015 (= res!373830 (validKeyInArray!0 (select (arr!17590 a!2986) j!136)))))

(declare-fun b!586016 () Bool)

(declare-fun res!373832 () Bool)

(assert (=> b!586016 (=> (not res!373832) (not e!335148))))

(assert (=> b!586016 (= res!373832 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17590 a!2986) index!984) (select (arr!17590 a!2986) j!136))) (not (= (select (arr!17590 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586017 () Bool)

(declare-fun res!373827 () Bool)

(assert (=> b!586017 (=> (not res!373827) (not e!335147))))

(assert (=> b!586017 (= res!373827 (validKeyInArray!0 k0!1786))))

(declare-fun b!586018 () Bool)

(declare-fun res!373829 () Bool)

(assert (=> b!586018 (=> (not res!373829) (not e!335148))))

(declare-datatypes ((List!11631 0))(
  ( (Nil!11628) (Cons!11627 (h!12672 (_ BitVec 64)) (t!17859 List!11631)) )
))
(declare-fun arrayNoDuplicates!0 (array!36631 (_ BitVec 32) List!11631) Bool)

(assert (=> b!586018 (= res!373829 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11628))))

(declare-fun b!586019 () Bool)

(declare-fun res!373828 () Bool)

(assert (=> b!586019 (=> (not res!373828) (not e!335147))))

(declare-fun arrayContainsKey!0 (array!36631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586019 (= res!373828 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53730 res!373834) b!586010))

(assert (= (and b!586010 res!373833) b!586015))

(assert (= (and b!586015 res!373830) b!586017))

(assert (= (and b!586017 res!373827) b!586019))

(assert (= (and b!586019 res!373828) b!586014))

(assert (= (and b!586014 res!373826) b!586009))

(assert (= (and b!586009 res!373825) b!586018))

(assert (= (and b!586018 res!373829) b!586011))

(assert (= (and b!586011 res!373835) b!586012))

(assert (= (and b!586012 res!373831) b!586016))

(assert (= (and b!586016 res!373832) b!586013))

(declare-fun m!564303 () Bool)

(assert (=> b!586015 m!564303))

(assert (=> b!586015 m!564303))

(declare-fun m!564305 () Bool)

(assert (=> b!586015 m!564305))

(declare-fun m!564307 () Bool)

(assert (=> b!586014 m!564307))

(declare-fun m!564309 () Bool)

(assert (=> b!586016 m!564309))

(assert (=> b!586016 m!564303))

(declare-fun m!564311 () Bool)

(assert (=> b!586019 m!564311))

(declare-fun m!564313 () Bool)

(assert (=> b!586009 m!564313))

(declare-fun m!564315 () Bool)

(assert (=> b!586018 m!564315))

(declare-fun m!564317 () Bool)

(assert (=> b!586017 m!564317))

(assert (=> b!586012 m!564303))

(assert (=> b!586012 m!564303))

(declare-fun m!564319 () Bool)

(assert (=> b!586012 m!564319))

(declare-fun m!564321 () Bool)

(assert (=> start!53730 m!564321))

(declare-fun m!564323 () Bool)

(assert (=> start!53730 m!564323))

(declare-fun m!564325 () Bool)

(assert (=> b!586013 m!564325))

(declare-fun m!564327 () Bool)

(assert (=> b!586013 m!564327))

(declare-fun m!564329 () Bool)

(assert (=> b!586013 m!564329))

(assert (=> b!586013 m!564303))

(declare-fun m!564331 () Bool)

(assert (=> b!586013 m!564331))

(assert (=> b!586013 m!564327))

(declare-fun m!564333 () Bool)

(assert (=> b!586013 m!564333))

(assert (=> b!586013 m!564303))

(declare-fun m!564335 () Bool)

(assert (=> b!586013 m!564335))

(declare-fun m!564337 () Bool)

(assert (=> b!586011 m!564337))

(assert (=> b!586011 m!564331))

(declare-fun m!564339 () Bool)

(assert (=> b!586011 m!564339))

(check-sat (not b!586015) (not b!586019) (not b!586013) (not b!586017) (not b!586009) (not b!586018) (not b!586014) (not b!586012) (not start!53730))
(check-sat)
