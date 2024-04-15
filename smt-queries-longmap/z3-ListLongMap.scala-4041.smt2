; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55104 () Bool)

(assert start!55104)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!603069 () Bool)

(declare-datatypes ((array!37191 0))(
  ( (array!37192 (arr!17852 (Array (_ BitVec 32) (_ BitVec 64))) (size!18217 (_ BitVec 32))) )
))
(declare-fun lt!274703 () array!37191)

(declare-fun e!344972 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37191)

(declare-fun arrayContainsKey!0 (array!37191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603069 (= e!344972 (arrayContainsKey!0 lt!274703 (select (arr!17852 a!2986) j!136) index!984))))

(declare-fun b!603070 () Bool)

(declare-fun e!344971 () Bool)

(assert (=> b!603070 (= e!344971 true)))

(assert (=> b!603070 e!344972))

(declare-fun res!387337 () Bool)

(assert (=> b!603070 (=> (not res!387337) (not e!344972))))

(assert (=> b!603070 (= res!387337 (arrayContainsKey!0 lt!274703 (select (arr!17852 a!2986) j!136) j!136))))

(declare-fun b!603071 () Bool)

(declare-fun e!344968 () Bool)

(declare-fun e!344963 () Bool)

(assert (=> b!603071 (= e!344968 e!344963)))

(declare-fun res!387326 () Bool)

