; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26154 () Bool)

(assert start!26154)

(declare-fun b!270059 () Bool)

(declare-fun e!174125 () Bool)

(declare-fun e!174123 () Bool)

(assert (=> b!270059 (= e!174125 e!174123)))

(declare-fun res!134135 () Bool)

(assert (=> b!270059 (=> (not res!134135) (not e!174123))))

(declare-datatypes ((SeekEntryResult!1433 0))(
  ( (MissingZero!1433 (index!7902 (_ BitVec 32))) (Found!1433 (index!7903 (_ BitVec 32))) (Intermediate!1433 (undefined!2245 Bool) (index!7904 (_ BitVec 32)) (x!26246 (_ BitVec 32))) (Undefined!1433) (MissingVacant!1433 (index!7905 (_ BitVec 32))) )
))
(declare-fun lt!135444 () SeekEntryResult!1433)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270059 (= res!134135 (or (= lt!135444 (MissingZero!1433 i!1267)) (= lt!135444 (MissingVacant!1433 i!1267))))))

(declare-datatypes ((array!13251 0))(
  ( (array!13252 (arr!6275 (Array (_ BitVec 32) (_ BitVec 64))) (size!6627 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13251)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13251 (_ BitVec 32)) SeekEntryResult!1433)

(assert (=> b!270059 (= lt!135444 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!270060 () Bool)

(declare-fun e!174121 () Bool)

(assert (=> b!270060 (= e!174123 e!174121)))

(declare-fun res!134140 () Bool)

(assert (=> b!270060 (=> (not res!134140) (not e!174121))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270060 (= res!134140 (= startIndex!26 i!1267))))

(declare-fun lt!135445 () array!13251)

(assert (=> b!270060 (= lt!135445 (array!13252 (store (arr!6275 a!3325) i!1267 k!2581) (size!6627 a!3325)))))

(declare-fun b!270061 () Bool)

(declare-fun res!134137 () Bool)

(assert (=> b!270061 (=> (not res!134137) (not e!174125))))

(assert (=> b!270061 (= res!134137 (and (= (size!6627 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6627 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6627 a!3325))))))

(declare-fun b!270062 () Bool)

(declare-fun res!134136 () Bool)

(assert (=> b!270062 (=> (not res!134136) (not e!174123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13251 (_ BitVec 32)) Bool)

(assert (=> b!270062 (= res!134136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270063 () Bool)

(declare-fun res!134139 () Bool)

(assert (=> b!270063 (=> (not res!134139) (not e!174125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270063 (= res!134139 (validKeyInArray!0 k!2581))))

(declare-fun res!134142 () Bool)

(assert (=> start!26154 (=> (not res!134142) (not e!174125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26154 (= res!134142 (validMask!0 mask!3868))))

(assert (=> start!26154 e!174125))

(declare-fun array_inv!4238 (array!13251) Bool)

(assert (=> start!26154 (array_inv!4238 a!3325)))

(assert (=> start!26154 true))

(declare-fun b!270064 () Bool)

(declare-fun res!134138 () Bool)

(assert (=> b!270064 (=> (not res!134138) (not e!174125))))

(declare-fun arrayContainsKey!0 (array!13251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270064 (= res!134138 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270065 () Bool)

(assert (=> b!270065 (= e!174121 (not true))))

(assert (=> b!270065 (= (seekEntryOrOpen!0 k!2581 lt!135445 mask!3868) (Found!1433 i!1267))))

(declare-datatypes ((Unit!8404 0))(
  ( (Unit!8405) )
))
(declare-fun lt!135443 () Unit!8404)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13251 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8404)

(assert (=> b!270065 (= lt!135443 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135441 () Unit!8404)

(declare-fun e!174124 () Unit!8404)

(assert (=> b!270065 (= lt!135441 e!174124)))

(declare-fun c!45513 () Bool)

(assert (=> b!270065 (= c!45513 (bvslt startIndex!26 (bvsub (size!6627 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270066 () Bool)

(declare-fun res!134141 () Bool)

(assert (=> b!270066 (=> (not res!134141) (not e!174125))))

(declare-datatypes ((List!4083 0))(
  ( (Nil!4080) (Cons!4079 (h!4746 (_ BitVec 64)) (t!9165 List!4083)) )
))
(declare-fun arrayNoDuplicates!0 (array!13251 (_ BitVec 32) List!4083) Bool)

(assert (=> b!270066 (= res!134141 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4080))))

(declare-fun b!270067 () Bool)

(declare-fun lt!135442 () Unit!8404)

(assert (=> b!270067 (= e!174124 lt!135442)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13251 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8404)

(assert (=> b!270067 (= lt!135442 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!270067 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135445 mask!3868)))

(declare-fun b!270068 () Bool)

(declare-fun Unit!8406 () Unit!8404)

(assert (=> b!270068 (= e!174124 Unit!8406)))

(assert (= (and start!26154 res!134142) b!270061))

(assert (= (and b!270061 res!134137) b!270063))

(assert (= (and b!270063 res!134139) b!270066))

(assert (= (and b!270066 res!134141) b!270064))

(assert (= (and b!270064 res!134138) b!270059))

(assert (= (and b!270059 res!134135) b!270062))

(assert (= (and b!270062 res!134136) b!270060))

(assert (= (and b!270060 res!134140) b!270065))

(assert (= (and b!270065 c!45513) b!270067))

(assert (= (and b!270065 (not c!45513)) b!270068))

(declare-fun m!285747 () Bool)

(assert (=> b!270059 m!285747))

(declare-fun m!285749 () Bool)

(assert (=> b!270060 m!285749))

(declare-fun m!285751 () Bool)

(assert (=> b!270067 m!285751))

(declare-fun m!285753 () Bool)

(assert (=> b!270067 m!285753))

(declare-fun m!285755 () Bool)

(assert (=> b!270063 m!285755))

(declare-fun m!285757 () Bool)

(assert (=> b!270065 m!285757))

(declare-fun m!285759 () Bool)

(assert (=> b!270065 m!285759))

(declare-fun m!285761 () Bool)

(assert (=> b!270062 m!285761))

(declare-fun m!285763 () Bool)

(assert (=> start!26154 m!285763))

(declare-fun m!285765 () Bool)

(assert (=> start!26154 m!285765))

(declare-fun m!285767 () Bool)

(assert (=> b!270066 m!285767))

(declare-fun m!285769 () Bool)

(assert (=> b!270064 m!285769))

(push 1)

(assert (not b!270065))

(assert (not b!270062))

(assert (not b!270064))

