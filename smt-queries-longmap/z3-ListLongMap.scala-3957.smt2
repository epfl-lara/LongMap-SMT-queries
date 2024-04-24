; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53802 () Bool)

(assert start!53802)

(declare-fun b!586581 () Bool)

(declare-fun res!374296 () Bool)

(declare-fun e!335375 () Bool)

(assert (=> b!586581 (=> (not res!374296) (not e!335375))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36648 0))(
  ( (array!36649 (arr!17596 (Array (_ BitVec 32) (_ BitVec 64))) (size!17960 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36648)

(declare-datatypes ((SeekEntryResult!5992 0))(
  ( (MissingZero!5992 (index!26195 (_ BitVec 32))) (Found!5992 (index!26196 (_ BitVec 32))) (Intermediate!5992 (undefined!6804 Bool) (index!26197 (_ BitVec 32)) (x!55160 (_ BitVec 32))) (Undefined!5992) (MissingVacant!5992 (index!26198 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36648 (_ BitVec 32)) SeekEntryResult!5992)

(assert (=> b!586581 (= res!374296 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17596 a!2986) j!136) a!2986 mask!3053) (Found!5992 j!136)))))

(declare-fun b!586582 () Bool)

(assert (=> b!586582 (= e!335375 (not true))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!266178 () (_ BitVec 32))

(assert (=> b!586582 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266178 vacantSpotIndex!68 (select (arr!17596 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266178 vacantSpotIndex!68 (select (store (arr!17596 a!2986) i!1108 k0!1786) j!136) (array!36649 (store (arr!17596 a!2986) i!1108 k0!1786) (size!17960 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18181 0))(
  ( (Unit!18182) )
))
(declare-fun lt!266177 () Unit!18181)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36648 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18181)

(assert (=> b!586582 (= lt!266177 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266178 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586582 (= lt!266178 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!586583 () Bool)

(declare-fun res!374292 () Bool)

(declare-fun e!335376 () Bool)

(assert (=> b!586583 (=> (not res!374292) (not e!335376))))

(declare-fun arrayContainsKey!0 (array!36648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586583 (= res!374292 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586584 () Bool)

(declare-fun res!374299 () Bool)

(assert (=> b!586584 (=> (not res!374299) (not e!335375))))

(assert (=> b!586584 (= res!374299 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17596 a!2986) index!984) (select (arr!17596 a!2986) j!136))) (not (= (select (arr!17596 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!374294 () Bool)

(assert (=> start!53802 (=> (not res!374294) (not e!335376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53802 (= res!374294 (validMask!0 mask!3053))))

(assert (=> start!53802 e!335376))

(assert (=> start!53802 true))

(declare-fun array_inv!13455 (array!36648) Bool)

(assert (=> start!53802 (array_inv!13455 a!2986)))

(declare-fun b!586585 () Bool)

(declare-fun res!374295 () Bool)

(assert (=> b!586585 (=> (not res!374295) (not e!335376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586585 (= res!374295 (validKeyInArray!0 (select (arr!17596 a!2986) j!136)))))

(declare-fun b!586586 () Bool)

(declare-fun res!374297 () Bool)

(assert (=> b!586586 (=> (not res!374297) (not e!335376))))

(assert (=> b!586586 (= res!374297 (validKeyInArray!0 k0!1786))))

(declare-fun b!586587 () Bool)

(declare-fun res!374302 () Bool)

(assert (=> b!586587 (=> (not res!374302) (not e!335376))))

(assert (=> b!586587 (= res!374302 (and (= (size!17960 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17960 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17960 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586588 () Bool)

(assert (=> b!586588 (= e!335376 e!335375)))

(declare-fun res!374301 () Bool)

(assert (=> b!586588 (=> (not res!374301) (not e!335375))))

(declare-fun lt!266179 () SeekEntryResult!5992)

(assert (=> b!586588 (= res!374301 (or (= lt!266179 (MissingZero!5992 i!1108)) (= lt!266179 (MissingVacant!5992 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36648 (_ BitVec 32)) SeekEntryResult!5992)

(assert (=> b!586588 (= lt!266179 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586589 () Bool)

(declare-fun res!374293 () Bool)

(assert (=> b!586589 (=> (not res!374293) (not e!335375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36648 (_ BitVec 32)) Bool)

(assert (=> b!586589 (= res!374293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586590 () Bool)

(declare-fun res!374300 () Bool)

(assert (=> b!586590 (=> (not res!374300) (not e!335375))))

(declare-datatypes ((List!11544 0))(
  ( (Nil!11541) (Cons!11540 (h!12588 (_ BitVec 64)) (t!17764 List!11544)) )
))
(declare-fun arrayNoDuplicates!0 (array!36648 (_ BitVec 32) List!11544) Bool)

(assert (=> b!586590 (= res!374300 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11541))))

(declare-fun b!586591 () Bool)

(declare-fun res!374298 () Bool)

(assert (=> b!586591 (=> (not res!374298) (not e!335375))))

(assert (=> b!586591 (= res!374298 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17596 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17596 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53802 res!374294) b!586587))

(assert (= (and b!586587 res!374302) b!586585))

(assert (= (and b!586585 res!374295) b!586586))

(assert (= (and b!586586 res!374297) b!586583))

(assert (= (and b!586583 res!374292) b!586588))

(assert (= (and b!586588 res!374301) b!586589))

(assert (= (and b!586589 res!374293) b!586590))

(assert (= (and b!586590 res!374300) b!586591))

(assert (= (and b!586591 res!374298) b!586581))

(assert (= (and b!586581 res!374296) b!586584))

(assert (= (and b!586584 res!374299) b!586582))

(declare-fun m!565079 () Bool)

(assert (=> b!586585 m!565079))

(assert (=> b!586585 m!565079))

(declare-fun m!565081 () Bool)

(assert (=> b!586585 m!565081))

(declare-fun m!565083 () Bool)

(assert (=> b!586590 m!565083))

(declare-fun m!565085 () Bool)

(assert (=> b!586584 m!565085))

(assert (=> b!586584 m!565079))

(declare-fun m!565087 () Bool)

(assert (=> b!586591 m!565087))

(declare-fun m!565089 () Bool)

(assert (=> b!586591 m!565089))

(declare-fun m!565091 () Bool)

(assert (=> b!586591 m!565091))

(declare-fun m!565093 () Bool)

(assert (=> b!586586 m!565093))

(assert (=> b!586581 m!565079))

(assert (=> b!586581 m!565079))

(declare-fun m!565095 () Bool)

(assert (=> b!586581 m!565095))

(declare-fun m!565097 () Bool)

(assert (=> b!586589 m!565097))

(declare-fun m!565099 () Bool)

(assert (=> b!586583 m!565099))

(declare-fun m!565101 () Bool)

(assert (=> b!586582 m!565101))

(declare-fun m!565103 () Bool)

(assert (=> b!586582 m!565103))

(assert (=> b!586582 m!565079))

(declare-fun m!565105 () Bool)

(assert (=> b!586582 m!565105))

(assert (=> b!586582 m!565079))

(assert (=> b!586582 m!565089))

(declare-fun m!565107 () Bool)

(assert (=> b!586582 m!565107))

(assert (=> b!586582 m!565103))

(declare-fun m!565109 () Bool)

(assert (=> b!586582 m!565109))

(declare-fun m!565111 () Bool)

(assert (=> b!586588 m!565111))

(declare-fun m!565113 () Bool)

(assert (=> start!53802 m!565113))

(declare-fun m!565115 () Bool)

(assert (=> start!53802 m!565115))

(check-sat (not b!586588) (not b!586585) (not b!586583) (not b!586581) (not b!586586) (not b!586590) (not b!586589) (not b!586582) (not start!53802))
(check-sat)
