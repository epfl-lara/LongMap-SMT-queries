; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30232 () Bool)

(assert start!30232)

(declare-fun b!302366 () Bool)

(declare-fun res!159998 () Bool)

(declare-fun e!190546 () Bool)

(assert (=> b!302366 (=> (not res!159998) (not e!190546))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302366 (= res!159998 (validKeyInArray!0 k!2441))))

(declare-fun b!302367 () Bool)

(declare-fun res!160003 () Bool)

(assert (=> b!302367 (=> (not res!160003) (not e!190546))))

(declare-datatypes ((array!15342 0))(
  ( (array!15343 (arr!7259 (Array (_ BitVec 32) (_ BitVec 64))) (size!7612 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15342)

(declare-fun arrayContainsKey!0 (array!15342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302367 (= res!160003 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302369 () Bool)

(assert (=> b!302369 (= e!190546 false)))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2398 0))(
  ( (MissingZero!2398 (index!11768 (_ BitVec 32))) (Found!2398 (index!11769 (_ BitVec 32))) (Intermediate!2398 (undefined!3210 Bool) (index!11770 (_ BitVec 32)) (x!30050 (_ BitVec 32))) (Undefined!2398) (MissingVacant!2398 (index!11771 (_ BitVec 32))) )
))
(declare-fun lt!149879 () SeekEntryResult!2398)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15342 (_ BitVec 32)) SeekEntryResult!2398)

(assert (=> b!302369 (= lt!149879 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!302370 () Bool)

(declare-fun res!160002 () Bool)

(assert (=> b!302370 (=> (not res!160002) (not e!190546))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302370 (= res!160002 (and (= (size!7612 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7612 a!3293))))))

(declare-fun b!302371 () Bool)

(declare-fun res!159999 () Bool)

(assert (=> b!302371 (=> (not res!159999) (not e!190546))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302371 (= res!159999 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2398 false resIndex!52 resX!52)))))

(declare-fun res!160004 () Bool)

(assert (=> start!30232 (=> (not res!160004) (not e!190546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30232 (= res!160004 (validMask!0 mask!3709))))

(assert (=> start!30232 e!190546))

(declare-fun array_inv!5231 (array!15342) Bool)

(assert (=> start!30232 (array_inv!5231 a!3293)))

(assert (=> start!30232 true))

(declare-fun b!302368 () Bool)

(declare-fun res!160005 () Bool)

(assert (=> b!302368 (=> (not res!160005) (not e!190546))))

(assert (=> b!302368 (= res!160005 (and (= (select (arr!7259 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7612 a!3293))))))

(declare-fun b!302372 () Bool)

(declare-fun res!160001 () Bool)

(assert (=> b!302372 (=> (not res!160001) (not e!190546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15342 (_ BitVec 32)) Bool)

(assert (=> b!302372 (= res!160001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302373 () Bool)

(declare-fun res!160000 () Bool)

(assert (=> b!302373 (=> (not res!160000) (not e!190546))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15342 (_ BitVec 32)) SeekEntryResult!2398)

(assert (=> b!302373 (= res!160000 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2398 i!1240)))))

(assert (= (and start!30232 res!160004) b!302370))

(assert (= (and b!302370 res!160002) b!302366))

(assert (= (and b!302366 res!159998) b!302367))

(assert (= (and b!302367 res!160003) b!302373))

(assert (= (and b!302373 res!160000) b!302372))

(assert (= (and b!302372 res!160001) b!302371))

(assert (= (and b!302371 res!159999) b!302368))

(assert (= (and b!302368 res!160005) b!302369))

(declare-fun m!313403 () Bool)

(assert (=> b!302371 m!313403))

(assert (=> b!302371 m!313403))

(declare-fun m!313405 () Bool)

(assert (=> b!302371 m!313405))

(declare-fun m!313407 () Bool)

(assert (=> b!302368 m!313407))

(declare-fun m!313409 () Bool)

(assert (=> start!30232 m!313409))

(declare-fun m!313411 () Bool)

(assert (=> start!30232 m!313411))

(declare-fun m!313413 () Bool)

(assert (=> b!302373 m!313413))

(declare-fun m!313415 () Bool)

(assert (=> b!302372 m!313415))

(declare-fun m!313417 () Bool)

(assert (=> b!302367 m!313417))

(declare-fun m!313419 () Bool)

(assert (=> b!302366 m!313419))

(declare-fun m!313421 () Bool)

(assert (=> b!302369 m!313421))

(push 1)

(assert (not b!302372))

(assert (not b!302373))

(assert (not b!302367))

(assert (not b!302369))

(assert (not b!302366))

(assert (not start!30232))

(assert (not b!302371))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

