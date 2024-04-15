; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69174 () Bool)

(assert start!69174)

(declare-fun b!806791 () Bool)

(declare-fun e!446718 () Bool)

(assert (=> b!806791 (= e!446718 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!361275 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!806791 (= lt!361275 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!806792 () Bool)

(declare-fun res!551055 () Bool)

(declare-fun e!446717 () Bool)

(assert (=> b!806792 (=> (not res!551055) (not e!446717))))

(declare-datatypes ((array!43891 0))(
  ( (array!43892 (arr!21023 (Array (_ BitVec 32) (_ BitVec 64))) (size!21444 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43891)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806792 (= res!551055 (validKeyInArray!0 (select (arr!21023 a!3170) j!153)))))

(declare-fun b!806793 () Bool)

(declare-fun e!446715 () Bool)

(assert (=> b!806793 (= e!446715 e!446718)))

(declare-fun res!551062 () Bool)

(assert (=> b!806793 (=> (not res!551062) (not e!446718))))

(declare-datatypes ((SeekEntryResult!8611 0))(
  ( (MissingZero!8611 (index!36812 (_ BitVec 32))) (Found!8611 (index!36813 (_ BitVec 32))) (Intermediate!8611 (undefined!9423 Bool) (index!36814 (_ BitVec 32)) (x!67634 (_ BitVec 32))) (Undefined!8611) (MissingVacant!8611 (index!36815 (_ BitVec 32))) )
))
(declare-fun lt!361277 () SeekEntryResult!8611)

(declare-fun lt!361276 () SeekEntryResult!8611)

(assert (=> b!806793 (= res!551062 (and (= lt!361277 lt!361276) (= lt!361276 (Found!8611 j!153)) (not (= (select (arr!21023 a!3170) index!1236) (select (arr!21023 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43891 (_ BitVec 32)) SeekEntryResult!8611)

(assert (=> b!806793 (= lt!361276 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21023 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43891 (_ BitVec 32)) SeekEntryResult!8611)

(assert (=> b!806793 (= lt!361277 (seekEntryOrOpen!0 (select (arr!21023 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806794 () Bool)

(declare-fun res!551057 () Bool)

(assert (=> b!806794 (=> (not res!551057) (not e!446717))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!806794 (= res!551057 (validKeyInArray!0 k0!2044))))

(declare-fun b!806795 () Bool)

(declare-fun e!446716 () Bool)

(assert (=> b!806795 (= e!446716 e!446715)))

(declare-fun res!551059 () Bool)

(assert (=> b!806795 (=> (not res!551059) (not e!446715))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361274 () (_ BitVec 64))

(declare-fun lt!361272 () array!43891)

(assert (=> b!806795 (= res!551059 (= (seekEntryOrOpen!0 lt!361274 lt!361272 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361274 lt!361272 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806795 (= lt!361274 (select (store (arr!21023 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806795 (= lt!361272 (array!43892 (store (arr!21023 a!3170) i!1163 k0!2044) (size!21444 a!3170)))))

(declare-fun b!806796 () Bool)

(declare-fun res!551064 () Bool)

(assert (=> b!806796 (=> (not res!551064) (not e!446716))))

(declare-datatypes ((List!15025 0))(
  ( (Nil!15022) (Cons!15021 (h!16150 (_ BitVec 64)) (t!21331 List!15025)) )
))
(declare-fun arrayNoDuplicates!0 (array!43891 (_ BitVec 32) List!15025) Bool)

(assert (=> b!806796 (= res!551064 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15022))))

(declare-fun b!806797 () Bool)

(declare-fun res!551063 () Bool)

(assert (=> b!806797 (=> (not res!551063) (not e!446716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43891 (_ BitVec 32)) Bool)

(assert (=> b!806797 (= res!551063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806798 () Bool)

(declare-fun res!551054 () Bool)

(assert (=> b!806798 (=> (not res!551054) (not e!446717))))

(assert (=> b!806798 (= res!551054 (and (= (size!21444 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21444 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21444 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806799 () Bool)

(declare-fun res!551060 () Bool)

(assert (=> b!806799 (=> (not res!551060) (not e!446716))))

(assert (=> b!806799 (= res!551060 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21444 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21023 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21444 a!3170)) (= (select (arr!21023 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!551058 () Bool)

(assert (=> start!69174 (=> (not res!551058) (not e!446717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69174 (= res!551058 (validMask!0 mask!3266))))

(assert (=> start!69174 e!446717))

(assert (=> start!69174 true))

(declare-fun array_inv!16906 (array!43891) Bool)

(assert (=> start!69174 (array_inv!16906 a!3170)))

(declare-fun b!806800 () Bool)

(declare-fun res!551061 () Bool)

(assert (=> b!806800 (=> (not res!551061) (not e!446717))))

(declare-fun arrayContainsKey!0 (array!43891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806800 (= res!551061 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806801 () Bool)

(assert (=> b!806801 (= e!446717 e!446716)))

(declare-fun res!551056 () Bool)

(assert (=> b!806801 (=> (not res!551056) (not e!446716))))

(declare-fun lt!361273 () SeekEntryResult!8611)

(assert (=> b!806801 (= res!551056 (or (= lt!361273 (MissingZero!8611 i!1163)) (= lt!361273 (MissingVacant!8611 i!1163))))))

(assert (=> b!806801 (= lt!361273 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!69174 res!551058) b!806798))

(assert (= (and b!806798 res!551054) b!806792))

(assert (= (and b!806792 res!551055) b!806794))

(assert (= (and b!806794 res!551057) b!806800))

(assert (= (and b!806800 res!551061) b!806801))

(assert (= (and b!806801 res!551056) b!806797))

(assert (= (and b!806797 res!551063) b!806796))

(assert (= (and b!806796 res!551064) b!806799))

(assert (= (and b!806799 res!551060) b!806795))

(assert (= (and b!806795 res!551059) b!806793))

(assert (= (and b!806793 res!551062) b!806791))

(declare-fun m!748273 () Bool)

(assert (=> start!69174 m!748273))

(declare-fun m!748275 () Bool)

(assert (=> start!69174 m!748275))

(declare-fun m!748277 () Bool)

(assert (=> b!806791 m!748277))

(declare-fun m!748279 () Bool)

(assert (=> b!806799 m!748279))

(declare-fun m!748281 () Bool)

(assert (=> b!806799 m!748281))

(declare-fun m!748283 () Bool)

(assert (=> b!806796 m!748283))

(declare-fun m!748285 () Bool)

(assert (=> b!806795 m!748285))

(declare-fun m!748287 () Bool)

(assert (=> b!806795 m!748287))

(declare-fun m!748289 () Bool)

(assert (=> b!806795 m!748289))

(declare-fun m!748291 () Bool)

(assert (=> b!806795 m!748291))

(declare-fun m!748293 () Bool)

(assert (=> b!806793 m!748293))

(declare-fun m!748295 () Bool)

(assert (=> b!806793 m!748295))

(assert (=> b!806793 m!748295))

(declare-fun m!748297 () Bool)

(assert (=> b!806793 m!748297))

(assert (=> b!806793 m!748295))

(declare-fun m!748299 () Bool)

(assert (=> b!806793 m!748299))

(declare-fun m!748301 () Bool)

(assert (=> b!806800 m!748301))

(assert (=> b!806792 m!748295))

(assert (=> b!806792 m!748295))

(declare-fun m!748303 () Bool)

(assert (=> b!806792 m!748303))

(declare-fun m!748305 () Bool)

(assert (=> b!806797 m!748305))

(declare-fun m!748307 () Bool)

(assert (=> b!806801 m!748307))

(declare-fun m!748309 () Bool)

(assert (=> b!806794 m!748309))

(check-sat (not b!806791) (not b!806801) (not b!806795) (not b!806797) (not start!69174) (not b!806792) (not b!806796) (not b!806793) (not b!806794) (not b!806800))
(check-sat)
