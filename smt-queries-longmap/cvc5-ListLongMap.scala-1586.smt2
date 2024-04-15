; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30130 () Bool)

(assert start!30130)

(declare-fun b!301603 () Bool)

(declare-fun res!159359 () Bool)

(declare-fun e!190258 () Bool)

(assert (=> b!301603 (=> (not res!159359) (not e!190258))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301603 (= res!159359 (validKeyInArray!0 k!2441))))

(declare-fun b!301604 () Bool)

(declare-fun res!159358 () Bool)

(assert (=> b!301604 (=> (not res!159358) (not e!190258))))

(declare-datatypes ((array!15285 0))(
  ( (array!15286 (arr!7232 (Array (_ BitVec 32) (_ BitVec 64))) (size!7585 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15285)

(declare-fun arrayContainsKey!0 (array!15285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301604 (= res!159358 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!159361 () Bool)

(assert (=> start!30130 (=> (not res!159361) (not e!190258))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30130 (= res!159361 (validMask!0 mask!3709))))

(assert (=> start!30130 e!190258))

(assert (=> start!30130 true))

(declare-fun array_inv!5204 (array!15285) Bool)

(assert (=> start!30130 (array_inv!5204 a!3293)))

(declare-fun b!301605 () Bool)

(assert (=> b!301605 (= e!190258 false)))

(declare-fun lt!149735 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301605 (= lt!149735 (toIndex!0 k!2441 mask!3709))))

(declare-fun b!301606 () Bool)

(declare-fun res!159362 () Bool)

(assert (=> b!301606 (=> (not res!159362) (not e!190258))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301606 (= res!159362 (and (= (size!7585 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7585 a!3293))))))

(declare-fun b!301607 () Bool)

(declare-fun res!159360 () Bool)

(assert (=> b!301607 (=> (not res!159360) (not e!190258))))

(declare-datatypes ((SeekEntryResult!2371 0))(
  ( (MissingZero!2371 (index!11660 (_ BitVec 32))) (Found!2371 (index!11661 (_ BitVec 32))) (Intermediate!2371 (undefined!3183 Bool) (index!11662 (_ BitVec 32)) (x!29945 (_ BitVec 32))) (Undefined!2371) (MissingVacant!2371 (index!11663 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15285 (_ BitVec 32)) SeekEntryResult!2371)

(assert (=> b!301607 (= res!159360 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2371 i!1240)))))

(declare-fun b!301608 () Bool)

(declare-fun res!159363 () Bool)

(assert (=> b!301608 (=> (not res!159363) (not e!190258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15285 (_ BitVec 32)) Bool)

(assert (=> b!301608 (= res!159363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30130 res!159361) b!301606))

(assert (= (and b!301606 res!159362) b!301603))

(assert (= (and b!301603 res!159359) b!301604))

(assert (= (and b!301604 res!159358) b!301607))

(assert (= (and b!301607 res!159360) b!301608))

(assert (= (and b!301608 res!159363) b!301605))

(declare-fun m!312821 () Bool)

(assert (=> start!30130 m!312821))

(declare-fun m!312823 () Bool)

(assert (=> start!30130 m!312823))

(declare-fun m!312825 () Bool)

(assert (=> b!301604 m!312825))

(declare-fun m!312827 () Bool)

(assert (=> b!301608 m!312827))

(declare-fun m!312829 () Bool)

(assert (=> b!301607 m!312829))

(declare-fun m!312831 () Bool)

(assert (=> b!301605 m!312831))

(declare-fun m!312833 () Bool)

(assert (=> b!301603 m!312833))

(push 1)

(assert (not b!301603))

(assert (not b!301608))

(assert (not b!301604))

(assert (not b!301605))

(assert (not b!301607))

(assert (not start!30130))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

