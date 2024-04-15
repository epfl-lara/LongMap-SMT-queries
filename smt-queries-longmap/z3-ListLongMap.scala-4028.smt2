; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54858 () Bool)

(assert start!54858)

(declare-fun b!599848 () Bool)

(declare-fun e!342940 () Bool)

(declare-fun e!342934 () Bool)

(assert (=> b!599848 (= e!342940 e!342934)))

(declare-fun res!384917 () Bool)

(assert (=> b!599848 (=> res!384917 e!342934)))

(declare-datatypes ((array!37107 0))(
  ( (array!37108 (arr!17813 (Array (_ BitVec 32) (_ BitVec 64))) (size!18178 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37107)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!599848 (= res!384917 (or (bvsge (size!18178 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18178 a!2986))))))

(declare-fun lt!272699 () array!37107)

(declare-datatypes ((List!11893 0))(
  ( (Nil!11890) (Cons!11889 (h!12934 (_ BitVec 64)) (t!18112 List!11893)) )
))
(declare-fun arrayNoDuplicates!0 (array!37107 (_ BitVec 32) List!11893) Bool)

(assert (=> b!599848 (arrayNoDuplicates!0 lt!272699 j!136 Nil!11890)))

(declare-datatypes ((Unit!18912 0))(
  ( (Unit!18913) )
))
(declare-fun lt!272696 () Unit!18912)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37107 (_ BitVec 32) (_ BitVec 32)) Unit!18912)

