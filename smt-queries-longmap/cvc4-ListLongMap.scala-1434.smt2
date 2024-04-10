; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27772 () Bool)

(assert start!27772)

(declare-fun b!286054 () Bool)

(declare-fun res!148206 () Bool)

(declare-fun e!181294 () Bool)

(assert (=> b!286054 (=> (not res!148206) (not e!181294))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286054 (= res!148206 (validKeyInArray!0 k!2524))))

(declare-fun b!286055 () Bool)

(declare-fun res!148209 () Bool)

(assert (=> b!286055 (=> (not res!148209) (not e!181294))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14293 0))(
  ( (array!14294 (arr!6781 (Array (_ BitVec 32) (_ BitVec 64))) (size!7133 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14293)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286055 (= res!148209 (and (= (size!7133 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7133 a!3312))))))

(declare-fun b!286056 () Bool)

(declare-fun res!148205 () Bool)

(assert (=> b!286056 (=> (not res!148205) (not e!181294))))

(declare-fun arrayContainsKey!0 (array!14293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286056 (= res!148205 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148207 () Bool)

(assert (=> start!27772 (=> (not res!148207) (not e!181294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27772 (= res!148207 (validMask!0 mask!3809))))

(assert (=> start!27772 e!181294))

(assert (=> start!27772 true))

(declare-fun array_inv!4744 (array!14293) Bool)

(assert (=> start!27772 (array_inv!4744 a!3312)))

(declare-fun b!286057 () Bool)

(assert (=> b!286057 (= e!181294 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun b!286058 () Bool)

(declare-fun res!148208 () Bool)

(assert (=> b!286058 (=> (not res!148208) (not e!181294))))

(declare-datatypes ((SeekEntryResult!1930 0))(
  ( (MissingZero!1930 (index!9890 (_ BitVec 32))) (Found!1930 (index!9891 (_ BitVec 32))) (Intermediate!1930 (undefined!2742 Bool) (index!9892 (_ BitVec 32)) (x!28114 (_ BitVec 32))) (Undefined!1930) (MissingVacant!1930 (index!9893 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14293 (_ BitVec 32)) SeekEntryResult!1930)

(assert (=> b!286058 (= res!148208 (not (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) (MissingZero!1930 i!1256))))))

(assert (= (and start!27772 res!148207) b!286055))

(assert (= (and b!286055 res!148209) b!286054))

(assert (= (and b!286054 res!148206) b!286056))

(assert (= (and b!286056 res!148205) b!286058))

(assert (= (and b!286058 res!148208) b!286057))

(declare-fun m!300815 () Bool)

(assert (=> b!286054 m!300815))

(declare-fun m!300817 () Bool)

(assert (=> b!286056 m!300817))

(declare-fun m!300819 () Bool)

(assert (=> start!27772 m!300819))

(declare-fun m!300821 () Bool)

(assert (=> start!27772 m!300821))

(declare-fun m!300823 () Bool)

(assert (=> b!286058 m!300823))

(push 1)

(assert (not b!286058))

(assert (not b!286054))

(assert (not start!27772))

(assert (not b!286056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