(assert (=> b!603071 (=> (not res!387326) (not e!344963))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!603071 (= res!387326 (= (select (store (arr!17852 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603071 (= lt!274703 (array!37192 (store (arr!17852 a!2986) i!1108 k0!1786) (size!18217 a!2986)))))

(declare-fun b!603072 () Bool)

(declare-fun res!387336 () Bool)

(assert (=> b!603072 (=> (not res!387336) (not e!344968))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37191 (_ BitVec 32)) Bool)

(assert (=> b!603072 (= res!387336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603073 () Bool)

(declare-fun e!344965 () Bool)

(declare-fun e!344962 () Bool)

(assert (=> b!603073 (= e!344965 (not e!344962))))

(declare-fun res!387341 () Bool)

(assert (=> b!603073 (=> res!387341 e!344962)))

(declare-datatypes ((SeekEntryResult!6289 0))(
  ( (MissingZero!6289 (index!27419 (_ BitVec 32))) (Found!6289 (index!27420 (_ BitVec 32))) (Intermediate!6289 (undefined!7101 Bool) (index!27421 (_ BitVec 32)) (x!56229 (_ BitVec 32))) (Undefined!6289) (MissingVacant!6289 (index!27422 (_ BitVec 32))) )
))
(declare-fun lt!274699 () SeekEntryResult!6289)

(assert (=> b!603073 (= res!387341 (not (= lt!274699 (Found!6289 index!984))))))

(declare-datatypes ((Unit!19116 0))(
  ( (Unit!19117) )
))
(declare-fun lt!274701 () Unit!19116)

(declare-fun e!344976 () Unit!19116)

(assert (=> b!603073 (= lt!274701 e!344976)))

(declare-fun c!68241 () Bool)

(assert (=> b!603073 (= c!68241 (= lt!274699 Undefined!6289))))

(declare-fun lt!274700 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37191 (_ BitVec 32)) SeekEntryResult!6289)

(assert (=> b!603073 (= lt!274699 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274700 lt!274703 mask!3053))))

(declare-fun e!344975 () Bool)

(assert (=> b!603073 e!344975))

(declare-fun res!387330 () Bool)

(assert (=> b!603073 (=> (not res!387330) (not e!344975))))

(declare-fun lt!274706 () (_ BitVec 32))

(declare-fun lt!274698 () SeekEntryResult!6289)

(assert (=> b!603073 (= res!387330 (= lt!274698 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274706 vacantSpotIndex!68 lt!274700 lt!274703 mask!3053)))))

(assert (=> b!603073 (= lt!274698 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274706 vacantSpotIndex!68 (select (arr!17852 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603073 (= lt!274700 (select (store (arr!17852 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!274697 () Unit!19116)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37191 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19116)

(assert (=> b!603073 (= lt!274697 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274706 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603073 (= lt!274706 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!387325 () Bool)

(declare-fun e!344966 () Bool)

(assert (=> start!55104 (=> (not res!387325) (not e!344966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55104 (= res!387325 (validMask!0 mask!3053))))

(assert (=> start!55104 e!344966))

(assert (=> start!55104 true))

(declare-fun array_inv!13735 (array!37191) Bool)

(assert (=> start!55104 (array_inv!13735 a!2986)))

(declare-fun b!603074 () Bool)

(assert (=> b!603074 (= e!344963 e!344965)))

(declare-fun res!387332 () Bool)

(assert (=> b!603074 (=> (not res!387332) (not e!344965))))

(declare-fun lt!274708 () SeekEntryResult!6289)

(assert (=> b!603074 (= res!387332 (and (= lt!274708 (Found!6289 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17852 a!2986) index!984) (select (arr!17852 a!2986) j!136))) (not (= (select (arr!17852 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!603074 (= lt!274708 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17852 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603075 () Bool)

(declare-fun res!387339 () Bool)

(assert (=> b!603075 (=> (not res!387339) (not e!344966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603075 (= res!387339 (validKeyInArray!0 (select (arr!17852 a!2986) j!136)))))

(declare-fun b!603076 () Bool)

(declare-fun e!344973 () Bool)

(declare-fun e!344974 () Bool)

(assert (=> b!603076 (= e!344973 e!344974)))

(declare-fun res!387338 () Bool)

(assert (=> b!603076 (=> (not res!387338) (not e!344974))))

(assert (=> b!603076 (= res!387338 (arrayContainsKey!0 lt!274703 (select (arr!17852 a!2986) j!136) j!136))))

(declare-fun b!603077 () Bool)

(assert (=> b!603077 (= e!344975 (= lt!274708 lt!274698))))

(declare-fun b!603078 () Bool)

(declare-fun e!344967 () Bool)

(assert (=> b!603078 (= e!344967 e!344971)))

(declare-fun res!387335 () Bool)

(assert (=> b!603078 (=> res!387335 e!344971)))

(assert (=> b!603078 (= res!387335 (bvsge index!984 j!136))))

(declare-fun lt!274705 () Unit!19116)

(declare-fun e!344970 () Unit!19116)

(assert (=> b!603078 (= lt!274705 e!344970)))

(declare-fun c!68240 () Bool)

(assert (=> b!603078 (= c!68240 (bvslt j!136 index!984))))

(declare-fun b!603079 () Bool)

(declare-fun res!387333 () Bool)

(assert (=> b!603079 (=> (not res!387333) (not e!344968))))

(declare-datatypes ((List!11932 0))(
  ( (Nil!11929) (Cons!11928 (h!12973 (_ BitVec 64)) (t!18151 List!11932)) )
))
(declare-fun arrayNoDuplicates!0 (array!37191 (_ BitVec 32) List!11932) Bool)

(assert (=> b!603079 (= res!387333 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11929))))

(declare-fun b!603080 () Bool)

(declare-fun res!387331 () Bool)

(assert (=> b!603080 (=> (not res!387331) (not e!344966))))

(assert (=> b!603080 (= res!387331 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603081 () Bool)

(declare-fun Unit!19118 () Unit!19116)

(assert (=> b!603081 (= e!344970 Unit!19118)))

(declare-fun lt!274704 () Unit!19116)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37191 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19116)

(assert (=> b!603081 (= lt!274704 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274703 (select (arr!17852 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603081 (arrayContainsKey!0 lt!274703 (select (arr!17852 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274694 () Unit!19116)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37191 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11932) Unit!19116)

(assert (=> b!603081 (= lt!274694 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11929))))

(assert (=> b!603081 (arrayNoDuplicates!0 lt!274703 #b00000000000000000000000000000000 Nil!11929)))

(declare-fun lt!274696 () Unit!19116)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37191 (_ BitVec 32) (_ BitVec 32)) Unit!19116)

(assert (=> b!603081 (= lt!274696 (lemmaNoDuplicateFromThenFromBigger!0 lt!274703 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603081 (arrayNoDuplicates!0 lt!274703 j!136 Nil!11929)))

(declare-fun lt!274707 () Unit!19116)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37191 (_ BitVec 64) (_ BitVec 32) List!11932) Unit!19116)

(assert (=> b!603081 (= lt!274707 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274703 (select (arr!17852 a!2986) j!136) j!136 Nil!11929))))

(assert (=> b!603081 false))

(declare-fun b!603082 () Bool)

(assert (=> b!603082 (= e!344966 e!344968)))

(declare-fun res!387340 () Bool)

(assert (=> b!603082 (=> (not res!387340) (not e!344968))))

(declare-fun lt!274702 () SeekEntryResult!6289)

(assert (=> b!603082 (= res!387340 (or (= lt!274702 (MissingZero!6289 i!1108)) (= lt!274702 (MissingVacant!6289 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37191 (_ BitVec 32)) SeekEntryResult!6289)

(assert (=> b!603082 (= lt!274702 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!603083 () Bool)

(declare-fun Unit!19119 () Unit!19116)

(assert (=> b!603083 (= e!344976 Unit!19119)))

(declare-fun b!603084 () Bool)

(declare-fun Unit!19120 () Unit!19116)

(assert (=> b!603084 (= e!344976 Unit!19120)))

(assert (=> b!603084 false))

(declare-fun b!603085 () Bool)

(assert (=> b!603085 (= e!344962 e!344967)))

(declare-fun res!387328 () Bool)

(assert (=> b!603085 (=> res!387328 e!344967)))

(declare-fun lt!274695 () (_ BitVec 64))

(assert (=> b!603085 (= res!387328 (or (not (= (select (arr!17852 a!2986) j!136) lt!274700)) (not (= (select (arr!17852 a!2986) j!136) lt!274695))))))

(declare-fun e!344969 () Bool)

(assert (=> b!603085 e!344969))

(declare-fun res!387324 () Bool)

(assert (=> b!603085 (=> (not res!387324) (not e!344969))))

(assert (=> b!603085 (= res!387324 (= lt!274695 (select (arr!17852 a!2986) j!136)))))

(assert (=> b!603085 (= lt!274695 (select (store (arr!17852 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!603086 () Bool)

(declare-fun res!387334 () Bool)

(assert (=> b!603086 (=> (not res!387334) (not e!344966))))

(assert (=> b!603086 (= res!387334 (and (= (size!18217 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18217 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18217 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603087 () Bool)

(assert (=> b!603087 (= e!344969 e!344973)))

(declare-fun res!387323 () Bool)

(assert (=> b!603087 (=> res!387323 e!344973)))

(assert (=> b!603087 (= res!387323 (or (not (= (select (arr!17852 a!2986) j!136) lt!274700)) (not (= (select (arr!17852 a!2986) j!136) lt!274695)) (bvsge j!136 index!984)))))

(declare-fun b!603088 () Bool)

(declare-fun Unit!19121 () Unit!19116)

(assert (=> b!603088 (= e!344970 Unit!19121)))

(declare-fun b!603089 () Bool)

(declare-fun res!387327 () Bool)

(assert (=> b!603089 (=> (not res!387327) (not e!344968))))

(assert (=> b!603089 (= res!387327 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17852 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603090 () Bool)

(declare-fun res!387329 () Bool)

(assert (=> b!603090 (=> (not res!387329) (not e!344966))))

(assert (=> b!603090 (= res!387329 (validKeyInArray!0 k0!1786))))

(declare-fun b!603091 () Bool)

(assert (=> b!603091 (= e!344974 (arrayContainsKey!0 lt!274703 (select (arr!17852 a!2986) j!136) index!984))))

(assert (= (and start!55104 res!387325) b!603086))

(assert (= (and b!603086 res!387334) b!603075))

(assert (= (and b!603075 res!387339) b!603090))

(assert (= (and b!603090 res!387329) b!603080))

(assert (= (and b!603080 res!387331) b!603082))

(assert (= (and b!603082 res!387340) b!603072))

(assert (= (and b!603072 res!387336) b!603079))

(assert (= (and b!603079 res!387333) b!603089))

(assert (= (and b!603089 res!387327) b!603071))

(assert (= (and b!603071 res!387326) b!603074))

(assert (= (and b!603074 res!387332) b!603073))

(assert (= (and b!603073 res!387330) b!603077))

(assert (= (and b!603073 c!68241) b!603084))

(assert (= (and b!603073 (not c!68241)) b!603083))

(assert (= (and b!603073 (not res!387341)) b!603085))

(assert (= (and b!603085 res!387324) b!603087))

(assert (= (and b!603087 (not res!387323)) b!603076))

(assert (= (and b!603076 res!387338) b!603091))

(assert (= (and b!603085 (not res!387328)) b!603078))

(assert (= (and b!603078 c!68240) b!603081))

(assert (= (and b!603078 (not c!68240)) b!603088))

(assert (= (and b!603078 (not res!387335)) b!603070))

(assert (= (and b!603070 res!387337) b!603069))

(declare-fun m!579601 () Bool)

(assert (=> b!603090 m!579601))

(declare-fun m!579603 () Bool)

(assert (=> b!603082 m!579603))

(declare-fun m!579605 () Bool)

(assert (=> b!603073 m!579605))

(declare-fun m!579607 () Bool)

(assert (=> b!603073 m!579607))

(declare-fun m!579609 () Bool)

(assert (=> b!603073 m!579609))

(declare-fun m!579611 () Bool)

(assert (=> b!603073 m!579611))

(declare-fun m!579613 () Bool)

(assert (=> b!603073 m!579613))

(declare-fun m!579615 () Bool)

(assert (=> b!603073 m!579615))

(declare-fun m!579617 () Bool)

(assert (=> b!603073 m!579617))

(assert (=> b!603073 m!579611))

(declare-fun m!579619 () Bool)

(assert (=> b!603073 m!579619))

(assert (=> b!603075 m!579611))

(assert (=> b!603075 m!579611))

(declare-fun m!579621 () Bool)

(assert (=> b!603075 m!579621))

(assert (=> b!603070 m!579611))

(assert (=> b!603070 m!579611))

(declare-fun m!579623 () Bool)

(assert (=> b!603070 m!579623))

(assert (=> b!603081 m!579611))

(declare-fun m!579625 () Bool)

(assert (=> b!603081 m!579625))

(assert (=> b!603081 m!579611))

(declare-fun m!579627 () Bool)

(assert (=> b!603081 m!579627))

(declare-fun m!579629 () Bool)

(assert (=> b!603081 m!579629))

(declare-fun m!579631 () Bool)

(assert (=> b!603081 m!579631))

(assert (=> b!603081 m!579611))

(declare-fun m!579633 () Bool)

(assert (=> b!603081 m!579633))

(declare-fun m!579635 () Bool)

(assert (=> b!603081 m!579635))

(assert (=> b!603081 m!579611))

(declare-fun m!579637 () Bool)

(assert (=> b!603081 m!579637))

(declare-fun m!579639 () Bool)

(assert (=> b!603072 m!579639))

(assert (=> b!603076 m!579611))

(assert (=> b!603076 m!579611))

(assert (=> b!603076 m!579623))

(assert (=> b!603087 m!579611))

(declare-fun m!579641 () Bool)

(assert (=> start!55104 m!579641))

(declare-fun m!579643 () Bool)

(assert (=> start!55104 m!579643))

(assert (=> b!603085 m!579611))

(assert (=> b!603085 m!579613))

(declare-fun m!579645 () Bool)

(assert (=> b!603085 m!579645))

(assert (=> b!603071 m!579613))

(declare-fun m!579647 () Bool)

(assert (=> b!603071 m!579647))

(assert (=> b!603069 m!579611))

(assert (=> b!603069 m!579611))

(declare-fun m!579649 () Bool)

(assert (=> b!603069 m!579649))

(declare-fun m!579651 () Bool)

(assert (=> b!603089 m!579651))

(assert (=> b!603091 m!579611))

(assert (=> b!603091 m!579611))

(assert (=> b!603091 m!579649))

(declare-fun m!579653 () Bool)

(assert (=> b!603079 m!579653))

(declare-fun m!579655 () Bool)

(assert (=> b!603074 m!579655))

(assert (=> b!603074 m!579611))

(assert (=> b!603074 m!579611))

(declare-fun m!579657 () Bool)

(assert (=> b!603074 m!579657))

(declare-fun m!579659 () Bool)

(assert (=> b!603080 m!579659))

(check-sat (not start!55104) (not b!603076) (not b!603069) (not b!603081) (not b!603080) (not b!603070) (not b!603073) (not b!603090) (not b!603075) (not b!603072) (not b!603079) (not b!603074) (not b!603091) (not b!603082))
(check-sat)
