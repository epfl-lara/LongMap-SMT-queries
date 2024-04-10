; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55440 () Bool)

(assert start!55440)

(declare-fun b!606520 () Bool)

(declare-fun res!389649 () Bool)

(declare-fun e!347257 () Bool)

(assert (=> b!606520 (=> (not res!389649) (not e!347257))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37264 0))(
  ( (array!37265 (arr!17884 (Array (_ BitVec 32) (_ BitVec 64))) (size!18248 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37264)

(assert (=> b!606520 (= res!389649 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17884 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!389634 () Bool)

(declare-fun e!347259 () Bool)

(assert (=> start!55440 (=> (not res!389634) (not e!347259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55440 (= res!389634 (validMask!0 mask!3053))))

(assert (=> start!55440 e!347259))

(assert (=> start!55440 true))

(declare-fun array_inv!13680 (array!37264) Bool)

(assert (=> start!55440 (array_inv!13680 a!2986)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!347254 () Bool)

(declare-fun lt!276824 () array!37264)

(declare-fun b!606521 () Bool)

(declare-fun arrayContainsKey!0 (array!37264 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!606521 (= e!347254 (arrayContainsKey!0 lt!276824 (select (arr!17884 a!2986) j!136) index!984))))

(declare-fun b!606522 () Bool)

(declare-fun e!347255 () Bool)

(assert (=> b!606522 (= e!347255 e!347254)))

(declare-fun res!389651 () Bool)

(assert (=> b!606522 (=> (not res!389651) (not e!347254))))

(assert (=> b!606522 (= res!389651 (arrayContainsKey!0 lt!276824 (select (arr!17884 a!2986) j!136) j!136))))

(declare-fun b!606523 () Bool)

(declare-fun e!347261 () Bool)

(declare-fun e!347263 () Bool)

(assert (=> b!606523 (= e!347261 (not e!347263))))

(declare-fun res!389645 () Bool)

(assert (=> b!606523 (=> res!389645 e!347263)))

(declare-datatypes ((SeekEntryResult!6324 0))(
  ( (MissingZero!6324 (index!27568 (_ BitVec 32))) (Found!6324 (index!27569 (_ BitVec 32))) (Intermediate!6324 (undefined!7136 Bool) (index!27570 (_ BitVec 32)) (x!56376 (_ BitVec 32))) (Undefined!6324) (MissingVacant!6324 (index!27571 (_ BitVec 32))) )
))
(declare-fun lt!276836 () SeekEntryResult!6324)

(assert (=> b!606523 (= res!389645 (not (= lt!276836 (Found!6324 index!984))))))

(declare-datatypes ((Unit!19324 0))(
  ( (Unit!19325) )
))
(declare-fun lt!276825 () Unit!19324)

(declare-fun e!347256 () Unit!19324)

(assert (=> b!606523 (= lt!276825 e!347256)))

(declare-fun c!68813 () Bool)

(assert (=> b!606523 (= c!68813 (= lt!276836 Undefined!6324))))

(declare-fun lt!276826 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37264 (_ BitVec 32)) SeekEntryResult!6324)

(assert (=> b!606523 (= lt!276836 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276826 lt!276824 mask!3053))))

(declare-fun e!347258 () Bool)

(assert (=> b!606523 e!347258))

(declare-fun res!389640 () Bool)

(assert (=> b!606523 (=> (not res!389640) (not e!347258))))

(declare-fun lt!276838 () (_ BitVec 32))

(declare-fun lt!276833 () SeekEntryResult!6324)

(assert (=> b!606523 (= res!389640 (= lt!276833 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276838 vacantSpotIndex!68 lt!276826 lt!276824 mask!3053)))))

(assert (=> b!606523 (= lt!276833 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276838 vacantSpotIndex!68 (select (arr!17884 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!606523 (= lt!276826 (select (store (arr!17884 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!276829 () Unit!19324)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37264 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19324)

(assert (=> b!606523 (= lt!276829 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276838 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!606523 (= lt!276838 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!606524 () Bool)

(declare-fun e!347268 () Bool)

(assert (=> b!606524 (= e!347268 (arrayContainsKey!0 lt!276824 (select (arr!17884 a!2986) j!136) index!984))))

(declare-fun b!606525 () Bool)

(declare-fun e!347267 () Bool)

(declare-fun e!347265 () Bool)

(assert (=> b!606525 (= e!347267 e!347265)))

(declare-fun res!389636 () Bool)

(assert (=> b!606525 (=> res!389636 e!347265)))

(assert (=> b!606525 (= res!389636 (or (bvsgt #b00000000000000000000000000000000 (size!18248 a!2986)) (bvsge (size!18248 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!606525 (arrayContainsKey!0 lt!276824 (select (arr!17884 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276830 () Unit!19324)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37264 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19324)

(assert (=> b!606525 (= lt!276830 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276824 (select (arr!17884 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!606525 e!347268))

(declare-fun res!389641 () Bool)

(assert (=> b!606525 (=> (not res!389641) (not e!347268))))

(assert (=> b!606525 (= res!389641 (arrayContainsKey!0 lt!276824 (select (arr!17884 a!2986) j!136) j!136))))

(declare-fun b!606526 () Bool)

(declare-fun res!389632 () Bool)

(assert (=> b!606526 (=> (not res!389632) (not e!347257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37264 (_ BitVec 32)) Bool)

(assert (=> b!606526 (= res!389632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!606527 () Bool)

(declare-fun Unit!19326 () Unit!19324)

(assert (=> b!606527 (= e!347256 Unit!19326)))

(assert (=> b!606527 false))

(declare-fun b!606528 () Bool)

(declare-fun e!347260 () Bool)

(assert (=> b!606528 (= e!347257 e!347260)))

(declare-fun res!389637 () Bool)

(assert (=> b!606528 (=> (not res!389637) (not e!347260))))

(assert (=> b!606528 (= res!389637 (= (select (store (arr!17884 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606528 (= lt!276824 (array!37265 (store (arr!17884 a!2986) i!1108 k0!1786) (size!18248 a!2986)))))

(declare-fun b!606529 () Bool)

(declare-fun e!347266 () Bool)

(assert (=> b!606529 (= e!347266 e!347255)))

(declare-fun res!389643 () Bool)

(assert (=> b!606529 (=> res!389643 e!347255)))

(declare-fun lt!276834 () (_ BitVec 64))

(assert (=> b!606529 (= res!389643 (or (not (= (select (arr!17884 a!2986) j!136) lt!276826)) (not (= (select (arr!17884 a!2986) j!136) lt!276834)) (bvsge j!136 index!984)))))

(declare-fun b!606530 () Bool)

(declare-fun e!347253 () Unit!19324)

(declare-fun Unit!19327 () Unit!19324)

(assert (=> b!606530 (= e!347253 Unit!19327)))

(declare-fun lt!276832 () Unit!19324)

(assert (=> b!606530 (= lt!276832 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276824 (select (arr!17884 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!606530 (arrayContainsKey!0 lt!276824 (select (arr!17884 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276831 () Unit!19324)

(declare-datatypes ((List!11925 0))(
  ( (Nil!11922) (Cons!11921 (h!12966 (_ BitVec 64)) (t!18153 List!11925)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37264 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11925) Unit!19324)

(assert (=> b!606530 (= lt!276831 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11922))))

(declare-fun arrayNoDuplicates!0 (array!37264 (_ BitVec 32) List!11925) Bool)

(assert (=> b!606530 (arrayNoDuplicates!0 lt!276824 #b00000000000000000000000000000000 Nil!11922)))

(declare-fun lt!276837 () Unit!19324)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37264 (_ BitVec 32) (_ BitVec 32)) Unit!19324)

(assert (=> b!606530 (= lt!276837 (lemmaNoDuplicateFromThenFromBigger!0 lt!276824 #b00000000000000000000000000000000 j!136))))

(assert (=> b!606530 (arrayNoDuplicates!0 lt!276824 j!136 Nil!11922)))

(declare-fun lt!276835 () Unit!19324)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37264 (_ BitVec 64) (_ BitVec 32) List!11925) Unit!19324)

(assert (=> b!606530 (= lt!276835 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276824 (select (arr!17884 a!2986) j!136) j!136 Nil!11922))))

(assert (=> b!606530 false))

(declare-fun b!606531 () Bool)

(declare-fun e!347252 () Bool)

(assert (=> b!606531 (= e!347265 e!347252)))

(declare-fun res!389647 () Bool)

(assert (=> b!606531 (=> (not res!389647) (not e!347252))))

(declare-fun contains!3001 (List!11925 (_ BitVec 64)) Bool)

(assert (=> b!606531 (= res!389647 (not (contains!3001 Nil!11922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!606532 () Bool)

(declare-fun res!389633 () Bool)

(assert (=> b!606532 (=> res!389633 e!347265)))

(declare-fun noDuplicate!307 (List!11925) Bool)

(assert (=> b!606532 (= res!389633 (not (noDuplicate!307 Nil!11922)))))

(declare-fun b!606533 () Bool)

(declare-fun res!389644 () Bool)

(assert (=> b!606533 (=> (not res!389644) (not e!347259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!606533 (= res!389644 (validKeyInArray!0 k0!1786))))

(declare-fun b!606534 () Bool)

(assert (=> b!606534 (= e!347252 (not (contains!3001 Nil!11922 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!606535 () Bool)

(assert (=> b!606535 (= e!347259 e!347257)))

(declare-fun res!389631 () Bool)

(assert (=> b!606535 (=> (not res!389631) (not e!347257))))

(declare-fun lt!276823 () SeekEntryResult!6324)

(assert (=> b!606535 (= res!389631 (or (= lt!276823 (MissingZero!6324 i!1108)) (= lt!276823 (MissingVacant!6324 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37264 (_ BitVec 32)) SeekEntryResult!6324)

(assert (=> b!606535 (= lt!276823 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!606536 () Bool)

(declare-fun Unit!19328 () Unit!19324)

(assert (=> b!606536 (= e!347253 Unit!19328)))

(declare-fun b!606537 () Bool)

(declare-fun e!347264 () Bool)

(assert (=> b!606537 (= e!347264 e!347267)))

(declare-fun res!389642 () Bool)

(assert (=> b!606537 (=> res!389642 e!347267)))

(assert (=> b!606537 (= res!389642 (bvsge index!984 j!136))))

(declare-fun lt!276827 () Unit!19324)

(assert (=> b!606537 (= lt!276827 e!347253)))

(declare-fun c!68812 () Bool)

(assert (=> b!606537 (= c!68812 (bvslt j!136 index!984))))

(declare-fun b!606538 () Bool)

(declare-fun lt!276828 () SeekEntryResult!6324)

(assert (=> b!606538 (= e!347258 (= lt!276828 lt!276833))))

(declare-fun b!606539 () Bool)

(declare-fun Unit!19329 () Unit!19324)

(assert (=> b!606539 (= e!347256 Unit!19329)))

(declare-fun b!606540 () Bool)

(declare-fun res!389639 () Bool)

(assert (=> b!606540 (=> (not res!389639) (not e!347259))))

(assert (=> b!606540 (= res!389639 (validKeyInArray!0 (select (arr!17884 a!2986) j!136)))))

(declare-fun b!606541 () Bool)

(declare-fun res!389635 () Bool)

(assert (=> b!606541 (=> (not res!389635) (not e!347259))))

(assert (=> b!606541 (= res!389635 (and (= (size!18248 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18248 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18248 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!606542 () Bool)

(declare-fun res!389630 () Bool)

(assert (=> b!606542 (=> (not res!389630) (not e!347259))))

(assert (=> b!606542 (= res!389630 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!606543 () Bool)

(assert (=> b!606543 (= e!347260 e!347261)))

(declare-fun res!389646 () Bool)

(assert (=> b!606543 (=> (not res!389646) (not e!347261))))

(assert (=> b!606543 (= res!389646 (and (= lt!276828 (Found!6324 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17884 a!2986) index!984) (select (arr!17884 a!2986) j!136))) (not (= (select (arr!17884 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!606543 (= lt!276828 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17884 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!606544 () Bool)

(declare-fun res!389648 () Bool)

(assert (=> b!606544 (=> (not res!389648) (not e!347257))))

(assert (=> b!606544 (= res!389648 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11922))))

(declare-fun b!606545 () Bool)

(assert (=> b!606545 (= e!347263 e!347264)))

(declare-fun res!389650 () Bool)

(assert (=> b!606545 (=> res!389650 e!347264)))

(assert (=> b!606545 (= res!389650 (or (not (= (select (arr!17884 a!2986) j!136) lt!276826)) (not (= (select (arr!17884 a!2986) j!136) lt!276834))))))

(assert (=> b!606545 e!347266))

(declare-fun res!389638 () Bool)

(assert (=> b!606545 (=> (not res!389638) (not e!347266))))

(assert (=> b!606545 (= res!389638 (= lt!276834 (select (arr!17884 a!2986) j!136)))))

(assert (=> b!606545 (= lt!276834 (select (store (arr!17884 a!2986) i!1108 k0!1786) index!984))))

(assert (= (and start!55440 res!389634) b!606541))

(assert (= (and b!606541 res!389635) b!606540))

(assert (= (and b!606540 res!389639) b!606533))

(assert (= (and b!606533 res!389644) b!606542))

(assert (= (and b!606542 res!389630) b!606535))

(assert (= (and b!606535 res!389631) b!606526))

(assert (= (and b!606526 res!389632) b!606544))

(assert (= (and b!606544 res!389648) b!606520))

(assert (= (and b!606520 res!389649) b!606528))

(assert (= (and b!606528 res!389637) b!606543))

(assert (= (and b!606543 res!389646) b!606523))

(assert (= (and b!606523 res!389640) b!606538))

(assert (= (and b!606523 c!68813) b!606527))

(assert (= (and b!606523 (not c!68813)) b!606539))

(assert (= (and b!606523 (not res!389645)) b!606545))

(assert (= (and b!606545 res!389638) b!606529))

(assert (= (and b!606529 (not res!389643)) b!606522))

(assert (= (and b!606522 res!389651) b!606521))

(assert (= (and b!606545 (not res!389650)) b!606537))

(assert (= (and b!606537 c!68812) b!606530))

(assert (= (and b!606537 (not c!68812)) b!606536))

(assert (= (and b!606537 (not res!389642)) b!606525))

(assert (= (and b!606525 res!389641) b!606524))

(assert (= (and b!606525 (not res!389636)) b!606532))

(assert (= (and b!606532 (not res!389633)) b!606531))

(assert (= (and b!606531 res!389647) b!606534))

(declare-fun m!583323 () Bool)

(assert (=> b!606524 m!583323))

(assert (=> b!606524 m!583323))

(declare-fun m!583325 () Bool)

(assert (=> b!606524 m!583325))

(declare-fun m!583327 () Bool)

(assert (=> start!55440 m!583327))

(declare-fun m!583329 () Bool)

(assert (=> start!55440 m!583329))

(assert (=> b!606529 m!583323))

(assert (=> b!606540 m!583323))

(assert (=> b!606540 m!583323))

(declare-fun m!583331 () Bool)

(assert (=> b!606540 m!583331))

(assert (=> b!606521 m!583323))

(assert (=> b!606521 m!583323))

(assert (=> b!606521 m!583325))

(declare-fun m!583333 () Bool)

(assert (=> b!606542 m!583333))

(assert (=> b!606545 m!583323))

(declare-fun m!583335 () Bool)

(assert (=> b!606545 m!583335))

(declare-fun m!583337 () Bool)

(assert (=> b!606545 m!583337))

(assert (=> b!606525 m!583323))

(assert (=> b!606525 m!583323))

(declare-fun m!583339 () Bool)

(assert (=> b!606525 m!583339))

(assert (=> b!606525 m!583323))

(declare-fun m!583341 () Bool)

(assert (=> b!606525 m!583341))

(assert (=> b!606525 m!583323))

(declare-fun m!583343 () Bool)

(assert (=> b!606525 m!583343))

(assert (=> b!606530 m!583323))

(declare-fun m!583345 () Bool)

(assert (=> b!606530 m!583345))

(assert (=> b!606530 m!583323))

(declare-fun m!583347 () Bool)

(assert (=> b!606530 m!583347))

(declare-fun m!583349 () Bool)

(assert (=> b!606530 m!583349))

(assert (=> b!606530 m!583323))

(declare-fun m!583351 () Bool)

(assert (=> b!606530 m!583351))

(declare-fun m!583353 () Bool)

(assert (=> b!606530 m!583353))

(declare-fun m!583355 () Bool)

(assert (=> b!606530 m!583355))

(assert (=> b!606530 m!583323))

(declare-fun m!583357 () Bool)

(assert (=> b!606530 m!583357))

(declare-fun m!583359 () Bool)

(assert (=> b!606526 m!583359))

(declare-fun m!583361 () Bool)

(assert (=> b!606535 m!583361))

(assert (=> b!606528 m!583335))

(declare-fun m!583363 () Bool)

(assert (=> b!606528 m!583363))

(declare-fun m!583365 () Bool)

(assert (=> b!606543 m!583365))

(assert (=> b!606543 m!583323))

(assert (=> b!606543 m!583323))

(declare-fun m!583367 () Bool)

(assert (=> b!606543 m!583367))

(declare-fun m!583369 () Bool)

(assert (=> b!606533 m!583369))

(declare-fun m!583371 () Bool)

(assert (=> b!606531 m!583371))

(declare-fun m!583373 () Bool)

(assert (=> b!606523 m!583373))

(declare-fun m!583375 () Bool)

(assert (=> b!606523 m!583375))

(assert (=> b!606523 m!583323))

(assert (=> b!606523 m!583335))

(assert (=> b!606523 m!583323))

(declare-fun m!583377 () Bool)

(assert (=> b!606523 m!583377))

(declare-fun m!583379 () Bool)

(assert (=> b!606523 m!583379))

(declare-fun m!583381 () Bool)

(assert (=> b!606523 m!583381))

(declare-fun m!583383 () Bool)

(assert (=> b!606523 m!583383))

(declare-fun m!583385 () Bool)

(assert (=> b!606544 m!583385))

(declare-fun m!583387 () Bool)

(assert (=> b!606532 m!583387))

(assert (=> b!606522 m!583323))

(assert (=> b!606522 m!583323))

(assert (=> b!606522 m!583343))

(declare-fun m!583389 () Bool)

(assert (=> b!606534 m!583389))

(declare-fun m!583391 () Bool)

(assert (=> b!606520 m!583391))

(check-sat (not b!606540) (not b!606535) (not b!606542) (not b!606526) (not b!606530) (not b!606521) (not b!606523) (not b!606522) (not b!606532) (not b!606525) (not b!606533) (not b!606531) (not start!55440) (not b!606524) (not b!606543) (not b!606534) (not b!606544))
(check-sat)
(get-model)

(declare-fun d!87901 () Bool)

(assert (=> d!87901 (= (validKeyInArray!0 (select (arr!17884 a!2986) j!136)) (and (not (= (select (arr!17884 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17884 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!606540 d!87901))

(declare-fun bm!33086 () Bool)

(declare-fun call!33089 () Bool)

(declare-fun c!68822 () Bool)

(assert (=> bm!33086 (= call!33089 (arrayNoDuplicates!0 lt!276824 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68822 (Cons!11921 (select (arr!17884 lt!276824) #b00000000000000000000000000000000) Nil!11922) Nil!11922)))))

(declare-fun b!606634 () Bool)

(declare-fun e!347329 () Bool)

(declare-fun e!347330 () Bool)

(assert (=> b!606634 (= e!347329 e!347330)))

(assert (=> b!606634 (= c!68822 (validKeyInArray!0 (select (arr!17884 lt!276824) #b00000000000000000000000000000000)))))

(declare-fun b!606635 () Bool)

(declare-fun e!347328 () Bool)

(assert (=> b!606635 (= e!347328 (contains!3001 Nil!11922 (select (arr!17884 lt!276824) #b00000000000000000000000000000000)))))

(declare-fun b!606636 () Bool)

(assert (=> b!606636 (= e!347330 call!33089)))

(declare-fun d!87903 () Bool)

(declare-fun res!389725 () Bool)

(declare-fun e!347331 () Bool)

(assert (=> d!87903 (=> res!389725 e!347331)))

(assert (=> d!87903 (= res!389725 (bvsge #b00000000000000000000000000000000 (size!18248 lt!276824)))))

(assert (=> d!87903 (= (arrayNoDuplicates!0 lt!276824 #b00000000000000000000000000000000 Nil!11922) e!347331)))

(declare-fun b!606637 () Bool)

(assert (=> b!606637 (= e!347330 call!33089)))

(declare-fun b!606638 () Bool)

(assert (=> b!606638 (= e!347331 e!347329)))

(declare-fun res!389724 () Bool)

(assert (=> b!606638 (=> (not res!389724) (not e!347329))))

(assert (=> b!606638 (= res!389724 (not e!347328))))

(declare-fun res!389726 () Bool)

(assert (=> b!606638 (=> (not res!389726) (not e!347328))))

(assert (=> b!606638 (= res!389726 (validKeyInArray!0 (select (arr!17884 lt!276824) #b00000000000000000000000000000000)))))

(assert (= (and d!87903 (not res!389725)) b!606638))

(assert (= (and b!606638 res!389726) b!606635))

(assert (= (and b!606638 res!389724) b!606634))

(assert (= (and b!606634 c!68822) b!606637))

(assert (= (and b!606634 (not c!68822)) b!606636))

(assert (= (or b!606637 b!606636) bm!33086))

(declare-fun m!583463 () Bool)

(assert (=> bm!33086 m!583463))

(declare-fun m!583465 () Bool)

(assert (=> bm!33086 m!583465))

(assert (=> b!606634 m!583463))

(assert (=> b!606634 m!583463))

(declare-fun m!583467 () Bool)

(assert (=> b!606634 m!583467))

(assert (=> b!606635 m!583463))

(assert (=> b!606635 m!583463))

(declare-fun m!583469 () Bool)

(assert (=> b!606635 m!583469))

(assert (=> b!606638 m!583463))

(assert (=> b!606638 m!583463))

(assert (=> b!606638 m!583467))

(assert (=> b!606530 d!87903))

(declare-fun d!87905 () Bool)

(assert (=> d!87905 (arrayContainsKey!0 lt!276824 (select (arr!17884 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276889 () Unit!19324)

(declare-fun choose!114 (array!37264 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19324)

(assert (=> d!87905 (= lt!276889 (choose!114 lt!276824 (select (arr!17884 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87905 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87905 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276824 (select (arr!17884 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!276889)))

(declare-fun bs!18556 () Bool)

(assert (= bs!18556 d!87905))

(assert (=> bs!18556 m!583323))

(assert (=> bs!18556 m!583351))

(assert (=> bs!18556 m!583323))

(declare-fun m!583471 () Bool)

(assert (=> bs!18556 m!583471))

(assert (=> b!606530 d!87905))

(declare-fun d!87907 () Bool)

(declare-fun res!389731 () Bool)

(declare-fun e!347336 () Bool)

(assert (=> d!87907 (=> res!389731 e!347336)))

(assert (=> d!87907 (= res!389731 (= (select (arr!17884 lt!276824) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17884 a!2986) j!136)))))

(assert (=> d!87907 (= (arrayContainsKey!0 lt!276824 (select (arr!17884 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!347336)))

(declare-fun b!606643 () Bool)

(declare-fun e!347337 () Bool)

(assert (=> b!606643 (= e!347336 e!347337)))

(declare-fun res!389732 () Bool)

(assert (=> b!606643 (=> (not res!389732) (not e!347337))))

(assert (=> b!606643 (= res!389732 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18248 lt!276824)))))

(declare-fun b!606644 () Bool)

(assert (=> b!606644 (= e!347337 (arrayContainsKey!0 lt!276824 (select (arr!17884 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87907 (not res!389731)) b!606643))

(assert (= (and b!606643 res!389732) b!606644))

(declare-fun m!583473 () Bool)

(assert (=> d!87907 m!583473))

(assert (=> b!606644 m!583323))

(declare-fun m!583475 () Bool)

(assert (=> b!606644 m!583475))

(assert (=> b!606530 d!87907))

(declare-fun d!87909 () Bool)

(declare-fun e!347340 () Bool)

(assert (=> d!87909 e!347340))

(declare-fun res!389735 () Bool)

(assert (=> d!87909 (=> (not res!389735) (not e!347340))))

(assert (=> d!87909 (= res!389735 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18248 a!2986))))))

(declare-fun lt!276892 () Unit!19324)

(declare-fun choose!41 (array!37264 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11925) Unit!19324)

(assert (=> d!87909 (= lt!276892 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11922))))

(assert (=> d!87909 (bvslt (size!18248 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87909 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11922) lt!276892)))

(declare-fun b!606647 () Bool)

(assert (=> b!606647 (= e!347340 (arrayNoDuplicates!0 (array!37265 (store (arr!17884 a!2986) i!1108 k0!1786) (size!18248 a!2986)) #b00000000000000000000000000000000 Nil!11922))))

(assert (= (and d!87909 res!389735) b!606647))

(declare-fun m!583477 () Bool)

(assert (=> d!87909 m!583477))

(assert (=> b!606647 m!583335))

(declare-fun m!583479 () Bool)

(assert (=> b!606647 m!583479))

(assert (=> b!606530 d!87909))

(declare-fun d!87911 () Bool)

(assert (=> d!87911 (arrayNoDuplicates!0 lt!276824 j!136 Nil!11922)))

(declare-fun lt!276895 () Unit!19324)

(declare-fun choose!39 (array!37264 (_ BitVec 32) (_ BitVec 32)) Unit!19324)

(assert (=> d!87911 (= lt!276895 (choose!39 lt!276824 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87911 (bvslt (size!18248 lt!276824) #b01111111111111111111111111111111)))

(assert (=> d!87911 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!276824 #b00000000000000000000000000000000 j!136) lt!276895)))

(declare-fun bs!18557 () Bool)

(assert (= bs!18557 d!87911))

(assert (=> bs!18557 m!583355))

(declare-fun m!583481 () Bool)

(assert (=> bs!18557 m!583481))

(assert (=> b!606530 d!87911))

(declare-fun d!87913 () Bool)

(assert (=> d!87913 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18248 lt!276824)) (not (= (select (arr!17884 lt!276824) j!136) (select (arr!17884 a!2986) j!136))))))

(declare-fun lt!276898 () Unit!19324)

(declare-fun choose!21 (array!37264 (_ BitVec 64) (_ BitVec 32) List!11925) Unit!19324)

(assert (=> d!87913 (= lt!276898 (choose!21 lt!276824 (select (arr!17884 a!2986) j!136) j!136 Nil!11922))))

(assert (=> d!87913 (bvslt (size!18248 lt!276824) #b01111111111111111111111111111111)))

(assert (=> d!87913 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276824 (select (arr!17884 a!2986) j!136) j!136 Nil!11922) lt!276898)))

(declare-fun bs!18558 () Bool)

(assert (= bs!18558 d!87913))

(declare-fun m!583483 () Bool)

(assert (=> bs!18558 m!583483))

(assert (=> bs!18558 m!583323))

(declare-fun m!583485 () Bool)

(assert (=> bs!18558 m!583485))

(assert (=> b!606530 d!87913))

(declare-fun bm!33087 () Bool)

(declare-fun c!68823 () Bool)

(declare-fun call!33090 () Bool)

(assert (=> bm!33087 (= call!33090 (arrayNoDuplicates!0 lt!276824 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68823 (Cons!11921 (select (arr!17884 lt!276824) j!136) Nil!11922) Nil!11922)))))

(declare-fun b!606648 () Bool)

(declare-fun e!347342 () Bool)

(declare-fun e!347343 () Bool)

(assert (=> b!606648 (= e!347342 e!347343)))

(assert (=> b!606648 (= c!68823 (validKeyInArray!0 (select (arr!17884 lt!276824) j!136)))))

(declare-fun b!606649 () Bool)

(declare-fun e!347341 () Bool)

(assert (=> b!606649 (= e!347341 (contains!3001 Nil!11922 (select (arr!17884 lt!276824) j!136)))))

(declare-fun b!606650 () Bool)

(assert (=> b!606650 (= e!347343 call!33090)))

(declare-fun d!87915 () Bool)

(declare-fun res!389737 () Bool)

(declare-fun e!347344 () Bool)

(assert (=> d!87915 (=> res!389737 e!347344)))

(assert (=> d!87915 (= res!389737 (bvsge j!136 (size!18248 lt!276824)))))

(assert (=> d!87915 (= (arrayNoDuplicates!0 lt!276824 j!136 Nil!11922) e!347344)))

(declare-fun b!606651 () Bool)

(assert (=> b!606651 (= e!347343 call!33090)))

(declare-fun b!606652 () Bool)

(assert (=> b!606652 (= e!347344 e!347342)))

(declare-fun res!389736 () Bool)

(assert (=> b!606652 (=> (not res!389736) (not e!347342))))

(assert (=> b!606652 (= res!389736 (not e!347341))))

(declare-fun res!389738 () Bool)

(assert (=> b!606652 (=> (not res!389738) (not e!347341))))

(assert (=> b!606652 (= res!389738 (validKeyInArray!0 (select (arr!17884 lt!276824) j!136)))))

(assert (= (and d!87915 (not res!389737)) b!606652))

(assert (= (and b!606652 res!389738) b!606649))

(assert (= (and b!606652 res!389736) b!606648))

(assert (= (and b!606648 c!68823) b!606651))

(assert (= (and b!606648 (not c!68823)) b!606650))

(assert (= (or b!606651 b!606650) bm!33087))

(assert (=> bm!33087 m!583483))

(declare-fun m!583487 () Bool)

(assert (=> bm!33087 m!583487))

(assert (=> b!606648 m!583483))

(assert (=> b!606648 m!583483))

(declare-fun m!583489 () Bool)

(assert (=> b!606648 m!583489))

(assert (=> b!606649 m!583483))

(assert (=> b!606649 m!583483))

(declare-fun m!583491 () Bool)

(assert (=> b!606649 m!583491))

(assert (=> b!606652 m!583483))

(assert (=> b!606652 m!583483))

(assert (=> b!606652 m!583489))

(assert (=> b!606530 d!87915))

(declare-fun d!87917 () Bool)

(declare-fun lt!276901 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!239 (List!11925) (InoxSet (_ BitVec 64)))

(assert (=> d!87917 (= lt!276901 (select (content!239 Nil!11922) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347350 () Bool)

(assert (=> d!87917 (= lt!276901 e!347350)))

(declare-fun res!389744 () Bool)

(assert (=> d!87917 (=> (not res!389744) (not e!347350))))

(get-info :version)

(assert (=> d!87917 (= res!389744 ((_ is Cons!11921) Nil!11922))))

(assert (=> d!87917 (= (contains!3001 Nil!11922 #b0000000000000000000000000000000000000000000000000000000000000000) lt!276901)))

(declare-fun b!606657 () Bool)

(declare-fun e!347349 () Bool)

(assert (=> b!606657 (= e!347350 e!347349)))

(declare-fun res!389743 () Bool)

(assert (=> b!606657 (=> res!389743 e!347349)))

(assert (=> b!606657 (= res!389743 (= (h!12966 Nil!11922) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!606658 () Bool)

(assert (=> b!606658 (= e!347349 (contains!3001 (t!18153 Nil!11922) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!87917 res!389744) b!606657))

(assert (= (and b!606657 (not res!389743)) b!606658))

(declare-fun m!583493 () Bool)

(assert (=> d!87917 m!583493))

(declare-fun m!583495 () Bool)

(assert (=> d!87917 m!583495))

(declare-fun m!583497 () Bool)

(assert (=> b!606658 m!583497))

(assert (=> b!606531 d!87917))

(declare-fun d!87919 () Bool)

(assert (=> d!87919 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55440 d!87919))

(declare-fun d!87923 () Bool)

(assert (=> d!87923 (= (array_inv!13680 a!2986) (bvsge (size!18248 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55440 d!87923))

(declare-fun d!87925 () Bool)

(declare-fun res!389745 () Bool)

(declare-fun e!347351 () Bool)

(assert (=> d!87925 (=> res!389745 e!347351)))

(assert (=> d!87925 (= res!389745 (= (select (arr!17884 lt!276824) index!984) (select (arr!17884 a!2986) j!136)))))

(assert (=> d!87925 (= (arrayContainsKey!0 lt!276824 (select (arr!17884 a!2986) j!136) index!984) e!347351)))

(declare-fun b!606659 () Bool)

(declare-fun e!347352 () Bool)

(assert (=> b!606659 (= e!347351 e!347352)))

(declare-fun res!389746 () Bool)

(assert (=> b!606659 (=> (not res!389746) (not e!347352))))

(assert (=> b!606659 (= res!389746 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18248 lt!276824)))))

(declare-fun b!606660 () Bool)

(assert (=> b!606660 (= e!347352 (arrayContainsKey!0 lt!276824 (select (arr!17884 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87925 (not res!389745)) b!606659))

(assert (= (and b!606659 res!389746) b!606660))

(declare-fun m!583499 () Bool)

(assert (=> d!87925 m!583499))

(assert (=> b!606660 m!583323))

(declare-fun m!583501 () Bool)

(assert (=> b!606660 m!583501))

(assert (=> b!606521 d!87925))

(declare-fun d!87927 () Bool)

(declare-fun res!389747 () Bool)

(declare-fun e!347353 () Bool)

(assert (=> d!87927 (=> res!389747 e!347353)))

(assert (=> d!87927 (= res!389747 (= (select (arr!17884 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87927 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!347353)))

(declare-fun b!606661 () Bool)

(declare-fun e!347354 () Bool)

(assert (=> b!606661 (= e!347353 e!347354)))

(declare-fun res!389748 () Bool)

(assert (=> b!606661 (=> (not res!389748) (not e!347354))))

(assert (=> b!606661 (= res!389748 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18248 a!2986)))))

(declare-fun b!606662 () Bool)

(assert (=> b!606662 (= e!347354 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87927 (not res!389747)) b!606661))

(assert (= (and b!606661 res!389748) b!606662))

(declare-fun m!583503 () Bool)

(assert (=> d!87927 m!583503))

(declare-fun m!583505 () Bool)

(assert (=> b!606662 m!583505))

(assert (=> b!606542 d!87927))

(declare-fun b!606704 () Bool)

(declare-fun e!347387 () SeekEntryResult!6324)

(declare-fun e!347389 () SeekEntryResult!6324)

(assert (=> b!606704 (= e!347387 e!347389)))

(declare-fun c!68833 () Bool)

(declare-fun lt!276912 () (_ BitVec 64))

(assert (=> b!606704 (= c!68833 (= lt!276912 (select (arr!17884 a!2986) j!136)))))

(declare-fun b!606705 () Bool)

(declare-fun c!68835 () Bool)

(assert (=> b!606705 (= c!68835 (= lt!276912 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347388 () SeekEntryResult!6324)

(assert (=> b!606705 (= e!347389 e!347388)))

(declare-fun b!606707 () Bool)

(assert (=> b!606707 (= e!347387 Undefined!6324)))

(declare-fun b!606708 () Bool)

(assert (=> b!606708 (= e!347389 (Found!6324 index!984))))

(declare-fun b!606709 () Bool)

(assert (=> b!606709 (= e!347388 (MissingVacant!6324 vacantSpotIndex!68))))

(declare-fun b!606706 () Bool)

(assert (=> b!606706 (= e!347388 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17884 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!276913 () SeekEntryResult!6324)

(declare-fun d!87931 () Bool)

(assert (=> d!87931 (and (or ((_ is Undefined!6324) lt!276913) (not ((_ is Found!6324) lt!276913)) (and (bvsge (index!27569 lt!276913) #b00000000000000000000000000000000) (bvslt (index!27569 lt!276913) (size!18248 a!2986)))) (or ((_ is Undefined!6324) lt!276913) ((_ is Found!6324) lt!276913) (not ((_ is MissingVacant!6324) lt!276913)) (not (= (index!27571 lt!276913) vacantSpotIndex!68)) (and (bvsge (index!27571 lt!276913) #b00000000000000000000000000000000) (bvslt (index!27571 lt!276913) (size!18248 a!2986)))) (or ((_ is Undefined!6324) lt!276913) (ite ((_ is Found!6324) lt!276913) (= (select (arr!17884 a!2986) (index!27569 lt!276913)) (select (arr!17884 a!2986) j!136)) (and ((_ is MissingVacant!6324) lt!276913) (= (index!27571 lt!276913) vacantSpotIndex!68) (= (select (arr!17884 a!2986) (index!27571 lt!276913)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87931 (= lt!276913 e!347387)))

(declare-fun c!68834 () Bool)

(assert (=> d!87931 (= c!68834 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87931 (= lt!276912 (select (arr!17884 a!2986) index!984))))

(assert (=> d!87931 (validMask!0 mask!3053)))

(assert (=> d!87931 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17884 a!2986) j!136) a!2986 mask!3053) lt!276913)))

(assert (= (and d!87931 c!68834) b!606707))

(assert (= (and d!87931 (not c!68834)) b!606704))

(assert (= (and b!606704 c!68833) b!606708))

(assert (= (and b!606704 (not c!68833)) b!606705))

(assert (= (and b!606705 c!68835) b!606709))

(assert (= (and b!606705 (not c!68835)) b!606706))

(assert (=> b!606706 m!583373))

(assert (=> b!606706 m!583373))

(assert (=> b!606706 m!583323))

(declare-fun m!583531 () Bool)

(assert (=> b!606706 m!583531))

(declare-fun m!583533 () Bool)

(assert (=> d!87931 m!583533))

(declare-fun m!583535 () Bool)

(assert (=> d!87931 m!583535))

(assert (=> d!87931 m!583365))

(assert (=> d!87931 m!583327))

(assert (=> b!606543 d!87931))

(declare-fun d!87949 () Bool)

(declare-fun res!389776 () Bool)

(declare-fun e!347394 () Bool)

(assert (=> d!87949 (=> res!389776 e!347394)))

(assert (=> d!87949 (= res!389776 ((_ is Nil!11922) Nil!11922))))

(assert (=> d!87949 (= (noDuplicate!307 Nil!11922) e!347394)))

(declare-fun b!606714 () Bool)

(declare-fun e!347395 () Bool)

(assert (=> b!606714 (= e!347394 e!347395)))

(declare-fun res!389777 () Bool)

(assert (=> b!606714 (=> (not res!389777) (not e!347395))))

(assert (=> b!606714 (= res!389777 (not (contains!3001 (t!18153 Nil!11922) (h!12966 Nil!11922))))))

(declare-fun b!606715 () Bool)

(assert (=> b!606715 (= e!347395 (noDuplicate!307 (t!18153 Nil!11922)))))

(assert (= (and d!87949 (not res!389776)) b!606714))

(assert (= (and b!606714 res!389777) b!606715))

(declare-fun m!583539 () Bool)

(assert (=> b!606714 m!583539))

(declare-fun m!583541 () Bool)

(assert (=> b!606715 m!583541))

(assert (=> b!606532 d!87949))

(declare-fun d!87953 () Bool)

(assert (=> d!87953 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!606533 d!87953))

(declare-fun d!87955 () Bool)

(declare-fun res!389778 () Bool)

(declare-fun e!347396 () Bool)

(assert (=> d!87955 (=> res!389778 e!347396)))

(assert (=> d!87955 (= res!389778 (= (select (arr!17884 lt!276824) j!136) (select (arr!17884 a!2986) j!136)))))

(assert (=> d!87955 (= (arrayContainsKey!0 lt!276824 (select (arr!17884 a!2986) j!136) j!136) e!347396)))

(declare-fun b!606716 () Bool)

(declare-fun e!347397 () Bool)

(assert (=> b!606716 (= e!347396 e!347397)))

(declare-fun res!389779 () Bool)

(assert (=> b!606716 (=> (not res!389779) (not e!347397))))

(assert (=> b!606716 (= res!389779 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18248 lt!276824)))))

(declare-fun b!606717 () Bool)

(assert (=> b!606717 (= e!347397 (arrayContainsKey!0 lt!276824 (select (arr!17884 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87955 (not res!389778)) b!606716))

(assert (= (and b!606716 res!389779) b!606717))

(assert (=> d!87955 m!583483))

(assert (=> b!606717 m!583323))

(declare-fun m!583543 () Bool)

(assert (=> b!606717 m!583543))

(assert (=> b!606522 d!87955))

(declare-fun b!606718 () Bool)

(declare-fun e!347398 () SeekEntryResult!6324)

(declare-fun e!347400 () SeekEntryResult!6324)

(assert (=> b!606718 (= e!347398 e!347400)))

(declare-fun c!68836 () Bool)

(declare-fun lt!276917 () (_ BitVec 64))

(assert (=> b!606718 (= c!68836 (= lt!276917 lt!276826))))

(declare-fun b!606719 () Bool)

(declare-fun c!68838 () Bool)

(assert (=> b!606719 (= c!68838 (= lt!276917 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347399 () SeekEntryResult!6324)

(assert (=> b!606719 (= e!347400 e!347399)))

(declare-fun b!606721 () Bool)

(assert (=> b!606721 (= e!347398 Undefined!6324)))

(declare-fun b!606722 () Bool)

(assert (=> b!606722 (= e!347400 (Found!6324 index!984))))

(declare-fun b!606723 () Bool)

(assert (=> b!606723 (= e!347399 (MissingVacant!6324 vacantSpotIndex!68))))

(declare-fun b!606720 () Bool)

(assert (=> b!606720 (= e!347399 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!276826 lt!276824 mask!3053))))

(declare-fun lt!276918 () SeekEntryResult!6324)

(declare-fun d!87957 () Bool)

(assert (=> d!87957 (and (or ((_ is Undefined!6324) lt!276918) (not ((_ is Found!6324) lt!276918)) (and (bvsge (index!27569 lt!276918) #b00000000000000000000000000000000) (bvslt (index!27569 lt!276918) (size!18248 lt!276824)))) (or ((_ is Undefined!6324) lt!276918) ((_ is Found!6324) lt!276918) (not ((_ is MissingVacant!6324) lt!276918)) (not (= (index!27571 lt!276918) vacantSpotIndex!68)) (and (bvsge (index!27571 lt!276918) #b00000000000000000000000000000000) (bvslt (index!27571 lt!276918) (size!18248 lt!276824)))) (or ((_ is Undefined!6324) lt!276918) (ite ((_ is Found!6324) lt!276918) (= (select (arr!17884 lt!276824) (index!27569 lt!276918)) lt!276826) (and ((_ is MissingVacant!6324) lt!276918) (= (index!27571 lt!276918) vacantSpotIndex!68) (= (select (arr!17884 lt!276824) (index!27571 lt!276918)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87957 (= lt!276918 e!347398)))

(declare-fun c!68837 () Bool)

(assert (=> d!87957 (= c!68837 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87957 (= lt!276917 (select (arr!17884 lt!276824) index!984))))

(assert (=> d!87957 (validMask!0 mask!3053)))

(assert (=> d!87957 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276826 lt!276824 mask!3053) lt!276918)))

(assert (= (and d!87957 c!68837) b!606721))

(assert (= (and d!87957 (not c!68837)) b!606718))

(assert (= (and b!606718 c!68836) b!606722))

(assert (= (and b!606718 (not c!68836)) b!606719))

(assert (= (and b!606719 c!68838) b!606723))

(assert (= (and b!606719 (not c!68838)) b!606720))

(assert (=> b!606720 m!583373))

(assert (=> b!606720 m!583373))

(declare-fun m!583545 () Bool)

(assert (=> b!606720 m!583545))

(declare-fun m!583547 () Bool)

(assert (=> d!87957 m!583547))

(declare-fun m!583549 () Bool)

(assert (=> d!87957 m!583549))

(assert (=> d!87957 m!583499))

(assert (=> d!87957 m!583327))

(assert (=> b!606523 d!87957))

(declare-fun b!606724 () Bool)

(declare-fun e!347401 () SeekEntryResult!6324)

(declare-fun e!347403 () SeekEntryResult!6324)

(assert (=> b!606724 (= e!347401 e!347403)))

(declare-fun lt!276919 () (_ BitVec 64))

(declare-fun c!68839 () Bool)

(assert (=> b!606724 (= c!68839 (= lt!276919 (select (arr!17884 a!2986) j!136)))))

(declare-fun b!606725 () Bool)

(declare-fun c!68841 () Bool)

(assert (=> b!606725 (= c!68841 (= lt!276919 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347402 () SeekEntryResult!6324)

(assert (=> b!606725 (= e!347403 e!347402)))

(declare-fun b!606727 () Bool)

(assert (=> b!606727 (= e!347401 Undefined!6324)))

(declare-fun b!606728 () Bool)

(assert (=> b!606728 (= e!347403 (Found!6324 lt!276838))))

(declare-fun b!606729 () Bool)

(assert (=> b!606729 (= e!347402 (MissingVacant!6324 vacantSpotIndex!68))))

(declare-fun b!606726 () Bool)

(assert (=> b!606726 (= e!347402 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276838 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17884 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!276920 () SeekEntryResult!6324)

(declare-fun d!87959 () Bool)

(assert (=> d!87959 (and (or ((_ is Undefined!6324) lt!276920) (not ((_ is Found!6324) lt!276920)) (and (bvsge (index!27569 lt!276920) #b00000000000000000000000000000000) (bvslt (index!27569 lt!276920) (size!18248 a!2986)))) (or ((_ is Undefined!6324) lt!276920) ((_ is Found!6324) lt!276920) (not ((_ is MissingVacant!6324) lt!276920)) (not (= (index!27571 lt!276920) vacantSpotIndex!68)) (and (bvsge (index!27571 lt!276920) #b00000000000000000000000000000000) (bvslt (index!27571 lt!276920) (size!18248 a!2986)))) (or ((_ is Undefined!6324) lt!276920) (ite ((_ is Found!6324) lt!276920) (= (select (arr!17884 a!2986) (index!27569 lt!276920)) (select (arr!17884 a!2986) j!136)) (and ((_ is MissingVacant!6324) lt!276920) (= (index!27571 lt!276920) vacantSpotIndex!68) (= (select (arr!17884 a!2986) (index!27571 lt!276920)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87959 (= lt!276920 e!347401)))

(declare-fun c!68840 () Bool)

(assert (=> d!87959 (= c!68840 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87959 (= lt!276919 (select (arr!17884 a!2986) lt!276838))))

(assert (=> d!87959 (validMask!0 mask!3053)))

(assert (=> d!87959 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276838 vacantSpotIndex!68 (select (arr!17884 a!2986) j!136) a!2986 mask!3053) lt!276920)))

(assert (= (and d!87959 c!68840) b!606727))

(assert (= (and d!87959 (not c!68840)) b!606724))

(assert (= (and b!606724 c!68839) b!606728))

(assert (= (and b!606724 (not c!68839)) b!606725))

(assert (= (and b!606725 c!68841) b!606729))

(assert (= (and b!606725 (not c!68841)) b!606726))

(declare-fun m!583551 () Bool)

(assert (=> b!606726 m!583551))

(assert (=> b!606726 m!583551))

(assert (=> b!606726 m!583323))

(declare-fun m!583553 () Bool)

(assert (=> b!606726 m!583553))

(declare-fun m!583555 () Bool)

(assert (=> d!87959 m!583555))

(declare-fun m!583557 () Bool)

(assert (=> d!87959 m!583557))

(declare-fun m!583559 () Bool)

(assert (=> d!87959 m!583559))

(assert (=> d!87959 m!583327))

(assert (=> b!606523 d!87959))

(declare-fun d!87961 () Bool)

(declare-fun lt!276930 () (_ BitVec 32))

(assert (=> d!87961 (and (bvsge lt!276930 #b00000000000000000000000000000000) (bvslt lt!276930 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87961 (= lt!276930 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87961 (validMask!0 mask!3053)))

(assert (=> d!87961 (= (nextIndex!0 index!984 x!910 mask!3053) lt!276930)))

(declare-fun bs!18562 () Bool)

(assert (= bs!18562 d!87961))

(declare-fun m!583565 () Bool)

(assert (=> bs!18562 m!583565))

(assert (=> bs!18562 m!583327))

(assert (=> b!606523 d!87961))

(declare-fun b!606750 () Bool)

(declare-fun e!347417 () SeekEntryResult!6324)

(declare-fun e!347419 () SeekEntryResult!6324)

(assert (=> b!606750 (= e!347417 e!347419)))

(declare-fun c!68849 () Bool)

(declare-fun lt!276931 () (_ BitVec 64))

(assert (=> b!606750 (= c!68849 (= lt!276931 lt!276826))))

(declare-fun b!606751 () Bool)

(declare-fun c!68851 () Bool)

(assert (=> b!606751 (= c!68851 (= lt!276931 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347418 () SeekEntryResult!6324)

(assert (=> b!606751 (= e!347419 e!347418)))

(declare-fun b!606753 () Bool)

(assert (=> b!606753 (= e!347417 Undefined!6324)))

(declare-fun b!606754 () Bool)

(assert (=> b!606754 (= e!347419 (Found!6324 lt!276838))))

(declare-fun b!606755 () Bool)

(assert (=> b!606755 (= e!347418 (MissingVacant!6324 vacantSpotIndex!68))))

(declare-fun b!606752 () Bool)

(assert (=> b!606752 (= e!347418 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276838 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!276826 lt!276824 mask!3053))))

(declare-fun lt!276932 () SeekEntryResult!6324)

(declare-fun d!87965 () Bool)

(assert (=> d!87965 (and (or ((_ is Undefined!6324) lt!276932) (not ((_ is Found!6324) lt!276932)) (and (bvsge (index!27569 lt!276932) #b00000000000000000000000000000000) (bvslt (index!27569 lt!276932) (size!18248 lt!276824)))) (or ((_ is Undefined!6324) lt!276932) ((_ is Found!6324) lt!276932) (not ((_ is MissingVacant!6324) lt!276932)) (not (= (index!27571 lt!276932) vacantSpotIndex!68)) (and (bvsge (index!27571 lt!276932) #b00000000000000000000000000000000) (bvslt (index!27571 lt!276932) (size!18248 lt!276824)))) (or ((_ is Undefined!6324) lt!276932) (ite ((_ is Found!6324) lt!276932) (= (select (arr!17884 lt!276824) (index!27569 lt!276932)) lt!276826) (and ((_ is MissingVacant!6324) lt!276932) (= (index!27571 lt!276932) vacantSpotIndex!68) (= (select (arr!17884 lt!276824) (index!27571 lt!276932)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87965 (= lt!276932 e!347417)))

(declare-fun c!68850 () Bool)

(assert (=> d!87965 (= c!68850 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87965 (= lt!276931 (select (arr!17884 lt!276824) lt!276838))))

(assert (=> d!87965 (validMask!0 mask!3053)))

(assert (=> d!87965 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276838 vacantSpotIndex!68 lt!276826 lt!276824 mask!3053) lt!276932)))

(assert (= (and d!87965 c!68850) b!606753))

(assert (= (and d!87965 (not c!68850)) b!606750))

(assert (= (and b!606750 c!68849) b!606754))

(assert (= (and b!606750 (not c!68849)) b!606751))

(assert (= (and b!606751 c!68851) b!606755))

(assert (= (and b!606751 (not c!68851)) b!606752))

(assert (=> b!606752 m!583551))

(assert (=> b!606752 m!583551))

(declare-fun m!583575 () Bool)

(assert (=> b!606752 m!583575))

(declare-fun m!583577 () Bool)

(assert (=> d!87965 m!583577))

(declare-fun m!583579 () Bool)

(assert (=> d!87965 m!583579))

(declare-fun m!583581 () Bool)

(assert (=> d!87965 m!583581))

(assert (=> d!87965 m!583327))

(assert (=> b!606523 d!87965))

(declare-fun d!87969 () Bool)

(declare-fun e!347433 () Bool)

(assert (=> d!87969 e!347433))

(declare-fun res!389795 () Bool)

(assert (=> d!87969 (=> (not res!389795) (not e!347433))))

(assert (=> d!87969 (= res!389795 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18248 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18248 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18248 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18248 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18248 a!2986))))))

(declare-fun lt!276939 () Unit!19324)

(declare-fun choose!9 (array!37264 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19324)

(assert (=> d!87969 (= lt!276939 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276838 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87969 (validMask!0 mask!3053)))

(assert (=> d!87969 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276838 vacantSpotIndex!68 mask!3053) lt!276939)))

(declare-fun b!606773 () Bool)

(assert (=> b!606773 (= e!347433 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276838 vacantSpotIndex!68 (select (arr!17884 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276838 vacantSpotIndex!68 (select (store (arr!17884 a!2986) i!1108 k0!1786) j!136) (array!37265 (store (arr!17884 a!2986) i!1108 k0!1786) (size!18248 a!2986)) mask!3053)))))

(assert (= (and d!87969 res!389795) b!606773))

(declare-fun m!583603 () Bool)

(assert (=> d!87969 m!583603))

(assert (=> d!87969 m!583327))

(assert (=> b!606773 m!583335))

(assert (=> b!606773 m!583375))

(assert (=> b!606773 m!583375))

(declare-fun m!583605 () Bool)

(assert (=> b!606773 m!583605))

(assert (=> b!606773 m!583323))

(assert (=> b!606773 m!583377))

(assert (=> b!606773 m!583323))

(assert (=> b!606523 d!87969))

(declare-fun bm!33093 () Bool)

(declare-fun call!33096 () Bool)

(declare-fun c!68856 () Bool)

(assert (=> bm!33093 (= call!33096 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68856 (Cons!11921 (select (arr!17884 a!2986) #b00000000000000000000000000000000) Nil!11922) Nil!11922)))))

(declare-fun b!606774 () Bool)

(declare-fun e!347435 () Bool)

(declare-fun e!347436 () Bool)

(assert (=> b!606774 (= e!347435 e!347436)))

(assert (=> b!606774 (= c!68856 (validKeyInArray!0 (select (arr!17884 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606775 () Bool)

(declare-fun e!347434 () Bool)

(assert (=> b!606775 (= e!347434 (contains!3001 Nil!11922 (select (arr!17884 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606776 () Bool)

(assert (=> b!606776 (= e!347436 call!33096)))

(declare-fun d!87977 () Bool)

(declare-fun res!389797 () Bool)

(declare-fun e!347437 () Bool)

(assert (=> d!87977 (=> res!389797 e!347437)))

(assert (=> d!87977 (= res!389797 (bvsge #b00000000000000000000000000000000 (size!18248 a!2986)))))

(assert (=> d!87977 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11922) e!347437)))

(declare-fun b!606777 () Bool)

(assert (=> b!606777 (= e!347436 call!33096)))

(declare-fun b!606778 () Bool)

(assert (=> b!606778 (= e!347437 e!347435)))

(declare-fun res!389796 () Bool)

(assert (=> b!606778 (=> (not res!389796) (not e!347435))))

(assert (=> b!606778 (= res!389796 (not e!347434))))

(declare-fun res!389798 () Bool)

(assert (=> b!606778 (=> (not res!389798) (not e!347434))))

(assert (=> b!606778 (= res!389798 (validKeyInArray!0 (select (arr!17884 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!87977 (not res!389797)) b!606778))

(assert (= (and b!606778 res!389798) b!606775))

(assert (= (and b!606778 res!389796) b!606774))

(assert (= (and b!606774 c!68856) b!606777))

(assert (= (and b!606774 (not c!68856)) b!606776))

(assert (= (or b!606777 b!606776) bm!33093))

(assert (=> bm!33093 m!583503))

(declare-fun m!583607 () Bool)

(assert (=> bm!33093 m!583607))

(assert (=> b!606774 m!583503))

(assert (=> b!606774 m!583503))

(declare-fun m!583609 () Bool)

(assert (=> b!606774 m!583609))

(assert (=> b!606775 m!583503))

(assert (=> b!606775 m!583503))

(declare-fun m!583611 () Bool)

(assert (=> b!606775 m!583611))

(assert (=> b!606778 m!583503))

(assert (=> b!606778 m!583503))

(assert (=> b!606778 m!583609))

(assert (=> b!606544 d!87977))

(declare-fun d!87979 () Bool)

(declare-fun lt!276941 () Bool)

(assert (=> d!87979 (= lt!276941 (select (content!239 Nil!11922) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347440 () Bool)

(assert (=> d!87979 (= lt!276941 e!347440)))

(declare-fun res!389801 () Bool)

(assert (=> d!87979 (=> (not res!389801) (not e!347440))))

(assert (=> d!87979 (= res!389801 ((_ is Cons!11921) Nil!11922))))

(assert (=> d!87979 (= (contains!3001 Nil!11922 #b1000000000000000000000000000000000000000000000000000000000000000) lt!276941)))

(declare-fun b!606780 () Bool)

(declare-fun e!347439 () Bool)

(assert (=> b!606780 (= e!347440 e!347439)))

(declare-fun res!389800 () Bool)

(assert (=> b!606780 (=> res!389800 e!347439)))

(assert (=> b!606780 (= res!389800 (= (h!12966 Nil!11922) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!606781 () Bool)

(assert (=> b!606781 (= e!347439 (contains!3001 (t!18153 Nil!11922) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!87979 res!389801) b!606780))

(assert (= (and b!606780 (not res!389800)) b!606781))

(assert (=> d!87979 m!583493))

(declare-fun m!583617 () Bool)

(assert (=> d!87979 m!583617))

(declare-fun m!583619 () Bool)

(assert (=> b!606781 m!583619))

(assert (=> b!606534 d!87979))

(declare-fun b!606850 () Bool)

(declare-fun e!347483 () SeekEntryResult!6324)

(declare-fun e!347484 () SeekEntryResult!6324)

(assert (=> b!606850 (= e!347483 e!347484)))

(declare-fun lt!276988 () (_ BitVec 64))

(declare-fun lt!276987 () SeekEntryResult!6324)

(assert (=> b!606850 (= lt!276988 (select (arr!17884 a!2986) (index!27570 lt!276987)))))

(declare-fun c!68886 () Bool)

(assert (=> b!606850 (= c!68886 (= lt!276988 k0!1786))))

(declare-fun b!606851 () Bool)

(assert (=> b!606851 (= e!347483 Undefined!6324)))

(declare-fun b!606852 () Bool)

(declare-fun e!347482 () SeekEntryResult!6324)

(assert (=> b!606852 (= e!347482 (seekKeyOrZeroReturnVacant!0 (x!56376 lt!276987) (index!27570 lt!276987) (index!27570 lt!276987) k0!1786 a!2986 mask!3053))))

(declare-fun d!87981 () Bool)

(declare-fun lt!276989 () SeekEntryResult!6324)

(assert (=> d!87981 (and (or ((_ is Undefined!6324) lt!276989) (not ((_ is Found!6324) lt!276989)) (and (bvsge (index!27569 lt!276989) #b00000000000000000000000000000000) (bvslt (index!27569 lt!276989) (size!18248 a!2986)))) (or ((_ is Undefined!6324) lt!276989) ((_ is Found!6324) lt!276989) (not ((_ is MissingZero!6324) lt!276989)) (and (bvsge (index!27568 lt!276989) #b00000000000000000000000000000000) (bvslt (index!27568 lt!276989) (size!18248 a!2986)))) (or ((_ is Undefined!6324) lt!276989) ((_ is Found!6324) lt!276989) ((_ is MissingZero!6324) lt!276989) (not ((_ is MissingVacant!6324) lt!276989)) (and (bvsge (index!27571 lt!276989) #b00000000000000000000000000000000) (bvslt (index!27571 lt!276989) (size!18248 a!2986)))) (or ((_ is Undefined!6324) lt!276989) (ite ((_ is Found!6324) lt!276989) (= (select (arr!17884 a!2986) (index!27569 lt!276989)) k0!1786) (ite ((_ is MissingZero!6324) lt!276989) (= (select (arr!17884 a!2986) (index!27568 lt!276989)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6324) lt!276989) (= (select (arr!17884 a!2986) (index!27571 lt!276989)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!87981 (= lt!276989 e!347483)))

(declare-fun c!68884 () Bool)

(assert (=> d!87981 (= c!68884 (and ((_ is Intermediate!6324) lt!276987) (undefined!7136 lt!276987)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37264 (_ BitVec 32)) SeekEntryResult!6324)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87981 (= lt!276987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87981 (validMask!0 mask!3053)))

(assert (=> d!87981 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!276989)))

(declare-fun b!606853 () Bool)

(assert (=> b!606853 (= e!347484 (Found!6324 (index!27570 lt!276987)))))

(declare-fun b!606854 () Bool)

(declare-fun c!68885 () Bool)

(assert (=> b!606854 (= c!68885 (= lt!276988 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606854 (= e!347484 e!347482)))

(declare-fun b!606855 () Bool)

(assert (=> b!606855 (= e!347482 (MissingZero!6324 (index!27570 lt!276987)))))

(assert (= (and d!87981 c!68884) b!606851))

(assert (= (and d!87981 (not c!68884)) b!606850))

(assert (= (and b!606850 c!68886) b!606853))

(assert (= (and b!606850 (not c!68886)) b!606854))

(assert (= (and b!606854 c!68885) b!606855))

(assert (= (and b!606854 (not c!68885)) b!606852))

(declare-fun m!583679 () Bool)

(assert (=> b!606850 m!583679))

(declare-fun m!583681 () Bool)

(assert (=> b!606852 m!583681))

(assert (=> d!87981 m!583327))

(declare-fun m!583683 () Bool)

(assert (=> d!87981 m!583683))

(declare-fun m!583685 () Bool)

(assert (=> d!87981 m!583685))

(declare-fun m!583687 () Bool)

(assert (=> d!87981 m!583687))

(assert (=> d!87981 m!583685))

(declare-fun m!583689 () Bool)

(assert (=> d!87981 m!583689))

(declare-fun m!583691 () Bool)

(assert (=> d!87981 m!583691))

(assert (=> b!606535 d!87981))

(assert (=> b!606524 d!87925))

(declare-fun d!88003 () Bool)

(declare-fun res!389816 () Bool)

(declare-fun e!347485 () Bool)

(assert (=> d!88003 (=> res!389816 e!347485)))

(assert (=> d!88003 (= res!389816 (= (select (arr!17884 lt!276824) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17884 a!2986) j!136)))))

(assert (=> d!88003 (= (arrayContainsKey!0 lt!276824 (select (arr!17884 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!347485)))

(declare-fun b!606856 () Bool)

(declare-fun e!347486 () Bool)

(assert (=> b!606856 (= e!347485 e!347486)))

(declare-fun res!389817 () Bool)

(assert (=> b!606856 (=> (not res!389817) (not e!347486))))

(assert (=> b!606856 (= res!389817 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18248 lt!276824)))))

(declare-fun b!606857 () Bool)

(assert (=> b!606857 (= e!347486 (arrayContainsKey!0 lt!276824 (select (arr!17884 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88003 (not res!389816)) b!606856))

(assert (= (and b!606856 res!389817) b!606857))

(declare-fun m!583693 () Bool)

(assert (=> d!88003 m!583693))

(assert (=> b!606857 m!583323))

(declare-fun m!583695 () Bool)

(assert (=> b!606857 m!583695))

(assert (=> b!606525 d!88003))

(declare-fun d!88005 () Bool)

(assert (=> d!88005 (arrayContainsKey!0 lt!276824 (select (arr!17884 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276991 () Unit!19324)

(assert (=> d!88005 (= lt!276991 (choose!114 lt!276824 (select (arr!17884 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!88005 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!88005 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276824 (select (arr!17884 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!276991)))

(declare-fun bs!18566 () Bool)

(assert (= bs!18566 d!88005))

(assert (=> bs!18566 m!583323))

(assert (=> bs!18566 m!583339))

(assert (=> bs!18566 m!583323))

(declare-fun m!583697 () Bool)

(assert (=> bs!18566 m!583697))

(assert (=> b!606525 d!88005))

(assert (=> b!606525 d!87955))

(declare-fun b!606886 () Bool)

(declare-fun e!347509 () Bool)

(declare-fun call!33109 () Bool)

(assert (=> b!606886 (= e!347509 call!33109)))

(declare-fun b!606887 () Bool)

(declare-fun e!347510 () Bool)

(assert (=> b!606887 (= e!347510 e!347509)))

(declare-fun lt!277001 () (_ BitVec 64))

(assert (=> b!606887 (= lt!277001 (select (arr!17884 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!277003 () Unit!19324)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37264 (_ BitVec 64) (_ BitVec 32)) Unit!19324)

(assert (=> b!606887 (= lt!277003 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!277001 #b00000000000000000000000000000000))))

(assert (=> b!606887 (arrayContainsKey!0 a!2986 lt!277001 #b00000000000000000000000000000000)))

(declare-fun lt!277002 () Unit!19324)

(assert (=> b!606887 (= lt!277002 lt!277003)))

(declare-fun res!389835 () Bool)

(assert (=> b!606887 (= res!389835 (= (seekEntryOrOpen!0 (select (arr!17884 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6324 #b00000000000000000000000000000000)))))

(assert (=> b!606887 (=> (not res!389835) (not e!347509))))

(declare-fun b!606888 () Bool)

(assert (=> b!606888 (= e!347510 call!33109)))

(declare-fun bm!33106 () Bool)

(assert (=> bm!33106 (= call!33109 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!606889 () Bool)

(declare-fun e!347511 () Bool)

(assert (=> b!606889 (= e!347511 e!347510)))

(declare-fun c!68893 () Bool)

(assert (=> b!606889 (= c!68893 (validKeyInArray!0 (select (arr!17884 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88007 () Bool)

(declare-fun res!389834 () Bool)

(assert (=> d!88007 (=> res!389834 e!347511)))

(assert (=> d!88007 (= res!389834 (bvsge #b00000000000000000000000000000000 (size!18248 a!2986)))))

(assert (=> d!88007 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!347511)))

(assert (= (and d!88007 (not res!389834)) b!606889))

(assert (= (and b!606889 c!68893) b!606887))

(assert (= (and b!606889 (not c!68893)) b!606888))

(assert (= (and b!606887 res!389835) b!606886))

(assert (= (or b!606886 b!606888) bm!33106))

(assert (=> b!606887 m!583503))

(declare-fun m!583715 () Bool)

(assert (=> b!606887 m!583715))

(declare-fun m!583717 () Bool)

(assert (=> b!606887 m!583717))

(assert (=> b!606887 m!583503))

(declare-fun m!583719 () Bool)

(assert (=> b!606887 m!583719))

(declare-fun m!583721 () Bool)

(assert (=> bm!33106 m!583721))

(assert (=> b!606889 m!583503))

(assert (=> b!606889 m!583503))

(assert (=> b!606889 m!583609))

(assert (=> b!606526 d!88007))

(check-sat (not d!87911) (not d!87959) (not d!87979) (not b!606857) (not d!87957) (not b!606773) (not d!87905) (not b!606752) (not b!606635) (not b!606634) (not b!606706) (not b!606726) (not b!606715) (not b!606720) (not bm!33087) (not d!87931) (not b!606647) (not b!606889) (not b!606714) (not d!87909) (not b!606638) (not b!606774) (not d!87965) (not d!87969) (not b!606717) (not d!88005) (not b!606658) (not bm!33106) (not bm!33093) (not d!87961) (not b!606778) (not b!606662) (not b!606644) (not b!606648) (not b!606887) (not b!606660) (not b!606652) (not b!606649) (not b!606781) (not b!606775) (not b!606852) (not d!87981) (not d!87917) (not d!87913) (not bm!33086))
(check-sat)
