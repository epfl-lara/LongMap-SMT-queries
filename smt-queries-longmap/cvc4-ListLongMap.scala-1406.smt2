; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27292 () Bool)

(assert start!27292)

(declare-fun b!282768 () Bool)

(declare-fun res!145839 () Bool)

(declare-fun e!179460 () Bool)

(assert (=> b!282768 (=> (not res!145839) (not e!179460))))

(declare-datatypes ((array!14110 0))(
  ( (array!14111 (arr!6697 (Array (_ BitVec 32) (_ BitVec 64))) (size!7049 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14110)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14110 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282768 (= res!145839 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282769 () Bool)

(declare-fun res!145842 () Bool)

(declare-fun e!179461 () Bool)

(assert (=> b!282769 (=> (not res!145842) (not e!179461))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282769 (= res!145842 (validKeyInArray!0 (select (arr!6697 a!3325) startIndex!26)))))

(declare-fun b!282770 () Bool)

(declare-fun res!145843 () Bool)

(assert (=> b!282770 (=> (not res!145843) (not e!179460))))

(assert (=> b!282770 (= res!145843 (validKeyInArray!0 k!2581))))

(declare-fun b!282771 () Bool)

(declare-fun e!179462 () Bool)

(assert (=> b!282771 (= e!179460 e!179462)))

(declare-fun res!145838 () Bool)

(assert (=> b!282771 (=> (not res!145838) (not e!179462))))

(declare-datatypes ((SeekEntryResult!1855 0))(
  ( (MissingZero!1855 (index!9590 (_ BitVec 32))) (Found!1855 (index!9591 (_ BitVec 32))) (Intermediate!1855 (undefined!2667 Bool) (index!9592 (_ BitVec 32)) (x!27797 (_ BitVec 32))) (Undefined!1855) (MissingVacant!1855 (index!9593 (_ BitVec 32))) )
))
(declare-fun lt!139728 () SeekEntryResult!1855)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282771 (= res!145838 (or (= lt!139728 (MissingZero!1855 i!1267)) (= lt!139728 (MissingVacant!1855 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14110 (_ BitVec 32)) SeekEntryResult!1855)

(assert (=> b!282771 (= lt!139728 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282773 () Bool)

(declare-fun res!145840 () Bool)

(assert (=> b!282773 (=> (not res!145840) (not e!179462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14110 (_ BitVec 32)) Bool)

(assert (=> b!282773 (= res!145840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282774 () Bool)

(declare-fun res!145844 () Bool)

(assert (=> b!282774 (=> (not res!145844) (not e!179460))))

(declare-datatypes ((List!4505 0))(
  ( (Nil!4502) (Cons!4501 (h!5171 (_ BitVec 64)) (t!9587 List!4505)) )
))
(declare-fun arrayNoDuplicates!0 (array!14110 (_ BitVec 32) List!4505) Bool)

(assert (=> b!282774 (= res!145844 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4502))))

(declare-fun b!282775 () Bool)

(assert (=> b!282775 (= e!179462 e!179461)))

(declare-fun res!145837 () Bool)

(assert (=> b!282775 (=> (not res!145837) (not e!179461))))

(assert (=> b!282775 (= res!145837 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139731 () array!14110)

(assert (=> b!282775 (= lt!139731 (array!14111 (store (arr!6697 a!3325) i!1267 k!2581) (size!7049 a!3325)))))

(declare-fun b!282776 () Bool)

(declare-fun res!145841 () Bool)

(assert (=> b!282776 (=> (not res!145841) (not e!179460))))

(assert (=> b!282776 (= res!145841 (and (= (size!7049 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7049 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7049 a!3325))))))

(declare-fun res!145845 () Bool)

(assert (=> start!27292 (=> (not res!145845) (not e!179460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27292 (= res!145845 (validMask!0 mask!3868))))

(assert (=> start!27292 e!179460))

(declare-fun array_inv!4660 (array!14110) Bool)

(assert (=> start!27292 (array_inv!4660 a!3325)))

(assert (=> start!27292 true))

(declare-fun b!282772 () Bool)

(assert (=> b!282772 (= e!179461 (not true))))

(assert (=> b!282772 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8994 0))(
  ( (Unit!8995) )
))
(declare-fun lt!139730 () Unit!8994)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8994)

(assert (=> b!282772 (= lt!139730 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282772 (= (seekEntryOrOpen!0 (select (arr!6697 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6697 a!3325) i!1267 k!2581) startIndex!26) lt!139731 mask!3868))))

(declare-fun lt!139732 () Unit!8994)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14110 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8994)

(assert (=> b!282772 (= lt!139732 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!282772 (arrayNoDuplicates!0 lt!139731 #b00000000000000000000000000000000 Nil!4502)))

(declare-fun lt!139729 () Unit!8994)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14110 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4505) Unit!8994)

(assert (=> b!282772 (= lt!139729 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4502))))

(assert (= (and start!27292 res!145845) b!282776))

(assert (= (and b!282776 res!145841) b!282770))

(assert (= (and b!282770 res!145843) b!282774))

(assert (= (and b!282774 res!145844) b!282768))

(assert (= (and b!282768 res!145839) b!282771))

(assert (= (and b!282771 res!145838) b!282773))

(assert (= (and b!282773 res!145840) b!282775))

(assert (= (and b!282775 res!145837) b!282769))

(assert (= (and b!282769 res!145842) b!282772))

(declare-fun m!297447 () Bool)

(assert (=> b!282770 m!297447))

(declare-fun m!297449 () Bool)

(assert (=> start!27292 m!297449))

(declare-fun m!297451 () Bool)

(assert (=> start!27292 m!297451))

(declare-fun m!297453 () Bool)

(assert (=> b!282774 m!297453))

(declare-fun m!297455 () Bool)

(assert (=> b!282769 m!297455))

(assert (=> b!282769 m!297455))

(declare-fun m!297457 () Bool)

(assert (=> b!282769 m!297457))

(declare-fun m!297459 () Bool)

(assert (=> b!282773 m!297459))

(declare-fun m!297461 () Bool)

(assert (=> b!282775 m!297461))

(declare-fun m!297463 () Bool)

(assert (=> b!282772 m!297463))

(declare-fun m!297465 () Bool)

(assert (=> b!282772 m!297465))

(declare-fun m!297467 () Bool)

(assert (=> b!282772 m!297467))

(assert (=> b!282772 m!297465))

(assert (=> b!282772 m!297461))

(declare-fun m!297469 () Bool)

(assert (=> b!282772 m!297469))

(assert (=> b!282772 m!297455))

(declare-fun m!297471 () Bool)

(assert (=> b!282772 m!297471))

(declare-fun m!297473 () Bool)

(assert (=> b!282772 m!297473))

(assert (=> b!282772 m!297455))

(declare-fun m!297475 () Bool)

(assert (=> b!282772 m!297475))

(declare-fun m!297477 () Bool)

(assert (=> b!282772 m!297477))

(declare-fun m!297479 () Bool)

(assert (=> b!282771 m!297479))

(declare-fun m!297481 () Bool)

(assert (=> b!282768 m!297481))

(push 1)

