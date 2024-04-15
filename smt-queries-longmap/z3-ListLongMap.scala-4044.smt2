; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55122 () Bool)

(assert start!55122)

(declare-fun b!603690 () Bool)

(declare-fun e!345367 () Bool)

(assert (=> b!603690 (= e!345367 true)))

(declare-fun e!345378 () Bool)

(assert (=> b!603690 e!345378))

(declare-fun res!387853 () Bool)

(assert (=> b!603690 (=> (not res!387853) (not e!345378))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37209 0))(
  ( (array!37210 (arr!17861 (Array (_ BitVec 32) (_ BitVec 64))) (size!18226 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37209)

(declare-fun lt!275113 () array!37209)

(declare-fun arrayContainsKey!0 (array!37209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603690 (= res!387853 (arrayContainsKey!0 lt!275113 (select (arr!17861 a!2986) j!136) j!136))))

(declare-fun b!603691 () Bool)

(declare-fun res!387842 () Bool)

(declare-fun e!345374 () Bool)

(assert (=> b!603691 (=> (not res!387842) (not e!345374))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!603691 (= res!387842 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603692 () Bool)

(declare-datatypes ((Unit!19170 0))(
  ( (Unit!19171) )
))
(declare-fun e!345371 () Unit!19170)

(declare-fun Unit!19172 () Unit!19170)

(assert (=> b!603692 (= e!345371 Unit!19172)))

(assert (=> b!603692 false))

(declare-fun b!603693 () Bool)

(declare-fun e!345369 () Bool)

(declare-fun e!345368 () Bool)

(assert (=> b!603693 (= e!345369 e!345368)))

(declare-fun res!387854 () Bool)

(assert (=> b!603693 (=> (not res!387854) (not e!345368))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!603693 (= res!387854 (= (select (store (arr!17861 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603693 (= lt!275113 (array!37210 (store (arr!17861 a!2986) i!1108 k0!1786) (size!18226 a!2986)))))

(declare-fun b!603694 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!603694 (= e!345378 (arrayContainsKey!0 lt!275113 (select (arr!17861 a!2986) j!136) index!984))))

(declare-fun b!603695 () Bool)

(declare-fun res!387846 () Bool)

(assert (=> b!603695 (=> (not res!387846) (not e!345369))))

(declare-datatypes ((List!11941 0))(
  ( (Nil!11938) (Cons!11937 (h!12982 (_ BitVec 64)) (t!18160 List!11941)) )
))
(declare-fun arrayNoDuplicates!0 (array!37209 (_ BitVec 32) List!11941) Bool)

(assert (=> b!603695 (= res!387846 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11938))))

(declare-fun b!603696 () Bool)

(declare-fun e!345381 () Bool)

(declare-datatypes ((SeekEntryResult!6298 0))(
  ( (MissingZero!6298 (index!27455 (_ BitVec 32))) (Found!6298 (index!27456 (_ BitVec 32))) (Intermediate!6298 (undefined!7110 Bool) (index!27457 (_ BitVec 32)) (x!56262 (_ BitVec 32))) (Undefined!6298) (MissingVacant!6298 (index!27458 (_ BitVec 32))) )
))
(declare-fun lt!275105 () SeekEntryResult!6298)

(declare-fun lt!275102 () SeekEntryResult!6298)

(assert (=> b!603696 (= e!345381 (= lt!275105 lt!275102))))

(declare-fun b!603697 () Bool)

(declare-fun res!387843 () Bool)

(assert (=> b!603697 (=> (not res!387843) (not e!345374))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!603697 (= res!387843 (and (= (size!18226 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18226 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18226 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!387845 () Bool)

(assert (=> start!55122 (=> (not res!387845) (not e!345374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55122 (= res!387845 (validMask!0 mask!3053))))

(assert (=> start!55122 e!345374))

(assert (=> start!55122 true))

(declare-fun array_inv!13744 (array!37209) Bool)

(assert (=> start!55122 (array_inv!13744 a!2986)))

(declare-fun b!603698 () Bool)

(declare-fun e!345379 () Bool)

(declare-fun e!345370 () Bool)

(assert (=> b!603698 (= e!345379 e!345370)))

(declare-fun res!387847 () Bool)

(assert (=> b!603698 (=> (not res!387847) (not e!345370))))

(assert (=> b!603698 (= res!387847 (arrayContainsKey!0 lt!275113 (select (arr!17861 a!2986) j!136) j!136))))

(declare-fun b!603699 () Bool)

(declare-fun res!387851 () Bool)

(assert (=> b!603699 (=> (not res!387851) (not e!345369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37209 (_ BitVec 32)) Bool)

(assert (=> b!603699 (= res!387851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603700 () Bool)

(assert (=> b!603700 (= e!345370 (arrayContainsKey!0 lt!275113 (select (arr!17861 a!2986) j!136) index!984))))

(declare-fun b!603701 () Bool)

(declare-fun e!345372 () Bool)

(declare-fun e!345373 () Bool)

(assert (=> b!603701 (= e!345372 e!345373)))

(declare-fun res!387844 () Bool)

(assert (=> b!603701 (=> res!387844 e!345373)))

(declare-fun lt!275107 () (_ BitVec 64))

(declare-fun lt!275104 () (_ BitVec 64))

(assert (=> b!603701 (= res!387844 (or (not (= (select (arr!17861 a!2986) j!136) lt!275107)) (not (= (select (arr!17861 a!2986) j!136) lt!275104))))))

(declare-fun e!345376 () Bool)

(assert (=> b!603701 e!345376))

(declare-fun res!387840 () Bool)

(assert (=> b!603701 (=> (not res!387840) (not e!345376))))

(assert (=> b!603701 (= res!387840 (= lt!275104 (select (arr!17861 a!2986) j!136)))))

(assert (=> b!603701 (= lt!275104 (select (store (arr!17861 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!603702 () Bool)

(assert (=> b!603702 (= e!345374 e!345369)))

(declare-fun res!387838 () Bool)

(assert (=> b!603702 (=> (not res!387838) (not e!345369))))

(declare-fun lt!275103 () SeekEntryResult!6298)

(assert (=> b!603702 (= res!387838 (or (= lt!275103 (MissingZero!6298 i!1108)) (= lt!275103 (MissingVacant!6298 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37209 (_ BitVec 32)) SeekEntryResult!6298)

(assert (=> b!603702 (= lt!275103 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!603703 () Bool)

(declare-fun e!345375 () Bool)

(assert (=> b!603703 (= e!345375 (not e!345372))))

(declare-fun res!387848 () Bool)

(assert (=> b!603703 (=> res!387848 e!345372)))

(declare-fun lt!275110 () SeekEntryResult!6298)

(assert (=> b!603703 (= res!387848 (not (= lt!275110 (Found!6298 index!984))))))

(declare-fun lt!275112 () Unit!19170)

(assert (=> b!603703 (= lt!275112 e!345371)))

(declare-fun c!68295 () Bool)

(assert (=> b!603703 (= c!68295 (= lt!275110 Undefined!6298))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37209 (_ BitVec 32)) SeekEntryResult!6298)

(assert (=> b!603703 (= lt!275110 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275107 lt!275113 mask!3053))))

(assert (=> b!603703 e!345381))

(declare-fun res!387836 () Bool)

(assert (=> b!603703 (=> (not res!387836) (not e!345381))))

(declare-fun lt!275099 () (_ BitVec 32))

(assert (=> b!603703 (= res!387836 (= lt!275102 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275099 vacantSpotIndex!68 lt!275107 lt!275113 mask!3053)))))

(assert (=> b!603703 (= lt!275102 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275099 vacantSpotIndex!68 (select (arr!17861 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603703 (= lt!275107 (select (store (arr!17861 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275100 () Unit!19170)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37209 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19170)

(assert (=> b!603703 (= lt!275100 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275099 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603703 (= lt!275099 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!603704 () Bool)

(declare-fun res!387850 () Bool)

(assert (=> b!603704 (=> (not res!387850) (not e!345374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603704 (= res!387850 (validKeyInArray!0 k0!1786))))

(declare-fun b!603705 () Bool)

(assert (=> b!603705 (= e!345368 e!345375)))

(declare-fun res!387841 () Bool)

(assert (=> b!603705 (=> (not res!387841) (not e!345375))))

(assert (=> b!603705 (= res!387841 (and (= lt!275105 (Found!6298 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17861 a!2986) index!984) (select (arr!17861 a!2986) j!136))) (not (= (select (arr!17861 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!603705 (= lt!275105 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17861 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603706 () Bool)

(assert (=> b!603706 (= e!345376 e!345379)))

(declare-fun res!387849 () Bool)

(assert (=> b!603706 (=> res!387849 e!345379)))

(assert (=> b!603706 (= res!387849 (or (not (= (select (arr!17861 a!2986) j!136) lt!275107)) (not (= (select (arr!17861 a!2986) j!136) lt!275104)) (bvsge j!136 index!984)))))

(declare-fun b!603707 () Bool)

(declare-fun Unit!19173 () Unit!19170)

(assert (=> b!603707 (= e!345371 Unit!19173)))

(declare-fun b!603708 () Bool)

(declare-fun e!345377 () Unit!19170)

(declare-fun Unit!19174 () Unit!19170)

(assert (=> b!603708 (= e!345377 Unit!19174)))

(declare-fun lt!275106 () Unit!19170)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37209 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19170)

(assert (=> b!603708 (= lt!275106 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275113 (select (arr!17861 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603708 (arrayContainsKey!0 lt!275113 (select (arr!17861 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275109 () Unit!19170)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37209 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11941) Unit!19170)

(assert (=> b!603708 (= lt!275109 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11938))))

(assert (=> b!603708 (arrayNoDuplicates!0 lt!275113 #b00000000000000000000000000000000 Nil!11938)))

(declare-fun lt!275108 () Unit!19170)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37209 (_ BitVec 32) (_ BitVec 32)) Unit!19170)

(assert (=> b!603708 (= lt!275108 (lemmaNoDuplicateFromThenFromBigger!0 lt!275113 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603708 (arrayNoDuplicates!0 lt!275113 j!136 Nil!11938)))

(declare-fun lt!275111 () Unit!19170)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37209 (_ BitVec 64) (_ BitVec 32) List!11941) Unit!19170)

(assert (=> b!603708 (= lt!275111 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275113 (select (arr!17861 a!2986) j!136) j!136 Nil!11938))))

(assert (=> b!603708 false))

(declare-fun b!603709 () Bool)

(declare-fun res!387837 () Bool)

(assert (=> b!603709 (=> (not res!387837) (not e!345374))))

(assert (=> b!603709 (= res!387837 (validKeyInArray!0 (select (arr!17861 a!2986) j!136)))))

(declare-fun b!603710 () Bool)

(declare-fun res!387852 () Bool)

(assert (=> b!603710 (=> (not res!387852) (not e!345369))))

(assert (=> b!603710 (= res!387852 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17861 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603711 () Bool)

(assert (=> b!603711 (= e!345373 e!345367)))

(declare-fun res!387839 () Bool)

(assert (=> b!603711 (=> res!387839 e!345367)))

(assert (=> b!603711 (= res!387839 (bvsge index!984 j!136))))

(declare-fun lt!275101 () Unit!19170)

(assert (=> b!603711 (= lt!275101 e!345377)))

(declare-fun c!68294 () Bool)

(assert (=> b!603711 (= c!68294 (bvslt j!136 index!984))))

(declare-fun b!603712 () Bool)

(declare-fun Unit!19175 () Unit!19170)

(assert (=> b!603712 (= e!345377 Unit!19175)))

(assert (= (and start!55122 res!387845) b!603697))

(assert (= (and b!603697 res!387843) b!603709))

(assert (= (and b!603709 res!387837) b!603704))

(assert (= (and b!603704 res!387850) b!603691))

(assert (= (and b!603691 res!387842) b!603702))

(assert (= (and b!603702 res!387838) b!603699))

(assert (= (and b!603699 res!387851) b!603695))

(assert (= (and b!603695 res!387846) b!603710))

(assert (= (and b!603710 res!387852) b!603693))

(assert (= (and b!603693 res!387854) b!603705))

(assert (= (and b!603705 res!387841) b!603703))

(assert (= (and b!603703 res!387836) b!603696))

(assert (= (and b!603703 c!68295) b!603692))

(assert (= (and b!603703 (not c!68295)) b!603707))

(assert (= (and b!603703 (not res!387848)) b!603701))

(assert (= (and b!603701 res!387840) b!603706))

(assert (= (and b!603706 (not res!387849)) b!603698))

(assert (= (and b!603698 res!387847) b!603700))

(assert (= (and b!603701 (not res!387844)) b!603711))

(assert (= (and b!603711 c!68294) b!603708))

(assert (= (and b!603711 (not c!68294)) b!603712))

(assert (= (and b!603711 (not res!387839)) b!603690))

(assert (= (and b!603690 res!387853) b!603694))

(declare-fun m!580141 () Bool)

(assert (=> b!603701 m!580141))

(declare-fun m!580143 () Bool)

(assert (=> b!603701 m!580143))

(declare-fun m!580145 () Bool)

(assert (=> b!603701 m!580145))

(assert (=> b!603709 m!580141))

(assert (=> b!603709 m!580141))

(declare-fun m!580147 () Bool)

(assert (=> b!603709 m!580147))

(declare-fun m!580149 () Bool)

(assert (=> b!603703 m!580149))

(declare-fun m!580151 () Bool)

(assert (=> b!603703 m!580151))

(assert (=> b!603703 m!580141))

(assert (=> b!603703 m!580143))

(declare-fun m!580153 () Bool)

(assert (=> b!603703 m!580153))

(declare-fun m!580155 () Bool)

(assert (=> b!603703 m!580155))

(assert (=> b!603703 m!580141))

(declare-fun m!580157 () Bool)

(assert (=> b!603703 m!580157))

(declare-fun m!580159 () Bool)

(assert (=> b!603703 m!580159))

(assert (=> b!603706 m!580141))

(assert (=> b!603693 m!580143))

(declare-fun m!580161 () Bool)

(assert (=> b!603693 m!580161))

(assert (=> b!603708 m!580141))

(declare-fun m!580163 () Bool)

(assert (=> b!603708 m!580163))

(declare-fun m!580165 () Bool)

(assert (=> b!603708 m!580165))

(assert (=> b!603708 m!580141))

(declare-fun m!580167 () Bool)

(assert (=> b!603708 m!580167))

(declare-fun m!580169 () Bool)

(assert (=> b!603708 m!580169))

(assert (=> b!603708 m!580141))

(declare-fun m!580171 () Bool)

(assert (=> b!603708 m!580171))

(declare-fun m!580173 () Bool)

(assert (=> b!603708 m!580173))

(declare-fun m!580175 () Bool)

(assert (=> b!603708 m!580175))

(assert (=> b!603708 m!580141))

(declare-fun m!580177 () Bool)

(assert (=> b!603704 m!580177))

(declare-fun m!580179 () Bool)

(assert (=> b!603702 m!580179))

(declare-fun m!580181 () Bool)

(assert (=> b!603710 m!580181))

(declare-fun m!580183 () Bool)

(assert (=> b!603699 m!580183))

(declare-fun m!580185 () Bool)

(assert (=> b!603695 m!580185))

(assert (=> b!603698 m!580141))

(assert (=> b!603698 m!580141))

(declare-fun m!580187 () Bool)

(assert (=> b!603698 m!580187))

(assert (=> b!603690 m!580141))

(assert (=> b!603690 m!580141))

(assert (=> b!603690 m!580187))

(assert (=> b!603694 m!580141))

(assert (=> b!603694 m!580141))

(declare-fun m!580189 () Bool)

(assert (=> b!603694 m!580189))

(assert (=> b!603700 m!580141))

(assert (=> b!603700 m!580141))

(assert (=> b!603700 m!580189))

(declare-fun m!580191 () Bool)

(assert (=> b!603705 m!580191))

(assert (=> b!603705 m!580141))

(assert (=> b!603705 m!580141))

(declare-fun m!580193 () Bool)

(assert (=> b!603705 m!580193))

(declare-fun m!580195 () Bool)

(assert (=> b!603691 m!580195))

(declare-fun m!580197 () Bool)

(assert (=> start!55122 m!580197))

(declare-fun m!580199 () Bool)

(assert (=> start!55122 m!580199))

(check-sat (not b!603694) (not b!603699) (not b!603703) (not b!603709) (not b!603695) (not b!603704) (not b!603691) (not start!55122) (not b!603708) (not b!603702) (not b!603698) (not b!603690) (not b!603705) (not b!603700))
(check-sat)
