; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69224 () Bool)

(assert start!69224)

(declare-fun b!807536 () Bool)

(declare-fun e!447094 () Bool)

(declare-fun e!447096 () Bool)

(assert (=> b!807536 (= e!447094 e!447096)))

(declare-fun res!551664 () Bool)

(assert (=> b!807536 (=> (not res!551664) (not e!447096))))

(declare-datatypes ((SeekEntryResult!8630 0))(
  ( (MissingZero!8630 (index!36888 (_ BitVec 32))) (Found!8630 (index!36889 (_ BitVec 32))) (Intermediate!8630 (undefined!9442 Bool) (index!36890 (_ BitVec 32)) (x!67698 (_ BitVec 32))) (Undefined!8630) (MissingVacant!8630 (index!36891 (_ BitVec 32))) )
))
(declare-fun lt!361782 () SeekEntryResult!8630)

(declare-datatypes ((array!43924 0))(
  ( (array!43925 (arr!21039 (Array (_ BitVec 32) (_ BitVec 64))) (size!21460 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43924)

(declare-fun lt!361787 () SeekEntryResult!8630)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807536 (= res!551664 (and (= lt!361782 lt!361787) (= lt!361787 (Found!8630 j!153)) (not (= (select (arr!21039 a!3170) index!1236) (select (arr!21039 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43924 (_ BitVec 32)) SeekEntryResult!8630)

(assert (=> b!807536 (= lt!361787 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21039 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43924 (_ BitVec 32)) SeekEntryResult!8630)

(assert (=> b!807536 (= lt!361782 (seekEntryOrOpen!0 (select (arr!21039 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807538 () Bool)

(declare-fun e!447097 () Bool)

(assert (=> b!807538 (= e!447097 e!447094)))

(declare-fun res!551666 () Bool)

(assert (=> b!807538 (=> (not res!551666) (not e!447094))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361786 () array!43924)

(declare-fun lt!361783 () (_ BitVec 64))

(assert (=> b!807538 (= res!551666 (= (seekEntryOrOpen!0 lt!361783 lt!361786 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361783 lt!361786 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807538 (= lt!361783 (select (store (arr!21039 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807538 (= lt!361786 (array!43925 (store (arr!21039 a!3170) i!1163 k!2044) (size!21460 a!3170)))))

(declare-fun b!807539 () Bool)

(declare-fun res!551660 () Bool)

(assert (=> b!807539 (=> (not res!551660) (not e!447097))))

(assert (=> b!807539 (= res!551660 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21460 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21039 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21460 a!3170)) (= (select (arr!21039 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807540 () Bool)

(declare-fun res!551665 () Bool)

(declare-fun e!447095 () Bool)

(assert (=> b!807540 (=> (not res!551665) (not e!447095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807540 (= res!551665 (validKeyInArray!0 k!2044))))

(declare-fun b!807541 () Bool)

(declare-fun res!551668 () Bool)

(assert (=> b!807541 (=> (not res!551668) (not e!447097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43924 (_ BitVec 32)) Bool)

(assert (=> b!807541 (= res!551668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807542 () Bool)

(declare-fun res!551659 () Bool)

(assert (=> b!807542 (=> (not res!551659) (not e!447097))))

(declare-datatypes ((List!15002 0))(
  ( (Nil!14999) (Cons!14998 (h!16127 (_ BitVec 64)) (t!21317 List!15002)) )
))
(declare-fun arrayNoDuplicates!0 (array!43924 (_ BitVec 32) List!15002) Bool)

(assert (=> b!807542 (= res!551659 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14999))))

(declare-fun b!807543 () Bool)

(declare-fun res!551661 () Bool)

(assert (=> b!807543 (=> (not res!551661) (not e!447095))))

(assert (=> b!807543 (= res!551661 (and (= (size!21460 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21460 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21460 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807544 () Bool)

(assert (=> b!807544 (= e!447095 e!447097)))

(declare-fun res!551663 () Bool)

(assert (=> b!807544 (=> (not res!551663) (not e!447097))))

(declare-fun lt!361785 () SeekEntryResult!8630)

(assert (=> b!807544 (= res!551663 (or (= lt!361785 (MissingZero!8630 i!1163)) (= lt!361785 (MissingVacant!8630 i!1163))))))

(assert (=> b!807544 (= lt!361785 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!551667 () Bool)

(assert (=> start!69224 (=> (not res!551667) (not e!447095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69224 (= res!551667 (validMask!0 mask!3266))))

(assert (=> start!69224 e!447095))

(assert (=> start!69224 true))

(declare-fun array_inv!16835 (array!43924) Bool)

(assert (=> start!69224 (array_inv!16835 a!3170)))

(declare-fun b!807537 () Bool)

(declare-fun res!551662 () Bool)

(assert (=> b!807537 (=> (not res!551662) (not e!447095))))

(assert (=> b!807537 (= res!551662 (validKeyInArray!0 (select (arr!21039 a!3170) j!153)))))

(declare-fun b!807545 () Bool)

(assert (=> b!807545 (= e!447096 false)))

(declare-fun lt!361784 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807545 (= lt!361784 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807546 () Bool)

(declare-fun res!551669 () Bool)

(assert (=> b!807546 (=> (not res!551669) (not e!447095))))

(declare-fun arrayContainsKey!0 (array!43924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807546 (= res!551669 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69224 res!551667) b!807543))

(assert (= (and b!807543 res!551661) b!807537))

(assert (= (and b!807537 res!551662) b!807540))

(assert (= (and b!807540 res!551665) b!807546))

(assert (= (and b!807546 res!551669) b!807544))

(assert (= (and b!807544 res!551663) b!807541))

(assert (= (and b!807541 res!551668) b!807542))

(assert (= (and b!807542 res!551659) b!807539))

(assert (= (and b!807539 res!551660) b!807538))

(assert (= (and b!807538 res!551666) b!807536))

(assert (= (and b!807536 res!551664) b!807545))

(declare-fun m!749585 () Bool)

(assert (=> b!807542 m!749585))

(declare-fun m!749587 () Bool)

(assert (=> b!807541 m!749587))

(declare-fun m!749589 () Bool)

(assert (=> b!807546 m!749589))

(declare-fun m!749591 () Bool)

(assert (=> b!807536 m!749591))

(declare-fun m!749593 () Bool)

(assert (=> b!807536 m!749593))

(assert (=> b!807536 m!749593))

(declare-fun m!749595 () Bool)

(assert (=> b!807536 m!749595))

(assert (=> b!807536 m!749593))

(declare-fun m!749597 () Bool)

(assert (=> b!807536 m!749597))

(declare-fun m!749599 () Bool)

(assert (=> b!807539 m!749599))

(declare-fun m!749601 () Bool)

(assert (=> b!807539 m!749601))

(assert (=> b!807537 m!749593))

(assert (=> b!807537 m!749593))

(declare-fun m!749603 () Bool)

(assert (=> b!807537 m!749603))

(declare-fun m!749605 () Bool)

(assert (=> b!807540 m!749605))

(declare-fun m!749607 () Bool)

(assert (=> b!807538 m!749607))

(declare-fun m!749609 () Bool)

(assert (=> b!807538 m!749609))

(declare-fun m!749611 () Bool)

(assert (=> b!807538 m!749611))

(declare-fun m!749613 () Bool)

(assert (=> b!807538 m!749613))

(declare-fun m!749615 () Bool)

(assert (=> start!69224 m!749615))

(declare-fun m!749617 () Bool)

(assert (=> start!69224 m!749617))

(declare-fun m!749619 () Bool)

(assert (=> b!807544 m!749619))

(declare-fun m!749621 () Bool)

(assert (=> b!807545 m!749621))

(push 1)

