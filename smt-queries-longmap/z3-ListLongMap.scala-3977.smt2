; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53916 () Bool)

(assert start!53916)

(declare-fun b!588348 () Bool)

(declare-fun res!376126 () Bool)

(declare-fun e!335939 () Bool)

(assert (=> b!588348 (=> (not res!376126) (not e!335939))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36774 0))(
  ( (array!36775 (arr!17660 (Array (_ BitVec 32) (_ BitVec 64))) (size!18025 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36774)

(assert (=> b!588348 (= res!376126 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17660 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588349 () Bool)

(declare-fun res!376127 () Bool)

(declare-fun e!335937 () Bool)

(assert (=> b!588349 (=> (not res!376127) (not e!335937))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36774 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588349 (= res!376127 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588350 () Bool)

(declare-datatypes ((Unit!18300 0))(
  ( (Unit!18301) )
))
(declare-fun e!335940 () Unit!18300)

(declare-fun Unit!18302 () Unit!18300)

(assert (=> b!588350 (= e!335940 Unit!18302)))

(assert (=> b!588350 false))

(declare-fun res!376124 () Bool)

(assert (=> start!53916 (=> (not res!376124) (not e!335937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53916 (= res!376124 (validMask!0 mask!3053))))

(assert (=> start!53916 e!335937))

(assert (=> start!53916 true))

(declare-fun array_inv!13543 (array!36774) Bool)

(assert (=> start!53916 (array_inv!13543 a!2986)))

(declare-fun b!588351 () Bool)

(declare-fun res!376122 () Bool)

(assert (=> b!588351 (=> (not res!376122) (not e!335939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36774 (_ BitVec 32)) Bool)

(assert (=> b!588351 (= res!376122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588352 () Bool)

(declare-fun res!376131 () Bool)

(assert (=> b!588352 (=> (not res!376131) (not e!335939))))

(declare-datatypes ((List!11740 0))(
  ( (Nil!11737) (Cons!11736 (h!12781 (_ BitVec 64)) (t!17959 List!11740)) )
))
(declare-fun arrayNoDuplicates!0 (array!36774 (_ BitVec 32) List!11740) Bool)

(assert (=> b!588352 (= res!376131 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11737))))

(declare-fun b!588353 () Bool)

(declare-fun res!376128 () Bool)

(assert (=> b!588353 (=> (not res!376128) (not e!335937))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588353 (= res!376128 (validKeyInArray!0 (select (arr!17660 a!2986) j!136)))))

(declare-fun b!588354 () Bool)

(declare-fun Unit!18303 () Unit!18300)

(assert (=> b!588354 (= e!335940 Unit!18303)))

(declare-fun b!588355 () Bool)

(declare-fun res!376132 () Bool)

(assert (=> b!588355 (=> (not res!376132) (not e!335937))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588355 (= res!376132 (and (= (size!18025 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18025 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18025 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588356 () Bool)

(declare-fun e!335936 () Bool)

(declare-datatypes ((SeekEntryResult!6097 0))(
  ( (MissingZero!6097 (index!26618 (_ BitVec 32))) (Found!6097 (index!26619 (_ BitVec 32))) (Intermediate!6097 (undefined!6909 Bool) (index!26620 (_ BitVec 32)) (x!55426 (_ BitVec 32))) (Undefined!6097) (MissingVacant!6097 (index!26621 (_ BitVec 32))) )
))
(declare-fun lt!266641 () SeekEntryResult!6097)

(declare-fun lt!266640 () SeekEntryResult!6097)

(assert (=> b!588356 (= e!335936 (= lt!266641 lt!266640))))

(declare-fun b!588357 () Bool)

(declare-fun e!335935 () Bool)

(assert (=> b!588357 (= e!335939 e!335935)))

(declare-fun res!376133 () Bool)

(assert (=> b!588357 (=> (not res!376133) (not e!335935))))

(assert (=> b!588357 (= res!376133 (= (select (store (arr!17660 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!266644 () array!36774)

(assert (=> b!588357 (= lt!266644 (array!36775 (store (arr!17660 a!2986) i!1108 k0!1786) (size!18025 a!2986)))))

(declare-fun b!588358 () Bool)

(assert (=> b!588358 (= e!335937 e!335939)))

(declare-fun res!376130 () Bool)

(assert (=> b!588358 (=> (not res!376130) (not e!335939))))

(declare-fun lt!266643 () SeekEntryResult!6097)

(assert (=> b!588358 (= res!376130 (or (= lt!266643 (MissingZero!6097 i!1108)) (= lt!266643 (MissingVacant!6097 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36774 (_ BitVec 32)) SeekEntryResult!6097)

(assert (=> b!588358 (= lt!266643 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588359 () Bool)

(declare-fun e!335938 () Bool)

(assert (=> b!588359 (= e!335938 (not true))))

(declare-fun lt!266639 () Unit!18300)

(assert (=> b!588359 (= lt!266639 e!335940)))

(declare-fun c!66480 () Bool)

(declare-fun lt!266637 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36774 (_ BitVec 32)) SeekEntryResult!6097)

(assert (=> b!588359 (= c!66480 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!266637 lt!266644 mask!3053) Undefined!6097))))

(assert (=> b!588359 e!335936))

(declare-fun res!376125 () Bool)

(assert (=> b!588359 (=> (not res!376125) (not e!335936))))

(declare-fun lt!266642 () (_ BitVec 32))

(assert (=> b!588359 (= res!376125 (= lt!266640 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266642 vacantSpotIndex!68 lt!266637 lt!266644 mask!3053)))))

(assert (=> b!588359 (= lt!266640 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266642 vacantSpotIndex!68 (select (arr!17660 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!588359 (= lt!266637 (select (store (arr!17660 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!266638 () Unit!18300)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36774 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18300)

(assert (=> b!588359 (= lt!266638 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266642 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588359 (= lt!266642 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588360 () Bool)

(assert (=> b!588360 (= e!335935 e!335938)))

(declare-fun res!376129 () Bool)

(assert (=> b!588360 (=> (not res!376129) (not e!335938))))

(assert (=> b!588360 (= res!376129 (and (= lt!266641 (Found!6097 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17660 a!2986) index!984) (select (arr!17660 a!2986) j!136))) (not (= (select (arr!17660 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588360 (= lt!266641 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17660 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588361 () Bool)

(declare-fun res!376123 () Bool)

(assert (=> b!588361 (=> (not res!376123) (not e!335937))))

(assert (=> b!588361 (= res!376123 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53916 res!376124) b!588355))

(assert (= (and b!588355 res!376132) b!588353))

(assert (= (and b!588353 res!376128) b!588361))

(assert (= (and b!588361 res!376123) b!588349))

(assert (= (and b!588349 res!376127) b!588358))

(assert (= (and b!588358 res!376130) b!588351))

(assert (= (and b!588351 res!376122) b!588352))

(assert (= (and b!588352 res!376131) b!588348))

(assert (= (and b!588348 res!376126) b!588357))

(assert (= (and b!588357 res!376133) b!588360))

(assert (= (and b!588360 res!376129) b!588359))

(assert (= (and b!588359 res!376125) b!588356))

(assert (= (and b!588359 c!66480) b!588350))

(assert (= (and b!588359 (not c!66480)) b!588354))

(declare-fun m!566401 () Bool)

(assert (=> b!588352 m!566401))

(declare-fun m!566403 () Bool)

(assert (=> b!588358 m!566403))

(declare-fun m!566405 () Bool)

(assert (=> b!588349 m!566405))

(declare-fun m!566407 () Bool)

(assert (=> b!588348 m!566407))

(declare-fun m!566409 () Bool)

(assert (=> b!588359 m!566409))

(declare-fun m!566411 () Bool)

(assert (=> b!588359 m!566411))

(declare-fun m!566413 () Bool)

(assert (=> b!588359 m!566413))

(declare-fun m!566415 () Bool)

(assert (=> b!588359 m!566415))

(assert (=> b!588359 m!566413))

(declare-fun m!566417 () Bool)

(assert (=> b!588359 m!566417))

(declare-fun m!566419 () Bool)

(assert (=> b!588359 m!566419))

(declare-fun m!566421 () Bool)

(assert (=> b!588359 m!566421))

(declare-fun m!566423 () Bool)

(assert (=> b!588359 m!566423))

(declare-fun m!566425 () Bool)

(assert (=> b!588361 m!566425))

(declare-fun m!566427 () Bool)

(assert (=> b!588360 m!566427))

(assert (=> b!588360 m!566413))

(assert (=> b!588360 m!566413))

(declare-fun m!566429 () Bool)

(assert (=> b!588360 m!566429))

(declare-fun m!566431 () Bool)

(assert (=> b!588351 m!566431))

(assert (=> b!588353 m!566413))

(assert (=> b!588353 m!566413))

(declare-fun m!566433 () Bool)

(assert (=> b!588353 m!566433))

(assert (=> b!588357 m!566415))

(declare-fun m!566435 () Bool)

(assert (=> b!588357 m!566435))

(declare-fun m!566437 () Bool)

(assert (=> start!53916 m!566437))

(declare-fun m!566439 () Bool)

(assert (=> start!53916 m!566439))

(check-sat (not b!588360) (not b!588351) (not start!53916) (not b!588358) (not b!588361) (not b!588352) (not b!588353) (not b!588349) (not b!588359))
(check-sat)
