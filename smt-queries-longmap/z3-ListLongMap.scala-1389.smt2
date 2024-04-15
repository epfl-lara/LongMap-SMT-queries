; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27188 () Bool)

(assert start!27188)

(declare-fun b!281191 () Bool)

(declare-fun res!144312 () Bool)

(declare-fun e!178740 () Bool)

(assert (=> b!281191 (=> (not res!144312) (not e!178740))))

(declare-datatypes ((array!13995 0))(
  ( (array!13996 (arr!6639 (Array (_ BitVec 32) (_ BitVec 64))) (size!6992 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13995)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!281191 (= res!144312 (and (= (size!6992 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6992 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6992 a!3325))))))

(declare-fun b!281192 () Bool)

(declare-fun res!144318 () Bool)

(declare-fun e!178738 () Bool)

(assert (=> b!281192 (=> (not res!144318) (not e!178738))))

(assert (=> b!281192 (= res!144318 (not (= startIndex!26 i!1267)))))

(declare-fun b!281193 () Bool)

(declare-fun res!144311 () Bool)

(assert (=> b!281193 (=> (not res!144311) (not e!178738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281193 (= res!144311 (validKeyInArray!0 (select (arr!6639 a!3325) startIndex!26)))))

(declare-fun b!281194 () Bool)

(declare-fun res!144317 () Bool)

(assert (=> b!281194 (=> (not res!144317) (not e!178740))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281194 (= res!144317 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281195 () Bool)

(declare-fun res!144319 () Bool)

(assert (=> b!281195 (=> (not res!144319) (not e!178740))))

(declare-datatypes ((List!4420 0))(
  ( (Nil!4417) (Cons!4416 (h!5086 (_ BitVec 64)) (t!9493 List!4420)) )
))
(declare-fun arrayNoDuplicates!0 (array!13995 (_ BitVec 32) List!4420) Bool)

(assert (=> b!281195 (= res!144319 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4417))))

(declare-fun b!281196 () Bool)

(declare-fun res!144315 () Bool)

(assert (=> b!281196 (=> (not res!144315) (not e!178738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13995 (_ BitVec 32)) Bool)

(assert (=> b!281196 (= res!144315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281197 () Bool)

(assert (=> b!281197 (= e!178738 (not true))))

(assert (=> b!281197 (arrayNoDuplicates!0 (array!13996 (store (arr!6639 a!3325) i!1267 k0!2581) (size!6992 a!3325)) #b00000000000000000000000000000000 Nil!4417)))

(declare-datatypes ((Unit!8838 0))(
  ( (Unit!8839) )
))
(declare-fun lt!138846 () Unit!8838)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13995 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4420) Unit!8838)

(assert (=> b!281197 (= lt!138846 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4417))))

(declare-fun b!281198 () Bool)

(declare-fun res!144314 () Bool)

(assert (=> b!281198 (=> (not res!144314) (not e!178740))))

(assert (=> b!281198 (= res!144314 (validKeyInArray!0 k0!2581))))

(declare-fun res!144313 () Bool)

(assert (=> start!27188 (=> (not res!144313) (not e!178740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27188 (= res!144313 (validMask!0 mask!3868))))

(assert (=> start!27188 e!178740))

(declare-fun array_inv!4611 (array!13995) Bool)

(assert (=> start!27188 (array_inv!4611 a!3325)))

(assert (=> start!27188 true))

(declare-fun b!281190 () Bool)

(assert (=> b!281190 (= e!178740 e!178738)))

(declare-fun res!144316 () Bool)

(assert (=> b!281190 (=> (not res!144316) (not e!178738))))

(declare-datatypes ((SeekEntryResult!1796 0))(
  ( (MissingZero!1796 (index!9354 (_ BitVec 32))) (Found!1796 (index!9355 (_ BitVec 32))) (Intermediate!1796 (undefined!2608 Bool) (index!9356 (_ BitVec 32)) (x!27601 (_ BitVec 32))) (Undefined!1796) (MissingVacant!1796 (index!9357 (_ BitVec 32))) )
))
(declare-fun lt!138845 () SeekEntryResult!1796)

(assert (=> b!281190 (= res!144316 (or (= lt!138845 (MissingZero!1796 i!1267)) (= lt!138845 (MissingVacant!1796 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13995 (_ BitVec 32)) SeekEntryResult!1796)

(assert (=> b!281190 (= lt!138845 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!27188 res!144313) b!281191))

(assert (= (and b!281191 res!144312) b!281198))

(assert (= (and b!281198 res!144314) b!281195))

(assert (= (and b!281195 res!144319) b!281194))

(assert (= (and b!281194 res!144317) b!281190))

(assert (= (and b!281190 res!144316) b!281196))

(assert (= (and b!281196 res!144315) b!281192))

(assert (= (and b!281192 res!144318) b!281193))

(assert (= (and b!281193 res!144311) b!281197))

(declare-fun m!295079 () Bool)

(assert (=> b!281196 m!295079))

(declare-fun m!295081 () Bool)

(assert (=> b!281195 m!295081))

(declare-fun m!295083 () Bool)

(assert (=> b!281198 m!295083))

(declare-fun m!295085 () Bool)

(assert (=> b!281194 m!295085))

(declare-fun m!295087 () Bool)

(assert (=> start!27188 m!295087))

(declare-fun m!295089 () Bool)

(assert (=> start!27188 m!295089))

(declare-fun m!295091 () Bool)

(assert (=> b!281190 m!295091))

(declare-fun m!295093 () Bool)

(assert (=> b!281193 m!295093))

(assert (=> b!281193 m!295093))

(declare-fun m!295095 () Bool)

(assert (=> b!281193 m!295095))

(declare-fun m!295097 () Bool)

(assert (=> b!281197 m!295097))

(declare-fun m!295099 () Bool)

(assert (=> b!281197 m!295099))

(declare-fun m!295101 () Bool)

(assert (=> b!281197 m!295101))

(check-sat (not b!281190) (not b!281195) (not b!281193) (not b!281196) (not b!281197) (not start!27188) (not b!281194) (not b!281198))
(check-sat)
