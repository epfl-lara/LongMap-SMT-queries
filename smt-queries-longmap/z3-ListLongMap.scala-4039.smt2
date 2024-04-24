; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55158 () Bool)

(assert start!55158)

(declare-datatypes ((array!37176 0))(
  ( (array!37177 (arr!17842 (Array (_ BitVec 32) (_ BitVec 64))) (size!18206 (_ BitVec 32))) )
))
(declare-fun lt!274772 () array!37176)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!345004 () Bool)

(declare-fun b!603135 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37176)

(declare-fun arrayContainsKey!0 (array!37176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603135 (= e!345004 (arrayContainsKey!0 lt!274772 (select (arr!17842 a!2986) j!136) index!984))))

(declare-fun b!603136 () Bool)

(declare-fun e!344997 () Bool)

(assert (=> b!603136 (= e!344997 e!345004)))

(declare-fun res!387219 () Bool)

(assert (=> b!603136 (=> (not res!387219) (not e!345004))))

(assert (=> b!603136 (= res!387219 (arrayContainsKey!0 lt!274772 (select (arr!17842 a!2986) j!136) j!136))))

(declare-fun b!603137 () Bool)

(declare-fun e!345000 () Bool)

(declare-fun e!345008 () Bool)

(assert (=> b!603137 (= e!345000 e!345008)))

(declare-fun res!387230 () Bool)

(assert (=> b!603137 (=> res!387230 e!345008)))

(declare-fun lt!274768 () (_ BitVec 64))

(declare-fun lt!274762 () (_ BitVec 64))

(assert (=> b!603137 (= res!387230 (or (not (= (select (arr!17842 a!2986) j!136) lt!274768)) (not (= (select (arr!17842 a!2986) j!136) lt!274762))))))

(declare-fun e!345007 () Bool)

(assert (=> b!603137 e!345007))

(declare-fun res!387225 () Bool)

(assert (=> b!603137 (=> (not res!387225) (not e!345007))))

