; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57428 () Bool)

(assert start!57428)

(declare-fun b!635537 () Bool)

(declare-fun e!363497 () Bool)

(declare-fun e!363508 () Bool)

(assert (=> b!635537 (= e!363497 e!363508)))

(declare-fun res!411269 () Bool)

(assert (=> b!635537 (=> res!411269 e!363508)))

(declare-datatypes ((array!38229 0))(
  ( (array!38230 (arr!18341 (Array (_ BitVec 32) (_ BitVec 64))) (size!18706 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38229)

(assert (=> b!635537 (= res!411269 (or (bvsge (size!18706 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18706 a!2986))))))

(declare-fun lt!293772 () array!38229)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635537 (arrayContainsKey!0 lt!293772 (select (arr!18341 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!21440 0))(
  ( (Unit!21441) )
))
(declare-fun lt!293771 () Unit!21440)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38229 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21440)

(assert (=> b!635537 (= lt!293771 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293772 (select (arr!18341 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!635538 () Bool)

(declare-fun e!363504 () Bool)

(declare-datatypes ((SeekEntryResult!6778 0))(
  ( (MissingZero!6778 (index!29417 (_ BitVec 32))) (Found!6778 (index!29418 (_ BitVec 32))) (Intermediate!6778 (undefined!7590 Bool) (index!29419 (_ BitVec 32)) (x!58172 (_ BitVec 32))) (Undefined!6778) (MissingVacant!6778 (index!29420 (_ BitVec 32))) )
))
(declare-fun lt!293775 () SeekEntryResult!6778)

(declare-fun lt!293774 () SeekEntryResult!6778)

(assert (=> b!635538 (= e!363504 (= lt!293775 lt!293774))))

(declare-fun b!635539 () Bool)

(declare-fun e!363503 () Bool)

(declare-fun e!363502 () Bool)

(assert (=> b!635539 (= e!363503 e!363502)))

(declare-fun res!411263 () Bool)

(assert (=> b!635539 (=> (not res!411263) (not e!363502))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!635539 (= res!411263 (and (= lt!293775 (Found!6778 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18341 a!2986) index!984) (select (arr!18341 a!2986) j!136))) (not (= (select (arr!18341 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38229 (_ BitVec 32)) SeekEntryResult!6778)

(assert (=> b!635539 (= lt!293775 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18341 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635540 () Bool)

(declare-fun e!363501 () Bool)

(declare-fun e!363506 () Bool)

(assert (=> b!635540 (= e!363501 e!363506)))

(declare-fun res!411262 () Bool)

(assert (=> b!635540 (=> (not res!411262) (not e!363506))))

(assert (=> b!635540 (= res!411262 (arrayContainsKey!0 lt!293772 (select (arr!18341 a!2986) j!136) j!136))))

(declare-fun b!635541 () Bool)

(declare-fun e!363499 () Bool)

(assert (=> b!635541 (= e!363499 e!363503)))

(declare-fun res!411261 () Bool)

(assert (=> b!635541 (=> (not res!411261) (not e!363503))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!635541 (= res!411261 (= (select (store (arr!18341 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635541 (= lt!293772 (array!38230 (store (arr!18341 a!2986) i!1108 k0!1786) (size!18706 a!2986)))))

(declare-fun res!411265 () Bool)

(declare-fun e!363498 () Bool)

(assert (=> start!57428 (=> (not res!411265) (not e!363498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57428 (= res!411265 (validMask!0 mask!3053))))

(assert (=> start!57428 e!363498))

(assert (=> start!57428 true))

(declare-fun array_inv!14224 (array!38229) Bool)

(assert (=> start!57428 (array_inv!14224 a!2986)))

(declare-fun b!635542 () Bool)

(declare-fun e!363509 () Unit!21440)

(declare-fun Unit!21442 () Unit!21440)

(assert (=> b!635542 (= e!363509 Unit!21442)))

(declare-fun b!635543 () Bool)

(declare-fun res!411260 () Bool)

(assert (=> b!635543 (=> (not res!411260) (not e!363498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635543 (= res!411260 (validKeyInArray!0 k0!1786))))

(declare-fun b!635544 () Bool)

(declare-fun Unit!21443 () Unit!21440)

(assert (=> b!635544 (= e!363509 Unit!21443)))

(assert (=> b!635544 false))

(declare-fun b!635545 () Bool)

(declare-fun res!411271 () Bool)

(assert (=> b!635545 (=> (not res!411271) (not e!363499))))

(assert (=> b!635545 (= res!411271 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18341 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635546 () Bool)

(declare-fun res!411273 () Bool)

(assert (=> b!635546 (=> (not res!411273) (not e!363499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38229 (_ BitVec 32)) Bool)

(assert (=> b!635546 (= res!411273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!635547 () Bool)

(declare-fun e!363500 () Bool)

(assert (=> b!635547 (= e!363502 (not e!363500))))

(declare-fun res!411274 () Bool)

(assert (=> b!635547 (=> res!411274 e!363500)))

(declare-fun lt!293770 () SeekEntryResult!6778)

(assert (=> b!635547 (= res!411274 (not (= lt!293770 (Found!6778 index!984))))))

(declare-fun lt!293776 () Unit!21440)

(assert (=> b!635547 (= lt!293776 e!363509)))

(declare-fun c!72507 () Bool)

(assert (=> b!635547 (= c!72507 (= lt!293770 Undefined!6778))))

(declare-fun lt!293768 () (_ BitVec 64))

(assert (=> b!635547 (= lt!293770 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293768 lt!293772 mask!3053))))

(assert (=> b!635547 e!363504))

(declare-fun res!411258 () Bool)

(assert (=> b!635547 (=> (not res!411258) (not e!363504))))

(declare-fun lt!293777 () (_ BitVec 32))

(assert (=> b!635547 (= res!411258 (= lt!293774 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293777 vacantSpotIndex!68 lt!293768 lt!293772 mask!3053)))))

(assert (=> b!635547 (= lt!293774 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293777 vacantSpotIndex!68 (select (arr!18341 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!635547 (= lt!293768 (select (store (arr!18341 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293769 () Unit!21440)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38229 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21440)

(assert (=> b!635547 (= lt!293769 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293777 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635547 (= lt!293777 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!635548 () Bool)

(declare-fun res!411272 () Bool)

(assert (=> b!635548 (=> (not res!411272) (not e!363498))))

(assert (=> b!635548 (= res!411272 (validKeyInArray!0 (select (arr!18341 a!2986) j!136)))))

(declare-fun b!635549 () Bool)

(declare-fun e!363507 () Bool)

(assert (=> b!635549 (= e!363507 e!363501)))

(declare-fun res!411267 () Bool)

(assert (=> b!635549 (=> res!411267 e!363501)))

(declare-fun lt!293778 () (_ BitVec 64))

(assert (=> b!635549 (= res!411267 (or (not (= (select (arr!18341 a!2986) j!136) lt!293768)) (not (= (select (arr!18341 a!2986) j!136) lt!293778)) (bvsge j!136 index!984)))))

(declare-fun b!635550 () Bool)

(declare-fun res!411270 () Bool)

(assert (=> b!635550 (=> (not res!411270) (not e!363498))))

(assert (=> b!635550 (= res!411270 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635551 () Bool)

(declare-datatypes ((List!12421 0))(
  ( (Nil!12418) (Cons!12417 (h!13462 (_ BitVec 64)) (t!18640 List!12421)) )
))
(declare-fun noDuplicate!380 (List!12421) Bool)

(assert (=> b!635551 (= e!363508 (noDuplicate!380 Nil!12418))))

(declare-fun b!635552 () Bool)

(assert (=> b!635552 (= e!363506 (arrayContainsKey!0 lt!293772 (select (arr!18341 a!2986) j!136) index!984))))

(declare-fun b!635553 () Bool)

(declare-fun res!411268 () Bool)

(assert (=> b!635553 (=> (not res!411268) (not e!363498))))

(assert (=> b!635553 (= res!411268 (and (= (size!18706 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18706 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18706 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!635554 () Bool)

(assert (=> b!635554 (= e!363500 e!363497)))

(declare-fun res!411266 () Bool)

(assert (=> b!635554 (=> res!411266 e!363497)))

(assert (=> b!635554 (= res!411266 (or (not (= (select (arr!18341 a!2986) j!136) lt!293768)) (not (= (select (arr!18341 a!2986) j!136) lt!293778)) (bvsge j!136 index!984)))))

(assert (=> b!635554 e!363507))

(declare-fun res!411257 () Bool)

(assert (=> b!635554 (=> (not res!411257) (not e!363507))))

(assert (=> b!635554 (= res!411257 (= lt!293778 (select (arr!18341 a!2986) j!136)))))

(assert (=> b!635554 (= lt!293778 (select (store (arr!18341 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!635555 () Bool)

(declare-fun res!411264 () Bool)

(assert (=> b!635555 (=> (not res!411264) (not e!363499))))

(declare-fun arrayNoDuplicates!0 (array!38229 (_ BitVec 32) List!12421) Bool)

(assert (=> b!635555 (= res!411264 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12418))))

(declare-fun b!635556 () Bool)

(assert (=> b!635556 (= e!363498 e!363499)))

(declare-fun res!411259 () Bool)

(assert (=> b!635556 (=> (not res!411259) (not e!363499))))

(declare-fun lt!293773 () SeekEntryResult!6778)

(assert (=> b!635556 (= res!411259 (or (= lt!293773 (MissingZero!6778 i!1108)) (= lt!293773 (MissingVacant!6778 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38229 (_ BitVec 32)) SeekEntryResult!6778)

(assert (=> b!635556 (= lt!293773 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!57428 res!411265) b!635553))

(assert (= (and b!635553 res!411268) b!635548))

(assert (= (and b!635548 res!411272) b!635543))

(assert (= (and b!635543 res!411260) b!635550))

(assert (= (and b!635550 res!411270) b!635556))

(assert (= (and b!635556 res!411259) b!635546))

(assert (= (and b!635546 res!411273) b!635555))

(assert (= (and b!635555 res!411264) b!635545))

(assert (= (and b!635545 res!411271) b!635541))

(assert (= (and b!635541 res!411261) b!635539))

(assert (= (and b!635539 res!411263) b!635547))

(assert (= (and b!635547 res!411258) b!635538))

(assert (= (and b!635547 c!72507) b!635544))

(assert (= (and b!635547 (not c!72507)) b!635542))

(assert (= (and b!635547 (not res!411274)) b!635554))

(assert (= (and b!635554 res!411257) b!635549))

(assert (= (and b!635549 (not res!411267)) b!635540))

(assert (= (and b!635540 res!411262) b!635552))

(assert (= (and b!635554 (not res!411266)) b!635537))

(assert (= (and b!635537 (not res!411269)) b!635551))

(declare-fun m!609357 () Bool)

(assert (=> b!635551 m!609357))

(declare-fun m!609359 () Bool)

(assert (=> b!635541 m!609359))

(declare-fun m!609361 () Bool)

(assert (=> b!635541 m!609361))

(declare-fun m!609363 () Bool)

(assert (=> start!57428 m!609363))

(declare-fun m!609365 () Bool)

(assert (=> start!57428 m!609365))

(declare-fun m!609367 () Bool)

(assert (=> b!635537 m!609367))

(assert (=> b!635537 m!609367))

(declare-fun m!609369 () Bool)

(assert (=> b!635537 m!609369))

(assert (=> b!635537 m!609367))

(declare-fun m!609371 () Bool)

(assert (=> b!635537 m!609371))

(declare-fun m!609373 () Bool)

(assert (=> b!635543 m!609373))

(declare-fun m!609375 () Bool)

(assert (=> b!635545 m!609375))

(declare-fun m!609377 () Bool)

(assert (=> b!635539 m!609377))

(assert (=> b!635539 m!609367))

(assert (=> b!635539 m!609367))

(declare-fun m!609379 () Bool)

(assert (=> b!635539 m!609379))

(assert (=> b!635548 m!609367))

(assert (=> b!635548 m!609367))

(declare-fun m!609381 () Bool)

(assert (=> b!635548 m!609381))

(declare-fun m!609383 () Bool)

(assert (=> b!635550 m!609383))

(declare-fun m!609385 () Bool)

(assert (=> b!635555 m!609385))

(declare-fun m!609387 () Bool)

(assert (=> b!635556 m!609387))

(assert (=> b!635552 m!609367))

(assert (=> b!635552 m!609367))

(declare-fun m!609389 () Bool)

(assert (=> b!635552 m!609389))

(assert (=> b!635540 m!609367))

(assert (=> b!635540 m!609367))

(declare-fun m!609391 () Bool)

(assert (=> b!635540 m!609391))

(assert (=> b!635549 m!609367))

(declare-fun m!609393 () Bool)

(assert (=> b!635546 m!609393))

(declare-fun m!609395 () Bool)

(assert (=> b!635547 m!609395))

(declare-fun m!609397 () Bool)

(assert (=> b!635547 m!609397))

(assert (=> b!635547 m!609367))

(assert (=> b!635547 m!609359))

(declare-fun m!609399 () Bool)

(assert (=> b!635547 m!609399))

(declare-fun m!609401 () Bool)

(assert (=> b!635547 m!609401))

(declare-fun m!609403 () Bool)

(assert (=> b!635547 m!609403))

(assert (=> b!635547 m!609367))

(declare-fun m!609405 () Bool)

(assert (=> b!635547 m!609405))

(assert (=> b!635554 m!609367))

(assert (=> b!635554 m!609359))

(declare-fun m!609407 () Bool)

(assert (=> b!635554 m!609407))

(check-sat (not b!635552) (not b!635551) (not b!635556) (not start!57428) (not b!635550) (not b!635555) (not b!635539) (not b!635537) (not b!635547) (not b!635548) (not b!635543) (not b!635546) (not b!635540))
(check-sat)
(get-model)

(declare-fun b!635687 () Bool)

(declare-fun e!363597 () Bool)

(declare-fun e!363596 () Bool)

(assert (=> b!635687 (= e!363597 e!363596)))

(declare-fun c!72516 () Bool)

(assert (=> b!635687 (= c!72516 (validKeyInArray!0 (select (arr!18341 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!635688 () Bool)

(declare-fun e!363599 () Bool)

(assert (=> b!635688 (= e!363599 e!363597)))

(declare-fun res!411389 () Bool)

(assert (=> b!635688 (=> (not res!411389) (not e!363597))))

(declare-fun e!363598 () Bool)

(assert (=> b!635688 (= res!411389 (not e!363598))))

(declare-fun res!411390 () Bool)

(assert (=> b!635688 (=> (not res!411390) (not e!363598))))

(assert (=> b!635688 (= res!411390 (validKeyInArray!0 (select (arr!18341 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!635689 () Bool)

(declare-fun contains!3082 (List!12421 (_ BitVec 64)) Bool)

(assert (=> b!635689 (= e!363598 (contains!3082 Nil!12418 (select (arr!18341 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33385 () Bool)

(declare-fun call!33388 () Bool)

(assert (=> bm!33385 (= call!33388 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72516 (Cons!12417 (select (arr!18341 a!2986) #b00000000000000000000000000000000) Nil!12418) Nil!12418)))))

(declare-fun d!89607 () Bool)

(declare-fun res!411391 () Bool)

(assert (=> d!89607 (=> res!411391 e!363599)))

(assert (=> d!89607 (= res!411391 (bvsge #b00000000000000000000000000000000 (size!18706 a!2986)))))

(assert (=> d!89607 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12418) e!363599)))

(declare-fun b!635690 () Bool)

(assert (=> b!635690 (= e!363596 call!33388)))

(declare-fun b!635691 () Bool)

(assert (=> b!635691 (= e!363596 call!33388)))

(assert (= (and d!89607 (not res!411391)) b!635688))

(assert (= (and b!635688 res!411390) b!635689))

(assert (= (and b!635688 res!411389) b!635687))

(assert (= (and b!635687 c!72516) b!635690))

(assert (= (and b!635687 (not c!72516)) b!635691))

(assert (= (or b!635690 b!635691) bm!33385))

(declare-fun m!609513 () Bool)

(assert (=> b!635687 m!609513))

(assert (=> b!635687 m!609513))

(declare-fun m!609515 () Bool)

(assert (=> b!635687 m!609515))

(assert (=> b!635688 m!609513))

(assert (=> b!635688 m!609513))

(assert (=> b!635688 m!609515))

(assert (=> b!635689 m!609513))

(assert (=> b!635689 m!609513))

(declare-fun m!609517 () Bool)

(assert (=> b!635689 m!609517))

(assert (=> bm!33385 m!609513))

(declare-fun m!609519 () Bool)

(assert (=> bm!33385 m!609519))

(assert (=> b!635555 d!89607))

(declare-fun b!635704 () Bool)

(declare-fun e!363608 () SeekEntryResult!6778)

(declare-fun e!363606 () SeekEntryResult!6778)

(assert (=> b!635704 (= e!363608 e!363606)))

(declare-fun lt!293851 () (_ BitVec 64))

(declare-fun lt!293852 () SeekEntryResult!6778)

(assert (=> b!635704 (= lt!293851 (select (arr!18341 a!2986) (index!29419 lt!293852)))))

(declare-fun c!72523 () Bool)

(assert (=> b!635704 (= c!72523 (= lt!293851 k0!1786))))

(declare-fun b!635705 () Bool)

(assert (=> b!635705 (= e!363606 (Found!6778 (index!29419 lt!293852)))))

(declare-fun b!635706 () Bool)

(declare-fun c!72525 () Bool)

(assert (=> b!635706 (= c!72525 (= lt!293851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363607 () SeekEntryResult!6778)

(assert (=> b!635706 (= e!363606 e!363607)))

(declare-fun b!635707 () Bool)

(assert (=> b!635707 (= e!363607 (seekKeyOrZeroReturnVacant!0 (x!58172 lt!293852) (index!29419 lt!293852) (index!29419 lt!293852) k0!1786 a!2986 mask!3053))))

(declare-fun d!89609 () Bool)

(declare-fun lt!293853 () SeekEntryResult!6778)

(get-info :version)

(assert (=> d!89609 (and (or ((_ is Undefined!6778) lt!293853) (not ((_ is Found!6778) lt!293853)) (and (bvsge (index!29418 lt!293853) #b00000000000000000000000000000000) (bvslt (index!29418 lt!293853) (size!18706 a!2986)))) (or ((_ is Undefined!6778) lt!293853) ((_ is Found!6778) lt!293853) (not ((_ is MissingZero!6778) lt!293853)) (and (bvsge (index!29417 lt!293853) #b00000000000000000000000000000000) (bvslt (index!29417 lt!293853) (size!18706 a!2986)))) (or ((_ is Undefined!6778) lt!293853) ((_ is Found!6778) lt!293853) ((_ is MissingZero!6778) lt!293853) (not ((_ is MissingVacant!6778) lt!293853)) (and (bvsge (index!29420 lt!293853) #b00000000000000000000000000000000) (bvslt (index!29420 lt!293853) (size!18706 a!2986)))) (or ((_ is Undefined!6778) lt!293853) (ite ((_ is Found!6778) lt!293853) (= (select (arr!18341 a!2986) (index!29418 lt!293853)) k0!1786) (ite ((_ is MissingZero!6778) lt!293853) (= (select (arr!18341 a!2986) (index!29417 lt!293853)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6778) lt!293853) (= (select (arr!18341 a!2986) (index!29420 lt!293853)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89609 (= lt!293853 e!363608)))

(declare-fun c!72524 () Bool)

(assert (=> d!89609 (= c!72524 (and ((_ is Intermediate!6778) lt!293852) (undefined!7590 lt!293852)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38229 (_ BitVec 32)) SeekEntryResult!6778)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89609 (= lt!293852 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89609 (validMask!0 mask!3053)))

(assert (=> d!89609 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!293853)))

(declare-fun b!635708 () Bool)

(assert (=> b!635708 (= e!363608 Undefined!6778)))

(declare-fun b!635709 () Bool)

(assert (=> b!635709 (= e!363607 (MissingZero!6778 (index!29419 lt!293852)))))

(assert (= (and d!89609 c!72524) b!635708))

(assert (= (and d!89609 (not c!72524)) b!635704))

(assert (= (and b!635704 c!72523) b!635705))

(assert (= (and b!635704 (not c!72523)) b!635706))

(assert (= (and b!635706 c!72525) b!635709))

(assert (= (and b!635706 (not c!72525)) b!635707))

(declare-fun m!609521 () Bool)

(assert (=> b!635704 m!609521))

(declare-fun m!609523 () Bool)

(assert (=> b!635707 m!609523))

(assert (=> d!89609 m!609363))

(declare-fun m!609525 () Bool)

(assert (=> d!89609 m!609525))

(declare-fun m!609527 () Bool)

(assert (=> d!89609 m!609527))

(declare-fun m!609529 () Bool)

(assert (=> d!89609 m!609529))

(assert (=> d!89609 m!609527))

(declare-fun m!609531 () Bool)

(assert (=> d!89609 m!609531))

(declare-fun m!609533 () Bool)

(assert (=> d!89609 m!609533))

(assert (=> b!635556 d!89609))

(declare-fun b!635718 () Bool)

(declare-fun e!363615 () Bool)

(declare-fun e!363617 () Bool)

(assert (=> b!635718 (= e!363615 e!363617)))

(declare-fun lt!293860 () (_ BitVec 64))

(assert (=> b!635718 (= lt!293860 (select (arr!18341 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!293862 () Unit!21440)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38229 (_ BitVec 64) (_ BitVec 32)) Unit!21440)

(assert (=> b!635718 (= lt!293862 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!293860 #b00000000000000000000000000000000))))

(assert (=> b!635718 (arrayContainsKey!0 a!2986 lt!293860 #b00000000000000000000000000000000)))

(declare-fun lt!293861 () Unit!21440)

(assert (=> b!635718 (= lt!293861 lt!293862)))

(declare-fun res!411396 () Bool)

(assert (=> b!635718 (= res!411396 (= (seekEntryOrOpen!0 (select (arr!18341 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6778 #b00000000000000000000000000000000)))))

(assert (=> b!635718 (=> (not res!411396) (not e!363617))))

(declare-fun b!635719 () Bool)

(declare-fun call!33391 () Bool)

(assert (=> b!635719 (= e!363617 call!33391)))

(declare-fun b!635720 () Bool)

(declare-fun e!363616 () Bool)

(assert (=> b!635720 (= e!363616 e!363615)))

(declare-fun c!72528 () Bool)

(assert (=> b!635720 (= c!72528 (validKeyInArray!0 (select (arr!18341 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33388 () Bool)

(assert (=> bm!33388 (= call!33391 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!89611 () Bool)

(declare-fun res!411397 () Bool)

(assert (=> d!89611 (=> res!411397 e!363616)))

(assert (=> d!89611 (= res!411397 (bvsge #b00000000000000000000000000000000 (size!18706 a!2986)))))

(assert (=> d!89611 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!363616)))

(declare-fun b!635721 () Bool)

(assert (=> b!635721 (= e!363615 call!33391)))

(assert (= (and d!89611 (not res!411397)) b!635720))

(assert (= (and b!635720 c!72528) b!635718))

(assert (= (and b!635720 (not c!72528)) b!635721))

(assert (= (and b!635718 res!411396) b!635719))

(assert (= (or b!635719 b!635721) bm!33388))

(assert (=> b!635718 m!609513))

(declare-fun m!609535 () Bool)

(assert (=> b!635718 m!609535))

(declare-fun m!609537 () Bool)

(assert (=> b!635718 m!609537))

(assert (=> b!635718 m!609513))

(declare-fun m!609539 () Bool)

(assert (=> b!635718 m!609539))

(assert (=> b!635720 m!609513))

(assert (=> b!635720 m!609513))

(assert (=> b!635720 m!609515))

(declare-fun m!609541 () Bool)

(assert (=> bm!33388 m!609541))

(assert (=> b!635546 d!89611))

(declare-fun d!89613 () Bool)

(declare-fun e!363626 () Bool)

(assert (=> d!89613 e!363626))

(declare-fun res!411406 () Bool)

(assert (=> d!89613 (=> (not res!411406) (not e!363626))))

(assert (=> d!89613 (= res!411406 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18706 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18706 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18706 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18706 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18706 a!2986))))))

(declare-fun lt!293865 () Unit!21440)

(declare-fun choose!9 (array!38229 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21440)

(assert (=> d!89613 (= lt!293865 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293777 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89613 (validMask!0 mask!3053)))

(assert (=> d!89613 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293777 vacantSpotIndex!68 mask!3053) lt!293865)))

(declare-fun b!635730 () Bool)

(assert (=> b!635730 (= e!363626 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293777 vacantSpotIndex!68 (select (arr!18341 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293777 vacantSpotIndex!68 (select (store (arr!18341 a!2986) i!1108 k0!1786) j!136) (array!38230 (store (arr!18341 a!2986) i!1108 k0!1786) (size!18706 a!2986)) mask!3053)))))

(assert (= (and d!89613 res!411406) b!635730))

(declare-fun m!609547 () Bool)

(assert (=> d!89613 m!609547))

(assert (=> d!89613 m!609363))

(assert (=> b!635730 m!609367))

(assert (=> b!635730 m!609397))

(declare-fun m!609549 () Bool)

(assert (=> b!635730 m!609549))

(assert (=> b!635730 m!609397))

(assert (=> b!635730 m!609367))

(assert (=> b!635730 m!609405))

(assert (=> b!635730 m!609359))

(assert (=> b!635547 d!89613))

(declare-fun b!635758 () Bool)

(declare-fun e!363642 () SeekEntryResult!6778)

(declare-fun e!363644 () SeekEntryResult!6778)

(assert (=> b!635758 (= e!363642 e!363644)))

(declare-fun c!72541 () Bool)

(declare-fun lt!293878 () (_ BitVec 64))

(assert (=> b!635758 (= c!72541 (= lt!293878 lt!293768))))

(declare-fun b!635759 () Bool)

(declare-fun c!72543 () Bool)

(assert (=> b!635759 (= c!72543 (= lt!293878 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363643 () SeekEntryResult!6778)

(assert (=> b!635759 (= e!363644 e!363643)))

(declare-fun b!635760 () Bool)

(assert (=> b!635760 (= e!363642 Undefined!6778)))

(declare-fun d!89619 () Bool)

(declare-fun lt!293877 () SeekEntryResult!6778)

(assert (=> d!89619 (and (or ((_ is Undefined!6778) lt!293877) (not ((_ is Found!6778) lt!293877)) (and (bvsge (index!29418 lt!293877) #b00000000000000000000000000000000) (bvslt (index!29418 lt!293877) (size!18706 lt!293772)))) (or ((_ is Undefined!6778) lt!293877) ((_ is Found!6778) lt!293877) (not ((_ is MissingVacant!6778) lt!293877)) (not (= (index!29420 lt!293877) vacantSpotIndex!68)) (and (bvsge (index!29420 lt!293877) #b00000000000000000000000000000000) (bvslt (index!29420 lt!293877) (size!18706 lt!293772)))) (or ((_ is Undefined!6778) lt!293877) (ite ((_ is Found!6778) lt!293877) (= (select (arr!18341 lt!293772) (index!29418 lt!293877)) lt!293768) (and ((_ is MissingVacant!6778) lt!293877) (= (index!29420 lt!293877) vacantSpotIndex!68) (= (select (arr!18341 lt!293772) (index!29420 lt!293877)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89619 (= lt!293877 e!363642)))

(declare-fun c!72542 () Bool)

(assert (=> d!89619 (= c!72542 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89619 (= lt!293878 (select (arr!18341 lt!293772) index!984))))

(assert (=> d!89619 (validMask!0 mask!3053)))

(assert (=> d!89619 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293768 lt!293772 mask!3053) lt!293877)))

(declare-fun b!635761 () Bool)

(assert (=> b!635761 (= e!363644 (Found!6778 index!984))))

(declare-fun b!635762 () Bool)

(assert (=> b!635762 (= e!363643 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!293768 lt!293772 mask!3053))))

(declare-fun b!635763 () Bool)

(assert (=> b!635763 (= e!363643 (MissingVacant!6778 vacantSpotIndex!68))))

(assert (= (and d!89619 c!72542) b!635760))

(assert (= (and d!89619 (not c!72542)) b!635758))

(assert (= (and b!635758 c!72541) b!635761))

(assert (= (and b!635758 (not c!72541)) b!635759))

(assert (= (and b!635759 c!72543) b!635763))

(assert (= (and b!635759 (not c!72543)) b!635762))

(declare-fun m!609555 () Bool)

(assert (=> d!89619 m!609555))

(declare-fun m!609557 () Bool)

(assert (=> d!89619 m!609557))

(declare-fun m!609559 () Bool)

(assert (=> d!89619 m!609559))

(assert (=> d!89619 m!609363))

(assert (=> b!635762 m!609395))

(assert (=> b!635762 m!609395))

(declare-fun m!609561 () Bool)

(assert (=> b!635762 m!609561))

(assert (=> b!635547 d!89619))

(declare-fun b!635770 () Bool)

(declare-fun e!363648 () SeekEntryResult!6778)

(declare-fun e!363650 () SeekEntryResult!6778)

(assert (=> b!635770 (= e!363648 e!363650)))

(declare-fun c!72547 () Bool)

(declare-fun lt!293882 () (_ BitVec 64))

(assert (=> b!635770 (= c!72547 (= lt!293882 lt!293768))))

(declare-fun b!635771 () Bool)

(declare-fun c!72549 () Bool)

(assert (=> b!635771 (= c!72549 (= lt!293882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363649 () SeekEntryResult!6778)

(assert (=> b!635771 (= e!363650 e!363649)))

(declare-fun b!635772 () Bool)

(assert (=> b!635772 (= e!363648 Undefined!6778)))

(declare-fun d!89625 () Bool)

(declare-fun lt!293881 () SeekEntryResult!6778)

(assert (=> d!89625 (and (or ((_ is Undefined!6778) lt!293881) (not ((_ is Found!6778) lt!293881)) (and (bvsge (index!29418 lt!293881) #b00000000000000000000000000000000) (bvslt (index!29418 lt!293881) (size!18706 lt!293772)))) (or ((_ is Undefined!6778) lt!293881) ((_ is Found!6778) lt!293881) (not ((_ is MissingVacant!6778) lt!293881)) (not (= (index!29420 lt!293881) vacantSpotIndex!68)) (and (bvsge (index!29420 lt!293881) #b00000000000000000000000000000000) (bvslt (index!29420 lt!293881) (size!18706 lt!293772)))) (or ((_ is Undefined!6778) lt!293881) (ite ((_ is Found!6778) lt!293881) (= (select (arr!18341 lt!293772) (index!29418 lt!293881)) lt!293768) (and ((_ is MissingVacant!6778) lt!293881) (= (index!29420 lt!293881) vacantSpotIndex!68) (= (select (arr!18341 lt!293772) (index!29420 lt!293881)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89625 (= lt!293881 e!363648)))

(declare-fun c!72548 () Bool)

(assert (=> d!89625 (= c!72548 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89625 (= lt!293882 (select (arr!18341 lt!293772) lt!293777))))

(assert (=> d!89625 (validMask!0 mask!3053)))

(assert (=> d!89625 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293777 vacantSpotIndex!68 lt!293768 lt!293772 mask!3053) lt!293881)))

(declare-fun b!635773 () Bool)

(assert (=> b!635773 (= e!363650 (Found!6778 lt!293777))))

(declare-fun b!635774 () Bool)

(assert (=> b!635774 (= e!363649 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!293777 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!293768 lt!293772 mask!3053))))

(declare-fun b!635775 () Bool)

(assert (=> b!635775 (= e!363649 (MissingVacant!6778 vacantSpotIndex!68))))

(assert (= (and d!89625 c!72548) b!635772))

(assert (= (and d!89625 (not c!72548)) b!635770))

(assert (= (and b!635770 c!72547) b!635773))

(assert (= (and b!635770 (not c!72547)) b!635771))

(assert (= (and b!635771 c!72549) b!635775))

(assert (= (and b!635771 (not c!72549)) b!635774))

(declare-fun m!609569 () Bool)

(assert (=> d!89625 m!609569))

(declare-fun m!609571 () Bool)

(assert (=> d!89625 m!609571))

(declare-fun m!609573 () Bool)

(assert (=> d!89625 m!609573))

(assert (=> d!89625 m!609363))

(declare-fun m!609575 () Bool)

(assert (=> b!635774 m!609575))

(assert (=> b!635774 m!609575))

(declare-fun m!609577 () Bool)

(assert (=> b!635774 m!609577))

(assert (=> b!635547 d!89625))

(declare-fun b!635776 () Bool)

(declare-fun e!363651 () SeekEntryResult!6778)

(declare-fun e!363653 () SeekEntryResult!6778)

(assert (=> b!635776 (= e!363651 e!363653)))

(declare-fun c!72550 () Bool)

(declare-fun lt!293884 () (_ BitVec 64))

(assert (=> b!635776 (= c!72550 (= lt!293884 (select (arr!18341 a!2986) j!136)))))

(declare-fun b!635777 () Bool)

(declare-fun c!72552 () Bool)

(assert (=> b!635777 (= c!72552 (= lt!293884 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363652 () SeekEntryResult!6778)

(assert (=> b!635777 (= e!363653 e!363652)))

(declare-fun b!635778 () Bool)

(assert (=> b!635778 (= e!363651 Undefined!6778)))

(declare-fun lt!293883 () SeekEntryResult!6778)

(declare-fun d!89629 () Bool)

(assert (=> d!89629 (and (or ((_ is Undefined!6778) lt!293883) (not ((_ is Found!6778) lt!293883)) (and (bvsge (index!29418 lt!293883) #b00000000000000000000000000000000) (bvslt (index!29418 lt!293883) (size!18706 a!2986)))) (or ((_ is Undefined!6778) lt!293883) ((_ is Found!6778) lt!293883) (not ((_ is MissingVacant!6778) lt!293883)) (not (= (index!29420 lt!293883) vacantSpotIndex!68)) (and (bvsge (index!29420 lt!293883) #b00000000000000000000000000000000) (bvslt (index!29420 lt!293883) (size!18706 a!2986)))) (or ((_ is Undefined!6778) lt!293883) (ite ((_ is Found!6778) lt!293883) (= (select (arr!18341 a!2986) (index!29418 lt!293883)) (select (arr!18341 a!2986) j!136)) (and ((_ is MissingVacant!6778) lt!293883) (= (index!29420 lt!293883) vacantSpotIndex!68) (= (select (arr!18341 a!2986) (index!29420 lt!293883)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89629 (= lt!293883 e!363651)))

(declare-fun c!72551 () Bool)

(assert (=> d!89629 (= c!72551 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89629 (= lt!293884 (select (arr!18341 a!2986) lt!293777))))

(assert (=> d!89629 (validMask!0 mask!3053)))

(assert (=> d!89629 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293777 vacantSpotIndex!68 (select (arr!18341 a!2986) j!136) a!2986 mask!3053) lt!293883)))

(declare-fun b!635779 () Bool)

(assert (=> b!635779 (= e!363653 (Found!6778 lt!293777))))

(declare-fun b!635780 () Bool)

(assert (=> b!635780 (= e!363652 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!293777 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18341 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635781 () Bool)

(assert (=> b!635781 (= e!363652 (MissingVacant!6778 vacantSpotIndex!68))))

(assert (= (and d!89629 c!72551) b!635778))

(assert (= (and d!89629 (not c!72551)) b!635776))

(assert (= (and b!635776 c!72550) b!635779))

(assert (= (and b!635776 (not c!72550)) b!635777))

(assert (= (and b!635777 c!72552) b!635781))

(assert (= (and b!635777 (not c!72552)) b!635780))

(declare-fun m!609579 () Bool)

(assert (=> d!89629 m!609579))

(declare-fun m!609581 () Bool)

(assert (=> d!89629 m!609581))

(declare-fun m!609583 () Bool)

(assert (=> d!89629 m!609583))

(assert (=> d!89629 m!609363))

(assert (=> b!635780 m!609575))

(assert (=> b!635780 m!609575))

(assert (=> b!635780 m!609367))

(declare-fun m!609585 () Bool)

(assert (=> b!635780 m!609585))

(assert (=> b!635547 d!89629))

(declare-fun d!89631 () Bool)

(declare-fun lt!293887 () (_ BitVec 32))

(assert (=> d!89631 (and (bvsge lt!293887 #b00000000000000000000000000000000) (bvslt lt!293887 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89631 (= lt!293887 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89631 (validMask!0 mask!3053)))

(assert (=> d!89631 (= (nextIndex!0 index!984 x!910 mask!3053) lt!293887)))

(declare-fun bs!19074 () Bool)

(assert (= bs!19074 d!89631))

(declare-fun m!609587 () Bool)

(assert (=> bs!19074 m!609587))

(assert (=> bs!19074 m!609363))

(assert (=> b!635547 d!89631))

(declare-fun d!89633 () Bool)

(declare-fun res!411418 () Bool)

(declare-fun e!363670 () Bool)

(assert (=> d!89633 (=> res!411418 e!363670)))

(assert (=> d!89633 (= res!411418 (= (select (arr!18341 lt!293772) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18341 a!2986) j!136)))))

(assert (=> d!89633 (= (arrayContainsKey!0 lt!293772 (select (arr!18341 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!363670)))

(declare-fun b!635806 () Bool)

(declare-fun e!363671 () Bool)

(assert (=> b!635806 (= e!363670 e!363671)))

(declare-fun res!411419 () Bool)

(assert (=> b!635806 (=> (not res!411419) (not e!363671))))

(assert (=> b!635806 (= res!411419 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18706 lt!293772)))))

(declare-fun b!635807 () Bool)

(assert (=> b!635807 (= e!363671 (arrayContainsKey!0 lt!293772 (select (arr!18341 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89633 (not res!411418)) b!635806))

(assert (= (and b!635806 res!411419) b!635807))

(declare-fun m!609589 () Bool)

(assert (=> d!89633 m!609589))

(assert (=> b!635807 m!609367))

(declare-fun m!609591 () Bool)

(assert (=> b!635807 m!609591))

(assert (=> b!635537 d!89633))

(declare-fun d!89635 () Bool)

(assert (=> d!89635 (arrayContainsKey!0 lt!293772 (select (arr!18341 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293900 () Unit!21440)

(declare-fun choose!114 (array!38229 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21440)

(assert (=> d!89635 (= lt!293900 (choose!114 lt!293772 (select (arr!18341 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!89635 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!89635 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293772 (select (arr!18341 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!293900)))

(declare-fun bs!19075 () Bool)

(assert (= bs!19075 d!89635))

(assert (=> bs!19075 m!609367))

(assert (=> bs!19075 m!609369))

(assert (=> bs!19075 m!609367))

(declare-fun m!609593 () Bool)

(assert (=> bs!19075 m!609593))

(assert (=> b!635537 d!89635))

(declare-fun d!89637 () Bool)

(assert (=> d!89637 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57428 d!89637))

(declare-fun d!89655 () Bool)

(assert (=> d!89655 (= (array_inv!14224 a!2986) (bvsge (size!18706 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57428 d!89655))

(declare-fun d!89657 () Bool)

(assert (=> d!89657 (= (validKeyInArray!0 (select (arr!18341 a!2986) j!136)) (and (not (= (select (arr!18341 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18341 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!635548 d!89657))

(declare-fun b!635851 () Bool)

(declare-fun e!363702 () SeekEntryResult!6778)

(declare-fun e!363704 () SeekEntryResult!6778)

(assert (=> b!635851 (= e!363702 e!363704)))

(declare-fun c!72574 () Bool)

(declare-fun lt!293914 () (_ BitVec 64))

(assert (=> b!635851 (= c!72574 (= lt!293914 (select (arr!18341 a!2986) j!136)))))

(declare-fun b!635852 () Bool)

(declare-fun c!72576 () Bool)

(assert (=> b!635852 (= c!72576 (= lt!293914 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363703 () SeekEntryResult!6778)

(assert (=> b!635852 (= e!363704 e!363703)))

(declare-fun b!635853 () Bool)

(assert (=> b!635853 (= e!363702 Undefined!6778)))

(declare-fun d!89659 () Bool)

(declare-fun lt!293913 () SeekEntryResult!6778)

(assert (=> d!89659 (and (or ((_ is Undefined!6778) lt!293913) (not ((_ is Found!6778) lt!293913)) (and (bvsge (index!29418 lt!293913) #b00000000000000000000000000000000) (bvslt (index!29418 lt!293913) (size!18706 a!2986)))) (or ((_ is Undefined!6778) lt!293913) ((_ is Found!6778) lt!293913) (not ((_ is MissingVacant!6778) lt!293913)) (not (= (index!29420 lt!293913) vacantSpotIndex!68)) (and (bvsge (index!29420 lt!293913) #b00000000000000000000000000000000) (bvslt (index!29420 lt!293913) (size!18706 a!2986)))) (or ((_ is Undefined!6778) lt!293913) (ite ((_ is Found!6778) lt!293913) (= (select (arr!18341 a!2986) (index!29418 lt!293913)) (select (arr!18341 a!2986) j!136)) (and ((_ is MissingVacant!6778) lt!293913) (= (index!29420 lt!293913) vacantSpotIndex!68) (= (select (arr!18341 a!2986) (index!29420 lt!293913)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89659 (= lt!293913 e!363702)))

(declare-fun c!72575 () Bool)

(assert (=> d!89659 (= c!72575 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89659 (= lt!293914 (select (arr!18341 a!2986) index!984))))

(assert (=> d!89659 (validMask!0 mask!3053)))

(assert (=> d!89659 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18341 a!2986) j!136) a!2986 mask!3053) lt!293913)))

(declare-fun b!635854 () Bool)

(assert (=> b!635854 (= e!363704 (Found!6778 index!984))))

(declare-fun b!635855 () Bool)

(assert (=> b!635855 (= e!363703 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18341 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635856 () Bool)

(assert (=> b!635856 (= e!363703 (MissingVacant!6778 vacantSpotIndex!68))))

(assert (= (and d!89659 c!72575) b!635853))

(assert (= (and d!89659 (not c!72575)) b!635851))

(assert (= (and b!635851 c!72574) b!635854))

(assert (= (and b!635851 (not c!72574)) b!635852))

(assert (= (and b!635852 c!72576) b!635856))

(assert (= (and b!635852 (not c!72576)) b!635855))

(declare-fun m!609647 () Bool)

(assert (=> d!89659 m!609647))

(declare-fun m!609649 () Bool)

(assert (=> d!89659 m!609649))

(assert (=> d!89659 m!609377))

(assert (=> d!89659 m!609363))

(assert (=> b!635855 m!609395))

(assert (=> b!635855 m!609395))

(assert (=> b!635855 m!609367))

(declare-fun m!609651 () Bool)

(assert (=> b!635855 m!609651))

(assert (=> b!635539 d!89659))

(declare-fun d!89665 () Bool)

(declare-fun res!411439 () Bool)

(declare-fun e!363710 () Bool)

(assert (=> d!89665 (=> res!411439 e!363710)))

(assert (=> d!89665 (= res!411439 (= (select (arr!18341 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89665 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!363710)))

(declare-fun b!635865 () Bool)

(declare-fun e!363711 () Bool)

(assert (=> b!635865 (= e!363710 e!363711)))

(declare-fun res!411440 () Bool)

(assert (=> b!635865 (=> (not res!411440) (not e!363711))))

(assert (=> b!635865 (= res!411440 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18706 a!2986)))))

(declare-fun b!635866 () Bool)

(assert (=> b!635866 (= e!363711 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89665 (not res!411439)) b!635865))

(assert (= (and b!635865 res!411440) b!635866))

(assert (=> d!89665 m!609513))

(declare-fun m!609653 () Bool)

(assert (=> b!635866 m!609653))

(assert (=> b!635550 d!89665))

(declare-fun d!89667 () Bool)

(declare-fun res!411441 () Bool)

(declare-fun e!363712 () Bool)

(assert (=> d!89667 (=> res!411441 e!363712)))

(assert (=> d!89667 (= res!411441 (= (select (arr!18341 lt!293772) j!136) (select (arr!18341 a!2986) j!136)))))

(assert (=> d!89667 (= (arrayContainsKey!0 lt!293772 (select (arr!18341 a!2986) j!136) j!136) e!363712)))

(declare-fun b!635867 () Bool)

(declare-fun e!363713 () Bool)

(assert (=> b!635867 (= e!363712 e!363713)))

(declare-fun res!411442 () Bool)

(assert (=> b!635867 (=> (not res!411442) (not e!363713))))

(assert (=> b!635867 (= res!411442 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18706 lt!293772)))))

(declare-fun b!635868 () Bool)

(assert (=> b!635868 (= e!363713 (arrayContainsKey!0 lt!293772 (select (arr!18341 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89667 (not res!411441)) b!635867))

(assert (= (and b!635867 res!411442) b!635868))

(declare-fun m!609663 () Bool)

(assert (=> d!89667 m!609663))

(assert (=> b!635868 m!609367))

(declare-fun m!609667 () Bool)

(assert (=> b!635868 m!609667))

(assert (=> b!635540 d!89667))

(declare-fun d!89671 () Bool)

(declare-fun res!411447 () Bool)

(declare-fun e!363718 () Bool)

(assert (=> d!89671 (=> res!411447 e!363718)))

(assert (=> d!89671 (= res!411447 ((_ is Nil!12418) Nil!12418))))

(assert (=> d!89671 (= (noDuplicate!380 Nil!12418) e!363718)))

(declare-fun b!635873 () Bool)

(declare-fun e!363719 () Bool)

(assert (=> b!635873 (= e!363718 e!363719)))

(declare-fun res!411448 () Bool)

(assert (=> b!635873 (=> (not res!411448) (not e!363719))))

(assert (=> b!635873 (= res!411448 (not (contains!3082 (t!18640 Nil!12418) (h!13462 Nil!12418))))))

(declare-fun b!635874 () Bool)

(assert (=> b!635874 (= e!363719 (noDuplicate!380 (t!18640 Nil!12418)))))

(assert (= (and d!89671 (not res!411447)) b!635873))

(assert (= (and b!635873 res!411448) b!635874))

(declare-fun m!609671 () Bool)

(assert (=> b!635873 m!609671))

(declare-fun m!609673 () Bool)

(assert (=> b!635874 m!609673))

(assert (=> b!635551 d!89671))

(declare-fun d!89677 () Bool)

(declare-fun res!411449 () Bool)

(declare-fun e!363720 () Bool)

(assert (=> d!89677 (=> res!411449 e!363720)))

(assert (=> d!89677 (= res!411449 (= (select (arr!18341 lt!293772) index!984) (select (arr!18341 a!2986) j!136)))))

(assert (=> d!89677 (= (arrayContainsKey!0 lt!293772 (select (arr!18341 a!2986) j!136) index!984) e!363720)))

(declare-fun b!635875 () Bool)

(declare-fun e!363721 () Bool)

(assert (=> b!635875 (= e!363720 e!363721)))

(declare-fun res!411450 () Bool)

(assert (=> b!635875 (=> (not res!411450) (not e!363721))))

(assert (=> b!635875 (= res!411450 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18706 lt!293772)))))

(declare-fun b!635876 () Bool)

(assert (=> b!635876 (= e!363721 (arrayContainsKey!0 lt!293772 (select (arr!18341 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!89677 (not res!411449)) b!635875))

(assert (= (and b!635875 res!411450) b!635876))

(assert (=> d!89677 m!609559))

(assert (=> b!635876 m!609367))

(declare-fun m!609675 () Bool)

(assert (=> b!635876 m!609675))

(assert (=> b!635552 d!89677))

(declare-fun d!89681 () Bool)

(assert (=> d!89681 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!635543 d!89681))

(check-sat (not b!635855) (not b!635687) (not b!635873) (not d!89631) (not b!635718) (not b!635762) (not bm!33385) (not b!635774) (not b!635807) (not d!89625) (not b!635707) (not d!89613) (not b!635688) (not d!89619) (not bm!33388) (not b!635780) (not d!89629) (not d!89635) (not d!89659) (not b!635868) (not b!635866) (not d!89609) (not b!635689) (not b!635720) (not b!635874) (not b!635876) (not b!635730))
(check-sat)
