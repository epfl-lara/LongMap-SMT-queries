; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56076 () Bool)

(assert start!56076)

(declare-fun b!618173 () Bool)

(declare-datatypes ((Unit!20318 0))(
  ( (Unit!20319) )
))
(declare-fun e!354498 () Unit!20318)

(declare-fun Unit!20320 () Unit!20318)

(assert (=> b!618173 (= e!354498 Unit!20320)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37546 0))(
  ( (array!37547 (arr!18019 (Array (_ BitVec 32) (_ BitVec 64))) (size!18383 (_ BitVec 32))) )
))
(declare-fun lt!284904 () array!37546)

(declare-fun e!354500 () Bool)

(declare-fun b!618174 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37546)

(declare-fun arrayContainsKey!0 (array!37546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618174 (= e!354500 (arrayContainsKey!0 lt!284904 (select (arr!18019 a!2986) j!136) index!984))))

(declare-fun b!618175 () Bool)

(declare-fun e!354504 () Unit!20318)

(declare-fun Unit!20321 () Unit!20318)

(assert (=> b!618175 (= e!354504 Unit!20321)))

(declare-fun b!618176 () Bool)

(declare-fun res!398267 () Bool)

(declare-fun e!354499 () Bool)

(assert (=> b!618176 (=> (not res!398267) (not e!354499))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!618176 (= res!398267 (and (= (size!18383 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18383 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18383 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618177 () Bool)

(declare-fun e!354495 () Bool)

(declare-datatypes ((SeekEntryResult!6459 0))(
  ( (MissingZero!6459 (index!28120 (_ BitVec 32))) (Found!6459 (index!28121 (_ BitVec 32))) (Intermediate!6459 (undefined!7271 Bool) (index!28122 (_ BitVec 32)) (x!56907 (_ BitVec 32))) (Undefined!6459) (MissingVacant!6459 (index!28123 (_ BitVec 32))) )
))
(declare-fun lt!284899 () SeekEntryResult!6459)

(declare-fun lt!284898 () SeekEntryResult!6459)

(assert (=> b!618177 (= e!354495 (= lt!284899 lt!284898))))

(declare-fun b!618178 () Bool)

(declare-fun res!398273 () Bool)

(assert (=> b!618178 (= res!398273 (arrayContainsKey!0 lt!284904 (select (arr!18019 a!2986) j!136) j!136))))

(assert (=> b!618178 (=> (not res!398273) (not e!354500))))

(declare-fun e!354507 () Bool)

(assert (=> b!618178 (= e!354507 e!354500)))

(declare-fun b!618179 () Bool)

(declare-fun e!354493 () Bool)

(declare-fun e!354505 () Bool)

(assert (=> b!618179 (= e!354493 (not e!354505))))

(declare-fun res!398277 () Bool)

(assert (=> b!618179 (=> res!398277 e!354505)))

(declare-fun lt!284911 () SeekEntryResult!6459)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!618179 (= res!398277 (not (= lt!284911 (MissingVacant!6459 vacantSpotIndex!68))))))

(declare-fun lt!284906 () Unit!20318)

(assert (=> b!618179 (= lt!284906 e!354504)))

(declare-fun c!70324 () Bool)

(assert (=> b!618179 (= c!70324 (= lt!284911 (Found!6459 index!984)))))

(declare-fun lt!284901 () Unit!20318)

(assert (=> b!618179 (= lt!284901 e!354498)))

(declare-fun c!70322 () Bool)

(assert (=> b!618179 (= c!70322 (= lt!284911 Undefined!6459))))

(declare-fun lt!284914 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37546 (_ BitVec 32)) SeekEntryResult!6459)

(assert (=> b!618179 (= lt!284911 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284914 lt!284904 mask!3053))))

(assert (=> b!618179 e!354495))

(declare-fun res!398269 () Bool)

(assert (=> b!618179 (=> (not res!398269) (not e!354495))))

(declare-fun lt!284916 () (_ BitVec 32))

(assert (=> b!618179 (= res!398269 (= lt!284898 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284916 vacantSpotIndex!68 lt!284914 lt!284904 mask!3053)))))

