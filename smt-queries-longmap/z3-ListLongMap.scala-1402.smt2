; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27264 () Bool)

(assert start!27264)

(declare-fun b!282437 () Bool)

(declare-fun e!179315 () Bool)

(declare-fun e!179317 () Bool)

(assert (=> b!282437 (= e!179315 e!179317)))

(declare-fun res!145483 () Bool)

(assert (=> b!282437 (=> (not res!145483) (not e!179317))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282437 (= res!145483 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!14081 0))(
  ( (array!14082 (arr!6682 (Array (_ BitVec 32) (_ BitVec 64))) (size!7034 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14081)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!139581 () array!14081)

(assert (=> b!282437 (= lt!139581 (array!14082 (store (arr!6682 a!3325) i!1267 k0!2581) (size!7034 a!3325)))))

(declare-fun res!145481 () Bool)

(declare-fun e!179316 () Bool)

(assert (=> start!27264 (=> (not res!145481) (not e!179316))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27264 (= res!145481 (validMask!0 mask!3868))))

(assert (=> start!27264 e!179316))

(declare-fun array_inv!4632 (array!14081) Bool)

(assert (=> start!27264 (array_inv!4632 a!3325)))

(assert (=> start!27264 true))

(declare-fun b!282438 () Bool)

(declare-fun res!145484 () Bool)

(assert (=> b!282438 (=> (not res!145484) (not e!179316))))

(declare-fun arrayContainsKey!0 (array!14081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282438 (= res!145484 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282439 () Bool)

(declare-fun res!145482 () Bool)

(assert (=> b!282439 (=> (not res!145482) (not e!179316))))

(declare-datatypes ((List!4403 0))(
  ( (Nil!4400) (Cons!4399 (h!5069 (_ BitVec 64)) (t!9477 List!4403)) )
))
(declare-fun arrayNoDuplicates!0 (array!14081 (_ BitVec 32) List!4403) Bool)

(assert (=> b!282439 (= res!145482 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4400))))

(declare-fun b!282440 () Bool)

(assert (=> b!282440 (= e!179316 e!179315)))

(declare-fun res!145480 () Bool)

(assert (=> b!282440 (=> (not res!145480) (not e!179315))))

(declare-datatypes ((SeekEntryResult!1805 0))(
  ( (MissingZero!1805 (index!9390 (_ BitVec 32))) (Found!1805 (index!9391 (_ BitVec 32))) (Intermediate!1805 (undefined!2617 Bool) (index!9392 (_ BitVec 32)) (x!27715 (_ BitVec 32))) (Undefined!1805) (MissingVacant!1805 (index!9393 (_ BitVec 32))) )
))
(declare-fun lt!139580 () SeekEntryResult!1805)

(assert (=> b!282440 (= res!145480 (or (= lt!139580 (MissingZero!1805 i!1267)) (= lt!139580 (MissingVacant!1805 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14081 (_ BitVec 32)) SeekEntryResult!1805)

(assert (=> b!282440 (= lt!139580 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282441 () Bool)

(assert (=> b!282441 (= e!179317 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14081 (_ BitVec 32)) Bool)

(assert (=> b!282441 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8940 0))(
  ( (Unit!8941) )
))
(declare-fun lt!139578 () Unit!8940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14081 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8940)

(assert (=> b!282441 (= lt!139578 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282441 (= (seekEntryOrOpen!0 (select (arr!6682 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6682 a!3325) i!1267 k0!2581) startIndex!26) lt!139581 mask!3868))))

(declare-fun lt!139577 () Unit!8940)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14081 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8940)

(assert (=> b!282441 (= lt!139577 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282441 (arrayNoDuplicates!0 lt!139581 #b00000000000000000000000000000000 Nil!4400)))

(declare-fun lt!139579 () Unit!8940)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14081 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4403) Unit!8940)

(assert (=> b!282441 (= lt!139579 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4400))))

(declare-fun b!282442 () Bool)

(declare-fun res!145485 () Bool)

(assert (=> b!282442 (=> (not res!145485) (not e!179316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282442 (= res!145485 (validKeyInArray!0 k0!2581))))

(declare-fun b!282443 () Bool)

(declare-fun res!145487 () Bool)

(assert (=> b!282443 (=> (not res!145487) (not e!179316))))

(assert (=> b!282443 (= res!145487 (and (= (size!7034 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7034 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7034 a!3325))))))

(declare-fun b!282444 () Bool)

(declare-fun res!145486 () Bool)

(assert (=> b!282444 (=> (not res!145486) (not e!179315))))

(assert (=> b!282444 (= res!145486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282445 () Bool)

(declare-fun res!145488 () Bool)

(assert (=> b!282445 (=> (not res!145488) (not e!179317))))

(assert (=> b!282445 (= res!145488 (validKeyInArray!0 (select (arr!6682 a!3325) startIndex!26)))))

(assert (= (and start!27264 res!145481) b!282443))

(assert (= (and b!282443 res!145487) b!282442))

(assert (= (and b!282442 res!145485) b!282439))

(assert (= (and b!282439 res!145482) b!282438))

(assert (= (and b!282438 res!145484) b!282440))

(assert (= (and b!282440 res!145480) b!282444))

(assert (= (and b!282444 res!145486) b!282437))

(assert (= (and b!282437 res!145483) b!282445))

(assert (= (and b!282445 res!145488) b!282441))

(declare-fun m!297149 () Bool)

(assert (=> b!282444 m!297149))

(declare-fun m!297151 () Bool)

(assert (=> b!282438 m!297151))

(declare-fun m!297153 () Bool)

(assert (=> start!27264 m!297153))

(declare-fun m!297155 () Bool)

(assert (=> start!27264 m!297155))

(declare-fun m!297157 () Bool)

(assert (=> b!282442 m!297157))

(declare-fun m!297159 () Bool)

(assert (=> b!282440 m!297159))

(declare-fun m!297161 () Bool)

(assert (=> b!282441 m!297161))

(declare-fun m!297163 () Bool)

(assert (=> b!282441 m!297163))

(declare-fun m!297165 () Bool)

(assert (=> b!282441 m!297165))

(declare-fun m!297167 () Bool)

(assert (=> b!282441 m!297167))

(declare-fun m!297169 () Bool)

(assert (=> b!282441 m!297169))

(declare-fun m!297171 () Bool)

(assert (=> b!282441 m!297171))

(declare-fun m!297173 () Bool)

(assert (=> b!282441 m!297173))

(declare-fun m!297175 () Bool)

(assert (=> b!282441 m!297175))

(declare-fun m!297177 () Bool)

(assert (=> b!282441 m!297177))

(assert (=> b!282441 m!297171))

(assert (=> b!282441 m!297163))

(declare-fun m!297179 () Bool)

(assert (=> b!282441 m!297179))

(assert (=> b!282437 m!297177))

(declare-fun m!297181 () Bool)

(assert (=> b!282439 m!297181))

(assert (=> b!282445 m!297171))

(assert (=> b!282445 m!297171))

(declare-fun m!297183 () Bool)

(assert (=> b!282445 m!297183))

(check-sat (not b!282439) (not b!282440) (not b!282445) (not b!282438) (not b!282444) (not start!27264) (not b!282442) (not b!282441))
(check-sat)
