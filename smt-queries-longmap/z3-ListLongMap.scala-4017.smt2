; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54648 () Bool)

(assert start!54648)

(declare-fun b!597466 () Bool)

(declare-fun e!341413 () Bool)

(declare-fun e!341416 () Bool)

(assert (=> b!597466 (= e!341413 (not e!341416))))

(declare-fun res!382987 () Bool)

(assert (=> b!597466 (=> res!382987 e!341416)))

(declare-datatypes ((SeekEntryResult!6222 0))(
  ( (MissingZero!6222 (index!27139 (_ BitVec 32))) (Found!6222 (index!27140 (_ BitVec 32))) (Intermediate!6222 (undefined!7034 Bool) (index!27141 (_ BitVec 32)) (x!55939 (_ BitVec 32))) (Undefined!6222) (MissingVacant!6222 (index!27142 (_ BitVec 32))) )
))
(declare-fun lt!271443 () SeekEntryResult!6222)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!597466 (= res!382987 (not (= lt!271443 (Found!6222 index!984))))))

(declare-datatypes ((Unit!18806 0))(
  ( (Unit!18807) )
))
(declare-fun lt!271438 () Unit!18806)

(declare-fun e!341420 () Unit!18806)

(assert (=> b!597466 (= lt!271438 e!341420)))

(declare-fun c!67610 () Bool)

(assert (=> b!597466 (= c!67610 (= lt!271443 Undefined!6222))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!37039 0))(
  ( (array!37040 (arr!17782 (Array (_ BitVec 32) (_ BitVec 64))) (size!18146 (_ BitVec 32))) )
))
(declare-fun lt!271441 () array!37039)

(declare-fun lt!271440 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37039 (_ BitVec 32)) SeekEntryResult!6222)

(assert (=> b!597466 (= lt!271443 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271440 lt!271441 mask!3053))))

(declare-fun e!341421 () Bool)

(assert (=> b!597466 e!341421))

(declare-fun res!382991 () Bool)

(assert (=> b!597466 (=> (not res!382991) (not e!341421))))

(declare-fun lt!271436 () (_ BitVec 32))

(declare-fun lt!271439 () SeekEntryResult!6222)

(assert (=> b!597466 (= res!382991 (= lt!271439 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271436 vacantSpotIndex!68 lt!271440 lt!271441 mask!3053)))))

