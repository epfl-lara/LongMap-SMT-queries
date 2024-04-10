; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30302 () Bool)

(assert start!30302)

(declare-fun b!303358 () Bool)

(declare-fun res!160849 () Bool)

(declare-fun e!190935 () Bool)

(assert (=> b!303358 (=> (not res!160849) (not e!190935))))

(declare-datatypes ((array!15408 0))(
  ( (array!15409 (arr!7292 (Array (_ BitVec 32) (_ BitVec 64))) (size!7644 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15408)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303358 (= res!160849 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303359 () Bool)

(declare-fun res!160847 () Bool)

(assert (=> b!303359 (=> (not res!160847) (not e!190935))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2432 0))(
  ( (MissingZero!2432 (index!11904 (_ BitVec 32))) (Found!2432 (index!11905 (_ BitVec 32))) (Intermediate!2432 (undefined!3244 Bool) (index!11906 (_ BitVec 32)) (x!30169 (_ BitVec 32))) (Undefined!2432) (MissingVacant!2432 (index!11907 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15408 (_ BitVec 32)) SeekEntryResult!2432)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303359 (= res!160847 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2432 false resIndex!52 resX!52)))))

(declare-fun res!160848 () Bool)

(assert (=> start!30302 (=> (not res!160848) (not e!190935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30302 (= res!160848 (validMask!0 mask!3709))))

(assert (=> start!30302 e!190935))

(declare-fun array_inv!5255 (array!15408) Bool)

(assert (=> start!30302 (array_inv!5255 a!3293)))

(assert (=> start!30302 true))

(declare-fun b!303360 () Bool)

(declare-fun res!160846 () Bool)

(assert (=> b!303360 (=> (not res!160846) (not e!190935))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303360 (= res!160846 (and (= (size!7644 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7644 a!3293))))))

(declare-fun b!303361 () Bool)

(declare-fun res!160845 () Bool)

(assert (=> b!303361 (=> (not res!160845) (not e!190935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15408 (_ BitVec 32)) Bool)

(assert (=> b!303361 (= res!160845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303362 () Bool)

(assert (=> b!303362 (= e!190935 false)))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!150198 () SeekEntryResult!2432)

(assert (=> b!303362 (= lt!150198 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!303363 () Bool)

(declare-fun res!160851 () Bool)

(assert (=> b!303363 (=> (not res!160851) (not e!190935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303363 (= res!160851 (validKeyInArray!0 k!2441))))

(declare-fun b!303364 () Bool)

(declare-fun res!160850 () Bool)

(assert (=> b!303364 (=> (not res!160850) (not e!190935))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15408 (_ BitVec 32)) SeekEntryResult!2432)

(assert (=> b!303364 (= res!160850 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2432 i!1240)))))

(declare-fun b!303365 () Bool)

(declare-fun res!160844 () Bool)

(assert (=> b!303365 (=> (not res!160844) (not e!190935))))

(assert (=> b!303365 (= res!160844 (and (= (select (arr!7292 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7644 a!3293))))))

(assert (= (and start!30302 res!160848) b!303360))

(assert (= (and b!303360 res!160846) b!303363))

(assert (= (and b!303363 res!160851) b!303358))

(assert (= (and b!303358 res!160849) b!303364))

(assert (= (and b!303364 res!160850) b!303361))

(assert (= (and b!303361 res!160845) b!303359))

(assert (= (and b!303359 res!160847) b!303365))

(assert (= (and b!303365 res!160844) b!303362))

(declare-fun m!314723 () Bool)

(assert (=> b!303359 m!314723))

(assert (=> b!303359 m!314723))

(declare-fun m!314725 () Bool)

(assert (=> b!303359 m!314725))

(declare-fun m!314727 () Bool)

(assert (=> b!303362 m!314727))

(declare-fun m!314729 () Bool)

(assert (=> start!30302 m!314729))

(declare-fun m!314731 () Bool)

(assert (=> start!30302 m!314731))

(declare-fun m!314733 () Bool)

(assert (=> b!303363 m!314733))

(declare-fun m!314735 () Bool)

(assert (=> b!303365 m!314735))

(declare-fun m!314737 () Bool)

(assert (=> b!303364 m!314737))

(declare-fun m!314739 () Bool)

(assert (=> b!303361 m!314739))

(declare-fun m!314741 () Bool)

(assert (=> b!303358 m!314741))

(push 1)

(assert (not b!303362))

(assert (not b!303363))

(assert (not b!303359))

(assert (not b!303358))

(assert (not start!30302))

(assert (not b!303361))

(assert (not b!303364))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

