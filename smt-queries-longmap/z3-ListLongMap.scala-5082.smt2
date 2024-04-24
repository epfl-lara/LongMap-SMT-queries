; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69170 () Bool)

(assert start!69170)

(declare-fun b!805857 () Bool)

(declare-fun res!549837 () Bool)

(declare-fun e!446433 () Bool)

(assert (=> b!805857 (=> (not res!549837) (not e!446433))))

(declare-datatypes ((array!43792 0))(
  ( (array!43793 (arr!20971 (Array (_ BitVec 32) (_ BitVec 64))) (size!21391 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43792)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43792 (_ BitVec 32)) Bool)

(assert (=> b!805857 (= res!549837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805858 () Bool)

(declare-fun e!446431 () Bool)

(assert (=> b!805858 (= e!446431 e!446433)))

(declare-fun res!549836 () Bool)

(assert (=> b!805858 (=> (not res!549836) (not e!446433))))

(declare-datatypes ((SeekEntryResult!8518 0))(
  ( (MissingZero!8518 (index!36440 (_ BitVec 32))) (Found!8518 (index!36441 (_ BitVec 32))) (Intermediate!8518 (undefined!9330 Bool) (index!36442 (_ BitVec 32)) (x!67426 (_ BitVec 32))) (Undefined!8518) (MissingVacant!8518 (index!36443 (_ BitVec 32))) )
))
(declare-fun lt!360750 () SeekEntryResult!8518)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805858 (= res!549836 (or (= lt!360750 (MissingZero!8518 i!1163)) (= lt!360750 (MissingVacant!8518 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43792 (_ BitVec 32)) SeekEntryResult!8518)

(assert (=> b!805858 (= lt!360750 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805859 () Bool)

(declare-fun e!446432 () Bool)

(assert (=> b!805859 (= e!446433 e!446432)))

(declare-fun res!549834 () Bool)

(assert (=> b!805859 (=> (not res!549834) (not e!446432))))

(declare-fun lt!360748 () array!43792)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360752 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43792 (_ BitVec 32)) SeekEntryResult!8518)

(assert (=> b!805859 (= res!549834 (= (seekEntryOrOpen!0 lt!360752 lt!360748 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360752 lt!360748 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!805859 (= lt!360752 (select (store (arr!20971 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805859 (= lt!360748 (array!43793 (store (arr!20971 a!3170) i!1163 k0!2044) (size!21391 a!3170)))))

(declare-fun b!805860 () Bool)

(declare-fun res!549833 () Bool)

(assert (=> b!805860 (=> (not res!549833) (not e!446431))))

(assert (=> b!805860 (= res!549833 (and (= (size!21391 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21391 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21391 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805861 () Bool)

(declare-fun res!549832 () Bool)

(assert (=> b!805861 (=> (not res!549832) (not e!446433))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!805861 (= res!549832 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21391 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20971 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21391 a!3170)) (= (select (arr!20971 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!549835 () Bool)

(assert (=> start!69170 (=> (not res!549835) (not e!446431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69170 (= res!549835 (validMask!0 mask!3266))))

(assert (=> start!69170 e!446431))

(assert (=> start!69170 true))

(declare-fun array_inv!16830 (array!43792) Bool)

(assert (=> start!69170 (array_inv!16830 a!3170)))

(declare-fun b!805862 () Bool)

(declare-fun res!549828 () Bool)

(assert (=> b!805862 (=> (not res!549828) (not e!446431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805862 (= res!549828 (validKeyInArray!0 k0!2044))))

(declare-fun b!805863 () Bool)

(assert (=> b!805863 (= e!446432 false)))

(declare-fun lt!360751 () SeekEntryResult!8518)

(assert (=> b!805863 (= lt!360751 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20971 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360749 () SeekEntryResult!8518)

(assert (=> b!805863 (= lt!360749 (seekEntryOrOpen!0 (select (arr!20971 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805864 () Bool)

(declare-fun res!549829 () Bool)

(assert (=> b!805864 (=> (not res!549829) (not e!446433))))

(declare-datatypes ((List!14841 0))(
  ( (Nil!14838) (Cons!14837 (h!15972 (_ BitVec 64)) (t!21148 List!14841)) )
))
(declare-fun arrayNoDuplicates!0 (array!43792 (_ BitVec 32) List!14841) Bool)

(assert (=> b!805864 (= res!549829 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14838))))

(declare-fun b!805865 () Bool)

(declare-fun res!549831 () Bool)

(assert (=> b!805865 (=> (not res!549831) (not e!446431))))

(declare-fun arrayContainsKey!0 (array!43792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805865 (= res!549831 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805866 () Bool)

(declare-fun res!549830 () Bool)

(assert (=> b!805866 (=> (not res!549830) (not e!446431))))

(assert (=> b!805866 (= res!549830 (validKeyInArray!0 (select (arr!20971 a!3170) j!153)))))

(assert (= (and start!69170 res!549835) b!805860))

(assert (= (and b!805860 res!549833) b!805866))

(assert (= (and b!805866 res!549830) b!805862))

(assert (= (and b!805862 res!549828) b!805865))

(assert (= (and b!805865 res!549831) b!805858))

(assert (= (and b!805858 res!549836) b!805857))

(assert (= (and b!805857 res!549837) b!805864))

(assert (= (and b!805864 res!549829) b!805861))

(assert (= (and b!805861 res!549832) b!805859))

(assert (= (and b!805859 res!549834) b!805863))

(declare-fun m!748111 () Bool)

(assert (=> b!805861 m!748111))

(declare-fun m!748113 () Bool)

(assert (=> b!805861 m!748113))

(declare-fun m!748115 () Bool)

(assert (=> b!805864 m!748115))

(declare-fun m!748117 () Bool)

(assert (=> b!805857 m!748117))

(declare-fun m!748119 () Bool)

(assert (=> b!805858 m!748119))

(declare-fun m!748121 () Bool)

(assert (=> b!805866 m!748121))

(assert (=> b!805866 m!748121))

(declare-fun m!748123 () Bool)

(assert (=> b!805866 m!748123))

(declare-fun m!748125 () Bool)

(assert (=> start!69170 m!748125))

(declare-fun m!748127 () Bool)

(assert (=> start!69170 m!748127))

(assert (=> b!805863 m!748121))

(assert (=> b!805863 m!748121))

(declare-fun m!748129 () Bool)

(assert (=> b!805863 m!748129))

(assert (=> b!805863 m!748121))

(declare-fun m!748131 () Bool)

(assert (=> b!805863 m!748131))

(declare-fun m!748133 () Bool)

(assert (=> b!805862 m!748133))

(declare-fun m!748135 () Bool)

(assert (=> b!805865 m!748135))

(declare-fun m!748137 () Bool)

(assert (=> b!805859 m!748137))

(declare-fun m!748139 () Bool)

(assert (=> b!805859 m!748139))

(declare-fun m!748141 () Bool)

(assert (=> b!805859 m!748141))

(declare-fun m!748143 () Bool)

(assert (=> b!805859 m!748143))

(check-sat (not b!805857) (not b!805865) (not b!805858) (not b!805862) (not b!805864) (not start!69170) (not b!805859) (not b!805863) (not b!805866))
(check-sat)
