; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54828 () Bool)

(assert start!54828)

(declare-fun b!598694 () Bool)

(declare-fun res!383761 () Bool)

(declare-fun e!342242 () Bool)

(assert (=> b!598694 (=> (not res!383761) (not e!342242))))

(declare-datatypes ((array!37063 0))(
  ( (array!37064 (arr!17791 (Array (_ BitVec 32) (_ BitVec 64))) (size!18155 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37063)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37063 (_ BitVec 32)) Bool)

(assert (=> b!598694 (= res!383761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598695 () Bool)

(declare-fun e!342239 () Bool)

(declare-fun e!342238 () Bool)

(assert (=> b!598695 (= e!342239 e!342238)))

(declare-fun res!383748 () Bool)

(assert (=> b!598695 (=> res!383748 e!342238)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!272029 () (_ BitVec 64))

(declare-fun lt!272034 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!598695 (= res!383748 (or (not (= (select (arr!17791 a!2986) j!136) lt!272029)) (not (= (select (arr!17791 a!2986) j!136) lt!272034)) (bvsge j!136 index!984)))))

(declare-fun b!598696 () Bool)

(declare-fun e!342247 () Bool)

(assert (=> b!598696 (= e!342247 e!342242)))

(declare-fun res!383746 () Bool)

(assert (=> b!598696 (=> (not res!383746) (not e!342242))))

(declare-datatypes ((SeekEntryResult!6231 0))(
  ( (MissingZero!6231 (index!27181 (_ BitVec 32))) (Found!6231 (index!27182 (_ BitVec 32))) (Intermediate!6231 (undefined!7043 Bool) (index!27183 (_ BitVec 32)) (x!55990 (_ BitVec 32))) (Undefined!6231) (MissingVacant!6231 (index!27184 (_ BitVec 32))) )
))
(declare-fun lt!272027 () SeekEntryResult!6231)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!598696 (= res!383746 (or (= lt!272027 (MissingZero!6231 i!1108)) (= lt!272027 (MissingVacant!6231 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37063 (_ BitVec 32)) SeekEntryResult!6231)

(assert (=> b!598696 (= lt!272027 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!598697 () Bool)

(declare-fun res!383755 () Bool)

(assert (=> b!598697 (=> (not res!383755) (not e!342247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598697 (= res!383755 (validKeyInArray!0 k0!1786))))

(declare-fun b!598698 () Bool)

(declare-fun e!342249 () Bool)

(declare-fun e!342244 () Bool)

(assert (=> b!598698 (= e!342249 e!342244)))

(declare-fun res!383758 () Bool)

(assert (=> b!598698 (=> (not res!383758) (not e!342244))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!272026 () SeekEntryResult!6231)

(assert (=> b!598698 (= res!383758 (and (= lt!272026 (Found!6231 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17791 a!2986) index!984) (select (arr!17791 a!2986) j!136))) (not (= (select (arr!17791 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37063 (_ BitVec 32)) SeekEntryResult!6231)

(assert (=> b!598698 (= lt!272026 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17791 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598699 () Bool)

(declare-fun res!383751 () Bool)

(assert (=> b!598699 (=> (not res!383751) (not e!342247))))

(assert (=> b!598699 (= res!383751 (validKeyInArray!0 (select (arr!17791 a!2986) j!136)))))

(declare-fun b!598700 () Bool)

(declare-fun res!383760 () Bool)

(assert (=> b!598700 (=> (not res!383760) (not e!342247))))

(declare-fun arrayContainsKey!0 (array!37063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598700 (= res!383760 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598701 () Bool)

(declare-fun e!342243 () Bool)

(assert (=> b!598701 (= e!342244 (not e!342243))))

(declare-fun res!383754 () Bool)

(assert (=> b!598701 (=> res!383754 e!342243)))

(declare-fun lt!272025 () SeekEntryResult!6231)

(assert (=> b!598701 (= res!383754 (not (= lt!272025 (Found!6231 index!984))))))

(declare-datatypes ((Unit!18842 0))(
  ( (Unit!18843) )
))
(declare-fun lt!272028 () Unit!18842)

(declare-fun e!342240 () Unit!18842)

(assert (=> b!598701 (= lt!272028 e!342240)))

(declare-fun c!67841 () Bool)

(assert (=> b!598701 (= c!67841 (= lt!272025 Undefined!6231))))

(declare-fun lt!272030 () array!37063)

(assert (=> b!598701 (= lt!272025 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272029 lt!272030 mask!3053))))

(declare-fun e!342241 () Bool)

(assert (=> b!598701 e!342241))

(declare-fun res!383750 () Bool)

(assert (=> b!598701 (=> (not res!383750) (not e!342241))))

(declare-fun lt!272035 () SeekEntryResult!6231)

(declare-fun lt!272031 () (_ BitVec 32))

(assert (=> b!598701 (= res!383750 (= lt!272035 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272031 vacantSpotIndex!68 lt!272029 lt!272030 mask!3053)))))

(assert (=> b!598701 (= lt!272035 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272031 vacantSpotIndex!68 (select (arr!17791 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!598701 (= lt!272029 (select (store (arr!17791 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272032 () Unit!18842)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37063 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18842)

(assert (=> b!598701 (= lt!272032 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272031 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598701 (= lt!272031 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!598702 () Bool)

(assert (=> b!598702 (= e!342242 e!342249)))

(declare-fun res!383759 () Bool)

(assert (=> b!598702 (=> (not res!383759) (not e!342249))))

(assert (=> b!598702 (= res!383759 (= (select (store (arr!17791 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598702 (= lt!272030 (array!37064 (store (arr!17791 a!2986) i!1108 k0!1786) (size!18155 a!2986)))))

(declare-fun b!598703 () Bool)

(assert (=> b!598703 (= e!342241 (= lt!272026 lt!272035))))

(declare-fun b!598704 () Bool)

(declare-fun e!342245 () Bool)

(assert (=> b!598704 (= e!342243 e!342245)))

(declare-fun res!383752 () Bool)

(assert (=> b!598704 (=> res!383752 e!342245)))

(assert (=> b!598704 (= res!383752 (or (not (= (select (arr!17791 a!2986) j!136) lt!272029)) (not (= (select (arr!17791 a!2986) j!136) lt!272034)) (bvsge j!136 index!984)))))

(assert (=> b!598704 e!342239))

(declare-fun res!383753 () Bool)

(assert (=> b!598704 (=> (not res!383753) (not e!342239))))

(assert (=> b!598704 (= res!383753 (= lt!272034 (select (arr!17791 a!2986) j!136)))))

(assert (=> b!598704 (= lt!272034 (select (store (arr!17791 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!598705 () Bool)

(declare-fun e!342246 () Bool)

(assert (=> b!598705 (= e!342238 e!342246)))

(declare-fun res!383756 () Bool)

(assert (=> b!598705 (=> (not res!383756) (not e!342246))))

(assert (=> b!598705 (= res!383756 (arrayContainsKey!0 lt!272030 (select (arr!17791 a!2986) j!136) j!136))))

(declare-fun b!598707 () Bool)

(assert (=> b!598707 (= e!342245 true)))

(declare-datatypes ((List!11832 0))(
  ( (Nil!11829) (Cons!11828 (h!12873 (_ BitVec 64)) (t!18060 List!11832)) )
))
(declare-fun arrayNoDuplicates!0 (array!37063 (_ BitVec 32) List!11832) Bool)

(assert (=> b!598707 (arrayNoDuplicates!0 lt!272030 #b00000000000000000000000000000000 Nil!11829)))

(declare-fun lt!272024 () Unit!18842)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37063 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11832) Unit!18842)

(assert (=> b!598707 (= lt!272024 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11829))))

(assert (=> b!598707 (arrayContainsKey!0 lt!272030 (select (arr!17791 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272033 () Unit!18842)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37063 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18842)

(assert (=> b!598707 (= lt!272033 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272030 (select (arr!17791 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598708 () Bool)

(declare-fun Unit!18844 () Unit!18842)

(assert (=> b!598708 (= e!342240 Unit!18844)))

(assert (=> b!598708 false))

(declare-fun b!598709 () Bool)

(declare-fun res!383757 () Bool)

(assert (=> b!598709 (=> (not res!383757) (not e!342247))))

(assert (=> b!598709 (= res!383757 (and (= (size!18155 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18155 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18155 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598710 () Bool)

(declare-fun Unit!18845 () Unit!18842)

(assert (=> b!598710 (= e!342240 Unit!18845)))

(declare-fun b!598711 () Bool)

(assert (=> b!598711 (= e!342246 (arrayContainsKey!0 lt!272030 (select (arr!17791 a!2986) j!136) index!984))))

(declare-fun b!598712 () Bool)

(declare-fun res!383749 () Bool)

(assert (=> b!598712 (=> (not res!383749) (not e!342242))))

(assert (=> b!598712 (= res!383749 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11829))))

(declare-fun b!598706 () Bool)

(declare-fun res!383762 () Bool)

(assert (=> b!598706 (=> (not res!383762) (not e!342242))))

(assert (=> b!598706 (= res!383762 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17791 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!383747 () Bool)

(assert (=> start!54828 (=> (not res!383747) (not e!342247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54828 (= res!383747 (validMask!0 mask!3053))))

(assert (=> start!54828 e!342247))

(assert (=> start!54828 true))

(declare-fun array_inv!13587 (array!37063) Bool)

(assert (=> start!54828 (array_inv!13587 a!2986)))

(assert (= (and start!54828 res!383747) b!598709))

(assert (= (and b!598709 res!383757) b!598699))

(assert (= (and b!598699 res!383751) b!598697))

(assert (= (and b!598697 res!383755) b!598700))

(assert (= (and b!598700 res!383760) b!598696))

(assert (= (and b!598696 res!383746) b!598694))

(assert (= (and b!598694 res!383761) b!598712))

(assert (= (and b!598712 res!383749) b!598706))

(assert (= (and b!598706 res!383762) b!598702))

(assert (= (and b!598702 res!383759) b!598698))

(assert (= (and b!598698 res!383758) b!598701))

(assert (= (and b!598701 res!383750) b!598703))

(assert (= (and b!598701 c!67841) b!598708))

(assert (= (and b!598701 (not c!67841)) b!598710))

(assert (= (and b!598701 (not res!383754)) b!598704))

(assert (= (and b!598704 res!383753) b!598695))

(assert (= (and b!598695 (not res!383748)) b!598705))

(assert (= (and b!598705 res!383756) b!598711))

(assert (= (and b!598704 (not res!383752)) b!598707))

(declare-fun m!575987 () Bool)

(assert (=> b!598702 m!575987))

(declare-fun m!575989 () Bool)

(assert (=> b!598702 m!575989))

(declare-fun m!575991 () Bool)

(assert (=> b!598701 m!575991))

(declare-fun m!575993 () Bool)

(assert (=> b!598701 m!575993))

(declare-fun m!575995 () Bool)

(assert (=> b!598701 m!575995))

(declare-fun m!575997 () Bool)

(assert (=> b!598701 m!575997))

(assert (=> b!598701 m!575987))

(declare-fun m!575999 () Bool)

(assert (=> b!598701 m!575999))

(declare-fun m!576001 () Bool)

(assert (=> b!598701 m!576001))

(assert (=> b!598701 m!575995))

(declare-fun m!576003 () Bool)

(assert (=> b!598701 m!576003))

(assert (=> b!598705 m!575995))

(assert (=> b!598705 m!575995))

(declare-fun m!576005 () Bool)

(assert (=> b!598705 m!576005))

(declare-fun m!576007 () Bool)

(assert (=> b!598696 m!576007))

(assert (=> b!598699 m!575995))

(assert (=> b!598699 m!575995))

(declare-fun m!576009 () Bool)

(assert (=> b!598699 m!576009))

(declare-fun m!576011 () Bool)

(assert (=> b!598698 m!576011))

(assert (=> b!598698 m!575995))

(assert (=> b!598698 m!575995))

(declare-fun m!576013 () Bool)

(assert (=> b!598698 m!576013))

(assert (=> b!598711 m!575995))

(assert (=> b!598711 m!575995))

(declare-fun m!576015 () Bool)

(assert (=> b!598711 m!576015))

(declare-fun m!576017 () Bool)

(assert (=> b!598712 m!576017))

(assert (=> b!598695 m!575995))

(declare-fun m!576019 () Bool)

(assert (=> b!598697 m!576019))

(declare-fun m!576021 () Bool)

(assert (=> b!598694 m!576021))

(declare-fun m!576023 () Bool)

(assert (=> b!598706 m!576023))

(assert (=> b!598707 m!575995))

(declare-fun m!576025 () Bool)

(assert (=> b!598707 m!576025))

(assert (=> b!598707 m!575995))

(assert (=> b!598707 m!575995))

(declare-fun m!576027 () Bool)

(assert (=> b!598707 m!576027))

(declare-fun m!576029 () Bool)

(assert (=> b!598707 m!576029))

(declare-fun m!576031 () Bool)

(assert (=> b!598707 m!576031))

(assert (=> b!598704 m!575995))

(assert (=> b!598704 m!575987))

(declare-fun m!576033 () Bool)

(assert (=> b!598704 m!576033))

(declare-fun m!576035 () Bool)

(assert (=> start!54828 m!576035))

(declare-fun m!576037 () Bool)

(assert (=> start!54828 m!576037))

(declare-fun m!576039 () Bool)

(assert (=> b!598700 m!576039))

(check-sat (not b!598697) (not start!54828) (not b!598699) (not b!598700) (not b!598696) (not b!598711) (not b!598707) (not b!598712) (not b!598705) (not b!598701) (not b!598698) (not b!598694))
(check-sat)
