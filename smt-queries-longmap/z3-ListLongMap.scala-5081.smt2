; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69164 () Bool)

(assert start!69164)

(declare-fun b!805767 () Bool)

(declare-fun res!549747 () Bool)

(declare-fun e!446397 () Bool)

(assert (=> b!805767 (=> (not res!549747) (not e!446397))))

(declare-datatypes ((array!43786 0))(
  ( (array!43787 (arr!20968 (Array (_ BitVec 32) (_ BitVec 64))) (size!21388 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43786)

(declare-datatypes ((List!14838 0))(
  ( (Nil!14835) (Cons!14834 (h!15969 (_ BitVec 64)) (t!21145 List!14838)) )
))
(declare-fun arrayNoDuplicates!0 (array!43786 (_ BitVec 32) List!14838) Bool)

(assert (=> b!805767 (= res!549747 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14835))))

(declare-fun b!805768 () Bool)

(declare-fun e!446398 () Bool)

(assert (=> b!805768 (= e!446397 e!446398)))

(declare-fun res!549743 () Bool)

(assert (=> b!805768 (=> (not res!549743) (not e!446398))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!360704 () array!43786)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!360706 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8515 0))(
  ( (MissingZero!8515 (index!36428 (_ BitVec 32))) (Found!8515 (index!36429 (_ BitVec 32))) (Intermediate!8515 (undefined!9327 Bool) (index!36430 (_ BitVec 32)) (x!67415 (_ BitVec 32))) (Undefined!8515) (MissingVacant!8515 (index!36431 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43786 (_ BitVec 32)) SeekEntryResult!8515)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43786 (_ BitVec 32)) SeekEntryResult!8515)

(assert (=> b!805768 (= res!549743 (= (seekEntryOrOpen!0 lt!360706 lt!360704 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360706 lt!360704 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!805768 (= lt!360706 (select (store (arr!20968 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805768 (= lt!360704 (array!43787 (store (arr!20968 a!3170) i!1163 k0!2044) (size!21388 a!3170)))))

(declare-fun b!805769 () Bool)

(declare-fun res!549741 () Bool)

(declare-fun e!446395 () Bool)

(assert (=> b!805769 (=> (not res!549741) (not e!446395))))

(declare-fun arrayContainsKey!0 (array!43786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805769 (= res!549741 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805770 () Bool)

(declare-fun res!549745 () Bool)

(assert (=> b!805770 (=> (not res!549745) (not e!446395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805770 (= res!549745 (validKeyInArray!0 k0!2044))))

(declare-fun b!805771 () Bool)

(assert (=> b!805771 (= e!446395 e!446397)))

(declare-fun res!549740 () Bool)

(assert (=> b!805771 (=> (not res!549740) (not e!446397))))

(declare-fun lt!360707 () SeekEntryResult!8515)

(assert (=> b!805771 (= res!549740 (or (= lt!360707 (MissingZero!8515 i!1163)) (= lt!360707 (MissingVacant!8515 i!1163))))))

(assert (=> b!805771 (= lt!360707 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!549738 () Bool)

(assert (=> start!69164 (=> (not res!549738) (not e!446395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69164 (= res!549738 (validMask!0 mask!3266))))

(assert (=> start!69164 e!446395))

(assert (=> start!69164 true))

(declare-fun array_inv!16827 (array!43786) Bool)

(assert (=> start!69164 (array_inv!16827 a!3170)))

(declare-fun b!805772 () Bool)

(declare-fun res!549746 () Bool)

(assert (=> b!805772 (=> (not res!549746) (not e!446397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43786 (_ BitVec 32)) Bool)

(assert (=> b!805772 (= res!549746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805773 () Bool)

(declare-fun res!549744 () Bool)

(assert (=> b!805773 (=> (not res!549744) (not e!446395))))

(assert (=> b!805773 (= res!549744 (and (= (size!21388 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21388 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21388 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805774 () Bool)

(assert (=> b!805774 (= e!446398 false)))

(declare-fun lt!360705 () SeekEntryResult!8515)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!805774 (= lt!360705 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20968 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360703 () SeekEntryResult!8515)

(assert (=> b!805774 (= lt!360703 (seekEntryOrOpen!0 (select (arr!20968 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805775 () Bool)

(declare-fun res!549742 () Bool)

(assert (=> b!805775 (=> (not res!549742) (not e!446397))))

(assert (=> b!805775 (= res!549742 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21388 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20968 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21388 a!3170)) (= (select (arr!20968 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805776 () Bool)

(declare-fun res!549739 () Bool)

(assert (=> b!805776 (=> (not res!549739) (not e!446395))))

(assert (=> b!805776 (= res!549739 (validKeyInArray!0 (select (arr!20968 a!3170) j!153)))))

(assert (= (and start!69164 res!549738) b!805773))

(assert (= (and b!805773 res!549744) b!805776))

(assert (= (and b!805776 res!549739) b!805770))

(assert (= (and b!805770 res!549745) b!805769))

(assert (= (and b!805769 res!549741) b!805771))

(assert (= (and b!805771 res!549740) b!805772))

(assert (= (and b!805772 res!549746) b!805767))

(assert (= (and b!805767 res!549747) b!805775))

(assert (= (and b!805775 res!549742) b!805768))

(assert (= (and b!805768 res!549743) b!805774))

(declare-fun m!748009 () Bool)

(assert (=> b!805776 m!748009))

(assert (=> b!805776 m!748009))

(declare-fun m!748011 () Bool)

(assert (=> b!805776 m!748011))

(declare-fun m!748013 () Bool)

(assert (=> b!805769 m!748013))

(declare-fun m!748015 () Bool)

(assert (=> b!805770 m!748015))

(declare-fun m!748017 () Bool)

(assert (=> b!805775 m!748017))

(declare-fun m!748019 () Bool)

(assert (=> b!805775 m!748019))

(declare-fun m!748021 () Bool)

(assert (=> start!69164 m!748021))

(declare-fun m!748023 () Bool)

(assert (=> start!69164 m!748023))

(declare-fun m!748025 () Bool)

(assert (=> b!805767 m!748025))

(declare-fun m!748027 () Bool)

(assert (=> b!805771 m!748027))

(declare-fun m!748029 () Bool)

(assert (=> b!805768 m!748029))

(declare-fun m!748031 () Bool)

(assert (=> b!805768 m!748031))

(declare-fun m!748033 () Bool)

(assert (=> b!805768 m!748033))

(declare-fun m!748035 () Bool)

(assert (=> b!805768 m!748035))

(declare-fun m!748037 () Bool)

(assert (=> b!805772 m!748037))

(assert (=> b!805774 m!748009))

(assert (=> b!805774 m!748009))

(declare-fun m!748039 () Bool)

(assert (=> b!805774 m!748039))

(assert (=> b!805774 m!748009))

(declare-fun m!748041 () Bool)

(assert (=> b!805774 m!748041))

(check-sat (not b!805771) (not b!805776) (not b!805770) (not b!805769) (not b!805772) (not start!69164) (not b!805768) (not b!805774) (not b!805767))
(check-sat)
