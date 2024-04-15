; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30220 () Bool)

(assert start!30220)

(declare-fun b!302213 () Bool)

(declare-fun res!159851 () Bool)

(declare-fun e!190501 () Bool)

(assert (=> b!302213 (=> (not res!159851) (not e!190501))))

(declare-datatypes ((array!15330 0))(
  ( (array!15331 (arr!7253 (Array (_ BitVec 32) (_ BitVec 64))) (size!7606 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15330)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2392 0))(
  ( (MissingZero!2392 (index!11744 (_ BitVec 32))) (Found!2392 (index!11745 (_ BitVec 32))) (Intermediate!2392 (undefined!3204 Bool) (index!11746 (_ BitVec 32)) (x!30028 (_ BitVec 32))) (Undefined!2392) (MissingVacant!2392 (index!11747 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15330 (_ BitVec 32)) SeekEntryResult!2392)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302213 (= res!159851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2392 false resIndex!52 resX!52)))))

(declare-fun b!302214 () Bool)

(declare-fun res!159848 () Bool)

(assert (=> b!302214 (=> (not res!159848) (not e!190501))))

(declare-fun arrayContainsKey!0 (array!15330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302214 (= res!159848 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302215 () Bool)

(assert (=> b!302215 (= e!190501 false)))

(declare-fun lt!149861 () SeekEntryResult!2392)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302215 (= lt!149861 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!302216 () Bool)

(declare-fun res!159850 () Bool)

(assert (=> b!302216 (=> (not res!159850) (not e!190501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15330 (_ BitVec 32)) Bool)

(assert (=> b!302216 (= res!159850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302217 () Bool)

(declare-fun res!159847 () Bool)

(assert (=> b!302217 (=> (not res!159847) (not e!190501))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15330 (_ BitVec 32)) SeekEntryResult!2392)

(assert (=> b!302217 (= res!159847 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2392 i!1240)))))

(declare-fun b!302218 () Bool)

(declare-fun res!159846 () Bool)

(assert (=> b!302218 (=> (not res!159846) (not e!190501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302218 (= res!159846 (validKeyInArray!0 k!2441))))

(declare-fun b!302219 () Bool)

(declare-fun res!159852 () Bool)

(assert (=> b!302219 (=> (not res!159852) (not e!190501))))

(assert (=> b!302219 (= res!159852 (and (= (size!7606 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7606 a!3293))))))

(declare-fun res!159845 () Bool)

(assert (=> start!30220 (=> (not res!159845) (not e!190501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30220 (= res!159845 (validMask!0 mask!3709))))

(assert (=> start!30220 e!190501))

(declare-fun array_inv!5225 (array!15330) Bool)

(assert (=> start!30220 (array_inv!5225 a!3293)))

(assert (=> start!30220 true))

(declare-fun b!302220 () Bool)

(declare-fun res!159849 () Bool)

(assert (=> b!302220 (=> (not res!159849) (not e!190501))))

(assert (=> b!302220 (= res!159849 (and (= (select (arr!7253 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7606 a!3293))))))

(assert (= (and start!30220 res!159845) b!302219))

(assert (= (and b!302219 res!159852) b!302218))

(assert (= (and b!302218 res!159846) b!302214))

(assert (= (and b!302214 res!159848) b!302217))

(assert (= (and b!302217 res!159847) b!302216))

(assert (= (and b!302216 res!159850) b!302213))

(assert (= (and b!302213 res!159851) b!302220))

(assert (= (and b!302220 res!159849) b!302215))

(declare-fun m!313277 () Bool)

(assert (=> b!302218 m!313277))

(declare-fun m!313279 () Bool)

(assert (=> start!30220 m!313279))

(declare-fun m!313281 () Bool)

(assert (=> start!30220 m!313281))

(declare-fun m!313283 () Bool)

(assert (=> b!302220 m!313283))

(declare-fun m!313285 () Bool)

(assert (=> b!302213 m!313285))

(assert (=> b!302213 m!313285))

(declare-fun m!313287 () Bool)

(assert (=> b!302213 m!313287))

(declare-fun m!313289 () Bool)

(assert (=> b!302215 m!313289))

(declare-fun m!313291 () Bool)

(assert (=> b!302216 m!313291))

(declare-fun m!313293 () Bool)

(assert (=> b!302217 m!313293))

(declare-fun m!313295 () Bool)

(assert (=> b!302214 m!313295))

(push 1)

(assert (not b!302216))

(assert (not b!302214))

(assert (not b!302217))

(assert (not start!30220))

(assert (not b!302215))

(assert (not b!302213))

(assert (not b!302218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

