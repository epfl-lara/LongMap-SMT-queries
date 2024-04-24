; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54906 () Bool)

(assert start!54906)

(declare-fun b!599734 () Bool)

(declare-fun res!384609 () Bool)

(declare-fun e!342886 () Bool)

(assert (=> b!599734 (=> (not res!384609) (not e!342886))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37086 0))(
  ( (array!37087 (arr!17800 (Array (_ BitVec 32) (_ BitVec 64))) (size!18164 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37086)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!599734 (= res!384609 (and (= (size!18164 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18164 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18164 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599735 () Bool)

(declare-datatypes ((Unit!18877 0))(
  ( (Unit!18878) )
))
(declare-fun e!342888 () Unit!18877)

(declare-fun Unit!18879 () Unit!18877)

(assert (=> b!599735 (= e!342888 Unit!18879)))

(assert (=> b!599735 false))

(declare-fun b!599736 () Bool)

(declare-fun e!342890 () Bool)

(declare-fun lt!272654 () array!37086)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599736 (= e!342890 (arrayContainsKey!0 lt!272654 (select (arr!17800 a!2986) j!136) index!984))))

(declare-fun b!599737 () Bool)

(declare-fun res!384608 () Bool)

(declare-fun e!342892 () Bool)

(assert (=> b!599737 (=> (not res!384608) (not e!342892))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!599737 (= res!384608 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17800 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599738 () Bool)

(assert (=> b!599738 (= e!342886 e!342892)))

(declare-fun res!384600 () Bool)

(assert (=> b!599738 (=> (not res!384600) (not e!342892))))

(declare-datatypes ((SeekEntryResult!6196 0))(
  ( (MissingZero!6196 (index!27041 (_ BitVec 32))) (Found!6196 (index!27042 (_ BitVec 32))) (Intermediate!6196 (undefined!7008 Bool) (index!27043 (_ BitVec 32)) (x!55998 (_ BitVec 32))) (Undefined!6196) (MissingVacant!6196 (index!27044 (_ BitVec 32))) )
))
(declare-fun lt!272657 () SeekEntryResult!6196)

(assert (=> b!599738 (= res!384600 (or (= lt!272657 (MissingZero!6196 i!1108)) (= lt!272657 (MissingVacant!6196 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37086 (_ BitVec 32)) SeekEntryResult!6196)

(assert (=> b!599738 (= lt!272657 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!599739 () Bool)

(declare-fun res!384597 () Bool)

(assert (=> b!599739 (=> (not res!384597) (not e!342886))))

(assert (=> b!599739 (= res!384597 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599740 () Bool)

(declare-fun e!342883 () Bool)

(declare-fun e!342894 () Bool)

(assert (=> b!599740 (= e!342883 e!342894)))

(declare-fun res!384613 () Bool)

(assert (=> b!599740 (=> (not res!384613) (not e!342894))))

(declare-fun lt!272661 () SeekEntryResult!6196)

(assert (=> b!599740 (= res!384613 (and (= lt!272661 (Found!6196 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17800 a!2986) index!984) (select (arr!17800 a!2986) j!136))) (not (= (select (arr!17800 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37086 (_ BitVec 32)) SeekEntryResult!6196)

(assert (=> b!599740 (= lt!272661 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17800 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599741 () Bool)

(declare-fun e!342893 () Bool)

(assert (=> b!599741 (= e!342894 (not e!342893))))

(declare-fun res!384611 () Bool)

(assert (=> b!599741 (=> res!384611 e!342893)))

(declare-fun lt!272653 () SeekEntryResult!6196)

(assert (=> b!599741 (= res!384611 (not (= lt!272653 (Found!6196 index!984))))))

(declare-fun lt!272656 () Unit!18877)

(assert (=> b!599741 (= lt!272656 e!342888)))

(declare-fun c!67937 () Bool)

(assert (=> b!599741 (= c!67937 (= lt!272653 Undefined!6196))))

(declare-fun lt!272658 () (_ BitVec 64))

(assert (=> b!599741 (= lt!272653 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272658 lt!272654 mask!3053))))

(declare-fun e!342887 () Bool)

(assert (=> b!599741 e!342887))

(declare-fun res!384605 () Bool)

(assert (=> b!599741 (=> (not res!384605) (not e!342887))))

(declare-fun lt!272655 () SeekEntryResult!6196)

(declare-fun lt!272660 () (_ BitVec 32))

(assert (=> b!599741 (= res!384605 (= lt!272655 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272660 vacantSpotIndex!68 lt!272658 lt!272654 mask!3053)))))

(assert (=> b!599741 (= lt!272655 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272660 vacantSpotIndex!68 (select (arr!17800 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599741 (= lt!272658 (select (store (arr!17800 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272663 () Unit!18877)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37086 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18877)

(assert (=> b!599741 (= lt!272663 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272660 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599741 (= lt!272660 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!599742 () Bool)

(declare-fun e!342884 () Bool)

(assert (=> b!599742 (= e!342884 e!342890)))

(declare-fun res!384616 () Bool)

(assert (=> b!599742 (=> (not res!384616) (not e!342890))))

(assert (=> b!599742 (= res!384616 (arrayContainsKey!0 lt!272654 (select (arr!17800 a!2986) j!136) j!136))))

(declare-fun b!599743 () Bool)

(declare-fun e!342882 () Bool)

(assert (=> b!599743 (= e!342882 true)))

(declare-fun lt!272652 () Bool)

(declare-datatypes ((List!11748 0))(
  ( (Nil!11745) (Cons!11744 (h!12792 (_ BitVec 64)) (t!17968 List!11748)) )
))
(declare-fun contains!2938 (List!11748 (_ BitVec 64)) Bool)

(assert (=> b!599743 (= lt!272652 (contains!2938 Nil!11745 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599744 () Bool)

(declare-fun e!342889 () Bool)

(assert (=> b!599744 (= e!342889 e!342882)))

(declare-fun res!384603 () Bool)

(assert (=> b!599744 (=> res!384603 e!342882)))

(assert (=> b!599744 (= res!384603 (or (bvsge (size!18164 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18164 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37086 (_ BitVec 32) List!11748) Bool)

(assert (=> b!599744 (arrayNoDuplicates!0 lt!272654 j!136 Nil!11745)))

(declare-fun lt!272662 () Unit!18877)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37086 (_ BitVec 32) (_ BitVec 32)) Unit!18877)

(assert (=> b!599744 (= lt!272662 (lemmaNoDuplicateFromThenFromBigger!0 lt!272654 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599744 (arrayNoDuplicates!0 lt!272654 #b00000000000000000000000000000000 Nil!11745)))

(declare-fun lt!272659 () Unit!18877)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37086 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11748) Unit!18877)

(assert (=> b!599744 (= lt!272659 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11745))))

(assert (=> b!599744 (arrayContainsKey!0 lt!272654 (select (arr!17800 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272664 () Unit!18877)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37086 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18877)

(assert (=> b!599744 (= lt!272664 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272654 (select (arr!17800 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599745 () Bool)

(declare-fun res!384599 () Bool)

(assert (=> b!599745 (=> (not res!384599) (not e!342892))))

(assert (=> b!599745 (= res!384599 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11745))))

(declare-fun b!599746 () Bool)

(declare-fun res!384606 () Bool)

(assert (=> b!599746 (=> res!384606 e!342882)))

(assert (=> b!599746 (= res!384606 (contains!2938 Nil!11745 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599747 () Bool)

(declare-fun res!384612 () Bool)

(assert (=> b!599747 (=> (not res!384612) (not e!342886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599747 (= res!384612 (validKeyInArray!0 (select (arr!17800 a!2986) j!136)))))

(declare-fun b!599748 () Bool)

(assert (=> b!599748 (= e!342892 e!342883)))

(declare-fun res!384601 () Bool)

(assert (=> b!599748 (=> (not res!384601) (not e!342883))))

(assert (=> b!599748 (= res!384601 (= (select (store (arr!17800 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599748 (= lt!272654 (array!37087 (store (arr!17800 a!2986) i!1108 k0!1786) (size!18164 a!2986)))))

(declare-fun b!599749 () Bool)

(declare-fun res!384615 () Bool)

(assert (=> b!599749 (=> (not res!384615) (not e!342892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37086 (_ BitVec 32)) Bool)

(assert (=> b!599749 (= res!384615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599750 () Bool)

(declare-fun res!384614 () Bool)

(assert (=> b!599750 (=> res!384614 e!342882)))

(declare-fun noDuplicate!283 (List!11748) Bool)

(assert (=> b!599750 (= res!384614 (not (noDuplicate!283 Nil!11745)))))

(declare-fun b!599751 () Bool)

(assert (=> b!599751 (= e!342893 e!342889)))

(declare-fun res!384604 () Bool)

(assert (=> b!599751 (=> res!384604 e!342889)))

(declare-fun lt!272665 () (_ BitVec 64))

(assert (=> b!599751 (= res!384604 (or (not (= (select (arr!17800 a!2986) j!136) lt!272658)) (not (= (select (arr!17800 a!2986) j!136) lt!272665)) (bvsge j!136 index!984)))))

(declare-fun e!342891 () Bool)

(assert (=> b!599751 e!342891))

(declare-fun res!384610 () Bool)

(assert (=> b!599751 (=> (not res!384610) (not e!342891))))

(assert (=> b!599751 (= res!384610 (= lt!272665 (select (arr!17800 a!2986) j!136)))))

(assert (=> b!599751 (= lt!272665 (select (store (arr!17800 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!599752 () Bool)

(assert (=> b!599752 (= e!342887 (= lt!272661 lt!272655))))

(declare-fun b!599753 () Bool)

(declare-fun res!384602 () Bool)

(assert (=> b!599753 (=> (not res!384602) (not e!342886))))

(assert (=> b!599753 (= res!384602 (validKeyInArray!0 k0!1786))))

(declare-fun b!599754 () Bool)

(assert (=> b!599754 (= e!342891 e!342884)))

(declare-fun res!384598 () Bool)

(assert (=> b!599754 (=> res!384598 e!342884)))

(assert (=> b!599754 (= res!384598 (or (not (= (select (arr!17800 a!2986) j!136) lt!272658)) (not (= (select (arr!17800 a!2986) j!136) lt!272665)) (bvsge j!136 index!984)))))

(declare-fun b!599755 () Bool)

(declare-fun Unit!18880 () Unit!18877)

(assert (=> b!599755 (= e!342888 Unit!18880)))

(declare-fun res!384607 () Bool)

(assert (=> start!54906 (=> (not res!384607) (not e!342886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54906 (= res!384607 (validMask!0 mask!3053))))

(assert (=> start!54906 e!342886))

(assert (=> start!54906 true))

(declare-fun array_inv!13659 (array!37086) Bool)

(assert (=> start!54906 (array_inv!13659 a!2986)))

(assert (= (and start!54906 res!384607) b!599734))

(assert (= (and b!599734 res!384609) b!599747))

(assert (= (and b!599747 res!384612) b!599753))

(assert (= (and b!599753 res!384602) b!599739))

(assert (= (and b!599739 res!384597) b!599738))

(assert (= (and b!599738 res!384600) b!599749))

(assert (= (and b!599749 res!384615) b!599745))

(assert (= (and b!599745 res!384599) b!599737))

(assert (= (and b!599737 res!384608) b!599748))

(assert (= (and b!599748 res!384601) b!599740))

(assert (= (and b!599740 res!384613) b!599741))

(assert (= (and b!599741 res!384605) b!599752))

(assert (= (and b!599741 c!67937) b!599735))

(assert (= (and b!599741 (not c!67937)) b!599755))

(assert (= (and b!599741 (not res!384611)) b!599751))

(assert (= (and b!599751 res!384610) b!599754))

(assert (= (and b!599754 (not res!384598)) b!599742))

(assert (= (and b!599742 res!384616) b!599736))

(assert (= (and b!599751 (not res!384604)) b!599744))

(assert (= (and b!599744 (not res!384603)) b!599750))

(assert (= (and b!599750 (not res!384614)) b!599746))

(assert (= (and b!599746 (not res!384606)) b!599743))

(declare-fun m!577205 () Bool)

(assert (=> b!599750 m!577205))

(declare-fun m!577207 () Bool)

(assert (=> b!599744 m!577207))

(declare-fun m!577209 () Bool)

(assert (=> b!599744 m!577209))

(declare-fun m!577211 () Bool)

(assert (=> b!599744 m!577211))

(declare-fun m!577213 () Bool)

(assert (=> b!599744 m!577213))

(assert (=> b!599744 m!577209))

(declare-fun m!577215 () Bool)

(assert (=> b!599744 m!577215))

(assert (=> b!599744 m!577209))

(declare-fun m!577217 () Bool)

(assert (=> b!599744 m!577217))

(declare-fun m!577219 () Bool)

(assert (=> b!599744 m!577219))

(assert (=> b!599754 m!577209))

(assert (=> b!599747 m!577209))

(assert (=> b!599747 m!577209))

(declare-fun m!577221 () Bool)

(assert (=> b!599747 m!577221))

(declare-fun m!577223 () Bool)

(assert (=> b!599746 m!577223))

(declare-fun m!577225 () Bool)

(assert (=> b!599740 m!577225))

(assert (=> b!599740 m!577209))

(assert (=> b!599740 m!577209))

(declare-fun m!577227 () Bool)

(assert (=> b!599740 m!577227))

(declare-fun m!577229 () Bool)

(assert (=> b!599749 m!577229))

(assert (=> b!599751 m!577209))

(declare-fun m!577231 () Bool)

(assert (=> b!599751 m!577231))

(declare-fun m!577233 () Bool)

(assert (=> b!599751 m!577233))

(declare-fun m!577235 () Bool)

(assert (=> start!54906 m!577235))

(declare-fun m!577237 () Bool)

(assert (=> start!54906 m!577237))

(declare-fun m!577239 () Bool)

(assert (=> b!599743 m!577239))

(assert (=> b!599748 m!577231))

(declare-fun m!577241 () Bool)

(assert (=> b!599748 m!577241))

(declare-fun m!577243 () Bool)

(assert (=> b!599745 m!577243))

(declare-fun m!577245 () Bool)

(assert (=> b!599739 m!577245))

(declare-fun m!577247 () Bool)

(assert (=> b!599741 m!577247))

(declare-fun m!577249 () Bool)

(assert (=> b!599741 m!577249))

(declare-fun m!577251 () Bool)

(assert (=> b!599741 m!577251))

(assert (=> b!599741 m!577209))

(assert (=> b!599741 m!577231))

(declare-fun m!577253 () Bool)

(assert (=> b!599741 m!577253))

(assert (=> b!599741 m!577209))

(declare-fun m!577255 () Bool)

(assert (=> b!599741 m!577255))

(declare-fun m!577257 () Bool)

(assert (=> b!599741 m!577257))

(declare-fun m!577259 () Bool)

(assert (=> b!599738 m!577259))

(declare-fun m!577261 () Bool)

(assert (=> b!599737 m!577261))

(assert (=> b!599742 m!577209))

(assert (=> b!599742 m!577209))

(declare-fun m!577263 () Bool)

(assert (=> b!599742 m!577263))

(assert (=> b!599736 m!577209))

(assert (=> b!599736 m!577209))

(declare-fun m!577265 () Bool)

(assert (=> b!599736 m!577265))

(declare-fun m!577267 () Bool)

(assert (=> b!599753 m!577267))

(check-sat (not start!54906) (not b!599749) (not b!599750) (not b!599738) (not b!599740) (not b!599745) (not b!599741) (not b!599743) (not b!599744) (not b!599742) (not b!599753) (not b!599747) (not b!599736) (not b!599746) (not b!599739))
(check-sat)
