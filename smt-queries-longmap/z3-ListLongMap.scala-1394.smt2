; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27218 () Bool)

(assert start!27218)

(declare-fun b!281595 () Bool)

(declare-fun res!144717 () Bool)

(declare-fun e!178904 () Bool)

(assert (=> b!281595 (=> (not res!144717) (not e!178904))))

(declare-datatypes ((array!14025 0))(
  ( (array!14026 (arr!6654 (Array (_ BitVec 32) (_ BitVec 64))) (size!7007 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14025)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!281595 (= res!144717 (and (= (size!7007 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7007 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7007 a!3325))))))

(declare-fun res!144723 () Bool)

(assert (=> start!27218 (=> (not res!144723) (not e!178904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27218 (= res!144723 (validMask!0 mask!3868))))

(assert (=> start!27218 e!178904))

(declare-fun array_inv!4626 (array!14025) Bool)

(assert (=> start!27218 (array_inv!4626 a!3325)))

(assert (=> start!27218 true))

(declare-fun b!281596 () Bool)

(declare-fun res!144716 () Bool)

(assert (=> b!281596 (=> (not res!144716) (not e!178904))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281596 (= res!144716 (validKeyInArray!0 k0!2581))))

(declare-fun b!281597 () Bool)

(declare-fun res!144718 () Bool)

(assert (=> b!281597 (=> (not res!144718) (not e!178904))))

(declare-fun arrayContainsKey!0 (array!14025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281597 (= res!144718 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281598 () Bool)

(declare-fun e!178903 () Bool)

(assert (=> b!281598 (= e!178903 (not (or (bvsgt #b00000000000000000000000000000000 (size!7007 a!3325)) (bvsle startIndex!26 (size!7007 a!3325)))))))

(declare-fun lt!138994 () array!14025)

(declare-datatypes ((SeekEntryResult!1811 0))(
  ( (MissingZero!1811 (index!9414 (_ BitVec 32))) (Found!1811 (index!9415 (_ BitVec 32))) (Intermediate!1811 (undefined!2623 Bool) (index!9416 (_ BitVec 32)) (x!27656 (_ BitVec 32))) (Undefined!1811) (MissingVacant!1811 (index!9417 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14025 (_ BitVec 32)) SeekEntryResult!1811)

(assert (=> b!281598 (= (seekEntryOrOpen!0 (select (arr!6654 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6654 a!3325) i!1267 k0!2581) startIndex!26) lt!138994 mask!3868))))

(declare-datatypes ((Unit!8868 0))(
  ( (Unit!8869) )
))
(declare-fun lt!138996 () Unit!8868)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14025 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8868)

(assert (=> b!281598 (= lt!138996 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4435 0))(
  ( (Nil!4432) (Cons!4431 (h!5101 (_ BitVec 64)) (t!9508 List!4435)) )
))
(declare-fun arrayNoDuplicates!0 (array!14025 (_ BitVec 32) List!4435) Bool)

(assert (=> b!281598 (arrayNoDuplicates!0 lt!138994 #b00000000000000000000000000000000 Nil!4432)))

(declare-fun lt!138995 () Unit!8868)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14025 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4435) Unit!8868)

(assert (=> b!281598 (= lt!138995 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4432))))

(declare-fun b!281599 () Bool)

(declare-fun res!144722 () Bool)

(declare-fun e!178905 () Bool)

(assert (=> b!281599 (=> (not res!144722) (not e!178905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14025 (_ BitVec 32)) Bool)

(assert (=> b!281599 (= res!144722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281600 () Bool)

(assert (=> b!281600 (= e!178905 e!178903)))

(declare-fun res!144724 () Bool)

(assert (=> b!281600 (=> (not res!144724) (not e!178903))))

(assert (=> b!281600 (= res!144724 (not (= startIndex!26 i!1267)))))

(assert (=> b!281600 (= lt!138994 (array!14026 (store (arr!6654 a!3325) i!1267 k0!2581) (size!7007 a!3325)))))

(declare-fun b!281601 () Bool)

(assert (=> b!281601 (= e!178904 e!178905)))

(declare-fun res!144721 () Bool)

(assert (=> b!281601 (=> (not res!144721) (not e!178905))))

(declare-fun lt!138993 () SeekEntryResult!1811)

(assert (=> b!281601 (= res!144721 (or (= lt!138993 (MissingZero!1811 i!1267)) (= lt!138993 (MissingVacant!1811 i!1267))))))

(assert (=> b!281601 (= lt!138993 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281602 () Bool)

(declare-fun res!144719 () Bool)

(assert (=> b!281602 (=> (not res!144719) (not e!178904))))

(assert (=> b!281602 (= res!144719 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4432))))

(declare-fun b!281603 () Bool)

(declare-fun res!144720 () Bool)

(assert (=> b!281603 (=> (not res!144720) (not e!178903))))

(assert (=> b!281603 (= res!144720 (validKeyInArray!0 (select (arr!6654 a!3325) startIndex!26)))))

(assert (= (and start!27218 res!144723) b!281595))

(assert (= (and b!281595 res!144717) b!281596))

(assert (= (and b!281596 res!144716) b!281602))

(assert (= (and b!281602 res!144719) b!281597))

(assert (= (and b!281597 res!144718) b!281601))

(assert (= (and b!281601 res!144721) b!281599))

(assert (= (and b!281599 res!144722) b!281600))

(assert (= (and b!281600 res!144724) b!281603))

(assert (= (and b!281603 res!144720) b!281598))

(declare-fun m!295511 () Bool)

(assert (=> b!281603 m!295511))

(assert (=> b!281603 m!295511))

(declare-fun m!295513 () Bool)

(assert (=> b!281603 m!295513))

(declare-fun m!295515 () Bool)

(assert (=> b!281602 m!295515))

(declare-fun m!295517 () Bool)

(assert (=> b!281597 m!295517))

(declare-fun m!295519 () Bool)

(assert (=> b!281601 m!295519))

(declare-fun m!295521 () Bool)

(assert (=> b!281598 m!295521))

(declare-fun m!295523 () Bool)

(assert (=> b!281598 m!295523))

(declare-fun m!295525 () Bool)

(assert (=> b!281598 m!295525))

(assert (=> b!281598 m!295511))

(declare-fun m!295527 () Bool)

(assert (=> b!281598 m!295527))

(declare-fun m!295529 () Bool)

(assert (=> b!281598 m!295529))

(assert (=> b!281598 m!295511))

(declare-fun m!295531 () Bool)

(assert (=> b!281598 m!295531))

(assert (=> b!281598 m!295521))

(declare-fun m!295533 () Bool)

(assert (=> b!281598 m!295533))

(declare-fun m!295535 () Bool)

(assert (=> b!281599 m!295535))

(assert (=> b!281600 m!295523))

(declare-fun m!295537 () Bool)

(assert (=> b!281596 m!295537))

(declare-fun m!295539 () Bool)

(assert (=> start!27218 m!295539))

(declare-fun m!295541 () Bool)

(assert (=> start!27218 m!295541))

(check-sat (not b!281601) (not b!281603) (not b!281602) (not start!27218) (not b!281596) (not b!281599) (not b!281597) (not b!281598))
(check-sat)
