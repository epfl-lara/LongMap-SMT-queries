; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30990 () Bool)

(assert start!30990)

(declare-fun b!311387 () Bool)

(declare-fun e!194296 () Bool)

(declare-fun e!194292 () Bool)

(assert (=> b!311387 (= e!194296 e!194292)))

(declare-fun res!167842 () Bool)

(assert (=> b!311387 (=> (not res!167842) (not e!194292))))

(declare-datatypes ((array!15892 0))(
  ( (array!15893 (arr!7528 (Array (_ BitVec 32) (_ BitVec 64))) (size!7880 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15892)

(declare-datatypes ((SeekEntryResult!2668 0))(
  ( (MissingZero!2668 (index!12848 (_ BitVec 32))) (Found!2668 (index!12849 (_ BitVec 32))) (Intermediate!2668 (undefined!3480 Bool) (index!12850 (_ BitVec 32)) (x!31065 (_ BitVec 32))) (Undefined!2668) (MissingVacant!2668 (index!12851 (_ BitVec 32))) )
))
(declare-fun lt!152334 () SeekEntryResult!2668)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15892 (_ BitVec 32)) SeekEntryResult!2668)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311387 (= res!167842 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152334))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311387 (= lt!152334 (Intermediate!2668 false resIndex!52 resX!52))))

(declare-fun b!311388 () Bool)

(declare-fun e!194294 () Bool)

(declare-fun lt!152335 () (_ BitVec 32))

(declare-fun lt!152336 () array!15892)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311388 (= e!194294 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152336 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152335 k!2441 lt!152336 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311388 (= lt!152336 (array!15893 (store (arr!7528 a!3293) i!1240 k!2441) (size!7880 a!3293)))))

(declare-fun b!311389 () Bool)

(declare-fun res!167844 () Bool)

(assert (=> b!311389 (=> (not res!167844) (not e!194296))))

(assert (=> b!311389 (= res!167844 (and (= (size!7880 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7880 a!3293))))))

(declare-fun res!167845 () Bool)

(assert (=> start!30990 (=> (not res!167845) (not e!194296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30990 (= res!167845 (validMask!0 mask!3709))))

(assert (=> start!30990 e!194296))

(declare-fun array_inv!5491 (array!15892) Bool)

(assert (=> start!30990 (array_inv!5491 a!3293)))

(assert (=> start!30990 true))

(declare-fun b!311390 () Bool)

(declare-fun e!194293 () Bool)

(assert (=> b!311390 (= e!194293 (not true))))

(assert (=> b!311390 e!194294))

(declare-fun res!167849 () Bool)

(assert (=> b!311390 (=> (not res!167849) (not e!194294))))

(declare-fun lt!152337 () SeekEntryResult!2668)

(assert (=> b!311390 (= res!167849 (= lt!152337 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152335 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311390 (= lt!152335 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311391 () Bool)

(assert (=> b!311391 (= e!194292 e!194293)))

(declare-fun res!167846 () Bool)

(assert (=> b!311391 (=> (not res!167846) (not e!194293))))

(assert (=> b!311391 (= res!167846 (and (= lt!152337 lt!152334) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7528 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311391 (= lt!152337 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311392 () Bool)

(declare-fun res!167847 () Bool)

(assert (=> b!311392 (=> (not res!167847) (not e!194296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15892 (_ BitVec 32)) Bool)

(assert (=> b!311392 (= res!167847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311393 () Bool)

(declare-fun res!167843 () Bool)

(assert (=> b!311393 (=> (not res!167843) (not e!194296))))

(declare-fun arrayContainsKey!0 (array!15892 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311393 (= res!167843 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311394 () Bool)

(declare-fun res!167850 () Bool)

(assert (=> b!311394 (=> (not res!167850) (not e!194292))))

(assert (=> b!311394 (= res!167850 (and (= (select (arr!7528 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7880 a!3293))))))

(declare-fun b!311395 () Bool)

(declare-fun res!167841 () Bool)

(assert (=> b!311395 (=> (not res!167841) (not e!194296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311395 (= res!167841 (validKeyInArray!0 k!2441))))

(declare-fun b!311396 () Bool)

(declare-fun res!167848 () Bool)

(assert (=> b!311396 (=> (not res!167848) (not e!194296))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15892 (_ BitVec 32)) SeekEntryResult!2668)

(assert (=> b!311396 (= res!167848 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2668 i!1240)))))

(assert (= (and start!30990 res!167845) b!311389))

(assert (= (and b!311389 res!167844) b!311395))

(assert (= (and b!311395 res!167841) b!311393))

(assert (= (and b!311393 res!167843) b!311396))

(assert (= (and b!311396 res!167848) b!311392))

(assert (= (and b!311392 res!167847) b!311387))

(assert (= (and b!311387 res!167842) b!311394))

(assert (= (and b!311394 res!167850) b!311391))

(assert (= (and b!311391 res!167846) b!311390))

(assert (= (and b!311390 res!167849) b!311388))

(declare-fun m!321357 () Bool)

(assert (=> b!311396 m!321357))

(declare-fun m!321359 () Bool)

(assert (=> b!311388 m!321359))

(declare-fun m!321361 () Bool)

(assert (=> b!311388 m!321361))

(declare-fun m!321363 () Bool)

(assert (=> b!311388 m!321363))

(declare-fun m!321365 () Bool)

(assert (=> start!30990 m!321365))

(declare-fun m!321367 () Bool)

(assert (=> start!30990 m!321367))

(declare-fun m!321369 () Bool)

(assert (=> b!311390 m!321369))

(declare-fun m!321371 () Bool)

(assert (=> b!311390 m!321371))

(declare-fun m!321373 () Bool)

(assert (=> b!311392 m!321373))

(declare-fun m!321375 () Bool)

(assert (=> b!311391 m!321375))

(declare-fun m!321377 () Bool)

(assert (=> b!311391 m!321377))

(declare-fun m!321379 () Bool)

(assert (=> b!311395 m!321379))

(declare-fun m!321381 () Bool)

(assert (=> b!311393 m!321381))

(declare-fun m!321383 () Bool)

(assert (=> b!311394 m!321383))

(declare-fun m!321385 () Bool)

(assert (=> b!311387 m!321385))

(assert (=> b!311387 m!321385))

(declare-fun m!321387 () Bool)

(assert (=> b!311387 m!321387))

(push 1)

(assert (not b!311392))

(assert (not start!30990))

(assert (not b!311393))

(assert (not b!311395))

