; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27200 () Bool)

(assert start!27200)

(declare-fun b!281526 () Bool)

(declare-fun e!178907 () Bool)

(assert (=> b!281526 (= e!178907 (not true))))

(declare-datatypes ((array!14018 0))(
  ( (array!14019 (arr!6651 (Array (_ BitVec 32) (_ BitVec 64))) (size!7003 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14018)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lt!139080 () array!14018)

(declare-datatypes ((SeekEntryResult!1809 0))(
  ( (MissingZero!1809 (index!9406 (_ BitVec 32))) (Found!1809 (index!9407 (_ BitVec 32))) (Intermediate!1809 (undefined!2621 Bool) (index!9408 (_ BitVec 32)) (x!27631 (_ BitVec 32))) (Undefined!1809) (MissingVacant!1809 (index!9409 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14018 (_ BitVec 32)) SeekEntryResult!1809)

(assert (=> b!281526 (= (seekEntryOrOpen!0 (select (arr!6651 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6651 a!3325) i!1267 k0!2581) startIndex!26) lt!139080 mask!3868))))

(declare-datatypes ((Unit!8902 0))(
  ( (Unit!8903) )
))
(declare-fun lt!139079 () Unit!8902)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14018 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8902)

(assert (=> b!281526 (= lt!139079 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4459 0))(
  ( (Nil!4456) (Cons!4455 (h!5125 (_ BitVec 64)) (t!9541 List!4459)) )
))
(declare-fun arrayNoDuplicates!0 (array!14018 (_ BitVec 32) List!4459) Bool)

(assert (=> b!281526 (arrayNoDuplicates!0 lt!139080 #b00000000000000000000000000000000 Nil!4456)))

(declare-fun lt!139078 () Unit!8902)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14018 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4459) Unit!8902)

(assert (=> b!281526 (= lt!139078 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4456))))

(declare-fun b!281527 () Bool)

(declare-fun res!144599 () Bool)

(declare-fun e!178910 () Bool)

(assert (=> b!281527 (=> (not res!144599) (not e!178910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281527 (= res!144599 (validKeyInArray!0 k0!2581))))

(declare-fun res!144602 () Bool)

(assert (=> start!27200 (=> (not res!144602) (not e!178910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27200 (= res!144602 (validMask!0 mask!3868))))

(assert (=> start!27200 e!178910))

(declare-fun array_inv!4614 (array!14018) Bool)

(assert (=> start!27200 (array_inv!4614 a!3325)))

(assert (=> start!27200 true))

(declare-fun b!281528 () Bool)

(declare-fun e!178908 () Bool)

(assert (=> b!281528 (= e!178910 e!178908)))

(declare-fun res!144601 () Bool)

(assert (=> b!281528 (=> (not res!144601) (not e!178908))))

(declare-fun lt!139081 () SeekEntryResult!1809)

(assert (=> b!281528 (= res!144601 (or (= lt!139081 (MissingZero!1809 i!1267)) (= lt!139081 (MissingVacant!1809 i!1267))))))

(assert (=> b!281528 (= lt!139081 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281529 () Bool)

(assert (=> b!281529 (= e!178908 e!178907)))

(declare-fun res!144597 () Bool)

(assert (=> b!281529 (=> (not res!144597) (not e!178907))))

(assert (=> b!281529 (= res!144597 (not (= startIndex!26 i!1267)))))

(assert (=> b!281529 (= lt!139080 (array!14019 (store (arr!6651 a!3325) i!1267 k0!2581) (size!7003 a!3325)))))

(declare-fun b!281530 () Bool)

(declare-fun res!144598 () Bool)

(assert (=> b!281530 (=> (not res!144598) (not e!178907))))

(assert (=> b!281530 (= res!144598 (validKeyInArray!0 (select (arr!6651 a!3325) startIndex!26)))))

(declare-fun b!281531 () Bool)

(declare-fun res!144603 () Bool)

(assert (=> b!281531 (=> (not res!144603) (not e!178910))))

(declare-fun arrayContainsKey!0 (array!14018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281531 (= res!144603 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281532 () Bool)

(declare-fun res!144595 () Bool)

(assert (=> b!281532 (=> (not res!144595) (not e!178908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14018 (_ BitVec 32)) Bool)

(assert (=> b!281532 (= res!144595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281533 () Bool)

(declare-fun res!144600 () Bool)

(assert (=> b!281533 (=> (not res!144600) (not e!178910))))

(assert (=> b!281533 (= res!144600 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4456))))

(declare-fun b!281534 () Bool)

(declare-fun res!144596 () Bool)

(assert (=> b!281534 (=> (not res!144596) (not e!178910))))

(assert (=> b!281534 (= res!144596 (and (= (size!7003 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7003 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7003 a!3325))))))

(assert (= (and start!27200 res!144602) b!281534))

(assert (= (and b!281534 res!144596) b!281527))

(assert (= (and b!281527 res!144599) b!281533))

(assert (= (and b!281533 res!144600) b!281531))

(assert (= (and b!281531 res!144603) b!281528))

(assert (= (and b!281528 res!144601) b!281532))

(assert (= (and b!281532 res!144595) b!281529))

(assert (= (and b!281529 res!144597) b!281530))

(assert (= (and b!281530 res!144598) b!281526))

(declare-fun m!295847 () Bool)

(assert (=> b!281527 m!295847))

(declare-fun m!295849 () Bool)

(assert (=> b!281526 m!295849))

(declare-fun m!295851 () Bool)

(assert (=> b!281526 m!295851))

(declare-fun m!295853 () Bool)

(assert (=> b!281526 m!295853))

(declare-fun m!295855 () Bool)

(assert (=> b!281526 m!295855))

(declare-fun m!295857 () Bool)

(assert (=> b!281526 m!295857))

(declare-fun m!295859 () Bool)

(assert (=> b!281526 m!295859))

(assert (=> b!281526 m!295855))

(declare-fun m!295861 () Bool)

(assert (=> b!281526 m!295861))

(assert (=> b!281526 m!295849))

(declare-fun m!295863 () Bool)

(assert (=> b!281526 m!295863))

(declare-fun m!295865 () Bool)

(assert (=> b!281533 m!295865))

(assert (=> b!281529 m!295853))

(assert (=> b!281530 m!295855))

(assert (=> b!281530 m!295855))

(declare-fun m!295867 () Bool)

(assert (=> b!281530 m!295867))

(declare-fun m!295869 () Bool)

(assert (=> b!281531 m!295869))

(declare-fun m!295871 () Bool)

(assert (=> b!281528 m!295871))

(declare-fun m!295873 () Bool)

(assert (=> b!281532 m!295873))

(declare-fun m!295875 () Bool)

(assert (=> start!27200 m!295875))

(declare-fun m!295877 () Bool)

(assert (=> start!27200 m!295877))

(check-sat (not b!281531) (not b!281527) (not b!281533) (not b!281530) (not start!27200) (not b!281528) (not b!281532) (not b!281526))
(check-sat)
