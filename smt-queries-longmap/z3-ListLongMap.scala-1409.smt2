; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27308 () Bool)

(assert start!27308)

(declare-fun b!282989 () Bool)

(declare-fun res!146063 () Bool)

(declare-fun e!179564 () Bool)

(assert (=> b!282989 (=> (not res!146063) (not e!179564))))

(declare-datatypes ((array!14126 0))(
  ( (array!14127 (arr!6705 (Array (_ BitVec 32) (_ BitVec 64))) (size!7057 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14126)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14126 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282989 (= res!146063 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282990 () Bool)

(declare-fun res!146067 () Bool)

(declare-fun e!179563 () Bool)

(assert (=> b!282990 (=> (not res!146067) (not e!179563))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14126 (_ BitVec 32)) Bool)

(assert (=> b!282990 (= res!146067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282991 () Bool)

(declare-fun res!146062 () Bool)

(assert (=> b!282991 (=> (not res!146062) (not e!179564))))

(declare-datatypes ((List!4513 0))(
  ( (Nil!4510) (Cons!4509 (h!5179 (_ BitVec 64)) (t!9595 List!4513)) )
))
(declare-fun arrayNoDuplicates!0 (array!14126 (_ BitVec 32) List!4513) Bool)

(assert (=> b!282991 (= res!146062 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4510))))

(declare-fun b!282992 () Bool)

(declare-fun e!179561 () Bool)

(declare-fun e!179562 () Bool)

(assert (=> b!282992 (= e!179561 (not e!179562))))

(declare-fun res!146059 () Bool)

(assert (=> b!282992 (=> res!146059 e!179562)))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!282992 (= res!146059 (or (bvsge startIndex!26 (bvsub (size!7057 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!282992 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!9010 0))(
  ( (Unit!9011) )
))
(declare-fun lt!139854 () Unit!9010)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14126 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9010)

(assert (=> b!282992 (= lt!139854 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lt!139853 () array!14126)

(declare-datatypes ((SeekEntryResult!1863 0))(
  ( (MissingZero!1863 (index!9622 (_ BitVec 32))) (Found!1863 (index!9623 (_ BitVec 32))) (Intermediate!1863 (undefined!2675 Bool) (index!9624 (_ BitVec 32)) (x!27829 (_ BitVec 32))) (Undefined!1863) (MissingVacant!1863 (index!9625 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14126 (_ BitVec 32)) SeekEntryResult!1863)

(assert (=> b!282992 (= (seekEntryOrOpen!0 (select (arr!6705 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6705 a!3325) i!1267 k0!2581) startIndex!26) lt!139853 mask!3868))))

(declare-fun lt!139858 () Unit!9010)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14126 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9010)

(assert (=> b!282992 (= lt!139858 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282992 (arrayNoDuplicates!0 lt!139853 #b00000000000000000000000000000000 Nil!4510)))

(declare-fun lt!139857 () Unit!9010)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14126 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4513) Unit!9010)

(assert (=> b!282992 (= lt!139857 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4510))))

(declare-fun b!282993 () Bool)

(assert (=> b!282993 (= e!179564 e!179563)))

(declare-fun res!146061 () Bool)

(assert (=> b!282993 (=> (not res!146061) (not e!179563))))

(declare-fun lt!139856 () SeekEntryResult!1863)

(assert (=> b!282993 (= res!146061 (or (= lt!139856 (MissingZero!1863 i!1267)) (= lt!139856 (MissingVacant!1863 i!1267))))))

(assert (=> b!282993 (= lt!139856 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282994 () Bool)

(assert (=> b!282994 (= e!179562 true)))

(assert (=> b!282994 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!139853 mask!3868)))

(declare-fun lt!139855 () Unit!9010)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14126 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9010)

(assert (=> b!282994 (= lt!139855 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun res!146065 () Bool)

(assert (=> start!27308 (=> (not res!146065) (not e!179564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27308 (= res!146065 (validMask!0 mask!3868))))

(assert (=> start!27308 e!179564))

(declare-fun array_inv!4668 (array!14126) Bool)

(assert (=> start!27308 (array_inv!4668 a!3325)))

(assert (=> start!27308 true))

(declare-fun b!282995 () Bool)

(declare-fun res!146064 () Bool)

(assert (=> b!282995 (=> (not res!146064) (not e!179561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282995 (= res!146064 (validKeyInArray!0 (select (arr!6705 a!3325) startIndex!26)))))

(declare-fun b!282996 () Bool)

(assert (=> b!282996 (= e!179563 e!179561)))

(declare-fun res!146060 () Bool)

(assert (=> b!282996 (=> (not res!146060) (not e!179561))))

(assert (=> b!282996 (= res!146060 (not (= startIndex!26 i!1267)))))

(assert (=> b!282996 (= lt!139853 (array!14127 (store (arr!6705 a!3325) i!1267 k0!2581) (size!7057 a!3325)))))

(declare-fun b!282997 () Bool)

(declare-fun res!146058 () Bool)

(assert (=> b!282997 (=> (not res!146058) (not e!179564))))

(assert (=> b!282997 (= res!146058 (validKeyInArray!0 k0!2581))))

(declare-fun b!282998 () Bool)

(declare-fun res!146066 () Bool)

(assert (=> b!282998 (=> (not res!146066) (not e!179564))))

(assert (=> b!282998 (= res!146066 (and (= (size!7057 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7057 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7057 a!3325))))))

(assert (= (and start!27308 res!146065) b!282998))

(assert (= (and b!282998 res!146066) b!282997))

(assert (= (and b!282997 res!146058) b!282991))

(assert (= (and b!282991 res!146062) b!282989))

(assert (= (and b!282989 res!146063) b!282993))

(assert (= (and b!282993 res!146061) b!282990))

(assert (= (and b!282990 res!146067) b!282996))

(assert (= (and b!282996 res!146060) b!282995))

(assert (= (and b!282995 res!146064) b!282992))

(assert (= (and b!282992 (not res!146059)) b!282994))

(declare-fun m!297739 () Bool)

(assert (=> b!282995 m!297739))

(assert (=> b!282995 m!297739))

(declare-fun m!297741 () Bool)

(assert (=> b!282995 m!297741))

(declare-fun m!297743 () Bool)

(assert (=> b!282990 m!297743))

(declare-fun m!297745 () Bool)

(assert (=> b!282994 m!297745))

(declare-fun m!297747 () Bool)

(assert (=> b!282994 m!297747))

(declare-fun m!297749 () Bool)

(assert (=> b!282997 m!297749))

(declare-fun m!297751 () Bool)

(assert (=> b!282993 m!297751))

(declare-fun m!297753 () Bool)

(assert (=> b!282992 m!297753))

(declare-fun m!297755 () Bool)

(assert (=> b!282992 m!297755))

(declare-fun m!297757 () Bool)

(assert (=> b!282992 m!297757))

(assert (=> b!282992 m!297755))

(declare-fun m!297759 () Bool)

(assert (=> b!282992 m!297759))

(declare-fun m!297761 () Bool)

(assert (=> b!282992 m!297761))

(assert (=> b!282992 m!297739))

(declare-fun m!297763 () Bool)

(assert (=> b!282992 m!297763))

(assert (=> b!282992 m!297739))

(declare-fun m!297765 () Bool)

(assert (=> b!282992 m!297765))

(declare-fun m!297767 () Bool)

(assert (=> b!282992 m!297767))

(declare-fun m!297769 () Bool)

(assert (=> b!282992 m!297769))

(assert (=> b!282996 m!297759))

(declare-fun m!297771 () Bool)

(assert (=> b!282989 m!297771))

(declare-fun m!297773 () Bool)

(assert (=> b!282991 m!297773))

(declare-fun m!297775 () Bool)

(assert (=> start!27308 m!297775))

(declare-fun m!297777 () Bool)

(assert (=> start!27308 m!297777))

(check-sat (not b!282995) (not b!282992) (not b!282993) (not b!282990) (not b!282997) (not b!282994) (not b!282989) (not b!282991) (not start!27308))
(check-sat)
