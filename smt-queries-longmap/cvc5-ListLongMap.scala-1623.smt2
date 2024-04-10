; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30518 () Bool)

(assert start!30518)

(declare-fun b!305322 () Bool)

(declare-fun res!162508 () Bool)

(declare-fun e!191770 () Bool)

(assert (=> b!305322 (=> (not res!162508) (not e!191770))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305322 (= res!162508 (validKeyInArray!0 k!2441))))

(declare-fun b!305323 () Bool)

(declare-fun res!162513 () Bool)

(assert (=> b!305323 (=> (not res!162513) (not e!191770))))

(declare-datatypes ((array!15522 0))(
  ( (array!15523 (arr!7346 (Array (_ BitVec 32) (_ BitVec 64))) (size!7698 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15522)

(declare-fun arrayContainsKey!0 (array!15522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305323 (= res!162513 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305324 () Bool)

(declare-fun res!162516 () Bool)

(assert (=> b!305324 (=> (not res!162516) (not e!191770))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2486 0))(
  ( (MissingZero!2486 (index!12120 (_ BitVec 32))) (Found!2486 (index!12121 (_ BitVec 32))) (Intermediate!2486 (undefined!3298 Bool) (index!12122 (_ BitVec 32)) (x!30385 (_ BitVec 32))) (Undefined!2486) (MissingVacant!2486 (index!12123 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15522 (_ BitVec 32)) SeekEntryResult!2486)

(assert (=> b!305324 (= res!162516 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2486 i!1240)))))

(declare-fun b!305325 () Bool)

(declare-fun res!162512 () Bool)

(assert (=> b!305325 (=> (not res!162512) (not e!191770))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15522 (_ BitVec 32)) Bool)

(assert (=> b!305325 (= res!162512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!162510 () Bool)

(assert (=> start!30518 (=> (not res!162510) (not e!191770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30518 (= res!162510 (validMask!0 mask!3709))))

(assert (=> start!30518 e!191770))

(declare-fun array_inv!5309 (array!15522) Bool)

(assert (=> start!30518 (array_inv!5309 a!3293)))

(assert (=> start!30518 true))

(declare-fun e!191767 () Bool)

(declare-fun lt!150716 () (_ BitVec 32))

(declare-fun b!305326 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!305326 (= e!191767 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt lt!150716 #b00000000000000000000000000000000) (bvsge lt!150716 (bvadd #b00000000000000000000000000000001 mask!3709)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000)))))))

(declare-fun lt!150717 () SeekEntryResult!2486)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15522 (_ BitVec 32)) SeekEntryResult!2486)

(assert (=> b!305326 (= lt!150717 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!150716 k!2441 a!3293 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305326 (= lt!150716 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!305327 () Bool)

(declare-fun e!191769 () Bool)

(assert (=> b!305327 (= e!191770 e!191769)))

(declare-fun res!162515 () Bool)

(assert (=> b!305327 (=> (not res!162515) (not e!191769))))

(declare-fun lt!150715 () SeekEntryResult!2486)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305327 (= res!162515 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150715))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!305327 (= lt!150715 (Intermediate!2486 false resIndex!52 resX!52))))

(declare-fun b!305328 () Bool)

(declare-fun res!162511 () Bool)

(assert (=> b!305328 (=> (not res!162511) (not e!191769))))

(assert (=> b!305328 (= res!162511 (and (= (select (arr!7346 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7698 a!3293))))))

(declare-fun b!305329 () Bool)

(declare-fun res!162514 () Bool)

(assert (=> b!305329 (=> (not res!162514) (not e!191770))))

(assert (=> b!305329 (= res!162514 (and (= (size!7698 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7698 a!3293))))))

(declare-fun b!305330 () Bool)

(assert (=> b!305330 (= e!191769 e!191767)))

(declare-fun res!162509 () Bool)

(assert (=> b!305330 (=> (not res!162509) (not e!191767))))

(assert (=> b!305330 (= res!162509 (and (= lt!150717 lt!150715) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7346 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7346 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7346 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!305330 (= lt!150717 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!30518 res!162510) b!305329))

(assert (= (and b!305329 res!162514) b!305322))

(assert (= (and b!305322 res!162508) b!305323))

(assert (= (and b!305323 res!162513) b!305324))

(assert (= (and b!305324 res!162516) b!305325))

(assert (= (and b!305325 res!162512) b!305327))

(assert (= (and b!305327 res!162515) b!305328))

(assert (= (and b!305328 res!162511) b!305330))

(assert (= (and b!305330 res!162509) b!305326))

(declare-fun m!316289 () Bool)

(assert (=> b!305323 m!316289))

(declare-fun m!316291 () Bool)

(assert (=> start!30518 m!316291))

(declare-fun m!316293 () Bool)

(assert (=> start!30518 m!316293))

(declare-fun m!316295 () Bool)

(assert (=> b!305327 m!316295))

(assert (=> b!305327 m!316295))

(declare-fun m!316297 () Bool)

(assert (=> b!305327 m!316297))

(declare-fun m!316299 () Bool)

(assert (=> b!305330 m!316299))

(declare-fun m!316301 () Bool)

(assert (=> b!305330 m!316301))

(declare-fun m!316303 () Bool)

(assert (=> b!305324 m!316303))

(declare-fun m!316305 () Bool)

(assert (=> b!305328 m!316305))

(declare-fun m!316307 () Bool)

(assert (=> b!305325 m!316307))

(declare-fun m!316309 () Bool)

(assert (=> b!305322 m!316309))

(declare-fun m!316311 () Bool)

(assert (=> b!305326 m!316311))

(declare-fun m!316313 () Bool)

(assert (=> b!305326 m!316313))

(push 1)

(assert (not b!305325))

(assert (not b!305327))

(assert (not b!305322))

(assert (not b!305323))

(assert (not b!305330))

(assert (not start!30518))

(assert (not b!305326))

(assert (not b!305324))

(check-sat)

(pop 1)

