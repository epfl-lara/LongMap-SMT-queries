; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32370 () Bool)

(assert start!32370)

(declare-fun res!176379 () Bool)

(declare-fun e!199579 () Bool)

(assert (=> start!32370 (=> (not res!176379) (not e!199579))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32370 (= res!176379 (validMask!0 mask!3777))))

(assert (=> start!32370 e!199579))

(declare-datatypes ((array!16509 0))(
  ( (array!16510 (arr!7812 (Array (_ BitVec 32) (_ BitVec 64))) (size!8164 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16509)

(declare-fun array_inv!5775 (array!16509) Bool)

(assert (=> start!32370 (array_inv!5775 a!3305)))

(assert (=> start!32370 true))

(declare-fun b!322484 () Bool)

(assert (=> b!322484 false))

(declare-datatypes ((Unit!9864 0))(
  ( (Unit!9865) )
))
(declare-fun lt!156458 () Unit!9864)

(declare-fun e!199575 () Unit!9864)

(assert (=> b!322484 (= lt!156458 e!199575)))

(declare-fun c!50681 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun x!1490 () (_ BitVec 32))

(get-info :version)

(declare-datatypes ((SeekEntryResult!2943 0))(
  ( (MissingZero!2943 (index!13948 (_ BitVec 32))) (Found!2943 (index!13949 (_ BitVec 32))) (Intermediate!2943 (undefined!3755 Bool) (index!13950 (_ BitVec 32)) (x!32211 (_ BitVec 32))) (Undefined!2943) (MissingVacant!2943 (index!13951 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16509 (_ BitVec 32)) SeekEntryResult!2943)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322484 (= c!50681 ((_ is Intermediate!2943) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun e!199577 () Unit!9864)

(declare-fun Unit!9866 () Unit!9864)

(assert (=> b!322484 (= e!199577 Unit!9866)))

(declare-fun b!322485 () Bool)

(declare-fun res!176380 () Bool)

(declare-fun e!199576 () Bool)

(assert (=> b!322485 (=> (not res!176380) (not e!199576))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322485 (= res!176380 (and (= (select (arr!7812 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8164 a!3305))))))

(declare-fun b!322486 () Bool)

(assert (=> b!322486 (= e!199579 e!199576)))

(declare-fun res!176384 () Bool)

(assert (=> b!322486 (=> (not res!176384) (not e!199576))))

(declare-fun lt!156457 () SeekEntryResult!2943)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322486 (= res!176384 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156457))))

(assert (=> b!322486 (= lt!156457 (Intermediate!2943 false resIndex!58 resX!58))))

(declare-fun b!322487 () Bool)

(declare-fun res!176383 () Bool)

(assert (=> b!322487 (=> (not res!176383) (not e!199579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16509 (_ BitVec 32)) Bool)

(assert (=> b!322487 (= res!176383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322488 () Bool)

(declare-fun res!176385 () Bool)

(assert (=> b!322488 (=> (not res!176385) (not e!199579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322488 (= res!176385 (validKeyInArray!0 k0!2497))))

(declare-fun b!322489 () Bool)

(declare-fun res!176381 () Bool)

(assert (=> b!322489 (=> (not res!176381) (not e!199576))))

(assert (=> b!322489 (= res!176381 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156457))))

(declare-fun b!322490 () Bool)

(declare-fun e!199578 () Unit!9864)

(assert (=> b!322490 (= e!199578 e!199577)))

(declare-fun c!50680 () Bool)

(assert (=> b!322490 (= c!50680 (or (= (select (arr!7812 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7812 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322491 () Bool)

(declare-fun res!176386 () Bool)

(assert (=> b!322491 (=> (not res!176386) (not e!199576))))

(assert (=> b!322491 (= res!176386 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7812 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!322492 () Bool)

(assert (=> b!322492 (= e!199576 (not (or (not (= (select (arr!7812 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000))))))

(assert (=> b!322492 (= index!1840 resIndex!58)))

(declare-fun lt!156459 () Unit!9864)

(assert (=> b!322492 (= lt!156459 e!199578)))

(declare-fun c!50682 () Bool)

(assert (=> b!322492 (= c!50682 (not (= resIndex!58 index!1840)))))

(declare-fun b!322493 () Bool)

(declare-fun Unit!9867 () Unit!9864)

(assert (=> b!322493 (= e!199575 Unit!9867)))

(declare-fun b!322494 () Bool)

(declare-fun Unit!9868 () Unit!9864)

(assert (=> b!322494 (= e!199578 Unit!9868)))

(declare-fun b!322495 () Bool)

(declare-fun res!176382 () Bool)

(assert (=> b!322495 (=> (not res!176382) (not e!199579))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16509 (_ BitVec 32)) SeekEntryResult!2943)

(assert (=> b!322495 (= res!176382 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2943 i!1250)))))

(declare-fun b!322496 () Bool)

(assert (=> b!322496 false))

(declare-fun Unit!9869 () Unit!9864)

(assert (=> b!322496 (= e!199577 Unit!9869)))

(declare-fun b!322497 () Bool)

(declare-fun res!176388 () Bool)

(assert (=> b!322497 (=> (not res!176388) (not e!199579))))

(declare-fun arrayContainsKey!0 (array!16509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322497 (= res!176388 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322498 () Bool)

(declare-fun Unit!9870 () Unit!9864)

(assert (=> b!322498 (= e!199575 Unit!9870)))

(assert (=> b!322498 false))

(declare-fun b!322499 () Bool)

(declare-fun res!176387 () Bool)

(assert (=> b!322499 (=> (not res!176387) (not e!199579))))

(assert (=> b!322499 (= res!176387 (and (= (size!8164 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8164 a!3305))))))

(assert (= (and start!32370 res!176379) b!322499))

(assert (= (and b!322499 res!176387) b!322488))

(assert (= (and b!322488 res!176385) b!322497))

(assert (= (and b!322497 res!176388) b!322495))

(assert (= (and b!322495 res!176382) b!322487))

(assert (= (and b!322487 res!176383) b!322486))

(assert (= (and b!322486 res!176384) b!322485))

(assert (= (and b!322485 res!176380) b!322489))

(assert (= (and b!322489 res!176381) b!322491))

(assert (= (and b!322491 res!176386) b!322492))

(assert (= (and b!322492 c!50682) b!322490))

(assert (= (and b!322492 (not c!50682)) b!322494))

(assert (= (and b!322490 c!50680) b!322496))

(assert (= (and b!322490 (not c!50680)) b!322484))

(assert (= (and b!322484 c!50681) b!322493))

(assert (= (and b!322484 (not c!50681)) b!322498))

(declare-fun m!330301 () Bool)

(assert (=> start!32370 m!330301))

(declare-fun m!330303 () Bool)

(assert (=> start!32370 m!330303))

(declare-fun m!330305 () Bool)

(assert (=> b!322486 m!330305))

(assert (=> b!322486 m!330305))

(declare-fun m!330307 () Bool)

(assert (=> b!322486 m!330307))

(declare-fun m!330309 () Bool)

(assert (=> b!322491 m!330309))

(assert (=> b!322490 m!330309))

(assert (=> b!322492 m!330309))

(declare-fun m!330311 () Bool)

(assert (=> b!322495 m!330311))

(declare-fun m!330313 () Bool)

(assert (=> b!322489 m!330313))

(declare-fun m!330315 () Bool)

(assert (=> b!322497 m!330315))

(declare-fun m!330317 () Bool)

(assert (=> b!322485 m!330317))

(declare-fun m!330319 () Bool)

(assert (=> b!322487 m!330319))

(declare-fun m!330321 () Bool)

(assert (=> b!322488 m!330321))

(declare-fun m!330323 () Bool)

(assert (=> b!322484 m!330323))

(assert (=> b!322484 m!330323))

(declare-fun m!330325 () Bool)

(assert (=> b!322484 m!330325))

(check-sat (not b!322489) (not b!322487) (not start!32370) (not b!322497) (not b!322486) (not b!322495) (not b!322484) (not b!322488))
(check-sat)
