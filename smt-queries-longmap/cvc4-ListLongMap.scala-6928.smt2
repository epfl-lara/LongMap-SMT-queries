; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87124 () Bool)

(assert start!87124)

(declare-fun b!1010329 () Bool)

(declare-fun e!568384 () Bool)

(declare-fun e!568382 () Bool)

(assert (=> b!1010329 (= e!568384 e!568382)))

(declare-fun res!678728 () Bool)

(assert (=> b!1010329 (=> (not res!678728) (not e!568382))))

(declare-datatypes ((SeekEntryResult!9571 0))(
  ( (MissingZero!9571 (index!40655 (_ BitVec 32))) (Found!9571 (index!40656 (_ BitVec 32))) (Intermediate!9571 (undefined!10383 Bool) (index!40657 (_ BitVec 32)) (x!88055 (_ BitVec 32))) (Undefined!9571) (MissingVacant!9571 (index!40658 (_ BitVec 32))) )
))
(declare-fun lt!446554 () SeekEntryResult!9571)

(declare-fun lt!446551 () SeekEntryResult!9571)

(assert (=> b!1010329 (= res!678728 (= lt!446554 lt!446551))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1010329 (= lt!446551 (Intermediate!9571 false resIndex!38 resX!38))))

(declare-datatypes ((array!63642 0))(
  ( (array!63643 (arr!30639 (Array (_ BitVec 32) (_ BitVec 64))) (size!31141 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63642)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63642 (_ BitVec 32)) SeekEntryResult!9571)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010329 (= lt!446554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30639 a!3219) j!170) mask!3464) (select (arr!30639 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010330 () Bool)

(declare-fun res!678723 () Bool)

(assert (=> b!1010330 (=> (not res!678723) (not e!568384))))

(declare-datatypes ((List!21315 0))(
  ( (Nil!21312) (Cons!21311 (h!22503 (_ BitVec 64)) (t!30316 List!21315)) )
))
(declare-fun arrayNoDuplicates!0 (array!63642 (_ BitVec 32) List!21315) Bool)

(assert (=> b!1010330 (= res!678723 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21312))))

(declare-fun b!1010331 () Bool)

(declare-fun e!568385 () Bool)

(assert (=> b!1010331 (= e!568385 e!568384)))

(declare-fun res!678733 () Bool)

(assert (=> b!1010331 (=> (not res!678733) (not e!568384))))

