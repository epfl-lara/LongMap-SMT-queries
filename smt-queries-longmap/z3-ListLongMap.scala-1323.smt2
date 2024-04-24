; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26496 () Bool)

(assert start!26496)

(declare-fun b!275111 () Bool)

(declare-fun res!139076 () Bool)

(declare-fun e!176033 () Bool)

(assert (=> b!275111 (=> (not res!139076) (not e!176033))))

(declare-datatypes ((array!13592 0))(
  ( (array!13593 (arr!6445 (Array (_ BitVec 32) (_ BitVec 64))) (size!6797 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13592)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!275111 (= res!139076 (and (= (size!6797 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6797 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6797 a!3325))))))

(declare-fun b!275112 () Bool)

(declare-fun e!176032 () Bool)

(assert (=> b!275112 (= e!176032 false)))

(declare-fun lt!137321 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13592 (_ BitVec 32)) Bool)

(assert (=> b!275112 (= lt!137321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275113 () Bool)

(declare-fun res!139075 () Bool)

(assert (=> b!275113 (=> (not res!139075) (not e!176033))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275113 (= res!139075 (validKeyInArray!0 k0!2581))))

(declare-fun res!139080 () Bool)

(assert (=> start!26496 (=> (not res!139080) (not e!176033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26496 (= res!139080 (validMask!0 mask!3868))))

(assert (=> start!26496 e!176033))

(declare-fun array_inv!4395 (array!13592) Bool)

(assert (=> start!26496 (array_inv!4395 a!3325)))

(assert (=> start!26496 true))

(declare-fun b!275114 () Bool)

(declare-fun res!139079 () Bool)

(assert (=> b!275114 (=> (not res!139079) (not e!176033))))

(declare-datatypes ((List!4166 0))(
  ( (Nil!4163) (Cons!4162 (h!4829 (_ BitVec 64)) (t!9240 List!4166)) )
))
(declare-fun arrayNoDuplicates!0 (array!13592 (_ BitVec 32) List!4166) Bool)

(assert (=> b!275114 (= res!139079 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4163))))

(declare-fun b!275115 () Bool)

(declare-fun res!139078 () Bool)

(assert (=> b!275115 (=> (not res!139078) (not e!176033))))

(declare-fun arrayContainsKey!0 (array!13592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275115 (= res!139078 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275116 () Bool)

(assert (=> b!275116 (= e!176033 e!176032)))

(declare-fun res!139077 () Bool)

(assert (=> b!275116 (=> (not res!139077) (not e!176032))))

(declare-datatypes ((SeekEntryResult!1568 0))(
  ( (MissingZero!1568 (index!8442 (_ BitVec 32))) (Found!1568 (index!8443 (_ BitVec 32))) (Intermediate!1568 (undefined!2380 Bool) (index!8444 (_ BitVec 32)) (x!26837 (_ BitVec 32))) (Undefined!1568) (MissingVacant!1568 (index!8445 (_ BitVec 32))) )
))
(declare-fun lt!137322 () SeekEntryResult!1568)

(assert (=> b!275116 (= res!139077 (or (= lt!137322 (MissingZero!1568 i!1267)) (= lt!137322 (MissingVacant!1568 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13592 (_ BitVec 32)) SeekEntryResult!1568)

(assert (=> b!275116 (= lt!137322 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26496 res!139080) b!275111))

(assert (= (and b!275111 res!139076) b!275113))

(assert (= (and b!275113 res!139075) b!275114))

(assert (= (and b!275114 res!139079) b!275115))

(assert (= (and b!275115 res!139078) b!275116))

(assert (= (and b!275116 res!139077) b!275112))

(declare-fun m!290921 () Bool)

(assert (=> b!275114 m!290921))

(declare-fun m!290923 () Bool)

(assert (=> b!275115 m!290923))

(declare-fun m!290925 () Bool)

(assert (=> b!275116 m!290925))

(declare-fun m!290927 () Bool)

(assert (=> start!26496 m!290927))

(declare-fun m!290929 () Bool)

(assert (=> start!26496 m!290929))

(declare-fun m!290931 () Bool)

(assert (=> b!275112 m!290931))

(declare-fun m!290933 () Bool)

(assert (=> b!275113 m!290933))

(check-sat (not b!275112) (not b!275115) (not start!26496) (not b!275114) (not b!275116) (not b!275113))
(check-sat)
