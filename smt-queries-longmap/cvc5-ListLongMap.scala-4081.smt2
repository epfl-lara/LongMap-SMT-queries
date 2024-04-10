; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55984 () Bool)

(assert start!55984)

(declare-fun b!614784 () Bool)

(declare-datatypes ((Unit!19858 0))(
  ( (Unit!19859) )
))
(declare-fun e!352486 () Unit!19858)

(declare-fun Unit!19860 () Unit!19858)

(assert (=> b!614784 (= e!352486 Unit!19860)))

(declare-fun b!614785 () Bool)

(assert (=> b!614785 false))

(declare-fun lt!282151 () Unit!19858)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37454 0))(
  ( (array!37455 (arr!17973 (Array (_ BitVec 32) (_ BitVec 64))) (size!18337 (_ BitVec 32))) )
))
(declare-fun lt!282142 () array!37454)

(declare-fun a!2986 () array!37454)

(declare-datatypes ((List!12014 0))(
  ( (Nil!12011) (Cons!12010 (h!13055 (_ BitVec 64)) (t!18242 List!12014)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37454 (_ BitVec 64) (_ BitVec 32) List!12014) Unit!19858)

(assert (=> b!614785 (= lt!282151 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282142 (select (arr!17973 a!2986) j!136) j!136 Nil!12011))))

(declare-fun arrayNoDuplicates!0 (array!37454 (_ BitVec 32) List!12014) Bool)

(assert (=> b!614785 (arrayNoDuplicates!0 lt!282142 j!136 Nil!12011)))

(declare-fun lt!282154 () Unit!19858)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37454 (_ BitVec 32) (_ BitVec 32)) Unit!19858)

