; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30312 () Bool)

(assert start!30312)

(declare-fun b!303486 () Bool)

(declare-fun res!160973 () Bool)

(declare-fun e!190975 () Bool)

(assert (=> b!303486 (=> (not res!160973) (not e!190975))))

(declare-datatypes ((array!15418 0))(
  ( (array!15419 (arr!7297 (Array (_ BitVec 32) (_ BitVec 64))) (size!7649 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15418)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2437 0))(
  ( (MissingZero!2437 (index!11924 (_ BitVec 32))) (Found!2437 (index!11925 (_ BitVec 32))) (Intermediate!2437 (undefined!3249 Bool) (index!11926 (_ BitVec 32)) (x!30182 (_ BitVec 32))) (Undefined!2437) (MissingVacant!2437 (index!11927 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15418 (_ BitVec 32)) SeekEntryResult!2437)

(assert (=> b!303486 (= res!160973 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2437 i!1240)))))

(declare-fun b!303487 () Bool)

(declare-fun res!160975 () Bool)

(declare-fun e!190973 () Bool)

(assert (=> b!303487 (=> (not res!160975) (not e!190973))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303487 (= res!160975 (and (= (select (arr!7297 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7649 a!3293))))))

(declare-fun b!303488 () Bool)

(declare-fun res!160974 () Bool)

(assert (=> b!303488 (=> (not res!160974) (not e!190975))))

(declare-fun arrayContainsKey!0 (array!15418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303488 (= res!160974 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303489 () Bool)

(declare-fun res!160976 () Bool)

(assert (=> b!303489 (=> (not res!160976) (not e!190975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15418 (_ BitVec 32)) Bool)

(assert (=> b!303489 (= res!160976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303490 () Bool)

(declare-fun res!160979 () Bool)

(assert (=> b!303490 (=> (not res!160979) (not e!190975))))

(assert (=> b!303490 (= res!160979 (and (= (size!7649 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7649 a!3293))))))

(declare-fun b!303491 () Bool)

(assert (=> b!303491 (= e!190973 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7297 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7297 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7297 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!303492 () Bool)

(declare-fun res!160980 () Bool)

(assert (=> b!303492 (=> (not res!160980) (not e!190973))))

(declare-fun lt!150213 () SeekEntryResult!2437)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15418 (_ BitVec 32)) SeekEntryResult!2437)

(assert (=> b!303492 (= res!160980 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150213))))

(declare-fun res!160978 () Bool)

(assert (=> start!30312 (=> (not res!160978) (not e!190975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30312 (= res!160978 (validMask!0 mask!3709))))

(assert (=> start!30312 e!190975))

(declare-fun array_inv!5260 (array!15418) Bool)

(assert (=> start!30312 (array_inv!5260 a!3293)))

(assert (=> start!30312 true))

(declare-fun b!303493 () Bool)

(assert (=> b!303493 (= e!190975 e!190973)))

(declare-fun res!160977 () Bool)

(assert (=> b!303493 (=> (not res!160977) (not e!190973))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303493 (= res!160977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150213))))

(assert (=> b!303493 (= lt!150213 (Intermediate!2437 false resIndex!52 resX!52))))

(declare-fun b!303494 () Bool)

(declare-fun res!160972 () Bool)

(assert (=> b!303494 (=> (not res!160972) (not e!190975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303494 (= res!160972 (validKeyInArray!0 k!2441))))

(assert (= (and start!30312 res!160978) b!303490))

(assert (= (and b!303490 res!160979) b!303494))

(assert (= (and b!303494 res!160972) b!303488))

(assert (= (and b!303488 res!160974) b!303486))

(assert (= (and b!303486 res!160973) b!303489))

(assert (= (and b!303489 res!160976) b!303493))

(assert (= (and b!303493 res!160977) b!303487))

(assert (= (and b!303487 res!160975) b!303492))

(assert (= (and b!303492 res!160980) b!303491))

(declare-fun m!314827 () Bool)

(assert (=> b!303492 m!314827))

(declare-fun m!314829 () Bool)

(assert (=> b!303486 m!314829))

(declare-fun m!314831 () Bool)

(assert (=> b!303493 m!314831))

(assert (=> b!303493 m!314831))

(declare-fun m!314833 () Bool)

(assert (=> b!303493 m!314833))

(declare-fun m!314835 () Bool)

(assert (=> b!303487 m!314835))

(declare-fun m!314837 () Bool)

(assert (=> b!303488 m!314837))

(declare-fun m!314839 () Bool)

(assert (=> b!303489 m!314839))

(declare-fun m!314841 () Bool)

(assert (=> b!303494 m!314841))

(declare-fun m!314843 () Bool)

(assert (=> start!30312 m!314843))

(declare-fun m!314845 () Bool)

(assert (=> start!30312 m!314845))

(declare-fun m!314847 () Bool)

(assert (=> b!303491 m!314847))

(push 1)

(assert (not b!303489))

(assert (not b!303488))

(assert (not b!303492))

(assert (not b!303486))

(assert (not start!30312))

(assert (not b!303494))

(assert (not b!303493))

(check-sat)

