; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31056 () Bool)

(assert start!31056)

(declare-fun b!312377 () Bool)

(declare-fun res!168834 () Bool)

(declare-fun e!194791 () Bool)

(assert (=> b!312377 (=> (not res!168834) (not e!194791))))

(declare-datatypes ((array!15958 0))(
  ( (array!15959 (arr!7561 (Array (_ BitVec 32) (_ BitVec 64))) (size!7913 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15958)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312377 (= res!168834 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312378 () Bool)

(declare-fun res!168832 () Bool)

(declare-fun e!194789 () Bool)

(assert (=> b!312378 (=> (not res!168832) (not e!194789))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312378 (= res!168832 (and (= (select (arr!7561 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7913 a!3293))))))

(declare-fun res!168831 () Bool)

(assert (=> start!31056 (=> (not res!168831) (not e!194791))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31056 (= res!168831 (validMask!0 mask!3709))))

(assert (=> start!31056 e!194791))

(declare-fun array_inv!5524 (array!15958) Bool)

(assert (=> start!31056 (array_inv!5524 a!3293)))

(assert (=> start!31056 true))

(declare-fun b!312379 () Bool)

(declare-fun res!168833 () Bool)

(assert (=> b!312379 (=> (not res!168833) (not e!194791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312379 (= res!168833 (validKeyInArray!0 k!2441))))

(declare-fun b!312380 () Bool)

(assert (=> b!312380 (= e!194791 e!194789)))

(declare-fun res!168835 () Bool)

(assert (=> b!312380 (=> (not res!168835) (not e!194789))))

(declare-datatypes ((SeekEntryResult!2701 0))(
  ( (MissingZero!2701 (index!12980 (_ BitVec 32))) (Found!2701 (index!12981 (_ BitVec 32))) (Intermediate!2701 (undefined!3513 Bool) (index!12982 (_ BitVec 32)) (x!31186 (_ BitVec 32))) (Undefined!2701) (MissingVacant!2701 (index!12983 (_ BitVec 32))) )
))
(declare-fun lt!152980 () SeekEntryResult!2701)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15958 (_ BitVec 32)) SeekEntryResult!2701)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312380 (= res!168835 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152980))))

(assert (=> b!312380 (= lt!152980 (Intermediate!2701 false resIndex!52 resX!52))))

(declare-fun b!312381 () Bool)

(declare-fun e!194790 () Bool)

(assert (=> b!312381 (= e!194790 true)))

(declare-fun lt!152981 () SeekEntryResult!2701)

(declare-fun lt!152983 () SeekEntryResult!2701)

(assert (=> b!312381 (= lt!152981 lt!152983)))

(declare-fun lt!152978 () (_ BitVec 32))

(declare-datatypes ((Unit!9633 0))(
  ( (Unit!9634) )
))
(declare-fun lt!152985 () Unit!9633)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15958 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9633)

(assert (=> b!312381 (= lt!152985 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152978 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312382 () Bool)

(declare-fun res!168837 () Bool)

(assert (=> b!312382 (=> (not res!168837) (not e!194791))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15958 (_ BitVec 32)) SeekEntryResult!2701)

(assert (=> b!312382 (= res!168837 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2701 i!1240)))))

(declare-fun b!312383 () Bool)

(declare-fun res!168836 () Bool)

(assert (=> b!312383 (=> (not res!168836) (not e!194791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15958 (_ BitVec 32)) Bool)

(assert (=> b!312383 (= res!168836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312384 () Bool)

(declare-fun e!194788 () Bool)

(assert (=> b!312384 (= e!194788 (not e!194790))))

(declare-fun res!168838 () Bool)

(assert (=> b!312384 (=> res!168838 e!194790)))

(assert (=> b!312384 (= res!168838 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152978 #b00000000000000000000000000000000) (bvsge lt!152978 (size!7913 a!3293)) (not (= lt!152983 lt!152980))))))

(declare-fun lt!152982 () SeekEntryResult!2701)

(assert (=> b!312384 (= lt!152982 lt!152981)))

(declare-fun lt!152984 () array!15958)

(assert (=> b!312384 (= lt!152981 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152978 k!2441 lt!152984 mask!3709))))

(assert (=> b!312384 (= lt!152982 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152984 mask!3709))))

(assert (=> b!312384 (= lt!152984 (array!15959 (store (arr!7561 a!3293) i!1240 k!2441) (size!7913 a!3293)))))

(declare-fun lt!152979 () SeekEntryResult!2701)

(assert (=> b!312384 (= lt!152979 lt!152983)))

(assert (=> b!312384 (= lt!152983 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152978 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312384 (= lt!152978 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312385 () Bool)

(declare-fun res!168840 () Bool)

(assert (=> b!312385 (=> (not res!168840) (not e!194791))))

(assert (=> b!312385 (= res!168840 (and (= (size!7913 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7913 a!3293))))))

(declare-fun b!312386 () Bool)

(assert (=> b!312386 (= e!194789 e!194788)))

(declare-fun res!168839 () Bool)

(assert (=> b!312386 (=> (not res!168839) (not e!194788))))

(assert (=> b!312386 (= res!168839 (and (= lt!152979 lt!152980) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7561 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312386 (= lt!152979 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!31056 res!168831) b!312385))

(assert (= (and b!312385 res!168840) b!312379))

(assert (= (and b!312379 res!168833) b!312377))

(assert (= (and b!312377 res!168834) b!312382))

(assert (= (and b!312382 res!168837) b!312383))

(assert (= (and b!312383 res!168836) b!312380))

(assert (= (and b!312380 res!168835) b!312378))

(assert (= (and b!312378 res!168832) b!312386))

(assert (= (and b!312386 res!168839) b!312384))

(assert (= (and b!312384 (not res!168838)) b!312381))

(declare-fun m!322453 () Bool)

(assert (=> b!312379 m!322453))

(declare-fun m!322455 () Bool)

(assert (=> b!312377 m!322455))

(declare-fun m!322457 () Bool)

(assert (=> b!312380 m!322457))

(assert (=> b!312380 m!322457))

(declare-fun m!322459 () Bool)

(assert (=> b!312380 m!322459))

(declare-fun m!322461 () Bool)

(assert (=> b!312386 m!322461))

(declare-fun m!322463 () Bool)

(assert (=> b!312386 m!322463))

(declare-fun m!322465 () Bool)

(assert (=> b!312381 m!322465))

(declare-fun m!322467 () Bool)

(assert (=> start!31056 m!322467))

(declare-fun m!322469 () Bool)

(assert (=> start!31056 m!322469))

(declare-fun m!322471 () Bool)

(assert (=> b!312382 m!322471))

(declare-fun m!322473 () Bool)

(assert (=> b!312378 m!322473))

(declare-fun m!322475 () Bool)

(assert (=> b!312384 m!322475))

(declare-fun m!322477 () Bool)

(assert (=> b!312384 m!322477))

(declare-fun m!322479 () Bool)

(assert (=> b!312384 m!322479))

(declare-fun m!322481 () Bool)

(assert (=> b!312384 m!322481))

(declare-fun m!322483 () Bool)

(assert (=> b!312384 m!322483))

(declare-fun m!322485 () Bool)

(assert (=> b!312383 m!322485))

(push 1)

(assert (not b!312384))

(assert (not b!312380))

(assert (not b!312382))

(assert (not b!312377))

(assert (not b!312386))

