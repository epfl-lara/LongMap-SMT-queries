; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59094 () Bool)

(assert start!59094)

(declare-fun b!651880 () Bool)

(declare-fun res!422651 () Bool)

(declare-fun e!374111 () Bool)

(assert (=> b!651880 (=> (not res!422651) (not e!374111))))

(declare-datatypes ((array!38594 0))(
  ( (array!38595 (arr!18500 (Array (_ BitVec 32) (_ BitVec 64))) (size!18864 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38594)

(declare-datatypes ((List!12541 0))(
  ( (Nil!12538) (Cons!12537 (h!13582 (_ BitVec 64)) (t!18769 List!12541)) )
))
(declare-fun arrayNoDuplicates!0 (array!38594 (_ BitVec 32) List!12541) Bool)

(assert (=> b!651880 (= res!422651 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12538))))

(declare-fun b!651881 () Bool)

(declare-fun res!422658 () Bool)

(declare-fun e!374120 () Bool)

(assert (=> b!651881 (=> (not res!422658) (not e!374120))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!651881 (= res!422658 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!651882 () Bool)

(declare-fun res!422652 () Bool)

(assert (=> b!651882 (=> (not res!422652) (not e!374120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!651882 (= res!422652 (validKeyInArray!0 k!1786))))

(declare-fun b!651883 () Bool)

(assert (=> b!651883 (= e!374120 e!374111)))

(declare-fun res!422660 () Bool)

(assert (=> b!651883 (=> (not res!422660) (not e!374111))))

(declare-datatypes ((SeekEntryResult!6940 0))(
  ( (MissingZero!6940 (index!30113 (_ BitVec 32))) (Found!6940 (index!30114 (_ BitVec 32))) (Intermediate!6940 (undefined!7752 Bool) (index!30115 (_ BitVec 32)) (x!58899 (_ BitVec 32))) (Undefined!6940) (MissingVacant!6940 (index!30116 (_ BitVec 32))) )
))
(declare-fun lt!303179 () SeekEntryResult!6940)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!651883 (= res!422660 (or (= lt!303179 (MissingZero!6940 i!1108)) (= lt!303179 (MissingVacant!6940 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38594 (_ BitVec 32)) SeekEntryResult!6940)

(assert (=> b!651883 (= lt!303179 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!651884 () Bool)

(declare-fun res!422657 () Bool)

(assert (=> b!651884 (=> (not res!422657) (not e!374111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38594 (_ BitVec 32)) Bool)

(assert (=> b!651884 (= res!422657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!651885 () Bool)

(declare-fun e!374112 () Bool)

(declare-fun e!374107 () Bool)

(assert (=> b!651885 (= e!374112 e!374107)))

(declare-fun res!422666 () Bool)

(assert (=> b!651885 (=> res!422666 e!374107)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!303170 () (_ BitVec 64))

(declare-fun lt!303187 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!651885 (= res!422666 (or (not (= (select (arr!18500 a!2986) j!136) lt!303187)) (not (= (select (arr!18500 a!2986) j!136) lt!303170)) (bvsge j!136 index!984)))))

(declare-fun b!651886 () Bool)

(declare-fun res!422649 () Bool)

(assert (=> b!651886 (=> (not res!422649) (not e!374120))))

(assert (=> b!651886 (= res!422649 (and (= (size!18864 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18864 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18864 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!422648 () Bool)

(assert (=> start!59094 (=> (not res!422648) (not e!374120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59094 (= res!422648 (validMask!0 mask!3053))))

(assert (=> start!59094 e!374120))

(assert (=> start!59094 true))

(declare-fun array_inv!14296 (array!38594) Bool)

(assert (=> start!59094 (array_inv!14296 a!2986)))

(declare-fun b!651887 () Bool)

(declare-fun e!374119 () Bool)

(assert (=> b!651887 (= e!374119 true)))

(declare-fun lt!303184 () array!38594)

(assert (=> b!651887 (arrayNoDuplicates!0 lt!303184 index!984 Nil!12538)))

(declare-datatypes ((Unit!22266 0))(
  ( (Unit!22267) )
))
(declare-fun lt!303177 () Unit!22266)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38594 (_ BitVec 32) (_ BitVec 32)) Unit!22266)

(assert (=> b!651887 (= lt!303177 (lemmaNoDuplicateFromThenFromBigger!0 lt!303184 #b00000000000000000000000000000000 index!984))))

(assert (=> b!651887 (arrayNoDuplicates!0 lt!303184 #b00000000000000000000000000000000 Nil!12538)))

(declare-fun lt!303175 () Unit!22266)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38594 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12541) Unit!22266)

(assert (=> b!651887 (= lt!303175 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12538))))

(assert (=> b!651887 (arrayContainsKey!0 lt!303184 (select (arr!18500 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303180 () Unit!22266)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38594 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22266)

(assert (=> b!651887 (= lt!303180 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303184 (select (arr!18500 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!374121 () Bool)

(assert (=> b!651887 e!374121))

(declare-fun res!422662 () Bool)

(assert (=> b!651887 (=> (not res!422662) (not e!374121))))

(assert (=> b!651887 (= res!422662 (arrayContainsKey!0 lt!303184 (select (arr!18500 a!2986) j!136) j!136))))

(declare-fun b!651888 () Bool)

(declare-fun e!374110 () Unit!22266)

(declare-fun Unit!22268 () Unit!22266)

(assert (=> b!651888 (= e!374110 Unit!22268)))

(declare-fun lt!303186 () Unit!22266)

(assert (=> b!651888 (= lt!303186 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303184 (select (arr!18500 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!651888 (arrayContainsKey!0 lt!303184 (select (arr!18500 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303181 () Unit!22266)

(assert (=> b!651888 (= lt!303181 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12538))))

(assert (=> b!651888 (arrayNoDuplicates!0 lt!303184 #b00000000000000000000000000000000 Nil!12538)))

(declare-fun lt!303172 () Unit!22266)

(assert (=> b!651888 (= lt!303172 (lemmaNoDuplicateFromThenFromBigger!0 lt!303184 #b00000000000000000000000000000000 j!136))))

(assert (=> b!651888 (arrayNoDuplicates!0 lt!303184 j!136 Nil!12538)))

(declare-fun lt!303183 () Unit!22266)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38594 (_ BitVec 64) (_ BitVec 32) List!12541) Unit!22266)

(assert (=> b!651888 (= lt!303183 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303184 (select (arr!18500 a!2986) j!136) j!136 Nil!12538))))

(assert (=> b!651888 false))

(declare-fun b!651889 () Bool)

(declare-fun e!374109 () Bool)

(declare-fun e!374116 () Bool)

(assert (=> b!651889 (= e!374109 e!374116)))

(declare-fun res!422661 () Bool)

(assert (=> b!651889 (=> (not res!422661) (not e!374116))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!303174 () SeekEntryResult!6940)

(assert (=> b!651889 (= res!422661 (and (= lt!303174 (Found!6940 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18500 a!2986) index!984) (select (arr!18500 a!2986) j!136))) (not (= (select (arr!18500 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38594 (_ BitVec 32)) SeekEntryResult!6940)

(assert (=> b!651889 (= lt!303174 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18500 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651890 () Bool)

(declare-fun res!422663 () Bool)

(assert (=> b!651890 (=> (not res!422663) (not e!374111))))

(assert (=> b!651890 (= res!422663 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18500 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!651891 () Bool)

(declare-fun e!374108 () Bool)

(assert (=> b!651891 (= e!374108 e!374119)))

(declare-fun res!422653 () Bool)

(assert (=> b!651891 (=> res!422653 e!374119)))

(assert (=> b!651891 (= res!422653 (bvsge index!984 j!136))))

(declare-fun lt!303176 () Unit!22266)

(assert (=> b!651891 (= lt!303176 e!374110)))

(declare-fun c!74983 () Bool)

(assert (=> b!651891 (= c!74983 (bvslt j!136 index!984))))

(declare-fun b!651892 () Bool)

(declare-fun e!374117 () Unit!22266)

(declare-fun Unit!22269 () Unit!22266)

(assert (=> b!651892 (= e!374117 Unit!22269)))

(assert (=> b!651892 false))

(declare-fun b!651893 () Bool)

(assert (=> b!651893 (= e!374121 (arrayContainsKey!0 lt!303184 (select (arr!18500 a!2986) j!136) index!984))))

(declare-fun b!651894 () Bool)

(declare-fun e!374114 () Bool)

(declare-fun lt!303182 () SeekEntryResult!6940)

(assert (=> b!651894 (= e!374114 (= lt!303174 lt!303182))))

(declare-fun b!651895 () Bool)

(declare-fun Unit!22270 () Unit!22266)

(assert (=> b!651895 (= e!374117 Unit!22270)))

(declare-fun b!651896 () Bool)

(declare-fun e!374118 () Bool)

(assert (=> b!651896 (= e!374116 (not e!374118))))

(declare-fun res!422659 () Bool)

(assert (=> b!651896 (=> res!422659 e!374118)))

(declare-fun lt!303173 () SeekEntryResult!6940)

(assert (=> b!651896 (= res!422659 (not (= lt!303173 (Found!6940 index!984))))))

(declare-fun lt!303185 () Unit!22266)

(assert (=> b!651896 (= lt!303185 e!374117)))

(declare-fun c!74984 () Bool)

(assert (=> b!651896 (= c!74984 (= lt!303173 Undefined!6940))))

(assert (=> b!651896 (= lt!303173 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303187 lt!303184 mask!3053))))

(assert (=> b!651896 e!374114))

(declare-fun res!422656 () Bool)

(assert (=> b!651896 (=> (not res!422656) (not e!374114))))

(declare-fun lt!303171 () (_ BitVec 32))

(assert (=> b!651896 (= res!422656 (= lt!303182 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303171 vacantSpotIndex!68 lt!303187 lt!303184 mask!3053)))))

(assert (=> b!651896 (= lt!303182 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303171 vacantSpotIndex!68 (select (arr!18500 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!651896 (= lt!303187 (select (store (arr!18500 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!303178 () Unit!22266)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38594 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22266)

(assert (=> b!651896 (= lt!303178 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303171 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!651896 (= lt!303171 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!651897 () Bool)

(declare-fun Unit!22271 () Unit!22266)

(assert (=> b!651897 (= e!374110 Unit!22271)))

(declare-fun b!651898 () Bool)

(assert (=> b!651898 (= e!374118 e!374108)))

(declare-fun res!422650 () Bool)

(assert (=> b!651898 (=> res!422650 e!374108)))

(assert (=> b!651898 (= res!422650 (or (not (= (select (arr!18500 a!2986) j!136) lt!303187)) (not (= (select (arr!18500 a!2986) j!136) lt!303170))))))

(assert (=> b!651898 e!374112))

(declare-fun res!422665 () Bool)

(assert (=> b!651898 (=> (not res!422665) (not e!374112))))

(assert (=> b!651898 (= res!422665 (= lt!303170 (select (arr!18500 a!2986) j!136)))))

(assert (=> b!651898 (= lt!303170 (select (store (arr!18500 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!651899 () Bool)

(declare-fun res!422655 () Bool)

(assert (=> b!651899 (=> (not res!422655) (not e!374120))))

(assert (=> b!651899 (= res!422655 (validKeyInArray!0 (select (arr!18500 a!2986) j!136)))))

(declare-fun e!374113 () Bool)

(declare-fun b!651900 () Bool)

(assert (=> b!651900 (= e!374113 (arrayContainsKey!0 lt!303184 (select (arr!18500 a!2986) j!136) index!984))))

(declare-fun b!651901 () Bool)

(assert (=> b!651901 (= e!374107 e!374113)))

(declare-fun res!422654 () Bool)

(assert (=> b!651901 (=> (not res!422654) (not e!374113))))

(assert (=> b!651901 (= res!422654 (arrayContainsKey!0 lt!303184 (select (arr!18500 a!2986) j!136) j!136))))

(declare-fun b!651902 () Bool)

(assert (=> b!651902 (= e!374111 e!374109)))

(declare-fun res!422664 () Bool)

(assert (=> b!651902 (=> (not res!422664) (not e!374109))))

(assert (=> b!651902 (= res!422664 (= (select (store (arr!18500 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651902 (= lt!303184 (array!38595 (store (arr!18500 a!2986) i!1108 k!1786) (size!18864 a!2986)))))

(assert (= (and start!59094 res!422648) b!651886))

(assert (= (and b!651886 res!422649) b!651899))

(assert (= (and b!651899 res!422655) b!651882))

(assert (= (and b!651882 res!422652) b!651881))

(assert (= (and b!651881 res!422658) b!651883))

(assert (= (and b!651883 res!422660) b!651884))

(assert (= (and b!651884 res!422657) b!651880))

(assert (= (and b!651880 res!422651) b!651890))

(assert (= (and b!651890 res!422663) b!651902))

(assert (= (and b!651902 res!422664) b!651889))

(assert (= (and b!651889 res!422661) b!651896))

(assert (= (and b!651896 res!422656) b!651894))

(assert (= (and b!651896 c!74984) b!651892))

(assert (= (and b!651896 (not c!74984)) b!651895))

(assert (= (and b!651896 (not res!422659)) b!651898))

(assert (= (and b!651898 res!422665) b!651885))

(assert (= (and b!651885 (not res!422666)) b!651901))

(assert (= (and b!651901 res!422654) b!651900))

(assert (= (and b!651898 (not res!422650)) b!651891))

(assert (= (and b!651891 c!74983) b!651888))

(assert (= (and b!651891 (not c!74983)) b!651897))

(assert (= (and b!651891 (not res!422653)) b!651887))

(assert (= (and b!651887 res!422662) b!651893))

(declare-fun m!625029 () Bool)

(assert (=> b!651887 m!625029))

(assert (=> b!651887 m!625029))

(declare-fun m!625031 () Bool)

(assert (=> b!651887 m!625031))

(assert (=> b!651887 m!625029))

(declare-fun m!625033 () Bool)

(assert (=> b!651887 m!625033))

(declare-fun m!625035 () Bool)

(assert (=> b!651887 m!625035))

(assert (=> b!651887 m!625029))

(declare-fun m!625037 () Bool)

(assert (=> b!651887 m!625037))

(declare-fun m!625039 () Bool)

(assert (=> b!651887 m!625039))

(declare-fun m!625041 () Bool)

(assert (=> b!651887 m!625041))

(declare-fun m!625043 () Bool)

(assert (=> b!651887 m!625043))

(assert (=> b!651901 m!625029))

(assert (=> b!651901 m!625029))

(assert (=> b!651901 m!625031))

(declare-fun m!625045 () Bool)

(assert (=> b!651888 m!625045))

(assert (=> b!651888 m!625029))

(assert (=> b!651888 m!625029))

(declare-fun m!625047 () Bool)

(assert (=> b!651888 m!625047))

(assert (=> b!651888 m!625035))

(declare-fun m!625049 () Bool)

(assert (=> b!651888 m!625049))

(assert (=> b!651888 m!625039))

(assert (=> b!651888 m!625029))

(declare-fun m!625051 () Bool)

(assert (=> b!651888 m!625051))

(assert (=> b!651888 m!625029))

(declare-fun m!625053 () Bool)

(assert (=> b!651888 m!625053))

(assert (=> b!651893 m!625029))

(assert (=> b!651893 m!625029))

(declare-fun m!625055 () Bool)

(assert (=> b!651893 m!625055))

(declare-fun m!625057 () Bool)

(assert (=> b!651889 m!625057))

(assert (=> b!651889 m!625029))

(assert (=> b!651889 m!625029))

(declare-fun m!625059 () Bool)

(assert (=> b!651889 m!625059))

(assert (=> b!651900 m!625029))

(assert (=> b!651900 m!625029))

(assert (=> b!651900 m!625055))

(assert (=> b!651898 m!625029))

(declare-fun m!625061 () Bool)

(assert (=> b!651898 m!625061))

(declare-fun m!625063 () Bool)

(assert (=> b!651898 m!625063))

(declare-fun m!625065 () Bool)

(assert (=> b!651881 m!625065))

(assert (=> b!651902 m!625061))

(declare-fun m!625067 () Bool)

(assert (=> b!651902 m!625067))

(declare-fun m!625069 () Bool)

(assert (=> b!651880 m!625069))

(declare-fun m!625071 () Bool)

(assert (=> b!651890 m!625071))

(assert (=> b!651885 m!625029))

(assert (=> b!651896 m!625029))

(declare-fun m!625073 () Bool)

(assert (=> b!651896 m!625073))

(declare-fun m!625075 () Bool)

(assert (=> b!651896 m!625075))

(declare-fun m!625077 () Bool)

(assert (=> b!651896 m!625077))

(declare-fun m!625079 () Bool)

(assert (=> b!651896 m!625079))

(assert (=> b!651896 m!625029))

(assert (=> b!651896 m!625061))

(declare-fun m!625081 () Bool)

(assert (=> b!651896 m!625081))

(declare-fun m!625083 () Bool)

(assert (=> b!651896 m!625083))

(declare-fun m!625085 () Bool)

(assert (=> b!651882 m!625085))

(declare-fun m!625087 () Bool)

(assert (=> b!651883 m!625087))

(assert (=> b!651899 m!625029))

(assert (=> b!651899 m!625029))

(declare-fun m!625089 () Bool)

(assert (=> b!651899 m!625089))

(declare-fun m!625091 () Bool)

(assert (=> start!59094 m!625091))

(declare-fun m!625093 () Bool)

(assert (=> start!59094 m!625093))

(declare-fun m!625095 () Bool)

(assert (=> b!651884 m!625095))

(push 1)

