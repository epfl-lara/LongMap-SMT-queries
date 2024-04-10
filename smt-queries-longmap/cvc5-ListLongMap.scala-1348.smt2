; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26646 () Bool)

(assert start!26646)

(declare-fun b!276603 () Bool)

(declare-fun res!140598 () Bool)

(declare-fun e!176684 () Bool)

(assert (=> b!276603 (=> (not res!140598) (not e!176684))))

(declare-datatypes ((array!13743 0))(
  ( (array!13744 (arr!6521 (Array (_ BitVec 32) (_ BitVec 64))) (size!6873 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13743)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276603 (= res!140598 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276604 () Bool)

(declare-fun e!176683 () Bool)

(assert (=> b!276604 (= e!176684 e!176683)))

(declare-fun res!140595 () Bool)

(assert (=> b!276604 (=> (not res!140595) (not e!176683))))

(declare-datatypes ((SeekEntryResult!1679 0))(
  ( (MissingZero!1679 (index!8886 (_ BitVec 32))) (Found!1679 (index!8887 (_ BitVec 32))) (Intermediate!1679 (undefined!2491 Bool) (index!8888 (_ BitVec 32)) (x!27148 (_ BitVec 32))) (Undefined!1679) (MissingVacant!1679 (index!8889 (_ BitVec 32))) )
))
(declare-fun lt!137686 () SeekEntryResult!1679)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276604 (= res!140595 (or (= lt!137686 (MissingZero!1679 i!1267)) (= lt!137686 (MissingVacant!1679 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13743 (_ BitVec 32)) SeekEntryResult!1679)

(assert (=> b!276604 (= lt!137686 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276606 () Bool)

(assert (=> b!276606 (= e!176683 false)))

(declare-fun lt!137685 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13743 (_ BitVec 32)) Bool)

(assert (=> b!276606 (= lt!137685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276607 () Bool)

(declare-fun res!140594 () Bool)

(assert (=> b!276607 (=> (not res!140594) (not e!176684))))

(declare-datatypes ((List!4329 0))(
  ( (Nil!4326) (Cons!4325 (h!4992 (_ BitVec 64)) (t!9411 List!4329)) )
))
(declare-fun arrayNoDuplicates!0 (array!13743 (_ BitVec 32) List!4329) Bool)

(assert (=> b!276607 (= res!140594 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4326))))

(declare-fun b!276608 () Bool)

(declare-fun res!140596 () Bool)

(assert (=> b!276608 (=> (not res!140596) (not e!176684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276608 (= res!140596 (validKeyInArray!0 k!2581))))

(declare-fun b!276605 () Bool)

(declare-fun res!140597 () Bool)

(assert (=> b!276605 (=> (not res!140597) (not e!176684))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276605 (= res!140597 (and (= (size!6873 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6873 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6873 a!3325))))))

(declare-fun res!140593 () Bool)

(assert (=> start!26646 (=> (not res!140593) (not e!176684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26646 (= res!140593 (validMask!0 mask!3868))))

(assert (=> start!26646 e!176684))

(declare-fun array_inv!4484 (array!13743) Bool)

(assert (=> start!26646 (array_inv!4484 a!3325)))

(assert (=> start!26646 true))

(assert (= (and start!26646 res!140593) b!276605))

(assert (= (and b!276605 res!140597) b!276608))

(assert (= (and b!276608 res!140596) b!276607))

(assert (= (and b!276607 res!140594) b!276603))

(assert (= (and b!276603 res!140598) b!276604))

(assert (= (and b!276604 res!140595) b!276606))

(declare-fun m!291897 () Bool)

(assert (=> b!276603 m!291897))

(declare-fun m!291899 () Bool)

(assert (=> b!276606 m!291899))

(declare-fun m!291901 () Bool)

(assert (=> b!276607 m!291901))

(declare-fun m!291903 () Bool)

(assert (=> b!276608 m!291903))

(declare-fun m!291905 () Bool)

(assert (=> b!276604 m!291905))

(declare-fun m!291907 () Bool)

(assert (=> start!26646 m!291907))

(declare-fun m!291909 () Bool)

(assert (=> start!26646 m!291909))

(push 1)

