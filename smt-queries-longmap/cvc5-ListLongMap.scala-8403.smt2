; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102198 () Bool)

(assert start!102198)

(declare-fun b!1230341 () Bool)

(declare-fun res!818831 () Bool)

(declare-fun e!698076 () Bool)

(assert (=> b!1230341 (=> (not res!818831) (not e!698076))))

(declare-datatypes ((List!27079 0))(
  ( (Nil!27076) (Cons!27075 (h!28284 (_ BitVec 64)) (t!40542 List!27079)) )
))
(declare-fun acc!823 () List!27079)

(declare-fun contains!7141 (List!27079 (_ BitVec 64)) Bool)

(assert (=> b!1230341 (= res!818831 (not (contains!7141 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230342 () Bool)

(declare-fun res!818830 () Bool)

(assert (=> b!1230342 (=> (not res!818830) (not e!698076))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79373 0))(
  ( (array!79374 (arr!38306 (Array (_ BitVec 32) (_ BitVec 64))) (size!38842 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79373)

(assert (=> b!1230342 (= res!818830 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38842 a!3806)) (bvslt from!3184 (size!38842 a!3806))))))

(declare-fun b!1230343 () Bool)

(assert (=> b!1230343 (= e!698076 false)))

(declare-fun lt!559364 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79373 (_ BitVec 32) List!27079) Bool)

(assert (=> b!1230343 (= lt!559364 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230344 () Bool)

(declare-fun res!818833 () Bool)

(assert (=> b!1230344 (=> (not res!818833) (not e!698076))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230344 (= res!818833 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!818827 () Bool)

(assert (=> start!102198 (=> (not res!818827) (not e!698076))))

(assert (=> start!102198 (= res!818827 (bvslt (size!38842 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102198 e!698076))

(declare-fun array_inv!29154 (array!79373) Bool)

(assert (=> start!102198 (array_inv!29154 a!3806)))

(assert (=> start!102198 true))

(declare-fun b!1230345 () Bool)

(declare-fun res!818829 () Bool)

(assert (=> b!1230345 (=> (not res!818829) (not e!698076))))

(assert (=> b!1230345 (= res!818829 (not (contains!7141 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230346 () Bool)

(declare-fun res!818832 () Bool)

(assert (=> b!1230346 (=> (not res!818832) (not e!698076))))

(declare-fun noDuplicate!1738 (List!27079) Bool)

(assert (=> b!1230346 (= res!818832 (noDuplicate!1738 acc!823))))

(declare-fun b!1230347 () Bool)

(declare-fun res!818828 () Bool)

(assert (=> b!1230347 (=> (not res!818828) (not e!698076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230347 (= res!818828 (validKeyInArray!0 k!2913))))

(assert (= (and start!102198 res!818827) b!1230347))

(assert (= (and b!1230347 res!818828) b!1230342))

(assert (= (and b!1230342 res!818830) b!1230346))

(assert (= (and b!1230346 res!818832) b!1230341))

(assert (= (and b!1230341 res!818831) b!1230345))

(assert (= (and b!1230345 res!818829) b!1230344))

(assert (= (and b!1230344 res!818833) b!1230343))

(declare-fun m!1134781 () Bool)

(assert (=> b!1230341 m!1134781))

(declare-fun m!1134783 () Bool)

(assert (=> b!1230343 m!1134783))

(declare-fun m!1134785 () Bool)

(assert (=> b!1230347 m!1134785))

(declare-fun m!1134787 () Bool)

(assert (=> b!1230344 m!1134787))

(declare-fun m!1134789 () Bool)

(assert (=> b!1230345 m!1134789))

(declare-fun m!1134791 () Bool)

(assert (=> b!1230346 m!1134791))

(declare-fun m!1134793 () Bool)

(assert (=> start!102198 m!1134793))

(push 1)

(assert (not b!1230344))

(assert (not start!102198))

(assert (not b!1230346))

(assert (not b!1230347))

(assert (not b!1230343))

(assert (not b!1230341))

(assert (not b!1230345))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

