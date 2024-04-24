; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69368 () Bool)

(assert start!69368)

(declare-fun b!808028 () Bool)

(declare-fun res!551608 () Bool)

(declare-fun e!447488 () Bool)

(assert (=> b!808028 (=> (not res!551608) (not e!447488))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808028 (= res!551608 (validKeyInArray!0 k0!2044))))

(declare-fun b!808029 () Bool)

(declare-fun e!447489 () Bool)

(assert (=> b!808029 (= e!447488 e!447489)))

(declare-fun res!551605 () Bool)

(assert (=> b!808029 (=> (not res!551605) (not e!447489))))

(declare-datatypes ((SeekEntryResult!8569 0))(
  ( (MissingZero!8569 (index!36644 (_ BitVec 32))) (Found!8569 (index!36645 (_ BitVec 32))) (Intermediate!8569 (undefined!9381 Bool) (index!36646 (_ BitVec 32)) (x!67619 (_ BitVec 32))) (Undefined!8569) (MissingVacant!8569 (index!36647 (_ BitVec 32))) )
))
(declare-fun lt!361928 () SeekEntryResult!8569)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!808029 (= res!551605 (or (= lt!361928 (MissingZero!8569 i!1163)) (= lt!361928 (MissingVacant!8569 i!1163))))))

