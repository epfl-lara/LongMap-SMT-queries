; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55980 () Bool)

(assert start!55980)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!351324 () Bool)

(declare-datatypes ((array!37395 0))(
  ( (array!37396 (arr!17941 (Array (_ BitVec 32) (_ BitVec 64))) (size!18305 (_ BitVec 32))) )
))
(declare-fun lt!280713 () array!37395)

(declare-fun b!612891 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37395)

(declare-fun arrayContainsKey!0 (array!37395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612891 (= e!351324 (arrayContainsKey!0 lt!280713 (select (arr!17941 a!2986) j!136) index!984))))

(declare-fun b!612892 () Bool)

(declare-fun res!394320 () Bool)

(declare-fun e!351331 () Bool)

(assert (=> b!612892 (=> (not res!394320) (not e!351331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!612892 (= res!394320 (validKeyInArray!0 (select (arr!17941 a!2986) j!136)))))

(declare-fun b!612893 () Bool)

(declare-fun e!351323 () Bool)

(declare-fun e!351322 () Bool)

(assert (=> b!612893 (= e!351323 e!351322)))

(declare-fun res!394328 () Bool)

(assert (=> b!612893 (=> res!394328 e!351322)))

(assert (=> b!612893 (= res!394328 (or (bvsge (size!18305 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18305 a!2986)) (bvsge index!984 (size!18305 a!2986))))))

(declare-datatypes ((List!11889 0))(
  ( (Nil!11886) (Cons!11885 (h!12933 (_ BitVec 64)) (t!18109 List!11889)) )
))
(declare-fun arrayNoDuplicates!0 (array!37395 (_ BitVec 32) List!11889) Bool)

(assert (=> b!612893 (arrayNoDuplicates!0 lt!280713 index!984 Nil!11886)))

(declare-datatypes ((Unit!19675 0))(
  ( (Unit!19676) )
))
(declare-fun lt!280716 () Unit!19675)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37395 (_ BitVec 32) (_ BitVec 32)) Unit!19675)

