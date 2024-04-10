; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26744 () Bool)

(assert start!26744)

(declare-fun b!277838 () Bool)

(declare-datatypes ((Unit!8785 0))(
  ( (Unit!8786) )
))
(declare-fun e!177227 () Unit!8785)

(declare-fun Unit!8787 () Unit!8785)

(assert (=> b!277838 (= e!177227 Unit!8787)))

(declare-fun b!277839 () Bool)

(declare-fun res!141659 () Bool)

(declare-fun e!177223 () Bool)

(assert (=> b!277839 (=> (not res!141659) (not e!177223))))

(declare-datatypes ((array!13841 0))(
  ( (array!13842 (arr!6570 (Array (_ BitVec 32) (_ BitVec 64))) (size!6922 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13841)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277839 (= res!141659 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277840 () Bool)

(declare-fun e!177226 () Bool)

(declare-fun e!177225 () Bool)

(assert (=> b!277840 (= e!177226 e!177225)))

(declare-fun res!141661 () Bool)

(assert (=> b!277840 (=> (not res!141661) (not e!177225))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277840 (= res!141661 (= startIndex!26 i!1267))))

(declare-fun lt!138088 () array!13841)

(assert (=> b!277840 (= lt!138088 (array!13842 (store (arr!6570 a!3325) i!1267 k0!2581) (size!6922 a!3325)))))

(declare-fun b!277841 () Bool)

(declare-fun res!141656 () Bool)

(assert (=> b!277841 (=> (not res!141656) (not e!177223))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!277841 (= res!141656 (and (= (size!6922 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6922 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6922 a!3325))))))

(declare-fun b!277842 () Bool)

(assert (=> b!277842 (= e!177223 e!177226)))

(declare-fun res!141658 () Bool)

(assert (=> b!277842 (=> (not res!141658) (not e!177226))))

(declare-datatypes ((SeekEntryResult!1728 0))(
  ( (MissingZero!1728 (index!9082 (_ BitVec 32))) (Found!1728 (index!9083 (_ BitVec 32))) (Intermediate!1728 (undefined!2540 Bool) (index!9084 (_ BitVec 32)) (x!27325 (_ BitVec 32))) (Undefined!1728) (MissingVacant!1728 (index!9085 (_ BitVec 32))) )
))
(declare-fun lt!138086 () SeekEntryResult!1728)

(assert (=> b!277842 (= res!141658 (or (= lt!138086 (MissingZero!1728 i!1267)) (= lt!138086 (MissingVacant!1728 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13841 (_ BitVec 32)) SeekEntryResult!1728)

(assert (=> b!277842 (= lt!138086 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277843 () Bool)

(declare-fun res!141657 () Bool)

(assert (=> b!277843 (=> (not res!141657) (not e!177226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13841 (_ BitVec 32)) Bool)

(assert (=> b!277843 (= res!141657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277844 () Bool)

(declare-fun res!141663 () Bool)

(assert (=> b!277844 (=> (not res!141663) (not e!177223))))

(declare-datatypes ((List!4378 0))(
  ( (Nil!4375) (Cons!4374 (h!5041 (_ BitVec 64)) (t!9460 List!4378)) )
))
(declare-fun arrayNoDuplicates!0 (array!13841 (_ BitVec 32) List!4378) Bool)

(assert (=> b!277844 (= res!141663 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4375))))

(declare-fun b!277845 () Bool)

(declare-fun lt!138085 () Unit!8785)

(assert (=> b!277845 (= e!177227 lt!138085)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8785)

(assert (=> b!277845 (= lt!138085 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277845 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!138088 mask!3868)))

(declare-fun res!141660 () Bool)

(assert (=> start!26744 (=> (not res!141660) (not e!177223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26744 (= res!141660 (validMask!0 mask!3868))))

(assert (=> start!26744 e!177223))

(declare-fun array_inv!4533 (array!13841) Bool)

(assert (=> start!26744 (array_inv!4533 a!3325)))

(assert (=> start!26744 true))

(declare-fun b!277846 () Bool)

(declare-fun res!141662 () Bool)

(assert (=> b!277846 (=> (not res!141662) (not e!177223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277846 (= res!141662 (validKeyInArray!0 k0!2581))))

(declare-fun b!277847 () Bool)

(assert (=> b!277847 (= e!177225 (not true))))

(assert (=> b!277847 (= (seekEntryOrOpen!0 k0!2581 lt!138088 mask!3868) (Found!1728 i!1267))))

(declare-fun lt!138087 () Unit!8785)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8785)

(assert (=> b!277847 (= lt!138087 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!138084 () Unit!8785)

(assert (=> b!277847 (= lt!138084 e!177227)))

(declare-fun c!45642 () Bool)

(assert (=> b!277847 (= c!45642 (bvslt startIndex!26 (bvsub (size!6922 a!3325) #b00000000000000000000000000000001)))))

(assert (= (and start!26744 res!141660) b!277841))

(assert (= (and b!277841 res!141656) b!277846))

(assert (= (and b!277846 res!141662) b!277844))

(assert (= (and b!277844 res!141663) b!277839))

(assert (= (and b!277839 res!141659) b!277842))

(assert (= (and b!277842 res!141658) b!277843))

(assert (= (and b!277843 res!141657) b!277840))

(assert (= (and b!277840 res!141661) b!277847))

(assert (= (and b!277847 c!45642) b!277845))

(assert (= (and b!277847 (not c!45642)) b!277838))

(declare-fun m!292767 () Bool)

(assert (=> b!277840 m!292767))

(declare-fun m!292769 () Bool)

(assert (=> b!277842 m!292769))

(declare-fun m!292771 () Bool)

(assert (=> b!277847 m!292771))

(declare-fun m!292773 () Bool)

(assert (=> b!277847 m!292773))

(declare-fun m!292775 () Bool)

(assert (=> b!277844 m!292775))

(declare-fun m!292777 () Bool)

(assert (=> b!277839 m!292777))

(declare-fun m!292779 () Bool)

(assert (=> b!277843 m!292779))

(declare-fun m!292781 () Bool)

(assert (=> b!277845 m!292781))

(declare-fun m!292783 () Bool)

(assert (=> b!277845 m!292783))

(declare-fun m!292785 () Bool)

(assert (=> start!26744 m!292785))

(declare-fun m!292787 () Bool)

(assert (=> start!26744 m!292787))

(declare-fun m!292789 () Bool)

(assert (=> b!277846 m!292789))

(check-sat (not b!277842) (not b!277846) (not b!277847) (not b!277844) (not b!277845) (not start!26744) (not b!277839) (not b!277843))
(check-sat)
