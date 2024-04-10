; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25816 () Bool)

(assert start!25816)

(declare-fun b!267420 () Bool)

(declare-fun res!131715 () Bool)

(declare-fun e!172861 () Bool)

(assert (=> b!267420 (=> (not res!131715) (not e!172861))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267420 (= res!131715 (validKeyInArray!0 k!2581))))

(declare-fun res!131718 () Bool)

(assert (=> start!25816 (=> (not res!131718) (not e!172861))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25816 (= res!131718 (validMask!0 mask!3868))))

(assert (=> start!25816 e!172861))

(declare-datatypes ((array!12982 0))(
  ( (array!12983 (arr!6145 (Array (_ BitVec 32) (_ BitVec 64))) (size!6497 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12982)

(declare-fun array_inv!4108 (array!12982) Bool)

(assert (=> start!25816 (array_inv!4108 a!3325)))

(assert (=> start!25816 true))

(declare-fun b!267421 () Bool)

(declare-fun res!131717 () Bool)

(assert (=> b!267421 (=> (not res!131717) (not e!172861))))

(assert (=> b!267421 (= res!131717 (and (bvsle #b00000000000000000000000000000000 (size!6497 a!3325)) (bvslt (size!6497 a!3325) #b01111111111111111111111111111111)))))

(declare-fun b!267419 () Bool)

(declare-fun res!131716 () Bool)

(assert (=> b!267419 (=> (not res!131716) (not e!172861))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267419 (= res!131716 (and (= (size!6497 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6497 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6497 a!3325))))))

(declare-fun b!267422 () Bool)

(declare-datatypes ((List!3953 0))(
  ( (Nil!3950) (Cons!3949 (h!4616 (_ BitVec 64)) (t!9035 List!3953)) )
))
(declare-fun noDuplicate!112 (List!3953) Bool)

(assert (=> b!267422 (= e!172861 (not (noDuplicate!112 Nil!3950)))))

(assert (= (and start!25816 res!131718) b!267419))

(assert (= (and b!267419 res!131716) b!267420))

(assert (= (and b!267420 res!131715) b!267421))

(assert (= (and b!267421 res!131717) b!267422))

(declare-fun m!283795 () Bool)

(assert (=> b!267420 m!283795))

(declare-fun m!283797 () Bool)

(assert (=> start!25816 m!283797))

(declare-fun m!283799 () Bool)

(assert (=> start!25816 m!283799))

(declare-fun m!283801 () Bool)

(assert (=> b!267422 m!283801))

(push 1)

(assert (not b!267420))

(assert (not start!25816))

(assert (not b!267422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64325 () Bool)

(assert (=> d!64325 (= (validKeyInArray!0 k!2581) (and (not (= k!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

