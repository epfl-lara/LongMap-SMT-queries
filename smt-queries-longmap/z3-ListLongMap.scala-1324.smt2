; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26504 () Bool)

(assert start!26504)

(declare-fun b!274971 () Bool)

(declare-fun res!139015 () Bool)

(declare-fun e!175933 () Bool)

(assert (=> b!274971 (=> (not res!139015) (not e!175933))))

(declare-datatypes ((array!13590 0))(
  ( (array!13591 (arr!6444 (Array (_ BitVec 32) (_ BitVec 64))) (size!6797 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13590)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274971 (= res!139015 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!139014 () Bool)

(assert (=> start!26504 (=> (not res!139014) (not e!175933))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26504 (= res!139014 (validMask!0 mask!3868))))

(assert (=> start!26504 e!175933))

(declare-fun array_inv!4416 (array!13590) Bool)

(assert (=> start!26504 (array_inv!4416 a!3325)))

(assert (=> start!26504 true))

(declare-fun b!274972 () Bool)

(declare-fun res!139018 () Bool)

(assert (=> b!274972 (=> (not res!139018) (not e!175933))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274972 (= res!139018 (and (= (size!6797 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6797 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6797 a!3325))))))

(declare-fun b!274973 () Bool)

(declare-fun res!139017 () Bool)

(assert (=> b!274973 (=> (not res!139017) (not e!175933))))

(declare-datatypes ((List!4225 0))(
  ( (Nil!4222) (Cons!4221 (h!4888 (_ BitVec 64)) (t!9298 List!4225)) )
))
(declare-fun arrayNoDuplicates!0 (array!13590 (_ BitVec 32) List!4225) Bool)

(assert (=> b!274973 (= res!139017 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4222))))

(declare-fun b!274974 () Bool)

(declare-fun res!139013 () Bool)

(assert (=> b!274974 (=> (not res!139013) (not e!175933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274974 (= res!139013 (validKeyInArray!0 k0!2581))))

(declare-fun b!274975 () Bool)

(declare-fun e!175934 () Bool)

(assert (=> b!274975 (= e!175934 false)))

(declare-fun lt!137099 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13590 (_ BitVec 32)) Bool)

(assert (=> b!274975 (= lt!137099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274976 () Bool)

(assert (=> b!274976 (= e!175933 e!175934)))

(declare-fun res!139016 () Bool)

(assert (=> b!274976 (=> (not res!139016) (not e!175934))))

(declare-datatypes ((SeekEntryResult!1601 0))(
  ( (MissingZero!1601 (index!8574 (_ BitVec 32))) (Found!1601 (index!8575 (_ BitVec 32))) (Intermediate!1601 (undefined!2413 Bool) (index!8576 (_ BitVec 32)) (x!26877 (_ BitVec 32))) (Undefined!1601) (MissingVacant!1601 (index!8577 (_ BitVec 32))) )
))
(declare-fun lt!137100 () SeekEntryResult!1601)

(assert (=> b!274976 (= res!139016 (or (= lt!137100 (MissingZero!1601 i!1267)) (= lt!137100 (MissingVacant!1601 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13590 (_ BitVec 32)) SeekEntryResult!1601)

(assert (=> b!274976 (= lt!137100 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26504 res!139014) b!274972))

(assert (= (and b!274972 res!139018) b!274974))

(assert (= (and b!274974 res!139013) b!274973))

(assert (= (and b!274973 res!139017) b!274971))

(assert (= (and b!274971 res!139015) b!274976))

(assert (= (and b!274976 res!139016) b!274975))

(declare-fun m!290165 () Bool)

(assert (=> b!274971 m!290165))

(declare-fun m!290167 () Bool)

(assert (=> b!274975 m!290167))

(declare-fun m!290169 () Bool)

(assert (=> b!274974 m!290169))

(declare-fun m!290171 () Bool)

(assert (=> start!26504 m!290171))

(declare-fun m!290173 () Bool)

(assert (=> start!26504 m!290173))

(declare-fun m!290175 () Bool)

(assert (=> b!274976 m!290175))

(declare-fun m!290177 () Bool)

(assert (=> b!274973 m!290177))

(check-sat (not b!274975) (not start!26504) (not b!274974) (not b!274973) (not b!274971) (not b!274976))
(check-sat)
