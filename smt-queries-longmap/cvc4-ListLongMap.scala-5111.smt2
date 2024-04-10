; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69330 () Bool)

(assert start!69330)

(declare-fun b!808655 () Bool)

(declare-fun res!552583 () Bool)

(declare-fun e!447650 () Bool)

(assert (=> b!808655 (=> (not res!552583) (not e!447650))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43979 0))(
  ( (array!43980 (arr!21065 (Array (_ BitVec 32) (_ BitVec 64))) (size!21486 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43979)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!808655 (= res!552583 (and (= (size!21486 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21486 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21486 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808656 () Bool)

(declare-fun res!552586 () Bool)

(assert (=> b!808656 (=> (not res!552586) (not e!447650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808656 (= res!552586 (validKeyInArray!0 (select (arr!21065 a!3170) j!153)))))

(declare-fun b!808657 () Bool)

(declare-fun res!552584 () Bool)

(declare-fun e!447647 () Bool)

(assert (=> b!808657 (=> (not res!552584) (not e!447647))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!808657 (= res!552584 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21486 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21065 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21486 a!3170)) (= (select (arr!21065 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808658 () Bool)

(declare-fun res!552588 () Bool)

(assert (=> b!808658 (=> (not res!552588) (not e!447647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43979 (_ BitVec 32)) Bool)

(assert (=> b!808658 (= res!552588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808659 () Bool)

(declare-fun e!447649 () Bool)

(assert (=> b!808659 (= e!447649 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000)))))

(declare-fun lt!362358 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808659 (= lt!362358 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808660 () Bool)

(declare-fun e!447646 () Bool)

(assert (=> b!808660 (= e!447647 e!447646)))

(declare-fun res!552590 () Bool)

(assert (=> b!808660 (=> (not res!552590) (not e!447646))))

(declare-fun lt!362355 () (_ BitVec 64))

(declare-fun lt!362357 () array!43979)

(declare-datatypes ((SeekEntryResult!8656 0))(
  ( (MissingZero!8656 (index!36992 (_ BitVec 32))) (Found!8656 (index!36993 (_ BitVec 32))) (Intermediate!8656 (undefined!9468 Bool) (index!36994 (_ BitVec 32)) (x!67794 (_ BitVec 32))) (Undefined!8656) (MissingVacant!8656 (index!36995 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43979 (_ BitVec 32)) SeekEntryResult!8656)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43979 (_ BitVec 32)) SeekEntryResult!8656)

(assert (=> b!808660 (= res!552590 (= (seekEntryOrOpen!0 lt!362355 lt!362357 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362355 lt!362357 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!808660 (= lt!362355 (select (store (arr!21065 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!808660 (= lt!362357 (array!43980 (store (arr!21065 a!3170) i!1163 k!2044) (size!21486 a!3170)))))

(declare-fun b!808661 () Bool)

(declare-fun res!552585 () Bool)

(assert (=> b!808661 (=> (not res!552585) (not e!447650))))

(assert (=> b!808661 (= res!552585 (validKeyInArray!0 k!2044))))

(declare-fun b!808662 () Bool)

(declare-fun res!552580 () Bool)

(assert (=> b!808662 (=> (not res!552580) (not e!447650))))

(declare-fun arrayContainsKey!0 (array!43979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808662 (= res!552580 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808663 () Bool)

(declare-fun res!552587 () Bool)

(assert (=> b!808663 (=> (not res!552587) (not e!447647))))

(declare-datatypes ((List!15028 0))(
  ( (Nil!15025) (Cons!15024 (h!16153 (_ BitVec 64)) (t!21343 List!15028)) )
))
(declare-fun arrayNoDuplicates!0 (array!43979 (_ BitVec 32) List!15028) Bool)

(assert (=> b!808663 (= res!552587 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15025))))

(declare-fun res!552581 () Bool)

(assert (=> start!69330 (=> (not res!552581) (not e!447650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69330 (= res!552581 (validMask!0 mask!3266))))

(assert (=> start!69330 e!447650))

(assert (=> start!69330 true))

(declare-fun array_inv!16861 (array!43979) Bool)

(assert (=> start!69330 (array_inv!16861 a!3170)))

(declare-fun b!808664 () Bool)

(assert (=> b!808664 (= e!447646 e!447649)))

(declare-fun res!552582 () Bool)

(assert (=> b!808664 (=> (not res!552582) (not e!447649))))

(declare-fun lt!362359 () SeekEntryResult!8656)

(declare-fun lt!362356 () SeekEntryResult!8656)

(assert (=> b!808664 (= res!552582 (and (= lt!362356 lt!362359) (= lt!362359 (Found!8656 j!153)) (not (= (select (arr!21065 a!3170) index!1236) (select (arr!21065 a!3170) j!153)))))))

(assert (=> b!808664 (= lt!362359 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21065 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808664 (= lt!362356 (seekEntryOrOpen!0 (select (arr!21065 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808665 () Bool)

(assert (=> b!808665 (= e!447650 e!447647)))

(declare-fun res!552589 () Bool)

(assert (=> b!808665 (=> (not res!552589) (not e!447647))))

(declare-fun lt!362360 () SeekEntryResult!8656)

(assert (=> b!808665 (= res!552589 (or (= lt!362360 (MissingZero!8656 i!1163)) (= lt!362360 (MissingVacant!8656 i!1163))))))

(assert (=> b!808665 (= lt!362360 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!69330 res!552581) b!808655))

(assert (= (and b!808655 res!552583) b!808656))

(assert (= (and b!808656 res!552586) b!808661))

(assert (= (and b!808661 res!552585) b!808662))

(assert (= (and b!808662 res!552580) b!808665))

(assert (= (and b!808665 res!552589) b!808658))

(assert (= (and b!808658 res!552588) b!808663))

(assert (= (and b!808663 res!552587) b!808657))

(assert (= (and b!808657 res!552584) b!808660))

(assert (= (and b!808660 res!552590) b!808664))

(assert (= (and b!808664 res!552582) b!808659))

(declare-fun m!750801 () Bool)

(assert (=> b!808665 m!750801))

(declare-fun m!750803 () Bool)

(assert (=> b!808660 m!750803))

(declare-fun m!750805 () Bool)

(assert (=> b!808660 m!750805))

(declare-fun m!750807 () Bool)

(assert (=> b!808660 m!750807))

(declare-fun m!750809 () Bool)

(assert (=> b!808660 m!750809))

(declare-fun m!750811 () Bool)

(assert (=> b!808656 m!750811))

(assert (=> b!808656 m!750811))

(declare-fun m!750813 () Bool)

(assert (=> b!808656 m!750813))

(declare-fun m!750815 () Bool)

(assert (=> b!808663 m!750815))

(declare-fun m!750817 () Bool)

(assert (=> b!808659 m!750817))

(declare-fun m!750819 () Bool)

(assert (=> b!808664 m!750819))

(assert (=> b!808664 m!750811))

(assert (=> b!808664 m!750811))

(declare-fun m!750821 () Bool)

(assert (=> b!808664 m!750821))

(assert (=> b!808664 m!750811))

(declare-fun m!750823 () Bool)

(assert (=> b!808664 m!750823))

(declare-fun m!750825 () Bool)

(assert (=> b!808661 m!750825))

(declare-fun m!750827 () Bool)

(assert (=> b!808658 m!750827))

(declare-fun m!750829 () Bool)

(assert (=> b!808657 m!750829))

(declare-fun m!750831 () Bool)

(assert (=> b!808657 m!750831))

(declare-fun m!750833 () Bool)

(assert (=> start!69330 m!750833))

(declare-fun m!750835 () Bool)

(assert (=> start!69330 m!750835))

(declare-fun m!750837 () Bool)

(assert (=> b!808662 m!750837))

(push 1)

(assert (not b!808659))

(assert (not b!808656))

(assert (not b!808662))

