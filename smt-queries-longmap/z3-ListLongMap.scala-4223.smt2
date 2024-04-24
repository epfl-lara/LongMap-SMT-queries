; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57990 () Bool)

(assert start!57990)

(declare-fun b!641169 () Bool)

(declare-fun e!367076 () Bool)

(declare-datatypes ((List!12342 0))(
  ( (Nil!12339) (Cons!12338 (h!13386 (_ BitVec 64)) (t!18562 List!12342)) )
))
(declare-fun noDuplicate!403 (List!12342) Bool)

(assert (=> b!641169 (= e!367076 (noDuplicate!403 Nil!12339))))

(declare-fun b!641170 () Bool)

(declare-fun res!415279 () Bool)

(declare-fun e!367075 () Bool)

(assert (=> b!641170 (=> (not res!415279) (not e!367075))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38355 0))(
  ( (array!38356 (arr!18394 (Array (_ BitVec 32) (_ BitVec 64))) (size!18758 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38355)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!641170 (= res!415279 (and (= (size!18758 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18758 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18758 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!641171 () Bool)

(declare-fun e!367078 () Bool)

(declare-datatypes ((SeekEntryResult!6790 0))(
  ( (MissingZero!6790 (index!29480 (_ BitVec 32))) (Found!6790 (index!29481 (_ BitVec 32))) (Intermediate!6790 (undefined!7602 Bool) (index!29482 (_ BitVec 32)) (x!58389 (_ BitVec 32))) (Undefined!6790) (MissingVacant!6790 (index!29483 (_ BitVec 32))) )
))
(declare-fun lt!296843 () SeekEntryResult!6790)

(declare-fun lt!296846 () SeekEntryResult!6790)

(assert (=> b!641171 (= e!367078 (= lt!296843 lt!296846))))

(declare-fun b!641172 () Bool)

(declare-fun res!415282 () Bool)

(assert (=> b!641172 (=> (not res!415282) (not e!367075))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!641172 (= res!415282 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!641173 () Bool)

(declare-fun res!415270 () Bool)

(declare-fun e!367068 () Bool)

(assert (=> b!641173 (=> (not res!415270) (not e!367068))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!641173 (= res!415270 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18394 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!641174 () Bool)

(declare-datatypes ((Unit!21669 0))(
  ( (Unit!21670) )
))
(declare-fun e!367079 () Unit!21669)

(declare-fun Unit!21671 () Unit!21669)

(assert (=> b!641174 (= e!367079 Unit!21671)))

(assert (=> b!641174 false))

(declare-fun b!641175 () Bool)

(declare-fun res!415278 () Bool)

(assert (=> b!641175 (=> (not res!415278) (not e!367075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!641175 (= res!415278 (validKeyInArray!0 (select (arr!18394 a!2986) j!136)))))

(declare-fun b!641176 () Bool)

(declare-fun e!367074 () Bool)

(assert (=> b!641176 (= e!367068 e!367074)))

(declare-fun res!415285 () Bool)

(assert (=> b!641176 (=> (not res!415285) (not e!367074))))

(assert (=> b!641176 (= res!415285 (= (select (store (arr!18394 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!296840 () array!38355)

(assert (=> b!641176 (= lt!296840 (array!38356 (store (arr!18394 a!2986) i!1108 k0!1786) (size!18758 a!2986)))))

(declare-fun b!641177 () Bool)

(declare-fun e!367069 () Bool)

(assert (=> b!641177 (= e!367069 e!367076)))

(declare-fun res!415274 () Bool)

(assert (=> b!641177 (=> res!415274 e!367076)))

(assert (=> b!641177 (= res!415274 (or (bvsge (size!18758 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18758 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!38355 (_ BitVec 32) List!12342) Bool)

(assert (=> b!641177 (arrayNoDuplicates!0 lt!296840 j!136 Nil!12339)))

(declare-fun lt!296845 () Unit!21669)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38355 (_ BitVec 32) (_ BitVec 32)) Unit!21669)

(assert (=> b!641177 (= lt!296845 (lemmaNoDuplicateFromThenFromBigger!0 lt!296840 #b00000000000000000000000000000000 j!136))))

(assert (=> b!641177 (arrayNoDuplicates!0 lt!296840 #b00000000000000000000000000000000 Nil!12339)))

(declare-fun lt!296844 () Unit!21669)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38355 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12342) Unit!21669)

(assert (=> b!641177 (= lt!296844 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12339))))

(assert (=> b!641177 (arrayContainsKey!0 lt!296840 (select (arr!18394 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296847 () Unit!21669)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38355 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21669)

(assert (=> b!641177 (= lt!296847 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296840 (select (arr!18394 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!641178 () Bool)

(declare-fun e!367072 () Bool)

(declare-fun e!367073 () Bool)

(assert (=> b!641178 (= e!367072 e!367073)))

(declare-fun res!415276 () Bool)

(assert (=> b!641178 (=> res!415276 e!367073)))

(declare-fun lt!296839 () (_ BitVec 64))

(declare-fun lt!296850 () (_ BitVec 64))

(assert (=> b!641178 (= res!415276 (or (not (= (select (arr!18394 a!2986) j!136) lt!296839)) (not (= (select (arr!18394 a!2986) j!136) lt!296850)) (bvsge j!136 index!984)))))

(declare-fun b!641179 () Bool)

(declare-fun res!415280 () Bool)

(assert (=> b!641179 (=> (not res!415280) (not e!367075))))

(assert (=> b!641179 (= res!415280 (validKeyInArray!0 k0!1786))))

(declare-fun res!415268 () Bool)

(assert (=> start!57990 (=> (not res!415268) (not e!367075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57990 (= res!415268 (validMask!0 mask!3053))))

(assert (=> start!57990 e!367075))

(assert (=> start!57990 true))

(declare-fun array_inv!14253 (array!38355) Bool)

(assert (=> start!57990 (array_inv!14253 a!2986)))

(declare-fun b!641180 () Bool)

(declare-fun e!367070 () Bool)

(assert (=> b!641180 (= e!367074 e!367070)))

(declare-fun res!415283 () Bool)

(assert (=> b!641180 (=> (not res!415283) (not e!367070))))

(assert (=> b!641180 (= res!415283 (and (= lt!296843 (Found!6790 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18394 a!2986) index!984) (select (arr!18394 a!2986) j!136))) (not (= (select (arr!18394 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38355 (_ BitVec 32)) SeekEntryResult!6790)

(assert (=> b!641180 (= lt!296843 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18394 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!641181 () Bool)

(declare-fun e!367080 () Bool)

(assert (=> b!641181 (= e!367080 e!367069)))

(declare-fun res!415271 () Bool)

(assert (=> b!641181 (=> res!415271 e!367069)))

(assert (=> b!641181 (= res!415271 (or (not (= (select (arr!18394 a!2986) j!136) lt!296839)) (not (= (select (arr!18394 a!2986) j!136) lt!296850)) (bvsge j!136 index!984)))))

(assert (=> b!641181 e!367072))

(declare-fun res!415273 () Bool)

(assert (=> b!641181 (=> (not res!415273) (not e!367072))))

(assert (=> b!641181 (= res!415273 (= lt!296850 (select (arr!18394 a!2986) j!136)))))

(assert (=> b!641181 (= lt!296850 (select (store (arr!18394 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!641182 () Bool)

(declare-fun e!367071 () Bool)

(assert (=> b!641182 (= e!367073 e!367071)))

(declare-fun res!415275 () Bool)

(assert (=> b!641182 (=> (not res!415275) (not e!367071))))

(assert (=> b!641182 (= res!415275 (arrayContainsKey!0 lt!296840 (select (arr!18394 a!2986) j!136) j!136))))

(declare-fun b!641183 () Bool)

(declare-fun res!415281 () Bool)

(assert (=> b!641183 (=> (not res!415281) (not e!367068))))

(assert (=> b!641183 (= res!415281 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12339))))

(declare-fun b!641184 () Bool)

(assert (=> b!641184 (= e!367075 e!367068)))

(declare-fun res!415272 () Bool)

(assert (=> b!641184 (=> (not res!415272) (not e!367068))))

(declare-fun lt!296842 () SeekEntryResult!6790)

(assert (=> b!641184 (= res!415272 (or (= lt!296842 (MissingZero!6790 i!1108)) (= lt!296842 (MissingVacant!6790 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38355 (_ BitVec 32)) SeekEntryResult!6790)

(assert (=> b!641184 (= lt!296842 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!641185 () Bool)

(declare-fun res!415284 () Bool)

(assert (=> b!641185 (=> (not res!415284) (not e!367068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38355 (_ BitVec 32)) Bool)

(assert (=> b!641185 (= res!415284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!641186 () Bool)

(assert (=> b!641186 (= e!367070 (not e!367080))))

(declare-fun res!415277 () Bool)

(assert (=> b!641186 (=> res!415277 e!367080)))

(declare-fun lt!296849 () SeekEntryResult!6790)

(assert (=> b!641186 (= res!415277 (not (= lt!296849 (Found!6790 index!984))))))

(declare-fun lt!296841 () Unit!21669)

(assert (=> b!641186 (= lt!296841 e!367079)))

(declare-fun c!73319 () Bool)

(assert (=> b!641186 (= c!73319 (= lt!296849 Undefined!6790))))

(assert (=> b!641186 (= lt!296849 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296839 lt!296840 mask!3053))))

(assert (=> b!641186 e!367078))

(declare-fun res!415269 () Bool)

(assert (=> b!641186 (=> (not res!415269) (not e!367078))))

(declare-fun lt!296848 () (_ BitVec 32))

(assert (=> b!641186 (= res!415269 (= lt!296846 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296848 vacantSpotIndex!68 lt!296839 lt!296840 mask!3053)))))

(assert (=> b!641186 (= lt!296846 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296848 vacantSpotIndex!68 (select (arr!18394 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!641186 (= lt!296839 (select (store (arr!18394 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296851 () Unit!21669)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38355 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21669)

(assert (=> b!641186 (= lt!296851 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296848 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!641186 (= lt!296848 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!641187 () Bool)

(assert (=> b!641187 (= e!367071 (arrayContainsKey!0 lt!296840 (select (arr!18394 a!2986) j!136) index!984))))

(declare-fun b!641188 () Bool)

(declare-fun Unit!21672 () Unit!21669)

(assert (=> b!641188 (= e!367079 Unit!21672)))

(assert (= (and start!57990 res!415268) b!641170))

(assert (= (and b!641170 res!415279) b!641175))

(assert (= (and b!641175 res!415278) b!641179))

(assert (= (and b!641179 res!415280) b!641172))

(assert (= (and b!641172 res!415282) b!641184))

(assert (= (and b!641184 res!415272) b!641185))

(assert (= (and b!641185 res!415284) b!641183))

(assert (= (and b!641183 res!415281) b!641173))

(assert (= (and b!641173 res!415270) b!641176))

(assert (= (and b!641176 res!415285) b!641180))

(assert (= (and b!641180 res!415283) b!641186))

(assert (= (and b!641186 res!415269) b!641171))

(assert (= (and b!641186 c!73319) b!641174))

(assert (= (and b!641186 (not c!73319)) b!641188))

(assert (= (and b!641186 (not res!415277)) b!641181))

(assert (= (and b!641181 res!415273) b!641178))

(assert (= (and b!641178 (not res!415276)) b!641182))

(assert (= (and b!641182 res!415275) b!641187))

(assert (= (and b!641181 (not res!415271)) b!641177))

(assert (= (and b!641177 (not res!415274)) b!641169))

(declare-fun m!615385 () Bool)

(assert (=> b!641177 m!615385))

(declare-fun m!615387 () Bool)

(assert (=> b!641177 m!615387))

(assert (=> b!641177 m!615385))

(declare-fun m!615389 () Bool)

(assert (=> b!641177 m!615389))

(assert (=> b!641177 m!615385))

(declare-fun m!615391 () Bool)

(assert (=> b!641177 m!615391))

(declare-fun m!615393 () Bool)

(assert (=> b!641177 m!615393))

(declare-fun m!615395 () Bool)

(assert (=> b!641177 m!615395))

(declare-fun m!615397 () Bool)

(assert (=> b!641177 m!615397))

(declare-fun m!615399 () Bool)

(assert (=> b!641173 m!615399))

(assert (=> b!641175 m!615385))

(assert (=> b!641175 m!615385))

(declare-fun m!615401 () Bool)

(assert (=> b!641175 m!615401))

(declare-fun m!615403 () Bool)

(assert (=> b!641172 m!615403))

(assert (=> b!641181 m!615385))

(declare-fun m!615405 () Bool)

(assert (=> b!641181 m!615405))

(declare-fun m!615407 () Bool)

(assert (=> b!641181 m!615407))

(declare-fun m!615409 () Bool)

(assert (=> b!641186 m!615409))

(declare-fun m!615411 () Bool)

(assert (=> b!641186 m!615411))

(declare-fun m!615413 () Bool)

(assert (=> b!641186 m!615413))

(assert (=> b!641186 m!615385))

(declare-fun m!615415 () Bool)

(assert (=> b!641186 m!615415))

(assert (=> b!641186 m!615405))

(declare-fun m!615417 () Bool)

(assert (=> b!641186 m!615417))

(assert (=> b!641186 m!615385))

(declare-fun m!615419 () Bool)

(assert (=> b!641186 m!615419))

(declare-fun m!615421 () Bool)

(assert (=> start!57990 m!615421))

(declare-fun m!615423 () Bool)

(assert (=> start!57990 m!615423))

(declare-fun m!615425 () Bool)

(assert (=> b!641185 m!615425))

(assert (=> b!641187 m!615385))

(assert (=> b!641187 m!615385))

(declare-fun m!615427 () Bool)

(assert (=> b!641187 m!615427))

(declare-fun m!615429 () Bool)

(assert (=> b!641183 m!615429))

(assert (=> b!641176 m!615405))

(declare-fun m!615431 () Bool)

(assert (=> b!641176 m!615431))

(declare-fun m!615433 () Bool)

(assert (=> b!641169 m!615433))

(declare-fun m!615435 () Bool)

(assert (=> b!641180 m!615435))

(assert (=> b!641180 m!615385))

(assert (=> b!641180 m!615385))

(declare-fun m!615437 () Bool)

(assert (=> b!641180 m!615437))

(declare-fun m!615439 () Bool)

(assert (=> b!641184 m!615439))

(assert (=> b!641178 m!615385))

(assert (=> b!641182 m!615385))

(assert (=> b!641182 m!615385))

(declare-fun m!615441 () Bool)

(assert (=> b!641182 m!615441))

(declare-fun m!615443 () Bool)

(assert (=> b!641179 m!615443))

(check-sat (not b!641169) (not b!641180) (not b!641179) (not start!57990) (not b!641187) (not b!641183) (not b!641175) (not b!641184) (not b!641172) (not b!641177) (not b!641186) (not b!641182) (not b!641185))
(check-sat)
(get-model)

(declare-fun b!641321 () Bool)

(declare-fun e!367167 () SeekEntryResult!6790)

(assert (=> b!641321 (= e!367167 (Found!6790 index!984))))

(declare-fun b!641322 () Bool)

(declare-fun e!367166 () SeekEntryResult!6790)

(assert (=> b!641322 (= e!367166 e!367167)))

(declare-fun lt!296935 () (_ BitVec 64))

(declare-fun c!73332 () Bool)

(assert (=> b!641322 (= c!73332 (= lt!296935 (select (arr!18394 a!2986) j!136)))))

(declare-fun lt!296934 () SeekEntryResult!6790)

(declare-fun d!90607 () Bool)

(get-info :version)

(assert (=> d!90607 (and (or ((_ is Undefined!6790) lt!296934) (not ((_ is Found!6790) lt!296934)) (and (bvsge (index!29481 lt!296934) #b00000000000000000000000000000000) (bvslt (index!29481 lt!296934) (size!18758 a!2986)))) (or ((_ is Undefined!6790) lt!296934) ((_ is Found!6790) lt!296934) (not ((_ is MissingVacant!6790) lt!296934)) (not (= (index!29483 lt!296934) vacantSpotIndex!68)) (and (bvsge (index!29483 lt!296934) #b00000000000000000000000000000000) (bvslt (index!29483 lt!296934) (size!18758 a!2986)))) (or ((_ is Undefined!6790) lt!296934) (ite ((_ is Found!6790) lt!296934) (= (select (arr!18394 a!2986) (index!29481 lt!296934)) (select (arr!18394 a!2986) j!136)) (and ((_ is MissingVacant!6790) lt!296934) (= (index!29483 lt!296934) vacantSpotIndex!68) (= (select (arr!18394 a!2986) (index!29483 lt!296934)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90607 (= lt!296934 e!367166)))

(declare-fun c!73334 () Bool)

(assert (=> d!90607 (= c!73334 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90607 (= lt!296935 (select (arr!18394 a!2986) index!984))))

(assert (=> d!90607 (validMask!0 mask!3053)))

(assert (=> d!90607 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18394 a!2986) j!136) a!2986 mask!3053) lt!296934)))

(declare-fun b!641323 () Bool)

(declare-fun e!367165 () SeekEntryResult!6790)

(assert (=> b!641323 (= e!367165 (MissingVacant!6790 vacantSpotIndex!68))))

(declare-fun b!641324 () Bool)

(assert (=> b!641324 (= e!367166 Undefined!6790)))

(declare-fun b!641325 () Bool)

(assert (=> b!641325 (= e!367165 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18394 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!641326 () Bool)

(declare-fun c!73333 () Bool)

(assert (=> b!641326 (= c!73333 (= lt!296935 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641326 (= e!367167 e!367165)))

(assert (= (and d!90607 c!73334) b!641324))

(assert (= (and d!90607 (not c!73334)) b!641322))

(assert (= (and b!641322 c!73332) b!641321))

(assert (= (and b!641322 (not c!73332)) b!641326))

(assert (= (and b!641326 c!73333) b!641323))

(assert (= (and b!641326 (not c!73333)) b!641325))

(declare-fun m!615565 () Bool)

(assert (=> d!90607 m!615565))

(declare-fun m!615567 () Bool)

(assert (=> d!90607 m!615567))

(assert (=> d!90607 m!615435))

(assert (=> d!90607 m!615421))

(declare-fun m!615569 () Bool)

(assert (=> b!641325 m!615569))

(assert (=> b!641325 m!615569))

(assert (=> b!641325 m!615385))

(declare-fun m!615571 () Bool)

(assert (=> b!641325 m!615571))

(assert (=> b!641180 d!90607))

(declare-fun d!90609 () Bool)

(declare-fun res!415398 () Bool)

(declare-fun e!367172 () Bool)

(assert (=> d!90609 (=> res!415398 e!367172)))

(assert (=> d!90609 (= res!415398 ((_ is Nil!12339) Nil!12339))))

(assert (=> d!90609 (= (noDuplicate!403 Nil!12339) e!367172)))

(declare-fun b!641331 () Bool)

(declare-fun e!367173 () Bool)

(assert (=> b!641331 (= e!367172 e!367173)))

(declare-fun res!415399 () Bool)

(assert (=> b!641331 (=> (not res!415399) (not e!367173))))

(declare-fun contains!3107 (List!12342 (_ BitVec 64)) Bool)

(assert (=> b!641331 (= res!415399 (not (contains!3107 (t!18562 Nil!12339) (h!13386 Nil!12339))))))

(declare-fun b!641332 () Bool)

(assert (=> b!641332 (= e!367173 (noDuplicate!403 (t!18562 Nil!12339)))))

(assert (= (and d!90609 (not res!415398)) b!641331))

(assert (= (and b!641331 res!415399) b!641332))

(declare-fun m!615573 () Bool)

(assert (=> b!641331 m!615573))

(declare-fun m!615575 () Bool)

(assert (=> b!641332 m!615575))

(assert (=> b!641169 d!90609))

(declare-fun b!641345 () Bool)

(declare-fun e!367182 () SeekEntryResult!6790)

(assert (=> b!641345 (= e!367182 Undefined!6790)))

(declare-fun e!367181 () SeekEntryResult!6790)

(declare-fun b!641346 () Bool)

(declare-fun lt!296944 () SeekEntryResult!6790)

(assert (=> b!641346 (= e!367181 (seekKeyOrZeroReturnVacant!0 (x!58389 lt!296944) (index!29482 lt!296944) (index!29482 lt!296944) k0!1786 a!2986 mask!3053))))

(declare-fun b!641347 () Bool)

(declare-fun e!367180 () SeekEntryResult!6790)

(assert (=> b!641347 (= e!367180 (Found!6790 (index!29482 lt!296944)))))

(declare-fun b!641348 () Bool)

(assert (=> b!641348 (= e!367182 e!367180)))

(declare-fun lt!296943 () (_ BitVec 64))

(assert (=> b!641348 (= lt!296943 (select (arr!18394 a!2986) (index!29482 lt!296944)))))

(declare-fun c!73341 () Bool)

(assert (=> b!641348 (= c!73341 (= lt!296943 k0!1786))))

(declare-fun b!641349 () Bool)

(declare-fun c!73343 () Bool)

(assert (=> b!641349 (= c!73343 (= lt!296943 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641349 (= e!367180 e!367181)))

(declare-fun b!641350 () Bool)

(assert (=> b!641350 (= e!367181 (MissingZero!6790 (index!29482 lt!296944)))))

(declare-fun d!90611 () Bool)

(declare-fun lt!296942 () SeekEntryResult!6790)

(assert (=> d!90611 (and (or ((_ is Undefined!6790) lt!296942) (not ((_ is Found!6790) lt!296942)) (and (bvsge (index!29481 lt!296942) #b00000000000000000000000000000000) (bvslt (index!29481 lt!296942) (size!18758 a!2986)))) (or ((_ is Undefined!6790) lt!296942) ((_ is Found!6790) lt!296942) (not ((_ is MissingZero!6790) lt!296942)) (and (bvsge (index!29480 lt!296942) #b00000000000000000000000000000000) (bvslt (index!29480 lt!296942) (size!18758 a!2986)))) (or ((_ is Undefined!6790) lt!296942) ((_ is Found!6790) lt!296942) ((_ is MissingZero!6790) lt!296942) (not ((_ is MissingVacant!6790) lt!296942)) (and (bvsge (index!29483 lt!296942) #b00000000000000000000000000000000) (bvslt (index!29483 lt!296942) (size!18758 a!2986)))) (or ((_ is Undefined!6790) lt!296942) (ite ((_ is Found!6790) lt!296942) (= (select (arr!18394 a!2986) (index!29481 lt!296942)) k0!1786) (ite ((_ is MissingZero!6790) lt!296942) (= (select (arr!18394 a!2986) (index!29480 lt!296942)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6790) lt!296942) (= (select (arr!18394 a!2986) (index!29483 lt!296942)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90611 (= lt!296942 e!367182)))

(declare-fun c!73342 () Bool)

(assert (=> d!90611 (= c!73342 (and ((_ is Intermediate!6790) lt!296944) (undefined!7602 lt!296944)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38355 (_ BitVec 32)) SeekEntryResult!6790)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90611 (= lt!296944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90611 (validMask!0 mask!3053)))

(assert (=> d!90611 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!296942)))

(assert (= (and d!90611 c!73342) b!641345))

(assert (= (and d!90611 (not c!73342)) b!641348))

(assert (= (and b!641348 c!73341) b!641347))

(assert (= (and b!641348 (not c!73341)) b!641349))

(assert (= (and b!641349 c!73343) b!641350))

(assert (= (and b!641349 (not c!73343)) b!641346))

(declare-fun m!615577 () Bool)

(assert (=> b!641346 m!615577))

(declare-fun m!615579 () Bool)

(assert (=> b!641348 m!615579))

(declare-fun m!615581 () Bool)

(assert (=> d!90611 m!615581))

(declare-fun m!615583 () Bool)

(assert (=> d!90611 m!615583))

(declare-fun m!615585 () Bool)

(assert (=> d!90611 m!615585))

(assert (=> d!90611 m!615421))

(declare-fun m!615587 () Bool)

(assert (=> d!90611 m!615587))

(declare-fun m!615589 () Bool)

(assert (=> d!90611 m!615589))

(assert (=> d!90611 m!615587))

(assert (=> b!641184 d!90611))

(declare-fun d!90613 () Bool)

(declare-fun res!415404 () Bool)

(declare-fun e!367187 () Bool)

(assert (=> d!90613 (=> res!415404 e!367187)))

(assert (=> d!90613 (= res!415404 (= (select (arr!18394 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90613 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!367187)))

(declare-fun b!641355 () Bool)

(declare-fun e!367188 () Bool)

(assert (=> b!641355 (= e!367187 e!367188)))

(declare-fun res!415405 () Bool)

(assert (=> b!641355 (=> (not res!415405) (not e!367188))))

(assert (=> b!641355 (= res!415405 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18758 a!2986)))))

(declare-fun b!641356 () Bool)

(assert (=> b!641356 (= e!367188 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90613 (not res!415404)) b!641355))

(assert (= (and b!641355 res!415405) b!641356))

(declare-fun m!615591 () Bool)

(assert (=> d!90613 m!615591))

(declare-fun m!615593 () Bool)

(assert (=> b!641356 m!615593))

(assert (=> b!641172 d!90613))

(declare-fun bm!33519 () Bool)

(declare-fun call!33522 () Bool)

(declare-fun c!73346 () Bool)

(assert (=> bm!33519 (= call!33522 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73346 (Cons!12338 (select (arr!18394 a!2986) #b00000000000000000000000000000000) Nil!12339) Nil!12339)))))

(declare-fun b!641367 () Bool)

(declare-fun e!367197 () Bool)

(assert (=> b!641367 (= e!367197 (contains!3107 Nil!12339 (select (arr!18394 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90615 () Bool)

(declare-fun res!415414 () Bool)

(declare-fun e!367200 () Bool)

(assert (=> d!90615 (=> res!415414 e!367200)))

(assert (=> d!90615 (= res!415414 (bvsge #b00000000000000000000000000000000 (size!18758 a!2986)))))

(assert (=> d!90615 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12339) e!367200)))

(declare-fun b!641368 () Bool)

(declare-fun e!367199 () Bool)

(declare-fun e!367198 () Bool)

(assert (=> b!641368 (= e!367199 e!367198)))

(assert (=> b!641368 (= c!73346 (validKeyInArray!0 (select (arr!18394 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!641369 () Bool)

(assert (=> b!641369 (= e!367200 e!367199)))

(declare-fun res!415412 () Bool)

(assert (=> b!641369 (=> (not res!415412) (not e!367199))))

(assert (=> b!641369 (= res!415412 (not e!367197))))

(declare-fun res!415413 () Bool)

(assert (=> b!641369 (=> (not res!415413) (not e!367197))))

(assert (=> b!641369 (= res!415413 (validKeyInArray!0 (select (arr!18394 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!641370 () Bool)

(assert (=> b!641370 (= e!367198 call!33522)))

(declare-fun b!641371 () Bool)

(assert (=> b!641371 (= e!367198 call!33522)))

(assert (= (and d!90615 (not res!415414)) b!641369))

(assert (= (and b!641369 res!415413) b!641367))

(assert (= (and b!641369 res!415412) b!641368))

(assert (= (and b!641368 c!73346) b!641371))

(assert (= (and b!641368 (not c!73346)) b!641370))

(assert (= (or b!641371 b!641370) bm!33519))

(assert (=> bm!33519 m!615591))

(declare-fun m!615595 () Bool)

(assert (=> bm!33519 m!615595))

(assert (=> b!641367 m!615591))

(assert (=> b!641367 m!615591))

(declare-fun m!615597 () Bool)

(assert (=> b!641367 m!615597))

(assert (=> b!641368 m!615591))

(assert (=> b!641368 m!615591))

(declare-fun m!615599 () Bool)

(assert (=> b!641368 m!615599))

(assert (=> b!641369 m!615591))

(assert (=> b!641369 m!615591))

(assert (=> b!641369 m!615599))

(assert (=> b!641183 d!90615))

(declare-fun d!90619 () Bool)

(declare-fun res!415415 () Bool)

(declare-fun e!367201 () Bool)

(assert (=> d!90619 (=> res!415415 e!367201)))

(assert (=> d!90619 (= res!415415 (= (select (arr!18394 lt!296840) j!136) (select (arr!18394 a!2986) j!136)))))

(assert (=> d!90619 (= (arrayContainsKey!0 lt!296840 (select (arr!18394 a!2986) j!136) j!136) e!367201)))

(declare-fun b!641372 () Bool)

(declare-fun e!367202 () Bool)

(assert (=> b!641372 (= e!367201 e!367202)))

(declare-fun res!415416 () Bool)

(assert (=> b!641372 (=> (not res!415416) (not e!367202))))

(assert (=> b!641372 (= res!415416 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18758 lt!296840)))))

(declare-fun b!641373 () Bool)

(assert (=> b!641373 (= e!367202 (arrayContainsKey!0 lt!296840 (select (arr!18394 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90619 (not res!415415)) b!641372))

(assert (= (and b!641372 res!415416) b!641373))

(declare-fun m!615601 () Bool)

(assert (=> d!90619 m!615601))

(assert (=> b!641373 m!615385))

(declare-fun m!615603 () Bool)

(assert (=> b!641373 m!615603))

(assert (=> b!641182 d!90619))

(declare-fun d!90621 () Bool)

(declare-fun res!415417 () Bool)

(declare-fun e!367203 () Bool)

(assert (=> d!90621 (=> res!415417 e!367203)))

(assert (=> d!90621 (= res!415417 (= (select (arr!18394 lt!296840) index!984) (select (arr!18394 a!2986) j!136)))))

(assert (=> d!90621 (= (arrayContainsKey!0 lt!296840 (select (arr!18394 a!2986) j!136) index!984) e!367203)))

(declare-fun b!641374 () Bool)

(declare-fun e!367204 () Bool)

(assert (=> b!641374 (= e!367203 e!367204)))

(declare-fun res!415418 () Bool)

(assert (=> b!641374 (=> (not res!415418) (not e!367204))))

(assert (=> b!641374 (= res!415418 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18758 lt!296840)))))

(declare-fun b!641375 () Bool)

(assert (=> b!641375 (= e!367204 (arrayContainsKey!0 lt!296840 (select (arr!18394 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90621 (not res!415417)) b!641374))

(assert (= (and b!641374 res!415418) b!641375))

(declare-fun m!615605 () Bool)

(assert (=> d!90621 m!615605))

(assert (=> b!641375 m!615385))

(declare-fun m!615607 () Bool)

(assert (=> b!641375 m!615607))

(assert (=> b!641187 d!90621))

(declare-fun b!641376 () Bool)

(declare-fun e!367207 () SeekEntryResult!6790)

(assert (=> b!641376 (= e!367207 (Found!6790 lt!296848))))

(declare-fun b!641377 () Bool)

(declare-fun e!367206 () SeekEntryResult!6790)

(assert (=> b!641377 (= e!367206 e!367207)))

(declare-fun lt!296946 () (_ BitVec 64))

(declare-fun c!73347 () Bool)

(assert (=> b!641377 (= c!73347 (= lt!296946 (select (arr!18394 a!2986) j!136)))))

(declare-fun lt!296945 () SeekEntryResult!6790)

(declare-fun d!90625 () Bool)

(assert (=> d!90625 (and (or ((_ is Undefined!6790) lt!296945) (not ((_ is Found!6790) lt!296945)) (and (bvsge (index!29481 lt!296945) #b00000000000000000000000000000000) (bvslt (index!29481 lt!296945) (size!18758 a!2986)))) (or ((_ is Undefined!6790) lt!296945) ((_ is Found!6790) lt!296945) (not ((_ is MissingVacant!6790) lt!296945)) (not (= (index!29483 lt!296945) vacantSpotIndex!68)) (and (bvsge (index!29483 lt!296945) #b00000000000000000000000000000000) (bvslt (index!29483 lt!296945) (size!18758 a!2986)))) (or ((_ is Undefined!6790) lt!296945) (ite ((_ is Found!6790) lt!296945) (= (select (arr!18394 a!2986) (index!29481 lt!296945)) (select (arr!18394 a!2986) j!136)) (and ((_ is MissingVacant!6790) lt!296945) (= (index!29483 lt!296945) vacantSpotIndex!68) (= (select (arr!18394 a!2986) (index!29483 lt!296945)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90625 (= lt!296945 e!367206)))

(declare-fun c!73349 () Bool)

(assert (=> d!90625 (= c!73349 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90625 (= lt!296946 (select (arr!18394 a!2986) lt!296848))))

(assert (=> d!90625 (validMask!0 mask!3053)))

(assert (=> d!90625 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296848 vacantSpotIndex!68 (select (arr!18394 a!2986) j!136) a!2986 mask!3053) lt!296945)))

(declare-fun b!641378 () Bool)

(declare-fun e!367205 () SeekEntryResult!6790)

(assert (=> b!641378 (= e!367205 (MissingVacant!6790 vacantSpotIndex!68))))

(declare-fun b!641379 () Bool)

(assert (=> b!641379 (= e!367206 Undefined!6790)))

(declare-fun b!641380 () Bool)

(assert (=> b!641380 (= e!367205 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!296848 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18394 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!641381 () Bool)

(declare-fun c!73348 () Bool)

(assert (=> b!641381 (= c!73348 (= lt!296946 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641381 (= e!367207 e!367205)))

(assert (= (and d!90625 c!73349) b!641379))

(assert (= (and d!90625 (not c!73349)) b!641377))

(assert (= (and b!641377 c!73347) b!641376))

(assert (= (and b!641377 (not c!73347)) b!641381))

(assert (= (and b!641381 c!73348) b!641378))

(assert (= (and b!641381 (not c!73348)) b!641380))

(declare-fun m!615609 () Bool)

(assert (=> d!90625 m!615609))

(declare-fun m!615611 () Bool)

(assert (=> d!90625 m!615611))

(declare-fun m!615613 () Bool)

(assert (=> d!90625 m!615613))

(assert (=> d!90625 m!615421))

(declare-fun m!615615 () Bool)

(assert (=> b!641380 m!615615))

(assert (=> b!641380 m!615615))

(assert (=> b!641380 m!615385))

(declare-fun m!615617 () Bool)

(assert (=> b!641380 m!615617))

(assert (=> b!641186 d!90625))

(declare-fun d!90627 () Bool)

(declare-fun lt!296955 () (_ BitVec 32))

(assert (=> d!90627 (and (bvsge lt!296955 #b00000000000000000000000000000000) (bvslt lt!296955 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90627 (= lt!296955 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!90627 (validMask!0 mask!3053)))

(assert (=> d!90627 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!296955)))

(declare-fun bs!19214 () Bool)

(assert (= bs!19214 d!90627))

(declare-fun m!615623 () Bool)

(assert (=> bs!19214 m!615623))

(assert (=> bs!19214 m!615421))

(assert (=> b!641186 d!90627))

(declare-fun d!90633 () Bool)

(declare-fun e!367249 () Bool)

(assert (=> d!90633 e!367249))

(declare-fun res!415454 () Bool)

(assert (=> d!90633 (=> (not res!415454) (not e!367249))))

(assert (=> d!90633 (= res!415454 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18758 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18758 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18758 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18758 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18758 a!2986))))))

(declare-fun lt!296961 () Unit!21669)

(declare-fun choose!9 (array!38355 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21669)

(assert (=> d!90633 (= lt!296961 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296848 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90633 (validMask!0 mask!3053)))

(assert (=> d!90633 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296848 vacantSpotIndex!68 mask!3053) lt!296961)))

(declare-fun b!641427 () Bool)

(assert (=> b!641427 (= e!367249 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296848 vacantSpotIndex!68 (select (arr!18394 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296848 vacantSpotIndex!68 (select (store (arr!18394 a!2986) i!1108 k0!1786) j!136) (array!38356 (store (arr!18394 a!2986) i!1108 k0!1786) (size!18758 a!2986)) mask!3053)))))

(assert (= (and d!90633 res!415454) b!641427))

(declare-fun m!615645 () Bool)

(assert (=> d!90633 m!615645))

(assert (=> d!90633 m!615421))

(assert (=> b!641427 m!615411))

(declare-fun m!615647 () Bool)

(assert (=> b!641427 m!615647))

(assert (=> b!641427 m!615385))

(assert (=> b!641427 m!615405))

(assert (=> b!641427 m!615411))

(assert (=> b!641427 m!615385))

(assert (=> b!641427 m!615415))

(assert (=> b!641186 d!90633))

(declare-fun b!641434 () Bool)

(declare-fun e!367254 () SeekEntryResult!6790)

(assert (=> b!641434 (= e!367254 (Found!6790 index!984))))

(declare-fun b!641435 () Bool)

(declare-fun e!367253 () SeekEntryResult!6790)

(assert (=> b!641435 (= e!367253 e!367254)))

(declare-fun c!73358 () Bool)

(declare-fun lt!296963 () (_ BitVec 64))

(assert (=> b!641435 (= c!73358 (= lt!296963 lt!296839))))

(declare-fun d!90645 () Bool)

(declare-fun lt!296962 () SeekEntryResult!6790)

(assert (=> d!90645 (and (or ((_ is Undefined!6790) lt!296962) (not ((_ is Found!6790) lt!296962)) (and (bvsge (index!29481 lt!296962) #b00000000000000000000000000000000) (bvslt (index!29481 lt!296962) (size!18758 lt!296840)))) (or ((_ is Undefined!6790) lt!296962) ((_ is Found!6790) lt!296962) (not ((_ is MissingVacant!6790) lt!296962)) (not (= (index!29483 lt!296962) vacantSpotIndex!68)) (and (bvsge (index!29483 lt!296962) #b00000000000000000000000000000000) (bvslt (index!29483 lt!296962) (size!18758 lt!296840)))) (or ((_ is Undefined!6790) lt!296962) (ite ((_ is Found!6790) lt!296962) (= (select (arr!18394 lt!296840) (index!29481 lt!296962)) lt!296839) (and ((_ is MissingVacant!6790) lt!296962) (= (index!29483 lt!296962) vacantSpotIndex!68) (= (select (arr!18394 lt!296840) (index!29483 lt!296962)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90645 (= lt!296962 e!367253)))

(declare-fun c!73360 () Bool)

(assert (=> d!90645 (= c!73360 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90645 (= lt!296963 (select (arr!18394 lt!296840) index!984))))

(assert (=> d!90645 (validMask!0 mask!3053)))

(assert (=> d!90645 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296839 lt!296840 mask!3053) lt!296962)))

(declare-fun b!641436 () Bool)

(declare-fun e!367252 () SeekEntryResult!6790)

(assert (=> b!641436 (= e!367252 (MissingVacant!6790 vacantSpotIndex!68))))

(declare-fun b!641437 () Bool)

(assert (=> b!641437 (= e!367253 Undefined!6790)))

(declare-fun b!641438 () Bool)

(assert (=> b!641438 (= e!367252 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!296839 lt!296840 mask!3053))))

(declare-fun b!641439 () Bool)

(declare-fun c!73359 () Bool)

(assert (=> b!641439 (= c!73359 (= lt!296963 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641439 (= e!367254 e!367252)))

(assert (= (and d!90645 c!73360) b!641437))

(assert (= (and d!90645 (not c!73360)) b!641435))

(assert (= (and b!641435 c!73358) b!641434))

(assert (= (and b!641435 (not c!73358)) b!641439))

(assert (= (and b!641439 c!73359) b!641436))

(assert (= (and b!641439 (not c!73359)) b!641438))

(declare-fun m!615649 () Bool)

(assert (=> d!90645 m!615649))

(declare-fun m!615651 () Bool)

(assert (=> d!90645 m!615651))

(assert (=> d!90645 m!615605))

(assert (=> d!90645 m!615421))

(assert (=> b!641438 m!615569))

(assert (=> b!641438 m!615569))

(declare-fun m!615653 () Bool)

(assert (=> b!641438 m!615653))

(assert (=> b!641186 d!90645))

(declare-fun b!641440 () Bool)

(declare-fun e!367257 () SeekEntryResult!6790)

(assert (=> b!641440 (= e!367257 (Found!6790 lt!296848))))

(declare-fun b!641441 () Bool)

(declare-fun e!367256 () SeekEntryResult!6790)

(assert (=> b!641441 (= e!367256 e!367257)))

(declare-fun c!73361 () Bool)

(declare-fun lt!296965 () (_ BitVec 64))

(assert (=> b!641441 (= c!73361 (= lt!296965 lt!296839))))

(declare-fun lt!296964 () SeekEntryResult!6790)

(declare-fun d!90647 () Bool)

(assert (=> d!90647 (and (or ((_ is Undefined!6790) lt!296964) (not ((_ is Found!6790) lt!296964)) (and (bvsge (index!29481 lt!296964) #b00000000000000000000000000000000) (bvslt (index!29481 lt!296964) (size!18758 lt!296840)))) (or ((_ is Undefined!6790) lt!296964) ((_ is Found!6790) lt!296964) (not ((_ is MissingVacant!6790) lt!296964)) (not (= (index!29483 lt!296964) vacantSpotIndex!68)) (and (bvsge (index!29483 lt!296964) #b00000000000000000000000000000000) (bvslt (index!29483 lt!296964) (size!18758 lt!296840)))) (or ((_ is Undefined!6790) lt!296964) (ite ((_ is Found!6790) lt!296964) (= (select (arr!18394 lt!296840) (index!29481 lt!296964)) lt!296839) (and ((_ is MissingVacant!6790) lt!296964) (= (index!29483 lt!296964) vacantSpotIndex!68) (= (select (arr!18394 lt!296840) (index!29483 lt!296964)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90647 (= lt!296964 e!367256)))

(declare-fun c!73363 () Bool)

(assert (=> d!90647 (= c!73363 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90647 (= lt!296965 (select (arr!18394 lt!296840) lt!296848))))

(assert (=> d!90647 (validMask!0 mask!3053)))

(assert (=> d!90647 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296848 vacantSpotIndex!68 lt!296839 lt!296840 mask!3053) lt!296964)))

(declare-fun b!641442 () Bool)

(declare-fun e!367255 () SeekEntryResult!6790)

(assert (=> b!641442 (= e!367255 (MissingVacant!6790 vacantSpotIndex!68))))

(declare-fun b!641443 () Bool)

(assert (=> b!641443 (= e!367256 Undefined!6790)))

(declare-fun b!641444 () Bool)

(assert (=> b!641444 (= e!367255 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!296848 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!296839 lt!296840 mask!3053))))

(declare-fun b!641445 () Bool)

(declare-fun c!73362 () Bool)

(assert (=> b!641445 (= c!73362 (= lt!296965 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!641445 (= e!367257 e!367255)))

(assert (= (and d!90647 c!73363) b!641443))

(assert (= (and d!90647 (not c!73363)) b!641441))

(assert (= (and b!641441 c!73361) b!641440))

(assert (= (and b!641441 (not c!73361)) b!641445))

(assert (= (and b!641445 c!73362) b!641442))

(assert (= (and b!641445 (not c!73362)) b!641444))

(declare-fun m!615655 () Bool)

(assert (=> d!90647 m!615655))

(declare-fun m!615657 () Bool)

(assert (=> d!90647 m!615657))

(declare-fun m!615659 () Bool)

(assert (=> d!90647 m!615659))

(assert (=> d!90647 m!615421))

(assert (=> b!641444 m!615615))

(assert (=> b!641444 m!615615))

(declare-fun m!615661 () Bool)

(assert (=> b!641444 m!615661))

(assert (=> b!641186 d!90647))

(declare-fun d!90649 () Bool)

(assert (=> d!90649 (= (validKeyInArray!0 (select (arr!18394 a!2986) j!136)) (and (not (= (select (arr!18394 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18394 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!641175 d!90649))

(declare-fun b!641464 () Bool)

(declare-fun e!367273 () Bool)

(declare-fun call!33535 () Bool)

(assert (=> b!641464 (= e!367273 call!33535)))

(declare-fun b!641465 () Bool)

(declare-fun e!367272 () Bool)

(assert (=> b!641465 (= e!367272 call!33535)))

(declare-fun b!641466 () Bool)

(assert (=> b!641466 (= e!367272 e!367273)))

(declare-fun lt!296980 () (_ BitVec 64))

(assert (=> b!641466 (= lt!296980 (select (arr!18394 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!296978 () Unit!21669)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38355 (_ BitVec 64) (_ BitVec 32)) Unit!21669)

(assert (=> b!641466 (= lt!296978 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!296980 #b00000000000000000000000000000000))))

(assert (=> b!641466 (arrayContainsKey!0 a!2986 lt!296980 #b00000000000000000000000000000000)))

(declare-fun lt!296979 () Unit!21669)

(assert (=> b!641466 (= lt!296979 lt!296978)))

(declare-fun res!415466 () Bool)

(assert (=> b!641466 (= res!415466 (= (seekEntryOrOpen!0 (select (arr!18394 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6790 #b00000000000000000000000000000000)))))

(assert (=> b!641466 (=> (not res!415466) (not e!367273))))

(declare-fun d!90651 () Bool)

(declare-fun res!415465 () Bool)

(declare-fun e!367274 () Bool)

(assert (=> d!90651 (=> res!415465 e!367274)))

(assert (=> d!90651 (= res!415465 (bvsge #b00000000000000000000000000000000 (size!18758 a!2986)))))

(assert (=> d!90651 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!367274)))

(declare-fun b!641467 () Bool)

(assert (=> b!641467 (= e!367274 e!367272)))

(declare-fun c!73368 () Bool)

(assert (=> b!641467 (= c!73368 (validKeyInArray!0 (select (arr!18394 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33532 () Bool)

(assert (=> bm!33532 (= call!33535 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!90651 (not res!415465)) b!641467))

(assert (= (and b!641467 c!73368) b!641466))

(assert (= (and b!641467 (not c!73368)) b!641465))

(assert (= (and b!641466 res!415466) b!641464))

(assert (= (or b!641464 b!641465) bm!33532))

(assert (=> b!641466 m!615591))

(declare-fun m!615681 () Bool)

(assert (=> b!641466 m!615681))

(declare-fun m!615683 () Bool)

(assert (=> b!641466 m!615683))

(assert (=> b!641466 m!615591))

(declare-fun m!615685 () Bool)

(assert (=> b!641466 m!615685))

(assert (=> b!641467 m!615591))

(assert (=> b!641467 m!615591))

(assert (=> b!641467 m!615599))

(declare-fun m!615687 () Bool)

(assert (=> bm!33532 m!615687))

(assert (=> b!641185 d!90651))

(declare-fun d!90661 () Bool)

(assert (=> d!90661 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57990 d!90661))

(declare-fun d!90675 () Bool)

(assert (=> d!90675 (= (array_inv!14253 a!2986) (bvsge (size!18758 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57990 d!90675))

(declare-fun d!90677 () Bool)

(assert (=> d!90677 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!641179 d!90677))

(declare-fun c!73379 () Bool)

(declare-fun call!33537 () Bool)

(declare-fun bm!33534 () Bool)

(assert (=> bm!33534 (= call!33537 (arrayNoDuplicates!0 lt!296840 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73379 (Cons!12338 (select (arr!18394 lt!296840) j!136) Nil!12339) Nil!12339)))))

(declare-fun b!641504 () Bool)

(declare-fun e!367301 () Bool)

(assert (=> b!641504 (= e!367301 (contains!3107 Nil!12339 (select (arr!18394 lt!296840) j!136)))))

(declare-fun d!90679 () Bool)

(declare-fun res!415485 () Bool)

(declare-fun e!367304 () Bool)

(assert (=> d!90679 (=> res!415485 e!367304)))

(assert (=> d!90679 (= res!415485 (bvsge j!136 (size!18758 lt!296840)))))

(assert (=> d!90679 (= (arrayNoDuplicates!0 lt!296840 j!136 Nil!12339) e!367304)))

(declare-fun b!641505 () Bool)

(declare-fun e!367303 () Bool)

(declare-fun e!367302 () Bool)

(assert (=> b!641505 (= e!367303 e!367302)))

(assert (=> b!641505 (= c!73379 (validKeyInArray!0 (select (arr!18394 lt!296840) j!136)))))

(declare-fun b!641506 () Bool)

(assert (=> b!641506 (= e!367304 e!367303)))

(declare-fun res!415483 () Bool)

(assert (=> b!641506 (=> (not res!415483) (not e!367303))))

(assert (=> b!641506 (= res!415483 (not e!367301))))

(declare-fun res!415484 () Bool)

(assert (=> b!641506 (=> (not res!415484) (not e!367301))))

(assert (=> b!641506 (= res!415484 (validKeyInArray!0 (select (arr!18394 lt!296840) j!136)))))

(declare-fun b!641507 () Bool)

(assert (=> b!641507 (= e!367302 call!33537)))

(declare-fun b!641508 () Bool)

(assert (=> b!641508 (= e!367302 call!33537)))

(assert (= (and d!90679 (not res!415485)) b!641506))

(assert (= (and b!641506 res!415484) b!641504))

(assert (= (and b!641506 res!415483) b!641505))

(assert (= (and b!641505 c!73379) b!641508))

(assert (= (and b!641505 (not c!73379)) b!641507))

(assert (= (or b!641508 b!641507) bm!33534))

(assert (=> bm!33534 m!615601))

(declare-fun m!615729 () Bool)

(assert (=> bm!33534 m!615729))

(assert (=> b!641504 m!615601))

(assert (=> b!641504 m!615601))

(declare-fun m!615731 () Bool)

(assert (=> b!641504 m!615731))

(assert (=> b!641505 m!615601))

(assert (=> b!641505 m!615601))

(declare-fun m!615733 () Bool)

(assert (=> b!641505 m!615733))

(assert (=> b!641506 m!615601))

(assert (=> b!641506 m!615601))

(assert (=> b!641506 m!615733))

(assert (=> b!641177 d!90679))

(declare-fun bm!33535 () Bool)

(declare-fun call!33538 () Bool)

(declare-fun c!73380 () Bool)

(assert (=> bm!33535 (= call!33538 (arrayNoDuplicates!0 lt!296840 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73380 (Cons!12338 (select (arr!18394 lt!296840) #b00000000000000000000000000000000) Nil!12339) Nil!12339)))))

(declare-fun b!641511 () Bool)

(declare-fun e!367307 () Bool)

(assert (=> b!641511 (= e!367307 (contains!3107 Nil!12339 (select (arr!18394 lt!296840) #b00000000000000000000000000000000)))))

(declare-fun d!90683 () Bool)

(declare-fun res!415490 () Bool)

(declare-fun e!367310 () Bool)

(assert (=> d!90683 (=> res!415490 e!367310)))

(assert (=> d!90683 (= res!415490 (bvsge #b00000000000000000000000000000000 (size!18758 lt!296840)))))

(assert (=> d!90683 (= (arrayNoDuplicates!0 lt!296840 #b00000000000000000000000000000000 Nil!12339) e!367310)))

(declare-fun b!641512 () Bool)

(declare-fun e!367309 () Bool)

(declare-fun e!367308 () Bool)

(assert (=> b!641512 (= e!367309 e!367308)))

(assert (=> b!641512 (= c!73380 (validKeyInArray!0 (select (arr!18394 lt!296840) #b00000000000000000000000000000000)))))

(declare-fun b!641513 () Bool)

(assert (=> b!641513 (= e!367310 e!367309)))

(declare-fun res!415488 () Bool)

(assert (=> b!641513 (=> (not res!415488) (not e!367309))))

(assert (=> b!641513 (= res!415488 (not e!367307))))

(declare-fun res!415489 () Bool)

(assert (=> b!641513 (=> (not res!415489) (not e!367307))))

(assert (=> b!641513 (= res!415489 (validKeyInArray!0 (select (arr!18394 lt!296840) #b00000000000000000000000000000000)))))

(declare-fun b!641514 () Bool)

(assert (=> b!641514 (= e!367308 call!33538)))

(declare-fun b!641515 () Bool)

(assert (=> b!641515 (= e!367308 call!33538)))

(assert (= (and d!90683 (not res!415490)) b!641513))

(assert (= (and b!641513 res!415489) b!641511))

(assert (= (and b!641513 res!415488) b!641512))

(assert (= (and b!641512 c!73380) b!641515))

(assert (= (and b!641512 (not c!73380)) b!641514))

(assert (= (or b!641515 b!641514) bm!33535))

(declare-fun m!615735 () Bool)

(assert (=> bm!33535 m!615735))

(declare-fun m!615737 () Bool)

(assert (=> bm!33535 m!615737))

(assert (=> b!641511 m!615735))

(assert (=> b!641511 m!615735))

(declare-fun m!615739 () Bool)

(assert (=> b!641511 m!615739))

(assert (=> b!641512 m!615735))

(assert (=> b!641512 m!615735))

(declare-fun m!615741 () Bool)

(assert (=> b!641512 m!615741))

(assert (=> b!641513 m!615735))

(assert (=> b!641513 m!615735))

(assert (=> b!641513 m!615741))

(assert (=> b!641177 d!90683))

(declare-fun d!90687 () Bool)

(assert (=> d!90687 (arrayContainsKey!0 lt!296840 (select (arr!18394 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296995 () Unit!21669)

(declare-fun choose!114 (array!38355 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21669)

(assert (=> d!90687 (= lt!296995 (choose!114 lt!296840 (select (arr!18394 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90687 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90687 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296840 (select (arr!18394 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!296995)))

(declare-fun bs!19217 () Bool)

(assert (= bs!19217 d!90687))

(assert (=> bs!19217 m!615385))

(assert (=> bs!19217 m!615391))

(assert (=> bs!19217 m!615385))

(declare-fun m!615743 () Bool)

(assert (=> bs!19217 m!615743))

(assert (=> b!641177 d!90687))

(declare-fun d!90689 () Bool)

(declare-fun res!415491 () Bool)

(declare-fun e!367311 () Bool)

(assert (=> d!90689 (=> res!415491 e!367311)))

(assert (=> d!90689 (= res!415491 (= (select (arr!18394 lt!296840) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18394 a!2986) j!136)))))

(assert (=> d!90689 (= (arrayContainsKey!0 lt!296840 (select (arr!18394 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!367311)))

(declare-fun b!641516 () Bool)

(declare-fun e!367312 () Bool)

(assert (=> b!641516 (= e!367311 e!367312)))

(declare-fun res!415492 () Bool)

(assert (=> b!641516 (=> (not res!415492) (not e!367312))))

(assert (=> b!641516 (= res!415492 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18758 lt!296840)))))

(declare-fun b!641517 () Bool)

(assert (=> b!641517 (= e!367312 (arrayContainsKey!0 lt!296840 (select (arr!18394 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90689 (not res!415491)) b!641516))

(assert (= (and b!641516 res!415492) b!641517))

(declare-fun m!615745 () Bool)

(assert (=> d!90689 m!615745))

(assert (=> b!641517 m!615385))

(declare-fun m!615747 () Bool)

(assert (=> b!641517 m!615747))

(assert (=> b!641177 d!90689))

(declare-fun d!90691 () Bool)

(assert (=> d!90691 (arrayNoDuplicates!0 lt!296840 j!136 Nil!12339)))

(declare-fun lt!296998 () Unit!21669)

(declare-fun choose!39 (array!38355 (_ BitVec 32) (_ BitVec 32)) Unit!21669)

(assert (=> d!90691 (= lt!296998 (choose!39 lt!296840 #b00000000000000000000000000000000 j!136))))

(assert (=> d!90691 (bvslt (size!18758 lt!296840) #b01111111111111111111111111111111)))

(assert (=> d!90691 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!296840 #b00000000000000000000000000000000 j!136) lt!296998)))

(declare-fun bs!19218 () Bool)

(assert (= bs!19218 d!90691))

(assert (=> bs!19218 m!615397))

(declare-fun m!615749 () Bool)

(assert (=> bs!19218 m!615749))

(assert (=> b!641177 d!90691))

(declare-fun d!90693 () Bool)

(declare-fun e!367321 () Bool)

(assert (=> d!90693 e!367321))

(declare-fun res!415495 () Bool)

(assert (=> d!90693 (=> (not res!415495) (not e!367321))))

(assert (=> d!90693 (= res!415495 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18758 a!2986))))))

(declare-fun lt!297007 () Unit!21669)

(declare-fun choose!41 (array!38355 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12342) Unit!21669)

(assert (=> d!90693 (= lt!297007 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12339))))

(assert (=> d!90693 (bvslt (size!18758 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90693 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12339) lt!297007)))

(declare-fun b!641532 () Bool)

(assert (=> b!641532 (= e!367321 (arrayNoDuplicates!0 (array!38356 (store (arr!18394 a!2986) i!1108 k0!1786) (size!18758 a!2986)) #b00000000000000000000000000000000 Nil!12339))))

(assert (= (and d!90693 res!415495) b!641532))

(declare-fun m!615751 () Bool)

(assert (=> d!90693 m!615751))

(assert (=> b!641532 m!615405))

(declare-fun m!615753 () Bool)

(assert (=> b!641532 m!615753))

(assert (=> b!641177 d!90693))

(check-sat (not b!641504) (not b!641513) (not b!641517) (not bm!33535) (not b!641532) (not bm!33534) (not d!90633) (not b!641375) (not d!90687) (not b!641506) (not bm!33519) (not b!641368) (not b!641466) (not b!641511) (not b!641369) (not b!641512) (not b!641427) (not d!90691) (not b!641380) (not d!90647) (not b!641505) (not d!90693) (not b!641331) (not b!641373) (not b!641438) (not b!641356) (not b!641325) (not b!641467) (not d!90625) (not d!90627) (not b!641346) (not d!90611) (not b!641332) (not b!641367) (not b!641444) (not bm!33532) (not d!90645) (not d!90607))
(check-sat)
