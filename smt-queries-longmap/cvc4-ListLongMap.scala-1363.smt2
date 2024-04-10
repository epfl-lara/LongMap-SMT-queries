; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26740 () Bool)

(assert start!26740)

(declare-fun b!277778 () Bool)

(declare-fun res!141609 () Bool)

(declare-fun e!177196 () Bool)

(assert (=> b!277778 (=> (not res!141609) (not e!177196))))

(declare-datatypes ((array!13837 0))(
  ( (array!13838 (arr!6568 (Array (_ BitVec 32) (_ BitVec 64))) (size!6920 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13837)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!277778 (= res!141609 (and (= (size!6920 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6920 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6920 a!3325))))))

(declare-fun res!141608 () Bool)

(assert (=> start!26740 (=> (not res!141608) (not e!177196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26740 (= res!141608 (validMask!0 mask!3868))))

(assert (=> start!26740 e!177196))

(declare-fun array_inv!4531 (array!13837) Bool)

(assert (=> start!26740 (array_inv!4531 a!3325)))

(assert (=> start!26740 true))

(declare-fun b!277779 () Bool)

(declare-fun e!177195 () Bool)

(declare-fun e!177193 () Bool)

(assert (=> b!277779 (= e!177195 e!177193)))

(declare-fun res!141613 () Bool)

(assert (=> b!277779 (=> (not res!141613) (not e!177193))))

(assert (=> b!277779 (= res!141613 (= startIndex!26 i!1267))))

(declare-fun lt!138058 () array!13837)

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!277779 (= lt!138058 (array!13838 (store (arr!6568 a!3325) i!1267 k!2581) (size!6920 a!3325)))))

(declare-fun b!277780 () Bool)

(declare-fun res!141610 () Bool)

(assert (=> b!277780 (=> (not res!141610) (not e!177196))))

(declare-datatypes ((List!4376 0))(
  ( (Nil!4373) (Cons!4372 (h!5039 (_ BitVec 64)) (t!9458 List!4376)) )
))
(declare-fun arrayNoDuplicates!0 (array!13837 (_ BitVec 32) List!4376) Bool)

(assert (=> b!277780 (= res!141610 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4373))))

(declare-fun b!277781 () Bool)

(declare-datatypes ((Unit!8779 0))(
  ( (Unit!8780) )
))
(declare-fun e!177194 () Unit!8779)

(declare-fun Unit!8781 () Unit!8779)

(assert (=> b!277781 (= e!177194 Unit!8781)))

(declare-fun b!277782 () Bool)

(declare-fun res!141612 () Bool)

(assert (=> b!277782 (=> (not res!141612) (not e!177196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277782 (= res!141612 (validKeyInArray!0 k!2581))))

(declare-fun b!277783 () Bool)

(declare-fun lt!138057 () Unit!8779)

(assert (=> b!277783 (= e!177194 lt!138057)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13837 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8779)

(assert (=> b!277783 (= lt!138057 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13837 (_ BitVec 32)) Bool)

(assert (=> b!277783 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!138058 mask!3868)))

(declare-fun b!277784 () Bool)

(assert (=> b!277784 (= e!177193 (not true))))

(declare-datatypes ((SeekEntryResult!1726 0))(
  ( (MissingZero!1726 (index!9074 (_ BitVec 32))) (Found!1726 (index!9075 (_ BitVec 32))) (Intermediate!1726 (undefined!2538 Bool) (index!9076 (_ BitVec 32)) (x!27315 (_ BitVec 32))) (Undefined!1726) (MissingVacant!1726 (index!9077 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13837 (_ BitVec 32)) SeekEntryResult!1726)

(assert (=> b!277784 (= (seekEntryOrOpen!0 k!2581 lt!138058 mask!3868) (Found!1726 i!1267))))

(declare-fun lt!138056 () Unit!8779)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13837 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8779)

(assert (=> b!277784 (= lt!138056 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!138055 () Unit!8779)

(assert (=> b!277784 (= lt!138055 e!177194)))

(declare-fun c!45636 () Bool)

(assert (=> b!277784 (= c!45636 (bvslt startIndex!26 (bvsub (size!6920 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277785 () Bool)

(declare-fun res!141614 () Bool)

(assert (=> b!277785 (=> (not res!141614) (not e!177196))))

(declare-fun arrayContainsKey!0 (array!13837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277785 (= res!141614 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277786 () Bool)

(assert (=> b!277786 (= e!177196 e!177195)))

(declare-fun res!141611 () Bool)

(assert (=> b!277786 (=> (not res!141611) (not e!177195))))

(declare-fun lt!138054 () SeekEntryResult!1726)

(assert (=> b!277786 (= res!141611 (or (= lt!138054 (MissingZero!1726 i!1267)) (= lt!138054 (MissingVacant!1726 i!1267))))))

(assert (=> b!277786 (= lt!138054 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277787 () Bool)

(declare-fun res!141615 () Bool)

(assert (=> b!277787 (=> (not res!141615) (not e!177195))))

(assert (=> b!277787 (= res!141615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26740 res!141608) b!277778))

(assert (= (and b!277778 res!141609) b!277782))

(assert (= (and b!277782 res!141612) b!277780))

(assert (= (and b!277780 res!141610) b!277785))

(assert (= (and b!277785 res!141614) b!277786))

(assert (= (and b!277786 res!141611) b!277787))

(assert (= (and b!277787 res!141615) b!277779))

(assert (= (and b!277779 res!141613) b!277784))

(assert (= (and b!277784 c!45636) b!277783))

(assert (= (and b!277784 (not c!45636)) b!277781))

(declare-fun m!292719 () Bool)

(assert (=> b!277785 m!292719))

(declare-fun m!292721 () Bool)

(assert (=> b!277782 m!292721))

(declare-fun m!292723 () Bool)

(assert (=> start!26740 m!292723))

(declare-fun m!292725 () Bool)

(assert (=> start!26740 m!292725))

(declare-fun m!292727 () Bool)

(assert (=> b!277786 m!292727))

(declare-fun m!292729 () Bool)

(assert (=> b!277779 m!292729))

(declare-fun m!292731 () Bool)

(assert (=> b!277783 m!292731))

(declare-fun m!292733 () Bool)

(assert (=> b!277783 m!292733))

(declare-fun m!292735 () Bool)

(assert (=> b!277784 m!292735))

(declare-fun m!292737 () Bool)

(assert (=> b!277784 m!292737))

(declare-fun m!292739 () Bool)

(assert (=> b!277780 m!292739))

(declare-fun m!292741 () Bool)

(assert (=> b!277787 m!292741))

(push 1)

(assert (not b!277780))

(assert (not b!277782))

(assert (not b!277786))

(assert (not b!277785))

(assert (not start!26740))

(assert (not b!277787))

(assert (not b!277783))

