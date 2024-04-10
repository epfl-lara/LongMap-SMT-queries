; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26474 () Bool)

(assert start!26474)

(declare-fun b!274854 () Bool)

(declare-fun res!138847 () Bool)

(declare-fun e!175907 () Bool)

(assert (=> b!274854 (=> (not res!138847) (not e!175907))))

(declare-datatypes ((array!13571 0))(
  ( (array!13572 (arr!6435 (Array (_ BitVec 32) (_ BitVec 64))) (size!6787 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13571)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13571 (_ BitVec 32)) Bool)

(assert (=> b!274854 (= res!138847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274855 () Bool)

(declare-fun res!138846 () Bool)

(declare-fun e!175904 () Bool)

(assert (=> b!274855 (=> (not res!138846) (not e!175904))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274855 (= res!138846 (and (= (size!6787 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6787 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6787 a!3325))))))

(declare-fun b!274856 () Bool)

(assert (=> b!274856 (= e!175904 e!175907)))

(declare-fun res!138850 () Bool)

(assert (=> b!274856 (=> (not res!138850) (not e!175907))))

(declare-datatypes ((SeekEntryResult!1593 0))(
  ( (MissingZero!1593 (index!8542 (_ BitVec 32))) (Found!1593 (index!8543 (_ BitVec 32))) (Intermediate!1593 (undefined!2405 Bool) (index!8544 (_ BitVec 32)) (x!26830 (_ BitVec 32))) (Undefined!1593) (MissingVacant!1593 (index!8545 (_ BitVec 32))) )
))
(declare-fun lt!137186 () SeekEntryResult!1593)

(assert (=> b!274856 (= res!138850 (or (= lt!137186 (MissingZero!1593 i!1267)) (= lt!137186 (MissingVacant!1593 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13571 (_ BitVec 32)) SeekEntryResult!1593)

(assert (=> b!274856 (= lt!137186 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274857 () Bool)

(declare-fun res!138851 () Bool)

(assert (=> b!274857 (=> (not res!138851) (not e!175904))))

(declare-fun arrayContainsKey!0 (array!13571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274857 (= res!138851 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274858 () Bool)

(declare-fun res!138849 () Bool)

(assert (=> b!274858 (=> (not res!138849) (not e!175904))))

(declare-datatypes ((List!4243 0))(
  ( (Nil!4240) (Cons!4239 (h!4906 (_ BitVec 64)) (t!9325 List!4243)) )
))
(declare-fun arrayNoDuplicates!0 (array!13571 (_ BitVec 32) List!4243) Bool)

(assert (=> b!274858 (= res!138849 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4240))))

(declare-fun b!274859 () Bool)

(declare-fun res!138848 () Bool)

(declare-fun e!175906 () Bool)

(assert (=> b!274859 (=> (not res!138848) (not e!175906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274859 (= res!138848 (validKeyInArray!0 (select (arr!6435 a!3325) startIndex!26)))))

(declare-fun res!138852 () Bool)

(assert (=> start!26474 (=> (not res!138852) (not e!175904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26474 (= res!138852 (validMask!0 mask!3868))))

(assert (=> start!26474 e!175904))

(declare-fun array_inv!4398 (array!13571) Bool)

(assert (=> start!26474 (array_inv!4398 a!3325)))

(assert (=> start!26474 true))

(declare-fun b!274860 () Bool)

(assert (=> b!274860 (= e!175906 (not (or (bvslt startIndex!26 (bvsub (size!6787 a!3325) #b00000000000000000000000000000001)) (bvsle startIndex!26 (size!6787 a!3325)))))))

(assert (=> b!274860 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8673 0))(
  ( (Unit!8674) )
))
(declare-fun lt!137184 () Unit!8673)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13571 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8673)

(assert (=> b!274860 (= lt!137184 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!137187 () array!13571)

(assert (=> b!274860 (= (seekEntryOrOpen!0 (select (arr!6435 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6435 a!3325) i!1267 k0!2581) startIndex!26) lt!137187 mask!3868))))

(declare-fun lt!137188 () Unit!8673)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13571 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8673)

(assert (=> b!274860 (= lt!137188 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!274860 (arrayNoDuplicates!0 lt!137187 #b00000000000000000000000000000000 Nil!4240)))

(declare-fun lt!137185 () Unit!8673)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13571 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4243) Unit!8673)

(assert (=> b!274860 (= lt!137185 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4240))))

(declare-fun b!274861 () Bool)

(assert (=> b!274861 (= e!175907 e!175906)))

(declare-fun res!138845 () Bool)

(assert (=> b!274861 (=> (not res!138845) (not e!175906))))

(assert (=> b!274861 (= res!138845 (not (= startIndex!26 i!1267)))))

(assert (=> b!274861 (= lt!137187 (array!13572 (store (arr!6435 a!3325) i!1267 k0!2581) (size!6787 a!3325)))))

(declare-fun b!274862 () Bool)

(declare-fun res!138844 () Bool)

(assert (=> b!274862 (=> (not res!138844) (not e!175904))))

(assert (=> b!274862 (= res!138844 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26474 res!138852) b!274855))

(assert (= (and b!274855 res!138846) b!274862))

(assert (= (and b!274862 res!138844) b!274858))

(assert (= (and b!274858 res!138849) b!274857))

(assert (= (and b!274857 res!138851) b!274856))

(assert (= (and b!274856 res!138850) b!274854))

(assert (= (and b!274854 res!138847) b!274861))

(assert (= (and b!274861 res!138845) b!274859))

(assert (= (and b!274859 res!138848) b!274860))

(declare-fun m!290517 () Bool)

(assert (=> b!274857 m!290517))

(declare-fun m!290519 () Bool)

(assert (=> b!274856 m!290519))

(declare-fun m!290521 () Bool)

(assert (=> b!274861 m!290521))

(declare-fun m!290523 () Bool)

(assert (=> b!274854 m!290523))

(declare-fun m!290525 () Bool)

(assert (=> start!26474 m!290525))

(declare-fun m!290527 () Bool)

(assert (=> start!26474 m!290527))

(declare-fun m!290529 () Bool)

(assert (=> b!274860 m!290529))

(declare-fun m!290531 () Bool)

(assert (=> b!274860 m!290531))

(declare-fun m!290533 () Bool)

(assert (=> b!274860 m!290533))

(assert (=> b!274860 m!290521))

(declare-fun m!290535 () Bool)

(assert (=> b!274860 m!290535))

(declare-fun m!290537 () Bool)

(assert (=> b!274860 m!290537))

(declare-fun m!290539 () Bool)

(assert (=> b!274860 m!290539))

(declare-fun m!290541 () Bool)

(assert (=> b!274860 m!290541))

(declare-fun m!290543 () Bool)

(assert (=> b!274860 m!290543))

(assert (=> b!274860 m!290531))

(declare-fun m!290545 () Bool)

(assert (=> b!274860 m!290545))

(assert (=> b!274860 m!290541))

(assert (=> b!274859 m!290541))

(assert (=> b!274859 m!290541))

(declare-fun m!290547 () Bool)

(assert (=> b!274859 m!290547))

(declare-fun m!290549 () Bool)

(assert (=> b!274862 m!290549))

(declare-fun m!290551 () Bool)

(assert (=> b!274858 m!290551))

(check-sat (not b!274857) (not b!274860) (not b!274862) (not b!274858) (not start!26474) (not b!274859) (not b!274854) (not b!274856))
(check-sat)
