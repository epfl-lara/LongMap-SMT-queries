; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26676 () Bool)

(assert start!26676)

(declare-fun b!276873 () Bool)

(declare-fun res!140868 () Bool)

(declare-fun e!176817 () Bool)

(assert (=> b!276873 (=> (not res!140868) (not e!176817))))

(declare-datatypes ((array!13773 0))(
  ( (array!13774 (arr!6536 (Array (_ BitVec 32) (_ BitVec 64))) (size!6888 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13773)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276873 (= res!140868 (and (= (size!6888 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6888 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6888 a!3325))))))

(declare-fun b!276874 () Bool)

(declare-fun res!140867 () Bool)

(assert (=> b!276874 (=> (not res!140867) (not e!176817))))

(declare-datatypes ((List!4344 0))(
  ( (Nil!4341) (Cons!4340 (h!5007 (_ BitVec 64)) (t!9426 List!4344)) )
))
(declare-fun arrayNoDuplicates!0 (array!13773 (_ BitVec 32) List!4344) Bool)

(assert (=> b!276874 (= res!140867 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4341))))

(declare-fun b!276875 () Bool)

(declare-fun e!176819 () Bool)

(assert (=> b!276875 (= e!176817 e!176819)))

(declare-fun res!140865 () Bool)

(assert (=> b!276875 (=> (not res!140865) (not e!176819))))

(declare-datatypes ((SeekEntryResult!1694 0))(
  ( (MissingZero!1694 (index!8946 (_ BitVec 32))) (Found!1694 (index!8947 (_ BitVec 32))) (Intermediate!1694 (undefined!2506 Bool) (index!8948 (_ BitVec 32)) (x!27203 (_ BitVec 32))) (Undefined!1694) (MissingVacant!1694 (index!8949 (_ BitVec 32))) )
))
(declare-fun lt!137775 () SeekEntryResult!1694)

(assert (=> b!276875 (= res!140865 (or (= lt!137775 (MissingZero!1694 i!1267)) (= lt!137775 (MissingVacant!1694 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13773 (_ BitVec 32)) SeekEntryResult!1694)

(assert (=> b!276875 (= lt!137775 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276876 () Bool)

(declare-fun res!140864 () Bool)

(assert (=> b!276876 (=> (not res!140864) (not e!176817))))

(declare-fun arrayContainsKey!0 (array!13773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276876 (= res!140864 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276877 () Bool)

(declare-fun res!140863 () Bool)

(assert (=> b!276877 (=> (not res!140863) (not e!176817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276877 (= res!140863 (validKeyInArray!0 k!2581))))

(declare-fun res!140866 () Bool)

(assert (=> start!26676 (=> (not res!140866) (not e!176817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26676 (= res!140866 (validMask!0 mask!3868))))

(assert (=> start!26676 e!176817))

(declare-fun array_inv!4499 (array!13773) Bool)

(assert (=> start!26676 (array_inv!4499 a!3325)))

(assert (=> start!26676 true))

(declare-fun b!276878 () Bool)

(assert (=> b!276878 (= e!176819 false)))

(declare-fun lt!137776 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13773 (_ BitVec 32)) Bool)

(assert (=> b!276878 (= lt!137776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26676 res!140866) b!276873))

(assert (= (and b!276873 res!140868) b!276877))

(assert (= (and b!276877 res!140863) b!276874))

(assert (= (and b!276874 res!140867) b!276876))

(assert (= (and b!276876 res!140864) b!276875))

(assert (= (and b!276875 res!140865) b!276878))

(declare-fun m!292107 () Bool)

(assert (=> b!276874 m!292107))

(declare-fun m!292109 () Bool)

(assert (=> b!276877 m!292109))

(declare-fun m!292111 () Bool)

(assert (=> b!276878 m!292111))

(declare-fun m!292113 () Bool)

(assert (=> b!276875 m!292113))

(declare-fun m!292115 () Bool)

(assert (=> start!26676 m!292115))

(declare-fun m!292117 () Bool)

(assert (=> start!26676 m!292117))

(declare-fun m!292119 () Bool)

(assert (=> b!276876 m!292119))

(push 1)

(assert (not b!276877))

(assert (not b!276874))

(assert (not b!276876))

(assert (not b!276878))

(assert (not start!26676))

(assert (not b!276875))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

