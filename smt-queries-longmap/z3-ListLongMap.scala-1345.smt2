; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26628 () Bool)

(assert start!26628)

(declare-fun res!140446 () Bool)

(declare-fun e!176625 () Bool)

(assert (=> start!26628 (=> (not res!140446) (not e!176625))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26628 (= res!140446 (validMask!0 mask!3868))))

(assert (=> start!26628 e!176625))

(declare-datatypes ((array!13724 0))(
  ( (array!13725 (arr!6511 (Array (_ BitVec 32) (_ BitVec 64))) (size!6863 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13724)

(declare-fun array_inv!4461 (array!13724) Bool)

(assert (=> start!26628 (array_inv!4461 a!3325)))

(assert (=> start!26628 true))

(declare-fun b!276479 () Bool)

(declare-fun res!140447 () Bool)

(assert (=> b!276479 (=> (not res!140447) (not e!176625))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276479 (= res!140447 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276480 () Bool)

(declare-fun e!176626 () Bool)

(assert (=> b!276480 (= e!176625 e!176626)))

(declare-fun res!140443 () Bool)

(assert (=> b!276480 (=> (not res!140443) (not e!176626))))

(declare-datatypes ((SeekEntryResult!1634 0))(
  ( (MissingZero!1634 (index!8706 (_ BitVec 32))) (Found!1634 (index!8707 (_ BitVec 32))) (Intermediate!1634 (undefined!2446 Bool) (index!8708 (_ BitVec 32)) (x!27079 (_ BitVec 32))) (Undefined!1634) (MissingVacant!1634 (index!8709 (_ BitVec 32))) )
))
(declare-fun lt!137700 () SeekEntryResult!1634)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276480 (= res!140443 (or (= lt!137700 (MissingZero!1634 i!1267)) (= lt!137700 (MissingVacant!1634 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13724 (_ BitVec 32)) SeekEntryResult!1634)

(assert (=> b!276480 (= lt!137700 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276481 () Bool)

(declare-fun res!140445 () Bool)

(assert (=> b!276481 (=> (not res!140445) (not e!176625))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276481 (= res!140445 (and (= (size!6863 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6863 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6863 a!3325))))))

(declare-fun b!276482 () Bool)

(assert (=> b!276482 (= e!176626 false)))

(declare-fun lt!137699 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13724 (_ BitVec 32)) Bool)

(assert (=> b!276482 (= lt!137699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276483 () Bool)

(declare-fun res!140444 () Bool)

(assert (=> b!276483 (=> (not res!140444) (not e!176625))))

(declare-datatypes ((List!4232 0))(
  ( (Nil!4229) (Cons!4228 (h!4895 (_ BitVec 64)) (t!9306 List!4232)) )
))
(declare-fun arrayNoDuplicates!0 (array!13724 (_ BitVec 32) List!4232) Bool)

(assert (=> b!276483 (= res!140444 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4229))))

(declare-fun b!276484 () Bool)

(declare-fun res!140448 () Bool)

(assert (=> b!276484 (=> (not res!140448) (not e!176625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276484 (= res!140448 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26628 res!140446) b!276481))

(assert (= (and b!276481 res!140445) b!276484))

(assert (= (and b!276484 res!140448) b!276483))

(assert (= (and b!276483 res!140444) b!276479))

(assert (= (and b!276479 res!140447) b!276480))

(assert (= (and b!276480 res!140443) b!276482))

(declare-fun m!291977 () Bool)

(assert (=> b!276482 m!291977))

(declare-fun m!291979 () Bool)

(assert (=> b!276483 m!291979))

(declare-fun m!291981 () Bool)

(assert (=> b!276479 m!291981))

(declare-fun m!291983 () Bool)

(assert (=> start!26628 m!291983))

(declare-fun m!291985 () Bool)

(assert (=> start!26628 m!291985))

(declare-fun m!291987 () Bool)

(assert (=> b!276484 m!291987))

(declare-fun m!291989 () Bool)

(assert (=> b!276480 m!291989))

(check-sat (not b!276483) (not b!276479) (not start!26628) (not b!276484) (not b!276482) (not b!276480))
(check-sat)
