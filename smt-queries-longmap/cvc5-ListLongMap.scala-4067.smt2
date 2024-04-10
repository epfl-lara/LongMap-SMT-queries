; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55900 () Bool)

(assert start!55900)

(declare-fun b!611641 () Bool)

(declare-fun e!350523 () Bool)

(declare-datatypes ((array!37370 0))(
  ( (array!37371 (arr!17931 (Array (_ BitVec 32) (_ BitVec 64))) (size!18295 (_ BitVec 32))) )
))
(declare-fun lt!279835 () array!37370)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37370)

(declare-fun arrayContainsKey!0 (array!37370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!611641 (= e!350523 (arrayContainsKey!0 lt!279835 (select (arr!17931 a!2986) j!136) index!984))))

(declare-fun b!611642 () Bool)

(declare-fun e!350519 () Bool)

(assert (=> b!611642 (= e!350519 (arrayContainsKey!0 lt!279835 (select (arr!17931 a!2986) j!136) index!984))))

(declare-fun b!611643 () Bool)

(declare-fun e!350524 () Bool)

(declare-fun e!350516 () Bool)

(assert (=> b!611643 (= e!350524 e!350516)))

(declare-fun res!393349 () Bool)

(assert (=> b!611643 (=> res!393349 e!350516)))

(declare-fun lt!279844 () (_ BitVec 64))

(declare-fun lt!279834 () (_ BitVec 64))

(assert (=> b!611643 (= res!393349 (or (not (= (select (arr!17931 a!2986) j!136) lt!279844)) (not (= (select (arr!17931 a!2986) j!136) lt!279834))))))

(declare-fun e!350517 () Bool)

(assert (=> b!611643 e!350517))

(declare-fun res!393352 () Bool)

(assert (=> b!611643 (=> (not res!393352) (not e!350517))))

