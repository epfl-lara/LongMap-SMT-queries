; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26426 () Bool)

(assert start!26426)

(declare-fun b!274170 () Bool)

(declare-fun res!138160 () Bool)

(declare-fun e!175581 () Bool)

(assert (=> b!274170 (=> (not res!138160) (not e!175581))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274170 (= res!138160 (validKeyInArray!0 k0!2581))))

(declare-fun b!274171 () Bool)

(declare-fun res!138168 () Bool)

(assert (=> b!274171 (=> (not res!138168) (not e!175581))))

(declare-datatypes ((array!13523 0))(
  ( (array!13524 (arr!6411 (Array (_ BitVec 32) (_ BitVec 64))) (size!6763 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13523)

(declare-datatypes ((List!4219 0))(
  ( (Nil!4216) (Cons!4215 (h!4882 (_ BitVec 64)) (t!9301 List!4219)) )
))
(declare-fun arrayNoDuplicates!0 (array!13523 (_ BitVec 32) List!4219) Bool)

(assert (=> b!274171 (= res!138168 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4216))))

(declare-fun b!274173 () Bool)

(declare-fun res!138165 () Bool)

(declare-fun e!175580 () Bool)

(assert (=> b!274173 (=> (not res!138165) (not e!175580))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274173 (= res!138165 (validKeyInArray!0 (select (arr!6411 a!3325) startIndex!26)))))

(declare-fun b!274174 () Bool)

(declare-fun e!175582 () Bool)

(assert (=> b!274174 (= e!175582 e!175580)))

(declare-fun res!138162 () Bool)

(assert (=> b!274174 (=> (not res!138162) (not e!175580))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274174 (= res!138162 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136791 () array!13523)

(assert (=> b!274174 (= lt!136791 (array!13524 (store (arr!6411 a!3325) i!1267 k0!2581) (size!6763 a!3325)))))

(declare-fun b!274175 () Bool)

(declare-fun res!138161 () Bool)

(assert (=> b!274175 (=> (not res!138161) (not e!175581))))

(declare-fun arrayContainsKey!0 (array!13523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274175 (= res!138161 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274176 () Bool)

(assert (=> b!274176 (= e!175580 (not true))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13523 (_ BitVec 32)) Bool)

(assert (=> b!274176 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8625 0))(
  ( (Unit!8626) )
))
(declare-fun lt!136789 () Unit!8625)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8625)

(assert (=> b!274176 (= lt!136789 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1569 0))(
  ( (MissingZero!1569 (index!8446 (_ BitVec 32))) (Found!1569 (index!8447 (_ BitVec 32))) (Intermediate!1569 (undefined!2381 Bool) (index!8448 (_ BitVec 32)) (x!26742 (_ BitVec 32))) (Undefined!1569) (MissingVacant!1569 (index!8449 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13523 (_ BitVec 32)) SeekEntryResult!1569)

(assert (=> b!274176 (= (seekEntryOrOpen!0 (select (arr!6411 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6411 a!3325) i!1267 k0!2581) startIndex!26) lt!136791 mask!3868))))

(declare-fun lt!136792 () Unit!8625)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13523 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8625)

(assert (=> b!274176 (= lt!136792 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!274176 (arrayNoDuplicates!0 lt!136791 #b00000000000000000000000000000000 Nil!4216)))

(declare-fun lt!136788 () Unit!8625)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13523 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4219) Unit!8625)

(assert (=> b!274176 (= lt!136788 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4216))))

(declare-fun b!274172 () Bool)

(declare-fun res!138163 () Bool)

(assert (=> b!274172 (=> (not res!138163) (not e!175582))))

(assert (=> b!274172 (= res!138163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!138167 () Bool)

(assert (=> start!26426 (=> (not res!138167) (not e!175581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26426 (= res!138167 (validMask!0 mask!3868))))

(assert (=> start!26426 e!175581))

(declare-fun array_inv!4374 (array!13523) Bool)

(assert (=> start!26426 (array_inv!4374 a!3325)))

(assert (=> start!26426 true))

(declare-fun b!274177 () Bool)

(assert (=> b!274177 (= e!175581 e!175582)))

(declare-fun res!138166 () Bool)

(assert (=> b!274177 (=> (not res!138166) (not e!175582))))

(declare-fun lt!136790 () SeekEntryResult!1569)

(assert (=> b!274177 (= res!138166 (or (= lt!136790 (MissingZero!1569 i!1267)) (= lt!136790 (MissingVacant!1569 i!1267))))))

(assert (=> b!274177 (= lt!136790 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274178 () Bool)

(declare-fun res!138164 () Bool)

(assert (=> b!274178 (=> (not res!138164) (not e!175581))))

(assert (=> b!274178 (= res!138164 (and (= (size!6763 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6763 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6763 a!3325))))))

(assert (= (and start!26426 res!138167) b!274178))

(assert (= (and b!274178 res!138164) b!274170))

(assert (= (and b!274170 res!138160) b!274171))

(assert (= (and b!274171 res!138168) b!274175))

(assert (= (and b!274175 res!138161) b!274177))

(assert (= (and b!274177 res!138166) b!274172))

(assert (= (and b!274172 res!138163) b!274174))

(assert (= (and b!274174 res!138162) b!274173))

(assert (= (and b!274173 res!138165) b!274176))

(declare-fun m!289605 () Bool)

(assert (=> b!274170 m!289605))

(declare-fun m!289607 () Bool)

(assert (=> b!274175 m!289607))

(declare-fun m!289609 () Bool)

(assert (=> start!26426 m!289609))

(declare-fun m!289611 () Bool)

(assert (=> start!26426 m!289611))

(declare-fun m!289613 () Bool)

(assert (=> b!274173 m!289613))

(assert (=> b!274173 m!289613))

(declare-fun m!289615 () Bool)

(assert (=> b!274173 m!289615))

(declare-fun m!289617 () Bool)

(assert (=> b!274176 m!289617))

(declare-fun m!289619 () Bool)

(assert (=> b!274176 m!289619))

(declare-fun m!289621 () Bool)

(assert (=> b!274176 m!289621))

(assert (=> b!274176 m!289621))

(declare-fun m!289623 () Bool)

(assert (=> b!274176 m!289623))

(declare-fun m!289625 () Bool)

(assert (=> b!274176 m!289625))

(declare-fun m!289627 () Bool)

(assert (=> b!274176 m!289627))

(assert (=> b!274176 m!289613))

(declare-fun m!289629 () Bool)

(assert (=> b!274176 m!289629))

(declare-fun m!289631 () Bool)

(assert (=> b!274176 m!289631))

(assert (=> b!274176 m!289613))

(declare-fun m!289633 () Bool)

(assert (=> b!274176 m!289633))

(declare-fun m!289635 () Bool)

(assert (=> b!274172 m!289635))

(assert (=> b!274174 m!289625))

(declare-fun m!289637 () Bool)

(assert (=> b!274171 m!289637))

(declare-fun m!289639 () Bool)

(assert (=> b!274177 m!289639))

(check-sat (not b!274176) (not b!274171) (not b!274175) (not b!274172) (not b!274173) (not b!274177) (not b!274170) (not start!26426))
(check-sat)
