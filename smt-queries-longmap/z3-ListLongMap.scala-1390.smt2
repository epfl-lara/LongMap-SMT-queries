; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27192 () Bool)

(assert start!27192)

(declare-fun b!281465 () Bool)

(declare-fun res!144516 () Bool)

(declare-fun e!178890 () Bool)

(assert (=> b!281465 (=> (not res!144516) (not e!178890))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281465 (= res!144516 (validKeyInArray!0 k0!2581))))

(declare-fun res!144509 () Bool)

(assert (=> start!27192 (=> (not res!144509) (not e!178890))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27192 (= res!144509 (validMask!0 mask!3868))))

(assert (=> start!27192 e!178890))

(declare-datatypes ((array!14009 0))(
  ( (array!14010 (arr!6646 (Array (_ BitVec 32) (_ BitVec 64))) (size!6998 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14009)

(declare-fun array_inv!4596 (array!14009) Bool)

(assert (=> start!27192 (array_inv!4596 a!3325)))

(assert (=> start!27192 true))

(declare-fun b!281466 () Bool)

(declare-fun res!144514 () Bool)

(declare-fun e!178892 () Bool)

(assert (=> b!281466 (=> (not res!144514) (not e!178892))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!281466 (= res!144514 (validKeyInArray!0 (select (arr!6646 a!3325) startIndex!26)))))

(declare-fun b!281467 () Bool)

(declare-fun res!144511 () Bool)

(assert (=> b!281467 (=> (not res!144511) (not e!178890))))

(declare-datatypes ((List!4367 0))(
  ( (Nil!4364) (Cons!4363 (h!5033 (_ BitVec 64)) (t!9441 List!4367)) )
))
(declare-fun arrayNoDuplicates!0 (array!14009 (_ BitVec 32) List!4367) Bool)

(assert (=> b!281467 (= res!144511 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4364))))

(declare-fun b!281468 () Bool)

(declare-fun res!144513 () Bool)

(assert (=> b!281468 (=> (not res!144513) (not e!178892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14009 (_ BitVec 32)) Bool)

(assert (=> b!281468 (= res!144513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281469 () Bool)

(declare-fun res!144515 () Bool)

(assert (=> b!281469 (=> (not res!144515) (not e!178890))))

(declare-fun arrayContainsKey!0 (array!14009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281469 (= res!144515 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281470 () Bool)

(assert (=> b!281470 (= e!178892 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281470 (arrayNoDuplicates!0 (array!14010 (store (arr!6646 a!3325) i!1267 k0!2581) (size!6998 a!3325)) #b00000000000000000000000000000000 Nil!4364)))

(declare-datatypes ((Unit!8868 0))(
  ( (Unit!8869) )
))
(declare-fun lt!139103 () Unit!8868)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14009 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4367) Unit!8868)

(assert (=> b!281470 (= lt!139103 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4364))))

(declare-fun b!281471 () Bool)

(declare-fun res!144508 () Bool)

(assert (=> b!281471 (=> (not res!144508) (not e!178890))))

(assert (=> b!281471 (= res!144508 (and (= (size!6998 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6998 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6998 a!3325))))))

(declare-fun b!281472 () Bool)

(assert (=> b!281472 (= e!178890 e!178892)))

(declare-fun res!144512 () Bool)

(assert (=> b!281472 (=> (not res!144512) (not e!178892))))

(declare-datatypes ((SeekEntryResult!1769 0))(
  ( (MissingZero!1769 (index!9246 (_ BitVec 32))) (Found!1769 (index!9247 (_ BitVec 32))) (Intermediate!1769 (undefined!2581 Bool) (index!9248 (_ BitVec 32)) (x!27583 (_ BitVec 32))) (Undefined!1769) (MissingVacant!1769 (index!9249 (_ BitVec 32))) )
))
(declare-fun lt!139104 () SeekEntryResult!1769)

(assert (=> b!281472 (= res!144512 (or (= lt!139104 (MissingZero!1769 i!1267)) (= lt!139104 (MissingVacant!1769 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14009 (_ BitVec 32)) SeekEntryResult!1769)

(assert (=> b!281472 (= lt!139104 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281473 () Bool)

(declare-fun res!144510 () Bool)

(assert (=> b!281473 (=> (not res!144510) (not e!178892))))

(assert (=> b!281473 (= res!144510 (not (= startIndex!26 i!1267)))))

(assert (= (and start!27192 res!144509) b!281471))

(assert (= (and b!281471 res!144508) b!281465))

(assert (= (and b!281465 res!144516) b!281467))

(assert (= (and b!281467 res!144511) b!281469))

(assert (= (and b!281469 res!144515) b!281472))

(assert (= (and b!281472 res!144512) b!281468))

(assert (= (and b!281468 res!144513) b!281473))

(assert (= (and b!281473 res!144510) b!281466))

(assert (= (and b!281466 res!144514) b!281470))

(declare-fun m!295949 () Bool)

(assert (=> b!281472 m!295949))

(declare-fun m!295951 () Bool)

(assert (=> b!281467 m!295951))

(declare-fun m!295953 () Bool)

(assert (=> b!281470 m!295953))

(declare-fun m!295955 () Bool)

(assert (=> b!281470 m!295955))

(declare-fun m!295957 () Bool)

(assert (=> b!281470 m!295957))

(declare-fun m!295959 () Bool)

(assert (=> b!281465 m!295959))

(declare-fun m!295961 () Bool)

(assert (=> start!27192 m!295961))

(declare-fun m!295963 () Bool)

(assert (=> start!27192 m!295963))

(declare-fun m!295965 () Bool)

(assert (=> b!281469 m!295965))

(declare-fun m!295967 () Bool)

(assert (=> b!281468 m!295967))

(declare-fun m!295969 () Bool)

(assert (=> b!281466 m!295969))

(assert (=> b!281466 m!295969))

(declare-fun m!295971 () Bool)

(assert (=> b!281466 m!295971))

(check-sat (not b!281470) (not b!281472) (not b!281467) (not b!281469) (not b!281468) (not b!281465) (not b!281466) (not start!27192))
(check-sat)
