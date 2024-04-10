; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30264 () Bool)

(assert start!30264)

(declare-fun b!302875 () Bool)

(declare-fun res!160361 () Bool)

(declare-fun e!190794 () Bool)

(assert (=> b!302875 (=> (not res!160361) (not e!190794))))

(declare-datatypes ((array!15370 0))(
  ( (array!15371 (arr!7273 (Array (_ BitVec 32) (_ BitVec 64))) (size!7625 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15370)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302875 (= res!160361 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302876 () Bool)

(declare-fun res!160368 () Bool)

(assert (=> b!302876 (=> (not res!160368) (not e!190794))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302876 (= res!160368 (and (= (select (arr!7273 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7625 a!3293))))))

(declare-fun b!302877 () Bool)

(declare-fun res!160365 () Bool)

(assert (=> b!302877 (=> (not res!160365) (not e!190794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302877 (= res!160365 (validKeyInArray!0 k!2441))))

(declare-fun res!160366 () Bool)

(assert (=> start!30264 (=> (not res!160366) (not e!190794))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30264 (= res!160366 (validMask!0 mask!3709))))

(assert (=> start!30264 e!190794))

(declare-fun array_inv!5236 (array!15370) Bool)

(assert (=> start!30264 (array_inv!5236 a!3293)))

(assert (=> start!30264 true))

(declare-fun b!302878 () Bool)

(declare-fun res!160363 () Bool)

(assert (=> b!302878 (=> (not res!160363) (not e!190794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15370 (_ BitVec 32)) Bool)

(assert (=> b!302878 (= res!160363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302879 () Bool)

(declare-fun res!160362 () Bool)

(assert (=> b!302879 (=> (not res!160362) (not e!190794))))

(declare-datatypes ((SeekEntryResult!2413 0))(
  ( (MissingZero!2413 (index!11828 (_ BitVec 32))) (Found!2413 (index!11829 (_ BitVec 32))) (Intermediate!2413 (undefined!3225 Bool) (index!11830 (_ BitVec 32)) (x!30094 (_ BitVec 32))) (Undefined!2413) (MissingVacant!2413 (index!11831 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15370 (_ BitVec 32)) SeekEntryResult!2413)

(assert (=> b!302879 (= res!160362 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2413 i!1240)))))

(declare-fun b!302880 () Bool)

(declare-fun res!160367 () Bool)

(assert (=> b!302880 (=> (not res!160367) (not e!190794))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15370 (_ BitVec 32)) SeekEntryResult!2413)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302880 (= res!160367 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2413 false resIndex!52 resX!52)))))

(declare-fun b!302881 () Bool)

(assert (=> b!302881 (= e!190794 false)))

(declare-fun lt!150141 () SeekEntryResult!2413)

(assert (=> b!302881 (= lt!150141 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!302882 () Bool)

(declare-fun res!160364 () Bool)

(assert (=> b!302882 (=> (not res!160364) (not e!190794))))

(assert (=> b!302882 (= res!160364 (and (= (size!7625 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7625 a!3293))))))

(assert (= (and start!30264 res!160366) b!302882))

(assert (= (and b!302882 res!160364) b!302877))

(assert (= (and b!302877 res!160365) b!302875))

(assert (= (and b!302875 res!160361) b!302879))

(assert (= (and b!302879 res!160362) b!302878))

(assert (= (and b!302878 res!160363) b!302880))

(assert (= (and b!302880 res!160367) b!302876))

(assert (= (and b!302876 res!160368) b!302881))

(declare-fun m!314325 () Bool)

(assert (=> b!302881 m!314325))

(declare-fun m!314327 () Bool)

(assert (=> b!302879 m!314327))

(declare-fun m!314329 () Bool)

(assert (=> b!302876 m!314329))

(declare-fun m!314331 () Bool)

(assert (=> b!302878 m!314331))

(declare-fun m!314333 () Bool)

(assert (=> start!30264 m!314333))

(declare-fun m!314335 () Bool)

(assert (=> start!30264 m!314335))

(declare-fun m!314337 () Bool)

(assert (=> b!302880 m!314337))

(assert (=> b!302880 m!314337))

(declare-fun m!314339 () Bool)

(assert (=> b!302880 m!314339))

(declare-fun m!314341 () Bool)

(assert (=> b!302875 m!314341))

(declare-fun m!314343 () Bool)

(assert (=> b!302877 m!314343))

(push 1)

(assert (not b!302877))

(assert (not b!302879))

(assert (not b!302878))

(assert (not b!302881))

(assert (not b!302880))

(assert (not b!302875))

(assert (not start!30264))

(check-sat)

(pop 1)

