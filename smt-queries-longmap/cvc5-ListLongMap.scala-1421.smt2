; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27552 () Bool)

(assert start!27552)

(declare-fun b!284682 () Bool)

(declare-fun e!180552 () Bool)

(assert (=> b!284682 (= e!180552 false)))

(declare-fun lt!140583 () Bool)

(declare-datatypes ((array!14202 0))(
  ( (array!14203 (arr!6740 (Array (_ BitVec 32) (_ BitVec 64))) (size!7092 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14202)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14202 (_ BitVec 32)) Bool)

(assert (=> b!284682 (= lt!140583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!147194 () Bool)

(declare-fun e!180554 () Bool)

(assert (=> start!27552 (=> (not res!147194) (not e!180554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27552 (= res!147194 (validMask!0 mask!3868))))

(assert (=> start!27552 e!180554))

(declare-fun array_inv!4703 (array!14202) Bool)

(assert (=> start!27552 (array_inv!4703 a!3325)))

(assert (=> start!27552 true))

(declare-fun b!284683 () Bool)

(assert (=> b!284683 (= e!180554 e!180552)))

(declare-fun res!147193 () Bool)

(assert (=> b!284683 (=> (not res!147193) (not e!180552))))

(declare-datatypes ((SeekEntryResult!1898 0))(
  ( (MissingZero!1898 (index!9762 (_ BitVec 32))) (Found!1898 (index!9763 (_ BitVec 32))) (Intermediate!1898 (undefined!2710 Bool) (index!9764 (_ BitVec 32)) (x!27969 (_ BitVec 32))) (Undefined!1898) (MissingVacant!1898 (index!9765 (_ BitVec 32))) )
))
(declare-fun lt!140584 () SeekEntryResult!1898)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284683 (= res!147193 (or (= lt!140584 (MissingZero!1898 i!1267)) (= lt!140584 (MissingVacant!1898 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14202 (_ BitVec 32)) SeekEntryResult!1898)

(assert (=> b!284683 (= lt!140584 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284684 () Bool)

(declare-fun res!147192 () Bool)

(assert (=> b!284684 (=> (not res!147192) (not e!180554))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284684 (= res!147192 (and (= (size!7092 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7092 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7092 a!3325))))))

(declare-fun b!284685 () Bool)

(declare-fun res!147190 () Bool)

(assert (=> b!284685 (=> (not res!147190) (not e!180554))))

(declare-datatypes ((List!4548 0))(
  ( (Nil!4545) (Cons!4544 (h!5217 (_ BitVec 64)) (t!9630 List!4548)) )
))
(declare-fun arrayNoDuplicates!0 (array!14202 (_ BitVec 32) List!4548) Bool)

(assert (=> b!284685 (= res!147190 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4545))))

(declare-fun b!284686 () Bool)

(declare-fun res!147195 () Bool)

(assert (=> b!284686 (=> (not res!147195) (not e!180554))))

(declare-fun arrayContainsKey!0 (array!14202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284686 (= res!147195 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284687 () Bool)

(declare-fun res!147191 () Bool)

(assert (=> b!284687 (=> (not res!147191) (not e!180554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284687 (= res!147191 (validKeyInArray!0 k!2581))))

(assert (= (and start!27552 res!147194) b!284684))

(assert (= (and b!284684 res!147192) b!284687))

(assert (= (and b!284687 res!147191) b!284685))

(assert (= (and b!284685 res!147190) b!284686))

(assert (= (and b!284686 res!147195) b!284683))

(assert (= (and b!284683 res!147193) b!284682))

(declare-fun m!299643 () Bool)

(assert (=> start!27552 m!299643))

(declare-fun m!299645 () Bool)

(assert (=> start!27552 m!299645))

(declare-fun m!299647 () Bool)

(assert (=> b!284686 m!299647))

(declare-fun m!299649 () Bool)

(assert (=> b!284687 m!299649))

(declare-fun m!299651 () Bool)

(assert (=> b!284682 m!299651))

(declare-fun m!299653 () Bool)

(assert (=> b!284685 m!299653))

(declare-fun m!299655 () Bool)

(assert (=> b!284683 m!299655))

(push 1)

