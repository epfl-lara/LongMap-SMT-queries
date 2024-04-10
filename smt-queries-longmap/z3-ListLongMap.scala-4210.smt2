; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57706 () Bool)

(assert start!57706)

(declare-fun b!638086 () Bool)

(declare-fun e!365112 () Bool)

(declare-fun e!365118 () Bool)

(assert (=> b!638086 (= e!365112 e!365118)))

(declare-fun res!412949 () Bool)

(assert (=> b!638086 (=> (not res!412949) (not e!365118))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38277 0))(
  ( (array!38278 (arr!18361 (Array (_ BitVec 32) (_ BitVec 64))) (size!18725 (_ BitVec 32))) )
))
(declare-fun lt!295070 () array!38277)

(declare-fun a!2986 () array!38277)

(declare-fun arrayContainsKey!0 (array!38277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638086 (= res!412949 (arrayContainsKey!0 lt!295070 (select (arr!18361 a!2986) j!136) j!136))))

(declare-fun b!638087 () Bool)

(declare-fun res!412945 () Bool)

(declare-fun e!365116 () Bool)

(assert (=> b!638087 (=> (not res!412945) (not e!365116))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!638087 (= res!412945 (and (= (size!18725 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18725 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18725 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638088 () Bool)

(declare-fun res!412956 () Bool)

(declare-fun e!365114 () Bool)

(assert (=> b!638088 (=> (not res!412956) (not e!365114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38277 (_ BitVec 32)) Bool)

(assert (=> b!638088 (= res!412956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638089 () Bool)

(declare-fun e!365115 () Bool)

(declare-fun e!365124 () Bool)

(assert (=> b!638089 (= e!365115 e!365124)))

(declare-fun res!412951 () Bool)

(assert (=> b!638089 (=> res!412951 e!365124)))

(declare-fun lt!295066 () (_ BitVec 64))

(declare-fun lt!295069 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!638089 (= res!412951 (or (not (= (select (arr!18361 a!2986) j!136) lt!295066)) (not (= (select (arr!18361 a!2986) j!136) lt!295069)) (bvsge j!136 index!984)))))

(declare-fun e!365119 () Bool)

(assert (=> b!638089 e!365119))

(declare-fun res!412941 () Bool)

(assert (=> b!638089 (=> (not res!412941) (not e!365119))))

(assert (=> b!638089 (= res!412941 (= lt!295069 (select (arr!18361 a!2986) j!136)))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!638089 (= lt!295069 (select (store (arr!18361 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!638090 () Bool)

(declare-datatypes ((Unit!21538 0))(
  ( (Unit!21539) )
))
(declare-fun e!365120 () Unit!21538)

(declare-fun Unit!21540 () Unit!21538)

(assert (=> b!638090 (= e!365120 Unit!21540)))

(assert (=> b!638090 false))

(declare-fun b!638091 () Bool)

(declare-fun res!412950 () Bool)

(assert (=> b!638091 (=> (not res!412950) (not e!365114))))

(declare-datatypes ((List!12402 0))(
  ( (Nil!12399) (Cons!12398 (h!13443 (_ BitVec 64)) (t!18630 List!12402)) )
))
(declare-fun arrayNoDuplicates!0 (array!38277 (_ BitVec 32) List!12402) Bool)

(assert (=> b!638091 (= res!412950 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12399))))

(declare-fun b!638092 () Bool)

(declare-fun res!412958 () Bool)

(assert (=> b!638092 (=> (not res!412958) (not e!365116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638092 (= res!412958 (validKeyInArray!0 (select (arr!18361 a!2986) j!136)))))

(declare-fun b!638093 () Bool)

(declare-fun res!412939 () Bool)

(assert (=> b!638093 (=> (not res!412939) (not e!365116))))

(assert (=> b!638093 (= res!412939 (validKeyInArray!0 k0!1786))))

(declare-fun b!638094 () Bool)

(declare-fun res!412938 () Bool)

(declare-fun e!365123 () Bool)

(assert (=> b!638094 (=> res!412938 e!365123)))

(declare-fun contains!3116 (List!12402 (_ BitVec 64)) Bool)

(assert (=> b!638094 (= res!412938 (contains!3116 Nil!12399 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!638095 () Bool)

(declare-fun Unit!21541 () Unit!21538)

(assert (=> b!638095 (= e!365120 Unit!21541)))

(declare-fun b!638096 () Bool)

(assert (=> b!638096 (= e!365123 true)))

(declare-fun lt!295072 () Bool)

(assert (=> b!638096 (= lt!295072 (contains!3116 Nil!12399 k0!1786))))

(declare-fun b!638097 () Bool)

(assert (=> b!638097 (= e!365118 (arrayContainsKey!0 lt!295070 (select (arr!18361 a!2986) j!136) index!984))))

(declare-fun b!638098 () Bool)

(assert (=> b!638098 (= e!365116 e!365114)))

(declare-fun res!412947 () Bool)

(assert (=> b!638098 (=> (not res!412947) (not e!365114))))

(declare-datatypes ((SeekEntryResult!6801 0))(
  ( (MissingZero!6801 (index!29518 (_ BitVec 32))) (Found!6801 (index!29519 (_ BitVec 32))) (Intermediate!6801 (undefined!7613 Bool) (index!29520 (_ BitVec 32)) (x!58275 (_ BitVec 32))) (Undefined!6801) (MissingVacant!6801 (index!29521 (_ BitVec 32))) )
))
(declare-fun lt!295071 () SeekEntryResult!6801)

(assert (=> b!638098 (= res!412947 (or (= lt!295071 (MissingZero!6801 i!1108)) (= lt!295071 (MissingVacant!6801 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38277 (_ BitVec 32)) SeekEntryResult!6801)

(assert (=> b!638098 (= lt!295071 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!638099 () Bool)

(declare-fun e!365121 () Bool)

(assert (=> b!638099 (= e!365114 e!365121)))

(declare-fun res!412952 () Bool)

(assert (=> b!638099 (=> (not res!412952) (not e!365121))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!638099 (= res!412952 (= (select (store (arr!18361 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638099 (= lt!295070 (array!38278 (store (arr!18361 a!2986) i!1108 k0!1786) (size!18725 a!2986)))))

(declare-fun b!638101 () Bool)

(assert (=> b!638101 (= e!365124 e!365123)))

(declare-fun res!412943 () Bool)

(assert (=> b!638101 (=> res!412943 e!365123)))

(assert (=> b!638101 (= res!412943 (or (bvsge (size!18725 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18725 a!2986))))))

(assert (=> b!638101 (arrayContainsKey!0 lt!295070 (select (arr!18361 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295065 () Unit!21538)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38277 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21538)

(assert (=> b!638101 (= lt!295065 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295070 (select (arr!18361 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638102 () Bool)

(declare-fun res!412948 () Bool)

(assert (=> b!638102 (=> (not res!412948) (not e!365114))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!638102 (= res!412948 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18361 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638103 () Bool)

(declare-fun e!365122 () Bool)

(declare-fun lt!295067 () SeekEntryResult!6801)

(declare-fun lt!295062 () SeekEntryResult!6801)

(assert (=> b!638103 (= e!365122 (= lt!295067 lt!295062))))

(declare-fun b!638104 () Bool)

(assert (=> b!638104 (= e!365119 e!365112)))

(declare-fun res!412954 () Bool)

(assert (=> b!638104 (=> res!412954 e!365112)))

(assert (=> b!638104 (= res!412954 (or (not (= (select (arr!18361 a!2986) j!136) lt!295066)) (not (= (select (arr!18361 a!2986) j!136) lt!295069)) (bvsge j!136 index!984)))))

(declare-fun b!638105 () Bool)

(declare-fun res!412957 () Bool)

(assert (=> b!638105 (=> (not res!412957) (not e!365116))))

(assert (=> b!638105 (= res!412957 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!638106 () Bool)

(declare-fun e!365113 () Bool)

(assert (=> b!638106 (= e!365121 e!365113)))

(declare-fun res!412940 () Bool)

(assert (=> b!638106 (=> (not res!412940) (not e!365113))))

(assert (=> b!638106 (= res!412940 (and (= lt!295067 (Found!6801 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18361 a!2986) index!984) (select (arr!18361 a!2986) j!136))) (not (= (select (arr!18361 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38277 (_ BitVec 32)) SeekEntryResult!6801)

(assert (=> b!638106 (= lt!295067 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18361 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638107 () Bool)

(assert (=> b!638107 (= e!365113 (not e!365115))))

(declare-fun res!412942 () Bool)

(assert (=> b!638107 (=> res!412942 e!365115)))

(declare-fun lt!295063 () SeekEntryResult!6801)

(assert (=> b!638107 (= res!412942 (not (= lt!295063 (Found!6801 index!984))))))

(declare-fun lt!295068 () Unit!21538)

(assert (=> b!638107 (= lt!295068 e!365120)))

(declare-fun c!72941 () Bool)

(assert (=> b!638107 (= c!72941 (= lt!295063 Undefined!6801))))

(assert (=> b!638107 (= lt!295063 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295066 lt!295070 mask!3053))))

(assert (=> b!638107 e!365122))

(declare-fun res!412944 () Bool)

(assert (=> b!638107 (=> (not res!412944) (not e!365122))))

(declare-fun lt!295064 () (_ BitVec 32))

(assert (=> b!638107 (= res!412944 (= lt!295062 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295064 vacantSpotIndex!68 lt!295066 lt!295070 mask!3053)))))

(assert (=> b!638107 (= lt!295062 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295064 vacantSpotIndex!68 (select (arr!18361 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!638107 (= lt!295066 (select (store (arr!18361 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295061 () Unit!21538)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38277 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21538)

(assert (=> b!638107 (= lt!295061 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295064 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638107 (= lt!295064 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!638108 () Bool)

(declare-fun res!412955 () Bool)

(assert (=> b!638108 (=> res!412955 e!365123)))

(assert (=> b!638108 (= res!412955 (contains!3116 Nil!12399 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!412953 () Bool)

(assert (=> start!57706 (=> (not res!412953) (not e!365116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57706 (= res!412953 (validMask!0 mask!3053))))

(assert (=> start!57706 e!365116))

(assert (=> start!57706 true))

(declare-fun array_inv!14157 (array!38277) Bool)

(assert (=> start!57706 (array_inv!14157 a!2986)))

(declare-fun b!638100 () Bool)

(declare-fun res!412946 () Bool)

(assert (=> b!638100 (=> res!412946 e!365123)))

(declare-fun noDuplicate!394 (List!12402) Bool)

(assert (=> b!638100 (= res!412946 (not (noDuplicate!394 Nil!12399)))))

(assert (= (and start!57706 res!412953) b!638087))

(assert (= (and b!638087 res!412945) b!638092))

(assert (= (and b!638092 res!412958) b!638093))

(assert (= (and b!638093 res!412939) b!638105))

(assert (= (and b!638105 res!412957) b!638098))

(assert (= (and b!638098 res!412947) b!638088))

(assert (= (and b!638088 res!412956) b!638091))

(assert (= (and b!638091 res!412950) b!638102))

(assert (= (and b!638102 res!412948) b!638099))

(assert (= (and b!638099 res!412952) b!638106))

(assert (= (and b!638106 res!412940) b!638107))

(assert (= (and b!638107 res!412944) b!638103))

(assert (= (and b!638107 c!72941) b!638090))

(assert (= (and b!638107 (not c!72941)) b!638095))

(assert (= (and b!638107 (not res!412942)) b!638089))

(assert (= (and b!638089 res!412941) b!638104))

(assert (= (and b!638104 (not res!412954)) b!638086))

(assert (= (and b!638086 res!412949) b!638097))

(assert (= (and b!638089 (not res!412951)) b!638101))

(assert (= (and b!638101 (not res!412943)) b!638100))

(assert (= (and b!638100 (not res!412946)) b!638094))

(assert (= (and b!638094 (not res!412938)) b!638108))

(assert (= (and b!638108 (not res!412955)) b!638096))

(declare-fun m!612063 () Bool)

(assert (=> b!638094 m!612063))

(declare-fun m!612065 () Bool)

(assert (=> b!638098 m!612065))

(declare-fun m!612067 () Bool)

(assert (=> b!638096 m!612067))

(declare-fun m!612069 () Bool)

(assert (=> b!638091 m!612069))

(declare-fun m!612071 () Bool)

(assert (=> b!638104 m!612071))

(declare-fun m!612073 () Bool)

(assert (=> b!638108 m!612073))

(assert (=> b!638101 m!612071))

(assert (=> b!638101 m!612071))

(declare-fun m!612075 () Bool)

(assert (=> b!638101 m!612075))

(assert (=> b!638101 m!612071))

(declare-fun m!612077 () Bool)

(assert (=> b!638101 m!612077))

(declare-fun m!612079 () Bool)

(assert (=> b!638093 m!612079))

(declare-fun m!612081 () Bool)

(assert (=> b!638106 m!612081))

(assert (=> b!638106 m!612071))

(assert (=> b!638106 m!612071))

(declare-fun m!612083 () Bool)

(assert (=> b!638106 m!612083))

(declare-fun m!612085 () Bool)

(assert (=> start!57706 m!612085))

(declare-fun m!612087 () Bool)

(assert (=> start!57706 m!612087))

(assert (=> b!638089 m!612071))

(declare-fun m!612089 () Bool)

(assert (=> b!638089 m!612089))

(declare-fun m!612091 () Bool)

(assert (=> b!638089 m!612091))

(assert (=> b!638092 m!612071))

(assert (=> b!638092 m!612071))

(declare-fun m!612093 () Bool)

(assert (=> b!638092 m!612093))

(assert (=> b!638099 m!612089))

(declare-fun m!612095 () Bool)

(assert (=> b!638099 m!612095))

(declare-fun m!612097 () Bool)

(assert (=> b!638088 m!612097))

(declare-fun m!612099 () Bool)

(assert (=> b!638107 m!612099))

(declare-fun m!612101 () Bool)

(assert (=> b!638107 m!612101))

(assert (=> b!638107 m!612071))

(declare-fun m!612103 () Bool)

(assert (=> b!638107 m!612103))

(assert (=> b!638107 m!612071))

(declare-fun m!612105 () Bool)

(assert (=> b!638107 m!612105))

(declare-fun m!612107 () Bool)

(assert (=> b!638107 m!612107))

(declare-fun m!612109 () Bool)

(assert (=> b!638107 m!612109))

(assert (=> b!638107 m!612089))

(declare-fun m!612111 () Bool)

(assert (=> b!638100 m!612111))

(assert (=> b!638086 m!612071))

(assert (=> b!638086 m!612071))

(declare-fun m!612113 () Bool)

(assert (=> b!638086 m!612113))

(declare-fun m!612115 () Bool)

(assert (=> b!638102 m!612115))

(assert (=> b!638097 m!612071))

(assert (=> b!638097 m!612071))

(declare-fun m!612117 () Bool)

(assert (=> b!638097 m!612117))

(declare-fun m!612119 () Bool)

(assert (=> b!638105 m!612119))

(check-sat (not b!638106) (not b!638098) (not b!638094) (not b!638105) (not b!638093) (not b!638107) (not b!638100) (not start!57706) (not b!638101) (not b!638097) (not b!638086) (not b!638108) (not b!638091) (not b!638092) (not b!638088) (not b!638096))
(check-sat)
