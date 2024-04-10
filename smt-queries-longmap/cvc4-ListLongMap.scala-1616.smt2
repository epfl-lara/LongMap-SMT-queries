; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30426 () Bool)

(assert start!30426)

(declare-fun b!304566 () Bool)

(declare-fun res!161916 () Bool)

(declare-fun e!191395 () Bool)

(assert (=> b!304566 (=> (not res!161916) (not e!191395))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304566 (= res!161916 (validKeyInArray!0 k!2441))))

(declare-fun b!304567 () Bool)

(declare-fun e!191394 () Bool)

(declare-fun e!191393 () Bool)

(assert (=> b!304567 (= e!191394 e!191393)))

(declare-fun res!161917 () Bool)

(assert (=> b!304567 (=> (not res!161917) (not e!191393))))

(declare-datatypes ((array!15481 0))(
  ( (array!15482 (arr!7327 (Array (_ BitVec 32) (_ BitVec 64))) (size!7679 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15481)

(declare-datatypes ((SeekEntryResult!2467 0))(
  ( (MissingZero!2467 (index!12044 (_ BitVec 32))) (Found!2467 (index!12045 (_ BitVec 32))) (Intermediate!2467 (undefined!3279 Bool) (index!12046 (_ BitVec 32)) (x!30301 (_ BitVec 32))) (Undefined!2467) (MissingVacant!2467 (index!12047 (_ BitVec 32))) )
))
(declare-fun lt!150479 () SeekEntryResult!2467)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun lt!150480 () SeekEntryResult!2467)

(assert (=> b!304567 (= res!161917 (and (= lt!150480 lt!150479) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7327 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7327 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7327 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15481 (_ BitVec 32)) SeekEntryResult!2467)

(assert (=> b!304567 (= lt!150480 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!304568 () Bool)

(declare-fun res!161912 () Bool)

(assert (=> b!304568 (=> (not res!161912) (not e!191395))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304568 (= res!161912 (and (= (size!7679 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7679 a!3293))))))

(declare-fun res!161914 () Bool)

(assert (=> start!30426 (=> (not res!161914) (not e!191395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30426 (= res!161914 (validMask!0 mask!3709))))

(assert (=> start!30426 e!191395))

(declare-fun array_inv!5290 (array!15481) Bool)

(assert (=> start!30426 (array_inv!5290 a!3293)))

(assert (=> start!30426 true))

(declare-fun b!304569 () Bool)

(assert (=> b!304569 (= e!191393 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304569 (= lt!150480 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!304570 () Bool)

(declare-fun res!161915 () Bool)

(assert (=> b!304570 (=> (not res!161915) (not e!191395))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15481 (_ BitVec 32)) SeekEntryResult!2467)

(assert (=> b!304570 (= res!161915 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2467 i!1240)))))

(declare-fun b!304571 () Bool)

(assert (=> b!304571 (= e!191395 e!191394)))

(declare-fun res!161911 () Bool)

(assert (=> b!304571 (=> (not res!161911) (not e!191394))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304571 (= res!161911 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150479))))

(assert (=> b!304571 (= lt!150479 (Intermediate!2467 false resIndex!52 resX!52))))

(declare-fun b!304572 () Bool)

(declare-fun res!161919 () Bool)

(assert (=> b!304572 (=> (not res!161919) (not e!191395))))

(declare-fun arrayContainsKey!0 (array!15481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304572 (= res!161919 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304573 () Bool)

(declare-fun res!161918 () Bool)

(assert (=> b!304573 (=> (not res!161918) (not e!191395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15481 (_ BitVec 32)) Bool)

(assert (=> b!304573 (= res!161918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304574 () Bool)

(declare-fun res!161913 () Bool)

(assert (=> b!304574 (=> (not res!161913) (not e!191394))))

(assert (=> b!304574 (= res!161913 (and (= (select (arr!7327 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7679 a!3293))))))

(assert (= (and start!30426 res!161914) b!304568))

(assert (= (and b!304568 res!161912) b!304566))

(assert (= (and b!304566 res!161916) b!304572))

(assert (= (and b!304572 res!161919) b!304570))

(assert (= (and b!304570 res!161915) b!304573))

(assert (= (and b!304573 res!161918) b!304571))

(assert (= (and b!304571 res!161911) b!304574))

(assert (= (and b!304574 res!161913) b!304567))

(assert (= (and b!304567 res!161917) b!304569))

(declare-fun m!315657 () Bool)

(assert (=> start!30426 m!315657))

(declare-fun m!315659 () Bool)

(assert (=> start!30426 m!315659))

(declare-fun m!315661 () Bool)

(assert (=> b!304574 m!315661))

(declare-fun m!315663 () Bool)

(assert (=> b!304567 m!315663))

(declare-fun m!315665 () Bool)

(assert (=> b!304567 m!315665))

(declare-fun m!315667 () Bool)

(assert (=> b!304569 m!315667))

(assert (=> b!304569 m!315667))

(declare-fun m!315669 () Bool)

(assert (=> b!304569 m!315669))

(declare-fun m!315671 () Bool)

(assert (=> b!304571 m!315671))

(assert (=> b!304571 m!315671))

(declare-fun m!315673 () Bool)

(assert (=> b!304571 m!315673))

(declare-fun m!315675 () Bool)

(assert (=> b!304572 m!315675))

(declare-fun m!315677 () Bool)

(assert (=> b!304566 m!315677))

(declare-fun m!315679 () Bool)

(assert (=> b!304573 m!315679))

(declare-fun m!315681 () Bool)

(assert (=> b!304570 m!315681))

(push 1)

(assert (not b!304569))

(assert (not b!304573))

(assert (not b!304566))

(assert (not start!30426))

(assert (not b!304572))

(assert (not b!304567))

(assert (not b!304571))

(assert (not b!304570))

(check-sat)

