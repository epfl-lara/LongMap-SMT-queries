; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57826 () Bool)

(assert start!57826)

(declare-fun b!639818 () Bool)

(declare-datatypes ((Unit!21634 0))(
  ( (Unit!21635) )
))
(declare-fun e!366208 () Unit!21634)

(declare-fun Unit!21636 () Unit!21634)

(assert (=> b!639818 (= e!366208 Unit!21636)))

(assert (=> b!639818 false))

(declare-fun b!639819 () Bool)

(declare-fun res!414337 () Bool)

(declare-fun e!366207 () Bool)

(assert (=> b!639819 (=> (not res!414337) (not e!366207))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38328 0))(
  ( (array!38329 (arr!18385 (Array (_ BitVec 32) (_ BitVec 64))) (size!18749 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38328)

(assert (=> b!639819 (= res!414337 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18385 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639820 () Bool)

(declare-fun e!366205 () Bool)

(declare-fun e!366203 () Bool)

(assert (=> b!639820 (= e!366205 e!366203)))

(declare-fun res!414332 () Bool)

(assert (=> b!639820 (=> res!414332 e!366203)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!296065 () (_ BitVec 64))

(declare-fun lt!296067 () (_ BitVec 64))

(assert (=> b!639820 (= res!414332 (or (not (= (select (arr!18385 a!2986) j!136) lt!296067)) (not (= (select (arr!18385 a!2986) j!136) lt!296065)) (bvsge j!136 index!984)))))

(declare-fun e!366210 () Bool)

(assert (=> b!639820 e!366210))

(declare-fun res!414322 () Bool)

(assert (=> b!639820 (=> (not res!414322) (not e!366210))))

(assert (=> b!639820 (= res!414322 (= lt!296065 (select (arr!18385 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!639820 (= lt!296065 (select (store (arr!18385 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!639821 () Bool)

(declare-fun Unit!21637 () Unit!21634)

(assert (=> b!639821 (= e!366208 Unit!21637)))

(declare-fun b!639823 () Bool)

(declare-fun res!414327 () Bool)

(declare-fun e!366199 () Bool)

(assert (=> b!639823 (=> (not res!414327) (not e!366199))))

(declare-fun arrayContainsKey!0 (array!38328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639823 (= res!414327 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639824 () Bool)

(declare-fun e!366206 () Bool)

(assert (=> b!639824 (= e!366206 (not e!366205))))

(declare-fun res!414335 () Bool)

(assert (=> b!639824 (=> res!414335 e!366205)))

(declare-datatypes ((SeekEntryResult!6825 0))(
  ( (MissingZero!6825 (index!29617 (_ BitVec 32))) (Found!6825 (index!29618 (_ BitVec 32))) (Intermediate!6825 (undefined!7637 Bool) (index!29619 (_ BitVec 32)) (x!58372 (_ BitVec 32))) (Undefined!6825) (MissingVacant!6825 (index!29620 (_ BitVec 32))) )
))
(declare-fun lt!296064 () SeekEntryResult!6825)

(assert (=> b!639824 (= res!414335 (not (= lt!296064 (Found!6825 index!984))))))

(declare-fun lt!296063 () Unit!21634)

(assert (=> b!639824 (= lt!296063 e!366208)))

(declare-fun c!73115 () Bool)

(assert (=> b!639824 (= c!73115 (= lt!296064 Undefined!6825))))

(declare-fun lt!296068 () array!38328)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38328 (_ BitVec 32)) SeekEntryResult!6825)

(assert (=> b!639824 (= lt!296064 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296067 lt!296068 mask!3053))))

(declare-fun e!366200 () Bool)

(assert (=> b!639824 e!366200))

(declare-fun res!414326 () Bool)

(assert (=> b!639824 (=> (not res!414326) (not e!366200))))

(declare-fun lt!296058 () SeekEntryResult!6825)

(declare-fun lt!296056 () (_ BitVec 32))

(assert (=> b!639824 (= res!414326 (= lt!296058 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296056 vacantSpotIndex!68 lt!296067 lt!296068 mask!3053)))))

(assert (=> b!639824 (= lt!296058 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296056 vacantSpotIndex!68 (select (arr!18385 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639824 (= lt!296067 (select (store (arr!18385 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296062 () Unit!21634)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38328 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21634)

(assert (=> b!639824 (= lt!296062 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296056 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639824 (= lt!296056 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639825 () Bool)

(declare-fun e!366201 () Bool)

(assert (=> b!639825 (= e!366210 e!366201)))

(declare-fun res!414325 () Bool)

(assert (=> b!639825 (=> res!414325 e!366201)))

(assert (=> b!639825 (= res!414325 (or (not (= (select (arr!18385 a!2986) j!136) lt!296067)) (not (= (select (arr!18385 a!2986) j!136) lt!296065)) (bvsge j!136 index!984)))))

(declare-fun b!639826 () Bool)

(declare-fun res!414333 () Bool)

(assert (=> b!639826 (=> (not res!414333) (not e!366199))))

(assert (=> b!639826 (= res!414333 (and (= (size!18749 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18749 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18749 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639827 () Bool)

(assert (=> b!639827 (= e!366203 (bvslt (size!18749 a!2986) #b01111111111111111111111111111111))))

(declare-datatypes ((List!12426 0))(
  ( (Nil!12423) (Cons!12422 (h!13467 (_ BitVec 64)) (t!18654 List!12426)) )
))
(declare-fun arrayNoDuplicates!0 (array!38328 (_ BitVec 32) List!12426) Bool)

(assert (=> b!639827 (arrayNoDuplicates!0 lt!296068 j!136 Nil!12423)))

(declare-fun lt!296066 () Unit!21634)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38328 (_ BitVec 32) (_ BitVec 32)) Unit!21634)

(assert (=> b!639827 (= lt!296066 (lemmaNoDuplicateFromThenFromBigger!0 lt!296068 #b00000000000000000000000000000000 j!136))))

(assert (=> b!639827 (arrayNoDuplicates!0 lt!296068 #b00000000000000000000000000000000 Nil!12423)))

(declare-fun lt!296060 () Unit!21634)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38328 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12426) Unit!21634)

(assert (=> b!639827 (= lt!296060 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12423))))

(assert (=> b!639827 (arrayContainsKey!0 lt!296068 (select (arr!18385 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296057 () Unit!21634)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38328 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21634)

(assert (=> b!639827 (= lt!296057 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296068 (select (arr!18385 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!639828 () Bool)

(declare-fun e!366209 () Bool)

(assert (=> b!639828 (= e!366201 e!366209)))

(declare-fun res!414324 () Bool)

(assert (=> b!639828 (=> (not res!414324) (not e!366209))))

(assert (=> b!639828 (= res!414324 (arrayContainsKey!0 lt!296068 (select (arr!18385 a!2986) j!136) j!136))))

(declare-fun b!639829 () Bool)

(declare-fun lt!296059 () SeekEntryResult!6825)

(assert (=> b!639829 (= e!366200 (= lt!296059 lt!296058))))

(declare-fun b!639830 () Bool)

(declare-fun res!414336 () Bool)

(assert (=> b!639830 (=> (not res!414336) (not e!366199))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639830 (= res!414336 (validKeyInArray!0 k0!1786))))

(declare-fun b!639831 () Bool)

(assert (=> b!639831 (= e!366199 e!366207)))

(declare-fun res!414338 () Bool)

(assert (=> b!639831 (=> (not res!414338) (not e!366207))))

(declare-fun lt!296061 () SeekEntryResult!6825)

(assert (=> b!639831 (= res!414338 (or (= lt!296061 (MissingZero!6825 i!1108)) (= lt!296061 (MissingVacant!6825 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38328 (_ BitVec 32)) SeekEntryResult!6825)

(assert (=> b!639831 (= lt!296061 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!639832 () Bool)

(declare-fun e!366204 () Bool)

(assert (=> b!639832 (= e!366204 e!366206)))

(declare-fun res!414328 () Bool)

(assert (=> b!639832 (=> (not res!414328) (not e!366206))))

(assert (=> b!639832 (= res!414328 (and (= lt!296059 (Found!6825 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18385 a!2986) index!984) (select (arr!18385 a!2986) j!136))) (not (= (select (arr!18385 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!639832 (= lt!296059 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18385 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639822 () Bool)

(assert (=> b!639822 (= e!366207 e!366204)))

(declare-fun res!414330 () Bool)

(assert (=> b!639822 (=> (not res!414330) (not e!366204))))

(assert (=> b!639822 (= res!414330 (= (select (store (arr!18385 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639822 (= lt!296068 (array!38329 (store (arr!18385 a!2986) i!1108 k0!1786) (size!18749 a!2986)))))

(declare-fun res!414323 () Bool)

(assert (=> start!57826 (=> (not res!414323) (not e!366199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57826 (= res!414323 (validMask!0 mask!3053))))

(assert (=> start!57826 e!366199))

(assert (=> start!57826 true))

(declare-fun array_inv!14181 (array!38328) Bool)

(assert (=> start!57826 (array_inv!14181 a!2986)))

(declare-fun b!639833 () Bool)

(assert (=> b!639833 (= e!366209 (arrayContainsKey!0 lt!296068 (select (arr!18385 a!2986) j!136) index!984))))

(declare-fun b!639834 () Bool)

(declare-fun res!414329 () Bool)

(assert (=> b!639834 (=> (not res!414329) (not e!366207))))

(assert (=> b!639834 (= res!414329 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12423))))

(declare-fun b!639835 () Bool)

(declare-fun res!414331 () Bool)

(assert (=> b!639835 (=> (not res!414331) (not e!366199))))

(assert (=> b!639835 (= res!414331 (validKeyInArray!0 (select (arr!18385 a!2986) j!136)))))

(declare-fun b!639836 () Bool)

(declare-fun res!414334 () Bool)

(assert (=> b!639836 (=> (not res!414334) (not e!366207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38328 (_ BitVec 32)) Bool)

(assert (=> b!639836 (= res!414334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!57826 res!414323) b!639826))

(assert (= (and b!639826 res!414333) b!639835))

(assert (= (and b!639835 res!414331) b!639830))

(assert (= (and b!639830 res!414336) b!639823))

(assert (= (and b!639823 res!414327) b!639831))

(assert (= (and b!639831 res!414338) b!639836))

(assert (= (and b!639836 res!414334) b!639834))

(assert (= (and b!639834 res!414329) b!639819))

(assert (= (and b!639819 res!414337) b!639822))

(assert (= (and b!639822 res!414330) b!639832))

(assert (= (and b!639832 res!414328) b!639824))

(assert (= (and b!639824 res!414326) b!639829))

(assert (= (and b!639824 c!73115) b!639818))

(assert (= (and b!639824 (not c!73115)) b!639821))

(assert (= (and b!639824 (not res!414335)) b!639820))

(assert (= (and b!639820 res!414322) b!639825))

(assert (= (and b!639825 (not res!414325)) b!639828))

(assert (= (and b!639828 res!414324) b!639833))

(assert (= (and b!639820 (not res!414332)) b!639827))

(declare-fun m!613665 () Bool)

(assert (=> b!639827 m!613665))

(declare-fun m!613667 () Bool)

(assert (=> b!639827 m!613667))

(declare-fun m!613669 () Bool)

(assert (=> b!639827 m!613669))

(declare-fun m!613671 () Bool)

(assert (=> b!639827 m!613671))

(assert (=> b!639827 m!613667))

(declare-fun m!613673 () Bool)

(assert (=> b!639827 m!613673))

(assert (=> b!639827 m!613667))

(declare-fun m!613675 () Bool)

(assert (=> b!639827 m!613675))

(declare-fun m!613677 () Bool)

(assert (=> b!639827 m!613677))

(declare-fun m!613679 () Bool)

(assert (=> b!639822 m!613679))

(declare-fun m!613681 () Bool)

(assert (=> b!639822 m!613681))

(assert (=> b!639825 m!613667))

(assert (=> b!639828 m!613667))

(assert (=> b!639828 m!613667))

(declare-fun m!613683 () Bool)

(assert (=> b!639828 m!613683))

(declare-fun m!613685 () Bool)

(assert (=> b!639824 m!613685))

(declare-fun m!613687 () Bool)

(assert (=> b!639824 m!613687))

(assert (=> b!639824 m!613667))

(declare-fun m!613689 () Bool)

(assert (=> b!639824 m!613689))

(declare-fun m!613691 () Bool)

(assert (=> b!639824 m!613691))

(assert (=> b!639824 m!613667))

(declare-fun m!613693 () Bool)

(assert (=> b!639824 m!613693))

(assert (=> b!639824 m!613679))

(declare-fun m!613695 () Bool)

(assert (=> b!639824 m!613695))

(declare-fun m!613697 () Bool)

(assert (=> start!57826 m!613697))

(declare-fun m!613699 () Bool)

(assert (=> start!57826 m!613699))

(declare-fun m!613701 () Bool)

(assert (=> b!639823 m!613701))

(declare-fun m!613703 () Bool)

(assert (=> b!639836 m!613703))

(declare-fun m!613705 () Bool)

(assert (=> b!639830 m!613705))

(assert (=> b!639835 m!613667))

(assert (=> b!639835 m!613667))

(declare-fun m!613707 () Bool)

(assert (=> b!639835 m!613707))

(assert (=> b!639820 m!613667))

(assert (=> b!639820 m!613679))

(declare-fun m!613709 () Bool)

(assert (=> b!639820 m!613709))

(assert (=> b!639833 m!613667))

(assert (=> b!639833 m!613667))

(declare-fun m!613711 () Bool)

(assert (=> b!639833 m!613711))

(declare-fun m!613713 () Bool)

(assert (=> b!639832 m!613713))

(assert (=> b!639832 m!613667))

(assert (=> b!639832 m!613667))

(declare-fun m!613715 () Bool)

(assert (=> b!639832 m!613715))

(declare-fun m!613717 () Bool)

(assert (=> b!639834 m!613717))

(declare-fun m!613719 () Bool)

(assert (=> b!639819 m!613719))

(declare-fun m!613721 () Bool)

(assert (=> b!639831 m!613721))

(check-sat (not b!639830) (not b!639827) (not b!639836) (not b!639834) (not b!639824) (not b!639835) (not b!639823) (not b!639833) (not b!639832) (not start!57826) (not b!639831) (not b!639828))
(check-sat)
(get-model)

(declare-fun d!90343 () Bool)

(declare-fun lt!296115 () SeekEntryResult!6825)

(get-info :version)

(assert (=> d!90343 (and (or ((_ is Undefined!6825) lt!296115) (not ((_ is Found!6825) lt!296115)) (and (bvsge (index!29618 lt!296115) #b00000000000000000000000000000000) (bvslt (index!29618 lt!296115) (size!18749 a!2986)))) (or ((_ is Undefined!6825) lt!296115) ((_ is Found!6825) lt!296115) (not ((_ is MissingZero!6825) lt!296115)) (and (bvsge (index!29617 lt!296115) #b00000000000000000000000000000000) (bvslt (index!29617 lt!296115) (size!18749 a!2986)))) (or ((_ is Undefined!6825) lt!296115) ((_ is Found!6825) lt!296115) ((_ is MissingZero!6825) lt!296115) (not ((_ is MissingVacant!6825) lt!296115)) (and (bvsge (index!29620 lt!296115) #b00000000000000000000000000000000) (bvslt (index!29620 lt!296115) (size!18749 a!2986)))) (or ((_ is Undefined!6825) lt!296115) (ite ((_ is Found!6825) lt!296115) (= (select (arr!18385 a!2986) (index!29618 lt!296115)) k0!1786) (ite ((_ is MissingZero!6825) lt!296115) (= (select (arr!18385 a!2986) (index!29617 lt!296115)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6825) lt!296115) (= (select (arr!18385 a!2986) (index!29620 lt!296115)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!366253 () SeekEntryResult!6825)

(assert (=> d!90343 (= lt!296115 e!366253)))

(declare-fun c!73126 () Bool)

(declare-fun lt!296116 () SeekEntryResult!6825)

(assert (=> d!90343 (= c!73126 (and ((_ is Intermediate!6825) lt!296116) (undefined!7637 lt!296116)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38328 (_ BitVec 32)) SeekEntryResult!6825)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90343 (= lt!296116 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90343 (validMask!0 mask!3053)))

(assert (=> d!90343 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!296115)))

(declare-fun e!366255 () SeekEntryResult!6825)

(declare-fun b!639906 () Bool)

(assert (=> b!639906 (= e!366255 (seekKeyOrZeroReturnVacant!0 (x!58372 lt!296116) (index!29619 lt!296116) (index!29619 lt!296116) k0!1786 a!2986 mask!3053))))

(declare-fun b!639907 () Bool)

(declare-fun c!73125 () Bool)

(declare-fun lt!296114 () (_ BitVec 64))

(assert (=> b!639907 (= c!73125 (= lt!296114 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!366254 () SeekEntryResult!6825)

(assert (=> b!639907 (= e!366254 e!366255)))

(declare-fun b!639908 () Bool)

(assert (=> b!639908 (= e!366255 (MissingZero!6825 (index!29619 lt!296116)))))

(declare-fun b!639909 () Bool)

(assert (=> b!639909 (= e!366254 (Found!6825 (index!29619 lt!296116)))))

(declare-fun b!639910 () Bool)

(assert (=> b!639910 (= e!366253 e!366254)))

(assert (=> b!639910 (= lt!296114 (select (arr!18385 a!2986) (index!29619 lt!296116)))))

(declare-fun c!73127 () Bool)

(assert (=> b!639910 (= c!73127 (= lt!296114 k0!1786))))

(declare-fun b!639911 () Bool)

(assert (=> b!639911 (= e!366253 Undefined!6825)))

(assert (= (and d!90343 c!73126) b!639911))

(assert (= (and d!90343 (not c!73126)) b!639910))

(assert (= (and b!639910 c!73127) b!639909))

(assert (= (and b!639910 (not c!73127)) b!639907))

(assert (= (and b!639907 c!73125) b!639908))

(assert (= (and b!639907 (not c!73125)) b!639906))

(declare-fun m!613781 () Bool)

(assert (=> d!90343 m!613781))

(declare-fun m!613783 () Bool)

(assert (=> d!90343 m!613783))

(declare-fun m!613785 () Bool)

(assert (=> d!90343 m!613785))

(declare-fun m!613787 () Bool)

(assert (=> d!90343 m!613787))

(assert (=> d!90343 m!613697))

(declare-fun m!613789 () Bool)

(assert (=> d!90343 m!613789))

(assert (=> d!90343 m!613783))

(declare-fun m!613791 () Bool)

(assert (=> b!639906 m!613791))

(declare-fun m!613793 () Bool)

(assert (=> b!639910 m!613793))

(assert (=> b!639831 d!90343))

(declare-fun d!90345 () Bool)

(assert (=> d!90345 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57826 d!90345))

(declare-fun d!90347 () Bool)

(assert (=> d!90347 (= (array_inv!14181 a!2986) (bvsge (size!18749 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57826 d!90347))

(declare-fun b!639938 () Bool)

(declare-fun e!366272 () SeekEntryResult!6825)

(assert (=> b!639938 (= e!366272 Undefined!6825)))

(declare-fun b!639939 () Bool)

(declare-fun e!366274 () SeekEntryResult!6825)

(assert (=> b!639939 (= e!366272 e!366274)))

(declare-fun c!73136 () Bool)

(declare-fun lt!296121 () (_ BitVec 64))

(assert (=> b!639939 (= c!73136 (= lt!296121 (select (arr!18385 a!2986) j!136)))))

(declare-fun b!639940 () Bool)

(declare-fun c!73138 () Bool)

(assert (=> b!639940 (= c!73138 (= lt!296121 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!366273 () SeekEntryResult!6825)

(assert (=> b!639940 (= e!366274 e!366273)))

(declare-fun b!639941 () Bool)

(assert (=> b!639941 (= e!366274 (Found!6825 index!984))))

(declare-fun b!639942 () Bool)

(assert (=> b!639942 (= e!366273 (MissingVacant!6825 vacantSpotIndex!68))))

(declare-fun b!639943 () Bool)

(assert (=> b!639943 (= e!366273 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18385 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!90349 () Bool)

(declare-fun lt!296122 () SeekEntryResult!6825)

(assert (=> d!90349 (and (or ((_ is Undefined!6825) lt!296122) (not ((_ is Found!6825) lt!296122)) (and (bvsge (index!29618 lt!296122) #b00000000000000000000000000000000) (bvslt (index!29618 lt!296122) (size!18749 a!2986)))) (or ((_ is Undefined!6825) lt!296122) ((_ is Found!6825) lt!296122) (not ((_ is MissingVacant!6825) lt!296122)) (not (= (index!29620 lt!296122) vacantSpotIndex!68)) (and (bvsge (index!29620 lt!296122) #b00000000000000000000000000000000) (bvslt (index!29620 lt!296122) (size!18749 a!2986)))) (or ((_ is Undefined!6825) lt!296122) (ite ((_ is Found!6825) lt!296122) (= (select (arr!18385 a!2986) (index!29618 lt!296122)) (select (arr!18385 a!2986) j!136)) (and ((_ is MissingVacant!6825) lt!296122) (= (index!29620 lt!296122) vacantSpotIndex!68) (= (select (arr!18385 a!2986) (index!29620 lt!296122)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90349 (= lt!296122 e!366272)))

(declare-fun c!73137 () Bool)

(assert (=> d!90349 (= c!73137 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90349 (= lt!296121 (select (arr!18385 a!2986) index!984))))

(assert (=> d!90349 (validMask!0 mask!3053)))

(assert (=> d!90349 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18385 a!2986) j!136) a!2986 mask!3053) lt!296122)))

(assert (= (and d!90349 c!73137) b!639938))

(assert (= (and d!90349 (not c!73137)) b!639939))

(assert (= (and b!639939 c!73136) b!639941))

(assert (= (and b!639939 (not c!73136)) b!639940))

(assert (= (and b!639940 c!73138) b!639942))

(assert (= (and b!639940 (not c!73138)) b!639943))

(assert (=> b!639943 m!613685))

(assert (=> b!639943 m!613685))

(assert (=> b!639943 m!613667))

(declare-fun m!613795 () Bool)

(assert (=> b!639943 m!613795))

(declare-fun m!613797 () Bool)

(assert (=> d!90349 m!613797))

(declare-fun m!613799 () Bool)

(assert (=> d!90349 m!613799))

(assert (=> d!90349 m!613713))

(assert (=> d!90349 m!613697))

(assert (=> b!639832 d!90349))

(declare-fun d!90355 () Bool)

(assert (=> d!90355 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!639830 d!90355))

(declare-fun d!90359 () Bool)

(declare-fun res!414415 () Bool)

(declare-fun e!366296 () Bool)

(assert (=> d!90359 (=> res!414415 e!366296)))

(assert (=> d!90359 (= res!414415 (= (select (arr!18385 lt!296068) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18385 a!2986) j!136)))))

(assert (=> d!90359 (= (arrayContainsKey!0 lt!296068 (select (arr!18385 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!366296)))

(declare-fun b!639967 () Bool)

(declare-fun e!366297 () Bool)

(assert (=> b!639967 (= e!366296 e!366297)))

(declare-fun res!414416 () Bool)

(assert (=> b!639967 (=> (not res!414416) (not e!366297))))

(assert (=> b!639967 (= res!414416 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18749 lt!296068)))))

(declare-fun b!639968 () Bool)

(assert (=> b!639968 (= e!366297 (arrayContainsKey!0 lt!296068 (select (arr!18385 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90359 (not res!414415)) b!639967))

(assert (= (and b!639967 res!414416) b!639968))

(declare-fun m!613825 () Bool)

(assert (=> d!90359 m!613825))

(assert (=> b!639968 m!613667))

(declare-fun m!613827 () Bool)

(assert (=> b!639968 m!613827))

(assert (=> b!639827 d!90359))

(declare-fun b!639991 () Bool)

(declare-fun e!366317 () Bool)

(declare-fun e!366319 () Bool)

(assert (=> b!639991 (= e!366317 e!366319)))

(declare-fun c!73147 () Bool)

(assert (=> b!639991 (= c!73147 (validKeyInArray!0 (select (arr!18385 lt!296068) #b00000000000000000000000000000000)))))

(declare-fun b!639992 () Bool)

(declare-fun e!366318 () Bool)

(assert (=> b!639992 (= e!366318 e!366317)))

(declare-fun res!414431 () Bool)

(assert (=> b!639992 (=> (not res!414431) (not e!366317))))

(declare-fun e!366316 () Bool)

(assert (=> b!639992 (= res!414431 (not e!366316))))

(declare-fun res!414433 () Bool)

(assert (=> b!639992 (=> (not res!414433) (not e!366316))))

(assert (=> b!639992 (= res!414433 (validKeyInArray!0 (select (arr!18385 lt!296068) #b00000000000000000000000000000000)))))

(declare-fun bm!33496 () Bool)

(declare-fun call!33499 () Bool)

(assert (=> bm!33496 (= call!33499 (arrayNoDuplicates!0 lt!296068 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73147 (Cons!12422 (select (arr!18385 lt!296068) #b00000000000000000000000000000000) Nil!12423) Nil!12423)))))

(declare-fun b!639993 () Bool)

(declare-fun contains!3124 (List!12426 (_ BitVec 64)) Bool)

(assert (=> b!639993 (= e!366316 (contains!3124 Nil!12423 (select (arr!18385 lt!296068) #b00000000000000000000000000000000)))))

(declare-fun b!639994 () Bool)

(assert (=> b!639994 (= e!366319 call!33499)))

(declare-fun d!90365 () Bool)

(declare-fun res!414432 () Bool)

(assert (=> d!90365 (=> res!414432 e!366318)))

(assert (=> d!90365 (= res!414432 (bvsge #b00000000000000000000000000000000 (size!18749 lt!296068)))))

(assert (=> d!90365 (= (arrayNoDuplicates!0 lt!296068 #b00000000000000000000000000000000 Nil!12423) e!366318)))

(declare-fun b!639995 () Bool)

(assert (=> b!639995 (= e!366319 call!33499)))

(assert (= (and d!90365 (not res!414432)) b!639992))

(assert (= (and b!639992 res!414433) b!639993))

(assert (= (and b!639992 res!414431) b!639991))

(assert (= (and b!639991 c!73147) b!639994))

(assert (= (and b!639991 (not c!73147)) b!639995))

(assert (= (or b!639994 b!639995) bm!33496))

(declare-fun m!613833 () Bool)

(assert (=> b!639991 m!613833))

(assert (=> b!639991 m!613833))

(declare-fun m!613835 () Bool)

(assert (=> b!639991 m!613835))

(assert (=> b!639992 m!613833))

(assert (=> b!639992 m!613833))

(assert (=> b!639992 m!613835))

(assert (=> bm!33496 m!613833))

(declare-fun m!613837 () Bool)

(assert (=> bm!33496 m!613837))

(assert (=> b!639993 m!613833))

(assert (=> b!639993 m!613833))

(declare-fun m!613839 () Bool)

(assert (=> b!639993 m!613839))

(assert (=> b!639827 d!90365))

(declare-fun b!640009 () Bool)

(declare-fun e!366331 () Bool)

(declare-fun e!366333 () Bool)

(assert (=> b!640009 (= e!366331 e!366333)))

(declare-fun c!73151 () Bool)

(assert (=> b!640009 (= c!73151 (validKeyInArray!0 (select (arr!18385 lt!296068) j!136)))))

(declare-fun b!640010 () Bool)

(declare-fun e!366332 () Bool)

(assert (=> b!640010 (= e!366332 e!366331)))

(declare-fun res!414441 () Bool)

(assert (=> b!640010 (=> (not res!414441) (not e!366331))))

(declare-fun e!366330 () Bool)

(assert (=> b!640010 (= res!414441 (not e!366330))))

(declare-fun res!414443 () Bool)

(assert (=> b!640010 (=> (not res!414443) (not e!366330))))

(assert (=> b!640010 (= res!414443 (validKeyInArray!0 (select (arr!18385 lt!296068) j!136)))))

(declare-fun call!33501 () Bool)

(declare-fun bm!33498 () Bool)

(assert (=> bm!33498 (= call!33501 (arrayNoDuplicates!0 lt!296068 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73151 (Cons!12422 (select (arr!18385 lt!296068) j!136) Nil!12423) Nil!12423)))))

(declare-fun b!640011 () Bool)

(assert (=> b!640011 (= e!366330 (contains!3124 Nil!12423 (select (arr!18385 lt!296068) j!136)))))

(declare-fun b!640012 () Bool)

(assert (=> b!640012 (= e!366333 call!33501)))

(declare-fun d!90373 () Bool)

(declare-fun res!414442 () Bool)

(assert (=> d!90373 (=> res!414442 e!366332)))

(assert (=> d!90373 (= res!414442 (bvsge j!136 (size!18749 lt!296068)))))

(assert (=> d!90373 (= (arrayNoDuplicates!0 lt!296068 j!136 Nil!12423) e!366332)))

(declare-fun b!640013 () Bool)

(assert (=> b!640013 (= e!366333 call!33501)))

(assert (= (and d!90373 (not res!414442)) b!640010))

(assert (= (and b!640010 res!414443) b!640011))

(assert (= (and b!640010 res!414441) b!640009))

(assert (= (and b!640009 c!73151) b!640012))

(assert (= (and b!640009 (not c!73151)) b!640013))

(assert (= (or b!640012 b!640013) bm!33498))

(declare-fun m!613845 () Bool)

(assert (=> b!640009 m!613845))

(assert (=> b!640009 m!613845))

(declare-fun m!613847 () Bool)

(assert (=> b!640009 m!613847))

(assert (=> b!640010 m!613845))

(assert (=> b!640010 m!613845))

(assert (=> b!640010 m!613847))

(assert (=> bm!33498 m!613845))

(declare-fun m!613849 () Bool)

(assert (=> bm!33498 m!613849))

(assert (=> b!640011 m!613845))

(assert (=> b!640011 m!613845))

(declare-fun m!613851 () Bool)

(assert (=> b!640011 m!613851))

(assert (=> b!639827 d!90373))

(declare-fun d!90379 () Bool)

(declare-fun e!366353 () Bool)

(assert (=> d!90379 e!366353))

(declare-fun res!414461 () Bool)

(assert (=> d!90379 (=> (not res!414461) (not e!366353))))

(assert (=> d!90379 (= res!414461 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18749 a!2986))))))

(declare-fun lt!296143 () Unit!21634)

(declare-fun choose!41 (array!38328 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12426) Unit!21634)

(assert (=> d!90379 (= lt!296143 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12423))))

(assert (=> d!90379 (bvslt (size!18749 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90379 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12423) lt!296143)))

(declare-fun b!640035 () Bool)

(assert (=> b!640035 (= e!366353 (arrayNoDuplicates!0 (array!38329 (store (arr!18385 a!2986) i!1108 k0!1786) (size!18749 a!2986)) #b00000000000000000000000000000000 Nil!12423))))

(assert (= (and d!90379 res!414461) b!640035))

(declare-fun m!613879 () Bool)

(assert (=> d!90379 m!613879))

(assert (=> b!640035 m!613679))

(declare-fun m!613881 () Bool)

(assert (=> b!640035 m!613881))

(assert (=> b!639827 d!90379))

(declare-fun d!90391 () Bool)

(assert (=> d!90391 (arrayNoDuplicates!0 lt!296068 j!136 Nil!12423)))

(declare-fun lt!296149 () Unit!21634)

(declare-fun choose!39 (array!38328 (_ BitVec 32) (_ BitVec 32)) Unit!21634)

(assert (=> d!90391 (= lt!296149 (choose!39 lt!296068 #b00000000000000000000000000000000 j!136))))

(assert (=> d!90391 (bvslt (size!18749 lt!296068) #b01111111111111111111111111111111)))

(assert (=> d!90391 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!296068 #b00000000000000000000000000000000 j!136) lt!296149)))

(declare-fun bs!19172 () Bool)

(assert (= bs!19172 d!90391))

(assert (=> bs!19172 m!613671))

(declare-fun m!613885 () Bool)

(assert (=> bs!19172 m!613885))

(assert (=> b!639827 d!90391))

(declare-fun d!90395 () Bool)

(assert (=> d!90395 (arrayContainsKey!0 lt!296068 (select (arr!18385 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296154 () Unit!21634)

(declare-fun choose!114 (array!38328 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21634)

(assert (=> d!90395 (= lt!296154 (choose!114 lt!296068 (select (arr!18385 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90395 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90395 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296068 (select (arr!18385 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!296154)))

(declare-fun bs!19173 () Bool)

(assert (= bs!19173 d!90395))

(assert (=> bs!19173 m!613667))

(assert (=> bs!19173 m!613673))

(assert (=> bs!19173 m!613667))

(declare-fun m!613887 () Bool)

(assert (=> bs!19173 m!613887))

(assert (=> b!639827 d!90395))

(declare-fun d!90397 () Bool)

(declare-fun res!414464 () Bool)

(declare-fun e!366356 () Bool)

(assert (=> d!90397 (=> res!414464 e!366356)))

(assert (=> d!90397 (= res!414464 (= (select (arr!18385 lt!296068) j!136) (select (arr!18385 a!2986) j!136)))))

(assert (=> d!90397 (= (arrayContainsKey!0 lt!296068 (select (arr!18385 a!2986) j!136) j!136) e!366356)))

(declare-fun b!640038 () Bool)

(declare-fun e!366357 () Bool)

(assert (=> b!640038 (= e!366356 e!366357)))

(declare-fun res!414465 () Bool)

(assert (=> b!640038 (=> (not res!414465) (not e!366357))))

(assert (=> b!640038 (= res!414465 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18749 lt!296068)))))

(declare-fun b!640039 () Bool)

(assert (=> b!640039 (= e!366357 (arrayContainsKey!0 lt!296068 (select (arr!18385 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90397 (not res!414464)) b!640038))

(assert (= (and b!640038 res!414465) b!640039))

(assert (=> d!90397 m!613845))

(assert (=> b!640039 m!613667))

(declare-fun m!613889 () Bool)

(assert (=> b!640039 m!613889))

(assert (=> b!639828 d!90397))

(declare-fun d!90399 () Bool)

(assert (=> d!90399 (= (validKeyInArray!0 (select (arr!18385 a!2986) j!136)) (and (not (= (select (arr!18385 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18385 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!639835 d!90399))

(declare-fun b!640058 () Bool)

(declare-fun e!366374 () Bool)

(declare-fun call!33509 () Bool)

(assert (=> b!640058 (= e!366374 call!33509)))

(declare-fun b!640059 () Bool)

(declare-fun e!366375 () Bool)

(assert (=> b!640059 (= e!366375 e!366374)))

(declare-fun lt!296167 () (_ BitVec 64))

(assert (=> b!640059 (= lt!296167 (select (arr!18385 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!296166 () Unit!21634)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38328 (_ BitVec 64) (_ BitVec 32)) Unit!21634)

(assert (=> b!640059 (= lt!296166 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!296167 #b00000000000000000000000000000000))))

(assert (=> b!640059 (arrayContainsKey!0 a!2986 lt!296167 #b00000000000000000000000000000000)))

(declare-fun lt!296165 () Unit!21634)

(assert (=> b!640059 (= lt!296165 lt!296166)))

(declare-fun res!414479 () Bool)

(assert (=> b!640059 (= res!414479 (= (seekEntryOrOpen!0 (select (arr!18385 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6825 #b00000000000000000000000000000000)))))

(assert (=> b!640059 (=> (not res!414479) (not e!366374))))

(declare-fun bm!33506 () Bool)

(assert (=> bm!33506 (= call!33509 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!640060 () Bool)

(assert (=> b!640060 (= e!366375 call!33509)))

(declare-fun d!90401 () Bool)

(declare-fun res!414478 () Bool)

(declare-fun e!366373 () Bool)

(assert (=> d!90401 (=> res!414478 e!366373)))

(assert (=> d!90401 (= res!414478 (bvsge #b00000000000000000000000000000000 (size!18749 a!2986)))))

(assert (=> d!90401 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!366373)))

(declare-fun b!640061 () Bool)

(assert (=> b!640061 (= e!366373 e!366375)))

(declare-fun c!73157 () Bool)

(assert (=> b!640061 (= c!73157 (validKeyInArray!0 (select (arr!18385 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90401 (not res!414478)) b!640061))

(assert (= (and b!640061 c!73157) b!640059))

(assert (= (and b!640061 (not c!73157)) b!640060))

(assert (= (and b!640059 res!414479) b!640058))

(assert (= (or b!640058 b!640060) bm!33506))

(declare-fun m!613909 () Bool)

(assert (=> b!640059 m!613909))

(declare-fun m!613911 () Bool)

(assert (=> b!640059 m!613911))

(declare-fun m!613913 () Bool)

(assert (=> b!640059 m!613913))

(assert (=> b!640059 m!613909))

(declare-fun m!613915 () Bool)

(assert (=> b!640059 m!613915))

(declare-fun m!613917 () Bool)

(assert (=> bm!33506 m!613917))

(assert (=> b!640061 m!613909))

(assert (=> b!640061 m!613909))

(declare-fun m!613919 () Bool)

(assert (=> b!640061 m!613919))

(assert (=> b!639836 d!90401))

(declare-fun d!90417 () Bool)

(declare-fun res!414480 () Bool)

(declare-fun e!366376 () Bool)

(assert (=> d!90417 (=> res!414480 e!366376)))

(assert (=> d!90417 (= res!414480 (= (select (arr!18385 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90417 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!366376)))

(declare-fun b!640062 () Bool)

(declare-fun e!366377 () Bool)

(assert (=> b!640062 (= e!366376 e!366377)))

(declare-fun res!414481 () Bool)

(assert (=> b!640062 (=> (not res!414481) (not e!366377))))

(assert (=> b!640062 (= res!414481 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18749 a!2986)))))

(declare-fun b!640063 () Bool)

(assert (=> b!640063 (= e!366377 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90417 (not res!414480)) b!640062))

(assert (= (and b!640062 res!414481) b!640063))

(assert (=> d!90417 m!613909))

(declare-fun m!613921 () Bool)

(assert (=> b!640063 m!613921))

(assert (=> b!639823 d!90417))

(declare-fun b!640064 () Bool)

(declare-fun e!366379 () Bool)

(declare-fun e!366381 () Bool)

(assert (=> b!640064 (= e!366379 e!366381)))

(declare-fun c!73158 () Bool)

(assert (=> b!640064 (= c!73158 (validKeyInArray!0 (select (arr!18385 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!640065 () Bool)

(declare-fun e!366380 () Bool)

(assert (=> b!640065 (= e!366380 e!366379)))

(declare-fun res!414482 () Bool)

(assert (=> b!640065 (=> (not res!414482) (not e!366379))))

(declare-fun e!366378 () Bool)

(assert (=> b!640065 (= res!414482 (not e!366378))))

(declare-fun res!414484 () Bool)

(assert (=> b!640065 (=> (not res!414484) (not e!366378))))

(assert (=> b!640065 (= res!414484 (validKeyInArray!0 (select (arr!18385 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33507 () Bool)

(declare-fun call!33510 () Bool)

(assert (=> bm!33507 (= call!33510 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73158 (Cons!12422 (select (arr!18385 a!2986) #b00000000000000000000000000000000) Nil!12423) Nil!12423)))))

(declare-fun b!640066 () Bool)

(assert (=> b!640066 (= e!366378 (contains!3124 Nil!12423 (select (arr!18385 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!640067 () Bool)

(assert (=> b!640067 (= e!366381 call!33510)))

(declare-fun d!90419 () Bool)

(declare-fun res!414483 () Bool)

(assert (=> d!90419 (=> res!414483 e!366380)))

(assert (=> d!90419 (= res!414483 (bvsge #b00000000000000000000000000000000 (size!18749 a!2986)))))

(assert (=> d!90419 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12423) e!366380)))

(declare-fun b!640068 () Bool)

(assert (=> b!640068 (= e!366381 call!33510)))

(assert (= (and d!90419 (not res!414483)) b!640065))

(assert (= (and b!640065 res!414484) b!640066))

(assert (= (and b!640065 res!414482) b!640064))

(assert (= (and b!640064 c!73158) b!640067))

(assert (= (and b!640064 (not c!73158)) b!640068))

(assert (= (or b!640067 b!640068) bm!33507))

(assert (=> b!640064 m!613909))

(assert (=> b!640064 m!613909))

(assert (=> b!640064 m!613919))

(assert (=> b!640065 m!613909))

(assert (=> b!640065 m!613909))

(assert (=> b!640065 m!613919))

(assert (=> bm!33507 m!613909))

(declare-fun m!613923 () Bool)

(assert (=> bm!33507 m!613923))

(assert (=> b!640066 m!613909))

(assert (=> b!640066 m!613909))

(declare-fun m!613925 () Bool)

(assert (=> b!640066 m!613925))

(assert (=> b!639834 d!90419))

(declare-fun b!640069 () Bool)

(declare-fun e!366382 () SeekEntryResult!6825)

(assert (=> b!640069 (= e!366382 Undefined!6825)))

(declare-fun b!640070 () Bool)

(declare-fun e!366384 () SeekEntryResult!6825)

(assert (=> b!640070 (= e!366382 e!366384)))

(declare-fun c!73159 () Bool)

(declare-fun lt!296168 () (_ BitVec 64))

(assert (=> b!640070 (= c!73159 (= lt!296168 lt!296067))))

(declare-fun b!640071 () Bool)

(declare-fun c!73161 () Bool)

(assert (=> b!640071 (= c!73161 (= lt!296168 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!366383 () SeekEntryResult!6825)

(assert (=> b!640071 (= e!366384 e!366383)))

(declare-fun b!640072 () Bool)

(assert (=> b!640072 (= e!366384 (Found!6825 lt!296056))))

(declare-fun b!640073 () Bool)

(assert (=> b!640073 (= e!366383 (MissingVacant!6825 vacantSpotIndex!68))))

(declare-fun b!640074 () Bool)

(assert (=> b!640074 (= e!366383 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!296056 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!296067 lt!296068 mask!3053))))

(declare-fun lt!296169 () SeekEntryResult!6825)

(declare-fun d!90421 () Bool)

(assert (=> d!90421 (and (or ((_ is Undefined!6825) lt!296169) (not ((_ is Found!6825) lt!296169)) (and (bvsge (index!29618 lt!296169) #b00000000000000000000000000000000) (bvslt (index!29618 lt!296169) (size!18749 lt!296068)))) (or ((_ is Undefined!6825) lt!296169) ((_ is Found!6825) lt!296169) (not ((_ is MissingVacant!6825) lt!296169)) (not (= (index!29620 lt!296169) vacantSpotIndex!68)) (and (bvsge (index!29620 lt!296169) #b00000000000000000000000000000000) (bvslt (index!29620 lt!296169) (size!18749 lt!296068)))) (or ((_ is Undefined!6825) lt!296169) (ite ((_ is Found!6825) lt!296169) (= (select (arr!18385 lt!296068) (index!29618 lt!296169)) lt!296067) (and ((_ is MissingVacant!6825) lt!296169) (= (index!29620 lt!296169) vacantSpotIndex!68) (= (select (arr!18385 lt!296068) (index!29620 lt!296169)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90421 (= lt!296169 e!366382)))

(declare-fun c!73160 () Bool)

(assert (=> d!90421 (= c!73160 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90421 (= lt!296168 (select (arr!18385 lt!296068) lt!296056))))

(assert (=> d!90421 (validMask!0 mask!3053)))

(assert (=> d!90421 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296056 vacantSpotIndex!68 lt!296067 lt!296068 mask!3053) lt!296169)))

(assert (= (and d!90421 c!73160) b!640069))

(assert (= (and d!90421 (not c!73160)) b!640070))

(assert (= (and b!640070 c!73159) b!640072))

(assert (= (and b!640070 (not c!73159)) b!640071))

(assert (= (and b!640071 c!73161) b!640073))

(assert (= (and b!640071 (not c!73161)) b!640074))

(declare-fun m!613927 () Bool)

(assert (=> b!640074 m!613927))

(assert (=> b!640074 m!613927))

(declare-fun m!613929 () Bool)

(assert (=> b!640074 m!613929))

(declare-fun m!613931 () Bool)

(assert (=> d!90421 m!613931))

(declare-fun m!613933 () Bool)

(assert (=> d!90421 m!613933))

(declare-fun m!613935 () Bool)

(assert (=> d!90421 m!613935))

(assert (=> d!90421 m!613697))

(assert (=> b!639824 d!90421))

(declare-fun d!90423 () Bool)

(declare-fun e!366396 () Bool)

(assert (=> d!90423 e!366396))

(declare-fun res!414487 () Bool)

(assert (=> d!90423 (=> (not res!414487) (not e!366396))))

(assert (=> d!90423 (= res!414487 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18749 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18749 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18749 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18749 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18749 a!2986))))))

(declare-fun lt!296178 () Unit!21634)

(declare-fun choose!9 (array!38328 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21634)

(assert (=> d!90423 (= lt!296178 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296056 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90423 (validMask!0 mask!3053)))

(assert (=> d!90423 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296056 vacantSpotIndex!68 mask!3053) lt!296178)))

(declare-fun b!640095 () Bool)

(assert (=> b!640095 (= e!366396 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296056 vacantSpotIndex!68 (select (arr!18385 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296056 vacantSpotIndex!68 (select (store (arr!18385 a!2986) i!1108 k0!1786) j!136) (array!38329 (store (arr!18385 a!2986) i!1108 k0!1786) (size!18749 a!2986)) mask!3053)))))

(assert (= (and d!90423 res!414487) b!640095))

(declare-fun m!613943 () Bool)

(assert (=> d!90423 m!613943))

(assert (=> d!90423 m!613697))

(assert (=> b!640095 m!613679))

(assert (=> b!640095 m!613687))

(declare-fun m!613945 () Bool)

(assert (=> b!640095 m!613945))

(assert (=> b!640095 m!613667))

(assert (=> b!640095 m!613693))

(assert (=> b!640095 m!613667))

(assert (=> b!640095 m!613687))

(assert (=> b!639824 d!90423))

(declare-fun b!640096 () Bool)

(declare-fun e!366397 () SeekEntryResult!6825)

(assert (=> b!640096 (= e!366397 Undefined!6825)))

(declare-fun b!640097 () Bool)

(declare-fun e!366399 () SeekEntryResult!6825)

(assert (=> b!640097 (= e!366397 e!366399)))

(declare-fun c!73171 () Bool)

(declare-fun lt!296179 () (_ BitVec 64))

(assert (=> b!640097 (= c!73171 (= lt!296179 lt!296067))))

(declare-fun b!640098 () Bool)

(declare-fun c!73173 () Bool)

(assert (=> b!640098 (= c!73173 (= lt!296179 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!366398 () SeekEntryResult!6825)

(assert (=> b!640098 (= e!366399 e!366398)))

(declare-fun b!640099 () Bool)

(assert (=> b!640099 (= e!366399 (Found!6825 index!984))))

(declare-fun b!640100 () Bool)

(assert (=> b!640100 (= e!366398 (MissingVacant!6825 vacantSpotIndex!68))))

(declare-fun b!640101 () Bool)

(assert (=> b!640101 (= e!366398 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!296067 lt!296068 mask!3053))))

(declare-fun d!90433 () Bool)

(declare-fun lt!296180 () SeekEntryResult!6825)

(assert (=> d!90433 (and (or ((_ is Undefined!6825) lt!296180) (not ((_ is Found!6825) lt!296180)) (and (bvsge (index!29618 lt!296180) #b00000000000000000000000000000000) (bvslt (index!29618 lt!296180) (size!18749 lt!296068)))) (or ((_ is Undefined!6825) lt!296180) ((_ is Found!6825) lt!296180) (not ((_ is MissingVacant!6825) lt!296180)) (not (= (index!29620 lt!296180) vacantSpotIndex!68)) (and (bvsge (index!29620 lt!296180) #b00000000000000000000000000000000) (bvslt (index!29620 lt!296180) (size!18749 lt!296068)))) (or ((_ is Undefined!6825) lt!296180) (ite ((_ is Found!6825) lt!296180) (= (select (arr!18385 lt!296068) (index!29618 lt!296180)) lt!296067) (and ((_ is MissingVacant!6825) lt!296180) (= (index!29620 lt!296180) vacantSpotIndex!68) (= (select (arr!18385 lt!296068) (index!29620 lt!296180)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90433 (= lt!296180 e!366397)))

(declare-fun c!73172 () Bool)

(assert (=> d!90433 (= c!73172 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90433 (= lt!296179 (select (arr!18385 lt!296068) index!984))))

(assert (=> d!90433 (validMask!0 mask!3053)))

(assert (=> d!90433 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296067 lt!296068 mask!3053) lt!296180)))

(assert (= (and d!90433 c!73172) b!640096))

(assert (= (and d!90433 (not c!73172)) b!640097))

(assert (= (and b!640097 c!73171) b!640099))

(assert (= (and b!640097 (not c!73171)) b!640098))

(assert (= (and b!640098 c!73173) b!640100))

(assert (= (and b!640098 (not c!73173)) b!640101))

(assert (=> b!640101 m!613685))

(assert (=> b!640101 m!613685))

(declare-fun m!613947 () Bool)

(assert (=> b!640101 m!613947))

(declare-fun m!613949 () Bool)

(assert (=> d!90433 m!613949))

(declare-fun m!613951 () Bool)

(assert (=> d!90433 m!613951))

(declare-fun m!613953 () Bool)

(assert (=> d!90433 m!613953))

(assert (=> d!90433 m!613697))

(assert (=> b!639824 d!90433))

(declare-fun b!640102 () Bool)

(declare-fun e!366400 () SeekEntryResult!6825)

(assert (=> b!640102 (= e!366400 Undefined!6825)))

(declare-fun b!640103 () Bool)

(declare-fun e!366402 () SeekEntryResult!6825)

(assert (=> b!640103 (= e!366400 e!366402)))

(declare-fun lt!296185 () (_ BitVec 64))

(declare-fun c!73174 () Bool)

(assert (=> b!640103 (= c!73174 (= lt!296185 (select (arr!18385 a!2986) j!136)))))

(declare-fun b!640104 () Bool)

(declare-fun c!73176 () Bool)

(assert (=> b!640104 (= c!73176 (= lt!296185 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!366401 () SeekEntryResult!6825)

(assert (=> b!640104 (= e!366402 e!366401)))

(declare-fun b!640105 () Bool)

(assert (=> b!640105 (= e!366402 (Found!6825 lt!296056))))

(declare-fun b!640106 () Bool)

(assert (=> b!640106 (= e!366401 (MissingVacant!6825 vacantSpotIndex!68))))

(declare-fun b!640107 () Bool)

(assert (=> b!640107 (= e!366401 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!296056 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18385 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!90435 () Bool)

(declare-fun lt!296186 () SeekEntryResult!6825)

(assert (=> d!90435 (and (or ((_ is Undefined!6825) lt!296186) (not ((_ is Found!6825) lt!296186)) (and (bvsge (index!29618 lt!296186) #b00000000000000000000000000000000) (bvslt (index!29618 lt!296186) (size!18749 a!2986)))) (or ((_ is Undefined!6825) lt!296186) ((_ is Found!6825) lt!296186) (not ((_ is MissingVacant!6825) lt!296186)) (not (= (index!29620 lt!296186) vacantSpotIndex!68)) (and (bvsge (index!29620 lt!296186) #b00000000000000000000000000000000) (bvslt (index!29620 lt!296186) (size!18749 a!2986)))) (or ((_ is Undefined!6825) lt!296186) (ite ((_ is Found!6825) lt!296186) (= (select (arr!18385 a!2986) (index!29618 lt!296186)) (select (arr!18385 a!2986) j!136)) (and ((_ is MissingVacant!6825) lt!296186) (= (index!29620 lt!296186) vacantSpotIndex!68) (= (select (arr!18385 a!2986) (index!29620 lt!296186)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90435 (= lt!296186 e!366400)))

(declare-fun c!73175 () Bool)

(assert (=> d!90435 (= c!73175 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90435 (= lt!296185 (select (arr!18385 a!2986) lt!296056))))

(assert (=> d!90435 (validMask!0 mask!3053)))

(assert (=> d!90435 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296056 vacantSpotIndex!68 (select (arr!18385 a!2986) j!136) a!2986 mask!3053) lt!296186)))

(assert (= (and d!90435 c!73175) b!640102))

(assert (= (and d!90435 (not c!73175)) b!640103))

(assert (= (and b!640103 c!73174) b!640105))

(assert (= (and b!640103 (not c!73174)) b!640104))

(assert (= (and b!640104 c!73176) b!640106))

(assert (= (and b!640104 (not c!73176)) b!640107))

(assert (=> b!640107 m!613927))

(assert (=> b!640107 m!613927))

(assert (=> b!640107 m!613667))

(declare-fun m!613955 () Bool)

(assert (=> b!640107 m!613955))

(declare-fun m!613957 () Bool)

(assert (=> d!90435 m!613957))

(declare-fun m!613959 () Bool)

(assert (=> d!90435 m!613959))

(declare-fun m!613961 () Bool)

(assert (=> d!90435 m!613961))

(assert (=> d!90435 m!613697))

(assert (=> b!639824 d!90435))

(declare-fun d!90437 () Bool)

(declare-fun lt!296189 () (_ BitVec 32))

(assert (=> d!90437 (and (bvsge lt!296189 #b00000000000000000000000000000000) (bvslt lt!296189 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90437 (= lt!296189 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90437 (validMask!0 mask!3053)))

(assert (=> d!90437 (= (nextIndex!0 index!984 x!910 mask!3053) lt!296189)))

(declare-fun bs!19175 () Bool)

(assert (= bs!19175 d!90437))

(declare-fun m!613963 () Bool)

(assert (=> bs!19175 m!613963))

(assert (=> bs!19175 m!613697))

(assert (=> b!639824 d!90437))

(declare-fun d!90439 () Bool)

(declare-fun res!414488 () Bool)

(declare-fun e!366409 () Bool)

(assert (=> d!90439 (=> res!414488 e!366409)))

(assert (=> d!90439 (= res!414488 (= (select (arr!18385 lt!296068) index!984) (select (arr!18385 a!2986) j!136)))))

(assert (=> d!90439 (= (arrayContainsKey!0 lt!296068 (select (arr!18385 a!2986) j!136) index!984) e!366409)))

(declare-fun b!640120 () Bool)

(declare-fun e!366410 () Bool)

(assert (=> b!640120 (= e!366409 e!366410)))

(declare-fun res!414489 () Bool)

(assert (=> b!640120 (=> (not res!414489) (not e!366410))))

(assert (=> b!640120 (= res!414489 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18749 lt!296068)))))

(declare-fun b!640121 () Bool)

(assert (=> b!640121 (= e!366410 (arrayContainsKey!0 lt!296068 (select (arr!18385 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90439 (not res!414488)) b!640120))

(assert (= (and b!640120 res!414489) b!640121))

(assert (=> d!90439 m!613953))

(assert (=> b!640121 m!613667))

(declare-fun m!613965 () Bool)

(assert (=> b!640121 m!613965))

(assert (=> b!639833 d!90439))

(check-sat (not b!640035) (not b!640010) (not d!90343) (not b!640095) (not d!90433) (not d!90423) (not b!640074) (not d!90391) (not b!640066) (not b!639991) (not b!640065) (not b!640107) (not b!639943) (not d!90437) (not d!90435) (not b!639992) (not b!640121) (not bm!33507) (not d!90395) (not bm!33496) (not d!90349) (not b!639906) (not b!640063) (not b!640009) (not b!640011) (not b!640064) (not b!640061) (not b!639993) (not d!90421) (not b!640039) (not b!640101) (not d!90379) (not b!639968) (not bm!33498) (not bm!33506) (not b!640059))
(check-sat)
