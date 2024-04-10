; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57806 () Bool)

(assert start!57806)

(declare-fun b!639248 () Bool)

(declare-fun res!413824 () Bool)

(declare-fun e!365844 () Bool)

(assert (=> b!639248 (=> (not res!413824) (not e!365844))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38308 0))(
  ( (array!38309 (arr!18375 (Array (_ BitVec 32) (_ BitVec 64))) (size!18739 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38308)

(assert (=> b!639248 (= res!413824 (and (= (size!18739 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18739 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18739 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639250 () Bool)

(declare-fun res!413822 () Bool)

(assert (=> b!639250 (=> (not res!413822) (not e!365844))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639250 (= res!413822 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639251 () Bool)

(declare-fun e!365842 () Bool)

(declare-fun e!365845 () Bool)

(assert (=> b!639251 (= e!365842 e!365845)))

(declare-fun res!413823 () Bool)

(assert (=> b!639251 (=> (not res!413823) (not e!365845))))

(declare-datatypes ((SeekEntryResult!6815 0))(
  ( (MissingZero!6815 (index!29577 (_ BitVec 32))) (Found!6815 (index!29578 (_ BitVec 32))) (Intermediate!6815 (undefined!7627 Bool) (index!29579 (_ BitVec 32)) (x!58338 (_ BitVec 32))) (Undefined!6815) (MissingVacant!6815 (index!29580 (_ BitVec 32))) )
))
(declare-fun lt!295691 () SeekEntryResult!6815)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!639251 (= res!413823 (and (= lt!295691 (Found!6815 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18375 a!2986) index!984) (select (arr!18375 a!2986) j!136))) (not (= (select (arr!18375 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38308 (_ BitVec 32)) SeekEntryResult!6815)

(assert (=> b!639251 (= lt!295691 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18375 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639252 () Bool)

(declare-fun e!365839 () Bool)

(assert (=> b!639252 (= e!365845 (not e!365839))))

(declare-fun res!413814 () Bool)

(assert (=> b!639252 (=> res!413814 e!365839)))

(declare-fun lt!295698 () SeekEntryResult!6815)

(assert (=> b!639252 (= res!413814 (not (= lt!295698 (Found!6815 index!984))))))

(declare-datatypes ((Unit!21594 0))(
  ( (Unit!21595) )
))
(declare-fun lt!295696 () Unit!21594)

(declare-fun e!365843 () Unit!21594)

(assert (=> b!639252 (= lt!295696 e!365843)))

(declare-fun c!73085 () Bool)

(assert (=> b!639252 (= c!73085 (= lt!295698 Undefined!6815))))

(declare-fun lt!295702 () (_ BitVec 64))

(declare-fun lt!295701 () array!38308)

(assert (=> b!639252 (= lt!295698 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295702 lt!295701 mask!3053))))

(declare-fun e!365849 () Bool)

(assert (=> b!639252 e!365849))

(declare-fun res!413819 () Bool)

(assert (=> b!639252 (=> (not res!413819) (not e!365849))))

(declare-fun lt!295700 () (_ BitVec 32))

(declare-fun lt!295695 () SeekEntryResult!6815)

(assert (=> b!639252 (= res!413819 (= lt!295695 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295700 vacantSpotIndex!68 lt!295702 lt!295701 mask!3053)))))

(assert (=> b!639252 (= lt!295695 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295700 vacantSpotIndex!68 (select (arr!18375 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639252 (= lt!295702 (select (store (arr!18375 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!295699 () Unit!21594)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38308 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21594)

(assert (=> b!639252 (= lt!295699 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295700 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639252 (= lt!295700 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639253 () Bool)

(declare-fun res!413821 () Bool)

(assert (=> b!639253 (=> (not res!413821) (not e!365844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639253 (= res!413821 (validKeyInArray!0 (select (arr!18375 a!2986) j!136)))))

(declare-fun b!639254 () Bool)

(declare-fun e!365841 () Bool)

(declare-fun e!365847 () Bool)

(assert (=> b!639254 (= e!365841 e!365847)))

(declare-fun res!413826 () Bool)

(assert (=> b!639254 (=> (not res!413826) (not e!365847))))

(assert (=> b!639254 (= res!413826 (arrayContainsKey!0 lt!295701 (select (arr!18375 a!2986) j!136) j!136))))

(declare-fun b!639249 () Bool)

(declare-fun e!365850 () Bool)

(assert (=> b!639249 (= e!365850 e!365841)))

(declare-fun res!413813 () Bool)

(assert (=> b!639249 (=> res!413813 e!365841)))

(declare-fun lt!295694 () (_ BitVec 64))

(assert (=> b!639249 (= res!413813 (or (not (= (select (arr!18375 a!2986) j!136) lt!295702)) (not (= (select (arr!18375 a!2986) j!136) lt!295694)) (bvsge j!136 index!984)))))

(declare-fun res!413812 () Bool)

(assert (=> start!57806 (=> (not res!413812) (not e!365844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57806 (= res!413812 (validMask!0 mask!3053))))

(assert (=> start!57806 e!365844))

(assert (=> start!57806 true))

(declare-fun array_inv!14171 (array!38308) Bool)

(assert (=> start!57806 (array_inv!14171 a!2986)))

(declare-fun b!639255 () Bool)

(declare-fun e!365848 () Bool)

(assert (=> b!639255 (= e!365844 e!365848)))

(declare-fun res!413828 () Bool)

(assert (=> b!639255 (=> (not res!413828) (not e!365848))))

(declare-fun lt!295697 () SeekEntryResult!6815)

(assert (=> b!639255 (= res!413828 (or (= lt!295697 (MissingZero!6815 i!1108)) (= lt!295697 (MissingVacant!6815 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38308 (_ BitVec 32)) SeekEntryResult!6815)

(assert (=> b!639255 (= lt!295697 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!639256 () Bool)

(declare-fun res!413825 () Bool)

(assert (=> b!639256 (=> (not res!413825) (not e!365848))))

(assert (=> b!639256 (= res!413825 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18375 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639257 () Bool)

(declare-fun e!365846 () Bool)

(assert (=> b!639257 (= e!365839 e!365846)))

(declare-fun res!413815 () Bool)

(assert (=> b!639257 (=> res!413815 e!365846)))

(assert (=> b!639257 (= res!413815 (or (not (= (select (arr!18375 a!2986) j!136) lt!295702)) (not (= (select (arr!18375 a!2986) j!136) lt!295694)) (bvsge j!136 index!984)))))

(assert (=> b!639257 e!365850))

(declare-fun res!413816 () Bool)

(assert (=> b!639257 (=> (not res!413816) (not e!365850))))

(assert (=> b!639257 (= res!413816 (= lt!295694 (select (arr!18375 a!2986) j!136)))))

(assert (=> b!639257 (= lt!295694 (select (store (arr!18375 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!639258 () Bool)

(assert (=> b!639258 (= e!365848 e!365842)))

(declare-fun res!413818 () Bool)

(assert (=> b!639258 (=> (not res!413818) (not e!365842))))

(assert (=> b!639258 (= res!413818 (= (select (store (arr!18375 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639258 (= lt!295701 (array!38309 (store (arr!18375 a!2986) i!1108 k!1786) (size!18739 a!2986)))))

(declare-fun b!639259 () Bool)

(declare-fun Unit!21596 () Unit!21594)

(assert (=> b!639259 (= e!365843 Unit!21596)))

(assert (=> b!639259 false))

(declare-fun b!639260 () Bool)

(assert (=> b!639260 (= e!365849 (= lt!295691 lt!295695))))

(declare-fun b!639261 () Bool)

(declare-fun res!413817 () Bool)

(assert (=> b!639261 (=> (not res!413817) (not e!365844))))

(assert (=> b!639261 (= res!413817 (validKeyInArray!0 k!1786))))

(declare-fun b!639262 () Bool)

(declare-fun Unit!21597 () Unit!21594)

(assert (=> b!639262 (= e!365843 Unit!21597)))

(declare-fun b!639263 () Bool)

(assert (=> b!639263 (= e!365847 (arrayContainsKey!0 lt!295701 (select (arr!18375 a!2986) j!136) index!984))))

(declare-fun b!639264 () Bool)

(declare-fun res!413820 () Bool)

(assert (=> b!639264 (=> (not res!413820) (not e!365848))))

(declare-datatypes ((List!12416 0))(
  ( (Nil!12413) (Cons!12412 (h!13457 (_ BitVec 64)) (t!18644 List!12416)) )
))
(declare-fun arrayNoDuplicates!0 (array!38308 (_ BitVec 32) List!12416) Bool)

(assert (=> b!639264 (= res!413820 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12413))))

(declare-fun b!639265 () Bool)

(assert (=> b!639265 (= e!365846 (or (bvsge (size!18739 a!2986) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (size!18739 a!2986))))))

(assert (=> b!639265 (arrayNoDuplicates!0 lt!295701 #b00000000000000000000000000000000 Nil!12413)))

(declare-fun lt!295693 () Unit!21594)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38308 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12416) Unit!21594)

(assert (=> b!639265 (= lt!295693 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12413))))

(assert (=> b!639265 (arrayContainsKey!0 lt!295701 (select (arr!18375 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295692 () Unit!21594)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38308 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21594)

(assert (=> b!639265 (= lt!295692 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295701 (select (arr!18375 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!639266 () Bool)

(declare-fun res!413827 () Bool)

(assert (=> b!639266 (=> (not res!413827) (not e!365848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38308 (_ BitVec 32)) Bool)

(assert (=> b!639266 (= res!413827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!57806 res!413812) b!639248))

(assert (= (and b!639248 res!413824) b!639253))

(assert (= (and b!639253 res!413821) b!639261))

(assert (= (and b!639261 res!413817) b!639250))

(assert (= (and b!639250 res!413822) b!639255))

(assert (= (and b!639255 res!413828) b!639266))

(assert (= (and b!639266 res!413827) b!639264))

(assert (= (and b!639264 res!413820) b!639256))

(assert (= (and b!639256 res!413825) b!639258))

(assert (= (and b!639258 res!413818) b!639251))

(assert (= (and b!639251 res!413823) b!639252))

(assert (= (and b!639252 res!413819) b!639260))

(assert (= (and b!639252 c!73085) b!639259))

(assert (= (and b!639252 (not c!73085)) b!639262))

(assert (= (and b!639252 (not res!413814)) b!639257))

(assert (= (and b!639257 res!413816) b!639249))

(assert (= (and b!639249 (not res!413813)) b!639254))

(assert (= (and b!639254 res!413826) b!639263))

(assert (= (and b!639257 (not res!413815)) b!639265))

(declare-fun m!613121 () Bool)

(assert (=> b!639252 m!613121))

(declare-fun m!613123 () Bool)

(assert (=> b!639252 m!613123))

(declare-fun m!613125 () Bool)

(assert (=> b!639252 m!613125))

(declare-fun m!613127 () Bool)

(assert (=> b!639252 m!613127))

(declare-fun m!613129 () Bool)

(assert (=> b!639252 m!613129))

(assert (=> b!639252 m!613125))

(declare-fun m!613131 () Bool)

(assert (=> b!639252 m!613131))

(declare-fun m!613133 () Bool)

(assert (=> b!639252 m!613133))

(declare-fun m!613135 () Bool)

(assert (=> b!639252 m!613135))

(assert (=> b!639254 m!613125))

(assert (=> b!639254 m!613125))

(declare-fun m!613137 () Bool)

(assert (=> b!639254 m!613137))

(assert (=> b!639257 m!613125))

(assert (=> b!639257 m!613127))

(declare-fun m!613139 () Bool)

(assert (=> b!639257 m!613139))

(declare-fun m!613141 () Bool)

(assert (=> start!57806 m!613141))

(declare-fun m!613143 () Bool)

(assert (=> start!57806 m!613143))

(declare-fun m!613145 () Bool)

(assert (=> b!639264 m!613145))

(declare-fun m!613147 () Bool)

(assert (=> b!639255 m!613147))

(declare-fun m!613149 () Bool)

(assert (=> b!639261 m!613149))

(assert (=> b!639263 m!613125))

(assert (=> b!639263 m!613125))

(declare-fun m!613151 () Bool)

(assert (=> b!639263 m!613151))

(assert (=> b!639253 m!613125))

(assert (=> b!639253 m!613125))

(declare-fun m!613153 () Bool)

(assert (=> b!639253 m!613153))

(assert (=> b!639258 m!613127))

(declare-fun m!613155 () Bool)

(assert (=> b!639258 m!613155))

(declare-fun m!613157 () Bool)

(assert (=> b!639250 m!613157))

(assert (=> b!639265 m!613125))

(assert (=> b!639265 m!613125))

(declare-fun m!613159 () Bool)

(assert (=> b!639265 m!613159))

(assert (=> b!639265 m!613125))

(declare-fun m!613161 () Bool)

(assert (=> b!639265 m!613161))

(declare-fun m!613163 () Bool)

(assert (=> b!639265 m!613163))

(declare-fun m!613165 () Bool)

(assert (=> b!639265 m!613165))

(declare-fun m!613167 () Bool)

(assert (=> b!639251 m!613167))

(assert (=> b!639251 m!613125))

(assert (=> b!639251 m!613125))

(declare-fun m!613169 () Bool)

(assert (=> b!639251 m!613169))

(declare-fun m!613171 () Bool)

(assert (=> b!639266 m!613171))

(assert (=> b!639249 m!613125))

(declare-fun m!613173 () Bool)

(assert (=> b!639256 m!613173))

(push 1)

