; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86934 () Bool)

(assert start!86934)

(declare-fun res!677369 () Bool)

(declare-fun e!567338 () Bool)

(assert (=> start!86934 (=> (not res!677369) (not e!567338))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86934 (= res!677369 (validMask!0 mask!3464))))

(assert (=> start!86934 e!567338))

(declare-datatypes ((array!63529 0))(
  ( (array!63530 (arr!30585 (Array (_ BitVec 32) (_ BitVec 64))) (size!31089 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63529)

(declare-fun array_inv!23728 (array!63529) Bool)

(assert (=> start!86934 (array_inv!23728 a!3219)))

(assert (=> start!86934 true))

(declare-fun b!1008339 () Bool)

(declare-fun e!567333 () Bool)

(assert (=> b!1008339 (= e!567333 false)))

(declare-fun lt!445529 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008339 (= lt!445529 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008340 () Bool)

(declare-fun res!677359 () Bool)

(assert (=> b!1008340 (=> (not res!677359) (not e!567338))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008340 (= res!677359 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008341 () Bool)

(declare-fun res!677361 () Bool)

(declare-fun e!567335 () Bool)

(assert (=> b!1008341 (=> (not res!677361) (not e!567335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63529 (_ BitVec 32)) Bool)

(assert (=> b!1008341 (= res!677361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008342 () Bool)

(declare-fun res!677360 () Bool)

(assert (=> b!1008342 (=> (not res!677360) (not e!567333))))

(declare-fun lt!445528 () array!63529)

(declare-fun lt!445527 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9542 0))(
  ( (MissingZero!9542 (index!40539 (_ BitVec 32))) (Found!9542 (index!40540 (_ BitVec 32))) (Intermediate!9542 (undefined!10354 Bool) (index!40541 (_ BitVec 32)) (x!87943 (_ BitVec 32))) (Undefined!9542) (MissingVacant!9542 (index!40542 (_ BitVec 32))) )
))
(declare-fun lt!445526 () SeekEntryResult!9542)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63529 (_ BitVec 32)) SeekEntryResult!9542)

(assert (=> b!1008342 (= res!677360 (not (= lt!445526 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445527 lt!445528 mask!3464))))))

(declare-fun b!1008343 () Bool)

(declare-fun e!567334 () Bool)

(assert (=> b!1008343 (= e!567335 e!567334)))

(declare-fun res!677362 () Bool)

(assert (=> b!1008343 (=> (not res!677362) (not e!567334))))

(declare-fun lt!445530 () SeekEntryResult!9542)

(declare-fun lt!445525 () SeekEntryResult!9542)

(assert (=> b!1008343 (= res!677362 (= lt!445530 lt!445525))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008343 (= lt!445525 (Intermediate!9542 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008343 (= lt!445530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30585 a!3219) j!170) mask!3464) (select (arr!30585 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008344 () Bool)

(declare-fun res!677356 () Bool)

(assert (=> b!1008344 (=> (not res!677356) (not e!567335))))

(assert (=> b!1008344 (= res!677356 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31089 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31089 a!3219))))))

(declare-fun b!1008345 () Bool)

(declare-fun res!677368 () Bool)

(assert (=> b!1008345 (=> (not res!677368) (not e!567333))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008345 (= res!677368 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008346 () Bool)

(declare-fun res!677357 () Bool)

(assert (=> b!1008346 (=> (not res!677357) (not e!567338))))

(assert (=> b!1008346 (= res!677357 (and (= (size!31089 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31089 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31089 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008347 () Bool)

(declare-fun e!567336 () Bool)

(assert (=> b!1008347 (= e!567334 e!567336)))

(declare-fun res!677364 () Bool)

(assert (=> b!1008347 (=> (not res!677364) (not e!567336))))

(assert (=> b!1008347 (= res!677364 (= lt!445526 lt!445525))))

(assert (=> b!1008347 (= lt!445526 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30585 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008348 () Bool)

(declare-fun res!677358 () Bool)

(assert (=> b!1008348 (=> (not res!677358) (not e!567338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008348 (= res!677358 (validKeyInArray!0 (select (arr!30585 a!3219) j!170)))))

(declare-fun b!1008349 () Bool)

(declare-fun res!677367 () Bool)

(assert (=> b!1008349 (=> (not res!677367) (not e!567335))))

(declare-datatypes ((List!21327 0))(
  ( (Nil!21324) (Cons!21323 (h!22509 (_ BitVec 64)) (t!30319 List!21327)) )
))
(declare-fun arrayNoDuplicates!0 (array!63529 (_ BitVec 32) List!21327) Bool)

(assert (=> b!1008349 (= res!677367 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21324))))

(declare-fun b!1008350 () Bool)

(declare-fun res!677363 () Bool)

(assert (=> b!1008350 (=> (not res!677363) (not e!567338))))

(assert (=> b!1008350 (= res!677363 (validKeyInArray!0 k0!2224))))

(declare-fun b!1008351 () Bool)

(assert (=> b!1008351 (= e!567338 e!567335)))

(declare-fun res!677365 () Bool)

(assert (=> b!1008351 (=> (not res!677365) (not e!567335))))

(declare-fun lt!445531 () SeekEntryResult!9542)

(assert (=> b!1008351 (= res!677365 (or (= lt!445531 (MissingVacant!9542 i!1194)) (= lt!445531 (MissingZero!9542 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63529 (_ BitVec 32)) SeekEntryResult!9542)

(assert (=> b!1008351 (= lt!445531 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1008352 () Bool)

(assert (=> b!1008352 (= e!567336 e!567333)))

(declare-fun res!677366 () Bool)

(assert (=> b!1008352 (=> (not res!677366) (not e!567333))))

(assert (=> b!1008352 (= res!677366 (not (= lt!445530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445527 mask!3464) lt!445527 lt!445528 mask!3464))))))

(assert (=> b!1008352 (= lt!445527 (select (store (arr!30585 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1008352 (= lt!445528 (array!63530 (store (arr!30585 a!3219) i!1194 k0!2224) (size!31089 a!3219)))))

(assert (= (and start!86934 res!677369) b!1008346))

(assert (= (and b!1008346 res!677357) b!1008348))

(assert (= (and b!1008348 res!677358) b!1008350))

(assert (= (and b!1008350 res!677363) b!1008340))

(assert (= (and b!1008340 res!677359) b!1008351))

(assert (= (and b!1008351 res!677365) b!1008341))

(assert (= (and b!1008341 res!677361) b!1008349))

(assert (= (and b!1008349 res!677367) b!1008344))

(assert (= (and b!1008344 res!677356) b!1008343))

(assert (= (and b!1008343 res!677362) b!1008347))

(assert (= (and b!1008347 res!677364) b!1008352))

(assert (= (and b!1008352 res!677366) b!1008342))

(assert (= (and b!1008342 res!677360) b!1008345))

(assert (= (and b!1008345 res!677368) b!1008339))

(declare-fun m!932557 () Bool)

(assert (=> b!1008351 m!932557))

(declare-fun m!932559 () Bool)

(assert (=> start!86934 m!932559))

(declare-fun m!932561 () Bool)

(assert (=> start!86934 m!932561))

(declare-fun m!932563 () Bool)

(assert (=> b!1008348 m!932563))

(assert (=> b!1008348 m!932563))

(declare-fun m!932565 () Bool)

(assert (=> b!1008348 m!932565))

(declare-fun m!932567 () Bool)

(assert (=> b!1008340 m!932567))

(declare-fun m!932569 () Bool)

(assert (=> b!1008352 m!932569))

(assert (=> b!1008352 m!932569))

(declare-fun m!932571 () Bool)

(assert (=> b!1008352 m!932571))

(declare-fun m!932573 () Bool)

(assert (=> b!1008352 m!932573))

(declare-fun m!932575 () Bool)

(assert (=> b!1008352 m!932575))

(declare-fun m!932577 () Bool)

(assert (=> b!1008341 m!932577))

(declare-fun m!932579 () Bool)

(assert (=> b!1008339 m!932579))

(assert (=> b!1008343 m!932563))

(assert (=> b!1008343 m!932563))

(declare-fun m!932581 () Bool)

(assert (=> b!1008343 m!932581))

(assert (=> b!1008343 m!932581))

(assert (=> b!1008343 m!932563))

(declare-fun m!932583 () Bool)

(assert (=> b!1008343 m!932583))

(declare-fun m!932585 () Bool)

(assert (=> b!1008350 m!932585))

(assert (=> b!1008347 m!932563))

(assert (=> b!1008347 m!932563))

(declare-fun m!932587 () Bool)

(assert (=> b!1008347 m!932587))

(declare-fun m!932589 () Bool)

(assert (=> b!1008342 m!932589))

(declare-fun m!932591 () Bool)

(assert (=> b!1008349 m!932591))

(check-sat (not b!1008352) (not start!86934) (not b!1008351) (not b!1008347) (not b!1008340) (not b!1008342) (not b!1008339) (not b!1008350) (not b!1008349) (not b!1008348) (not b!1008343) (not b!1008341))
(check-sat)
