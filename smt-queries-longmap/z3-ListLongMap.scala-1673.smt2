; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30912 () Bool)

(assert start!30912)

(declare-fun b!310374 () Bool)

(declare-fun res!166878 () Bool)

(declare-fun e!193779 () Bool)

(assert (=> b!310374 (=> (not res!166878) (not e!193779))))

(declare-datatypes ((array!15827 0))(
  ( (array!15828 (arr!7495 (Array (_ BitVec 32) (_ BitVec 64))) (size!7847 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15827)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310374 (= res!166878 (and (= (size!7847 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7847 a!3293))))))

(declare-fun b!310375 () Bool)

(declare-fun res!166887 () Bool)

(assert (=> b!310375 (=> (not res!166887) (not e!193779))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2600 0))(
  ( (MissingZero!2600 (index!12576 (_ BitVec 32))) (Found!2600 (index!12577 (_ BitVec 32))) (Intermediate!2600 (undefined!3412 Bool) (index!12578 (_ BitVec 32)) (x!30914 (_ BitVec 32))) (Undefined!2600) (MissingVacant!2600 (index!12579 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15827 (_ BitVec 32)) SeekEntryResult!2600)

(assert (=> b!310375 (= res!166887 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2600 i!1240)))))

(declare-fun res!166884 () Bool)

(assert (=> start!30912 (=> (not res!166884) (not e!193779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30912 (= res!166884 (validMask!0 mask!3709))))

(assert (=> start!30912 e!193779))

(declare-fun array_inv!5445 (array!15827) Bool)

(assert (=> start!30912 (array_inv!5445 a!3293)))

(assert (=> start!30912 true))

(declare-fun lt!151969 () (_ BitVec 32))

(declare-fun e!193781 () Bool)

(declare-fun lt!151970 () array!15827)

(declare-fun b!310376 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15827 (_ BitVec 32)) SeekEntryResult!2600)

(assert (=> b!310376 (= e!193781 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151970 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151969 k0!2441 lt!151970 mask!3709)))))

(assert (=> b!310376 (= lt!151970 (array!15828 (store (arr!7495 a!3293) i!1240 k0!2441) (size!7847 a!3293)))))

(declare-fun b!310377 () Bool)

(declare-fun res!166883 () Bool)

(assert (=> b!310377 (=> (not res!166883) (not e!193779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15827 (_ BitVec 32)) Bool)

(assert (=> b!310377 (= res!166883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310378 () Bool)

(declare-fun res!166879 () Bool)

(declare-fun e!193778 () Bool)

(assert (=> b!310378 (=> (not res!166879) (not e!193778))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310378 (= res!166879 (and (= (select (arr!7495 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7847 a!3293))))))

(declare-fun b!310379 () Bool)

(declare-fun e!193782 () Bool)

(assert (=> b!310379 (= e!193778 e!193782)))

(declare-fun res!166881 () Bool)

(assert (=> b!310379 (=> (not res!166881) (not e!193782))))

(declare-fun lt!151968 () SeekEntryResult!2600)

(declare-fun lt!151971 () SeekEntryResult!2600)

(assert (=> b!310379 (= res!166881 (and (= lt!151968 lt!151971) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7495 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310379 (= lt!151968 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310380 () Bool)

(declare-fun res!166886 () Bool)

(assert (=> b!310380 (=> (not res!166886) (not e!193779))))

(declare-fun arrayContainsKey!0 (array!15827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310380 (= res!166886 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310381 () Bool)

(declare-fun res!166882 () Bool)

(assert (=> b!310381 (=> (not res!166882) (not e!193779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310381 (= res!166882 (validKeyInArray!0 k0!2441))))

(declare-fun b!310382 () Bool)

(assert (=> b!310382 (= e!193782 (not true))))

(assert (=> b!310382 e!193781))

(declare-fun res!166885 () Bool)

(assert (=> b!310382 (=> (not res!166885) (not e!193781))))

(assert (=> b!310382 (= res!166885 (= lt!151968 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151969 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310382 (= lt!151969 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!310383 () Bool)

(assert (=> b!310383 (= e!193779 e!193778)))

(declare-fun res!166880 () Bool)

(assert (=> b!310383 (=> (not res!166880) (not e!193778))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310383 (= res!166880 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151971))))

(assert (=> b!310383 (= lt!151971 (Intermediate!2600 false resIndex!52 resX!52))))

(assert (= (and start!30912 res!166884) b!310374))

(assert (= (and b!310374 res!166878) b!310381))

(assert (= (and b!310381 res!166882) b!310380))

(assert (= (and b!310380 res!166886) b!310375))

(assert (= (and b!310375 res!166887) b!310377))

(assert (= (and b!310377 res!166883) b!310383))

(assert (= (and b!310383 res!166880) b!310378))

(assert (= (and b!310378 res!166879) b!310379))

(assert (= (and b!310379 res!166881) b!310382))

(assert (= (and b!310382 res!166885) b!310376))

(declare-fun m!320467 () Bool)

(assert (=> b!310381 m!320467))

(declare-fun m!320469 () Bool)

(assert (=> b!310383 m!320469))

(assert (=> b!310383 m!320469))

(declare-fun m!320471 () Bool)

(assert (=> b!310383 m!320471))

(declare-fun m!320473 () Bool)

(assert (=> start!30912 m!320473))

(declare-fun m!320475 () Bool)

(assert (=> start!30912 m!320475))

(declare-fun m!320477 () Bool)

(assert (=> b!310376 m!320477))

(declare-fun m!320479 () Bool)

(assert (=> b!310376 m!320479))

(declare-fun m!320481 () Bool)

(assert (=> b!310376 m!320481))

(declare-fun m!320483 () Bool)

(assert (=> b!310377 m!320483))

(declare-fun m!320485 () Bool)

(assert (=> b!310375 m!320485))

(declare-fun m!320487 () Bool)

(assert (=> b!310382 m!320487))

(declare-fun m!320489 () Bool)

(assert (=> b!310382 m!320489))

(declare-fun m!320491 () Bool)

(assert (=> b!310378 m!320491))

(declare-fun m!320493 () Bool)

(assert (=> b!310379 m!320493))

(declare-fun m!320495 () Bool)

(assert (=> b!310379 m!320495))

(declare-fun m!320497 () Bool)

(assert (=> b!310380 m!320497))

(check-sat (not b!310380) (not b!310377) (not b!310375) (not start!30912) (not b!310379) (not b!310381) (not b!310382) (not b!310376) (not b!310383))
(check-sat)
