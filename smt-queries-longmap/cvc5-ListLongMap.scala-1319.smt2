; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26472 () Bool)

(assert start!26472)

(declare-fun b!274827 () Bool)

(declare-fun res!138819 () Bool)

(declare-fun e!175893 () Bool)

(assert (=> b!274827 (=> (not res!138819) (not e!175893))))

(declare-datatypes ((array!13569 0))(
  ( (array!13570 (arr!6434 (Array (_ BitVec 32) (_ BitVec 64))) (size!6786 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13569)

(declare-datatypes ((List!4242 0))(
  ( (Nil!4239) (Cons!4238 (h!4905 (_ BitVec 64)) (t!9324 List!4242)) )
))
(declare-fun arrayNoDuplicates!0 (array!13569 (_ BitVec 32) List!4242) Bool)

(assert (=> b!274827 (= res!138819 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4239))))

(declare-fun b!274828 () Bool)

(declare-fun res!138817 () Bool)

(assert (=> b!274828 (=> (not res!138817) (not e!175893))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274828 (= res!138817 (validKeyInArray!0 k!2581))))

(declare-fun b!274829 () Bool)

(declare-fun res!138825 () Bool)

(assert (=> b!274829 (=> (not res!138825) (not e!175893))))

(declare-fun arrayContainsKey!0 (array!13569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274829 (= res!138825 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274831 () Bool)

(declare-fun e!175894 () Bool)

(declare-fun e!175892 () Bool)

(assert (=> b!274831 (= e!175894 e!175892)))

(declare-fun res!138822 () Bool)

(assert (=> b!274831 (=> (not res!138822) (not e!175892))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274831 (= res!138822 (not (= startIndex!26 i!1267)))))

(declare-fun lt!137170 () array!13569)

(assert (=> b!274831 (= lt!137170 (array!13570 (store (arr!6434 a!3325) i!1267 k!2581) (size!6786 a!3325)))))

(declare-fun b!274832 () Bool)

(declare-fun res!138821 () Bool)

(assert (=> b!274832 (=> (not res!138821) (not e!175894))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13569 (_ BitVec 32)) Bool)

(assert (=> b!274832 (= res!138821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274833 () Bool)

(assert (=> b!274833 (= e!175893 e!175894)))

(declare-fun res!138823 () Bool)

(assert (=> b!274833 (=> (not res!138823) (not e!175894))))

(declare-datatypes ((SeekEntryResult!1592 0))(
  ( (MissingZero!1592 (index!8538 (_ BitVec 32))) (Found!1592 (index!8539 (_ BitVec 32))) (Intermediate!1592 (undefined!2404 Bool) (index!8540 (_ BitVec 32)) (x!26829 (_ BitVec 32))) (Undefined!1592) (MissingVacant!1592 (index!8541 (_ BitVec 32))) )
))
(declare-fun lt!137169 () SeekEntryResult!1592)

(assert (=> b!274833 (= res!138823 (or (= lt!137169 (MissingZero!1592 i!1267)) (= lt!137169 (MissingVacant!1592 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13569 (_ BitVec 32)) SeekEntryResult!1592)

(assert (=> b!274833 (= lt!137169 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!138820 () Bool)

(assert (=> start!26472 (=> (not res!138820) (not e!175893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26472 (= res!138820 (validMask!0 mask!3868))))

(assert (=> start!26472 e!175893))

(declare-fun array_inv!4397 (array!13569) Bool)

(assert (=> start!26472 (array_inv!4397 a!3325)))

(assert (=> start!26472 true))

(declare-fun b!274830 () Bool)

(assert (=> b!274830 (= e!175892 (not (or (bvslt startIndex!26 (bvsub (size!6786 a!3325) #b00000000000000000000000000000001)) (bvsle startIndex!26 (size!6786 a!3325)))))))

(assert (=> b!274830 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8671 0))(
  ( (Unit!8672) )
))
(declare-fun lt!137173 () Unit!8671)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13569 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8671)

(assert (=> b!274830 (= lt!137173 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!274830 (= (seekEntryOrOpen!0 (select (arr!6434 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6434 a!3325) i!1267 k!2581) startIndex!26) lt!137170 mask!3868))))

(declare-fun lt!137172 () Unit!8671)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13569 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8671)

(assert (=> b!274830 (= lt!137172 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!274830 (arrayNoDuplicates!0 lt!137170 #b00000000000000000000000000000000 Nil!4239)))

(declare-fun lt!137171 () Unit!8671)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13569 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4242) Unit!8671)

(assert (=> b!274830 (= lt!137171 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4239))))

(declare-fun b!274834 () Bool)

(declare-fun res!138824 () Bool)

(assert (=> b!274834 (=> (not res!138824) (not e!175893))))

(assert (=> b!274834 (= res!138824 (and (= (size!6786 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6786 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6786 a!3325))))))

(declare-fun b!274835 () Bool)

(declare-fun res!138818 () Bool)

(assert (=> b!274835 (=> (not res!138818) (not e!175892))))

(assert (=> b!274835 (= res!138818 (validKeyInArray!0 (select (arr!6434 a!3325) startIndex!26)))))

(assert (= (and start!26472 res!138820) b!274834))

(assert (= (and b!274834 res!138824) b!274828))

(assert (= (and b!274828 res!138817) b!274827))

(assert (= (and b!274827 res!138819) b!274829))

(assert (= (and b!274829 res!138825) b!274833))

(assert (= (and b!274833 res!138823) b!274832))

(assert (= (and b!274832 res!138821) b!274831))

(assert (= (and b!274831 res!138822) b!274835))

(assert (= (and b!274835 res!138818) b!274830))

(declare-fun m!290481 () Bool)

(assert (=> b!274827 m!290481))

(declare-fun m!290483 () Bool)

(assert (=> b!274829 m!290483))

(declare-fun m!290485 () Bool)

(assert (=> b!274830 m!290485))

(declare-fun m!290487 () Bool)

(assert (=> b!274830 m!290487))

(declare-fun m!290489 () Bool)

(assert (=> b!274830 m!290489))

(declare-fun m!290491 () Bool)

(assert (=> b!274830 m!290491))

(declare-fun m!290493 () Bool)

(assert (=> b!274830 m!290493))

(assert (=> b!274830 m!290487))

(declare-fun m!290495 () Bool)

(assert (=> b!274830 m!290495))

(declare-fun m!290497 () Bool)

(assert (=> b!274830 m!290497))

(declare-fun m!290499 () Bool)

(assert (=> b!274830 m!290499))

(declare-fun m!290501 () Bool)

(assert (=> b!274830 m!290501))

(assert (=> b!274830 m!290497))

(declare-fun m!290503 () Bool)

(assert (=> b!274830 m!290503))

(assert (=> b!274831 m!290491))

(declare-fun m!290505 () Bool)

(assert (=> b!274832 m!290505))

(declare-fun m!290507 () Bool)

(assert (=> start!26472 m!290507))

(declare-fun m!290509 () Bool)

(assert (=> start!26472 m!290509))

(declare-fun m!290511 () Bool)

(assert (=> b!274828 m!290511))

(declare-fun m!290513 () Bool)

(assert (=> b!274833 m!290513))

(assert (=> b!274835 m!290497))

(assert (=> b!274835 m!290497))

(declare-fun m!290515 () Bool)

(assert (=> b!274835 m!290515))

(push 1)

(assert (not b!274832))

(assert (not b!274829))

(assert (not start!26472))

(assert (not b!274828))

(assert (not b!274833))

(assert (not b!274830))

(assert (not b!274827))

(assert (not b!274835))

(check-sat)

(pop 1)

(push 1)

(check-sat)

