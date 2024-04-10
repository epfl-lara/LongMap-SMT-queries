; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26164 () Bool)

(assert start!26164)

(declare-fun b!270209 () Bool)

(declare-fun e!174198 () Bool)

(assert (=> b!270209 (= e!174198 (not true))))

(declare-datatypes ((array!13261 0))(
  ( (array!13262 (arr!6280 (Array (_ BitVec 32) (_ BitVec 64))) (size!6632 (_ BitVec 32))) )
))
(declare-fun lt!135516 () array!13261)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1438 0))(
  ( (MissingZero!1438 (index!7922 (_ BitVec 32))) (Found!1438 (index!7923 (_ BitVec 32))) (Intermediate!1438 (undefined!2250 Bool) (index!7924 (_ BitVec 32)) (x!26259 (_ BitVec 32))) (Undefined!1438) (MissingVacant!1438 (index!7925 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13261 (_ BitVec 32)) SeekEntryResult!1438)

(assert (=> b!270209 (= (seekEntryOrOpen!0 k!2581 lt!135516 mask!3868) (Found!1438 i!1267))))

(declare-fun a!3325 () array!13261)

(declare-datatypes ((Unit!8419 0))(
  ( (Unit!8420) )
))
(declare-fun lt!135517 () Unit!8419)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13261 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8419)

(assert (=> b!270209 (= lt!135517 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135520 () Unit!8419)

(declare-fun e!174199 () Unit!8419)

(assert (=> b!270209 (= lt!135520 e!174199)))

(declare-fun c!45528 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270209 (= c!45528 (bvslt startIndex!26 (bvsub (size!6632 a!3325) #b00000000000000000000000000000001)))))

(declare-fun res!134260 () Bool)

(declare-fun e!174196 () Bool)

(assert (=> start!26164 (=> (not res!134260) (not e!174196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26164 (= res!134260 (validMask!0 mask!3868))))

(assert (=> start!26164 e!174196))

(declare-fun array_inv!4243 (array!13261) Bool)

(assert (=> start!26164 (array_inv!4243 a!3325)))

(assert (=> start!26164 true))

(declare-fun b!270210 () Bool)

(declare-fun e!174200 () Bool)

(assert (=> b!270210 (= e!174200 e!174198)))

(declare-fun res!134262 () Bool)

(assert (=> b!270210 (=> (not res!134262) (not e!174198))))

(assert (=> b!270210 (= res!134262 (= startIndex!26 i!1267))))

(assert (=> b!270210 (= lt!135516 (array!13262 (store (arr!6280 a!3325) i!1267 k!2581) (size!6632 a!3325)))))

(declare-fun b!270211 () Bool)

(declare-fun res!134255 () Bool)

(assert (=> b!270211 (=> (not res!134255) (not e!174200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13261 (_ BitVec 32)) Bool)

(assert (=> b!270211 (= res!134255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270212 () Bool)

(declare-fun res!134259 () Bool)

(assert (=> b!270212 (=> (not res!134259) (not e!174196))))

(declare-datatypes ((List!4088 0))(
  ( (Nil!4085) (Cons!4084 (h!4751 (_ BitVec 64)) (t!9170 List!4088)) )
))
(declare-fun arrayNoDuplicates!0 (array!13261 (_ BitVec 32) List!4088) Bool)

(assert (=> b!270212 (= res!134259 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4085))))

(declare-fun b!270213 () Bool)

(declare-fun lt!135518 () Unit!8419)

(assert (=> b!270213 (= e!174199 lt!135518)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13261 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8419)

(assert (=> b!270213 (= lt!135518 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!270213 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135516 mask!3868)))

(declare-fun b!270214 () Bool)

(declare-fun res!134258 () Bool)

(assert (=> b!270214 (=> (not res!134258) (not e!174196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270214 (= res!134258 (validKeyInArray!0 k!2581))))

(declare-fun b!270215 () Bool)

(declare-fun Unit!8421 () Unit!8419)

(assert (=> b!270215 (= e!174199 Unit!8421)))

(declare-fun b!270216 () Bool)

(declare-fun res!134256 () Bool)

(assert (=> b!270216 (=> (not res!134256) (not e!174196))))

(assert (=> b!270216 (= res!134256 (and (= (size!6632 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6632 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6632 a!3325))))))

(declare-fun b!270217 () Bool)

(declare-fun res!134261 () Bool)

(assert (=> b!270217 (=> (not res!134261) (not e!174196))))

(declare-fun arrayContainsKey!0 (array!13261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270217 (= res!134261 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270218 () Bool)

(assert (=> b!270218 (= e!174196 e!174200)))

(declare-fun res!134257 () Bool)

(assert (=> b!270218 (=> (not res!134257) (not e!174200))))

(declare-fun lt!135519 () SeekEntryResult!1438)

(assert (=> b!270218 (= res!134257 (or (= lt!135519 (MissingZero!1438 i!1267)) (= lt!135519 (MissingVacant!1438 i!1267))))))

(assert (=> b!270218 (= lt!135519 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26164 res!134260) b!270216))

(assert (= (and b!270216 res!134256) b!270214))

(assert (= (and b!270214 res!134258) b!270212))

(assert (= (and b!270212 res!134259) b!270217))

(assert (= (and b!270217 res!134261) b!270218))

(assert (= (and b!270218 res!134257) b!270211))

(assert (= (and b!270211 res!134255) b!270210))

(assert (= (and b!270210 res!134262) b!270209))

(assert (= (and b!270209 c!45528) b!270213))

(assert (= (and b!270209 (not c!45528)) b!270215))

(declare-fun m!285867 () Bool)

(assert (=> b!270213 m!285867))

(declare-fun m!285869 () Bool)

(assert (=> b!270213 m!285869))

(declare-fun m!285871 () Bool)

(assert (=> b!270212 m!285871))

(declare-fun m!285873 () Bool)

(assert (=> b!270217 m!285873))

(declare-fun m!285875 () Bool)

(assert (=> b!270211 m!285875))

(declare-fun m!285877 () Bool)

(assert (=> b!270218 m!285877))

(declare-fun m!285879 () Bool)

(assert (=> start!26164 m!285879))

(declare-fun m!285881 () Bool)

(assert (=> start!26164 m!285881))

(declare-fun m!285883 () Bool)

(assert (=> b!270214 m!285883))

(declare-fun m!285885 () Bool)

(assert (=> b!270210 m!285885))

(declare-fun m!285887 () Bool)

(assert (=> b!270209 m!285887))

(declare-fun m!285889 () Bool)

(assert (=> b!270209 m!285889))

(push 1)

(assert (not start!26164))

(assert (not b!270209))

(assert (not b!270217))

(assert (not b!270214))

