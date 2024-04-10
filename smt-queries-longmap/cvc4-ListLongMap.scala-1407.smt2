; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27298 () Bool)

(assert start!27298)

(declare-fun b!282849 () Bool)

(declare-fun res!145925 () Bool)

(declare-fun e!179496 () Bool)

(assert (=> b!282849 (=> (not res!145925) (not e!179496))))

(declare-datatypes ((array!14116 0))(
  ( (array!14117 (arr!6700 (Array (_ BitVec 32) (_ BitVec 64))) (size!7052 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14116)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14116 (_ BitVec 32)) Bool)

(assert (=> b!282849 (= res!145925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282850 () Bool)

(declare-fun e!179497 () Bool)

(assert (=> b!282850 (= e!179496 e!179497)))

(declare-fun res!145922 () Bool)

(assert (=> b!282850 (=> (not res!145922) (not e!179497))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282850 (= res!145922 (not (= startIndex!26 i!1267)))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lt!139774 () array!14116)

(assert (=> b!282850 (= lt!139774 (array!14117 (store (arr!6700 a!3325) i!1267 k!2581) (size!7052 a!3325)))))

(declare-fun b!282851 () Bool)

(declare-fun res!145919 () Bool)

(declare-fun e!179495 () Bool)

(assert (=> b!282851 (=> (not res!145919) (not e!179495))))

(declare-fun arrayContainsKey!0 (array!14116 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282851 (= res!145919 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282852 () Bool)

(assert (=> b!282852 (= e!179495 e!179496)))

(declare-fun res!145921 () Bool)

(assert (=> b!282852 (=> (not res!145921) (not e!179496))))

(declare-datatypes ((SeekEntryResult!1858 0))(
  ( (MissingZero!1858 (index!9602 (_ BitVec 32))) (Found!1858 (index!9603 (_ BitVec 32))) (Intermediate!1858 (undefined!2670 Bool) (index!9604 (_ BitVec 32)) (x!27808 (_ BitVec 32))) (Undefined!1858) (MissingVacant!1858 (index!9605 (_ BitVec 32))) )
))
(declare-fun lt!139776 () SeekEntryResult!1858)

(assert (=> b!282852 (= res!145921 (or (= lt!139776 (MissingZero!1858 i!1267)) (= lt!139776 (MissingVacant!1858 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14116 (_ BitVec 32)) SeekEntryResult!1858)

(assert (=> b!282852 (= lt!139776 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282853 () Bool)

(assert (=> b!282853 (= e!179497 (not true))))

(assert (=> b!282853 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!9000 0))(
  ( (Unit!9001) )
))
(declare-fun lt!139773 () Unit!9000)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9000)

(assert (=> b!282853 (= lt!139773 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282853 (= (seekEntryOrOpen!0 (select (arr!6700 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6700 a!3325) i!1267 k!2581) startIndex!26) lt!139774 mask!3868))))

(declare-fun lt!139775 () Unit!9000)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14116 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9000)

(assert (=> b!282853 (= lt!139775 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4508 0))(
  ( (Nil!4505) (Cons!4504 (h!5174 (_ BitVec 64)) (t!9590 List!4508)) )
))
(declare-fun arrayNoDuplicates!0 (array!14116 (_ BitVec 32) List!4508) Bool)

(assert (=> b!282853 (arrayNoDuplicates!0 lt!139774 #b00000000000000000000000000000000 Nil!4505)))

(declare-fun lt!139777 () Unit!9000)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14116 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4508) Unit!9000)

(assert (=> b!282853 (= lt!139777 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4505))))

(declare-fun res!145923 () Bool)

(assert (=> start!27298 (=> (not res!145923) (not e!179495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27298 (= res!145923 (validMask!0 mask!3868))))

(assert (=> start!27298 e!179495))

(declare-fun array_inv!4663 (array!14116) Bool)

(assert (=> start!27298 (array_inv!4663 a!3325)))

(assert (=> start!27298 true))

(declare-fun b!282854 () Bool)

(declare-fun res!145926 () Bool)

(assert (=> b!282854 (=> (not res!145926) (not e!179497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282854 (= res!145926 (validKeyInArray!0 (select (arr!6700 a!3325) startIndex!26)))))

(declare-fun b!282855 () Bool)

(declare-fun res!145918 () Bool)

(assert (=> b!282855 (=> (not res!145918) (not e!179495))))

(assert (=> b!282855 (= res!145918 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4505))))

(declare-fun b!282856 () Bool)

(declare-fun res!145920 () Bool)

(assert (=> b!282856 (=> (not res!145920) (not e!179495))))

(assert (=> b!282856 (= res!145920 (validKeyInArray!0 k!2581))))

(declare-fun b!282857 () Bool)

(declare-fun res!145924 () Bool)

(assert (=> b!282857 (=> (not res!145924) (not e!179495))))

(assert (=> b!282857 (= res!145924 (and (= (size!7052 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7052 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7052 a!3325))))))

(assert (= (and start!27298 res!145923) b!282857))

(assert (= (and b!282857 res!145924) b!282856))

(assert (= (and b!282856 res!145920) b!282855))

(assert (= (and b!282855 res!145918) b!282851))

(assert (= (and b!282851 res!145919) b!282852))

(assert (= (and b!282852 res!145921) b!282849))

(assert (= (and b!282849 res!145925) b!282850))

(assert (= (and b!282850 res!145922) b!282854))

(assert (= (and b!282854 res!145926) b!282853))

(declare-fun m!297555 () Bool)

(assert (=> b!282851 m!297555))

(declare-fun m!297557 () Bool)

(assert (=> b!282855 m!297557))

(declare-fun m!297559 () Bool)

(assert (=> start!27298 m!297559))

(declare-fun m!297561 () Bool)

(assert (=> start!27298 m!297561))

(declare-fun m!297563 () Bool)

(assert (=> b!282852 m!297563))

(declare-fun m!297565 () Bool)

(assert (=> b!282854 m!297565))

(assert (=> b!282854 m!297565))

(declare-fun m!297567 () Bool)

(assert (=> b!282854 m!297567))

(declare-fun m!297569 () Bool)

(assert (=> b!282856 m!297569))

(declare-fun m!297571 () Bool)

(assert (=> b!282849 m!297571))

(declare-fun m!297573 () Bool)

(assert (=> b!282853 m!297573))

(declare-fun m!297575 () Bool)

(assert (=> b!282853 m!297575))

(declare-fun m!297577 () Bool)

(assert (=> b!282853 m!297577))

(assert (=> b!282853 m!297575))

(declare-fun m!297579 () Bool)

(assert (=> b!282853 m!297579))

(assert (=> b!282853 m!297565))

(declare-fun m!297581 () Bool)

(assert (=> b!282853 m!297581))

(declare-fun m!297583 () Bool)

(assert (=> b!282853 m!297583))

(assert (=> b!282853 m!297565))

(declare-fun m!297585 () Bool)

(assert (=> b!282853 m!297585))

(declare-fun m!297587 () Bool)

(assert (=> b!282853 m!297587))

(declare-fun m!297589 () Bool)

(assert (=> b!282853 m!297589))

(assert (=> b!282850 m!297577))

(push 1)

