; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30930 () Bool)

(assert start!30930)

(declare-fun b!310487 () Bool)

(declare-fun res!166946 () Bool)

(declare-fun e!193843 () Bool)

(assert (=> b!310487 (=> (not res!166946) (not e!193843))))

(declare-datatypes ((array!15832 0))(
  ( (array!15833 (arr!7498 (Array (_ BitVec 32) (_ BitVec 64))) (size!7850 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15832)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15832 (_ BitVec 32)) Bool)

(assert (=> b!310487 (= res!166946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310488 () Bool)

(declare-fun e!193844 () Bool)

(assert (=> b!310488 (= e!193844 (not true))))

(declare-fun e!193845 () Bool)

(assert (=> b!310488 e!193845))

(declare-fun res!166950 () Bool)

(assert (=> b!310488 (=> (not res!166950) (not e!193845))))

(declare-fun lt!151974 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2638 0))(
  ( (MissingZero!2638 (index!12728 (_ BitVec 32))) (Found!2638 (index!12729 (_ BitVec 32))) (Intermediate!2638 (undefined!3450 Bool) (index!12730 (_ BitVec 32)) (x!30955 (_ BitVec 32))) (Undefined!2638) (MissingVacant!2638 (index!12731 (_ BitVec 32))) )
))
(declare-fun lt!151977 () SeekEntryResult!2638)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15832 (_ BitVec 32)) SeekEntryResult!2638)

(assert (=> b!310488 (= res!166950 (= lt!151977 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151974 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310488 (= lt!151974 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310489 () Bool)

(declare-fun e!193842 () Bool)

(assert (=> b!310489 (= e!193842 e!193844)))

(declare-fun res!166948 () Bool)

(assert (=> b!310489 (=> (not res!166948) (not e!193844))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!151976 () SeekEntryResult!2638)

(assert (=> b!310489 (= res!166948 (and (= lt!151977 lt!151976) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7498 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310489 (= lt!151977 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310490 () Bool)

(declare-fun res!166945 () Bool)

(assert (=> b!310490 (=> (not res!166945) (not e!193843))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310490 (= res!166945 (and (= (size!7850 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7850 a!3293))))))

(declare-fun res!166947 () Bool)

(assert (=> start!30930 (=> (not res!166947) (not e!193843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30930 (= res!166947 (validMask!0 mask!3709))))

(assert (=> start!30930 e!193843))

(declare-fun array_inv!5461 (array!15832) Bool)

(assert (=> start!30930 (array_inv!5461 a!3293)))

(assert (=> start!30930 true))

(declare-fun b!310491 () Bool)

(declare-fun res!166949 () Bool)

(assert (=> b!310491 (=> (not res!166949) (not e!193843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310491 (= res!166949 (validKeyInArray!0 k!2441))))

(declare-fun b!310492 () Bool)

(declare-fun res!166941 () Bool)

(assert (=> b!310492 (=> (not res!166941) (not e!193843))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15832 (_ BitVec 32)) SeekEntryResult!2638)

(assert (=> b!310492 (= res!166941 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2638 i!1240)))))

(declare-fun b!310493 () Bool)

(declare-fun res!166944 () Bool)

(assert (=> b!310493 (=> (not res!166944) (not e!193843))))

(declare-fun arrayContainsKey!0 (array!15832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310493 (= res!166944 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310494 () Bool)

(assert (=> b!310494 (= e!193843 e!193842)))

(declare-fun res!166943 () Bool)

(assert (=> b!310494 (=> (not res!166943) (not e!193842))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310494 (= res!166943 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151976))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!310494 (= lt!151976 (Intermediate!2638 false resIndex!52 resX!52))))

(declare-fun b!310495 () Bool)

(declare-fun res!166942 () Bool)

(assert (=> b!310495 (=> (not res!166942) (not e!193842))))

(assert (=> b!310495 (= res!166942 (and (= (select (arr!7498 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7850 a!3293))))))

(declare-fun lt!151975 () array!15832)

(declare-fun b!310496 () Bool)

(assert (=> b!310496 (= e!193845 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!151975 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151974 k!2441 lt!151975 mask!3709)))))

(assert (=> b!310496 (= lt!151975 (array!15833 (store (arr!7498 a!3293) i!1240 k!2441) (size!7850 a!3293)))))

(assert (= (and start!30930 res!166947) b!310490))

(assert (= (and b!310490 res!166945) b!310491))

(assert (= (and b!310491 res!166949) b!310493))

(assert (= (and b!310493 res!166944) b!310492))

(assert (= (and b!310492 res!166941) b!310487))

(assert (= (and b!310487 res!166946) b!310494))

(assert (= (and b!310494 res!166943) b!310495))

(assert (= (and b!310495 res!166942) b!310489))

(assert (= (and b!310489 res!166948) b!310488))

(assert (= (and b!310488 res!166950) b!310496))

(declare-fun m!320397 () Bool)

(assert (=> b!310489 m!320397))

(declare-fun m!320399 () Bool)

(assert (=> b!310489 m!320399))

(declare-fun m!320401 () Bool)

(assert (=> start!30930 m!320401))

(declare-fun m!320403 () Bool)

(assert (=> start!30930 m!320403))

(declare-fun m!320405 () Bool)

(assert (=> b!310494 m!320405))

(assert (=> b!310494 m!320405))

(declare-fun m!320407 () Bool)

(assert (=> b!310494 m!320407))

(declare-fun m!320409 () Bool)

(assert (=> b!310492 m!320409))

(declare-fun m!320411 () Bool)

(assert (=> b!310493 m!320411))

(declare-fun m!320413 () Bool)

(assert (=> b!310491 m!320413))

(declare-fun m!320415 () Bool)

(assert (=> b!310488 m!320415))

(declare-fun m!320417 () Bool)

(assert (=> b!310488 m!320417))

(declare-fun m!320419 () Bool)

(assert (=> b!310495 m!320419))

(declare-fun m!320421 () Bool)

(assert (=> b!310496 m!320421))

(declare-fun m!320423 () Bool)

(assert (=> b!310496 m!320423))

(declare-fun m!320425 () Bool)

(assert (=> b!310496 m!320425))

(declare-fun m!320427 () Bool)

(assert (=> b!310487 m!320427))

(push 1)

