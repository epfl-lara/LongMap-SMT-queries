; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25924 () Bool)

(assert start!25924)

(declare-fun res!131983 () Bool)

(declare-fun e!173056 () Bool)

(assert (=> start!25924 (=> (not res!131983) (not e!173056))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25924 (= res!131983 (validMask!0 mask!3868))))

(assert (=> start!25924 e!173056))

(declare-datatypes ((array!13021 0))(
  ( (array!13022 (arr!6160 (Array (_ BitVec 32) (_ BitVec 64))) (size!6512 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13021)

(declare-fun array_inv!4123 (array!13021) Bool)

(assert (=> start!25924 (array_inv!4123 a!3325)))

(assert (=> start!25924 true))

(declare-fun b!267705 () Bool)

(declare-fun res!131985 () Bool)

(assert (=> b!267705 (=> (not res!131985) (not e!173056))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267705 (= res!131985 (and (= (size!6512 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6512 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6512 a!3325))))))

(declare-fun b!267706 () Bool)

(declare-fun res!131984 () Bool)

(assert (=> b!267706 (=> (not res!131984) (not e!173056))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267706 (= res!131984 (validKeyInArray!0 k!2581))))

(declare-fun b!267707 () Bool)

(assert (=> b!267707 (= e!173056 false)))

(declare-fun lt!134719 () Bool)

(declare-datatypes ((List!3968 0))(
  ( (Nil!3965) (Cons!3964 (h!4631 (_ BitVec 64)) (t!9050 List!3968)) )
))
(declare-fun arrayNoDuplicates!0 (array!13021 (_ BitVec 32) List!3968) Bool)

(assert (=> b!267707 (= lt!134719 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3965))))

(assert (= (and start!25924 res!131983) b!267705))

(assert (= (and b!267705 res!131985) b!267706))

(assert (= (and b!267706 res!131984) b!267707))

(declare-fun m!284005 () Bool)

(assert (=> start!25924 m!284005))

(declare-fun m!284007 () Bool)

(assert (=> start!25924 m!284007))

(declare-fun m!284009 () Bool)

(assert (=> b!267706 m!284009))

(declare-fun m!284011 () Bool)

(assert (=> b!267707 m!284011))

(push 1)

(assert (not start!25924))

(assert (not b!267707))

(assert (not b!267706))

(check-sat)

(pop 1)

(push 1)

(check-sat)

