; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26504 () Bool)

(assert start!26504)

(declare-fun res!139127 () Bool)

(declare-fun e!176045 () Bool)

(assert (=> start!26504 (=> (not res!139127) (not e!176045))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26504 (= res!139127 (validMask!0 mask!3868))))

(assert (=> start!26504 e!176045))

(declare-datatypes ((array!13601 0))(
  ( (array!13602 (arr!6450 (Array (_ BitVec 32) (_ BitVec 64))) (size!6802 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13601)

(declare-fun array_inv!4413 (array!13601) Bool)

(assert (=> start!26504 (array_inv!4413 a!3325)))

(assert (=> start!26504 true))

(declare-fun b!275136 () Bool)

(declare-fun res!139126 () Bool)

(assert (=> b!275136 (=> (not res!139126) (not e!176045))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275136 (= res!139126 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275137 () Bool)

(declare-fun e!176043 () Bool)

(assert (=> b!275137 (= e!176043 false)))

(declare-fun lt!137286 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13601 (_ BitVec 32)) Bool)

(assert (=> b!275137 (= lt!137286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275138 () Bool)

(declare-fun res!139130 () Bool)

(assert (=> b!275138 (=> (not res!139130) (not e!176045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275138 (= res!139130 (validKeyInArray!0 k0!2581))))

(declare-fun b!275139 () Bool)

(declare-fun res!139129 () Bool)

(assert (=> b!275139 (=> (not res!139129) (not e!176045))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275139 (= res!139129 (and (= (size!6802 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6802 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6802 a!3325))))))

(declare-fun b!275140 () Bool)

(declare-fun res!139128 () Bool)

(assert (=> b!275140 (=> (not res!139128) (not e!176045))))

(declare-datatypes ((List!4258 0))(
  ( (Nil!4255) (Cons!4254 (h!4921 (_ BitVec 64)) (t!9340 List!4258)) )
))
(declare-fun arrayNoDuplicates!0 (array!13601 (_ BitVec 32) List!4258) Bool)

(assert (=> b!275140 (= res!139128 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4255))))

(declare-fun b!275141 () Bool)

(assert (=> b!275141 (= e!176045 e!176043)))

(declare-fun res!139131 () Bool)

(assert (=> b!275141 (=> (not res!139131) (not e!176043))))

(declare-datatypes ((SeekEntryResult!1608 0))(
  ( (MissingZero!1608 (index!8602 (_ BitVec 32))) (Found!1608 (index!8603 (_ BitVec 32))) (Intermediate!1608 (undefined!2420 Bool) (index!8604 (_ BitVec 32)) (x!26885 (_ BitVec 32))) (Undefined!1608) (MissingVacant!1608 (index!8605 (_ BitVec 32))) )
))
(declare-fun lt!137287 () SeekEntryResult!1608)

(assert (=> b!275141 (= res!139131 (or (= lt!137287 (MissingZero!1608 i!1267)) (= lt!137287 (MissingVacant!1608 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13601 (_ BitVec 32)) SeekEntryResult!1608)

(assert (=> b!275141 (= lt!137287 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26504 res!139127) b!275139))

(assert (= (and b!275139 res!139129) b!275138))

(assert (= (and b!275138 res!139130) b!275140))

(assert (= (and b!275140 res!139128) b!275136))

(assert (= (and b!275136 res!139126) b!275141))

(assert (= (and b!275141 res!139131) b!275137))

(declare-fun m!290771 () Bool)

(assert (=> b!275140 m!290771))

(declare-fun m!290773 () Bool)

(assert (=> b!275136 m!290773))

(declare-fun m!290775 () Bool)

(assert (=> b!275138 m!290775))

(declare-fun m!290777 () Bool)

(assert (=> b!275141 m!290777))

(declare-fun m!290779 () Bool)

(assert (=> start!26504 m!290779))

(declare-fun m!290781 () Bool)

(assert (=> start!26504 m!290781))

(declare-fun m!290783 () Bool)

(assert (=> b!275137 m!290783))

(check-sat (not b!275137) (not b!275140) (not b!275136) (not start!26504) (not b!275141) (not b!275138))
(check-sat)
