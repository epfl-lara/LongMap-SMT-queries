; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25932 () Bool)

(assert start!25932)

(declare-fun res!132037 () Bool)

(declare-fun e!173081 () Bool)

(assert (=> start!25932 (=> (not res!132037) (not e!173081))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25932 (= res!132037 (validMask!0 mask!3868))))

(assert (=> start!25932 e!173081))

(declare-datatypes ((array!13029 0))(
  ( (array!13030 (arr!6164 (Array (_ BitVec 32) (_ BitVec 64))) (size!6516 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13029)

(declare-fun array_inv!4127 (array!13029) Bool)

(assert (=> start!25932 (array_inv!4127 a!3325)))

(assert (=> start!25932 true))

(declare-fun b!267759 () Bool)

(declare-fun res!132039 () Bool)

(assert (=> b!267759 (=> (not res!132039) (not e!173081))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267759 (= res!132039 (and (= (size!6516 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6516 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6516 a!3325))))))

(declare-fun b!267760 () Bool)

(declare-fun res!132038 () Bool)

(assert (=> b!267760 (=> (not res!132038) (not e!173081))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267760 (= res!132038 (validKeyInArray!0 k!2581))))

(declare-fun b!267761 () Bool)

(assert (=> b!267761 (= e!173081 false)))

(declare-fun lt!134722 () Bool)

(declare-datatypes ((List!3972 0))(
  ( (Nil!3969) (Cons!3968 (h!4635 (_ BitVec 64)) (t!9054 List!3972)) )
))
(declare-fun arrayNoDuplicates!0 (array!13029 (_ BitVec 32) List!3972) Bool)

(assert (=> b!267761 (= lt!134722 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3969))))

(assert (= (and start!25932 res!132037) b!267759))

(assert (= (and b!267759 res!132039) b!267760))

(assert (= (and b!267760 res!132038) b!267761))

(declare-fun m!284043 () Bool)

(assert (=> start!25932 m!284043))

(declare-fun m!284045 () Bool)

(assert (=> start!25932 m!284045))

(declare-fun m!284047 () Bool)

(assert (=> b!267760 m!284047))

(declare-fun m!284049 () Bool)

(assert (=> b!267761 m!284049))

(push 1)

(assert (not b!267761))

(assert (not start!25932))

(assert (not b!267760))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

