; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26262 () Bool)

(assert start!26262)

(declare-fun b!272003 () Bool)

(declare-fun res!135970 () Bool)

(declare-fun e!174719 () Bool)

(assert (=> b!272003 (=> (not res!135970) (not e!174719))))

(declare-datatypes ((array!13358 0))(
  ( (array!13359 (arr!6328 (Array (_ BitVec 32) (_ BitVec 64))) (size!6680 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13358)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13358 (_ BitVec 32)) Bool)

(assert (=> b!272003 (= res!135970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272004 () Bool)

(assert (=> b!272004 (= e!174719 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4049 0))(
  ( (Nil!4046) (Cons!4045 (h!4712 (_ BitVec 64)) (t!9123 List!4049)) )
))
(declare-fun arrayNoDuplicates!0 (array!13358 (_ BitVec 32) List!4049) Bool)

(assert (=> b!272004 (arrayNoDuplicates!0 (array!13359 (store (arr!6328 a!3325) i!1267 k0!2581) (size!6680 a!3325)) #b00000000000000000000000000000000 Nil!4046)))

(declare-datatypes ((Unit!8441 0))(
  ( (Unit!8442) )
))
(declare-fun lt!135954 () Unit!8441)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13358 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4049) Unit!8441)

(assert (=> b!272004 (= lt!135954 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4046))))

(declare-fun res!135973 () Bool)

(declare-fun e!174717 () Bool)

(assert (=> start!26262 (=> (not res!135973) (not e!174717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26262 (= res!135973 (validMask!0 mask!3868))))

(assert (=> start!26262 e!174717))

(declare-fun array_inv!4278 (array!13358) Bool)

(assert (=> start!26262 (array_inv!4278 a!3325)))

(assert (=> start!26262 true))

(declare-fun b!272005 () Bool)

(declare-fun res!135975 () Bool)

(assert (=> b!272005 (=> (not res!135975) (not e!174717))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272005 (= res!135975 (and (= (size!6680 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6680 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6680 a!3325))))))

(declare-fun b!272006 () Bool)

(declare-fun res!135974 () Bool)

(assert (=> b!272006 (=> (not res!135974) (not e!174717))))

(declare-fun arrayContainsKey!0 (array!13358 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272006 (= res!135974 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272007 () Bool)

(declare-fun res!135968 () Bool)

(assert (=> b!272007 (=> (not res!135968) (not e!174717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272007 (= res!135968 (validKeyInArray!0 k0!2581))))

(declare-fun b!272008 () Bool)

(assert (=> b!272008 (= e!174717 e!174719)))

(declare-fun res!135967 () Bool)

(assert (=> b!272008 (=> (not res!135967) (not e!174719))))

(declare-datatypes ((SeekEntryResult!1451 0))(
  ( (MissingZero!1451 (index!7974 (_ BitVec 32))) (Found!1451 (index!7975 (_ BitVec 32))) (Intermediate!1451 (undefined!2263 Bool) (index!7976 (_ BitVec 32)) (x!26408 (_ BitVec 32))) (Undefined!1451) (MissingVacant!1451 (index!7977 (_ BitVec 32))) )
))
(declare-fun lt!135953 () SeekEntryResult!1451)

(assert (=> b!272008 (= res!135967 (or (= lt!135953 (MissingZero!1451 i!1267)) (= lt!135953 (MissingVacant!1451 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13358 (_ BitVec 32)) SeekEntryResult!1451)

(assert (=> b!272008 (= lt!135953 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272009 () Bool)

(declare-fun res!135972 () Bool)

(assert (=> b!272009 (=> (not res!135972) (not e!174719))))

(assert (=> b!272009 (= res!135972 (not (= startIndex!26 i!1267)))))

(declare-fun b!272010 () Bool)

(declare-fun res!135969 () Bool)

(assert (=> b!272010 (=> (not res!135969) (not e!174717))))

(assert (=> b!272010 (= res!135969 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4046))))

(declare-fun b!272011 () Bool)

(declare-fun res!135971 () Bool)

(assert (=> b!272011 (=> (not res!135971) (not e!174719))))

(assert (=> b!272011 (= res!135971 (validKeyInArray!0 (select (arr!6328 a!3325) startIndex!26)))))

(assert (= (and start!26262 res!135973) b!272005))

(assert (= (and b!272005 res!135975) b!272007))

(assert (= (and b!272007 res!135968) b!272010))

(assert (= (and b!272010 res!135969) b!272006))

(assert (= (and b!272006 res!135974) b!272008))

(assert (= (and b!272008 res!135967) b!272003))

(assert (= (and b!272003 res!135970) b!272009))

(assert (= (and b!272009 res!135972) b!272011))

(assert (= (and b!272011 res!135971) b!272004))

(declare-fun m!287315 () Bool)

(assert (=> b!272007 m!287315))

(declare-fun m!287317 () Bool)

(assert (=> b!272004 m!287317))

(declare-fun m!287319 () Bool)

(assert (=> b!272004 m!287319))

(declare-fun m!287321 () Bool)

(assert (=> b!272004 m!287321))

(declare-fun m!287323 () Bool)

(assert (=> b!272010 m!287323))

(declare-fun m!287325 () Bool)

(assert (=> b!272006 m!287325))

(declare-fun m!287327 () Bool)

(assert (=> start!26262 m!287327))

(declare-fun m!287329 () Bool)

(assert (=> start!26262 m!287329))

(declare-fun m!287331 () Bool)

(assert (=> b!272003 m!287331))

(declare-fun m!287333 () Bool)

(assert (=> b!272011 m!287333))

(assert (=> b!272011 m!287333))

(declare-fun m!287335 () Bool)

(assert (=> b!272011 m!287335))

(declare-fun m!287337 () Bool)

(assert (=> b!272008 m!287337))

(check-sat (not b!272010) (not b!272004) (not b!272006) (not b!272008) (not b!272003) (not b!272007) (not b!272011) (not start!26262))
(check-sat)
