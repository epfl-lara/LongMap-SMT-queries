; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58330 () Bool)

(assert start!58330)

(declare-fun b!644143 () Bool)

(declare-fun e!369044 () Bool)

(declare-fun e!369036 () Bool)

(assert (=> b!644143 (= e!369044 (not e!369036))))

(declare-fun res!417268 () Bool)

(assert (=> b!644143 (=> res!417268 e!369036)))

(declare-datatypes ((SeekEntryResult!6867 0))(
  ( (MissingZero!6867 (index!29800 (_ BitVec 32))) (Found!6867 (index!29801 (_ BitVec 32))) (Intermediate!6867 (undefined!7679 Bool) (index!29802 (_ BitVec 32)) (x!58571 (_ BitVec 32))) (Undefined!6867) (MissingVacant!6867 (index!29803 (_ BitVec 32))) )
))
(declare-fun lt!298515 () SeekEntryResult!6867)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!644143 (= res!417268 (not (= lt!298515 (Found!6867 index!984))))))

(declare-datatypes ((Unit!21828 0))(
  ( (Unit!21829) )
))
(declare-fun lt!298511 () Unit!21828)

(declare-fun e!369039 () Unit!21828)

(assert (=> b!644143 (= lt!298511 e!369039)))

(declare-fun c!73808 () Bool)

(assert (=> b!644143 (= c!73808 (= lt!298515 Undefined!6867))))

(declare-fun lt!298508 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!38427 0))(
  ( (array!38428 (arr!18427 (Array (_ BitVec 32) (_ BitVec 64))) (size!18791 (_ BitVec 32))) )
))
(declare-fun lt!298521 () array!38427)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38427 (_ BitVec 32)) SeekEntryResult!6867)

(assert (=> b!644143 (= lt!298515 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298508 lt!298521 mask!3053))))

(declare-fun e!369043 () Bool)

(assert (=> b!644143 e!369043))

(declare-fun res!417281 () Bool)

(assert (=> b!644143 (=> (not res!417281) (not e!369043))))

(declare-fun lt!298510 () (_ BitVec 32))

(declare-fun lt!298509 () SeekEntryResult!6867)

