; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30600 () Bool)

(assert start!30600)

(declare-fun res!163730 () Bool)

(declare-fun e!192370 () Bool)

(assert (=> start!30600 (=> (not res!163730) (not e!192370))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30600 (= res!163730 (validMask!0 mask!3709))))

(assert (=> start!30600 e!192370))

(declare-datatypes ((array!15604 0))(
  ( (array!15605 (arr!7387 (Array (_ BitVec 32) (_ BitVec 64))) (size!7739 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15604)

(declare-fun array_inv!5350 (array!15604) Bool)

(assert (=> start!30600 (array_inv!5350 a!3293)))

(assert (=> start!30600 true))

(declare-fun b!306964 () Bool)

(declare-fun res!163731 () Bool)

(assert (=> b!306964 (=> (not res!163731) (not e!192370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15604 (_ BitVec 32)) Bool)

(assert (=> b!306964 (= res!163731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306965 () Bool)

(assert (=> b!306965 false))

(declare-datatypes ((Unit!9576 0))(
  ( (Unit!9577) )
))
(declare-fun e!192369 () Unit!9576)

(declare-fun Unit!9578 () Unit!9576)

(assert (=> b!306965 (= e!192369 Unit!9578)))

(declare-fun b!306966 () Bool)

(declare-fun e!192366 () Unit!9576)

(assert (=> b!306966 (= e!192366 e!192369)))

(declare-fun c!49223 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306966 (= c!49223 (or (= (select (arr!7387 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7387 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306967 () Bool)

(declare-fun e!192367 () Bool)

(assert (=> b!306967 (= e!192367 (not true))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!306967 (= index!1781 resIndex!52)))

(declare-fun lt!151075 () Unit!9576)

(assert (=> b!306967 (= lt!151075 e!192366)))

(declare-fun c!49224 () Bool)

(assert (=> b!306967 (= c!49224 (not (= resIndex!52 index!1781)))))

(declare-fun b!306968 () Bool)

(assert (=> b!306968 (= e!192370 e!192367)))

(declare-fun res!163722 () Bool)

(assert (=> b!306968 (=> (not res!163722) (not e!192367))))

(declare-datatypes ((SeekEntryResult!2527 0))(
  ( (MissingZero!2527 (index!12284 (_ BitVec 32))) (Found!2527 (index!12285 (_ BitVec 32))) (Intermediate!2527 (undefined!3339 Bool) (index!12286 (_ BitVec 32)) (x!30530 (_ BitVec 32))) (Undefined!2527) (MissingVacant!2527 (index!12287 (_ BitVec 32))) )
))
(declare-fun lt!151077 () SeekEntryResult!2527)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15604 (_ BitVec 32)) SeekEntryResult!2527)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306968 (= res!163722 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151077))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306968 (= lt!151077 (Intermediate!2527 false resIndex!52 resX!52))))

(declare-fun b!306969 () Bool)

(declare-fun res!163723 () Bool)

(assert (=> b!306969 (=> (not res!163723) (not e!192370))))

(declare-fun arrayContainsKey!0 (array!15604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306969 (= res!163723 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306970 () Bool)

(declare-fun res!163727 () Bool)

(assert (=> b!306970 (=> (not res!163727) (not e!192370))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!306970 (= res!163727 (and (= (size!7739 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7739 a!3293))))))

(declare-fun b!306971 () Bool)

(declare-fun res!163725 () Bool)

(assert (=> b!306971 (=> (not res!163725) (not e!192367))))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!306971 (= res!163725 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7387 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!306972 () Bool)

(assert (=> b!306972 false))

(declare-fun lt!151076 () SeekEntryResult!2527)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306972 (= lt!151076 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9579 () Unit!9576)

(assert (=> b!306972 (= e!192369 Unit!9579)))

(declare-fun b!306973 () Bool)

(declare-fun Unit!9580 () Unit!9576)

(assert (=> b!306973 (= e!192366 Unit!9580)))

(declare-fun b!306974 () Bool)

(declare-fun res!163728 () Bool)

(assert (=> b!306974 (=> (not res!163728) (not e!192367))))

(assert (=> b!306974 (= res!163728 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151077))))

(declare-fun b!306975 () Bool)

(declare-fun res!163724 () Bool)

(assert (=> b!306975 (=> (not res!163724) (not e!192370))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15604 (_ BitVec 32)) SeekEntryResult!2527)

(assert (=> b!306975 (= res!163724 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2527 i!1240)))))

(declare-fun b!306976 () Bool)

(declare-fun res!163726 () Bool)

(assert (=> b!306976 (=> (not res!163726) (not e!192370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306976 (= res!163726 (validKeyInArray!0 k!2441))))

(declare-fun b!306977 () Bool)

(declare-fun res!163729 () Bool)

(assert (=> b!306977 (=> (not res!163729) (not e!192367))))

(assert (=> b!306977 (= res!163729 (and (= (select (arr!7387 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7739 a!3293))))))

(assert (= (and start!30600 res!163730) b!306970))

(assert (= (and b!306970 res!163727) b!306976))

(assert (= (and b!306976 res!163726) b!306969))

(assert (= (and b!306969 res!163723) b!306975))

(assert (= (and b!306975 res!163724) b!306964))

(assert (= (and b!306964 res!163731) b!306968))

(assert (= (and b!306968 res!163722) b!306977))

(assert (= (and b!306977 res!163729) b!306974))

(assert (= (and b!306974 res!163728) b!306971))

(assert (= (and b!306971 res!163725) b!306967))

(assert (= (and b!306967 c!49224) b!306966))

(assert (= (and b!306967 (not c!49224)) b!306973))

(assert (= (and b!306966 c!49223) b!306965))

(assert (= (and b!306966 (not c!49223)) b!306972))

(declare-fun m!317355 () Bool)

(assert (=> b!306971 m!317355))

(declare-fun m!317357 () Bool)

(assert (=> b!306977 m!317357))

(declare-fun m!317359 () Bool)

(assert (=> b!306968 m!317359))

(assert (=> b!306968 m!317359))

(declare-fun m!317361 () Bool)

(assert (=> b!306968 m!317361))

(declare-fun m!317363 () Bool)

(assert (=> b!306975 m!317363))

(assert (=> b!306966 m!317355))

(declare-fun m!317365 () Bool)

(assert (=> start!30600 m!317365))

(declare-fun m!317367 () Bool)

(assert (=> start!30600 m!317367))

(declare-fun m!317369 () Bool)

(assert (=> b!306974 m!317369))

(declare-fun m!317371 () Bool)

(assert (=> b!306972 m!317371))

(assert (=> b!306972 m!317371))

(declare-fun m!317373 () Bool)

(assert (=> b!306972 m!317373))

(declare-fun m!317375 () Bool)

(assert (=> b!306969 m!317375))

(declare-fun m!317377 () Bool)

(assert (=> b!306964 m!317377))

(declare-fun m!317379 () Bool)

(assert (=> b!306976 m!317379))

(push 1)

(assert (not b!306969))

