; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27222 () Bool)

(assert start!27222)

(declare-fun b!281823 () Bool)

(declare-fun res!144899 () Bool)

(declare-fun e!179040 () Bool)

(assert (=> b!281823 (=> (not res!144899) (not e!179040))))

(declare-datatypes ((array!14040 0))(
  ( (array!14041 (arr!6662 (Array (_ BitVec 32) (_ BitVec 64))) (size!7014 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14040)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281823 (= res!144899 (validKeyInArray!0 (select (arr!6662 a!3325) startIndex!26)))))

(declare-fun b!281824 () Bool)

(declare-fun res!144897 () Bool)

(declare-fun e!179041 () Bool)

(assert (=> b!281824 (=> (not res!144897) (not e!179041))))

(declare-datatypes ((List!4470 0))(
  ( (Nil!4467) (Cons!4466 (h!5136 (_ BitVec 64)) (t!9552 List!4470)) )
))
(declare-fun arrayNoDuplicates!0 (array!14040 (_ BitVec 32) List!4470) Bool)

(assert (=> b!281824 (= res!144897 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4467))))

(declare-fun b!281825 () Bool)

(assert (=> b!281825 (= e!179040 (not true))))

(declare-fun lt!139211 () array!14040)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1820 0))(
  ( (MissingZero!1820 (index!9450 (_ BitVec 32))) (Found!1820 (index!9451 (_ BitVec 32))) (Intermediate!1820 (undefined!2632 Bool) (index!9452 (_ BitVec 32)) (x!27674 (_ BitVec 32))) (Undefined!1820) (MissingVacant!1820 (index!9453 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14040 (_ BitVec 32)) SeekEntryResult!1820)

(assert (=> b!281825 (= (seekEntryOrOpen!0 (select (arr!6662 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6662 a!3325) i!1267 k!2581) startIndex!26) lt!139211 mask!3868))))

(declare-datatypes ((Unit!8924 0))(
  ( (Unit!8925) )
))
(declare-fun lt!139213 () Unit!8924)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14040 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8924)

(assert (=> b!281825 (= lt!139213 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!281825 (arrayNoDuplicates!0 lt!139211 #b00000000000000000000000000000000 Nil!4467)))

(declare-fun lt!139212 () Unit!8924)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14040 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4470) Unit!8924)

(assert (=> b!281825 (= lt!139212 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4467))))

(declare-fun b!281826 () Bool)

(declare-fun res!144898 () Bool)

(assert (=> b!281826 (=> (not res!144898) (not e!179041))))

(declare-fun arrayContainsKey!0 (array!14040 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281826 (= res!144898 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!144895 () Bool)

(assert (=> start!27222 (=> (not res!144895) (not e!179041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27222 (= res!144895 (validMask!0 mask!3868))))

(assert (=> start!27222 e!179041))

(declare-fun array_inv!4625 (array!14040) Bool)

(assert (=> start!27222 (array_inv!4625 a!3325)))

(assert (=> start!27222 true))

(declare-fun b!281827 () Bool)

(declare-fun res!144894 () Bool)

(assert (=> b!281827 (=> (not res!144894) (not e!179041))))

(assert (=> b!281827 (= res!144894 (validKeyInArray!0 k!2581))))

(declare-fun b!281828 () Bool)

(declare-fun e!179039 () Bool)

(assert (=> b!281828 (= e!179039 e!179040)))

(declare-fun res!144893 () Bool)

(assert (=> b!281828 (=> (not res!144893) (not e!179040))))

(assert (=> b!281828 (= res!144893 (not (= startIndex!26 i!1267)))))

(assert (=> b!281828 (= lt!139211 (array!14041 (store (arr!6662 a!3325) i!1267 k!2581) (size!7014 a!3325)))))

(declare-fun b!281829 () Bool)

(assert (=> b!281829 (= e!179041 e!179039)))

(declare-fun res!144900 () Bool)

(assert (=> b!281829 (=> (not res!144900) (not e!179039))))

(declare-fun lt!139210 () SeekEntryResult!1820)

(assert (=> b!281829 (= res!144900 (or (= lt!139210 (MissingZero!1820 i!1267)) (= lt!139210 (MissingVacant!1820 i!1267))))))

(assert (=> b!281829 (= lt!139210 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!281830 () Bool)

(declare-fun res!144896 () Bool)

(assert (=> b!281830 (=> (not res!144896) (not e!179041))))

(assert (=> b!281830 (= res!144896 (and (= (size!7014 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7014 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7014 a!3325))))))

(declare-fun b!281831 () Bool)

(declare-fun res!144892 () Bool)

(assert (=> b!281831 (=> (not res!144892) (not e!179039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14040 (_ BitVec 32)) Bool)

(assert (=> b!281831 (= res!144892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27222 res!144895) b!281830))

(assert (= (and b!281830 res!144896) b!281827))

(assert (= (and b!281827 res!144894) b!281824))

(assert (= (and b!281824 res!144897) b!281826))

(assert (= (and b!281826 res!144898) b!281829))

(assert (= (and b!281829 res!144900) b!281831))

(assert (= (and b!281831 res!144892) b!281828))

(assert (= (and b!281828 res!144893) b!281823))

(assert (= (and b!281823 res!144899) b!281825))

(declare-fun m!296199 () Bool)

(assert (=> b!281831 m!296199))

(declare-fun m!296201 () Bool)

(assert (=> b!281825 m!296201))

(declare-fun m!296203 () Bool)

(assert (=> b!281825 m!296203))

(assert (=> b!281825 m!296201))

(declare-fun m!296205 () Bool)

(assert (=> b!281825 m!296205))

(declare-fun m!296207 () Bool)

(assert (=> b!281825 m!296207))

(declare-fun m!296209 () Bool)

(assert (=> b!281825 m!296209))

(declare-fun m!296211 () Bool)

(assert (=> b!281825 m!296211))

(assert (=> b!281825 m!296207))

(declare-fun m!296213 () Bool)

(assert (=> b!281825 m!296213))

(declare-fun m!296215 () Bool)

(assert (=> b!281825 m!296215))

(assert (=> b!281828 m!296203))

(declare-fun m!296217 () Bool)

(assert (=> start!27222 m!296217))

(declare-fun m!296219 () Bool)

(assert (=> start!27222 m!296219))

(declare-fun m!296221 () Bool)

(assert (=> b!281827 m!296221))

(declare-fun m!296223 () Bool)

(assert (=> b!281829 m!296223))

(declare-fun m!296225 () Bool)

(assert (=> b!281826 m!296225))

(declare-fun m!296227 () Bool)

(assert (=> b!281824 m!296227))

(assert (=> b!281823 m!296207))

(assert (=> b!281823 m!296207))

(declare-fun m!296229 () Bool)

(assert (=> b!281823 m!296229))

(push 1)

