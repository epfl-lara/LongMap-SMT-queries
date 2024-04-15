; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30318 () Bool)

(assert start!30318)

(declare-fun b!303492 () Bool)

(declare-fun res!161124 () Bool)

(declare-fun e!190887 () Bool)

(assert (=> b!303492 (=> (not res!161124) (not e!190887))))

(declare-datatypes ((array!15428 0))(
  ( (array!15429 (arr!7302 (Array (_ BitVec 32) (_ BitVec 64))) (size!7655 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15428)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303492 (= res!161124 (and (= (select (arr!7302 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7655 a!3293))))))

(declare-fun res!161132 () Bool)

(declare-fun e!190888 () Bool)

(assert (=> start!30318 (=> (not res!161132) (not e!190888))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30318 (= res!161132 (validMask!0 mask!3709))))

(assert (=> start!30318 e!190888))

(declare-fun array_inv!5274 (array!15428) Bool)

(assert (=> start!30318 (array_inv!5274 a!3293)))

(assert (=> start!30318 true))

(declare-fun b!303493 () Bool)

(assert (=> b!303493 (= e!190888 e!190887)))

(declare-fun res!161130 () Bool)

(assert (=> b!303493 (=> (not res!161130) (not e!190887))))

(declare-datatypes ((SeekEntryResult!2441 0))(
  ( (MissingZero!2441 (index!11940 (_ BitVec 32))) (Found!2441 (index!11941 (_ BitVec 32))) (Intermediate!2441 (undefined!3253 Bool) (index!11942 (_ BitVec 32)) (x!30213 (_ BitVec 32))) (Undefined!2441) (MissingVacant!2441 (index!11943 (_ BitVec 32))) )
))
(declare-fun lt!150020 () SeekEntryResult!2441)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15428 (_ BitVec 32)) SeekEntryResult!2441)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303493 (= res!161130 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150020))))

(assert (=> b!303493 (= lt!150020 (Intermediate!2441 false resIndex!52 resX!52))))

(declare-fun b!303494 () Bool)

(declare-fun res!161131 () Bool)

(assert (=> b!303494 (=> (not res!161131) (not e!190887))))

(assert (=> b!303494 (= res!161131 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150020))))

(declare-fun b!303495 () Bool)

(declare-fun res!161133 () Bool)

(assert (=> b!303495 (=> (not res!161133) (not e!190888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303495 (= res!161133 (validKeyInArray!0 k0!2441))))

(declare-fun b!303496 () Bool)

(assert (=> b!303496 (= e!190887 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!150019 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303496 (= lt!150019 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!303497 () Bool)

(declare-fun res!161125 () Bool)

(assert (=> b!303497 (=> (not res!161125) (not e!190888))))

(declare-fun arrayContainsKey!0 (array!15428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303497 (= res!161125 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303498 () Bool)

(declare-fun res!161127 () Bool)

(assert (=> b!303498 (=> (not res!161127) (not e!190887))))

(assert (=> b!303498 (= res!161127 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7302 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7302 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7302 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!303499 () Bool)

(declare-fun res!161128 () Bool)

(assert (=> b!303499 (=> (not res!161128) (not e!190888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15428 (_ BitVec 32)) Bool)

(assert (=> b!303499 (= res!161128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303500 () Bool)

(declare-fun res!161129 () Bool)

(assert (=> b!303500 (=> (not res!161129) (not e!190888))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15428 (_ BitVec 32)) SeekEntryResult!2441)

(assert (=> b!303500 (= res!161129 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2441 i!1240)))))

(declare-fun b!303501 () Bool)

(declare-fun res!161126 () Bool)

(assert (=> b!303501 (=> (not res!161126) (not e!190888))))

(assert (=> b!303501 (= res!161126 (and (= (size!7655 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7655 a!3293))))))

(assert (= (and start!30318 res!161132) b!303501))

(assert (= (and b!303501 res!161126) b!303495))

(assert (= (and b!303495 res!161133) b!303497))

(assert (= (and b!303497 res!161125) b!303500))

(assert (= (and b!303500 res!161129) b!303499))

(assert (= (and b!303499 res!161128) b!303493))

(assert (= (and b!303493 res!161130) b!303492))

(assert (= (and b!303492 res!161124) b!303494))

(assert (= (and b!303494 res!161131) b!303498))

(assert (= (and b!303498 res!161127) b!303496))

(declare-fun m!314323 () Bool)

(assert (=> b!303492 m!314323))

(declare-fun m!314325 () Bool)

(assert (=> b!303494 m!314325))

(declare-fun m!314327 () Bool)

(assert (=> b!303493 m!314327))

(assert (=> b!303493 m!314327))

(declare-fun m!314329 () Bool)

(assert (=> b!303493 m!314329))

(declare-fun m!314331 () Bool)

(assert (=> b!303495 m!314331))

(declare-fun m!314333 () Bool)

(assert (=> b!303499 m!314333))

(declare-fun m!314335 () Bool)

(assert (=> b!303497 m!314335))

(declare-fun m!314337 () Bool)

(assert (=> b!303498 m!314337))

(declare-fun m!314339 () Bool)

(assert (=> b!303500 m!314339))

(declare-fun m!314341 () Bool)

(assert (=> b!303496 m!314341))

(declare-fun m!314343 () Bool)

(assert (=> start!30318 m!314343))

(declare-fun m!314345 () Bool)

(assert (=> start!30318 m!314345))

(check-sat (not b!303499) (not b!303493) (not b!303494) (not b!303495) (not b!303500) (not start!30318) (not b!303497) (not b!303496))
(check-sat)
