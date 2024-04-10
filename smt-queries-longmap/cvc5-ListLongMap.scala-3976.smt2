; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53926 () Bool)

(assert start!53926)

(declare-fun b!588507 () Bool)

(declare-fun res!376145 () Bool)

(declare-fun e!336057 () Bool)

(assert (=> b!588507 (=> (not res!376145) (not e!336057))))

(declare-datatypes ((array!36770 0))(
  ( (array!36771 (arr!17658 (Array (_ BitVec 32) (_ BitVec 64))) (size!18022 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36770)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588507 (= res!376145 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588508 () Bool)

(declare-fun e!336053 () Bool)

(assert (=> b!588508 (= e!336057 e!336053)))

(declare-fun res!376148 () Bool)

(assert (=> b!588508 (=> (not res!376148) (not e!336053))))

(declare-datatypes ((SeekEntryResult!6098 0))(
  ( (MissingZero!6098 (index!26622 (_ BitVec 32))) (Found!6098 (index!26623 (_ BitVec 32))) (Intermediate!6098 (undefined!6910 Bool) (index!26624 (_ BitVec 32)) (x!55424 (_ BitVec 32))) (Undefined!6098) (MissingVacant!6098 (index!26625 (_ BitVec 32))) )
))
(declare-fun lt!266824 () SeekEntryResult!6098)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588508 (= res!376148 (or (= lt!266824 (MissingZero!6098 i!1108)) (= lt!266824 (MissingVacant!6098 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36770 (_ BitVec 32)) SeekEntryResult!6098)

(assert (=> b!588508 (= lt!266824 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!336054 () Bool)

(declare-fun b!588509 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588509 (= e!336054 (validKeyInArray!0 (select (store (arr!17658 a!2986) i!1108 k!1786) j!136)))))

(declare-fun b!588510 () Bool)

(declare-fun res!376153 () Bool)

(assert (=> b!588510 (=> (not res!376153) (not e!336057))))

(assert (=> b!588510 (= res!376153 (validKeyInArray!0 (select (arr!17658 a!2986) j!136)))))

(declare-fun res!376147 () Bool)

(assert (=> start!53926 (=> (not res!376147) (not e!336057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53926 (= res!376147 (validMask!0 mask!3053))))

(assert (=> start!53926 e!336057))

(assert (=> start!53926 true))

(declare-fun array_inv!13454 (array!36770) Bool)

(assert (=> start!53926 (array_inv!13454 a!2986)))

(declare-fun b!588511 () Bool)

(declare-fun res!376146 () Bool)

(assert (=> b!588511 (=> (not res!376146) (not e!336057))))

(assert (=> b!588511 (= res!376146 (and (= (size!18022 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18022 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18022 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588512 () Bool)

(declare-fun e!336052 () Bool)

(assert (=> b!588512 (= e!336053 e!336052)))

(declare-fun res!376149 () Bool)

(assert (=> b!588512 (=> (not res!376149) (not e!336052))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!266823 () SeekEntryResult!6098)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588512 (= res!376149 (and (= lt!266823 (Found!6098 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17658 a!2986) index!984) (select (arr!17658 a!2986) j!136))) (not (= (select (arr!17658 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36770 (_ BitVec 32)) SeekEntryResult!6098)

(assert (=> b!588512 (= lt!266823 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17658 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588513 () Bool)

(declare-fun res!376152 () Bool)

(assert (=> b!588513 (=> (not res!376152) (not e!336057))))

(assert (=> b!588513 (= res!376152 (validKeyInArray!0 k!1786))))

(declare-fun b!588514 () Bool)

(declare-fun res!376150 () Bool)

(assert (=> b!588514 (=> (not res!376150) (not e!336053))))

(declare-datatypes ((List!11699 0))(
  ( (Nil!11696) (Cons!11695 (h!12740 (_ BitVec 64)) (t!17927 List!11699)) )
))
(declare-fun arrayNoDuplicates!0 (array!36770 (_ BitVec 32) List!11699) Bool)

(assert (=> b!588514 (= res!376150 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11696))))

(declare-fun b!588515 () Bool)

(declare-fun res!376154 () Bool)

(assert (=> b!588515 (=> (not res!376154) (not e!336053))))

(assert (=> b!588515 (= res!376154 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17658 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17658 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588516 () Bool)

(assert (=> b!588516 (= e!336052 (not e!336054))))

(declare-fun res!376151 () Bool)

(assert (=> b!588516 (=> res!376151 e!336054)))

(assert (=> b!588516 (= res!376151 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun e!336055 () Bool)

(assert (=> b!588516 e!336055))

(declare-fun res!376143 () Bool)

(assert (=> b!588516 (=> (not res!376143) (not e!336055))))

(declare-fun lt!266822 () (_ BitVec 32))

(declare-fun lt!266821 () SeekEntryResult!6098)

(assert (=> b!588516 (= res!376143 (= lt!266821 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266822 vacantSpotIndex!68 (select (store (arr!17658 a!2986) i!1108 k!1786) j!136) (array!36771 (store (arr!17658 a!2986) i!1108 k!1786) (size!18022 a!2986)) mask!3053)))))

(assert (=> b!588516 (= lt!266821 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266822 vacantSpotIndex!68 (select (arr!17658 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18316 0))(
  ( (Unit!18317) )
))
(declare-fun lt!266820 () Unit!18316)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36770 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18316)

(assert (=> b!588516 (= lt!266820 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266822 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588516 (= lt!266822 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588517 () Bool)

(assert (=> b!588517 (= e!336055 (= lt!266823 lt!266821))))

(declare-fun b!588518 () Bool)

(declare-fun res!376144 () Bool)

(assert (=> b!588518 (=> (not res!376144) (not e!336053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36770 (_ BitVec 32)) Bool)

(assert (=> b!588518 (= res!376144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53926 res!376147) b!588511))

(assert (= (and b!588511 res!376146) b!588510))

(assert (= (and b!588510 res!376153) b!588513))

(assert (= (and b!588513 res!376152) b!588507))

(assert (= (and b!588507 res!376145) b!588508))

(assert (= (and b!588508 res!376148) b!588518))

(assert (= (and b!588518 res!376144) b!588514))

(assert (= (and b!588514 res!376150) b!588515))

(assert (= (and b!588515 res!376154) b!588512))

(assert (= (and b!588512 res!376149) b!588516))

(assert (= (and b!588516 res!376143) b!588517))

(assert (= (and b!588516 (not res!376151)) b!588509))

(declare-fun m!567067 () Bool)

(assert (=> b!588513 m!567067))

(declare-fun m!567069 () Bool)

(assert (=> start!53926 m!567069))

(declare-fun m!567071 () Bool)

(assert (=> start!53926 m!567071))

(declare-fun m!567073 () Bool)

(assert (=> b!588509 m!567073))

(declare-fun m!567075 () Bool)

(assert (=> b!588509 m!567075))

(assert (=> b!588509 m!567075))

(declare-fun m!567077 () Bool)

(assert (=> b!588509 m!567077))

(declare-fun m!567079 () Bool)

(assert (=> b!588508 m!567079))

(declare-fun m!567081 () Bool)

(assert (=> b!588512 m!567081))

(declare-fun m!567083 () Bool)

(assert (=> b!588512 m!567083))

(assert (=> b!588512 m!567083))

(declare-fun m!567085 () Bool)

(assert (=> b!588512 m!567085))

(declare-fun m!567087 () Bool)

(assert (=> b!588515 m!567087))

(assert (=> b!588515 m!567073))

(declare-fun m!567089 () Bool)

(assert (=> b!588515 m!567089))

(assert (=> b!588516 m!567083))

(declare-fun m!567091 () Bool)

(assert (=> b!588516 m!567091))

(declare-fun m!567093 () Bool)

(assert (=> b!588516 m!567093))

(assert (=> b!588516 m!567083))

(assert (=> b!588516 m!567073))

(assert (=> b!588516 m!567075))

(declare-fun m!567095 () Bool)

(assert (=> b!588516 m!567095))

(declare-fun m!567097 () Bool)

(assert (=> b!588516 m!567097))

(assert (=> b!588516 m!567075))

(declare-fun m!567099 () Bool)

(assert (=> b!588507 m!567099))

(declare-fun m!567101 () Bool)

(assert (=> b!588518 m!567101))

(assert (=> b!588510 m!567083))

(assert (=> b!588510 m!567083))

(declare-fun m!567103 () Bool)

(assert (=> b!588510 m!567103))

(declare-fun m!567105 () Bool)

(assert (=> b!588514 m!567105))

(push 1)

