; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30818 () Bool)

(assert start!30818)

(declare-fun b!309417 () Bool)

(declare-fun res!166037 () Bool)

(declare-fun e!193305 () Bool)

(assert (=> b!309417 (=> (not res!166037) (not e!193305))))

(declare-datatypes ((array!15771 0))(
  ( (array!15772 (arr!7469 (Array (_ BitVec 32) (_ BitVec 64))) (size!7821 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15771)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!309417 (= res!166037 (and (= (select (arr!7469 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7821 a!3293))))))

(declare-fun b!309418 () Bool)

(declare-fun e!193304 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!309418 (= e!193304 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!2609 0))(
  ( (MissingZero!2609 (index!12612 (_ BitVec 32))) (Found!2609 (index!12613 (_ BitVec 32))) (Intermediate!2609 (undefined!3421 Bool) (index!12614 (_ BitVec 32)) (x!30845 (_ BitVec 32))) (Undefined!2609) (MissingVacant!2609 (index!12615 (_ BitVec 32))) )
))
(declare-fun lt!151583 () SeekEntryResult!2609)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15771 (_ BitVec 32)) SeekEntryResult!2609)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309418 (= lt!151583 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!309419 () Bool)

(declare-fun res!166032 () Bool)

(declare-fun e!193303 () Bool)

(assert (=> b!309419 (=> (not res!166032) (not e!193303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309419 (= res!166032 (validKeyInArray!0 k!2441))))

(declare-fun b!309420 () Bool)

(declare-fun res!166038 () Bool)

(assert (=> b!309420 (=> (not res!166038) (not e!193303))))

(declare-fun arrayContainsKey!0 (array!15771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309420 (= res!166038 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!166036 () Bool)

(assert (=> start!30818 (=> (not res!166036) (not e!193303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30818 (= res!166036 (validMask!0 mask!3709))))

(assert (=> start!30818 e!193303))

(declare-fun array_inv!5432 (array!15771) Bool)

(assert (=> start!30818 (array_inv!5432 a!3293)))

(assert (=> start!30818 true))

(declare-fun b!309421 () Bool)

(declare-fun res!166031 () Bool)

(assert (=> b!309421 (=> (not res!166031) (not e!193303))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15771 (_ BitVec 32)) SeekEntryResult!2609)

(assert (=> b!309421 (= res!166031 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2609 i!1240)))))

(declare-fun b!309422 () Bool)

(declare-fun res!166030 () Bool)

(assert (=> b!309422 (=> (not res!166030) (not e!193303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15771 (_ BitVec 32)) Bool)

(assert (=> b!309422 (= res!166030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309423 () Bool)

(declare-fun res!166034 () Bool)

(assert (=> b!309423 (=> (not res!166034) (not e!193303))))

(assert (=> b!309423 (= res!166034 (and (= (size!7821 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7821 a!3293))))))

(declare-fun b!309424 () Bool)

(assert (=> b!309424 (= e!193303 e!193305)))

(declare-fun res!166035 () Bool)

(assert (=> b!309424 (=> (not res!166035) (not e!193305))))

(declare-fun lt!151584 () SeekEntryResult!2609)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309424 (= res!166035 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151584))))

(assert (=> b!309424 (= lt!151584 (Intermediate!2609 false resIndex!52 resX!52))))

(declare-fun b!309425 () Bool)

(assert (=> b!309425 (= e!193305 e!193304)))

(declare-fun res!166033 () Bool)

(assert (=> b!309425 (=> (not res!166033) (not e!193304))))

(assert (=> b!309425 (= res!166033 (and (= lt!151583 lt!151584) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7469 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309425 (= lt!151583 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!30818 res!166036) b!309423))

(assert (= (and b!309423 res!166034) b!309419))

(assert (= (and b!309419 res!166032) b!309420))

(assert (= (and b!309420 res!166038) b!309421))

(assert (= (and b!309421 res!166031) b!309422))

(assert (= (and b!309422 res!166030) b!309424))

(assert (= (and b!309424 res!166035) b!309417))

(assert (= (and b!309417 res!166037) b!309425))

(assert (= (and b!309425 res!166033) b!309418))

(declare-fun m!319421 () Bool)

(assert (=> b!309419 m!319421))

(declare-fun m!319423 () Bool)

(assert (=> start!30818 m!319423))

(declare-fun m!319425 () Bool)

(assert (=> start!30818 m!319425))

(declare-fun m!319427 () Bool)

(assert (=> b!309422 m!319427))

(declare-fun m!319429 () Bool)

(assert (=> b!309425 m!319429))

(declare-fun m!319431 () Bool)

(assert (=> b!309425 m!319431))

(declare-fun m!319433 () Bool)

(assert (=> b!309421 m!319433))

(declare-fun m!319435 () Bool)

(assert (=> b!309418 m!319435))

(assert (=> b!309418 m!319435))

(declare-fun m!319437 () Bool)

(assert (=> b!309418 m!319437))

(declare-fun m!319439 () Bool)

(assert (=> b!309420 m!319439))

(declare-fun m!319441 () Bool)

(assert (=> b!309424 m!319441))

(assert (=> b!309424 m!319441))

(declare-fun m!319443 () Bool)

(assert (=> b!309424 m!319443))

(declare-fun m!319445 () Bool)

(assert (=> b!309417 m!319445))

(push 1)

