; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53670 () Bool)

(assert start!53670)

(declare-fun b!584970 () Bool)

(declare-fun res!372788 () Bool)

(declare-fun e!334828 () Bool)

(assert (=> b!584970 (=> (not res!372788) (not e!334828))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584970 (= res!372788 (validKeyInArray!0 k0!1786))))

(declare-fun b!584971 () Bool)

(declare-fun e!334830 () Bool)

(assert (=> b!584971 (= e!334828 e!334830)))

(declare-fun res!372791 () Bool)

(assert (=> b!584971 (=> (not res!372791) (not e!334830))))

(declare-datatypes ((SeekEntryResult!6000 0))(
  ( (MissingZero!6000 (index!26227 (_ BitVec 32))) (Found!6000 (index!26228 (_ BitVec 32))) (Intermediate!6000 (undefined!6812 Bool) (index!26229 (_ BitVec 32)) (x!55053 (_ BitVec 32))) (Undefined!6000) (MissingVacant!6000 (index!26230 (_ BitVec 32))) )
))
(declare-fun lt!265707 () SeekEntryResult!6000)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584971 (= res!372791 (or (= lt!265707 (MissingZero!6000 i!1108)) (= lt!265707 (MissingVacant!6000 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!36571 0))(
  ( (array!36572 (arr!17560 (Array (_ BitVec 32) (_ BitVec 64))) (size!17924 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36571)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36571 (_ BitVec 32)) SeekEntryResult!6000)

(assert (=> b!584971 (= lt!265707 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584972 () Bool)

(declare-fun e!334827 () Bool)

(assert (=> b!584972 (= e!334830 e!334827)))

(declare-fun res!372787 () Bool)

(assert (=> b!584972 (=> (not res!372787) (not e!334827))))

(declare-fun lt!265706 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!584972 (= res!372787 (and (bvsge lt!265706 #b00000000000000000000000000000000) (bvslt lt!265706 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584972 (= lt!265706 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!372795 () Bool)

(assert (=> start!53670 (=> (not res!372795) (not e!334828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53670 (= res!372795 (validMask!0 mask!3053))))

(assert (=> start!53670 e!334828))

(assert (=> start!53670 true))

(declare-fun array_inv!13356 (array!36571) Bool)

(assert (=> start!53670 (array_inv!13356 a!2986)))

(declare-fun b!584973 () Bool)

(declare-fun res!372793 () Bool)

(assert (=> b!584973 (=> (not res!372793) (not e!334828))))

(declare-fun arrayContainsKey!0 (array!36571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584973 (= res!372793 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584974 () Bool)

(declare-fun res!372786 () Bool)

(assert (=> b!584974 (=> (not res!372786) (not e!334830))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36571 (_ BitVec 32)) SeekEntryResult!6000)

(assert (=> b!584974 (= res!372786 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17560 a!2986) j!136) a!2986 mask!3053) (Found!6000 j!136)))))

(declare-fun b!584975 () Bool)

(declare-fun res!372789 () Bool)

(assert (=> b!584975 (=> (not res!372789) (not e!334830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36571 (_ BitVec 32)) Bool)

(assert (=> b!584975 (= res!372789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584976 () Bool)

(assert (=> b!584976 (= e!334827 false)))

(declare-fun lt!265708 () SeekEntryResult!6000)

(assert (=> b!584976 (= lt!265708 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265706 vacantSpotIndex!68 (select (arr!17560 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584977 () Bool)

(declare-fun res!372792 () Bool)

(assert (=> b!584977 (=> (not res!372792) (not e!334830))))

(declare-datatypes ((List!11601 0))(
  ( (Nil!11598) (Cons!11597 (h!12642 (_ BitVec 64)) (t!17829 List!11601)) )
))
(declare-fun arrayNoDuplicates!0 (array!36571 (_ BitVec 32) List!11601) Bool)

(assert (=> b!584977 (= res!372792 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11598))))

(declare-fun b!584978 () Bool)

(declare-fun res!372790 () Bool)

(assert (=> b!584978 (=> (not res!372790) (not e!334830))))

(assert (=> b!584978 (= res!372790 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17560 a!2986) index!984) (select (arr!17560 a!2986) j!136))) (not (= (select (arr!17560 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584979 () Bool)

(declare-fun res!372794 () Bool)

(assert (=> b!584979 (=> (not res!372794) (not e!334830))))

(assert (=> b!584979 (= res!372794 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17560 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17560 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584980 () Bool)

(declare-fun res!372797 () Bool)

(assert (=> b!584980 (=> (not res!372797) (not e!334828))))

(assert (=> b!584980 (= res!372797 (validKeyInArray!0 (select (arr!17560 a!2986) j!136)))))

(declare-fun b!584981 () Bool)

(declare-fun res!372796 () Bool)

(assert (=> b!584981 (=> (not res!372796) (not e!334828))))

(assert (=> b!584981 (= res!372796 (and (= (size!17924 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17924 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17924 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53670 res!372795) b!584981))

(assert (= (and b!584981 res!372796) b!584980))

(assert (= (and b!584980 res!372797) b!584970))

(assert (= (and b!584970 res!372788) b!584973))

(assert (= (and b!584973 res!372793) b!584971))

(assert (= (and b!584971 res!372791) b!584975))

(assert (= (and b!584975 res!372789) b!584977))

(assert (= (and b!584977 res!372792) b!584979))

(assert (= (and b!584979 res!372794) b!584974))

(assert (= (and b!584974 res!372786) b!584978))

(assert (= (and b!584978 res!372790) b!584972))

(assert (= (and b!584972 res!372787) b!584976))

(declare-fun m!563265 () Bool)

(assert (=> b!584976 m!563265))

(assert (=> b!584976 m!563265))

(declare-fun m!563267 () Bool)

(assert (=> b!584976 m!563267))

(declare-fun m!563269 () Bool)

(assert (=> b!584979 m!563269))

(declare-fun m!563271 () Bool)

(assert (=> b!584979 m!563271))

(declare-fun m!563273 () Bool)

(assert (=> b!584979 m!563273))

(declare-fun m!563275 () Bool)

(assert (=> b!584977 m!563275))

(declare-fun m!563277 () Bool)

(assert (=> start!53670 m!563277))

(declare-fun m!563279 () Bool)

(assert (=> start!53670 m!563279))

(declare-fun m!563281 () Bool)

(assert (=> b!584971 m!563281))

(declare-fun m!563283 () Bool)

(assert (=> b!584970 m!563283))

(declare-fun m!563285 () Bool)

(assert (=> b!584973 m!563285))

(declare-fun m!563287 () Bool)

(assert (=> b!584972 m!563287))

(declare-fun m!563289 () Bool)

(assert (=> b!584978 m!563289))

(assert (=> b!584978 m!563265))

(declare-fun m!563291 () Bool)

(assert (=> b!584975 m!563291))

(assert (=> b!584980 m!563265))

(assert (=> b!584980 m!563265))

(declare-fun m!563293 () Bool)

(assert (=> b!584980 m!563293))

(assert (=> b!584974 m!563265))

(assert (=> b!584974 m!563265))

(declare-fun m!563295 () Bool)

(assert (=> b!584974 m!563295))

(check-sat (not start!53670) (not b!584974) (not b!584980) (not b!584972) (not b!584971) (not b!584970) (not b!584976) (not b!584975) (not b!584973) (not b!584977))
