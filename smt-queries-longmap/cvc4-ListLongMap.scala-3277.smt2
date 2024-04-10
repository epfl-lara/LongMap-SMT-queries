; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45610 () Bool)

(assert start!45610)

(declare-fun b!502483 () Bool)

(declare-fun res!303895 () Bool)

(declare-fun e!294317 () Bool)

(assert (=> b!502483 (=> res!303895 e!294317)))

(declare-datatypes ((SeekEntryResult!4030 0))(
  ( (MissingZero!4030 (index!18308 (_ BitVec 32))) (Found!4030 (index!18309 (_ BitVec 32))) (Intermediate!4030 (undefined!4842 Bool) (index!18310 (_ BitVec 32)) (x!47335 (_ BitVec 32))) (Undefined!4030) (MissingVacant!4030 (index!18311 (_ BitVec 32))) )
))
(declare-fun lt!228415 () SeekEntryResult!4030)

(assert (=> b!502483 (= res!303895 (or (undefined!4842 lt!228415) (not (is-Intermediate!4030 lt!228415))))))

(declare-fun b!502484 () Bool)

(declare-fun res!303900 () Bool)

(declare-fun e!294324 () Bool)

(assert (=> b!502484 (=> (not res!303900) (not e!294324))))

(declare-datatypes ((array!32366 0))(
  ( (array!32367 (arr!15563 (Array (_ BitVec 32) (_ BitVec 64))) (size!15927 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32366)

(declare-datatypes ((List!9721 0))(
  ( (Nil!9718) (Cons!9717 (h!10594 (_ BitVec 64)) (t!15949 List!9721)) )
))
(declare-fun arrayNoDuplicates!0 (array!32366 (_ BitVec 32) List!9721) Bool)

(assert (=> b!502484 (= res!303900 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9718))))

(declare-fun b!502485 () Bool)

(declare-fun e!294321 () Bool)

(assert (=> b!502485 (= e!294317 e!294321)))

(declare-fun res!303901 () Bool)

(assert (=> b!502485 (=> res!303901 e!294321)))

(declare-fun lt!228414 () (_ BitVec 32))

(assert (=> b!502485 (= res!303901 (or (bvsgt (x!47335 lt!228415) #b01111111111111111111111111111110) (bvslt lt!228414 #b00000000000000000000000000000000) (bvsge lt!228414 (size!15927 a!3235)) (bvslt (index!18310 lt!228415) #b00000000000000000000000000000000) (bvsge (index!18310 lt!228415) (size!15927 a!3235)) (not (= lt!228415 (Intermediate!4030 false (index!18310 lt!228415) (x!47335 lt!228415))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502485 (= (index!18310 lt!228415) i!1204)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!15196 0))(
  ( (Unit!15197) )
))
(declare-fun lt!228410 () Unit!15196)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32366 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15196)

(assert (=> b!502485 (= lt!228410 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228414 #b00000000000000000000000000000000 (index!18310 lt!228415) (x!47335 lt!228415) mask!3524))))

(assert (=> b!502485 (and (or (= (select (arr!15563 a!3235) (index!18310 lt!228415)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15563 a!3235) (index!18310 lt!228415)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15563 a!3235) (index!18310 lt!228415)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15563 a!3235) (index!18310 lt!228415)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228406 () Unit!15196)

(declare-fun e!294323 () Unit!15196)

(assert (=> b!502485 (= lt!228406 e!294323)))

(declare-fun c!59573 () Bool)

(assert (=> b!502485 (= c!59573 (= (select (arr!15563 a!3235) (index!18310 lt!228415)) (select (arr!15563 a!3235) j!176)))))

(assert (=> b!502485 (and (bvslt (x!47335 lt!228415) #b01111111111111111111111111111110) (or (= (select (arr!15563 a!3235) (index!18310 lt!228415)) (select (arr!15563 a!3235) j!176)) (= (select (arr!15563 a!3235) (index!18310 lt!228415)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15563 a!3235) (index!18310 lt!228415)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502486 () Bool)

(declare-fun Unit!15198 () Unit!15196)

(assert (=> b!502486 (= e!294323 Unit!15198)))

(declare-fun lt!228409 () Unit!15196)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32366 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15196)

(assert (=> b!502486 (= lt!228409 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228414 #b00000000000000000000000000000000 (index!18310 lt!228415) (x!47335 lt!228415) mask!3524))))

(declare-fun lt!228411 () array!32366)

(declare-fun lt!228413 () (_ BitVec 64))

(declare-fun res!303907 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32366 (_ BitVec 32)) SeekEntryResult!4030)

(assert (=> b!502486 (= res!303907 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228414 lt!228413 lt!228411 mask!3524) (Intermediate!4030 false (index!18310 lt!228415) (x!47335 lt!228415))))))

(declare-fun e!294320 () Bool)

(assert (=> b!502486 (=> (not res!303907) (not e!294320))))

(assert (=> b!502486 e!294320))

(declare-fun b!502487 () Bool)

(declare-fun Unit!15199 () Unit!15196)

(assert (=> b!502487 (= e!294323 Unit!15199)))

(declare-fun b!502488 () Bool)

(assert (=> b!502488 (= e!294320 false)))

(declare-fun b!502489 () Bool)

(assert (=> b!502489 (= e!294324 (not e!294317))))

(declare-fun res!303905 () Bool)

(assert (=> b!502489 (=> res!303905 e!294317)))

(declare-fun lt!228405 () (_ BitVec 32))

(assert (=> b!502489 (= res!303905 (= lt!228415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228405 lt!228413 lt!228411 mask!3524)))))

(assert (=> b!502489 (= lt!228415 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228414 (select (arr!15563 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502489 (= lt!228405 (toIndex!0 lt!228413 mask!3524))))

(assert (=> b!502489 (= lt!228413 (select (store (arr!15563 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!502489 (= lt!228414 (toIndex!0 (select (arr!15563 a!3235) j!176) mask!3524))))

(assert (=> b!502489 (= lt!228411 (array!32367 (store (arr!15563 a!3235) i!1204 k!2280) (size!15927 a!3235)))))

(declare-fun e!294319 () Bool)

(assert (=> b!502489 e!294319))

(declare-fun res!303906 () Bool)

(assert (=> b!502489 (=> (not res!303906) (not e!294319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32366 (_ BitVec 32)) Bool)

(assert (=> b!502489 (= res!303906 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228408 () Unit!15196)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15196)

(assert (=> b!502489 (= lt!228408 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502490 () Bool)

(declare-fun res!303908 () Bool)

(declare-fun e!294318 () Bool)

(assert (=> b!502490 (=> (not res!303908) (not e!294318))))

(assert (=> b!502490 (= res!303908 (and (= (size!15927 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15927 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15927 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502491 () Bool)

(declare-fun res!303903 () Bool)

(assert (=> b!502491 (=> (not res!303903) (not e!294318))))

(declare-fun arrayContainsKey!0 (array!32366 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502491 (= res!303903 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502492 () Bool)

(declare-fun res!303896 () Bool)

(assert (=> b!502492 (=> (not res!303896) (not e!294324))))

(assert (=> b!502492 (= res!303896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502493 () Bool)

(declare-fun res!303899 () Bool)

(assert (=> b!502493 (=> res!303899 e!294321)))

(declare-fun e!294316 () Bool)

(assert (=> b!502493 (= res!303899 e!294316)))

(declare-fun res!303894 () Bool)

(assert (=> b!502493 (=> (not res!303894) (not e!294316))))

(assert (=> b!502493 (= res!303894 (bvsgt #b00000000000000000000000000000000 (x!47335 lt!228415)))))

(declare-fun b!502494 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32366 (_ BitVec 32)) SeekEntryResult!4030)

(assert (=> b!502494 (= e!294319 (= (seekEntryOrOpen!0 (select (arr!15563 a!3235) j!176) a!3235 mask!3524) (Found!4030 j!176)))))

(declare-fun res!303902 () Bool)

(assert (=> start!45610 (=> (not res!303902) (not e!294318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45610 (= res!303902 (validMask!0 mask!3524))))

(assert (=> start!45610 e!294318))

(assert (=> start!45610 true))

(declare-fun array_inv!11359 (array!32366) Bool)

(assert (=> start!45610 (array_inv!11359 a!3235)))

(declare-fun b!502495 () Bool)

(declare-fun res!303897 () Bool)

(assert (=> b!502495 (=> (not res!303897) (not e!294318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502495 (= res!303897 (validKeyInArray!0 (select (arr!15563 a!3235) j!176)))))

(declare-fun b!502496 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32366 (_ BitVec 32)) SeekEntryResult!4030)

(assert (=> b!502496 (= e!294316 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228414 (index!18310 lt!228415) (select (arr!15563 a!3235) j!176) a!3235 mask!3524) (Found!4030 j!176))))))

(declare-fun b!502497 () Bool)

(assert (=> b!502497 (= e!294318 e!294324)))

(declare-fun res!303898 () Bool)

(assert (=> b!502497 (=> (not res!303898) (not e!294324))))

(declare-fun lt!228407 () SeekEntryResult!4030)

(assert (=> b!502497 (= res!303898 (or (= lt!228407 (MissingZero!4030 i!1204)) (= lt!228407 (MissingVacant!4030 i!1204))))))

(assert (=> b!502497 (= lt!228407 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!502498 () Bool)

(declare-fun res!303904 () Bool)

(assert (=> b!502498 (=> (not res!303904) (not e!294318))))

(assert (=> b!502498 (= res!303904 (validKeyInArray!0 k!2280))))

(declare-fun b!502499 () Bool)

(assert (=> b!502499 (= e!294321 true)))

(declare-fun lt!228412 () SeekEntryResult!4030)

(assert (=> b!502499 (= lt!228412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228414 lt!228413 lt!228411 mask!3524))))

(assert (= (and start!45610 res!303902) b!502490))

(assert (= (and b!502490 res!303908) b!502495))

(assert (= (and b!502495 res!303897) b!502498))

(assert (= (and b!502498 res!303904) b!502491))

(assert (= (and b!502491 res!303903) b!502497))

(assert (= (and b!502497 res!303898) b!502492))

(assert (= (and b!502492 res!303896) b!502484))

(assert (= (and b!502484 res!303900) b!502489))

(assert (= (and b!502489 res!303906) b!502494))

(assert (= (and b!502489 (not res!303905)) b!502483))

(assert (= (and b!502483 (not res!303895)) b!502485))

(assert (= (and b!502485 c!59573) b!502486))

(assert (= (and b!502485 (not c!59573)) b!502487))

(assert (= (and b!502486 res!303907) b!502488))

(assert (= (and b!502485 (not res!303901)) b!502493))

(assert (= (and b!502493 res!303894) b!502496))

(assert (= (and b!502493 (not res!303899)) b!502499))

(declare-fun m!483413 () Bool)

(assert (=> b!502489 m!483413))

(declare-fun m!483415 () Bool)

(assert (=> b!502489 m!483415))

(declare-fun m!483417 () Bool)

(assert (=> b!502489 m!483417))

(declare-fun m!483419 () Bool)

(assert (=> b!502489 m!483419))

(declare-fun m!483421 () Bool)

(assert (=> b!502489 m!483421))

(declare-fun m!483423 () Bool)

(assert (=> b!502489 m!483423))

(assert (=> b!502489 m!483421))

(declare-fun m!483425 () Bool)

(assert (=> b!502489 m!483425))

(assert (=> b!502489 m!483421))

(declare-fun m!483427 () Bool)

(assert (=> b!502489 m!483427))

(declare-fun m!483429 () Bool)

(assert (=> b!502489 m!483429))

(assert (=> b!502495 m!483421))

(assert (=> b!502495 m!483421))

(declare-fun m!483431 () Bool)

(assert (=> b!502495 m!483431))

(declare-fun m!483433 () Bool)

(assert (=> b!502492 m!483433))

(assert (=> b!502496 m!483421))

(assert (=> b!502496 m!483421))

(declare-fun m!483435 () Bool)

(assert (=> b!502496 m!483435))

(declare-fun m!483437 () Bool)

(assert (=> b!502486 m!483437))

(declare-fun m!483439 () Bool)

(assert (=> b!502486 m!483439))

(declare-fun m!483441 () Bool)

(assert (=> b!502491 m!483441))

(declare-fun m!483443 () Bool)

(assert (=> b!502485 m!483443))

(declare-fun m!483445 () Bool)

(assert (=> b!502485 m!483445))

(assert (=> b!502485 m!483421))

(declare-fun m!483447 () Bool)

(assert (=> b!502497 m!483447))

(declare-fun m!483449 () Bool)

(assert (=> start!45610 m!483449))

(declare-fun m!483451 () Bool)

(assert (=> start!45610 m!483451))

(assert (=> b!502494 m!483421))

(assert (=> b!502494 m!483421))

(declare-fun m!483453 () Bool)

(assert (=> b!502494 m!483453))

(declare-fun m!483455 () Bool)

(assert (=> b!502498 m!483455))

(declare-fun m!483457 () Bool)

(assert (=> b!502484 m!483457))

(assert (=> b!502499 m!483439))

(push 1)

(assert (not b!502496))

(assert (not b!502497))

(assert (not b!502498))

(assert (not b!502484))

(assert (not b!502491))

(assert (not b!502492))

(assert (not b!502486))

(assert (not b!502489))

(assert (not b!502499))

(assert (not b!502485))

(assert (not start!45610))

(assert (not b!502495))

(assert (not b!502494))

(check-sat)

