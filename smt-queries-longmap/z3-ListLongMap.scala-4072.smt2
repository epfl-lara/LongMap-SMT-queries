; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55932 () Bool)

(assert start!55932)

(declare-fun b!612761 () Bool)

(declare-fun e!351241 () Bool)

(declare-fun e!351247 () Bool)

(assert (=> b!612761 (= e!351241 e!351247)))

(declare-fun res!394287 () Bool)

(assert (=> b!612761 (=> (not res!394287) (not e!351247))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37402 0))(
  ( (array!37403 (arr!17947 (Array (_ BitVec 32) (_ BitVec 64))) (size!18311 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37402)

(assert (=> b!612761 (= res!394287 (= (select (store (arr!17947 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!280655 () array!37402)

(assert (=> b!612761 (= lt!280655 (array!37403 (store (arr!17947 a!2986) i!1108 k0!1786) (size!18311 a!2986)))))

(declare-fun b!612762 () Bool)

(declare-fun e!351254 () Bool)

(declare-fun e!351240 () Bool)

(assert (=> b!612762 (= e!351254 e!351240)))

(declare-fun res!394277 () Bool)

(assert (=> b!612762 (=> res!394277 e!351240)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!280656 () (_ BitVec 64))

(declare-fun lt!280666 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!612762 (= res!394277 (or (not (= (select (arr!17947 a!2986) j!136) lt!280666)) (not (= (select (arr!17947 a!2986) j!136) lt!280656)) (bvsge j!136 index!984)))))

(declare-fun b!612763 () Bool)

(declare-fun res!394282 () Bool)

(declare-fun e!351252 () Bool)

(assert (=> b!612763 (=> (not res!394282) (not e!351252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!612763 (= res!394282 (validKeyInArray!0 k0!1786))))

(declare-fun b!612764 () Bool)

(declare-fun e!351251 () Bool)

(assert (=> b!612764 (= e!351251 true)))

(declare-fun lt!280660 () Bool)

(declare-datatypes ((List!11988 0))(
  ( (Nil!11985) (Cons!11984 (h!13029 (_ BitVec 64)) (t!18216 List!11988)) )
))
(declare-fun contains!3046 (List!11988 (_ BitVec 64)) Bool)

(assert (=> b!612764 (= lt!280660 (contains!3046 Nil!11985 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!612765 () Bool)

(declare-fun e!351249 () Bool)

(declare-fun e!351248 () Bool)

(assert (=> b!612765 (= e!351249 e!351248)))

(declare-fun res!394290 () Bool)

(assert (=> b!612765 (=> res!394290 e!351248)))

(assert (=> b!612765 (= res!394290 (or (not (= (select (arr!17947 a!2986) j!136) lt!280666)) (not (= (select (arr!17947 a!2986) j!136) lt!280656))))))

(assert (=> b!612765 e!351254))

(declare-fun res!394295 () Bool)

(assert (=> b!612765 (=> (not res!394295) (not e!351254))))

(assert (=> b!612765 (= res!394295 (= lt!280656 (select (arr!17947 a!2986) j!136)))))

(assert (=> b!612765 (= lt!280656 (select (store (arr!17947 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!612766 () Bool)

(declare-fun res!394274 () Bool)

(assert (=> b!612766 (=> (not res!394274) (not e!351252))))

(declare-fun arrayContainsKey!0 (array!37402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612766 (= res!394274 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!612767 () Bool)

(declare-datatypes ((Unit!19702 0))(
  ( (Unit!19703) )
))
(declare-fun e!351242 () Unit!19702)

(declare-fun Unit!19704 () Unit!19702)

(assert (=> b!612767 (= e!351242 Unit!19704)))

(declare-fun lt!280657 () Unit!19702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37402 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19702)

(assert (=> b!612767 (= lt!280657 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280655 (select (arr!17947 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!612767 (arrayContainsKey!0 lt!280655 (select (arr!17947 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280665 () Unit!19702)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37402 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11988) Unit!19702)

(assert (=> b!612767 (= lt!280665 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11985))))

(declare-fun arrayNoDuplicates!0 (array!37402 (_ BitVec 32) List!11988) Bool)

(assert (=> b!612767 (arrayNoDuplicates!0 lt!280655 #b00000000000000000000000000000000 Nil!11985)))

(declare-fun lt!280672 () Unit!19702)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37402 (_ BitVec 32) (_ BitVec 32)) Unit!19702)

(assert (=> b!612767 (= lt!280672 (lemmaNoDuplicateFromThenFromBigger!0 lt!280655 #b00000000000000000000000000000000 j!136))))

(assert (=> b!612767 (arrayNoDuplicates!0 lt!280655 j!136 Nil!11985)))

(declare-fun lt!280661 () Unit!19702)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37402 (_ BitVec 64) (_ BitVec 32) List!11988) Unit!19702)

(assert (=> b!612767 (= lt!280661 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280655 (select (arr!17947 a!2986) j!136) j!136 Nil!11985))))

(assert (=> b!612767 false))

(declare-fun b!612768 () Bool)

(declare-fun e!351244 () Unit!19702)

(declare-fun Unit!19705 () Unit!19702)

(assert (=> b!612768 (= e!351244 Unit!19705)))

(declare-fun b!612769 () Bool)

(declare-fun e!351246 () Bool)

(assert (=> b!612769 (= e!351246 (arrayContainsKey!0 lt!280655 (select (arr!17947 a!2986) j!136) index!984))))

(declare-fun b!612760 () Bool)

(declare-fun res!394275 () Bool)

(assert (=> b!612760 (=> (not res!394275) (not e!351252))))

(assert (=> b!612760 (= res!394275 (validKeyInArray!0 (select (arr!17947 a!2986) j!136)))))

(declare-fun res!394288 () Bool)

(assert (=> start!55932 (=> (not res!394288) (not e!351252))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55932 (= res!394288 (validMask!0 mask!3053))))

(assert (=> start!55932 e!351252))

(assert (=> start!55932 true))

(declare-fun array_inv!13743 (array!37402) Bool)

(assert (=> start!55932 (array_inv!13743 a!2986)))

(declare-fun b!612770 () Bool)

(declare-fun res!394279 () Bool)

(assert (=> b!612770 (=> (not res!394279) (not e!351241))))

(assert (=> b!612770 (= res!394279 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11985))))

(declare-fun b!612771 () Bool)

(assert (=> b!612771 (= e!351240 e!351246)))

(declare-fun res!394285 () Bool)

(assert (=> b!612771 (=> (not res!394285) (not e!351246))))

(assert (=> b!612771 (= res!394285 (arrayContainsKey!0 lt!280655 (select (arr!17947 a!2986) j!136) j!136))))

(declare-fun b!612772 () Bool)

(declare-fun e!351253 () Bool)

(assert (=> b!612772 (= e!351253 e!351251)))

(declare-fun res!394280 () Bool)

(assert (=> b!612772 (=> res!394280 e!351251)))

(assert (=> b!612772 (= res!394280 (or (bvsge (size!18311 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18311 a!2986)) (bvsge index!984 (size!18311 a!2986))))))

(assert (=> b!612772 (arrayNoDuplicates!0 lt!280655 index!984 Nil!11985)))

(declare-fun lt!280668 () Unit!19702)

(assert (=> b!612772 (= lt!280668 (lemmaNoDuplicateFromThenFromBigger!0 lt!280655 #b00000000000000000000000000000000 index!984))))

(assert (=> b!612772 (arrayNoDuplicates!0 lt!280655 #b00000000000000000000000000000000 Nil!11985)))

(declare-fun lt!280663 () Unit!19702)

(assert (=> b!612772 (= lt!280663 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11985))))

(assert (=> b!612772 (arrayContainsKey!0 lt!280655 (select (arr!17947 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280667 () Unit!19702)

(assert (=> b!612772 (= lt!280667 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280655 (select (arr!17947 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!351243 () Bool)

(assert (=> b!612772 e!351243))

(declare-fun res!394283 () Bool)

(assert (=> b!612772 (=> (not res!394283) (not e!351243))))

(assert (=> b!612772 (= res!394283 (arrayContainsKey!0 lt!280655 (select (arr!17947 a!2986) j!136) j!136))))

(declare-fun b!612773 () Bool)

(declare-fun Unit!19706 () Unit!19702)

(assert (=> b!612773 (= e!351242 Unit!19706)))

(declare-fun b!612774 () Bool)

(declare-fun res!394292 () Bool)

(assert (=> b!612774 (=> (not res!394292) (not e!351241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37402 (_ BitVec 32)) Bool)

(assert (=> b!612774 (= res!394292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!612775 () Bool)

(declare-fun res!394278 () Bool)

(assert (=> b!612775 (=> res!394278 e!351251)))

(declare-fun noDuplicate!349 (List!11988) Bool)

(assert (=> b!612775 (= res!394278 (not (noDuplicate!349 Nil!11985)))))

(declare-fun b!612776 () Bool)

(declare-fun e!351250 () Bool)

(assert (=> b!612776 (= e!351247 e!351250)))

(declare-fun res!394276 () Bool)

(assert (=> b!612776 (=> (not res!394276) (not e!351250))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6387 0))(
  ( (MissingZero!6387 (index!27832 (_ BitVec 32))) (Found!6387 (index!27833 (_ BitVec 32))) (Intermediate!6387 (undefined!7199 Bool) (index!27834 (_ BitVec 32)) (x!56643 (_ BitVec 32))) (Undefined!6387) (MissingVacant!6387 (index!27835 (_ BitVec 32))) )
))
(declare-fun lt!280670 () SeekEntryResult!6387)

(assert (=> b!612776 (= res!394276 (and (= lt!280670 (Found!6387 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17947 a!2986) index!984) (select (arr!17947 a!2986) j!136))) (not (= (select (arr!17947 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37402 (_ BitVec 32)) SeekEntryResult!6387)

(assert (=> b!612776 (= lt!280670 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17947 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!612777 () Bool)

(assert (=> b!612777 (= e!351252 e!351241)))

(declare-fun res!394286 () Bool)

(assert (=> b!612777 (=> (not res!394286) (not e!351241))))

(declare-fun lt!280669 () SeekEntryResult!6387)

(assert (=> b!612777 (= res!394286 (or (= lt!280669 (MissingZero!6387 i!1108)) (= lt!280669 (MissingVacant!6387 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37402 (_ BitVec 32)) SeekEntryResult!6387)

(assert (=> b!612777 (= lt!280669 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!612778 () Bool)

(declare-fun res!394289 () Bool)

(assert (=> b!612778 (=> res!394289 e!351251)))

(assert (=> b!612778 (= res!394289 (contains!3046 Nil!11985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!612779 () Bool)

(assert (=> b!612779 (= e!351250 (not e!351249))))

(declare-fun res!394291 () Bool)

(assert (=> b!612779 (=> res!394291 e!351249)))

(declare-fun lt!280664 () SeekEntryResult!6387)

(assert (=> b!612779 (= res!394291 (not (= lt!280664 (Found!6387 index!984))))))

(declare-fun lt!280658 () Unit!19702)

(assert (=> b!612779 (= lt!280658 e!351244)))

(declare-fun c!69610 () Bool)

(assert (=> b!612779 (= c!69610 (= lt!280664 Undefined!6387))))

(assert (=> b!612779 (= lt!280664 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280666 lt!280655 mask!3053))))

(declare-fun e!351245 () Bool)

(assert (=> b!612779 e!351245))

(declare-fun res!394294 () Bool)

(assert (=> b!612779 (=> (not res!394294) (not e!351245))))

(declare-fun lt!280654 () SeekEntryResult!6387)

(declare-fun lt!280671 () (_ BitVec 32))

(assert (=> b!612779 (= res!394294 (= lt!280654 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280671 vacantSpotIndex!68 lt!280666 lt!280655 mask!3053)))))

(assert (=> b!612779 (= lt!280654 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280671 vacantSpotIndex!68 (select (arr!17947 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!612779 (= lt!280666 (select (store (arr!17947 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!280662 () Unit!19702)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37402 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19702)

(assert (=> b!612779 (= lt!280662 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280671 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612779 (= lt!280671 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!612780 () Bool)

(assert (=> b!612780 (= e!351243 (arrayContainsKey!0 lt!280655 (select (arr!17947 a!2986) j!136) index!984))))

(declare-fun b!612781 () Bool)

(declare-fun res!394284 () Bool)

(assert (=> b!612781 (=> (not res!394284) (not e!351252))))

(assert (=> b!612781 (= res!394284 (and (= (size!18311 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18311 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18311 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612782 () Bool)

(assert (=> b!612782 (= e!351245 (= lt!280670 lt!280654))))

(declare-fun b!612783 () Bool)

(declare-fun res!394293 () Bool)

(assert (=> b!612783 (=> (not res!394293) (not e!351241))))

(assert (=> b!612783 (= res!394293 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17947 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!612784 () Bool)

(declare-fun Unit!19707 () Unit!19702)

(assert (=> b!612784 (= e!351244 Unit!19707)))

(assert (=> b!612784 false))

(declare-fun b!612785 () Bool)

(assert (=> b!612785 (= e!351248 e!351253)))

(declare-fun res!394281 () Bool)

(assert (=> b!612785 (=> res!394281 e!351253)))

(assert (=> b!612785 (= res!394281 (bvsge index!984 j!136))))

(declare-fun lt!280659 () Unit!19702)

(assert (=> b!612785 (= lt!280659 e!351242)))

(declare-fun c!69611 () Bool)

(assert (=> b!612785 (= c!69611 (bvslt j!136 index!984))))

(assert (= (and start!55932 res!394288) b!612781))

(assert (= (and b!612781 res!394284) b!612760))

(assert (= (and b!612760 res!394275) b!612763))

(assert (= (and b!612763 res!394282) b!612766))

(assert (= (and b!612766 res!394274) b!612777))

(assert (= (and b!612777 res!394286) b!612774))

(assert (= (and b!612774 res!394292) b!612770))

(assert (= (and b!612770 res!394279) b!612783))

(assert (= (and b!612783 res!394293) b!612761))

(assert (= (and b!612761 res!394287) b!612776))

(assert (= (and b!612776 res!394276) b!612779))

(assert (= (and b!612779 res!394294) b!612782))

(assert (= (and b!612779 c!69610) b!612784))

(assert (= (and b!612779 (not c!69610)) b!612768))

(assert (= (and b!612779 (not res!394291)) b!612765))

(assert (= (and b!612765 res!394295) b!612762))

(assert (= (and b!612762 (not res!394277)) b!612771))

(assert (= (and b!612771 res!394285) b!612769))

(assert (= (and b!612765 (not res!394290)) b!612785))

(assert (= (and b!612785 c!69611) b!612767))

(assert (= (and b!612785 (not c!69611)) b!612773))

(assert (= (and b!612785 (not res!394281)) b!612772))

(assert (= (and b!612772 res!394283) b!612780))

(assert (= (and b!612772 (not res!394280)) b!612775))

(assert (= (and b!612775 (not res!394278)) b!612778))

(assert (= (and b!612778 (not res!394289)) b!612764))

(declare-fun m!589081 () Bool)

(assert (=> b!612764 m!589081))

(declare-fun m!589083 () Bool)

(assert (=> b!612783 m!589083))

(declare-fun m!589085 () Bool)

(assert (=> b!612778 m!589085))

(declare-fun m!589087 () Bool)

(assert (=> b!612767 m!589087))

(declare-fun m!589089 () Bool)

(assert (=> b!612767 m!589089))

(assert (=> b!612767 m!589087))

(declare-fun m!589091 () Bool)

(assert (=> b!612767 m!589091))

(declare-fun m!589093 () Bool)

(assert (=> b!612767 m!589093))

(assert (=> b!612767 m!589087))

(declare-fun m!589095 () Bool)

(assert (=> b!612767 m!589095))

(declare-fun m!589097 () Bool)

(assert (=> b!612767 m!589097))

(declare-fun m!589099 () Bool)

(assert (=> b!612767 m!589099))

(assert (=> b!612767 m!589087))

(declare-fun m!589101 () Bool)

(assert (=> b!612767 m!589101))

(assert (=> b!612771 m!589087))

(assert (=> b!612771 m!589087))

(declare-fun m!589103 () Bool)

(assert (=> b!612771 m!589103))

(assert (=> b!612762 m!589087))

(assert (=> b!612765 m!589087))

(declare-fun m!589105 () Bool)

(assert (=> b!612765 m!589105))

(declare-fun m!589107 () Bool)

(assert (=> b!612765 m!589107))

(assert (=> b!612769 m!589087))

(assert (=> b!612769 m!589087))

(declare-fun m!589109 () Bool)

(assert (=> b!612769 m!589109))

(assert (=> b!612761 m!589105))

(declare-fun m!589111 () Bool)

(assert (=> b!612761 m!589111))

(declare-fun m!589113 () Bool)

(assert (=> b!612774 m!589113))

(declare-fun m!589115 () Bool)

(assert (=> b!612770 m!589115))

(declare-fun m!589117 () Bool)

(assert (=> b!612772 m!589117))

(assert (=> b!612772 m!589087))

(assert (=> b!612772 m!589103))

(assert (=> b!612772 m!589087))

(assert (=> b!612772 m!589087))

(declare-fun m!589119 () Bool)

(assert (=> b!612772 m!589119))

(assert (=> b!612772 m!589091))

(assert (=> b!612772 m!589087))

(declare-fun m!589121 () Bool)

(assert (=> b!612772 m!589121))

(declare-fun m!589123 () Bool)

(assert (=> b!612772 m!589123))

(assert (=> b!612772 m!589097))

(assert (=> b!612760 m!589087))

(assert (=> b!612760 m!589087))

(declare-fun m!589125 () Bool)

(assert (=> b!612760 m!589125))

(declare-fun m!589127 () Bool)

(assert (=> b!612763 m!589127))

(declare-fun m!589129 () Bool)

(assert (=> b!612779 m!589129))

(declare-fun m!589131 () Bool)

(assert (=> b!612779 m!589131))

(assert (=> b!612779 m!589087))

(assert (=> b!612779 m!589105))

(declare-fun m!589133 () Bool)

(assert (=> b!612779 m!589133))

(declare-fun m!589135 () Bool)

(assert (=> b!612779 m!589135))

(assert (=> b!612779 m!589087))

(declare-fun m!589137 () Bool)

(assert (=> b!612779 m!589137))

(declare-fun m!589139 () Bool)

(assert (=> b!612779 m!589139))

(declare-fun m!589141 () Bool)

(assert (=> b!612776 m!589141))

(assert (=> b!612776 m!589087))

(assert (=> b!612776 m!589087))

(declare-fun m!589143 () Bool)

(assert (=> b!612776 m!589143))

(assert (=> b!612780 m!589087))

(assert (=> b!612780 m!589087))

(assert (=> b!612780 m!589109))

(declare-fun m!589145 () Bool)

(assert (=> b!612775 m!589145))

(declare-fun m!589147 () Bool)

(assert (=> b!612777 m!589147))

(declare-fun m!589149 () Bool)

(assert (=> start!55932 m!589149))

(declare-fun m!589151 () Bool)

(assert (=> start!55932 m!589151))

(declare-fun m!589153 () Bool)

(assert (=> b!612766 m!589153))

(check-sat (not b!612775) (not b!612763) (not b!612778) (not b!612779) (not start!55932) (not b!612777) (not b!612771) (not b!612767) (not b!612764) (not b!612766) (not b!612772) (not b!612769) (not b!612770) (not b!612774) (not b!612760) (not b!612776) (not b!612780))
(check-sat)
