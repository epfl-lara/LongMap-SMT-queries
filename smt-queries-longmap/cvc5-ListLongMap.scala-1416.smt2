; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27522 () Bool)

(assert start!27522)

(declare-fun b!284385 () Bool)

(declare-fun res!146895 () Bool)

(declare-fun e!180419 () Bool)

(assert (=> b!284385 (=> (not res!146895) (not e!180419))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284385 (= res!146895 (validKeyInArray!0 k!2581))))

(declare-fun b!284386 () Bool)

(declare-fun e!180417 () Bool)

(assert (=> b!284386 (= e!180419 e!180417)))

(declare-fun res!146894 () Bool)

(assert (=> b!284386 (=> (not res!146894) (not e!180417))))

(declare-datatypes ((SeekEntryResult!1883 0))(
  ( (MissingZero!1883 (index!9702 (_ BitVec 32))) (Found!1883 (index!9703 (_ BitVec 32))) (Intermediate!1883 (undefined!2695 Bool) (index!9704 (_ BitVec 32)) (x!27914 (_ BitVec 32))) (Undefined!1883) (MissingVacant!1883 (index!9705 (_ BitVec 32))) )
))
(declare-fun lt!140503 () SeekEntryResult!1883)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284386 (= res!146894 (or (= lt!140503 (MissingZero!1883 i!1267)) (= lt!140503 (MissingVacant!1883 i!1267))))))

(declare-datatypes ((array!14172 0))(
  ( (array!14173 (arr!6725 (Array (_ BitVec 32) (_ BitVec 64))) (size!7077 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14172)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14172 (_ BitVec 32)) SeekEntryResult!1883)

(assert (=> b!284386 (= lt!140503 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284387 () Bool)

(declare-fun res!146896 () Bool)

(assert (=> b!284387 (=> (not res!146896) (not e!180419))))

(declare-fun arrayContainsKey!0 (array!14172 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284387 (= res!146896 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!146893 () Bool)

(assert (=> start!27522 (=> (not res!146893) (not e!180419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27522 (= res!146893 (validMask!0 mask!3868))))

(assert (=> start!27522 e!180419))

(declare-fun array_inv!4688 (array!14172) Bool)

(assert (=> start!27522 (array_inv!4688 a!3325)))

(assert (=> start!27522 true))

(declare-fun b!284388 () Bool)

(declare-fun res!146897 () Bool)

(assert (=> b!284388 (=> (not res!146897) (not e!180419))))

(declare-datatypes ((List!4533 0))(
  ( (Nil!4530) (Cons!4529 (h!5202 (_ BitVec 64)) (t!9615 List!4533)) )
))
(declare-fun arrayNoDuplicates!0 (array!14172 (_ BitVec 32) List!4533) Bool)

(assert (=> b!284388 (= res!146897 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4530))))

(declare-fun b!284389 () Bool)

(declare-fun res!146898 () Bool)

(assert (=> b!284389 (=> (not res!146898) (not e!180419))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284389 (= res!146898 (and (= (size!7077 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7077 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7077 a!3325))))))

(declare-fun b!284390 () Bool)

(assert (=> b!284390 (= e!180417 false)))

(declare-fun lt!140502 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14172 (_ BitVec 32)) Bool)

(assert (=> b!284390 (= lt!140502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27522 res!146893) b!284389))

(assert (= (and b!284389 res!146898) b!284385))

(assert (= (and b!284385 res!146895) b!284388))

(assert (= (and b!284388 res!146897) b!284387))

(assert (= (and b!284387 res!146896) b!284386))

(assert (= (and b!284386 res!146894) b!284390))

(declare-fun m!299421 () Bool)

(assert (=> start!27522 m!299421))

(declare-fun m!299423 () Bool)

(assert (=> start!27522 m!299423))

(declare-fun m!299425 () Bool)

(assert (=> b!284385 m!299425))

(declare-fun m!299427 () Bool)

(assert (=> b!284386 m!299427))

(declare-fun m!299429 () Bool)

(assert (=> b!284390 m!299429))

(declare-fun m!299431 () Bool)

(assert (=> b!284387 m!299431))

(declare-fun m!299433 () Bool)

(assert (=> b!284388 m!299433))

(push 1)

