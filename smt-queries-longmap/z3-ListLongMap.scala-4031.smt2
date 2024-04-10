; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54894 () Bool)

(assert start!54894)

(declare-fun b!600779 () Bool)

(declare-fun res!385645 () Bool)

(declare-fun e!343503 () Bool)

(assert (=> b!600779 (=> res!385645 e!343503)))

(declare-datatypes ((List!11865 0))(
  ( (Nil!11862) (Cons!11861 (h!12906 (_ BitVec 64)) (t!18093 List!11865)) )
))
(declare-fun noDuplicate!298 (List!11865) Bool)

(assert (=> b!600779 (= res!385645 (not (noDuplicate!298 Nil!11862)))))

(declare-fun b!600780 () Bool)

(declare-fun res!385637 () Bool)

(declare-fun e!343497 () Bool)

(assert (=> b!600780 (=> (not res!385637) (not e!343497))))

(declare-datatypes ((array!37129 0))(
  ( (array!37130 (arr!17824 (Array (_ BitVec 32) (_ BitVec 64))) (size!18188 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37129)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600780 (= res!385637 (validKeyInArray!0 (select (arr!17824 a!2986) j!136)))))

(declare-fun b!600781 () Bool)

(declare-fun res!385646 () Bool)

(declare-fun e!343506 () Bool)

(assert (=> b!600781 (=> (not res!385646) (not e!343506))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37129 (_ BitVec 32)) Bool)

(assert (=> b!600781 (= res!385646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600782 () Bool)

(declare-fun e!343502 () Bool)

(declare-fun e!343500 () Bool)

(assert (=> b!600782 (= e!343502 (not e!343500))))

(declare-fun res!385633 () Bool)

(assert (=> b!600782 (=> res!385633 e!343500)))

(declare-datatypes ((SeekEntryResult!6264 0))(
  ( (MissingZero!6264 (index!27313 (_ BitVec 32))) (Found!6264 (index!27314 (_ BitVec 32))) (Intermediate!6264 (undefined!7076 Bool) (index!27315 (_ BitVec 32)) (x!56111 (_ BitVec 32))) (Undefined!6264) (MissingVacant!6264 (index!27316 (_ BitVec 32))) )
))
(declare-fun lt!273348 () SeekEntryResult!6264)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!600782 (= res!385633 (not (= lt!273348 (Found!6264 index!984))))))

(declare-datatypes ((Unit!18974 0))(
  ( (Unit!18975) )
))
(declare-fun lt!273357 () Unit!18974)

(declare-fun e!343494 () Unit!18974)

(assert (=> b!600782 (= lt!273357 e!343494)))

(declare-fun c!67940 () Bool)

(assert (=> b!600782 (= c!67940 (= lt!273348 Undefined!6264))))

(declare-fun lt!273351 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!273360 () array!37129)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37129 (_ BitVec 32)) SeekEntryResult!6264)

(assert (=> b!600782 (= lt!273348 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273351 lt!273360 mask!3053))))

(declare-fun e!343505 () Bool)

(assert (=> b!600782 e!343505))

(declare-fun res!385641 () Bool)

(assert (=> b!600782 (=> (not res!385641) (not e!343505))))

(declare-fun lt!273350 () (_ BitVec 32))

(declare-fun lt!273358 () SeekEntryResult!6264)

(assert (=> b!600782 (= res!385641 (= lt!273358 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273350 vacantSpotIndex!68 lt!273351 lt!273360 mask!3053)))))

