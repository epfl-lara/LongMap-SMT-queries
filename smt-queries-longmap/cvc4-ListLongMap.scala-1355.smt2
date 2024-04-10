; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26692 () Bool)

(assert start!26692)

(declare-fun b!277058 () Bool)

(declare-fun e!176898 () Bool)

(assert (=> b!277058 (= e!176898 false)))

(declare-datatypes ((Unit!8707 0))(
  ( (Unit!8708) )
))
(declare-fun lt!137823 () Unit!8707)

(declare-fun e!176897 () Unit!8707)

(assert (=> b!277058 (= lt!137823 e!176897)))

(declare-fun c!45564 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13789 0))(
  ( (array!13790 (arr!6544 (Array (_ BitVec 32) (_ BitVec 64))) (size!6896 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13789)

(assert (=> b!277058 (= c!45564 (bvslt startIndex!26 (bvsub (size!6896 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277059 () Bool)

(declare-fun res!141038 () Bool)

(declare-fun e!176899 () Bool)

(assert (=> b!277059 (=> (not res!141038) (not e!176899))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277059 (= res!141038 (validKeyInArray!0 k!2581))))

(declare-fun res!141035 () Bool)

(assert (=> start!26692 (=> (not res!141035) (not e!176899))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26692 (= res!141035 (validMask!0 mask!3868))))

(assert (=> start!26692 e!176899))

(declare-fun array_inv!4507 (array!13789) Bool)

(assert (=> start!26692 (array_inv!4507 a!3325)))

(assert (=> start!26692 true))

(declare-fun b!277060 () Bool)

(declare-fun lt!137822 () Unit!8707)

(assert (=> b!277060 (= e!176897 lt!137822)))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13789 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8707)

(assert (=> b!277060 (= lt!137822 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13789 (_ BitVec 32)) Bool)

(assert (=> b!277060 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13790 (store (arr!6544 a!3325) i!1267 k!2581) (size!6896 a!3325)) mask!3868)))

(declare-fun b!277061 () Bool)

(declare-fun res!141034 () Bool)

(assert (=> b!277061 (=> (not res!141034) (not e!176899))))

(declare-fun arrayContainsKey!0 (array!13789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277061 (= res!141034 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277062 () Bool)

(declare-fun res!141032 () Bool)

(assert (=> b!277062 (=> (not res!141032) (not e!176899))))

(assert (=> b!277062 (= res!141032 (and (= (size!6896 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6896 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6896 a!3325))))))

(declare-fun b!277063 () Bool)

(assert (=> b!277063 (= e!176899 e!176898)))

(declare-fun res!141033 () Bool)

(assert (=> b!277063 (=> (not res!141033) (not e!176898))))

(declare-datatypes ((SeekEntryResult!1702 0))(
  ( (MissingZero!1702 (index!8978 (_ BitVec 32))) (Found!1702 (index!8979 (_ BitVec 32))) (Intermediate!1702 (undefined!2514 Bool) (index!8980 (_ BitVec 32)) (x!27227 (_ BitVec 32))) (Undefined!1702) (MissingVacant!1702 (index!8981 (_ BitVec 32))) )
))
(declare-fun lt!137824 () SeekEntryResult!1702)

(assert (=> b!277063 (= res!141033 (or (= lt!137824 (MissingZero!1702 i!1267)) (= lt!137824 (MissingVacant!1702 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13789 (_ BitVec 32)) SeekEntryResult!1702)

(assert (=> b!277063 (= lt!137824 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277064 () Bool)

(declare-fun Unit!8709 () Unit!8707)

(assert (=> b!277064 (= e!176897 Unit!8709)))

(declare-fun b!277065 () Bool)

(declare-fun res!141039 () Bool)

(assert (=> b!277065 (=> (not res!141039) (not e!176899))))

(declare-datatypes ((List!4352 0))(
  ( (Nil!4349) (Cons!4348 (h!5015 (_ BitVec 64)) (t!9434 List!4352)) )
))
(declare-fun arrayNoDuplicates!0 (array!13789 (_ BitVec 32) List!4352) Bool)

(assert (=> b!277065 (= res!141039 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4349))))

(declare-fun b!277066 () Bool)

(declare-fun res!141036 () Bool)

(assert (=> b!277066 (=> (not res!141036) (not e!176898))))

(assert (=> b!277066 (= res!141036 (= startIndex!26 i!1267))))

(declare-fun b!277067 () Bool)

(declare-fun res!141037 () Bool)

(assert (=> b!277067 (=> (not res!141037) (not e!176898))))

(assert (=> b!277067 (= res!141037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26692 res!141035) b!277062))

(assert (= (and b!277062 res!141032) b!277059))

(assert (= (and b!277059 res!141038) b!277065))

(assert (= (and b!277065 res!141039) b!277061))

(assert (= (and b!277061 res!141034) b!277063))

(assert (= (and b!277063 res!141033) b!277067))

(assert (= (and b!277067 res!141037) b!277066))

(assert (= (and b!277066 res!141036) b!277058))

(assert (= (and b!277058 c!45564) b!277060))

(assert (= (and b!277058 (not c!45564)) b!277064))

(declare-fun m!292231 () Bool)

(assert (=> b!277067 m!292231))

(declare-fun m!292233 () Bool)

(assert (=> b!277063 m!292233))

(declare-fun m!292235 () Bool)

(assert (=> b!277059 m!292235))

(declare-fun m!292237 () Bool)

(assert (=> b!277065 m!292237))

(declare-fun m!292239 () Bool)

(assert (=> b!277061 m!292239))

(declare-fun m!292241 () Bool)

(assert (=> b!277060 m!292241))

(declare-fun m!292243 () Bool)

(assert (=> b!277060 m!292243))

(declare-fun m!292245 () Bool)

(assert (=> b!277060 m!292245))

(declare-fun m!292247 () Bool)

(assert (=> start!26692 m!292247))

(declare-fun m!292249 () Bool)

(assert (=> start!26692 m!292249))

(push 1)

(assert (not b!277063))

(assert (not b!277067))

(assert (not start!26692))

(assert (not b!277065))

(assert (not b!277061))

(assert (not b!277060))

