; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27186 () Bool)

(assert start!27186)

(declare-fun b!281384 () Bool)

(declare-fun res!144428 () Bool)

(declare-fun e!178865 () Bool)

(assert (=> b!281384 (=> (not res!144428) (not e!178865))))

(declare-datatypes ((array!14003 0))(
  ( (array!14004 (arr!6643 (Array (_ BitVec 32) (_ BitVec 64))) (size!6995 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14003)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281384 (= res!144428 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281385 () Bool)

(declare-fun e!178863 () Bool)

(assert (=> b!281385 (= e!178863 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((List!4364 0))(
  ( (Nil!4361) (Cons!4360 (h!5030 (_ BitVec 64)) (t!9438 List!4364)) )
))
(declare-fun arrayNoDuplicates!0 (array!14003 (_ BitVec 32) List!4364) Bool)

(assert (=> b!281385 (arrayNoDuplicates!0 (array!14004 (store (arr!6643 a!3325) i!1267 k0!2581) (size!6995 a!3325)) #b00000000000000000000000000000000 Nil!4361)))

(declare-datatypes ((Unit!8862 0))(
  ( (Unit!8863) )
))
(declare-fun lt!139085 () Unit!8862)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14003 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4364) Unit!8862)

(assert (=> b!281385 (= lt!139085 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4361))))

(declare-fun b!281386 () Bool)

(declare-fun res!144429 () Bool)

(assert (=> b!281386 (=> (not res!144429) (not e!178863))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14003 (_ BitVec 32)) Bool)

(assert (=> b!281386 (= res!144429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281387 () Bool)

(assert (=> b!281387 (= e!178865 e!178863)))

(declare-fun res!144434 () Bool)

(assert (=> b!281387 (=> (not res!144434) (not e!178863))))

(declare-datatypes ((SeekEntryResult!1766 0))(
  ( (MissingZero!1766 (index!9234 (_ BitVec 32))) (Found!1766 (index!9235 (_ BitVec 32))) (Intermediate!1766 (undefined!2578 Bool) (index!9236 (_ BitVec 32)) (x!27572 (_ BitVec 32))) (Undefined!1766) (MissingVacant!1766 (index!9237 (_ BitVec 32))) )
))
(declare-fun lt!139086 () SeekEntryResult!1766)

(assert (=> b!281387 (= res!144434 (or (= lt!139086 (MissingZero!1766 i!1267)) (= lt!139086 (MissingVacant!1766 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14003 (_ BitVec 32)) SeekEntryResult!1766)

(assert (=> b!281387 (= lt!139086 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!144433 () Bool)

(assert (=> start!27186 (=> (not res!144433) (not e!178865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27186 (= res!144433 (validMask!0 mask!3868))))

(assert (=> start!27186 e!178865))

(declare-fun array_inv!4593 (array!14003) Bool)

(assert (=> start!27186 (array_inv!4593 a!3325)))

(assert (=> start!27186 true))

(declare-fun b!281388 () Bool)

(declare-fun res!144427 () Bool)

(assert (=> b!281388 (=> (not res!144427) (not e!178863))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281388 (= res!144427 (validKeyInArray!0 (select (arr!6643 a!3325) startIndex!26)))))

(declare-fun b!281389 () Bool)

(declare-fun res!144435 () Bool)

(assert (=> b!281389 (=> (not res!144435) (not e!178865))))

(assert (=> b!281389 (= res!144435 (and (= (size!6995 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6995 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6995 a!3325))))))

(declare-fun b!281390 () Bool)

(declare-fun res!144430 () Bool)

(assert (=> b!281390 (=> (not res!144430) (not e!178865))))

(assert (=> b!281390 (= res!144430 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4361))))

(declare-fun b!281391 () Bool)

(declare-fun res!144431 () Bool)

(assert (=> b!281391 (=> (not res!144431) (not e!178863))))

(assert (=> b!281391 (= res!144431 (not (= startIndex!26 i!1267)))))

(declare-fun b!281392 () Bool)

(declare-fun res!144432 () Bool)

(assert (=> b!281392 (=> (not res!144432) (not e!178865))))

(assert (=> b!281392 (= res!144432 (validKeyInArray!0 k0!2581))))

(assert (= (and start!27186 res!144433) b!281389))

(assert (= (and b!281389 res!144435) b!281392))

(assert (= (and b!281392 res!144432) b!281390))

(assert (= (and b!281390 res!144430) b!281384))

(assert (= (and b!281384 res!144428) b!281387))

(assert (= (and b!281387 res!144434) b!281386))

(assert (= (and b!281386 res!144429) b!281391))

(assert (= (and b!281391 res!144431) b!281388))

(assert (= (and b!281388 res!144427) b!281385))

(declare-fun m!295877 () Bool)

(assert (=> b!281392 m!295877))

(declare-fun m!295879 () Bool)

(assert (=> b!281384 m!295879))

(declare-fun m!295881 () Bool)

(assert (=> b!281386 m!295881))

(declare-fun m!295883 () Bool)

(assert (=> b!281390 m!295883))

(declare-fun m!295885 () Bool)

(assert (=> b!281385 m!295885))

(declare-fun m!295887 () Bool)

(assert (=> b!281385 m!295887))

(declare-fun m!295889 () Bool)

(assert (=> b!281385 m!295889))

(declare-fun m!295891 () Bool)

(assert (=> b!281388 m!295891))

(assert (=> b!281388 m!295891))

(declare-fun m!295893 () Bool)

(assert (=> b!281388 m!295893))

(declare-fun m!295895 () Bool)

(assert (=> b!281387 m!295895))

(declare-fun m!295897 () Bool)

(assert (=> start!27186 m!295897))

(declare-fun m!295899 () Bool)

(assert (=> start!27186 m!295899))

(check-sat (not b!281385) (not b!281387) (not start!27186) (not b!281390) (not b!281386) (not b!281388) (not b!281384) (not b!281392))
(check-sat)
