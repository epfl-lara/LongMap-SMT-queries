; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26004 () Bool)

(assert start!26004)

(declare-fun b!268343 () Bool)

(declare-fun res!132597 () Bool)

(declare-fun e!173342 () Bool)

(assert (=> b!268343 (=> (not res!132597) (not e!173342))))

(declare-datatypes ((array!13100 0))(
  ( (array!13101 (arr!6199 (Array (_ BitVec 32) (_ BitVec 64))) (size!6551 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13100)

(declare-datatypes ((List!3920 0))(
  ( (Nil!3917) (Cons!3916 (h!4583 (_ BitVec 64)) (t!8994 List!3920)) )
))
(declare-fun arrayNoDuplicates!0 (array!13100 (_ BitVec 32) List!3920) Bool)

(assert (=> b!268343 (= res!132597 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3917))))

(declare-fun res!132600 () Bool)

(assert (=> start!26004 (=> (not res!132600) (not e!173342))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26004 (= res!132600 (validMask!0 mask!3868))))

(assert (=> start!26004 e!173342))

(declare-fun array_inv!4149 (array!13100) Bool)

(assert (=> start!26004 (array_inv!4149 a!3325)))

(assert (=> start!26004 true))

(declare-fun b!268344 () Bool)

(declare-fun res!132596 () Bool)

(assert (=> b!268344 (=> (not res!132596) (not e!173342))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268344 (= res!132596 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268345 () Bool)

(declare-fun e!173341 () Bool)

(assert (=> b!268345 (= e!173342 e!173341)))

(declare-fun res!132599 () Bool)

(assert (=> b!268345 (=> (not res!132599) (not e!173341))))

(declare-datatypes ((SeekEntryResult!1322 0))(
  ( (MissingZero!1322 (index!7458 (_ BitVec 32))) (Found!1322 (index!7459 (_ BitVec 32))) (Intermediate!1322 (undefined!2134 Bool) (index!7460 (_ BitVec 32)) (x!25935 (_ BitVec 32))) (Undefined!1322) (MissingVacant!1322 (index!7461 (_ BitVec 32))) )
))
(declare-fun lt!134900 () SeekEntryResult!1322)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268345 (= res!132599 (or (= lt!134900 (MissingZero!1322 i!1267)) (= lt!134900 (MissingVacant!1322 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13100 (_ BitVec 32)) SeekEntryResult!1322)

(assert (=> b!268345 (= lt!134900 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268346 () Bool)

(declare-fun res!132595 () Bool)

(assert (=> b!268346 (=> (not res!132595) (not e!173342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268346 (= res!132595 (validKeyInArray!0 k0!2581))))

(declare-fun b!268347 () Bool)

(assert (=> b!268347 (= e!173341 false)))

(declare-fun lt!134901 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13100 (_ BitVec 32)) Bool)

(assert (=> b!268347 (= lt!134901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268348 () Bool)

(declare-fun res!132598 () Bool)

(assert (=> b!268348 (=> (not res!132598) (not e!173342))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268348 (= res!132598 (and (= (size!6551 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6551 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6551 a!3325))))))

(assert (= (and start!26004 res!132600) b!268348))

(assert (= (and b!268348 res!132598) b!268346))

(assert (= (and b!268346 res!132595) b!268343))

(assert (= (and b!268343 res!132597) b!268344))

(assert (= (and b!268344 res!132596) b!268345))

(assert (= (and b!268345 res!132599) b!268347))

(declare-fun m!284669 () Bool)

(assert (=> start!26004 m!284669))

(declare-fun m!284671 () Bool)

(assert (=> start!26004 m!284671))

(declare-fun m!284673 () Bool)

(assert (=> b!268343 m!284673))

(declare-fun m!284675 () Bool)

(assert (=> b!268344 m!284675))

(declare-fun m!284677 () Bool)

(assert (=> b!268347 m!284677))

(declare-fun m!284679 () Bool)

(assert (=> b!268346 m!284679))

(declare-fun m!284681 () Bool)

(assert (=> b!268345 m!284681))

(check-sat (not b!268343) (not start!26004) (not b!268346) (not b!268347) (not b!268344) (not b!268345))
(check-sat)
