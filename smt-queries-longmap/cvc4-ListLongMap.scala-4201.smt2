; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57360 () Bool)

(assert start!57360)

(declare-fun res!410956 () Bool)

(declare-fun e!363253 () Bool)

(assert (=> start!57360 (=> (not res!410956) (not e!363253))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57360 (= res!410956 (validMask!0 mask!3053))))

(assert (=> start!57360 e!363253))

(assert (=> start!57360 true))

(declare-datatypes ((array!38213 0))(
  ( (array!38214 (arr!18335 (Array (_ BitVec 32) (_ BitVec 64))) (size!18699 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38213)

(declare-fun array_inv!14131 (array!38213) Bool)

(assert (=> start!57360 (array_inv!14131 a!2986)))

(declare-fun b!635144 () Bool)

(declare-fun res!410958 () Bool)

(declare-fun e!363250 () Bool)

(assert (=> b!635144 (=> (not res!410958) (not e!363250))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!635144 (= res!410958 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18335 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635145 () Bool)

(declare-fun res!410948 () Bool)

(assert (=> b!635145 (=> (not res!410948) (not e!363253))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635145 (= res!410948 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635146 () Bool)

(declare-fun e!363245 () Bool)

(assert (=> b!635146 (= e!363245 (bvslt (size!18699 a!2986) #b01111111111111111111111111111111))))

(declare-fun lt!293685 () array!38213)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!635146 (arrayContainsKey!0 lt!293685 (select (arr!18335 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!21434 0))(
  ( (Unit!21435) )
))
(declare-fun lt!293682 () Unit!21434)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38213 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21434)

(assert (=> b!635146 (= lt!293682 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293685 (select (arr!18335 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!635147 () Bool)

(declare-fun res!410945 () Bool)

(assert (=> b!635147 (=> (not res!410945) (not e!363250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38213 (_ BitVec 32)) Bool)

(assert (=> b!635147 (= res!410945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!635148 () Bool)

(declare-fun res!410953 () Bool)

(assert (=> b!635148 (=> (not res!410953) (not e!363253))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!635148 (= res!410953 (and (= (size!18699 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18699 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18699 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!635149 () Bool)

(declare-fun e!363246 () Bool)

(declare-fun e!363251 () Bool)

(assert (=> b!635149 (= e!363246 e!363251)))

(declare-fun res!410944 () Bool)

(assert (=> b!635149 (=> (not res!410944) (not e!363251))))

(assert (=> b!635149 (= res!410944 (arrayContainsKey!0 lt!293685 (select (arr!18335 a!2986) j!136) j!136))))

(declare-fun b!635150 () Bool)

(declare-fun e!363254 () Bool)

(assert (=> b!635150 (= e!363254 e!363245)))

(declare-fun res!410960 () Bool)

(assert (=> b!635150 (=> res!410960 e!363245)))

(declare-fun lt!293681 () (_ BitVec 64))

(declare-fun lt!293678 () (_ BitVec 64))

(assert (=> b!635150 (= res!410960 (or (not (= (select (arr!18335 a!2986) j!136) lt!293681)) (not (= (select (arr!18335 a!2986) j!136) lt!293678)) (bvsge j!136 index!984)))))

(declare-fun e!363247 () Bool)

(assert (=> b!635150 e!363247))

(declare-fun res!410954 () Bool)

(assert (=> b!635150 (=> (not res!410954) (not e!363247))))

(assert (=> b!635150 (= res!410954 (= lt!293678 (select (arr!18335 a!2986) j!136)))))

(assert (=> b!635150 (= lt!293678 (select (store (arr!18335 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!635151 () Bool)

(declare-fun res!410950 () Bool)

(assert (=> b!635151 (=> (not res!410950) (not e!363253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635151 (= res!410950 (validKeyInArray!0 (select (arr!18335 a!2986) j!136)))))

(declare-fun b!635152 () Bool)

(declare-fun e!363244 () Unit!21434)

(declare-fun Unit!21436 () Unit!21434)

(assert (=> b!635152 (= e!363244 Unit!21436)))

(declare-fun b!635153 () Bool)

(assert (=> b!635153 (= e!363253 e!363250)))

(declare-fun res!410946 () Bool)

(assert (=> b!635153 (=> (not res!410946) (not e!363250))))

(declare-datatypes ((SeekEntryResult!6775 0))(
  ( (MissingZero!6775 (index!29402 (_ BitVec 32))) (Found!6775 (index!29403 (_ BitVec 32))) (Intermediate!6775 (undefined!7587 Bool) (index!29404 (_ BitVec 32)) (x!58141 (_ BitVec 32))) (Undefined!6775) (MissingVacant!6775 (index!29405 (_ BitVec 32))) )
))
(declare-fun lt!293679 () SeekEntryResult!6775)

(assert (=> b!635153 (= res!410946 (or (= lt!293679 (MissingZero!6775 i!1108)) (= lt!293679 (MissingVacant!6775 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38213 (_ BitVec 32)) SeekEntryResult!6775)

(assert (=> b!635153 (= lt!293679 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!635154 () Bool)

(declare-fun Unit!21437 () Unit!21434)

(assert (=> b!635154 (= e!363244 Unit!21437)))

(assert (=> b!635154 false))

(declare-fun b!635155 () Bool)

(declare-fun e!363248 () Bool)

(declare-fun lt!293683 () SeekEntryResult!6775)

(declare-fun lt!293684 () SeekEntryResult!6775)

(assert (=> b!635155 (= e!363248 (= lt!293683 lt!293684))))

(declare-fun b!635156 () Bool)

(declare-fun res!410947 () Bool)

(assert (=> b!635156 (=> (not res!410947) (not e!363250))))

(declare-datatypes ((List!12376 0))(
  ( (Nil!12373) (Cons!12372 (h!13417 (_ BitVec 64)) (t!18604 List!12376)) )
))
(declare-fun arrayNoDuplicates!0 (array!38213 (_ BitVec 32) List!12376) Bool)

(assert (=> b!635156 (= res!410947 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12373))))

(declare-fun b!635157 () Bool)

(assert (=> b!635157 (= e!363251 (arrayContainsKey!0 lt!293685 (select (arr!18335 a!2986) j!136) index!984))))

(declare-fun b!635158 () Bool)

(declare-fun e!363255 () Bool)

(assert (=> b!635158 (= e!363250 e!363255)))

(declare-fun res!410951 () Bool)

(assert (=> b!635158 (=> (not res!410951) (not e!363255))))

(assert (=> b!635158 (= res!410951 (= (select (store (arr!18335 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635158 (= lt!293685 (array!38214 (store (arr!18335 a!2986) i!1108 k!1786) (size!18699 a!2986)))))

(declare-fun b!635159 () Bool)

(declare-fun e!363252 () Bool)

(assert (=> b!635159 (= e!363252 (not e!363254))))

(declare-fun res!410957 () Bool)

(assert (=> b!635159 (=> res!410957 e!363254)))

(declare-fun lt!293677 () SeekEntryResult!6775)

(assert (=> b!635159 (= res!410957 (not (= lt!293677 (Found!6775 index!984))))))

(declare-fun lt!293686 () Unit!21434)

(assert (=> b!635159 (= lt!293686 e!363244)))

(declare-fun c!72467 () Bool)

(assert (=> b!635159 (= c!72467 (= lt!293677 Undefined!6775))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38213 (_ BitVec 32)) SeekEntryResult!6775)

(assert (=> b!635159 (= lt!293677 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293681 lt!293685 mask!3053))))

(assert (=> b!635159 e!363248))

(declare-fun res!410959 () Bool)

(assert (=> b!635159 (=> (not res!410959) (not e!363248))))

(declare-fun lt!293676 () (_ BitVec 32))

(assert (=> b!635159 (= res!410959 (= lt!293684 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293676 vacantSpotIndex!68 lt!293681 lt!293685 mask!3053)))))

(assert (=> b!635159 (= lt!293684 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293676 vacantSpotIndex!68 (select (arr!18335 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!635159 (= lt!293681 (select (store (arr!18335 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!293680 () Unit!21434)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38213 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21434)

(assert (=> b!635159 (= lt!293680 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293676 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635159 (= lt!293676 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!635160 () Bool)

(assert (=> b!635160 (= e!363247 e!363246)))

(declare-fun res!410949 () Bool)

(assert (=> b!635160 (=> res!410949 e!363246)))

(assert (=> b!635160 (= res!410949 (or (not (= (select (arr!18335 a!2986) j!136) lt!293681)) (not (= (select (arr!18335 a!2986) j!136) lt!293678)) (bvsge j!136 index!984)))))

(declare-fun b!635161 () Bool)

(assert (=> b!635161 (= e!363255 e!363252)))

(declare-fun res!410955 () Bool)

(assert (=> b!635161 (=> (not res!410955) (not e!363252))))

(assert (=> b!635161 (= res!410955 (and (= lt!293683 (Found!6775 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18335 a!2986) index!984) (select (arr!18335 a!2986) j!136))) (not (= (select (arr!18335 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!635161 (= lt!293683 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18335 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635162 () Bool)

(declare-fun res!410952 () Bool)

(assert (=> b!635162 (=> (not res!410952) (not e!363253))))

(assert (=> b!635162 (= res!410952 (validKeyInArray!0 k!1786))))

(assert (= (and start!57360 res!410956) b!635148))

(assert (= (and b!635148 res!410953) b!635151))

(assert (= (and b!635151 res!410950) b!635162))

(assert (= (and b!635162 res!410952) b!635145))

(assert (= (and b!635145 res!410948) b!635153))

(assert (= (and b!635153 res!410946) b!635147))

(assert (= (and b!635147 res!410945) b!635156))

(assert (= (and b!635156 res!410947) b!635144))

(assert (= (and b!635144 res!410958) b!635158))

(assert (= (and b!635158 res!410951) b!635161))

(assert (= (and b!635161 res!410955) b!635159))

(assert (= (and b!635159 res!410959) b!635155))

(assert (= (and b!635159 c!72467) b!635154))

(assert (= (and b!635159 (not c!72467)) b!635152))

(assert (= (and b!635159 (not res!410957)) b!635150))

(assert (= (and b!635150 res!410954) b!635160))

(assert (= (and b!635160 (not res!410949)) b!635149))

(assert (= (and b!635149 res!410944) b!635157))

(assert (= (and b!635150 (not res!410960)) b!635146))

(declare-fun m!609543 () Bool)

(assert (=> b!635156 m!609543))

(declare-fun m!609545 () Bool)

(assert (=> b!635159 m!609545))

(declare-fun m!609547 () Bool)

(assert (=> b!635159 m!609547))

(declare-fun m!609549 () Bool)

(assert (=> b!635159 m!609549))

(declare-fun m!609551 () Bool)

(assert (=> b!635159 m!609551))

(declare-fun m!609553 () Bool)

(assert (=> b!635159 m!609553))

(declare-fun m!609555 () Bool)

(assert (=> b!635159 m!609555))

(declare-fun m!609557 () Bool)

(assert (=> b!635159 m!609557))

(assert (=> b!635159 m!609547))

(declare-fun m!609559 () Bool)

(assert (=> b!635159 m!609559))

(assert (=> b!635146 m!609547))

(assert (=> b!635146 m!609547))

(declare-fun m!609561 () Bool)

(assert (=> b!635146 m!609561))

(assert (=> b!635146 m!609547))

(declare-fun m!609563 () Bool)

(assert (=> b!635146 m!609563))

(assert (=> b!635158 m!609549))

(declare-fun m!609565 () Bool)

(assert (=> b!635158 m!609565))

(assert (=> b!635149 m!609547))

(assert (=> b!635149 m!609547))

(declare-fun m!609567 () Bool)

(assert (=> b!635149 m!609567))

(declare-fun m!609569 () Bool)

(assert (=> b!635147 m!609569))

(assert (=> b!635157 m!609547))

(assert (=> b!635157 m!609547))

(declare-fun m!609571 () Bool)

(assert (=> b!635157 m!609571))

(declare-fun m!609573 () Bool)

(assert (=> b!635162 m!609573))

(assert (=> b!635150 m!609547))

(assert (=> b!635150 m!609549))

(declare-fun m!609575 () Bool)

(assert (=> b!635150 m!609575))

(assert (=> b!635160 m!609547))

(declare-fun m!609577 () Bool)

(assert (=> b!635144 m!609577))

(assert (=> b!635151 m!609547))

(assert (=> b!635151 m!609547))

(declare-fun m!609579 () Bool)

(assert (=> b!635151 m!609579))

(declare-fun m!609581 () Bool)

(assert (=> b!635153 m!609581))

(declare-fun m!609583 () Bool)

(assert (=> start!57360 m!609583))

(declare-fun m!609585 () Bool)

(assert (=> start!57360 m!609585))

(declare-fun m!609587 () Bool)

(assert (=> b!635161 m!609587))

(assert (=> b!635161 m!609547))

(assert (=> b!635161 m!609547))

(declare-fun m!609589 () Bool)

(assert (=> b!635161 m!609589))

(declare-fun m!609591 () Bool)

(assert (=> b!635145 m!609591))

(push 1)

(assert (not b!635161))

(assert (not b!635159))

(assert (not start!57360))

(assert (not b!635156))

(assert (not b!635145))

(assert (not b!635162))

(assert (not b!635147))

(assert (not b!635149))

(assert (not b!635157))

(assert (not b!635151))

(assert (not b!635146))

(assert (not b!635153))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89725 () Bool)

(assert (=> d!89725 (= (validKeyInArray!0 (select (arr!18335 a!2986) j!136)) (and (not (= (select (arr!18335 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18335 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!635151 d!89725))

(declare-fun d!89727 () Bool)

(assert (=> d!89727 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!635162 d!89727))

(declare-fun lt!293720 () SeekEntryResult!6775)

(declare-fun d!89729 () Bool)

(assert (=> d!89729 (and (or (is-Undefined!6775 lt!293720) (not (is-Found!6775 lt!293720)) (and (bvsge (index!29403 lt!293720) #b00000000000000000000000000000000) (bvslt (index!29403 lt!293720) (size!18699 a!2986)))) (or (is-Undefined!6775 lt!293720) (is-Found!6775 lt!293720) (not (is-MissingVacant!6775 lt!293720)) (not (= (index!29405 lt!293720) vacantSpotIndex!68)) (and (bvsge (index!29405 lt!293720) #b00000000000000000000000000000000) (bvslt (index!29405 lt!293720) (size!18699 a!2986)))) (or (is-Undefined!6775 lt!293720) (ite (is-Found!6775 lt!293720) (= (select (arr!18335 a!2986) (index!29403 lt!293720)) (select (arr!18335 a!2986) j!136)) (and (is-MissingVacant!6775 lt!293720) (= (index!29405 lt!293720) vacantSpotIndex!68) (= (select (arr!18335 a!2986) (index!29405 lt!293720)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!363324 () SeekEntryResult!6775)

(assert (=> d!89729 (= lt!293720 e!363324)))

(declare-fun c!72502 () Bool)

(assert (=> d!89729 (= c!72502 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!293721 () (_ BitVec 64))

(assert (=> d!89729 (= lt!293721 (select (arr!18335 a!2986) index!984))))

(assert (=> d!89729 (validMask!0 mask!3053)))

(assert (=> d!89729 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18335 a!2986) j!136) a!2986 mask!3053) lt!293720)))

(declare-fun b!635263 () Bool)

(declare-fun e!363325 () SeekEntryResult!6775)

(assert (=> b!635263 (= e!363325 (Found!6775 index!984))))

(declare-fun b!635264 () Bool)

(assert (=> b!635264 (= e!363324 e!363325)))

(declare-fun c!72501 () Bool)

(assert (=> b!635264 (= c!72501 (= lt!293721 (select (arr!18335 a!2986) j!136)))))

(declare-fun b!635265 () Bool)

(assert (=> b!635265 (= e!363324 Undefined!6775)))

(declare-fun b!635266 () Bool)

(declare-fun c!72503 () Bool)

(assert (=> b!635266 (= c!72503 (= lt!293721 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363323 () SeekEntryResult!6775)

(assert (=> b!635266 (= e!363325 e!363323)))

(declare-fun b!635267 () Bool)

(assert (=> b!635267 (= e!363323 (MissingVacant!6775 vacantSpotIndex!68))))

(declare-fun b!635268 () Bool)

(assert (=> b!635268 (= e!363323 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18335 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!89729 c!72502) b!635265))

(assert (= (and d!89729 (not c!72502)) b!635264))

(assert (= (and b!635264 c!72501) b!635263))

(assert (= (and b!635264 (not c!72501)) b!635266))

(assert (= (and b!635266 c!72503) b!635267))

(assert (= (and b!635266 (not c!72503)) b!635268))

(declare-fun m!609653 () Bool)

(assert (=> d!89729 m!609653))

(declare-fun m!609655 () Bool)

(assert (=> d!89729 m!609655))

(assert (=> d!89729 m!609587))

(assert (=> d!89729 m!609583))

(assert (=> b!635268 m!609545))

(assert (=> b!635268 m!609545))

(assert (=> b!635268 m!609547))

(declare-fun m!609657 () Bool)

(assert (=> b!635268 m!609657))

(assert (=> b!635161 d!89729))

(declare-fun d!89749 () Bool)

(assert (=> d!89749 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57360 d!89749))

(declare-fun d!89757 () Bool)

(assert (=> d!89757 (= (array_inv!14131 a!2986) (bvsge (size!18699 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57360 d!89757))

(declare-fun lt!293767 () SeekEntryResult!6775)

(declare-fun e!363370 () SeekEntryResult!6775)

(declare-fun b!635347 () Bool)

(assert (=> b!635347 (= e!363370 (seekKeyOrZeroReturnVacant!0 (x!58141 lt!293767) (index!29404 lt!293767) (index!29404 lt!293767) k!1786 a!2986 mask!3053))))

(declare-fun b!635348 () Bool)

(assert (=> b!635348 (= e!363370 (MissingZero!6775 (index!29404 lt!293767)))))

(declare-fun b!635349 () Bool)

(declare-fun e!363371 () SeekEntryResult!6775)

(declare-fun e!363372 () SeekEntryResult!6775)

(assert (=> b!635349 (= e!363371 e!363372)))

(declare-fun lt!293766 () (_ BitVec 64))

(assert (=> b!635349 (= lt!293766 (select (arr!18335 a!2986) (index!29404 lt!293767)))))

(declare-fun c!72539 () Bool)

(assert (=> b!635349 (= c!72539 (= lt!293766 k!1786))))

(declare-fun b!635350 () Bool)

(assert (=> b!635350 (= e!363371 Undefined!6775)))

(declare-fun b!635351 () Bool)

(declare-fun c!72538 () Bool)

(assert (=> b!635351 (= c!72538 (= lt!293766 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635351 (= e!363372 e!363370)))

(declare-fun b!635346 () Bool)

(assert (=> b!635346 (= e!363372 (Found!6775 (index!29404 lt!293767)))))

(declare-fun d!89759 () Bool)

(declare-fun lt!293765 () SeekEntryResult!6775)

(assert (=> d!89759 (and (or (is-Undefined!6775 lt!293765) (not (is-Found!6775 lt!293765)) (and (bvsge (index!29403 lt!293765) #b00000000000000000000000000000000) (bvslt (index!29403 lt!293765) (size!18699 a!2986)))) (or (is-Undefined!6775 lt!293765) (is-Found!6775 lt!293765) (not (is-MissingZero!6775 lt!293765)) (and (bvsge (index!29402 lt!293765) #b00000000000000000000000000000000) (bvslt (index!29402 lt!293765) (size!18699 a!2986)))) (or (is-Undefined!6775 lt!293765) (is-Found!6775 lt!293765) (is-MissingZero!6775 lt!293765) (not (is-MissingVacant!6775 lt!293765)) (and (bvsge (index!29405 lt!293765) #b00000000000000000000000000000000) (bvslt (index!29405 lt!293765) (size!18699 a!2986)))) (or (is-Undefined!6775 lt!293765) (ite (is-Found!6775 lt!293765) (= (select (arr!18335 a!2986) (index!29403 lt!293765)) k!1786) (ite (is-MissingZero!6775 lt!293765) (= (select (arr!18335 a!2986) (index!29402 lt!293765)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6775 lt!293765) (= (select (arr!18335 a!2986) (index!29405 lt!293765)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89759 (= lt!293765 e!363371)))

(declare-fun c!72537 () Bool)

(assert (=> d!89759 (= c!72537 (and (is-Intermediate!6775 lt!293767) (undefined!7587 lt!293767)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38213 (_ BitVec 32)) SeekEntryResult!6775)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89759 (= lt!293767 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!89759 (validMask!0 mask!3053)))

(assert (=> d!89759 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!293765)))

(assert (= (and d!89759 c!72537) b!635350))

(assert (= (and d!89759 (not c!72537)) b!635349))

(assert (= (and b!635349 c!72539) b!635346))

(assert (= (and b!635349 (not c!72539)) b!635351))

(assert (= (and b!635351 c!72538) b!635348))

(assert (= (and b!635351 (not c!72538)) b!635347))

(declare-fun m!609733 () Bool)

(assert (=> b!635347 m!609733))

(declare-fun m!609735 () Bool)

(assert (=> b!635349 m!609735))

(declare-fun m!609737 () Bool)

(assert (=> d!89759 m!609737))

(declare-fun m!609739 () Bool)

(assert (=> d!89759 m!609739))

(assert (=> d!89759 m!609583))

(declare-fun m!609741 () Bool)

(assert (=> d!89759 m!609741))

(declare-fun m!609743 () Bool)

(assert (=> d!89759 m!609743))

(declare-fun m!609745 () Bool)

(assert (=> d!89759 m!609745))

(assert (=> d!89759 m!609743))

(assert (=> b!635153 d!89759))

(declare-fun d!89775 () Bool)

(declare-fun res!411012 () Bool)

(declare-fun e!363379 () Bool)

(assert (=> d!89775 (=> res!411012 e!363379)))

(assert (=> d!89775 (= res!411012 (= (select (arr!18335 lt!293685) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18335 a!2986) j!136)))))

(assert (=> d!89775 (= (arrayContainsKey!0 lt!293685 (select (arr!18335 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!363379)))

(declare-fun b!635358 () Bool)

(declare-fun e!363380 () Bool)

(assert (=> b!635358 (= e!363379 e!363380)))

(declare-fun res!411013 () Bool)

(assert (=> b!635358 (=> (not res!411013) (not e!363380))))

(assert (=> b!635358 (= res!411013 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18699 lt!293685)))))

(declare-fun b!635359 () Bool)

(assert (=> b!635359 (= e!363380 (arrayContainsKey!0 lt!293685 (select (arr!18335 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89775 (not res!411012)) b!635358))

(assert (= (and b!635358 res!411013) b!635359))

(declare-fun m!609751 () Bool)

(assert (=> d!89775 m!609751))

(assert (=> b!635359 m!609547))

(declare-fun m!609753 () Bool)

(assert (=> b!635359 m!609753))

(assert (=> b!635146 d!89775))

(declare-fun d!89781 () Bool)

(assert (=> d!89781 (arrayContainsKey!0 lt!293685 (select (arr!18335 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293773 () Unit!21434)

(declare-fun choose!114 (array!38213 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21434)

(assert (=> d!89781 (= lt!293773 (choose!114 lt!293685 (select (arr!18335 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

