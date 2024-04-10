; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30538 () Bool)

(assert start!30538)

(declare-fun b!305662 () Bool)

(declare-datatypes ((Unit!9421 0))(
  ( (Unit!9422) )
))
(declare-fun e!191905 () Unit!9421)

(declare-fun Unit!9423 () Unit!9421)

(assert (=> b!305662 (= e!191905 Unit!9423)))

(declare-fun b!305663 () Bool)

(declare-fun res!162801 () Bool)

(declare-fun e!191903 () Bool)

(assert (=> b!305663 (=> (not res!162801) (not e!191903))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305663 (= res!162801 (validKeyInArray!0 k0!2441))))

(declare-fun b!305664 () Bool)

(assert (=> b!305664 false))

(declare-fun e!191904 () Unit!9421)

(declare-fun Unit!9424 () Unit!9421)

(assert (=> b!305664 (= e!191904 Unit!9424)))

(declare-fun b!305665 () Bool)

(declare-fun e!191901 () Bool)

(assert (=> b!305665 (= e!191903 e!191901)))

(declare-fun res!162798 () Bool)

(assert (=> b!305665 (=> (not res!162798) (not e!191901))))

(declare-datatypes ((array!15542 0))(
  ( (array!15543 (arr!7356 (Array (_ BitVec 32) (_ BitVec 64))) (size!7708 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15542)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2496 0))(
  ( (MissingZero!2496 (index!12160 (_ BitVec 32))) (Found!2496 (index!12161 (_ BitVec 32))) (Intermediate!2496 (undefined!3308 Bool) (index!12162 (_ BitVec 32)) (x!30419 (_ BitVec 32))) (Undefined!2496) (MissingVacant!2496 (index!12163 (_ BitVec 32))) )
))
(declare-fun lt!150798 () SeekEntryResult!2496)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15542 (_ BitVec 32)) SeekEntryResult!2496)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305665 (= res!162798 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150798))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!305665 (= lt!150798 (Intermediate!2496 false resIndex!52 resX!52))))

(declare-fun b!305666 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305666 (= e!191901 (not (or (not (= (select (arr!7356 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000))))))

(assert (=> b!305666 (= index!1781 resIndex!52)))

(declare-fun lt!150796 () Unit!9421)

(assert (=> b!305666 (= lt!150796 e!191905)))

(declare-fun c!49037 () Bool)

(assert (=> b!305666 (= c!49037 (not (= resIndex!52 index!1781)))))

(declare-fun b!305667 () Bool)

(assert (=> b!305667 false))

(declare-fun lt!150797 () SeekEntryResult!2496)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305667 (= lt!150797 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9425 () Unit!9421)

(assert (=> b!305667 (= e!191904 Unit!9425)))

(declare-fun res!162797 () Bool)

(assert (=> start!30538 (=> (not res!162797) (not e!191903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30538 (= res!162797 (validMask!0 mask!3709))))

(assert (=> start!30538 e!191903))

(declare-fun array_inv!5319 (array!15542) Bool)

(assert (=> start!30538 (array_inv!5319 a!3293)))

(assert (=> start!30538 true))

(declare-fun b!305668 () Bool)

(declare-fun res!162793 () Bool)

(assert (=> b!305668 (=> (not res!162793) (not e!191903))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15542 (_ BitVec 32)) SeekEntryResult!2496)

(assert (=> b!305668 (= res!162793 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2496 i!1240)))))

(declare-fun b!305669 () Bool)

(declare-fun res!162796 () Bool)

(assert (=> b!305669 (=> (not res!162796) (not e!191903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15542 (_ BitVec 32)) Bool)

(assert (=> b!305669 (= res!162796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305670 () Bool)

(assert (=> b!305670 (= e!191905 e!191904)))

(declare-fun c!49038 () Bool)

(assert (=> b!305670 (= c!49038 (or (= (select (arr!7356 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7356 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305671 () Bool)

(declare-fun res!162800 () Bool)

(assert (=> b!305671 (=> (not res!162800) (not e!191901))))

(assert (=> b!305671 (= res!162800 (and (= (select (arr!7356 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7708 a!3293))))))

(declare-fun b!305672 () Bool)

(declare-fun res!162792 () Bool)

(assert (=> b!305672 (=> (not res!162792) (not e!191901))))

(assert (=> b!305672 (= res!162792 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150798))))

(declare-fun b!305673 () Bool)

(declare-fun res!162795 () Bool)

(assert (=> b!305673 (=> (not res!162795) (not e!191903))))

(declare-fun arrayContainsKey!0 (array!15542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305673 (= res!162795 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305674 () Bool)

(declare-fun res!162794 () Bool)

(assert (=> b!305674 (=> (not res!162794) (not e!191901))))

(assert (=> b!305674 (= res!162794 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7356 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!305675 () Bool)

(declare-fun res!162799 () Bool)

(assert (=> b!305675 (=> (not res!162799) (not e!191903))))

(assert (=> b!305675 (= res!162799 (and (= (size!7708 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7708 a!3293))))))

(assert (= (and start!30538 res!162797) b!305675))

(assert (= (and b!305675 res!162799) b!305663))

(assert (= (and b!305663 res!162801) b!305673))

(assert (= (and b!305673 res!162795) b!305668))

(assert (= (and b!305668 res!162793) b!305669))

(assert (= (and b!305669 res!162796) b!305665))

(assert (= (and b!305665 res!162798) b!305671))

(assert (= (and b!305671 res!162800) b!305672))

(assert (= (and b!305672 res!162792) b!305674))

(assert (= (and b!305674 res!162794) b!305666))

(assert (= (and b!305666 c!49037) b!305670))

(assert (= (and b!305666 (not c!49037)) b!305662))

(assert (= (and b!305670 c!49038) b!305664))

(assert (= (and b!305670 (not c!49038)) b!305667))

(declare-fun m!316549 () Bool)

(assert (=> b!305663 m!316549))

(declare-fun m!316551 () Bool)

(assert (=> start!30538 m!316551))

(declare-fun m!316553 () Bool)

(assert (=> start!30538 m!316553))

(declare-fun m!316555 () Bool)

(assert (=> b!305669 m!316555))

(declare-fun m!316557 () Bool)

(assert (=> b!305666 m!316557))

(declare-fun m!316559 () Bool)

(assert (=> b!305665 m!316559))

(assert (=> b!305665 m!316559))

(declare-fun m!316561 () Bool)

(assert (=> b!305665 m!316561))

(declare-fun m!316563 () Bool)

(assert (=> b!305673 m!316563))

(assert (=> b!305670 m!316557))

(declare-fun m!316565 () Bool)

(assert (=> b!305668 m!316565))

(declare-fun m!316567 () Bool)

(assert (=> b!305667 m!316567))

(assert (=> b!305667 m!316567))

(declare-fun m!316569 () Bool)

(assert (=> b!305667 m!316569))

(declare-fun m!316571 () Bool)

(assert (=> b!305671 m!316571))

(declare-fun m!316573 () Bool)

(assert (=> b!305672 m!316573))

(assert (=> b!305674 m!316557))

(check-sat (not b!305673) (not b!305663) (not b!305669) (not start!30538) (not b!305672) (not b!305668) (not b!305667) (not b!305665))
(check-sat)