(assert (=> b!618179 (= lt!284898 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284916 vacantSpotIndex!68 (select (arr!18019 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!618179 (= lt!284914 (select (store (arr!18019 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284903 () Unit!20318)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37546 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20318)

(assert (=> b!618179 (= lt!284903 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284916 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618179 (= lt!284916 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618180 () Bool)

(declare-fun res!398270 () Bool)

(declare-fun e!354496 () Bool)

(assert (=> b!618180 (=> (not res!398270) (not e!354496))))

(declare-datatypes ((List!12060 0))(
  ( (Nil!12057) (Cons!12056 (h!13101 (_ BitVec 64)) (t!18288 List!12060)) )
))
(declare-fun arrayNoDuplicates!0 (array!37546 (_ BitVec 32) List!12060) Bool)

(assert (=> b!618180 (= res!398270 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12057))))

(declare-fun b!618181 () Bool)

(assert (=> b!618181 false))

(declare-fun lt!284917 () Unit!20318)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37546 (_ BitVec 64) (_ BitVec 32) List!12060) Unit!20318)

(assert (=> b!618181 (= lt!284917 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284904 (select (arr!18019 a!2986) j!136) index!984 Nil!12057))))

(assert (=> b!618181 (arrayNoDuplicates!0 lt!284904 index!984 Nil!12057)))

(declare-fun lt!284900 () Unit!20318)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37546 (_ BitVec 32) (_ BitVec 32)) Unit!20318)

(assert (=> b!618181 (= lt!284900 (lemmaNoDuplicateFromThenFromBigger!0 lt!284904 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618181 (arrayNoDuplicates!0 lt!284904 #b00000000000000000000000000000000 Nil!12057)))

(declare-fun lt!284910 () Unit!20318)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37546 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12060) Unit!20318)

(assert (=> b!618181 (= lt!284910 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12057))))

(assert (=> b!618181 (arrayContainsKey!0 lt!284904 (select (arr!18019 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284915 () Unit!20318)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37546 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20318)

(assert (=> b!618181 (= lt!284915 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284904 (select (arr!18019 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354503 () Bool)

(assert (=> b!618181 e!354503))

(declare-fun res!398271 () Bool)

(assert (=> b!618181 (=> (not res!398271) (not e!354503))))

(assert (=> b!618181 (= res!398271 (arrayContainsKey!0 lt!284904 (select (arr!18019 a!2986) j!136) j!136))))

(declare-fun e!354502 () Unit!20318)

(declare-fun Unit!20322 () Unit!20318)

(assert (=> b!618181 (= e!354502 Unit!20322)))

(declare-fun b!618182 () Bool)

(declare-fun e!354501 () Bool)

(assert (=> b!618182 (= e!354496 e!354501)))

(declare-fun res!398264 () Bool)

(assert (=> b!618182 (=> (not res!398264) (not e!354501))))

(assert (=> b!618182 (= res!398264 (= (select (store (arr!18019 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618182 (= lt!284904 (array!37547 (store (arr!18019 a!2986) i!1108 k0!1786) (size!18383 a!2986)))))

(declare-fun b!618183 () Bool)

(declare-fun res!398274 () Bool)

(assert (=> b!618183 (=> (not res!398274) (not e!354499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618183 (= res!398274 (validKeyInArray!0 k0!1786))))

(declare-fun b!618184 () Bool)

(declare-fun Unit!20323 () Unit!20318)

(assert (=> b!618184 (= e!354498 Unit!20323)))

(assert (=> b!618184 false))

(declare-fun b!618185 () Bool)

(declare-fun res!398278 () Bool)

(assert (=> b!618185 (=> (not res!398278) (not e!354496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37546 (_ BitVec 32)) Bool)

(assert (=> b!618185 (= res!398278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618187 () Bool)

(declare-fun e!354497 () Unit!20318)

(declare-fun Unit!20324 () Unit!20318)

(assert (=> b!618187 (= e!354497 Unit!20324)))

(declare-fun b!618188 () Bool)

(declare-fun Unit!20325 () Unit!20318)

(assert (=> b!618188 (= e!354504 Unit!20325)))

(declare-fun res!398276 () Bool)

(assert (=> b!618188 (= res!398276 (= (select (store (arr!18019 a!2986) i!1108 k0!1786) index!984) (select (arr!18019 a!2986) j!136)))))

(declare-fun e!354494 () Bool)

(assert (=> b!618188 (=> (not res!398276) (not e!354494))))

(assert (=> b!618188 e!354494))

(declare-fun c!70323 () Bool)

(assert (=> b!618188 (= c!70323 (bvslt j!136 index!984))))

(declare-fun lt!284912 () Unit!20318)

(assert (=> b!618188 (= lt!284912 e!354497)))

(declare-fun c!70325 () Bool)

(assert (=> b!618188 (= c!70325 (bvslt index!984 j!136))))

(declare-fun lt!284905 () Unit!20318)

(assert (=> b!618188 (= lt!284905 e!354502)))

(assert (=> b!618188 false))

(declare-fun b!618189 () Bool)

(assert (=> b!618189 (= e!354505 true)))

(assert (=> b!618189 (= (select (store (arr!18019 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618190 () Bool)

(assert (=> b!618190 (= e!354503 (arrayContainsKey!0 lt!284904 (select (arr!18019 a!2986) j!136) index!984))))

(declare-fun b!618191 () Bool)

(declare-fun Unit!20326 () Unit!20318)

(assert (=> b!618191 (= e!354502 Unit!20326)))

(declare-fun b!618192 () Bool)

(assert (=> b!618192 false))

(declare-fun lt!284902 () Unit!20318)

(assert (=> b!618192 (= lt!284902 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284904 (select (arr!18019 a!2986) j!136) j!136 Nil!12057))))

(assert (=> b!618192 (arrayNoDuplicates!0 lt!284904 j!136 Nil!12057)))

(declare-fun lt!284913 () Unit!20318)

(assert (=> b!618192 (= lt!284913 (lemmaNoDuplicateFromThenFromBigger!0 lt!284904 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618192 (arrayNoDuplicates!0 lt!284904 #b00000000000000000000000000000000 Nil!12057)))

(declare-fun lt!284908 () Unit!20318)

(assert (=> b!618192 (= lt!284908 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12057))))

(assert (=> b!618192 (arrayContainsKey!0 lt!284904 (select (arr!18019 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284907 () Unit!20318)

(assert (=> b!618192 (= lt!284907 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284904 (select (arr!18019 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20327 () Unit!20318)

(assert (=> b!618192 (= e!354497 Unit!20327)))

(declare-fun b!618193 () Bool)

(declare-fun res!398279 () Bool)

(assert (=> b!618193 (=> (not res!398279) (not e!354499))))

(assert (=> b!618193 (= res!398279 (validKeyInArray!0 (select (arr!18019 a!2986) j!136)))))

(declare-fun b!618194 () Bool)

(assert (=> b!618194 (= e!354501 e!354493)))

(declare-fun res!398263 () Bool)

(assert (=> b!618194 (=> (not res!398263) (not e!354493))))

(assert (=> b!618194 (= res!398263 (and (= lt!284899 (Found!6459 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18019 a!2986) index!984) (select (arr!18019 a!2986) j!136))) (not (= (select (arr!18019 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!618194 (= lt!284899 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18019 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618195 () Bool)

(assert (=> b!618195 (= e!354499 e!354496)))

(declare-fun res!398275 () Bool)

(assert (=> b!618195 (=> (not res!398275) (not e!354496))))

(declare-fun lt!284909 () SeekEntryResult!6459)

(assert (=> b!618195 (= res!398275 (or (= lt!284909 (MissingZero!6459 i!1108)) (= lt!284909 (MissingVacant!6459 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37546 (_ BitVec 32)) SeekEntryResult!6459)

(assert (=> b!618195 (= lt!284909 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!618196 () Bool)

(declare-fun res!398266 () Bool)

(assert (=> b!618196 (=> (not res!398266) (not e!354496))))

(assert (=> b!618196 (= res!398266 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18019 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618197 () Bool)

(declare-fun res!398272 () Bool)

(assert (=> b!618197 (=> (not res!398272) (not e!354499))))

(assert (=> b!618197 (= res!398272 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!398268 () Bool)

(assert (=> start!56076 (=> (not res!398268) (not e!354499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56076 (= res!398268 (validMask!0 mask!3053))))

(assert (=> start!56076 e!354499))

(assert (=> start!56076 true))

(declare-fun array_inv!13815 (array!37546) Bool)

(assert (=> start!56076 (array_inv!13815 a!2986)))

(declare-fun b!618186 () Bool)

(declare-fun res!398265 () Bool)

(assert (=> b!618186 (= res!398265 (bvsge j!136 index!984))))

(assert (=> b!618186 (=> res!398265 e!354507)))

(assert (=> b!618186 (= e!354494 e!354507)))

(assert (= (and start!56076 res!398268) b!618176))

(assert (= (and b!618176 res!398267) b!618193))

(assert (= (and b!618193 res!398279) b!618183))

(assert (= (and b!618183 res!398274) b!618197))

(assert (= (and b!618197 res!398272) b!618195))

(assert (= (and b!618195 res!398275) b!618185))

(assert (= (and b!618185 res!398278) b!618180))

(assert (= (and b!618180 res!398270) b!618196))

(assert (= (and b!618196 res!398266) b!618182))

(assert (= (and b!618182 res!398264) b!618194))

(assert (= (and b!618194 res!398263) b!618179))

(assert (= (and b!618179 res!398269) b!618177))

(assert (= (and b!618179 c!70322) b!618184))

(assert (= (and b!618179 (not c!70322)) b!618173))

(assert (= (and b!618179 c!70324) b!618188))

(assert (= (and b!618179 (not c!70324)) b!618175))

(assert (= (and b!618188 res!398276) b!618186))

(assert (= (and b!618186 (not res!398265)) b!618178))

(assert (= (and b!618178 res!398273) b!618174))

(assert (= (and b!618188 c!70323) b!618192))

(assert (= (and b!618188 (not c!70323)) b!618187))

(assert (= (and b!618188 c!70325) b!618181))

(assert (= (and b!618188 (not c!70325)) b!618191))

(assert (= (and b!618181 res!398271) b!618190))

(assert (= (and b!618179 (not res!398277)) b!618189))

(declare-fun m!594231 () Bool)

(assert (=> b!618178 m!594231))

(assert (=> b!618178 m!594231))

(declare-fun m!594233 () Bool)

(assert (=> b!618178 m!594233))

(declare-fun m!594235 () Bool)

(assert (=> b!618194 m!594235))

(assert (=> b!618194 m!594231))

(assert (=> b!618194 m!594231))

(declare-fun m!594237 () Bool)

(assert (=> b!618194 m!594237))

(declare-fun m!594239 () Bool)

(assert (=> b!618189 m!594239))

(declare-fun m!594241 () Bool)

(assert (=> b!618189 m!594241))

(assert (=> b!618174 m!594231))

(assert (=> b!618174 m!594231))

(declare-fun m!594243 () Bool)

(assert (=> b!618174 m!594243))

(declare-fun m!594245 () Bool)

(assert (=> b!618181 m!594245))

(assert (=> b!618181 m!594231))

(assert (=> b!618181 m!594231))

(declare-fun m!594247 () Bool)

(assert (=> b!618181 m!594247))

(assert (=> b!618181 m!594231))

(assert (=> b!618181 m!594233))

(declare-fun m!594249 () Bool)

(assert (=> b!618181 m!594249))

(assert (=> b!618181 m!594231))

(declare-fun m!594251 () Bool)

(assert (=> b!618181 m!594251))

(assert (=> b!618181 m!594231))

(declare-fun m!594253 () Bool)

(assert (=> b!618181 m!594253))

(declare-fun m!594255 () Bool)

(assert (=> b!618181 m!594255))

(declare-fun m!594257 () Bool)

(assert (=> b!618181 m!594257))

(declare-fun m!594259 () Bool)

(assert (=> b!618180 m!594259))

(declare-fun m!594261 () Bool)

(assert (=> b!618195 m!594261))

(assert (=> b!618193 m!594231))

(assert (=> b!618193 m!594231))

(declare-fun m!594263 () Bool)

(assert (=> b!618193 m!594263))

(declare-fun m!594265 () Bool)

(assert (=> start!56076 m!594265))

(declare-fun m!594267 () Bool)

(assert (=> start!56076 m!594267))

(assert (=> b!618190 m!594231))

(assert (=> b!618190 m!594231))

(assert (=> b!618190 m!594243))

(declare-fun m!594269 () Bool)

(assert (=> b!618196 m!594269))

(assert (=> b!618182 m!594239))

(declare-fun m!594271 () Bool)

(assert (=> b!618182 m!594271))

(assert (=> b!618192 m!594231))

(declare-fun m!594273 () Bool)

(assert (=> b!618192 m!594273))

(assert (=> b!618192 m!594245))

(assert (=> b!618192 m!594231))

(assert (=> b!618192 m!594231))

(declare-fun m!594275 () Bool)

(assert (=> b!618192 m!594275))

(declare-fun m!594277 () Bool)

(assert (=> b!618192 m!594277))

(assert (=> b!618192 m!594231))

(declare-fun m!594279 () Bool)

(assert (=> b!618192 m!594279))

(declare-fun m!594281 () Bool)

(assert (=> b!618192 m!594281))

(assert (=> b!618192 m!594257))

(declare-fun m!594283 () Bool)

(assert (=> b!618183 m!594283))

(assert (=> b!618188 m!594239))

(assert (=> b!618188 m!594241))

(assert (=> b!618188 m!594231))

(declare-fun m!594285 () Bool)

(assert (=> b!618179 m!594285))

(declare-fun m!594287 () Bool)

(assert (=> b!618179 m!594287))

(declare-fun m!594289 () Bool)

(assert (=> b!618179 m!594289))

(assert (=> b!618179 m!594231))

(declare-fun m!594291 () Bool)

(assert (=> b!618179 m!594291))

(assert (=> b!618179 m!594239))

(declare-fun m!594293 () Bool)

(assert (=> b!618179 m!594293))

(assert (=> b!618179 m!594231))

(declare-fun m!594295 () Bool)

(assert (=> b!618179 m!594295))

(declare-fun m!594297 () Bool)

(assert (=> b!618197 m!594297))

(declare-fun m!594299 () Bool)

(assert (=> b!618185 m!594299))

(check-sat (not b!618179) (not b!618178) (not b!618192) (not start!56076) (not b!618194) (not b!618181) (not b!618185) (not b!618183) (not b!618195) (not b!618180) (not b!618190) (not b!618193) (not b!618197) (not b!618174))
(check-sat)
