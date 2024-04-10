; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30526 () Bool)

(assert start!30526)

(declare-fun b!305430 () Bool)

(declare-fun res!162621 () Bool)

(declare-fun e!191815 () Bool)

(assert (=> b!305430 (=> (not res!162621) (not e!191815))))

(declare-datatypes ((array!15530 0))(
  ( (array!15531 (arr!7350 (Array (_ BitVec 32) (_ BitVec 64))) (size!7702 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15530)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305430 (= res!162621 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305431 () Bool)

(declare-fun res!162620 () Bool)

(assert (=> b!305431 (=> (not res!162620) (not e!191815))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15530 (_ BitVec 32)) Bool)

(assert (=> b!305431 (= res!162620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305432 () Bool)

(declare-fun res!162623 () Bool)

(declare-fun e!191817 () Bool)

(assert (=> b!305432 (=> (not res!162623) (not e!191817))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305432 (= res!162623 (and (= (select (arr!7350 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7702 a!3293))))))

(declare-fun b!305433 () Bool)

(declare-fun res!162624 () Bool)

(assert (=> b!305433 (=> (not res!162624) (not e!191815))))

(declare-datatypes ((SeekEntryResult!2490 0))(
  ( (MissingZero!2490 (index!12136 (_ BitVec 32))) (Found!2490 (index!12137 (_ BitVec 32))) (Intermediate!2490 (undefined!3302 Bool) (index!12138 (_ BitVec 32)) (x!30397 (_ BitVec 32))) (Undefined!2490) (MissingVacant!2490 (index!12139 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15530 (_ BitVec 32)) SeekEntryResult!2490)

(assert (=> b!305433 (= res!162624 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2490 i!1240)))))

(declare-fun b!305434 () Bool)

(declare-fun e!191818 () Bool)

(assert (=> b!305434 (= e!191818 (not true))))

(declare-fun lt!150747 () SeekEntryResult!2490)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15530 (_ BitVec 32)) SeekEntryResult!2490)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305434 (= lt!150747 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun res!162617 () Bool)

(assert (=> start!30526 (=> (not res!162617) (not e!191815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30526 (= res!162617 (validMask!0 mask!3709))))

(assert (=> start!30526 e!191815))

(declare-fun array_inv!5313 (array!15530) Bool)

(assert (=> start!30526 (array_inv!5313 a!3293)))

(assert (=> start!30526 true))

(declare-fun b!305435 () Bool)

(assert (=> b!305435 (= e!191815 e!191817)))

(declare-fun res!162616 () Bool)

(assert (=> b!305435 (=> (not res!162616) (not e!191817))))

(declare-fun lt!150746 () SeekEntryResult!2490)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305435 (= res!162616 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150746))))

(assert (=> b!305435 (= lt!150746 (Intermediate!2490 false resIndex!52 resX!52))))

(declare-fun b!305436 () Bool)

(assert (=> b!305436 (= e!191817 e!191818)))

(declare-fun res!162619 () Bool)

(assert (=> b!305436 (=> (not res!162619) (not e!191818))))

(assert (=> b!305436 (= res!162619 (and (= lt!150747 lt!150746) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7350 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7350 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7350 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!305436 (= lt!150747 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!305437 () Bool)

(declare-fun res!162622 () Bool)

(assert (=> b!305437 (=> (not res!162622) (not e!191815))))

(assert (=> b!305437 (= res!162622 (and (= (size!7702 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7702 a!3293))))))

(declare-fun b!305438 () Bool)

(declare-fun res!162618 () Bool)

(assert (=> b!305438 (=> (not res!162618) (not e!191815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305438 (= res!162618 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30526 res!162617) b!305437))

(assert (= (and b!305437 res!162622) b!305438))

(assert (= (and b!305438 res!162618) b!305430))

(assert (= (and b!305430 res!162621) b!305433))

(assert (= (and b!305433 res!162624) b!305431))

(assert (= (and b!305431 res!162620) b!305435))

(assert (= (and b!305435 res!162616) b!305432))

(assert (= (and b!305432 res!162623) b!305436))

(assert (= (and b!305436 res!162619) b!305434))

(declare-fun m!316393 () Bool)

(assert (=> b!305432 m!316393))

(declare-fun m!316395 () Bool)

(assert (=> b!305435 m!316395))

(assert (=> b!305435 m!316395))

(declare-fun m!316397 () Bool)

(assert (=> b!305435 m!316397))

(declare-fun m!316399 () Bool)

(assert (=> b!305430 m!316399))

(declare-fun m!316401 () Bool)

(assert (=> b!305438 m!316401))

(declare-fun m!316403 () Bool)

(assert (=> b!305434 m!316403))

(assert (=> b!305434 m!316403))

(declare-fun m!316405 () Bool)

(assert (=> b!305434 m!316405))

(declare-fun m!316407 () Bool)

(assert (=> start!30526 m!316407))

(declare-fun m!316409 () Bool)

(assert (=> start!30526 m!316409))

(declare-fun m!316411 () Bool)

(assert (=> b!305433 m!316411))

(declare-fun m!316413 () Bool)

(assert (=> b!305436 m!316413))

(declare-fun m!316415 () Bool)

(assert (=> b!305436 m!316415))

(declare-fun m!316417 () Bool)

(assert (=> b!305431 m!316417))

(check-sat (not b!305436) (not b!305433) (not b!305435) (not start!30526) (not b!305434) (not b!305431) (not b!305438) (not b!305430))
(check-sat)
