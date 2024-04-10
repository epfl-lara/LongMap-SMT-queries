; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27250 () Bool)

(assert start!27250)

(declare-fun b!282201 () Bool)

(declare-fun res!145271 () Bool)

(declare-fun e!179208 () Bool)

(assert (=> b!282201 (=> (not res!145271) (not e!179208))))

(declare-datatypes ((array!14068 0))(
  ( (array!14069 (arr!6676 (Array (_ BitVec 32) (_ BitVec 64))) (size!7028 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14068)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282201 (= res!145271 (validKeyInArray!0 (select (arr!6676 a!3325) startIndex!26)))))

(declare-fun b!282202 () Bool)

(declare-fun e!179207 () Bool)

(declare-fun e!179209 () Bool)

(assert (=> b!282202 (= e!179207 e!179209)))

(declare-fun res!145274 () Bool)

(assert (=> b!282202 (=> (not res!145274) (not e!179209))))

(declare-datatypes ((SeekEntryResult!1834 0))(
  ( (MissingZero!1834 (index!9506 (_ BitVec 32))) (Found!1834 (index!9507 (_ BitVec 32))) (Intermediate!1834 (undefined!2646 Bool) (index!9508 (_ BitVec 32)) (x!27720 (_ BitVec 32))) (Undefined!1834) (MissingVacant!1834 (index!9509 (_ BitVec 32))) )
))
(declare-fun lt!139415 () SeekEntryResult!1834)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282202 (= res!145274 (or (= lt!139415 (MissingZero!1834 i!1267)) (= lt!139415 (MissingVacant!1834 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14068 (_ BitVec 32)) SeekEntryResult!1834)

(assert (=> b!282202 (= lt!139415 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282203 () Bool)

(declare-fun res!145278 () Bool)

(assert (=> b!282203 (=> (not res!145278) (not e!179207))))

(declare-datatypes ((List!4484 0))(
  ( (Nil!4481) (Cons!4480 (h!5150 (_ BitVec 64)) (t!9566 List!4484)) )
))
(declare-fun arrayNoDuplicates!0 (array!14068 (_ BitVec 32) List!4484) Bool)

(assert (=> b!282203 (= res!145278 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4481))))

(declare-fun b!282204 () Bool)

(assert (=> b!282204 (= e!179209 e!179208)))

(declare-fun res!145272 () Bool)

(assert (=> b!282204 (=> (not res!145272) (not e!179208))))

(assert (=> b!282204 (= res!145272 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139413 () array!14068)

(assert (=> b!282204 (= lt!139413 (array!14069 (store (arr!6676 a!3325) i!1267 k!2581) (size!7028 a!3325)))))

(declare-fun res!145270 () Bool)

(assert (=> start!27250 (=> (not res!145270) (not e!179207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27250 (= res!145270 (validMask!0 mask!3868))))

(assert (=> start!27250 e!179207))

(declare-fun array_inv!4639 (array!14068) Bool)

(assert (=> start!27250 (array_inv!4639 a!3325)))

(assert (=> start!27250 true))

(declare-fun b!282205 () Bool)

(assert (=> b!282205 (= e!179208 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14068 (_ BitVec 32)) Bool)

(assert (=> b!282205 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8952 0))(
  ( (Unit!8953) )
))
(declare-fun lt!139416 () Unit!8952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8952)

(assert (=> b!282205 (= lt!139416 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282205 (= (seekEntryOrOpen!0 (select (arr!6676 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6676 a!3325) i!1267 k!2581) startIndex!26) lt!139413 mask!3868))))

(declare-fun lt!139417 () Unit!8952)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14068 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8952)

(assert (=> b!282205 (= lt!139417 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!282205 (arrayNoDuplicates!0 lt!139413 #b00000000000000000000000000000000 Nil!4481)))

(declare-fun lt!139414 () Unit!8952)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14068 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4484) Unit!8952)

(assert (=> b!282205 (= lt!139414 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4481))))

(declare-fun b!282206 () Bool)

(declare-fun res!145277 () Bool)

(assert (=> b!282206 (=> (not res!145277) (not e!179207))))

(assert (=> b!282206 (= res!145277 (validKeyInArray!0 k!2581))))

(declare-fun b!282207 () Bool)

(declare-fun res!145273 () Bool)

(assert (=> b!282207 (=> (not res!145273) (not e!179209))))

(assert (=> b!282207 (= res!145273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282208 () Bool)

(declare-fun res!145276 () Bool)

(assert (=> b!282208 (=> (not res!145276) (not e!179207))))

(declare-fun arrayContainsKey!0 (array!14068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282208 (= res!145276 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282209 () Bool)

(declare-fun res!145275 () Bool)

(assert (=> b!282209 (=> (not res!145275) (not e!179207))))

(assert (=> b!282209 (= res!145275 (and (= (size!7028 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7028 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7028 a!3325))))))

(assert (= (and start!27250 res!145270) b!282209))

(assert (= (and b!282209 res!145275) b!282206))

(assert (= (and b!282206 res!145277) b!282203))

(assert (= (and b!282203 res!145278) b!282208))

(assert (= (and b!282208 res!145276) b!282202))

(assert (= (and b!282202 res!145274) b!282207))

(assert (= (and b!282207 res!145273) b!282204))

(assert (= (and b!282204 res!145272) b!282201))

(assert (= (and b!282201 res!145271) b!282205))

(declare-fun m!296691 () Bool)

(assert (=> b!282204 m!296691))

(declare-fun m!296693 () Bool)

(assert (=> b!282203 m!296693))

(declare-fun m!296695 () Bool)

(assert (=> start!27250 m!296695))

(declare-fun m!296697 () Bool)

(assert (=> start!27250 m!296697))

(declare-fun m!296699 () Bool)

(assert (=> b!282202 m!296699))

(declare-fun m!296701 () Bool)

(assert (=> b!282207 m!296701))

(declare-fun m!296703 () Bool)

(assert (=> b!282201 m!296703))

(assert (=> b!282201 m!296703))

(declare-fun m!296705 () Bool)

(assert (=> b!282201 m!296705))

(declare-fun m!296707 () Bool)

(assert (=> b!282206 m!296707))

(declare-fun m!296709 () Bool)

(assert (=> b!282205 m!296709))

(declare-fun m!296711 () Bool)

(assert (=> b!282205 m!296711))

(assert (=> b!282205 m!296711))

(declare-fun m!296713 () Bool)

(assert (=> b!282205 m!296713))

(assert (=> b!282205 m!296691))

(declare-fun m!296715 () Bool)

(assert (=> b!282205 m!296715))

(assert (=> b!282205 m!296703))

(declare-fun m!296717 () Bool)

(assert (=> b!282205 m!296717))

(declare-fun m!296719 () Bool)

(assert (=> b!282205 m!296719))

(assert (=> b!282205 m!296703))

(declare-fun m!296721 () Bool)

(assert (=> b!282205 m!296721))

(declare-fun m!296723 () Bool)

(assert (=> b!282205 m!296723))

(declare-fun m!296725 () Bool)

(assert (=> b!282208 m!296725))

(push 1)

(assert (not start!27250))

(assert (not b!282207))

