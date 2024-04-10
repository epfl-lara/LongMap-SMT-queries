; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27512 () Bool)

(assert start!27512)

(declare-fun b!284295 () Bool)

(declare-fun e!180374 () Bool)

(assert (=> b!284295 (= e!180374 false)))

(declare-fun lt!140473 () Bool)

(declare-datatypes ((array!14162 0))(
  ( (array!14163 (arr!6720 (Array (_ BitVec 32) (_ BitVec 64))) (size!7072 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14162)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14162 (_ BitVec 32)) Bool)

(assert (=> b!284295 (= lt!140473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284296 () Bool)

(declare-fun res!146806 () Bool)

(declare-fun e!180372 () Bool)

(assert (=> b!284296 (=> (not res!146806) (not e!180372))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284296 (= res!146806 (and (= (size!7072 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7072 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7072 a!3325))))))

(declare-fun res!146803 () Bool)

(assert (=> start!27512 (=> (not res!146803) (not e!180372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27512 (= res!146803 (validMask!0 mask!3868))))

(assert (=> start!27512 e!180372))

(declare-fun array_inv!4683 (array!14162) Bool)

(assert (=> start!27512 (array_inv!4683 a!3325)))

(assert (=> start!27512 true))

(declare-fun b!284297 () Bool)

(assert (=> b!284297 (= e!180372 e!180374)))

(declare-fun res!146807 () Bool)

(assert (=> b!284297 (=> (not res!146807) (not e!180374))))

(declare-datatypes ((SeekEntryResult!1878 0))(
  ( (MissingZero!1878 (index!9682 (_ BitVec 32))) (Found!1878 (index!9683 (_ BitVec 32))) (Intermediate!1878 (undefined!2690 Bool) (index!9684 (_ BitVec 32)) (x!27893 (_ BitVec 32))) (Undefined!1878) (MissingVacant!1878 (index!9685 (_ BitVec 32))) )
))
(declare-fun lt!140472 () SeekEntryResult!1878)

(assert (=> b!284297 (= res!146807 (or (= lt!140472 (MissingZero!1878 i!1267)) (= lt!140472 (MissingVacant!1878 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14162 (_ BitVec 32)) SeekEntryResult!1878)

(assert (=> b!284297 (= lt!140472 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284298 () Bool)

(declare-fun res!146805 () Bool)

(assert (=> b!284298 (=> (not res!146805) (not e!180372))))

(declare-datatypes ((List!4528 0))(
  ( (Nil!4525) (Cons!4524 (h!5197 (_ BitVec 64)) (t!9610 List!4528)) )
))
(declare-fun arrayNoDuplicates!0 (array!14162 (_ BitVec 32) List!4528) Bool)

(assert (=> b!284298 (= res!146805 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4525))))

(declare-fun b!284299 () Bool)

(declare-fun res!146808 () Bool)

(assert (=> b!284299 (=> (not res!146808) (not e!180372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284299 (= res!146808 (validKeyInArray!0 k0!2581))))

(declare-fun b!284300 () Bool)

(declare-fun res!146804 () Bool)

(assert (=> b!284300 (=> (not res!146804) (not e!180372))))

(declare-fun arrayContainsKey!0 (array!14162 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284300 (= res!146804 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27512 res!146803) b!284296))

(assert (= (and b!284296 res!146806) b!284299))

(assert (= (and b!284299 res!146808) b!284298))

(assert (= (and b!284298 res!146805) b!284300))

(assert (= (and b!284300 res!146804) b!284297))

(assert (= (and b!284297 res!146807) b!284295))

(declare-fun m!299351 () Bool)

(assert (=> b!284299 m!299351))

(declare-fun m!299353 () Bool)

(assert (=> start!27512 m!299353))

(declare-fun m!299355 () Bool)

(assert (=> start!27512 m!299355))

(declare-fun m!299357 () Bool)

(assert (=> b!284300 m!299357))

(declare-fun m!299359 () Bool)

(assert (=> b!284298 m!299359))

(declare-fun m!299361 () Bool)

(assert (=> b!284297 m!299361))

(declare-fun m!299363 () Bool)

(assert (=> b!284295 m!299363))

(check-sat (not b!284300) (not start!27512) (not b!284295) (not b!284299) (not b!284298) (not b!284297))
(check-sat)
