; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53922 () Bool)

(assert start!53922)

(declare-fun b!587823 () Bool)

(declare-fun res!375363 () Bool)

(declare-fun e!335808 () Bool)

(assert (=> b!587823 (=> (not res!375363) (not e!335808))))

(declare-datatypes ((array!36711 0))(
  ( (array!36712 (arr!17626 (Array (_ BitVec 32) (_ BitVec 64))) (size!17990 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36711)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587823 (= res!375363 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587824 () Bool)

(declare-fun res!375358 () Bool)

(assert (=> b!587824 (=> (not res!375358) (not e!335808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587824 (= res!375358 (validKeyInArray!0 k0!1786))))

(declare-fun b!587826 () Bool)

(declare-fun e!335807 () Bool)

(assert (=> b!587826 (= e!335808 e!335807)))

(declare-fun res!375360 () Bool)

(assert (=> b!587826 (=> (not res!375360) (not e!335807))))

(declare-datatypes ((SeekEntryResult!6022 0))(
  ( (MissingZero!6022 (index!26318 (_ BitVec 32))) (Found!6022 (index!26319 (_ BitVec 32))) (Intermediate!6022 (undefined!6834 Bool) (index!26320 (_ BitVec 32)) (x!55279 (_ BitVec 32))) (Undefined!6022) (MissingVacant!6022 (index!26321 (_ BitVec 32))) )
))
(declare-fun lt!266551 () SeekEntryResult!6022)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587826 (= res!375360 (or (= lt!266551 (MissingZero!6022 i!1108)) (= lt!266551 (MissingVacant!6022 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36711 (_ BitVec 32)) SeekEntryResult!6022)

(assert (=> b!587826 (= lt!266551 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!587827 () Bool)

(assert (=> b!587827 (= e!335807 (not true))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!266549 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36711 (_ BitVec 32)) SeekEntryResult!6022)

(assert (=> b!587827 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266549 vacantSpotIndex!68 (select (arr!17626 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266549 vacantSpotIndex!68 (select (store (arr!17626 a!2986) i!1108 k0!1786) j!136) (array!36712 (store (arr!17626 a!2986) i!1108 k0!1786) (size!17990 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18241 0))(
  ( (Unit!18242) )
))
(declare-fun lt!266550 () Unit!18241)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36711 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18241)

(assert (=> b!587827 (= lt!266550 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266549 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587827 (= lt!266549 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!587828 () Bool)

(declare-fun res!375362 () Bool)

(assert (=> b!587828 (=> (not res!375362) (not e!335807))))

(assert (=> b!587828 (= res!375362 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17626 a!2986) j!136) a!2986 mask!3053) (Found!6022 j!136)))))

(declare-fun b!587829 () Bool)

(declare-fun res!375359 () Bool)

(assert (=> b!587829 (=> (not res!375359) (not e!335807))))

(assert (=> b!587829 (= res!375359 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17626 a!2986) index!984) (select (arr!17626 a!2986) j!136))) (not (= (select (arr!17626 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587830 () Bool)

(declare-fun res!375361 () Bool)

(assert (=> b!587830 (=> (not res!375361) (not e!335808))))

(assert (=> b!587830 (= res!375361 (and (= (size!17990 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17990 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17990 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587831 () Bool)

(declare-fun res!375357 () Bool)

(assert (=> b!587831 (=> (not res!375357) (not e!335807))))

(declare-datatypes ((List!11574 0))(
  ( (Nil!11571) (Cons!11570 (h!12618 (_ BitVec 64)) (t!17794 List!11574)) )
))
(declare-fun arrayNoDuplicates!0 (array!36711 (_ BitVec 32) List!11574) Bool)

(assert (=> b!587831 (= res!375357 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11571))))

(declare-fun b!587825 () Bool)

(declare-fun res!375364 () Bool)

(assert (=> b!587825 (=> (not res!375364) (not e!335807))))

(assert (=> b!587825 (= res!375364 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17626 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17626 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!375356 () Bool)

(assert (=> start!53922 (=> (not res!375356) (not e!335808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53922 (= res!375356 (validMask!0 mask!3053))))

(assert (=> start!53922 e!335808))

(assert (=> start!53922 true))

(declare-fun array_inv!13485 (array!36711) Bool)

(assert (=> start!53922 (array_inv!13485 a!2986)))

(declare-fun b!587832 () Bool)

(declare-fun res!375355 () Bool)

(assert (=> b!587832 (=> (not res!375355) (not e!335808))))

(assert (=> b!587832 (= res!375355 (validKeyInArray!0 (select (arr!17626 a!2986) j!136)))))

(declare-fun b!587833 () Bool)

(declare-fun res!375354 () Bool)

(assert (=> b!587833 (=> (not res!375354) (not e!335807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36711 (_ BitVec 32)) Bool)

(assert (=> b!587833 (= res!375354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53922 res!375356) b!587830))

(assert (= (and b!587830 res!375361) b!587832))

(assert (= (and b!587832 res!375355) b!587824))

(assert (= (and b!587824 res!375358) b!587823))

(assert (= (and b!587823 res!375363) b!587826))

(assert (= (and b!587826 res!375360) b!587833))

(assert (= (and b!587833 res!375354) b!587831))

(assert (= (and b!587831 res!375357) b!587825))

(assert (= (and b!587825 res!375364) b!587828))

(assert (= (and b!587828 res!375362) b!587829))

(assert (= (and b!587829 res!375359) b!587827))

(declare-fun m!566405 () Bool)

(assert (=> b!587827 m!566405))

(declare-fun m!566407 () Bool)

(assert (=> b!587827 m!566407))

(declare-fun m!566409 () Bool)

(assert (=> b!587827 m!566409))

(assert (=> b!587827 m!566407))

(declare-fun m!566411 () Bool)

(assert (=> b!587827 m!566411))

(assert (=> b!587827 m!566405))

(declare-fun m!566413 () Bool)

(assert (=> b!587827 m!566413))

(declare-fun m!566415 () Bool)

(assert (=> b!587827 m!566415))

(declare-fun m!566417 () Bool)

(assert (=> b!587827 m!566417))

(declare-fun m!566419 () Bool)

(assert (=> b!587833 m!566419))

(declare-fun m!566421 () Bool)

(assert (=> b!587829 m!566421))

(assert (=> b!587829 m!566407))

(declare-fun m!566423 () Bool)

(assert (=> b!587824 m!566423))

(assert (=> b!587832 m!566407))

(assert (=> b!587832 m!566407))

(declare-fun m!566425 () Bool)

(assert (=> b!587832 m!566425))

(declare-fun m!566427 () Bool)

(assert (=> start!53922 m!566427))

(declare-fun m!566429 () Bool)

(assert (=> start!53922 m!566429))

(declare-fun m!566431 () Bool)

(assert (=> b!587825 m!566431))

(assert (=> b!587825 m!566409))

(declare-fun m!566433 () Bool)

(assert (=> b!587825 m!566433))

(declare-fun m!566435 () Bool)

(assert (=> b!587826 m!566435))

(declare-fun m!566437 () Bool)

(assert (=> b!587823 m!566437))

(assert (=> b!587828 m!566407))

(assert (=> b!587828 m!566407))

(declare-fun m!566439 () Bool)

(assert (=> b!587828 m!566439))

(declare-fun m!566441 () Bool)

(assert (=> b!587831 m!566441))

(check-sat (not b!587832) (not start!53922) (not b!587833) (not b!587824) (not b!587823) (not b!587831) (not b!587826) (not b!587827) (not b!587828))
(check-sat)
