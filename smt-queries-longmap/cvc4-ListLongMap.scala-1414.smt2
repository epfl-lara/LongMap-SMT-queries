; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27514 () Bool)

(assert start!27514)

(declare-fun b!284313 () Bool)

(declare-fun res!146824 () Bool)

(declare-fun e!180382 () Bool)

(assert (=> b!284313 (=> (not res!146824) (not e!180382))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284313 (= res!146824 (validKeyInArray!0 k!2581))))

(declare-fun b!284314 () Bool)

(declare-fun e!180383 () Bool)

(assert (=> b!284314 (= e!180383 false)))

(declare-fun lt!140478 () Bool)

(declare-datatypes ((array!14164 0))(
  ( (array!14165 (arr!6721 (Array (_ BitVec 32) (_ BitVec 64))) (size!7073 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14164)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14164 (_ BitVec 32)) Bool)

(assert (=> b!284314 (= lt!140478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284315 () Bool)

(declare-fun res!146826 () Bool)

(assert (=> b!284315 (=> (not res!146826) (not e!180382))))

(declare-datatypes ((List!4529 0))(
  ( (Nil!4526) (Cons!4525 (h!5198 (_ BitVec 64)) (t!9611 List!4529)) )
))
(declare-fun arrayNoDuplicates!0 (array!14164 (_ BitVec 32) List!4529) Bool)

(assert (=> b!284315 (= res!146826 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4526))))

(declare-fun b!284316 () Bool)

(declare-fun res!146821 () Bool)

(assert (=> b!284316 (=> (not res!146821) (not e!180382))))

(declare-fun arrayContainsKey!0 (array!14164 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284316 (= res!146821 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284317 () Bool)

(declare-fun res!146825 () Bool)

(assert (=> b!284317 (=> (not res!146825) (not e!180382))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284317 (= res!146825 (and (= (size!7073 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7073 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7073 a!3325))))))

(declare-fun res!146823 () Bool)

(assert (=> start!27514 (=> (not res!146823) (not e!180382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27514 (= res!146823 (validMask!0 mask!3868))))

(assert (=> start!27514 e!180382))

(declare-fun array_inv!4684 (array!14164) Bool)

(assert (=> start!27514 (array_inv!4684 a!3325)))

(assert (=> start!27514 true))

(declare-fun b!284318 () Bool)

(assert (=> b!284318 (= e!180382 e!180383)))

(declare-fun res!146822 () Bool)

(assert (=> b!284318 (=> (not res!146822) (not e!180383))))

(declare-datatypes ((SeekEntryResult!1879 0))(
  ( (MissingZero!1879 (index!9686 (_ BitVec 32))) (Found!1879 (index!9687 (_ BitVec 32))) (Intermediate!1879 (undefined!2691 Bool) (index!9688 (_ BitVec 32)) (x!27894 (_ BitVec 32))) (Undefined!1879) (MissingVacant!1879 (index!9689 (_ BitVec 32))) )
))
(declare-fun lt!140479 () SeekEntryResult!1879)

(assert (=> b!284318 (= res!146822 (or (= lt!140479 (MissingZero!1879 i!1267)) (= lt!140479 (MissingVacant!1879 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14164 (_ BitVec 32)) SeekEntryResult!1879)

(assert (=> b!284318 (= lt!140479 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!27514 res!146823) b!284317))

(assert (= (and b!284317 res!146825) b!284313))

(assert (= (and b!284313 res!146824) b!284315))

(assert (= (and b!284315 res!146826) b!284316))

(assert (= (and b!284316 res!146821) b!284318))

(assert (= (and b!284318 res!146822) b!284314))

(declare-fun m!299365 () Bool)

(assert (=> b!284313 m!299365))

(declare-fun m!299367 () Bool)

(assert (=> b!284316 m!299367))

(declare-fun m!299369 () Bool)

(assert (=> b!284318 m!299369))

(declare-fun m!299371 () Bool)

(assert (=> b!284314 m!299371))

(declare-fun m!299373 () Bool)

(assert (=> b!284315 m!299373))

(declare-fun m!299375 () Bool)

(assert (=> start!27514 m!299375))

(declare-fun m!299377 () Bool)

(assert (=> start!27514 m!299377))

(push 1)

(assert (not b!284314))

(assert (not start!27514))

(assert (not b!284318))

(assert (not b!284315))

(assert (not b!284313))

(assert (not b!284316))

(check-sat)

