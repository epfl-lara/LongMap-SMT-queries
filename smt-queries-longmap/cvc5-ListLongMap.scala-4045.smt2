; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55144 () Bool)

(assert start!55144)

(declare-fun b!604168 () Bool)

(declare-datatypes ((Unit!19210 0))(
  ( (Unit!19211) )
))
(declare-fun e!345682 () Unit!19210)

(declare-fun Unit!19212 () Unit!19210)

(assert (=> b!604168 (= e!345682 Unit!19212)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!275474 () Unit!19210)

(declare-datatypes ((array!37217 0))(
  ( (array!37218 (arr!17865 (Array (_ BitVec 32) (_ BitVec 64))) (size!18229 (_ BitVec 32))) )
))
(declare-fun lt!275476 () array!37217)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37217)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37217 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19210)

(assert (=> b!604168 (= lt!275474 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275476 (select (arr!17865 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604168 (arrayContainsKey!0 lt!275476 (select (arr!17865 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!275471 () Unit!19210)

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((List!11906 0))(
  ( (Nil!11903) (Cons!11902 (h!12947 (_ BitVec 64)) (t!18134 List!11906)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37217 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11906) Unit!19210)

(assert (=> b!604168 (= lt!275471 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11903))))

(declare-fun arrayNoDuplicates!0 (array!37217 (_ BitVec 32) List!11906) Bool)

(assert (=> b!604168 (arrayNoDuplicates!0 lt!275476 #b00000000000000000000000000000000 Nil!11903)))

(declare-fun lt!275473 () Unit!19210)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37217 (_ BitVec 32) (_ BitVec 32)) Unit!19210)

(assert (=> b!604168 (= lt!275473 (lemmaNoDuplicateFromThenFromBigger!0 lt!275476 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604168 (arrayNoDuplicates!0 lt!275476 j!136 Nil!11903)))

(declare-fun lt!275483 () Unit!19210)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37217 (_ BitVec 64) (_ BitVec 32) List!11906) Unit!19210)

(assert (=> b!604168 (= lt!275483 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275476 (select (arr!17865 a!2986) j!136) j!136 Nil!11903))))

(assert (=> b!604168 false))

(declare-fun b!604169 () Bool)

(declare-fun res!388147 () Bool)

(declare-fun e!345687 () Bool)

(assert (=> b!604169 (=> (not res!388147) (not e!345687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604169 (= res!388147 (validKeyInArray!0 (select (arr!17865 a!2986) j!136)))))

(declare-fun b!604170 () Bool)

(declare-fun e!345676 () Bool)

(declare-fun e!345690 () Bool)

(assert (=> b!604170 (= e!345676 e!345690)))

(declare-fun res!388136 () Bool)

(assert (=> b!604170 (=> (not res!388136) (not e!345690))))

(assert (=> b!604170 (= res!388136 (arrayContainsKey!0 lt!275476 (select (arr!17865 a!2986) j!136) j!136))))

(declare-fun b!604171 () Bool)

(declare-fun e!345689 () Bool)

(assert (=> b!604171 (= e!345687 e!345689)))

(declare-fun res!388143 () Bool)

(assert (=> b!604171 (=> (not res!388143) (not e!345689))))

(declare-datatypes ((SeekEntryResult!6305 0))(
  ( (MissingZero!6305 (index!27483 (_ BitVec 32))) (Found!6305 (index!27484 (_ BitVec 32))) (Intermediate!6305 (undefined!7117 Bool) (index!27485 (_ BitVec 32)) (x!56282 (_ BitVec 32))) (Undefined!6305) (MissingVacant!6305 (index!27486 (_ BitVec 32))) )
))
(declare-fun lt!275481 () SeekEntryResult!6305)

(assert (=> b!604171 (= res!388143 (or (= lt!275481 (MissingZero!6305 i!1108)) (= lt!275481 (MissingVacant!6305 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37217 (_ BitVec 32)) SeekEntryResult!6305)

(assert (=> b!604171 (= lt!275481 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!604172 () Bool)

(declare-fun res!388148 () Bool)

(assert (=> b!604172 (=> (not res!388148) (not e!345689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37217 (_ BitVec 32)) Bool)

(assert (=> b!604172 (= res!388148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!604173 () Bool)

(declare-fun res!388153 () Bool)

(assert (=> b!604173 (=> (not res!388153) (not e!345687))))

(assert (=> b!604173 (= res!388153 (and (= (size!18229 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18229 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18229 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604174 () Bool)

(declare-fun e!345688 () Unit!19210)

(declare-fun Unit!19213 () Unit!19210)

(assert (=> b!604174 (= e!345688 Unit!19213)))

(assert (=> b!604174 false))

(declare-fun res!388142 () Bool)

(assert (=> start!55144 (=> (not res!388142) (not e!345687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55144 (= res!388142 (validMask!0 mask!3053))))

(assert (=> start!55144 e!345687))

(assert (=> start!55144 true))

(declare-fun array_inv!13661 (array!37217) Bool)

(assert (=> start!55144 (array_inv!13661 a!2986)))

(declare-fun b!604175 () Bool)

(declare-fun Unit!19214 () Unit!19210)

(assert (=> b!604175 (= e!345688 Unit!19214)))

(declare-fun b!604176 () Bool)

(declare-fun e!345686 () Bool)

(assert (=> b!604176 (= e!345689 e!345686)))

(declare-fun res!388146 () Bool)

(assert (=> b!604176 (=> (not res!388146) (not e!345686))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!604176 (= res!388146 (= (select (store (arr!17865 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604176 (= lt!275476 (array!37218 (store (arr!17865 a!2986) i!1108 k!1786) (size!18229 a!2986)))))

(declare-fun b!604177 () Bool)

(declare-fun e!345683 () Bool)

(assert (=> b!604177 (= e!345683 (bvsge (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000))))

(assert (=> b!604177 (arrayContainsKey!0 lt!275476 (select (arr!17865 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275484 () Unit!19210)

(assert (=> b!604177 (= lt!275484 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275476 (select (arr!17865 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!345680 () Bool)

(assert (=> b!604177 e!345680))

(declare-fun res!388149 () Bool)

(assert (=> b!604177 (=> (not res!388149) (not e!345680))))

(assert (=> b!604177 (= res!388149 (arrayContainsKey!0 lt!275476 (select (arr!17865 a!2986) j!136) j!136))))

(declare-fun b!604178 () Bool)

(declare-fun res!388152 () Bool)

(assert (=> b!604178 (=> (not res!388152) (not e!345689))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!604178 (= res!388152 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17865 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604179 () Bool)

(declare-fun res!388151 () Bool)

(assert (=> b!604179 (=> (not res!388151) (not e!345689))))

(assert (=> b!604179 (= res!388151 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11903))))

(declare-fun b!604180 () Bool)

(declare-fun Unit!19215 () Unit!19210)

(assert (=> b!604180 (= e!345682 Unit!19215)))

(declare-fun b!604181 () Bool)

(declare-fun res!388144 () Bool)

(assert (=> b!604181 (=> (not res!388144) (not e!345687))))

(assert (=> b!604181 (= res!388144 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!604182 () Bool)

(declare-fun e!345684 () Bool)

(declare-fun lt!275480 () SeekEntryResult!6305)

(declare-fun lt!275477 () SeekEntryResult!6305)

(assert (=> b!604182 (= e!345684 (= lt!275480 lt!275477))))

(declare-fun b!604183 () Bool)

(declare-fun e!345677 () Bool)

(assert (=> b!604183 (= e!345686 e!345677)))

(declare-fun res!388139 () Bool)

(assert (=> b!604183 (=> (not res!388139) (not e!345677))))

(assert (=> b!604183 (= res!388139 (and (= lt!275480 (Found!6305 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17865 a!2986) index!984) (select (arr!17865 a!2986) j!136))) (not (= (select (arr!17865 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37217 (_ BitVec 32)) SeekEntryResult!6305)

(assert (=> b!604183 (= lt!275480 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17865 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604184 () Bool)

(assert (=> b!604184 (= e!345680 (arrayContainsKey!0 lt!275476 (select (arr!17865 a!2986) j!136) index!984))))

(declare-fun b!604185 () Bool)

(assert (=> b!604185 (= e!345690 (arrayContainsKey!0 lt!275476 (select (arr!17865 a!2986) j!136) index!984))))

(declare-fun b!604186 () Bool)

(declare-fun e!345678 () Bool)

(assert (=> b!604186 (= e!345678 e!345676)))

(declare-fun res!388140 () Bool)

(assert (=> b!604186 (=> res!388140 e!345676)))

(declare-fun lt!275485 () (_ BitVec 64))

(declare-fun lt!275482 () (_ BitVec 64))

(assert (=> b!604186 (= res!388140 (or (not (= (select (arr!17865 a!2986) j!136) lt!275485)) (not (= (select (arr!17865 a!2986) j!136) lt!275482)) (bvsge j!136 index!984)))))

(declare-fun b!604187 () Bool)

(declare-fun e!345685 () Bool)

(declare-fun e!345681 () Bool)

(assert (=> b!604187 (= e!345685 e!345681)))

(declare-fun res!388138 () Bool)

(assert (=> b!604187 (=> res!388138 e!345681)))

(assert (=> b!604187 (= res!388138 (or (not (= (select (arr!17865 a!2986) j!136) lt!275485)) (not (= (select (arr!17865 a!2986) j!136) lt!275482))))))

(assert (=> b!604187 e!345678))

(declare-fun res!388154 () Bool)

(assert (=> b!604187 (=> (not res!388154) (not e!345678))))

(assert (=> b!604187 (= res!388154 (= lt!275482 (select (arr!17865 a!2986) j!136)))))

(assert (=> b!604187 (= lt!275482 (select (store (arr!17865 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!604188 () Bool)

(declare-fun res!388145 () Bool)

(assert (=> b!604188 (=> (not res!388145) (not e!345687))))

(assert (=> b!604188 (= res!388145 (validKeyInArray!0 k!1786))))

(declare-fun b!604189 () Bool)

(assert (=> b!604189 (= e!345677 (not e!345685))))

(declare-fun res!388137 () Bool)

(assert (=> b!604189 (=> res!388137 e!345685)))

(declare-fun lt!275478 () SeekEntryResult!6305)

(assert (=> b!604189 (= res!388137 (not (= lt!275478 (Found!6305 index!984))))))

(declare-fun lt!275472 () Unit!19210)

(assert (=> b!604189 (= lt!275472 e!345688)))

(declare-fun c!68384 () Bool)

(assert (=> b!604189 (= c!68384 (= lt!275478 Undefined!6305))))

(assert (=> b!604189 (= lt!275478 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275485 lt!275476 mask!3053))))

(assert (=> b!604189 e!345684))

(declare-fun res!388150 () Bool)

(assert (=> b!604189 (=> (not res!388150) (not e!345684))))

(declare-fun lt!275470 () (_ BitVec 32))

(assert (=> b!604189 (= res!388150 (= lt!275477 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275470 vacantSpotIndex!68 lt!275485 lt!275476 mask!3053)))))

(assert (=> b!604189 (= lt!275477 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275470 vacantSpotIndex!68 (select (arr!17865 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!604189 (= lt!275485 (select (store (arr!17865 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!275479 () Unit!19210)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37217 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19210)

(assert (=> b!604189 (= lt!275479 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275470 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604189 (= lt!275470 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!604190 () Bool)

(assert (=> b!604190 (= e!345681 e!345683)))

(declare-fun res!388141 () Bool)

(assert (=> b!604190 (=> res!388141 e!345683)))

(assert (=> b!604190 (= res!388141 (bvsge index!984 j!136))))

(declare-fun lt!275475 () Unit!19210)

(assert (=> b!604190 (= lt!275475 e!345682)))

(declare-fun c!68383 () Bool)

(assert (=> b!604190 (= c!68383 (bvslt j!136 index!984))))

(assert (= (and start!55144 res!388142) b!604173))

(assert (= (and b!604173 res!388153) b!604169))

(assert (= (and b!604169 res!388147) b!604188))

(assert (= (and b!604188 res!388145) b!604181))

(assert (= (and b!604181 res!388144) b!604171))

(assert (= (and b!604171 res!388143) b!604172))

(assert (= (and b!604172 res!388148) b!604179))

(assert (= (and b!604179 res!388151) b!604178))

(assert (= (and b!604178 res!388152) b!604176))

(assert (= (and b!604176 res!388146) b!604183))

(assert (= (and b!604183 res!388139) b!604189))

(assert (= (and b!604189 res!388150) b!604182))

(assert (= (and b!604189 c!68384) b!604174))

(assert (= (and b!604189 (not c!68384)) b!604175))

(assert (= (and b!604189 (not res!388137)) b!604187))

(assert (= (and b!604187 res!388154) b!604186))

(assert (= (and b!604186 (not res!388140)) b!604170))

(assert (= (and b!604170 res!388136) b!604185))

(assert (= (and b!604187 (not res!388138)) b!604190))

(assert (= (and b!604190 c!68383) b!604168))

(assert (= (and b!604190 (not c!68383)) b!604180))

(assert (= (and b!604190 (not res!388141)) b!604177))

(assert (= (and b!604177 res!388149) b!604184))

(declare-fun m!581093 () Bool)

(assert (=> b!604176 m!581093))

(declare-fun m!581095 () Bool)

(assert (=> b!604176 m!581095))

(declare-fun m!581097 () Bool)

(assert (=> b!604183 m!581097))

(declare-fun m!581099 () Bool)

(assert (=> b!604183 m!581099))

(assert (=> b!604183 m!581099))

(declare-fun m!581101 () Bool)

(assert (=> b!604183 m!581101))

(declare-fun m!581103 () Bool)

(assert (=> b!604188 m!581103))

(assert (=> b!604186 m!581099))

(assert (=> b!604169 m!581099))

(assert (=> b!604169 m!581099))

(declare-fun m!581105 () Bool)

(assert (=> b!604169 m!581105))

(assert (=> b!604170 m!581099))

(assert (=> b!604170 m!581099))

(declare-fun m!581107 () Bool)

(assert (=> b!604170 m!581107))

(declare-fun m!581109 () Bool)

(assert (=> b!604171 m!581109))

(declare-fun m!581111 () Bool)

(assert (=> b!604189 m!581111))

(declare-fun m!581113 () Bool)

(assert (=> b!604189 m!581113))

(assert (=> b!604189 m!581099))

(assert (=> b!604189 m!581093))

(assert (=> b!604189 m!581099))

(declare-fun m!581115 () Bool)

(assert (=> b!604189 m!581115))

(declare-fun m!581117 () Bool)

(assert (=> b!604189 m!581117))

(declare-fun m!581119 () Bool)

(assert (=> b!604189 m!581119))

(declare-fun m!581121 () Bool)

(assert (=> b!604189 m!581121))

(declare-fun m!581123 () Bool)

(assert (=> start!55144 m!581123))

(declare-fun m!581125 () Bool)

(assert (=> start!55144 m!581125))

(assert (=> b!604177 m!581099))

(assert (=> b!604177 m!581099))

(declare-fun m!581127 () Bool)

(assert (=> b!604177 m!581127))

(assert (=> b!604177 m!581099))

(declare-fun m!581129 () Bool)

(assert (=> b!604177 m!581129))

(assert (=> b!604177 m!581099))

(assert (=> b!604177 m!581107))

(declare-fun m!581131 () Bool)

(assert (=> b!604181 m!581131))

(assert (=> b!604185 m!581099))

(assert (=> b!604185 m!581099))

(declare-fun m!581133 () Bool)

(assert (=> b!604185 m!581133))

(assert (=> b!604184 m!581099))

(assert (=> b!604184 m!581099))

(assert (=> b!604184 m!581133))

(declare-fun m!581135 () Bool)

(assert (=> b!604179 m!581135))

(declare-fun m!581137 () Bool)

(assert (=> b!604178 m!581137))

(assert (=> b!604187 m!581099))

(assert (=> b!604187 m!581093))

(declare-fun m!581139 () Bool)

(assert (=> b!604187 m!581139))

(declare-fun m!581141 () Bool)

(assert (=> b!604172 m!581141))

(declare-fun m!581143 () Bool)

(assert (=> b!604168 m!581143))

(declare-fun m!581145 () Bool)

(assert (=> b!604168 m!581145))

(assert (=> b!604168 m!581099))

(declare-fun m!581147 () Bool)

(assert (=> b!604168 m!581147))

(assert (=> b!604168 m!581099))

(declare-fun m!581149 () Bool)

(assert (=> b!604168 m!581149))

(declare-fun m!581151 () Bool)

(assert (=> b!604168 m!581151))

(assert (=> b!604168 m!581099))

(assert (=> b!604168 m!581099))

(declare-fun m!581153 () Bool)

(assert (=> b!604168 m!581153))

(declare-fun m!581155 () Bool)

(assert (=> b!604168 m!581155))

(push 1)

