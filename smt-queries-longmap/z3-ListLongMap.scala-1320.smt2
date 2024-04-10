; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26480 () Bool)

(assert start!26480)

(declare-fun b!274920 () Bool)

(declare-fun res!138914 () Bool)

(declare-fun e!175936 () Bool)

(assert (=> b!274920 (=> (not res!138914) (not e!175936))))

(declare-datatypes ((array!13577 0))(
  ( (array!13578 (arr!6438 (Array (_ BitVec 32) (_ BitVec 64))) (size!6790 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13577)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!274920 (= res!138914 (and (= (size!6790 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6790 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6790 a!3325))))))

(declare-fun b!274921 () Bool)

(declare-fun e!175935 () Bool)

(assert (=> b!274921 (= e!175935 false)))

(declare-fun lt!137215 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13577 (_ BitVec 32)) Bool)

(assert (=> b!274921 (= lt!137215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274922 () Bool)

(declare-fun res!138913 () Bool)

(assert (=> b!274922 (=> (not res!138913) (not e!175936))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274922 (= res!138913 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274923 () Bool)

(assert (=> b!274923 (= e!175936 e!175935)))

(declare-fun res!138911 () Bool)

(assert (=> b!274923 (=> (not res!138911) (not e!175935))))

(declare-datatypes ((SeekEntryResult!1596 0))(
  ( (MissingZero!1596 (index!8554 (_ BitVec 32))) (Found!1596 (index!8555 (_ BitVec 32))) (Intermediate!1596 (undefined!2408 Bool) (index!8556 (_ BitVec 32)) (x!26841 (_ BitVec 32))) (Undefined!1596) (MissingVacant!1596 (index!8557 (_ BitVec 32))) )
))
(declare-fun lt!137214 () SeekEntryResult!1596)

(assert (=> b!274923 (= res!138911 (or (= lt!137214 (MissingZero!1596 i!1267)) (= lt!137214 (MissingVacant!1596 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13577 (_ BitVec 32)) SeekEntryResult!1596)

(assert (=> b!274923 (= lt!137214 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!138910 () Bool)

(assert (=> start!26480 (=> (not res!138910) (not e!175936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26480 (= res!138910 (validMask!0 mask!3868))))

(assert (=> start!26480 e!175936))

(declare-fun array_inv!4401 (array!13577) Bool)

(assert (=> start!26480 (array_inv!4401 a!3325)))

(assert (=> start!26480 true))

(declare-fun b!274924 () Bool)

(declare-fun res!138915 () Bool)

(assert (=> b!274924 (=> (not res!138915) (not e!175936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274924 (= res!138915 (validKeyInArray!0 k0!2581))))

(declare-fun b!274925 () Bool)

(declare-fun res!138912 () Bool)

(assert (=> b!274925 (=> (not res!138912) (not e!175936))))

(declare-datatypes ((List!4246 0))(
  ( (Nil!4243) (Cons!4242 (h!4909 (_ BitVec 64)) (t!9328 List!4246)) )
))
(declare-fun arrayNoDuplicates!0 (array!13577 (_ BitVec 32) List!4246) Bool)

(assert (=> b!274925 (= res!138912 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4243))))

(assert (= (and start!26480 res!138910) b!274920))

(assert (= (and b!274920 res!138914) b!274924))

(assert (= (and b!274924 res!138915) b!274925))

(assert (= (and b!274925 res!138912) b!274922))

(assert (= (and b!274922 res!138913) b!274923))

(assert (= (and b!274923 res!138911) b!274921))

(declare-fun m!290603 () Bool)

(assert (=> b!274922 m!290603))

(declare-fun m!290605 () Bool)

(assert (=> b!274925 m!290605))

(declare-fun m!290607 () Bool)

(assert (=> start!26480 m!290607))

(declare-fun m!290609 () Bool)

(assert (=> start!26480 m!290609))

(declare-fun m!290611 () Bool)

(assert (=> b!274923 m!290611))

(declare-fun m!290613 () Bool)

(assert (=> b!274924 m!290613))

(declare-fun m!290615 () Bool)

(assert (=> b!274921 m!290615))

(check-sat (not b!274922) (not b!274923) (not b!274921) (not start!26480) (not b!274925) (not b!274924))
(check-sat)
