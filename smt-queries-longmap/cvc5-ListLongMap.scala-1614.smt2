; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30410 () Bool)

(assert start!30410)

(declare-fun b!304343 () Bool)

(declare-fun res!161695 () Bool)

(declare-fun e!191303 () Bool)

(assert (=> b!304343 (=> (not res!161695) (not e!191303))))

(declare-datatypes ((array!15465 0))(
  ( (array!15466 (arr!7319 (Array (_ BitVec 32) (_ BitVec 64))) (size!7671 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15465)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304343 (= res!161695 (and (= (select (arr!7319 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7671 a!3293))))))

(declare-fun b!304344 () Bool)

(declare-fun res!161693 () Bool)

(declare-fun e!191304 () Bool)

(assert (=> b!304344 (=> (not res!161693) (not e!191304))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15465 (_ BitVec 32)) Bool)

(assert (=> b!304344 (= res!161693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304345 () Bool)

(declare-fun res!161688 () Bool)

(assert (=> b!304345 (=> (not res!161688) (not e!191304))))

(assert (=> b!304345 (= res!161688 (and (= (size!7671 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7671 a!3293))))))

(declare-fun b!304346 () Bool)

(declare-fun res!161689 () Bool)

(assert (=> b!304346 (=> (not res!161689) (not e!191304))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304346 (= res!161689 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!161694 () Bool)

(assert (=> start!30410 (=> (not res!161694) (not e!191304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30410 (= res!161694 (validMask!0 mask!3709))))

(assert (=> start!30410 e!191304))

(declare-fun array_inv!5282 (array!15465) Bool)

(assert (=> start!30410 (array_inv!5282 a!3293)))

(assert (=> start!30410 true))

(declare-fun b!304347 () Bool)

(declare-fun res!161696 () Bool)

(assert (=> b!304347 (=> (not res!161696) (not e!191303))))

(assert (=> b!304347 (= res!161696 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7319 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7319 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7319 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!304348 () Bool)

(assert (=> b!304348 (= e!191303 false)))

(declare-fun lt!150432 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304348 (= lt!150432 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!304349 () Bool)

(declare-fun res!161691 () Bool)

(assert (=> b!304349 (=> (not res!161691) (not e!191304))))

(declare-datatypes ((SeekEntryResult!2459 0))(
  ( (MissingZero!2459 (index!12012 (_ BitVec 32))) (Found!2459 (index!12013 (_ BitVec 32))) (Intermediate!2459 (undefined!3271 Bool) (index!12014 (_ BitVec 32)) (x!30277 (_ BitVec 32))) (Undefined!2459) (MissingVacant!2459 (index!12015 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15465 (_ BitVec 32)) SeekEntryResult!2459)

(assert (=> b!304349 (= res!161691 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2459 i!1240)))))

(declare-fun b!304350 () Bool)

(declare-fun res!161697 () Bool)

(assert (=> b!304350 (=> (not res!161697) (not e!191304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304350 (= res!161697 (validKeyInArray!0 k!2441))))

(declare-fun b!304351 () Bool)

(assert (=> b!304351 (= e!191304 e!191303)))

(declare-fun res!161690 () Bool)

(assert (=> b!304351 (=> (not res!161690) (not e!191303))))

(declare-fun lt!150431 () SeekEntryResult!2459)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15465 (_ BitVec 32)) SeekEntryResult!2459)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304351 (= res!161690 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150431))))

(assert (=> b!304351 (= lt!150431 (Intermediate!2459 false resIndex!52 resX!52))))

(declare-fun b!304352 () Bool)

(declare-fun res!161692 () Bool)

(assert (=> b!304352 (=> (not res!161692) (not e!191303))))

(assert (=> b!304352 (= res!161692 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150431))))

(assert (= (and start!30410 res!161694) b!304345))

(assert (= (and b!304345 res!161688) b!304350))

(assert (= (and b!304350 res!161697) b!304346))

(assert (= (and b!304346 res!161689) b!304349))

(assert (= (and b!304349 res!161691) b!304344))

(assert (= (and b!304344 res!161693) b!304351))

(assert (= (and b!304351 res!161690) b!304343))

(assert (= (and b!304343 res!161695) b!304352))

(assert (= (and b!304352 res!161692) b!304347))

(assert (= (and b!304347 res!161696) b!304348))

(declare-fun m!315455 () Bool)

(assert (=> b!304350 m!315455))

(declare-fun m!315457 () Bool)

(assert (=> b!304351 m!315457))

(assert (=> b!304351 m!315457))

(declare-fun m!315459 () Bool)

(assert (=> b!304351 m!315459))

(declare-fun m!315461 () Bool)

(assert (=> b!304343 m!315461))

(declare-fun m!315463 () Bool)

(assert (=> b!304349 m!315463))

(declare-fun m!315465 () Bool)

(assert (=> b!304348 m!315465))

(declare-fun m!315467 () Bool)

(assert (=> b!304347 m!315467))

(declare-fun m!315469 () Bool)

(assert (=> b!304346 m!315469))

(declare-fun m!315471 () Bool)

(assert (=> b!304344 m!315471))

(declare-fun m!315473 () Bool)

(assert (=> b!304352 m!315473))

(declare-fun m!315475 () Bool)

(assert (=> start!30410 m!315475))

(declare-fun m!315477 () Bool)

(assert (=> start!30410 m!315477))

(push 1)

