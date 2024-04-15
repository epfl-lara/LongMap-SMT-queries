; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54864 () Bool)

(assert start!54864)

(declare-fun b!600046 () Bool)

(declare-fun e!343050 () Bool)

(declare-fun e!343048 () Bool)

(assert (=> b!600046 (= e!343050 e!343048)))

(declare-fun res!385084 () Bool)

(assert (=> b!600046 (=> res!385084 e!343048)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!272822 () (_ BitVec 64))

(declare-fun lt!272830 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37113 0))(
  ( (array!37114 (arr!17816 (Array (_ BitVec 32) (_ BitVec 64))) (size!18181 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37113)

(assert (=> b!600046 (= res!385084 (or (not (= (select (arr!17816 a!2986) j!136) lt!272822)) (not (= (select (arr!17816 a!2986) j!136) lt!272830)) (bvsge j!136 index!984)))))

(declare-fun e!343055 () Bool)

(assert (=> b!600046 e!343055))

(declare-fun res!385098 () Bool)

(assert (=> b!600046 (=> (not res!385098) (not e!343055))))

(assert (=> b!600046 (= res!385098 (= lt!272830 (select (arr!17816 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!600046 (= lt!272830 (select (store (arr!17816 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!600047 () Bool)

(declare-fun res!385089 () Bool)

(declare-fun e!343053 () Bool)

(assert (=> b!600047 (=> (not res!385089) (not e!343053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600047 (= res!385089 (validKeyInArray!0 k0!1786))))

(declare-fun b!600048 () Bool)

(declare-datatypes ((Unit!18924 0))(
  ( (Unit!18925) )
))
(declare-fun e!343058 () Unit!18924)

(declare-fun Unit!18926 () Unit!18924)

(assert (=> b!600048 (= e!343058 Unit!18926)))

(declare-fun b!600049 () Bool)

(declare-fun res!385090 () Bool)

(declare-fun e!343051 () Bool)

(assert (=> b!600049 (=> res!385090 e!343051)))

(declare-datatypes ((List!11896 0))(
  ( (Nil!11893) (Cons!11892 (h!12937 (_ BitVec 64)) (t!18115 List!11896)) )
))
(declare-fun contains!2961 (List!11896 (_ BitVec 64)) Bool)

(assert (=> b!600049 (= res!385090 (contains!2961 Nil!11893 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600050 () Bool)

(declare-fun res!385092 () Bool)

(declare-fun e!343052 () Bool)

(assert (=> b!600050 (=> (not res!385092) (not e!343052))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!600050 (= res!385092 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17816 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600052 () Bool)

(declare-fun res!385102 () Bool)

(assert (=> b!600052 (=> (not res!385102) (not e!343052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37113 (_ BitVec 32)) Bool)

(assert (=> b!600052 (= res!385102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600053 () Bool)

(assert (=> b!600053 (= e!343053 e!343052)))

(declare-fun res!385101 () Bool)

(assert (=> b!600053 (=> (not res!385101) (not e!343052))))

(declare-datatypes ((SeekEntryResult!6253 0))(
  ( (MissingZero!6253 (index!27269 (_ BitVec 32))) (Found!6253 (index!27270 (_ BitVec 32))) (Intermediate!6253 (undefined!7065 Bool) (index!27271 (_ BitVec 32)) (x!56079 (_ BitVec 32))) (Undefined!6253) (MissingVacant!6253 (index!27272 (_ BitVec 32))) )
))
(declare-fun lt!272833 () SeekEntryResult!6253)

(assert (=> b!600053 (= res!385101 (or (= lt!272833 (MissingZero!6253 i!1108)) (= lt!272833 (MissingVacant!6253 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37113 (_ BitVec 32)) SeekEntryResult!6253)

(assert (=> b!600053 (= lt!272833 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!600054 () Bool)

(declare-fun res!385099 () Bool)

(assert (=> b!600054 (=> (not res!385099) (not e!343053))))

(assert (=> b!600054 (= res!385099 (validKeyInArray!0 (select (arr!17816 a!2986) j!136)))))

(declare-fun b!600055 () Bool)

(declare-fun res!385103 () Bool)

(assert (=> b!600055 (=> (not res!385103) (not e!343052))))

(declare-fun arrayNoDuplicates!0 (array!37113 (_ BitVec 32) List!11896) Bool)

(assert (=> b!600055 (= res!385103 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11893))))

(declare-fun b!600056 () Bool)

(declare-fun res!385088 () Bool)

(assert (=> b!600056 (=> (not res!385088) (not e!343053))))

(declare-fun arrayContainsKey!0 (array!37113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600056 (= res!385088 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600057 () Bool)

(assert (=> b!600057 (= e!343051 true)))

(declare-fun lt!272831 () Bool)

(assert (=> b!600057 (= lt!272831 (contains!2961 Nil!11893 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600058 () Bool)

(declare-fun e!343054 () Bool)

(assert (=> b!600058 (= e!343054 (not e!343050))))

(declare-fun res!385097 () Bool)

(assert (=> b!600058 (=> res!385097 e!343050)))

(declare-fun lt!272821 () SeekEntryResult!6253)

(assert (=> b!600058 (= res!385097 (not (= lt!272821 (Found!6253 index!984))))))

(declare-fun lt!272825 () Unit!18924)

(assert (=> b!600058 (= lt!272825 e!343058)))

(declare-fun c!67848 () Bool)

(assert (=> b!600058 (= c!67848 (= lt!272821 Undefined!6253))))

(declare-fun lt!272826 () array!37113)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37113 (_ BitVec 32)) SeekEntryResult!6253)

(assert (=> b!600058 (= lt!272821 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272822 lt!272826 mask!3053))))

(declare-fun e!343057 () Bool)

(assert (=> b!600058 e!343057))

(declare-fun res!385086 () Bool)

(assert (=> b!600058 (=> (not res!385086) (not e!343057))))

(declare-fun lt!272823 () SeekEntryResult!6253)

(declare-fun lt!272832 () (_ BitVec 32))

(assert (=> b!600058 (= res!385086 (= lt!272823 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272832 vacantSpotIndex!68 lt!272822 lt!272826 mask!3053)))))

(assert (=> b!600058 (= lt!272823 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272832 vacantSpotIndex!68 (select (arr!17816 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600058 (= lt!272822 (select (store (arr!17816 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272820 () Unit!18924)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37113 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18924)

(assert (=> b!600058 (= lt!272820 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272832 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600058 (= lt!272832 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!600059 () Bool)

(assert (=> b!600059 (= e!343048 e!343051)))

(declare-fun res!385091 () Bool)

(assert (=> b!600059 (=> res!385091 e!343051)))

(assert (=> b!600059 (= res!385091 (or (bvsge (size!18181 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18181 a!2986))))))

(assert (=> b!600059 (arrayNoDuplicates!0 lt!272826 j!136 Nil!11893)))

(declare-fun lt!272828 () Unit!18924)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37113 (_ BitVec 32) (_ BitVec 32)) Unit!18924)

(assert (=> b!600059 (= lt!272828 (lemmaNoDuplicateFromThenFromBigger!0 lt!272826 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600059 (arrayNoDuplicates!0 lt!272826 #b00000000000000000000000000000000 Nil!11893)))

(declare-fun lt!272824 () Unit!18924)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37113 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11896) Unit!18924)

(assert (=> b!600059 (= lt!272824 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11893))))

(assert (=> b!600059 (arrayContainsKey!0 lt!272826 (select (arr!17816 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272829 () Unit!18924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37113 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18924)

(assert (=> b!600059 (= lt!272829 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272826 (select (arr!17816 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600060 () Bool)

(declare-fun lt!272827 () SeekEntryResult!6253)

(assert (=> b!600060 (= e!343057 (= lt!272827 lt!272823))))

(declare-fun b!600061 () Bool)

(declare-fun e!343059 () Bool)

(assert (=> b!600061 (= e!343059 (arrayContainsKey!0 lt!272826 (select (arr!17816 a!2986) j!136) index!984))))

(declare-fun b!600062 () Bool)

(declare-fun e!343049 () Bool)

(assert (=> b!600062 (= e!343055 e!343049)))

(declare-fun res!385087 () Bool)

(assert (=> b!600062 (=> res!385087 e!343049)))

(assert (=> b!600062 (= res!385087 (or (not (= (select (arr!17816 a!2986) j!136) lt!272822)) (not (= (select (arr!17816 a!2986) j!136) lt!272830)) (bvsge j!136 index!984)))))

(declare-fun b!600063 () Bool)

(declare-fun res!385096 () Bool)

(assert (=> b!600063 (=> (not res!385096) (not e!343053))))

(assert (=> b!600063 (= res!385096 (and (= (size!18181 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18181 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18181 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!385100 () Bool)

(assert (=> start!54864 (=> (not res!385100) (not e!343053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54864 (= res!385100 (validMask!0 mask!3053))))

(assert (=> start!54864 e!343053))

(assert (=> start!54864 true))

(declare-fun array_inv!13699 (array!37113) Bool)

(assert (=> start!54864 (array_inv!13699 a!2986)))

(declare-fun b!600051 () Bool)

(assert (=> b!600051 (= e!343049 e!343059)))

(declare-fun res!385095 () Bool)

(assert (=> b!600051 (=> (not res!385095) (not e!343059))))

(assert (=> b!600051 (= res!385095 (arrayContainsKey!0 lt!272826 (select (arr!17816 a!2986) j!136) j!136))))

(declare-fun b!600064 () Bool)

(declare-fun e!343056 () Bool)

(assert (=> b!600064 (= e!343052 e!343056)))

(declare-fun res!385094 () Bool)

(assert (=> b!600064 (=> (not res!385094) (not e!343056))))

(assert (=> b!600064 (= res!385094 (= (select (store (arr!17816 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600064 (= lt!272826 (array!37114 (store (arr!17816 a!2986) i!1108 k0!1786) (size!18181 a!2986)))))

(declare-fun b!600065 () Bool)

(declare-fun res!385093 () Bool)

(assert (=> b!600065 (=> res!385093 e!343051)))

(declare-fun noDuplicate!296 (List!11896) Bool)

(assert (=> b!600065 (= res!385093 (not (noDuplicate!296 Nil!11893)))))

(declare-fun b!600066 () Bool)

(assert (=> b!600066 (= e!343056 e!343054)))

(declare-fun res!385085 () Bool)

(assert (=> b!600066 (=> (not res!385085) (not e!343054))))

(assert (=> b!600066 (= res!385085 (and (= lt!272827 (Found!6253 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17816 a!2986) index!984) (select (arr!17816 a!2986) j!136))) (not (= (select (arr!17816 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!600066 (= lt!272827 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17816 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600067 () Bool)

(declare-fun Unit!18927 () Unit!18924)

(assert (=> b!600067 (= e!343058 Unit!18927)))

(assert (=> b!600067 false))

(assert (= (and start!54864 res!385100) b!600063))

(assert (= (and b!600063 res!385096) b!600054))

(assert (= (and b!600054 res!385099) b!600047))

(assert (= (and b!600047 res!385089) b!600056))

(assert (= (and b!600056 res!385088) b!600053))

(assert (= (and b!600053 res!385101) b!600052))

(assert (= (and b!600052 res!385102) b!600055))

(assert (= (and b!600055 res!385103) b!600050))

(assert (= (and b!600050 res!385092) b!600064))

(assert (= (and b!600064 res!385094) b!600066))

(assert (= (and b!600066 res!385085) b!600058))

(assert (= (and b!600058 res!385086) b!600060))

(assert (= (and b!600058 c!67848) b!600067))

(assert (= (and b!600058 (not c!67848)) b!600048))

(assert (= (and b!600058 (not res!385097)) b!600046))

(assert (= (and b!600046 res!385098) b!600062))

(assert (= (and b!600062 (not res!385087)) b!600051))

(assert (= (and b!600051 res!385095) b!600061))

(assert (= (and b!600046 (not res!385084)) b!600059))

(assert (= (and b!600059 (not res!385091)) b!600065))

(assert (= (and b!600065 (not res!385093)) b!600049))

(assert (= (and b!600049 (not res!385090)) b!600057))

(declare-fun m!576769 () Bool)

(assert (=> b!600062 m!576769))

(assert (=> b!600046 m!576769))

(declare-fun m!576771 () Bool)

(assert (=> b!600046 m!576771))

(declare-fun m!576773 () Bool)

(assert (=> b!600046 m!576773))

(declare-fun m!576775 () Bool)

(assert (=> b!600055 m!576775))

(declare-fun m!576777 () Bool)

(assert (=> b!600065 m!576777))

(declare-fun m!576779 () Bool)

(assert (=> b!600053 m!576779))

(assert (=> b!600054 m!576769))

(assert (=> b!600054 m!576769))

(declare-fun m!576781 () Bool)

(assert (=> b!600054 m!576781))

(declare-fun m!576783 () Bool)

(assert (=> start!54864 m!576783))

(declare-fun m!576785 () Bool)

(assert (=> start!54864 m!576785))

(declare-fun m!576787 () Bool)

(assert (=> b!600058 m!576787))

(assert (=> b!600058 m!576769))

(assert (=> b!600058 m!576771))

(assert (=> b!600058 m!576769))

(declare-fun m!576789 () Bool)

(assert (=> b!600058 m!576789))

(declare-fun m!576791 () Bool)

(assert (=> b!600058 m!576791))

(declare-fun m!576793 () Bool)

(assert (=> b!600058 m!576793))

(declare-fun m!576795 () Bool)

(assert (=> b!600058 m!576795))

(declare-fun m!576797 () Bool)

(assert (=> b!600058 m!576797))

(declare-fun m!576799 () Bool)

(assert (=> b!600057 m!576799))

(assert (=> b!600061 m!576769))

(assert (=> b!600061 m!576769))

(declare-fun m!576801 () Bool)

(assert (=> b!600061 m!576801))

(declare-fun m!576803 () Bool)

(assert (=> b!600050 m!576803))

(declare-fun m!576805 () Bool)

(assert (=> b!600056 m!576805))

(assert (=> b!600059 m!576769))

(declare-fun m!576807 () Bool)

(assert (=> b!600059 m!576807))

(declare-fun m!576809 () Bool)

(assert (=> b!600059 m!576809))

(declare-fun m!576811 () Bool)

(assert (=> b!600059 m!576811))

(declare-fun m!576813 () Bool)

(assert (=> b!600059 m!576813))

(assert (=> b!600059 m!576769))

(declare-fun m!576815 () Bool)

(assert (=> b!600059 m!576815))

(declare-fun m!576817 () Bool)

(assert (=> b!600059 m!576817))

(assert (=> b!600059 m!576769))

(declare-fun m!576819 () Bool)

(assert (=> b!600052 m!576819))

(assert (=> b!600051 m!576769))

(assert (=> b!600051 m!576769))

(declare-fun m!576821 () Bool)

(assert (=> b!600051 m!576821))

(declare-fun m!576823 () Bool)

(assert (=> b!600066 m!576823))

(assert (=> b!600066 m!576769))

(assert (=> b!600066 m!576769))

(declare-fun m!576825 () Bool)

(assert (=> b!600066 m!576825))

(declare-fun m!576827 () Bool)

(assert (=> b!600049 m!576827))

(declare-fun m!576829 () Bool)

(assert (=> b!600047 m!576829))

(assert (=> b!600064 m!576771))

(declare-fun m!576831 () Bool)

(assert (=> b!600064 m!576831))

(check-sat (not b!600058) (not b!600054) (not b!600051) (not b!600066) (not b!600055) (not b!600047) (not b!600065) (not b!600049) (not b!600056) (not b!600061) (not start!54864) (not b!600053) (not b!600052) (not b!600057) (not b!600059))
(check-sat)
