; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30248 () Bool)

(assert start!30248)

(declare-fun b!302667 () Bool)

(declare-fun res!160153 () Bool)

(declare-fun e!190731 () Bool)

(assert (=> b!302667 (=> (not res!160153) (not e!190731))))

(declare-datatypes ((array!15354 0))(
  ( (array!15355 (arr!7265 (Array (_ BitVec 32) (_ BitVec 64))) (size!7617 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15354)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!302667 (= res!160153 (and (= (select (arr!7265 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7617 a!3293))))))

(declare-fun b!302668 () Bool)

(declare-fun res!160158 () Bool)

(declare-fun e!190730 () Bool)

(assert (=> b!302668 (=> (not res!160158) (not e!190730))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2405 0))(
  ( (MissingZero!2405 (index!11796 (_ BitVec 32))) (Found!2405 (index!11797 (_ BitVec 32))) (Intermediate!2405 (undefined!3217 Bool) (index!11798 (_ BitVec 32)) (x!30070 (_ BitVec 32))) (Undefined!2405) (MissingVacant!2405 (index!11799 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15354 (_ BitVec 32)) SeekEntryResult!2405)

(assert (=> b!302668 (= res!160158 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2405 i!1240)))))

(declare-fun b!302669 () Bool)

(assert (=> b!302669 (= e!190731 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7265 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7265 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7265 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!302670 () Bool)

(declare-fun res!160157 () Bool)

(assert (=> b!302670 (=> (not res!160157) (not e!190730))))

(declare-fun arrayContainsKey!0 (array!15354 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302670 (= res!160157 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302671 () Bool)

(declare-fun res!160161 () Bool)

(assert (=> b!302671 (=> (not res!160161) (not e!190730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15354 (_ BitVec 32)) Bool)

(assert (=> b!302671 (= res!160161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!160156 () Bool)

(assert (=> start!30248 (=> (not res!160156) (not e!190730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30248 (= res!160156 (validMask!0 mask!3709))))

(assert (=> start!30248 e!190730))

(declare-fun array_inv!5228 (array!15354) Bool)

(assert (=> start!30248 (array_inv!5228 a!3293)))

(assert (=> start!30248 true))

(declare-fun b!302672 () Bool)

(declare-fun res!160160 () Bool)

(assert (=> b!302672 (=> (not res!160160) (not e!190730))))

(assert (=> b!302672 (= res!160160 (and (= (size!7617 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7617 a!3293))))))

(declare-fun b!302673 () Bool)

(assert (=> b!302673 (= e!190730 e!190731)))

(declare-fun res!160159 () Bool)

(assert (=> b!302673 (=> (not res!160159) (not e!190731))))

(declare-fun lt!150117 () SeekEntryResult!2405)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15354 (_ BitVec 32)) SeekEntryResult!2405)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302673 (= res!160159 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150117))))

(assert (=> b!302673 (= lt!150117 (Intermediate!2405 false resIndex!52 resX!52))))

(declare-fun b!302674 () Bool)

(declare-fun res!160154 () Bool)

(assert (=> b!302674 (=> (not res!160154) (not e!190731))))

(assert (=> b!302674 (= res!160154 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150117))))

(declare-fun b!302675 () Bool)

(declare-fun res!160155 () Bool)

(assert (=> b!302675 (=> (not res!160155) (not e!190730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302675 (= res!160155 (validKeyInArray!0 k!2441))))

(assert (= (and start!30248 res!160156) b!302672))

(assert (= (and b!302672 res!160160) b!302675))

(assert (= (and b!302675 res!160155) b!302670))

(assert (= (and b!302670 res!160157) b!302668))

(assert (= (and b!302668 res!160158) b!302671))

(assert (= (and b!302671 res!160161) b!302673))

(assert (= (and b!302673 res!160159) b!302667))

(assert (= (and b!302667 res!160153) b!302674))

(assert (= (and b!302674 res!160154) b!302669))

(declare-fun m!314153 () Bool)

(assert (=> b!302674 m!314153))

(declare-fun m!314155 () Bool)

(assert (=> b!302670 m!314155))

(declare-fun m!314157 () Bool)

(assert (=> b!302669 m!314157))

(declare-fun m!314159 () Bool)

(assert (=> b!302675 m!314159))

(declare-fun m!314161 () Bool)

(assert (=> b!302668 m!314161))

(declare-fun m!314163 () Bool)

(assert (=> b!302671 m!314163))

(declare-fun m!314165 () Bool)

(assert (=> b!302667 m!314165))

(declare-fun m!314167 () Bool)

(assert (=> b!302673 m!314167))

(assert (=> b!302673 m!314167))

(declare-fun m!314169 () Bool)

(assert (=> b!302673 m!314169))

(declare-fun m!314171 () Bool)

(assert (=> start!30248 m!314171))

(declare-fun m!314173 () Bool)

(assert (=> start!30248 m!314173))

(push 1)

(assert (not b!302674))

(assert (not b!302670))

(assert (not b!302673))

(assert (not start!30248))

(assert (not b!302671))

(assert (not b!302675))

(assert (not b!302668))

(check-sat)

(pop 1)

(push 1)

(check-sat)

