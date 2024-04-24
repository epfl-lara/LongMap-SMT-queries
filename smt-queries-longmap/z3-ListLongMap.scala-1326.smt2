; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26514 () Bool)

(assert start!26514)

(declare-fun b!275274 () Bool)

(declare-fun res!139242 () Bool)

(declare-fun e!176114 () Bool)

(assert (=> b!275274 (=> (not res!139242) (not e!176114))))

(declare-datatypes ((array!13610 0))(
  ( (array!13611 (arr!6454 (Array (_ BitVec 32) (_ BitVec 64))) (size!6806 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13610)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275274 (= res!139242 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275275 () Bool)

(declare-fun res!139237 () Bool)

(assert (=> b!275275 (=> (not res!139237) (not e!176114))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!275275 (= res!139237 (and (= (size!6806 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6806 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6806 a!3325))))))

(declare-fun b!275276 () Bool)

(declare-fun e!176113 () Bool)

(assert (=> b!275276 (= e!176114 e!176113)))

(declare-fun res!139241 () Bool)

(assert (=> b!275276 (=> (not res!139241) (not e!176113))))

(declare-datatypes ((SeekEntryResult!1577 0))(
  ( (MissingZero!1577 (index!8478 (_ BitVec 32))) (Found!1577 (index!8479 (_ BitVec 32))) (Intermediate!1577 (undefined!2389 Bool) (index!8480 (_ BitVec 32)) (x!26870 (_ BitVec 32))) (Undefined!1577) (MissingVacant!1577 (index!8481 (_ BitVec 32))) )
))
(declare-fun lt!137375 () SeekEntryResult!1577)

(assert (=> b!275276 (= res!139241 (or (= lt!137375 (MissingZero!1577 i!1267)) (= lt!137375 (MissingVacant!1577 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13610 (_ BitVec 32)) SeekEntryResult!1577)

(assert (=> b!275276 (= lt!137375 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!275277 () Bool)

(assert (=> b!275277 (= e!176113 false)))

(declare-fun lt!137376 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13610 (_ BitVec 32)) Bool)

(assert (=> b!275277 (= lt!137376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275278 () Bool)

(declare-fun res!139240 () Bool)

(assert (=> b!275278 (=> (not res!139240) (not e!176114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275278 (= res!139240 (validKeyInArray!0 k0!2581))))

(declare-fun b!275273 () Bool)

(declare-fun res!139238 () Bool)

(assert (=> b!275273 (=> (not res!139238) (not e!176114))))

(declare-datatypes ((List!4175 0))(
  ( (Nil!4172) (Cons!4171 (h!4838 (_ BitVec 64)) (t!9249 List!4175)) )
))
(declare-fun arrayNoDuplicates!0 (array!13610 (_ BitVec 32) List!4175) Bool)

(assert (=> b!275273 (= res!139238 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4172))))

(declare-fun res!139239 () Bool)

(assert (=> start!26514 (=> (not res!139239) (not e!176114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26514 (= res!139239 (validMask!0 mask!3868))))

(assert (=> start!26514 e!176114))

(declare-fun array_inv!4404 (array!13610) Bool)

(assert (=> start!26514 (array_inv!4404 a!3325)))

(assert (=> start!26514 true))

(assert (= (and start!26514 res!139239) b!275275))

(assert (= (and b!275275 res!139237) b!275278))

(assert (= (and b!275278 res!139240) b!275273))

(assert (= (and b!275273 res!139238) b!275274))

(assert (= (and b!275274 res!139242) b!275276))

(assert (= (and b!275276 res!139241) b!275277))

(declare-fun m!291047 () Bool)

(assert (=> b!275277 m!291047))

(declare-fun m!291049 () Bool)

(assert (=> b!275273 m!291049))

(declare-fun m!291051 () Bool)

(assert (=> b!275276 m!291051))

(declare-fun m!291053 () Bool)

(assert (=> b!275274 m!291053))

(declare-fun m!291055 () Bool)

(assert (=> b!275278 m!291055))

(declare-fun m!291057 () Bool)

(assert (=> start!26514 m!291057))

(declare-fun m!291059 () Bool)

(assert (=> start!26514 m!291059))

(check-sat (not b!275273) (not start!26514) (not b!275276) (not b!275277) (not b!275274) (not b!275278))
(check-sat)
