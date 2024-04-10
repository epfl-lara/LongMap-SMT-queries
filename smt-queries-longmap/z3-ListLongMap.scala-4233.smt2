; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58336 () Bool)

(assert start!58336)

(declare-fun b!644350 () Bool)

(declare-fun e!369174 () Bool)

(declare-fun e!369170 () Bool)

(assert (=> b!644350 (= e!369174 (not e!369170))))

(declare-fun res!417435 () Bool)

(assert (=> b!644350 (=> res!417435 e!369170)))

(declare-datatypes ((SeekEntryResult!6870 0))(
  ( (MissingZero!6870 (index!29812 (_ BitVec 32))) (Found!6870 (index!29813 (_ BitVec 32))) (Intermediate!6870 (undefined!7682 Bool) (index!29814 (_ BitVec 32)) (x!58582 (_ BitVec 32))) (Undefined!6870) (MissingVacant!6870 (index!29815 (_ BitVec 32))) )
))
(declare-fun lt!298654 () SeekEntryResult!6870)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!644350 (= res!417435 (not (= lt!298654 (Found!6870 index!984))))))

(declare-datatypes ((Unit!21846 0))(
  ( (Unit!21847) )
))
(declare-fun lt!298651 () Unit!21846)

(declare-fun e!369176 () Unit!21846)

(assert (=> b!644350 (= lt!298651 e!369176)))

(declare-fun c!73826 () Bool)

(assert (=> b!644350 (= c!73826 (= lt!298654 Undefined!6870))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!38433 0))(
  ( (array!38434 (arr!18430 (Array (_ BitVec 32) (_ BitVec 64))) (size!18794 (_ BitVec 32))) )
))
(declare-fun lt!298646 () array!38433)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!298643 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38433 (_ BitVec 32)) SeekEntryResult!6870)

(assert (=> b!644350 (= lt!298654 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298643 lt!298646 mask!3053))))

(declare-fun e!369172 () Bool)

(assert (=> b!644350 e!369172))

(declare-fun res!417451 () Bool)

(assert (=> b!644350 (=> (not res!417451) (not e!369172))))

(declare-fun lt!298657 () SeekEntryResult!6870)

(declare-fun lt!298650 () (_ BitVec 32))

