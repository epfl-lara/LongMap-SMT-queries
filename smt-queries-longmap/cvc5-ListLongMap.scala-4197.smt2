; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57272 () Bool)

(assert start!57272)

(declare-fun b!634080 () Bool)

(declare-fun res!410177 () Bool)

(declare-fun e!362581 () Bool)

(assert (=> b!634080 (=> (not res!410177) (not e!362581))))

(declare-datatypes ((array!38182 0))(
  ( (array!38183 (arr!18321 (Array (_ BitVec 32) (_ BitVec 64))) (size!18685 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38182)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634080 (= res!410177 (validKeyInArray!0 (select (arr!18321 a!2986) j!136)))))

(declare-fun b!634081 () Bool)

(declare-fun res!410170 () Bool)

(declare-fun e!362580 () Bool)

(assert (=> b!634081 (=> (not res!410170) (not e!362580))))

(declare-datatypes ((List!12362 0))(
  ( (Nil!12359) (Cons!12358 (h!13403 (_ BitVec 64)) (t!18590 List!12362)) )
))
(declare-fun arrayNoDuplicates!0 (array!38182 (_ BitVec 32) List!12362) Bool)

(assert (=> b!634081 (= res!410170 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12359))))

(declare-fun b!634082 () Bool)

(declare-fun e!362583 () Bool)

(declare-fun e!362576 () Bool)

(assert (=> b!634082 (= e!362583 e!362576)))

(declare-fun res!410167 () Bool)

(assert (=> b!634082 (=> (not res!410167) (not e!362576))))

(declare-fun lt!293129 () array!38182)

(declare-fun arrayContainsKey!0 (array!38182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634082 (= res!410167 (arrayContainsKey!0 lt!293129 (select (arr!18321 a!2986) j!136) j!136))))

(declare-fun b!634083 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!634083 (= e!362576 (arrayContainsKey!0 lt!293129 (select (arr!18321 a!2986) j!136) index!984))))

(declare-fun lt!293123 () (_ BitVec 64))

(declare-fun b!634084 () Bool)

(declare-fun lt!293126 () (_ BitVec 64))

(declare-fun e!362579 () Bool)

