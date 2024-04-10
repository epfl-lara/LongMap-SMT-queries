; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27224 () Bool)

(assert start!27224)

(declare-fun b!281851 () Bool)

(declare-fun e!179052 () Bool)

(declare-fun e!179051 () Bool)

(assert (=> b!281851 (= e!179052 e!179051)))

(declare-fun res!144920 () Bool)

(assert (=> b!281851 (=> (not res!144920) (not e!179051))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281851 (= res!144920 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!14042 0))(
  ( (array!14043 (arr!6663 (Array (_ BitVec 32) (_ BitVec 64))) (size!7015 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14042)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!139223 () array!14042)

(assert (=> b!281851 (= lt!139223 (array!14043 (store (arr!6663 a!3325) i!1267 k0!2581) (size!7015 a!3325)))))

(declare-fun b!281852 () Bool)

(declare-fun res!144926 () Bool)

(assert (=> b!281852 (=> (not res!144926) (not e!179052))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14042 (_ BitVec 32)) Bool)

(assert (=> b!281852 (= res!144926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281853 () Bool)

(declare-fun res!144919 () Bool)

(declare-fun e!179054 () Bool)

(assert (=> b!281853 (=> (not res!144919) (not e!179054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281853 (= res!144919 (validKeyInArray!0 k0!2581))))

(declare-fun b!281854 () Bool)

(declare-fun res!144925 () Bool)

(assert (=> b!281854 (=> (not res!144925) (not e!179054))))

(assert (=> b!281854 (= res!144925 (and (= (size!7015 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7015 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7015 a!3325))))))

(declare-fun b!281855 () Bool)

(declare-fun res!144922 () Bool)

(assert (=> b!281855 (=> (not res!144922) (not e!179054))))

(declare-fun arrayContainsKey!0 (array!14042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281855 (= res!144922 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281856 () Bool)

(assert (=> b!281856 (= e!179054 e!179052)))

(declare-fun res!144927 () Bool)

(assert (=> b!281856 (=> (not res!144927) (not e!179052))))

(declare-datatypes ((SeekEntryResult!1821 0))(
  ( (MissingZero!1821 (index!9454 (_ BitVec 32))) (Found!1821 (index!9455 (_ BitVec 32))) (Intermediate!1821 (undefined!2633 Bool) (index!9456 (_ BitVec 32)) (x!27675 (_ BitVec 32))) (Undefined!1821) (MissingVacant!1821 (index!9457 (_ BitVec 32))) )
))
(declare-fun lt!139225 () SeekEntryResult!1821)

(assert (=> b!281856 (= res!144927 (or (= lt!139225 (MissingZero!1821 i!1267)) (= lt!139225 (MissingVacant!1821 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14042 (_ BitVec 32)) SeekEntryResult!1821)

(assert (=> b!281856 (= lt!139225 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281850 () Bool)

(declare-fun res!144923 () Bool)

(assert (=> b!281850 (=> (not res!144923) (not e!179051))))

(assert (=> b!281850 (= res!144923 (validKeyInArray!0 (select (arr!6663 a!3325) startIndex!26)))))

(declare-fun res!144921 () Bool)

(assert (=> start!27224 (=> (not res!144921) (not e!179054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27224 (= res!144921 (validMask!0 mask!3868))))

(assert (=> start!27224 e!179054))

(declare-fun array_inv!4626 (array!14042) Bool)

(assert (=> start!27224 (array_inv!4626 a!3325)))

(assert (=> start!27224 true))

(declare-fun b!281857 () Bool)

(assert (=> b!281857 (= e!179051 (not true))))

(assert (=> b!281857 (= (seekEntryOrOpen!0 (select (arr!6663 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6663 a!3325) i!1267 k0!2581) startIndex!26) lt!139223 mask!3868))))

(declare-datatypes ((Unit!8926 0))(
  ( (Unit!8927) )
))
(declare-fun lt!139222 () Unit!8926)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14042 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8926)

(assert (=> b!281857 (= lt!139222 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4471 0))(
  ( (Nil!4468) (Cons!4467 (h!5137 (_ BitVec 64)) (t!9553 List!4471)) )
))
(declare-fun arrayNoDuplicates!0 (array!14042 (_ BitVec 32) List!4471) Bool)

(assert (=> b!281857 (arrayNoDuplicates!0 lt!139223 #b00000000000000000000000000000000 Nil!4468)))

(declare-fun lt!139224 () Unit!8926)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14042 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4471) Unit!8926)

(assert (=> b!281857 (= lt!139224 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4468))))

(declare-fun b!281858 () Bool)

(declare-fun res!144924 () Bool)

(assert (=> b!281858 (=> (not res!144924) (not e!179054))))

(assert (=> b!281858 (= res!144924 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4468))))

(assert (= (and start!27224 res!144921) b!281854))

(assert (= (and b!281854 res!144925) b!281853))

(assert (= (and b!281853 res!144919) b!281858))

(assert (= (and b!281858 res!144924) b!281855))

(assert (= (and b!281855 res!144922) b!281856))

(assert (= (and b!281856 res!144927) b!281852))

(assert (= (and b!281852 res!144926) b!281851))

(assert (= (and b!281851 res!144920) b!281850))

(assert (= (and b!281850 res!144923) b!281857))

(declare-fun m!296231 () Bool)

(assert (=> b!281858 m!296231))

(declare-fun m!296233 () Bool)

(assert (=> b!281856 m!296233))

(declare-fun m!296235 () Bool)

(assert (=> b!281851 m!296235))

(declare-fun m!296237 () Bool)

(assert (=> b!281852 m!296237))

(declare-fun m!296239 () Bool)

(assert (=> b!281857 m!296239))

(declare-fun m!296241 () Bool)

(assert (=> b!281857 m!296241))

(assert (=> b!281857 m!296235))

(declare-fun m!296243 () Bool)

(assert (=> b!281857 m!296243))

(declare-fun m!296245 () Bool)

(assert (=> b!281857 m!296245))

(assert (=> b!281857 m!296243))

(declare-fun m!296247 () Bool)

(assert (=> b!281857 m!296247))

(assert (=> b!281857 m!296241))

(declare-fun m!296249 () Bool)

(assert (=> b!281857 m!296249))

(declare-fun m!296251 () Bool)

(assert (=> b!281857 m!296251))

(declare-fun m!296253 () Bool)

(assert (=> b!281853 m!296253))

(declare-fun m!296255 () Bool)

(assert (=> start!27224 m!296255))

(declare-fun m!296257 () Bool)

(assert (=> start!27224 m!296257))

(assert (=> b!281850 m!296243))

(assert (=> b!281850 m!296243))

(declare-fun m!296259 () Bool)

(assert (=> b!281850 m!296259))

(declare-fun m!296261 () Bool)

(assert (=> b!281855 m!296261))

(check-sat (not b!281856) (not b!281855) (not b!281853) (not b!281857) (not start!27224) (not b!281858) (not b!281852) (not b!281850))
(check-sat)
