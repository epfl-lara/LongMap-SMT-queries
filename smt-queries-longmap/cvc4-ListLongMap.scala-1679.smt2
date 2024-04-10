; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30966 () Bool)

(assert start!30966)

(declare-fun b!311027 () Bool)

(declare-fun res!167486 () Bool)

(declare-fun e!194112 () Bool)

(assert (=> b!311027 (=> (not res!167486) (not e!194112))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311027 (= res!167486 (validKeyInArray!0 k!2441))))

(declare-fun b!311028 () Bool)

(declare-fun res!167487 () Bool)

(declare-fun e!194116 () Bool)

(assert (=> b!311028 (=> (not res!167487) (not e!194116))))

(declare-datatypes ((array!15868 0))(
  ( (array!15869 (arr!7516 (Array (_ BitVec 32) (_ BitVec 64))) (size!7868 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15868)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311028 (= res!167487 (and (= (select (arr!7516 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7868 a!3293))))))

(declare-fun res!167483 () Bool)

(assert (=> start!30966 (=> (not res!167483) (not e!194112))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30966 (= res!167483 (validMask!0 mask!3709))))

(assert (=> start!30966 e!194112))

(declare-fun array_inv!5479 (array!15868) Bool)

(assert (=> start!30966 (array_inv!5479 a!3293)))

(assert (=> start!30966 true))

(declare-fun b!311029 () Bool)

(declare-fun res!167490 () Bool)

(assert (=> b!311029 (=> (not res!167490) (not e!194112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15868 (_ BitVec 32)) Bool)

(assert (=> b!311029 (= res!167490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311030 () Bool)

(assert (=> b!311030 (= e!194112 e!194116)))

(declare-fun res!167482 () Bool)

(assert (=> b!311030 (=> (not res!167482) (not e!194116))))

(declare-datatypes ((SeekEntryResult!2656 0))(
  ( (MissingZero!2656 (index!12800 (_ BitVec 32))) (Found!2656 (index!12801 (_ BitVec 32))) (Intermediate!2656 (undefined!3468 Bool) (index!12802 (_ BitVec 32)) (x!31021 (_ BitVec 32))) (Undefined!2656) (MissingVacant!2656 (index!12803 (_ BitVec 32))) )
))
(declare-fun lt!152191 () SeekEntryResult!2656)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15868 (_ BitVec 32)) SeekEntryResult!2656)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311030 (= res!167482 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152191))))

(assert (=> b!311030 (= lt!152191 (Intermediate!2656 false resIndex!52 resX!52))))

(declare-fun e!194114 () Bool)

(declare-fun lt!152192 () array!15868)

(declare-fun b!311031 () Bool)

(declare-fun lt!152193 () (_ BitVec 32))

(assert (=> b!311031 (= e!194114 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152192 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152193 k!2441 lt!152192 mask!3709)))))

(assert (=> b!311031 (= lt!152192 (array!15869 (store (arr!7516 a!3293) i!1240 k!2441) (size!7868 a!3293)))))

(declare-fun b!311032 () Bool)

(declare-fun res!167481 () Bool)

(assert (=> b!311032 (=> (not res!167481) (not e!194112))))

(assert (=> b!311032 (= res!167481 (and (= (size!7868 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7868 a!3293))))))

(declare-fun b!311033 () Bool)

(declare-fun e!194113 () Bool)

(assert (=> b!311033 (= e!194113 (not true))))

(assert (=> b!311033 e!194114))

(declare-fun res!167485 () Bool)

(assert (=> b!311033 (=> (not res!167485) (not e!194114))))

(declare-fun lt!152190 () SeekEntryResult!2656)

(assert (=> b!311033 (= res!167485 (= lt!152190 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152193 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311033 (= lt!152193 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311034 () Bool)

(declare-fun res!167489 () Bool)

(assert (=> b!311034 (=> (not res!167489) (not e!194112))))

(declare-fun arrayContainsKey!0 (array!15868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311034 (= res!167489 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311035 () Bool)

(declare-fun res!167484 () Bool)

(assert (=> b!311035 (=> (not res!167484) (not e!194112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15868 (_ BitVec 32)) SeekEntryResult!2656)

(assert (=> b!311035 (= res!167484 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2656 i!1240)))))

(declare-fun b!311036 () Bool)

(assert (=> b!311036 (= e!194116 e!194113)))

(declare-fun res!167488 () Bool)

(assert (=> b!311036 (=> (not res!167488) (not e!194113))))

(assert (=> b!311036 (= res!167488 (and (= lt!152190 lt!152191) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7516 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311036 (= lt!152190 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!30966 res!167483) b!311032))

(assert (= (and b!311032 res!167481) b!311027))

(assert (= (and b!311027 res!167486) b!311034))

(assert (= (and b!311034 res!167489) b!311035))

(assert (= (and b!311035 res!167484) b!311029))

(assert (= (and b!311029 res!167490) b!311030))

(assert (= (and b!311030 res!167482) b!311028))

(assert (= (and b!311028 res!167487) b!311036))

(assert (= (and b!311036 res!167488) b!311033))

(assert (= (and b!311033 res!167485) b!311031))

(declare-fun m!320973 () Bool)

(assert (=> b!311028 m!320973))

(declare-fun m!320975 () Bool)

(assert (=> b!311034 m!320975))

(declare-fun m!320977 () Bool)

(assert (=> b!311035 m!320977))

(declare-fun m!320979 () Bool)

(assert (=> b!311029 m!320979))

(declare-fun m!320981 () Bool)

(assert (=> start!30966 m!320981))

(declare-fun m!320983 () Bool)

(assert (=> start!30966 m!320983))

(declare-fun m!320985 () Bool)

(assert (=> b!311036 m!320985))

(declare-fun m!320987 () Bool)

(assert (=> b!311036 m!320987))

(declare-fun m!320989 () Bool)

(assert (=> b!311030 m!320989))

(assert (=> b!311030 m!320989))

(declare-fun m!320991 () Bool)

(assert (=> b!311030 m!320991))

(declare-fun m!320993 () Bool)

(assert (=> b!311031 m!320993))

(declare-fun m!320995 () Bool)

(assert (=> b!311031 m!320995))

(declare-fun m!320997 () Bool)

(assert (=> b!311031 m!320997))

(declare-fun m!320999 () Bool)

(assert (=> b!311033 m!320999))

(declare-fun m!321001 () Bool)

(assert (=> b!311033 m!321001))

(declare-fun m!321003 () Bool)

(assert (=> b!311027 m!321003))

(push 1)

(assert (not start!30966))

(assert (not b!311027))

(assert (not b!311033))

(assert (not b!311029))

(assert (not b!311036))

(assert (not b!311034))

