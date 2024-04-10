; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27510 () Bool)

(assert start!27510)

(declare-fun b!284277 () Bool)

(declare-fun e!180364 () Bool)

(declare-fun e!180365 () Bool)

(assert (=> b!284277 (= e!180364 e!180365)))

(declare-fun res!146787 () Bool)

(assert (=> b!284277 (=> (not res!146787) (not e!180365))))

(declare-datatypes ((SeekEntryResult!1877 0))(
  ( (MissingZero!1877 (index!9678 (_ BitVec 32))) (Found!1877 (index!9679 (_ BitVec 32))) (Intermediate!1877 (undefined!2689 Bool) (index!9680 (_ BitVec 32)) (x!27892 (_ BitVec 32))) (Undefined!1877) (MissingVacant!1877 (index!9681 (_ BitVec 32))) )
))
(declare-fun lt!140467 () SeekEntryResult!1877)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284277 (= res!146787 (or (= lt!140467 (MissingZero!1877 i!1267)) (= lt!140467 (MissingVacant!1877 i!1267))))))

(declare-datatypes ((array!14160 0))(
  ( (array!14161 (arr!6719 (Array (_ BitVec 32) (_ BitVec 64))) (size!7071 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14160)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14160 (_ BitVec 32)) SeekEntryResult!1877)

(assert (=> b!284277 (= lt!140467 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284278 () Bool)

(declare-fun res!146786 () Bool)

(assert (=> b!284278 (=> (not res!146786) (not e!180364))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284278 (= res!146786 (and (= (size!7071 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7071 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7071 a!3325))))))

(declare-fun b!284279 () Bool)

(declare-fun res!146790 () Bool)

(assert (=> b!284279 (=> (not res!146790) (not e!180364))))

(declare-fun arrayContainsKey!0 (array!14160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284279 (= res!146790 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284280 () Bool)

(assert (=> b!284280 (= e!180365 false)))

(declare-fun lt!140466 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14160 (_ BitVec 32)) Bool)

(assert (=> b!284280 (= lt!140466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284281 () Bool)

(declare-fun res!146789 () Bool)

(assert (=> b!284281 (=> (not res!146789) (not e!180364))))

(declare-datatypes ((List!4527 0))(
  ( (Nil!4524) (Cons!4523 (h!5196 (_ BitVec 64)) (t!9609 List!4527)) )
))
(declare-fun arrayNoDuplicates!0 (array!14160 (_ BitVec 32) List!4527) Bool)

(assert (=> b!284281 (= res!146789 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4524))))

(declare-fun b!284282 () Bool)

(declare-fun res!146788 () Bool)

(assert (=> b!284282 (=> (not res!146788) (not e!180364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284282 (= res!146788 (validKeyInArray!0 k!2581))))

(declare-fun res!146785 () Bool)

(assert (=> start!27510 (=> (not res!146785) (not e!180364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27510 (= res!146785 (validMask!0 mask!3868))))

(assert (=> start!27510 e!180364))

(declare-fun array_inv!4682 (array!14160) Bool)

(assert (=> start!27510 (array_inv!4682 a!3325)))

(assert (=> start!27510 true))

(assert (= (and start!27510 res!146785) b!284278))

(assert (= (and b!284278 res!146786) b!284282))

(assert (= (and b!284282 res!146788) b!284281))

(assert (= (and b!284281 res!146789) b!284279))

(assert (= (and b!284279 res!146790) b!284277))

(assert (= (and b!284277 res!146787) b!284280))

(declare-fun m!299337 () Bool)

(assert (=> b!284280 m!299337))

(declare-fun m!299339 () Bool)

(assert (=> b!284282 m!299339))

(declare-fun m!299341 () Bool)

(assert (=> b!284277 m!299341))

(declare-fun m!299343 () Bool)

(assert (=> b!284281 m!299343))

(declare-fun m!299345 () Bool)

(assert (=> b!284279 m!299345))

(declare-fun m!299347 () Bool)

(assert (=> start!27510 m!299347))

(declare-fun m!299349 () Bool)

(assert (=> start!27510 m!299349))

(push 1)

