; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25812 () Bool)

(assert start!25812)

(declare-fun b!267397 () Bool)

(declare-fun res!131694 () Bool)

(declare-fun e!172850 () Bool)

(assert (=> b!267397 (=> (not res!131694) (not e!172850))))

(declare-datatypes ((array!12978 0))(
  ( (array!12979 (arr!6143 (Array (_ BitVec 32) (_ BitVec 64))) (size!6495 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12978)

(assert (=> b!267397 (= res!131694 (and (bvsle #b00000000000000000000000000000000 (size!6495 a!3325)) (bvslt (size!6495 a!3325) #b01111111111111111111111111111111)))))

(declare-fun b!267396 () Bool)

(declare-fun res!131691 () Bool)

(assert (=> b!267396 (=> (not res!131691) (not e!172850))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267396 (= res!131691 (validKeyInArray!0 k!2581))))

(declare-fun res!131693 () Bool)

(assert (=> start!25812 (=> (not res!131693) (not e!172850))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25812 (= res!131693 (validMask!0 mask!3868))))

(assert (=> start!25812 e!172850))

(declare-fun array_inv!4106 (array!12978) Bool)

(assert (=> start!25812 (array_inv!4106 a!3325)))

(assert (=> start!25812 true))

(declare-fun b!267398 () Bool)

(declare-datatypes ((List!3951 0))(
  ( (Nil!3948) (Cons!3947 (h!4614 (_ BitVec 64)) (t!9033 List!3951)) )
))
(declare-fun noDuplicate!110 (List!3951) Bool)

(assert (=> b!267398 (= e!172850 (not (noDuplicate!110 Nil!3948)))))

(declare-fun b!267395 () Bool)

(declare-fun res!131692 () Bool)

(assert (=> b!267395 (=> (not res!131692) (not e!172850))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267395 (= res!131692 (and (= (size!6495 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6495 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6495 a!3325))))))

(assert (= (and start!25812 res!131693) b!267395))

(assert (= (and b!267395 res!131692) b!267396))

(assert (= (and b!267396 res!131691) b!267397))

(assert (= (and b!267397 res!131694) b!267398))

(declare-fun m!283779 () Bool)

(assert (=> b!267396 m!283779))

(declare-fun m!283781 () Bool)

(assert (=> start!25812 m!283781))

(declare-fun m!283783 () Bool)

(assert (=> start!25812 m!283783))

(declare-fun m!283785 () Bool)

(assert (=> b!267398 m!283785))

(push 1)

(assert (not b!267396))

(assert (not start!25812))

(assert (not b!267398))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64323 () Bool)

(assert (=> d!64323 (= (validKeyInArray!0 k!2581) (and (not (= k!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

