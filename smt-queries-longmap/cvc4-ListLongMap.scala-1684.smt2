; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30996 () Bool)

(assert start!30996)

(declare-fun b!311477 () Bool)

(declare-fun e!194339 () Bool)

(declare-fun e!194338 () Bool)

(assert (=> b!311477 (= e!194339 e!194338)))

(declare-fun res!167936 () Bool)

(assert (=> b!311477 (=> (not res!167936) (not e!194338))))

(declare-datatypes ((array!15898 0))(
  ( (array!15899 (arr!7531 (Array (_ BitVec 32) (_ BitVec 64))) (size!7883 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15898)

(declare-datatypes ((SeekEntryResult!2671 0))(
  ( (MissingZero!2671 (index!12860 (_ BitVec 32))) (Found!2671 (index!12861 (_ BitVec 32))) (Intermediate!2671 (undefined!3483 Bool) (index!12862 (_ BitVec 32)) (x!31076 (_ BitVec 32))) (Undefined!2671) (MissingVacant!2671 (index!12863 (_ BitVec 32))) )
))
(declare-fun lt!152373 () SeekEntryResult!2671)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152372 () SeekEntryResult!2671)

(assert (=> b!311477 (= res!167936 (and (= lt!152372 lt!152373) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7531 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15898 (_ BitVec 32)) SeekEntryResult!2671)

(assert (=> b!311477 (= lt!152372 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun res!167934 () Bool)

(declare-fun e!194341 () Bool)

(assert (=> start!30996 (=> (not res!167934) (not e!194341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30996 (= res!167934 (validMask!0 mask!3709))))

(assert (=> start!30996 e!194341))

(declare-fun array_inv!5494 (array!15898) Bool)

(assert (=> start!30996 (array_inv!5494 a!3293)))

(assert (=> start!30996 true))

(declare-fun b!311478 () Bool)

(declare-fun res!167939 () Bool)

(assert (=> b!311478 (=> (not res!167939) (not e!194339))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311478 (= res!167939 (and (= (select (arr!7531 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7883 a!3293))))))

(declare-fun b!311479 () Bool)

(declare-fun e!194337 () Bool)

(declare-fun lt!152371 () array!15898)

(declare-fun lt!152370 () (_ BitVec 32))

(assert (=> b!311479 (= e!194337 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152371 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152370 k!2441 lt!152371 mask!3709)))))

(assert (=> b!311479 (= lt!152371 (array!15899 (store (arr!7531 a!3293) i!1240 k!2441) (size!7883 a!3293)))))

(declare-fun b!311480 () Bool)

(declare-fun res!167931 () Bool)

(assert (=> b!311480 (=> (not res!167931) (not e!194341))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15898 (_ BitVec 32)) SeekEntryResult!2671)

(assert (=> b!311480 (= res!167931 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2671 i!1240)))))

(declare-fun b!311481 () Bool)

(declare-fun res!167937 () Bool)

(assert (=> b!311481 (=> (not res!167937) (not e!194341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311481 (= res!167937 (validKeyInArray!0 k!2441))))

(declare-fun b!311482 () Bool)

(assert (=> b!311482 (= e!194338 (not true))))

(assert (=> b!311482 e!194337))

(declare-fun res!167938 () Bool)

(assert (=> b!311482 (=> (not res!167938) (not e!194337))))

(assert (=> b!311482 (= res!167938 (= lt!152372 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152370 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311482 (= lt!152370 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311483 () Bool)

(declare-fun res!167933 () Bool)

(assert (=> b!311483 (=> (not res!167933) (not e!194341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15898 (_ BitVec 32)) Bool)

(assert (=> b!311483 (= res!167933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311484 () Bool)

(declare-fun res!167935 () Bool)

(assert (=> b!311484 (=> (not res!167935) (not e!194341))))

(assert (=> b!311484 (= res!167935 (and (= (size!7883 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7883 a!3293))))))

(declare-fun b!311485 () Bool)

(declare-fun res!167940 () Bool)

(assert (=> b!311485 (=> (not res!167940) (not e!194341))))

(declare-fun arrayContainsKey!0 (array!15898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311485 (= res!167940 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311486 () Bool)

(assert (=> b!311486 (= e!194341 e!194339)))

(declare-fun res!167932 () Bool)

(assert (=> b!311486 (=> (not res!167932) (not e!194339))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311486 (= res!167932 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152373))))

(assert (=> b!311486 (= lt!152373 (Intermediate!2671 false resIndex!52 resX!52))))

(assert (= (and start!30996 res!167934) b!311484))

(assert (= (and b!311484 res!167935) b!311481))

(assert (= (and b!311481 res!167937) b!311485))

(assert (= (and b!311485 res!167940) b!311480))

(assert (= (and b!311480 res!167931) b!311483))

(assert (= (and b!311483 res!167933) b!311486))

(assert (= (and b!311486 res!167932) b!311478))

(assert (= (and b!311478 res!167939) b!311477))

(assert (= (and b!311477 res!167936) b!311482))

(assert (= (and b!311482 res!167938) b!311479))

(declare-fun m!321453 () Bool)

(assert (=> b!311482 m!321453))

(declare-fun m!321455 () Bool)

(assert (=> b!311482 m!321455))

(declare-fun m!321457 () Bool)

(assert (=> b!311480 m!321457))

(declare-fun m!321459 () Bool)

(assert (=> b!311481 m!321459))

(declare-fun m!321461 () Bool)

(assert (=> b!311477 m!321461))

(declare-fun m!321463 () Bool)

(assert (=> b!311477 m!321463))

(declare-fun m!321465 () Bool)

(assert (=> b!311486 m!321465))

(assert (=> b!311486 m!321465))

(declare-fun m!321467 () Bool)

(assert (=> b!311486 m!321467))

(declare-fun m!321469 () Bool)

(assert (=> b!311479 m!321469))

(declare-fun m!321471 () Bool)

(assert (=> b!311479 m!321471))

(declare-fun m!321473 () Bool)

(assert (=> b!311479 m!321473))

(declare-fun m!321475 () Bool)

(assert (=> b!311485 m!321475))

(declare-fun m!321477 () Bool)

(assert (=> b!311478 m!321477))

(declare-fun m!321479 () Bool)

(assert (=> start!30996 m!321479))

(declare-fun m!321481 () Bool)

(assert (=> start!30996 m!321481))

(declare-fun m!321483 () Bool)

(assert (=> b!311483 m!321483))

(push 1)

(assert (not b!311479))

(assert (not b!311482))

(assert (not b!311486))

