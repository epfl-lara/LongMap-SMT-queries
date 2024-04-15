; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26684 () Bool)

(assert start!26684)

(declare-fun b!276783 () Bool)

(declare-datatypes ((array!13770 0))(
  ( (array!13771 (arr!6534 (Array (_ BitVec 32) (_ BitVec 64))) (size!6887 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13770)

(declare-fun e!176745 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276783 (= e!176745 (and (= startIndex!26 i!1267) (bvslt startIndex!26 (bvsub (size!6887 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000) (bvsge (bvsub (size!6887 a!3325) (bvadd #b00000000000000000000000000000001 startIndex!26)) (bvsub (size!6887 a!3325) startIndex!26))))))

(declare-fun b!276784 () Bool)

(declare-fun res!140824 () Bool)

(assert (=> b!276784 (=> (not res!140824) (not e!176745))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13770 (_ BitVec 32)) Bool)

(assert (=> b!276784 (= res!140824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276785 () Bool)

(declare-fun res!140826 () Bool)

(declare-fun e!176744 () Bool)

(assert (=> b!276785 (=> (not res!140826) (not e!176744))))

(declare-datatypes ((List!4315 0))(
  ( (Nil!4312) (Cons!4311 (h!4978 (_ BitVec 64)) (t!9388 List!4315)) )
))
(declare-fun arrayNoDuplicates!0 (array!13770 (_ BitVec 32) List!4315) Bool)

(assert (=> b!276785 (= res!140826 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4312))))

(declare-fun b!276786 () Bool)

(declare-fun res!140827 () Bool)

(assert (=> b!276786 (=> (not res!140827) (not e!176744))))

(assert (=> b!276786 (= res!140827 (and (= (size!6887 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6887 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6887 a!3325))))))

(declare-fun b!276787 () Bool)

(declare-fun res!140825 () Bool)

(assert (=> b!276787 (=> (not res!140825) (not e!176744))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276787 (= res!140825 (validKeyInArray!0 k0!2581))))

(declare-fun b!276788 () Bool)

(assert (=> b!276788 (= e!176744 e!176745)))

(declare-fun res!140828 () Bool)

(assert (=> b!276788 (=> (not res!140828) (not e!176745))))

(declare-datatypes ((SeekEntryResult!1691 0))(
  ( (MissingZero!1691 (index!8934 (_ BitVec 32))) (Found!1691 (index!8935 (_ BitVec 32))) (Intermediate!1691 (undefined!2503 Bool) (index!8936 (_ BitVec 32)) (x!27207 (_ BitVec 32))) (Undefined!1691) (MissingVacant!1691 (index!8937 (_ BitVec 32))) )
))
(declare-fun lt!137610 () SeekEntryResult!1691)

(assert (=> b!276788 (= res!140828 (or (= lt!137610 (MissingZero!1691 i!1267)) (= lt!137610 (MissingVacant!1691 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13770 (_ BitVec 32)) SeekEntryResult!1691)

(assert (=> b!276788 (= lt!137610 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!140829 () Bool)

(assert (=> start!26684 (=> (not res!140829) (not e!176744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26684 (= res!140829 (validMask!0 mask!3868))))

(assert (=> start!26684 e!176744))

(declare-fun array_inv!4506 (array!13770) Bool)

(assert (=> start!26684 (array_inv!4506 a!3325)))

(assert (=> start!26684 true))

(declare-fun b!276782 () Bool)

(declare-fun res!140830 () Bool)

(assert (=> b!276782 (=> (not res!140830) (not e!176744))))

(declare-fun arrayContainsKey!0 (array!13770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276782 (= res!140830 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26684 res!140829) b!276786))

(assert (= (and b!276786 res!140827) b!276787))

(assert (= (and b!276787 res!140825) b!276785))

(assert (= (and b!276785 res!140826) b!276782))

(assert (= (and b!276782 res!140830) b!276788))

(assert (= (and b!276788 res!140828) b!276784))

(assert (= (and b!276784 res!140824) b!276783))

(declare-fun m!291557 () Bool)

(assert (=> b!276782 m!291557))

(declare-fun m!291559 () Bool)

(assert (=> start!26684 m!291559))

(declare-fun m!291561 () Bool)

(assert (=> start!26684 m!291561))

(declare-fun m!291563 () Bool)

(assert (=> b!276787 m!291563))

(declare-fun m!291565 () Bool)

(assert (=> b!276784 m!291565))

(declare-fun m!291567 () Bool)

(assert (=> b!276785 m!291567))

(declare-fun m!291569 () Bool)

(assert (=> b!276788 m!291569))

(check-sat (not b!276785) (not start!26684) (not b!276787) (not b!276784) (not b!276788) (not b!276782))
(check-sat)
