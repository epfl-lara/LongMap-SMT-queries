; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26702 () Bool)

(assert start!26702)

(declare-fun b!277208 () Bool)

(declare-datatypes ((Unit!8722 0))(
  ( (Unit!8723) )
))
(declare-fun e!176960 () Unit!8722)

(declare-fun lt!137867 () Unit!8722)

(assert (=> b!277208 (= e!176960 lt!137867)))

(declare-datatypes ((array!13799 0))(
  ( (array!13800 (arr!6549 (Array (_ BitVec 32) (_ BitVec 64))) (size!6901 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13799)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13799 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8722)

(assert (=> b!277208 (= lt!137867 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13799 (_ BitVec 32)) Bool)

(assert (=> b!277208 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13800 (store (arr!6549 a!3325) i!1267 k0!2581) (size!6901 a!3325)) mask!3868)))

(declare-fun b!277209 () Bool)

(declare-fun res!141152 () Bool)

(declare-fun e!176957 () Bool)

(assert (=> b!277209 (=> (not res!141152) (not e!176957))))

(assert (=> b!277209 (= res!141152 (= startIndex!26 i!1267))))

(declare-fun b!277210 () Bool)

(declare-fun e!176958 () Bool)

(assert (=> b!277210 (= e!176958 e!176957)))

(declare-fun res!141157 () Bool)

(assert (=> b!277210 (=> (not res!141157) (not e!176957))))

(declare-datatypes ((SeekEntryResult!1707 0))(
  ( (MissingZero!1707 (index!8998 (_ BitVec 32))) (Found!1707 (index!8999 (_ BitVec 32))) (Intermediate!1707 (undefined!2519 Bool) (index!9000 (_ BitVec 32)) (x!27248 (_ BitVec 32))) (Undefined!1707) (MissingVacant!1707 (index!9001 (_ BitVec 32))) )
))
(declare-fun lt!137869 () SeekEntryResult!1707)

(assert (=> b!277210 (= res!141157 (or (= lt!137869 (MissingZero!1707 i!1267)) (= lt!137869 (MissingVacant!1707 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13799 (_ BitVec 32)) SeekEntryResult!1707)

(assert (=> b!277210 (= lt!137869 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277211 () Bool)

(declare-fun res!141156 () Bool)

(assert (=> b!277211 (=> (not res!141156) (not e!176957))))

(assert (=> b!277211 (= res!141156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277212 () Bool)

(declare-fun res!141154 () Bool)

(assert (=> b!277212 (=> (not res!141154) (not e!176958))))

(declare-datatypes ((List!4357 0))(
  ( (Nil!4354) (Cons!4353 (h!5020 (_ BitVec 64)) (t!9439 List!4357)) )
))
(declare-fun arrayNoDuplicates!0 (array!13799 (_ BitVec 32) List!4357) Bool)

(assert (=> b!277212 (= res!141154 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4354))))

(declare-fun res!141155 () Bool)

(assert (=> start!26702 (=> (not res!141155) (not e!176958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26702 (= res!141155 (validMask!0 mask!3868))))

(assert (=> start!26702 e!176958))

(declare-fun array_inv!4512 (array!13799) Bool)

(assert (=> start!26702 (array_inv!4512 a!3325)))

(assert (=> start!26702 true))

(declare-fun b!277213 () Bool)

(declare-fun res!141158 () Bool)

(assert (=> b!277213 (=> (not res!141158) (not e!176958))))

(assert (=> b!277213 (= res!141158 (and (= (size!6901 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6901 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6901 a!3325))))))

(declare-fun b!277214 () Bool)

(declare-fun res!141153 () Bool)

(assert (=> b!277214 (=> (not res!141153) (not e!176958))))

(declare-fun arrayContainsKey!0 (array!13799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277214 (= res!141153 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277215 () Bool)

(declare-fun Unit!8724 () Unit!8722)

(assert (=> b!277215 (= e!176960 Unit!8724)))

(declare-fun b!277216 () Bool)

(declare-fun res!141159 () Bool)

(assert (=> b!277216 (=> (not res!141159) (not e!176958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277216 (= res!141159 (validKeyInArray!0 k0!2581))))

(declare-fun b!277217 () Bool)

(assert (=> b!277217 (= e!176957 false)))

(declare-fun lt!137868 () Unit!8722)

(assert (=> b!277217 (= lt!137868 e!176960)))

(declare-fun c!45579 () Bool)

(assert (=> b!277217 (= c!45579 (bvslt startIndex!26 (bvsub (size!6901 a!3325) #b00000000000000000000000000000001)))))

(assert (= (and start!26702 res!141155) b!277213))

(assert (= (and b!277213 res!141158) b!277216))

(assert (= (and b!277216 res!141159) b!277212))

(assert (= (and b!277212 res!141154) b!277214))

(assert (= (and b!277214 res!141153) b!277210))

(assert (= (and b!277210 res!141157) b!277211))

(assert (= (and b!277211 res!141156) b!277209))

(assert (= (and b!277209 res!141152) b!277217))

(assert (= (and b!277217 c!45579) b!277208))

(assert (= (and b!277217 (not c!45579)) b!277215))

(declare-fun m!292331 () Bool)

(assert (=> b!277211 m!292331))

(declare-fun m!292333 () Bool)

(assert (=> b!277210 m!292333))

(declare-fun m!292335 () Bool)

(assert (=> start!26702 m!292335))

(declare-fun m!292337 () Bool)

(assert (=> start!26702 m!292337))

(declare-fun m!292339 () Bool)

(assert (=> b!277216 m!292339))

(declare-fun m!292341 () Bool)

(assert (=> b!277212 m!292341))

(declare-fun m!292343 () Bool)

(assert (=> b!277208 m!292343))

(declare-fun m!292345 () Bool)

(assert (=> b!277208 m!292345))

(declare-fun m!292347 () Bool)

(assert (=> b!277208 m!292347))

(declare-fun m!292349 () Bool)

(assert (=> b!277214 m!292349))

(check-sat (not b!277214) (not b!277212) (not b!277210) (not b!277208) (not b!277216) (not start!26702) (not b!277211))
(check-sat)
