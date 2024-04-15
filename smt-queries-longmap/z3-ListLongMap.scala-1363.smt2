; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26738 () Bool)

(assert start!26738)

(declare-fun b!277571 () Bool)

(declare-fun e!177062 () Bool)

(declare-fun e!177064 () Bool)

(assert (=> b!277571 (= e!177062 e!177064)))

(declare-fun res!141472 () Bool)

(assert (=> b!277571 (=> (not res!141472) (not e!177064))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277571 (= res!141472 (= startIndex!26 i!1267))))

(declare-datatypes ((array!13824 0))(
  ( (array!13825 (arr!6561 (Array (_ BitVec 32) (_ BitVec 64))) (size!6914 (_ BitVec 32))) )
))
(declare-fun lt!137847 () array!13824)

(declare-fun a!3325 () array!13824)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!277571 (= lt!137847 (array!13825 (store (arr!6561 a!3325) i!1267 k0!2581) (size!6914 a!3325)))))

(declare-fun b!277572 () Bool)

(declare-datatypes ((Unit!8727 0))(
  ( (Unit!8728) )
))
(declare-fun e!177063 () Unit!8727)

(declare-fun Unit!8729 () Unit!8727)

(assert (=> b!277572 (= e!177063 Unit!8729)))

(declare-fun b!277573 () Bool)

(declare-fun res!141470 () Bool)

(assert (=> b!277573 (=> (not res!141470) (not e!177062))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13824 (_ BitVec 32)) Bool)

(assert (=> b!277573 (= res!141470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!141467 () Bool)

(declare-fun e!177065 () Bool)

(assert (=> start!26738 (=> (not res!141467) (not e!177065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26738 (= res!141467 (validMask!0 mask!3868))))

(assert (=> start!26738 e!177065))

(declare-fun array_inv!4533 (array!13824) Bool)

(assert (=> start!26738 (array_inv!4533 a!3325)))

(assert (=> start!26738 true))

(declare-fun b!277574 () Bool)

(declare-fun res!141471 () Bool)

(assert (=> b!277574 (=> (not res!141471) (not e!177065))))

(assert (=> b!277574 (= res!141471 (and (= (size!6914 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6914 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6914 a!3325))))))

(declare-fun b!277575 () Bool)

(assert (=> b!277575 (= e!177065 e!177062)))

(declare-fun res!141468 () Bool)

(assert (=> b!277575 (=> (not res!141468) (not e!177062))))

(declare-datatypes ((SeekEntryResult!1718 0))(
  ( (MissingZero!1718 (index!9042 (_ BitVec 32))) (Found!1718 (index!9043 (_ BitVec 32))) (Intermediate!1718 (undefined!2530 Bool) (index!9044 (_ BitVec 32)) (x!27306 (_ BitVec 32))) (Undefined!1718) (MissingVacant!1718 (index!9045 (_ BitVec 32))) )
))
(declare-fun lt!137844 () SeekEntryResult!1718)

(assert (=> b!277575 (= res!141468 (or (= lt!137844 (MissingZero!1718 i!1267)) (= lt!137844 (MissingVacant!1718 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13824 (_ BitVec 32)) SeekEntryResult!1718)

(assert (=> b!277575 (= lt!137844 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277576 () Bool)

(declare-fun res!141469 () Bool)

(assert (=> b!277576 (=> (not res!141469) (not e!177065))))

(declare-fun arrayContainsKey!0 (array!13824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277576 (= res!141469 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277577 () Bool)

(declare-fun lt!137843 () Unit!8727)

(assert (=> b!277577 (= e!177063 lt!137843)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13824 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8727)

(assert (=> b!277577 (= lt!137843 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277577 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!137847 mask!3868)))

(declare-fun b!277578 () Bool)

(declare-fun res!141465 () Bool)

(assert (=> b!277578 (=> (not res!141465) (not e!177065))))

(declare-datatypes ((List!4342 0))(
  ( (Nil!4339) (Cons!4338 (h!5005 (_ BitVec 64)) (t!9415 List!4342)) )
))
(declare-fun arrayNoDuplicates!0 (array!13824 (_ BitVec 32) List!4342) Bool)

(assert (=> b!277578 (= res!141465 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4339))))

(declare-fun b!277579 () Bool)

(assert (=> b!277579 (= e!177064 (not true))))

(assert (=> b!277579 (= (seekEntryOrOpen!0 k0!2581 lt!137847 mask!3868) (Found!1718 i!1267))))

(declare-fun lt!137846 () Unit!8727)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13824 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8727)

(assert (=> b!277579 (= lt!137846 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!137845 () Unit!8727)

(assert (=> b!277579 (= lt!137845 e!177063)))

(declare-fun c!45604 () Bool)

(assert (=> b!277579 (= c!45604 (bvslt startIndex!26 (bvsub (size!6914 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277580 () Bool)

(declare-fun res!141466 () Bool)

(assert (=> b!277580 (=> (not res!141466) (not e!177065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277580 (= res!141466 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26738 res!141467) b!277574))

(assert (= (and b!277574 res!141471) b!277580))

(assert (= (and b!277580 res!141466) b!277578))

(assert (= (and b!277578 res!141465) b!277576))

(assert (= (and b!277576 res!141469) b!277575))

(assert (= (and b!277575 res!141468) b!277573))

(assert (= (and b!277573 res!141470) b!277571))

(assert (= (and b!277571 res!141472) b!277579))

(assert (= (and b!277579 c!45604) b!277577))

(assert (= (and b!277579 (not c!45604)) b!277572))

(declare-fun m!292079 () Bool)

(assert (=> b!277577 m!292079))

(declare-fun m!292081 () Bool)

(assert (=> b!277577 m!292081))

(declare-fun m!292083 () Bool)

(assert (=> b!277575 m!292083))

(declare-fun m!292085 () Bool)

(assert (=> b!277576 m!292085))

(declare-fun m!292087 () Bool)

(assert (=> b!277571 m!292087))

(declare-fun m!292089 () Bool)

(assert (=> start!26738 m!292089))

(declare-fun m!292091 () Bool)

(assert (=> start!26738 m!292091))

(declare-fun m!292093 () Bool)

(assert (=> b!277580 m!292093))

(declare-fun m!292095 () Bool)

(assert (=> b!277578 m!292095))

(declare-fun m!292097 () Bool)

(assert (=> b!277573 m!292097))

(declare-fun m!292099 () Bool)

(assert (=> b!277579 m!292099))

(declare-fun m!292101 () Bool)

(assert (=> b!277579 m!292101))

(check-sat (not b!277573) (not start!26738) (not b!277578) (not b!277575) (not b!277577) (not b!277579) (not b!277576) (not b!277580))
(check-sat)
