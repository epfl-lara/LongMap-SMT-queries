; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26746 () Bool)

(assert start!26746)

(declare-fun b!277868 () Bool)

(declare-fun res!141685 () Bool)

(declare-fun e!177238 () Bool)

(assert (=> b!277868 (=> (not res!141685) (not e!177238))))

(declare-datatypes ((array!13843 0))(
  ( (array!13844 (arr!6571 (Array (_ BitVec 32) (_ BitVec 64))) (size!6923 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13843)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!277868 (= res!141685 (and (= (size!6923 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6923 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6923 a!3325))))))

(declare-fun b!277869 () Bool)

(declare-fun e!177242 () Bool)

(assert (=> b!277869 (= e!177238 e!177242)))

(declare-fun res!141683 () Bool)

(assert (=> b!277869 (=> (not res!141683) (not e!177242))))

(declare-datatypes ((SeekEntryResult!1729 0))(
  ( (MissingZero!1729 (index!9086 (_ BitVec 32))) (Found!1729 (index!9087 (_ BitVec 32))) (Intermediate!1729 (undefined!2541 Bool) (index!9088 (_ BitVec 32)) (x!27326 (_ BitVec 32))) (Undefined!1729) (MissingVacant!1729 (index!9089 (_ BitVec 32))) )
))
(declare-fun lt!138103 () SeekEntryResult!1729)

(assert (=> b!277869 (= res!141683 (or (= lt!138103 (MissingZero!1729 i!1267)) (= lt!138103 (MissingVacant!1729 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13843 (_ BitVec 32)) SeekEntryResult!1729)

(assert (=> b!277869 (= lt!138103 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277870 () Bool)

(declare-fun res!141680 () Bool)

(assert (=> b!277870 (=> (not res!141680) (not e!177242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13843 (_ BitVec 32)) Bool)

(assert (=> b!277870 (= res!141680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!141682 () Bool)

(assert (=> start!26746 (=> (not res!141682) (not e!177238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26746 (= res!141682 (validMask!0 mask!3868))))

(assert (=> start!26746 e!177238))

(declare-fun array_inv!4534 (array!13843) Bool)

(assert (=> start!26746 (array_inv!4534 a!3325)))

(assert (=> start!26746 true))

(declare-fun b!277871 () Bool)

(declare-fun res!141681 () Bool)

(assert (=> b!277871 (=> (not res!141681) (not e!177238))))

(declare-fun arrayContainsKey!0 (array!13843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277871 (= res!141681 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277872 () Bool)

(declare-fun e!177240 () Bool)

(assert (=> b!277872 (= e!177240 (not true))))

(declare-fun lt!138101 () array!13843)

(assert (=> b!277872 (= (seekEntryOrOpen!0 k!2581 lt!138101 mask!3868) (Found!1729 i!1267))))

(declare-datatypes ((Unit!8788 0))(
  ( (Unit!8789) )
))
(declare-fun lt!138102 () Unit!8788)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13843 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8788)

(assert (=> b!277872 (= lt!138102 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!138099 () Unit!8788)

(declare-fun e!177239 () Unit!8788)

(assert (=> b!277872 (= lt!138099 e!177239)))

(declare-fun c!45645 () Bool)

(assert (=> b!277872 (= c!45645 (bvslt startIndex!26 (bvsub (size!6923 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277873 () Bool)

(assert (=> b!277873 (= e!177242 e!177240)))

(declare-fun res!141686 () Bool)

(assert (=> b!277873 (=> (not res!141686) (not e!177240))))

(assert (=> b!277873 (= res!141686 (= startIndex!26 i!1267))))

(assert (=> b!277873 (= lt!138101 (array!13844 (store (arr!6571 a!3325) i!1267 k!2581) (size!6923 a!3325)))))

(declare-fun b!277874 () Bool)

(declare-fun Unit!8790 () Unit!8788)

(assert (=> b!277874 (= e!177239 Unit!8790)))

(declare-fun b!277875 () Bool)

(declare-fun lt!138100 () Unit!8788)

(assert (=> b!277875 (= e!177239 lt!138100)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13843 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8788)

(assert (=> b!277875 (= lt!138100 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277875 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!138101 mask!3868)))

(declare-fun b!277876 () Bool)

(declare-fun res!141684 () Bool)

(assert (=> b!277876 (=> (not res!141684) (not e!177238))))

(declare-datatypes ((List!4379 0))(
  ( (Nil!4376) (Cons!4375 (h!5042 (_ BitVec 64)) (t!9461 List!4379)) )
))
(declare-fun arrayNoDuplicates!0 (array!13843 (_ BitVec 32) List!4379) Bool)

(assert (=> b!277876 (= res!141684 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4376))))

(declare-fun b!277877 () Bool)

(declare-fun res!141687 () Bool)

(assert (=> b!277877 (=> (not res!141687) (not e!177238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277877 (= res!141687 (validKeyInArray!0 k!2581))))

(assert (= (and start!26746 res!141682) b!277868))

(assert (= (and b!277868 res!141685) b!277877))

(assert (= (and b!277877 res!141687) b!277876))

(assert (= (and b!277876 res!141684) b!277871))

(assert (= (and b!277871 res!141681) b!277869))

(assert (= (and b!277869 res!141683) b!277870))

(assert (= (and b!277870 res!141680) b!277873))

(assert (= (and b!277873 res!141686) b!277872))

(assert (= (and b!277872 c!45645) b!277875))

(assert (= (and b!277872 (not c!45645)) b!277874))

(declare-fun m!292791 () Bool)

(assert (=> b!277872 m!292791))

(declare-fun m!292793 () Bool)

(assert (=> b!277872 m!292793))

(declare-fun m!292795 () Bool)

(assert (=> b!277875 m!292795))

(declare-fun m!292797 () Bool)

(assert (=> b!277875 m!292797))

(declare-fun m!292799 () Bool)

(assert (=> start!26746 m!292799))

(declare-fun m!292801 () Bool)

(assert (=> start!26746 m!292801))

(declare-fun m!292803 () Bool)

(assert (=> b!277870 m!292803))

(declare-fun m!292805 () Bool)

(assert (=> b!277877 m!292805))

(declare-fun m!292807 () Bool)

(assert (=> b!277871 m!292807))

(declare-fun m!292809 () Bool)

(assert (=> b!277869 m!292809))

(declare-fun m!292811 () Bool)

(assert (=> b!277873 m!292811))

(declare-fun m!292813 () Bool)

(assert (=> b!277876 m!292813))

(push 1)

(assert (not b!277871))

(assert (not b!277877))

(assert (not start!26746))

(assert (not b!277876))

(assert (not b!277875))

(assert (not b!277870))

(assert (not b!277869))

(assert (not b!277872))

(check-sat)

(pop 1)

