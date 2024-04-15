; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68066 () Bool)

(assert start!68066)

(declare-fun b!791772 () Bool)

(declare-fun res!536650 () Bool)

(declare-fun e!439927 () Bool)

(assert (=> b!791772 (=> (not res!536650) (not e!439927))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791772 (= res!536650 (validKeyInArray!0 k0!2044))))

(declare-fun b!791773 () Bool)

(declare-fun res!536646 () Bool)

(assert (=> b!791773 (=> (not res!536646) (not e!439927))))

(declare-datatypes ((array!42988 0))(
  ( (array!42989 (arr!20579 (Array (_ BitVec 32) (_ BitVec 64))) (size!21000 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42988)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791773 (= res!536646 (validKeyInArray!0 (select (arr!20579 a!3170) j!153)))))

(declare-fun b!791774 () Bool)

(declare-fun e!439925 () Bool)

(assert (=> b!791774 (= e!439927 e!439925)))

(declare-fun res!536649 () Bool)

(assert (=> b!791774 (=> (not res!536649) (not e!439925))))

(declare-datatypes ((SeekEntryResult!8167 0))(
  ( (MissingZero!8167 (index!35036 (_ BitVec 32))) (Found!8167 (index!35037 (_ BitVec 32))) (Intermediate!8167 (undefined!8979 Bool) (index!35038 (_ BitVec 32)) (x!66000 (_ BitVec 32))) (Undefined!8167) (MissingVacant!8167 (index!35039 (_ BitVec 32))) )
))
(declare-fun lt!353111 () SeekEntryResult!8167)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!791774 (= res!536649 (or (= lt!353111 (MissingZero!8167 i!1163)) (= lt!353111 (MissingVacant!8167 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42988 (_ BitVec 32)) SeekEntryResult!8167)

(assert (=> b!791774 (= lt!353111 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!791775 () Bool)

(assert (=> b!791775 (= e!439925 (bvsgt #b00000000000000000000000000000000 (size!21000 a!3170)))))

(declare-fun b!791776 () Bool)

(declare-fun res!536647 () Bool)

(assert (=> b!791776 (=> (not res!536647) (not e!439927))))

(declare-fun arrayContainsKey!0 (array!42988 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791776 (= res!536647 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791777 () Bool)

(declare-fun res!536652 () Bool)

(assert (=> b!791777 (=> (not res!536652) (not e!439927))))

(assert (=> b!791777 (= res!536652 (and (= (size!21000 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21000 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21000 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!536648 () Bool)

(assert (=> start!68066 (=> (not res!536648) (not e!439927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68066 (= res!536648 (validMask!0 mask!3266))))

(assert (=> start!68066 e!439927))

(assert (=> start!68066 true))

(declare-fun array_inv!16462 (array!42988) Bool)

(assert (=> start!68066 (array_inv!16462 a!3170)))

(declare-fun b!791771 () Bool)

(declare-fun res!536651 () Bool)

(assert (=> b!791771 (=> (not res!536651) (not e!439925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42988 (_ BitVec 32)) Bool)

(assert (=> b!791771 (= res!536651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68066 res!536648) b!791777))

(assert (= (and b!791777 res!536652) b!791773))

(assert (= (and b!791773 res!536646) b!791772))

(assert (= (and b!791772 res!536650) b!791776))

(assert (= (and b!791776 res!536647) b!791774))

(assert (= (and b!791774 res!536649) b!791771))

(assert (= (and b!791771 res!536651) b!791775))

(declare-fun m!731955 () Bool)

(assert (=> b!791774 m!731955))

(declare-fun m!731957 () Bool)

(assert (=> b!791776 m!731957))

(declare-fun m!731959 () Bool)

(assert (=> b!791773 m!731959))

(assert (=> b!791773 m!731959))

(declare-fun m!731961 () Bool)

(assert (=> b!791773 m!731961))

(declare-fun m!731963 () Bool)

(assert (=> b!791772 m!731963))

(declare-fun m!731965 () Bool)

(assert (=> start!68066 m!731965))

(declare-fun m!731967 () Bool)

(assert (=> start!68066 m!731967))

(declare-fun m!731969 () Bool)

(assert (=> b!791771 m!731969))

(check-sat (not b!791773) (not start!68066) (not b!791774) (not b!791771) (not b!791776) (not b!791772))
(check-sat)
