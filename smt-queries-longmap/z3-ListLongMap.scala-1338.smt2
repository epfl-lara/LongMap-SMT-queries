; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26588 () Bool)

(assert start!26588)

(declare-fun b!276036 () Bool)

(declare-fun res!140027 () Bool)

(declare-fun e!176421 () Bool)

(assert (=> b!276036 (=> (not res!140027) (not e!176421))))

(declare-datatypes ((array!13685 0))(
  ( (array!13686 (arr!6492 (Array (_ BitVec 32) (_ BitVec 64))) (size!6844 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13685)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276036 (= res!140027 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!140029 () Bool)

(assert (=> start!26588 (=> (not res!140029) (not e!176421))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26588 (= res!140029 (validMask!0 mask!3868))))

(assert (=> start!26588 e!176421))

(declare-fun array_inv!4455 (array!13685) Bool)

(assert (=> start!26588 (array_inv!4455 a!3325)))

(assert (=> start!26588 true))

(declare-fun b!276037 () Bool)

(declare-fun res!140030 () Bool)

(assert (=> b!276037 (=> (not res!140030) (not e!176421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276037 (= res!140030 (validKeyInArray!0 k0!2581))))

(declare-fun b!276038 () Bool)

(declare-fun e!176422 () Bool)

(assert (=> b!276038 (= e!176421 e!176422)))

(declare-fun res!140026 () Bool)

(assert (=> b!276038 (=> (not res!140026) (not e!176422))))

(declare-datatypes ((SeekEntryResult!1650 0))(
  ( (MissingZero!1650 (index!8770 (_ BitVec 32))) (Found!1650 (index!8771 (_ BitVec 32))) (Intermediate!1650 (undefined!2462 Bool) (index!8772 (_ BitVec 32)) (x!27039 (_ BitVec 32))) (Undefined!1650) (MissingVacant!1650 (index!8773 (_ BitVec 32))) )
))
(declare-fun lt!137539 () SeekEntryResult!1650)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276038 (= res!140026 (or (= lt!137539 (MissingZero!1650 i!1267)) (= lt!137539 (MissingVacant!1650 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13685 (_ BitVec 32)) SeekEntryResult!1650)

(assert (=> b!276038 (= lt!137539 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276039 () Bool)

(declare-fun res!140031 () Bool)

(assert (=> b!276039 (=> (not res!140031) (not e!176421))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276039 (= res!140031 (and (= (size!6844 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6844 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6844 a!3325))))))

(declare-fun b!276040 () Bool)

(declare-fun res!140028 () Bool)

(assert (=> b!276040 (=> (not res!140028) (not e!176421))))

(declare-datatypes ((List!4300 0))(
  ( (Nil!4297) (Cons!4296 (h!4963 (_ BitVec 64)) (t!9382 List!4300)) )
))
(declare-fun arrayNoDuplicates!0 (array!13685 (_ BitVec 32) List!4300) Bool)

(assert (=> b!276040 (= res!140028 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4297))))

(declare-fun b!276041 () Bool)

(assert (=> b!276041 (= e!176422 false)))

(declare-fun lt!137538 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13685 (_ BitVec 32)) Bool)

(assert (=> b!276041 (= lt!137538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26588 res!140029) b!276039))

(assert (= (and b!276039 res!140031) b!276037))

(assert (= (and b!276037 res!140030) b!276040))

(assert (= (and b!276040 res!140028) b!276036))

(assert (= (and b!276036 res!140027) b!276038))

(assert (= (and b!276038 res!140026) b!276041))

(declare-fun m!291479 () Bool)

(assert (=> b!276040 m!291479))

(declare-fun m!291481 () Bool)

(assert (=> b!276036 m!291481))

(declare-fun m!291483 () Bool)

(assert (=> b!276041 m!291483))

(declare-fun m!291485 () Bool)

(assert (=> b!276038 m!291485))

(declare-fun m!291487 () Bool)

(assert (=> b!276037 m!291487))

(declare-fun m!291489 () Bool)

(assert (=> start!26588 m!291489))

(declare-fun m!291491 () Bool)

(assert (=> start!26588 m!291491))

(check-sat (not b!276041) (not b!276038) (not b!276036) (not start!26588) (not b!276040) (not b!276037))
(check-sat)
