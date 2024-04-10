; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25846 () Bool)

(assert start!25846)

(declare-fun b!267489 () Bool)

(declare-fun e!172906 () Bool)

(declare-fun e!172907 () Bool)

(assert (=> b!267489 (= e!172906 e!172907)))

(declare-fun res!131787 () Bool)

(assert (=> b!267489 (=> res!131787 e!172907)))

(declare-datatypes ((List!3956 0))(
  ( (Nil!3953) (Cons!3952 (h!4619 (_ BitVec 64)) (t!9038 List!3956)) )
))
(declare-fun contains!1925 (List!3956 (_ BitVec 64)) Bool)

(assert (=> b!267489 (= res!131787 (contains!1925 Nil!3953 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!267491 () Bool)

(declare-fun res!131785 () Bool)

(assert (=> b!267491 (=> (not res!131785) (not e!172906))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267491 (= res!131785 (validKeyInArray!0 k!2581))))

(declare-fun b!267492 () Bool)

(declare-fun res!131786 () Bool)

(assert (=> b!267492 (=> (not res!131786) (not e!172906))))

(declare-fun noDuplicate!115 (List!3956) Bool)

(assert (=> b!267492 (= res!131786 (noDuplicate!115 Nil!3953))))

(declare-fun b!267493 () Bool)

(declare-fun res!131788 () Bool)

(assert (=> b!267493 (=> (not res!131788) (not e!172906))))

(declare-datatypes ((array!12991 0))(
  ( (array!12992 (arr!6148 (Array (_ BitVec 32) (_ BitVec 64))) (size!6500 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12991)

(assert (=> b!267493 (= res!131788 (and (bvsle #b00000000000000000000000000000000 (size!6500 a!3325)) (bvslt (size!6500 a!3325) #b01111111111111111111111111111111)))))

(declare-fun b!267494 () Bool)

(declare-fun res!131790 () Bool)

(assert (=> b!267494 (=> (not res!131790) (not e!172906))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267494 (= res!131790 (and (= (size!6500 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6500 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6500 a!3325))))))

(declare-fun res!131789 () Bool)

(assert (=> start!25846 (=> (not res!131789) (not e!172906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25846 (= res!131789 (validMask!0 mask!3868))))

(assert (=> start!25846 e!172906))

(declare-fun array_inv!4111 (array!12991) Bool)

(assert (=> start!25846 (array_inv!4111 a!3325)))

(assert (=> start!25846 true))

(declare-fun b!267490 () Bool)

(assert (=> b!267490 (= e!172907 (contains!1925 Nil!3953 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!25846 res!131789) b!267494))

(assert (= (and b!267494 res!131790) b!267491))

(assert (= (and b!267491 res!131785) b!267493))

(assert (= (and b!267493 res!131788) b!267492))

(assert (= (and b!267492 res!131786) b!267489))

(assert (= (and b!267489 (not res!131787)) b!267490))

(declare-fun m!283839 () Bool)

(assert (=> b!267491 m!283839))

(declare-fun m!283841 () Bool)

(assert (=> b!267489 m!283841))

(declare-fun m!283843 () Bool)

(assert (=> start!25846 m!283843))

(declare-fun m!283845 () Bool)

(assert (=> start!25846 m!283845))

(declare-fun m!283847 () Bool)

(assert (=> b!267492 m!283847))

(declare-fun m!283849 () Bool)

(assert (=> b!267490 m!283849))

(push 1)

(assert (not start!25846))

(assert (not b!267491))

(assert (not b!267490))

(assert (not b!267489))

(assert (not b!267492))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64357 () Bool)

(declare-fun lt!134695 () Bool)

(declare-fun content!183 (List!3956) (Set (_ BitVec 64)))

(assert (=> d!64357 (= lt!134695 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!183 Nil!3953)))))

(declare-fun e!172925 () Bool)

(assert (=> d!64357 (= lt!134695 e!172925)))

(declare-fun res!131807 () Bool)

