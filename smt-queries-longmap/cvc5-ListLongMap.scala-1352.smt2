; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26670 () Bool)

(assert start!26670)

(declare-fun b!276819 () Bool)

(declare-fun res!140809 () Bool)

(declare-fun e!176792 () Bool)

(assert (=> b!276819 (=> (not res!140809) (not e!176792))))

(declare-datatypes ((array!13767 0))(
  ( (array!13768 (arr!6533 (Array (_ BitVec 32) (_ BitVec 64))) (size!6885 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13767)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276819 (= res!140809 (and (= (size!6885 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6885 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6885 a!3325))))))

(declare-fun res!140812 () Bool)

(assert (=> start!26670 (=> (not res!140812) (not e!176792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26670 (= res!140812 (validMask!0 mask!3868))))

(assert (=> start!26670 e!176792))

(declare-fun array_inv!4496 (array!13767) Bool)

(assert (=> start!26670 (array_inv!4496 a!3325)))

(assert (=> start!26670 true))

(declare-fun b!276820 () Bool)

(declare-fun res!140813 () Bool)

(assert (=> b!276820 (=> (not res!140813) (not e!176792))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276820 (= res!140813 (validKeyInArray!0 k!2581))))

(declare-fun b!276821 () Bool)

(declare-fun res!140810 () Bool)

(assert (=> b!276821 (=> (not res!140810) (not e!176792))))

(declare-fun arrayContainsKey!0 (array!13767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276821 (= res!140810 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276822 () Bool)

(declare-fun e!176790 () Bool)

(assert (=> b!276822 (= e!176792 e!176790)))

(declare-fun res!140814 () Bool)

(assert (=> b!276822 (=> (not res!140814) (not e!176790))))

(declare-datatypes ((SeekEntryResult!1691 0))(
  ( (MissingZero!1691 (index!8934 (_ BitVec 32))) (Found!1691 (index!8935 (_ BitVec 32))) (Intermediate!1691 (undefined!2503 Bool) (index!8936 (_ BitVec 32)) (x!27192 (_ BitVec 32))) (Undefined!1691) (MissingVacant!1691 (index!8937 (_ BitVec 32))) )
))
(declare-fun lt!137757 () SeekEntryResult!1691)

(assert (=> b!276822 (= res!140814 (or (= lt!137757 (MissingZero!1691 i!1267)) (= lt!137757 (MissingVacant!1691 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13767 (_ BitVec 32)) SeekEntryResult!1691)

(assert (=> b!276822 (= lt!137757 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276823 () Bool)

(declare-fun res!140811 () Bool)

(assert (=> b!276823 (=> (not res!140811) (not e!176792))))

(declare-datatypes ((List!4341 0))(
  ( (Nil!4338) (Cons!4337 (h!5004 (_ BitVec 64)) (t!9423 List!4341)) )
))
(declare-fun arrayNoDuplicates!0 (array!13767 (_ BitVec 32) List!4341) Bool)

(assert (=> b!276823 (= res!140811 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4338))))

(declare-fun b!276824 () Bool)

(assert (=> b!276824 (= e!176790 false)))

(declare-fun lt!137758 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13767 (_ BitVec 32)) Bool)

(assert (=> b!276824 (= lt!137758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26670 res!140812) b!276819))

(assert (= (and b!276819 res!140809) b!276820))

(assert (= (and b!276820 res!140813) b!276823))

(assert (= (and b!276823 res!140811) b!276821))

(assert (= (and b!276821 res!140810) b!276822))

(assert (= (and b!276822 res!140814) b!276824))

(declare-fun m!292065 () Bool)

(assert (=> b!276824 m!292065))

(declare-fun m!292067 () Bool)

(assert (=> start!26670 m!292067))

(declare-fun m!292069 () Bool)

(assert (=> start!26670 m!292069))

(declare-fun m!292071 () Bool)

(assert (=> b!276821 m!292071))

(declare-fun m!292073 () Bool)

(assert (=> b!276822 m!292073))

(declare-fun m!292075 () Bool)

(assert (=> b!276820 m!292075))

(declare-fun m!292077 () Bool)

(assert (=> b!276823 m!292077))

(push 1)

