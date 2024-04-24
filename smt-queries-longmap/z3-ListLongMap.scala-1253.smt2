; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26076 () Bool)

(assert start!26076)

(declare-fun b!269000 () Bool)

(declare-fun res!133254 () Bool)

(declare-fun e!173665 () Bool)

(assert (=> b!269000 (=> (not res!133254) (not e!173665))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269000 (= res!133254 (validKeyInArray!0 k0!2581))))

(declare-fun b!269001 () Bool)

(declare-fun e!173666 () Bool)

(assert (=> b!269001 (= e!173666 false)))

(declare-fun lt!135107 () Bool)

(declare-datatypes ((array!13172 0))(
  ( (array!13173 (arr!6235 (Array (_ BitVec 32) (_ BitVec 64))) (size!6587 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13172)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13172 (_ BitVec 32)) Bool)

(assert (=> b!269001 (= lt!135107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!133255 () Bool)

(assert (=> start!26076 (=> (not res!133255) (not e!173665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26076 (= res!133255 (validMask!0 mask!3868))))

(assert (=> start!26076 e!173665))

(declare-fun array_inv!4185 (array!13172) Bool)

(assert (=> start!26076 (array_inv!4185 a!3325)))

(assert (=> start!26076 true))

(declare-fun b!269002 () Bool)

(assert (=> b!269002 (= e!173665 e!173666)))

(declare-fun res!133257 () Bool)

(assert (=> b!269002 (=> (not res!133257) (not e!173666))))

(declare-datatypes ((SeekEntryResult!1358 0))(
  ( (MissingZero!1358 (index!7602 (_ BitVec 32))) (Found!1358 (index!7603 (_ BitVec 32))) (Intermediate!1358 (undefined!2170 Bool) (index!7604 (_ BitVec 32)) (x!26067 (_ BitVec 32))) (Undefined!1358) (MissingVacant!1358 (index!7605 (_ BitVec 32))) )
))
(declare-fun lt!135108 () SeekEntryResult!1358)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269002 (= res!133257 (or (= lt!135108 (MissingZero!1358 i!1267)) (= lt!135108 (MissingVacant!1358 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13172 (_ BitVec 32)) SeekEntryResult!1358)

(assert (=> b!269002 (= lt!135108 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269003 () Bool)

(declare-fun res!133252 () Bool)

(assert (=> b!269003 (=> (not res!133252) (not e!173665))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269003 (= res!133252 (and (= (size!6587 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6587 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6587 a!3325))))))

(declare-fun b!269004 () Bool)

(declare-fun res!133253 () Bool)

(assert (=> b!269004 (=> (not res!133253) (not e!173665))))

(declare-fun arrayContainsKey!0 (array!13172 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269004 (= res!133253 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269005 () Bool)

(declare-fun res!133256 () Bool)

(assert (=> b!269005 (=> (not res!133256) (not e!173665))))

(declare-datatypes ((List!3956 0))(
  ( (Nil!3953) (Cons!3952 (h!4619 (_ BitVec 64)) (t!9030 List!3956)) )
))
(declare-fun arrayNoDuplicates!0 (array!13172 (_ BitVec 32) List!3956) Bool)

(assert (=> b!269005 (= res!133256 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3953))))

(assert (= (and start!26076 res!133255) b!269003))

(assert (= (and b!269003 res!133252) b!269000))

(assert (= (and b!269000 res!133254) b!269005))

(assert (= (and b!269005 res!133256) b!269004))

(assert (= (and b!269004 res!133253) b!269002))

(assert (= (and b!269002 res!133257) b!269001))

(declare-fun m!285173 () Bool)

(assert (=> b!269005 m!285173))

(declare-fun m!285175 () Bool)

(assert (=> b!269001 m!285175))

(declare-fun m!285177 () Bool)

(assert (=> b!269002 m!285177))

(declare-fun m!285179 () Bool)

(assert (=> start!26076 m!285179))

(declare-fun m!285181 () Bool)

(assert (=> start!26076 m!285181))

(declare-fun m!285183 () Bool)

(assert (=> b!269000 m!285183))

(declare-fun m!285185 () Bool)

(assert (=> b!269004 m!285185))

(check-sat (not b!269000) (not b!269005) (not start!26076) (not b!269004) (not b!269002) (not b!269001))
(check-sat)
