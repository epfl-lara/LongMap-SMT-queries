; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26170 () Bool)

(assert start!26170)

(declare-fun b!270299 () Bool)

(declare-fun res!134334 () Bool)

(declare-fun e!174245 () Bool)

(assert (=> b!270299 (=> (not res!134334) (not e!174245))))

(declare-datatypes ((array!13267 0))(
  ( (array!13268 (arr!6283 (Array (_ BitVec 32) (_ BitVec 64))) (size!6635 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13267)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270299 (= res!134334 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270300 () Bool)

(declare-datatypes ((Unit!8428 0))(
  ( (Unit!8429) )
))
(declare-fun e!174244 () Unit!8428)

(declare-fun Unit!8430 () Unit!8428)

(assert (=> b!270300 (= e!174244 Unit!8430)))

(declare-fun b!270301 () Bool)

(declare-fun e!174243 () Bool)

(assert (=> b!270301 (= e!174245 e!174243)))

(declare-fun res!134330 () Bool)

(assert (=> b!270301 (=> (not res!134330) (not e!174243))))

(declare-datatypes ((SeekEntryResult!1441 0))(
  ( (MissingZero!1441 (index!7934 (_ BitVec 32))) (Found!1441 (index!7935 (_ BitVec 32))) (Intermediate!1441 (undefined!2253 Bool) (index!7936 (_ BitVec 32)) (x!26270 (_ BitVec 32))) (Undefined!1441) (MissingVacant!1441 (index!7937 (_ BitVec 32))) )
))
(declare-fun lt!135565 () SeekEntryResult!1441)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270301 (= res!134330 (or (= lt!135565 (MissingZero!1441 i!1267)) (= lt!135565 (MissingVacant!1441 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13267 (_ BitVec 32)) SeekEntryResult!1441)

(assert (=> b!270301 (= lt!135565 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!270302 () Bool)

(declare-fun e!174242 () Bool)

(assert (=> b!270302 (= e!174242 (not true))))

(declare-fun lt!135563 () array!13267)

(assert (=> b!270302 (= (seekEntryOrOpen!0 k!2581 lt!135563 mask!3868) (Found!1441 i!1267))))

(declare-fun lt!135561 () Unit!8428)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13267 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8428)

(assert (=> b!270302 (= lt!135561 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135562 () Unit!8428)

(assert (=> b!270302 (= lt!135562 e!174244)))

(declare-fun c!45537 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270302 (= c!45537 (bvslt startIndex!26 (bvsub (size!6635 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270303 () Bool)

(declare-fun res!134327 () Bool)

(assert (=> b!270303 (=> (not res!134327) (not e!174245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270303 (= res!134327 (validKeyInArray!0 k!2581))))

(declare-fun b!270304 () Bool)

(assert (=> b!270304 (= e!174243 e!174242)))

(declare-fun res!134331 () Bool)

(assert (=> b!270304 (=> (not res!134331) (not e!174242))))

(assert (=> b!270304 (= res!134331 (= startIndex!26 i!1267))))

(assert (=> b!270304 (= lt!135563 (array!13268 (store (arr!6283 a!3325) i!1267 k!2581) (size!6635 a!3325)))))

(declare-fun res!134332 () Bool)

(assert (=> start!26170 (=> (not res!134332) (not e!174245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26170 (= res!134332 (validMask!0 mask!3868))))

(assert (=> start!26170 e!174245))

(declare-fun array_inv!4246 (array!13267) Bool)

(assert (=> start!26170 (array_inv!4246 a!3325)))

(assert (=> start!26170 true))

(declare-fun b!270305 () Bool)

(declare-fun res!134333 () Bool)

(assert (=> b!270305 (=> (not res!134333) (not e!174243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13267 (_ BitVec 32)) Bool)

(assert (=> b!270305 (= res!134333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270306 () Bool)

(declare-fun res!134328 () Bool)

(assert (=> b!270306 (=> (not res!134328) (not e!174245))))

(assert (=> b!270306 (= res!134328 (and (= (size!6635 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6635 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6635 a!3325))))))

(declare-fun b!270307 () Bool)

(declare-fun lt!135564 () Unit!8428)

(assert (=> b!270307 (= e!174244 lt!135564)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13267 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8428)

(assert (=> b!270307 (= lt!135564 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!270307 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135563 mask!3868)))

(declare-fun b!270308 () Bool)

(declare-fun res!134329 () Bool)

(assert (=> b!270308 (=> (not res!134329) (not e!174245))))

(declare-datatypes ((List!4091 0))(
  ( (Nil!4088) (Cons!4087 (h!4754 (_ BitVec 64)) (t!9173 List!4091)) )
))
(declare-fun arrayNoDuplicates!0 (array!13267 (_ BitVec 32) List!4091) Bool)

(assert (=> b!270308 (= res!134329 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4088))))

(assert (= (and start!26170 res!134332) b!270306))

(assert (= (and b!270306 res!134328) b!270303))

(assert (= (and b!270303 res!134327) b!270308))

(assert (= (and b!270308 res!134329) b!270299))

(assert (= (and b!270299 res!134334) b!270301))

(assert (= (and b!270301 res!134330) b!270305))

(assert (= (and b!270305 res!134333) b!270304))

(assert (= (and b!270304 res!134331) b!270302))

(assert (= (and b!270302 c!45537) b!270307))

(assert (= (and b!270302 (not c!45537)) b!270300))

(declare-fun m!285939 () Bool)

(assert (=> b!270299 m!285939))

(declare-fun m!285941 () Bool)

(assert (=> b!270303 m!285941))

(declare-fun m!285943 () Bool)

(assert (=> b!270302 m!285943))

(declare-fun m!285945 () Bool)

(assert (=> b!270302 m!285945))

(declare-fun m!285947 () Bool)

(assert (=> b!270301 m!285947))

(declare-fun m!285949 () Bool)

(assert (=> b!270305 m!285949))

(declare-fun m!285951 () Bool)

(assert (=> b!270308 m!285951))

(declare-fun m!285953 () Bool)

(assert (=> b!270304 m!285953))

(declare-fun m!285955 () Bool)

(assert (=> start!26170 m!285955))

(declare-fun m!285957 () Bool)

(assert (=> start!26170 m!285957))

(declare-fun m!285959 () Bool)

(assert (=> b!270307 m!285959))

(declare-fun m!285961 () Bool)

(assert (=> b!270307 m!285961))

(push 1)

(assert (not b!270307))

(assert (not start!26170))

(assert (not b!270299))

(assert (not b!270302))

(assert (not b!270305))

(assert (not b!270301))

