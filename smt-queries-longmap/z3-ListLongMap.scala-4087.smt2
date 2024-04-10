; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56022 () Bool)

(assert start!56022)

(declare-fun b!616152 () Bool)

(declare-fun res!396903 () Bool)

(declare-fun e!353285 () Bool)

(assert (=> b!616152 (=> (not res!396903) (not e!353285))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616152 (= res!396903 (validKeyInArray!0 k0!1786))))

(declare-fun b!616153 () Bool)

(declare-fun res!396900 () Bool)

(declare-fun e!353288 () Bool)

(assert (=> b!616153 (=> (not res!396900) (not e!353288))))

(declare-datatypes ((array!37492 0))(
  ( (array!37493 (arr!17992 (Array (_ BitVec 32) (_ BitVec 64))) (size!18356 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37492)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37492 (_ BitVec 32)) Bool)

(assert (=> b!616153 (= res!396900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616154 () Bool)

(declare-fun e!353289 () Bool)

(declare-datatypes ((SeekEntryResult!6432 0))(
  ( (MissingZero!6432 (index!28012 (_ BitVec 32))) (Found!6432 (index!28013 (_ BitVec 32))) (Intermediate!6432 (undefined!7244 Bool) (index!28014 (_ BitVec 32)) (x!56808 (_ BitVec 32))) (Undefined!6432) (MissingVacant!6432 (index!28015 (_ BitVec 32))) )
))
(declare-fun lt!283287 () SeekEntryResult!6432)

(declare-fun lt!283297 () SeekEntryResult!6432)

(assert (=> b!616154 (= e!353289 (= lt!283287 lt!283297))))

(declare-fun b!616155 () Bool)

(declare-datatypes ((Unit!20048 0))(
  ( (Unit!20049) )
))
(declare-fun e!353287 () Unit!20048)

(declare-fun Unit!20050 () Unit!20048)

(assert (=> b!616155 (= e!353287 Unit!20050)))

(declare-fun b!616156 () Bool)

(declare-fun e!353292 () Bool)

(assert (=> b!616156 (= e!353288 e!353292)))

(declare-fun res!396899 () Bool)

(assert (=> b!616156 (=> (not res!396899) (not e!353292))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!616156 (= res!396899 (= (select (store (arr!17992 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!283290 () array!37492)

(assert (=> b!616156 (= lt!283290 (array!37493 (store (arr!17992 a!2986) i!1108 k0!1786) (size!18356 a!2986)))))

(declare-fun b!616157 () Bool)

(declare-fun e!353283 () Unit!20048)

(declare-fun Unit!20051 () Unit!20048)

(assert (=> b!616157 (= e!353283 Unit!20051)))

(declare-fun b!616158 () Bool)

(declare-fun e!353295 () Bool)

(assert (=> b!616158 (= e!353295 (not true))))

(declare-fun lt!283283 () Unit!20048)

(assert (=> b!616158 (= lt!283283 e!353283)))

(declare-fun c!70001 () Bool)

(declare-fun lt!283289 () SeekEntryResult!6432)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!616158 (= c!70001 (= lt!283289 (Found!6432 index!984)))))

(declare-fun lt!283293 () Unit!20048)

(declare-fun e!353294 () Unit!20048)

(assert (=> b!616158 (= lt!283293 e!353294)))

(declare-fun c!69998 () Bool)

(assert (=> b!616158 (= c!69998 (= lt!283289 Undefined!6432))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!283295 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37492 (_ BitVec 32)) SeekEntryResult!6432)

(assert (=> b!616158 (= lt!283289 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283295 lt!283290 mask!3053))))

(assert (=> b!616158 e!353289))

(declare-fun res!396893 () Bool)

(assert (=> b!616158 (=> (not res!396893) (not e!353289))))

(declare-fun lt!283292 () (_ BitVec 32))

(assert (=> b!616158 (= res!396893 (= lt!283297 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283292 vacantSpotIndex!68 lt!283295 lt!283290 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!616158 (= lt!283297 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283292 vacantSpotIndex!68 (select (arr!17992 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616158 (= lt!283295 (select (store (arr!17992 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!283286 () Unit!20048)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37492 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20048)

(assert (=> b!616158 (= lt!283286 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283292 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616158 (= lt!283292 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun e!353291 () Bool)

(declare-fun b!616159 () Bool)

(declare-fun arrayContainsKey!0 (array!37492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616159 (= e!353291 (arrayContainsKey!0 lt!283290 (select (arr!17992 a!2986) j!136) index!984))))

(declare-fun e!353293 () Bool)

(declare-fun b!616160 () Bool)

(assert (=> b!616160 (= e!353293 (arrayContainsKey!0 lt!283290 (select (arr!17992 a!2986) j!136) index!984))))

(declare-fun b!616161 () Bool)

(declare-fun res!396894 () Bool)

(assert (=> b!616161 (=> (not res!396894) (not e!353285))))

(assert (=> b!616161 (= res!396894 (and (= (size!18356 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18356 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18356 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616162 () Bool)

(assert (=> b!616162 (= e!353285 e!353288)))

(declare-fun res!396892 () Bool)

(assert (=> b!616162 (=> (not res!396892) (not e!353288))))

(declare-fun lt!283282 () SeekEntryResult!6432)

(assert (=> b!616162 (= res!396892 (or (= lt!283282 (MissingZero!6432 i!1108)) (= lt!283282 (MissingVacant!6432 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37492 (_ BitVec 32)) SeekEntryResult!6432)

(assert (=> b!616162 (= lt!283282 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!616164 () Bool)

(assert (=> b!616164 false))

(declare-fun lt!283281 () Unit!20048)

(declare-datatypes ((List!12033 0))(
  ( (Nil!12030) (Cons!12029 (h!13074 (_ BitVec 64)) (t!18261 List!12033)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37492 (_ BitVec 64) (_ BitVec 32) List!12033) Unit!20048)

(assert (=> b!616164 (= lt!283281 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283290 (select (arr!17992 a!2986) j!136) j!136 Nil!12030))))

(declare-fun arrayNoDuplicates!0 (array!37492 (_ BitVec 32) List!12033) Bool)

(assert (=> b!616164 (arrayNoDuplicates!0 lt!283290 j!136 Nil!12030)))

(declare-fun lt!283279 () Unit!20048)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37492 (_ BitVec 32) (_ BitVec 32)) Unit!20048)

(assert (=> b!616164 (= lt!283279 (lemmaNoDuplicateFromThenFromBigger!0 lt!283290 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616164 (arrayNoDuplicates!0 lt!283290 #b00000000000000000000000000000000 Nil!12030)))

(declare-fun lt!283296 () Unit!20048)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37492 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12033) Unit!20048)

(assert (=> b!616164 (= lt!283296 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12030))))

(assert (=> b!616164 (arrayContainsKey!0 lt!283290 (select (arr!17992 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283278 () Unit!20048)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37492 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20048)

(assert (=> b!616164 (= lt!283278 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283290 (select (arr!17992 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!353286 () Unit!20048)

(declare-fun Unit!20052 () Unit!20048)

(assert (=> b!616164 (= e!353286 Unit!20052)))

(declare-fun b!616165 () Bool)

(declare-fun Unit!20053 () Unit!20048)

(assert (=> b!616165 (= e!353294 Unit!20053)))

(declare-fun b!616166 () Bool)

(declare-fun res!396904 () Bool)

(assert (=> b!616166 (= res!396904 (arrayContainsKey!0 lt!283290 (select (arr!17992 a!2986) j!136) j!136))))

(assert (=> b!616166 (=> (not res!396904) (not e!353291))))

(declare-fun e!353282 () Bool)

(assert (=> b!616166 (= e!353282 e!353291)))

(declare-fun b!616167 () Bool)

(declare-fun res!396902 () Bool)

(assert (=> b!616167 (=> (not res!396902) (not e!353285))))

(assert (=> b!616167 (= res!396902 (validKeyInArray!0 (select (arr!17992 a!2986) j!136)))))

(declare-fun b!616168 () Bool)

(declare-fun Unit!20054 () Unit!20048)

(assert (=> b!616168 (= e!353294 Unit!20054)))

(assert (=> b!616168 false))

(declare-fun b!616169 () Bool)

(assert (=> b!616169 false))

(declare-fun lt!283285 () Unit!20048)

(assert (=> b!616169 (= lt!283285 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283290 (select (arr!17992 a!2986) j!136) index!984 Nil!12030))))

(assert (=> b!616169 (arrayNoDuplicates!0 lt!283290 index!984 Nil!12030)))

(declare-fun lt!283288 () Unit!20048)

(assert (=> b!616169 (= lt!283288 (lemmaNoDuplicateFromThenFromBigger!0 lt!283290 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616169 (arrayNoDuplicates!0 lt!283290 #b00000000000000000000000000000000 Nil!12030)))

(declare-fun lt!283280 () Unit!20048)

(assert (=> b!616169 (= lt!283280 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12030))))

(assert (=> b!616169 (arrayContainsKey!0 lt!283290 (select (arr!17992 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283294 () Unit!20048)

(assert (=> b!616169 (= lt!283294 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283290 (select (arr!17992 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!616169 e!353293))

(declare-fun res!396901 () Bool)

(assert (=> b!616169 (=> (not res!396901) (not e!353293))))

(assert (=> b!616169 (= res!396901 (arrayContainsKey!0 lt!283290 (select (arr!17992 a!2986) j!136) j!136))))

(declare-fun Unit!20055 () Unit!20048)

(assert (=> b!616169 (= e!353287 Unit!20055)))

(declare-fun b!616170 () Bool)

(declare-fun res!396897 () Bool)

(assert (=> b!616170 (=> (not res!396897) (not e!353288))))

(assert (=> b!616170 (= res!396897 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12030))))

(declare-fun b!616171 () Bool)

(declare-fun res!396905 () Bool)

(assert (=> b!616171 (= res!396905 (bvsge j!136 index!984))))

(assert (=> b!616171 (=> res!396905 e!353282)))

(declare-fun e!353284 () Bool)

(assert (=> b!616171 (= e!353284 e!353282)))

(declare-fun b!616172 () Bool)

(declare-fun Unit!20056 () Unit!20048)

(assert (=> b!616172 (= e!353283 Unit!20056)))

(declare-fun res!396895 () Bool)

(assert (=> b!616172 (= res!396895 (= (select (store (arr!17992 a!2986) i!1108 k0!1786) index!984) (select (arr!17992 a!2986) j!136)))))

(assert (=> b!616172 (=> (not res!396895) (not e!353284))))

(assert (=> b!616172 e!353284))

(declare-fun c!69999 () Bool)

(assert (=> b!616172 (= c!69999 (bvslt j!136 index!984))))

(declare-fun lt!283284 () Unit!20048)

(assert (=> b!616172 (= lt!283284 e!353286)))

(declare-fun c!70000 () Bool)

(assert (=> b!616172 (= c!70000 (bvslt index!984 j!136))))

(declare-fun lt!283291 () Unit!20048)

(assert (=> b!616172 (= lt!283291 e!353287)))

(assert (=> b!616172 false))

(declare-fun b!616173 () Bool)

(declare-fun res!396896 () Bool)

(assert (=> b!616173 (=> (not res!396896) (not e!353288))))

(assert (=> b!616173 (= res!396896 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17992 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616174 () Bool)

(declare-fun res!396891 () Bool)

(assert (=> b!616174 (=> (not res!396891) (not e!353285))))

(assert (=> b!616174 (= res!396891 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616175 () Bool)

(declare-fun Unit!20057 () Unit!20048)

(assert (=> b!616175 (= e!353286 Unit!20057)))

(declare-fun res!396898 () Bool)

(assert (=> start!56022 (=> (not res!396898) (not e!353285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56022 (= res!396898 (validMask!0 mask!3053))))

(assert (=> start!56022 e!353285))

(assert (=> start!56022 true))

(declare-fun array_inv!13788 (array!37492) Bool)

(assert (=> start!56022 (array_inv!13788 a!2986)))

(declare-fun b!616163 () Bool)

(assert (=> b!616163 (= e!353292 e!353295)))

(declare-fun res!396890 () Bool)

(assert (=> b!616163 (=> (not res!396890) (not e!353295))))

(assert (=> b!616163 (= res!396890 (and (= lt!283287 (Found!6432 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17992 a!2986) index!984) (select (arr!17992 a!2986) j!136))) (not (= (select (arr!17992 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!616163 (= lt!283287 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17992 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!56022 res!396898) b!616161))

(assert (= (and b!616161 res!396894) b!616167))

(assert (= (and b!616167 res!396902) b!616152))

(assert (= (and b!616152 res!396903) b!616174))

(assert (= (and b!616174 res!396891) b!616162))

(assert (= (and b!616162 res!396892) b!616153))

(assert (= (and b!616153 res!396900) b!616170))

(assert (= (and b!616170 res!396897) b!616173))

(assert (= (and b!616173 res!396896) b!616156))

(assert (= (and b!616156 res!396899) b!616163))

(assert (= (and b!616163 res!396890) b!616158))

(assert (= (and b!616158 res!396893) b!616154))

(assert (= (and b!616158 c!69998) b!616168))

(assert (= (and b!616158 (not c!69998)) b!616165))

(assert (= (and b!616158 c!70001) b!616172))

(assert (= (and b!616158 (not c!70001)) b!616157))

(assert (= (and b!616172 res!396895) b!616171))

(assert (= (and b!616171 (not res!396905)) b!616166))

(assert (= (and b!616166 res!396904) b!616159))

(assert (= (and b!616172 c!69999) b!616164))

(assert (= (and b!616172 (not c!69999)) b!616175))

(assert (= (and b!616172 c!70000) b!616169))

(assert (= (and b!616172 (not c!70000)) b!616155))

(assert (= (and b!616169 res!396901) b!616160))

(declare-fun m!592335 () Bool)

(assert (=> b!616172 m!592335))

(declare-fun m!592337 () Bool)

(assert (=> b!616172 m!592337))

(declare-fun m!592339 () Bool)

(assert (=> b!616172 m!592339))

(declare-fun m!592341 () Bool)

(assert (=> b!616153 m!592341))

(declare-fun m!592343 () Bool)

(assert (=> b!616170 m!592343))

(declare-fun m!592345 () Bool)

(assert (=> b!616152 m!592345))

(assert (=> b!616164 m!592339))

(declare-fun m!592347 () Bool)

(assert (=> b!616164 m!592347))

(declare-fun m!592349 () Bool)

(assert (=> b!616164 m!592349))

(assert (=> b!616164 m!592339))

(declare-fun m!592351 () Bool)

(assert (=> b!616164 m!592351))

(assert (=> b!616164 m!592339))

(declare-fun m!592353 () Bool)

(assert (=> b!616164 m!592353))

(declare-fun m!592355 () Bool)

(assert (=> b!616164 m!592355))

(declare-fun m!592357 () Bool)

(assert (=> b!616164 m!592357))

(declare-fun m!592359 () Bool)

(assert (=> b!616164 m!592359))

(assert (=> b!616164 m!592339))

(assert (=> b!616166 m!592339))

(assert (=> b!616166 m!592339))

(declare-fun m!592361 () Bool)

(assert (=> b!616166 m!592361))

(declare-fun m!592363 () Bool)

(assert (=> b!616163 m!592363))

(assert (=> b!616163 m!592339))

(assert (=> b!616163 m!592339))

(declare-fun m!592365 () Bool)

(assert (=> b!616163 m!592365))

(declare-fun m!592367 () Bool)

(assert (=> b!616169 m!592367))

(assert (=> b!616169 m!592339))

(declare-fun m!592369 () Bool)

(assert (=> b!616169 m!592369))

(assert (=> b!616169 m!592339))

(declare-fun m!592371 () Bool)

(assert (=> b!616169 m!592371))

(assert (=> b!616169 m!592339))

(declare-fun m!592373 () Bool)

(assert (=> b!616169 m!592373))

(assert (=> b!616169 m!592355))

(assert (=> b!616169 m!592357))

(assert (=> b!616169 m!592339))

(assert (=> b!616169 m!592361))

(assert (=> b!616169 m!592339))

(declare-fun m!592375 () Bool)

(assert (=> b!616169 m!592375))

(declare-fun m!592377 () Bool)

(assert (=> b!616173 m!592377))

(assert (=> b!616156 m!592335))

(declare-fun m!592379 () Bool)

(assert (=> b!616156 m!592379))

(assert (=> b!616160 m!592339))

(assert (=> b!616160 m!592339))

(declare-fun m!592381 () Bool)

(assert (=> b!616160 m!592381))

(declare-fun m!592383 () Bool)

(assert (=> b!616162 m!592383))

(declare-fun m!592385 () Bool)

(assert (=> b!616158 m!592385))

(declare-fun m!592387 () Bool)

(assert (=> b!616158 m!592387))

(assert (=> b!616158 m!592339))

(assert (=> b!616158 m!592339))

(declare-fun m!592389 () Bool)

(assert (=> b!616158 m!592389))

(assert (=> b!616158 m!592335))

(declare-fun m!592391 () Bool)

(assert (=> b!616158 m!592391))

(declare-fun m!592393 () Bool)

(assert (=> b!616158 m!592393))

(declare-fun m!592395 () Bool)

(assert (=> b!616158 m!592395))

(assert (=> b!616167 m!592339))

(assert (=> b!616167 m!592339))

(declare-fun m!592397 () Bool)

(assert (=> b!616167 m!592397))

(declare-fun m!592399 () Bool)

(assert (=> start!56022 m!592399))

(declare-fun m!592401 () Bool)

(assert (=> start!56022 m!592401))

(assert (=> b!616159 m!592339))

(assert (=> b!616159 m!592339))

(assert (=> b!616159 m!592381))

(declare-fun m!592403 () Bool)

(assert (=> b!616174 m!592403))

(check-sat (not b!616166) (not start!56022) (not b!616153) (not b!616163) (not b!616162) (not b!616158) (not b!616167) (not b!616174) (not b!616164) (not b!616159) (not b!616152) (not b!616170) (not b!616169) (not b!616160))
(check-sat)
