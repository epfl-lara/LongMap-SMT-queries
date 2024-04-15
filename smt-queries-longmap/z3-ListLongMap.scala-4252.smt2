; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58970 () Bool)

(assert start!58970)

(declare-fun b!650270 () Bool)

(declare-datatypes ((Unit!22160 0))(
  ( (Unit!22161) )
))
(declare-fun e!373054 () Unit!22160)

(declare-fun Unit!22162 () Unit!22160)

(assert (=> b!650270 (= e!373054 Unit!22162)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!302038 () Unit!22160)

(declare-datatypes ((array!38562 0))(
  ( (array!38563 (arr!18485 (Array (_ BitVec 32) (_ BitVec 64))) (size!18850 (_ BitVec 32))) )
))
(declare-fun lt!302045 () array!38562)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38562)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38562 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22160)

(assert (=> b!650270 (= lt!302038 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302045 (select (arr!18485 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650270 (arrayContainsKey!0 lt!302045 (select (arr!18485 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!302049 () Unit!22160)

(declare-datatypes ((List!12565 0))(
  ( (Nil!12562) (Cons!12561 (h!13606 (_ BitVec 64)) (t!18784 List!12565)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38562 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12565) Unit!22160)

(assert (=> b!650270 (= lt!302049 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12562))))

(declare-fun arrayNoDuplicates!0 (array!38562 (_ BitVec 32) List!12565) Bool)

(assert (=> b!650270 (arrayNoDuplicates!0 lt!302045 #b00000000000000000000000000000000 Nil!12562)))

(declare-fun lt!302036 () Unit!22160)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38562 (_ BitVec 32) (_ BitVec 32)) Unit!22160)

(assert (=> b!650270 (= lt!302036 (lemmaNoDuplicateFromThenFromBigger!0 lt!302045 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650270 (arrayNoDuplicates!0 lt!302045 j!136 Nil!12562)))

(declare-fun lt!302042 () Unit!22160)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38562 (_ BitVec 64) (_ BitVec 32) List!12565) Unit!22160)

(assert (=> b!650270 (= lt!302042 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302045 (select (arr!18485 a!2986) j!136) j!136 Nil!12562))))

(assert (=> b!650270 false))

(declare-fun b!650271 () Bool)

(declare-fun e!373059 () Bool)

(declare-fun e!373048 () Bool)

(assert (=> b!650271 (= e!373059 e!373048)))

(declare-fun res!421588 () Bool)

(assert (=> b!650271 (=> res!421588 e!373048)))

(assert (=> b!650271 (= res!421588 (bvsge index!984 j!136))))

(declare-fun lt!302040 () Unit!22160)

(assert (=> b!650271 (= lt!302040 e!373054)))

(declare-fun c!74712 () Bool)

(assert (=> b!650271 (= c!74712 (bvslt j!136 index!984))))

(declare-fun b!650272 () Bool)

(declare-fun e!373060 () Bool)

(assert (=> b!650272 (= e!373060 e!373059)))

(declare-fun res!421584 () Bool)

(assert (=> b!650272 (=> res!421584 e!373059)))

(declare-fun lt!302034 () (_ BitVec 64))

(declare-fun lt!302033 () (_ BitVec 64))

(assert (=> b!650272 (= res!421584 (or (not (= (select (arr!18485 a!2986) j!136) lt!302034)) (not (= (select (arr!18485 a!2986) j!136) lt!302033))))))

(declare-fun e!373052 () Bool)

(assert (=> b!650272 e!373052))

(declare-fun res!421591 () Bool)

(assert (=> b!650272 (=> (not res!421591) (not e!373052))))

(assert (=> b!650272 (= res!421591 (= lt!302033 (select (arr!18485 a!2986) j!136)))))

(assert (=> b!650272 (= lt!302033 (select (store (arr!18485 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!650273 () Bool)

(declare-fun e!373057 () Unit!22160)

(declare-fun Unit!22163 () Unit!22160)

(assert (=> b!650273 (= e!373057 Unit!22163)))

(assert (=> b!650273 false))

(declare-fun b!650274 () Bool)

(declare-fun e!373053 () Bool)

(declare-fun e!373058 () Bool)

(assert (=> b!650274 (= e!373053 e!373058)))

(declare-fun res!421597 () Bool)

(assert (=> b!650274 (=> (not res!421597) (not e!373058))))

(assert (=> b!650274 (= res!421597 (arrayContainsKey!0 lt!302045 (select (arr!18485 a!2986) j!136) j!136))))

(declare-fun b!650275 () Bool)

(declare-fun res!421593 () Bool)

(declare-fun e!373050 () Bool)

(assert (=> b!650275 (=> (not res!421593) (not e!373050))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!650275 (= res!421593 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18485 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!650276 () Bool)

(declare-fun res!421583 () Bool)

(assert (=> b!650276 (=> (not res!421583) (not e!373050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38562 (_ BitVec 32)) Bool)

(assert (=> b!650276 (= res!421583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!650277 () Bool)

(declare-fun res!421596 () Bool)

(declare-fun e!373051 () Bool)

(assert (=> b!650277 (=> (not res!421596) (not e!373051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650277 (= res!421596 (validKeyInArray!0 k0!1786))))

(declare-fun b!650278 () Bool)

(declare-fun e!373049 () Bool)

(assert (=> b!650278 (= e!373049 (not e!373060))))

(declare-fun res!421585 () Bool)

(assert (=> b!650278 (=> res!421585 e!373060)))

(declare-datatypes ((SeekEntryResult!6922 0))(
  ( (MissingZero!6922 (index!30038 (_ BitVec 32))) (Found!6922 (index!30039 (_ BitVec 32))) (Intermediate!6922 (undefined!7734 Bool) (index!30040 (_ BitVec 32)) (x!58835 (_ BitVec 32))) (Undefined!6922) (MissingVacant!6922 (index!30041 (_ BitVec 32))) )
))
(declare-fun lt!302044 () SeekEntryResult!6922)

(assert (=> b!650278 (= res!421585 (not (= lt!302044 (Found!6922 index!984))))))

(declare-fun lt!302041 () Unit!22160)

(assert (=> b!650278 (= lt!302041 e!373057)))

(declare-fun c!74711 () Bool)

(assert (=> b!650278 (= c!74711 (= lt!302044 Undefined!6922))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38562 (_ BitVec 32)) SeekEntryResult!6922)

(assert (=> b!650278 (= lt!302044 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302034 lt!302045 mask!3053))))

(declare-fun e!373056 () Bool)

(assert (=> b!650278 e!373056))

(declare-fun res!421590 () Bool)

(assert (=> b!650278 (=> (not res!421590) (not e!373056))))

(declare-fun lt!302037 () SeekEntryResult!6922)

(declare-fun lt!302047 () (_ BitVec 32))

(assert (=> b!650278 (= res!421590 (= lt!302037 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302047 vacantSpotIndex!68 lt!302034 lt!302045 mask!3053)))))

(assert (=> b!650278 (= lt!302037 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302047 vacantSpotIndex!68 (select (arr!18485 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!650278 (= lt!302034 (select (store (arr!18485 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!302046 () Unit!22160)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38562 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22160)

(assert (=> b!650278 (= lt!302046 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302047 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650278 (= lt!302047 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!650279 () Bool)

(assert (=> b!650279 (= e!373051 e!373050)))

(declare-fun res!421587 () Bool)

(assert (=> b!650279 (=> (not res!421587) (not e!373050))))

(declare-fun lt!302048 () SeekEntryResult!6922)

(assert (=> b!650279 (= res!421587 (or (= lt!302048 (MissingZero!6922 i!1108)) (= lt!302048 (MissingVacant!6922 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38562 (_ BitVec 32)) SeekEntryResult!6922)

(assert (=> b!650279 (= lt!302048 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!650280 () Bool)

(assert (=> b!650280 (= e!373052 e!373053)))

(declare-fun res!421592 () Bool)

(assert (=> b!650280 (=> res!421592 e!373053)))

(assert (=> b!650280 (= res!421592 (or (not (= (select (arr!18485 a!2986) j!136) lt!302034)) (not (= (select (arr!18485 a!2986) j!136) lt!302033)) (bvsge j!136 index!984)))))

(declare-fun res!421600 () Bool)

(assert (=> start!58970 (=> (not res!421600) (not e!373051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58970 (= res!421600 (validMask!0 mask!3053))))

(assert (=> start!58970 e!373051))

(assert (=> start!58970 true))

(declare-fun array_inv!14368 (array!38562) Bool)

(assert (=> start!58970 (array_inv!14368 a!2986)))

(declare-fun b!650281 () Bool)

(declare-fun lt!302035 () SeekEntryResult!6922)

(assert (=> b!650281 (= e!373056 (= lt!302035 lt!302037))))

(declare-fun b!650282 () Bool)

(declare-fun res!421586 () Bool)

(assert (=> b!650282 (=> (not res!421586) (not e!373051))))

(assert (=> b!650282 (= res!421586 (validKeyInArray!0 (select (arr!18485 a!2986) j!136)))))

(declare-fun b!650283 () Bool)

(declare-fun res!421589 () Bool)

(assert (=> b!650283 (=> (not res!421589) (not e!373050))))

(assert (=> b!650283 (= res!421589 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12562))))

(declare-fun b!650284 () Bool)

(declare-fun e!373047 () Bool)

(assert (=> b!650284 (= e!373047 e!373049)))

(declare-fun res!421595 () Bool)

(assert (=> b!650284 (=> (not res!421595) (not e!373049))))

(assert (=> b!650284 (= res!421595 (and (= lt!302035 (Found!6922 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18485 a!2986) index!984) (select (arr!18485 a!2986) j!136))) (not (= (select (arr!18485 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!650284 (= lt!302035 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18485 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650285 () Bool)

(assert (=> b!650285 (= e!373050 e!373047)))

(declare-fun res!421599 () Bool)

(assert (=> b!650285 (=> (not res!421599) (not e!373047))))

(assert (=> b!650285 (= res!421599 (= (select (store (arr!18485 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650285 (= lt!302045 (array!38563 (store (arr!18485 a!2986) i!1108 k0!1786) (size!18850 a!2986)))))

(declare-fun b!650286 () Bool)

(declare-fun Unit!22164 () Unit!22160)

(assert (=> b!650286 (= e!373057 Unit!22164)))

(declare-fun b!650287 () Bool)

(assert (=> b!650287 (= e!373058 (arrayContainsKey!0 lt!302045 (select (arr!18485 a!2986) j!136) index!984))))

(declare-fun b!650288 () Bool)

(assert (=> b!650288 (= e!373048 (or (bvsge (size!18850 a!2986) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!18850 a!2986))))))

(assert (=> b!650288 (arrayNoDuplicates!0 lt!302045 #b00000000000000000000000000000000 Nil!12562)))

(declare-fun lt!302039 () Unit!22160)

(assert (=> b!650288 (= lt!302039 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12562))))

(assert (=> b!650288 (arrayContainsKey!0 lt!302045 (select (arr!18485 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302043 () Unit!22160)

(assert (=> b!650288 (= lt!302043 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302045 (select (arr!18485 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!373055 () Bool)

(assert (=> b!650288 e!373055))

(declare-fun res!421582 () Bool)

(assert (=> b!650288 (=> (not res!421582) (not e!373055))))

(assert (=> b!650288 (= res!421582 (arrayContainsKey!0 lt!302045 (select (arr!18485 a!2986) j!136) j!136))))

(declare-fun b!650289 () Bool)

(declare-fun res!421594 () Bool)

(assert (=> b!650289 (=> (not res!421594) (not e!373051))))

(assert (=> b!650289 (= res!421594 (and (= (size!18850 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18850 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18850 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!650290 () Bool)

(declare-fun Unit!22165 () Unit!22160)

(assert (=> b!650290 (= e!373054 Unit!22165)))

(declare-fun b!650291 () Bool)

(declare-fun res!421598 () Bool)

(assert (=> b!650291 (=> (not res!421598) (not e!373051))))

(assert (=> b!650291 (= res!421598 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650292 () Bool)

(assert (=> b!650292 (= e!373055 (arrayContainsKey!0 lt!302045 (select (arr!18485 a!2986) j!136) index!984))))

(assert (= (and start!58970 res!421600) b!650289))

(assert (= (and b!650289 res!421594) b!650282))

(assert (= (and b!650282 res!421586) b!650277))

(assert (= (and b!650277 res!421596) b!650291))

(assert (= (and b!650291 res!421598) b!650279))

(assert (= (and b!650279 res!421587) b!650276))

(assert (= (and b!650276 res!421583) b!650283))

(assert (= (and b!650283 res!421589) b!650275))

(assert (= (and b!650275 res!421593) b!650285))

(assert (= (and b!650285 res!421599) b!650284))

(assert (= (and b!650284 res!421595) b!650278))

(assert (= (and b!650278 res!421590) b!650281))

(assert (= (and b!650278 c!74711) b!650273))

(assert (= (and b!650278 (not c!74711)) b!650286))

(assert (= (and b!650278 (not res!421585)) b!650272))

(assert (= (and b!650272 res!421591) b!650280))

(assert (= (and b!650280 (not res!421592)) b!650274))

(assert (= (and b!650274 res!421597) b!650287))

(assert (= (and b!650272 (not res!421584)) b!650271))

(assert (= (and b!650271 c!74712) b!650270))

(assert (= (and b!650271 (not c!74712)) b!650290))

(assert (= (and b!650271 (not res!421588)) b!650288))

(assert (= (and b!650288 res!421582) b!650292))

(declare-fun m!622977 () Bool)

(assert (=> b!650274 m!622977))

(assert (=> b!650274 m!622977))

(declare-fun m!622979 () Bool)

(assert (=> b!650274 m!622979))

(assert (=> b!650287 m!622977))

(assert (=> b!650287 m!622977))

(declare-fun m!622981 () Bool)

(assert (=> b!650287 m!622981))

(assert (=> b!650280 m!622977))

(declare-fun m!622983 () Bool)

(assert (=> b!650278 m!622983))

(declare-fun m!622985 () Bool)

(assert (=> b!650278 m!622985))

(assert (=> b!650278 m!622977))

(declare-fun m!622987 () Bool)

(assert (=> b!650278 m!622987))

(assert (=> b!650278 m!622977))

(declare-fun m!622989 () Bool)

(assert (=> b!650278 m!622989))

(declare-fun m!622991 () Bool)

(assert (=> b!650278 m!622991))

(declare-fun m!622993 () Bool)

(assert (=> b!650278 m!622993))

(declare-fun m!622995 () Bool)

(assert (=> b!650278 m!622995))

(assert (=> b!650272 m!622977))

(assert (=> b!650272 m!622987))

(declare-fun m!622997 () Bool)

(assert (=> b!650272 m!622997))

(assert (=> b!650288 m!622977))

(declare-fun m!622999 () Bool)

(assert (=> b!650288 m!622999))

(assert (=> b!650288 m!622977))

(assert (=> b!650288 m!622977))

(assert (=> b!650288 m!622979))

(declare-fun m!623001 () Bool)

(assert (=> b!650288 m!623001))

(assert (=> b!650288 m!622977))

(declare-fun m!623003 () Bool)

(assert (=> b!650288 m!623003))

(declare-fun m!623005 () Bool)

(assert (=> b!650288 m!623005))

(declare-fun m!623007 () Bool)

(assert (=> b!650291 m!623007))

(declare-fun m!623009 () Bool)

(assert (=> b!650284 m!623009))

(assert (=> b!650284 m!622977))

(assert (=> b!650284 m!622977))

(declare-fun m!623011 () Bool)

(assert (=> b!650284 m!623011))

(declare-fun m!623013 () Bool)

(assert (=> b!650283 m!623013))

(declare-fun m!623015 () Bool)

(assert (=> b!650275 m!623015))

(declare-fun m!623017 () Bool)

(assert (=> start!58970 m!623017))

(declare-fun m!623019 () Bool)

(assert (=> start!58970 m!623019))

(assert (=> b!650282 m!622977))

(assert (=> b!650282 m!622977))

(declare-fun m!623021 () Bool)

(assert (=> b!650282 m!623021))

(declare-fun m!623023 () Bool)

(assert (=> b!650279 m!623023))

(assert (=> b!650285 m!622987))

(declare-fun m!623025 () Bool)

(assert (=> b!650285 m!623025))

(declare-fun m!623027 () Bool)

(assert (=> b!650276 m!623027))

(assert (=> b!650292 m!622977))

(assert (=> b!650292 m!622977))

(assert (=> b!650292 m!622981))

(declare-fun m!623029 () Bool)

(assert (=> b!650277 m!623029))

(assert (=> b!650270 m!622977))

(assert (=> b!650270 m!622977))

(declare-fun m!623031 () Bool)

(assert (=> b!650270 m!623031))

(declare-fun m!623033 () Bool)

(assert (=> b!650270 m!623033))

(assert (=> b!650270 m!622977))

(declare-fun m!623035 () Bool)

(assert (=> b!650270 m!623035))

(declare-fun m!623037 () Bool)

(assert (=> b!650270 m!623037))

(assert (=> b!650270 m!623005))

(assert (=> b!650270 m!623001))

(assert (=> b!650270 m!622977))

(declare-fun m!623039 () Bool)

(assert (=> b!650270 m!623039))

(check-sat (not b!650283) (not b!650292) (not b!650270) (not b!650291) (not b!650274) (not start!58970) (not b!650287) (not b!650277) (not b!650288) (not b!650279) (not b!650276) (not b!650278) (not b!650284) (not b!650282))
(check-sat)