(assert (=> b!644143 (= res!417281 (= lt!298509 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298510 vacantSpotIndex!68 lt!298508 lt!298521 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38427)

(assert (=> b!644143 (= lt!298509 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298510 vacantSpotIndex!68 (select (arr!18427 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!644143 (= lt!298508 (select (store (arr!18427 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!298519 () Unit!21828)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21828)

(assert (=> b!644143 (= lt!298519 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298510 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!644143 (= lt!298510 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!644144 () Bool)

(declare-fun e!369045 () Bool)

(declare-fun arrayContainsKey!0 (array!38427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!644144 (= e!369045 (arrayContainsKey!0 lt!298521 (select (arr!18427 a!2986) j!136) index!984))))

(declare-fun b!644145 () Bool)

(declare-fun e!369038 () Bool)

(declare-fun e!369033 () Bool)

(assert (=> b!644145 (= e!369038 e!369033)))

(declare-fun res!417276 () Bool)

(assert (=> b!644145 (=> (not res!417276) (not e!369033))))

(declare-fun lt!298513 () SeekEntryResult!6867)

(assert (=> b!644145 (= res!417276 (or (= lt!298513 (MissingZero!6867 i!1108)) (= lt!298513 (MissingVacant!6867 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38427 (_ BitVec 32)) SeekEntryResult!6867)

(assert (=> b!644145 (= lt!298513 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!644147 () Bool)

(declare-fun e!369042 () Bool)

(declare-fun e!369032 () Bool)

(assert (=> b!644147 (= e!369042 e!369032)))

(declare-fun res!417278 () Bool)

(assert (=> b!644147 (=> (not res!417278) (not e!369032))))

(assert (=> b!644147 (= res!417278 (arrayContainsKey!0 lt!298521 (select (arr!18427 a!2986) j!136) j!136))))

(declare-fun b!644148 () Bool)

(declare-fun e!369037 () Bool)

(assert (=> b!644148 (= e!369036 e!369037)))

(declare-fun res!417263 () Bool)

(assert (=> b!644148 (=> res!417263 e!369037)))

(declare-fun lt!298518 () (_ BitVec 64))

(assert (=> b!644148 (= res!417263 (or (not (= (select (arr!18427 a!2986) j!136) lt!298508)) (not (= (select (arr!18427 a!2986) j!136) lt!298518))))))

(declare-fun e!369040 () Bool)

(assert (=> b!644148 e!369040))

(declare-fun res!417274 () Bool)

(assert (=> b!644148 (=> (not res!417274) (not e!369040))))

(assert (=> b!644148 (= res!417274 (= lt!298518 (select (arr!18427 a!2986) j!136)))))

(assert (=> b!644148 (= lt!298518 (select (store (arr!18427 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!644149 () Bool)

(declare-fun e!369035 () Bool)

(assert (=> b!644149 (= e!369035 e!369044)))

(declare-fun res!417267 () Bool)

(assert (=> b!644149 (=> (not res!417267) (not e!369044))))

(declare-fun lt!298516 () SeekEntryResult!6867)

(assert (=> b!644149 (= res!417267 (and (= lt!298516 (Found!6867 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18427 a!2986) index!984) (select (arr!18427 a!2986) j!136))) (not (= (select (arr!18427 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!644149 (= lt!298516 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18427 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644150 () Bool)

(declare-fun e!369031 () Unit!21828)

(declare-fun Unit!21830 () Unit!21828)

(assert (=> b!644150 (= e!369031 Unit!21830)))

(declare-fun b!644151 () Bool)

(assert (=> b!644151 (= e!369040 e!369042)))

(declare-fun res!417270 () Bool)

(assert (=> b!644151 (=> res!417270 e!369042)))

(assert (=> b!644151 (= res!417270 (or (not (= (select (arr!18427 a!2986) j!136) lt!298508)) (not (= (select (arr!18427 a!2986) j!136) lt!298518)) (bvsge j!136 index!984)))))

(declare-fun b!644152 () Bool)

(assert (=> b!644152 (= e!369033 e!369035)))

(declare-fun res!417273 () Bool)

(assert (=> b!644152 (=> (not res!417273) (not e!369035))))

(assert (=> b!644152 (= res!417273 (= (select (store (arr!18427 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644152 (= lt!298521 (array!38428 (store (arr!18427 a!2986) i!1108 k0!1786) (size!18791 a!2986)))))

(declare-fun b!644153 () Bool)

(declare-fun Unit!21831 () Unit!21828)

(assert (=> b!644153 (= e!369039 Unit!21831)))

(assert (=> b!644153 false))

(declare-fun b!644154 () Bool)

(declare-fun res!417266 () Bool)

(assert (=> b!644154 (=> (not res!417266) (not e!369038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!644154 (= res!417266 (validKeyInArray!0 k0!1786))))

(declare-fun b!644155 () Bool)

(declare-fun res!417275 () Bool)

(assert (=> b!644155 (=> (not res!417275) (not e!369033))))

(assert (=> b!644155 (= res!417275 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18427 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!644156 () Bool)

(assert (=> b!644156 (= e!369032 (arrayContainsKey!0 lt!298521 (select (arr!18427 a!2986) j!136) index!984))))

(declare-fun b!644157 () Bool)

(declare-fun res!417272 () Bool)

(assert (=> b!644157 (=> (not res!417272) (not e!369038))))

(assert (=> b!644157 (= res!417272 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!644146 () Bool)

(declare-fun res!417264 () Bool)

(assert (=> b!644146 (=> (not res!417264) (not e!369033))))

(declare-datatypes ((List!12468 0))(
  ( (Nil!12465) (Cons!12464 (h!13509 (_ BitVec 64)) (t!18696 List!12468)) )
))
(declare-fun arrayNoDuplicates!0 (array!38427 (_ BitVec 32) List!12468) Bool)

(assert (=> b!644146 (= res!417264 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12465))))

(declare-fun res!417265 () Bool)

(assert (=> start!58330 (=> (not res!417265) (not e!369038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58330 (= res!417265 (validMask!0 mask!3053))))

(assert (=> start!58330 e!369038))

(assert (=> start!58330 true))

(declare-fun array_inv!14223 (array!38427) Bool)

(assert (=> start!58330 (array_inv!14223 a!2986)))

(declare-fun b!644158 () Bool)

(declare-fun Unit!21832 () Unit!21828)

(assert (=> b!644158 (= e!369031 Unit!21832)))

(declare-fun lt!298512 () Unit!21828)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38427 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21828)

(assert (=> b!644158 (= lt!298512 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298521 (select (arr!18427 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!644158 (arrayContainsKey!0 lt!298521 (select (arr!18427 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298517 () Unit!21828)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38427 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12468) Unit!21828)

(assert (=> b!644158 (= lt!298517 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12465))))

(assert (=> b!644158 (arrayNoDuplicates!0 lt!298521 #b00000000000000000000000000000000 Nil!12465)))

(declare-fun lt!298514 () Unit!21828)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38427 (_ BitVec 32) (_ BitVec 32)) Unit!21828)

(assert (=> b!644158 (= lt!298514 (lemmaNoDuplicateFromThenFromBigger!0 lt!298521 #b00000000000000000000000000000000 j!136))))

(assert (=> b!644158 (arrayNoDuplicates!0 lt!298521 j!136 Nil!12465)))

(declare-fun lt!298520 () Unit!21828)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38427 (_ BitVec 64) (_ BitVec 32) List!12468) Unit!21828)

(assert (=> b!644158 (= lt!298520 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298521 (select (arr!18427 a!2986) j!136) j!136 Nil!12465))))

(assert (=> b!644158 false))

(declare-fun b!644159 () Bool)

(declare-fun Unit!21833 () Unit!21828)

(assert (=> b!644159 (= e!369039 Unit!21833)))

(declare-fun b!644160 () Bool)

(declare-fun e!369041 () Bool)

(assert (=> b!644160 (= e!369041 (bvsge (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000))))

(assert (=> b!644160 e!369045))

(declare-fun res!417279 () Bool)

(assert (=> b!644160 (=> (not res!417279) (not e!369045))))

(assert (=> b!644160 (= res!417279 (arrayContainsKey!0 lt!298521 (select (arr!18427 a!2986) j!136) j!136))))

(declare-fun b!644161 () Bool)

(declare-fun res!417269 () Bool)

(assert (=> b!644161 (=> (not res!417269) (not e!369033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38427 (_ BitVec 32)) Bool)

(assert (=> b!644161 (= res!417269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!644162 () Bool)

(assert (=> b!644162 (= e!369037 e!369041)))

(declare-fun res!417271 () Bool)

(assert (=> b!644162 (=> res!417271 e!369041)))

(assert (=> b!644162 (= res!417271 (bvsge index!984 j!136))))

(declare-fun lt!298522 () Unit!21828)

(assert (=> b!644162 (= lt!298522 e!369031)))

(declare-fun c!73807 () Bool)

(assert (=> b!644162 (= c!73807 (bvslt j!136 index!984))))

(declare-fun b!644163 () Bool)

(assert (=> b!644163 (= e!369043 (= lt!298516 lt!298509))))

(declare-fun b!644164 () Bool)

(declare-fun res!417280 () Bool)

(assert (=> b!644164 (=> (not res!417280) (not e!369038))))

(assert (=> b!644164 (= res!417280 (and (= (size!18791 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18791 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18791 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!644165 () Bool)

(declare-fun res!417277 () Bool)

(assert (=> b!644165 (=> (not res!417277) (not e!369038))))

(assert (=> b!644165 (= res!417277 (validKeyInArray!0 (select (arr!18427 a!2986) j!136)))))

(assert (= (and start!58330 res!417265) b!644164))

(assert (= (and b!644164 res!417280) b!644165))

(assert (= (and b!644165 res!417277) b!644154))

(assert (= (and b!644154 res!417266) b!644157))

(assert (= (and b!644157 res!417272) b!644145))

(assert (= (and b!644145 res!417276) b!644161))

(assert (= (and b!644161 res!417269) b!644146))

(assert (= (and b!644146 res!417264) b!644155))

(assert (= (and b!644155 res!417275) b!644152))

(assert (= (and b!644152 res!417273) b!644149))

(assert (= (and b!644149 res!417267) b!644143))

(assert (= (and b!644143 res!417281) b!644163))

(assert (= (and b!644143 c!73808) b!644153))

(assert (= (and b!644143 (not c!73808)) b!644159))

(assert (= (and b!644143 (not res!417268)) b!644148))

(assert (= (and b!644148 res!417274) b!644151))

(assert (= (and b!644151 (not res!417270)) b!644147))

(assert (= (and b!644147 res!417278) b!644156))

(assert (= (and b!644148 (not res!417263)) b!644162))

(assert (= (and b!644162 c!73807) b!644158))

(assert (= (and b!644162 (not c!73807)) b!644150))

(assert (= (and b!644162 (not res!417271)) b!644160))

(assert (= (and b!644160 res!417279) b!644144))

(declare-fun m!617789 () Bool)

(assert (=> b!644165 m!617789))

(assert (=> b!644165 m!617789))

(declare-fun m!617791 () Bool)

(assert (=> b!644165 m!617791))

(declare-fun m!617793 () Bool)

(assert (=> b!644149 m!617793))

(assert (=> b!644149 m!617789))

(assert (=> b!644149 m!617789))

(declare-fun m!617795 () Bool)

(assert (=> b!644149 m!617795))

(declare-fun m!617797 () Bool)

(assert (=> start!58330 m!617797))

(declare-fun m!617799 () Bool)

(assert (=> start!58330 m!617799))

(declare-fun m!617801 () Bool)

(assert (=> b!644155 m!617801))

(assert (=> b!644148 m!617789))

(declare-fun m!617803 () Bool)

(assert (=> b!644148 m!617803))

(declare-fun m!617805 () Bool)

(assert (=> b!644148 m!617805))

(declare-fun m!617807 () Bool)

(assert (=> b!644161 m!617807))

(declare-fun m!617809 () Bool)

(assert (=> b!644145 m!617809))

(assert (=> b!644158 m!617789))

(declare-fun m!617811 () Bool)

(assert (=> b!644158 m!617811))

(assert (=> b!644158 m!617789))

(assert (=> b!644158 m!617789))

(declare-fun m!617813 () Bool)

(assert (=> b!644158 m!617813))

(declare-fun m!617815 () Bool)

(assert (=> b!644158 m!617815))

(declare-fun m!617817 () Bool)

(assert (=> b!644158 m!617817))

(declare-fun m!617819 () Bool)

(assert (=> b!644158 m!617819))

(assert (=> b!644158 m!617789))

(declare-fun m!617821 () Bool)

(assert (=> b!644158 m!617821))

(declare-fun m!617823 () Bool)

(assert (=> b!644158 m!617823))

(assert (=> b!644151 m!617789))

(declare-fun m!617825 () Bool)

(assert (=> b!644157 m!617825))

(declare-fun m!617827 () Bool)

(assert (=> b!644146 m!617827))

(declare-fun m!617829 () Bool)

(assert (=> b!644143 m!617829))

(assert (=> b!644143 m!617789))

(assert (=> b!644143 m!617803))

(assert (=> b!644143 m!617789))

(declare-fun m!617831 () Bool)

(assert (=> b!644143 m!617831))

(declare-fun m!617833 () Bool)

(assert (=> b!644143 m!617833))

(declare-fun m!617835 () Bool)

(assert (=> b!644143 m!617835))

(declare-fun m!617837 () Bool)

(assert (=> b!644143 m!617837))

(declare-fun m!617839 () Bool)

(assert (=> b!644143 m!617839))

(assert (=> b!644156 m!617789))

(assert (=> b!644156 m!617789))

(declare-fun m!617841 () Bool)

(assert (=> b!644156 m!617841))

(assert (=> b!644160 m!617789))

(assert (=> b!644160 m!617789))

(declare-fun m!617843 () Bool)

(assert (=> b!644160 m!617843))

(assert (=> b!644144 m!617789))

(assert (=> b!644144 m!617789))

(assert (=> b!644144 m!617841))

(assert (=> b!644152 m!617803))

(declare-fun m!617845 () Bool)

(assert (=> b!644152 m!617845))

(assert (=> b!644147 m!617789))

(assert (=> b!644147 m!617789))

(assert (=> b!644147 m!617843))

(declare-fun m!617847 () Bool)

(assert (=> b!644154 m!617847))

(check-sat (not b!644158) (not b!644154) (not b!644147) (not b!644145) (not b!644149) (not b!644144) (not b!644161) (not b!644156) (not b!644157) (not b!644146) (not b!644165) (not b!644143) (not b!644160) (not start!58330))
(check-sat)
