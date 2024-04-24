; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30630 () Bool)

(assert start!30630)

(declare-fun b!307474 () Bool)

(declare-fun res!164280 () Bool)

(declare-fun e!192497 () Bool)

(assert (=> b!307474 (=> (not res!164280) (not e!192497))))

(declare-datatypes ((array!15647 0))(
  ( (array!15648 (arr!7408 (Array (_ BitVec 32) (_ BitVec 64))) (size!7760 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15647)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2513 0))(
  ( (MissingZero!2513 (index!12228 (_ BitVec 32))) (Found!2513 (index!12229 (_ BitVec 32))) (Intermediate!2513 (undefined!3325 Bool) (index!12230 (_ BitVec 32)) (x!30577 (_ BitVec 32))) (Undefined!2513) (MissingVacant!2513 (index!12231 (_ BitVec 32))) )
))
(declare-fun lt!151161 () SeekEntryResult!2513)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15647 (_ BitVec 32)) SeekEntryResult!2513)

(assert (=> b!307474 (= res!164280 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151161))))

(declare-fun b!307475 () Bool)

(declare-fun res!164285 () Bool)

(declare-fun e!192498 () Bool)

(assert (=> b!307475 (=> (not res!164285) (not e!192498))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307475 (= res!164285 (and (= (size!7760 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7760 a!3293))))))

(declare-fun b!307476 () Bool)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307476 (= e!192497 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7408 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!307478 () Bool)

(assert (=> b!307478 (= e!192498 e!192497)))

(declare-fun res!164281 () Bool)

(assert (=> b!307478 (=> (not res!164281) (not e!192497))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307478 (= res!164281 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151161))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!307478 (= lt!151161 (Intermediate!2513 false resIndex!52 resX!52))))

(declare-fun b!307479 () Bool)

(declare-fun res!164278 () Bool)

(assert (=> b!307479 (=> (not res!164278) (not e!192498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307479 (= res!164278 (validKeyInArray!0 k0!2441))))

(declare-fun b!307480 () Bool)

(declare-fun res!164283 () Bool)

(assert (=> b!307480 (=> (not res!164283) (not e!192498))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15647 (_ BitVec 32)) SeekEntryResult!2513)

(assert (=> b!307480 (= res!164283 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2513 i!1240)))))

(declare-fun b!307477 () Bool)

(declare-fun res!164279 () Bool)

(assert (=> b!307477 (=> (not res!164279) (not e!192498))))

(declare-fun arrayContainsKey!0 (array!15647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307477 (= res!164279 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!164282 () Bool)

(assert (=> start!30630 (=> (not res!164282) (not e!192498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30630 (= res!164282 (validMask!0 mask!3709))))

(assert (=> start!30630 e!192498))

(declare-fun array_inv!5358 (array!15647) Bool)

(assert (=> start!30630 (array_inv!5358 a!3293)))

(assert (=> start!30630 true))

(declare-fun b!307481 () Bool)

(declare-fun res!164284 () Bool)

(assert (=> b!307481 (=> (not res!164284) (not e!192497))))

(assert (=> b!307481 (= res!164284 (and (= (select (arr!7408 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7760 a!3293))))))

(declare-fun b!307482 () Bool)

(declare-fun res!164286 () Bool)

(assert (=> b!307482 (=> (not res!164286) (not e!192498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15647 (_ BitVec 32)) Bool)

(assert (=> b!307482 (= res!164286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30630 res!164282) b!307475))

(assert (= (and b!307475 res!164285) b!307479))

(assert (= (and b!307479 res!164278) b!307477))

(assert (= (and b!307477 res!164279) b!307480))

(assert (= (and b!307480 res!164283) b!307482))

(assert (= (and b!307482 res!164286) b!307478))

(assert (= (and b!307478 res!164281) b!307481))

(assert (= (and b!307481 res!164284) b!307474))

(assert (= (and b!307474 res!164280) b!307476))

(declare-fun m!317941 () Bool)

(assert (=> b!307480 m!317941))

(declare-fun m!317943 () Bool)

(assert (=> b!307476 m!317943))

(declare-fun m!317945 () Bool)

(assert (=> start!30630 m!317945))

(declare-fun m!317947 () Bool)

(assert (=> start!30630 m!317947))

(declare-fun m!317949 () Bool)

(assert (=> b!307482 m!317949))

(declare-fun m!317951 () Bool)

(assert (=> b!307481 m!317951))

(declare-fun m!317953 () Bool)

(assert (=> b!307479 m!317953))

(declare-fun m!317955 () Bool)

(assert (=> b!307477 m!317955))

(declare-fun m!317957 () Bool)

(assert (=> b!307478 m!317957))

(assert (=> b!307478 m!317957))

(declare-fun m!317959 () Bool)

(assert (=> b!307478 m!317959))

(declare-fun m!317961 () Bool)

(assert (=> b!307474 m!317961))

(check-sat (not b!307474) (not b!307479) (not start!30630) (not b!307482) (not b!307478) (not b!307477) (not b!307480))
(check-sat)
