; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29992 () Bool)

(assert start!29992)

(declare-fun res!158899 () Bool)

(declare-fun e!190077 () Bool)

(assert (=> start!29992 (=> (not res!158899) (not e!190077))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29992 (= res!158899 (validMask!0 mask!3709))))

(assert (=> start!29992 e!190077))

(assert (=> start!29992 true))

(declare-datatypes ((array!15228 0))(
  ( (array!15229 (arr!7206 (Array (_ BitVec 32) (_ BitVec 64))) (size!7558 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15228)

(declare-fun array_inv!5156 (array!15228) Bool)

(assert (=> start!29992 (array_inv!5156 a!3293)))

(declare-fun b!301099 () Bool)

(declare-fun res!158898 () Bool)

(assert (=> b!301099 (=> (not res!158898) (not e!190077))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301099 (= res!158898 (validKeyInArray!0 k!2441))))

(declare-fun b!301100 () Bool)

(declare-fun res!158901 () Bool)

(assert (=> b!301100 (=> (not res!158901) (not e!190077))))

(declare-fun arrayContainsKey!0 (array!15228 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301100 (= res!158901 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301098 () Bool)

(declare-fun res!158900 () Bool)

(assert (=> b!301098 (=> (not res!158900) (not e!190077))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301098 (= res!158900 (and (= (size!7558 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7558 a!3293))))))

(declare-fun b!301101 () Bool)

(assert (=> b!301101 (= e!190077 false)))

(declare-datatypes ((SeekEntryResult!2311 0))(
  ( (MissingZero!2311 (index!11420 (_ BitVec 32))) (Found!2311 (index!11421 (_ BitVec 32))) (Intermediate!2311 (undefined!3123 Bool) (index!11422 (_ BitVec 32)) (x!29804 (_ BitVec 32))) (Undefined!2311) (MissingVacant!2311 (index!11423 (_ BitVec 32))) )
))
(declare-fun lt!149799 () SeekEntryResult!2311)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15228 (_ BitVec 32)) SeekEntryResult!2311)

(assert (=> b!301101 (= lt!149799 (seekEntryOrOpen!0 k!2441 a!3293 mask!3709))))

(assert (= (and start!29992 res!158899) b!301098))

(assert (= (and b!301098 res!158900) b!301099))

(assert (= (and b!301099 res!158898) b!301100))

(assert (= (and b!301100 res!158901) b!301101))

(declare-fun m!313121 () Bool)

(assert (=> start!29992 m!313121))

(declare-fun m!313123 () Bool)

(assert (=> start!29992 m!313123))

(declare-fun m!313125 () Bool)

(assert (=> b!301099 m!313125))

(declare-fun m!313127 () Bool)

(assert (=> b!301100 m!313127))

(declare-fun m!313129 () Bool)

(assert (=> b!301101 m!313129))

(push 1)

(assert (not b!301101))

(assert (not b!301099))

(assert (not b!301100))

(assert (not start!29992))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

