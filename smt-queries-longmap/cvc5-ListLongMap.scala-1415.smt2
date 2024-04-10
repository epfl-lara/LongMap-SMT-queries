; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27516 () Bool)

(assert start!27516)

(declare-fun b!284331 () Bool)

(declare-fun e!180390 () Bool)

(assert (=> b!284331 (= e!180390 false)))

(declare-fun lt!140484 () Bool)

(declare-datatypes ((array!14166 0))(
  ( (array!14167 (arr!6722 (Array (_ BitVec 32) (_ BitVec 64))) (size!7074 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14166)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14166 (_ BitVec 32)) Bool)

(assert (=> b!284331 (= lt!140484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284332 () Bool)

(declare-fun res!146841 () Bool)

(declare-fun e!180392 () Bool)

(assert (=> b!284332 (=> (not res!146841) (not e!180392))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14166 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284332 (= res!146841 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284333 () Bool)

(declare-fun res!146842 () Bool)

(assert (=> b!284333 (=> (not res!146842) (not e!180392))))

(declare-datatypes ((List!4530 0))(
  ( (Nil!4527) (Cons!4526 (h!5199 (_ BitVec 64)) (t!9612 List!4530)) )
))
(declare-fun arrayNoDuplicates!0 (array!14166 (_ BitVec 32) List!4530) Bool)

(assert (=> b!284333 (= res!146842 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4527))))

(declare-fun res!146843 () Bool)

(assert (=> start!27516 (=> (not res!146843) (not e!180392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27516 (= res!146843 (validMask!0 mask!3868))))

(assert (=> start!27516 e!180392))

(declare-fun array_inv!4685 (array!14166) Bool)

(assert (=> start!27516 (array_inv!4685 a!3325)))

(assert (=> start!27516 true))

(declare-fun b!284334 () Bool)

(declare-fun res!146839 () Bool)

(assert (=> b!284334 (=> (not res!146839) (not e!180392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284334 (= res!146839 (validKeyInArray!0 k!2581))))

(declare-fun b!284335 () Bool)

(declare-fun res!146844 () Bool)

(assert (=> b!284335 (=> (not res!146844) (not e!180392))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284335 (= res!146844 (and (= (size!7074 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7074 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7074 a!3325))))))

(declare-fun b!284336 () Bool)

(assert (=> b!284336 (= e!180392 e!180390)))

(declare-fun res!146840 () Bool)

(assert (=> b!284336 (=> (not res!146840) (not e!180390))))

(declare-datatypes ((SeekEntryResult!1880 0))(
  ( (MissingZero!1880 (index!9690 (_ BitVec 32))) (Found!1880 (index!9691 (_ BitVec 32))) (Intermediate!1880 (undefined!2692 Bool) (index!9692 (_ BitVec 32)) (x!27903 (_ BitVec 32))) (Undefined!1880) (MissingVacant!1880 (index!9693 (_ BitVec 32))) )
))
(declare-fun lt!140485 () SeekEntryResult!1880)

(assert (=> b!284336 (= res!146840 (or (= lt!140485 (MissingZero!1880 i!1267)) (= lt!140485 (MissingVacant!1880 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14166 (_ BitVec 32)) SeekEntryResult!1880)

(assert (=> b!284336 (= lt!140485 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!27516 res!146843) b!284335))

(assert (= (and b!284335 res!146844) b!284334))

(assert (= (and b!284334 res!146839) b!284333))

(assert (= (and b!284333 res!146842) b!284332))

(assert (= (and b!284332 res!146841) b!284336))

(assert (= (and b!284336 res!146840) b!284331))

(declare-fun m!299379 () Bool)

(assert (=> start!27516 m!299379))

(declare-fun m!299381 () Bool)

(assert (=> start!27516 m!299381))

(declare-fun m!299383 () Bool)

(assert (=> b!284334 m!299383))

(declare-fun m!299385 () Bool)

(assert (=> b!284333 m!299385))

(declare-fun m!299387 () Bool)

(assert (=> b!284332 m!299387))

(declare-fun m!299389 () Bool)

(assert (=> b!284331 m!299389))

(declare-fun m!299391 () Bool)

(assert (=> b!284336 m!299391))

(push 1)

