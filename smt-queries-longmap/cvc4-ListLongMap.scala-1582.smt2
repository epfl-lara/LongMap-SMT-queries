; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30078 () Bool)

(assert start!30078)

(declare-fun b!301554 () Bool)

(declare-fun res!159237 () Bool)

(declare-fun e!190290 () Bool)

(assert (=> b!301554 (=> (not res!159237) (not e!190290))))

(declare-datatypes ((array!15268 0))(
  ( (array!15269 (arr!7225 (Array (_ BitVec 32) (_ BitVec 64))) (size!7577 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15268)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2365 0))(
  ( (MissingZero!2365 (index!11636 (_ BitVec 32))) (Found!2365 (index!11637 (_ BitVec 32))) (Intermediate!2365 (undefined!3177 Bool) (index!11638 (_ BitVec 32)) (x!29909 (_ BitVec 32))) (Undefined!2365) (MissingVacant!2365 (index!11639 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15268 (_ BitVec 32)) SeekEntryResult!2365)

(assert (=> b!301554 (= res!159237 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2365 i!1240)))))

(declare-fun b!301555 () Bool)

(declare-fun res!159234 () Bool)

(assert (=> b!301555 (=> (not res!159234) (not e!190290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301555 (= res!159234 (validKeyInArray!0 k!2441))))

(declare-fun b!301556 () Bool)

(declare-fun res!159233 () Bool)

(assert (=> b!301556 (=> (not res!159233) (not e!190290))))

(declare-fun arrayContainsKey!0 (array!15268 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301556 (= res!159233 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!159235 () Bool)

(assert (=> start!30078 (=> (not res!159235) (not e!190290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30078 (= res!159235 (validMask!0 mask!3709))))

(assert (=> start!30078 e!190290))

(assert (=> start!30078 true))

(declare-fun array_inv!5188 (array!15268) Bool)

(assert (=> start!30078 (array_inv!5188 a!3293)))

(declare-fun b!301557 () Bool)

(declare-fun res!159236 () Bool)

(assert (=> b!301557 (=> (not res!159236) (not e!190290))))

(assert (=> b!301557 (= res!159236 (and (= (size!7577 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7577 a!3293))))))

(declare-fun b!301558 () Bool)

(assert (=> b!301558 (= e!190290 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!149862 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301558 (= lt!149862 (toIndex!0 k!2441 mask!3709))))

(declare-fun b!301559 () Bool)

(declare-fun res!159232 () Bool)

(assert (=> b!301559 (=> (not res!159232) (not e!190290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15268 (_ BitVec 32)) Bool)

(assert (=> b!301559 (= res!159232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30078 res!159235) b!301557))

(assert (= (and b!301557 res!159236) b!301555))

(assert (= (and b!301555 res!159234) b!301556))

(assert (= (and b!301556 res!159233) b!301554))

(assert (= (and b!301554 res!159237) b!301559))

(assert (= (and b!301559 res!159232) b!301558))

(declare-fun m!313305 () Bool)

(assert (=> b!301558 m!313305))

(declare-fun m!313307 () Bool)

(assert (=> start!30078 m!313307))

(declare-fun m!313309 () Bool)

(assert (=> start!30078 m!313309))

(declare-fun m!313311 () Bool)

(assert (=> b!301556 m!313311))

(declare-fun m!313313 () Bool)

(assert (=> b!301555 m!313313))

(declare-fun m!313315 () Bool)

(assert (=> b!301559 m!313315))

(declare-fun m!313317 () Bool)

(assert (=> b!301554 m!313317))

(push 1)

(assert (not b!301558))

(assert (not b!301555))

(assert (not b!301556))

(assert (not b!301559))

(assert (not start!30078))

(assert (not b!301554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

