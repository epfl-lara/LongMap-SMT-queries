; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30304 () Bool)

(assert start!30304)

(declare-fun b!303514 () Bool)

(declare-fun res!161053 () Bool)

(declare-fun e!190967 () Bool)

(assert (=> b!303514 (=> (not res!161053) (not e!190967))))

(declare-datatypes ((array!15423 0))(
  ( (array!15424 (arr!7299 (Array (_ BitVec 32) (_ BitVec 64))) (size!7651 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15423)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303514 (= res!161053 (and (= (size!7651 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7651 a!3293))))))

(declare-fun b!303515 () Bool)

(declare-fun e!190966 () Bool)

(assert (=> b!303515 (= e!190967 e!190966)))

(declare-fun res!161058 () Bool)

(assert (=> b!303515 (=> (not res!161058) (not e!190966))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2404 0))(
  ( (MissingZero!2404 (index!11792 (_ BitVec 32))) (Found!2404 (index!11793 (_ BitVec 32))) (Intermediate!2404 (undefined!3216 Bool) (index!11794 (_ BitVec 32)) (x!30154 (_ BitVec 32))) (Undefined!2404) (MissingVacant!2404 (index!11795 (_ BitVec 32))) )
))
(declare-fun lt!150240 () SeekEntryResult!2404)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15423 (_ BitVec 32)) SeekEntryResult!2404)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303515 (= res!161058 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150240))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303515 (= lt!150240 (Intermediate!2404 false resIndex!52 resX!52))))

(declare-fun b!303516 () Bool)

(declare-fun res!161051 () Bool)

(assert (=> b!303516 (=> (not res!161051) (not e!190966))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303516 (= res!161051 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150240))))

(declare-fun b!303517 () Bool)

(declare-fun res!161057 () Bool)

(assert (=> b!303517 (=> (not res!161057) (not e!190967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303517 (= res!161057 (validKeyInArray!0 k!2441))))

(declare-fun b!303518 () Bool)

(declare-fun res!161055 () Bool)

(assert (=> b!303518 (=> (not res!161055) (not e!190966))))

(assert (=> b!303518 (= res!161055 (and (= (select (arr!7299 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7651 a!3293))))))

(declare-fun b!303519 () Bool)

(declare-fun res!161056 () Bool)

(assert (=> b!303519 (=> (not res!161056) (not e!190967))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15423 (_ BitVec 32)) SeekEntryResult!2404)

(assert (=> b!303519 (= res!161056 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2404 i!1240)))))

(declare-fun res!161052 () Bool)

(assert (=> start!30304 (=> (not res!161052) (not e!190967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30304 (= res!161052 (validMask!0 mask!3709))))

(assert (=> start!30304 e!190967))

(declare-fun array_inv!5249 (array!15423) Bool)

(assert (=> start!30304 (array_inv!5249 a!3293)))

(assert (=> start!30304 true))

(declare-fun b!303520 () Bool)

(declare-fun res!161050 () Bool)

(assert (=> b!303520 (=> (not res!161050) (not e!190967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15423 (_ BitVec 32)) Bool)

(assert (=> b!303520 (= res!161050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303521 () Bool)

(declare-fun res!161054 () Bool)

(assert (=> b!303521 (=> (not res!161054) (not e!190967))))

(declare-fun arrayContainsKey!0 (array!15423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303521 (= res!161054 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303522 () Bool)

(assert (=> b!303522 (= e!190966 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7299 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7299 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7299 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(assert (= (and start!30304 res!161052) b!303514))

(assert (= (and b!303514 res!161053) b!303517))

(assert (= (and b!303517 res!161057) b!303521))

(assert (= (and b!303521 res!161054) b!303519))

(assert (= (and b!303519 res!161056) b!303520))

(assert (= (and b!303520 res!161050) b!303515))

(assert (= (and b!303515 res!161058) b!303518))

(assert (= (and b!303518 res!161055) b!303516))

(assert (= (and b!303516 res!161051) b!303522))

(declare-fun m!315003 () Bool)

(assert (=> b!303517 m!315003))

(declare-fun m!315005 () Bool)

(assert (=> b!303519 m!315005))

(declare-fun m!315007 () Bool)

(assert (=> b!303518 m!315007))

(declare-fun m!315009 () Bool)

(assert (=> b!303516 m!315009))

(declare-fun m!315011 () Bool)

(assert (=> b!303515 m!315011))

(assert (=> b!303515 m!315011))

(declare-fun m!315013 () Bool)

(assert (=> b!303515 m!315013))

(declare-fun m!315015 () Bool)

(assert (=> b!303520 m!315015))

(declare-fun m!315017 () Bool)

(assert (=> b!303521 m!315017))

(declare-fun m!315019 () Bool)

(assert (=> start!30304 m!315019))

(declare-fun m!315021 () Bool)

(assert (=> start!30304 m!315021))

(declare-fun m!315023 () Bool)

(assert (=> b!303522 m!315023))

(push 1)

(assert (not b!303519))

(assert (not b!303520))

(assert (not b!303516))

(assert (not b!303521))

(assert (not b!303517))

(assert (not b!303515))

(assert (not start!30304))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

