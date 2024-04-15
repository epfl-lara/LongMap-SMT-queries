; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55566 () Bool)

(assert start!55566)

(declare-fun b!608483 () Bool)

(declare-fun e!348457 () Bool)

(assert (=> b!608483 (= e!348457 true)))

(declare-fun lt!277927 () Bool)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((List!11986 0))(
  ( (Nil!11983) (Cons!11982 (h!13027 (_ BitVec 64)) (t!18205 List!11986)) )
))
(declare-fun contains!3008 (List!11986 (_ BitVec 64)) Bool)

(assert (=> b!608483 (= lt!277927 (contains!3008 Nil!11983 k0!1786))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37311 0))(
  ( (array!37312 (arr!17906 (Array (_ BitVec 32) (_ BitVec 64))) (size!18271 (_ BitVec 32))) )
))
(declare-fun lt!277930 () array!37311)

(declare-fun b!608484 () Bool)

(declare-fun e!348469 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37311)

(declare-fun arrayContainsKey!0 (array!37311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608484 (= e!348469 (arrayContainsKey!0 lt!277930 (select (arr!17906 a!2986) j!136) index!984))))

(declare-fun b!608485 () Bool)

(declare-fun e!348459 () Bool)

(declare-fun e!348460 () Bool)

(assert (=> b!608485 (= e!348459 (not e!348460))))

(declare-fun res!391254 () Bool)

(assert (=> b!608485 (=> res!391254 e!348460)))

(declare-datatypes ((SeekEntryResult!6343 0))(
  ( (MissingZero!6343 (index!27647 (_ BitVec 32))) (Found!6343 (index!27648 (_ BitVec 32))) (Intermediate!6343 (undefined!7155 Bool) (index!27649 (_ BitVec 32)) (x!56463 (_ BitVec 32))) (Undefined!6343) (MissingVacant!6343 (index!27650 (_ BitVec 32))) )
))
(declare-fun lt!277922 () SeekEntryResult!6343)

(assert (=> b!608485 (= res!391254 (not (= lt!277922 (Found!6343 index!984))))))

(declare-datatypes ((Unit!19440 0))(
  ( (Unit!19441) )
))
(declare-fun lt!277917 () Unit!19440)

(declare-fun e!348456 () Unit!19440)

(assert (=> b!608485 (= lt!277917 e!348456)))

(declare-fun c!68985 () Bool)

(assert (=> b!608485 (= c!68985 (= lt!277922 Undefined!6343))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!277928 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37311 (_ BitVec 32)) SeekEntryResult!6343)

(assert (=> b!608485 (= lt!277922 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277928 lt!277930 mask!3053))))

(declare-fun e!348462 () Bool)

(assert (=> b!608485 e!348462))

(declare-fun res!391260 () Bool)

(assert (=> b!608485 (=> (not res!391260) (not e!348462))))

(declare-fun lt!277923 () (_ BitVec 32))

(declare-fun lt!277919 () SeekEntryResult!6343)

(assert (=> b!608485 (= res!391260 (= lt!277919 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277923 vacantSpotIndex!68 lt!277928 lt!277930 mask!3053)))))

