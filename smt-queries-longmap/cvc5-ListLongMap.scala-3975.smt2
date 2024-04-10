; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53920 () Bool)

(assert start!53920)

(declare-fun b!588406 () Bool)

(declare-fun res!376043 () Bool)

(declare-fun e!336005 () Bool)

(assert (=> b!588406 (=> (not res!376043) (not e!336005))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36764 0))(
  ( (array!36765 (arr!17655 (Array (_ BitVec 32) (_ BitVec 64))) (size!18019 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36764)

(assert (=> b!588406 (= res!376043 (and (= (size!18019 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18019 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18019 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588407 () Bool)

(declare-fun res!376049 () Bool)

(assert (=> b!588407 (=> (not res!376049) (not e!336005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588407 (= res!376049 (validKeyInArray!0 (select (arr!17655 a!2986) j!136)))))

(declare-fun b!588408 () Bool)

(declare-fun e!336007 () Bool)

(assert (=> b!588408 (= e!336007 (not true))))

(declare-fun e!336009 () Bool)

(assert (=> b!588408 e!336009))

(declare-fun res!376044 () Bool)

(assert (=> b!588408 (=> (not res!376044) (not e!336009))))

(declare-fun lt!266776 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6095 0))(
  ( (MissingZero!6095 (index!26610 (_ BitVec 32))) (Found!6095 (index!26611 (_ BitVec 32))) (Intermediate!6095 (undefined!6907 Bool) (index!26612 (_ BitVec 32)) (x!55413 (_ BitVec 32))) (Undefined!6095) (MissingVacant!6095 (index!26613 (_ BitVec 32))) )
))
(declare-fun lt!266778 () SeekEntryResult!6095)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36764 (_ BitVec 32)) SeekEntryResult!6095)

(assert (=> b!588408 (= res!376044 (= lt!266778 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266776 vacantSpotIndex!68 (select (store (arr!17655 a!2986) i!1108 k!1786) j!136) (array!36765 (store (arr!17655 a!2986) i!1108 k!1786) (size!18019 a!2986)) mask!3053)))))

(assert (=> b!588408 (= lt!266778 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266776 vacantSpotIndex!68 (select (arr!17655 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18310 0))(
  ( (Unit!18311) )
))
(declare-fun lt!266779 () Unit!18310)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36764 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18310)

(assert (=> b!588408 (= lt!266779 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266776 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588408 (= lt!266776 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588409 () Bool)

(declare-fun lt!266777 () SeekEntryResult!6095)

(assert (=> b!588409 (= e!336009 (= lt!266777 lt!266778))))

(declare-fun b!588410 () Bool)

(declare-fun res!376045 () Bool)

(assert (=> b!588410 (=> (not res!376045) (not e!336005))))

(declare-fun arrayContainsKey!0 (array!36764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588410 (= res!376045 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588411 () Bool)

(declare-fun res!376048 () Bool)

(declare-fun e!336008 () Bool)

(assert (=> b!588411 (=> (not res!376048) (not e!336008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36764 (_ BitVec 32)) Bool)

(assert (=> b!588411 (= res!376048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588412 () Bool)

(assert (=> b!588412 (= e!336005 e!336008)))

(declare-fun res!376050 () Bool)

(assert (=> b!588412 (=> (not res!376050) (not e!336008))))

(declare-fun lt!266775 () SeekEntryResult!6095)

(assert (=> b!588412 (= res!376050 (or (= lt!266775 (MissingZero!6095 i!1108)) (= lt!266775 (MissingVacant!6095 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36764 (_ BitVec 32)) SeekEntryResult!6095)

(assert (=> b!588412 (= lt!266775 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!588413 () Bool)

(declare-fun res!376052 () Bool)

(assert (=> b!588413 (=> (not res!376052) (not e!336008))))

(declare-datatypes ((List!11696 0))(
  ( (Nil!11693) (Cons!11692 (h!12737 (_ BitVec 64)) (t!17924 List!11696)) )
))
(declare-fun arrayNoDuplicates!0 (array!36764 (_ BitVec 32) List!11696) Bool)

(assert (=> b!588413 (= res!376052 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11693))))

(declare-fun b!588415 () Bool)

(assert (=> b!588415 (= e!336008 e!336007)))

(declare-fun res!376042 () Bool)

(assert (=> b!588415 (=> (not res!376042) (not e!336007))))

(assert (=> b!588415 (= res!376042 (and (= lt!266777 (Found!6095 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17655 a!2986) index!984) (select (arr!17655 a!2986) j!136))) (not (= (select (arr!17655 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588415 (= lt!266777 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17655 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588416 () Bool)

(declare-fun res!376046 () Bool)

(assert (=> b!588416 (=> (not res!376046) (not e!336008))))

(assert (=> b!588416 (= res!376046 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17655 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17655 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!376047 () Bool)

(assert (=> start!53920 (=> (not res!376047) (not e!336005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53920 (= res!376047 (validMask!0 mask!3053))))

(assert (=> start!53920 e!336005))

(assert (=> start!53920 true))

(declare-fun array_inv!13451 (array!36764) Bool)

(assert (=> start!53920 (array_inv!13451 a!2986)))

(declare-fun b!588414 () Bool)

(declare-fun res!376051 () Bool)

(assert (=> b!588414 (=> (not res!376051) (not e!336005))))

(assert (=> b!588414 (= res!376051 (validKeyInArray!0 k!1786))))

(assert (= (and start!53920 res!376047) b!588406))

(assert (= (and b!588406 res!376043) b!588407))

(assert (= (and b!588407 res!376049) b!588414))

(assert (= (and b!588414 res!376051) b!588410))

(assert (= (and b!588410 res!376045) b!588412))

(assert (= (and b!588412 res!376050) b!588411))

(assert (= (and b!588411 res!376048) b!588413))

(assert (= (and b!588413 res!376052) b!588416))

(assert (= (and b!588416 res!376046) b!588415))

(assert (= (and b!588415 res!376042) b!588408))

(assert (= (and b!588408 res!376044) b!588409))

(declare-fun m!566953 () Bool)

(assert (=> b!588415 m!566953))

(declare-fun m!566955 () Bool)

(assert (=> b!588415 m!566955))

(assert (=> b!588415 m!566955))

(declare-fun m!566957 () Bool)

(assert (=> b!588415 m!566957))

(declare-fun m!566959 () Bool)

(assert (=> b!588411 m!566959))

(assert (=> b!588407 m!566955))

(assert (=> b!588407 m!566955))

(declare-fun m!566961 () Bool)

(assert (=> b!588407 m!566961))

(declare-fun m!566963 () Bool)

(assert (=> b!588414 m!566963))

(declare-fun m!566965 () Bool)

(assert (=> b!588408 m!566965))

(declare-fun m!566967 () Bool)

(assert (=> b!588408 m!566967))

(declare-fun m!566969 () Bool)

(assert (=> b!588408 m!566969))

(assert (=> b!588408 m!566955))

(declare-fun m!566971 () Bool)

(assert (=> b!588408 m!566971))

(assert (=> b!588408 m!566955))

(declare-fun m!566973 () Bool)

(assert (=> b!588408 m!566973))

(assert (=> b!588408 m!566967))

(declare-fun m!566975 () Bool)

(assert (=> b!588408 m!566975))

(declare-fun m!566977 () Bool)

(assert (=> b!588416 m!566977))

(assert (=> b!588416 m!566971))

(declare-fun m!566979 () Bool)

(assert (=> b!588416 m!566979))

(declare-fun m!566981 () Bool)

(assert (=> b!588410 m!566981))

(declare-fun m!566983 () Bool)

(assert (=> b!588412 m!566983))

(declare-fun m!566985 () Bool)

(assert (=> b!588413 m!566985))

(declare-fun m!566987 () Bool)

(assert (=> start!53920 m!566987))

(declare-fun m!566989 () Bool)

(assert (=> start!53920 m!566989))

(push 1)

