; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26024 () Bool)

(assert start!26024)

(declare-fun b!268320 () Bool)

(declare-fun e!173298 () Bool)

(assert (=> b!268320 (= e!173298 false)))

(declare-fun lt!134705 () Bool)

(declare-datatypes ((array!13110 0))(
  ( (array!13111 (arr!6204 (Array (_ BitVec 32) (_ BitVec 64))) (size!6557 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13110)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13110 (_ BitVec 32)) Bool)

(assert (=> b!268320 (= lt!134705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268321 () Bool)

(declare-fun res!132652 () Bool)

(declare-fun e!173296 () Bool)

(assert (=> b!268321 (=> (not res!132652) (not e!173296))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268321 (= res!132652 (and (= (size!6557 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6557 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6557 a!3325))))))

(declare-fun b!268322 () Bool)

(declare-fun res!132654 () Bool)

(assert (=> b!268322 (=> (not res!132654) (not e!173296))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13110 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268322 (= res!132654 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268323 () Bool)

(declare-fun res!132651 () Bool)

(assert (=> b!268323 (=> (not res!132651) (not e!173296))))

(declare-datatypes ((List!3985 0))(
  ( (Nil!3982) (Cons!3981 (h!4648 (_ BitVec 64)) (t!9058 List!3985)) )
))
(declare-fun arrayNoDuplicates!0 (array!13110 (_ BitVec 32) List!3985) Bool)

(assert (=> b!268323 (= res!132651 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3982))))

(declare-fun res!132650 () Bool)

(assert (=> start!26024 (=> (not res!132650) (not e!173296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26024 (= res!132650 (validMask!0 mask!3868))))

(assert (=> start!26024 e!173296))

(declare-fun array_inv!4176 (array!13110) Bool)

(assert (=> start!26024 (array_inv!4176 a!3325)))

(assert (=> start!26024 true))

(declare-fun b!268324 () Bool)

(declare-fun res!132655 () Bool)

(assert (=> b!268324 (=> (not res!132655) (not e!173296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268324 (= res!132655 (validKeyInArray!0 k0!2581))))

(declare-fun b!268325 () Bool)

(assert (=> b!268325 (= e!173296 e!173298)))

(declare-fun res!132653 () Bool)

(assert (=> b!268325 (=> (not res!132653) (not e!173298))))

(declare-datatypes ((SeekEntryResult!1361 0))(
  ( (MissingZero!1361 (index!7614 (_ BitVec 32))) (Found!1361 (index!7615 (_ BitVec 32))) (Intermediate!1361 (undefined!2173 Bool) (index!7616 (_ BitVec 32)) (x!25997 (_ BitVec 32))) (Undefined!1361) (MissingVacant!1361 (index!7617 (_ BitVec 32))) )
))
(declare-fun lt!134706 () SeekEntryResult!1361)

(assert (=> b!268325 (= res!132653 (or (= lt!134706 (MissingZero!1361 i!1267)) (= lt!134706 (MissingVacant!1361 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13110 (_ BitVec 32)) SeekEntryResult!1361)

(assert (=> b!268325 (= lt!134706 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26024 res!132650) b!268321))

(assert (= (and b!268321 res!132652) b!268324))

(assert (= (and b!268324 res!132655) b!268323))

(assert (= (and b!268323 res!132651) b!268322))

(assert (= (and b!268322 res!132654) b!268325))

(assert (= (and b!268325 res!132653) b!268320))

(declare-fun m!283997 () Bool)

(assert (=> b!268323 m!283997))

(declare-fun m!283999 () Bool)

(assert (=> b!268322 m!283999))

(declare-fun m!284001 () Bool)

(assert (=> b!268320 m!284001))

(declare-fun m!284003 () Bool)

(assert (=> start!26024 m!284003))

(declare-fun m!284005 () Bool)

(assert (=> start!26024 m!284005))

(declare-fun m!284007 () Bool)

(assert (=> b!268325 m!284007))

(declare-fun m!284009 () Bool)

(assert (=> b!268324 m!284009))

(check-sat (not b!268324) (not start!26024) (not b!268320) (not b!268323) (not b!268322) (not b!268325))
(check-sat)
