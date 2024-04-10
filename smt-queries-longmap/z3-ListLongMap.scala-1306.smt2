; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26396 () Bool)

(assert start!26396)

(declare-fun b!273765 () Bool)

(declare-fun res!137759 () Bool)

(declare-fun e!175401 () Bool)

(assert (=> b!273765 (=> (not res!137759) (not e!175401))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((array!13493 0))(
  ( (array!13494 (arr!6396 (Array (_ BitVec 32) (_ BitVec 64))) (size!6748 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13493)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!273765 (= res!137759 (and (= (size!6748 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6748 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6748 a!3325))))))

(declare-fun b!273766 () Bool)

(declare-fun res!137757 () Bool)

(assert (=> b!273766 (=> (not res!137757) (not e!175401))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273766 (= res!137757 (validKeyInArray!0 k0!2581))))

(declare-fun b!273767 () Bool)

(declare-fun res!137763 () Bool)

(assert (=> b!273767 (=> (not res!137763) (not e!175401))))

(declare-datatypes ((List!4204 0))(
  ( (Nil!4201) (Cons!4200 (h!4867 (_ BitVec 64)) (t!9286 List!4204)) )
))
(declare-fun arrayNoDuplicates!0 (array!13493 (_ BitVec 32) List!4204) Bool)

(assert (=> b!273767 (= res!137763 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4201))))

(declare-fun b!273768 () Bool)

(declare-fun res!137762 () Bool)

(declare-fun e!175403 () Bool)

(assert (=> b!273768 (=> (not res!137762) (not e!175403))))

(assert (=> b!273768 (= res!137762 (validKeyInArray!0 (select (arr!6396 a!3325) startIndex!26)))))

(declare-fun b!273769 () Bool)

(declare-fun res!137761 () Bool)

(assert (=> b!273769 (=> (not res!137761) (not e!175401))))

(declare-fun arrayContainsKey!0 (array!13493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273769 (= res!137761 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273770 () Bool)

(declare-fun res!137755 () Bool)

(declare-fun e!175400 () Bool)

(assert (=> b!273770 (=> (not res!137755) (not e!175400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13493 (_ BitVec 32)) Bool)

(assert (=> b!273770 (= res!137755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273771 () Bool)

(assert (=> b!273771 (= e!175401 e!175400)))

(declare-fun res!137756 () Bool)

(assert (=> b!273771 (=> (not res!137756) (not e!175400))))

(declare-datatypes ((SeekEntryResult!1554 0))(
  ( (MissingZero!1554 (index!8386 (_ BitVec 32))) (Found!1554 (index!8387 (_ BitVec 32))) (Intermediate!1554 (undefined!2366 Bool) (index!8388 (_ BitVec 32)) (x!26687 (_ BitVec 32))) (Undefined!1554) (MissingVacant!1554 (index!8389 (_ BitVec 32))) )
))
(declare-fun lt!136566 () SeekEntryResult!1554)

(assert (=> b!273771 (= res!137756 (or (= lt!136566 (MissingZero!1554 i!1267)) (= lt!136566 (MissingVacant!1554 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13493 (_ BitVec 32)) SeekEntryResult!1554)

(assert (=> b!273771 (= lt!136566 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273772 () Bool)

(assert (=> b!273772 (= e!175403 (not true))))

(assert (=> b!273772 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8595 0))(
  ( (Unit!8596) )
))
(declare-fun lt!136565 () Unit!8595)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8595)

(assert (=> b!273772 (= lt!136565 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136567 () array!13493)

(assert (=> b!273772 (= (seekEntryOrOpen!0 (select (arr!6396 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6396 a!3325) i!1267 k0!2581) startIndex!26) lt!136567 mask!3868))))

(declare-fun lt!136564 () Unit!8595)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13493 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8595)

(assert (=> b!273772 (= lt!136564 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!273772 (arrayNoDuplicates!0 lt!136567 #b00000000000000000000000000000000 Nil!4201)))

(declare-fun lt!136563 () Unit!8595)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13493 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4204) Unit!8595)

(assert (=> b!273772 (= lt!136563 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4201))))

(declare-fun res!137760 () Bool)

(assert (=> start!26396 (=> (not res!137760) (not e!175401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26396 (= res!137760 (validMask!0 mask!3868))))

(assert (=> start!26396 e!175401))

(declare-fun array_inv!4359 (array!13493) Bool)

(assert (=> start!26396 (array_inv!4359 a!3325)))

(assert (=> start!26396 true))

(declare-fun b!273773 () Bool)

(assert (=> b!273773 (= e!175400 e!175403)))

(declare-fun res!137758 () Bool)

(assert (=> b!273773 (=> (not res!137758) (not e!175403))))

(assert (=> b!273773 (= res!137758 (not (= startIndex!26 i!1267)))))

(assert (=> b!273773 (= lt!136567 (array!13494 (store (arr!6396 a!3325) i!1267 k0!2581) (size!6748 a!3325)))))

(assert (= (and start!26396 res!137760) b!273765))

(assert (= (and b!273765 res!137759) b!273766))

(assert (= (and b!273766 res!137757) b!273767))

(assert (= (and b!273767 res!137763) b!273769))

(assert (= (and b!273769 res!137761) b!273771))

(assert (= (and b!273771 res!137756) b!273770))

(assert (= (and b!273770 res!137755) b!273773))

(assert (= (and b!273773 res!137758) b!273768))

(assert (= (and b!273768 res!137762) b!273772))

(declare-fun m!289065 () Bool)

(assert (=> b!273767 m!289065))

(declare-fun m!289067 () Bool)

(assert (=> b!273773 m!289067))

(declare-fun m!289069 () Bool)

(assert (=> b!273768 m!289069))

(assert (=> b!273768 m!289069))

(declare-fun m!289071 () Bool)

(assert (=> b!273768 m!289071))

(declare-fun m!289073 () Bool)

(assert (=> b!273772 m!289073))

(assert (=> b!273772 m!289067))

(declare-fun m!289075 () Bool)

(assert (=> b!273772 m!289075))

(assert (=> b!273772 m!289069))

(declare-fun m!289077 () Bool)

(assert (=> b!273772 m!289077))

(declare-fun m!289079 () Bool)

(assert (=> b!273772 m!289079))

(declare-fun m!289081 () Bool)

(assert (=> b!273772 m!289081))

(assert (=> b!273772 m!289069))

(declare-fun m!289083 () Bool)

(assert (=> b!273772 m!289083))

(declare-fun m!289085 () Bool)

(assert (=> b!273772 m!289085))

(declare-fun m!289087 () Bool)

(assert (=> b!273772 m!289087))

(assert (=> b!273772 m!289085))

(declare-fun m!289089 () Bool)

(assert (=> b!273766 m!289089))

(declare-fun m!289091 () Bool)

(assert (=> b!273771 m!289091))

(declare-fun m!289093 () Bool)

(assert (=> start!26396 m!289093))

(declare-fun m!289095 () Bool)

(assert (=> start!26396 m!289095))

(declare-fun m!289097 () Bool)

(assert (=> b!273769 m!289097))

(declare-fun m!289099 () Bool)

(assert (=> b!273770 m!289099))

(check-sat (not b!273768) (not start!26396) (not b!273770) (not b!273766) (not b!273769) (not b!273772) (not b!273771) (not b!273767))
(check-sat)
