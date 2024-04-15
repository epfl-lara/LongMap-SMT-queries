; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30906 () Bool)

(assert start!30906)

(declare-fun b!310062 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun e!193595 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310062 (= e!193595 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-fun e!193593 () Bool)

(assert (=> b!310062 e!193593))

(declare-fun res!166671 () Bool)

(assert (=> b!310062 (=> (not res!166671) (not e!193593))))

(declare-fun lt!151681 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2627 0))(
  ( (MissingZero!2627 (index!12684 (_ BitVec 32))) (Found!2627 (index!12685 (_ BitVec 32))) (Intermediate!2627 (undefined!3439 Bool) (index!12686 (_ BitVec 32)) (x!30931 (_ BitVec 32))) (Undefined!2627) (MissingVacant!2627 (index!12687 (_ BitVec 32))) )
))
(declare-fun lt!151680 () SeekEntryResult!2627)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((array!15812 0))(
  ( (array!15813 (arr!7488 (Array (_ BitVec 32) (_ BitVec 64))) (size!7841 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15812)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15812 (_ BitVec 32)) SeekEntryResult!2627)

(assert (=> b!310062 (= res!166671 (= lt!151680 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151681 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310062 (= lt!151681 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310063 () Bool)

(declare-fun res!166668 () Bool)

(declare-fun e!193594 () Bool)

(assert (=> b!310063 (=> (not res!166668) (not e!193594))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310063 (= res!166668 (and (= (select (arr!7488 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7841 a!3293))))))

(declare-fun b!310064 () Bool)

(declare-fun res!166663 () Bool)

(declare-fun e!193591 () Bool)

(assert (=> b!310064 (=> (not res!166663) (not e!193591))))

(assert (=> b!310064 (= res!166663 (and (= (size!7841 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7841 a!3293))))))

(declare-fun b!310065 () Bool)

(assert (=> b!310065 (= e!193591 e!193594)))

(declare-fun res!166666 () Bool)

(assert (=> b!310065 (=> (not res!166666) (not e!193594))))

(declare-fun lt!151679 () SeekEntryResult!2627)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310065 (= res!166666 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151679))))

(assert (=> b!310065 (= lt!151679 (Intermediate!2627 false resIndex!52 resX!52))))

(declare-fun b!310066 () Bool)

(declare-fun res!166662 () Bool)

(assert (=> b!310066 (=> (not res!166662) (not e!193591))))

(declare-fun arrayContainsKey!0 (array!15812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310066 (= res!166662 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!166665 () Bool)

(assert (=> start!30906 (=> (not res!166665) (not e!193591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30906 (= res!166665 (validMask!0 mask!3709))))

(assert (=> start!30906 e!193591))

(declare-fun array_inv!5460 (array!15812) Bool)

(assert (=> start!30906 (array_inv!5460 a!3293)))

(assert (=> start!30906 true))

(declare-fun b!310067 () Bool)

(assert (=> b!310067 (= e!193594 e!193595)))

(declare-fun res!166669 () Bool)

(assert (=> b!310067 (=> (not res!166669) (not e!193595))))

(assert (=> b!310067 (= res!166669 (and (= lt!151680 lt!151679) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7488 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310067 (= lt!151680 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310068 () Bool)

(declare-fun res!166670 () Bool)

(assert (=> b!310068 (=> (not res!166670) (not e!193591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15812 (_ BitVec 32)) Bool)

(assert (=> b!310068 (= res!166670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310069 () Bool)

(declare-fun lt!151682 () array!15812)

(assert (=> b!310069 (= e!193593 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151682 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151681 k0!2441 lt!151682 mask!3709)))))

(assert (=> b!310069 (= lt!151682 (array!15813 (store (arr!7488 a!3293) i!1240 k0!2441) (size!7841 a!3293)))))

(declare-fun b!310070 () Bool)

(declare-fun res!166664 () Bool)

(assert (=> b!310070 (=> (not res!166664) (not e!193591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310070 (= res!166664 (validKeyInArray!0 k0!2441))))

(declare-fun b!310071 () Bool)

(declare-fun res!166667 () Bool)

(assert (=> b!310071 (=> (not res!166667) (not e!193591))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15812 (_ BitVec 32)) SeekEntryResult!2627)

(assert (=> b!310071 (= res!166667 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2627 i!1240)))))

(assert (= (and start!30906 res!166665) b!310064))

(assert (= (and b!310064 res!166663) b!310070))

(assert (= (and b!310070 res!166664) b!310066))

(assert (= (and b!310066 res!166662) b!310071))

(assert (= (and b!310071 res!166667) b!310068))

(assert (= (and b!310068 res!166670) b!310065))

(assert (= (and b!310065 res!166666) b!310063))

(assert (= (and b!310063 res!166668) b!310067))

(assert (= (and b!310067 res!166669) b!310062))

(assert (= (and b!310062 res!166671) b!310069))

(declare-fun m!319507 () Bool)

(assert (=> b!310069 m!319507))

(declare-fun m!319509 () Bool)

(assert (=> b!310069 m!319509))

(declare-fun m!319511 () Bool)

(assert (=> b!310069 m!319511))

(declare-fun m!319513 () Bool)

(assert (=> b!310066 m!319513))

(declare-fun m!319515 () Bool)

(assert (=> b!310065 m!319515))

(assert (=> b!310065 m!319515))

(declare-fun m!319517 () Bool)

(assert (=> b!310065 m!319517))

(declare-fun m!319519 () Bool)

(assert (=> start!30906 m!319519))

(declare-fun m!319521 () Bool)

(assert (=> start!30906 m!319521))

(declare-fun m!319523 () Bool)

(assert (=> b!310071 m!319523))

(declare-fun m!319525 () Bool)

(assert (=> b!310063 m!319525))

(declare-fun m!319527 () Bool)

(assert (=> b!310068 m!319527))

(declare-fun m!319529 () Bool)

(assert (=> b!310062 m!319529))

(declare-fun m!319531 () Bool)

(assert (=> b!310062 m!319531))

(declare-fun m!319533 () Bool)

(assert (=> b!310070 m!319533))

(declare-fun m!319535 () Bool)

(assert (=> b!310067 m!319535))

(declare-fun m!319537 () Bool)

(assert (=> b!310067 m!319537))

(check-sat (not start!30906) (not b!310067) (not b!310065) (not b!310070) (not b!310071) (not b!310062) (not b!310068) (not b!310066) (not b!310069))
(check-sat)
