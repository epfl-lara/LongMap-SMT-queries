; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26104 () Bool)

(assert start!26104)

(declare-fun b!269309 () Bool)

(declare-fun res!133541 () Bool)

(declare-fun e!173792 () Bool)

(assert (=> b!269309 (=> (not res!133541) (not e!173792))))

(declare-datatypes ((array!13201 0))(
  ( (array!13202 (arr!6250 (Array (_ BitVec 32) (_ BitVec 64))) (size!6602 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13201)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269309 (= res!133541 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269310 () Bool)

(declare-datatypes ((Unit!8329 0))(
  ( (Unit!8330) )
))
(declare-fun e!173793 () Unit!8329)

(declare-fun Unit!8331 () Unit!8329)

(assert (=> b!269310 (= e!173793 Unit!8331)))

(declare-fun b!269311 () Bool)

(declare-fun e!173794 () Bool)

(assert (=> b!269311 (= e!173792 e!173794)))

(declare-fun res!133540 () Bool)

(assert (=> b!269311 (=> (not res!133540) (not e!173794))))

(declare-datatypes ((SeekEntryResult!1408 0))(
  ( (MissingZero!1408 (index!7802 (_ BitVec 32))) (Found!1408 (index!7803 (_ BitVec 32))) (Intermediate!1408 (undefined!2220 Bool) (index!7804 (_ BitVec 32)) (x!26149 (_ BitVec 32))) (Undefined!1408) (MissingVacant!1408 (index!7805 (_ BitVec 32))) )
))
(declare-fun lt!135158 () SeekEntryResult!1408)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269311 (= res!133540 (or (= lt!135158 (MissingZero!1408 i!1267)) (= lt!135158 (MissingVacant!1408 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13201 (_ BitVec 32)) SeekEntryResult!1408)

(assert (=> b!269311 (= lt!135158 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!269312 () Bool)

(declare-fun res!133537 () Bool)

(assert (=> b!269312 (=> (not res!133537) (not e!173792))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269312 (= res!133537 (and (= (size!6602 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6602 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6602 a!3325))))))

(declare-fun b!269313 () Bool)

(declare-fun res!133535 () Bool)

(assert (=> b!269313 (=> (not res!133535) (not e!173794))))

(assert (=> b!269313 (= res!133535 (= startIndex!26 i!1267))))

(declare-fun b!269314 () Bool)

(declare-fun res!133542 () Bool)

(assert (=> b!269314 (=> (not res!133542) (not e!173792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269314 (= res!133542 (validKeyInArray!0 k!2581))))

(declare-fun b!269315 () Bool)

(declare-fun res!133536 () Bool)

(assert (=> b!269315 (=> (not res!133536) (not e!173794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13201 (_ BitVec 32)) Bool)

(assert (=> b!269315 (= res!133536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!133539 () Bool)

(assert (=> start!26104 (=> (not res!133539) (not e!173792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26104 (= res!133539 (validMask!0 mask!3868))))

(assert (=> start!26104 e!173792))

(declare-fun array_inv!4213 (array!13201) Bool)

(assert (=> start!26104 (array_inv!4213 a!3325)))

(assert (=> start!26104 true))

(declare-fun b!269316 () Bool)

(assert (=> b!269316 (= e!173794 false)))

(declare-fun lt!135159 () Unit!8329)

(assert (=> b!269316 (= lt!135159 e!173793)))

(declare-fun c!45438 () Bool)

(assert (=> b!269316 (= c!45438 (bvslt startIndex!26 (bvsub (size!6602 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269317 () Bool)

(declare-fun lt!135160 () Unit!8329)

(assert (=> b!269317 (= e!173793 lt!135160)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13201 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8329)

(assert (=> b!269317 (= lt!135160 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269317 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13202 (store (arr!6250 a!3325) i!1267 k!2581) (size!6602 a!3325)) mask!3868)))

(declare-fun b!269318 () Bool)

(declare-fun res!133538 () Bool)

(assert (=> b!269318 (=> (not res!133538) (not e!173792))))

(declare-datatypes ((List!4058 0))(
  ( (Nil!4055) (Cons!4054 (h!4721 (_ BitVec 64)) (t!9140 List!4058)) )
))
(declare-fun arrayNoDuplicates!0 (array!13201 (_ BitVec 32) List!4058) Bool)

(assert (=> b!269318 (= res!133538 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4055))))

(assert (= (and start!26104 res!133539) b!269312))

(assert (= (and b!269312 res!133537) b!269314))

(assert (= (and b!269314 res!133542) b!269318))

(assert (= (and b!269318 res!133538) b!269309))

(assert (= (and b!269309 res!133541) b!269311))

(assert (= (and b!269311 res!133540) b!269315))

(assert (= (and b!269315 res!133536) b!269313))

(assert (= (and b!269313 res!133535) b!269316))

(assert (= (and b!269316 c!45438) b!269317))

(assert (= (and b!269316 (not c!45438)) b!269310))

(declare-fun m!285211 () Bool)

(assert (=> b!269314 m!285211))

(declare-fun m!285213 () Bool)

(assert (=> b!269315 m!285213))

(declare-fun m!285215 () Bool)

(assert (=> start!26104 m!285215))

(declare-fun m!285217 () Bool)

(assert (=> start!26104 m!285217))

(declare-fun m!285219 () Bool)

(assert (=> b!269311 m!285219))

(declare-fun m!285221 () Bool)

(assert (=> b!269317 m!285221))

(declare-fun m!285223 () Bool)

(assert (=> b!269317 m!285223))

(declare-fun m!285225 () Bool)

(assert (=> b!269317 m!285225))

(declare-fun m!285227 () Bool)

(assert (=> b!269309 m!285227))

(declare-fun m!285229 () Bool)

(assert (=> b!269318 m!285229))

(push 1)

(assert (not b!269314))

(assert (not b!269311))

(assert (not b!269315))

