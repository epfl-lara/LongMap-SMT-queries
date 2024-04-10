; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27518 () Bool)

(assert start!27518)

(declare-fun b!284349 () Bool)

(declare-fun res!146859 () Bool)

(declare-fun e!180400 () Bool)

(assert (=> b!284349 (=> (not res!146859) (not e!180400))))

(declare-datatypes ((array!14168 0))(
  ( (array!14169 (arr!6723 (Array (_ BitVec 32) (_ BitVec 64))) (size!7075 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14168)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!284349 (= res!146859 (and (= (size!7075 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7075 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7075 a!3325))))))

(declare-fun b!284350 () Bool)

(declare-fun res!146858 () Bool)

(assert (=> b!284350 (=> (not res!146858) (not e!180400))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284350 (= res!146858 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284352 () Bool)

(declare-fun e!180399 () Bool)

(assert (=> b!284352 (= e!180399 false)))

(declare-fun lt!140490 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14168 (_ BitVec 32)) Bool)

(assert (=> b!284352 (= lt!140490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284353 () Bool)

(declare-fun res!146860 () Bool)

(assert (=> b!284353 (=> (not res!146860) (not e!180400))))

(declare-datatypes ((List!4531 0))(
  ( (Nil!4528) (Cons!4527 (h!5200 (_ BitVec 64)) (t!9613 List!4531)) )
))
(declare-fun arrayNoDuplicates!0 (array!14168 (_ BitVec 32) List!4531) Bool)

(assert (=> b!284353 (= res!146860 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4528))))

(declare-fun b!284354 () Bool)

(declare-fun res!146861 () Bool)

(assert (=> b!284354 (=> (not res!146861) (not e!180400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284354 (= res!146861 (validKeyInArray!0 k0!2581))))

(declare-fun b!284351 () Bool)

(assert (=> b!284351 (= e!180400 e!180399)))

(declare-fun res!146857 () Bool)

(assert (=> b!284351 (=> (not res!146857) (not e!180399))))

(declare-datatypes ((SeekEntryResult!1881 0))(
  ( (MissingZero!1881 (index!9694 (_ BitVec 32))) (Found!1881 (index!9695 (_ BitVec 32))) (Intermediate!1881 (undefined!2693 Bool) (index!9696 (_ BitVec 32)) (x!27904 (_ BitVec 32))) (Undefined!1881) (MissingVacant!1881 (index!9697 (_ BitVec 32))) )
))
(declare-fun lt!140491 () SeekEntryResult!1881)

(assert (=> b!284351 (= res!146857 (or (= lt!140491 (MissingZero!1881 i!1267)) (= lt!140491 (MissingVacant!1881 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14168 (_ BitVec 32)) SeekEntryResult!1881)

(assert (=> b!284351 (= lt!140491 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!146862 () Bool)

(assert (=> start!27518 (=> (not res!146862) (not e!180400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27518 (= res!146862 (validMask!0 mask!3868))))

(assert (=> start!27518 e!180400))

(declare-fun array_inv!4686 (array!14168) Bool)

(assert (=> start!27518 (array_inv!4686 a!3325)))

(assert (=> start!27518 true))

(assert (= (and start!27518 res!146862) b!284349))

(assert (= (and b!284349 res!146859) b!284354))

(assert (= (and b!284354 res!146861) b!284353))

(assert (= (and b!284353 res!146860) b!284350))

(assert (= (and b!284350 res!146858) b!284351))

(assert (= (and b!284351 res!146857) b!284352))

(declare-fun m!299393 () Bool)

(assert (=> b!284354 m!299393))

(declare-fun m!299395 () Bool)

(assert (=> b!284351 m!299395))

(declare-fun m!299397 () Bool)

(assert (=> b!284352 m!299397))

(declare-fun m!299399 () Bool)

(assert (=> b!284353 m!299399))

(declare-fun m!299401 () Bool)

(assert (=> b!284350 m!299401))

(declare-fun m!299403 () Bool)

(assert (=> start!27518 m!299403))

(declare-fun m!299405 () Bool)

(assert (=> start!27518 m!299405))

(check-sat (not b!284354) (not start!27518) (not b!284351) (not b!284352) (not b!284350) (not b!284353))
(check-sat)
