; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86940 () Bool)

(assert start!86940)

(declare-fun b!1008465 () Bool)

(declare-fun res!677487 () Bool)

(declare-fun e!567391 () Bool)

(assert (=> b!1008465 (=> (not res!677487) (not e!567391))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((array!63535 0))(
  ( (array!63536 (arr!30588 (Array (_ BitVec 32) (_ BitVec 64))) (size!31092 (_ BitVec 32))) )
))
(declare-fun lt!445592 () array!63535)

(declare-datatypes ((SeekEntryResult!9545 0))(
  ( (MissingZero!9545 (index!40551 (_ BitVec 32))) (Found!9545 (index!40552 (_ BitVec 32))) (Intermediate!9545 (undefined!10357 Bool) (index!40553 (_ BitVec 32)) (x!87954 (_ BitVec 32))) (Undefined!9545) (MissingVacant!9545 (index!40554 (_ BitVec 32))) )
))
(declare-fun lt!445589 () SeekEntryResult!9545)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!445594 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63535 (_ BitVec 32)) SeekEntryResult!9545)

(assert (=> b!1008465 (= res!677487 (not (= lt!445589 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445594 lt!445592 mask!3464))))))

(declare-fun b!1008466 () Bool)

(declare-fun e!567387 () Bool)

(assert (=> b!1008466 (= e!567387 e!567391)))

(declare-fun res!677494 () Bool)

(assert (=> b!1008466 (=> (not res!677494) (not e!567391))))

(declare-fun lt!445591 () SeekEntryResult!9545)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008466 (= res!677494 (not (= lt!445591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445594 mask!3464) lt!445594 lt!445592 mask!3464))))))

