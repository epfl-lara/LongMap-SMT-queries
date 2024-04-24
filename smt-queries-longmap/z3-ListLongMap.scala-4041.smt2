; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55170 () Bool)

(assert start!55170)

(declare-fun b!603549 () Bool)

(declare-fun res!387565 () Bool)

(declare-fun e!345267 () Bool)

(assert (=> b!603549 (=> (not res!387565) (not e!345267))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37188 0))(
  ( (array!37189 (arr!17848 (Array (_ BitVec 32) (_ BitVec 64))) (size!18212 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37188)

(assert (=> b!603549 (= res!387565 (and (= (size!18212 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18212 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18212 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603550 () Bool)

(declare-fun e!345273 () Bool)

(declare-fun e!345275 () Bool)

(assert (=> b!603550 (= e!345273 e!345275)))

(declare-fun res!387563 () Bool)

(assert (=> b!603550 (=> res!387563 e!345275)))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!603550 (= res!387563 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19117 0))(
  ( (Unit!19118) )
))
(declare-fun lt!275041 () Unit!19117)

(declare-fun e!345269 () Unit!19117)

(assert (=> b!603550 (= lt!275041 e!345269)))

(declare-fun c!68366 () Bool)

(assert (=> b!603550 (= c!68366 (bvslt j!136 index!984))))

(declare-fun b!603551 () Bool)

(declare-fun e!345274 () Bool)

(declare-fun e!345270 () Bool)

(assert (=> b!603551 (= e!345274 e!345270)))

(declare-fun res!387564 () Bool)

(assert (=> b!603551 (=> (not res!387564) (not e!345270))))

(declare-fun lt!275038 () array!37188)

(declare-fun arrayContainsKey!0 (array!37188 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603551 (= res!387564 (arrayContainsKey!0 lt!275038 (select (arr!17848 a!2986) j!136) j!136))))

(declare-fun res!387567 () Bool)

(assert (=> start!55170 (=> (not res!387567) (not e!345267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55170 (= res!387567 (validMask!0 mask!3053))))

(assert (=> start!55170 e!345267))

(assert (=> start!55170 true))

(declare-fun array_inv!13707 (array!37188) Bool)

(assert (=> start!55170 (array_inv!13707 a!2986)))

(declare-fun b!603552 () Bool)

(declare-fun e!345268 () Bool)

(assert (=> b!603552 (= e!345268 e!345274)))

(declare-fun res!387562 () Bool)

(assert (=> b!603552 (=> res!387562 e!345274)))

(declare-fun lt!275042 () (_ BitVec 64))

(declare-fun lt!275039 () (_ BitVec 64))

(assert (=> b!603552 (= res!387562 (or (not (= (select (arr!17848 a!2986) j!136) lt!275042)) (not (= (select (arr!17848 a!2986) j!136) lt!275039)) (bvsge j!136 index!984)))))

(declare-fun e!345271 () Bool)

(declare-fun b!603553 () Bool)

(assert (=> b!603553 (= e!345271 (arrayContainsKey!0 lt!275038 (select (arr!17848 a!2986) j!136) index!984))))

(declare-fun b!603554 () Bool)

(declare-fun res!387560 () Bool)

(declare-fun e!345272 () Bool)

(assert (=> b!603554 (=> (not res!387560) (not e!345272))))

(declare-datatypes ((List!11796 0))(
  ( (Nil!11793) (Cons!11792 (h!12840 (_ BitVec 64)) (t!18016 List!11796)) )
))
(declare-fun arrayNoDuplicates!0 (array!37188 (_ BitVec 32) List!11796) Bool)

(assert (=> b!603554 (= res!387560 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11793))))

(declare-fun b!603555 () Bool)

(declare-fun res!387556 () Bool)

(assert (=> b!603555 (=> (not res!387556) (not e!345272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37188 (_ BitVec 32)) Bool)

(assert (=> b!603555 (= res!387556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603556 () Bool)

(assert (=> b!603556 (= e!345267 e!345272)))

(declare-fun res!387572 () Bool)

(assert (=> b!603556 (=> (not res!387572) (not e!345272))))

(declare-datatypes ((SeekEntryResult!6244 0))(
  ( (MissingZero!6244 (index!27239 (_ BitVec 32))) (Found!6244 (index!27240 (_ BitVec 32))) (Intermediate!6244 (undefined!7056 Bool) (index!27241 (_ BitVec 32)) (x!56192 (_ BitVec 32))) (Undefined!6244) (MissingVacant!6244 (index!27242 (_ BitVec 32))) )
))
(declare-fun lt!275035 () SeekEntryResult!6244)

(assert (=> b!603556 (= res!387572 (or (= lt!275035 (MissingZero!6244 i!1108)) (= lt!275035 (MissingVacant!6244 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37188 (_ BitVec 32)) SeekEntryResult!6244)

(assert (=> b!603556 (= lt!275035 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!603557 () Bool)

(declare-fun e!345266 () Unit!19117)

(declare-fun Unit!19119 () Unit!19117)

(assert (=> b!603557 (= e!345266 Unit!19119)))

(assert (=> b!603557 false))

(declare-fun b!603558 () Bool)

(declare-fun res!387569 () Bool)

(assert (=> b!603558 (=> (not res!387569) (not e!345267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603558 (= res!387569 (validKeyInArray!0 k0!1786))))

(declare-fun b!603559 () Bool)

(declare-fun e!345277 () Bool)

(declare-fun lt!275032 () SeekEntryResult!6244)

(declare-fun lt!275040 () SeekEntryResult!6244)

(assert (=> b!603559 (= e!345277 (= lt!275032 lt!275040))))

(declare-fun b!603560 () Bool)

(declare-fun Unit!19120 () Unit!19117)

(assert (=> b!603560 (= e!345269 Unit!19120)))

(declare-fun lt!275030 () Unit!19117)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37188 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19117)

(assert (=> b!603560 (= lt!275030 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275038 (select (arr!17848 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603560 (arrayContainsKey!0 lt!275038 (select (arr!17848 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275043 () Unit!19117)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37188 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11796) Unit!19117)

(assert (=> b!603560 (= lt!275043 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11793))))

(assert (=> b!603560 (arrayNoDuplicates!0 lt!275038 #b00000000000000000000000000000000 Nil!11793)))

(declare-fun lt!275037 () Unit!19117)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37188 (_ BitVec 32) (_ BitVec 32)) Unit!19117)

(assert (=> b!603560 (= lt!275037 (lemmaNoDuplicateFromThenFromBigger!0 lt!275038 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603560 (arrayNoDuplicates!0 lt!275038 j!136 Nil!11793)))

(declare-fun lt!275033 () Unit!19117)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37188 (_ BitVec 64) (_ BitVec 32) List!11796) Unit!19117)

(assert (=> b!603560 (= lt!275033 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275038 (select (arr!17848 a!2986) j!136) j!136 Nil!11793))))

(assert (=> b!603560 false))

(declare-fun b!603561 () Bool)

(declare-fun e!345265 () Bool)

(declare-fun e!345276 () Bool)

(assert (=> b!603561 (= e!345265 e!345276)))

(declare-fun res!387573 () Bool)

(assert (=> b!603561 (=> (not res!387573) (not e!345276))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!603561 (= res!387573 (and (= lt!275032 (Found!6244 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17848 a!2986) index!984) (select (arr!17848 a!2986) j!136))) (not (= (select (arr!17848 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37188 (_ BitVec 32)) SeekEntryResult!6244)

(assert (=> b!603561 (= lt!275032 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17848 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603562 () Bool)

(declare-fun res!387557 () Bool)

(assert (=> b!603562 (=> (not res!387557) (not e!345267))))

(assert (=> b!603562 (= res!387557 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603563 () Bool)

(assert (=> b!603563 (= e!345275 true)))

(assert (=> b!603563 e!345271))

(declare-fun res!387574 () Bool)

(assert (=> b!603563 (=> (not res!387574) (not e!345271))))

(assert (=> b!603563 (= res!387574 (arrayContainsKey!0 lt!275038 (select (arr!17848 a!2986) j!136) j!136))))

(declare-fun b!603564 () Bool)

(declare-fun res!387566 () Bool)

(assert (=> b!603564 (=> (not res!387566) (not e!345267))))

(assert (=> b!603564 (= res!387566 (validKeyInArray!0 (select (arr!17848 a!2986) j!136)))))

(declare-fun b!603565 () Bool)

(declare-fun res!387559 () Bool)

(assert (=> b!603565 (=> (not res!387559) (not e!345272))))

(assert (=> b!603565 (= res!387559 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17848 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603566 () Bool)

(assert (=> b!603566 (= e!345272 e!345265)))

(declare-fun res!387570 () Bool)

(assert (=> b!603566 (=> (not res!387570) (not e!345265))))

(assert (=> b!603566 (= res!387570 (= (select (store (arr!17848 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603566 (= lt!275038 (array!37189 (store (arr!17848 a!2986) i!1108 k0!1786) (size!18212 a!2986)))))

(declare-fun b!603567 () Bool)

(declare-fun Unit!19121 () Unit!19117)

(assert (=> b!603567 (= e!345269 Unit!19121)))

(declare-fun b!603568 () Bool)

(assert (=> b!603568 (= e!345270 (arrayContainsKey!0 lt!275038 (select (arr!17848 a!2986) j!136) index!984))))

(declare-fun b!603569 () Bool)

(declare-fun Unit!19122 () Unit!19117)

(assert (=> b!603569 (= e!345266 Unit!19122)))

(declare-fun b!603570 () Bool)

(declare-fun e!345279 () Bool)

(assert (=> b!603570 (= e!345279 e!345273)))

(declare-fun res!387561 () Bool)

(assert (=> b!603570 (=> res!387561 e!345273)))

(assert (=> b!603570 (= res!387561 (or (not (= (select (arr!17848 a!2986) j!136) lt!275042)) (not (= (select (arr!17848 a!2986) j!136) lt!275039))))))

(assert (=> b!603570 e!345268))

(declare-fun res!387558 () Bool)

(assert (=> b!603570 (=> (not res!387558) (not e!345268))))

(assert (=> b!603570 (= res!387558 (= lt!275039 (select (arr!17848 a!2986) j!136)))))

(assert (=> b!603570 (= lt!275039 (select (store (arr!17848 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!603571 () Bool)

(assert (=> b!603571 (= e!345276 (not e!345279))))

(declare-fun res!387568 () Bool)

(assert (=> b!603571 (=> res!387568 e!345279)))

(declare-fun lt!275036 () SeekEntryResult!6244)

(assert (=> b!603571 (= res!387568 (not (= lt!275036 (Found!6244 index!984))))))

(declare-fun lt!275031 () Unit!19117)

(assert (=> b!603571 (= lt!275031 e!345266)))

(declare-fun c!68365 () Bool)

(assert (=> b!603571 (= c!68365 (= lt!275036 Undefined!6244))))

(assert (=> b!603571 (= lt!275036 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275042 lt!275038 mask!3053))))

(assert (=> b!603571 e!345277))

(declare-fun res!387571 () Bool)

(assert (=> b!603571 (=> (not res!387571) (not e!345277))))

(declare-fun lt!275034 () (_ BitVec 32))

(assert (=> b!603571 (= res!387571 (= lt!275040 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275034 vacantSpotIndex!68 lt!275042 lt!275038 mask!3053)))))

(assert (=> b!603571 (= lt!275040 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275034 vacantSpotIndex!68 (select (arr!17848 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603571 (= lt!275042 (select (store (arr!17848 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275044 () Unit!19117)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37188 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19117)

(assert (=> b!603571 (= lt!275044 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275034 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603571 (= lt!275034 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (= (and start!55170 res!387567) b!603549))

(assert (= (and b!603549 res!387565) b!603564))

(assert (= (and b!603564 res!387566) b!603558))

(assert (= (and b!603558 res!387569) b!603562))

(assert (= (and b!603562 res!387557) b!603556))

(assert (= (and b!603556 res!387572) b!603555))

(assert (= (and b!603555 res!387556) b!603554))

(assert (= (and b!603554 res!387560) b!603565))

(assert (= (and b!603565 res!387559) b!603566))

(assert (= (and b!603566 res!387570) b!603561))

(assert (= (and b!603561 res!387573) b!603571))

(assert (= (and b!603571 res!387571) b!603559))

(assert (= (and b!603571 c!68365) b!603557))

(assert (= (and b!603571 (not c!68365)) b!603569))

(assert (= (and b!603571 (not res!387568)) b!603570))

(assert (= (and b!603570 res!387558) b!603552))

(assert (= (and b!603552 (not res!387562)) b!603551))

(assert (= (and b!603551 res!387564) b!603568))

(assert (= (and b!603570 (not res!387561)) b!603550))

(assert (= (and b!603550 c!68366) b!603560))

(assert (= (and b!603550 (not c!68366)) b!603567))

(assert (= (and b!603550 (not res!387563)) b!603563))

(assert (= (and b!603563 res!387574) b!603553))

(declare-fun m!580817 () Bool)

(assert (=> b!603560 m!580817))

(declare-fun m!580819 () Bool)

(assert (=> b!603560 m!580819))

(assert (=> b!603560 m!580819))

(declare-fun m!580821 () Bool)

(assert (=> b!603560 m!580821))

(declare-fun m!580823 () Bool)

(assert (=> b!603560 m!580823))

(declare-fun m!580825 () Bool)

(assert (=> b!603560 m!580825))

(assert (=> b!603560 m!580819))

(declare-fun m!580827 () Bool)

(assert (=> b!603560 m!580827))

(assert (=> b!603560 m!580819))

(declare-fun m!580829 () Bool)

(assert (=> b!603560 m!580829))

(declare-fun m!580831 () Bool)

(assert (=> b!603560 m!580831))

(assert (=> b!603551 m!580819))

(assert (=> b!603551 m!580819))

(declare-fun m!580833 () Bool)

(assert (=> b!603551 m!580833))

(declare-fun m!580835 () Bool)

(assert (=> b!603565 m!580835))

(declare-fun m!580837 () Bool)

(assert (=> start!55170 m!580837))

(declare-fun m!580839 () Bool)

(assert (=> start!55170 m!580839))

(declare-fun m!580841 () Bool)

(assert (=> b!603558 m!580841))

(declare-fun m!580843 () Bool)

(assert (=> b!603554 m!580843))

(assert (=> b!603552 m!580819))

(assert (=> b!603570 m!580819))

(declare-fun m!580845 () Bool)

(assert (=> b!603570 m!580845))

(declare-fun m!580847 () Bool)

(assert (=> b!603570 m!580847))

(declare-fun m!580849 () Bool)

(assert (=> b!603555 m!580849))

(assert (=> b!603564 m!580819))

(assert (=> b!603564 m!580819))

(declare-fun m!580851 () Bool)

(assert (=> b!603564 m!580851))

(declare-fun m!580853 () Bool)

(assert (=> b!603561 m!580853))

(assert (=> b!603561 m!580819))

(assert (=> b!603561 m!580819))

(declare-fun m!580855 () Bool)

(assert (=> b!603561 m!580855))

(assert (=> b!603563 m!580819))

(assert (=> b!603563 m!580819))

(assert (=> b!603563 m!580833))

(assert (=> b!603566 m!580845))

(declare-fun m!580857 () Bool)

(assert (=> b!603566 m!580857))

(assert (=> b!603568 m!580819))

(assert (=> b!603568 m!580819))

(declare-fun m!580859 () Bool)

(assert (=> b!603568 m!580859))

(declare-fun m!580861 () Bool)

(assert (=> b!603556 m!580861))

(declare-fun m!580863 () Bool)

(assert (=> b!603571 m!580863))

(declare-fun m!580865 () Bool)

(assert (=> b!603571 m!580865))

(assert (=> b!603571 m!580819))

(declare-fun m!580867 () Bool)

(assert (=> b!603571 m!580867))

(assert (=> b!603571 m!580819))

(assert (=> b!603571 m!580845))

(declare-fun m!580869 () Bool)

(assert (=> b!603571 m!580869))

(declare-fun m!580871 () Bool)

(assert (=> b!603571 m!580871))

(declare-fun m!580873 () Bool)

(assert (=> b!603571 m!580873))

(declare-fun m!580875 () Bool)

(assert (=> b!603562 m!580875))

(assert (=> b!603553 m!580819))

(assert (=> b!603553 m!580819))

(assert (=> b!603553 m!580859))

(check-sat (not b!603556) (not b!603568) (not b!603558) (not start!55170) (not b!603551) (not b!603554) (not b!603562) (not b!603553) (not b!603561) (not b!603571) (not b!603560) (not b!603555) (not b!603564) (not b!603563))
(check-sat)
