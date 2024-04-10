; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27550 () Bool)

(assert start!27550)

(declare-fun b!284664 () Bool)

(declare-fun e!180543 () Bool)

(declare-fun e!180545 () Bool)

(assert (=> b!284664 (= e!180543 e!180545)))

(declare-fun res!147175 () Bool)

(assert (=> b!284664 (=> (not res!147175) (not e!180545))))

(declare-datatypes ((SeekEntryResult!1897 0))(
  ( (MissingZero!1897 (index!9758 (_ BitVec 32))) (Found!1897 (index!9759 (_ BitVec 32))) (Intermediate!1897 (undefined!2709 Bool) (index!9760 (_ BitVec 32)) (x!27960 (_ BitVec 32))) (Undefined!1897) (MissingVacant!1897 (index!9761 (_ BitVec 32))) )
))
(declare-fun lt!140577 () SeekEntryResult!1897)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284664 (= res!147175 (or (= lt!140577 (MissingZero!1897 i!1267)) (= lt!140577 (MissingVacant!1897 i!1267))))))

(declare-datatypes ((array!14200 0))(
  ( (array!14201 (arr!6739 (Array (_ BitVec 32) (_ BitVec 64))) (size!7091 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14200)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14200 (_ BitVec 32)) SeekEntryResult!1897)

(assert (=> b!284664 (= lt!140577 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284665 () Bool)

(declare-fun res!147177 () Bool)

(assert (=> b!284665 (=> (not res!147177) (not e!180543))))

(declare-datatypes ((List!4547 0))(
  ( (Nil!4544) (Cons!4543 (h!5216 (_ BitVec 64)) (t!9629 List!4547)) )
))
(declare-fun arrayNoDuplicates!0 (array!14200 (_ BitVec 32) List!4547) Bool)

(assert (=> b!284665 (= res!147177 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4544))))

(declare-fun b!284666 () Bool)

(declare-fun res!147173 () Bool)

(assert (=> b!284666 (=> (not res!147173) (not e!180543))))

(declare-fun arrayContainsKey!0 (array!14200 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284666 (= res!147173 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284667 () Bool)

(assert (=> b!284667 (= e!180545 false)))

(declare-fun lt!140578 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14200 (_ BitVec 32)) Bool)

(assert (=> b!284667 (= lt!140578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284668 () Bool)

(declare-fun res!147172 () Bool)

(assert (=> b!284668 (=> (not res!147172) (not e!180543))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284668 (= res!147172 (and (= (size!7091 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7091 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7091 a!3325))))))

(declare-fun res!147176 () Bool)

(assert (=> start!27550 (=> (not res!147176) (not e!180543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27550 (= res!147176 (validMask!0 mask!3868))))

(assert (=> start!27550 e!180543))

(declare-fun array_inv!4702 (array!14200) Bool)

(assert (=> start!27550 (array_inv!4702 a!3325)))

(assert (=> start!27550 true))

(declare-fun b!284669 () Bool)

(declare-fun res!147174 () Bool)

(assert (=> b!284669 (=> (not res!147174) (not e!180543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284669 (= res!147174 (validKeyInArray!0 k!2581))))

(assert (= (and start!27550 res!147176) b!284668))

(assert (= (and b!284668 res!147172) b!284669))

(assert (= (and b!284669 res!147174) b!284665))

(assert (= (and b!284665 res!147177) b!284666))

(assert (= (and b!284666 res!147173) b!284664))

(assert (= (and b!284664 res!147175) b!284667))

(declare-fun m!299629 () Bool)

(assert (=> b!284665 m!299629))

(declare-fun m!299631 () Bool)

(assert (=> b!284666 m!299631))

(declare-fun m!299633 () Bool)

(assert (=> b!284669 m!299633))

(declare-fun m!299635 () Bool)

(assert (=> b!284664 m!299635))

(declare-fun m!299637 () Bool)

(assert (=> b!284667 m!299637))

(declare-fun m!299639 () Bool)

(assert (=> start!27550 m!299639))

(declare-fun m!299641 () Bool)

(assert (=> start!27550 m!299641))

(push 1)

(assert (not b!284666))

(assert (not b!284669))

(assert (not b!284667))

(assert (not start!27550))

(assert (not b!284664))

(assert (not b!284665))

(check-sat)

