; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56886 () Bool)

(assert start!56886)

(declare-fun b!629797 () Bool)

(declare-fun e!360165 () Bool)

(declare-fun e!360162 () Bool)

(assert (=> b!629797 (= e!360165 e!360162)))

(declare-fun res!407086 () Bool)

(assert (=> b!629797 (=> (not res!407086) (not e!360162))))

(declare-datatypes ((SeekEntryResult!6640 0))(
  ( (MissingZero!6640 (index!28844 (_ BitVec 32))) (Found!6640 (index!28845 (_ BitVec 32))) (Intermediate!6640 (undefined!7452 Bool) (index!28846 (_ BitVec 32)) (x!57731 (_ BitVec 32))) (Undefined!6640) (MissingVacant!6640 (index!28847 (_ BitVec 32))) )
))
(declare-fun lt!290900 () SeekEntryResult!6640)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!629797 (= res!407086 (or (= lt!290900 (MissingZero!6640 i!1108)) (= lt!290900 (MissingVacant!6640 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38019 0))(
  ( (array!38020 (arr!18244 (Array (_ BitVec 32) (_ BitVec 64))) (size!18608 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38019)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38019 (_ BitVec 32)) SeekEntryResult!6640)

(assert (=> b!629797 (= lt!290900 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!629798 () Bool)

(declare-fun res!407087 () Bool)

(assert (=> b!629798 (=> (not res!407087) (not e!360165))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!629798 (= res!407087 (and (= (size!18608 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18608 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18608 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629800 () Bool)

(declare-fun res!407090 () Bool)

(assert (=> b!629800 (=> (not res!407090) (not e!360162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38019 (_ BitVec 32)) Bool)

(assert (=> b!629800 (= res!407090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629801 () Bool)

(declare-fun res!407089 () Bool)

(assert (=> b!629801 (=> (not res!407089) (not e!360165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629801 (= res!407089 (validKeyInArray!0 k0!1786))))

(declare-fun b!629802 () Bool)

(declare-fun res!407088 () Bool)

(assert (=> b!629802 (=> (not res!407088) (not e!360162))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!629802 (= res!407088 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18244 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18244 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629803 () Bool)

(declare-fun e!360164 () Bool)

(declare-fun lt!290898 () SeekEntryResult!6640)

(declare-fun lt!290899 () SeekEntryResult!6640)

(assert (=> b!629803 (= e!360164 (not (= lt!290898 lt!290899)))))

(declare-fun lt!290901 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38019 (_ BitVec 32)) SeekEntryResult!6640)

(assert (=> b!629803 (= lt!290899 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290901 vacantSpotIndex!68 (select (store (arr!18244 a!2986) i!1108 k0!1786) j!136) (array!38020 (store (arr!18244 a!2986) i!1108 k0!1786) (size!18608 a!2986)) mask!3053))))

(assert (=> b!629803 (= lt!290899 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290901 vacantSpotIndex!68 (select (arr!18244 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21099 0))(
  ( (Unit!21100) )
))
(declare-fun lt!290902 () Unit!21099)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38019 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21099)

(assert (=> b!629803 (= lt!290902 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290901 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629803 (= lt!290901 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!629804 () Bool)

(declare-fun res!407095 () Bool)

(assert (=> b!629804 (=> (not res!407095) (not e!360162))))

(declare-datatypes ((List!12192 0))(
  ( (Nil!12189) (Cons!12188 (h!13236 (_ BitVec 64)) (t!18412 List!12192)) )
))
(declare-fun arrayNoDuplicates!0 (array!38019 (_ BitVec 32) List!12192) Bool)

(assert (=> b!629804 (= res!407095 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12189))))

(declare-fun b!629805 () Bool)

(assert (=> b!629805 (= e!360162 e!360164)))

(declare-fun res!407091 () Bool)

(assert (=> b!629805 (=> (not res!407091) (not e!360164))))

(assert (=> b!629805 (= res!407091 (and (= lt!290898 (Found!6640 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18244 a!2986) index!984) (select (arr!18244 a!2986) j!136))) (not (= (select (arr!18244 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!629805 (= lt!290898 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18244 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629806 () Bool)

(declare-fun res!407094 () Bool)

(assert (=> b!629806 (=> (not res!407094) (not e!360165))))

(assert (=> b!629806 (= res!407094 (validKeyInArray!0 (select (arr!18244 a!2986) j!136)))))

(declare-fun res!407092 () Bool)

(assert (=> start!56886 (=> (not res!407092) (not e!360165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56886 (= res!407092 (validMask!0 mask!3053))))

(assert (=> start!56886 e!360165))

(assert (=> start!56886 true))

(declare-fun array_inv!14103 (array!38019) Bool)

(assert (=> start!56886 (array_inv!14103 a!2986)))

(declare-fun b!629799 () Bool)

(declare-fun res!407093 () Bool)

(assert (=> b!629799 (=> (not res!407093) (not e!360165))))

(declare-fun arrayContainsKey!0 (array!38019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629799 (= res!407093 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56886 res!407092) b!629798))

(assert (= (and b!629798 res!407087) b!629806))

(assert (= (and b!629806 res!407094) b!629801))

(assert (= (and b!629801 res!407089) b!629799))

(assert (= (and b!629799 res!407093) b!629797))

(assert (= (and b!629797 res!407086) b!629800))

(assert (= (and b!629800 res!407090) b!629804))

(assert (= (and b!629804 res!407095) b!629802))

(assert (= (and b!629802 res!407088) b!629805))

(assert (= (and b!629805 res!407091) b!629803))

(declare-fun m!605119 () Bool)

(assert (=> b!629799 m!605119))

(declare-fun m!605121 () Bool)

(assert (=> b!629797 m!605121))

(declare-fun m!605123 () Bool)

(assert (=> b!629806 m!605123))

(assert (=> b!629806 m!605123))

(declare-fun m!605125 () Bool)

(assert (=> b!629806 m!605125))

(declare-fun m!605127 () Bool)

(assert (=> b!629801 m!605127))

(declare-fun m!605129 () Bool)

(assert (=> b!629803 m!605129))

(declare-fun m!605131 () Bool)

(assert (=> b!629803 m!605131))

(assert (=> b!629803 m!605123))

(declare-fun m!605133 () Bool)

(assert (=> b!629803 m!605133))

(assert (=> b!629803 m!605123))

(declare-fun m!605135 () Bool)

(assert (=> b!629803 m!605135))

(assert (=> b!629803 m!605131))

(declare-fun m!605137 () Bool)

(assert (=> b!629803 m!605137))

(declare-fun m!605139 () Bool)

(assert (=> b!629803 m!605139))

(declare-fun m!605141 () Bool)

(assert (=> b!629805 m!605141))

(assert (=> b!629805 m!605123))

(assert (=> b!629805 m!605123))

(declare-fun m!605143 () Bool)

(assert (=> b!629805 m!605143))

(declare-fun m!605145 () Bool)

(assert (=> b!629804 m!605145))

(declare-fun m!605147 () Bool)

(assert (=> b!629800 m!605147))

(declare-fun m!605149 () Bool)

(assert (=> b!629802 m!605149))

(assert (=> b!629802 m!605133))

(declare-fun m!605151 () Bool)

(assert (=> b!629802 m!605151))

(declare-fun m!605153 () Bool)

(assert (=> start!56886 m!605153))

(declare-fun m!605155 () Bool)

(assert (=> start!56886 m!605155))

(check-sat (not b!629797) (not b!629804) (not b!629805) (not b!629801) (not start!56886) (not b!629803) (not b!629806) (not b!629799) (not b!629800))
(check-sat)
(get-model)

(declare-fun b!629879 () Bool)

(declare-fun e!360196 () SeekEntryResult!6640)

(assert (=> b!629879 (= e!360196 (Found!6640 index!984))))

(declare-fun b!629880 () Bool)

(declare-fun e!360197 () SeekEntryResult!6640)

(assert (=> b!629880 (= e!360197 (MissingVacant!6640 vacantSpotIndex!68))))

(declare-fun b!629881 () Bool)

(declare-fun c!71732 () Bool)

(declare-fun lt!290938 () (_ BitVec 64))

(assert (=> b!629881 (= c!71732 (= lt!290938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!629881 (= e!360196 e!360197)))

(declare-fun b!629882 () Bool)

(assert (=> b!629882 (= e!360197 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18244 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!89247 () Bool)

(declare-fun lt!290937 () SeekEntryResult!6640)

(get-info :version)

(assert (=> d!89247 (and (or ((_ is Undefined!6640) lt!290937) (not ((_ is Found!6640) lt!290937)) (and (bvsge (index!28845 lt!290937) #b00000000000000000000000000000000) (bvslt (index!28845 lt!290937) (size!18608 a!2986)))) (or ((_ is Undefined!6640) lt!290937) ((_ is Found!6640) lt!290937) (not ((_ is MissingVacant!6640) lt!290937)) (not (= (index!28847 lt!290937) vacantSpotIndex!68)) (and (bvsge (index!28847 lt!290937) #b00000000000000000000000000000000) (bvslt (index!28847 lt!290937) (size!18608 a!2986)))) (or ((_ is Undefined!6640) lt!290937) (ite ((_ is Found!6640) lt!290937) (= (select (arr!18244 a!2986) (index!28845 lt!290937)) (select (arr!18244 a!2986) j!136)) (and ((_ is MissingVacant!6640) lt!290937) (= (index!28847 lt!290937) vacantSpotIndex!68) (= (select (arr!18244 a!2986) (index!28847 lt!290937)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!360198 () SeekEntryResult!6640)

(assert (=> d!89247 (= lt!290937 e!360198)))

(declare-fun c!71730 () Bool)

(assert (=> d!89247 (= c!71730 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89247 (= lt!290938 (select (arr!18244 a!2986) index!984))))

(assert (=> d!89247 (validMask!0 mask!3053)))

(assert (=> d!89247 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18244 a!2986) j!136) a!2986 mask!3053) lt!290937)))

(declare-fun b!629883 () Bool)

(assert (=> b!629883 (= e!360198 e!360196)))

(declare-fun c!71731 () Bool)

(assert (=> b!629883 (= c!71731 (= lt!290938 (select (arr!18244 a!2986) j!136)))))

(declare-fun b!629884 () Bool)

(assert (=> b!629884 (= e!360198 Undefined!6640)))

(assert (= (and d!89247 c!71730) b!629884))

(assert (= (and d!89247 (not c!71730)) b!629883))

(assert (= (and b!629883 c!71731) b!629879))

(assert (= (and b!629883 (not c!71731)) b!629881))

(assert (= (and b!629881 c!71732) b!629880))

(assert (= (and b!629881 (not c!71732)) b!629882))

(declare-fun m!605233 () Bool)

(assert (=> b!629882 m!605233))

(assert (=> b!629882 m!605233))

(assert (=> b!629882 m!605123))

(declare-fun m!605235 () Bool)

(assert (=> b!629882 m!605235))

(declare-fun m!605237 () Bool)

(assert (=> d!89247 m!605237))

(declare-fun m!605239 () Bool)

(assert (=> d!89247 m!605239))

(assert (=> d!89247 m!605141))

(assert (=> d!89247 m!605153))

(assert (=> b!629805 d!89247))

(declare-fun d!89249 () Bool)

(declare-fun res!407164 () Bool)

(declare-fun e!360209 () Bool)

(assert (=> d!89249 (=> res!407164 e!360209)))

(assert (=> d!89249 (= res!407164 (bvsge #b00000000000000000000000000000000 (size!18608 a!2986)))))

(assert (=> d!89249 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!360209)))

(declare-fun bm!33294 () Bool)

(declare-fun call!33297 () Bool)

(assert (=> bm!33294 (= call!33297 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!629897 () Bool)

(declare-fun e!360210 () Bool)

(declare-fun e!360211 () Bool)

(assert (=> b!629897 (= e!360210 e!360211)))

(declare-fun lt!290945 () (_ BitVec 64))

(assert (=> b!629897 (= lt!290945 (select (arr!18244 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!290947 () Unit!21099)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38019 (_ BitVec 64) (_ BitVec 32)) Unit!21099)

(assert (=> b!629897 (= lt!290947 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!290945 #b00000000000000000000000000000000))))

(assert (=> b!629897 (arrayContainsKey!0 a!2986 lt!290945 #b00000000000000000000000000000000)))

(declare-fun lt!290946 () Unit!21099)

(assert (=> b!629897 (= lt!290946 lt!290947)))

(declare-fun res!407165 () Bool)

(assert (=> b!629897 (= res!407165 (= (seekEntryOrOpen!0 (select (arr!18244 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6640 #b00000000000000000000000000000000)))))

(assert (=> b!629897 (=> (not res!407165) (not e!360211))))

(declare-fun b!629898 () Bool)

(assert (=> b!629898 (= e!360211 call!33297)))

(declare-fun b!629899 () Bool)

(assert (=> b!629899 (= e!360209 e!360210)))

(declare-fun c!71735 () Bool)

(assert (=> b!629899 (= c!71735 (validKeyInArray!0 (select (arr!18244 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!629900 () Bool)

(assert (=> b!629900 (= e!360210 call!33297)))

(assert (= (and d!89249 (not res!407164)) b!629899))

(assert (= (and b!629899 c!71735) b!629897))

(assert (= (and b!629899 (not c!71735)) b!629900))

(assert (= (and b!629897 res!407165) b!629898))

(assert (= (or b!629898 b!629900) bm!33294))

(declare-fun m!605241 () Bool)

(assert (=> bm!33294 m!605241))

(declare-fun m!605243 () Bool)

(assert (=> b!629897 m!605243))

(declare-fun m!605245 () Bool)

(assert (=> b!629897 m!605245))

(declare-fun m!605247 () Bool)

(assert (=> b!629897 m!605247))

(assert (=> b!629897 m!605243))

(declare-fun m!605249 () Bool)

(assert (=> b!629897 m!605249))

(assert (=> b!629899 m!605243))

(assert (=> b!629899 m!605243))

(declare-fun m!605252 () Bool)

(assert (=> b!629899 m!605252))

(assert (=> b!629800 d!89249))

(declare-fun d!89255 () Bool)

(declare-fun res!407172 () Bool)

(declare-fun e!360218 () Bool)

(assert (=> d!89255 (=> res!407172 e!360218)))

(assert (=> d!89255 (= res!407172 (= (select (arr!18244 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89255 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!360218)))

(declare-fun b!629907 () Bool)

(declare-fun e!360219 () Bool)

(assert (=> b!629907 (= e!360218 e!360219)))

(declare-fun res!407173 () Bool)

(assert (=> b!629907 (=> (not res!407173) (not e!360219))))

(assert (=> b!629907 (= res!407173 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18608 a!2986)))))

(declare-fun b!629908 () Bool)

(assert (=> b!629908 (= e!360219 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89255 (not res!407172)) b!629907))

(assert (= (and b!629907 res!407173) b!629908))

(assert (=> d!89255 m!605243))

(declare-fun m!605257 () Bool)

(assert (=> b!629908 m!605257))

(assert (=> b!629799 d!89255))

(declare-fun d!89261 () Bool)

(assert (=> d!89261 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56886 d!89261))

(declare-fun d!89265 () Bool)

(assert (=> d!89265 (= (array_inv!14103 a!2986) (bvsge (size!18608 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56886 d!89265))

(declare-fun bm!33297 () Bool)

(declare-fun call!33300 () Bool)

(declare-fun c!71747 () Bool)

(assert (=> bm!33297 (= call!33300 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71747 (Cons!12188 (select (arr!18244 a!2986) #b00000000000000000000000000000000) Nil!12189) Nil!12189)))))

(declare-fun b!629937 () Bool)

(declare-fun e!360237 () Bool)

(assert (=> b!629937 (= e!360237 call!33300)))

(declare-fun b!629938 () Bool)

(declare-fun e!360240 () Bool)

(assert (=> b!629938 (= e!360240 e!360237)))

(assert (=> b!629938 (= c!71747 (validKeyInArray!0 (select (arr!18244 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!629939 () Bool)

(declare-fun e!360238 () Bool)

(assert (=> b!629939 (= e!360238 e!360240)))

(declare-fun res!407180 () Bool)

(assert (=> b!629939 (=> (not res!407180) (not e!360240))))

(declare-fun e!360239 () Bool)

(assert (=> b!629939 (= res!407180 (not e!360239))))

(declare-fun res!407182 () Bool)

(assert (=> b!629939 (=> (not res!407182) (not e!360239))))

(assert (=> b!629939 (= res!407182 (validKeyInArray!0 (select (arr!18244 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89267 () Bool)

(declare-fun res!407181 () Bool)

(assert (=> d!89267 (=> res!407181 e!360238)))

(assert (=> d!89267 (= res!407181 (bvsge #b00000000000000000000000000000000 (size!18608 a!2986)))))

(assert (=> d!89267 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12189) e!360238)))

(declare-fun b!629940 () Bool)

(declare-fun contains!3061 (List!12192 (_ BitVec 64)) Bool)

(assert (=> b!629940 (= e!360239 (contains!3061 Nil!12189 (select (arr!18244 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!629941 () Bool)

(assert (=> b!629941 (= e!360237 call!33300)))

(assert (= (and d!89267 (not res!407181)) b!629939))

(assert (= (and b!629939 res!407182) b!629940))

(assert (= (and b!629939 res!407180) b!629938))

(assert (= (and b!629938 c!71747) b!629937))

(assert (= (and b!629938 (not c!71747)) b!629941))

(assert (= (or b!629937 b!629941) bm!33297))

(assert (=> bm!33297 m!605243))

(declare-fun m!605267 () Bool)

(assert (=> bm!33297 m!605267))

(assert (=> b!629938 m!605243))

(assert (=> b!629938 m!605243))

(assert (=> b!629938 m!605252))

(assert (=> b!629939 m!605243))

(assert (=> b!629939 m!605243))

(assert (=> b!629939 m!605252))

(assert (=> b!629940 m!605243))

(assert (=> b!629940 m!605243))

(declare-fun m!605269 () Bool)

(assert (=> b!629940 m!605269))

(assert (=> b!629804 d!89267))

(declare-fun b!629942 () Bool)

(declare-fun e!360241 () SeekEntryResult!6640)

(assert (=> b!629942 (= e!360241 (Found!6640 lt!290901))))

(declare-fun b!629943 () Bool)

(declare-fun e!360242 () SeekEntryResult!6640)

(assert (=> b!629943 (= e!360242 (MissingVacant!6640 vacantSpotIndex!68))))

(declare-fun b!629944 () Bool)

(declare-fun c!71750 () Bool)

(declare-fun lt!290955 () (_ BitVec 64))

(assert (=> b!629944 (= c!71750 (= lt!290955 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!629944 (= e!360241 e!360242)))

(declare-fun b!629945 () Bool)

(assert (=> b!629945 (= e!360242 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!290901 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (store (arr!18244 a!2986) i!1108 k0!1786) j!136) (array!38020 (store (arr!18244 a!2986) i!1108 k0!1786) (size!18608 a!2986)) mask!3053))))

(declare-fun d!89271 () Bool)

(declare-fun lt!290954 () SeekEntryResult!6640)

(assert (=> d!89271 (and (or ((_ is Undefined!6640) lt!290954) (not ((_ is Found!6640) lt!290954)) (and (bvsge (index!28845 lt!290954) #b00000000000000000000000000000000) (bvslt (index!28845 lt!290954) (size!18608 (array!38020 (store (arr!18244 a!2986) i!1108 k0!1786) (size!18608 a!2986)))))) (or ((_ is Undefined!6640) lt!290954) ((_ is Found!6640) lt!290954) (not ((_ is MissingVacant!6640) lt!290954)) (not (= (index!28847 lt!290954) vacantSpotIndex!68)) (and (bvsge (index!28847 lt!290954) #b00000000000000000000000000000000) (bvslt (index!28847 lt!290954) (size!18608 (array!38020 (store (arr!18244 a!2986) i!1108 k0!1786) (size!18608 a!2986)))))) (or ((_ is Undefined!6640) lt!290954) (ite ((_ is Found!6640) lt!290954) (= (select (arr!18244 (array!38020 (store (arr!18244 a!2986) i!1108 k0!1786) (size!18608 a!2986))) (index!28845 lt!290954)) (select (store (arr!18244 a!2986) i!1108 k0!1786) j!136)) (and ((_ is MissingVacant!6640) lt!290954) (= (index!28847 lt!290954) vacantSpotIndex!68) (= (select (arr!18244 (array!38020 (store (arr!18244 a!2986) i!1108 k0!1786) (size!18608 a!2986))) (index!28847 lt!290954)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!360243 () SeekEntryResult!6640)

(assert (=> d!89271 (= lt!290954 e!360243)))

(declare-fun c!71748 () Bool)

(assert (=> d!89271 (= c!71748 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89271 (= lt!290955 (select (arr!18244 (array!38020 (store (arr!18244 a!2986) i!1108 k0!1786) (size!18608 a!2986))) lt!290901))))

(assert (=> d!89271 (validMask!0 mask!3053)))

(assert (=> d!89271 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290901 vacantSpotIndex!68 (select (store (arr!18244 a!2986) i!1108 k0!1786) j!136) (array!38020 (store (arr!18244 a!2986) i!1108 k0!1786) (size!18608 a!2986)) mask!3053) lt!290954)))

(declare-fun b!629946 () Bool)

(assert (=> b!629946 (= e!360243 e!360241)))

(declare-fun c!71749 () Bool)

(assert (=> b!629946 (= c!71749 (= lt!290955 (select (store (arr!18244 a!2986) i!1108 k0!1786) j!136)))))

(declare-fun b!629947 () Bool)

(assert (=> b!629947 (= e!360243 Undefined!6640)))

(assert (= (and d!89271 c!71748) b!629947))

(assert (= (and d!89271 (not c!71748)) b!629946))

(assert (= (and b!629946 c!71749) b!629942))

(assert (= (and b!629946 (not c!71749)) b!629944))

(assert (= (and b!629944 c!71750) b!629943))

(assert (= (and b!629944 (not c!71750)) b!629945))

(declare-fun m!605271 () Bool)

(assert (=> b!629945 m!605271))

(assert (=> b!629945 m!605271))

(assert (=> b!629945 m!605131))

(declare-fun m!605273 () Bool)

(assert (=> b!629945 m!605273))

(declare-fun m!605275 () Bool)

(assert (=> d!89271 m!605275))

(declare-fun m!605277 () Bool)

(assert (=> d!89271 m!605277))

(declare-fun m!605279 () Bool)

(assert (=> d!89271 m!605279))

(assert (=> d!89271 m!605153))

(assert (=> b!629803 d!89271))

(declare-fun b!629960 () Bool)

(declare-fun e!360250 () SeekEntryResult!6640)

(assert (=> b!629960 (= e!360250 (Found!6640 lt!290901))))

(declare-fun b!629961 () Bool)

(declare-fun e!360251 () SeekEntryResult!6640)

(assert (=> b!629961 (= e!360251 (MissingVacant!6640 vacantSpotIndex!68))))

(declare-fun b!629962 () Bool)

(declare-fun c!71759 () Bool)

(declare-fun lt!290961 () (_ BitVec 64))

(assert (=> b!629962 (= c!71759 (= lt!290961 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!629962 (= e!360250 e!360251)))

(declare-fun b!629963 () Bool)

(assert (=> b!629963 (= e!360251 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!290901 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18244 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!290960 () SeekEntryResult!6640)

(declare-fun d!89273 () Bool)

(assert (=> d!89273 (and (or ((_ is Undefined!6640) lt!290960) (not ((_ is Found!6640) lt!290960)) (and (bvsge (index!28845 lt!290960) #b00000000000000000000000000000000) (bvslt (index!28845 lt!290960) (size!18608 a!2986)))) (or ((_ is Undefined!6640) lt!290960) ((_ is Found!6640) lt!290960) (not ((_ is MissingVacant!6640) lt!290960)) (not (= (index!28847 lt!290960) vacantSpotIndex!68)) (and (bvsge (index!28847 lt!290960) #b00000000000000000000000000000000) (bvslt (index!28847 lt!290960) (size!18608 a!2986)))) (or ((_ is Undefined!6640) lt!290960) (ite ((_ is Found!6640) lt!290960) (= (select (arr!18244 a!2986) (index!28845 lt!290960)) (select (arr!18244 a!2986) j!136)) (and ((_ is MissingVacant!6640) lt!290960) (= (index!28847 lt!290960) vacantSpotIndex!68) (= (select (arr!18244 a!2986) (index!28847 lt!290960)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!360252 () SeekEntryResult!6640)

(assert (=> d!89273 (= lt!290960 e!360252)))

(declare-fun c!71757 () Bool)

(assert (=> d!89273 (= c!71757 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89273 (= lt!290961 (select (arr!18244 a!2986) lt!290901))))

(assert (=> d!89273 (validMask!0 mask!3053)))

(assert (=> d!89273 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290901 vacantSpotIndex!68 (select (arr!18244 a!2986) j!136) a!2986 mask!3053) lt!290960)))

(declare-fun b!629964 () Bool)

(assert (=> b!629964 (= e!360252 e!360250)))

(declare-fun c!71758 () Bool)

(assert (=> b!629964 (= c!71758 (= lt!290961 (select (arr!18244 a!2986) j!136)))))

(declare-fun b!629965 () Bool)

(assert (=> b!629965 (= e!360252 Undefined!6640)))

(assert (= (and d!89273 c!71757) b!629965))

(assert (= (and d!89273 (not c!71757)) b!629964))

(assert (= (and b!629964 c!71758) b!629960))

(assert (= (and b!629964 (not c!71758)) b!629962))

(assert (= (and b!629962 c!71759) b!629961))

(assert (= (and b!629962 (not c!71759)) b!629963))

(assert (=> b!629963 m!605271))

(assert (=> b!629963 m!605271))

(assert (=> b!629963 m!605123))

(declare-fun m!605281 () Bool)

(assert (=> b!629963 m!605281))

(declare-fun m!605283 () Bool)

(assert (=> d!89273 m!605283))

(declare-fun m!605285 () Bool)

(assert (=> d!89273 m!605285))

(declare-fun m!605287 () Bool)

(assert (=> d!89273 m!605287))

(assert (=> d!89273 m!605153))

(assert (=> b!629803 d!89273))

(declare-fun d!89275 () Bool)

(declare-fun e!360267 () Bool)

(assert (=> d!89275 e!360267))

(declare-fun res!407185 () Bool)

(assert (=> d!89275 (=> (not res!407185) (not e!360267))))

(assert (=> d!89275 (= res!407185 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18608 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18608 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18608 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18608 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18608 a!2986))))))

(declare-fun lt!290974 () Unit!21099)

(declare-fun choose!9 (array!38019 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21099)

(assert (=> d!89275 (= lt!290974 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290901 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89275 (validMask!0 mask!3053)))

(assert (=> d!89275 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290901 vacantSpotIndex!68 mask!3053) lt!290974)))

(declare-fun b!629992 () Bool)

(assert (=> b!629992 (= e!360267 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290901 vacantSpotIndex!68 (select (arr!18244 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290901 vacantSpotIndex!68 (select (store (arr!18244 a!2986) i!1108 k0!1786) j!136) (array!38020 (store (arr!18244 a!2986) i!1108 k0!1786) (size!18608 a!2986)) mask!3053)))))

(assert (= (and d!89275 res!407185) b!629992))

(declare-fun m!605307 () Bool)

(assert (=> d!89275 m!605307))

(assert (=> d!89275 m!605153))

(assert (=> b!629992 m!605123))

(assert (=> b!629992 m!605123))

(assert (=> b!629992 m!605135))

(assert (=> b!629992 m!605133))

(assert (=> b!629992 m!605131))

(assert (=> b!629992 m!605131))

(assert (=> b!629992 m!605137))

(assert (=> b!629803 d!89275))

(declare-fun d!89281 () Bool)

(declare-fun lt!290982 () (_ BitVec 32))

(assert (=> d!89281 (and (bvsge lt!290982 #b00000000000000000000000000000000) (bvslt lt!290982 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89281 (= lt!290982 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!89281 (validMask!0 mask!3053)))

(assert (=> d!89281 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!290982)))

(declare-fun bs!19007 () Bool)

(assert (= bs!19007 d!89281))

(declare-fun m!605323 () Bool)

(assert (=> bs!19007 m!605323))

(assert (=> bs!19007 m!605153))

(assert (=> b!629803 d!89281))

(declare-fun b!630049 () Bool)

(declare-fun e!360306 () SeekEntryResult!6640)

(assert (=> b!630049 (= e!360306 Undefined!6640)))

(declare-fun d!89285 () Bool)

(declare-fun lt!291004 () SeekEntryResult!6640)

(assert (=> d!89285 (and (or ((_ is Undefined!6640) lt!291004) (not ((_ is Found!6640) lt!291004)) (and (bvsge (index!28845 lt!291004) #b00000000000000000000000000000000) (bvslt (index!28845 lt!291004) (size!18608 a!2986)))) (or ((_ is Undefined!6640) lt!291004) ((_ is Found!6640) lt!291004) (not ((_ is MissingZero!6640) lt!291004)) (and (bvsge (index!28844 lt!291004) #b00000000000000000000000000000000) (bvslt (index!28844 lt!291004) (size!18608 a!2986)))) (or ((_ is Undefined!6640) lt!291004) ((_ is Found!6640) lt!291004) ((_ is MissingZero!6640) lt!291004) (not ((_ is MissingVacant!6640) lt!291004)) (and (bvsge (index!28847 lt!291004) #b00000000000000000000000000000000) (bvslt (index!28847 lt!291004) (size!18608 a!2986)))) (or ((_ is Undefined!6640) lt!291004) (ite ((_ is Found!6640) lt!291004) (= (select (arr!18244 a!2986) (index!28845 lt!291004)) k0!1786) (ite ((_ is MissingZero!6640) lt!291004) (= (select (arr!18244 a!2986) (index!28844 lt!291004)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6640) lt!291004) (= (select (arr!18244 a!2986) (index!28847 lt!291004)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89285 (= lt!291004 e!360306)))

(declare-fun c!71793 () Bool)

(declare-fun lt!291003 () SeekEntryResult!6640)

(assert (=> d!89285 (= c!71793 (and ((_ is Intermediate!6640) lt!291003) (undefined!7452 lt!291003)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38019 (_ BitVec 32)) SeekEntryResult!6640)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89285 (= lt!291003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89285 (validMask!0 mask!3053)))

(assert (=> d!89285 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!291004)))

(declare-fun b!630050 () Bool)

(declare-fun e!360304 () SeekEntryResult!6640)

(assert (=> b!630050 (= e!360306 e!360304)))

(declare-fun lt!291005 () (_ BitVec 64))

(assert (=> b!630050 (= lt!291005 (select (arr!18244 a!2986) (index!28846 lt!291003)))))

(declare-fun c!71794 () Bool)

(assert (=> b!630050 (= c!71794 (= lt!291005 k0!1786))))

(declare-fun e!360305 () SeekEntryResult!6640)

(declare-fun b!630051 () Bool)

(assert (=> b!630051 (= e!360305 (seekKeyOrZeroReturnVacant!0 (x!57731 lt!291003) (index!28846 lt!291003) (index!28846 lt!291003) k0!1786 a!2986 mask!3053))))

(declare-fun b!630052 () Bool)

(assert (=> b!630052 (= e!360304 (Found!6640 (index!28846 lt!291003)))))

(declare-fun b!630053 () Bool)

(assert (=> b!630053 (= e!360305 (MissingZero!6640 (index!28846 lt!291003)))))

(declare-fun b!630054 () Bool)

(declare-fun c!71792 () Bool)

(assert (=> b!630054 (= c!71792 (= lt!291005 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630054 (= e!360304 e!360305)))

(assert (= (and d!89285 c!71793) b!630049))

(assert (= (and d!89285 (not c!71793)) b!630050))

(assert (= (and b!630050 c!71794) b!630052))

(assert (= (and b!630050 (not c!71794)) b!630054))

(assert (= (and b!630054 c!71792) b!630053))

(assert (= (and b!630054 (not c!71792)) b!630051))

(declare-fun m!605355 () Bool)

(assert (=> d!89285 m!605355))

(declare-fun m!605357 () Bool)

(assert (=> d!89285 m!605357))

(declare-fun m!605359 () Bool)

(assert (=> d!89285 m!605359))

(declare-fun m!605361 () Bool)

(assert (=> d!89285 m!605361))

(declare-fun m!605363 () Bool)

(assert (=> d!89285 m!605363))

(assert (=> d!89285 m!605153))

(assert (=> d!89285 m!605361))

(declare-fun m!605365 () Bool)

(assert (=> b!630050 m!605365))

(declare-fun m!605367 () Bool)

(assert (=> b!630051 m!605367))

(assert (=> b!629797 d!89285))

(declare-fun d!89305 () Bool)

(assert (=> d!89305 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!629801 d!89305))

(declare-fun d!89307 () Bool)

(assert (=> d!89307 (= (validKeyInArray!0 (select (arr!18244 a!2986) j!136)) (and (not (= (select (arr!18244 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18244 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!629806 d!89307))

(check-sat (not b!629899) (not b!629945) (not d!89247) (not d!89275) (not b!629882) (not d!89285) (not b!629963) (not d!89273) (not bm!33294) (not d!89281) (not b!629908) (not b!629992) (not d!89271) (not b!629939) (not bm!33297) (not b!629897) (not b!629938) (not b!629940) (not b!630051))
(check-sat)
