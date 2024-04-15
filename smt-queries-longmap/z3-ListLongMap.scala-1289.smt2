; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26294 () Bool)

(assert start!26294)

(declare-fun b!272214 () Bool)

(declare-fun res!136259 () Bool)

(declare-fun e!174728 () Bool)

(assert (=> b!272214 (=> (not res!136259) (not e!174728))))

(declare-datatypes ((array!13380 0))(
  ( (array!13381 (arr!6339 (Array (_ BitVec 32) (_ BitVec 64))) (size!6692 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13380)

(declare-datatypes ((List!4120 0))(
  ( (Nil!4117) (Cons!4116 (h!4783 (_ BitVec 64)) (t!9193 List!4120)) )
))
(declare-fun arrayNoDuplicates!0 (array!13380 (_ BitVec 32) List!4120) Bool)

(assert (=> b!272214 (= res!136259 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4117))))

(declare-fun b!272215 () Bool)

(declare-fun res!136260 () Bool)

(declare-fun e!174727 () Bool)

(assert (=> b!272215 (=> (not res!136260) (not e!174727))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272215 (= res!136260 (not (= startIndex!26 i!1267)))))

(declare-fun b!272216 () Bool)

(declare-fun res!136256 () Bool)

(assert (=> b!272216 (=> (not res!136256) (not e!174728))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272216 (= res!136256 (validKeyInArray!0 k0!2581))))

(declare-fun res!136258 () Bool)

(assert (=> start!26294 (=> (not res!136258) (not e!174728))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26294 (= res!136258 (validMask!0 mask!3868))))

(assert (=> start!26294 e!174728))

(declare-fun array_inv!4311 (array!13380) Bool)

(assert (=> start!26294 (array_inv!4311 a!3325)))

(assert (=> start!26294 true))

(declare-fun b!272217 () Bool)

(declare-fun res!136263 () Bool)

(assert (=> b!272217 (=> (not res!136263) (not e!174727))))

(assert (=> b!272217 (= res!136263 (validKeyInArray!0 (select (arr!6339 a!3325) startIndex!26)))))

(declare-fun b!272218 () Bool)

(assert (=> b!272218 (= e!174728 e!174727)))

(declare-fun res!136264 () Bool)

(assert (=> b!272218 (=> (not res!136264) (not e!174727))))

(declare-datatypes ((SeekEntryResult!1496 0))(
  ( (MissingZero!1496 (index!8154 (_ BitVec 32))) (Found!1496 (index!8155 (_ BitVec 32))) (Intermediate!1496 (undefined!2308 Bool) (index!8156 (_ BitVec 32)) (x!26492 (_ BitVec 32))) (Undefined!1496) (MissingVacant!1496 (index!8157 (_ BitVec 32))) )
))
(declare-fun lt!135804 () SeekEntryResult!1496)

(assert (=> b!272218 (= res!136264 (or (= lt!135804 (MissingZero!1496 i!1267)) (= lt!135804 (MissingVacant!1496 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13380 (_ BitVec 32)) SeekEntryResult!1496)

(assert (=> b!272218 (= lt!135804 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272219 () Bool)

(declare-fun res!136261 () Bool)

(assert (=> b!272219 (=> (not res!136261) (not e!174728))))

(declare-fun arrayContainsKey!0 (array!13380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272219 (= res!136261 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272220 () Bool)

(assert (=> b!272220 (= e!174727 (not true))))

(assert (=> b!272220 (arrayNoDuplicates!0 (array!13381 (store (arr!6339 a!3325) i!1267 k0!2581) (size!6692 a!3325)) #b00000000000000000000000000000000 Nil!4117)))

(declare-datatypes ((Unit!8445 0))(
  ( (Unit!8446) )
))
(declare-fun lt!135803 () Unit!8445)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13380 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4120) Unit!8445)

(assert (=> b!272220 (= lt!135803 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4117))))

(declare-fun b!272221 () Bool)

(declare-fun res!136262 () Bool)

(assert (=> b!272221 (=> (not res!136262) (not e!174727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13380 (_ BitVec 32)) Bool)

(assert (=> b!272221 (= res!136262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272222 () Bool)

(declare-fun res!136257 () Bool)

(assert (=> b!272222 (=> (not res!136257) (not e!174728))))

(assert (=> b!272222 (= res!136257 (and (= (size!6692 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6692 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6692 a!3325))))))

(assert (= (and start!26294 res!136258) b!272222))

(assert (= (and b!272222 res!136257) b!272216))

(assert (= (and b!272216 res!136256) b!272214))

(assert (= (and b!272214 res!136259) b!272219))

(assert (= (and b!272219 res!136261) b!272218))

(assert (= (and b!272218 res!136264) b!272221))

(assert (= (and b!272221 res!136262) b!272215))

(assert (= (and b!272215 res!136260) b!272217))

(assert (= (and b!272217 res!136263) b!272220))

(declare-fun m!286877 () Bool)

(assert (=> b!272214 m!286877))

(declare-fun m!286879 () Bool)

(assert (=> b!272220 m!286879))

(declare-fun m!286881 () Bool)

(assert (=> b!272220 m!286881))

(declare-fun m!286883 () Bool)

(assert (=> b!272220 m!286883))

(declare-fun m!286885 () Bool)

(assert (=> b!272216 m!286885))

(declare-fun m!286887 () Bool)

(assert (=> b!272218 m!286887))

(declare-fun m!286889 () Bool)

(assert (=> b!272217 m!286889))

(assert (=> b!272217 m!286889))

(declare-fun m!286891 () Bool)

(assert (=> b!272217 m!286891))

(declare-fun m!286893 () Bool)

(assert (=> b!272219 m!286893))

(declare-fun m!286895 () Bool)

(assert (=> b!272221 m!286895))

(declare-fun m!286897 () Bool)

(assert (=> start!26294 m!286897))

(declare-fun m!286899 () Bool)

(assert (=> start!26294 m!286899))

(check-sat (not b!272216) (not start!26294) (not b!272219) (not b!272214) (not b!272218) (not b!272220) (not b!272217) (not b!272221))
(check-sat)
