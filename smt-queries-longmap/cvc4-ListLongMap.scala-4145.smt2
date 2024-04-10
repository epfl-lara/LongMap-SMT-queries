; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56514 () Bool)

(assert start!56514)

(declare-fun b!626309 () Bool)

(declare-fun res!404158 () Bool)

(declare-fun e!358844 () Bool)

(assert (=> b!626309 (=> (not res!404158) (not e!358844))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37851 0))(
  ( (array!37852 (arr!18167 (Array (_ BitVec 32) (_ BitVec 64))) (size!18531 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37851)

(assert (=> b!626309 (= res!404158 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18167 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18167 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626310 () Bool)

(declare-fun res!404154 () Bool)

(declare-fun e!358843 () Bool)

(assert (=> b!626310 (=> (not res!404154) (not e!358843))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626310 (= res!404154 (validKeyInArray!0 (select (arr!18167 a!2986) j!136)))))

(declare-fun b!626311 () Bool)

(declare-fun res!404156 () Bool)

(assert (=> b!626311 (=> (not res!404156) (not e!358843))))

(assert (=> b!626311 (= res!404156 (and (= (size!18531 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18531 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18531 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626312 () Bool)

(assert (=> b!626312 (= e!358843 e!358844)))

(declare-fun res!404162 () Bool)

(assert (=> b!626312 (=> (not res!404162) (not e!358844))))

(declare-datatypes ((SeekEntryResult!6607 0))(
  ( (MissingZero!6607 (index!28712 (_ BitVec 32))) (Found!6607 (index!28713 (_ BitVec 32))) (Intermediate!6607 (undefined!7419 Bool) (index!28714 (_ BitVec 32)) (x!57456 (_ BitVec 32))) (Undefined!6607) (MissingVacant!6607 (index!28715 (_ BitVec 32))) )
))
(declare-fun lt!290023 () SeekEntryResult!6607)

(assert (=> b!626312 (= res!404162 (or (= lt!290023 (MissingZero!6607 i!1108)) (= lt!290023 (MissingVacant!6607 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37851 (_ BitVec 32)) SeekEntryResult!6607)

(assert (=> b!626312 (= lt!290023 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!626313 () Bool)

(declare-fun res!404159 () Bool)

(assert (=> b!626313 (=> (not res!404159) (not e!358844))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37851 (_ BitVec 32)) SeekEntryResult!6607)

(assert (=> b!626313 (= res!404159 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18167 a!2986) j!136) a!2986 mask!3053) (Found!6607 j!136)))))

(declare-fun res!404161 () Bool)

(assert (=> start!56514 (=> (not res!404161) (not e!358843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56514 (= res!404161 (validMask!0 mask!3053))))

(assert (=> start!56514 e!358843))

(assert (=> start!56514 true))

(declare-fun array_inv!13963 (array!37851) Bool)

(assert (=> start!56514 (array_inv!13963 a!2986)))

(declare-fun b!626314 () Bool)

(declare-fun res!404160 () Bool)

(assert (=> b!626314 (=> (not res!404160) (not e!358843))))

(assert (=> b!626314 (= res!404160 (validKeyInArray!0 k!1786))))

(declare-fun b!626315 () Bool)

(declare-fun res!404153 () Bool)

(assert (=> b!626315 (=> (not res!404153) (not e!358843))))

(declare-fun arrayContainsKey!0 (array!37851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626315 (= res!404153 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626316 () Bool)

(declare-fun res!404157 () Bool)

(assert (=> b!626316 (=> (not res!404157) (not e!358844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37851 (_ BitVec 32)) Bool)

(assert (=> b!626316 (= res!404157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626317 () Bool)

(declare-fun res!404155 () Bool)

(assert (=> b!626317 (=> (not res!404155) (not e!358844))))

(declare-datatypes ((List!12208 0))(
  ( (Nil!12205) (Cons!12204 (h!13249 (_ BitVec 64)) (t!18436 List!12208)) )
))
(declare-fun arrayNoDuplicates!0 (array!37851 (_ BitVec 32) List!12208) Bool)

(assert (=> b!626317 (= res!404155 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12205))))

(declare-fun b!626318 () Bool)

(assert (=> b!626318 (= e!358844 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18167 a!2986) index!984) (select (arr!18167 a!2986) j!136))) (= (select (arr!18167 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56514 res!404161) b!626311))

(assert (= (and b!626311 res!404156) b!626310))

(assert (= (and b!626310 res!404154) b!626314))

(assert (= (and b!626314 res!404160) b!626315))

(assert (= (and b!626315 res!404153) b!626312))

(assert (= (and b!626312 res!404162) b!626316))

(assert (= (and b!626316 res!404157) b!626317))

(assert (= (and b!626317 res!404155) b!626309))

(assert (= (and b!626309 res!404158) b!626313))

(assert (= (and b!626313 res!404159) b!626318))

(declare-fun m!601769 () Bool)

(assert (=> b!626309 m!601769))

(declare-fun m!601771 () Bool)

(assert (=> b!626309 m!601771))

(declare-fun m!601773 () Bool)

(assert (=> b!626309 m!601773))

(declare-fun m!601775 () Bool)

(assert (=> b!626312 m!601775))

(declare-fun m!601777 () Bool)

(assert (=> b!626314 m!601777))

(declare-fun m!601779 () Bool)

(assert (=> b!626310 m!601779))

(assert (=> b!626310 m!601779))

(declare-fun m!601781 () Bool)

(assert (=> b!626310 m!601781))

(declare-fun m!601783 () Bool)

(assert (=> b!626318 m!601783))

(assert (=> b!626318 m!601779))

(declare-fun m!601785 () Bool)

(assert (=> b!626317 m!601785))

(declare-fun m!601787 () Bool)

(assert (=> start!56514 m!601787))

(declare-fun m!601789 () Bool)

(assert (=> start!56514 m!601789))

(assert (=> b!626313 m!601779))

(assert (=> b!626313 m!601779))

(declare-fun m!601791 () Bool)

(assert (=> b!626313 m!601791))

(declare-fun m!601793 () Bool)

(assert (=> b!626315 m!601793))

(declare-fun m!601795 () Bool)

(assert (=> b!626316 m!601795))

(push 1)

(assert (not b!626317))

(assert (not b!626313))

(assert (not b!626310))

(assert (not b!626315))

(assert (not b!626316))

(assert (not start!56514))

(assert (not b!626312))

(assert (not b!626314))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!626373 () Bool)

(declare-fun e!358879 () Bool)

(declare-fun call!33242 () Bool)

(assert (=> b!626373 (= e!358879 call!33242)))

(declare-fun bm!33239 () Bool)

(assert (=> bm!33239 (= call!33242 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!626374 () Bool)

(declare-fun e!358880 () Bool)

(assert (=> b!626374 (= e!358880 call!33242)))

(declare-fun b!626375 () Bool)

(declare-fun e!358881 () Bool)

(assert (=> b!626375 (= e!358881 e!358880)))

(declare-fun c!71465 () Bool)

(assert (=> b!626375 (= c!71465 (validKeyInArray!0 (select (arr!18167 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88903 () Bool)

(declare-fun res!404176 () Bool)

(assert (=> d!88903 (=> res!404176 e!358881)))

(assert (=> d!88903 (= res!404176 (bvsge #b00000000000000000000000000000000 (size!18531 a!2986)))))

(assert (=> d!88903 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!358881)))

(declare-fun b!626372 () Bool)

(assert (=> b!626372 (= e!358880 e!358879)))

(declare-fun lt!290042 () (_ BitVec 64))

(assert (=> b!626372 (= lt!290042 (select (arr!18167 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21096 0))(
  ( (Unit!21097) )
))
(declare-fun lt!290041 () Unit!21096)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37851 (_ BitVec 64) (_ BitVec 32)) Unit!21096)

(assert (=> b!626372 (= lt!290041 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!290042 #b00000000000000000000000000000000))))

(assert (=> b!626372 (arrayContainsKey!0 a!2986 lt!290042 #b00000000000000000000000000000000)))

(declare-fun lt!290040 () Unit!21096)

(assert (=> b!626372 (= lt!290040 lt!290041)))

(declare-fun res!404177 () Bool)

(assert (=> b!626372 (= res!404177 (= (seekEntryOrOpen!0 (select (arr!18167 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6607 #b00000000000000000000000000000000)))))

(assert (=> b!626372 (=> (not res!404177) (not e!358879))))

(assert (= (and d!88903 (not res!404176)) b!626375))

(assert (= (and b!626375 c!71465) b!626372))

(assert (= (and b!626375 (not c!71465)) b!626374))

(assert (= (and b!626372 res!404177) b!626373))

(assert (= (or b!626373 b!626374) bm!33239))

(declare-fun m!601813 () Bool)

(assert (=> bm!33239 m!601813))

(declare-fun m!601815 () Bool)

(assert (=> b!626375 m!601815))

(assert (=> b!626375 m!601815))

(declare-fun m!601817 () Bool)

(assert (=> b!626375 m!601817))

(assert (=> b!626372 m!601815))

(declare-fun m!601819 () Bool)

(assert (=> b!626372 m!601819))

(declare-fun m!601821 () Bool)

(assert (=> b!626372 m!601821))

(assert (=> b!626372 m!601815))

(declare-fun m!601823 () Bool)

(assert (=> b!626372 m!601823))

(assert (=> b!626316 d!88903))

(declare-fun d!88907 () Bool)

(declare-fun res!404184 () Bool)

(declare-fun e!358891 () Bool)

(assert (=> d!88907 (=> res!404184 e!358891)))

(assert (=> d!88907 (= res!404184 (= (select (arr!18167 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!88907 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!358891)))

(declare-fun b!626390 () Bool)

(declare-fun e!358892 () Bool)

(assert (=> b!626390 (= e!358891 e!358892)))

(declare-fun res!404185 () Bool)

(assert (=> b!626390 (=> (not res!404185) (not e!358892))))

(assert (=> b!626390 (= res!404185 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18531 a!2986)))))

(declare-fun b!626391 () Bool)

(assert (=> b!626391 (= e!358892 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88907 (not res!404184)) b!626390))

(assert (= (and b!626390 res!404185) b!626391))

(assert (=> d!88907 m!601815))

(declare-fun m!601833 () Bool)

(assert (=> b!626391 m!601833))

(assert (=> b!626315 d!88907))

(declare-fun d!88913 () Bool)

(assert (=> d!88913 (= (validKeyInArray!0 (select (arr!18167 a!2986) j!136)) (and (not (= (select (arr!18167 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18167 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!626310 d!88913))

(declare-fun d!88915 () Bool)

(assert (=> d!88915 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56514 d!88915))

(declare-fun d!88919 () Bool)

(assert (=> d!88919 (= (array_inv!13963 a!2986) (bvsge (size!18531 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56514 d!88919))

(declare-fun d!88921 () Bool)

(assert (=> d!88921 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!626314 d!88921))

(declare-fun b!626434 () Bool)

(declare-fun e!358920 () SeekEntryResult!6607)

(assert (=> b!626434 (= e!358920 (Found!6607 index!984))))

(declare-fun b!626435 () Bool)

(declare-fun e!358921 () SeekEntryResult!6607)

(assert (=> b!626435 (= e!358921 e!358920)))

(declare-fun c!71489 () Bool)

(declare-fun lt!290067 () (_ BitVec 64))

(assert (=> b!626435 (= c!71489 (= lt!290067 (select (arr!18167 a!2986) j!136)))))

(declare-fun b!626436 () Bool)

(declare-fun c!71488 () Bool)

(assert (=> b!626436 (= c!71488 (= lt!290067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358919 () SeekEntryResult!6607)

(assert (=> b!626436 (= e!358920 e!358919)))

(declare-fun b!626437 () Bool)

(assert (=> b!626437 (= e!358919 (MissingVacant!6607 vacantSpotIndex!68))))

(declare-fun b!626438 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!626438 (= e!358919 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18167 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626439 () Bool)

(assert (=> b!626439 (= e!358921 Undefined!6607)))

(declare-fun d!88923 () Bool)

(declare-fun lt!290068 () SeekEntryResult!6607)

(assert (=> d!88923 (and (or (is-Undefined!6607 lt!290068) (not (is-Found!6607 lt!290068)) (and (bvsge (index!28713 lt!290068) #b00000000000000000000000000000000) (bvslt (index!28713 lt!290068) (size!18531 a!2986)))) (or (is-Undefined!6607 lt!290068) (is-Found!6607 lt!290068) (not (is-MissingVacant!6607 lt!290068)) (not (= (index!28715 lt!290068) vacantSpotIndex!68)) (and (bvsge (index!28715 lt!290068) #b00000000000000000000000000000000) (bvslt (index!28715 lt!290068) (size!18531 a!2986)))) (or (is-Undefined!6607 lt!290068) (ite (is-Found!6607 lt!290068) (= (select (arr!18167 a!2986) (index!28713 lt!290068)) (select (arr!18167 a!2986) j!136)) (and (is-MissingVacant!6607 lt!290068) (= (index!28715 lt!290068) vacantSpotIndex!68) (= (select (arr!18167 a!2986) (index!28715 lt!290068)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88923 (= lt!290068 e!358921)))

(declare-fun c!71487 () Bool)

(assert (=> d!88923 (= c!71487 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88923 (= lt!290067 (select (arr!18167 a!2986) index!984))))

(assert (=> d!88923 (validMask!0 mask!3053)))

(assert (=> d!88923 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18167 a!2986) j!136) a!2986 mask!3053) lt!290068)))

(assert (= (and d!88923 c!71487) b!626439))

(assert (= (and d!88923 (not c!71487)) b!626435))

