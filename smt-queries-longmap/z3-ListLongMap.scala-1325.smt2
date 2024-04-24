; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26508 () Bool)

(assert start!26508)

(declare-fun b!275219 () Bool)

(declare-fun res!139186 () Bool)

(declare-fun e!176087 () Bool)

(assert (=> b!275219 (=> (not res!139186) (not e!176087))))

(declare-datatypes ((array!13604 0))(
  ( (array!13605 (arr!6451 (Array (_ BitVec 32) (_ BitVec 64))) (size!6803 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13604)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275219 (= res!139186 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275220 () Bool)

(declare-fun e!176086 () Bool)

(assert (=> b!275220 (= e!176087 e!176086)))

(declare-fun res!139187 () Bool)

(assert (=> b!275220 (=> (not res!139187) (not e!176086))))

(declare-datatypes ((SeekEntryResult!1574 0))(
  ( (MissingZero!1574 (index!8466 (_ BitVec 32))) (Found!1574 (index!8467 (_ BitVec 32))) (Intermediate!1574 (undefined!2386 Bool) (index!8468 (_ BitVec 32)) (x!26859 (_ BitVec 32))) (Undefined!1574) (MissingVacant!1574 (index!8469 (_ BitVec 32))) )
))
(declare-fun lt!137358 () SeekEntryResult!1574)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275220 (= res!139187 (or (= lt!137358 (MissingZero!1574 i!1267)) (= lt!137358 (MissingVacant!1574 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13604 (_ BitVec 32)) SeekEntryResult!1574)

(assert (=> b!275220 (= lt!137358 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!139185 () Bool)

(assert (=> start!26508 (=> (not res!139185) (not e!176087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26508 (= res!139185 (validMask!0 mask!3868))))

(assert (=> start!26508 e!176087))

(declare-fun array_inv!4401 (array!13604) Bool)

(assert (=> start!26508 (array_inv!4401 a!3325)))

(assert (=> start!26508 true))

(declare-fun b!275221 () Bool)

(declare-fun res!139188 () Bool)

(assert (=> b!275221 (=> (not res!139188) (not e!176087))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275221 (= res!139188 (and (= (size!6803 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6803 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6803 a!3325))))))

(declare-fun b!275222 () Bool)

(assert (=> b!275222 (= e!176086 false)))

(declare-fun lt!137357 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13604 (_ BitVec 32)) Bool)

(assert (=> b!275222 (= lt!137357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275223 () Bool)

(declare-fun res!139184 () Bool)

(assert (=> b!275223 (=> (not res!139184) (not e!176087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275223 (= res!139184 (validKeyInArray!0 k0!2581))))

(declare-fun b!275224 () Bool)

(declare-fun res!139183 () Bool)

(assert (=> b!275224 (=> (not res!139183) (not e!176087))))

(declare-datatypes ((List!4172 0))(
  ( (Nil!4169) (Cons!4168 (h!4835 (_ BitVec 64)) (t!9246 List!4172)) )
))
(declare-fun arrayNoDuplicates!0 (array!13604 (_ BitVec 32) List!4172) Bool)

(assert (=> b!275224 (= res!139183 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4169))))

(assert (= (and start!26508 res!139185) b!275221))

(assert (= (and b!275221 res!139188) b!275223))

(assert (= (and b!275223 res!139184) b!275224))

(assert (= (and b!275224 res!139183) b!275219))

(assert (= (and b!275219 res!139186) b!275220))

(assert (= (and b!275220 res!139187) b!275222))

(declare-fun m!291005 () Bool)

(assert (=> b!275224 m!291005))

(declare-fun m!291007 () Bool)

(assert (=> b!275222 m!291007))

(declare-fun m!291009 () Bool)

(assert (=> start!26508 m!291009))

(declare-fun m!291011 () Bool)

(assert (=> start!26508 m!291011))

(declare-fun m!291013 () Bool)

(assert (=> b!275219 m!291013))

(declare-fun m!291015 () Bool)

(assert (=> b!275223 m!291015))

(declare-fun m!291017 () Bool)

(assert (=> b!275220 m!291017))

(check-sat (not start!26508) (not b!275220) (not b!275224) (not b!275222) (not b!275223) (not b!275219))
(check-sat)