(assert (=> b!600782 (= lt!273358 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273350 vacantSpotIndex!68 (select (arr!17824 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!600782 (= lt!273351 (select (store (arr!17824 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273352 () Unit!18974)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37129 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18974)

(assert (=> b!600782 (= lt!273352 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273350 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600782 (= lt!273350 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!600783 () Bool)

(declare-fun e!343495 () Bool)

(declare-fun e!343496 () Bool)

(assert (=> b!600783 (= e!343495 e!343496)))

(declare-fun res!385634 () Bool)

(assert (=> b!600783 (=> (not res!385634) (not e!343496))))

(declare-fun arrayContainsKey!0 (array!37129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600783 (= res!385634 (arrayContainsKey!0 lt!273360 (select (arr!17824 a!2986) j!136) j!136))))

(declare-fun res!385635 () Bool)

(assert (=> start!54894 (=> (not res!385635) (not e!343497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54894 (= res!385635 (validMask!0 mask!3053))))

(assert (=> start!54894 e!343497))

(assert (=> start!54894 true))

(declare-fun array_inv!13620 (array!37129) Bool)

(assert (=> start!54894 (array_inv!13620 a!2986)))

(declare-fun b!600784 () Bool)

(declare-fun e!343498 () Bool)

(assert (=> b!600784 (= e!343498 e!343495)))

(declare-fun res!385636 () Bool)

(assert (=> b!600784 (=> res!385636 e!343495)))

(declare-fun lt!273355 () (_ BitVec 64))

(assert (=> b!600784 (= res!385636 (or (not (= (select (arr!17824 a!2986) j!136) lt!273351)) (not (= (select (arr!17824 a!2986) j!136) lt!273355)) (bvsge j!136 index!984)))))

(declare-fun b!600785 () Bool)

(declare-fun e!343499 () Bool)

(assert (=> b!600785 (= e!343499 e!343502)))

(declare-fun res!385652 () Bool)

(assert (=> b!600785 (=> (not res!385652) (not e!343502))))

(declare-fun lt!273361 () SeekEntryResult!6264)

(assert (=> b!600785 (= res!385652 (and (= lt!273361 (Found!6264 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17824 a!2986) index!984) (select (arr!17824 a!2986) j!136))) (not (= (select (arr!17824 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!600785 (= lt!273361 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17824 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600786 () Bool)

(declare-fun res!385649 () Bool)

(assert (=> b!600786 (=> res!385649 e!343503)))

(declare-fun contains!2981 (List!11865 (_ BitVec 64)) Bool)

(assert (=> b!600786 (= res!385649 (contains!2981 Nil!11862 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600787 () Bool)

(declare-fun res!385639 () Bool)

(assert (=> b!600787 (=> (not res!385639) (not e!343497))))

(assert (=> b!600787 (= res!385639 (and (= (size!18188 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18188 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18188 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600788 () Bool)

(assert (=> b!600788 (= e!343497 e!343506)))

(declare-fun res!385644 () Bool)

(assert (=> b!600788 (=> (not res!385644) (not e!343506))))

(declare-fun lt!273359 () SeekEntryResult!6264)

(assert (=> b!600788 (= res!385644 (or (= lt!273359 (MissingZero!6264 i!1108)) (= lt!273359 (MissingVacant!6264 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37129 (_ BitVec 32)) SeekEntryResult!6264)

(assert (=> b!600788 (= lt!273359 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!600789 () Bool)

(assert (=> b!600789 (= e!343503 true)))

(declare-fun lt!273353 () Bool)

(assert (=> b!600789 (= lt!273353 (contains!2981 Nil!11862 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600790 () Bool)

(declare-fun res!385638 () Bool)

(assert (=> b!600790 (=> (not res!385638) (not e!343497))))

(assert (=> b!600790 (= res!385638 (validKeyInArray!0 k0!1786))))

(declare-fun b!600791 () Bool)

(declare-fun e!343501 () Bool)

(assert (=> b!600791 (= e!343501 e!343503)))

(declare-fun res!385648 () Bool)

(assert (=> b!600791 (=> res!385648 e!343503)))

(assert (=> b!600791 (= res!385648 (or (bvsge (size!18188 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18188 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37129 (_ BitVec 32) List!11865) Bool)

(assert (=> b!600791 (arrayNoDuplicates!0 lt!273360 j!136 Nil!11862)))

(declare-fun lt!273349 () Unit!18974)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37129 (_ BitVec 32) (_ BitVec 32)) Unit!18974)

(assert (=> b!600791 (= lt!273349 (lemmaNoDuplicateFromThenFromBigger!0 lt!273360 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600791 (arrayNoDuplicates!0 lt!273360 #b00000000000000000000000000000000 Nil!11862)))

(declare-fun lt!273356 () Unit!18974)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37129 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11865) Unit!18974)

(assert (=> b!600791 (= lt!273356 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11862))))

(assert (=> b!600791 (arrayContainsKey!0 lt!273360 (select (arr!17824 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273354 () Unit!18974)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37129 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18974)

(assert (=> b!600791 (= lt!273354 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273360 (select (arr!17824 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600792 () Bool)

(assert (=> b!600792 (= e!343496 (arrayContainsKey!0 lt!273360 (select (arr!17824 a!2986) j!136) index!984))))

(declare-fun b!600793 () Bool)

(assert (=> b!600793 (= e!343500 e!343501)))

(declare-fun res!385643 () Bool)

(assert (=> b!600793 (=> res!385643 e!343501)))

(assert (=> b!600793 (= res!385643 (or (not (= (select (arr!17824 a!2986) j!136) lt!273351)) (not (= (select (arr!17824 a!2986) j!136) lt!273355)) (bvsge j!136 index!984)))))

(assert (=> b!600793 e!343498))

(declare-fun res!385642 () Bool)

(assert (=> b!600793 (=> (not res!385642) (not e!343498))))

(assert (=> b!600793 (= res!385642 (= lt!273355 (select (arr!17824 a!2986) j!136)))))

(assert (=> b!600793 (= lt!273355 (select (store (arr!17824 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!600794 () Bool)

(declare-fun res!385647 () Bool)

(assert (=> b!600794 (=> (not res!385647) (not e!343506))))

(assert (=> b!600794 (= res!385647 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17824 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600795 () Bool)

(assert (=> b!600795 (= e!343505 (= lt!273361 lt!273358))))

(declare-fun b!600796 () Bool)

(declare-fun Unit!18976 () Unit!18974)

(assert (=> b!600796 (= e!343494 Unit!18976)))

(assert (=> b!600796 false))

(declare-fun b!600797 () Bool)

(declare-fun res!385651 () Bool)

(assert (=> b!600797 (=> (not res!385651) (not e!343497))))

(assert (=> b!600797 (= res!385651 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600798 () Bool)

(declare-fun Unit!18977 () Unit!18974)

(assert (=> b!600798 (= e!343494 Unit!18977)))

(declare-fun b!600799 () Bool)

(declare-fun res!385640 () Bool)

(assert (=> b!600799 (=> (not res!385640) (not e!343506))))

(assert (=> b!600799 (= res!385640 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11862))))

(declare-fun b!600800 () Bool)

(assert (=> b!600800 (= e!343506 e!343499)))

(declare-fun res!385650 () Bool)

(assert (=> b!600800 (=> (not res!385650) (not e!343499))))

(assert (=> b!600800 (= res!385650 (= (select (store (arr!17824 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600800 (= lt!273360 (array!37130 (store (arr!17824 a!2986) i!1108 k0!1786) (size!18188 a!2986)))))

(assert (= (and start!54894 res!385635) b!600787))

(assert (= (and b!600787 res!385639) b!600780))

(assert (= (and b!600780 res!385637) b!600790))

(assert (= (and b!600790 res!385638) b!600797))

(assert (= (and b!600797 res!385651) b!600788))

(assert (= (and b!600788 res!385644) b!600781))

(assert (= (and b!600781 res!385646) b!600799))

(assert (= (and b!600799 res!385640) b!600794))

(assert (= (and b!600794 res!385647) b!600800))

(assert (= (and b!600800 res!385650) b!600785))

(assert (= (and b!600785 res!385652) b!600782))

(assert (= (and b!600782 res!385641) b!600795))

(assert (= (and b!600782 c!67940) b!600796))

(assert (= (and b!600782 (not c!67940)) b!600798))

(assert (= (and b!600782 (not res!385633)) b!600793))

(assert (= (and b!600793 res!385642) b!600784))

(assert (= (and b!600784 (not res!385636)) b!600783))

(assert (= (and b!600783 res!385634) b!600792))

(assert (= (and b!600793 (not res!385643)) b!600791))

(assert (= (and b!600791 (not res!385648)) b!600779))

(assert (= (and b!600779 (not res!385645)) b!600786))

(assert (= (and b!600786 (not res!385649)) b!600789))

(declare-fun m!577989 () Bool)

(assert (=> b!600792 m!577989))

(assert (=> b!600792 m!577989))

(declare-fun m!577991 () Bool)

(assert (=> b!600792 m!577991))

(declare-fun m!577993 () Bool)

(assert (=> b!600800 m!577993))

(declare-fun m!577995 () Bool)

(assert (=> b!600800 m!577995))

(declare-fun m!577997 () Bool)

(assert (=> b!600790 m!577997))

(assert (=> b!600780 m!577989))

(assert (=> b!600780 m!577989))

(declare-fun m!577999 () Bool)

(assert (=> b!600780 m!577999))

(declare-fun m!578001 () Bool)

(assert (=> b!600785 m!578001))

(assert (=> b!600785 m!577989))

(assert (=> b!600785 m!577989))

(declare-fun m!578003 () Bool)

(assert (=> b!600785 m!578003))

(declare-fun m!578005 () Bool)

(assert (=> b!600779 m!578005))

(assert (=> b!600791 m!577989))

(declare-fun m!578007 () Bool)

(assert (=> b!600791 m!578007))

(declare-fun m!578009 () Bool)

(assert (=> b!600791 m!578009))

(assert (=> b!600791 m!577989))

(declare-fun m!578011 () Bool)

(assert (=> b!600791 m!578011))

(declare-fun m!578013 () Bool)

(assert (=> b!600791 m!578013))

(assert (=> b!600791 m!577989))

(declare-fun m!578015 () Bool)

(assert (=> b!600791 m!578015))

(declare-fun m!578017 () Bool)

(assert (=> b!600791 m!578017))

(declare-fun m!578019 () Bool)

(assert (=> b!600781 m!578019))

(declare-fun m!578021 () Bool)

(assert (=> start!54894 m!578021))

(declare-fun m!578023 () Bool)

(assert (=> start!54894 m!578023))

(declare-fun m!578025 () Bool)

(assert (=> b!600782 m!578025))

(declare-fun m!578027 () Bool)

(assert (=> b!600782 m!578027))

(declare-fun m!578029 () Bool)

(assert (=> b!600782 m!578029))

(assert (=> b!600782 m!577989))

(declare-fun m!578031 () Bool)

(assert (=> b!600782 m!578031))

(declare-fun m!578033 () Bool)

(assert (=> b!600782 m!578033))

(assert (=> b!600782 m!577989))

(declare-fun m!578035 () Bool)

(assert (=> b!600782 m!578035))

(assert (=> b!600782 m!577993))

(assert (=> b!600793 m!577989))

(assert (=> b!600793 m!577993))

(declare-fun m!578037 () Bool)

(assert (=> b!600793 m!578037))

(declare-fun m!578039 () Bool)

(assert (=> b!600788 m!578039))

(declare-fun m!578041 () Bool)

(assert (=> b!600786 m!578041))

(assert (=> b!600783 m!577989))

(assert (=> b!600783 m!577989))

(declare-fun m!578043 () Bool)

(assert (=> b!600783 m!578043))

(declare-fun m!578045 () Bool)

(assert (=> b!600799 m!578045))

(assert (=> b!600784 m!577989))

(declare-fun m!578047 () Bool)

(assert (=> b!600797 m!578047))

(declare-fun m!578049 () Bool)

(assert (=> b!600794 m!578049))

(declare-fun m!578051 () Bool)

(assert (=> b!600789 m!578051))

(check-sat (not b!600797) (not b!600790) (not b!600789) (not b!600786) (not start!54894) (not b!600799) (not b!600783) (not b!600780) (not b!600792) (not b!600781) (not b!600788) (not b!600779) (not b!600791) (not b!600785) (not b!600782))
(check-sat)
