; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55802 () Bool)

(assert start!55802)

(declare-fun b!611194 () Bool)

(declare-fun e!350214 () Bool)

(declare-fun e!350212 () Bool)

(assert (=> b!611194 (= e!350214 e!350212)))

(declare-fun res!393139 () Bool)

(assert (=> b!611194 (=> (not res!393139) (not e!350212))))

(declare-datatypes ((List!11971 0))(
  ( (Nil!11968) (Cons!11967 (h!13012 (_ BitVec 64)) (t!18199 List!11971)) )
))
(declare-fun contains!3044 (List!11971 (_ BitVec 64)) Bool)

(assert (=> b!611194 (= res!393139 (not (contains!3044 Nil!11968 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611195 () Bool)

(declare-fun e!350211 () Bool)

(declare-datatypes ((SeekEntryResult!6370 0))(
  ( (MissingZero!6370 (index!27761 (_ BitVec 32))) (Found!6370 (index!27762 (_ BitVec 32))) (Intermediate!6370 (undefined!7182 Bool) (index!27763 (_ BitVec 32)) (x!56569 (_ BitVec 32))) (Undefined!6370) (MissingVacant!6370 (index!27764 (_ BitVec 32))) )
))
(declare-fun lt!279622 () SeekEntryResult!6370)

(declare-fun lt!279629 () SeekEntryResult!6370)

(assert (=> b!611195 (= e!350211 (= lt!279622 lt!279629))))

(declare-fun res!393131 () Bool)

(declare-fun e!350198 () Bool)

(assert (=> start!55802 (=> (not res!393131) (not e!350198))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55802 (= res!393131 (validMask!0 mask!3053))))

(assert (=> start!55802 e!350198))

(assert (=> start!55802 true))

(declare-datatypes ((array!37365 0))(
  ( (array!37366 (arr!17930 (Array (_ BitVec 32) (_ BitVec 64))) (size!18294 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37365)

(declare-fun array_inv!13726 (array!37365) Bool)

(assert (=> start!55802 (array_inv!13726 a!2986)))

(declare-fun b!611196 () Bool)

(declare-fun res!393133 () Bool)

(assert (=> b!611196 (=> (not res!393133) (not e!350198))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!611196 (= res!393133 (validKeyInArray!0 k!1786))))

(declare-fun b!611197 () Bool)

(declare-datatypes ((Unit!19600 0))(
  ( (Unit!19601) )
))
(declare-fun e!350206 () Unit!19600)

(declare-fun Unit!19602 () Unit!19600)

(assert (=> b!611197 (= e!350206 Unit!19602)))

(declare-fun lt!279621 () array!37365)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!279634 () Unit!19600)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37365 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19600)

(assert (=> b!611197 (= lt!279634 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279621 (select (arr!17930 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!611197 (arrayContainsKey!0 lt!279621 (select (arr!17930 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!279633 () Unit!19600)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37365 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11971) Unit!19600)

(assert (=> b!611197 (= lt!279633 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11968))))

(declare-fun arrayNoDuplicates!0 (array!37365 (_ BitVec 32) List!11971) Bool)

(assert (=> b!611197 (arrayNoDuplicates!0 lt!279621 #b00000000000000000000000000000000 Nil!11968)))

(declare-fun lt!279631 () Unit!19600)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37365 (_ BitVec 32) (_ BitVec 32)) Unit!19600)

(assert (=> b!611197 (= lt!279631 (lemmaNoDuplicateFromThenFromBigger!0 lt!279621 #b00000000000000000000000000000000 j!136))))

(assert (=> b!611197 (arrayNoDuplicates!0 lt!279621 j!136 Nil!11968)))

(declare-fun lt!279620 () Unit!19600)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37365 (_ BitVec 64) (_ BitVec 32) List!11971) Unit!19600)

(assert (=> b!611197 (= lt!279620 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279621 (select (arr!17930 a!2986) j!136) j!136 Nil!11968))))

(assert (=> b!611197 false))

(declare-fun b!611198 () Bool)

(declare-fun e!350210 () Bool)

(declare-fun e!350205 () Bool)

(assert (=> b!611198 (= e!350210 (not e!350205))))

(declare-fun res!393122 () Bool)

(assert (=> b!611198 (=> res!393122 e!350205)))

(declare-fun lt!279632 () SeekEntryResult!6370)

(assert (=> b!611198 (= res!393122 (not (= lt!279632 (Found!6370 index!984))))))

(declare-fun lt!279626 () Unit!19600)

(declare-fun e!350201 () Unit!19600)

(assert (=> b!611198 (= lt!279626 e!350201)))

(declare-fun c!69404 () Bool)

(assert (=> b!611198 (= c!69404 (= lt!279632 Undefined!6370))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!279618 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37365 (_ BitVec 32)) SeekEntryResult!6370)

(assert (=> b!611198 (= lt!279632 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279618 lt!279621 mask!3053))))

(assert (=> b!611198 e!350211))

(declare-fun res!393125 () Bool)

(assert (=> b!611198 (=> (not res!393125) (not e!350211))))

(declare-fun lt!279623 () (_ BitVec 32))

(assert (=> b!611198 (= res!393125 (= lt!279629 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279623 vacantSpotIndex!68 lt!279618 lt!279621 mask!3053)))))

(assert (=> b!611198 (= lt!279629 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279623 vacantSpotIndex!68 (select (arr!17930 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!611198 (= lt!279618 (select (store (arr!17930 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!279627 () Unit!19600)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37365 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19600)

(assert (=> b!611198 (= lt!279627 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279623 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!611198 (= lt!279623 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!611199 () Bool)

(declare-fun e!350202 () Bool)

(declare-fun e!350213 () Bool)

(assert (=> b!611199 (= e!350202 e!350213)))

(declare-fun res!393140 () Bool)

(assert (=> b!611199 (=> res!393140 e!350213)))

(declare-fun lt!279628 () (_ BitVec 64))

(assert (=> b!611199 (= res!393140 (or (not (= (select (arr!17930 a!2986) j!136) lt!279618)) (not (= (select (arr!17930 a!2986) j!136) lt!279628)) (bvsge j!136 index!984)))))

(declare-fun b!611200 () Bool)

(declare-fun res!393138 () Bool)

(assert (=> b!611200 (=> (not res!393138) (not e!350198))))

(assert (=> b!611200 (= res!393138 (validKeyInArray!0 (select (arr!17930 a!2986) j!136)))))

(declare-fun b!611201 () Bool)

(declare-fun e!350204 () Bool)

(assert (=> b!611201 (= e!350204 (arrayContainsKey!0 lt!279621 (select (arr!17930 a!2986) j!136) index!984))))

(declare-fun b!611202 () Bool)

(declare-fun res!393136 () Bool)

(declare-fun e!350199 () Bool)

(assert (=> b!611202 (=> (not res!393136) (not e!350199))))

(assert (=> b!611202 (= res!393136 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17930 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611203 () Bool)

(declare-fun Unit!19603 () Unit!19600)

(assert (=> b!611203 (= e!350206 Unit!19603)))

(declare-fun b!611204 () Bool)

(assert (=> b!611204 (= e!350198 e!350199)))

(declare-fun res!393141 () Bool)

(assert (=> b!611204 (=> (not res!393141) (not e!350199))))

(declare-fun lt!279624 () SeekEntryResult!6370)

(assert (=> b!611204 (= res!393141 (or (= lt!279624 (MissingZero!6370 i!1108)) (= lt!279624 (MissingVacant!6370 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37365 (_ BitVec 32)) SeekEntryResult!6370)

(assert (=> b!611204 (= lt!279624 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!611205 () Bool)

(declare-fun e!350207 () Bool)

(assert (=> b!611205 (= e!350207 (arrayContainsKey!0 lt!279621 (select (arr!17930 a!2986) j!136) index!984))))

(declare-fun b!611206 () Bool)

(declare-fun res!393126 () Bool)

(assert (=> b!611206 (=> (not res!393126) (not e!350199))))

(assert (=> b!611206 (= res!393126 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11968))))

(declare-fun b!611207 () Bool)

(declare-fun res!393142 () Bool)

(assert (=> b!611207 (=> (not res!393142) (not e!350198))))

(assert (=> b!611207 (= res!393142 (and (= (size!18294 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18294 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18294 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!611208 () Bool)

(declare-fun e!350208 () Bool)

(assert (=> b!611208 (= e!350208 e!350210)))

(declare-fun res!393130 () Bool)

(assert (=> b!611208 (=> (not res!393130) (not e!350210))))

(assert (=> b!611208 (= res!393130 (and (= lt!279622 (Found!6370 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17930 a!2986) index!984) (select (arr!17930 a!2986) j!136))) (not (= (select (arr!17930 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!611208 (= lt!279622 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17930 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611209 () Bool)

(assert (=> b!611209 (= e!350213 e!350204)))

(declare-fun res!393137 () Bool)

(assert (=> b!611209 (=> (not res!393137) (not e!350204))))

(assert (=> b!611209 (= res!393137 (arrayContainsKey!0 lt!279621 (select (arr!17930 a!2986) j!136) j!136))))

(declare-fun b!611210 () Bool)

(declare-fun res!393135 () Bool)

(assert (=> b!611210 (=> (not res!393135) (not e!350198))))

(assert (=> b!611210 (= res!393135 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!611211 () Bool)

(assert (=> b!611211 (= e!350212 (not (contains!3044 Nil!11968 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611212 () Bool)

(declare-fun res!393128 () Bool)

(assert (=> b!611212 (=> (not res!393128) (not e!350199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37365 (_ BitVec 32)) Bool)

(assert (=> b!611212 (= res!393128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!611213 () Bool)

(declare-fun res!393124 () Bool)

(assert (=> b!611213 (=> res!393124 e!350214)))

(declare-fun noDuplicate!347 (List!11971) Bool)

(assert (=> b!611213 (= res!393124 (not (noDuplicate!347 Nil!11968)))))

(declare-fun b!611214 () Bool)

(declare-fun e!350200 () Bool)

(assert (=> b!611214 (= e!350200 e!350214)))

(declare-fun res!393127 () Bool)

(assert (=> b!611214 (=> res!393127 e!350214)))

(assert (=> b!611214 (= res!393127 (or (bvsgt #b00000000000000000000000000000000 (size!18294 a!2986)) (bvsge (size!18294 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!611214 (arrayNoDuplicates!0 lt!279621 #b00000000000000000000000000000000 Nil!11968)))

(declare-fun lt!279630 () Unit!19600)

(assert (=> b!611214 (= lt!279630 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11968))))

(assert (=> b!611214 (arrayContainsKey!0 lt!279621 (select (arr!17930 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279619 () Unit!19600)

(assert (=> b!611214 (= lt!279619 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279621 (select (arr!17930 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!611214 e!350207))

(declare-fun res!393143 () Bool)

(assert (=> b!611214 (=> (not res!393143) (not e!350207))))

(assert (=> b!611214 (= res!393143 (arrayContainsKey!0 lt!279621 (select (arr!17930 a!2986) j!136) j!136))))

(declare-fun b!611215 () Bool)

(declare-fun Unit!19604 () Unit!19600)

(assert (=> b!611215 (= e!350201 Unit!19604)))

(assert (=> b!611215 false))

(declare-fun b!611216 () Bool)

(declare-fun Unit!19605 () Unit!19600)

(assert (=> b!611216 (= e!350201 Unit!19605)))

(declare-fun b!611217 () Bool)

(assert (=> b!611217 (= e!350199 e!350208)))

(declare-fun res!393132 () Bool)

(assert (=> b!611217 (=> (not res!393132) (not e!350208))))

(assert (=> b!611217 (= res!393132 (= (select (store (arr!17930 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611217 (= lt!279621 (array!37366 (store (arr!17930 a!2986) i!1108 k!1786) (size!18294 a!2986)))))

(declare-fun b!611218 () Bool)

(declare-fun e!350203 () Bool)

(assert (=> b!611218 (= e!350203 e!350200)))

(declare-fun res!393129 () Bool)

(assert (=> b!611218 (=> res!393129 e!350200)))

(assert (=> b!611218 (= res!393129 (bvsge index!984 j!136))))

(declare-fun lt!279625 () Unit!19600)

(assert (=> b!611218 (= lt!279625 e!350206)))

(declare-fun c!69403 () Bool)

(assert (=> b!611218 (= c!69403 (bvslt j!136 index!984))))

(declare-fun b!611219 () Bool)

(assert (=> b!611219 (= e!350205 e!350203)))

(declare-fun res!393134 () Bool)

(assert (=> b!611219 (=> res!393134 e!350203)))

(assert (=> b!611219 (= res!393134 (or (not (= (select (arr!17930 a!2986) j!136) lt!279618)) (not (= (select (arr!17930 a!2986) j!136) lt!279628))))))

(assert (=> b!611219 e!350202))

(declare-fun res!393123 () Bool)

(assert (=> b!611219 (=> (not res!393123) (not e!350202))))

(assert (=> b!611219 (= res!393123 (= lt!279628 (select (arr!17930 a!2986) j!136)))))

(assert (=> b!611219 (= lt!279628 (select (store (arr!17930 a!2986) i!1108 k!1786) index!984))))

(assert (= (and start!55802 res!393131) b!611207))

(assert (= (and b!611207 res!393142) b!611200))

(assert (= (and b!611200 res!393138) b!611196))

(assert (= (and b!611196 res!393133) b!611210))

(assert (= (and b!611210 res!393135) b!611204))

(assert (= (and b!611204 res!393141) b!611212))

(assert (= (and b!611212 res!393128) b!611206))

(assert (= (and b!611206 res!393126) b!611202))

(assert (= (and b!611202 res!393136) b!611217))

(assert (= (and b!611217 res!393132) b!611208))

(assert (= (and b!611208 res!393130) b!611198))

(assert (= (and b!611198 res!393125) b!611195))

(assert (= (and b!611198 c!69404) b!611215))

(assert (= (and b!611198 (not c!69404)) b!611216))

(assert (= (and b!611198 (not res!393122)) b!611219))

(assert (= (and b!611219 res!393123) b!611199))

(assert (= (and b!611199 (not res!393140)) b!611209))

(assert (= (and b!611209 res!393137) b!611201))

(assert (= (and b!611219 (not res!393134)) b!611218))

(assert (= (and b!611218 c!69403) b!611197))

(assert (= (and b!611218 (not c!69403)) b!611203))

(assert (= (and b!611218 (not res!393129)) b!611214))

(assert (= (and b!611214 res!393143) b!611205))

(assert (= (and b!611214 (not res!393127)) b!611213))

(assert (= (and b!611213 (not res!393124)) b!611194))

(assert (= (and b!611194 res!393139) b!611211))

(declare-fun m!587605 () Bool)

(assert (=> b!611199 m!587605))

(declare-fun m!587607 () Bool)

(assert (=> b!611210 m!587607))

(assert (=> b!611200 m!587605))

(assert (=> b!611200 m!587605))

(declare-fun m!587609 () Bool)

(assert (=> b!611200 m!587609))

(assert (=> b!611197 m!587605))

(declare-fun m!587611 () Bool)

(assert (=> b!611197 m!587611))

(assert (=> b!611197 m!587605))

(declare-fun m!587613 () Bool)

(assert (=> b!611197 m!587613))

(declare-fun m!587615 () Bool)

(assert (=> b!611197 m!587615))

(assert (=> b!611197 m!587605))

(declare-fun m!587617 () Bool)

(assert (=> b!611197 m!587617))

(declare-fun m!587619 () Bool)

(assert (=> b!611197 m!587619))

(declare-fun m!587621 () Bool)

(assert (=> b!611197 m!587621))

(assert (=> b!611197 m!587605))

(declare-fun m!587623 () Bool)

(assert (=> b!611197 m!587623))

(assert (=> b!611201 m!587605))

(assert (=> b!611201 m!587605))

(declare-fun m!587625 () Bool)

(assert (=> b!611201 m!587625))

(declare-fun m!587627 () Bool)

(assert (=> b!611202 m!587627))

(declare-fun m!587629 () Bool)

(assert (=> b!611208 m!587629))

(assert (=> b!611208 m!587605))

(assert (=> b!611208 m!587605))

(declare-fun m!587631 () Bool)

(assert (=> b!611208 m!587631))

(assert (=> b!611209 m!587605))

(assert (=> b!611209 m!587605))

(declare-fun m!587633 () Bool)

(assert (=> b!611209 m!587633))

(declare-fun m!587635 () Bool)

(assert (=> b!611194 m!587635))

(declare-fun m!587637 () Bool)

(assert (=> b!611196 m!587637))

(declare-fun m!587639 () Bool)

(assert (=> b!611213 m!587639))

(assert (=> b!611198 m!587605))

(declare-fun m!587641 () Bool)

(assert (=> b!611198 m!587641))

(declare-fun m!587643 () Bool)

(assert (=> b!611198 m!587643))

(declare-fun m!587645 () Bool)

(assert (=> b!611198 m!587645))

(assert (=> b!611198 m!587605))

(declare-fun m!587647 () Bool)

(assert (=> b!611198 m!587647))

(declare-fun m!587649 () Bool)

(assert (=> b!611198 m!587649))

(declare-fun m!587651 () Bool)

(assert (=> b!611198 m!587651))

(declare-fun m!587653 () Bool)

(assert (=> b!611198 m!587653))

(declare-fun m!587655 () Bool)

(assert (=> b!611206 m!587655))

(assert (=> b!611219 m!587605))

(assert (=> b!611219 m!587647))

(declare-fun m!587657 () Bool)

(assert (=> b!611219 m!587657))

(assert (=> b!611217 m!587647))

(declare-fun m!587659 () Bool)

(assert (=> b!611217 m!587659))

(assert (=> b!611205 m!587605))

(assert (=> b!611205 m!587605))

(assert (=> b!611205 m!587625))

(declare-fun m!587661 () Bool)

(assert (=> b!611211 m!587661))

(declare-fun m!587663 () Bool)

(assert (=> b!611212 m!587663))

(declare-fun m!587665 () Bool)

(assert (=> start!55802 m!587665))

(declare-fun m!587667 () Bool)

(assert (=> start!55802 m!587667))

(assert (=> b!611214 m!587621))

(assert (=> b!611214 m!587605))

(declare-fun m!587669 () Bool)

(assert (=> b!611214 m!587669))

(assert (=> b!611214 m!587605))

(assert (=> b!611214 m!587605))

(assert (=> b!611214 m!587633))

(assert (=> b!611214 m!587605))

(declare-fun m!587671 () Bool)

(assert (=> b!611214 m!587671))

(assert (=> b!611214 m!587619))

(declare-fun m!587673 () Bool)

(assert (=> b!611204 m!587673))

(push 1)

(assert (not b!611206))

(assert (not start!55802))

(assert (not b!611214))

(assert (not b!611201))

(assert (not b!611208))

(assert (not b!611194))

(assert (not b!611204))

(assert (not b!611211))

(assert (not b!611200))

(assert (not b!611212))

(assert (not b!611210))

(assert (not b!611196))

(assert (not b!611209))

(assert (not b!611205))

(assert (not b!611213))

(assert (not b!611198))

(assert (not b!611197))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!611303 () Bool)

(declare-fun e!350278 () SeekEntryResult!6370)

(assert (=> b!611303 (= e!350278 (Found!6370 lt!279623))))

(declare-fun d!88429 () Bool)

(declare-fun lt!279670 () SeekEntryResult!6370)

(assert (=> d!88429 (and (or (is-Undefined!6370 lt!279670) (not (is-Found!6370 lt!279670)) (and (bvsge (index!27762 lt!279670) #b00000000000000000000000000000000) (bvslt (index!27762 lt!279670) (size!18294 a!2986)))) (or (is-Undefined!6370 lt!279670) (is-Found!6370 lt!279670) (not (is-MissingVacant!6370 lt!279670)) (not (= (index!27764 lt!279670) vacantSpotIndex!68)) (and (bvsge (index!27764 lt!279670) #b00000000000000000000000000000000) (bvslt (index!27764 lt!279670) (size!18294 a!2986)))) (or (is-Undefined!6370 lt!279670) (ite (is-Found!6370 lt!279670) (= (select (arr!17930 a!2986) (index!27762 lt!279670)) (select (arr!17930 a!2986) j!136)) (and (is-MissingVacant!6370 lt!279670) (= (index!27764 lt!279670) vacantSpotIndex!68) (= (select (arr!17930 a!2986) (index!27764 lt!279670)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!350276 () SeekEntryResult!6370)

(assert (=> d!88429 (= lt!279670 e!350276)))

(declare-fun c!69429 () Bool)

(assert (=> d!88429 (= c!69429 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!279669 () (_ BitVec 64))

(assert (=> d!88429 (= lt!279669 (select (arr!17930 a!2986) lt!279623))))

(assert (=> d!88429 (validMask!0 mask!3053)))

(assert (=> d!88429 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279623 vacantSpotIndex!68 (select (arr!17930 a!2986) j!136) a!2986 mask!3053) lt!279670)))

(declare-fun b!611304 () Bool)

(declare-fun e!350277 () SeekEntryResult!6370)

(assert (=> b!611304 (= e!350277 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279623 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17930 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611305 () Bool)

(declare-fun c!69427 () Bool)

(assert (=> b!611305 (= c!69427 (= lt!279669 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611305 (= e!350278 e!350277)))

(declare-fun b!611306 () Bool)

(assert (=> b!611306 (= e!350276 e!350278)))

(declare-fun c!69428 () Bool)

(assert (=> b!611306 (= c!69428 (= lt!279669 (select (arr!17930 a!2986) j!136)))))

(declare-fun b!611307 () Bool)

(assert (=> b!611307 (= e!350276 Undefined!6370)))

(declare-fun b!611308 () Bool)

(assert (=> b!611308 (= e!350277 (MissingVacant!6370 vacantSpotIndex!68))))

(assert (= (and d!88429 c!69429) b!611307))

(assert (= (and d!88429 (not c!69429)) b!611306))

(assert (= (and b!611306 c!69428) b!611303))

(assert (= (and b!611306 (not c!69428)) b!611305))

(assert (= (and b!611305 c!69427) b!611308))

(assert (= (and b!611305 (not c!69427)) b!611304))

(declare-fun m!587737 () Bool)

(assert (=> d!88429 m!587737))

(declare-fun m!587739 () Bool)

(assert (=> d!88429 m!587739))

(declare-fun m!587741 () Bool)

(assert (=> d!88429 m!587741))

(assert (=> d!88429 m!587665))

(declare-fun m!587743 () Bool)

(assert (=> b!611304 m!587743))

(assert (=> b!611304 m!587743))

(assert (=> b!611304 m!587605))

(declare-fun m!587745 () Bool)

(assert (=> b!611304 m!587745))

(assert (=> b!611198 d!88429))

(declare-fun b!611309 () Bool)

(declare-fun e!350281 () SeekEntryResult!6370)

(assert (=> b!611309 (= e!350281 (Found!6370 index!984))))

(declare-fun d!88439 () Bool)

(declare-fun lt!279672 () SeekEntryResult!6370)

(assert (=> d!88439 (and (or (is-Undefined!6370 lt!279672) (not (is-Found!6370 lt!279672)) (and (bvsge (index!27762 lt!279672) #b00000000000000000000000000000000) (bvslt (index!27762 lt!279672) (size!18294 lt!279621)))) (or (is-Undefined!6370 lt!279672) (is-Found!6370 lt!279672) (not (is-MissingVacant!6370 lt!279672)) (not (= (index!27764 lt!279672) vacantSpotIndex!68)) (and (bvsge (index!27764 lt!279672) #b00000000000000000000000000000000) (bvslt (index!27764 lt!279672) (size!18294 lt!279621)))) (or (is-Undefined!6370 lt!279672) (ite (is-Found!6370 lt!279672) (= (select (arr!17930 lt!279621) (index!27762 lt!279672)) lt!279618) (and (is-MissingVacant!6370 lt!279672) (= (index!27764 lt!279672) vacantSpotIndex!68) (= (select (arr!17930 lt!279621) (index!27764 lt!279672)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!350279 () SeekEntryResult!6370)

(assert (=> d!88439 (= lt!279672 e!350279)))

(declare-fun c!69432 () Bool)

(assert (=> d!88439 (= c!69432 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!279671 () (_ BitVec 64))

(assert (=> d!88439 (= lt!279671 (select (arr!17930 lt!279621) index!984))))

(assert (=> d!88439 (validMask!0 mask!3053)))

(assert (=> d!88439 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279618 lt!279621 mask!3053) lt!279672)))

(declare-fun e!350280 () SeekEntryResult!6370)

(declare-fun b!611310 () Bool)

(assert (=> b!611310 (= e!350280 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!279618 lt!279621 mask!3053))))

(declare-fun b!611311 () Bool)

(declare-fun c!69430 () Bool)

(assert (=> b!611311 (= c!69430 (= lt!279671 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611311 (= e!350281 e!350280)))

(declare-fun b!611312 () Bool)

(assert (=> b!611312 (= e!350279 e!350281)))

(declare-fun c!69431 () Bool)

(assert (=> b!611312 (= c!69431 (= lt!279671 lt!279618))))

(declare-fun b!611313 () Bool)

(assert (=> b!611313 (= e!350279 Undefined!6370)))

(declare-fun b!611314 () Bool)

(assert (=> b!611314 (= e!350280 (MissingVacant!6370 vacantSpotIndex!68))))

(assert (= (and d!88439 c!69432) b!611313))

(assert (= (and d!88439 (not c!69432)) b!611312))

(assert (= (and b!611312 c!69431) b!611309))

(assert (= (and b!611312 (not c!69431)) b!611311))

(assert (= (and b!611311 c!69430) b!611314))

(assert (= (and b!611311 (not c!69430)) b!611310))

(declare-fun m!587747 () Bool)

(assert (=> d!88439 m!587747))

(declare-fun m!587749 () Bool)

(assert (=> d!88439 m!587749))

(declare-fun m!587751 () Bool)

(assert (=> d!88439 m!587751))

(assert (=> d!88439 m!587665))

(assert (=> b!611310 m!587653))

(assert (=> b!611310 m!587653))

(declare-fun m!587753 () Bool)

(assert (=> b!611310 m!587753))

(assert (=> b!611198 d!88439))

(declare-fun d!88441 () Bool)

(declare-fun lt!279675 () (_ BitVec 32))

(assert (=> d!88441 (and (bvsge lt!279675 #b00000000000000000000000000000000) (bvslt lt!279675 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88441 (= lt!279675 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!88441 (validMask!0 mask!3053)))

(assert (=> d!88441 (= (nextIndex!0 index!984 x!910 mask!3053) lt!279675)))

(declare-fun bs!18649 () Bool)

(assert (= bs!18649 d!88441))

(declare-fun m!587755 () Bool)

(assert (=> bs!18649 m!587755))

(assert (=> bs!18649 m!587665))

(assert (=> b!611198 d!88441))

(declare-fun d!88443 () Bool)

(declare-fun e!350299 () Bool)

(assert (=> d!88443 e!350299))

(declare-fun res!393185 () Bool)

(assert (=> d!88443 (=> (not res!393185) (not e!350299))))

(assert (=> d!88443 (= res!393185 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18294 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18294 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18294 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18294 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18294 a!2986))))))

(declare-fun lt!279693 () Unit!19600)

(declare-fun choose!9 (array!37365 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19600)

(assert (=> d!88443 (= lt!279693 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279623 vacantSpotIndex!68 mask!3053))))

(assert (=> d!88443 (validMask!0 mask!3053)))

(assert (=> d!88443 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279623 vacantSpotIndex!68 mask!3053) lt!279693)))

(declare-fun b!611347 () Bool)

(assert (=> b!611347 (= e!350299 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279623 vacantSpotIndex!68 (select (arr!17930 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279623 vacantSpotIndex!68 (select (store (arr!17930 a!2986) i!1108 k!1786) j!136) (array!37366 (store (arr!17930 a!2986) i!1108 k!1786) (size!18294 a!2986)) mask!3053)))))

(assert (= (and d!88443 res!393185) b!611347))

(declare-fun m!587771 () Bool)

(assert (=> d!88443 m!587771))

(assert (=> d!88443 m!587665))

(assert (=> b!611347 m!587643))

(declare-fun m!587773 () Bool)

(assert (=> b!611347 m!587773))

(assert (=> b!611347 m!587605))

(assert (=> b!611347 m!587605))

(assert (=> b!611347 m!587641))

(assert (=> b!611347 m!587647))

(assert (=> b!611347 m!587643))

(assert (=> b!611198 d!88443))

(declare-fun b!611348 () Bool)

(declare-fun e!350302 () SeekEntryResult!6370)

(assert (=> b!611348 (= e!350302 (Found!6370 lt!279623))))

(declare-fun d!88447 () Bool)

(declare-fun lt!279695 () SeekEntryResult!6370)

(assert (=> d!88447 (and (or (is-Undefined!6370 lt!279695) (not (is-Found!6370 lt!279695)) (and (bvsge (index!27762 lt!279695) #b00000000000000000000000000000000) (bvslt (index!27762 lt!279695) (size!18294 lt!279621)))) (or (is-Undefined!6370 lt!279695) (is-Found!6370 lt!279695) (not (is-MissingVacant!6370 lt!279695)) (not (= (index!27764 lt!279695) vacantSpotIndex!68)) (and (bvsge (index!27764 lt!279695) #b00000000000000000000000000000000) (bvslt (index!27764 lt!279695) (size!18294 lt!279621)))) (or (is-Undefined!6370 lt!279695) (ite (is-Found!6370 lt!279695) (= (select (arr!17930 lt!279621) (index!27762 lt!279695)) lt!279618) (and (is-MissingVacant!6370 lt!279695) (= (index!27764 lt!279695) vacantSpotIndex!68) (= (select (arr!17930 lt!279621) (index!27764 lt!279695)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!350300 () SeekEntryResult!6370)

(assert (=> d!88447 (= lt!279695 e!350300)))

(declare-fun c!69450 () Bool)

(assert (=> d!88447 (= c!69450 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!279694 () (_ BitVec 64))

(assert (=> d!88447 (= lt!279694 (select (arr!17930 lt!279621) lt!279623))))

(assert (=> d!88447 (validMask!0 mask!3053)))

(assert (=> d!88447 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279623 vacantSpotIndex!68 lt!279618 lt!279621 mask!3053) lt!279695)))

(declare-fun e!350301 () SeekEntryResult!6370)

(declare-fun b!611349 () Bool)

(assert (=> b!611349 (= e!350301 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279623 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!279618 lt!279621 mask!3053))))

(declare-fun b!611350 () Bool)

(declare-fun c!69448 () Bool)

(assert (=> b!611350 (= c!69448 (= lt!279694 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611350 (= e!350302 e!350301)))

(declare-fun b!611351 () Bool)

(assert (=> b!611351 (= e!350300 e!350302)))

(declare-fun c!69449 () Bool)

(assert (=> b!611351 (= c!69449 (= lt!279694 lt!279618))))

(declare-fun b!611352 () Bool)

(assert (=> b!611352 (= e!350300 Undefined!6370)))

(declare-fun b!611353 () Bool)

(assert (=> b!611353 (= e!350301 (MissingVacant!6370 vacantSpotIndex!68))))

(assert (= (and d!88447 c!69450) b!611352))

(assert (= (and d!88447 (not c!69450)) b!611351))

(assert (= (and b!611351 c!69449) b!611348))

(assert (= (and b!611351 (not c!69449)) b!611350))

(assert (= (and b!611350 c!69448) b!611353))

(assert (= (and b!611350 (not c!69448)) b!611349))

(declare-fun m!587775 () Bool)

(assert (=> d!88447 m!587775))

(declare-fun m!587777 () Bool)

(assert (=> d!88447 m!587777))

(declare-fun m!587779 () Bool)

(assert (=> d!88447 m!587779))

(assert (=> d!88447 m!587665))

(assert (=> b!611349 m!587743))

(assert (=> b!611349 m!587743))

(declare-fun m!587781 () Bool)

(assert (=> b!611349 m!587781))

(assert (=> b!611198 d!88447))

(declare-fun d!88449 () Bool)

(assert (=> d!88449 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18294 lt!279621)) (not (= (select (arr!17930 lt!279621) j!136) (select (arr!17930 a!2986) j!136))))))

(declare-fun lt!279702 () Unit!19600)

(declare-fun choose!21 (array!37365 (_ BitVec 64) (_ BitVec 32) List!11971) Unit!19600)

(assert (=> d!88449 (= lt!279702 (choose!21 lt!279621 (select (arr!17930 a!2986) j!136) j!136 Nil!11968))))

(assert (=> d!88449 (bvslt (size!18294 lt!279621) #b01111111111111111111111111111111)))

(assert (=> d!88449 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279621 (select (arr!17930 a!2986) j!136) j!136 Nil!11968) lt!279702)))

(declare-fun bs!18651 () Bool)

(assert (= bs!18651 d!88449))

(declare-fun m!587805 () Bool)

(assert (=> bs!18651 m!587805))

(assert (=> bs!18651 m!587605))

(declare-fun m!587809 () Bool)

(assert (=> bs!18651 m!587809))

(assert (=> b!611197 d!88449))

(declare-fun b!611407 () Bool)

(declare-fun e!350341 () Bool)

(assert (=> b!611407 (= e!350341 (contains!3044 Nil!11968 (select (arr!17930 lt!279621) j!136)))))

(declare-fun b!611408 () Bool)

(declare-fun e!350340 () Bool)

(declare-fun e!350342 () Bool)

(assert (=> b!611408 (= e!350340 e!350342)))

(declare-fun res!393207 () Bool)

(assert (=> b!611408 (=> (not res!393207) (not e!350342))))

(assert (=> b!611408 (= res!393207 (not e!350341))))

(declare-fun res!393205 () Bool)

(assert (=> b!611408 (=> (not res!393205) (not e!350341))))

(assert (=> b!611408 (= res!393205 (validKeyInArray!0 (select (arr!17930 lt!279621) j!136)))))

(declare-fun d!88461 () Bool)

(declare-fun res!393206 () Bool)

(assert (=> d!88461 (=> res!393206 e!350340)))

(assert (=> d!88461 (= res!393206 (bvsge j!136 (size!18294 lt!279621)))))

(assert (=> d!88461 (= (arrayNoDuplicates!0 lt!279621 j!136 Nil!11968) e!350340)))

(declare-fun b!611409 () Bool)

(declare-fun e!350339 () Bool)

(declare-fun call!33171 () Bool)

(assert (=> b!611409 (= e!350339 call!33171)))

(declare-fun b!611410 () Bool)

(assert (=> b!611410 (= e!350342 e!350339)))

(declare-fun c!69468 () Bool)

(assert (=> b!611410 (= c!69468 (validKeyInArray!0 (select (arr!17930 lt!279621) j!136)))))

(declare-fun b!611411 () Bool)

(assert (=> b!611411 (= e!350339 call!33171)))

(declare-fun bm!33168 () Bool)

(assert (=> bm!33168 (= call!33171 (arrayNoDuplicates!0 lt!279621 (bvadd j!136 #b00000000000000000000000000000001) (ite c!69468 (Cons!11967 (select (arr!17930 lt!279621) j!136) Nil!11968) Nil!11968)))))

(assert (= (and d!88461 (not res!393206)) b!611408))

(assert (= (and b!611408 res!393205) b!611407))

(assert (= (and b!611408 res!393207) b!611410))

(assert (= (and b!611410 c!69468) b!611409))

(assert (= (and b!611410 (not c!69468)) b!611411))

(assert (= (or b!611409 b!611411) bm!33168))

(assert (=> b!611407 m!587805))

(assert (=> b!611407 m!587805))

(declare-fun m!587845 () Bool)

(assert (=> b!611407 m!587845))

(assert (=> b!611408 m!587805))

(assert (=> b!611408 m!587805))

(declare-fun m!587847 () Bool)

(assert (=> b!611408 m!587847))

(assert (=> b!611410 m!587805))

(assert (=> b!611410 m!587805))

(assert (=> b!611410 m!587847))

(assert (=> bm!33168 m!587805))

(declare-fun m!587849 () Bool)

(assert (=> bm!33168 m!587849))

(assert (=> b!611197 d!88461))

(declare-fun d!88477 () Bool)

(declare-fun res!393212 () Bool)

(declare-fun e!350347 () Bool)

(assert (=> d!88477 (=> res!393212 e!350347)))

(assert (=> d!88477 (= res!393212 (= (select (arr!17930 lt!279621) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17930 a!2986) j!136)))))

(assert (=> d!88477 (= (arrayContainsKey!0 lt!279621 (select (arr!17930 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!350347)))

(declare-fun b!611416 () Bool)

(declare-fun e!350348 () Bool)

(assert (=> b!611416 (= e!350347 e!350348)))

(declare-fun res!393213 () Bool)

(assert (=> b!611416 (=> (not res!393213) (not e!350348))))

(assert (=> b!611416 (= res!393213 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18294 lt!279621)))))

(declare-fun b!611417 () Bool)

(assert (=> b!611417 (= e!350348 (arrayContainsKey!0 lt!279621 (select (arr!17930 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88477 (not res!393212)) b!611416))

(assert (= (and b!611416 res!393213) b!611417))

(declare-fun m!587851 () Bool)

(assert (=> d!88477 m!587851))

(assert (=> b!611417 m!587605))

(declare-fun m!587853 () Bool)

(assert (=> b!611417 m!587853))

(assert (=> b!611197 d!88477))

(declare-fun d!88479 () Bool)

(assert (=> d!88479 (arrayNoDuplicates!0 lt!279621 j!136 Nil!11968)))

(declare-fun lt!279715 () Unit!19600)

(declare-fun choose!39 (array!37365 (_ BitVec 32) (_ BitVec 32)) Unit!19600)

(assert (=> d!88479 (= lt!279715 (choose!39 lt!279621 #b00000000000000000000000000000000 j!136))))

(assert (=> d!88479 (bvslt (size!18294 lt!279621) #b01111111111111111111111111111111)))

(assert (=> d!88479 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!279621 #b00000000000000000000000000000000 j!136) lt!279715)))

(declare-fun bs!18653 () Bool)

(assert (= bs!18653 d!88479))

(assert (=> bs!18653 m!587615))

(declare-fun m!587855 () Bool)

(assert (=> bs!18653 m!587855))

(assert (=> b!611197 d!88479))

(declare-fun d!88481 () Bool)

(assert (=> d!88481 (arrayContainsKey!0 lt!279621 (select (arr!17930 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279718 () Unit!19600)

(declare-fun choose!114 (array!37365 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19600)

(assert (=> d!88481 (= lt!279718 (choose!114 lt!279621 (select (arr!17930 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!88481 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!88481 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279621 (select (arr!17930 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!279718)))

(declare-fun bs!18654 () Bool)

(assert (= bs!18654 d!88481))

(assert (=> bs!18654 m!587605))

(assert (=> bs!18654 m!587613))

(assert (=> bs!18654 m!587605))

(declare-fun m!587857 () Bool)

(assert (=> bs!18654 m!587857))

(assert (=> b!611197 d!88481))

(declare-fun d!88483 () Bool)

(declare-fun e!350359 () Bool)

(assert (=> d!88483 e!350359))

(declare-fun res!393218 () Bool)

(assert (=> d!88483 (=> (not res!393218) (not e!350359))))

(assert (=> d!88483 (= res!393218 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18294 a!2986))))))

(declare-fun lt!279727 () Unit!19600)

(declare-fun choose!41 (array!37365 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11971) Unit!19600)

(assert (=> d!88483 (= lt!279727 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11968))))

(assert (=> d!88483 (bvslt (size!18294 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!88483 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11968) lt!279727)))

(declare-fun b!611434 () Bool)

(assert (=> b!611434 (= e!350359 (arrayNoDuplicates!0 (array!37366 (store (arr!17930 a!2986) i!1108 k!1786) (size!18294 a!2986)) #b00000000000000000000000000000000 Nil!11968))))

(assert (= (and d!88483 res!393218) b!611434))

(declare-fun m!587859 () Bool)

(assert (=> d!88483 m!587859))

(assert (=> b!611434 m!587647))

(declare-fun m!587861 () Bool)

(assert (=> b!611434 m!587861))

(assert (=> b!611197 d!88483))

(declare-fun b!611436 () Bool)

(declare-fun e!350363 () Bool)

(assert (=> b!611436 (= e!350363 (contains!3044 Nil!11968 (select (arr!17930 lt!279621) #b00000000000000000000000000000000)))))

(declare-fun b!611437 () Bool)

(declare-fun e!350362 () Bool)

(declare-fun e!350364 () Bool)

(assert (=> b!611437 (= e!350362 e!350364)))

(declare-fun res!393222 () Bool)

(assert (=> b!611437 (=> (not res!393222) (not e!350364))))

(assert (=> b!611437 (= res!393222 (not e!350363))))

(declare-fun res!393220 () Bool)

(assert (=> b!611437 (=> (not res!393220) (not e!350363))))

(assert (=> b!611437 (= res!393220 (validKeyInArray!0 (select (arr!17930 lt!279621) #b00000000000000000000000000000000)))))

(declare-fun d!88485 () Bool)

(declare-fun res!393221 () Bool)

(assert (=> d!88485 (=> res!393221 e!350362)))

(assert (=> d!88485 (= res!393221 (bvsge #b00000000000000000000000000000000 (size!18294 lt!279621)))))

(assert (=> d!88485 (= (arrayNoDuplicates!0 lt!279621 #b00000000000000000000000000000000 Nil!11968) e!350362)))

(declare-fun b!611438 () Bool)

(declare-fun e!350361 () Bool)

(declare-fun call!33172 () Bool)

(assert (=> b!611438 (= e!350361 call!33172)))

(declare-fun b!611439 () Bool)

(assert (=> b!611439 (= e!350364 e!350361)))

(declare-fun c!69475 () Bool)

(assert (=> b!611439 (= c!69475 (validKeyInArray!0 (select (arr!17930 lt!279621) #b00000000000000000000000000000000)))))

(declare-fun b!611440 () Bool)

(assert (=> b!611440 (= e!350361 call!33172)))

(declare-fun bm!33169 () Bool)

(assert (=> bm!33169 (= call!33172 (arrayNoDuplicates!0 lt!279621 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69475 (Cons!11967 (select (arr!17930 lt!279621) #b00000000000000000000000000000000) Nil!11968) Nil!11968)))))

(assert (= (and d!88485 (not res!393221)) b!611437))

(assert (= (and b!611437 res!393220) b!611436))

(assert (= (and b!611437 res!393222) b!611439))

(assert (= (and b!611439 c!69475) b!611438))

(assert (= (and b!611439 (not c!69475)) b!611440))

(assert (= (or b!611438 b!611440) bm!33169))

(declare-fun m!587867 () Bool)

(assert (=> b!611436 m!587867))

(assert (=> b!611436 m!587867))

(declare-fun m!587869 () Bool)

(assert (=> b!611436 m!587869))

(assert (=> b!611437 m!587867))

(assert (=> b!611437 m!587867))

(declare-fun m!587871 () Bool)

(assert (=> b!611437 m!587871))

(assert (=> b!611439 m!587867))

(assert (=> b!611439 m!587867))

(assert (=> b!611439 m!587871))

(assert (=> bm!33169 m!587867))

(declare-fun m!587873 () Bool)

(assert (=> bm!33169 m!587873))

(assert (=> b!611197 d!88485))

(declare-fun b!611441 () Bool)

(declare-fun e!350367 () SeekEntryResult!6370)

(assert (=> b!611441 (= e!350367 (Found!6370 index!984))))

(declare-fun lt!279730 () SeekEntryResult!6370)

(declare-fun d!88489 () Bool)

(assert (=> d!88489 (and (or (is-Undefined!6370 lt!279730) (not (is-Found!6370 lt!279730)) (and (bvsge (index!27762 lt!279730) #b00000000000000000000000000000000) (bvslt (index!27762 lt!279730) (size!18294 a!2986)))) (or (is-Undefined!6370 lt!279730) (is-Found!6370 lt!279730) (not (is-MissingVacant!6370 lt!279730)) (not (= (index!27764 lt!279730) vacantSpotIndex!68)) (and (bvsge (index!27764 lt!279730) #b00000000000000000000000000000000) (bvslt (index!27764 lt!279730) (size!18294 a!2986)))) (or (is-Undefined!6370 lt!279730) (ite (is-Found!6370 lt!279730) (= (select (arr!17930 a!2986) (index!27762 lt!279730)) (select (arr!17930 a!2986) j!136)) (and (is-MissingVacant!6370 lt!279730) (= (index!27764 lt!279730) vacantSpotIndex!68) (= (select (arr!17930 a!2986) (index!27764 lt!279730)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!350365 () SeekEntryResult!6370)

(assert (=> d!88489 (= lt!279730 e!350365)))

(declare-fun c!69478 () Bool)

(assert (=> d!88489 (= c!69478 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!279729 () (_ BitVec 64))

