; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58998 () Bool)

(assert start!58998)

(declare-fun b!651118 () Bool)

(declare-fun e!373609 () Bool)

(declare-fun e!373610 () Bool)

(assert (=> b!651118 (= e!373609 e!373610)))

(declare-fun res!422175 () Bool)

(assert (=> b!651118 (=> res!422175 e!373610)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!302713 () (_ BitVec 64))

(declare-fun lt!302708 () (_ BitVec 64))

(declare-datatypes ((array!38579 0))(
  ( (array!38580 (arr!18494 (Array (_ BitVec 32) (_ BitVec 64))) (size!18858 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38579)

(assert (=> b!651118 (= res!422175 (or (not (= (select (arr!18494 a!2986) j!136) lt!302713)) (not (= (select (arr!18494 a!2986) j!136) lt!302708))))))

(declare-fun e!373597 () Bool)

(assert (=> b!651118 e!373597))

(declare-fun res!422177 () Bool)

(assert (=> b!651118 (=> (not res!422177) (not e!373597))))

(assert (=> b!651118 (= res!422177 (= lt!302708 (select (arr!18494 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!651118 (= lt!302708 (select (store (arr!18494 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!651119 () Bool)

(declare-fun res!422178 () Bool)

(declare-fun e!373611 () Bool)

(assert (=> b!651119 (=> (not res!422178) (not e!373611))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!651119 (= res!422178 (and (= (size!18858 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18858 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18858 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!651120 () Bool)

(declare-fun res!422176 () Bool)

(declare-fun e!373604 () Bool)

(assert (=> b!651120 (=> (not res!422176) (not e!373604))))

(declare-datatypes ((List!12535 0))(
  ( (Nil!12532) (Cons!12531 (h!13576 (_ BitVec 64)) (t!18763 List!12535)) )
))
(declare-fun arrayNoDuplicates!0 (array!38579 (_ BitVec 32) List!12535) Bool)

(assert (=> b!651120 (= res!422176 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12532))))

(declare-fun b!651122 () Bool)

(declare-fun res!422182 () Bool)

(assert (=> b!651122 (=> (not res!422182) (not e!373611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!651122 (= res!422182 (validKeyInArray!0 (select (arr!18494 a!2986) j!136)))))

(declare-fun b!651123 () Bool)

(declare-fun e!373605 () Bool)

(declare-datatypes ((SeekEntryResult!6934 0))(
  ( (MissingZero!6934 (index!30086 (_ BitVec 32))) (Found!6934 (index!30087 (_ BitVec 32))) (Intermediate!6934 (undefined!7746 Bool) (index!30088 (_ BitVec 32)) (x!58868 (_ BitVec 32))) (Undefined!6934) (MissingVacant!6934 (index!30089 (_ BitVec 32))) )
))
(declare-fun lt!302697 () SeekEntryResult!6934)

(declare-fun lt!302707 () SeekEntryResult!6934)

(assert (=> b!651123 (= e!373605 (= lt!302697 lt!302707))))

(declare-fun b!651124 () Bool)

(declare-datatypes ((Unit!22230 0))(
  ( (Unit!22231) )
))
(declare-fun e!373602 () Unit!22230)

(declare-fun Unit!22232 () Unit!22230)

(assert (=> b!651124 (= e!373602 Unit!22232)))

(declare-fun b!651125 () Bool)

(declare-fun e!373606 () Bool)

(declare-fun e!373598 () Bool)

(assert (=> b!651125 (= e!373606 e!373598)))

(declare-fun res!422190 () Bool)

(assert (=> b!651125 (=> (not res!422190) (not e!373598))))

(declare-fun lt!302702 () array!38579)

(declare-fun arrayContainsKey!0 (array!38579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!651125 (= res!422190 (arrayContainsKey!0 lt!302702 (select (arr!18494 a!2986) j!136) j!136))))

(declare-fun b!651126 () Bool)

(assert (=> b!651126 (= e!373597 e!373606)))

(declare-fun res!422192 () Bool)

(assert (=> b!651126 (=> res!422192 e!373606)))

(assert (=> b!651126 (= res!422192 (or (not (= (select (arr!18494 a!2986) j!136) lt!302713)) (not (= (select (arr!18494 a!2986) j!136) lt!302708)) (bvsge j!136 index!984)))))

(declare-fun b!651127 () Bool)

(declare-fun res!422174 () Bool)

(assert (=> b!651127 (=> (not res!422174) (not e!373604))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!651127 (= res!422174 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18494 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!651128 () Bool)

(declare-fun Unit!22233 () Unit!22230)

(assert (=> b!651128 (= e!373602 Unit!22233)))

(declare-fun lt!302712 () Unit!22230)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38579 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22230)

(assert (=> b!651128 (= lt!302712 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302702 (select (arr!18494 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!651128 (arrayContainsKey!0 lt!302702 (select (arr!18494 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302699 () Unit!22230)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38579 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12535) Unit!22230)

(assert (=> b!651128 (= lt!302699 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12532))))

(assert (=> b!651128 (arrayNoDuplicates!0 lt!302702 #b00000000000000000000000000000000 Nil!12532)))

(declare-fun lt!302704 () Unit!22230)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38579 (_ BitVec 32) (_ BitVec 32)) Unit!22230)

(assert (=> b!651128 (= lt!302704 (lemmaNoDuplicateFromThenFromBigger!0 lt!302702 #b00000000000000000000000000000000 j!136))))

(assert (=> b!651128 (arrayNoDuplicates!0 lt!302702 j!136 Nil!12532)))

(declare-fun lt!302709 () Unit!22230)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38579 (_ BitVec 64) (_ BitVec 32) List!12535) Unit!22230)

(assert (=> b!651128 (= lt!302709 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302702 (select (arr!18494 a!2986) j!136) j!136 Nil!12532))))

(assert (=> b!651128 false))

(declare-fun b!651129 () Bool)

(declare-fun res!422183 () Bool)

(assert (=> b!651129 (=> (not res!422183) (not e!373604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38579 (_ BitVec 32)) Bool)

(assert (=> b!651129 (= res!422183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!651130 () Bool)

(declare-fun e!373608 () Bool)

(assert (=> b!651130 (= e!373604 e!373608)))

(declare-fun res!422185 () Bool)

(assert (=> b!651130 (=> (not res!422185) (not e!373608))))

(assert (=> b!651130 (= res!422185 (= (select (store (arr!18494 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651130 (= lt!302702 (array!38580 (store (arr!18494 a!2986) i!1108 k!1786) (size!18858 a!2986)))))

(declare-fun b!651131 () Bool)

(declare-fun e!373599 () Unit!22230)

(declare-fun Unit!22234 () Unit!22230)

(assert (=> b!651131 (= e!373599 Unit!22234)))

(declare-fun b!651132 () Bool)

(declare-fun e!373603 () Bool)

(assert (=> b!651132 (= e!373608 e!373603)))

(declare-fun res!422181 () Bool)

(assert (=> b!651132 (=> (not res!422181) (not e!373603))))

(assert (=> b!651132 (= res!422181 (and (= lt!302697 (Found!6934 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18494 a!2986) index!984) (select (arr!18494 a!2986) j!136))) (not (= (select (arr!18494 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38579 (_ BitVec 32)) SeekEntryResult!6934)

(assert (=> b!651132 (= lt!302697 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18494 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!422180 () Bool)

(assert (=> start!58998 (=> (not res!422180) (not e!373611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58998 (= res!422180 (validMask!0 mask!3053))))

(assert (=> start!58998 e!373611))

(assert (=> start!58998 true))

(declare-fun array_inv!14290 (array!38579) Bool)

(assert (=> start!58998 (array_inv!14290 a!2986)))

(declare-fun b!651121 () Bool)

(declare-fun e!373607 () Bool)

(assert (=> b!651121 (= e!373607 (arrayContainsKey!0 lt!302702 (select (arr!18494 a!2986) j!136) index!984))))

(declare-fun b!651133 () Bool)

(assert (=> b!651133 (= e!373611 e!373604)))

(declare-fun res!422188 () Bool)

(assert (=> b!651133 (=> (not res!422188) (not e!373604))))

(declare-fun lt!302701 () SeekEntryResult!6934)

(assert (=> b!651133 (= res!422188 (or (= lt!302701 (MissingZero!6934 i!1108)) (= lt!302701 (MissingVacant!6934 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38579 (_ BitVec 32)) SeekEntryResult!6934)

(assert (=> b!651133 (= lt!302701 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!651134 () Bool)

(declare-fun e!373600 () Bool)

(assert (=> b!651134 (= e!373610 e!373600)))

(declare-fun res!422186 () Bool)

(assert (=> b!651134 (=> res!422186 e!373600)))

(assert (=> b!651134 (= res!422186 (bvsge index!984 j!136))))

(declare-fun lt!302705 () Unit!22230)

(assert (=> b!651134 (= lt!302705 e!373602)))

(declare-fun c!74840 () Bool)

(assert (=> b!651134 (= c!74840 (bvslt j!136 index!984))))

(declare-fun b!651135 () Bool)

(declare-fun res!422184 () Bool)

(assert (=> b!651135 (=> (not res!422184) (not e!373611))))

(assert (=> b!651135 (= res!422184 (validKeyInArray!0 k!1786))))

(declare-fun b!651136 () Bool)

(assert (=> b!651136 (= e!373603 (not e!373609))))

(declare-fun res!422189 () Bool)

(assert (=> b!651136 (=> res!422189 e!373609)))

(declare-fun lt!302698 () SeekEntryResult!6934)

(assert (=> b!651136 (= res!422189 (not (= lt!302698 (Found!6934 index!984))))))

(declare-fun lt!302711 () Unit!22230)

(assert (=> b!651136 (= lt!302711 e!373599)))

(declare-fun c!74839 () Bool)

(assert (=> b!651136 (= c!74839 (= lt!302698 Undefined!6934))))

(assert (=> b!651136 (= lt!302698 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302713 lt!302702 mask!3053))))

(assert (=> b!651136 e!373605))

(declare-fun res!422191 () Bool)

(assert (=> b!651136 (=> (not res!422191) (not e!373605))))

(declare-fun lt!302700 () (_ BitVec 32))

(assert (=> b!651136 (= res!422191 (= lt!302707 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302700 vacantSpotIndex!68 lt!302713 lt!302702 mask!3053)))))

(assert (=> b!651136 (= lt!302707 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302700 vacantSpotIndex!68 (select (arr!18494 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!651136 (= lt!302713 (select (store (arr!18494 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!302706 () Unit!22230)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38579 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22230)

(assert (=> b!651136 (= lt!302706 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302700 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!651136 (= lt!302700 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!651137 () Bool)

(assert (=> b!651137 (= e!373598 (arrayContainsKey!0 lt!302702 (select (arr!18494 a!2986) j!136) index!984))))

(declare-fun b!651138 () Bool)

(assert (=> b!651138 (= e!373600 true)))

(assert (=> b!651138 (arrayNoDuplicates!0 lt!302702 #b00000000000000000000000000000000 Nil!12532)))

(declare-fun lt!302703 () Unit!22230)

(assert (=> b!651138 (= lt!302703 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12532))))

(assert (=> b!651138 (arrayContainsKey!0 lt!302702 (select (arr!18494 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302710 () Unit!22230)

(assert (=> b!651138 (= lt!302710 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302702 (select (arr!18494 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!651138 e!373607))

(declare-fun res!422179 () Bool)

(assert (=> b!651138 (=> (not res!422179) (not e!373607))))

(assert (=> b!651138 (= res!422179 (arrayContainsKey!0 lt!302702 (select (arr!18494 a!2986) j!136) j!136))))

(declare-fun b!651139 () Bool)

(declare-fun Unit!22235 () Unit!22230)

(assert (=> b!651139 (= e!373599 Unit!22235)))

(assert (=> b!651139 false))

(declare-fun b!651140 () Bool)

(declare-fun res!422187 () Bool)

(assert (=> b!651140 (=> (not res!422187) (not e!373611))))

(assert (=> b!651140 (= res!422187 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!58998 res!422180) b!651119))

(assert (= (and b!651119 res!422178) b!651122))

(assert (= (and b!651122 res!422182) b!651135))

(assert (= (and b!651135 res!422184) b!651140))

(assert (= (and b!651140 res!422187) b!651133))

(assert (= (and b!651133 res!422188) b!651129))

(assert (= (and b!651129 res!422183) b!651120))

(assert (= (and b!651120 res!422176) b!651127))

(assert (= (and b!651127 res!422174) b!651130))

(assert (= (and b!651130 res!422185) b!651132))

(assert (= (and b!651132 res!422181) b!651136))

(assert (= (and b!651136 res!422191) b!651123))

(assert (= (and b!651136 c!74839) b!651139))

(assert (= (and b!651136 (not c!74839)) b!651131))

(assert (= (and b!651136 (not res!422189)) b!651118))

(assert (= (and b!651118 res!422177) b!651126))

(assert (= (and b!651126 (not res!422192)) b!651125))

(assert (= (and b!651125 res!422190) b!651137))

(assert (= (and b!651118 (not res!422175)) b!651134))

(assert (= (and b!651134 c!74840) b!651128))

(assert (= (and b!651134 (not c!74840)) b!651124))

(assert (= (and b!651134 (not res!422186)) b!651138))

(assert (= (and b!651138 res!422179) b!651121))

(declare-fun m!624271 () Bool)

(assert (=> b!651140 m!624271))

(declare-fun m!624273 () Bool)

(assert (=> b!651137 m!624273))

(assert (=> b!651137 m!624273))

(declare-fun m!624275 () Bool)

(assert (=> b!651137 m!624275))

(assert (=> b!651122 m!624273))

(assert (=> b!651122 m!624273))

(declare-fun m!624277 () Bool)

(assert (=> b!651122 m!624277))

(assert (=> b!651138 m!624273))

(assert (=> b!651138 m!624273))

(declare-fun m!624279 () Bool)

(assert (=> b!651138 m!624279))

(assert (=> b!651138 m!624273))

(declare-fun m!624281 () Bool)

(assert (=> b!651138 m!624281))

(assert (=> b!651138 m!624273))

(declare-fun m!624283 () Bool)

(assert (=> b!651138 m!624283))

(declare-fun m!624285 () Bool)

(assert (=> b!651138 m!624285))

(declare-fun m!624287 () Bool)

(assert (=> b!651138 m!624287))

(declare-fun m!624289 () Bool)

(assert (=> b!651120 m!624289))

(assert (=> b!651118 m!624273))

(declare-fun m!624291 () Bool)

(assert (=> b!651118 m!624291))

(declare-fun m!624293 () Bool)

(assert (=> b!651118 m!624293))

(assert (=> b!651125 m!624273))

(assert (=> b!651125 m!624273))

(assert (=> b!651125 m!624279))

(declare-fun m!624295 () Bool)

(assert (=> b!651136 m!624295))

(declare-fun m!624297 () Bool)

(assert (=> b!651136 m!624297))

(assert (=> b!651136 m!624273))

(declare-fun m!624299 () Bool)

(assert (=> b!651136 m!624299))

(assert (=> b!651136 m!624291))

(declare-fun m!624301 () Bool)

(assert (=> b!651136 m!624301))

(declare-fun m!624303 () Bool)

(assert (=> b!651136 m!624303))

(assert (=> b!651136 m!624273))

(declare-fun m!624305 () Bool)

(assert (=> b!651136 m!624305))

(assert (=> b!651126 m!624273))

(assert (=> b!651130 m!624291))

(declare-fun m!624307 () Bool)

(assert (=> b!651130 m!624307))

(declare-fun m!624309 () Bool)

(assert (=> start!58998 m!624309))

(declare-fun m!624311 () Bool)

(assert (=> start!58998 m!624311))

(declare-fun m!624313 () Bool)

(assert (=> b!651132 m!624313))

(assert (=> b!651132 m!624273))

(assert (=> b!651132 m!624273))

(declare-fun m!624315 () Bool)

(assert (=> b!651132 m!624315))

(assert (=> b!651128 m!624273))

(declare-fun m!624317 () Bool)

(assert (=> b!651128 m!624317))

(assert (=> b!651128 m!624273))

(declare-fun m!624319 () Bool)

(assert (=> b!651128 m!624319))

(assert (=> b!651128 m!624273))

(declare-fun m!624321 () Bool)

(assert (=> b!651128 m!624321))

(assert (=> b!651128 m!624273))

(declare-fun m!624323 () Bool)

(assert (=> b!651128 m!624323))

(assert (=> b!651128 m!624287))

(declare-fun m!624325 () Bool)

(assert (=> b!651128 m!624325))

(assert (=> b!651128 m!624285))

(declare-fun m!624327 () Bool)

(assert (=> b!651127 m!624327))

(declare-fun m!624329 () Bool)

(assert (=> b!651135 m!624329))

(declare-fun m!624331 () Bool)

(assert (=> b!651133 m!624331))

(assert (=> b!651121 m!624273))

(assert (=> b!651121 m!624273))

(assert (=> b!651121 m!624275))

(declare-fun m!624333 () Bool)

(assert (=> b!651129 m!624333))

(push 1)

