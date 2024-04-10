; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26606 () Bool)

(assert start!26606)

(declare-fun b!276234 () Bool)

(declare-fun res!140225 () Bool)

(declare-fun e!176504 () Bool)

(assert (=> b!276234 (=> (not res!140225) (not e!176504))))

(declare-datatypes ((array!13703 0))(
  ( (array!13704 (arr!6501 (Array (_ BitVec 32) (_ BitVec 64))) (size!6853 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13703)

(declare-datatypes ((List!4309 0))(
  ( (Nil!4306) (Cons!4305 (h!4972 (_ BitVec 64)) (t!9391 List!4309)) )
))
(declare-fun arrayNoDuplicates!0 (array!13703 (_ BitVec 32) List!4309) Bool)

(assert (=> b!276234 (= res!140225 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4306))))

(declare-fun b!276235 () Bool)

(declare-fun res!140228 () Bool)

(assert (=> b!276235 (=> (not res!140228) (not e!176504))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276235 (= res!140228 (validKeyInArray!0 k0!2581))))

(declare-fun res!140224 () Bool)

(assert (=> start!26606 (=> (not res!140224) (not e!176504))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26606 (= res!140224 (validMask!0 mask!3868))))

(assert (=> start!26606 e!176504))

(declare-fun array_inv!4464 (array!13703) Bool)

(assert (=> start!26606 (array_inv!4464 a!3325)))

(assert (=> start!26606 true))

(declare-fun b!276236 () Bool)

(declare-fun e!176503 () Bool)

(assert (=> b!276236 (= e!176503 false)))

(declare-fun lt!137574 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13703 (_ BitVec 32)) Bool)

(assert (=> b!276236 (= lt!137574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276237 () Bool)

(declare-fun res!140226 () Bool)

(assert (=> b!276237 (=> (not res!140226) (not e!176504))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276237 (= res!140226 (and (= (size!6853 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6853 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6853 a!3325))))))

(declare-fun b!276238 () Bool)

(declare-fun res!140229 () Bool)

(assert (=> b!276238 (=> (not res!140229) (not e!176504))))

(declare-fun arrayContainsKey!0 (array!13703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276238 (= res!140229 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276239 () Bool)

(assert (=> b!276239 (= e!176504 e!176503)))

(declare-fun res!140227 () Bool)

(assert (=> b!276239 (=> (not res!140227) (not e!176503))))

(declare-datatypes ((SeekEntryResult!1659 0))(
  ( (MissingZero!1659 (index!8806 (_ BitVec 32))) (Found!1659 (index!8807 (_ BitVec 32))) (Intermediate!1659 (undefined!2471 Bool) (index!8808 (_ BitVec 32)) (x!27072 (_ BitVec 32))) (Undefined!1659) (MissingVacant!1659 (index!8809 (_ BitVec 32))) )
))
(declare-fun lt!137575 () SeekEntryResult!1659)

(assert (=> b!276239 (= res!140227 (or (= lt!137575 (MissingZero!1659 i!1267)) (= lt!137575 (MissingVacant!1659 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13703 (_ BitVec 32)) SeekEntryResult!1659)

(assert (=> b!276239 (= lt!137575 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26606 res!140224) b!276237))

(assert (= (and b!276237 res!140226) b!276235))

(assert (= (and b!276235 res!140228) b!276234))

(assert (= (and b!276234 res!140225) b!276238))

(assert (= (and b!276238 res!140229) b!276239))

(assert (= (and b!276239 res!140227) b!276236))

(declare-fun m!291617 () Bool)

(assert (=> b!276235 m!291617))

(declare-fun m!291619 () Bool)

(assert (=> start!26606 m!291619))

(declare-fun m!291621 () Bool)

(assert (=> start!26606 m!291621))

(declare-fun m!291623 () Bool)

(assert (=> b!276236 m!291623))

(declare-fun m!291625 () Bool)

(assert (=> b!276238 m!291625))

(declare-fun m!291627 () Bool)

(assert (=> b!276234 m!291627))

(declare-fun m!291629 () Bool)

(assert (=> b!276239 m!291629))

(check-sat (not start!26606) (not b!276239) (not b!276238) (not b!276235) (not b!276236) (not b!276234))
(check-sat)
