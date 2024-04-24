; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26352 () Bool)

(assert start!26352)

(declare-fun b!273218 () Bool)

(declare-fun res!137188 () Bool)

(declare-fun e!175162 () Bool)

(assert (=> b!273218 (=> (not res!137188) (not e!175162))))

(declare-datatypes ((array!13448 0))(
  ( (array!13449 (arr!6373 (Array (_ BitVec 32) (_ BitVec 64))) (size!6725 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13448)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273218 (= res!137188 (validKeyInArray!0 (select (arr!6373 a!3325) startIndex!26)))))

(declare-fun b!273219 () Bool)

(assert (=> b!273219 (= e!175162 (not true))))

(declare-fun lt!136302 () array!13448)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1496 0))(
  ( (MissingZero!1496 (index!8154 (_ BitVec 32))) (Found!1496 (index!8155 (_ BitVec 32))) (Intermediate!1496 (undefined!2308 Bool) (index!8156 (_ BitVec 32)) (x!26573 (_ BitVec 32))) (Undefined!1496) (MissingVacant!1496 (index!8157 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13448 (_ BitVec 32)) SeekEntryResult!1496)

(assert (=> b!273219 (= (seekEntryOrOpen!0 (select (arr!6373 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6373 a!3325) i!1267 k0!2581) startIndex!26) lt!136302 mask!3868))))

(declare-datatypes ((Unit!8531 0))(
  ( (Unit!8532) )
))
(declare-fun lt!136299 () Unit!8531)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13448 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8531)

(assert (=> b!273219 (= lt!136299 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4094 0))(
  ( (Nil!4091) (Cons!4090 (h!4757 (_ BitVec 64)) (t!9168 List!4094)) )
))
(declare-fun arrayNoDuplicates!0 (array!13448 (_ BitVec 32) List!4094) Bool)

(assert (=> b!273219 (arrayNoDuplicates!0 lt!136302 #b00000000000000000000000000000000 Nil!4091)))

(declare-fun lt!136300 () Unit!8531)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13448 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4094) Unit!8531)

(assert (=> b!273219 (= lt!136300 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4091))))

(declare-fun b!273220 () Bool)

(declare-fun e!175160 () Bool)

(declare-fun e!175163 () Bool)

(assert (=> b!273220 (= e!175160 e!175163)))

(declare-fun res!137187 () Bool)

(assert (=> b!273220 (=> (not res!137187) (not e!175163))))

(declare-fun lt!136301 () SeekEntryResult!1496)

(assert (=> b!273220 (= res!137187 (or (= lt!136301 (MissingZero!1496 i!1267)) (= lt!136301 (MissingVacant!1496 i!1267))))))

(assert (=> b!273220 (= lt!136301 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!137186 () Bool)

(assert (=> start!26352 (=> (not res!137186) (not e!175160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26352 (= res!137186 (validMask!0 mask!3868))))

(assert (=> start!26352 e!175160))

(declare-fun array_inv!4323 (array!13448) Bool)

(assert (=> start!26352 (array_inv!4323 a!3325)))

(assert (=> start!26352 true))

(declare-fun b!273221 () Bool)

(declare-fun res!137184 () Bool)

(assert (=> b!273221 (=> (not res!137184) (not e!175160))))

(assert (=> b!273221 (= res!137184 (and (= (size!6725 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6725 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6725 a!3325))))))

(declare-fun b!273222 () Bool)

(assert (=> b!273222 (= e!175163 e!175162)))

(declare-fun res!137185 () Bool)

(assert (=> b!273222 (=> (not res!137185) (not e!175162))))

(assert (=> b!273222 (= res!137185 (not (= startIndex!26 i!1267)))))

(assert (=> b!273222 (= lt!136302 (array!13449 (store (arr!6373 a!3325) i!1267 k0!2581) (size!6725 a!3325)))))

(declare-fun b!273223 () Bool)

(declare-fun res!137183 () Bool)

(assert (=> b!273223 (=> (not res!137183) (not e!175160))))

(assert (=> b!273223 (= res!137183 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4091))))

(declare-fun b!273224 () Bool)

(declare-fun res!137189 () Bool)

(assert (=> b!273224 (=> (not res!137189) (not e!175163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13448 (_ BitVec 32)) Bool)

(assert (=> b!273224 (= res!137189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273225 () Bool)

(declare-fun res!137190 () Bool)

(assert (=> b!273225 (=> (not res!137190) (not e!175160))))

(declare-fun arrayContainsKey!0 (array!13448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273225 (= res!137190 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273226 () Bool)

(declare-fun res!137182 () Bool)

(assert (=> b!273226 (=> (not res!137182) (not e!175160))))

(assert (=> b!273226 (= res!137182 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26352 res!137186) b!273221))

(assert (= (and b!273221 res!137184) b!273226))

(assert (= (and b!273226 res!137182) b!273223))

(assert (= (and b!273223 res!137183) b!273225))

(assert (= (and b!273225 res!137190) b!273220))

(assert (= (and b!273220 res!137187) b!273224))

(assert (= (and b!273224 res!137189) b!273222))

(assert (= (and b!273222 res!137185) b!273218))

(assert (= (and b!273218 res!137188) b!273219))

(declare-fun m!288491 () Bool)

(assert (=> b!273220 m!288491))

(declare-fun m!288493 () Bool)

(assert (=> b!273219 m!288493))

(declare-fun m!288495 () Bool)

(assert (=> b!273219 m!288495))

(declare-fun m!288497 () Bool)

(assert (=> b!273219 m!288497))

(declare-fun m!288499 () Bool)

(assert (=> b!273219 m!288499))

(declare-fun m!288501 () Bool)

(assert (=> b!273219 m!288501))

(declare-fun m!288503 () Bool)

(assert (=> b!273219 m!288503))

(declare-fun m!288505 () Bool)

(assert (=> b!273219 m!288505))

(assert (=> b!273219 m!288503))

(assert (=> b!273219 m!288495))

(declare-fun m!288507 () Bool)

(assert (=> b!273219 m!288507))

(declare-fun m!288509 () Bool)

(assert (=> b!273223 m!288509))

(declare-fun m!288511 () Bool)

(assert (=> b!273224 m!288511))

(declare-fun m!288513 () Bool)

(assert (=> start!26352 m!288513))

(declare-fun m!288515 () Bool)

(assert (=> start!26352 m!288515))

(assert (=> b!273222 m!288497))

(declare-fun m!288517 () Bool)

(assert (=> b!273226 m!288517))

(assert (=> b!273218 m!288503))

(assert (=> b!273218 m!288503))

(declare-fun m!288519 () Bool)

(assert (=> b!273218 m!288519))

(declare-fun m!288521 () Bool)

(assert (=> b!273225 m!288521))

(check-sat (not b!273218) (not b!273224) (not b!273220) (not start!26352) (not b!273226) (not b!273225) (not b!273219) (not b!273223))
(check-sat)
