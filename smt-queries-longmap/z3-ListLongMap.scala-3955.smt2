; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53742 () Bool)

(assert start!53742)

(declare-fun b!586208 () Bool)

(declare-fun e!335201 () Bool)

(declare-fun e!335200 () Bool)

(assert (=> b!586208 (= e!335201 e!335200)))

(declare-fun res!374025 () Bool)

(assert (=> b!586208 (=> (not res!374025) (not e!335200))))

(declare-datatypes ((SeekEntryResult!6036 0))(
  ( (MissingZero!6036 (index!26371 (_ BitVec 32))) (Found!6036 (index!26372 (_ BitVec 32))) (Intermediate!6036 (undefined!6848 Bool) (index!26373 (_ BitVec 32)) (x!55185 (_ BitVec 32))) (Undefined!6036) (MissingVacant!6036 (index!26374 (_ BitVec 32))) )
))
(declare-fun lt!266030 () SeekEntryResult!6036)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586208 (= res!374025 (or (= lt!266030 (MissingZero!6036 i!1108)) (= lt!266030 (MissingVacant!6036 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36643 0))(
  ( (array!36644 (arr!17596 (Array (_ BitVec 32) (_ BitVec 64))) (size!17960 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36643)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36643 (_ BitVec 32)) SeekEntryResult!6036)

(assert (=> b!586208 (= lt!266030 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!586209 () Bool)

(declare-fun res!374033 () Bool)

(assert (=> b!586209 (=> (not res!374033) (not e!335201))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586209 (= res!374033 (validKeyInArray!0 (select (arr!17596 a!2986) j!136)))))

(declare-fun b!586210 () Bool)

(assert (=> b!586210 (= e!335200 (not true))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!266031 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36643 (_ BitVec 32)) SeekEntryResult!6036)

(assert (=> b!586210 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266031 vacantSpotIndex!68 (select (arr!17596 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266031 vacantSpotIndex!68 (select (store (arr!17596 a!2986) i!1108 k0!1786) j!136) (array!36644 (store (arr!17596 a!2986) i!1108 k0!1786) (size!17960 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18192 0))(
  ( (Unit!18193) )
))
(declare-fun lt!266032 () Unit!18192)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36643 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18192)

(assert (=> b!586210 (= lt!266032 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266031 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586210 (= lt!266031 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586211 () Bool)

(declare-fun res!374032 () Bool)

(assert (=> b!586211 (=> (not res!374032) (not e!335201))))

(assert (=> b!586211 (= res!374032 (and (= (size!17960 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17960 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17960 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586212 () Bool)

(declare-fun res!374028 () Bool)

(assert (=> b!586212 (=> (not res!374028) (not e!335200))))

(assert (=> b!586212 (= res!374028 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17596 a!2986) index!984) (select (arr!17596 a!2986) j!136))) (not (= (select (arr!17596 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586213 () Bool)

(declare-fun res!374031 () Bool)

(assert (=> b!586213 (=> (not res!374031) (not e!335201))))

(declare-fun arrayContainsKey!0 (array!36643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586213 (= res!374031 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586214 () Bool)

(declare-fun res!374029 () Bool)

(assert (=> b!586214 (=> (not res!374029) (not e!335200))))

(assert (=> b!586214 (= res!374029 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17596 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17596 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586215 () Bool)

(declare-fun res!374026 () Bool)

(assert (=> b!586215 (=> (not res!374026) (not e!335200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36643 (_ BitVec 32)) Bool)

(assert (=> b!586215 (= res!374026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586216 () Bool)

(declare-fun res!374024 () Bool)

(assert (=> b!586216 (=> (not res!374024) (not e!335201))))

(assert (=> b!586216 (= res!374024 (validKeyInArray!0 k0!1786))))

(declare-fun b!586217 () Bool)

(declare-fun res!374027 () Bool)

(assert (=> b!586217 (=> (not res!374027) (not e!335200))))

(assert (=> b!586217 (= res!374027 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17596 a!2986) j!136) a!2986 mask!3053) (Found!6036 j!136)))))

(declare-fun b!586207 () Bool)

(declare-fun res!374023 () Bool)

(assert (=> b!586207 (=> (not res!374023) (not e!335200))))

(declare-datatypes ((List!11637 0))(
  ( (Nil!11634) (Cons!11633 (h!12678 (_ BitVec 64)) (t!17865 List!11637)) )
))
(declare-fun arrayNoDuplicates!0 (array!36643 (_ BitVec 32) List!11637) Bool)

(assert (=> b!586207 (= res!374023 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11634))))

(declare-fun res!374030 () Bool)

(assert (=> start!53742 (=> (not res!374030) (not e!335201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53742 (= res!374030 (validMask!0 mask!3053))))

(assert (=> start!53742 e!335201))

(assert (=> start!53742 true))

(declare-fun array_inv!13392 (array!36643) Bool)

(assert (=> start!53742 (array_inv!13392 a!2986)))

(assert (= (and start!53742 res!374030) b!586211))

(assert (= (and b!586211 res!374032) b!586209))

(assert (= (and b!586209 res!374033) b!586216))

(assert (= (and b!586216 res!374024) b!586213))

(assert (= (and b!586213 res!374031) b!586208))

(assert (= (and b!586208 res!374025) b!586215))

(assert (= (and b!586215 res!374026) b!586207))

(assert (= (and b!586207 res!374023) b!586214))

(assert (= (and b!586214 res!374029) b!586217))

(assert (= (and b!586217 res!374027) b!586212))

(assert (= (and b!586212 res!374028) b!586210))

(declare-fun m!564531 () Bool)

(assert (=> b!586213 m!564531))

(declare-fun m!564533 () Bool)

(assert (=> b!586210 m!564533))

(declare-fun m!564535 () Bool)

(assert (=> b!586210 m!564535))

(declare-fun m!564537 () Bool)

(assert (=> b!586210 m!564537))

(declare-fun m!564539 () Bool)

(assert (=> b!586210 m!564539))

(assert (=> b!586210 m!564537))

(declare-fun m!564541 () Bool)

(assert (=> b!586210 m!564541))

(assert (=> b!586210 m!564535))

(declare-fun m!564543 () Bool)

(assert (=> b!586210 m!564543))

(declare-fun m!564545 () Bool)

(assert (=> b!586210 m!564545))

(declare-fun m!564547 () Bool)

(assert (=> b!586212 m!564547))

(assert (=> b!586212 m!564537))

(declare-fun m!564549 () Bool)

(assert (=> start!53742 m!564549))

(declare-fun m!564551 () Bool)

(assert (=> start!53742 m!564551))

(assert (=> b!586209 m!564537))

(assert (=> b!586209 m!564537))

(declare-fun m!564553 () Bool)

(assert (=> b!586209 m!564553))

(declare-fun m!564555 () Bool)

(assert (=> b!586207 m!564555))

(declare-fun m!564557 () Bool)

(assert (=> b!586216 m!564557))

(declare-fun m!564559 () Bool)

(assert (=> b!586208 m!564559))

(assert (=> b!586217 m!564537))

(assert (=> b!586217 m!564537))

(declare-fun m!564561 () Bool)

(assert (=> b!586217 m!564561))

(declare-fun m!564563 () Bool)

(assert (=> b!586215 m!564563))

(declare-fun m!564565 () Bool)

(assert (=> b!586214 m!564565))

(assert (=> b!586214 m!564541))

(declare-fun m!564567 () Bool)

(assert (=> b!586214 m!564567))

(check-sat (not b!586216) (not b!586213) (not b!586210) (not start!53742) (not b!586215) (not b!586217) (not b!586209) (not b!586207) (not b!586208))
(check-sat)
