; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30240 () Bool)

(assert start!30240)

(declare-fun b!302695 () Bool)

(declare-fun res!160234 () Bool)

(declare-fun e!190723 () Bool)

(assert (=> b!302695 (=> (not res!160234) (not e!190723))))

(declare-datatypes ((array!15359 0))(
  ( (array!15360 (arr!7267 (Array (_ BitVec 32) (_ BitVec 64))) (size!7619 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15359)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302695 (= res!160234 (and (= (select (arr!7267 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7619 a!3293))))))

(declare-fun b!302696 () Bool)

(declare-fun res!160232 () Bool)

(declare-fun e!190724 () Bool)

(assert (=> b!302696 (=> (not res!160232) (not e!190724))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302696 (= res!160232 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun b!302697 () Bool)

(assert (=> b!302697 (= e!190723 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7267 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7267 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7267 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!302698 () Bool)

(declare-fun res!160233 () Bool)

(assert (=> b!302698 (=> (not res!160233) (not e!190723))))

(declare-datatypes ((SeekEntryResult!2372 0))(
  ( (MissingZero!2372 (index!11664 (_ BitVec 32))) (Found!2372 (index!11665 (_ BitVec 32))) (Intermediate!2372 (undefined!3184 Bool) (index!11666 (_ BitVec 32)) (x!30042 (_ BitVec 32))) (Undefined!2372) (MissingVacant!2372 (index!11667 (_ BitVec 32))) )
))
(declare-fun lt!150144 () SeekEntryResult!2372)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15359 (_ BitVec 32)) SeekEntryResult!2372)

(assert (=> b!302698 (= res!160233 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150144))))

(declare-fun b!302699 () Bool)

(assert (=> b!302699 (= e!190724 e!190723)))

(declare-fun res!160235 () Bool)

(assert (=> b!302699 (=> (not res!160235) (not e!190723))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302699 (= res!160235 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150144))))

(assert (=> b!302699 (= lt!150144 (Intermediate!2372 false resIndex!52 resX!52))))

(declare-fun b!302700 () Bool)

(declare-fun res!160238 () Bool)

(assert (=> b!302700 (=> (not res!160238) (not e!190724))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15359 (_ BitVec 32)) SeekEntryResult!2372)

(assert (=> b!302700 (= res!160238 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2372 i!1240)))))

(declare-fun res!160236 () Bool)

(assert (=> start!30240 (=> (not res!160236) (not e!190724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30240 (= res!160236 (validMask!0 mask!3709))))

(assert (=> start!30240 e!190724))

(declare-fun array_inv!5217 (array!15359) Bool)

(assert (=> start!30240 (array_inv!5217 a!3293)))

(assert (=> start!30240 true))

(declare-fun b!302701 () Bool)

(declare-fun res!160239 () Bool)

(assert (=> b!302701 (=> (not res!160239) (not e!190724))))

(assert (=> b!302701 (= res!160239 (and (= (size!7619 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7619 a!3293))))))

(declare-fun b!302702 () Bool)

(declare-fun res!160231 () Bool)

(assert (=> b!302702 (=> (not res!160231) (not e!190724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302702 (= res!160231 (validKeyInArray!0 k0!2441))))

(declare-fun b!302703 () Bool)

(declare-fun res!160237 () Bool)

(assert (=> b!302703 (=> (not res!160237) (not e!190724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15359 (_ BitVec 32)) Bool)

(assert (=> b!302703 (= res!160237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30240 res!160236) b!302701))

(assert (= (and b!302701 res!160239) b!302702))

(assert (= (and b!302702 res!160231) b!302696))

(assert (= (and b!302696 res!160232) b!302700))

(assert (= (and b!302700 res!160238) b!302703))

(assert (= (and b!302703 res!160237) b!302699))

(assert (= (and b!302699 res!160235) b!302695))

(assert (= (and b!302695 res!160234) b!302698))

(assert (= (and b!302698 res!160233) b!302697))

(declare-fun m!314329 () Bool)

(assert (=> b!302697 m!314329))

(declare-fun m!314331 () Bool)

(assert (=> b!302700 m!314331))

(declare-fun m!314333 () Bool)

(assert (=> b!302699 m!314333))

(assert (=> b!302699 m!314333))

(declare-fun m!314335 () Bool)

(assert (=> b!302699 m!314335))

(declare-fun m!314337 () Bool)

(assert (=> b!302698 m!314337))

(declare-fun m!314339 () Bool)

(assert (=> start!30240 m!314339))

(declare-fun m!314341 () Bool)

(assert (=> start!30240 m!314341))

(declare-fun m!314343 () Bool)

(assert (=> b!302703 m!314343))

(declare-fun m!314345 () Bool)

(assert (=> b!302695 m!314345))

(declare-fun m!314347 () Bool)

(assert (=> b!302696 m!314347))

(declare-fun m!314349 () Bool)

(assert (=> b!302702 m!314349))

(check-sat (not b!302699) (not b!302703) (not b!302698) (not b!302696) (not b!302700) (not b!302702) (not start!30240))
(check-sat)
