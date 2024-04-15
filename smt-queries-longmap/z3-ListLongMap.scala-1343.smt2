; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26618 () Bool)

(assert start!26618)

(declare-fun b!276177 () Bool)

(declare-fun res!140219 () Bool)

(declare-fun e!176447 () Bool)

(assert (=> b!276177 (=> (not res!140219) (not e!176447))))

(declare-datatypes ((array!13704 0))(
  ( (array!13705 (arr!6501 (Array (_ BitVec 32) (_ BitVec 64))) (size!6854 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13704)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13704 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276177 (= res!140219 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!140221 () Bool)

(assert (=> start!26618 (=> (not res!140221) (not e!176447))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26618 (= res!140221 (validMask!0 mask!3868))))

(assert (=> start!26618 e!176447))

(declare-fun array_inv!4473 (array!13704) Bool)

(assert (=> start!26618 (array_inv!4473 a!3325)))

(assert (=> start!26618 true))

(declare-fun b!276178 () Bool)

(declare-fun e!176448 () Bool)

(assert (=> b!276178 (= e!176448 false)))

(declare-fun lt!137424 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13704 (_ BitVec 32)) Bool)

(assert (=> b!276178 (= lt!137424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276179 () Bool)

(declare-fun res!140222 () Bool)

(assert (=> b!276179 (=> (not res!140222) (not e!176447))))

(declare-datatypes ((List!4282 0))(
  ( (Nil!4279) (Cons!4278 (h!4945 (_ BitVec 64)) (t!9355 List!4282)) )
))
(declare-fun arrayNoDuplicates!0 (array!13704 (_ BitVec 32) List!4282) Bool)

(assert (=> b!276179 (= res!140222 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4279))))

(declare-fun b!276180 () Bool)

(assert (=> b!276180 (= e!176447 e!176448)))

(declare-fun res!140224 () Bool)

(assert (=> b!276180 (=> (not res!140224) (not e!176448))))

(declare-datatypes ((SeekEntryResult!1658 0))(
  ( (MissingZero!1658 (index!8802 (_ BitVec 32))) (Found!1658 (index!8803 (_ BitVec 32))) (Intermediate!1658 (undefined!2470 Bool) (index!8804 (_ BitVec 32)) (x!27086 (_ BitVec 32))) (Undefined!1658) (MissingVacant!1658 (index!8805 (_ BitVec 32))) )
))
(declare-fun lt!137423 () SeekEntryResult!1658)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276180 (= res!140224 (or (= lt!137423 (MissingZero!1658 i!1267)) (= lt!137423 (MissingVacant!1658 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13704 (_ BitVec 32)) SeekEntryResult!1658)

(assert (=> b!276180 (= lt!137423 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276181 () Bool)

(declare-fun res!140223 () Bool)

(assert (=> b!276181 (=> (not res!140223) (not e!176447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276181 (= res!140223 (validKeyInArray!0 k0!2581))))

(declare-fun b!276182 () Bool)

(declare-fun res!140220 () Bool)

(assert (=> b!276182 (=> (not res!140220) (not e!176447))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276182 (= res!140220 (and (= (size!6854 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6854 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6854 a!3325))))))

(assert (= (and start!26618 res!140221) b!276182))

(assert (= (and b!276182 res!140220) b!276181))

(assert (= (and b!276181 res!140223) b!276179))

(assert (= (and b!276179 res!140222) b!276177))

(assert (= (and b!276177 res!140219) b!276180))

(assert (= (and b!276180 res!140224) b!276178))

(declare-fun m!291095 () Bool)

(assert (=> b!276178 m!291095))

(declare-fun m!291097 () Bool)

(assert (=> b!276177 m!291097))

(declare-fun m!291099 () Bool)

(assert (=> start!26618 m!291099))

(declare-fun m!291101 () Bool)

(assert (=> start!26618 m!291101))

(declare-fun m!291103 () Bool)

(assert (=> b!276180 m!291103))

(declare-fun m!291105 () Bool)

(assert (=> b!276179 m!291105))

(declare-fun m!291107 () Bool)

(assert (=> b!276181 m!291107))

(check-sat (not b!276180) (not b!276181) (not b!276178) (not start!26618) (not b!276177) (not b!276179))
(check-sat)
