; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69170 () Bool)

(assert start!69170)

(declare-fun b!806636 () Bool)

(declare-fun res!550765 () Bool)

(declare-fun e!446683 () Bool)

(assert (=> b!806636 (=> (not res!550765) (not e!446683))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806636 (= res!550765 (validKeyInArray!0 k!2044))))

(declare-fun b!806637 () Bool)

(declare-fun res!550762 () Bool)

(assert (=> b!806637 (=> (not res!550762) (not e!446683))))

(declare-datatypes ((array!43870 0))(
  ( (array!43871 (arr!21012 (Array (_ BitVec 32) (_ BitVec 64))) (size!21433 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43870)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!806637 (= res!550762 (validKeyInArray!0 (select (arr!21012 a!3170) j!153)))))

(declare-fun b!806638 () Bool)

(declare-fun e!446681 () Bool)

(declare-fun e!446680 () Bool)

(assert (=> b!806638 (= e!446681 e!446680)))

(declare-fun res!550761 () Bool)

(assert (=> b!806638 (=> (not res!550761) (not e!446680))))

(declare-datatypes ((SeekEntryResult!8603 0))(
  ( (MissingZero!8603 (index!36780 (_ BitVec 32))) (Found!8603 (index!36781 (_ BitVec 32))) (Intermediate!8603 (undefined!9415 Bool) (index!36782 (_ BitVec 32)) (x!67599 (_ BitVec 32))) (Undefined!8603) (MissingVacant!8603 (index!36783 (_ BitVec 32))) )
))
(declare-fun lt!361263 () SeekEntryResult!8603)

(declare-fun lt!361267 () SeekEntryResult!8603)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806638 (= res!550761 (and (= lt!361263 lt!361267) (= lt!361267 (Found!8603 j!153)) (= (select (arr!21012 a!3170) index!1236) (select (arr!21012 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43870 (_ BitVec 32)) SeekEntryResult!8603)

(assert (=> b!806638 (= lt!361267 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21012 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43870 (_ BitVec 32)) SeekEntryResult!8603)

(assert (=> b!806638 (= lt!361263 (seekEntryOrOpen!0 (select (arr!21012 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806640 () Bool)

(declare-fun res!550760 () Bool)

(declare-fun e!446682 () Bool)

(assert (=> b!806640 (=> (not res!550760) (not e!446682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43870 (_ BitVec 32)) Bool)

(assert (=> b!806640 (= res!550760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806641 () Bool)

(declare-fun res!550769 () Bool)

(assert (=> b!806641 (=> (not res!550769) (not e!446683))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806641 (= res!550769 (and (= (size!21433 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21433 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21433 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806642 () Bool)

(declare-fun res!550763 () Bool)

(assert (=> b!806642 (=> (not res!550763) (not e!446682))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!806642 (= res!550763 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21433 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21012 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21433 a!3170)) (= (select (arr!21012 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806643 () Bool)

(assert (=> b!806643 (= e!446680 (not true))))

(declare-fun lt!361265 () SeekEntryResult!8603)

(assert (=> b!806643 (= lt!361265 (Found!8603 index!1236))))

(declare-fun b!806644 () Bool)

(declare-fun res!550759 () Bool)

(assert (=> b!806644 (=> (not res!550759) (not e!446682))))

(declare-datatypes ((List!14975 0))(
  ( (Nil!14972) (Cons!14971 (h!16100 (_ BitVec 64)) (t!21290 List!14975)) )
))
(declare-fun arrayNoDuplicates!0 (array!43870 (_ BitVec 32) List!14975) Bool)

(assert (=> b!806644 (= res!550759 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14972))))

(declare-fun b!806639 () Bool)

(assert (=> b!806639 (= e!446682 e!446681)))

(declare-fun res!550767 () Bool)

(assert (=> b!806639 (=> (not res!550767) (not e!446681))))

(declare-fun lt!361264 () SeekEntryResult!8603)

(assert (=> b!806639 (= res!550767 (= lt!361264 lt!361265))))

(declare-fun lt!361262 () array!43870)

(declare-fun lt!361268 () (_ BitVec 64))

(assert (=> b!806639 (= lt!361265 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361268 lt!361262 mask!3266))))

(assert (=> b!806639 (= lt!361264 (seekEntryOrOpen!0 lt!361268 lt!361262 mask!3266))))

(assert (=> b!806639 (= lt!361268 (select (store (arr!21012 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!806639 (= lt!361262 (array!43871 (store (arr!21012 a!3170) i!1163 k!2044) (size!21433 a!3170)))))

(declare-fun res!550768 () Bool)

(assert (=> start!69170 (=> (not res!550768) (not e!446683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69170 (= res!550768 (validMask!0 mask!3266))))

(assert (=> start!69170 e!446683))

(assert (=> start!69170 true))

(declare-fun array_inv!16808 (array!43870) Bool)

(assert (=> start!69170 (array_inv!16808 a!3170)))

(declare-fun b!806645 () Bool)

(assert (=> b!806645 (= e!446683 e!446682)))

(declare-fun res!550766 () Bool)

(assert (=> b!806645 (=> (not res!550766) (not e!446682))))

(declare-fun lt!361266 () SeekEntryResult!8603)

(assert (=> b!806645 (= res!550766 (or (= lt!361266 (MissingZero!8603 i!1163)) (= lt!361266 (MissingVacant!8603 i!1163))))))

(assert (=> b!806645 (= lt!361266 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!806646 () Bool)

(declare-fun res!550764 () Bool)

(assert (=> b!806646 (=> (not res!550764) (not e!446683))))

(declare-fun arrayContainsKey!0 (array!43870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806646 (= res!550764 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69170 res!550768) b!806641))

(assert (= (and b!806641 res!550769) b!806637))

(assert (= (and b!806637 res!550762) b!806636))

(assert (= (and b!806636 res!550765) b!806646))

(assert (= (and b!806646 res!550764) b!806645))

(assert (= (and b!806645 res!550766) b!806640))

(assert (= (and b!806640 res!550760) b!806644))

(assert (= (and b!806644 res!550759) b!806642))

(assert (= (and b!806642 res!550763) b!806639))

(assert (= (and b!806639 res!550767) b!806638))

(assert (= (and b!806638 res!550761) b!806643))

(declare-fun m!748577 () Bool)

(assert (=> b!806644 m!748577))

(declare-fun m!748579 () Bool)

(assert (=> b!806636 m!748579))

(declare-fun m!748581 () Bool)

(assert (=> b!806645 m!748581))

(declare-fun m!748583 () Bool)

(assert (=> b!806639 m!748583))

(declare-fun m!748585 () Bool)

(assert (=> b!806639 m!748585))

(declare-fun m!748587 () Bool)

(assert (=> b!806639 m!748587))

(declare-fun m!748589 () Bool)

(assert (=> b!806639 m!748589))

(declare-fun m!748591 () Bool)

(assert (=> start!69170 m!748591))

(declare-fun m!748593 () Bool)

(assert (=> start!69170 m!748593))

(declare-fun m!748595 () Bool)

(assert (=> b!806637 m!748595))

(assert (=> b!806637 m!748595))

(declare-fun m!748597 () Bool)

(assert (=> b!806637 m!748597))

(declare-fun m!748599 () Bool)

(assert (=> b!806646 m!748599))

(declare-fun m!748601 () Bool)

(assert (=> b!806640 m!748601))

(declare-fun m!748603 () Bool)

(assert (=> b!806638 m!748603))

(assert (=> b!806638 m!748595))

(assert (=> b!806638 m!748595))

(declare-fun m!748605 () Bool)

(assert (=> b!806638 m!748605))

(assert (=> b!806638 m!748595))

(declare-fun m!748607 () Bool)

(assert (=> b!806638 m!748607))

(declare-fun m!748609 () Bool)

(assert (=> b!806642 m!748609))

(declare-fun m!748611 () Bool)

(assert (=> b!806642 m!748611))

(push 1)

