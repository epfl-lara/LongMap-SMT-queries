; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31978 () Bool)

(assert start!31978)

(declare-fun res!173781 () Bool)

(declare-fun e!198381 () Bool)

(assert (=> start!31978 (=> (not res!173781) (not e!198381))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31978 (= res!173781 (validMask!0 mask!3777))))

(assert (=> start!31978 e!198381))

(assert (=> start!31978 true))

(declare-datatypes ((array!16285 0))(
  ( (array!16286 (arr!7706 (Array (_ BitVec 32) (_ BitVec 64))) (size!8058 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16285)

(declare-fun array_inv!5669 (array!16285) Bool)

(assert (=> start!31978 (array_inv!5669 a!3305)))

(declare-fun b!319400 () Bool)

(assert (=> b!319400 (= e!198381 false)))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2837 0))(
  ( (MissingZero!2837 (index!13524 (_ BitVec 32))) (Found!2837 (index!13525 (_ BitVec 32))) (Intermediate!2837 (undefined!3649 Bool) (index!13526 (_ BitVec 32)) (x!31807 (_ BitVec 32))) (Undefined!2837) (MissingVacant!2837 (index!13527 (_ BitVec 32))) )
))
(declare-fun lt!155790 () SeekEntryResult!2837)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16285 (_ BitVec 32)) SeekEntryResult!2837)

(assert (=> b!319400 (= lt!155790 (seekEntryOrOpen!0 k!2497 a!3305 mask!3777))))

(declare-fun b!319397 () Bool)

(declare-fun res!173782 () Bool)

(assert (=> b!319397 (=> (not res!173782) (not e!198381))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319397 (= res!173782 (and (= (size!8058 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8058 a!3305))))))

(declare-fun b!319399 () Bool)

(declare-fun res!173784 () Bool)

(assert (=> b!319399 (=> (not res!173784) (not e!198381))))

(declare-fun arrayContainsKey!0 (array!16285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319399 (= res!173784 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319398 () Bool)

(declare-fun res!173783 () Bool)

(assert (=> b!319398 (=> (not res!173783) (not e!198381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319398 (= res!173783 (validKeyInArray!0 k!2497))))

(assert (= (and start!31978 res!173781) b!319397))

(assert (= (and b!319397 res!173782) b!319398))

(assert (= (and b!319398 res!173783) b!319399))

(assert (= (and b!319399 res!173784) b!319400))

(declare-fun m!328007 () Bool)

(assert (=> start!31978 m!328007))

(declare-fun m!328009 () Bool)

(assert (=> start!31978 m!328009))

(declare-fun m!328011 () Bool)

(assert (=> b!319400 m!328011))

(declare-fun m!328013 () Bool)

(assert (=> b!319399 m!328013))

(declare-fun m!328015 () Bool)

(assert (=> b!319398 m!328015))

(push 1)

(assert (not b!319398))

(assert (not b!319400))

(assert (not b!319399))

(assert (not start!31978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

