; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30632 () Bool)

(assert start!30632)

(declare-fun b!307381 () Bool)

(declare-fun res!164138 () Bool)

(declare-fun e!192492 () Bool)

(assert (=> b!307381 (=> (not res!164138) (not e!192492))))

(declare-datatypes ((array!15636 0))(
  ( (array!15637 (arr!7403 (Array (_ BitVec 32) (_ BitVec 64))) (size!7755 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15636)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307381 (= res!164138 (and (= (select (arr!7403 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7755 a!3293))))))

(declare-fun b!307382 () Bool)

(declare-fun res!164137 () Bool)

(assert (=> b!307382 (=> (not res!164137) (not e!192492))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2543 0))(
  ( (MissingZero!2543 (index!12348 (_ BitVec 32))) (Found!2543 (index!12349 (_ BitVec 32))) (Intermediate!2543 (undefined!3355 Bool) (index!12350 (_ BitVec 32)) (x!30594 (_ BitVec 32))) (Undefined!2543) (MissingVacant!2543 (index!12351 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15636 (_ BitVec 32)) SeekEntryResult!2543)

(assert (=> b!307382 (= res!164137 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2543 i!1240)))))

(declare-fun b!307383 () Bool)

(assert (=> b!307383 (= e!192492 false)))

(declare-fun lt!151125 () SeekEntryResult!2543)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15636 (_ BitVec 32)) SeekEntryResult!2543)

(assert (=> b!307383 (= lt!151125 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!307384 () Bool)

(declare-fun res!164140 () Bool)

(assert (=> b!307384 (=> (not res!164140) (not e!192492))))

(assert (=> b!307384 (= res!164140 (and (= (size!7755 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7755 a!3293))))))

(declare-fun b!307385 () Bool)

(declare-fun res!164142 () Bool)

(assert (=> b!307385 (=> (not res!164142) (not e!192492))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307385 (= res!164142 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2543 false resIndex!52 resX!52)))))

(declare-fun res!164135 () Bool)

(assert (=> start!30632 (=> (not res!164135) (not e!192492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30632 (= res!164135 (validMask!0 mask!3709))))

(assert (=> start!30632 e!192492))

(declare-fun array_inv!5366 (array!15636) Bool)

(assert (=> start!30632 (array_inv!5366 a!3293)))

(assert (=> start!30632 true))

(declare-fun b!307386 () Bool)

(declare-fun res!164136 () Bool)

(assert (=> b!307386 (=> (not res!164136) (not e!192492))))

(declare-fun arrayContainsKey!0 (array!15636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307386 (= res!164136 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307387 () Bool)

(declare-fun res!164141 () Bool)

(assert (=> b!307387 (=> (not res!164141) (not e!192492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15636 (_ BitVec 32)) Bool)

(assert (=> b!307387 (= res!164141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307388 () Bool)

(declare-fun res!164139 () Bool)

(assert (=> b!307388 (=> (not res!164139) (not e!192492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307388 (= res!164139 (validKeyInArray!0 k!2441))))

(assert (= (and start!30632 res!164135) b!307384))

(assert (= (and b!307384 res!164140) b!307388))

(assert (= (and b!307388 res!164139) b!307386))

(assert (= (and b!307386 res!164136) b!307382))

(assert (= (and b!307382 res!164137) b!307387))

(assert (= (and b!307387 res!164141) b!307385))

(assert (= (and b!307385 res!164142) b!307381))

(assert (= (and b!307381 res!164138) b!307383))

(declare-fun m!317699 () Bool)

(assert (=> b!307382 m!317699))

(declare-fun m!317701 () Bool)

(assert (=> b!307385 m!317701))

(assert (=> b!307385 m!317701))

(declare-fun m!317703 () Bool)

(assert (=> b!307385 m!317703))

(declare-fun m!317705 () Bool)

(assert (=> b!307388 m!317705))

(declare-fun m!317707 () Bool)

(assert (=> b!307383 m!317707))

(declare-fun m!317709 () Bool)

(assert (=> b!307381 m!317709))

(declare-fun m!317711 () Bool)

(assert (=> start!30632 m!317711))

(declare-fun m!317713 () Bool)

(assert (=> start!30632 m!317713))

(declare-fun m!317715 () Bool)

(assert (=> b!307386 m!317715))

(declare-fun m!317717 () Bool)

(assert (=> b!307387 m!317717))

(push 1)

(assert (not b!307387))

(assert (not b!307382))

(assert (not b!307388))

(assert (not b!307383))

(assert (not b!307385))

(assert (not start!30632))

(assert (not b!307386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

