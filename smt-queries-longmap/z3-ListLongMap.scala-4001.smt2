; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54246 () Bool)

(assert start!54246)

(declare-fun b!592729 () Bool)

(declare-fun e!338508 () Bool)

(declare-fun e!338509 () Bool)

(assert (=> b!592729 (= e!338508 e!338509)))

(declare-fun res!379480 () Bool)

(assert (=> b!592729 (=> (not res!379480) (not e!338509))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!36927 0))(
  ( (array!36928 (arr!17732 (Array (_ BitVec 32) (_ BitVec 64))) (size!18097 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36927)

(assert (=> b!592729 (= res!379480 (= (select (store (arr!17732 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!268982 () array!36927)

(assert (=> b!592729 (= lt!268982 (array!36928 (store (arr!17732 a!2986) i!1108 k0!1786) (size!18097 a!2986)))))

(declare-fun res!379481 () Bool)

(declare-fun e!338513 () Bool)

(assert (=> start!54246 (=> (not res!379481) (not e!338513))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54246 (= res!379481 (validMask!0 mask!3053))))

(assert (=> start!54246 e!338513))

(assert (=> start!54246 true))

(declare-fun array_inv!13615 (array!36927) Bool)

(assert (=> start!54246 (array_inv!13615 a!2986)))

(declare-fun b!592730 () Bool)

(declare-fun e!338511 () Bool)

(declare-fun e!338516 () Bool)

(assert (=> b!592730 (= e!338511 e!338516)))

(declare-fun res!379478 () Bool)

(assert (=> b!592730 (=> res!379478 e!338516)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!268976 () (_ BitVec 64))

(declare-fun lt!268983 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!592730 (= res!379478 (or (not (= (select (arr!17732 a!2986) j!136) lt!268976)) (not (= (select (arr!17732 a!2986) j!136) lt!268983)) (bvsge j!136 index!984)))))

(declare-fun e!338517 () Bool)

(assert (=> b!592730 e!338517))

(declare-fun res!379486 () Bool)

(assert (=> b!592730 (=> (not res!379486) (not e!338517))))

(assert (=> b!592730 (= res!379486 (= lt!268983 (select (arr!17732 a!2986) j!136)))))

(assert (=> b!592730 (= lt!268983 (select (store (arr!17732 a!2986) i!1108 k0!1786) index!984))))

(declare-fun e!338515 () Bool)

(declare-fun b!592731 () Bool)

(declare-fun arrayContainsKey!0 (array!36927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592731 (= e!338515 (arrayContainsKey!0 lt!268982 (select (arr!17732 a!2986) j!136) index!984))))

(declare-fun b!592732 () Bool)

(declare-fun res!379485 () Bool)

(assert (=> b!592732 (=> (not res!379485) (not e!338513))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592732 (= res!379485 (validKeyInArray!0 k0!1786))))

(declare-fun b!592733 () Bool)

(declare-fun res!379487 () Bool)

(assert (=> b!592733 (=> (not res!379487) (not e!338513))))

(assert (=> b!592733 (= res!379487 (validKeyInArray!0 (select (arr!17732 a!2986) j!136)))))

(declare-fun b!592734 () Bool)

(declare-fun res!379489 () Bool)

(assert (=> b!592734 (=> (not res!379489) (not e!338508))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!592734 (= res!379489 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17732 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!592735 () Bool)

(declare-fun e!338510 () Bool)

(assert (=> b!592735 (= e!338510 e!338515)))

(declare-fun res!379477 () Bool)

(assert (=> b!592735 (=> (not res!379477) (not e!338515))))

(assert (=> b!592735 (= res!379477 (arrayContainsKey!0 lt!268982 (select (arr!17732 a!2986) j!136) j!136))))

(declare-fun b!592736 () Bool)

(declare-fun res!379483 () Bool)

(assert (=> b!592736 (=> (not res!379483) (not e!338508))))

(declare-datatypes ((List!11812 0))(
  ( (Nil!11809) (Cons!11808 (h!12853 (_ BitVec 64)) (t!18031 List!11812)) )
))
(declare-fun arrayNoDuplicates!0 (array!36927 (_ BitVec 32) List!11812) Bool)

(assert (=> b!592736 (= res!379483 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11809))))

(declare-fun b!592737 () Bool)

(assert (=> b!592737 (= e!338516 (or (bvsgt #b00000000000000000000000000000000 (size!18097 a!2986)) (bvslt (size!18097 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!592737 (arrayContainsKey!0 lt!268982 (select (arr!17732 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!18588 0))(
  ( (Unit!18589) )
))
(declare-fun lt!268981 () Unit!18588)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36927 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18588)

(assert (=> b!592737 (= lt!268981 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268982 (select (arr!17732 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592738 () Bool)

(declare-fun e!338514 () Bool)

(assert (=> b!592738 (= e!338514 (not e!338511))))

(declare-fun res!379492 () Bool)

(assert (=> b!592738 (=> res!379492 e!338511)))

(declare-datatypes ((SeekEntryResult!6169 0))(
  ( (MissingZero!6169 (index!26915 (_ BitVec 32))) (Found!6169 (index!26916 (_ BitVec 32))) (Intermediate!6169 (undefined!6981 Bool) (index!26917 (_ BitVec 32)) (x!55717 (_ BitVec 32))) (Undefined!6169) (MissingVacant!6169 (index!26918 (_ BitVec 32))) )
))
(declare-fun lt!268974 () SeekEntryResult!6169)

(assert (=> b!592738 (= res!379492 (not (= lt!268974 (Found!6169 index!984))))))

(declare-fun lt!268984 () Unit!18588)

(declare-fun e!338512 () Unit!18588)

(assert (=> b!592738 (= lt!268984 e!338512)))

(declare-fun c!66993 () Bool)

(assert (=> b!592738 (= c!66993 (= lt!268974 Undefined!6169))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36927 (_ BitVec 32)) SeekEntryResult!6169)

(assert (=> b!592738 (= lt!268974 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268976 lt!268982 mask!3053))))

(declare-fun e!338506 () Bool)

(assert (=> b!592738 e!338506))

(declare-fun res!379482 () Bool)

(assert (=> b!592738 (=> (not res!379482) (not e!338506))))

(declare-fun lt!268979 () (_ BitVec 32))

(declare-fun lt!268975 () SeekEntryResult!6169)

(assert (=> b!592738 (= res!379482 (= lt!268975 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268979 vacantSpotIndex!68 lt!268976 lt!268982 mask!3053)))))

(assert (=> b!592738 (= lt!268975 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268979 vacantSpotIndex!68 (select (arr!17732 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!592738 (= lt!268976 (select (store (arr!17732 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268980 () Unit!18588)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36927 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18588)

(assert (=> b!592738 (= lt!268980 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268979 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592738 (= lt!268979 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!592739 () Bool)

(declare-fun Unit!18590 () Unit!18588)

(assert (=> b!592739 (= e!338512 Unit!18590)))

(declare-fun b!592740 () Bool)

(assert (=> b!592740 (= e!338517 e!338510)))

(declare-fun res!379484 () Bool)

(assert (=> b!592740 (=> res!379484 e!338510)))

(assert (=> b!592740 (= res!379484 (or (not (= (select (arr!17732 a!2986) j!136) lt!268976)) (not (= (select (arr!17732 a!2986) j!136) lt!268983)) (bvsge j!136 index!984)))))

(declare-fun b!592741 () Bool)

(assert (=> b!592741 (= e!338513 e!338508)))

(declare-fun res!379488 () Bool)

(assert (=> b!592741 (=> (not res!379488) (not e!338508))))

(declare-fun lt!268977 () SeekEntryResult!6169)

(assert (=> b!592741 (= res!379488 (or (= lt!268977 (MissingZero!6169 i!1108)) (= lt!268977 (MissingVacant!6169 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36927 (_ BitVec 32)) SeekEntryResult!6169)

(assert (=> b!592741 (= lt!268977 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!592742 () Bool)

(declare-fun Unit!18591 () Unit!18588)

(assert (=> b!592742 (= e!338512 Unit!18591)))

(assert (=> b!592742 false))

(declare-fun b!592743 () Bool)

(declare-fun lt!268978 () SeekEntryResult!6169)

(assert (=> b!592743 (= e!338506 (= lt!268978 lt!268975))))

(declare-fun b!592744 () Bool)

(declare-fun res!379479 () Bool)

(assert (=> b!592744 (=> (not res!379479) (not e!338513))))

(assert (=> b!592744 (= res!379479 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!592745 () Bool)

(declare-fun res!379491 () Bool)

(assert (=> b!592745 (=> (not res!379491) (not e!338508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36927 (_ BitVec 32)) Bool)

(assert (=> b!592745 (= res!379491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!592746 () Bool)

(assert (=> b!592746 (= e!338509 e!338514)))

(declare-fun res!379493 () Bool)

(assert (=> b!592746 (=> (not res!379493) (not e!338514))))

(assert (=> b!592746 (= res!379493 (and (= lt!268978 (Found!6169 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17732 a!2986) index!984) (select (arr!17732 a!2986) j!136))) (not (= (select (arr!17732 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!592746 (= lt!268978 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17732 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592747 () Bool)

(declare-fun res!379490 () Bool)

(assert (=> b!592747 (=> (not res!379490) (not e!338513))))

(assert (=> b!592747 (= res!379490 (and (= (size!18097 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18097 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18097 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!54246 res!379481) b!592747))

(assert (= (and b!592747 res!379490) b!592733))

(assert (= (and b!592733 res!379487) b!592732))

(assert (= (and b!592732 res!379485) b!592744))

(assert (= (and b!592744 res!379479) b!592741))

(assert (= (and b!592741 res!379488) b!592745))

(assert (= (and b!592745 res!379491) b!592736))

(assert (= (and b!592736 res!379483) b!592734))

(assert (= (and b!592734 res!379489) b!592729))

(assert (= (and b!592729 res!379480) b!592746))

(assert (= (and b!592746 res!379493) b!592738))

(assert (= (and b!592738 res!379482) b!592743))

(assert (= (and b!592738 c!66993) b!592742))

(assert (= (and b!592738 (not c!66993)) b!592739))

(assert (= (and b!592738 (not res!379492)) b!592730))

(assert (= (and b!592730 res!379486) b!592740))

(assert (= (and b!592740 (not res!379484)) b!592735))

(assert (= (and b!592735 res!379477) b!592731))

(assert (= (and b!592730 (not res!379478)) b!592737))

(declare-fun m!570247 () Bool)

(assert (=> start!54246 m!570247))

(declare-fun m!570249 () Bool)

(assert (=> start!54246 m!570249))

(declare-fun m!570251 () Bool)

(assert (=> b!592736 m!570251))

(declare-fun m!570253 () Bool)

(assert (=> b!592737 m!570253))

(assert (=> b!592737 m!570253))

(declare-fun m!570255 () Bool)

(assert (=> b!592737 m!570255))

(assert (=> b!592737 m!570253))

(declare-fun m!570257 () Bool)

(assert (=> b!592737 m!570257))

(declare-fun m!570259 () Bool)

(assert (=> b!592746 m!570259))

(assert (=> b!592746 m!570253))

(assert (=> b!592746 m!570253))

(declare-fun m!570261 () Bool)

(assert (=> b!592746 m!570261))

(assert (=> b!592731 m!570253))

(assert (=> b!592731 m!570253))

(declare-fun m!570263 () Bool)

(assert (=> b!592731 m!570263))

(assert (=> b!592733 m!570253))

(assert (=> b!592733 m!570253))

(declare-fun m!570265 () Bool)

(assert (=> b!592733 m!570265))

(declare-fun m!570267 () Bool)

(assert (=> b!592729 m!570267))

(declare-fun m!570269 () Bool)

(assert (=> b!592729 m!570269))

(declare-fun m!570271 () Bool)

(assert (=> b!592738 m!570271))

(declare-fun m!570273 () Bool)

(assert (=> b!592738 m!570273))

(assert (=> b!592738 m!570253))

(assert (=> b!592738 m!570267))

(declare-fun m!570275 () Bool)

(assert (=> b!592738 m!570275))

(assert (=> b!592738 m!570253))

(declare-fun m!570277 () Bool)

(assert (=> b!592738 m!570277))

(declare-fun m!570279 () Bool)

(assert (=> b!592738 m!570279))

(declare-fun m!570281 () Bool)

(assert (=> b!592738 m!570281))

(declare-fun m!570283 () Bool)

(assert (=> b!592734 m!570283))

(declare-fun m!570285 () Bool)

(assert (=> b!592732 m!570285))

(declare-fun m!570287 () Bool)

(assert (=> b!592744 m!570287))

(assert (=> b!592735 m!570253))

(assert (=> b!592735 m!570253))

(declare-fun m!570289 () Bool)

(assert (=> b!592735 m!570289))

(assert (=> b!592730 m!570253))

(assert (=> b!592730 m!570267))

(declare-fun m!570291 () Bool)

(assert (=> b!592730 m!570291))

(assert (=> b!592740 m!570253))

(declare-fun m!570293 () Bool)

(assert (=> b!592745 m!570293))

(declare-fun m!570295 () Bool)

(assert (=> b!592741 m!570295))

(check-sat (not b!592737) (not b!592738) (not b!592736) (not b!592746) (not b!592741) (not b!592745) (not start!54246) (not b!592744) (not b!592732) (not b!592735) (not b!592731) (not b!592733))
(check-sat)
(get-model)

(declare-fun d!86123 () Bool)

(declare-fun res!379600 () Bool)

(declare-fun e!338594 () Bool)

(assert (=> d!86123 (=> res!379600 e!338594)))

(assert (=> d!86123 (= res!379600 (= (select (arr!17732 lt!268982) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17732 a!2986) j!136)))))

(assert (=> d!86123 (= (arrayContainsKey!0 lt!268982 (select (arr!17732 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!338594)))

(declare-fun b!592866 () Bool)

(declare-fun e!338595 () Bool)

(assert (=> b!592866 (= e!338594 e!338595)))

(declare-fun res!379601 () Bool)

(assert (=> b!592866 (=> (not res!379601) (not e!338595))))

(assert (=> b!592866 (= res!379601 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18097 lt!268982)))))

(declare-fun b!592867 () Bool)

(assert (=> b!592867 (= e!338595 (arrayContainsKey!0 lt!268982 (select (arr!17732 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86123 (not res!379600)) b!592866))

(assert (= (and b!592866 res!379601) b!592867))

(declare-fun m!570397 () Bool)

(assert (=> d!86123 m!570397))

(assert (=> b!592867 m!570253))

(declare-fun m!570399 () Bool)

(assert (=> b!592867 m!570399))

(assert (=> b!592737 d!86123))

(declare-fun d!86125 () Bool)

(assert (=> d!86125 (arrayContainsKey!0 lt!268982 (select (arr!17732 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269053 () Unit!18588)

(declare-fun choose!114 (array!36927 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18588)

(assert (=> d!86125 (= lt!269053 (choose!114 lt!268982 (select (arr!17732 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86125 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86125 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268982 (select (arr!17732 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!269053)))

(declare-fun bs!18271 () Bool)

(assert (= bs!18271 d!86125))

(assert (=> bs!18271 m!570253))

(assert (=> bs!18271 m!570255))

(assert (=> bs!18271 m!570253))

(declare-fun m!570401 () Bool)

(assert (=> bs!18271 m!570401))

(assert (=> b!592737 d!86125))

(declare-fun d!86127 () Bool)

(assert (=> d!86127 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54246 d!86127))

(declare-fun d!86129 () Bool)

(assert (=> d!86129 (= (array_inv!13615 a!2986) (bvsge (size!18097 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54246 d!86129))

(declare-fun d!86131 () Bool)

(declare-fun e!338598 () Bool)

(assert (=> d!86131 e!338598))

(declare-fun res!379604 () Bool)

(assert (=> d!86131 (=> (not res!379604) (not e!338598))))

(assert (=> d!86131 (= res!379604 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18097 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18097 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18097 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18097 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18097 a!2986))))))

(declare-fun lt!269056 () Unit!18588)

(declare-fun choose!9 (array!36927 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18588)

(assert (=> d!86131 (= lt!269056 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268979 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86131 (validMask!0 mask!3053)))

(assert (=> d!86131 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268979 vacantSpotIndex!68 mask!3053) lt!269056)))

(declare-fun b!592870 () Bool)

(assert (=> b!592870 (= e!338598 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268979 vacantSpotIndex!68 (select (arr!17732 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268979 vacantSpotIndex!68 (select (store (arr!17732 a!2986) i!1108 k0!1786) j!136) (array!36928 (store (arr!17732 a!2986) i!1108 k0!1786) (size!18097 a!2986)) mask!3053)))))

(assert (= (and d!86131 res!379604) b!592870))

(declare-fun m!570403 () Bool)

(assert (=> d!86131 m!570403))

(assert (=> d!86131 m!570247))

(assert (=> b!592870 m!570273))

(assert (=> b!592870 m!570273))

(declare-fun m!570405 () Bool)

(assert (=> b!592870 m!570405))

(assert (=> b!592870 m!570253))

(assert (=> b!592870 m!570277))

(assert (=> b!592870 m!570267))

(assert (=> b!592870 m!570253))

(assert (=> b!592738 d!86131))

(declare-fun b!592883 () Bool)

(declare-fun e!338605 () SeekEntryResult!6169)

(assert (=> b!592883 (= e!338605 (Found!6169 lt!268979))))

(declare-fun d!86133 () Bool)

(declare-fun lt!269062 () SeekEntryResult!6169)

(get-info :version)

(assert (=> d!86133 (and (or ((_ is Undefined!6169) lt!269062) (not ((_ is Found!6169) lt!269062)) (and (bvsge (index!26916 lt!269062) #b00000000000000000000000000000000) (bvslt (index!26916 lt!269062) (size!18097 lt!268982)))) (or ((_ is Undefined!6169) lt!269062) ((_ is Found!6169) lt!269062) (not ((_ is MissingVacant!6169) lt!269062)) (not (= (index!26918 lt!269062) vacantSpotIndex!68)) (and (bvsge (index!26918 lt!269062) #b00000000000000000000000000000000) (bvslt (index!26918 lt!269062) (size!18097 lt!268982)))) (or ((_ is Undefined!6169) lt!269062) (ite ((_ is Found!6169) lt!269062) (= (select (arr!17732 lt!268982) (index!26916 lt!269062)) lt!268976) (and ((_ is MissingVacant!6169) lt!269062) (= (index!26918 lt!269062) vacantSpotIndex!68) (= (select (arr!17732 lt!268982) (index!26918 lt!269062)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338606 () SeekEntryResult!6169)

(assert (=> d!86133 (= lt!269062 e!338606)))

(declare-fun c!67008 () Bool)

(assert (=> d!86133 (= c!67008 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!269061 () (_ BitVec 64))

(assert (=> d!86133 (= lt!269061 (select (arr!17732 lt!268982) lt!268979))))

(assert (=> d!86133 (validMask!0 mask!3053)))

(assert (=> d!86133 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268979 vacantSpotIndex!68 lt!268976 lt!268982 mask!3053) lt!269062)))

(declare-fun b!592884 () Bool)

(declare-fun c!67006 () Bool)

(assert (=> b!592884 (= c!67006 (= lt!269061 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!338607 () SeekEntryResult!6169)

(assert (=> b!592884 (= e!338605 e!338607)))

(declare-fun b!592885 () Bool)

(assert (=> b!592885 (= e!338607 (MissingVacant!6169 vacantSpotIndex!68))))

(declare-fun b!592886 () Bool)

(assert (=> b!592886 (= e!338607 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!268979 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!268976 lt!268982 mask!3053))))

(declare-fun b!592887 () Bool)

(assert (=> b!592887 (= e!338606 e!338605)))

(declare-fun c!67007 () Bool)

(assert (=> b!592887 (= c!67007 (= lt!269061 lt!268976))))

(declare-fun b!592888 () Bool)

(assert (=> b!592888 (= e!338606 Undefined!6169)))

(assert (= (and d!86133 c!67008) b!592888))

(assert (= (and d!86133 (not c!67008)) b!592887))

(assert (= (and b!592887 c!67007) b!592883))

(assert (= (and b!592887 (not c!67007)) b!592884))

(assert (= (and b!592884 c!67006) b!592885))

(assert (= (and b!592884 (not c!67006)) b!592886))

(declare-fun m!570407 () Bool)

(assert (=> d!86133 m!570407))

(declare-fun m!570409 () Bool)

(assert (=> d!86133 m!570409))

(declare-fun m!570411 () Bool)

(assert (=> d!86133 m!570411))

(assert (=> d!86133 m!570247))

(declare-fun m!570413 () Bool)

(assert (=> b!592886 m!570413))

(assert (=> b!592886 m!570413))

(declare-fun m!570415 () Bool)

(assert (=> b!592886 m!570415))

(assert (=> b!592738 d!86133))

(declare-fun b!592889 () Bool)

(declare-fun e!338608 () SeekEntryResult!6169)

(assert (=> b!592889 (= e!338608 (Found!6169 index!984))))

(declare-fun lt!269064 () SeekEntryResult!6169)

(declare-fun d!86137 () Bool)

(assert (=> d!86137 (and (or ((_ is Undefined!6169) lt!269064) (not ((_ is Found!6169) lt!269064)) (and (bvsge (index!26916 lt!269064) #b00000000000000000000000000000000) (bvslt (index!26916 lt!269064) (size!18097 lt!268982)))) (or ((_ is Undefined!6169) lt!269064) ((_ is Found!6169) lt!269064) (not ((_ is MissingVacant!6169) lt!269064)) (not (= (index!26918 lt!269064) vacantSpotIndex!68)) (and (bvsge (index!26918 lt!269064) #b00000000000000000000000000000000) (bvslt (index!26918 lt!269064) (size!18097 lt!268982)))) (or ((_ is Undefined!6169) lt!269064) (ite ((_ is Found!6169) lt!269064) (= (select (arr!17732 lt!268982) (index!26916 lt!269064)) lt!268976) (and ((_ is MissingVacant!6169) lt!269064) (= (index!26918 lt!269064) vacantSpotIndex!68) (= (select (arr!17732 lt!268982) (index!26918 lt!269064)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338609 () SeekEntryResult!6169)

(assert (=> d!86137 (= lt!269064 e!338609)))

(declare-fun c!67011 () Bool)

(assert (=> d!86137 (= c!67011 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!269063 () (_ BitVec 64))

(assert (=> d!86137 (= lt!269063 (select (arr!17732 lt!268982) index!984))))

(assert (=> d!86137 (validMask!0 mask!3053)))

(assert (=> d!86137 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268976 lt!268982 mask!3053) lt!269064)))

(declare-fun b!592890 () Bool)

(declare-fun c!67009 () Bool)

(assert (=> b!592890 (= c!67009 (= lt!269063 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!338610 () SeekEntryResult!6169)

(assert (=> b!592890 (= e!338608 e!338610)))

(declare-fun b!592891 () Bool)

(assert (=> b!592891 (= e!338610 (MissingVacant!6169 vacantSpotIndex!68))))

(declare-fun b!592892 () Bool)

(assert (=> b!592892 (= e!338610 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!268976 lt!268982 mask!3053))))

(declare-fun b!592893 () Bool)

(assert (=> b!592893 (= e!338609 e!338608)))

(declare-fun c!67010 () Bool)

(assert (=> b!592893 (= c!67010 (= lt!269063 lt!268976))))

(declare-fun b!592894 () Bool)

(assert (=> b!592894 (= e!338609 Undefined!6169)))

(assert (= (and d!86137 c!67011) b!592894))

(assert (= (and d!86137 (not c!67011)) b!592893))

(assert (= (and b!592893 c!67010) b!592889))

(assert (= (and b!592893 (not c!67010)) b!592890))

(assert (= (and b!592890 c!67009) b!592891))

(assert (= (and b!592890 (not c!67009)) b!592892))

(declare-fun m!570417 () Bool)

(assert (=> d!86137 m!570417))

(declare-fun m!570419 () Bool)

(assert (=> d!86137 m!570419))

(declare-fun m!570421 () Bool)

(assert (=> d!86137 m!570421))

(assert (=> d!86137 m!570247))

(assert (=> b!592892 m!570271))

(assert (=> b!592892 m!570271))

(declare-fun m!570423 () Bool)

(assert (=> b!592892 m!570423))

(assert (=> b!592738 d!86137))

(declare-fun d!86141 () Bool)

(declare-fun lt!269067 () (_ BitVec 32))

(assert (=> d!86141 (and (bvsge lt!269067 #b00000000000000000000000000000000) (bvslt lt!269067 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86141 (= lt!269067 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86141 (validMask!0 mask!3053)))

(assert (=> d!86141 (= (nextIndex!0 index!984 x!910 mask!3053) lt!269067)))

(declare-fun bs!18272 () Bool)

(assert (= bs!18272 d!86141))

(declare-fun m!570425 () Bool)

(assert (=> bs!18272 m!570425))

(assert (=> bs!18272 m!570247))

(assert (=> b!592738 d!86141))

(declare-fun b!592895 () Bool)

(declare-fun e!338611 () SeekEntryResult!6169)

(assert (=> b!592895 (= e!338611 (Found!6169 lt!268979))))

(declare-fun d!86145 () Bool)

(declare-fun lt!269069 () SeekEntryResult!6169)

(assert (=> d!86145 (and (or ((_ is Undefined!6169) lt!269069) (not ((_ is Found!6169) lt!269069)) (and (bvsge (index!26916 lt!269069) #b00000000000000000000000000000000) (bvslt (index!26916 lt!269069) (size!18097 a!2986)))) (or ((_ is Undefined!6169) lt!269069) ((_ is Found!6169) lt!269069) (not ((_ is MissingVacant!6169) lt!269069)) (not (= (index!26918 lt!269069) vacantSpotIndex!68)) (and (bvsge (index!26918 lt!269069) #b00000000000000000000000000000000) (bvslt (index!26918 lt!269069) (size!18097 a!2986)))) (or ((_ is Undefined!6169) lt!269069) (ite ((_ is Found!6169) lt!269069) (= (select (arr!17732 a!2986) (index!26916 lt!269069)) (select (arr!17732 a!2986) j!136)) (and ((_ is MissingVacant!6169) lt!269069) (= (index!26918 lt!269069) vacantSpotIndex!68) (= (select (arr!17732 a!2986) (index!26918 lt!269069)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338612 () SeekEntryResult!6169)

(assert (=> d!86145 (= lt!269069 e!338612)))

(declare-fun c!67014 () Bool)

(assert (=> d!86145 (= c!67014 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!269068 () (_ BitVec 64))

(assert (=> d!86145 (= lt!269068 (select (arr!17732 a!2986) lt!268979))))

(assert (=> d!86145 (validMask!0 mask!3053)))

(assert (=> d!86145 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268979 vacantSpotIndex!68 (select (arr!17732 a!2986) j!136) a!2986 mask!3053) lt!269069)))

(declare-fun b!592896 () Bool)

(declare-fun c!67012 () Bool)

(assert (=> b!592896 (= c!67012 (= lt!269068 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!338613 () SeekEntryResult!6169)

(assert (=> b!592896 (= e!338611 e!338613)))

(declare-fun b!592897 () Bool)

(assert (=> b!592897 (= e!338613 (MissingVacant!6169 vacantSpotIndex!68))))

(declare-fun b!592898 () Bool)

(assert (=> b!592898 (= e!338613 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!268979 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17732 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592899 () Bool)

(assert (=> b!592899 (= e!338612 e!338611)))

(declare-fun c!67013 () Bool)

(assert (=> b!592899 (= c!67013 (= lt!269068 (select (arr!17732 a!2986) j!136)))))

(declare-fun b!592900 () Bool)

(assert (=> b!592900 (= e!338612 Undefined!6169)))

(assert (= (and d!86145 c!67014) b!592900))

(assert (= (and d!86145 (not c!67014)) b!592899))

(assert (= (and b!592899 c!67013) b!592895))

(assert (= (and b!592899 (not c!67013)) b!592896))

(assert (= (and b!592896 c!67012) b!592897))

(assert (= (and b!592896 (not c!67012)) b!592898))

(declare-fun m!570427 () Bool)

(assert (=> d!86145 m!570427))

(declare-fun m!570429 () Bool)

(assert (=> d!86145 m!570429))

(declare-fun m!570431 () Bool)

(assert (=> d!86145 m!570431))

(assert (=> d!86145 m!570247))

(assert (=> b!592898 m!570413))

(assert (=> b!592898 m!570413))

(assert (=> b!592898 m!570253))

(declare-fun m!570433 () Bool)

(assert (=> b!592898 m!570433))

(assert (=> b!592738 d!86145))

(declare-fun b!592977 () Bool)

(declare-fun e!338671 () SeekEntryResult!6169)

(declare-fun lt!269084 () SeekEntryResult!6169)

(assert (=> b!592977 (= e!338671 (Found!6169 (index!26917 lt!269084)))))

(declare-fun b!592978 () Bool)

(declare-fun e!338670 () SeekEntryResult!6169)

(assert (=> b!592978 (= e!338670 (seekKeyOrZeroReturnVacant!0 (x!55717 lt!269084) (index!26917 lt!269084) (index!26917 lt!269084) k0!1786 a!2986 mask!3053))))

(declare-fun b!592979 () Bool)

(declare-fun e!338669 () SeekEntryResult!6169)

(assert (=> b!592979 (= e!338669 e!338671)))

(declare-fun lt!269082 () (_ BitVec 64))

(assert (=> b!592979 (= lt!269082 (select (arr!17732 a!2986) (index!26917 lt!269084)))))

(declare-fun c!67036 () Bool)

(assert (=> b!592979 (= c!67036 (= lt!269082 k0!1786))))

(declare-fun b!592980 () Bool)

(assert (=> b!592980 (= e!338670 (MissingZero!6169 (index!26917 lt!269084)))))

(declare-fun b!592981 () Bool)

(declare-fun c!67038 () Bool)

(assert (=> b!592981 (= c!67038 (= lt!269082 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592981 (= e!338671 e!338670)))

(declare-fun b!592982 () Bool)

(assert (=> b!592982 (= e!338669 Undefined!6169)))

(declare-fun d!86147 () Bool)

(declare-fun lt!269083 () SeekEntryResult!6169)

(assert (=> d!86147 (and (or ((_ is Undefined!6169) lt!269083) (not ((_ is Found!6169) lt!269083)) (and (bvsge (index!26916 lt!269083) #b00000000000000000000000000000000) (bvslt (index!26916 lt!269083) (size!18097 a!2986)))) (or ((_ is Undefined!6169) lt!269083) ((_ is Found!6169) lt!269083) (not ((_ is MissingZero!6169) lt!269083)) (and (bvsge (index!26915 lt!269083) #b00000000000000000000000000000000) (bvslt (index!26915 lt!269083) (size!18097 a!2986)))) (or ((_ is Undefined!6169) lt!269083) ((_ is Found!6169) lt!269083) ((_ is MissingZero!6169) lt!269083) (not ((_ is MissingVacant!6169) lt!269083)) (and (bvsge (index!26918 lt!269083) #b00000000000000000000000000000000) (bvslt (index!26918 lt!269083) (size!18097 a!2986)))) (or ((_ is Undefined!6169) lt!269083) (ite ((_ is Found!6169) lt!269083) (= (select (arr!17732 a!2986) (index!26916 lt!269083)) k0!1786) (ite ((_ is MissingZero!6169) lt!269083) (= (select (arr!17732 a!2986) (index!26915 lt!269083)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6169) lt!269083) (= (select (arr!17732 a!2986) (index!26918 lt!269083)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86147 (= lt!269083 e!338669)))

(declare-fun c!67037 () Bool)

(assert (=> d!86147 (= c!67037 (and ((_ is Intermediate!6169) lt!269084) (undefined!6981 lt!269084)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36927 (_ BitVec 32)) SeekEntryResult!6169)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86147 (= lt!269084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86147 (validMask!0 mask!3053)))

(assert (=> d!86147 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!269083)))

(assert (= (and d!86147 c!67037) b!592982))

(assert (= (and d!86147 (not c!67037)) b!592979))

(assert (= (and b!592979 c!67036) b!592977))

(assert (= (and b!592979 (not c!67036)) b!592981))

(assert (= (and b!592981 c!67038) b!592980))

(assert (= (and b!592981 (not c!67038)) b!592978))

(declare-fun m!570471 () Bool)

(assert (=> b!592978 m!570471))

(declare-fun m!570473 () Bool)

(assert (=> b!592979 m!570473))

(declare-fun m!570475 () Bool)

(assert (=> d!86147 m!570475))

(declare-fun m!570477 () Bool)

(assert (=> d!86147 m!570477))

(assert (=> d!86147 m!570247))

(declare-fun m!570479 () Bool)

(assert (=> d!86147 m!570479))

(declare-fun m!570481 () Bool)

(assert (=> d!86147 m!570481))

(assert (=> d!86147 m!570479))

(declare-fun m!570483 () Bool)

(assert (=> d!86147 m!570483))

(assert (=> b!592741 d!86147))

(declare-fun d!86163 () Bool)

(declare-fun res!379639 () Bool)

(declare-fun e!338678 () Bool)

(assert (=> d!86163 (=> res!379639 e!338678)))

(assert (=> d!86163 (= res!379639 (= (select (arr!17732 lt!268982) index!984) (select (arr!17732 a!2986) j!136)))))

(assert (=> d!86163 (= (arrayContainsKey!0 lt!268982 (select (arr!17732 a!2986) j!136) index!984) e!338678)))

(declare-fun b!592995 () Bool)

(declare-fun e!338679 () Bool)

(assert (=> b!592995 (= e!338678 e!338679)))

(declare-fun res!379640 () Bool)

(assert (=> b!592995 (=> (not res!379640) (not e!338679))))

(assert (=> b!592995 (= res!379640 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18097 lt!268982)))))

(declare-fun b!592996 () Bool)

(assert (=> b!592996 (= e!338679 (arrayContainsKey!0 lt!268982 (select (arr!17732 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86163 (not res!379639)) b!592995))

(assert (= (and b!592995 res!379640) b!592996))

(assert (=> d!86163 m!570421))

(assert (=> b!592996 m!570253))

(declare-fun m!570485 () Bool)

(assert (=> b!592996 m!570485))

(assert (=> b!592731 d!86163))

(declare-fun d!86165 () Bool)

(assert (=> d!86165 (= (validKeyInArray!0 (select (arr!17732 a!2986) j!136)) (and (not (= (select (arr!17732 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17732 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!592733 d!86165))

(declare-fun d!86169 () Bool)

(declare-fun res!379641 () Bool)

(declare-fun e!338683 () Bool)

(assert (=> d!86169 (=> res!379641 e!338683)))

(assert (=> d!86169 (= res!379641 (= (select (arr!17732 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86169 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!338683)))

(declare-fun b!593003 () Bool)

(declare-fun e!338684 () Bool)

(assert (=> b!593003 (= e!338683 e!338684)))

(declare-fun res!379642 () Bool)

(assert (=> b!593003 (=> (not res!379642) (not e!338684))))

(assert (=> b!593003 (= res!379642 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18097 a!2986)))))

(declare-fun b!593004 () Bool)

(assert (=> b!593004 (= e!338684 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86169 (not res!379641)) b!593003))

(assert (= (and b!593003 res!379642) b!593004))

(declare-fun m!570493 () Bool)

(assert (=> d!86169 m!570493))

(declare-fun m!570495 () Bool)

(assert (=> b!593004 m!570495))

(assert (=> b!592744 d!86169))

(declare-fun d!86171 () Bool)

(assert (=> d!86171 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!592732 d!86171))

(declare-fun b!593033 () Bool)

(declare-fun e!338709 () Bool)

(declare-fun e!338711 () Bool)

(assert (=> b!593033 (= e!338709 e!338711)))

(declare-fun res!379663 () Bool)

(assert (=> b!593033 (=> (not res!379663) (not e!338711))))

(declare-fun e!338708 () Bool)

(assert (=> b!593033 (= res!379663 (not e!338708))))

(declare-fun res!379662 () Bool)

(assert (=> b!593033 (=> (not res!379662) (not e!338708))))

(assert (=> b!593033 (= res!379662 (validKeyInArray!0 (select (arr!17732 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!593034 () Bool)

(declare-fun contains!2899 (List!11812 (_ BitVec 64)) Bool)

(assert (=> b!593034 (= e!338708 (contains!2899 Nil!11809 (select (arr!17732 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32833 () Bool)

(declare-fun call!32836 () Bool)

(declare-fun c!67053 () Bool)

(assert (=> bm!32833 (= call!32836 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67053 (Cons!11808 (select (arr!17732 a!2986) #b00000000000000000000000000000000) Nil!11809) Nil!11809)))))

(declare-fun b!593035 () Bool)

(declare-fun e!338710 () Bool)

(assert (=> b!593035 (= e!338710 call!32836)))

(declare-fun b!593036 () Bool)

(assert (=> b!593036 (= e!338710 call!32836)))

(declare-fun b!593037 () Bool)

(assert (=> b!593037 (= e!338711 e!338710)))

(assert (=> b!593037 (= c!67053 (validKeyInArray!0 (select (arr!17732 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86173 () Bool)

(declare-fun res!379661 () Bool)

(assert (=> d!86173 (=> res!379661 e!338709)))

(assert (=> d!86173 (= res!379661 (bvsge #b00000000000000000000000000000000 (size!18097 a!2986)))))

(assert (=> d!86173 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11809) e!338709)))

(assert (= (and d!86173 (not res!379661)) b!593033))

(assert (= (and b!593033 res!379662) b!593034))

(assert (= (and b!593033 res!379663) b!593037))

(assert (= (and b!593037 c!67053) b!593035))

(assert (= (and b!593037 (not c!67053)) b!593036))

(assert (= (or b!593035 b!593036) bm!32833))

(assert (=> b!593033 m!570493))

(assert (=> b!593033 m!570493))

(declare-fun m!570513 () Bool)

(assert (=> b!593033 m!570513))

(assert (=> b!593034 m!570493))

(assert (=> b!593034 m!570493))

(declare-fun m!570515 () Bool)

(assert (=> b!593034 m!570515))

(assert (=> bm!32833 m!570493))

(declare-fun m!570517 () Bool)

(assert (=> bm!32833 m!570517))

(assert (=> b!593037 m!570493))

(assert (=> b!593037 m!570493))

(assert (=> b!593037 m!570513))

(assert (=> b!592736 d!86173))

(declare-fun bm!32839 () Bool)

(declare-fun call!32842 () Bool)

(assert (=> bm!32839 (= call!32842 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!593068 () Bool)

(declare-fun e!338731 () Bool)

(declare-fun e!338732 () Bool)

(assert (=> b!593068 (= e!338731 e!338732)))

(declare-fun c!67065 () Bool)

(assert (=> b!593068 (= c!67065 (validKeyInArray!0 (select (arr!17732 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!593069 () Bool)

(assert (=> b!593069 (= e!338732 call!32842)))

(declare-fun b!593071 () Bool)

(declare-fun e!338733 () Bool)

(assert (=> b!593071 (= e!338733 call!32842)))

(declare-fun d!86189 () Bool)

(declare-fun res!379673 () Bool)

(assert (=> d!86189 (=> res!379673 e!338731)))

(assert (=> d!86189 (= res!379673 (bvsge #b00000000000000000000000000000000 (size!18097 a!2986)))))

(assert (=> d!86189 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!338731)))

(declare-fun b!593070 () Bool)

(assert (=> b!593070 (= e!338732 e!338733)))

(declare-fun lt!269127 () (_ BitVec 64))

(assert (=> b!593070 (= lt!269127 (select (arr!17732 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!269125 () Unit!18588)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36927 (_ BitVec 64) (_ BitVec 32)) Unit!18588)

(assert (=> b!593070 (= lt!269125 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!269127 #b00000000000000000000000000000000))))

(assert (=> b!593070 (arrayContainsKey!0 a!2986 lt!269127 #b00000000000000000000000000000000)))

(declare-fun lt!269126 () Unit!18588)

(assert (=> b!593070 (= lt!269126 lt!269125)))

(declare-fun res!379672 () Bool)

(assert (=> b!593070 (= res!379672 (= (seekEntryOrOpen!0 (select (arr!17732 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6169 #b00000000000000000000000000000000)))))

(assert (=> b!593070 (=> (not res!379672) (not e!338733))))

(assert (= (and d!86189 (not res!379673)) b!593068))

(assert (= (and b!593068 c!67065) b!593070))

(assert (= (and b!593068 (not c!67065)) b!593069))

(assert (= (and b!593070 res!379672) b!593071))

(assert (= (or b!593071 b!593069) bm!32839))

(declare-fun m!570547 () Bool)

(assert (=> bm!32839 m!570547))

(assert (=> b!593068 m!570493))

(assert (=> b!593068 m!570493))

(assert (=> b!593068 m!570513))

(assert (=> b!593070 m!570493))

(declare-fun m!570549 () Bool)

(assert (=> b!593070 m!570549))

(declare-fun m!570551 () Bool)

(assert (=> b!593070 m!570551))

(assert (=> b!593070 m!570493))

(declare-fun m!570553 () Bool)

(assert (=> b!593070 m!570553))

(assert (=> b!592745 d!86189))

(declare-fun d!86203 () Bool)

(declare-fun res!379674 () Bool)

(declare-fun e!338734 () Bool)

(assert (=> d!86203 (=> res!379674 e!338734)))

(assert (=> d!86203 (= res!379674 (= (select (arr!17732 lt!268982) j!136) (select (arr!17732 a!2986) j!136)))))

(assert (=> d!86203 (= (arrayContainsKey!0 lt!268982 (select (arr!17732 a!2986) j!136) j!136) e!338734)))

(declare-fun b!593072 () Bool)

(declare-fun e!338735 () Bool)

(assert (=> b!593072 (= e!338734 e!338735)))

(declare-fun res!379675 () Bool)

(assert (=> b!593072 (=> (not res!379675) (not e!338735))))

(assert (=> b!593072 (= res!379675 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18097 lt!268982)))))

(declare-fun b!593073 () Bool)

(assert (=> b!593073 (= e!338735 (arrayContainsKey!0 lt!268982 (select (arr!17732 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86203 (not res!379674)) b!593072))

(assert (= (and b!593072 res!379675) b!593073))

(declare-fun m!570555 () Bool)

(assert (=> d!86203 m!570555))

(assert (=> b!593073 m!570253))

(declare-fun m!570557 () Bool)

(assert (=> b!593073 m!570557))

(assert (=> b!592735 d!86203))

(declare-fun b!593074 () Bool)

(declare-fun e!338736 () SeekEntryResult!6169)

(assert (=> b!593074 (= e!338736 (Found!6169 index!984))))

(declare-fun lt!269129 () SeekEntryResult!6169)

(declare-fun d!86205 () Bool)

(assert (=> d!86205 (and (or ((_ is Undefined!6169) lt!269129) (not ((_ is Found!6169) lt!269129)) (and (bvsge (index!26916 lt!269129) #b00000000000000000000000000000000) (bvslt (index!26916 lt!269129) (size!18097 a!2986)))) (or ((_ is Undefined!6169) lt!269129) ((_ is Found!6169) lt!269129) (not ((_ is MissingVacant!6169) lt!269129)) (not (= (index!26918 lt!269129) vacantSpotIndex!68)) (and (bvsge (index!26918 lt!269129) #b00000000000000000000000000000000) (bvslt (index!26918 lt!269129) (size!18097 a!2986)))) (or ((_ is Undefined!6169) lt!269129) (ite ((_ is Found!6169) lt!269129) (= (select (arr!17732 a!2986) (index!26916 lt!269129)) (select (arr!17732 a!2986) j!136)) (and ((_ is MissingVacant!6169) lt!269129) (= (index!26918 lt!269129) vacantSpotIndex!68) (= (select (arr!17732 a!2986) (index!26918 lt!269129)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!338737 () SeekEntryResult!6169)

(assert (=> d!86205 (= lt!269129 e!338737)))

(declare-fun c!67068 () Bool)

(assert (=> d!86205 (= c!67068 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!269128 () (_ BitVec 64))

(assert (=> d!86205 (= lt!269128 (select (arr!17732 a!2986) index!984))))

(assert (=> d!86205 (validMask!0 mask!3053)))

(assert (=> d!86205 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17732 a!2986) j!136) a!2986 mask!3053) lt!269129)))

(declare-fun b!593075 () Bool)

(declare-fun c!67066 () Bool)

(assert (=> b!593075 (= c!67066 (= lt!269128 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!338738 () SeekEntryResult!6169)

(assert (=> b!593075 (= e!338736 e!338738)))

(declare-fun b!593076 () Bool)

(assert (=> b!593076 (= e!338738 (MissingVacant!6169 vacantSpotIndex!68))))

(declare-fun b!593077 () Bool)

(assert (=> b!593077 (= e!338738 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17732 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!593078 () Bool)

(assert (=> b!593078 (= e!338737 e!338736)))

(declare-fun c!67067 () Bool)

(assert (=> b!593078 (= c!67067 (= lt!269128 (select (arr!17732 a!2986) j!136)))))

(declare-fun b!593079 () Bool)

(assert (=> b!593079 (= e!338737 Undefined!6169)))

(assert (= (and d!86205 c!67068) b!593079))

(assert (= (and d!86205 (not c!67068)) b!593078))

(assert (= (and b!593078 c!67067) b!593074))

(assert (= (and b!593078 (not c!67067)) b!593075))

(assert (= (and b!593075 c!67066) b!593076))

(assert (= (and b!593075 (not c!67066)) b!593077))

(declare-fun m!570559 () Bool)

(assert (=> d!86205 m!570559))

(declare-fun m!570561 () Bool)

(assert (=> d!86205 m!570561))

(assert (=> d!86205 m!570259))

(assert (=> d!86205 m!570247))

(assert (=> b!593077 m!570271))

(assert (=> b!593077 m!570271))

(assert (=> b!593077 m!570253))

(declare-fun m!570563 () Bool)

(assert (=> b!593077 m!570563))

(assert (=> b!592746 d!86205))

(check-sat (not d!86131) (not d!86145) (not d!86137) (not b!593004) (not d!86147) (not b!593068) (not b!592996) (not d!86133) (not b!592867) (not bm!32833) (not d!86125) (not b!593034) (not bm!32839) (not d!86141) (not b!593073) (not b!592892) (not b!593077) (not b!593033) (not b!593070) (not b!592886) (not b!592978) (not d!86205) (not b!592898) (not b!592870) (not b!593037))
(check-sat)
