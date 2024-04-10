; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30576 () Bool)

(assert start!30576)

(declare-fun b!306460 () Bool)

(declare-datatypes ((Unit!9516 0))(
  ( (Unit!9517) )
))
(declare-fun e!192190 () Unit!9516)

(declare-fun Unit!9518 () Unit!9516)

(assert (=> b!306460 (= e!192190 Unit!9518)))

(declare-fun b!306461 () Bool)

(declare-fun res!163367 () Bool)

(declare-fun e!192188 () Bool)

(assert (=> b!306461 (=> (not res!163367) (not e!192188))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306461 (= res!163367 (validKeyInArray!0 k!2441))))

(declare-fun b!306462 () Bool)

(declare-fun res!163368 () Bool)

(assert (=> b!306462 (=> (not res!163368) (not e!192188))))

(declare-datatypes ((array!15580 0))(
  ( (array!15581 (arr!7375 (Array (_ BitVec 32) (_ BitVec 64))) (size!7727 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15580)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!306462 (= res!163368 (and (= (size!7727 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7727 a!3293))))))

(declare-fun e!192187 () Bool)

(declare-fun b!306463 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306463 (= e!192187 (not (or (not (= (select (arr!7375 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000))))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!306463 (= index!1781 resIndex!52)))

(declare-fun lt!150969 () Unit!9516)

(assert (=> b!306463 (= lt!150969 e!192190)))

(declare-fun c!49152 () Bool)

(assert (=> b!306463 (= c!49152 (not (= resIndex!52 index!1781)))))

(declare-fun b!306464 () Bool)

(assert (=> b!306464 false))

(declare-datatypes ((SeekEntryResult!2515 0))(
  ( (MissingZero!2515 (index!12236 (_ BitVec 32))) (Found!2515 (index!12237 (_ BitVec 32))) (Intermediate!2515 (undefined!3327 Bool) (index!12238 (_ BitVec 32)) (x!30486 (_ BitVec 32))) (Undefined!2515) (MissingVacant!2515 (index!12239 (_ BitVec 32))) )
))
(declare-fun lt!150967 () SeekEntryResult!2515)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15580 (_ BitVec 32)) SeekEntryResult!2515)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306464 (= lt!150967 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun e!192186 () Unit!9516)

(declare-fun Unit!9519 () Unit!9516)

(assert (=> b!306464 (= e!192186 Unit!9519)))

(declare-fun b!306465 () Bool)

(declare-fun res!163370 () Bool)

(assert (=> b!306465 (=> (not res!163370) (not e!192187))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306465 (= res!163370 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7375 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!306466 () Bool)

(declare-fun res!163371 () Bool)

(assert (=> b!306466 (=> (not res!163371) (not e!192188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15580 (_ BitVec 32)) Bool)

(assert (=> b!306466 (= res!163371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!163364 () Bool)

(assert (=> start!30576 (=> (not res!163364) (not e!192188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30576 (= res!163364 (validMask!0 mask!3709))))

(assert (=> start!30576 e!192188))

(declare-fun array_inv!5338 (array!15580) Bool)

(assert (=> start!30576 (array_inv!5338 a!3293)))

(assert (=> start!30576 true))

(declare-fun b!306467 () Bool)

(declare-fun res!163365 () Bool)

(assert (=> b!306467 (=> (not res!163365) (not e!192187))))

(assert (=> b!306467 (= res!163365 (and (= (select (arr!7375 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7727 a!3293))))))

(declare-fun b!306468 () Bool)

(declare-fun res!163362 () Bool)

(assert (=> b!306468 (=> (not res!163362) (not e!192188))))

(declare-fun arrayContainsKey!0 (array!15580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306468 (= res!163362 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306469 () Bool)

(declare-fun res!163369 () Bool)

(assert (=> b!306469 (=> (not res!163369) (not e!192187))))

(declare-fun lt!150968 () SeekEntryResult!2515)

(assert (=> b!306469 (= res!163369 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150968))))

(declare-fun b!306470 () Bool)

(assert (=> b!306470 (= e!192188 e!192187)))

(declare-fun res!163363 () Bool)

(assert (=> b!306470 (=> (not res!163363) (not e!192187))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306470 (= res!163363 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150968))))

(assert (=> b!306470 (= lt!150968 (Intermediate!2515 false resIndex!52 resX!52))))

(declare-fun b!306471 () Bool)

(assert (=> b!306471 (= e!192190 e!192186)))

(declare-fun c!49151 () Bool)

(assert (=> b!306471 (= c!49151 (or (= (select (arr!7375 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7375 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306472 () Bool)

(assert (=> b!306472 false))

(declare-fun Unit!9520 () Unit!9516)

(assert (=> b!306472 (= e!192186 Unit!9520)))

(declare-fun b!306473 () Bool)

(declare-fun res!163366 () Bool)

(assert (=> b!306473 (=> (not res!163366) (not e!192188))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15580 (_ BitVec 32)) SeekEntryResult!2515)

(assert (=> b!306473 (= res!163366 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2515 i!1240)))))

(assert (= (and start!30576 res!163364) b!306462))

(assert (= (and b!306462 res!163368) b!306461))

(assert (= (and b!306461 res!163367) b!306468))

(assert (= (and b!306468 res!163362) b!306473))

(assert (= (and b!306473 res!163366) b!306466))

(assert (= (and b!306466 res!163371) b!306470))

(assert (= (and b!306470 res!163363) b!306467))

(assert (= (and b!306467 res!163365) b!306469))

(assert (= (and b!306469 res!163369) b!306465))

(assert (= (and b!306465 res!163370) b!306463))

(assert (= (and b!306463 c!49152) b!306471))

(assert (= (and b!306463 (not c!49152)) b!306460))

(assert (= (and b!306471 c!49151) b!306472))

(assert (= (and b!306471 (not c!49151)) b!306464))

(declare-fun m!317043 () Bool)

(assert (=> b!306461 m!317043))

(declare-fun m!317045 () Bool)

(assert (=> b!306471 m!317045))

(declare-fun m!317047 () Bool)

(assert (=> start!30576 m!317047))

(declare-fun m!317049 () Bool)

(assert (=> start!30576 m!317049))

(declare-fun m!317051 () Bool)

(assert (=> b!306466 m!317051))

(assert (=> b!306463 m!317045))

(declare-fun m!317053 () Bool)

(assert (=> b!306469 m!317053))

(declare-fun m!317055 () Bool)

(assert (=> b!306468 m!317055))

(declare-fun m!317057 () Bool)

(assert (=> b!306470 m!317057))

(assert (=> b!306470 m!317057))

(declare-fun m!317059 () Bool)

(assert (=> b!306470 m!317059))

(declare-fun m!317061 () Bool)

(assert (=> b!306473 m!317061))

(declare-fun m!317063 () Bool)

(assert (=> b!306464 m!317063))

(assert (=> b!306464 m!317063))

(declare-fun m!317065 () Bool)

(assert (=> b!306464 m!317065))

(assert (=> b!306465 m!317045))

(declare-fun m!317067 () Bool)

(assert (=> b!306467 m!317067))

(push 1)

(assert (not b!306464))

(assert (not b!306473))

(assert (not b!306469))

(assert (not b!306461))

(assert (not b!306466))

(assert (not b!306468))

(assert (not b!306470))

(assert (not start!30576))

