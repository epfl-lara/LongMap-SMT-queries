; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26476 () Bool)

(assert start!26476)

(declare-fun b!274707 () Bool)

(declare-fun e!175804 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13562 0))(
  ( (array!13563 (arr!6430 (Array (_ BitVec 32) (_ BitVec 64))) (size!6783 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13562)

(assert (=> b!274707 (= e!175804 (not (or (bvslt startIndex!26 (bvsub (size!6783 a!3325) #b00000000000000000000000000000001)) (bvsle startIndex!26 (size!6783 a!3325)))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13562 (_ BitVec 32)) Bool)

(assert (=> b!274707 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8627 0))(
  ( (Unit!8628) )
))
(declare-fun lt!137005 () Unit!8627)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8627)

(assert (=> b!274707 (= lt!137005 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lt!137003 () array!13562)

(declare-datatypes ((SeekEntryResult!1587 0))(
  ( (MissingZero!1587 (index!8518 (_ BitVec 32))) (Found!1587 (index!8519 (_ BitVec 32))) (Intermediate!1587 (undefined!2399 Bool) (index!8520 (_ BitVec 32)) (x!26823 (_ BitVec 32))) (Undefined!1587) (MissingVacant!1587 (index!8521 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13562 (_ BitVec 32)) SeekEntryResult!1587)

(assert (=> b!274707 (= (seekEntryOrOpen!0 (select (arr!6430 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6430 a!3325) i!1267 k!2581) startIndex!26) lt!137003 mask!3868))))

(declare-fun lt!137004 () Unit!8627)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13562 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8627)

(assert (=> b!274707 (= lt!137004 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4211 0))(
  ( (Nil!4208) (Cons!4207 (h!4874 (_ BitVec 64)) (t!9284 List!4211)) )
))
(declare-fun arrayNoDuplicates!0 (array!13562 (_ BitVec 32) List!4211) Bool)

(assert (=> b!274707 (arrayNoDuplicates!0 lt!137003 #b00000000000000000000000000000000 Nil!4208)))

(declare-fun lt!137007 () Unit!8627)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13562 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4211) Unit!8627)

(assert (=> b!274707 (= lt!137007 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4208))))

(declare-fun b!274708 () Bool)

(declare-fun res!138753 () Bool)

(declare-fun e!175805 () Bool)

(assert (=> b!274708 (=> (not res!138753) (not e!175805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274708 (= res!138753 (validKeyInArray!0 k!2581))))

(declare-fun b!274709 () Bool)

(declare-fun res!138752 () Bool)

(assert (=> b!274709 (=> (not res!138752) (not e!175804))))

(assert (=> b!274709 (= res!138752 (validKeyInArray!0 (select (arr!6430 a!3325) startIndex!26)))))

(declare-fun b!274710 () Bool)

(declare-fun res!138754 () Bool)

(assert (=> b!274710 (=> (not res!138754) (not e!175805))))

(declare-fun arrayContainsKey!0 (array!13562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274710 (= res!138754 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!138756 () Bool)

(assert (=> start!26476 (=> (not res!138756) (not e!175805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26476 (= res!138756 (validMask!0 mask!3868))))

(assert (=> start!26476 e!175805))

(declare-fun array_inv!4402 (array!13562) Bool)

(assert (=> start!26476 (array_inv!4402 a!3325)))

(assert (=> start!26476 true))

(declare-fun b!274711 () Bool)

(declare-fun e!175803 () Bool)

(assert (=> b!274711 (= e!175805 e!175803)))

(declare-fun res!138757 () Bool)

(assert (=> b!274711 (=> (not res!138757) (not e!175803))))

(declare-fun lt!137006 () SeekEntryResult!1587)

(assert (=> b!274711 (= res!138757 (or (= lt!137006 (MissingZero!1587 i!1267)) (= lt!137006 (MissingVacant!1587 i!1267))))))

(assert (=> b!274711 (= lt!137006 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274712 () Bool)

(declare-fun res!138751 () Bool)

(assert (=> b!274712 (=> (not res!138751) (not e!175805))))

(assert (=> b!274712 (= res!138751 (and (= (size!6783 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6783 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6783 a!3325))))))

(declare-fun b!274713 () Bool)

(declare-fun res!138749 () Bool)

(assert (=> b!274713 (=> (not res!138749) (not e!175803))))

(assert (=> b!274713 (= res!138749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274714 () Bool)

(declare-fun res!138750 () Bool)

(assert (=> b!274714 (=> (not res!138750) (not e!175805))))

(assert (=> b!274714 (= res!138750 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4208))))

(declare-fun b!274715 () Bool)

(assert (=> b!274715 (= e!175803 e!175804)))

(declare-fun res!138755 () Bool)

(assert (=> b!274715 (=> (not res!138755) (not e!175804))))

(assert (=> b!274715 (= res!138755 (not (= startIndex!26 i!1267)))))

(assert (=> b!274715 (= lt!137003 (array!13563 (store (arr!6430 a!3325) i!1267 k!2581) (size!6783 a!3325)))))

(assert (= (and start!26476 res!138756) b!274712))

(assert (= (and b!274712 res!138751) b!274708))

(assert (= (and b!274708 res!138753) b!274714))

(assert (= (and b!274714 res!138750) b!274710))

(assert (= (and b!274710 res!138754) b!274711))

(assert (= (and b!274711 res!138757) b!274713))

(assert (= (and b!274713 res!138749) b!274715))

(assert (= (and b!274715 res!138755) b!274709))

(assert (= (and b!274709 res!138752) b!274707))

(declare-fun m!289925 () Bool)

(assert (=> b!274708 m!289925))

(declare-fun m!289927 () Bool)

(assert (=> b!274709 m!289927))

(assert (=> b!274709 m!289927))

(declare-fun m!289929 () Bool)

(assert (=> b!274709 m!289929))

(declare-fun m!289931 () Bool)

(assert (=> b!274713 m!289931))

(declare-fun m!289933 () Bool)

(assert (=> b!274710 m!289933))

(declare-fun m!289935 () Bool)

(assert (=> b!274715 m!289935))

(declare-fun m!289937 () Bool)

(assert (=> b!274707 m!289937))

(declare-fun m!289939 () Bool)

(assert (=> b!274707 m!289939))

(declare-fun m!289941 () Bool)

(assert (=> b!274707 m!289941))

(declare-fun m!289943 () Bool)

(assert (=> b!274707 m!289943))

(assert (=> b!274707 m!289927))

(declare-fun m!289945 () Bool)

(assert (=> b!274707 m!289945))

(declare-fun m!289947 () Bool)

(assert (=> b!274707 m!289947))

(assert (=> b!274707 m!289927))

(declare-fun m!289949 () Bool)

(assert (=> b!274707 m!289949))

(assert (=> b!274707 m!289935))

(assert (=> b!274707 m!289941))

(declare-fun m!289951 () Bool)

(assert (=> b!274707 m!289951))

(declare-fun m!289953 () Bool)

(assert (=> b!274714 m!289953))

(declare-fun m!289955 () Bool)

(assert (=> start!26476 m!289955))

(declare-fun m!289957 () Bool)

(assert (=> start!26476 m!289957))

(declare-fun m!289959 () Bool)

(assert (=> b!274711 m!289959))

(push 1)

(assert (not b!274708))

(assert (not b!274707))

(assert (not b!274709))

(assert (not start!26476))

(assert (not b!274711))

(assert (not b!274710))

(assert (not b!274714))

(assert (not b!274713))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

