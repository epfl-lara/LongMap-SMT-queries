; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69550 () Bool)

(assert start!69550)

(declare-fun b!810518 () Bool)

(declare-fun e!448643 () Bool)

(declare-fun e!448640 () Bool)

(assert (=> b!810518 (= e!448643 e!448640)))

(declare-fun res!553798 () Bool)

(assert (=> b!810518 (=> (not res!553798) (not e!448640))))

(declare-datatypes ((SeekEntryResult!8685 0))(
  ( (MissingZero!8685 (index!37108 (_ BitVec 32))) (Found!8685 (index!37109 (_ BitVec 32))) (Intermediate!8685 (undefined!9497 Bool) (index!37110 (_ BitVec 32)) (x!67921 (_ BitVec 32))) (Undefined!8685) (MissingVacant!8685 (index!37111 (_ BitVec 32))) )
))
(declare-fun lt!363273 () SeekEntryResult!8685)

(declare-fun lt!363277 () SeekEntryResult!8685)

(declare-datatypes ((array!44046 0))(
  ( (array!44047 (arr!21094 (Array (_ BitVec 32) (_ BitVec 64))) (size!21515 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44046)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!810518 (= res!553798 (and (= lt!363273 lt!363277) (not (= (select (arr!21094 a!3170) index!1236) (select (arr!21094 a!3170) j!153)))))))

(assert (=> b!810518 (= lt!363277 (Found!8685 j!153))))

(declare-fun e!448642 () Bool)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!363271 () SeekEntryResult!8685)

(declare-fun lt!363275 () SeekEntryResult!8685)

(declare-fun b!810519 () Bool)

(assert (=> b!810519 (= e!448642 (and (= lt!363275 lt!363271) (= lt!363271 lt!363277) (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1077)) (bvsub #b01111111111111111111111111111110 x!1077))))))

(declare-fun lt!363270 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44046 (_ BitVec 32)) SeekEntryResult!8685)

(assert (=> b!810519 (= lt!363271 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363270 vacantBefore!23 (select (arr!21094 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810520 () Bool)

(declare-fun res!553806 () Bool)

(assert (=> b!810520 (=> (not res!553806) (not e!448642))))

(declare-fun lt!363276 () SeekEntryResult!8685)

(declare-fun lt!363274 () array!44046)

(declare-fun lt!363278 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!810520 (= res!553806 (= lt!363276 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363270 vacantAfter!23 lt!363278 lt!363274 mask!3266)))))

(declare-fun b!810521 () Bool)

(declare-fun e!448644 () Bool)

(declare-fun e!448641 () Bool)

(assert (=> b!810521 (= e!448644 e!448641)))

(declare-fun res!553802 () Bool)

(assert (=> b!810521 (=> (not res!553802) (not e!448641))))

(assert (=> b!810521 (= res!553802 (= lt!363276 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363278 lt!363274 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44046 (_ BitVec 32)) SeekEntryResult!8685)

(assert (=> b!810521 (= lt!363276 (seekEntryOrOpen!0 lt!363278 lt!363274 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!810521 (= lt!363278 (select (store (arr!21094 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810521 (= lt!363274 (array!44047 (store (arr!21094 a!3170) i!1163 k0!2044) (size!21515 a!3170)))))

(declare-fun b!810522 () Bool)

(declare-fun res!553804 () Bool)

(declare-fun e!448646 () Bool)

(assert (=> b!810522 (=> (not res!553804) (not e!448646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810522 (= res!553804 (validKeyInArray!0 (select (arr!21094 a!3170) j!153)))))

(declare-fun b!810524 () Bool)

(declare-fun res!553803 () Bool)

(assert (=> b!810524 (=> (not res!553803) (not e!448644))))

(assert (=> b!810524 (= res!553803 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21515 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21094 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21515 a!3170)) (= (select (arr!21094 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810525 () Bool)

(declare-fun res!553799 () Bool)

(assert (=> b!810525 (=> (not res!553799) (not e!448646))))

(declare-fun arrayContainsKey!0 (array!44046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810525 (= res!553799 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810526 () Bool)

(assert (=> b!810526 (= e!448646 e!448644)))

(declare-fun res!553796 () Bool)

(assert (=> b!810526 (=> (not res!553796) (not e!448644))))

(declare-fun lt!363272 () SeekEntryResult!8685)

(assert (=> b!810526 (= res!553796 (or (= lt!363272 (MissingZero!8685 i!1163)) (= lt!363272 (MissingVacant!8685 i!1163))))))

(assert (=> b!810526 (= lt!363272 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!810527 () Bool)

(assert (=> b!810527 (= e!448641 e!448643)))

(declare-fun res!553801 () Bool)

(assert (=> b!810527 (=> (not res!553801) (not e!448643))))

(assert (=> b!810527 (= res!553801 (= lt!363275 lt!363273))))

(assert (=> b!810527 (= lt!363273 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21094 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810527 (= lt!363275 (seekEntryOrOpen!0 (select (arr!21094 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810528 () Bool)

(declare-fun res!553797 () Bool)

(assert (=> b!810528 (=> (not res!553797) (not e!448646))))

(assert (=> b!810528 (= res!553797 (validKeyInArray!0 k0!2044))))

(declare-fun b!810529 () Bool)

(declare-fun res!553795 () Bool)

(assert (=> b!810529 (=> (not res!553795) (not e!448644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44046 (_ BitVec 32)) Bool)

(assert (=> b!810529 (= res!553795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810523 () Bool)

(declare-fun res!553800 () Bool)

(assert (=> b!810523 (=> (not res!553800) (not e!448644))))

(declare-datatypes ((List!15057 0))(
  ( (Nil!15054) (Cons!15053 (h!16182 (_ BitVec 64)) (t!21372 List!15057)) )
))
(declare-fun arrayNoDuplicates!0 (array!44046 (_ BitVec 32) List!15057) Bool)

(assert (=> b!810523 (= res!553800 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15054))))

(declare-fun res!553807 () Bool)

(assert (=> start!69550 (=> (not res!553807) (not e!448646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69550 (= res!553807 (validMask!0 mask!3266))))

(assert (=> start!69550 e!448646))

(assert (=> start!69550 true))

(declare-fun array_inv!16890 (array!44046) Bool)

(assert (=> start!69550 (array_inv!16890 a!3170)))

(declare-fun b!810530 () Bool)

(assert (=> b!810530 (= e!448640 e!448642)))

(declare-fun res!553805 () Bool)

(assert (=> b!810530 (=> (not res!553805) (not e!448642))))

(assert (=> b!810530 (= res!553805 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!363270 #b00000000000000000000000000000000) (bvslt lt!363270 (size!21515 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810530 (= lt!363270 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810531 () Bool)

(declare-fun res!553808 () Bool)

(assert (=> b!810531 (=> (not res!553808) (not e!448646))))

(assert (=> b!810531 (= res!553808 (and (= (size!21515 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21515 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21515 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69550 res!553807) b!810531))

(assert (= (and b!810531 res!553808) b!810522))

(assert (= (and b!810522 res!553804) b!810528))

(assert (= (and b!810528 res!553797) b!810525))

(assert (= (and b!810525 res!553799) b!810526))

(assert (= (and b!810526 res!553796) b!810529))

(assert (= (and b!810529 res!553795) b!810523))

(assert (= (and b!810523 res!553800) b!810524))

(assert (= (and b!810524 res!553803) b!810521))

(assert (= (and b!810521 res!553802) b!810527))

(assert (= (and b!810527 res!553801) b!810518))

(assert (= (and b!810518 res!553798) b!810530))

(assert (= (and b!810530 res!553805) b!810520))

(assert (= (and b!810520 res!553806) b!810519))

(declare-fun m!752705 () Bool)

(assert (=> b!810530 m!752705))

(declare-fun m!752707 () Bool)

(assert (=> b!810521 m!752707))

(declare-fun m!752709 () Bool)

(assert (=> b!810521 m!752709))

(declare-fun m!752711 () Bool)

(assert (=> b!810521 m!752711))

(declare-fun m!752713 () Bool)

(assert (=> b!810521 m!752713))

(declare-fun m!752715 () Bool)

(assert (=> b!810527 m!752715))

(assert (=> b!810527 m!752715))

(declare-fun m!752717 () Bool)

(assert (=> b!810527 m!752717))

(assert (=> b!810527 m!752715))

(declare-fun m!752719 () Bool)

(assert (=> b!810527 m!752719))

(declare-fun m!752721 () Bool)

(assert (=> b!810518 m!752721))

(assert (=> b!810518 m!752715))

(declare-fun m!752723 () Bool)

(assert (=> b!810520 m!752723))

(declare-fun m!752725 () Bool)

(assert (=> start!69550 m!752725))

(declare-fun m!752727 () Bool)

(assert (=> start!69550 m!752727))

(assert (=> b!810519 m!752715))

(assert (=> b!810519 m!752715))

(declare-fun m!752729 () Bool)

(assert (=> b!810519 m!752729))

(declare-fun m!752731 () Bool)

(assert (=> b!810525 m!752731))

(declare-fun m!752733 () Bool)

(assert (=> b!810523 m!752733))

(declare-fun m!752735 () Bool)

(assert (=> b!810529 m!752735))

(declare-fun m!752737 () Bool)

(assert (=> b!810524 m!752737))

(declare-fun m!752739 () Bool)

(assert (=> b!810524 m!752739))

(assert (=> b!810522 m!752715))

(assert (=> b!810522 m!752715))

(declare-fun m!752741 () Bool)

(assert (=> b!810522 m!752741))

(declare-fun m!752743 () Bool)

(assert (=> b!810528 m!752743))

(declare-fun m!752745 () Bool)

(assert (=> b!810526 m!752745))

(check-sat (not b!810525) (not b!810523) (not start!69550) (not b!810526) (not b!810522) (not b!810527) (not b!810521) (not b!810529) (not b!810520) (not b!810528) (not b!810519) (not b!810530))
(check-sat)
