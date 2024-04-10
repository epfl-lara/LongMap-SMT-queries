; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26462 () Bool)

(assert start!26462)

(declare-fun b!274692 () Bool)

(declare-fun res!138685 () Bool)

(declare-fun e!175833 () Bool)

(assert (=> b!274692 (=> (not res!138685) (not e!175833))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274692 (= res!138685 (validKeyInArray!0 k0!2581))))

(declare-fun b!274693 () Bool)

(declare-fun res!138689 () Bool)

(assert (=> b!274693 (=> (not res!138689) (not e!175833))))

(declare-datatypes ((array!13559 0))(
  ( (array!13560 (arr!6429 (Array (_ BitVec 32) (_ BitVec 64))) (size!6781 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13559)

(declare-datatypes ((List!4237 0))(
  ( (Nil!4234) (Cons!4233 (h!4900 (_ BitVec 64)) (t!9319 List!4237)) )
))
(declare-fun arrayNoDuplicates!0 (array!13559 (_ BitVec 32) List!4237) Bool)

(assert (=> b!274693 (= res!138689 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4234))))

(declare-fun b!274694 () Bool)

(declare-fun res!138688 () Bool)

(assert (=> b!274694 (=> (not res!138688) (not e!175833))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!274694 (= res!138688 (and (= (size!6781 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6781 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6781 a!3325))))))

(declare-fun b!274695 () Bool)

(declare-fun res!138684 () Bool)

(declare-fun e!175835 () Bool)

(assert (=> b!274695 (=> (not res!138684) (not e!175835))))

(assert (=> b!274695 (= res!138684 (validKeyInArray!0 (select (arr!6429 a!3325) startIndex!26)))))

(declare-fun res!138687 () Bool)

(assert (=> start!26462 (=> (not res!138687) (not e!175833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26462 (= res!138687 (validMask!0 mask!3868))))

(assert (=> start!26462 e!175833))

(declare-fun array_inv!4392 (array!13559) Bool)

(assert (=> start!26462 (array_inv!4392 a!3325)))

(assert (=> start!26462 true))

(declare-fun b!274696 () Bool)

(assert (=> b!274696 (= e!175835 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13559 (_ BitVec 32)) Bool)

(assert (=> b!274696 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8661 0))(
  ( (Unit!8662) )
))
(declare-fun lt!137098 () Unit!8661)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8661)

(assert (=> b!274696 (= lt!137098 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!137096 () array!13559)

(declare-datatypes ((SeekEntryResult!1587 0))(
  ( (MissingZero!1587 (index!8518 (_ BitVec 32))) (Found!1587 (index!8519 (_ BitVec 32))) (Intermediate!1587 (undefined!2399 Bool) (index!8520 (_ BitVec 32)) (x!26808 (_ BitVec 32))) (Undefined!1587) (MissingVacant!1587 (index!8521 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13559 (_ BitVec 32)) SeekEntryResult!1587)

(assert (=> b!274696 (= (seekEntryOrOpen!0 (select (arr!6429 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6429 a!3325) i!1267 k0!2581) startIndex!26) lt!137096 mask!3868))))

(declare-fun lt!137094 () Unit!8661)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13559 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8661)

(assert (=> b!274696 (= lt!137094 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!274696 (arrayNoDuplicates!0 lt!137096 #b00000000000000000000000000000000 Nil!4234)))

(declare-fun lt!137095 () Unit!8661)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13559 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4237) Unit!8661)

(assert (=> b!274696 (= lt!137095 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4234))))

(declare-fun b!274697 () Bool)

(declare-fun res!138682 () Bool)

(assert (=> b!274697 (=> (not res!138682) (not e!175833))))

(declare-fun arrayContainsKey!0 (array!13559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274697 (= res!138682 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274698 () Bool)

(declare-fun res!138690 () Bool)

(declare-fun e!175834 () Bool)

(assert (=> b!274698 (=> (not res!138690) (not e!175834))))

(assert (=> b!274698 (= res!138690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274699 () Bool)

(assert (=> b!274699 (= e!175833 e!175834)))

(declare-fun res!138686 () Bool)

(assert (=> b!274699 (=> (not res!138686) (not e!175834))))

(declare-fun lt!137097 () SeekEntryResult!1587)

(assert (=> b!274699 (= res!138686 (or (= lt!137097 (MissingZero!1587 i!1267)) (= lt!137097 (MissingVacant!1587 i!1267))))))

(assert (=> b!274699 (= lt!137097 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274700 () Bool)

(assert (=> b!274700 (= e!175834 e!175835)))

(declare-fun res!138683 () Bool)

(assert (=> b!274700 (=> (not res!138683) (not e!175835))))

(assert (=> b!274700 (= res!138683 (not (= startIndex!26 i!1267)))))

(assert (=> b!274700 (= lt!137096 (array!13560 (store (arr!6429 a!3325) i!1267 k0!2581) (size!6781 a!3325)))))

(assert (= (and start!26462 res!138687) b!274694))

(assert (= (and b!274694 res!138688) b!274692))

(assert (= (and b!274692 res!138685) b!274693))

(assert (= (and b!274693 res!138689) b!274697))

(assert (= (and b!274697 res!138682) b!274699))

(assert (= (and b!274699 res!138686) b!274698))

(assert (= (and b!274698 res!138690) b!274700))

(assert (= (and b!274700 res!138683) b!274695))

(assert (= (and b!274695 res!138684) b!274696))

(declare-fun m!290301 () Bool)

(assert (=> start!26462 m!290301))

(declare-fun m!290303 () Bool)

(assert (=> start!26462 m!290303))

(declare-fun m!290305 () Bool)

(assert (=> b!274692 m!290305))

(declare-fun m!290307 () Bool)

(assert (=> b!274695 m!290307))

(assert (=> b!274695 m!290307))

(declare-fun m!290309 () Bool)

(assert (=> b!274695 m!290309))

(declare-fun m!290311 () Bool)

(assert (=> b!274699 m!290311))

(declare-fun m!290313 () Bool)

(assert (=> b!274700 m!290313))

(declare-fun m!290315 () Bool)

(assert (=> b!274698 m!290315))

(declare-fun m!290317 () Bool)

(assert (=> b!274696 m!290317))

(declare-fun m!290319 () Bool)

(assert (=> b!274696 m!290319))

(declare-fun m!290321 () Bool)

(assert (=> b!274696 m!290321))

(assert (=> b!274696 m!290313))

(declare-fun m!290323 () Bool)

(assert (=> b!274696 m!290323))

(declare-fun m!290325 () Bool)

(assert (=> b!274696 m!290325))

(declare-fun m!290327 () Bool)

(assert (=> b!274696 m!290327))

(assert (=> b!274696 m!290307))

(declare-fun m!290329 () Bool)

(assert (=> b!274696 m!290329))

(assert (=> b!274696 m!290307))

(assert (=> b!274696 m!290321))

(declare-fun m!290331 () Bool)

(assert (=> b!274696 m!290331))

(declare-fun m!290333 () Bool)

(assert (=> b!274697 m!290333))

(declare-fun m!290335 () Bool)

(assert (=> b!274693 m!290335))

(check-sat (not b!274698) (not b!274693) (not b!274692) (not b!274699) (not b!274696) (not start!26462) (not b!274697) (not b!274695))
(check-sat)
