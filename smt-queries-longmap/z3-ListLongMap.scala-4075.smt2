; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55998 () Bool)

(assert start!55998)

(declare-fun b!613593 () Bool)

(declare-fun res!394925 () Bool)

(declare-fun e!351761 () Bool)

(assert (=> b!613593 (=> (not res!394925) (not e!351761))))

(declare-datatypes ((array!37413 0))(
  ( (array!37414 (arr!17950 (Array (_ BitVec 32) (_ BitVec 64))) (size!18314 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37413)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!613593 (= res!394925 (validKeyInArray!0 (select (arr!17950 a!2986) j!136)))))

(declare-fun b!613594 () Bool)

(declare-fun e!351756 () Bool)

(declare-fun e!351762 () Bool)

(assert (=> b!613594 (= e!351756 e!351762)))

(declare-fun res!394920 () Bool)

(assert (=> b!613594 (=> (not res!394920) (not e!351762))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!613594 (= res!394920 (= (select (store (arr!17950 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!281217 () array!37413)

(assert (=> b!613594 (= lt!281217 (array!37414 (store (arr!17950 a!2986) i!1108 k0!1786) (size!18314 a!2986)))))

(declare-fun b!613595 () Bool)

(declare-fun res!394909 () Bool)

(assert (=> b!613595 (=> (not res!394909) (not e!351756))))

(declare-datatypes ((List!11898 0))(
  ( (Nil!11895) (Cons!11894 (h!12942 (_ BitVec 64)) (t!18118 List!11898)) )
))
(declare-fun arrayNoDuplicates!0 (array!37413 (_ BitVec 32) List!11898) Bool)

(assert (=> b!613595 (= res!394909 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11895))))

(declare-fun res!394923 () Bool)

(assert (=> start!55998 (=> (not res!394923) (not e!351761))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55998 (= res!394923 (validMask!0 mask!3053))))

(assert (=> start!55998 e!351761))

(assert (=> start!55998 true))

(declare-fun array_inv!13809 (array!37413) Bool)

(assert (=> start!55998 (array_inv!13809 a!2986)))

(declare-fun b!613596 () Bool)

(declare-fun e!351767 () Bool)

(declare-fun e!351755 () Bool)

(assert (=> b!613596 (= e!351767 (not e!351755))))

(declare-fun res!394926 () Bool)

(assert (=> b!613596 (=> res!394926 e!351755)))

(declare-datatypes ((SeekEntryResult!6346 0))(
  ( (MissingZero!6346 (index!27668 (_ BitVec 32))) (Found!6346 (index!27669 (_ BitVec 32))) (Intermediate!6346 (undefined!7158 Bool) (index!27670 (_ BitVec 32)) (x!56629 (_ BitVec 32))) (Undefined!6346) (MissingVacant!6346 (index!27671 (_ BitVec 32))) )
))
(declare-fun lt!281216 () SeekEntryResult!6346)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!613596 (= res!394926 (not (= lt!281216 (Found!6346 index!984))))))

(declare-datatypes ((Unit!19729 0))(
  ( (Unit!19730) )
))
(declare-fun lt!281212 () Unit!19729)

(declare-fun e!351760 () Unit!19729)

(assert (=> b!613596 (= lt!281212 e!351760)))

(declare-fun c!69713 () Bool)

(assert (=> b!613596 (= c!69713 (= lt!281216 Undefined!6346))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!281213 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37413 (_ BitVec 32)) SeekEntryResult!6346)

(assert (=> b!613596 (= lt!281216 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!281213 lt!281217 mask!3053))))

(declare-fun e!351764 () Bool)

(assert (=> b!613596 e!351764))

(declare-fun res!394924 () Bool)

(assert (=> b!613596 (=> (not res!394924) (not e!351764))))

(declare-fun lt!281230 () (_ BitVec 32))

(declare-fun lt!281223 () SeekEntryResult!6346)

(assert (=> b!613596 (= res!394924 (= lt!281223 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281230 vacantSpotIndex!68 lt!281213 lt!281217 mask!3053)))))

(assert (=> b!613596 (= lt!281223 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281230 vacantSpotIndex!68 (select (arr!17950 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!613596 (= lt!281213 (select (store (arr!17950 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!281225 () Unit!19729)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37413 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19729)

(assert (=> b!613596 (= lt!281225 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!281230 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!613596 (= lt!281230 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!613597 () Bool)

(declare-fun e!351758 () Bool)

(declare-fun e!351766 () Bool)

(assert (=> b!613597 (= e!351758 e!351766)))

(declare-fun res!394910 () Bool)

(assert (=> b!613597 (=> (not res!394910) (not e!351766))))

(declare-fun arrayContainsKey!0 (array!37413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!613597 (= res!394910 (arrayContainsKey!0 lt!281217 (select (arr!17950 a!2986) j!136) j!136))))

(declare-fun b!613598 () Bool)

(declare-fun e!351763 () Bool)

(assert (=> b!613598 (= e!351763 e!351758)))

(declare-fun res!394927 () Bool)

(assert (=> b!613598 (=> res!394927 e!351758)))

(declare-fun lt!281229 () (_ BitVec 64))

(assert (=> b!613598 (= res!394927 (or (not (= (select (arr!17950 a!2986) j!136) lt!281213)) (not (= (select (arr!17950 a!2986) j!136) lt!281229)) (bvsge j!136 index!984)))))

(declare-fun b!613599 () Bool)

(declare-fun res!394917 () Bool)

(assert (=> b!613599 (=> (not res!394917) (not e!351756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37413 (_ BitVec 32)) Bool)

(assert (=> b!613599 (= res!394917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!613600 () Bool)

(declare-fun e!351768 () Unit!19729)

(declare-fun Unit!19731 () Unit!19729)

(assert (=> b!613600 (= e!351768 Unit!19731)))

(declare-fun lt!281222 () Unit!19729)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37413 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19729)

(assert (=> b!613600 (= lt!281222 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281217 (select (arr!17950 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!613600 (arrayContainsKey!0 lt!281217 (select (arr!17950 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!281224 () Unit!19729)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37413 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11898) Unit!19729)

(assert (=> b!613600 (= lt!281224 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11895))))

(assert (=> b!613600 (arrayNoDuplicates!0 lt!281217 #b00000000000000000000000000000000 Nil!11895)))

(declare-fun lt!281218 () Unit!19729)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37413 (_ BitVec 32) (_ BitVec 32)) Unit!19729)

(assert (=> b!613600 (= lt!281218 (lemmaNoDuplicateFromThenFromBigger!0 lt!281217 #b00000000000000000000000000000000 j!136))))

(assert (=> b!613600 (arrayNoDuplicates!0 lt!281217 j!136 Nil!11895)))

(declare-fun lt!281227 () Unit!19729)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37413 (_ BitVec 64) (_ BitVec 32) List!11898) Unit!19729)

(assert (=> b!613600 (= lt!281227 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!281217 (select (arr!17950 a!2986) j!136) j!136 Nil!11895))))

(assert (=> b!613600 false))

(declare-fun b!613601 () Bool)

(declare-fun res!394912 () Bool)

(assert (=> b!613601 (=> (not res!394912) (not e!351761))))

(assert (=> b!613601 (= res!394912 (validKeyInArray!0 k0!1786))))

(declare-fun b!613602 () Bool)

(declare-fun res!394918 () Bool)

(assert (=> b!613602 (=> (not res!394918) (not e!351756))))

(assert (=> b!613602 (= res!394918 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17950 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!613603 () Bool)

(declare-fun res!394915 () Bool)

(declare-fun e!351753 () Bool)

(assert (=> b!613603 (=> res!394915 e!351753)))

(declare-fun contains!3030 (List!11898 (_ BitVec 64)) Bool)

(assert (=> b!613603 (= res!394915 (contains!3030 Nil!11895 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613604 () Bool)

(declare-fun res!394922 () Bool)

(assert (=> b!613604 (=> res!394922 e!351753)))

(declare-fun noDuplicate!361 (List!11898) Bool)

(assert (=> b!613604 (= res!394922 (not (noDuplicate!361 Nil!11895)))))

(declare-fun b!613605 () Bool)

(declare-fun e!351765 () Bool)

(assert (=> b!613605 (= e!351755 e!351765)))

(declare-fun res!394921 () Bool)

(assert (=> b!613605 (=> res!394921 e!351765)))

(assert (=> b!613605 (= res!394921 (or (not (= (select (arr!17950 a!2986) j!136) lt!281213)) (not (= (select (arr!17950 a!2986) j!136) lt!281229))))))

(assert (=> b!613605 e!351763))

(declare-fun res!394906 () Bool)

(assert (=> b!613605 (=> (not res!394906) (not e!351763))))

(assert (=> b!613605 (= res!394906 (= lt!281229 (select (arr!17950 a!2986) j!136)))))

(assert (=> b!613605 (= lt!281229 (select (store (arr!17950 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!613606 () Bool)

(assert (=> b!613606 (= e!351761 e!351756)))

(declare-fun res!394916 () Bool)

(assert (=> b!613606 (=> (not res!394916) (not e!351756))))

(declare-fun lt!281221 () SeekEntryResult!6346)

(assert (=> b!613606 (= res!394916 (or (= lt!281221 (MissingZero!6346 i!1108)) (= lt!281221 (MissingVacant!6346 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37413 (_ BitVec 32)) SeekEntryResult!6346)

(assert (=> b!613606 (= lt!281221 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!613607 () Bool)

(declare-fun e!351757 () Bool)

(assert (=> b!613607 (= e!351765 e!351757)))

(declare-fun res!394908 () Bool)

(assert (=> b!613607 (=> res!394908 e!351757)))

(assert (=> b!613607 (= res!394908 (bvsge index!984 j!136))))

(declare-fun lt!281220 () Unit!19729)

(assert (=> b!613607 (= lt!281220 e!351768)))

(declare-fun c!69712 () Bool)

(assert (=> b!613607 (= c!69712 (bvslt j!136 index!984))))

(declare-fun b!613608 () Bool)

(declare-fun Unit!19732 () Unit!19729)

(assert (=> b!613608 (= e!351760 Unit!19732)))

(declare-fun e!351754 () Bool)

(declare-fun b!613609 () Bool)

(assert (=> b!613609 (= e!351754 (arrayContainsKey!0 lt!281217 (select (arr!17950 a!2986) j!136) index!984))))

(declare-fun b!613610 () Bool)

(assert (=> b!613610 (= e!351753 true)))

(declare-fun lt!281215 () Bool)

(assert (=> b!613610 (= lt!281215 (contains!3030 Nil!11895 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613611 () Bool)

(declare-fun res!394913 () Bool)

(assert (=> b!613611 (=> (not res!394913) (not e!351761))))

(assert (=> b!613611 (= res!394913 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!613612 () Bool)

(assert (=> b!613612 (= e!351757 e!351753)))

(declare-fun res!394911 () Bool)

(assert (=> b!613612 (=> res!394911 e!351753)))

(assert (=> b!613612 (= res!394911 (or (bvsge (size!18314 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18314 a!2986)) (bvsge index!984 (size!18314 a!2986))))))

(assert (=> b!613612 (arrayNoDuplicates!0 lt!281217 index!984 Nil!11895)))

(declare-fun lt!281214 () Unit!19729)

(assert (=> b!613612 (= lt!281214 (lemmaNoDuplicateFromThenFromBigger!0 lt!281217 #b00000000000000000000000000000000 index!984))))

(assert (=> b!613612 (arrayNoDuplicates!0 lt!281217 #b00000000000000000000000000000000 Nil!11895)))

(declare-fun lt!281226 () Unit!19729)

(assert (=> b!613612 (= lt!281226 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11895))))

(assert (=> b!613612 (arrayContainsKey!0 lt!281217 (select (arr!17950 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!281228 () Unit!19729)

(assert (=> b!613612 (= lt!281228 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281217 (select (arr!17950 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!613612 e!351754))

(declare-fun res!394919 () Bool)

(assert (=> b!613612 (=> (not res!394919) (not e!351754))))

(assert (=> b!613612 (= res!394919 (arrayContainsKey!0 lt!281217 (select (arr!17950 a!2986) j!136) j!136))))

(declare-fun b!613613 () Bool)

(declare-fun Unit!19733 () Unit!19729)

(assert (=> b!613613 (= e!351760 Unit!19733)))

(assert (=> b!613613 false))

(declare-fun b!613614 () Bool)

(assert (=> b!613614 (= e!351766 (arrayContainsKey!0 lt!281217 (select (arr!17950 a!2986) j!136) index!984))))

(declare-fun b!613615 () Bool)

(declare-fun Unit!19734 () Unit!19729)

(assert (=> b!613615 (= e!351768 Unit!19734)))

(declare-fun b!613616 () Bool)

(declare-fun res!394907 () Bool)

(assert (=> b!613616 (=> (not res!394907) (not e!351761))))

(assert (=> b!613616 (= res!394907 (and (= (size!18314 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18314 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18314 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!613617 () Bool)

(assert (=> b!613617 (= e!351762 e!351767)))

(declare-fun res!394914 () Bool)

(assert (=> b!613617 (=> (not res!394914) (not e!351767))))

(declare-fun lt!281219 () SeekEntryResult!6346)

(assert (=> b!613617 (= res!394914 (and (= lt!281219 (Found!6346 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17950 a!2986) index!984) (select (arr!17950 a!2986) j!136))) (not (= (select (arr!17950 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!613617 (= lt!281219 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17950 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!613618 () Bool)

(assert (=> b!613618 (= e!351764 (= lt!281219 lt!281223))))

(assert (= (and start!55998 res!394923) b!613616))

(assert (= (and b!613616 res!394907) b!613593))

(assert (= (and b!613593 res!394925) b!613601))

(assert (= (and b!613601 res!394912) b!613611))

(assert (= (and b!613611 res!394913) b!613606))

(assert (= (and b!613606 res!394916) b!613599))

(assert (= (and b!613599 res!394917) b!613595))

(assert (= (and b!613595 res!394909) b!613602))

(assert (= (and b!613602 res!394918) b!613594))

(assert (= (and b!613594 res!394920) b!613617))

(assert (= (and b!613617 res!394914) b!613596))

(assert (= (and b!613596 res!394924) b!613618))

(assert (= (and b!613596 c!69713) b!613613))

(assert (= (and b!613596 (not c!69713)) b!613608))

(assert (= (and b!613596 (not res!394926)) b!613605))

(assert (= (and b!613605 res!394906) b!613598))

(assert (= (and b!613598 (not res!394927)) b!613597))

(assert (= (and b!613597 res!394910) b!613614))

(assert (= (and b!613605 (not res!394921)) b!613607))

(assert (= (and b!613607 c!69712) b!613600))

(assert (= (and b!613607 (not c!69712)) b!613615))

(assert (= (and b!613607 (not res!394908)) b!613612))

(assert (= (and b!613612 res!394919) b!613609))

(assert (= (and b!613612 (not res!394911)) b!613604))

(assert (= (and b!613604 (not res!394922)) b!613603))

(assert (= (and b!613603 (not res!394915)) b!613610))

(declare-fun m!590159 () Bool)

(assert (=> b!613594 m!590159))

(declare-fun m!590161 () Bool)

(assert (=> b!613594 m!590161))

(declare-fun m!590163 () Bool)

(assert (=> b!613617 m!590163))

(declare-fun m!590165 () Bool)

(assert (=> b!613617 m!590165))

(assert (=> b!613617 m!590165))

(declare-fun m!590167 () Bool)

(assert (=> b!613617 m!590167))

(assert (=> b!613609 m!590165))

(assert (=> b!613609 m!590165))

(declare-fun m!590169 () Bool)

(assert (=> b!613609 m!590169))

(declare-fun m!590171 () Bool)

(assert (=> b!613599 m!590171))

(declare-fun m!590173 () Bool)

(assert (=> b!613611 m!590173))

(assert (=> b!613596 m!590165))

(declare-fun m!590175 () Bool)

(assert (=> b!613596 m!590175))

(declare-fun m!590177 () Bool)

(assert (=> b!613596 m!590177))

(declare-fun m!590179 () Bool)

(assert (=> b!613596 m!590179))

(declare-fun m!590181 () Bool)

(assert (=> b!613596 m!590181))

(assert (=> b!613596 m!590165))

(assert (=> b!613596 m!590159))

(declare-fun m!590183 () Bool)

(assert (=> b!613596 m!590183))

(declare-fun m!590185 () Bool)

(assert (=> b!613596 m!590185))

(declare-fun m!590187 () Bool)

(assert (=> b!613595 m!590187))

(declare-fun m!590189 () Bool)

(assert (=> b!613602 m!590189))

(declare-fun m!590191 () Bool)

(assert (=> b!613604 m!590191))

(assert (=> b!613593 m!590165))

(assert (=> b!613593 m!590165))

(declare-fun m!590193 () Bool)

(assert (=> b!613593 m!590193))

(declare-fun m!590195 () Bool)

(assert (=> b!613610 m!590195))

(assert (=> b!613600 m!590165))

(declare-fun m!590197 () Bool)

(assert (=> b!613600 m!590197))

(assert (=> b!613600 m!590165))

(assert (=> b!613600 m!590165))

(declare-fun m!590199 () Bool)

(assert (=> b!613600 m!590199))

(assert (=> b!613600 m!590165))

(declare-fun m!590201 () Bool)

(assert (=> b!613600 m!590201))

(declare-fun m!590203 () Bool)

(assert (=> b!613600 m!590203))

(declare-fun m!590205 () Bool)

(assert (=> b!613600 m!590205))

(declare-fun m!590207 () Bool)

(assert (=> b!613600 m!590207))

(declare-fun m!590209 () Bool)

(assert (=> b!613600 m!590209))

(assert (=> b!613597 m!590165))

(assert (=> b!613597 m!590165))

(declare-fun m!590211 () Bool)

(assert (=> b!613597 m!590211))

(assert (=> b!613614 m!590165))

(assert (=> b!613614 m!590165))

(assert (=> b!613614 m!590169))

(assert (=> b!613598 m!590165))

(assert (=> b!613605 m!590165))

(assert (=> b!613605 m!590159))

(declare-fun m!590213 () Bool)

(assert (=> b!613605 m!590213))

(declare-fun m!590215 () Bool)

(assert (=> start!55998 m!590215))

(declare-fun m!590217 () Bool)

(assert (=> start!55998 m!590217))

(declare-fun m!590219 () Bool)

(assert (=> b!613603 m!590219))

(assert (=> b!613612 m!590165))

(assert (=> b!613612 m!590165))

(assert (=> b!613612 m!590211))

(assert (=> b!613612 m!590165))

(declare-fun m!590221 () Bool)

(assert (=> b!613612 m!590221))

(assert (=> b!613612 m!590205))

(declare-fun m!590223 () Bool)

(assert (=> b!613612 m!590223))

(assert (=> b!613612 m!590209))

(declare-fun m!590225 () Bool)

(assert (=> b!613612 m!590225))

(assert (=> b!613612 m!590165))

(declare-fun m!590227 () Bool)

(assert (=> b!613612 m!590227))

(declare-fun m!590229 () Bool)

(assert (=> b!613601 m!590229))

(declare-fun m!590231 () Bool)

(assert (=> b!613606 m!590231))

(check-sat (not b!613617) (not b!613595) (not b!613596) (not b!613600) (not b!613599) (not b!613601) (not b!613593) (not b!613606) (not b!613610) (not b!613603) (not b!613612) (not b!613609) (not start!55998) (not b!613611) (not b!613604) (not b!613597) (not b!613614))
(check-sat)
