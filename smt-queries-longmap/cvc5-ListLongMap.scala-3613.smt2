; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49740 () Bool)

(assert start!49740)

(declare-fun b!546562 () Bool)

(declare-fun res!340418 () Bool)

(declare-fun e!315837 () Bool)

(assert (=> b!546562 (=> (not res!340418) (not e!315837))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546562 (= res!340418 (validKeyInArray!0 k!1914))))

(declare-fun b!546563 () Bool)

(declare-fun res!340421 () Bool)

(assert (=> b!546563 (=> (not res!340421) (not e!315837))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34487 0))(
  ( (array!34488 (arr!16570 (Array (_ BitVec 32) (_ BitVec 64))) (size!16935 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34487)

(assert (=> b!546563 (= res!340421 (and (= (size!16935 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16935 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16935 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!546564 () Bool)

(declare-fun res!340417 () Bool)

(assert (=> b!546564 (=> (not res!340417) (not e!315837))))

(assert (=> b!546564 (= res!340417 (validKeyInArray!0 (select (arr!16570 a!3118) j!142)))))

(declare-fun b!546565 () Bool)

(assert (=> b!546565 (= e!315837 false)))

(declare-datatypes ((SeekEntryResult!5016 0))(
  ( (MissingZero!5016 (index!22291 (_ BitVec 32))) (Found!5016 (index!22292 (_ BitVec 32))) (Intermediate!5016 (undefined!5828 Bool) (index!22293 (_ BitVec 32)) (x!51247 (_ BitVec 32))) (Undefined!5016) (MissingVacant!5016 (index!22294 (_ BitVec 32))) )
))
(declare-fun lt!249139 () SeekEntryResult!5016)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34487 (_ BitVec 32)) SeekEntryResult!5016)

(assert (=> b!546565 (= lt!249139 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!546561 () Bool)

(declare-fun res!340419 () Bool)

(assert (=> b!546561 (=> (not res!340419) (not e!315837))))

(declare-fun arrayContainsKey!0 (array!34487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546561 (= res!340419 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!340420 () Bool)

(assert (=> start!49740 (=> (not res!340420) (not e!315837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49740 (= res!340420 (validMask!0 mask!3119))))

(assert (=> start!49740 e!315837))

(assert (=> start!49740 true))

(declare-fun array_inv!12453 (array!34487) Bool)

(assert (=> start!49740 (array_inv!12453 a!3118)))

(assert (= (and start!49740 res!340420) b!546563))

(assert (= (and b!546563 res!340421) b!546564))

(assert (= (and b!546564 res!340417) b!546562))

(assert (= (and b!546562 res!340418) b!546561))

(assert (= (and b!546561 res!340419) b!546565))

(declare-fun m!523469 () Bool)

(assert (=> start!49740 m!523469))

(declare-fun m!523471 () Bool)

(assert (=> start!49740 m!523471))

(declare-fun m!523473 () Bool)

(assert (=> b!546561 m!523473))

(declare-fun m!523475 () Bool)

(assert (=> b!546564 m!523475))

(assert (=> b!546564 m!523475))

(declare-fun m!523477 () Bool)

(assert (=> b!546564 m!523477))

(declare-fun m!523479 () Bool)

(assert (=> b!546562 m!523479))

(declare-fun m!523481 () Bool)

(assert (=> b!546565 m!523481))

(push 1)

(assert (not b!546562))

(assert (not b!546565))

(assert (not b!546561))

(assert (not start!49740))

(assert (not b!546564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

