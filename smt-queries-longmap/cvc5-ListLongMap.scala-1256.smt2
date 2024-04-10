; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26094 () Bool)

(assert start!26094)

(declare-fun b!269159 () Bool)

(declare-fun res!133418 () Bool)

(declare-fun e!173733 () Bool)

(assert (=> b!269159 (=> (not res!133418) (not e!173733))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269159 (= res!133418 (validKeyInArray!0 k!2581))))

(declare-fun b!269160 () Bool)

(declare-fun res!133422 () Bool)

(declare-fun e!173734 () Bool)

(assert (=> b!269160 (=> (not res!133422) (not e!173734))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269160 (= res!133422 (= startIndex!26 i!1267))))

(declare-fun b!269161 () Bool)

(assert (=> b!269161 (= e!173734 false)))

(declare-datatypes ((Unit!8314 0))(
  ( (Unit!8315) )
))
(declare-fun lt!135114 () Unit!8314)

(declare-fun e!173732 () Unit!8314)

(assert (=> b!269161 (= lt!135114 e!173732)))

(declare-fun c!45423 () Bool)

(declare-datatypes ((array!13191 0))(
  ( (array!13192 (arr!6245 (Array (_ BitVec 32) (_ BitVec 64))) (size!6597 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13191)

(assert (=> b!269161 (= c!45423 (bvslt startIndex!26 (bvsub (size!6597 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269162 () Bool)

(assert (=> b!269162 (= e!173733 e!173734)))

(declare-fun res!133420 () Bool)

(assert (=> b!269162 (=> (not res!133420) (not e!173734))))

(declare-datatypes ((SeekEntryResult!1403 0))(
  ( (MissingZero!1403 (index!7782 (_ BitVec 32))) (Found!1403 (index!7783 (_ BitVec 32))) (Intermediate!1403 (undefined!2215 Bool) (index!7784 (_ BitVec 32)) (x!26136 (_ BitVec 32))) (Undefined!1403) (MissingVacant!1403 (index!7785 (_ BitVec 32))) )
))
(declare-fun lt!135115 () SeekEntryResult!1403)

(assert (=> b!269162 (= res!133420 (or (= lt!135115 (MissingZero!1403 i!1267)) (= lt!135115 (MissingVacant!1403 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13191 (_ BitVec 32)) SeekEntryResult!1403)

(assert (=> b!269162 (= lt!135115 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!133416 () Bool)

(assert (=> start!26094 (=> (not res!133416) (not e!173733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26094 (= res!133416 (validMask!0 mask!3868))))

(assert (=> start!26094 e!173733))

(declare-fun array_inv!4208 (array!13191) Bool)

(assert (=> start!26094 (array_inv!4208 a!3325)))

(assert (=> start!26094 true))

(declare-fun b!269163 () Bool)

(declare-fun res!133415 () Bool)

(assert (=> b!269163 (=> (not res!133415) (not e!173733))))

(assert (=> b!269163 (= res!133415 (and (= (size!6597 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6597 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6597 a!3325))))))

(declare-fun b!269164 () Bool)

(declare-fun res!133419 () Bool)

(assert (=> b!269164 (=> (not res!133419) (not e!173733))))

(declare-datatypes ((List!4053 0))(
  ( (Nil!4050) (Cons!4049 (h!4716 (_ BitVec 64)) (t!9135 List!4053)) )
))
(declare-fun arrayNoDuplicates!0 (array!13191 (_ BitVec 32) List!4053) Bool)

(assert (=> b!269164 (= res!133419 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4050))))

(declare-fun b!269165 () Bool)

(declare-fun Unit!8316 () Unit!8314)

(assert (=> b!269165 (= e!173732 Unit!8316)))

(declare-fun b!269166 () Bool)

(declare-fun lt!135113 () Unit!8314)

(assert (=> b!269166 (= e!173732 lt!135113)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13191 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8314)

(assert (=> b!269166 (= lt!135113 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13191 (_ BitVec 32)) Bool)

(assert (=> b!269166 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13192 (store (arr!6245 a!3325) i!1267 k!2581) (size!6597 a!3325)) mask!3868)))

(declare-fun b!269167 () Bool)

(declare-fun res!133417 () Bool)

(assert (=> b!269167 (=> (not res!133417) (not e!173733))))

(declare-fun arrayContainsKey!0 (array!13191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269167 (= res!133417 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269168 () Bool)

(declare-fun res!133421 () Bool)

(assert (=> b!269168 (=> (not res!133421) (not e!173734))))

(assert (=> b!269168 (= res!133421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26094 res!133416) b!269163))

(assert (= (and b!269163 res!133415) b!269159))

(assert (= (and b!269159 res!133418) b!269164))

(assert (= (and b!269164 res!133419) b!269167))

(assert (= (and b!269167 res!133417) b!269162))

(assert (= (and b!269162 res!133420) b!269168))

(assert (= (and b!269168 res!133421) b!269160))

(assert (= (and b!269160 res!133422) b!269161))

(assert (= (and b!269161 c!45423) b!269166))

(assert (= (and b!269161 (not c!45423)) b!269165))

(declare-fun m!285111 () Bool)

(assert (=> b!269162 m!285111))

(declare-fun m!285113 () Bool)

(assert (=> b!269166 m!285113))

(declare-fun m!285115 () Bool)

(assert (=> b!269166 m!285115))

(declare-fun m!285117 () Bool)

(assert (=> b!269166 m!285117))

(declare-fun m!285119 () Bool)

(assert (=> b!269159 m!285119))

(declare-fun m!285121 () Bool)

(assert (=> b!269168 m!285121))

(declare-fun m!285123 () Bool)

(assert (=> b!269164 m!285123))

(declare-fun m!285125 () Bool)

(assert (=> b!269167 m!285125))

(declare-fun m!285127 () Bool)

(assert (=> start!26094 m!285127))

(declare-fun m!285129 () Bool)

(assert (=> start!26094 m!285129))

(push 1)

