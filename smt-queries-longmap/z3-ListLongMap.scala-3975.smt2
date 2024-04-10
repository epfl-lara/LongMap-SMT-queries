; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53922 () Bool)

(assert start!53922)

(declare-fun b!588439 () Bool)

(declare-fun res!376077 () Bool)

(declare-fun e!336020 () Bool)

(assert (=> b!588439 (=> (not res!376077) (not e!336020))))

(declare-datatypes ((array!36766 0))(
  ( (array!36767 (arr!17656 (Array (_ BitVec 32) (_ BitVec 64))) (size!18020 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36766)

(declare-datatypes ((List!11697 0))(
  ( (Nil!11694) (Cons!11693 (h!12738 (_ BitVec 64)) (t!17925 List!11697)) )
))
(declare-fun arrayNoDuplicates!0 (array!36766 (_ BitVec 32) List!11697) Bool)

(assert (=> b!588439 (= res!376077 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11694))))

(declare-fun b!588440 () Bool)

(declare-fun e!336022 () Bool)

(assert (=> b!588440 (= e!336022 e!336020)))

(declare-fun res!376075 () Bool)

(assert (=> b!588440 (=> (not res!376075) (not e!336020))))

(declare-datatypes ((SeekEntryResult!6096 0))(
  ( (MissingZero!6096 (index!26614 (_ BitVec 32))) (Found!6096 (index!26615 (_ BitVec 32))) (Intermediate!6096 (undefined!6908 Bool) (index!26616 (_ BitVec 32)) (x!55414 (_ BitVec 32))) (Undefined!6096) (MissingVacant!6096 (index!26617 (_ BitVec 32))) )
))
(declare-fun lt!266793 () SeekEntryResult!6096)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588440 (= res!376075 (or (= lt!266793 (MissingZero!6096 i!1108)) (= lt!266793 (MissingVacant!6096 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36766 (_ BitVec 32)) SeekEntryResult!6096)

(assert (=> b!588440 (= lt!266793 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588441 () Bool)

(declare-fun res!376078 () Bool)

(assert (=> b!588441 (=> (not res!376078) (not e!336022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588441 (= res!376078 (validKeyInArray!0 k0!1786))))

(declare-fun b!588442 () Bool)

(declare-fun res!376079 () Bool)

(assert (=> b!588442 (=> (not res!376079) (not e!336020))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588442 (= res!376079 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17656 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17656 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588443 () Bool)

(declare-fun res!376080 () Bool)

(assert (=> b!588443 (=> (not res!376080) (not e!336020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36766 (_ BitVec 32)) Bool)

(assert (=> b!588443 (= res!376080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!376083 () Bool)

(assert (=> start!53922 (=> (not res!376083) (not e!336022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53922 (= res!376083 (validMask!0 mask!3053))))

(assert (=> start!53922 e!336022))

(assert (=> start!53922 true))

(declare-fun array_inv!13452 (array!36766) Bool)

(assert (=> start!53922 (array_inv!13452 a!2986)))

(declare-fun b!588444 () Bool)

(declare-fun e!336024 () Bool)

(assert (=> b!588444 (= e!336020 e!336024)))

(declare-fun res!376084 () Bool)

(assert (=> b!588444 (=> (not res!376084) (not e!336024))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!266790 () SeekEntryResult!6096)

(assert (=> b!588444 (= res!376084 (and (= lt!266790 (Found!6096 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17656 a!2986) index!984) (select (arr!17656 a!2986) j!136))) (not (= (select (arr!17656 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36766 (_ BitVec 32)) SeekEntryResult!6096)

(assert (=> b!588444 (= lt!266790 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17656 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588445 () Bool)

(declare-fun res!376085 () Bool)

(assert (=> b!588445 (=> (not res!376085) (not e!336022))))

(assert (=> b!588445 (= res!376085 (validKeyInArray!0 (select (arr!17656 a!2986) j!136)))))

(declare-fun b!588446 () Bool)

(assert (=> b!588446 (= e!336024 (not true))))

(declare-fun e!336023 () Bool)

(assert (=> b!588446 e!336023))

(declare-fun res!376076 () Bool)

(assert (=> b!588446 (=> (not res!376076) (not e!336023))))

(declare-fun lt!266792 () SeekEntryResult!6096)

(declare-fun lt!266794 () (_ BitVec 32))

(assert (=> b!588446 (= res!376076 (= lt!266792 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266794 vacantSpotIndex!68 (select (store (arr!17656 a!2986) i!1108 k0!1786) j!136) (array!36767 (store (arr!17656 a!2986) i!1108 k0!1786) (size!18020 a!2986)) mask!3053)))))

(assert (=> b!588446 (= lt!266792 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266794 vacantSpotIndex!68 (select (arr!17656 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18312 0))(
  ( (Unit!18313) )
))
(declare-fun lt!266791 () Unit!18312)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36766 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18312)

(assert (=> b!588446 (= lt!266791 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266794 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588446 (= lt!266794 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588447 () Bool)

(declare-fun res!376082 () Bool)

(assert (=> b!588447 (=> (not res!376082) (not e!336022))))

(declare-fun arrayContainsKey!0 (array!36766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588447 (= res!376082 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588448 () Bool)

(assert (=> b!588448 (= e!336023 (= lt!266790 lt!266792))))

(declare-fun b!588449 () Bool)

(declare-fun res!376081 () Bool)

(assert (=> b!588449 (=> (not res!376081) (not e!336022))))

(assert (=> b!588449 (= res!376081 (and (= (size!18020 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18020 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18020 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53922 res!376083) b!588449))

(assert (= (and b!588449 res!376081) b!588445))

(assert (= (and b!588445 res!376085) b!588441))

(assert (= (and b!588441 res!376078) b!588447))

(assert (= (and b!588447 res!376082) b!588440))

(assert (= (and b!588440 res!376075) b!588443))

(assert (= (and b!588443 res!376080) b!588439))

(assert (= (and b!588439 res!376077) b!588442))

(assert (= (and b!588442 res!376079) b!588444))

(assert (= (and b!588444 res!376084) b!588446))

(assert (= (and b!588446 res!376076) b!588448))

(declare-fun m!566991 () Bool)

(assert (=> b!588439 m!566991))

(declare-fun m!566993 () Bool)

(assert (=> b!588440 m!566993))

(declare-fun m!566995 () Bool)

(assert (=> b!588444 m!566995))

(declare-fun m!566997 () Bool)

(assert (=> b!588444 m!566997))

(assert (=> b!588444 m!566997))

(declare-fun m!566999 () Bool)

(assert (=> b!588444 m!566999))

(declare-fun m!567001 () Bool)

(assert (=> b!588446 m!567001))

(declare-fun m!567003 () Bool)

(assert (=> b!588446 m!567003))

(declare-fun m!567005 () Bool)

(assert (=> b!588446 m!567005))

(assert (=> b!588446 m!567003))

(declare-fun m!567007 () Bool)

(assert (=> b!588446 m!567007))

(declare-fun m!567009 () Bool)

(assert (=> b!588446 m!567009))

(assert (=> b!588446 m!566997))

(assert (=> b!588446 m!566997))

(declare-fun m!567011 () Bool)

(assert (=> b!588446 m!567011))

(declare-fun m!567013 () Bool)

(assert (=> b!588442 m!567013))

(assert (=> b!588442 m!567005))

(declare-fun m!567015 () Bool)

(assert (=> b!588442 m!567015))

(declare-fun m!567017 () Bool)

(assert (=> b!588447 m!567017))

(declare-fun m!567019 () Bool)

(assert (=> start!53922 m!567019))

(declare-fun m!567021 () Bool)

(assert (=> start!53922 m!567021))

(declare-fun m!567023 () Bool)

(assert (=> b!588443 m!567023))

(declare-fun m!567025 () Bool)

(assert (=> b!588441 m!567025))

(assert (=> b!588445 m!566997))

(assert (=> b!588445 m!566997))

(declare-fun m!567027 () Bool)

(assert (=> b!588445 m!567027))

(check-sat (not b!588443) (not b!588439) (not b!588447) (not b!588444) (not b!588441) (not start!53922) (not b!588445) (not b!588446) (not b!588440))
(check-sat)
