; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27544 () Bool)

(assert start!27544)

(declare-fun b!284610 () Bool)

(declare-fun e!180518 () Bool)

(assert (=> b!284610 (= e!180518 false)))

(declare-fun lt!140559 () Bool)

(declare-datatypes ((array!14194 0))(
  ( (array!14195 (arr!6736 (Array (_ BitVec 32) (_ BitVec 64))) (size!7088 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14194)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14194 (_ BitVec 32)) Bool)

(assert (=> b!284610 (= lt!140559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!147121 () Bool)

(declare-fun e!180517 () Bool)

(assert (=> start!27544 (=> (not res!147121) (not e!180517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27544 (= res!147121 (validMask!0 mask!3868))))

(assert (=> start!27544 e!180517))

(declare-fun array_inv!4699 (array!14194) Bool)

(assert (=> start!27544 (array_inv!4699 a!3325)))

(assert (=> start!27544 true))

(declare-fun b!284611 () Bool)

(declare-fun res!147120 () Bool)

(assert (=> b!284611 (=> (not res!147120) (not e!180517))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284611 (= res!147120 (validKeyInArray!0 k!2581))))

(declare-fun b!284612 () Bool)

(declare-fun res!147123 () Bool)

(assert (=> b!284612 (=> (not res!147123) (not e!180517))))

(declare-datatypes ((List!4544 0))(
  ( (Nil!4541) (Cons!4540 (h!5213 (_ BitVec 64)) (t!9626 List!4544)) )
))
(declare-fun arrayNoDuplicates!0 (array!14194 (_ BitVec 32) List!4544) Bool)

(assert (=> b!284612 (= res!147123 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4541))))

(declare-fun b!284613 () Bool)

(declare-fun res!147118 () Bool)

(assert (=> b!284613 (=> (not res!147118) (not e!180517))))

(declare-fun arrayContainsKey!0 (array!14194 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284613 (= res!147118 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284614 () Bool)

(declare-fun res!147122 () Bool)

(assert (=> b!284614 (=> (not res!147122) (not e!180517))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284614 (= res!147122 (and (= (size!7088 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7088 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7088 a!3325))))))

(declare-fun b!284615 () Bool)

(assert (=> b!284615 (= e!180517 e!180518)))

(declare-fun res!147119 () Bool)

(assert (=> b!284615 (=> (not res!147119) (not e!180518))))

(declare-datatypes ((SeekEntryResult!1894 0))(
  ( (MissingZero!1894 (index!9746 (_ BitVec 32))) (Found!1894 (index!9747 (_ BitVec 32))) (Intermediate!1894 (undefined!2706 Bool) (index!9748 (_ BitVec 32)) (x!27949 (_ BitVec 32))) (Undefined!1894) (MissingVacant!1894 (index!9749 (_ BitVec 32))) )
))
(declare-fun lt!140560 () SeekEntryResult!1894)

(assert (=> b!284615 (= res!147119 (or (= lt!140560 (MissingZero!1894 i!1267)) (= lt!140560 (MissingVacant!1894 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14194 (_ BitVec 32)) SeekEntryResult!1894)

(assert (=> b!284615 (= lt!140560 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!27544 res!147121) b!284614))

(assert (= (and b!284614 res!147122) b!284611))

(assert (= (and b!284611 res!147120) b!284612))

(assert (= (and b!284612 res!147123) b!284613))

(assert (= (and b!284613 res!147118) b!284615))

(assert (= (and b!284615 res!147119) b!284610))

(declare-fun m!299587 () Bool)

(assert (=> b!284613 m!299587))

(declare-fun m!299589 () Bool)

(assert (=> b!284611 m!299589))

(declare-fun m!299591 () Bool)

(assert (=> b!284612 m!299591))

(declare-fun m!299593 () Bool)

(assert (=> start!27544 m!299593))

(declare-fun m!299595 () Bool)

(assert (=> start!27544 m!299595))

(declare-fun m!299597 () Bool)

(assert (=> b!284615 m!299597))

(declare-fun m!299599 () Bool)

(assert (=> b!284610 m!299599))

(push 1)

(assert (not b!284612))

(assert (not b!284615))

(assert (not b!284611))

(assert (not b!284613))

(assert (not b!284610))

(assert (not start!27544))

(check-sat)