(assert (=> b!634084 (= e!362579 (or (not (= (select (arr!18321 a!2986) j!136) lt!293126)) (not (= (select (arr!18321 a!2986) j!136) lt!293123)) (bvsge j!136 index!984) (bvsge index!984 (size!18685 a!2986)) (bvslt (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000) (bvslt (size!18685 a!2986) #b01111111111111111111111111111111)))))

(declare-fun e!362577 () Bool)

(assert (=> b!634084 e!362577))

(declare-fun res!410172 () Bool)

(assert (=> b!634084 (=> (not res!410172) (not e!362577))))

(assert (=> b!634084 (= res!410172 (= lt!293123 (select (arr!18321 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!634084 (= lt!293123 (select (store (arr!18321 a!2986) i!1108 k!1786) index!984))))

(declare-fun res!410176 () Bool)

(assert (=> start!57272 (=> (not res!410176) (not e!362581))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57272 (= res!410176 (validMask!0 mask!3053))))

(assert (=> start!57272 e!362581))

(assert (=> start!57272 true))

(declare-fun array_inv!14117 (array!38182) Bool)

(assert (=> start!57272 (array_inv!14117 a!2986)))

(declare-fun b!634085 () Bool)

(assert (=> b!634085 (= e!362577 e!362583)))

(declare-fun res!410171 () Bool)

(assert (=> b!634085 (=> res!410171 e!362583)))

(assert (=> b!634085 (= res!410171 (or (not (= (select (arr!18321 a!2986) j!136) lt!293126)) (not (= (select (arr!18321 a!2986) j!136) lt!293123)) (bvsge j!136 index!984)))))

(declare-fun b!634086 () Bool)

(declare-datatypes ((Unit!21378 0))(
  ( (Unit!21379) )
))
(declare-fun e!362582 () Unit!21378)

(declare-fun Unit!21380 () Unit!21378)

(assert (=> b!634086 (= e!362582 Unit!21380)))

(declare-fun b!634087 () Bool)

(declare-fun res!410165 () Bool)

(assert (=> b!634087 (=> (not res!410165) (not e!362580))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!634087 (= res!410165 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18321 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634088 () Bool)

(declare-fun res!410173 () Bool)

(assert (=> b!634088 (=> (not res!410173) (not e!362581))))

(assert (=> b!634088 (= res!410173 (and (= (size!18685 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18685 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18685 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634089 () Bool)

(declare-fun res!410168 () Bool)

(assert (=> b!634089 (=> (not res!410168) (not e!362581))))

(assert (=> b!634089 (= res!410168 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634090 () Bool)

(declare-fun res!410175 () Bool)

(assert (=> b!634090 (=> (not res!410175) (not e!362581))))

(assert (=> b!634090 (= res!410175 (validKeyInArray!0 k!1786))))

(declare-fun b!634091 () Bool)

(declare-fun e!362574 () Bool)

(assert (=> b!634091 (= e!362580 e!362574)))

(declare-fun res!410162 () Bool)

(assert (=> b!634091 (=> (not res!410162) (not e!362574))))

(assert (=> b!634091 (= res!410162 (= (select (store (arr!18321 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634091 (= lt!293129 (array!38183 (store (arr!18321 a!2986) i!1108 k!1786) (size!18685 a!2986)))))

(declare-fun b!634092 () Bool)

(declare-fun Unit!21381 () Unit!21378)

(assert (=> b!634092 (= e!362582 Unit!21381)))

(assert (=> b!634092 false))

(declare-fun b!634093 () Bool)

(declare-fun e!362578 () Bool)

(declare-datatypes ((SeekEntryResult!6761 0))(
  ( (MissingZero!6761 (index!29343 (_ BitVec 32))) (Found!6761 (index!29344 (_ BitVec 32))) (Intermediate!6761 (undefined!7573 Bool) (index!29345 (_ BitVec 32)) (x!58086 (_ BitVec 32))) (Undefined!6761) (MissingVacant!6761 (index!29346 (_ BitVec 32))) )
))
(declare-fun lt!293127 () SeekEntryResult!6761)

(declare-fun lt!293131 () SeekEntryResult!6761)

(assert (=> b!634093 (= e!362578 (= lt!293127 lt!293131))))

(declare-fun b!634094 () Bool)

(assert (=> b!634094 (= e!362581 e!362580)))

(declare-fun res!410166 () Bool)

(assert (=> b!634094 (=> (not res!410166) (not e!362580))))

(declare-fun lt!293125 () SeekEntryResult!6761)

(assert (=> b!634094 (= res!410166 (or (= lt!293125 (MissingZero!6761 i!1108)) (= lt!293125 (MissingVacant!6761 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38182 (_ BitVec 32)) SeekEntryResult!6761)

(assert (=> b!634094 (= lt!293125 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!634095 () Bool)

(declare-fun e!362575 () Bool)

(assert (=> b!634095 (= e!362574 e!362575)))

(declare-fun res!410164 () Bool)

(assert (=> b!634095 (=> (not res!410164) (not e!362575))))

(assert (=> b!634095 (= res!410164 (and (= lt!293127 (Found!6761 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18321 a!2986) index!984) (select (arr!18321 a!2986) j!136))) (not (= (select (arr!18321 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38182 (_ BitVec 32)) SeekEntryResult!6761)

(assert (=> b!634095 (= lt!293127 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18321 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634096 () Bool)

(assert (=> b!634096 (= e!362575 (not e!362579))))

(declare-fun res!410169 () Bool)

(assert (=> b!634096 (=> res!410169 e!362579)))

(declare-fun lt!293124 () SeekEntryResult!6761)

(assert (=> b!634096 (= res!410169 (not (= lt!293124 (Found!6761 index!984))))))

(declare-fun lt!293122 () Unit!21378)

(assert (=> b!634096 (= lt!293122 e!362582)))

(declare-fun c!72326 () Bool)

(assert (=> b!634096 (= c!72326 (= lt!293124 Undefined!6761))))

(assert (=> b!634096 (= lt!293124 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293126 lt!293129 mask!3053))))

(assert (=> b!634096 e!362578))

(declare-fun res!410174 () Bool)

(assert (=> b!634096 (=> (not res!410174) (not e!362578))))

(declare-fun lt!293128 () (_ BitVec 32))

(assert (=> b!634096 (= res!410174 (= lt!293131 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293128 vacantSpotIndex!68 lt!293126 lt!293129 mask!3053)))))

(assert (=> b!634096 (= lt!293131 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293128 vacantSpotIndex!68 (select (arr!18321 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!634096 (= lt!293126 (select (store (arr!18321 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!293130 () Unit!21378)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38182 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21378)

(assert (=> b!634096 (= lt!293130 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293128 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634096 (= lt!293128 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!634097 () Bool)

(declare-fun res!410163 () Bool)

(assert (=> b!634097 (=> (not res!410163) (not e!362580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38182 (_ BitVec 32)) Bool)

(assert (=> b!634097 (= res!410163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!57272 res!410176) b!634088))

(assert (= (and b!634088 res!410173) b!634080))

(assert (= (and b!634080 res!410177) b!634090))

(assert (= (and b!634090 res!410175) b!634089))

(assert (= (and b!634089 res!410168) b!634094))

(assert (= (and b!634094 res!410166) b!634097))

(assert (= (and b!634097 res!410163) b!634081))

(assert (= (and b!634081 res!410170) b!634087))

(assert (= (and b!634087 res!410165) b!634091))

(assert (= (and b!634091 res!410162) b!634095))

(assert (= (and b!634095 res!410164) b!634096))

(assert (= (and b!634096 res!410174) b!634093))

(assert (= (and b!634096 c!72326) b!634092))

(assert (= (and b!634096 (not c!72326)) b!634086))

(assert (= (and b!634096 (not res!410169)) b!634084))

(assert (= (and b!634084 res!410172) b!634085))

(assert (= (and b!634085 (not res!410171)) b!634082))

(assert (= (and b!634082 res!410167) b!634083))

(declare-fun m!608639 () Bool)

(assert (=> b!634087 m!608639))

(declare-fun m!608641 () Bool)

(assert (=> b!634081 m!608641))

(declare-fun m!608643 () Bool)

(assert (=> b!634095 m!608643))

(declare-fun m!608645 () Bool)

(assert (=> b!634095 m!608645))

(assert (=> b!634095 m!608645))

(declare-fun m!608647 () Bool)

(assert (=> b!634095 m!608647))

(assert (=> b!634083 m!608645))

(assert (=> b!634083 m!608645))

(declare-fun m!608649 () Bool)

(assert (=> b!634083 m!608649))

(assert (=> b!634085 m!608645))

(declare-fun m!608651 () Bool)

(assert (=> b!634094 m!608651))

(assert (=> b!634082 m!608645))

(assert (=> b!634082 m!608645))

(declare-fun m!608653 () Bool)

(assert (=> b!634082 m!608653))

(declare-fun m!608655 () Bool)

(assert (=> b!634097 m!608655))

(assert (=> b!634080 m!608645))

(assert (=> b!634080 m!608645))

(declare-fun m!608657 () Bool)

(assert (=> b!634080 m!608657))

(assert (=> b!634084 m!608645))

(declare-fun m!608659 () Bool)

(assert (=> b!634084 m!608659))

(declare-fun m!608661 () Bool)

(assert (=> b!634084 m!608661))

(declare-fun m!608663 () Bool)

(assert (=> b!634096 m!608663))

(assert (=> b!634096 m!608645))

(declare-fun m!608665 () Bool)

(assert (=> b!634096 m!608665))

(assert (=> b!634096 m!608659))

(assert (=> b!634096 m!608645))

(declare-fun m!608667 () Bool)

(assert (=> b!634096 m!608667))

(declare-fun m!608669 () Bool)

(assert (=> b!634096 m!608669))

(declare-fun m!608671 () Bool)

(assert (=> b!634096 m!608671))

(declare-fun m!608673 () Bool)

(assert (=> b!634096 m!608673))

(declare-fun m!608675 () Bool)

(assert (=> b!634090 m!608675))

(declare-fun m!608677 () Bool)

(assert (=> b!634089 m!608677))

(declare-fun m!608679 () Bool)

(assert (=> start!57272 m!608679))

(declare-fun m!608681 () Bool)

(assert (=> start!57272 m!608681))

(assert (=> b!634091 m!608659))

(declare-fun m!608683 () Bool)

(assert (=> b!634091 m!608683))

(push 1)

(assert (not b!634081))

(assert (not b!634097))

(assert (not b!634095))

(assert (not b!634094))

(assert (not b!634082))

(assert (not start!57272))

(assert (not b!634083))

(assert (not b!634080))

(assert (not b!634096))

(assert (not b!634089))

(assert (not b!634090))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89617 () Bool)

(declare-fun res!410292 () Bool)

(declare-fun e!362689 () Bool)

(assert (=> d!89617 (=> res!410292 e!362689)))

(assert (=> d!89617 (= res!410292 (= (select (arr!18321 lt!293129) j!136) (select (arr!18321 a!2986) j!136)))))

(assert (=> d!89617 (= (arrayContainsKey!0 lt!293129 (select (arr!18321 a!2986) j!136) j!136) e!362689)))

(declare-fun b!634266 () Bool)

(declare-fun e!362690 () Bool)

(assert (=> b!634266 (= e!362689 e!362690)))

(declare-fun res!410293 () Bool)

(assert (=> b!634266 (=> (not res!410293) (not e!362690))))

(assert (=> b!634266 (= res!410293 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18685 lt!293129)))))

(declare-fun b!634267 () Bool)

(assert (=> b!634267 (= e!362690 (arrayContainsKey!0 lt!293129 (select (arr!18321 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89617 (not res!410292)) b!634266))

(assert (= (and b!634266 res!410293) b!634267))

(declare-fun m!608817 () Bool)

(assert (=> d!89617 m!608817))

(assert (=> b!634267 m!608645))

(declare-fun m!608819 () Bool)

(assert (=> b!634267 m!608819))

(assert (=> b!634082 d!89617))

(declare-fun bm!33380 () Bool)

(declare-fun call!33383 () Bool)

(assert (=> bm!33380 (= call!33383 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!634278 () Bool)

(declare-fun e!362700 () Bool)

(declare-fun e!362701 () Bool)

(assert (=> b!634278 (= e!362700 e!362701)))

(declare-fun lt!293224 () (_ BitVec 64))

(assert (=> b!634278 (= lt!293224 (select (arr!18321 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!293222 () Unit!21378)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38182 (_ BitVec 64) (_ BitVec 32)) Unit!21378)

(assert (=> b!634278 (= lt!293222 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!293224 #b00000000000000000000000000000000))))

(assert (=> b!634278 (arrayContainsKey!0 a!2986 lt!293224 #b00000000000000000000000000000000)))

(declare-fun lt!293223 () Unit!21378)

(assert (=> b!634278 (= lt!293223 lt!293222)))

(declare-fun res!410300 () Bool)

(assert (=> b!634278 (= res!410300 (= (seekEntryOrOpen!0 (select (arr!18321 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6761 #b00000000000000000000000000000000)))))

(assert (=> b!634278 (=> (not res!410300) (not e!362701))))

(declare-fun d!89623 () Bool)

(declare-fun res!410301 () Bool)

(declare-fun e!362699 () Bool)

(assert (=> d!89623 (=> res!410301 e!362699)))

(assert (=> d!89623 (= res!410301 (bvsge #b00000000000000000000000000000000 (size!18685 a!2986)))))

(assert (=> d!89623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!362699)))

(declare-fun b!634279 () Bool)

(assert (=> b!634279 (= e!362699 e!362700)))

(declare-fun c!72356 () Bool)

(assert (=> b!634279 (= c!72356 (validKeyInArray!0 (select (arr!18321 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!634280 () Bool)

(assert (=> b!634280 (= e!362700 call!33383)))

(declare-fun b!634281 () Bool)

(assert (=> b!634281 (= e!362701 call!33383)))

(assert (= (and d!89623 (not res!410301)) b!634279))

(assert (= (and b!634279 c!72356) b!634278))

(assert (= (and b!634279 (not c!72356)) b!634280))

(assert (= (and b!634278 res!410300) b!634281))

(assert (= (or b!634281 b!634280) bm!33380))

(declare-fun m!608823 () Bool)

(assert (=> bm!33380 m!608823))

(declare-fun m!608825 () Bool)

(assert (=> b!634278 m!608825))

(declare-fun m!608827 () Bool)

(assert (=> b!634278 m!608827))

(declare-fun m!608829 () Bool)

(assert (=> b!634278 m!608829))

(assert (=> b!634278 m!608825))

(declare-fun m!608831 () Bool)

(assert (=> b!634278 m!608831))

(assert (=> b!634279 m!608825))

(assert (=> b!634279 m!608825))

(declare-fun m!608833 () Bool)

(assert (=> b!634279 m!608833))

(assert (=> b!634097 d!89623))

(declare-fun b!634307 () Bool)

(declare-fun e!362722 () Bool)

(declare-fun contains!3095 (List!12362 (_ BitVec 64)) Bool)

(assert (=> b!634307 (= e!362722 (contains!3095 Nil!12359 (select (arr!18321 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89637 () Bool)

(declare-fun res!410317 () Bool)

(declare-fun e!362724 () Bool)

(assert (=> d!89637 (=> res!410317 e!362724)))

(assert (=> d!89637 (= res!410317 (bvsge #b00000000000000000000000000000000 (size!18685 a!2986)))))

(assert (=> d!89637 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12359) e!362724)))

(declare-fun bm!33386 () Bool)

(declare-fun call!33389 () Bool)

(declare-fun c!72362 () Bool)

(assert (=> bm!33386 (= call!33389 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72362 (Cons!12358 (select (arr!18321 a!2986) #b00000000000000000000000000000000) Nil!12359) Nil!12359)))))

(declare-fun b!634308 () Bool)

(declare-fun e!362723 () Bool)

(assert (=> b!634308 (= e!362723 call!33389)))

(declare-fun b!634309 () Bool)

(assert (=> b!634309 (= e!362723 call!33389)))

(declare-fun b!634310 () Bool)

(declare-fun e!362725 () Bool)

(assert (=> b!634310 (= e!362725 e!362723)))

(assert (=> b!634310 (= c!72362 (validKeyInArray!0 (select (arr!18321 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!634311 () Bool)

(assert (=> b!634311 (= e!362724 e!362725)))

(declare-fun res!410318 () Bool)

(assert (=> b!634311 (=> (not res!410318) (not e!362725))))

(assert (=> b!634311 (= res!410318 (not e!362722))))

(declare-fun res!410319 () Bool)

(assert (=> b!634311 (=> (not res!410319) (not e!362722))))

(assert (=> b!634311 (= res!410319 (validKeyInArray!0 (select (arr!18321 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89637 (not res!410317)) b!634311))

(assert (= (and b!634311 res!410319) b!634307))

(assert (= (and b!634311 res!410318) b!634310))

(assert (= (and b!634310 c!72362) b!634309))

(assert (= (and b!634310 (not c!72362)) b!634308))

(assert (= (or b!634309 b!634308) bm!33386))

(assert (=> b!634307 m!608825))

(assert (=> b!634307 m!608825))

(declare-fun m!608839 () Bool)

(assert (=> b!634307 m!608839))

(assert (=> bm!33386 m!608825))

(declare-fun m!608841 () Bool)

(assert (=> bm!33386 m!608841))

(assert (=> b!634310 m!608825))

(assert (=> b!634310 m!608825))

(assert (=> b!634310 m!608833))

(assert (=> b!634311 m!608825))

(assert (=> b!634311 m!608825))

(assert (=> b!634311 m!608833))

(assert (=> b!634081 d!89637))

(declare-fun b!634363 () Bool)

(declare-fun e!362753 () SeekEntryResult!6761)

(assert (=> b!634363 (= e!362753 (MissingVacant!6761 vacantSpotIndex!68))))

(declare-fun b!634364 () Bool)

(declare-fun e!362755 () SeekEntryResult!6761)

(assert (=> b!634364 (= e!362755 (Found!6761 lt!293128))))

(declare-fun b!634365 () Bool)

(declare-fun e!362754 () SeekEntryResult!6761)

(assert (=> b!634365 (= e!362754 Undefined!6761)))

(declare-fun b!634366 () Bool)

(assert (=> b!634366 (= e!362754 e!362755)))

(declare-fun c!72388 () Bool)

(declare-fun lt!293247 () (_ BitVec 64))

(assert (=> b!634366 (= c!72388 (= lt!293247 lt!293126))))

(declare-fun d!89641 () Bool)

(declare-fun lt!293248 () SeekEntryResult!6761)

(assert (=> d!89641 (and (or (is-Undefined!6761 lt!293248) (not (is-Found!6761 lt!293248)) (and (bvsge (index!29344 lt!293248) #b00000000000000000000000000000000) (bvslt (index!29344 lt!293248) (size!18685 lt!293129)))) (or (is-Undefined!6761 lt!293248) (is-Found!6761 lt!293248) (not (is-MissingVacant!6761 lt!293248)) (not (= (index!29346 lt!293248) vacantSpotIndex!68)) (and (bvsge (index!29346 lt!293248) #b00000000000000000000000000000000) (bvslt (index!29346 lt!293248) (size!18685 lt!293129)))) (or (is-Undefined!6761 lt!293248) (ite (is-Found!6761 lt!293248) (= (select (arr!18321 lt!293129) (index!29344 lt!293248)) lt!293126) (and (is-MissingVacant!6761 lt!293248) (= (index!29346 lt!293248) vacantSpotIndex!68) (= (select (arr!18321 lt!293129) (index!29346 lt!293248)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89641 (= lt!293248 e!362754)))

(declare-fun c!72387 () Bool)

(assert (=> d!89641 (= c!72387 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89641 (= lt!293247 (select (arr!18321 lt!293129) lt!293128))))

(assert (=> d!89641 (validMask!0 mask!3053)))

(assert (=> d!89641 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293128 vacantSpotIndex!68 lt!293126 lt!293129 mask!3053) lt!293248)))

(declare-fun b!634367 () Bool)

(declare-fun c!72389 () Bool)

(assert (=> b!634367 (= c!72389 (= lt!293247 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634367 (= e!362755 e!362753)))

(declare-fun b!634368 () Bool)

(assert (=> b!634368 (= e!362753 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!293128 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!293126 lt!293129 mask!3053))))

(assert (= (and d!89641 c!72387) b!634365))

(assert (= (and d!89641 (not c!72387)) b!634366))

