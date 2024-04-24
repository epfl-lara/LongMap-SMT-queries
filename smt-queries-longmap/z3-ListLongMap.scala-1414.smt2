; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27510 () Bool)

(assert start!27510)

(declare-fun b!284324 () Bool)

(declare-fun res!146810 () Bool)

(declare-fun e!180387 () Bool)

(assert (=> b!284324 (=> (not res!146810) (not e!180387))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284324 (= res!146810 (validKeyInArray!0 k0!2581))))

(declare-fun b!284325 () Bool)

(declare-fun e!180389 () Bool)

(assert (=> b!284325 (= e!180389 false)))

(declare-fun lt!140525 () Bool)

(declare-datatypes ((array!14159 0))(
  ( (array!14160 (arr!6718 (Array (_ BitVec 32) (_ BitVec 64))) (size!7070 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14159)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14159 (_ BitVec 32)) Bool)

(assert (=> b!284325 (= lt!140525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284326 () Bool)

(assert (=> b!284326 (= e!180387 e!180389)))

(declare-fun res!146808 () Bool)

(assert (=> b!284326 (=> (not res!146808) (not e!180389))))

(declare-datatypes ((SeekEntryResult!1841 0))(
  ( (MissingZero!1841 (index!9534 (_ BitVec 32))) (Found!1841 (index!9535 (_ BitVec 32))) (Intermediate!1841 (undefined!2653 Bool) (index!9536 (_ BitVec 32)) (x!27856 (_ BitVec 32))) (Undefined!1841) (MissingVacant!1841 (index!9537 (_ BitVec 32))) )
))
(declare-fun lt!140526 () SeekEntryResult!1841)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284326 (= res!146808 (or (= lt!140526 (MissingZero!1841 i!1267)) (= lt!140526 (MissingVacant!1841 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14159 (_ BitVec 32)) SeekEntryResult!1841)

(assert (=> b!284326 (= lt!140526 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284327 () Bool)

(declare-fun res!146806 () Bool)

(assert (=> b!284327 (=> (not res!146806) (not e!180387))))

(declare-fun arrayContainsKey!0 (array!14159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284327 (= res!146806 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284329 () Bool)

(declare-fun res!146807 () Bool)

(assert (=> b!284329 (=> (not res!146807) (not e!180387))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284329 (= res!146807 (and (= (size!7070 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7070 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7070 a!3325))))))

(declare-fun b!284328 () Bool)

(declare-fun res!146809 () Bool)

(assert (=> b!284328 (=> (not res!146809) (not e!180387))))

(declare-datatypes ((List!4439 0))(
  ( (Nil!4436) (Cons!4435 (h!5108 (_ BitVec 64)) (t!9513 List!4439)) )
))
(declare-fun arrayNoDuplicates!0 (array!14159 (_ BitVec 32) List!4439) Bool)

(assert (=> b!284328 (= res!146809 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4436))))

(declare-fun res!146811 () Bool)

(assert (=> start!27510 (=> (not res!146811) (not e!180387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27510 (= res!146811 (validMask!0 mask!3868))))

(assert (=> start!27510 e!180387))

(declare-fun array_inv!4668 (array!14159) Bool)

(assert (=> start!27510 (array_inv!4668 a!3325)))

(assert (=> start!27510 true))

(assert (= (and start!27510 res!146811) b!284329))

(assert (= (and b!284329 res!146807) b!284324))

(assert (= (and b!284324 res!146810) b!284328))

(assert (= (and b!284328 res!146809) b!284327))

(assert (= (and b!284327 res!146806) b!284326))

(assert (= (and b!284326 res!146808) b!284325))

(declare-fun m!299543 () Bool)

(assert (=> b!284325 m!299543))

(declare-fun m!299545 () Bool)

(assert (=> start!27510 m!299545))

(declare-fun m!299547 () Bool)

(assert (=> start!27510 m!299547))

(declare-fun m!299549 () Bool)

(assert (=> b!284328 m!299549))

(declare-fun m!299551 () Bool)

(assert (=> b!284324 m!299551))

(declare-fun m!299553 () Bool)

(assert (=> b!284327 m!299553))

(declare-fun m!299555 () Bool)

(assert (=> b!284326 m!299555))

(check-sat (not b!284326) (not start!27510) (not b!284325) (not b!284324) (not b!284327) (not b!284328))
(check-sat)
