; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55142 () Bool)

(assert start!55142)

(declare-fun b!604099 () Bool)

(declare-fun e!345643 () Bool)

(declare-fun e!345633 () Bool)

(assert (=> b!604099 (= e!345643 e!345633)))

(declare-fun res!388093 () Bool)

(assert (=> b!604099 (=> (not res!388093) (not e!345633))))

(declare-datatypes ((SeekEntryResult!6304 0))(
  ( (MissingZero!6304 (index!27479 (_ BitVec 32))) (Found!6304 (index!27480 (_ BitVec 32))) (Intermediate!6304 (undefined!7116 Bool) (index!27481 (_ BitVec 32)) (x!56273 (_ BitVec 32))) (Undefined!6304) (MissingVacant!6304 (index!27482 (_ BitVec 32))) )
))
(declare-fun lt!275430 () SeekEntryResult!6304)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!604099 (= res!388093 (or (= lt!275430 (MissingZero!6304 i!1108)) (= lt!275430 (MissingVacant!6304 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!37215 0))(
  ( (array!37216 (arr!17864 (Array (_ BitVec 32) (_ BitVec 64))) (size!18228 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37215)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37215 (_ BitVec 32)) SeekEntryResult!6304)

(assert (=> b!604099 (= lt!275430 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!604100 () Bool)

(declare-fun res!388090 () Bool)

(assert (=> b!604100 (=> (not res!388090) (not e!345643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604100 (= res!388090 (validKeyInArray!0 k!1786))))

(declare-fun b!604101 () Bool)

(declare-fun e!345636 () Bool)

(declare-fun e!345640 () Bool)

(assert (=> b!604101 (= e!345636 e!345640)))

(declare-fun res!388095 () Bool)

(assert (=> b!604101 (=> (not res!388095) (not e!345640))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!275436 () SeekEntryResult!6304)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!604101 (= res!388095 (and (= lt!275436 (Found!6304 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17864 a!2986) index!984) (select (arr!17864 a!2986) j!136))) (not (= (select (arr!17864 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37215 (_ BitVec 32)) SeekEntryResult!6304)

(assert (=> b!604101 (= lt!275436 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17864 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!388086 () Bool)

(assert (=> start!55142 (=> (not res!388086) (not e!345643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55142 (= res!388086 (validMask!0 mask!3053))))

(assert (=> start!55142 e!345643))

(assert (=> start!55142 true))

(declare-fun array_inv!13660 (array!37215) Bool)

(assert (=> start!55142 (array_inv!13660 a!2986)))

(declare-fun b!604102 () Bool)

(declare-fun res!388079 () Bool)

(assert (=> b!604102 (=> (not res!388079) (not e!345643))))

(assert (=> b!604102 (= res!388079 (and (= (size!18228 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18228 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18228 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604103 () Bool)

(assert (=> b!604103 (= e!345633 e!345636)))

(declare-fun res!388083 () Bool)

(assert (=> b!604103 (=> (not res!388083) (not e!345636))))

(assert (=> b!604103 (= res!388083 (= (select (store (arr!17864 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!275429 () array!37215)

(assert (=> b!604103 (= lt!275429 (array!37216 (store (arr!17864 a!2986) i!1108 k!1786) (size!18228 a!2986)))))

(declare-fun b!604104 () Bool)

(declare-fun e!345635 () Bool)

(declare-fun e!345639 () Bool)

(assert (=> b!604104 (= e!345635 e!345639)))

(declare-fun res!388088 () Bool)

(assert (=> b!604104 (=> res!388088 e!345639)))

(declare-fun lt!275437 () (_ BitVec 64))

(declare-fun lt!275424 () (_ BitVec 64))

(assert (=> b!604104 (= res!388088 (or (not (= (select (arr!17864 a!2986) j!136) lt!275424)) (not (= (select (arr!17864 a!2986) j!136) lt!275437)) (bvsge j!136 index!984)))))

(declare-fun b!604105 () Bool)

(declare-fun res!388085 () Bool)

(assert (=> b!604105 (=> (not res!388085) (not e!345643))))

(declare-fun arrayContainsKey!0 (array!37215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604105 (= res!388085 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!604106 () Bool)

(declare-fun e!345631 () Bool)

(assert (=> b!604106 (= e!345631 true)))

(declare-fun e!345641 () Bool)

(assert (=> b!604106 e!345641))

(declare-fun res!388096 () Bool)

(assert (=> b!604106 (=> (not res!388096) (not e!345641))))

(assert (=> b!604106 (= res!388096 (arrayContainsKey!0 lt!275429 (select (arr!17864 a!2986) j!136) j!136))))

(declare-fun b!604107 () Bool)

(declare-datatypes ((Unit!19204 0))(
  ( (Unit!19205) )
))
(declare-fun e!345637 () Unit!19204)

(declare-fun Unit!19206 () Unit!19204)

(assert (=> b!604107 (= e!345637 Unit!19206)))

(assert (=> b!604107 false))

(declare-fun b!604108 () Bool)

(declare-fun e!345644 () Bool)

(declare-fun lt!275431 () SeekEntryResult!6304)

(assert (=> b!604108 (= e!345644 (= lt!275436 lt!275431))))

(declare-fun b!604109 () Bool)

(declare-fun res!388091 () Bool)

(assert (=> b!604109 (=> (not res!388091) (not e!345633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37215 (_ BitVec 32)) Bool)

(assert (=> b!604109 (= res!388091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!604110 () Bool)

(declare-fun e!345638 () Bool)

(declare-fun e!345642 () Bool)

(assert (=> b!604110 (= e!345638 e!345642)))

(declare-fun res!388089 () Bool)

(assert (=> b!604110 (=> res!388089 e!345642)))

(assert (=> b!604110 (= res!388089 (or (not (= (select (arr!17864 a!2986) j!136) lt!275424)) (not (= (select (arr!17864 a!2986) j!136) lt!275437))))))

(assert (=> b!604110 e!345635))

(declare-fun res!388084 () Bool)

(assert (=> b!604110 (=> (not res!388084) (not e!345635))))

(assert (=> b!604110 (= res!388084 (= lt!275437 (select (arr!17864 a!2986) j!136)))))

(assert (=> b!604110 (= lt!275437 (select (store (arr!17864 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!604111 () Bool)

(declare-fun e!345634 () Bool)

(assert (=> b!604111 (= e!345639 e!345634)))

(declare-fun res!388094 () Bool)

(assert (=> b!604111 (=> (not res!388094) (not e!345634))))

(assert (=> b!604111 (= res!388094 (arrayContainsKey!0 lt!275429 (select (arr!17864 a!2986) j!136) j!136))))

(declare-fun b!604112 () Bool)

(assert (=> b!604112 (= e!345634 (arrayContainsKey!0 lt!275429 (select (arr!17864 a!2986) j!136) index!984))))

(declare-fun b!604113 () Bool)

(declare-fun Unit!19207 () Unit!19204)

(assert (=> b!604113 (= e!345637 Unit!19207)))

(declare-fun b!604114 () Bool)

(declare-fun res!388082 () Bool)

(assert (=> b!604114 (=> (not res!388082) (not e!345633))))

(assert (=> b!604114 (= res!388082 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17864 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604115 () Bool)

(declare-fun res!388097 () Bool)

(assert (=> b!604115 (=> (not res!388097) (not e!345633))))

(declare-datatypes ((List!11905 0))(
  ( (Nil!11902) (Cons!11901 (h!12946 (_ BitVec 64)) (t!18133 List!11905)) )
))
(declare-fun arrayNoDuplicates!0 (array!37215 (_ BitVec 32) List!11905) Bool)

(assert (=> b!604115 (= res!388097 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11902))))

(declare-fun b!604116 () Bool)

(assert (=> b!604116 (= e!345640 (not e!345638))))

(declare-fun res!388080 () Bool)

(assert (=> b!604116 (=> res!388080 e!345638)))

(declare-fun lt!275427 () SeekEntryResult!6304)

(assert (=> b!604116 (= res!388080 (not (= lt!275427 (Found!6304 index!984))))))

(declare-fun lt!275425 () Unit!19204)

(assert (=> b!604116 (= lt!275425 e!345637)))

(declare-fun c!68378 () Bool)

(assert (=> b!604116 (= c!68378 (= lt!275427 Undefined!6304))))

(assert (=> b!604116 (= lt!275427 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275424 lt!275429 mask!3053))))

(assert (=> b!604116 e!345644))

(declare-fun res!388087 () Bool)

(assert (=> b!604116 (=> (not res!388087) (not e!345644))))

(declare-fun lt!275433 () (_ BitVec 32))

(assert (=> b!604116 (= res!388087 (= lt!275431 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275433 vacantSpotIndex!68 lt!275424 lt!275429 mask!3053)))))

(assert (=> b!604116 (= lt!275431 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275433 vacantSpotIndex!68 (select (arr!17864 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!604116 (= lt!275424 (select (store (arr!17864 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!275423 () Unit!19204)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37215 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19204)

(assert (=> b!604116 (= lt!275423 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275433 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604116 (= lt!275433 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!604117 () Bool)

(assert (=> b!604117 (= e!345641 (arrayContainsKey!0 lt!275429 (select (arr!17864 a!2986) j!136) index!984))))

(declare-fun b!604118 () Bool)

(declare-fun e!345632 () Unit!19204)

(declare-fun Unit!19208 () Unit!19204)

(assert (=> b!604118 (= e!345632 Unit!19208)))

(declare-fun lt!275435 () Unit!19204)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37215 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19204)

(assert (=> b!604118 (= lt!275435 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275429 (select (arr!17864 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!604118 (arrayContainsKey!0 lt!275429 (select (arr!17864 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275434 () Unit!19204)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37215 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11905) Unit!19204)

(assert (=> b!604118 (= lt!275434 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11902))))

(assert (=> b!604118 (arrayNoDuplicates!0 lt!275429 #b00000000000000000000000000000000 Nil!11902)))

(declare-fun lt!275426 () Unit!19204)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37215 (_ BitVec 32) (_ BitVec 32)) Unit!19204)

(assert (=> b!604118 (= lt!275426 (lemmaNoDuplicateFromThenFromBigger!0 lt!275429 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604118 (arrayNoDuplicates!0 lt!275429 j!136 Nil!11902)))

(declare-fun lt!275432 () Unit!19204)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37215 (_ BitVec 64) (_ BitVec 32) List!11905) Unit!19204)

(assert (=> b!604118 (= lt!275432 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275429 (select (arr!17864 a!2986) j!136) j!136 Nil!11902))))

(assert (=> b!604118 false))

(declare-fun b!604119 () Bool)

(declare-fun Unit!19209 () Unit!19204)

(assert (=> b!604119 (= e!345632 Unit!19209)))

(declare-fun b!604120 () Bool)

(declare-fun res!388092 () Bool)

(assert (=> b!604120 (=> (not res!388092) (not e!345643))))

(assert (=> b!604120 (= res!388092 (validKeyInArray!0 (select (arr!17864 a!2986) j!136)))))

(declare-fun b!604121 () Bool)

(assert (=> b!604121 (= e!345642 e!345631)))

(declare-fun res!388081 () Bool)

(assert (=> b!604121 (=> res!388081 e!345631)))

(assert (=> b!604121 (= res!388081 (bvsge index!984 j!136))))

(declare-fun lt!275428 () Unit!19204)

(assert (=> b!604121 (= lt!275428 e!345632)))

(declare-fun c!68377 () Bool)

(assert (=> b!604121 (= c!68377 (bvslt j!136 index!984))))

(assert (= (and start!55142 res!388086) b!604102))

(assert (= (and b!604102 res!388079) b!604120))

(assert (= (and b!604120 res!388092) b!604100))

(assert (= (and b!604100 res!388090) b!604105))

(assert (= (and b!604105 res!388085) b!604099))

(assert (= (and b!604099 res!388093) b!604109))

(assert (= (and b!604109 res!388091) b!604115))

(assert (= (and b!604115 res!388097) b!604114))

(assert (= (and b!604114 res!388082) b!604103))

(assert (= (and b!604103 res!388083) b!604101))

(assert (= (and b!604101 res!388095) b!604116))

(assert (= (and b!604116 res!388087) b!604108))

(assert (= (and b!604116 c!68378) b!604107))

(assert (= (and b!604116 (not c!68378)) b!604113))

(assert (= (and b!604116 (not res!388080)) b!604110))

(assert (= (and b!604110 res!388084) b!604104))

(assert (= (and b!604104 (not res!388088)) b!604111))

(assert (= (and b!604111 res!388094) b!604112))

(assert (= (and b!604110 (not res!388089)) b!604121))

(assert (= (and b!604121 c!68377) b!604118))

(assert (= (and b!604121 (not c!68377)) b!604119))

(assert (= (and b!604121 (not res!388081)) b!604106))

(assert (= (and b!604106 res!388096) b!604117))

(declare-fun m!581033 () Bool)

(assert (=> b!604106 m!581033))

(assert (=> b!604106 m!581033))

(declare-fun m!581035 () Bool)

(assert (=> b!604106 m!581035))

(declare-fun m!581037 () Bool)

(assert (=> b!604099 m!581037))

(declare-fun m!581039 () Bool)

(assert (=> b!604105 m!581039))

(declare-fun m!581041 () Bool)

(assert (=> b!604115 m!581041))

(assert (=> b!604112 m!581033))

(assert (=> b!604112 m!581033))

(declare-fun m!581043 () Bool)

(assert (=> b!604112 m!581043))

(declare-fun m!581045 () Bool)

(assert (=> b!604118 m!581045))

(assert (=> b!604118 m!581033))

(declare-fun m!581047 () Bool)

(assert (=> b!604118 m!581047))

(declare-fun m!581049 () Bool)

(assert (=> b!604118 m!581049))

(declare-fun m!581051 () Bool)

(assert (=> b!604118 m!581051))

(assert (=> b!604118 m!581033))

(declare-fun m!581053 () Bool)

(assert (=> b!604118 m!581053))

(declare-fun m!581055 () Bool)

(assert (=> b!604118 m!581055))

(assert (=> b!604118 m!581033))

(assert (=> b!604118 m!581033))

(declare-fun m!581057 () Bool)

(assert (=> b!604118 m!581057))

(declare-fun m!581059 () Bool)

(assert (=> b!604109 m!581059))

(assert (=> b!604111 m!581033))

(assert (=> b!604111 m!581033))

(assert (=> b!604111 m!581035))

(declare-fun m!581061 () Bool)

(assert (=> start!55142 m!581061))

(declare-fun m!581063 () Bool)

(assert (=> start!55142 m!581063))

(declare-fun m!581065 () Bool)

(assert (=> b!604101 m!581065))

(assert (=> b!604101 m!581033))

(assert (=> b!604101 m!581033))

(declare-fun m!581067 () Bool)

(assert (=> b!604101 m!581067))

(assert (=> b!604120 m!581033))

(assert (=> b!604120 m!581033))

(declare-fun m!581069 () Bool)

(assert (=> b!604120 m!581069))

(declare-fun m!581071 () Bool)

(assert (=> b!604103 m!581071))

(declare-fun m!581073 () Bool)

(assert (=> b!604103 m!581073))

(declare-fun m!581075 () Bool)

(assert (=> b!604100 m!581075))

(declare-fun m!581077 () Bool)

(assert (=> b!604114 m!581077))

(assert (=> b!604110 m!581033))

(assert (=> b!604110 m!581071))

(declare-fun m!581079 () Bool)

(assert (=> b!604110 m!581079))

(assert (=> b!604104 m!581033))

(assert (=> b!604117 m!581033))

(assert (=> b!604117 m!581033))

(assert (=> b!604117 m!581043))

(declare-fun m!581081 () Bool)

(assert (=> b!604116 m!581081))

(declare-fun m!581083 () Bool)

(assert (=> b!604116 m!581083))

(assert (=> b!604116 m!581033))

(declare-fun m!581085 () Bool)

(assert (=> b!604116 m!581085))

(assert (=> b!604116 m!581071))

(assert (=> b!604116 m!581033))

(declare-fun m!581087 () Bool)

(assert (=> b!604116 m!581087))

(declare-fun m!581089 () Bool)

(assert (=> b!604116 m!581089))

(declare-fun m!581091 () Bool)

(assert (=> b!604116 m!581091))

(push 1)

