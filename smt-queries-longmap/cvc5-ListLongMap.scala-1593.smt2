; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30220 () Bool)

(assert start!30220)

(declare-fun b!302435 () Bool)

(declare-fun res!159977 () Bool)

(declare-fun e!190643 () Bool)

(assert (=> b!302435 (=> (not res!159977) (not e!190643))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302435 (= res!159977 (validKeyInArray!0 k!2441))))

(declare-fun b!302436 () Bool)

(declare-fun res!159978 () Bool)

(assert (=> b!302436 (=> (not res!159978) (not e!190643))))

(declare-datatypes ((array!15339 0))(
  ( (array!15340 (arr!7257 (Array (_ BitVec 32) (_ BitVec 64))) (size!7609 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15339)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2362 0))(
  ( (MissingZero!2362 (index!11624 (_ BitVec 32))) (Found!2362 (index!11625 (_ BitVec 32))) (Intermediate!2362 (undefined!3174 Bool) (index!11626 (_ BitVec 32)) (x!30000 (_ BitVec 32))) (Undefined!2362) (MissingVacant!2362 (index!11627 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15339 (_ BitVec 32)) SeekEntryResult!2362)

(assert (=> b!302436 (= res!159978 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2362 i!1240)))))

(declare-fun b!302437 () Bool)

(declare-fun res!159975 () Bool)

(assert (=> b!302437 (=> (not res!159975) (not e!190643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15339 (_ BitVec 32)) Bool)

(assert (=> b!302437 (= res!159975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302438 () Bool)

(declare-fun res!159974 () Bool)

(assert (=> b!302438 (=> (not res!159974) (not e!190643))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15339 (_ BitVec 32)) SeekEntryResult!2362)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302438 (= res!159974 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2362 false resIndex!52 resX!52)))))

(declare-fun b!302439 () Bool)

(assert (=> b!302439 (= e!190643 false)))

(declare-fun lt!150114 () SeekEntryResult!2362)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302439 (= lt!150114 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!302440 () Bool)

(declare-fun res!159972 () Bool)

(assert (=> b!302440 (=> (not res!159972) (not e!190643))))

(assert (=> b!302440 (= res!159972 (and (= (select (arr!7257 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7609 a!3293))))))

(declare-fun b!302441 () Bool)

(declare-fun res!159971 () Bool)

(assert (=> b!302441 (=> (not res!159971) (not e!190643))))

(assert (=> b!302441 (= res!159971 (and (= (size!7609 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7609 a!3293))))))

(declare-fun res!159976 () Bool)

(assert (=> start!30220 (=> (not res!159976) (not e!190643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30220 (= res!159976 (validMask!0 mask!3709))))

(assert (=> start!30220 e!190643))

(declare-fun array_inv!5207 (array!15339) Bool)

(assert (=> start!30220 (array_inv!5207 a!3293)))

(assert (=> start!30220 true))

(declare-fun b!302442 () Bool)

(declare-fun res!159973 () Bool)

(assert (=> b!302442 (=> (not res!159973) (not e!190643))))

(declare-fun arrayContainsKey!0 (array!15339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302442 (= res!159973 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30220 res!159976) b!302441))

(assert (= (and b!302441 res!159971) b!302435))

(assert (= (and b!302435 res!159977) b!302442))

(assert (= (and b!302442 res!159973) b!302436))

(assert (= (and b!302436 res!159978) b!302437))

(assert (= (and b!302437 res!159975) b!302438))

(assert (= (and b!302438 res!159974) b!302440))

(assert (= (and b!302440 res!159972) b!302439))

(declare-fun m!314117 () Bool)

(assert (=> b!302440 m!314117))

(declare-fun m!314119 () Bool)

(assert (=> b!302438 m!314119))

(assert (=> b!302438 m!314119))

(declare-fun m!314121 () Bool)

(assert (=> b!302438 m!314121))

(declare-fun m!314123 () Bool)

(assert (=> b!302436 m!314123))

(declare-fun m!314125 () Bool)

(assert (=> b!302442 m!314125))

(declare-fun m!314127 () Bool)

(assert (=> b!302435 m!314127))

(declare-fun m!314129 () Bool)

(assert (=> b!302439 m!314129))

(declare-fun m!314131 () Bool)

(assert (=> start!30220 m!314131))

(declare-fun m!314133 () Bool)

(assert (=> start!30220 m!314133))

(declare-fun m!314135 () Bool)

(assert (=> b!302437 m!314135))

(push 1)

(assert (not b!302438))

(assert (not b!302437))

(assert (not b!302439))

(assert (not b!302436))

(assert (not start!30220))

(assert (not b!302435))

(assert (not b!302442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

