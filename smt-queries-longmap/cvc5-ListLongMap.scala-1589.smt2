; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30158 () Bool)

(assert start!30158)

(declare-fun b!302013 () Bool)

(declare-fun res!159623 () Bool)

(declare-fun e!190476 () Bool)

(assert (=> b!302013 (=> (not res!159623) (not e!190476))))

(declare-datatypes ((array!15309 0))(
  ( (array!15310 (arr!7244 (Array (_ BitVec 32) (_ BitVec 64))) (size!7596 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15309)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302013 (= res!159623 (and (= (size!7596 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7596 a!3293))))))

(declare-fun b!302014 () Bool)

(assert (=> b!302014 (= e!190476 false)))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2384 0))(
  ( (MissingZero!2384 (index!11712 (_ BitVec 32))) (Found!2384 (index!11713 (_ BitVec 32))) (Intermediate!2384 (undefined!3196 Bool) (index!11714 (_ BitVec 32)) (x!29987 (_ BitVec 32))) (Undefined!2384) (MissingVacant!2384 (index!11715 (_ BitVec 32))) )
))
(declare-fun lt!149982 () SeekEntryResult!2384)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15309 (_ BitVec 32)) SeekEntryResult!2384)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302014 (= lt!149982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!302015 () Bool)

(declare-fun res!159625 () Bool)

(assert (=> b!302015 (=> (not res!159625) (not e!190476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302015 (= res!159625 (validKeyInArray!0 k!2441))))

(declare-fun b!302016 () Bool)

(declare-fun res!159624 () Bool)

(assert (=> b!302016 (=> (not res!159624) (not e!190476))))

(declare-fun arrayContainsKey!0 (array!15309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302016 (= res!159624 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302018 () Bool)

(declare-fun res!159622 () Bool)

(assert (=> b!302018 (=> (not res!159622) (not e!190476))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15309 (_ BitVec 32)) SeekEntryResult!2384)

(assert (=> b!302018 (= res!159622 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2384 i!1240)))))

(declare-fun b!302017 () Bool)

(declare-fun res!159626 () Bool)

(assert (=> b!302017 (=> (not res!159626) (not e!190476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15309 (_ BitVec 32)) Bool)

(assert (=> b!302017 (= res!159626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!159627 () Bool)

(assert (=> start!30158 (=> (not res!159627) (not e!190476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30158 (= res!159627 (validMask!0 mask!3709))))

(assert (=> start!30158 e!190476))

(assert (=> start!30158 true))

(declare-fun array_inv!5207 (array!15309) Bool)

(assert (=> start!30158 (array_inv!5207 a!3293)))

(assert (= (and start!30158 res!159627) b!302013))

(assert (= (and b!302013 res!159623) b!302015))

(assert (= (and b!302015 res!159625) b!302016))

(assert (= (and b!302016 res!159624) b!302018))

(assert (= (and b!302018 res!159622) b!302017))

(assert (= (and b!302017 res!159626) b!302014))

(declare-fun m!313667 () Bool)

(assert (=> b!302014 m!313667))

(assert (=> b!302014 m!313667))

(declare-fun m!313669 () Bool)

(assert (=> b!302014 m!313669))

(declare-fun m!313671 () Bool)

(assert (=> start!30158 m!313671))

(declare-fun m!313673 () Bool)

(assert (=> start!30158 m!313673))

(declare-fun m!313675 () Bool)

(assert (=> b!302017 m!313675))

(declare-fun m!313677 () Bool)

(assert (=> b!302018 m!313677))

(declare-fun m!313679 () Bool)

(assert (=> b!302016 m!313679))

(declare-fun m!313681 () Bool)

(assert (=> b!302015 m!313681))

(push 1)

(assert (not b!302015))

(assert (not start!30158))

(assert (not b!302018))

(assert (not b!302016))

(assert (not b!302014))

(assert (not b!302017))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

