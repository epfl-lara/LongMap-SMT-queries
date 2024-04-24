; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32354 () Bool)

(assert start!32354)

(declare-fun b!322383 () Bool)

(assert (=> b!322383 false))

(declare-datatypes ((Unit!9819 0))(
  ( (Unit!9820) )
))
(declare-fun e!199523 () Unit!9819)

(declare-fun Unit!9821 () Unit!9819)

(assert (=> b!322383 (= e!199523 Unit!9821)))

(declare-fun b!322384 () Bool)

(declare-fun res!176349 () Bool)

(declare-fun e!199526 () Bool)

(assert (=> b!322384 (=> (not res!176349) (not e!199526))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322384 (= res!176349 (validKeyInArray!0 k0!2497))))

(declare-fun b!322385 () Bool)

(declare-fun res!176350 () Bool)

(assert (=> b!322385 (=> (not res!176350) (not e!199526))))

(declare-datatypes ((array!16506 0))(
  ( (array!16507 (arr!7810 (Array (_ BitVec 32) (_ BitVec 64))) (size!8162 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16506)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16506 (_ BitVec 32)) Bool)

(assert (=> b!322385 (= res!176350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322386 () Bool)

(declare-fun res!176346 () Bool)

(declare-fun e!199522 () Bool)

(assert (=> b!322386 (=> (not res!176346) (not e!199522))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!322386 (= res!176346 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7810 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!322387 () Bool)

(declare-fun res!176354 () Bool)

(assert (=> b!322387 (=> (not res!176354) (not e!199522))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322387 (= res!176354 (and (= (select (arr!7810 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8162 a!3305))))))

(declare-fun b!322388 () Bool)

(declare-fun e!199524 () Unit!9819)

(declare-fun Unit!9822 () Unit!9819)

(assert (=> b!322388 (= e!199524 Unit!9822)))

(assert (=> b!322388 false))

(declare-fun b!322389 () Bool)

(declare-fun res!176352 () Bool)

(assert (=> b!322389 (=> (not res!176352) (not e!199522))))

(declare-datatypes ((SeekEntryResult!2906 0))(
  ( (MissingZero!2906 (index!13800 (_ BitVec 32))) (Found!2906 (index!13801 (_ BitVec 32))) (Intermediate!2906 (undefined!3718 Bool) (index!13802 (_ BitVec 32)) (x!32171 (_ BitVec 32))) (Undefined!2906) (MissingVacant!2906 (index!13803 (_ BitVec 32))) )
))
(declare-fun lt!156468 () SeekEntryResult!2906)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16506 (_ BitVec 32)) SeekEntryResult!2906)

(assert (=> b!322389 (= res!176352 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156468))))

(declare-fun b!322390 () Bool)

(assert (=> b!322390 (= e!199526 e!199522)))

(declare-fun res!176355 () Bool)

(assert (=> b!322390 (=> (not res!176355) (not e!199522))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322390 (= res!176355 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156468))))

(assert (=> b!322390 (= lt!156468 (Intermediate!2906 false resIndex!58 resX!58))))

(declare-fun b!322391 () Bool)

(assert (=> b!322391 (= e!199522 (not (or (not (= (select (arr!7810 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000))))))

(assert (=> b!322391 (= index!1840 resIndex!58)))

(declare-fun lt!156466 () Unit!9819)

(declare-fun e!199527 () Unit!9819)

(assert (=> b!322391 (= lt!156466 e!199527)))

(declare-fun c!50646 () Bool)

(assert (=> b!322391 (= c!50646 (not (= resIndex!58 index!1840)))))

(declare-fun b!322392 () Bool)

(assert (=> b!322392 (= e!199527 e!199523)))

(declare-fun c!50647 () Bool)

(assert (=> b!322392 (= c!50647 (or (= (select (arr!7810 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7810 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322393 () Bool)

(declare-fun res!176351 () Bool)

(assert (=> b!322393 (=> (not res!176351) (not e!199526))))

(assert (=> b!322393 (= res!176351 (and (= (size!8162 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8162 a!3305))))))

(declare-fun b!322394 () Bool)

(declare-fun res!176347 () Bool)

(assert (=> b!322394 (=> (not res!176347) (not e!199526))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16506 (_ BitVec 32)) SeekEntryResult!2906)

(assert (=> b!322394 (= res!176347 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2906 i!1250)))))

(declare-fun res!176353 () Bool)

(assert (=> start!32354 (=> (not res!176353) (not e!199526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32354 (= res!176353 (validMask!0 mask!3777))))

(assert (=> start!32354 e!199526))

(declare-fun array_inv!5760 (array!16506) Bool)

(assert (=> start!32354 (array_inv!5760 a!3305)))

(assert (=> start!32354 true))

(declare-fun b!322395 () Bool)

(assert (=> b!322395 false))

(declare-fun lt!156467 () Unit!9819)

(assert (=> b!322395 (= lt!156467 e!199524)))

(declare-fun c!50648 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322395 (= c!50648 ((_ is Intermediate!2906) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!9823 () Unit!9819)

(assert (=> b!322395 (= e!199523 Unit!9823)))

(declare-fun b!322396 () Bool)

(declare-fun Unit!9824 () Unit!9819)

(assert (=> b!322396 (= e!199524 Unit!9824)))

(declare-fun b!322397 () Bool)

(declare-fun Unit!9825 () Unit!9819)

(assert (=> b!322397 (= e!199527 Unit!9825)))

(declare-fun b!322398 () Bool)

(declare-fun res!176348 () Bool)

(assert (=> b!322398 (=> (not res!176348) (not e!199526))))

(declare-fun arrayContainsKey!0 (array!16506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322398 (= res!176348 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32354 res!176353) b!322393))

(assert (= (and b!322393 res!176351) b!322384))

(assert (= (and b!322384 res!176349) b!322398))

(assert (= (and b!322398 res!176348) b!322394))

(assert (= (and b!322394 res!176347) b!322385))

(assert (= (and b!322385 res!176350) b!322390))

(assert (= (and b!322390 res!176355) b!322387))

(assert (= (and b!322387 res!176354) b!322389))

(assert (= (and b!322389 res!176352) b!322386))

(assert (= (and b!322386 res!176346) b!322391))

(assert (= (and b!322391 c!50646) b!322392))

(assert (= (and b!322391 (not c!50646)) b!322397))

(assert (= (and b!322392 c!50647) b!322383))

(assert (= (and b!322392 (not c!50647)) b!322395))

(assert (= (and b!322395 c!50648) b!322396))

(assert (= (and b!322395 (not c!50648)) b!322388))

(declare-fun m!330457 () Bool)

(assert (=> b!322398 m!330457))

(declare-fun m!330459 () Bool)

(assert (=> b!322394 m!330459))

(declare-fun m!330461 () Bool)

(assert (=> b!322391 m!330461))

(declare-fun m!330463 () Bool)

(assert (=> start!32354 m!330463))

(declare-fun m!330465 () Bool)

(assert (=> start!32354 m!330465))

(declare-fun m!330467 () Bool)

(assert (=> b!322389 m!330467))

(declare-fun m!330469 () Bool)

(assert (=> b!322395 m!330469))

(assert (=> b!322395 m!330469))

(declare-fun m!330471 () Bool)

(assert (=> b!322395 m!330471))

(assert (=> b!322386 m!330461))

(assert (=> b!322392 m!330461))

(declare-fun m!330473 () Bool)

(assert (=> b!322390 m!330473))

(assert (=> b!322390 m!330473))

(declare-fun m!330475 () Bool)

(assert (=> b!322390 m!330475))

(declare-fun m!330477 () Bool)

(assert (=> b!322387 m!330477))

(declare-fun m!330479 () Bool)

(assert (=> b!322384 m!330479))

(declare-fun m!330481 () Bool)

(assert (=> b!322385 m!330481))

(check-sat (not b!322390) (not b!322398) (not b!322384) (not start!32354) (not b!322394) (not b!322389) (not b!322395) (not b!322385))
(check-sat)
