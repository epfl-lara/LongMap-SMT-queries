; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26734 () Bool)

(assert start!26734)

(declare-fun b!277688 () Bool)

(declare-fun res!141536 () Bool)

(declare-fun e!177151 () Bool)

(assert (=> b!277688 (=> (not res!141536) (not e!177151))))

(declare-datatypes ((array!13831 0))(
  ( (array!13832 (arr!6565 (Array (_ BitVec 32) (_ BitVec 64))) (size!6917 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13831)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!277688 (= res!141536 (and (= (size!6917 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6917 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6917 a!3325))))))

(declare-fun res!141543 () Bool)

(assert (=> start!26734 (=> (not res!141543) (not e!177151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26734 (= res!141543 (validMask!0 mask!3868))))

(assert (=> start!26734 e!177151))

(declare-fun array_inv!4528 (array!13831) Bool)

(assert (=> start!26734 (array_inv!4528 a!3325)))

(assert (=> start!26734 true))

(declare-fun b!277689 () Bool)

(declare-datatypes ((Unit!8770 0))(
  ( (Unit!8771) )
))
(declare-fun e!177152 () Unit!8770)

(declare-fun Unit!8772 () Unit!8770)

(assert (=> b!277689 (= e!177152 Unit!8772)))

(declare-fun b!277690 () Bool)

(declare-fun res!141541 () Bool)

(assert (=> b!277690 (=> (not res!141541) (not e!177151))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277690 (= res!141541 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277691 () Bool)

(declare-fun res!141539 () Bool)

(declare-fun e!177149 () Bool)

(assert (=> b!277691 (=> (not res!141539) (not e!177149))))

(assert (=> b!277691 (= res!141539 (= startIndex!26 i!1267))))

(declare-fun b!277692 () Bool)

(declare-fun res!141538 () Bool)

(assert (=> b!277692 (=> (not res!141538) (not e!177149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13831 (_ BitVec 32)) Bool)

(assert (=> b!277692 (= res!141538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277693 () Bool)

(declare-fun lt!138011 () Unit!8770)

(assert (=> b!277693 (= e!177152 lt!138011)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13831 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8770)

(assert (=> b!277693 (= lt!138011 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277693 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13832 (store (arr!6565 a!3325) i!1267 k!2581) (size!6917 a!3325)) mask!3868)))

(declare-fun b!277694 () Bool)

(assert (=> b!277694 (= e!177151 e!177149)))

(declare-fun res!141542 () Bool)

(assert (=> b!277694 (=> (not res!141542) (not e!177149))))

(declare-datatypes ((SeekEntryResult!1723 0))(
  ( (MissingZero!1723 (index!9062 (_ BitVec 32))) (Found!1723 (index!9063 (_ BitVec 32))) (Intermediate!1723 (undefined!2535 Bool) (index!9064 (_ BitVec 32)) (x!27304 (_ BitVec 32))) (Undefined!1723) (MissingVacant!1723 (index!9065 (_ BitVec 32))) )
))
(declare-fun lt!138013 () SeekEntryResult!1723)

(assert (=> b!277694 (= res!141542 (or (= lt!138013 (MissingZero!1723 i!1267)) (= lt!138013 (MissingVacant!1723 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13831 (_ BitVec 32)) SeekEntryResult!1723)

(assert (=> b!277694 (= lt!138013 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277695 () Bool)

(declare-fun res!141537 () Bool)

(assert (=> b!277695 (=> (not res!141537) (not e!177151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277695 (= res!141537 (validKeyInArray!0 k!2581))))

(declare-fun b!277696 () Bool)

(declare-fun res!141540 () Bool)

(assert (=> b!277696 (=> (not res!141540) (not e!177151))))

(declare-datatypes ((List!4373 0))(
  ( (Nil!4370) (Cons!4369 (h!5036 (_ BitVec 64)) (t!9455 List!4373)) )
))
(declare-fun arrayNoDuplicates!0 (array!13831 (_ BitVec 32) List!4373) Bool)

(assert (=> b!277696 (= res!141540 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4370))))

(declare-fun b!277697 () Bool)

(assert (=> b!277697 (= e!177149 false)))

(declare-fun lt!138012 () Unit!8770)

(assert (=> b!277697 (= lt!138012 e!177152)))

(declare-fun c!45627 () Bool)

(assert (=> b!277697 (= c!45627 (bvslt startIndex!26 (bvsub (size!6917 a!3325) #b00000000000000000000000000000001)))))

(assert (= (and start!26734 res!141543) b!277688))

(assert (= (and b!277688 res!141536) b!277695))

(assert (= (and b!277695 res!141537) b!277696))

(assert (= (and b!277696 res!141540) b!277690))

(assert (= (and b!277690 res!141541) b!277694))

(assert (= (and b!277694 res!141542) b!277692))

(assert (= (and b!277692 res!141538) b!277691))

(assert (= (and b!277691 res!141539) b!277697))

(assert (= (and b!277697 c!45627) b!277693))

(assert (= (and b!277697 (not c!45627)) b!277689))

(declare-fun m!292651 () Bool)

(assert (=> b!277692 m!292651))

(declare-fun m!292653 () Bool)

(assert (=> b!277695 m!292653))

(declare-fun m!292655 () Bool)

(assert (=> b!277696 m!292655))

(declare-fun m!292657 () Bool)

(assert (=> b!277693 m!292657))

(declare-fun m!292659 () Bool)

(assert (=> b!277693 m!292659))

(declare-fun m!292661 () Bool)

(assert (=> b!277693 m!292661))

(declare-fun m!292663 () Bool)

(assert (=> b!277694 m!292663))

(declare-fun m!292665 () Bool)

(assert (=> b!277690 m!292665))

(declare-fun m!292667 () Bool)

(assert (=> start!26734 m!292667))

(declare-fun m!292669 () Bool)

(assert (=> start!26734 m!292669))

(push 1)

(assert (not start!26734))

(assert (not b!277695))

(assert (not b!277690))

(assert (not b!277696))

(assert (not b!277694))

(assert (not b!277693))

(assert (not b!277692))

(check-sat)

