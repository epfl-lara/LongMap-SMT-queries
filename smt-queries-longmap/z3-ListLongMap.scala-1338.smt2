; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26588 () Bool)

(assert start!26588)

(declare-fun res!139918 () Bool)

(declare-fun e!176313 () Bool)

(assert (=> start!26588 (=> (not res!139918) (not e!176313))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26588 (= res!139918 (validMask!0 mask!3868))))

(assert (=> start!26588 e!176313))

(declare-datatypes ((array!13674 0))(
  ( (array!13675 (arr!6486 (Array (_ BitVec 32) (_ BitVec 64))) (size!6839 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13674)

(declare-fun array_inv!4458 (array!13674) Bool)

(assert (=> start!26588 (array_inv!4458 a!3325)))

(assert (=> start!26588 true))

(declare-fun b!275871 () Bool)

(declare-fun e!176312 () Bool)

(assert (=> b!275871 (= e!176312 false)))

(declare-fun lt!137352 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13674 (_ BitVec 32)) Bool)

(assert (=> b!275871 (= lt!137352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275872 () Bool)

(declare-fun res!139917 () Bool)

(assert (=> b!275872 (=> (not res!139917) (not e!176313))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275872 (= res!139917 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275873 () Bool)

(assert (=> b!275873 (= e!176313 e!176312)))

(declare-fun res!139915 () Bool)

(assert (=> b!275873 (=> (not res!139915) (not e!176312))))

(declare-datatypes ((SeekEntryResult!1643 0))(
  ( (MissingZero!1643 (index!8742 (_ BitVec 32))) (Found!1643 (index!8743 (_ BitVec 32))) (Intermediate!1643 (undefined!2455 Bool) (index!8744 (_ BitVec 32)) (x!27031 (_ BitVec 32))) (Undefined!1643) (MissingVacant!1643 (index!8745 (_ BitVec 32))) )
))
(declare-fun lt!137351 () SeekEntryResult!1643)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275873 (= res!139915 (or (= lt!137351 (MissingZero!1643 i!1267)) (= lt!137351 (MissingVacant!1643 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13674 (_ BitVec 32)) SeekEntryResult!1643)

(assert (=> b!275873 (= lt!137351 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275874 () Bool)

(declare-fun res!139913 () Bool)

(assert (=> b!275874 (=> (not res!139913) (not e!176313))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275874 (= res!139913 (and (= (size!6839 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6839 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6839 a!3325))))))

(declare-fun b!275875 () Bool)

(declare-fun res!139916 () Bool)

(assert (=> b!275875 (=> (not res!139916) (not e!176313))))

(declare-datatypes ((List!4267 0))(
  ( (Nil!4264) (Cons!4263 (h!4930 (_ BitVec 64)) (t!9340 List!4267)) )
))
(declare-fun arrayNoDuplicates!0 (array!13674 (_ BitVec 32) List!4267) Bool)

(assert (=> b!275875 (= res!139916 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4264))))

(declare-fun b!275876 () Bool)

(declare-fun res!139914 () Bool)

(assert (=> b!275876 (=> (not res!139914) (not e!176313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275876 (= res!139914 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26588 res!139918) b!275874))

(assert (= (and b!275874 res!139913) b!275876))

(assert (= (and b!275876 res!139914) b!275875))

(assert (= (and b!275875 res!139916) b!275872))

(assert (= (and b!275872 res!139917) b!275873))

(assert (= (and b!275873 res!139915) b!275871))

(declare-fun m!290873 () Bool)

(assert (=> b!275873 m!290873))

(declare-fun m!290875 () Bool)

(assert (=> b!275876 m!290875))

(declare-fun m!290877 () Bool)

(assert (=> b!275871 m!290877))

(declare-fun m!290879 () Bool)

(assert (=> b!275872 m!290879))

(declare-fun m!290881 () Bool)

(assert (=> start!26588 m!290881))

(declare-fun m!290883 () Bool)

(assert (=> start!26588 m!290883))

(declare-fun m!290885 () Bool)

(assert (=> b!275875 m!290885))

(check-sat (not b!275873) (not start!26588) (not b!275871) (not b!275872) (not b!275875) (not b!275876))
(check-sat)