(assert (=> b!603137 (= res!387225 (= lt!274762 (select (arr!17842 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!603137 (= lt!274762 (select (store (arr!17842 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!603138 () Bool)

(declare-datatypes ((Unit!19081 0))(
  ( (Unit!19082) )
))
(declare-fun e!345002 () Unit!19081)

(declare-fun Unit!19083 () Unit!19081)

(assert (=> b!603138 (= e!345002 Unit!19083)))

(declare-fun res!387231 () Bool)

(declare-fun e!345005 () Bool)

(assert (=> start!55158 (=> (not res!387231) (not e!345005))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55158 (= res!387231 (validMask!0 mask!3053))))

(assert (=> start!55158 e!345005))

(assert (=> start!55158 true))

(declare-fun array_inv!13701 (array!37176) Bool)

(assert (=> start!55158 (array_inv!13701 a!2986)))

(declare-fun b!603139 () Bool)

(declare-fun res!387217 () Bool)

(assert (=> b!603139 (=> (not res!387217) (not e!345005))))

(assert (=> b!603139 (= res!387217 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603140 () Bool)

(declare-fun e!344999 () Bool)

(assert (=> b!603140 (= e!345005 e!344999)))

(declare-fun res!387215 () Bool)

(assert (=> b!603140 (=> (not res!387215) (not e!344999))))

(declare-datatypes ((SeekEntryResult!6238 0))(
  ( (MissingZero!6238 (index!27215 (_ BitVec 32))) (Found!6238 (index!27216 (_ BitVec 32))) (Intermediate!6238 (undefined!7050 Bool) (index!27217 (_ BitVec 32)) (x!56170 (_ BitVec 32))) (Undefined!6238) (MissingVacant!6238 (index!27218 (_ BitVec 32))) )
))
(declare-fun lt!274764 () SeekEntryResult!6238)

(assert (=> b!603140 (= res!387215 (or (= lt!274764 (MissingZero!6238 i!1108)) (= lt!274764 (MissingVacant!6238 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37176 (_ BitVec 32)) SeekEntryResult!6238)

(assert (=> b!603140 (= lt!274764 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!603141 () Bool)

(declare-fun res!387228 () Bool)

(assert (=> b!603141 (=> (not res!387228) (not e!345005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603141 (= res!387228 (validKeyInArray!0 (select (arr!17842 a!2986) j!136)))))

(declare-fun b!603142 () Bool)

(declare-fun e!345001 () Unit!19081)

(declare-fun Unit!19084 () Unit!19081)

(assert (=> b!603142 (= e!345001 Unit!19084)))

(declare-fun lt!274761 () Unit!19081)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37176 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19081)

(assert (=> b!603142 (= lt!274761 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274772 (select (arr!17842 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603142 (arrayContainsKey!0 lt!274772 (select (arr!17842 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274769 () Unit!19081)

(declare-datatypes ((List!11790 0))(
  ( (Nil!11787) (Cons!11786 (h!12834 (_ BitVec 64)) (t!18010 List!11790)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37176 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11790) Unit!19081)

(assert (=> b!603142 (= lt!274769 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11787))))

(declare-fun arrayNoDuplicates!0 (array!37176 (_ BitVec 32) List!11790) Bool)

(assert (=> b!603142 (arrayNoDuplicates!0 lt!274772 #b00000000000000000000000000000000 Nil!11787)))

(declare-fun lt!274763 () Unit!19081)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37176 (_ BitVec 32) (_ BitVec 32)) Unit!19081)

(assert (=> b!603142 (= lt!274763 (lemmaNoDuplicateFromThenFromBigger!0 lt!274772 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603142 (arrayNoDuplicates!0 lt!274772 j!136 Nil!11787)))

(declare-fun lt!274767 () Unit!19081)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37176 (_ BitVec 64) (_ BitVec 32) List!11790) Unit!19081)

(assert (=> b!603142 (= lt!274767 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274772 (select (arr!17842 a!2986) j!136) j!136 Nil!11787))))

(assert (=> b!603142 false))

(declare-fun b!603143 () Bool)

(declare-fun res!387226 () Bool)

(assert (=> b!603143 (=> (not res!387226) (not e!345005))))

(assert (=> b!603143 (= res!387226 (validKeyInArray!0 k0!1786))))

(declare-fun b!603144 () Bool)

(declare-fun res!387232 () Bool)

(assert (=> b!603144 (=> (not res!387232) (not e!345005))))

(assert (=> b!603144 (= res!387232 (and (= (size!18206 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18206 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18206 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603145 () Bool)

(assert (=> b!603145 (= e!345007 e!344997)))

(declare-fun res!387220 () Bool)

(assert (=> b!603145 (=> res!387220 e!344997)))

(assert (=> b!603145 (= res!387220 (or (not (= (select (arr!17842 a!2986) j!136) lt!274768)) (not (= (select (arr!17842 a!2986) j!136) lt!274762)) (bvsge j!136 index!984)))))

(declare-fun b!603146 () Bool)

(declare-fun Unit!19085 () Unit!19081)

(assert (=> b!603146 (= e!345002 Unit!19085)))

(assert (=> b!603146 false))

(declare-fun b!603147 () Bool)

(declare-fun res!387224 () Bool)

(assert (=> b!603147 (=> (not res!387224) (not e!344999))))

(assert (=> b!603147 (= res!387224 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11787))))

(declare-fun e!344998 () Bool)

(declare-fun b!603148 () Bool)

(assert (=> b!603148 (= e!344998 (arrayContainsKey!0 lt!274772 (select (arr!17842 a!2986) j!136) index!984))))

(declare-fun b!603149 () Bool)

(declare-fun e!344996 () Bool)

(declare-fun e!345003 () Bool)

(assert (=> b!603149 (= e!344996 e!345003)))

(declare-fun res!387227 () Bool)

(assert (=> b!603149 (=> (not res!387227) (not e!345003))))

(declare-fun lt!274774 () SeekEntryResult!6238)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!603149 (= res!387227 (and (= lt!274774 (Found!6238 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17842 a!2986) index!984) (select (arr!17842 a!2986) j!136))) (not (= (select (arr!17842 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37176 (_ BitVec 32)) SeekEntryResult!6238)

(assert (=> b!603149 (= lt!274774 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17842 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603150 () Bool)

(declare-fun e!345006 () Bool)

(declare-fun lt!274773 () SeekEntryResult!6238)

(assert (=> b!603150 (= e!345006 (= lt!274774 lt!274773))))

(declare-fun b!603151 () Bool)

(declare-fun e!344995 () Bool)

(assert (=> b!603151 (= e!345008 e!344995)))

(declare-fun res!387216 () Bool)

(assert (=> b!603151 (=> res!387216 e!344995)))

(assert (=> b!603151 (= res!387216 (bvsge index!984 j!136))))

(declare-fun lt!274771 () Unit!19081)

(assert (=> b!603151 (= lt!274771 e!345001)))

(declare-fun c!68330 () Bool)

(assert (=> b!603151 (= c!68330 (bvslt j!136 index!984))))

(declare-fun b!603152 () Bool)

(declare-fun res!387214 () Bool)

(assert (=> b!603152 (=> (not res!387214) (not e!344999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37176 (_ BitVec 32)) Bool)

(assert (=> b!603152 (= res!387214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603153 () Bool)

(assert (=> b!603153 (= e!345003 (not e!345000))))

(declare-fun res!387221 () Bool)

(assert (=> b!603153 (=> res!387221 e!345000)))

(declare-fun lt!274760 () SeekEntryResult!6238)

(assert (=> b!603153 (= res!387221 (not (= lt!274760 (Found!6238 index!984))))))

(declare-fun lt!274765 () Unit!19081)

(assert (=> b!603153 (= lt!274765 e!345002)))

(declare-fun c!68329 () Bool)

(assert (=> b!603153 (= c!68329 (= lt!274760 Undefined!6238))))

(assert (=> b!603153 (= lt!274760 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274768 lt!274772 mask!3053))))

(assert (=> b!603153 e!345006))

(declare-fun res!387223 () Bool)

(assert (=> b!603153 (=> (not res!387223) (not e!345006))))

(declare-fun lt!274770 () (_ BitVec 32))

(assert (=> b!603153 (= res!387223 (= lt!274773 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274770 vacantSpotIndex!68 lt!274768 lt!274772 mask!3053)))))

(assert (=> b!603153 (= lt!274773 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274770 vacantSpotIndex!68 (select (arr!17842 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603153 (= lt!274768 (select (store (arr!17842 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!274766 () Unit!19081)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37176 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19081)

(assert (=> b!603153 (= lt!274766 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274770 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603153 (= lt!274770 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!603154 () Bool)

(assert (=> b!603154 (= e!344995 true)))

(assert (=> b!603154 e!344998))

(declare-fun res!387229 () Bool)

(assert (=> b!603154 (=> (not res!387229) (not e!344998))))

(assert (=> b!603154 (= res!387229 (arrayContainsKey!0 lt!274772 (select (arr!17842 a!2986) j!136) j!136))))

(declare-fun b!603155 () Bool)

(assert (=> b!603155 (= e!344999 e!344996)))

(declare-fun res!387222 () Bool)

(assert (=> b!603155 (=> (not res!387222) (not e!344996))))

(assert (=> b!603155 (= res!387222 (= (select (store (arr!17842 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603155 (= lt!274772 (array!37177 (store (arr!17842 a!2986) i!1108 k0!1786) (size!18206 a!2986)))))

(declare-fun b!603156 () Bool)

(declare-fun Unit!19086 () Unit!19081)

(assert (=> b!603156 (= e!345001 Unit!19086)))

(declare-fun b!603157 () Bool)

(declare-fun res!387218 () Bool)

(assert (=> b!603157 (=> (not res!387218) (not e!344999))))

(assert (=> b!603157 (= res!387218 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17842 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!55158 res!387231) b!603144))

(assert (= (and b!603144 res!387232) b!603141))

(assert (= (and b!603141 res!387228) b!603143))

(assert (= (and b!603143 res!387226) b!603139))

(assert (= (and b!603139 res!387217) b!603140))

(assert (= (and b!603140 res!387215) b!603152))

(assert (= (and b!603152 res!387214) b!603147))

(assert (= (and b!603147 res!387224) b!603157))

(assert (= (and b!603157 res!387218) b!603155))

(assert (= (and b!603155 res!387222) b!603149))

(assert (= (and b!603149 res!387227) b!603153))

(assert (= (and b!603153 res!387223) b!603150))

(assert (= (and b!603153 c!68329) b!603146))

(assert (= (and b!603153 (not c!68329)) b!603138))

(assert (= (and b!603153 (not res!387221)) b!603137))

(assert (= (and b!603137 res!387225) b!603145))

(assert (= (and b!603145 (not res!387220)) b!603136))

(assert (= (and b!603136 res!387219) b!603135))

(assert (= (and b!603137 (not res!387230)) b!603151))

(assert (= (and b!603151 c!68330) b!603142))

(assert (= (and b!603151 (not c!68330)) b!603156))

(assert (= (and b!603151 (not res!387216)) b!603154))

(assert (= (and b!603154 res!387229) b!603148))

(declare-fun m!580457 () Bool)

(assert (=> b!603141 m!580457))

(assert (=> b!603141 m!580457))

(declare-fun m!580459 () Bool)

(assert (=> b!603141 m!580459))

(assert (=> b!603135 m!580457))

(assert (=> b!603135 m!580457))

(declare-fun m!580461 () Bool)

(assert (=> b!603135 m!580461))

(declare-fun m!580463 () Bool)

(assert (=> b!603143 m!580463))

(declare-fun m!580465 () Bool)

(assert (=> b!603139 m!580465))

(declare-fun m!580467 () Bool)

(assert (=> b!603157 m!580467))

(assert (=> b!603137 m!580457))

(declare-fun m!580469 () Bool)

(assert (=> b!603137 m!580469))

(declare-fun m!580471 () Bool)

(assert (=> b!603137 m!580471))

(declare-fun m!580473 () Bool)

(assert (=> b!603153 m!580473))

(declare-fun m!580475 () Bool)

(assert (=> b!603153 m!580475))

(declare-fun m!580477 () Bool)

(assert (=> b!603153 m!580477))

(assert (=> b!603153 m!580457))

(assert (=> b!603153 m!580469))

(assert (=> b!603153 m!580457))

(declare-fun m!580479 () Bool)

(assert (=> b!603153 m!580479))

(declare-fun m!580481 () Bool)

(assert (=> b!603153 m!580481))

(declare-fun m!580483 () Bool)

(assert (=> b!603153 m!580483))

(declare-fun m!580485 () Bool)

(assert (=> b!603142 m!580485))

(assert (=> b!603142 m!580457))

(declare-fun m!580487 () Bool)

(assert (=> b!603142 m!580487))

(assert (=> b!603142 m!580457))

(declare-fun m!580489 () Bool)

(assert (=> b!603142 m!580489))

(assert (=> b!603142 m!580457))

(declare-fun m!580491 () Bool)

(assert (=> b!603142 m!580491))

(declare-fun m!580493 () Bool)

(assert (=> b!603142 m!580493))

(assert (=> b!603142 m!580457))

(declare-fun m!580495 () Bool)

(assert (=> b!603142 m!580495))

(declare-fun m!580497 () Bool)

(assert (=> b!603142 m!580497))

(declare-fun m!580499 () Bool)

(assert (=> start!55158 m!580499))

(declare-fun m!580501 () Bool)

(assert (=> start!55158 m!580501))

(assert (=> b!603145 m!580457))

(declare-fun m!580503 () Bool)

(assert (=> b!603147 m!580503))

(declare-fun m!580505 () Bool)

(assert (=> b!603152 m!580505))

(assert (=> b!603155 m!580469))

(declare-fun m!580507 () Bool)

(assert (=> b!603155 m!580507))

(declare-fun m!580509 () Bool)

(assert (=> b!603140 m!580509))

(assert (=> b!603148 m!580457))

(assert (=> b!603148 m!580457))

(assert (=> b!603148 m!580461))

(assert (=> b!603154 m!580457))

(assert (=> b!603154 m!580457))

(declare-fun m!580511 () Bool)

(assert (=> b!603154 m!580511))

(assert (=> b!603136 m!580457))

(assert (=> b!603136 m!580457))

(assert (=> b!603136 m!580511))

(declare-fun m!580513 () Bool)

(assert (=> b!603149 m!580513))

(assert (=> b!603149 m!580457))

(assert (=> b!603149 m!580457))

(declare-fun m!580515 () Bool)

(assert (=> b!603149 m!580515))

(check-sat (not b!603142) (not start!55158) (not b!603152) (not b!603147) (not b!603140) (not b!603135) (not b!603136) (not b!603141) (not b!603154) (not b!603153) (not b!603148) (not b!603149) (not b!603143) (not b!603139))
(check-sat)
