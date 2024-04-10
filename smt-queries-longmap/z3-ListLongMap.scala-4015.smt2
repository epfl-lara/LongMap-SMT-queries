; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54564 () Bool)

(assert start!54564)

(declare-fun res!382576 () Bool)

(declare-fun e!340992 () Bool)

(assert (=> start!54564 (=> (not res!382576) (not e!340992))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54564 (= res!382576 (validMask!0 mask!3053))))

(assert (=> start!54564 e!340992))

(assert (=> start!54564 true))

(declare-datatypes ((array!37024 0))(
  ( (array!37025 (arr!17776 (Array (_ BitVec 32) (_ BitVec 64))) (size!18140 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37024)

(declare-fun array_inv!13572 (array!37024) Bool)

(assert (=> start!54564 (array_inv!13572 a!2986)))

(declare-fun b!596807 () Bool)

(declare-fun e!340989 () Bool)

(declare-datatypes ((SeekEntryResult!6216 0))(
  ( (MissingZero!6216 (index!27112 (_ BitVec 32))) (Found!6216 (index!27113 (_ BitVec 32))) (Intermediate!6216 (undefined!7028 Bool) (index!27114 (_ BitVec 32)) (x!55908 (_ BitVec 32))) (Undefined!6216) (MissingVacant!6216 (index!27115 (_ BitVec 32))) )
))
(declare-fun lt!271105 () SeekEntryResult!6216)

(declare-fun lt!271102 () SeekEntryResult!6216)

(assert (=> b!596807 (= e!340989 (= lt!271105 lt!271102))))

(declare-fun e!340987 () Bool)

(declare-fun lt!271094 () array!37024)

(declare-fun b!596808 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596808 (= e!340987 (arrayContainsKey!0 lt!271094 (select (arr!17776 a!2986) j!136) index!984))))

(declare-fun b!596809 () Bool)

(declare-fun res!382568 () Bool)

(assert (=> b!596809 (=> (not res!382568) (not e!340992))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!596809 (= res!382568 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596810 () Bool)

(declare-fun e!340984 () Bool)

(declare-fun e!340986 () Bool)

(assert (=> b!596810 (= e!340984 e!340986)))

(declare-fun res!382572 () Bool)

(assert (=> b!596810 (=> (not res!382572) (not e!340986))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!596810 (= res!382572 (= (select (store (arr!17776 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596810 (= lt!271094 (array!37025 (store (arr!17776 a!2986) i!1108 k0!1786) (size!18140 a!2986)))))

(declare-fun b!596811 () Bool)

(declare-fun res!382562 () Bool)

(assert (=> b!596811 (=> (not res!382562) (not e!340992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596811 (= res!382562 (validKeyInArray!0 (select (arr!17776 a!2986) j!136)))))

(declare-fun b!596812 () Bool)

(declare-datatypes ((Unit!18782 0))(
  ( (Unit!18783) )
))
(declare-fun e!340985 () Unit!18782)

(declare-fun Unit!18784 () Unit!18782)

(assert (=> b!596812 (= e!340985 Unit!18784)))

(declare-fun b!596813 () Bool)

(declare-fun e!340988 () Bool)

(declare-fun e!340982 () Bool)

(assert (=> b!596813 (= e!340988 e!340982)))

(declare-fun res!382563 () Bool)

(assert (=> b!596813 (=> res!382563 e!340982)))

(declare-fun lt!271100 () (_ BitVec 64))

(declare-fun lt!271101 () (_ BitVec 64))

(assert (=> b!596813 (= res!382563 (or (not (= (select (arr!17776 a!2986) j!136) lt!271101)) (not (= (select (arr!17776 a!2986) j!136) lt!271100)) (bvsge j!136 index!984)))))

(declare-fun e!340983 () Bool)

(assert (=> b!596813 e!340983))

(declare-fun res!382575 () Bool)

(assert (=> b!596813 (=> (not res!382575) (not e!340983))))

(assert (=> b!596813 (= res!382575 (= lt!271100 (select (arr!17776 a!2986) j!136)))))

(assert (=> b!596813 (= lt!271100 (select (store (arr!17776 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!596814 () Bool)

(declare-fun res!382574 () Bool)

(assert (=> b!596814 (=> (not res!382574) (not e!340984))))

(declare-datatypes ((List!11817 0))(
  ( (Nil!11814) (Cons!11813 (h!12858 (_ BitVec 64)) (t!18045 List!11817)) )
))
(declare-fun arrayNoDuplicates!0 (array!37024 (_ BitVec 32) List!11817) Bool)

(assert (=> b!596814 (= res!382574 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11814))))

(declare-fun b!596815 () Bool)

(declare-fun res!382577 () Bool)

(assert (=> b!596815 (=> (not res!382577) (not e!340984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37024 (_ BitVec 32)) Bool)

(assert (=> b!596815 (= res!382577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596816 () Bool)

(declare-fun e!340981 () Bool)

(assert (=> b!596816 (= e!340981 e!340987)))

(declare-fun res!382570 () Bool)

(assert (=> b!596816 (=> (not res!382570) (not e!340987))))

(assert (=> b!596816 (= res!382570 (arrayContainsKey!0 lt!271094 (select (arr!17776 a!2986) j!136) j!136))))

(declare-fun b!596817 () Bool)

(declare-fun res!382567 () Bool)

(assert (=> b!596817 (=> (not res!382567) (not e!340992))))

(assert (=> b!596817 (= res!382567 (validKeyInArray!0 k0!1786))))

(declare-fun b!596818 () Bool)

(declare-fun e!340991 () Bool)

(assert (=> b!596818 (= e!340991 (not e!340988))))

(declare-fun res!382573 () Bool)

(assert (=> b!596818 (=> res!382573 e!340988)))

(declare-fun lt!271098 () SeekEntryResult!6216)

(assert (=> b!596818 (= res!382573 (not (= lt!271098 (Found!6216 index!984))))))

(declare-fun lt!271095 () Unit!18782)

(assert (=> b!596818 (= lt!271095 e!340985)))

(declare-fun c!67490 () Bool)

(assert (=> b!596818 (= c!67490 (= lt!271098 Undefined!6216))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37024 (_ BitVec 32)) SeekEntryResult!6216)

(assert (=> b!596818 (= lt!271098 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271101 lt!271094 mask!3053))))

(assert (=> b!596818 e!340989))

(declare-fun res!382569 () Bool)

(assert (=> b!596818 (=> (not res!382569) (not e!340989))))

(declare-fun lt!271096 () (_ BitVec 32))

(assert (=> b!596818 (= res!382569 (= lt!271102 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271096 vacantSpotIndex!68 lt!271101 lt!271094 mask!3053)))))

(assert (=> b!596818 (= lt!271102 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271096 vacantSpotIndex!68 (select (arr!17776 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596818 (= lt!271101 (select (store (arr!17776 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!271104 () Unit!18782)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37024 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18782)

(assert (=> b!596818 (= lt!271104 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271096 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596818 (= lt!271096 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596819 () Bool)

(assert (=> b!596819 (= e!340986 e!340991)))

(declare-fun res!382571 () Bool)

(assert (=> b!596819 (=> (not res!382571) (not e!340991))))

(assert (=> b!596819 (= res!382571 (and (= lt!271105 (Found!6216 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17776 a!2986) index!984) (select (arr!17776 a!2986) j!136))) (not (= (select (arr!17776 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!596819 (= lt!271105 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17776 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596820 () Bool)

(declare-fun Unit!18785 () Unit!18782)

(assert (=> b!596820 (= e!340985 Unit!18785)))

(assert (=> b!596820 false))

(declare-fun b!596821 () Bool)

(assert (=> b!596821 (= e!340992 e!340984)))

(declare-fun res!382564 () Bool)

(assert (=> b!596821 (=> (not res!382564) (not e!340984))))

(declare-fun lt!271099 () SeekEntryResult!6216)

(assert (=> b!596821 (= res!382564 (or (= lt!271099 (MissingZero!6216 i!1108)) (= lt!271099 (MissingVacant!6216 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37024 (_ BitVec 32)) SeekEntryResult!6216)

(assert (=> b!596821 (= lt!271099 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!596822 () Bool)

(declare-fun res!382565 () Bool)

(assert (=> b!596822 (=> (not res!382565) (not e!340984))))

(assert (=> b!596822 (= res!382565 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17776 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596823 () Bool)

(declare-fun res!382566 () Bool)

(assert (=> b!596823 (=> (not res!382566) (not e!340992))))

(assert (=> b!596823 (= res!382566 (and (= (size!18140 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18140 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18140 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596824 () Bool)

(assert (=> b!596824 (= e!340983 e!340981)))

(declare-fun res!382561 () Bool)

(assert (=> b!596824 (=> res!382561 e!340981)))

(assert (=> b!596824 (= res!382561 (or (not (= (select (arr!17776 a!2986) j!136) lt!271101)) (not (= (select (arr!17776 a!2986) j!136) lt!271100)) (bvsge j!136 index!984)))))

(declare-fun b!596825 () Bool)

(assert (=> b!596825 (= e!340982 (bvsle #b00000000000000000000000000000000 (size!18140 a!2986)))))

(assert (=> b!596825 (arrayNoDuplicates!0 lt!271094 #b00000000000000000000000000000000 Nil!11814)))

(declare-fun lt!271097 () Unit!18782)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37024 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11817) Unit!18782)

(assert (=> b!596825 (= lt!271097 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11814))))

(assert (=> b!596825 (arrayContainsKey!0 lt!271094 (select (arr!17776 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271103 () Unit!18782)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37024 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18782)

(assert (=> b!596825 (= lt!271103 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271094 (select (arr!17776 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!54564 res!382576) b!596823))

(assert (= (and b!596823 res!382566) b!596811))

(assert (= (and b!596811 res!382562) b!596817))

(assert (= (and b!596817 res!382567) b!596809))

(assert (= (and b!596809 res!382568) b!596821))

(assert (= (and b!596821 res!382564) b!596815))

(assert (= (and b!596815 res!382577) b!596814))

(assert (= (and b!596814 res!382574) b!596822))

(assert (= (and b!596822 res!382565) b!596810))

(assert (= (and b!596810 res!382572) b!596819))

(assert (= (and b!596819 res!382571) b!596818))

(assert (= (and b!596818 res!382569) b!596807))

(assert (= (and b!596818 c!67490) b!596820))

(assert (= (and b!596818 (not c!67490)) b!596812))

(assert (= (and b!596818 (not res!382573)) b!596813))

(assert (= (and b!596813 res!382575) b!596824))

(assert (= (and b!596824 (not res!382561)) b!596816))

(assert (= (and b!596816 res!382570) b!596808))

(assert (= (and b!596813 (not res!382563)) b!596825))

(declare-fun m!574253 () Bool)

(assert (=> b!596813 m!574253))

(declare-fun m!574255 () Bool)

(assert (=> b!596813 m!574255))

(declare-fun m!574257 () Bool)

(assert (=> b!596813 m!574257))

(assert (=> b!596811 m!574253))

(assert (=> b!596811 m!574253))

(declare-fun m!574259 () Bool)

(assert (=> b!596811 m!574259))

(declare-fun m!574261 () Bool)

(assert (=> b!596809 m!574261))

(declare-fun m!574263 () Bool)

(assert (=> b!596815 m!574263))

(assert (=> b!596808 m!574253))

(assert (=> b!596808 m!574253))

(declare-fun m!574265 () Bool)

(assert (=> b!596808 m!574265))

(declare-fun m!574267 () Bool)

(assert (=> b!596822 m!574267))

(assert (=> b!596824 m!574253))

(declare-fun m!574269 () Bool)

(assert (=> start!54564 m!574269))

(declare-fun m!574271 () Bool)

(assert (=> start!54564 m!574271))

(declare-fun m!574273 () Bool)

(assert (=> b!596819 m!574273))

(assert (=> b!596819 m!574253))

(assert (=> b!596819 m!574253))

(declare-fun m!574275 () Bool)

(assert (=> b!596819 m!574275))

(assert (=> b!596825 m!574253))

(declare-fun m!574277 () Bool)

(assert (=> b!596825 m!574277))

(assert (=> b!596825 m!574253))

(assert (=> b!596825 m!574253))

(declare-fun m!574279 () Bool)

(assert (=> b!596825 m!574279))

(declare-fun m!574281 () Bool)

(assert (=> b!596825 m!574281))

(declare-fun m!574283 () Bool)

(assert (=> b!596825 m!574283))

(declare-fun m!574285 () Bool)

(assert (=> b!596817 m!574285))

(assert (=> b!596816 m!574253))

(assert (=> b!596816 m!574253))

(declare-fun m!574287 () Bool)

(assert (=> b!596816 m!574287))

(assert (=> b!596810 m!574255))

(declare-fun m!574289 () Bool)

(assert (=> b!596810 m!574289))

(declare-fun m!574291 () Bool)

(assert (=> b!596814 m!574291))

(declare-fun m!574293 () Bool)

(assert (=> b!596818 m!574293))

(declare-fun m!574295 () Bool)

(assert (=> b!596818 m!574295))

(assert (=> b!596818 m!574253))

(declare-fun m!574297 () Bool)

(assert (=> b!596818 m!574297))

(assert (=> b!596818 m!574253))

(assert (=> b!596818 m!574255))

(declare-fun m!574299 () Bool)

(assert (=> b!596818 m!574299))

(declare-fun m!574301 () Bool)

(assert (=> b!596818 m!574301))

(declare-fun m!574303 () Bool)

(assert (=> b!596818 m!574303))

(declare-fun m!574305 () Bool)

(assert (=> b!596821 m!574305))

(check-sat (not b!596814) (not b!596809) (not b!596821) (not b!596817) (not b!596818) (not b!596816) (not b!596819) (not b!596825) (not start!54564) (not b!596815) (not b!596811) (not b!596808))
(check-sat)
