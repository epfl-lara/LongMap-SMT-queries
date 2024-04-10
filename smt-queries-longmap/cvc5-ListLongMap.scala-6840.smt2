; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86132 () Bool)

(assert start!86132)

(declare-fun b!997452 () Bool)

(declare-fun res!667412 () Bool)

(declare-fun e!562617 () Bool)

(assert (=> b!997452 (=> (not res!667412) (not e!562617))))

(declare-datatypes ((array!63086 0))(
  ( (array!63087 (arr!30373 (Array (_ BitVec 32) (_ BitVec 64))) (size!30875 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63086)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9305 0))(
  ( (MissingZero!9305 (index!39591 (_ BitVec 32))) (Found!9305 (index!39592 (_ BitVec 32))) (Intermediate!9305 (undefined!10117 Bool) (index!39593 (_ BitVec 32)) (x!87027 (_ BitVec 32))) (Undefined!9305) (MissingVacant!9305 (index!39594 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63086 (_ BitVec 32)) SeekEntryResult!9305)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997452 (= res!667412 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30373 a!3219) j!170) mask!3464) (select (arr!30373 a!3219) j!170) a!3219 mask!3464) (Intermediate!9305 false resIndex!38 resX!38)))))

(declare-fun b!997453 () Bool)

(declare-fun res!667407 () Bool)

(assert (=> b!997453 (=> (not res!667407) (not e!562617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63086 (_ BitVec 32)) Bool)

(assert (=> b!997453 (= res!667407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997454 () Bool)

(declare-fun res!667409 () Bool)

(declare-fun e!562618 () Bool)

(assert (=> b!997454 (=> (not res!667409) (not e!562618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997454 (= res!667409 (validKeyInArray!0 (select (arr!30373 a!3219) j!170)))))

(declare-fun b!997455 () Bool)

(assert (=> b!997455 (= e!562618 e!562617)))

(declare-fun res!667411 () Bool)

(assert (=> b!997455 (=> (not res!667411) (not e!562617))))

(declare-fun lt!441458 () SeekEntryResult!9305)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997455 (= res!667411 (or (= lt!441458 (MissingVacant!9305 i!1194)) (= lt!441458 (MissingZero!9305 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63086 (_ BitVec 32)) SeekEntryResult!9305)

(assert (=> b!997455 (= lt!441458 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!997456 () Bool)

(declare-fun res!667416 () Bool)

(assert (=> b!997456 (=> (not res!667416) (not e!562618))))

(assert (=> b!997456 (= res!667416 (validKeyInArray!0 k!2224))))

(declare-fun b!997457 () Bool)

(declare-fun res!667410 () Bool)

(assert (=> b!997457 (=> (not res!667410) (not e!562617))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!997457 (= res!667410 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30875 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30875 a!3219))))))

(declare-fun b!997458 () Bool)

(assert (=> b!997458 (= e!562617 false)))

(declare-fun lt!441457 () SeekEntryResult!9305)

(assert (=> b!997458 (= lt!441457 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30373 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!667408 () Bool)

(assert (=> start!86132 (=> (not res!667408) (not e!562618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86132 (= res!667408 (validMask!0 mask!3464))))

(assert (=> start!86132 e!562618))

(declare-fun array_inv!23497 (array!63086) Bool)

(assert (=> start!86132 (array_inv!23497 a!3219)))

(assert (=> start!86132 true))

(declare-fun b!997459 () Bool)

(declare-fun res!667414 () Bool)

(assert (=> b!997459 (=> (not res!667414) (not e!562618))))

(declare-fun arrayContainsKey!0 (array!63086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997459 (= res!667414 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997460 () Bool)

(declare-fun res!667413 () Bool)

(assert (=> b!997460 (=> (not res!667413) (not e!562617))))

(declare-datatypes ((List!21049 0))(
  ( (Nil!21046) (Cons!21045 (h!22213 (_ BitVec 64)) (t!30050 List!21049)) )
))
(declare-fun arrayNoDuplicates!0 (array!63086 (_ BitVec 32) List!21049) Bool)

(assert (=> b!997460 (= res!667413 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21046))))

(declare-fun b!997461 () Bool)

(declare-fun res!667415 () Bool)

(assert (=> b!997461 (=> (not res!667415) (not e!562618))))

(assert (=> b!997461 (= res!667415 (and (= (size!30875 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30875 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30875 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86132 res!667408) b!997461))

(assert (= (and b!997461 res!667415) b!997454))

(assert (= (and b!997454 res!667409) b!997456))

(assert (= (and b!997456 res!667416) b!997459))

(assert (= (and b!997459 res!667414) b!997455))

(assert (= (and b!997455 res!667411) b!997453))

(assert (= (and b!997453 res!667407) b!997460))

(assert (= (and b!997460 res!667413) b!997457))

(assert (= (and b!997457 res!667410) b!997452))

(assert (= (and b!997452 res!667412) b!997458))

(declare-fun m!924269 () Bool)

(assert (=> b!997453 m!924269))

(declare-fun m!924271 () Bool)

(assert (=> b!997460 m!924271))

(declare-fun m!924273 () Bool)

(assert (=> b!997456 m!924273))

(declare-fun m!924275 () Bool)

(assert (=> b!997455 m!924275))

(declare-fun m!924277 () Bool)

(assert (=> start!86132 m!924277))

(declare-fun m!924279 () Bool)

(assert (=> start!86132 m!924279))

(declare-fun m!924281 () Bool)

(assert (=> b!997458 m!924281))

(assert (=> b!997458 m!924281))

(declare-fun m!924283 () Bool)

(assert (=> b!997458 m!924283))

(assert (=> b!997454 m!924281))

(assert (=> b!997454 m!924281))

(declare-fun m!924285 () Bool)

(assert (=> b!997454 m!924285))

(declare-fun m!924287 () Bool)

(assert (=> b!997459 m!924287))

(assert (=> b!997452 m!924281))

(assert (=> b!997452 m!924281))

(declare-fun m!924289 () Bool)

(assert (=> b!997452 m!924289))

(assert (=> b!997452 m!924289))

(assert (=> b!997452 m!924281))

(declare-fun m!924291 () Bool)

(assert (=> b!997452 m!924291))

(push 1)

