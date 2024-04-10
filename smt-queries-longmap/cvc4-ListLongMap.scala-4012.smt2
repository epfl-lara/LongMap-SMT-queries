; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54548 () Bool)

(assert start!54548)

(declare-fun res!382087 () Bool)

(declare-fun e!340681 () Bool)

(assert (=> start!54548 (=> (not res!382087) (not e!340681))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54548 (= res!382087 (validMask!0 mask!3053))))

(assert (=> start!54548 e!340681))

(assert (=> start!54548 true))

(declare-datatypes ((array!37008 0))(
  ( (array!37009 (arr!17768 (Array (_ BitVec 32) (_ BitVec 64))) (size!18132 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37008)

(declare-fun array_inv!13564 (array!37008) Bool)

(assert (=> start!54548 (array_inv!13564 a!2986)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!596275 () Bool)

(declare-fun e!340678 () Bool)

(declare-fun lt!270815 () array!37008)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596275 (= e!340678 (arrayContainsKey!0 lt!270815 (select (arr!17768 a!2986) j!136) index!984))))

(declare-fun b!596276 () Bool)

(declare-fun res!382086 () Bool)

(assert (=> b!596276 (=> (not res!382086) (not e!340681))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!596276 (= res!382086 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596277 () Bool)

(declare-fun e!340675 () Bool)

(assert (=> b!596277 (= e!340681 e!340675)))

(declare-fun res!382094 () Bool)

(assert (=> b!596277 (=> (not res!382094) (not e!340675))))

(declare-datatypes ((SeekEntryResult!6208 0))(
  ( (MissingZero!6208 (index!27080 (_ BitVec 32))) (Found!6208 (index!27081 (_ BitVec 32))) (Intermediate!6208 (undefined!7020 Bool) (index!27082 (_ BitVec 32)) (x!55876 (_ BitVec 32))) (Undefined!6208) (MissingVacant!6208 (index!27083 (_ BitVec 32))) )
))
(declare-fun lt!270813 () SeekEntryResult!6208)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596277 (= res!382094 (or (= lt!270813 (MissingZero!6208 i!1108)) (= lt!270813 (MissingVacant!6208 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37008 (_ BitVec 32)) SeekEntryResult!6208)

(assert (=> b!596277 (= lt!270813 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!596278 () Bool)

(declare-fun res!382084 () Bool)

(assert (=> b!596278 (=> (not res!382084) (not e!340681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596278 (= res!382084 (validKeyInArray!0 (select (arr!17768 a!2986) j!136)))))

(declare-fun b!596279 () Bool)

(declare-fun res!382097 () Bool)

(assert (=> b!596279 (=> (not res!382097) (not e!340675))))

(declare-datatypes ((List!11809 0))(
  ( (Nil!11806) (Cons!11805 (h!12850 (_ BitVec 64)) (t!18037 List!11809)) )
))
(declare-fun arrayNoDuplicates!0 (array!37008 (_ BitVec 32) List!11809) Bool)

(assert (=> b!596279 (= res!382097 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11806))))

(declare-fun b!596280 () Bool)

(declare-fun e!340684 () Bool)

(declare-fun lt!270806 () SeekEntryResult!6208)

(declare-fun lt!270807 () SeekEntryResult!6208)

(assert (=> b!596280 (= e!340684 (= lt!270806 lt!270807))))

(declare-fun b!596281 () Bool)

(declare-fun e!340676 () Bool)

(assert (=> b!596281 (= e!340676 true)))

(declare-fun lt!270810 () Bool)

(declare-fun contains!2944 (List!11809 (_ BitVec 64)) Bool)

(assert (=> b!596281 (= lt!270810 (contains!2944 Nil!11806 k!1786))))

(declare-fun b!596282 () Bool)

(declare-fun res!382092 () Bool)

(assert (=> b!596282 (=> (not res!382092) (not e!340681))))

(assert (=> b!596282 (= res!382092 (validKeyInArray!0 k!1786))))

(declare-fun b!596283 () Bool)

(declare-fun res!382090 () Bool)

(assert (=> b!596283 (=> (not res!382090) (not e!340675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37008 (_ BitVec 32)) Bool)

(assert (=> b!596283 (= res!382090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596284 () Bool)

(declare-fun e!340686 () Bool)

(declare-fun e!340679 () Bool)

(assert (=> b!596284 (= e!340686 (not e!340679))))

(declare-fun res!382095 () Bool)

(assert (=> b!596284 (=> res!382095 e!340679)))

(declare-fun lt!270808 () SeekEntryResult!6208)

(assert (=> b!596284 (= res!382095 (not (= lt!270808 (Found!6208 index!984))))))

(declare-datatypes ((Unit!18750 0))(
  ( (Unit!18751) )
))
(declare-fun lt!270809 () Unit!18750)

(declare-fun e!340674 () Unit!18750)

(assert (=> b!596284 (= lt!270809 e!340674)))

(declare-fun c!67466 () Bool)

(assert (=> b!596284 (= c!67466 (= lt!270808 Undefined!6208))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!270817 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37008 (_ BitVec 32)) SeekEntryResult!6208)

(assert (=> b!596284 (= lt!270808 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270817 lt!270815 mask!3053))))

(assert (=> b!596284 e!340684))

(declare-fun res!382082 () Bool)

(assert (=> b!596284 (=> (not res!382082) (not e!340684))))

(declare-fun lt!270812 () (_ BitVec 32))

(assert (=> b!596284 (= res!382082 (= lt!270807 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270812 vacantSpotIndex!68 lt!270817 lt!270815 mask!3053)))))

(assert (=> b!596284 (= lt!270807 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270812 vacantSpotIndex!68 (select (arr!17768 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596284 (= lt!270817 (select (store (arr!17768 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270811 () Unit!18750)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37008 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18750)

(assert (=> b!596284 (= lt!270811 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270812 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596284 (= lt!270812 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596285 () Bool)

(declare-fun res!382080 () Bool)

(assert (=> b!596285 (=> (not res!382080) (not e!340675))))

(assert (=> b!596285 (= res!382080 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17768 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596286 () Bool)

(declare-fun e!340682 () Bool)

(assert (=> b!596286 (= e!340679 e!340682)))

(declare-fun res!382088 () Bool)

(assert (=> b!596286 (=> res!382088 e!340682)))

(declare-fun lt!270814 () (_ BitVec 64))

(assert (=> b!596286 (= res!382088 (or (not (= (select (arr!17768 a!2986) j!136) lt!270817)) (not (= (select (arr!17768 a!2986) j!136) lt!270814)) (bvsge j!136 index!984)))))

(declare-fun e!340683 () Bool)

(assert (=> b!596286 e!340683))

(declare-fun res!382085 () Bool)

(assert (=> b!596286 (=> (not res!382085) (not e!340683))))

(assert (=> b!596286 (= res!382085 (= lt!270814 (select (arr!17768 a!2986) j!136)))))

(assert (=> b!596286 (= lt!270814 (select (store (arr!17768 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!596287 () Bool)

(declare-fun Unit!18752 () Unit!18750)

(assert (=> b!596287 (= e!340674 Unit!18752)))

(assert (=> b!596287 false))

(declare-fun b!596288 () Bool)

(declare-fun res!382096 () Bool)

(assert (=> b!596288 (=> res!382096 e!340676)))

(assert (=> b!596288 (= res!382096 (contains!2944 Nil!11806 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596289 () Bool)

(declare-fun res!382078 () Bool)

(assert (=> b!596289 (=> res!382078 e!340676)))

(declare-fun noDuplicate!263 (List!11809) Bool)

(assert (=> b!596289 (= res!382078 (not (noDuplicate!263 Nil!11806)))))

(declare-fun b!596290 () Bool)

(declare-fun Unit!18753 () Unit!18750)

(assert (=> b!596290 (= e!340674 Unit!18753)))

(declare-fun b!596291 () Bool)

(declare-fun e!340685 () Bool)

(assert (=> b!596291 (= e!340685 e!340686)))

(declare-fun res!382079 () Bool)

(assert (=> b!596291 (=> (not res!382079) (not e!340686))))

(assert (=> b!596291 (= res!382079 (and (= lt!270806 (Found!6208 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17768 a!2986) index!984) (select (arr!17768 a!2986) j!136))) (not (= (select (arr!17768 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!596291 (= lt!270806 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17768 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596292 () Bool)

(declare-fun res!382089 () Bool)

(assert (=> b!596292 (=> res!382089 e!340676)))

(assert (=> b!596292 (= res!382089 (contains!2944 Nil!11806 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596293 () Bool)

(assert (=> b!596293 (= e!340682 e!340676)))

(declare-fun res!382093 () Bool)

(assert (=> b!596293 (=> res!382093 e!340676)))

(assert (=> b!596293 (= res!382093 (or (bvsge (size!18132 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18132 a!2986))))))

(assert (=> b!596293 (arrayContainsKey!0 lt!270815 (select (arr!17768 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270816 () Unit!18750)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37008 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18750)

(assert (=> b!596293 (= lt!270816 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270815 (select (arr!17768 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596294 () Bool)

(declare-fun e!340677 () Bool)

(assert (=> b!596294 (= e!340677 e!340678)))

(declare-fun res!382091 () Bool)

(assert (=> b!596294 (=> (not res!382091) (not e!340678))))

(assert (=> b!596294 (= res!382091 (arrayContainsKey!0 lt!270815 (select (arr!17768 a!2986) j!136) j!136))))

(declare-fun b!596295 () Bool)

(declare-fun res!382083 () Bool)

(assert (=> b!596295 (=> (not res!382083) (not e!340681))))

(assert (=> b!596295 (= res!382083 (and (= (size!18132 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18132 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18132 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596296 () Bool)

(assert (=> b!596296 (= e!340683 e!340677)))

(declare-fun res!382081 () Bool)

(assert (=> b!596296 (=> res!382081 e!340677)))

(assert (=> b!596296 (= res!382081 (or (not (= (select (arr!17768 a!2986) j!136) lt!270817)) (not (= (select (arr!17768 a!2986) j!136) lt!270814)) (bvsge j!136 index!984)))))

(declare-fun b!596297 () Bool)

(assert (=> b!596297 (= e!340675 e!340685)))

(declare-fun res!382077 () Bool)

(assert (=> b!596297 (=> (not res!382077) (not e!340685))))

(assert (=> b!596297 (= res!382077 (= (select (store (arr!17768 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596297 (= lt!270815 (array!37009 (store (arr!17768 a!2986) i!1108 k!1786) (size!18132 a!2986)))))

(assert (= (and start!54548 res!382087) b!596295))

(assert (= (and b!596295 res!382083) b!596278))

(assert (= (and b!596278 res!382084) b!596282))

(assert (= (and b!596282 res!382092) b!596276))

(assert (= (and b!596276 res!382086) b!596277))

(assert (= (and b!596277 res!382094) b!596283))

(assert (= (and b!596283 res!382090) b!596279))

(assert (= (and b!596279 res!382097) b!596285))

(assert (= (and b!596285 res!382080) b!596297))

(assert (= (and b!596297 res!382077) b!596291))

(assert (= (and b!596291 res!382079) b!596284))

(assert (= (and b!596284 res!382082) b!596280))

(assert (= (and b!596284 c!67466) b!596287))

(assert (= (and b!596284 (not c!67466)) b!596290))

(assert (= (and b!596284 (not res!382095)) b!596286))

(assert (= (and b!596286 res!382085) b!596296))

(assert (= (and b!596296 (not res!382081)) b!596294))

(assert (= (and b!596294 res!382091) b!596275))

(assert (= (and b!596286 (not res!382088)) b!596293))

(assert (= (and b!596293 (not res!382093)) b!596289))

(assert (= (and b!596289 (not res!382078)) b!596292))

(assert (= (and b!596292 (not res!382089)) b!596288))

(assert (= (and b!596288 (not res!382096)) b!596281))

(declare-fun m!573793 () Bool)

(assert (=> b!596282 m!573793))

(declare-fun m!573795 () Bool)

(assert (=> b!596292 m!573795))

(declare-fun m!573797 () Bool)

(assert (=> b!596284 m!573797))

(declare-fun m!573799 () Bool)

(assert (=> b!596284 m!573799))

(declare-fun m!573801 () Bool)

(assert (=> b!596284 m!573801))

(declare-fun m!573803 () Bool)

(assert (=> b!596284 m!573803))

(declare-fun m!573805 () Bool)

(assert (=> b!596284 m!573805))

(declare-fun m!573807 () Bool)

(assert (=> b!596284 m!573807))

(assert (=> b!596284 m!573801))

(declare-fun m!573809 () Bool)

(assert (=> b!596284 m!573809))

(declare-fun m!573811 () Bool)

(assert (=> b!596284 m!573811))

(declare-fun m!573813 () Bool)

(assert (=> b!596281 m!573813))

(declare-fun m!573815 () Bool)

(assert (=> b!596289 m!573815))

(declare-fun m!573817 () Bool)

(assert (=> b!596285 m!573817))

(assert (=> b!596297 m!573803))

(declare-fun m!573819 () Bool)

(assert (=> b!596297 m!573819))

(assert (=> b!596294 m!573801))

(assert (=> b!596294 m!573801))

(declare-fun m!573821 () Bool)

(assert (=> b!596294 m!573821))

(declare-fun m!573823 () Bool)

(assert (=> b!596288 m!573823))

(declare-fun m!573825 () Bool)

(assert (=> b!596277 m!573825))

(declare-fun m!573827 () Bool)

(assert (=> b!596283 m!573827))

(declare-fun m!573829 () Bool)

(assert (=> b!596276 m!573829))

(declare-fun m!573831 () Bool)

(assert (=> b!596291 m!573831))

(assert (=> b!596291 m!573801))

(assert (=> b!596291 m!573801))

(declare-fun m!573833 () Bool)

(assert (=> b!596291 m!573833))

(assert (=> b!596296 m!573801))

(declare-fun m!573835 () Bool)

(assert (=> b!596279 m!573835))

(assert (=> b!596286 m!573801))

(assert (=> b!596286 m!573803))

(declare-fun m!573837 () Bool)

(assert (=> b!596286 m!573837))

(assert (=> b!596275 m!573801))

(assert (=> b!596275 m!573801))

(declare-fun m!573839 () Bool)

(assert (=> b!596275 m!573839))

(assert (=> b!596278 m!573801))

(assert (=> b!596278 m!573801))

(declare-fun m!573841 () Bool)

(assert (=> b!596278 m!573841))

(declare-fun m!573843 () Bool)

(assert (=> start!54548 m!573843))

(declare-fun m!573845 () Bool)

(assert (=> start!54548 m!573845))

(assert (=> b!596293 m!573801))

(assert (=> b!596293 m!573801))

(declare-fun m!573847 () Bool)

(assert (=> b!596293 m!573847))

(assert (=> b!596293 m!573801))

(declare-fun m!573849 () Bool)

(assert (=> b!596293 m!573849))

(push 1)

