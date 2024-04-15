; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27182 () Bool)

(assert start!27182)

(declare-fun res!144235 () Bool)

(declare-fun e!178713 () Bool)

(assert (=> start!27182 (=> (not res!144235) (not e!178713))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27182 (= res!144235 (validMask!0 mask!3868))))

(assert (=> start!27182 e!178713))

(declare-datatypes ((array!13989 0))(
  ( (array!13990 (arr!6636 (Array (_ BitVec 32) (_ BitVec 64))) (size!6989 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13989)

(declare-fun array_inv!4608 (array!13989) Bool)

(assert (=> start!27182 (array_inv!4608 a!3325)))

(assert (=> start!27182 true))

(declare-fun b!281109 () Bool)

(declare-fun res!144231 () Bool)

(assert (=> b!281109 (=> (not res!144231) (not e!178713))))

(declare-datatypes ((List!4417 0))(
  ( (Nil!4414) (Cons!4413 (h!5083 (_ BitVec 64)) (t!9490 List!4417)) )
))
(declare-fun arrayNoDuplicates!0 (array!13989 (_ BitVec 32) List!4417) Bool)

(assert (=> b!281109 (= res!144231 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4414))))

(declare-fun b!281110 () Bool)

(declare-fun e!178711 () Bool)

(assert (=> b!281110 (= e!178713 e!178711)))

(declare-fun res!144236 () Bool)

(assert (=> b!281110 (=> (not res!144236) (not e!178711))))

(declare-datatypes ((SeekEntryResult!1793 0))(
  ( (MissingZero!1793 (index!9342 (_ BitVec 32))) (Found!1793 (index!9343 (_ BitVec 32))) (Intermediate!1793 (undefined!2605 Bool) (index!9344 (_ BitVec 32)) (x!27590 (_ BitVec 32))) (Undefined!1793) (MissingVacant!1793 (index!9345 (_ BitVec 32))) )
))
(declare-fun lt!138827 () SeekEntryResult!1793)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281110 (= res!144236 (or (= lt!138827 (MissingZero!1793 i!1267)) (= lt!138827 (MissingVacant!1793 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13989 (_ BitVec 32)) SeekEntryResult!1793)

(assert (=> b!281110 (= lt!138827 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281111 () Bool)

(assert (=> b!281111 (= e!178711 (not true))))

(assert (=> b!281111 (arrayNoDuplicates!0 (array!13990 (store (arr!6636 a!3325) i!1267 k0!2581) (size!6989 a!3325)) #b00000000000000000000000000000000 Nil!4414)))

(declare-datatypes ((Unit!8832 0))(
  ( (Unit!8833) )
))
(declare-fun lt!138828 () Unit!8832)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13989 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4417) Unit!8832)

(assert (=> b!281111 (= lt!138828 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4414))))

(declare-fun b!281112 () Bool)

(declare-fun res!144237 () Bool)

(assert (=> b!281112 (=> (not res!144237) (not e!178713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281112 (= res!144237 (validKeyInArray!0 k0!2581))))

(declare-fun b!281113 () Bool)

(declare-fun res!144233 () Bool)

(assert (=> b!281113 (=> (not res!144233) (not e!178713))))

(declare-fun arrayContainsKey!0 (array!13989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281113 (= res!144233 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281114 () Bool)

(declare-fun res!144234 () Bool)

(assert (=> b!281114 (=> (not res!144234) (not e!178713))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!281114 (= res!144234 (and (= (size!6989 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6989 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6989 a!3325))))))

(declare-fun b!281115 () Bool)

(declare-fun res!144238 () Bool)

(assert (=> b!281115 (=> (not res!144238) (not e!178711))))

(assert (=> b!281115 (= res!144238 (not (= startIndex!26 i!1267)))))

(declare-fun b!281116 () Bool)

(declare-fun res!144230 () Bool)

(assert (=> b!281116 (=> (not res!144230) (not e!178711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13989 (_ BitVec 32)) Bool)

(assert (=> b!281116 (= res!144230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281117 () Bool)

(declare-fun res!144232 () Bool)

(assert (=> b!281117 (=> (not res!144232) (not e!178711))))

(assert (=> b!281117 (= res!144232 (validKeyInArray!0 (select (arr!6636 a!3325) startIndex!26)))))

(assert (= (and start!27182 res!144235) b!281114))

(assert (= (and b!281114 res!144234) b!281112))

(assert (= (and b!281112 res!144237) b!281109))

(assert (= (and b!281109 res!144231) b!281113))

(assert (= (and b!281113 res!144233) b!281110))

(assert (= (and b!281110 res!144236) b!281116))

(assert (= (and b!281116 res!144230) b!281115))

(assert (= (and b!281115 res!144238) b!281117))

(assert (= (and b!281117 res!144232) b!281111))

(declare-fun m!295007 () Bool)

(assert (=> b!281113 m!295007))

(declare-fun m!295009 () Bool)

(assert (=> b!281109 m!295009))

(declare-fun m!295011 () Bool)

(assert (=> b!281112 m!295011))

(declare-fun m!295013 () Bool)

(assert (=> start!27182 m!295013))

(declare-fun m!295015 () Bool)

(assert (=> start!27182 m!295015))

(declare-fun m!295017 () Bool)

(assert (=> b!281110 m!295017))

(declare-fun m!295019 () Bool)

(assert (=> b!281116 m!295019))

(declare-fun m!295021 () Bool)

(assert (=> b!281117 m!295021))

(assert (=> b!281117 m!295021))

(declare-fun m!295023 () Bool)

(assert (=> b!281117 m!295023))

(declare-fun m!295025 () Bool)

(assert (=> b!281111 m!295025))

(declare-fun m!295027 () Bool)

(assert (=> b!281111 m!295027))

(declare-fun m!295029 () Bool)

(assert (=> b!281111 m!295029))

(check-sat (not b!281110) (not b!281109) (not b!281113) (not b!281117) (not b!281116) (not b!281112) (not start!27182) (not b!281111))
(check-sat)
