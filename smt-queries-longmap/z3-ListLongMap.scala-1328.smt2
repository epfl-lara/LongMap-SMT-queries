; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26526 () Bool)

(assert start!26526)

(declare-fun b!275381 () Bool)

(declare-fun res!139349 () Bool)

(declare-fun e!176166 () Bool)

(assert (=> b!275381 (=> (not res!139349) (not e!176166))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275381 (= res!139349 (validKeyInArray!0 k0!2581))))

(declare-fun b!275382 () Bool)

(declare-fun res!139347 () Bool)

(assert (=> b!275382 (=> (not res!139347) (not e!176166))))

(declare-datatypes ((array!13622 0))(
  ( (array!13623 (arr!6460 (Array (_ BitVec 32) (_ BitVec 64))) (size!6812 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13622)

(declare-fun arrayContainsKey!0 (array!13622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275382 (= res!139347 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275383 () Bool)

(declare-fun e!176167 () Bool)

(assert (=> b!275383 (= e!176167 false)))

(declare-fun lt!137412 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13622 (_ BitVec 32)) Bool)

(assert (=> b!275383 (= lt!137412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275384 () Bool)

(declare-fun res!139346 () Bool)

(assert (=> b!275384 (=> (not res!139346) (not e!176166))))

(declare-datatypes ((List!4181 0))(
  ( (Nil!4178) (Cons!4177 (h!4844 (_ BitVec 64)) (t!9255 List!4181)) )
))
(declare-fun arrayNoDuplicates!0 (array!13622 (_ BitVec 32) List!4181) Bool)

(assert (=> b!275384 (= res!139346 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4178))))

(declare-fun b!275385 () Bool)

(assert (=> b!275385 (= e!176166 e!176167)))

(declare-fun res!139345 () Bool)

(assert (=> b!275385 (=> (not res!139345) (not e!176167))))

(declare-datatypes ((SeekEntryResult!1583 0))(
  ( (MissingZero!1583 (index!8502 (_ BitVec 32))) (Found!1583 (index!8503 (_ BitVec 32))) (Intermediate!1583 (undefined!2395 Bool) (index!8504 (_ BitVec 32)) (x!26892 (_ BitVec 32))) (Undefined!1583) (MissingVacant!1583 (index!8505 (_ BitVec 32))) )
))
(declare-fun lt!137411 () SeekEntryResult!1583)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275385 (= res!139345 (or (= lt!137411 (MissingZero!1583 i!1267)) (= lt!137411 (MissingVacant!1583 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13622 (_ BitVec 32)) SeekEntryResult!1583)

(assert (=> b!275385 (= lt!137411 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!139348 () Bool)

(assert (=> start!26526 (=> (not res!139348) (not e!176166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26526 (= res!139348 (validMask!0 mask!3868))))

(assert (=> start!26526 e!176166))

(declare-fun array_inv!4410 (array!13622) Bool)

(assert (=> start!26526 (array_inv!4410 a!3325)))

(assert (=> start!26526 true))

(declare-fun b!275386 () Bool)

(declare-fun res!139350 () Bool)

(assert (=> b!275386 (=> (not res!139350) (not e!176166))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275386 (= res!139350 (and (= (size!6812 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6812 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6812 a!3325))))))

(assert (= (and start!26526 res!139348) b!275386))

(assert (= (and b!275386 res!139350) b!275381))

(assert (= (and b!275381 res!139349) b!275384))

(assert (= (and b!275384 res!139346) b!275382))

(assert (= (and b!275382 res!139347) b!275385))

(assert (= (and b!275385 res!139345) b!275383))

(declare-fun m!291131 () Bool)

(assert (=> b!275382 m!291131))

(declare-fun m!291133 () Bool)

(assert (=> b!275385 m!291133))

(declare-fun m!291135 () Bool)

(assert (=> b!275384 m!291135))

(declare-fun m!291137 () Bool)

(assert (=> b!275381 m!291137))

(declare-fun m!291139 () Bool)

(assert (=> start!26526 m!291139))

(declare-fun m!291141 () Bool)

(assert (=> start!26526 m!291141))

(declare-fun m!291143 () Bool)

(assert (=> b!275383 m!291143))

(check-sat (not b!275384) (not b!275383) (not b!275382) (not b!275381) (not b!275385) (not start!26526))
(check-sat)
