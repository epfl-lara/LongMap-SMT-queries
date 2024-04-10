; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86944 () Bool)

(assert start!86944)

(declare-fun res!677495 () Bool)

(declare-fun e!567485 () Bool)

(assert (=> start!86944 (=> (not res!677495) (not e!567485))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86944 (= res!677495 (validMask!0 mask!3464))))

(assert (=> start!86944 e!567485))

(declare-datatypes ((array!63592 0))(
  ( (array!63593 (arr!30617 (Array (_ BitVec 32) (_ BitVec 64))) (size!31119 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63592)

(declare-fun array_inv!23741 (array!63592) Bool)

(assert (=> start!86944 (array_inv!23741 a!3219)))

(assert (=> start!86944 true))

(declare-fun b!1008599 () Bool)

(declare-fun res!677498 () Bool)

(declare-fun e!567486 () Bool)

(assert (=> b!1008599 (=> (not res!677498) (not e!567486))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445782 () array!63592)

(declare-datatypes ((SeekEntryResult!9549 0))(
  ( (MissingZero!9549 (index!40567 (_ BitVec 32))) (Found!9549 (index!40568 (_ BitVec 32))) (Intermediate!9549 (undefined!10361 Bool) (index!40569 (_ BitVec 32)) (x!87955 (_ BitVec 32))) (Undefined!9549) (MissingVacant!9549 (index!40570 (_ BitVec 32))) )
))
(declare-fun lt!445778 () SeekEntryResult!9549)

(declare-fun lt!445780 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63592 (_ BitVec 32)) SeekEntryResult!9549)

(assert (=> b!1008599 (= res!677498 (not (= lt!445778 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445780 lt!445782 mask!3464))))))

(declare-fun b!1008600 () Bool)

(declare-fun res!677502 () Bool)

(assert (=> b!1008600 (=> (not res!677502) (not e!567485))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008600 (= res!677502 (validKeyInArray!0 (select (arr!30617 a!3219) j!170)))))

(declare-fun b!1008601 () Bool)

(declare-fun res!677503 () Bool)

(assert (=> b!1008601 (=> (not res!677503) (not e!567485))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008601 (= res!677503 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008602 () Bool)

(declare-fun e!567484 () Bool)

(declare-fun e!567482 () Bool)

(assert (=> b!1008602 (= e!567484 e!567482)))

(declare-fun res!677492 () Bool)

(assert (=> b!1008602 (=> (not res!677492) (not e!567482))))

(declare-fun lt!445781 () SeekEntryResult!9549)

(declare-fun lt!445783 () SeekEntryResult!9549)

(assert (=> b!1008602 (= res!677492 (= lt!445781 lt!445783))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008602 (= lt!445783 (Intermediate!9549 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008602 (= lt!445781 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30617 a!3219) j!170) mask!3464) (select (arr!30617 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008603 () Bool)

(declare-fun res!677496 () Bool)

(assert (=> b!1008603 (=> (not res!677496) (not e!567485))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008603 (= res!677496 (and (= (size!31119 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31119 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31119 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008604 () Bool)

(declare-fun res!677494 () Bool)

(assert (=> b!1008604 (=> (not res!677494) (not e!567484))))

(declare-datatypes ((List!21293 0))(
  ( (Nil!21290) (Cons!21289 (h!22475 (_ BitVec 64)) (t!30294 List!21293)) )
))
(declare-fun arrayNoDuplicates!0 (array!63592 (_ BitVec 32) List!21293) Bool)

(assert (=> b!1008604 (= res!677494 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21290))))

(declare-fun b!1008605 () Bool)

(declare-fun res!677505 () Bool)

(assert (=> b!1008605 (=> (not res!677505) (not e!567485))))

(assert (=> b!1008605 (= res!677505 (validKeyInArray!0 k0!2224))))

(declare-fun b!1008606 () Bool)

(assert (=> b!1008606 (= e!567486 false)))

(declare-fun lt!445779 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008606 (= lt!445779 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008607 () Bool)

(declare-fun res!677497 () Bool)

(assert (=> b!1008607 (=> (not res!677497) (not e!567486))))

(assert (=> b!1008607 (= res!677497 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008608 () Bool)

(declare-fun e!567487 () Bool)

(assert (=> b!1008608 (= e!567487 e!567486)))

(declare-fun res!677493 () Bool)

(assert (=> b!1008608 (=> (not res!677493) (not e!567486))))

(assert (=> b!1008608 (= res!677493 (not (= lt!445781 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445780 mask!3464) lt!445780 lt!445782 mask!3464))))))

(assert (=> b!1008608 (= lt!445780 (select (store (arr!30617 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1008608 (= lt!445782 (array!63593 (store (arr!30617 a!3219) i!1194 k0!2224) (size!31119 a!3219)))))

(declare-fun b!1008609 () Bool)

(declare-fun res!677500 () Bool)

(assert (=> b!1008609 (=> (not res!677500) (not e!567484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63592 (_ BitVec 32)) Bool)

(assert (=> b!1008609 (= res!677500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008610 () Bool)

(assert (=> b!1008610 (= e!567482 e!567487)))

(declare-fun res!677499 () Bool)

(assert (=> b!1008610 (=> (not res!677499) (not e!567487))))

(assert (=> b!1008610 (= res!677499 (= lt!445778 lt!445783))))

(assert (=> b!1008610 (= lt!445778 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30617 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008611 () Bool)

(declare-fun res!677501 () Bool)

(assert (=> b!1008611 (=> (not res!677501) (not e!567484))))

(assert (=> b!1008611 (= res!677501 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31119 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31119 a!3219))))))

(declare-fun b!1008612 () Bool)

(assert (=> b!1008612 (= e!567485 e!567484)))

(declare-fun res!677504 () Bool)

(assert (=> b!1008612 (=> (not res!677504) (not e!567484))))

(declare-fun lt!445784 () SeekEntryResult!9549)

(assert (=> b!1008612 (= res!677504 (or (= lt!445784 (MissingVacant!9549 i!1194)) (= lt!445784 (MissingZero!9549 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63592 (_ BitVec 32)) SeekEntryResult!9549)

(assert (=> b!1008612 (= lt!445784 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86944 res!677495) b!1008603))

(assert (= (and b!1008603 res!677496) b!1008600))

(assert (= (and b!1008600 res!677502) b!1008605))

(assert (= (and b!1008605 res!677505) b!1008601))

(assert (= (and b!1008601 res!677503) b!1008612))

(assert (= (and b!1008612 res!677504) b!1008609))

(assert (= (and b!1008609 res!677500) b!1008604))

(assert (= (and b!1008604 res!677494) b!1008611))

(assert (= (and b!1008611 res!677501) b!1008602))

(assert (= (and b!1008602 res!677492) b!1008610))

(assert (= (and b!1008610 res!677499) b!1008608))

(assert (= (and b!1008608 res!677493) b!1008599))

(assert (= (and b!1008599 res!677498) b!1008607))

(assert (= (and b!1008607 res!677497) b!1008606))

(declare-fun m!933323 () Bool)

(assert (=> start!86944 m!933323))

(declare-fun m!933325 () Bool)

(assert (=> start!86944 m!933325))

(declare-fun m!933327 () Bool)

(assert (=> b!1008602 m!933327))

(assert (=> b!1008602 m!933327))

(declare-fun m!933329 () Bool)

(assert (=> b!1008602 m!933329))

(assert (=> b!1008602 m!933329))

(assert (=> b!1008602 m!933327))

(declare-fun m!933331 () Bool)

(assert (=> b!1008602 m!933331))

(declare-fun m!933333 () Bool)

(assert (=> b!1008601 m!933333))

(declare-fun m!933335 () Bool)

(assert (=> b!1008605 m!933335))

(declare-fun m!933337 () Bool)

(assert (=> b!1008599 m!933337))

(declare-fun m!933339 () Bool)

(assert (=> b!1008604 m!933339))

(declare-fun m!933341 () Bool)

(assert (=> b!1008609 m!933341))

(declare-fun m!933343 () Bool)

(assert (=> b!1008612 m!933343))

(declare-fun m!933345 () Bool)

(assert (=> b!1008606 m!933345))

(declare-fun m!933347 () Bool)

(assert (=> b!1008608 m!933347))

(assert (=> b!1008608 m!933347))

(declare-fun m!933349 () Bool)

(assert (=> b!1008608 m!933349))

(declare-fun m!933351 () Bool)

(assert (=> b!1008608 m!933351))

(declare-fun m!933353 () Bool)

(assert (=> b!1008608 m!933353))

(assert (=> b!1008600 m!933327))

(assert (=> b!1008600 m!933327))

(declare-fun m!933355 () Bool)

(assert (=> b!1008600 m!933355))

(assert (=> b!1008610 m!933327))

(assert (=> b!1008610 m!933327))

(declare-fun m!933357 () Bool)

(assert (=> b!1008610 m!933357))

(check-sat (not b!1008599) (not b!1008608) (not b!1008606) (not b!1008601) (not b!1008612) (not b!1008605) (not b!1008604) (not start!86944) (not b!1008610) (not b!1008602) (not b!1008600) (not b!1008609))
(check-sat)
