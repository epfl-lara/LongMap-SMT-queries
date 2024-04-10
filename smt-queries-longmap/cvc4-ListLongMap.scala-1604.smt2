; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30300 () Bool)

(assert start!30300)

(declare-fun b!303334 () Bool)

(declare-fun res!160824 () Bool)

(declare-fun e!190930 () Bool)

(assert (=> b!303334 (=> (not res!160824) (not e!190930))))

(declare-datatypes ((array!15406 0))(
  ( (array!15407 (arr!7291 (Array (_ BitVec 32) (_ BitVec 64))) (size!7643 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15406)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303334 (= res!160824 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!160827 () Bool)

(assert (=> start!30300 (=> (not res!160827) (not e!190930))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30300 (= res!160827 (validMask!0 mask!3709))))

(assert (=> start!30300 e!190930))

(declare-fun array_inv!5254 (array!15406) Bool)

(assert (=> start!30300 (array_inv!5254 a!3293)))

(assert (=> start!30300 true))

(declare-fun b!303335 () Bool)

(assert (=> b!303335 (= e!190930 false)))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2431 0))(
  ( (MissingZero!2431 (index!11900 (_ BitVec 32))) (Found!2431 (index!11901 (_ BitVec 32))) (Intermediate!2431 (undefined!3243 Bool) (index!11902 (_ BitVec 32)) (x!30160 (_ BitVec 32))) (Undefined!2431) (MissingVacant!2431 (index!11903 (_ BitVec 32))) )
))
(declare-fun lt!150195 () SeekEntryResult!2431)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15406 (_ BitVec 32)) SeekEntryResult!2431)

(assert (=> b!303335 (= lt!150195 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!303336 () Bool)

(declare-fun res!160826 () Bool)

(assert (=> b!303336 (=> (not res!160826) (not e!190930))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303336 (= res!160826 (and (= (size!7643 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7643 a!3293))))))

(declare-fun b!303337 () Bool)

(declare-fun res!160820 () Bool)

(assert (=> b!303337 (=> (not res!160820) (not e!190930))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303337 (= res!160820 (and (= (select (arr!7291 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7643 a!3293))))))

(declare-fun b!303338 () Bool)

(declare-fun res!160825 () Bool)

(assert (=> b!303338 (=> (not res!160825) (not e!190930))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303338 (= res!160825 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2431 false resIndex!52 resX!52)))))

(declare-fun b!303339 () Bool)

(declare-fun res!160821 () Bool)

(assert (=> b!303339 (=> (not res!160821) (not e!190930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303339 (= res!160821 (validKeyInArray!0 k!2441))))

(declare-fun b!303340 () Bool)

(declare-fun res!160822 () Bool)

(assert (=> b!303340 (=> (not res!160822) (not e!190930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15406 (_ BitVec 32)) Bool)

(assert (=> b!303340 (= res!160822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303341 () Bool)

(declare-fun res!160823 () Bool)

(assert (=> b!303341 (=> (not res!160823) (not e!190930))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15406 (_ BitVec 32)) SeekEntryResult!2431)

(assert (=> b!303341 (= res!160823 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2431 i!1240)))))

(assert (= (and start!30300 res!160827) b!303336))

(assert (= (and b!303336 res!160826) b!303339))

(assert (= (and b!303339 res!160821) b!303334))

(assert (= (and b!303334 res!160824) b!303341))

(assert (= (and b!303341 res!160823) b!303340))

(assert (= (and b!303340 res!160822) b!303338))

(assert (= (and b!303338 res!160825) b!303337))

(assert (= (and b!303337 res!160820) b!303335))

(declare-fun m!314703 () Bool)

(assert (=> start!30300 m!314703))

(declare-fun m!314705 () Bool)

(assert (=> start!30300 m!314705))

(declare-fun m!314707 () Bool)

(assert (=> b!303337 m!314707))

(declare-fun m!314709 () Bool)

(assert (=> b!303340 m!314709))

(declare-fun m!314711 () Bool)

(assert (=> b!303339 m!314711))

(declare-fun m!314713 () Bool)

(assert (=> b!303334 m!314713))

(declare-fun m!314715 () Bool)

(assert (=> b!303335 m!314715))

(declare-fun m!314717 () Bool)

(assert (=> b!303338 m!314717))

(assert (=> b!303338 m!314717))

(declare-fun m!314719 () Bool)

(assert (=> b!303338 m!314719))

(declare-fun m!314721 () Bool)

(assert (=> b!303341 m!314721))

(push 1)

(assert (not b!303335))

(assert (not b!303334))

(assert (not start!30300))

(assert (not b!303338))

(assert (not b!303339))

(assert (not b!303340))

(assert (not b!303341))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

