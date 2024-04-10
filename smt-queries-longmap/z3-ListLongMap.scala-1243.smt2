; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26018 () Bool)

(assert start!26018)

(declare-fun b!268431 () Bool)

(declare-fun res!132709 () Bool)

(declare-fun e!173379 () Bool)

(assert (=> b!268431 (=> (not res!132709) (not e!173379))))

(declare-datatypes ((array!13115 0))(
  ( (array!13116 (arr!6207 (Array (_ BitVec 32) (_ BitVec 64))) (size!6559 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13115)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268431 (= res!132709 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268432 () Bool)

(declare-fun res!132711 () Bool)

(assert (=> b!268432 (=> (not res!132711) (not e!173379))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268432 (= res!132711 (and (= (size!6559 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6559 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6559 a!3325))))))

(declare-fun b!268433 () Bool)

(declare-fun e!173380 () Bool)

(assert (=> b!268433 (= e!173380 false)))

(declare-fun lt!134875 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13115 (_ BitVec 32)) Bool)

(assert (=> b!268433 (= lt!134875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268434 () Bool)

(assert (=> b!268434 (= e!173379 e!173380)))

(declare-fun res!132714 () Bool)

(assert (=> b!268434 (=> (not res!132714) (not e!173380))))

(declare-datatypes ((SeekEntryResult!1365 0))(
  ( (MissingZero!1365 (index!7630 (_ BitVec 32))) (Found!1365 (index!7631 (_ BitVec 32))) (Intermediate!1365 (undefined!2177 Bool) (index!7632 (_ BitVec 32)) (x!25994 (_ BitVec 32))) (Undefined!1365) (MissingVacant!1365 (index!7633 (_ BitVec 32))) )
))
(declare-fun lt!134874 () SeekEntryResult!1365)

(assert (=> b!268434 (= res!132714 (or (= lt!134874 (MissingZero!1365 i!1267)) (= lt!134874 (MissingVacant!1365 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13115 (_ BitVec 32)) SeekEntryResult!1365)

(assert (=> b!268434 (= lt!134874 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268435 () Bool)

(declare-fun res!132712 () Bool)

(assert (=> b!268435 (=> (not res!132712) (not e!173379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268435 (= res!132712 (validKeyInArray!0 k0!2581))))

(declare-fun b!268436 () Bool)

(declare-fun res!132713 () Bool)

(assert (=> b!268436 (=> (not res!132713) (not e!173379))))

(declare-datatypes ((List!4015 0))(
  ( (Nil!4012) (Cons!4011 (h!4678 (_ BitVec 64)) (t!9097 List!4015)) )
))
(declare-fun arrayNoDuplicates!0 (array!13115 (_ BitVec 32) List!4015) Bool)

(assert (=> b!268436 (= res!132713 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4012))))

(declare-fun res!132710 () Bool)

(assert (=> start!26018 (=> (not res!132710) (not e!173379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26018 (= res!132710 (validMask!0 mask!3868))))

(assert (=> start!26018 e!173379))

(declare-fun array_inv!4170 (array!13115) Bool)

(assert (=> start!26018 (array_inv!4170 a!3325)))

(assert (=> start!26018 true))

(assert (= (and start!26018 res!132710) b!268432))

(assert (= (and b!268432 res!132711) b!268435))

(assert (= (and b!268435 res!132712) b!268436))

(assert (= (and b!268436 res!132713) b!268431))

(assert (= (and b!268431 res!132709) b!268434))

(assert (= (and b!268434 res!132714) b!268433))

(declare-fun m!284561 () Bool)

(assert (=> b!268434 m!284561))

(declare-fun m!284563 () Bool)

(assert (=> b!268433 m!284563))

(declare-fun m!284565 () Bool)

(assert (=> start!26018 m!284565))

(declare-fun m!284567 () Bool)

(assert (=> start!26018 m!284567))

(declare-fun m!284569 () Bool)

(assert (=> b!268435 m!284569))

(declare-fun m!284571 () Bool)

(assert (=> b!268431 m!284571))

(declare-fun m!284573 () Bool)

(assert (=> b!268436 m!284573))

(check-sat (not b!268434) (not start!26018) (not b!268436) (not b!268431) (not b!268433) (not b!268435))
(check-sat)