(assert (=> b!608485 (= lt!277919 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277923 vacantSpotIndex!68 (select (arr!17906 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!608485 (= lt!277928 (select (store (arr!17906 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277929 () Unit!19440)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37311 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19440)

(assert (=> b!608485 (= lt!277929 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277923 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608485 (= lt!277923 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!608486 () Bool)

(declare-fun lt!277921 () SeekEntryResult!6343)

(assert (=> b!608486 (= e!348462 (= lt!277921 lt!277919))))

(declare-fun b!608487 () Bool)

(declare-fun res!391252 () Bool)

(declare-fun e!348467 () Bool)

(assert (=> b!608487 (=> (not res!391252) (not e!348467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608487 (= res!391252 (validKeyInArray!0 k0!1786))))

(declare-fun b!608488 () Bool)

(declare-fun e!348463 () Bool)

(declare-fun e!348461 () Bool)

(assert (=> b!608488 (= e!348463 e!348461)))

(declare-fun res!391271 () Bool)

(assert (=> b!608488 (=> res!391271 e!348461)))

(declare-fun lt!277932 () (_ BitVec 64))

(assert (=> b!608488 (= res!391271 (or (not (= (select (arr!17906 a!2986) j!136) lt!277928)) (not (= (select (arr!17906 a!2986) j!136) lt!277932)) (bvsge j!136 index!984)))))

(declare-fun b!608489 () Bool)

(declare-fun res!391261 () Bool)

(assert (=> b!608489 (=> res!391261 e!348457)))

(declare-fun noDuplicate!335 (List!11986) Bool)

(assert (=> b!608489 (= res!391261 (not (noDuplicate!335 Nil!11983)))))

(declare-fun b!608490 () Bool)

(declare-fun e!348466 () Bool)

(assert (=> b!608490 (= e!348466 (arrayContainsKey!0 lt!277930 (select (arr!17906 a!2986) j!136) index!984))))

(declare-fun b!608491 () Bool)

(declare-fun res!391257 () Bool)

(assert (=> b!608491 (=> res!391257 e!348457)))

(assert (=> b!608491 (= res!391257 (contains!3008 Nil!11983 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!391259 () Bool)

(assert (=> start!55566 (=> (not res!391259) (not e!348467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55566 (= res!391259 (validMask!0 mask!3053))))

(assert (=> start!55566 e!348467))

(assert (=> start!55566 true))

(declare-fun array_inv!13789 (array!37311) Bool)

(assert (=> start!55566 (array_inv!13789 a!2986)))

(declare-fun b!608492 () Bool)

(assert (=> b!608492 (= e!348461 e!348466)))

(declare-fun res!391270 () Bool)

(assert (=> b!608492 (=> (not res!391270) (not e!348466))))

(assert (=> b!608492 (= res!391270 (arrayContainsKey!0 lt!277930 (select (arr!17906 a!2986) j!136) j!136))))

(declare-fun b!608493 () Bool)

(declare-fun res!391253 () Bool)

(assert (=> b!608493 (=> (not res!391253) (not e!348467))))

(assert (=> b!608493 (= res!391253 (and (= (size!18271 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18271 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18271 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608494 () Bool)

(declare-fun e!348464 () Bool)

(assert (=> b!608494 (= e!348460 e!348464)))

(declare-fun res!391269 () Bool)

(assert (=> b!608494 (=> res!391269 e!348464)))

(assert (=> b!608494 (= res!391269 (or (not (= (select (arr!17906 a!2986) j!136) lt!277928)) (not (= (select (arr!17906 a!2986) j!136) lt!277932))))))

(assert (=> b!608494 e!348463))

(declare-fun res!391249 () Bool)

(assert (=> b!608494 (=> (not res!391249) (not e!348463))))

(assert (=> b!608494 (= res!391249 (= lt!277932 (select (arr!17906 a!2986) j!136)))))

(assert (=> b!608494 (= lt!277932 (select (store (arr!17906 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!608495 () Bool)

(declare-fun res!391251 () Bool)

(declare-fun e!348458 () Bool)

(assert (=> b!608495 (=> (not res!391251) (not e!348458))))

(assert (=> b!608495 (= res!391251 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17906 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608496 () Bool)

(assert (=> b!608496 (= e!348467 e!348458)))

(declare-fun res!391267 () Bool)

(assert (=> b!608496 (=> (not res!391267) (not e!348458))))

(declare-fun lt!277920 () SeekEntryResult!6343)

(assert (=> b!608496 (= res!391267 (or (= lt!277920 (MissingZero!6343 i!1108)) (= lt!277920 (MissingVacant!6343 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37311 (_ BitVec 32)) SeekEntryResult!6343)

(assert (=> b!608496 (= lt!277920 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!608497 () Bool)

(declare-fun res!391264 () Bool)

(assert (=> b!608497 (=> (not res!391264) (not e!348467))))

(assert (=> b!608497 (= res!391264 (validKeyInArray!0 (select (arr!17906 a!2986) j!136)))))

(declare-fun b!608498 () Bool)

(declare-fun res!391265 () Bool)

(assert (=> b!608498 (=> (not res!391265) (not e!348458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37311 (_ BitVec 32)) Bool)

(assert (=> b!608498 (= res!391265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608499 () Bool)

(declare-fun res!391250 () Bool)

(assert (=> b!608499 (=> (not res!391250) (not e!348458))))

(declare-fun arrayNoDuplicates!0 (array!37311 (_ BitVec 32) List!11986) Bool)

(assert (=> b!608499 (= res!391250 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11983))))

(declare-fun b!608500 () Bool)

(declare-fun res!391256 () Bool)

(assert (=> b!608500 (=> (not res!391256) (not e!348467))))

(assert (=> b!608500 (= res!391256 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608501 () Bool)

(declare-fun e!348465 () Unit!19440)

(declare-fun Unit!19442 () Unit!19440)

(assert (=> b!608501 (= e!348465 Unit!19442)))

(declare-fun lt!277925 () Unit!19440)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37311 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19440)

(assert (=> b!608501 (= lt!277925 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277930 (select (arr!17906 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608501 (arrayContainsKey!0 lt!277930 (select (arr!17906 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277933 () Unit!19440)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37311 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11986) Unit!19440)

(assert (=> b!608501 (= lt!277933 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11983))))

(assert (=> b!608501 (arrayNoDuplicates!0 lt!277930 #b00000000000000000000000000000000 Nil!11983)))

(declare-fun lt!277918 () Unit!19440)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37311 (_ BitVec 32) (_ BitVec 32)) Unit!19440)

(assert (=> b!608501 (= lt!277918 (lemmaNoDuplicateFromThenFromBigger!0 lt!277930 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608501 (arrayNoDuplicates!0 lt!277930 j!136 Nil!11983)))

(declare-fun lt!277931 () Unit!19440)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37311 (_ BitVec 64) (_ BitVec 32) List!11986) Unit!19440)

(assert (=> b!608501 (= lt!277931 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277930 (select (arr!17906 a!2986) j!136) j!136 Nil!11983))))

(assert (=> b!608501 false))

(declare-fun b!608502 () Bool)

(declare-fun e!348470 () Bool)

(assert (=> b!608502 (= e!348470 e!348459)))

(declare-fun res!391263 () Bool)

(assert (=> b!608502 (=> (not res!391263) (not e!348459))))

(assert (=> b!608502 (= res!391263 (and (= lt!277921 (Found!6343 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17906 a!2986) index!984) (select (arr!17906 a!2986) j!136))) (not (= (select (arr!17906 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!608502 (= lt!277921 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17906 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608503 () Bool)

(declare-fun e!348468 () Bool)

(assert (=> b!608503 (= e!348464 e!348468)))

(declare-fun res!391266 () Bool)

(assert (=> b!608503 (=> res!391266 e!348468)))

(assert (=> b!608503 (= res!391266 (bvsge index!984 j!136))))

(declare-fun lt!277926 () Unit!19440)

(assert (=> b!608503 (= lt!277926 e!348465)))

(declare-fun c!68984 () Bool)

(assert (=> b!608503 (= c!68984 (bvslt j!136 index!984))))

(declare-fun b!608504 () Bool)

(assert (=> b!608504 (= e!348468 e!348457)))

(declare-fun res!391268 () Bool)

(assert (=> b!608504 (=> res!391268 e!348457)))

(assert (=> b!608504 (= res!391268 (or (bvsge (size!18271 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18271 a!2986))))))

(assert (=> b!608504 (arrayContainsKey!0 lt!277930 (select (arr!17906 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277924 () Unit!19440)

(assert (=> b!608504 (= lt!277924 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277930 (select (arr!17906 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!608504 e!348469))

(declare-fun res!391258 () Bool)

(assert (=> b!608504 (=> (not res!391258) (not e!348469))))

(assert (=> b!608504 (= res!391258 (arrayContainsKey!0 lt!277930 (select (arr!17906 a!2986) j!136) j!136))))

(declare-fun b!608505 () Bool)

(declare-fun Unit!19443 () Unit!19440)

(assert (=> b!608505 (= e!348456 Unit!19443)))

(declare-fun b!608506 () Bool)

(declare-fun res!391255 () Bool)

(assert (=> b!608506 (=> res!391255 e!348457)))

(assert (=> b!608506 (= res!391255 (contains!3008 Nil!11983 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608507 () Bool)

(assert (=> b!608507 (= e!348458 e!348470)))

(declare-fun res!391262 () Bool)

(assert (=> b!608507 (=> (not res!391262) (not e!348470))))

(assert (=> b!608507 (= res!391262 (= (select (store (arr!17906 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608507 (= lt!277930 (array!37312 (store (arr!17906 a!2986) i!1108 k0!1786) (size!18271 a!2986)))))

(declare-fun b!608508 () Bool)

(declare-fun Unit!19444 () Unit!19440)

(assert (=> b!608508 (= e!348465 Unit!19444)))

(declare-fun b!608509 () Bool)

(declare-fun Unit!19445 () Unit!19440)

(assert (=> b!608509 (= e!348456 Unit!19445)))

(assert (=> b!608509 false))

(assert (= (and start!55566 res!391259) b!608493))

(assert (= (and b!608493 res!391253) b!608497))

(assert (= (and b!608497 res!391264) b!608487))

(assert (= (and b!608487 res!391252) b!608500))

(assert (= (and b!608500 res!391256) b!608496))

(assert (= (and b!608496 res!391267) b!608498))

(assert (= (and b!608498 res!391265) b!608499))

(assert (= (and b!608499 res!391250) b!608495))

(assert (= (and b!608495 res!391251) b!608507))

(assert (= (and b!608507 res!391262) b!608502))

(assert (= (and b!608502 res!391263) b!608485))

(assert (= (and b!608485 res!391260) b!608486))

(assert (= (and b!608485 c!68985) b!608509))

(assert (= (and b!608485 (not c!68985)) b!608505))

(assert (= (and b!608485 (not res!391254)) b!608494))

(assert (= (and b!608494 res!391249) b!608488))

(assert (= (and b!608488 (not res!391271)) b!608492))

(assert (= (and b!608492 res!391270) b!608490))

(assert (= (and b!608494 (not res!391269)) b!608503))

(assert (= (and b!608503 c!68984) b!608501))

(assert (= (and b!608503 (not c!68984)) b!608508))

(assert (= (and b!608503 (not res!391266)) b!608504))

(assert (= (and b!608504 res!391258) b!608484))

(assert (= (and b!608504 (not res!391268)) b!608489))

(assert (= (and b!608489 (not res!391261)) b!608491))

(assert (= (and b!608491 (not res!391257)) b!608506))

(assert (= (and b!608506 (not res!391255)) b!608483))

(declare-fun m!584575 () Bool)

(assert (=> b!608483 m!584575))

(declare-fun m!584577 () Bool)

(assert (=> b!608496 m!584577))

(declare-fun m!584579 () Bool)

(assert (=> b!608485 m!584579))

(declare-fun m!584581 () Bool)

(assert (=> b!608485 m!584581))

(declare-fun m!584583 () Bool)

(assert (=> b!608485 m!584583))

(declare-fun m!584585 () Bool)

(assert (=> b!608485 m!584585))

(declare-fun m!584587 () Bool)

(assert (=> b!608485 m!584587))

(assert (=> b!608485 m!584583))

(declare-fun m!584589 () Bool)

(assert (=> b!608485 m!584589))

(declare-fun m!584591 () Bool)

(assert (=> b!608485 m!584591))

(declare-fun m!584593 () Bool)

(assert (=> b!608485 m!584593))

(declare-fun m!584595 () Bool)

(assert (=> b!608499 m!584595))

(declare-fun m!584597 () Bool)

(assert (=> b!608500 m!584597))

(assert (=> b!608494 m!584583))

(assert (=> b!608494 m!584585))

(declare-fun m!584599 () Bool)

(assert (=> b!608494 m!584599))

(assert (=> b!608484 m!584583))

(assert (=> b!608484 m!584583))

(declare-fun m!584601 () Bool)

(assert (=> b!608484 m!584601))

(assert (=> b!608507 m!584585))

(declare-fun m!584603 () Bool)

(assert (=> b!608507 m!584603))

(assert (=> b!608492 m!584583))

(assert (=> b!608492 m!584583))

(declare-fun m!584605 () Bool)

(assert (=> b!608492 m!584605))

(declare-fun m!584607 () Bool)

(assert (=> b!608487 m!584607))

(declare-fun m!584609 () Bool)

(assert (=> b!608498 m!584609))

(declare-fun m!584611 () Bool)

(assert (=> b!608491 m!584611))

(assert (=> b!608490 m!584583))

(assert (=> b!608490 m!584583))

(assert (=> b!608490 m!584601))

(declare-fun m!584613 () Bool)

(assert (=> start!55566 m!584613))

(declare-fun m!584615 () Bool)

(assert (=> start!55566 m!584615))

(assert (=> b!608497 m!584583))

(assert (=> b!608497 m!584583))

(declare-fun m!584617 () Bool)

(assert (=> b!608497 m!584617))

(declare-fun m!584619 () Bool)

(assert (=> b!608501 m!584619))

(declare-fun m!584621 () Bool)

(assert (=> b!608501 m!584621))

(assert (=> b!608501 m!584583))

(declare-fun m!584623 () Bool)

(assert (=> b!608501 m!584623))

(declare-fun m!584625 () Bool)

(assert (=> b!608501 m!584625))

(assert (=> b!608501 m!584583))

(declare-fun m!584627 () Bool)

(assert (=> b!608501 m!584627))

(declare-fun m!584629 () Bool)

(assert (=> b!608501 m!584629))

(assert (=> b!608501 m!584583))

(assert (=> b!608501 m!584583))

(declare-fun m!584631 () Bool)

(assert (=> b!608501 m!584631))

(assert (=> b!608488 m!584583))

(declare-fun m!584633 () Bool)

(assert (=> b!608495 m!584633))

(assert (=> b!608504 m!584583))

(assert (=> b!608504 m!584583))

(declare-fun m!584635 () Bool)

(assert (=> b!608504 m!584635))

(assert (=> b!608504 m!584583))

(declare-fun m!584637 () Bool)

(assert (=> b!608504 m!584637))

(assert (=> b!608504 m!584583))

(assert (=> b!608504 m!584605))

(declare-fun m!584639 () Bool)

(assert (=> b!608489 m!584639))

(declare-fun m!584641 () Bool)

(assert (=> b!608502 m!584641))

(assert (=> b!608502 m!584583))

(assert (=> b!608502 m!584583))

(declare-fun m!584643 () Bool)

(assert (=> b!608502 m!584643))

(declare-fun m!584645 () Bool)

(assert (=> b!608506 m!584645))

(check-sat (not b!608483) (not b!608490) (not b!608497) (not b!608485) (not b!608496) (not b!608487) (not b!608501) (not b!608491) (not b!608506) (not start!55566) (not b!608500) (not b!608489) (not b!608504) (not b!608498) (not b!608484) (not b!608499) (not b!608492) (not b!608502))
(check-sat)
