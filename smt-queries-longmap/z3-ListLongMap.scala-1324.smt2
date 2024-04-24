; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26502 () Bool)

(assert start!26502)

(declare-fun b!275165 () Bool)

(declare-fun res!139130 () Bool)

(declare-fun e!176060 () Bool)

(assert (=> b!275165 (=> (not res!139130) (not e!176060))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275165 (= res!139130 (validKeyInArray!0 k0!2581))))

(declare-fun b!275166 () Bool)

(declare-fun e!176058 () Bool)

(assert (=> b!275166 (= e!176058 false)))

(declare-fun lt!137340 () Bool)

(declare-datatypes ((array!13598 0))(
  ( (array!13599 (arr!6448 (Array (_ BitVec 32) (_ BitVec 64))) (size!6800 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13598)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13598 (_ BitVec 32)) Bool)

(assert (=> b!275166 (= lt!137340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275167 () Bool)

(declare-fun res!139129 () Bool)

(assert (=> b!275167 (=> (not res!139129) (not e!176060))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275167 (= res!139129 (and (= (size!6800 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6800 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6800 a!3325))))))

(declare-fun b!275168 () Bool)

(declare-fun res!139131 () Bool)

(assert (=> b!275168 (=> (not res!139131) (not e!176060))))

(declare-datatypes ((List!4169 0))(
  ( (Nil!4166) (Cons!4165 (h!4832 (_ BitVec 64)) (t!9243 List!4169)) )
))
(declare-fun arrayNoDuplicates!0 (array!13598 (_ BitVec 32) List!4169) Bool)

(assert (=> b!275168 (= res!139131 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4166))))

(declare-fun res!139134 () Bool)

(assert (=> start!26502 (=> (not res!139134) (not e!176060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26502 (= res!139134 (validMask!0 mask!3868))))

(assert (=> start!26502 e!176060))

(declare-fun array_inv!4398 (array!13598) Bool)

(assert (=> start!26502 (array_inv!4398 a!3325)))

(assert (=> start!26502 true))

(declare-fun b!275169 () Bool)

(assert (=> b!275169 (= e!176060 e!176058)))

(declare-fun res!139133 () Bool)

(assert (=> b!275169 (=> (not res!139133) (not e!176058))))

(declare-datatypes ((SeekEntryResult!1571 0))(
  ( (MissingZero!1571 (index!8454 (_ BitVec 32))) (Found!1571 (index!8455 (_ BitVec 32))) (Intermediate!1571 (undefined!2383 Bool) (index!8456 (_ BitVec 32)) (x!26848 (_ BitVec 32))) (Undefined!1571) (MissingVacant!1571 (index!8457 (_ BitVec 32))) )
))
(declare-fun lt!137339 () SeekEntryResult!1571)

(assert (=> b!275169 (= res!139133 (or (= lt!137339 (MissingZero!1571 i!1267)) (= lt!137339 (MissingVacant!1571 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13598 (_ BitVec 32)) SeekEntryResult!1571)

(assert (=> b!275169 (= lt!137339 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275170 () Bool)

(declare-fun res!139132 () Bool)

(assert (=> b!275170 (=> (not res!139132) (not e!176060))))

(declare-fun arrayContainsKey!0 (array!13598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275170 (= res!139132 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26502 res!139134) b!275167))

(assert (= (and b!275167 res!139129) b!275165))

(assert (= (and b!275165 res!139130) b!275168))

(assert (= (and b!275168 res!139131) b!275170))

(assert (= (and b!275170 res!139132) b!275169))

(assert (= (and b!275169 res!139133) b!275166))

(declare-fun m!290963 () Bool)

(assert (=> b!275168 m!290963))

(declare-fun m!290965 () Bool)

(assert (=> b!275170 m!290965))

(declare-fun m!290967 () Bool)

(assert (=> b!275166 m!290967))

(declare-fun m!290969 () Bool)

(assert (=> b!275169 m!290969))

(declare-fun m!290971 () Bool)

(assert (=> b!275165 m!290971))

(declare-fun m!290973 () Bool)

(assert (=> start!26502 m!290973))

(declare-fun m!290975 () Bool)

(assert (=> start!26502 m!290975))

(check-sat (not b!275168) (not b!275169) (not b!275166) (not b!275170) (not start!26502) (not b!275165))
(check-sat)
