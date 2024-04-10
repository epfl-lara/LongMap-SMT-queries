; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54920 () Bool)

(assert start!54920)

(declare-fun b!601611 () Bool)

(declare-fun e!344002 () Bool)

(declare-fun e!344004 () Bool)

(assert (=> b!601611 (= e!344002 e!344004)))

(declare-fun res!386341 () Bool)

(assert (=> b!601611 (=> (not res!386341) (not e!344004))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6277 0))(
  ( (MissingZero!6277 (index!27365 (_ BitVec 32))) (Found!6277 (index!27366 (_ BitVec 32))) (Intermediate!6277 (undefined!7089 Bool) (index!27367 (_ BitVec 32)) (x!56156 (_ BitVec 32))) (Undefined!6277) (MissingVacant!6277 (index!27368 (_ BitVec 32))) )
))
(declare-fun lt!273934 () SeekEntryResult!6277)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37155 0))(
  ( (array!37156 (arr!17837 (Array (_ BitVec 32) (_ BitVec 64))) (size!18201 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37155)

(assert (=> b!601611 (= res!386341 (and (= lt!273934 (Found!6277 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17837 a!2986) index!984) (select (arr!17837 a!2986) j!136))) (not (= (select (arr!17837 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37155 (_ BitVec 32)) SeekEntryResult!6277)

(assert (=> b!601611 (= lt!273934 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17837 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601612 () Bool)

(declare-fun e!344012 () Bool)

(assert (=> b!601612 (= e!344012 e!344002)))

(declare-fun res!386339 () Bool)

(assert (=> b!601612 (=> (not res!386339) (not e!344002))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!601612 (= res!386339 (= (select (store (arr!17837 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!273928 () array!37155)

(assert (=> b!601612 (= lt!273928 (array!37156 (store (arr!17837 a!2986) i!1108 k!1786) (size!18201 a!2986)))))

(declare-fun b!601613 () Bool)

(declare-fun e!344003 () Bool)

(declare-fun e!344013 () Bool)

(assert (=> b!601613 (= e!344003 e!344013)))

(declare-fun res!386351 () Bool)

(assert (=> b!601613 (=> res!386351 e!344013)))

(declare-fun lt!273930 () (_ BitVec 64))

(declare-fun lt!273933 () (_ BitVec 64))

(assert (=> b!601613 (= res!386351 (or (not (= (select (arr!17837 a!2986) j!136) lt!273933)) (not (= (select (arr!17837 a!2986) j!136) lt!273930)) (bvsge j!136 index!984)))))

(declare-fun b!601614 () Bool)

(declare-fun e!344009 () Bool)

(assert (=> b!601614 (= e!344009 e!344012)))

(declare-fun res!386344 () Bool)

(assert (=> b!601614 (=> (not res!386344) (not e!344012))))

(declare-fun lt!273921 () SeekEntryResult!6277)

(assert (=> b!601614 (= res!386344 (or (= lt!273921 (MissingZero!6277 i!1108)) (= lt!273921 (MissingVacant!6277 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37155 (_ BitVec 32)) SeekEntryResult!6277)

(assert (=> b!601614 (= lt!273921 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!601615 () Bool)

(declare-fun e!344001 () Bool)

(assert (=> b!601615 (= e!344013 e!344001)))

(declare-fun res!386350 () Bool)

(assert (=> b!601615 (=> (not res!386350) (not e!344001))))

(declare-fun arrayContainsKey!0 (array!37155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!601615 (= res!386350 (arrayContainsKey!0 lt!273928 (select (arr!17837 a!2986) j!136) j!136))))

(declare-fun e!344006 () Bool)

(declare-fun b!601616 () Bool)

(assert (=> b!601616 (= e!344006 (or (bvsge index!984 j!136) (bvslt (size!18201 a!2986) #b01111111111111111111111111111111)))))

(declare-datatypes ((Unit!19042 0))(
  ( (Unit!19043) )
))
(declare-fun lt!273924 () Unit!19042)

(declare-fun e!344011 () Unit!19042)

(assert (=> b!601616 (= lt!273924 e!344011)))

(declare-fun c!68005 () Bool)

(assert (=> b!601616 (= c!68005 (bvslt j!136 index!984))))

(declare-fun b!601617 () Bool)

(declare-fun e!344010 () Bool)

(declare-fun lt!273927 () SeekEntryResult!6277)

(assert (=> b!601617 (= e!344010 (= lt!273934 lt!273927))))

(declare-fun b!601618 () Bool)

(declare-fun res!386347 () Bool)

(assert (=> b!601618 (=> (not res!386347) (not e!344009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!601618 (= res!386347 (validKeyInArray!0 k!1786))))

(declare-fun b!601619 () Bool)

(declare-fun res!386348 () Bool)

(assert (=> b!601619 (=> (not res!386348) (not e!344009))))

(assert (=> b!601619 (= res!386348 (and (= (size!18201 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18201 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18201 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!601620 () Bool)

(declare-fun e!344005 () Bool)

(assert (=> b!601620 (= e!344004 (not e!344005))))

(declare-fun res!386349 () Bool)

(assert (=> b!601620 (=> res!386349 e!344005)))

(declare-fun lt!273923 () SeekEntryResult!6277)

(assert (=> b!601620 (= res!386349 (not (= lt!273923 (Found!6277 index!984))))))

(declare-fun lt!273926 () Unit!19042)

(declare-fun e!344007 () Unit!19042)

(assert (=> b!601620 (= lt!273926 e!344007)))

(declare-fun c!68006 () Bool)

(assert (=> b!601620 (= c!68006 (= lt!273923 Undefined!6277))))

(assert (=> b!601620 (= lt!273923 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273933 lt!273928 mask!3053))))

(assert (=> b!601620 e!344010))

(declare-fun res!386345 () Bool)

(assert (=> b!601620 (=> (not res!386345) (not e!344010))))

(declare-fun lt!273932 () (_ BitVec 32))

(assert (=> b!601620 (= res!386345 (= lt!273927 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273932 vacantSpotIndex!68 lt!273933 lt!273928 mask!3053)))))

(assert (=> b!601620 (= lt!273927 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273932 vacantSpotIndex!68 (select (arr!17837 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!601620 (= lt!273933 (select (store (arr!17837 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!273925 () Unit!19042)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37155 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19042)

(assert (=> b!601620 (= lt!273925 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273932 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!601620 (= lt!273932 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!601621 () Bool)

(declare-fun res!386337 () Bool)

(assert (=> b!601621 (=> (not res!386337) (not e!344012))))

(assert (=> b!601621 (= res!386337 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17837 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!601622 () Bool)

(declare-fun Unit!19044 () Unit!19042)

(assert (=> b!601622 (= e!344011 Unit!19044)))

(declare-fun b!601623 () Bool)

(declare-fun res!386336 () Bool)

(assert (=> b!601623 (=> (not res!386336) (not e!344009))))

(assert (=> b!601623 (= res!386336 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!601624 () Bool)

(declare-fun res!386342 () Bool)

(assert (=> b!601624 (=> (not res!386342) (not e!344009))))

(assert (=> b!601624 (= res!386342 (validKeyInArray!0 (select (arr!17837 a!2986) j!136)))))

(declare-fun b!601625 () Bool)

(assert (=> b!601625 (= e!344005 e!344006)))

(declare-fun res!386338 () Bool)

(assert (=> b!601625 (=> res!386338 e!344006)))

(assert (=> b!601625 (= res!386338 (or (not (= (select (arr!17837 a!2986) j!136) lt!273933)) (not (= (select (arr!17837 a!2986) j!136) lt!273930))))))

(assert (=> b!601625 e!344003))

(declare-fun res!386335 () Bool)

(assert (=> b!601625 (=> (not res!386335) (not e!344003))))

(assert (=> b!601625 (= res!386335 (= lt!273930 (select (arr!17837 a!2986) j!136)))))

(assert (=> b!601625 (= lt!273930 (select (store (arr!17837 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!601626 () Bool)

(declare-fun res!386346 () Bool)

(assert (=> b!601626 (=> (not res!386346) (not e!344012))))

(declare-datatypes ((List!11878 0))(
  ( (Nil!11875) (Cons!11874 (h!12919 (_ BitVec 64)) (t!18106 List!11878)) )
))
(declare-fun arrayNoDuplicates!0 (array!37155 (_ BitVec 32) List!11878) Bool)

(assert (=> b!601626 (= res!386346 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11875))))

(declare-fun b!601627 () Bool)

(assert (=> b!601627 (= e!344001 (arrayContainsKey!0 lt!273928 (select (arr!17837 a!2986) j!136) index!984))))

(declare-fun b!601628 () Bool)

(declare-fun Unit!19045 () Unit!19042)

(assert (=> b!601628 (= e!344011 Unit!19045)))

(declare-fun lt!273920 () Unit!19042)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37155 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19042)

(assert (=> b!601628 (= lt!273920 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273928 (select (arr!17837 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!601628 (arrayContainsKey!0 lt!273928 (select (arr!17837 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273922 () Unit!19042)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37155 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11878) Unit!19042)

(assert (=> b!601628 (= lt!273922 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11875))))

(assert (=> b!601628 (arrayNoDuplicates!0 lt!273928 #b00000000000000000000000000000000 Nil!11875)))

(declare-fun lt!273931 () Unit!19042)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37155 (_ BitVec 32) (_ BitVec 32)) Unit!19042)

(assert (=> b!601628 (= lt!273931 (lemmaNoDuplicateFromThenFromBigger!0 lt!273928 #b00000000000000000000000000000000 j!136))))

(assert (=> b!601628 (arrayNoDuplicates!0 lt!273928 j!136 Nil!11875)))

(declare-fun lt!273929 () Unit!19042)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37155 (_ BitVec 64) (_ BitVec 32) List!11878) Unit!19042)

(assert (=> b!601628 (= lt!273929 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273928 (select (arr!17837 a!2986) j!136) j!136 Nil!11875))))

(assert (=> b!601628 false))

(declare-fun res!386340 () Bool)

(assert (=> start!54920 (=> (not res!386340) (not e!344009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54920 (= res!386340 (validMask!0 mask!3053))))

(assert (=> start!54920 e!344009))

(assert (=> start!54920 true))

(declare-fun array_inv!13633 (array!37155) Bool)

(assert (=> start!54920 (array_inv!13633 a!2986)))

(declare-fun b!601629 () Bool)

(declare-fun res!386343 () Bool)

(assert (=> b!601629 (=> (not res!386343) (not e!344012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37155 (_ BitVec 32)) Bool)

(assert (=> b!601629 (= res!386343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!601630 () Bool)

(declare-fun Unit!19046 () Unit!19042)

(assert (=> b!601630 (= e!344007 Unit!19046)))

(declare-fun b!601631 () Bool)

(declare-fun Unit!19047 () Unit!19042)

(assert (=> b!601631 (= e!344007 Unit!19047)))

(assert (=> b!601631 false))

(assert (= (and start!54920 res!386340) b!601619))

(assert (= (and b!601619 res!386348) b!601624))

(assert (= (and b!601624 res!386342) b!601618))

(assert (= (and b!601618 res!386347) b!601623))

(assert (= (and b!601623 res!386336) b!601614))

(assert (= (and b!601614 res!386344) b!601629))

(assert (= (and b!601629 res!386343) b!601626))

(assert (= (and b!601626 res!386346) b!601621))

(assert (= (and b!601621 res!386337) b!601612))

(assert (= (and b!601612 res!386339) b!601611))

(assert (= (and b!601611 res!386341) b!601620))

(assert (= (and b!601620 res!386345) b!601617))

(assert (= (and b!601620 c!68006) b!601631))

(assert (= (and b!601620 (not c!68006)) b!601630))

(assert (= (and b!601620 (not res!386349)) b!601625))

(assert (= (and b!601625 res!386335) b!601613))

(assert (= (and b!601613 (not res!386351)) b!601615))

(assert (= (and b!601615 res!386350) b!601627))

(assert (= (and b!601625 (not res!386338)) b!601616))

(assert (= (and b!601616 c!68005) b!601628))

(assert (= (and b!601616 (not c!68005)) b!601622))

(declare-fun m!578789 () Bool)

(assert (=> b!601614 m!578789))

(declare-fun m!578791 () Bool)

(assert (=> b!601618 m!578791))

(declare-fun m!578793 () Bool)

(assert (=> b!601627 m!578793))

(assert (=> b!601627 m!578793))

(declare-fun m!578795 () Bool)

(assert (=> b!601627 m!578795))

(declare-fun m!578797 () Bool)

(assert (=> b!601628 m!578797))

(assert (=> b!601628 m!578793))

(declare-fun m!578799 () Bool)

(assert (=> b!601628 m!578799))

(declare-fun m!578801 () Bool)

(assert (=> b!601628 m!578801))

(assert (=> b!601628 m!578793))

(declare-fun m!578803 () Bool)

(assert (=> b!601628 m!578803))

(assert (=> b!601628 m!578793))

(declare-fun m!578805 () Bool)

(assert (=> b!601628 m!578805))

(assert (=> b!601628 m!578793))

(declare-fun m!578807 () Bool)

(assert (=> b!601628 m!578807))

(declare-fun m!578809 () Bool)

(assert (=> b!601628 m!578809))

(declare-fun m!578811 () Bool)

(assert (=> b!601612 m!578811))

(declare-fun m!578813 () Bool)

(assert (=> b!601612 m!578813))

(declare-fun m!578815 () Bool)

(assert (=> start!54920 m!578815))

(declare-fun m!578817 () Bool)

(assert (=> start!54920 m!578817))

(declare-fun m!578819 () Bool)

(assert (=> b!601611 m!578819))

(assert (=> b!601611 m!578793))

(assert (=> b!601611 m!578793))

(declare-fun m!578821 () Bool)

(assert (=> b!601611 m!578821))

(assert (=> b!601625 m!578793))

(assert (=> b!601625 m!578811))

(declare-fun m!578823 () Bool)

(assert (=> b!601625 m!578823))

(assert (=> b!601624 m!578793))

(assert (=> b!601624 m!578793))

(declare-fun m!578825 () Bool)

(assert (=> b!601624 m!578825))

(assert (=> b!601615 m!578793))

(assert (=> b!601615 m!578793))

(declare-fun m!578827 () Bool)

(assert (=> b!601615 m!578827))

(declare-fun m!578829 () Bool)

(assert (=> b!601623 m!578829))

(assert (=> b!601613 m!578793))

(declare-fun m!578831 () Bool)

(assert (=> b!601621 m!578831))

(declare-fun m!578833 () Bool)

(assert (=> b!601620 m!578833))

(declare-fun m!578835 () Bool)

(assert (=> b!601620 m!578835))

(assert (=> b!601620 m!578793))

(assert (=> b!601620 m!578811))

(assert (=> b!601620 m!578793))

(declare-fun m!578837 () Bool)

(assert (=> b!601620 m!578837))

(declare-fun m!578839 () Bool)

(assert (=> b!601620 m!578839))

(declare-fun m!578841 () Bool)

(assert (=> b!601620 m!578841))

(declare-fun m!578843 () Bool)

(assert (=> b!601620 m!578843))

(declare-fun m!578845 () Bool)

(assert (=> b!601626 m!578845))

(declare-fun m!578847 () Bool)

(assert (=> b!601629 m!578847))

(push 1)

(assert (not b!601614))

(assert (not b!601624))

(assert (not b!601620))

(assert (not b!601615))

(assert (not b!601618))

(assert (not b!601629))

(assert (not start!54920))

(assert (not b!601628))

(assert (not b!601611))

(assert (not b!601623))

(assert (not b!601627))

(assert (not b!601626))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!601705 () Bool)

(declare-fun e!344063 () SeekEntryResult!6277)

(declare-fun e!344064 () SeekEntryResult!6277)

(assert (=> b!601705 (= e!344063 e!344064)))

(declare-fun c!68033 () Bool)

(declare-fun lt!273961 () (_ BitVec 64))

(assert (=> b!601705 (= c!68033 (= lt!273961 (select (arr!17837 a!2986) j!136)))))

(declare-fun lt!273960 () SeekEntryResult!6277)

(declare-fun d!87145 () Bool)

(assert (=> d!87145 (and (or (is-Undefined!6277 lt!273960) (not (is-Found!6277 lt!273960)) (and (bvsge (index!27366 lt!273960) #b00000000000000000000000000000000) (bvslt (index!27366 lt!273960) (size!18201 a!2986)))) (or (is-Undefined!6277 lt!273960) (is-Found!6277 lt!273960) (not (is-MissingVacant!6277 lt!273960)) (not (= (index!27368 lt!273960) vacantSpotIndex!68)) (and (bvsge (index!27368 lt!273960) #b00000000000000000000000000000000) (bvslt (index!27368 lt!273960) (size!18201 a!2986)))) (or (is-Undefined!6277 lt!273960) (ite (is-Found!6277 lt!273960) (= (select (arr!17837 a!2986) (index!27366 lt!273960)) (select (arr!17837 a!2986) j!136)) (and (is-MissingVacant!6277 lt!273960) (= (index!27368 lt!273960) vacantSpotIndex!68) (= (select (arr!17837 a!2986) (index!27368 lt!273960)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87145 (= lt!273960 e!344063)))

(declare-fun c!68031 () Bool)

(assert (=> d!87145 (= c!68031 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87145 (= lt!273961 (select (arr!17837 a!2986) index!984))))

(assert (=> d!87145 (validMask!0 mask!3053)))

(assert (=> d!87145 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17837 a!2986) j!136) a!2986 mask!3053) lt!273960)))

(declare-fun b!601706 () Bool)

(declare-fun c!68032 () Bool)

(assert (=> b!601706 (= c!68032 (= lt!273961 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!344065 () SeekEntryResult!6277)

(assert (=> b!601706 (= e!344064 e!344065)))

(declare-fun b!601707 () Bool)

(assert (=> b!601707 (= e!344063 Undefined!6277)))

(declare-fun b!601708 () Bool)

(assert (=> b!601708 (= e!344064 (Found!6277 index!984))))

(declare-fun b!601709 () Bool)

(assert (=> b!601709 (= e!344065 (MissingVacant!6277 vacantSpotIndex!68))))

(declare-fun b!601710 () Bool)

(assert (=> b!601710 (= e!344065 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17837 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!87145 c!68031) b!601707))

(assert (= (and d!87145 (not c!68031)) b!601705))

(assert (= (and b!601705 c!68033) b!601708))

(assert (= (and b!601705 (not c!68033)) b!601706))

(assert (= (and b!601706 c!68032) b!601709))

(assert (= (and b!601706 (not c!68032)) b!601710))

(declare-fun m!578905 () Bool)

(assert (=> d!87145 m!578905))

(declare-fun m!578907 () Bool)

(assert (=> d!87145 m!578907))

(assert (=> d!87145 m!578819))

(assert (=> d!87145 m!578815))

(assert (=> b!601710 m!578833))

(assert (=> b!601710 m!578833))

(assert (=> b!601710 m!578793))

(declare-fun m!578909 () Bool)

(assert (=> b!601710 m!578909))

(assert (=> b!601611 d!87145))

(declare-fun d!87175 () Bool)

(declare-fun res!386381 () Bool)

(declare-fun e!344070 () Bool)

(assert (=> d!87175 (=> res!386381 e!344070)))

(assert (=> d!87175 (= res!386381 (= (select (arr!17837 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!87175 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!344070)))

(declare-fun b!601715 () Bool)

(declare-fun e!344071 () Bool)

(assert (=> b!601715 (= e!344070 e!344071)))

(declare-fun res!386382 () Bool)

(assert (=> b!601715 (=> (not res!386382) (not e!344071))))

(assert (=> b!601715 (= res!386382 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18201 a!2986)))))

(declare-fun b!601716 () Bool)

(assert (=> b!601716 (= e!344071 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87175 (not res!386381)) b!601715))

(assert (= (and b!601715 res!386382) b!601716))

(declare-fun m!578911 () Bool)

(assert (=> d!87175 m!578911))

(declare-fun m!578913 () Bool)

(assert (=> b!601716 m!578913))

(assert (=> b!601623 d!87175))

(declare-fun d!87177 () Bool)

(assert (=> d!87177 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54920 d!87177))

(declare-fun d!87195 () Bool)

(assert (=> d!87195 (= (array_inv!13633 a!2986) (bvsge (size!18201 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54920 d!87195))

(declare-fun b!601758 () Bool)

(declare-fun e!344105 () SeekEntryResult!6277)

(declare-fun e!344106 () SeekEntryResult!6277)

(assert (=> b!601758 (= e!344105 e!344106)))

(declare-fun c!68044 () Bool)

(declare-fun lt!273972 () (_ BitVec 64))

(assert (=> b!601758 (= c!68044 (= lt!273972 lt!273933))))

(declare-fun lt!273971 () SeekEntryResult!6277)

(declare-fun d!87197 () Bool)

(assert (=> d!87197 (and (or (is-Undefined!6277 lt!273971) (not (is-Found!6277 lt!273971)) (and (bvsge (index!27366 lt!273971) #b00000000000000000000000000000000) (bvslt (index!27366 lt!273971) (size!18201 lt!273928)))) (or (is-Undefined!6277 lt!273971) (is-Found!6277 lt!273971) (not (is-MissingVacant!6277 lt!273971)) (not (= (index!27368 lt!273971) vacantSpotIndex!68)) (and (bvsge (index!27368 lt!273971) #b00000000000000000000000000000000) (bvslt (index!27368 lt!273971) (size!18201 lt!273928)))) (or (is-Undefined!6277 lt!273971) (ite (is-Found!6277 lt!273971) (= (select (arr!17837 lt!273928) (index!27366 lt!273971)) lt!273933) (and (is-MissingVacant!6277 lt!273971) (= (index!27368 lt!273971) vacantSpotIndex!68) (= (select (arr!17837 lt!273928) (index!27368 lt!273971)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87197 (= lt!273971 e!344105)))

(declare-fun c!68042 () Bool)

(assert (=> d!87197 (= c!68042 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87197 (= lt!273972 (select (arr!17837 lt!273928) lt!273932))))

(assert (=> d!87197 (validMask!0 mask!3053)))

(assert (=> d!87197 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273932 vacantSpotIndex!68 lt!273933 lt!273928 mask!3053) lt!273971)))

(declare-fun b!601759 () Bool)

(declare-fun c!68043 () Bool)

(assert (=> b!601759 (= c!68043 (= lt!273972 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!344107 () SeekEntryResult!6277)

(assert (=> b!601759 (= e!344106 e!344107)))

(declare-fun b!601760 () Bool)

(assert (=> b!601760 (= e!344105 Undefined!6277)))

(declare-fun b!601761 () Bool)

(assert (=> b!601761 (= e!344106 (Found!6277 lt!273932))))

(declare-fun b!601762 () Bool)

(assert (=> b!601762 (= e!344107 (MissingVacant!6277 vacantSpotIndex!68))))

(declare-fun b!601763 () Bool)

(assert (=> b!601763 (= e!344107 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!273932 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!273933 lt!273928 mask!3053))))

(assert (= (and d!87197 c!68042) b!601760))

(assert (= (and d!87197 (not c!68042)) b!601758))

(assert (= (and b!601758 c!68044) b!601761))

(assert (= (and b!601758 (not c!68044)) b!601759))

(assert (= (and b!601759 c!68043) b!601762))

(assert (= (and b!601759 (not c!68043)) b!601763))

(declare-fun m!578957 () Bool)

(assert (=> d!87197 m!578957))

(declare-fun m!578959 () Bool)

(assert (=> d!87197 m!578959))

(declare-fun m!578961 () Bool)

(assert (=> d!87197 m!578961))

(assert (=> d!87197 m!578815))

(declare-fun m!578963 () Bool)

(assert (=> b!601763 m!578963))

(assert (=> b!601763 m!578963))

(declare-fun m!578965 () Bool)

(assert (=> b!601763 m!578965))

(assert (=> b!601620 d!87197))

(declare-fun b!601764 () Bool)

(declare-fun e!344108 () SeekEntryResult!6277)

(declare-fun e!344109 () SeekEntryResult!6277)

(assert (=> b!601764 (= e!344108 e!344109)))

(declare-fun c!68047 () Bool)

(declare-fun lt!273974 () (_ BitVec 64))

(assert (=> b!601764 (= c!68047 (= lt!273974 (select (arr!17837 a!2986) j!136)))))

(declare-fun d!87201 () Bool)

(declare-fun lt!273973 () SeekEntryResult!6277)

(assert (=> d!87201 (and (or (is-Undefined!6277 lt!273973) (not (is-Found!6277 lt!273973)) (and (bvsge (index!27366 lt!273973) #b00000000000000000000000000000000) (bvslt (index!27366 lt!273973) (size!18201 a!2986)))) (or (is-Undefined!6277 lt!273973) (is-Found!6277 lt!273973) (not (is-MissingVacant!6277 lt!273973)) (not (= (index!27368 lt!273973) vacantSpotIndex!68)) (and (bvsge (index!27368 lt!273973) #b00000000000000000000000000000000) (bvslt (index!27368 lt!273973) (size!18201 a!2986)))) (or (is-Undefined!6277 lt!273973) (ite (is-Found!6277 lt!273973) (= (select (arr!17837 a!2986) (index!27366 lt!273973)) (select (arr!17837 a!2986) j!136)) (and (is-MissingVacant!6277 lt!273973) (= (index!27368 lt!273973) vacantSpotIndex!68) (= (select (arr!17837 a!2986) (index!27368 lt!273973)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87201 (= lt!273973 e!344108)))

(declare-fun c!68045 () Bool)

(assert (=> d!87201 (= c!68045 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87201 (= lt!273974 (select (arr!17837 a!2986) lt!273932))))

(assert (=> d!87201 (validMask!0 mask!3053)))

(assert (=> d!87201 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273932 vacantSpotIndex!68 (select (arr!17837 a!2986) j!136) a!2986 mask!3053) lt!273973)))

(declare-fun b!601765 () Bool)

(declare-fun c!68046 () Bool)

(assert (=> b!601765 (= c!68046 (= lt!273974 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!344110 () SeekEntryResult!6277)

(assert (=> b!601765 (= e!344109 e!344110)))

(declare-fun b!601766 () Bool)

(assert (=> b!601766 (= e!344108 Undefined!6277)))

(declare-fun b!601767 () Bool)

(assert (=> b!601767 (= e!344109 (Found!6277 lt!273932))))

(declare-fun b!601768 () Bool)

(assert (=> b!601768 (= e!344110 (MissingVacant!6277 vacantSpotIndex!68))))

(declare-fun b!601769 () Bool)

(assert (=> b!601769 (= e!344110 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!273932 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17837 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!87201 c!68045) b!601766))

(assert (= (and d!87201 (not c!68045)) b!601764))

(assert (= (and b!601764 c!68047) b!601767))

(assert (= (and b!601764 (not c!68047)) b!601765))

(assert (= (and b!601765 c!68046) b!601768))

(assert (= (and b!601765 (not c!68046)) b!601769))

(declare-fun m!578967 () Bool)

(assert (=> d!87201 m!578967))

(declare-fun m!578969 () Bool)

(assert (=> d!87201 m!578969))

(declare-fun m!578971 () Bool)

(assert (=> d!87201 m!578971))

(assert (=> d!87201 m!578815))

(assert (=> b!601769 m!578963))

(assert (=> b!601769 m!578963))

(assert (=> b!601769 m!578793))

(declare-fun m!578973 () Bool)

(assert (=> b!601769 m!578973))

(assert (=> b!601620 d!87201))

(declare-fun d!87203 () Bool)

(declare-fun lt!273977 () (_ BitVec 32))

(assert (=> d!87203 (and (bvsge lt!273977 #b00000000000000000000000000000000) (bvslt lt!273977 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87203 (= lt!273977 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87203 (validMask!0 mask!3053)))

(assert (=> d!87203 (= (nextIndex!0 index!984 x!910 mask!3053) lt!273977)))

(declare-fun bs!18443 () Bool)

(assert (= bs!18443 d!87203))

(declare-fun m!578975 () Bool)

(assert (=> bs!18443 m!578975))

(assert (=> bs!18443 m!578815))

(assert (=> b!601620 d!87203))

(declare-fun d!87205 () Bool)

(declare-fun e!344130 () Bool)

(assert (=> d!87205 e!344130))

(declare-fun res!386418 () Bool)

(assert (=> d!87205 (=> (not res!386418) (not e!344130))))

(assert (=> d!87205 (= res!386418 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18201 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18201 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18201 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18201 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18201 a!2986))))))

(declare-fun lt!273995 () Unit!19042)

(declare-fun choose!9 (array!37155 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19042)

(assert (=> d!87205 (= lt!273995 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273932 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87205 (validMask!0 mask!3053)))

(assert (=> d!87205 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273932 vacantSpotIndex!68 mask!3053) lt!273995)))

(declare-fun b!601798 () Bool)

(assert (=> b!601798 (= e!344130 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273932 vacantSpotIndex!68 (select (arr!17837 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273932 vacantSpotIndex!68 (select (store (arr!17837 a!2986) i!1108 k!1786) j!136) (array!37156 (store (arr!17837 a!2986) i!1108 k!1786) (size!18201 a!2986)) mask!3053)))))

(assert (= (and d!87205 res!386418) b!601798))

(declare-fun m!578987 () Bool)

(assert (=> d!87205 m!578987))

(assert (=> d!87205 m!578815))

(assert (=> b!601798 m!578793))

(assert (=> b!601798 m!578811))

(assert (=> b!601798 m!578793))

(assert (=> b!601798 m!578837))

(assert (=> b!601798 m!578835))

(assert (=> b!601798 m!578835))

(declare-fun m!578989 () Bool)

(assert (=> b!601798 m!578989))

(assert (=> b!601620 d!87205))

(declare-fun b!601799 () Bool)

(declare-fun e!344131 () SeekEntryResult!6277)

(declare-fun e!344132 () SeekEntryResult!6277)

(assert (=> b!601799 (= e!344131 e!344132)))

(declare-fun c!68059 () Bool)

(declare-fun lt!273997 () (_ BitVec 64))

(assert (=> b!601799 (= c!68059 (= lt!273997 lt!273933))))

(declare-fun lt!273996 () SeekEntryResult!6277)

(declare-fun d!87211 () Bool)

(assert (=> d!87211 (and (or (is-Undefined!6277 lt!273996) (not (is-Found!6277 lt!273996)) (and (bvsge (index!27366 lt!273996) #b00000000000000000000000000000000) (bvslt (index!27366 lt!273996) (size!18201 lt!273928)))) (or (is-Undefined!6277 lt!273996) (is-Found!6277 lt!273996) (not (is-MissingVacant!6277 lt!273996)) (not (= (index!27368 lt!273996) vacantSpotIndex!68)) (and (bvsge (index!27368 lt!273996) #b00000000000000000000000000000000) (bvslt (index!27368 lt!273996) (size!18201 lt!273928)))) (or (is-Undefined!6277 lt!273996) (ite (is-Found!6277 lt!273996) (= (select (arr!17837 lt!273928) (index!27366 lt!273996)) lt!273933) (and (is-MissingVacant!6277 lt!273996) (= (index!27368 lt!273996) vacantSpotIndex!68) (= (select (arr!17837 lt!273928) (index!27368 lt!273996)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87211 (= lt!273996 e!344131)))

(declare-fun c!68057 () Bool)

(assert (=> d!87211 (= c!68057 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87211 (= lt!273997 (select (arr!17837 lt!273928) index!984))))

(assert (=> d!87211 (validMask!0 mask!3053)))

(assert (=> d!87211 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273933 lt!273928 mask!3053) lt!273996)))

(declare-fun b!601800 () Bool)

(declare-fun c!68058 () Bool)

(assert (=> b!601800 (= c!68058 (= lt!273997 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!344133 () SeekEntryResult!6277)

(assert (=> b!601800 (= e!344132 e!344133)))

(declare-fun b!601801 () Bool)

(assert (=> b!601801 (= e!344131 Undefined!6277)))

(declare-fun b!601802 () Bool)

(assert (=> b!601802 (= e!344132 (Found!6277 index!984))))

(declare-fun b!601803 () Bool)

(assert (=> b!601803 (= e!344133 (MissingVacant!6277 vacantSpotIndex!68))))

(declare-fun b!601804 () Bool)

(assert (=> b!601804 (= e!344133 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!273933 lt!273928 mask!3053))))

(assert (= (and d!87211 c!68057) b!601801))

(assert (= (and d!87211 (not c!68057)) b!601799))

(assert (= (and b!601799 c!68059) b!601802))

(assert (= (and b!601799 (not c!68059)) b!601800))

(assert (= (and b!601800 c!68058) b!601803))

(assert (= (and b!601800 (not c!68058)) b!601804))

(declare-fun m!578991 () Bool)

(assert (=> d!87211 m!578991))

(declare-fun m!578993 () Bool)

(assert (=> d!87211 m!578993))

(declare-fun m!578995 () Bool)

(assert (=> d!87211 m!578995))

(assert (=> d!87211 m!578815))

(assert (=> b!601804 m!578833))

(assert (=> b!601804 m!578833))

(declare-fun m!578997 () Bool)

(assert (=> b!601804 m!578997))

(assert (=> b!601620 d!87211))

(declare-fun d!87213 () Bool)

(declare-fun res!386419 () Bool)

(declare-fun e!344137 () Bool)

(assert (=> d!87213 (=> res!386419 e!344137)))

(assert (=> d!87213 (= res!386419 (= (select (arr!17837 lt!273928) index!984) (select (arr!17837 a!2986) j!136)))))

(assert (=> d!87213 (= (arrayContainsKey!0 lt!273928 (select (arr!17837 a!2986) j!136) index!984) e!344137)))

(declare-fun b!601811 () Bool)

(declare-fun e!344138 () Bool)

(assert (=> b!601811 (= e!344137 e!344138)))

(declare-fun res!386420 () Bool)

(assert (=> b!601811 (=> (not res!386420) (not e!344138))))

(assert (=> b!601811 (= res!386420 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18201 lt!273928)))))

(declare-fun b!601812 () Bool)

(assert (=> b!601812 (= e!344138 (arrayContainsKey!0 lt!273928 (select (arr!17837 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87213 (not res!386419)) b!601811))

(assert (= (and b!601811 res!386420) b!601812))

(assert (=> d!87213 m!578995))

(assert (=> b!601812 m!578793))

(declare-fun m!579013 () Bool)

(assert (=> b!601812 m!579013))

(assert (=> b!601627 d!87213))

(declare-fun d!87217 () Bool)

(assert (=> d!87217 (arrayContainsKey!0 lt!273928 (select (arr!17837 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274003 () Unit!19042)

(declare-fun choose!114 (array!37155 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19042)

(assert (=> d!87217 (= lt!274003 (choose!114 lt!273928 (select (arr!17837 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87217 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87217 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273928 (select (arr!17837 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!274003)))

(declare-fun bs!18444 () Bool)

(assert (= bs!18444 d!87217))

(assert (=> bs!18444 m!578793))

(assert (=> bs!18444 m!578807))

(assert (=> bs!18444 m!578793))

(declare-fun m!579015 () Bool)

(assert (=> bs!18444 m!579015))

(assert (=> b!601628 d!87217))

(declare-fun d!87223 () Bool)

(assert (=> d!87223 (arrayNoDuplicates!0 lt!273928 j!136 Nil!11875)))

(declare-fun lt!274009 () Unit!19042)

(declare-fun choose!39 (array!37155 (_ BitVec 32) (_ BitVec 32)) Unit!19042)

(assert (=> d!87223 (= lt!274009 (choose!39 lt!273928 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87223 (bvslt (size!18201 lt!273928) #b01111111111111111111111111111111)))

(assert (=> d!87223 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!273928 #b00000000000000000000000000000000 j!136) lt!274009)))

(declare-fun bs!18446 () Bool)

(assert (= bs!18446 d!87223))

(assert (=> bs!18446 m!578801))

(declare-fun m!579027 () Bool)

(assert (=> bs!18446 m!579027))

(assert (=> b!601628 d!87223))

(declare-fun d!87229 () Bool)

(assert (=> d!87229 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18201 lt!273928)) (not (= (select (arr!17837 lt!273928) j!136) (select (arr!17837 a!2986) j!136))))))

(declare-fun lt!274015 () Unit!19042)

(declare-fun choose!21 (array!37155 (_ BitVec 64) (_ BitVec 32) List!11878) Unit!19042)

(assert (=> d!87229 (= lt!274015 (choose!21 lt!273928 (select (arr!17837 a!2986) j!136) j!136 Nil!11875))))

(assert (=> d!87229 (bvslt (size!18201 lt!273928) #b01111111111111111111111111111111)))

(assert (=> d!87229 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273928 (select (arr!17837 a!2986) j!136) j!136 Nil!11875) lt!274015)))

(declare-fun bs!18448 () Bool)

(assert (= bs!18448 d!87229))

(declare-fun m!579035 () Bool)

(assert (=> bs!18448 m!579035))

(assert (=> bs!18448 m!578793))

(declare-fun m!579037 () Bool)

(assert (=> bs!18448 m!579037))

(assert (=> b!601628 d!87229))

(declare-fun d!87235 () Bool)

(declare-fun res!386426 () Bool)

(declare-fun e!344145 () Bool)

(assert (=> d!87235 (=> res!386426 e!344145)))

(assert (=> d!87235 (= res!386426 (= (select (arr!17837 lt!273928) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17837 a!2986) j!136)))))

(assert (=> d!87235 (= (arrayContainsKey!0 lt!273928 (select (arr!17837 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!344145)))

(declare-fun b!601820 () Bool)

(declare-fun e!344146 () Bool)

(assert (=> b!601820 (= e!344145 e!344146)))

(declare-fun res!386427 () Bool)

(assert (=> b!601820 (=> (not res!386427) (not e!344146))))

(assert (=> b!601820 (= res!386427 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18201 lt!273928)))))

(declare-fun b!601821 () Bool)

(assert (=> b!601821 (= e!344146 (arrayContainsKey!0 lt!273928 (select (arr!17837 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87235 (not res!386426)) b!601820))

(assert (= (and b!601820 res!386427) b!601821))

(declare-fun m!579039 () Bool)

(assert (=> d!87235 m!579039))

(assert (=> b!601821 m!578793))

(declare-fun m!579041 () Bool)

(assert (=> b!601821 m!579041))

(assert (=> b!601628 d!87235))

(declare-fun b!601851 () Bool)

(declare-fun e!344170 () Bool)

(declare-fun e!344167 () Bool)

(assert (=> b!601851 (= e!344170 e!344167)))

(declare-fun res!386441 () Bool)

(assert (=> b!601851 (=> (not res!386441) (not e!344167))))

(declare-fun e!344168 () Bool)

(assert (=> b!601851 (= res!386441 (not e!344168))))

(declare-fun res!386439 () Bool)

(assert (=> b!601851 (=> (not res!386439) (not e!344168))))

(assert (=> b!601851 (= res!386439 (validKeyInArray!0 (select (arr!17837 lt!273928) j!136)))))

(declare-fun b!601852 () Bool)

(declare-fun e!344169 () Bool)

(declare-fun call!32982 () Bool)

(assert (=> b!601852 (= e!344169 call!32982)))

(declare-fun b!601853 () Bool)

(assert (=> b!601853 (= e!344169 call!32982)))

(declare-fun b!601854 () Bool)

(declare-fun contains!2988 (List!11878 (_ BitVec 64)) Bool)

(assert (=> b!601854 (= e!344168 (contains!2988 Nil!11875 (select (arr!17837 lt!273928) j!136)))))

(declare-fun b!601855 () Bool)

(assert (=> b!601855 (= e!344167 e!344169)))

(declare-fun c!68073 () Bool)

(assert (=> b!601855 (= c!68073 (validKeyInArray!0 (select (arr!17837 lt!273928) j!136)))))

(declare-fun bm!32979 () Bool)

(assert (=> bm!32979 (= call!32982 (arrayNoDuplicates!0 lt!273928 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68073 (Cons!11874 (select (arr!17837 lt!273928) j!136) Nil!11875) Nil!11875)))))

(declare-fun d!87237 () Bool)

(declare-fun res!386440 () Bool)

(assert (=> d!87237 (=> res!386440 e!344170)))

(assert (=> d!87237 (= res!386440 (bvsge j!136 (size!18201 lt!273928)))))

(assert (=> d!87237 (= (arrayNoDuplicates!0 lt!273928 j!136 Nil!11875) e!344170)))

(assert (= (and d!87237 (not res!386440)) b!601851))

(assert (= (and b!601851 res!386439) b!601854))

(assert (= (and b!601851 res!386441) b!601855))

(assert (= (and b!601855 c!68073) b!601852))

(assert (= (and b!601855 (not c!68073)) b!601853))

(assert (= (or b!601852 b!601853) bm!32979))

(assert (=> b!601851 m!579035))

(assert (=> b!601851 m!579035))

(declare-fun m!579053 () Bool)

(assert (=> b!601851 m!579053))

(assert (=> b!601854 m!579035))

(assert (=> b!601854 m!579035))

(declare-fun m!579055 () Bool)

(assert (=> b!601854 m!579055))

(assert (=> b!601855 m!579035))

(assert (=> b!601855 m!579035))

(assert (=> b!601855 m!579053))

(assert (=> bm!32979 m!579035))

(declare-fun m!579059 () Bool)

(assert (=> bm!32979 m!579059))

(assert (=> b!601628 d!87237))

(declare-fun b!601857 () Bool)

(declare-fun e!344175 () Bool)

(declare-fun e!344172 () Bool)

(assert (=> b!601857 (= e!344175 e!344172)))

(declare-fun res!386445 () Bool)

(assert (=> b!601857 (=> (not res!386445) (not e!344172))))

(declare-fun e!344173 () Bool)

(assert (=> b!601857 (= res!386445 (not e!344173))))

(declare-fun res!386443 () Bool)

(assert (=> b!601857 (=> (not res!386443) (not e!344173))))

(assert (=> b!601857 (= res!386443 (validKeyInArray!0 (select (arr!17837 lt!273928) #b00000000000000000000000000000000)))))

(declare-fun b!601858 () Bool)

(declare-fun e!344174 () Bool)

(declare-fun call!32983 () Bool)

(assert (=> b!601858 (= e!344174 call!32983)))

(declare-fun b!601859 () Bool)

(assert (=> b!601859 (= e!344174 call!32983)))

(declare-fun b!601860 () Bool)

(assert (=> b!601860 (= e!344173 (contains!2988 Nil!11875 (select (arr!17837 lt!273928) #b00000000000000000000000000000000)))))

(declare-fun b!601861 () Bool)

(assert (=> b!601861 (= e!344172 e!344174)))

(declare-fun c!68074 () Bool)

(assert (=> b!601861 (= c!68074 (validKeyInArray!0 (select (arr!17837 lt!273928) #b00000000000000000000000000000000)))))

(declare-fun bm!32980 () Bool)

(assert (=> bm!32980 (= call!32983 (arrayNoDuplicates!0 lt!273928 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68074 (Cons!11874 (select (arr!17837 lt!273928) #b00000000000000000000000000000000) Nil!11875) Nil!11875)))))

