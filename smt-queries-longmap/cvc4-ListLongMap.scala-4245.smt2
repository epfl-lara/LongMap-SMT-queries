; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58860 () Bool)

(assert start!58860)

(declare-fun b!648810 () Bool)

(declare-fun e!372127 () Bool)

(declare-fun e!372131 () Bool)

(assert (=> b!648810 (= e!372127 e!372131)))

(declare-fun res!420406 () Bool)

(assert (=> b!648810 (=> res!420406 e!372131)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!301174 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38522 0))(
  ( (array!38523 (arr!18467 (Array (_ BitVec 32) (_ BitVec 64))) (size!18831 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38522)

(declare-fun lt!301182 () (_ BitVec 64))

(assert (=> b!648810 (= res!420406 (or (not (= (select (arr!18467 a!2986) j!136) lt!301182)) (not (= (select (arr!18467 a!2986) j!136) lt!301174)) (bvsge j!136 index!984)))))

(declare-fun b!648811 () Bool)

(declare-fun res!420414 () Bool)

(declare-fun e!372126 () Bool)

(assert (=> b!648811 (=> (not res!420414) (not e!372126))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!648811 (= res!420414 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!648812 () Bool)

(declare-fun res!420407 () Bool)

(assert (=> b!648812 (=> (not res!420407) (not e!372126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!648812 (= res!420407 (validKeyInArray!0 k!1786))))

(declare-fun b!648813 () Bool)

(declare-fun res!420405 () Bool)

(declare-fun e!372135 () Bool)

(assert (=> b!648813 (=> res!420405 e!372135)))

(declare-datatypes ((List!12508 0))(
  ( (Nil!12505) (Cons!12504 (h!13549 (_ BitVec 64)) (t!18736 List!12508)) )
))
(declare-fun contains!3163 (List!12508 (_ BitVec 64)) Bool)

(assert (=> b!648813 (= res!420405 (contains!3163 Nil!12505 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!301185 () array!38522)

(declare-fun b!648814 () Bool)

(declare-fun e!372140 () Bool)

(assert (=> b!648814 (= e!372140 (arrayContainsKey!0 lt!301185 (select (arr!18467 a!2986) j!136) index!984))))

(declare-fun b!648815 () Bool)

(declare-fun e!372136 () Bool)

(declare-fun e!372139 () Bool)

(assert (=> b!648815 (= e!372136 e!372139)))

(declare-fun res!420408 () Bool)

(assert (=> b!648815 (=> res!420408 e!372139)))

(assert (=> b!648815 (= res!420408 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!22068 0))(
  ( (Unit!22069) )
))
(declare-fun lt!301176 () Unit!22068)

(declare-fun e!372134 () Unit!22068)

(assert (=> b!648815 (= lt!301176 e!372134)))

(declare-fun c!74573 () Bool)

(assert (=> b!648815 (= c!74573 (bvslt j!136 index!984))))

(declare-fun b!648816 () Bool)

(declare-fun e!372130 () Unit!22068)

(declare-fun Unit!22070 () Unit!22068)

(assert (=> b!648816 (= e!372130 Unit!22070)))

(declare-fun b!648817 () Bool)

(declare-fun e!372129 () Bool)

(assert (=> b!648817 (= e!372131 e!372129)))

(declare-fun res!420419 () Bool)

(assert (=> b!648817 (=> (not res!420419) (not e!372129))))

(assert (=> b!648817 (= res!420419 (arrayContainsKey!0 lt!301185 (select (arr!18467 a!2986) j!136) j!136))))

(declare-fun b!648818 () Bool)

(assert (=> b!648818 (= e!372139 e!372135)))

(declare-fun res!420412 () Bool)

(assert (=> b!648818 (=> res!420412 e!372135)))

(assert (=> b!648818 (= res!420412 (or (bvsge (size!18831 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18831 a!2986))))))

(assert (=> b!648818 (arrayContainsKey!0 lt!301185 (select (arr!18467 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301188 () Unit!22068)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38522 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22068)

(assert (=> b!648818 (= lt!301188 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301185 (select (arr!18467 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!648818 e!372140))

(declare-fun res!420421 () Bool)

(assert (=> b!648818 (=> (not res!420421) (not e!372140))))

(assert (=> b!648818 (= res!420421 (arrayContainsKey!0 lt!301185 (select (arr!18467 a!2986) j!136) j!136))))

(declare-fun b!648819 () Bool)

(declare-fun res!420422 () Bool)

(declare-fun e!372141 () Bool)

(assert (=> b!648819 (=> (not res!420422) (not e!372141))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38522 (_ BitVec 32)) Bool)

(assert (=> b!648819 (= res!420422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!648820 () Bool)

(declare-fun e!372137 () Bool)

(declare-fun e!372133 () Bool)

(assert (=> b!648820 (= e!372137 (not e!372133))))

(declare-fun res!420402 () Bool)

(assert (=> b!648820 (=> res!420402 e!372133)))

(declare-datatypes ((SeekEntryResult!6907 0))(
  ( (MissingZero!6907 (index!29975 (_ BitVec 32))) (Found!6907 (index!29976 (_ BitVec 32))) (Intermediate!6907 (undefined!7719 Bool) (index!29977 (_ BitVec 32)) (x!58760 (_ BitVec 32))) (Undefined!6907) (MissingVacant!6907 (index!29978 (_ BitVec 32))) )
))
(declare-fun lt!301175 () SeekEntryResult!6907)

(assert (=> b!648820 (= res!420402 (not (= lt!301175 (Found!6907 index!984))))))

(declare-fun lt!301179 () Unit!22068)

(assert (=> b!648820 (= lt!301179 e!372130)))

(declare-fun c!74572 () Bool)

(assert (=> b!648820 (= c!74572 (= lt!301175 Undefined!6907))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38522 (_ BitVec 32)) SeekEntryResult!6907)

(assert (=> b!648820 (= lt!301175 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301182 lt!301185 mask!3053))))

(declare-fun e!372138 () Bool)

(assert (=> b!648820 e!372138))

(declare-fun res!420417 () Bool)

(assert (=> b!648820 (=> (not res!420417) (not e!372138))))

(declare-fun lt!301183 () (_ BitVec 32))

(declare-fun lt!301181 () SeekEntryResult!6907)

(assert (=> b!648820 (= res!420417 (= lt!301181 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301183 vacantSpotIndex!68 lt!301182 lt!301185 mask!3053)))))

(assert (=> b!648820 (= lt!301181 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301183 vacantSpotIndex!68 (select (arr!18467 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!648820 (= lt!301182 (select (store (arr!18467 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!301186 () Unit!22068)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38522 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22068)

(assert (=> b!648820 (= lt!301186 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301183 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!648820 (= lt!301183 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!648821 () Bool)

(assert (=> b!648821 (= e!372133 e!372136)))

(declare-fun res!420403 () Bool)

(assert (=> b!648821 (=> res!420403 e!372136)))

(assert (=> b!648821 (= res!420403 (or (not (= (select (arr!18467 a!2986) j!136) lt!301182)) (not (= (select (arr!18467 a!2986) j!136) lt!301174))))))

(assert (=> b!648821 e!372127))

(declare-fun res!420420 () Bool)

(assert (=> b!648821 (=> (not res!420420) (not e!372127))))

(assert (=> b!648821 (= res!420420 (= lt!301174 (select (arr!18467 a!2986) j!136)))))

(assert (=> b!648821 (= lt!301174 (select (store (arr!18467 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!648822 () Bool)

(assert (=> b!648822 (= e!372129 (arrayContainsKey!0 lt!301185 (select (arr!18467 a!2986) j!136) index!984))))

(declare-fun b!648823 () Bool)

(assert (=> b!648823 (= e!372135 true)))

(declare-fun lt!301178 () Bool)

(assert (=> b!648823 (= lt!301178 (contains!3163 Nil!12505 k!1786))))

(declare-fun b!648824 () Bool)

(declare-fun Unit!22071 () Unit!22068)

(assert (=> b!648824 (= e!372134 Unit!22071)))

(declare-fun b!648825 () Bool)

(declare-fun res!420404 () Bool)

(assert (=> b!648825 (=> res!420404 e!372135)))

(assert (=> b!648825 (= res!420404 (contains!3163 Nil!12505 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648826 () Bool)

(declare-fun res!420418 () Bool)

(assert (=> b!648826 (=> (not res!420418) (not e!372126))))

(assert (=> b!648826 (= res!420418 (and (= (size!18831 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18831 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18831 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!648827 () Bool)

(declare-fun lt!301173 () SeekEntryResult!6907)

(assert (=> b!648827 (= e!372138 (= lt!301173 lt!301181))))

(declare-fun b!648828 () Bool)

(declare-fun Unit!22072 () Unit!22068)

(assert (=> b!648828 (= e!372134 Unit!22072)))

(declare-fun lt!301184 () Unit!22068)

(assert (=> b!648828 (= lt!301184 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301185 (select (arr!18467 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!648828 (arrayContainsKey!0 lt!301185 (select (arr!18467 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301189 () Unit!22068)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38522 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12508) Unit!22068)

(assert (=> b!648828 (= lt!301189 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12505))))

(declare-fun arrayNoDuplicates!0 (array!38522 (_ BitVec 32) List!12508) Bool)

(assert (=> b!648828 (arrayNoDuplicates!0 lt!301185 #b00000000000000000000000000000000 Nil!12505)))

(declare-fun lt!301187 () Unit!22068)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38522 (_ BitVec 32) (_ BitVec 32)) Unit!22068)

(assert (=> b!648828 (= lt!301187 (lemmaNoDuplicateFromThenFromBigger!0 lt!301185 #b00000000000000000000000000000000 j!136))))

(assert (=> b!648828 (arrayNoDuplicates!0 lt!301185 j!136 Nil!12505)))

(declare-fun lt!301177 () Unit!22068)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38522 (_ BitVec 64) (_ BitVec 32) List!12508) Unit!22068)

(assert (=> b!648828 (= lt!301177 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301185 (select (arr!18467 a!2986) j!136) j!136 Nil!12505))))

(assert (=> b!648828 false))

(declare-fun b!648829 () Bool)

(declare-fun e!372128 () Bool)

(assert (=> b!648829 (= e!372141 e!372128)))

(declare-fun res!420413 () Bool)

(assert (=> b!648829 (=> (not res!420413) (not e!372128))))

(assert (=> b!648829 (= res!420413 (= (select (store (arr!18467 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648829 (= lt!301185 (array!38523 (store (arr!18467 a!2986) i!1108 k!1786) (size!18831 a!2986)))))

(declare-fun b!648830 () Bool)

(declare-fun res!420411 () Bool)

(assert (=> b!648830 (=> (not res!420411) (not e!372141))))

(assert (=> b!648830 (= res!420411 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12505))))

(declare-fun b!648831 () Bool)

(declare-fun res!420400 () Bool)

(assert (=> b!648831 (=> (not res!420400) (not e!372126))))

(assert (=> b!648831 (= res!420400 (validKeyInArray!0 (select (arr!18467 a!2986) j!136)))))

(declare-fun b!648832 () Bool)

(declare-fun res!420409 () Bool)

(assert (=> b!648832 (=> res!420409 e!372135)))

(declare-fun noDuplicate!425 (List!12508) Bool)

(assert (=> b!648832 (= res!420409 (not (noDuplicate!425 Nil!12505)))))

(declare-fun b!648833 () Bool)

(assert (=> b!648833 (= e!372126 e!372141)))

(declare-fun res!420415 () Bool)

(assert (=> b!648833 (=> (not res!420415) (not e!372141))))

(declare-fun lt!301180 () SeekEntryResult!6907)

(assert (=> b!648833 (= res!420415 (or (= lt!301180 (MissingZero!6907 i!1108)) (= lt!301180 (MissingVacant!6907 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38522 (_ BitVec 32)) SeekEntryResult!6907)

(assert (=> b!648833 (= lt!301180 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!420410 () Bool)

(assert (=> start!58860 (=> (not res!420410) (not e!372126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58860 (= res!420410 (validMask!0 mask!3053))))

(assert (=> start!58860 e!372126))

(assert (=> start!58860 true))

(declare-fun array_inv!14263 (array!38522) Bool)

(assert (=> start!58860 (array_inv!14263 a!2986)))

(declare-fun b!648834 () Bool)

(declare-fun Unit!22073 () Unit!22068)

(assert (=> b!648834 (= e!372130 Unit!22073)))

(assert (=> b!648834 false))

(declare-fun b!648835 () Bool)

(assert (=> b!648835 (= e!372128 e!372137)))

(declare-fun res!420416 () Bool)

(assert (=> b!648835 (=> (not res!420416) (not e!372137))))

(assert (=> b!648835 (= res!420416 (and (= lt!301173 (Found!6907 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18467 a!2986) index!984) (select (arr!18467 a!2986) j!136))) (not (= (select (arr!18467 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!648835 (= lt!301173 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18467 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648836 () Bool)

(declare-fun res!420401 () Bool)

(assert (=> b!648836 (=> (not res!420401) (not e!372141))))

(assert (=> b!648836 (= res!420401 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18467 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!58860 res!420410) b!648826))

(assert (= (and b!648826 res!420418) b!648831))

(assert (= (and b!648831 res!420400) b!648812))

(assert (= (and b!648812 res!420407) b!648811))

(assert (= (and b!648811 res!420414) b!648833))

(assert (= (and b!648833 res!420415) b!648819))

(assert (= (and b!648819 res!420422) b!648830))

(assert (= (and b!648830 res!420411) b!648836))

(assert (= (and b!648836 res!420401) b!648829))

(assert (= (and b!648829 res!420413) b!648835))

(assert (= (and b!648835 res!420416) b!648820))

(assert (= (and b!648820 res!420417) b!648827))

(assert (= (and b!648820 c!74572) b!648834))

(assert (= (and b!648820 (not c!74572)) b!648816))

(assert (= (and b!648820 (not res!420402)) b!648821))

(assert (= (and b!648821 res!420420) b!648810))

(assert (= (and b!648810 (not res!420406)) b!648817))

(assert (= (and b!648817 res!420419) b!648822))

(assert (= (and b!648821 (not res!420403)) b!648815))

(assert (= (and b!648815 c!74573) b!648828))

(assert (= (and b!648815 (not c!74573)) b!648824))

(assert (= (and b!648815 (not res!420408)) b!648818))

(assert (= (and b!648818 res!420421) b!648814))

(assert (= (and b!648818 (not res!420412)) b!648832))

(assert (= (and b!648832 (not res!420409)) b!648813))

(assert (= (and b!648813 (not res!420405)) b!648825))

(assert (= (and b!648825 (not res!420404)) b!648823))

(declare-fun m!622133 () Bool)

(assert (=> b!648829 m!622133))

(declare-fun m!622135 () Bool)

(assert (=> b!648829 m!622135))

(declare-fun m!622137 () Bool)

(assert (=> b!648810 m!622137))

(assert (=> b!648818 m!622137))

(assert (=> b!648818 m!622137))

(declare-fun m!622139 () Bool)

(assert (=> b!648818 m!622139))

(assert (=> b!648818 m!622137))

(declare-fun m!622141 () Bool)

(assert (=> b!648818 m!622141))

(assert (=> b!648818 m!622137))

(declare-fun m!622143 () Bool)

(assert (=> b!648818 m!622143))

(declare-fun m!622145 () Bool)

(assert (=> b!648823 m!622145))

(declare-fun m!622147 () Bool)

(assert (=> b!648832 m!622147))

(declare-fun m!622149 () Bool)

(assert (=> b!648835 m!622149))

(assert (=> b!648835 m!622137))

(assert (=> b!648835 m!622137))

(declare-fun m!622151 () Bool)

(assert (=> b!648835 m!622151))

(declare-fun m!622153 () Bool)

(assert (=> b!648811 m!622153))

(declare-fun m!622155 () Bool)

(assert (=> b!648812 m!622155))

(assert (=> b!648822 m!622137))

(assert (=> b!648822 m!622137))

(declare-fun m!622157 () Bool)

(assert (=> b!648822 m!622157))

(assert (=> b!648814 m!622137))

(assert (=> b!648814 m!622137))

(assert (=> b!648814 m!622157))

(declare-fun m!622159 () Bool)

(assert (=> b!648813 m!622159))

(declare-fun m!622161 () Bool)

(assert (=> b!648836 m!622161))

(assert (=> b!648831 m!622137))

(assert (=> b!648831 m!622137))

(declare-fun m!622163 () Bool)

(assert (=> b!648831 m!622163))

(assert (=> b!648821 m!622137))

(assert (=> b!648821 m!622133))

(declare-fun m!622165 () Bool)

(assert (=> b!648821 m!622165))

(declare-fun m!622167 () Bool)

(assert (=> b!648820 m!622167))

(declare-fun m!622169 () Bool)

(assert (=> b!648820 m!622169))

(declare-fun m!622171 () Bool)

(assert (=> b!648820 m!622171))

(assert (=> b!648820 m!622137))

(declare-fun m!622173 () Bool)

(assert (=> b!648820 m!622173))

(assert (=> b!648820 m!622137))

(declare-fun m!622175 () Bool)

(assert (=> b!648820 m!622175))

(declare-fun m!622177 () Bool)

(assert (=> b!648820 m!622177))

(assert (=> b!648820 m!622133))

(declare-fun m!622179 () Bool)

(assert (=> b!648833 m!622179))

(declare-fun m!622181 () Bool)

(assert (=> b!648819 m!622181))

(declare-fun m!622183 () Bool)

(assert (=> b!648828 m!622183))

(assert (=> b!648828 m!622137))

(assert (=> b!648828 m!622137))

(declare-fun m!622185 () Bool)

(assert (=> b!648828 m!622185))

(assert (=> b!648828 m!622137))

(declare-fun m!622187 () Bool)

(assert (=> b!648828 m!622187))

(assert (=> b!648828 m!622137))

(declare-fun m!622189 () Bool)

(assert (=> b!648828 m!622189))

(declare-fun m!622191 () Bool)

(assert (=> b!648828 m!622191))

(declare-fun m!622193 () Bool)

(assert (=> b!648828 m!622193))

(declare-fun m!622195 () Bool)

(assert (=> b!648828 m!622195))

(assert (=> b!648817 m!622137))

(assert (=> b!648817 m!622137))

(assert (=> b!648817 m!622143))

(declare-fun m!622197 () Bool)

(assert (=> b!648830 m!622197))

(declare-fun m!622199 () Bool)

(assert (=> b!648825 m!622199))

(declare-fun m!622201 () Bool)

(assert (=> start!58860 m!622201))

(declare-fun m!622203 () Bool)

(assert (=> start!58860 m!622203))

(push 1)

