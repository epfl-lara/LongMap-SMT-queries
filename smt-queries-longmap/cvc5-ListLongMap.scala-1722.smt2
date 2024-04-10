; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31784 () Bool)

(assert start!31784)

(declare-fun b!317402 () Bool)

(declare-fun res!171985 () Bool)

(declare-fun e!197348 () Bool)

(assert (=> b!317402 (=> (not res!171985) (not e!197348))))

(declare-datatypes ((array!16155 0))(
  ( (array!16156 (arr!7643 (Array (_ BitVec 32) (_ BitVec 64))) (size!7995 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16155)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317402 (= res!171985 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317404 () Bool)

(declare-fun res!171983 () Bool)

(declare-fun e!197349 () Bool)

(assert (=> b!317404 (=> (not res!171983) (not e!197349))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317404 (= res!171983 (and (= (select (arr!7643 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7995 a!3293))))))

(declare-fun b!317405 () Bool)

(declare-fun e!197346 () Bool)

(assert (=> b!317405 (= e!197349 e!197346)))

(declare-fun res!171989 () Bool)

(assert (=> b!317405 (=> (not res!171989) (not e!197346))))

(declare-datatypes ((SeekEntryResult!2783 0))(
  ( (MissingZero!2783 (index!13308 (_ BitVec 32))) (Found!2783 (index!13309 (_ BitVec 32))) (Intermediate!2783 (undefined!3595 Bool) (index!13310 (_ BitVec 32)) (x!31576 (_ BitVec 32))) (Undefined!2783) (MissingVacant!2783 (index!13311 (_ BitVec 32))) )
))
(declare-fun lt!154935 () SeekEntryResult!2783)

(declare-fun lt!154938 () SeekEntryResult!2783)

(assert (=> b!317405 (= res!171989 (and (= lt!154935 lt!154938) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7643 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16155 (_ BitVec 32)) SeekEntryResult!2783)

(assert (=> b!317405 (= lt!154935 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!317406 () Bool)

(declare-fun res!171984 () Bool)

(assert (=> b!317406 (=> (not res!171984) (not e!197348))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16155 (_ BitVec 32)) SeekEntryResult!2783)

(assert (=> b!317406 (= res!171984 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2783 i!1240)))))

(declare-fun b!317407 () Bool)

(assert (=> b!317407 (= e!197348 e!197349)))

(declare-fun res!171982 () Bool)

(assert (=> b!317407 (=> (not res!171982) (not e!197349))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317407 (= res!171982 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154938))))

(assert (=> b!317407 (= lt!154938 (Intermediate!2783 false resIndex!52 resX!52))))

(declare-fun b!317408 () Bool)

(assert (=> b!317408 (= e!197346 (not true))))

(declare-fun e!197347 () Bool)

(assert (=> b!317408 e!197347))

(declare-fun res!171988 () Bool)

(assert (=> b!317408 (=> (not res!171988) (not e!197347))))

(declare-fun lt!154937 () (_ BitVec 32))

(assert (=> b!317408 (= res!171988 (= lt!154935 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154937 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317408 (= lt!154937 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317409 () Bool)

(declare-fun res!171981 () Bool)

(assert (=> b!317409 (=> (not res!171981) (not e!197348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16155 (_ BitVec 32)) Bool)

(assert (=> b!317409 (= res!171981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317410 () Bool)

(declare-fun lt!154936 () array!16155)

(assert (=> b!317410 (= e!197347 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!154936 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154937 k!2441 lt!154936 mask!3709)))))

(assert (=> b!317410 (= lt!154936 (array!16156 (store (arr!7643 a!3293) i!1240 k!2441) (size!7995 a!3293)))))

(declare-fun b!317411 () Bool)

(declare-fun res!171987 () Bool)

(assert (=> b!317411 (=> (not res!171987) (not e!197348))))

(assert (=> b!317411 (= res!171987 (and (= (size!7995 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7995 a!3293))))))

(declare-fun b!317403 () Bool)

(declare-fun res!171990 () Bool)

(assert (=> b!317403 (=> (not res!171990) (not e!197348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317403 (= res!171990 (validKeyInArray!0 k!2441))))

(declare-fun res!171986 () Bool)

(assert (=> start!31784 (=> (not res!171986) (not e!197348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31784 (= res!171986 (validMask!0 mask!3709))))

(assert (=> start!31784 e!197348))

(declare-fun array_inv!5606 (array!16155) Bool)

(assert (=> start!31784 (array_inv!5606 a!3293)))

(assert (=> start!31784 true))

(assert (= (and start!31784 res!171986) b!317411))

(assert (= (and b!317411 res!171987) b!317403))

(assert (= (and b!317403 res!171990) b!317402))

(assert (= (and b!317402 res!171985) b!317406))

(assert (= (and b!317406 res!171984) b!317409))

(assert (= (and b!317409 res!171981) b!317407))

(assert (= (and b!317407 res!171982) b!317404))

(assert (= (and b!317404 res!171983) b!317405))

(assert (= (and b!317405 res!171989) b!317408))

(assert (= (and b!317408 res!171988) b!317410))

(declare-fun m!326033 () Bool)

(assert (=> start!31784 m!326033))

(declare-fun m!326035 () Bool)

(assert (=> start!31784 m!326035))

(declare-fun m!326037 () Bool)

(assert (=> b!317406 m!326037))

(declare-fun m!326039 () Bool)

(assert (=> b!317410 m!326039))

(declare-fun m!326041 () Bool)

(assert (=> b!317410 m!326041))

(declare-fun m!326043 () Bool)

(assert (=> b!317410 m!326043))

(declare-fun m!326045 () Bool)

(assert (=> b!317409 m!326045))

(declare-fun m!326047 () Bool)

(assert (=> b!317407 m!326047))

(assert (=> b!317407 m!326047))

(declare-fun m!326049 () Bool)

(assert (=> b!317407 m!326049))

(declare-fun m!326051 () Bool)

(assert (=> b!317403 m!326051))

(declare-fun m!326053 () Bool)

(assert (=> b!317405 m!326053))

(declare-fun m!326055 () Bool)

(assert (=> b!317405 m!326055))

(declare-fun m!326057 () Bool)

(assert (=> b!317402 m!326057))

(declare-fun m!326059 () Bool)

(assert (=> b!317408 m!326059))

(declare-fun m!326061 () Bool)

(assert (=> b!317408 m!326061))

(declare-fun m!326063 () Bool)

(assert (=> b!317404 m!326063))

(push 1)

