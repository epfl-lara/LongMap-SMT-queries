; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86130 () Bool)

(assert start!86130)

(declare-fun b!997326 () Bool)

(declare-fun e!562517 () Bool)

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!997326 (= e!562517 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!997327 () Bool)

(declare-fun e!562516 () Bool)

(declare-fun e!562514 () Bool)

(assert (=> b!997327 (= e!562516 e!562514)))

(declare-fun res!667407 () Bool)

(assert (=> b!997327 (=> (not res!667407) (not e!562514))))

(declare-datatypes ((SeekEntryResult!9302 0))(
  ( (MissingZero!9302 (index!39579 (_ BitVec 32))) (Found!9302 (index!39580 (_ BitVec 32))) (Intermediate!9302 (undefined!10114 Bool) (index!39581 (_ BitVec 32)) (x!87027 (_ BitVec 32))) (Undefined!9302) (MissingVacant!9302 (index!39582 (_ BitVec 32))) )
))
(declare-fun lt!441244 () SeekEntryResult!9302)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997327 (= res!667407 (or (= lt!441244 (MissingVacant!9302 i!1194)) (= lt!441244 (MissingZero!9302 i!1194))))))

(declare-datatypes ((array!63031 0))(
  ( (array!63032 (arr!30345 (Array (_ BitVec 32) (_ BitVec 64))) (size!30849 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63031)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63031 (_ BitVec 32)) SeekEntryResult!9302)

(assert (=> b!997327 (= lt!441244 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997328 () Bool)

(declare-fun res!667406 () Bool)

(assert (=> b!997328 (=> (not res!667406) (not e!562516))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997328 (= res!667406 (validKeyInArray!0 (select (arr!30345 a!3219) j!170)))))

(declare-fun b!997329 () Bool)

(declare-fun res!667412 () Bool)

(assert (=> b!997329 (=> (not res!667412) (not e!562514))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!997329 (= res!667412 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30849 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30849 a!3219))))))

(declare-fun b!997330 () Bool)

(declare-fun res!667413 () Bool)

(assert (=> b!997330 (=> (not res!667413) (not e!562516))))

(declare-fun arrayContainsKey!0 (array!63031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997330 (= res!667413 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997331 () Bool)

(declare-fun res!667409 () Bool)

(assert (=> b!997331 (=> (not res!667409) (not e!562514))))

(declare-datatypes ((List!21087 0))(
  ( (Nil!21084) (Cons!21083 (h!22251 (_ BitVec 64)) (t!30079 List!21087)) )
))
(declare-fun arrayNoDuplicates!0 (array!63031 (_ BitVec 32) List!21087) Bool)

(assert (=> b!997331 (= res!667409 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21084))))

(declare-fun b!997332 () Bool)

(declare-fun res!667405 () Bool)

(assert (=> b!997332 (=> (not res!667405) (not e!562517))))

(declare-fun lt!441243 () SeekEntryResult!9302)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63031 (_ BitVec 32)) SeekEntryResult!9302)

(assert (=> b!997332 (= res!667405 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30345 a!3219) j!170) a!3219 mask!3464) lt!441243))))

(declare-fun b!997333 () Bool)

(assert (=> b!997333 (= e!562514 e!562517)))

(declare-fun res!667410 () Bool)

(assert (=> b!997333 (=> (not res!667410) (not e!562517))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997333 (= res!667410 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30345 a!3219) j!170) mask!3464) (select (arr!30345 a!3219) j!170) a!3219 mask!3464) lt!441243))))

(assert (=> b!997333 (= lt!441243 (Intermediate!9302 false resIndex!38 resX!38))))

(declare-fun b!997334 () Bool)

(declare-fun res!667414 () Bool)

(assert (=> b!997334 (=> (not res!667414) (not e!562516))))

(assert (=> b!997334 (= res!667414 (and (= (size!30849 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30849 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30849 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997335 () Bool)

(declare-fun res!667411 () Bool)

(assert (=> b!997335 (=> (not res!667411) (not e!562516))))

(assert (=> b!997335 (= res!667411 (validKeyInArray!0 k0!2224))))

(declare-fun res!667415 () Bool)

(assert (=> start!86130 (=> (not res!667415) (not e!562516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86130 (= res!667415 (validMask!0 mask!3464))))

(assert (=> start!86130 e!562516))

(declare-fun array_inv!23488 (array!63031) Bool)

(assert (=> start!86130 (array_inv!23488 a!3219)))

(assert (=> start!86130 true))

(declare-fun b!997336 () Bool)

(declare-fun res!667408 () Bool)

(assert (=> b!997336 (=> (not res!667408) (not e!562514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63031 (_ BitVec 32)) Bool)

(assert (=> b!997336 (= res!667408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86130 res!667415) b!997334))

(assert (= (and b!997334 res!667414) b!997328))

(assert (= (and b!997328 res!667406) b!997335))

(assert (= (and b!997335 res!667411) b!997330))

(assert (= (and b!997330 res!667413) b!997327))

(assert (= (and b!997327 res!667407) b!997336))

(assert (= (and b!997336 res!667408) b!997331))

(assert (= (and b!997331 res!667409) b!997329))

(assert (= (and b!997329 res!667412) b!997333))

(assert (= (and b!997333 res!667410) b!997332))

(assert (= (and b!997332 res!667405) b!997326))

(declare-fun m!923611 () Bool)

(assert (=> b!997330 m!923611))

(declare-fun m!923613 () Bool)

(assert (=> b!997332 m!923613))

(assert (=> b!997332 m!923613))

(declare-fun m!923615 () Bool)

(assert (=> b!997332 m!923615))

(declare-fun m!923617 () Bool)

(assert (=> b!997336 m!923617))

(declare-fun m!923619 () Bool)

(assert (=> start!86130 m!923619))

(declare-fun m!923621 () Bool)

(assert (=> start!86130 m!923621))

(declare-fun m!923623 () Bool)

(assert (=> b!997335 m!923623))

(assert (=> b!997333 m!923613))

(assert (=> b!997333 m!923613))

(declare-fun m!923625 () Bool)

(assert (=> b!997333 m!923625))

(assert (=> b!997333 m!923625))

(assert (=> b!997333 m!923613))

(declare-fun m!923627 () Bool)

(assert (=> b!997333 m!923627))

(declare-fun m!923629 () Bool)

(assert (=> b!997327 m!923629))

(declare-fun m!923631 () Bool)

(assert (=> b!997331 m!923631))

(assert (=> b!997328 m!923613))

(assert (=> b!997328 m!923613))

(declare-fun m!923633 () Bool)

(assert (=> b!997328 m!923633))

(check-sat (not b!997333) (not b!997332) (not b!997336) (not b!997335) (not b!997327) (not start!86130) (not b!997331) (not b!997330) (not b!997328))
(check-sat)
