; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26522 () Bool)

(assert start!26522)

(declare-fun b!275298 () Bool)

(declare-fun res!139290 () Bool)

(declare-fun e!176125 () Bool)

(assert (=> b!275298 (=> (not res!139290) (not e!176125))))

(declare-datatypes ((array!13619 0))(
  ( (array!13620 (arr!6459 (Array (_ BitVec 32) (_ BitVec 64))) (size!6811 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13619)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275298 (= res!139290 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275299 () Bool)

(declare-fun res!139292 () Bool)

(assert (=> b!275299 (=> (not res!139292) (not e!176125))))

(declare-datatypes ((List!4267 0))(
  ( (Nil!4264) (Cons!4263 (h!4930 (_ BitVec 64)) (t!9349 List!4267)) )
))
(declare-fun arrayNoDuplicates!0 (array!13619 (_ BitVec 32) List!4267) Bool)

(assert (=> b!275299 (= res!139292 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4264))))

(declare-fun b!275300 () Bool)

(declare-fun res!139291 () Bool)

(assert (=> b!275300 (=> (not res!139291) (not e!176125))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!275300 (= res!139291 (and (= (size!6811 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6811 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6811 a!3325))))))

(declare-fun b!275301 () Bool)

(declare-fun e!176126 () Bool)

(assert (=> b!275301 (= e!176125 e!176126)))

(declare-fun res!139289 () Bool)

(assert (=> b!275301 (=> (not res!139289) (not e!176126))))

(declare-datatypes ((SeekEntryResult!1617 0))(
  ( (MissingZero!1617 (index!8638 (_ BitVec 32))) (Found!1617 (index!8639 (_ BitVec 32))) (Intermediate!1617 (undefined!2429 Bool) (index!8640 (_ BitVec 32)) (x!26918 (_ BitVec 32))) (Undefined!1617) (MissingVacant!1617 (index!8641 (_ BitVec 32))) )
))
(declare-fun lt!137340 () SeekEntryResult!1617)

(assert (=> b!275301 (= res!139289 (or (= lt!137340 (MissingZero!1617 i!1267)) (= lt!137340 (MissingVacant!1617 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13619 (_ BitVec 32)) SeekEntryResult!1617)

(assert (=> b!275301 (= lt!137340 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275302 () Bool)

(assert (=> b!275302 (= e!176126 false)))

(declare-fun lt!137341 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13619 (_ BitVec 32)) Bool)

(assert (=> b!275302 (= lt!137341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!139293 () Bool)

(assert (=> start!26522 (=> (not res!139293) (not e!176125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26522 (= res!139293 (validMask!0 mask!3868))))

(assert (=> start!26522 e!176125))

(declare-fun array_inv!4422 (array!13619) Bool)

(assert (=> start!26522 (array_inv!4422 a!3325)))

(assert (=> start!26522 true))

(declare-fun b!275303 () Bool)

(declare-fun res!139288 () Bool)

(assert (=> b!275303 (=> (not res!139288) (not e!176125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275303 (= res!139288 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26522 res!139293) b!275300))

(assert (= (and b!275300 res!139291) b!275303))

(assert (= (and b!275303 res!139288) b!275299))

(assert (= (and b!275299 res!139292) b!275298))

(assert (= (and b!275298 res!139290) b!275301))

(assert (= (and b!275301 res!139289) b!275302))

(declare-fun m!290897 () Bool)

(assert (=> b!275298 m!290897))

(declare-fun m!290899 () Bool)

(assert (=> b!275301 m!290899))

(declare-fun m!290901 () Bool)

(assert (=> start!26522 m!290901))

(declare-fun m!290903 () Bool)

(assert (=> start!26522 m!290903))

(declare-fun m!290905 () Bool)

(assert (=> b!275303 m!290905))

(declare-fun m!290907 () Bool)

(assert (=> b!275302 m!290907))

(declare-fun m!290909 () Bool)

(assert (=> b!275299 m!290909))

(check-sat (not b!275303) (not b!275302) (not b!275299) (not b!275298) (not b!275301) (not start!26522))
(check-sat)
