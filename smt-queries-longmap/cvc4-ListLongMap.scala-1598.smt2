; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30248 () Bool)

(assert start!30248)

(declare-fun b!302798 () Bool)

(declare-fun res!160336 () Bool)

(declare-fun e!190754 () Bool)

(assert (=> b!302798 (=> (not res!160336) (not e!190754))))

(declare-datatypes ((array!15367 0))(
  ( (array!15368 (arr!7271 (Array (_ BitVec 32) (_ BitVec 64))) (size!7623 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15367)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302798 (= res!160336 (and (= (select (arr!7271 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7623 a!3293))))))

(declare-fun b!302799 () Bool)

(declare-fun res!160335 () Bool)

(assert (=> b!302799 (=> (not res!160335) (not e!190754))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302799 (= res!160335 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302800 () Bool)

(declare-fun res!160338 () Bool)

(assert (=> b!302800 (=> (not res!160338) (not e!190754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302800 (= res!160338 (validKeyInArray!0 k!2441))))

(declare-fun b!302801 () Bool)

(declare-fun res!160337 () Bool)

(assert (=> b!302801 (=> (not res!160337) (not e!190754))))

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!302801 (= res!160337 (and (= (size!7623 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7623 a!3293))))))

(declare-fun b!302802 () Bool)

(declare-fun res!160341 () Bool)

(assert (=> b!302802 (=> (not res!160341) (not e!190754))))

(declare-datatypes ((SeekEntryResult!2376 0))(
  ( (MissingZero!2376 (index!11680 (_ BitVec 32))) (Found!2376 (index!11681 (_ BitVec 32))) (Intermediate!2376 (undefined!3188 Bool) (index!11682 (_ BitVec 32)) (x!30054 (_ BitVec 32))) (Undefined!2376) (MissingVacant!2376 (index!11683 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15367 (_ BitVec 32)) SeekEntryResult!2376)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302802 (= res!160341 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2376 false resIndex!52 resX!52)))))

(declare-fun b!302804 () Bool)

(declare-fun res!160334 () Bool)

(assert (=> b!302804 (=> (not res!160334) (not e!190754))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15367 (_ BitVec 32)) SeekEntryResult!2376)

(assert (=> b!302804 (= res!160334 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2376 i!1240)))))

(declare-fun b!302805 () Bool)

(assert (=> b!302805 (= e!190754 false)))

(declare-fun lt!150156 () SeekEntryResult!2376)

(assert (=> b!302805 (= lt!150156 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!160340 () Bool)

(assert (=> start!30248 (=> (not res!160340) (not e!190754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30248 (= res!160340 (validMask!0 mask!3709))))

(assert (=> start!30248 e!190754))

(declare-fun array_inv!5221 (array!15367) Bool)

(assert (=> start!30248 (array_inv!5221 a!3293)))

(assert (=> start!30248 true))

(declare-fun b!302803 () Bool)

(declare-fun res!160339 () Bool)

(assert (=> b!302803 (=> (not res!160339) (not e!190754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15367 (_ BitVec 32)) Bool)

(assert (=> b!302803 (= res!160339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30248 res!160340) b!302801))

(assert (= (and b!302801 res!160337) b!302800))

(assert (= (and b!302800 res!160338) b!302799))

(assert (= (and b!302799 res!160335) b!302804))

(assert (= (and b!302804 res!160334) b!302803))

(assert (= (and b!302803 res!160339) b!302802))

(assert (= (and b!302802 res!160341) b!302798))

(assert (= (and b!302798 res!160336) b!302805))

(declare-fun m!314415 () Bool)

(assert (=> b!302804 m!314415))

(declare-fun m!314417 () Bool)

(assert (=> b!302805 m!314417))

(declare-fun m!314419 () Bool)

(assert (=> b!302798 m!314419))

(declare-fun m!314421 () Bool)

(assert (=> b!302800 m!314421))

(declare-fun m!314423 () Bool)

(assert (=> b!302803 m!314423))

(declare-fun m!314425 () Bool)

(assert (=> b!302799 m!314425))

(declare-fun m!314427 () Bool)

(assert (=> b!302802 m!314427))

(assert (=> b!302802 m!314427))

(declare-fun m!314429 () Bool)

(assert (=> b!302802 m!314429))

(declare-fun m!314431 () Bool)

(assert (=> start!30248 m!314431))

(declare-fun m!314433 () Bool)

(assert (=> start!30248 m!314433))

(push 1)

(assert (not b!302804))

(assert (not b!302800))

(assert (not b!302799))

(assert (not start!30248))

(assert (not b!302803))

(assert (not b!302805))

(assert (not b!302802))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

