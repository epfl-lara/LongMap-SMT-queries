; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30138 () Bool)

(assert start!30138)

(declare-fun res!159435 () Bool)

(declare-fun e!190416 () Bool)

(assert (=> start!30138 (=> (not res!159435) (not e!190416))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30138 (= res!159435 (validMask!0 mask!3709))))

(assert (=> start!30138 e!190416))

(assert (=> start!30138 true))

(declare-datatypes ((array!15289 0))(
  ( (array!15290 (arr!7234 (Array (_ BitVec 32) (_ BitVec 64))) (size!7586 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15289)

(declare-fun array_inv!5197 (array!15289) Bool)

(assert (=> start!30138 (array_inv!5197 a!3293)))

(declare-fun b!301824 () Bool)

(declare-fun res!159436 () Bool)

(assert (=> b!301824 (=> (not res!159436) (not e!190416))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301824 (= res!159436 (and (= (size!7586 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7586 a!3293))))))

(declare-fun b!301825 () Bool)

(declare-fun res!159437 () Bool)

(assert (=> b!301825 (=> (not res!159437) (not e!190416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15289 (_ BitVec 32)) Bool)

(assert (=> b!301825 (= res!159437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301826 () Bool)

(assert (=> b!301826 (= e!190416 false)))

(declare-fun lt!149961 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301826 (= lt!149961 (toIndex!0 k!2441 mask!3709))))

(declare-fun b!301827 () Bool)

(declare-fun res!159434 () Bool)

(assert (=> b!301827 (=> (not res!159434) (not e!190416))))

(declare-datatypes ((SeekEntryResult!2374 0))(
  ( (MissingZero!2374 (index!11672 (_ BitVec 32))) (Found!2374 (index!11673 (_ BitVec 32))) (Intermediate!2374 (undefined!3186 Bool) (index!11674 (_ BitVec 32)) (x!29945 (_ BitVec 32))) (Undefined!2374) (MissingVacant!2374 (index!11675 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15289 (_ BitVec 32)) SeekEntryResult!2374)

(assert (=> b!301827 (= res!159434 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2374 i!1240)))))

(declare-fun b!301828 () Bool)

(declare-fun res!159438 () Bool)

(assert (=> b!301828 (=> (not res!159438) (not e!190416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301828 (= res!159438 (validKeyInArray!0 k!2441))))

(declare-fun b!301829 () Bool)

(declare-fun res!159433 () Bool)

(assert (=> b!301829 (=> (not res!159433) (not e!190416))))

(declare-fun arrayContainsKey!0 (array!15289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301829 (= res!159433 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30138 res!159435) b!301824))

(assert (= (and b!301824 res!159436) b!301828))

(assert (= (and b!301828 res!159438) b!301829))

(assert (= (and b!301829 res!159433) b!301827))

(assert (= (and b!301827 res!159434) b!301825))

(assert (= (and b!301825 res!159437) b!301826))

(declare-fun m!313509 () Bool)

(assert (=> b!301827 m!313509))

(declare-fun m!313511 () Bool)

(assert (=> b!301826 m!313511))

(declare-fun m!313513 () Bool)

(assert (=> b!301829 m!313513))

(declare-fun m!313515 () Bool)

(assert (=> b!301828 m!313515))

(declare-fun m!313517 () Bool)

(assert (=> b!301825 m!313517))

(declare-fun m!313519 () Bool)

(assert (=> start!30138 m!313519))

(declare-fun m!313521 () Bool)

(assert (=> start!30138 m!313521))

(push 1)

(assert (not b!301829))

(assert (not b!301826))

