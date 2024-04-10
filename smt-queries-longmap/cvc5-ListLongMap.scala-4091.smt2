; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56044 () Bool)

(assert start!56044)

(declare-fun b!616974 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun res!397459 () Bool)

(declare-datatypes ((array!37514 0))(
  ( (array!37515 (arr!18003 (Array (_ BitVec 32) (_ BitVec 64))) (size!18367 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37514)

(declare-fun lt!283946 () array!37514)

(declare-fun arrayContainsKey!0 (array!37514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616974 (= res!397459 (arrayContainsKey!0 lt!283946 (select (arr!18003 a!2986) j!136) j!136))))

(declare-fun e!353785 () Bool)

(assert (=> b!616974 (=> (not res!397459) (not e!353785))))

(declare-fun e!353779 () Bool)

(assert (=> b!616974 (= e!353779 e!353785)))

(declare-fun b!616975 () Bool)

(declare-datatypes ((Unit!20158 0))(
  ( (Unit!20159) )
))
(declare-fun e!353778 () Unit!20158)

(declare-fun Unit!20160 () Unit!20158)

(assert (=> b!616975 (= e!353778 Unit!20160)))

(declare-fun b!616976 () Bool)

(assert (=> b!616976 false))

(declare-fun lt!283940 () Unit!20158)

(declare-datatypes ((List!12044 0))(
  ( (Nil!12041) (Cons!12040 (h!13085 (_ BitVec 64)) (t!18272 List!12044)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37514 (_ BitVec 64) (_ BitVec 32) List!12044) Unit!20158)

(assert (=> b!616976 (= lt!283940 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283946 (select (arr!18003 a!2986) j!136) j!136 Nil!12041))))

(declare-fun arrayNoDuplicates!0 (array!37514 (_ BitVec 32) List!12044) Bool)

(assert (=> b!616976 (arrayNoDuplicates!0 lt!283946 j!136 Nil!12041)))

(declare-fun lt!283953 () Unit!20158)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37514 (_ BitVec 32) (_ BitVec 32)) Unit!20158)

(assert (=> b!616976 (= lt!283953 (lemmaNoDuplicateFromThenFromBigger!0 lt!283946 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616976 (arrayNoDuplicates!0 lt!283946 #b00000000000000000000000000000000 Nil!12041)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!283956 () Unit!20158)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37514 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12044) Unit!20158)

(assert (=> b!616976 (= lt!283956 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12041))))

(assert (=> b!616976 (arrayContainsKey!0 lt!283946 (select (arr!18003 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283938 () Unit!20158)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37514 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20158)

(assert (=> b!616976 (= lt!283938 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283946 (select (arr!18003 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20161 () Unit!20158)

(assert (=> b!616976 (= e!353778 Unit!20161)))

(declare-fun b!616977 () Bool)

(declare-fun e!353781 () Bool)

(assert (=> b!616977 (= e!353781 true)))

(assert (=> b!616977 (= (select (store (arr!18003 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!616978 () Bool)

(declare-fun e!353783 () Bool)

(declare-fun e!353777 () Bool)

(assert (=> b!616978 (= e!353783 e!353777)))

(declare-fun res!397458 () Bool)

(assert (=> b!616978 (=> (not res!397458) (not e!353777))))

(declare-datatypes ((SeekEntryResult!6443 0))(
  ( (MissingZero!6443 (index!28056 (_ BitVec 32))) (Found!6443 (index!28057 (_ BitVec 32))) (Intermediate!6443 (undefined!7255 Bool) (index!28058 (_ BitVec 32)) (x!56851 (_ BitVec 32))) (Undefined!6443) (MissingVacant!6443 (index!28059 (_ BitVec 32))) )
))
(declare-fun lt!283949 () SeekEntryResult!6443)

(assert (=> b!616978 (= res!397458 (or (= lt!283949 (MissingZero!6443 i!1108)) (= lt!283949 (MissingVacant!6443 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37514 (_ BitVec 32)) SeekEntryResult!6443)

(assert (=> b!616978 (= lt!283949 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!616979 () Bool)

(declare-fun res!397461 () Bool)

(assert (=> b!616979 (=> (not res!397461) (not e!353783))))

(assert (=> b!616979 (= res!397461 (and (= (size!18367 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18367 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18367 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616980 () Bool)

(declare-fun res!397452 () Bool)

(assert (=> b!616980 (=> (not res!397452) (not e!353777))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!616980 (= res!397452 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18003 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616981 () Bool)

(declare-fun e!353775 () Unit!20158)

(declare-fun Unit!20162 () Unit!20158)

(assert (=> b!616981 (= e!353775 Unit!20162)))

(declare-fun b!616982 () Bool)

(declare-fun e!353774 () Bool)

(declare-fun e!353773 () Bool)

(assert (=> b!616982 (= e!353774 e!353773)))

(declare-fun res!397449 () Bool)

(assert (=> b!616982 (=> (not res!397449) (not e!353773))))

(declare-fun lt!283947 () SeekEntryResult!6443)

(assert (=> b!616982 (= res!397449 (and (= lt!283947 (Found!6443 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18003 a!2986) index!984) (select (arr!18003 a!2986) j!136))) (not (= (select (arr!18003 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37514 (_ BitVec 32)) SeekEntryResult!6443)

(assert (=> b!616982 (= lt!283947 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18003 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616983 () Bool)

(declare-fun res!397456 () Bool)

(assert (=> b!616983 (=> (not res!397456) (not e!353783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616983 (= res!397456 (validKeyInArray!0 (select (arr!18003 a!2986) j!136)))))

(declare-fun b!616984 () Bool)

(declare-fun res!397450 () Bool)

(assert (=> b!616984 (=> (not res!397450) (not e!353783))))

(assert (=> b!616984 (= res!397450 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616973 () Bool)

(declare-fun e!353780 () Unit!20158)

(declare-fun Unit!20163 () Unit!20158)

(assert (=> b!616973 (= e!353780 Unit!20163)))

(declare-fun res!397448 () Bool)

(assert (=> start!56044 (=> (not res!397448) (not e!353783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56044 (= res!397448 (validMask!0 mask!3053))))

(assert (=> start!56044 e!353783))

(assert (=> start!56044 true))

(declare-fun array_inv!13799 (array!37514) Bool)

(assert (=> start!56044 (array_inv!13799 a!2986)))

(declare-fun b!616985 () Bool)

(declare-fun e!353782 () Bool)

(assert (=> b!616985 (= e!353782 (arrayContainsKey!0 lt!283946 (select (arr!18003 a!2986) j!136) index!984))))

(declare-fun b!616986 () Bool)

(assert (=> b!616986 (= e!353773 (not e!353781))))

(declare-fun res!397460 () Bool)

(assert (=> b!616986 (=> res!397460 e!353781)))

(declare-fun lt!283950 () SeekEntryResult!6443)

(assert (=> b!616986 (= res!397460 (not (= lt!283950 (MissingVacant!6443 vacantSpotIndex!68))))))

(declare-fun lt!283951 () Unit!20158)

(assert (=> b!616986 (= lt!283951 e!353780)))

(declare-fun c!70133 () Bool)

(assert (=> b!616986 (= c!70133 (= lt!283950 (Found!6443 index!984)))))

(declare-fun lt!283944 () Unit!20158)

(assert (=> b!616986 (= lt!283944 e!353775)))

(declare-fun c!70130 () Bool)

(assert (=> b!616986 (= c!70130 (= lt!283950 Undefined!6443))))

(declare-fun lt!283957 () (_ BitVec 64))

(assert (=> b!616986 (= lt!283950 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283957 lt!283946 mask!3053))))

(declare-fun e!353786 () Bool)

(assert (=> b!616986 e!353786))

(declare-fun res!397463 () Bool)

(assert (=> b!616986 (=> (not res!397463) (not e!353786))))

(declare-fun lt!283952 () SeekEntryResult!6443)

(declare-fun lt!283941 () (_ BitVec 32))

(assert (=> b!616986 (= res!397463 (= lt!283952 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283941 vacantSpotIndex!68 lt!283957 lt!283946 mask!3053)))))

(assert (=> b!616986 (= lt!283952 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283941 vacantSpotIndex!68 (select (arr!18003 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616986 (= lt!283957 (select (store (arr!18003 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!283942 () Unit!20158)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37514 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20158)

(assert (=> b!616986 (= lt!283942 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283941 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616986 (= lt!283941 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!616987 () Bool)

(assert (=> b!616987 (= e!353786 (= lt!283947 lt!283952))))

(declare-fun b!616988 () Bool)

(declare-fun Unit!20164 () Unit!20158)

(assert (=> b!616988 (= e!353775 Unit!20164)))

(assert (=> b!616988 false))

(declare-fun b!616989 () Bool)

(declare-fun Unit!20165 () Unit!20158)

(assert (=> b!616989 (= e!353780 Unit!20165)))

(declare-fun res!397453 () Bool)

(assert (=> b!616989 (= res!397453 (= (select (store (arr!18003 a!2986) i!1108 k!1786) index!984) (select (arr!18003 a!2986) j!136)))))

(declare-fun e!353787 () Bool)

(assert (=> b!616989 (=> (not res!397453) (not e!353787))))

(assert (=> b!616989 e!353787))

(declare-fun c!70132 () Bool)

(assert (=> b!616989 (= c!70132 (bvslt j!136 index!984))))

(declare-fun lt!283954 () Unit!20158)

(assert (=> b!616989 (= lt!283954 e!353778)))

(declare-fun c!70131 () Bool)

(assert (=> b!616989 (= c!70131 (bvslt index!984 j!136))))

(declare-fun lt!283945 () Unit!20158)

(declare-fun e!353784 () Unit!20158)

(assert (=> b!616989 (= lt!283945 e!353784)))

(assert (=> b!616989 false))

(declare-fun b!616990 () Bool)

(declare-fun res!397462 () Bool)

(assert (=> b!616990 (=> (not res!397462) (not e!353777))))

(assert (=> b!616990 (= res!397462 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12041))))

(declare-fun b!616991 () Bool)

(declare-fun res!397457 () Bool)

(assert (=> b!616991 (=> (not res!397457) (not e!353783))))

(assert (=> b!616991 (= res!397457 (validKeyInArray!0 k!1786))))

(declare-fun b!616992 () Bool)

(assert (=> b!616992 false))

(declare-fun lt!283948 () Unit!20158)

(assert (=> b!616992 (= lt!283948 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283946 (select (arr!18003 a!2986) j!136) index!984 Nil!12041))))

(assert (=> b!616992 (arrayNoDuplicates!0 lt!283946 index!984 Nil!12041)))

(declare-fun lt!283955 () Unit!20158)

(assert (=> b!616992 (= lt!283955 (lemmaNoDuplicateFromThenFromBigger!0 lt!283946 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616992 (arrayNoDuplicates!0 lt!283946 #b00000000000000000000000000000000 Nil!12041)))

(declare-fun lt!283939 () Unit!20158)

(assert (=> b!616992 (= lt!283939 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12041))))

(assert (=> b!616992 (arrayContainsKey!0 lt!283946 (select (arr!18003 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283943 () Unit!20158)

(assert (=> b!616992 (= lt!283943 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283946 (select (arr!18003 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!616992 e!353782))

(declare-fun res!397454 () Bool)

(assert (=> b!616992 (=> (not res!397454) (not e!353782))))

(assert (=> b!616992 (= res!397454 (arrayContainsKey!0 lt!283946 (select (arr!18003 a!2986) j!136) j!136))))

(declare-fun Unit!20166 () Unit!20158)

(assert (=> b!616992 (= e!353784 Unit!20166)))

(declare-fun b!616993 () Bool)

(declare-fun res!397451 () Bool)

(assert (=> b!616993 (= res!397451 (bvsge j!136 index!984))))

(assert (=> b!616993 (=> res!397451 e!353779)))

(assert (=> b!616993 (= e!353787 e!353779)))

(declare-fun b!616994 () Bool)

(declare-fun res!397455 () Bool)

(assert (=> b!616994 (=> (not res!397455) (not e!353777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37514 (_ BitVec 32)) Bool)

(assert (=> b!616994 (= res!397455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616995 () Bool)

(declare-fun Unit!20167 () Unit!20158)

(assert (=> b!616995 (= e!353784 Unit!20167)))

(declare-fun b!616996 () Bool)

(assert (=> b!616996 (= e!353777 e!353774)))

(declare-fun res!397447 () Bool)

(assert (=> b!616996 (=> (not res!397447) (not e!353774))))

(assert (=> b!616996 (= res!397447 (= (select (store (arr!18003 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616996 (= lt!283946 (array!37515 (store (arr!18003 a!2986) i!1108 k!1786) (size!18367 a!2986)))))

(declare-fun b!616997 () Bool)

(assert (=> b!616997 (= e!353785 (arrayContainsKey!0 lt!283946 (select (arr!18003 a!2986) j!136) index!984))))

(assert (= (and start!56044 res!397448) b!616979))

(assert (= (and b!616979 res!397461) b!616983))

(assert (= (and b!616983 res!397456) b!616991))

(assert (= (and b!616991 res!397457) b!616984))

(assert (= (and b!616984 res!397450) b!616978))

(assert (= (and b!616978 res!397458) b!616994))

(assert (= (and b!616994 res!397455) b!616990))

(assert (= (and b!616990 res!397462) b!616980))

(assert (= (and b!616980 res!397452) b!616996))

(assert (= (and b!616996 res!397447) b!616982))

(assert (= (and b!616982 res!397449) b!616986))

(assert (= (and b!616986 res!397463) b!616987))

(assert (= (and b!616986 c!70130) b!616988))

(assert (= (and b!616986 (not c!70130)) b!616981))

(assert (= (and b!616986 c!70133) b!616989))

(assert (= (and b!616986 (not c!70133)) b!616973))

(assert (= (and b!616989 res!397453) b!616993))

(assert (= (and b!616993 (not res!397451)) b!616974))

(assert (= (and b!616974 res!397459) b!616997))

(assert (= (and b!616989 c!70132) b!616976))

(assert (= (and b!616989 (not c!70132)) b!616975))

(assert (= (and b!616989 c!70131) b!616992))

(assert (= (and b!616989 (not c!70131)) b!616995))

(assert (= (and b!616992 res!397454) b!616985))

(assert (= (and b!616986 (not res!397460)) b!616977))

(declare-fun m!593111 () Bool)

(assert (=> b!616980 m!593111))

(declare-fun m!593113 () Bool)

(assert (=> b!616991 m!593113))

(declare-fun m!593115 () Bool)

(assert (=> b!616984 m!593115))

(declare-fun m!593117 () Bool)

(assert (=> b!616974 m!593117))

(assert (=> b!616974 m!593117))

(declare-fun m!593119 () Bool)

(assert (=> b!616974 m!593119))

(assert (=> b!616983 m!593117))

(assert (=> b!616983 m!593117))

(declare-fun m!593121 () Bool)

(assert (=> b!616983 m!593121))

(declare-fun m!593123 () Bool)

(assert (=> b!616982 m!593123))

(assert (=> b!616982 m!593117))

(assert (=> b!616982 m!593117))

(declare-fun m!593125 () Bool)

(assert (=> b!616982 m!593125))

(declare-fun m!593127 () Bool)

(assert (=> b!616978 m!593127))

(declare-fun m!593129 () Bool)

(assert (=> b!616989 m!593129))

(declare-fun m!593131 () Bool)

(assert (=> b!616989 m!593131))

(assert (=> b!616989 m!593117))

(assert (=> b!616985 m!593117))

(assert (=> b!616985 m!593117))

(declare-fun m!593133 () Bool)

(assert (=> b!616985 m!593133))

(declare-fun m!593135 () Bool)

(assert (=> b!616986 m!593135))

(declare-fun m!593137 () Bool)

(assert (=> b!616986 m!593137))

(declare-fun m!593139 () Bool)

(assert (=> b!616986 m!593139))

(assert (=> b!616986 m!593117))

(assert (=> b!616986 m!593129))

(declare-fun m!593141 () Bool)

(assert (=> b!616986 m!593141))

(assert (=> b!616986 m!593117))

(declare-fun m!593143 () Bool)

(assert (=> b!616986 m!593143))

(declare-fun m!593145 () Bool)

(assert (=> b!616986 m!593145))

(assert (=> b!616977 m!593129))

(assert (=> b!616977 m!593131))

(declare-fun m!593147 () Bool)

(assert (=> start!56044 m!593147))

(declare-fun m!593149 () Bool)

(assert (=> start!56044 m!593149))

(assert (=> b!616996 m!593129))

(declare-fun m!593151 () Bool)

(assert (=> b!616996 m!593151))

(assert (=> b!616997 m!593117))

(assert (=> b!616997 m!593117))

(assert (=> b!616997 m!593133))

(declare-fun m!593153 () Bool)

(assert (=> b!616990 m!593153))

(assert (=> b!616976 m!593117))

(declare-fun m!593155 () Bool)

(assert (=> b!616976 m!593155))

(declare-fun m!593157 () Bool)

(assert (=> b!616976 m!593157))

(assert (=> b!616976 m!593117))

(declare-fun m!593159 () Bool)

(assert (=> b!616976 m!593159))

(declare-fun m!593161 () Bool)

(assert (=> b!616976 m!593161))

(declare-fun m!593163 () Bool)

(assert (=> b!616976 m!593163))

(declare-fun m!593165 () Bool)

(assert (=> b!616976 m!593165))

(assert (=> b!616976 m!593117))

(declare-fun m!593167 () Bool)

(assert (=> b!616976 m!593167))

(assert (=> b!616976 m!593117))

(declare-fun m!593169 () Bool)

(assert (=> b!616994 m!593169))

(assert (=> b!616992 m!593117))

(assert (=> b!616992 m!593119))

(assert (=> b!616992 m!593117))

(assert (=> b!616992 m!593117))

(declare-fun m!593171 () Bool)

(assert (=> b!616992 m!593171))

(declare-fun m!593173 () Bool)

(assert (=> b!616992 m!593173))

(assert (=> b!616992 m!593117))

(declare-fun m!593175 () Bool)

(assert (=> b!616992 m!593175))

(assert (=> b!616992 m!593161))

(declare-fun m!593177 () Bool)

(assert (=> b!616992 m!593177))

(assert (=> b!616992 m!593117))

(declare-fun m!593179 () Bool)

(assert (=> b!616992 m!593179))

(assert (=> b!616992 m!593165))

(push 1)

