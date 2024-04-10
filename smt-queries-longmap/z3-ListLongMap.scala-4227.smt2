; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58132 () Bool)

(assert start!58132)

(declare-fun b!642488 () Bool)

(declare-fun res!416215 () Bool)

(declare-fun e!367944 () Bool)

(assert (=> b!642488 (=> (not res!416215) (not e!367944))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38391 0))(
  ( (array!38392 (arr!18412 (Array (_ BitVec 32) (_ BitVec 64))) (size!18776 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38391)

(assert (=> b!642488 (= res!416215 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18412 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642489 () Bool)

(declare-fun res!416214 () Bool)

(assert (=> b!642489 (=> (not res!416214) (not e!367944))))

(declare-datatypes ((List!12453 0))(
  ( (Nil!12450) (Cons!12449 (h!13494 (_ BitVec 64)) (t!18681 List!12453)) )
))
(declare-fun arrayNoDuplicates!0 (array!38391 (_ BitVec 32) List!12453) Bool)

(assert (=> b!642489 (= res!416214 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12450))))

(declare-fun b!642490 () Bool)

(declare-fun e!367947 () Bool)

(assert (=> b!642490 (= e!367947 e!367944)))

(declare-fun res!416201 () Bool)

(assert (=> b!642490 (=> (not res!416201) (not e!367944))))

(declare-datatypes ((SeekEntryResult!6852 0))(
  ( (MissingZero!6852 (index!29734 (_ BitVec 32))) (Found!6852 (index!29735 (_ BitVec 32))) (Intermediate!6852 (undefined!7664 Bool) (index!29736 (_ BitVec 32)) (x!58498 (_ BitVec 32))) (Undefined!6852) (MissingVacant!6852 (index!29737 (_ BitVec 32))) )
))
(declare-fun lt!297562 () SeekEntryResult!6852)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!642490 (= res!416201 (or (= lt!297562 (MissingZero!6852 i!1108)) (= lt!297562 (MissingVacant!6852 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38391 (_ BitVec 32)) SeekEntryResult!6852)

(assert (=> b!642490 (= lt!297562 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!642491 () Bool)

(declare-fun res!416210 () Bool)

(assert (=> b!642491 (=> (not res!416210) (not e!367947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642491 (= res!416210 (validKeyInArray!0 k0!1786))))

(declare-fun b!642492 () Bool)

(declare-datatypes ((Unit!21742 0))(
  ( (Unit!21743) )
))
(declare-fun e!367953 () Unit!21742)

(declare-fun Unit!21744 () Unit!21742)

(assert (=> b!642492 (= e!367953 Unit!21744)))

(declare-fun b!642493 () Bool)

(declare-fun e!367945 () Bool)

(declare-fun e!367951 () Bool)

(assert (=> b!642493 (= e!367945 e!367951)))

(declare-fun res!416211 () Bool)

(assert (=> b!642493 (=> (not res!416211) (not e!367951))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!297561 () SeekEntryResult!6852)

(assert (=> b!642493 (= res!416211 (and (= lt!297561 (Found!6852 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18412 a!2986) index!984) (select (arr!18412 a!2986) j!136))) (not (= (select (arr!18412 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38391 (_ BitVec 32)) SeekEntryResult!6852)

(assert (=> b!642493 (= lt!297561 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18412 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642494 () Bool)

(declare-fun res!416208 () Bool)

(assert (=> b!642494 (=> (not res!416208) (not e!367947))))

(declare-fun arrayContainsKey!0 (array!38391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642494 (= res!416208 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!642495 () Bool)

(declare-fun res!416204 () Bool)

(assert (=> b!642495 (=> (not res!416204) (not e!367947))))

(assert (=> b!642495 (= res!416204 (and (= (size!18776 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18776 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18776 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642496 () Bool)

(declare-fun Unit!21745 () Unit!21742)

(assert (=> b!642496 (= e!367953 Unit!21745)))

(assert (=> b!642496 false))

(declare-fun b!642497 () Bool)

(declare-fun lt!297556 () array!38391)

(declare-fun e!367949 () Bool)

(assert (=> b!642497 (= e!367949 (arrayContainsKey!0 lt!297556 (select (arr!18412 a!2986) j!136) index!984))))

(declare-fun b!642498 () Bool)

(declare-fun res!416216 () Bool)

(assert (=> b!642498 (=> (not res!416216) (not e!367944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38391 (_ BitVec 32)) Bool)

(assert (=> b!642498 (= res!416216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!416200 () Bool)

(assert (=> start!58132 (=> (not res!416200) (not e!367947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58132 (= res!416200 (validMask!0 mask!3053))))

(assert (=> start!58132 e!367947))

(assert (=> start!58132 true))

(declare-fun array_inv!14208 (array!38391) Bool)

(assert (=> start!58132 (array_inv!14208 a!2986)))

(declare-fun b!642499 () Bool)

(declare-fun e!367950 () Bool)

(assert (=> b!642499 (= e!367951 (not e!367950))))

(declare-fun res!416209 () Bool)

(assert (=> b!642499 (=> res!416209 e!367950)))

(declare-fun lt!297558 () SeekEntryResult!6852)

(assert (=> b!642499 (= res!416209 (not (= lt!297558 (Found!6852 index!984))))))

(declare-fun lt!297549 () Unit!21742)

(assert (=> b!642499 (= lt!297549 e!367953)))

(declare-fun c!73511 () Bool)

(assert (=> b!642499 (= c!73511 (= lt!297558 Undefined!6852))))

(declare-fun lt!297555 () (_ BitVec 64))

(assert (=> b!642499 (= lt!297558 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297555 lt!297556 mask!3053))))

(declare-fun e!367946 () Bool)

(assert (=> b!642499 e!367946))

(declare-fun res!416207 () Bool)

(assert (=> b!642499 (=> (not res!416207) (not e!367946))))

(declare-fun lt!297559 () SeekEntryResult!6852)

(declare-fun lt!297553 () (_ BitVec 32))

(assert (=> b!642499 (= res!416207 (= lt!297559 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297553 vacantSpotIndex!68 lt!297555 lt!297556 mask!3053)))))

(assert (=> b!642499 (= lt!297559 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297553 vacantSpotIndex!68 (select (arr!18412 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!642499 (= lt!297555 (select (store (arr!18412 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!297554 () Unit!21742)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38391 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21742)

(assert (=> b!642499 (= lt!297554 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297553 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642499 (= lt!297553 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!642500 () Bool)

(declare-fun e!367948 () Bool)

(assert (=> b!642500 (= e!367948 false)))

(assert (=> b!642500 (not (= lt!297555 (select (arr!18412 a!2986) j!136)))))

(declare-fun lt!297557 () Unit!21742)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38391 (_ BitVec 64) (_ BitVec 32) List!12453) Unit!21742)

(assert (=> b!642500 (= lt!297557 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297556 (select (arr!18412 a!2986) j!136) j!136 Nil!12450))))

(assert (=> b!642500 (arrayNoDuplicates!0 lt!297556 j!136 Nil!12450)))

(declare-fun lt!297552 () Unit!21742)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38391 (_ BitVec 32) (_ BitVec 32)) Unit!21742)

(assert (=> b!642500 (= lt!297552 (lemmaNoDuplicateFromThenFromBigger!0 lt!297556 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642500 (arrayNoDuplicates!0 lt!297556 #b00000000000000000000000000000000 Nil!12450)))

(declare-fun lt!297551 () Unit!21742)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38391 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12453) Unit!21742)

(assert (=> b!642500 (= lt!297551 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12450))))

(assert (=> b!642500 (arrayContainsKey!0 lt!297556 (select (arr!18412 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297560 () Unit!21742)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38391 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21742)

(assert (=> b!642500 (= lt!297560 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297556 (select (arr!18412 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!642501 () Bool)

(declare-fun res!416202 () Bool)

(assert (=> b!642501 (=> (not res!416202) (not e!367947))))

(assert (=> b!642501 (= res!416202 (validKeyInArray!0 (select (arr!18412 a!2986) j!136)))))

(declare-fun b!642502 () Bool)

(assert (=> b!642502 (= e!367950 e!367948)))

(declare-fun res!416206 () Bool)

(assert (=> b!642502 (=> res!416206 e!367948)))

(declare-fun lt!297550 () (_ BitVec 64))

(assert (=> b!642502 (= res!416206 (or (not (= (select (arr!18412 a!2986) j!136) lt!297555)) (not (= (select (arr!18412 a!2986) j!136) lt!297550)) (bvsge j!136 index!984)))))

(declare-fun e!367942 () Bool)

(assert (=> b!642502 e!367942))

(declare-fun res!416212 () Bool)

(assert (=> b!642502 (=> (not res!416212) (not e!367942))))

(assert (=> b!642502 (= res!416212 (= lt!297550 (select (arr!18412 a!2986) j!136)))))

(assert (=> b!642502 (= lt!297550 (select (store (arr!18412 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!642503 () Bool)

(declare-fun e!367952 () Bool)

(assert (=> b!642503 (= e!367952 e!367949)))

(declare-fun res!416205 () Bool)

(assert (=> b!642503 (=> (not res!416205) (not e!367949))))

(assert (=> b!642503 (= res!416205 (arrayContainsKey!0 lt!297556 (select (arr!18412 a!2986) j!136) j!136))))

(declare-fun b!642504 () Bool)

(assert (=> b!642504 (= e!367944 e!367945)))

(declare-fun res!416203 () Bool)

(assert (=> b!642504 (=> (not res!416203) (not e!367945))))

(assert (=> b!642504 (= res!416203 (= (select (store (arr!18412 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642504 (= lt!297556 (array!38392 (store (arr!18412 a!2986) i!1108 k0!1786) (size!18776 a!2986)))))

(declare-fun b!642505 () Bool)

(assert (=> b!642505 (= e!367946 (= lt!297561 lt!297559))))

(declare-fun b!642506 () Bool)

(assert (=> b!642506 (= e!367942 e!367952)))

(declare-fun res!416213 () Bool)

(assert (=> b!642506 (=> res!416213 e!367952)))

(assert (=> b!642506 (= res!416213 (or (not (= (select (arr!18412 a!2986) j!136) lt!297555)) (not (= (select (arr!18412 a!2986) j!136) lt!297550)) (bvsge j!136 index!984)))))

(assert (= (and start!58132 res!416200) b!642495))

(assert (= (and b!642495 res!416204) b!642501))

(assert (= (and b!642501 res!416202) b!642491))

(assert (= (and b!642491 res!416210) b!642494))

(assert (= (and b!642494 res!416208) b!642490))

(assert (= (and b!642490 res!416201) b!642498))

(assert (= (and b!642498 res!416216) b!642489))

(assert (= (and b!642489 res!416214) b!642488))

(assert (= (and b!642488 res!416215) b!642504))

(assert (= (and b!642504 res!416203) b!642493))

(assert (= (and b!642493 res!416211) b!642499))

(assert (= (and b!642499 res!416207) b!642505))

(assert (= (and b!642499 c!73511) b!642496))

(assert (= (and b!642499 (not c!73511)) b!642492))

(assert (= (and b!642499 (not res!416209)) b!642502))

(assert (= (and b!642502 res!416212) b!642506))

(assert (= (and b!642506 (not res!416213)) b!642503))

(assert (= (and b!642503 res!416205) b!642497))

(assert (= (and b!642502 (not res!416206)) b!642500))

(declare-fun m!616265 () Bool)

(assert (=> b!642493 m!616265))

(declare-fun m!616267 () Bool)

(assert (=> b!642493 m!616267))

(assert (=> b!642493 m!616267))

(declare-fun m!616269 () Bool)

(assert (=> b!642493 m!616269))

(assert (=> b!642502 m!616267))

(declare-fun m!616271 () Bool)

(assert (=> b!642502 m!616271))

(declare-fun m!616273 () Bool)

(assert (=> b!642502 m!616273))

(declare-fun m!616275 () Bool)

(assert (=> b!642489 m!616275))

(declare-fun m!616277 () Bool)

(assert (=> b!642499 m!616277))

(declare-fun m!616279 () Bool)

(assert (=> b!642499 m!616279))

(assert (=> b!642499 m!616267))

(assert (=> b!642499 m!616271))

(declare-fun m!616281 () Bool)

(assert (=> b!642499 m!616281))

(declare-fun m!616283 () Bool)

(assert (=> b!642499 m!616283))

(declare-fun m!616285 () Bool)

(assert (=> b!642499 m!616285))

(assert (=> b!642499 m!616267))

(declare-fun m!616287 () Bool)

(assert (=> b!642499 m!616287))

(declare-fun m!616289 () Bool)

(assert (=> b!642494 m!616289))

(assert (=> b!642497 m!616267))

(assert (=> b!642497 m!616267))

(declare-fun m!616291 () Bool)

(assert (=> b!642497 m!616291))

(declare-fun m!616293 () Bool)

(assert (=> b!642498 m!616293))

(declare-fun m!616295 () Bool)

(assert (=> start!58132 m!616295))

(declare-fun m!616297 () Bool)

(assert (=> start!58132 m!616297))

(declare-fun m!616299 () Bool)

(assert (=> b!642491 m!616299))

(declare-fun m!616301 () Bool)

(assert (=> b!642488 m!616301))

(assert (=> b!642503 m!616267))

(assert (=> b!642503 m!616267))

(declare-fun m!616303 () Bool)

(assert (=> b!642503 m!616303))

(declare-fun m!616305 () Bool)

(assert (=> b!642490 m!616305))

(assert (=> b!642501 m!616267))

(assert (=> b!642501 m!616267))

(declare-fun m!616307 () Bool)

(assert (=> b!642501 m!616307))

(assert (=> b!642500 m!616267))

(assert (=> b!642500 m!616267))

(declare-fun m!616309 () Bool)

(assert (=> b!642500 m!616309))

(declare-fun m!616311 () Bool)

(assert (=> b!642500 m!616311))

(assert (=> b!642500 m!616267))

(declare-fun m!616313 () Bool)

(assert (=> b!642500 m!616313))

(declare-fun m!616315 () Bool)

(assert (=> b!642500 m!616315))

(declare-fun m!616317 () Bool)

(assert (=> b!642500 m!616317))

(assert (=> b!642500 m!616267))

(declare-fun m!616319 () Bool)

(assert (=> b!642500 m!616319))

(declare-fun m!616321 () Bool)

(assert (=> b!642500 m!616321))

(assert (=> b!642506 m!616267))

(assert (=> b!642504 m!616271))

(declare-fun m!616323 () Bool)

(assert (=> b!642504 m!616323))

(check-sat (not b!642493) (not b!642491) (not b!642499) (not b!642503) (not b!642497) (not b!642489) (not b!642501) (not b!642490) (not start!58132) (not b!642494) (not b!642500) (not b!642498))
(check-sat)
