; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54566 () Bool)

(assert start!54566)

(declare-fun b!596865 () Bool)

(declare-fun e!341023 () Bool)

(declare-fun e!341021 () Bool)

(assert (=> b!596865 (= e!341023 e!341021)))

(declare-fun res!382614 () Bool)

(assert (=> b!596865 (=> res!382614 e!341021)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!271134 () (_ BitVec 64))

(declare-fun lt!271130 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37026 0))(
  ( (array!37027 (arr!17777 (Array (_ BitVec 32) (_ BitVec 64))) (size!18141 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37026)

(assert (=> b!596865 (= res!382614 (or (not (= (select (arr!17777 a!2986) j!136) lt!271134)) (not (= (select (arr!17777 a!2986) j!136) lt!271130)) (bvsge j!136 index!984)))))

(declare-fun b!596866 () Bool)

(declare-fun res!382628 () Bool)

(declare-fun e!341025 () Bool)

(assert (=> b!596866 (=> (not res!382628) (not e!341025))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596866 (= res!382628 (and (= (size!18141 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18141 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18141 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596867 () Bool)

(declare-fun res!382622 () Bool)

(assert (=> b!596867 (=> (not res!382622) (not e!341025))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596867 (= res!382622 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596868 () Bool)

(declare-datatypes ((Unit!18786 0))(
  ( (Unit!18787) )
))
(declare-fun e!341022 () Unit!18786)

(declare-fun Unit!18788 () Unit!18786)

(assert (=> b!596868 (= e!341022 Unit!18788)))

(declare-fun b!596869 () Bool)

(declare-fun e!341027 () Bool)

(declare-fun e!341018 () Bool)

(assert (=> b!596869 (= e!341027 e!341018)))

(declare-fun res!382617 () Bool)

(assert (=> b!596869 (=> (not res!382617) (not e!341018))))

(declare-datatypes ((SeekEntryResult!6217 0))(
  ( (MissingZero!6217 (index!27116 (_ BitVec 32))) (Found!6217 (index!27117 (_ BitVec 32))) (Intermediate!6217 (undefined!7029 Bool) (index!27118 (_ BitVec 32)) (x!55909 (_ BitVec 32))) (Undefined!6217) (MissingVacant!6217 (index!27119 (_ BitVec 32))) )
))
(declare-fun lt!271138 () SeekEntryResult!6217)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!596869 (= res!382617 (and (= lt!271138 (Found!6217 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17777 a!2986) index!984) (select (arr!17777 a!2986) j!136))) (not (= (select (arr!17777 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37026 (_ BitVec 32)) SeekEntryResult!6217)

(assert (=> b!596869 (= lt!271138 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17777 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596870 () Bool)

(declare-fun Unit!18789 () Unit!18786)

(assert (=> b!596870 (= e!341022 Unit!18789)))

(assert (=> b!596870 false))

(declare-fun b!596871 () Bool)

(declare-fun res!382620 () Bool)

(declare-fun e!341020 () Bool)

(assert (=> b!596871 (=> (not res!382620) (not e!341020))))

(declare-datatypes ((List!11818 0))(
  ( (Nil!11815) (Cons!11814 (h!12859 (_ BitVec 64)) (t!18046 List!11818)) )
))
(declare-fun arrayNoDuplicates!0 (array!37026 (_ BitVec 32) List!11818) Bool)

(assert (=> b!596871 (= res!382620 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11815))))

(declare-fun e!341026 () Bool)

(declare-fun b!596872 () Bool)

(declare-fun lt!271137 () array!37026)

(assert (=> b!596872 (= e!341026 (arrayContainsKey!0 lt!271137 (select (arr!17777 a!2986) j!136) index!984))))

(declare-fun b!596873 () Bool)

(declare-fun res!382613 () Bool)

(assert (=> b!596873 (=> (not res!382613) (not e!341020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37026 (_ BitVec 32)) Bool)

(assert (=> b!596873 (= res!382613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596874 () Bool)

(declare-fun e!341028 () Bool)

(declare-fun lt!271141 () SeekEntryResult!6217)

(assert (=> b!596874 (= e!341028 (= lt!271138 lt!271141))))

(declare-fun b!596875 () Bool)

(declare-fun res!382624 () Bool)

(assert (=> b!596875 (=> (not res!382624) (not e!341025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596875 (= res!382624 (validKeyInArray!0 (select (arr!17777 a!2986) j!136)))))

(declare-fun b!596876 () Bool)

(assert (=> b!596876 (= e!341020 e!341027)))

(declare-fun res!382612 () Bool)

(assert (=> b!596876 (=> (not res!382612) (not e!341027))))

(assert (=> b!596876 (= res!382612 (= (select (store (arr!17777 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596876 (= lt!271137 (array!37027 (store (arr!17777 a!2986) i!1108 k!1786) (size!18141 a!2986)))))

(declare-fun b!596877 () Bool)

(assert (=> b!596877 (= e!341025 e!341020)))

(declare-fun res!382618 () Bool)

(assert (=> b!596877 (=> (not res!382618) (not e!341020))))

(declare-fun lt!271135 () SeekEntryResult!6217)

(assert (=> b!596877 (= res!382618 (or (= lt!271135 (MissingZero!6217 i!1108)) (= lt!271135 (MissingVacant!6217 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37026 (_ BitVec 32)) SeekEntryResult!6217)

(assert (=> b!596877 (= lt!271135 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!596878 () Bool)

(declare-fun res!382616 () Bool)

(assert (=> b!596878 (=> (not res!382616) (not e!341025))))

(assert (=> b!596878 (= res!382616 (validKeyInArray!0 k!1786))))

(declare-fun b!596864 () Bool)

(declare-fun e!341017 () Bool)

(assert (=> b!596864 (= e!341017 (bvsle #b00000000000000000000000000000000 (size!18141 a!2986)))))

(assert (=> b!596864 (arrayNoDuplicates!0 lt!271137 #b00000000000000000000000000000000 Nil!11815)))

(declare-fun lt!271139 () Unit!18786)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37026 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11818) Unit!18786)

(assert (=> b!596864 (= lt!271139 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11815))))

(assert (=> b!596864 (arrayContainsKey!0 lt!271137 (select (arr!17777 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271140 () Unit!18786)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37026 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18786)

(assert (=> b!596864 (= lt!271140 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271137 (select (arr!17777 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun res!382623 () Bool)

(assert (=> start!54566 (=> (not res!382623) (not e!341025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54566 (= res!382623 (validMask!0 mask!3053))))

(assert (=> start!54566 e!341025))

(assert (=> start!54566 true))

(declare-fun array_inv!13573 (array!37026) Bool)

(assert (=> start!54566 (array_inv!13573 a!2986)))

(declare-fun b!596879 () Bool)

(declare-fun res!382619 () Bool)

(assert (=> b!596879 (=> (not res!382619) (not e!341020))))

(assert (=> b!596879 (= res!382619 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17777 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596880 () Bool)

(declare-fun e!341019 () Bool)

(assert (=> b!596880 (= e!341018 (not e!341019))))

(declare-fun res!382627 () Bool)

(assert (=> b!596880 (=> res!382627 e!341019)))

(declare-fun lt!271132 () SeekEntryResult!6217)

(assert (=> b!596880 (= res!382627 (not (= lt!271132 (Found!6217 index!984))))))

(declare-fun lt!271136 () Unit!18786)

(assert (=> b!596880 (= lt!271136 e!341022)))

(declare-fun c!67493 () Bool)

(assert (=> b!596880 (= c!67493 (= lt!271132 Undefined!6217))))

(assert (=> b!596880 (= lt!271132 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271134 lt!271137 mask!3053))))

(assert (=> b!596880 e!341028))

(declare-fun res!382626 () Bool)

(assert (=> b!596880 (=> (not res!382626) (not e!341028))))

(declare-fun lt!271131 () (_ BitVec 32))

(assert (=> b!596880 (= res!382626 (= lt!271141 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271131 vacantSpotIndex!68 lt!271134 lt!271137 mask!3053)))))

(assert (=> b!596880 (= lt!271141 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271131 vacantSpotIndex!68 (select (arr!17777 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596880 (= lt!271134 (select (store (arr!17777 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!271133 () Unit!18786)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37026 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18786)

(assert (=> b!596880 (= lt!271133 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271131 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596880 (= lt!271131 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596881 () Bool)

(assert (=> b!596881 (= e!341021 e!341026)))

(declare-fun res!382615 () Bool)

(assert (=> b!596881 (=> (not res!382615) (not e!341026))))

(assert (=> b!596881 (= res!382615 (arrayContainsKey!0 lt!271137 (select (arr!17777 a!2986) j!136) j!136))))

(declare-fun b!596882 () Bool)

(assert (=> b!596882 (= e!341019 e!341017)))

(declare-fun res!382621 () Bool)

(assert (=> b!596882 (=> res!382621 e!341017)))

(assert (=> b!596882 (= res!382621 (or (not (= (select (arr!17777 a!2986) j!136) lt!271134)) (not (= (select (arr!17777 a!2986) j!136) lt!271130)) (bvsge j!136 index!984)))))

(assert (=> b!596882 e!341023))

(declare-fun res!382625 () Bool)

(assert (=> b!596882 (=> (not res!382625) (not e!341023))))

(assert (=> b!596882 (= res!382625 (= lt!271130 (select (arr!17777 a!2986) j!136)))))

(assert (=> b!596882 (= lt!271130 (select (store (arr!17777 a!2986) i!1108 k!1786) index!984))))

(assert (= (and start!54566 res!382623) b!596866))

(assert (= (and b!596866 res!382628) b!596875))

(assert (= (and b!596875 res!382624) b!596878))

(assert (= (and b!596878 res!382616) b!596867))

(assert (= (and b!596867 res!382622) b!596877))

(assert (= (and b!596877 res!382618) b!596873))

(assert (= (and b!596873 res!382613) b!596871))

(assert (= (and b!596871 res!382620) b!596879))

(assert (= (and b!596879 res!382619) b!596876))

(assert (= (and b!596876 res!382612) b!596869))

(assert (= (and b!596869 res!382617) b!596880))

(assert (= (and b!596880 res!382626) b!596874))

(assert (= (and b!596880 c!67493) b!596870))

(assert (= (and b!596880 (not c!67493)) b!596868))

(assert (= (and b!596880 (not res!382627)) b!596882))

(assert (= (and b!596882 res!382625) b!596865))

(assert (= (and b!596865 (not res!382614)) b!596881))

(assert (= (and b!596881 res!382615) b!596872))

(assert (= (and b!596882 (not res!382621)) b!596864))

(declare-fun m!574307 () Bool)

(assert (=> b!596875 m!574307))

(assert (=> b!596875 m!574307))

(declare-fun m!574309 () Bool)

(assert (=> b!596875 m!574309))

(declare-fun m!574311 () Bool)

(assert (=> b!596867 m!574311))

(declare-fun m!574313 () Bool)

(assert (=> b!596877 m!574313))

(assert (=> b!596872 m!574307))

(assert (=> b!596872 m!574307))

(declare-fun m!574315 () Bool)

(assert (=> b!596872 m!574315))

(declare-fun m!574317 () Bool)

(assert (=> b!596876 m!574317))

(declare-fun m!574319 () Bool)

(assert (=> b!596876 m!574319))

(declare-fun m!574321 () Bool)

(assert (=> b!596869 m!574321))

(assert (=> b!596869 m!574307))

(assert (=> b!596869 m!574307))

(declare-fun m!574323 () Bool)

(assert (=> b!596869 m!574323))

(assert (=> b!596881 m!574307))

(assert (=> b!596881 m!574307))

(declare-fun m!574325 () Bool)

(assert (=> b!596881 m!574325))

(declare-fun m!574327 () Bool)

(assert (=> start!54566 m!574327))

(declare-fun m!574329 () Bool)

(assert (=> start!54566 m!574329))

(assert (=> b!596865 m!574307))

(declare-fun m!574331 () Bool)

(assert (=> b!596880 m!574331))

(assert (=> b!596880 m!574307))

(assert (=> b!596880 m!574317))

(declare-fun m!574333 () Bool)

(assert (=> b!596880 m!574333))

(declare-fun m!574335 () Bool)

(assert (=> b!596880 m!574335))

(declare-fun m!574337 () Bool)

(assert (=> b!596880 m!574337))

(assert (=> b!596880 m!574307))

(declare-fun m!574339 () Bool)

(assert (=> b!596880 m!574339))

(declare-fun m!574341 () Bool)

(assert (=> b!596880 m!574341))

(assert (=> b!596882 m!574307))

(assert (=> b!596882 m!574317))

(declare-fun m!574343 () Bool)

(assert (=> b!596882 m!574343))

(assert (=> b!596864 m!574307))

(declare-fun m!574345 () Bool)

(assert (=> b!596864 m!574345))

(assert (=> b!596864 m!574307))

(declare-fun m!574347 () Bool)

(assert (=> b!596864 m!574347))

(assert (=> b!596864 m!574307))

(declare-fun m!574349 () Bool)

(assert (=> b!596864 m!574349))

(declare-fun m!574351 () Bool)

(assert (=> b!596864 m!574351))

(declare-fun m!574353 () Bool)

(assert (=> b!596873 m!574353))

(declare-fun m!574355 () Bool)

(assert (=> b!596878 m!574355))

(declare-fun m!574357 () Bool)

(assert (=> b!596871 m!574357))

(declare-fun m!574359 () Bool)

(assert (=> b!596879 m!574359))

(push 1)

