; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26630 () Bool)

(assert start!26630)

(declare-fun b!276450 () Bool)

(declare-fun e!176611 () Bool)

(declare-fun e!176610 () Bool)

(assert (=> b!276450 (= e!176611 e!176610)))

(declare-fun res!140442 () Bool)

(assert (=> b!276450 (=> (not res!140442) (not e!176610))))

(declare-datatypes ((SeekEntryResult!1671 0))(
  ( (MissingZero!1671 (index!8854 (_ BitVec 32))) (Found!1671 (index!8855 (_ BitVec 32))) (Intermediate!1671 (undefined!2483 Bool) (index!8856 (_ BitVec 32)) (x!27116 (_ BitVec 32))) (Undefined!1671) (MissingVacant!1671 (index!8857 (_ BitVec 32))) )
))
(declare-fun lt!137647 () SeekEntryResult!1671)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276450 (= res!140442 (or (= lt!137647 (MissingZero!1671 i!1267)) (= lt!137647 (MissingVacant!1671 i!1267))))))

(declare-datatypes ((array!13727 0))(
  ( (array!13728 (arr!6513 (Array (_ BitVec 32) (_ BitVec 64))) (size!6865 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13727)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13727 (_ BitVec 32)) SeekEntryResult!1671)

(assert (=> b!276450 (= lt!137647 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276451 () Bool)

(declare-fun res!140441 () Bool)

(assert (=> b!276451 (=> (not res!140441) (not e!176611))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276451 (= res!140441 (and (= (size!6865 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6865 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6865 a!3325))))))

(declare-fun b!276452 () Bool)

(declare-fun res!140445 () Bool)

(assert (=> b!276452 (=> (not res!140445) (not e!176611))))

(declare-fun arrayContainsKey!0 (array!13727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276452 (= res!140445 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276453 () Bool)

(assert (=> b!276453 (= e!176610 false)))

(declare-fun lt!137646 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13727 (_ BitVec 32)) Bool)

(assert (=> b!276453 (= lt!137646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!140444 () Bool)

(assert (=> start!26630 (=> (not res!140444) (not e!176611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26630 (= res!140444 (validMask!0 mask!3868))))

(assert (=> start!26630 e!176611))

(declare-fun array_inv!4476 (array!13727) Bool)

(assert (=> start!26630 (array_inv!4476 a!3325)))

(assert (=> start!26630 true))

(declare-fun b!276454 () Bool)

(declare-fun res!140443 () Bool)

(assert (=> b!276454 (=> (not res!140443) (not e!176611))))

(declare-datatypes ((List!4321 0))(
  ( (Nil!4318) (Cons!4317 (h!4984 (_ BitVec 64)) (t!9403 List!4321)) )
))
(declare-fun arrayNoDuplicates!0 (array!13727 (_ BitVec 32) List!4321) Bool)

(assert (=> b!276454 (= res!140443 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4318))))

(declare-fun b!276455 () Bool)

(declare-fun res!140440 () Bool)

(assert (=> b!276455 (=> (not res!140440) (not e!176611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276455 (= res!140440 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26630 res!140444) b!276451))

(assert (= (and b!276451 res!140441) b!276455))

(assert (= (and b!276455 res!140440) b!276454))

(assert (= (and b!276454 res!140443) b!276452))

(assert (= (and b!276452 res!140445) b!276450))

(assert (= (and b!276450 res!140442) b!276453))

(declare-fun m!291785 () Bool)

(assert (=> b!276455 m!291785))

(declare-fun m!291787 () Bool)

(assert (=> start!26630 m!291787))

(declare-fun m!291789 () Bool)

(assert (=> start!26630 m!291789))

(declare-fun m!291791 () Bool)

(assert (=> b!276454 m!291791))

(declare-fun m!291793 () Bool)

(assert (=> b!276453 m!291793))

(declare-fun m!291795 () Bool)

(assert (=> b!276450 m!291795))

(declare-fun m!291797 () Bool)

(assert (=> b!276452 m!291797))

(check-sat (not b!276455) (not b!276450) (not b!276452) (not b!276453) (not b!276454) (not start!26630))
(check-sat)