(declare-fun lt!446556 () SeekEntryResult!9571)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1010331 (= res!678733 (or (= lt!446556 (MissingVacant!9571 i!1194)) (= lt!446556 (MissingZero!9571 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63642 (_ BitVec 32)) SeekEntryResult!9571)

(assert (=> b!1010331 (= lt!446556 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1010332 () Bool)

(declare-fun e!568387 () Bool)

(declare-fun e!568386 () Bool)

(assert (=> b!1010332 (= e!568387 e!568386)))

(declare-fun res!678729 () Bool)

(assert (=> b!1010332 (=> (not res!678729) (not e!568386))))

(declare-fun lt!446553 () array!63642)

(declare-fun lt!446552 () (_ BitVec 64))

(assert (=> b!1010332 (= res!678729 (not (= lt!446554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446552 mask!3464) lt!446552 lt!446553 mask!3464))))))

(assert (=> b!1010332 (= lt!446552 (select (store (arr!30639 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1010332 (= lt!446553 (array!63643 (store (arr!30639 a!3219) i!1194 k!2224) (size!31141 a!3219)))))

(declare-fun b!1010333 () Bool)

(declare-fun res!678735 () Bool)

(assert (=> b!1010333 (=> (not res!678735) (not e!568385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1010333 (= res!678735 (validKeyInArray!0 (select (arr!30639 a!3219) j!170)))))

(declare-fun b!1010334 () Bool)

(assert (=> b!1010334 (= e!568386 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!446555 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1010334 (= lt!446555 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1010335 () Bool)

(declare-fun res!678726 () Bool)

(assert (=> b!1010335 (=> (not res!678726) (not e!568385))))

(declare-fun arrayContainsKey!0 (array!63642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1010335 (= res!678726 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1010336 () Bool)

(declare-fun res!678722 () Bool)

(assert (=> b!1010336 (=> (not res!678722) (not e!568386))))

(declare-fun lt!446550 () SeekEntryResult!9571)

(assert (=> b!1010336 (= res!678722 (not (= lt!446550 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446552 lt!446553 mask!3464))))))

(declare-fun b!1010338 () Bool)

(declare-fun res!678730 () Bool)

(assert (=> b!1010338 (=> (not res!678730) (not e!568385))))

(assert (=> b!1010338 (= res!678730 (validKeyInArray!0 k!2224))))

(declare-fun b!1010339 () Bool)

(declare-fun res!678731 () Bool)

(assert (=> b!1010339 (=> (not res!678731) (not e!568384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63642 (_ BitVec 32)) Bool)

(assert (=> b!1010339 (= res!678731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010340 () Bool)

(declare-fun res!678732 () Bool)

(assert (=> b!1010340 (=> (not res!678732) (not e!568386))))

(assert (=> b!1010340 (= res!678732 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1010341 () Bool)

(declare-fun res!678734 () Bool)

(assert (=> b!1010341 (=> (not res!678734) (not e!568384))))

(assert (=> b!1010341 (= res!678734 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31141 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31141 a!3219))))))

(declare-fun b!1010342 () Bool)

(declare-fun res!678727 () Bool)

(assert (=> b!1010342 (=> (not res!678727) (not e!568385))))

(assert (=> b!1010342 (= res!678727 (and (= (size!31141 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31141 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31141 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1010337 () Bool)

(assert (=> b!1010337 (= e!568382 e!568387)))

(declare-fun res!678724 () Bool)

(assert (=> b!1010337 (=> (not res!678724) (not e!568387))))

(assert (=> b!1010337 (= res!678724 (= lt!446550 lt!446551))))

(assert (=> b!1010337 (= lt!446550 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30639 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!678725 () Bool)

(assert (=> start!87124 (=> (not res!678725) (not e!568385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87124 (= res!678725 (validMask!0 mask!3464))))

(assert (=> start!87124 e!568385))

(declare-fun array_inv!23763 (array!63642) Bool)

(assert (=> start!87124 (array_inv!23763 a!3219)))

(assert (=> start!87124 true))

(assert (= (and start!87124 res!678725) b!1010342))

(assert (= (and b!1010342 res!678727) b!1010333))

(assert (= (and b!1010333 res!678735) b!1010338))

(assert (= (and b!1010338 res!678730) b!1010335))

(assert (= (and b!1010335 res!678726) b!1010331))

(assert (= (and b!1010331 res!678733) b!1010339))

(assert (= (and b!1010339 res!678731) b!1010330))

(assert (= (and b!1010330 res!678723) b!1010341))

(assert (= (and b!1010341 res!678734) b!1010329))

(assert (= (and b!1010329 res!678728) b!1010337))

(assert (= (and b!1010337 res!678724) b!1010332))

(assert (= (and b!1010332 res!678729) b!1010336))

(assert (= (and b!1010336 res!678722) b!1010340))

(assert (= (and b!1010340 res!678732) b!1010334))

(declare-fun m!934671 () Bool)

(assert (=> b!1010335 m!934671))

(declare-fun m!934673 () Bool)

(assert (=> b!1010337 m!934673))

(assert (=> b!1010337 m!934673))

(declare-fun m!934675 () Bool)

(assert (=> b!1010337 m!934675))

(declare-fun m!934677 () Bool)

(assert (=> start!87124 m!934677))

(declare-fun m!934679 () Bool)

(assert (=> start!87124 m!934679))

(declare-fun m!934681 () Bool)

(assert (=> b!1010331 m!934681))

(declare-fun m!934683 () Bool)

(assert (=> b!1010339 m!934683))

(declare-fun m!934685 () Bool)

(assert (=> b!1010336 m!934685))

(assert (=> b!1010329 m!934673))

(assert (=> b!1010329 m!934673))

(declare-fun m!934687 () Bool)

(assert (=> b!1010329 m!934687))

(assert (=> b!1010329 m!934687))

(assert (=> b!1010329 m!934673))

(declare-fun m!934689 () Bool)

(assert (=> b!1010329 m!934689))

(declare-fun m!934691 () Bool)

(assert (=> b!1010334 m!934691))

(declare-fun m!934693 () Bool)

(assert (=> b!1010338 m!934693))

(assert (=> b!1010333 m!934673))

(assert (=> b!1010333 m!934673))

(declare-fun m!934695 () Bool)

(assert (=> b!1010333 m!934695))

(declare-fun m!934697 () Bool)

(assert (=> b!1010332 m!934697))

(assert (=> b!1010332 m!934697))

(declare-fun m!934699 () Bool)

(assert (=> b!1010332 m!934699))

(declare-fun m!934701 () Bool)

(assert (=> b!1010332 m!934701))

(declare-fun m!934703 () Bool)

(assert (=> b!1010332 m!934703))

(declare-fun m!934705 () Bool)

(assert (=> b!1010330 m!934705))

(push 1)

(assert (not b!1010335))

(assert (not b!1010336))

(assert (not b!1010337))

(assert (not b!1010333))

