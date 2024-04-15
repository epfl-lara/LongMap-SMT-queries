; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56496 () Bool)

(assert start!56496)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!358652 () Bool)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!625978 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37845 0))(
  ( (array!37846 (arr!18164 (Array (_ BitVec 32) (_ BitVec 64))) (size!18529 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37845)

(assert (=> b!625978 (= e!358652 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18164 a!2986) index!984) (select (arr!18164 a!2986) j!136))) (= (select (arr!18164 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625979 () Bool)

(declare-fun res!403966 () Bool)

(assert (=> b!625979 (=> (not res!403966) (not e!358652))))

(declare-datatypes ((List!12244 0))(
  ( (Nil!12241) (Cons!12240 (h!13285 (_ BitVec 64)) (t!18463 List!12244)) )
))
(declare-fun arrayNoDuplicates!0 (array!37845 (_ BitVec 32) List!12244) Bool)

(assert (=> b!625979 (= res!403966 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12241))))

(declare-fun b!625980 () Bool)

(declare-fun e!358651 () Bool)

(assert (=> b!625980 (= e!358651 e!358652)))

(declare-fun res!403968 () Bool)

(assert (=> b!625980 (=> (not res!403968) (not e!358652))))

(declare-datatypes ((SeekEntryResult!6601 0))(
  ( (MissingZero!6601 (index!28688 (_ BitVec 32))) (Found!6601 (index!28689 (_ BitVec 32))) (Intermediate!6601 (undefined!7413 Bool) (index!28690 (_ BitVec 32)) (x!57445 (_ BitVec 32))) (Undefined!6601) (MissingVacant!6601 (index!28691 (_ BitVec 32))) )
))
(declare-fun lt!289783 () SeekEntryResult!6601)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625980 (= res!403968 (or (= lt!289783 (MissingZero!6601 i!1108)) (= lt!289783 (MissingVacant!6601 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37845 (_ BitVec 32)) SeekEntryResult!6601)

(assert (=> b!625980 (= lt!289783 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625981 () Bool)

(declare-fun res!403971 () Bool)

(assert (=> b!625981 (=> (not res!403971) (not e!358652))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!625981 (= res!403971 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18164 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18164 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!403967 () Bool)

(assert (=> start!56496 (=> (not res!403967) (not e!358651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56496 (= res!403967 (validMask!0 mask!3053))))

(assert (=> start!56496 e!358651))

(assert (=> start!56496 true))

(declare-fun array_inv!14047 (array!37845) Bool)

(assert (=> start!56496 (array_inv!14047 a!2986)))

(declare-fun b!625982 () Bool)

(declare-fun res!403970 () Bool)

(assert (=> b!625982 (=> (not res!403970) (not e!358652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37845 (_ BitVec 32)) Bool)

(assert (=> b!625982 (= res!403970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625983 () Bool)

(declare-fun res!403969 () Bool)

(assert (=> b!625983 (=> (not res!403969) (not e!358651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625983 (= res!403969 (validKeyInArray!0 (select (arr!18164 a!2986) j!136)))))

(declare-fun b!625984 () Bool)

(declare-fun res!403972 () Bool)

(assert (=> b!625984 (=> (not res!403972) (not e!358651))))

(assert (=> b!625984 (= res!403972 (validKeyInArray!0 k0!1786))))

(declare-fun b!625985 () Bool)

(declare-fun res!403965 () Bool)

(assert (=> b!625985 (=> (not res!403965) (not e!358652))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37845 (_ BitVec 32)) SeekEntryResult!6601)

(assert (=> b!625985 (= res!403965 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18164 a!2986) j!136) a!2986 mask!3053) (Found!6601 j!136)))))

(declare-fun b!625986 () Bool)

(declare-fun res!403973 () Bool)

(assert (=> b!625986 (=> (not res!403973) (not e!358651))))

(assert (=> b!625986 (= res!403973 (and (= (size!18529 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18529 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18529 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625987 () Bool)

(declare-fun res!403964 () Bool)

(assert (=> b!625987 (=> (not res!403964) (not e!358651))))

(declare-fun arrayContainsKey!0 (array!37845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625987 (= res!403964 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56496 res!403967) b!625986))

(assert (= (and b!625986 res!403973) b!625983))

(assert (= (and b!625983 res!403969) b!625984))

(assert (= (and b!625984 res!403972) b!625987))

(assert (= (and b!625987 res!403964) b!625980))

(assert (= (and b!625980 res!403968) b!625982))

(assert (= (and b!625982 res!403970) b!625979))

(assert (= (and b!625979 res!403966) b!625981))

(assert (= (and b!625981 res!403971) b!625985))

(assert (= (and b!625985 res!403965) b!625978))

(declare-fun m!600949 () Bool)

(assert (=> b!625980 m!600949))

(declare-fun m!600951 () Bool)

(assert (=> b!625984 m!600951))

(declare-fun m!600953 () Bool)

(assert (=> b!625982 m!600953))

(declare-fun m!600955 () Bool)

(assert (=> b!625983 m!600955))

(assert (=> b!625983 m!600955))

(declare-fun m!600957 () Bool)

(assert (=> b!625983 m!600957))

(declare-fun m!600959 () Bool)

(assert (=> b!625981 m!600959))

(declare-fun m!600961 () Bool)

(assert (=> b!625981 m!600961))

(declare-fun m!600963 () Bool)

(assert (=> b!625981 m!600963))

(declare-fun m!600965 () Bool)

(assert (=> b!625979 m!600965))

(assert (=> b!625985 m!600955))

(assert (=> b!625985 m!600955))

(declare-fun m!600967 () Bool)

(assert (=> b!625985 m!600967))

(declare-fun m!600969 () Bool)

(assert (=> b!625978 m!600969))

(assert (=> b!625978 m!600955))

(declare-fun m!600971 () Bool)

(assert (=> b!625987 m!600971))

(declare-fun m!600973 () Bool)

(assert (=> start!56496 m!600973))

(declare-fun m!600975 () Bool)

(assert (=> start!56496 m!600975))

(check-sat (not b!625980) (not b!625983) (not b!625979) (not b!625987) (not b!625985) (not b!625982) (not b!625984) (not start!56496))
(check-sat)
(get-model)

(declare-fun d!88685 () Bool)

(declare-fun res!404038 () Bool)

(declare-fun e!358676 () Bool)

(assert (=> d!88685 (=> res!404038 e!358676)))

(assert (=> d!88685 (= res!404038 (= (select (arr!18164 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88685 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!358676)))

(declare-fun b!626052 () Bool)

(declare-fun e!358677 () Bool)

(assert (=> b!626052 (= e!358676 e!358677)))

(declare-fun res!404039 () Bool)

(assert (=> b!626052 (=> (not res!404039) (not e!358677))))

(assert (=> b!626052 (= res!404039 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18529 a!2986)))))

(declare-fun b!626053 () Bool)

(assert (=> b!626053 (= e!358677 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88685 (not res!404038)) b!626052))

(assert (= (and b!626052 res!404039) b!626053))

(declare-fun m!601033 () Bool)

(assert (=> d!88685 m!601033))

(declare-fun m!601035 () Bool)

(assert (=> b!626053 m!601035))

(assert (=> b!625987 d!88685))

(declare-fun b!626062 () Bool)

(declare-fun e!358684 () Bool)

(declare-fun call!33214 () Bool)

(assert (=> b!626062 (= e!358684 call!33214)))

(declare-fun b!626063 () Bool)

(declare-fun e!358685 () Bool)

(assert (=> b!626063 (= e!358684 e!358685)))

(declare-fun lt!289798 () (_ BitVec 64))

(assert (=> b!626063 (= lt!289798 (select (arr!18164 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21072 0))(
  ( (Unit!21073) )
))
(declare-fun lt!289797 () Unit!21072)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37845 (_ BitVec 64) (_ BitVec 32)) Unit!21072)

(assert (=> b!626063 (= lt!289797 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!289798 #b00000000000000000000000000000000))))

(assert (=> b!626063 (arrayContainsKey!0 a!2986 lt!289798 #b00000000000000000000000000000000)))

(declare-fun lt!289796 () Unit!21072)

(assert (=> b!626063 (= lt!289796 lt!289797)))

(declare-fun res!404045 () Bool)

(assert (=> b!626063 (= res!404045 (= (seekEntryOrOpen!0 (select (arr!18164 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6601 #b00000000000000000000000000000000)))))

(assert (=> b!626063 (=> (not res!404045) (not e!358685))))

(declare-fun bm!33211 () Bool)

(assert (=> bm!33211 (= call!33214 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!626064 () Bool)

(declare-fun e!358686 () Bool)

(assert (=> b!626064 (= e!358686 e!358684)))

(declare-fun c!71376 () Bool)

(assert (=> b!626064 (= c!71376 (validKeyInArray!0 (select (arr!18164 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88687 () Bool)

(declare-fun res!404044 () Bool)

(assert (=> d!88687 (=> res!404044 e!358686)))

(assert (=> d!88687 (= res!404044 (bvsge #b00000000000000000000000000000000 (size!18529 a!2986)))))

(assert (=> d!88687 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!358686)))

(declare-fun b!626065 () Bool)

(assert (=> b!626065 (= e!358685 call!33214)))

(assert (= (and d!88687 (not res!404044)) b!626064))

(assert (= (and b!626064 c!71376) b!626063))

(assert (= (and b!626064 (not c!71376)) b!626062))

(assert (= (and b!626063 res!404045) b!626065))

(assert (= (or b!626065 b!626062) bm!33211))

(assert (=> b!626063 m!601033))

(declare-fun m!601037 () Bool)

(assert (=> b!626063 m!601037))

(declare-fun m!601039 () Bool)

(assert (=> b!626063 m!601039))

(assert (=> b!626063 m!601033))

(declare-fun m!601041 () Bool)

(assert (=> b!626063 m!601041))

(declare-fun m!601043 () Bool)

(assert (=> bm!33211 m!601043))

(assert (=> b!626064 m!601033))

(assert (=> b!626064 m!601033))

(declare-fun m!601045 () Bool)

(assert (=> b!626064 m!601045))

(assert (=> b!625982 d!88687))

(declare-fun d!88689 () Bool)

(assert (=> d!88689 (= (validKeyInArray!0 (select (arr!18164 a!2986) j!136)) (and (not (= (select (arr!18164 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18164 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!625983 d!88689))

(declare-fun d!88691 () Bool)

(assert (=> d!88691 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!625984 d!88691))

(declare-fun b!626076 () Bool)

(declare-fun e!358698 () Bool)

(declare-fun e!358695 () Bool)

(assert (=> b!626076 (= e!358698 e!358695)))

(declare-fun res!404052 () Bool)

(assert (=> b!626076 (=> (not res!404052) (not e!358695))))

(declare-fun e!358696 () Bool)

(assert (=> b!626076 (= res!404052 (not e!358696))))

(declare-fun res!404053 () Bool)

(assert (=> b!626076 (=> (not res!404053) (not e!358696))))

(assert (=> b!626076 (= res!404053 (validKeyInArray!0 (select (arr!18164 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33214 () Bool)

(declare-fun call!33217 () Bool)

(declare-fun c!71379 () Bool)

(assert (=> bm!33214 (= call!33217 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71379 (Cons!12240 (select (arr!18164 a!2986) #b00000000000000000000000000000000) Nil!12241) Nil!12241)))))

(declare-fun b!626077 () Bool)

(declare-fun contains!3064 (List!12244 (_ BitVec 64)) Bool)

(assert (=> b!626077 (= e!358696 (contains!3064 Nil!12241 (select (arr!18164 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!626078 () Bool)

(declare-fun e!358697 () Bool)

(assert (=> b!626078 (= e!358695 e!358697)))

(assert (=> b!626078 (= c!71379 (validKeyInArray!0 (select (arr!18164 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!626079 () Bool)

(assert (=> b!626079 (= e!358697 call!33217)))

(declare-fun d!88693 () Bool)

(declare-fun res!404054 () Bool)

(assert (=> d!88693 (=> res!404054 e!358698)))

(assert (=> d!88693 (= res!404054 (bvsge #b00000000000000000000000000000000 (size!18529 a!2986)))))

(assert (=> d!88693 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12241) e!358698)))

(declare-fun b!626080 () Bool)

(assert (=> b!626080 (= e!358697 call!33217)))

(assert (= (and d!88693 (not res!404054)) b!626076))

(assert (= (and b!626076 res!404053) b!626077))

(assert (= (and b!626076 res!404052) b!626078))

(assert (= (and b!626078 c!71379) b!626080))

(assert (= (and b!626078 (not c!71379)) b!626079))

(assert (= (or b!626080 b!626079) bm!33214))

(assert (=> b!626076 m!601033))

(assert (=> b!626076 m!601033))

(assert (=> b!626076 m!601045))

(assert (=> bm!33214 m!601033))

(declare-fun m!601047 () Bool)

(assert (=> bm!33214 m!601047))

(assert (=> b!626077 m!601033))

(assert (=> b!626077 m!601033))

(declare-fun m!601049 () Bool)

(assert (=> b!626077 m!601049))

(assert (=> b!626078 m!601033))

(assert (=> b!626078 m!601033))

(assert (=> b!626078 m!601045))

(assert (=> b!625979 d!88693))

(declare-fun d!88697 () Bool)

(assert (=> d!88697 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56496 d!88697))

(declare-fun d!88701 () Bool)

(assert (=> d!88701 (= (array_inv!14047 a!2986) (bvsge (size!18529 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56496 d!88701))

(declare-fun b!626134 () Bool)

(declare-fun e!358738 () SeekEntryResult!6601)

(assert (=> b!626134 (= e!358738 (MissingVacant!6601 vacantSpotIndex!68))))

(declare-fun b!626135 () Bool)

(declare-fun c!71395 () Bool)

(declare-fun lt!289818 () (_ BitVec 64))

(assert (=> b!626135 (= c!71395 (= lt!289818 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358740 () SeekEntryResult!6601)

(assert (=> b!626135 (= e!358740 e!358738)))

(declare-fun b!626136 () Bool)

(assert (=> b!626136 (= e!358740 (Found!6601 index!984))))

(declare-fun d!88705 () Bool)

(declare-fun lt!289819 () SeekEntryResult!6601)

(get-info :version)

(assert (=> d!88705 (and (or ((_ is Undefined!6601) lt!289819) (not ((_ is Found!6601) lt!289819)) (and (bvsge (index!28689 lt!289819) #b00000000000000000000000000000000) (bvslt (index!28689 lt!289819) (size!18529 a!2986)))) (or ((_ is Undefined!6601) lt!289819) ((_ is Found!6601) lt!289819) (not ((_ is MissingVacant!6601) lt!289819)) (not (= (index!28691 lt!289819) vacantSpotIndex!68)) (and (bvsge (index!28691 lt!289819) #b00000000000000000000000000000000) (bvslt (index!28691 lt!289819) (size!18529 a!2986)))) (or ((_ is Undefined!6601) lt!289819) (ite ((_ is Found!6601) lt!289819) (= (select (arr!18164 a!2986) (index!28689 lt!289819)) (select (arr!18164 a!2986) j!136)) (and ((_ is MissingVacant!6601) lt!289819) (= (index!28691 lt!289819) vacantSpotIndex!68) (= (select (arr!18164 a!2986) (index!28691 lt!289819)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!358739 () SeekEntryResult!6601)

(assert (=> d!88705 (= lt!289819 e!358739)))

(declare-fun c!71396 () Bool)

(assert (=> d!88705 (= c!71396 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88705 (= lt!289818 (select (arr!18164 a!2986) index!984))))

(assert (=> d!88705 (validMask!0 mask!3053)))

(assert (=> d!88705 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18164 a!2986) j!136) a!2986 mask!3053) lt!289819)))

(declare-fun b!626137 () Bool)

(assert (=> b!626137 (= e!358739 e!358740)))

(declare-fun c!71394 () Bool)

(assert (=> b!626137 (= c!71394 (= lt!289818 (select (arr!18164 a!2986) j!136)))))

(declare-fun b!626138 () Bool)

(assert (=> b!626138 (= e!358739 Undefined!6601)))

(declare-fun b!626139 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!626139 (= e!358738 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18164 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!88705 c!71396) b!626138))

(assert (= (and d!88705 (not c!71396)) b!626137))

(assert (= (and b!626137 c!71394) b!626136))

(assert (= (and b!626137 (not c!71394)) b!626135))

(assert (= (and b!626135 c!71395) b!626134))

(assert (= (and b!626135 (not c!71395)) b!626139))

(declare-fun m!601073 () Bool)

(assert (=> d!88705 m!601073))

(declare-fun m!601075 () Bool)

(assert (=> d!88705 m!601075))

(assert (=> d!88705 m!600969))

(assert (=> d!88705 m!600973))

(declare-fun m!601077 () Bool)

(assert (=> b!626139 m!601077))

(assert (=> b!626139 m!601077))

(assert (=> b!626139 m!600955))

(declare-fun m!601079 () Bool)

(assert (=> b!626139 m!601079))

(assert (=> b!625985 d!88705))

(declare-fun lt!289843 () SeekEntryResult!6601)

(declare-fun e!358774 () SeekEntryResult!6601)

(declare-fun b!626195 () Bool)

(assert (=> b!626195 (= e!358774 (seekKeyOrZeroReturnVacant!0 (x!57445 lt!289843) (index!28690 lt!289843) (index!28690 lt!289843) k0!1786 a!2986 mask!3053))))

(declare-fun b!626196 () Bool)

(declare-fun c!71420 () Bool)

(declare-fun lt!289842 () (_ BitVec 64))

(assert (=> b!626196 (= c!71420 (= lt!289842 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358776 () SeekEntryResult!6601)

(assert (=> b!626196 (= e!358776 e!358774)))

(declare-fun b!626197 () Bool)

(assert (=> b!626197 (= e!358774 (MissingZero!6601 (index!28690 lt!289843)))))

(declare-fun b!626198 () Bool)

(declare-fun e!358775 () SeekEntryResult!6601)

(assert (=> b!626198 (= e!358775 e!358776)))

(assert (=> b!626198 (= lt!289842 (select (arr!18164 a!2986) (index!28690 lt!289843)))))

(declare-fun c!71419 () Bool)

(assert (=> b!626198 (= c!71419 (= lt!289842 k0!1786))))

(declare-fun b!626199 () Bool)

(assert (=> b!626199 (= e!358776 (Found!6601 (index!28690 lt!289843)))))

(declare-fun b!626200 () Bool)

(assert (=> b!626200 (= e!358775 Undefined!6601)))

(declare-fun d!88721 () Bool)

(declare-fun lt!289841 () SeekEntryResult!6601)

(assert (=> d!88721 (and (or ((_ is Undefined!6601) lt!289841) (not ((_ is Found!6601) lt!289841)) (and (bvsge (index!28689 lt!289841) #b00000000000000000000000000000000) (bvslt (index!28689 lt!289841) (size!18529 a!2986)))) (or ((_ is Undefined!6601) lt!289841) ((_ is Found!6601) lt!289841) (not ((_ is MissingZero!6601) lt!289841)) (and (bvsge (index!28688 lt!289841) #b00000000000000000000000000000000) (bvslt (index!28688 lt!289841) (size!18529 a!2986)))) (or ((_ is Undefined!6601) lt!289841) ((_ is Found!6601) lt!289841) ((_ is MissingZero!6601) lt!289841) (not ((_ is MissingVacant!6601) lt!289841)) (and (bvsge (index!28691 lt!289841) #b00000000000000000000000000000000) (bvslt (index!28691 lt!289841) (size!18529 a!2986)))) (or ((_ is Undefined!6601) lt!289841) (ite ((_ is Found!6601) lt!289841) (= (select (arr!18164 a!2986) (index!28689 lt!289841)) k0!1786) (ite ((_ is MissingZero!6601) lt!289841) (= (select (arr!18164 a!2986) (index!28688 lt!289841)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6601) lt!289841) (= (select (arr!18164 a!2986) (index!28691 lt!289841)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88721 (= lt!289841 e!358775)))

(declare-fun c!71421 () Bool)

(assert (=> d!88721 (= c!71421 (and ((_ is Intermediate!6601) lt!289843) (undefined!7413 lt!289843)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37845 (_ BitVec 32)) SeekEntryResult!6601)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88721 (= lt!289843 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88721 (validMask!0 mask!3053)))

(assert (=> d!88721 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!289841)))

(assert (= (and d!88721 c!71421) b!626200))

(assert (= (and d!88721 (not c!71421)) b!626198))

(assert (= (and b!626198 c!71419) b!626199))

(assert (= (and b!626198 (not c!71419)) b!626196))

(assert (= (and b!626196 c!71420) b!626197))

(assert (= (and b!626196 (not c!71420)) b!626195))

(declare-fun m!601093 () Bool)

(assert (=> b!626195 m!601093))

(declare-fun m!601095 () Bool)

(assert (=> b!626198 m!601095))

(declare-fun m!601097 () Bool)

(assert (=> d!88721 m!601097))

(declare-fun m!601099 () Bool)

(assert (=> d!88721 m!601099))

(assert (=> d!88721 m!601099))

(declare-fun m!601101 () Bool)

(assert (=> d!88721 m!601101))

(assert (=> d!88721 m!600973))

(declare-fun m!601103 () Bool)

(assert (=> d!88721 m!601103))

(declare-fun m!601105 () Bool)

(assert (=> d!88721 m!601105))

(assert (=> b!625980 d!88721))

(check-sat (not b!626076) (not b!626063) (not b!626139) (not d!88705) (not bm!33214) (not bm!33211) (not b!626053) (not b!626078) (not b!626195) (not b!626064) (not b!626077) (not d!88721))
(check-sat)
