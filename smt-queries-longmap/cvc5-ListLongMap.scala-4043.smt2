; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55132 () Bool)

(assert start!55132)

(declare-fun b!603755 () Bool)

(declare-fun e!345416 () Bool)

(declare-fun e!345415 () Bool)

(assert (=> b!603755 (= e!345416 (not e!345415))))

(declare-fun res!387809 () Bool)

(assert (=> b!603755 (=> res!387809 e!345415)))

(declare-datatypes ((SeekEntryResult!6299 0))(
  ( (MissingZero!6299 (index!27459 (_ BitVec 32))) (Found!6299 (index!27460 (_ BitVec 32))) (Intermediate!6299 (undefined!7111 Bool) (index!27461 (_ BitVec 32)) (x!56260 (_ BitVec 32))) (Undefined!6299) (MissingVacant!6299 (index!27462 (_ BitVec 32))) )
))
(declare-fun lt!275204 () SeekEntryResult!6299)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!603755 (= res!387809 (not (= lt!275204 (Found!6299 index!984))))))

(declare-datatypes ((Unit!19174 0))(
  ( (Unit!19175) )
))
(declare-fun lt!275201 () Unit!19174)

(declare-fun e!345418 () Unit!19174)

(assert (=> b!603755 (= lt!275201 e!345418)))

(declare-fun c!68348 () Bool)

(assert (=> b!603755 (= c!68348 (= lt!275204 Undefined!6299))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37205 0))(
  ( (array!37206 (arr!17859 (Array (_ BitVec 32) (_ BitVec 64))) (size!18223 (_ BitVec 32))) )
))
(declare-fun lt!275205 () array!37205)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!275200 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37205 (_ BitVec 32)) SeekEntryResult!6299)

(assert (=> b!603755 (= lt!275204 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275200 lt!275205 mask!3053))))

(declare-fun e!345414 () Bool)

(assert (=> b!603755 e!345414))

(declare-fun res!387803 () Bool)

(assert (=> b!603755 (=> (not res!387803) (not e!345414))))

(declare-fun lt!275208 () (_ BitVec 32))

(declare-fun lt!275210 () SeekEntryResult!6299)

