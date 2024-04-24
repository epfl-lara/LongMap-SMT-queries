; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26472 () Bool)

(assert start!26472)

(declare-fun b!274874 () Bool)

(declare-fun res!138843 () Bool)

(declare-fun e!175918 () Bool)

(assert (=> b!274874 (=> (not res!138843) (not e!175918))))

(declare-datatypes ((array!13568 0))(
  ( (array!13569 (arr!6433 (Array (_ BitVec 32) (_ BitVec 64))) (size!6785 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13568)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!274874 (= res!138843 (and (= (size!6785 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6785 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6785 a!3325))))))

(declare-fun b!274875 () Bool)

(declare-fun res!138842 () Bool)

(declare-fun e!175917 () Bool)

(assert (=> b!274875 (=> (not res!138842) (not e!175917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274875 (= res!138842 (validKeyInArray!0 (select (arr!6433 a!3325) startIndex!26)))))

(declare-fun b!274876 () Bool)

(declare-fun e!175916 () Bool)

(assert (=> b!274876 (= e!175918 e!175916)))

(declare-fun res!138840 () Bool)

(assert (=> b!274876 (=> (not res!138840) (not e!175916))))

(declare-datatypes ((SeekEntryResult!1556 0))(
  ( (MissingZero!1556 (index!8394 (_ BitVec 32))) (Found!1556 (index!8395 (_ BitVec 32))) (Intermediate!1556 (undefined!2368 Bool) (index!8396 (_ BitVec 32)) (x!26793 (_ BitVec 32))) (Undefined!1556) (MissingVacant!1556 (index!8397 (_ BitVec 32))) )
))
(declare-fun lt!137232 () SeekEntryResult!1556)

(assert (=> b!274876 (= res!138840 (or (= lt!137232 (MissingZero!1556 i!1267)) (= lt!137232 (MissingVacant!1556 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13568 (_ BitVec 32)) SeekEntryResult!1556)

(assert (=> b!274876 (= lt!137232 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274877 () Bool)

(declare-fun res!138838 () Bool)

(assert (=> b!274877 (=> (not res!138838) (not e!175918))))

(assert (=> b!274877 (= res!138838 (validKeyInArray!0 k0!2581))))

(declare-fun b!274878 () Bool)

(declare-fun res!138841 () Bool)

(assert (=> b!274878 (=> (not res!138841) (not e!175916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13568 (_ BitVec 32)) Bool)

(assert (=> b!274878 (= res!138841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274880 () Bool)

(assert (=> b!274880 (= e!175916 e!175917)))

(declare-fun res!138846 () Bool)

(assert (=> b!274880 (=> (not res!138846) (not e!175917))))

(assert (=> b!274880 (= res!138846 (not (= startIndex!26 i!1267)))))

(declare-fun lt!137229 () array!13568)

(assert (=> b!274880 (= lt!137229 (array!13569 (store (arr!6433 a!3325) i!1267 k0!2581) (size!6785 a!3325)))))

(declare-fun b!274881 () Bool)

(declare-fun res!138844 () Bool)

(assert (=> b!274881 (=> (not res!138844) (not e!175918))))

(declare-datatypes ((List!4154 0))(
  ( (Nil!4151) (Cons!4150 (h!4817 (_ BitVec 64)) (t!9228 List!4154)) )
))
(declare-fun arrayNoDuplicates!0 (array!13568 (_ BitVec 32) List!4154) Bool)

(assert (=> b!274881 (= res!138844 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4151))))

(declare-fun b!274882 () Bool)

(declare-fun res!138845 () Bool)

(assert (=> b!274882 (=> (not res!138845) (not e!175918))))

(declare-fun arrayContainsKey!0 (array!13568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274882 (= res!138845 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274879 () Bool)

(assert (=> b!274879 (= e!175917 (not (or (bvslt startIndex!26 (bvsub (size!6785 a!3325) #b00000000000000000000000000000001)) (bvsle startIndex!26 (size!6785 a!3325)))))))

(assert (=> b!274879 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8651 0))(
  ( (Unit!8652) )
))
(declare-fun lt!137230 () Unit!8651)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8651)

(assert (=> b!274879 (= lt!137230 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!274879 (= (seekEntryOrOpen!0 (select (arr!6433 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6433 a!3325) i!1267 k0!2581) startIndex!26) lt!137229 mask!3868))))

(declare-fun lt!137231 () Unit!8651)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13568 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8651)

(assert (=> b!274879 (= lt!137231 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!274879 (arrayNoDuplicates!0 lt!137229 #b00000000000000000000000000000000 Nil!4151)))

(declare-fun lt!137228 () Unit!8651)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13568 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4154) Unit!8651)

(assert (=> b!274879 (= lt!137228 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4151))))

(declare-fun res!138839 () Bool)

(assert (=> start!26472 (=> (not res!138839) (not e!175918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26472 (= res!138839 (validMask!0 mask!3868))))

(assert (=> start!26472 e!175918))

(declare-fun array_inv!4383 (array!13568) Bool)

(assert (=> start!26472 (array_inv!4383 a!3325)))

(assert (=> start!26472 true))

(assert (= (and start!26472 res!138839) b!274874))

(assert (= (and b!274874 res!138843) b!274877))

(assert (= (and b!274877 res!138838) b!274881))

(assert (= (and b!274881 res!138844) b!274882))

(assert (= (and b!274882 res!138845) b!274876))

(assert (= (and b!274876 res!138840) b!274878))

(assert (= (and b!274878 res!138841) b!274880))

(assert (= (and b!274880 res!138846) b!274875))

(assert (= (and b!274875 res!138842) b!274879))

(declare-fun m!290687 () Bool)

(assert (=> b!274880 m!290687))

(declare-fun m!290689 () Bool)

(assert (=> b!274881 m!290689))

(declare-fun m!290691 () Bool)

(assert (=> start!26472 m!290691))

(declare-fun m!290693 () Bool)

(assert (=> start!26472 m!290693))

(declare-fun m!290695 () Bool)

(assert (=> b!274875 m!290695))

(assert (=> b!274875 m!290695))

(declare-fun m!290697 () Bool)

(assert (=> b!274875 m!290697))

(declare-fun m!290699 () Bool)

(assert (=> b!274877 m!290699))

(declare-fun m!290701 () Bool)

(assert (=> b!274879 m!290701))

(declare-fun m!290703 () Bool)

(assert (=> b!274879 m!290703))

(declare-fun m!290705 () Bool)

(assert (=> b!274879 m!290705))

(assert (=> b!274879 m!290703))

(assert (=> b!274879 m!290687))

(declare-fun m!290707 () Bool)

(assert (=> b!274879 m!290707))

(assert (=> b!274879 m!290695))

(declare-fun m!290709 () Bool)

(assert (=> b!274879 m!290709))

(declare-fun m!290711 () Bool)

(assert (=> b!274879 m!290711))

(assert (=> b!274879 m!290695))

(declare-fun m!290713 () Bool)

(assert (=> b!274879 m!290713))

(declare-fun m!290715 () Bool)

(assert (=> b!274879 m!290715))

(declare-fun m!290717 () Bool)

(assert (=> b!274878 m!290717))

(declare-fun m!290719 () Bool)

(assert (=> b!274882 m!290719))

(declare-fun m!290721 () Bool)

(assert (=> b!274876 m!290721))

(check-sat (not b!274882) (not b!274879) (not b!274875) (not b!274876) (not b!274877) (not b!274881) (not start!26472) (not b!274878))
(check-sat)
