; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69178 () Bool)

(assert start!69178)

(declare-fun b!806768 () Bool)

(declare-fun e!446742 () Bool)

(declare-fun e!446741 () Bool)

(assert (=> b!806768 (= e!446742 e!446741)))

(declare-fun res!550893 () Bool)

(assert (=> b!806768 (=> (not res!550893) (not e!446741))))

(declare-datatypes ((SeekEntryResult!8607 0))(
  ( (MissingZero!8607 (index!36796 (_ BitVec 32))) (Found!8607 (index!36797 (_ BitVec 32))) (Intermediate!8607 (undefined!9419 Bool) (index!36798 (_ BitVec 32)) (x!67611 (_ BitVec 32))) (Undefined!8607) (MissingVacant!8607 (index!36799 (_ BitVec 32))) )
))
(declare-fun lt!361350 () SeekEntryResult!8607)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806768 (= res!550893 (or (= lt!361350 (MissingZero!8607 i!1163)) (= lt!361350 (MissingVacant!8607 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43878 0))(
  ( (array!43879 (arr!21016 (Array (_ BitVec 32) (_ BitVec 64))) (size!21437 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43878)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43878 (_ BitVec 32)) SeekEntryResult!8607)

(assert (=> b!806768 (= lt!361350 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!550900 () Bool)

(assert (=> start!69178 (=> (not res!550900) (not e!446742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69178 (= res!550900 (validMask!0 mask!3266))))

(assert (=> start!69178 e!446742))

(assert (=> start!69178 true))

(declare-fun array_inv!16812 (array!43878) Bool)

(assert (=> start!69178 (array_inv!16812 a!3170)))

(declare-fun b!806769 () Bool)

(declare-fun res!550892 () Bool)

(assert (=> b!806769 (=> (not res!550892) (not e!446742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806769 (= res!550892 (validKeyInArray!0 k0!2044))))

(declare-fun b!806770 () Bool)

(declare-fun e!446743 () Bool)

(declare-fun e!446744 () Bool)

(assert (=> b!806770 (= e!446743 e!446744)))

(declare-fun res!550891 () Bool)

(assert (=> b!806770 (=> (not res!550891) (not e!446744))))

(declare-fun lt!361349 () SeekEntryResult!8607)

(declare-fun lt!361347 () SeekEntryResult!8607)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806770 (= res!550891 (and (= lt!361347 lt!361349) (= lt!361349 (Found!8607 j!153)) (= (select (arr!21016 a!3170) index!1236) (select (arr!21016 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43878 (_ BitVec 32)) SeekEntryResult!8607)

(assert (=> b!806770 (= lt!361349 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21016 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806770 (= lt!361347 (seekEntryOrOpen!0 (select (arr!21016 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806771 () Bool)

(assert (=> b!806771 (= e!446744 (not true))))

(declare-fun lt!361351 () SeekEntryResult!8607)

(assert (=> b!806771 (= lt!361351 (Found!8607 index!1236))))

(declare-fun b!806772 () Bool)

(declare-fun res!550897 () Bool)

(assert (=> b!806772 (=> (not res!550897) (not e!446742))))

(declare-fun arrayContainsKey!0 (array!43878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806772 (= res!550897 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806773 () Bool)

(declare-fun res!550901 () Bool)

(assert (=> b!806773 (=> (not res!550901) (not e!446742))))

(assert (=> b!806773 (= res!550901 (and (= (size!21437 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21437 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21437 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806774 () Bool)

(declare-fun res!550895 () Bool)

(assert (=> b!806774 (=> (not res!550895) (not e!446741))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!806774 (= res!550895 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21437 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21016 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21437 a!3170)) (= (select (arr!21016 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806775 () Bool)

(declare-fun res!550894 () Bool)

(assert (=> b!806775 (=> (not res!550894) (not e!446742))))

(assert (=> b!806775 (= res!550894 (validKeyInArray!0 (select (arr!21016 a!3170) j!153)))))

(declare-fun b!806776 () Bool)

(declare-fun res!550898 () Bool)

(assert (=> b!806776 (=> (not res!550898) (not e!446741))))

(declare-datatypes ((List!14979 0))(
  ( (Nil!14976) (Cons!14975 (h!16104 (_ BitVec 64)) (t!21294 List!14979)) )
))
(declare-fun arrayNoDuplicates!0 (array!43878 (_ BitVec 32) List!14979) Bool)

(assert (=> b!806776 (= res!550898 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14976))))

(declare-fun b!806777 () Bool)

(assert (=> b!806777 (= e!446741 e!446743)))

(declare-fun res!550896 () Bool)

(assert (=> b!806777 (=> (not res!550896) (not e!446743))))

(declare-fun lt!361346 () SeekEntryResult!8607)

(assert (=> b!806777 (= res!550896 (= lt!361346 lt!361351))))

(declare-fun lt!361348 () array!43878)

(declare-fun lt!361352 () (_ BitVec 64))

(assert (=> b!806777 (= lt!361351 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361352 lt!361348 mask!3266))))

(assert (=> b!806777 (= lt!361346 (seekEntryOrOpen!0 lt!361352 lt!361348 mask!3266))))

(assert (=> b!806777 (= lt!361352 (select (store (arr!21016 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806777 (= lt!361348 (array!43879 (store (arr!21016 a!3170) i!1163 k0!2044) (size!21437 a!3170)))))

(declare-fun b!806778 () Bool)

(declare-fun res!550899 () Bool)

(assert (=> b!806778 (=> (not res!550899) (not e!446741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43878 (_ BitVec 32)) Bool)

(assert (=> b!806778 (= res!550899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69178 res!550900) b!806773))

(assert (= (and b!806773 res!550901) b!806775))

(assert (= (and b!806775 res!550894) b!806769))

(assert (= (and b!806769 res!550892) b!806772))

(assert (= (and b!806772 res!550897) b!806768))

(assert (= (and b!806768 res!550893) b!806778))

(assert (= (and b!806778 res!550899) b!806776))

(assert (= (and b!806776 res!550898) b!806774))

(assert (= (and b!806774 res!550895) b!806777))

(assert (= (and b!806777 res!550896) b!806770))

(assert (= (and b!806770 res!550891) b!806771))

(declare-fun m!748721 () Bool)

(assert (=> b!806775 m!748721))

(assert (=> b!806775 m!748721))

(declare-fun m!748723 () Bool)

(assert (=> b!806775 m!748723))

(declare-fun m!748725 () Bool)

(assert (=> b!806772 m!748725))

(declare-fun m!748727 () Bool)

(assert (=> start!69178 m!748727))

(declare-fun m!748729 () Bool)

(assert (=> start!69178 m!748729))

(declare-fun m!748731 () Bool)

(assert (=> b!806778 m!748731))

(declare-fun m!748733 () Bool)

(assert (=> b!806774 m!748733))

(declare-fun m!748735 () Bool)

(assert (=> b!806774 m!748735))

(declare-fun m!748737 () Bool)

(assert (=> b!806768 m!748737))

(declare-fun m!748739 () Bool)

(assert (=> b!806770 m!748739))

(assert (=> b!806770 m!748721))

(assert (=> b!806770 m!748721))

(declare-fun m!748741 () Bool)

(assert (=> b!806770 m!748741))

(assert (=> b!806770 m!748721))

(declare-fun m!748743 () Bool)

(assert (=> b!806770 m!748743))

(declare-fun m!748745 () Bool)

(assert (=> b!806769 m!748745))

(declare-fun m!748747 () Bool)

(assert (=> b!806777 m!748747))

(declare-fun m!748749 () Bool)

(assert (=> b!806777 m!748749))

(declare-fun m!748751 () Bool)

(assert (=> b!806777 m!748751))

(declare-fun m!748753 () Bool)

(assert (=> b!806777 m!748753))

(declare-fun m!748755 () Bool)

(assert (=> b!806776 m!748755))

(check-sat (not b!806776) (not b!806772) (not b!806778) (not b!806769) (not start!69178) (not b!806770) (not b!806777) (not b!806775) (not b!806768))
(check-sat)
