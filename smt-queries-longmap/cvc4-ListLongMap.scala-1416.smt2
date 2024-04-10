; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27526 () Bool)

(assert start!27526)

(declare-fun res!146933 () Bool)

(declare-fun e!180436 () Bool)

(assert (=> start!27526 (=> (not res!146933) (not e!180436))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27526 (= res!146933 (validMask!0 mask!3868))))

(assert (=> start!27526 e!180436))

(declare-datatypes ((array!14176 0))(
  ( (array!14177 (arr!6727 (Array (_ BitVec 32) (_ BitVec 64))) (size!7079 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14176)

(declare-fun array_inv!4690 (array!14176) Bool)

(assert (=> start!27526 (array_inv!4690 a!3325)))

(assert (=> start!27526 true))

(declare-fun b!284421 () Bool)

(declare-fun res!146929 () Bool)

(assert (=> b!284421 (=> (not res!146929) (not e!180436))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284421 (= res!146929 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284422 () Bool)

(declare-fun e!180437 () Bool)

(assert (=> b!284422 (= e!180436 e!180437)))

(declare-fun res!146931 () Bool)

(assert (=> b!284422 (=> (not res!146931) (not e!180437))))

(declare-datatypes ((SeekEntryResult!1885 0))(
  ( (MissingZero!1885 (index!9710 (_ BitVec 32))) (Found!1885 (index!9711 (_ BitVec 32))) (Intermediate!1885 (undefined!2697 Bool) (index!9712 (_ BitVec 32)) (x!27916 (_ BitVec 32))) (Undefined!1885) (MissingVacant!1885 (index!9713 (_ BitVec 32))) )
))
(declare-fun lt!140514 () SeekEntryResult!1885)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284422 (= res!146931 (or (= lt!140514 (MissingZero!1885 i!1267)) (= lt!140514 (MissingVacant!1885 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14176 (_ BitVec 32)) SeekEntryResult!1885)

(assert (=> b!284422 (= lt!140514 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284423 () Bool)

(declare-fun res!146932 () Bool)

(assert (=> b!284423 (=> (not res!146932) (not e!180436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284423 (= res!146932 (validKeyInArray!0 k!2581))))

(declare-fun b!284424 () Bool)

(declare-fun res!146930 () Bool)

(assert (=> b!284424 (=> (not res!146930) (not e!180436))))

(declare-datatypes ((List!4535 0))(
  ( (Nil!4532) (Cons!4531 (h!5204 (_ BitVec 64)) (t!9617 List!4535)) )
))
(declare-fun arrayNoDuplicates!0 (array!14176 (_ BitVec 32) List!4535) Bool)

(assert (=> b!284424 (= res!146930 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4532))))

(declare-fun b!284425 () Bool)

(declare-fun res!146934 () Bool)

(assert (=> b!284425 (=> (not res!146934) (not e!180436))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284425 (= res!146934 (and (= (size!7079 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7079 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7079 a!3325))))))

(declare-fun b!284426 () Bool)

(assert (=> b!284426 (= e!180437 false)))

(declare-fun lt!140515 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14176 (_ BitVec 32)) Bool)

(assert (=> b!284426 (= lt!140515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27526 res!146933) b!284425))

(assert (= (and b!284425 res!146934) b!284423))

(assert (= (and b!284423 res!146932) b!284424))

(assert (= (and b!284424 res!146930) b!284421))

(assert (= (and b!284421 res!146929) b!284422))

(assert (= (and b!284422 res!146931) b!284426))

(declare-fun m!299449 () Bool)

(assert (=> b!284423 m!299449))

(declare-fun m!299451 () Bool)

(assert (=> b!284426 m!299451))

(declare-fun m!299453 () Bool)

(assert (=> start!27526 m!299453))

(declare-fun m!299455 () Bool)

(assert (=> start!27526 m!299455))

(declare-fun m!299457 () Bool)

(assert (=> b!284422 m!299457))

(declare-fun m!299459 () Bool)

(assert (=> b!284424 m!299459))

(declare-fun m!299461 () Bool)

(assert (=> b!284421 m!299461))

(push 1)