(assert (=> b!612893 (= lt!280716 (lemmaNoDuplicateFromThenFromBigger!0 lt!280713 #b00000000000000000000000000000000 index!984))))

(assert (=> b!612893 (arrayNoDuplicates!0 lt!280713 #b00000000000000000000000000000000 Nil!11886)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!280703 () Unit!19675)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37395 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11889) Unit!19675)

(assert (=> b!612893 (= lt!280703 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11886))))

(assert (=> b!612893 (arrayContainsKey!0 lt!280713 (select (arr!17941 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280715 () Unit!19675)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37395 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19675)

(assert (=> b!612893 (= lt!280715 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280713 (select (arr!17941 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!351325 () Bool)

(assert (=> b!612893 e!351325))

(declare-fun res!394324 () Bool)

(assert (=> b!612893 (=> (not res!394324) (not e!351325))))

(assert (=> b!612893 (= res!394324 (arrayContainsKey!0 lt!280713 (select (arr!17941 a!2986) j!136) j!136))))

(declare-fun b!612894 () Bool)

(declare-fun e!351321 () Bool)

(assert (=> b!612894 (= e!351321 e!351323)))

(declare-fun res!394333 () Bool)

(assert (=> b!612894 (=> res!394333 e!351323)))

(assert (=> b!612894 (= res!394333 (bvsge index!984 j!136))))

(declare-fun lt!280702 () Unit!19675)

(declare-fun e!351327 () Unit!19675)

(assert (=> b!612894 (= lt!280702 e!351327)))

(declare-fun c!69658 () Bool)

(assert (=> b!612894 (= c!69658 (bvslt j!136 index!984))))

(declare-fun b!612895 () Bool)

(declare-fun res!394330 () Bool)

(assert (=> b!612895 (=> res!394330 e!351322)))

(declare-fun contains!3021 (List!11889 (_ BitVec 64)) Bool)

(assert (=> b!612895 (= res!394330 (contains!3021 Nil!11886 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!612896 () Bool)

(declare-fun res!394313 () Bool)

(assert (=> b!612896 (=> res!394313 e!351322)))

(declare-fun noDuplicate!352 (List!11889) Bool)

(assert (=> b!612896 (= res!394313 (not (noDuplicate!352 Nil!11886)))))

(declare-fun b!612897 () Bool)

(declare-fun e!351330 () Bool)

(declare-fun e!351336 () Bool)

(assert (=> b!612897 (= e!351330 (not e!351336))))

(declare-fun res!394319 () Bool)

(assert (=> b!612897 (=> res!394319 e!351336)))

(declare-datatypes ((SeekEntryResult!6337 0))(
  ( (MissingZero!6337 (index!27632 (_ BitVec 32))) (Found!6337 (index!27633 (_ BitVec 32))) (Intermediate!6337 (undefined!7149 Bool) (index!27634 (_ BitVec 32)) (x!56596 (_ BitVec 32))) (Undefined!6337) (MissingVacant!6337 (index!27635 (_ BitVec 32))) )
))
(declare-fun lt!280717 () SeekEntryResult!6337)

(assert (=> b!612897 (= res!394319 (not (= lt!280717 (Found!6337 index!984))))))

(declare-fun lt!280711 () Unit!19675)

(declare-fun e!351329 () Unit!19675)

(assert (=> b!612897 (= lt!280711 e!351329)))

(declare-fun c!69659 () Bool)

(assert (=> b!612897 (= c!69659 (= lt!280717 Undefined!6337))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!280708 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37395 (_ BitVec 32)) SeekEntryResult!6337)

(assert (=> b!612897 (= lt!280717 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280708 lt!280713 mask!3053))))

(declare-fun e!351332 () Bool)

(assert (=> b!612897 e!351332))

(declare-fun res!394312 () Bool)

(assert (=> b!612897 (=> (not res!394312) (not e!351332))))

(declare-fun lt!280707 () (_ BitVec 32))

(declare-fun lt!280710 () SeekEntryResult!6337)

(assert (=> b!612897 (= res!394312 (= lt!280710 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280707 vacantSpotIndex!68 lt!280708 lt!280713 mask!3053)))))

(assert (=> b!612897 (= lt!280710 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280707 vacantSpotIndex!68 (select (arr!17941 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!612897 (= lt!280708 (select (store (arr!17941 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!280700 () Unit!19675)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37395 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19675)

(assert (=> b!612897 (= lt!280700 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280707 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612897 (= lt!280707 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!612898 () Bool)

(declare-fun res!394315 () Bool)

(declare-fun e!351335 () Bool)

(assert (=> b!612898 (=> (not res!394315) (not e!351335))))

(assert (=> b!612898 (= res!394315 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11886))))

(declare-fun b!612899 () Bool)

(declare-fun e!351334 () Bool)

(assert (=> b!612899 (= e!351334 e!351330)))

(declare-fun res!394329 () Bool)

(assert (=> b!612899 (=> (not res!394329) (not e!351330))))

(declare-fun lt!280706 () SeekEntryResult!6337)

(assert (=> b!612899 (= res!394329 (and (= lt!280706 (Found!6337 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17941 a!2986) index!984) (select (arr!17941 a!2986) j!136))) (not (= (select (arr!17941 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!612899 (= lt!280706 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17941 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!612900 () Bool)

(declare-fun Unit!19677 () Unit!19675)

(assert (=> b!612900 (= e!351329 Unit!19677)))

(assert (=> b!612900 false))

(declare-fun b!612901 () Bool)

(declare-fun res!394332 () Bool)

(assert (=> b!612901 (=> (not res!394332) (not e!351331))))

(assert (=> b!612901 (= res!394332 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!612902 () Bool)

(declare-fun Unit!19678 () Unit!19675)

(assert (=> b!612902 (= e!351327 Unit!19678)))

(declare-fun b!612903 () Bool)

(declare-fun res!394317 () Bool)

(assert (=> b!612903 (=> (not res!394317) (not e!351331))))

(assert (=> b!612903 (= res!394317 (and (= (size!18305 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18305 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18305 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612904 () Bool)

(declare-fun Unit!19679 () Unit!19675)

(assert (=> b!612904 (= e!351327 Unit!19679)))

(declare-fun lt!280709 () Unit!19675)

(assert (=> b!612904 (= lt!280709 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280713 (select (arr!17941 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!612904 (arrayContainsKey!0 lt!280713 (select (arr!17941 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280705 () Unit!19675)

(assert (=> b!612904 (= lt!280705 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11886))))

(assert (=> b!612904 (arrayNoDuplicates!0 lt!280713 #b00000000000000000000000000000000 Nil!11886)))

(declare-fun lt!280701 () Unit!19675)

(assert (=> b!612904 (= lt!280701 (lemmaNoDuplicateFromThenFromBigger!0 lt!280713 #b00000000000000000000000000000000 j!136))))

(assert (=> b!612904 (arrayNoDuplicates!0 lt!280713 j!136 Nil!11886)))

(declare-fun lt!280714 () Unit!19675)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37395 (_ BitVec 64) (_ BitVec 32) List!11889) Unit!19675)

(assert (=> b!612904 (= lt!280714 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280713 (select (arr!17941 a!2986) j!136) j!136 Nil!11886))))

(assert (=> b!612904 false))

(declare-fun b!612905 () Bool)

(assert (=> b!612905 (= e!351335 e!351334)))

(declare-fun res!394327 () Bool)

(assert (=> b!612905 (=> (not res!394327) (not e!351334))))

(assert (=> b!612905 (= res!394327 (= (select (store (arr!17941 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!612905 (= lt!280713 (array!37396 (store (arr!17941 a!2986) i!1108 k0!1786) (size!18305 a!2986)))))

(declare-fun b!612906 () Bool)

(declare-fun res!394316 () Bool)

(assert (=> b!612906 (=> (not res!394316) (not e!351335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37395 (_ BitVec 32)) Bool)

(assert (=> b!612906 (= res!394316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!612907 () Bool)

(declare-fun res!394322 () Bool)

(assert (=> b!612907 (=> (not res!394322) (not e!351331))))

(assert (=> b!612907 (= res!394322 (validKeyInArray!0 k0!1786))))

(declare-fun b!612908 () Bool)

(declare-fun e!351326 () Bool)

(declare-fun e!351333 () Bool)

(assert (=> b!612908 (= e!351326 e!351333)))

(declare-fun res!394331 () Bool)

(assert (=> b!612908 (=> res!394331 e!351333)))

(declare-fun lt!280699 () (_ BitVec 64))

(assert (=> b!612908 (= res!394331 (or (not (= (select (arr!17941 a!2986) j!136) lt!280708)) (not (= (select (arr!17941 a!2986) j!136) lt!280699)) (bvsge j!136 index!984)))))

(declare-fun b!612909 () Bool)

(assert (=> b!612909 (= e!351331 e!351335)))

(declare-fun res!394326 () Bool)

(assert (=> b!612909 (=> (not res!394326) (not e!351335))))

(declare-fun lt!280712 () SeekEntryResult!6337)

(assert (=> b!612909 (= res!394326 (or (= lt!280712 (MissingZero!6337 i!1108)) (= lt!280712 (MissingVacant!6337 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37395 (_ BitVec 32)) SeekEntryResult!6337)

(assert (=> b!612909 (= lt!280712 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!612910 () Bool)

(declare-fun res!394325 () Bool)

(assert (=> b!612910 (=> (not res!394325) (not e!351335))))

(assert (=> b!612910 (= res!394325 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17941 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!612911 () Bool)

(assert (=> b!612911 (= e!351332 (= lt!280706 lt!280710))))

(declare-fun res!394321 () Bool)

(assert (=> start!55980 (=> (not res!394321) (not e!351331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55980 (= res!394321 (validMask!0 mask!3053))))

(assert (=> start!55980 e!351331))

(assert (=> start!55980 true))

(declare-fun array_inv!13800 (array!37395) Bool)

(assert (=> start!55980 (array_inv!13800 a!2986)))

(declare-fun b!612912 () Bool)

(assert (=> b!612912 (= e!351336 e!351321)))

(declare-fun res!394318 () Bool)

(assert (=> b!612912 (=> res!394318 e!351321)))

(assert (=> b!612912 (= res!394318 (or (not (= (select (arr!17941 a!2986) j!136) lt!280708)) (not (= (select (arr!17941 a!2986) j!136) lt!280699))))))

(assert (=> b!612912 e!351326))

(declare-fun res!394314 () Bool)

(assert (=> b!612912 (=> (not res!394314) (not e!351326))))

(assert (=> b!612912 (= res!394314 (= lt!280699 (select (arr!17941 a!2986) j!136)))))

(assert (=> b!612912 (= lt!280699 (select (store (arr!17941 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!612913 () Bool)

(assert (=> b!612913 (= e!351325 (arrayContainsKey!0 lt!280713 (select (arr!17941 a!2986) j!136) index!984))))

(declare-fun b!612914 () Bool)

(declare-fun Unit!19680 () Unit!19675)

(assert (=> b!612914 (= e!351329 Unit!19680)))

(declare-fun b!612915 () Bool)

(assert (=> b!612915 (= e!351333 e!351324)))

(declare-fun res!394323 () Bool)

(assert (=> b!612915 (=> (not res!394323) (not e!351324))))

(assert (=> b!612915 (= res!394323 (arrayContainsKey!0 lt!280713 (select (arr!17941 a!2986) j!136) j!136))))

(declare-fun b!612916 () Bool)

(assert (=> b!612916 (= e!351322 true)))

(declare-fun lt!280704 () Bool)

(assert (=> b!612916 (= lt!280704 (contains!3021 Nil!11886 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!55980 res!394321) b!612903))

(assert (= (and b!612903 res!394317) b!612892))

(assert (= (and b!612892 res!394320) b!612907))

(assert (= (and b!612907 res!394322) b!612901))

(assert (= (and b!612901 res!394332) b!612909))

(assert (= (and b!612909 res!394326) b!612906))

(assert (= (and b!612906 res!394316) b!612898))

(assert (= (and b!612898 res!394315) b!612910))

(assert (= (and b!612910 res!394325) b!612905))

(assert (= (and b!612905 res!394327) b!612899))

(assert (= (and b!612899 res!394329) b!612897))

(assert (= (and b!612897 res!394312) b!612911))

(assert (= (and b!612897 c!69659) b!612900))

(assert (= (and b!612897 (not c!69659)) b!612914))

(assert (= (and b!612897 (not res!394319)) b!612912))

(assert (= (and b!612912 res!394314) b!612908))

(assert (= (and b!612908 (not res!394331)) b!612915))

(assert (= (and b!612915 res!394323) b!612891))

(assert (= (and b!612912 (not res!394318)) b!612894))

(assert (= (and b!612894 c!69658) b!612904))

(assert (= (and b!612894 (not c!69658)) b!612902))

(assert (= (and b!612894 (not res!394333)) b!612893))

(assert (= (and b!612893 res!394324) b!612913))

(assert (= (and b!612893 (not res!394328)) b!612896))

(assert (= (and b!612896 (not res!394313)) b!612895))

(assert (= (and b!612895 (not res!394330)) b!612916))

(declare-fun m!589493 () Bool)

(assert (=> b!612913 m!589493))

(assert (=> b!612913 m!589493))

(declare-fun m!589495 () Bool)

(assert (=> b!612913 m!589495))

(declare-fun m!589497 () Bool)

(assert (=> start!55980 m!589497))

(declare-fun m!589499 () Bool)

(assert (=> start!55980 m!589499))

(declare-fun m!589501 () Bool)

(assert (=> b!612906 m!589501))

(declare-fun m!589503 () Bool)

(assert (=> b!612899 m!589503))

(assert (=> b!612899 m!589493))

(assert (=> b!612899 m!589493))

(declare-fun m!589505 () Bool)

(assert (=> b!612899 m!589505))

(assert (=> b!612912 m!589493))

(declare-fun m!589507 () Bool)

(assert (=> b!612912 m!589507))

(declare-fun m!589509 () Bool)

(assert (=> b!612912 m!589509))

(assert (=> b!612905 m!589507))

(declare-fun m!589511 () Bool)

(assert (=> b!612905 m!589511))

(assert (=> b!612915 m!589493))

(assert (=> b!612915 m!589493))

(declare-fun m!589513 () Bool)

(assert (=> b!612915 m!589513))

(declare-fun m!589515 () Bool)

(assert (=> b!612898 m!589515))

(declare-fun m!589517 () Bool)

(assert (=> b!612895 m!589517))

(declare-fun m!589519 () Bool)

(assert (=> b!612897 m!589519))

(assert (=> b!612897 m!589493))

(declare-fun m!589521 () Bool)

(assert (=> b!612897 m!589521))

(assert (=> b!612897 m!589493))

(assert (=> b!612897 m!589507))

(declare-fun m!589523 () Bool)

(assert (=> b!612897 m!589523))

(declare-fun m!589525 () Bool)

(assert (=> b!612897 m!589525))

(declare-fun m!589527 () Bool)

(assert (=> b!612897 m!589527))

(declare-fun m!589529 () Bool)

(assert (=> b!612897 m!589529))

(declare-fun m!589531 () Bool)

(assert (=> b!612896 m!589531))

(declare-fun m!589533 () Bool)

(assert (=> b!612910 m!589533))

(assert (=> b!612908 m!589493))

(assert (=> b!612904 m!589493))

(declare-fun m!589535 () Bool)

(assert (=> b!612904 m!589535))

(declare-fun m!589537 () Bool)

(assert (=> b!612904 m!589537))

(assert (=> b!612904 m!589493))

(declare-fun m!589539 () Bool)

(assert (=> b!612904 m!589539))

(declare-fun m!589541 () Bool)

(assert (=> b!612904 m!589541))

(declare-fun m!589543 () Bool)

(assert (=> b!612904 m!589543))

(assert (=> b!612904 m!589493))

(assert (=> b!612904 m!589493))

(declare-fun m!589545 () Bool)

(assert (=> b!612904 m!589545))

(declare-fun m!589547 () Bool)

(assert (=> b!612904 m!589547))

(declare-fun m!589549 () Bool)

(assert (=> b!612907 m!589549))

(declare-fun m!589551 () Bool)

(assert (=> b!612916 m!589551))

(declare-fun m!589553 () Bool)

(assert (=> b!612901 m!589553))

(declare-fun m!589555 () Bool)

(assert (=> b!612909 m!589555))

(assert (=> b!612893 m!589493))

(assert (=> b!612893 m!589493))

(assert (=> b!612893 m!589513))

(declare-fun m!589557 () Bool)

(assert (=> b!612893 m!589557))

(assert (=> b!612893 m!589547))

(assert (=> b!612893 m!589493))

(declare-fun m!589559 () Bool)

(assert (=> b!612893 m!589559))

(declare-fun m!589561 () Bool)

(assert (=> b!612893 m!589561))

(assert (=> b!612893 m!589493))

(declare-fun m!589563 () Bool)

(assert (=> b!612893 m!589563))

(assert (=> b!612893 m!589541))

(assert (=> b!612891 m!589493))

(assert (=> b!612891 m!589493))

(assert (=> b!612891 m!589495))

(assert (=> b!612892 m!589493))

(assert (=> b!612892 m!589493))

(declare-fun m!589565 () Bool)

(assert (=> b!612892 m!589565))

(check-sat (not b!612897) (not b!612901) (not b!612904) (not b!612899) (not b!612913) (not b!612896) (not b!612891) (not b!612895) (not b!612892) (not b!612907) (not b!612893) (not start!55980) (not b!612898) (not b!612915) (not b!612909) (not b!612906) (not b!612916))
(check-sat)
