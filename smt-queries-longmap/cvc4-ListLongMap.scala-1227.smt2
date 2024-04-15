; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25924 () Bool)

(assert start!25924)

(declare-fun res!131879 () Bool)

(declare-fun e!172950 () Bool)

(assert (=> start!25924 (=> (not res!131879) (not e!172950))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25924 (= res!131879 (validMask!0 mask!3868))))

(assert (=> start!25924 e!172950))

(declare-datatypes ((array!13010 0))(
  ( (array!13011 (arr!6154 (Array (_ BitVec 32) (_ BitVec 64))) (size!6507 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13010)

(declare-fun array_inv!4126 (array!13010) Bool)

(assert (=> start!25924 (array_inv!4126 a!3325)))

(assert (=> start!25924 true))

(declare-fun b!267549 () Bool)

(declare-fun res!131881 () Bool)

(assert (=> b!267549 (=> (not res!131881) (not e!172950))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267549 (= res!131881 (and (= (size!6507 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6507 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6507 a!3325))))))

(declare-fun b!267550 () Bool)

(declare-fun res!131880 () Bool)

(assert (=> b!267550 (=> (not res!131880) (not e!172950))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267550 (= res!131880 (validKeyInArray!0 k!2581))))

(declare-fun b!267551 () Bool)

(assert (=> b!267551 (= e!172950 false)))

(declare-fun lt!134535 () Bool)

(declare-datatypes ((List!3935 0))(
  ( (Nil!3932) (Cons!3931 (h!4598 (_ BitVec 64)) (t!9008 List!3935)) )
))
(declare-fun arrayNoDuplicates!0 (array!13010 (_ BitVec 32) List!3935) Bool)

(assert (=> b!267551 (= lt!134535 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3932))))

(assert (= (and start!25924 res!131879) b!267549))

(assert (= (and b!267549 res!131881) b!267550))

(assert (= (and b!267550 res!131880) b!267551))

(declare-fun m!283405 () Bool)

(assert (=> start!25924 m!283405))

(declare-fun m!283407 () Bool)

(assert (=> start!25924 m!283407))

(declare-fun m!283409 () Bool)

(assert (=> b!267550 m!283409))

(declare-fun m!283411 () Bool)

(assert (=> b!267551 m!283411))

(push 1)

(assert (not start!25924))

(assert (not b!267551))

(assert (not b!267550))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

