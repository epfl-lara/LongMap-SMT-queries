; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56100 () Bool)

(assert start!56100)

(declare-fun b!619073 () Bool)

(declare-fun e!355043 () Bool)

(assert (=> b!619073 (= e!355043 true)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37570 0))(
  ( (array!37571 (arr!18031 (Array (_ BitVec 32) (_ BitVec 64))) (size!18395 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37570)

(assert (=> b!619073 (= (select (store (arr!18031 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619074 () Bool)

(declare-fun res!398887 () Bool)

(declare-fun e!355046 () Bool)

(assert (=> b!619074 (=> (not res!398887) (not e!355046))))

(declare-datatypes ((List!12072 0))(
  ( (Nil!12069) (Cons!12068 (h!13113 (_ BitVec 64)) (t!18300 List!12072)) )
))
(declare-fun arrayNoDuplicates!0 (array!37570 (_ BitVec 32) List!12072) Bool)

(assert (=> b!619074 (= res!398887 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12069))))

(declare-fun b!619075 () Bool)

(assert (=> b!619075 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!285630 () array!37570)

(declare-datatypes ((Unit!20438 0))(
  ( (Unit!20439) )
))
(declare-fun lt!285626 () Unit!20438)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37570 (_ BitVec 64) (_ BitVec 32) List!12072) Unit!20438)

(assert (=> b!619075 (= lt!285626 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285630 (select (arr!18031 a!2986) j!136) index!984 Nil!12069))))

(assert (=> b!619075 (arrayNoDuplicates!0 lt!285630 index!984 Nil!12069)))

(declare-fun lt!285621 () Unit!20438)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37570 (_ BitVec 32) (_ BitVec 32)) Unit!20438)

(assert (=> b!619075 (= lt!285621 (lemmaNoDuplicateFromThenFromBigger!0 lt!285630 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619075 (arrayNoDuplicates!0 lt!285630 #b00000000000000000000000000000000 Nil!12069)))

(declare-fun lt!285622 () Unit!20438)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37570 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12072) Unit!20438)

(assert (=> b!619075 (= lt!285622 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12069))))

(declare-fun arrayContainsKey!0 (array!37570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619075 (arrayContainsKey!0 lt!285630 (select (arr!18031 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285618 () Unit!20438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37570 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20438)

(assert (=> b!619075 (= lt!285618 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285630 (select (arr!18031 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!355039 () Bool)

(assert (=> b!619075 e!355039))

(declare-fun res!398882 () Bool)

(assert (=> b!619075 (=> (not res!398882) (not e!355039))))

(assert (=> b!619075 (= res!398882 (arrayContainsKey!0 lt!285630 (select (arr!18031 a!2986) j!136) j!136))))

(declare-fun e!355033 () Unit!20438)

(declare-fun Unit!20440 () Unit!20438)

(assert (=> b!619075 (= e!355033 Unit!20440)))

(declare-fun b!619076 () Bool)

(declare-fun e!355034 () Bool)

(declare-fun e!355040 () Bool)

(assert (=> b!619076 (= e!355034 e!355040)))

(declare-fun res!398889 () Bool)

(assert (=> b!619076 (=> (not res!398889) (not e!355040))))

(declare-datatypes ((SeekEntryResult!6471 0))(
  ( (MissingZero!6471 (index!28168 (_ BitVec 32))) (Found!6471 (index!28169 (_ BitVec 32))) (Intermediate!6471 (undefined!7283 Bool) (index!28170 (_ BitVec 32)) (x!56951 (_ BitVec 32))) (Undefined!6471) (MissingVacant!6471 (index!28171 (_ BitVec 32))) )
))
(declare-fun lt!285631 () SeekEntryResult!6471)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!619076 (= res!398889 (and (= lt!285631 (Found!6471 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18031 a!2986) index!984) (select (arr!18031 a!2986) j!136))) (not (= (select (arr!18031 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37570 (_ BitVec 32)) SeekEntryResult!6471)

(assert (=> b!619076 (= lt!285631 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18031 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!619077 () Bool)

(assert (=> b!619077 (= e!355040 (not e!355043))))

(declare-fun res!398877 () Bool)

(assert (=> b!619077 (=> res!398877 e!355043)))

(declare-fun lt!285620 () SeekEntryResult!6471)

(assert (=> b!619077 (= res!398877 (not (= lt!285620 (MissingVacant!6471 vacantSpotIndex!68))))))

(declare-fun lt!285627 () Unit!20438)

(declare-fun e!355035 () Unit!20438)

(assert (=> b!619077 (= lt!285627 e!355035)))

(declare-fun c!70469 () Bool)

(assert (=> b!619077 (= c!70469 (= lt!285620 (Found!6471 index!984)))))

(declare-fun lt!285629 () Unit!20438)

(declare-fun e!355041 () Unit!20438)

(assert (=> b!619077 (= lt!285629 e!355041)))

(declare-fun c!70468 () Bool)

(assert (=> b!619077 (= c!70468 (= lt!285620 Undefined!6471))))

(declare-fun lt!285637 () (_ BitVec 64))

(assert (=> b!619077 (= lt!285620 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285637 lt!285630 mask!3053))))

(declare-fun e!355036 () Bool)

(assert (=> b!619077 e!355036))

(declare-fun res!398875 () Bool)

(assert (=> b!619077 (=> (not res!398875) (not e!355036))))

(declare-fun lt!285632 () (_ BitVec 32))

(declare-fun lt!285625 () SeekEntryResult!6471)

(assert (=> b!619077 (= res!398875 (= lt!285625 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285632 vacantSpotIndex!68 lt!285637 lt!285630 mask!3053)))))

(assert (=> b!619077 (= lt!285625 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285632 vacantSpotIndex!68 (select (arr!18031 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619077 (= lt!285637 (select (store (arr!18031 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!285628 () Unit!20438)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37570 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20438)

(assert (=> b!619077 (= lt!285628 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285632 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619077 (= lt!285632 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!398879 () Bool)

(declare-fun b!619078 () Bool)

(assert (=> b!619078 (= res!398879 (arrayContainsKey!0 lt!285630 (select (arr!18031 a!2986) j!136) j!136))))

(declare-fun e!355047 () Bool)

(assert (=> b!619078 (=> (not res!398879) (not e!355047))))

(declare-fun e!355037 () Bool)

(assert (=> b!619078 (= e!355037 e!355047)))

(declare-fun b!619079 () Bool)

(declare-fun Unit!20441 () Unit!20438)

(assert (=> b!619079 (= e!355035 Unit!20441)))

(declare-fun b!619080 () Bool)

(declare-fun Unit!20442 () Unit!20438)

(assert (=> b!619080 (= e!355033 Unit!20442)))

(declare-fun b!619081 () Bool)

(declare-fun res!398876 () Bool)

(assert (=> b!619081 (= res!398876 (bvsge j!136 index!984))))

(assert (=> b!619081 (=> res!398876 e!355037)))

(declare-fun e!355045 () Bool)

(assert (=> b!619081 (= e!355045 e!355037)))

(declare-fun b!619082 () Bool)

(declare-fun e!355044 () Unit!20438)

(declare-fun Unit!20443 () Unit!20438)

(assert (=> b!619082 (= e!355044 Unit!20443)))

(declare-fun b!619083 () Bool)

(declare-fun res!398888 () Bool)

(assert (=> b!619083 (=> (not res!398888) (not e!355046))))

(assert (=> b!619083 (= res!398888 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18031 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619084 () Bool)

(assert (=> b!619084 (= e!355047 (arrayContainsKey!0 lt!285630 (select (arr!18031 a!2986) j!136) index!984))))

(declare-fun res!398884 () Bool)

(declare-fun e!355038 () Bool)

(assert (=> start!56100 (=> (not res!398884) (not e!355038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56100 (= res!398884 (validMask!0 mask!3053))))

(assert (=> start!56100 e!355038))

(assert (=> start!56100 true))

(declare-fun array_inv!13827 (array!37570) Bool)

(assert (=> start!56100 (array_inv!13827 a!2986)))

(declare-fun b!619085 () Bool)

(assert (=> b!619085 (= e!355036 (= lt!285631 lt!285625))))

(declare-fun b!619086 () Bool)

(declare-fun res!398881 () Bool)

(assert (=> b!619086 (=> (not res!398881) (not e!355038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619086 (= res!398881 (validKeyInArray!0 (select (arr!18031 a!2986) j!136)))))

(declare-fun b!619087 () Bool)

(declare-fun Unit!20444 () Unit!20438)

(assert (=> b!619087 (= e!355041 Unit!20444)))

(declare-fun b!619088 () Bool)

(declare-fun Unit!20445 () Unit!20438)

(assert (=> b!619088 (= e!355041 Unit!20445)))

(assert (=> b!619088 false))

(declare-fun b!619089 () Bool)

(assert (=> b!619089 (= e!355039 (arrayContainsKey!0 lt!285630 (select (arr!18031 a!2986) j!136) index!984))))

(declare-fun b!619090 () Bool)

(declare-fun res!398878 () Bool)

(assert (=> b!619090 (=> (not res!398878) (not e!355038))))

(assert (=> b!619090 (= res!398878 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619091 () Bool)

(assert (=> b!619091 (= e!355046 e!355034)))

(declare-fun res!398880 () Bool)

(assert (=> b!619091 (=> (not res!398880) (not e!355034))))

(assert (=> b!619091 (= res!398880 (= (select (store (arr!18031 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619091 (= lt!285630 (array!37571 (store (arr!18031 a!2986) i!1108 k0!1786) (size!18395 a!2986)))))

(declare-fun b!619092 () Bool)

(declare-fun Unit!20446 () Unit!20438)

(assert (=> b!619092 (= e!355035 Unit!20446)))

(declare-fun res!398885 () Bool)

(assert (=> b!619092 (= res!398885 (= (select (store (arr!18031 a!2986) i!1108 k0!1786) index!984) (select (arr!18031 a!2986) j!136)))))

(assert (=> b!619092 (=> (not res!398885) (not e!355045))))

(assert (=> b!619092 e!355045))

(declare-fun c!70466 () Bool)

(assert (=> b!619092 (= c!70466 (bvslt j!136 index!984))))

(declare-fun lt!285619 () Unit!20438)

(assert (=> b!619092 (= lt!285619 e!355044)))

(declare-fun c!70467 () Bool)

(assert (=> b!619092 (= c!70467 (bvslt index!984 j!136))))

(declare-fun lt!285635 () Unit!20438)

(assert (=> b!619092 (= lt!285635 e!355033)))

(assert (=> b!619092 false))

(declare-fun b!619093 () Bool)

(assert (=> b!619093 (= e!355038 e!355046)))

(declare-fun res!398886 () Bool)

(assert (=> b!619093 (=> (not res!398886) (not e!355046))))

(declare-fun lt!285623 () SeekEntryResult!6471)

(assert (=> b!619093 (= res!398886 (or (= lt!285623 (MissingZero!6471 i!1108)) (= lt!285623 (MissingVacant!6471 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37570 (_ BitVec 32)) SeekEntryResult!6471)

(assert (=> b!619093 (= lt!285623 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!619094 () Bool)

(declare-fun res!398890 () Bool)

(assert (=> b!619094 (=> (not res!398890) (not e!355038))))

(assert (=> b!619094 (= res!398890 (and (= (size!18395 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18395 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18395 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619095 () Bool)

(declare-fun res!398883 () Bool)

(assert (=> b!619095 (=> (not res!398883) (not e!355038))))

(assert (=> b!619095 (= res!398883 (validKeyInArray!0 k0!1786))))

(declare-fun b!619096 () Bool)

(declare-fun res!398891 () Bool)

(assert (=> b!619096 (=> (not res!398891) (not e!355046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37570 (_ BitVec 32)) Bool)

(assert (=> b!619096 (= res!398891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619097 () Bool)

(assert (=> b!619097 false))

(declare-fun lt!285636 () Unit!20438)

(assert (=> b!619097 (= lt!285636 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285630 (select (arr!18031 a!2986) j!136) j!136 Nil!12069))))

(assert (=> b!619097 (arrayNoDuplicates!0 lt!285630 j!136 Nil!12069)))

(declare-fun lt!285634 () Unit!20438)

(assert (=> b!619097 (= lt!285634 (lemmaNoDuplicateFromThenFromBigger!0 lt!285630 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619097 (arrayNoDuplicates!0 lt!285630 #b00000000000000000000000000000000 Nil!12069)))

(declare-fun lt!285624 () Unit!20438)

(assert (=> b!619097 (= lt!285624 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12069))))

(assert (=> b!619097 (arrayContainsKey!0 lt!285630 (select (arr!18031 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285633 () Unit!20438)

(assert (=> b!619097 (= lt!285633 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285630 (select (arr!18031 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20447 () Unit!20438)

(assert (=> b!619097 (= e!355044 Unit!20447)))

(assert (= (and start!56100 res!398884) b!619094))

(assert (= (and b!619094 res!398890) b!619086))

(assert (= (and b!619086 res!398881) b!619095))

(assert (= (and b!619095 res!398883) b!619090))

(assert (= (and b!619090 res!398878) b!619093))

(assert (= (and b!619093 res!398886) b!619096))

(assert (= (and b!619096 res!398891) b!619074))

(assert (= (and b!619074 res!398887) b!619083))

(assert (= (and b!619083 res!398888) b!619091))

(assert (= (and b!619091 res!398880) b!619076))

(assert (= (and b!619076 res!398889) b!619077))

(assert (= (and b!619077 res!398875) b!619085))

(assert (= (and b!619077 c!70468) b!619088))

(assert (= (and b!619077 (not c!70468)) b!619087))

(assert (= (and b!619077 c!70469) b!619092))

(assert (= (and b!619077 (not c!70469)) b!619079))

(assert (= (and b!619092 res!398885) b!619081))

(assert (= (and b!619081 (not res!398876)) b!619078))

(assert (= (and b!619078 res!398879) b!619084))

(assert (= (and b!619092 c!70466) b!619097))

(assert (= (and b!619092 (not c!70466)) b!619082))

(assert (= (and b!619092 c!70467) b!619075))

(assert (= (and b!619092 (not c!70467)) b!619080))

(assert (= (and b!619075 res!398882) b!619089))

(assert (= (and b!619077 (not res!398877)) b!619073))

(declare-fun m!595071 () Bool)

(assert (=> start!56100 m!595071))

(declare-fun m!595073 () Bool)

(assert (=> start!56100 m!595073))

(declare-fun m!595075 () Bool)

(assert (=> b!619095 m!595075))

(declare-fun m!595077 () Bool)

(assert (=> b!619093 m!595077))

(declare-fun m!595079 () Bool)

(assert (=> b!619096 m!595079))

(declare-fun m!595081 () Bool)

(assert (=> b!619089 m!595081))

(assert (=> b!619089 m!595081))

(declare-fun m!595083 () Bool)

(assert (=> b!619089 m!595083))

(declare-fun m!595085 () Bool)

(assert (=> b!619092 m!595085))

(declare-fun m!595087 () Bool)

(assert (=> b!619092 m!595087))

(assert (=> b!619092 m!595081))

(declare-fun m!595089 () Bool)

(assert (=> b!619074 m!595089))

(assert (=> b!619073 m!595085))

(assert (=> b!619073 m!595087))

(declare-fun m!595091 () Bool)

(assert (=> b!619090 m!595091))

(assert (=> b!619097 m!595081))

(declare-fun m!595093 () Bool)

(assert (=> b!619097 m!595093))

(declare-fun m!595095 () Bool)

(assert (=> b!619097 m!595095))

(assert (=> b!619097 m!595081))

(declare-fun m!595097 () Bool)

(assert (=> b!619097 m!595097))

(assert (=> b!619097 m!595081))

(declare-fun m!595099 () Bool)

(assert (=> b!619097 m!595099))

(declare-fun m!595101 () Bool)

(assert (=> b!619097 m!595101))

(declare-fun m!595103 () Bool)

(assert (=> b!619097 m!595103))

(assert (=> b!619097 m!595081))

(declare-fun m!595105 () Bool)

(assert (=> b!619097 m!595105))

(assert (=> b!619075 m!595081))

(declare-fun m!595107 () Bool)

(assert (=> b!619075 m!595107))

(assert (=> b!619075 m!595081))

(declare-fun m!595109 () Bool)

(assert (=> b!619075 m!595109))

(assert (=> b!619075 m!595081))

(declare-fun m!595111 () Bool)

(assert (=> b!619075 m!595111))

(assert (=> b!619075 m!595081))

(declare-fun m!595113 () Bool)

(assert (=> b!619075 m!595113))

(assert (=> b!619075 m!595081))

(declare-fun m!595115 () Bool)

(assert (=> b!619075 m!595115))

(assert (=> b!619075 m!595103))

(declare-fun m!595117 () Bool)

(assert (=> b!619075 m!595117))

(assert (=> b!619075 m!595101))

(assert (=> b!619091 m!595085))

(declare-fun m!595119 () Bool)

(assert (=> b!619091 m!595119))

(declare-fun m!595121 () Bool)

(assert (=> b!619083 m!595121))

(assert (=> b!619078 m!595081))

(assert (=> b!619078 m!595081))

(assert (=> b!619078 m!595113))

(declare-fun m!595123 () Bool)

(assert (=> b!619077 m!595123))

(declare-fun m!595125 () Bool)

(assert (=> b!619077 m!595125))

(declare-fun m!595127 () Bool)

(assert (=> b!619077 m!595127))

(assert (=> b!619077 m!595081))

(assert (=> b!619077 m!595085))

(declare-fun m!595129 () Bool)

(assert (=> b!619077 m!595129))

(declare-fun m!595131 () Bool)

(assert (=> b!619077 m!595131))

(assert (=> b!619077 m!595081))

(declare-fun m!595133 () Bool)

(assert (=> b!619077 m!595133))

(assert (=> b!619084 m!595081))

(assert (=> b!619084 m!595081))

(assert (=> b!619084 m!595083))

(assert (=> b!619086 m!595081))

(assert (=> b!619086 m!595081))

(declare-fun m!595135 () Bool)

(assert (=> b!619086 m!595135))

(declare-fun m!595137 () Bool)

(assert (=> b!619076 m!595137))

(assert (=> b!619076 m!595081))

(assert (=> b!619076 m!595081))

(declare-fun m!595139 () Bool)

(assert (=> b!619076 m!595139))

(check-sat (not b!619090) (not b!619086) (not b!619096) (not b!619095) (not b!619084) (not b!619075) (not b!619077) (not b!619093) (not b!619097) (not b!619089) (not b!619078) (not b!619074) (not b!619076) (not start!56100))
(check-sat)
