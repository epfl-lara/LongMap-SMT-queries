; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59552 () Bool)

(assert start!59552)

(declare-fun b!657104 () Bool)

(declare-fun e!377468 () Bool)

(declare-fun e!377462 () Bool)

(assert (=> b!657104 (= e!377468 e!377462)))

(declare-fun res!426095 () Bool)

(assert (=> b!657104 (=> (not res!426095) (not e!377462))))

(declare-datatypes ((SeekEntryResult!6992 0))(
  ( (MissingZero!6992 (index!30333 (_ BitVec 32))) (Found!6992 (index!30334 (_ BitVec 32))) (Intermediate!6992 (undefined!7804 Bool) (index!30335 (_ BitVec 32)) (x!59131 (_ BitVec 32))) (Undefined!6992) (MissingVacant!6992 (index!30336 (_ BitVec 32))) )
))
(declare-fun lt!306799 () SeekEntryResult!6992)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!657104 (= res!426095 (or (= lt!306799 (MissingZero!6992 i!1108)) (= lt!306799 (MissingVacant!6992 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!38710 0))(
  ( (array!38711 (arr!18552 (Array (_ BitVec 32) (_ BitVec 64))) (size!18916 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38710)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38710 (_ BitVec 32)) SeekEntryResult!6992)

(assert (=> b!657104 (= lt!306799 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!657105 () Bool)

(declare-fun res!426094 () Bool)

(assert (=> b!657105 (=> (not res!426094) (not e!377468))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657105 (= res!426094 (validKeyInArray!0 (select (arr!18552 a!2986) j!136)))))

(declare-fun b!657106 () Bool)

(declare-fun res!426103 () Bool)

(assert (=> b!657106 (=> (not res!426103) (not e!377462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38710 (_ BitVec 32)) Bool)

(assert (=> b!657106 (= res!426103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657107 () Bool)

(declare-fun res!426091 () Bool)

(assert (=> b!657107 (=> (not res!426091) (not e!377468))))

(assert (=> b!657107 (= res!426091 (and (= (size!18916 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18916 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18916 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657108 () Bool)

(declare-fun e!377458 () Bool)

(declare-fun e!377460 () Bool)

(assert (=> b!657108 (= e!377458 e!377460)))

(declare-fun res!426096 () Bool)

(assert (=> b!657108 (=> (not res!426096) (not e!377460))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!306798 () SeekEntryResult!6992)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!657108 (= res!426096 (and (= lt!306798 (Found!6992 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18552 a!2986) index!984) (select (arr!18552 a!2986) j!136))) (not (= (select (arr!18552 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38710 (_ BitVec 32)) SeekEntryResult!6992)

(assert (=> b!657108 (= lt!306798 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18552 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!657109 () Bool)

(declare-fun e!377464 () Bool)

(assert (=> b!657109 (= e!377464 true)))

(assert (=> b!657109 (= (select (store (arr!18552 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!657110 () Bool)

(assert (=> b!657110 (= e!377462 e!377458)))

(declare-fun res!426090 () Bool)

(assert (=> b!657110 (=> (not res!426090) (not e!377458))))

(assert (=> b!657110 (= res!426090 (= (select (store (arr!18552 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!306796 () array!38710)

(assert (=> b!657110 (= lt!306796 (array!38711 (store (arr!18552 a!2986) i!1108 k!1786) (size!18916 a!2986)))))

(declare-fun b!657111 () Bool)

(declare-fun e!377465 () Bool)

(declare-fun arrayContainsKey!0 (array!38710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657111 (= e!377465 (arrayContainsKey!0 lt!306796 (select (arr!18552 a!2986) j!136) index!984))))

(declare-fun b!657112 () Bool)

(declare-datatypes ((Unit!22674 0))(
  ( (Unit!22675) )
))
(declare-fun e!377471 () Unit!22674)

(declare-fun Unit!22676 () Unit!22674)

(assert (=> b!657112 (= e!377471 Unit!22676)))

(declare-fun b!657113 () Bool)

(declare-fun res!426098 () Bool)

(assert (=> b!657113 (= res!426098 (arrayContainsKey!0 lt!306796 (select (arr!18552 a!2986) j!136) j!136))))

(assert (=> b!657113 (=> (not res!426098) (not e!377465))))

(declare-fun e!377472 () Bool)

(assert (=> b!657113 (= e!377472 e!377465)))

(declare-fun b!657114 () Bool)

(declare-fun e!377466 () Unit!22674)

(declare-fun Unit!22677 () Unit!22674)

(assert (=> b!657114 (= e!377466 Unit!22677)))

(assert (=> b!657114 false))

(declare-fun b!657115 () Bool)

(declare-fun Unit!22678 () Unit!22674)

(assert (=> b!657115 (= e!377466 Unit!22678)))

(declare-fun e!377463 () Bool)

(declare-fun b!657116 () Bool)

(assert (=> b!657116 (= e!377463 (arrayContainsKey!0 lt!306796 (select (arr!18552 a!2986) j!136) index!984))))

(declare-fun b!657117 () Bool)

(declare-fun res!426092 () Bool)

(assert (=> b!657117 (=> (not res!426092) (not e!377468))))

(assert (=> b!657117 (= res!426092 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!657118 () Bool)

(declare-fun res!426099 () Bool)

(assert (=> b!657118 (= res!426099 (bvsge j!136 index!984))))

(assert (=> b!657118 (=> res!426099 e!377472)))

(declare-fun e!377467 () Bool)

(assert (=> b!657118 (= e!377467 e!377472)))

(declare-fun b!657119 () Bool)

(declare-fun res!426089 () Bool)

(assert (=> b!657119 (=> (not res!426089) (not e!377462))))

(declare-datatypes ((List!12593 0))(
  ( (Nil!12590) (Cons!12589 (h!13634 (_ BitVec 64)) (t!18821 List!12593)) )
))
(declare-fun arrayNoDuplicates!0 (array!38710 (_ BitVec 32) List!12593) Bool)

(assert (=> b!657119 (= res!426089 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12590))))

(declare-fun b!657120 () Bool)

(assert (=> b!657120 false))

(declare-fun lt!306806 () Unit!22674)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38710 (_ BitVec 64) (_ BitVec 32) List!12593) Unit!22674)

(assert (=> b!657120 (= lt!306806 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306796 (select (arr!18552 a!2986) j!136) j!136 Nil!12590))))

(assert (=> b!657120 (arrayNoDuplicates!0 lt!306796 j!136 Nil!12590)))

(declare-fun lt!306805 () Unit!22674)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38710 (_ BitVec 32) (_ BitVec 32)) Unit!22674)

(assert (=> b!657120 (= lt!306805 (lemmaNoDuplicateFromThenFromBigger!0 lt!306796 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657120 (arrayNoDuplicates!0 lt!306796 #b00000000000000000000000000000000 Nil!12590)))

(declare-fun lt!306789 () Unit!22674)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38710 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12593) Unit!22674)

(assert (=> b!657120 (= lt!306789 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12590))))

(assert (=> b!657120 (arrayContainsKey!0 lt!306796 (select (arr!18552 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306801 () Unit!22674)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38710 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22674)

(assert (=> b!657120 (= lt!306801 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306796 (select (arr!18552 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!377459 () Unit!22674)

(declare-fun Unit!22679 () Unit!22674)

(assert (=> b!657120 (= e!377459 Unit!22679)))

(declare-fun b!657121 () Bool)

(declare-fun res!426088 () Bool)

(assert (=> b!657121 (=> (not res!426088) (not e!377462))))

(assert (=> b!657121 (= res!426088 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18552 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!657122 () Bool)

(declare-fun e!377461 () Bool)

(declare-fun lt!306795 () SeekEntryResult!6992)

(assert (=> b!657122 (= e!377461 (= lt!306798 lt!306795))))

(declare-fun b!657123 () Bool)

(assert (=> b!657123 (= e!377460 (not e!377464))))

(declare-fun res!426100 () Bool)

(assert (=> b!657123 (=> res!426100 e!377464)))

(declare-fun lt!306803 () SeekEntryResult!6992)

(assert (=> b!657123 (= res!426100 (not (= lt!306803 (MissingVacant!6992 vacantSpotIndex!68))))))

(declare-fun lt!306808 () Unit!22674)

(declare-fun e!377470 () Unit!22674)

(assert (=> b!657123 (= lt!306808 e!377470)))

(declare-fun c!75875 () Bool)

(assert (=> b!657123 (= c!75875 (= lt!306803 (Found!6992 index!984)))))

(declare-fun lt!306792 () Unit!22674)

(assert (=> b!657123 (= lt!306792 e!377466)))

(declare-fun c!75878 () Bool)

(assert (=> b!657123 (= c!75878 (= lt!306803 Undefined!6992))))

(declare-fun lt!306797 () (_ BitVec 64))

(assert (=> b!657123 (= lt!306803 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306797 lt!306796 mask!3053))))

(assert (=> b!657123 e!377461))

(declare-fun res!426102 () Bool)

(assert (=> b!657123 (=> (not res!426102) (not e!377461))))

(declare-fun lt!306794 () (_ BitVec 32))

(assert (=> b!657123 (= res!426102 (= lt!306795 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306794 vacantSpotIndex!68 lt!306797 lt!306796 mask!3053)))))

(assert (=> b!657123 (= lt!306795 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306794 vacantSpotIndex!68 (select (arr!18552 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657123 (= lt!306797 (select (store (arr!18552 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!306800 () Unit!22674)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38710 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22674)

(assert (=> b!657123 (= lt!306800 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306794 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657123 (= lt!306794 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!657124 () Bool)

(declare-fun Unit!22680 () Unit!22674)

(assert (=> b!657124 (= e!377470 Unit!22680)))

(declare-fun b!657125 () Bool)

(assert (=> b!657125 false))

(declare-fun lt!306807 () Unit!22674)

(assert (=> b!657125 (= lt!306807 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306796 (select (arr!18552 a!2986) j!136) index!984 Nil!12590))))

(assert (=> b!657125 (arrayNoDuplicates!0 lt!306796 index!984 Nil!12590)))

(declare-fun lt!306793 () Unit!22674)

(assert (=> b!657125 (= lt!306793 (lemmaNoDuplicateFromThenFromBigger!0 lt!306796 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657125 (arrayNoDuplicates!0 lt!306796 #b00000000000000000000000000000000 Nil!12590)))

(declare-fun lt!306802 () Unit!22674)

(assert (=> b!657125 (= lt!306802 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12590))))

(assert (=> b!657125 (arrayContainsKey!0 lt!306796 (select (arr!18552 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306804 () Unit!22674)

(assert (=> b!657125 (= lt!306804 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306796 (select (arr!18552 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!657125 e!377463))

(declare-fun res!426101 () Bool)

(assert (=> b!657125 (=> (not res!426101) (not e!377463))))

(assert (=> b!657125 (= res!426101 (arrayContainsKey!0 lt!306796 (select (arr!18552 a!2986) j!136) j!136))))

(declare-fun Unit!22681 () Unit!22674)

(assert (=> b!657125 (= e!377471 Unit!22681)))

(declare-fun res!426097 () Bool)

(assert (=> start!59552 (=> (not res!426097) (not e!377468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59552 (= res!426097 (validMask!0 mask!3053))))

(assert (=> start!59552 e!377468))

(assert (=> start!59552 true))

(declare-fun array_inv!14348 (array!38710) Bool)

(assert (=> start!59552 (array_inv!14348 a!2986)))

(declare-fun b!657126 () Bool)

(declare-fun Unit!22682 () Unit!22674)

(assert (=> b!657126 (= e!377470 Unit!22682)))

(declare-fun res!426093 () Bool)

(assert (=> b!657126 (= res!426093 (= (select (store (arr!18552 a!2986) i!1108 k!1786) index!984) (select (arr!18552 a!2986) j!136)))))

(assert (=> b!657126 (=> (not res!426093) (not e!377467))))

(assert (=> b!657126 e!377467))

(declare-fun c!75876 () Bool)

(assert (=> b!657126 (= c!75876 (bvslt j!136 index!984))))

(declare-fun lt!306790 () Unit!22674)

(assert (=> b!657126 (= lt!306790 e!377459)))

(declare-fun c!75877 () Bool)

(assert (=> b!657126 (= c!75877 (bvslt index!984 j!136))))

(declare-fun lt!306791 () Unit!22674)

(assert (=> b!657126 (= lt!306791 e!377471)))

(assert (=> b!657126 false))

(declare-fun b!657127 () Bool)

(declare-fun res!426104 () Bool)

(assert (=> b!657127 (=> (not res!426104) (not e!377468))))

(assert (=> b!657127 (= res!426104 (validKeyInArray!0 k!1786))))

(declare-fun b!657128 () Bool)

(declare-fun Unit!22683 () Unit!22674)

(assert (=> b!657128 (= e!377459 Unit!22683)))

(assert (= (and start!59552 res!426097) b!657107))

(assert (= (and b!657107 res!426091) b!657105))

(assert (= (and b!657105 res!426094) b!657127))

(assert (= (and b!657127 res!426104) b!657117))

(assert (= (and b!657117 res!426092) b!657104))

(assert (= (and b!657104 res!426095) b!657106))

(assert (= (and b!657106 res!426103) b!657119))

(assert (= (and b!657119 res!426089) b!657121))

(assert (= (and b!657121 res!426088) b!657110))

(assert (= (and b!657110 res!426090) b!657108))

(assert (= (and b!657108 res!426096) b!657123))

(assert (= (and b!657123 res!426102) b!657122))

(assert (= (and b!657123 c!75878) b!657114))

(assert (= (and b!657123 (not c!75878)) b!657115))

(assert (= (and b!657123 c!75875) b!657126))

(assert (= (and b!657123 (not c!75875)) b!657124))

(assert (= (and b!657126 res!426093) b!657118))

(assert (= (and b!657118 (not res!426099)) b!657113))

(assert (= (and b!657113 res!426098) b!657111))

(assert (= (and b!657126 c!75876) b!657120))

(assert (= (and b!657126 (not c!75876)) b!657128))

(assert (= (and b!657126 c!75877) b!657125))

(assert (= (and b!657126 (not c!75877)) b!657112))

(assert (= (and b!657125 res!426101) b!657116))

(assert (= (and b!657123 (not res!426100)) b!657109))

(declare-fun m!630167 () Bool)

(assert (=> b!657121 m!630167))

(declare-fun m!630169 () Bool)

(assert (=> start!59552 m!630169))

(declare-fun m!630171 () Bool)

(assert (=> start!59552 m!630171))

(declare-fun m!630173 () Bool)

(assert (=> b!657108 m!630173))

(declare-fun m!630175 () Bool)

(assert (=> b!657108 m!630175))

(assert (=> b!657108 m!630175))

(declare-fun m!630177 () Bool)

(assert (=> b!657108 m!630177))

(declare-fun m!630179 () Bool)

(assert (=> b!657104 m!630179))

(assert (=> b!657116 m!630175))

(assert (=> b!657116 m!630175))

(declare-fun m!630181 () Bool)

(assert (=> b!657116 m!630181))

(declare-fun m!630183 () Bool)

(assert (=> b!657109 m!630183))

(declare-fun m!630185 () Bool)

(assert (=> b!657109 m!630185))

(assert (=> b!657105 m!630175))

(assert (=> b!657105 m!630175))

(declare-fun m!630187 () Bool)

(assert (=> b!657105 m!630187))

(declare-fun m!630189 () Bool)

(assert (=> b!657106 m!630189))

(declare-fun m!630191 () Bool)

(assert (=> b!657125 m!630191))

(assert (=> b!657125 m!630175))

(assert (=> b!657125 m!630175))

(declare-fun m!630193 () Bool)

(assert (=> b!657125 m!630193))

(declare-fun m!630195 () Bool)

(assert (=> b!657125 m!630195))

(declare-fun m!630197 () Bool)

(assert (=> b!657125 m!630197))

(assert (=> b!657125 m!630175))

(declare-fun m!630199 () Bool)

(assert (=> b!657125 m!630199))

(assert (=> b!657125 m!630175))

(declare-fun m!630201 () Bool)

(assert (=> b!657125 m!630201))

(assert (=> b!657125 m!630175))

(declare-fun m!630203 () Bool)

(assert (=> b!657125 m!630203))

(declare-fun m!630205 () Bool)

(assert (=> b!657125 m!630205))

(assert (=> b!657113 m!630175))

(assert (=> b!657113 m!630175))

(assert (=> b!657113 m!630203))

(declare-fun m!630207 () Bool)

(assert (=> b!657123 m!630207))

(declare-fun m!630209 () Bool)

(assert (=> b!657123 m!630209))

(assert (=> b!657123 m!630175))

(declare-fun m!630211 () Bool)

(assert (=> b!657123 m!630211))

(assert (=> b!657123 m!630183))

(declare-fun m!630213 () Bool)

(assert (=> b!657123 m!630213))

(assert (=> b!657123 m!630175))

(declare-fun m!630215 () Bool)

(assert (=> b!657123 m!630215))

(declare-fun m!630217 () Bool)

(assert (=> b!657123 m!630217))

(assert (=> b!657120 m!630175))

(declare-fun m!630219 () Bool)

(assert (=> b!657120 m!630219))

(assert (=> b!657120 m!630175))

(assert (=> b!657120 m!630175))

(declare-fun m!630221 () Bool)

(assert (=> b!657120 m!630221))

(assert (=> b!657120 m!630197))

(declare-fun m!630223 () Bool)

(assert (=> b!657120 m!630223))

(assert (=> b!657120 m!630175))

(declare-fun m!630225 () Bool)

(assert (=> b!657120 m!630225))

(declare-fun m!630227 () Bool)

(assert (=> b!657120 m!630227))

(assert (=> b!657120 m!630205))

(assert (=> b!657111 m!630175))

(assert (=> b!657111 m!630175))

(assert (=> b!657111 m!630181))

(assert (=> b!657126 m!630183))

(assert (=> b!657126 m!630185))

(assert (=> b!657126 m!630175))

(declare-fun m!630229 () Bool)

(assert (=> b!657127 m!630229))

(declare-fun m!630231 () Bool)

(assert (=> b!657117 m!630231))

(declare-fun m!630233 () Bool)

(assert (=> b!657119 m!630233))

(assert (=> b!657110 m!630183))

(declare-fun m!630235 () Bool)

(assert (=> b!657110 m!630235))

(push 1)

