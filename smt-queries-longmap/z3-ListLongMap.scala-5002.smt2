; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68646 () Bool)

(assert start!68646)

(declare-fun b!797468 () Bool)

(declare-fun e!442531 () Bool)

(declare-fun e!442534 () Bool)

(assert (=> b!797468 (= e!442531 e!442534)))

(declare-fun res!541616 () Bool)

(assert (=> b!797468 (=> (not res!541616) (not e!442534))))

(declare-datatypes ((SeekEntryResult!8278 0))(
  ( (MissingZero!8278 (index!35480 (_ BitVec 32))) (Found!8278 (index!35481 (_ BitVec 32))) (Intermediate!8278 (undefined!9090 Bool) (index!35482 (_ BitVec 32)) (x!66543 (_ BitVec 32))) (Undefined!8278) (MissingVacant!8278 (index!35483 (_ BitVec 32))) )
))
(declare-fun lt!355640 () SeekEntryResult!8278)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797468 (= res!541616 (or (= lt!355640 (MissingZero!8278 i!1163)) (= lt!355640 (MissingVacant!8278 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43310 0))(
  ( (array!43311 (arr!20731 (Array (_ BitVec 32) (_ BitVec 64))) (size!21151 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43310)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43310 (_ BitVec 32)) SeekEntryResult!8278)

(assert (=> b!797468 (= lt!355640 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797469 () Bool)

(declare-fun res!541623 () Bool)

(assert (=> b!797469 (=> (not res!541623) (not e!442531))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797469 (= res!541623 (and (= (size!21151 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21151 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21151 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797470 () Bool)

(declare-fun res!541617 () Bool)

(assert (=> b!797470 (=> (not res!541617) (not e!442531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797470 (= res!541617 (validKeyInArray!0 k0!2044))))

(declare-fun b!797471 () Bool)

(declare-fun res!541613 () Bool)

(assert (=> b!797471 (=> (not res!541613) (not e!442534))))

(declare-datatypes ((List!14601 0))(
  ( (Nil!14598) (Cons!14597 (h!15732 (_ BitVec 64)) (t!20908 List!14601)) )
))
(declare-fun arrayNoDuplicates!0 (array!43310 (_ BitVec 32) List!14601) Bool)

(assert (=> b!797471 (= res!541613 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14598))))

(declare-fun res!541618 () Bool)

(assert (=> start!68646 (=> (not res!541618) (not e!442531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68646 (= res!541618 (validMask!0 mask!3266))))

(assert (=> start!68646 e!442531))

(assert (=> start!68646 true))

(declare-fun array_inv!16590 (array!43310) Bool)

(assert (=> start!68646 (array_inv!16590 a!3170)))

(declare-fun b!797472 () Bool)

(declare-fun e!442532 () Bool)

(assert (=> b!797472 (= e!442532 (not true))))

(declare-fun lt!355636 () SeekEntryResult!8278)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797472 (= lt!355636 (Found!8278 index!1236))))

(declare-fun b!797473 () Bool)

(declare-fun e!442533 () Bool)

(assert (=> b!797473 (= e!442534 e!442533)))

(declare-fun res!541615 () Bool)

(assert (=> b!797473 (=> (not res!541615) (not e!442533))))

(declare-fun lt!355642 () SeekEntryResult!8278)

(assert (=> b!797473 (= res!541615 (= lt!355642 lt!355636))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355641 () (_ BitVec 64))

(declare-fun lt!355639 () array!43310)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43310 (_ BitVec 32)) SeekEntryResult!8278)

(assert (=> b!797473 (= lt!355636 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355641 lt!355639 mask!3266))))

(assert (=> b!797473 (= lt!355642 (seekEntryOrOpen!0 lt!355641 lt!355639 mask!3266))))

(assert (=> b!797473 (= lt!355641 (select (store (arr!20731 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797473 (= lt!355639 (array!43311 (store (arr!20731 a!3170) i!1163 k0!2044) (size!21151 a!3170)))))

(declare-fun b!797474 () Bool)

(declare-fun res!541622 () Bool)

(assert (=> b!797474 (=> (not res!541622) (not e!442534))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797474 (= res!541622 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21151 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20731 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21151 a!3170)) (= (select (arr!20731 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797475 () Bool)

(assert (=> b!797475 (= e!442533 e!442532)))

(declare-fun res!541619 () Bool)

(assert (=> b!797475 (=> (not res!541619) (not e!442532))))

(declare-fun lt!355637 () SeekEntryResult!8278)

(declare-fun lt!355638 () SeekEntryResult!8278)

(assert (=> b!797475 (= res!541619 (and (= lt!355638 lt!355637) (= lt!355637 (Found!8278 j!153)) (= (select (arr!20731 a!3170) index!1236) (select (arr!20731 a!3170) j!153))))))

(assert (=> b!797475 (= lt!355637 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20731 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797475 (= lt!355638 (seekEntryOrOpen!0 (select (arr!20731 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797476 () Bool)

(declare-fun res!541620 () Bool)

(assert (=> b!797476 (=> (not res!541620) (not e!442531))))

(assert (=> b!797476 (= res!541620 (validKeyInArray!0 (select (arr!20731 a!3170) j!153)))))

(declare-fun b!797477 () Bool)

(declare-fun res!541614 () Bool)

(assert (=> b!797477 (=> (not res!541614) (not e!442531))))

(declare-fun arrayContainsKey!0 (array!43310 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797477 (= res!541614 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797478 () Bool)

(declare-fun res!541621 () Bool)

(assert (=> b!797478 (=> (not res!541621) (not e!442534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43310 (_ BitVec 32)) Bool)

(assert (=> b!797478 (= res!541621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68646 res!541618) b!797469))

(assert (= (and b!797469 res!541623) b!797476))

(assert (= (and b!797476 res!541620) b!797470))

(assert (= (and b!797470 res!541617) b!797477))

(assert (= (and b!797477 res!541614) b!797468))

(assert (= (and b!797468 res!541616) b!797478))

(assert (= (and b!797478 res!541621) b!797471))

(assert (= (and b!797471 res!541613) b!797474))

(assert (= (and b!797474 res!541622) b!797473))

(assert (= (and b!797473 res!541615) b!797475))

(assert (= (and b!797475 res!541619) b!797472))

(declare-fun m!738725 () Bool)

(assert (=> b!797475 m!738725))

(declare-fun m!738727 () Bool)

(assert (=> b!797475 m!738727))

(assert (=> b!797475 m!738727))

(declare-fun m!738729 () Bool)

(assert (=> b!797475 m!738729))

(assert (=> b!797475 m!738727))

(declare-fun m!738731 () Bool)

(assert (=> b!797475 m!738731))

(declare-fun m!738733 () Bool)

(assert (=> b!797468 m!738733))

(declare-fun m!738735 () Bool)

(assert (=> b!797478 m!738735))

(declare-fun m!738737 () Bool)

(assert (=> b!797477 m!738737))

(assert (=> b!797476 m!738727))

(assert (=> b!797476 m!738727))

(declare-fun m!738739 () Bool)

(assert (=> b!797476 m!738739))

(declare-fun m!738741 () Bool)

(assert (=> b!797471 m!738741))

(declare-fun m!738743 () Bool)

(assert (=> b!797473 m!738743))

(declare-fun m!738745 () Bool)

(assert (=> b!797473 m!738745))

(declare-fun m!738747 () Bool)

(assert (=> b!797473 m!738747))

(declare-fun m!738749 () Bool)

(assert (=> b!797473 m!738749))

(declare-fun m!738751 () Bool)

(assert (=> start!68646 m!738751))

(declare-fun m!738753 () Bool)

(assert (=> start!68646 m!738753))

(declare-fun m!738755 () Bool)

(assert (=> b!797474 m!738755))

(declare-fun m!738757 () Bool)

(assert (=> b!797474 m!738757))

(declare-fun m!738759 () Bool)

(assert (=> b!797470 m!738759))

(check-sat (not start!68646) (not b!797476) (not b!797478) (not b!797468) (not b!797470) (not b!797477) (not b!797473) (not b!797475) (not b!797471))
(check-sat)
