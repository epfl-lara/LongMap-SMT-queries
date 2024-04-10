; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59096 () Bool)

(assert start!59096)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!374158 () Bool)

(declare-datatypes ((array!38596 0))(
  ( (array!38597 (arr!18501 (Array (_ BitVec 32) (_ BitVec 64))) (size!18865 (_ BitVec 32))) )
))
(declare-fun lt!303231 () array!38596)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38596)

(declare-fun b!651949 () Bool)

(declare-fun arrayContainsKey!0 (array!38596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!651949 (= e!374158 (arrayContainsKey!0 lt!303231 (select (arr!18501 a!2986) j!136) index!984))))

(declare-fun b!651950 () Bool)

(declare-fun e!374163 () Bool)

(declare-fun e!374156 () Bool)

(assert (=> b!651950 (= e!374163 e!374156)))

(declare-fun res!422716 () Bool)

(assert (=> b!651950 (=> (not res!422716) (not e!374156))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!651950 (= res!422716 (= (select (store (arr!18501 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651950 (= lt!303231 (array!38597 (store (arr!18501 a!2986) i!1108 k!1786) (size!18865 a!2986)))))

(declare-fun b!651951 () Bool)

(declare-datatypes ((Unit!22272 0))(
  ( (Unit!22273) )
))
(declare-fun e!374161 () Unit!22272)

(declare-fun Unit!22274 () Unit!22272)

(assert (=> b!651951 (= e!374161 Unit!22274)))

(assert (=> b!651951 false))

(declare-fun b!651952 () Bool)

(declare-fun res!422708 () Bool)

(declare-fun e!374152 () Bool)

(assert (=> b!651952 (=> (not res!422708) (not e!374152))))

(assert (=> b!651952 (= res!422708 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!651953 () Bool)

(declare-fun e!374159 () Bool)

(assert (=> b!651953 (= e!374159 true)))

(declare-datatypes ((List!12542 0))(
  ( (Nil!12539) (Cons!12538 (h!13583 (_ BitVec 64)) (t!18770 List!12542)) )
))
(declare-fun arrayNoDuplicates!0 (array!38596 (_ BitVec 32) List!12542) Bool)

(assert (=> b!651953 (arrayNoDuplicates!0 lt!303231 index!984 Nil!12539)))

(declare-fun lt!303232 () Unit!22272)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38596 (_ BitVec 32) (_ BitVec 32)) Unit!22272)

(assert (=> b!651953 (= lt!303232 (lemmaNoDuplicateFromThenFromBigger!0 lt!303231 #b00000000000000000000000000000000 index!984))))

(assert (=> b!651953 (arrayNoDuplicates!0 lt!303231 #b00000000000000000000000000000000 Nil!12539)))

(declare-fun lt!303233 () Unit!22272)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38596 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12542) Unit!22272)

(assert (=> b!651953 (= lt!303233 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12539))))

(assert (=> b!651953 (arrayContainsKey!0 lt!303231 (select (arr!18501 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303241 () Unit!22272)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38596 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22272)

(assert (=> b!651953 (= lt!303241 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303231 (select (arr!18501 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!651953 e!374158))

(declare-fun res!422717 () Bool)

(assert (=> b!651953 (=> (not res!422717) (not e!374158))))

(assert (=> b!651953 (= res!422717 (arrayContainsKey!0 lt!303231 (select (arr!18501 a!2986) j!136) j!136))))

(declare-fun b!651954 () Bool)

(declare-fun res!422712 () Bool)

(assert (=> b!651954 (=> (not res!422712) (not e!374163))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!651954 (= res!422712 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18501 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!651955 () Bool)

(declare-fun res!422705 () Bool)

(assert (=> b!651955 (=> (not res!422705) (not e!374152))))

(assert (=> b!651955 (= res!422705 (and (= (size!18865 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18865 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18865 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!651956 () Bool)

(declare-fun e!374155 () Unit!22272)

(declare-fun Unit!22275 () Unit!22272)

(assert (=> b!651956 (= e!374155 Unit!22275)))

(declare-fun lt!303235 () Unit!22272)

(assert (=> b!651956 (= lt!303235 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303231 (select (arr!18501 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!651956 (arrayContainsKey!0 lt!303231 (select (arr!18501 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303236 () Unit!22272)

(assert (=> b!651956 (= lt!303236 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12539))))

(assert (=> b!651956 (arrayNoDuplicates!0 lt!303231 #b00000000000000000000000000000000 Nil!12539)))

(declare-fun lt!303226 () Unit!22272)

(assert (=> b!651956 (= lt!303226 (lemmaNoDuplicateFromThenFromBigger!0 lt!303231 #b00000000000000000000000000000000 j!136))))

(assert (=> b!651956 (arrayNoDuplicates!0 lt!303231 j!136 Nil!12539)))

(declare-fun lt!303238 () Unit!22272)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38596 (_ BitVec 64) (_ BitVec 32) List!12542) Unit!22272)

(assert (=> b!651956 (= lt!303238 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303231 (select (arr!18501 a!2986) j!136) j!136 Nil!12539))))

(assert (=> b!651956 false))

(declare-fun res!422719 () Bool)

(assert (=> start!59096 (=> (not res!422719) (not e!374152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59096 (= res!422719 (validMask!0 mask!3053))))

(assert (=> start!59096 e!374152))

(assert (=> start!59096 true))

(declare-fun array_inv!14297 (array!38596) Bool)

(assert (=> start!59096 (array_inv!14297 a!2986)))

(declare-fun b!651957 () Bool)

(declare-fun e!374154 () Bool)

(declare-fun e!374153 () Bool)

(assert (=> b!651957 (= e!374154 e!374153)))

(declare-fun res!422720 () Bool)

(assert (=> b!651957 (=> res!422720 e!374153)))

(declare-fun lt!303234 () (_ BitVec 64))

(declare-fun lt!303240 () (_ BitVec 64))

(assert (=> b!651957 (= res!422720 (or (not (= (select (arr!18501 a!2986) j!136) lt!303240)) (not (= (select (arr!18501 a!2986) j!136) lt!303234)) (bvsge j!136 index!984)))))

(declare-fun b!651958 () Bool)

(declare-fun e!374157 () Bool)

(declare-datatypes ((SeekEntryResult!6941 0))(
  ( (MissingZero!6941 (index!30117 (_ BitVec 32))) (Found!6941 (index!30118 (_ BitVec 32))) (Intermediate!6941 (undefined!7753 Bool) (index!30119 (_ BitVec 32)) (x!58908 (_ BitVec 32))) (Undefined!6941) (MissingVacant!6941 (index!30120 (_ BitVec 32))) )
))
(declare-fun lt!303225 () SeekEntryResult!6941)

(declare-fun lt!303229 () SeekEntryResult!6941)

(assert (=> b!651958 (= e!374157 (= lt!303225 lt!303229))))

(declare-fun b!651959 () Bool)

(declare-fun res!422723 () Bool)

(assert (=> b!651959 (=> (not res!422723) (not e!374163))))

(assert (=> b!651959 (= res!422723 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12539))))

(declare-fun b!651960 () Bool)

(declare-fun e!374162 () Bool)

(assert (=> b!651960 (= e!374162 e!374159)))

(declare-fun res!422710 () Bool)

(assert (=> b!651960 (=> res!422710 e!374159)))

(assert (=> b!651960 (= res!422710 (bvsge index!984 j!136))))

(declare-fun lt!303237 () Unit!22272)

(assert (=> b!651960 (= lt!303237 e!374155)))

(declare-fun c!74989 () Bool)

(assert (=> b!651960 (= c!74989 (bvslt j!136 index!984))))

(declare-fun b!651961 () Bool)

(declare-fun Unit!22276 () Unit!22272)

(assert (=> b!651961 (= e!374161 Unit!22276)))

(declare-fun b!651962 () Bool)

(declare-fun res!422706 () Bool)

(assert (=> b!651962 (=> (not res!422706) (not e!374152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!651962 (= res!422706 (validKeyInArray!0 k!1786))))

(declare-fun b!651963 () Bool)

(declare-fun e!374164 () Bool)

(declare-fun e!374166 () Bool)

(assert (=> b!651963 (= e!374164 (not e!374166))))

(declare-fun res!422709 () Bool)

(assert (=> b!651963 (=> res!422709 e!374166)))

(declare-fun lt!303230 () SeekEntryResult!6941)

(assert (=> b!651963 (= res!422709 (not (= lt!303230 (Found!6941 index!984))))))

(declare-fun lt!303228 () Unit!22272)

(assert (=> b!651963 (= lt!303228 e!374161)))

(declare-fun c!74990 () Bool)

(assert (=> b!651963 (= c!74990 (= lt!303230 Undefined!6941))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38596 (_ BitVec 32)) SeekEntryResult!6941)

(assert (=> b!651963 (= lt!303230 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303240 lt!303231 mask!3053))))

(assert (=> b!651963 e!374157))

(declare-fun res!422711 () Bool)

(assert (=> b!651963 (=> (not res!422711) (not e!374157))))

(declare-fun lt!303224 () (_ BitVec 32))

(assert (=> b!651963 (= res!422711 (= lt!303229 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303224 vacantSpotIndex!68 lt!303240 lt!303231 mask!3053)))))

(assert (=> b!651963 (= lt!303229 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303224 vacantSpotIndex!68 (select (arr!18501 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!651963 (= lt!303240 (select (store (arr!18501 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!303227 () Unit!22272)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38596 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22272)

(assert (=> b!651963 (= lt!303227 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303224 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!651963 (= lt!303224 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!651964 () Bool)

(declare-fun e!374160 () Bool)

(assert (=> b!651964 (= e!374153 e!374160)))

(declare-fun res!422713 () Bool)

(assert (=> b!651964 (=> (not res!422713) (not e!374160))))

(assert (=> b!651964 (= res!422713 (arrayContainsKey!0 lt!303231 (select (arr!18501 a!2986) j!136) j!136))))

(declare-fun b!651965 () Bool)

(declare-fun Unit!22277 () Unit!22272)

(assert (=> b!651965 (= e!374155 Unit!22277)))

(declare-fun b!651966 () Bool)

(declare-fun res!422715 () Bool)

(assert (=> b!651966 (=> (not res!422715) (not e!374163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38596 (_ BitVec 32)) Bool)

(assert (=> b!651966 (= res!422715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!651967 () Bool)

(declare-fun res!422707 () Bool)

(assert (=> b!651967 (=> (not res!422707) (not e!374152))))

(assert (=> b!651967 (= res!422707 (validKeyInArray!0 (select (arr!18501 a!2986) j!136)))))

(declare-fun b!651968 () Bool)

(assert (=> b!651968 (= e!374152 e!374163)))

(declare-fun res!422721 () Bool)

(assert (=> b!651968 (=> (not res!422721) (not e!374163))))

(declare-fun lt!303239 () SeekEntryResult!6941)

(assert (=> b!651968 (= res!422721 (or (= lt!303239 (MissingZero!6941 i!1108)) (= lt!303239 (MissingVacant!6941 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38596 (_ BitVec 32)) SeekEntryResult!6941)

(assert (=> b!651968 (= lt!303239 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!651969 () Bool)

(assert (=> b!651969 (= e!374160 (arrayContainsKey!0 lt!303231 (select (arr!18501 a!2986) j!136) index!984))))

(declare-fun b!651970 () Bool)

(assert (=> b!651970 (= e!374166 e!374162)))

(declare-fun res!422714 () Bool)

(assert (=> b!651970 (=> res!422714 e!374162)))

(assert (=> b!651970 (= res!422714 (or (not (= (select (arr!18501 a!2986) j!136) lt!303240)) (not (= (select (arr!18501 a!2986) j!136) lt!303234))))))

(assert (=> b!651970 e!374154))

(declare-fun res!422722 () Bool)

(assert (=> b!651970 (=> (not res!422722) (not e!374154))))

(assert (=> b!651970 (= res!422722 (= lt!303234 (select (arr!18501 a!2986) j!136)))))

(assert (=> b!651970 (= lt!303234 (select (store (arr!18501 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!651971 () Bool)

(assert (=> b!651971 (= e!374156 e!374164)))

(declare-fun res!422718 () Bool)

(assert (=> b!651971 (=> (not res!422718) (not e!374164))))

(assert (=> b!651971 (= res!422718 (and (= lt!303225 (Found!6941 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18501 a!2986) index!984) (select (arr!18501 a!2986) j!136))) (not (= (select (arr!18501 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!651971 (= lt!303225 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18501 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!59096 res!422719) b!651955))

(assert (= (and b!651955 res!422705) b!651967))

(assert (= (and b!651967 res!422707) b!651962))

(assert (= (and b!651962 res!422706) b!651952))

(assert (= (and b!651952 res!422708) b!651968))

(assert (= (and b!651968 res!422721) b!651966))

(assert (= (and b!651966 res!422715) b!651959))

(assert (= (and b!651959 res!422723) b!651954))

(assert (= (and b!651954 res!422712) b!651950))

(assert (= (and b!651950 res!422716) b!651971))

(assert (= (and b!651971 res!422718) b!651963))

(assert (= (and b!651963 res!422711) b!651958))

(assert (= (and b!651963 c!74990) b!651951))

(assert (= (and b!651963 (not c!74990)) b!651961))

(assert (= (and b!651963 (not res!422709)) b!651970))

(assert (= (and b!651970 res!422722) b!651957))

(assert (= (and b!651957 (not res!422720)) b!651964))

(assert (= (and b!651964 res!422713) b!651969))

(assert (= (and b!651970 (not res!422714)) b!651960))

(assert (= (and b!651960 c!74989) b!651956))

(assert (= (and b!651960 (not c!74989)) b!651965))

(assert (= (and b!651960 (not res!422710)) b!651953))

(assert (= (and b!651953 res!422717) b!651949))

(declare-fun m!625097 () Bool)

(assert (=> start!59096 m!625097))

(declare-fun m!625099 () Bool)

(assert (=> start!59096 m!625099))

(declare-fun m!625101 () Bool)

(assert (=> b!651950 m!625101))

(declare-fun m!625103 () Bool)

(assert (=> b!651950 m!625103))

(declare-fun m!625105 () Bool)

(assert (=> b!651971 m!625105))

(declare-fun m!625107 () Bool)

(assert (=> b!651971 m!625107))

(assert (=> b!651971 m!625107))

(declare-fun m!625109 () Bool)

(assert (=> b!651971 m!625109))

(assert (=> b!651967 m!625107))

(assert (=> b!651967 m!625107))

(declare-fun m!625111 () Bool)

(assert (=> b!651967 m!625111))

(assert (=> b!651970 m!625107))

(assert (=> b!651970 m!625101))

(declare-fun m!625113 () Bool)

(assert (=> b!651970 m!625113))

(assert (=> b!651964 m!625107))

(assert (=> b!651964 m!625107))

(declare-fun m!625115 () Bool)

(assert (=> b!651964 m!625115))

(declare-fun m!625117 () Bool)

(assert (=> b!651968 m!625117))

(declare-fun m!625119 () Bool)

(assert (=> b!651954 m!625119))

(assert (=> b!651969 m!625107))

(assert (=> b!651969 m!625107))

(declare-fun m!625121 () Bool)

(assert (=> b!651969 m!625121))

(assert (=> b!651953 m!625107))

(declare-fun m!625123 () Bool)

(assert (=> b!651953 m!625123))

(assert (=> b!651953 m!625107))

(assert (=> b!651953 m!625115))

(declare-fun m!625125 () Bool)

(assert (=> b!651953 m!625125))

(declare-fun m!625127 () Bool)

(assert (=> b!651953 m!625127))

(declare-fun m!625129 () Bool)

(assert (=> b!651953 m!625129))

(assert (=> b!651953 m!625107))

(declare-fun m!625131 () Bool)

(assert (=> b!651953 m!625131))

(assert (=> b!651953 m!625107))

(declare-fun m!625133 () Bool)

(assert (=> b!651953 m!625133))

(declare-fun m!625135 () Bool)

(assert (=> b!651952 m!625135))

(declare-fun m!625137 () Bool)

(assert (=> b!651963 m!625137))

(declare-fun m!625139 () Bool)

(assert (=> b!651963 m!625139))

(assert (=> b!651963 m!625107))

(assert (=> b!651963 m!625101))

(declare-fun m!625141 () Bool)

(assert (=> b!651963 m!625141))

(assert (=> b!651963 m!625107))

(declare-fun m!625143 () Bool)

(assert (=> b!651963 m!625143))

(declare-fun m!625145 () Bool)

(assert (=> b!651963 m!625145))

(declare-fun m!625147 () Bool)

(assert (=> b!651963 m!625147))

(assert (=> b!651956 m!625107))

(declare-fun m!625149 () Bool)

(assert (=> b!651956 m!625149))

(assert (=> b!651956 m!625107))

(declare-fun m!625151 () Bool)

(assert (=> b!651956 m!625151))

(assert (=> b!651956 m!625107))

(declare-fun m!625153 () Bool)

(assert (=> b!651956 m!625153))

(assert (=> b!651956 m!625129))

(declare-fun m!625155 () Bool)

(assert (=> b!651956 m!625155))

(assert (=> b!651956 m!625107))

(declare-fun m!625157 () Bool)

(assert (=> b!651956 m!625157))

(assert (=> b!651956 m!625127))

(declare-fun m!625159 () Bool)

(assert (=> b!651959 m!625159))

(declare-fun m!625161 () Bool)

(assert (=> b!651962 m!625161))

(assert (=> b!651957 m!625107))

(declare-fun m!625163 () Bool)

(assert (=> b!651966 m!625163))

(assert (=> b!651949 m!625107))

(assert (=> b!651949 m!625107))

(assert (=> b!651949 m!625121))

(push 1)

