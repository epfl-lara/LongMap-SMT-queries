; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25796 () Bool)

(assert start!25796)

(declare-fun res!131680 () Bool)

(declare-fun e!172843 () Bool)

(assert (=> start!25796 (=> (not res!131680) (not e!172843))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25796 (= res!131680 (validMask!0 mask!3868))))

(assert (=> start!25796 e!172843))

(declare-datatypes ((array!12975 0))(
  ( (array!12976 (arr!6142 (Array (_ BitVec 32) (_ BitVec 64))) (size!6494 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12975)

(declare-fun array_inv!4105 (array!12975) Bool)

(assert (=> start!25796 (array_inv!4105 a!3325)))

(assert (=> start!25796 true))

(declare-fun b!267384 () Bool)

(declare-fun res!131682 () Bool)

(assert (=> b!267384 (=> (not res!131682) (not e!172843))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267384 (= res!131682 (and (= (size!6494 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6494 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6494 a!3325))))))

(declare-fun b!267385 () Bool)

(declare-fun res!131681 () Bool)

(assert (=> b!267385 (=> (not res!131681) (not e!172843))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267385 (= res!131681 (validKeyInArray!0 k!2581))))

(declare-fun b!267386 () Bool)

(assert (=> b!267386 (= e!172843 (and (bvsle #b00000000000000000000000000000000 (size!6494 a!3325)) (bvsge (size!6494 a!3325) #b01111111111111111111111111111111)))))

(assert (= (and start!25796 res!131680) b!267384))

(assert (= (and b!267384 res!131682) b!267385))

(assert (= (and b!267385 res!131681) b!267386))

(declare-fun m!283773 () Bool)

(assert (=> start!25796 m!283773))

(declare-fun m!283775 () Bool)

(assert (=> start!25796 m!283775))

(declare-fun m!283777 () Bool)

(assert (=> b!267385 m!283777))

(push 1)

(assert (not b!267385))

(assert (not start!25796))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

