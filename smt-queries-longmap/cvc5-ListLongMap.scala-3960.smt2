; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53770 () Bool)

(assert start!53770)

(declare-fun b!586670 () Bool)

(declare-fun res!374493 () Bool)

(declare-fun e!335326 () Bool)

(assert (=> b!586670 (=> (not res!374493) (not e!335326))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36671 0))(
  ( (array!36672 (arr!17610 (Array (_ BitVec 32) (_ BitVec 64))) (size!17974 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36671)

(declare-datatypes ((SeekEntryResult!6050 0))(
  ( (MissingZero!6050 (index!26427 (_ BitVec 32))) (Found!6050 (index!26428 (_ BitVec 32))) (Intermediate!6050 (undefined!6862 Bool) (index!26429 (_ BitVec 32)) (x!55239 (_ BitVec 32))) (Undefined!6050) (MissingVacant!6050 (index!26430 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36671 (_ BitVec 32)) SeekEntryResult!6050)

(assert (=> b!586670 (= res!374493 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17610 a!2986) j!136) a!2986 mask!3053) (Found!6050 j!136)))))

(declare-fun b!586671 () Bool)

(declare-fun res!374492 () Bool)

(declare-fun e!335327 () Bool)

(assert (=> b!586671 (=> (not res!374492) (not e!335327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586671 (= res!374492 (validKeyInArray!0 (select (arr!17610 a!2986) j!136)))))

(declare-fun b!586672 () Bool)

(declare-fun res!374491 () Bool)

(assert (=> b!586672 (=> (not res!374491) (not e!335327))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586672 (= res!374491 (and (= (size!17974 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17974 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17974 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586673 () Bool)

(declare-fun res!374489 () Bool)

(assert (=> b!586673 (=> (not res!374489) (not e!335326))))

(declare-datatypes ((List!11651 0))(
  ( (Nil!11648) (Cons!11647 (h!12692 (_ BitVec 64)) (t!17879 List!11651)) )
))
(declare-fun arrayNoDuplicates!0 (array!36671 (_ BitVec 32) List!11651) Bool)

(assert (=> b!586673 (= res!374489 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11648))))

(declare-fun b!586674 () Bool)

(declare-fun res!374485 () Bool)

(assert (=> b!586674 (=> (not res!374485) (not e!335326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36671 (_ BitVec 32)) Bool)

(assert (=> b!586674 (= res!374485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586675 () Bool)

(declare-fun res!374490 () Bool)

(assert (=> b!586675 (=> (not res!374490) (not e!335326))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!586675 (= res!374490 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17610 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17610 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586676 () Bool)

(declare-fun res!374486 () Bool)

(assert (=> b!586676 (=> (not res!374486) (not e!335326))))

(assert (=> b!586676 (= res!374486 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17610 a!2986) index!984) (select (arr!17610 a!2986) j!136))) (not (= (select (arr!17610 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586677 () Bool)

(declare-fun res!374495 () Bool)

(assert (=> b!586677 (=> (not res!374495) (not e!335327))))

(assert (=> b!586677 (= res!374495 (validKeyInArray!0 k!1786))))

(declare-fun res!374494 () Bool)

(assert (=> start!53770 (=> (not res!374494) (not e!335327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53770 (= res!374494 (validMask!0 mask!3053))))

(assert (=> start!53770 e!335327))

(assert (=> start!53770 true))

(declare-fun array_inv!13406 (array!36671) Bool)

(assert (=> start!53770 (array_inv!13406 a!2986)))

(declare-fun b!586669 () Bool)

(assert (=> b!586669 (= e!335326 (not true))))

(declare-fun lt!266156 () (_ BitVec 32))

(assert (=> b!586669 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266156 vacantSpotIndex!68 (select (arr!17610 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266156 vacantSpotIndex!68 (select (store (arr!17610 a!2986) i!1108 k!1786) j!136) (array!36672 (store (arr!17610 a!2986) i!1108 k!1786) (size!17974 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18220 0))(
  ( (Unit!18221) )
))
(declare-fun lt!266158 () Unit!18220)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36671 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18220)

(assert (=> b!586669 (= lt!266158 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266156 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586669 (= lt!266156 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586678 () Bool)

(assert (=> b!586678 (= e!335327 e!335326)))

(declare-fun res!374488 () Bool)

(assert (=> b!586678 (=> (not res!374488) (not e!335326))))

(declare-fun lt!266157 () SeekEntryResult!6050)

(assert (=> b!586678 (= res!374488 (or (= lt!266157 (MissingZero!6050 i!1108)) (= lt!266157 (MissingVacant!6050 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36671 (_ BitVec 32)) SeekEntryResult!6050)

(assert (=> b!586678 (= lt!266157 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586679 () Bool)

(declare-fun res!374487 () Bool)

(assert (=> b!586679 (=> (not res!374487) (not e!335327))))

(declare-fun arrayContainsKey!0 (array!36671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586679 (= res!374487 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53770 res!374494) b!586672))

(assert (= (and b!586672 res!374491) b!586671))

(assert (= (and b!586671 res!374492) b!586677))

(assert (= (and b!586677 res!374495) b!586679))

(assert (= (and b!586679 res!374487) b!586678))

(assert (= (and b!586678 res!374488) b!586674))

(assert (= (and b!586674 res!374485) b!586673))

(assert (= (and b!586673 res!374489) b!586675))

(assert (= (and b!586675 res!374490) b!586670))

(assert (= (and b!586670 res!374493) b!586676))

(assert (= (and b!586676 res!374486) b!586669))

(declare-fun m!565063 () Bool)

(assert (=> b!586679 m!565063))

(declare-fun m!565065 () Bool)

(assert (=> b!586677 m!565065))

(declare-fun m!565067 () Bool)

(assert (=> b!586670 m!565067))

(assert (=> b!586670 m!565067))

(declare-fun m!565069 () Bool)

(assert (=> b!586670 m!565069))

(declare-fun m!565071 () Bool)

(assert (=> b!586673 m!565071))

(declare-fun m!565073 () Bool)

(assert (=> b!586669 m!565073))

(declare-fun m!565075 () Bool)

(assert (=> b!586669 m!565075))

(assert (=> b!586669 m!565067))

(assert (=> b!586669 m!565075))

(declare-fun m!565077 () Bool)

(assert (=> b!586669 m!565077))

(declare-fun m!565079 () Bool)

(assert (=> b!586669 m!565079))

(assert (=> b!586669 m!565067))

(declare-fun m!565081 () Bool)

(assert (=> b!586669 m!565081))

(declare-fun m!565083 () Bool)

(assert (=> b!586669 m!565083))

(declare-fun m!565085 () Bool)

(assert (=> b!586678 m!565085))

(declare-fun m!565087 () Bool)

(assert (=> b!586676 m!565087))

(assert (=> b!586676 m!565067))

(assert (=> b!586671 m!565067))

(assert (=> b!586671 m!565067))

(declare-fun m!565089 () Bool)

(assert (=> b!586671 m!565089))

(declare-fun m!565091 () Bool)

(assert (=> start!53770 m!565091))

(declare-fun m!565093 () Bool)

(assert (=> start!53770 m!565093))

(declare-fun m!565095 () Bool)

(assert (=> b!586675 m!565095))

(assert (=> b!586675 m!565083))

(declare-fun m!565097 () Bool)

(assert (=> b!586675 m!565097))

(declare-fun m!565099 () Bool)

(assert (=> b!586674 m!565099))

(push 1)

(assert (not b!586671))

(assert (not start!53770))

(assert (not b!586678))

(assert (not b!586670))

(assert (not b!586669))

(assert (not b!586674))

(assert (not b!586677))

(assert (not b!586679))

(assert (not b!586673))

(check-sat)

