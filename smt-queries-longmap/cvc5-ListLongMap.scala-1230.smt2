; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25938 () Bool)

(assert start!25938)

(declare-fun res!132066 () Bool)

(declare-fun e!173099 () Bool)

(assert (=> start!25938 (=> (not res!132066) (not e!173099))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25938 (= res!132066 (validMask!0 mask!3868))))

(assert (=> start!25938 e!173099))

(declare-datatypes ((array!13035 0))(
  ( (array!13036 (arr!6167 (Array (_ BitVec 32) (_ BitVec 64))) (size!6519 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13035)

(declare-fun array_inv!4130 (array!13035) Bool)

(assert (=> start!25938 (array_inv!4130 a!3325)))

(assert (=> start!25938 true))

(declare-fun b!267786 () Bool)

(declare-fun res!132064 () Bool)

(assert (=> b!267786 (=> (not res!132064) (not e!173099))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267786 (= res!132064 (and (= (size!6519 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6519 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6519 a!3325))))))

(declare-fun b!267787 () Bool)

(declare-fun res!132065 () Bool)

(assert (=> b!267787 (=> (not res!132065) (not e!173099))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267787 (= res!132065 (validKeyInArray!0 k!2581))))

(declare-fun b!267788 () Bool)

(assert (=> b!267788 (= e!173099 false)))

(declare-fun lt!134731 () Bool)

(declare-datatypes ((List!3975 0))(
  ( (Nil!3972) (Cons!3971 (h!4638 (_ BitVec 64)) (t!9057 List!3975)) )
))
(declare-fun arrayNoDuplicates!0 (array!13035 (_ BitVec 32) List!3975) Bool)

(assert (=> b!267788 (= lt!134731 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3972))))

(assert (= (and start!25938 res!132066) b!267786))

(assert (= (and b!267786 res!132064) b!267787))

(assert (= (and b!267787 res!132065) b!267788))

(declare-fun m!284067 () Bool)

(assert (=> start!25938 m!284067))

(declare-fun m!284069 () Bool)

(assert (=> start!25938 m!284069))

(declare-fun m!284071 () Bool)

(assert (=> b!267787 m!284071))

(declare-fun m!284073 () Bool)

(assert (=> b!267788 m!284073))

(push 1)

(assert (not b!267788))

(assert (not start!25938))

(assert (not b!267787))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

