; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26388 () Bool)

(assert start!26388)

(declare-fun b!273704 () Bool)

(declare-fun e!175376 () Bool)

(assert (=> b!273704 (= e!175376 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13484 0))(
  ( (array!13485 (arr!6391 (Array (_ BitVec 32) (_ BitVec 64))) (size!6743 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13484)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13484 (_ BitVec 32)) Bool)

(assert (=> b!273704 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8567 0))(
  ( (Unit!8568) )
))
(declare-fun lt!136562 () Unit!8567)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13484 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8567)

(assert (=> b!273704 (= lt!136562 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136565 () array!13484)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1514 0))(
  ( (MissingZero!1514 (index!8226 (_ BitVec 32))) (Found!1514 (index!8227 (_ BitVec 32))) (Intermediate!1514 (undefined!2326 Bool) (index!8228 (_ BitVec 32)) (x!26639 (_ BitVec 32))) (Undefined!1514) (MissingVacant!1514 (index!8229 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13484 (_ BitVec 32)) SeekEntryResult!1514)

(assert (=> b!273704 (= (seekEntryOrOpen!0 (select (arr!6391 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6391 a!3325) i!1267 k0!2581) startIndex!26) lt!136565 mask!3868))))

(declare-fun lt!136564 () Unit!8567)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13484 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8567)

(assert (=> b!273704 (= lt!136564 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4112 0))(
  ( (Nil!4109) (Cons!4108 (h!4775 (_ BitVec 64)) (t!9186 List!4112)) )
))
(declare-fun arrayNoDuplicates!0 (array!13484 (_ BitVec 32) List!4112) Bool)

(assert (=> b!273704 (arrayNoDuplicates!0 lt!136565 #b00000000000000000000000000000000 Nil!4109)))

(declare-fun lt!136566 () Unit!8567)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13484 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4112) Unit!8567)

(assert (=> b!273704 (= lt!136566 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4109))))

(declare-fun b!273705 () Bool)

(declare-fun e!175378 () Bool)

(assert (=> b!273705 (= e!175378 e!175376)))

(declare-fun res!137670 () Bool)

(assert (=> b!273705 (=> (not res!137670) (not e!175376))))

(assert (=> b!273705 (= res!137670 (not (= startIndex!26 i!1267)))))

(assert (=> b!273705 (= lt!136565 (array!13485 (store (arr!6391 a!3325) i!1267 k0!2581) (size!6743 a!3325)))))

(declare-fun res!137673 () Bool)

(declare-fun e!175377 () Bool)

(assert (=> start!26388 (=> (not res!137673) (not e!175377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26388 (= res!137673 (validMask!0 mask!3868))))

(assert (=> start!26388 e!175377))

(declare-fun array_inv!4341 (array!13484) Bool)

(assert (=> start!26388 (array_inv!4341 a!3325)))

(assert (=> start!26388 true))

(declare-fun b!273706 () Bool)

(declare-fun res!137671 () Bool)

(assert (=> b!273706 (=> (not res!137671) (not e!175377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273706 (= res!137671 (validKeyInArray!0 k0!2581))))

(declare-fun b!273707 () Bool)

(declare-fun res!137669 () Bool)

(assert (=> b!273707 (=> (not res!137669) (not e!175377))))

(assert (=> b!273707 (= res!137669 (and (= (size!6743 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6743 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6743 a!3325))))))

(declare-fun b!273708 () Bool)

(declare-fun res!137672 () Bool)

(assert (=> b!273708 (=> (not res!137672) (not e!175376))))

(assert (=> b!273708 (= res!137672 (validKeyInArray!0 (select (arr!6391 a!3325) startIndex!26)))))

(declare-fun b!273709 () Bool)

(declare-fun res!137674 () Bool)

(assert (=> b!273709 (=> (not res!137674) (not e!175377))))

(assert (=> b!273709 (= res!137674 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4109))))

(declare-fun b!273710 () Bool)

(declare-fun res!137675 () Bool)

(assert (=> b!273710 (=> (not res!137675) (not e!175378))))

(assert (=> b!273710 (= res!137675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273711 () Bool)

(assert (=> b!273711 (= e!175377 e!175378)))

(declare-fun res!137676 () Bool)

(assert (=> b!273711 (=> (not res!137676) (not e!175378))))

(declare-fun lt!136563 () SeekEntryResult!1514)

(assert (=> b!273711 (= res!137676 (or (= lt!136563 (MissingZero!1514 i!1267)) (= lt!136563 (MissingVacant!1514 i!1267))))))

(assert (=> b!273711 (= lt!136563 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273712 () Bool)

(declare-fun res!137668 () Bool)

(assert (=> b!273712 (=> (not res!137668) (not e!175377))))

(declare-fun arrayContainsKey!0 (array!13484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273712 (= res!137668 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26388 res!137673) b!273707))

(assert (= (and b!273707 res!137669) b!273706))

(assert (= (and b!273706 res!137671) b!273709))

(assert (= (and b!273709 res!137674) b!273712))

(assert (= (and b!273712 res!137668) b!273711))

(assert (= (and b!273711 res!137676) b!273710))

(assert (= (and b!273710 res!137675) b!273705))

(assert (= (and b!273705 res!137670) b!273708))

(assert (= (and b!273708 res!137672) b!273704))

(declare-fun m!289127 () Bool)

(assert (=> b!273710 m!289127))

(declare-fun m!289129 () Bool)

(assert (=> b!273704 m!289129))

(declare-fun m!289131 () Bool)

(assert (=> b!273704 m!289131))

(declare-fun m!289133 () Bool)

(assert (=> b!273704 m!289133))

(declare-fun m!289135 () Bool)

(assert (=> b!273704 m!289135))

(declare-fun m!289137 () Bool)

(assert (=> b!273704 m!289137))

(declare-fun m!289139 () Bool)

(assert (=> b!273704 m!289139))

(declare-fun m!289141 () Bool)

(assert (=> b!273704 m!289141))

(assert (=> b!273704 m!289131))

(declare-fun m!289143 () Bool)

(assert (=> b!273704 m!289143))

(assert (=> b!273704 m!289135))

(declare-fun m!289145 () Bool)

(assert (=> b!273704 m!289145))

(declare-fun m!289147 () Bool)

(assert (=> b!273704 m!289147))

(assert (=> b!273705 m!289141))

(assert (=> b!273708 m!289135))

(assert (=> b!273708 m!289135))

(declare-fun m!289149 () Bool)

(assert (=> b!273708 m!289149))

(declare-fun m!289151 () Bool)

(assert (=> b!273711 m!289151))

(declare-fun m!289153 () Bool)

(assert (=> start!26388 m!289153))

(declare-fun m!289155 () Bool)

(assert (=> start!26388 m!289155))

(declare-fun m!289157 () Bool)

(assert (=> b!273709 m!289157))

(declare-fun m!289159 () Bool)

(assert (=> b!273706 m!289159))

(declare-fun m!289161 () Bool)

(assert (=> b!273712 m!289161))

(check-sat (not b!273708) (not b!273711) (not b!273709) (not b!273706) (not b!273712) (not start!26388) (not b!273704) (not b!273710))
(check-sat)