(declare-datatypes ((array!43900 0))(
  ( (array!43901 (arr!21022 (Array (_ BitVec 32) (_ BitVec 64))) (size!21442 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43900)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43900 (_ BitVec 32)) SeekEntryResult!8569)

(assert (=> b!808029 (= lt!361928 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!551611 () Bool)

(assert (=> start!69368 (=> (not res!551611) (not e!447488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69368 (= res!551611 (validMask!0 mask!3266))))

(assert (=> start!69368 e!447488))

(assert (=> start!69368 true))

(declare-fun array_inv!16881 (array!43900) Bool)

(assert (=> start!69368 (array_inv!16881 a!3170)))

(declare-fun b!808030 () Bool)

(declare-fun res!551603 () Bool)

(assert (=> b!808030 (=> (not res!551603) (not e!447488))))

(declare-fun arrayContainsKey!0 (array!43900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808030 (= res!551603 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808031 () Bool)

(declare-fun e!447490 () Bool)

(assert (=> b!808031 (= e!447489 e!447490)))

(declare-fun res!551610 () Bool)

(assert (=> b!808031 (=> (not res!551610) (not e!447490))))

(declare-fun lt!361926 () array!43900)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!361924 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43900 (_ BitVec 32)) SeekEntryResult!8569)

(assert (=> b!808031 (= res!551610 (= (seekEntryOrOpen!0 lt!361924 lt!361926 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361924 lt!361926 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!808031 (= lt!361924 (select (store (arr!21022 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808031 (= lt!361926 (array!43901 (store (arr!21022 a!3170) i!1163 k0!2044) (size!21442 a!3170)))))

(declare-fun b!808032 () Bool)

(declare-fun res!551613 () Bool)

(assert (=> b!808032 (=> (not res!551613) (not e!447488))))

(assert (=> b!808032 (= res!551613 (and (= (size!21442 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21442 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21442 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808033 () Bool)

(declare-fun res!551612 () Bool)

(assert (=> b!808033 (=> (not res!551612) (not e!447488))))

(assert (=> b!808033 (= res!551612 (validKeyInArray!0 (select (arr!21022 a!3170) j!153)))))

(declare-fun b!808034 () Bool)

(declare-fun res!551606 () Bool)

(assert (=> b!808034 (=> (not res!551606) (not e!447489))))

(declare-datatypes ((List!14892 0))(
  ( (Nil!14889) (Cons!14888 (h!16023 (_ BitVec 64)) (t!21199 List!14892)) )
))
(declare-fun arrayNoDuplicates!0 (array!43900 (_ BitVec 32) List!14892) Bool)

(assert (=> b!808034 (= res!551606 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14889))))

(declare-fun b!808035 () Bool)

(declare-fun e!447486 () Bool)

(assert (=> b!808035 (= e!447486 false)))

(declare-fun lt!361925 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808035 (= lt!361925 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!808036 () Bool)

(assert (=> b!808036 (= e!447490 e!447486)))

(declare-fun res!551609 () Bool)

(assert (=> b!808036 (=> (not res!551609) (not e!447486))))

(declare-fun lt!361927 () SeekEntryResult!8569)

(declare-fun lt!361923 () SeekEntryResult!8569)

(assert (=> b!808036 (= res!551609 (and (= lt!361927 lt!361923) (= lt!361923 (Found!8569 j!153)) (not (= (select (arr!21022 a!3170) index!1236) (select (arr!21022 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!808036 (= lt!361923 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21022 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808036 (= lt!361927 (seekEntryOrOpen!0 (select (arr!21022 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808037 () Bool)

(declare-fun res!551604 () Bool)

(assert (=> b!808037 (=> (not res!551604) (not e!447489))))

(assert (=> b!808037 (= res!551604 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21442 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21022 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21442 a!3170)) (= (select (arr!21022 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808038 () Bool)

(declare-fun res!551607 () Bool)

(assert (=> b!808038 (=> (not res!551607) (not e!447489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43900 (_ BitVec 32)) Bool)

(assert (=> b!808038 (= res!551607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69368 res!551611) b!808032))

(assert (= (and b!808032 res!551613) b!808033))

(assert (= (and b!808033 res!551612) b!808028))

(assert (= (and b!808028 res!551608) b!808030))

(assert (= (and b!808030 res!551603) b!808029))

(assert (= (and b!808029 res!551605) b!808038))

(assert (= (and b!808038 res!551607) b!808034))

(assert (= (and b!808034 res!551606) b!808037))

(assert (= (and b!808037 res!551604) b!808031))

(assert (= (and b!808031 res!551610) b!808036))

(assert (= (and b!808036 res!551609) b!808035))

(declare-fun m!750385 () Bool)

(assert (=> b!808037 m!750385))

(declare-fun m!750387 () Bool)

(assert (=> b!808037 m!750387))

(declare-fun m!750389 () Bool)

(assert (=> b!808035 m!750389))

(declare-fun m!750391 () Bool)

(assert (=> b!808033 m!750391))

(assert (=> b!808033 m!750391))

(declare-fun m!750393 () Bool)

(assert (=> b!808033 m!750393))

(declare-fun m!750395 () Bool)

(assert (=> b!808029 m!750395))

(declare-fun m!750397 () Bool)

(assert (=> b!808036 m!750397))

(assert (=> b!808036 m!750391))

(assert (=> b!808036 m!750391))

(declare-fun m!750399 () Bool)

(assert (=> b!808036 m!750399))

(assert (=> b!808036 m!750391))

(declare-fun m!750401 () Bool)

(assert (=> b!808036 m!750401))

(declare-fun m!750403 () Bool)

(assert (=> b!808038 m!750403))

(declare-fun m!750405 () Bool)

(assert (=> b!808030 m!750405))

(declare-fun m!750407 () Bool)

(assert (=> b!808028 m!750407))

(declare-fun m!750409 () Bool)

(assert (=> b!808034 m!750409))

(declare-fun m!750411 () Bool)

(assert (=> b!808031 m!750411))

(declare-fun m!750413 () Bool)

(assert (=> b!808031 m!750413))

(declare-fun m!750415 () Bool)

(assert (=> b!808031 m!750415))

(declare-fun m!750417 () Bool)

(assert (=> b!808031 m!750417))

(declare-fun m!750419 () Bool)

(assert (=> start!69368 m!750419))

(declare-fun m!750421 () Bool)

(assert (=> start!69368 m!750421))

(check-sat (not b!808031) (not b!808035) (not b!808038) (not b!808029) (not b!808036) (not start!69368) (not b!808033) (not b!808034) (not b!808028) (not b!808030))
(check-sat)
