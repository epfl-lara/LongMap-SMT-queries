; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30660 () Bool)

(assert start!30660)

(declare-datatypes ((array!15664 0))(
  ( (array!15665 (arr!7417 (Array (_ BitVec 32) (_ BitVec 64))) (size!7769 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15664)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun e!192604 () Bool)

(declare-fun b!307743 () Bool)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307743 (= e!192604 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7417 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!307744 () Bool)

(declare-fun e!192602 () Bool)

(assert (=> b!307744 (= e!192602 e!192604)))

(declare-fun res!164502 () Bool)

(assert (=> b!307744 (=> (not res!164502) (not e!192604))))

(declare-datatypes ((SeekEntryResult!2557 0))(
  ( (MissingZero!2557 (index!12404 (_ BitVec 32))) (Found!2557 (index!12405 (_ BitVec 32))) (Intermediate!2557 (undefined!3369 Bool) (index!12406 (_ BitVec 32)) (x!30640 (_ BitVec 32))) (Undefined!2557) (MissingVacant!2557 (index!12407 (_ BitVec 32))) )
))
(declare-fun lt!151167 () SeekEntryResult!2557)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15664 (_ BitVec 32)) SeekEntryResult!2557)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307744 (= res!164502 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151167))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!307744 (= lt!151167 (Intermediate!2557 false resIndex!52 resX!52))))

(declare-fun b!307745 () Bool)

(declare-fun res!164504 () Bool)

(assert (=> b!307745 (=> (not res!164504) (not e!192604))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307745 (= res!164504 (and (= (select (arr!7417 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7769 a!3293))))))

(declare-fun b!307746 () Bool)

(declare-fun res!164497 () Bool)

(assert (=> b!307746 (=> (not res!164497) (not e!192602))))

(declare-fun arrayContainsKey!0 (array!15664 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307746 (= res!164497 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307747 () Bool)

(declare-fun res!164501 () Bool)

(assert (=> b!307747 (=> (not res!164501) (not e!192602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15664 (_ BitVec 32)) Bool)

(assert (=> b!307747 (= res!164501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307748 () Bool)

(declare-fun res!164499 () Bool)

(assert (=> b!307748 (=> (not res!164499) (not e!192602))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15664 (_ BitVec 32)) SeekEntryResult!2557)

(assert (=> b!307748 (= res!164499 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2557 i!1240)))))

(declare-fun res!164505 () Bool)

(assert (=> start!30660 (=> (not res!164505) (not e!192602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30660 (= res!164505 (validMask!0 mask!3709))))

(assert (=> start!30660 e!192602))

(declare-fun array_inv!5380 (array!15664) Bool)

(assert (=> start!30660 (array_inv!5380 a!3293)))

(assert (=> start!30660 true))

(declare-fun b!307749 () Bool)

(declare-fun res!164498 () Bool)

(assert (=> b!307749 (=> (not res!164498) (not e!192602))))

(assert (=> b!307749 (= res!164498 (and (= (size!7769 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7769 a!3293))))))

(declare-fun b!307750 () Bool)

(declare-fun res!164500 () Bool)

(assert (=> b!307750 (=> (not res!164500) (not e!192604))))

(assert (=> b!307750 (= res!164500 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151167))))

(declare-fun b!307751 () Bool)

(declare-fun res!164503 () Bool)

(assert (=> b!307751 (=> (not res!164503) (not e!192602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307751 (= res!164503 (validKeyInArray!0 k!2441))))

(assert (= (and start!30660 res!164505) b!307749))

(assert (= (and b!307749 res!164498) b!307751))

(assert (= (and b!307751 res!164503) b!307746))

(assert (= (and b!307746 res!164497) b!307748))

(assert (= (and b!307748 res!164499) b!307747))

(assert (= (and b!307747 res!164501) b!307744))

(assert (= (and b!307744 res!164502) b!307745))

(assert (= (and b!307745 res!164504) b!307750))

(assert (= (and b!307750 res!164500) b!307743))

(declare-fun m!317995 () Bool)

(assert (=> b!307748 m!317995))

(declare-fun m!317997 () Bool)

(assert (=> b!307745 m!317997))

(declare-fun m!317999 () Bool)

(assert (=> b!307747 m!317999))

(declare-fun m!318001 () Bool)

(assert (=> start!30660 m!318001))

(declare-fun m!318003 () Bool)

(assert (=> start!30660 m!318003))

(declare-fun m!318005 () Bool)

(assert (=> b!307743 m!318005))

(declare-fun m!318007 () Bool)

(assert (=> b!307746 m!318007))

(declare-fun m!318009 () Bool)

(assert (=> b!307750 m!318009))

(declare-fun m!318011 () Bool)

(assert (=> b!307751 m!318011))

(declare-fun m!318013 () Bool)

(assert (=> b!307744 m!318013))

(assert (=> b!307744 m!318013))

(declare-fun m!318015 () Bool)

(assert (=> b!307744 m!318015))

(push 1)

(assert (not b!307751))

(assert (not b!307750))

(assert (not b!307748))

(assert (not start!30660))

(assert (not b!307746))

(assert (not b!307747))

(assert (not b!307744))

(check-sat)

