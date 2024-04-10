; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53874 () Bool)

(assert start!53874)

(declare-fun b!587647 () Bool)

(declare-fun res!375292 () Bool)

(declare-fun e!335687 () Bool)

(assert (=> b!587647 (=> (not res!375292) (not e!335687))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36718 0))(
  ( (array!36719 (arr!17632 (Array (_ BitVec 32) (_ BitVec 64))) (size!17996 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36718)

(assert (=> b!587647 (= res!375292 (and (= (size!17996 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17996 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17996 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587648 () Bool)

(declare-fun res!375285 () Bool)

(declare-fun e!335686 () Bool)

(assert (=> b!587648 (=> (not res!375285) (not e!335686))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36718 (_ BitVec 32)) Bool)

(assert (=> b!587648 (= res!375285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587649 () Bool)

(declare-fun res!375283 () Bool)

(assert (=> b!587649 (=> (not res!375283) (not e!335687))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587649 (= res!375283 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!375289 () Bool)

(assert (=> start!53874 (=> (not res!375289) (not e!335687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53874 (= res!375289 (validMask!0 mask!3053))))

(assert (=> start!53874 e!335687))

(assert (=> start!53874 true))

(declare-fun array_inv!13428 (array!36718) Bool)

(assert (=> start!53874 (array_inv!13428 a!2986)))

(declare-fun b!587650 () Bool)

(declare-fun res!375293 () Bool)

(assert (=> b!587650 (=> (not res!375293) (not e!335687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587650 (= res!375293 (validKeyInArray!0 k0!1786))))

(declare-fun b!587651 () Bool)

(declare-fun res!375286 () Bool)

(assert (=> b!587651 (=> (not res!375286) (not e!335686))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!587651 (= res!375286 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17632 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17632 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587652 () Bool)

(declare-fun res!375291 () Bool)

(assert (=> b!587652 (=> (not res!375291) (not e!335686))))

(declare-datatypes ((List!11673 0))(
  ( (Nil!11670) (Cons!11669 (h!12714 (_ BitVec 64)) (t!17901 List!11673)) )
))
(declare-fun arrayNoDuplicates!0 (array!36718 (_ BitVec 32) List!11673) Bool)

(assert (=> b!587652 (= res!375291 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11670))))

(declare-fun b!587653 () Bool)

(assert (=> b!587653 (= e!335687 e!335686)))

(declare-fun res!375290 () Bool)

(assert (=> b!587653 (=> (not res!375290) (not e!335686))))

(declare-datatypes ((SeekEntryResult!6072 0))(
  ( (MissingZero!6072 (index!26518 (_ BitVec 32))) (Found!6072 (index!26519 (_ BitVec 32))) (Intermediate!6072 (undefined!6884 Bool) (index!26520 (_ BitVec 32)) (x!55326 (_ BitVec 32))) (Undefined!6072) (MissingVacant!6072 (index!26521 (_ BitVec 32))) )
))
(declare-fun lt!266457 () SeekEntryResult!6072)

(assert (=> b!587653 (= res!375290 (or (= lt!266457 (MissingZero!6072 i!1108)) (= lt!266457 (MissingVacant!6072 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36718 (_ BitVec 32)) SeekEntryResult!6072)

(assert (=> b!587653 (= lt!266457 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!587654 () Bool)

(declare-fun res!375287 () Bool)

(assert (=> b!587654 (=> (not res!375287) (not e!335686))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36718 (_ BitVec 32)) SeekEntryResult!6072)

(assert (=> b!587654 (= res!375287 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17632 a!2986) j!136) a!2986 mask!3053) (Found!6072 j!136)))))

(declare-fun b!587655 () Bool)

(declare-fun res!375284 () Bool)

(assert (=> b!587655 (=> (not res!375284) (not e!335686))))

(assert (=> b!587655 (= res!375284 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17632 a!2986) index!984) (select (arr!17632 a!2986) j!136))) (not (= (select (arr!17632 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587656 () Bool)

(assert (=> b!587656 (= e!335686 (not true))))

(declare-fun lt!266456 () (_ BitVec 32))

(assert (=> b!587656 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266456 vacantSpotIndex!68 (select (arr!17632 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266456 vacantSpotIndex!68 (select (store (arr!17632 a!2986) i!1108 k0!1786) j!136) (array!36719 (store (arr!17632 a!2986) i!1108 k0!1786) (size!17996 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18264 0))(
  ( (Unit!18265) )
))
(declare-fun lt!266458 () Unit!18264)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36718 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18264)

(assert (=> b!587656 (= lt!266458 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266456 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587656 (= lt!266456 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587657 () Bool)

(declare-fun res!375288 () Bool)

(assert (=> b!587657 (=> (not res!375288) (not e!335687))))

(assert (=> b!587657 (= res!375288 (validKeyInArray!0 (select (arr!17632 a!2986) j!136)))))

(assert (= (and start!53874 res!375289) b!587647))

(assert (= (and b!587647 res!375292) b!587657))

(assert (= (and b!587657 res!375288) b!587650))

(assert (= (and b!587650 res!375293) b!587649))

(assert (= (and b!587649 res!375283) b!587653))

(assert (= (and b!587653 res!375290) b!587648))

(assert (= (and b!587648 res!375285) b!587652))

(assert (= (and b!587652 res!375291) b!587651))

(assert (= (and b!587651 res!375286) b!587654))

(assert (= (and b!587654 res!375287) b!587655))

(assert (= (and b!587655 res!375284) b!587656))

(declare-fun m!566079 () Bool)

(assert (=> b!587657 m!566079))

(assert (=> b!587657 m!566079))

(declare-fun m!566081 () Bool)

(assert (=> b!587657 m!566081))

(declare-fun m!566083 () Bool)

(assert (=> b!587648 m!566083))

(declare-fun m!566085 () Bool)

(assert (=> b!587650 m!566085))

(declare-fun m!566087 () Bool)

(assert (=> b!587652 m!566087))

(assert (=> b!587654 m!566079))

(assert (=> b!587654 m!566079))

(declare-fun m!566089 () Bool)

(assert (=> b!587654 m!566089))

(declare-fun m!566091 () Bool)

(assert (=> b!587651 m!566091))

(declare-fun m!566093 () Bool)

(assert (=> b!587651 m!566093))

(declare-fun m!566095 () Bool)

(assert (=> b!587651 m!566095))

(declare-fun m!566097 () Bool)

(assert (=> start!53874 m!566097))

(declare-fun m!566099 () Bool)

(assert (=> start!53874 m!566099))

(declare-fun m!566101 () Bool)

(assert (=> b!587649 m!566101))

(declare-fun m!566103 () Bool)

(assert (=> b!587655 m!566103))

(assert (=> b!587655 m!566079))

(declare-fun m!566105 () Bool)

(assert (=> b!587653 m!566105))

(declare-fun m!566107 () Bool)

(assert (=> b!587656 m!566107))

(declare-fun m!566109 () Bool)

(assert (=> b!587656 m!566109))

(assert (=> b!587656 m!566079))

(declare-fun m!566111 () Bool)

(assert (=> b!587656 m!566111))

(assert (=> b!587656 m!566079))

(assert (=> b!587656 m!566093))

(assert (=> b!587656 m!566109))

(declare-fun m!566113 () Bool)

(assert (=> b!587656 m!566113))

(declare-fun m!566115 () Bool)

(assert (=> b!587656 m!566115))

(check-sat (not b!587649) (not b!587650) (not b!587657) (not b!587654) (not b!587653) (not b!587648) (not b!587656) (not b!587652) (not start!53874))
(check-sat)
