; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26510 () Bool)

(assert start!26510)

(declare-fun b!275190 () Bool)

(declare-fun res!139184 () Bool)

(declare-fun e!176070 () Bool)

(assert (=> b!275190 (=> (not res!139184) (not e!176070))))

(declare-datatypes ((array!13607 0))(
  ( (array!13608 (arr!6453 (Array (_ BitVec 32) (_ BitVec 64))) (size!6805 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13607)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275190 (= res!139184 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275191 () Bool)

(declare-fun res!139180 () Bool)

(assert (=> b!275191 (=> (not res!139180) (not e!176070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275191 (= res!139180 (validKeyInArray!0 k0!2581))))

(declare-fun res!139181 () Bool)

(assert (=> start!26510 (=> (not res!139181) (not e!176070))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26510 (= res!139181 (validMask!0 mask!3868))))

(assert (=> start!26510 e!176070))

(declare-fun array_inv!4416 (array!13607) Bool)

(assert (=> start!26510 (array_inv!4416 a!3325)))

(assert (=> start!26510 true))

(declare-fun b!275192 () Bool)

(declare-fun res!139185 () Bool)

(assert (=> b!275192 (=> (not res!139185) (not e!176070))))

(declare-datatypes ((List!4261 0))(
  ( (Nil!4258) (Cons!4257 (h!4924 (_ BitVec 64)) (t!9343 List!4261)) )
))
(declare-fun arrayNoDuplicates!0 (array!13607 (_ BitVec 32) List!4261) Bool)

(assert (=> b!275192 (= res!139185 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4258))))

(declare-fun b!275193 () Bool)

(declare-fun e!176072 () Bool)

(assert (=> b!275193 (= e!176072 false)))

(declare-fun lt!137305 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13607 (_ BitVec 32)) Bool)

(assert (=> b!275193 (= lt!137305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275194 () Bool)

(assert (=> b!275194 (= e!176070 e!176072)))

(declare-fun res!139182 () Bool)

(assert (=> b!275194 (=> (not res!139182) (not e!176072))))

(declare-datatypes ((SeekEntryResult!1611 0))(
  ( (MissingZero!1611 (index!8614 (_ BitVec 32))) (Found!1611 (index!8615 (_ BitVec 32))) (Intermediate!1611 (undefined!2423 Bool) (index!8616 (_ BitVec 32)) (x!26896 (_ BitVec 32))) (Undefined!1611) (MissingVacant!1611 (index!8617 (_ BitVec 32))) )
))
(declare-fun lt!137304 () SeekEntryResult!1611)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275194 (= res!139182 (or (= lt!137304 (MissingZero!1611 i!1267)) (= lt!137304 (MissingVacant!1611 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13607 (_ BitVec 32)) SeekEntryResult!1611)

(assert (=> b!275194 (= lt!137304 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275195 () Bool)

(declare-fun res!139183 () Bool)

(assert (=> b!275195 (=> (not res!139183) (not e!176070))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275195 (= res!139183 (and (= (size!6805 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6805 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6805 a!3325))))))

(assert (= (and start!26510 res!139181) b!275195))

(assert (= (and b!275195 res!139183) b!275191))

(assert (= (and b!275191 res!139180) b!275192))

(assert (= (and b!275192 res!139185) b!275190))

(assert (= (and b!275190 res!139184) b!275194))

(assert (= (and b!275194 res!139182) b!275193))

(declare-fun m!290813 () Bool)

(assert (=> b!275194 m!290813))

(declare-fun m!290815 () Bool)

(assert (=> start!26510 m!290815))

(declare-fun m!290817 () Bool)

(assert (=> start!26510 m!290817))

(declare-fun m!290819 () Bool)

(assert (=> b!275192 m!290819))

(declare-fun m!290821 () Bool)

(assert (=> b!275191 m!290821))

(declare-fun m!290823 () Bool)

(assert (=> b!275190 m!290823))

(declare-fun m!290825 () Bool)

(assert (=> b!275193 m!290825))

(check-sat (not start!26510) (not b!275190) (not b!275194) (not b!275193) (not b!275192) (not b!275191))
(check-sat)
