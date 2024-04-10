; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59554 () Bool)

(assert start!59554)

(declare-fun b!657179 () Bool)

(declare-fun res!426144 () Bool)

(declare-fun e!377504 () Bool)

(assert (=> b!657179 (=> (not res!426144) (not e!377504))))

(declare-datatypes ((array!38712 0))(
  ( (array!38713 (arr!18553 (Array (_ BitVec 32) (_ BitVec 64))) (size!18917 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38712)

(declare-datatypes ((List!12594 0))(
  ( (Nil!12591) (Cons!12590 (h!13635 (_ BitVec 64)) (t!18822 List!12594)) )
))
(declare-fun arrayNoDuplicates!0 (array!38712 (_ BitVec 32) List!12594) Bool)

(assert (=> b!657179 (= res!426144 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12591))))

(declare-fun b!657180 () Bool)

(declare-fun res!426148 () Bool)

(declare-fun e!377505 () Bool)

(assert (=> b!657180 (=> (not res!426148) (not e!377505))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657180 (= res!426148 (validKeyInArray!0 (select (arr!18553 a!2986) j!136)))))

(declare-fun b!657181 () Bool)

(declare-fun res!426140 () Bool)

(assert (=> b!657181 (=> (not res!426140) (not e!377504))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38712 (_ BitVec 32)) Bool)

(assert (=> b!657181 (= res!426140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun lt!306863 () array!38712)

(declare-fun b!657182 () Bool)

(declare-fun res!426142 () Bool)

(declare-fun arrayContainsKey!0 (array!38712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657182 (= res!426142 (arrayContainsKey!0 lt!306863 (select (arr!18553 a!2986) j!136) j!136))))

(declare-fun e!377507 () Bool)

(assert (=> b!657182 (=> (not res!426142) (not e!377507))))

(declare-fun e!377511 () Bool)

(assert (=> b!657182 (= e!377511 e!377507)))

(declare-fun b!657183 () Bool)

(declare-datatypes ((Unit!22684 0))(
  ( (Unit!22685) )
))
(declare-fun e!377503 () Unit!22684)

(declare-fun Unit!22686 () Unit!22684)

(assert (=> b!657183 (= e!377503 Unit!22686)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun res!426141 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!657183 (= res!426141 (= (select (store (arr!18553 a!2986) i!1108 k0!1786) index!984) (select (arr!18553 a!2986) j!136)))))

(declare-fun e!377510 () Bool)

(assert (=> b!657183 (=> (not res!426141) (not e!377510))))

(assert (=> b!657183 e!377510))

(declare-fun c!75889 () Bool)

(assert (=> b!657183 (= c!75889 (bvslt j!136 index!984))))

(declare-fun lt!306865 () Unit!22684)

(declare-fun e!377509 () Unit!22684)

(assert (=> b!657183 (= lt!306865 e!377509)))

(declare-fun c!75887 () Bool)

(assert (=> b!657183 (= c!75887 (bvslt index!984 j!136))))

(declare-fun lt!306857 () Unit!22684)

(declare-fun e!377514 () Unit!22684)

(assert (=> b!657183 (= lt!306857 e!377514)))

(assert (=> b!657183 false))

(declare-fun b!657184 () Bool)

(assert (=> b!657184 (= e!377507 (arrayContainsKey!0 lt!306863 (select (arr!18553 a!2986) j!136) index!984))))

(declare-fun b!657185 () Bool)

(declare-fun e!377516 () Bool)

(declare-fun e!377512 () Bool)

(assert (=> b!657185 (= e!377516 (not e!377512))))

(declare-fun res!426150 () Bool)

(assert (=> b!657185 (=> res!426150 e!377512)))

(declare-datatypes ((SeekEntryResult!6993 0))(
  ( (MissingZero!6993 (index!30337 (_ BitVec 32))) (Found!6993 (index!30338 (_ BitVec 32))) (Intermediate!6993 (undefined!7805 Bool) (index!30339 (_ BitVec 32)) (x!59132 (_ BitVec 32))) (Undefined!6993) (MissingVacant!6993 (index!30340 (_ BitVec 32))) )
))
(declare-fun lt!306862 () SeekEntryResult!6993)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!657185 (= res!426150 (not (= lt!306862 (MissingVacant!6993 vacantSpotIndex!68))))))

(declare-fun lt!306851 () Unit!22684)

(assert (=> b!657185 (= lt!306851 e!377503)))

(declare-fun c!75890 () Bool)

(assert (=> b!657185 (= c!75890 (= lt!306862 (Found!6993 index!984)))))

(declare-fun lt!306854 () Unit!22684)

(declare-fun e!377506 () Unit!22684)

(assert (=> b!657185 (= lt!306854 e!377506)))

(declare-fun c!75888 () Bool)

(assert (=> b!657185 (= c!75888 (= lt!306862 Undefined!6993))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!306868 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38712 (_ BitVec 32)) SeekEntryResult!6993)

(assert (=> b!657185 (= lt!306862 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306868 lt!306863 mask!3053))))

(declare-fun e!377517 () Bool)

(assert (=> b!657185 e!377517))

(declare-fun res!426151 () Bool)

(assert (=> b!657185 (=> (not res!426151) (not e!377517))))

(declare-fun lt!306859 () (_ BitVec 32))

(declare-fun lt!306849 () SeekEntryResult!6993)

(assert (=> b!657185 (= res!426151 (= lt!306849 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306859 vacantSpotIndex!68 lt!306868 lt!306863 mask!3053)))))

(assert (=> b!657185 (= lt!306849 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306859 vacantSpotIndex!68 (select (arr!18553 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657185 (= lt!306868 (select (store (arr!18553 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!306856 () Unit!22684)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38712 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22684)

(assert (=> b!657185 (= lt!306856 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306859 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657185 (= lt!306859 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!657186 () Bool)

(declare-fun Unit!22687 () Unit!22684)

(assert (=> b!657186 (= e!377506 Unit!22687)))

(declare-fun b!657187 () Bool)

(declare-fun Unit!22688 () Unit!22684)

(assert (=> b!657187 (= e!377509 Unit!22688)))

(declare-fun b!657188 () Bool)

(declare-fun Unit!22689 () Unit!22684)

(assert (=> b!657188 (= e!377503 Unit!22689)))

(declare-fun e!377515 () Bool)

(declare-fun b!657189 () Bool)

(assert (=> b!657189 (= e!377515 (arrayContainsKey!0 lt!306863 (select (arr!18553 a!2986) j!136) index!984))))

(declare-fun b!657190 () Bool)

(assert (=> b!657190 (= e!377505 e!377504)))

(declare-fun res!426154 () Bool)

(assert (=> b!657190 (=> (not res!426154) (not e!377504))))

(declare-fun lt!306852 () SeekEntryResult!6993)

(assert (=> b!657190 (= res!426154 (or (= lt!306852 (MissingZero!6993 i!1108)) (= lt!306852 (MissingVacant!6993 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38712 (_ BitVec 32)) SeekEntryResult!6993)

(assert (=> b!657190 (= lt!306852 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!657191 () Bool)

(declare-fun res!426152 () Bool)

(assert (=> b!657191 (=> (not res!426152) (not e!377504))))

(assert (=> b!657191 (= res!426152 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18553 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!657192 () Bool)

(assert (=> b!657192 (= e!377512 true)))

(assert (=> b!657192 (= (select (store (arr!18553 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!657193 () Bool)

(declare-fun res!426145 () Bool)

(assert (=> b!657193 (=> (not res!426145) (not e!377505))))

(assert (=> b!657193 (= res!426145 (and (= (size!18917 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18917 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18917 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657195 () Bool)

(declare-fun res!426139 () Bool)

(assert (=> b!657195 (=> (not res!426139) (not e!377505))))

(assert (=> b!657195 (= res!426139 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!426143 () Bool)

(assert (=> start!59554 (=> (not res!426143) (not e!377505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59554 (= res!426143 (validMask!0 mask!3053))))

(assert (=> start!59554 e!377505))

(assert (=> start!59554 true))

(declare-fun array_inv!14349 (array!38712) Bool)

(assert (=> start!59554 (array_inv!14349 a!2986)))

(declare-fun b!657194 () Bool)

(declare-fun Unit!22690 () Unit!22684)

(assert (=> b!657194 (= e!377506 Unit!22690)))

(assert (=> b!657194 false))

(declare-fun b!657196 () Bool)

(declare-fun e!377513 () Bool)

(assert (=> b!657196 (= e!377504 e!377513)))

(declare-fun res!426155 () Bool)

(assert (=> b!657196 (=> (not res!426155) (not e!377513))))

(assert (=> b!657196 (= res!426155 (= (select (store (arr!18553 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657196 (= lt!306863 (array!38713 (store (arr!18553 a!2986) i!1108 k0!1786) (size!18917 a!2986)))))

(declare-fun b!657197 () Bool)

(assert (=> b!657197 false))

(declare-fun lt!306867 () Unit!22684)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38712 (_ BitVec 64) (_ BitVec 32) List!12594) Unit!22684)

(assert (=> b!657197 (= lt!306867 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306863 (select (arr!18553 a!2986) j!136) index!984 Nil!12591))))

(assert (=> b!657197 (arrayNoDuplicates!0 lt!306863 index!984 Nil!12591)))

(declare-fun lt!306861 () Unit!22684)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38712 (_ BitVec 32) (_ BitVec 32)) Unit!22684)

(assert (=> b!657197 (= lt!306861 (lemmaNoDuplicateFromThenFromBigger!0 lt!306863 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657197 (arrayNoDuplicates!0 lt!306863 #b00000000000000000000000000000000 Nil!12591)))

(declare-fun lt!306855 () Unit!22684)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38712 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12594) Unit!22684)

(assert (=> b!657197 (= lt!306855 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12591))))

(assert (=> b!657197 (arrayContainsKey!0 lt!306863 (select (arr!18553 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306866 () Unit!22684)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38712 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22684)

(assert (=> b!657197 (= lt!306866 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306863 (select (arr!18553 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!657197 e!377515))

(declare-fun res!426149 () Bool)

(assert (=> b!657197 (=> (not res!426149) (not e!377515))))

(assert (=> b!657197 (= res!426149 (arrayContainsKey!0 lt!306863 (select (arr!18553 a!2986) j!136) j!136))))

(declare-fun Unit!22691 () Unit!22684)

(assert (=> b!657197 (= e!377514 Unit!22691)))

(declare-fun b!657198 () Bool)

(declare-fun Unit!22692 () Unit!22684)

(assert (=> b!657198 (= e!377514 Unit!22692)))

(declare-fun b!657199 () Bool)

(declare-fun res!426146 () Bool)

(assert (=> b!657199 (=> (not res!426146) (not e!377505))))

(assert (=> b!657199 (= res!426146 (validKeyInArray!0 k0!1786))))

(declare-fun b!657200 () Bool)

(declare-fun res!426153 () Bool)

(assert (=> b!657200 (= res!426153 (bvsge j!136 index!984))))

(assert (=> b!657200 (=> res!426153 e!377511)))

(assert (=> b!657200 (= e!377510 e!377511)))

(declare-fun b!657201 () Bool)

(assert (=> b!657201 (= e!377513 e!377516)))

(declare-fun res!426147 () Bool)

(assert (=> b!657201 (=> (not res!426147) (not e!377516))))

(declare-fun lt!306858 () SeekEntryResult!6993)

(assert (=> b!657201 (= res!426147 (and (= lt!306858 (Found!6993 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18553 a!2986) index!984) (select (arr!18553 a!2986) j!136))) (not (= (select (arr!18553 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!657201 (= lt!306858 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18553 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!657202 () Bool)

(assert (=> b!657202 (= e!377517 (= lt!306858 lt!306849))))

(declare-fun b!657203 () Bool)

(assert (=> b!657203 false))

(declare-fun lt!306860 () Unit!22684)

(assert (=> b!657203 (= lt!306860 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306863 (select (arr!18553 a!2986) j!136) j!136 Nil!12591))))

(assert (=> b!657203 (arrayNoDuplicates!0 lt!306863 j!136 Nil!12591)))

(declare-fun lt!306850 () Unit!22684)

(assert (=> b!657203 (= lt!306850 (lemmaNoDuplicateFromThenFromBigger!0 lt!306863 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657203 (arrayNoDuplicates!0 lt!306863 #b00000000000000000000000000000000 Nil!12591)))

(declare-fun lt!306864 () Unit!22684)

(assert (=> b!657203 (= lt!306864 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12591))))

(assert (=> b!657203 (arrayContainsKey!0 lt!306863 (select (arr!18553 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306853 () Unit!22684)

(assert (=> b!657203 (= lt!306853 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306863 (select (arr!18553 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22693 () Unit!22684)

(assert (=> b!657203 (= e!377509 Unit!22693)))

(assert (= (and start!59554 res!426143) b!657193))

(assert (= (and b!657193 res!426145) b!657180))

(assert (= (and b!657180 res!426148) b!657199))

(assert (= (and b!657199 res!426146) b!657195))

(assert (= (and b!657195 res!426139) b!657190))

(assert (= (and b!657190 res!426154) b!657181))

(assert (= (and b!657181 res!426140) b!657179))

(assert (= (and b!657179 res!426144) b!657191))

(assert (= (and b!657191 res!426152) b!657196))

(assert (= (and b!657196 res!426155) b!657201))

(assert (= (and b!657201 res!426147) b!657185))

(assert (= (and b!657185 res!426151) b!657202))

(assert (= (and b!657185 c!75888) b!657194))

(assert (= (and b!657185 (not c!75888)) b!657186))

(assert (= (and b!657185 c!75890) b!657183))

(assert (= (and b!657185 (not c!75890)) b!657188))

(assert (= (and b!657183 res!426141) b!657200))

(assert (= (and b!657200 (not res!426153)) b!657182))

(assert (= (and b!657182 res!426142) b!657184))

(assert (= (and b!657183 c!75889) b!657203))

(assert (= (and b!657183 (not c!75889)) b!657187))

(assert (= (and b!657183 c!75887) b!657197))

(assert (= (and b!657183 (not c!75887)) b!657198))

(assert (= (and b!657197 res!426149) b!657189))

(assert (= (and b!657185 (not res!426150)) b!657192))

(declare-fun m!630237 () Bool)

(assert (=> b!657192 m!630237))

(declare-fun m!630239 () Bool)

(assert (=> b!657192 m!630239))

(assert (=> b!657183 m!630237))

(assert (=> b!657183 m!630239))

(declare-fun m!630241 () Bool)

(assert (=> b!657183 m!630241))

(assert (=> b!657184 m!630241))

(assert (=> b!657184 m!630241))

(declare-fun m!630243 () Bool)

(assert (=> b!657184 m!630243))

(declare-fun m!630245 () Bool)

(assert (=> b!657195 m!630245))

(declare-fun m!630247 () Bool)

(assert (=> b!657181 m!630247))

(declare-fun m!630249 () Bool)

(assert (=> b!657190 m!630249))

(assert (=> b!657197 m!630241))

(declare-fun m!630251 () Bool)

(assert (=> b!657197 m!630251))

(assert (=> b!657197 m!630241))

(assert (=> b!657197 m!630241))

(declare-fun m!630253 () Bool)

(assert (=> b!657197 m!630253))

(declare-fun m!630255 () Bool)

(assert (=> b!657197 m!630255))

(assert (=> b!657197 m!630241))

(declare-fun m!630257 () Bool)

(assert (=> b!657197 m!630257))

(declare-fun m!630259 () Bool)

(assert (=> b!657197 m!630259))

(declare-fun m!630261 () Bool)

(assert (=> b!657197 m!630261))

(assert (=> b!657197 m!630241))

(declare-fun m!630263 () Bool)

(assert (=> b!657197 m!630263))

(declare-fun m!630265 () Bool)

(assert (=> b!657197 m!630265))

(declare-fun m!630267 () Bool)

(assert (=> b!657185 m!630267))

(declare-fun m!630269 () Bool)

(assert (=> b!657185 m!630269))

(assert (=> b!657185 m!630241))

(assert (=> b!657185 m!630237))

(declare-fun m!630271 () Bool)

(assert (=> b!657185 m!630271))

(assert (=> b!657185 m!630241))

(declare-fun m!630273 () Bool)

(assert (=> b!657185 m!630273))

(declare-fun m!630275 () Bool)

(assert (=> b!657185 m!630275))

(declare-fun m!630277 () Bool)

(assert (=> b!657185 m!630277))

(declare-fun m!630279 () Bool)

(assert (=> b!657199 m!630279))

(declare-fun m!630281 () Bool)

(assert (=> b!657201 m!630281))

(assert (=> b!657201 m!630241))

(assert (=> b!657201 m!630241))

(declare-fun m!630283 () Bool)

(assert (=> b!657201 m!630283))

(assert (=> b!657203 m!630241))

(declare-fun m!630285 () Bool)

(assert (=> b!657203 m!630285))

(assert (=> b!657203 m!630241))

(declare-fun m!630287 () Bool)

(assert (=> b!657203 m!630287))

(assert (=> b!657203 m!630259))

(declare-fun m!630289 () Bool)

(assert (=> b!657203 m!630289))

(assert (=> b!657203 m!630265))

(assert (=> b!657203 m!630241))

(declare-fun m!630291 () Bool)

(assert (=> b!657203 m!630291))

(assert (=> b!657203 m!630241))

(declare-fun m!630293 () Bool)

(assert (=> b!657203 m!630293))

(assert (=> b!657180 m!630241))

(assert (=> b!657180 m!630241))

(declare-fun m!630295 () Bool)

(assert (=> b!657180 m!630295))

(assert (=> b!657196 m!630237))

(declare-fun m!630297 () Bool)

(assert (=> b!657196 m!630297))

(declare-fun m!630299 () Bool)

(assert (=> b!657179 m!630299))

(declare-fun m!630301 () Bool)

(assert (=> b!657191 m!630301))

(assert (=> b!657189 m!630241))

(assert (=> b!657189 m!630241))

(assert (=> b!657189 m!630243))

(declare-fun m!630303 () Bool)

(assert (=> start!59554 m!630303))

(declare-fun m!630305 () Bool)

(assert (=> start!59554 m!630305))

(assert (=> b!657182 m!630241))

(assert (=> b!657182 m!630241))

(assert (=> b!657182 m!630253))

(check-sat (not b!657190) (not b!657180) (not b!657181) (not b!657195) (not b!657179) (not b!657199) (not b!657197) (not start!59554) (not b!657182) (not b!657185) (not b!657184) (not b!657203) (not b!657189) (not b!657201))
(check-sat)
