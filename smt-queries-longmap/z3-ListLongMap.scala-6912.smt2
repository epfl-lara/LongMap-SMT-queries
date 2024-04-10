; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86890 () Bool)

(assert start!86890)

(declare-fun b!1007465 () Bool)

(declare-fun res!676363 () Bool)

(declare-fun e!566996 () Bool)

(assert (=> b!1007465 (=> (not res!676363) (not e!566996))))

(declare-datatypes ((array!63538 0))(
  ( (array!63539 (arr!30590 (Array (_ BitVec 32) (_ BitVec 64))) (size!31092 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63538)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63538 (_ BitVec 32)) Bool)

(assert (=> b!1007465 (= res!676363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007466 () Bool)

(declare-fun res!676364 () Bool)

(declare-fun e!566997 () Bool)

(assert (=> b!1007466 (=> (not res!676364) (not e!566997))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007466 (= res!676364 (and (= (size!31092 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31092 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31092 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007467 () Bool)

(declare-fun e!566999 () Bool)

(assert (=> b!1007467 (= e!566999 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445216 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007467 (= lt!445216 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007468 () Bool)

(declare-fun e!567001 () Bool)

(assert (=> b!1007468 (= e!567001 e!566999)))

(declare-fun res!676366 () Bool)

(assert (=> b!1007468 (=> (not res!676366) (not e!566999))))

(declare-datatypes ((SeekEntryResult!9522 0))(
  ( (MissingZero!9522 (index!40459 (_ BitVec 32))) (Found!9522 (index!40460 (_ BitVec 32))) (Intermediate!9522 (undefined!10334 Bool) (index!40461 (_ BitVec 32)) (x!87856 (_ BitVec 32))) (Undefined!9522) (MissingVacant!9522 (index!40462 (_ BitVec 32))) )
))
(declare-fun lt!445215 () SeekEntryResult!9522)

(declare-fun lt!445217 () array!63538)

(declare-fun lt!445214 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63538 (_ BitVec 32)) SeekEntryResult!9522)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007468 (= res!676366 (not (= lt!445215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445214 mask!3464) lt!445214 lt!445217 mask!3464))))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1007468 (= lt!445214 (select (store (arr!30590 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1007468 (= lt!445217 (array!63539 (store (arr!30590 a!3219) i!1194 k0!2224) (size!31092 a!3219)))))

(declare-fun b!1007469 () Bool)

(declare-fun res!676358 () Bool)

(assert (=> b!1007469 (=> (not res!676358) (not e!566996))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007469 (= res!676358 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31092 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31092 a!3219))))))

(declare-fun b!1007471 () Bool)

(assert (=> b!1007471 (= e!566997 e!566996)))

(declare-fun res!676362 () Bool)

(assert (=> b!1007471 (=> (not res!676362) (not e!566996))))

(declare-fun lt!445211 () SeekEntryResult!9522)

(assert (=> b!1007471 (= res!676362 (or (= lt!445211 (MissingVacant!9522 i!1194)) (= lt!445211 (MissingZero!9522 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63538 (_ BitVec 32)) SeekEntryResult!9522)

(assert (=> b!1007471 (= lt!445211 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007472 () Bool)

(declare-fun res!676369 () Bool)

(assert (=> b!1007472 (=> (not res!676369) (not e!566996))))

(declare-datatypes ((List!21266 0))(
  ( (Nil!21263) (Cons!21262 (h!22448 (_ BitVec 64)) (t!30267 List!21266)) )
))
(declare-fun arrayNoDuplicates!0 (array!63538 (_ BitVec 32) List!21266) Bool)

(assert (=> b!1007472 (= res!676369 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21263))))

(declare-fun b!1007473 () Bool)

(declare-fun res!676370 () Bool)

(assert (=> b!1007473 (=> (not res!676370) (not e!566997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007473 (= res!676370 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007474 () Bool)

(declare-fun res!676360 () Bool)

(assert (=> b!1007474 (=> (not res!676360) (not e!566999))))

(assert (=> b!1007474 (= res!676360 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007475 () Bool)

(declare-fun res!676365 () Bool)

(assert (=> b!1007475 (=> (not res!676365) (not e!566997))))

(assert (=> b!1007475 (= res!676365 (validKeyInArray!0 (select (arr!30590 a!3219) j!170)))))

(declare-fun b!1007476 () Bool)

(declare-fun e!567000 () Bool)

(assert (=> b!1007476 (= e!567000 e!567001)))

(declare-fun res!676359 () Bool)

(assert (=> b!1007476 (=> (not res!676359) (not e!567001))))

(declare-fun lt!445212 () SeekEntryResult!9522)

(declare-fun lt!445213 () SeekEntryResult!9522)

(assert (=> b!1007476 (= res!676359 (= lt!445212 lt!445213))))

(assert (=> b!1007476 (= lt!445212 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30590 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007477 () Bool)

(assert (=> b!1007477 (= e!566996 e!567000)))

(declare-fun res!676371 () Bool)

(assert (=> b!1007477 (=> (not res!676371) (not e!567000))))

(assert (=> b!1007477 (= res!676371 (= lt!445215 lt!445213))))

(assert (=> b!1007477 (= lt!445213 (Intermediate!9522 false resIndex!38 resX!38))))

(assert (=> b!1007477 (= lt!445215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30590 a!3219) j!170) mask!3464) (select (arr!30590 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007478 () Bool)

(declare-fun res!676367 () Bool)

(assert (=> b!1007478 (=> (not res!676367) (not e!566997))))

(declare-fun arrayContainsKey!0 (array!63538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007478 (= res!676367 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007470 () Bool)

(declare-fun res!676361 () Bool)

(assert (=> b!1007470 (=> (not res!676361) (not e!566999))))

(assert (=> b!1007470 (= res!676361 (not (= lt!445212 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445214 lt!445217 mask!3464))))))

(declare-fun res!676368 () Bool)

(assert (=> start!86890 (=> (not res!676368) (not e!566997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86890 (= res!676368 (validMask!0 mask!3464))))

(assert (=> start!86890 e!566997))

(declare-fun array_inv!23714 (array!63538) Bool)

(assert (=> start!86890 (array_inv!23714 a!3219)))

(assert (=> start!86890 true))

(assert (= (and start!86890 res!676368) b!1007466))

(assert (= (and b!1007466 res!676364) b!1007475))

(assert (= (and b!1007475 res!676365) b!1007473))

(assert (= (and b!1007473 res!676370) b!1007478))

(assert (= (and b!1007478 res!676367) b!1007471))

(assert (= (and b!1007471 res!676362) b!1007465))

(assert (= (and b!1007465 res!676363) b!1007472))

(assert (= (and b!1007472 res!676369) b!1007469))

(assert (= (and b!1007469 res!676358) b!1007477))

(assert (= (and b!1007477 res!676371) b!1007476))

(assert (= (and b!1007476 res!676359) b!1007468))

(assert (= (and b!1007468 res!676366) b!1007470))

(assert (= (and b!1007470 res!676361) b!1007474))

(assert (= (and b!1007474 res!676360) b!1007467))

(declare-fun m!932351 () Bool)

(assert (=> b!1007468 m!932351))

(assert (=> b!1007468 m!932351))

(declare-fun m!932353 () Bool)

(assert (=> b!1007468 m!932353))

(declare-fun m!932355 () Bool)

(assert (=> b!1007468 m!932355))

(declare-fun m!932357 () Bool)

(assert (=> b!1007468 m!932357))

(declare-fun m!932359 () Bool)

(assert (=> b!1007467 m!932359))

(declare-fun m!932361 () Bool)

(assert (=> b!1007477 m!932361))

(assert (=> b!1007477 m!932361))

(declare-fun m!932363 () Bool)

(assert (=> b!1007477 m!932363))

(assert (=> b!1007477 m!932363))

(assert (=> b!1007477 m!932361))

(declare-fun m!932365 () Bool)

(assert (=> b!1007477 m!932365))

(assert (=> b!1007476 m!932361))

(assert (=> b!1007476 m!932361))

(declare-fun m!932367 () Bool)

(assert (=> b!1007476 m!932367))

(declare-fun m!932369 () Bool)

(assert (=> start!86890 m!932369))

(declare-fun m!932371 () Bool)

(assert (=> start!86890 m!932371))

(declare-fun m!932373 () Bool)

(assert (=> b!1007473 m!932373))

(declare-fun m!932375 () Bool)

(assert (=> b!1007465 m!932375))

(assert (=> b!1007475 m!932361))

(assert (=> b!1007475 m!932361))

(declare-fun m!932377 () Bool)

(assert (=> b!1007475 m!932377))

(declare-fun m!932379 () Bool)

(assert (=> b!1007470 m!932379))

(declare-fun m!932381 () Bool)

(assert (=> b!1007478 m!932381))

(declare-fun m!932383 () Bool)

(assert (=> b!1007472 m!932383))

(declare-fun m!932385 () Bool)

(assert (=> b!1007471 m!932385))

(check-sat (not b!1007470) (not b!1007477) (not b!1007468) (not b!1007467) (not b!1007473) (not b!1007475) (not b!1007465) (not b!1007472) (not b!1007478) (not start!86890) (not b!1007476) (not b!1007471))
(check-sat)
