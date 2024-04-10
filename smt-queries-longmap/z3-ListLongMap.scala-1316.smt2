; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26456 () Bool)

(assert start!26456)

(declare-fun b!274611 () Bool)

(declare-fun e!175798 () Bool)

(assert (=> b!274611 (= e!175798 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13553 0))(
  ( (array!13554 (arr!6426 (Array (_ BitVec 32) (_ BitVec 64))) (size!6778 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13553)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13553 (_ BitVec 32)) Bool)

(assert (=> b!274611 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8655 0))(
  ( (Unit!8656) )
))
(declare-fun lt!137053 () Unit!8655)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13553 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8655)

(assert (=> b!274611 (= lt!137053 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!137051 () array!13553)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1584 0))(
  ( (MissingZero!1584 (index!8506 (_ BitVec 32))) (Found!1584 (index!8507 (_ BitVec 32))) (Intermediate!1584 (undefined!2396 Bool) (index!8508 (_ BitVec 32)) (x!26797 (_ BitVec 32))) (Undefined!1584) (MissingVacant!1584 (index!8509 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13553 (_ BitVec 32)) SeekEntryResult!1584)

(assert (=> b!274611 (= (seekEntryOrOpen!0 (select (arr!6426 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6426 a!3325) i!1267 k0!2581) startIndex!26) lt!137051 mask!3868))))

(declare-fun lt!137049 () Unit!8655)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13553 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8655)

(assert (=> b!274611 (= lt!137049 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4234 0))(
  ( (Nil!4231) (Cons!4230 (h!4897 (_ BitVec 64)) (t!9316 List!4234)) )
))
(declare-fun arrayNoDuplicates!0 (array!13553 (_ BitVec 32) List!4234) Bool)

(assert (=> b!274611 (arrayNoDuplicates!0 lt!137051 #b00000000000000000000000000000000 Nil!4231)))

(declare-fun lt!137050 () Unit!8655)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13553 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4234) Unit!8655)

(assert (=> b!274611 (= lt!137050 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4231))))

(declare-fun b!274612 () Bool)

(declare-fun res!138605 () Bool)

(declare-fun e!175796 () Bool)

(assert (=> b!274612 (=> (not res!138605) (not e!175796))))

(assert (=> b!274612 (= res!138605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274613 () Bool)

(declare-fun e!175799 () Bool)

(assert (=> b!274613 (= e!175799 e!175796)))

(declare-fun res!138609 () Bool)

(assert (=> b!274613 (=> (not res!138609) (not e!175796))))

(declare-fun lt!137052 () SeekEntryResult!1584)

(assert (=> b!274613 (= res!138609 (or (= lt!137052 (MissingZero!1584 i!1267)) (= lt!137052 (MissingVacant!1584 i!1267))))))

(assert (=> b!274613 (= lt!137052 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274614 () Bool)

(declare-fun res!138604 () Bool)

(assert (=> b!274614 (=> (not res!138604) (not e!175799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274614 (= res!138604 (validKeyInArray!0 k0!2581))))

(declare-fun b!274615 () Bool)

(declare-fun res!138608 () Bool)

(assert (=> b!274615 (=> (not res!138608) (not e!175798))))

(assert (=> b!274615 (= res!138608 (validKeyInArray!0 (select (arr!6426 a!3325) startIndex!26)))))

(declare-fun b!274616 () Bool)

(declare-fun res!138606 () Bool)

(assert (=> b!274616 (=> (not res!138606) (not e!175799))))

(assert (=> b!274616 (= res!138606 (and (= (size!6778 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6778 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6778 a!3325))))))

(declare-fun b!274617 () Bool)

(declare-fun res!138603 () Bool)

(assert (=> b!274617 (=> (not res!138603) (not e!175799))))

(declare-fun arrayContainsKey!0 (array!13553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274617 (= res!138603 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!138601 () Bool)

(assert (=> start!26456 (=> (not res!138601) (not e!175799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26456 (= res!138601 (validMask!0 mask!3868))))

(assert (=> start!26456 e!175799))

(declare-fun array_inv!4389 (array!13553) Bool)

(assert (=> start!26456 (array_inv!4389 a!3325)))

(assert (=> start!26456 true))

(declare-fun b!274618 () Bool)

(declare-fun res!138607 () Bool)

(assert (=> b!274618 (=> (not res!138607) (not e!175799))))

(assert (=> b!274618 (= res!138607 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4231))))

(declare-fun b!274619 () Bool)

(assert (=> b!274619 (= e!175796 e!175798)))

(declare-fun res!138602 () Bool)

(assert (=> b!274619 (=> (not res!138602) (not e!175798))))

(assert (=> b!274619 (= res!138602 (not (= startIndex!26 i!1267)))))

(assert (=> b!274619 (= lt!137051 (array!13554 (store (arr!6426 a!3325) i!1267 k0!2581) (size!6778 a!3325)))))

(assert (= (and start!26456 res!138601) b!274616))

(assert (= (and b!274616 res!138606) b!274614))

(assert (= (and b!274614 res!138604) b!274618))

(assert (= (and b!274618 res!138607) b!274617))

(assert (= (and b!274617 res!138603) b!274613))

(assert (= (and b!274613 res!138609) b!274612))

(assert (= (and b!274612 res!138605) b!274619))

(assert (= (and b!274619 res!138602) b!274615))

(assert (= (and b!274615 res!138608) b!274611))

(declare-fun m!290193 () Bool)

(assert (=> b!274618 m!290193))

(declare-fun m!290195 () Bool)

(assert (=> b!274613 m!290195))

(declare-fun m!290197 () Bool)

(assert (=> b!274615 m!290197))

(assert (=> b!274615 m!290197))

(declare-fun m!290199 () Bool)

(assert (=> b!274615 m!290199))

(declare-fun m!290201 () Bool)

(assert (=> start!26456 m!290201))

(declare-fun m!290203 () Bool)

(assert (=> start!26456 m!290203))

(declare-fun m!290205 () Bool)

(assert (=> b!274617 m!290205))

(declare-fun m!290207 () Bool)

(assert (=> b!274614 m!290207))

(declare-fun m!290209 () Bool)

(assert (=> b!274612 m!290209))

(declare-fun m!290211 () Bool)

(assert (=> b!274611 m!290211))

(declare-fun m!290213 () Bool)

(assert (=> b!274611 m!290213))

(declare-fun m!290215 () Bool)

(assert (=> b!274611 m!290215))

(declare-fun m!290217 () Bool)

(assert (=> b!274611 m!290217))

(assert (=> b!274611 m!290197))

(declare-fun m!290219 () Bool)

(assert (=> b!274611 m!290219))

(declare-fun m!290221 () Bool)

(assert (=> b!274611 m!290221))

(declare-fun m!290223 () Bool)

(assert (=> b!274611 m!290223))

(assert (=> b!274611 m!290197))

(declare-fun m!290225 () Bool)

(assert (=> b!274611 m!290225))

(assert (=> b!274611 m!290213))

(declare-fun m!290227 () Bool)

(assert (=> b!274611 m!290227))

(assert (=> b!274619 m!290215))

(check-sat (not start!26456) (not b!274612) (not b!274613) (not b!274618) (not b!274615) (not b!274617) (not b!274614) (not b!274611))
(check-sat)
