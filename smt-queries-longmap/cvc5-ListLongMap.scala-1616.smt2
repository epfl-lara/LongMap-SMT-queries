; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30422 () Bool)

(assert start!30422)

(declare-fun b!304512 () Bool)

(declare-fun res!161858 () Bool)

(declare-fun e!191371 () Bool)

(assert (=> b!304512 (=> (not res!161858) (not e!191371))))

(declare-datatypes ((array!15477 0))(
  ( (array!15478 (arr!7325 (Array (_ BitVec 32) (_ BitVec 64))) (size!7677 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15477)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15477 (_ BitVec 32)) Bool)

(assert (=> b!304512 (= res!161858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304513 () Bool)

(declare-fun e!191368 () Bool)

(assert (=> b!304513 (= e!191368 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!2465 0))(
  ( (MissingZero!2465 (index!12036 (_ BitVec 32))) (Found!2465 (index!12037 (_ BitVec 32))) (Intermediate!2465 (undefined!3277 Bool) (index!12038 (_ BitVec 32)) (x!30299 (_ BitVec 32))) (Undefined!2465) (MissingVacant!2465 (index!12039 (_ BitVec 32))) )
))
(declare-fun lt!150467 () SeekEntryResult!2465)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15477 (_ BitVec 32)) SeekEntryResult!2465)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304513 (= lt!150467 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun res!161863 () Bool)

(assert (=> start!30422 (=> (not res!161863) (not e!191371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30422 (= res!161863 (validMask!0 mask!3709))))

(assert (=> start!30422 e!191371))

(declare-fun array_inv!5288 (array!15477) Bool)

(assert (=> start!30422 (array_inv!5288 a!3293)))

(assert (=> start!30422 true))

(declare-fun b!304514 () Bool)

(declare-fun res!161860 () Bool)

(assert (=> b!304514 (=> (not res!161860) (not e!191371))))

(declare-fun arrayContainsKey!0 (array!15477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304514 (= res!161860 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304515 () Bool)

(declare-fun res!161862 () Bool)

(assert (=> b!304515 (=> (not res!161862) (not e!191371))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304515 (= res!161862 (and (= (size!7677 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7677 a!3293))))))

(declare-fun b!304516 () Bool)

(declare-fun e!191369 () Bool)

(assert (=> b!304516 (= e!191371 e!191369)))

(declare-fun res!161857 () Bool)

(assert (=> b!304516 (=> (not res!161857) (not e!191369))))

(declare-fun lt!150468 () SeekEntryResult!2465)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304516 (= res!161857 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150468))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304516 (= lt!150468 (Intermediate!2465 false resIndex!52 resX!52))))

(declare-fun b!304517 () Bool)

(declare-fun res!161859 () Bool)

(assert (=> b!304517 (=> (not res!161859) (not e!191371))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15477 (_ BitVec 32)) SeekEntryResult!2465)

(assert (=> b!304517 (= res!161859 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2465 i!1240)))))

(declare-fun b!304518 () Bool)

(declare-fun res!161865 () Bool)

(assert (=> b!304518 (=> (not res!161865) (not e!191369))))

(assert (=> b!304518 (= res!161865 (and (= (select (arr!7325 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7677 a!3293))))))

(declare-fun b!304519 () Bool)

(declare-fun res!161864 () Bool)

(assert (=> b!304519 (=> (not res!161864) (not e!191371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304519 (= res!161864 (validKeyInArray!0 k!2441))))

(declare-fun b!304520 () Bool)

(assert (=> b!304520 (= e!191369 e!191368)))

(declare-fun res!161861 () Bool)

(assert (=> b!304520 (=> (not res!161861) (not e!191368))))

(assert (=> b!304520 (= res!161861 (and (= lt!150467 lt!150468) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7325 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7325 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7325 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304520 (= lt!150467 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!30422 res!161863) b!304515))

(assert (= (and b!304515 res!161862) b!304519))

(assert (= (and b!304519 res!161864) b!304514))

(assert (= (and b!304514 res!161860) b!304517))

(assert (= (and b!304517 res!161859) b!304512))

(assert (= (and b!304512 res!161858) b!304516))

(assert (= (and b!304516 res!161857) b!304518))

(assert (= (and b!304518 res!161865) b!304520))

(assert (= (and b!304520 res!161861) b!304513))

(declare-fun m!315605 () Bool)

(assert (=> b!304518 m!315605))

(declare-fun m!315607 () Bool)

(assert (=> start!30422 m!315607))

(declare-fun m!315609 () Bool)

(assert (=> start!30422 m!315609))

(declare-fun m!315611 () Bool)

(assert (=> b!304519 m!315611))

(declare-fun m!315613 () Bool)

(assert (=> b!304513 m!315613))

(assert (=> b!304513 m!315613))

(declare-fun m!315615 () Bool)

(assert (=> b!304513 m!315615))

(declare-fun m!315617 () Bool)

(assert (=> b!304517 m!315617))

(declare-fun m!315619 () Bool)

(assert (=> b!304514 m!315619))

(declare-fun m!315621 () Bool)

(assert (=> b!304512 m!315621))

(declare-fun m!315623 () Bool)

(assert (=> b!304520 m!315623))

(declare-fun m!315625 () Bool)

(assert (=> b!304520 m!315625))

(declare-fun m!315627 () Bool)

(assert (=> b!304516 m!315627))

(assert (=> b!304516 m!315627))

(declare-fun m!315629 () Bool)

(assert (=> b!304516 m!315629))

(push 1)

(assert (not b!304513))

