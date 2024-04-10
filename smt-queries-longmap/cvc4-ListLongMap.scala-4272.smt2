; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59376 () Bool)

(assert start!59376)

(declare-fun b!656109 () Bool)

(declare-fun res!425636 () Bool)

(declare-fun e!376808 () Bool)

(assert (=> b!656109 (=> (not res!425636) (not e!376808))))

(declare-datatypes ((array!38696 0))(
  ( (array!38697 (arr!18548 (Array (_ BitVec 32) (_ BitVec 64))) (size!18912 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38696)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!656109 (= res!425636 (validKeyInArray!0 (select (arr!18548 a!2986) j!136)))))

(declare-fun b!656110 () Bool)

(declare-fun res!425621 () Bool)

(assert (=> b!656110 (=> (not res!425621) (not e!376808))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!656110 (= res!425621 (validKeyInArray!0 k!1786))))

(declare-fun b!656111 () Bool)

(declare-datatypes ((Unit!22634 0))(
  ( (Unit!22635) )
))
(declare-fun e!376810 () Unit!22634)

(declare-fun Unit!22636 () Unit!22634)

(assert (=> b!656111 (= e!376810 Unit!22636)))

(declare-fun b!656112 () Bool)

(declare-fun res!425631 () Bool)

(assert (=> b!656112 (=> (not res!425631) (not e!376808))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!656112 (= res!425631 (and (= (size!18912 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18912 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18912 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!656113 () Bool)

(declare-fun e!376807 () Bool)

(declare-fun e!376802 () Bool)

(assert (=> b!656113 (= e!376807 e!376802)))

(declare-fun res!425629 () Bool)

(assert (=> b!656113 (=> (not res!425629) (not e!376802))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!656113 (= res!425629 (= (select (store (arr!18548 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!306250 () array!38696)

(assert (=> b!656113 (= lt!306250 (array!38697 (store (arr!18548 a!2986) i!1108 k!1786) (size!18912 a!2986)))))

(declare-fun b!656114 () Bool)

(declare-fun res!425632 () Bool)

(assert (=> b!656114 (=> (not res!425632) (not e!376807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38696 (_ BitVec 32)) Bool)

(assert (=> b!656114 (= res!425632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!656115 () Bool)

(declare-fun res!425628 () Bool)

(assert (=> b!656115 (=> (not res!425628) (not e!376807))))

(declare-datatypes ((List!12589 0))(
  ( (Nil!12586) (Cons!12585 (h!13630 (_ BitVec 64)) (t!18817 List!12589)) )
))
(declare-fun arrayNoDuplicates!0 (array!38696 (_ BitVec 32) List!12589) Bool)

(assert (=> b!656115 (= res!425628 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12586))))

(declare-fun b!656117 () Bool)

(assert (=> b!656117 false))

(declare-fun lt!306259 () Unit!22634)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38696 (_ BitVec 64) (_ BitVec 32) List!12589) Unit!22634)

(assert (=> b!656117 (= lt!306259 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306250 (select (arr!18548 a!2986) j!136) j!136 Nil!12586))))

(assert (=> b!656117 (arrayNoDuplicates!0 lt!306250 j!136 Nil!12586)))

(declare-fun lt!306262 () Unit!22634)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38696 (_ BitVec 32) (_ BitVec 32)) Unit!22634)

(assert (=> b!656117 (= lt!306262 (lemmaNoDuplicateFromThenFromBigger!0 lt!306250 #b00000000000000000000000000000000 j!136))))

(assert (=> b!656117 (arrayNoDuplicates!0 lt!306250 #b00000000000000000000000000000000 Nil!12586)))

(declare-fun lt!306255 () Unit!22634)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38696 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12589) Unit!22634)

(assert (=> b!656117 (= lt!306255 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12586))))

(declare-fun arrayContainsKey!0 (array!38696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!656117 (arrayContainsKey!0 lt!306250 (select (arr!18548 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306260 () Unit!22634)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38696 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22634)

(assert (=> b!656117 (= lt!306260 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306250 (select (arr!18548 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22637 () Unit!22634)

(assert (=> b!656117 (= e!376810 Unit!22637)))

(declare-fun b!656118 () Bool)

(declare-fun e!376809 () Unit!22634)

(declare-fun Unit!22638 () Unit!22634)

(assert (=> b!656118 (= e!376809 Unit!22638)))

(assert (=> b!656118 false))

(declare-fun b!656119 () Bool)

(declare-fun Unit!22639 () Unit!22634)

(assert (=> b!656119 (= e!376809 Unit!22639)))

(declare-fun b!656120 () Bool)

(declare-fun res!425633 () Bool)

(assert (=> b!656120 (=> (not res!425633) (not e!376808))))

(assert (=> b!656120 (= res!425633 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!656121 () Bool)

(declare-fun e!376812 () Unit!22634)

(declare-fun Unit!22640 () Unit!22634)

(assert (=> b!656121 (= e!376812 Unit!22640)))

(declare-fun res!425622 () Bool)

(assert (=> b!656121 (= res!425622 (= (select (store (arr!18548 a!2986) i!1108 k!1786) index!984) (select (arr!18548 a!2986) j!136)))))

(declare-fun e!376806 () Bool)

(assert (=> b!656121 (=> (not res!425622) (not e!376806))))

(assert (=> b!656121 e!376806))

(declare-fun c!75613 () Bool)

(assert (=> b!656121 (= c!75613 (bvslt j!136 index!984))))

(declare-fun lt!306246 () Unit!22634)

(assert (=> b!656121 (= lt!306246 e!376810)))

(declare-fun c!75612 () Bool)

(assert (=> b!656121 (= c!75612 (bvslt index!984 j!136))))

(declare-fun lt!306261 () Unit!22634)

(declare-fun e!376805 () Unit!22634)

(assert (=> b!656121 (= lt!306261 e!376805)))

(assert (=> b!656121 false))

(declare-fun b!656122 () Bool)

(declare-fun res!425626 () Bool)

(assert (=> b!656122 (= res!425626 (bvsge j!136 index!984))))

(declare-fun e!376801 () Bool)

(assert (=> b!656122 (=> res!425626 e!376801)))

(assert (=> b!656122 (= e!376806 e!376801)))

(declare-fun b!656123 () Bool)

(declare-fun e!376811 () Bool)

(assert (=> b!656123 (= e!376811 (arrayContainsKey!0 lt!306250 (select (arr!18548 a!2986) j!136) index!984))))

(declare-datatypes ((SeekEntryResult!6988 0))(
  ( (MissingZero!6988 (index!30311 (_ BitVec 32))) (Found!6988 (index!30312 (_ BitVec 32))) (Intermediate!6988 (undefined!7800 Bool) (index!30313 (_ BitVec 32)) (x!59093 (_ BitVec 32))) (Undefined!6988) (MissingVacant!6988 (index!30314 (_ BitVec 32))) )
))
(declare-fun lt!306254 () SeekEntryResult!6988)

(declare-fun b!656124 () Bool)

(declare-fun e!376799 () Bool)

(assert (=> b!656124 (= e!376799 (not (or (not (= lt!306254 (MissingVacant!6988 vacantSpotIndex!68))) (= (select (store (arr!18548 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!306257 () Unit!22634)

(assert (=> b!656124 (= lt!306257 e!376812)))

(declare-fun c!75611 () Bool)

(assert (=> b!656124 (= c!75611 (= lt!306254 (Found!6988 index!984)))))

(declare-fun lt!306252 () Unit!22634)

(assert (=> b!656124 (= lt!306252 e!376809)))

(declare-fun c!75614 () Bool)

(assert (=> b!656124 (= c!75614 (= lt!306254 Undefined!6988))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!306249 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38696 (_ BitVec 32)) SeekEntryResult!6988)

(assert (=> b!656124 (= lt!306254 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306249 lt!306250 mask!3053))))

(declare-fun e!376803 () Bool)

(assert (=> b!656124 e!376803))

(declare-fun res!425625 () Bool)

(assert (=> b!656124 (=> (not res!425625) (not e!376803))))

(declare-fun lt!306247 () (_ BitVec 32))

(declare-fun lt!306244 () SeekEntryResult!6988)

(assert (=> b!656124 (= res!425625 (= lt!306244 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306247 vacantSpotIndex!68 lt!306249 lt!306250 mask!3053)))))

(assert (=> b!656124 (= lt!306244 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306247 vacantSpotIndex!68 (select (arr!18548 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!656124 (= lt!306249 (select (store (arr!18548 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!306256 () Unit!22634)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38696 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22634)

(assert (=> b!656124 (= lt!306256 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306247 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!656124 (= lt!306247 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!656125 () Bool)

(declare-fun res!425623 () Bool)

(assert (=> b!656125 (= res!425623 (arrayContainsKey!0 lt!306250 (select (arr!18548 a!2986) j!136) j!136))))

(declare-fun e!376804 () Bool)

(assert (=> b!656125 (=> (not res!425623) (not e!376804))))

(assert (=> b!656125 (= e!376801 e!376804)))

(declare-fun b!656126 () Bool)

(assert (=> b!656126 (= e!376808 e!376807)))

(declare-fun res!425630 () Bool)

(assert (=> b!656126 (=> (not res!425630) (not e!376807))))

(declare-fun lt!306245 () SeekEntryResult!6988)

(assert (=> b!656126 (= res!425630 (or (= lt!306245 (MissingZero!6988 i!1108)) (= lt!306245 (MissingVacant!6988 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38696 (_ BitVec 32)) SeekEntryResult!6988)

(assert (=> b!656126 (= lt!306245 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!656127 () Bool)

(assert (=> b!656127 false))

(declare-fun lt!306258 () Unit!22634)

(assert (=> b!656127 (= lt!306258 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306250 (select (arr!18548 a!2986) j!136) index!984 Nil!12586))))

(assert (=> b!656127 (arrayNoDuplicates!0 lt!306250 index!984 Nil!12586)))

(declare-fun lt!306248 () Unit!22634)

(assert (=> b!656127 (= lt!306248 (lemmaNoDuplicateFromThenFromBigger!0 lt!306250 #b00000000000000000000000000000000 index!984))))

(assert (=> b!656127 (arrayNoDuplicates!0 lt!306250 #b00000000000000000000000000000000 Nil!12586)))

(declare-fun lt!306253 () Unit!22634)

(assert (=> b!656127 (= lt!306253 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12586))))

(assert (=> b!656127 (arrayContainsKey!0 lt!306250 (select (arr!18548 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306251 () Unit!22634)

(assert (=> b!656127 (= lt!306251 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306250 (select (arr!18548 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!656127 e!376811))

(declare-fun res!425635 () Bool)

(assert (=> b!656127 (=> (not res!425635) (not e!376811))))

(assert (=> b!656127 (= res!425635 (arrayContainsKey!0 lt!306250 (select (arr!18548 a!2986) j!136) j!136))))

(declare-fun Unit!22641 () Unit!22634)

(assert (=> b!656127 (= e!376805 Unit!22641)))

(declare-fun res!425627 () Bool)

(assert (=> start!59376 (=> (not res!425627) (not e!376808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59376 (= res!425627 (validMask!0 mask!3053))))

(assert (=> start!59376 e!376808))

(assert (=> start!59376 true))

(declare-fun array_inv!14344 (array!38696) Bool)

(assert (=> start!59376 (array_inv!14344 a!2986)))

(declare-fun b!656116 () Bool)

(declare-fun Unit!22642 () Unit!22634)

(assert (=> b!656116 (= e!376805 Unit!22642)))

(declare-fun b!656128 () Bool)

(assert (=> b!656128 (= e!376802 e!376799)))

(declare-fun res!425634 () Bool)

(assert (=> b!656128 (=> (not res!425634) (not e!376799))))

(declare-fun lt!306243 () SeekEntryResult!6988)

(assert (=> b!656128 (= res!425634 (and (= lt!306243 (Found!6988 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18548 a!2986) index!984) (select (arr!18548 a!2986) j!136))) (not (= (select (arr!18548 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!656128 (= lt!306243 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18548 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656129 () Bool)

(assert (=> b!656129 (= e!376803 (= lt!306243 lt!306244))))

(declare-fun b!656130 () Bool)

(declare-fun Unit!22643 () Unit!22634)

(assert (=> b!656130 (= e!376812 Unit!22643)))

(declare-fun b!656131 () Bool)

(declare-fun res!425624 () Bool)

(assert (=> b!656131 (=> (not res!425624) (not e!376807))))

(assert (=> b!656131 (= res!425624 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18548 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!656132 () Bool)

(assert (=> b!656132 (= e!376804 (arrayContainsKey!0 lt!306250 (select (arr!18548 a!2986) j!136) index!984))))

(assert (= (and start!59376 res!425627) b!656112))

(assert (= (and b!656112 res!425631) b!656109))

(assert (= (and b!656109 res!425636) b!656110))

(assert (= (and b!656110 res!425621) b!656120))

(assert (= (and b!656120 res!425633) b!656126))

(assert (= (and b!656126 res!425630) b!656114))

(assert (= (and b!656114 res!425632) b!656115))

(assert (= (and b!656115 res!425628) b!656131))

(assert (= (and b!656131 res!425624) b!656113))

(assert (= (and b!656113 res!425629) b!656128))

(assert (= (and b!656128 res!425634) b!656124))

(assert (= (and b!656124 res!425625) b!656129))

(assert (= (and b!656124 c!75614) b!656118))

(assert (= (and b!656124 (not c!75614)) b!656119))

(assert (= (and b!656124 c!75611) b!656121))

(assert (= (and b!656124 (not c!75611)) b!656130))

(assert (= (and b!656121 res!425622) b!656122))

(assert (= (and b!656122 (not res!425626)) b!656125))

(assert (= (and b!656125 res!425623) b!656132))

(assert (= (and b!656121 c!75613) b!656117))

(assert (= (and b!656121 (not c!75613)) b!656111))

(assert (= (and b!656121 c!75612) b!656127))

(assert (= (and b!656121 (not c!75612)) b!656116))

(assert (= (and b!656127 res!425635) b!656123))

(declare-fun m!629167 () Bool)

(assert (=> b!656125 m!629167))

(assert (=> b!656125 m!629167))

(declare-fun m!629169 () Bool)

(assert (=> b!656125 m!629169))

(declare-fun m!629171 () Bool)

(assert (=> b!656126 m!629171))

(declare-fun m!629173 () Bool)

(assert (=> b!656114 m!629173))

(declare-fun m!629175 () Bool)

(assert (=> b!656110 m!629175))

(declare-fun m!629177 () Bool)

(assert (=> b!656113 m!629177))

(declare-fun m!629179 () Bool)

(assert (=> b!656113 m!629179))

(declare-fun m!629181 () Bool)

(assert (=> b!656128 m!629181))

(assert (=> b!656128 m!629167))

(assert (=> b!656128 m!629167))

(declare-fun m!629183 () Bool)

(assert (=> b!656128 m!629183))

(assert (=> b!656123 m!629167))

(assert (=> b!656123 m!629167))

(declare-fun m!629185 () Bool)

(assert (=> b!656123 m!629185))

(assert (=> b!656109 m!629167))

(assert (=> b!656109 m!629167))

(declare-fun m!629187 () Bool)

(assert (=> b!656109 m!629187))

(declare-fun m!629189 () Bool)

(assert (=> b!656127 m!629189))

(assert (=> b!656127 m!629167))

(assert (=> b!656127 m!629167))

(declare-fun m!629191 () Bool)

(assert (=> b!656127 m!629191))

(declare-fun m!629193 () Bool)

(assert (=> b!656127 m!629193))

(assert (=> b!656127 m!629167))

(assert (=> b!656127 m!629169))

(assert (=> b!656127 m!629167))

(declare-fun m!629195 () Bool)

(assert (=> b!656127 m!629195))

(declare-fun m!629197 () Bool)

(assert (=> b!656127 m!629197))

(assert (=> b!656127 m!629167))

(declare-fun m!629199 () Bool)

(assert (=> b!656127 m!629199))

(declare-fun m!629201 () Bool)

(assert (=> b!656127 m!629201))

(assert (=> b!656132 m!629167))

(assert (=> b!656132 m!629167))

(assert (=> b!656132 m!629185))

(declare-fun m!629203 () Bool)

(assert (=> b!656124 m!629203))

(assert (=> b!656124 m!629167))

(assert (=> b!656124 m!629177))

(declare-fun m!629205 () Bool)

(assert (=> b!656124 m!629205))

(declare-fun m!629207 () Bool)

(assert (=> b!656124 m!629207))

(assert (=> b!656124 m!629167))

(declare-fun m!629209 () Bool)

(assert (=> b!656124 m!629209))

(declare-fun m!629211 () Bool)

(assert (=> b!656124 m!629211))

(declare-fun m!629213 () Bool)

(assert (=> b!656124 m!629213))

(declare-fun m!629215 () Bool)

(assert (=> b!656124 m!629215))

(declare-fun m!629217 () Bool)

(assert (=> b!656115 m!629217))

(declare-fun m!629219 () Bool)

(assert (=> b!656120 m!629219))

(declare-fun m!629221 () Bool)

(assert (=> start!59376 m!629221))

(declare-fun m!629223 () Bool)

(assert (=> start!59376 m!629223))

(assert (=> b!656117 m!629189))

(assert (=> b!656117 m!629167))

(assert (=> b!656117 m!629167))

(declare-fun m!629225 () Bool)

(assert (=> b!656117 m!629225))

(assert (=> b!656117 m!629167))

(declare-fun m!629227 () Bool)

(assert (=> b!656117 m!629227))

(assert (=> b!656117 m!629167))

(declare-fun m!629229 () Bool)

(assert (=> b!656117 m!629229))

(assert (=> b!656117 m!629201))

(declare-fun m!629231 () Bool)

(assert (=> b!656117 m!629231))

(declare-fun m!629233 () Bool)

(assert (=> b!656117 m!629233))

(assert (=> b!656121 m!629177))

(assert (=> b!656121 m!629215))

(assert (=> b!656121 m!629167))

(declare-fun m!629235 () Bool)

(assert (=> b!656131 m!629235))

(push 1)

(assert (not b!656128))

(assert (not b!656115))

(assert (not b!656123))

(assert (not b!656127))

(assert (not b!656120))

(assert (not b!656114))

(assert (not start!59376))

(assert (not b!656109))

(assert (not b!656110))

(assert (not b!656132))

(assert (not b!656126))

(assert (not b!656117))

(assert (not b!656124))

(assert (not b!656125))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!656172 () Bool)

(declare-fun e!376846 () Bool)

(declare-fun call!33840 () Bool)

(assert (=> b!656172 (= e!376846 call!33840)))

(declare-fun bm!33837 () Bool)

(assert (=> bm!33837 (= call!33840 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!92601 () Bool)

(declare-fun res!425665 () Bool)

(declare-fun e!376845 () Bool)

(assert (=> d!92601 (=> res!425665 e!376845)))

(assert (=> d!92601 (= res!425665 (bvsge #b00000000000000000000000000000000 (size!18912 a!2986)))))

(assert (=> d!92601 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!376845)))

(declare-fun b!656173 () Bool)

(assert (=> b!656173 (= e!376845 e!376846)))

(declare-fun c!75621 () Bool)

(assert (=> b!656173 (= c!75621 (validKeyInArray!0 (select (arr!18548 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!656174 () Bool)

(declare-fun e!376847 () Bool)

(assert (=> b!656174 (= e!376847 call!33840)))

(declare-fun b!656175 () Bool)

(assert (=> b!656175 (= e!376846 e!376847)))

(declare-fun lt!306280 () (_ BitVec 64))

(assert (=> b!656175 (= lt!306280 (select (arr!18548 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!306283 () Unit!22634)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38696 (_ BitVec 64) (_ BitVec 32)) Unit!22634)

(assert (=> b!656175 (= lt!306283 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!306280 #b00000000000000000000000000000000))))

(assert (=> b!656175 (arrayContainsKey!0 a!2986 lt!306280 #b00000000000000000000000000000000)))

(declare-fun lt!306281 () Unit!22634)

(assert (=> b!656175 (= lt!306281 lt!306283)))

(declare-fun res!425663 () Bool)

(assert (=> b!656175 (= res!425663 (= (seekEntryOrOpen!0 (select (arr!18548 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6988 #b00000000000000000000000000000000)))))

(assert (=> b!656175 (=> (not res!425663) (not e!376847))))

(assert (= (and d!92601 (not res!425665)) b!656173))

(assert (= (and b!656173 c!75621) b!656175))

(assert (= (and b!656173 (not c!75621)) b!656172))

(assert (= (and b!656175 res!425663) b!656174))

(assert (= (or b!656174 b!656172) bm!33837))

(declare-fun m!629271 () Bool)

(assert (=> bm!33837 m!629271))

(declare-fun m!629273 () Bool)

(assert (=> b!656173 m!629273))

(assert (=> b!656173 m!629273))

(declare-fun m!629275 () Bool)

(assert (=> b!656173 m!629275))

(assert (=> b!656175 m!629273))

(declare-fun m!629277 () Bool)

(assert (=> b!656175 m!629277))

(declare-fun m!629279 () Bool)

(assert (=> b!656175 m!629279))

(assert (=> b!656175 m!629273))

(declare-fun m!629281 () Bool)

(assert (=> b!656175 m!629281))

(assert (=> b!656114 d!92601))

(declare-fun d!92613 () Bool)

(declare-fun e!376851 () Bool)

(assert (=> d!92613 e!376851))

(declare-fun res!425668 () Bool)

(assert (=> d!92613 (=> (not res!425668) (not e!376851))))

(assert (=> d!92613 (= res!425668 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18912 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18912 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18912 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18912 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18912 a!2986))))))

(declare-fun lt!306286 () Unit!22634)

(declare-fun choose!9 (array!38696 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22634)

(assert (=> d!92613 (= lt!306286 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306247 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92613 (validMask!0 mask!3053)))

(assert (=> d!92613 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306247 vacantSpotIndex!68 mask!3053) lt!306286)))

(declare-fun b!656178 () Bool)

(assert (=> b!656178 (= e!376851 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306247 vacantSpotIndex!68 (select (arr!18548 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306247 vacantSpotIndex!68 (select (store (arr!18548 a!2986) i!1108 k!1786) j!136) (array!38697 (store (arr!18548 a!2986) i!1108 k!1786) (size!18912 a!2986)) mask!3053)))))

(assert (= (and d!92613 res!425668) b!656178))

(declare-fun m!629283 () Bool)

(assert (=> d!92613 m!629283))

(assert (=> d!92613 m!629221))

(assert (=> b!656178 m!629203))

(declare-fun m!629285 () Bool)

(assert (=> b!656178 m!629285))

(assert (=> b!656178 m!629203))

(assert (=> b!656178 m!629177))

(assert (=> b!656178 m!629167))

(assert (=> b!656178 m!629209))

(assert (=> b!656178 m!629167))

(assert (=> b!656124 d!92613))

(declare-fun b!656219 () Bool)

(declare-fun e!376878 () SeekEntryResult!6988)

(assert (=> b!656219 (= e!376878 (MissingVacant!6988 vacantSpotIndex!68))))

(declare-fun b!656220 () Bool)

(declare-fun c!75638 () Bool)

(declare-fun lt!306301 () (_ BitVec 64))

(assert (=> b!656220 (= c!75638 (= lt!306301 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!376879 () SeekEntryResult!6988)

(assert (=> b!656220 (= e!376879 e!376878)))

(declare-fun b!656221 () Bool)

(declare-fun e!376877 () SeekEntryResult!6988)

(assert (=> b!656221 (= e!376877 e!376879)))

(declare-fun c!75637 () Bool)

(assert (=> b!656221 (= c!75637 (= lt!306301 lt!306249))))

(declare-fun b!656222 () Bool)

(assert (=> b!656222 (= e!376878 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!306247 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!306249 lt!306250 mask!3053))))

(declare-fun b!656223 () Bool)

(assert (=> b!656223 (= e!376879 (Found!6988 lt!306247))))

(declare-fun d!92619 () Bool)

(declare-fun lt!306300 () SeekEntryResult!6988)

(assert (=> d!92619 (and (or (is-Undefined!6988 lt!306300) (not (is-Found!6988 lt!306300)) (and (bvsge (index!30312 lt!306300) #b00000000000000000000000000000000) (bvslt (index!30312 lt!306300) (size!18912 lt!306250)))) (or (is-Undefined!6988 lt!306300) (is-Found!6988 lt!306300) (not (is-MissingVacant!6988 lt!306300)) (not (= (index!30314 lt!306300) vacantSpotIndex!68)) (and (bvsge (index!30314 lt!306300) #b00000000000000000000000000000000) (bvslt (index!30314 lt!306300) (size!18912 lt!306250)))) (or (is-Undefined!6988 lt!306300) (ite (is-Found!6988 lt!306300) (= (select (arr!18548 lt!306250) (index!30312 lt!306300)) lt!306249) (and (is-MissingVacant!6988 lt!306300) (= (index!30314 lt!306300) vacantSpotIndex!68) (= (select (arr!18548 lt!306250) (index!30314 lt!306300)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92619 (= lt!306300 e!376877)))

(declare-fun c!75639 () Bool)

(assert (=> d!92619 (= c!75639 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92619 (= lt!306301 (select (arr!18548 lt!306250) lt!306247))))

(assert (=> d!92619 (validMask!0 mask!3053)))

(assert (=> d!92619 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306247 vacantSpotIndex!68 lt!306249 lt!306250 mask!3053) lt!306300)))

(declare-fun b!656224 () Bool)

(assert (=> b!656224 (= e!376877 Undefined!6988)))

(assert (= (and d!92619 c!75639) b!656224))

(assert (= (and d!92619 (not c!75639)) b!656221))

(assert (= (and b!656221 c!75637) b!656223))

(assert (= (and b!656221 (not c!75637)) b!656220))

(assert (= (and b!656220 c!75638) b!656219))

(assert (= (and b!656220 (not c!75638)) b!656222))

(declare-fun m!629313 () Bool)

(assert (=> b!656222 m!629313))

(assert (=> b!656222 m!629313))

(declare-fun m!629315 () Bool)

(assert (=> b!656222 m!629315))

(declare-fun m!629317 () Bool)

(assert (=> d!92619 m!629317))

(declare-fun m!629319 () Bool)

(assert (=> d!92619 m!629319))

(declare-fun m!629321 () Bool)

(assert (=> d!92619 m!629321))

(assert (=> d!92619 m!629221))

(assert (=> b!656124 d!92619))

(declare-fun b!656225 () Bool)

(declare-fun e!376881 () SeekEntryResult!6988)

(assert (=> b!656225 (= e!376881 (MissingVacant!6988 vacantSpotIndex!68))))

(declare-fun b!656226 () Bool)

(declare-fun c!75641 () Bool)

(declare-fun lt!306303 () (_ BitVec 64))

(assert (=> b!656226 (= c!75641 (= lt!306303 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!376882 () SeekEntryResult!6988)

(assert (=> b!656226 (= e!376882 e!376881)))

(declare-fun b!656227 () Bool)

(declare-fun e!376880 () SeekEntryResult!6988)

(assert (=> b!656227 (= e!376880 e!376882)))

(declare-fun c!75640 () Bool)

(assert (=> b!656227 (= c!75640 (= lt!306303 lt!306249))))

(declare-fun b!656228 () Bool)

(assert (=> b!656228 (= e!376881 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!306249 lt!306250 mask!3053))))

(declare-fun b!656229 () Bool)

(assert (=> b!656229 (= e!376882 (Found!6988 index!984))))

(declare-fun lt!306302 () SeekEntryResult!6988)

(declare-fun d!92631 () Bool)

(assert (=> d!92631 (and (or (is-Undefined!6988 lt!306302) (not (is-Found!6988 lt!306302)) (and (bvsge (index!30312 lt!306302) #b00000000000000000000000000000000) (bvslt (index!30312 lt!306302) (size!18912 lt!306250)))) (or (is-Undefined!6988 lt!306302) (is-Found!6988 lt!306302) (not (is-MissingVacant!6988 lt!306302)) (not (= (index!30314 lt!306302) vacantSpotIndex!68)) (and (bvsge (index!30314 lt!306302) #b00000000000000000000000000000000) (bvslt (index!30314 lt!306302) (size!18912 lt!306250)))) (or (is-Undefined!6988 lt!306302) (ite (is-Found!6988 lt!306302) (= (select (arr!18548 lt!306250) (index!30312 lt!306302)) lt!306249) (and (is-MissingVacant!6988 lt!306302) (= (index!30314 lt!306302) vacantSpotIndex!68) (= (select (arr!18548 lt!306250) (index!30314 lt!306302)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92631 (= lt!306302 e!376880)))

(declare-fun c!75642 () Bool)

(assert (=> d!92631 (= c!75642 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92631 (= lt!306303 (select (arr!18548 lt!306250) index!984))))

(assert (=> d!92631 (validMask!0 mask!3053)))

(assert (=> d!92631 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306249 lt!306250 mask!3053) lt!306302)))

(declare-fun b!656230 () Bool)

(assert (=> b!656230 (= e!376880 Undefined!6988)))

(assert (= (and d!92631 c!75642) b!656230))

(assert (= (and d!92631 (not c!75642)) b!656227))

(assert (= (and b!656227 c!75640) b!656229))

(assert (= (and b!656227 (not c!75640)) b!656226))

(assert (= (and b!656226 c!75641) b!656225))

(assert (= (and b!656226 (not c!75641)) b!656228))

(assert (=> b!656228 m!629207))

(assert (=> b!656228 m!629207))

(declare-fun m!629323 () Bool)

(assert (=> b!656228 m!629323))

(declare-fun m!629325 () Bool)

(assert (=> d!92631 m!629325))

(declare-fun m!629327 () Bool)

(assert (=> d!92631 m!629327))

(declare-fun m!629329 () Bool)

(assert (=> d!92631 m!629329))

(assert (=> d!92631 m!629221))

(assert (=> b!656124 d!92631))

(declare-fun d!92633 () Bool)

(declare-fun lt!306312 () (_ BitVec 32))

(assert (=> d!92633 (and (bvsge lt!306312 #b00000000000000000000000000000000) (bvslt lt!306312 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92633 (= lt!306312 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92633 (validMask!0 mask!3053)))

(assert (=> d!92633 (= (nextIndex!0 index!984 x!910 mask!3053) lt!306312)))

(declare-fun bs!19528 () Bool)

(assert (= bs!19528 d!92633))

(declare-fun m!629331 () Bool)

(assert (=> bs!19528 m!629331))

(assert (=> bs!19528 m!629221))

(assert (=> b!656124 d!92633))

(declare-fun b!656239 () Bool)

(declare-fun e!376890 () SeekEntryResult!6988)

(assert (=> b!656239 (= e!376890 (MissingVacant!6988 vacantSpotIndex!68))))

(declare-fun b!656240 () Bool)

(declare-fun c!75646 () Bool)

(declare-fun lt!306314 () (_ BitVec 64))

(assert (=> b!656240 (= c!75646 (= lt!306314 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!376891 () SeekEntryResult!6988)

(assert (=> b!656240 (= e!376891 e!376890)))

(declare-fun b!656241 () Bool)

(declare-fun e!376889 () SeekEntryResult!6988)

(assert (=> b!656241 (= e!376889 e!376891)))

(declare-fun c!75645 () Bool)

(assert (=> b!656241 (= c!75645 (= lt!306314 (select (arr!18548 a!2986) j!136)))))

(declare-fun b!656242 () Bool)

(assert (=> b!656242 (= e!376890 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!306247 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18548 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656243 () Bool)

(assert (=> b!656243 (= e!376891 (Found!6988 lt!306247))))

(declare-fun lt!306313 () SeekEntryResult!6988)

(declare-fun d!92635 () Bool)

(assert (=> d!92635 (and (or (is-Undefined!6988 lt!306313) (not (is-Found!6988 lt!306313)) (and (bvsge (index!30312 lt!306313) #b00000000000000000000000000000000) (bvslt (index!30312 lt!306313) (size!18912 a!2986)))) (or (is-Undefined!6988 lt!306313) (is-Found!6988 lt!306313) (not (is-MissingVacant!6988 lt!306313)) (not (= (index!30314 lt!306313) vacantSpotIndex!68)) (and (bvsge (index!30314 lt!306313) #b00000000000000000000000000000000) (bvslt (index!30314 lt!306313) (size!18912 a!2986)))) (or (is-Undefined!6988 lt!306313) (ite (is-Found!6988 lt!306313) (= (select (arr!18548 a!2986) (index!30312 lt!306313)) (select (arr!18548 a!2986) j!136)) (and (is-MissingVacant!6988 lt!306313) (= (index!30314 lt!306313) vacantSpotIndex!68) (= (select (arr!18548 a!2986) (index!30314 lt!306313)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92635 (= lt!306313 e!376889)))

(declare-fun c!75647 () Bool)

(assert (=> d!92635 (= c!75647 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92635 (= lt!306314 (select (arr!18548 a!2986) lt!306247))))

(assert (=> d!92635 (validMask!0 mask!3053)))

(assert (=> d!92635 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306247 vacantSpotIndex!68 (select (arr!18548 a!2986) j!136) a!2986 mask!3053) lt!306313)))

(declare-fun b!656244 () Bool)

(assert (=> b!656244 (= e!376889 Undefined!6988)))

(assert (= (and d!92635 c!75647) b!656244))

(assert (= (and d!92635 (not c!75647)) b!656241))

(assert (= (and b!656241 c!75645) b!656243))

(assert (= (and b!656241 (not c!75645)) b!656240))

(assert (= (and b!656240 c!75646) b!656239))

(assert (= (and b!656240 (not c!75646)) b!656242))

(assert (=> b!656242 m!629313))

(assert (=> b!656242 m!629313))

(assert (=> b!656242 m!629167))

(declare-fun m!629341 () Bool)

(assert (=> b!656242 m!629341))

(declare-fun m!629345 () Bool)

(assert (=> d!92635 m!629345))

(declare-fun m!629347 () Bool)

(assert (=> d!92635 m!629347))

(declare-fun m!629349 () Bool)

(assert (=> d!92635 m!629349))

(assert (=> d!92635 m!629221))

(assert (=> b!656124 d!92635))

(declare-fun b!656315 () Bool)

(declare-fun e!376928 () SeekEntryResult!6988)

(declare-fun lt!306345 () SeekEntryResult!6988)

(assert (=> b!656315 (= e!376928 (Found!6988 (index!30313 lt!306345)))))

(declare-fun b!656316 () Bool)

(declare-fun c!75682 () Bool)

(declare-fun lt!306346 () (_ BitVec 64))

(assert (=> b!656316 (= c!75682 (= lt!306346 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!376929 () SeekEntryResult!6988)

(assert (=> b!656316 (= e!376928 e!376929)))

(declare-fun d!92639 () Bool)

(declare-fun lt!306347 () SeekEntryResult!6988)

(assert (=> d!92639 (and (or (is-Undefined!6988 lt!306347) (not (is-Found!6988 lt!306347)) (and (bvsge (index!30312 lt!306347) #b00000000000000000000000000000000) (bvslt (index!30312 lt!306347) (size!18912 a!2986)))) (or (is-Undefined!6988 lt!306347) (is-Found!6988 lt!306347) (not (is-MissingZero!6988 lt!306347)) (and (bvsge (index!30311 lt!306347) #b00000000000000000000000000000000) (bvslt (index!30311 lt!306347) (size!18912 a!2986)))) (or (is-Undefined!6988 lt!306347) (is-Found!6988 lt!306347) (is-MissingZero!6988 lt!306347) (not (is-MissingVacant!6988 lt!306347)) (and (bvsge (index!30314 lt!306347) #b00000000000000000000000000000000) (bvslt (index!30314 lt!306347) (size!18912 a!2986)))) (or (is-Undefined!6988 lt!306347) (ite (is-Found!6988 lt!306347) (= (select (arr!18548 a!2986) (index!30312 lt!306347)) k!1786) (ite (is-MissingZero!6988 lt!306347) (= (select (arr!18548 a!2986) (index!30311 lt!306347)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6988 lt!306347) (= (select (arr!18548 a!2986) (index!30314 lt!306347)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!376930 () SeekEntryResult!6988)

(assert (=> d!92639 (= lt!306347 e!376930)))

(declare-fun c!75684 () Bool)

(assert (=> d!92639 (= c!75684 (and (is-Intermediate!6988 lt!306345) (undefined!7800 lt!306345)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38696 (_ BitVec 32)) SeekEntryResult!6988)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92639 (= lt!306345 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!92639 (validMask!0 mask!3053)))

(assert (=> d!92639 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!306347)))

(declare-fun b!656317 () Bool)

(assert (=> b!656317 (= e!376929 (seekKeyOrZeroReturnVacant!0 (x!59093 lt!306345) (index!30313 lt!306345) (index!30313 lt!306345) k!1786 a!2986 mask!3053))))

(declare-fun b!656318 () Bool)

(assert (=> b!656318 (= e!376930 e!376928)))

(assert (=> b!656318 (= lt!306346 (select (arr!18548 a!2986) (index!30313 lt!306345)))))

(declare-fun c!75683 () Bool)

(assert (=> b!656318 (= c!75683 (= lt!306346 k!1786))))

(declare-fun b!656319 () Bool)

(assert (=> b!656319 (= e!376930 Undefined!6988)))

(declare-fun b!656320 () Bool)

(assert (=> b!656320 (= e!376929 (MissingZero!6988 (index!30313 lt!306345)))))

(assert (= (and d!92639 c!75684) b!656319))

(assert (= (and d!92639 (not c!75684)) b!656318))

(assert (= (and b!656318 c!75683) b!656315))

(assert (= (and b!656318 (not c!75683)) b!656316))

(assert (= (and b!656316 c!75682) b!656320))

(assert (= (and b!656316 (not c!75682)) b!656317))

(declare-fun m!629393 () Bool)

(assert (=> d!92639 m!629393))

(declare-fun m!629395 () Bool)

(assert (=> d!92639 m!629395))

(assert (=> d!92639 m!629221))

(declare-fun m!629397 () Bool)

(assert (=> d!92639 m!629397))

(declare-fun m!629399 () Bool)

(assert (=> d!92639 m!629399))

(declare-fun m!629401 () Bool)

(assert (=> d!92639 m!629401))

(assert (=> d!92639 m!629393))

(declare-fun m!629403 () Bool)

(assert (=> b!656317 m!629403))

(declare-fun m!629405 () Bool)

(assert (=> b!656318 m!629405))

(assert (=> b!656126 d!92639))

(declare-fun d!92653 () Bool)

(declare-fun res!425701 () Bool)

(declare-fun e!376956 () Bool)

(assert (=> d!92653 (=> res!425701 e!376956)))

(assert (=> d!92653 (= res!425701 (bvsge #b00000000000000000000000000000000 (size!18912 a!2986)))))

(assert (=> d!92653 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12586) e!376956)))

(declare-fun b!656349 () Bool)

(declare-fun e!376953 () Bool)

(assert (=> b!656349 (= e!376956 e!376953)))

(declare-fun res!425703 () Bool)

(assert (=> b!656349 (=> (not res!425703) (not e!376953))))

(declare-fun e!376954 () Bool)

(assert (=> b!656349 (= res!425703 (not e!376954))))

(declare-fun res!425702 () Bool)

(assert (=> b!656349 (=> (not res!425702) (not e!376954))))

(assert (=> b!656349 (= res!425702 (validKeyInArray!0 (select (arr!18548 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!656350 () Bool)

(declare-fun e!376955 () Bool)

(assert (=> b!656350 (= e!376953 e!376955)))

(declare-fun c!75691 () Bool)

(assert (=> b!656350 (= c!75691 (validKeyInArray!0 (select (arr!18548 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33844 () Bool)

(declare-fun call!33847 () Bool)

(assert (=> bm!33844 (= call!33847 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75691 (Cons!12585 (select (arr!18548 a!2986) #b00000000000000000000000000000000) Nil!12586) Nil!12586)))))

(declare-fun b!656351 () Bool)

(assert (=> b!656351 (= e!376955 call!33847)))

(declare-fun b!656352 () Bool)

(assert (=> b!656352 (= e!376955 call!33847)))

(declare-fun b!656353 () Bool)

(declare-fun contains!3192 (List!12589 (_ BitVec 64)) Bool)

(assert (=> b!656353 (= e!376954 (contains!3192 Nil!12586 (select (arr!18548 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92653 (not res!425701)) b!656349))

(assert (= (and b!656349 res!425702) b!656353))

(assert (= (and b!656349 res!425703) b!656350))

(assert (= (and b!656350 c!75691) b!656351))

(assert (= (and b!656350 (not c!75691)) b!656352))

(assert (= (or b!656351 b!656352) bm!33844))

(assert (=> b!656349 m!629273))

(assert (=> b!656349 m!629273))

(assert (=> b!656349 m!629275))

(assert (=> b!656350 m!629273))

(assert (=> b!656350 m!629273))

(assert (=> b!656350 m!629275))

(assert (=> bm!33844 m!629273))

(declare-fun m!629433 () Bool)

(assert (=> bm!33844 m!629433))

(assert (=> b!656353 m!629273))

(assert (=> b!656353 m!629273))

(declare-fun m!629437 () Bool)

(assert (=> b!656353 m!629437))

(assert (=> b!656115 d!92653))

(declare-fun d!92667 () Bool)

(declare-fun res!425711 () Bool)

(declare-fun e!376967 () Bool)

(assert (=> d!92667 (=> res!425711 e!376967)))

(assert (=> d!92667 (= res!425711 (= (select (arr!18548 lt!306250) j!136) (select (arr!18548 a!2986) j!136)))))

(assert (=> d!92667 (= (arrayContainsKey!0 lt!306250 (select (arr!18548 a!2986) j!136) j!136) e!376967)))

(declare-fun b!656367 () Bool)

(declare-fun e!376968 () Bool)

(assert (=> b!656367 (= e!376967 e!376968)))

(declare-fun res!425712 () Bool)

(assert (=> b!656367 (=> (not res!425712) (not e!376968))))

(assert (=> b!656367 (= res!425712 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18912 lt!306250)))))

(declare-fun b!656368 () Bool)

(assert (=> b!656368 (= e!376968 (arrayContainsKey!0 lt!306250 (select (arr!18548 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92667 (not res!425711)) b!656367))

(assert (= (and b!656367 res!425712) b!656368))

(declare-fun m!629451 () Bool)

(assert (=> d!92667 m!629451))

(assert (=> b!656368 m!629167))

(declare-fun m!629453 () Bool)

(assert (=> b!656368 m!629453))

(assert (=> b!656125 d!92667))

(declare-fun d!92681 () Bool)

(declare-fun res!425713 () Bool)

(declare-fun e!376969 () Bool)

(assert (=> d!92681 (=> res!425713 e!376969)))

(assert (=> d!92681 (= res!425713 (= (select (arr!18548 lt!306250) index!984) (select (arr!18548 a!2986) j!136)))))

(assert (=> d!92681 (= (arrayContainsKey!0 lt!306250 (select (arr!18548 a!2986) j!136) index!984) e!376969)))

(declare-fun b!656369 () Bool)

(declare-fun e!376970 () Bool)

(assert (=> b!656369 (= e!376969 e!376970)))

(declare-fun res!425714 () Bool)

(assert (=> b!656369 (=> (not res!425714) (not e!376970))))

(assert (=> b!656369 (= res!425714 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18912 lt!306250)))))

(declare-fun b!656370 () Bool)

(assert (=> b!656370 (= e!376970 (arrayContainsKey!0 lt!306250 (select (arr!18548 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92681 (not res!425713)) b!656369))

(assert (= (and b!656369 res!425714) b!656370))

(assert (=> d!92681 m!629329))

(assert (=> b!656370 m!629167))

(declare-fun m!629455 () Bool)

(assert (=> b!656370 m!629455))

(assert (=> b!656132 d!92681))

(assert (=> b!656123 d!92681))

(declare-fun d!92683 () Bool)

(assert (=> d!92683 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59376 d!92683))

(declare-fun d!92691 () Bool)

(assert (=> d!92691 (= (array_inv!14344 a!2986) (bvsge (size!18912 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59376 d!92691))

(declare-fun d!92693 () Bool)

(assert (=> d!92693 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!656110 d!92693))

(declare-fun d!92695 () Bool)

(declare-fun res!425726 () Bool)

(declare-fun e!376986 () Bool)

(assert (=> d!92695 (=> res!425726 e!376986)))

(assert (=> d!92695 (= res!425726 (= (select (arr!18548 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!92695 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!376986)))

(declare-fun b!656390 () Bool)

(declare-fun e!376987 () Bool)

(assert (=> b!656390 (= e!376986 e!376987)))

(declare-fun res!425727 () Bool)

(assert (=> b!656390 (=> (not res!425727) (not e!376987))))

(assert (=> b!656390 (= res!425727 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18912 a!2986)))))

(declare-fun b!656391 () Bool)

(assert (=> b!656391 (= e!376987 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92695 (not res!425726)) b!656390))

(assert (= (and b!656390 res!425727) b!656391))

(assert (=> d!92695 m!629273))

(declare-fun m!629477 () Bool)

(assert (=> b!656391 m!629477))

(assert (=> b!656120 d!92695))

(declare-fun d!92697 () Bool)

(assert (=> d!92697 (= (validKeyInArray!0 (select (arr!18548 a!2986) j!136)) (and (not (= (select (arr!18548 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18548 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!656109 d!92697))

(assert (=> b!656127 d!92667))

(declare-fun d!92699 () Bool)

(declare-fun res!425728 () Bool)

(declare-fun e!376991 () Bool)

(assert (=> d!92699 (=> res!425728 e!376991)))

(assert (=> d!92699 (= res!425728 (bvsge index!984 (size!18912 lt!306250)))))

(assert (=> d!92699 (= (arrayNoDuplicates!0 lt!306250 index!984 Nil!12586) e!376991)))

(declare-fun b!656392 () Bool)

(declare-fun e!376988 () Bool)

(assert (=> b!656392 (= e!376991 e!376988)))

(declare-fun res!425730 () Bool)

(assert (=> b!656392 (=> (not res!425730) (not e!376988))))

(declare-fun e!376989 () Bool)

(assert (=> b!656392 (= res!425730 (not e!376989))))

(declare-fun res!425729 () Bool)

(assert (=> b!656392 (=> (not res!425729) (not e!376989))))

(assert (=> b!656392 (= res!425729 (validKeyInArray!0 (select (arr!18548 lt!306250) index!984)))))

(declare-fun b!656393 () Bool)

(declare-fun e!376990 () Bool)

(assert (=> b!656393 (= e!376988 e!376990)))

(declare-fun c!75699 () Bool)

(assert (=> b!656393 (= c!75699 (validKeyInArray!0 (select (arr!18548 lt!306250) index!984)))))

(declare-fun bm!33849 () Bool)

(declare-fun call!33852 () Bool)

(assert (=> bm!33849 (= call!33852 (arrayNoDuplicates!0 lt!306250 (bvadd index!984 #b00000000000000000000000000000001) (ite c!75699 (Cons!12585 (select (arr!18548 lt!306250) index!984) Nil!12586) Nil!12586)))))

(declare-fun b!656394 () Bool)

(assert (=> b!656394 (= e!376990 call!33852)))

(declare-fun b!656395 () Bool)

(assert (=> b!656395 (= e!376990 call!33852)))

(declare-fun b!656396 () Bool)

(assert (=> b!656396 (= e!376989 (contains!3192 Nil!12586 (select (arr!18548 lt!306250) index!984)))))

(assert (= (and d!92699 (not res!425728)) b!656392))

(assert (= (and b!656392 res!425729) b!656396))

(assert (= (and b!656392 res!425730) b!656393))

(assert (= (and b!656393 c!75699) b!656394))

(assert (= (and b!656393 (not c!75699)) b!656395))

(assert (= (or b!656394 b!656395) bm!33849))

(assert (=> b!656392 m!629329))

(assert (=> b!656392 m!629329))

(declare-fun m!629479 () Bool)

(assert (=> b!656392 m!629479))

(assert (=> b!656393 m!629329))

(assert (=> b!656393 m!629329))

(assert (=> b!656393 m!629479))

(assert (=> bm!33849 m!629329))

(declare-fun m!629481 () Bool)

(assert (=> bm!33849 m!629481))

(assert (=> b!656396 m!629329))

(assert (=> b!656396 m!629329))

(declare-fun m!629483 () Bool)

(assert (=> b!656396 m!629483))

(assert (=> b!656127 d!92699))

(declare-fun d!92701 () Bool)

(declare-fun res!425731 () Bool)

(declare-fun e!376995 () Bool)

(assert (=> d!92701 (=> res!425731 e!376995)))

(assert (=> d!92701 (= res!425731 (bvsge #b00000000000000000000000000000000 (size!18912 lt!306250)))))

(assert (=> d!92701 (= (arrayNoDuplicates!0 lt!306250 #b00000000000000000000000000000000 Nil!12586) e!376995)))

(declare-fun b!656397 () Bool)

(declare-fun e!376992 () Bool)

(assert (=> b!656397 (= e!376995 e!376992)))

(declare-fun res!425733 () Bool)

(assert (=> b!656397 (=> (not res!425733) (not e!376992))))

(declare-fun e!376993 () Bool)

(assert (=> b!656397 (= res!425733 (not e!376993))))

(declare-fun res!425732 () Bool)

(assert (=> b!656397 (=> (not res!425732) (not e!376993))))

(assert (=> b!656397 (= res!425732 (validKeyInArray!0 (select (arr!18548 lt!306250) #b00000000000000000000000000000000)))))

(declare-fun b!656398 () Bool)

(declare-fun e!376994 () Bool)

(assert (=> b!656398 (= e!376992 e!376994)))

(declare-fun c!75700 () Bool)

(assert (=> b!656398 (= c!75700 (validKeyInArray!0 (select (arr!18548 lt!306250) #b00000000000000000000000000000000)))))

(declare-fun bm!33850 () Bool)

(declare-fun call!33853 () Bool)

(assert (=> bm!33850 (= call!33853 (arrayNoDuplicates!0 lt!306250 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75700 (Cons!12585 (select (arr!18548 lt!306250) #b00000000000000000000000000000000) Nil!12586) Nil!12586)))))

(declare-fun b!656399 () Bool)

(assert (=> b!656399 (= e!376994 call!33853)))

(declare-fun b!656400 () Bool)

(assert (=> b!656400 (= e!376994 call!33853)))

(declare-fun b!656401 () Bool)

(assert (=> b!656401 (= e!376993 (contains!3192 Nil!12586 (select (arr!18548 lt!306250) #b00000000000000000000000000000000)))))

(assert (= (and d!92701 (not res!425731)) b!656397))

(assert (= (and b!656397 res!425732) b!656401))

(assert (= (and b!656397 res!425733) b!656398))

(assert (= (and b!656398 c!75700) b!656399))

(assert (= (and b!656398 (not c!75700)) b!656400))

(assert (= (or b!656399 b!656400) bm!33850))

(declare-fun m!629485 () Bool)

(assert (=> b!656397 m!629485))

(assert (=> b!656397 m!629485))

(declare-fun m!629487 () Bool)

(assert (=> b!656397 m!629487))

(assert (=> b!656398 m!629485))

(assert (=> b!656398 m!629485))

(assert (=> b!656398 m!629487))

(assert (=> bm!33850 m!629485))

(declare-fun m!629489 () Bool)

(assert (=> bm!33850 m!629489))

(assert (=> b!656401 m!629485))

(assert (=> b!656401 m!629485))

(declare-fun m!629491 () Bool)

(assert (=> b!656401 m!629491))

(assert (=> b!656127 d!92701))

(declare-fun d!92703 () Bool)

(assert (=> d!92703 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (size!18912 lt!306250)) (not (= (select (arr!18548 lt!306250) index!984) (select (arr!18548 a!2986) j!136))))))

(declare-fun lt!306381 () Unit!22634)

(declare-fun choose!21 (array!38696 (_ BitVec 64) (_ BitVec 32) List!12589) Unit!22634)

(assert (=> d!92703 (= lt!306381 (choose!21 lt!306250 (select (arr!18548 a!2986) j!136) index!984 Nil!12586))))

(assert (=> d!92703 (bvslt (size!18912 lt!306250) #b01111111111111111111111111111111)))

(assert (=> d!92703 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306250 (select (arr!18548 a!2986) j!136) index!984 Nil!12586) lt!306381)))

(declare-fun bs!19534 () Bool)

(assert (= bs!19534 d!92703))

(assert (=> bs!19534 m!629329))

(assert (=> bs!19534 m!629167))

(declare-fun m!629493 () Bool)

(assert (=> bs!19534 m!629493))

(assert (=> b!656127 d!92703))

(declare-fun d!92705 () Bool)

(assert (=> d!92705 (arrayNoDuplicates!0 lt!306250 index!984 Nil!12586)))

(declare-fun lt!306384 () Unit!22634)

(declare-fun choose!39 (array!38696 (_ BitVec 32) (_ BitVec 32)) Unit!22634)

(assert (=> d!92705 (= lt!306384 (choose!39 lt!306250 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92705 (bvslt (size!18912 lt!306250) #b01111111111111111111111111111111)))

(assert (=> d!92705 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!306250 #b00000000000000000000000000000000 index!984) lt!306384)))

(declare-fun bs!19535 () Bool)

(assert (= bs!19535 d!92705))

(assert (=> bs!19535 m!629193))

(declare-fun m!629495 () Bool)

(assert (=> bs!19535 m!629495))

(assert (=> b!656127 d!92705))

(declare-fun d!92707 () Bool)

(assert (=> d!92707 (arrayContainsKey!0 lt!306250 (select (arr!18548 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306390 () Unit!22634)

(declare-fun choose!114 (array!38696 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22634)

(assert (=> d!92707 (= lt!306390 (choose!114 lt!306250 (select (arr!18548 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92707 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92707 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306250 (select (arr!18548 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!306390)))

(declare-fun bs!19536 () Bool)

(assert (= bs!19536 d!92707))

(assert (=> bs!19536 m!629167))

(assert (=> bs!19536 m!629191))

(assert (=> bs!19536 m!629167))

(declare-fun m!629511 () Bool)

(assert (=> bs!19536 m!629511))

(assert (=> b!656127 d!92707))

(declare-fun d!92711 () Bool)

(declare-fun e!377015 () Bool)

(assert (=> d!92711 e!377015))

(declare-fun res!425742 () Bool)

(assert (=> d!92711 (=> (not res!425742) (not e!377015))))

