; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53746 () Bool)

(assert start!53746)

(declare-fun b!586273 () Bool)

(declare-fun res!374097 () Bool)

(declare-fun e!335220 () Bool)

(assert (=> b!586273 (=> (not res!374097) (not e!335220))))

(declare-datatypes ((array!36647 0))(
  ( (array!36648 (arr!17598 (Array (_ BitVec 32) (_ BitVec 64))) (size!17962 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36647)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586273 (= res!374097 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586274 () Bool)

(declare-fun e!335219 () Bool)

(assert (=> b!586274 (= e!335220 e!335219)))

(declare-fun res!374095 () Bool)

(assert (=> b!586274 (=> (not res!374095) (not e!335219))))

(declare-datatypes ((SeekEntryResult!6038 0))(
  ( (MissingZero!6038 (index!26379 (_ BitVec 32))) (Found!6038 (index!26380 (_ BitVec 32))) (Intermediate!6038 (undefined!6850 Bool) (index!26381 (_ BitVec 32)) (x!55195 (_ BitVec 32))) (Undefined!6038) (MissingVacant!6038 (index!26382 (_ BitVec 32))) )
))
(declare-fun lt!266049 () SeekEntryResult!6038)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586274 (= res!374095 (or (= lt!266049 (MissingZero!6038 i!1108)) (= lt!266049 (MissingVacant!6038 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36647 (_ BitVec 32)) SeekEntryResult!6038)

(assert (=> b!586274 (= lt!266049 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586275 () Bool)

(declare-fun res!374091 () Bool)

(assert (=> b!586275 (=> (not res!374091) (not e!335219))))

(declare-datatypes ((List!11639 0))(
  ( (Nil!11636) (Cons!11635 (h!12680 (_ BitVec 64)) (t!17867 List!11639)) )
))
(declare-fun arrayNoDuplicates!0 (array!36647 (_ BitVec 32) List!11639) Bool)

(assert (=> b!586275 (= res!374091 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11636))))

(declare-fun b!586276 () Bool)

(assert (=> b!586276 (= e!335219 (not true))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!266048 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36647 (_ BitVec 32)) SeekEntryResult!6038)

(assert (=> b!586276 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266048 vacantSpotIndex!68 (select (arr!17598 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266048 vacantSpotIndex!68 (select (store (arr!17598 a!2986) i!1108 k!1786) j!136) (array!36648 (store (arr!17598 a!2986) i!1108 k!1786) (size!17962 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18196 0))(
  ( (Unit!18197) )
))
(declare-fun lt!266050 () Unit!18196)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36647 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18196)

(assert (=> b!586276 (= lt!266050 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266048 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586276 (= lt!266048 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586277 () Bool)

(declare-fun res!374093 () Bool)

(assert (=> b!586277 (=> (not res!374093) (not e!335220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586277 (= res!374093 (validKeyInArray!0 (select (arr!17598 a!2986) j!136)))))

(declare-fun res!374089 () Bool)

(assert (=> start!53746 (=> (not res!374089) (not e!335220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53746 (= res!374089 (validMask!0 mask!3053))))

(assert (=> start!53746 e!335220))

(assert (=> start!53746 true))

(declare-fun array_inv!13394 (array!36647) Bool)

(assert (=> start!53746 (array_inv!13394 a!2986)))

(declare-fun b!586278 () Bool)

(declare-fun res!374098 () Bool)

(assert (=> b!586278 (=> (not res!374098) (not e!335219))))

(assert (=> b!586278 (= res!374098 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17598 a!2986) index!984) (select (arr!17598 a!2986) j!136))) (not (= (select (arr!17598 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586279 () Bool)

(declare-fun res!374090 () Bool)

(assert (=> b!586279 (=> (not res!374090) (not e!335219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36647 (_ BitVec 32)) Bool)

(assert (=> b!586279 (= res!374090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586280 () Bool)

(declare-fun res!374096 () Bool)

(assert (=> b!586280 (=> (not res!374096) (not e!335220))))

(assert (=> b!586280 (= res!374096 (and (= (size!17962 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17962 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17962 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586281 () Bool)

(declare-fun res!374099 () Bool)

(assert (=> b!586281 (=> (not res!374099) (not e!335220))))

(assert (=> b!586281 (= res!374099 (validKeyInArray!0 k!1786))))

(declare-fun b!586282 () Bool)

(declare-fun res!374092 () Bool)

(assert (=> b!586282 (=> (not res!374092) (not e!335219))))

(assert (=> b!586282 (= res!374092 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17598 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17598 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586283 () Bool)

(declare-fun res!374094 () Bool)

(assert (=> b!586283 (=> (not res!374094) (not e!335219))))

(assert (=> b!586283 (= res!374094 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17598 a!2986) j!136) a!2986 mask!3053) (Found!6038 j!136)))))

(assert (= (and start!53746 res!374089) b!586280))

(assert (= (and b!586280 res!374096) b!586277))

(assert (= (and b!586277 res!374093) b!586281))

(assert (= (and b!586281 res!374099) b!586273))

(assert (= (and b!586273 res!374097) b!586274))

(assert (= (and b!586274 res!374095) b!586279))

(assert (= (and b!586279 res!374090) b!586275))

(assert (= (and b!586275 res!374091) b!586282))

(assert (= (and b!586282 res!374092) b!586283))

(assert (= (and b!586283 res!374094) b!586278))

(assert (= (and b!586278 res!374098) b!586276))

(declare-fun m!564607 () Bool)

(assert (=> b!586275 m!564607))

(declare-fun m!564609 () Bool)

(assert (=> b!586279 m!564609))

(declare-fun m!564611 () Bool)

(assert (=> b!586281 m!564611))

(declare-fun m!564613 () Bool)

(assert (=> b!586273 m!564613))

(declare-fun m!564615 () Bool)

(assert (=> b!586278 m!564615))

(declare-fun m!564617 () Bool)

(assert (=> b!586278 m!564617))

(declare-fun m!564619 () Bool)

(assert (=> b!586274 m!564619))

(assert (=> b!586283 m!564617))

(assert (=> b!586283 m!564617))

(declare-fun m!564621 () Bool)

(assert (=> b!586283 m!564621))

(assert (=> b!586277 m!564617))

(assert (=> b!586277 m!564617))

(declare-fun m!564623 () Bool)

(assert (=> b!586277 m!564623))

(declare-fun m!564625 () Bool)

(assert (=> b!586282 m!564625))

(declare-fun m!564627 () Bool)

(assert (=> b!586282 m!564627))

(declare-fun m!564629 () Bool)

(assert (=> b!586282 m!564629))

(declare-fun m!564631 () Bool)

(assert (=> b!586276 m!564631))

(declare-fun m!564633 () Bool)

(assert (=> b!586276 m!564633))

(assert (=> b!586276 m!564631))

(assert (=> b!586276 m!564617))

(assert (=> b!586276 m!564627))

(assert (=> b!586276 m!564617))

(declare-fun m!564635 () Bool)

(assert (=> b!586276 m!564635))

(declare-fun m!564637 () Bool)

(assert (=> b!586276 m!564637))

(declare-fun m!564639 () Bool)

(assert (=> b!586276 m!564639))

(declare-fun m!564641 () Bool)

(assert (=> start!53746 m!564641))

(declare-fun m!564643 () Bool)

(assert (=> start!53746 m!564643))

(push 1)

