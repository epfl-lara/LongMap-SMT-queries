; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26282 () Bool)

(assert start!26282)

(declare-fun b!272226 () Bool)

(declare-fun res!136221 () Bool)

(declare-fun e!174784 () Bool)

(assert (=> b!272226 (=> (not res!136221) (not e!174784))))

(declare-datatypes ((array!13379 0))(
  ( (array!13380 (arr!6339 (Array (_ BitVec 32) (_ BitVec 64))) (size!6691 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13379)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!272226 (= res!136221 (and (= (size!6691 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6691 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6691 a!3325))))))

(declare-fun res!136223 () Bool)

(assert (=> start!26282 (=> (not res!136223) (not e!174784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26282 (= res!136223 (validMask!0 mask!3868))))

(assert (=> start!26282 e!174784))

(declare-fun array_inv!4302 (array!13379) Bool)

(assert (=> start!26282 (array_inv!4302 a!3325)))

(assert (=> start!26282 true))

(declare-fun b!272227 () Bool)

(declare-fun res!136216 () Bool)

(declare-fun e!174785 () Bool)

(assert (=> b!272227 (=> (not res!136216) (not e!174785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13379 (_ BitVec 32)) Bool)

(assert (=> b!272227 (= res!136216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272228 () Bool)

(declare-fun res!136219 () Bool)

(assert (=> b!272228 (=> (not res!136219) (not e!174785))))

(assert (=> b!272228 (= res!136219 (not (= startIndex!26 i!1267)))))

(declare-fun b!272229 () Bool)

(declare-fun res!136222 () Bool)

(assert (=> b!272229 (=> (not res!136222) (not e!174784))))

(declare-datatypes ((List!4147 0))(
  ( (Nil!4144) (Cons!4143 (h!4810 (_ BitVec 64)) (t!9229 List!4147)) )
))
(declare-fun arrayNoDuplicates!0 (array!13379 (_ BitVec 32) List!4147) Bool)

(assert (=> b!272229 (= res!136222 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4144))))

(declare-fun b!272230 () Bool)

(declare-fun res!136217 () Bool)

(assert (=> b!272230 (=> (not res!136217) (not e!174784))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272230 (= res!136217 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272231 () Bool)

(declare-fun res!136220 () Bool)

(assert (=> b!272231 (=> (not res!136220) (not e!174785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272231 (= res!136220 (validKeyInArray!0 (select (arr!6339 a!3325) startIndex!26)))))

(declare-fun b!272232 () Bool)

(declare-fun res!136218 () Bool)

(assert (=> b!272232 (=> (not res!136218) (not e!174784))))

(assert (=> b!272232 (= res!136218 (validKeyInArray!0 k0!2581))))

(declare-fun b!272233 () Bool)

(assert (=> b!272233 (= e!174785 (not true))))

(assert (=> b!272233 (arrayNoDuplicates!0 (array!13380 (store (arr!6339 a!3325) i!1267 k0!2581) (size!6691 a!3325)) #b00000000000000000000000000000000 Nil!4144)))

(declare-datatypes ((Unit!8481 0))(
  ( (Unit!8482) )
))
(declare-fun lt!135954 () Unit!8481)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13379 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4147) Unit!8481)

(assert (=> b!272233 (= lt!135954 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4144))))

(declare-fun b!272234 () Bool)

(assert (=> b!272234 (= e!174784 e!174785)))

(declare-fun res!136224 () Bool)

(assert (=> b!272234 (=> (not res!136224) (not e!174785))))

(declare-datatypes ((SeekEntryResult!1497 0))(
  ( (MissingZero!1497 (index!8158 (_ BitVec 32))) (Found!1497 (index!8159 (_ BitVec 32))) (Intermediate!1497 (undefined!2309 Bool) (index!8160 (_ BitVec 32)) (x!26478 (_ BitVec 32))) (Undefined!1497) (MissingVacant!1497 (index!8161 (_ BitVec 32))) )
))
(declare-fun lt!135955 () SeekEntryResult!1497)

(assert (=> b!272234 (= res!136224 (or (= lt!135955 (MissingZero!1497 i!1267)) (= lt!135955 (MissingVacant!1497 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13379 (_ BitVec 32)) SeekEntryResult!1497)

(assert (=> b!272234 (= lt!135955 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26282 res!136223) b!272226))

(assert (= (and b!272226 res!136221) b!272232))

(assert (= (and b!272232 res!136218) b!272229))

(assert (= (and b!272229 res!136222) b!272230))

(assert (= (and b!272230 res!136217) b!272234))

(assert (= (and b!272234 res!136224) b!272227))

(assert (= (and b!272227 res!136216) b!272228))

(assert (= (and b!272228 res!136219) b!272231))

(assert (= (and b!272231 res!136220) b!272233))

(declare-fun m!287349 () Bool)

(assert (=> b!272230 m!287349))

(declare-fun m!287351 () Bool)

(assert (=> b!272227 m!287351))

(declare-fun m!287353 () Bool)

(assert (=> b!272234 m!287353))

(declare-fun m!287355 () Bool)

(assert (=> b!272231 m!287355))

(assert (=> b!272231 m!287355))

(declare-fun m!287357 () Bool)

(assert (=> b!272231 m!287357))

(declare-fun m!287359 () Bool)

(assert (=> b!272232 m!287359))

(declare-fun m!287361 () Bool)

(assert (=> b!272229 m!287361))

(declare-fun m!287363 () Bool)

(assert (=> b!272233 m!287363))

(declare-fun m!287365 () Bool)

(assert (=> b!272233 m!287365))

(declare-fun m!287367 () Bool)

(assert (=> b!272233 m!287367))

(declare-fun m!287369 () Bool)

(assert (=> start!26282 m!287369))

(declare-fun m!287371 () Bool)

(assert (=> start!26282 m!287371))

(check-sat (not b!272233) (not b!272227) (not b!272234) (not b!272231) (not b!272229) (not b!272230) (not b!272232) (not start!26282))
(check-sat)
