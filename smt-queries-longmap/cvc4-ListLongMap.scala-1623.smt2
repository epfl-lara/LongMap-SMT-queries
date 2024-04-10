; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30522 () Bool)

(assert start!30522)

(declare-fun b!305376 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!150735 () (_ BitVec 32))

(declare-fun e!191793 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!305376 (= e!191793 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt lt!150735 #b00000000000000000000000000000000) (bvsge lt!150735 (bvadd #b00000000000000000000000000000001 mask!3709)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000)))))))

(declare-datatypes ((array!15526 0))(
  ( (array!15527 (arr!7348 (Array (_ BitVec 32) (_ BitVec 64))) (size!7700 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15526)

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2488 0))(
  ( (MissingZero!2488 (index!12128 (_ BitVec 32))) (Found!2488 (index!12129 (_ BitVec 32))) (Intermediate!2488 (undefined!3300 Bool) (index!12130 (_ BitVec 32)) (x!30387 (_ BitVec 32))) (Undefined!2488) (MissingVacant!2488 (index!12131 (_ BitVec 32))) )
))
(declare-fun lt!150734 () SeekEntryResult!2488)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15526 (_ BitVec 32)) SeekEntryResult!2488)

(assert (=> b!305376 (= lt!150734 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!150735 k!2441 a!3293 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305376 (= lt!150735 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!305377 () Bool)

(declare-fun res!162564 () Bool)

(declare-fun e!191791 () Bool)

(assert (=> b!305377 (=> (not res!162564) (not e!191791))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!305377 (= res!162564 (and (= (size!7700 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7700 a!3293))))))

(declare-fun b!305378 () Bool)

(declare-fun res!162570 () Bool)

(assert (=> b!305378 (=> (not res!162570) (not e!191791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305378 (= res!162570 (validKeyInArray!0 k!2441))))

(declare-fun b!305379 () Bool)

(declare-fun e!191794 () Bool)

(assert (=> b!305379 (= e!191794 e!191793)))

(declare-fun res!162562 () Bool)

(assert (=> b!305379 (=> (not res!162562) (not e!191793))))

(declare-fun lt!150733 () SeekEntryResult!2488)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!305379 (= res!162562 (and (= lt!150734 lt!150733) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7348 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7348 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7348 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!305379 (= lt!150734 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!305380 () Bool)

(declare-fun res!162565 () Bool)

(assert (=> b!305380 (=> (not res!162565) (not e!191794))))

(assert (=> b!305380 (= res!162565 (and (= (select (arr!7348 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7700 a!3293))))))

(declare-fun res!162568 () Bool)

(assert (=> start!30522 (=> (not res!162568) (not e!191791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30522 (= res!162568 (validMask!0 mask!3709))))

(assert (=> start!30522 e!191791))

(declare-fun array_inv!5311 (array!15526) Bool)

(assert (=> start!30522 (array_inv!5311 a!3293)))

(assert (=> start!30522 true))

(declare-fun b!305381 () Bool)

(declare-fun res!162563 () Bool)

(assert (=> b!305381 (=> (not res!162563) (not e!191791))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15526 (_ BitVec 32)) SeekEntryResult!2488)

(assert (=> b!305381 (= res!162563 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2488 i!1240)))))

(declare-fun b!305382 () Bool)

(declare-fun res!162566 () Bool)

(assert (=> b!305382 (=> (not res!162566) (not e!191791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15526 (_ BitVec 32)) Bool)

(assert (=> b!305382 (= res!162566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305383 () Bool)

(assert (=> b!305383 (= e!191791 e!191794)))

(declare-fun res!162567 () Bool)

(assert (=> b!305383 (=> (not res!162567) (not e!191794))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305383 (= res!162567 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150733))))

(assert (=> b!305383 (= lt!150733 (Intermediate!2488 false resIndex!52 resX!52))))

(declare-fun b!305384 () Bool)

(declare-fun res!162569 () Bool)

(assert (=> b!305384 (=> (not res!162569) (not e!191791))))

(declare-fun arrayContainsKey!0 (array!15526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305384 (= res!162569 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30522 res!162568) b!305377))

(assert (= (and b!305377 res!162564) b!305378))

(assert (= (and b!305378 res!162570) b!305384))

(assert (= (and b!305384 res!162569) b!305381))

(assert (= (and b!305381 res!162563) b!305382))

(assert (= (and b!305382 res!162566) b!305383))

(assert (= (and b!305383 res!162567) b!305380))

(assert (= (and b!305380 res!162565) b!305379))

(assert (= (and b!305379 res!162562) b!305376))

(declare-fun m!316341 () Bool)

(assert (=> b!305381 m!316341))

(declare-fun m!316343 () Bool)

(assert (=> b!305380 m!316343))

(declare-fun m!316345 () Bool)

(assert (=> b!305383 m!316345))

(assert (=> b!305383 m!316345))

(declare-fun m!316347 () Bool)

(assert (=> b!305383 m!316347))

(declare-fun m!316349 () Bool)

(assert (=> b!305378 m!316349))

(declare-fun m!316351 () Bool)

(assert (=> b!305384 m!316351))

(declare-fun m!316353 () Bool)

(assert (=> b!305382 m!316353))

(declare-fun m!316355 () Bool)

(assert (=> b!305379 m!316355))

(declare-fun m!316357 () Bool)

(assert (=> b!305379 m!316357))

(declare-fun m!316359 () Bool)

(assert (=> b!305376 m!316359))

(declare-fun m!316361 () Bool)

(assert (=> b!305376 m!316361))

(declare-fun m!316363 () Bool)

(assert (=> start!30522 m!316363))

(declare-fun m!316365 () Bool)

(assert (=> start!30522 m!316365))

(push 1)

(assert (not start!30522))

(assert (not b!305376))

(assert (not b!305384))

(assert (not b!305379))

(assert (not b!305382))

(assert (not b!305383))

(assert (not b!305381))

(assert (not b!305378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

