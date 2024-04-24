; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26532 () Bool)

(assert start!26532)

(declare-fun b!275435 () Bool)

(declare-fun res!139404 () Bool)

(declare-fun e!176194 () Bool)

(assert (=> b!275435 (=> (not res!139404) (not e!176194))))

(declare-datatypes ((array!13628 0))(
  ( (array!13629 (arr!6463 (Array (_ BitVec 32) (_ BitVec 64))) (size!6815 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13628)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!275435 (= res!139404 (and (= (size!6815 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6815 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6815 a!3325))))))

(declare-fun b!275436 () Bool)

(declare-fun e!176195 () Bool)

(assert (=> b!275436 (= e!176194 e!176195)))

(declare-fun res!139401 () Bool)

(assert (=> b!275436 (=> (not res!139401) (not e!176195))))

(declare-datatypes ((SeekEntryResult!1586 0))(
  ( (MissingZero!1586 (index!8514 (_ BitVec 32))) (Found!1586 (index!8515 (_ BitVec 32))) (Intermediate!1586 (undefined!2398 Bool) (index!8516 (_ BitVec 32)) (x!26903 (_ BitVec 32))) (Undefined!1586) (MissingVacant!1586 (index!8517 (_ BitVec 32))) )
))
(declare-fun lt!137429 () SeekEntryResult!1586)

(assert (=> b!275436 (= res!139401 (or (= lt!137429 (MissingZero!1586 i!1267)) (= lt!137429 (MissingVacant!1586 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13628 (_ BitVec 32)) SeekEntryResult!1586)

(assert (=> b!275436 (= lt!137429 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!139400 () Bool)

(assert (=> start!26532 (=> (not res!139400) (not e!176194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26532 (= res!139400 (validMask!0 mask!3868))))

(assert (=> start!26532 e!176194))

(declare-fun array_inv!4413 (array!13628) Bool)

(assert (=> start!26532 (array_inv!4413 a!3325)))

(assert (=> start!26532 true))

(declare-fun b!275437 () Bool)

(declare-fun res!139403 () Bool)

(assert (=> b!275437 (=> (not res!139403) (not e!176194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275437 (= res!139403 (validKeyInArray!0 k0!2581))))

(declare-fun b!275438 () Bool)

(declare-fun res!139399 () Bool)

(assert (=> b!275438 (=> (not res!139399) (not e!176194))))

(declare-fun arrayContainsKey!0 (array!13628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275438 (= res!139399 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275439 () Bool)

(declare-fun res!139402 () Bool)

(assert (=> b!275439 (=> (not res!139402) (not e!176194))))

(declare-datatypes ((List!4184 0))(
  ( (Nil!4181) (Cons!4180 (h!4847 (_ BitVec 64)) (t!9258 List!4184)) )
))
(declare-fun arrayNoDuplicates!0 (array!13628 (_ BitVec 32) List!4184) Bool)

(assert (=> b!275439 (= res!139402 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4181))))

(declare-fun b!275440 () Bool)

(assert (=> b!275440 (= e!176195 false)))

(declare-fun lt!137430 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13628 (_ BitVec 32)) Bool)

(assert (=> b!275440 (= lt!137430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26532 res!139400) b!275435))

(assert (= (and b!275435 res!139404) b!275437))

(assert (= (and b!275437 res!139403) b!275439))

(assert (= (and b!275439 res!139402) b!275438))

(assert (= (and b!275438 res!139399) b!275436))

(assert (= (and b!275436 res!139401) b!275440))

(declare-fun m!291173 () Bool)

(assert (=> start!26532 m!291173))

(declare-fun m!291175 () Bool)

(assert (=> start!26532 m!291175))

(declare-fun m!291177 () Bool)

(assert (=> b!275439 m!291177))

(declare-fun m!291179 () Bool)

(assert (=> b!275436 m!291179))

(declare-fun m!291181 () Bool)

(assert (=> b!275440 m!291181))

(declare-fun m!291183 () Bool)

(assert (=> b!275437 m!291183))

(declare-fun m!291185 () Bool)

(assert (=> b!275438 m!291185))

(check-sat (not b!275438) (not b!275439) (not b!275440) (not b!275436) (not start!26532) (not b!275437))
(check-sat)
