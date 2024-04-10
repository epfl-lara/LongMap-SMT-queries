; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87118 () Bool)

(assert start!87118)

(declare-fun res!678608 () Bool)

(declare-fun e!568329 () Bool)

(assert (=> start!87118 (=> (not res!678608) (not e!568329))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87118 (= res!678608 (validMask!0 mask!3464))))

(assert (=> start!87118 e!568329))

(declare-datatypes ((array!63636 0))(
  ( (array!63637 (arr!30636 (Array (_ BitVec 32) (_ BitVec 64))) (size!31138 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63636)

(declare-fun array_inv!23760 (array!63636) Bool)

(assert (=> start!87118 (array_inv!23760 a!3219)))

(assert (=> start!87118 true))

(declare-fun b!1010203 () Bool)

(declare-fun e!568333 () Bool)

(declare-fun e!568332 () Bool)

(assert (=> b!1010203 (= e!568333 e!568332)))

(declare-fun res!678605 () Bool)

(assert (=> b!1010203 (=> (not res!678605) (not e!568332))))

(declare-datatypes ((SeekEntryResult!9568 0))(
  ( (MissingZero!9568 (index!40643 (_ BitVec 32))) (Found!9568 (index!40644 (_ BitVec 32))) (Intermediate!9568 (undefined!10380 Bool) (index!40645 (_ BitVec 32)) (x!88044 (_ BitVec 32))) (Undefined!9568) (MissingVacant!9568 (index!40646 (_ BitVec 32))) )
))
(declare-fun lt!446492 () SeekEntryResult!9568)

(declare-fun lt!446487 () SeekEntryResult!9568)

(assert (=> b!1010203 (= res!678605 (= lt!446492 lt!446487))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010203 (= lt!446487 (Intermediate!9568 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63636 (_ BitVec 32)) SeekEntryResult!9568)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010203 (= lt!446492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30636 a!3219) j!170) mask!3464) (select (arr!30636 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010204 () Bool)

(declare-fun res!678600 () Bool)

(declare-fun e!568331 () Bool)

(assert (=> b!1010204 (=> (not res!678600) (not e!568331))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1010204 (= res!678600 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010205 () Bool)

(declare-fun res!678609 () Bool)

(assert (=> b!1010205 (=> (not res!678609) (not e!568333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63636 (_ BitVec 32)) Bool)

(assert (=> b!1010205 (= res!678609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010206 () Bool)

(assert (=> b!1010206 (= e!568331 false)))

(declare-fun lt!446488 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010206 (= lt!446488 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1010207 () Bool)

(assert (=> b!1010207 (= e!568329 e!568333)))

(declare-fun res!678607 () Bool)

(assert (=> b!1010207 (=> (not res!678607) (not e!568333))))

(declare-fun lt!446489 () SeekEntryResult!9568)

(assert (=> b!1010207 (= res!678607 (or (= lt!446489 (MissingVacant!9568 i!1194)) (= lt!446489 (MissingZero!9568 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63636 (_ BitVec 32)) SeekEntryResult!9568)

(assert (=> b!1010207 (= lt!446489 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1010208 () Bool)

(declare-fun res!678601 () Bool)

(assert (=> b!1010208 (=> (not res!678601) (not e!568329))))

(declare-fun arrayContainsKey!0 (array!63636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010208 (= res!678601 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1010209 () Bool)

(declare-fun res!678604 () Bool)

(assert (=> b!1010209 (=> (not res!678604) (not e!568333))))

(declare-datatypes ((List!21312 0))(
  ( (Nil!21309) (Cons!21308 (h!22500 (_ BitVec 64)) (t!30313 List!21312)) )
))
(declare-fun arrayNoDuplicates!0 (array!63636 (_ BitVec 32) List!21312) Bool)

(assert (=> b!1010209 (= res!678604 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21309))))

(declare-fun b!1010210 () Bool)

(declare-fun res!678606 () Bool)

(assert (=> b!1010210 (=> (not res!678606) (not e!568329))))

(assert (=> b!1010210 (= res!678606 (and (= (size!31138 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31138 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31138 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1010211 () Bool)

(declare-fun e!568328 () Bool)

(assert (=> b!1010211 (= e!568332 e!568328)))

(declare-fun res!678598 () Bool)

(assert (=> b!1010211 (=> (not res!678598) (not e!568328))))

(declare-fun lt!446491 () SeekEntryResult!9568)

(assert (=> b!1010211 (= res!678598 (= lt!446491 lt!446487))))

(assert (=> b!1010211 (= lt!446491 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30636 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010212 () Bool)

(declare-fun res!678599 () Bool)

(assert (=> b!1010212 (=> (not res!678599) (not e!568331))))

(declare-fun lt!446490 () array!63636)

(declare-fun lt!446493 () (_ BitVec 64))

(assert (=> b!1010212 (= res!678599 (not (= lt!446491 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446493 lt!446490 mask!3464))))))

(declare-fun b!1010213 () Bool)

(declare-fun res!678603 () Bool)

(assert (=> b!1010213 (=> (not res!678603) (not e!568329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010213 (= res!678603 (validKeyInArray!0 (select (arr!30636 a!3219) j!170)))))

(declare-fun b!1010214 () Bool)

(assert (=> b!1010214 (= e!568328 e!568331)))

(declare-fun res!678602 () Bool)

(assert (=> b!1010214 (=> (not res!678602) (not e!568331))))

(assert (=> b!1010214 (= res!678602 (not (= lt!446492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446493 mask!3464) lt!446493 lt!446490 mask!3464))))))

(assert (=> b!1010214 (= lt!446493 (select (store (arr!30636 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1010214 (= lt!446490 (array!63637 (store (arr!30636 a!3219) i!1194 k!2224) (size!31138 a!3219)))))

(declare-fun b!1010215 () Bool)

(declare-fun res!678596 () Bool)

(assert (=> b!1010215 (=> (not res!678596) (not e!568329))))

(assert (=> b!1010215 (= res!678596 (validKeyInArray!0 k!2224))))

(declare-fun b!1010216 () Bool)

(declare-fun res!678597 () Bool)

(assert (=> b!1010216 (=> (not res!678597) (not e!568333))))

(assert (=> b!1010216 (= res!678597 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31138 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31138 a!3219))))))

(assert (= (and start!87118 res!678608) b!1010210))

(assert (= (and b!1010210 res!678606) b!1010213))

(assert (= (and b!1010213 res!678603) b!1010215))

(assert (= (and b!1010215 res!678596) b!1010208))

(assert (= (and b!1010208 res!678601) b!1010207))

(assert (= (and b!1010207 res!678607) b!1010205))

(assert (= (and b!1010205 res!678609) b!1010209))

(assert (= (and b!1010209 res!678604) b!1010216))

(assert (= (and b!1010216 res!678597) b!1010203))

(assert (= (and b!1010203 res!678605) b!1010211))

(assert (= (and b!1010211 res!678598) b!1010214))

(assert (= (and b!1010214 res!678602) b!1010212))

(assert (= (and b!1010212 res!678599) b!1010204))

(assert (= (and b!1010204 res!678600) b!1010206))

(declare-fun m!934563 () Bool)

(assert (=> b!1010205 m!934563))

(declare-fun m!934565 () Bool)

(assert (=> b!1010212 m!934565))

(declare-fun m!934567 () Bool)

(assert (=> b!1010203 m!934567))

(assert (=> b!1010203 m!934567))

(declare-fun m!934569 () Bool)

(assert (=> b!1010203 m!934569))

(assert (=> b!1010203 m!934569))

(assert (=> b!1010203 m!934567))

(declare-fun m!934571 () Bool)

(assert (=> b!1010203 m!934571))

(declare-fun m!934573 () Bool)

(assert (=> b!1010215 m!934573))

(assert (=> b!1010213 m!934567))

(assert (=> b!1010213 m!934567))

(declare-fun m!934575 () Bool)

(assert (=> b!1010213 m!934575))

(declare-fun m!934577 () Bool)

(assert (=> b!1010208 m!934577))

(declare-fun m!934579 () Bool)

(assert (=> start!87118 m!934579))

(declare-fun m!934581 () Bool)

(assert (=> start!87118 m!934581))

(declare-fun m!934583 () Bool)

(assert (=> b!1010209 m!934583))

(assert (=> b!1010211 m!934567))

(assert (=> b!1010211 m!934567))

(declare-fun m!934585 () Bool)

(assert (=> b!1010211 m!934585))

(declare-fun m!934587 () Bool)

(assert (=> b!1010207 m!934587))

(declare-fun m!934589 () Bool)

(assert (=> b!1010214 m!934589))

(assert (=> b!1010214 m!934589))

(declare-fun m!934591 () Bool)

(assert (=> b!1010214 m!934591))

(declare-fun m!934593 () Bool)

(assert (=> b!1010214 m!934593))

(declare-fun m!934595 () Bool)

(assert (=> b!1010214 m!934595))

(declare-fun m!934597 () Bool)

(assert (=> b!1010206 m!934597))

(push 1)

