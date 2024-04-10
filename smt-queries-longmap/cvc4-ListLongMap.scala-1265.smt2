; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26152 () Bool)

(assert start!26152)

(declare-fun res!134117 () Bool)

(declare-fun e!174108 () Bool)

(assert (=> start!26152 (=> (not res!134117) (not e!174108))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26152 (= res!134117 (validMask!0 mask!3868))))

(assert (=> start!26152 e!174108))

(declare-datatypes ((array!13249 0))(
  ( (array!13250 (arr!6274 (Array (_ BitVec 32) (_ BitVec 64))) (size!6626 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13249)

(declare-fun array_inv!4237 (array!13249) Bool)

(assert (=> start!26152 (array_inv!4237 a!3325)))

(assert (=> start!26152 true))

(declare-fun b!270029 () Bool)

(declare-fun res!134115 () Bool)

(declare-fun e!174106 () Bool)

(assert (=> b!270029 (=> (not res!134115) (not e!174106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13249 (_ BitVec 32)) Bool)

(assert (=> b!270029 (= res!134115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270030 () Bool)

(declare-fun e!174107 () Bool)

(assert (=> b!270030 (= e!174106 e!174107)))

(declare-fun res!134113 () Bool)

(assert (=> b!270030 (=> (not res!134113) (not e!174107))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270030 (= res!134113 (= startIndex!26 i!1267))))

(declare-fun lt!135427 () array!13249)

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!270030 (= lt!135427 (array!13250 (store (arr!6274 a!3325) i!1267 k!2581) (size!6626 a!3325)))))

(declare-fun b!270031 () Bool)

(declare-fun res!134114 () Bool)

(assert (=> b!270031 (=> (not res!134114) (not e!174108))))

(assert (=> b!270031 (= res!134114 (and (= (size!6626 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6626 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6626 a!3325))))))

(declare-fun b!270032 () Bool)

(declare-datatypes ((Unit!8401 0))(
  ( (Unit!8402) )
))
(declare-fun e!174109 () Unit!8401)

(declare-fun Unit!8403 () Unit!8401)

(assert (=> b!270032 (= e!174109 Unit!8403)))

(declare-fun b!270033 () Bool)

(assert (=> b!270033 (= e!174107 (not true))))

(declare-datatypes ((SeekEntryResult!1432 0))(
  ( (MissingZero!1432 (index!7898 (_ BitVec 32))) (Found!1432 (index!7899 (_ BitVec 32))) (Intermediate!1432 (undefined!2244 Bool) (index!7900 (_ BitVec 32)) (x!26237 (_ BitVec 32))) (Undefined!1432) (MissingVacant!1432 (index!7901 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13249 (_ BitVec 32)) SeekEntryResult!1432)

(assert (=> b!270033 (= (seekEntryOrOpen!0 k!2581 lt!135427 mask!3868) (Found!1432 i!1267))))

(declare-fun lt!135429 () Unit!8401)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13249 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8401)

(assert (=> b!270033 (= lt!135429 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135430 () Unit!8401)

(assert (=> b!270033 (= lt!135430 e!174109)))

(declare-fun c!45510 () Bool)

(assert (=> b!270033 (= c!45510 (bvslt startIndex!26 (bvsub (size!6626 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270034 () Bool)

(declare-fun lt!135428 () Unit!8401)

(assert (=> b!270034 (= e!174109 lt!135428)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13249 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8401)

(assert (=> b!270034 (= lt!135428 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!270034 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135427 mask!3868)))

(declare-fun b!270035 () Bool)

(assert (=> b!270035 (= e!174108 e!174106)))

(declare-fun res!134111 () Bool)

(assert (=> b!270035 (=> (not res!134111) (not e!174106))))

(declare-fun lt!135426 () SeekEntryResult!1432)

(assert (=> b!270035 (= res!134111 (or (= lt!135426 (MissingZero!1432 i!1267)) (= lt!135426 (MissingVacant!1432 i!1267))))))

(assert (=> b!270035 (= lt!135426 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!270036 () Bool)

(declare-fun res!134112 () Bool)

(assert (=> b!270036 (=> (not res!134112) (not e!174108))))

(declare-datatypes ((List!4082 0))(
  ( (Nil!4079) (Cons!4078 (h!4745 (_ BitVec 64)) (t!9164 List!4082)) )
))
(declare-fun arrayNoDuplicates!0 (array!13249 (_ BitVec 32) List!4082) Bool)

(assert (=> b!270036 (= res!134112 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4079))))

(declare-fun b!270037 () Bool)

(declare-fun res!134116 () Bool)

(assert (=> b!270037 (=> (not res!134116) (not e!174108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270037 (= res!134116 (validKeyInArray!0 k!2581))))

(declare-fun b!270038 () Bool)

(declare-fun res!134118 () Bool)

(assert (=> b!270038 (=> (not res!134118) (not e!174108))))

(declare-fun arrayContainsKey!0 (array!13249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270038 (= res!134118 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26152 res!134117) b!270031))

(assert (= (and b!270031 res!134114) b!270037))

(assert (= (and b!270037 res!134116) b!270036))

(assert (= (and b!270036 res!134112) b!270038))

(assert (= (and b!270038 res!134118) b!270035))

(assert (= (and b!270035 res!134111) b!270029))

(assert (= (and b!270029 res!134115) b!270030))

(assert (= (and b!270030 res!134113) b!270033))

(assert (= (and b!270033 c!45510) b!270034))

(assert (= (and b!270033 (not c!45510)) b!270032))

(declare-fun m!285723 () Bool)

(assert (=> b!270029 m!285723))

(declare-fun m!285725 () Bool)

(assert (=> b!270034 m!285725))

(declare-fun m!285727 () Bool)

(assert (=> b!270034 m!285727))

(declare-fun m!285729 () Bool)

(assert (=> b!270038 m!285729))

(declare-fun m!285731 () Bool)

(assert (=> b!270036 m!285731))

(declare-fun m!285733 () Bool)

(assert (=> b!270033 m!285733))

(declare-fun m!285735 () Bool)

(assert (=> b!270033 m!285735))

(declare-fun m!285737 () Bool)

(assert (=> start!26152 m!285737))

(declare-fun m!285739 () Bool)

(assert (=> start!26152 m!285739))

(declare-fun m!285741 () Bool)

(assert (=> b!270037 m!285741))

(declare-fun m!285743 () Bool)

(assert (=> b!270030 m!285743))

(declare-fun m!285745 () Bool)

(assert (=> b!270035 m!285745))

(push 1)

(assert (not b!270029))

(assert (not b!270038))

(assert (not start!26152))

