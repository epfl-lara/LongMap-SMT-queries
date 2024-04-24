; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26490 () Bool)

(assert start!26490)

(declare-fun res!139026 () Bool)

(declare-fun e!176004 () Bool)

(assert (=> start!26490 (=> (not res!139026) (not e!176004))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26490 (= res!139026 (validMask!0 mask!3868))))

(assert (=> start!26490 e!176004))

(declare-datatypes ((array!13586 0))(
  ( (array!13587 (arr!6442 (Array (_ BitVec 32) (_ BitVec 64))) (size!6794 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13586)

(declare-fun array_inv!4392 (array!13586) Bool)

(assert (=> start!26490 (array_inv!4392 a!3325)))

(assert (=> start!26490 true))

(declare-fun b!275057 () Bool)

(declare-fun res!139022 () Bool)

(assert (=> b!275057 (=> (not res!139022) (not e!176004))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275057 (= res!139022 (and (= (size!6794 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6794 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6794 a!3325))))))

(declare-fun b!275058 () Bool)

(declare-fun res!139024 () Bool)

(assert (=> b!275058 (=> (not res!139024) (not e!176004))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275058 (= res!139024 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275059 () Bool)

(declare-fun res!139021 () Bool)

(assert (=> b!275059 (=> (not res!139021) (not e!176004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275059 (= res!139021 (validKeyInArray!0 k0!2581))))

(declare-fun b!275060 () Bool)

(declare-fun res!139023 () Bool)

(assert (=> b!275060 (=> (not res!139023) (not e!176004))))

(declare-datatypes ((List!4163 0))(
  ( (Nil!4160) (Cons!4159 (h!4826 (_ BitVec 64)) (t!9237 List!4163)) )
))
(declare-fun arrayNoDuplicates!0 (array!13586 (_ BitVec 32) List!4163) Bool)

(assert (=> b!275060 (= res!139023 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4160))))

(declare-fun b!275061 () Bool)

(declare-fun e!176005 () Bool)

(assert (=> b!275061 (= e!176004 e!176005)))

(declare-fun res!139025 () Bool)

(assert (=> b!275061 (=> (not res!139025) (not e!176005))))

(declare-datatypes ((SeekEntryResult!1565 0))(
  ( (MissingZero!1565 (index!8430 (_ BitVec 32))) (Found!1565 (index!8431 (_ BitVec 32))) (Intermediate!1565 (undefined!2377 Bool) (index!8432 (_ BitVec 32)) (x!26826 (_ BitVec 32))) (Undefined!1565) (MissingVacant!1565 (index!8433 (_ BitVec 32))) )
))
(declare-fun lt!137304 () SeekEntryResult!1565)

(assert (=> b!275061 (= res!139025 (or (= lt!137304 (MissingZero!1565 i!1267)) (= lt!137304 (MissingVacant!1565 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13586 (_ BitVec 32)) SeekEntryResult!1565)

(assert (=> b!275061 (= lt!137304 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275062 () Bool)

(assert (=> b!275062 (= e!176005 false)))

(declare-fun lt!137303 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13586 (_ BitVec 32)) Bool)

(assert (=> b!275062 (= lt!137303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26490 res!139026) b!275057))

(assert (= (and b!275057 res!139022) b!275059))

(assert (= (and b!275059 res!139021) b!275060))

(assert (= (and b!275060 res!139023) b!275058))

(assert (= (and b!275058 res!139024) b!275061))

(assert (= (and b!275061 res!139025) b!275062))

(declare-fun m!290879 () Bool)

(assert (=> b!275062 m!290879))

(declare-fun m!290881 () Bool)

(assert (=> b!275058 m!290881))

(declare-fun m!290883 () Bool)

(assert (=> b!275060 m!290883))

(declare-fun m!290885 () Bool)

(assert (=> b!275061 m!290885))

(declare-fun m!290887 () Bool)

(assert (=> start!26490 m!290887))

(declare-fun m!290889 () Bool)

(assert (=> start!26490 m!290889))

(declare-fun m!290891 () Bool)

(assert (=> b!275059 m!290891))

(check-sat (not b!275058) (not b!275060) (not start!26490) (not b!275061) (not b!275062) (not b!275059))
(check-sat)
