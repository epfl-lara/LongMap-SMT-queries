; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27260 () Bool)

(assert start!27260)

(declare-fun res!145291 () Bool)

(declare-fun e!179155 () Bool)

(assert (=> start!27260 (=> (not res!145291) (not e!179155))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27260 (= res!145291 (validMask!0 mask!3868))))

(assert (=> start!27260 e!179155))

(declare-datatypes ((array!14067 0))(
  ( (array!14068 (arr!6675 (Array (_ BitVec 32) (_ BitVec 64))) (size!7028 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14067)

(declare-fun array_inv!4647 (array!14067) Bool)

(assert (=> start!27260 (array_inv!4647 a!3325)))

(assert (=> start!27260 true))

(declare-fun b!282162 () Bool)

(declare-fun res!145286 () Bool)

(declare-fun e!179154 () Bool)

(assert (=> b!282162 (=> (not res!145286) (not e!179154))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282162 (= res!145286 (validKeyInArray!0 (select (arr!6675 a!3325) startIndex!26)))))

(declare-fun b!282163 () Bool)

(declare-fun e!179156 () Bool)

(assert (=> b!282163 (= e!179156 e!179154)))

(declare-fun res!145289 () Bool)

(assert (=> b!282163 (=> (not res!145289) (not e!179154))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282163 (= res!145289 (not (= startIndex!26 i!1267)))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!139296 () array!14067)

(assert (=> b!282163 (= lt!139296 (array!14068 (store (arr!6675 a!3325) i!1267 k0!2581) (size!7028 a!3325)))))

(declare-fun b!282164 () Bool)

(declare-fun res!145285 () Bool)

(assert (=> b!282164 (=> (not res!145285) (not e!179155))))

(declare-datatypes ((List!4456 0))(
  ( (Nil!4453) (Cons!4452 (h!5122 (_ BitVec 64)) (t!9529 List!4456)) )
))
(declare-fun arrayNoDuplicates!0 (array!14067 (_ BitVec 32) List!4456) Bool)

(assert (=> b!282164 (= res!145285 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4453))))

(declare-fun b!282165 () Bool)

(assert (=> b!282165 (= e!179154 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14067 (_ BitVec 32)) Bool)

(assert (=> b!282165 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8910 0))(
  ( (Unit!8911) )
))
(declare-fun lt!139292 () Unit!8910)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14067 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8910)

(assert (=> b!282165 (= lt!139292 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1832 0))(
  ( (MissingZero!1832 (index!9498 (_ BitVec 32))) (Found!1832 (index!9499 (_ BitVec 32))) (Intermediate!1832 (undefined!2644 Bool) (index!9500 (_ BitVec 32)) (x!27733 (_ BitVec 32))) (Undefined!1832) (MissingVacant!1832 (index!9501 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14067 (_ BitVec 32)) SeekEntryResult!1832)

(assert (=> b!282165 (= (seekEntryOrOpen!0 (select (arr!6675 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6675 a!3325) i!1267 k0!2581) startIndex!26) lt!139296 mask!3868))))

(declare-fun lt!139295 () Unit!8910)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14067 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8910)

(assert (=> b!282165 (= lt!139295 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282165 (arrayNoDuplicates!0 lt!139296 #b00000000000000000000000000000000 Nil!4453)))

(declare-fun lt!139293 () Unit!8910)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14067 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4456) Unit!8910)

(assert (=> b!282165 (= lt!139293 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4453))))

(declare-fun b!282166 () Bool)

(declare-fun res!145288 () Bool)

(assert (=> b!282166 (=> (not res!145288) (not e!179156))))

(assert (=> b!282166 (= res!145288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282167 () Bool)

(declare-fun res!145283 () Bool)

(assert (=> b!282167 (=> (not res!145283) (not e!179155))))

(declare-fun arrayContainsKey!0 (array!14067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282167 (= res!145283 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282168 () Bool)

(declare-fun res!145290 () Bool)

(assert (=> b!282168 (=> (not res!145290) (not e!179155))))

(assert (=> b!282168 (= res!145290 (and (= (size!7028 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7028 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7028 a!3325))))))

(declare-fun b!282169 () Bool)

(declare-fun res!145287 () Bool)

(assert (=> b!282169 (=> (not res!145287) (not e!179155))))

(assert (=> b!282169 (= res!145287 (validKeyInArray!0 k0!2581))))

(declare-fun b!282170 () Bool)

(assert (=> b!282170 (= e!179155 e!179156)))

(declare-fun res!145284 () Bool)

(assert (=> b!282170 (=> (not res!145284) (not e!179156))))

(declare-fun lt!139294 () SeekEntryResult!1832)

(assert (=> b!282170 (= res!145284 (or (= lt!139294 (MissingZero!1832 i!1267)) (= lt!139294 (MissingVacant!1832 i!1267))))))

(assert (=> b!282170 (= lt!139294 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!27260 res!145291) b!282168))

(assert (= (and b!282168 res!145290) b!282169))

(assert (= (and b!282169 res!145287) b!282164))

(assert (= (and b!282164 res!145285) b!282167))

(assert (= (and b!282167 res!145283) b!282170))

(assert (= (and b!282170 res!145284) b!282166))

(assert (= (and b!282166 res!145288) b!282163))

(assert (= (and b!282163 res!145289) b!282162))

(assert (= (and b!282162 res!145286) b!282165))

(declare-fun m!296243 () Bool)

(assert (=> b!282165 m!296243))

(declare-fun m!296245 () Bool)

(assert (=> b!282165 m!296245))

(declare-fun m!296247 () Bool)

(assert (=> b!282165 m!296247))

(assert (=> b!282165 m!296245))

(declare-fun m!296249 () Bool)

(assert (=> b!282165 m!296249))

(declare-fun m!296251 () Bool)

(assert (=> b!282165 m!296251))

(declare-fun m!296253 () Bool)

(assert (=> b!282165 m!296253))

(declare-fun m!296255 () Bool)

(assert (=> b!282165 m!296255))

(assert (=> b!282165 m!296253))

(declare-fun m!296257 () Bool)

(assert (=> b!282165 m!296257))

(declare-fun m!296259 () Bool)

(assert (=> b!282165 m!296259))

(declare-fun m!296261 () Bool)

(assert (=> b!282165 m!296261))

(declare-fun m!296263 () Bool)

(assert (=> b!282164 m!296263))

(declare-fun m!296265 () Bool)

(assert (=> b!282169 m!296265))

(assert (=> b!282163 m!296249))

(declare-fun m!296267 () Bool)

(assert (=> b!282167 m!296267))

(assert (=> b!282162 m!296253))

(assert (=> b!282162 m!296253))

(declare-fun m!296269 () Bool)

(assert (=> b!282162 m!296269))

(declare-fun m!296271 () Bool)

(assert (=> start!27260 m!296271))

(declare-fun m!296273 () Bool)

(assert (=> start!27260 m!296273))

(declare-fun m!296275 () Bool)

(assert (=> b!282170 m!296275))

(declare-fun m!296277 () Bool)

(assert (=> b!282166 m!296277))

(check-sat (not b!282166) (not b!282170) (not b!282165) (not b!282167) (not start!27260) (not b!282162) (not b!282169) (not b!282164))
(check-sat)
