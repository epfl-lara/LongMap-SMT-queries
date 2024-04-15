; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30936 () Bool)

(assert start!30936)

(declare-fun b!310512 () Bool)

(declare-fun res!167116 () Bool)

(declare-fun e!193816 () Bool)

(assert (=> b!310512 (=> (not res!167116) (not e!193816))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310512 (= res!167116 (validKeyInArray!0 k0!2441))))

(declare-fun b!310513 () Bool)

(declare-fun e!193817 () Bool)

(assert (=> b!310513 (= e!193816 e!193817)))

(declare-fun res!167113 () Bool)

(assert (=> b!310513 (=> (not res!167113) (not e!193817))))

(declare-datatypes ((array!15842 0))(
  ( (array!15843 (arr!7503 (Array (_ BitVec 32) (_ BitVec 64))) (size!7856 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15842)

(declare-datatypes ((SeekEntryResult!2642 0))(
  ( (MissingZero!2642 (index!12744 (_ BitVec 32))) (Found!2642 (index!12745 (_ BitVec 32))) (Intermediate!2642 (undefined!3454 Bool) (index!12746 (_ BitVec 32)) (x!30986 (_ BitVec 32))) (Undefined!2642) (MissingVacant!2642 (index!12747 (_ BitVec 32))) )
))
(declare-fun lt!151862 () SeekEntryResult!2642)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15842 (_ BitVec 32)) SeekEntryResult!2642)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310513 (= res!167113 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151862))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310513 (= lt!151862 (Intermediate!2642 false resIndex!52 resX!52))))

(declare-fun b!310514 () Bool)

(declare-fun res!167121 () Bool)

(assert (=> b!310514 (=> (not res!167121) (not e!193817))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310514 (= res!167121 (and (= (select (arr!7503 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7856 a!3293))))))

(declare-fun b!310515 () Bool)

(declare-fun res!167119 () Bool)

(assert (=> b!310515 (=> (not res!167119) (not e!193816))))

(assert (=> b!310515 (= res!167119 (and (= (size!7856 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7856 a!3293))))))

(declare-fun b!310516 () Bool)

(declare-fun e!193819 () Bool)

(assert (=> b!310516 (= e!193817 e!193819)))

(declare-fun res!167112 () Bool)

(assert (=> b!310516 (=> (not res!167112) (not e!193819))))

(declare-fun lt!151859 () SeekEntryResult!2642)

(assert (=> b!310516 (= res!167112 (and (= lt!151859 lt!151862) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7503 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310516 (= lt!151859 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun e!193820 () Bool)

(declare-fun lt!151860 () (_ BitVec 32))

(declare-fun b!310517 () Bool)

(declare-fun lt!151861 () array!15842)

(assert (=> b!310517 (= e!193820 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151861 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151860 k0!2441 lt!151861 mask!3709)))))

(assert (=> b!310517 (= lt!151861 (array!15843 (store (arr!7503 a!3293) i!1240 k0!2441) (size!7856 a!3293)))))

(declare-fun res!167120 () Bool)

(assert (=> start!30936 (=> (not res!167120) (not e!193816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30936 (= res!167120 (validMask!0 mask!3709))))

(assert (=> start!30936 e!193816))

(declare-fun array_inv!5475 (array!15842) Bool)

(assert (=> start!30936 (array_inv!5475 a!3293)))

(assert (=> start!30936 true))

(declare-fun b!310518 () Bool)

(declare-fun res!167118 () Bool)

(assert (=> b!310518 (=> (not res!167118) (not e!193816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15842 (_ BitVec 32)) Bool)

(assert (=> b!310518 (= res!167118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310519 () Bool)

(declare-fun res!167115 () Bool)

(assert (=> b!310519 (=> (not res!167115) (not e!193816))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15842 (_ BitVec 32)) SeekEntryResult!2642)

(assert (=> b!310519 (= res!167115 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2642 i!1240)))))

(declare-fun b!310520 () Bool)

(declare-fun res!167114 () Bool)

(assert (=> b!310520 (=> (not res!167114) (not e!193816))))

(declare-fun arrayContainsKey!0 (array!15842 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310520 (= res!167114 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310521 () Bool)

(assert (=> b!310521 (= e!193819 (not true))))

(assert (=> b!310521 e!193820))

(declare-fun res!167117 () Bool)

(assert (=> b!310521 (=> (not res!167117) (not e!193820))))

(assert (=> b!310521 (= res!167117 (= lt!151859 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151860 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310521 (= lt!151860 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!30936 res!167120) b!310515))

(assert (= (and b!310515 res!167119) b!310512))

(assert (= (and b!310512 res!167116) b!310520))

(assert (= (and b!310520 res!167114) b!310519))

(assert (= (and b!310519 res!167115) b!310518))

(assert (= (and b!310518 res!167118) b!310513))

(assert (= (and b!310513 res!167113) b!310514))

(assert (= (and b!310514 res!167121) b!310516))

(assert (= (and b!310516 res!167112) b!310521))

(assert (= (and b!310521 res!167117) b!310517))

(declare-fun m!319987 () Bool)

(assert (=> b!310516 m!319987))

(declare-fun m!319989 () Bool)

(assert (=> b!310516 m!319989))

(declare-fun m!319991 () Bool)

(assert (=> b!310513 m!319991))

(assert (=> b!310513 m!319991))

(declare-fun m!319993 () Bool)

(assert (=> b!310513 m!319993))

(declare-fun m!319995 () Bool)

(assert (=> start!30936 m!319995))

(declare-fun m!319997 () Bool)

(assert (=> start!30936 m!319997))

(declare-fun m!319999 () Bool)

(assert (=> b!310519 m!319999))

(declare-fun m!320001 () Bool)

(assert (=> b!310514 m!320001))

(declare-fun m!320003 () Bool)

(assert (=> b!310518 m!320003))

(declare-fun m!320005 () Bool)

(assert (=> b!310512 m!320005))

(declare-fun m!320007 () Bool)

(assert (=> b!310521 m!320007))

(declare-fun m!320009 () Bool)

(assert (=> b!310521 m!320009))

(declare-fun m!320011 () Bool)

(assert (=> b!310520 m!320011))

(declare-fun m!320013 () Bool)

(assert (=> b!310517 m!320013))

(declare-fun m!320015 () Bool)

(assert (=> b!310517 m!320015))

(declare-fun m!320017 () Bool)

(assert (=> b!310517 m!320017))

(check-sat (not b!310521) (not b!310518) (not b!310516) (not b!310520) (not b!310517) (not b!310513) (not b!310512) (not start!30936) (not b!310519))
(check-sat)