(declare-fun a!3219 () array!63535)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1008466 (= lt!445594 (select (store (arr!30588 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1008466 (= lt!445592 (array!63536 (store (arr!30588 a!3219) i!1194 k0!2224) (size!31092 a!3219)))))

(declare-fun res!677486 () Bool)

(declare-fun e!567388 () Bool)

(assert (=> start!86940 (=> (not res!677486) (not e!567388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86940 (= res!677486 (validMask!0 mask!3464))))

(assert (=> start!86940 e!567388))

(declare-fun array_inv!23731 (array!63535) Bool)

(assert (=> start!86940 (array_inv!23731 a!3219)))

(assert (=> start!86940 true))

(declare-fun b!1008467 () Bool)

(declare-fun res!677482 () Bool)

(assert (=> b!1008467 (=> (not res!677482) (not e!567388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008467 (= res!677482 (validKeyInArray!0 (select (arr!30588 a!3219) j!170)))))

(declare-fun b!1008468 () Bool)

(declare-fun res!677491 () Bool)

(declare-fun e!567389 () Bool)

(assert (=> b!1008468 (=> (not res!677491) (not e!567389))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008468 (= res!677491 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31092 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31092 a!3219))))))

(declare-fun b!1008469 () Bool)

(declare-fun res!677493 () Bool)

(assert (=> b!1008469 (=> (not res!677493) (not e!567391))))

(assert (=> b!1008469 (= res!677493 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008470 () Bool)

(assert (=> b!1008470 (= e!567391 false)))

(declare-fun lt!445588 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008470 (= lt!445588 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008471 () Bool)

(declare-fun res!677490 () Bool)

(assert (=> b!1008471 (=> (not res!677490) (not e!567388))))

(assert (=> b!1008471 (= res!677490 (validKeyInArray!0 k0!2224))))

(declare-fun b!1008472 () Bool)

(declare-fun e!567390 () Bool)

(assert (=> b!1008472 (= e!567389 e!567390)))

(declare-fun res!677484 () Bool)

(assert (=> b!1008472 (=> (not res!677484) (not e!567390))))

(declare-fun lt!445590 () SeekEntryResult!9545)

(assert (=> b!1008472 (= res!677484 (= lt!445591 lt!445590))))

(assert (=> b!1008472 (= lt!445590 (Intermediate!9545 false resIndex!38 resX!38))))

(assert (=> b!1008472 (= lt!445591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30588 a!3219) j!170) mask!3464) (select (arr!30588 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008473 () Bool)

(declare-fun res!677492 () Bool)

(assert (=> b!1008473 (=> (not res!677492) (not e!567389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63535 (_ BitVec 32)) Bool)

(assert (=> b!1008473 (= res!677492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008474 () Bool)

(declare-fun res!677488 () Bool)

(assert (=> b!1008474 (=> (not res!677488) (not e!567388))))

(assert (=> b!1008474 (= res!677488 (and (= (size!31092 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31092 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31092 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008475 () Bool)

(declare-fun res!677495 () Bool)

(assert (=> b!1008475 (=> (not res!677495) (not e!567388))))

(declare-fun arrayContainsKey!0 (array!63535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008475 (= res!677495 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008476 () Bool)

(declare-fun res!677483 () Bool)

(assert (=> b!1008476 (=> (not res!677483) (not e!567389))))

(declare-datatypes ((List!21330 0))(
  ( (Nil!21327) (Cons!21326 (h!22512 (_ BitVec 64)) (t!30322 List!21330)) )
))
(declare-fun arrayNoDuplicates!0 (array!63535 (_ BitVec 32) List!21330) Bool)

(assert (=> b!1008476 (= res!677483 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21327))))

(declare-fun b!1008477 () Bool)

(assert (=> b!1008477 (= e!567388 e!567389)))

(declare-fun res!677489 () Bool)

(assert (=> b!1008477 (=> (not res!677489) (not e!567389))))

(declare-fun lt!445593 () SeekEntryResult!9545)

(assert (=> b!1008477 (= res!677489 (or (= lt!445593 (MissingVacant!9545 i!1194)) (= lt!445593 (MissingZero!9545 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63535 (_ BitVec 32)) SeekEntryResult!9545)

(assert (=> b!1008477 (= lt!445593 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1008478 () Bool)

(assert (=> b!1008478 (= e!567390 e!567387)))

(declare-fun res!677485 () Bool)

(assert (=> b!1008478 (=> (not res!677485) (not e!567387))))

(assert (=> b!1008478 (= res!677485 (= lt!445589 lt!445590))))

(assert (=> b!1008478 (= lt!445589 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30588 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86940 res!677486) b!1008474))

(assert (= (and b!1008474 res!677488) b!1008467))

(assert (= (and b!1008467 res!677482) b!1008471))

(assert (= (and b!1008471 res!677490) b!1008475))

(assert (= (and b!1008475 res!677495) b!1008477))

(assert (= (and b!1008477 res!677489) b!1008473))

(assert (= (and b!1008473 res!677492) b!1008476))

(assert (= (and b!1008476 res!677483) b!1008468))

(assert (= (and b!1008468 res!677491) b!1008472))

(assert (= (and b!1008472 res!677484) b!1008478))

(assert (= (and b!1008478 res!677485) b!1008466))

(assert (= (and b!1008466 res!677494) b!1008465))

(assert (= (and b!1008465 res!677487) b!1008469))

(assert (= (and b!1008469 res!677493) b!1008470))

(declare-fun m!932665 () Bool)

(assert (=> b!1008471 m!932665))

(declare-fun m!932667 () Bool)

(assert (=> b!1008477 m!932667))

(declare-fun m!932669 () Bool)

(assert (=> b!1008466 m!932669))

(assert (=> b!1008466 m!932669))

(declare-fun m!932671 () Bool)

(assert (=> b!1008466 m!932671))

(declare-fun m!932673 () Bool)

(assert (=> b!1008466 m!932673))

(declare-fun m!932675 () Bool)

(assert (=> b!1008466 m!932675))

(declare-fun m!932677 () Bool)

(assert (=> b!1008465 m!932677))

(declare-fun m!932679 () Bool)

(assert (=> b!1008478 m!932679))

(assert (=> b!1008478 m!932679))

(declare-fun m!932681 () Bool)

(assert (=> b!1008478 m!932681))

(declare-fun m!932683 () Bool)

(assert (=> b!1008475 m!932683))

(assert (=> b!1008472 m!932679))

(assert (=> b!1008472 m!932679))

(declare-fun m!932685 () Bool)

(assert (=> b!1008472 m!932685))

(assert (=> b!1008472 m!932685))

(assert (=> b!1008472 m!932679))

(declare-fun m!932687 () Bool)

(assert (=> b!1008472 m!932687))

(assert (=> b!1008467 m!932679))

(assert (=> b!1008467 m!932679))

(declare-fun m!932689 () Bool)

(assert (=> b!1008467 m!932689))

(declare-fun m!932691 () Bool)

(assert (=> b!1008470 m!932691))

(declare-fun m!932693 () Bool)

(assert (=> b!1008476 m!932693))

(declare-fun m!932695 () Bool)

(assert (=> b!1008473 m!932695))

(declare-fun m!932697 () Bool)

(assert (=> start!86940 m!932697))

(declare-fun m!932699 () Bool)

(assert (=> start!86940 m!932699))

(check-sat (not b!1008470) (not b!1008478) (not b!1008471) (not start!86940) (not b!1008476) (not b!1008465) (not b!1008466) (not b!1008473) (not b!1008475) (not b!1008467) (not b!1008477) (not b!1008472))
(check-sat)
