; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87116 () Bool)

(assert start!87116)

(declare-fun b!1010161 () Bool)

(declare-fun e!568313 () Bool)

(declare-fun e!568314 () Bool)

(assert (=> b!1010161 (= e!568313 e!568314)))

(declare-fun res!678560 () Bool)

(assert (=> b!1010161 (=> (not res!678560) (not e!568314))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9567 0))(
  ( (MissingZero!9567 (index!40639 (_ BitVec 32))) (Found!9567 (index!40640 (_ BitVec 32))) (Intermediate!9567 (undefined!10379 Bool) (index!40641 (_ BitVec 32)) (x!88043 (_ BitVec 32))) (Undefined!9567) (MissingVacant!9567 (index!40642 (_ BitVec 32))) )
))
(declare-fun lt!446470 () SeekEntryResult!9567)

(declare-fun lt!446467 () (_ BitVec 64))

(declare-datatypes ((array!63634 0))(
  ( (array!63635 (arr!30635 (Array (_ BitVec 32) (_ BitVec 64))) (size!31137 (_ BitVec 32))) )
))
(declare-fun lt!446468 () array!63634)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63634 (_ BitVec 32)) SeekEntryResult!9567)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010161 (= res!678560 (not (= lt!446470 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446467 mask!3464) lt!446467 lt!446468 mask!3464))))))

