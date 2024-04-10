; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55798 () Bool)

(assert start!55798)

(declare-fun b!611038 () Bool)

(declare-fun res!392995 () Bool)

(declare-fun e!350108 () Bool)

(assert (=> b!611038 (=> (not res!392995) (not e!350108))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!611038 (= res!392995 (validKeyInArray!0 k!1786))))

(declare-fun b!611039 () Bool)

(declare-fun e!350098 () Bool)

(declare-fun e!350106 () Bool)

(assert (=> b!611039 (= e!350098 e!350106)))

(declare-fun res!392996 () Bool)

(assert (=> b!611039 (=> (not res!392996) (not e!350106))))

(declare-datatypes ((List!11969 0))(
  ( (Nil!11966) (Cons!11965 (h!13010 (_ BitVec 64)) (t!18197 List!11969)) )
))
(declare-fun contains!3042 (List!11969 (_ BitVec 64)) Bool)

(assert (=> b!611039 (= res!392996 (not (contains!3042 Nil!11966 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611040 () Bool)

(declare-fun e!350104 () Bool)

(declare-fun e!350107 () Bool)

(assert (=> b!611040 (= e!350104 e!350107)))

(declare-fun res!393005 () Bool)

(assert (=> b!611040 (=> (not res!393005) (not e!350107))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37361 0))(
  ( (array!37362 (arr!17928 (Array (_ BitVec 32) (_ BitVec 64))) (size!18292 (_ BitVec 32))) )
))
(declare-fun lt!279525 () array!37361)

(declare-fun a!2986 () array!37361)

(declare-fun arrayContainsKey!0 (array!37361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!611040 (= res!393005 (arrayContainsKey!0 lt!279525 (select (arr!17928 a!2986) j!136) j!136))))

(declare-fun b!611041 () Bool)

(declare-datatypes ((Unit!19588 0))(
  ( (Unit!19589) )
))
(declare-fun e!350101 () Unit!19588)

(declare-fun Unit!19590 () Unit!19588)

(assert (=> b!611041 (= e!350101 Unit!19590)))

(declare-fun lt!279524 () Unit!19588)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37361 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19588)

(assert (=> b!611041 (= lt!279524 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279525 (select (arr!17928 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!611041 (arrayContainsKey!0 lt!279525 (select (arr!17928 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!279523 () Unit!19588)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37361 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11969) Unit!19588)

(assert (=> b!611041 (= lt!279523 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11966))))

(declare-fun arrayNoDuplicates!0 (array!37361 (_ BitVec 32) List!11969) Bool)

(assert (=> b!611041 (arrayNoDuplicates!0 lt!279525 #b00000000000000000000000000000000 Nil!11966)))

(declare-fun lt!279516 () Unit!19588)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37361 (_ BitVec 32) (_ BitVec 32)) Unit!19588)

(assert (=> b!611041 (= lt!279516 (lemmaNoDuplicateFromThenFromBigger!0 lt!279525 #b00000000000000000000000000000000 j!136))))

(assert (=> b!611041 (arrayNoDuplicates!0 lt!279525 j!136 Nil!11966)))

(declare-fun lt!279532 () Unit!19588)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37361 (_ BitVec 64) (_ BitVec 32) List!11969) Unit!19588)

(assert (=> b!611041 (= lt!279532 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279525 (select (arr!17928 a!2986) j!136) j!136 Nil!11966))))

(assert (=> b!611041 false))

(declare-fun b!611043 () Bool)

(assert (=> b!611043 (= e!350106 (not (contains!3042 Nil!11966 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611044 () Bool)

(declare-fun res!393009 () Bool)

(assert (=> b!611044 (=> (not res!393009) (not e!350108))))

(assert (=> b!611044 (= res!393009 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!611045 () Bool)

(declare-fun res!392994 () Bool)

(declare-fun e!350097 () Bool)

(assert (=> b!611045 (=> (not res!392994) (not e!350097))))

(assert (=> b!611045 (= res!392994 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11966))))

(declare-fun b!611046 () Bool)

(assert (=> b!611046 (= e!350108 e!350097)))

(declare-fun res!392991 () Bool)

(assert (=> b!611046 (=> (not res!392991) (not e!350097))))

(declare-datatypes ((SeekEntryResult!6368 0))(
  ( (MissingZero!6368 (index!27753 (_ BitVec 32))) (Found!6368 (index!27754 (_ BitVec 32))) (Intermediate!6368 (undefined!7180 Bool) (index!27755 (_ BitVec 32)) (x!56567 (_ BitVec 32))) (Undefined!6368) (MissingVacant!6368 (index!27756 (_ BitVec 32))) )
))
(declare-fun lt!279519 () SeekEntryResult!6368)

(assert (=> b!611046 (= res!392991 (or (= lt!279519 (MissingZero!6368 i!1108)) (= lt!279519 (MissingVacant!6368 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37361 (_ BitVec 32)) SeekEntryResult!6368)

(assert (=> b!611046 (= lt!279519 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!611047 () Bool)

(declare-fun res!392992 () Bool)

(assert (=> b!611047 (=> (not res!392992) (not e!350097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37361 (_ BitVec 32)) Bool)

(assert (=> b!611047 (= res!392992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!611048 () Bool)

(declare-fun res!392998 () Bool)

(assert (=> b!611048 (=> (not res!392998) (not e!350108))))

(assert (=> b!611048 (= res!392998 (validKeyInArray!0 (select (arr!17928 a!2986) j!136)))))

(declare-fun b!611049 () Bool)

(declare-fun res!393011 () Bool)

(assert (=> b!611049 (=> res!393011 e!350098)))

(declare-fun noDuplicate!345 (List!11969) Bool)

(assert (=> b!611049 (= res!393011 (not (noDuplicate!345 Nil!11966)))))

(declare-fun b!611050 () Bool)

(declare-fun e!350102 () Bool)

(declare-fun e!350109 () Bool)

(assert (=> b!611050 (= e!350102 e!350109)))

(declare-fun res!393000 () Bool)

(assert (=> b!611050 (=> res!393000 e!350109)))

(assert (=> b!611050 (= res!393000 (bvsge index!984 j!136))))

(declare-fun lt!279531 () Unit!19588)

(assert (=> b!611050 (= lt!279531 e!350101)))

(declare-fun c!69392 () Bool)

(assert (=> b!611050 (= c!69392 (bvslt j!136 index!984))))

(declare-fun b!611051 () Bool)

(declare-fun res!393002 () Bool)

(assert (=> b!611051 (=> (not res!393002) (not e!350097))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!611051 (= res!393002 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17928 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611052 () Bool)

(declare-fun res!392990 () Bool)

(assert (=> b!611052 (=> (not res!392990) (not e!350108))))

(assert (=> b!611052 (= res!392990 (and (= (size!18292 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18292 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18292 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!611053 () Bool)

(declare-fun e!350096 () Bool)

(declare-fun e!350111 () Bool)

(assert (=> b!611053 (= e!350096 e!350111)))

(declare-fun res!392999 () Bool)

(assert (=> b!611053 (=> (not res!392999) (not e!350111))))

(declare-fun lt!279527 () SeekEntryResult!6368)

(assert (=> b!611053 (= res!392999 (and (= lt!279527 (Found!6368 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17928 a!2986) index!984) (select (arr!17928 a!2986) j!136))) (not (= (select (arr!17928 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37361 (_ BitVec 32)) SeekEntryResult!6368)

(assert (=> b!611053 (= lt!279527 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17928 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611054 () Bool)

(declare-fun e!350105 () Unit!19588)

(declare-fun Unit!19591 () Unit!19588)

(assert (=> b!611054 (= e!350105 Unit!19591)))

(declare-fun b!611055 () Bool)

(declare-fun e!350112 () Bool)

(assert (=> b!611055 (= e!350112 e!350102)))

(declare-fun res!393008 () Bool)

(assert (=> b!611055 (=> res!393008 e!350102)))

(declare-fun lt!279526 () (_ BitVec 64))

(declare-fun lt!279522 () (_ BitVec 64))

(assert (=> b!611055 (= res!393008 (or (not (= (select (arr!17928 a!2986) j!136) lt!279522)) (not (= (select (arr!17928 a!2986) j!136) lt!279526))))))

(declare-fun e!350100 () Bool)

(assert (=> b!611055 e!350100))

(declare-fun res!393010 () Bool)

(assert (=> b!611055 (=> (not res!393010) (not e!350100))))

(assert (=> b!611055 (= res!393010 (= lt!279526 (select (arr!17928 a!2986) j!136)))))

(assert (=> b!611055 (= lt!279526 (select (store (arr!17928 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!611056 () Bool)

(declare-fun Unit!19592 () Unit!19588)

(assert (=> b!611056 (= e!350105 Unit!19592)))

(assert (=> b!611056 false))

(declare-fun b!611057 () Bool)

(assert (=> b!611057 (= e!350109 e!350098)))

(declare-fun res!393004 () Bool)

(assert (=> b!611057 (=> res!393004 e!350098)))

(assert (=> b!611057 (= res!393004 (or (bvsgt #b00000000000000000000000000000000 (size!18292 a!2986)) (bvsge (size!18292 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!611057 (arrayNoDuplicates!0 lt!279525 #b00000000000000000000000000000000 Nil!11966)))

(declare-fun lt!279528 () Unit!19588)

(assert (=> b!611057 (= lt!279528 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11966))))

(assert (=> b!611057 (arrayContainsKey!0 lt!279525 (select (arr!17928 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279529 () Unit!19588)

(assert (=> b!611057 (= lt!279529 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279525 (select (arr!17928 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!350110 () Bool)

(assert (=> b!611057 e!350110))

(declare-fun res!393001 () Bool)

(assert (=> b!611057 (=> (not res!393001) (not e!350110))))

(assert (=> b!611057 (= res!393001 (arrayContainsKey!0 lt!279525 (select (arr!17928 a!2986) j!136) j!136))))

(declare-fun b!611058 () Bool)

(assert (=> b!611058 (= e!350111 (not e!350112))))

(declare-fun res!393006 () Bool)

(assert (=> b!611058 (=> res!393006 e!350112)))

(declare-fun lt!279521 () SeekEntryResult!6368)

(assert (=> b!611058 (= res!393006 (not (= lt!279521 (Found!6368 index!984))))))

(declare-fun lt!279517 () Unit!19588)

(assert (=> b!611058 (= lt!279517 e!350105)))

(declare-fun c!69391 () Bool)

(assert (=> b!611058 (= c!69391 (= lt!279521 Undefined!6368))))

(assert (=> b!611058 (= lt!279521 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279522 lt!279525 mask!3053))))

(declare-fun e!350099 () Bool)

(assert (=> b!611058 e!350099))

(declare-fun res!392993 () Bool)

(assert (=> b!611058 (=> (not res!392993) (not e!350099))))

(declare-fun lt!279518 () (_ BitVec 32))

(declare-fun lt!279530 () SeekEntryResult!6368)

(assert (=> b!611058 (= res!392993 (= lt!279530 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279518 vacantSpotIndex!68 lt!279522 lt!279525 mask!3053)))))

(assert (=> b!611058 (= lt!279530 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279518 vacantSpotIndex!68 (select (arr!17928 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!611058 (= lt!279522 (select (store (arr!17928 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!279520 () Unit!19588)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19588)

(assert (=> b!611058 (= lt!279520 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279518 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!611058 (= lt!279518 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!393003 () Bool)

(assert (=> start!55798 (=> (not res!393003) (not e!350108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55798 (= res!393003 (validMask!0 mask!3053))))

(assert (=> start!55798 e!350108))

(assert (=> start!55798 true))

(declare-fun array_inv!13724 (array!37361) Bool)

(assert (=> start!55798 (array_inv!13724 a!2986)))

(declare-fun b!611042 () Bool)

(assert (=> b!611042 (= e!350099 (= lt!279527 lt!279530))))

(declare-fun b!611059 () Bool)

(assert (=> b!611059 (= e!350107 (arrayContainsKey!0 lt!279525 (select (arr!17928 a!2986) j!136) index!984))))

(declare-fun b!611060 () Bool)

(assert (=> b!611060 (= e!350100 e!350104)))

(declare-fun res!392997 () Bool)

(assert (=> b!611060 (=> res!392997 e!350104)))

(assert (=> b!611060 (= res!392997 (or (not (= (select (arr!17928 a!2986) j!136) lt!279522)) (not (= (select (arr!17928 a!2986) j!136) lt!279526)) (bvsge j!136 index!984)))))

(declare-fun b!611061 () Bool)

(declare-fun Unit!19593 () Unit!19588)

(assert (=> b!611061 (= e!350101 Unit!19593)))

(declare-fun b!611062 () Bool)

(assert (=> b!611062 (= e!350110 (arrayContainsKey!0 lt!279525 (select (arr!17928 a!2986) j!136) index!984))))

(declare-fun b!611063 () Bool)

(assert (=> b!611063 (= e!350097 e!350096)))

(declare-fun res!393007 () Bool)

(assert (=> b!611063 (=> (not res!393007) (not e!350096))))

(assert (=> b!611063 (= res!393007 (= (select (store (arr!17928 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611063 (= lt!279525 (array!37362 (store (arr!17928 a!2986) i!1108 k!1786) (size!18292 a!2986)))))

(assert (= (and start!55798 res!393003) b!611052))

(assert (= (and b!611052 res!392990) b!611048))

(assert (= (and b!611048 res!392998) b!611038))

(assert (= (and b!611038 res!392995) b!611044))

(assert (= (and b!611044 res!393009) b!611046))

(assert (= (and b!611046 res!392991) b!611047))

(assert (= (and b!611047 res!392992) b!611045))

(assert (= (and b!611045 res!392994) b!611051))

(assert (= (and b!611051 res!393002) b!611063))

(assert (= (and b!611063 res!393007) b!611053))

(assert (= (and b!611053 res!392999) b!611058))

(assert (= (and b!611058 res!392993) b!611042))

(assert (= (and b!611058 c!69391) b!611056))

(assert (= (and b!611058 (not c!69391)) b!611054))

(assert (= (and b!611058 (not res!393006)) b!611055))

(assert (= (and b!611055 res!393010) b!611060))

(assert (= (and b!611060 (not res!392997)) b!611040))

(assert (= (and b!611040 res!393005) b!611059))

(assert (= (and b!611055 (not res!393008)) b!611050))

(assert (= (and b!611050 c!69392) b!611041))

(assert (= (and b!611050 (not c!69392)) b!611061))

(assert (= (and b!611050 (not res!393000)) b!611057))

(assert (= (and b!611057 res!393001) b!611062))

(assert (= (and b!611057 (not res!393004)) b!611049))

(assert (= (and b!611049 (not res!393011)) b!611039))

(assert (= (and b!611039 res!392996) b!611043))

(declare-fun m!587465 () Bool)

(assert (=> b!611062 m!587465))

(assert (=> b!611062 m!587465))

(declare-fun m!587467 () Bool)

(assert (=> b!611062 m!587467))

(declare-fun m!587469 () Bool)

(assert (=> b!611046 m!587469))

(assert (=> b!611048 m!587465))

(assert (=> b!611048 m!587465))

(declare-fun m!587471 () Bool)

(assert (=> b!611048 m!587471))

(declare-fun m!587473 () Bool)

(assert (=> b!611039 m!587473))

(assert (=> b!611057 m!587465))

(declare-fun m!587475 () Bool)

(assert (=> b!611057 m!587475))

(assert (=> b!611057 m!587465))

(assert (=> b!611057 m!587465))

(declare-fun m!587477 () Bool)

(assert (=> b!611057 m!587477))

(declare-fun m!587479 () Bool)

(assert (=> b!611057 m!587479))

(assert (=> b!611057 m!587465))

(declare-fun m!587481 () Bool)

(assert (=> b!611057 m!587481))

(declare-fun m!587483 () Bool)

(assert (=> b!611057 m!587483))

(declare-fun m!587485 () Bool)

(assert (=> b!611047 m!587485))

(declare-fun m!587487 () Bool)

(assert (=> b!611053 m!587487))

(assert (=> b!611053 m!587465))

(assert (=> b!611053 m!587465))

(declare-fun m!587489 () Bool)

(assert (=> b!611053 m!587489))

(assert (=> b!611059 m!587465))

(assert (=> b!611059 m!587465))

(assert (=> b!611059 m!587467))

(declare-fun m!587491 () Bool)

(assert (=> b!611058 m!587491))

(declare-fun m!587493 () Bool)

(assert (=> b!611058 m!587493))

(declare-fun m!587495 () Bool)

(assert (=> b!611058 m!587495))

(assert (=> b!611058 m!587465))

(declare-fun m!587497 () Bool)

(assert (=> b!611058 m!587497))

(assert (=> b!611058 m!587465))

(declare-fun m!587499 () Bool)

(assert (=> b!611058 m!587499))

(declare-fun m!587501 () Bool)

(assert (=> b!611058 m!587501))

(declare-fun m!587503 () Bool)

(assert (=> b!611058 m!587503))

(declare-fun m!587505 () Bool)

(assert (=> b!611038 m!587505))

(declare-fun m!587507 () Bool)

(assert (=> b!611041 m!587507))

(assert (=> b!611041 m!587465))

(declare-fun m!587509 () Bool)

(assert (=> b!611041 m!587509))

(assert (=> b!611041 m!587479))

(assert (=> b!611041 m!587465))

(declare-fun m!587511 () Bool)

(assert (=> b!611041 m!587511))

(assert (=> b!611041 m!587465))

(declare-fun m!587513 () Bool)

(assert (=> b!611041 m!587513))

(assert (=> b!611041 m!587483))

(assert (=> b!611041 m!587465))

(declare-fun m!587515 () Bool)

(assert (=> b!611041 m!587515))

(declare-fun m!587517 () Bool)

(assert (=> b!611044 m!587517))

(assert (=> b!611040 m!587465))

(assert (=> b!611040 m!587465))

(assert (=> b!611040 m!587475))

(assert (=> b!611055 m!587465))

(assert (=> b!611055 m!587499))

(declare-fun m!587519 () Bool)

(assert (=> b!611055 m!587519))

(declare-fun m!587521 () Bool)

(assert (=> start!55798 m!587521))

(declare-fun m!587523 () Bool)

(assert (=> start!55798 m!587523))

(assert (=> b!611060 m!587465))

(declare-fun m!587525 () Bool)

(assert (=> b!611043 m!587525))

(declare-fun m!587527 () Bool)

(assert (=> b!611049 m!587527))

(assert (=> b!611063 m!587499))

(declare-fun m!587529 () Bool)

(assert (=> b!611063 m!587529))

(declare-fun m!587531 () Bool)

(assert (=> b!611051 m!587531))

(declare-fun m!587533 () Bool)

(assert (=> b!611045 m!587533))

(push 1)

(assert (not b!611046))

(assert (not b!611057))

(assert (not b!611062))

(assert (not b!611040))

(assert (not b!611044))

(assert (not b!611039))

(assert (not b!611058))

(assert (not start!55798))

(assert (not b!611049))

(assert (not b!611041))

(assert (not b!611047))

(assert (not b!611038))

(assert (not b!611059))

(assert (not b!611048))

(assert (not b!611053))

(assert (not b!611045))

(assert (not b!611043))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88431 () Bool)

(declare-fun lt!279683 () SeekEntryResult!6368)

(assert (=> d!88431 (and (or (is-Undefined!6368 lt!279683) (not (is-Found!6368 lt!279683)) (and (bvsge (index!27754 lt!279683) #b00000000000000000000000000000000) (bvslt (index!27754 lt!279683) (size!18292 a!2986)))) (or (is-Undefined!6368 lt!279683) (is-Found!6368 lt!279683) (not (is-MissingZero!6368 lt!279683)) (and (bvsge (index!27753 lt!279683) #b00000000000000000000000000000000) (bvslt (index!27753 lt!279683) (size!18292 a!2986)))) (or (is-Undefined!6368 lt!279683) (is-Found!6368 lt!279683) (is-MissingZero!6368 lt!279683) (not (is-MissingVacant!6368 lt!279683)) (and (bvsge (index!27756 lt!279683) #b00000000000000000000000000000000) (bvslt (index!27756 lt!279683) (size!18292 a!2986)))) (or (is-Undefined!6368 lt!279683) (ite (is-Found!6368 lt!279683) (= (select (arr!17928 a!2986) (index!27754 lt!279683)) k!1786) (ite (is-MissingZero!6368 lt!279683) (= (select (arr!17928 a!2986) (index!27753 lt!279683)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6368 lt!279683) (= (select (arr!17928 a!2986) (index!27756 lt!279683)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!350289 () SeekEntryResult!6368)

(assert (=> d!88431 (= lt!279683 e!350289)))

(declare-fun c!69439 () Bool)

(declare-fun lt!279682 () SeekEntryResult!6368)

(assert (=> d!88431 (= c!69439 (and (is-Intermediate!6368 lt!279682) (undefined!7180 lt!279682)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37361 (_ BitVec 32)) SeekEntryResult!6368)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88431 (= lt!279682 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!88431 (validMask!0 mask!3053)))

(assert (=> d!88431 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!279683)))

(declare-fun b!611327 () Bool)

(declare-fun e!350288 () SeekEntryResult!6368)

(assert (=> b!611327 (= e!350289 e!350288)))

(declare-fun lt!279684 () (_ BitVec 64))

(assert (=> b!611327 (= lt!279684 (select (arr!17928 a!2986) (index!27755 lt!279682)))))

(declare-fun c!69440 () Bool)

(assert (=> b!611327 (= c!69440 (= lt!279684 k!1786))))

(declare-fun b!611328 () Bool)

(assert (=> b!611328 (= e!350289 Undefined!6368)))

(declare-fun b!611329 () Bool)

(assert (=> b!611329 (= e!350288 (Found!6368 (index!27755 lt!279682)))))

(declare-fun b!611330 () Bool)

(declare-fun e!350290 () SeekEntryResult!6368)

(assert (=> b!611330 (= e!350290 (MissingZero!6368 (index!27755 lt!279682)))))

(declare-fun b!611331 () Bool)

(declare-fun c!69441 () Bool)

(assert (=> b!611331 (= c!69441 (= lt!279684 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611331 (= e!350288 e!350290)))

(declare-fun b!611332 () Bool)

(assert (=> b!611332 (= e!350290 (seekKeyOrZeroReturnVacant!0 (x!56567 lt!279682) (index!27755 lt!279682) (index!27755 lt!279682) k!1786 a!2986 mask!3053))))

(assert (= (and d!88431 c!69439) b!611328))

(assert (= (and d!88431 (not c!69439)) b!611327))

(assert (= (and b!611327 c!69440) b!611329))

(assert (= (and b!611327 (not c!69440)) b!611331))

(assert (= (and b!611331 c!69441) b!611330))

(assert (= (and b!611331 (not c!69441)) b!611332))

(declare-fun m!587757 () Bool)

(assert (=> d!88431 m!587757))

(declare-fun m!587759 () Bool)

(assert (=> d!88431 m!587759))

(declare-fun m!587761 () Bool)

(assert (=> d!88431 m!587761))

(declare-fun m!587763 () Bool)

(assert (=> d!88431 m!587763))

(assert (=> d!88431 m!587521))

(declare-fun m!587765 () Bool)

(assert (=> d!88431 m!587765))

(assert (=> d!88431 m!587761))

(declare-fun m!587767 () Bool)

(assert (=> b!611327 m!587767))

(declare-fun m!587769 () Bool)

(assert (=> b!611332 m!587769))

(assert (=> b!611046 d!88431))

(declare-fun d!88445 () Bool)

(assert (=> d!88445 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55798 d!88445))

(declare-fun d!88453 () Bool)

(assert (=> d!88453 (= (array_inv!13724 a!2986) (bvsge (size!18292 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55798 d!88453))

(declare-fun b!611402 () Bool)

(declare-fun e!350335 () Bool)

(assert (=> b!611402 (= e!350335 (contains!3042 Nil!11966 (select (arr!17928 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!611403 () Bool)

(declare-fun e!350337 () Bool)

(declare-fun call!33170 () Bool)

(assert (=> b!611403 (= e!350337 call!33170)))

(declare-fun d!88457 () Bool)

(declare-fun res!393204 () Bool)

(declare-fun e!350336 () Bool)

(assert (=> d!88457 (=> res!393204 e!350336)))

(assert (=> d!88457 (= res!393204 (bvsge #b00000000000000000000000000000000 (size!18292 a!2986)))))

(assert (=> d!88457 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11966) e!350336)))

(declare-fun b!611404 () Bool)

(declare-fun e!350338 () Bool)

(assert (=> b!611404 (= e!350338 e!350337)))

(declare-fun c!69467 () Bool)

(assert (=> b!611404 (= c!69467 (validKeyInArray!0 (select (arr!17928 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!611405 () Bool)

(assert (=> b!611405 (= e!350337 call!33170)))

(declare-fun b!611406 () Bool)

(assert (=> b!611406 (= e!350336 e!350338)))

(declare-fun res!393202 () Bool)

(assert (=> b!611406 (=> (not res!393202) (not e!350338))))

(assert (=> b!611406 (= res!393202 (not e!350335))))

(declare-fun res!393203 () Bool)

(assert (=> b!611406 (=> (not res!393203) (not e!350335))))

(assert (=> b!611406 (= res!393203 (validKeyInArray!0 (select (arr!17928 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33167 () Bool)

(assert (=> bm!33167 (= call!33170 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69467 (Cons!11965 (select (arr!17928 a!2986) #b00000000000000000000000000000000) Nil!11966) Nil!11966)))))

(assert (= (and d!88457 (not res!393204)) b!611406))

(assert (= (and b!611406 res!393203) b!611402))

(assert (= (and b!611406 res!393202) b!611404))

(assert (= (and b!611404 c!69467) b!611403))

(assert (= (and b!611404 (not c!69467)) b!611405))

(assert (= (or b!611403 b!611405) bm!33167))

(declare-fun m!587837 () Bool)

(assert (=> b!611402 m!587837))

(assert (=> b!611402 m!587837))

(declare-fun m!587839 () Bool)

(assert (=> b!611402 m!587839))

(assert (=> b!611404 m!587837))

(assert (=> b!611404 m!587837))

(declare-fun m!587841 () Bool)

(assert (=> b!611404 m!587841))

(assert (=> b!611406 m!587837))

(assert (=> b!611406 m!587837))

(assert (=> b!611406 m!587841))

(assert (=> bm!33167 m!587837))

(declare-fun m!587843 () Bool)

(assert (=> bm!33167 m!587843))

(assert (=> b!611045 d!88457))

(declare-fun e!350378 () SeekEntryResult!6368)

(declare-fun b!611455 () Bool)

(assert (=> b!611455 (= e!350378 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279518 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!279522 lt!279525 mask!3053))))

(declare-fun b!611456 () Bool)

(declare-fun e!350376 () SeekEntryResult!6368)

(declare-fun e!350377 () SeekEntryResult!6368)

(assert (=> b!611456 (= e!350376 e!350377)))

(declare-fun c!69480 () Bool)

(declare-fun lt!279732 () (_ BitVec 64))

(assert (=> b!611456 (= c!69480 (= lt!279732 lt!279522))))

(declare-fun b!611457 () Bool)

(assert (=> b!611457 (= e!350377 (Found!6368 lt!279518))))

(declare-fun lt!279731 () SeekEntryResult!6368)

(declare-fun d!88475 () Bool)

(assert (=> d!88475 (and (or (is-Undefined!6368 lt!279731) (not (is-Found!6368 lt!279731)) (and (bvsge (index!27754 lt!279731) #b00000000000000000000000000000000) (bvslt (index!27754 lt!279731) (size!18292 lt!279525)))) (or (is-Undefined!6368 lt!279731) (is-Found!6368 lt!279731) (not (is-MissingVacant!6368 lt!279731)) (not (= (index!27756 lt!279731) vacantSpotIndex!68)) (and (bvsge (index!27756 lt!279731) #b00000000000000000000000000000000) (bvslt (index!27756 lt!279731) (size!18292 lt!279525)))) (or (is-Undefined!6368 lt!279731) (ite (is-Found!6368 lt!279731) (= (select (arr!17928 lt!279525) (index!27754 lt!279731)) lt!279522) (and (is-MissingVacant!6368 lt!279731) (= (index!27756 lt!279731) vacantSpotIndex!68) (= (select (arr!17928 lt!279525) (index!27756 lt!279731)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88475 (= lt!279731 e!350376)))

(declare-fun c!69479 () Bool)

(assert (=> d!88475 (= c!69479 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!88475 (= lt!279732 (select (arr!17928 lt!279525) lt!279518))))

(assert (=> d!88475 (validMask!0 mask!3053)))

(assert (=> d!88475 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279518 vacantSpotIndex!68 lt!279522 lt!279525 mask!3053) lt!279731)))

(declare-fun b!611458 () Bool)

(declare-fun c!69481 () Bool)

(assert (=> b!611458 (= c!69481 (= lt!279732 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611458 (= e!350377 e!350378)))

(declare-fun b!611459 () Bool)

(assert (=> b!611459 (= e!350376 Undefined!6368)))

(declare-fun b!611460 () Bool)

(assert (=> b!611460 (= e!350378 (MissingVacant!6368 vacantSpotIndex!68))))

(assert (= (and d!88475 c!69479) b!611459))

(assert (= (and d!88475 (not c!69479)) b!611456))

(assert (= (and b!611456 c!69480) b!611457))

(assert (= (and b!611456 (not c!69480)) b!611458))

(assert (= (and b!611458 c!69481) b!611460))

(assert (= (and b!611458 (not c!69481)) b!611455))

(declare-fun m!587891 () Bool)

(assert (=> b!611455 m!587891))

(assert (=> b!611455 m!587891))

(declare-fun m!587895 () Bool)

(assert (=> b!611455 m!587895))

(declare-fun m!587899 () Bool)

(assert (=> d!88475 m!587899))

(declare-fun m!587901 () Bool)

(assert (=> d!88475 m!587901))

(declare-fun m!587903 () Bool)

(assert (=> d!88475 m!587903))

(assert (=> d!88475 m!587521))

(assert (=> b!611058 d!88475))

(declare-fun b!611468 () Bool)

(declare-fun e!350387 () SeekEntryResult!6368)

(assert (=> b!611468 (= e!350387 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279518 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17928 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611469 () Bool)

(declare-fun e!350385 () SeekEntryResult!6368)

(declare-fun e!350386 () SeekEntryResult!6368)

(assert (=> b!611469 (= e!350385 e!350386)))

(declare-fun c!69484 () Bool)

(declare-fun lt!279734 () (_ BitVec 64))

(assert (=> b!611469 (= c!69484 (= lt!279734 (select (arr!17928 a!2986) j!136)))))

(declare-fun b!611470 () Bool)

(assert (=> b!611470 (= e!350386 (Found!6368 lt!279518))))

(declare-fun d!88499 () Bool)

(declare-fun lt!279733 () SeekEntryResult!6368)

(assert (=> d!88499 (and (or (is-Undefined!6368 lt!279733) (not (is-Found!6368 lt!279733)) (and (bvsge (index!27754 lt!279733) #b00000000000000000000000000000000) (bvslt (index!27754 lt!279733) (size!18292 a!2986)))) (or (is-Undefined!6368 lt!279733) (is-Found!6368 lt!279733) (not (is-MissingVacant!6368 lt!279733)) (not (= (index!27756 lt!279733) vacantSpotIndex!68)) (and (bvsge (index!27756 lt!279733) #b00000000000000000000000000000000) (bvslt (index!27756 lt!279733) (size!18292 a!2986)))) (or (is-Undefined!6368 lt!279733) (ite (is-Found!6368 lt!279733) (= (select (arr!17928 a!2986) (index!27754 lt!279733)) (select (arr!17928 a!2986) j!136)) (and (is-MissingVacant!6368 lt!279733) (= (index!27756 lt!279733) vacantSpotIndex!68) (= (select (arr!17928 a!2986) (index!27756 lt!279733)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88499 (= lt!279733 e!350385)))

(declare-fun c!69483 () Bool)

(assert (=> d!88499 (= c!69483 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!88499 (= lt!279734 (select (arr!17928 a!2986) lt!279518))))

(assert (=> d!88499 (validMask!0 mask!3053)))

(assert (=> d!88499 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279518 vacantSpotIndex!68 (select (arr!17928 a!2986) j!136) a!2986 mask!3053) lt!279733)))

(declare-fun b!611471 () Bool)

(declare-fun c!69485 () Bool)

(assert (=> b!611471 (= c!69485 (= lt!279734 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611471 (= e!350386 e!350387)))

(declare-fun b!611472 () Bool)

(assert (=> b!611472 (= e!350385 Undefined!6368)))

(declare-fun b!611473 () Bool)

(assert (=> b!611473 (= e!350387 (MissingVacant!6368 vacantSpotIndex!68))))

(assert (= (and d!88499 c!69483) b!611472))

(assert (= (and d!88499 (not c!69483)) b!611469))

(assert (= (and b!611469 c!69484) b!611470))

(assert (= (and b!611469 (not c!69484)) b!611471))

(assert (= (and b!611471 c!69485) b!611473))

(assert (= (and b!611471 (not c!69485)) b!611468))

(assert (=> b!611468 m!587891))

(assert (=> b!611468 m!587891))

(assert (=> b!611468 m!587465))

(declare-fun m!587909 () Bool)

(assert (=> b!611468 m!587909))

(declare-fun m!587911 () Bool)

(assert (=> d!88499 m!587911))

(declare-fun m!587913 () Bool)

(assert (=> d!88499 m!587913))

(declare-fun m!587915 () Bool)

(assert (=> d!88499 m!587915))

(assert (=> d!88499 m!587521))

(assert (=> b!611058 d!88499))

(declare-fun d!88505 () Bool)

(declare-fun lt!279738 () (_ BitVec 32))

(assert (=> d!88505 (and (bvsge lt!279738 #b00000000000000000000000000000000) (bvslt lt!279738 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88505 (= lt!279738 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!88505 (validMask!0 mask!3053)))

(assert (=> d!88505 (= (nextIndex!0 index!984 x!910 mask!3053) lt!279738)))

(declare-fun bs!18656 () Bool)

(assert (= bs!18656 d!88505))

(declare-fun m!587923 () Bool)

(assert (=> bs!18656 m!587923))

(assert (=> bs!18656 m!587521))

(assert (=> b!611058 d!88505))

(declare-fun b!611482 () Bool)

(declare-fun e!350398 () SeekEntryResult!6368)

(assert (=> b!611482 (= e!350398 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!279522 lt!279525 mask!3053))))

(declare-fun b!611483 () Bool)

(declare-fun e!350396 () SeekEntryResult!6368)

(declare-fun e!350397 () SeekEntryResult!6368)

(assert (=> b!611483 (= e!350396 e!350397)))

(declare-fun c!69487 () Bool)

(declare-fun lt!279740 () (_ BitVec 64))

(assert (=> b!611483 (= c!69487 (= lt!279740 lt!279522))))

(declare-fun b!611484 () Bool)

(assert (=> b!611484 (= e!350397 (Found!6368 index!984))))

(declare-fun d!88513 () Bool)

(declare-fun lt!279739 () SeekEntryResult!6368)

(assert (=> d!88513 (and (or (is-Undefined!6368 lt!279739) (not (is-Found!6368 lt!279739)) (and (bvsge (index!27754 lt!279739) #b00000000000000000000000000000000) (bvslt (index!27754 lt!279739) (size!18292 lt!279525)))) (or (is-Undefined!6368 lt!279739) (is-Found!6368 lt!279739) (not (is-MissingVacant!6368 lt!279739)) (not (= (index!27756 lt!279739) vacantSpotIndex!68)) (and (bvsge (index!27756 lt!279739) #b00000000000000000000000000000000) (bvslt (index!27756 lt!279739) (size!18292 lt!279525)))) (or (is-Undefined!6368 lt!279739) (ite (is-Found!6368 lt!279739) (= (select (arr!17928 lt!279525) (index!27754 lt!279739)) lt!279522) (and (is-MissingVacant!6368 lt!279739) (= (index!27756 lt!279739) vacantSpotIndex!68) (= (select (arr!17928 lt!279525) (index!27756 lt!279739)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88513 (= lt!279739 e!350396)))

(declare-fun c!69486 () Bool)

(assert (=> d!88513 (= c!69486 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88513 (= lt!279740 (select (arr!17928 lt!279525) index!984))))

(assert (=> d!88513 (validMask!0 mask!3053)))

(assert (=> d!88513 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279522 lt!279525 mask!3053) lt!279739)))

(declare-fun b!611485 () Bool)

(declare-fun c!69488 () Bool)

(assert (=> b!611485 (= c!69488 (= lt!279740 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611485 (= e!350397 e!350398)))

(declare-fun b!611486 () Bool)

(assert (=> b!611486 (= e!350396 Undefined!6368)))

(declare-fun b!611487 () Bool)

(assert (=> b!611487 (= e!350398 (MissingVacant!6368 vacantSpotIndex!68))))

(assert (= (and d!88513 c!69486) b!611486))

(assert (= (and d!88513 (not c!69486)) b!611483))

(assert (= (and b!611483 c!69487) b!611484))

(assert (= (and b!611483 (not c!69487)) b!611485))

(assert (= (and b!611485 c!69488) b!611487))

(assert (= (and b!611485 (not c!69488)) b!611482))

(assert (=> b!611482 m!587491))

(assert (=> b!611482 m!587491))

(declare-fun m!587925 () Bool)

(assert (=> b!611482 m!587925))

(declare-fun m!587927 () Bool)

(assert (=> d!88513 m!587927))

(declare-fun m!587929 () Bool)

(assert (=> d!88513 m!587929))

(declare-fun m!587931 () Bool)

(assert (=> d!88513 m!587931))

(assert (=> d!88513 m!587521))

(assert (=> b!611058 d!88513))

(declare-fun d!88515 () Bool)

(declare-fun e!350413 () Bool)

(assert (=> d!88515 e!350413))

(declare-fun res!393257 () Bool)

(assert (=> d!88515 (=> (not res!393257) (not e!350413))))

(assert (=> d!88515 (= res!393257 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18292 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18292 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18292 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18292 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18292 a!2986))))))

(declare-fun lt!279746 () Unit!19588)

(declare-fun choose!9 (array!37361 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19588)

(assert (=> d!88515 (= lt!279746 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279518 vacantSpotIndex!68 mask!3053))))

(assert (=> d!88515 (validMask!0 mask!3053)))

(assert (=> d!88515 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279518 vacantSpotIndex!68 mask!3053) lt!279746)))

(declare-fun b!611503 () Bool)

(assert (=> b!611503 (= e!350413 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279518 vacantSpotIndex!68 (select (arr!17928 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279518 vacantSpotIndex!68 (select (store (arr!17928 a!2986) i!1108 k!1786) j!136) (array!37362 (store (arr!17928 a!2986) i!1108 k!1786) (size!18292 a!2986)) mask!3053)))))

(assert (= (and d!88515 res!393257) b!611503))

(declare-fun m!587947 () Bool)

(assert (=> d!88515 m!587947))

(assert (=> d!88515 m!587521))

(assert (=> b!611503 m!587465))

(assert (=> b!611503 m!587497))

(assert (=> b!611503 m!587499))

(assert (=> b!611503 m!587493))

(assert (=> b!611503 m!587465))

(assert (=> b!611503 m!587493))

(declare-fun m!587949 () Bool)

(assert (=> b!611503 m!587949))

(assert (=> b!611058 d!88515))

(declare-fun b!611524 () Bool)

(declare-fun e!350427 () Bool)

(declare-fun call!33177 () Bool)

(assert (=> b!611524 (= e!350427 call!33177)))

(declare-fun b!611525 () Bool)

(declare-fun e!350426 () Bool)

(assert (=> b!611525 (= e!350426 call!33177)))

(declare-fun d!88525 () Bool)

(declare-fun res!393262 () Bool)

(declare-fun e!350428 () Bool)

(assert (=> d!88525 (=> res!393262 e!350428)))

(assert (=> d!88525 (= res!393262 (bvsge #b00000000000000000000000000000000 (size!18292 a!2986)))))

(assert (=> d!88525 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!350428)))

(declare-fun b!611526 () Bool)

(assert (=> b!611526 (= e!350427 e!350426)))

(declare-fun lt!279759 () (_ BitVec 64))

(assert (=> b!611526 (= lt!279759 (select (arr!17928 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!279761 () Unit!19588)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37361 (_ BitVec 64) (_ BitVec 32)) Unit!19588)

(assert (=> b!611526 (= lt!279761 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!279759 #b00000000000000000000000000000000))))

(assert (=> b!611526 (arrayContainsKey!0 a!2986 lt!279759 #b00000000000000000000000000000000)))

(declare-fun lt!279760 () Unit!19588)

(assert (=> b!611526 (= lt!279760 lt!279761)))

(declare-fun res!393263 () Bool)

(assert (=> b!611526 (= res!393263 (= (seekEntryOrOpen!0 (select (arr!17928 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6368 #b00000000000000000000000000000000)))))

(assert (=> b!611526 (=> (not res!393263) (not e!350426))))

(declare-fun bm!33174 () Bool)

(assert (=> bm!33174 (= call!33177 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!611527 () Bool)

(assert (=> b!611527 (= e!350428 e!350427)))

(declare-fun c!69498 () Bool)

(assert (=> b!611527 (= c!69498 (validKeyInArray!0 (select (arr!17928 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!88525 (not res!393262)) b!611527))

(assert (= (and b!611527 c!69498) b!611526))

(assert (= (and b!611527 (not c!69498)) b!611524))

(assert (= (and b!611526 res!393263) b!611525))

(assert (= (or b!611525 b!611524) bm!33174))

(assert (=> b!611526 m!587837))

(declare-fun m!587951 () Bool)

(assert (=> b!611526 m!587951))

(declare-fun m!587953 () Bool)

(assert (=> b!611526 m!587953))

(assert (=> b!611526 m!587837))

(declare-fun m!587955 () Bool)

(assert (=> b!611526 m!587955))

(declare-fun m!587957 () Bool)

(assert (=> bm!33174 m!587957))

(assert (=> b!611527 m!587837))

(assert (=> b!611527 m!587837))

(assert (=> b!611527 m!587841))

(assert (=> b!611047 d!88525))

(declare-fun b!611528 () Bool)

(declare-fun e!350429 () Bool)

(assert (=> b!611528 (= e!350429 (contains!3042 Nil!11966 (select (arr!17928 lt!279525) #b00000000000000000000000000000000)))))

(declare-fun b!611529 () Bool)

(declare-fun e!350431 () Bool)

(declare-fun call!33178 () Bool)

(assert (=> b!611529 (= e!350431 call!33178)))

(declare-fun d!88527 () Bool)

(declare-fun res!393266 () Bool)

(declare-fun e!350430 () Bool)

(assert (=> d!88527 (=> res!393266 e!350430)))

(assert (=> d!88527 (= res!393266 (bvsge #b00000000000000000000000000000000 (size!18292 lt!279525)))))

(assert (=> d!88527 (= (arrayNoDuplicates!0 lt!279525 #b00000000000000000000000000000000 Nil!11966) e!350430)))

(declare-fun b!611530 () Bool)

(declare-fun e!350432 () Bool)

(assert (=> b!611530 (= e!350432 e!350431)))

(declare-fun c!69499 () Bool)

(assert (=> b!611530 (= c!69499 (validKeyInArray!0 (select (arr!17928 lt!279525) #b00000000000000000000000000000000)))))

(declare-fun b!611531 () Bool)

(assert (=> b!611531 (= e!350431 call!33178)))

(declare-fun b!611532 () Bool)

(assert (=> b!611532 (= e!350430 e!350432)))

(declare-fun res!393264 () Bool)

(assert (=> b!611532 (=> (not res!393264) (not e!350432))))

(assert (=> b!611532 (= res!393264 (not e!350429))))

(declare-fun res!393265 () Bool)

(assert (=> b!611532 (=> (not res!393265) (not e!350429))))

(assert (=> b!611532 (= res!393265 (validKeyInArray!0 (select (arr!17928 lt!279525) #b00000000000000000000000000000000)))))

(declare-fun bm!33175 () Bool)

(assert (=> bm!33175 (= call!33178 (arrayNoDuplicates!0 lt!279525 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69499 (Cons!11965 (select (arr!17928 lt!279525) #b00000000000000000000000000000000) Nil!11966) Nil!11966)))))

(assert (= (and d!88527 (not res!393266)) b!611532))

(assert (= (and b!611532 res!393265) b!611528))

(assert (= (and b!611532 res!393264) b!611530))

(assert (= (and b!611530 c!69499) b!611529))

(assert (= (and b!611530 (not c!69499)) b!611531))

(assert (= (or b!611529 b!611531) bm!33175))

(declare-fun m!587959 () Bool)

(assert (=> b!611528 m!587959))

(assert (=> b!611528 m!587959))

(declare-fun m!587961 () Bool)

(assert (=> b!611528 m!587961))

(assert (=> b!611530 m!587959))

(assert (=> b!611530 m!587959))

(declare-fun m!587963 () Bool)

(assert (=> b!611530 m!587963))

(assert (=> b!611532 m!587959))

(assert (=> b!611532 m!587959))

(assert (=> b!611532 m!587963))

(assert (=> bm!33175 m!587959))

(declare-fun m!587965 () Bool)

(assert (=> bm!33175 m!587965))

(assert (=> b!611057 d!88527))

(declare-fun d!88529 () Bool)

(assert (=> d!88529 (arrayContainsKey!0 lt!279525 (select (arr!17928 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279768 () Unit!19588)

(declare-fun choose!114 (array!37361 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19588)

(assert (=> d!88529 (= lt!279768 (choose!114 lt!279525 (select (arr!17928 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!88529 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!88529 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279525 (select (arr!17928 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!279768)))

(declare-fun bs!18657 () Bool)

(assert (= bs!18657 d!88529))

(assert (=> bs!18657 m!587465))

(assert (=> bs!18657 m!587477))

(assert (=> bs!18657 m!587465))

(declare-fun m!587985 () Bool)

(assert (=> bs!18657 m!587985))

(assert (=> b!611057 d!88529))

(declare-fun d!88537 () Bool)

(declare-fun res!393273 () Bool)

(declare-fun e!350442 () Bool)

(assert (=> d!88537 (=> res!393273 e!350442)))

(assert (=> d!88537 (= res!393273 (= (select (arr!17928 lt!279525) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17928 a!2986) j!136)))))

(assert (=> d!88537 (= (arrayContainsKey!0 lt!279525 (select (arr!17928 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!350442)))

(declare-fun b!611545 () Bool)

(declare-fun e!350443 () Bool)

(assert (=> b!611545 (= e!350442 e!350443)))

(declare-fun res!393274 () Bool)

(assert (=> b!611545 (=> (not res!393274) (not e!350443))))

(assert (=> b!611545 (= res!393274 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18292 lt!279525)))))

(declare-fun b!611546 () Bool)

(assert (=> b!611546 (= e!350443 (arrayContainsKey!0 lt!279525 (select (arr!17928 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88537 (not res!393273)) b!611545))

(assert (= (and b!611545 res!393274) b!611546))

(declare-fun m!587987 () Bool)

(assert (=> d!88537 m!587987))

(assert (=> b!611546 m!587465))

(declare-fun m!587989 () Bool)

(assert (=> b!611546 m!587989))

(assert (=> b!611057 d!88537))

(declare-fun d!88539 () Bool)

(declare-fun e!350446 () Bool)

(assert (=> d!88539 e!350446))

(declare-fun res!393277 () Bool)

(assert (=> d!88539 (=> (not res!393277) (not e!350446))))

(assert (=> d!88539 (= res!393277 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18292 a!2986))))))

(declare-fun lt!279771 () Unit!19588)

(declare-fun choose!41 (array!37361 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11969) Unit!19588)

