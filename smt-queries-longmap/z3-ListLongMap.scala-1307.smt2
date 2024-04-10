; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26402 () Bool)

(assert start!26402)

(declare-fun b!273846 () Bool)

(declare-fun res!137840 () Bool)

(declare-fun e!175439 () Bool)

(assert (=> b!273846 (=> (not res!137840) (not e!175439))))

(declare-datatypes ((array!13499 0))(
  ( (array!13500 (arr!6399 (Array (_ BitVec 32) (_ BitVec 64))) (size!6751 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13499)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273846 (= res!137840 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273847 () Bool)

(declare-fun res!137839 () Bool)

(declare-fun e!175437 () Bool)

(assert (=> b!273847 (=> (not res!137839) (not e!175437))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273847 (= res!137839 (validKeyInArray!0 (select (arr!6399 a!3325) startIndex!26)))))

(declare-fun b!273848 () Bool)

(declare-fun res!137842 () Bool)

(declare-fun e!175438 () Bool)

(assert (=> b!273848 (=> (not res!137842) (not e!175438))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13499 (_ BitVec 32)) Bool)

(assert (=> b!273848 (= res!137842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273849 () Bool)

(assert (=> b!273849 (= e!175439 e!175438)))

(declare-fun res!137841 () Bool)

(assert (=> b!273849 (=> (not res!137841) (not e!175438))))

(declare-datatypes ((SeekEntryResult!1557 0))(
  ( (MissingZero!1557 (index!8398 (_ BitVec 32))) (Found!1557 (index!8399 (_ BitVec 32))) (Intermediate!1557 (undefined!2369 Bool) (index!8400 (_ BitVec 32)) (x!26698 (_ BitVec 32))) (Undefined!1557) (MissingVacant!1557 (index!8401 (_ BitVec 32))) )
))
(declare-fun lt!136610 () SeekEntryResult!1557)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273849 (= res!137841 (or (= lt!136610 (MissingZero!1557 i!1267)) (= lt!136610 (MissingVacant!1557 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13499 (_ BitVec 32)) SeekEntryResult!1557)

(assert (=> b!273849 (= lt!136610 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273850 () Bool)

(declare-fun res!137836 () Bool)

(assert (=> b!273850 (=> (not res!137836) (not e!175439))))

(assert (=> b!273850 (= res!137836 (validKeyInArray!0 k0!2581))))

(declare-fun b!273851 () Bool)

(assert (=> b!273851 (= e!175437 (not true))))

(assert (=> b!273851 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8601 0))(
  ( (Unit!8602) )
))
(declare-fun lt!136611 () Unit!8601)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8601)

(assert (=> b!273851 (= lt!136611 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136612 () array!13499)

(assert (=> b!273851 (= (seekEntryOrOpen!0 (select (arr!6399 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6399 a!3325) i!1267 k0!2581) startIndex!26) lt!136612 mask!3868))))

(declare-fun lt!136608 () Unit!8601)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13499 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8601)

(assert (=> b!273851 (= lt!136608 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4207 0))(
  ( (Nil!4204) (Cons!4203 (h!4870 (_ BitVec 64)) (t!9289 List!4207)) )
))
(declare-fun arrayNoDuplicates!0 (array!13499 (_ BitVec 32) List!4207) Bool)

(assert (=> b!273851 (arrayNoDuplicates!0 lt!136612 #b00000000000000000000000000000000 Nil!4204)))

(declare-fun lt!136609 () Unit!8601)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13499 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4207) Unit!8601)

(assert (=> b!273851 (= lt!136609 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4204))))

(declare-fun b!273852 () Bool)

(assert (=> b!273852 (= e!175438 e!175437)))

(declare-fun res!137838 () Bool)

(assert (=> b!273852 (=> (not res!137838) (not e!175437))))

(assert (=> b!273852 (= res!137838 (not (= startIndex!26 i!1267)))))

(assert (=> b!273852 (= lt!136612 (array!13500 (store (arr!6399 a!3325) i!1267 k0!2581) (size!6751 a!3325)))))

(declare-fun b!273853 () Bool)

(declare-fun res!137843 () Bool)

(assert (=> b!273853 (=> (not res!137843) (not e!175439))))

(assert (=> b!273853 (= res!137843 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4204))))

(declare-fun b!273854 () Bool)

(declare-fun res!137837 () Bool)

(assert (=> b!273854 (=> (not res!137837) (not e!175439))))

(assert (=> b!273854 (= res!137837 (and (= (size!6751 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6751 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6751 a!3325))))))

(declare-fun res!137844 () Bool)

(assert (=> start!26402 (=> (not res!137844) (not e!175439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26402 (= res!137844 (validMask!0 mask!3868))))

(assert (=> start!26402 e!175439))

(declare-fun array_inv!4362 (array!13499) Bool)

(assert (=> start!26402 (array_inv!4362 a!3325)))

(assert (=> start!26402 true))

(assert (= (and start!26402 res!137844) b!273854))

(assert (= (and b!273854 res!137837) b!273850))

(assert (= (and b!273850 res!137836) b!273853))

(assert (= (and b!273853 res!137843) b!273846))

(assert (= (and b!273846 res!137840) b!273849))

(assert (= (and b!273849 res!137841) b!273848))

(assert (= (and b!273848 res!137842) b!273852))

(assert (= (and b!273852 res!137838) b!273847))

(assert (= (and b!273847 res!137839) b!273851))

(declare-fun m!289173 () Bool)

(assert (=> b!273853 m!289173))

(declare-fun m!289175 () Bool)

(assert (=> b!273851 m!289175))

(declare-fun m!289177 () Bool)

(assert (=> b!273851 m!289177))

(declare-fun m!289179 () Bool)

(assert (=> b!273851 m!289179))

(declare-fun m!289181 () Bool)

(assert (=> b!273851 m!289181))

(assert (=> b!273851 m!289177))

(declare-fun m!289183 () Bool)

(assert (=> b!273851 m!289183))

(declare-fun m!289185 () Bool)

(assert (=> b!273851 m!289185))

(declare-fun m!289187 () Bool)

(assert (=> b!273851 m!289187))

(declare-fun m!289189 () Bool)

(assert (=> b!273851 m!289189))

(declare-fun m!289191 () Bool)

(assert (=> b!273851 m!289191))

(assert (=> b!273851 m!289187))

(declare-fun m!289193 () Bool)

(assert (=> b!273851 m!289193))

(declare-fun m!289195 () Bool)

(assert (=> b!273849 m!289195))

(assert (=> b!273852 m!289183))

(declare-fun m!289197 () Bool)

(assert (=> b!273846 m!289197))

(declare-fun m!289199 () Bool)

(assert (=> b!273850 m!289199))

(declare-fun m!289201 () Bool)

(assert (=> b!273848 m!289201))

(declare-fun m!289203 () Bool)

(assert (=> start!26402 m!289203))

(declare-fun m!289205 () Bool)

(assert (=> start!26402 m!289205))

(assert (=> b!273847 m!289187))

(assert (=> b!273847 m!289187))

(declare-fun m!289207 () Bool)

(assert (=> b!273847 m!289207))

(check-sat (not b!273846) (not start!26402) (not b!273848) (not b!273847) (not b!273850) (not b!273851) (not b!273853) (not b!273849))
(check-sat)
