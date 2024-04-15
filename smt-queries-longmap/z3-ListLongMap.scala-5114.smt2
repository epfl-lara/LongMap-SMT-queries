; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69378 () Bool)

(assert start!69378)

(declare-fun b!808897 () Bool)

(declare-fun res!552768 () Bool)

(declare-fun e!447761 () Bool)

(assert (=> b!808897 (=> (not res!552768) (not e!447761))))

(declare-datatypes ((array!43993 0))(
  ( (array!43994 (arr!21071 (Array (_ BitVec 32) (_ BitVec 64))) (size!21492 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43993)

(declare-datatypes ((List!15073 0))(
  ( (Nil!15070) (Cons!15069 (h!16198 (_ BitVec 64)) (t!21379 List!15073)) )
))
(declare-fun arrayNoDuplicates!0 (array!43993 (_ BitVec 32) List!15073) Bool)

(assert (=> b!808897 (= res!552768 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15070))))

(declare-fun b!808898 () Bool)

(declare-fun res!552767 () Bool)

(assert (=> b!808898 (=> (not res!552767) (not e!447761))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43993 (_ BitVec 32)) Bool)

(assert (=> b!808898 (= res!552767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808899 () Bool)

(declare-fun e!447760 () Bool)

(declare-fun e!447762 () Bool)

(assert (=> b!808899 (= e!447760 e!447762)))

(declare-fun res!552770 () Bool)

(assert (=> b!808899 (=> (not res!552770) (not e!447762))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8659 0))(
  ( (MissingZero!8659 (index!37004 (_ BitVec 32))) (Found!8659 (index!37005 (_ BitVec 32))) (Intermediate!8659 (undefined!9471 Bool) (index!37006 (_ BitVec 32)) (x!67822 (_ BitVec 32))) (Undefined!8659) (MissingVacant!8659 (index!37007 (_ BitVec 32))) )
))
(declare-fun lt!362346 () SeekEntryResult!8659)

(declare-fun lt!362350 () SeekEntryResult!8659)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!808899 (= res!552770 (and (= lt!362346 lt!362350) (= lt!362350 (Found!8659 j!153)) (not (= (select (arr!21071 a!3170) index!1236) (select (arr!21071 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43993 (_ BitVec 32)) SeekEntryResult!8659)

(assert (=> b!808899 (= lt!362350 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21071 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43993 (_ BitVec 32)) SeekEntryResult!8659)

(assert (=> b!808899 (= lt!362346 (seekEntryOrOpen!0 (select (arr!21071 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808900 () Bool)

(declare-fun res!552771 () Bool)

(declare-fun e!447759 () Bool)

(assert (=> b!808900 (=> (not res!552771) (not e!447759))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808900 (= res!552771 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808901 () Bool)

(assert (=> b!808901 (= e!447759 e!447761)))

(declare-fun res!552766 () Bool)

(assert (=> b!808901 (=> (not res!552766) (not e!447761))))

(declare-fun lt!362348 () SeekEntryResult!8659)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!808901 (= res!552766 (or (= lt!362348 (MissingZero!8659 i!1163)) (= lt!362348 (MissingVacant!8659 i!1163))))))

(assert (=> b!808901 (= lt!362348 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!808902 () Bool)

(declare-fun res!552769 () Bool)

(assert (=> b!808902 (=> (not res!552769) (not e!447759))))

(assert (=> b!808902 (= res!552769 (and (= (size!21492 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21492 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21492 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808903 () Bool)

(declare-fun res!552765 () Bool)

(assert (=> b!808903 (=> (not res!552765) (not e!447761))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!808903 (= res!552765 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21492 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21071 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21492 a!3170)) (= (select (arr!21071 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808904 () Bool)

(declare-fun res!552774 () Bool)

(assert (=> b!808904 (=> (not res!552774) (not e!447759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808904 (= res!552774 (validKeyInArray!0 (select (arr!21071 a!3170) j!153)))))

(declare-fun b!808905 () Bool)

(declare-fun res!552772 () Bool)

(assert (=> b!808905 (=> (not res!552772) (not e!447759))))

(assert (=> b!808905 (= res!552772 (validKeyInArray!0 k0!2044))))

(declare-fun res!552764 () Bool)

(assert (=> start!69378 (=> (not res!552764) (not e!447759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69378 (= res!552764 (validMask!0 mask!3266))))

(assert (=> start!69378 e!447759))

(assert (=> start!69378 true))

(declare-fun array_inv!16954 (array!43993) Bool)

(assert (=> start!69378 (array_inv!16954 a!3170)))

(declare-fun b!808906 () Bool)

(assert (=> b!808906 (= e!447762 false)))

(declare-fun lt!362351 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808906 (= lt!362351 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808907 () Bool)

(assert (=> b!808907 (= e!447761 e!447760)))

(declare-fun res!552773 () Bool)

(assert (=> b!808907 (=> (not res!552773) (not e!447760))))

(declare-fun lt!362347 () array!43993)

(declare-fun lt!362349 () (_ BitVec 64))

(assert (=> b!808907 (= res!552773 (= (seekEntryOrOpen!0 lt!362349 lt!362347 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362349 lt!362347 mask!3266)))))

(assert (=> b!808907 (= lt!362349 (select (store (arr!21071 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808907 (= lt!362347 (array!43994 (store (arr!21071 a!3170) i!1163 k0!2044) (size!21492 a!3170)))))

(assert (= (and start!69378 res!552764) b!808902))

(assert (= (and b!808902 res!552769) b!808904))

(assert (= (and b!808904 res!552774) b!808905))

(assert (= (and b!808905 res!552772) b!808900))

(assert (= (and b!808900 res!552771) b!808901))

(assert (= (and b!808901 res!552766) b!808898))

(assert (= (and b!808898 res!552767) b!808897))

(assert (= (and b!808897 res!552768) b!808903))

(assert (= (and b!808903 res!552765) b!808907))

(assert (= (and b!808907 res!552773) b!808899))

(assert (= (and b!808899 res!552770) b!808906))

(declare-fun m!750553 () Bool)

(assert (=> b!808906 m!750553))

(declare-fun m!750555 () Bool)

(assert (=> b!808905 m!750555))

(declare-fun m!750557 () Bool)

(assert (=> b!808898 m!750557))

(declare-fun m!750559 () Bool)

(assert (=> start!69378 m!750559))

(declare-fun m!750561 () Bool)

(assert (=> start!69378 m!750561))

(declare-fun m!750563 () Bool)

(assert (=> b!808897 m!750563))

(declare-fun m!750565 () Bool)

(assert (=> b!808907 m!750565))

(declare-fun m!750567 () Bool)

(assert (=> b!808907 m!750567))

(declare-fun m!750569 () Bool)

(assert (=> b!808907 m!750569))

(declare-fun m!750571 () Bool)

(assert (=> b!808907 m!750571))

(declare-fun m!750573 () Bool)

(assert (=> b!808903 m!750573))

(declare-fun m!750575 () Bool)

(assert (=> b!808903 m!750575))

(declare-fun m!750577 () Bool)

(assert (=> b!808904 m!750577))

(assert (=> b!808904 m!750577))

(declare-fun m!750579 () Bool)

(assert (=> b!808904 m!750579))

(declare-fun m!750581 () Bool)

(assert (=> b!808900 m!750581))

(declare-fun m!750583 () Bool)

(assert (=> b!808901 m!750583))

(declare-fun m!750585 () Bool)

(assert (=> b!808899 m!750585))

(assert (=> b!808899 m!750577))

(assert (=> b!808899 m!750577))

(declare-fun m!750587 () Bool)

(assert (=> b!808899 m!750587))

(assert (=> b!808899 m!750577))

(declare-fun m!750589 () Bool)

(assert (=> b!808899 m!750589))

(check-sat (not b!808899) (not b!808897) (not b!808904) (not b!808907) (not b!808905) (not b!808906) (not start!69378) (not b!808898) (not b!808900) (not b!808901))
(check-sat)
