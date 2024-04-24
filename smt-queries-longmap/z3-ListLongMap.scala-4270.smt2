; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59418 () Bool)

(assert start!59418)

(declare-fun b!655757 () Bool)

(declare-fun e!376611 () Bool)

(declare-datatypes ((SeekEntryResult!6931 0))(
  ( (MissingZero!6931 (index!30083 (_ BitVec 32))) (Found!6931 (index!30084 (_ BitVec 32))) (Intermediate!6931 (undefined!7743 Bool) (index!30085 (_ BitVec 32)) (x!59023 (_ BitVec 32))) (Undefined!6931) (MissingVacant!6931 (index!30086 (_ BitVec 32))) )
))
(declare-fun lt!305872 () SeekEntryResult!6931)

(declare-fun lt!305884 () SeekEntryResult!6931)

(assert (=> b!655757 (= e!376611 (= lt!305872 lt!305884))))

(declare-fun b!655758 () Bool)

(declare-fun res!425359 () Bool)

(declare-fun e!376612 () Bool)

(assert (=> b!655758 (=> (not res!425359) (not e!376612))))

(declare-datatypes ((array!38676 0))(
  ( (array!38677 (arr!18535 (Array (_ BitVec 32) (_ BitVec 64))) (size!18899 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38676)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655758 (= res!425359 (validKeyInArray!0 (select (arr!18535 a!2986) j!136)))))

(declare-fun b!655759 () Bool)

(declare-fun res!425357 () Bool)

(assert (=> b!655759 (=> (not res!425357) (not e!376612))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655759 (= res!425357 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!655760 () Bool)

(assert (=> b!655760 false))

(declare-datatypes ((Unit!22533 0))(
  ( (Unit!22534) )
))
(declare-fun lt!305879 () Unit!22533)

(declare-fun lt!305871 () array!38676)

(declare-datatypes ((List!12483 0))(
  ( (Nil!12480) (Cons!12479 (h!13527 (_ BitVec 64)) (t!18703 List!12483)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38676 (_ BitVec 64) (_ BitVec 32) List!12483) Unit!22533)

(assert (=> b!655760 (= lt!305879 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305871 (select (arr!18535 a!2986) j!136) j!136 Nil!12480))))

(declare-fun arrayNoDuplicates!0 (array!38676 (_ BitVec 32) List!12483) Bool)

(assert (=> b!655760 (arrayNoDuplicates!0 lt!305871 j!136 Nil!12480)))

(declare-fun lt!305870 () Unit!22533)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38676 (_ BitVec 32) (_ BitVec 32)) Unit!22533)

(assert (=> b!655760 (= lt!305870 (lemmaNoDuplicateFromThenFromBigger!0 lt!305871 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655760 (arrayNoDuplicates!0 lt!305871 #b00000000000000000000000000000000 Nil!12480)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!305881 () Unit!22533)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38676 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12483) Unit!22533)

(assert (=> b!655760 (= lt!305881 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12480))))

(assert (=> b!655760 (arrayContainsKey!0 lt!305871 (select (arr!18535 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305873 () Unit!22533)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38676 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22533)

(assert (=> b!655760 (= lt!305873 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305871 (select (arr!18535 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!376614 () Unit!22533)

(declare-fun Unit!22535 () Unit!22533)

(assert (=> b!655760 (= e!376614 Unit!22535)))

(declare-fun b!655761 () Bool)

(declare-fun e!376609 () Bool)

(assert (=> b!655761 (= e!376612 e!376609)))

(declare-fun res!425356 () Bool)

(assert (=> b!655761 (=> (not res!425356) (not e!376609))))

(declare-fun lt!305874 () SeekEntryResult!6931)

(assert (=> b!655761 (= res!425356 (or (= lt!305874 (MissingZero!6931 i!1108)) (= lt!305874 (MissingVacant!6931 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38676 (_ BitVec 32)) SeekEntryResult!6931)

(assert (=> b!655761 (= lt!305874 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!655762 () Bool)

(declare-fun e!376604 () Bool)

(assert (=> b!655762 (= e!376609 e!376604)))

(declare-fun res!425353 () Bool)

(assert (=> b!655762 (=> (not res!425353) (not e!376604))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!655762 (= res!425353 (= (select (store (arr!18535 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655762 (= lt!305871 (array!38677 (store (arr!18535 a!2986) i!1108 k0!1786) (size!18899 a!2986)))))

(declare-fun b!655763 () Bool)

(assert (=> b!655763 false))

(declare-fun lt!305869 () Unit!22533)

(assert (=> b!655763 (= lt!305869 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305871 (select (arr!18535 a!2986) j!136) index!984 Nil!12480))))

(assert (=> b!655763 (arrayNoDuplicates!0 lt!305871 index!984 Nil!12480)))

(declare-fun lt!305877 () Unit!22533)

(assert (=> b!655763 (= lt!305877 (lemmaNoDuplicateFromThenFromBigger!0 lt!305871 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655763 (arrayNoDuplicates!0 lt!305871 #b00000000000000000000000000000000 Nil!12480)))

(declare-fun lt!305866 () Unit!22533)

(assert (=> b!655763 (= lt!305866 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12480))))

(assert (=> b!655763 (arrayContainsKey!0 lt!305871 (select (arr!18535 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305882 () Unit!22533)

(assert (=> b!655763 (= lt!305882 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305871 (select (arr!18535 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!376607 () Bool)

(assert (=> b!655763 e!376607))

(declare-fun res!425355 () Bool)

(assert (=> b!655763 (=> (not res!425355) (not e!376607))))

(assert (=> b!655763 (= res!425355 (arrayContainsKey!0 lt!305871 (select (arr!18535 a!2986) j!136) j!136))))

(declare-fun e!376613 () Unit!22533)

(declare-fun Unit!22536 () Unit!22533)

(assert (=> b!655763 (= e!376613 Unit!22536)))

(declare-fun b!655764 () Bool)

(declare-fun Unit!22537 () Unit!22533)

(assert (=> b!655764 (= e!376614 Unit!22537)))

(declare-fun b!655765 () Bool)

(assert (=> b!655765 (= e!376607 (arrayContainsKey!0 lt!305871 (select (arr!18535 a!2986) j!136) index!984))))

(declare-fun b!655766 () Bool)

(declare-fun e!376608 () Unit!22533)

(declare-fun Unit!22538 () Unit!22533)

(assert (=> b!655766 (= e!376608 Unit!22538)))

(declare-fun b!655767 () Bool)

(declare-fun e!376605 () Bool)

(assert (=> b!655767 (= e!376605 (arrayContainsKey!0 lt!305871 (select (arr!18535 a!2986) j!136) index!984))))

(declare-fun b!655768 () Bool)

(declare-fun res!425351 () Bool)

(assert (=> b!655768 (=> (not res!425351) (not e!376609))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!655768 (= res!425351 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18535 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655769 () Bool)

(declare-fun e!376606 () Bool)

(assert (=> b!655769 (= e!376606 (not true))))

(declare-fun lt!305878 () Unit!22533)

(declare-fun e!376610 () Unit!22533)

(assert (=> b!655769 (= lt!305878 e!376610)))

(declare-fun c!75572 () Bool)

(declare-fun lt!305883 () SeekEntryResult!6931)

(assert (=> b!655769 (= c!75572 (= lt!305883 (Found!6931 index!984)))))

(declare-fun lt!305875 () Unit!22533)

(assert (=> b!655769 (= lt!305875 e!376608)))

(declare-fun c!75574 () Bool)

(assert (=> b!655769 (= c!75574 (= lt!305883 Undefined!6931))))

(declare-fun lt!305865 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38676 (_ BitVec 32)) SeekEntryResult!6931)

(assert (=> b!655769 (= lt!305883 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305865 lt!305871 mask!3053))))

(assert (=> b!655769 e!376611))

(declare-fun res!425364 () Bool)

(assert (=> b!655769 (=> (not res!425364) (not e!376611))))

(declare-fun lt!305880 () (_ BitVec 32))

(assert (=> b!655769 (= res!425364 (= lt!305884 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305880 vacantSpotIndex!68 lt!305865 lt!305871 mask!3053)))))

(assert (=> b!655769 (= lt!305884 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305880 vacantSpotIndex!68 (select (arr!18535 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655769 (= lt!305865 (select (store (arr!18535 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!305867 () Unit!22533)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38676 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22533)

(assert (=> b!655769 (= lt!305867 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305880 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655769 (= lt!305880 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!655770 () Bool)

(declare-fun Unit!22539 () Unit!22533)

(assert (=> b!655770 (= e!376608 Unit!22539)))

(assert (=> b!655770 false))

(declare-fun b!655771 () Bool)

(declare-fun res!425360 () Bool)

(assert (=> b!655771 (=> (not res!425360) (not e!376609))))

(assert (=> b!655771 (= res!425360 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12480))))

(declare-fun b!655772 () Bool)

(declare-fun res!425365 () Bool)

(assert (=> b!655772 (=> (not res!425365) (not e!376612))))

(assert (=> b!655772 (= res!425365 (validKeyInArray!0 k0!1786))))

(declare-fun b!655773 () Bool)

(declare-fun Unit!22540 () Unit!22533)

(assert (=> b!655773 (= e!376613 Unit!22540)))

(declare-fun b!655774 () Bool)

(assert (=> b!655774 (= e!376604 e!376606)))

(declare-fun res!425358 () Bool)

(assert (=> b!655774 (=> (not res!425358) (not e!376606))))

(assert (=> b!655774 (= res!425358 (and (= lt!305872 (Found!6931 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18535 a!2986) index!984) (select (arr!18535 a!2986) j!136))) (not (= (select (arr!18535 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!655774 (= lt!305872 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18535 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655775 () Bool)

(declare-fun res!425362 () Bool)

(assert (=> b!655775 (= res!425362 (bvsge j!136 index!984))))

(declare-fun e!376617 () Bool)

(assert (=> b!655775 (=> res!425362 e!376617)))

(declare-fun e!376615 () Bool)

(assert (=> b!655775 (= e!376615 e!376617)))

(declare-fun b!655776 () Bool)

(declare-fun res!425350 () Bool)

(assert (=> b!655776 (=> (not res!425350) (not e!376612))))

(assert (=> b!655776 (= res!425350 (and (= (size!18899 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18899 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18899 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!425352 () Bool)

(assert (=> start!59418 (=> (not res!425352) (not e!376612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59418 (= res!425352 (validMask!0 mask!3053))))

(assert (=> start!59418 e!376612))

(assert (=> start!59418 true))

(declare-fun array_inv!14394 (array!38676) Bool)

(assert (=> start!59418 (array_inv!14394 a!2986)))

(declare-fun b!655777 () Bool)

(declare-fun Unit!22541 () Unit!22533)

(assert (=> b!655777 (= e!376610 Unit!22541)))

(declare-fun res!425361 () Bool)

(assert (=> b!655777 (= res!425361 (= (select (store (arr!18535 a!2986) i!1108 k0!1786) index!984) (select (arr!18535 a!2986) j!136)))))

(assert (=> b!655777 (=> (not res!425361) (not e!376615))))

(assert (=> b!655777 e!376615))

(declare-fun c!75575 () Bool)

(assert (=> b!655777 (= c!75575 (bvslt j!136 index!984))))

(declare-fun lt!305868 () Unit!22533)

(assert (=> b!655777 (= lt!305868 e!376614)))

(declare-fun c!75573 () Bool)

(assert (=> b!655777 (= c!75573 (bvslt index!984 j!136))))

(declare-fun lt!305876 () Unit!22533)

(assert (=> b!655777 (= lt!305876 e!376613)))

(assert (=> b!655777 false))

(declare-fun res!425363 () Bool)

(declare-fun b!655778 () Bool)

(assert (=> b!655778 (= res!425363 (arrayContainsKey!0 lt!305871 (select (arr!18535 a!2986) j!136) j!136))))

(assert (=> b!655778 (=> (not res!425363) (not e!376605))))

(assert (=> b!655778 (= e!376617 e!376605)))

(declare-fun b!655779 () Bool)

(declare-fun Unit!22542 () Unit!22533)

(assert (=> b!655779 (= e!376610 Unit!22542)))

(declare-fun b!655780 () Bool)

(declare-fun res!425354 () Bool)

(assert (=> b!655780 (=> (not res!425354) (not e!376609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38676 (_ BitVec 32)) Bool)

(assert (=> b!655780 (= res!425354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!59418 res!425352) b!655776))

(assert (= (and b!655776 res!425350) b!655758))

(assert (= (and b!655758 res!425359) b!655772))

(assert (= (and b!655772 res!425365) b!655759))

(assert (= (and b!655759 res!425357) b!655761))

(assert (= (and b!655761 res!425356) b!655780))

(assert (= (and b!655780 res!425354) b!655771))

(assert (= (and b!655771 res!425360) b!655768))

(assert (= (and b!655768 res!425351) b!655762))

(assert (= (and b!655762 res!425353) b!655774))

(assert (= (and b!655774 res!425358) b!655769))

(assert (= (and b!655769 res!425364) b!655757))

(assert (= (and b!655769 c!75574) b!655770))

(assert (= (and b!655769 (not c!75574)) b!655766))

(assert (= (and b!655769 c!75572) b!655777))

(assert (= (and b!655769 (not c!75572)) b!655779))

(assert (= (and b!655777 res!425361) b!655775))

(assert (= (and b!655775 (not res!425362)) b!655778))

(assert (= (and b!655778 res!425363) b!655767))

(assert (= (and b!655777 c!75575) b!655760))

(assert (= (and b!655777 (not c!75575)) b!655764))

(assert (= (and b!655777 c!75573) b!655763))

(assert (= (and b!655777 (not c!75573)) b!655773))

(assert (= (and b!655763 res!425355) b!655765))

(declare-fun m!629287 () Bool)

(assert (=> b!655778 m!629287))

(assert (=> b!655778 m!629287))

(declare-fun m!629289 () Bool)

(assert (=> b!655778 m!629289))

(declare-fun m!629291 () Bool)

(assert (=> b!655769 m!629291))

(declare-fun m!629293 () Bool)

(assert (=> b!655769 m!629293))

(declare-fun m!629295 () Bool)

(assert (=> b!655769 m!629295))

(assert (=> b!655769 m!629287))

(declare-fun m!629297 () Bool)

(assert (=> b!655769 m!629297))

(declare-fun m!629299 () Bool)

(assert (=> b!655769 m!629299))

(assert (=> b!655769 m!629287))

(declare-fun m!629301 () Bool)

(assert (=> b!655769 m!629301))

(declare-fun m!629303 () Bool)

(assert (=> b!655769 m!629303))

(assert (=> b!655767 m!629287))

(assert (=> b!655767 m!629287))

(declare-fun m!629305 () Bool)

(assert (=> b!655767 m!629305))

(declare-fun m!629307 () Bool)

(assert (=> b!655761 m!629307))

(declare-fun m!629309 () Bool)

(assert (=> b!655772 m!629309))

(declare-fun m!629311 () Bool)

(assert (=> b!655774 m!629311))

(assert (=> b!655774 m!629287))

(assert (=> b!655774 m!629287))

(declare-fun m!629313 () Bool)

(assert (=> b!655774 m!629313))

(assert (=> b!655758 m!629287))

(assert (=> b!655758 m!629287))

(declare-fun m!629315 () Bool)

(assert (=> b!655758 m!629315))

(assert (=> b!655777 m!629297))

(declare-fun m!629317 () Bool)

(assert (=> b!655777 m!629317))

(assert (=> b!655777 m!629287))

(assert (=> b!655765 m!629287))

(assert (=> b!655765 m!629287))

(assert (=> b!655765 m!629305))

(declare-fun m!629319 () Bool)

(assert (=> b!655780 m!629319))

(declare-fun m!629321 () Bool)

(assert (=> b!655768 m!629321))

(declare-fun m!629323 () Bool)

(assert (=> b!655759 m!629323))

(declare-fun m!629325 () Bool)

(assert (=> start!59418 m!629325))

(declare-fun m!629327 () Bool)

(assert (=> start!59418 m!629327))

(declare-fun m!629329 () Bool)

(assert (=> b!655771 m!629329))

(assert (=> b!655762 m!629297))

(declare-fun m!629331 () Bool)

(assert (=> b!655762 m!629331))

(declare-fun m!629333 () Bool)

(assert (=> b!655760 m!629333))

(assert (=> b!655760 m!629287))

(declare-fun m!629335 () Bool)

(assert (=> b!655760 m!629335))

(declare-fun m!629337 () Bool)

(assert (=> b!655760 m!629337))

(assert (=> b!655760 m!629287))

(declare-fun m!629339 () Bool)

(assert (=> b!655760 m!629339))

(declare-fun m!629341 () Bool)

(assert (=> b!655760 m!629341))

(assert (=> b!655760 m!629287))

(assert (=> b!655760 m!629287))

(declare-fun m!629343 () Bool)

(assert (=> b!655760 m!629343))

(declare-fun m!629345 () Bool)

(assert (=> b!655760 m!629345))

(assert (=> b!655763 m!629287))

(assert (=> b!655763 m!629289))

(assert (=> b!655763 m!629333))

(assert (=> b!655763 m!629287))

(assert (=> b!655763 m!629287))

(declare-fun m!629347 () Bool)

(assert (=> b!655763 m!629347))

(assert (=> b!655763 m!629287))

(declare-fun m!629349 () Bool)

(assert (=> b!655763 m!629349))

(assert (=> b!655763 m!629287))

(declare-fun m!629351 () Bool)

(assert (=> b!655763 m!629351))

(declare-fun m!629353 () Bool)

(assert (=> b!655763 m!629353))

(declare-fun m!629355 () Bool)

(assert (=> b!655763 m!629355))

(assert (=> b!655763 m!629345))

(check-sat (not b!655778) (not b!655761) (not b!655772) (not b!655760) (not b!655763) (not start!59418) (not b!655759) (not b!655769) (not b!655767) (not b!655771) (not b!655765) (not b!655758) (not b!655774) (not b!655780))
(check-sat)
