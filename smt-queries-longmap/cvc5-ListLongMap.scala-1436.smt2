; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27780 () Bool)

(assert start!27780)

(declare-fun b!285980 () Bool)

(declare-fun res!148183 () Bool)

(declare-fun e!181230 () Bool)

(assert (=> b!285980 (=> (not res!148183) (not e!181230))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14294 0))(
  ( (array!14295 (arr!6782 (Array (_ BitVec 32) (_ BitVec 64))) (size!7135 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14294)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!285980 (= res!148183 (and (= (size!7135 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7135 a!3312))))))

(declare-fun res!148185 () Bool)

(assert (=> start!27780 (=> (not res!148185) (not e!181230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27780 (= res!148185 (validMask!0 mask!3809))))

(assert (=> start!27780 e!181230))

(assert (=> start!27780 true))

(declare-fun array_inv!4754 (array!14294) Bool)

(assert (=> start!27780 (array_inv!4754 a!3312)))

(declare-fun b!285981 () Bool)

(declare-fun res!148186 () Bool)

(assert (=> b!285981 (=> (not res!148186) (not e!181230))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285981 (= res!148186 (validKeyInArray!0 k!2524))))

(declare-fun b!285982 () Bool)

(declare-fun res!148184 () Bool)

(assert (=> b!285982 (=> (not res!148184) (not e!181230))))

(declare-fun arrayContainsKey!0 (array!14294 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285982 (= res!148184 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!285983 () Bool)

(assert (=> b!285983 (= e!181230 false)))

(declare-datatypes ((SeekEntryResult!1930 0))(
  ( (MissingZero!1930 (index!9890 (_ BitVec 32))) (Found!1930 (index!9891 (_ BitVec 32))) (Intermediate!1930 (undefined!2742 Bool) (index!9892 (_ BitVec 32)) (x!28129 (_ BitVec 32))) (Undefined!1930) (MissingVacant!1930 (index!9893 (_ BitVec 32))) )
))
(declare-fun lt!140832 () SeekEntryResult!1930)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14294 (_ BitVec 32)) SeekEntryResult!1930)

(assert (=> b!285983 (= lt!140832 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!27780 res!148185) b!285980))

(assert (= (and b!285980 res!148183) b!285981))

(assert (= (and b!285981 res!148186) b!285982))

(assert (= (and b!285982 res!148184) b!285983))

(declare-fun m!300283 () Bool)

(assert (=> start!27780 m!300283))

(declare-fun m!300285 () Bool)

(assert (=> start!27780 m!300285))

(declare-fun m!300287 () Bool)

(assert (=> b!285981 m!300287))

(declare-fun m!300289 () Bool)

(assert (=> b!285982 m!300289))

(declare-fun m!300291 () Bool)

(assert (=> b!285983 m!300291))

(push 1)

(assert (not b!285981))

(assert (not b!285983))

(assert (not b!285982))

(assert (not start!27780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

