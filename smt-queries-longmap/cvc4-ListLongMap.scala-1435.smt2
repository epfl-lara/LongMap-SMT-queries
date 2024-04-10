; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27778 () Bool)

(assert start!27778)

(declare-fun b!286094 () Bool)

(declare-fun e!181313 () Bool)

(assert (=> b!286094 (= e!181313 false)))

(declare-datatypes ((SeekEntryResult!1933 0))(
  ( (MissingZero!1933 (index!9902 (_ BitVec 32))) (Found!1933 (index!9903 (_ BitVec 32))) (Intermediate!1933 (undefined!2745 Bool) (index!9904 (_ BitVec 32)) (x!28125 (_ BitVec 32))) (Undefined!1933) (MissingVacant!1933 (index!9905 (_ BitVec 32))) )
))
(declare-fun lt!141004 () SeekEntryResult!1933)

(declare-datatypes ((array!14299 0))(
  ( (array!14300 (arr!6784 (Array (_ BitVec 32) (_ BitVec 64))) (size!7136 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14299)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14299 (_ BitVec 32)) SeekEntryResult!1933)

(assert (=> b!286094 (= lt!141004 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286092 () Bool)

(declare-fun res!148245 () Bool)

(assert (=> b!286092 (=> (not res!148245) (not e!181313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286092 (= res!148245 (validKeyInArray!0 k!2524))))

(declare-fun res!148242 () Bool)

(assert (=> start!27778 (=> (not res!148242) (not e!181313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27778 (= res!148242 (validMask!0 mask!3809))))

(assert (=> start!27778 e!181313))

(assert (=> start!27778 true))

(declare-fun array_inv!4747 (array!14299) Bool)

(assert (=> start!27778 (array_inv!4747 a!3312)))

(declare-fun b!286093 () Bool)

(declare-fun res!148244 () Bool)

(assert (=> b!286093 (=> (not res!148244) (not e!181313))))

(declare-fun arrayContainsKey!0 (array!14299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286093 (= res!148244 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286091 () Bool)

(declare-fun res!148243 () Bool)

(assert (=> b!286091 (=> (not res!148243) (not e!181313))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286091 (= res!148243 (and (= (size!7136 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7136 a!3312))))))

(assert (= (and start!27778 res!148242) b!286091))

(assert (= (and b!286091 res!148243) b!286092))

(assert (= (and b!286092 res!148245) b!286093))

(assert (= (and b!286093 res!148244) b!286094))

(declare-fun m!300845 () Bool)

(assert (=> b!286094 m!300845))

(declare-fun m!300847 () Bool)

(assert (=> b!286092 m!300847))

(declare-fun m!300849 () Bool)

(assert (=> start!27778 m!300849))

(declare-fun m!300851 () Bool)

(assert (=> start!27778 m!300851))

(declare-fun m!300853 () Bool)

(assert (=> b!286093 m!300853))

(push 1)

(assert (not b!286094))

(assert (not b!286092))

(assert (not b!286093))

(assert (not start!27778))

