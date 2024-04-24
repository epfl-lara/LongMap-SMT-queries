; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26022 () Bool)

(assert start!26022)

(declare-fun b!268514 () Bool)

(declare-fun res!132771 () Bool)

(declare-fun e!173422 () Bool)

(assert (=> b!268514 (=> (not res!132771) (not e!173422))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268514 (= res!132771 (validKeyInArray!0 k0!2581))))

(declare-fun b!268515 () Bool)

(declare-fun res!132770 () Bool)

(assert (=> b!268515 (=> (not res!132770) (not e!173422))))

(declare-datatypes ((array!13118 0))(
  ( (array!13119 (arr!6208 (Array (_ BitVec 32) (_ BitVec 64))) (size!6560 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13118)

(declare-datatypes ((List!3929 0))(
  ( (Nil!3926) (Cons!3925 (h!4592 (_ BitVec 64)) (t!9003 List!3929)) )
))
(declare-fun arrayNoDuplicates!0 (array!13118 (_ BitVec 32) List!3929) Bool)

(assert (=> b!268515 (= res!132770 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3926))))

(declare-fun b!268516 () Bool)

(declare-fun res!132768 () Bool)

(assert (=> b!268516 (=> (not res!132768) (not e!173422))))

(declare-fun arrayContainsKey!0 (array!13118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268516 (= res!132768 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268517 () Bool)

(declare-fun res!132769 () Bool)

(assert (=> b!268517 (=> (not res!132769) (not e!173422))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268517 (= res!132769 (and (= (size!6560 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6560 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6560 a!3325))))))

(declare-fun res!132766 () Bool)

(assert (=> start!26022 (=> (not res!132766) (not e!173422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26022 (= res!132766 (validMask!0 mask!3868))))

(assert (=> start!26022 e!173422))

(declare-fun array_inv!4158 (array!13118) Bool)

(assert (=> start!26022 (array_inv!4158 a!3325)))

(assert (=> start!26022 true))

(declare-fun b!268518 () Bool)

(declare-fun e!173423 () Bool)

(assert (=> b!268518 (= e!173422 e!173423)))

(declare-fun res!132767 () Bool)

(assert (=> b!268518 (=> (not res!132767) (not e!173423))))

(declare-datatypes ((SeekEntryResult!1331 0))(
  ( (MissingZero!1331 (index!7494 (_ BitVec 32))) (Found!1331 (index!7495 (_ BitVec 32))) (Intermediate!1331 (undefined!2143 Bool) (index!7496 (_ BitVec 32)) (x!25968 (_ BitVec 32))) (Undefined!1331) (MissingVacant!1331 (index!7497 (_ BitVec 32))) )
))
(declare-fun lt!134946 () SeekEntryResult!1331)

(assert (=> b!268518 (= res!132767 (or (= lt!134946 (MissingZero!1331 i!1267)) (= lt!134946 (MissingVacant!1331 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13118 (_ BitVec 32)) SeekEntryResult!1331)

(assert (=> b!268518 (= lt!134946 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268519 () Bool)

(assert (=> b!268519 (= e!173423 false)))

(declare-fun lt!134945 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13118 (_ BitVec 32)) Bool)

(assert (=> b!268519 (= lt!134945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26022 res!132766) b!268517))

(assert (= (and b!268517 res!132769) b!268514))

(assert (= (and b!268514 res!132771) b!268515))

(assert (= (and b!268515 res!132770) b!268516))

(assert (= (and b!268516 res!132768) b!268518))

(assert (= (and b!268518 res!132767) b!268519))

(declare-fun m!284795 () Bool)

(assert (=> b!268519 m!284795))

(declare-fun m!284797 () Bool)

(assert (=> b!268518 m!284797))

(declare-fun m!284799 () Bool)

(assert (=> b!268514 m!284799))

(declare-fun m!284801 () Bool)

(assert (=> b!268515 m!284801))

(declare-fun m!284803 () Bool)

(assert (=> b!268516 m!284803))

(declare-fun m!284805 () Bool)

(assert (=> start!26022 m!284805))

(declare-fun m!284807 () Bool)

(assert (=> start!26022 m!284807))

(check-sat (not b!268518) (not b!268519) (not start!26022) (not b!268516) (not b!268514) (not b!268515))
(check-sat)