(assert (=> b!599848 (= lt!272696 (lemmaNoDuplicateFromThenFromBigger!0 lt!272699 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599848 (arrayNoDuplicates!0 lt!272699 #b00000000000000000000000000000000 Nil!11890)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!272701 () Unit!18912)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37107 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11893) Unit!18912)

(assert (=> b!599848 (= lt!272701 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11890))))

(declare-fun arrayContainsKey!0 (array!37107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599848 (arrayContainsKey!0 lt!272699 (select (arr!17813 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272707 () Unit!18912)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37107 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18912)

(assert (=> b!599848 (= lt!272707 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272699 (select (arr!17813 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599849 () Bool)

(declare-fun e!342932 () Bool)

(assert (=> b!599849 (= e!342932 e!342940)))

(declare-fun res!384908 () Bool)

(assert (=> b!599849 (=> res!384908 e!342940)))

(declare-fun lt!272704 () (_ BitVec 64))

(declare-fun lt!272705 () (_ BitVec 64))

(assert (=> b!599849 (= res!384908 (or (not (= (select (arr!17813 a!2986) j!136) lt!272705)) (not (= (select (arr!17813 a!2986) j!136) lt!272704)) (bvsge j!136 index!984)))))

(declare-fun e!342935 () Bool)

(assert (=> b!599849 e!342935))

(declare-fun res!384920 () Bool)

(assert (=> b!599849 (=> (not res!384920) (not e!342935))))

(assert (=> b!599849 (= res!384920 (= lt!272704 (select (arr!17813 a!2986) j!136)))))

(assert (=> b!599849 (= lt!272704 (select (store (arr!17813 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!599850 () Bool)

(declare-fun e!342938 () Bool)

(assert (=> b!599850 (= e!342935 e!342938)))

(declare-fun res!384909 () Bool)

(assert (=> b!599850 (=> res!384909 e!342938)))

(assert (=> b!599850 (= res!384909 (or (not (= (select (arr!17813 a!2986) j!136) lt!272705)) (not (= (select (arr!17813 a!2986) j!136) lt!272704)) (bvsge j!136 index!984)))))

(declare-fun b!599851 () Bool)

(declare-fun e!342939 () Bool)

(declare-fun e!342933 () Bool)

(assert (=> b!599851 (= e!342939 e!342933)))

(declare-fun res!384921 () Bool)

(assert (=> b!599851 (=> (not res!384921) (not e!342933))))

(declare-datatypes ((SeekEntryResult!6250 0))(
  ( (MissingZero!6250 (index!27257 (_ BitVec 32))) (Found!6250 (index!27258 (_ BitVec 32))) (Intermediate!6250 (undefined!7062 Bool) (index!27259 (_ BitVec 32)) (x!56068 (_ BitVec 32))) (Undefined!6250) (MissingVacant!6250 (index!27260 (_ BitVec 32))) )
))
(declare-fun lt!272706 () SeekEntryResult!6250)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!599851 (= res!384921 (and (= lt!272706 (Found!6250 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17813 a!2986) index!984) (select (arr!17813 a!2986) j!136))) (not (= (select (arr!17813 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37107 (_ BitVec 32)) SeekEntryResult!6250)

(assert (=> b!599851 (= lt!272706 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17813 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599852 () Bool)

(declare-fun res!384923 () Bool)

(declare-fun e!342937 () Bool)

(assert (=> b!599852 (=> (not res!384923) (not e!342937))))

(assert (=> b!599852 (= res!384923 (and (= (size!18178 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18178 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18178 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599854 () Bool)

(declare-fun e!342936 () Bool)

(assert (=> b!599854 (= e!342937 e!342936)))

(declare-fun res!384916 () Bool)

(assert (=> b!599854 (=> (not res!384916) (not e!342936))))

(declare-fun lt!272695 () SeekEntryResult!6250)

(assert (=> b!599854 (= res!384916 (or (= lt!272695 (MissingZero!6250 i!1108)) (= lt!272695 (MissingVacant!6250 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37107 (_ BitVec 32)) SeekEntryResult!6250)

(assert (=> b!599854 (= lt!272695 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun e!342941 () Bool)

(declare-fun b!599855 () Bool)

(assert (=> b!599855 (= e!342941 (arrayContainsKey!0 lt!272699 (select (arr!17813 a!2986) j!136) index!984))))

(declare-fun b!599856 () Bool)

(declare-fun res!384922 () Bool)

(assert (=> b!599856 (=> res!384922 e!342934)))

(declare-fun noDuplicate!293 (List!11893) Bool)

(assert (=> b!599856 (= res!384922 (not (noDuplicate!293 Nil!11890)))))

(declare-fun b!599857 () Bool)

(declare-fun res!384907 () Bool)

(assert (=> b!599857 (=> (not res!384907) (not e!342937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599857 (= res!384907 (validKeyInArray!0 k0!1786))))

(declare-fun b!599858 () Bool)

(declare-fun res!384919 () Bool)

(assert (=> b!599858 (=> (not res!384919) (not e!342936))))

(assert (=> b!599858 (= res!384919 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17813 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599859 () Bool)

(declare-fun res!384905 () Bool)

(assert (=> b!599859 (=> (not res!384905) (not e!342937))))

(assert (=> b!599859 (= res!384905 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599853 () Bool)

(assert (=> b!599853 (= e!342938 e!342941)))

(declare-fun res!384915 () Bool)

(assert (=> b!599853 (=> (not res!384915) (not e!342941))))

(assert (=> b!599853 (= res!384915 (arrayContainsKey!0 lt!272699 (select (arr!17813 a!2986) j!136) j!136))))

(declare-fun res!384918 () Bool)

(assert (=> start!54858 (=> (not res!384918) (not e!342937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54858 (= res!384918 (validMask!0 mask!3053))))

(assert (=> start!54858 e!342937))

(assert (=> start!54858 true))

(declare-fun array_inv!13696 (array!37107) Bool)

(assert (=> start!54858 (array_inv!13696 a!2986)))

(declare-fun b!599860 () Bool)

(declare-fun e!342931 () Unit!18912)

(declare-fun Unit!18914 () Unit!18912)

(assert (=> b!599860 (= e!342931 Unit!18914)))

(assert (=> b!599860 false))

(declare-fun b!599861 () Bool)

(assert (=> b!599861 (= e!342933 (not e!342932))))

(declare-fun res!384904 () Bool)

(assert (=> b!599861 (=> res!384904 e!342932)))

(declare-fun lt!272694 () SeekEntryResult!6250)

(assert (=> b!599861 (= res!384904 (not (= lt!272694 (Found!6250 index!984))))))

(declare-fun lt!272697 () Unit!18912)

(assert (=> b!599861 (= lt!272697 e!342931)))

(declare-fun c!67839 () Bool)

(assert (=> b!599861 (= c!67839 (= lt!272694 Undefined!6250))))

(assert (=> b!599861 (= lt!272694 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272705 lt!272699 mask!3053))))

(declare-fun e!342930 () Bool)

(assert (=> b!599861 e!342930))

(declare-fun res!384914 () Bool)

(assert (=> b!599861 (=> (not res!384914) (not e!342930))))

(declare-fun lt!272703 () (_ BitVec 32))

(declare-fun lt!272700 () SeekEntryResult!6250)

(assert (=> b!599861 (= res!384914 (= lt!272700 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272703 vacantSpotIndex!68 lt!272705 lt!272699 mask!3053)))))

(assert (=> b!599861 (= lt!272700 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272703 vacantSpotIndex!68 (select (arr!17813 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599861 (= lt!272705 (select (store (arr!17813 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272702 () Unit!18912)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37107 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18912)

(assert (=> b!599861 (= lt!272702 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272703 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599861 (= lt!272703 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599862 () Bool)

(declare-fun res!384911 () Bool)

(assert (=> b!599862 (=> res!384911 e!342934)))

(declare-fun contains!2958 (List!11893 (_ BitVec 64)) Bool)

(assert (=> b!599862 (= res!384911 (contains!2958 Nil!11890 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599863 () Bool)

(declare-fun res!384913 () Bool)

(assert (=> b!599863 (=> (not res!384913) (not e!342936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37107 (_ BitVec 32)) Bool)

(assert (=> b!599863 (= res!384913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599864 () Bool)

(declare-fun res!384906 () Bool)

(assert (=> b!599864 (=> (not res!384906) (not e!342936))))

(assert (=> b!599864 (= res!384906 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11890))))

(declare-fun b!599865 () Bool)

(assert (=> b!599865 (= e!342934 true)))

(declare-fun lt!272698 () Bool)

(assert (=> b!599865 (= lt!272698 (contains!2958 Nil!11890 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599866 () Bool)

(assert (=> b!599866 (= e!342930 (= lt!272706 lt!272700))))

(declare-fun b!599867 () Bool)

(declare-fun res!384912 () Bool)

(assert (=> b!599867 (=> (not res!384912) (not e!342937))))

(assert (=> b!599867 (= res!384912 (validKeyInArray!0 (select (arr!17813 a!2986) j!136)))))

(declare-fun b!599868 () Bool)

(declare-fun Unit!18915 () Unit!18912)

(assert (=> b!599868 (= e!342931 Unit!18915)))

(declare-fun b!599869 () Bool)

(assert (=> b!599869 (= e!342936 e!342939)))

(declare-fun res!384910 () Bool)

(assert (=> b!599869 (=> (not res!384910) (not e!342939))))

(assert (=> b!599869 (= res!384910 (= (select (store (arr!17813 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599869 (= lt!272699 (array!37108 (store (arr!17813 a!2986) i!1108 k0!1786) (size!18178 a!2986)))))

(assert (= (and start!54858 res!384918) b!599852))

(assert (= (and b!599852 res!384923) b!599867))

(assert (= (and b!599867 res!384912) b!599857))

(assert (= (and b!599857 res!384907) b!599859))

(assert (= (and b!599859 res!384905) b!599854))

(assert (= (and b!599854 res!384916) b!599863))

(assert (= (and b!599863 res!384913) b!599864))

(assert (= (and b!599864 res!384906) b!599858))

(assert (= (and b!599858 res!384919) b!599869))

(assert (= (and b!599869 res!384910) b!599851))

(assert (= (and b!599851 res!384921) b!599861))

(assert (= (and b!599861 res!384914) b!599866))

(assert (= (and b!599861 c!67839) b!599860))

(assert (= (and b!599861 (not c!67839)) b!599868))

(assert (= (and b!599861 (not res!384904)) b!599849))

(assert (= (and b!599849 res!384920) b!599850))

(assert (= (and b!599850 (not res!384909)) b!599853))

(assert (= (and b!599853 res!384915) b!599855))

(assert (= (and b!599849 (not res!384908)) b!599848))

(assert (= (and b!599848 (not res!384917)) b!599856))

(assert (= (and b!599856 (not res!384922)) b!599862))

(assert (= (and b!599862 (not res!384911)) b!599865))

(declare-fun m!576577 () Bool)

(assert (=> b!599865 m!576577))

(declare-fun m!576579 () Bool)

(assert (=> b!599849 m!576579))

(declare-fun m!576581 () Bool)

(assert (=> b!599849 m!576581))

(declare-fun m!576583 () Bool)

(assert (=> b!599849 m!576583))

(declare-fun m!576585 () Bool)

(assert (=> b!599864 m!576585))

(declare-fun m!576587 () Bool)

(assert (=> b!599854 m!576587))

(declare-fun m!576589 () Bool)

(assert (=> start!54858 m!576589))

(declare-fun m!576591 () Bool)

(assert (=> start!54858 m!576591))

(declare-fun m!576593 () Bool)

(assert (=> b!599863 m!576593))

(declare-fun m!576595 () Bool)

(assert (=> b!599861 m!576595))

(declare-fun m!576597 () Bool)

(assert (=> b!599861 m!576597))

(assert (=> b!599861 m!576579))

(assert (=> b!599861 m!576581))

(declare-fun m!576599 () Bool)

(assert (=> b!599861 m!576599))

(assert (=> b!599861 m!576579))

(declare-fun m!576601 () Bool)

(assert (=> b!599861 m!576601))

(declare-fun m!576603 () Bool)

(assert (=> b!599861 m!576603))

(declare-fun m!576605 () Bool)

(assert (=> b!599861 m!576605))

(declare-fun m!576607 () Bool)

(assert (=> b!599851 m!576607))

(assert (=> b!599851 m!576579))

(assert (=> b!599851 m!576579))

(declare-fun m!576609 () Bool)

(assert (=> b!599851 m!576609))

(declare-fun m!576611 () Bool)

(assert (=> b!599859 m!576611))

(declare-fun m!576613 () Bool)

(assert (=> b!599856 m!576613))

(assert (=> b!599869 m!576581))

(declare-fun m!576615 () Bool)

(assert (=> b!599869 m!576615))

(declare-fun m!576617 () Bool)

(assert (=> b!599857 m!576617))

(assert (=> b!599853 m!576579))

(assert (=> b!599853 m!576579))

(declare-fun m!576619 () Bool)

(assert (=> b!599853 m!576619))

(declare-fun m!576621 () Bool)

(assert (=> b!599858 m!576621))

(declare-fun m!576623 () Bool)

(assert (=> b!599862 m!576623))

(assert (=> b!599867 m!576579))

(assert (=> b!599867 m!576579))

(declare-fun m!576625 () Bool)

(assert (=> b!599867 m!576625))

(assert (=> b!599855 m!576579))

(assert (=> b!599855 m!576579))

(declare-fun m!576627 () Bool)

(assert (=> b!599855 m!576627))

(assert (=> b!599850 m!576579))

(declare-fun m!576629 () Bool)

(assert (=> b!599848 m!576629))

(assert (=> b!599848 m!576579))

(assert (=> b!599848 m!576579))

(declare-fun m!576631 () Bool)

(assert (=> b!599848 m!576631))

(assert (=> b!599848 m!576579))

(declare-fun m!576633 () Bool)

(assert (=> b!599848 m!576633))

(declare-fun m!576635 () Bool)

(assert (=> b!599848 m!576635))

(declare-fun m!576637 () Bool)

(assert (=> b!599848 m!576637))

(declare-fun m!576639 () Bool)

(assert (=> b!599848 m!576639))

(check-sat (not b!599857) (not b!599856) (not b!599851) (not b!599863) (not b!599855) (not b!599865) (not b!599854) (not b!599853) (not b!599864) (not b!599862) (not b!599848) (not b!599859) (not start!54858) (not b!599861) (not b!599867))
(check-sat)
