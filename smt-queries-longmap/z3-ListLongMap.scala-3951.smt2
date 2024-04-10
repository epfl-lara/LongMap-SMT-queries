; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53718 () Bool)

(assert start!53718)

(declare-fun b!585811 () Bool)

(declare-fun res!373635 () Bool)

(declare-fun e!335094 () Bool)

(assert (=> b!585811 (=> (not res!373635) (not e!335094))))

(declare-datatypes ((array!36619 0))(
  ( (array!36620 (arr!17584 (Array (_ BitVec 32) (_ BitVec 64))) (size!17948 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36619)

(declare-datatypes ((List!11625 0))(
  ( (Nil!11622) (Cons!11621 (h!12666 (_ BitVec 64)) (t!17853 List!11625)) )
))
(declare-fun arrayNoDuplicates!0 (array!36619 (_ BitVec 32) List!11625) Bool)

(assert (=> b!585811 (= res!373635 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11622))))

(declare-fun b!585812 () Bool)

(declare-fun e!335092 () Bool)

(assert (=> b!585812 (= e!335092 e!335094)))

(declare-fun res!373629 () Bool)

(assert (=> b!585812 (=> (not res!373629) (not e!335094))))

(declare-datatypes ((SeekEntryResult!6024 0))(
  ( (MissingZero!6024 (index!26323 (_ BitVec 32))) (Found!6024 (index!26324 (_ BitVec 32))) (Intermediate!6024 (undefined!6836 Bool) (index!26325 (_ BitVec 32)) (x!55141 (_ BitVec 32))) (Undefined!6024) (MissingVacant!6024 (index!26326 (_ BitVec 32))) )
))
(declare-fun lt!265923 () SeekEntryResult!6024)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585812 (= res!373629 (or (= lt!265923 (MissingZero!6024 i!1108)) (= lt!265923 (MissingVacant!6024 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36619 (_ BitVec 32)) SeekEntryResult!6024)

(assert (=> b!585812 (= lt!265923 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!373633 () Bool)

(assert (=> start!53718 (=> (not res!373633) (not e!335092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53718 (= res!373633 (validMask!0 mask!3053))))

(assert (=> start!53718 e!335092))

(assert (=> start!53718 true))

(declare-fun array_inv!13380 (array!36619) Bool)

(assert (=> start!53718 (array_inv!13380 a!2986)))

(declare-fun b!585813 () Bool)

(declare-fun res!373631 () Bool)

(assert (=> b!585813 (=> (not res!373631) (not e!335094))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585813 (= res!373631 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17584 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17584 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585814 () Bool)

(declare-fun res!373627 () Bool)

(assert (=> b!585814 (=> (not res!373627) (not e!335092))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!585814 (= res!373627 (and (= (size!17948 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17948 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17948 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585815 () Bool)

(declare-fun res!373637 () Bool)

(assert (=> b!585815 (=> (not res!373637) (not e!335094))))

(assert (=> b!585815 (= res!373637 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17584 a!2986) index!984) (select (arr!17584 a!2986) j!136))) (not (= (select (arr!17584 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585816 () Bool)

(declare-fun res!373630 () Bool)

(assert (=> b!585816 (=> (not res!373630) (not e!335092))))

(declare-fun arrayContainsKey!0 (array!36619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585816 (= res!373630 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585817 () Bool)

(declare-fun res!373628 () Bool)

(assert (=> b!585817 (=> (not res!373628) (not e!335094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36619 (_ BitVec 32)) Bool)

(assert (=> b!585817 (= res!373628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585818 () Bool)

(declare-fun res!373634 () Bool)

(assert (=> b!585818 (=> (not res!373634) (not e!335092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585818 (= res!373634 (validKeyInArray!0 k0!1786))))

(declare-fun b!585819 () Bool)

(assert (=> b!585819 (= e!335094 (not true))))

(declare-fun lt!265922 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36619 (_ BitVec 32)) SeekEntryResult!6024)

(assert (=> b!585819 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265922 vacantSpotIndex!68 (select (arr!17584 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265922 vacantSpotIndex!68 (select (store (arr!17584 a!2986) i!1108 k0!1786) j!136) (array!36620 (store (arr!17584 a!2986) i!1108 k0!1786) (size!17948 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18168 0))(
  ( (Unit!18169) )
))
(declare-fun lt!265924 () Unit!18168)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36619 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18168)

(assert (=> b!585819 (= lt!265924 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265922 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585819 (= lt!265922 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585820 () Bool)

(declare-fun res!373636 () Bool)

(assert (=> b!585820 (=> (not res!373636) (not e!335092))))

(assert (=> b!585820 (= res!373636 (validKeyInArray!0 (select (arr!17584 a!2986) j!136)))))

(declare-fun b!585821 () Bool)

(declare-fun res!373632 () Bool)

(assert (=> b!585821 (=> (not res!373632) (not e!335094))))

(assert (=> b!585821 (= res!373632 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17584 a!2986) j!136) a!2986 mask!3053) (Found!6024 j!136)))))

(assert (= (and start!53718 res!373633) b!585814))

(assert (= (and b!585814 res!373627) b!585820))

(assert (= (and b!585820 res!373636) b!585818))

(assert (= (and b!585818 res!373634) b!585816))

(assert (= (and b!585816 res!373630) b!585812))

(assert (= (and b!585812 res!373629) b!585817))

(assert (= (and b!585817 res!373628) b!585811))

(assert (= (and b!585811 res!373635) b!585813))

(assert (= (and b!585813 res!373631) b!585821))

(assert (= (and b!585821 res!373632) b!585815))

(assert (= (and b!585815 res!373637) b!585819))

(declare-fun m!564075 () Bool)

(assert (=> b!585811 m!564075))

(declare-fun m!564077 () Bool)

(assert (=> b!585815 m!564077))

(declare-fun m!564079 () Bool)

(assert (=> b!585815 m!564079))

(declare-fun m!564081 () Bool)

(assert (=> start!53718 m!564081))

(declare-fun m!564083 () Bool)

(assert (=> start!53718 m!564083))

(declare-fun m!564085 () Bool)

(assert (=> b!585817 m!564085))

(declare-fun m!564087 () Bool)

(assert (=> b!585818 m!564087))

(declare-fun m!564089 () Bool)

(assert (=> b!585819 m!564089))

(assert (=> b!585819 m!564089))

(declare-fun m!564091 () Bool)

(assert (=> b!585819 m!564091))

(assert (=> b!585819 m!564079))

(declare-fun m!564093 () Bool)

(assert (=> b!585819 m!564093))

(assert (=> b!585819 m!564079))

(declare-fun m!564095 () Bool)

(assert (=> b!585819 m!564095))

(declare-fun m!564097 () Bool)

(assert (=> b!585819 m!564097))

(declare-fun m!564099 () Bool)

(assert (=> b!585819 m!564099))

(declare-fun m!564101 () Bool)

(assert (=> b!585812 m!564101))

(assert (=> b!585821 m!564079))

(assert (=> b!585821 m!564079))

(declare-fun m!564103 () Bool)

(assert (=> b!585821 m!564103))

(assert (=> b!585820 m!564079))

(assert (=> b!585820 m!564079))

(declare-fun m!564105 () Bool)

(assert (=> b!585820 m!564105))

(declare-fun m!564107 () Bool)

(assert (=> b!585813 m!564107))

(assert (=> b!585813 m!564093))

(declare-fun m!564109 () Bool)

(assert (=> b!585813 m!564109))

(declare-fun m!564111 () Bool)

(assert (=> b!585816 m!564111))

(check-sat (not b!585817) (not b!585812) (not b!585816) (not b!585820) (not b!585818) (not b!585819) (not b!585811) (not start!53718) (not b!585821))
(check-sat)