(assert (=> b!603755 (= res!387803 (= lt!275210 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275208 vacantSpotIndex!68 lt!275200 lt!275205 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37205)

(assert (=> b!603755 (= lt!275210 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275208 vacantSpotIndex!68 (select (arr!17859 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!603755 (= lt!275200 (select (store (arr!17859 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!275206 () Unit!19174)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37205 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19174)

(assert (=> b!603755 (= lt!275206 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275208 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603755 (= lt!275208 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!603756 () Bool)

(declare-fun res!387805 () Bool)

(declare-fun e!345412 () Bool)

(assert (=> b!603756 (=> (not res!387805) (not e!345412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603756 (= res!387805 (validKeyInArray!0 (select (arr!17859 a!2986) j!136)))))

(declare-fun b!603757 () Bool)

(declare-fun e!345417 () Bool)

(declare-fun e!345406 () Bool)

(assert (=> b!603757 (= e!345417 e!345406)))

(declare-fun res!387800 () Bool)

(assert (=> b!603757 (=> res!387800 e!345406)))

(assert (=> b!603757 (= res!387800 (bvsge index!984 j!136))))

(declare-fun lt!275209 () Unit!19174)

(declare-fun e!345411 () Unit!19174)

(assert (=> b!603757 (= lt!275209 e!345411)))

(declare-fun c!68347 () Bool)

(assert (=> b!603757 (= c!68347 (bvslt j!136 index!984))))

(declare-fun b!603758 () Bool)

(declare-fun e!345413 () Bool)

(declare-fun e!345407 () Bool)

(assert (=> b!603758 (= e!345413 e!345407)))

(declare-fun res!387811 () Bool)

(assert (=> b!603758 (=> res!387811 e!345407)))

(declare-fun lt!275212 () (_ BitVec 64))

(assert (=> b!603758 (= res!387811 (or (not (= (select (arr!17859 a!2986) j!136) lt!275200)) (not (= (select (arr!17859 a!2986) j!136) lt!275212)) (bvsge j!136 index!984)))))

(declare-fun b!603759 () Bool)

(declare-fun Unit!19176 () Unit!19174)

(assert (=> b!603759 (= e!345411 Unit!19176)))

(declare-fun lt!275198 () Unit!19174)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37205 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19174)

(assert (=> b!603759 (= lt!275198 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275205 (select (arr!17859 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603759 (arrayContainsKey!0 lt!275205 (select (arr!17859 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275203 () Unit!19174)

(declare-datatypes ((List!11900 0))(
  ( (Nil!11897) (Cons!11896 (h!12941 (_ BitVec 64)) (t!18128 List!11900)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37205 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11900) Unit!19174)

(assert (=> b!603759 (= lt!275203 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11897))))

(declare-fun arrayNoDuplicates!0 (array!37205 (_ BitVec 32) List!11900) Bool)

(assert (=> b!603759 (arrayNoDuplicates!0 lt!275205 #b00000000000000000000000000000000 Nil!11897)))

(declare-fun lt!275199 () Unit!19174)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37205 (_ BitVec 32) (_ BitVec 32)) Unit!19174)

(assert (=> b!603759 (= lt!275199 (lemmaNoDuplicateFromThenFromBigger!0 lt!275205 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603759 (arrayNoDuplicates!0 lt!275205 j!136 Nil!11897)))

(declare-fun lt!275207 () Unit!19174)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37205 (_ BitVec 64) (_ BitVec 32) List!11900) Unit!19174)

(assert (=> b!603759 (= lt!275207 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275205 (select (arr!17859 a!2986) j!136) j!136 Nil!11897))))

(assert (=> b!603759 false))

(declare-fun b!603754 () Bool)

(declare-fun e!345408 () Bool)

(assert (=> b!603754 (= e!345408 e!345416)))

(declare-fun res!387797 () Bool)

(assert (=> b!603754 (=> (not res!387797) (not e!345416))))

(declare-fun lt!275211 () SeekEntryResult!6299)

(assert (=> b!603754 (= res!387797 (and (= lt!275211 (Found!6299 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17859 a!2986) index!984) (select (arr!17859 a!2986) j!136))) (not (= (select (arr!17859 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!603754 (= lt!275211 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17859 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!387799 () Bool)

(assert (=> start!55132 (=> (not res!387799) (not e!345412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55132 (= res!387799 (validMask!0 mask!3053))))

(assert (=> start!55132 e!345412))

(assert (=> start!55132 true))

(declare-fun array_inv!13655 (array!37205) Bool)

(assert (=> start!55132 (array_inv!13655 a!2986)))

(declare-fun b!603760 () Bool)

(declare-fun e!345419 () Bool)

(assert (=> b!603760 (= e!345419 (arrayContainsKey!0 lt!275205 (select (arr!17859 a!2986) j!136) index!984))))

(declare-fun b!603761 () Bool)

(declare-fun e!345420 () Bool)

(assert (=> b!603761 (= e!345412 e!345420)))

(declare-fun res!387795 () Bool)

(assert (=> b!603761 (=> (not res!387795) (not e!345420))))

(declare-fun lt!275202 () SeekEntryResult!6299)

(assert (=> b!603761 (= res!387795 (or (= lt!275202 (MissingZero!6299 i!1108)) (= lt!275202 (MissingVacant!6299 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37205 (_ BitVec 32)) SeekEntryResult!6299)

(assert (=> b!603761 (= lt!275202 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!603762 () Bool)

(declare-fun res!387801 () Bool)

(assert (=> b!603762 (=> (not res!387801) (not e!345412))))

(assert (=> b!603762 (= res!387801 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603763 () Bool)

(declare-fun Unit!19177 () Unit!19174)

(assert (=> b!603763 (= e!345418 Unit!19177)))

(assert (=> b!603763 false))

(declare-fun b!603764 () Bool)

(declare-fun res!387808 () Bool)

(assert (=> b!603764 (=> (not res!387808) (not e!345412))))

(assert (=> b!603764 (= res!387808 (validKeyInArray!0 k!1786))))

(declare-fun b!603765 () Bool)

(declare-fun res!387796 () Bool)

(assert (=> b!603765 (=> (not res!387796) (not e!345420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37205 (_ BitVec 32)) Bool)

(assert (=> b!603765 (= res!387796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603766 () Bool)

(assert (=> b!603766 (= e!345420 e!345408)))

(declare-fun res!387810 () Bool)

(assert (=> b!603766 (=> (not res!387810) (not e!345408))))

(assert (=> b!603766 (= res!387810 (= (select (store (arr!17859 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603766 (= lt!275205 (array!37206 (store (arr!17859 a!2986) i!1108 k!1786) (size!18223 a!2986)))))

(declare-fun b!603767 () Bool)

(declare-fun res!387806 () Bool)

(assert (=> b!603767 (=> (not res!387806) (not e!345420))))

(assert (=> b!603767 (= res!387806 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11897))))

(declare-fun b!603768 () Bool)

(assert (=> b!603768 (= e!345415 e!345417)))

(declare-fun res!387812 () Bool)

(assert (=> b!603768 (=> res!387812 e!345417)))

(assert (=> b!603768 (= res!387812 (or (not (= (select (arr!17859 a!2986) j!136) lt!275200)) (not (= (select (arr!17859 a!2986) j!136) lt!275212))))))

(assert (=> b!603768 e!345413))

(declare-fun res!387802 () Bool)

(assert (=> b!603768 (=> (not res!387802) (not e!345413))))

(assert (=> b!603768 (= res!387802 (= lt!275212 (select (arr!17859 a!2986) j!136)))))

(assert (=> b!603768 (= lt!275212 (select (store (arr!17859 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!603769 () Bool)

(assert (=> b!603769 (= e!345414 (= lt!275211 lt!275210))))

(declare-fun b!603770 () Bool)

(assert (=> b!603770 (= e!345407 e!345419)))

(declare-fun res!387794 () Bool)

(assert (=> b!603770 (=> (not res!387794) (not e!345419))))

(assert (=> b!603770 (= res!387794 (arrayContainsKey!0 lt!275205 (select (arr!17859 a!2986) j!136) j!136))))

(declare-fun b!603771 () Bool)

(assert (=> b!603771 (= e!345406 true)))

(declare-fun e!345410 () Bool)

(assert (=> b!603771 e!345410))

(declare-fun res!387807 () Bool)

(assert (=> b!603771 (=> (not res!387807) (not e!345410))))

(assert (=> b!603771 (= res!387807 (arrayContainsKey!0 lt!275205 (select (arr!17859 a!2986) j!136) j!136))))

(declare-fun b!603772 () Bool)

(declare-fun res!387798 () Bool)

(assert (=> b!603772 (=> (not res!387798) (not e!345420))))

(assert (=> b!603772 (= res!387798 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17859 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603773 () Bool)

(declare-fun Unit!19178 () Unit!19174)

(assert (=> b!603773 (= e!345411 Unit!19178)))

(declare-fun b!603774 () Bool)

(assert (=> b!603774 (= e!345410 (arrayContainsKey!0 lt!275205 (select (arr!17859 a!2986) j!136) index!984))))

(declare-fun b!603775 () Bool)

(declare-fun Unit!19179 () Unit!19174)

(assert (=> b!603775 (= e!345418 Unit!19179)))

(declare-fun b!603776 () Bool)

(declare-fun res!387804 () Bool)

(assert (=> b!603776 (=> (not res!387804) (not e!345412))))

(assert (=> b!603776 (= res!387804 (and (= (size!18223 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18223 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18223 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!55132 res!387799) b!603776))

(assert (= (and b!603776 res!387804) b!603756))

(assert (= (and b!603756 res!387805) b!603764))

(assert (= (and b!603764 res!387808) b!603762))

(assert (= (and b!603762 res!387801) b!603761))

(assert (= (and b!603761 res!387795) b!603765))

(assert (= (and b!603765 res!387796) b!603767))

(assert (= (and b!603767 res!387806) b!603772))

(assert (= (and b!603772 res!387798) b!603766))

(assert (= (and b!603766 res!387810) b!603754))

(assert (= (and b!603754 res!387797) b!603755))

(assert (= (and b!603755 res!387803) b!603769))

(assert (= (and b!603755 c!68348) b!603763))

(assert (= (and b!603755 (not c!68348)) b!603775))

(assert (= (and b!603755 (not res!387809)) b!603768))

(assert (= (and b!603768 res!387802) b!603758))

(assert (= (and b!603758 (not res!387811)) b!603770))

(assert (= (and b!603770 res!387794) b!603760))

(assert (= (and b!603768 (not res!387812)) b!603757))

(assert (= (and b!603757 c!68347) b!603759))

(assert (= (and b!603757 (not c!68347)) b!603773))

(assert (= (and b!603757 (not res!387800)) b!603771))

(assert (= (and b!603771 res!387807) b!603774))

(declare-fun m!580733 () Bool)

(assert (=> b!603755 m!580733))

(declare-fun m!580735 () Bool)

(assert (=> b!603755 m!580735))

(declare-fun m!580737 () Bool)

(assert (=> b!603755 m!580737))

(declare-fun m!580739 () Bool)

(assert (=> b!603755 m!580739))

(declare-fun m!580741 () Bool)

(assert (=> b!603755 m!580741))

(declare-fun m!580743 () Bool)

(assert (=> b!603755 m!580743))

(declare-fun m!580745 () Bool)

(assert (=> b!603755 m!580745))

(assert (=> b!603755 m!580743))

(declare-fun m!580747 () Bool)

(assert (=> b!603755 m!580747))

(assert (=> b!603766 m!580737))

(declare-fun m!580749 () Bool)

(assert (=> b!603766 m!580749))

(declare-fun m!580751 () Bool)

(assert (=> b!603754 m!580751))

(assert (=> b!603754 m!580743))

(assert (=> b!603754 m!580743))

(declare-fun m!580753 () Bool)

(assert (=> b!603754 m!580753))

(declare-fun m!580755 () Bool)

(assert (=> b!603765 m!580755))

(assert (=> b!603774 m!580743))

(assert (=> b!603774 m!580743))

(declare-fun m!580757 () Bool)

(assert (=> b!603774 m!580757))

(declare-fun m!580759 () Bool)

(assert (=> b!603761 m!580759))

(declare-fun m!580761 () Bool)

(assert (=> b!603759 m!580761))

(assert (=> b!603759 m!580743))

(assert (=> b!603759 m!580743))

(declare-fun m!580763 () Bool)

(assert (=> b!603759 m!580763))

(assert (=> b!603759 m!580743))

(declare-fun m!580765 () Bool)

(assert (=> b!603759 m!580765))

(assert (=> b!603759 m!580743))

(declare-fun m!580767 () Bool)

(assert (=> b!603759 m!580767))

(declare-fun m!580769 () Bool)

(assert (=> b!603759 m!580769))

(declare-fun m!580771 () Bool)

(assert (=> b!603759 m!580771))

(declare-fun m!580773 () Bool)

(assert (=> b!603759 m!580773))

(declare-fun m!580775 () Bool)

(assert (=> b!603764 m!580775))

(assert (=> b!603758 m!580743))

(assert (=> b!603771 m!580743))

(assert (=> b!603771 m!580743))

(declare-fun m!580777 () Bool)

(assert (=> b!603771 m!580777))

(assert (=> b!603760 m!580743))

(assert (=> b!603760 m!580743))

(assert (=> b!603760 m!580757))

(assert (=> b!603756 m!580743))

(assert (=> b!603756 m!580743))

(declare-fun m!580779 () Bool)

(assert (=> b!603756 m!580779))

(declare-fun m!580781 () Bool)

(assert (=> b!603767 m!580781))

(declare-fun m!580783 () Bool)

(assert (=> start!55132 m!580783))

(declare-fun m!580785 () Bool)

(assert (=> start!55132 m!580785))

(assert (=> b!603770 m!580743))

(assert (=> b!603770 m!580743))

(assert (=> b!603770 m!580777))

(declare-fun m!580787 () Bool)

(assert (=> b!603772 m!580787))

(assert (=> b!603768 m!580743))

(assert (=> b!603768 m!580737))

(declare-fun m!580789 () Bool)

(assert (=> b!603768 m!580789))

(declare-fun m!580791 () Bool)

(assert (=> b!603762 m!580791))

(push 1)

