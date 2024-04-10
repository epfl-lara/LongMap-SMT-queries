; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26652 () Bool)

(assert start!26652)

(declare-fun b!276657 () Bool)

(declare-fun e!176710 () Bool)

(assert (=> b!276657 (= e!176710 false)))

(declare-fun lt!137703 () Bool)

(declare-datatypes ((array!13749 0))(
  ( (array!13750 (arr!6524 (Array (_ BitVec 32) (_ BitVec 64))) (size!6876 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13749)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13749 (_ BitVec 32)) Bool)

(assert (=> b!276657 (= lt!137703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276658 () Bool)

(declare-fun res!140648 () Bool)

(declare-fun e!176709 () Bool)

(assert (=> b!276658 (=> (not res!140648) (not e!176709))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276658 (= res!140648 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!140652 () Bool)

(assert (=> start!26652 (=> (not res!140652) (not e!176709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26652 (= res!140652 (validMask!0 mask!3868))))

(assert (=> start!26652 e!176709))

(declare-fun array_inv!4487 (array!13749) Bool)

(assert (=> start!26652 (array_inv!4487 a!3325)))

(assert (=> start!26652 true))

(declare-fun b!276659 () Bool)

(declare-fun res!140649 () Bool)

(assert (=> b!276659 (=> (not res!140649) (not e!176709))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276659 (= res!140649 (and (= (size!6876 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6876 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6876 a!3325))))))

(declare-fun b!276660 () Bool)

(declare-fun res!140651 () Bool)

(assert (=> b!276660 (=> (not res!140651) (not e!176709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276660 (= res!140651 (validKeyInArray!0 k!2581))))

(declare-fun b!276661 () Bool)

(declare-fun res!140650 () Bool)

(assert (=> b!276661 (=> (not res!140650) (not e!176709))))

(declare-datatypes ((List!4332 0))(
  ( (Nil!4329) (Cons!4328 (h!4995 (_ BitVec 64)) (t!9414 List!4332)) )
))
(declare-fun arrayNoDuplicates!0 (array!13749 (_ BitVec 32) List!4332) Bool)

(assert (=> b!276661 (= res!140650 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4329))))

(declare-fun b!276662 () Bool)

(assert (=> b!276662 (= e!176709 e!176710)))

(declare-fun res!140647 () Bool)

(assert (=> b!276662 (=> (not res!140647) (not e!176710))))

(declare-datatypes ((SeekEntryResult!1682 0))(
  ( (MissingZero!1682 (index!8898 (_ BitVec 32))) (Found!1682 (index!8899 (_ BitVec 32))) (Intermediate!1682 (undefined!2494 Bool) (index!8900 (_ BitVec 32)) (x!27159 (_ BitVec 32))) (Undefined!1682) (MissingVacant!1682 (index!8901 (_ BitVec 32))) )
))
(declare-fun lt!137704 () SeekEntryResult!1682)

(assert (=> b!276662 (= res!140647 (or (= lt!137704 (MissingZero!1682 i!1267)) (= lt!137704 (MissingVacant!1682 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13749 (_ BitVec 32)) SeekEntryResult!1682)

(assert (=> b!276662 (= lt!137704 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26652 res!140652) b!276659))

(assert (= (and b!276659 res!140649) b!276660))

(assert (= (and b!276660 res!140651) b!276661))

(assert (= (and b!276661 res!140650) b!276658))

(assert (= (and b!276658 res!140648) b!276662))

(assert (= (and b!276662 res!140647) b!276657))

(declare-fun m!291939 () Bool)

(assert (=> b!276660 m!291939))

(declare-fun m!291941 () Bool)

(assert (=> start!26652 m!291941))

(declare-fun m!291943 () Bool)

(assert (=> start!26652 m!291943))

(declare-fun m!291945 () Bool)

(assert (=> b!276658 m!291945))

(declare-fun m!291947 () Bool)

(assert (=> b!276657 m!291947))

(declare-fun m!291949 () Bool)

(assert (=> b!276661 m!291949))

(declare-fun m!291951 () Bool)

(assert (=> b!276662 m!291951))

(push 1)

