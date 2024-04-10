; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26498 () Bool)

(assert start!26498)

(declare-fun b!275082 () Bool)

(declare-fun res!139077 () Bool)

(declare-fun e!176016 () Bool)

(assert (=> b!275082 (=> (not res!139077) (not e!176016))))

(declare-datatypes ((array!13595 0))(
  ( (array!13596 (arr!6447 (Array (_ BitVec 32) (_ BitVec 64))) (size!6799 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13595)

(declare-datatypes ((List!4255 0))(
  ( (Nil!4252) (Cons!4251 (h!4918 (_ BitVec 64)) (t!9337 List!4255)) )
))
(declare-fun arrayNoDuplicates!0 (array!13595 (_ BitVec 32) List!4255) Bool)

(assert (=> b!275082 (= res!139077 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4252))))

(declare-fun b!275083 () Bool)

(declare-fun e!176017 () Bool)

(assert (=> b!275083 (= e!176017 false)))

(declare-fun lt!137268 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13595 (_ BitVec 32)) Bool)

(assert (=> b!275083 (= lt!137268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275084 () Bool)

(declare-fun res!139073 () Bool)

(assert (=> b!275084 (=> (not res!139073) (not e!176016))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275084 (= res!139073 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275085 () Bool)

(declare-fun res!139076 () Bool)

(assert (=> b!275085 (=> (not res!139076) (not e!176016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275085 (= res!139076 (validKeyInArray!0 k0!2581))))

(declare-fun res!139074 () Bool)

(assert (=> start!26498 (=> (not res!139074) (not e!176016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26498 (= res!139074 (validMask!0 mask!3868))))

(assert (=> start!26498 e!176016))

(declare-fun array_inv!4410 (array!13595) Bool)

(assert (=> start!26498 (array_inv!4410 a!3325)))

(assert (=> start!26498 true))

(declare-fun b!275086 () Bool)

(declare-fun res!139072 () Bool)

(assert (=> b!275086 (=> (not res!139072) (not e!176016))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275086 (= res!139072 (and (= (size!6799 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6799 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6799 a!3325))))))

(declare-fun b!275087 () Bool)

(assert (=> b!275087 (= e!176016 e!176017)))

(declare-fun res!139075 () Bool)

(assert (=> b!275087 (=> (not res!139075) (not e!176017))))

(declare-datatypes ((SeekEntryResult!1605 0))(
  ( (MissingZero!1605 (index!8590 (_ BitVec 32))) (Found!1605 (index!8591 (_ BitVec 32))) (Intermediate!1605 (undefined!2417 Bool) (index!8592 (_ BitVec 32)) (x!26874 (_ BitVec 32))) (Undefined!1605) (MissingVacant!1605 (index!8593 (_ BitVec 32))) )
))
(declare-fun lt!137269 () SeekEntryResult!1605)

(assert (=> b!275087 (= res!139075 (or (= lt!137269 (MissingZero!1605 i!1267)) (= lt!137269 (MissingVacant!1605 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13595 (_ BitVec 32)) SeekEntryResult!1605)

(assert (=> b!275087 (= lt!137269 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26498 res!139074) b!275086))

(assert (= (and b!275086 res!139072) b!275085))

(assert (= (and b!275085 res!139076) b!275082))

(assert (= (and b!275082 res!139077) b!275084))

(assert (= (and b!275084 res!139073) b!275087))

(assert (= (and b!275087 res!139075) b!275083))

(declare-fun m!290729 () Bool)

(assert (=> b!275082 m!290729))

(declare-fun m!290731 () Bool)

(assert (=> b!275085 m!290731))

(declare-fun m!290733 () Bool)

(assert (=> b!275087 m!290733))

(declare-fun m!290735 () Bool)

(assert (=> start!26498 m!290735))

(declare-fun m!290737 () Bool)

(assert (=> start!26498 m!290737))

(declare-fun m!290739 () Bool)

(assert (=> b!275084 m!290739))

(declare-fun m!290741 () Bool)

(assert (=> b!275083 m!290741))

(check-sat (not b!275087) (not b!275082) (not start!26498) (not b!275084) (not b!275085) (not b!275083))
(check-sat)
