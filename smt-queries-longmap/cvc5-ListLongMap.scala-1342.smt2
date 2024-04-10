; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26610 () Bool)

(assert start!26610)

(declare-fun b!276270 () Bool)

(declare-fun e!176520 () Bool)

(assert (=> b!276270 (= e!176520 false)))

(declare-fun lt!137586 () Bool)

(declare-datatypes ((array!13707 0))(
  ( (array!13708 (arr!6503 (Array (_ BitVec 32) (_ BitVec 64))) (size!6855 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13707)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13707 (_ BitVec 32)) Bool)

(assert (=> b!276270 (= lt!137586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!140263 () Bool)

(declare-fun e!176522 () Bool)

(assert (=> start!26610 (=> (not res!140263) (not e!176522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26610 (= res!140263 (validMask!0 mask!3868))))

(assert (=> start!26610 e!176522))

(declare-fun array_inv!4466 (array!13707) Bool)

(assert (=> start!26610 (array_inv!4466 a!3325)))

(assert (=> start!26610 true))

(declare-fun b!276271 () Bool)

(declare-fun res!140264 () Bool)

(assert (=> b!276271 (=> (not res!140264) (not e!176522))))

(declare-datatypes ((List!4311 0))(
  ( (Nil!4308) (Cons!4307 (h!4974 (_ BitVec 64)) (t!9393 List!4311)) )
))
(declare-fun arrayNoDuplicates!0 (array!13707 (_ BitVec 32) List!4311) Bool)

(assert (=> b!276271 (= res!140264 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4308))))

(declare-fun b!276272 () Bool)

(declare-fun res!140261 () Bool)

(assert (=> b!276272 (=> (not res!140261) (not e!176522))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276272 (= res!140261 (and (= (size!6855 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6855 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6855 a!3325))))))

(declare-fun b!276273 () Bool)

(assert (=> b!276273 (= e!176522 e!176520)))

(declare-fun res!140262 () Bool)

(assert (=> b!276273 (=> (not res!140262) (not e!176520))))

(declare-datatypes ((SeekEntryResult!1661 0))(
  ( (MissingZero!1661 (index!8814 (_ BitVec 32))) (Found!1661 (index!8815 (_ BitVec 32))) (Intermediate!1661 (undefined!2473 Bool) (index!8816 (_ BitVec 32)) (x!27082 (_ BitVec 32))) (Undefined!1661) (MissingVacant!1661 (index!8817 (_ BitVec 32))) )
))
(declare-fun lt!137587 () SeekEntryResult!1661)

(assert (=> b!276273 (= res!140262 (or (= lt!137587 (MissingZero!1661 i!1267)) (= lt!137587 (MissingVacant!1661 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13707 (_ BitVec 32)) SeekEntryResult!1661)

(assert (=> b!276273 (= lt!137587 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276274 () Bool)

(declare-fun res!140260 () Bool)

(assert (=> b!276274 (=> (not res!140260) (not e!176522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276274 (= res!140260 (validKeyInArray!0 k!2581))))

(declare-fun b!276275 () Bool)

(declare-fun res!140265 () Bool)

(assert (=> b!276275 (=> (not res!140265) (not e!176522))))

(declare-fun arrayContainsKey!0 (array!13707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276275 (= res!140265 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26610 res!140263) b!276272))

(assert (= (and b!276272 res!140261) b!276274))

(assert (= (and b!276274 res!140260) b!276271))

(assert (= (and b!276271 res!140264) b!276275))

(assert (= (and b!276275 res!140265) b!276273))

(assert (= (and b!276273 res!140262) b!276270))

(declare-fun m!291645 () Bool)

(assert (=> b!276271 m!291645))

(declare-fun m!291647 () Bool)

(assert (=> b!276273 m!291647))

(declare-fun m!291649 () Bool)

(assert (=> start!26610 m!291649))

(declare-fun m!291651 () Bool)

(assert (=> start!26610 m!291651))

(declare-fun m!291653 () Bool)

(assert (=> b!276275 m!291653))

(declare-fun m!291655 () Bool)

(assert (=> b!276270 m!291655))

(declare-fun m!291657 () Bool)

(assert (=> b!276274 m!291657))

(push 1)

