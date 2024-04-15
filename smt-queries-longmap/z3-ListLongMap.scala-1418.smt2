; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27536 () Bool)

(assert start!27536)

(declare-fun b!284373 () Bool)

(declare-fun res!146936 () Bool)

(declare-fun e!180372 () Bool)

(assert (=> b!284373 (=> (not res!146936) (not e!180372))))

(declare-datatypes ((array!14175 0))(
  ( (array!14176 (arr!6726 (Array (_ BitVec 32) (_ BitVec 64))) (size!7079 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14175)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284373 (= res!146936 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284374 () Bool)

(declare-fun e!180370 () Bool)

(assert (=> b!284374 (= e!180370 false)))

(declare-fun lt!140349 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14175 (_ BitVec 32)) Bool)

(assert (=> b!284374 (= lt!140349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!146937 () Bool)

(assert (=> start!27536 (=> (not res!146937) (not e!180372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27536 (= res!146937 (validMask!0 mask!3868))))

(assert (=> start!27536 e!180372))

(declare-fun array_inv!4698 (array!14175) Bool)

(assert (=> start!27536 (array_inv!4698 a!3325)))

(assert (=> start!27536 true))

(declare-fun b!284375 () Bool)

(declare-fun res!146934 () Bool)

(assert (=> b!284375 (=> (not res!146934) (not e!180372))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284375 (= res!146934 (and (= (size!7079 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7079 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7079 a!3325))))))

(declare-fun b!284376 () Bool)

(declare-fun res!146935 () Bool)

(assert (=> b!284376 (=> (not res!146935) (not e!180372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284376 (= res!146935 (validKeyInArray!0 k0!2581))))

(declare-fun b!284377 () Bool)

(declare-fun res!146933 () Bool)

(assert (=> b!284377 (=> (not res!146933) (not e!180372))))

(declare-datatypes ((List!4507 0))(
  ( (Nil!4504) (Cons!4503 (h!5176 (_ BitVec 64)) (t!9580 List!4507)) )
))
(declare-fun arrayNoDuplicates!0 (array!14175 (_ BitVec 32) List!4507) Bool)

(assert (=> b!284377 (= res!146933 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4504))))

(declare-fun b!284378 () Bool)

(assert (=> b!284378 (= e!180372 e!180370)))

(declare-fun res!146938 () Bool)

(assert (=> b!284378 (=> (not res!146938) (not e!180370))))

(declare-datatypes ((SeekEntryResult!1883 0))(
  ( (MissingZero!1883 (index!9702 (_ BitVec 32))) (Found!1883 (index!9703 (_ BitVec 32))) (Intermediate!1883 (undefined!2695 Bool) (index!9704 (_ BitVec 32)) (x!27929 (_ BitVec 32))) (Undefined!1883) (MissingVacant!1883 (index!9705 (_ BitVec 32))) )
))
(declare-fun lt!140348 () SeekEntryResult!1883)

(assert (=> b!284378 (= res!146938 (or (= lt!140348 (MissingZero!1883 i!1267)) (= lt!140348 (MissingVacant!1883 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14175 (_ BitVec 32)) SeekEntryResult!1883)

(assert (=> b!284378 (= lt!140348 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!27536 res!146937) b!284375))

(assert (= (and b!284375 res!146934) b!284376))

(assert (= (and b!284376 res!146935) b!284377))

(assert (= (and b!284377 res!146933) b!284373))

(assert (= (and b!284373 res!146936) b!284378))

(assert (= (and b!284378 res!146938) b!284374))

(declare-fun m!298925 () Bool)

(assert (=> b!284376 m!298925))

(declare-fun m!298927 () Bool)

(assert (=> start!27536 m!298927))

(declare-fun m!298929 () Bool)

(assert (=> start!27536 m!298929))

(declare-fun m!298931 () Bool)

(assert (=> b!284377 m!298931))

(declare-fun m!298933 () Bool)

(assert (=> b!284378 m!298933))

(declare-fun m!298935 () Bool)

(assert (=> b!284374 m!298935))

(declare-fun m!298937 () Bool)

(assert (=> b!284373 m!298937))

(check-sat (not b!284377) (not start!27536) (not b!284376) (not b!284374) (not b!284373) (not b!284378))
(check-sat)
