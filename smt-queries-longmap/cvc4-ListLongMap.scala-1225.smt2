; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25888 () Bool)

(assert start!25888)

(declare-fun b!267597 () Bool)

(declare-fun res!131895 () Bool)

(declare-fun e!172985 () Bool)

(assert (=> b!267597 (=> (not res!131895) (not e!172985))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267597 (= res!131895 (validKeyInArray!0 k!2581))))

(declare-fun b!267598 () Bool)

(declare-fun res!131893 () Bool)

(assert (=> b!267598 (=> (not res!131893) (not e!172985))))

(declare-datatypes ((array!13006 0))(
  ( (array!13007 (arr!6154 (Array (_ BitVec 32) (_ BitVec 64))) (size!6506 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13006)

(declare-datatypes ((List!3962 0))(
  ( (Nil!3959) (Cons!3958 (h!4625 (_ BitVec 64)) (t!9044 List!3962)) )
))
(declare-fun arrayNoDuplicates!0 (array!13006 (_ BitVec 32) List!3962) Bool)

(assert (=> b!267598 (= res!131893 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3959))))

(declare-fun b!267596 () Bool)

(declare-fun res!131892 () Bool)

(assert (=> b!267596 (=> (not res!131892) (not e!172985))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267596 (= res!131892 (and (= (size!6506 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6506 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6506 a!3325))))))

(declare-fun res!131894 () Bool)

(assert (=> start!25888 (=> (not res!131894) (not e!172985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25888 (= res!131894 (validMask!0 mask!3868))))

(assert (=> start!25888 e!172985))

(declare-fun array_inv!4117 (array!13006) Bool)

(assert (=> start!25888 (array_inv!4117 a!3325)))

(assert (=> start!25888 true))

(declare-fun b!267599 () Bool)

(assert (=> b!267599 (= e!172985 (bvsge #b00000000000000000000000000000000 (size!6506 a!3325)))))

(assert (= (and start!25888 res!131894) b!267596))

(assert (= (and b!267596 res!131892) b!267597))

(assert (= (and b!267597 res!131895) b!267598))

(assert (= (and b!267598 res!131893) b!267599))

(declare-fun m!283933 () Bool)

(assert (=> b!267597 m!283933))

(declare-fun m!283935 () Bool)

(assert (=> b!267598 m!283935))

(declare-fun m!283937 () Bool)

(assert (=> start!25888 m!283937))

(declare-fun m!283939 () Bool)

(assert (=> start!25888 m!283939))

(push 1)

(assert (not start!25888))

(assert (not b!267598))

(assert (not b!267597))

(check-sat)

(pop 1)

(push 1)

(check-sat)

