; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30626 () Bool)

(assert start!30626)

(declare-fun b!307302 () Bool)

(declare-fun e!192467 () Bool)

(declare-fun e!192468 () Bool)

(assert (=> b!307302 (= e!192467 e!192468)))

(declare-fun res!164061 () Bool)

(assert (=> b!307302 (=> (not res!164061) (not e!192468))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((array!15630 0))(
  ( (array!15631 (arr!7400 (Array (_ BitVec 32) (_ BitVec 64))) (size!7752 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15630)

(declare-datatypes ((SeekEntryResult!2540 0))(
  ( (MissingZero!2540 (index!12336 (_ BitVec 32))) (Found!2540 (index!12337 (_ BitVec 32))) (Intermediate!2540 (undefined!3352 Bool) (index!12338 (_ BitVec 32)) (x!30583 (_ BitVec 32))) (Undefined!2540) (MissingVacant!2540 (index!12339 (_ BitVec 32))) )
))
(declare-fun lt!151116 () SeekEntryResult!2540)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15630 (_ BitVec 32)) SeekEntryResult!2540)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307302 (= res!164061 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151116))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307302 (= lt!151116 (Intermediate!2540 false resIndex!52 resX!52))))

(declare-fun b!307303 () Bool)

(declare-fun res!164057 () Bool)

(assert (=> b!307303 (=> (not res!164057) (not e!192468))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307303 (= res!164057 (and (= (select (arr!7400 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7752 a!3293))))))

(declare-fun b!307304 () Bool)

(declare-fun res!164064 () Bool)

(assert (=> b!307304 (=> (not res!164064) (not e!192467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307304 (= res!164064 (validKeyInArray!0 k!2441))))

(declare-fun b!307305 () Bool)

(assert (=> b!307305 (= e!192468 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7400 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!307306 () Bool)

(declare-fun res!164059 () Bool)

(assert (=> b!307306 (=> (not res!164059) (not e!192468))))

(assert (=> b!307306 (= res!164059 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151116))))

(declare-fun b!307307 () Bool)

(declare-fun res!164063 () Bool)

(assert (=> b!307307 (=> (not res!164063) (not e!192467))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15630 (_ BitVec 32)) SeekEntryResult!2540)

(assert (=> b!307307 (= res!164063 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2540 i!1240)))))

(declare-fun res!164056 () Bool)

(assert (=> start!30626 (=> (not res!164056) (not e!192467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30626 (= res!164056 (validMask!0 mask!3709))))

(assert (=> start!30626 e!192467))

(declare-fun array_inv!5363 (array!15630) Bool)

(assert (=> start!30626 (array_inv!5363 a!3293)))

(assert (=> start!30626 true))

(declare-fun b!307308 () Bool)

(declare-fun res!164062 () Bool)

(assert (=> b!307308 (=> (not res!164062) (not e!192467))))

(declare-fun arrayContainsKey!0 (array!15630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307308 (= res!164062 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307309 () Bool)

(declare-fun res!164060 () Bool)

(assert (=> b!307309 (=> (not res!164060) (not e!192467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15630 (_ BitVec 32)) Bool)

(assert (=> b!307309 (= res!164060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307310 () Bool)

(declare-fun res!164058 () Bool)

(assert (=> b!307310 (=> (not res!164058) (not e!192467))))

(assert (=> b!307310 (= res!164058 (and (= (size!7752 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7752 a!3293))))))

(assert (= (and start!30626 res!164056) b!307310))

(assert (= (and b!307310 res!164058) b!307304))

(assert (= (and b!307304 res!164064) b!307308))

(assert (= (and b!307308 res!164062) b!307307))

(assert (= (and b!307307 res!164063) b!307309))

(assert (= (and b!307309 res!164060) b!307302))

(assert (= (and b!307302 res!164061) b!307303))

(assert (= (and b!307303 res!164057) b!307306))

(assert (= (and b!307306 res!164059) b!307305))

(declare-fun m!317633 () Bool)

(assert (=> b!307302 m!317633))

(assert (=> b!307302 m!317633))

(declare-fun m!317635 () Bool)

(assert (=> b!307302 m!317635))

(declare-fun m!317637 () Bool)

(assert (=> b!307306 m!317637))

(declare-fun m!317639 () Bool)

(assert (=> start!30626 m!317639))

(declare-fun m!317641 () Bool)

(assert (=> start!30626 m!317641))

(declare-fun m!317643 () Bool)

(assert (=> b!307309 m!317643))

(declare-fun m!317645 () Bool)

(assert (=> b!307308 m!317645))

(declare-fun m!317647 () Bool)

(assert (=> b!307307 m!317647))

(declare-fun m!317649 () Bool)

(assert (=> b!307304 m!317649))

(declare-fun m!317651 () Bool)

(assert (=> b!307303 m!317651))

(declare-fun m!317653 () Bool)

(assert (=> b!307305 m!317653))

(push 1)

