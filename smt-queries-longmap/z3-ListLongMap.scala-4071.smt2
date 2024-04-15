; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55908 () Bool)

(assert start!55908)

(declare-fun b!612198 () Bool)

(declare-fun e!350889 () Bool)

(declare-fun e!350894 () Bool)

(assert (=> b!612198 (= e!350889 e!350894)))

(declare-fun res!393919 () Bool)

(assert (=> b!612198 (=> res!393919 e!350894)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!280218 () (_ BitVec 64))

(declare-fun lt!280208 () (_ BitVec 64))

(declare-datatypes ((array!37392 0))(
  ( (array!37393 (arr!17942 (Array (_ BitVec 32) (_ BitVec 64))) (size!18307 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37392)

(assert (=> b!612198 (= res!393919 (or (not (= (select (arr!17942 a!2986) j!136) lt!280208)) (not (= (select (arr!17942 a!2986) j!136) lt!280218))))))

(declare-fun e!350882 () Bool)

(assert (=> b!612198 e!350882))

(declare-fun res!393906 () Bool)

(assert (=> b!612198 (=> (not res!393906) (not e!350882))))

(assert (=> b!612198 (= res!393906 (= lt!280218 (select (arr!17942 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!612198 (= lt!280218 (select (store (arr!17942 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!612199 () Bool)

(declare-fun e!350881 () Bool)

(declare-fun e!350890 () Bool)

(assert (=> b!612199 (= e!350881 e!350890)))

(declare-fun res!393904 () Bool)

(assert (=> b!612199 (=> (not res!393904) (not e!350890))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!612199 (= res!393904 (= (select (store (arr!17942 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!280216 () array!37392)

(assert (=> b!612199 (= lt!280216 (array!37393 (store (arr!17942 a!2986) i!1108 k0!1786) (size!18307 a!2986)))))

(declare-fun b!612200 () Bool)

(declare-fun e!350886 () Bool)

(assert (=> b!612200 (= e!350886 e!350881)))

(declare-fun res!393914 () Bool)

(assert (=> b!612200 (=> (not res!393914) (not e!350881))))

(declare-datatypes ((SeekEntryResult!6379 0))(
  ( (MissingZero!6379 (index!27800 (_ BitVec 32))) (Found!6379 (index!27801 (_ BitVec 32))) (Intermediate!6379 (undefined!7191 Bool) (index!27802 (_ BitVec 32)) (x!56622 (_ BitVec 32))) (Undefined!6379) (MissingVacant!6379 (index!27803 (_ BitVec 32))) )
))
(declare-fun lt!280211 () SeekEntryResult!6379)

(assert (=> b!612200 (= res!393914 (or (= lt!280211 (MissingZero!6379 i!1108)) (= lt!280211 (MissingVacant!6379 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37392 (_ BitVec 32)) SeekEntryResult!6379)

(assert (=> b!612200 (= lt!280211 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!612201 () Bool)

(declare-fun res!393905 () Bool)

(assert (=> b!612201 (=> (not res!393905) (not e!350881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37392 (_ BitVec 32)) Bool)

(assert (=> b!612201 (= res!393905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!612202 () Bool)

(declare-fun res!393907 () Bool)

(assert (=> b!612202 (=> (not res!393907) (not e!350886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!612202 (= res!393907 (validKeyInArray!0 (select (arr!17942 a!2986) j!136)))))

(declare-fun b!612203 () Bool)

(declare-fun e!350887 () Bool)

(assert (=> b!612203 (= e!350887 (not e!350889))))

(declare-fun res!393918 () Bool)

(assert (=> b!612203 (=> res!393918 e!350889)))

(declare-fun lt!280209 () SeekEntryResult!6379)

(assert (=> b!612203 (= res!393918 (not (= lt!280209 (Found!6379 index!984))))))

(declare-datatypes ((Unit!19656 0))(
  ( (Unit!19657) )
))
(declare-fun lt!280213 () Unit!19656)

(declare-fun e!350893 () Unit!19656)

(assert (=> b!612203 (= lt!280213 e!350893)))

(declare-fun c!69515 () Bool)

(assert (=> b!612203 (= c!69515 (= lt!280209 Undefined!6379))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37392 (_ BitVec 32)) SeekEntryResult!6379)

(assert (=> b!612203 (= lt!280209 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280208 lt!280216 mask!3053))))

(declare-fun e!350892 () Bool)

(assert (=> b!612203 e!350892))

(declare-fun res!393908 () Bool)

(assert (=> b!612203 (=> (not res!393908) (not e!350892))))

(declare-fun lt!280217 () SeekEntryResult!6379)

(declare-fun lt!280221 () (_ BitVec 32))

(assert (=> b!612203 (= res!393908 (= lt!280217 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280221 vacantSpotIndex!68 lt!280208 lt!280216 mask!3053)))))

(assert (=> b!612203 (= lt!280217 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280221 vacantSpotIndex!68 (select (arr!17942 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!612203 (= lt!280208 (select (store (arr!17942 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!280220 () Unit!19656)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37392 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19656)

(assert (=> b!612203 (= lt!280220 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280221 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612203 (= lt!280221 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!612204 () Bool)

(declare-fun res!393903 () Bool)

(assert (=> b!612204 (=> (not res!393903) (not e!350886))))

(assert (=> b!612204 (= res!393903 (and (= (size!18307 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18307 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18307 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612205 () Bool)

(declare-fun e!350888 () Unit!19656)

(declare-fun Unit!19658 () Unit!19656)

(assert (=> b!612205 (= e!350888 Unit!19658)))

(declare-fun res!393920 () Bool)

(assert (=> start!55908 (=> (not res!393920) (not e!350886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55908 (= res!393920 (validMask!0 mask!3053))))

(assert (=> start!55908 e!350886))

(assert (=> start!55908 true))

(declare-fun array_inv!13825 (array!37392) Bool)

(assert (=> start!55908 (array_inv!13825 a!2986)))

(declare-fun b!612206 () Bool)

(declare-fun Unit!19659 () Unit!19656)

(assert (=> b!612206 (= e!350893 Unit!19659)))

(assert (=> b!612206 false))

(declare-fun b!612207 () Bool)

(declare-fun res!393902 () Bool)

(assert (=> b!612207 (=> (not res!393902) (not e!350881))))

(declare-datatypes ((List!12022 0))(
  ( (Nil!12019) (Cons!12018 (h!13063 (_ BitVec 64)) (t!18241 List!12022)) )
))
(declare-fun arrayNoDuplicates!0 (array!37392 (_ BitVec 32) List!12022) Bool)

(assert (=> b!612207 (= res!393902 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12019))))

(declare-fun b!612208 () Bool)

(declare-fun res!393917 () Bool)

(assert (=> b!612208 (=> (not res!393917) (not e!350881))))

(assert (=> b!612208 (= res!393917 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17942 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!350884 () Bool)

(declare-fun b!612209 () Bool)

(declare-fun arrayContainsKey!0 (array!37392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612209 (= e!350884 (arrayContainsKey!0 lt!280216 (select (arr!17942 a!2986) j!136) index!984))))

(declare-fun b!612210 () Bool)

(declare-fun e!350885 () Bool)

(assert (=> b!612210 (= e!350885 (arrayContainsKey!0 lt!280216 (select (arr!17942 a!2986) j!136) index!984))))

(declare-fun b!612211 () Bool)

(declare-fun res!393909 () Bool)

(assert (=> b!612211 (=> (not res!393909) (not e!350886))))

(assert (=> b!612211 (= res!393909 (validKeyInArray!0 k0!1786))))

(declare-fun b!612212 () Bool)

(declare-fun lt!280207 () SeekEntryResult!6379)

(assert (=> b!612212 (= e!350892 (= lt!280207 lt!280217))))

(declare-fun b!612213 () Bool)

(declare-fun Unit!19660 () Unit!19656)

(assert (=> b!612213 (= e!350893 Unit!19660)))

(declare-fun b!612214 () Bool)

(declare-fun e!350895 () Bool)

(assert (=> b!612214 (= e!350894 e!350895)))

(declare-fun res!393913 () Bool)

(assert (=> b!612214 (=> res!393913 e!350895)))

(assert (=> b!612214 (= res!393913 (bvsge index!984 j!136))))

(declare-fun lt!280210 () Unit!19656)

(assert (=> b!612214 (= lt!280210 e!350888)))

(declare-fun c!69516 () Bool)

(assert (=> b!612214 (= c!69516 (bvslt j!136 index!984))))

(declare-fun b!612215 () Bool)

(declare-fun Unit!19661 () Unit!19656)

(assert (=> b!612215 (= e!350888 Unit!19661)))

(declare-fun lt!280215 () Unit!19656)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37392 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19656)

(assert (=> b!612215 (= lt!280215 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280216 (select (arr!17942 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!612215 (arrayContainsKey!0 lt!280216 (select (arr!17942 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280222 () Unit!19656)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37392 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12022) Unit!19656)

(assert (=> b!612215 (= lt!280222 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12019))))

(assert (=> b!612215 (arrayNoDuplicates!0 lt!280216 #b00000000000000000000000000000000 Nil!12019)))

(declare-fun lt!280206 () Unit!19656)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37392 (_ BitVec 32) (_ BitVec 32)) Unit!19656)

(assert (=> b!612215 (= lt!280206 (lemmaNoDuplicateFromThenFromBigger!0 lt!280216 #b00000000000000000000000000000000 j!136))))

(assert (=> b!612215 (arrayNoDuplicates!0 lt!280216 j!136 Nil!12019)))

(declare-fun lt!280214 () Unit!19656)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37392 (_ BitVec 64) (_ BitVec 32) List!12022) Unit!19656)

(assert (=> b!612215 (= lt!280214 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280216 (select (arr!17942 a!2986) j!136) j!136 Nil!12019))))

(assert (=> b!612215 false))

(declare-fun b!612216 () Bool)

(assert (=> b!612216 (= e!350890 e!350887)))

(declare-fun res!393915 () Bool)

(assert (=> b!612216 (=> (not res!393915) (not e!350887))))

(assert (=> b!612216 (= res!393915 (and (= lt!280207 (Found!6379 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17942 a!2986) index!984) (select (arr!17942 a!2986) j!136))) (not (= (select (arr!17942 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!612216 (= lt!280207 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17942 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!612217 () Bool)

(assert (=> b!612217 (= e!350895 true)))

(assert (=> b!612217 (arrayNoDuplicates!0 lt!280216 #b00000000000000000000000000000000 Nil!12019)))

(declare-fun lt!280212 () Unit!19656)

(assert (=> b!612217 (= lt!280212 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12019))))

(assert (=> b!612217 (arrayContainsKey!0 lt!280216 (select (arr!17942 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280219 () Unit!19656)

(assert (=> b!612217 (= lt!280219 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280216 (select (arr!17942 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!612217 e!350885))

(declare-fun res!393916 () Bool)

(assert (=> b!612217 (=> (not res!393916) (not e!350885))))

(assert (=> b!612217 (= res!393916 (arrayContainsKey!0 lt!280216 (select (arr!17942 a!2986) j!136) j!136))))

(declare-fun b!612218 () Bool)

(declare-fun res!393911 () Bool)

(assert (=> b!612218 (=> (not res!393911) (not e!350886))))

(assert (=> b!612218 (= res!393911 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!612219 () Bool)

(declare-fun e!350883 () Bool)

(assert (=> b!612219 (= e!350883 e!350884)))

(declare-fun res!393912 () Bool)

(assert (=> b!612219 (=> (not res!393912) (not e!350884))))

(assert (=> b!612219 (= res!393912 (arrayContainsKey!0 lt!280216 (select (arr!17942 a!2986) j!136) j!136))))

(declare-fun b!612220 () Bool)

(assert (=> b!612220 (= e!350882 e!350883)))

(declare-fun res!393910 () Bool)

(assert (=> b!612220 (=> res!393910 e!350883)))

(assert (=> b!612220 (= res!393910 (or (not (= (select (arr!17942 a!2986) j!136) lt!280208)) (not (= (select (arr!17942 a!2986) j!136) lt!280218)) (bvsge j!136 index!984)))))

(assert (= (and start!55908 res!393920) b!612204))

(assert (= (and b!612204 res!393903) b!612202))

(assert (= (and b!612202 res!393907) b!612211))

(assert (= (and b!612211 res!393909) b!612218))

(assert (= (and b!612218 res!393911) b!612200))

(assert (= (and b!612200 res!393914) b!612201))

(assert (= (and b!612201 res!393905) b!612207))

(assert (= (and b!612207 res!393902) b!612208))

(assert (= (and b!612208 res!393917) b!612199))

(assert (= (and b!612199 res!393904) b!612216))

(assert (= (and b!612216 res!393915) b!612203))

(assert (= (and b!612203 res!393908) b!612212))

(assert (= (and b!612203 c!69515) b!612206))

(assert (= (and b!612203 (not c!69515)) b!612213))

(assert (= (and b!612203 (not res!393918)) b!612198))

(assert (= (and b!612198 res!393906) b!612220))

(assert (= (and b!612220 (not res!393910)) b!612219))

(assert (= (and b!612219 res!393912) b!612209))

(assert (= (and b!612198 (not res!393919)) b!612214))

(assert (= (and b!612214 c!69516) b!612215))

(assert (= (and b!612214 (not c!69516)) b!612205))

(assert (= (and b!612214 (not res!393913)) b!612217))

(assert (= (and b!612217 res!393916) b!612210))

(declare-fun m!588043 () Bool)

(assert (=> b!612217 m!588043))

(declare-fun m!588045 () Bool)

(assert (=> b!612217 m!588045))

(assert (=> b!612217 m!588043))

(declare-fun m!588047 () Bool)

(assert (=> b!612217 m!588047))

(assert (=> b!612217 m!588043))

(declare-fun m!588049 () Bool)

(assert (=> b!612217 m!588049))

(assert (=> b!612217 m!588043))

(declare-fun m!588051 () Bool)

(assert (=> b!612217 m!588051))

(declare-fun m!588053 () Bool)

(assert (=> b!612217 m!588053))

(assert (=> b!612202 m!588043))

(assert (=> b!612202 m!588043))

(declare-fun m!588055 () Bool)

(assert (=> b!612202 m!588055))

(declare-fun m!588057 () Bool)

(assert (=> b!612200 m!588057))

(assert (=> b!612210 m!588043))

(assert (=> b!612210 m!588043))

(declare-fun m!588059 () Bool)

(assert (=> b!612210 m!588059))

(declare-fun m!588061 () Bool)

(assert (=> b!612216 m!588061))

(assert (=> b!612216 m!588043))

(assert (=> b!612216 m!588043))

(declare-fun m!588063 () Bool)

(assert (=> b!612216 m!588063))

(assert (=> b!612219 m!588043))

(assert (=> b!612219 m!588043))

(assert (=> b!612219 m!588049))

(assert (=> b!612215 m!588043))

(declare-fun m!588065 () Bool)

(assert (=> b!612215 m!588065))

(assert (=> b!612215 m!588045))

(assert (=> b!612215 m!588043))

(declare-fun m!588067 () Bool)

(assert (=> b!612215 m!588067))

(assert (=> b!612215 m!588043))

(declare-fun m!588069 () Bool)

(assert (=> b!612215 m!588069))

(declare-fun m!588071 () Bool)

(assert (=> b!612215 m!588071))

(assert (=> b!612215 m!588043))

(declare-fun m!588073 () Bool)

(assert (=> b!612215 m!588073))

(assert (=> b!612215 m!588053))

(declare-fun m!588075 () Bool)

(assert (=> b!612207 m!588075))

(declare-fun m!588077 () Bool)

(assert (=> b!612203 m!588077))

(declare-fun m!588079 () Bool)

(assert (=> b!612203 m!588079))

(assert (=> b!612203 m!588043))

(assert (=> b!612203 m!588043))

(declare-fun m!588081 () Bool)

(assert (=> b!612203 m!588081))

(declare-fun m!588083 () Bool)

(assert (=> b!612203 m!588083))

(declare-fun m!588085 () Bool)

(assert (=> b!612203 m!588085))

(declare-fun m!588087 () Bool)

(assert (=> b!612203 m!588087))

(declare-fun m!588089 () Bool)

(assert (=> b!612203 m!588089))

(assert (=> b!612209 m!588043))

(assert (=> b!612209 m!588043))

(assert (=> b!612209 m!588059))

(declare-fun m!588091 () Bool)

(assert (=> b!612208 m!588091))

(declare-fun m!588093 () Bool)

(assert (=> b!612201 m!588093))

(assert (=> b!612198 m!588043))

(assert (=> b!612198 m!588089))

(declare-fun m!588095 () Bool)

(assert (=> b!612198 m!588095))

(declare-fun m!588097 () Bool)

(assert (=> start!55908 m!588097))

(declare-fun m!588099 () Bool)

(assert (=> start!55908 m!588099))

(declare-fun m!588101 () Bool)

(assert (=> b!612211 m!588101))

(assert (=> b!612220 m!588043))

(assert (=> b!612199 m!588089))

(declare-fun m!588103 () Bool)

(assert (=> b!612199 m!588103))

(declare-fun m!588105 () Bool)

(assert (=> b!612218 m!588105))

(check-sat (not b!612216) (not b!612209) (not start!55908) (not b!612218) (not b!612217) (not b!612200) (not b!612215) (not b!612207) (not b!612219) (not b!612210) (not b!612211) (not b!612202) (not b!612203) (not b!612201))
(check-sat)
