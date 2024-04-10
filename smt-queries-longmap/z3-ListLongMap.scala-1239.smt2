; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25994 () Bool)

(assert start!25994)

(declare-fun b!268206 () Bool)

(declare-fun res!132484 () Bool)

(declare-fun e!173272 () Bool)

(assert (=> b!268206 (=> (not res!132484) (not e!173272))))

(declare-datatypes ((array!13091 0))(
  ( (array!13092 (arr!6195 (Array (_ BitVec 32) (_ BitVec 64))) (size!6547 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13091)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268206 (= res!132484 (and (= (size!6547 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6547 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6547 a!3325))))))

(declare-fun res!132488 () Bool)

(assert (=> start!25994 (=> (not res!132488) (not e!173272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25994 (= res!132488 (validMask!0 mask!3868))))

(assert (=> start!25994 e!173272))

(declare-fun array_inv!4158 (array!13091) Bool)

(assert (=> start!25994 (array_inv!4158 a!3325)))

(assert (=> start!25994 true))

(declare-fun b!268207 () Bool)

(declare-fun res!132486 () Bool)

(assert (=> b!268207 (=> (not res!132486) (not e!173272))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268207 (= res!132486 (validKeyInArray!0 k0!2581))))

(declare-fun b!268208 () Bool)

(declare-fun res!132487 () Bool)

(assert (=> b!268208 (=> (not res!132487) (not e!173272))))

(declare-fun arrayContainsKey!0 (array!13091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268208 (= res!132487 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268209 () Bool)

(declare-fun e!173273 () Bool)

(assert (=> b!268209 (= e!173272 e!173273)))

(declare-fun res!132489 () Bool)

(assert (=> b!268209 (=> (not res!132489) (not e!173273))))

(declare-datatypes ((SeekEntryResult!1353 0))(
  ( (MissingZero!1353 (index!7582 (_ BitVec 32))) (Found!1353 (index!7583 (_ BitVec 32))) (Intermediate!1353 (undefined!2165 Bool) (index!7584 (_ BitVec 32)) (x!25950 (_ BitVec 32))) (Undefined!1353) (MissingVacant!1353 (index!7585 (_ BitVec 32))) )
))
(declare-fun lt!134812 () SeekEntryResult!1353)

(assert (=> b!268209 (= res!132489 (or (= lt!134812 (MissingZero!1353 i!1267)) (= lt!134812 (MissingVacant!1353 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13091 (_ BitVec 32)) SeekEntryResult!1353)

(assert (=> b!268209 (= lt!134812 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268210 () Bool)

(assert (=> b!268210 (= e!173273 false)))

(declare-fun lt!134811 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13091 (_ BitVec 32)) Bool)

(assert (=> b!268210 (= lt!134811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268211 () Bool)

(declare-fun res!132485 () Bool)

(assert (=> b!268211 (=> (not res!132485) (not e!173272))))

(declare-datatypes ((List!4003 0))(
  ( (Nil!4000) (Cons!3999 (h!4666 (_ BitVec 64)) (t!9085 List!4003)) )
))
(declare-fun arrayNoDuplicates!0 (array!13091 (_ BitVec 32) List!4003) Bool)

(assert (=> b!268211 (= res!132485 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4000))))

(assert (= (and start!25994 res!132488) b!268206))

(assert (= (and b!268206 res!132484) b!268207))

(assert (= (and b!268207 res!132486) b!268211))

(assert (= (and b!268211 res!132485) b!268208))

(assert (= (and b!268208 res!132487) b!268209))

(assert (= (and b!268209 res!132489) b!268210))

(declare-fun m!284393 () Bool)

(assert (=> b!268207 m!284393))

(declare-fun m!284395 () Bool)

(assert (=> start!25994 m!284395))

(declare-fun m!284397 () Bool)

(assert (=> start!25994 m!284397))

(declare-fun m!284399 () Bool)

(assert (=> b!268209 m!284399))

(declare-fun m!284401 () Bool)

(assert (=> b!268208 m!284401))

(declare-fun m!284403 () Bool)

(assert (=> b!268210 m!284403))

(declare-fun m!284405 () Bool)

(assert (=> b!268211 m!284405))

(check-sat (not b!268209) (not b!268208) (not b!268207) (not start!25994) (not b!268210) (not b!268211))
(check-sat)
