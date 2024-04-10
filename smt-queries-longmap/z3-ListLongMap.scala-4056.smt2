; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55566 () Bool)

(assert start!55566)

(declare-fun b!608106 () Bool)

(declare-fun res!390845 () Bool)

(declare-fun e!348261 () Bool)

(assert (=> b!608106 (=> res!390845 e!348261)))

(declare-datatypes ((List!11940 0))(
  ( (Nil!11937) (Cons!11936 (h!12981 (_ BitVec 64)) (t!18168 List!11940)) )
))
(declare-fun noDuplicate!322 (List!11940) Bool)

(assert (=> b!608106 (= res!390845 (not (noDuplicate!322 Nil!11937)))))

(declare-fun b!608107 () Bool)

(declare-fun e!348259 () Bool)

(declare-fun e!348250 () Bool)

(assert (=> b!608107 (= e!348259 e!348250)))

(declare-fun res!390833 () Bool)

(assert (=> b!608107 (=> (not res!390833) (not e!348250))))

(declare-datatypes ((array!37297 0))(
  ( (array!37298 (arr!17899 (Array (_ BitVec 32) (_ BitVec 64))) (size!18263 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37297)

(declare-fun lt!277747 () array!37297)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608107 (= res!390833 (arrayContainsKey!0 lt!277747 (select (arr!17899 a!2986) j!136) j!136))))

(declare-fun b!608108 () Bool)

(declare-fun res!390837 () Bool)

(assert (=> b!608108 (=> res!390837 e!348261)))

(declare-fun contains!3016 (List!11940 (_ BitVec 64)) Bool)

(assert (=> b!608108 (= res!390837 (contains!3016 Nil!11937 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608109 () Bool)

(declare-fun e!348257 () Bool)

(assert (=> b!608109 (= e!348257 e!348261)))

(declare-fun res!390827 () Bool)

(assert (=> b!608109 (=> res!390827 e!348261)))

(assert (=> b!608109 (= res!390827 (or (bvsge (size!18263 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18263 a!2986))))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!608109 (arrayContainsKey!0 lt!277747 (select (arr!17899 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!19414 0))(
  ( (Unit!19415) )
))
(declare-fun lt!277754 () Unit!19414)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37297 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19414)

(assert (=> b!608109 (= lt!277754 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277747 (select (arr!17899 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!348248 () Bool)

(assert (=> b!608109 e!348248))

(declare-fun res!390828 () Bool)

(assert (=> b!608109 (=> (not res!390828) (not e!348248))))

(assert (=> b!608109 (= res!390828 (arrayContainsKey!0 lt!277747 (select (arr!17899 a!2986) j!136) j!136))))

(declare-fun b!608110 () Bool)

(assert (=> b!608110 (= e!348250 (arrayContainsKey!0 lt!277747 (select (arr!17899 a!2986) j!136) index!984))))

(declare-fun b!608111 () Bool)

(declare-fun res!390835 () Bool)

(declare-fun e!348251 () Bool)

(assert (=> b!608111 (=> (not res!390835) (not e!348251))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!608111 (= res!390835 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608112 () Bool)

(declare-fun res!390844 () Bool)

(declare-fun e!348255 () Bool)

(assert (=> b!608112 (=> (not res!390844) (not e!348255))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37297 (_ BitVec 32)) Bool)

(assert (=> b!608112 (= res!390844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608114 () Bool)

(declare-fun e!348254 () Bool)

(declare-datatypes ((SeekEntryResult!6339 0))(
  ( (MissingZero!6339 (index!27631 (_ BitVec 32))) (Found!6339 (index!27632 (_ BitVec 32))) (Intermediate!6339 (undefined!7151 Bool) (index!27633 (_ BitVec 32)) (x!56440 (_ BitVec 32))) (Undefined!6339) (MissingVacant!6339 (index!27634 (_ BitVec 32))) )
))
(declare-fun lt!277759 () SeekEntryResult!6339)

(declare-fun lt!277746 () SeekEntryResult!6339)

(assert (=> b!608114 (= e!348254 (= lt!277759 lt!277746))))

(declare-fun b!608115 () Bool)

(declare-fun e!348258 () Unit!19414)

(declare-fun Unit!19416 () Unit!19414)

(assert (=> b!608115 (= e!348258 Unit!19416)))

(assert (=> b!608115 false))

(declare-fun b!608116 () Bool)

(declare-fun Unit!19417 () Unit!19414)

(assert (=> b!608116 (= e!348258 Unit!19417)))

(declare-fun b!608117 () Bool)

(declare-fun res!390847 () Bool)

(assert (=> b!608117 (=> (not res!390847) (not e!348255))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!608117 (= res!390847 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17899 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608118 () Bool)

(assert (=> b!608118 (= e!348248 (arrayContainsKey!0 lt!277747 (select (arr!17899 a!2986) j!136) index!984))))

(declare-fun b!608119 () Bool)

(declare-fun res!390834 () Bool)

(assert (=> b!608119 (=> (not res!390834) (not e!348251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608119 (= res!390834 (validKeyInArray!0 (select (arr!17899 a!2986) j!136)))))

(declare-fun b!608120 () Bool)

(declare-fun e!348249 () Bool)

(declare-fun e!348260 () Bool)

(assert (=> b!608120 (= e!348249 e!348260)))

(declare-fun res!390826 () Bool)

(assert (=> b!608120 (=> (not res!390826) (not e!348260))))

(assert (=> b!608120 (= res!390826 (and (= lt!277759 (Found!6339 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17899 a!2986) index!984) (select (arr!17899 a!2986) j!136))) (not (= (select (arr!17899 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37297 (_ BitVec 32)) SeekEntryResult!6339)

(assert (=> b!608120 (= lt!277759 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17899 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608121 () Bool)

(declare-fun e!348247 () Unit!19414)

(declare-fun Unit!19418 () Unit!19414)

(assert (=> b!608121 (= e!348247 Unit!19418)))

(declare-fun lt!277744 () Unit!19414)

(assert (=> b!608121 (= lt!277744 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277747 (select (arr!17899 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608121 (arrayContainsKey!0 lt!277747 (select (arr!17899 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!277752 () Unit!19414)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37297 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11940) Unit!19414)

(assert (=> b!608121 (= lt!277752 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11937))))

(declare-fun arrayNoDuplicates!0 (array!37297 (_ BitVec 32) List!11940) Bool)

(assert (=> b!608121 (arrayNoDuplicates!0 lt!277747 #b00000000000000000000000000000000 Nil!11937)))

(declare-fun lt!277751 () Unit!19414)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37297 (_ BitVec 32) (_ BitVec 32)) Unit!19414)

(assert (=> b!608121 (= lt!277751 (lemmaNoDuplicateFromThenFromBigger!0 lt!277747 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608121 (arrayNoDuplicates!0 lt!277747 j!136 Nil!11937)))

(declare-fun lt!277757 () Unit!19414)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37297 (_ BitVec 64) (_ BitVec 32) List!11940) Unit!19414)

(assert (=> b!608121 (= lt!277757 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277747 (select (arr!17899 a!2986) j!136) j!136 Nil!11937))))

(assert (=> b!608121 false))

(declare-fun b!608122 () Bool)

(assert (=> b!608122 (= e!348255 e!348249)))

(declare-fun res!390846 () Bool)

(assert (=> b!608122 (=> (not res!390846) (not e!348249))))

(assert (=> b!608122 (= res!390846 (= (select (store (arr!17899 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608122 (= lt!277747 (array!37298 (store (arr!17899 a!2986) i!1108 k0!1786) (size!18263 a!2986)))))

(declare-fun b!608123 () Bool)

(declare-fun e!348256 () Bool)

(assert (=> b!608123 (= e!348256 e!348257)))

(declare-fun res!390839 () Bool)

(assert (=> b!608123 (=> res!390839 e!348257)))

(assert (=> b!608123 (= res!390839 (bvsge index!984 j!136))))

(declare-fun lt!277753 () Unit!19414)

(assert (=> b!608123 (= lt!277753 e!348247)))

(declare-fun c!69008 () Bool)

(assert (=> b!608123 (= c!69008 (bvslt j!136 index!984))))

(declare-fun b!608124 () Bool)

(declare-fun e!348246 () Bool)

(assert (=> b!608124 (= e!348246 e!348259)))

(declare-fun res!390831 () Bool)

(assert (=> b!608124 (=> res!390831 e!348259)))

(declare-fun lt!277749 () (_ BitVec 64))

(declare-fun lt!277755 () (_ BitVec 64))

(assert (=> b!608124 (= res!390831 (or (not (= (select (arr!17899 a!2986) j!136) lt!277749)) (not (= (select (arr!17899 a!2986) j!136) lt!277755)) (bvsge j!136 index!984)))))

(declare-fun b!608125 () Bool)

(declare-fun res!390840 () Bool)

(assert (=> b!608125 (=> res!390840 e!348261)))

(assert (=> b!608125 (= res!390840 (contains!3016 Nil!11937 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608126 () Bool)

(assert (=> b!608126 (= e!348261 true)))

(declare-fun lt!277758 () Bool)

(assert (=> b!608126 (= lt!277758 (contains!3016 Nil!11937 k0!1786))))

(declare-fun b!608127 () Bool)

(declare-fun e!348253 () Bool)

(assert (=> b!608127 (= e!348253 e!348256)))

(declare-fun res!390832 () Bool)

(assert (=> b!608127 (=> res!390832 e!348256)))

(assert (=> b!608127 (= res!390832 (or (not (= (select (arr!17899 a!2986) j!136) lt!277749)) (not (= (select (arr!17899 a!2986) j!136) lt!277755))))))

(assert (=> b!608127 e!348246))

(declare-fun res!390842 () Bool)

(assert (=> b!608127 (=> (not res!390842) (not e!348246))))

(assert (=> b!608127 (= res!390842 (= lt!277755 (select (arr!17899 a!2986) j!136)))))

(assert (=> b!608127 (= lt!277755 (select (store (arr!17899 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!390838 () Bool)

(assert (=> start!55566 (=> (not res!390838) (not e!348251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55566 (= res!390838 (validMask!0 mask!3053))))

(assert (=> start!55566 e!348251))

(assert (=> start!55566 true))

(declare-fun array_inv!13695 (array!37297) Bool)

(assert (=> start!55566 (array_inv!13695 a!2986)))

(declare-fun b!608113 () Bool)

(declare-fun res!390830 () Bool)

(assert (=> b!608113 (=> (not res!390830) (not e!348255))))

(assert (=> b!608113 (= res!390830 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11937))))

(declare-fun b!608128 () Bool)

(declare-fun res!390843 () Bool)

(assert (=> b!608128 (=> (not res!390843) (not e!348251))))

(assert (=> b!608128 (= res!390843 (and (= (size!18263 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18263 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18263 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608129 () Bool)

(assert (=> b!608129 (= e!348260 (not e!348253))))

(declare-fun res!390836 () Bool)

(assert (=> b!608129 (=> res!390836 e!348253)))

(declare-fun lt!277748 () SeekEntryResult!6339)

(assert (=> b!608129 (= res!390836 (not (= lt!277748 (Found!6339 index!984))))))

(declare-fun lt!277745 () Unit!19414)

(assert (=> b!608129 (= lt!277745 e!348258)))

(declare-fun c!69007 () Bool)

(assert (=> b!608129 (= c!69007 (= lt!277748 Undefined!6339))))

(assert (=> b!608129 (= lt!277748 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277749 lt!277747 mask!3053))))

(assert (=> b!608129 e!348254))

(declare-fun res!390829 () Bool)

(assert (=> b!608129 (=> (not res!390829) (not e!348254))))

(declare-fun lt!277756 () (_ BitVec 32))

(assert (=> b!608129 (= res!390829 (= lt!277746 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277756 vacantSpotIndex!68 lt!277749 lt!277747 mask!3053)))))

(assert (=> b!608129 (= lt!277746 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277756 vacantSpotIndex!68 (select (arr!17899 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608129 (= lt!277749 (select (store (arr!17899 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277743 () Unit!19414)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37297 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19414)

(assert (=> b!608129 (= lt!277743 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277756 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608129 (= lt!277756 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!608130 () Bool)

(declare-fun Unit!19419 () Unit!19414)

(assert (=> b!608130 (= e!348247 Unit!19419)))

(declare-fun b!608131 () Bool)

(assert (=> b!608131 (= e!348251 e!348255)))

(declare-fun res!390841 () Bool)

(assert (=> b!608131 (=> (not res!390841) (not e!348255))))

(declare-fun lt!277750 () SeekEntryResult!6339)

(assert (=> b!608131 (= res!390841 (or (= lt!277750 (MissingZero!6339 i!1108)) (= lt!277750 (MissingVacant!6339 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37297 (_ BitVec 32)) SeekEntryResult!6339)

(assert (=> b!608131 (= lt!277750 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!608132 () Bool)

(declare-fun res!390848 () Bool)

(assert (=> b!608132 (=> (not res!390848) (not e!348251))))

(assert (=> b!608132 (= res!390848 (validKeyInArray!0 k0!1786))))

(assert (= (and start!55566 res!390838) b!608128))

(assert (= (and b!608128 res!390843) b!608119))

(assert (= (and b!608119 res!390834) b!608132))

(assert (= (and b!608132 res!390848) b!608111))

(assert (= (and b!608111 res!390835) b!608131))

(assert (= (and b!608131 res!390841) b!608112))

(assert (= (and b!608112 res!390844) b!608113))

(assert (= (and b!608113 res!390830) b!608117))

(assert (= (and b!608117 res!390847) b!608122))

(assert (= (and b!608122 res!390846) b!608120))

(assert (= (and b!608120 res!390826) b!608129))

(assert (= (and b!608129 res!390829) b!608114))

(assert (= (and b!608129 c!69007) b!608115))

(assert (= (and b!608129 (not c!69007)) b!608116))

(assert (= (and b!608129 (not res!390836)) b!608127))

(assert (= (and b!608127 res!390842) b!608124))

(assert (= (and b!608124 (not res!390831)) b!608107))

(assert (= (and b!608107 res!390833) b!608110))

(assert (= (and b!608127 (not res!390832)) b!608123))

(assert (= (and b!608123 c!69008) b!608121))

(assert (= (and b!608123 (not c!69008)) b!608130))

(assert (= (and b!608123 (not res!390839)) b!608109))

(assert (= (and b!608109 res!390828) b!608118))

(assert (= (and b!608109 (not res!390827)) b!608106))

(assert (= (and b!608106 (not res!390845)) b!608108))

(assert (= (and b!608108 (not res!390837)) b!608125))

(assert (= (and b!608125 (not res!390840)) b!608126))

(declare-fun m!584771 () Bool)

(assert (=> b!608121 m!584771))

(declare-fun m!584773 () Bool)

(assert (=> b!608121 m!584773))

(declare-fun m!584775 () Bool)

(assert (=> b!608121 m!584775))

(assert (=> b!608121 m!584773))

(declare-fun m!584777 () Bool)

(assert (=> b!608121 m!584777))

(declare-fun m!584779 () Bool)

(assert (=> b!608121 m!584779))

(declare-fun m!584781 () Bool)

(assert (=> b!608121 m!584781))

(declare-fun m!584783 () Bool)

(assert (=> b!608121 m!584783))

(assert (=> b!608121 m!584773))

(declare-fun m!584785 () Bool)

(assert (=> b!608121 m!584785))

(assert (=> b!608121 m!584773))

(declare-fun m!584787 () Bool)

(assert (=> b!608131 m!584787))

(assert (=> b!608127 m!584773))

(declare-fun m!584789 () Bool)

(assert (=> b!608127 m!584789))

(declare-fun m!584791 () Bool)

(assert (=> b!608127 m!584791))

(declare-fun m!584793 () Bool)

(assert (=> b!608129 m!584793))

(declare-fun m!584795 () Bool)

(assert (=> b!608129 m!584795))

(declare-fun m!584797 () Bool)

(assert (=> b!608129 m!584797))

(assert (=> b!608129 m!584789))

(declare-fun m!584799 () Bool)

(assert (=> b!608129 m!584799))

(declare-fun m!584801 () Bool)

(assert (=> b!608129 m!584801))

(assert (=> b!608129 m!584773))

(assert (=> b!608129 m!584773))

(declare-fun m!584803 () Bool)

(assert (=> b!608129 m!584803))

(declare-fun m!584805 () Bool)

(assert (=> b!608132 m!584805))

(declare-fun m!584807 () Bool)

(assert (=> b!608117 m!584807))

(assert (=> b!608122 m!584789))

(declare-fun m!584809 () Bool)

(assert (=> b!608122 m!584809))

(assert (=> b!608109 m!584773))

(assert (=> b!608109 m!584773))

(declare-fun m!584811 () Bool)

(assert (=> b!608109 m!584811))

(assert (=> b!608109 m!584773))

(declare-fun m!584813 () Bool)

(assert (=> b!608109 m!584813))

(assert (=> b!608109 m!584773))

(declare-fun m!584815 () Bool)

(assert (=> b!608109 m!584815))

(declare-fun m!584817 () Bool)

(assert (=> b!608106 m!584817))

(assert (=> b!608107 m!584773))

(assert (=> b!608107 m!584773))

(assert (=> b!608107 m!584815))

(declare-fun m!584819 () Bool)

(assert (=> b!608111 m!584819))

(declare-fun m!584821 () Bool)

(assert (=> b!608125 m!584821))

(assert (=> b!608110 m!584773))

(assert (=> b!608110 m!584773))

(declare-fun m!584823 () Bool)

(assert (=> b!608110 m!584823))

(assert (=> b!608124 m!584773))

(declare-fun m!584825 () Bool)

(assert (=> b!608120 m!584825))

(assert (=> b!608120 m!584773))

(assert (=> b!608120 m!584773))

(declare-fun m!584827 () Bool)

(assert (=> b!608120 m!584827))

(assert (=> b!608118 m!584773))

(assert (=> b!608118 m!584773))

(assert (=> b!608118 m!584823))

(declare-fun m!584829 () Bool)

(assert (=> start!55566 m!584829))

(declare-fun m!584831 () Bool)

(assert (=> start!55566 m!584831))

(assert (=> b!608119 m!584773))

(assert (=> b!608119 m!584773))

(declare-fun m!584833 () Bool)

(assert (=> b!608119 m!584833))

(declare-fun m!584835 () Bool)

(assert (=> b!608112 m!584835))

(declare-fun m!584837 () Bool)

(assert (=> b!608126 m!584837))

(declare-fun m!584839 () Bool)

(assert (=> b!608108 m!584839))

(declare-fun m!584841 () Bool)

(assert (=> b!608113 m!584841))

(check-sat (not b!608112) (not b!608131) (not b!608113) (not b!608111) (not b!608108) (not b!608121) (not b!608119) (not b!608107) (not b!608120) (not b!608109) (not b!608118) (not b!608125) (not b!608129) (not b!608132) (not b!608106) (not b!608126) (not start!55566) (not b!608110))
(check-sat)
