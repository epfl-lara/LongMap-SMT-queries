; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26098 () Bool)

(assert start!26098)

(declare-fun b!269219 () Bool)

(declare-fun res!133467 () Bool)

(declare-fun e!173759 () Bool)

(assert (=> b!269219 (=> (not res!133467) (not e!173759))))

(declare-datatypes ((array!13195 0))(
  ( (array!13196 (arr!6247 (Array (_ BitVec 32) (_ BitVec 64))) (size!6599 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13195)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!269219 (= res!133467 (and (= (size!6599 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6599 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6599 a!3325))))))

(declare-fun b!269220 () Bool)

(declare-datatypes ((Unit!8320 0))(
  ( (Unit!8321) )
))
(declare-fun e!173758 () Unit!8320)

(declare-fun Unit!8322 () Unit!8320)

(assert (=> b!269220 (= e!173758 Unit!8322)))

(declare-fun b!269221 () Bool)

(declare-fun res!133468 () Bool)

(assert (=> b!269221 (=> (not res!133468) (not e!173759))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269221 (= res!133468 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269222 () Bool)

(declare-fun e!173756 () Bool)

(assert (=> b!269222 (= e!173756 false)))

(declare-fun lt!135131 () Unit!8320)

(assert (=> b!269222 (= lt!135131 e!173758)))

(declare-fun c!45429 () Bool)

(assert (=> b!269222 (= c!45429 (bvslt startIndex!26 (bvsub (size!6599 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269223 () Bool)

(declare-fun res!133470 () Bool)

(assert (=> b!269223 (=> (not res!133470) (not e!173759))))

(declare-datatypes ((List!4055 0))(
  ( (Nil!4052) (Cons!4051 (h!4718 (_ BitVec 64)) (t!9137 List!4055)) )
))
(declare-fun arrayNoDuplicates!0 (array!13195 (_ BitVec 32) List!4055) Bool)

(assert (=> b!269223 (= res!133470 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4052))))

(declare-fun b!269224 () Bool)

(declare-fun res!133463 () Bool)

(assert (=> b!269224 (=> (not res!133463) (not e!173756))))

(assert (=> b!269224 (= res!133463 (= startIndex!26 i!1267))))

(declare-fun b!269225 () Bool)

(declare-fun res!133464 () Bool)

(assert (=> b!269225 (=> (not res!133464) (not e!173759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269225 (= res!133464 (validKeyInArray!0 k!2581))))

(declare-fun b!269227 () Bool)

(declare-fun res!133469 () Bool)

(assert (=> b!269227 (=> (not res!133469) (not e!173756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13195 (_ BitVec 32)) Bool)

(assert (=> b!269227 (= res!133469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269228 () Bool)

(declare-fun lt!135132 () Unit!8320)

(assert (=> b!269228 (= e!173758 lt!135132)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13195 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8320)

(assert (=> b!269228 (= lt!135132 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269228 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13196 (store (arr!6247 a!3325) i!1267 k!2581) (size!6599 a!3325)) mask!3868)))

(declare-fun b!269226 () Bool)

(assert (=> b!269226 (= e!173759 e!173756)))

(declare-fun res!133466 () Bool)

(assert (=> b!269226 (=> (not res!133466) (not e!173756))))

(declare-datatypes ((SeekEntryResult!1405 0))(
  ( (MissingZero!1405 (index!7790 (_ BitVec 32))) (Found!1405 (index!7791 (_ BitVec 32))) (Intermediate!1405 (undefined!2217 Bool) (index!7792 (_ BitVec 32)) (x!26138 (_ BitVec 32))) (Undefined!1405) (MissingVacant!1405 (index!7793 (_ BitVec 32))) )
))
(declare-fun lt!135133 () SeekEntryResult!1405)

(assert (=> b!269226 (= res!133466 (or (= lt!135133 (MissingZero!1405 i!1267)) (= lt!135133 (MissingVacant!1405 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13195 (_ BitVec 32)) SeekEntryResult!1405)

(assert (=> b!269226 (= lt!135133 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!133465 () Bool)

(assert (=> start!26098 (=> (not res!133465) (not e!173759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26098 (= res!133465 (validMask!0 mask!3868))))

(assert (=> start!26098 e!173759))

(declare-fun array_inv!4210 (array!13195) Bool)

(assert (=> start!26098 (array_inv!4210 a!3325)))

(assert (=> start!26098 true))

(assert (= (and start!26098 res!133465) b!269219))

(assert (= (and b!269219 res!133467) b!269225))

(assert (= (and b!269225 res!133464) b!269223))

(assert (= (and b!269223 res!133470) b!269221))

(assert (= (and b!269221 res!133468) b!269226))

(assert (= (and b!269226 res!133466) b!269227))

(assert (= (and b!269227 res!133469) b!269224))

(assert (= (and b!269224 res!133463) b!269222))

(assert (= (and b!269222 c!45429) b!269228))

(assert (= (and b!269222 (not c!45429)) b!269220))

(declare-fun m!285151 () Bool)

(assert (=> b!269226 m!285151))

(declare-fun m!285153 () Bool)

(assert (=> b!269227 m!285153))

(declare-fun m!285155 () Bool)

(assert (=> b!269228 m!285155))

(declare-fun m!285157 () Bool)

(assert (=> b!269228 m!285157))

(declare-fun m!285159 () Bool)

(assert (=> b!269228 m!285159))

(declare-fun m!285161 () Bool)

(assert (=> b!269223 m!285161))

(declare-fun m!285163 () Bool)

(assert (=> b!269221 m!285163))

(declare-fun m!285165 () Bool)

(assert (=> start!26098 m!285165))

(declare-fun m!285167 () Bool)

(assert (=> start!26098 m!285167))

(declare-fun m!285169 () Bool)

(assert (=> b!269225 m!285169))

(push 1)

(assert (not b!269227))

(assert (not start!26098))

(assert (not b!269223))

(assert (not b!269225))

(assert (not b!269221))

(assert (not b!269228))

(assert (not b!269226))

