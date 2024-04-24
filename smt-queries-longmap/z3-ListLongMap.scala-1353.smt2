; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26676 () Bool)

(assert start!26676)

(declare-fun b!276920 () Bool)

(declare-fun res!140888 () Bool)

(declare-fun e!176843 () Bool)

(assert (=> b!276920 (=> (not res!140888) (not e!176843))))

(declare-datatypes ((array!13772 0))(
  ( (array!13773 (arr!6535 (Array (_ BitVec 32) (_ BitVec 64))) (size!6887 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13772)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276920 (= res!140888 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276921 () Bool)

(declare-fun e!176842 () Bool)

(assert (=> b!276921 (= e!176843 e!176842)))

(declare-fun res!140889 () Bool)

(assert (=> b!276921 (=> (not res!140889) (not e!176842))))

(declare-datatypes ((SeekEntryResult!1658 0))(
  ( (MissingZero!1658 (index!8802 (_ BitVec 32))) (Found!1658 (index!8803 (_ BitVec 32))) (Intermediate!1658 (undefined!2470 Bool) (index!8804 (_ BitVec 32)) (x!27167 (_ BitVec 32))) (Undefined!1658) (MissingVacant!1658 (index!8805 (_ BitVec 32))) )
))
(declare-fun lt!137834 () SeekEntryResult!1658)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276921 (= res!140889 (or (= lt!137834 (MissingZero!1658 i!1267)) (= lt!137834 (MissingVacant!1658 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13772 (_ BitVec 32)) SeekEntryResult!1658)

(assert (=> b!276921 (= lt!137834 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276922 () Bool)

(declare-fun res!140884 () Bool)

(assert (=> b!276922 (=> (not res!140884) (not e!176843))))

(declare-datatypes ((List!4256 0))(
  ( (Nil!4253) (Cons!4252 (h!4919 (_ BitVec 64)) (t!9330 List!4256)) )
))
(declare-fun arrayNoDuplicates!0 (array!13772 (_ BitVec 32) List!4256) Bool)

(assert (=> b!276922 (= res!140884 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4253))))

(declare-fun b!276923 () Bool)

(declare-fun res!140887 () Bool)

(assert (=> b!276923 (=> (not res!140887) (not e!176843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276923 (= res!140887 (validKeyInArray!0 k0!2581))))

(declare-fun res!140885 () Bool)

(assert (=> start!26676 (=> (not res!140885) (not e!176843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26676 (= res!140885 (validMask!0 mask!3868))))

(assert (=> start!26676 e!176843))

(declare-fun array_inv!4485 (array!13772) Bool)

(assert (=> start!26676 (array_inv!4485 a!3325)))

(assert (=> start!26676 true))

(declare-fun b!276924 () Bool)

(declare-fun res!140886 () Bool)

(assert (=> b!276924 (=> (not res!140886) (not e!176843))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276924 (= res!140886 (and (= (size!6887 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6887 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6887 a!3325))))))

(declare-fun b!276925 () Bool)

(assert (=> b!276925 (= e!176842 false)))

(declare-fun lt!137835 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13772 (_ BitVec 32)) Bool)

(assert (=> b!276925 (= lt!137835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26676 res!140885) b!276924))

(assert (= (and b!276924 res!140886) b!276923))

(assert (= (and b!276923 res!140887) b!276922))

(assert (= (and b!276922 res!140884) b!276920))

(assert (= (and b!276920 res!140888) b!276921))

(assert (= (and b!276921 res!140889) b!276925))

(declare-fun m!292313 () Bool)

(assert (=> b!276921 m!292313))

(declare-fun m!292315 () Bool)

(assert (=> b!276920 m!292315))

(declare-fun m!292317 () Bool)

(assert (=> b!276922 m!292317))

(declare-fun m!292319 () Bool)

(assert (=> b!276925 m!292319))

(declare-fun m!292321 () Bool)

(assert (=> b!276923 m!292321))

(declare-fun m!292323 () Bool)

(assert (=> start!26676 m!292323))

(declare-fun m!292325 () Bool)

(assert (=> start!26676 m!292325))

(check-sat (not start!26676) (not b!276922) (not b!276925) (not b!276921) (not b!276920) (not b!276923))
(check-sat)
