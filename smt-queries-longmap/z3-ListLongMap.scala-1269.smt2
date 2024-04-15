; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26174 () Bool)

(assert start!26174)

(declare-fun b!270182 () Bool)

(declare-fun res!134256 () Bool)

(declare-fun e!174159 () Bool)

(assert (=> b!270182 (=> (not res!134256) (not e!174159))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270182 (= res!134256 (validKeyInArray!0 k0!2581))))

(declare-fun b!270183 () Bool)

(declare-fun e!174157 () Bool)

(assert (=> b!270183 (= e!174157 (not true))))

(declare-datatypes ((array!13260 0))(
  ( (array!13261 (arr!6279 (Array (_ BitVec 32) (_ BitVec 64))) (size!6632 (_ BitVec 32))) )
))
(declare-fun lt!135396 () array!13260)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1436 0))(
  ( (MissingZero!1436 (index!7914 (_ BitVec 32))) (Found!1436 (index!7915 (_ BitVec 32))) (Intermediate!1436 (undefined!2248 Bool) (index!7916 (_ BitVec 32)) (x!26272 (_ BitVec 32))) (Undefined!1436) (MissingVacant!1436 (index!7917 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13260 (_ BitVec 32)) SeekEntryResult!1436)

(assert (=> b!270183 (= (seekEntryOrOpen!0 k0!2581 lt!135396 mask!3868) (Found!1436 i!1267))))

(declare-fun a!3325 () array!13260)

(declare-datatypes ((Unit!8385 0))(
  ( (Unit!8386) )
))
(declare-fun lt!135397 () Unit!8385)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13260 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8385)

(assert (=> b!270183 (= lt!135397 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135399 () Unit!8385)

(declare-fun e!174156 () Unit!8385)

(assert (=> b!270183 (= lt!135399 e!174156)))

(declare-fun c!45514 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270183 (= c!45514 (bvslt startIndex!26 (bvsub (size!6632 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270185 () Bool)

(declare-fun e!174155 () Bool)

(assert (=> b!270185 (= e!174159 e!174155)))

(declare-fun res!134257 () Bool)

(assert (=> b!270185 (=> (not res!134257) (not e!174155))))

(declare-fun lt!135395 () SeekEntryResult!1436)

(assert (=> b!270185 (= res!134257 (or (= lt!135395 (MissingZero!1436 i!1267)) (= lt!135395 (MissingVacant!1436 i!1267))))))

(assert (=> b!270185 (= lt!135395 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270186 () Bool)

(declare-fun res!134260 () Bool)

(assert (=> b!270186 (=> (not res!134260) (not e!174155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13260 (_ BitVec 32)) Bool)

(assert (=> b!270186 (= res!134260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270187 () Bool)

(declare-fun res!134259 () Bool)

(assert (=> b!270187 (=> (not res!134259) (not e!174159))))

(declare-datatypes ((List!4060 0))(
  ( (Nil!4057) (Cons!4056 (h!4723 (_ BitVec 64)) (t!9133 List!4060)) )
))
(declare-fun arrayNoDuplicates!0 (array!13260 (_ BitVec 32) List!4060) Bool)

(assert (=> b!270187 (= res!134259 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4057))))

(declare-fun b!270188 () Bool)

(declare-fun lt!135398 () Unit!8385)

(assert (=> b!270188 (= e!174156 lt!135398)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13260 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8385)

(assert (=> b!270188 (= lt!135398 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!270188 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135396 mask!3868)))

(declare-fun b!270189 () Bool)

(assert (=> b!270189 (= e!174155 e!174157)))

(declare-fun res!134261 () Bool)

(assert (=> b!270189 (=> (not res!134261) (not e!174157))))

(assert (=> b!270189 (= res!134261 (= startIndex!26 i!1267))))

(assert (=> b!270189 (= lt!135396 (array!13261 (store (arr!6279 a!3325) i!1267 k0!2581) (size!6632 a!3325)))))

(declare-fun b!270190 () Bool)

(declare-fun res!134258 () Bool)

(assert (=> b!270190 (=> (not res!134258) (not e!174159))))

(assert (=> b!270190 (= res!134258 (and (= (size!6632 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6632 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6632 a!3325))))))

(declare-fun b!270191 () Bool)

(declare-fun res!134263 () Bool)

(assert (=> b!270191 (=> (not res!134263) (not e!174159))))

(declare-fun arrayContainsKey!0 (array!13260 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270191 (= res!134263 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270184 () Bool)

(declare-fun Unit!8387 () Unit!8385)

(assert (=> b!270184 (= e!174156 Unit!8387)))

(declare-fun res!134262 () Bool)

(assert (=> start!26174 (=> (not res!134262) (not e!174159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26174 (= res!134262 (validMask!0 mask!3868))))

(assert (=> start!26174 e!174159))

(declare-fun array_inv!4251 (array!13260) Bool)

(assert (=> start!26174 (array_inv!4251 a!3325)))

(assert (=> start!26174 true))

(assert (= (and start!26174 res!134262) b!270190))

(assert (= (and b!270190 res!134258) b!270182))

(assert (= (and b!270182 res!134256) b!270187))

(assert (= (and b!270187 res!134259) b!270191))

(assert (= (and b!270191 res!134263) b!270185))

(assert (= (and b!270185 res!134257) b!270186))

(assert (= (and b!270186 res!134260) b!270189))

(assert (= (and b!270189 res!134261) b!270183))

(assert (= (and b!270183 c!45514) b!270188))

(assert (= (and b!270183 (not c!45514)) b!270184))

(declare-fun m!285371 () Bool)

(assert (=> b!270186 m!285371))

(declare-fun m!285373 () Bool)

(assert (=> b!270183 m!285373))

(declare-fun m!285375 () Bool)

(assert (=> b!270183 m!285375))

(declare-fun m!285377 () Bool)

(assert (=> b!270185 m!285377))

(declare-fun m!285379 () Bool)

(assert (=> b!270191 m!285379))

(declare-fun m!285381 () Bool)

(assert (=> b!270189 m!285381))

(declare-fun m!285383 () Bool)

(assert (=> start!26174 m!285383))

(declare-fun m!285385 () Bool)

(assert (=> start!26174 m!285385))

(declare-fun m!285387 () Bool)

(assert (=> b!270182 m!285387))

(declare-fun m!285389 () Bool)

(assert (=> b!270187 m!285389))

(declare-fun m!285391 () Bool)

(assert (=> b!270188 m!285391))

(declare-fun m!285393 () Bool)

(assert (=> b!270188 m!285393))

(check-sat (not b!270182) (not b!270185) (not b!270187) (not b!270186) (not b!270188) (not start!26174) (not b!270191) (not b!270183))
(check-sat)
