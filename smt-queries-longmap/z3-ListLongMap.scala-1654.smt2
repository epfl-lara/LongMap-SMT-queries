; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30744 () Bool)

(assert start!30744)

(declare-fun res!165222 () Bool)

(declare-fun e!192912 () Bool)

(assert (=> start!30744 (=> (not res!165222) (not e!192912))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30744 (= res!165222 (validMask!0 mask!3709))))

(assert (=> start!30744 e!192912))

(declare-datatypes ((array!15710 0))(
  ( (array!15711 (arr!7438 (Array (_ BitVec 32) (_ BitVec 64))) (size!7790 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15710)

(declare-fun array_inv!5388 (array!15710) Bool)

(assert (=> start!30744 (array_inv!5388 a!3293)))

(assert (=> start!30744 true))

(declare-fun b!308554 () Bool)

(declare-fun e!192911 () Bool)

(assert (=> b!308554 (= e!192912 e!192911)))

(declare-fun res!165218 () Bool)

(assert (=> b!308554 (=> (not res!165218) (not e!192911))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2543 0))(
  ( (MissingZero!2543 (index!12348 (_ BitVec 32))) (Found!2543 (index!12349 (_ BitVec 32))) (Intermediate!2543 (undefined!3355 Bool) (index!12350 (_ BitVec 32)) (x!30696 (_ BitVec 32))) (Undefined!2543) (MissingVacant!2543 (index!12351 (_ BitVec 32))) )
))
(declare-fun lt!151421 () SeekEntryResult!2543)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15710 (_ BitVec 32)) SeekEntryResult!2543)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308554 (= res!165218 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151421))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308554 (= lt!151421 (Intermediate!2543 false resIndex!52 resX!52))))

(declare-fun b!308555 () Bool)

(declare-fun res!165217 () Bool)

(assert (=> b!308555 (=> (not res!165217) (not e!192912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15710 (_ BitVec 32)) Bool)

(assert (=> b!308555 (= res!165217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308556 () Bool)

(declare-fun res!165225 () Bool)

(assert (=> b!308556 (=> (not res!165225) (not e!192912))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15710 (_ BitVec 32)) SeekEntryResult!2543)

(assert (=> b!308556 (= res!165225 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2543 i!1240)))))

(declare-fun b!308557 () Bool)

(declare-fun res!165224 () Bool)

(assert (=> b!308557 (=> (not res!165224) (not e!192912))))

(assert (=> b!308557 (= res!165224 (and (= (size!7790 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7790 a!3293))))))

(declare-fun b!308558 () Bool)

(declare-fun res!165219 () Bool)

(assert (=> b!308558 (=> (not res!165219) (not e!192911))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308558 (= res!165219 (and (= (select (arr!7438 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7790 a!3293))))))

(declare-fun b!308559 () Bool)

(declare-fun res!165221 () Bool)

(assert (=> b!308559 (=> (not res!165221) (not e!192912))))

(declare-fun arrayContainsKey!0 (array!15710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308559 (= res!165221 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308560 () Bool)

(declare-fun e!192910 () Bool)

(assert (=> b!308560 (= e!192910 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun lt!151422 () SeekEntryResult!2543)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308560 (= lt!151422 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308561 () Bool)

(assert (=> b!308561 (= e!192911 e!192910)))

(declare-fun res!165220 () Bool)

(assert (=> b!308561 (=> (not res!165220) (not e!192910))))

(assert (=> b!308561 (= res!165220 (and (= lt!151422 lt!151421) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7438 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308561 (= lt!151422 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308562 () Bool)

(declare-fun res!165223 () Bool)

(assert (=> b!308562 (=> (not res!165223) (not e!192912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308562 (= res!165223 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30744 res!165222) b!308557))

(assert (= (and b!308557 res!165224) b!308562))

(assert (= (and b!308562 res!165223) b!308559))

(assert (= (and b!308559 res!165221) b!308556))

(assert (= (and b!308556 res!165225) b!308555))

(assert (= (and b!308555 res!165217) b!308554))

(assert (= (and b!308554 res!165218) b!308558))

(assert (= (and b!308558 res!165219) b!308561))

(assert (= (and b!308561 res!165220) b!308560))

(declare-fun m!318769 () Bool)

(assert (=> b!308561 m!318769))

(declare-fun m!318771 () Bool)

(assert (=> b!308561 m!318771))

(declare-fun m!318773 () Bool)

(assert (=> b!308559 m!318773))

(declare-fun m!318775 () Bool)

(assert (=> b!308554 m!318775))

(assert (=> b!308554 m!318775))

(declare-fun m!318777 () Bool)

(assert (=> b!308554 m!318777))

(declare-fun m!318779 () Bool)

(assert (=> b!308560 m!318779))

(assert (=> b!308560 m!318779))

(declare-fun m!318781 () Bool)

(assert (=> b!308560 m!318781))

(declare-fun m!318783 () Bool)

(assert (=> b!308556 m!318783))

(declare-fun m!318785 () Bool)

(assert (=> start!30744 m!318785))

(declare-fun m!318787 () Bool)

(assert (=> start!30744 m!318787))

(declare-fun m!318789 () Bool)

(assert (=> b!308558 m!318789))

(declare-fun m!318791 () Bool)

(assert (=> b!308562 m!318791))

(declare-fun m!318793 () Bool)

(assert (=> b!308555 m!318793))

(check-sat (not b!308555) (not b!308562) (not b!308554) (not b!308556) (not b!308561) (not b!308559) (not start!30744) (not b!308560))
(check-sat)
