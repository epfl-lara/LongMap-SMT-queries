; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55488 () Bool)

(assert start!55488)

(declare-fun b!606651 () Bool)

(declare-datatypes ((Unit!19297 0))(
  ( (Unit!19298) )
))
(declare-fun e!347346 () Unit!19297)

(declare-fun Unit!19299 () Unit!19297)

(assert (=> b!606651 (= e!347346 Unit!19299)))

(assert (=> b!606651 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!606652 () Bool)

(declare-datatypes ((array!37257 0))(
  ( (array!37258 (arr!17878 (Array (_ BitVec 32) (_ BitVec 64))) (size!18242 (_ BitVec 32))) )
))
(declare-fun lt!276883 () array!37257)

(declare-fun e!347345 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37257)

(declare-fun arrayContainsKey!0 (array!37257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!606652 (= e!347345 (arrayContainsKey!0 lt!276883 (select (arr!17878 a!2986) j!136) index!984))))

(declare-fun b!606653 () Bool)

(declare-fun res!389673 () Bool)

(declare-fun e!347336 () Bool)

(assert (=> b!606653 (=> (not res!389673) (not e!347336))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!606653 (= res!389673 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17878 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!606654 () Bool)

(declare-fun e!347334 () Bool)

(assert (=> b!606654 (= e!347336 e!347334)))

(declare-fun res!389685 () Bool)

(assert (=> b!606654 (=> (not res!389685) (not e!347334))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!606654 (= res!389685 (= (select (store (arr!17878 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606654 (= lt!276883 (array!37258 (store (arr!17878 a!2986) i!1108 k0!1786) (size!18242 a!2986)))))

(declare-fun b!606655 () Bool)

(declare-fun res!389676 () Bool)

(declare-fun e!347340 () Bool)

(assert (=> b!606655 (=> (not res!389676) (not e!347340))))

(assert (=> b!606655 (= res!389676 (and (= (size!18242 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18242 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18242 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!606656 () Bool)

(declare-fun Unit!19300 () Unit!19297)

(assert (=> b!606656 (= e!347346 Unit!19300)))

(declare-fun b!606657 () Bool)

(declare-fun e!347330 () Bool)

(declare-datatypes ((List!11826 0))(
  ( (Nil!11823) (Cons!11822 (h!12870 (_ BitVec 64)) (t!18046 List!11826)) )
))
(declare-fun contains!2976 (List!11826 (_ BitVec 64)) Bool)

(assert (=> b!606657 (= e!347330 (not (contains!2976 Nil!11823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!606658 () Bool)

(declare-fun res!389688 () Bool)

(assert (=> b!606658 (=> (not res!389688) (not e!347340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!606658 (= res!389688 (validKeyInArray!0 (select (arr!17878 a!2986) j!136)))))

(declare-fun b!606659 () Bool)

(declare-fun e!347344 () Bool)

(assert (=> b!606659 (= e!347344 e!347330)))

(declare-fun res!389671 () Bool)

(assert (=> b!606659 (=> (not res!389671) (not e!347330))))

(assert (=> b!606659 (= res!389671 (not (contains!2976 Nil!11823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!606661 () Bool)

(declare-fun res!389684 () Bool)

(assert (=> b!606661 (=> (not res!389684) (not e!347340))))

(assert (=> b!606661 (= res!389684 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun e!347333 () Bool)

(declare-fun b!606662 () Bool)

(assert (=> b!606662 (= e!347333 (arrayContainsKey!0 lt!276883 (select (arr!17878 a!2986) j!136) index!984))))

(declare-fun b!606663 () Bool)

(assert (=> b!606663 (= e!347340 e!347336)))

(declare-fun res!389678 () Bool)

(assert (=> b!606663 (=> (not res!389678) (not e!347336))))

(declare-datatypes ((SeekEntryResult!6274 0))(
  ( (MissingZero!6274 (index!27368 (_ BitVec 32))) (Found!6274 (index!27369 (_ BitVec 32))) (Intermediate!6274 (undefined!7086 Bool) (index!27370 (_ BitVec 32)) (x!56329 (_ BitVec 32))) (Undefined!6274) (MissingVacant!6274 (index!27371 (_ BitVec 32))) )
))
(declare-fun lt!276890 () SeekEntryResult!6274)

(assert (=> b!606663 (= res!389678 (or (= lt!276890 (MissingZero!6274 i!1108)) (= lt!276890 (MissingVacant!6274 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37257 (_ BitVec 32)) SeekEntryResult!6274)

(assert (=> b!606663 (= lt!276890 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!606664 () Bool)

(declare-fun res!389683 () Bool)

(assert (=> b!606664 (=> (not res!389683) (not e!347340))))

(assert (=> b!606664 (= res!389683 (validKeyInArray!0 k0!1786))))

(declare-fun b!606665 () Bool)

(declare-fun e!347341 () Unit!19297)

(declare-fun Unit!19301 () Unit!19297)

(assert (=> b!606665 (= e!347341 Unit!19301)))

(declare-fun b!606666 () Bool)

(declare-fun Unit!19302 () Unit!19297)

(assert (=> b!606666 (= e!347341 Unit!19302)))

(declare-fun lt!276880 () Unit!19297)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37257 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19297)

(assert (=> b!606666 (= lt!276880 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276883 (select (arr!17878 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!606666 (arrayContainsKey!0 lt!276883 (select (arr!17878 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276885 () Unit!19297)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37257 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11826) Unit!19297)

(assert (=> b!606666 (= lt!276885 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11823))))

(declare-fun arrayNoDuplicates!0 (array!37257 (_ BitVec 32) List!11826) Bool)

(assert (=> b!606666 (arrayNoDuplicates!0 lt!276883 #b00000000000000000000000000000000 Nil!11823)))

(declare-fun lt!276888 () Unit!19297)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37257 (_ BitVec 32) (_ BitVec 32)) Unit!19297)

(assert (=> b!606666 (= lt!276888 (lemmaNoDuplicateFromThenFromBigger!0 lt!276883 #b00000000000000000000000000000000 j!136))))

(assert (=> b!606666 (arrayNoDuplicates!0 lt!276883 j!136 Nil!11823)))

(declare-fun lt!276884 () Unit!19297)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37257 (_ BitVec 64) (_ BitVec 32) List!11826) Unit!19297)

(assert (=> b!606666 (= lt!276884 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276883 (select (arr!17878 a!2986) j!136) j!136 Nil!11823))))

(assert (=> b!606666 false))

(declare-fun b!606667 () Bool)

(declare-fun e!347331 () Bool)

(assert (=> b!606667 (= e!347331 e!347344)))

(declare-fun res!389686 () Bool)

(assert (=> b!606667 (=> res!389686 e!347344)))

(assert (=> b!606667 (= res!389686 (or (bvsgt #b00000000000000000000000000000000 (size!18242 a!2986)) (bvsge (size!18242 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!606667 (arrayContainsKey!0 lt!276883 (select (arr!17878 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276891 () Unit!19297)

(assert (=> b!606667 (= lt!276891 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276883 (select (arr!17878 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!606667 e!347345))

(declare-fun res!389677 () Bool)

(assert (=> b!606667 (=> (not res!389677) (not e!347345))))

(assert (=> b!606667 (= res!389677 (arrayContainsKey!0 lt!276883 (select (arr!17878 a!2986) j!136) j!136))))

(declare-fun b!606668 () Bool)

(declare-fun e!347332 () Bool)

(assert (=> b!606668 (= e!347332 e!347333)))

(declare-fun res!389668 () Bool)

(assert (=> b!606668 (=> (not res!389668) (not e!347333))))

(assert (=> b!606668 (= res!389668 (arrayContainsKey!0 lt!276883 (select (arr!17878 a!2986) j!136) j!136))))

(declare-fun b!606669 () Bool)

(declare-fun e!347342 () Bool)

(declare-fun e!347337 () Bool)

(assert (=> b!606669 (= e!347342 (not e!347337))))

(declare-fun res!389672 () Bool)

(assert (=> b!606669 (=> res!389672 e!347337)))

(declare-fun lt!276879 () SeekEntryResult!6274)

(assert (=> b!606669 (= res!389672 (not (= lt!276879 (Found!6274 index!984))))))

(declare-fun lt!276887 () Unit!19297)

(assert (=> b!606669 (= lt!276887 e!347346)))

(declare-fun c!68860 () Bool)

(assert (=> b!606669 (= c!68860 (= lt!276879 Undefined!6274))))

(declare-fun lt!276886 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37257 (_ BitVec 32)) SeekEntryResult!6274)

(assert (=> b!606669 (= lt!276879 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276886 lt!276883 mask!3053))))

(declare-fun e!347338 () Bool)

(assert (=> b!606669 e!347338))

(declare-fun res!389681 () Bool)

(assert (=> b!606669 (=> (not res!389681) (not e!347338))))

(declare-fun lt!276878 () SeekEntryResult!6274)

(declare-fun lt!276882 () (_ BitVec 32))

(assert (=> b!606669 (= res!389681 (= lt!276878 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276882 vacantSpotIndex!68 lt!276886 lt!276883 mask!3053)))))

(assert (=> b!606669 (= lt!276878 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276882 vacantSpotIndex!68 (select (arr!17878 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!606669 (= lt!276886 (select (store (arr!17878 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!276877 () Unit!19297)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19297)

(assert (=> b!606669 (= lt!276877 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276882 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!606669 (= lt!276882 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!606670 () Bool)

(declare-fun res!389687 () Bool)

(assert (=> b!606670 (=> (not res!389687) (not e!347336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37257 (_ BitVec 32)) Bool)

(assert (=> b!606670 (= res!389687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!606671 () Bool)

(declare-fun lt!276889 () SeekEntryResult!6274)

(assert (=> b!606671 (= e!347338 (= lt!276889 lt!276878))))

(declare-fun b!606672 () Bool)

(declare-fun e!347335 () Bool)

(assert (=> b!606672 (= e!347335 e!347331)))

(declare-fun res!389669 () Bool)

(assert (=> b!606672 (=> res!389669 e!347331)))

(assert (=> b!606672 (= res!389669 (bvsge index!984 j!136))))

(declare-fun lt!276892 () Unit!19297)

(assert (=> b!606672 (= lt!276892 e!347341)))

(declare-fun c!68861 () Bool)

(assert (=> b!606672 (= c!68861 (bvslt j!136 index!984))))

(declare-fun b!606673 () Bool)

(assert (=> b!606673 (= e!347334 e!347342)))

(declare-fun res!389670 () Bool)

(assert (=> b!606673 (=> (not res!389670) (not e!347342))))

(assert (=> b!606673 (= res!389670 (and (= lt!276889 (Found!6274 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17878 a!2986) index!984) (select (arr!17878 a!2986) j!136))) (not (= (select (arr!17878 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!606673 (= lt!276889 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17878 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!606674 () Bool)

(declare-fun res!389675 () Bool)

(assert (=> b!606674 (=> res!389675 e!347344)))

(declare-fun noDuplicate!310 (List!11826) Bool)

(assert (=> b!606674 (= res!389675 (not (noDuplicate!310 Nil!11823)))))

(declare-fun b!606660 () Bool)

(assert (=> b!606660 (= e!347337 e!347335)))

(declare-fun res!389674 () Bool)

(assert (=> b!606660 (=> res!389674 e!347335)))

(declare-fun lt!276881 () (_ BitVec 64))

(assert (=> b!606660 (= res!389674 (or (not (= (select (arr!17878 a!2986) j!136) lt!276886)) (not (= (select (arr!17878 a!2986) j!136) lt!276881))))))

(declare-fun e!347343 () Bool)

(assert (=> b!606660 e!347343))

(declare-fun res!389689 () Bool)

(assert (=> b!606660 (=> (not res!389689) (not e!347343))))

(assert (=> b!606660 (= res!389689 (= lt!276881 (select (arr!17878 a!2986) j!136)))))

(assert (=> b!606660 (= lt!276881 (select (store (arr!17878 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!389680 () Bool)

(assert (=> start!55488 (=> (not res!389680) (not e!347340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55488 (= res!389680 (validMask!0 mask!3053))))

(assert (=> start!55488 e!347340))

(assert (=> start!55488 true))

(declare-fun array_inv!13737 (array!37257) Bool)

(assert (=> start!55488 (array_inv!13737 a!2986)))

(declare-fun b!606675 () Bool)

(assert (=> b!606675 (= e!347343 e!347332)))

(declare-fun res!389682 () Bool)

(assert (=> b!606675 (=> res!389682 e!347332)))

(assert (=> b!606675 (= res!389682 (or (not (= (select (arr!17878 a!2986) j!136) lt!276886)) (not (= (select (arr!17878 a!2986) j!136) lt!276881)) (bvsge j!136 index!984)))))

(declare-fun b!606676 () Bool)

(declare-fun res!389679 () Bool)

(assert (=> b!606676 (=> (not res!389679) (not e!347336))))

(assert (=> b!606676 (= res!389679 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11823))))

(assert (= (and start!55488 res!389680) b!606655))

(assert (= (and b!606655 res!389676) b!606658))

(assert (= (and b!606658 res!389688) b!606664))

(assert (= (and b!606664 res!389683) b!606661))

(assert (= (and b!606661 res!389684) b!606663))

(assert (= (and b!606663 res!389678) b!606670))

(assert (= (and b!606670 res!389687) b!606676))

(assert (= (and b!606676 res!389679) b!606653))

(assert (= (and b!606653 res!389673) b!606654))

(assert (= (and b!606654 res!389685) b!606673))

(assert (= (and b!606673 res!389670) b!606669))

(assert (= (and b!606669 res!389681) b!606671))

(assert (= (and b!606669 c!68860) b!606651))

(assert (= (and b!606669 (not c!68860)) b!606656))

(assert (= (and b!606669 (not res!389672)) b!606660))

(assert (= (and b!606660 res!389689) b!606675))

(assert (= (and b!606675 (not res!389682)) b!606668))

(assert (= (and b!606668 res!389668) b!606662))

(assert (= (and b!606660 (not res!389674)) b!606672))

(assert (= (and b!606672 c!68861) b!606666))

(assert (= (and b!606672 (not c!68861)) b!606665))

(assert (= (and b!606672 (not res!389669)) b!606667))

(assert (= (and b!606667 res!389677) b!606652))

(assert (= (and b!606667 (not res!389686)) b!606674))

(assert (= (and b!606674 (not res!389675)) b!606659))

(assert (= (and b!606659 res!389671) b!606657))

(declare-fun m!583715 () Bool)

(assert (=> b!606676 m!583715))

(declare-fun m!583717 () Bool)

(assert (=> b!606658 m!583717))

(assert (=> b!606658 m!583717))

(declare-fun m!583719 () Bool)

(assert (=> b!606658 m!583719))

(declare-fun m!583721 () Bool)

(assert (=> b!606657 m!583721))

(declare-fun m!583723 () Bool)

(assert (=> b!606669 m!583723))

(declare-fun m!583725 () Bool)

(assert (=> b!606669 m!583725))

(declare-fun m!583727 () Bool)

(assert (=> b!606669 m!583727))

(assert (=> b!606669 m!583717))

(declare-fun m!583729 () Bool)

(assert (=> b!606669 m!583729))

(declare-fun m!583731 () Bool)

(assert (=> b!606669 m!583731))

(declare-fun m!583733 () Bool)

(assert (=> b!606669 m!583733))

(assert (=> b!606669 m!583717))

(declare-fun m!583735 () Bool)

(assert (=> b!606669 m!583735))

(assert (=> b!606668 m!583717))

(assert (=> b!606668 m!583717))

(declare-fun m!583737 () Bool)

(assert (=> b!606668 m!583737))

(assert (=> b!606654 m!583729))

(declare-fun m!583739 () Bool)

(assert (=> b!606654 m!583739))

(declare-fun m!583741 () Bool)

(assert (=> b!606666 m!583741))

(assert (=> b!606666 m!583717))

(declare-fun m!583743 () Bool)

(assert (=> b!606666 m!583743))

(assert (=> b!606666 m!583717))

(declare-fun m!583745 () Bool)

(assert (=> b!606666 m!583745))

(assert (=> b!606666 m!583717))

(declare-fun m!583747 () Bool)

(assert (=> b!606666 m!583747))

(assert (=> b!606666 m!583717))

(declare-fun m!583749 () Bool)

(assert (=> b!606666 m!583749))

(declare-fun m!583751 () Bool)

(assert (=> b!606666 m!583751))

(declare-fun m!583753 () Bool)

(assert (=> b!606666 m!583753))

(declare-fun m!583755 () Bool)

(assert (=> b!606661 m!583755))

(declare-fun m!583757 () Bool)

(assert (=> b!606659 m!583757))

(declare-fun m!583759 () Bool)

(assert (=> b!606653 m!583759))

(assert (=> b!606675 m!583717))

(declare-fun m!583761 () Bool)

(assert (=> b!606663 m!583761))

(declare-fun m!583763 () Bool)

(assert (=> b!606674 m!583763))

(assert (=> b!606660 m!583717))

(assert (=> b!606660 m!583729))

(declare-fun m!583765 () Bool)

(assert (=> b!606660 m!583765))

(assert (=> b!606667 m!583717))

(assert (=> b!606667 m!583717))

(declare-fun m!583767 () Bool)

(assert (=> b!606667 m!583767))

(assert (=> b!606667 m!583717))

(declare-fun m!583769 () Bool)

(assert (=> b!606667 m!583769))

(assert (=> b!606667 m!583717))

(assert (=> b!606667 m!583737))

(assert (=> b!606652 m!583717))

(assert (=> b!606652 m!583717))

(declare-fun m!583771 () Bool)

(assert (=> b!606652 m!583771))

(declare-fun m!583773 () Bool)

(assert (=> b!606673 m!583773))

(assert (=> b!606673 m!583717))

(assert (=> b!606673 m!583717))

(declare-fun m!583775 () Bool)

(assert (=> b!606673 m!583775))

(declare-fun m!583777 () Bool)

(assert (=> b!606664 m!583777))

(assert (=> b!606662 m!583717))

(assert (=> b!606662 m!583717))

(assert (=> b!606662 m!583771))

(declare-fun m!583779 () Bool)

(assert (=> b!606670 m!583779))

(declare-fun m!583781 () Bool)

(assert (=> start!55488 m!583781))

(declare-fun m!583783 () Bool)

(assert (=> start!55488 m!583783))

(check-sat (not b!606664) (not b!606670) (not start!55488) (not b!606666) (not b!606662) (not b!606667) (not b!606676) (not b!606659) (not b!606673) (not b!606663) (not b!606674) (not b!606668) (not b!606669) (not b!606658) (not b!606661) (not b!606657) (not b!606652))
(check-sat)
(get-model)

(declare-fun e!347455 () SeekEntryResult!6274)

(declare-fun b!606845 () Bool)

(declare-fun lt!276997 () SeekEntryResult!6274)

(assert (=> b!606845 (= e!347455 (seekKeyOrZeroReturnVacant!0 (x!56329 lt!276997) (index!27370 lt!276997) (index!27370 lt!276997) k0!1786 a!2986 mask!3053))))

(declare-fun b!606846 () Bool)

(declare-fun e!347457 () SeekEntryResult!6274)

(assert (=> b!606846 (= e!347457 Undefined!6274)))

(declare-fun d!88013 () Bool)

(declare-fun lt!276995 () SeekEntryResult!6274)

(get-info :version)

(assert (=> d!88013 (and (or ((_ is Undefined!6274) lt!276995) (not ((_ is Found!6274) lt!276995)) (and (bvsge (index!27369 lt!276995) #b00000000000000000000000000000000) (bvslt (index!27369 lt!276995) (size!18242 a!2986)))) (or ((_ is Undefined!6274) lt!276995) ((_ is Found!6274) lt!276995) (not ((_ is MissingZero!6274) lt!276995)) (and (bvsge (index!27368 lt!276995) #b00000000000000000000000000000000) (bvslt (index!27368 lt!276995) (size!18242 a!2986)))) (or ((_ is Undefined!6274) lt!276995) ((_ is Found!6274) lt!276995) ((_ is MissingZero!6274) lt!276995) (not ((_ is MissingVacant!6274) lt!276995)) (and (bvsge (index!27371 lt!276995) #b00000000000000000000000000000000) (bvslt (index!27371 lt!276995) (size!18242 a!2986)))) (or ((_ is Undefined!6274) lt!276995) (ite ((_ is Found!6274) lt!276995) (= (select (arr!17878 a!2986) (index!27369 lt!276995)) k0!1786) (ite ((_ is MissingZero!6274) lt!276995) (= (select (arr!17878 a!2986) (index!27368 lt!276995)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6274) lt!276995) (= (select (arr!17878 a!2986) (index!27371 lt!276995)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88013 (= lt!276995 e!347457)))

(declare-fun c!68880 () Bool)

(assert (=> d!88013 (= c!68880 (and ((_ is Intermediate!6274) lt!276997) (undefined!7086 lt!276997)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37257 (_ BitVec 32)) SeekEntryResult!6274)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88013 (= lt!276997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88013 (validMask!0 mask!3053)))

(assert (=> d!88013 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!276995)))

(declare-fun b!606847 () Bool)

(assert (=> b!606847 (= e!347455 (MissingZero!6274 (index!27370 lt!276997)))))

(declare-fun b!606848 () Bool)

(declare-fun c!68882 () Bool)

(declare-fun lt!276996 () (_ BitVec 64))

(assert (=> b!606848 (= c!68882 (= lt!276996 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347456 () SeekEntryResult!6274)

(assert (=> b!606848 (= e!347456 e!347455)))

(declare-fun b!606849 () Bool)

(assert (=> b!606849 (= e!347457 e!347456)))

(assert (=> b!606849 (= lt!276996 (select (arr!17878 a!2986) (index!27370 lt!276997)))))

(declare-fun c!68881 () Bool)

(assert (=> b!606849 (= c!68881 (= lt!276996 k0!1786))))

(declare-fun b!606850 () Bool)

(assert (=> b!606850 (= e!347456 (Found!6274 (index!27370 lt!276997)))))

(assert (= (and d!88013 c!68880) b!606846))

(assert (= (and d!88013 (not c!68880)) b!606849))

(assert (= (and b!606849 c!68881) b!606850))

(assert (= (and b!606849 (not c!68881)) b!606848))

(assert (= (and b!606848 c!68882) b!606847))

(assert (= (and b!606848 (not c!68882)) b!606845))

(declare-fun m!583925 () Bool)

(assert (=> b!606845 m!583925))

(assert (=> d!88013 m!583781))

(declare-fun m!583927 () Bool)

(assert (=> d!88013 m!583927))

(declare-fun m!583929 () Bool)

(assert (=> d!88013 m!583929))

(declare-fun m!583931 () Bool)

(assert (=> d!88013 m!583931))

(assert (=> d!88013 m!583929))

(declare-fun m!583933 () Bool)

(assert (=> d!88013 m!583933))

(declare-fun m!583935 () Bool)

(assert (=> d!88013 m!583935))

(declare-fun m!583937 () Bool)

(assert (=> b!606849 m!583937))

(assert (=> b!606663 d!88013))

(declare-fun d!88015 () Bool)

(declare-fun res!389826 () Bool)

(declare-fun e!347462 () Bool)

(assert (=> d!88015 (=> res!389826 e!347462)))

(assert (=> d!88015 (= res!389826 (= (select (arr!17878 lt!276883) index!984) (select (arr!17878 a!2986) j!136)))))

(assert (=> d!88015 (= (arrayContainsKey!0 lt!276883 (select (arr!17878 a!2986) j!136) index!984) e!347462)))

(declare-fun b!606855 () Bool)

(declare-fun e!347463 () Bool)

(assert (=> b!606855 (= e!347462 e!347463)))

(declare-fun res!389827 () Bool)

(assert (=> b!606855 (=> (not res!389827) (not e!347463))))

(assert (=> b!606855 (= res!389827 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18242 lt!276883)))))

(declare-fun b!606856 () Bool)

(assert (=> b!606856 (= e!347463 (arrayContainsKey!0 lt!276883 (select (arr!17878 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88015 (not res!389826)) b!606855))

(assert (= (and b!606855 res!389827) b!606856))

(declare-fun m!583939 () Bool)

(assert (=> d!88015 m!583939))

(assert (=> b!606856 m!583717))

(declare-fun m!583941 () Bool)

(assert (=> b!606856 m!583941))

(assert (=> b!606652 d!88015))

(declare-fun d!88017 () Bool)

(declare-fun res!389832 () Bool)

(declare-fun e!347468 () Bool)

(assert (=> d!88017 (=> res!389832 e!347468)))

(assert (=> d!88017 (= res!389832 ((_ is Nil!11823) Nil!11823))))

(assert (=> d!88017 (= (noDuplicate!310 Nil!11823) e!347468)))

(declare-fun b!606861 () Bool)

(declare-fun e!347469 () Bool)

(assert (=> b!606861 (= e!347468 e!347469)))

(declare-fun res!389833 () Bool)

(assert (=> b!606861 (=> (not res!389833) (not e!347469))))

(assert (=> b!606861 (= res!389833 (not (contains!2976 (t!18046 Nil!11823) (h!12870 Nil!11823))))))

(declare-fun b!606862 () Bool)

(assert (=> b!606862 (= e!347469 (noDuplicate!310 (t!18046 Nil!11823)))))

(assert (= (and d!88017 (not res!389832)) b!606861))

(assert (= (and b!606861 res!389833) b!606862))

(declare-fun m!583943 () Bool)

(assert (=> b!606861 m!583943))

(declare-fun m!583945 () Bool)

(assert (=> b!606862 m!583945))

(assert (=> b!606674 d!88017))

(declare-fun d!88019 () Bool)

(assert (=> d!88019 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!606664 d!88019))

(declare-fun b!606873 () Bool)

(declare-fun e!347479 () Bool)

(declare-fun call!33093 () Bool)

(assert (=> b!606873 (= e!347479 call!33093)))

(declare-fun b!606874 () Bool)

(assert (=> b!606874 (= e!347479 call!33093)))

(declare-fun b!606875 () Bool)

(declare-fun e!347481 () Bool)

(assert (=> b!606875 (= e!347481 (contains!2976 Nil!11823 (select (arr!17878 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606876 () Bool)

(declare-fun e!347480 () Bool)

(declare-fun e!347478 () Bool)

(assert (=> b!606876 (= e!347480 e!347478)))

(declare-fun res!389840 () Bool)

(assert (=> b!606876 (=> (not res!389840) (not e!347478))))

(assert (=> b!606876 (= res!389840 (not e!347481))))

(declare-fun res!389841 () Bool)

(assert (=> b!606876 (=> (not res!389841) (not e!347481))))

(assert (=> b!606876 (= res!389841 (validKeyInArray!0 (select (arr!17878 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606877 () Bool)

(assert (=> b!606877 (= e!347478 e!347479)))

(declare-fun c!68885 () Bool)

(assert (=> b!606877 (= c!68885 (validKeyInArray!0 (select (arr!17878 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88021 () Bool)

(declare-fun res!389842 () Bool)

(assert (=> d!88021 (=> res!389842 e!347480)))

(assert (=> d!88021 (= res!389842 (bvsge #b00000000000000000000000000000000 (size!18242 a!2986)))))

(assert (=> d!88021 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11823) e!347480)))

(declare-fun bm!33090 () Bool)

(assert (=> bm!33090 (= call!33093 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68885 (Cons!11822 (select (arr!17878 a!2986) #b00000000000000000000000000000000) Nil!11823) Nil!11823)))))

(assert (= (and d!88021 (not res!389842)) b!606876))

(assert (= (and b!606876 res!389841) b!606875))

(assert (= (and b!606876 res!389840) b!606877))

(assert (= (and b!606877 c!68885) b!606873))

(assert (= (and b!606877 (not c!68885)) b!606874))

(assert (= (or b!606873 b!606874) bm!33090))

(declare-fun m!583947 () Bool)

(assert (=> b!606875 m!583947))

(assert (=> b!606875 m!583947))

(declare-fun m!583949 () Bool)

(assert (=> b!606875 m!583949))

(assert (=> b!606876 m!583947))

(assert (=> b!606876 m!583947))

(declare-fun m!583951 () Bool)

(assert (=> b!606876 m!583951))

(assert (=> b!606877 m!583947))

(assert (=> b!606877 m!583947))

(assert (=> b!606877 m!583951))

(assert (=> bm!33090 m!583947))

(declare-fun m!583953 () Bool)

(assert (=> bm!33090 m!583953))

(assert (=> b!606676 d!88021))

(declare-fun b!606878 () Bool)

(declare-fun e!347483 () Bool)

(declare-fun call!33094 () Bool)

(assert (=> b!606878 (= e!347483 call!33094)))

(declare-fun b!606879 () Bool)

(assert (=> b!606879 (= e!347483 call!33094)))

(declare-fun b!606880 () Bool)

(declare-fun e!347485 () Bool)

(assert (=> b!606880 (= e!347485 (contains!2976 Nil!11823 (select (arr!17878 lt!276883) j!136)))))

(declare-fun b!606881 () Bool)

(declare-fun e!347484 () Bool)

(declare-fun e!347482 () Bool)

(assert (=> b!606881 (= e!347484 e!347482)))

(declare-fun res!389843 () Bool)

(assert (=> b!606881 (=> (not res!389843) (not e!347482))))

(assert (=> b!606881 (= res!389843 (not e!347485))))

(declare-fun res!389844 () Bool)

(assert (=> b!606881 (=> (not res!389844) (not e!347485))))

(assert (=> b!606881 (= res!389844 (validKeyInArray!0 (select (arr!17878 lt!276883) j!136)))))

(declare-fun b!606882 () Bool)

(assert (=> b!606882 (= e!347482 e!347483)))

(declare-fun c!68886 () Bool)

(assert (=> b!606882 (= c!68886 (validKeyInArray!0 (select (arr!17878 lt!276883) j!136)))))

(declare-fun d!88023 () Bool)

(declare-fun res!389845 () Bool)

(assert (=> d!88023 (=> res!389845 e!347484)))

(assert (=> d!88023 (= res!389845 (bvsge j!136 (size!18242 lt!276883)))))

(assert (=> d!88023 (= (arrayNoDuplicates!0 lt!276883 j!136 Nil!11823) e!347484)))

(declare-fun bm!33091 () Bool)

(assert (=> bm!33091 (= call!33094 (arrayNoDuplicates!0 lt!276883 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68886 (Cons!11822 (select (arr!17878 lt!276883) j!136) Nil!11823) Nil!11823)))))

(assert (= (and d!88023 (not res!389845)) b!606881))

(assert (= (and b!606881 res!389844) b!606880))

(assert (= (and b!606881 res!389843) b!606882))

(assert (= (and b!606882 c!68886) b!606878))

(assert (= (and b!606882 (not c!68886)) b!606879))

(assert (= (or b!606878 b!606879) bm!33091))

(declare-fun m!583955 () Bool)

(assert (=> b!606880 m!583955))

(assert (=> b!606880 m!583955))

(declare-fun m!583957 () Bool)

(assert (=> b!606880 m!583957))

(assert (=> b!606881 m!583955))

(assert (=> b!606881 m!583955))

(declare-fun m!583959 () Bool)

(assert (=> b!606881 m!583959))

(assert (=> b!606882 m!583955))

(assert (=> b!606882 m!583955))

(assert (=> b!606882 m!583959))

(assert (=> bm!33091 m!583955))

(declare-fun m!583961 () Bool)

(assert (=> bm!33091 m!583961))

(assert (=> b!606666 d!88023))

(declare-fun b!606883 () Bool)

(declare-fun e!347487 () Bool)

(declare-fun call!33095 () Bool)

(assert (=> b!606883 (= e!347487 call!33095)))

(declare-fun b!606884 () Bool)

(assert (=> b!606884 (= e!347487 call!33095)))

(declare-fun b!606885 () Bool)

(declare-fun e!347489 () Bool)

(assert (=> b!606885 (= e!347489 (contains!2976 Nil!11823 (select (arr!17878 lt!276883) #b00000000000000000000000000000000)))))

(declare-fun b!606886 () Bool)

(declare-fun e!347488 () Bool)

(declare-fun e!347486 () Bool)

(assert (=> b!606886 (= e!347488 e!347486)))

(declare-fun res!389846 () Bool)

(assert (=> b!606886 (=> (not res!389846) (not e!347486))))

(assert (=> b!606886 (= res!389846 (not e!347489))))

(declare-fun res!389847 () Bool)

(assert (=> b!606886 (=> (not res!389847) (not e!347489))))

(assert (=> b!606886 (= res!389847 (validKeyInArray!0 (select (arr!17878 lt!276883) #b00000000000000000000000000000000)))))

(declare-fun b!606887 () Bool)

(assert (=> b!606887 (= e!347486 e!347487)))

(declare-fun c!68887 () Bool)

(assert (=> b!606887 (= c!68887 (validKeyInArray!0 (select (arr!17878 lt!276883) #b00000000000000000000000000000000)))))

(declare-fun d!88025 () Bool)

(declare-fun res!389848 () Bool)

(assert (=> d!88025 (=> res!389848 e!347488)))

(assert (=> d!88025 (= res!389848 (bvsge #b00000000000000000000000000000000 (size!18242 lt!276883)))))

(assert (=> d!88025 (= (arrayNoDuplicates!0 lt!276883 #b00000000000000000000000000000000 Nil!11823) e!347488)))

(declare-fun bm!33092 () Bool)

(assert (=> bm!33092 (= call!33095 (arrayNoDuplicates!0 lt!276883 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68887 (Cons!11822 (select (arr!17878 lt!276883) #b00000000000000000000000000000000) Nil!11823) Nil!11823)))))

(assert (= (and d!88025 (not res!389848)) b!606886))

(assert (= (and b!606886 res!389847) b!606885))

(assert (= (and b!606886 res!389846) b!606887))

(assert (= (and b!606887 c!68887) b!606883))

(assert (= (and b!606887 (not c!68887)) b!606884))

(assert (= (or b!606883 b!606884) bm!33092))

(declare-fun m!583963 () Bool)

(assert (=> b!606885 m!583963))

(assert (=> b!606885 m!583963))

(declare-fun m!583965 () Bool)

(assert (=> b!606885 m!583965))

(assert (=> b!606886 m!583963))

(assert (=> b!606886 m!583963))

(declare-fun m!583967 () Bool)

(assert (=> b!606886 m!583967))

(assert (=> b!606887 m!583963))

(assert (=> b!606887 m!583963))

(assert (=> b!606887 m!583967))

(assert (=> bm!33092 m!583963))

(declare-fun m!583969 () Bool)

(assert (=> bm!33092 m!583969))

(assert (=> b!606666 d!88025))

(declare-fun d!88027 () Bool)

(assert (=> d!88027 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18242 lt!276883)) (not (= (select (arr!17878 lt!276883) j!136) (select (arr!17878 a!2986) j!136))))))

(declare-fun lt!277000 () Unit!19297)

(declare-fun choose!21 (array!37257 (_ BitVec 64) (_ BitVec 32) List!11826) Unit!19297)

(assert (=> d!88027 (= lt!277000 (choose!21 lt!276883 (select (arr!17878 a!2986) j!136) j!136 Nil!11823))))

(assert (=> d!88027 (bvslt (size!18242 lt!276883) #b01111111111111111111111111111111)))

(assert (=> d!88027 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276883 (select (arr!17878 a!2986) j!136) j!136 Nil!11823) lt!277000)))

(declare-fun bs!18575 () Bool)

(assert (= bs!18575 d!88027))

(assert (=> bs!18575 m!583955))

(assert (=> bs!18575 m!583717))

(declare-fun m!583971 () Bool)

(assert (=> bs!18575 m!583971))

(assert (=> b!606666 d!88027))

(declare-fun d!88029 () Bool)

(declare-fun res!389849 () Bool)

(declare-fun e!347490 () Bool)

(assert (=> d!88029 (=> res!389849 e!347490)))

(assert (=> d!88029 (= res!389849 (= (select (arr!17878 lt!276883) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17878 a!2986) j!136)))))

(assert (=> d!88029 (= (arrayContainsKey!0 lt!276883 (select (arr!17878 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!347490)))

(declare-fun b!606888 () Bool)

(declare-fun e!347491 () Bool)

(assert (=> b!606888 (= e!347490 e!347491)))

(declare-fun res!389850 () Bool)

(assert (=> b!606888 (=> (not res!389850) (not e!347491))))

(assert (=> b!606888 (= res!389850 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18242 lt!276883)))))

(declare-fun b!606889 () Bool)

(assert (=> b!606889 (= e!347491 (arrayContainsKey!0 lt!276883 (select (arr!17878 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88029 (not res!389849)) b!606888))

(assert (= (and b!606888 res!389850) b!606889))

(declare-fun m!583973 () Bool)

(assert (=> d!88029 m!583973))

(assert (=> b!606889 m!583717))

(declare-fun m!583975 () Bool)

(assert (=> b!606889 m!583975))

(assert (=> b!606666 d!88029))

(declare-fun d!88031 () Bool)

(assert (=> d!88031 (arrayNoDuplicates!0 lt!276883 j!136 Nil!11823)))

(declare-fun lt!277003 () Unit!19297)

(declare-fun choose!39 (array!37257 (_ BitVec 32) (_ BitVec 32)) Unit!19297)

(assert (=> d!88031 (= lt!277003 (choose!39 lt!276883 #b00000000000000000000000000000000 j!136))))

(assert (=> d!88031 (bvslt (size!18242 lt!276883) #b01111111111111111111111111111111)))

(assert (=> d!88031 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!276883 #b00000000000000000000000000000000 j!136) lt!277003)))

(declare-fun bs!18576 () Bool)

(assert (= bs!18576 d!88031))

(assert (=> bs!18576 m!583741))

(declare-fun m!583977 () Bool)

(assert (=> bs!18576 m!583977))

(assert (=> b!606666 d!88031))

(declare-fun d!88033 () Bool)

(assert (=> d!88033 (arrayContainsKey!0 lt!276883 (select (arr!17878 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277006 () Unit!19297)

(declare-fun choose!114 (array!37257 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19297)

(assert (=> d!88033 (= lt!277006 (choose!114 lt!276883 (select (arr!17878 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!88033 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!88033 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276883 (select (arr!17878 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!277006)))

(declare-fun bs!18577 () Bool)

(assert (= bs!18577 d!88033))

(assert (=> bs!18577 m!583717))

(assert (=> bs!18577 m!583745))

(assert (=> bs!18577 m!583717))

(declare-fun m!583979 () Bool)

(assert (=> bs!18577 m!583979))

(assert (=> b!606666 d!88033))

(declare-fun d!88035 () Bool)

(declare-fun e!347494 () Bool)

(assert (=> d!88035 e!347494))

(declare-fun res!389853 () Bool)

(assert (=> d!88035 (=> (not res!389853) (not e!347494))))

(assert (=> d!88035 (= res!389853 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18242 a!2986))))))

(declare-fun lt!277009 () Unit!19297)

(declare-fun choose!41 (array!37257 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11826) Unit!19297)

(assert (=> d!88035 (= lt!277009 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11823))))

(assert (=> d!88035 (bvslt (size!18242 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!88035 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11823) lt!277009)))

(declare-fun b!606892 () Bool)

(assert (=> b!606892 (= e!347494 (arrayNoDuplicates!0 (array!37258 (store (arr!17878 a!2986) i!1108 k0!1786) (size!18242 a!2986)) #b00000000000000000000000000000000 Nil!11823))))

(assert (= (and d!88035 res!389853) b!606892))

(declare-fun m!583981 () Bool)

(assert (=> d!88035 m!583981))

(assert (=> b!606892 m!583729))

(declare-fun m!583983 () Bool)

(assert (=> b!606892 m!583983))

(assert (=> b!606666 d!88035))

(declare-fun d!88037 () Bool)

(declare-fun res!389854 () Bool)

(declare-fun e!347495 () Bool)

(assert (=> d!88037 (=> res!389854 e!347495)))

(assert (=> d!88037 (= res!389854 (= (select (arr!17878 lt!276883) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17878 a!2986) j!136)))))

(assert (=> d!88037 (= (arrayContainsKey!0 lt!276883 (select (arr!17878 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!347495)))

(declare-fun b!606893 () Bool)

(declare-fun e!347496 () Bool)

(assert (=> b!606893 (= e!347495 e!347496)))

(declare-fun res!389855 () Bool)

(assert (=> b!606893 (=> (not res!389855) (not e!347496))))

(assert (=> b!606893 (= res!389855 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18242 lt!276883)))))

(declare-fun b!606894 () Bool)

(assert (=> b!606894 (= e!347496 (arrayContainsKey!0 lt!276883 (select (arr!17878 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88037 (not res!389854)) b!606893))

(assert (= (and b!606893 res!389855) b!606894))

(declare-fun m!583985 () Bool)

(assert (=> d!88037 m!583985))

(assert (=> b!606894 m!583717))

(declare-fun m!583987 () Bool)

(assert (=> b!606894 m!583987))

(assert (=> b!606667 d!88037))

(declare-fun d!88039 () Bool)

(assert (=> d!88039 (arrayContainsKey!0 lt!276883 (select (arr!17878 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277010 () Unit!19297)

(assert (=> d!88039 (= lt!277010 (choose!114 lt!276883 (select (arr!17878 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!88039 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!88039 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276883 (select (arr!17878 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!277010)))

(declare-fun bs!18578 () Bool)

(assert (= bs!18578 d!88039))

(assert (=> bs!18578 m!583717))

(assert (=> bs!18578 m!583767))

(assert (=> bs!18578 m!583717))

(declare-fun m!583989 () Bool)

(assert (=> bs!18578 m!583989))

(assert (=> b!606667 d!88039))

(declare-fun d!88041 () Bool)

(declare-fun res!389856 () Bool)

(declare-fun e!347497 () Bool)

(assert (=> d!88041 (=> res!389856 e!347497)))

(assert (=> d!88041 (= res!389856 (= (select (arr!17878 lt!276883) j!136) (select (arr!17878 a!2986) j!136)))))

(assert (=> d!88041 (= (arrayContainsKey!0 lt!276883 (select (arr!17878 a!2986) j!136) j!136) e!347497)))

(declare-fun b!606895 () Bool)

(declare-fun e!347498 () Bool)

(assert (=> b!606895 (= e!347497 e!347498)))

(declare-fun res!389857 () Bool)

(assert (=> b!606895 (=> (not res!389857) (not e!347498))))

(assert (=> b!606895 (= res!389857 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18242 lt!276883)))))

(declare-fun b!606896 () Bool)

(assert (=> b!606896 (= e!347498 (arrayContainsKey!0 lt!276883 (select (arr!17878 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88041 (not res!389856)) b!606895))

(assert (= (and b!606895 res!389857) b!606896))

(assert (=> d!88041 m!583955))

(assert (=> b!606896 m!583717))

(declare-fun m!583991 () Bool)

(assert (=> b!606896 m!583991))

(assert (=> b!606667 d!88041))

(declare-fun d!88043 () Bool)

(declare-fun lt!277013 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!237 (List!11826) (InoxSet (_ BitVec 64)))

(assert (=> d!88043 (= lt!277013 (select (content!237 Nil!11823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347504 () Bool)

(assert (=> d!88043 (= lt!277013 e!347504)))

(declare-fun res!389863 () Bool)

(assert (=> d!88043 (=> (not res!389863) (not e!347504))))

(assert (=> d!88043 (= res!389863 ((_ is Cons!11822) Nil!11823))))

(assert (=> d!88043 (= (contains!2976 Nil!11823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!277013)))

(declare-fun b!606901 () Bool)

(declare-fun e!347503 () Bool)

(assert (=> b!606901 (= e!347504 e!347503)))

(declare-fun res!389862 () Bool)

(assert (=> b!606901 (=> res!389862 e!347503)))

(assert (=> b!606901 (= res!389862 (= (h!12870 Nil!11823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!606902 () Bool)

(assert (=> b!606902 (= e!347503 (contains!2976 (t!18046 Nil!11823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!88043 res!389863) b!606901))

(assert (= (and b!606901 (not res!389862)) b!606902))

(declare-fun m!583993 () Bool)

(assert (=> d!88043 m!583993))

(declare-fun m!583995 () Bool)

(assert (=> d!88043 m!583995))

(declare-fun m!583997 () Bool)

(assert (=> b!606902 m!583997))

(assert (=> b!606657 d!88043))

(assert (=> b!606668 d!88041))

(declare-fun b!606947 () Bool)

(declare-fun e!347542 () SeekEntryResult!6274)

(declare-fun e!347541 () SeekEntryResult!6274)

(assert (=> b!606947 (= e!347542 e!347541)))

(declare-fun c!68897 () Bool)

(declare-fun lt!277036 () (_ BitVec 64))

(assert (=> b!606947 (= c!68897 (= lt!277036 lt!276886))))

(declare-fun b!606948 () Bool)

(assert (=> b!606948 (= e!347541 (Found!6274 index!984))))

(declare-fun b!606949 () Bool)

(declare-fun c!68898 () Bool)

(assert (=> b!606949 (= c!68898 (= lt!277036 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347540 () SeekEntryResult!6274)

(assert (=> b!606949 (= e!347541 e!347540)))

(declare-fun b!606950 () Bool)

(assert (=> b!606950 (= e!347540 (MissingVacant!6274 vacantSpotIndex!68))))

(declare-fun b!606951 () Bool)

(assert (=> b!606951 (= e!347540 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!276886 lt!276883 mask!3053))))

(declare-fun b!606952 () Bool)

(assert (=> b!606952 (= e!347542 Undefined!6274)))

(declare-fun d!88045 () Bool)

(declare-fun lt!277037 () SeekEntryResult!6274)

(assert (=> d!88045 (and (or ((_ is Undefined!6274) lt!277037) (not ((_ is Found!6274) lt!277037)) (and (bvsge (index!27369 lt!277037) #b00000000000000000000000000000000) (bvslt (index!27369 lt!277037) (size!18242 lt!276883)))) (or ((_ is Undefined!6274) lt!277037) ((_ is Found!6274) lt!277037) (not ((_ is MissingVacant!6274) lt!277037)) (not (= (index!27371 lt!277037) vacantSpotIndex!68)) (and (bvsge (index!27371 lt!277037) #b00000000000000000000000000000000) (bvslt (index!27371 lt!277037) (size!18242 lt!276883)))) (or ((_ is Undefined!6274) lt!277037) (ite ((_ is Found!6274) lt!277037) (= (select (arr!17878 lt!276883) (index!27369 lt!277037)) lt!276886) (and ((_ is MissingVacant!6274) lt!277037) (= (index!27371 lt!277037) vacantSpotIndex!68) (= (select (arr!17878 lt!276883) (index!27371 lt!277037)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88045 (= lt!277037 e!347542)))

(declare-fun c!68899 () Bool)

(assert (=> d!88045 (= c!68899 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88045 (= lt!277036 (select (arr!17878 lt!276883) index!984))))

(assert (=> d!88045 (validMask!0 mask!3053)))

(assert (=> d!88045 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276886 lt!276883 mask!3053) lt!277037)))

(assert (= (and d!88045 c!68899) b!606952))

(assert (= (and d!88045 (not c!68899)) b!606947))

(assert (= (and b!606947 c!68897) b!606948))

(assert (= (and b!606947 (not c!68897)) b!606949))

(assert (= (and b!606949 c!68898) b!606950))

(assert (= (and b!606949 (not c!68898)) b!606951))

(declare-fun m!584033 () Bool)

(assert (=> b!606951 m!584033))

(assert (=> b!606951 m!584033))

(declare-fun m!584035 () Bool)

(assert (=> b!606951 m!584035))

(declare-fun m!584037 () Bool)

(assert (=> d!88045 m!584037))

(declare-fun m!584039 () Bool)

(assert (=> d!88045 m!584039))

(assert (=> d!88045 m!583939))

(assert (=> d!88045 m!583781))

(assert (=> b!606669 d!88045))

(declare-fun b!606953 () Bool)

(declare-fun e!347545 () SeekEntryResult!6274)

(declare-fun e!347544 () SeekEntryResult!6274)

(assert (=> b!606953 (= e!347545 e!347544)))

(declare-fun lt!277038 () (_ BitVec 64))

(declare-fun c!68900 () Bool)

(assert (=> b!606953 (= c!68900 (= lt!277038 (select (arr!17878 a!2986) j!136)))))

(declare-fun b!606954 () Bool)

(assert (=> b!606954 (= e!347544 (Found!6274 lt!276882))))

(declare-fun b!606955 () Bool)

(declare-fun c!68901 () Bool)

(assert (=> b!606955 (= c!68901 (= lt!277038 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347543 () SeekEntryResult!6274)

(assert (=> b!606955 (= e!347544 e!347543)))

(declare-fun b!606956 () Bool)

(assert (=> b!606956 (= e!347543 (MissingVacant!6274 vacantSpotIndex!68))))

(declare-fun b!606957 () Bool)

(assert (=> b!606957 (= e!347543 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276882 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17878 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!606958 () Bool)

(assert (=> b!606958 (= e!347545 Undefined!6274)))

(declare-fun lt!277039 () SeekEntryResult!6274)

(declare-fun d!88065 () Bool)

(assert (=> d!88065 (and (or ((_ is Undefined!6274) lt!277039) (not ((_ is Found!6274) lt!277039)) (and (bvsge (index!27369 lt!277039) #b00000000000000000000000000000000) (bvslt (index!27369 lt!277039) (size!18242 a!2986)))) (or ((_ is Undefined!6274) lt!277039) ((_ is Found!6274) lt!277039) (not ((_ is MissingVacant!6274) lt!277039)) (not (= (index!27371 lt!277039) vacantSpotIndex!68)) (and (bvsge (index!27371 lt!277039) #b00000000000000000000000000000000) (bvslt (index!27371 lt!277039) (size!18242 a!2986)))) (or ((_ is Undefined!6274) lt!277039) (ite ((_ is Found!6274) lt!277039) (= (select (arr!17878 a!2986) (index!27369 lt!277039)) (select (arr!17878 a!2986) j!136)) (and ((_ is MissingVacant!6274) lt!277039) (= (index!27371 lt!277039) vacantSpotIndex!68) (= (select (arr!17878 a!2986) (index!27371 lt!277039)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88065 (= lt!277039 e!347545)))

(declare-fun c!68902 () Bool)

(assert (=> d!88065 (= c!68902 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!88065 (= lt!277038 (select (arr!17878 a!2986) lt!276882))))

(assert (=> d!88065 (validMask!0 mask!3053)))

(assert (=> d!88065 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276882 vacantSpotIndex!68 (select (arr!17878 a!2986) j!136) a!2986 mask!3053) lt!277039)))

(assert (= (and d!88065 c!68902) b!606958))

(assert (= (and d!88065 (not c!68902)) b!606953))

(assert (= (and b!606953 c!68900) b!606954))

(assert (= (and b!606953 (not c!68900)) b!606955))

(assert (= (and b!606955 c!68901) b!606956))

(assert (= (and b!606955 (not c!68901)) b!606957))

(declare-fun m!584041 () Bool)

(assert (=> b!606957 m!584041))

(assert (=> b!606957 m!584041))

(assert (=> b!606957 m!583717))

(declare-fun m!584043 () Bool)

(assert (=> b!606957 m!584043))

(declare-fun m!584045 () Bool)

(assert (=> d!88065 m!584045))

(declare-fun m!584047 () Bool)

(assert (=> d!88065 m!584047))

(declare-fun m!584049 () Bool)

(assert (=> d!88065 m!584049))

(assert (=> d!88065 m!583781))

(assert (=> b!606669 d!88065))

(declare-fun d!88067 () Bool)

(declare-fun e!347565 () Bool)

(assert (=> d!88067 e!347565))

(declare-fun res!389909 () Bool)

(assert (=> d!88067 (=> (not res!389909) (not e!347565))))

(assert (=> d!88067 (= res!389909 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18242 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18242 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18242 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18242 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18242 a!2986))))))

(declare-fun lt!277048 () Unit!19297)

(declare-fun choose!9 (array!37257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19297)

(assert (=> d!88067 (= lt!277048 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276882 vacantSpotIndex!68 mask!3053))))

(assert (=> d!88067 (validMask!0 mask!3053)))

(assert (=> d!88067 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276882 vacantSpotIndex!68 mask!3053) lt!277048)))

(declare-fun b!606978 () Bool)

(assert (=> b!606978 (= e!347565 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276882 vacantSpotIndex!68 (select (arr!17878 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276882 vacantSpotIndex!68 (select (store (arr!17878 a!2986) i!1108 k0!1786) j!136) (array!37258 (store (arr!17878 a!2986) i!1108 k0!1786) (size!18242 a!2986)) mask!3053)))))

(assert (= (and d!88067 res!389909) b!606978))

(declare-fun m!584069 () Bool)

(assert (=> d!88067 m!584069))

(assert (=> d!88067 m!583781))

(assert (=> b!606978 m!583717))

(assert (=> b!606978 m!583735))

(assert (=> b!606978 m!583717))

(assert (=> b!606978 m!583727))

(assert (=> b!606978 m!583729))

(assert (=> b!606978 m!583727))

(declare-fun m!584071 () Bool)

(assert (=> b!606978 m!584071))

(assert (=> b!606669 d!88067))

(declare-fun b!606979 () Bool)

(declare-fun e!347568 () SeekEntryResult!6274)

(declare-fun e!347567 () SeekEntryResult!6274)

(assert (=> b!606979 (= e!347568 e!347567)))

(declare-fun c!68903 () Bool)

(declare-fun lt!277049 () (_ BitVec 64))

(assert (=> b!606979 (= c!68903 (= lt!277049 lt!276886))))

(declare-fun b!606980 () Bool)

(assert (=> b!606980 (= e!347567 (Found!6274 lt!276882))))

(declare-fun b!606981 () Bool)

(declare-fun c!68904 () Bool)

(assert (=> b!606981 (= c!68904 (= lt!277049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347566 () SeekEntryResult!6274)

(assert (=> b!606981 (= e!347567 e!347566)))

(declare-fun b!606982 () Bool)

(assert (=> b!606982 (= e!347566 (MissingVacant!6274 vacantSpotIndex!68))))

(declare-fun b!606983 () Bool)

(assert (=> b!606983 (= e!347566 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276882 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!276886 lt!276883 mask!3053))))

(declare-fun b!606984 () Bool)

(assert (=> b!606984 (= e!347568 Undefined!6274)))

(declare-fun d!88081 () Bool)

(declare-fun lt!277050 () SeekEntryResult!6274)

(assert (=> d!88081 (and (or ((_ is Undefined!6274) lt!277050) (not ((_ is Found!6274) lt!277050)) (and (bvsge (index!27369 lt!277050) #b00000000000000000000000000000000) (bvslt (index!27369 lt!277050) (size!18242 lt!276883)))) (or ((_ is Undefined!6274) lt!277050) ((_ is Found!6274) lt!277050) (not ((_ is MissingVacant!6274) lt!277050)) (not (= (index!27371 lt!277050) vacantSpotIndex!68)) (and (bvsge (index!27371 lt!277050) #b00000000000000000000000000000000) (bvslt (index!27371 lt!277050) (size!18242 lt!276883)))) (or ((_ is Undefined!6274) lt!277050) (ite ((_ is Found!6274) lt!277050) (= (select (arr!17878 lt!276883) (index!27369 lt!277050)) lt!276886) (and ((_ is MissingVacant!6274) lt!277050) (= (index!27371 lt!277050) vacantSpotIndex!68) (= (select (arr!17878 lt!276883) (index!27371 lt!277050)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88081 (= lt!277050 e!347568)))

(declare-fun c!68905 () Bool)

(assert (=> d!88081 (= c!68905 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!88081 (= lt!277049 (select (arr!17878 lt!276883) lt!276882))))

(assert (=> d!88081 (validMask!0 mask!3053)))

(assert (=> d!88081 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276882 vacantSpotIndex!68 lt!276886 lt!276883 mask!3053) lt!277050)))

(assert (= (and d!88081 c!68905) b!606984))

(assert (= (and d!88081 (not c!68905)) b!606979))

(assert (= (and b!606979 c!68903) b!606980))

(assert (= (and b!606979 (not c!68903)) b!606981))

(assert (= (and b!606981 c!68904) b!606982))

(assert (= (and b!606981 (not c!68904)) b!606983))

(assert (=> b!606983 m!584041))

(assert (=> b!606983 m!584041))

(declare-fun m!584073 () Bool)

(assert (=> b!606983 m!584073))

(declare-fun m!584075 () Bool)

(assert (=> d!88081 m!584075))

(declare-fun m!584077 () Bool)

(assert (=> d!88081 m!584077))

(declare-fun m!584079 () Bool)

(assert (=> d!88081 m!584079))

(assert (=> d!88081 m!583781))

(assert (=> b!606669 d!88081))

(declare-fun d!88083 () Bool)

(declare-fun lt!277053 () (_ BitVec 32))

(assert (=> d!88083 (and (bvsge lt!277053 #b00000000000000000000000000000000) (bvslt lt!277053 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88083 (= lt!277053 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!88083 (validMask!0 mask!3053)))

(assert (=> d!88083 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!277053)))

(declare-fun bs!18581 () Bool)

(assert (= bs!18581 d!88083))

(declare-fun m!584081 () Bool)

(assert (=> bs!18581 m!584081))

(assert (=> bs!18581 m!583781))

(assert (=> b!606669 d!88083))

(declare-fun d!88085 () Bool)

(assert (=> d!88085 (= (validKeyInArray!0 (select (arr!17878 a!2986) j!136)) (and (not (= (select (arr!17878 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17878 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!606658 d!88085))

(declare-fun d!88087 () Bool)

(declare-fun lt!277054 () Bool)

(assert (=> d!88087 (= lt!277054 (select (content!237 Nil!11823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347570 () Bool)

(assert (=> d!88087 (= lt!277054 e!347570)))

(declare-fun res!389911 () Bool)

(assert (=> d!88087 (=> (not res!389911) (not e!347570))))

(assert (=> d!88087 (= res!389911 ((_ is Cons!11822) Nil!11823))))

(assert (=> d!88087 (= (contains!2976 Nil!11823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!277054)))

(declare-fun b!606985 () Bool)

(declare-fun e!347569 () Bool)

(assert (=> b!606985 (= e!347570 e!347569)))

(declare-fun res!389910 () Bool)

(assert (=> b!606985 (=> res!389910 e!347569)))

(assert (=> b!606985 (= res!389910 (= (h!12870 Nil!11823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!606986 () Bool)

(assert (=> b!606986 (= e!347569 (contains!2976 (t!18046 Nil!11823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!88087 res!389911) b!606985))

(assert (= (and b!606985 (not res!389910)) b!606986))

(assert (=> d!88087 m!583993))

(declare-fun m!584083 () Bool)

(assert (=> d!88087 m!584083))

(declare-fun m!584085 () Bool)

(assert (=> b!606986 m!584085))

(assert (=> b!606659 d!88087))

(declare-fun b!607037 () Bool)

(declare-fun e!347600 () Bool)

(declare-fun call!33101 () Bool)

(assert (=> b!607037 (= e!347600 call!33101)))

(declare-fun b!607038 () Bool)

(declare-fun e!347598 () Bool)

(assert (=> b!607038 (= e!347598 e!347600)))

(declare-fun c!68929 () Bool)

(assert (=> b!607038 (= c!68929 (validKeyInArray!0 (select (arr!17878 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33098 () Bool)

(assert (=> bm!33098 (= call!33101 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!607039 () Bool)

(declare-fun e!347599 () Bool)

(assert (=> b!607039 (= e!347600 e!347599)))

(declare-fun lt!277075 () (_ BitVec 64))

(assert (=> b!607039 (= lt!277075 (select (arr!17878 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!277076 () Unit!19297)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37257 (_ BitVec 64) (_ BitVec 32)) Unit!19297)

(assert (=> b!607039 (= lt!277076 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!277075 #b00000000000000000000000000000000))))

(assert (=> b!607039 (arrayContainsKey!0 a!2986 lt!277075 #b00000000000000000000000000000000)))

(declare-fun lt!277077 () Unit!19297)

(assert (=> b!607039 (= lt!277077 lt!277076)))

(declare-fun res!389917 () Bool)

(assert (=> b!607039 (= res!389917 (= (seekEntryOrOpen!0 (select (arr!17878 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6274 #b00000000000000000000000000000000)))))

(assert (=> b!607039 (=> (not res!389917) (not e!347599))))

(declare-fun d!88089 () Bool)

(declare-fun res!389916 () Bool)

(assert (=> d!88089 (=> res!389916 e!347598)))

(assert (=> d!88089 (= res!389916 (bvsge #b00000000000000000000000000000000 (size!18242 a!2986)))))

(assert (=> d!88089 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!347598)))

(declare-fun b!607040 () Bool)

(assert (=> b!607040 (= e!347599 call!33101)))

(assert (= (and d!88089 (not res!389916)) b!607038))

(assert (= (and b!607038 c!68929) b!607039))

(assert (= (and b!607038 (not c!68929)) b!607037))

(assert (= (and b!607039 res!389917) b!607040))

(assert (= (or b!607040 b!607037) bm!33098))

(assert (=> b!607038 m!583947))

(assert (=> b!607038 m!583947))

(assert (=> b!607038 m!583951))

(declare-fun m!584113 () Bool)

(assert (=> bm!33098 m!584113))

(assert (=> b!607039 m!583947))

(declare-fun m!584115 () Bool)

(assert (=> b!607039 m!584115))

(declare-fun m!584117 () Bool)

(assert (=> b!607039 m!584117))

(assert (=> b!607039 m!583947))

(declare-fun m!584119 () Bool)

(assert (=> b!607039 m!584119))

(assert (=> b!606670 d!88089))

(declare-fun d!88097 () Bool)

(declare-fun res!389918 () Bool)

(declare-fun e!347601 () Bool)

(assert (=> d!88097 (=> res!389918 e!347601)))

(assert (=> d!88097 (= res!389918 (= (select (arr!17878 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88097 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!347601)))

(declare-fun b!607041 () Bool)

(declare-fun e!347602 () Bool)

(assert (=> b!607041 (= e!347601 e!347602)))

(declare-fun res!389919 () Bool)

(assert (=> b!607041 (=> (not res!389919) (not e!347602))))

(assert (=> b!607041 (= res!389919 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18242 a!2986)))))

(declare-fun b!607042 () Bool)

(assert (=> b!607042 (= e!347602 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88097 (not res!389918)) b!607041))

(assert (= (and b!607041 res!389919) b!607042))

(assert (=> d!88097 m!583947))

(declare-fun m!584123 () Bool)

(assert (=> b!607042 m!584123))

(assert (=> b!606661 d!88097))

(declare-fun d!88101 () Bool)

(assert (=> d!88101 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55488 d!88101))

(declare-fun d!88113 () Bool)

(assert (=> d!88113 (= (array_inv!13737 a!2986) (bvsge (size!18242 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55488 d!88113))

(declare-fun b!607075 () Bool)

(declare-fun e!347629 () SeekEntryResult!6274)

(declare-fun e!347628 () SeekEntryResult!6274)

(assert (=> b!607075 (= e!347629 e!347628)))

(declare-fun c!68938 () Bool)

(declare-fun lt!277086 () (_ BitVec 64))

(assert (=> b!607075 (= c!68938 (= lt!277086 (select (arr!17878 a!2986) j!136)))))

(declare-fun b!607076 () Bool)

(assert (=> b!607076 (= e!347628 (Found!6274 index!984))))

(declare-fun b!607077 () Bool)

(declare-fun c!68939 () Bool)

(assert (=> b!607077 (= c!68939 (= lt!277086 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!347627 () SeekEntryResult!6274)

(assert (=> b!607077 (= e!347628 e!347627)))

(declare-fun b!607078 () Bool)

(assert (=> b!607078 (= e!347627 (MissingVacant!6274 vacantSpotIndex!68))))

(declare-fun b!607079 () Bool)

(assert (=> b!607079 (= e!347627 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17878 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!607080 () Bool)

(assert (=> b!607080 (= e!347629 Undefined!6274)))

(declare-fun lt!277087 () SeekEntryResult!6274)

(declare-fun d!88115 () Bool)

(assert (=> d!88115 (and (or ((_ is Undefined!6274) lt!277087) (not ((_ is Found!6274) lt!277087)) (and (bvsge (index!27369 lt!277087) #b00000000000000000000000000000000) (bvslt (index!27369 lt!277087) (size!18242 a!2986)))) (or ((_ is Undefined!6274) lt!277087) ((_ is Found!6274) lt!277087) (not ((_ is MissingVacant!6274) lt!277087)) (not (= (index!27371 lt!277087) vacantSpotIndex!68)) (and (bvsge (index!27371 lt!277087) #b00000000000000000000000000000000) (bvslt (index!27371 lt!277087) (size!18242 a!2986)))) (or ((_ is Undefined!6274) lt!277087) (ite ((_ is Found!6274) lt!277087) (= (select (arr!17878 a!2986) (index!27369 lt!277087)) (select (arr!17878 a!2986) j!136)) (and ((_ is MissingVacant!6274) lt!277087) (= (index!27371 lt!277087) vacantSpotIndex!68) (= (select (arr!17878 a!2986) (index!27371 lt!277087)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88115 (= lt!277087 e!347629)))

(declare-fun c!68940 () Bool)

(assert (=> d!88115 (= c!68940 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88115 (= lt!277086 (select (arr!17878 a!2986) index!984))))

(assert (=> d!88115 (validMask!0 mask!3053)))

(assert (=> d!88115 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17878 a!2986) j!136) a!2986 mask!3053) lt!277087)))

(assert (= (and d!88115 c!68940) b!607080))

(assert (= (and d!88115 (not c!68940)) b!607075))

(assert (= (and b!607075 c!68938) b!607076))

(assert (= (and b!607075 (not c!68938)) b!607077))

(assert (= (and b!607077 c!68939) b!607078))

(assert (= (and b!607077 (not c!68939)) b!607079))

(assert (=> b!607079 m!584033))

(assert (=> b!607079 m!584033))

(assert (=> b!607079 m!583717))

(declare-fun m!584151 () Bool)

(assert (=> b!607079 m!584151))

(declare-fun m!584153 () Bool)

(assert (=> d!88115 m!584153))

(declare-fun m!584155 () Bool)

(assert (=> d!88115 m!584155))

(assert (=> d!88115 m!583773))

(assert (=> d!88115 m!583781))

(assert (=> b!606673 d!88115))

(assert (=> b!606662 d!88015))

(check-sat (not bm!33098) (not b!607039) (not b!606882) (not b!606856) (not b!606875) (not b!606881) (not b!606877) (not bm!33090) (not bm!33092) (not b!607079) (not b!606880) (not b!606986) (not d!88081) (not b!606957) (not d!88027) (not b!606887) (not d!88013) (not b!606886) (not d!88033) (not d!88067) (not d!88031) (not d!88039) (not d!88043) (not b!606876) (not d!88083) (not b!606951) (not b!606896) (not b!606885) (not b!606894) (not d!88115) (not b!607042) (not d!88045) (not b!606861) (not b!606983) (not b!606978) (not b!607038) (not b!606902) (not b!606889) (not d!88035) (not d!88087) (not b!606892) (not bm!33091) (not b!606845) (not d!88065) (not b!606862))
(check-sat)
