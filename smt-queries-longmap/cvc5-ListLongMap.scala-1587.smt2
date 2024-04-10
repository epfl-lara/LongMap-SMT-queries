; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30146 () Bool)

(assert start!30146)

(declare-fun res!159506 () Bool)

(declare-fun e!190440 () Bool)

(assert (=> start!30146 (=> (not res!159506) (not e!190440))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30146 (= res!159506 (validMask!0 mask!3709))))

(assert (=> start!30146 e!190440))

(assert (=> start!30146 true))

(declare-datatypes ((array!15297 0))(
  ( (array!15298 (arr!7238 (Array (_ BitVec 32) (_ BitVec 64))) (size!7590 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15297)

(declare-fun array_inv!5201 (array!15297) Bool)

(assert (=> start!30146 (array_inv!5201 a!3293)))

(declare-fun b!301896 () Bool)

(assert (=> b!301896 (= e!190440 false)))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2378 0))(
  ( (MissingZero!2378 (index!11688 (_ BitVec 32))) (Found!2378 (index!11689 (_ BitVec 32))) (Intermediate!2378 (undefined!3190 Bool) (index!11690 (_ BitVec 32)) (x!29965 (_ BitVec 32))) (Undefined!2378) (MissingVacant!2378 (index!11691 (_ BitVec 32))) )
))
(declare-fun lt!149973 () SeekEntryResult!2378)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15297 (_ BitVec 32)) SeekEntryResult!2378)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301896 (= lt!149973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!301897 () Bool)

(declare-fun res!159508 () Bool)

(assert (=> b!301897 (=> (not res!159508) (not e!190440))))

(declare-fun arrayContainsKey!0 (array!15297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301897 (= res!159508 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301898 () Bool)

(declare-fun res!159509 () Bool)

(assert (=> b!301898 (=> (not res!159509) (not e!190440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301898 (= res!159509 (validKeyInArray!0 k!2441))))

(declare-fun b!301899 () Bool)

(declare-fun res!159505 () Bool)

(assert (=> b!301899 (=> (not res!159505) (not e!190440))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15297 (_ BitVec 32)) SeekEntryResult!2378)

(assert (=> b!301899 (= res!159505 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2378 i!1240)))))

(declare-fun b!301900 () Bool)

(declare-fun res!159510 () Bool)

(assert (=> b!301900 (=> (not res!159510) (not e!190440))))

(assert (=> b!301900 (= res!159510 (and (= (size!7590 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7590 a!3293))))))

(declare-fun b!301901 () Bool)

(declare-fun res!159507 () Bool)

(assert (=> b!301901 (=> (not res!159507) (not e!190440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15297 (_ BitVec 32)) Bool)

(assert (=> b!301901 (= res!159507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30146 res!159506) b!301900))

(assert (= (and b!301900 res!159510) b!301898))

(assert (= (and b!301898 res!159509) b!301897))

(assert (= (and b!301897 res!159508) b!301899))

(assert (= (and b!301899 res!159505) b!301901))

(assert (= (and b!301901 res!159507) b!301896))

(declare-fun m!313565 () Bool)

(assert (=> b!301897 m!313565))

(declare-fun m!313567 () Bool)

(assert (=> b!301898 m!313567))

(declare-fun m!313569 () Bool)

(assert (=> b!301896 m!313569))

(assert (=> b!301896 m!313569))

(declare-fun m!313571 () Bool)

(assert (=> b!301896 m!313571))

(declare-fun m!313573 () Bool)

(assert (=> b!301899 m!313573))

(declare-fun m!313575 () Bool)

(assert (=> start!30146 m!313575))

(declare-fun m!313577 () Bool)

(assert (=> start!30146 m!313577))

(declare-fun m!313579 () Bool)

(assert (=> b!301901 m!313579))

(push 1)

(assert (not b!301897))

(assert (not b!301896))

(assert (not b!301899))

(assert (not start!30146))

(assert (not b!301898))

(assert (not b!301901))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

