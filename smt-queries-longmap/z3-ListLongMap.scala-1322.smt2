; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26492 () Bool)

(assert start!26492)

(declare-fun res!138906 () Bool)

(declare-fun e!175879 () Bool)

(assert (=> start!26492 (=> (not res!138906) (not e!175879))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26492 (= res!138906 (validMask!0 mask!3868))))

(assert (=> start!26492 e!175879))

(declare-datatypes ((array!13578 0))(
  ( (array!13579 (arr!6438 (Array (_ BitVec 32) (_ BitVec 64))) (size!6791 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13578)

(declare-fun array_inv!4410 (array!13578) Bool)

(assert (=> start!26492 (array_inv!4410 a!3325)))

(assert (=> start!26492 true))

(declare-fun b!274863 () Bool)

(declare-fun res!138908 () Bool)

(assert (=> b!274863 (=> (not res!138908) (not e!175879))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274863 (= res!138908 (and (= (size!6791 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6791 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6791 a!3325))))))

(declare-fun b!274864 () Bool)

(declare-fun res!138909 () Bool)

(assert (=> b!274864 (=> (not res!138909) (not e!175879))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274864 (= res!138909 (validKeyInArray!0 k0!2581))))

(declare-fun b!274865 () Bool)

(declare-fun e!175880 () Bool)

(assert (=> b!274865 (= e!175880 false)))

(declare-fun lt!137063 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13578 (_ BitVec 32)) Bool)

(assert (=> b!274865 (= lt!137063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274866 () Bool)

(assert (=> b!274866 (= e!175879 e!175880)))

(declare-fun res!138910 () Bool)

(assert (=> b!274866 (=> (not res!138910) (not e!175880))))

(declare-datatypes ((SeekEntryResult!1595 0))(
  ( (MissingZero!1595 (index!8550 (_ BitVec 32))) (Found!1595 (index!8551 (_ BitVec 32))) (Intermediate!1595 (undefined!2407 Bool) (index!8552 (_ BitVec 32)) (x!26855 (_ BitVec 32))) (Undefined!1595) (MissingVacant!1595 (index!8553 (_ BitVec 32))) )
))
(declare-fun lt!137064 () SeekEntryResult!1595)

(assert (=> b!274866 (= res!138910 (or (= lt!137064 (MissingZero!1595 i!1267)) (= lt!137064 (MissingVacant!1595 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13578 (_ BitVec 32)) SeekEntryResult!1595)

(assert (=> b!274866 (= lt!137064 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274867 () Bool)

(declare-fun res!138907 () Bool)

(assert (=> b!274867 (=> (not res!138907) (not e!175879))))

(declare-fun arrayContainsKey!0 (array!13578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274867 (= res!138907 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274868 () Bool)

(declare-fun res!138905 () Bool)

(assert (=> b!274868 (=> (not res!138905) (not e!175879))))

(declare-datatypes ((List!4219 0))(
  ( (Nil!4216) (Cons!4215 (h!4882 (_ BitVec 64)) (t!9292 List!4219)) )
))
(declare-fun arrayNoDuplicates!0 (array!13578 (_ BitVec 32) List!4219) Bool)

(assert (=> b!274868 (= res!138905 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4216))))

(assert (= (and start!26492 res!138906) b!274863))

(assert (= (and b!274863 res!138908) b!274864))

(assert (= (and b!274864 res!138909) b!274868))

(assert (= (and b!274868 res!138905) b!274867))

(assert (= (and b!274867 res!138907) b!274866))

(assert (= (and b!274866 res!138910) b!274865))

(declare-fun m!290081 () Bool)

(assert (=> start!26492 m!290081))

(declare-fun m!290083 () Bool)

(assert (=> start!26492 m!290083))

(declare-fun m!290085 () Bool)

(assert (=> b!274866 m!290085))

(declare-fun m!290087 () Bool)

(assert (=> b!274865 m!290087))

(declare-fun m!290089 () Bool)

(assert (=> b!274867 m!290089))

(declare-fun m!290091 () Bool)

(assert (=> b!274864 m!290091))

(declare-fun m!290093 () Bool)

(assert (=> b!274868 m!290093))

(check-sat (not b!274865) (not b!274867) (not b!274866) (not b!274864) (not b!274868) (not start!26492))
(check-sat)
