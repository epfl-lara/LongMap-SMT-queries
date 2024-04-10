; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55112 () Bool)

(assert start!55112)

(declare-fun b!603064 () Bool)

(declare-fun e!344956 () Bool)

(declare-datatypes ((SeekEntryResult!6289 0))(
  ( (MissingZero!6289 (index!27419 (_ BitVec 32))) (Found!6289 (index!27420 (_ BitVec 32))) (Intermediate!6289 (undefined!7101 Bool) (index!27421 (_ BitVec 32)) (x!56218 (_ BitVec 32))) (Undefined!6289) (MissingVacant!6289 (index!27422 (_ BitVec 32))) )
))
(declare-fun lt!274760 () SeekEntryResult!6289)

(declare-fun lt!274750 () SeekEntryResult!6289)

(assert (=> b!603064 (= e!344956 (= lt!274760 lt!274750))))

(declare-fun b!603065 () Bool)

(declare-fun e!344966 () Bool)

(declare-fun e!344970 () Bool)

(assert (=> b!603065 (= e!344966 e!344970)))

(declare-fun res!387234 () Bool)

(assert (=> b!603065 (=> res!387234 e!344970)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!274762 () (_ BitVec 64))

(declare-fun lt!274752 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37185 0))(
  ( (array!37186 (arr!17849 (Array (_ BitVec 32) (_ BitVec 64))) (size!18213 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37185)

(assert (=> b!603065 (= res!387234 (or (not (= (select (arr!17849 a!2986) j!136) lt!274762)) (not (= (select (arr!17849 a!2986) j!136) lt!274752)) (bvsge j!136 index!984)))))

(declare-fun b!603066 () Bool)

(declare-fun res!387231 () Bool)

(declare-fun e!344969 () Bool)

(assert (=> b!603066 (=> (not res!387231) (not e!344969))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!603066 (= res!387231 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17849 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603067 () Bool)

(declare-datatypes ((Unit!19114 0))(
  ( (Unit!19115) )
))
(declare-fun e!344957 () Unit!19114)

(declare-fun Unit!19116 () Unit!19114)

(assert (=> b!603067 (= e!344957 Unit!19116)))

(declare-fun b!603068 () Bool)

(declare-fun e!344965 () Unit!19114)

(declare-fun Unit!19117 () Unit!19114)

(assert (=> b!603068 (= e!344965 Unit!19117)))

(assert (=> b!603068 false))

(declare-fun lt!274761 () array!37185)

(declare-fun b!603069 () Bool)

(declare-fun e!344958 () Bool)

(declare-fun arrayContainsKey!0 (array!37185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603069 (= e!344958 (arrayContainsKey!0 lt!274761 (select (arr!17849 a!2986) j!136) index!984))))

(declare-fun b!603070 () Bool)

(declare-fun res!387230 () Bool)

(assert (=> b!603070 (=> (not res!387230) (not e!344969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37185 (_ BitVec 32)) Bool)

(assert (=> b!603070 (= res!387230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603071 () Bool)

(declare-fun e!344962 () Bool)

(declare-fun e!344961 () Bool)

(assert (=> b!603071 (= e!344962 e!344961)))

(declare-fun res!387225 () Bool)

(assert (=> b!603071 (=> (not res!387225) (not e!344961))))

(assert (=> b!603071 (= res!387225 (and (= lt!274760 (Found!6289 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17849 a!2986) index!984) (select (arr!17849 a!2986) j!136))) (not (= (select (arr!17849 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37185 (_ BitVec 32)) SeekEntryResult!6289)

(assert (=> b!603071 (= lt!274760 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17849 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603072 () Bool)

(declare-fun e!344960 () Bool)

(declare-fun e!344968 () Bool)

(assert (=> b!603072 (= e!344960 e!344968)))

(declare-fun res!387224 () Bool)

(assert (=> b!603072 (=> res!387224 e!344968)))

(assert (=> b!603072 (= res!387224 (bvsge index!984 j!136))))

(declare-fun lt!274748 () Unit!19114)

(assert (=> b!603072 (= lt!274748 e!344957)))

(declare-fun c!68287 () Bool)

(assert (=> b!603072 (= c!68287 (bvslt j!136 index!984))))

(declare-fun b!603073 () Bool)

(declare-fun res!387241 () Bool)

(declare-fun e!344967 () Bool)

(assert (=> b!603073 (=> (not res!387241) (not e!344967))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!603073 (= res!387241 (and (= (size!18213 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18213 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18213 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603074 () Bool)

(declare-fun Unit!19118 () Unit!19114)

(assert (=> b!603074 (= e!344957 Unit!19118)))

(declare-fun lt!274759 () Unit!19114)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37185 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19114)

(assert (=> b!603074 (= lt!274759 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274761 (select (arr!17849 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603074 (arrayContainsKey!0 lt!274761 (select (arr!17849 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274758 () Unit!19114)

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((List!11890 0))(
  ( (Nil!11887) (Cons!11886 (h!12931 (_ BitVec 64)) (t!18118 List!11890)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37185 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11890) Unit!19114)

(assert (=> b!603074 (= lt!274758 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11887))))

(declare-fun arrayNoDuplicates!0 (array!37185 (_ BitVec 32) List!11890) Bool)

(assert (=> b!603074 (arrayNoDuplicates!0 lt!274761 #b00000000000000000000000000000000 Nil!11887)))

(declare-fun lt!274757 () Unit!19114)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37185 (_ BitVec 32) (_ BitVec 32)) Unit!19114)

(assert (=> b!603074 (= lt!274757 (lemmaNoDuplicateFromThenFromBigger!0 lt!274761 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603074 (arrayNoDuplicates!0 lt!274761 j!136 Nil!11887)))

(declare-fun lt!274749 () Unit!19114)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37185 (_ BitVec 64) (_ BitVec 32) List!11890) Unit!19114)

(assert (=> b!603074 (= lt!274749 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274761 (select (arr!17849 a!2986) j!136) j!136 Nil!11887))))

(assert (=> b!603074 false))

(declare-fun b!603075 () Bool)

(declare-fun res!387228 () Bool)

(assert (=> b!603075 (=> (not res!387228) (not e!344969))))

(assert (=> b!603075 (= res!387228 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11887))))

(declare-fun b!603076 () Bool)

(declare-fun e!344964 () Bool)

(assert (=> b!603076 (= e!344961 (not e!344964))))

(declare-fun res!387239 () Bool)

(assert (=> b!603076 (=> res!387239 e!344964)))

(declare-fun lt!274754 () SeekEntryResult!6289)

(assert (=> b!603076 (= res!387239 (not (= lt!274754 (Found!6289 index!984))))))

(declare-fun lt!274755 () Unit!19114)

(assert (=> b!603076 (= lt!274755 e!344965)))

(declare-fun c!68288 () Bool)

(assert (=> b!603076 (= c!68288 (= lt!274754 Undefined!6289))))

(assert (=> b!603076 (= lt!274754 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274762 lt!274761 mask!3053))))

(assert (=> b!603076 e!344956))

(declare-fun res!387233 () Bool)

(assert (=> b!603076 (=> (not res!387233) (not e!344956))))

(declare-fun lt!274753 () (_ BitVec 32))

(assert (=> b!603076 (= res!387233 (= lt!274750 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274753 vacantSpotIndex!68 lt!274762 lt!274761 mask!3053)))))

(assert (=> b!603076 (= lt!274750 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274753 vacantSpotIndex!68 (select (arr!17849 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603076 (= lt!274762 (select (store (arr!17849 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!274751 () Unit!19114)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37185 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19114)

(assert (=> b!603076 (= lt!274751 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274753 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603076 (= lt!274753 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!603077 () Bool)

(declare-fun res!387226 () Bool)

(assert (=> b!603077 (=> (not res!387226) (not e!344967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603077 (= res!387226 (validKeyInArray!0 (select (arr!17849 a!2986) j!136)))))

(declare-fun e!344963 () Bool)

(declare-fun b!603078 () Bool)

(assert (=> b!603078 (= e!344963 (arrayContainsKey!0 lt!274761 (select (arr!17849 a!2986) j!136) index!984))))

(declare-fun b!603079 () Bool)

(assert (=> b!603079 (= e!344970 e!344958)))

(declare-fun res!387240 () Bool)

(assert (=> b!603079 (=> (not res!387240) (not e!344958))))

(assert (=> b!603079 (= res!387240 (arrayContainsKey!0 lt!274761 (select (arr!17849 a!2986) j!136) j!136))))

(declare-fun b!603080 () Bool)

(declare-fun res!387238 () Bool)

(assert (=> b!603080 (=> (not res!387238) (not e!344967))))

(assert (=> b!603080 (= res!387238 (validKeyInArray!0 k!1786))))

(declare-fun b!603081 () Bool)

(declare-fun res!387227 () Bool)

(assert (=> b!603081 (=> (not res!387227) (not e!344967))))

(assert (=> b!603081 (= res!387227 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603082 () Bool)

(assert (=> b!603082 (= e!344967 e!344969)))

(declare-fun res!387242 () Bool)

(assert (=> b!603082 (=> (not res!387242) (not e!344969))))

(declare-fun lt!274756 () SeekEntryResult!6289)

(assert (=> b!603082 (= res!387242 (or (= lt!274756 (MissingZero!6289 i!1108)) (= lt!274756 (MissingVacant!6289 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37185 (_ BitVec 32)) SeekEntryResult!6289)

(assert (=> b!603082 (= lt!274756 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!603083 () Bool)

(assert (=> b!603083 (= e!344968 true)))

(assert (=> b!603083 e!344963))

(declare-fun res!387235 () Bool)

(assert (=> b!603083 (=> (not res!387235) (not e!344963))))

(assert (=> b!603083 (= res!387235 (arrayContainsKey!0 lt!274761 (select (arr!17849 a!2986) j!136) j!136))))

(declare-fun res!387232 () Bool)

(assert (=> start!55112 (=> (not res!387232) (not e!344967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55112 (= res!387232 (validMask!0 mask!3053))))

(assert (=> start!55112 e!344967))

(assert (=> start!55112 true))

(declare-fun array_inv!13645 (array!37185) Bool)

(assert (=> start!55112 (array_inv!13645 a!2986)))

(declare-fun b!603084 () Bool)

(assert (=> b!603084 (= e!344969 e!344962)))

(declare-fun res!387229 () Bool)

(assert (=> b!603084 (=> (not res!387229) (not e!344962))))

(assert (=> b!603084 (= res!387229 (= (select (store (arr!17849 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603084 (= lt!274761 (array!37186 (store (arr!17849 a!2986) i!1108 k!1786) (size!18213 a!2986)))))

(declare-fun b!603085 () Bool)

(declare-fun Unit!19119 () Unit!19114)

(assert (=> b!603085 (= e!344965 Unit!19119)))

(declare-fun b!603086 () Bool)

(assert (=> b!603086 (= e!344964 e!344960)))

(declare-fun res!387237 () Bool)

(assert (=> b!603086 (=> res!387237 e!344960)))

(assert (=> b!603086 (= res!387237 (or (not (= (select (arr!17849 a!2986) j!136) lt!274762)) (not (= (select (arr!17849 a!2986) j!136) lt!274752))))))

(assert (=> b!603086 e!344966))

(declare-fun res!387236 () Bool)

(assert (=> b!603086 (=> (not res!387236) (not e!344966))))

(assert (=> b!603086 (= res!387236 (= lt!274752 (select (arr!17849 a!2986) j!136)))))

(assert (=> b!603086 (= lt!274752 (select (store (arr!17849 a!2986) i!1108 k!1786) index!984))))

(assert (= (and start!55112 res!387232) b!603073))

(assert (= (and b!603073 res!387241) b!603077))

(assert (= (and b!603077 res!387226) b!603080))

(assert (= (and b!603080 res!387238) b!603081))

(assert (= (and b!603081 res!387227) b!603082))

(assert (= (and b!603082 res!387242) b!603070))

(assert (= (and b!603070 res!387230) b!603075))

(assert (= (and b!603075 res!387228) b!603066))

(assert (= (and b!603066 res!387231) b!603084))

(assert (= (and b!603084 res!387229) b!603071))

(assert (= (and b!603071 res!387225) b!603076))

(assert (= (and b!603076 res!387233) b!603064))

(assert (= (and b!603076 c!68288) b!603068))

(assert (= (and b!603076 (not c!68288)) b!603085))

(assert (= (and b!603076 (not res!387239)) b!603086))

(assert (= (and b!603086 res!387236) b!603065))

(assert (= (and b!603065 (not res!387234)) b!603079))

(assert (= (and b!603079 res!387240) b!603069))

(assert (= (and b!603086 (not res!387237)) b!603072))

(assert (= (and b!603072 c!68287) b!603074))

(assert (= (and b!603072 (not c!68287)) b!603067))

(assert (= (and b!603072 (not res!387224)) b!603083))

(assert (= (and b!603083 res!387235) b!603078))

(declare-fun m!580133 () Bool)

(assert (=> b!603082 m!580133))

(declare-fun m!580135 () Bool)

(assert (=> b!603071 m!580135))

(declare-fun m!580137 () Bool)

(assert (=> b!603071 m!580137))

(assert (=> b!603071 m!580137))

(declare-fun m!580139 () Bool)

(assert (=> b!603071 m!580139))

(declare-fun m!580141 () Bool)

(assert (=> b!603084 m!580141))

(declare-fun m!580143 () Bool)

(assert (=> b!603084 m!580143))

(declare-fun m!580145 () Bool)

(assert (=> start!55112 m!580145))

(declare-fun m!580147 () Bool)

(assert (=> start!55112 m!580147))

(declare-fun m!580149 () Bool)

(assert (=> b!603080 m!580149))

(declare-fun m!580151 () Bool)

(assert (=> b!603081 m!580151))

(declare-fun m!580153 () Bool)

(assert (=> b!603075 m!580153))

(assert (=> b!603069 m!580137))

(assert (=> b!603069 m!580137))

(declare-fun m!580155 () Bool)

(assert (=> b!603069 m!580155))

(declare-fun m!580157 () Bool)

(assert (=> b!603066 m!580157))

(assert (=> b!603077 m!580137))

(assert (=> b!603077 m!580137))

(declare-fun m!580159 () Bool)

(assert (=> b!603077 m!580159))

(assert (=> b!603074 m!580137))

(declare-fun m!580161 () Bool)

(assert (=> b!603074 m!580161))

(declare-fun m!580163 () Bool)

(assert (=> b!603074 m!580163))

(assert (=> b!603074 m!580137))

(declare-fun m!580165 () Bool)

(assert (=> b!603074 m!580165))

(assert (=> b!603074 m!580137))

(declare-fun m!580167 () Bool)

(assert (=> b!603074 m!580167))

(assert (=> b!603074 m!580137))

(declare-fun m!580169 () Bool)

(assert (=> b!603074 m!580169))

(declare-fun m!580171 () Bool)

(assert (=> b!603074 m!580171))

(declare-fun m!580173 () Bool)

(assert (=> b!603074 m!580173))

(assert (=> b!603083 m!580137))

(assert (=> b!603083 m!580137))

(declare-fun m!580175 () Bool)

(assert (=> b!603083 m!580175))

(assert (=> b!603078 m!580137))

(assert (=> b!603078 m!580137))

(assert (=> b!603078 m!580155))

(assert (=> b!603079 m!580137))

(assert (=> b!603079 m!580137))

(assert (=> b!603079 m!580175))

(assert (=> b!603086 m!580137))

(assert (=> b!603086 m!580141))

(declare-fun m!580177 () Bool)

(assert (=> b!603086 m!580177))

(declare-fun m!580179 () Bool)

(assert (=> b!603076 m!580179))

(assert (=> b!603076 m!580137))

(declare-fun m!580181 () Bool)

(assert (=> b!603076 m!580181))

(declare-fun m!580183 () Bool)

(assert (=> b!603076 m!580183))

(assert (=> b!603076 m!580141))

(declare-fun m!580185 () Bool)

(assert (=> b!603076 m!580185))

(declare-fun m!580187 () Bool)

(assert (=> b!603076 m!580187))

(assert (=> b!603076 m!580137))

(declare-fun m!580189 () Bool)

(assert (=> b!603076 m!580189))

(assert (=> b!603065 m!580137))

(declare-fun m!580191 () Bool)

(assert (=> b!603070 m!580191))

(push 1)

