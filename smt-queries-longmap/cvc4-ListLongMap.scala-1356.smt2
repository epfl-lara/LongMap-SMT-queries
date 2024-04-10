; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26698 () Bool)

(assert start!26698)

(declare-fun b!277148 () Bool)

(declare-fun e!176935 () Bool)

(assert (=> b!277148 (= e!176935 false)))

(declare-datatypes ((Unit!8716 0))(
  ( (Unit!8717) )
))
(declare-fun lt!137851 () Unit!8716)

(declare-fun e!176933 () Unit!8716)

(assert (=> b!277148 (= lt!137851 e!176933)))

(declare-fun c!45573 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13795 0))(
  ( (array!13796 (arr!6547 (Array (_ BitVec 32) (_ BitVec 64))) (size!6899 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13795)

(assert (=> b!277148 (= c!45573 (bvslt startIndex!26 (bvsub (size!6899 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!141110 () Bool)

(declare-fun e!176934 () Bool)

(assert (=> start!26698 (=> (not res!141110) (not e!176934))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26698 (= res!141110 (validMask!0 mask!3868))))

(assert (=> start!26698 e!176934))

(declare-fun array_inv!4510 (array!13795) Bool)

(assert (=> start!26698 (array_inv!4510 a!3325)))

(assert (=> start!26698 true))

(declare-fun b!277149 () Bool)

(declare-fun res!141111 () Bool)

(assert (=> b!277149 (=> (not res!141111) (not e!176934))))

(declare-datatypes ((List!4355 0))(
  ( (Nil!4352) (Cons!4351 (h!5018 (_ BitVec 64)) (t!9437 List!4355)) )
))
(declare-fun arrayNoDuplicates!0 (array!13795 (_ BitVec 32) List!4355) Bool)

(assert (=> b!277149 (= res!141111 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4352))))

(declare-fun b!277150 () Bool)

(declare-fun lt!137850 () Unit!8716)

(assert (=> b!277150 (= e!176933 lt!137850)))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13795 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8716)

(assert (=> b!277150 (= lt!137850 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13795 (_ BitVec 32)) Bool)

(assert (=> b!277150 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13796 (store (arr!6547 a!3325) i!1267 k!2581) (size!6899 a!3325)) mask!3868)))

(declare-fun b!277151 () Bool)

(declare-fun res!141105 () Bool)

(assert (=> b!277151 (=> (not res!141105) (not e!176934))))

(declare-fun arrayContainsKey!0 (array!13795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277151 (= res!141105 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277152 () Bool)

(declare-fun res!141106 () Bool)

(assert (=> b!277152 (=> (not res!141106) (not e!176935))))

(assert (=> b!277152 (= res!141106 (= startIndex!26 i!1267))))

(declare-fun b!277153 () Bool)

(declare-fun res!141108 () Bool)

(assert (=> b!277153 (=> (not res!141108) (not e!176934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277153 (= res!141108 (validKeyInArray!0 k!2581))))

(declare-fun b!277154 () Bool)

(declare-fun Unit!8718 () Unit!8716)

(assert (=> b!277154 (= e!176933 Unit!8718)))

(declare-fun b!277155 () Bool)

(assert (=> b!277155 (= e!176934 e!176935)))

(declare-fun res!141109 () Bool)

(assert (=> b!277155 (=> (not res!141109) (not e!176935))))

(declare-datatypes ((SeekEntryResult!1705 0))(
  ( (MissingZero!1705 (index!8990 (_ BitVec 32))) (Found!1705 (index!8991 (_ BitVec 32))) (Intermediate!1705 (undefined!2517 Bool) (index!8992 (_ BitVec 32)) (x!27238 (_ BitVec 32))) (Undefined!1705) (MissingVacant!1705 (index!8993 (_ BitVec 32))) )
))
(declare-fun lt!137849 () SeekEntryResult!1705)

(assert (=> b!277155 (= res!141109 (or (= lt!137849 (MissingZero!1705 i!1267)) (= lt!137849 (MissingVacant!1705 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13795 (_ BitVec 32)) SeekEntryResult!1705)

(assert (=> b!277155 (= lt!137849 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277156 () Bool)

(declare-fun res!141107 () Bool)

(assert (=> b!277156 (=> (not res!141107) (not e!176934))))

(assert (=> b!277156 (= res!141107 (and (= (size!6899 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6899 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6899 a!3325))))))

(declare-fun b!277157 () Bool)

(declare-fun res!141104 () Bool)

(assert (=> b!277157 (=> (not res!141104) (not e!176935))))

(assert (=> b!277157 (= res!141104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26698 res!141110) b!277156))

(assert (= (and b!277156 res!141107) b!277153))

(assert (= (and b!277153 res!141108) b!277149))

(assert (= (and b!277149 res!141111) b!277151))

(assert (= (and b!277151 res!141105) b!277155))

(assert (= (and b!277155 res!141109) b!277157))

(assert (= (and b!277157 res!141104) b!277152))

(assert (= (and b!277152 res!141106) b!277148))

(assert (= (and b!277148 c!45573) b!277150))

(assert (= (and b!277148 (not c!45573)) b!277154))

(declare-fun m!292291 () Bool)

(assert (=> b!277151 m!292291))

(declare-fun m!292293 () Bool)

(assert (=> start!26698 m!292293))

(declare-fun m!292295 () Bool)

(assert (=> start!26698 m!292295))

(declare-fun m!292297 () Bool)

(assert (=> b!277153 m!292297))

(declare-fun m!292299 () Bool)

(assert (=> b!277150 m!292299))

(declare-fun m!292301 () Bool)

(assert (=> b!277150 m!292301))

(declare-fun m!292303 () Bool)

(assert (=> b!277150 m!292303))

(declare-fun m!292305 () Bool)

(assert (=> b!277157 m!292305))

(declare-fun m!292307 () Bool)

(assert (=> b!277155 m!292307))

(declare-fun m!292309 () Bool)

(assert (=> b!277149 m!292309))

(push 1)

(assert (not start!26698))

(assert (not b!277155))

(assert (not b!277151))

(assert (not b!277150))

(assert (not b!277157))

(assert (not b!277153))

(assert (not b!277149))

