; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26522 () Bool)

(assert start!26522)

(declare-fun b!275133 () Bool)

(declare-fun res!139179 () Bool)

(declare-fun e!176014 () Bool)

(assert (=> b!275133 (=> (not res!139179) (not e!176014))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275133 (= res!139179 (validKeyInArray!0 k0!2581))))

(declare-fun b!275134 () Bool)

(declare-fun res!139176 () Bool)

(assert (=> b!275134 (=> (not res!139176) (not e!176014))))

(declare-datatypes ((array!13608 0))(
  ( (array!13609 (arr!6453 (Array (_ BitVec 32) (_ BitVec 64))) (size!6806 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13608)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!275134 (= res!139176 (and (= (size!6806 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6806 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6806 a!3325))))))

(declare-fun b!275135 () Bool)

(declare-fun res!139180 () Bool)

(assert (=> b!275135 (=> (not res!139180) (not e!176014))))

(declare-fun arrayContainsKey!0 (array!13608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275135 (= res!139180 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275136 () Bool)

(declare-fun res!139175 () Bool)

(assert (=> b!275136 (=> (not res!139175) (not e!176014))))

(declare-datatypes ((List!4234 0))(
  ( (Nil!4231) (Cons!4230 (h!4897 (_ BitVec 64)) (t!9307 List!4234)) )
))
(declare-fun arrayNoDuplicates!0 (array!13608 (_ BitVec 32) List!4234) Bool)

(assert (=> b!275136 (= res!139175 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4231))))

(declare-fun b!275137 () Bool)

(declare-fun e!176015 () Bool)

(assert (=> b!275137 (= e!176014 e!176015)))

(declare-fun res!139177 () Bool)

(assert (=> b!275137 (=> (not res!139177) (not e!176015))))

(declare-datatypes ((SeekEntryResult!1610 0))(
  ( (MissingZero!1610 (index!8610 (_ BitVec 32))) (Found!1610 (index!8611 (_ BitVec 32))) (Intermediate!1610 (undefined!2422 Bool) (index!8612 (_ BitVec 32)) (x!26910 (_ BitVec 32))) (Undefined!1610) (MissingVacant!1610 (index!8613 (_ BitVec 32))) )
))
(declare-fun lt!137154 () SeekEntryResult!1610)

(assert (=> b!275137 (= res!139177 (or (= lt!137154 (MissingZero!1610 i!1267)) (= lt!137154 (MissingVacant!1610 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13608 (_ BitVec 32)) SeekEntryResult!1610)

(assert (=> b!275137 (= lt!137154 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275138 () Bool)

(assert (=> b!275138 (= e!176015 false)))

(declare-fun lt!137153 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13608 (_ BitVec 32)) Bool)

(assert (=> b!275138 (= lt!137153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!139178 () Bool)

(assert (=> start!26522 (=> (not res!139178) (not e!176014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26522 (= res!139178 (validMask!0 mask!3868))))

(assert (=> start!26522 e!176014))

(declare-fun array_inv!4425 (array!13608) Bool)

(assert (=> start!26522 (array_inv!4425 a!3325)))

(assert (=> start!26522 true))

(assert (= (and start!26522 res!139178) b!275134))

(assert (= (and b!275134 res!139176) b!275133))

(assert (= (and b!275133 res!139179) b!275136))

(assert (= (and b!275136 res!139175) b!275135))

(assert (= (and b!275135 res!139180) b!275137))

(assert (= (and b!275137 res!139177) b!275138))

(declare-fun m!290291 () Bool)

(assert (=> b!275136 m!290291))

(declare-fun m!290293 () Bool)

(assert (=> start!26522 m!290293))

(declare-fun m!290295 () Bool)

(assert (=> start!26522 m!290295))

(declare-fun m!290297 () Bool)

(assert (=> b!275138 m!290297))

(declare-fun m!290299 () Bool)

(assert (=> b!275137 m!290299))

(declare-fun m!290301 () Bool)

(assert (=> b!275135 m!290301))

(declare-fun m!290303 () Bool)

(assert (=> b!275133 m!290303))

(check-sat (not b!275138) (not b!275133) (not start!26522) (not b!275135) (not b!275136) (not b!275137))
(check-sat)
