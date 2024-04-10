; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55342 () Bool)

(assert start!55342)

(declare-fun b!605871 () Bool)

(declare-fun res!389239 () Bool)

(declare-fun e!346824 () Bool)

(assert (=> b!605871 (=> (not res!389239) (not e!346824))))

(declare-datatypes ((array!37253 0))(
  ( (array!37254 (arr!17880 (Array (_ BitVec 32) (_ BitVec 64))) (size!18244 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37253)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!605871 (= res!389239 (validKeyInArray!0 (select (arr!17880 a!2986) j!136)))))

(declare-fun b!605872 () Bool)

(declare-fun e!346810 () Bool)

(declare-datatypes ((SeekEntryResult!6320 0))(
  ( (MissingZero!6320 (index!27549 (_ BitVec 32))) (Found!6320 (index!27550 (_ BitVec 32))) (Intermediate!6320 (undefined!7132 Bool) (index!27551 (_ BitVec 32)) (x!56355 (_ BitVec 32))) (Undefined!6320) (MissingVacant!6320 (index!27552 (_ BitVec 32))) )
))
(declare-fun lt!276499 () SeekEntryResult!6320)

(declare-fun lt!276487 () SeekEntryResult!6320)

(assert (=> b!605872 (= e!346810 (= lt!276499 lt!276487))))

(declare-fun b!605873 () Bool)

(declare-fun e!346813 () Bool)

(declare-fun e!346819 () Bool)

(assert (=> b!605873 (= e!346813 e!346819)))

(declare-fun res!389248 () Bool)

(assert (=> b!605873 (=> (not res!389248) (not e!346819))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!605873 (= res!389248 (= (select (store (arr!17880 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!276488 () array!37253)

(assert (=> b!605873 (= lt!276488 (array!37254 (store (arr!17880 a!2986) i!1108 k!1786) (size!18244 a!2986)))))

(declare-fun b!605874 () Bool)

(declare-fun e!346809 () Bool)

(declare-fun e!346818 () Bool)

(assert (=> b!605874 (= e!346809 e!346818)))

(declare-fun res!389242 () Bool)

(assert (=> b!605874 (=> (not res!389242) (not e!346818))))

(declare-fun arrayContainsKey!0 (array!37253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!605874 (= res!389242 (arrayContainsKey!0 lt!276488 (select (arr!17880 a!2986) j!136) j!136))))

(declare-fun b!605875 () Bool)

(declare-fun res!389252 () Bool)

(assert (=> b!605875 (=> (not res!389252) (not e!346824))))

(assert (=> b!605875 (= res!389252 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!605876 () Bool)

(declare-datatypes ((Unit!19300 0))(
  ( (Unit!19301) )
))
(declare-fun e!346822 () Unit!19300)

(declare-fun Unit!19302 () Unit!19300)

(assert (=> b!605876 (= e!346822 Unit!19302)))

(declare-fun b!605877 () Bool)

(declare-fun e!346821 () Unit!19300)

(declare-fun Unit!19303 () Unit!19300)

(assert (=> b!605877 (= e!346821 Unit!19303)))

(assert (=> b!605877 false))

(declare-fun b!605878 () Bool)

(declare-fun e!346823 () Bool)

(declare-fun e!346812 () Bool)

(assert (=> b!605878 (= e!346823 e!346812)))

(declare-fun res!389253 () Bool)

(assert (=> b!605878 (=> res!389253 e!346812)))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!605878 (= res!389253 (bvsge index!984 j!136))))

(declare-fun lt!276484 () Unit!19300)

(assert (=> b!605878 (= lt!276484 e!346822)))

(declare-fun c!68684 () Bool)

(assert (=> b!605878 (= c!68684 (bvslt j!136 index!984))))

(declare-fun res!389256 () Bool)

(assert (=> start!55342 (=> (not res!389256) (not e!346824))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55342 (= res!389256 (validMask!0 mask!3053))))

(assert (=> start!55342 e!346824))

(assert (=> start!55342 true))

(declare-fun array_inv!13676 (array!37253) Bool)

(assert (=> start!55342 (array_inv!13676 a!2986)))

(declare-fun b!605879 () Bool)

(declare-fun e!346815 () Bool)

(assert (=> b!605879 (= e!346812 e!346815)))

(declare-fun res!389257 () Bool)

(assert (=> b!605879 (=> res!389257 e!346815)))

(assert (=> b!605879 (= res!389257 (or (bvsgt #b00000000000000000000000000000000 (size!18244 a!2986)) (bvsge (size!18244 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!605879 (arrayContainsKey!0 lt!276488 (select (arr!17880 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276496 () Unit!19300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37253 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19300)

(assert (=> b!605879 (= lt!276496 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276488 (select (arr!17880 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!346816 () Bool)

(assert (=> b!605879 e!346816))

(declare-fun res!389258 () Bool)

(assert (=> b!605879 (=> (not res!389258) (not e!346816))))

(assert (=> b!605879 (= res!389258 (arrayContainsKey!0 lt!276488 (select (arr!17880 a!2986) j!136) j!136))))

(declare-fun b!605880 () Bool)

(declare-datatypes ((List!11921 0))(
  ( (Nil!11918) (Cons!11917 (h!12962 (_ BitVec 64)) (t!18149 List!11921)) )
))
(declare-fun noDuplicate!303 (List!11921) Bool)

(assert (=> b!605880 (= e!346815 (noDuplicate!303 Nil!11918))))

(declare-fun b!605881 () Bool)

(declare-fun res!389247 () Bool)

(assert (=> b!605881 (=> (not res!389247) (not e!346813))))

(declare-fun arrayNoDuplicates!0 (array!37253 (_ BitVec 32) List!11921) Bool)

(assert (=> b!605881 (= res!389247 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11918))))

(declare-fun b!605882 () Bool)

(declare-fun e!346811 () Bool)

(assert (=> b!605882 (= e!346819 e!346811)))

(declare-fun res!389245 () Bool)

(assert (=> b!605882 (=> (not res!389245) (not e!346811))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!605882 (= res!389245 (and (= lt!276499 (Found!6320 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17880 a!2986) index!984) (select (arr!17880 a!2986) j!136))) (not (= (select (arr!17880 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37253 (_ BitVec 32)) SeekEntryResult!6320)

(assert (=> b!605882 (= lt!276499 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17880 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605883 () Bool)

(declare-fun e!346814 () Bool)

(assert (=> b!605883 (= e!346811 (not e!346814))))

(declare-fun res!389240 () Bool)

(assert (=> b!605883 (=> res!389240 e!346814)))

(declare-fun lt!276486 () SeekEntryResult!6320)

(assert (=> b!605883 (= res!389240 (not (= lt!276486 (Found!6320 index!984))))))

(declare-fun lt!276485 () Unit!19300)

(assert (=> b!605883 (= lt!276485 e!346821)))

(declare-fun c!68683 () Bool)

(assert (=> b!605883 (= c!68683 (= lt!276486 Undefined!6320))))

(declare-fun lt!276492 () (_ BitVec 64))

(assert (=> b!605883 (= lt!276486 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276492 lt!276488 mask!3053))))

(assert (=> b!605883 e!346810))

(declare-fun res!389254 () Bool)

(assert (=> b!605883 (=> (not res!389254) (not e!346810))))

(declare-fun lt!276498 () (_ BitVec 32))

(assert (=> b!605883 (= res!389254 (= lt!276487 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276498 vacantSpotIndex!68 lt!276492 lt!276488 mask!3053)))))

(assert (=> b!605883 (= lt!276487 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276498 vacantSpotIndex!68 (select (arr!17880 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!605883 (= lt!276492 (select (store (arr!17880 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!276494 () Unit!19300)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37253 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19300)

(assert (=> b!605883 (= lt!276494 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276498 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!605883 (= lt!276498 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!605884 () Bool)

(declare-fun res!389255 () Bool)

(assert (=> b!605884 (=> (not res!389255) (not e!346824))))

(assert (=> b!605884 (= res!389255 (and (= (size!18244 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18244 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18244 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!605885 () Bool)

(assert (=> b!605885 (= e!346816 (arrayContainsKey!0 lt!276488 (select (arr!17880 a!2986) j!136) index!984))))

(declare-fun b!605886 () Bool)

(declare-fun Unit!19304 () Unit!19300)

(assert (=> b!605886 (= e!346821 Unit!19304)))

(declare-fun b!605887 () Bool)

(declare-fun res!389244 () Bool)

(assert (=> b!605887 (=> (not res!389244) (not e!346824))))

(assert (=> b!605887 (= res!389244 (validKeyInArray!0 k!1786))))

(declare-fun b!605888 () Bool)

(declare-fun e!346820 () Bool)

(assert (=> b!605888 (= e!346820 e!346809)))

(declare-fun res!389246 () Bool)

(assert (=> b!605888 (=> res!389246 e!346809)))

(declare-fun lt!276490 () (_ BitVec 64))

(assert (=> b!605888 (= res!389246 (or (not (= (select (arr!17880 a!2986) j!136) lt!276492)) (not (= (select (arr!17880 a!2986) j!136) lt!276490)) (bvsge j!136 index!984)))))

(declare-fun b!605889 () Bool)

(declare-fun res!389251 () Bool)

(assert (=> b!605889 (=> (not res!389251) (not e!346813))))

(assert (=> b!605889 (= res!389251 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17880 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!605890 () Bool)

(assert (=> b!605890 (= e!346818 (arrayContainsKey!0 lt!276488 (select (arr!17880 a!2986) j!136) index!984))))

(declare-fun b!605891 () Bool)

(assert (=> b!605891 (= e!346824 e!346813)))

(declare-fun res!389241 () Bool)

(assert (=> b!605891 (=> (not res!389241) (not e!346813))))

(declare-fun lt!276495 () SeekEntryResult!6320)

(assert (=> b!605891 (= res!389241 (or (= lt!276495 (MissingZero!6320 i!1108)) (= lt!276495 (MissingVacant!6320 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37253 (_ BitVec 32)) SeekEntryResult!6320)

(assert (=> b!605891 (= lt!276495 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!605892 () Bool)

(declare-fun res!389250 () Bool)

(assert (=> b!605892 (=> (not res!389250) (not e!346813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37253 (_ BitVec 32)) Bool)

(assert (=> b!605892 (= res!389250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!605893 () Bool)

(declare-fun Unit!19305 () Unit!19300)

(assert (=> b!605893 (= e!346822 Unit!19305)))

(declare-fun lt!276489 () Unit!19300)

(assert (=> b!605893 (= lt!276489 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276488 (select (arr!17880 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!605893 (arrayContainsKey!0 lt!276488 (select (arr!17880 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276497 () Unit!19300)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37253 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11921) Unit!19300)

(assert (=> b!605893 (= lt!276497 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11918))))

(assert (=> b!605893 (arrayNoDuplicates!0 lt!276488 #b00000000000000000000000000000000 Nil!11918)))

(declare-fun lt!276491 () Unit!19300)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37253 (_ BitVec 32) (_ BitVec 32)) Unit!19300)

(assert (=> b!605893 (= lt!276491 (lemmaNoDuplicateFromThenFromBigger!0 lt!276488 #b00000000000000000000000000000000 j!136))))

(assert (=> b!605893 (arrayNoDuplicates!0 lt!276488 j!136 Nil!11918)))

(declare-fun lt!276493 () Unit!19300)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37253 (_ BitVec 64) (_ BitVec 32) List!11921) Unit!19300)

(assert (=> b!605893 (= lt!276493 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276488 (select (arr!17880 a!2986) j!136) j!136 Nil!11918))))

(assert (=> b!605893 false))

(declare-fun b!605894 () Bool)

(assert (=> b!605894 (= e!346814 e!346823)))

(declare-fun res!389249 () Bool)

(assert (=> b!605894 (=> res!389249 e!346823)))

(assert (=> b!605894 (= res!389249 (or (not (= (select (arr!17880 a!2986) j!136) lt!276492)) (not (= (select (arr!17880 a!2986) j!136) lt!276490))))))

(assert (=> b!605894 e!346820))

(declare-fun res!389243 () Bool)

(assert (=> b!605894 (=> (not res!389243) (not e!346820))))

(assert (=> b!605894 (= res!389243 (= lt!276490 (select (arr!17880 a!2986) j!136)))))

(assert (=> b!605894 (= lt!276490 (select (store (arr!17880 a!2986) i!1108 k!1786) index!984))))

(assert (= (and start!55342 res!389256) b!605884))

(assert (= (and b!605884 res!389255) b!605871))

(assert (= (and b!605871 res!389239) b!605887))

(assert (= (and b!605887 res!389244) b!605875))

(assert (= (and b!605875 res!389252) b!605891))

(assert (= (and b!605891 res!389241) b!605892))

(assert (= (and b!605892 res!389250) b!605881))

(assert (= (and b!605881 res!389247) b!605889))

(assert (= (and b!605889 res!389251) b!605873))

(assert (= (and b!605873 res!389248) b!605882))

(assert (= (and b!605882 res!389245) b!605883))

(assert (= (and b!605883 res!389254) b!605872))

(assert (= (and b!605883 c!68683) b!605877))

(assert (= (and b!605883 (not c!68683)) b!605886))

(assert (= (and b!605883 (not res!389240)) b!605894))

(assert (= (and b!605894 res!389243) b!605888))

(assert (= (and b!605888 (not res!389246)) b!605874))

(assert (= (and b!605874 res!389242) b!605890))

(assert (= (and b!605894 (not res!389249)) b!605878))

(assert (= (and b!605878 c!68684) b!605893))

(assert (= (and b!605878 (not c!68684)) b!605876))

(assert (= (and b!605878 (not res!389253)) b!605879))

(assert (= (and b!605879 res!389258) b!605885))

(assert (= (and b!605879 (not res!389257)) b!605880))

(declare-fun m!582713 () Bool)

(assert (=> b!605879 m!582713))

(assert (=> b!605879 m!582713))

(declare-fun m!582715 () Bool)

(assert (=> b!605879 m!582715))

(assert (=> b!605879 m!582713))

(declare-fun m!582717 () Bool)

(assert (=> b!605879 m!582717))

(assert (=> b!605879 m!582713))

(declare-fun m!582719 () Bool)

(assert (=> b!605879 m!582719))

(declare-fun m!582721 () Bool)

(assert (=> b!605873 m!582721))

(declare-fun m!582723 () Bool)

(assert (=> b!605873 m!582723))

(declare-fun m!582725 () Bool)

(assert (=> b!605875 m!582725))

(assert (=> b!605894 m!582713))

(assert (=> b!605894 m!582721))

(declare-fun m!582727 () Bool)

(assert (=> b!605894 m!582727))

(assert (=> b!605890 m!582713))

(assert (=> b!605890 m!582713))

(declare-fun m!582729 () Bool)

(assert (=> b!605890 m!582729))

(declare-fun m!582731 () Bool)

(assert (=> b!605887 m!582731))

(assert (=> b!605893 m!582713))

(declare-fun m!582733 () Bool)

(assert (=> b!605893 m!582733))

(assert (=> b!605893 m!582713))

(assert (=> b!605893 m!582713))

(declare-fun m!582735 () Bool)

(assert (=> b!605893 m!582735))

(declare-fun m!582737 () Bool)

(assert (=> b!605893 m!582737))

(declare-fun m!582739 () Bool)

(assert (=> b!605893 m!582739))

(declare-fun m!582741 () Bool)

(assert (=> b!605893 m!582741))

(assert (=> b!605893 m!582713))

(declare-fun m!582743 () Bool)

(assert (=> b!605893 m!582743))

(declare-fun m!582745 () Bool)

(assert (=> b!605893 m!582745))

(declare-fun m!582747 () Bool)

(assert (=> b!605880 m!582747))

(assert (=> b!605874 m!582713))

(assert (=> b!605874 m!582713))

(assert (=> b!605874 m!582719))

(declare-fun m!582749 () Bool)

(assert (=> start!55342 m!582749))

(declare-fun m!582751 () Bool)

(assert (=> start!55342 m!582751))

(declare-fun m!582753 () Bool)

(assert (=> b!605891 m!582753))

(declare-fun m!582755 () Bool)

(assert (=> b!605892 m!582755))

(declare-fun m!582757 () Bool)

(assert (=> b!605883 m!582757))

(declare-fun m!582759 () Bool)

(assert (=> b!605883 m!582759))

(declare-fun m!582761 () Bool)

(assert (=> b!605883 m!582761))

(declare-fun m!582763 () Bool)

(assert (=> b!605883 m!582763))

(assert (=> b!605883 m!582713))

(assert (=> b!605883 m!582721))

(declare-fun m!582765 () Bool)

(assert (=> b!605883 m!582765))

(assert (=> b!605883 m!582713))

(declare-fun m!582767 () Bool)

(assert (=> b!605883 m!582767))

(declare-fun m!582769 () Bool)

(assert (=> b!605889 m!582769))

(assert (=> b!605871 m!582713))

(assert (=> b!605871 m!582713))

(declare-fun m!582771 () Bool)

(assert (=> b!605871 m!582771))

(assert (=> b!605885 m!582713))

(assert (=> b!605885 m!582713))

(assert (=> b!605885 m!582729))

(assert (=> b!605888 m!582713))

(declare-fun m!582773 () Bool)

(assert (=> b!605882 m!582773))

(assert (=> b!605882 m!582713))

(assert (=> b!605882 m!582713))

(declare-fun m!582775 () Bool)

(assert (=> b!605882 m!582775))

(declare-fun m!582777 () Bool)

(assert (=> b!605881 m!582777))

(push 1)

(assert (not b!605893))

(assert (not b!605874))

(assert (not b!605879))

(assert (not b!605885))

(assert (not start!55342))

(assert (not b!605881))

(assert (not b!605875))

(assert (not b!605892))

(assert (not b!605891))

(assert (not b!605880))

(assert (not b!605871))

(assert (not b!605882))

(assert (not b!605883))

(assert (not b!605890))

(assert (not b!605887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87753 () Bool)

(declare-fun res!389403 () Bool)

(declare-fun e!346957 () Bool)

(assert (=> d!87753 (=> res!389403 e!346957)))

(assert (=> d!87753 (= res!389403 (= (select (arr!17880 lt!276488) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17880 a!2986) j!136)))))

(assert (=> d!87753 (= (arrayContainsKey!0 lt!276488 (select (arr!17880 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!346957)))

(declare-fun b!606087 () Bool)

(declare-fun e!346958 () Bool)

(assert (=> b!606087 (= e!346957 e!346958)))

(declare-fun res!389404 () Bool)

(assert (=> b!606087 (=> (not res!389404) (not e!346958))))

(assert (=> b!606087 (= res!389404 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18244 lt!276488)))))

(declare-fun b!606088 () Bool)

(assert (=> b!606088 (= e!346958 (arrayContainsKey!0 lt!276488 (select (arr!17880 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87753 (not res!389403)) b!606087))

(assert (= (and b!606087 res!389404) b!606088))

(declare-fun m!582947 () Bool)

(assert (=> d!87753 m!582947))

(assert (=> b!606088 m!582713))

(declare-fun m!582949 () Bool)

(assert (=> b!606088 m!582949))

(assert (=> b!605879 d!87753))

(declare-fun d!87757 () Bool)

(assert (=> d!87757 (arrayContainsKey!0 lt!276488 (select (arr!17880 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276616 () Unit!19300)

(declare-fun choose!114 (array!37253 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19300)

(assert (=> d!87757 (= lt!276616 (choose!114 lt!276488 (select (arr!17880 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!87757 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!87757 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276488 (select (arr!17880 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!276616)))

(declare-fun bs!18538 () Bool)

(assert (= bs!18538 d!87757))

(assert (=> bs!18538 m!582713))

(assert (=> bs!18538 m!582715))

(assert (=> bs!18538 m!582713))

(declare-fun m!582951 () Bool)

(assert (=> bs!18538 m!582951))

(assert (=> b!605879 d!87757))

(declare-fun d!87759 () Bool)

(declare-fun res!389411 () Bool)

(declare-fun e!346967 () Bool)

(assert (=> d!87759 (=> res!389411 e!346967)))

(assert (=> d!87759 (= res!389411 (= (select (arr!17880 lt!276488) j!136) (select (arr!17880 a!2986) j!136)))))

(assert (=> d!87759 (= (arrayContainsKey!0 lt!276488 (select (arr!17880 a!2986) j!136) j!136) e!346967)))

(declare-fun b!606099 () Bool)

(declare-fun e!346968 () Bool)

(assert (=> b!606099 (= e!346967 e!346968)))

(declare-fun res!389412 () Bool)

(assert (=> b!606099 (=> (not res!389412) (not e!346968))))

(assert (=> b!606099 (= res!389412 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18244 lt!276488)))))

(declare-fun b!606100 () Bool)

(assert (=> b!606100 (= e!346968 (arrayContainsKey!0 lt!276488 (select (arr!17880 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87759 (not res!389411)) b!606099))

(assert (= (and b!606099 res!389412) b!606100))

(declare-fun m!582953 () Bool)

(assert (=> d!87759 m!582953))

(assert (=> b!606100 m!582713))

(declare-fun m!582955 () Bool)

(assert (=> b!606100 m!582955))

(assert (=> b!605879 d!87759))

(declare-fun d!87761 () Bool)

(declare-fun res!389413 () Bool)

(declare-fun e!346969 () Bool)

(assert (=> d!87761 (=> res!389413 e!346969)))

(assert (=> d!87761 (= res!389413 (= (select (arr!17880 lt!276488) index!984) (select (arr!17880 a!2986) j!136)))))

(assert (=> d!87761 (= (arrayContainsKey!0 lt!276488 (select (arr!17880 a!2986) j!136) index!984) e!346969)))

(declare-fun b!606101 () Bool)

(declare-fun e!346970 () Bool)

(assert (=> b!606101 (= e!346969 e!346970)))

(declare-fun res!389414 () Bool)

(assert (=> b!606101 (=> (not res!389414) (not e!346970))))

(assert (=> b!606101 (= res!389414 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18244 lt!276488)))))

(declare-fun b!606102 () Bool)

(assert (=> b!606102 (= e!346970 (arrayContainsKey!0 lt!276488 (select (arr!17880 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87761 (not res!389413)) b!606101))

(assert (= (and b!606101 res!389414) b!606102))

(declare-fun m!582957 () Bool)

(assert (=> d!87761 m!582957))

(assert (=> b!606102 m!582713))

(declare-fun m!582959 () Bool)

(assert (=> b!606102 m!582959))

(assert (=> b!605890 d!87761))

(declare-fun d!87763 () Bool)

(declare-fun res!389422 () Bool)

(declare-fun e!346979 () Bool)

(assert (=> d!87763 (=> res!389422 e!346979)))

(assert (=> d!87763 (= res!389422 (is-Nil!11918 Nil!11918))))

(assert (=> d!87763 (= (noDuplicate!303 Nil!11918) e!346979)))

(declare-fun b!606112 () Bool)

(declare-fun e!346980 () Bool)

(assert (=> b!606112 (= e!346979 e!346980)))

(declare-fun res!389423 () Bool)

(assert (=> b!606112 (=> (not res!389423) (not e!346980))))

(declare-fun contains!2998 (List!11921 (_ BitVec 64)) Bool)

(assert (=> b!606112 (= res!389423 (not (contains!2998 (t!18149 Nil!11918) (h!12962 Nil!11918))))))

(declare-fun b!606113 () Bool)

(assert (=> b!606113 (= e!346980 (noDuplicate!303 (t!18149 Nil!11918)))))

(assert (= (and d!87763 (not res!389422)) b!606112))

(assert (= (and b!606112 res!389423) b!606113))

(declare-fun m!582965 () Bool)

(assert (=> b!606112 m!582965))

(declare-fun m!582967 () Bool)

(assert (=> b!606113 m!582967))

(assert (=> b!605880 d!87763))

(declare-fun d!87767 () Bool)

(assert (=> d!87767 (= (validKeyInArray!0 (select (arr!17880 a!2986) j!136)) (and (not (= (select (arr!17880 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17880 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!605871 d!87767))

(declare-fun b!606136 () Bool)

(declare-fun e!346997 () SeekEntryResult!6320)

(assert (=> b!606136 (= e!346997 (Found!6320 index!984))))

(declare-fun b!606137 () Bool)

(declare-fun e!346999 () SeekEntryResult!6320)

(assert (=> b!606137 (= e!346999 Undefined!6320)))

(declare-fun b!606138 () Bool)

(declare-fun e!346998 () SeekEntryResult!6320)

(assert (=> b!606138 (= e!346998 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17880 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!606139 () Bool)

(declare-fun c!68718 () Bool)

(declare-fun lt!276631 () (_ BitVec 64))

(assert (=> b!606139 (= c!68718 (= lt!276631 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606139 (= e!346997 e!346998)))

(declare-fun b!606140 () Bool)

(assert (=> b!606140 (= e!346999 e!346997)))

(declare-fun c!68720 () Bool)

(assert (=> b!606140 (= c!68720 (= lt!276631 (select (arr!17880 a!2986) j!136)))))

(declare-fun b!606141 () Bool)

(assert (=> b!606141 (= e!346998 (MissingVacant!6320 vacantSpotIndex!68))))

(declare-fun lt!276630 () SeekEntryResult!6320)

(declare-fun d!87771 () Bool)

(assert (=> d!87771 (and (or (is-Undefined!6320 lt!276630) (not (is-Found!6320 lt!276630)) (and (bvsge (index!27550 lt!276630) #b00000000000000000000000000000000) (bvslt (index!27550 lt!276630) (size!18244 a!2986)))) (or (is-Undefined!6320 lt!276630) (is-Found!6320 lt!276630) (not (is-MissingVacant!6320 lt!276630)) (not (= (index!27552 lt!276630) vacantSpotIndex!68)) (and (bvsge (index!27552 lt!276630) #b00000000000000000000000000000000) (bvslt (index!27552 lt!276630) (size!18244 a!2986)))) (or (is-Undefined!6320 lt!276630) (ite (is-Found!6320 lt!276630) (= (select (arr!17880 a!2986) (index!27550 lt!276630)) (select (arr!17880 a!2986) j!136)) (and (is-MissingVacant!6320 lt!276630) (= (index!27552 lt!276630) vacantSpotIndex!68) (= (select (arr!17880 a!2986) (index!27552 lt!276630)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87771 (= lt!276630 e!346999)))

(declare-fun c!68719 () Bool)

(assert (=> d!87771 (= c!68719 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87771 (= lt!276631 (select (arr!17880 a!2986) index!984))))

(assert (=> d!87771 (validMask!0 mask!3053)))

(assert (=> d!87771 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17880 a!2986) j!136) a!2986 mask!3053) lt!276630)))

(assert (= (and d!87771 c!68719) b!606137))

(assert (= (and d!87771 (not c!68719)) b!606140))

(assert (= (and b!606140 c!68720) b!606136))

(assert (= (and b!606140 (not c!68720)) b!606139))

(assert (= (and b!606139 c!68718) b!606141))

(assert (= (and b!606139 (not c!68718)) b!606138))

(assert (=> b!606138 m!582757))

(assert (=> b!606138 m!582757))

(assert (=> b!606138 m!582713))

(declare-fun m!582989 () Bool)

(assert (=> b!606138 m!582989))

(declare-fun m!582991 () Bool)

(assert (=> d!87771 m!582991))

(declare-fun m!582993 () Bool)

(assert (=> d!87771 m!582993))

(assert (=> d!87771 m!582773))

(assert (=> d!87771 m!582749))

(assert (=> b!605882 d!87771))

(declare-fun d!87797 () Bool)

(declare-fun res!389447 () Bool)

(declare-fun e!347023 () Bool)

(assert (=> d!87797 (=> res!389447 e!347023)))

(assert (=> d!87797 (= res!389447 (bvsge j!136 (size!18244 lt!276488)))))

(assert (=> d!87797 (= (arrayNoDuplicates!0 lt!276488 j!136 Nil!11918) e!347023)))

(declare-fun b!606174 () Bool)

(declare-fun e!347022 () Bool)

(declare-fun call!33073 () Bool)

(assert (=> b!606174 (= e!347022 call!33073)))

(declare-fun b!606175 () Bool)

(declare-fun e!347024 () Bool)

(assert (=> b!606175 (= e!347023 e!347024)))

(declare-fun res!389446 () Bool)

(assert (=> b!606175 (=> (not res!389446) (not e!347024))))

(declare-fun e!347025 () Bool)

(assert (=> b!606175 (= res!389446 (not e!347025))))

(declare-fun res!389448 () Bool)

(assert (=> b!606175 (=> (not res!389448) (not e!347025))))

(assert (=> b!606175 (= res!389448 (validKeyInArray!0 (select (arr!17880 lt!276488) j!136)))))

(declare-fun b!606176 () Bool)

(assert (=> b!606176 (= e!347025 (contains!2998 Nil!11918 (select (arr!17880 lt!276488) j!136)))))

(declare-fun b!606177 () Bool)

(assert (=> b!606177 (= e!347024 e!347022)))

(declare-fun c!68731 () Bool)

(assert (=> b!606177 (= c!68731 (validKeyInArray!0 (select (arr!17880 lt!276488) j!136)))))

(declare-fun b!606178 () Bool)

(assert (=> b!606178 (= e!347022 call!33073)))

(declare-fun bm!33070 () Bool)

(assert (=> bm!33070 (= call!33073 (arrayNoDuplicates!0 lt!276488 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68731 (Cons!11917 (select (arr!17880 lt!276488) j!136) Nil!11918) Nil!11918)))))

(assert (= (and d!87797 (not res!389447)) b!606175))

(assert (= (and b!606175 res!389448) b!606176))

(assert (= (and b!606175 res!389446) b!606177))

(assert (= (and b!606177 c!68731) b!606174))

(assert (= (and b!606177 (not c!68731)) b!606178))

(assert (= (or b!606174 b!606178) bm!33070))

(assert (=> b!606175 m!582953))

(assert (=> b!606175 m!582953))

(declare-fun m!582997 () Bool)

(assert (=> b!606175 m!582997))

(assert (=> b!606176 m!582953))

(assert (=> b!606176 m!582953))

(declare-fun m!582999 () Bool)

(assert (=> b!606176 m!582999))

(assert (=> b!606177 m!582953))

(assert (=> b!606177 m!582953))

(assert (=> b!606177 m!582997))

(assert (=> bm!33070 m!582953))

(declare-fun m!583001 () Bool)

(assert (=> bm!33070 m!583001))

(assert (=> b!605893 d!87797))

(declare-fun d!87801 () Bool)

(declare-fun res!389453 () Bool)

(declare-fun e!347031 () Bool)

(assert (=> d!87801 (=> res!389453 e!347031)))

(assert (=> d!87801 (= res!389453 (bvsge #b00000000000000000000000000000000 (size!18244 lt!276488)))))

(assert (=> d!87801 (= (arrayNoDuplicates!0 lt!276488 #b00000000000000000000000000000000 Nil!11918) e!347031)))

(declare-fun b!606184 () Bool)

(declare-fun e!347030 () Bool)

(declare-fun call!33075 () Bool)

(assert (=> b!606184 (= e!347030 call!33075)))

(declare-fun b!606185 () Bool)

(declare-fun e!347032 () Bool)

(assert (=> b!606185 (= e!347031 e!347032)))

(declare-fun res!389452 () Bool)

(assert (=> b!606185 (=> (not res!389452) (not e!347032))))

(declare-fun e!347033 () Bool)

(assert (=> b!606185 (= res!389452 (not e!347033))))

(declare-fun res!389454 () Bool)

(assert (=> b!606185 (=> (not res!389454) (not e!347033))))

(assert (=> b!606185 (= res!389454 (validKeyInArray!0 (select (arr!17880 lt!276488) #b00000000000000000000000000000000)))))

(declare-fun b!606186 () Bool)

(assert (=> b!606186 (= e!347033 (contains!2998 Nil!11918 (select (arr!17880 lt!276488) #b00000000000000000000000000000000)))))

(declare-fun b!606187 () Bool)

(assert (=> b!606187 (= e!347032 e!347030)))

(declare-fun c!68733 () Bool)

(assert (=> b!606187 (= c!68733 (validKeyInArray!0 (select (arr!17880 lt!276488) #b00000000000000000000000000000000)))))

(declare-fun b!606188 () Bool)

(assert (=> b!606188 (= e!347030 call!33075)))

(declare-fun bm!33072 () Bool)

(assert (=> bm!33072 (= call!33075 (arrayNoDuplicates!0 lt!276488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68733 (Cons!11917 (select (arr!17880 lt!276488) #b00000000000000000000000000000000) Nil!11918) Nil!11918)))))

(assert (= (and d!87801 (not res!389453)) b!606185))

(assert (= (and b!606185 res!389454) b!606186))

(assert (= (and b!606185 res!389452) b!606187))

(assert (= (and b!606187 c!68733) b!606184))

(assert (= (and b!606187 (not c!68733)) b!606188))

(assert (= (or b!606184 b!606188) bm!33072))

(declare-fun m!583007 () Bool)

(assert (=> b!606185 m!583007))

(assert (=> b!606185 m!583007))

(declare-fun m!583011 () Bool)

(assert (=> b!606185 m!583011))

(assert (=> b!606186 m!583007))

(assert (=> b!606186 m!583007))

(declare-fun m!583015 () Bool)

(assert (=> b!606186 m!583015))

(assert (=> b!606187 m!583007))

(assert (=> b!606187 m!583007))

(assert (=> b!606187 m!583011))

(assert (=> bm!33072 m!583007))

(declare-fun m!583017 () Bool)

(assert (=> bm!33072 m!583017))

(assert (=> b!605893 d!87801))

(declare-fun d!87805 () Bool)

(declare-fun res!389458 () Bool)

(declare-fun e!347038 () Bool)

(assert (=> d!87805 (=> res!389458 e!347038)))

(assert (=> d!87805 (= res!389458 (= (select (arr!17880 lt!276488) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17880 a!2986) j!136)))))

(assert (=> d!87805 (= (arrayContainsKey!0 lt!276488 (select (arr!17880 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!347038)))

(declare-fun b!606194 () Bool)

(declare-fun e!347039 () Bool)

(assert (=> b!606194 (= e!347038 e!347039)))

(declare-fun res!389459 () Bool)

(assert (=> b!606194 (=> (not res!389459) (not e!347039))))

(assert (=> b!606194 (= res!389459 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18244 lt!276488)))))

(declare-fun b!606195 () Bool)

(assert (=> b!606195 (= e!347039 (arrayContainsKey!0 lt!276488 (select (arr!17880 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87805 (not res!389458)) b!606194))

(assert (= (and b!606194 res!389459) b!606195))

(declare-fun m!583019 () Bool)

(assert (=> d!87805 m!583019))

(assert (=> b!606195 m!582713))

(declare-fun m!583021 () Bool)

(assert (=> b!606195 m!583021))

(assert (=> b!605893 d!87805))

(declare-fun d!87807 () Bool)

(assert (=> d!87807 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18244 lt!276488)) (not (= (select (arr!17880 lt!276488) j!136) (select (arr!17880 a!2986) j!136))))))

(declare-fun lt!276643 () Unit!19300)

(declare-fun choose!21 (array!37253 (_ BitVec 64) (_ BitVec 32) List!11921) Unit!19300)

(assert (=> d!87807 (= lt!276643 (choose!21 lt!276488 (select (arr!17880 a!2986) j!136) j!136 Nil!11918))))

(assert (=> d!87807 (bvslt (size!18244 lt!276488) #b01111111111111111111111111111111)))

(assert (=> d!87807 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276488 (select (arr!17880 a!2986) j!136) j!136 Nil!11918) lt!276643)))

(declare-fun bs!18543 () Bool)

(assert (= bs!18543 d!87807))

(assert (=> bs!18543 m!582953))

(assert (=> bs!18543 m!582713))

(declare-fun m!583039 () Bool)

(assert (=> bs!18543 m!583039))

(assert (=> b!605893 d!87807))

(declare-fun d!87815 () Bool)

(assert (=> d!87815 (arrayNoDuplicates!0 lt!276488 j!136 Nil!11918)))

(declare-fun lt!276653 () Unit!19300)

(declare-fun choose!39 (array!37253 (_ BitVec 32) (_ BitVec 32)) Unit!19300)

(assert (=> d!87815 (= lt!276653 (choose!39 lt!276488 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87815 (bvslt (size!18244 lt!276488) #b01111111111111111111111111111111)))

(assert (=> d!87815 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!276488 #b00000000000000000000000000000000 j!136) lt!276653)))

(declare-fun bs!18546 () Bool)

(assert (= bs!18546 d!87815))

(assert (=> bs!18546 m!582741))

(declare-fun m!583053 () Bool)

(assert (=> bs!18546 m!583053))

(assert (=> b!605893 d!87815))

(declare-fun d!87825 () Bool)

(assert (=> d!87825 (arrayContainsKey!0 lt!276488 (select (arr!17880 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276654 () Unit!19300)

(assert (=> d!87825 (= lt!276654 (choose!114 lt!276488 (select (arr!17880 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87825 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87825 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276488 (select (arr!17880 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!276654)))

(declare-fun bs!18547 () Bool)

(assert (= bs!18547 d!87825))

(assert (=> bs!18547 m!582713))

(assert (=> bs!18547 m!582733))

(assert (=> bs!18547 m!582713))

(declare-fun m!583055 () Bool)

(assert (=> bs!18547 m!583055))

(assert (=> b!605893 d!87825))

(declare-fun d!87827 () Bool)

(declare-fun e!347056 () Bool)

(assert (=> d!87827 e!347056))

(declare-fun res!389472 () Bool)

(assert (=> d!87827 (=> (not res!389472) (not e!347056))))

(assert (=> d!87827 (= res!389472 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18244 a!2986))))))

(declare-fun lt!276660 () Unit!19300)

(declare-fun choose!41 (array!37253 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11921) Unit!19300)

(assert (=> d!87827 (= lt!276660 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11918))))

(assert (=> d!87827 (bvslt (size!18244 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87827 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11918) lt!276660)))

(declare-fun b!606216 () Bool)

(assert (=> b!606216 (= e!347056 (arrayNoDuplicates!0 (array!37254 (store (arr!17880 a!2986) i!1108 k!1786) (size!18244 a!2986)) #b00000000000000000000000000000000 Nil!11918))))

(assert (= (and d!87827 res!389472) b!606216))

(declare-fun m!583065 () Bool)

(assert (=> d!87827 m!583065))

(assert (=> b!606216 m!582721))

(declare-fun m!583067 () Bool)

(assert (=> b!606216 m!583067))

(assert (=> b!605893 d!87827))

(declare-fun b!606279 () Bool)

(declare-fun e!347096 () SeekEntryResult!6320)

(declare-fun lt!276689 () SeekEntryResult!6320)

(assert (=> b!606279 (= e!347096 (Found!6320 (index!27551 lt!276689)))))

(declare-fun b!606280 () Bool)

(declare-fun e!347095 () SeekEntryResult!6320)

(assert (=> b!606280 (= e!347095 e!347096)))

(declare-fun lt!276688 () (_ BitVec 64))

(assert (=> b!606280 (= lt!276688 (select (arr!17880 a!2986) (index!27551 lt!276689)))))

(declare-fun c!68766 () Bool)

(assert (=> b!606280 (= c!68766 (= lt!276688 k!1786))))

(declare-fun b!606281 () Bool)

(declare-fun e!347094 () SeekEntryResult!6320)

(assert (=> b!606281 (= e!347094 (MissingZero!6320 (index!27551 lt!276689)))))

(declare-fun b!606282 () Bool)

(declare-fun c!68765 () Bool)

(assert (=> b!606282 (= c!68765 (= lt!276688 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606282 (= e!347096 e!347094)))

(declare-fun b!606283 () Bool)

(assert (=> b!606283 (= e!347094 (seekKeyOrZeroReturnVacant!0 (x!56355 lt!276689) (index!27551 lt!276689) (index!27551 lt!276689) k!1786 a!2986 mask!3053))))

(declare-fun d!87833 () Bool)

(declare-fun lt!276690 () SeekEntryResult!6320)

(assert (=> d!87833 (and (or (is-Undefined!6320 lt!276690) (not (is-Found!6320 lt!276690)) (and (bvsge (index!27550 lt!276690) #b00000000000000000000000000000000) (bvslt (index!27550 lt!276690) (size!18244 a!2986)))) (or (is-Undefined!6320 lt!276690) (is-Found!6320 lt!276690) (not (is-MissingZero!6320 lt!276690)) (and (bvsge (index!27549 lt!276690) #b00000000000000000000000000000000) (bvslt (index!27549 lt!276690) (size!18244 a!2986)))) (or (is-Undefined!6320 lt!276690) (is-Found!6320 lt!276690) (is-MissingZero!6320 lt!276690) (not (is-MissingVacant!6320 lt!276690)) (and (bvsge (index!27552 lt!276690) #b00000000000000000000000000000000) (bvslt (index!27552 lt!276690) (size!18244 a!2986)))) (or (is-Undefined!6320 lt!276690) (ite (is-Found!6320 lt!276690) (= (select (arr!17880 a!2986) (index!27550 lt!276690)) k!1786) (ite (is-MissingZero!6320 lt!276690) (= (select (arr!17880 a!2986) (index!27549 lt!276690)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6320 lt!276690) (= (select (arr!17880 a!2986) (index!27552 lt!276690)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!87833 (= lt!276690 e!347095)))

(declare-fun c!68764 () Bool)

(assert (=> d!87833 (= c!68764 (and (is-Intermediate!6320 lt!276689) (undefined!7132 lt!276689)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37253 (_ BitVec 32)) SeekEntryResult!6320)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87833 (= lt!276689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!87833 (validMask!0 mask!3053)))

(assert (=> d!87833 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!276690)))

(declare-fun b!606284 () Bool)

(assert (=> b!606284 (= e!347095 Undefined!6320)))

(assert (= (and d!87833 c!68764) b!606284))

(assert (= (and d!87833 (not c!68764)) b!606280))

(assert (= (and b!606280 c!68766) b!606279))

(assert (= (and b!606280 (not c!68766)) b!606282))

(assert (= (and b!606282 c!68765) b!606281))

(assert (= (and b!606282 (not c!68765)) b!606283))

(declare-fun m!583121 () Bool)

(assert (=> b!606280 m!583121))

(declare-fun m!583123 () Bool)

(assert (=> b!606283 m!583123))

(assert (=> d!87833 m!582749))

(declare-fun m!583125 () Bool)

(assert (=> d!87833 m!583125))

(declare-fun m!583127 () Bool)

(assert (=> d!87833 m!583127))

(assert (=> d!87833 m!583125))

(declare-fun m!583129 () Bool)

(assert (=> d!87833 m!583129))

(declare-fun m!583131 () Bool)

(assert (=> d!87833 m!583131))

(declare-fun m!583133 () Bool)

(assert (=> d!87833 m!583133))

(assert (=> b!605891 d!87833))

(declare-fun d!87855 () Bool)

(declare-fun res!389486 () Bool)

(declare-fun e!347098 () Bool)

(assert (=> d!87855 (=> res!389486 e!347098)))

(assert (=> d!87855 (= res!389486 (bvsge #b00000000000000000000000000000000 (size!18244 a!2986)))))

(assert (=> d!87855 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11918) e!347098)))

(declare-fun b!606285 () Bool)

(declare-fun e!347097 () Bool)

(declare-fun call!33079 () Bool)

(assert (=> b!606285 (= e!347097 call!33079)))

(declare-fun b!606286 () Bool)

(declare-fun e!347099 () Bool)

(assert (=> b!606286 (= e!347098 e!347099)))

(declare-fun res!389485 () Bool)

(assert (=> b!606286 (=> (not res!389485) (not e!347099))))

(declare-fun e!347100 () Bool)

(assert (=> b!606286 (= res!389485 (not e!347100))))

(declare-fun res!389487 () Bool)

(assert (=> b!606286 (=> (not res!389487) (not e!347100))))

(assert (=> b!606286 (= res!389487 (validKeyInArray!0 (select (arr!17880 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606287 () Bool)

(assert (=> b!606287 (= e!347100 (contains!2998 Nil!11918 (select (arr!17880 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606288 () Bool)

(assert (=> b!606288 (= e!347099 e!347097)))

(declare-fun c!68767 () Bool)

(assert (=> b!606288 (= c!68767 (validKeyInArray!0 (select (arr!17880 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606289 () Bool)

(assert (=> b!606289 (= e!347097 call!33079)))

(declare-fun bm!33076 () Bool)

(assert (=> bm!33076 (= call!33079 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68767 (Cons!11917 (select (arr!17880 a!2986) #b00000000000000000000000000000000) Nil!11918) Nil!11918)))))

(assert (= (and d!87855 (not res!389486)) b!606286))

(assert (= (and b!606286 res!389487) b!606287))

(assert (= (and b!606286 res!389485) b!606288))

(assert (= (and b!606288 c!68767) b!606285))

(assert (= (and b!606288 (not c!68767)) b!606289))

(assert (= (or b!606285 b!606289) bm!33076))

(declare-fun m!583135 () Bool)

(assert (=> b!606286 m!583135))

(assert (=> b!606286 m!583135))

(declare-fun m!583137 () Bool)

(assert (=> b!606286 m!583137))

(assert (=> b!606287 m!583135))

(assert (=> b!606287 m!583135))

(declare-fun m!583139 () Bool)

(assert (=> b!606287 m!583139))

(assert (=> b!606288 m!583135))

(assert (=> b!606288 m!583135))

(assert (=> b!606288 m!583137))

(assert (=> bm!33076 m!583135))

(declare-fun m!583141 () Bool)

(assert (=> bm!33076 m!583141))

(assert (=> b!605881 d!87855))

(declare-fun b!606311 () Bool)

(declare-fun e!347116 () Bool)

(declare-fun e!347114 () Bool)

(assert (=> b!606311 (= e!347116 e!347114)))

(declare-fun c!68776 () Bool)

(assert (=> b!606311 (= c!68776 (validKeyInArray!0 (select (arr!17880 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87857 () Bool)

(declare-fun res!389494 () Bool)

(assert (=> d!87857 (=> res!389494 e!347116)))

(assert (=> d!87857 (= res!389494 (bvsge #b00000000000000000000000000000000 (size!18244 a!2986)))))

(assert (=> d!87857 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!347116)))

(declare-fun b!606312 () Bool)

(declare-fun e!347115 () Bool)

(assert (=> b!606312 (= e!347114 e!347115)))

(declare-fun lt!276706 () (_ BitVec 64))

(assert (=> b!606312 (= lt!276706 (select (arr!17880 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!276704 () Unit!19300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37253 (_ BitVec 64) (_ BitVec 32)) Unit!19300)

(assert (=> b!606312 (= lt!276704 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!276706 #b00000000000000000000000000000000))))

(assert (=> b!606312 (arrayContainsKey!0 a!2986 lt!276706 #b00000000000000000000000000000000)))

(declare-fun lt!276705 () Unit!19300)

(assert (=> b!606312 (= lt!276705 lt!276704)))

(declare-fun res!389493 () Bool)

(assert (=> b!606312 (= res!389493 (= (seekEntryOrOpen!0 (select (arr!17880 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6320 #b00000000000000000000000000000000)))))

(assert (=> b!606312 (=> (not res!389493) (not e!347115))))

(declare-fun b!606313 () Bool)

(declare-fun call!33082 () Bool)

(assert (=> b!606313 (= e!347114 call!33082)))

(declare-fun b!606314 () Bool)

(assert (=> b!606314 (= e!347115 call!33082)))

(declare-fun bm!33079 () Bool)

(assert (=> bm!33079 (= call!33082 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!87857 (not res!389494)) b!606311))

(assert (= (and b!606311 c!68776) b!606312))

(assert (= (and b!606311 (not c!68776)) b!606313))

(assert (= (and b!606312 res!389493) b!606314))

(assert (= (or b!606314 b!606313) bm!33079))

(assert (=> b!606311 m!583135))

(assert (=> b!606311 m!583135))

(assert (=> b!606311 m!583137))

(assert (=> b!606312 m!583135))

(declare-fun m!583147 () Bool)

(assert (=> b!606312 m!583147))

(declare-fun m!583149 () Bool)

(assert (=> b!606312 m!583149))

(assert (=> b!606312 m!583135))

(declare-fun m!583151 () Bool)

(assert (=> b!606312 m!583151))

(declare-fun m!583153 () Bool)

(assert (=> bm!33079 m!583153))

(assert (=> b!605892 d!87857))

(assert (=> b!605874 d!87759))

(assert (=> b!605885 d!87761))

(declare-fun d!87859 () Bool)

(declare-fun e!347130 () Bool)

(assert (=> d!87859 e!347130))

(declare-fun res!389505 () Bool)

(assert (=> d!87859 (=> (not res!389505) (not e!347130))))

(assert (=> d!87859 (= res!389505 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18244 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18244 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18244 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18244 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18244 a!2986))))))

(declare-fun lt!276712 () Unit!19300)

(declare-fun choose!9 (array!37253 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19300)

(assert (=> d!87859 (= lt!276712 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276498 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87859 (validMask!0 mask!3053)))

(assert (=> d!87859 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276498 vacantSpotIndex!68 mask!3053) lt!276712)))

(declare-fun b!606331 () Bool)

(assert (=> b!606331 (= e!347130 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276498 vacantSpotIndex!68 (select (arr!17880 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276498 vacantSpotIndex!68 (select (store (arr!17880 a!2986) i!1108 k!1786) j!136) (array!37254 (store (arr!17880 a!2986) i!1108 k!1786) (size!18244 a!2986)) mask!3053)))))

(assert (= (and d!87859 res!389505) b!606331))

(declare-fun m!583177 () Bool)

(assert (=> d!87859 m!583177))

(assert (=> d!87859 m!582749))

(assert (=> b!606331 m!582713))

(assert (=> b!606331 m!582721))

(assert (=> b!606331 m!582759))

(assert (=> b!606331 m!582759))

(declare-fun m!583179 () Bool)

(assert (=> b!606331 m!583179))

(assert (=> b!606331 m!582713))

(assert (=> b!606331 m!582767))

(assert (=> b!605883 d!87859))

(declare-fun b!606332 () Bool)

(declare-fun e!347131 () SeekEntryResult!6320)

(assert (=> b!606332 (= e!347131 (Found!6320 index!984))))

(declare-fun b!606333 () Bool)

(declare-fun e!347133 () SeekEntryResult!6320)

(assert (=> b!606333 (= e!347133 Undefined!6320)))

(declare-fun b!606334 () Bool)

(declare-fun e!347132 () SeekEntryResult!6320)

(assert (=> b!606334 (= e!347132 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!276492 lt!276488 mask!3053))))

(declare-fun b!606335 () Bool)

(declare-fun c!68780 () Bool)

(declare-fun lt!276714 () (_ BitVec 64))

(assert (=> b!606335 (= c!68780 (= lt!276714 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606335 (= e!347131 e!347132)))

(declare-fun b!606336 () Bool)

(assert (=> b!606336 (= e!347133 e!347131)))

(declare-fun c!68782 () Bool)

(assert (=> b!606336 (= c!68782 (= lt!276714 lt!276492))))

(declare-fun b!606337 () Bool)

(assert (=> b!606337 (= e!347132 (MissingVacant!6320 vacantSpotIndex!68))))

(declare-fun d!87869 () Bool)

(declare-fun lt!276713 () SeekEntryResult!6320)

(assert (=> d!87869 (and (or (is-Undefined!6320 lt!276713) (not (is-Found!6320 lt!276713)) (and (bvsge (index!27550 lt!276713) #b00000000000000000000000000000000) (bvslt (index!27550 lt!276713) (size!18244 lt!276488)))) (or (is-Undefined!6320 lt!276713) (is-Found!6320 lt!276713) (not (is-MissingVacant!6320 lt!276713)) (not (= (index!27552 lt!276713) vacantSpotIndex!68)) (and (bvsge (index!27552 lt!276713) #b00000000000000000000000000000000) (bvslt (index!27552 lt!276713) (size!18244 lt!276488)))) (or (is-Undefined!6320 lt!276713) (ite (is-Found!6320 lt!276713) (= (select (arr!17880 lt!276488) (index!27550 lt!276713)) lt!276492) (and (is-MissingVacant!6320 lt!276713) (= (index!27552 lt!276713) vacantSpotIndex!68) (= (select (arr!17880 lt!276488) (index!27552 lt!276713)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87869 (= lt!276713 e!347133)))

(declare-fun c!68781 () Bool)

(assert (=> d!87869 (= c!68781 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87869 (= lt!276714 (select (arr!17880 lt!276488) index!984))))

(assert (=> d!87869 (validMask!0 mask!3053)))

(assert (=> d!87869 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276492 lt!276488 mask!3053) lt!276713)))

(assert (= (and d!87869 c!68781) b!606333))

(assert (= (and d!87869 (not c!68781)) b!606336))

(assert (= (and b!606336 c!68782) b!606332))

(assert (= (and b!606336 (not c!68782)) b!606335))

(assert (= (and b!606335 c!68780) b!606337))

(assert (= (and b!606335 (not c!68780)) b!606334))

(assert (=> b!606334 m!582757))

(assert (=> b!606334 m!582757))

(declare-fun m!583181 () Bool)

(assert (=> b!606334 m!583181))

(declare-fun m!583183 () Bool)

(assert (=> d!87869 m!583183))

(declare-fun m!583185 () Bool)

(assert (=> d!87869 m!583185))

(assert (=> d!87869 m!582957))

(assert (=> d!87869 m!582749))

(assert (=> b!605883 d!87869))

(declare-fun d!87873 () Bool)

(declare-fun lt!276723 () (_ BitVec 32))

(assert (=> d!87873 (and (bvsge lt!276723 #b00000000000000000000000000000000) (bvslt lt!276723 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87873 (= lt!276723 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87873 (validMask!0 mask!3053)))

(assert (=> d!87873 (= (nextIndex!0 index!984 x!910 mask!3053) lt!276723)))

(declare-fun bs!18551 () Bool)

(assert (= bs!18551 d!87873))

(declare-fun m!583211 () Bool)

(assert (=> bs!18551 m!583211))

(assert (=> bs!18551 m!582749))

(assert (=> b!605883 d!87873))

(declare-fun b!606356 () Bool)

(declare-fun e!347143 () SeekEntryResult!6320)

(assert (=> b!606356 (= e!347143 (Found!6320 lt!276498))))

(declare-fun b!606357 () Bool)

(declare-fun e!347145 () SeekEntryResult!6320)

(assert (=> b!606357 (= e!347145 Undefined!6320)))

(declare-fun e!347144 () SeekEntryResult!6320)

(declare-fun b!606358 () Bool)

(assert (=> b!606358 (= e!347144 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276498 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!276492 lt!276488 mask!3053))))

(declare-fun b!606359 () Bool)

(declare-fun c!68792 () Bool)

(declare-fun lt!276725 () (_ BitVec 64))

(assert (=> b!606359 (= c!68792 (= lt!276725 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606359 (= e!347143 e!347144)))

(declare-fun b!606360 () Bool)

(assert (=> b!606360 (= e!347145 e!347143)))

(declare-fun c!68794 () Bool)

(assert (=> b!606360 (= c!68794 (= lt!276725 lt!276492))))

(declare-fun b!606361 () Bool)

(assert (=> b!606361 (= e!347144 (MissingVacant!6320 vacantSpotIndex!68))))

(declare-fun lt!276724 () SeekEntryResult!6320)

(declare-fun d!87881 () Bool)

(assert (=> d!87881 (and (or (is-Undefined!6320 lt!276724) (not (is-Found!6320 lt!276724)) (and (bvsge (index!27550 lt!276724) #b00000000000000000000000000000000) (bvslt (index!27550 lt!276724) (size!18244 lt!276488)))) (or (is-Undefined!6320 lt!276724) (is-Found!6320 lt!276724) (not (is-MissingVacant!6320 lt!276724)) (not (= (index!27552 lt!276724) vacantSpotIndex!68)) (and (bvsge (index!27552 lt!276724) #b00000000000000000000000000000000) (bvslt (index!27552 lt!276724) (size!18244 lt!276488)))) (or (is-Undefined!6320 lt!276724) (ite (is-Found!6320 lt!276724) (= (select (arr!17880 lt!276488) (index!27550 lt!276724)) lt!276492) (and (is-MissingVacant!6320 lt!276724) (= (index!27552 lt!276724) vacantSpotIndex!68) (= (select (arr!17880 lt!276488) (index!27552 lt!276724)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87881 (= lt!276724 e!347145)))

(declare-fun c!68793 () Bool)

(assert (=> d!87881 (= c!68793 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87881 (= lt!276725 (select (arr!17880 lt!276488) lt!276498))))

(assert (=> d!87881 (validMask!0 mask!3053)))

(assert (=> d!87881 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276498 vacantSpotIndex!68 lt!276492 lt!276488 mask!3053) lt!276724)))

(assert (= (and d!87881 c!68793) b!606357))

(assert (= (and d!87881 (not c!68793)) b!606360))

(assert (= (and b!606360 c!68794) b!606356))

(assert (= (and b!606360 (not c!68794)) b!606359))

(assert (= (and b!606359 c!68792) b!606361))

(assert (= (and b!606359 (not c!68792)) b!606358))

(declare-fun m!583213 () Bool)

(assert (=> b!606358 m!583213))

(assert (=> b!606358 m!583213))

(declare-fun m!583215 () Bool)

(assert (=> b!606358 m!583215))

(declare-fun m!583217 () Bool)

(assert (=> d!87881 m!583217))

(declare-fun m!583219 () Bool)

(assert (=> d!87881 m!583219))

(declare-fun m!583221 () Bool)

(assert (=> d!87881 m!583221))

(assert (=> d!87881 m!582749))

(assert (=> b!605883 d!87881))

(declare-fun b!606362 () Bool)

(declare-fun e!347146 () SeekEntryResult!6320)

(assert (=> b!606362 (= e!347146 (Found!6320 lt!276498))))

(declare-fun b!606363 () Bool)

(declare-fun e!347148 () SeekEntryResult!6320)

(assert (=> b!606363 (= e!347148 Undefined!6320)))

(declare-fun b!606364 () Bool)

(declare-fun e!347147 () SeekEntryResult!6320)

(assert (=> b!606364 (= e!347147 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276498 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17880 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!606365 () Bool)

(declare-fun c!68795 () Bool)

(declare-fun lt!276727 () (_ BitVec 64))

(assert (=> b!606365 (= c!68795 (= lt!276727 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606365 (= e!347146 e!347147)))

(declare-fun b!606366 () Bool)

