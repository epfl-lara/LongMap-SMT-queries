; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55928 () Bool)

(assert start!55928)

(declare-fun b!612607 () Bool)

(declare-fun res!394161 () Bool)

(declare-fun e!351154 () Bool)

(assert (=> b!612607 (=> (not res!394161) (not e!351154))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!612607 (= res!394161 (validKeyInArray!0 k!1786))))

(declare-fun b!612608 () Bool)

(declare-fun e!351149 () Bool)

(declare-fun e!351150 () Bool)

(assert (=> b!612608 (= e!351149 e!351150)))

(declare-fun res!394145 () Bool)

(assert (=> b!612608 (=> (not res!394145) (not e!351150))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6385 0))(
  ( (MissingZero!6385 (index!27824 (_ BitVec 32))) (Found!6385 (index!27825 (_ BitVec 32))) (Intermediate!6385 (undefined!7197 Bool) (index!27826 (_ BitVec 32)) (x!56633 (_ BitVec 32))) (Undefined!6385) (MissingVacant!6385 (index!27827 (_ BitVec 32))) )
))
(declare-fun lt!280557 () SeekEntryResult!6385)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37398 0))(
  ( (array!37399 (arr!17945 (Array (_ BitVec 32) (_ BitVec 64))) (size!18309 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37398)

(assert (=> b!612608 (= res!394145 (and (= lt!280557 (Found!6385 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17945 a!2986) index!984) (select (arr!17945 a!2986) j!136))) (not (= (select (arr!17945 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37398 (_ BitVec 32)) SeekEntryResult!6385)

(assert (=> b!612608 (= lt!280557 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17945 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!612609 () Bool)

(declare-fun e!351153 () Bool)

(declare-fun lt!280550 () SeekEntryResult!6385)

(assert (=> b!612609 (= e!351153 (= lt!280557 lt!280550))))

(declare-fun b!612610 () Bool)

(declare-datatypes ((Unit!19690 0))(
  ( (Unit!19691) )
))
(declare-fun e!351152 () Unit!19690)

(declare-fun Unit!19692 () Unit!19690)

(assert (=> b!612610 (= e!351152 Unit!19692)))

(declare-fun lt!280547 () Unit!19690)

(declare-fun lt!280546 () array!37398)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37398 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19690)

(assert (=> b!612610 (= lt!280547 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280546 (select (arr!17945 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612610 (arrayContainsKey!0 lt!280546 (select (arr!17945 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280551 () Unit!19690)

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((List!11986 0))(
  ( (Nil!11983) (Cons!11982 (h!13027 (_ BitVec 64)) (t!18214 List!11986)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37398 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11986) Unit!19690)

(assert (=> b!612610 (= lt!280551 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11983))))

(declare-fun arrayNoDuplicates!0 (array!37398 (_ BitVec 32) List!11986) Bool)

(assert (=> b!612610 (arrayNoDuplicates!0 lt!280546 #b00000000000000000000000000000000 Nil!11983)))

(declare-fun lt!280553 () Unit!19690)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37398 (_ BitVec 32) (_ BitVec 32)) Unit!19690)

(assert (=> b!612610 (= lt!280553 (lemmaNoDuplicateFromThenFromBigger!0 lt!280546 #b00000000000000000000000000000000 j!136))))

(assert (=> b!612610 (arrayNoDuplicates!0 lt!280546 j!136 Nil!11983)))

(declare-fun lt!280558 () Unit!19690)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37398 (_ BitVec 64) (_ BitVec 32) List!11986) Unit!19690)

(assert (=> b!612610 (= lt!280558 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280546 (select (arr!17945 a!2986) j!136) j!136 Nil!11983))))

(assert (=> b!612610 false))

(declare-fun b!612611 () Bool)

(declare-fun res!394156 () Bool)

(declare-fun e!351159 () Bool)

(assert (=> b!612611 (=> (not res!394156) (not e!351159))))

(assert (=> b!612611 (= res!394156 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11983))))

(declare-fun b!612612 () Bool)

(declare-fun e!351146 () Unit!19690)

(declare-fun Unit!19693 () Unit!19690)

(assert (=> b!612612 (= e!351146 Unit!19693)))

(assert (=> b!612612 false))

(declare-fun b!612613 () Bool)

(declare-fun Unit!19694 () Unit!19690)

(assert (=> b!612613 (= e!351152 Unit!19694)))

(declare-fun b!612614 () Bool)

(declare-fun e!351148 () Bool)

(declare-fun e!351156 () Bool)

(assert (=> b!612614 (= e!351148 e!351156)))

(declare-fun res!394153 () Bool)

(assert (=> b!612614 (=> res!394153 e!351156)))

(declare-fun lt!280549 () (_ BitVec 64))

(declare-fun lt!280545 () (_ BitVec 64))

(assert (=> b!612614 (= res!394153 (or (not (= (select (arr!17945 a!2986) j!136) lt!280549)) (not (= (select (arr!17945 a!2986) j!136) lt!280545)) (bvsge j!136 index!984)))))

(declare-fun b!612615 () Bool)

(declare-fun res!394150 () Bool)

(assert (=> b!612615 (=> (not res!394150) (not e!351154))))

(assert (=> b!612615 (= res!394150 (and (= (size!18309 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18309 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18309 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612616 () Bool)

(declare-fun e!351145 () Bool)

(assert (=> b!612616 (= e!351145 true)))

(assert (=> b!612616 (arrayNoDuplicates!0 lt!280546 #b00000000000000000000000000000000 Nil!11983)))

(declare-fun lt!280542 () Unit!19690)

(assert (=> b!612616 (= lt!280542 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11983))))

(assert (=> b!612616 (arrayContainsKey!0 lt!280546 (select (arr!17945 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280544 () Unit!19690)

(assert (=> b!612616 (= lt!280544 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280546 (select (arr!17945 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!351155 () Bool)

(assert (=> b!612616 e!351155))

(declare-fun res!394162 () Bool)

(assert (=> b!612616 (=> (not res!394162) (not e!351155))))

(assert (=> b!612616 (= res!394162 (arrayContainsKey!0 lt!280546 (select (arr!17945 a!2986) j!136) j!136))))

(declare-fun b!612618 () Bool)

(declare-fun res!394160 () Bool)

(assert (=> b!612618 (=> (not res!394160) (not e!351154))))

(assert (=> b!612618 (= res!394160 (validKeyInArray!0 (select (arr!17945 a!2986) j!136)))))

(declare-fun b!612619 () Bool)

(declare-fun e!351158 () Bool)

(declare-fun e!351157 () Bool)

(assert (=> b!612619 (= e!351158 e!351157)))

(declare-fun res!394149 () Bool)

(assert (=> b!612619 (=> res!394149 e!351157)))

(assert (=> b!612619 (= res!394149 (or (not (= (select (arr!17945 a!2986) j!136) lt!280549)) (not (= (select (arr!17945 a!2986) j!136) lt!280545))))))

(assert (=> b!612619 e!351148))

(declare-fun res!394148 () Bool)

(assert (=> b!612619 (=> (not res!394148) (not e!351148))))

(assert (=> b!612619 (= res!394148 (= lt!280545 (select (arr!17945 a!2986) j!136)))))

(assert (=> b!612619 (= lt!280545 (select (store (arr!17945 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!612620 () Bool)

(declare-fun e!351147 () Bool)

(assert (=> b!612620 (= e!351156 e!351147)))

(declare-fun res!394158 () Bool)

(assert (=> b!612620 (=> (not res!394158) (not e!351147))))

(assert (=> b!612620 (= res!394158 (arrayContainsKey!0 lt!280546 (select (arr!17945 a!2986) j!136) j!136))))

(declare-fun b!612621 () Bool)

(assert (=> b!612621 (= e!351155 (arrayContainsKey!0 lt!280546 (select (arr!17945 a!2986) j!136) index!984))))

(declare-fun b!612622 () Bool)

(assert (=> b!612622 (= e!351150 (not e!351158))))

(declare-fun res!394155 () Bool)

(assert (=> b!612622 (=> res!394155 e!351158)))

(declare-fun lt!280543 () SeekEntryResult!6385)

(assert (=> b!612622 (= res!394155 (not (= lt!280543 (Found!6385 index!984))))))

(declare-fun lt!280555 () Unit!19690)

(assert (=> b!612622 (= lt!280555 e!351146)))

(declare-fun c!69598 () Bool)

(assert (=> b!612622 (= c!69598 (= lt!280543 Undefined!6385))))

(assert (=> b!612622 (= lt!280543 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280549 lt!280546 mask!3053))))

(assert (=> b!612622 e!351153))

(declare-fun res!394157 () Bool)

(assert (=> b!612622 (=> (not res!394157) (not e!351153))))

(declare-fun lt!280556 () (_ BitVec 32))

(assert (=> b!612622 (= res!394157 (= lt!280550 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280556 vacantSpotIndex!68 lt!280549 lt!280546 mask!3053)))))

(assert (=> b!612622 (= lt!280550 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280556 vacantSpotIndex!68 (select (arr!17945 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!612622 (= lt!280549 (select (store (arr!17945 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!280554 () Unit!19690)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37398 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19690)

(assert (=> b!612622 (= lt!280554 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280556 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612622 (= lt!280556 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!612623 () Bool)

(declare-fun res!394154 () Bool)

(assert (=> b!612623 (=> (not res!394154) (not e!351159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37398 (_ BitVec 32)) Bool)

(assert (=> b!612623 (= res!394154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!612624 () Bool)

(assert (=> b!612624 (= e!351159 e!351149)))

(declare-fun res!394151 () Bool)

(assert (=> b!612624 (=> (not res!394151) (not e!351149))))

(assert (=> b!612624 (= res!394151 (= (select (store (arr!17945 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!612624 (= lt!280546 (array!37399 (store (arr!17945 a!2986) i!1108 k!1786) (size!18309 a!2986)))))

(declare-fun b!612625 () Bool)

(declare-fun res!394159 () Bool)

(assert (=> b!612625 (=> (not res!394159) (not e!351154))))

(assert (=> b!612625 (= res!394159 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!612626 () Bool)

(declare-fun Unit!19695 () Unit!19690)

(assert (=> b!612626 (= e!351146 Unit!19695)))

(declare-fun b!612627 () Bool)

(assert (=> b!612627 (= e!351154 e!351159)))

(declare-fun res!394152 () Bool)

(assert (=> b!612627 (=> (not res!394152) (not e!351159))))

(declare-fun lt!280552 () SeekEntryResult!6385)

(assert (=> b!612627 (= res!394152 (or (= lt!280552 (MissingZero!6385 i!1108)) (= lt!280552 (MissingVacant!6385 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37398 (_ BitVec 32)) SeekEntryResult!6385)

(assert (=> b!612627 (= lt!280552 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!612628 () Bool)

(assert (=> b!612628 (= e!351147 (arrayContainsKey!0 lt!280546 (select (arr!17945 a!2986) j!136) index!984))))

(declare-fun b!612629 () Bool)

(assert (=> b!612629 (= e!351157 e!351145)))

(declare-fun res!394146 () Bool)

(assert (=> b!612629 (=> res!394146 e!351145)))

(assert (=> b!612629 (= res!394146 (bvsge index!984 j!136))))

(declare-fun lt!280548 () Unit!19690)

(assert (=> b!612629 (= lt!280548 e!351152)))

(declare-fun c!69599 () Bool)

(assert (=> b!612629 (= c!69599 (bvslt j!136 index!984))))

(declare-fun b!612617 () Bool)

(declare-fun res!394147 () Bool)

(assert (=> b!612617 (=> (not res!394147) (not e!351159))))

(assert (=> b!612617 (= res!394147 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17945 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!394163 () Bool)

(assert (=> start!55928 (=> (not res!394163) (not e!351154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55928 (= res!394163 (validMask!0 mask!3053))))

(assert (=> start!55928 e!351154))

(assert (=> start!55928 true))

(declare-fun array_inv!13741 (array!37398) Bool)

(assert (=> start!55928 (array_inv!13741 a!2986)))

(assert (= (and start!55928 res!394163) b!612615))

(assert (= (and b!612615 res!394150) b!612618))

(assert (= (and b!612618 res!394160) b!612607))

(assert (= (and b!612607 res!394161) b!612625))

(assert (= (and b!612625 res!394159) b!612627))

(assert (= (and b!612627 res!394152) b!612623))

(assert (= (and b!612623 res!394154) b!612611))

(assert (= (and b!612611 res!394156) b!612617))

(assert (= (and b!612617 res!394147) b!612624))

(assert (= (and b!612624 res!394151) b!612608))

(assert (= (and b!612608 res!394145) b!612622))

(assert (= (and b!612622 res!394157) b!612609))

(assert (= (and b!612622 c!69598) b!612612))

(assert (= (and b!612622 (not c!69598)) b!612626))

(assert (= (and b!612622 (not res!394155)) b!612619))

(assert (= (and b!612619 res!394148) b!612614))

(assert (= (and b!612614 (not res!394153)) b!612620))

(assert (= (and b!612620 res!394158) b!612628))

(assert (= (and b!612619 (not res!394149)) b!612629))

(assert (= (and b!612629 c!69599) b!612610))

(assert (= (and b!612629 (not c!69599)) b!612613))

(assert (= (and b!612629 (not res!394146)) b!612616))

(assert (= (and b!612616 res!394162) b!612621))

(declare-fun m!588943 () Bool)

(assert (=> b!612607 m!588943))

(declare-fun m!588945 () Bool)

(assert (=> b!612617 m!588945))

(declare-fun m!588947 () Bool)

(assert (=> b!612623 m!588947))

(declare-fun m!588949 () Bool)

(assert (=> b!612627 m!588949))

(declare-fun m!588951 () Bool)

(assert (=> b!612621 m!588951))

(assert (=> b!612621 m!588951))

(declare-fun m!588953 () Bool)

(assert (=> b!612621 m!588953))

(assert (=> b!612619 m!588951))

(declare-fun m!588955 () Bool)

(assert (=> b!612619 m!588955))

(declare-fun m!588957 () Bool)

(assert (=> b!612619 m!588957))

(assert (=> b!612628 m!588951))

(assert (=> b!612628 m!588951))

(assert (=> b!612628 m!588953))

(declare-fun m!588959 () Bool)

(assert (=> start!55928 m!588959))

(declare-fun m!588961 () Bool)

(assert (=> start!55928 m!588961))

(declare-fun m!588963 () Bool)

(assert (=> b!612608 m!588963))

(assert (=> b!612608 m!588951))

(assert (=> b!612608 m!588951))

(declare-fun m!588965 () Bool)

(assert (=> b!612608 m!588965))

(assert (=> b!612620 m!588951))

(assert (=> b!612620 m!588951))

(declare-fun m!588967 () Bool)

(assert (=> b!612620 m!588967))

(assert (=> b!612614 m!588951))

(declare-fun m!588969 () Bool)

(assert (=> b!612625 m!588969))

(assert (=> b!612610 m!588951))

(declare-fun m!588971 () Bool)

(assert (=> b!612610 m!588971))

(declare-fun m!588973 () Bool)

(assert (=> b!612610 m!588973))

(assert (=> b!612610 m!588951))

(declare-fun m!588975 () Bool)

(assert (=> b!612610 m!588975))

(assert (=> b!612610 m!588951))

(declare-fun m!588977 () Bool)

(assert (=> b!612610 m!588977))

(assert (=> b!612610 m!588951))

(declare-fun m!588979 () Bool)

(assert (=> b!612610 m!588979))

(declare-fun m!588981 () Bool)

(assert (=> b!612610 m!588981))

(declare-fun m!588983 () Bool)

(assert (=> b!612610 m!588983))

(assert (=> b!612624 m!588955))

(declare-fun m!588985 () Bool)

(assert (=> b!612624 m!588985))

(assert (=> b!612616 m!588951))

(assert (=> b!612616 m!588967))

(assert (=> b!612616 m!588951))

(assert (=> b!612616 m!588951))

(declare-fun m!588987 () Bool)

(assert (=> b!612616 m!588987))

(assert (=> b!612616 m!588981))

(assert (=> b!612616 m!588951))

(declare-fun m!588989 () Bool)

(assert (=> b!612616 m!588989))

(assert (=> b!612616 m!588983))

(assert (=> b!612618 m!588951))

(assert (=> b!612618 m!588951))

(declare-fun m!588991 () Bool)

(assert (=> b!612618 m!588991))

(declare-fun m!588993 () Bool)

(assert (=> b!612622 m!588993))

(declare-fun m!588995 () Bool)

(assert (=> b!612622 m!588995))

(assert (=> b!612622 m!588951))

(assert (=> b!612622 m!588955))

(assert (=> b!612622 m!588951))

(declare-fun m!588997 () Bool)

(assert (=> b!612622 m!588997))

(declare-fun m!588999 () Bool)

(assert (=> b!612622 m!588999))

(declare-fun m!589001 () Bool)

(assert (=> b!612622 m!589001))

(declare-fun m!589003 () Bool)

(assert (=> b!612622 m!589003))

(declare-fun m!589005 () Bool)

(assert (=> b!612611 m!589005))

(push 1)

