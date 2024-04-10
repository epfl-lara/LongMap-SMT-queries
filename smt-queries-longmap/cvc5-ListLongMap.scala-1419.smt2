; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27540 () Bool)

(assert start!27540)

(declare-fun res!147087 () Bool)

(declare-fun e!180499 () Bool)

(assert (=> start!27540 (=> (not res!147087) (not e!180499))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27540 (= res!147087 (validMask!0 mask!3868))))

(assert (=> start!27540 e!180499))

(declare-datatypes ((array!14190 0))(
  ( (array!14191 (arr!6734 (Array (_ BitVec 32) (_ BitVec 64))) (size!7086 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14190)

(declare-fun array_inv!4697 (array!14190) Bool)

(assert (=> start!27540 (array_inv!4697 a!3325)))

(assert (=> start!27540 true))

(declare-fun b!284574 () Bool)

(declare-fun res!147086 () Bool)

(assert (=> b!284574 (=> (not res!147086) (not e!180499))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284574 (= res!147086 (and (= (size!7086 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7086 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7086 a!3325))))))

(declare-fun b!284575 () Bool)

(declare-fun e!180500 () Bool)

(assert (=> b!284575 (= e!180500 false)))

(declare-fun lt!140547 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14190 (_ BitVec 32)) Bool)

(assert (=> b!284575 (= lt!140547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284576 () Bool)

(assert (=> b!284576 (= e!180499 e!180500)))

(declare-fun res!147085 () Bool)

(assert (=> b!284576 (=> (not res!147085) (not e!180500))))

(declare-datatypes ((SeekEntryResult!1892 0))(
  ( (MissingZero!1892 (index!9738 (_ BitVec 32))) (Found!1892 (index!9739 (_ BitVec 32))) (Intermediate!1892 (undefined!2704 Bool) (index!9740 (_ BitVec 32)) (x!27947 (_ BitVec 32))) (Undefined!1892) (MissingVacant!1892 (index!9741 (_ BitVec 32))) )
))
(declare-fun lt!140548 () SeekEntryResult!1892)

(assert (=> b!284576 (= res!147085 (or (= lt!140548 (MissingZero!1892 i!1267)) (= lt!140548 (MissingVacant!1892 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14190 (_ BitVec 32)) SeekEntryResult!1892)

(assert (=> b!284576 (= lt!140548 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284577 () Bool)

(declare-fun res!147082 () Bool)

(assert (=> b!284577 (=> (not res!147082) (not e!180499))))

(declare-datatypes ((List!4542 0))(
  ( (Nil!4539) (Cons!4538 (h!5211 (_ BitVec 64)) (t!9624 List!4542)) )
))
(declare-fun arrayNoDuplicates!0 (array!14190 (_ BitVec 32) List!4542) Bool)

(assert (=> b!284577 (= res!147082 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4539))))

(declare-fun b!284578 () Bool)

(declare-fun res!147084 () Bool)

(assert (=> b!284578 (=> (not res!147084) (not e!180499))))

(declare-fun arrayContainsKey!0 (array!14190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284578 (= res!147084 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284579 () Bool)

(declare-fun res!147083 () Bool)

(assert (=> b!284579 (=> (not res!147083) (not e!180499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284579 (= res!147083 (validKeyInArray!0 k!2581))))

(assert (= (and start!27540 res!147087) b!284574))

(assert (= (and b!284574 res!147086) b!284579))

(assert (= (and b!284579 res!147083) b!284577))

(assert (= (and b!284577 res!147082) b!284578))

(assert (= (and b!284578 res!147084) b!284576))

(assert (= (and b!284576 res!147085) b!284575))

(declare-fun m!299559 () Bool)

(assert (=> b!284578 m!299559))

(declare-fun m!299561 () Bool)

(assert (=> start!27540 m!299561))

(declare-fun m!299563 () Bool)

(assert (=> start!27540 m!299563))

(declare-fun m!299565 () Bool)

(assert (=> b!284579 m!299565))

(declare-fun m!299567 () Bool)

(assert (=> b!284575 m!299567))

(declare-fun m!299569 () Bool)

(assert (=> b!284577 m!299569))

(declare-fun m!299571 () Bool)

(assert (=> b!284576 m!299571))

(push 1)

