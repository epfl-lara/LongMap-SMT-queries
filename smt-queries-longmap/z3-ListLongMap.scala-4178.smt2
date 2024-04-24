; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57036 () Bool)

(assert start!57036)

(declare-fun b!630822 () Bool)

(declare-fun res!407737 () Bool)

(declare-fun e!360730 () Bool)

(assert (=> b!630822 (=> (not res!407737) (not e!360730))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630822 (= res!407737 (validKeyInArray!0 k0!1786))))

(declare-fun b!630823 () Bool)

(declare-datatypes ((Unit!21129 0))(
  ( (Unit!21130) )
))
(declare-fun e!360728 () Unit!21129)

(declare-fun Unit!21131 () Unit!21129)

(assert (=> b!630823 (= e!360728 Unit!21131)))

(declare-fun b!630824 () Bool)

(declare-fun e!360726 () Bool)

(assert (=> b!630824 (= e!360730 e!360726)))

(declare-fun res!407740 () Bool)

(assert (=> b!630824 (=> (not res!407740) (not e!360726))))

(declare-datatypes ((SeekEntryResult!6655 0))(
  ( (MissingZero!6655 (index!28910 (_ BitVec 32))) (Found!6655 (index!28911 (_ BitVec 32))) (Intermediate!6655 (undefined!7467 Bool) (index!28912 (_ BitVec 32)) (x!57804 (_ BitVec 32))) (Undefined!6655) (MissingVacant!6655 (index!28913 (_ BitVec 32))) )
))
(declare-fun lt!291360 () SeekEntryResult!6655)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!630824 (= res!407740 (or (= lt!291360 (MissingZero!6655 i!1108)) (= lt!291360 (MissingVacant!6655 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!38055 0))(
  ( (array!38056 (arr!18259 (Array (_ BitVec 32) (_ BitVec 64))) (size!18623 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38055)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38055 (_ BitVec 32)) SeekEntryResult!6655)

(assert (=> b!630824 (= lt!291360 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!630825 () Bool)

(declare-fun e!360729 () Bool)

(declare-fun e!360727 () Bool)

(assert (=> b!630825 (= e!360729 e!360727)))

(declare-fun res!407735 () Bool)

(assert (=> b!630825 (=> (not res!407735) (not e!360727))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!291361 () SeekEntryResult!6655)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!630825 (= res!407735 (and (= lt!291361 (Found!6655 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18259 a!2986) index!984) (select (arr!18259 a!2986) j!136))) (not (= (select (arr!18259 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38055 (_ BitVec 32)) SeekEntryResult!6655)

(assert (=> b!630825 (= lt!291361 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18259 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630826 () Bool)

(declare-fun res!407729 () Bool)

(assert (=> b!630826 (=> (not res!407729) (not e!360726))))

(assert (=> b!630826 (= res!407729 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18259 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630827 () Bool)

(declare-fun res!407736 () Bool)

(assert (=> b!630827 (=> (not res!407736) (not e!360730))))

(declare-fun arrayContainsKey!0 (array!38055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630827 (= res!407736 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630828 () Bool)

(assert (=> b!630828 (= e!360727 (not true))))

(declare-fun lt!291363 () Unit!21129)

(assert (=> b!630828 (= lt!291363 e!360728)))

(declare-fun c!71915 () Bool)

(declare-fun lt!291362 () (_ BitVec 64))

(declare-fun lt!291364 () array!38055)

(assert (=> b!630828 (= c!71915 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291362 lt!291364 mask!3053) Undefined!6655))))

(declare-fun e!360732 () Bool)

(assert (=> b!630828 e!360732))

(declare-fun res!407739 () Bool)

(assert (=> b!630828 (=> (not res!407739) (not e!360732))))

(declare-fun lt!291358 () (_ BitVec 32))

(declare-fun lt!291357 () SeekEntryResult!6655)

(assert (=> b!630828 (= res!407739 (= lt!291357 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291358 vacantSpotIndex!68 lt!291362 lt!291364 mask!3053)))))

(assert (=> b!630828 (= lt!291357 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291358 vacantSpotIndex!68 (select (arr!18259 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!630828 (= lt!291362 (select (store (arr!18259 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291359 () Unit!21129)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38055 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21129)

(assert (=> b!630828 (= lt!291359 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291358 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630828 (= lt!291358 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!630829 () Bool)

(declare-fun res!407732 () Bool)

(assert (=> b!630829 (=> (not res!407732) (not e!360730))))

(assert (=> b!630829 (= res!407732 (validKeyInArray!0 (select (arr!18259 a!2986) j!136)))))

(declare-fun b!630830 () Bool)

(declare-fun res!407730 () Bool)

(assert (=> b!630830 (=> (not res!407730) (not e!360730))))

(assert (=> b!630830 (= res!407730 (and (= (size!18623 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18623 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18623 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630831 () Bool)

(assert (=> b!630831 (= e!360726 e!360729)))

(declare-fun res!407731 () Bool)

(assert (=> b!630831 (=> (not res!407731) (not e!360729))))

(assert (=> b!630831 (= res!407731 (= (select (store (arr!18259 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630831 (= lt!291364 (array!38056 (store (arr!18259 a!2986) i!1108 k0!1786) (size!18623 a!2986)))))

(declare-fun b!630832 () Bool)

(declare-fun res!407738 () Bool)

(assert (=> b!630832 (=> (not res!407738) (not e!360726))))

(declare-datatypes ((List!12207 0))(
  ( (Nil!12204) (Cons!12203 (h!13251 (_ BitVec 64)) (t!18427 List!12207)) )
))
(declare-fun arrayNoDuplicates!0 (array!38055 (_ BitVec 32) List!12207) Bool)

(assert (=> b!630832 (= res!407738 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12204))))

(declare-fun res!407734 () Bool)

(assert (=> start!57036 (=> (not res!407734) (not e!360730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57036 (= res!407734 (validMask!0 mask!3053))))

(assert (=> start!57036 e!360730))

(assert (=> start!57036 true))

(declare-fun array_inv!14118 (array!38055) Bool)

(assert (=> start!57036 (array_inv!14118 a!2986)))

(declare-fun b!630833 () Bool)

(declare-fun res!407733 () Bool)

(assert (=> b!630833 (=> (not res!407733) (not e!360726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38055 (_ BitVec 32)) Bool)

(assert (=> b!630833 (= res!407733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630834 () Bool)

(declare-fun Unit!21132 () Unit!21129)

(assert (=> b!630834 (= e!360728 Unit!21132)))

(assert (=> b!630834 false))

(declare-fun b!630835 () Bool)

(assert (=> b!630835 (= e!360732 (= lt!291361 lt!291357))))

(assert (= (and start!57036 res!407734) b!630830))

(assert (= (and b!630830 res!407730) b!630829))

(assert (= (and b!630829 res!407732) b!630822))

(assert (= (and b!630822 res!407737) b!630827))

(assert (= (and b!630827 res!407736) b!630824))

(assert (= (and b!630824 res!407740) b!630833))

(assert (= (and b!630833 res!407733) b!630832))

(assert (= (and b!630832 res!407738) b!630826))

(assert (= (and b!630826 res!407729) b!630831))

(assert (= (and b!630831 res!407731) b!630825))

(assert (= (and b!630825 res!407735) b!630828))

(assert (= (and b!630828 res!407739) b!630835))

(assert (= (and b!630828 c!71915) b!630834))

(assert (= (and b!630828 (not c!71915)) b!630823))

(declare-fun m!606097 () Bool)

(assert (=> b!630829 m!606097))

(assert (=> b!630829 m!606097))

(declare-fun m!606099 () Bool)

(assert (=> b!630829 m!606099))

(declare-fun m!606101 () Bool)

(assert (=> b!630824 m!606101))

(declare-fun m!606103 () Bool)

(assert (=> b!630826 m!606103))

(declare-fun m!606105 () Bool)

(assert (=> b!630833 m!606105))

(declare-fun m!606107 () Bool)

(assert (=> start!57036 m!606107))

(declare-fun m!606109 () Bool)

(assert (=> start!57036 m!606109))

(declare-fun m!606111 () Bool)

(assert (=> b!630828 m!606111))

(declare-fun m!606113 () Bool)

(assert (=> b!630828 m!606113))

(assert (=> b!630828 m!606097))

(declare-fun m!606115 () Bool)

(assert (=> b!630828 m!606115))

(assert (=> b!630828 m!606097))

(declare-fun m!606117 () Bool)

(assert (=> b!630828 m!606117))

(declare-fun m!606119 () Bool)

(assert (=> b!630828 m!606119))

(declare-fun m!606121 () Bool)

(assert (=> b!630828 m!606121))

(declare-fun m!606123 () Bool)

(assert (=> b!630828 m!606123))

(declare-fun m!606125 () Bool)

(assert (=> b!630822 m!606125))

(declare-fun m!606127 () Bool)

(assert (=> b!630827 m!606127))

(assert (=> b!630831 m!606115))

(declare-fun m!606129 () Bool)

(assert (=> b!630831 m!606129))

(declare-fun m!606131 () Bool)

(assert (=> b!630832 m!606131))

(declare-fun m!606133 () Bool)

(assert (=> b!630825 m!606133))

(assert (=> b!630825 m!606097))

(assert (=> b!630825 m!606097))

(declare-fun m!606135 () Bool)

(assert (=> b!630825 m!606135))

(check-sat (not b!630833) (not start!57036) (not b!630822) (not b!630827) (not b!630824) (not b!630832) (not b!630828) (not b!630829) (not b!630825))
(check-sat)
