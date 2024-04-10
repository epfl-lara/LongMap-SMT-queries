; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57824 () Bool)

(assert start!57824)

(declare-fun b!639761 () Bool)

(declare-datatypes ((Unit!21630 0))(
  ( (Unit!21631) )
))
(declare-fun e!366174 () Unit!21630)

(declare-fun Unit!21632 () Unit!21630)

(assert (=> b!639761 (= e!366174 Unit!21632)))

(assert (=> b!639761 false))

(declare-fun b!639763 () Bool)

(declare-fun res!414271 () Bool)

(declare-fun e!366173 () Bool)

(assert (=> b!639763 (=> (not res!414271) (not e!366173))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38326 0))(
  ( (array!38327 (arr!18384 (Array (_ BitVec 32) (_ BitVec 64))) (size!18748 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38326)

(assert (=> b!639763 (= res!414271 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18384 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639764 () Bool)

(declare-fun res!414281 () Bool)

(declare-fun e!366166 () Bool)

(assert (=> b!639764 (=> (not res!414281) (not e!366166))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639764 (= res!414281 (validKeyInArray!0 k!1786))))

(declare-fun b!639765 () Bool)

(declare-fun res!414277 () Bool)

(assert (=> b!639765 (=> (not res!414277) (not e!366173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38326 (_ BitVec 32)) Bool)

(assert (=> b!639765 (= res!414277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639766 () Bool)

(declare-fun res!414280 () Bool)

(assert (=> b!639766 (=> (not res!414280) (not e!366166))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!639766 (= res!414280 (validKeyInArray!0 (select (arr!18384 a!2986) j!136)))))

(declare-fun b!639767 () Bool)

(declare-fun e!366165 () Bool)

(declare-datatypes ((SeekEntryResult!6824 0))(
  ( (MissingZero!6824 (index!29613 (_ BitVec 32))) (Found!6824 (index!29614 (_ BitVec 32))) (Intermediate!6824 (undefined!7636 Bool) (index!29615 (_ BitVec 32)) (x!58371 (_ BitVec 32))) (Undefined!6824) (MissingVacant!6824 (index!29616 (_ BitVec 32))) )
))
(declare-fun lt!296029 () SeekEntryResult!6824)

(declare-fun lt!296017 () SeekEntryResult!6824)

(assert (=> b!639767 (= e!366165 (= lt!296029 lt!296017))))

(declare-fun b!639768 () Bool)

(declare-fun e!366168 () Bool)

(declare-fun e!366167 () Bool)

(assert (=> b!639768 (= e!366168 e!366167)))

(declare-fun res!414276 () Bool)

(assert (=> b!639768 (=> res!414276 e!366167)))

(declare-fun lt!296024 () (_ BitVec 64))

(declare-fun lt!296026 () (_ BitVec 64))

(assert (=> b!639768 (= res!414276 (or (not (= (select (arr!18384 a!2986) j!136) lt!296026)) (not (= (select (arr!18384 a!2986) j!136) lt!296024)) (bvsge j!136 index!984)))))

(declare-fun e!366172 () Bool)

(assert (=> b!639768 e!366172))

(declare-fun res!414273 () Bool)

(assert (=> b!639768 (=> (not res!414273) (not e!366172))))

(assert (=> b!639768 (= res!414273 (= lt!296024 (select (arr!18384 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!639768 (= lt!296024 (select (store (arr!18384 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!639769 () Bool)

(declare-fun res!414278 () Bool)

(assert (=> b!639769 (=> (not res!414278) (not e!366173))))

(declare-datatypes ((List!12425 0))(
  ( (Nil!12422) (Cons!12421 (h!13466 (_ BitVec 64)) (t!18653 List!12425)) )
))
(declare-fun arrayNoDuplicates!0 (array!38326 (_ BitVec 32) List!12425) Bool)

(assert (=> b!639769 (= res!414278 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12422))))

(declare-fun b!639770 () Bool)

(declare-fun e!366171 () Bool)

(assert (=> b!639770 (= e!366172 e!366171)))

(declare-fun res!414287 () Bool)

(assert (=> b!639770 (=> res!414287 e!366171)))

(assert (=> b!639770 (= res!414287 (or (not (= (select (arr!18384 a!2986) j!136) lt!296026)) (not (= (select (arr!18384 a!2986) j!136) lt!296024)) (bvsge j!136 index!984)))))

(declare-fun b!639771 () Bool)

(declare-fun e!366170 () Bool)

(assert (=> b!639771 (= e!366173 e!366170)))

(declare-fun res!414279 () Bool)

(assert (=> b!639771 (=> (not res!414279) (not e!366170))))

(assert (=> b!639771 (= res!414279 (= (select (store (arr!18384 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!296027 () array!38326)

(assert (=> b!639771 (= lt!296027 (array!38327 (store (arr!18384 a!2986) i!1108 k!1786) (size!18748 a!2986)))))

(declare-fun b!639762 () Bool)

(declare-fun e!366169 () Bool)

(assert (=> b!639762 (= e!366169 (not e!366168))))

(declare-fun res!414272 () Bool)

(assert (=> b!639762 (=> res!414272 e!366168)))

(declare-fun lt!296018 () SeekEntryResult!6824)

(assert (=> b!639762 (= res!414272 (not (= lt!296018 (Found!6824 index!984))))))

(declare-fun lt!296021 () Unit!21630)

(assert (=> b!639762 (= lt!296021 e!366174)))

(declare-fun c!73112 () Bool)

(assert (=> b!639762 (= c!73112 (= lt!296018 Undefined!6824))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38326 (_ BitVec 32)) SeekEntryResult!6824)

(assert (=> b!639762 (= lt!296018 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296026 lt!296027 mask!3053))))

(assert (=> b!639762 e!366165))

(declare-fun res!414284 () Bool)

(assert (=> b!639762 (=> (not res!414284) (not e!366165))))

(declare-fun lt!296023 () (_ BitVec 32))

(assert (=> b!639762 (= res!414284 (= lt!296017 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296023 vacantSpotIndex!68 lt!296026 lt!296027 mask!3053)))))

(assert (=> b!639762 (= lt!296017 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296023 vacantSpotIndex!68 (select (arr!18384 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639762 (= lt!296026 (select (store (arr!18384 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!296022 () Unit!21630)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38326 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21630)

(assert (=> b!639762 (= lt!296022 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296023 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639762 (= lt!296023 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!414285 () Bool)

(assert (=> start!57824 (=> (not res!414285) (not e!366166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57824 (= res!414285 (validMask!0 mask!3053))))

(assert (=> start!57824 e!366166))

(assert (=> start!57824 true))

(declare-fun array_inv!14180 (array!38326) Bool)

(assert (=> start!57824 (array_inv!14180 a!2986)))

(declare-fun b!639772 () Bool)

(assert (=> b!639772 (= e!366166 e!366173)))

(declare-fun res!414283 () Bool)

(assert (=> b!639772 (=> (not res!414283) (not e!366173))))

(declare-fun lt!296028 () SeekEntryResult!6824)

(assert (=> b!639772 (= res!414283 (or (= lt!296028 (MissingZero!6824 i!1108)) (= lt!296028 (MissingVacant!6824 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38326 (_ BitVec 32)) SeekEntryResult!6824)

(assert (=> b!639772 (= lt!296028 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!639773 () Bool)

(declare-fun res!414275 () Bool)

(assert (=> b!639773 (=> (not res!414275) (not e!366166))))

(assert (=> b!639773 (= res!414275 (and (= (size!18748 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18748 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18748 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639774 () Bool)

(declare-fun res!414274 () Bool)

(assert (=> b!639774 (=> (not res!414274) (not e!366166))))

(declare-fun arrayContainsKey!0 (array!38326 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639774 (= res!414274 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639775 () Bool)

(assert (=> b!639775 (= e!366170 e!366169)))

(declare-fun res!414286 () Bool)

(assert (=> b!639775 (=> (not res!414286) (not e!366169))))

(assert (=> b!639775 (= res!414286 (and (= lt!296029 (Found!6824 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18384 a!2986) index!984) (select (arr!18384 a!2986) j!136))) (not (= (select (arr!18384 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!639775 (= lt!296029 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18384 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639776 () Bool)

(assert (=> b!639776 (= e!366167 (bvslt (size!18748 a!2986) #b01111111111111111111111111111111))))

(assert (=> b!639776 (arrayNoDuplicates!0 lt!296027 j!136 Nil!12422)))

(declare-fun lt!296025 () Unit!21630)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38326 (_ BitVec 32) (_ BitVec 32)) Unit!21630)

(assert (=> b!639776 (= lt!296025 (lemmaNoDuplicateFromThenFromBigger!0 lt!296027 #b00000000000000000000000000000000 j!136))))

(assert (=> b!639776 (arrayNoDuplicates!0 lt!296027 #b00000000000000000000000000000000 Nil!12422)))

(declare-fun lt!296020 () Unit!21630)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38326 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12425) Unit!21630)

(assert (=> b!639776 (= lt!296020 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12422))))

(assert (=> b!639776 (arrayContainsKey!0 lt!296027 (select (arr!18384 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296019 () Unit!21630)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38326 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21630)

(assert (=> b!639776 (= lt!296019 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296027 (select (arr!18384 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!639777 () Bool)

(declare-fun e!366163 () Bool)

(assert (=> b!639777 (= e!366171 e!366163)))

(declare-fun res!414282 () Bool)

(assert (=> b!639777 (=> (not res!414282) (not e!366163))))

(assert (=> b!639777 (= res!414282 (arrayContainsKey!0 lt!296027 (select (arr!18384 a!2986) j!136) j!136))))

(declare-fun b!639778 () Bool)

(declare-fun Unit!21633 () Unit!21630)

(assert (=> b!639778 (= e!366174 Unit!21633)))

(declare-fun b!639779 () Bool)

(assert (=> b!639779 (= e!366163 (arrayContainsKey!0 lt!296027 (select (arr!18384 a!2986) j!136) index!984))))

(assert (= (and start!57824 res!414285) b!639773))

(assert (= (and b!639773 res!414275) b!639766))

(assert (= (and b!639766 res!414280) b!639764))

(assert (= (and b!639764 res!414281) b!639774))

(assert (= (and b!639774 res!414274) b!639772))

(assert (= (and b!639772 res!414283) b!639765))

(assert (= (and b!639765 res!414277) b!639769))

(assert (= (and b!639769 res!414278) b!639763))

(assert (= (and b!639763 res!414271) b!639771))

(assert (= (and b!639771 res!414279) b!639775))

(assert (= (and b!639775 res!414286) b!639762))

(assert (= (and b!639762 res!414284) b!639767))

(assert (= (and b!639762 c!73112) b!639761))

(assert (= (and b!639762 (not c!73112)) b!639778))

(assert (= (and b!639762 (not res!414272)) b!639768))

(assert (= (and b!639768 res!414273) b!639770))

(assert (= (and b!639770 (not res!414287)) b!639777))

(assert (= (and b!639777 res!414282) b!639779))

(assert (= (and b!639768 (not res!414276)) b!639776))

(declare-fun m!613607 () Bool)

(assert (=> start!57824 m!613607))

(declare-fun m!613609 () Bool)

(assert (=> start!57824 m!613609))

(declare-fun m!613611 () Bool)

(assert (=> b!639763 m!613611))

(declare-fun m!613613 () Bool)

(assert (=> b!639764 m!613613))

(declare-fun m!613615 () Bool)

(assert (=> b!639769 m!613615))

(declare-fun m!613617 () Bool)

(assert (=> b!639779 m!613617))

(assert (=> b!639779 m!613617))

(declare-fun m!613619 () Bool)

(assert (=> b!639779 m!613619))

(assert (=> b!639770 m!613617))

(declare-fun m!613621 () Bool)

(assert (=> b!639774 m!613621))

(assert (=> b!639768 m!613617))

(declare-fun m!613623 () Bool)

(assert (=> b!639768 m!613623))

(declare-fun m!613625 () Bool)

(assert (=> b!639768 m!613625))

(assert (=> b!639766 m!613617))

(assert (=> b!639766 m!613617))

(declare-fun m!613627 () Bool)

(assert (=> b!639766 m!613627))

(assert (=> b!639771 m!613623))

(declare-fun m!613629 () Bool)

(assert (=> b!639771 m!613629))

(assert (=> b!639777 m!613617))

(assert (=> b!639777 m!613617))

(declare-fun m!613631 () Bool)

(assert (=> b!639777 m!613631))

(declare-fun m!613633 () Bool)

(assert (=> b!639762 m!613633))

(declare-fun m!613635 () Bool)

(assert (=> b!639762 m!613635))

(assert (=> b!639762 m!613617))

(declare-fun m!613637 () Bool)

(assert (=> b!639762 m!613637))

(assert (=> b!639762 m!613617))

(declare-fun m!613639 () Bool)

(assert (=> b!639762 m!613639))

(assert (=> b!639762 m!613623))

(declare-fun m!613641 () Bool)

(assert (=> b!639762 m!613641))

(declare-fun m!613643 () Bool)

(assert (=> b!639762 m!613643))

(declare-fun m!613645 () Bool)

(assert (=> b!639765 m!613645))

(declare-fun m!613647 () Bool)

(assert (=> b!639772 m!613647))

(declare-fun m!613649 () Bool)

(assert (=> b!639776 m!613649))

(assert (=> b!639776 m!613617))

(declare-fun m!613651 () Bool)

(assert (=> b!639776 m!613651))

(declare-fun m!613653 () Bool)

(assert (=> b!639776 m!613653))

(assert (=> b!639776 m!613617))

(declare-fun m!613655 () Bool)

(assert (=> b!639776 m!613655))

(assert (=> b!639776 m!613617))

(declare-fun m!613657 () Bool)

(assert (=> b!639776 m!613657))

(declare-fun m!613659 () Bool)

(assert (=> b!639776 m!613659))

(declare-fun m!613661 () Bool)

(assert (=> b!639775 m!613661))

(assert (=> b!639775 m!613617))

(assert (=> b!639775 m!613617))

(declare-fun m!613663 () Bool)

(assert (=> b!639775 m!613663))

(push 1)

(assert (not b!639775))

(assert (not b!639764))

(assert (not b!639776))

(assert (not b!639766))

(assert (not b!639765))

(assert (not b!639762))

(assert (not b!639769))

(assert (not start!57824))

(assert (not b!639779))

(assert (not b!639777))

(assert (not b!639772))

(assert (not b!639774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!33488 () Bool)

(declare-fun call!33491 () Bool)

(declare-fun c!73141 () Bool)

(assert (=> bm!33488 (= call!33491 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73141 (Cons!12421 (select (arr!18384 a!2986) #b00000000000000000000000000000000) Nil!12422) Nil!12422)))))

(declare-fun b!639948 () Bool)

(declare-fun e!366280 () Bool)

(declare-fun e!366282 () Bool)

(assert (=> b!639948 (= e!366280 e!366282)))

(assert (=> b!639948 (= c!73141 (validKeyInArray!0 (select (arr!18384 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!639949 () Bool)

(assert (=> b!639949 (= e!366282 call!33491)))

(declare-fun b!639950 () Bool)

(declare-fun e!366279 () Bool)

(assert (=> b!639950 (= e!366279 e!366280)))

(declare-fun res!414400 () Bool)

(assert (=> b!639950 (=> (not res!414400) (not e!366280))))

(declare-fun e!366281 () Bool)

(assert (=> b!639950 (= res!414400 (not e!366281))))

(declare-fun res!414401 () Bool)

(assert (=> b!639950 (=> (not res!414401) (not e!366281))))

(assert (=> b!639950 (= res!414401 (validKeyInArray!0 (select (arr!18384 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90351 () Bool)

(declare-fun res!414402 () Bool)

(assert (=> d!90351 (=> res!414402 e!366279)))

(assert (=> d!90351 (= res!414402 (bvsge #b00000000000000000000000000000000 (size!18748 a!2986)))))

(assert (=> d!90351 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12422) e!366279)))

(declare-fun b!639951 () Bool)

(declare-fun contains!3125 (List!12425 (_ BitVec 64)) Bool)

(assert (=> b!639951 (= e!366281 (contains!3125 Nil!12422 (select (arr!18384 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!639952 () Bool)

(assert (=> b!639952 (= e!366282 call!33491)))

(assert (= (and d!90351 (not res!414402)) b!639950))

(assert (= (and b!639950 res!414401) b!639951))

(assert (= (and b!639950 res!414400) b!639948))

(assert (= (and b!639948 c!73141) b!639949))

(assert (= (and b!639948 (not c!73141)) b!639952))

(assert (= (or b!639949 b!639952) bm!33488))

(declare-fun m!613801 () Bool)

(assert (=> bm!33488 m!613801))

(declare-fun m!613803 () Bool)

(assert (=> bm!33488 m!613803))

(assert (=> b!639948 m!613801))

(assert (=> b!639948 m!613801))

(declare-fun m!613805 () Bool)

(assert (=> b!639948 m!613805))

(assert (=> b!639950 m!613801))

(assert (=> b!639950 m!613801))

(assert (=> b!639950 m!613805))

(assert (=> b!639951 m!613801))

(assert (=> b!639951 m!613801))

(declare-fun m!613807 () Bool)

(assert (=> b!639951 m!613807))

(assert (=> b!639769 d!90351))

(declare-fun d!90357 () Bool)

(declare-fun res!414413 () Bool)

(declare-fun e!366294 () Bool)

(assert (=> d!90357 (=> res!414413 e!366294)))

(assert (=> d!90357 (= res!414413 (= (select (arr!18384 lt!296027) index!984) (select (arr!18384 a!2986) j!136)))))

(assert (=> d!90357 (= (arrayContainsKey!0 lt!296027 (select (arr!18384 a!2986) j!136) index!984) e!366294)))

(declare-fun b!639965 () Bool)

(declare-fun e!366295 () Bool)

(assert (=> b!639965 (= e!366294 e!366295)))

(declare-fun res!414414 () Bool)

(assert (=> b!639965 (=> (not res!414414) (not e!366295))))

(assert (=> b!639965 (= res!414414 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18748 lt!296027)))))

(declare-fun b!639966 () Bool)

(assert (=> b!639966 (= e!366295 (arrayContainsKey!0 lt!296027 (select (arr!18384 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90357 (not res!414413)) b!639965))

(assert (= (and b!639965 res!414414) b!639966))

(declare-fun m!613821 () Bool)

(assert (=> d!90357 m!613821))

(assert (=> b!639966 m!613617))

(declare-fun m!613823 () Bool)

(assert (=> b!639966 m!613823))

(assert (=> b!639779 d!90357))

(declare-fun d!90363 () Bool)

(assert (=> d!90363 (= (validKeyInArray!0 (select (arr!18384 a!2986) j!136)) (and (not (= (select (arr!18384 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18384 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!639766 d!90363))

(declare-fun d!90369 () Bool)

(declare-fun res!414417 () Bool)

(declare-fun e!366298 () Bool)

(assert (=> d!90369 (=> res!414417 e!366298)))

(assert (=> d!90369 (= res!414417 (= (select (arr!18384 lt!296027) j!136) (select (arr!18384 a!2986) j!136)))))

(assert (=> d!90369 (= (arrayContainsKey!0 lt!296027 (select (arr!18384 a!2986) j!136) j!136) e!366298)))

(declare-fun b!639969 () Bool)

(declare-fun e!366299 () Bool)

(assert (=> b!639969 (= e!366298 e!366299)))

(declare-fun res!414418 () Bool)

(assert (=> b!639969 (=> (not res!414418) (not e!366299))))

(assert (=> b!639969 (= res!414418 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18748 lt!296027)))))

(declare-fun b!639970 () Bool)

(assert (=> b!639970 (= e!366299 (arrayContainsKey!0 lt!296027 (select (arr!18384 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90369 (not res!414417)) b!639969))

(assert (= (and b!639969 res!414418) b!639970))

(declare-fun m!613829 () Bool)

(assert (=> d!90369 m!613829))

(assert (=> b!639970 m!613617))

(declare-fun m!613831 () Bool)

(assert (=> b!639970 m!613831))

(assert (=> b!639777 d!90369))

(declare-fun bm!33501 () Bool)

(declare-fun call!33504 () Bool)

(assert (=> bm!33501 (= call!33504 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!640018 () Bool)

(declare-fun e!366340 () Bool)

(assert (=> b!640018 (= e!366340 call!33504)))

(declare-fun d!90371 () Bool)

(declare-fun res!414449 () Bool)

(declare-fun e!366338 () Bool)

(assert (=> d!90371 (=> res!414449 e!366338)))

(assert (=> d!90371 (= res!414449 (bvsge #b00000000000000000000000000000000 (size!18748 a!2986)))))

(assert (=> d!90371 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!366338)))

(declare-fun b!640019 () Bool)

(declare-fun e!366339 () Bool)

(assert (=> b!640019 (= e!366339 e!366340)))

(declare-fun lt!296138 () (_ BitVec 64))

(assert (=> b!640019 (= lt!296138 (select (arr!18384 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!296139 () Unit!21630)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38326 (_ BitVec 64) (_ BitVec 32)) Unit!21630)

(assert (=> b!640019 (= lt!296139 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!296138 #b00000000000000000000000000000000))))

(assert (=> b!640019 (arrayContainsKey!0 a!2986 lt!296138 #b00000000000000000000000000000000)))

(declare-fun lt!296140 () Unit!21630)

(assert (=> b!640019 (= lt!296140 lt!296139)))

(declare-fun res!414448 () Bool)

(assert (=> b!640019 (= res!414448 (= (seekEntryOrOpen!0 (select (arr!18384 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6824 #b00000000000000000000000000000000)))))

(assert (=> b!640019 (=> (not res!414448) (not e!366340))))

(declare-fun b!640020 () Bool)

(assert (=> b!640020 (= e!366338 e!366339)))

(declare-fun c!73152 () Bool)

(assert (=> b!640020 (= c!73152 (validKeyInArray!0 (select (arr!18384 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!640021 () Bool)

(assert (=> b!640021 (= e!366339 call!33504)))

(assert (= (and d!90371 (not res!414449)) b!640020))

(assert (= (and b!640020 c!73152) b!640019))

(assert (= (and b!640020 (not c!73152)) b!640021))

(assert (= (and b!640019 res!414448) b!640018))

(assert (= (or b!640018 b!640021) bm!33501))

(declare-fun m!613855 () Bool)

(assert (=> bm!33501 m!613855))

(assert (=> b!640019 m!613801))

(declare-fun m!613857 () Bool)

(assert (=> b!640019 m!613857))

(declare-fun m!613859 () Bool)

(assert (=> b!640019 m!613859))

(assert (=> b!640019 m!613801))

(declare-fun m!613861 () Bool)

(assert (=> b!640019 m!613861))

(assert (=> b!640020 m!613801))

(assert (=> b!640020 m!613801))

(assert (=> b!640020 m!613805))

(assert (=> b!639765 d!90371))

(declare-fun d!90383 () Bool)

(declare-fun res!414454 () Bool)

(declare-fun e!366345 () Bool)

(assert (=> d!90383 (=> res!414454 e!366345)))

(assert (=> d!90383 (= res!414454 (= (select (arr!18384 lt!296027) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18384 a!2986) j!136)))))

(assert (=> d!90383 (= (arrayContainsKey!0 lt!296027 (select (arr!18384 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!366345)))

(declare-fun b!640026 () Bool)

(declare-fun e!366346 () Bool)

(assert (=> b!640026 (= e!366345 e!366346)))

(declare-fun res!414455 () Bool)

(assert (=> b!640026 (=> (not res!414455) (not e!366346))))

(assert (=> b!640026 (= res!414455 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18748 lt!296027)))))

(declare-fun b!640027 () Bool)

(assert (=> b!640027 (= e!366346 (arrayContainsKey!0 lt!296027 (select (arr!18384 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90383 (not res!414454)) b!640026))

(assert (= (and b!640026 res!414455) b!640027))

(declare-fun m!613867 () Bool)

(assert (=> d!90383 m!613867))

(assert (=> b!640027 m!613617))

(declare-fun m!613869 () Bool)

(assert (=> b!640027 m!613869))

(assert (=> b!639776 d!90383))

(declare-fun bm!33502 () Bool)

(declare-fun call!33505 () Bool)

(declare-fun c!73153 () Bool)

(assert (=> bm!33502 (= call!33505 (arrayNoDuplicates!0 lt!296027 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73153 (Cons!12421 (select (arr!18384 lt!296027) #b00000000000000000000000000000000) Nil!12422) Nil!12422)))))

(declare-fun b!640028 () Bool)

(declare-fun e!366348 () Bool)

(declare-fun e!366350 () Bool)

(assert (=> b!640028 (= e!366348 e!366350)))

(assert (=> b!640028 (= c!73153 (validKeyInArray!0 (select (arr!18384 lt!296027) #b00000000000000000000000000000000)))))

(declare-fun b!640029 () Bool)

(assert (=> b!640029 (= e!366350 call!33505)))

(declare-fun b!640030 () Bool)

(declare-fun e!366347 () Bool)

(assert (=> b!640030 (= e!366347 e!366348)))

(declare-fun res!414456 () Bool)

(assert (=> b!640030 (=> (not res!414456) (not e!366348))))

(declare-fun e!366349 () Bool)

(assert (=> b!640030 (= res!414456 (not e!366349))))

(declare-fun res!414457 () Bool)

(assert (=> b!640030 (=> (not res!414457) (not e!366349))))

(assert (=> b!640030 (= res!414457 (validKeyInArray!0 (select (arr!18384 lt!296027) #b00000000000000000000000000000000)))))

(declare-fun d!90387 () Bool)

(declare-fun res!414458 () Bool)

(assert (=> d!90387 (=> res!414458 e!366347)))

(assert (=> d!90387 (= res!414458 (bvsge #b00000000000000000000000000000000 (size!18748 lt!296027)))))

(assert (=> d!90387 (= (arrayNoDuplicates!0 lt!296027 #b00000000000000000000000000000000 Nil!12422) e!366347)))

(declare-fun b!640031 () Bool)

(assert (=> b!640031 (= e!366349 (contains!3125 Nil!12422 (select (arr!18384 lt!296027) #b00000000000000000000000000000000)))))

(declare-fun b!640032 () Bool)

(assert (=> b!640032 (= e!366350 call!33505)))

(assert (= (and d!90387 (not res!414458)) b!640030))

(assert (= (and b!640030 res!414457) b!640031))

(assert (= (and b!640030 res!414456) b!640028))

(assert (= (and b!640028 c!73153) b!640029))

(assert (= (and b!640028 (not c!73153)) b!640032))

(assert (= (or b!640029 b!640032) bm!33502))

(declare-fun m!613871 () Bool)

(assert (=> bm!33502 m!613871))

(declare-fun m!613873 () Bool)

(assert (=> bm!33502 m!613873))

(assert (=> b!640028 m!613871))

(assert (=> b!640028 m!613871))

(declare-fun m!613875 () Bool)

(assert (=> b!640028 m!613875))

(assert (=> b!640030 m!613871))

(assert (=> b!640030 m!613871))

(assert (=> b!640030 m!613875))

(assert (=> b!640031 m!613871))

(assert (=> b!640031 m!613871))

(declare-fun m!613877 () Bool)

(assert (=> b!640031 m!613877))

(assert (=> b!639776 d!90387))

(declare-fun d!90389 () Bool)

(assert (=> d!90389 (arrayContainsKey!0 lt!296027 (select (arr!18384 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296146 () Unit!21630)

(declare-fun choose!114 (array!38326 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21630)

(assert (=> d!90389 (= lt!296146 (choose!114 lt!296027 (select (arr!18384 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90389 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90389 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296027 (select (arr!18384 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!296146)))

(declare-fun bs!19171 () Bool)

(assert (= bs!19171 d!90389))

(assert (=> bs!19171 m!613617))

(assert (=> bs!19171 m!613655))

(assert (=> bs!19171 m!613617))

(declare-fun m!613883 () Bool)

(assert (=> bs!19171 m!613883))

(assert (=> b!639776 d!90389))

(declare-fun d!90393 () Bool)

(declare-fun e!366358 () Bool)

(assert (=> d!90393 e!366358))

(declare-fun res!414466 () Bool)

(assert (=> d!90393 (=> (not res!414466) (not e!366358))))

(assert (=> d!90393 (= res!414466 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18748 a!2986))))))

(declare-fun lt!296155 () Unit!21630)

(declare-fun choose!41 (array!38326 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12425) Unit!21630)

(assert (=> d!90393 (= lt!296155 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12422))))

(assert (=> d!90393 (bvslt (size!18748 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90393 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12422) lt!296155)))

(declare-fun b!640040 () Bool)

(assert (=> b!640040 (= e!366358 (arrayNoDuplicates!0 (array!38327 (store (arr!18384 a!2986) i!1108 k!1786) (size!18748 a!2986)) #b00000000000000000000000000000000 Nil!12422))))

(assert (= (and d!90393 res!414466) b!640040))

(declare-fun m!613891 () Bool)

(assert (=> d!90393 m!613891))

(assert (=> b!640040 m!613623))

(declare-fun m!613893 () Bool)

(assert (=> b!640040 m!613893))

(assert (=> b!639776 d!90393))

(declare-fun d!90403 () Bool)

(assert (=> d!90403 (arrayNoDuplicates!0 lt!296027 j!136 Nil!12422)))

(declare-fun lt!296158 () Unit!21630)

(declare-fun choose!39 (array!38326 (_ BitVec 32) (_ BitVec 32)) Unit!21630)

(assert (=> d!90403 (= lt!296158 (choose!39 lt!296027 #b00000000000000000000000000000000 j!136))))

(assert (=> d!90403 (bvslt (size!18748 lt!296027) #b01111111111111111111111111111111)))

(assert (=> d!90403 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!296027 #b00000000000000000000000000000000 j!136) lt!296158)))

(declare-fun bs!19174 () Bool)

(assert (= bs!19174 d!90403))

(assert (=> bs!19174 m!613651))

(declare-fun m!613899 () Bool)

(assert (=> bs!19174 m!613899))

(assert (=> b!639776 d!90403))

(declare-fun call!33506 () Bool)

(declare-fun c!73154 () Bool)

(declare-fun bm!33503 () Bool)

(assert (=> bm!33503 (= call!33506 (arrayNoDuplicates!0 lt!296027 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73154 (Cons!12421 (select (arr!18384 lt!296027) j!136) Nil!12422) Nil!12422)))))

(declare-fun b!640043 () Bool)

(declare-fun e!366362 () Bool)

(declare-fun e!366364 () Bool)

(assert (=> b!640043 (= e!366362 e!366364)))

(assert (=> b!640043 (= c!73154 (validKeyInArray!0 (select (arr!18384 lt!296027) j!136)))))

(declare-fun b!640044 () Bool)

(assert (=> b!640044 (= e!366364 call!33506)))

(declare-fun b!640045 () Bool)

(declare-fun e!366361 () Bool)

(assert (=> b!640045 (= e!366361 e!366362)))

(declare-fun res!414469 () Bool)

(assert (=> b!640045 (=> (not res!414469) (not e!366362))))

(declare-fun e!366363 () Bool)

(assert (=> b!640045 (= res!414469 (not e!366363))))

(declare-fun res!414470 () Bool)

(assert (=> b!640045 (=> (not res!414470) (not e!366363))))

(assert (=> b!640045 (= res!414470 (validKeyInArray!0 (select (arr!18384 lt!296027) j!136)))))

(declare-fun d!90411 () Bool)

(declare-fun res!414471 () Bool)

(assert (=> d!90411 (=> res!414471 e!366361)))

(assert (=> d!90411 (= res!414471 (bvsge j!136 (size!18748 lt!296027)))))

(assert (=> d!90411 (= (arrayNoDuplicates!0 lt!296027 j!136 Nil!12422) e!366361)))

(declare-fun b!640046 () Bool)

(assert (=> b!640046 (= e!366363 (contains!3125 Nil!12422 (select (arr!18384 lt!296027) j!136)))))

(declare-fun b!640047 () Bool)

(assert (=> b!640047 (= e!366364 call!33506)))

(assert (= (and d!90411 (not res!414471)) b!640045))

(assert (= (and b!640045 res!414470) b!640046))

(assert (= (and b!640045 res!414469) b!640043))

(assert (= (and b!640043 c!73154) b!640044))

(assert (= (and b!640043 (not c!73154)) b!640047))

(assert (= (or b!640044 b!640047) bm!33503))

(assert (=> bm!33503 m!613829))

(declare-fun m!613901 () Bool)

(assert (=> bm!33503 m!613901))

(assert (=> b!640043 m!613829))

(assert (=> b!640043 m!613829))

(declare-fun m!613903 () Bool)

(assert (=> b!640043 m!613903))

(assert (=> b!640045 m!613829))

(assert (=> b!640045 m!613829))

(assert (=> b!640045 m!613903))

(assert (=> b!640046 m!613829))

(assert (=> b!640046 m!613829))

(declare-fun m!613905 () Bool)

(assert (=> b!640046 m!613905))

(assert (=> b!639776 d!90411))

(declare-fun d!90413 () Bool)

(declare-fun res!414472 () Bool)

(declare-fun e!366365 () Bool)

(assert (=> d!90413 (=> res!414472 e!366365)))

(assert (=> d!90413 (= res!414472 (= (select (arr!18384 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!90413 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!366365)))

(declare-fun b!640048 () Bool)

(declare-fun e!366366 () Bool)

(assert (=> b!640048 (= e!366365 e!366366)))

(declare-fun res!414473 () Bool)

(assert (=> b!640048 (=> (not res!414473) (not e!366366))))

(assert (=> b!640048 (= res!414473 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18748 a!2986)))))

(declare-fun b!640049 () Bool)

(assert (=> b!640049 (= e!366366 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90413 (not res!414472)) b!640048))

(assert (= (and b!640048 res!414473) b!640049))

(assert (=> d!90413 m!613801))

(declare-fun m!613907 () Bool)

(assert (=> b!640049 m!613907))

(assert (=> b!639774 d!90413))

(declare-fun d!90415 () Bool)

(assert (=> d!90415 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57824 d!90415))

(declare-fun d!90425 () Bool)

(assert (=> d!90425 (= (array_inv!14180 a!2986) (bvsge (size!18748 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57824 d!90425))

(declare-fun d!90427 () Bool)

(assert (=> d!90427 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!639764 d!90427))

(declare-fun b!640122 () Bool)

(declare-fun e!366411 () SeekEntryResult!6824)

(assert (=> b!640122 (= e!366411 Undefined!6824)))

(declare-fun b!640123 () Bool)

(declare-fun e!366412 () SeekEntryResult!6824)

(assert (=> b!640123 (= e!366411 e!366412)))

(declare-fun c!73185 () Bool)

(declare-fun lt!296191 () (_ BitVec 64))

(assert (=> b!640123 (= c!73185 (= lt!296191 (select (arr!18384 a!2986) j!136)))))

(declare-fun lt!296190 () SeekEntryResult!6824)

(declare-fun d!90429 () Bool)

(assert (=> d!90429 (and (or (is-Undefined!6824 lt!296190) (not (is-Found!6824 lt!296190)) (and (bvsge (index!29614 lt!296190) #b00000000000000000000000000000000) (bvslt (index!29614 lt!296190) (size!18748 a!2986)))) (or (is-Undefined!6824 lt!296190) (is-Found!6824 lt!296190) (not (is-MissingVacant!6824 lt!296190)) (not (= (index!29616 lt!296190) vacantSpotIndex!68)) (and (bvsge (index!29616 lt!296190) #b00000000000000000000000000000000) (bvslt (index!29616 lt!296190) (size!18748 a!2986)))) (or (is-Undefined!6824 lt!296190) (ite (is-Found!6824 lt!296190) (= (select (arr!18384 a!2986) (index!29614 lt!296190)) (select (arr!18384 a!2986) j!136)) (and (is-MissingVacant!6824 lt!296190) (= (index!29616 lt!296190) vacantSpotIndex!68) (= (select (arr!18384 a!2986) (index!29616 lt!296190)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90429 (= lt!296190 e!366411)))

(declare-fun c!73184 () Bool)

(assert (=> d!90429 (= c!73184 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90429 (= lt!296191 (select (arr!18384 a!2986) index!984))))

(assert (=> d!90429 (validMask!0 mask!3053)))

(assert (=> d!90429 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18384 a!2986) j!136) a!2986 mask!3053) lt!296190)))

(declare-fun b!640124 () Bool)

(declare-fun c!73183 () Bool)

(assert (=> b!640124 (= c!73183 (= lt!296191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!366413 () SeekEntryResult!6824)

(assert (=> b!640124 (= e!366412 e!366413)))

(declare-fun b!640125 () Bool)

(assert (=> b!640125 (= e!366412 (Found!6824 index!984))))

(declare-fun b!640126 () Bool)

(assert (=> b!640126 (= e!366413 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18384 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640127 () Bool)

(assert (=> b!640127 (= e!366413 (MissingVacant!6824 vacantSpotIndex!68))))

(assert (= (and d!90429 c!73184) b!640122))

(assert (= (and d!90429 (not c!73184)) b!640123))

(assert (= (and b!640123 c!73185) b!640125))

(assert (= (and b!640123 (not c!73185)) b!640124))

(assert (= (and b!640124 c!73183) b!640127))

(assert (= (and b!640124 (not c!73183)) b!640126))

(declare-fun m!613967 () Bool)

(assert (=> d!90429 m!613967))

(declare-fun m!613969 () Bool)

(assert (=> d!90429 m!613969))

(assert (=> d!90429 m!613661))

(assert (=> d!90429 m!613607))

(assert (=> b!640126 m!613633))

(assert (=> b!640126 m!613633))

(assert (=> b!640126 m!613617))

(declare-fun m!613971 () Bool)

(assert (=> b!640126 m!613971))

(assert (=> b!639775 d!90429))

(declare-fun d!90441 () Bool)

(declare-fun e!366431 () Bool)

(assert (=> d!90441 e!366431))

(declare-fun res!414492 () Bool)

(assert (=> d!90441 (=> (not res!414492) (not e!366431))))

(assert (=> d!90441 (= res!414492 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18748 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18748 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18748 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18748 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18748 a!2986))))))

(declare-fun lt!296207 () Unit!21630)

(declare-fun choose!9 (array!38326 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21630)

(assert (=> d!90441 (= lt!296207 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296023 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90441 (validMask!0 mask!3053)))

(assert (=> d!90441 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296023 vacantSpotIndex!68 mask!3053) lt!296207)))

(declare-fun b!640160 () Bool)

(assert (=> b!640160 (= e!366431 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296023 vacantSpotIndex!68 (select (arr!18384 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296023 vacantSpotIndex!68 (select (store (arr!18384 a!2986) i!1108 k!1786) j!136) (array!38327 (store (arr!18384 a!2986) i!1108 k!1786) (size!18748 a!2986)) mask!3053)))))

(assert (= (and d!90441 res!414492) b!640160))

(declare-fun m!614003 () Bool)

(assert (=> d!90441 m!614003))

(assert (=> d!90441 m!613607))

(assert (=> b!640160 m!613635))

(assert (=> b!640160 m!613635))

(declare-fun m!614005 () Bool)

(assert (=> b!640160 m!614005))

(assert (=> b!640160 m!613617))

(assert (=> b!640160 m!613623))

(assert (=> b!640160 m!613617))

(assert (=> b!640160 m!613637))

(assert (=> b!639762 d!90441))

(declare-fun d!90449 () Bool)

(declare-fun lt!296213 () (_ BitVec 32))

(assert (=> d!90449 (and (bvsge lt!296213 #b00000000000000000000000000000000) (bvslt lt!296213 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90449 (= lt!296213 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90449 (validMask!0 mask!3053)))

(assert (=> d!90449 (= (nextIndex!0 index!984 x!910 mask!3053) lt!296213)))

(declare-fun bs!19177 () Bool)

(assert (= bs!19177 d!90449))

(declare-fun m!614009 () Bool)

(assert (=> bs!19177 m!614009))

(assert (=> bs!19177 m!613607))

(assert (=> b!639762 d!90449))

(declare-fun b!640161 () Bool)

(declare-fun e!366432 () SeekEntryResult!6824)

(assert (=> b!640161 (= e!366432 Undefined!6824)))

(declare-fun b!640162 () Bool)

(declare-fun e!366433 () SeekEntryResult!6824)

(assert (=> b!640162 (= e!366432 e!366433)))

(declare-fun c!73203 () Bool)

(declare-fun lt!296215 () (_ BitVec 64))

(assert (=> b!640162 (= c!73203 (= lt!296215 (select (arr!18384 a!2986) j!136)))))

(declare-fun lt!296214 () SeekEntryResult!6824)

(declare-fun d!90453 () Bool)

(assert (=> d!90453 (and (or (is-Undefined!6824 lt!296214) (not (is-Found!6824 lt!296214)) (and (bvsge (index!29614 lt!296214) #b00000000000000000000000000000000) (bvslt (index!29614 lt!296214) (size!18748 a!2986)))) (or (is-Undefined!6824 lt!296214) (is-Found!6824 lt!296214) (not (is-MissingVacant!6824 lt!296214)) (not (= (index!29616 lt!296214) vacantSpotIndex!68)) (and (bvsge (index!29616 lt!296214) #b00000000000000000000000000000000) (bvslt (index!29616 lt!296214) (size!18748 a!2986)))) (or (is-Undefined!6824 lt!296214) (ite (is-Found!6824 lt!296214) (= (select (arr!18384 a!2986) (index!29614 lt!296214)) (select (arr!18384 a!2986) j!136)) (and (is-MissingVacant!6824 lt!296214) (= (index!29616 lt!296214) vacantSpotIndex!68) (= (select (arr!18384 a!2986) (index!29616 lt!296214)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90453 (= lt!296214 e!366432)))

(declare-fun c!73202 () Bool)

(assert (=> d!90453 (= c!73202 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90453 (= lt!296215 (select (arr!18384 a!2986) lt!296023))))

(assert (=> d!90453 (validMask!0 mask!3053)))

(assert (=> d!90453 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296023 vacantSpotIndex!68 (select (arr!18384 a!2986) j!136) a!2986 mask!3053) lt!296214)))

(declare-fun b!640163 () Bool)

(declare-fun c!73201 () Bool)

(assert (=> b!640163 (= c!73201 (= lt!296215 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!366434 () SeekEntryResult!6824)

(assert (=> b!640163 (= e!366433 e!366434)))

(declare-fun b!640164 () Bool)

(assert (=> b!640164 (= e!366433 (Found!6824 lt!296023))))

(declare-fun b!640165 () Bool)

(assert (=> b!640165 (= e!366434 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!296023 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18384 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640166 () Bool)

(assert (=> b!640166 (= e!366434 (MissingVacant!6824 vacantSpotIndex!68))))

(assert (= (and d!90453 c!73202) b!640161))

(assert (= (and d!90453 (not c!73202)) b!640162))

(assert (= (and b!640162 c!73203) b!640164))

(assert (= (and b!640162 (not c!73203)) b!640163))

(assert (= (and b!640163 c!73201) b!640166))

(assert (= (and b!640163 (not c!73201)) b!640165))

(declare-fun m!614011 () Bool)

(assert (=> d!90453 m!614011))

(declare-fun m!614013 () Bool)

(assert (=> d!90453 m!614013))

(declare-fun m!614015 () Bool)

(assert (=> d!90453 m!614015))

(assert (=> d!90453 m!613607))

(declare-fun m!614017 () Bool)

(assert (=> b!640165 m!614017))

(assert (=> b!640165 m!614017))

(assert (=> b!640165 m!613617))

(declare-fun m!614019 () Bool)

(assert (=> b!640165 m!614019))

(assert (=> b!639762 d!90453))

(declare-fun b!640167 () Bool)

(declare-fun e!366435 () SeekEntryResult!6824)

(assert (=> b!640167 (= e!366435 Undefined!6824)))

(declare-fun b!640168 () Bool)

(declare-fun e!366436 () SeekEntryResult!6824)

(assert (=> b!640168 (= e!366435 e!366436)))

(declare-fun c!73206 () Bool)

(declare-fun lt!296217 () (_ BitVec 64))

(assert (=> b!640168 (= c!73206 (= lt!296217 lt!296026))))

(declare-fun d!90455 () Bool)

(declare-fun lt!296216 () SeekEntryResult!6824)

(assert (=> d!90455 (and (or (is-Undefined!6824 lt!296216) (not (is-Found!6824 lt!296216)) (and (bvsge (index!29614 lt!296216) #b00000000000000000000000000000000) (bvslt (index!29614 lt!296216) (size!18748 lt!296027)))) (or (is-Undefined!6824 lt!296216) (is-Found!6824 lt!296216) (not (is-MissingVacant!6824 lt!296216)) (not (= (index!29616 lt!296216) vacantSpotIndex!68)) (and (bvsge (index!29616 lt!296216) #b00000000000000000000000000000000) (bvslt (index!29616 lt!296216) (size!18748 lt!296027)))) (or (is-Undefined!6824 lt!296216) (ite (is-Found!6824 lt!296216) (= (select (arr!18384 lt!296027) (index!29614 lt!296216)) lt!296026) (and (is-MissingVacant!6824 lt!296216) (= (index!29616 lt!296216) vacantSpotIndex!68) (= (select (arr!18384 lt!296027) (index!29616 lt!296216)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90455 (= lt!296216 e!366435)))

(declare-fun c!73205 () Bool)

(assert (=> d!90455 (= c!73205 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90455 (= lt!296217 (select (arr!18384 lt!296027) index!984))))

(assert (=> d!90455 (validMask!0 mask!3053)))

(assert (=> d!90455 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296026 lt!296027 mask!3053) lt!296216)))

(declare-fun b!640169 () Bool)

(declare-fun c!73204 () Bool)

(assert (=> b!640169 (= c!73204 (= lt!296217 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!366437 () SeekEntryResult!6824)

(assert (=> b!640169 (= e!366436 e!366437)))

(declare-fun b!640170 () Bool)

(assert (=> b!640170 (= e!366436 (Found!6824 index!984))))

(declare-fun b!640171 () Bool)

(assert (=> b!640171 (= e!366437 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!296026 lt!296027 mask!3053))))

(declare-fun b!640172 () Bool)

(assert (=> b!640172 (= e!366437 (MissingVacant!6824 vacantSpotIndex!68))))

(assert (= (and d!90455 c!73205) b!640167))

(assert (= (and d!90455 (not c!73205)) b!640168))

(assert (= (and b!640168 c!73206) b!640170))

(assert (= (and b!640168 (not c!73206)) b!640169))

(assert (= (and b!640169 c!73204) b!640172))

(assert (= (and b!640169 (not c!73204)) b!640171))

(declare-fun m!614021 () Bool)

(assert (=> d!90455 m!614021))

(declare-fun m!614023 () Bool)

(assert (=> d!90455 m!614023))

(assert (=> d!90455 m!613821))

(assert (=> d!90455 m!613607))

(assert (=> b!640171 m!613633))

(assert (=> b!640171 m!613633))

(declare-fun m!614025 () Bool)

(assert (=> b!640171 m!614025))

(assert (=> b!639762 d!90455))

(declare-fun b!640173 () Bool)

(declare-fun e!366438 () SeekEntryResult!6824)

(assert (=> b!640173 (= e!366438 Undefined!6824)))

(declare-fun b!640174 () Bool)

(declare-fun e!366439 () SeekEntryResult!6824)

(assert (=> b!640174 (= e!366438 e!366439)))

(declare-fun c!73209 () Bool)

(declare-fun lt!296219 () (_ BitVec 64))

(assert (=> b!640174 (= c!73209 (= lt!296219 lt!296026))))

(declare-fun lt!296218 () SeekEntryResult!6824)

(declare-fun d!90457 () Bool)

(assert (=> d!90457 (and (or (is-Undefined!6824 lt!296218) (not (is-Found!6824 lt!296218)) (and (bvsge (index!29614 lt!296218) #b00000000000000000000000000000000) (bvslt (index!29614 lt!296218) (size!18748 lt!296027)))) (or (is-Undefined!6824 lt!296218) (is-Found!6824 lt!296218) (not (is-MissingVacant!6824 lt!296218)) (not (= (index!29616 lt!296218) vacantSpotIndex!68)) (and (bvsge (index!29616 lt!296218) #b00000000000000000000000000000000) (bvslt (index!29616 lt!296218) (size!18748 lt!296027)))) (or (is-Undefined!6824 lt!296218) (ite (is-Found!6824 lt!296218) (= (select (arr!18384 lt!296027) (index!29614 lt!296218)) lt!296026) (and (is-MissingVacant!6824 lt!296218) (= (index!29616 lt!296218) vacantSpotIndex!68) (= (select (arr!18384 lt!296027) (index!29616 lt!296218)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90457 (= lt!296218 e!366438)))

(declare-fun c!73208 () Bool)

(assert (=> d!90457 (= c!73208 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90457 (= lt!296219 (select (arr!18384 lt!296027) lt!296023))))

(assert (=> d!90457 (validMask!0 mask!3053)))

(assert (=> d!90457 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296023 vacantSpotIndex!68 lt!296026 lt!296027 mask!3053) lt!296218)))

(declare-fun b!640175 () Bool)

(declare-fun c!73207 () Bool)

(assert (=> b!640175 (= c!73207 (= lt!296219 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!366440 () SeekEntryResult!6824)

(assert (=> b!640175 (= e!366439 e!366440)))

(declare-fun b!640176 () Bool)

(assert (=> b!640176 (= e!366439 (Found!6824 lt!296023))))

(declare-fun b!640177 () Bool)

(assert (=> b!640177 (= e!366440 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!296023 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!296026 lt!296027 mask!3053))))

(declare-fun b!640178 () Bool)

(assert (=> b!640178 (= e!366440 (MissingVacant!6824 vacantSpotIndex!68))))

(assert (= (and d!90457 c!73208) b!640173))

(assert (= (and d!90457 (not c!73208)) b!640174))

(assert (= (and b!640174 c!73209) b!640176))

(assert (= (and b!640174 (not c!73209)) b!640175))

(assert (= (and b!640175 c!73207) b!640178))

(assert (= (and b!640175 (not c!73207)) b!640177))

(declare-fun m!614027 () Bool)

(assert (=> d!90457 m!614027))

(declare-fun m!614029 () Bool)

(assert (=> d!90457 m!614029))

(declare-fun m!614031 () Bool)

(assert (=> d!90457 m!614031))

