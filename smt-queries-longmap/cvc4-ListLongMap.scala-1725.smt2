; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31806 () Bool)

(assert start!31806)

(declare-fun b!317732 () Bool)

(declare-fun res!172316 () Bool)

(declare-fun e!197515 () Bool)

(assert (=> b!317732 (=> (not res!172316) (not e!197515))))

(declare-datatypes ((array!16177 0))(
  ( (array!16178 (arr!7654 (Array (_ BitVec 32) (_ BitVec 64))) (size!8006 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16177)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317732 (= res!172316 (and (= (size!8006 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8006 a!3293))))))

(declare-fun b!317733 () Bool)

(declare-fun res!172318 () Bool)

(assert (=> b!317733 (=> (not res!172318) (not e!197515))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2794 0))(
  ( (MissingZero!2794 (index!13352 (_ BitVec 32))) (Found!2794 (index!13353 (_ BitVec 32))) (Intermediate!2794 (undefined!3606 Bool) (index!13354 (_ BitVec 32)) (x!31611 (_ BitVec 32))) (Undefined!2794) (MissingVacant!2794 (index!13355 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16177 (_ BitVec 32)) SeekEntryResult!2794)

(assert (=> b!317733 (= res!172318 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2794 i!1240)))))

(declare-fun b!317734 () Bool)

(declare-fun res!172315 () Bool)

(assert (=> b!317734 (=> (not res!172315) (not e!197515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317734 (= res!172315 (validKeyInArray!0 k!2441))))

(declare-fun b!317735 () Bool)

(declare-fun e!197512 () Bool)

(assert (=> b!317735 (= e!197515 e!197512)))

(declare-fun res!172319 () Bool)

(assert (=> b!317735 (=> (not res!172319) (not e!197512))))

(declare-fun lt!155067 () SeekEntryResult!2794)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16177 (_ BitVec 32)) SeekEntryResult!2794)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317735 (= res!172319 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155067))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317735 (= lt!155067 (Intermediate!2794 false resIndex!52 resX!52))))

(declare-fun res!172314 () Bool)

(assert (=> start!31806 (=> (not res!172314) (not e!197515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31806 (= res!172314 (validMask!0 mask!3709))))

(assert (=> start!31806 e!197515))

(declare-fun array_inv!5617 (array!16177) Bool)

(assert (=> start!31806 (array_inv!5617 a!3293)))

(assert (=> start!31806 true))

(declare-fun b!317736 () Bool)

(declare-fun res!172311 () Bool)

(assert (=> b!317736 (=> (not res!172311) (not e!197512))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317736 (= res!172311 (and (= (select (arr!7654 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8006 a!3293))))))

(declare-fun b!317737 () Bool)

(declare-fun e!197511 () Bool)

(assert (=> b!317737 (= e!197511 (not true))))

(declare-fun e!197514 () Bool)

(assert (=> b!317737 e!197514))

(declare-fun res!172320 () Bool)

(assert (=> b!317737 (=> (not res!172320) (not e!197514))))

(declare-fun lt!155068 () SeekEntryResult!2794)

(declare-fun lt!155069 () (_ BitVec 32))

(assert (=> b!317737 (= res!172320 (= lt!155068 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155069 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317737 (= lt!155069 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317738 () Bool)

(declare-fun res!172317 () Bool)

(assert (=> b!317738 (=> (not res!172317) (not e!197515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16177 (_ BitVec 32)) Bool)

(assert (=> b!317738 (= res!172317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317739 () Bool)

(assert (=> b!317739 (= e!197512 e!197511)))

(declare-fun res!172313 () Bool)

(assert (=> b!317739 (=> (not res!172313) (not e!197511))))

(assert (=> b!317739 (= res!172313 (and (= lt!155068 lt!155067) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7654 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317739 (= lt!155068 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!317740 () Bool)

(declare-fun res!172312 () Bool)

(assert (=> b!317740 (=> (not res!172312) (not e!197515))))

(declare-fun arrayContainsKey!0 (array!16177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317740 (= res!172312 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun lt!155070 () array!16177)

(declare-fun b!317741 () Bool)

(assert (=> b!317741 (= e!197514 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155070 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155069 k!2441 lt!155070 mask!3709)))))

(assert (=> b!317741 (= lt!155070 (array!16178 (store (arr!7654 a!3293) i!1240 k!2441) (size!8006 a!3293)))))

(assert (= (and start!31806 res!172314) b!317732))

(assert (= (and b!317732 res!172316) b!317734))

(assert (= (and b!317734 res!172315) b!317740))

(assert (= (and b!317740 res!172312) b!317733))

(assert (= (and b!317733 res!172318) b!317738))

(assert (= (and b!317738 res!172317) b!317735))

(assert (= (and b!317735 res!172319) b!317736))

(assert (= (and b!317736 res!172311) b!317739))

(assert (= (and b!317739 res!172313) b!317737))

(assert (= (and b!317737 res!172320) b!317741))

(declare-fun m!326385 () Bool)

(assert (=> b!317734 m!326385))

(declare-fun m!326387 () Bool)

(assert (=> b!317737 m!326387))

(declare-fun m!326389 () Bool)

(assert (=> b!317737 m!326389))

(declare-fun m!326391 () Bool)

(assert (=> b!317733 m!326391))

(declare-fun m!326393 () Bool)

(assert (=> b!317738 m!326393))

(declare-fun m!326395 () Bool)

(assert (=> start!31806 m!326395))

(declare-fun m!326397 () Bool)

(assert (=> start!31806 m!326397))

(declare-fun m!326399 () Bool)

(assert (=> b!317740 m!326399))

(declare-fun m!326401 () Bool)

(assert (=> b!317739 m!326401))

(declare-fun m!326403 () Bool)

(assert (=> b!317739 m!326403))

(declare-fun m!326405 () Bool)

(assert (=> b!317735 m!326405))

(assert (=> b!317735 m!326405))

(declare-fun m!326407 () Bool)

(assert (=> b!317735 m!326407))

(declare-fun m!326409 () Bool)

(assert (=> b!317741 m!326409))

(declare-fun m!326411 () Bool)

(assert (=> b!317741 m!326411))

(declare-fun m!326413 () Bool)

(assert (=> b!317741 m!326413))

(declare-fun m!326415 () Bool)

(assert (=> b!317736 m!326415))

(push 1)

(assert (not b!317733))

(assert (not b!317741))

(assert (not b!317735))

