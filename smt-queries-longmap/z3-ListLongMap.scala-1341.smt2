; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26604 () Bool)

(assert start!26604)

(declare-fun b!276263 () Bool)

(declare-fun res!140232 () Bool)

(declare-fun e!176517 () Bool)

(assert (=> b!276263 (=> (not res!140232) (not e!176517))))

(declare-datatypes ((array!13700 0))(
  ( (array!13701 (arr!6499 (Array (_ BitVec 32) (_ BitVec 64))) (size!6851 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13700)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276263 (= res!140232 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276264 () Bool)

(declare-fun res!140227 () Bool)

(assert (=> b!276264 (=> (not res!140227) (not e!176517))))

(declare-datatypes ((List!4220 0))(
  ( (Nil!4217) (Cons!4216 (h!4883 (_ BitVec 64)) (t!9294 List!4220)) )
))
(declare-fun arrayNoDuplicates!0 (array!13700 (_ BitVec 32) List!4220) Bool)

(assert (=> b!276264 (= res!140227 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4217))))

(declare-fun b!276265 () Bool)

(declare-fun e!176519 () Bool)

(assert (=> b!276265 (= e!176519 false)))

(declare-fun lt!137627 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13700 (_ BitVec 32)) Bool)

(assert (=> b!276265 (= lt!137627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276266 () Bool)

(declare-fun res!140231 () Bool)

(assert (=> b!276266 (=> (not res!140231) (not e!176517))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276266 (= res!140231 (and (= (size!6851 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6851 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6851 a!3325))))))

(declare-fun res!140228 () Bool)

(assert (=> start!26604 (=> (not res!140228) (not e!176517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26604 (= res!140228 (validMask!0 mask!3868))))

(assert (=> start!26604 e!176517))

(declare-fun array_inv!4449 (array!13700) Bool)

(assert (=> start!26604 (array_inv!4449 a!3325)))

(assert (=> start!26604 true))

(declare-fun b!276267 () Bool)

(declare-fun res!140230 () Bool)

(assert (=> b!276267 (=> (not res!140230) (not e!176517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276267 (= res!140230 (validKeyInArray!0 k0!2581))))

(declare-fun b!276268 () Bool)

(assert (=> b!276268 (= e!176517 e!176519)))

(declare-fun res!140229 () Bool)

(assert (=> b!276268 (=> (not res!140229) (not e!176519))))

(declare-datatypes ((SeekEntryResult!1622 0))(
  ( (MissingZero!1622 (index!8658 (_ BitVec 32))) (Found!1622 (index!8659 (_ BitVec 32))) (Intermediate!1622 (undefined!2434 Bool) (index!8660 (_ BitVec 32)) (x!27035 (_ BitVec 32))) (Undefined!1622) (MissingVacant!1622 (index!8661 (_ BitVec 32))) )
))
(declare-fun lt!137628 () SeekEntryResult!1622)

(assert (=> b!276268 (= res!140229 (or (= lt!137628 (MissingZero!1622 i!1267)) (= lt!137628 (MissingVacant!1622 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13700 (_ BitVec 32)) SeekEntryResult!1622)

(assert (=> b!276268 (= lt!137628 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26604 res!140228) b!276266))

(assert (= (and b!276266 res!140231) b!276267))

(assert (= (and b!276267 res!140230) b!276264))

(assert (= (and b!276264 res!140227) b!276263))

(assert (= (and b!276263 res!140232) b!276268))

(assert (= (and b!276268 res!140229) b!276265))

(declare-fun m!291809 () Bool)

(assert (=> b!276267 m!291809))

(declare-fun m!291811 () Bool)

(assert (=> start!26604 m!291811))

(declare-fun m!291813 () Bool)

(assert (=> start!26604 m!291813))

(declare-fun m!291815 () Bool)

(assert (=> b!276263 m!291815))

(declare-fun m!291817 () Bool)

(assert (=> b!276265 m!291817))

(declare-fun m!291819 () Bool)

(assert (=> b!276264 m!291819))

(declare-fun m!291821 () Bool)

(assert (=> b!276268 m!291821))

(check-sat (not b!276263) (not start!26604) (not b!276264) (not b!276267) (not b!276268) (not b!276265))
(check-sat)