(assert (=> b!611643 (= res!393352 (= lt!279834 (select (arr!17931 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!611643 (= lt!279834 (select (store (arr!17931 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!611644 () Bool)

(declare-fun res!393351 () Bool)

(declare-fun e!350520 () Bool)

(assert (=> b!611644 (=> (not res!393351) (not e!350520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!611644 (= res!393351 (validKeyInArray!0 k!1786))))

(declare-fun b!611645 () Bool)

(declare-datatypes ((Unit!19606 0))(
  ( (Unit!19607) )
))
(declare-fun e!350515 () Unit!19606)

(declare-fun Unit!19608 () Unit!19606)

(assert (=> b!611645 (= e!350515 Unit!19608)))

(declare-fun b!611646 () Bool)

(declare-fun Unit!19609 () Unit!19606)

(assert (=> b!611646 (= e!350515 Unit!19609)))

(assert (=> b!611646 false))

(declare-fun b!611647 () Bool)

(declare-fun res!393361 () Bool)

(declare-fun e!350526 () Bool)

(assert (=> b!611647 (=> (not res!393361) (not e!350526))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37370 (_ BitVec 32)) Bool)

(assert (=> b!611647 (= res!393361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!611648 () Bool)

(declare-fun e!350518 () Bool)

(assert (=> b!611648 (= e!350526 e!350518)))

(declare-fun res!393354 () Bool)

(assert (=> b!611648 (=> (not res!393354) (not e!350518))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!611648 (= res!393354 (= (select (store (arr!17931 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611648 (= lt!279835 (array!37371 (store (arr!17931 a!2986) i!1108 k!1786) (size!18295 a!2986)))))

(declare-fun b!611649 () Bool)

(declare-fun e!350528 () Unit!19606)

(declare-fun Unit!19610 () Unit!19606)

(assert (=> b!611649 (= e!350528 Unit!19610)))

(declare-fun lt!279832 () Unit!19606)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37370 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19606)

(assert (=> b!611649 (= lt!279832 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279835 (select (arr!17931 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!611649 (arrayContainsKey!0 lt!279835 (select (arr!17931 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279843 () Unit!19606)

(declare-datatypes ((List!11972 0))(
  ( (Nil!11969) (Cons!11968 (h!13013 (_ BitVec 64)) (t!18200 List!11972)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37370 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11972) Unit!19606)

(assert (=> b!611649 (= lt!279843 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11969))))

(declare-fun arrayNoDuplicates!0 (array!37370 (_ BitVec 32) List!11972) Bool)

(assert (=> b!611649 (arrayNoDuplicates!0 lt!279835 #b00000000000000000000000000000000 Nil!11969)))

(declare-fun lt!279828 () Unit!19606)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37370 (_ BitVec 32) (_ BitVec 32)) Unit!19606)

(assert (=> b!611649 (= lt!279828 (lemmaNoDuplicateFromThenFromBigger!0 lt!279835 #b00000000000000000000000000000000 j!136))))

(assert (=> b!611649 (arrayNoDuplicates!0 lt!279835 j!136 Nil!11969)))

(declare-fun lt!279842 () Unit!19606)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37370 (_ BitVec 64) (_ BitVec 32) List!11972) Unit!19606)

(assert (=> b!611649 (= lt!279842 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279835 (select (arr!17931 a!2986) j!136) j!136 Nil!11969))))

(assert (=> b!611649 false))

(declare-fun b!611650 () Bool)

(declare-fun e!350522 () Bool)

(assert (=> b!611650 (= e!350517 e!350522)))

(declare-fun res!393363 () Bool)

(assert (=> b!611650 (=> res!393363 e!350522)))

(assert (=> b!611650 (= res!393363 (or (not (= (select (arr!17931 a!2986) j!136) lt!279844)) (not (= (select (arr!17931 a!2986) j!136) lt!279834)) (bvsge j!136 index!984)))))

(declare-fun res!393359 () Bool)

(assert (=> start!55900 (=> (not res!393359) (not e!350520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55900 (= res!393359 (validMask!0 mask!3053))))

(assert (=> start!55900 e!350520))

(assert (=> start!55900 true))

(declare-fun array_inv!13727 (array!37370) Bool)

(assert (=> start!55900 (array_inv!13727 a!2986)))

(declare-fun b!611651 () Bool)

(declare-fun res!393364 () Bool)

(assert (=> b!611651 (=> (not res!393364) (not e!350520))))

(assert (=> b!611651 (= res!393364 (validKeyInArray!0 (select (arr!17931 a!2986) j!136)))))

(declare-fun b!611652 () Bool)

(declare-fun e!350527 () Bool)

(assert (=> b!611652 (= e!350527 (not e!350524))))

(declare-fun res!393360 () Bool)

(assert (=> b!611652 (=> res!393360 e!350524)))

(declare-datatypes ((SeekEntryResult!6371 0))(
  ( (MissingZero!6371 (index!27768 (_ BitVec 32))) (Found!6371 (index!27769 (_ BitVec 32))) (Intermediate!6371 (undefined!7183 Bool) (index!27770 (_ BitVec 32)) (x!56587 (_ BitVec 32))) (Undefined!6371) (MissingVacant!6371 (index!27771 (_ BitVec 32))) )
))
(declare-fun lt!279841 () SeekEntryResult!6371)

(assert (=> b!611652 (= res!393360 (not (= lt!279841 (Found!6371 index!984))))))

(declare-fun lt!279839 () Unit!19606)

(assert (=> b!611652 (= lt!279839 e!350515)))

(declare-fun c!69515 () Bool)

(assert (=> b!611652 (= c!69515 (= lt!279841 Undefined!6371))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37370 (_ BitVec 32)) SeekEntryResult!6371)

(assert (=> b!611652 (= lt!279841 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279844 lt!279835 mask!3053))))

(declare-fun e!350521 () Bool)

(assert (=> b!611652 e!350521))

(declare-fun res!393355 () Bool)

(assert (=> b!611652 (=> (not res!393355) (not e!350521))))

(declare-fun lt!279837 () (_ BitVec 32))

(declare-fun lt!279833 () SeekEntryResult!6371)

(assert (=> b!611652 (= res!393355 (= lt!279833 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279837 vacantSpotIndex!68 lt!279844 lt!279835 mask!3053)))))

(assert (=> b!611652 (= lt!279833 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279837 vacantSpotIndex!68 (select (arr!17931 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!611652 (= lt!279844 (select (store (arr!17931 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!279831 () Unit!19606)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37370 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19606)

(assert (=> b!611652 (= lt!279831 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279837 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!611652 (= lt!279837 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!611653 () Bool)

(assert (=> b!611653 (= e!350520 e!350526)))

(declare-fun res!393348 () Bool)

(assert (=> b!611653 (=> (not res!393348) (not e!350526))))

(declare-fun lt!279838 () SeekEntryResult!6371)

(assert (=> b!611653 (= res!393348 (or (= lt!279838 (MissingZero!6371 i!1108)) (= lt!279838 (MissingVacant!6371 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37370 (_ BitVec 32)) SeekEntryResult!6371)

(assert (=> b!611653 (= lt!279838 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!611654 () Bool)

(declare-fun e!350529 () Bool)

(assert (=> b!611654 (= e!350529 true)))

(assert (=> b!611654 (arrayNoDuplicates!0 lt!279835 #b00000000000000000000000000000000 Nil!11969)))

(declare-fun lt!279836 () Unit!19606)

(assert (=> b!611654 (= lt!279836 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11969))))

(assert (=> b!611654 (arrayContainsKey!0 lt!279835 (select (arr!17931 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279829 () Unit!19606)

(assert (=> b!611654 (= lt!279829 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279835 (select (arr!17931 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!611654 e!350519))

(declare-fun res!393365 () Bool)

(assert (=> b!611654 (=> (not res!393365) (not e!350519))))

(assert (=> b!611654 (= res!393365 (arrayContainsKey!0 lt!279835 (select (arr!17931 a!2986) j!136) j!136))))

(declare-fun b!611655 () Bool)

(declare-fun res!393353 () Bool)

(assert (=> b!611655 (=> (not res!393353) (not e!350526))))

(assert (=> b!611655 (= res!393353 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11969))))

(declare-fun b!611656 () Bool)

(assert (=> b!611656 (= e!350518 e!350527)))

(declare-fun res!393357 () Bool)

(assert (=> b!611656 (=> (not res!393357) (not e!350527))))

(declare-fun lt!279840 () SeekEntryResult!6371)

(assert (=> b!611656 (= res!393357 (and (= lt!279840 (Found!6371 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17931 a!2986) index!984) (select (arr!17931 a!2986) j!136))) (not (= (select (arr!17931 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!611656 (= lt!279840 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17931 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611657 () Bool)

(assert (=> b!611657 (= e!350522 e!350523)))

(declare-fun res!393358 () Bool)

(assert (=> b!611657 (=> (not res!393358) (not e!350523))))

(assert (=> b!611657 (= res!393358 (arrayContainsKey!0 lt!279835 (select (arr!17931 a!2986) j!136) j!136))))

(declare-fun b!611658 () Bool)

(assert (=> b!611658 (= e!350521 (= lt!279840 lt!279833))))

(declare-fun b!611659 () Bool)

(declare-fun Unit!19611 () Unit!19606)

(assert (=> b!611659 (= e!350528 Unit!19611)))

(declare-fun b!611660 () Bool)

(declare-fun res!393356 () Bool)

(assert (=> b!611660 (=> (not res!393356) (not e!350520))))

(assert (=> b!611660 (= res!393356 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!611661 () Bool)

(assert (=> b!611661 (= e!350516 e!350529)))

(declare-fun res!393350 () Bool)

(assert (=> b!611661 (=> res!393350 e!350529)))

(assert (=> b!611661 (= res!393350 (bvsge index!984 j!136))))

(declare-fun lt!279830 () Unit!19606)

(assert (=> b!611661 (= lt!279830 e!350528)))

(declare-fun c!69514 () Bool)

(assert (=> b!611661 (= c!69514 (bvslt j!136 index!984))))

(declare-fun b!611662 () Bool)

(declare-fun res!393362 () Bool)

(assert (=> b!611662 (=> (not res!393362) (not e!350526))))

(assert (=> b!611662 (= res!393362 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17931 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611663 () Bool)

(declare-fun res!393347 () Bool)

(assert (=> b!611663 (=> (not res!393347) (not e!350520))))

(assert (=> b!611663 (= res!393347 (and (= (size!18295 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18295 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18295 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!55900 res!393359) b!611663))

(assert (= (and b!611663 res!393347) b!611651))

(assert (= (and b!611651 res!393364) b!611644))

(assert (= (and b!611644 res!393351) b!611660))

(assert (= (and b!611660 res!393356) b!611653))

(assert (= (and b!611653 res!393348) b!611647))

(assert (= (and b!611647 res!393361) b!611655))

(assert (= (and b!611655 res!393353) b!611662))

(assert (= (and b!611662 res!393362) b!611648))

(assert (= (and b!611648 res!393354) b!611656))

(assert (= (and b!611656 res!393357) b!611652))

(assert (= (and b!611652 res!393355) b!611658))

(assert (= (and b!611652 c!69515) b!611646))

(assert (= (and b!611652 (not c!69515)) b!611645))

(assert (= (and b!611652 (not res!393360)) b!611643))

(assert (= (and b!611643 res!393352) b!611650))

(assert (= (and b!611650 (not res!393363)) b!611657))

(assert (= (and b!611657 res!393358) b!611641))

(assert (= (and b!611643 (not res!393349)) b!611661))

(assert (= (and b!611661 c!69514) b!611649))

(assert (= (and b!611661 (not c!69514)) b!611659))

(assert (= (and b!611661 (not res!393350)) b!611654))

(assert (= (and b!611654 res!393365) b!611642))

(declare-fun m!588047 () Bool)

(assert (=> b!611648 m!588047))

(declare-fun m!588049 () Bool)

(assert (=> b!611648 m!588049))

(declare-fun m!588051 () Bool)

(assert (=> b!611651 m!588051))

(assert (=> b!611651 m!588051))

(declare-fun m!588053 () Bool)

(assert (=> b!611651 m!588053))

(assert (=> b!611649 m!588051))

(assert (=> b!611649 m!588051))

(declare-fun m!588055 () Bool)

(assert (=> b!611649 m!588055))

(assert (=> b!611649 m!588051))

(declare-fun m!588057 () Bool)

(assert (=> b!611649 m!588057))

(declare-fun m!588059 () Bool)

(assert (=> b!611649 m!588059))

(declare-fun m!588061 () Bool)

(assert (=> b!611649 m!588061))

(declare-fun m!588063 () Bool)

(assert (=> b!611649 m!588063))

(assert (=> b!611649 m!588051))

(declare-fun m!588065 () Bool)

(assert (=> b!611649 m!588065))

(declare-fun m!588067 () Bool)

(assert (=> b!611649 m!588067))

(assert (=> b!611642 m!588051))

(assert (=> b!611642 m!588051))

(declare-fun m!588069 () Bool)

(assert (=> b!611642 m!588069))

(assert (=> b!611641 m!588051))

(assert (=> b!611641 m!588051))

(assert (=> b!611641 m!588069))

(declare-fun m!588071 () Bool)

(assert (=> b!611655 m!588071))

(declare-fun m!588073 () Bool)

(assert (=> b!611662 m!588073))

(declare-fun m!588075 () Bool)

(assert (=> b!611660 m!588075))

(declare-fun m!588077 () Bool)

(assert (=> start!55900 m!588077))

(declare-fun m!588079 () Bool)

(assert (=> start!55900 m!588079))

(declare-fun m!588081 () Bool)

(assert (=> b!611644 m!588081))

(declare-fun m!588083 () Bool)

(assert (=> b!611656 m!588083))

(assert (=> b!611656 m!588051))

(assert (=> b!611656 m!588051))

(declare-fun m!588085 () Bool)

(assert (=> b!611656 m!588085))

(assert (=> b!611654 m!588051))

(assert (=> b!611654 m!588051))

(declare-fun m!588087 () Bool)

(assert (=> b!611654 m!588087))

(assert (=> b!611654 m!588051))

(declare-fun m!588089 () Bool)

(assert (=> b!611654 m!588089))

(assert (=> b!611654 m!588059))

(assert (=> b!611654 m!588051))

(declare-fun m!588091 () Bool)

(assert (=> b!611654 m!588091))

(assert (=> b!611654 m!588067))

(declare-fun m!588093 () Bool)

(assert (=> b!611647 m!588093))

(declare-fun m!588095 () Bool)

(assert (=> b!611653 m!588095))

(assert (=> b!611650 m!588051))

(declare-fun m!588097 () Bool)

(assert (=> b!611652 m!588097))

(assert (=> b!611652 m!588051))

(assert (=> b!611652 m!588047))

(assert (=> b!611652 m!588051))

(declare-fun m!588099 () Bool)

(assert (=> b!611652 m!588099))

(declare-fun m!588101 () Bool)

(assert (=> b!611652 m!588101))

(declare-fun m!588103 () Bool)

(assert (=> b!611652 m!588103))

(declare-fun m!588105 () Bool)

(assert (=> b!611652 m!588105))

(declare-fun m!588107 () Bool)

(assert (=> b!611652 m!588107))

(assert (=> b!611657 m!588051))

(assert (=> b!611657 m!588051))

(assert (=> b!611657 m!588089))

(assert (=> b!611643 m!588051))

(assert (=> b!611643 m!588047))

(declare-fun m!588109 () Bool)

(assert (=> b!611643 m!588109))

(push 1)

