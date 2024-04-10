; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58322 () Bool)

(assert start!58322)

(declare-fun b!643867 () Bool)

(declare-fun e!368857 () Bool)

(declare-fun e!368862 () Bool)

(assert (=> b!643867 (= e!368857 e!368862)))

(declare-fun res!417041 () Bool)

(assert (=> b!643867 (=> (not res!417041) (not e!368862))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38419 0))(
  ( (array!38420 (arr!18423 (Array (_ BitVec 32) (_ BitVec 64))) (size!18787 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38419)

(assert (=> b!643867 (= res!417041 (= (select (store (arr!18423 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!298330 () array!38419)

(assert (=> b!643867 (= lt!298330 (array!38420 (store (arr!18423 a!2986) i!1108 k!1786) (size!18787 a!2986)))))

(declare-fun b!643868 () Bool)

(declare-fun e!368854 () Bool)

(assert (=> b!643868 (= e!368862 e!368854)))

(declare-fun res!417052 () Bool)

(assert (=> b!643868 (=> (not res!417052) (not e!368854))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6863 0))(
  ( (MissingZero!6863 (index!29784 (_ BitVec 32))) (Found!6863 (index!29785 (_ BitVec 32))) (Intermediate!6863 (undefined!7675 Bool) (index!29786 (_ BitVec 32)) (x!58559 (_ BitVec 32))) (Undefined!6863) (MissingVacant!6863 (index!29787 (_ BitVec 32))) )
))
(declare-fun lt!298333 () SeekEntryResult!6863)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!643868 (= res!417052 (and (= lt!298333 (Found!6863 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18423 a!2986) index!984) (select (arr!18423 a!2986) j!136))) (not (= (select (arr!18423 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38419 (_ BitVec 32)) SeekEntryResult!6863)

(assert (=> b!643868 (= lt!298333 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18423 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643869 () Bool)

(declare-fun e!368861 () Bool)

(declare-fun e!368859 () Bool)

(assert (=> b!643869 (= e!368861 e!368859)))

(declare-fun res!417035 () Bool)

(assert (=> b!643869 (=> (not res!417035) (not e!368859))))

(declare-fun arrayContainsKey!0 (array!38419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!643869 (= res!417035 (arrayContainsKey!0 lt!298330 (select (arr!18423 a!2986) j!136) j!136))))

(declare-fun b!643870 () Bool)

(declare-fun e!368860 () Bool)

(assert (=> b!643870 (= e!368860 (arrayContainsKey!0 lt!298330 (select (arr!18423 a!2986) j!136) index!984))))

(declare-fun b!643871 () Bool)

(declare-fun res!417042 () Bool)

(assert (=> b!643871 (=> (not res!417042) (not e!368857))))

(declare-datatypes ((List!12464 0))(
  ( (Nil!12461) (Cons!12460 (h!13505 (_ BitVec 64)) (t!18692 List!12464)) )
))
(declare-fun arrayNoDuplicates!0 (array!38419 (_ BitVec 32) List!12464) Bool)

(assert (=> b!643871 (= res!417042 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12461))))

(declare-fun b!643872 () Bool)

(assert (=> b!643872 (= e!368859 (arrayContainsKey!0 lt!298330 (select (arr!18423 a!2986) j!136) index!984))))

(declare-fun b!643873 () Bool)

(declare-fun e!368856 () Bool)

(declare-fun e!368853 () Bool)

(assert (=> b!643873 (= e!368856 e!368853)))

(declare-fun res!417045 () Bool)

(assert (=> b!643873 (=> res!417045 e!368853)))

(declare-fun lt!298328 () (_ BitVec 64))

(declare-fun lt!298338 () (_ BitVec 64))

(assert (=> b!643873 (= res!417045 (or (not (= (select (arr!18423 a!2986) j!136) lt!298328)) (not (= (select (arr!18423 a!2986) j!136) lt!298338))))))

(declare-fun e!368864 () Bool)

(assert (=> b!643873 e!368864))

(declare-fun res!417053 () Bool)

(assert (=> b!643873 (=> (not res!417053) (not e!368864))))

(assert (=> b!643873 (= res!417053 (= lt!298338 (select (arr!18423 a!2986) j!136)))))

(assert (=> b!643873 (= lt!298338 (select (store (arr!18423 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!643874 () Bool)

(declare-fun res!417051 () Bool)

(declare-fun e!368851 () Bool)

(assert (=> b!643874 (=> (not res!417051) (not e!368851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!643874 (= res!417051 (validKeyInArray!0 k!1786))))

(declare-fun b!643875 () Bool)

(declare-fun res!417046 () Bool)

(assert (=> b!643875 (=> (not res!417046) (not e!368851))))

(assert (=> b!643875 (= res!417046 (validKeyInArray!0 (select (arr!18423 a!2986) j!136)))))

(declare-fun b!643876 () Bool)

(declare-fun e!368863 () Bool)

(assert (=> b!643876 (= e!368863 true)))

(assert (=> b!643876 e!368860))

(declare-fun res!417038 () Bool)

(assert (=> b!643876 (=> (not res!417038) (not e!368860))))

(assert (=> b!643876 (= res!417038 (arrayContainsKey!0 lt!298330 (select (arr!18423 a!2986) j!136) j!136))))

(declare-fun b!643877 () Bool)

(declare-fun res!417043 () Bool)

(assert (=> b!643877 (=> (not res!417043) (not e!368857))))

(assert (=> b!643877 (= res!417043 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18423 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!643878 () Bool)

(assert (=> b!643878 (= e!368853 e!368863)))

(declare-fun res!417039 () Bool)

(assert (=> b!643878 (=> res!417039 e!368863)))

(assert (=> b!643878 (= res!417039 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!21804 0))(
  ( (Unit!21805) )
))
(declare-fun lt!298335 () Unit!21804)

(declare-fun e!368858 () Unit!21804)

(assert (=> b!643878 (= lt!298335 e!368858)))

(declare-fun c!73784 () Bool)

(assert (=> b!643878 (= c!73784 (bvslt j!136 index!984))))

(declare-fun b!643879 () Bool)

(declare-fun res!417049 () Bool)

(assert (=> b!643879 (=> (not res!417049) (not e!368851))))

(assert (=> b!643879 (= res!417049 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!643880 () Bool)

(declare-fun Unit!21806 () Unit!21804)

(assert (=> b!643880 (= e!368858 Unit!21806)))

(declare-fun lt!298329 () Unit!21804)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38419 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21804)

(assert (=> b!643880 (= lt!298329 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298330 (select (arr!18423 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!643880 (arrayContainsKey!0 lt!298330 (select (arr!18423 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298334 () Unit!21804)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38419 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12464) Unit!21804)

(assert (=> b!643880 (= lt!298334 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12461))))

(assert (=> b!643880 (arrayNoDuplicates!0 lt!298330 #b00000000000000000000000000000000 Nil!12461)))

(declare-fun lt!298341 () Unit!21804)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38419 (_ BitVec 32) (_ BitVec 32)) Unit!21804)

(assert (=> b!643880 (= lt!298341 (lemmaNoDuplicateFromThenFromBigger!0 lt!298330 #b00000000000000000000000000000000 j!136))))

(assert (=> b!643880 (arrayNoDuplicates!0 lt!298330 j!136 Nil!12461)))

(declare-fun lt!298332 () Unit!21804)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38419 (_ BitVec 64) (_ BitVec 32) List!12464) Unit!21804)

(assert (=> b!643880 (= lt!298332 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298330 (select (arr!18423 a!2986) j!136) j!136 Nil!12461))))

(assert (=> b!643880 false))

(declare-fun b!643882 () Bool)

(assert (=> b!643882 (= e!368854 (not e!368856))))

(declare-fun res!417047 () Bool)

(assert (=> b!643882 (=> res!417047 e!368856)))

(declare-fun lt!298331 () SeekEntryResult!6863)

(assert (=> b!643882 (= res!417047 (not (= lt!298331 (Found!6863 index!984))))))

(declare-fun lt!298342 () Unit!21804)

(declare-fun e!368852 () Unit!21804)

(assert (=> b!643882 (= lt!298342 e!368852)))

(declare-fun c!73783 () Bool)

(assert (=> b!643882 (= c!73783 (= lt!298331 Undefined!6863))))

(assert (=> b!643882 (= lt!298331 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298328 lt!298330 mask!3053))))

(declare-fun e!368855 () Bool)

(assert (=> b!643882 e!368855))

(declare-fun res!417040 () Bool)

(assert (=> b!643882 (=> (not res!417040) (not e!368855))))

(declare-fun lt!298337 () SeekEntryResult!6863)

(declare-fun lt!298339 () (_ BitVec 32))

(assert (=> b!643882 (= res!417040 (= lt!298337 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298339 vacantSpotIndex!68 lt!298328 lt!298330 mask!3053)))))

(assert (=> b!643882 (= lt!298337 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298339 vacantSpotIndex!68 (select (arr!18423 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!643882 (= lt!298328 (select (store (arr!18423 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!298336 () Unit!21804)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38419 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21804)

(assert (=> b!643882 (= lt!298336 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298339 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!643882 (= lt!298339 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!643883 () Bool)

(declare-fun res!417050 () Bool)

(assert (=> b!643883 (=> (not res!417050) (not e!368857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38419 (_ BitVec 32)) Bool)

(assert (=> b!643883 (= res!417050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!643884 () Bool)

(declare-fun res!417044 () Bool)

(assert (=> b!643884 (=> (not res!417044) (not e!368851))))

(assert (=> b!643884 (= res!417044 (and (= (size!18787 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18787 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18787 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!643885 () Bool)

(assert (=> b!643885 (= e!368851 e!368857)))

(declare-fun res!417037 () Bool)

(assert (=> b!643885 (=> (not res!417037) (not e!368857))))

(declare-fun lt!298340 () SeekEntryResult!6863)

(assert (=> b!643885 (= res!417037 (or (= lt!298340 (MissingZero!6863 i!1108)) (= lt!298340 (MissingVacant!6863 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38419 (_ BitVec 32)) SeekEntryResult!6863)

(assert (=> b!643885 (= lt!298340 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!643886 () Bool)

(declare-fun Unit!21807 () Unit!21804)

(assert (=> b!643886 (= e!368858 Unit!21807)))

(declare-fun b!643887 () Bool)

(assert (=> b!643887 (= e!368855 (= lt!298333 lt!298337))))

(declare-fun res!417048 () Bool)

(assert (=> start!58322 (=> (not res!417048) (not e!368851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58322 (= res!417048 (validMask!0 mask!3053))))

(assert (=> start!58322 e!368851))

(assert (=> start!58322 true))

(declare-fun array_inv!14219 (array!38419) Bool)

(assert (=> start!58322 (array_inv!14219 a!2986)))

(declare-fun b!643881 () Bool)

(assert (=> b!643881 (= e!368864 e!368861)))

(declare-fun res!417036 () Bool)

(assert (=> b!643881 (=> res!417036 e!368861)))

(assert (=> b!643881 (= res!417036 (or (not (= (select (arr!18423 a!2986) j!136) lt!298328)) (not (= (select (arr!18423 a!2986) j!136) lt!298338)) (bvsge j!136 index!984)))))

(declare-fun b!643888 () Bool)

(declare-fun Unit!21808 () Unit!21804)

(assert (=> b!643888 (= e!368852 Unit!21808)))

(assert (=> b!643888 false))

(declare-fun b!643889 () Bool)

(declare-fun Unit!21809 () Unit!21804)

(assert (=> b!643889 (= e!368852 Unit!21809)))

(assert (= (and start!58322 res!417048) b!643884))

(assert (= (and b!643884 res!417044) b!643875))

(assert (= (and b!643875 res!417046) b!643874))

(assert (= (and b!643874 res!417051) b!643879))

(assert (= (and b!643879 res!417049) b!643885))

(assert (= (and b!643885 res!417037) b!643883))

(assert (= (and b!643883 res!417050) b!643871))

(assert (= (and b!643871 res!417042) b!643877))

(assert (= (and b!643877 res!417043) b!643867))

(assert (= (and b!643867 res!417041) b!643868))

(assert (= (and b!643868 res!417052) b!643882))

(assert (= (and b!643882 res!417040) b!643887))

(assert (= (and b!643882 c!73783) b!643888))

(assert (= (and b!643882 (not c!73783)) b!643889))

(assert (= (and b!643882 (not res!417047)) b!643873))

(assert (= (and b!643873 res!417053) b!643881))

(assert (= (and b!643881 (not res!417036)) b!643869))

(assert (= (and b!643869 res!417035) b!643872))

(assert (= (and b!643873 (not res!417045)) b!643878))

(assert (= (and b!643878 c!73784) b!643880))

(assert (= (and b!643878 (not c!73784)) b!643886))

(assert (= (and b!643878 (not res!417039)) b!643876))

(assert (= (and b!643876 res!417038) b!643870))

(declare-fun m!617549 () Bool)

(assert (=> b!643876 m!617549))

(assert (=> b!643876 m!617549))

(declare-fun m!617551 () Bool)

(assert (=> b!643876 m!617551))

(assert (=> b!643881 m!617549))

(declare-fun m!617553 () Bool)

(assert (=> start!58322 m!617553))

(declare-fun m!617555 () Bool)

(assert (=> start!58322 m!617555))

(assert (=> b!643873 m!617549))

(declare-fun m!617557 () Bool)

(assert (=> b!643873 m!617557))

(declare-fun m!617559 () Bool)

(assert (=> b!643873 m!617559))

(declare-fun m!617561 () Bool)

(assert (=> b!643879 m!617561))

(assert (=> b!643869 m!617549))

(assert (=> b!643869 m!617549))

(assert (=> b!643869 m!617551))

(declare-fun m!617563 () Bool)

(assert (=> b!643880 m!617563))

(declare-fun m!617565 () Bool)

(assert (=> b!643880 m!617565))

(assert (=> b!643880 m!617549))

(assert (=> b!643880 m!617549))

(declare-fun m!617567 () Bool)

(assert (=> b!643880 m!617567))

(assert (=> b!643880 m!617549))

(declare-fun m!617569 () Bool)

(assert (=> b!643880 m!617569))

(declare-fun m!617571 () Bool)

(assert (=> b!643880 m!617571))

(assert (=> b!643880 m!617549))

(declare-fun m!617573 () Bool)

(assert (=> b!643880 m!617573))

(declare-fun m!617575 () Bool)

(assert (=> b!643880 m!617575))

(assert (=> b!643875 m!617549))

(assert (=> b!643875 m!617549))

(declare-fun m!617577 () Bool)

(assert (=> b!643875 m!617577))

(assert (=> b!643872 m!617549))

(assert (=> b!643872 m!617549))

(declare-fun m!617579 () Bool)

(assert (=> b!643872 m!617579))

(declare-fun m!617581 () Bool)

(assert (=> b!643885 m!617581))

(assert (=> b!643867 m!617557))

(declare-fun m!617583 () Bool)

(assert (=> b!643867 m!617583))

(declare-fun m!617585 () Bool)

(assert (=> b!643868 m!617585))

(assert (=> b!643868 m!617549))

(assert (=> b!643868 m!617549))

(declare-fun m!617587 () Bool)

(assert (=> b!643868 m!617587))

(declare-fun m!617589 () Bool)

(assert (=> b!643877 m!617589))

(declare-fun m!617591 () Bool)

(assert (=> b!643871 m!617591))

(declare-fun m!617593 () Bool)

(assert (=> b!643874 m!617593))

(assert (=> b!643870 m!617549))

(assert (=> b!643870 m!617549))

(assert (=> b!643870 m!617579))

(declare-fun m!617595 () Bool)

(assert (=> b!643882 m!617595))

(declare-fun m!617597 () Bool)

(assert (=> b!643882 m!617597))

(assert (=> b!643882 m!617549))

(declare-fun m!617599 () Bool)

(assert (=> b!643882 m!617599))

(assert (=> b!643882 m!617549))

(assert (=> b!643882 m!617557))

(declare-fun m!617601 () Bool)

(assert (=> b!643882 m!617601))

(declare-fun m!617603 () Bool)

(assert (=> b!643882 m!617603))

(declare-fun m!617605 () Bool)

(assert (=> b!643882 m!617605))

(declare-fun m!617607 () Bool)

(assert (=> b!643883 m!617607))

(push 1)