(assert (=> b!644350 (= res!417451 (= lt!298657 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298650 vacantSpotIndex!68 lt!298643 lt!298646 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38433)

(assert (=> b!644350 (= lt!298657 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298650 vacantSpotIndex!68 (select (arr!18430 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!644350 (= lt!298643 (select (store (arr!18430 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!298652 () Unit!21846)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21846)

(assert (=> b!644350 (= lt!298652 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298650 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!644350 (= lt!298650 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!644351 () Bool)

(declare-fun e!369168 () Bool)

(declare-fun e!369169 () Bool)

(assert (=> b!644351 (= e!369168 e!369169)))

(declare-fun res!417442 () Bool)

(assert (=> b!644351 (=> (not res!417442) (not e!369169))))

(assert (=> b!644351 (= res!417442 (= (select (store (arr!18430 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644351 (= lt!298646 (array!38434 (store (arr!18430 a!2986) i!1108 k0!1786) (size!18794 a!2986)))))

(declare-fun e!369180 () Bool)

(declare-fun b!644352 () Bool)

(declare-fun arrayContainsKey!0 (array!38433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!644352 (= e!369180 (arrayContainsKey!0 lt!298646 (select (arr!18430 a!2986) j!136) index!984))))

(declare-fun b!644353 () Bool)

(declare-fun res!417448 () Bool)

(declare-fun e!369177 () Bool)

(assert (=> b!644353 (=> (not res!417448) (not e!369177))))

(assert (=> b!644353 (= res!417448 (and (= (size!18794 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18794 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18794 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!644354 () Bool)

(declare-fun res!417438 () Bool)

(assert (=> b!644354 (=> (not res!417438) (not e!369177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!644354 (= res!417438 (validKeyInArray!0 k0!1786))))

(declare-fun b!644355 () Bool)

(declare-fun res!417436 () Bool)

(assert (=> b!644355 (=> (not res!417436) (not e!369168))))

(declare-datatypes ((List!12471 0))(
  ( (Nil!12468) (Cons!12467 (h!13512 (_ BitVec 64)) (t!18699 List!12471)) )
))
(declare-fun arrayNoDuplicates!0 (array!38433 (_ BitVec 32) List!12471) Bool)

(assert (=> b!644355 (= res!417436 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12468))))

(declare-fun b!644356 () Bool)

(declare-fun e!369179 () Bool)

(assert (=> b!644356 (= e!369179 (arrayContainsKey!0 lt!298646 (select (arr!18430 a!2986) j!136) index!984))))

(declare-fun b!644357 () Bool)

(declare-fun Unit!21848 () Unit!21846)

(assert (=> b!644357 (= e!369176 Unit!21848)))

(assert (=> b!644357 false))

(declare-fun b!644358 () Bool)

(declare-fun e!369166 () Unit!21846)

(declare-fun Unit!21849 () Unit!21846)

(assert (=> b!644358 (= e!369166 Unit!21849)))

(declare-fun b!644359 () Bool)

(declare-fun res!417443 () Bool)

(assert (=> b!644359 (=> (not res!417443) (not e!369168))))

(assert (=> b!644359 (= res!417443 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18430 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!417439 () Bool)

(assert (=> start!58336 (=> (not res!417439) (not e!369177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58336 (= res!417439 (validMask!0 mask!3053))))

(assert (=> start!58336 e!369177))

(assert (=> start!58336 true))

(declare-fun array_inv!14226 (array!38433) Bool)

(assert (=> start!58336 (array_inv!14226 a!2986)))

(declare-fun b!644360 () Bool)

(declare-fun Unit!21850 () Unit!21846)

(assert (=> b!644360 (= e!369166 Unit!21850)))

(declare-fun lt!298655 () Unit!21846)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38433 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21846)

(assert (=> b!644360 (= lt!298655 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298646 (select (arr!18430 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!644360 (arrayContainsKey!0 lt!298646 (select (arr!18430 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298656 () Unit!21846)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38433 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12471) Unit!21846)

(assert (=> b!644360 (= lt!298656 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12468))))

(assert (=> b!644360 (arrayNoDuplicates!0 lt!298646 #b00000000000000000000000000000000 Nil!12468)))

(declare-fun lt!298647 () Unit!21846)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38433 (_ BitVec 32) (_ BitVec 32)) Unit!21846)

(assert (=> b!644360 (= lt!298647 (lemmaNoDuplicateFromThenFromBigger!0 lt!298646 #b00000000000000000000000000000000 j!136))))

(assert (=> b!644360 (arrayNoDuplicates!0 lt!298646 j!136 Nil!12468)))

(declare-fun lt!298645 () Unit!21846)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38433 (_ BitVec 64) (_ BitVec 32) List!12471) Unit!21846)

(assert (=> b!644360 (= lt!298645 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298646 (select (arr!18430 a!2986) j!136) j!136 Nil!12468))))

(assert (=> b!644360 false))

(declare-fun b!644361 () Bool)

(declare-fun Unit!21851 () Unit!21846)

(assert (=> b!644361 (= e!369176 Unit!21851)))

(declare-fun b!644362 () Bool)

(declare-fun e!369173 () Bool)

(assert (=> b!644362 (= e!369173 e!369179)))

(declare-fun res!417449 () Bool)

(assert (=> b!644362 (=> (not res!417449) (not e!369179))))

(assert (=> b!644362 (= res!417449 (arrayContainsKey!0 lt!298646 (select (arr!18430 a!2986) j!136) j!136))))

(declare-fun b!644363 () Bool)

(declare-fun lt!298644 () SeekEntryResult!6870)

(assert (=> b!644363 (= e!369172 (= lt!298644 lt!298657))))

(declare-fun b!644364 () Bool)

(assert (=> b!644364 (= e!369169 e!369174)))

(declare-fun res!417452 () Bool)

(assert (=> b!644364 (=> (not res!417452) (not e!369174))))

(assert (=> b!644364 (= res!417452 (and (= lt!298644 (Found!6870 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18430 a!2986) index!984) (select (arr!18430 a!2986) j!136))) (not (= (select (arr!18430 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!644364 (= lt!298644 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18430 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644365 () Bool)

(declare-fun e!369171 () Bool)

(declare-fun e!369178 () Bool)

(assert (=> b!644365 (= e!369171 e!369178)))

(declare-fun res!417445 () Bool)

(assert (=> b!644365 (=> res!417445 e!369178)))

(assert (=> b!644365 (= res!417445 (bvsge index!984 j!136))))

(declare-fun lt!298653 () Unit!21846)

(assert (=> b!644365 (= lt!298653 e!369166)))

(declare-fun c!73825 () Bool)

(assert (=> b!644365 (= c!73825 (bvslt j!136 index!984))))

(declare-fun b!644366 () Bool)

(declare-fun res!417434 () Bool)

(assert (=> b!644366 (=> (not res!417434) (not e!369177))))

(assert (=> b!644366 (= res!417434 (validKeyInArray!0 (select (arr!18430 a!2986) j!136)))))

(declare-fun b!644367 () Bool)

(declare-fun res!417450 () Bool)

(assert (=> b!644367 (=> (not res!417450) (not e!369177))))

(assert (=> b!644367 (= res!417450 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!644368 () Bool)

(declare-fun e!369175 () Bool)

(assert (=> b!644368 (= e!369175 e!369173)))

(declare-fun res!417444 () Bool)

(assert (=> b!644368 (=> res!417444 e!369173)))

(declare-fun lt!298648 () (_ BitVec 64))

(assert (=> b!644368 (= res!417444 (or (not (= (select (arr!18430 a!2986) j!136) lt!298643)) (not (= (select (arr!18430 a!2986) j!136) lt!298648)) (bvsge j!136 index!984)))))

(declare-fun b!644369 () Bool)

(assert (=> b!644369 (= e!369170 e!369171)))

(declare-fun res!417437 () Bool)

(assert (=> b!644369 (=> res!417437 e!369171)))

(assert (=> b!644369 (= res!417437 (or (not (= (select (arr!18430 a!2986) j!136) lt!298643)) (not (= (select (arr!18430 a!2986) j!136) lt!298648))))))

(assert (=> b!644369 e!369175))

(declare-fun res!417441 () Bool)

(assert (=> b!644369 (=> (not res!417441) (not e!369175))))

(assert (=> b!644369 (= res!417441 (= lt!298648 (select (arr!18430 a!2986) j!136)))))

(assert (=> b!644369 (= lt!298648 (select (store (arr!18430 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!644370 () Bool)

(assert (=> b!644370 (= e!369177 e!369168)))

(declare-fun res!417447 () Bool)

(assert (=> b!644370 (=> (not res!417447) (not e!369168))))

(declare-fun lt!298649 () SeekEntryResult!6870)

(assert (=> b!644370 (= res!417447 (or (= lt!298649 (MissingZero!6870 i!1108)) (= lt!298649 (MissingVacant!6870 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38433 (_ BitVec 32)) SeekEntryResult!6870)

(assert (=> b!644370 (= lt!298649 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!644371 () Bool)

(assert (=> b!644371 (= e!369178 true)))

(assert (=> b!644371 e!369180))

(declare-fun res!417446 () Bool)

(assert (=> b!644371 (=> (not res!417446) (not e!369180))))

(assert (=> b!644371 (= res!417446 (arrayContainsKey!0 lt!298646 (select (arr!18430 a!2986) j!136) j!136))))

(declare-fun b!644372 () Bool)

(declare-fun res!417440 () Bool)

(assert (=> b!644372 (=> (not res!417440) (not e!369168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38433 (_ BitVec 32)) Bool)

(assert (=> b!644372 (= res!417440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!58336 res!417439) b!644353))

(assert (= (and b!644353 res!417448) b!644366))

(assert (= (and b!644366 res!417434) b!644354))

(assert (= (and b!644354 res!417438) b!644367))

(assert (= (and b!644367 res!417450) b!644370))

(assert (= (and b!644370 res!417447) b!644372))

(assert (= (and b!644372 res!417440) b!644355))

(assert (= (and b!644355 res!417436) b!644359))

(assert (= (and b!644359 res!417443) b!644351))

(assert (= (and b!644351 res!417442) b!644364))

(assert (= (and b!644364 res!417452) b!644350))

(assert (= (and b!644350 res!417451) b!644363))

(assert (= (and b!644350 c!73826) b!644357))

(assert (= (and b!644350 (not c!73826)) b!644361))

(assert (= (and b!644350 (not res!417435)) b!644369))

(assert (= (and b!644369 res!417441) b!644368))

(assert (= (and b!644368 (not res!417444)) b!644362))

(assert (= (and b!644362 res!417449) b!644356))

(assert (= (and b!644369 (not res!417437)) b!644365))

(assert (= (and b!644365 c!73825) b!644360))

(assert (= (and b!644365 (not c!73825)) b!644358))

(assert (= (and b!644365 (not res!417445)) b!644371))

(assert (= (and b!644371 res!417446) b!644352))

(declare-fun m!617969 () Bool)

(assert (=> b!644359 m!617969))

(declare-fun m!617971 () Bool)

(assert (=> b!644360 m!617971))

(assert (=> b!644360 m!617971))

(declare-fun m!617973 () Bool)

(assert (=> b!644360 m!617973))

(assert (=> b!644360 m!617971))

(declare-fun m!617975 () Bool)

(assert (=> b!644360 m!617975))

(declare-fun m!617977 () Bool)

(assert (=> b!644360 m!617977))

(assert (=> b!644360 m!617971))

(declare-fun m!617979 () Bool)

(assert (=> b!644360 m!617979))

(declare-fun m!617981 () Bool)

(assert (=> b!644360 m!617981))

(declare-fun m!617983 () Bool)

(assert (=> b!644360 m!617983))

(declare-fun m!617985 () Bool)

(assert (=> b!644360 m!617985))

(assert (=> b!644371 m!617971))

(assert (=> b!644371 m!617971))

(declare-fun m!617987 () Bool)

(assert (=> b!644371 m!617987))

(assert (=> b!644356 m!617971))

(assert (=> b!644356 m!617971))

(declare-fun m!617989 () Bool)

(assert (=> b!644356 m!617989))

(assert (=> b!644362 m!617971))

(assert (=> b!644362 m!617971))

(assert (=> b!644362 m!617987))

(declare-fun m!617991 () Bool)

(assert (=> b!644372 m!617991))

(declare-fun m!617993 () Bool)

(assert (=> b!644370 m!617993))

(declare-fun m!617995 () Bool)

(assert (=> b!644351 m!617995))

(declare-fun m!617997 () Bool)

(assert (=> b!644351 m!617997))

(assert (=> b!644352 m!617971))

(assert (=> b!644352 m!617971))

(assert (=> b!644352 m!617989))

(assert (=> b!644368 m!617971))

(declare-fun m!617999 () Bool)

(assert (=> b!644355 m!617999))

(declare-fun m!618001 () Bool)

(assert (=> b!644350 m!618001))

(declare-fun m!618003 () Bool)

(assert (=> b!644350 m!618003))

(assert (=> b!644350 m!617971))

(assert (=> b!644350 m!617995))

(declare-fun m!618005 () Bool)

(assert (=> b!644350 m!618005))

(assert (=> b!644350 m!617971))

(declare-fun m!618007 () Bool)

(assert (=> b!644350 m!618007))

(declare-fun m!618009 () Bool)

(assert (=> b!644350 m!618009))

(declare-fun m!618011 () Bool)

(assert (=> b!644350 m!618011))

(declare-fun m!618013 () Bool)

(assert (=> b!644364 m!618013))

(assert (=> b!644364 m!617971))

(assert (=> b!644364 m!617971))

(declare-fun m!618015 () Bool)

(assert (=> b!644364 m!618015))

(declare-fun m!618017 () Bool)

(assert (=> start!58336 m!618017))

(declare-fun m!618019 () Bool)

(assert (=> start!58336 m!618019))

(declare-fun m!618021 () Bool)

(assert (=> b!644367 m!618021))

(declare-fun m!618023 () Bool)

(assert (=> b!644354 m!618023))

(assert (=> b!644366 m!617971))

(assert (=> b!644366 m!617971))

(declare-fun m!618025 () Bool)

(assert (=> b!644366 m!618025))

(assert (=> b!644369 m!617971))

(assert (=> b!644369 m!617995))

(declare-fun m!618027 () Bool)

(assert (=> b!644369 m!618027))

(check-sat (not b!644355) (not b!644356) (not b!644372) (not b!644366) (not b!644367) (not b!644352) (not start!58336) (not b!644371) (not b!644364) (not b!644362) (not b!644354) (not b!644370) (not b!644360) (not b!644350))
