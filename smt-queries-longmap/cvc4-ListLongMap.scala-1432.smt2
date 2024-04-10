; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27760 () Bool)

(assert start!27760)

(declare-fun b!285977 () Bool)

(declare-fun e!181258 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!285977 (= e!181258 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun b!285974 () Bool)

(declare-fun res!148127 () Bool)

(assert (=> b!285974 (=> (not res!148127) (not e!181258))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14281 0))(
  ( (array!14282 (arr!6775 (Array (_ BitVec 32) (_ BitVec 64))) (size!7127 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14281)

(assert (=> b!285974 (= res!148127 (and (= (size!7127 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7127 a!3312))))))

(declare-fun res!148128 () Bool)

(assert (=> start!27760 (=> (not res!148128) (not e!181258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27760 (= res!148128 (validMask!0 mask!3809))))

(assert (=> start!27760 e!181258))

(assert (=> start!27760 true))

(declare-fun array_inv!4738 (array!14281) Bool)

(assert (=> start!27760 (array_inv!4738 a!3312)))

(declare-fun b!285975 () Bool)

(declare-fun res!148126 () Bool)

(assert (=> b!285975 (=> (not res!148126) (not e!181258))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285975 (= res!148126 (validKeyInArray!0 k!2524))))

(declare-fun b!285976 () Bool)

(declare-fun res!148125 () Bool)

(assert (=> b!285976 (=> (not res!148125) (not e!181258))))

(declare-fun arrayContainsKey!0 (array!14281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285976 (= res!148125 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27760 res!148128) b!285974))

(assert (= (and b!285974 res!148127) b!285975))

(assert (= (and b!285975 res!148126) b!285976))

(assert (= (and b!285976 res!148125) b!285977))

(declare-fun m!300757 () Bool)

(assert (=> start!27760 m!300757))

(declare-fun m!300759 () Bool)

(assert (=> start!27760 m!300759))

(declare-fun m!300761 () Bool)

(assert (=> b!285975 m!300761))

(declare-fun m!300763 () Bool)

(assert (=> b!285976 m!300763))

(push 1)

(assert (not b!285976))

(assert (not b!285975))

(assert (not start!27760))

(check-sat)

