; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86028 () Bool)

(assert start!86028)

(declare-fun b!996451 () Bool)

(declare-fun e!562205 () Bool)

(declare-fun e!562206 () Bool)

(assert (=> b!996451 (= e!562205 e!562206)))

(declare-fun res!666571 () Bool)

(assert (=> b!996451 (=> (not res!666571) (not e!562206))))

(declare-datatypes ((SeekEntryResult!9280 0))(
  ( (MissingZero!9280 (index!39491 (_ BitVec 32))) (Found!9280 (index!39492 (_ BitVec 32))) (Intermediate!9280 (undefined!10092 Bool) (index!39493 (_ BitVec 32)) (x!86924 (_ BitVec 32))) (Undefined!9280) (MissingVacant!9280 (index!39494 (_ BitVec 32))) )
))
(declare-fun lt!441239 () SeekEntryResult!9280)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996451 (= res!666571 (or (= lt!441239 (MissingVacant!9280 i!1194)) (= lt!441239 (MissingZero!9280 i!1194))))))

(declare-datatypes ((array!63033 0))(
  ( (array!63034 (arr!30348 (Array (_ BitVec 32) (_ BitVec 64))) (size!30850 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63033)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63033 (_ BitVec 32)) SeekEntryResult!9280)

(assert (=> b!996451 (= lt!441239 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!996452 () Bool)

(declare-fun res!666568 () Bool)

(assert (=> b!996452 (=> (not res!666568) (not e!562206))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!996452 (= res!666568 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30850 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30850 a!3219))))))

(declare-fun b!996453 () Bool)

(declare-fun res!666573 () Bool)

(assert (=> b!996453 (=> (not res!666573) (not e!562205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996453 (= res!666573 (validKeyInArray!0 k!2224))))

(declare-fun b!996454 () Bool)

(declare-fun res!666566 () Bool)

(assert (=> b!996454 (=> (not res!666566) (not e!562206))))

(declare-datatypes ((List!21024 0))(
  ( (Nil!21021) (Cons!21020 (h!22185 (_ BitVec 64)) (t!30025 List!21024)) )
))
(declare-fun arrayNoDuplicates!0 (array!63033 (_ BitVec 32) List!21024) Bool)

(assert (=> b!996454 (= res!666566 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21021))))

(declare-fun res!666565 () Bool)

(assert (=> start!86028 (=> (not res!666565) (not e!562205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86028 (= res!666565 (validMask!0 mask!3464))))

(assert (=> start!86028 e!562205))

(declare-fun array_inv!23472 (array!63033) Bool)

(assert (=> start!86028 (array_inv!23472 a!3219)))

(assert (=> start!86028 true))

(declare-fun b!996455 () Bool)

(assert (=> b!996455 (= e!562206 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!441238 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996455 (= lt!441238 (toIndex!0 (select (arr!30348 a!3219) j!170) mask!3464))))

(declare-fun b!996456 () Bool)

(declare-fun res!666569 () Bool)

(assert (=> b!996456 (=> (not res!666569) (not e!562205))))

(declare-fun arrayContainsKey!0 (array!63033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996456 (= res!666569 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996457 () Bool)

(declare-fun res!666567 () Bool)

(assert (=> b!996457 (=> (not res!666567) (not e!562205))))

(assert (=> b!996457 (= res!666567 (and (= (size!30850 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30850 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30850 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996458 () Bool)

(declare-fun res!666572 () Bool)

(assert (=> b!996458 (=> (not res!666572) (not e!562205))))

(assert (=> b!996458 (= res!666572 (validKeyInArray!0 (select (arr!30348 a!3219) j!170)))))

(declare-fun b!996459 () Bool)

(declare-fun res!666570 () Bool)

(assert (=> b!996459 (=> (not res!666570) (not e!562206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63033 (_ BitVec 32)) Bool)

(assert (=> b!996459 (= res!666570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86028 res!666565) b!996457))

(assert (= (and b!996457 res!666567) b!996458))

(assert (= (and b!996458 res!666572) b!996453))

(assert (= (and b!996453 res!666573) b!996456))

(assert (= (and b!996456 res!666569) b!996451))

(assert (= (and b!996451 res!666571) b!996459))

(assert (= (and b!996459 res!666570) b!996454))

(assert (= (and b!996454 res!666566) b!996452))

(assert (= (and b!996452 res!666568) b!996455))

(declare-fun m!923565 () Bool)

(assert (=> b!996459 m!923565))

(declare-fun m!923567 () Bool)

(assert (=> b!996454 m!923567))

(declare-fun m!923569 () Bool)

(assert (=> b!996453 m!923569))

(declare-fun m!923571 () Bool)

(assert (=> b!996455 m!923571))

(assert (=> b!996455 m!923571))

(declare-fun m!923573 () Bool)

(assert (=> b!996455 m!923573))

(declare-fun m!923575 () Bool)

(assert (=> b!996456 m!923575))

(declare-fun m!923577 () Bool)

(assert (=> b!996451 m!923577))

(declare-fun m!923579 () Bool)

(assert (=> start!86028 m!923579))

(declare-fun m!923581 () Bool)

(assert (=> start!86028 m!923581))

(assert (=> b!996458 m!923571))

(assert (=> b!996458 m!923571))

(declare-fun m!923583 () Bool)

(assert (=> b!996458 m!923583))

(push 1)

(assert (not b!996458))

