; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26742 () Bool)

(assert start!26742)

(declare-fun b!277808 () Bool)

(declare-datatypes ((Unit!8782 0))(
  ( (Unit!8783) )
))
(declare-fun e!177208 () Unit!8782)

(declare-fun lt!138069 () Unit!8782)

(assert (=> b!277808 (= e!177208 lt!138069)))

(declare-datatypes ((array!13839 0))(
  ( (array!13840 (arr!6569 (Array (_ BitVec 32) (_ BitVec 64))) (size!6921 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13839)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13839 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8782)

(assert (=> b!277808 (= lt!138069 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!138070 () array!13839)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13839 (_ BitVec 32)) Bool)

(assert (=> b!277808 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!138070 mask!3868)))

(declare-fun b!277809 () Bool)

(declare-fun Unit!8784 () Unit!8782)

(assert (=> b!277809 (= e!177208 Unit!8784)))

(declare-fun res!141636 () Bool)

(declare-fun e!177211 () Bool)

(assert (=> start!26742 (=> (not res!141636) (not e!177211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26742 (= res!141636 (validMask!0 mask!3868))))

(assert (=> start!26742 e!177211))

(declare-fun array_inv!4532 (array!13839) Bool)

(assert (=> start!26742 (array_inv!4532 a!3325)))

(assert (=> start!26742 true))

(declare-fun b!277810 () Bool)

(declare-fun res!141635 () Bool)

(assert (=> b!277810 (=> (not res!141635) (not e!177211))))

(declare-datatypes ((List!4377 0))(
  ( (Nil!4374) (Cons!4373 (h!5040 (_ BitVec 64)) (t!9459 List!4377)) )
))
(declare-fun arrayNoDuplicates!0 (array!13839 (_ BitVec 32) List!4377) Bool)

(assert (=> b!277810 (= res!141635 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4374))))

(declare-fun b!277811 () Bool)

(declare-fun e!177212 () Bool)

(assert (=> b!277811 (= e!177211 e!177212)))

(declare-fun res!141634 () Bool)

(assert (=> b!277811 (=> (not res!141634) (not e!177212))))

(declare-datatypes ((SeekEntryResult!1727 0))(
  ( (MissingZero!1727 (index!9078 (_ BitVec 32))) (Found!1727 (index!9079 (_ BitVec 32))) (Intermediate!1727 (undefined!2539 Bool) (index!9080 (_ BitVec 32)) (x!27324 (_ BitVec 32))) (Undefined!1727) (MissingVacant!1727 (index!9081 (_ BitVec 32))) )
))
(declare-fun lt!138073 () SeekEntryResult!1727)

(assert (=> b!277811 (= res!141634 (or (= lt!138073 (MissingZero!1727 i!1267)) (= lt!138073 (MissingVacant!1727 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13839 (_ BitVec 32)) SeekEntryResult!1727)

(assert (=> b!277811 (= lt!138073 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277812 () Bool)

(declare-fun res!141639 () Bool)

(assert (=> b!277812 (=> (not res!141639) (not e!177211))))

(declare-fun arrayContainsKey!0 (array!13839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277812 (= res!141639 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277813 () Bool)

(declare-fun e!177210 () Bool)

(assert (=> b!277813 (= e!177212 e!177210)))

(declare-fun res!141633 () Bool)

(assert (=> b!277813 (=> (not res!141633) (not e!177210))))

(assert (=> b!277813 (= res!141633 (= startIndex!26 i!1267))))

(assert (=> b!277813 (= lt!138070 (array!13840 (store (arr!6569 a!3325) i!1267 k!2581) (size!6921 a!3325)))))

(declare-fun b!277814 () Bool)

(declare-fun res!141638 () Bool)

(assert (=> b!277814 (=> (not res!141638) (not e!177212))))

(assert (=> b!277814 (= res!141638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277815 () Bool)

(declare-fun res!141632 () Bool)

(assert (=> b!277815 (=> (not res!141632) (not e!177211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277815 (= res!141632 (validKeyInArray!0 k!2581))))

(declare-fun b!277816 () Bool)

(assert (=> b!277816 (= e!177210 (not true))))

(assert (=> b!277816 (= (seekEntryOrOpen!0 k!2581 lt!138070 mask!3868) (Found!1727 i!1267))))

(declare-fun lt!138072 () Unit!8782)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13839 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8782)

(assert (=> b!277816 (= lt!138072 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!138071 () Unit!8782)

(assert (=> b!277816 (= lt!138071 e!177208)))

(declare-fun c!45639 () Bool)

(assert (=> b!277816 (= c!45639 (bvslt startIndex!26 (bvsub (size!6921 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277817 () Bool)

(declare-fun res!141637 () Bool)

(assert (=> b!277817 (=> (not res!141637) (not e!177211))))

(assert (=> b!277817 (= res!141637 (and (= (size!6921 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6921 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6921 a!3325))))))

(assert (= (and start!26742 res!141636) b!277817))

(assert (= (and b!277817 res!141637) b!277815))

(assert (= (and b!277815 res!141632) b!277810))

(assert (= (and b!277810 res!141635) b!277812))

(assert (= (and b!277812 res!141639) b!277811))

(assert (= (and b!277811 res!141634) b!277814))

(assert (= (and b!277814 res!141638) b!277813))

(assert (= (and b!277813 res!141633) b!277816))

(assert (= (and b!277816 c!45639) b!277808))

(assert (= (and b!277816 (not c!45639)) b!277809))

(declare-fun m!292743 () Bool)

(assert (=> start!26742 m!292743))

(declare-fun m!292745 () Bool)

(assert (=> start!26742 m!292745))

(declare-fun m!292747 () Bool)

(assert (=> b!277814 m!292747))

(declare-fun m!292749 () Bool)

(assert (=> b!277815 m!292749))

(declare-fun m!292751 () Bool)

(assert (=> b!277816 m!292751))

(declare-fun m!292753 () Bool)

(assert (=> b!277816 m!292753))

(declare-fun m!292755 () Bool)

(assert (=> b!277811 m!292755))

(declare-fun m!292757 () Bool)

(assert (=> b!277812 m!292757))

(declare-fun m!292759 () Bool)

(assert (=> b!277813 m!292759))

(declare-fun m!292761 () Bool)

(assert (=> b!277810 m!292761))

(declare-fun m!292763 () Bool)

(assert (=> b!277808 m!292763))

(declare-fun m!292765 () Bool)

(assert (=> b!277808 m!292765))

(push 1)

