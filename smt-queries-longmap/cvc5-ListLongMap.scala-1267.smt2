; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26160 () Bool)

(assert start!26160)

(declare-fun b!270149 () Bool)

(declare-fun e!174167 () Bool)

(assert (=> b!270149 (= e!174167 (not true))))

(declare-datatypes ((array!13257 0))(
  ( (array!13258 (arr!6278 (Array (_ BitVec 32) (_ BitVec 64))) (size!6630 (_ BitVec 32))) )
))
(declare-fun lt!135486 () array!13257)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1436 0))(
  ( (MissingZero!1436 (index!7914 (_ BitVec 32))) (Found!1436 (index!7915 (_ BitVec 32))) (Intermediate!1436 (undefined!2248 Bool) (index!7916 (_ BitVec 32)) (x!26257 (_ BitVec 32))) (Undefined!1436) (MissingVacant!1436 (index!7917 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13257 (_ BitVec 32)) SeekEntryResult!1436)

(assert (=> b!270149 (= (seekEntryOrOpen!0 k!2581 lt!135486 mask!3868) (Found!1436 i!1267))))

(declare-datatypes ((Unit!8413 0))(
  ( (Unit!8414) )
))
(declare-fun lt!135488 () Unit!8413)

(declare-fun a!3325 () array!13257)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8413)

(assert (=> b!270149 (= lt!135488 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135487 () Unit!8413)

(declare-fun e!174168 () Unit!8413)

(assert (=> b!270149 (= lt!135487 e!174168)))

(declare-fun c!45522 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270149 (= c!45522 (bvslt startIndex!26 (bvsub (size!6630 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270150 () Bool)

(declare-fun res!134212 () Bool)

(declare-fun e!174169 () Bool)

(assert (=> b!270150 (=> (not res!134212) (not e!174169))))

(assert (=> b!270150 (= res!134212 (and (= (size!6630 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6630 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6630 a!3325))))))

(declare-fun b!270151 () Bool)

(declare-fun lt!135489 () Unit!8413)

(assert (=> b!270151 (= e!174168 lt!135489)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8413)

(assert (=> b!270151 (= lt!135489 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13257 (_ BitVec 32)) Bool)

(assert (=> b!270151 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135486 mask!3868)))

(declare-fun b!270152 () Bool)

(declare-fun res!134209 () Bool)

(declare-fun e!174170 () Bool)

(assert (=> b!270152 (=> (not res!134209) (not e!174170))))

(assert (=> b!270152 (= res!134209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270153 () Bool)

(declare-fun res!134213 () Bool)

(assert (=> b!270153 (=> (not res!134213) (not e!174169))))

(declare-datatypes ((List!4086 0))(
  ( (Nil!4083) (Cons!4082 (h!4749 (_ BitVec 64)) (t!9168 List!4086)) )
))
(declare-fun arrayNoDuplicates!0 (array!13257 (_ BitVec 32) List!4086) Bool)

(assert (=> b!270153 (= res!134213 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4083))))

(declare-fun b!270154 () Bool)

(assert (=> b!270154 (= e!174170 e!174167)))

(declare-fun res!134210 () Bool)

(assert (=> b!270154 (=> (not res!134210) (not e!174167))))

(assert (=> b!270154 (= res!134210 (= startIndex!26 i!1267))))

(assert (=> b!270154 (= lt!135486 (array!13258 (store (arr!6278 a!3325) i!1267 k!2581) (size!6630 a!3325)))))

(declare-fun res!134208 () Bool)

(assert (=> start!26160 (=> (not res!134208) (not e!174169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26160 (= res!134208 (validMask!0 mask!3868))))

(assert (=> start!26160 e!174169))

(declare-fun array_inv!4241 (array!13257) Bool)

(assert (=> start!26160 (array_inv!4241 a!3325)))

(assert (=> start!26160 true))

(declare-fun b!270155 () Bool)

(declare-fun Unit!8415 () Unit!8413)

(assert (=> b!270155 (= e!174168 Unit!8415)))

(declare-fun b!270156 () Bool)

(declare-fun res!134207 () Bool)

(assert (=> b!270156 (=> (not res!134207) (not e!174169))))

(declare-fun arrayContainsKey!0 (array!13257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270156 (= res!134207 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270157 () Bool)

(declare-fun res!134211 () Bool)

(assert (=> b!270157 (=> (not res!134211) (not e!174169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270157 (= res!134211 (validKeyInArray!0 k!2581))))

(declare-fun b!270158 () Bool)

(assert (=> b!270158 (= e!174169 e!174170)))

(declare-fun res!134214 () Bool)

(assert (=> b!270158 (=> (not res!134214) (not e!174170))))

(declare-fun lt!135490 () SeekEntryResult!1436)

(assert (=> b!270158 (= res!134214 (or (= lt!135490 (MissingZero!1436 i!1267)) (= lt!135490 (MissingVacant!1436 i!1267))))))

(assert (=> b!270158 (= lt!135490 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26160 res!134208) b!270150))

(assert (= (and b!270150 res!134212) b!270157))

(assert (= (and b!270157 res!134211) b!270153))

(assert (= (and b!270153 res!134213) b!270156))

(assert (= (and b!270156 res!134207) b!270158))

(assert (= (and b!270158 res!134214) b!270152))

(assert (= (and b!270152 res!134209) b!270154))

(assert (= (and b!270154 res!134210) b!270149))

(assert (= (and b!270149 c!45522) b!270151))

(assert (= (and b!270149 (not c!45522)) b!270155))

(declare-fun m!285819 () Bool)

(assert (=> b!270156 m!285819))

(declare-fun m!285821 () Bool)

(assert (=> b!270149 m!285821))

(declare-fun m!285823 () Bool)

(assert (=> b!270149 m!285823))

(declare-fun m!285825 () Bool)

(assert (=> b!270151 m!285825))

(declare-fun m!285827 () Bool)

(assert (=> b!270151 m!285827))

(declare-fun m!285829 () Bool)

(assert (=> b!270153 m!285829))

(declare-fun m!285831 () Bool)

(assert (=> start!26160 m!285831))

(declare-fun m!285833 () Bool)

(assert (=> start!26160 m!285833))

(declare-fun m!285835 () Bool)

(assert (=> b!270152 m!285835))

(declare-fun m!285837 () Bool)

(assert (=> b!270154 m!285837))

(declare-fun m!285839 () Bool)

(assert (=> b!270157 m!285839))

(declare-fun m!285841 () Bool)

(assert (=> b!270158 m!285841))

(push 1)

