; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26038 () Bool)

(assert start!26038)

(declare-fun b!268611 () Bool)

(declare-fun res!132889 () Bool)

(declare-fun e!173471 () Bool)

(assert (=> b!268611 (=> (not res!132889) (not e!173471))))

(declare-datatypes ((array!13135 0))(
  ( (array!13136 (arr!6217 (Array (_ BitVec 32) (_ BitVec 64))) (size!6569 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13135)

(declare-datatypes ((List!4025 0))(
  ( (Nil!4022) (Cons!4021 (h!4688 (_ BitVec 64)) (t!9107 List!4025)) )
))
(declare-fun arrayNoDuplicates!0 (array!13135 (_ BitVec 32) List!4025) Bool)

(assert (=> b!268611 (= res!132889 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4022))))

(declare-fun b!268613 () Bool)

(declare-fun e!173469 () Bool)

(assert (=> b!268613 (= e!173471 e!173469)))

(declare-fun res!132894 () Bool)

(assert (=> b!268613 (=> (not res!132894) (not e!173469))))

(declare-datatypes ((SeekEntryResult!1375 0))(
  ( (MissingZero!1375 (index!7670 (_ BitVec 32))) (Found!1375 (index!7671 (_ BitVec 32))) (Intermediate!1375 (undefined!2187 Bool) (index!7672 (_ BitVec 32)) (x!26028 (_ BitVec 32))) (Undefined!1375) (MissingVacant!1375 (index!7673 (_ BitVec 32))) )
))
(declare-fun lt!134935 () SeekEntryResult!1375)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268613 (= res!132894 (or (= lt!134935 (MissingZero!1375 i!1267)) (= lt!134935 (MissingVacant!1375 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13135 (_ BitVec 32)) SeekEntryResult!1375)

(assert (=> b!268613 (= lt!134935 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268614 () Bool)

(declare-fun res!132891 () Bool)

(assert (=> b!268614 (=> (not res!132891) (not e!173471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268614 (= res!132891 (validKeyInArray!0 k!2581))))

(declare-fun b!268615 () Bool)

(assert (=> b!268615 (= e!173469 false)))

(declare-fun lt!134934 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13135 (_ BitVec 32)) Bool)

(assert (=> b!268615 (= lt!134934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268616 () Bool)

(declare-fun res!132890 () Bool)

(assert (=> b!268616 (=> (not res!132890) (not e!173471))))

(declare-fun arrayContainsKey!0 (array!13135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268616 (= res!132890 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268612 () Bool)

(declare-fun res!132892 () Bool)

(assert (=> b!268612 (=> (not res!132892) (not e!173471))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268612 (= res!132892 (and (= (size!6569 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6569 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6569 a!3325))))))

(declare-fun res!132893 () Bool)

(assert (=> start!26038 (=> (not res!132893) (not e!173471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26038 (= res!132893 (validMask!0 mask!3868))))

(assert (=> start!26038 e!173471))

(declare-fun array_inv!4180 (array!13135) Bool)

(assert (=> start!26038 (array_inv!4180 a!3325)))

(assert (=> start!26038 true))

(assert (= (and start!26038 res!132893) b!268612))

(assert (= (and b!268612 res!132892) b!268614))

(assert (= (and b!268614 res!132891) b!268611))

(assert (= (and b!268611 res!132889) b!268616))

(assert (= (and b!268616 res!132890) b!268613))

(assert (= (and b!268613 res!132894) b!268615))

(declare-fun m!284701 () Bool)

(assert (=> b!268614 m!284701))

(declare-fun m!284703 () Bool)

(assert (=> b!268613 m!284703))

(declare-fun m!284705 () Bool)

(assert (=> b!268615 m!284705))

(declare-fun m!284707 () Bool)

(assert (=> b!268616 m!284707))

(declare-fun m!284709 () Bool)

(assert (=> start!26038 m!284709))

(declare-fun m!284711 () Bool)

(assert (=> start!26038 m!284711))

(declare-fun m!284713 () Bool)

(assert (=> b!268611 m!284713))

(push 1)

(assert (not b!268615))

(assert (not b!268614))

(assert (not b!268613))

(assert (not b!268611))

(assert (not b!268616))

(assert (not start!26038))

(check-sat)