(assert (=> b!614785 (= lt!282154 (lemmaNoDuplicateFromThenFromBigger!0 lt!282142 #b00000000000000000000000000000000 j!136))))

(assert (=> b!614785 (arrayNoDuplicates!0 lt!282142 #b00000000000000000000000000000000 Nil!12011)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!282152 () Unit!19858)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37454 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12014) Unit!19858)

(assert (=> b!614785 (= lt!282152 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12011))))

(declare-fun arrayContainsKey!0 (array!37454 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!614785 (arrayContainsKey!0 lt!282142 (select (arr!17973 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282138 () Unit!19858)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37454 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19858)

(assert (=> b!614785 (= lt!282138 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282142 (select (arr!17973 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!352485 () Unit!19858)

(declare-fun Unit!19861 () Unit!19858)

(assert (=> b!614785 (= e!352485 Unit!19861)))

(declare-fun b!614786 () Bool)

(declare-fun res!395988 () Bool)

(declare-fun e!352491 () Bool)

(assert (=> b!614786 (=> (not res!395988) (not e!352491))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!614786 (= res!395988 (and (= (size!18337 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18337 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18337 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!614787 () Bool)

(declare-fun res!395986 () Bool)

(assert (=> b!614787 (=> (not res!395986) (not e!352491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!614787 (= res!395986 (validKeyInArray!0 k!1786))))

(declare-fun b!614788 () Bool)

(declare-fun res!395990 () Bool)

(assert (=> b!614788 (= res!395990 (bvsge j!136 index!984))))

(declare-fun e!352484 () Bool)

(assert (=> b!614788 (=> res!395990 e!352484)))

(declare-fun e!352488 () Bool)

(assert (=> b!614788 (= e!352488 e!352484)))

(declare-fun b!614789 () Bool)

(declare-fun Unit!19862 () Unit!19858)

(assert (=> b!614789 (= e!352485 Unit!19862)))

(declare-fun b!614790 () Bool)

(declare-fun e!352489 () Bool)

(declare-datatypes ((SeekEntryResult!6413 0))(
  ( (MissingZero!6413 (index!27936 (_ BitVec 32))) (Found!6413 (index!27937 (_ BitVec 32))) (Intermediate!6413 (undefined!7225 Bool) (index!27938 (_ BitVec 32)) (x!56741 (_ BitVec 32))) (Undefined!6413) (MissingVacant!6413 (index!27939 (_ BitVec 32))) )
))
(declare-fun lt!282141 () SeekEntryResult!6413)

(declare-fun lt!282150 () SeekEntryResult!6413)

(assert (=> b!614790 (= e!352489 (= lt!282141 lt!282150))))

(declare-fun b!614791 () Bool)

(declare-fun e!352494 () Bool)

(assert (=> b!614791 (= e!352494 (not true))))

(declare-fun lt!282147 () Unit!19858)

(declare-fun e!352492 () Unit!19858)

(assert (=> b!614791 (= lt!282147 e!352492)))

(declare-fun c!69770 () Bool)

(declare-fun lt!282146 () SeekEntryResult!6413)

(assert (=> b!614791 (= c!69770 (= lt!282146 (Found!6413 index!984)))))

(declare-fun lt!282145 () Unit!19858)

(declare-fun e!352487 () Unit!19858)

(assert (=> b!614791 (= lt!282145 e!352487)))

(declare-fun c!69772 () Bool)

(assert (=> b!614791 (= c!69772 (= lt!282146 Undefined!6413))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!282149 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37454 (_ BitVec 32)) SeekEntryResult!6413)

(assert (=> b!614791 (= lt!282146 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282149 lt!282142 mask!3053))))

(assert (=> b!614791 e!352489))

(declare-fun res!395992 () Bool)

(assert (=> b!614791 (=> (not res!395992) (not e!352489))))

(declare-fun lt!282155 () (_ BitVec 32))

(assert (=> b!614791 (= res!395992 (= lt!282150 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282155 vacantSpotIndex!68 lt!282149 lt!282142 mask!3053)))))

(assert (=> b!614791 (= lt!282150 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282155 vacantSpotIndex!68 (select (arr!17973 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!614791 (= lt!282149 (select (store (arr!17973 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!282144 () Unit!19858)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37454 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19858)

(assert (=> b!614791 (= lt!282144 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282155 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!614791 (= lt!282155 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!614792 () Bool)

(declare-fun res!395993 () Bool)

(assert (=> b!614792 (=> (not res!395993) (not e!352491))))

(assert (=> b!614792 (= res!395993 (validKeyInArray!0 (select (arr!17973 a!2986) j!136)))))

(declare-fun b!614793 () Bool)

(declare-fun res!395982 () Bool)

(assert (=> b!614793 (= res!395982 (arrayContainsKey!0 lt!282142 (select (arr!17973 a!2986) j!136) j!136))))

(declare-fun e!352497 () Bool)

(assert (=> b!614793 (=> (not res!395982) (not e!352497))))

(assert (=> b!614793 (= e!352484 e!352497)))

(declare-fun b!614794 () Bool)

(declare-fun res!395987 () Bool)

(declare-fun e!352493 () Bool)

(assert (=> b!614794 (=> (not res!395987) (not e!352493))))

(assert (=> b!614794 (= res!395987 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17973 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!352495 () Bool)

(declare-fun b!614795 () Bool)

(assert (=> b!614795 (= e!352495 (arrayContainsKey!0 lt!282142 (select (arr!17973 a!2986) j!136) index!984))))

(declare-fun b!614796 () Bool)

(declare-fun Unit!19863 () Unit!19858)

(assert (=> b!614796 (= e!352487 Unit!19863)))

(assert (=> b!614796 false))

(declare-fun res!395983 () Bool)

(assert (=> start!55984 (=> (not res!395983) (not e!352491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55984 (= res!395983 (validMask!0 mask!3053))))

(assert (=> start!55984 e!352491))

(assert (=> start!55984 true))

(declare-fun array_inv!13769 (array!37454) Bool)

(assert (=> start!55984 (array_inv!13769 a!2986)))

(declare-fun b!614797 () Bool)

(declare-fun res!395991 () Bool)

(assert (=> b!614797 (=> (not res!395991) (not e!352493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37454 (_ BitVec 32)) Bool)

(assert (=> b!614797 (= res!395991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!614798 () Bool)

(declare-fun res!395980 () Bool)

(assert (=> b!614798 (=> (not res!395980) (not e!352491))))

(assert (=> b!614798 (= res!395980 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!614799 () Bool)

(declare-fun e!352490 () Bool)

(assert (=> b!614799 (= e!352490 e!352494)))

(declare-fun res!395989 () Bool)

(assert (=> b!614799 (=> (not res!395989) (not e!352494))))

(assert (=> b!614799 (= res!395989 (and (= lt!282141 (Found!6413 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17973 a!2986) index!984) (select (arr!17973 a!2986) j!136))) (not (= (select (arr!17973 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!614799 (= lt!282141 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17973 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!614800 () Bool)

(assert (=> b!614800 (= e!352491 e!352493)))

(declare-fun res!395981 () Bool)

(assert (=> b!614800 (=> (not res!395981) (not e!352493))))

(declare-fun lt!282143 () SeekEntryResult!6413)

(assert (=> b!614800 (= res!395981 (or (= lt!282143 (MissingZero!6413 i!1108)) (= lt!282143 (MissingVacant!6413 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37454 (_ BitVec 32)) SeekEntryResult!6413)

(assert (=> b!614800 (= lt!282143 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!614801 () Bool)

(declare-fun Unit!19864 () Unit!19858)

(assert (=> b!614801 (= e!352487 Unit!19864)))

(declare-fun b!614802 () Bool)

(declare-fun Unit!19865 () Unit!19858)

(assert (=> b!614802 (= e!352492 Unit!19865)))

(declare-fun res!395979 () Bool)

(assert (=> b!614802 (= res!395979 (= (select (store (arr!17973 a!2986) i!1108 k!1786) index!984) (select (arr!17973 a!2986) j!136)))))

(assert (=> b!614802 (=> (not res!395979) (not e!352488))))

(assert (=> b!614802 e!352488))

(declare-fun c!69773 () Bool)

(assert (=> b!614802 (= c!69773 (bvslt j!136 index!984))))

(declare-fun lt!282157 () Unit!19858)

(assert (=> b!614802 (= lt!282157 e!352485)))

(declare-fun c!69771 () Bool)

(assert (=> b!614802 (= c!69771 (bvslt index!984 j!136))))

(declare-fun lt!282153 () Unit!19858)

(assert (=> b!614802 (= lt!282153 e!352486)))

(assert (=> b!614802 false))

(declare-fun b!614803 () Bool)

(assert (=> b!614803 (= e!352497 (arrayContainsKey!0 lt!282142 (select (arr!17973 a!2986) j!136) index!984))))

(declare-fun b!614804 () Bool)

(assert (=> b!614804 (= e!352493 e!352490)))

(declare-fun res!395978 () Bool)

(assert (=> b!614804 (=> (not res!395978) (not e!352490))))

(assert (=> b!614804 (= res!395978 (= (select (store (arr!17973 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!614804 (= lt!282142 (array!37455 (store (arr!17973 a!2986) i!1108 k!1786) (size!18337 a!2986)))))

(declare-fun b!614805 () Bool)

(declare-fun res!395985 () Bool)

(assert (=> b!614805 (=> (not res!395985) (not e!352493))))

(assert (=> b!614805 (= res!395985 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12011))))

(declare-fun b!614806 () Bool)

(declare-fun Unit!19866 () Unit!19858)

(assert (=> b!614806 (= e!352492 Unit!19866)))

(declare-fun b!614807 () Bool)

(assert (=> b!614807 false))

(declare-fun lt!282148 () Unit!19858)

(assert (=> b!614807 (= lt!282148 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282142 (select (arr!17973 a!2986) j!136) index!984 Nil!12011))))

(assert (=> b!614807 (arrayNoDuplicates!0 lt!282142 index!984 Nil!12011)))

(declare-fun lt!282156 () Unit!19858)

(assert (=> b!614807 (= lt!282156 (lemmaNoDuplicateFromThenFromBigger!0 lt!282142 #b00000000000000000000000000000000 index!984))))

(assert (=> b!614807 (arrayNoDuplicates!0 lt!282142 #b00000000000000000000000000000000 Nil!12011)))

(declare-fun lt!282139 () Unit!19858)

(assert (=> b!614807 (= lt!282139 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12011))))

(assert (=> b!614807 (arrayContainsKey!0 lt!282142 (select (arr!17973 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282140 () Unit!19858)

(assert (=> b!614807 (= lt!282140 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282142 (select (arr!17973 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!614807 e!352495))

(declare-fun res!395984 () Bool)

(assert (=> b!614807 (=> (not res!395984) (not e!352495))))

(assert (=> b!614807 (= res!395984 (arrayContainsKey!0 lt!282142 (select (arr!17973 a!2986) j!136) j!136))))

(declare-fun Unit!19867 () Unit!19858)

(assert (=> b!614807 (= e!352486 Unit!19867)))

(assert (= (and start!55984 res!395983) b!614786))

(assert (= (and b!614786 res!395988) b!614792))

(assert (= (and b!614792 res!395993) b!614787))

(assert (= (and b!614787 res!395986) b!614798))

(assert (= (and b!614798 res!395980) b!614800))

(assert (= (and b!614800 res!395981) b!614797))

(assert (= (and b!614797 res!395991) b!614805))

(assert (= (and b!614805 res!395985) b!614794))

(assert (= (and b!614794 res!395987) b!614804))

(assert (= (and b!614804 res!395978) b!614799))

(assert (= (and b!614799 res!395989) b!614791))

(assert (= (and b!614791 res!395992) b!614790))

(assert (= (and b!614791 c!69772) b!614796))

(assert (= (and b!614791 (not c!69772)) b!614801))

(assert (= (and b!614791 c!69770) b!614802))

(assert (= (and b!614791 (not c!69770)) b!614806))

(assert (= (and b!614802 res!395979) b!614788))

(assert (= (and b!614788 (not res!395990)) b!614793))

(assert (= (and b!614793 res!395982) b!614803))

(assert (= (and b!614802 c!69773) b!614785))

(assert (= (and b!614802 (not c!69773)) b!614789))

(assert (= (and b!614802 c!69771) b!614807))

(assert (= (and b!614802 (not c!69771)) b!614784))

(assert (= (and b!614807 res!395984) b!614795))

(declare-fun m!591005 () Bool)

(assert (=> b!614798 m!591005))

(declare-fun m!591007 () Bool)

(assert (=> b!614802 m!591007))

(declare-fun m!591009 () Bool)

(assert (=> b!614802 m!591009))

(declare-fun m!591011 () Bool)

(assert (=> b!614802 m!591011))

(declare-fun m!591013 () Bool)

(assert (=> b!614797 m!591013))

(declare-fun m!591015 () Bool)

(assert (=> b!614799 m!591015))

(assert (=> b!614799 m!591011))

(assert (=> b!614799 m!591011))

(declare-fun m!591017 () Bool)

(assert (=> b!614799 m!591017))

(assert (=> b!614804 m!591007))

(declare-fun m!591019 () Bool)

(assert (=> b!614804 m!591019))

(declare-fun m!591021 () Bool)

(assert (=> b!614791 m!591021))

(declare-fun m!591023 () Bool)

(assert (=> b!614791 m!591023))

(declare-fun m!591025 () Bool)

(assert (=> b!614791 m!591025))

(assert (=> b!614791 m!591011))

(assert (=> b!614791 m!591007))

(declare-fun m!591027 () Bool)

(assert (=> b!614791 m!591027))

(declare-fun m!591029 () Bool)

(assert (=> b!614791 m!591029))

(assert (=> b!614791 m!591011))

(declare-fun m!591031 () Bool)

(assert (=> b!614791 m!591031))

(declare-fun m!591033 () Bool)

(assert (=> start!55984 m!591033))

(declare-fun m!591035 () Bool)

(assert (=> start!55984 m!591035))

(declare-fun m!591037 () Bool)

(assert (=> b!614800 m!591037))

(declare-fun m!591039 () Bool)

(assert (=> b!614787 m!591039))

(declare-fun m!591041 () Bool)

(assert (=> b!614805 m!591041))

(assert (=> b!614803 m!591011))

(assert (=> b!614803 m!591011))

(declare-fun m!591043 () Bool)

(assert (=> b!614803 m!591043))

(declare-fun m!591045 () Bool)

(assert (=> b!614785 m!591045))

(assert (=> b!614785 m!591011))

(declare-fun m!591047 () Bool)

(assert (=> b!614785 m!591047))

(assert (=> b!614785 m!591011))

(assert (=> b!614785 m!591011))

(declare-fun m!591049 () Bool)

(assert (=> b!614785 m!591049))

(declare-fun m!591051 () Bool)

(assert (=> b!614785 m!591051))

(declare-fun m!591053 () Bool)

(assert (=> b!614785 m!591053))

(assert (=> b!614785 m!591011))

(declare-fun m!591055 () Bool)

(assert (=> b!614785 m!591055))

(declare-fun m!591057 () Bool)

(assert (=> b!614785 m!591057))

(assert (=> b!614807 m!591011))

(declare-fun m!591059 () Bool)

(assert (=> b!614807 m!591059))

(assert (=> b!614807 m!591053))

(assert (=> b!614807 m!591011))

(declare-fun m!591061 () Bool)

(assert (=> b!614807 m!591061))

(assert (=> b!614807 m!591011))

(assert (=> b!614807 m!591011))

(declare-fun m!591063 () Bool)

(assert (=> b!614807 m!591063))

(declare-fun m!591065 () Bool)

(assert (=> b!614807 m!591065))

(assert (=> b!614807 m!591011))

(declare-fun m!591067 () Bool)

(assert (=> b!614807 m!591067))

(declare-fun m!591069 () Bool)

(assert (=> b!614807 m!591069))

(assert (=> b!614807 m!591057))

(declare-fun m!591071 () Bool)

(assert (=> b!614794 m!591071))

(assert (=> b!614793 m!591011))

(assert (=> b!614793 m!591011))

(assert (=> b!614793 m!591061))

(assert (=> b!614792 m!591011))

(assert (=> b!614792 m!591011))

(declare-fun m!591073 () Bool)

(assert (=> b!614792 m!591073))

(assert (=> b!614795 m!591011))

(assert (=> b!614795 m!591011))

(assert (=> b!614795 m!591043))

(push 1)

