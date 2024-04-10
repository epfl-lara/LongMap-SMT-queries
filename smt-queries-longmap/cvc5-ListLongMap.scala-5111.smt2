; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69326 () Bool)

(assert start!69326)

(declare-fun b!808589 () Bool)

(declare-fun e!447618 () Bool)

(declare-fun e!447619 () Bool)

(assert (=> b!808589 (= e!447618 e!447619)))

(declare-fun res!552519 () Bool)

(assert (=> b!808589 (=> (not res!552519) (not e!447619))))

(declare-datatypes ((array!43975 0))(
  ( (array!43976 (arr!21063 (Array (_ BitVec 32) (_ BitVec 64))) (size!21484 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43975)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8654 0))(
  ( (MissingZero!8654 (index!36984 (_ BitVec 32))) (Found!8654 (index!36985 (_ BitVec 32))) (Intermediate!8654 (undefined!9466 Bool) (index!36986 (_ BitVec 32)) (x!67792 (_ BitVec 32))) (Undefined!8654) (MissingVacant!8654 (index!36987 (_ BitVec 32))) )
))
(declare-fun lt!362323 () SeekEntryResult!8654)

(declare-fun lt!362320 () SeekEntryResult!8654)

(assert (=> b!808589 (= res!552519 (and (= lt!362323 lt!362320) (= lt!362320 (Found!8654 j!153)) (not (= (select (arr!21063 a!3170) index!1236) (select (arr!21063 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43975 (_ BitVec 32)) SeekEntryResult!8654)

(assert (=> b!808589 (= lt!362320 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21063 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43975 (_ BitVec 32)) SeekEntryResult!8654)

(assert (=> b!808589 (= lt!362323 (seekEntryOrOpen!0 (select (arr!21063 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808590 () Bool)

(declare-fun e!447620 () Bool)

(declare-fun e!447617 () Bool)

(assert (=> b!808590 (= e!447620 e!447617)))

(declare-fun res!552515 () Bool)

(assert (=> b!808590 (=> (not res!552515) (not e!447617))))

(declare-fun lt!362324 () SeekEntryResult!8654)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!808590 (= res!552515 (or (= lt!362324 (MissingZero!8654 i!1163)) (= lt!362324 (MissingVacant!8654 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!808590 (= lt!362324 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!808591 () Bool)

(declare-fun res!552523 () Bool)

(assert (=> b!808591 (=> (not res!552523) (not e!447617))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!808591 (= res!552523 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21484 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21063 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21484 a!3170)) (= (select (arr!21063 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808592 () Bool)

(declare-fun res!552514 () Bool)

(assert (=> b!808592 (=> (not res!552514) (not e!447620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808592 (= res!552514 (validKeyInArray!0 (select (arr!21063 a!3170) j!153)))))

(declare-fun b!808593 () Bool)

(assert (=> b!808593 (= e!447617 e!447618)))

(declare-fun res!552520 () Bool)

(assert (=> b!808593 (=> (not res!552520) (not e!447618))))

(declare-fun lt!362321 () array!43975)

(declare-fun lt!362319 () (_ BitVec 64))

(assert (=> b!808593 (= res!552520 (= (seekEntryOrOpen!0 lt!362319 lt!362321 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362319 lt!362321 mask!3266)))))

(assert (=> b!808593 (= lt!362319 (select (store (arr!21063 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!808593 (= lt!362321 (array!43976 (store (arr!21063 a!3170) i!1163 k!2044) (size!21484 a!3170)))))

(declare-fun b!808594 () Bool)

(declare-fun res!552522 () Bool)

(assert (=> b!808594 (=> (not res!552522) (not e!447620))))

(assert (=> b!808594 (= res!552522 (validKeyInArray!0 k!2044))))

(declare-fun b!808595 () Bool)

(declare-fun res!552516 () Bool)

(assert (=> b!808595 (=> (not res!552516) (not e!447617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43975 (_ BitVec 32)) Bool)

(assert (=> b!808595 (= res!552516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808596 () Bool)

(declare-fun res!552521 () Bool)

(assert (=> b!808596 (=> (not res!552521) (not e!447620))))

(declare-fun arrayContainsKey!0 (array!43975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808596 (= res!552521 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808597 () Bool)

(assert (=> b!808597 (= e!447619 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000)))))

(declare-fun lt!362322 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808597 (= lt!362322 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808598 () Bool)

(declare-fun res!552518 () Bool)

(assert (=> b!808598 (=> (not res!552518) (not e!447620))))

(assert (=> b!808598 (= res!552518 (and (= (size!21484 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21484 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21484 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808599 () Bool)

(declare-fun res!552517 () Bool)

(assert (=> b!808599 (=> (not res!552517) (not e!447617))))

(declare-datatypes ((List!15026 0))(
  ( (Nil!15023) (Cons!15022 (h!16151 (_ BitVec 64)) (t!21341 List!15026)) )
))
(declare-fun arrayNoDuplicates!0 (array!43975 (_ BitVec 32) List!15026) Bool)

(assert (=> b!808599 (= res!552517 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15023))))

(declare-fun res!552524 () Bool)

(assert (=> start!69326 (=> (not res!552524) (not e!447620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69326 (= res!552524 (validMask!0 mask!3266))))

(assert (=> start!69326 e!447620))

(assert (=> start!69326 true))

(declare-fun array_inv!16859 (array!43975) Bool)

(assert (=> start!69326 (array_inv!16859 a!3170)))

(assert (= (and start!69326 res!552524) b!808598))

(assert (= (and b!808598 res!552518) b!808592))

(assert (= (and b!808592 res!552514) b!808594))

(assert (= (and b!808594 res!552522) b!808596))

(assert (= (and b!808596 res!552521) b!808590))

(assert (= (and b!808590 res!552515) b!808595))

(assert (= (and b!808595 res!552516) b!808599))

(assert (= (and b!808599 res!552517) b!808591))

(assert (= (and b!808591 res!552523) b!808593))

(assert (= (and b!808593 res!552520) b!808589))

(assert (= (and b!808589 res!552519) b!808597))

(declare-fun m!750725 () Bool)

(assert (=> b!808591 m!750725))

(declare-fun m!750727 () Bool)

(assert (=> b!808591 m!750727))

(declare-fun m!750729 () Bool)

(assert (=> b!808592 m!750729))

(assert (=> b!808592 m!750729))

(declare-fun m!750731 () Bool)

(assert (=> b!808592 m!750731))

(declare-fun m!750733 () Bool)

(assert (=> b!808590 m!750733))

(declare-fun m!750735 () Bool)

(assert (=> b!808595 m!750735))

(declare-fun m!750737 () Bool)

(assert (=> b!808596 m!750737))

(declare-fun m!750739 () Bool)

(assert (=> b!808593 m!750739))

(declare-fun m!750741 () Bool)

(assert (=> b!808593 m!750741))

(declare-fun m!750743 () Bool)

(assert (=> b!808593 m!750743))

(declare-fun m!750745 () Bool)

(assert (=> b!808593 m!750745))

(declare-fun m!750747 () Bool)

(assert (=> b!808589 m!750747))

(assert (=> b!808589 m!750729))

(assert (=> b!808589 m!750729))

(declare-fun m!750749 () Bool)

(assert (=> b!808589 m!750749))

(assert (=> b!808589 m!750729))

(declare-fun m!750751 () Bool)

(assert (=> b!808589 m!750751))

(declare-fun m!750753 () Bool)

(assert (=> b!808594 m!750753))

(declare-fun m!750755 () Bool)

(assert (=> b!808597 m!750755))

(declare-fun m!750757 () Bool)

(assert (=> b!808599 m!750757))

(declare-fun m!750759 () Bool)

(assert (=> start!69326 m!750759))

(declare-fun m!750761 () Bool)

(assert (=> start!69326 m!750761))

(push 1)

