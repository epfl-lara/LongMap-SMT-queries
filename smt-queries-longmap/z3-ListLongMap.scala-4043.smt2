; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55182 () Bool)

(assert start!55182)

(declare-fun b!603963 () Bool)

(declare-fun e!345535 () Bool)

(declare-fun e!345536 () Bool)

(assert (=> b!603963 (= e!345535 e!345536)))

(declare-fun res!387912 () Bool)

(assert (=> b!603963 (=> (not res!387912) (not e!345536))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37200 0))(
  ( (array!37201 (arr!17854 (Array (_ BitVec 32) (_ BitVec 64))) (size!18218 (_ BitVec 32))) )
))
(declare-fun lt!275309 () array!37200)

(declare-fun a!2986 () array!37200)

(declare-fun arrayContainsKey!0 (array!37200 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603963 (= res!387912 (arrayContainsKey!0 lt!275309 (select (arr!17854 a!2986) j!136) j!136))))

(declare-fun b!603965 () Bool)

(declare-fun e!345543 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!603965 (= e!345543 (arrayContainsKey!0 lt!275309 (select (arr!17854 a!2986) j!136) index!984))))

(declare-fun b!603966 () Bool)

(declare-fun res!387909 () Bool)

(declare-fun e!345547 () Bool)

(assert (=> b!603966 (=> (not res!387909) (not e!345547))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37200 (_ BitVec 32)) Bool)

