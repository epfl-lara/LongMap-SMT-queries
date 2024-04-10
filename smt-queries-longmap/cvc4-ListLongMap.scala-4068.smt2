; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55910 () Bool)

(assert start!55910)

(declare-fun b!611986 () Bool)

(declare-fun e!350752 () Bool)

(declare-fun e!350743 () Bool)

(assert (=> b!611986 (= e!350752 e!350743)))

(declare-fun res!393645 () Bool)

(assert (=> b!611986 (=> res!393645 e!350743)))

(declare-fun lt!280093 () (_ BitVec 64))

(declare-fun lt!280087 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37380 0))(
  ( (array!37381 (arr!17936 (Array (_ BitVec 32) (_ BitVec 64))) (size!18300 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37380)

(assert (=> b!611986 (= res!393645 (or (not (= (select (arr!17936 a!2986) j!136) lt!280093)) (not (= (select (arr!17936 a!2986) j!136) lt!280087)) (bvsge j!136 index!984)))))

(declare-fun b!611987 () Bool)

(declare-fun e!350754 () Bool)

(declare-fun e!350750 () Bool)

(assert (=> b!611987 (= e!350754 e!350750)))

(declare-fun res!393648 () Bool)

(assert (=> b!611987 (=> (not res!393648) (not e!350750))))

(declare-datatypes ((SeekEntryResult!6376 0))(
  ( (MissingZero!6376 (index!27788 (_ BitVec 32))) (Found!6376 (index!27789 (_ BitVec 32))) (Intermediate!6376 (undefined!7188 Bool) (index!27790 (_ BitVec 32)) (x!56600 (_ BitVec 32))) (Undefined!6376) (MissingVacant!6376 (index!27791 (_ BitVec 32))) )
))
(declare-fun lt!280098 () SeekEntryResult!6376)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!611987 (= res!393648 (and (= lt!280098 (Found!6376 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17936 a!2986) index!984) (select (arr!17936 a!2986) j!136))) (not (= (select (arr!17936 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37380 (_ BitVec 32)) SeekEntryResult!6376)

(assert (=> b!611987 (= lt!280098 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17936 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!393647 () Bool)

(declare-fun e!350747 () Bool)

(assert (=> start!55910 (=> (not res!393647) (not e!350747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55910 (= res!393647 (validMask!0 mask!3053))))

(assert (=> start!55910 e!350747))

(assert (=> start!55910 true))

(declare-fun array_inv!13732 (array!37380) Bool)

(assert (=> start!55910 (array_inv!13732 a!2986)))

(declare-fun b!611988 () Bool)

(declare-fun e!350741 () Bool)

(assert (=> b!611988 (= e!350741 e!350754)))

(declare-fun res!393634 () Bool)

(assert (=> b!611988 (=> (not res!393634) (not e!350754))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!611988 (= res!393634 (= (select (store (arr!17936 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!280089 () array!37380)

(assert (=> b!611988 (= lt!280089 (array!37381 (store (arr!17936 a!2986) i!1108 k!1786) (size!18300 a!2986)))))

(declare-fun b!611989 () Bool)

(declare-fun e!350742 () Bool)

(assert (=> b!611989 (= e!350742 true)))

(declare-datatypes ((List!11977 0))(
  ( (Nil!11974) (Cons!11973 (h!13018 (_ BitVec 64)) (t!18205 List!11977)) )
))
(declare-fun arrayNoDuplicates!0 (array!37380 (_ BitVec 32) List!11977) Bool)

(assert (=> b!611989 (arrayNoDuplicates!0 lt!280089 #b00000000000000000000000000000000 Nil!11974)))

(declare-datatypes ((Unit!19636 0))(
  ( (Unit!19637) )
))
(declare-fun lt!280088 () Unit!19636)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37380 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11977) Unit!19636)

(assert (=> b!611989 (= lt!280088 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11974))))

(declare-fun arrayContainsKey!0 (array!37380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!611989 (arrayContainsKey!0 lt!280089 (select (arr!17936 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280090 () Unit!19636)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37380 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19636)

(assert (=> b!611989 (= lt!280090 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280089 (select (arr!17936 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!350753 () Bool)

(assert (=> b!611989 e!350753))

(declare-fun res!393636 () Bool)

(assert (=> b!611989 (=> (not res!393636) (not e!350753))))

(assert (=> b!611989 (= res!393636 (arrayContainsKey!0 lt!280089 (select (arr!17936 a!2986) j!136) j!136))))

(declare-fun b!611990 () Bool)

(declare-fun e!350749 () Bool)

(assert (=> b!611990 (= e!350749 e!350742)))

(declare-fun res!393637 () Bool)

(assert (=> b!611990 (=> res!393637 e!350742)))

(assert (=> b!611990 (= res!393637 (bvsge index!984 j!136))))

(declare-fun lt!280091 () Unit!19636)

(declare-fun e!350744 () Unit!19636)

(assert (=> b!611990 (= lt!280091 e!350744)))

(declare-fun c!69544 () Bool)

(assert (=> b!611990 (= c!69544 (bvslt j!136 index!984))))

(declare-fun b!611991 () Bool)

(declare-fun Unit!19638 () Unit!19636)

(assert (=> b!611991 (= e!350744 Unit!19638)))

(declare-fun b!611992 () Bool)

(assert (=> b!611992 (= e!350753 (arrayContainsKey!0 lt!280089 (select (arr!17936 a!2986) j!136) index!984))))

(declare-fun b!611993 () Bool)

(declare-fun res!393649 () Bool)

(assert (=> b!611993 (=> (not res!393649) (not e!350741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37380 (_ BitVec 32)) Bool)

(assert (=> b!611993 (= res!393649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!611994 () Bool)

(declare-fun e!350748 () Bool)

(assert (=> b!611994 (= e!350748 (arrayContainsKey!0 lt!280089 (select (arr!17936 a!2986) j!136) index!984))))

(declare-fun b!611995 () Bool)

(declare-fun e!350740 () Unit!19636)

(declare-fun Unit!19639 () Unit!19636)

(assert (=> b!611995 (= e!350740 Unit!19639)))

(declare-fun b!611996 () Bool)

(declare-fun e!350751 () Bool)

(declare-fun lt!280083 () SeekEntryResult!6376)

(assert (=> b!611996 (= e!350751 (= lt!280098 lt!280083))))

(declare-fun b!611997 () Bool)

(declare-fun res!393640 () Bool)

(assert (=> b!611997 (=> (not res!393640) (not e!350747))))

(assert (=> b!611997 (= res!393640 (and (= (size!18300 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18300 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18300 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!611998 () Bool)

(declare-fun res!393635 () Bool)

(assert (=> b!611998 (=> (not res!393635) (not e!350747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!611998 (= res!393635 (validKeyInArray!0 (select (arr!17936 a!2986) j!136)))))

(declare-fun b!611999 () Bool)

(declare-fun Unit!19640 () Unit!19636)

(assert (=> b!611999 (= e!350744 Unit!19640)))

(declare-fun lt!280084 () Unit!19636)

(assert (=> b!611999 (= lt!280084 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280089 (select (arr!17936 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!611999 (arrayContainsKey!0 lt!280089 (select (arr!17936 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280096 () Unit!19636)

(assert (=> b!611999 (= lt!280096 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11974))))

(assert (=> b!611999 (arrayNoDuplicates!0 lt!280089 #b00000000000000000000000000000000 Nil!11974)))

(declare-fun lt!280092 () Unit!19636)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37380 (_ BitVec 32) (_ BitVec 32)) Unit!19636)

(assert (=> b!611999 (= lt!280092 (lemmaNoDuplicateFromThenFromBigger!0 lt!280089 #b00000000000000000000000000000000 j!136))))

(assert (=> b!611999 (arrayNoDuplicates!0 lt!280089 j!136 Nil!11974)))

(declare-fun lt!280097 () Unit!19636)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37380 (_ BitVec 64) (_ BitVec 32) List!11977) Unit!19636)

(assert (=> b!611999 (= lt!280097 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280089 (select (arr!17936 a!2986) j!136) j!136 Nil!11974))))

(assert (=> b!611999 false))

(declare-fun b!612000 () Bool)

(assert (=> b!612000 (= e!350743 e!350748)))

(declare-fun res!393643 () Bool)

(assert (=> b!612000 (=> (not res!393643) (not e!350748))))

(assert (=> b!612000 (= res!393643 (arrayContainsKey!0 lt!280089 (select (arr!17936 a!2986) j!136) j!136))))

(declare-fun b!612001 () Bool)

(declare-fun e!350745 () Bool)

(assert (=> b!612001 (= e!350750 (not e!350745))))

(declare-fun res!393638 () Bool)

(assert (=> b!612001 (=> res!393638 e!350745)))

(declare-fun lt!280094 () SeekEntryResult!6376)

(assert (=> b!612001 (= res!393638 (not (= lt!280094 (Found!6376 index!984))))))

(declare-fun lt!280095 () Unit!19636)

(assert (=> b!612001 (= lt!280095 e!350740)))

(declare-fun c!69545 () Bool)

(assert (=> b!612001 (= c!69545 (= lt!280094 Undefined!6376))))

(assert (=> b!612001 (= lt!280094 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280093 lt!280089 mask!3053))))

(assert (=> b!612001 e!350751))

(declare-fun res!393646 () Bool)

(assert (=> b!612001 (=> (not res!393646) (not e!350751))))

(declare-fun lt!280099 () (_ BitVec 32))

(assert (=> b!612001 (= res!393646 (= lt!280083 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280099 vacantSpotIndex!68 lt!280093 lt!280089 mask!3053)))))

(assert (=> b!612001 (= lt!280083 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280099 vacantSpotIndex!68 (select (arr!17936 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!612001 (= lt!280093 (select (store (arr!17936 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!280085 () Unit!19636)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37380 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19636)

(assert (=> b!612001 (= lt!280085 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280099 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612001 (= lt!280099 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!612002 () Bool)

(declare-fun res!393632 () Bool)

(assert (=> b!612002 (=> (not res!393632) (not e!350741))))

(assert (=> b!612002 (= res!393632 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11974))))

(declare-fun b!612003 () Bool)

(assert (=> b!612003 (= e!350745 e!350749)))

(declare-fun res!393650 () Bool)

(assert (=> b!612003 (=> res!393650 e!350749)))

(assert (=> b!612003 (= res!393650 (or (not (= (select (arr!17936 a!2986) j!136) lt!280093)) (not (= (select (arr!17936 a!2986) j!136) lt!280087))))))

(assert (=> b!612003 e!350752))

(declare-fun res!393641 () Bool)

(assert (=> b!612003 (=> (not res!393641) (not e!350752))))

(assert (=> b!612003 (= res!393641 (= lt!280087 (select (arr!17936 a!2986) j!136)))))

(assert (=> b!612003 (= lt!280087 (select (store (arr!17936 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!612004 () Bool)

(declare-fun Unit!19641 () Unit!19636)

(assert (=> b!612004 (= e!350740 Unit!19641)))

(assert (=> b!612004 false))

(declare-fun b!612005 () Bool)

(assert (=> b!612005 (= e!350747 e!350741)))

(declare-fun res!393642 () Bool)

(assert (=> b!612005 (=> (not res!393642) (not e!350741))))

(declare-fun lt!280086 () SeekEntryResult!6376)

(assert (=> b!612005 (= res!393642 (or (= lt!280086 (MissingZero!6376 i!1108)) (= lt!280086 (MissingVacant!6376 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37380 (_ BitVec 32)) SeekEntryResult!6376)

(assert (=> b!612005 (= lt!280086 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!612006 () Bool)

(declare-fun res!393639 () Bool)

(assert (=> b!612006 (=> (not res!393639) (not e!350747))))

(assert (=> b!612006 (= res!393639 (validKeyInArray!0 k!1786))))

(declare-fun b!612007 () Bool)

(declare-fun res!393633 () Bool)

(assert (=> b!612007 (=> (not res!393633) (not e!350741))))

(assert (=> b!612007 (= res!393633 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17936 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!612008 () Bool)

(declare-fun res!393644 () Bool)

(assert (=> b!612008 (=> (not res!393644) (not e!350747))))

(assert (=> b!612008 (= res!393644 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!55910 res!393647) b!611997))

(assert (= (and b!611997 res!393640) b!611998))

(assert (= (and b!611998 res!393635) b!612006))

(assert (= (and b!612006 res!393639) b!612008))

(assert (= (and b!612008 res!393644) b!612005))

(assert (= (and b!612005 res!393642) b!611993))

(assert (= (and b!611993 res!393649) b!612002))

(assert (= (and b!612002 res!393632) b!612007))

(assert (= (and b!612007 res!393633) b!611988))

(assert (= (and b!611988 res!393634) b!611987))

(assert (= (and b!611987 res!393648) b!612001))

(assert (= (and b!612001 res!393646) b!611996))

(assert (= (and b!612001 c!69545) b!612004))

(assert (= (and b!612001 (not c!69545)) b!611995))

(assert (= (and b!612001 (not res!393638)) b!612003))

(assert (= (and b!612003 res!393641) b!611986))

(assert (= (and b!611986 (not res!393645)) b!612000))

(assert (= (and b!612000 res!393643) b!611994))

(assert (= (and b!612003 (not res!393650)) b!611990))

(assert (= (and b!611990 c!69544) b!611999))

(assert (= (and b!611990 (not c!69544)) b!611991))

(assert (= (and b!611990 (not res!393637)) b!611989))

(assert (= (and b!611989 res!393636) b!611992))

(declare-fun m!588367 () Bool)

(assert (=> b!611988 m!588367))

(declare-fun m!588369 () Bool)

(assert (=> b!611988 m!588369))

(declare-fun m!588371 () Bool)

(assert (=> b!611999 m!588371))

(declare-fun m!588373 () Bool)

(assert (=> b!611999 m!588373))

(declare-fun m!588375 () Bool)

(assert (=> b!611999 m!588375))

(assert (=> b!611999 m!588373))

(declare-fun m!588377 () Bool)

(assert (=> b!611999 m!588377))

(declare-fun m!588379 () Bool)

(assert (=> b!611999 m!588379))

(declare-fun m!588381 () Bool)

(assert (=> b!611999 m!588381))

(declare-fun m!588383 () Bool)

(assert (=> b!611999 m!588383))

(assert (=> b!611999 m!588373))

(assert (=> b!611999 m!588373))

(declare-fun m!588385 () Bool)

(assert (=> b!611999 m!588385))

(declare-fun m!588387 () Bool)

(assert (=> b!612008 m!588387))

(assert (=> b!611986 m!588373))

(declare-fun m!588389 () Bool)

(assert (=> b!612002 m!588389))

(assert (=> b!611989 m!588373))

(declare-fun m!588391 () Bool)

(assert (=> b!611989 m!588391))

(assert (=> b!611989 m!588373))

(declare-fun m!588393 () Bool)

(assert (=> b!611989 m!588393))

(assert (=> b!611989 m!588373))

(assert (=> b!611989 m!588373))

(declare-fun m!588395 () Bool)

(assert (=> b!611989 m!588395))

(assert (=> b!611989 m!588379))

(assert (=> b!611989 m!588383))

(declare-fun m!588397 () Bool)

(assert (=> b!612006 m!588397))

(assert (=> b!612003 m!588373))

(assert (=> b!612003 m!588367))

(declare-fun m!588399 () Bool)

(assert (=> b!612003 m!588399))

(assert (=> b!612000 m!588373))

(assert (=> b!612000 m!588373))

(assert (=> b!612000 m!588391))

(assert (=> b!611992 m!588373))

(assert (=> b!611992 m!588373))

(declare-fun m!588401 () Bool)

(assert (=> b!611992 m!588401))

(declare-fun m!588403 () Bool)

(assert (=> b!611987 m!588403))

(assert (=> b!611987 m!588373))

(assert (=> b!611987 m!588373))

(declare-fun m!588405 () Bool)

(assert (=> b!611987 m!588405))

(assert (=> b!611998 m!588373))

(assert (=> b!611998 m!588373))

(declare-fun m!588407 () Bool)

(assert (=> b!611998 m!588407))

(declare-fun m!588409 () Bool)

(assert (=> b!612007 m!588409))

(declare-fun m!588411 () Bool)

(assert (=> b!612005 m!588411))

(declare-fun m!588413 () Bool)

(assert (=> b!612001 m!588413))

(declare-fun m!588415 () Bool)

(assert (=> b!612001 m!588415))

(assert (=> b!612001 m!588373))

(assert (=> b!612001 m!588367))

(declare-fun m!588417 () Bool)

(assert (=> b!612001 m!588417))

(assert (=> b!612001 m!588373))

(declare-fun m!588419 () Bool)

(assert (=> b!612001 m!588419))

(declare-fun m!588421 () Bool)

(assert (=> b!612001 m!588421))

(declare-fun m!588423 () Bool)

(assert (=> b!612001 m!588423))

(assert (=> b!611994 m!588373))

(assert (=> b!611994 m!588373))

(assert (=> b!611994 m!588401))

(declare-fun m!588425 () Bool)

(assert (=> start!55910 m!588425))

(declare-fun m!588427 () Bool)

(assert (=> start!55910 m!588427))

(declare-fun m!588429 () Bool)

(assert (=> b!611993 m!588429))

(push 1)

