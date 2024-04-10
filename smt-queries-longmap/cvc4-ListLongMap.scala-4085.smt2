; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56012 () Bool)

(assert start!56012)

(declare-fun b!615792 () Bool)

(declare-fun res!396655 () Bool)

(declare-fun e!353080 () Bool)

(assert (=> b!615792 (=> (not res!396655) (not e!353080))))

(declare-datatypes ((array!37482 0))(
  ( (array!37483 (arr!17987 (Array (_ BitVec 32) (_ BitVec 64))) (size!18351 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37482)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615792 (= res!396655 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615793 () Bool)

(declare-fun res!396659 () Bool)

(assert (=> b!615793 (=> (not res!396659) (not e!353080))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!615793 (= res!396659 (and (= (size!18351 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18351 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18351 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!615794 () Bool)

(declare-fun e!353073 () Bool)

(declare-fun e!353081 () Bool)

(assert (=> b!615794 (= e!353073 e!353081)))

(declare-fun res!396662 () Bool)

(assert (=> b!615794 (=> (not res!396662) (not e!353081))))

(declare-datatypes ((SeekEntryResult!6427 0))(
  ( (MissingZero!6427 (index!27992 (_ BitVec 32))) (Found!6427 (index!27993 (_ BitVec 32))) (Intermediate!6427 (undefined!7239 Bool) (index!27994 (_ BitVec 32)) (x!56787 (_ BitVec 32))) (Undefined!6427) (MissingVacant!6427 (index!27995 (_ BitVec 32))) )
))
(declare-fun lt!282978 () SeekEntryResult!6427)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!615794 (= res!396662 (and (= lt!282978 (Found!6427 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17987 a!2986) index!984) (select (arr!17987 a!2986) j!136))) (not (= (select (arr!17987 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37482 (_ BitVec 32)) SeekEntryResult!6427)

(assert (=> b!615794 (= lt!282978 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17987 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!282994 () array!37482)

(declare-fun e!353085 () Bool)

(declare-fun b!615795 () Bool)

(assert (=> b!615795 (= e!353085 (arrayContainsKey!0 lt!282994 (select (arr!17987 a!2986) j!136) index!984))))

(declare-fun b!615796 () Bool)

(declare-fun res!396650 () Bool)

(assert (=> b!615796 (= res!396650 (bvsge j!136 index!984))))

(declare-fun e!353072 () Bool)

(assert (=> b!615796 (=> res!396650 e!353072)))

(declare-fun e!353076 () Bool)

(assert (=> b!615796 (= e!353076 e!353072)))

(declare-fun b!615797 () Bool)

(assert (=> b!615797 (= e!353081 (not true))))

(declare-datatypes ((Unit!19998 0))(
  ( (Unit!19999) )
))
(declare-fun lt!282997 () Unit!19998)

(declare-fun e!353083 () Unit!19998)

(assert (=> b!615797 (= lt!282997 e!353083)))

(declare-fun c!69941 () Bool)

(declare-fun lt!282989 () SeekEntryResult!6427)

(assert (=> b!615797 (= c!69941 (= lt!282989 (Found!6427 index!984)))))

(declare-fun lt!282981 () Unit!19998)

(declare-fun e!353075 () Unit!19998)

(assert (=> b!615797 (= lt!282981 e!353075)))

(declare-fun c!69938 () Bool)

(assert (=> b!615797 (= c!69938 (= lt!282989 Undefined!6427))))

(declare-fun lt!282987 () (_ BitVec 64))

(assert (=> b!615797 (= lt!282989 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282987 lt!282994 mask!3053))))

(declare-fun e!353084 () Bool)

(assert (=> b!615797 e!353084))

(declare-fun res!396664 () Bool)

(assert (=> b!615797 (=> (not res!396664) (not e!353084))))

(declare-fun lt!282986 () SeekEntryResult!6427)

(declare-fun lt!282990 () (_ BitVec 32))

(assert (=> b!615797 (= res!396664 (= lt!282986 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282990 vacantSpotIndex!68 lt!282987 lt!282994 mask!3053)))))

(assert (=> b!615797 (= lt!282986 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282990 vacantSpotIndex!68 (select (arr!17987 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615797 (= lt!282987 (select (store (arr!17987 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!282985 () Unit!19998)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37482 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19998)

(assert (=> b!615797 (= lt!282985 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282990 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615797 (= lt!282990 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!615798 () Bool)

(declare-fun Unit!20000 () Unit!19998)

(assert (=> b!615798 (= e!353083 Unit!20000)))

(declare-fun b!615799 () Bool)

(declare-fun e!353074 () Unit!19998)

(declare-fun Unit!20001 () Unit!19998)

(assert (=> b!615799 (= e!353074 Unit!20001)))

(declare-fun b!615800 () Bool)

(declare-fun Unit!20002 () Unit!19998)

(assert (=> b!615800 (= e!353083 Unit!20002)))

(declare-fun res!396663 () Bool)

(assert (=> b!615800 (= res!396663 (= (select (store (arr!17987 a!2986) i!1108 k!1786) index!984) (select (arr!17987 a!2986) j!136)))))

(assert (=> b!615800 (=> (not res!396663) (not e!353076))))

(assert (=> b!615800 e!353076))

(declare-fun c!69939 () Bool)

(assert (=> b!615800 (= c!69939 (bvslt j!136 index!984))))

(declare-fun lt!282996 () Unit!19998)

(declare-fun e!353078 () Unit!19998)

(assert (=> b!615800 (= lt!282996 e!353078)))

(declare-fun c!69940 () Bool)

(assert (=> b!615800 (= c!69940 (bvslt index!984 j!136))))

(declare-fun lt!282980 () Unit!19998)

(assert (=> b!615800 (= lt!282980 e!353074)))

(assert (=> b!615800 false))

(declare-fun e!353082 () Bool)

(declare-fun b!615801 () Bool)

(assert (=> b!615801 (= e!353082 (arrayContainsKey!0 lt!282994 (select (arr!17987 a!2986) j!136) index!984))))

(declare-fun res!396661 () Bool)

(assert (=> start!56012 (=> (not res!396661) (not e!353080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56012 (= res!396661 (validMask!0 mask!3053))))

(assert (=> start!56012 e!353080))

(assert (=> start!56012 true))

(declare-fun array_inv!13783 (array!37482) Bool)

(assert (=> start!56012 (array_inv!13783 a!2986)))

(declare-fun b!615802 () Bool)

(declare-fun res!396654 () Bool)

(assert (=> b!615802 (=> (not res!396654) (not e!353080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615802 (= res!396654 (validKeyInArray!0 k!1786))))

(declare-fun b!615803 () Bool)

(declare-fun Unit!20003 () Unit!19998)

(assert (=> b!615803 (= e!353075 Unit!20003)))

(assert (=> b!615803 false))

(declare-fun b!615804 () Bool)

(declare-fun Unit!20004 () Unit!19998)

(assert (=> b!615804 (= e!353078 Unit!20004)))

(declare-fun res!396660 () Bool)

(declare-fun b!615805 () Bool)

(assert (=> b!615805 (= res!396660 (arrayContainsKey!0 lt!282994 (select (arr!17987 a!2986) j!136) j!136))))

(assert (=> b!615805 (=> (not res!396660) (not e!353082))))

(assert (=> b!615805 (= e!353072 e!353082)))

(declare-fun b!615806 () Bool)

(assert (=> b!615806 (= e!353084 (= lt!282978 lt!282986))))

(declare-fun b!615807 () Bool)

(declare-fun res!396652 () Bool)

(assert (=> b!615807 (=> (not res!396652) (not e!353080))))

(assert (=> b!615807 (= res!396652 (validKeyInArray!0 (select (arr!17987 a!2986) j!136)))))

(declare-fun b!615808 () Bool)

(assert (=> b!615808 false))

(declare-fun lt!282988 () Unit!19998)

(declare-datatypes ((List!12028 0))(
  ( (Nil!12025) (Cons!12024 (h!13069 (_ BitVec 64)) (t!18256 List!12028)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37482 (_ BitVec 64) (_ BitVec 32) List!12028) Unit!19998)

(assert (=> b!615808 (= lt!282988 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282994 (select (arr!17987 a!2986) j!136) j!136 Nil!12025))))

(declare-fun arrayNoDuplicates!0 (array!37482 (_ BitVec 32) List!12028) Bool)

(assert (=> b!615808 (arrayNoDuplicates!0 lt!282994 j!136 Nil!12025)))

(declare-fun lt!282982 () Unit!19998)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37482 (_ BitVec 32) (_ BitVec 32)) Unit!19998)

(assert (=> b!615808 (= lt!282982 (lemmaNoDuplicateFromThenFromBigger!0 lt!282994 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615808 (arrayNoDuplicates!0 lt!282994 #b00000000000000000000000000000000 Nil!12025)))

(declare-fun lt!282991 () Unit!19998)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37482 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12028) Unit!19998)

(assert (=> b!615808 (= lt!282991 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12025))))

(assert (=> b!615808 (arrayContainsKey!0 lt!282994 (select (arr!17987 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282983 () Unit!19998)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37482 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19998)

(assert (=> b!615808 (= lt!282983 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282994 (select (arr!17987 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20005 () Unit!19998)

(assert (=> b!615808 (= e!353078 Unit!20005)))

(declare-fun b!615809 () Bool)

(declare-fun res!396656 () Bool)

(declare-fun e!353077 () Bool)

(assert (=> b!615809 (=> (not res!396656) (not e!353077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37482 (_ BitVec 32)) Bool)

(assert (=> b!615809 (= res!396656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615810 () Bool)

(declare-fun res!396657 () Bool)

(assert (=> b!615810 (=> (not res!396657) (not e!353077))))

(assert (=> b!615810 (= res!396657 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17987 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615811 () Bool)

(assert (=> b!615811 (= e!353077 e!353073)))

(declare-fun res!396658 () Bool)

(assert (=> b!615811 (=> (not res!396658) (not e!353073))))

(assert (=> b!615811 (= res!396658 (= (select (store (arr!17987 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!615811 (= lt!282994 (array!37483 (store (arr!17987 a!2986) i!1108 k!1786) (size!18351 a!2986)))))

(declare-fun b!615812 () Bool)

(declare-fun res!396653 () Bool)

(assert (=> b!615812 (=> (not res!396653) (not e!353077))))

(assert (=> b!615812 (= res!396653 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12025))))

(declare-fun b!615813 () Bool)

(assert (=> b!615813 (= e!353080 e!353077)))

(declare-fun res!396651 () Bool)

(assert (=> b!615813 (=> (not res!396651) (not e!353077))))

(declare-fun lt!282992 () SeekEntryResult!6427)

(assert (=> b!615813 (= res!396651 (or (= lt!282992 (MissingZero!6427 i!1108)) (= lt!282992 (MissingVacant!6427 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37482 (_ BitVec 32)) SeekEntryResult!6427)

(assert (=> b!615813 (= lt!282992 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!615814 () Bool)

(declare-fun Unit!20006 () Unit!19998)

(assert (=> b!615814 (= e!353075 Unit!20006)))

(declare-fun b!615815 () Bool)

(assert (=> b!615815 false))

(declare-fun lt!282979 () Unit!19998)

(assert (=> b!615815 (= lt!282979 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282994 (select (arr!17987 a!2986) j!136) index!984 Nil!12025))))

(assert (=> b!615815 (arrayNoDuplicates!0 lt!282994 index!984 Nil!12025)))

(declare-fun lt!282993 () Unit!19998)

(assert (=> b!615815 (= lt!282993 (lemmaNoDuplicateFromThenFromBigger!0 lt!282994 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615815 (arrayNoDuplicates!0 lt!282994 #b00000000000000000000000000000000 Nil!12025)))

(declare-fun lt!282995 () Unit!19998)

(assert (=> b!615815 (= lt!282995 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12025))))

(assert (=> b!615815 (arrayContainsKey!0 lt!282994 (select (arr!17987 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282984 () Unit!19998)

(assert (=> b!615815 (= lt!282984 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282994 (select (arr!17987 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!615815 e!353085))

(declare-fun res!396665 () Bool)

(assert (=> b!615815 (=> (not res!396665) (not e!353085))))

(assert (=> b!615815 (= res!396665 (arrayContainsKey!0 lt!282994 (select (arr!17987 a!2986) j!136) j!136))))

(declare-fun Unit!20007 () Unit!19998)

(assert (=> b!615815 (= e!353074 Unit!20007)))

(assert (= (and start!56012 res!396661) b!615793))

(assert (= (and b!615793 res!396659) b!615807))

(assert (= (and b!615807 res!396652) b!615802))

(assert (= (and b!615802 res!396654) b!615792))

(assert (= (and b!615792 res!396655) b!615813))

(assert (= (and b!615813 res!396651) b!615809))

(assert (= (and b!615809 res!396656) b!615812))

(assert (= (and b!615812 res!396653) b!615810))

(assert (= (and b!615810 res!396657) b!615811))

(assert (= (and b!615811 res!396658) b!615794))

(assert (= (and b!615794 res!396662) b!615797))

(assert (= (and b!615797 res!396664) b!615806))

(assert (= (and b!615797 c!69938) b!615803))

(assert (= (and b!615797 (not c!69938)) b!615814))

(assert (= (and b!615797 c!69941) b!615800))

(assert (= (and b!615797 (not c!69941)) b!615798))

(assert (= (and b!615800 res!396663) b!615796))

(assert (= (and b!615796 (not res!396650)) b!615805))

(assert (= (and b!615805 res!396660) b!615801))

(assert (= (and b!615800 c!69939) b!615808))

(assert (= (and b!615800 (not c!69939)) b!615804))

(assert (= (and b!615800 c!69940) b!615815))

(assert (= (and b!615800 (not c!69940)) b!615799))

(assert (= (and b!615815 res!396665) b!615795))

(declare-fun m!591985 () Bool)

(assert (=> b!615812 m!591985))

(declare-fun m!591987 () Bool)

(assert (=> b!615807 m!591987))

(assert (=> b!615807 m!591987))

(declare-fun m!591989 () Bool)

(assert (=> b!615807 m!591989))

(declare-fun m!591991 () Bool)

(assert (=> b!615813 m!591991))

(assert (=> b!615801 m!591987))

(assert (=> b!615801 m!591987))

(declare-fun m!591993 () Bool)

(assert (=> b!615801 m!591993))

(declare-fun m!591995 () Bool)

(assert (=> b!615810 m!591995))

(assert (=> b!615795 m!591987))

(assert (=> b!615795 m!591987))

(assert (=> b!615795 m!591993))

(declare-fun m!591997 () Bool)

(assert (=> b!615802 m!591997))

(declare-fun m!591999 () Bool)

(assert (=> start!56012 m!591999))

(declare-fun m!592001 () Bool)

(assert (=> start!56012 m!592001))

(assert (=> b!615805 m!591987))

(assert (=> b!615805 m!591987))

(declare-fun m!592003 () Bool)

(assert (=> b!615805 m!592003))

(declare-fun m!592005 () Bool)

(assert (=> b!615797 m!592005))

(declare-fun m!592007 () Bool)

(assert (=> b!615797 m!592007))

(declare-fun m!592009 () Bool)

(assert (=> b!615797 m!592009))

(declare-fun m!592011 () Bool)

(assert (=> b!615797 m!592011))

(declare-fun m!592013 () Bool)

(assert (=> b!615797 m!592013))

(assert (=> b!615797 m!591987))

(declare-fun m!592015 () Bool)

(assert (=> b!615797 m!592015))

(declare-fun m!592017 () Bool)

(assert (=> b!615797 m!592017))

(assert (=> b!615797 m!591987))

(declare-fun m!592019 () Bool)

(assert (=> b!615792 m!592019))

(declare-fun m!592021 () Bool)

(assert (=> b!615794 m!592021))

(assert (=> b!615794 m!591987))

(assert (=> b!615794 m!591987))

(declare-fun m!592023 () Bool)

(assert (=> b!615794 m!592023))

(declare-fun m!592025 () Bool)

(assert (=> b!615809 m!592025))

(declare-fun m!592027 () Bool)

(assert (=> b!615815 m!592027))

(assert (=> b!615815 m!591987))

(assert (=> b!615815 m!591987))

(declare-fun m!592029 () Bool)

(assert (=> b!615815 m!592029))

(declare-fun m!592031 () Bool)

(assert (=> b!615815 m!592031))

(assert (=> b!615815 m!591987))

(declare-fun m!592033 () Bool)

(assert (=> b!615815 m!592033))

(assert (=> b!615815 m!591987))

(declare-fun m!592035 () Bool)

(assert (=> b!615815 m!592035))

(assert (=> b!615815 m!591987))

(assert (=> b!615815 m!592003))

(declare-fun m!592037 () Bool)

(assert (=> b!615815 m!592037))

(declare-fun m!592039 () Bool)

(assert (=> b!615815 m!592039))

(assert (=> b!615811 m!592009))

(declare-fun m!592041 () Bool)

(assert (=> b!615811 m!592041))

(declare-fun m!592043 () Bool)

(assert (=> b!615808 m!592043))

(assert (=> b!615808 m!591987))

(assert (=> b!615808 m!592031))

(assert (=> b!615808 m!591987))

(declare-fun m!592045 () Bool)

(assert (=> b!615808 m!592045))

(declare-fun m!592047 () Bool)

(assert (=> b!615808 m!592047))

(assert (=> b!615808 m!591987))

(declare-fun m!592049 () Bool)

(assert (=> b!615808 m!592049))

(assert (=> b!615808 m!591987))

(declare-fun m!592051 () Bool)

(assert (=> b!615808 m!592051))

(assert (=> b!615808 m!592039))

(assert (=> b!615800 m!592009))

(declare-fun m!592053 () Bool)

(assert (=> b!615800 m!592053))

(assert (=> b!615800 m!591987))

(push 1)

