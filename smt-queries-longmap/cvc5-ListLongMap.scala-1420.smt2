; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27546 () Bool)

(assert start!27546)

(declare-fun res!147139 () Bool)

(declare-fun e!180527 () Bool)

(assert (=> start!27546 (=> (not res!147139) (not e!180527))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27546 (= res!147139 (validMask!0 mask!3868))))

(assert (=> start!27546 e!180527))

(declare-datatypes ((array!14196 0))(
  ( (array!14197 (arr!6737 (Array (_ BitVec 32) (_ BitVec 64))) (size!7089 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14196)

(declare-fun array_inv!4700 (array!14196) Bool)

(assert (=> start!27546 (array_inv!4700 a!3325)))

(assert (=> start!27546 true))

(declare-fun b!284628 () Bool)

(declare-fun res!147141 () Bool)

(assert (=> b!284628 (=> (not res!147141) (not e!180527))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14196 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284628 (= res!147141 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284629 () Bool)

(declare-fun e!180526 () Bool)

(assert (=> b!284629 (= e!180527 e!180526)))

(declare-fun res!147137 () Bool)

(assert (=> b!284629 (=> (not res!147137) (not e!180526))))

(declare-datatypes ((SeekEntryResult!1895 0))(
  ( (MissingZero!1895 (index!9750 (_ BitVec 32))) (Found!1895 (index!9751 (_ BitVec 32))) (Intermediate!1895 (undefined!2707 Bool) (index!9752 (_ BitVec 32)) (x!27958 (_ BitVec 32))) (Undefined!1895) (MissingVacant!1895 (index!9753 (_ BitVec 32))) )
))
(declare-fun lt!140565 () SeekEntryResult!1895)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284629 (= res!147137 (or (= lt!140565 (MissingZero!1895 i!1267)) (= lt!140565 (MissingVacant!1895 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14196 (_ BitVec 32)) SeekEntryResult!1895)

(assert (=> b!284629 (= lt!140565 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284630 () Bool)

(declare-fun res!147140 () Bool)

(assert (=> b!284630 (=> (not res!147140) (not e!180527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284630 (= res!147140 (validKeyInArray!0 k!2581))))

(declare-fun b!284631 () Bool)

(declare-fun res!147138 () Bool)

(assert (=> b!284631 (=> (not res!147138) (not e!180527))))

(declare-datatypes ((List!4545 0))(
  ( (Nil!4542) (Cons!4541 (h!5214 (_ BitVec 64)) (t!9627 List!4545)) )
))
(declare-fun arrayNoDuplicates!0 (array!14196 (_ BitVec 32) List!4545) Bool)

(assert (=> b!284631 (= res!147138 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4542))))

(declare-fun b!284632 () Bool)

(declare-fun res!147136 () Bool)

(assert (=> b!284632 (=> (not res!147136) (not e!180527))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284632 (= res!147136 (and (= (size!7089 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7089 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7089 a!3325))))))

(declare-fun b!284633 () Bool)

(assert (=> b!284633 (= e!180526 false)))

(declare-fun lt!140566 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14196 (_ BitVec 32)) Bool)

(assert (=> b!284633 (= lt!140566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27546 res!147139) b!284632))

(assert (= (and b!284632 res!147136) b!284630))

(assert (= (and b!284630 res!147140) b!284631))

(assert (= (and b!284631 res!147138) b!284628))

(assert (= (and b!284628 res!147141) b!284629))

(assert (= (and b!284629 res!147137) b!284633))

(declare-fun m!299601 () Bool)

(assert (=> b!284628 m!299601))

(declare-fun m!299603 () Bool)

(assert (=> b!284631 m!299603))

(declare-fun m!299605 () Bool)

(assert (=> b!284630 m!299605))

(declare-fun m!299607 () Bool)

(assert (=> b!284629 m!299607))

(declare-fun m!299609 () Bool)

(assert (=> start!27546 m!299609))

(declare-fun m!299611 () Bool)

(assert (=> start!27546 m!299611))

(declare-fun m!299613 () Bool)

(assert (=> b!284633 m!299613))

(push 1)

(assert (not b!284631))

(assert (not b!284629))

(assert (not b!284630))

(assert (not start!27546))

(assert (not b!284628))

(assert (not b!284633))

(check-sat)