(assert (=> b!603966 (= res!387909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603967 () Bool)

(declare-fun e!345538 () Bool)

(assert (=> b!603967 (= e!345538 e!345547)))

(declare-fun res!387901 () Bool)

(assert (=> b!603967 (=> (not res!387901) (not e!345547))))

(declare-datatypes ((SeekEntryResult!6250 0))(
  ( (MissingZero!6250 (index!27263 (_ BitVec 32))) (Found!6250 (index!27264 (_ BitVec 32))) (Intermediate!6250 (undefined!7062 Bool) (index!27265 (_ BitVec 32)) (x!56214 (_ BitVec 32))) (Undefined!6250) (MissingVacant!6250 (index!27266 (_ BitVec 32))) )
))
(declare-fun lt!275305 () SeekEntryResult!6250)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!603967 (= res!387901 (or (= lt!275305 (MissingZero!6250 i!1108)) (= lt!275305 (MissingVacant!6250 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37200 (_ BitVec 32)) SeekEntryResult!6250)

(assert (=> b!603967 (= lt!275305 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!603968 () Bool)

(declare-datatypes ((Unit!19153 0))(
  ( (Unit!19154) )
))
(declare-fun e!345549 () Unit!19153)

(declare-fun Unit!19155 () Unit!19153)

(assert (=> b!603968 (= e!345549 Unit!19155)))

(assert (=> b!603968 false))

(declare-fun b!603969 () Bool)

(assert (=> b!603969 (= e!345536 (arrayContainsKey!0 lt!275309 (select (arr!17854 a!2986) j!136) index!984))))

(declare-fun b!603970 () Bool)

(declare-fun res!387908 () Bool)

(assert (=> b!603970 (=> (not res!387908) (not e!345538))))

(assert (=> b!603970 (= res!387908 (and (= (size!18218 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18218 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18218 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603971 () Bool)

(declare-fun e!345545 () Unit!19153)

(declare-fun Unit!19156 () Unit!19153)

(assert (=> b!603971 (= e!345545 Unit!19156)))

(declare-fun b!603972 () Bool)

(declare-fun Unit!19157 () Unit!19153)

(assert (=> b!603972 (= e!345549 Unit!19157)))

(declare-fun b!603973 () Bool)

(declare-fun Unit!19158 () Unit!19153)

(assert (=> b!603973 (= e!345545 Unit!19158)))

(declare-fun lt!275311 () Unit!19153)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37200 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19153)

(assert (=> b!603973 (= lt!275311 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275309 (select (arr!17854 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603973 (arrayContainsKey!0 lt!275309 (select (arr!17854 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275301 () Unit!19153)

(declare-datatypes ((List!11802 0))(
  ( (Nil!11799) (Cons!11798 (h!12846 (_ BitVec 64)) (t!18022 List!11802)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37200 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11802) Unit!19153)

(assert (=> b!603973 (= lt!275301 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11799))))

(declare-fun arrayNoDuplicates!0 (array!37200 (_ BitVec 32) List!11802) Bool)

(assert (=> b!603973 (arrayNoDuplicates!0 lt!275309 #b00000000000000000000000000000000 Nil!11799)))

(declare-fun lt!275306 () Unit!19153)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37200 (_ BitVec 32) (_ BitVec 32)) Unit!19153)

(assert (=> b!603973 (= lt!275306 (lemmaNoDuplicateFromThenFromBigger!0 lt!275309 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603973 (arrayNoDuplicates!0 lt!275309 j!136 Nil!11799)))

(declare-fun lt!275313 () Unit!19153)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37200 (_ BitVec 64) (_ BitVec 32) List!11802) Unit!19153)

(assert (=> b!603973 (= lt!275313 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275309 (select (arr!17854 a!2986) j!136) j!136 Nil!11799))))

(assert (=> b!603973 false))

(declare-fun res!387902 () Bool)

(assert (=> start!55182 (=> (not res!387902) (not e!345538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55182 (= res!387902 (validMask!0 mask!3053))))

(assert (=> start!55182 e!345538))

(assert (=> start!55182 true))

(declare-fun array_inv!13713 (array!37200) Bool)

(assert (=> start!55182 (array_inv!13713 a!2986)))

(declare-fun b!603964 () Bool)

(declare-fun res!387915 () Bool)

(assert (=> b!603964 (=> (not res!387915) (not e!345538))))

(assert (=> b!603964 (= res!387915 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603974 () Bool)

(declare-fun res!387906 () Bool)

(assert (=> b!603974 (=> (not res!387906) (not e!345538))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603974 (= res!387906 (validKeyInArray!0 k0!1786))))

(declare-fun b!603975 () Bool)

(declare-fun res!387899 () Bool)

(assert (=> b!603975 (=> (not res!387899) (not e!345547))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!603975 (= res!387899 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17854 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603976 () Bool)

(declare-fun res!387903 () Bool)

(assert (=> b!603976 (=> (not res!387903) (not e!345547))))

(assert (=> b!603976 (= res!387903 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11799))))

(declare-fun b!603977 () Bool)

(declare-fun e!345542 () Bool)

(declare-fun e!345548 () Bool)

(assert (=> b!603977 (= e!345542 e!345548)))

(declare-fun res!387916 () Bool)

(assert (=> b!603977 (=> (not res!387916) (not e!345548))))

(declare-fun lt!275302 () SeekEntryResult!6250)

(assert (=> b!603977 (= res!387916 (and (= lt!275302 (Found!6250 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17854 a!2986) index!984) (select (arr!17854 a!2986) j!136))) (not (= (select (arr!17854 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37200 (_ BitVec 32)) SeekEntryResult!6250)

(assert (=> b!603977 (= lt!275302 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17854 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603978 () Bool)

(declare-fun e!345540 () Bool)

(assert (=> b!603978 (= e!345548 (not e!345540))))

(declare-fun res!387898 () Bool)

(assert (=> b!603978 (=> res!387898 e!345540)))

(declare-fun lt!275307 () SeekEntryResult!6250)

(assert (=> b!603978 (= res!387898 (not (= lt!275307 (Found!6250 index!984))))))

(declare-fun lt!275310 () Unit!19153)

(assert (=> b!603978 (= lt!275310 e!345549)))

(declare-fun c!68402 () Bool)

(assert (=> b!603978 (= c!68402 (= lt!275307 Undefined!6250))))

(declare-fun lt!275308 () (_ BitVec 64))

(assert (=> b!603978 (= lt!275307 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275308 lt!275309 mask!3053))))

(declare-fun e!345541 () Bool)

(assert (=> b!603978 e!345541))

(declare-fun res!387913 () Bool)

(assert (=> b!603978 (=> (not res!387913) (not e!345541))))

(declare-fun lt!275304 () SeekEntryResult!6250)

(declare-fun lt!275300 () (_ BitVec 32))

(assert (=> b!603978 (= res!387913 (= lt!275304 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275300 vacantSpotIndex!68 lt!275308 lt!275309 mask!3053)))))

(assert (=> b!603978 (= lt!275304 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275300 vacantSpotIndex!68 (select (arr!17854 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603978 (= lt!275308 (select (store (arr!17854 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275314 () Unit!19153)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37200 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19153)

(assert (=> b!603978 (= lt!275314 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275300 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603978 (= lt!275300 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!603979 () Bool)

(assert (=> b!603979 (= e!345541 (= lt!275302 lt!275304))))

(declare-fun b!603980 () Bool)

(assert (=> b!603980 (= e!345547 e!345542)))

(declare-fun res!387905 () Bool)

(assert (=> b!603980 (=> (not res!387905) (not e!345542))))

(assert (=> b!603980 (= res!387905 (= (select (store (arr!17854 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603980 (= lt!275309 (array!37201 (store (arr!17854 a!2986) i!1108 k0!1786) (size!18218 a!2986)))))

(declare-fun b!603981 () Bool)

(declare-fun e!345546 () Bool)

(assert (=> b!603981 (= e!345546 e!345535)))

(declare-fun res!387911 () Bool)

(assert (=> b!603981 (=> res!387911 e!345535)))

(declare-fun lt!275312 () (_ BitVec 64))

(assert (=> b!603981 (= res!387911 (or (not (= (select (arr!17854 a!2986) j!136) lt!275308)) (not (= (select (arr!17854 a!2986) j!136) lt!275312)) (bvsge j!136 index!984)))))

(declare-fun b!603982 () Bool)

(declare-fun res!387907 () Bool)

(assert (=> b!603982 (=> (not res!387907) (not e!345538))))

(assert (=> b!603982 (= res!387907 (validKeyInArray!0 (select (arr!17854 a!2986) j!136)))))

(declare-fun b!603983 () Bool)

(declare-fun e!345539 () Bool)

(assert (=> b!603983 (= e!345539 true)))

(assert (=> b!603983 e!345543))

(declare-fun res!387904 () Bool)

(assert (=> b!603983 (=> (not res!387904) (not e!345543))))

(assert (=> b!603983 (= res!387904 (arrayContainsKey!0 lt!275309 (select (arr!17854 a!2986) j!136) j!136))))

(declare-fun b!603984 () Bool)

(declare-fun e!345537 () Bool)

(assert (=> b!603984 (= e!345537 e!345539)))

(declare-fun res!387910 () Bool)

(assert (=> b!603984 (=> res!387910 e!345539)))

(assert (=> b!603984 (= res!387910 (bvsge index!984 j!136))))

(declare-fun lt!275303 () Unit!19153)

(assert (=> b!603984 (= lt!275303 e!345545)))

(declare-fun c!68401 () Bool)

(assert (=> b!603984 (= c!68401 (bvslt j!136 index!984))))

(declare-fun b!603985 () Bool)

(assert (=> b!603985 (= e!345540 e!345537)))

(declare-fun res!387900 () Bool)

(assert (=> b!603985 (=> res!387900 e!345537)))

(assert (=> b!603985 (= res!387900 (or (not (= (select (arr!17854 a!2986) j!136) lt!275308)) (not (= (select (arr!17854 a!2986) j!136) lt!275312))))))

(assert (=> b!603985 e!345546))

(declare-fun res!387914 () Bool)

(assert (=> b!603985 (=> (not res!387914) (not e!345546))))

(assert (=> b!603985 (= res!387914 (= lt!275312 (select (arr!17854 a!2986) j!136)))))

(assert (=> b!603985 (= lt!275312 (select (store (arr!17854 a!2986) i!1108 k0!1786) index!984))))

(assert (= (and start!55182 res!387902) b!603970))

(assert (= (and b!603970 res!387908) b!603982))

(assert (= (and b!603982 res!387907) b!603974))

(assert (= (and b!603974 res!387906) b!603964))

(assert (= (and b!603964 res!387915) b!603967))

(assert (= (and b!603967 res!387901) b!603966))

(assert (= (and b!603966 res!387909) b!603976))

(assert (= (and b!603976 res!387903) b!603975))

(assert (= (and b!603975 res!387899) b!603980))

(assert (= (and b!603980 res!387905) b!603977))

(assert (= (and b!603977 res!387916) b!603978))

(assert (= (and b!603978 res!387913) b!603979))

(assert (= (and b!603978 c!68402) b!603968))

(assert (= (and b!603978 (not c!68402)) b!603972))

(assert (= (and b!603978 (not res!387898)) b!603985))

(assert (= (and b!603985 res!387914) b!603981))

(assert (= (and b!603981 (not res!387911)) b!603963))

(assert (= (and b!603963 res!387912) b!603969))

(assert (= (and b!603985 (not res!387900)) b!603984))

(assert (= (and b!603984 c!68401) b!603973))

(assert (= (and b!603984 (not c!68401)) b!603971))

(assert (= (and b!603984 (not res!387910)) b!603983))

(assert (= (and b!603983 res!387904) b!603965))

(declare-fun m!581177 () Bool)

(assert (=> b!603977 m!581177))

(declare-fun m!581179 () Bool)

(assert (=> b!603977 m!581179))

(assert (=> b!603977 m!581179))

(declare-fun m!581181 () Bool)

(assert (=> b!603977 m!581181))

(declare-fun m!581183 () Bool)

(assert (=> b!603973 m!581183))

(assert (=> b!603973 m!581179))

(declare-fun m!581185 () Bool)

(assert (=> b!603973 m!581185))

(declare-fun m!581187 () Bool)

(assert (=> b!603973 m!581187))

(assert (=> b!603973 m!581179))

(declare-fun m!581189 () Bool)

(assert (=> b!603973 m!581189))

(assert (=> b!603973 m!581179))

(declare-fun m!581191 () Bool)

(assert (=> b!603973 m!581191))

(declare-fun m!581193 () Bool)

(assert (=> b!603973 m!581193))

(assert (=> b!603973 m!581179))

(declare-fun m!581195 () Bool)

(assert (=> b!603973 m!581195))

(declare-fun m!581197 () Bool)

(assert (=> b!603976 m!581197))

(declare-fun m!581199 () Bool)

(assert (=> b!603974 m!581199))

(declare-fun m!581201 () Bool)

(assert (=> b!603966 m!581201))

(assert (=> b!603985 m!581179))

(declare-fun m!581203 () Bool)

(assert (=> b!603985 m!581203))

(declare-fun m!581205 () Bool)

(assert (=> b!603985 m!581205))

(declare-fun m!581207 () Bool)

(assert (=> b!603978 m!581207))

(declare-fun m!581209 () Bool)

(assert (=> b!603978 m!581209))

(assert (=> b!603978 m!581179))

(assert (=> b!603978 m!581203))

(declare-fun m!581211 () Bool)

(assert (=> b!603978 m!581211))

(declare-fun m!581213 () Bool)

(assert (=> b!603978 m!581213))

(declare-fun m!581215 () Bool)

(assert (=> b!603978 m!581215))

(assert (=> b!603978 m!581179))

(declare-fun m!581217 () Bool)

(assert (=> b!603978 m!581217))

(assert (=> b!603965 m!581179))

(assert (=> b!603965 m!581179))

(declare-fun m!581219 () Bool)

(assert (=> b!603965 m!581219))

(declare-fun m!581221 () Bool)

(assert (=> b!603975 m!581221))

(assert (=> b!603963 m!581179))

(assert (=> b!603963 m!581179))

(declare-fun m!581223 () Bool)

(assert (=> b!603963 m!581223))

(assert (=> b!603983 m!581179))

(assert (=> b!603983 m!581179))

(assert (=> b!603983 m!581223))

(assert (=> b!603980 m!581203))

(declare-fun m!581225 () Bool)

(assert (=> b!603980 m!581225))

(declare-fun m!581227 () Bool)

(assert (=> b!603967 m!581227))

(assert (=> b!603981 m!581179))

(declare-fun m!581229 () Bool)

(assert (=> start!55182 m!581229))

(declare-fun m!581231 () Bool)

(assert (=> start!55182 m!581231))

(assert (=> b!603969 m!581179))

(assert (=> b!603969 m!581179))

(assert (=> b!603969 m!581219))

(assert (=> b!603982 m!581179))

(assert (=> b!603982 m!581179))

(declare-fun m!581233 () Bool)

(assert (=> b!603982 m!581233))

(declare-fun m!581235 () Bool)

(assert (=> b!603964 m!581235))

(check-sat (not b!603969) (not b!603974) (not b!603976) (not b!603978) (not b!603977) (not b!603963) (not b!603964) (not start!55182) (not b!603965) (not b!603983) (not b!603966) (not b!603973) (not b!603982) (not b!603967))
(check-sat)
