; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26736 () Bool)

(assert start!26736)

(declare-fun b!277718 () Bool)

(declare-datatypes ((Unit!8773 0))(
  ( (Unit!8774) )
))
(declare-fun e!177167 () Unit!8773)

(declare-fun lt!138024 () Unit!8773)

(assert (=> b!277718 (= e!177167 lt!138024)))

(declare-datatypes ((array!13833 0))(
  ( (array!13834 (arr!6566 (Array (_ BitVec 32) (_ BitVec 64))) (size!6918 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13833)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8773)

(assert (=> b!277718 (= lt!138024 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!138027 () array!13833)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13833 (_ BitVec 32)) Bool)

(assert (=> b!277718 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!138027 mask!3868)))

(declare-fun res!141564 () Bool)

(declare-fun e!177165 () Bool)

(assert (=> start!26736 (=> (not res!141564) (not e!177165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26736 (= res!141564 (validMask!0 mask!3868))))

(assert (=> start!26736 e!177165))

(declare-fun array_inv!4529 (array!13833) Bool)

(assert (=> start!26736 (array_inv!4529 a!3325)))

(assert (=> start!26736 true))

(declare-fun b!277719 () Bool)

(declare-fun res!141566 () Bool)

(assert (=> b!277719 (=> (not res!141566) (not e!177165))))

(assert (=> b!277719 (= res!141566 (and (= (size!6918 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6918 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6918 a!3325))))))

(declare-fun b!277720 () Bool)

(declare-fun e!177164 () Bool)

(assert (=> b!277720 (= e!177164 (not true))))

(declare-datatypes ((SeekEntryResult!1724 0))(
  ( (MissingZero!1724 (index!9066 (_ BitVec 32))) (Found!1724 (index!9067 (_ BitVec 32))) (Intermediate!1724 (undefined!2536 Bool) (index!9068 (_ BitVec 32)) (x!27313 (_ BitVec 32))) (Undefined!1724) (MissingVacant!1724 (index!9069 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13833 (_ BitVec 32)) SeekEntryResult!1724)

(assert (=> b!277720 (= (seekEntryOrOpen!0 k!2581 lt!138027 mask!3868) (Found!1724 i!1267))))

(declare-fun lt!138026 () Unit!8773)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8773)

(assert (=> b!277720 (= lt!138026 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!138028 () Unit!8773)

(assert (=> b!277720 (= lt!138028 e!177167)))

(declare-fun c!45630 () Bool)

(assert (=> b!277720 (= c!45630 (bvslt startIndex!26 (bvsub (size!6918 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277721 () Bool)

(declare-fun e!177166 () Bool)

(assert (=> b!277721 (= e!177166 e!177164)))

(declare-fun res!141567 () Bool)

(assert (=> b!277721 (=> (not res!141567) (not e!177164))))

(assert (=> b!277721 (= res!141567 (= startIndex!26 i!1267))))

(assert (=> b!277721 (= lt!138027 (array!13834 (store (arr!6566 a!3325) i!1267 k!2581) (size!6918 a!3325)))))

(declare-fun b!277722 () Bool)

(declare-fun res!141561 () Bool)

(assert (=> b!277722 (=> (not res!141561) (not e!177165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277722 (= res!141561 (validKeyInArray!0 k!2581))))

(declare-fun b!277723 () Bool)

(declare-fun res!141562 () Bool)

(assert (=> b!277723 (=> (not res!141562) (not e!177165))))

(declare-fun arrayContainsKey!0 (array!13833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277723 (= res!141562 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277724 () Bool)

(assert (=> b!277724 (= e!177165 e!177166)))

(declare-fun res!141563 () Bool)

(assert (=> b!277724 (=> (not res!141563) (not e!177166))))

(declare-fun lt!138025 () SeekEntryResult!1724)

(assert (=> b!277724 (= res!141563 (or (= lt!138025 (MissingZero!1724 i!1267)) (= lt!138025 (MissingVacant!1724 i!1267))))))

(assert (=> b!277724 (= lt!138025 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277725 () Bool)

(declare-fun res!141560 () Bool)

(assert (=> b!277725 (=> (not res!141560) (not e!177166))))

(assert (=> b!277725 (= res!141560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277726 () Bool)

(declare-fun res!141565 () Bool)

(assert (=> b!277726 (=> (not res!141565) (not e!177165))))

(declare-datatypes ((List!4374 0))(
  ( (Nil!4371) (Cons!4370 (h!5037 (_ BitVec 64)) (t!9456 List!4374)) )
))
(declare-fun arrayNoDuplicates!0 (array!13833 (_ BitVec 32) List!4374) Bool)

(assert (=> b!277726 (= res!141565 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4371))))

(declare-fun b!277727 () Bool)

(declare-fun Unit!8775 () Unit!8773)

(assert (=> b!277727 (= e!177167 Unit!8775)))

(assert (= (and start!26736 res!141564) b!277719))

(assert (= (and b!277719 res!141566) b!277722))

(assert (= (and b!277722 res!141561) b!277726))

(assert (= (and b!277726 res!141565) b!277723))

(assert (= (and b!277723 res!141562) b!277724))

(assert (= (and b!277724 res!141563) b!277725))

(assert (= (and b!277725 res!141560) b!277721))

(assert (= (and b!277721 res!141567) b!277720))

(assert (= (and b!277720 c!45630) b!277718))

(assert (= (and b!277720 (not c!45630)) b!277727))

(declare-fun m!292671 () Bool)

(assert (=> b!277726 m!292671))

(declare-fun m!292673 () Bool)

(assert (=> b!277722 m!292673))

(declare-fun m!292675 () Bool)

(assert (=> b!277724 m!292675))

(declare-fun m!292677 () Bool)

(assert (=> b!277725 m!292677))

(declare-fun m!292679 () Bool)

(assert (=> b!277720 m!292679))

(declare-fun m!292681 () Bool)

(assert (=> b!277720 m!292681))

(declare-fun m!292683 () Bool)

(assert (=> b!277718 m!292683))

(declare-fun m!292685 () Bool)

(assert (=> b!277718 m!292685))

(declare-fun m!292687 () Bool)

(assert (=> b!277721 m!292687))

(declare-fun m!292689 () Bool)

(assert (=> b!277723 m!292689))

(declare-fun m!292691 () Bool)

(assert (=> start!26736 m!292691))

(declare-fun m!292693 () Bool)

(assert (=> start!26736 m!292693))

(push 1)

