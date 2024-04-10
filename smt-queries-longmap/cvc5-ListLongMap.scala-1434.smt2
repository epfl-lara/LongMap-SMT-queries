; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27768 () Bool)

(assert start!27768)

(declare-fun b!286024 () Bool)

(declare-fun res!148178 () Bool)

(declare-fun e!181282 () Bool)

(assert (=> b!286024 (=> (not res!148178) (not e!181282))))

(declare-datatypes ((array!14289 0))(
  ( (array!14290 (arr!6779 (Array (_ BitVec 32) (_ BitVec 64))) (size!7131 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14289)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286024 (= res!148178 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286025 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286025 (= e!181282 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun b!286026 () Bool)

(declare-fun res!148177 () Bool)

(assert (=> b!286026 (=> (not res!148177) (not e!181282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286026 (= res!148177 (validKeyInArray!0 k!2524))))

(declare-fun res!148176 () Bool)

(assert (=> start!27768 (=> (not res!148176) (not e!181282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27768 (= res!148176 (validMask!0 mask!3809))))

(assert (=> start!27768 e!181282))

(assert (=> start!27768 true))

(declare-fun array_inv!4742 (array!14289) Bool)

(assert (=> start!27768 (array_inv!4742 a!3312)))

(declare-fun b!286027 () Bool)

(declare-fun res!148175 () Bool)

(assert (=> b!286027 (=> (not res!148175) (not e!181282))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1928 0))(
  ( (MissingZero!1928 (index!9882 (_ BitVec 32))) (Found!1928 (index!9883 (_ BitVec 32))) (Intermediate!1928 (undefined!2740 Bool) (index!9884 (_ BitVec 32)) (x!28112 (_ BitVec 32))) (Undefined!1928) (MissingVacant!1928 (index!9885 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14289 (_ BitVec 32)) SeekEntryResult!1928)

(assert (=> b!286027 (= res!148175 (not (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) (MissingZero!1928 i!1256))))))

(declare-fun b!286028 () Bool)

(declare-fun res!148179 () Bool)

(assert (=> b!286028 (=> (not res!148179) (not e!181282))))

(assert (=> b!286028 (= res!148179 (and (= (size!7131 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7131 a!3312))))))

(assert (= (and start!27768 res!148176) b!286028))

(assert (= (and b!286028 res!148179) b!286026))

(assert (= (and b!286026 res!148177) b!286024))

(assert (= (and b!286024 res!148178) b!286027))

(assert (= (and b!286027 res!148175) b!286025))

(declare-fun m!300795 () Bool)

(assert (=> b!286024 m!300795))

(declare-fun m!300797 () Bool)

(assert (=> b!286026 m!300797))

(declare-fun m!300799 () Bool)

(assert (=> start!27768 m!300799))

(declare-fun m!300801 () Bool)

(assert (=> start!27768 m!300801))

(declare-fun m!300803 () Bool)

(assert (=> b!286027 m!300803))

(push 1)

(assert (not b!286024))

(assert (not start!27768))

(assert (not b!286026))

(assert (not b!286027))

(check-sat)

(pop 1)

