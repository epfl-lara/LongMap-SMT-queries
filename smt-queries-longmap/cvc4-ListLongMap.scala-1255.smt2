; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26092 () Bool)

(assert start!26092)

(declare-fun b!269129 () Bool)

(declare-fun res!133398 () Bool)

(declare-fun e!173722 () Bool)

(assert (=> b!269129 (=> (not res!133398) (not e!173722))))

(declare-datatypes ((array!13189 0))(
  ( (array!13190 (arr!6244 (Array (_ BitVec 32) (_ BitVec 64))) (size!6596 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13189)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269129 (= res!133398 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269130 () Bool)

(declare-fun res!133392 () Bool)

(declare-fun e!173723 () Bool)

(assert (=> b!269130 (=> (not res!133392) (not e!173723))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269130 (= res!133392 (= startIndex!26 i!1267))))

(declare-fun b!269131 () Bool)

(assert (=> b!269131 (= e!173722 e!173723)))

(declare-fun res!133396 () Bool)

(assert (=> b!269131 (=> (not res!133396) (not e!173723))))

(declare-datatypes ((SeekEntryResult!1402 0))(
  ( (MissingZero!1402 (index!7778 (_ BitVec 32))) (Found!1402 (index!7779 (_ BitVec 32))) (Intermediate!1402 (undefined!2214 Bool) (index!7780 (_ BitVec 32)) (x!26127 (_ BitVec 32))) (Undefined!1402) (MissingVacant!1402 (index!7781 (_ BitVec 32))) )
))
(declare-fun lt!135104 () SeekEntryResult!1402)

(assert (=> b!269131 (= res!133396 (or (= lt!135104 (MissingZero!1402 i!1267)) (= lt!135104 (MissingVacant!1402 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13189 (_ BitVec 32)) SeekEntryResult!1402)

(assert (=> b!269131 (= lt!135104 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!269132 () Bool)

(declare-fun res!133395 () Bool)

(assert (=> b!269132 (=> (not res!133395) (not e!173722))))

(declare-datatypes ((List!4052 0))(
  ( (Nil!4049) (Cons!4048 (h!4715 (_ BitVec 64)) (t!9134 List!4052)) )
))
(declare-fun arrayNoDuplicates!0 (array!13189 (_ BitVec 32) List!4052) Bool)

(assert (=> b!269132 (= res!133395 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4049))))

(declare-fun res!133391 () Bool)

(assert (=> start!26092 (=> (not res!133391) (not e!173722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26092 (= res!133391 (validMask!0 mask!3868))))

(assert (=> start!26092 e!173722))

(declare-fun array_inv!4207 (array!13189) Bool)

(assert (=> start!26092 (array_inv!4207 a!3325)))

(assert (=> start!26092 true))

(declare-fun b!269133 () Bool)

(declare-fun res!133394 () Bool)

(assert (=> b!269133 (=> (not res!133394) (not e!173723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13189 (_ BitVec 32)) Bool)

(assert (=> b!269133 (= res!133394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269134 () Bool)

(declare-fun res!133397 () Bool)

(assert (=> b!269134 (=> (not res!133397) (not e!173722))))

(assert (=> b!269134 (= res!133397 (and (= (size!6596 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6596 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6596 a!3325))))))

(declare-fun b!269135 () Bool)

(declare-datatypes ((Unit!8311 0))(
  ( (Unit!8312) )
))
(declare-fun e!173720 () Unit!8311)

(declare-fun Unit!8313 () Unit!8311)

(assert (=> b!269135 (= e!173720 Unit!8313)))

(declare-fun b!269136 () Bool)

(declare-fun lt!135105 () Unit!8311)

(assert (=> b!269136 (= e!173720 lt!135105)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13189 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8311)

(assert (=> b!269136 (= lt!135105 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269136 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13190 (store (arr!6244 a!3325) i!1267 k!2581) (size!6596 a!3325)) mask!3868)))

(declare-fun b!269137 () Bool)

(declare-fun res!133393 () Bool)

(assert (=> b!269137 (=> (not res!133393) (not e!173722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269137 (= res!133393 (validKeyInArray!0 k!2581))))

(declare-fun b!269138 () Bool)

(assert (=> b!269138 (= e!173723 false)))

(declare-fun lt!135106 () Unit!8311)

(assert (=> b!269138 (= lt!135106 e!173720)))

(declare-fun c!45420 () Bool)

(assert (=> b!269138 (= c!45420 (bvslt startIndex!26 (bvsub (size!6596 a!3325) #b00000000000000000000000000000001)))))

(assert (= (and start!26092 res!133391) b!269134))

(assert (= (and b!269134 res!133397) b!269137))

(assert (= (and b!269137 res!133393) b!269132))

(assert (= (and b!269132 res!133395) b!269129))

(assert (= (and b!269129 res!133398) b!269131))

(assert (= (and b!269131 res!133396) b!269133))

(assert (= (and b!269133 res!133394) b!269130))

(assert (= (and b!269130 res!133392) b!269138))

(assert (= (and b!269138 c!45420) b!269136))

(assert (= (and b!269138 (not c!45420)) b!269135))

(declare-fun m!285091 () Bool)

(assert (=> b!269132 m!285091))

(declare-fun m!285093 () Bool)

(assert (=> b!269133 m!285093))

(declare-fun m!285095 () Bool)

(assert (=> b!269137 m!285095))

(declare-fun m!285097 () Bool)

(assert (=> b!269129 m!285097))

(declare-fun m!285099 () Bool)

(assert (=> start!26092 m!285099))

(declare-fun m!285101 () Bool)

(assert (=> start!26092 m!285101))

(declare-fun m!285103 () Bool)

(assert (=> b!269136 m!285103))

(declare-fun m!285105 () Bool)

(assert (=> b!269136 m!285105))

(declare-fun m!285107 () Bool)

(assert (=> b!269136 m!285107))

(declare-fun m!285109 () Bool)

(assert (=> b!269131 m!285109))

(push 1)

(assert (not b!269131))

(assert (not start!26092))

(assert (not b!269133))

(assert (not b!269136))

(assert (not b!269132))

(assert (not b!269137))

(assert (not b!269129))

