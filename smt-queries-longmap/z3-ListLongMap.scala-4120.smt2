; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56220 () Bool)

(assert start!56220)

(declare-fun b!623438 () Bool)

(declare-fun e!357598 () Bool)

(declare-fun lt!289218 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623438 (= e!357598 (validKeyInArray!0 lt!289218))))

(declare-fun res!401813 () Bool)

(declare-fun e!357612 () Bool)

(assert (=> start!56220 (=> (not res!401813) (not e!357612))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56220 (= res!401813 (validMask!0 mask!3053))))

(assert (=> start!56220 e!357612))

(assert (=> start!56220 true))

(declare-datatypes ((array!37690 0))(
  ( (array!37691 (arr!18091 (Array (_ BitVec 32) (_ BitVec 64))) (size!18455 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37690)

(declare-fun array_inv!13887 (array!37690) Bool)

(assert (=> start!56220 (array_inv!13887 a!2986)))

(declare-fun b!623439 () Bool)

(declare-datatypes ((Unit!21038 0))(
  ( (Unit!21039) )
))
(declare-fun e!357611 () Unit!21038)

(declare-fun Unit!21040 () Unit!21038)

(assert (=> b!623439 (= e!357611 Unit!21040)))

(declare-fun b!623440 () Bool)

(declare-fun e!357608 () Bool)

(declare-fun e!357603 () Bool)

(assert (=> b!623440 (= e!357608 e!357603)))

(declare-fun res!401804 () Bool)

(assert (=> b!623440 (=> (not res!401804) (not e!357603))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!623440 (= res!401804 (= (select (store (arr!18091 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!289222 () array!37690)

(assert (=> b!623440 (= lt!289222 (array!37691 (store (arr!18091 a!2986) i!1108 k0!1786) (size!18455 a!2986)))))

(declare-fun b!623441 () Bool)

(declare-fun res!401816 () Bool)

(assert (=> b!623441 (=> (not res!401816) (not e!357612))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!623441 (= res!401816 (and (= (size!18455 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18455 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18455 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!401801 () Bool)

(declare-fun b!623442 () Bool)

(declare-fun arrayContainsKey!0 (array!37690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623442 (= res!401801 (arrayContainsKey!0 lt!289222 (select (arr!18091 a!2986) j!136) j!136))))

(declare-fun e!357604 () Bool)

(assert (=> b!623442 (=> (not res!401801) (not e!357604))))

(declare-fun e!357601 () Bool)

(assert (=> b!623442 (= e!357601 e!357604)))

(declare-fun b!623443 () Bool)

(declare-fun res!401806 () Bool)

(assert (=> b!623443 (=> (not res!401806) (not e!357608))))

(declare-datatypes ((List!12132 0))(
  ( (Nil!12129) (Cons!12128 (h!13173 (_ BitVec 64)) (t!18360 List!12132)) )
))
(declare-fun arrayNoDuplicates!0 (array!37690 (_ BitVec 32) List!12132) Bool)

(assert (=> b!623443 (= res!401806 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12129))))

(declare-fun b!623444 () Bool)

(declare-fun e!357610 () Unit!21038)

(declare-fun Unit!21041 () Unit!21038)

(assert (=> b!623444 (= e!357610 Unit!21041)))

(declare-fun res!401808 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!623444 (= res!401808 (= (select (store (arr!18091 a!2986) i!1108 k0!1786) index!984) (select (arr!18091 a!2986) j!136)))))

(declare-fun e!357605 () Bool)

(assert (=> b!623444 (=> (not res!401808) (not e!357605))))

(assert (=> b!623444 e!357605))

(declare-fun c!71187 () Bool)

(assert (=> b!623444 (= c!71187 (bvslt j!136 index!984))))

(declare-fun lt!289227 () Unit!21038)

(declare-fun e!357602 () Unit!21038)

(assert (=> b!623444 (= lt!289227 e!357602)))

(declare-fun c!71189 () Bool)

(assert (=> b!623444 (= c!71189 (bvslt index!984 j!136))))

(declare-fun lt!289237 () Unit!21038)

(declare-fun e!357607 () Unit!21038)

(assert (=> b!623444 (= lt!289237 e!357607)))

(assert (=> b!623444 false))

(declare-fun b!623445 () Bool)

(declare-fun Unit!21042 () Unit!21038)

(assert (=> b!623445 (= e!357610 Unit!21042)))

(declare-fun b!623446 () Bool)

(declare-fun Unit!21043 () Unit!21038)

(assert (=> b!623446 (= e!357602 Unit!21043)))

(declare-fun b!623447 () Bool)

(declare-fun Unit!21044 () Unit!21038)

(assert (=> b!623447 (= e!357611 Unit!21044)))

(assert (=> b!623447 false))

(declare-fun e!357599 () Bool)

(declare-fun b!623448 () Bool)

(assert (=> b!623448 (= e!357599 (arrayContainsKey!0 lt!289222 (select (arr!18091 a!2986) j!136) index!984))))

(declare-fun b!623449 () Bool)

(declare-fun res!401814 () Bool)

(assert (=> b!623449 (= res!401814 (bvsge j!136 index!984))))

(assert (=> b!623449 (=> res!401814 e!357601)))

(assert (=> b!623449 (= e!357605 e!357601)))

(declare-fun b!623450 () Bool)

(declare-fun Unit!21045 () Unit!21038)

(assert (=> b!623450 (= e!357607 Unit!21045)))

(declare-fun b!623451 () Bool)

(assert (=> b!623451 (= e!357604 (arrayContainsKey!0 lt!289222 (select (arr!18091 a!2986) j!136) index!984))))

(declare-fun b!623452 () Bool)

(assert (=> b!623452 (= e!357612 e!357608)))

(declare-fun res!401810 () Bool)

(assert (=> b!623452 (=> (not res!401810) (not e!357608))))

(declare-datatypes ((SeekEntryResult!6531 0))(
  ( (MissingZero!6531 (index!28408 (_ BitVec 32))) (Found!6531 (index!28409 (_ BitVec 32))) (Intermediate!6531 (undefined!7343 Bool) (index!28410 (_ BitVec 32)) (x!57171 (_ BitVec 32))) (Undefined!6531) (MissingVacant!6531 (index!28411 (_ BitVec 32))) )
))
(declare-fun lt!289228 () SeekEntryResult!6531)

(assert (=> b!623452 (= res!401810 (or (= lt!289228 (MissingZero!6531 i!1108)) (= lt!289228 (MissingVacant!6531 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37690 (_ BitVec 32)) SeekEntryResult!6531)

(assert (=> b!623452 (= lt!289228 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!623453 () Bool)

(declare-fun e!357600 () Bool)

(assert (=> b!623453 (= e!357600 (not e!357598))))

(declare-fun res!401809 () Bool)

(assert (=> b!623453 (=> res!401809 e!357598)))

(declare-fun lt!289229 () SeekEntryResult!6531)

(assert (=> b!623453 (= res!401809 (or (= lt!289229 (MissingVacant!6531 vacantSpotIndex!68)) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!289231 () Unit!21038)

(assert (=> b!623453 (= lt!289231 e!357610)))

(declare-fun c!71186 () Bool)

(assert (=> b!623453 (= c!71186 (= lt!289229 (Found!6531 index!984)))))

(declare-fun lt!289226 () Unit!21038)

(assert (=> b!623453 (= lt!289226 e!357611)))

(declare-fun c!71188 () Bool)

(assert (=> b!623453 (= c!71188 (= lt!289229 Undefined!6531))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37690 (_ BitVec 32)) SeekEntryResult!6531)

(assert (=> b!623453 (= lt!289229 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!289218 lt!289222 mask!3053))))

(declare-fun e!357609 () Bool)

(assert (=> b!623453 e!357609))

(declare-fun res!401800 () Bool)

(assert (=> b!623453 (=> (not res!401800) (not e!357609))))

(declare-fun lt!289219 () (_ BitVec 32))

(declare-fun lt!289220 () SeekEntryResult!6531)

(assert (=> b!623453 (= res!401800 (= lt!289220 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289219 vacantSpotIndex!68 lt!289218 lt!289222 mask!3053)))))

(assert (=> b!623453 (= lt!289220 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289219 vacantSpotIndex!68 (select (arr!18091 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!623453 (= lt!289218 (select (store (arr!18091 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!289234 () Unit!21038)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37690 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21038)

(assert (=> b!623453 (= lt!289234 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!289219 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623453 (= lt!289219 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!623454 () Bool)

(declare-fun res!401803 () Bool)

(assert (=> b!623454 (=> (not res!401803) (not e!357612))))

(assert (=> b!623454 (= res!401803 (validKeyInArray!0 k0!1786))))

(declare-fun b!623455 () Bool)

(assert (=> b!623455 false))

(declare-fun lt!289221 () Unit!21038)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37690 (_ BitVec 64) (_ BitVec 32) List!12132) Unit!21038)

(assert (=> b!623455 (= lt!289221 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!289222 (select (arr!18091 a!2986) j!136) j!136 Nil!12129))))

(assert (=> b!623455 (arrayNoDuplicates!0 lt!289222 j!136 Nil!12129)))

(declare-fun lt!289232 () Unit!21038)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37690 (_ BitVec 32) (_ BitVec 32)) Unit!21038)

(assert (=> b!623455 (= lt!289232 (lemmaNoDuplicateFromThenFromBigger!0 lt!289222 #b00000000000000000000000000000000 j!136))))

(assert (=> b!623455 (arrayNoDuplicates!0 lt!289222 #b00000000000000000000000000000000 Nil!12129)))

(declare-fun lt!289235 () Unit!21038)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37690 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12132) Unit!21038)

(assert (=> b!623455 (= lt!289235 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12129))))

(assert (=> b!623455 (arrayContainsKey!0 lt!289222 (select (arr!18091 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!289236 () Unit!21038)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37690 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21038)

(assert (=> b!623455 (= lt!289236 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!289222 (select (arr!18091 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!21046 () Unit!21038)

(assert (=> b!623455 (= e!357602 Unit!21046)))

(declare-fun b!623456 () Bool)

(declare-fun res!401811 () Bool)

(assert (=> b!623456 (=> (not res!401811) (not e!357612))))

(assert (=> b!623456 (= res!401811 (validKeyInArray!0 (select (arr!18091 a!2986) j!136)))))

(declare-fun b!623457 () Bool)

(assert (=> b!623457 (= e!357603 e!357600)))

(declare-fun res!401805 () Bool)

(assert (=> b!623457 (=> (not res!401805) (not e!357600))))

(declare-fun lt!289223 () SeekEntryResult!6531)

(assert (=> b!623457 (= res!401805 (and (= lt!289223 (Found!6531 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18091 a!2986) index!984) (select (arr!18091 a!2986) j!136))) (not (= (select (arr!18091 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!623457 (= lt!289223 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18091 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!623458 () Bool)

(declare-fun res!401812 () Bool)

(assert (=> b!623458 (=> (not res!401812) (not e!357608))))

(assert (=> b!623458 (= res!401812 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18091 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623459 () Bool)

(declare-fun res!401802 () Bool)

(assert (=> b!623459 (=> (not res!401802) (not e!357612))))

(assert (=> b!623459 (= res!401802 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623460 () Bool)

(assert (=> b!623460 false))

(declare-fun lt!289224 () Unit!21038)

(assert (=> b!623460 (= lt!289224 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!289222 (select (arr!18091 a!2986) j!136) index!984 Nil!12129))))

(assert (=> b!623460 (arrayNoDuplicates!0 lt!289222 index!984 Nil!12129)))

(declare-fun lt!289225 () Unit!21038)

(assert (=> b!623460 (= lt!289225 (lemmaNoDuplicateFromThenFromBigger!0 lt!289222 #b00000000000000000000000000000000 index!984))))

(assert (=> b!623460 (arrayNoDuplicates!0 lt!289222 #b00000000000000000000000000000000 Nil!12129)))

(declare-fun lt!289233 () Unit!21038)

(assert (=> b!623460 (= lt!289233 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12129))))

(assert (=> b!623460 (arrayContainsKey!0 lt!289222 (select (arr!18091 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!289230 () Unit!21038)

(assert (=> b!623460 (= lt!289230 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!289222 (select (arr!18091 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!623460 e!357599))

(declare-fun res!401815 () Bool)

(assert (=> b!623460 (=> (not res!401815) (not e!357599))))

(assert (=> b!623460 (= res!401815 (arrayContainsKey!0 lt!289222 (select (arr!18091 a!2986) j!136) j!136))))

(declare-fun Unit!21047 () Unit!21038)

(assert (=> b!623460 (= e!357607 Unit!21047)))

(declare-fun b!623461 () Bool)

(declare-fun res!401807 () Bool)

(assert (=> b!623461 (=> (not res!401807) (not e!357608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37690 (_ BitVec 32)) Bool)

(assert (=> b!623461 (= res!401807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623462 () Bool)

(assert (=> b!623462 (= e!357609 (= lt!289223 lt!289220))))

(assert (= (and start!56220 res!401813) b!623441))

(assert (= (and b!623441 res!401816) b!623456))

(assert (= (and b!623456 res!401811) b!623454))

(assert (= (and b!623454 res!401803) b!623459))

(assert (= (and b!623459 res!401802) b!623452))

(assert (= (and b!623452 res!401810) b!623461))

(assert (= (and b!623461 res!401807) b!623443))

(assert (= (and b!623443 res!401806) b!623458))

(assert (= (and b!623458 res!401812) b!623440))

(assert (= (and b!623440 res!401804) b!623457))

(assert (= (and b!623457 res!401805) b!623453))

(assert (= (and b!623453 res!401800) b!623462))

(assert (= (and b!623453 c!71188) b!623447))

(assert (= (and b!623453 (not c!71188)) b!623439))

(assert (= (and b!623453 c!71186) b!623444))

(assert (= (and b!623453 (not c!71186)) b!623445))

(assert (= (and b!623444 res!401808) b!623449))

(assert (= (and b!623449 (not res!401814)) b!623442))

(assert (= (and b!623442 res!401801) b!623451))

(assert (= (and b!623444 c!71187) b!623455))

(assert (= (and b!623444 (not c!71187)) b!623446))

(assert (= (and b!623444 c!71189) b!623460))

(assert (= (and b!623444 (not c!71189)) b!623450))

(assert (= (and b!623460 res!401815) b!623448))

(assert (= (and b!623453 (not res!401809)) b!623438))

(declare-fun m!599273 () Bool)

(assert (=> b!623457 m!599273))

(declare-fun m!599275 () Bool)

(assert (=> b!623457 m!599275))

(assert (=> b!623457 m!599275))

(declare-fun m!599277 () Bool)

(assert (=> b!623457 m!599277))

(declare-fun m!599279 () Bool)

(assert (=> b!623459 m!599279))

(assert (=> b!623448 m!599275))

(assert (=> b!623448 m!599275))

(declare-fun m!599281 () Bool)

(assert (=> b!623448 m!599281))

(declare-fun m!599283 () Bool)

(assert (=> b!623438 m!599283))

(declare-fun m!599285 () Bool)

(assert (=> b!623458 m!599285))

(declare-fun m!599287 () Bool)

(assert (=> b!623440 m!599287))

(declare-fun m!599289 () Bool)

(assert (=> b!623440 m!599289))

(assert (=> b!623451 m!599275))

(assert (=> b!623451 m!599275))

(assert (=> b!623451 m!599281))

(declare-fun m!599291 () Bool)

(assert (=> b!623454 m!599291))

(assert (=> b!623456 m!599275))

(assert (=> b!623456 m!599275))

(declare-fun m!599293 () Bool)

(assert (=> b!623456 m!599293))

(assert (=> b!623444 m!599287))

(declare-fun m!599295 () Bool)

(assert (=> b!623444 m!599295))

(assert (=> b!623444 m!599275))

(declare-fun m!599297 () Bool)

(assert (=> start!56220 m!599297))

(declare-fun m!599299 () Bool)

(assert (=> start!56220 m!599299))

(assert (=> b!623455 m!599275))

(declare-fun m!599301 () Bool)

(assert (=> b!623455 m!599301))

(declare-fun m!599303 () Bool)

(assert (=> b!623455 m!599303))

(assert (=> b!623455 m!599275))

(declare-fun m!599305 () Bool)

(assert (=> b!623455 m!599305))

(assert (=> b!623455 m!599275))

(declare-fun m!599307 () Bool)

(assert (=> b!623455 m!599307))

(assert (=> b!623455 m!599275))

(declare-fun m!599309 () Bool)

(assert (=> b!623455 m!599309))

(declare-fun m!599311 () Bool)

(assert (=> b!623455 m!599311))

(declare-fun m!599313 () Bool)

(assert (=> b!623455 m!599313))

(declare-fun m!599315 () Bool)

(assert (=> b!623453 m!599315))

(declare-fun m!599317 () Bool)

(assert (=> b!623453 m!599317))

(assert (=> b!623453 m!599275))

(declare-fun m!599319 () Bool)

(assert (=> b!623453 m!599319))

(assert (=> b!623453 m!599275))

(declare-fun m!599321 () Bool)

(assert (=> b!623453 m!599321))

(assert (=> b!623453 m!599287))

(declare-fun m!599323 () Bool)

(assert (=> b!623453 m!599323))

(declare-fun m!599325 () Bool)

(assert (=> b!623453 m!599325))

(assert (=> b!623442 m!599275))

(assert (=> b!623442 m!599275))

(declare-fun m!599327 () Bool)

(assert (=> b!623442 m!599327))

(declare-fun m!599329 () Bool)

(assert (=> b!623443 m!599329))

(declare-fun m!599331 () Bool)

(assert (=> b!623461 m!599331))

(declare-fun m!599333 () Bool)

(assert (=> b!623452 m!599333))

(assert (=> b!623460 m!599275))

(assert (=> b!623460 m!599327))

(assert (=> b!623460 m!599275))

(declare-fun m!599335 () Bool)

(assert (=> b!623460 m!599335))

(assert (=> b!623460 m!599275))

(declare-fun m!599337 () Bool)

(assert (=> b!623460 m!599337))

(assert (=> b!623460 m!599275))

(declare-fun m!599339 () Bool)

(assert (=> b!623460 m!599339))

(declare-fun m!599341 () Bool)

(assert (=> b!623460 m!599341))

(assert (=> b!623460 m!599275))

(declare-fun m!599343 () Bool)

(assert (=> b!623460 m!599343))

(assert (=> b!623460 m!599311))

(assert (=> b!623460 m!599313))

(check-sat (not b!623451) (not b!623456) (not b!623460) (not b!623443) (not b!623457) (not b!623459) (not b!623452) (not start!56220) (not b!623455) (not b!623461) (not b!623448) (not b!623453) (not b!623442) (not b!623438) (not b!623454))
(check-sat)
