; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54918 () Bool)

(assert start!54918)

(declare-fun b!601548 () Bool)

(declare-fun e!343970 () Bool)

(declare-fun e!343971 () Bool)

(assert (=> b!601548 (= e!343970 e!343971)))

(declare-fun res!386291 () Bool)

(assert (=> b!601548 (=> res!386291 e!343971)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!273881 () (_ BitVec 64))

(declare-fun lt!273888 () (_ BitVec 64))

(declare-datatypes ((array!37153 0))(
  ( (array!37154 (arr!17836 (Array (_ BitVec 32) (_ BitVec 64))) (size!18200 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37153)

(assert (=> b!601548 (= res!386291 (or (not (= (select (arr!17836 a!2986) j!136) lt!273881)) (not (= (select (arr!17836 a!2986) j!136) lt!273888))))))

(declare-fun e!343968 () Bool)

(assert (=> b!601548 e!343968))

(declare-fun res!386295 () Bool)

(assert (=> b!601548 (=> (not res!386295) (not e!343968))))

(assert (=> b!601548 (= res!386295 (= lt!273888 (select (arr!17836 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!601548 (= lt!273888 (select (store (arr!17836 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!601549 () Bool)

(declare-fun e!343973 () Bool)

(assert (=> b!601549 (= e!343968 e!343973)))

(declare-fun res!386288 () Bool)

(assert (=> b!601549 (=> res!386288 e!343973)))

(assert (=> b!601549 (= res!386288 (or (not (= (select (arr!17836 a!2986) j!136) lt!273881)) (not (= (select (arr!17836 a!2986) j!136) lt!273888)) (bvsge j!136 index!984)))))

(declare-fun b!601550 () Bool)

(declare-fun e!343962 () Bool)

(declare-fun lt!273887 () array!37153)

(declare-fun arrayContainsKey!0 (array!37153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!601550 (= e!343962 (arrayContainsKey!0 lt!273887 (select (arr!17836 a!2986) j!136) index!984))))

(declare-fun b!601551 () Bool)

(declare-fun e!343974 () Bool)

(declare-fun e!343964 () Bool)

(assert (=> b!601551 (= e!343974 e!343964)))

(declare-fun res!386289 () Bool)

(assert (=> b!601551 (=> (not res!386289) (not e!343964))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!601551 (= res!386289 (= (select (store (arr!17836 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601551 (= lt!273887 (array!37154 (store (arr!17836 a!2986) i!1108 k0!1786) (size!18200 a!2986)))))

(declare-fun b!601552 () Bool)

(declare-datatypes ((Unit!19036 0))(
  ( (Unit!19037) )
))
(declare-fun e!343969 () Unit!19036)

(declare-fun Unit!19038 () Unit!19036)

(assert (=> b!601552 (= e!343969 Unit!19038)))

(assert (=> b!601552 false))

(declare-fun b!601553 () Bool)

(assert (=> b!601553 (= e!343973 e!343962)))

(declare-fun res!386286 () Bool)

(assert (=> b!601553 (=> (not res!386286) (not e!343962))))

(assert (=> b!601553 (= res!386286 (arrayContainsKey!0 lt!273887 (select (arr!17836 a!2986) j!136) j!136))))

(declare-fun b!601554 () Bool)

(declare-fun res!386285 () Bool)

(declare-fun e!343967 () Bool)

(assert (=> b!601554 (=> (not res!386285) (not e!343967))))

(assert (=> b!601554 (= res!386285 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!601555 () Bool)

(declare-fun res!386298 () Bool)

(assert (=> b!601555 (=> (not res!386298) (not e!343974))))

(declare-datatypes ((List!11877 0))(
  ( (Nil!11874) (Cons!11873 (h!12918 (_ BitVec 64)) (t!18105 List!11877)) )
))
(declare-fun arrayNoDuplicates!0 (array!37153 (_ BitVec 32) List!11877) Bool)

(assert (=> b!601555 (= res!386298 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11874))))

(declare-fun b!601557 () Bool)

(declare-fun e!343963 () Unit!19036)

(declare-fun Unit!19039 () Unit!19036)

(assert (=> b!601557 (= e!343963 Unit!19039)))

(declare-fun lt!273884 () Unit!19036)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37153 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19036)

(assert (=> b!601557 (= lt!273884 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273887 (select (arr!17836 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!601557 (arrayContainsKey!0 lt!273887 (select (arr!17836 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273886 () Unit!19036)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37153 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11877) Unit!19036)

(assert (=> b!601557 (= lt!273886 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11874))))

(assert (=> b!601557 (arrayNoDuplicates!0 lt!273887 #b00000000000000000000000000000000 Nil!11874)))

(declare-fun lt!273879 () Unit!19036)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37153 (_ BitVec 32) (_ BitVec 32)) Unit!19036)

(assert (=> b!601557 (= lt!273879 (lemmaNoDuplicateFromThenFromBigger!0 lt!273887 #b00000000000000000000000000000000 j!136))))

(assert (=> b!601557 (arrayNoDuplicates!0 lt!273887 j!136 Nil!11874)))

(declare-fun lt!273878 () Unit!19036)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37153 (_ BitVec 64) (_ BitVec 32) List!11877) Unit!19036)

(assert (=> b!601557 (= lt!273878 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273887 (select (arr!17836 a!2986) j!136) j!136 Nil!11874))))

(assert (=> b!601557 false))

(declare-fun b!601558 () Bool)

(declare-fun res!386294 () Bool)

(assert (=> b!601558 (=> (not res!386294) (not e!343974))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37153 (_ BitVec 32)) Bool)

(assert (=> b!601558 (= res!386294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!601559 () Bool)

(declare-fun res!386299 () Bool)

(assert (=> b!601559 (=> (not res!386299) (not e!343967))))

(assert (=> b!601559 (= res!386299 (and (= (size!18200 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18200 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18200 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!601560 () Bool)

(declare-fun res!386287 () Bool)

(assert (=> b!601560 (=> (not res!386287) (not e!343967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!601560 (= res!386287 (validKeyInArray!0 k0!1786))))

(declare-fun b!601561 () Bool)

(assert (=> b!601561 (= e!343967 e!343974)))

(declare-fun res!386293 () Bool)

(assert (=> b!601561 (=> (not res!386293) (not e!343974))))

(declare-datatypes ((SeekEntryResult!6276 0))(
  ( (MissingZero!6276 (index!27361 (_ BitVec 32))) (Found!6276 (index!27362 (_ BitVec 32))) (Intermediate!6276 (undefined!7088 Bool) (index!27363 (_ BitVec 32)) (x!56155 (_ BitVec 32))) (Undefined!6276) (MissingVacant!6276 (index!27364 (_ BitVec 32))) )
))
(declare-fun lt!273883 () SeekEntryResult!6276)

(assert (=> b!601561 (= res!386293 (or (= lt!273883 (MissingZero!6276 i!1108)) (= lt!273883 (MissingVacant!6276 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37153 (_ BitVec 32)) SeekEntryResult!6276)

(assert (=> b!601561 (= lt!273883 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!601562 () Bool)

(assert (=> b!601562 (= e!343971 (or (bvsge index!984 j!136) (bvslt (size!18200 a!2986) #b01111111111111111111111111111111)))))

(declare-fun lt!273875 () Unit!19036)

(assert (=> b!601562 (= lt!273875 e!343963)))

(declare-fun c!67999 () Bool)

(assert (=> b!601562 (= c!67999 (bvslt j!136 index!984))))

(declare-fun b!601563 () Bool)

(declare-fun res!386284 () Bool)

(assert (=> b!601563 (=> (not res!386284) (not e!343967))))

(assert (=> b!601563 (= res!386284 (validKeyInArray!0 (select (arr!17836 a!2986) j!136)))))

(declare-fun b!601556 () Bool)

(declare-fun Unit!19040 () Unit!19036)

(assert (=> b!601556 (= e!343969 Unit!19040)))

(declare-fun res!386297 () Bool)

(assert (=> start!54918 (=> (not res!386297) (not e!343967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54918 (= res!386297 (validMask!0 mask!3053))))

(assert (=> start!54918 e!343967))

(assert (=> start!54918 true))

(declare-fun array_inv!13632 (array!37153) Bool)

(assert (=> start!54918 (array_inv!13632 a!2986)))

(declare-fun b!601564 () Bool)

(declare-fun e!343965 () Bool)

(assert (=> b!601564 (= e!343965 (not e!343970))))

(declare-fun res!386300 () Bool)

(assert (=> b!601564 (=> res!386300 e!343970)))

(declare-fun lt!273877 () SeekEntryResult!6276)

(assert (=> b!601564 (= res!386300 (not (= lt!273877 (Found!6276 index!984))))))

(declare-fun lt!273876 () Unit!19036)

(assert (=> b!601564 (= lt!273876 e!343969)))

(declare-fun c!68000 () Bool)

(assert (=> b!601564 (= c!68000 (= lt!273877 Undefined!6276))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37153 (_ BitVec 32)) SeekEntryResult!6276)

(assert (=> b!601564 (= lt!273877 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273881 lt!273887 mask!3053))))

(declare-fun e!343972 () Bool)

(assert (=> b!601564 e!343972))

(declare-fun res!386290 () Bool)

(assert (=> b!601564 (=> (not res!386290) (not e!343972))))

(declare-fun lt!273885 () SeekEntryResult!6276)

(declare-fun lt!273880 () (_ BitVec 32))

(assert (=> b!601564 (= res!386290 (= lt!273885 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273880 vacantSpotIndex!68 lt!273881 lt!273887 mask!3053)))))

(assert (=> b!601564 (= lt!273885 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273880 vacantSpotIndex!68 (select (arr!17836 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!601564 (= lt!273881 (select (store (arr!17836 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273882 () Unit!19036)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37153 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19036)

(assert (=> b!601564 (= lt!273882 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273880 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!601564 (= lt!273880 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!601565 () Bool)

(declare-fun Unit!19041 () Unit!19036)

(assert (=> b!601565 (= e!343963 Unit!19041)))

(declare-fun b!601566 () Bool)

(assert (=> b!601566 (= e!343964 e!343965)))

(declare-fun res!386292 () Bool)

(assert (=> b!601566 (=> (not res!386292) (not e!343965))))

(declare-fun lt!273889 () SeekEntryResult!6276)

(assert (=> b!601566 (= res!386292 (and (= lt!273889 (Found!6276 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17836 a!2986) index!984) (select (arr!17836 a!2986) j!136))) (not (= (select (arr!17836 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!601566 (= lt!273889 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17836 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601567 () Bool)

(assert (=> b!601567 (= e!343972 (= lt!273889 lt!273885))))

(declare-fun b!601568 () Bool)

(declare-fun res!386296 () Bool)

(assert (=> b!601568 (=> (not res!386296) (not e!343974))))

(assert (=> b!601568 (= res!386296 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17836 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54918 res!386297) b!601559))

(assert (= (and b!601559 res!386299) b!601563))

(assert (= (and b!601563 res!386284) b!601560))

(assert (= (and b!601560 res!386287) b!601554))

(assert (= (and b!601554 res!386285) b!601561))

(assert (= (and b!601561 res!386293) b!601558))

(assert (= (and b!601558 res!386294) b!601555))

(assert (= (and b!601555 res!386298) b!601568))

(assert (= (and b!601568 res!386296) b!601551))

(assert (= (and b!601551 res!386289) b!601566))

(assert (= (and b!601566 res!386292) b!601564))

(assert (= (and b!601564 res!386290) b!601567))

(assert (= (and b!601564 c!68000) b!601552))

(assert (= (and b!601564 (not c!68000)) b!601556))

(assert (= (and b!601564 (not res!386300)) b!601548))

(assert (= (and b!601548 res!386295) b!601549))

(assert (= (and b!601549 (not res!386288)) b!601553))

(assert (= (and b!601553 res!386286) b!601550))

(assert (= (and b!601548 (not res!386291)) b!601562))

(assert (= (and b!601562 c!67999) b!601557))

(assert (= (and b!601562 (not c!67999)) b!601565))

(declare-fun m!578729 () Bool)

(assert (=> b!601566 m!578729))

(declare-fun m!578731 () Bool)

(assert (=> b!601566 m!578731))

(assert (=> b!601566 m!578731))

(declare-fun m!578733 () Bool)

(assert (=> b!601566 m!578733))

(assert (=> b!601548 m!578731))

(declare-fun m!578735 () Bool)

(assert (=> b!601548 m!578735))

(declare-fun m!578737 () Bool)

(assert (=> b!601548 m!578737))

(assert (=> b!601549 m!578731))

(assert (=> b!601551 m!578735))

(declare-fun m!578739 () Bool)

(assert (=> b!601551 m!578739))

(assert (=> b!601563 m!578731))

(assert (=> b!601563 m!578731))

(declare-fun m!578741 () Bool)

(assert (=> b!601563 m!578741))

(assert (=> b!601550 m!578731))

(assert (=> b!601550 m!578731))

(declare-fun m!578743 () Bool)

(assert (=> b!601550 m!578743))

(declare-fun m!578745 () Bool)

(assert (=> b!601564 m!578745))

(assert (=> b!601564 m!578731))

(assert (=> b!601564 m!578735))

(declare-fun m!578747 () Bool)

(assert (=> b!601564 m!578747))

(declare-fun m!578749 () Bool)

(assert (=> b!601564 m!578749))

(declare-fun m!578751 () Bool)

(assert (=> b!601564 m!578751))

(declare-fun m!578753 () Bool)

(assert (=> b!601564 m!578753))

(assert (=> b!601564 m!578731))

(declare-fun m!578755 () Bool)

(assert (=> b!601564 m!578755))

(declare-fun m!578757 () Bool)

(assert (=> b!601560 m!578757))

(assert (=> b!601553 m!578731))

(assert (=> b!601553 m!578731))

(declare-fun m!578759 () Bool)

(assert (=> b!601553 m!578759))

(declare-fun m!578761 () Bool)

(assert (=> b!601558 m!578761))

(declare-fun m!578763 () Bool)

(assert (=> b!601568 m!578763))

(declare-fun m!578765 () Bool)

(assert (=> b!601561 m!578765))

(assert (=> b!601557 m!578731))

(declare-fun m!578767 () Bool)

(assert (=> b!601557 m!578767))

(declare-fun m!578769 () Bool)

(assert (=> b!601557 m!578769))

(assert (=> b!601557 m!578731))

(assert (=> b!601557 m!578731))

(declare-fun m!578771 () Bool)

(assert (=> b!601557 m!578771))

(assert (=> b!601557 m!578731))

(declare-fun m!578773 () Bool)

(assert (=> b!601557 m!578773))

(declare-fun m!578775 () Bool)

(assert (=> b!601557 m!578775))

(declare-fun m!578777 () Bool)

(assert (=> b!601557 m!578777))

(declare-fun m!578779 () Bool)

(assert (=> b!601557 m!578779))

(declare-fun m!578781 () Bool)

(assert (=> b!601554 m!578781))

(declare-fun m!578783 () Bool)

(assert (=> start!54918 m!578783))

(declare-fun m!578785 () Bool)

(assert (=> start!54918 m!578785))

(declare-fun m!578787 () Bool)

(assert (=> b!601555 m!578787))

(check-sat (not b!601564) (not b!601560) (not b!601555) (not b!601550) (not b!601563) (not b!601554) (not b!601561) (not start!54918) (not b!601557) (not b!601558) (not b!601553) (not b!601566))
(check-sat)
(get-model)

(declare-fun d!87137 () Bool)

(declare-fun res!386356 () Bool)

(declare-fun e!344018 () Bool)

(assert (=> d!87137 (=> res!386356 e!344018)))

(assert (=> d!87137 (= res!386356 (= (select (arr!17836 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87137 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!344018)))

(declare-fun b!601636 () Bool)

(declare-fun e!344019 () Bool)

(assert (=> b!601636 (= e!344018 e!344019)))

(declare-fun res!386357 () Bool)

(assert (=> b!601636 (=> (not res!386357) (not e!344019))))

(assert (=> b!601636 (= res!386357 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18200 a!2986)))))

(declare-fun b!601637 () Bool)

(assert (=> b!601637 (= e!344019 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87137 (not res!386356)) b!601636))

(assert (= (and b!601636 res!386357) b!601637))

(declare-fun m!578849 () Bool)

(assert (=> d!87137 m!578849))

(declare-fun m!578851 () Bool)

(assert (=> b!601637 m!578851))

(assert (=> b!601554 d!87137))

(declare-fun b!601650 () Bool)

(declare-fun e!344028 () SeekEntryResult!6276)

(assert (=> b!601650 (= e!344028 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17836 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601651 () Bool)

(declare-fun c!68015 () Bool)

(declare-fun lt!273939 () (_ BitVec 64))

(assert (=> b!601651 (= c!68015 (= lt!273939 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!344027 () SeekEntryResult!6276)

(assert (=> b!601651 (= e!344027 e!344028)))

(declare-fun b!601652 () Bool)

(declare-fun e!344026 () SeekEntryResult!6276)

(assert (=> b!601652 (= e!344026 Undefined!6276)))

(declare-fun b!601653 () Bool)

(assert (=> b!601653 (= e!344026 e!344027)))

(declare-fun c!68013 () Bool)

(assert (=> b!601653 (= c!68013 (= lt!273939 (select (arr!17836 a!2986) j!136)))))

(declare-fun lt!273940 () SeekEntryResult!6276)

(declare-fun d!87139 () Bool)

(get-info :version)

(assert (=> d!87139 (and (or ((_ is Undefined!6276) lt!273940) (not ((_ is Found!6276) lt!273940)) (and (bvsge (index!27362 lt!273940) #b00000000000000000000000000000000) (bvslt (index!27362 lt!273940) (size!18200 a!2986)))) (or ((_ is Undefined!6276) lt!273940) ((_ is Found!6276) lt!273940) (not ((_ is MissingVacant!6276) lt!273940)) (not (= (index!27364 lt!273940) vacantSpotIndex!68)) (and (bvsge (index!27364 lt!273940) #b00000000000000000000000000000000) (bvslt (index!27364 lt!273940) (size!18200 a!2986)))) (or ((_ is Undefined!6276) lt!273940) (ite ((_ is Found!6276) lt!273940) (= (select (arr!17836 a!2986) (index!27362 lt!273940)) (select (arr!17836 a!2986) j!136)) (and ((_ is MissingVacant!6276) lt!273940) (= (index!27364 lt!273940) vacantSpotIndex!68) (= (select (arr!17836 a!2986) (index!27364 lt!273940)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87139 (= lt!273940 e!344026)))

(declare-fun c!68014 () Bool)

(assert (=> d!87139 (= c!68014 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87139 (= lt!273939 (select (arr!17836 a!2986) index!984))))

(assert (=> d!87139 (validMask!0 mask!3053)))

(assert (=> d!87139 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17836 a!2986) j!136) a!2986 mask!3053) lt!273940)))

(declare-fun b!601654 () Bool)

(assert (=> b!601654 (= e!344028 (MissingVacant!6276 vacantSpotIndex!68))))

(declare-fun b!601655 () Bool)

(assert (=> b!601655 (= e!344027 (Found!6276 index!984))))

(assert (= (and d!87139 c!68014) b!601652))

(assert (= (and d!87139 (not c!68014)) b!601653))

(assert (= (and b!601653 c!68013) b!601655))

(assert (= (and b!601653 (not c!68013)) b!601651))

(assert (= (and b!601651 c!68015) b!601654))

(assert (= (and b!601651 (not c!68015)) b!601650))

(assert (=> b!601650 m!578753))

(assert (=> b!601650 m!578753))

(assert (=> b!601650 m!578731))

(declare-fun m!578853 () Bool)

(assert (=> b!601650 m!578853))

(declare-fun m!578855 () Bool)

(assert (=> d!87139 m!578855))

(declare-fun m!578857 () Bool)

(assert (=> d!87139 m!578857))

(assert (=> d!87139 m!578729))

(assert (=> d!87139 m!578783))

(assert (=> b!601566 d!87139))

(declare-fun b!601666 () Bool)

(declare-fun e!344039 () Bool)

(declare-fun call!32969 () Bool)

(assert (=> b!601666 (= e!344039 call!32969)))

(declare-fun b!601667 () Bool)

(declare-fun e!344037 () Bool)

(assert (=> b!601667 (= e!344037 e!344039)))

(declare-fun c!68018 () Bool)

(assert (=> b!601667 (= c!68018 (validKeyInArray!0 (select (arr!17836 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87141 () Bool)

(declare-fun res!386364 () Bool)

(declare-fun e!344038 () Bool)

(assert (=> d!87141 (=> res!386364 e!344038)))

(assert (=> d!87141 (= res!386364 (bvsge #b00000000000000000000000000000000 (size!18200 a!2986)))))

(assert (=> d!87141 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11874) e!344038)))

(declare-fun b!601668 () Bool)

(declare-fun e!344040 () Bool)

(declare-fun contains!2986 (List!11877 (_ BitVec 64)) Bool)

(assert (=> b!601668 (= e!344040 (contains!2986 Nil!11874 (select (arr!17836 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!601669 () Bool)

(assert (=> b!601669 (= e!344038 e!344037)))

(declare-fun res!386365 () Bool)

(assert (=> b!601669 (=> (not res!386365) (not e!344037))))

(assert (=> b!601669 (= res!386365 (not e!344040))))

(declare-fun res!386366 () Bool)

(assert (=> b!601669 (=> (not res!386366) (not e!344040))))

(assert (=> b!601669 (= res!386366 (validKeyInArray!0 (select (arr!17836 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32966 () Bool)

(assert (=> bm!32966 (= call!32969 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68018 (Cons!11873 (select (arr!17836 a!2986) #b00000000000000000000000000000000) Nil!11874) Nil!11874)))))

(declare-fun b!601670 () Bool)

(assert (=> b!601670 (= e!344039 call!32969)))

(assert (= (and d!87141 (not res!386364)) b!601669))

(assert (= (and b!601669 res!386366) b!601668))

(assert (= (and b!601669 res!386365) b!601667))

(assert (= (and b!601667 c!68018) b!601666))

(assert (= (and b!601667 (not c!68018)) b!601670))

(assert (= (or b!601666 b!601670) bm!32966))

(assert (=> b!601667 m!578849))

(assert (=> b!601667 m!578849))

(declare-fun m!578859 () Bool)

(assert (=> b!601667 m!578859))

(assert (=> b!601668 m!578849))

(assert (=> b!601668 m!578849))

(declare-fun m!578861 () Bool)

(assert (=> b!601668 m!578861))

(assert (=> b!601669 m!578849))

(assert (=> b!601669 m!578849))

(assert (=> b!601669 m!578859))

(assert (=> bm!32966 m!578849))

(declare-fun m!578863 () Bool)

(assert (=> bm!32966 m!578863))

(assert (=> b!601555 d!87141))

(declare-fun d!87143 () Bool)

(assert (=> d!87143 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54918 d!87143))

(declare-fun d!87151 () Bool)

(assert (=> d!87151 (= (array_inv!13632 a!2986) (bvsge (size!18200 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54918 d!87151))

(declare-fun d!87153 () Bool)

(assert (=> d!87153 (= (validKeyInArray!0 (select (arr!17836 a!2986) j!136)) (and (not (= (select (arr!17836 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17836 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!601563 d!87153))

(declare-fun d!87159 () Bool)

(declare-fun lt!273946 () (_ BitVec 32))

(assert (=> d!87159 (and (bvsge lt!273946 #b00000000000000000000000000000000) (bvslt lt!273946 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87159 (= lt!273946 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87159 (validMask!0 mask!3053)))

(assert (=> d!87159 (= (nextIndex!0 index!984 x!910 mask!3053) lt!273946)))

(declare-fun bs!18440 () Bool)

(assert (= bs!18440 d!87159))

(declare-fun m!578879 () Bool)

(assert (=> bs!18440 m!578879))

(assert (=> bs!18440 m!578783))

(assert (=> b!601564 d!87159))

(declare-fun e!344053 () SeekEntryResult!6276)

(declare-fun b!601681 () Bool)

(assert (=> b!601681 (= e!344053 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!273880 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!273881 lt!273887 mask!3053))))

(declare-fun b!601682 () Bool)

(declare-fun c!68021 () Bool)

(declare-fun lt!273947 () (_ BitVec 64))

(assert (=> b!601682 (= c!68021 (= lt!273947 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!344052 () SeekEntryResult!6276)

(assert (=> b!601682 (= e!344052 e!344053)))

(declare-fun b!601683 () Bool)

(declare-fun e!344051 () SeekEntryResult!6276)

(assert (=> b!601683 (= e!344051 Undefined!6276)))

(declare-fun b!601684 () Bool)

(assert (=> b!601684 (= e!344051 e!344052)))

(declare-fun c!68019 () Bool)

(assert (=> b!601684 (= c!68019 (= lt!273947 lt!273881))))

(declare-fun lt!273948 () SeekEntryResult!6276)

(declare-fun d!87165 () Bool)

(assert (=> d!87165 (and (or ((_ is Undefined!6276) lt!273948) (not ((_ is Found!6276) lt!273948)) (and (bvsge (index!27362 lt!273948) #b00000000000000000000000000000000) (bvslt (index!27362 lt!273948) (size!18200 lt!273887)))) (or ((_ is Undefined!6276) lt!273948) ((_ is Found!6276) lt!273948) (not ((_ is MissingVacant!6276) lt!273948)) (not (= (index!27364 lt!273948) vacantSpotIndex!68)) (and (bvsge (index!27364 lt!273948) #b00000000000000000000000000000000) (bvslt (index!27364 lt!273948) (size!18200 lt!273887)))) (or ((_ is Undefined!6276) lt!273948) (ite ((_ is Found!6276) lt!273948) (= (select (arr!17836 lt!273887) (index!27362 lt!273948)) lt!273881) (and ((_ is MissingVacant!6276) lt!273948) (= (index!27364 lt!273948) vacantSpotIndex!68) (= (select (arr!17836 lt!273887) (index!27364 lt!273948)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87165 (= lt!273948 e!344051)))

(declare-fun c!68020 () Bool)

(assert (=> d!87165 (= c!68020 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87165 (= lt!273947 (select (arr!17836 lt!273887) lt!273880))))

(assert (=> d!87165 (validMask!0 mask!3053)))

(assert (=> d!87165 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273880 vacantSpotIndex!68 lt!273881 lt!273887 mask!3053) lt!273948)))

(declare-fun b!601685 () Bool)

(assert (=> b!601685 (= e!344053 (MissingVacant!6276 vacantSpotIndex!68))))

(declare-fun b!601686 () Bool)

(assert (=> b!601686 (= e!344052 (Found!6276 lt!273880))))

(assert (= (and d!87165 c!68020) b!601683))

(assert (= (and d!87165 (not c!68020)) b!601684))

(assert (= (and b!601684 c!68019) b!601686))

(assert (= (and b!601684 (not c!68019)) b!601682))

(assert (= (and b!601682 c!68021) b!601685))

(assert (= (and b!601682 (not c!68021)) b!601681))

(declare-fun m!578881 () Bool)

(assert (=> b!601681 m!578881))

(assert (=> b!601681 m!578881))

(declare-fun m!578883 () Bool)

(assert (=> b!601681 m!578883))

(declare-fun m!578885 () Bool)

(assert (=> d!87165 m!578885))

(declare-fun m!578887 () Bool)

(assert (=> d!87165 m!578887))

(declare-fun m!578889 () Bool)

(assert (=> d!87165 m!578889))

(assert (=> d!87165 m!578783))

(assert (=> b!601564 d!87165))

(declare-fun b!601687 () Bool)

(declare-fun e!344056 () SeekEntryResult!6276)

(assert (=> b!601687 (= e!344056 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!273881 lt!273887 mask!3053))))

(declare-fun b!601688 () Bool)

(declare-fun c!68024 () Bool)

(declare-fun lt!273949 () (_ BitVec 64))

(assert (=> b!601688 (= c!68024 (= lt!273949 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!344055 () SeekEntryResult!6276)

(assert (=> b!601688 (= e!344055 e!344056)))

(declare-fun b!601689 () Bool)

(declare-fun e!344054 () SeekEntryResult!6276)

(assert (=> b!601689 (= e!344054 Undefined!6276)))

(declare-fun b!601690 () Bool)

(assert (=> b!601690 (= e!344054 e!344055)))

(declare-fun c!68022 () Bool)

(assert (=> b!601690 (= c!68022 (= lt!273949 lt!273881))))

(declare-fun d!87167 () Bool)

(declare-fun lt!273950 () SeekEntryResult!6276)

(assert (=> d!87167 (and (or ((_ is Undefined!6276) lt!273950) (not ((_ is Found!6276) lt!273950)) (and (bvsge (index!27362 lt!273950) #b00000000000000000000000000000000) (bvslt (index!27362 lt!273950) (size!18200 lt!273887)))) (or ((_ is Undefined!6276) lt!273950) ((_ is Found!6276) lt!273950) (not ((_ is MissingVacant!6276) lt!273950)) (not (= (index!27364 lt!273950) vacantSpotIndex!68)) (and (bvsge (index!27364 lt!273950) #b00000000000000000000000000000000) (bvslt (index!27364 lt!273950) (size!18200 lt!273887)))) (or ((_ is Undefined!6276) lt!273950) (ite ((_ is Found!6276) lt!273950) (= (select (arr!17836 lt!273887) (index!27362 lt!273950)) lt!273881) (and ((_ is MissingVacant!6276) lt!273950) (= (index!27364 lt!273950) vacantSpotIndex!68) (= (select (arr!17836 lt!273887) (index!27364 lt!273950)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87167 (= lt!273950 e!344054)))

(declare-fun c!68023 () Bool)

(assert (=> d!87167 (= c!68023 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87167 (= lt!273949 (select (arr!17836 lt!273887) index!984))))

(assert (=> d!87167 (validMask!0 mask!3053)))

(assert (=> d!87167 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273881 lt!273887 mask!3053) lt!273950)))

(declare-fun b!601691 () Bool)

(assert (=> b!601691 (= e!344056 (MissingVacant!6276 vacantSpotIndex!68))))

(declare-fun b!601692 () Bool)

(assert (=> b!601692 (= e!344055 (Found!6276 index!984))))

(assert (= (and d!87167 c!68023) b!601689))

(assert (= (and d!87167 (not c!68023)) b!601690))

(assert (= (and b!601690 c!68022) b!601692))

(assert (= (and b!601690 (not c!68022)) b!601688))

(assert (= (and b!601688 c!68024) b!601691))

(assert (= (and b!601688 (not c!68024)) b!601687))

(assert (=> b!601687 m!578753))

(assert (=> b!601687 m!578753))

(declare-fun m!578891 () Bool)

(assert (=> b!601687 m!578891))

(declare-fun m!578893 () Bool)

(assert (=> d!87167 m!578893))

(declare-fun m!578895 () Bool)

(assert (=> d!87167 m!578895))

(declare-fun m!578897 () Bool)

(assert (=> d!87167 m!578897))

(assert (=> d!87167 m!578783))

(assert (=> b!601564 d!87167))

(declare-fun d!87169 () Bool)

(declare-fun e!344085 () Bool)

(assert (=> d!87169 e!344085))

(declare-fun res!386394 () Bool)

(assert (=> d!87169 (=> (not res!386394) (not e!344085))))

(assert (=> d!87169 (= res!386394 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18200 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18200 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18200 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18200 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18200 a!2986))))))

(declare-fun lt!273968 () Unit!19036)

(declare-fun choose!9 (array!37153 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19036)

(assert (=> d!87169 (= lt!273968 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273880 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87169 (validMask!0 mask!3053)))

(assert (=> d!87169 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273880 vacantSpotIndex!68 mask!3053) lt!273968)))

(declare-fun b!601732 () Bool)

(assert (=> b!601732 (= e!344085 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273880 vacantSpotIndex!68 (select (arr!17836 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273880 vacantSpotIndex!68 (select (store (arr!17836 a!2986) i!1108 k0!1786) j!136) (array!37154 (store (arr!17836 a!2986) i!1108 k0!1786) (size!18200 a!2986)) mask!3053)))))

(assert (= (and d!87169 res!386394) b!601732))

(declare-fun m!578919 () Bool)

(assert (=> d!87169 m!578919))

(assert (=> d!87169 m!578783))

(assert (=> b!601732 m!578745))

(assert (=> b!601732 m!578731))

(assert (=> b!601732 m!578755))

(assert (=> b!601732 m!578745))

(declare-fun m!578921 () Bool)

(assert (=> b!601732 m!578921))

(assert (=> b!601732 m!578735))

(assert (=> b!601732 m!578731))

(assert (=> b!601564 d!87169))

(declare-fun e!344088 () SeekEntryResult!6276)

(declare-fun b!601733 () Bool)

(assert (=> b!601733 (= e!344088 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!273880 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17836 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601734 () Bool)

(declare-fun c!68038 () Bool)

(declare-fun lt!273969 () (_ BitVec 64))

(assert (=> b!601734 (= c!68038 (= lt!273969 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!344087 () SeekEntryResult!6276)

(assert (=> b!601734 (= e!344087 e!344088)))

(declare-fun b!601735 () Bool)

(declare-fun e!344086 () SeekEntryResult!6276)

(assert (=> b!601735 (= e!344086 Undefined!6276)))

(declare-fun b!601736 () Bool)

(assert (=> b!601736 (= e!344086 e!344087)))

(declare-fun c!68036 () Bool)

(assert (=> b!601736 (= c!68036 (= lt!273969 (select (arr!17836 a!2986) j!136)))))

(declare-fun lt!273970 () SeekEntryResult!6276)

(declare-fun d!87181 () Bool)

(assert (=> d!87181 (and (or ((_ is Undefined!6276) lt!273970) (not ((_ is Found!6276) lt!273970)) (and (bvsge (index!27362 lt!273970) #b00000000000000000000000000000000) (bvslt (index!27362 lt!273970) (size!18200 a!2986)))) (or ((_ is Undefined!6276) lt!273970) ((_ is Found!6276) lt!273970) (not ((_ is MissingVacant!6276) lt!273970)) (not (= (index!27364 lt!273970) vacantSpotIndex!68)) (and (bvsge (index!27364 lt!273970) #b00000000000000000000000000000000) (bvslt (index!27364 lt!273970) (size!18200 a!2986)))) (or ((_ is Undefined!6276) lt!273970) (ite ((_ is Found!6276) lt!273970) (= (select (arr!17836 a!2986) (index!27362 lt!273970)) (select (arr!17836 a!2986) j!136)) (and ((_ is MissingVacant!6276) lt!273970) (= (index!27364 lt!273970) vacantSpotIndex!68) (= (select (arr!17836 a!2986) (index!27364 lt!273970)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87181 (= lt!273970 e!344086)))

(declare-fun c!68037 () Bool)

(assert (=> d!87181 (= c!68037 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87181 (= lt!273969 (select (arr!17836 a!2986) lt!273880))))

(assert (=> d!87181 (validMask!0 mask!3053)))

(assert (=> d!87181 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273880 vacantSpotIndex!68 (select (arr!17836 a!2986) j!136) a!2986 mask!3053) lt!273970)))

(declare-fun b!601737 () Bool)

(assert (=> b!601737 (= e!344088 (MissingVacant!6276 vacantSpotIndex!68))))

(declare-fun b!601738 () Bool)

(assert (=> b!601738 (= e!344087 (Found!6276 lt!273880))))

(assert (= (and d!87181 c!68037) b!601735))

(assert (= (and d!87181 (not c!68037)) b!601736))

(assert (= (and b!601736 c!68036) b!601738))

(assert (= (and b!601736 (not c!68036)) b!601734))

(assert (= (and b!601734 c!68038) b!601737))

(assert (= (and b!601734 (not c!68038)) b!601733))

(assert (=> b!601733 m!578881))

(assert (=> b!601733 m!578881))

(assert (=> b!601733 m!578731))

(declare-fun m!578923 () Bool)

(assert (=> b!601733 m!578923))

(declare-fun m!578925 () Bool)

(assert (=> d!87181 m!578925))

(declare-fun m!578927 () Bool)

(assert (=> d!87181 m!578927))

(declare-fun m!578929 () Bool)

(assert (=> d!87181 m!578929))

(assert (=> d!87181 m!578783))

(assert (=> b!601564 d!87181))

(declare-fun d!87183 () Bool)

(declare-fun res!386395 () Bool)

(declare-fun e!344089 () Bool)

(assert (=> d!87183 (=> res!386395 e!344089)))

(assert (=> d!87183 (= res!386395 (= (select (arr!17836 lt!273887) j!136) (select (arr!17836 a!2986) j!136)))))

(assert (=> d!87183 (= (arrayContainsKey!0 lt!273887 (select (arr!17836 a!2986) j!136) j!136) e!344089)))

(declare-fun b!601739 () Bool)

(declare-fun e!344090 () Bool)

(assert (=> b!601739 (= e!344089 e!344090)))

(declare-fun res!386396 () Bool)

(assert (=> b!601739 (=> (not res!386396) (not e!344090))))

(assert (=> b!601739 (= res!386396 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18200 lt!273887)))))

(declare-fun b!601740 () Bool)

(assert (=> b!601740 (= e!344090 (arrayContainsKey!0 lt!273887 (select (arr!17836 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87183 (not res!386395)) b!601739))

(assert (= (and b!601739 res!386396) b!601740))

(declare-fun m!578931 () Bool)

(assert (=> d!87183 m!578931))

(assert (=> b!601740 m!578731))

(declare-fun m!578933 () Bool)

(assert (=> b!601740 m!578933))

(assert (=> b!601553 d!87183))

(declare-fun d!87185 () Bool)

(assert (=> d!87185 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!601560 d!87185))

(declare-fun d!87187 () Bool)

(declare-fun res!386400 () Bool)

(declare-fun e!344095 () Bool)

(assert (=> d!87187 (=> res!386400 e!344095)))

(assert (=> d!87187 (= res!386400 (= (select (arr!17836 lt!273887) index!984) (select (arr!17836 a!2986) j!136)))))

(assert (=> d!87187 (= (arrayContainsKey!0 lt!273887 (select (arr!17836 a!2986) j!136) index!984) e!344095)))

(declare-fun b!601746 () Bool)

(declare-fun e!344096 () Bool)

(assert (=> b!601746 (= e!344095 e!344096)))

(declare-fun res!386401 () Bool)

(assert (=> b!601746 (=> (not res!386401) (not e!344096))))

(assert (=> b!601746 (= res!386401 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18200 lt!273887)))))

(declare-fun b!601747 () Bool)

(assert (=> b!601747 (= e!344096 (arrayContainsKey!0 lt!273887 (select (arr!17836 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87187 (not res!386400)) b!601746))

(assert (= (and b!601746 res!386401) b!601747))

(assert (=> d!87187 m!578897))

(assert (=> b!601747 m!578731))

(declare-fun m!578937 () Bool)

(assert (=> b!601747 m!578937))

(assert (=> b!601550 d!87187))

(declare-fun b!601805 () Bool)

(declare-fun c!68060 () Bool)

(declare-fun lt!273999 () (_ BitVec 64))

(assert (=> b!601805 (= c!68060 (= lt!273999 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!344136 () SeekEntryResult!6276)

(declare-fun e!344134 () SeekEntryResult!6276)

(assert (=> b!601805 (= e!344136 e!344134)))

(declare-fun b!601806 () Bool)

(declare-fun e!344135 () SeekEntryResult!6276)

(assert (=> b!601806 (= e!344135 e!344136)))

(declare-fun lt!274000 () SeekEntryResult!6276)

(assert (=> b!601806 (= lt!273999 (select (arr!17836 a!2986) (index!27363 lt!274000)))))

(declare-fun c!68061 () Bool)

(assert (=> b!601806 (= c!68061 (= lt!273999 k0!1786))))

(declare-fun b!601807 () Bool)

(assert (=> b!601807 (= e!344135 Undefined!6276)))

(declare-fun b!601809 () Bool)

(assert (=> b!601809 (= e!344134 (MissingZero!6276 (index!27363 lt!274000)))))

(declare-fun b!601810 () Bool)

(assert (=> b!601810 (= e!344134 (seekKeyOrZeroReturnVacant!0 (x!56155 lt!274000) (index!27363 lt!274000) (index!27363 lt!274000) k0!1786 a!2986 mask!3053))))

(declare-fun b!601808 () Bool)

(assert (=> b!601808 (= e!344136 (Found!6276 (index!27363 lt!274000)))))

(declare-fun d!87189 () Bool)

(declare-fun lt!273998 () SeekEntryResult!6276)

(assert (=> d!87189 (and (or ((_ is Undefined!6276) lt!273998) (not ((_ is Found!6276) lt!273998)) (and (bvsge (index!27362 lt!273998) #b00000000000000000000000000000000) (bvslt (index!27362 lt!273998) (size!18200 a!2986)))) (or ((_ is Undefined!6276) lt!273998) ((_ is Found!6276) lt!273998) (not ((_ is MissingZero!6276) lt!273998)) (and (bvsge (index!27361 lt!273998) #b00000000000000000000000000000000) (bvslt (index!27361 lt!273998) (size!18200 a!2986)))) (or ((_ is Undefined!6276) lt!273998) ((_ is Found!6276) lt!273998) ((_ is MissingZero!6276) lt!273998) (not ((_ is MissingVacant!6276) lt!273998)) (and (bvsge (index!27364 lt!273998) #b00000000000000000000000000000000) (bvslt (index!27364 lt!273998) (size!18200 a!2986)))) (or ((_ is Undefined!6276) lt!273998) (ite ((_ is Found!6276) lt!273998) (= (select (arr!17836 a!2986) (index!27362 lt!273998)) k0!1786) (ite ((_ is MissingZero!6276) lt!273998) (= (select (arr!17836 a!2986) (index!27361 lt!273998)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6276) lt!273998) (= (select (arr!17836 a!2986) (index!27364 lt!273998)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!87189 (= lt!273998 e!344135)))

(declare-fun c!68062 () Bool)

(assert (=> d!87189 (= c!68062 (and ((_ is Intermediate!6276) lt!274000) (undefined!7088 lt!274000)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37153 (_ BitVec 32)) SeekEntryResult!6276)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87189 (= lt!274000 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87189 (validMask!0 mask!3053)))

(assert (=> d!87189 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!273998)))

(assert (= (and d!87189 c!68062) b!601807))

(assert (= (and d!87189 (not c!68062)) b!601806))

(assert (= (and b!601806 c!68061) b!601808))

(assert (= (and b!601806 (not c!68061)) b!601805))

(assert (= (and b!601805 c!68060) b!601809))

(assert (= (and b!601805 (not c!68060)) b!601810))

(declare-fun m!578999 () Bool)

(assert (=> b!601806 m!578999))

(declare-fun m!579001 () Bool)

(assert (=> b!601810 m!579001))

(declare-fun m!579003 () Bool)

(assert (=> d!87189 m!579003))

(declare-fun m!579005 () Bool)

(assert (=> d!87189 m!579005))

(declare-fun m!579007 () Bool)

(assert (=> d!87189 m!579007))

(declare-fun m!579009 () Bool)

(assert (=> d!87189 m!579009))

(assert (=> d!87189 m!578783))

(assert (=> d!87189 m!579007))

(declare-fun m!579011 () Bool)

(assert (=> d!87189 m!579011))

(assert (=> b!601561 d!87189))

(declare-fun d!87215 () Bool)

(assert (=> d!87215 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18200 lt!273887)) (not (= (select (arr!17836 lt!273887) j!136) (select (arr!17836 a!2986) j!136))))))

(declare-fun lt!274006 () Unit!19036)

(declare-fun choose!21 (array!37153 (_ BitVec 64) (_ BitVec 32) List!11877) Unit!19036)

(assert (=> d!87215 (= lt!274006 (choose!21 lt!273887 (select (arr!17836 a!2986) j!136) j!136 Nil!11874))))

(assert (=> d!87215 (bvslt (size!18200 lt!273887) #b01111111111111111111111111111111)))

(assert (=> d!87215 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273887 (select (arr!17836 a!2986) j!136) j!136 Nil!11874) lt!274006)))

(declare-fun bs!18445 () Bool)

(assert (= bs!18445 d!87215))

(assert (=> bs!18445 m!578931))

(assert (=> bs!18445 m!578731))

(declare-fun m!579017 () Bool)

(assert (=> bs!18445 m!579017))

(assert (=> b!601557 d!87215))

(declare-fun b!601813 () Bool)

(declare-fun e!344141 () Bool)

(declare-fun call!32978 () Bool)

(assert (=> b!601813 (= e!344141 call!32978)))

(declare-fun b!601814 () Bool)

(declare-fun e!344139 () Bool)

(assert (=> b!601814 (= e!344139 e!344141)))

(declare-fun c!68063 () Bool)

(assert (=> b!601814 (= c!68063 (validKeyInArray!0 (select (arr!17836 lt!273887) #b00000000000000000000000000000000)))))

(declare-fun d!87225 () Bool)

(declare-fun res!386421 () Bool)

(declare-fun e!344140 () Bool)

(assert (=> d!87225 (=> res!386421 e!344140)))

(assert (=> d!87225 (= res!386421 (bvsge #b00000000000000000000000000000000 (size!18200 lt!273887)))))

(assert (=> d!87225 (= (arrayNoDuplicates!0 lt!273887 #b00000000000000000000000000000000 Nil!11874) e!344140)))

(declare-fun b!601815 () Bool)

(declare-fun e!344142 () Bool)

(assert (=> b!601815 (= e!344142 (contains!2986 Nil!11874 (select (arr!17836 lt!273887) #b00000000000000000000000000000000)))))

(declare-fun b!601816 () Bool)

(assert (=> b!601816 (= e!344140 e!344139)))

(declare-fun res!386422 () Bool)

(assert (=> b!601816 (=> (not res!386422) (not e!344139))))

(assert (=> b!601816 (= res!386422 (not e!344142))))

(declare-fun res!386423 () Bool)

(assert (=> b!601816 (=> (not res!386423) (not e!344142))))

(assert (=> b!601816 (= res!386423 (validKeyInArray!0 (select (arr!17836 lt!273887) #b00000000000000000000000000000000)))))

(declare-fun bm!32975 () Bool)

(assert (=> bm!32975 (= call!32978 (arrayNoDuplicates!0 lt!273887 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68063 (Cons!11873 (select (arr!17836 lt!273887) #b00000000000000000000000000000000) Nil!11874) Nil!11874)))))

(declare-fun b!601817 () Bool)

(assert (=> b!601817 (= e!344141 call!32978)))

(assert (= (and d!87225 (not res!386421)) b!601816))

(assert (= (and b!601816 res!386423) b!601815))

(assert (= (and b!601816 res!386422) b!601814))

(assert (= (and b!601814 c!68063) b!601813))

(assert (= (and b!601814 (not c!68063)) b!601817))

(assert (= (or b!601813 b!601817) bm!32975))

(declare-fun m!579019 () Bool)

(assert (=> b!601814 m!579019))

(assert (=> b!601814 m!579019))

(declare-fun m!579021 () Bool)

(assert (=> b!601814 m!579021))

(assert (=> b!601815 m!579019))

(assert (=> b!601815 m!579019))

(declare-fun m!579023 () Bool)

(assert (=> b!601815 m!579023))

(assert (=> b!601816 m!579019))

(assert (=> b!601816 m!579019))

(assert (=> b!601816 m!579021))

(assert (=> bm!32975 m!579019))

(declare-fun m!579025 () Bool)

(assert (=> bm!32975 m!579025))

(assert (=> b!601557 d!87225))

(declare-fun d!87227 () Bool)

(assert (=> d!87227 (arrayContainsKey!0 lt!273887 (select (arr!17836 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274012 () Unit!19036)

(declare-fun choose!114 (array!37153 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19036)

(assert (=> d!87227 (= lt!274012 (choose!114 lt!273887 (select (arr!17836 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87227 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87227 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273887 (select (arr!17836 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!274012)))

(declare-fun bs!18447 () Bool)

(assert (= bs!18447 d!87227))

(assert (=> bs!18447 m!578731))

(assert (=> bs!18447 m!578773))

(assert (=> bs!18447 m!578731))

(declare-fun m!579029 () Bool)

(assert (=> bs!18447 m!579029))

(assert (=> b!601557 d!87227))

(declare-fun d!87231 () Bool)

(declare-fun res!386424 () Bool)

(declare-fun e!344143 () Bool)

(assert (=> d!87231 (=> res!386424 e!344143)))

(assert (=> d!87231 (= res!386424 (= (select (arr!17836 lt!273887) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17836 a!2986) j!136)))))

(assert (=> d!87231 (= (arrayContainsKey!0 lt!273887 (select (arr!17836 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!344143)))

(declare-fun b!601818 () Bool)

(declare-fun e!344144 () Bool)

(assert (=> b!601818 (= e!344143 e!344144)))

(declare-fun res!386425 () Bool)

(assert (=> b!601818 (=> (not res!386425) (not e!344144))))

(assert (=> b!601818 (= res!386425 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18200 lt!273887)))))

(declare-fun b!601819 () Bool)

(assert (=> b!601819 (= e!344144 (arrayContainsKey!0 lt!273887 (select (arr!17836 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87231 (not res!386424)) b!601818))

(assert (= (and b!601818 res!386425) b!601819))

(declare-fun m!579031 () Bool)

(assert (=> d!87231 m!579031))

(assert (=> b!601819 m!578731))

(declare-fun m!579033 () Bool)

(assert (=> b!601819 m!579033))

(assert (=> b!601557 d!87231))

(declare-fun d!87233 () Bool)

(assert (=> d!87233 (arrayNoDuplicates!0 lt!273887 j!136 Nil!11874)))

(declare-fun lt!274018 () Unit!19036)

(declare-fun choose!39 (array!37153 (_ BitVec 32) (_ BitVec 32)) Unit!19036)

(assert (=> d!87233 (= lt!274018 (choose!39 lt!273887 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87233 (bvslt (size!18200 lt!273887) #b01111111111111111111111111111111)))

(assert (=> d!87233 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!273887 #b00000000000000000000000000000000 j!136) lt!274018)))

(declare-fun bs!18449 () Bool)

(assert (= bs!18449 d!87233))

(assert (=> bs!18449 m!578777))

(declare-fun m!579043 () Bool)

(assert (=> bs!18449 m!579043))

(assert (=> b!601557 d!87233))

(declare-fun b!601822 () Bool)

(declare-fun e!344149 () Bool)

(declare-fun call!32979 () Bool)

(assert (=> b!601822 (= e!344149 call!32979)))

(declare-fun b!601823 () Bool)

(declare-fun e!344147 () Bool)

(assert (=> b!601823 (= e!344147 e!344149)))

(declare-fun c!68064 () Bool)

(assert (=> b!601823 (= c!68064 (validKeyInArray!0 (select (arr!17836 lt!273887) j!136)))))

(declare-fun d!87239 () Bool)

(declare-fun res!386428 () Bool)

(declare-fun e!344148 () Bool)

(assert (=> d!87239 (=> res!386428 e!344148)))

(assert (=> d!87239 (= res!386428 (bvsge j!136 (size!18200 lt!273887)))))

(assert (=> d!87239 (= (arrayNoDuplicates!0 lt!273887 j!136 Nil!11874) e!344148)))

(declare-fun b!601824 () Bool)

(declare-fun e!344150 () Bool)

(assert (=> b!601824 (= e!344150 (contains!2986 Nil!11874 (select (arr!17836 lt!273887) j!136)))))

(declare-fun b!601825 () Bool)

(assert (=> b!601825 (= e!344148 e!344147)))

(declare-fun res!386429 () Bool)

(assert (=> b!601825 (=> (not res!386429) (not e!344147))))

(assert (=> b!601825 (= res!386429 (not e!344150))))

(declare-fun res!386430 () Bool)

(assert (=> b!601825 (=> (not res!386430) (not e!344150))))

(assert (=> b!601825 (= res!386430 (validKeyInArray!0 (select (arr!17836 lt!273887) j!136)))))

(declare-fun bm!32976 () Bool)

(assert (=> bm!32976 (= call!32979 (arrayNoDuplicates!0 lt!273887 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68064 (Cons!11873 (select (arr!17836 lt!273887) j!136) Nil!11874) Nil!11874)))))

(declare-fun b!601826 () Bool)

(assert (=> b!601826 (= e!344149 call!32979)))

(assert (= (and d!87239 (not res!386428)) b!601825))

(assert (= (and b!601825 res!386430) b!601824))

(assert (= (and b!601825 res!386429) b!601823))

(assert (= (and b!601823 c!68064) b!601822))

(assert (= (and b!601823 (not c!68064)) b!601826))

(assert (= (or b!601822 b!601826) bm!32976))

(assert (=> b!601823 m!578931))

(assert (=> b!601823 m!578931))

(declare-fun m!579045 () Bool)

(assert (=> b!601823 m!579045))

(assert (=> b!601824 m!578931))

(assert (=> b!601824 m!578931))

(declare-fun m!579047 () Bool)

(assert (=> b!601824 m!579047))

(assert (=> b!601825 m!578931))

(assert (=> b!601825 m!578931))

(assert (=> b!601825 m!579045))

(assert (=> bm!32976 m!578931))

(declare-fun m!579049 () Bool)

(assert (=> bm!32976 m!579049))

(assert (=> b!601557 d!87239))

(declare-fun d!87241 () Bool)

(declare-fun e!344171 () Bool)

(assert (=> d!87241 e!344171))

(declare-fun res!386442 () Bool)

(assert (=> d!87241 (=> (not res!386442) (not e!344171))))

(assert (=> d!87241 (= res!386442 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18200 a!2986))))))

(declare-fun lt!274025 () Unit!19036)

(declare-fun choose!41 (array!37153 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11877) Unit!19036)

(assert (=> d!87241 (= lt!274025 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11874))))

(assert (=> d!87241 (bvslt (size!18200 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87241 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11874) lt!274025)))

(declare-fun b!601856 () Bool)

(assert (=> b!601856 (= e!344171 (arrayNoDuplicates!0 (array!37154 (store (arr!17836 a!2986) i!1108 k0!1786) (size!18200 a!2986)) #b00000000000000000000000000000000 Nil!11874))))

(assert (= (and d!87241 res!386442) b!601856))

(declare-fun m!579051 () Bool)

(assert (=> d!87241 m!579051))

(assert (=> b!601856 m!578735))

(declare-fun m!579057 () Bool)

(assert (=> b!601856 m!579057))

(assert (=> b!601557 d!87241))

(declare-fun b!601885 () Bool)

(declare-fun e!344193 () Bool)

(declare-fun call!32986 () Bool)

(assert (=> b!601885 (= e!344193 call!32986)))

(declare-fun b!601886 () Bool)

(declare-fun e!344191 () Bool)

(assert (=> b!601886 (= e!344191 e!344193)))

(declare-fun c!68083 () Bool)

(assert (=> b!601886 (= c!68083 (validKeyInArray!0 (select (arr!17836 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!601887 () Bool)

(declare-fun e!344192 () Bool)

(assert (=> b!601887 (= e!344192 call!32986)))

(declare-fun b!601888 () Bool)

(assert (=> b!601888 (= e!344193 e!344192)))

(declare-fun lt!274042 () (_ BitVec 64))

(assert (=> b!601888 (= lt!274042 (select (arr!17836 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!274044 () Unit!19036)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37153 (_ BitVec 64) (_ BitVec 32)) Unit!19036)

(assert (=> b!601888 (= lt!274044 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!274042 #b00000000000000000000000000000000))))

(assert (=> b!601888 (arrayContainsKey!0 a!2986 lt!274042 #b00000000000000000000000000000000)))

(declare-fun lt!274043 () Unit!19036)

(assert (=> b!601888 (= lt!274043 lt!274044)))

(declare-fun res!386453 () Bool)

(assert (=> b!601888 (= res!386453 (= (seekEntryOrOpen!0 (select (arr!17836 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6276 #b00000000000000000000000000000000)))))

(assert (=> b!601888 (=> (not res!386453) (not e!344192))))

(declare-fun d!87243 () Bool)

(declare-fun res!386454 () Bool)

(assert (=> d!87243 (=> res!386454 e!344191)))

(assert (=> d!87243 (= res!386454 (bvsge #b00000000000000000000000000000000 (size!18200 a!2986)))))

(assert (=> d!87243 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!344191)))

(declare-fun bm!32983 () Bool)

(assert (=> bm!32983 (= call!32986 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!87243 (not res!386454)) b!601886))

(assert (= (and b!601886 c!68083) b!601888))

(assert (= (and b!601886 (not c!68083)) b!601885))

(assert (= (and b!601888 res!386453) b!601887))

(assert (= (or b!601887 b!601885) bm!32983))

(assert (=> b!601886 m!578849))

(assert (=> b!601886 m!578849))

(assert (=> b!601886 m!578859))

(assert (=> b!601888 m!578849))

(declare-fun m!579091 () Bool)

(assert (=> b!601888 m!579091))

(declare-fun m!579093 () Bool)

(assert (=> b!601888 m!579093))

(assert (=> b!601888 m!578849))

(declare-fun m!579095 () Bool)

(assert (=> b!601888 m!579095))

(declare-fun m!579097 () Bool)

(assert (=> bm!32983 m!579097))

(assert (=> b!601558 d!87243))

(check-sat (not b!601669) (not b!601732) (not b!601747) (not b!601667) (not bm!32983) (not d!87227) (not b!601740) (not d!87233) (not b!601856) (not b!601681) (not b!601668) (not b!601814) (not b!601824) (not d!87167) (not b!601819) (not b!601823) (not b!601637) (not d!87169) (not d!87181) (not d!87215) (not d!87241) (not b!601733) (not d!87165) (not b!601687) (not b!601650) (not b!601825) (not d!87189) (not bm!32966) (not b!601888) (not bm!32975) (not b!601886) (not d!87159) (not b!601815) (not d!87139) (not bm!32976) (not b!601816) (not b!601810))
(check-sat)
