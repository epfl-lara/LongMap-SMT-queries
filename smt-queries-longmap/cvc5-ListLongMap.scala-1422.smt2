; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27558 () Bool)

(assert start!27558)

(declare-fun b!284736 () Bool)

(declare-fun res!147247 () Bool)

(declare-fun e!180580 () Bool)

(assert (=> b!284736 (=> (not res!147247) (not e!180580))))

(declare-datatypes ((array!14208 0))(
  ( (array!14209 (arr!6743 (Array (_ BitVec 32) (_ BitVec 64))) (size!7095 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14208)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284736 (= res!147247 (and (= (size!7095 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7095 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7095 a!3325))))))

(declare-fun b!284737 () Bool)

(declare-fun res!147248 () Bool)

(assert (=> b!284737 (=> (not res!147248) (not e!180580))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284737 (= res!147248 (validKeyInArray!0 k!2581))))

(declare-fun res!147246 () Bool)

(assert (=> start!27558 (=> (not res!147246) (not e!180580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27558 (= res!147246 (validMask!0 mask!3868))))

(assert (=> start!27558 e!180580))

(declare-fun array_inv!4706 (array!14208) Bool)

(assert (=> start!27558 (array_inv!4706 a!3325)))

(assert (=> start!27558 true))

(declare-fun b!284738 () Bool)

(declare-fun res!147245 () Bool)

(assert (=> b!284738 (=> (not res!147245) (not e!180580))))

(declare-fun arrayContainsKey!0 (array!14208 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284738 (= res!147245 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284739 () Bool)

(declare-fun e!180579 () Bool)

(assert (=> b!284739 (= e!180580 e!180579)))

(declare-fun res!147249 () Bool)

(assert (=> b!284739 (=> (not res!147249) (not e!180579))))

(declare-datatypes ((SeekEntryResult!1901 0))(
  ( (MissingZero!1901 (index!9774 (_ BitVec 32))) (Found!1901 (index!9775 (_ BitVec 32))) (Intermediate!1901 (undefined!2713 Bool) (index!9776 (_ BitVec 32)) (x!27980 (_ BitVec 32))) (Undefined!1901) (MissingVacant!1901 (index!9777 (_ BitVec 32))) )
))
(declare-fun lt!140602 () SeekEntryResult!1901)

(assert (=> b!284739 (= res!147249 (or (= lt!140602 (MissingZero!1901 i!1267)) (= lt!140602 (MissingVacant!1901 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14208 (_ BitVec 32)) SeekEntryResult!1901)

(assert (=> b!284739 (= lt!140602 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284740 () Bool)

(declare-fun res!147244 () Bool)

(assert (=> b!284740 (=> (not res!147244) (not e!180580))))

(declare-datatypes ((List!4551 0))(
  ( (Nil!4548) (Cons!4547 (h!5220 (_ BitVec 64)) (t!9633 List!4551)) )
))
(declare-fun arrayNoDuplicates!0 (array!14208 (_ BitVec 32) List!4551) Bool)

(assert (=> b!284740 (= res!147244 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4548))))

(declare-fun b!284741 () Bool)

(assert (=> b!284741 (= e!180579 false)))

(declare-fun lt!140601 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14208 (_ BitVec 32)) Bool)

(assert (=> b!284741 (= lt!140601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27558 res!147246) b!284736))

(assert (= (and b!284736 res!147247) b!284737))

(assert (= (and b!284737 res!147248) b!284740))

(assert (= (and b!284740 res!147244) b!284738))

(assert (= (and b!284738 res!147245) b!284739))

(assert (= (and b!284739 res!147249) b!284741))

(declare-fun m!299685 () Bool)

(assert (=> start!27558 m!299685))

(declare-fun m!299687 () Bool)

(assert (=> start!27558 m!299687))

(declare-fun m!299689 () Bool)

(assert (=> b!284738 m!299689))

(declare-fun m!299691 () Bool)

(assert (=> b!284739 m!299691))

(declare-fun m!299693 () Bool)

(assert (=> b!284740 m!299693))

(declare-fun m!299695 () Bool)

(assert (=> b!284737 m!299695))

(declare-fun m!299697 () Bool)

(assert (=> b!284741 m!299697))

(push 1)