(declare-fun a!2986 () array!37039)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!597466 (= lt!271439 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271436 vacantSpotIndex!68 (select (arr!17782 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!597466 (= lt!271440 (select (store (arr!17782 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!271447 () Unit!18806)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37039 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18806)

(assert (=> b!597466 (= lt!271447 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271436 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!597466 (= lt!271436 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!597467 () Bool)

(declare-fun e!341414 () Bool)

(declare-fun e!341415 () Bool)

(assert (=> b!597467 (= e!341414 e!341415)))

(declare-fun res!382980 () Bool)

(assert (=> b!597467 (=> (not res!382980) (not e!341415))))

(assert (=> b!597467 (= res!382980 (= (select (store (arr!17782 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597467 (= lt!271441 (array!37040 (store (arr!17782 a!2986) i!1108 k0!1786) (size!18146 a!2986)))))

(declare-fun b!597468 () Bool)

(declare-fun res!382990 () Bool)

(declare-fun e!341412 () Bool)

(assert (=> b!597468 (=> (not res!382990) (not e!341412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!597468 (= res!382990 (validKeyInArray!0 (select (arr!17782 a!2986) j!136)))))

(declare-fun b!597469 () Bool)

(declare-fun res!382988 () Bool)

(assert (=> b!597469 (=> (not res!382988) (not e!341414))))

(assert (=> b!597469 (= res!382988 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17782 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!382992 () Bool)

(assert (=> start!54648 (=> (not res!382992) (not e!341412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54648 (= res!382992 (validMask!0 mask!3053))))

(assert (=> start!54648 e!341412))

(assert (=> start!54648 true))

(declare-fun array_inv!13578 (array!37039) Bool)

(assert (=> start!54648 (array_inv!13578 a!2986)))

(declare-fun b!597470 () Bool)

(declare-fun Unit!18808 () Unit!18806)

(assert (=> b!597470 (= e!341420 Unit!18808)))

(assert (=> b!597470 false))

(declare-fun b!597471 () Bool)

(assert (=> b!597471 (= e!341415 e!341413)))

(declare-fun res!382981 () Bool)

(assert (=> b!597471 (=> (not res!382981) (not e!341413))))

(declare-fun lt!271445 () SeekEntryResult!6222)

(assert (=> b!597471 (= res!382981 (and (= lt!271445 (Found!6222 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17782 a!2986) index!984) (select (arr!17782 a!2986) j!136))) (not (= (select (arr!17782 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!597471 (= lt!271445 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17782 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597472 () Bool)

(assert (=> b!597472 (= e!341421 (= lt!271445 lt!271439))))

(declare-fun b!597473 () Bool)

(declare-fun Unit!18809 () Unit!18806)

(assert (=> b!597473 (= e!341420 Unit!18809)))

(declare-fun b!597474 () Bool)

(assert (=> b!597474 (= e!341412 e!341414)))

(declare-fun res!382985 () Bool)

(assert (=> b!597474 (=> (not res!382985) (not e!341414))))

(declare-fun lt!271442 () SeekEntryResult!6222)

(assert (=> b!597474 (= res!382985 (or (= lt!271442 (MissingZero!6222 i!1108)) (= lt!271442 (MissingVacant!6222 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37039 (_ BitVec 32)) SeekEntryResult!6222)

(assert (=> b!597474 (= lt!271442 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!597475 () Bool)

(declare-fun res!382993 () Bool)

(assert (=> b!597475 (=> (not res!382993) (not e!341414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37039 (_ BitVec 32)) Bool)

(assert (=> b!597475 (= res!382993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun e!341418 () Bool)

(declare-fun b!597476 () Bool)

(declare-fun arrayContainsKey!0 (array!37039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!597476 (= e!341418 (arrayContainsKey!0 lt!271441 (select (arr!17782 a!2986) j!136) index!984))))

(declare-fun b!597477 () Bool)

(declare-fun e!341424 () Bool)

(declare-fun e!341419 () Bool)

(assert (=> b!597477 (= e!341424 e!341419)))

(declare-fun res!382997 () Bool)

(assert (=> b!597477 (=> res!382997 e!341419)))

(declare-fun lt!271437 () (_ BitVec 64))

(assert (=> b!597477 (= res!382997 (or (not (= (select (arr!17782 a!2986) j!136) lt!271440)) (not (= (select (arr!17782 a!2986) j!136) lt!271437)) (bvsge j!136 index!984)))))

(declare-fun b!597478 () Bool)

(declare-fun res!382983 () Bool)

(assert (=> b!597478 (=> (not res!382983) (not e!341412))))

(assert (=> b!597478 (= res!382983 (and (= (size!18146 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18146 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18146 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!597479 () Bool)

(declare-fun res!382994 () Bool)

(assert (=> b!597479 (=> (not res!382994) (not e!341414))))

(declare-datatypes ((List!11823 0))(
  ( (Nil!11820) (Cons!11819 (h!12864 (_ BitVec 64)) (t!18051 List!11823)) )
))
(declare-fun arrayNoDuplicates!0 (array!37039 (_ BitVec 32) List!11823) Bool)

(assert (=> b!597479 (= res!382994 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11820))))

(declare-fun b!597480 () Bool)

(declare-fun e!341423 () Bool)

(declare-fun noDuplicate!271 (List!11823) Bool)

(assert (=> b!597480 (= e!341423 (noDuplicate!271 Nil!11820))))

(declare-fun b!597481 () Bool)

(declare-fun e!341417 () Bool)

(assert (=> b!597481 (= e!341417 e!341423)))

(declare-fun res!382982 () Bool)

(assert (=> b!597481 (=> res!382982 e!341423)))

(assert (=> b!597481 (= res!382982 (or (bvsgt #b00000000000000000000000000000000 (size!18146 a!2986)) (bvsge (size!18146 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!597481 (arrayNoDuplicates!0 lt!271441 #b00000000000000000000000000000000 Nil!11820)))

(declare-fun lt!271446 () Unit!18806)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37039 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11823) Unit!18806)

(assert (=> b!597481 (= lt!271446 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11820))))

(assert (=> b!597481 (arrayContainsKey!0 lt!271441 (select (arr!17782 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271444 () Unit!18806)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37039 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18806)

(assert (=> b!597481 (= lt!271444 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271441 (select (arr!17782 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!597482 () Bool)

(declare-fun res!382995 () Bool)

(assert (=> b!597482 (=> (not res!382995) (not e!341412))))

(assert (=> b!597482 (= res!382995 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!597483 () Bool)

(assert (=> b!597483 (= e!341416 e!341417)))

(declare-fun res!382986 () Bool)

(assert (=> b!597483 (=> res!382986 e!341417)))

(assert (=> b!597483 (= res!382986 (or (not (= (select (arr!17782 a!2986) j!136) lt!271440)) (not (= (select (arr!17782 a!2986) j!136) lt!271437)) (bvsge j!136 index!984)))))

(assert (=> b!597483 e!341424))

(declare-fun res!382989 () Bool)

(assert (=> b!597483 (=> (not res!382989) (not e!341424))))

(assert (=> b!597483 (= res!382989 (= lt!271437 (select (arr!17782 a!2986) j!136)))))

(assert (=> b!597483 (= lt!271437 (select (store (arr!17782 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!597484 () Bool)

(declare-fun res!382996 () Bool)

(assert (=> b!597484 (=> (not res!382996) (not e!341412))))

(assert (=> b!597484 (= res!382996 (validKeyInArray!0 k0!1786))))

(declare-fun b!597485 () Bool)

(assert (=> b!597485 (= e!341419 e!341418)))

(declare-fun res!382984 () Bool)

(assert (=> b!597485 (=> (not res!382984) (not e!341418))))

(assert (=> b!597485 (= res!382984 (arrayContainsKey!0 lt!271441 (select (arr!17782 a!2986) j!136) j!136))))

(assert (= (and start!54648 res!382992) b!597478))

(assert (= (and b!597478 res!382983) b!597468))

(assert (= (and b!597468 res!382990) b!597484))

(assert (= (and b!597484 res!382996) b!597482))

(assert (= (and b!597482 res!382995) b!597474))

(assert (= (and b!597474 res!382985) b!597475))

(assert (= (and b!597475 res!382993) b!597479))

(assert (= (and b!597479 res!382994) b!597469))

(assert (= (and b!597469 res!382988) b!597467))

(assert (= (and b!597467 res!382980) b!597471))

(assert (= (and b!597471 res!382981) b!597466))

(assert (= (and b!597466 res!382991) b!597472))

(assert (= (and b!597466 c!67610) b!597470))

(assert (= (and b!597466 (not c!67610)) b!597473))

(assert (= (and b!597466 (not res!382987)) b!597483))

(assert (= (and b!597483 res!382989) b!597477))

(assert (= (and b!597477 (not res!382997)) b!597485))

(assert (= (and b!597485 res!382984) b!597476))

(assert (= (and b!597483 (not res!382986)) b!597481))

(assert (= (and b!597481 (not res!382982)) b!597480))

(declare-fun m!574861 () Bool)

(assert (=> b!597481 m!574861))

(declare-fun m!574863 () Bool)

(assert (=> b!597481 m!574863))

(assert (=> b!597481 m!574863))

(declare-fun m!574865 () Bool)

(assert (=> b!597481 m!574865))

(assert (=> b!597481 m!574863))

(declare-fun m!574867 () Bool)

(assert (=> b!597481 m!574867))

(declare-fun m!574869 () Bool)

(assert (=> b!597481 m!574869))

(assert (=> b!597468 m!574863))

(assert (=> b!597468 m!574863))

(declare-fun m!574871 () Bool)

(assert (=> b!597468 m!574871))

(declare-fun m!574873 () Bool)

(assert (=> b!597474 m!574873))

(declare-fun m!574875 () Bool)

(assert (=> b!597466 m!574875))

(declare-fun m!574877 () Bool)

(assert (=> b!597466 m!574877))

(assert (=> b!597466 m!574863))

(declare-fun m!574879 () Bool)

(assert (=> b!597466 m!574879))

(declare-fun m!574881 () Bool)

(assert (=> b!597466 m!574881))

(assert (=> b!597466 m!574863))

(declare-fun m!574883 () Bool)

(assert (=> b!597466 m!574883))

(declare-fun m!574885 () Bool)

(assert (=> b!597466 m!574885))

(declare-fun m!574887 () Bool)

(assert (=> b!597466 m!574887))

(assert (=> b!597467 m!574879))

(declare-fun m!574889 () Bool)

(assert (=> b!597467 m!574889))

(assert (=> b!597483 m!574863))

(assert (=> b!597483 m!574879))

(declare-fun m!574891 () Bool)

(assert (=> b!597483 m!574891))

(declare-fun m!574893 () Bool)

(assert (=> b!597475 m!574893))

(declare-fun m!574895 () Bool)

(assert (=> b!597482 m!574895))

(declare-fun m!574897 () Bool)

(assert (=> b!597469 m!574897))

(assert (=> b!597477 m!574863))

(declare-fun m!574899 () Bool)

(assert (=> start!54648 m!574899))

(declare-fun m!574901 () Bool)

(assert (=> start!54648 m!574901))

(assert (=> b!597485 m!574863))

(assert (=> b!597485 m!574863))

(declare-fun m!574903 () Bool)

(assert (=> b!597485 m!574903))

(declare-fun m!574905 () Bool)

(assert (=> b!597484 m!574905))

(declare-fun m!574907 () Bool)

(assert (=> b!597480 m!574907))

(declare-fun m!574909 () Bool)

(assert (=> b!597471 m!574909))

(assert (=> b!597471 m!574863))

(assert (=> b!597471 m!574863))

(declare-fun m!574911 () Bool)

(assert (=> b!597471 m!574911))

(declare-fun m!574913 () Bool)

(assert (=> b!597479 m!574913))

(assert (=> b!597476 m!574863))

(assert (=> b!597476 m!574863))

(declare-fun m!574915 () Bool)

(assert (=> b!597476 m!574915))

(check-sat (not b!597476) (not b!597466) (not b!597468) (not start!54648) (not b!597480) (not b!597481) (not b!597484) (not b!597471) (not b!597479) (not b!597474) (not b!597482) (not b!597485) (not b!597475))
(check-sat)
(get-model)

(declare-fun b!597556 () Bool)

(declare-fun e!341473 () Bool)

(declare-fun call!32927 () Bool)

(assert (=> b!597556 (= e!341473 call!32927)))

(declare-fun b!597557 () Bool)

(declare-fun e!341475 () Bool)

(declare-fun contains!2954 (List!11823 (_ BitVec 64)) Bool)

(assert (=> b!597557 (= e!341475 (contains!2954 Nil!11820 (select (arr!17782 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597558 () Bool)

(declare-fun e!341474 () Bool)

(declare-fun e!341472 () Bool)

(assert (=> b!597558 (= e!341474 e!341472)))

(declare-fun res!383058 () Bool)

(assert (=> b!597558 (=> (not res!383058) (not e!341472))))

(assert (=> b!597558 (= res!383058 (not e!341475))))

(declare-fun res!383060 () Bool)

(assert (=> b!597558 (=> (not res!383060) (not e!341475))))

(assert (=> b!597558 (= res!383060 (validKeyInArray!0 (select (arr!17782 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32924 () Bool)

(declare-fun c!67616 () Bool)

(assert (=> bm!32924 (= call!32927 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67616 (Cons!11819 (select (arr!17782 a!2986) #b00000000000000000000000000000000) Nil!11820) Nil!11820)))))

(declare-fun d!86837 () Bool)

(declare-fun res!383059 () Bool)

(assert (=> d!86837 (=> res!383059 e!341474)))

(assert (=> d!86837 (= res!383059 (bvsge #b00000000000000000000000000000000 (size!18146 a!2986)))))

(assert (=> d!86837 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11820) e!341474)))

(declare-fun b!597559 () Bool)

(assert (=> b!597559 (= e!341472 e!341473)))

(assert (=> b!597559 (= c!67616 (validKeyInArray!0 (select (arr!17782 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597560 () Bool)

(assert (=> b!597560 (= e!341473 call!32927)))

(assert (= (and d!86837 (not res!383059)) b!597558))

(assert (= (and b!597558 res!383060) b!597557))

(assert (= (and b!597558 res!383058) b!597559))

(assert (= (and b!597559 c!67616) b!597556))

(assert (= (and b!597559 (not c!67616)) b!597560))

(assert (= (or b!597556 b!597560) bm!32924))

(declare-fun m!574973 () Bool)

(assert (=> b!597557 m!574973))

(assert (=> b!597557 m!574973))

(declare-fun m!574975 () Bool)

(assert (=> b!597557 m!574975))

(assert (=> b!597558 m!574973))

(assert (=> b!597558 m!574973))

(declare-fun m!574977 () Bool)

(assert (=> b!597558 m!574977))

(assert (=> bm!32924 m!574973))

(declare-fun m!574979 () Bool)

(assert (=> bm!32924 m!574979))

(assert (=> b!597559 m!574973))

(assert (=> b!597559 m!574973))

(assert (=> b!597559 m!574977))

(assert (=> b!597479 d!86837))

(declare-fun d!86839 () Bool)

(declare-fun res!383065 () Bool)

(declare-fun e!341480 () Bool)

(assert (=> d!86839 (=> res!383065 e!341480)))

(get-info :version)

(assert (=> d!86839 (= res!383065 ((_ is Nil!11820) Nil!11820))))

(assert (=> d!86839 (= (noDuplicate!271 Nil!11820) e!341480)))

(declare-fun b!597565 () Bool)

(declare-fun e!341481 () Bool)

(assert (=> b!597565 (= e!341480 e!341481)))

(declare-fun res!383066 () Bool)

(assert (=> b!597565 (=> (not res!383066) (not e!341481))))

(assert (=> b!597565 (= res!383066 (not (contains!2954 (t!18051 Nil!11820) (h!12864 Nil!11820))))))

(declare-fun b!597566 () Bool)

(assert (=> b!597566 (= e!341481 (noDuplicate!271 (t!18051 Nil!11820)))))

(assert (= (and d!86839 (not res!383065)) b!597565))

(assert (= (and b!597565 res!383066) b!597566))

(declare-fun m!574981 () Bool)

(assert (=> b!597565 m!574981))

(declare-fun m!574983 () Bool)

(assert (=> b!597566 m!574983))

(assert (=> b!597480 d!86839))

(declare-fun d!86841 () Bool)

(assert (=> d!86841 (= (validKeyInArray!0 (select (arr!17782 a!2986) j!136)) (and (not (= (select (arr!17782 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17782 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597468 d!86841))

(declare-fun b!597579 () Bool)

(declare-fun e!341488 () SeekEntryResult!6222)

(assert (=> b!597579 (= e!341488 (MissingVacant!6222 vacantSpotIndex!68))))

(declare-fun lt!271488 () SeekEntryResult!6222)

(declare-fun d!86843 () Bool)

(assert (=> d!86843 (and (or ((_ is Undefined!6222) lt!271488) (not ((_ is Found!6222) lt!271488)) (and (bvsge (index!27140 lt!271488) #b00000000000000000000000000000000) (bvslt (index!27140 lt!271488) (size!18146 lt!271441)))) (or ((_ is Undefined!6222) lt!271488) ((_ is Found!6222) lt!271488) (not ((_ is MissingVacant!6222) lt!271488)) (not (= (index!27142 lt!271488) vacantSpotIndex!68)) (and (bvsge (index!27142 lt!271488) #b00000000000000000000000000000000) (bvslt (index!27142 lt!271488) (size!18146 lt!271441)))) (or ((_ is Undefined!6222) lt!271488) (ite ((_ is Found!6222) lt!271488) (= (select (arr!17782 lt!271441) (index!27140 lt!271488)) lt!271440) (and ((_ is MissingVacant!6222) lt!271488) (= (index!27142 lt!271488) vacantSpotIndex!68) (= (select (arr!17782 lt!271441) (index!27142 lt!271488)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341490 () SeekEntryResult!6222)

(assert (=> d!86843 (= lt!271488 e!341490)))

(declare-fun c!67623 () Bool)

(assert (=> d!86843 (= c!67623 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!271489 () (_ BitVec 64))

(assert (=> d!86843 (= lt!271489 (select (arr!17782 lt!271441) lt!271436))))

(assert (=> d!86843 (validMask!0 mask!3053)))

(assert (=> d!86843 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271436 vacantSpotIndex!68 lt!271440 lt!271441 mask!3053) lt!271488)))

(declare-fun b!597580 () Bool)

(declare-fun e!341489 () SeekEntryResult!6222)

(assert (=> b!597580 (= e!341489 (Found!6222 lt!271436))))

(declare-fun b!597581 () Bool)

(assert (=> b!597581 (= e!341488 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271436 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!271440 lt!271441 mask!3053))))

(declare-fun b!597582 () Bool)

(declare-fun c!67625 () Bool)

(assert (=> b!597582 (= c!67625 (= lt!271489 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597582 (= e!341489 e!341488)))

(declare-fun b!597583 () Bool)

(assert (=> b!597583 (= e!341490 Undefined!6222)))

(declare-fun b!597584 () Bool)

(assert (=> b!597584 (= e!341490 e!341489)))

(declare-fun c!67624 () Bool)

(assert (=> b!597584 (= c!67624 (= lt!271489 lt!271440))))

(assert (= (and d!86843 c!67623) b!597583))

(assert (= (and d!86843 (not c!67623)) b!597584))

(assert (= (and b!597584 c!67624) b!597580))

(assert (= (and b!597584 (not c!67624)) b!597582))

(assert (= (and b!597582 c!67625) b!597579))

(assert (= (and b!597582 (not c!67625)) b!597581))

(declare-fun m!574985 () Bool)

(assert (=> d!86843 m!574985))

(declare-fun m!574987 () Bool)

(assert (=> d!86843 m!574987))

(declare-fun m!574989 () Bool)

(assert (=> d!86843 m!574989))

(assert (=> d!86843 m!574899))

(declare-fun m!574991 () Bool)

(assert (=> b!597581 m!574991))

(assert (=> b!597581 m!574991))

(declare-fun m!574993 () Bool)

(assert (=> b!597581 m!574993))

(assert (=> b!597466 d!86843))

(declare-fun d!86845 () Bool)

(declare-fun lt!271492 () (_ BitVec 32))

(assert (=> d!86845 (and (bvsge lt!271492 #b00000000000000000000000000000000) (bvslt lt!271492 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86845 (= lt!271492 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86845 (validMask!0 mask!3053)))

(assert (=> d!86845 (= (nextIndex!0 index!984 x!910 mask!3053) lt!271492)))

(declare-fun bs!18373 () Bool)

(assert (= bs!18373 d!86845))

(declare-fun m!574995 () Bool)

(assert (=> bs!18373 m!574995))

(assert (=> bs!18373 m!574899))

(assert (=> b!597466 d!86845))

(declare-fun b!597585 () Bool)

(declare-fun e!341491 () SeekEntryResult!6222)

(assert (=> b!597585 (= e!341491 (MissingVacant!6222 vacantSpotIndex!68))))

(declare-fun lt!271493 () SeekEntryResult!6222)

(declare-fun d!86847 () Bool)

(assert (=> d!86847 (and (or ((_ is Undefined!6222) lt!271493) (not ((_ is Found!6222) lt!271493)) (and (bvsge (index!27140 lt!271493) #b00000000000000000000000000000000) (bvslt (index!27140 lt!271493) (size!18146 lt!271441)))) (or ((_ is Undefined!6222) lt!271493) ((_ is Found!6222) lt!271493) (not ((_ is MissingVacant!6222) lt!271493)) (not (= (index!27142 lt!271493) vacantSpotIndex!68)) (and (bvsge (index!27142 lt!271493) #b00000000000000000000000000000000) (bvslt (index!27142 lt!271493) (size!18146 lt!271441)))) (or ((_ is Undefined!6222) lt!271493) (ite ((_ is Found!6222) lt!271493) (= (select (arr!17782 lt!271441) (index!27140 lt!271493)) lt!271440) (and ((_ is MissingVacant!6222) lt!271493) (= (index!27142 lt!271493) vacantSpotIndex!68) (= (select (arr!17782 lt!271441) (index!27142 lt!271493)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341493 () SeekEntryResult!6222)

(assert (=> d!86847 (= lt!271493 e!341493)))

(declare-fun c!67626 () Bool)

(assert (=> d!86847 (= c!67626 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!271494 () (_ BitVec 64))

(assert (=> d!86847 (= lt!271494 (select (arr!17782 lt!271441) index!984))))

(assert (=> d!86847 (validMask!0 mask!3053)))

(assert (=> d!86847 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271440 lt!271441 mask!3053) lt!271493)))

(declare-fun b!597586 () Bool)

(declare-fun e!341492 () SeekEntryResult!6222)

(assert (=> b!597586 (= e!341492 (Found!6222 index!984))))

(declare-fun b!597587 () Bool)

(assert (=> b!597587 (= e!341491 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!271440 lt!271441 mask!3053))))

(declare-fun b!597588 () Bool)

(declare-fun c!67628 () Bool)

(assert (=> b!597588 (= c!67628 (= lt!271494 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597588 (= e!341492 e!341491)))

(declare-fun b!597589 () Bool)

(assert (=> b!597589 (= e!341493 Undefined!6222)))

(declare-fun b!597590 () Bool)

(assert (=> b!597590 (= e!341493 e!341492)))

(declare-fun c!67627 () Bool)

(assert (=> b!597590 (= c!67627 (= lt!271494 lt!271440))))

(assert (= (and d!86847 c!67626) b!597589))

(assert (= (and d!86847 (not c!67626)) b!597590))

(assert (= (and b!597590 c!67627) b!597586))

(assert (= (and b!597590 (not c!67627)) b!597588))

(assert (= (and b!597588 c!67628) b!597585))

(assert (= (and b!597588 (not c!67628)) b!597587))

(declare-fun m!574997 () Bool)

(assert (=> d!86847 m!574997))

(declare-fun m!574999 () Bool)

(assert (=> d!86847 m!574999))

(declare-fun m!575001 () Bool)

(assert (=> d!86847 m!575001))

(assert (=> d!86847 m!574899))

(assert (=> b!597587 m!574875))

(assert (=> b!597587 m!574875))

(declare-fun m!575003 () Bool)

(assert (=> b!597587 m!575003))

(assert (=> b!597466 d!86847))

(declare-fun d!86849 () Bool)

(declare-fun e!341510 () Bool)

(assert (=> d!86849 e!341510))

(declare-fun res!383081 () Bool)

(assert (=> d!86849 (=> (not res!383081) (not e!341510))))

(assert (=> d!86849 (= res!383081 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18146 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18146 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18146 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18146 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18146 a!2986))))))

(declare-fun lt!271497 () Unit!18806)

(declare-fun choose!9 (array!37039 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18806)

(assert (=> d!86849 (= lt!271497 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271436 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86849 (validMask!0 mask!3053)))

(assert (=> d!86849 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271436 vacantSpotIndex!68 mask!3053) lt!271497)))

(declare-fun b!597609 () Bool)

(assert (=> b!597609 (= e!341510 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271436 vacantSpotIndex!68 (select (arr!17782 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271436 vacantSpotIndex!68 (select (store (arr!17782 a!2986) i!1108 k0!1786) j!136) (array!37040 (store (arr!17782 a!2986) i!1108 k0!1786) (size!18146 a!2986)) mask!3053)))))

(assert (= (and d!86849 res!383081) b!597609))

(declare-fun m!575009 () Bool)

(assert (=> d!86849 m!575009))

(assert (=> d!86849 m!574899))

(assert (=> b!597609 m!574879))

(assert (=> b!597609 m!574863))

(assert (=> b!597609 m!574863))

(assert (=> b!597609 m!574883))

(assert (=> b!597609 m!574877))

(declare-fun m!575011 () Bool)

(assert (=> b!597609 m!575011))

(assert (=> b!597609 m!574877))

(assert (=> b!597466 d!86849))

(declare-fun b!597615 () Bool)

(declare-fun e!341515 () SeekEntryResult!6222)

(assert (=> b!597615 (= e!341515 (MissingVacant!6222 vacantSpotIndex!68))))

(declare-fun lt!271498 () SeekEntryResult!6222)

(declare-fun d!86859 () Bool)

(assert (=> d!86859 (and (or ((_ is Undefined!6222) lt!271498) (not ((_ is Found!6222) lt!271498)) (and (bvsge (index!27140 lt!271498) #b00000000000000000000000000000000) (bvslt (index!27140 lt!271498) (size!18146 a!2986)))) (or ((_ is Undefined!6222) lt!271498) ((_ is Found!6222) lt!271498) (not ((_ is MissingVacant!6222) lt!271498)) (not (= (index!27142 lt!271498) vacantSpotIndex!68)) (and (bvsge (index!27142 lt!271498) #b00000000000000000000000000000000) (bvslt (index!27142 lt!271498) (size!18146 a!2986)))) (or ((_ is Undefined!6222) lt!271498) (ite ((_ is Found!6222) lt!271498) (= (select (arr!17782 a!2986) (index!27140 lt!271498)) (select (arr!17782 a!2986) j!136)) (and ((_ is MissingVacant!6222) lt!271498) (= (index!27142 lt!271498) vacantSpotIndex!68) (= (select (arr!17782 a!2986) (index!27142 lt!271498)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341517 () SeekEntryResult!6222)

(assert (=> d!86859 (= lt!271498 e!341517)))

(declare-fun c!67632 () Bool)

(assert (=> d!86859 (= c!67632 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!271499 () (_ BitVec 64))

(assert (=> d!86859 (= lt!271499 (select (arr!17782 a!2986) lt!271436))))

(assert (=> d!86859 (validMask!0 mask!3053)))

(assert (=> d!86859 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271436 vacantSpotIndex!68 (select (arr!17782 a!2986) j!136) a!2986 mask!3053) lt!271498)))

(declare-fun b!597616 () Bool)

(declare-fun e!341516 () SeekEntryResult!6222)

(assert (=> b!597616 (= e!341516 (Found!6222 lt!271436))))

(declare-fun b!597617 () Bool)

(assert (=> b!597617 (= e!341515 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271436 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17782 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597618 () Bool)

(declare-fun c!67634 () Bool)

(assert (=> b!597618 (= c!67634 (= lt!271499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597618 (= e!341516 e!341515)))

(declare-fun b!597619 () Bool)

(assert (=> b!597619 (= e!341517 Undefined!6222)))

(declare-fun b!597620 () Bool)

(assert (=> b!597620 (= e!341517 e!341516)))

(declare-fun c!67633 () Bool)

(assert (=> b!597620 (= c!67633 (= lt!271499 (select (arr!17782 a!2986) j!136)))))

(assert (= (and d!86859 c!67632) b!597619))

(assert (= (and d!86859 (not c!67632)) b!597620))

(assert (= (and b!597620 c!67633) b!597616))

(assert (= (and b!597620 (not c!67633)) b!597618))

(assert (= (and b!597618 c!67634) b!597615))

(assert (= (and b!597618 (not c!67634)) b!597617))

(declare-fun m!575019 () Bool)

(assert (=> d!86859 m!575019))

(declare-fun m!575023 () Bool)

(assert (=> d!86859 m!575023))

(declare-fun m!575025 () Bool)

(assert (=> d!86859 m!575025))

(assert (=> d!86859 m!574899))

(assert (=> b!597617 m!574991))

(assert (=> b!597617 m!574991))

(assert (=> b!597617 m!574863))

(declare-fun m!575027 () Bool)

(assert (=> b!597617 m!575027))

(assert (=> b!597466 d!86859))

(declare-fun b!597647 () Bool)

(declare-fun e!341535 () Bool)

(declare-fun call!32933 () Bool)

(assert (=> b!597647 (= e!341535 call!32933)))

(declare-fun bm!32930 () Bool)

(assert (=> bm!32930 (= call!32933 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!597648 () Bool)

(declare-fun e!341534 () Bool)

(assert (=> b!597648 (= e!341535 e!341534)))

(declare-fun lt!271512 () (_ BitVec 64))

(assert (=> b!597648 (= lt!271512 (select (arr!17782 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!271514 () Unit!18806)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37039 (_ BitVec 64) (_ BitVec 32)) Unit!18806)

(assert (=> b!597648 (= lt!271514 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!271512 #b00000000000000000000000000000000))))

(assert (=> b!597648 (arrayContainsKey!0 a!2986 lt!271512 #b00000000000000000000000000000000)))

(declare-fun lt!271513 () Unit!18806)

(assert (=> b!597648 (= lt!271513 lt!271514)))

(declare-fun res!383089 () Bool)

(assert (=> b!597648 (= res!383089 (= (seekEntryOrOpen!0 (select (arr!17782 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6222 #b00000000000000000000000000000000)))))

(assert (=> b!597648 (=> (not res!383089) (not e!341534))))

(declare-fun b!597649 () Bool)

(assert (=> b!597649 (= e!341534 call!32933)))

(declare-fun d!86863 () Bool)

(declare-fun res!383090 () Bool)

(declare-fun e!341533 () Bool)

(assert (=> d!86863 (=> res!383090 e!341533)))

(assert (=> d!86863 (= res!383090 (bvsge #b00000000000000000000000000000000 (size!18146 a!2986)))))

(assert (=> d!86863 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!341533)))

(declare-fun b!597650 () Bool)

(assert (=> b!597650 (= e!341533 e!341535)))

(declare-fun c!67646 () Bool)

(assert (=> b!597650 (= c!67646 (validKeyInArray!0 (select (arr!17782 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!86863 (not res!383090)) b!597650))

(assert (= (and b!597650 c!67646) b!597648))

(assert (= (and b!597650 (not c!67646)) b!597647))

(assert (= (and b!597648 res!383089) b!597649))

(assert (= (or b!597649 b!597647) bm!32930))

(declare-fun m!575035 () Bool)

(assert (=> bm!32930 m!575035))

(assert (=> b!597648 m!574973))

(declare-fun m!575037 () Bool)

(assert (=> b!597648 m!575037))

(declare-fun m!575039 () Bool)

(assert (=> b!597648 m!575039))

(assert (=> b!597648 m!574973))

(declare-fun m!575041 () Bool)

(assert (=> b!597648 m!575041))

(assert (=> b!597650 m!574973))

(assert (=> b!597650 m!574973))

(assert (=> b!597650 m!574977))

(assert (=> b!597475 d!86863))

(declare-fun d!86869 () Bool)

(declare-fun res!383095 () Bool)

(declare-fun e!341540 () Bool)

(assert (=> d!86869 (=> res!383095 e!341540)))

(assert (=> d!86869 (= res!383095 (= (select (arr!17782 lt!271441) index!984) (select (arr!17782 a!2986) j!136)))))

(assert (=> d!86869 (= (arrayContainsKey!0 lt!271441 (select (arr!17782 a!2986) j!136) index!984) e!341540)))

(declare-fun b!597655 () Bool)

(declare-fun e!341541 () Bool)

(assert (=> b!597655 (= e!341540 e!341541)))

(declare-fun res!383096 () Bool)

(assert (=> b!597655 (=> (not res!383096) (not e!341541))))

(assert (=> b!597655 (= res!383096 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18146 lt!271441)))))

(declare-fun b!597656 () Bool)

(assert (=> b!597656 (= e!341541 (arrayContainsKey!0 lt!271441 (select (arr!17782 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86869 (not res!383095)) b!597655))

(assert (= (and b!597655 res!383096) b!597656))

(assert (=> d!86869 m!575001))

(assert (=> b!597656 m!574863))

(declare-fun m!575043 () Bool)

(assert (=> b!597656 m!575043))

(assert (=> b!597476 d!86869))

(declare-fun d!86871 () Bool)

(assert (=> d!86871 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54648 d!86871))

(declare-fun d!86875 () Bool)

(assert (=> d!86875 (= (array_inv!13578 a!2986) (bvsge (size!18146 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54648 d!86875))

(declare-fun b!597743 () Bool)

(declare-fun e!341594 () SeekEntryResult!6222)

(assert (=> b!597743 (= e!341594 Undefined!6222)))

(declare-fun b!597744 () Bool)

(declare-fun e!341592 () SeekEntryResult!6222)

(declare-fun lt!271562 () SeekEntryResult!6222)

(assert (=> b!597744 (= e!341592 (MissingZero!6222 (index!27141 lt!271562)))))

(declare-fun b!597745 () Bool)

(declare-fun c!67685 () Bool)

(declare-fun lt!271561 () (_ BitVec 64))

(assert (=> b!597745 (= c!67685 (= lt!271561 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341593 () SeekEntryResult!6222)

(assert (=> b!597745 (= e!341593 e!341592)))

(declare-fun b!597746 () Bool)

(assert (=> b!597746 (= e!341592 (seekKeyOrZeroReturnVacant!0 (x!55939 lt!271562) (index!27141 lt!271562) (index!27141 lt!271562) k0!1786 a!2986 mask!3053))))

(declare-fun b!597747 () Bool)

(assert (=> b!597747 (= e!341593 (Found!6222 (index!27141 lt!271562)))))

(declare-fun d!86877 () Bool)

(declare-fun lt!271560 () SeekEntryResult!6222)

(assert (=> d!86877 (and (or ((_ is Undefined!6222) lt!271560) (not ((_ is Found!6222) lt!271560)) (and (bvsge (index!27140 lt!271560) #b00000000000000000000000000000000) (bvslt (index!27140 lt!271560) (size!18146 a!2986)))) (or ((_ is Undefined!6222) lt!271560) ((_ is Found!6222) lt!271560) (not ((_ is MissingZero!6222) lt!271560)) (and (bvsge (index!27139 lt!271560) #b00000000000000000000000000000000) (bvslt (index!27139 lt!271560) (size!18146 a!2986)))) (or ((_ is Undefined!6222) lt!271560) ((_ is Found!6222) lt!271560) ((_ is MissingZero!6222) lt!271560) (not ((_ is MissingVacant!6222) lt!271560)) (and (bvsge (index!27142 lt!271560) #b00000000000000000000000000000000) (bvslt (index!27142 lt!271560) (size!18146 a!2986)))) (or ((_ is Undefined!6222) lt!271560) (ite ((_ is Found!6222) lt!271560) (= (select (arr!17782 a!2986) (index!27140 lt!271560)) k0!1786) (ite ((_ is MissingZero!6222) lt!271560) (= (select (arr!17782 a!2986) (index!27139 lt!271560)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6222) lt!271560) (= (select (arr!17782 a!2986) (index!27142 lt!271560)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86877 (= lt!271560 e!341594)))

(declare-fun c!67683 () Bool)

(assert (=> d!86877 (= c!67683 (and ((_ is Intermediate!6222) lt!271562) (undefined!7034 lt!271562)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37039 (_ BitVec 32)) SeekEntryResult!6222)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86877 (= lt!271562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86877 (validMask!0 mask!3053)))

(assert (=> d!86877 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!271560)))

(declare-fun b!597748 () Bool)

(assert (=> b!597748 (= e!341594 e!341593)))

(assert (=> b!597748 (= lt!271561 (select (arr!17782 a!2986) (index!27141 lt!271562)))))

(declare-fun c!67684 () Bool)

(assert (=> b!597748 (= c!67684 (= lt!271561 k0!1786))))

(assert (= (and d!86877 c!67683) b!597743))

(assert (= (and d!86877 (not c!67683)) b!597748))

(assert (= (and b!597748 c!67684) b!597747))

(assert (= (and b!597748 (not c!67684)) b!597745))

(assert (= (and b!597745 c!67685) b!597744))

(assert (= (and b!597745 (not c!67685)) b!597746))

(declare-fun m!575107 () Bool)

(assert (=> b!597746 m!575107))

(declare-fun m!575109 () Bool)

(assert (=> d!86877 m!575109))

(declare-fun m!575111 () Bool)

(assert (=> d!86877 m!575111))

(declare-fun m!575113 () Bool)

(assert (=> d!86877 m!575113))

(assert (=> d!86877 m!575109))

(declare-fun m!575115 () Bool)

(assert (=> d!86877 m!575115))

(declare-fun m!575119 () Bool)

(assert (=> d!86877 m!575119))

(assert (=> d!86877 m!574899))

(declare-fun m!575125 () Bool)

(assert (=> b!597748 m!575125))

(assert (=> b!597474 d!86877))

(declare-fun d!86897 () Bool)

(declare-fun res!383111 () Bool)

(declare-fun e!341598 () Bool)

(assert (=> d!86897 (=> res!383111 e!341598)))

(assert (=> d!86897 (= res!383111 (= (select (arr!17782 lt!271441) j!136) (select (arr!17782 a!2986) j!136)))))

(assert (=> d!86897 (= (arrayContainsKey!0 lt!271441 (select (arr!17782 a!2986) j!136) j!136) e!341598)))

(declare-fun b!597755 () Bool)

(declare-fun e!341599 () Bool)

(assert (=> b!597755 (= e!341598 e!341599)))

(declare-fun res!383112 () Bool)

(assert (=> b!597755 (=> (not res!383112) (not e!341599))))

(assert (=> b!597755 (= res!383112 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18146 lt!271441)))))

(declare-fun b!597756 () Bool)

(assert (=> b!597756 (= e!341599 (arrayContainsKey!0 lt!271441 (select (arr!17782 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86897 (not res!383111)) b!597755))

(assert (= (and b!597755 res!383112) b!597756))

(declare-fun m!575129 () Bool)

(assert (=> d!86897 m!575129))

(assert (=> b!597756 m!574863))

(declare-fun m!575131 () Bool)

(assert (=> b!597756 m!575131))

(assert (=> b!597485 d!86897))

(declare-fun d!86901 () Bool)

(assert (=> d!86901 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597484 d!86901))

(declare-fun d!86903 () Bool)

(declare-fun res!383113 () Bool)

(declare-fun e!341603 () Bool)

(assert (=> d!86903 (=> res!383113 e!341603)))

(assert (=> d!86903 (= res!383113 (= (select (arr!17782 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86903 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!341603)))

(declare-fun b!597763 () Bool)

(declare-fun e!341604 () Bool)

(assert (=> b!597763 (= e!341603 e!341604)))

(declare-fun res!383114 () Bool)

(assert (=> b!597763 (=> (not res!383114) (not e!341604))))

(assert (=> b!597763 (= res!383114 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18146 a!2986)))))

(declare-fun b!597764 () Bool)

(assert (=> b!597764 (= e!341604 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86903 (not res!383113)) b!597763))

(assert (= (and b!597763 res!383114) b!597764))

(assert (=> d!86903 m!574973))

(declare-fun m!575137 () Bool)

(assert (=> b!597764 m!575137))

(assert (=> b!597482 d!86903))

(declare-fun b!597765 () Bool)

(declare-fun e!341605 () SeekEntryResult!6222)

(assert (=> b!597765 (= e!341605 (MissingVacant!6222 vacantSpotIndex!68))))

(declare-fun d!86905 () Bool)

(declare-fun lt!271567 () SeekEntryResult!6222)

(assert (=> d!86905 (and (or ((_ is Undefined!6222) lt!271567) (not ((_ is Found!6222) lt!271567)) (and (bvsge (index!27140 lt!271567) #b00000000000000000000000000000000) (bvslt (index!27140 lt!271567) (size!18146 a!2986)))) (or ((_ is Undefined!6222) lt!271567) ((_ is Found!6222) lt!271567) (not ((_ is MissingVacant!6222) lt!271567)) (not (= (index!27142 lt!271567) vacantSpotIndex!68)) (and (bvsge (index!27142 lt!271567) #b00000000000000000000000000000000) (bvslt (index!27142 lt!271567) (size!18146 a!2986)))) (or ((_ is Undefined!6222) lt!271567) (ite ((_ is Found!6222) lt!271567) (= (select (arr!17782 a!2986) (index!27140 lt!271567)) (select (arr!17782 a!2986) j!136)) (and ((_ is MissingVacant!6222) lt!271567) (= (index!27142 lt!271567) vacantSpotIndex!68) (= (select (arr!17782 a!2986) (index!27142 lt!271567)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341607 () SeekEntryResult!6222)

(assert (=> d!86905 (= lt!271567 e!341607)))

(declare-fun c!67692 () Bool)

(assert (=> d!86905 (= c!67692 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!271568 () (_ BitVec 64))

(assert (=> d!86905 (= lt!271568 (select (arr!17782 a!2986) index!984))))

(assert (=> d!86905 (validMask!0 mask!3053)))

(assert (=> d!86905 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17782 a!2986) j!136) a!2986 mask!3053) lt!271567)))

(declare-fun b!597766 () Bool)

(declare-fun e!341606 () SeekEntryResult!6222)

(assert (=> b!597766 (= e!341606 (Found!6222 index!984))))

(declare-fun b!597767 () Bool)

(assert (=> b!597767 (= e!341605 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17782 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597768 () Bool)

(declare-fun c!67694 () Bool)

(assert (=> b!597768 (= c!67694 (= lt!271568 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597768 (= e!341606 e!341605)))

(declare-fun b!597769 () Bool)

(assert (=> b!597769 (= e!341607 Undefined!6222)))

(declare-fun b!597770 () Bool)

(assert (=> b!597770 (= e!341607 e!341606)))

(declare-fun c!67693 () Bool)

(assert (=> b!597770 (= c!67693 (= lt!271568 (select (arr!17782 a!2986) j!136)))))

(assert (= (and d!86905 c!67692) b!597769))

(assert (= (and d!86905 (not c!67692)) b!597770))

(assert (= (and b!597770 c!67693) b!597766))

(assert (= (and b!597770 (not c!67693)) b!597768))

(assert (= (and b!597768 c!67694) b!597765))

(assert (= (and b!597768 (not c!67694)) b!597767))

(declare-fun m!575141 () Bool)

(assert (=> d!86905 m!575141))

(declare-fun m!575143 () Bool)

(assert (=> d!86905 m!575143))

(assert (=> d!86905 m!574909))

(assert (=> d!86905 m!574899))

(assert (=> b!597767 m!574875))

(assert (=> b!597767 m!574875))

(assert (=> b!597767 m!574863))

(declare-fun m!575145 () Bool)

(assert (=> b!597767 m!575145))

(assert (=> b!597471 d!86905))

(declare-fun b!597771 () Bool)

(declare-fun e!341609 () Bool)

(declare-fun call!32937 () Bool)

(assert (=> b!597771 (= e!341609 call!32937)))

(declare-fun b!597772 () Bool)

(declare-fun e!341611 () Bool)

(assert (=> b!597772 (= e!341611 (contains!2954 Nil!11820 (select (arr!17782 lt!271441) #b00000000000000000000000000000000)))))

(declare-fun b!597773 () Bool)

(declare-fun e!341610 () Bool)

(declare-fun e!341608 () Bool)

(assert (=> b!597773 (= e!341610 e!341608)))

(declare-fun res!383115 () Bool)

(assert (=> b!597773 (=> (not res!383115) (not e!341608))))

(assert (=> b!597773 (= res!383115 (not e!341611))))

(declare-fun res!383117 () Bool)

(assert (=> b!597773 (=> (not res!383117) (not e!341611))))

(assert (=> b!597773 (= res!383117 (validKeyInArray!0 (select (arr!17782 lt!271441) #b00000000000000000000000000000000)))))

(declare-fun bm!32934 () Bool)

(declare-fun c!67695 () Bool)

(assert (=> bm!32934 (= call!32937 (arrayNoDuplicates!0 lt!271441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67695 (Cons!11819 (select (arr!17782 lt!271441) #b00000000000000000000000000000000) Nil!11820) Nil!11820)))))

(declare-fun d!86909 () Bool)

(declare-fun res!383116 () Bool)

(assert (=> d!86909 (=> res!383116 e!341610)))

(assert (=> d!86909 (= res!383116 (bvsge #b00000000000000000000000000000000 (size!18146 lt!271441)))))

(assert (=> d!86909 (= (arrayNoDuplicates!0 lt!271441 #b00000000000000000000000000000000 Nil!11820) e!341610)))

(declare-fun b!597774 () Bool)

(assert (=> b!597774 (= e!341608 e!341609)))

(assert (=> b!597774 (= c!67695 (validKeyInArray!0 (select (arr!17782 lt!271441) #b00000000000000000000000000000000)))))

(declare-fun b!597775 () Bool)

(assert (=> b!597775 (= e!341609 call!32937)))

(assert (= (and d!86909 (not res!383116)) b!597773))

(assert (= (and b!597773 res!383117) b!597772))

(assert (= (and b!597773 res!383115) b!597774))

(assert (= (and b!597774 c!67695) b!597771))

(assert (= (and b!597774 (not c!67695)) b!597775))

(assert (= (or b!597771 b!597775) bm!32934))

(declare-fun m!575147 () Bool)

(assert (=> b!597772 m!575147))

(assert (=> b!597772 m!575147))

(declare-fun m!575149 () Bool)

(assert (=> b!597772 m!575149))

(assert (=> b!597773 m!575147))

(assert (=> b!597773 m!575147))

(declare-fun m!575151 () Bool)

(assert (=> b!597773 m!575151))

(assert (=> bm!32934 m!575147))

(declare-fun m!575153 () Bool)

(assert (=> bm!32934 m!575153))

(assert (=> b!597774 m!575147))

(assert (=> b!597774 m!575147))

(assert (=> b!597774 m!575151))

(assert (=> b!597481 d!86909))

(declare-fun d!86911 () Bool)

(declare-fun e!341616 () Bool)

(assert (=> d!86911 e!341616))

(declare-fun res!383122 () Bool)

(assert (=> d!86911 (=> (not res!383122) (not e!341616))))

(assert (=> d!86911 (= res!383122 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18146 a!2986))))))

(declare-fun lt!271573 () Unit!18806)

(declare-fun choose!41 (array!37039 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11823) Unit!18806)

(assert (=> d!86911 (= lt!271573 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11820))))

(assert (=> d!86911 (bvslt (size!18146 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!86911 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11820) lt!271573)))

(declare-fun b!597780 () Bool)

(assert (=> b!597780 (= e!341616 (arrayNoDuplicates!0 (array!37040 (store (arr!17782 a!2986) i!1108 k0!1786) (size!18146 a!2986)) #b00000000000000000000000000000000 Nil!11820))))

(assert (= (and d!86911 res!383122) b!597780))

(declare-fun m!575155 () Bool)

(assert (=> d!86911 m!575155))

(assert (=> b!597780 m!574879))

(declare-fun m!575157 () Bool)

(assert (=> b!597780 m!575157))

(assert (=> b!597481 d!86911))

(declare-fun d!86913 () Bool)

(declare-fun res!383123 () Bool)

(declare-fun e!341617 () Bool)

(assert (=> d!86913 (=> res!383123 e!341617)))

(assert (=> d!86913 (= res!383123 (= (select (arr!17782 lt!271441) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17782 a!2986) j!136)))))

(assert (=> d!86913 (= (arrayContainsKey!0 lt!271441 (select (arr!17782 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!341617)))

(declare-fun b!597781 () Bool)

(declare-fun e!341618 () Bool)

(assert (=> b!597781 (= e!341617 e!341618)))

(declare-fun res!383124 () Bool)

(assert (=> b!597781 (=> (not res!383124) (not e!341618))))

(assert (=> b!597781 (= res!383124 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18146 lt!271441)))))

(declare-fun b!597782 () Bool)

(assert (=> b!597782 (= e!341618 (arrayContainsKey!0 lt!271441 (select (arr!17782 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86913 (not res!383123)) b!597781))

(assert (= (and b!597781 res!383124) b!597782))

(declare-fun m!575159 () Bool)

(assert (=> d!86913 m!575159))

(assert (=> b!597782 m!574863))

(declare-fun m!575161 () Bool)

(assert (=> b!597782 m!575161))

(assert (=> b!597481 d!86913))

(declare-fun d!86915 () Bool)

(assert (=> d!86915 (arrayContainsKey!0 lt!271441 (select (arr!17782 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271579 () Unit!18806)

(declare-fun choose!114 (array!37039 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18806)

(assert (=> d!86915 (= lt!271579 (choose!114 lt!271441 (select (arr!17782 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86915 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86915 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271441 (select (arr!17782 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!271579)))

(declare-fun bs!18376 () Bool)

(assert (= bs!18376 d!86915))

(assert (=> bs!18376 m!574863))

(assert (=> bs!18376 m!574867))

(assert (=> bs!18376 m!574863))

(declare-fun m!575167 () Bool)

(assert (=> bs!18376 m!575167))

(assert (=> b!597481 d!86915))

(check-sat (not d!86845) (not b!597558) (not b!597746) (not bm!32934) (not b!597650) (not b!597565) (not b!597773) (not d!86859) (not b!597767) (not b!597559) (not b!597656) (not bm!32924) (not b!597581) (not d!86877) (not b!597774) (not b!597587) (not b!597617) (not b!597648) (not b!597782) (not d!86843) (not b!597780) (not b!597609) (not bm!32930) (not b!597756) (not d!86847) (not b!597764) (not b!597557) (not b!597772) (not d!86905) (not b!597566) (not d!86911) (not d!86849) (not d!86915))
(check-sat)