(declare-fun a!3219 () array!63634)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1010161 (= lt!446467 (select (store (arr!30635 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1010161 (= lt!446468 (array!63635 (store (arr!30635 a!3219) i!1194 k0!2224) (size!31137 a!3219)))))

(declare-fun b!1010162 () Bool)

(declare-fun res!678566 () Bool)

(declare-fun e!568315 () Bool)

(assert (=> b!1010162 (=> (not res!678566) (not e!568315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63634 (_ BitVec 32)) Bool)

(assert (=> b!1010162 (= res!678566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010163 () Bool)

(declare-fun res!678562 () Bool)

(assert (=> b!1010163 (=> (not res!678562) (not e!568315))))

(declare-datatypes ((List!21311 0))(
  ( (Nil!21308) (Cons!21307 (h!22499 (_ BitVec 64)) (t!30312 List!21311)) )
))
(declare-fun arrayNoDuplicates!0 (array!63634 (_ BitVec 32) List!21311) Bool)

(assert (=> b!1010163 (= res!678562 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21308))))

(declare-fun b!1010164 () Bool)

(declare-fun res!678557 () Bool)

(assert (=> b!1010164 (=> (not res!678557) (not e!568314))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1010164 (= res!678557 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010165 () Bool)

(declare-fun e!568311 () Bool)

(assert (=> b!1010165 (= e!568315 e!568311)))

(declare-fun res!678554 () Bool)

(assert (=> b!1010165 (=> (not res!678554) (not e!568311))))

(declare-fun lt!446466 () SeekEntryResult!9567)

(assert (=> b!1010165 (= res!678554 (= lt!446470 lt!446466))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010165 (= lt!446466 (Intermediate!9567 false resIndex!38 resX!38))))

(assert (=> b!1010165 (= lt!446470 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30635 a!3219) j!170) mask!3464) (select (arr!30635 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010166 () Bool)

(declare-fun res!678567 () Bool)

(declare-fun e!568310 () Bool)

(assert (=> b!1010166 (=> (not res!678567) (not e!568310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010166 (= res!678567 (validKeyInArray!0 (select (arr!30635 a!3219) j!170)))))

(declare-fun b!1010167 () Bool)

(declare-fun res!678558 () Bool)

(assert (=> b!1010167 (=> (not res!678558) (not e!568310))))

(assert (=> b!1010167 (= res!678558 (validKeyInArray!0 k0!2224))))

(declare-fun b!1010168 () Bool)

(declare-fun res!678555 () Bool)

(assert (=> b!1010168 (=> (not res!678555) (not e!568310))))

(declare-fun arrayContainsKey!0 (array!63634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010168 (= res!678555 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!678556 () Bool)

(assert (=> start!87116 (=> (not res!678556) (not e!568310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87116 (= res!678556 (validMask!0 mask!3464))))

(assert (=> start!87116 e!568310))

(declare-fun array_inv!23759 (array!63634) Bool)

(assert (=> start!87116 (array_inv!23759 a!3219)))

(assert (=> start!87116 true))

(declare-fun b!1010169 () Bool)

(assert (=> b!1010169 (= e!568310 e!568315)))

(declare-fun res!678565 () Bool)

(assert (=> b!1010169 (=> (not res!678565) (not e!568315))))

(declare-fun lt!446471 () SeekEntryResult!9567)

(assert (=> b!1010169 (= res!678565 (or (= lt!446471 (MissingVacant!9567 i!1194)) (= lt!446471 (MissingZero!9567 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63634 (_ BitVec 32)) SeekEntryResult!9567)

(assert (=> b!1010169 (= lt!446471 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1010170 () Bool)

(assert (=> b!1010170 (= e!568311 e!568313)))

(declare-fun res!678561 () Bool)

(assert (=> b!1010170 (=> (not res!678561) (not e!568313))))

(declare-fun lt!446472 () SeekEntryResult!9567)

(assert (=> b!1010170 (= res!678561 (= lt!446472 lt!446466))))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1010170 (= lt!446472 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30635 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010171 () Bool)

(assert (=> b!1010171 (= e!568314 false)))

(declare-fun lt!446469 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010171 (= lt!446469 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1010172 () Bool)

(declare-fun res!678559 () Bool)

(assert (=> b!1010172 (=> (not res!678559) (not e!568314))))

(assert (=> b!1010172 (= res!678559 (not (= lt!446472 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446467 lt!446468 mask!3464))))))

(declare-fun b!1010173 () Bool)

(declare-fun res!678563 () Bool)

(assert (=> b!1010173 (=> (not res!678563) (not e!568315))))

(assert (=> b!1010173 (= res!678563 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31137 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31137 a!3219))))))

(declare-fun b!1010174 () Bool)

(declare-fun res!678564 () Bool)

(assert (=> b!1010174 (=> (not res!678564) (not e!568310))))

(assert (=> b!1010174 (= res!678564 (and (= (size!31137 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31137 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31137 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!87116 res!678556) b!1010174))

(assert (= (and b!1010174 res!678564) b!1010166))

(assert (= (and b!1010166 res!678567) b!1010167))

(assert (= (and b!1010167 res!678558) b!1010168))

(assert (= (and b!1010168 res!678555) b!1010169))

(assert (= (and b!1010169 res!678565) b!1010162))

(assert (= (and b!1010162 res!678566) b!1010163))

(assert (= (and b!1010163 res!678562) b!1010173))

(assert (= (and b!1010173 res!678563) b!1010165))

(assert (= (and b!1010165 res!678554) b!1010170))

(assert (= (and b!1010170 res!678561) b!1010161))

(assert (= (and b!1010161 res!678560) b!1010172))

(assert (= (and b!1010172 res!678559) b!1010164))

(assert (= (and b!1010164 res!678557) b!1010171))

(declare-fun m!934527 () Bool)

(assert (=> b!1010171 m!934527))

(declare-fun m!934529 () Bool)

(assert (=> b!1010167 m!934529))

(declare-fun m!934531 () Bool)

(assert (=> b!1010161 m!934531))

(assert (=> b!1010161 m!934531))

(declare-fun m!934533 () Bool)

(assert (=> b!1010161 m!934533))

(declare-fun m!934535 () Bool)

(assert (=> b!1010161 m!934535))

(declare-fun m!934537 () Bool)

(assert (=> b!1010161 m!934537))

(declare-fun m!934539 () Bool)

(assert (=> b!1010162 m!934539))

(declare-fun m!934541 () Bool)

(assert (=> b!1010169 m!934541))

(declare-fun m!934543 () Bool)

(assert (=> b!1010168 m!934543))

(declare-fun m!934545 () Bool)

(assert (=> start!87116 m!934545))

(declare-fun m!934547 () Bool)

(assert (=> start!87116 m!934547))

(declare-fun m!934549 () Bool)

(assert (=> b!1010166 m!934549))

(assert (=> b!1010166 m!934549))

(declare-fun m!934551 () Bool)

(assert (=> b!1010166 m!934551))

(assert (=> b!1010165 m!934549))

(assert (=> b!1010165 m!934549))

(declare-fun m!934553 () Bool)

(assert (=> b!1010165 m!934553))

(assert (=> b!1010165 m!934553))

(assert (=> b!1010165 m!934549))

(declare-fun m!934555 () Bool)

(assert (=> b!1010165 m!934555))

(assert (=> b!1010170 m!934549))

(assert (=> b!1010170 m!934549))

(declare-fun m!934557 () Bool)

(assert (=> b!1010170 m!934557))

(declare-fun m!934559 () Bool)

(assert (=> b!1010172 m!934559))

(declare-fun m!934561 () Bool)

(assert (=> b!1010163 m!934561))

(check-sat (not b!1010169) (not b!1010168) (not b!1010162) (not start!87116) (not b!1010163) (not b!1010165) (not b!1010167) (not b!1010161) (not b!1010170) (not b!1010171) (not b!1010172) (not b!1010166))
(check-sat)
