; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30636 () Bool)

(assert start!30636)

(declare-fun b!307333 () Bool)

(declare-fun res!164240 () Bool)

(declare-fun e!192383 () Bool)

(assert (=> b!307333 (=> (not res!164240) (not e!192383))))

(declare-datatypes ((array!15644 0))(
  ( (array!15645 (arr!7407 (Array (_ BitVec 32) (_ BitVec 64))) (size!7760 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15644)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307333 (= res!164240 (and (= (size!7760 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7760 a!3293))))))

(declare-fun res!164236 () Bool)

(assert (=> start!30636 (=> (not res!164236) (not e!192383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30636 (= res!164236 (validMask!0 mask!3709))))

(assert (=> start!30636 e!192383))

(declare-fun array_inv!5379 (array!15644) Bool)

(assert (=> start!30636 (array_inv!5379 a!3293)))

(assert (=> start!30636 true))

(declare-fun b!307334 () Bool)

(declare-fun res!164234 () Bool)

(declare-fun e!192382 () Bool)

(assert (=> b!307334 (=> (not res!164234) (not e!192382))))

(declare-datatypes ((SeekEntryResult!2546 0))(
  ( (MissingZero!2546 (index!12360 (_ BitVec 32))) (Found!2546 (index!12361 (_ BitVec 32))) (Intermediate!2546 (undefined!3358 Bool) (index!12362 (_ BitVec 32)) (x!30616 (_ BitVec 32))) (Undefined!2546) (MissingVacant!2546 (index!12363 (_ BitVec 32))) )
))
(declare-fun lt!150917 () SeekEntryResult!2546)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15644 (_ BitVec 32)) SeekEntryResult!2546)

(assert (=> b!307334 (= res!164234 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150917))))

(declare-fun b!307335 () Bool)

(declare-fun res!164241 () Bool)

(assert (=> b!307335 (=> (not res!164241) (not e!192383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307335 (= res!164241 (validKeyInArray!0 k0!2441))))

(declare-fun b!307336 () Bool)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307336 (= e!192382 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7407 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!307337 () Bool)

(declare-fun res!164233 () Bool)

(assert (=> b!307337 (=> (not res!164233) (not e!192383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15644 (_ BitVec 32)) Bool)

(assert (=> b!307337 (= res!164233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307338 () Bool)

(declare-fun res!164238 () Bool)

(assert (=> b!307338 (=> (not res!164238) (not e!192383))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15644 (_ BitVec 32)) SeekEntryResult!2546)

(assert (=> b!307338 (= res!164238 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2546 i!1240)))))

(declare-fun b!307339 () Bool)

(declare-fun res!164239 () Bool)

(assert (=> b!307339 (=> (not res!164239) (not e!192382))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!307339 (= res!164239 (and (= (select (arr!7407 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7760 a!3293))))))

(declare-fun b!307340 () Bool)

(assert (=> b!307340 (= e!192383 e!192382)))

(declare-fun res!164237 () Bool)

(assert (=> b!307340 (=> (not res!164237) (not e!192382))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307340 (= res!164237 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150917))))

(assert (=> b!307340 (= lt!150917 (Intermediate!2546 false resIndex!52 resX!52))))

(declare-fun b!307341 () Bool)

(declare-fun res!164235 () Bool)

(assert (=> b!307341 (=> (not res!164235) (not e!192383))))

(declare-fun arrayContainsKey!0 (array!15644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307341 (= res!164235 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30636 res!164236) b!307333))

(assert (= (and b!307333 res!164240) b!307335))

(assert (= (and b!307335 res!164241) b!307341))

(assert (= (and b!307341 res!164235) b!307338))

(assert (= (and b!307338 res!164238) b!307337))

(assert (= (and b!307337 res!164233) b!307340))

(assert (= (and b!307340 res!164237) b!307339))

(assert (= (and b!307339 res!164239) b!307334))

(assert (= (and b!307334 res!164234) b!307336))

(declare-fun m!317155 () Bool)

(assert (=> start!30636 m!317155))

(declare-fun m!317157 () Bool)

(assert (=> start!30636 m!317157))

(declare-fun m!317159 () Bool)

(assert (=> b!307340 m!317159))

(assert (=> b!307340 m!317159))

(declare-fun m!317161 () Bool)

(assert (=> b!307340 m!317161))

(declare-fun m!317163 () Bool)

(assert (=> b!307334 m!317163))

(declare-fun m!317165 () Bool)

(assert (=> b!307339 m!317165))

(declare-fun m!317167 () Bool)

(assert (=> b!307337 m!317167))

(declare-fun m!317169 () Bool)

(assert (=> b!307335 m!317169))

(declare-fun m!317171 () Bool)

(assert (=> b!307341 m!317171))

(declare-fun m!317173 () Bool)

(assert (=> b!307336 m!317173))

(declare-fun m!317175 () Bool)

(assert (=> b!307338 m!317175))

(check-sat (not b!307338) (not start!30636) (not b!307334) (not b!307335) (not b!307340) (not b!307341) (not b!307337))
(check-sat)
