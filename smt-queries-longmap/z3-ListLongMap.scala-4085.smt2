; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56058 () Bool)

(assert start!56058)

(declare-fun b!615857 () Bool)

(declare-fun res!396661 () Bool)

(declare-fun e!353121 () Bool)

(assert (=> b!615857 (=> (not res!396661) (not e!353121))))

(declare-datatypes ((array!37473 0))(
  ( (array!37474 (arr!17980 (Array (_ BitVec 32) (_ BitVec 64))) (size!18344 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37473)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615857 (= res!396661 (validKeyInArray!0 (select (arr!17980 a!2986) j!136)))))

(declare-fun res!396659 () Bool)

(declare-fun lt!282977 () array!37473)

(declare-fun b!615858 () Bool)

(declare-fun arrayContainsKey!0 (array!37473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615858 (= res!396659 (arrayContainsKey!0 lt!282977 (select (arr!17980 a!2986) j!136) j!136))))

(declare-fun e!353122 () Bool)

(assert (=> b!615858 (=> (not res!396659) (not e!353122))))

(declare-fun e!353126 () Bool)

(assert (=> b!615858 (= e!353126 e!353122)))

(declare-fun b!615859 () Bool)

(declare-fun res!396668 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!615859 (= res!396668 (bvsge j!136 index!984))))

(assert (=> b!615859 (=> res!396668 e!353126)))

(declare-fun e!353125 () Bool)

(assert (=> b!615859 (= e!353125 e!353126)))

(declare-fun res!396672 () Bool)

(assert (=> start!56058 (=> (not res!396672) (not e!353121))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56058 (= res!396672 (validMask!0 mask!3053))))

(assert (=> start!56058 e!353121))

(assert (=> start!56058 true))

(declare-fun array_inv!13839 (array!37473) Bool)

(assert (=> start!56058 (array_inv!13839 a!2986)))

(declare-fun b!615860 () Bool)

(declare-fun res!396660 () Bool)

(assert (=> b!615860 (=> (not res!396660) (not e!353121))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!615860 (= res!396660 (and (= (size!18344 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18344 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18344 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615861 () Bool)

(declare-fun res!396666 () Bool)

(declare-fun e!353130 () Bool)

(assert (=> b!615861 (=> (not res!396666) (not e!353130))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!615861 (= res!396666 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17980 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615862 () Bool)

(declare-fun res!396658 () Bool)

(assert (=> b!615862 (=> (not res!396658) (not e!353121))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!615862 (= res!396658 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615863 () Bool)

(declare-datatypes ((Unit!19957 0))(
  ( (Unit!19958) )
))
(declare-fun e!353128 () Unit!19957)

(declare-fun Unit!19959 () Unit!19957)

(assert (=> b!615863 (= e!353128 Unit!19959)))

(declare-fun b!615864 () Bool)

(declare-fun e!353127 () Unit!19957)

(declare-fun Unit!19960 () Unit!19957)

(assert (=> b!615864 (= e!353127 Unit!19960)))

(declare-fun b!615865 () Bool)

(declare-fun e!353119 () Bool)

(declare-fun e!353123 () Bool)

(assert (=> b!615865 (= e!353119 e!353123)))

(declare-fun res!396662 () Bool)

(assert (=> b!615865 (=> (not res!396662) (not e!353123))))

(declare-datatypes ((SeekEntryResult!6376 0))(
  ( (MissingZero!6376 (index!27788 (_ BitVec 32))) (Found!6376 (index!27789 (_ BitVec 32))) (Intermediate!6376 (undefined!7188 Bool) (index!27790 (_ BitVec 32)) (x!56739 (_ BitVec 32))) (Undefined!6376) (MissingVacant!6376 (index!27791 (_ BitVec 32))) )
))
(declare-fun lt!282970 () SeekEntryResult!6376)

(assert (=> b!615865 (= res!396662 (and (= lt!282970 (Found!6376 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17980 a!2986) index!984) (select (arr!17980 a!2986) j!136))) (not (= (select (arr!17980 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37473 (_ BitVec 32)) SeekEntryResult!6376)

(assert (=> b!615865 (= lt!282970 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17980 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615866 () Bool)

(assert (=> b!615866 (= e!353130 e!353119)))

(declare-fun res!396671 () Bool)

(assert (=> b!615866 (=> (not res!396671) (not e!353119))))

(assert (=> b!615866 (= res!396671 (= (select (store (arr!17980 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615866 (= lt!282977 (array!37474 (store (arr!17980 a!2986) i!1108 k0!1786) (size!18344 a!2986)))))

(declare-fun e!353124 () Bool)

(declare-fun b!615867 () Bool)

(assert (=> b!615867 (= e!353124 (arrayContainsKey!0 lt!282977 (select (arr!17980 a!2986) j!136) index!984))))

(declare-fun b!615868 () Bool)

(declare-fun res!396669 () Bool)

(assert (=> b!615868 (=> (not res!396669) (not e!353130))))

(declare-datatypes ((List!11928 0))(
  ( (Nil!11925) (Cons!11924 (h!12972 (_ BitVec 64)) (t!18148 List!11928)) )
))
(declare-fun arrayNoDuplicates!0 (array!37473 (_ BitVec 32) List!11928) Bool)

(assert (=> b!615868 (= res!396669 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11925))))

(declare-fun b!615869 () Bool)

(declare-fun e!353129 () Unit!19957)

(declare-fun Unit!19961 () Unit!19957)

(assert (=> b!615869 (= e!353129 Unit!19961)))

(assert (=> b!615869 false))

(declare-fun b!615870 () Bool)

(declare-fun e!353117 () Bool)

(declare-fun lt!282963 () SeekEntryResult!6376)

(assert (=> b!615870 (= e!353117 (= lt!282970 lt!282963))))

(declare-fun b!615871 () Bool)

(assert (=> b!615871 (= e!353121 e!353130)))

(declare-fun res!396667 () Bool)

(assert (=> b!615871 (=> (not res!396667) (not e!353130))))

(declare-fun lt!282966 () SeekEntryResult!6376)

(assert (=> b!615871 (= res!396667 (or (= lt!282966 (MissingZero!6376 i!1108)) (= lt!282966 (MissingVacant!6376 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37473 (_ BitVec 32)) SeekEntryResult!6376)

(assert (=> b!615871 (= lt!282966 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!615872 () Bool)

(declare-fun e!353118 () Unit!19957)

(declare-fun Unit!19962 () Unit!19957)

(assert (=> b!615872 (= e!353118 Unit!19962)))

(declare-fun b!615873 () Bool)

(declare-fun res!396663 () Bool)

(assert (=> b!615873 (=> (not res!396663) (not e!353121))))

(assert (=> b!615873 (= res!396663 (validKeyInArray!0 k0!1786))))

(declare-fun b!615874 () Bool)

(assert (=> b!615874 false))

(declare-fun lt!282975 () Unit!19957)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37473 (_ BitVec 64) (_ BitVec 32) List!11928) Unit!19957)

(assert (=> b!615874 (= lt!282975 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282977 (select (arr!17980 a!2986) j!136) index!984 Nil!11925))))

(assert (=> b!615874 (arrayNoDuplicates!0 lt!282977 index!984 Nil!11925)))

(declare-fun lt!282962 () Unit!19957)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37473 (_ BitVec 32) (_ BitVec 32)) Unit!19957)

(assert (=> b!615874 (= lt!282962 (lemmaNoDuplicateFromThenFromBigger!0 lt!282977 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615874 (arrayNoDuplicates!0 lt!282977 #b00000000000000000000000000000000 Nil!11925)))

(declare-fun lt!282979 () Unit!19957)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37473 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11928) Unit!19957)

(assert (=> b!615874 (= lt!282979 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11925))))

(assert (=> b!615874 (arrayContainsKey!0 lt!282977 (select (arr!17980 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282976 () Unit!19957)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37473 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19957)

(assert (=> b!615874 (= lt!282976 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282977 (select (arr!17980 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!615874 e!353124))

(declare-fun res!396673 () Bool)

(assert (=> b!615874 (=> (not res!396673) (not e!353124))))

(assert (=> b!615874 (= res!396673 (arrayContainsKey!0 lt!282977 (select (arr!17980 a!2986) j!136) j!136))))

(declare-fun Unit!19963 () Unit!19957)

(assert (=> b!615874 (= e!353128 Unit!19963)))

(declare-fun b!615875 () Bool)

(declare-fun res!396670 () Bool)

(assert (=> b!615875 (=> (not res!396670) (not e!353130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37473 (_ BitVec 32)) Bool)

(assert (=> b!615875 (= res!396670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615876 () Bool)

(declare-fun Unit!19964 () Unit!19957)

(assert (=> b!615876 (= e!353129 Unit!19964)))

(declare-fun b!615877 () Bool)

(assert (=> b!615877 (= e!353122 (arrayContainsKey!0 lt!282977 (select (arr!17980 a!2986) j!136) index!984))))

(declare-fun b!615878 () Bool)

(assert (=> b!615878 (= e!353123 (not true))))

(declare-fun lt!282973 () Unit!19957)

(assert (=> b!615878 (= lt!282973 e!353127)))

(declare-fun c!69968 () Bool)

(declare-fun lt!282964 () SeekEntryResult!6376)

(assert (=> b!615878 (= c!69968 (= lt!282964 (Found!6376 index!984)))))

(declare-fun lt!282969 () Unit!19957)

(assert (=> b!615878 (= lt!282969 e!353129)))

(declare-fun c!69971 () Bool)

(assert (=> b!615878 (= c!69971 (= lt!282964 Undefined!6376))))

(declare-fun lt!282968 () (_ BitVec 64))

(assert (=> b!615878 (= lt!282964 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282968 lt!282977 mask!3053))))

(assert (=> b!615878 e!353117))

(declare-fun res!396665 () Bool)

(assert (=> b!615878 (=> (not res!396665) (not e!353117))))

(declare-fun lt!282961 () (_ BitVec 32))

(assert (=> b!615878 (= res!396665 (= lt!282963 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282961 vacantSpotIndex!68 lt!282968 lt!282977 mask!3053)))))

(assert (=> b!615878 (= lt!282963 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282961 vacantSpotIndex!68 (select (arr!17980 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615878 (= lt!282968 (select (store (arr!17980 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!282967 () Unit!19957)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19957)

(assert (=> b!615878 (= lt!282967 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282961 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615878 (= lt!282961 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!615879 () Bool)

(declare-fun Unit!19965 () Unit!19957)

(assert (=> b!615879 (= e!353127 Unit!19965)))

(declare-fun res!396664 () Bool)

(assert (=> b!615879 (= res!396664 (= (select (store (arr!17980 a!2986) i!1108 k0!1786) index!984) (select (arr!17980 a!2986) j!136)))))

(assert (=> b!615879 (=> (not res!396664) (not e!353125))))

(assert (=> b!615879 e!353125))

(declare-fun c!69969 () Bool)

(assert (=> b!615879 (= c!69969 (bvslt j!136 index!984))))

(declare-fun lt!282971 () Unit!19957)

(assert (=> b!615879 (= lt!282971 e!353118)))

(declare-fun c!69970 () Bool)

(assert (=> b!615879 (= c!69970 (bvslt index!984 j!136))))

(declare-fun lt!282972 () Unit!19957)

(assert (=> b!615879 (= lt!282972 e!353128)))

(assert (=> b!615879 false))

(declare-fun b!615880 () Bool)

(assert (=> b!615880 false))

(declare-fun lt!282965 () Unit!19957)

(assert (=> b!615880 (= lt!282965 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282977 (select (arr!17980 a!2986) j!136) j!136 Nil!11925))))

(assert (=> b!615880 (arrayNoDuplicates!0 lt!282977 j!136 Nil!11925)))

(declare-fun lt!282978 () Unit!19957)

(assert (=> b!615880 (= lt!282978 (lemmaNoDuplicateFromThenFromBigger!0 lt!282977 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615880 (arrayNoDuplicates!0 lt!282977 #b00000000000000000000000000000000 Nil!11925)))

(declare-fun lt!282960 () Unit!19957)

(assert (=> b!615880 (= lt!282960 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11925))))

(assert (=> b!615880 (arrayContainsKey!0 lt!282977 (select (arr!17980 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282974 () Unit!19957)

(assert (=> b!615880 (= lt!282974 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282977 (select (arr!17980 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!19966 () Unit!19957)

(assert (=> b!615880 (= e!353118 Unit!19966)))

(assert (= (and start!56058 res!396672) b!615860))

(assert (= (and b!615860 res!396660) b!615857))

(assert (= (and b!615857 res!396661) b!615873))

(assert (= (and b!615873 res!396663) b!615862))

(assert (= (and b!615862 res!396658) b!615871))

(assert (= (and b!615871 res!396667) b!615875))

(assert (= (and b!615875 res!396670) b!615868))

(assert (= (and b!615868 res!396669) b!615861))

(assert (= (and b!615861 res!396666) b!615866))

(assert (= (and b!615866 res!396671) b!615865))

(assert (= (and b!615865 res!396662) b!615878))

(assert (= (and b!615878 res!396665) b!615870))

(assert (= (and b!615878 c!69971) b!615869))

(assert (= (and b!615878 (not c!69971)) b!615876))

(assert (= (and b!615878 c!69968) b!615879))

(assert (= (and b!615878 (not c!69968)) b!615864))

(assert (= (and b!615879 res!396664) b!615859))

(assert (= (and b!615859 (not res!396668)) b!615858))

(assert (= (and b!615858 res!396659) b!615877))

(assert (= (and b!615879 c!69969) b!615880))

(assert (= (and b!615879 (not c!69969)) b!615872))

(assert (= (and b!615879 c!69970) b!615874))

(assert (= (and b!615879 (not c!69970)) b!615863))

(assert (= (and b!615874 res!396673) b!615867))

(declare-fun m!592331 () Bool)

(assert (=> b!615862 m!592331))

(declare-fun m!592333 () Bool)

(assert (=> b!615861 m!592333))

(declare-fun m!592335 () Bool)

(assert (=> b!615871 m!592335))

(declare-fun m!592337 () Bool)

(assert (=> start!56058 m!592337))

(declare-fun m!592339 () Bool)

(assert (=> start!56058 m!592339))

(declare-fun m!592341 () Bool)

(assert (=> b!615879 m!592341))

(declare-fun m!592343 () Bool)

(assert (=> b!615879 m!592343))

(declare-fun m!592345 () Bool)

(assert (=> b!615879 m!592345))

(assert (=> b!615880 m!592345))

(declare-fun m!592347 () Bool)

(assert (=> b!615880 m!592347))

(declare-fun m!592349 () Bool)

(assert (=> b!615880 m!592349))

(assert (=> b!615880 m!592345))

(declare-fun m!592351 () Bool)

(assert (=> b!615880 m!592351))

(assert (=> b!615880 m!592345))

(declare-fun m!592353 () Bool)

(assert (=> b!615880 m!592353))

(assert (=> b!615880 m!592345))

(declare-fun m!592355 () Bool)

(assert (=> b!615880 m!592355))

(declare-fun m!592357 () Bool)

(assert (=> b!615880 m!592357))

(declare-fun m!592359 () Bool)

(assert (=> b!615880 m!592359))

(declare-fun m!592361 () Bool)

(assert (=> b!615868 m!592361))

(assert (=> b!615877 m!592345))

(assert (=> b!615877 m!592345))

(declare-fun m!592363 () Bool)

(assert (=> b!615877 m!592363))

(declare-fun m!592365 () Bool)

(assert (=> b!615865 m!592365))

(assert (=> b!615865 m!592345))

(assert (=> b!615865 m!592345))

(declare-fun m!592367 () Bool)

(assert (=> b!615865 m!592367))

(assert (=> b!615857 m!592345))

(assert (=> b!615857 m!592345))

(declare-fun m!592369 () Bool)

(assert (=> b!615857 m!592369))

(declare-fun m!592371 () Bool)

(assert (=> b!615874 m!592371))

(assert (=> b!615874 m!592345))

(declare-fun m!592373 () Bool)

(assert (=> b!615874 m!592373))

(assert (=> b!615874 m!592345))

(assert (=> b!615874 m!592345))

(declare-fun m!592375 () Bool)

(assert (=> b!615874 m!592375))

(assert (=> b!615874 m!592353))

(assert (=> b!615874 m!592345))

(declare-fun m!592377 () Bool)

(assert (=> b!615874 m!592377))

(declare-fun m!592379 () Bool)

(assert (=> b!615874 m!592379))

(assert (=> b!615874 m!592345))

(declare-fun m!592381 () Bool)

(assert (=> b!615874 m!592381))

(assert (=> b!615874 m!592359))

(declare-fun m!592383 () Bool)

(assert (=> b!615875 m!592383))

(declare-fun m!592385 () Bool)

(assert (=> b!615873 m!592385))

(declare-fun m!592387 () Bool)

(assert (=> b!615878 m!592387))

(declare-fun m!592389 () Bool)

(assert (=> b!615878 m!592389))

(declare-fun m!592391 () Bool)

(assert (=> b!615878 m!592391))

(assert (=> b!615878 m!592341))

(declare-fun m!592393 () Bool)

(assert (=> b!615878 m!592393))

(assert (=> b!615878 m!592345))

(assert (=> b!615878 m!592345))

(declare-fun m!592395 () Bool)

(assert (=> b!615878 m!592395))

(declare-fun m!592397 () Bool)

(assert (=> b!615878 m!592397))

(assert (=> b!615867 m!592345))

(assert (=> b!615867 m!592345))

(assert (=> b!615867 m!592363))

(assert (=> b!615866 m!592341))

(declare-fun m!592399 () Bool)

(assert (=> b!615866 m!592399))

(assert (=> b!615858 m!592345))

(assert (=> b!615858 m!592345))

(assert (=> b!615858 m!592381))

(check-sat (not b!615867) (not b!615877) (not b!615862) (not b!615857) (not b!615878) (not b!615868) (not b!615873) (not b!615871) (not b!615875) (not b!615858) (not b!615865) (not start!56058) (not b!615874) (not b!615880))
(check-sat)
