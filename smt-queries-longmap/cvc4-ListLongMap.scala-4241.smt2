; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58554 () Bool)

(assert start!58554)

(declare-fun b!646743 () Bool)

(declare-fun res!419119 () Bool)

(declare-fun e!370754 () Bool)

(assert (=> b!646743 (=> (not res!419119) (not e!370754))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!646743 (= res!419119 (validKeyInArray!0 k!1786))))

(declare-fun b!646744 () Bool)

(declare-datatypes ((Unit!21996 0))(
  ( (Unit!21997) )
))
(declare-fun e!370759 () Unit!21996)

(declare-fun Unit!21998 () Unit!21996)

(assert (=> b!646744 (= e!370759 Unit!21998)))

(declare-fun b!646745 () Bool)

(declare-fun res!419123 () Bool)

(assert (=> b!646745 (=> (not res!419123) (not e!370754))))

(declare-datatypes ((array!38489 0))(
  ( (array!38490 (arr!18455 (Array (_ BitVec 32) (_ BitVec 64))) (size!18819 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38489)

(declare-fun arrayContainsKey!0 (array!38489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!646745 (= res!419123 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!646746 () Bool)

(declare-fun e!370762 () Unit!21996)

(declare-fun Unit!21999 () Unit!21996)

(assert (=> b!646746 (= e!370762 Unit!21999)))

(declare-fun b!646747 () Bool)

(declare-fun res!419126 () Bool)

(declare-fun e!370750 () Bool)

(assert (=> b!646747 (=> (not res!419126) (not e!370750))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!646747 (= res!419126 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18455 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!419114 () Bool)

(assert (=> start!58554 (=> (not res!419114) (not e!370754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58554 (= res!419114 (validMask!0 mask!3053))))

(assert (=> start!58554 e!370754))

(assert (=> start!58554 true))

(declare-fun array_inv!14251 (array!38489) Bool)

(assert (=> start!58554 (array_inv!14251 a!2986)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!300112 () array!38489)

(declare-fun e!370756 () Bool)

(declare-fun b!646748 () Bool)

(assert (=> b!646748 (= e!370756 (arrayContainsKey!0 lt!300112 (select (arr!18455 a!2986) j!136) index!984))))

(declare-fun b!646749 () Bool)

(declare-fun res!419125 () Bool)

(assert (=> b!646749 (=> (not res!419125) (not e!370754))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!646749 (= res!419125 (and (= (size!18819 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18819 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18819 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!646750 () Bool)

(declare-fun res!419121 () Bool)

(assert (=> b!646750 (=> (not res!419121) (not e!370750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38489 (_ BitVec 32)) Bool)

(assert (=> b!646750 (= res!419121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!646751 () Bool)

(declare-fun res!419111 () Bool)

(assert (=> b!646751 (=> (not res!419111) (not e!370750))))

(declare-datatypes ((List!12496 0))(
  ( (Nil!12493) (Cons!12492 (h!13537 (_ BitVec 64)) (t!18724 List!12496)) )
))
(declare-fun arrayNoDuplicates!0 (array!38489 (_ BitVec 32) List!12496) Bool)

(assert (=> b!646751 (= res!419111 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12493))))

(declare-fun b!646752 () Bool)

(declare-fun Unit!22000 () Unit!21996)

(assert (=> b!646752 (= e!370759 Unit!22000)))

(declare-fun lt!300115 () Unit!21996)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38489 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21996)

(assert (=> b!646752 (= lt!300115 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300112 (select (arr!18455 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!646752 (arrayContainsKey!0 lt!300112 (select (arr!18455 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300125 () Unit!21996)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38489 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12496) Unit!21996)

(assert (=> b!646752 (= lt!300125 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12493))))

(assert (=> b!646752 (arrayNoDuplicates!0 lt!300112 #b00000000000000000000000000000000 Nil!12493)))

(declare-fun lt!300121 () Unit!21996)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38489 (_ BitVec 32) (_ BitVec 32)) Unit!21996)

(assert (=> b!646752 (= lt!300121 (lemmaNoDuplicateFromThenFromBigger!0 lt!300112 #b00000000000000000000000000000000 j!136))))

(assert (=> b!646752 (arrayNoDuplicates!0 lt!300112 j!136 Nil!12493)))

(declare-fun lt!300123 () Unit!21996)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38489 (_ BitVec 64) (_ BitVec 32) List!12496) Unit!21996)

(assert (=> b!646752 (= lt!300123 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300112 (select (arr!18455 a!2986) j!136) j!136 Nil!12493))))

(assert (=> b!646752 false))

(declare-fun b!646753 () Bool)

(declare-fun Unit!22001 () Unit!21996)

(assert (=> b!646753 (= e!370762 Unit!22001)))

(assert (=> b!646753 false))

(declare-fun b!646754 () Bool)

(declare-fun e!370763 () Bool)

(declare-datatypes ((SeekEntryResult!6895 0))(
  ( (MissingZero!6895 (index!29918 (_ BitVec 32))) (Found!6895 (index!29919 (_ BitVec 32))) (Intermediate!6895 (undefined!7707 Bool) (index!29920 (_ BitVec 32)) (x!58689 (_ BitVec 32))) (Undefined!6895) (MissingVacant!6895 (index!29921 (_ BitVec 32))) )
))
(declare-fun lt!300114 () SeekEntryResult!6895)

(declare-fun lt!300120 () SeekEntryResult!6895)

(assert (=> b!646754 (= e!370763 (= lt!300114 lt!300120))))

(declare-fun b!646755 () Bool)

(declare-fun e!370753 () Bool)

(declare-fun e!370752 () Bool)

(assert (=> b!646755 (= e!370753 e!370752)))

(declare-fun res!419113 () Bool)

(assert (=> b!646755 (=> res!419113 e!370752)))

(assert (=> b!646755 (= res!419113 (bvsge index!984 j!136))))

(declare-fun lt!300117 () Unit!21996)

(assert (=> b!646755 (= lt!300117 e!370759)))

(declare-fun c!74185 () Bool)

(assert (=> b!646755 (= c!74185 (bvslt j!136 index!984))))

(declare-fun b!646756 () Bool)

(declare-fun e!370755 () Bool)

(assert (=> b!646756 (= e!370755 e!370753)))

(declare-fun res!419118 () Bool)

(assert (=> b!646756 (=> res!419118 e!370753)))

(declare-fun lt!300124 () (_ BitVec 64))

(declare-fun lt!300118 () (_ BitVec 64))

(assert (=> b!646756 (= res!419118 (or (not (= (select (arr!18455 a!2986) j!136) lt!300118)) (not (= (select (arr!18455 a!2986) j!136) lt!300124))))))

(declare-fun e!370761 () Bool)

(assert (=> b!646756 e!370761))

(declare-fun res!419108 () Bool)

(assert (=> b!646756 (=> (not res!419108) (not e!370761))))

(assert (=> b!646756 (= res!419108 (= lt!300124 (select (arr!18455 a!2986) j!136)))))

(assert (=> b!646756 (= lt!300124 (select (store (arr!18455 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!646757 () Bool)

(declare-fun e!370751 () Bool)

(assert (=> b!646757 (= e!370751 e!370756)))

(declare-fun res!419117 () Bool)

(assert (=> b!646757 (=> (not res!419117) (not e!370756))))

(assert (=> b!646757 (= res!419117 (arrayContainsKey!0 lt!300112 (select (arr!18455 a!2986) j!136) j!136))))

(declare-fun b!646758 () Bool)

(declare-fun e!370764 () Bool)

(assert (=> b!646758 (= e!370750 e!370764)))

(declare-fun res!419116 () Bool)

(assert (=> b!646758 (=> (not res!419116) (not e!370764))))

(assert (=> b!646758 (= res!419116 (= (select (store (arr!18455 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646758 (= lt!300112 (array!38490 (store (arr!18455 a!2986) i!1108 k!1786) (size!18819 a!2986)))))

(declare-fun b!646759 () Bool)

(declare-fun res!419115 () Bool)

(assert (=> b!646759 (=> (not res!419115) (not e!370754))))

(assert (=> b!646759 (= res!419115 (validKeyInArray!0 (select (arr!18455 a!2986) j!136)))))

(declare-fun b!646760 () Bool)

(declare-fun e!370760 () Bool)

(assert (=> b!646760 (= e!370760 (arrayContainsKey!0 lt!300112 (select (arr!18455 a!2986) j!136) index!984))))

(declare-fun b!646761 () Bool)

(declare-fun e!370757 () Bool)

(assert (=> b!646761 (= e!370752 e!370757)))

(declare-fun res!419124 () Bool)

(assert (=> b!646761 (=> res!419124 e!370757)))

(assert (=> b!646761 (= res!419124 (or (bvsge (size!18819 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18819 a!2986))))))

(assert (=> b!646761 (arrayContainsKey!0 lt!300112 (select (arr!18455 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300116 () Unit!21996)

(assert (=> b!646761 (= lt!300116 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300112 (select (arr!18455 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!646761 e!370760))

(declare-fun res!419120 () Bool)

(assert (=> b!646761 (=> (not res!419120) (not e!370760))))

(assert (=> b!646761 (= res!419120 (arrayContainsKey!0 lt!300112 (select (arr!18455 a!2986) j!136) j!136))))

(declare-fun b!646762 () Bool)

(assert (=> b!646762 (= e!370761 e!370751)))

(declare-fun res!419122 () Bool)

(assert (=> b!646762 (=> res!419122 e!370751)))

(assert (=> b!646762 (= res!419122 (or (not (= (select (arr!18455 a!2986) j!136) lt!300118)) (not (= (select (arr!18455 a!2986) j!136) lt!300124)) (bvsge j!136 index!984)))))

(declare-fun b!646763 () Bool)

(declare-fun noDuplicate!413 (List!12496) Bool)

(assert (=> b!646763 (= e!370757 (noDuplicate!413 Nil!12493))))

(declare-fun b!646764 () Bool)

(declare-fun e!370758 () Bool)

(assert (=> b!646764 (= e!370758 (not e!370755))))

(declare-fun res!419112 () Bool)

(assert (=> b!646764 (=> res!419112 e!370755)))

(declare-fun lt!300119 () SeekEntryResult!6895)

(assert (=> b!646764 (= res!419112 (not (= lt!300119 (Found!6895 index!984))))))

(declare-fun lt!300113 () Unit!21996)

(assert (=> b!646764 (= lt!300113 e!370762)))

(declare-fun c!74186 () Bool)

(assert (=> b!646764 (= c!74186 (= lt!300119 Undefined!6895))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38489 (_ BitVec 32)) SeekEntryResult!6895)

(assert (=> b!646764 (= lt!300119 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300118 lt!300112 mask!3053))))

(assert (=> b!646764 e!370763))

(declare-fun res!419109 () Bool)

(assert (=> b!646764 (=> (not res!419109) (not e!370763))))

(declare-fun lt!300127 () (_ BitVec 32))

(assert (=> b!646764 (= res!419109 (= lt!300120 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300127 vacantSpotIndex!68 lt!300118 lt!300112 mask!3053)))))

(assert (=> b!646764 (= lt!300120 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300127 vacantSpotIndex!68 (select (arr!18455 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!646764 (= lt!300118 (select (store (arr!18455 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!300122 () Unit!21996)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38489 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21996)

(assert (=> b!646764 (= lt!300122 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300127 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!646764 (= lt!300127 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!646765 () Bool)

(assert (=> b!646765 (= e!370764 e!370758)))

(declare-fun res!419107 () Bool)

(assert (=> b!646765 (=> (not res!419107) (not e!370758))))

(assert (=> b!646765 (= res!419107 (and (= lt!300114 (Found!6895 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18455 a!2986) index!984) (select (arr!18455 a!2986) j!136))) (not (= (select (arr!18455 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!646765 (= lt!300114 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18455 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646766 () Bool)

(assert (=> b!646766 (= e!370754 e!370750)))

(declare-fun res!419110 () Bool)

(assert (=> b!646766 (=> (not res!419110) (not e!370750))))

(declare-fun lt!300126 () SeekEntryResult!6895)

(assert (=> b!646766 (= res!419110 (or (= lt!300126 (MissingZero!6895 i!1108)) (= lt!300126 (MissingVacant!6895 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38489 (_ BitVec 32)) SeekEntryResult!6895)

(assert (=> b!646766 (= lt!300126 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!58554 res!419114) b!646749))

(assert (= (and b!646749 res!419125) b!646759))

(assert (= (and b!646759 res!419115) b!646743))

(assert (= (and b!646743 res!419119) b!646745))

(assert (= (and b!646745 res!419123) b!646766))

(assert (= (and b!646766 res!419110) b!646750))

(assert (= (and b!646750 res!419121) b!646751))

(assert (= (and b!646751 res!419111) b!646747))

(assert (= (and b!646747 res!419126) b!646758))

(assert (= (and b!646758 res!419116) b!646765))

(assert (= (and b!646765 res!419107) b!646764))

(assert (= (and b!646764 res!419109) b!646754))

(assert (= (and b!646764 c!74186) b!646753))

(assert (= (and b!646764 (not c!74186)) b!646746))

(assert (= (and b!646764 (not res!419112)) b!646756))

(assert (= (and b!646756 res!419108) b!646762))

(assert (= (and b!646762 (not res!419122)) b!646757))

(assert (= (and b!646757 res!419117) b!646748))

(assert (= (and b!646756 (not res!419118)) b!646755))

(assert (= (and b!646755 c!74185) b!646752))

(assert (= (and b!646755 (not c!74185)) b!646744))

(assert (= (and b!646755 (not res!419113)) b!646761))

(assert (= (and b!646761 res!419120) b!646760))

(assert (= (and b!646761 (not res!419124)) b!646763))

(declare-fun m!620183 () Bool)

(assert (=> b!646752 m!620183))

(assert (=> b!646752 m!620183))

(declare-fun m!620185 () Bool)

(assert (=> b!646752 m!620185))

(declare-fun m!620187 () Bool)

(assert (=> b!646752 m!620187))

(declare-fun m!620189 () Bool)

(assert (=> b!646752 m!620189))

(assert (=> b!646752 m!620183))

(declare-fun m!620191 () Bool)

(assert (=> b!646752 m!620191))

(declare-fun m!620193 () Bool)

(assert (=> b!646752 m!620193))

(declare-fun m!620195 () Bool)

(assert (=> b!646752 m!620195))

(assert (=> b!646752 m!620183))

(declare-fun m!620197 () Bool)

(assert (=> b!646752 m!620197))

(assert (=> b!646759 m!620183))

(assert (=> b!646759 m!620183))

(declare-fun m!620199 () Bool)

(assert (=> b!646759 m!620199))

(assert (=> b!646762 m!620183))

(declare-fun m!620201 () Bool)

(assert (=> b!646743 m!620201))

(assert (=> b!646760 m!620183))

(assert (=> b!646760 m!620183))

(declare-fun m!620203 () Bool)

(assert (=> b!646760 m!620203))

(declare-fun m!620205 () Bool)

(assert (=> start!58554 m!620205))

(declare-fun m!620207 () Bool)

(assert (=> start!58554 m!620207))

(declare-fun m!620209 () Bool)

(assert (=> b!646758 m!620209))

(declare-fun m!620211 () Bool)

(assert (=> b!646758 m!620211))

(assert (=> b!646748 m!620183))

(assert (=> b!646748 m!620183))

(assert (=> b!646748 m!620203))

(assert (=> b!646761 m!620183))

(assert (=> b!646761 m!620183))

(declare-fun m!620213 () Bool)

(assert (=> b!646761 m!620213))

(assert (=> b!646761 m!620183))

(declare-fun m!620215 () Bool)

(assert (=> b!646761 m!620215))

(assert (=> b!646761 m!620183))

(declare-fun m!620217 () Bool)

(assert (=> b!646761 m!620217))

(declare-fun m!620219 () Bool)

(assert (=> b!646766 m!620219))

(assert (=> b!646757 m!620183))

(assert (=> b!646757 m!620183))

(assert (=> b!646757 m!620217))

(declare-fun m!620221 () Bool)

(assert (=> b!646763 m!620221))

(declare-fun m!620223 () Bool)

(assert (=> b!646745 m!620223))

(declare-fun m!620225 () Bool)

(assert (=> b!646751 m!620225))

(declare-fun m!620227 () Bool)

(assert (=> b!646764 m!620227))

(declare-fun m!620229 () Bool)

(assert (=> b!646764 m!620229))

(declare-fun m!620231 () Bool)

(assert (=> b!646764 m!620231))

(assert (=> b!646764 m!620183))

(assert (=> b!646764 m!620209))

(assert (=> b!646764 m!620183))

(declare-fun m!620233 () Bool)

(assert (=> b!646764 m!620233))

(declare-fun m!620235 () Bool)

(assert (=> b!646764 m!620235))

(declare-fun m!620237 () Bool)

(assert (=> b!646764 m!620237))

(declare-fun m!620239 () Bool)

(assert (=> b!646765 m!620239))

(assert (=> b!646765 m!620183))

(assert (=> b!646765 m!620183))

(declare-fun m!620241 () Bool)

(assert (=> b!646765 m!620241))

(declare-fun m!620243 () Bool)

(assert (=> b!646747 m!620243))

(declare-fun m!620245 () Bool)

(assert (=> b!646750 m!620245))

(assert (=> b!646756 m!620183))

(assert (=> b!646756 m!620209))

(declare-fun m!620247 () Bool)

(assert (=> b!646756 m!620247))

(push 1)

(assert (not start!58554))

(assert (not b!646757))

(assert (not b!646743))

(assert (not b!646751))

(assert (not b!646763))

(assert (not b!646766))

(assert (not b!646759))

(assert (not b!646764))

(assert (not b!646745))

(assert (not b!646760))

(assert (not b!646752))

(assert (not b!646748))

(assert (not b!646765))

(assert (not b!646761))

(assert (not b!646750))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91397 () Bool)

(assert (=> d!91397 (= (validKeyInArray!0 (select (arr!18455 a!2986) j!136)) (and (not (= (select (arr!18455 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18455 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!646759 d!91397))

(declare-fun d!91399 () Bool)

(declare-fun res!419163 () Bool)

(declare-fun e!370815 () Bool)

(assert (=> d!91399 (=> res!419163 e!370815)))

(assert (=> d!91399 (= res!419163 (= (select (arr!18455 lt!300112) index!984) (select (arr!18455 a!2986) j!136)))))

(assert (=> d!91399 (= (arrayContainsKey!0 lt!300112 (select (arr!18455 a!2986) j!136) index!984) e!370815)))

(declare-fun b!646831 () Bool)

(declare-fun e!370816 () Bool)

(assert (=> b!646831 (= e!370815 e!370816)))

(declare-fun res!419164 () Bool)

(assert (=> b!646831 (=> (not res!419164) (not e!370816))))

(assert (=> b!646831 (= res!419164 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18819 lt!300112)))))

(declare-fun b!646832 () Bool)

(assert (=> b!646832 (= e!370816 (arrayContainsKey!0 lt!300112 (select (arr!18455 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91399 (not res!419163)) b!646831))

(assert (= (and b!646831 res!419164) b!646832))

(declare-fun m!620307 () Bool)

(assert (=> d!91399 m!620307))

(assert (=> b!646832 m!620183))

(declare-fun m!620309 () Bool)

(assert (=> b!646832 m!620309))

(assert (=> b!646748 d!91399))

(declare-fun b!646869 () Bool)

(declare-fun e!370845 () Bool)

(declare-fun e!370844 () Bool)

(assert (=> b!646869 (= e!370845 e!370844)))

(declare-fun lt!300165 () (_ BitVec 64))

(assert (=> b!646869 (= lt!300165 (select (arr!18455 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!300166 () Unit!21996)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38489 (_ BitVec 64) (_ BitVec 32)) Unit!21996)

(assert (=> b!646869 (= lt!300166 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!300165 #b00000000000000000000000000000000))))

(assert (=> b!646869 (arrayContainsKey!0 a!2986 lt!300165 #b00000000000000000000000000000000)))

(declare-fun lt!300167 () Unit!21996)

(assert (=> b!646869 (= lt!300167 lt!300166)))

(declare-fun res!419187 () Bool)

(assert (=> b!646869 (= res!419187 (= (seekEntryOrOpen!0 (select (arr!18455 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6895 #b00000000000000000000000000000000)))))

(assert (=> b!646869 (=> (not res!419187) (not e!370844))))

(declare-fun d!91415 () Bool)

(declare-fun res!419188 () Bool)

(declare-fun e!370846 () Bool)

(assert (=> d!91415 (=> res!419188 e!370846)))

(assert (=> d!91415 (= res!419188 (bvsge #b00000000000000000000000000000000 (size!18819 a!2986)))))

(assert (=> d!91415 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!370846)))

(declare-fun bm!33664 () Bool)

(declare-fun call!33667 () Bool)

(assert (=> bm!33664 (= call!33667 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!646870 () Bool)

(assert (=> b!646870 (= e!370846 e!370845)))

(declare-fun c!74206 () Bool)

(assert (=> b!646870 (= c!74206 (validKeyInArray!0 (select (arr!18455 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!646871 () Bool)

(assert (=> b!646871 (= e!370845 call!33667)))

(declare-fun b!646872 () Bool)

(assert (=> b!646872 (= e!370844 call!33667)))

(assert (= (and d!91415 (not res!419188)) b!646870))

(assert (= (and b!646870 c!74206) b!646869))

(assert (= (and b!646870 (not c!74206)) b!646871))

(assert (= (and b!646869 res!419187) b!646872))

(assert (= (or b!646872 b!646871) bm!33664))

(declare-fun m!620325 () Bool)

(assert (=> b!646869 m!620325))

(declare-fun m!620327 () Bool)

(assert (=> b!646869 m!620327))

(declare-fun m!620329 () Bool)

(assert (=> b!646869 m!620329))

(assert (=> b!646869 m!620325))

(declare-fun m!620331 () Bool)

(assert (=> b!646869 m!620331))

(declare-fun m!620333 () Bool)

(assert (=> bm!33664 m!620333))

(assert (=> b!646870 m!620325))

(assert (=> b!646870 m!620325))

(declare-fun m!620335 () Bool)

(assert (=> b!646870 m!620335))

(assert (=> b!646750 d!91415))

(assert (=> b!646760 d!91399))

(declare-fun d!91425 () Bool)

(declare-fun res!419189 () Bool)

(declare-fun e!370852 () Bool)

(assert (=> d!91425 (=> res!419189 e!370852)))

(assert (=> d!91425 (= res!419189 (= (select (arr!18455 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!91425 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!370852)))

(declare-fun b!646879 () Bool)

(declare-fun e!370853 () Bool)

(assert (=> b!646879 (= e!370852 e!370853)))

(declare-fun res!419190 () Bool)

(assert (=> b!646879 (=> (not res!419190) (not e!370853))))

(assert (=> b!646879 (= res!419190 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18819 a!2986)))))

(declare-fun b!646880 () Bool)

(assert (=> b!646880 (= e!370853 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91425 (not res!419189)) b!646879))

(assert (= (and b!646879 res!419190) b!646880))

(assert (=> d!91425 m!620325))

(declare-fun m!620347 () Bool)

(assert (=> b!646880 m!620347))

(assert (=> b!646745 d!91425))

(declare-fun d!91429 () Bool)

(assert (=> d!91429 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58554 d!91429))

(declare-fun d!91437 () Bool)

(assert (=> d!91437 (= (array_inv!14251 a!2986) (bvsge (size!18819 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58554 d!91437))

(declare-fun d!91439 () Bool)

(declare-fun res!419194 () Bool)

(declare-fun e!370858 () Bool)

(assert (=> d!91439 (=> res!419194 e!370858)))

(assert (=> d!91439 (= res!419194 (= (select (arr!18455 lt!300112) j!136) (select (arr!18455 a!2986) j!136)))))

(assert (=> d!91439 (= (arrayContainsKey!0 lt!300112 (select (arr!18455 a!2986) j!136) j!136) e!370858)))

(declare-fun b!646886 () Bool)

(declare-fun e!370859 () Bool)

(assert (=> b!646886 (= e!370858 e!370859)))

(declare-fun res!419195 () Bool)

(assert (=> b!646886 (=> (not res!419195) (not e!370859))))

(assert (=> b!646886 (= res!419195 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18819 lt!300112)))))

(declare-fun b!646887 () Bool)

(assert (=> b!646887 (= e!370859 (arrayContainsKey!0 lt!300112 (select (arr!18455 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91439 (not res!419194)) b!646886))

(assert (= (and b!646886 res!419195) b!646887))

(declare-fun m!620363 () Bool)

(assert (=> d!91439 m!620363))

(assert (=> b!646887 m!620183))

(declare-fun m!620365 () Bool)

(assert (=> b!646887 m!620365))

(assert (=> b!646757 d!91439))

(declare-fun d!91441 () Bool)

(assert (=> d!91441 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!646743 d!91441))

(declare-fun b!646931 () Bool)

(declare-fun e!370890 () SeekEntryResult!6895)

(assert (=> b!646931 (= e!370890 (Found!6895 index!984))))

(declare-fun e!370891 () SeekEntryResult!6895)

(declare-fun b!646932 () Bool)

(assert (=> b!646932 (= e!370891 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!300118 lt!300112 mask!3053))))

(declare-fun b!646933 () Bool)

(declare-fun e!370892 () SeekEntryResult!6895)

(assert (=> b!646933 (= e!370892 Undefined!6895)))

(declare-fun b!646934 () Bool)

(assert (=> b!646934 (= e!370892 e!370890)))

(declare-fun c!74227 () Bool)

(declare-fun lt!300193 () (_ BitVec 64))

(assert (=> b!646934 (= c!74227 (= lt!300193 lt!300118))))

(declare-fun b!646935 () Bool)

(assert (=> b!646935 (= e!370891 (MissingVacant!6895 vacantSpotIndex!68))))

(declare-fun b!646936 () Bool)

(declare-fun c!74228 () Bool)

(assert (=> b!646936 (= c!74228 (= lt!300193 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646936 (= e!370890 e!370891)))

(declare-fun lt!300194 () SeekEntryResult!6895)

(declare-fun d!91443 () Bool)

(assert (=> d!91443 (and (or (is-Undefined!6895 lt!300194) (not (is-Found!6895 lt!300194)) (and (bvsge (index!29919 lt!300194) #b00000000000000000000000000000000) (bvslt (index!29919 lt!300194) (size!18819 lt!300112)))) (or (is-Undefined!6895 lt!300194) (is-Found!6895 lt!300194) (not (is-MissingVacant!6895 lt!300194)) (not (= (index!29921 lt!300194) vacantSpotIndex!68)) (and (bvsge (index!29921 lt!300194) #b00000000000000000000000000000000) (bvslt (index!29921 lt!300194) (size!18819 lt!300112)))) (or (is-Undefined!6895 lt!300194) (ite (is-Found!6895 lt!300194) (= (select (arr!18455 lt!300112) (index!29919 lt!300194)) lt!300118) (and (is-MissingVacant!6895 lt!300194) (= (index!29921 lt!300194) vacantSpotIndex!68) (= (select (arr!18455 lt!300112) (index!29921 lt!300194)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91443 (= lt!300194 e!370892)))

(declare-fun c!74226 () Bool)

(assert (=> d!91443 (= c!74226 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91443 (= lt!300193 (select (arr!18455 lt!300112) index!984))))

(assert (=> d!91443 (validMask!0 mask!3053)))

(assert (=> d!91443 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300118 lt!300112 mask!3053) lt!300194)))

(assert (= (and d!91443 c!74226) b!646933))

(assert (= (and d!91443 (not c!74226)) b!646934))

(assert (= (and b!646934 c!74227) b!646931))

(assert (= (and b!646934 (not c!74227)) b!646936))

(assert (= (and b!646936 c!74228) b!646935))

(assert (= (and b!646936 (not c!74228)) b!646932))

(assert (=> b!646932 m!620227))

(assert (=> b!646932 m!620227))

(declare-fun m!620405 () Bool)

(assert (=> b!646932 m!620405))

(declare-fun m!620407 () Bool)

(assert (=> d!91443 m!620407))

(declare-fun m!620409 () Bool)

(assert (=> d!91443 m!620409))

(assert (=> d!91443 m!620307))

(assert (=> d!91443 m!620205))

(assert (=> b!646764 d!91443))

(declare-fun d!91461 () Bool)

(declare-fun e!370919 () Bool)

(assert (=> d!91461 e!370919))

(declare-fun res!419219 () Bool)

(assert (=> d!91461 (=> (not res!419219) (not e!370919))))

(assert (=> d!91461 (= res!419219 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18819 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18819 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18819 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18819 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18819 a!2986))))))

(declare-fun lt!300218 () Unit!21996)

(declare-fun choose!9 (array!38489 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21996)

(assert (=> d!91461 (= lt!300218 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300127 vacantSpotIndex!68 mask!3053))))

