; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57444 () Bool)

(assert start!57444)

(declare-fun b!635953 () Bool)

(declare-datatypes ((Unit!21470 0))(
  ( (Unit!21471) )
))
(declare-fun e!363772 () Unit!21470)

(declare-fun Unit!21472 () Unit!21470)

(assert (=> b!635953 (= e!363772 Unit!21472)))

(assert (=> b!635953 false))

(declare-fun b!635954 () Bool)

(declare-fun res!411512 () Bool)

(declare-fun e!363765 () Bool)

(assert (=> b!635954 (=> (not res!411512) (not e!363765))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635954 (= res!411512 (validKeyInArray!0 k!1786))))

(declare-fun b!635955 () Bool)

(declare-fun res!411509 () Bool)

(declare-fun e!363776 () Bool)

(assert (=> b!635955 (=> (not res!411509) (not e!363776))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38234 0))(
  ( (array!38235 (arr!18344 (Array (_ BitVec 32) (_ BitVec 64))) (size!18708 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38234)

(assert (=> b!635955 (= res!411509 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18344 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635956 () Bool)

(declare-fun e!363773 () Bool)

(declare-fun e!363767 () Bool)

(assert (=> b!635956 (= e!363773 e!363767)))

(declare-fun res!411502 () Bool)

(assert (=> b!635956 (=> res!411502 e!363767)))

(assert (=> b!635956 (= res!411502 (or (bvsge (size!18708 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18708 a!2986))))))

(declare-fun lt!294090 () array!38234)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635956 (arrayContainsKey!0 lt!294090 (select (arr!18344 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294098 () Unit!21470)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38234 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21470)

(assert (=> b!635956 (= lt!294098 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294090 (select (arr!18344 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!635957 () Bool)

(declare-fun e!363766 () Bool)

(assert (=> b!635957 (= e!363776 e!363766)))

(declare-fun res!411510 () Bool)

(assert (=> b!635957 (=> (not res!411510) (not e!363766))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!635957 (= res!411510 (= (select (store (arr!18344 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!635957 (= lt!294090 (array!38235 (store (arr!18344 a!2986) i!1108 k!1786) (size!18708 a!2986)))))

(declare-fun res!411517 () Bool)

(assert (=> start!57444 (=> (not res!411517) (not e!363765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57444 (= res!411517 (validMask!0 mask!3053))))

(assert (=> start!57444 e!363765))

(assert (=> start!57444 true))

(declare-fun array_inv!14140 (array!38234) Bool)

(assert (=> start!57444 (array_inv!14140 a!2986)))

(declare-fun e!363771 () Bool)

(declare-fun b!635958 () Bool)

(assert (=> b!635958 (= e!363771 (arrayContainsKey!0 lt!294090 (select (arr!18344 a!2986) j!136) index!984))))

(declare-fun b!635959 () Bool)

(declare-datatypes ((List!12385 0))(
  ( (Nil!12382) (Cons!12381 (h!13426 (_ BitVec 64)) (t!18613 List!12385)) )
))
(declare-fun noDuplicate!377 (List!12385) Bool)

(assert (=> b!635959 (= e!363767 (noDuplicate!377 Nil!12382))))

(declare-fun b!635960 () Bool)

(declare-fun Unit!21473 () Unit!21470)

(assert (=> b!635960 (= e!363772 Unit!21473)))

(declare-fun b!635961 () Bool)

(assert (=> b!635961 (= e!363765 e!363776)))

(declare-fun res!411515 () Bool)

(assert (=> b!635961 (=> (not res!411515) (not e!363776))))

(declare-datatypes ((SeekEntryResult!6784 0))(
  ( (MissingZero!6784 (index!29441 (_ BitVec 32))) (Found!6784 (index!29442 (_ BitVec 32))) (Intermediate!6784 (undefined!7596 Bool) (index!29443 (_ BitVec 32)) (x!58183 (_ BitVec 32))) (Undefined!6784) (MissingVacant!6784 (index!29444 (_ BitVec 32))) )
))
(declare-fun lt!294094 () SeekEntryResult!6784)

(assert (=> b!635961 (= res!411515 (or (= lt!294094 (MissingZero!6784 i!1108)) (= lt!294094 (MissingVacant!6784 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38234 (_ BitVec 32)) SeekEntryResult!6784)

(assert (=> b!635961 (= lt!294094 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!635962 () Bool)

(declare-fun e!363774 () Bool)

(declare-fun lt!294095 () SeekEntryResult!6784)

(declare-fun lt!294091 () SeekEntryResult!6784)

(assert (=> b!635962 (= e!363774 (= lt!294095 lt!294091))))

(declare-fun b!635963 () Bool)

(declare-fun res!411507 () Bool)

(assert (=> b!635963 (=> (not res!411507) (not e!363776))))

(declare-fun arrayNoDuplicates!0 (array!38234 (_ BitVec 32) List!12385) Bool)

(assert (=> b!635963 (= res!411507 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12382))))

(declare-fun b!635964 () Bool)

(declare-fun res!411505 () Bool)

(assert (=> b!635964 (=> (not res!411505) (not e!363776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38234 (_ BitVec 32)) Bool)

(assert (=> b!635964 (= res!411505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!635965 () Bool)

(declare-fun e!363768 () Bool)

(declare-fun e!363769 () Bool)

(assert (=> b!635965 (= e!363768 e!363769)))

(declare-fun res!411501 () Bool)

(assert (=> b!635965 (=> res!411501 e!363769)))

(declare-fun lt!294096 () (_ BitVec 64))

(declare-fun lt!294100 () (_ BitVec 64))

(assert (=> b!635965 (= res!411501 (or (not (= (select (arr!18344 a!2986) j!136) lt!294096)) (not (= (select (arr!18344 a!2986) j!136) lt!294100)) (bvsge j!136 index!984)))))

(declare-fun b!635966 () Bool)

(declare-fun res!411514 () Bool)

(assert (=> b!635966 (=> (not res!411514) (not e!363765))))

(assert (=> b!635966 (= res!411514 (and (= (size!18708 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18708 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18708 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!635967 () Bool)

(declare-fun e!363775 () Bool)

(declare-fun e!363777 () Bool)

(assert (=> b!635967 (= e!363775 (not e!363777))))

(declare-fun res!411503 () Bool)

(assert (=> b!635967 (=> res!411503 e!363777)))

(declare-fun lt!294092 () SeekEntryResult!6784)

(assert (=> b!635967 (= res!411503 (not (= lt!294092 (Found!6784 index!984))))))

(declare-fun lt!294093 () Unit!21470)

(assert (=> b!635967 (= lt!294093 e!363772)))

(declare-fun c!72593 () Bool)

(assert (=> b!635967 (= c!72593 (= lt!294092 Undefined!6784))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38234 (_ BitVec 32)) SeekEntryResult!6784)

(assert (=> b!635967 (= lt!294092 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294096 lt!294090 mask!3053))))

(assert (=> b!635967 e!363774))

(declare-fun res!411516 () Bool)

(assert (=> b!635967 (=> (not res!411516) (not e!363774))))

(declare-fun lt!294099 () (_ BitVec 32))

(assert (=> b!635967 (= res!411516 (= lt!294091 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294099 vacantSpotIndex!68 lt!294096 lt!294090 mask!3053)))))

(assert (=> b!635967 (= lt!294091 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294099 vacantSpotIndex!68 (select (arr!18344 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!635967 (= lt!294096 (select (store (arr!18344 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!294097 () Unit!21470)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38234 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21470)

(assert (=> b!635967 (= lt!294097 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294099 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635967 (= lt!294099 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!635968 () Bool)

(declare-fun res!411508 () Bool)

(assert (=> b!635968 (=> (not res!411508) (not e!363765))))

(assert (=> b!635968 (= res!411508 (validKeyInArray!0 (select (arr!18344 a!2986) j!136)))))

(declare-fun b!635969 () Bool)

(assert (=> b!635969 (= e!363777 e!363773)))

(declare-fun res!411518 () Bool)

(assert (=> b!635969 (=> res!411518 e!363773)))

(assert (=> b!635969 (= res!411518 (or (not (= (select (arr!18344 a!2986) j!136) lt!294096)) (not (= (select (arr!18344 a!2986) j!136) lt!294100)) (bvsge j!136 index!984)))))

(assert (=> b!635969 e!363768))

(declare-fun res!411513 () Bool)

(assert (=> b!635969 (=> (not res!411513) (not e!363768))))

(assert (=> b!635969 (= res!411513 (= lt!294100 (select (arr!18344 a!2986) j!136)))))

(assert (=> b!635969 (= lt!294100 (select (store (arr!18344 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!635970 () Bool)

(assert (=> b!635970 (= e!363766 e!363775)))

(declare-fun res!411504 () Bool)

(assert (=> b!635970 (=> (not res!411504) (not e!363775))))

(assert (=> b!635970 (= res!411504 (and (= lt!294095 (Found!6784 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18344 a!2986) index!984) (select (arr!18344 a!2986) j!136))) (not (= (select (arr!18344 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!635970 (= lt!294095 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18344 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635971 () Bool)

(assert (=> b!635971 (= e!363769 e!363771)))

(declare-fun res!411506 () Bool)

(assert (=> b!635971 (=> (not res!411506) (not e!363771))))

(assert (=> b!635971 (= res!411506 (arrayContainsKey!0 lt!294090 (select (arr!18344 a!2986) j!136) j!136))))

(declare-fun b!635972 () Bool)

(declare-fun res!411511 () Bool)

(assert (=> b!635972 (=> (not res!411511) (not e!363765))))

(assert (=> b!635972 (= res!411511 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!57444 res!411517) b!635966))

(assert (= (and b!635966 res!411514) b!635968))

(assert (= (and b!635968 res!411508) b!635954))

(assert (= (and b!635954 res!411512) b!635972))

(assert (= (and b!635972 res!411511) b!635961))

(assert (= (and b!635961 res!411515) b!635964))

(assert (= (and b!635964 res!411505) b!635963))

(assert (= (and b!635963 res!411507) b!635955))

(assert (= (and b!635955 res!411509) b!635957))

(assert (= (and b!635957 res!411510) b!635970))

(assert (= (and b!635970 res!411504) b!635967))

(assert (= (and b!635967 res!411516) b!635962))

(assert (= (and b!635967 c!72593) b!635953))

(assert (= (and b!635967 (not c!72593)) b!635960))

(assert (= (and b!635967 (not res!411503)) b!635969))

(assert (= (and b!635969 res!411513) b!635965))

(assert (= (and b!635965 (not res!411501)) b!635971))

(assert (= (and b!635971 res!411506) b!635958))

(assert (= (and b!635969 (not res!411518)) b!635956))

(assert (= (and b!635956 (not res!411502)) b!635959))

(declare-fun m!610243 () Bool)

(assert (=> b!635972 m!610243))

(declare-fun m!610245 () Bool)

(assert (=> b!635957 m!610245))

(declare-fun m!610247 () Bool)

(assert (=> b!635957 m!610247))

(declare-fun m!610249 () Bool)

(assert (=> b!635969 m!610249))

(assert (=> b!635969 m!610245))

(declare-fun m!610251 () Bool)

(assert (=> b!635969 m!610251))

(assert (=> b!635968 m!610249))

(assert (=> b!635968 m!610249))

(declare-fun m!610253 () Bool)

(assert (=> b!635968 m!610253))

(declare-fun m!610255 () Bool)

(assert (=> b!635970 m!610255))

(assert (=> b!635970 m!610249))

(assert (=> b!635970 m!610249))

(declare-fun m!610257 () Bool)

(assert (=> b!635970 m!610257))

(declare-fun m!610259 () Bool)

(assert (=> start!57444 m!610259))

(declare-fun m!610261 () Bool)

(assert (=> start!57444 m!610261))

(assert (=> b!635958 m!610249))

(assert (=> b!635958 m!610249))

(declare-fun m!610263 () Bool)

(assert (=> b!635958 m!610263))

(declare-fun m!610265 () Bool)

(assert (=> b!635959 m!610265))

(declare-fun m!610267 () Bool)

(assert (=> b!635963 m!610267))

(declare-fun m!610269 () Bool)

(assert (=> b!635955 m!610269))

(declare-fun m!610271 () Bool)

(assert (=> b!635961 m!610271))

(declare-fun m!610273 () Bool)

(assert (=> b!635967 m!610273))

(declare-fun m!610275 () Bool)

(assert (=> b!635967 m!610275))

(assert (=> b!635967 m!610249))

(assert (=> b!635967 m!610245))

(declare-fun m!610277 () Bool)

(assert (=> b!635967 m!610277))

(declare-fun m!610279 () Bool)

(assert (=> b!635967 m!610279))

(assert (=> b!635967 m!610249))

(declare-fun m!610281 () Bool)

(assert (=> b!635967 m!610281))

(declare-fun m!610283 () Bool)

(assert (=> b!635967 m!610283))

(assert (=> b!635971 m!610249))

(assert (=> b!635971 m!610249))

(declare-fun m!610285 () Bool)

(assert (=> b!635971 m!610285))

(declare-fun m!610287 () Bool)

(assert (=> b!635954 m!610287))

(assert (=> b!635956 m!610249))

(assert (=> b!635956 m!610249))

(declare-fun m!610289 () Bool)

(assert (=> b!635956 m!610289))

(assert (=> b!635956 m!610249))

(declare-fun m!610291 () Bool)

(assert (=> b!635956 m!610291))

(assert (=> b!635965 m!610249))

(declare-fun m!610293 () Bool)

(assert (=> b!635964 m!610293))

(push 1)

(assert (not b!635958))

(assert (not b!635964))

(assert (not b!635970))

(assert (not b!635954))

(assert (not b!635967))

(assert (not b!635963))

(assert (not b!635956))

(assert (not b!635972))

(assert (not start!57444))

(assert (not b!635959))

(assert (not b!635968))

(assert (not b!635971))

(assert (not b!635961))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!636069 () Bool)

(declare-fun lt!294142 () SeekEntryResult!6784)

(declare-fun e!363844 () SeekEntryResult!6784)

(assert (=> b!636069 (= e!363844 (seekKeyOrZeroReturnVacant!0 (x!58183 lt!294142) (index!29443 lt!294142) (index!29443 lt!294142) k!1786 a!2986 mask!3053))))

(declare-fun b!636070 () Bool)

(declare-fun e!363845 () SeekEntryResult!6784)

(assert (=> b!636070 (= e!363845 Undefined!6784)))

(declare-fun b!636071 () Bool)

(declare-fun c!72624 () Bool)

(declare-fun lt!294140 () (_ BitVec 64))

(assert (=> b!636071 (= c!72624 (= lt!294140 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363846 () SeekEntryResult!6784)

(assert (=> b!636071 (= e!363846 e!363844)))

(declare-fun b!636072 () Bool)

(assert (=> b!636072 (= e!363845 e!363846)))

(assert (=> b!636072 (= lt!294140 (select (arr!18344 a!2986) (index!29443 lt!294142)))))

(declare-fun c!72626 () Bool)

(assert (=> b!636072 (= c!72626 (= lt!294140 k!1786))))

(declare-fun d!89847 () Bool)

(declare-fun lt!294141 () SeekEntryResult!6784)

(assert (=> d!89847 (and (or (is-Undefined!6784 lt!294141) (not (is-Found!6784 lt!294141)) (and (bvsge (index!29442 lt!294141) #b00000000000000000000000000000000) (bvslt (index!29442 lt!294141) (size!18708 a!2986)))) (or (is-Undefined!6784 lt!294141) (is-Found!6784 lt!294141) (not (is-MissingZero!6784 lt!294141)) (and (bvsge (index!29441 lt!294141) #b00000000000000000000000000000000) (bvslt (index!29441 lt!294141) (size!18708 a!2986)))) (or (is-Undefined!6784 lt!294141) (is-Found!6784 lt!294141) (is-MissingZero!6784 lt!294141) (not (is-MissingVacant!6784 lt!294141)) (and (bvsge (index!29444 lt!294141) #b00000000000000000000000000000000) (bvslt (index!29444 lt!294141) (size!18708 a!2986)))) (or (is-Undefined!6784 lt!294141) (ite (is-Found!6784 lt!294141) (= (select (arr!18344 a!2986) (index!29442 lt!294141)) k!1786) (ite (is-MissingZero!6784 lt!294141) (= (select (arr!18344 a!2986) (index!29441 lt!294141)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6784 lt!294141) (= (select (arr!18344 a!2986) (index!29444 lt!294141)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89847 (= lt!294141 e!363845)))

(declare-fun c!72625 () Bool)

(assert (=> d!89847 (= c!72625 (and (is-Intermediate!6784 lt!294142) (undefined!7596 lt!294142)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38234 (_ BitVec 32)) SeekEntryResult!6784)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89847 (= lt!294142 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!89847 (validMask!0 mask!3053)))

(assert (=> d!89847 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!294141)))

(declare-fun b!636073 () Bool)

(assert (=> b!636073 (= e!363844 (MissingZero!6784 (index!29443 lt!294142)))))

(declare-fun b!636074 () Bool)

(assert (=> b!636074 (= e!363846 (Found!6784 (index!29443 lt!294142)))))

(assert (= (and d!89847 c!72625) b!636070))

(assert (= (and d!89847 (not c!72625)) b!636072))

(assert (= (and b!636072 c!72626) b!636074))

(assert (= (and b!636072 (not c!72626)) b!636071))

(assert (= (and b!636071 c!72624) b!636073))

(assert (= (and b!636071 (not c!72624)) b!636069))

(declare-fun m!610373 () Bool)

(assert (=> b!636069 m!610373))

(declare-fun m!610375 () Bool)

(assert (=> b!636072 m!610375))

(declare-fun m!610377 () Bool)

(assert (=> d!89847 m!610377))

(assert (=> d!89847 m!610259))

(declare-fun m!610379 () Bool)

(assert (=> d!89847 m!610379))

(declare-fun m!610381 () Bool)

(assert (=> d!89847 m!610381))

(declare-fun m!610383 () Bool)

(assert (=> d!89847 m!610383))

(assert (=> d!89847 m!610381))

(declare-fun m!610385 () Bool)

(assert (=> d!89847 m!610385))

(assert (=> b!635961 d!89847))

(declare-fun d!89869 () Bool)

(declare-fun res!411559 () Bool)

(declare-fun e!363851 () Bool)

(assert (=> d!89869 (=> res!411559 e!363851)))

(assert (=> d!89869 (= res!411559 (= (select (arr!18344 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!89869 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!363851)))

(declare-fun b!636079 () Bool)

(declare-fun e!363852 () Bool)

(assert (=> b!636079 (= e!363851 e!363852)))

(declare-fun res!411560 () Bool)

(assert (=> b!636079 (=> (not res!411560) (not e!363852))))

(assert (=> b!636079 (= res!411560 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18708 a!2986)))))

(declare-fun b!636080 () Bool)

(assert (=> b!636080 (= e!363852 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89869 (not res!411559)) b!636079))

(assert (= (and b!636079 res!411560) b!636080))

(declare-fun m!610387 () Bool)

(assert (=> d!89869 m!610387))

(declare-fun m!610389 () Bool)

(assert (=> b!636080 m!610389))

(assert (=> b!635972 d!89869))

(declare-fun d!89871 () Bool)

(declare-fun res!411561 () Bool)

(declare-fun e!363853 () Bool)

(assert (=> d!89871 (=> res!411561 e!363853)))

(assert (=> d!89871 (= res!411561 (= (select (arr!18344 lt!294090) j!136) (select (arr!18344 a!2986) j!136)))))

(assert (=> d!89871 (= (arrayContainsKey!0 lt!294090 (select (arr!18344 a!2986) j!136) j!136) e!363853)))

(declare-fun b!636081 () Bool)

(declare-fun e!363854 () Bool)

(assert (=> b!636081 (= e!363853 e!363854)))

(declare-fun res!411562 () Bool)

(assert (=> b!636081 (=> (not res!411562) (not e!363854))))

(assert (=> b!636081 (= res!411562 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18708 lt!294090)))))

(declare-fun b!636082 () Bool)

(assert (=> b!636082 (= e!363854 (arrayContainsKey!0 lt!294090 (select (arr!18344 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89871 (not res!411561)) b!636081))

(assert (= (and b!636081 res!411562) b!636082))

(declare-fun m!610391 () Bool)

(assert (=> d!89871 m!610391))

(assert (=> b!636082 m!610249))

(declare-fun m!610393 () Bool)

(assert (=> b!636082 m!610393))

(assert (=> b!635971 d!89871))

(declare-fun d!89873 () Bool)

(declare-fun res!411571 () Bool)

(declare-fun e!363867 () Bool)

(assert (=> d!89873 (=> res!411571 e!363867)))

(assert (=> d!89873 (= res!411571 (is-Nil!12382 Nil!12382))))

(assert (=> d!89873 (= (noDuplicate!377 Nil!12382) e!363867)))

(declare-fun b!636099 () Bool)

(declare-fun e!363868 () Bool)

(assert (=> b!636099 (= e!363867 e!363868)))

(declare-fun res!411572 () Bool)

(assert (=> b!636099 (=> (not res!411572) (not e!363868))))

(declare-fun contains!3098 (List!12385 (_ BitVec 64)) Bool)

(assert (=> b!636099 (= res!411572 (not (contains!3098 (t!18613 Nil!12382) (h!13426 Nil!12382))))))

(declare-fun b!636100 () Bool)

(assert (=> b!636100 (= e!363868 (noDuplicate!377 (t!18613 Nil!12382)))))

(assert (= (and d!89873 (not res!411571)) b!636099))

(assert (= (and b!636099 res!411572) b!636100))

(declare-fun m!610401 () Bool)

(assert (=> b!636099 m!610401))

(declare-fun m!610403 () Bool)

(assert (=> b!636100 m!610403))

(assert (=> b!635959 d!89873))

(declare-fun b!636149 () Bool)

(declare-fun e!363898 () SeekEntryResult!6784)

(assert (=> b!636149 (= e!363898 (MissingVacant!6784 vacantSpotIndex!68))))

(declare-fun b!636150 () Bool)

(assert (=> b!636150 (= e!363898 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18344 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636151 () Bool)

(declare-fun c!72651 () Bool)

(declare-fun lt!294169 () (_ BitVec 64))

(assert (=> b!636151 (= c!72651 (= lt!294169 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363899 () SeekEntryResult!6784)

(assert (=> b!636151 (= e!363899 e!363898)))

(declare-fun b!636152 () Bool)

(assert (=> b!636152 (= e!363899 (Found!6784 index!984))))

(declare-fun d!89885 () Bool)

(declare-fun lt!294168 () SeekEntryResult!6784)

(assert (=> d!89885 (and (or (is-Undefined!6784 lt!294168) (not (is-Found!6784 lt!294168)) (and (bvsge (index!29442 lt!294168) #b00000000000000000000000000000000) (bvslt (index!29442 lt!294168) (size!18708 a!2986)))) (or (is-Undefined!6784 lt!294168) (is-Found!6784 lt!294168) (not (is-MissingVacant!6784 lt!294168)) (not (= (index!29444 lt!294168) vacantSpotIndex!68)) (and (bvsge (index!29444 lt!294168) #b00000000000000000000000000000000) (bvslt (index!29444 lt!294168) (size!18708 a!2986)))) (or (is-Undefined!6784 lt!294168) (ite (is-Found!6784 lt!294168) (= (select (arr!18344 a!2986) (index!29442 lt!294168)) (select (arr!18344 a!2986) j!136)) (and (is-MissingVacant!6784 lt!294168) (= (index!29444 lt!294168) vacantSpotIndex!68) (= (select (arr!18344 a!2986) (index!29444 lt!294168)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!363900 () SeekEntryResult!6784)

(assert (=> d!89885 (= lt!294168 e!363900)))

(declare-fun c!72650 () Bool)

(assert (=> d!89885 (= c!72650 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89885 (= lt!294169 (select (arr!18344 a!2986) index!984))))

(assert (=> d!89885 (validMask!0 mask!3053)))

(assert (=> d!89885 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18344 a!2986) j!136) a!2986 mask!3053) lt!294168)))

(declare-fun b!636153 () Bool)

(assert (=> b!636153 (= e!363900 e!363899)))

(declare-fun c!72652 () Bool)

(assert (=> b!636153 (= c!72652 (= lt!294169 (select (arr!18344 a!2986) j!136)))))

(declare-fun b!636154 () Bool)

(assert (=> b!636154 (= e!363900 Undefined!6784)))

(assert (= (and d!89885 c!72650) b!636154))

(assert (= (and d!89885 (not c!72650)) b!636153))

(assert (= (and b!636153 c!72652) b!636152))

(assert (= (and b!636153 (not c!72652)) b!636151))

(assert (= (and b!636151 c!72651) b!636149))

(assert (= (and b!636151 (not c!72651)) b!636150))

(assert (=> b!636150 m!610273))

(assert (=> b!636150 m!610273))

(assert (=> b!636150 m!610249))

(declare-fun m!610423 () Bool)

(assert (=> b!636150 m!610423))

(declare-fun m!610425 () Bool)

(assert (=> d!89885 m!610425))

(declare-fun m!610427 () Bool)

(assert (=> d!89885 m!610427))

(assert (=> d!89885 m!610255))

(assert (=> d!89885 m!610259))

(assert (=> b!635970 d!89885))

(declare-fun d!89891 () Bool)

(declare-fun res!411585 () Bool)

(declare-fun e!363904 () Bool)

(assert (=> d!89891 (=> res!411585 e!363904)))

(assert (=> d!89891 (= res!411585 (= (select (arr!18344 lt!294090) index!984) (select (arr!18344 a!2986) j!136)))))

(assert (=> d!89891 (= (arrayContainsKey!0 lt!294090 (select (arr!18344 a!2986) j!136) index!984) e!363904)))

(declare-fun b!636159 () Bool)

(declare-fun e!363905 () Bool)

(assert (=> b!636159 (= e!363904 e!363905)))

(declare-fun res!411586 () Bool)

(assert (=> b!636159 (=> (not res!411586) (not e!363905))))

(assert (=> b!636159 (= res!411586 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18708 lt!294090)))))

(declare-fun b!636160 () Bool)

(assert (=> b!636160 (= e!363905 (arrayContainsKey!0 lt!294090 (select (arr!18344 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!89891 (not res!411585)) b!636159))

(assert (= (and b!636159 res!411586) b!636160))

(declare-fun m!610429 () Bool)

(assert (=> d!89891 m!610429))

(assert (=> b!636160 m!610249))

(declare-fun m!610431 () Bool)

(assert (=> b!636160 m!610431))

(assert (=> b!635958 d!89891))

(declare-fun d!89893 () Bool)

(assert (=> d!89893 (= (validKeyInArray!0 (select (arr!18344 a!2986) j!136)) (and (not (= (select (arr!18344 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18344 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!635968 d!89893))

(declare-fun b!636161 () Bool)

(declare-fun e!363906 () SeekEntryResult!6784)

(assert (=> b!636161 (= e!363906 (MissingVacant!6784 vacantSpotIndex!68))))

(declare-fun b!636162 () Bool)

(assert (=> b!636162 (= e!363906 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!294096 lt!294090 mask!3053))))

(declare-fun b!636163 () Bool)

(declare-fun c!72655 () Bool)

