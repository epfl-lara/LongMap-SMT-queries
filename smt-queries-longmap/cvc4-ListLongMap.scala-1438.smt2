; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27786 () Bool)

(assert start!27786)

(declare-fun b!286235 () Bool)

(declare-fun res!148359 () Bool)

(declare-fun e!181385 () Bool)

(assert (=> b!286235 (=> (not res!148359) (not e!181385))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286235 (= res!148359 (validKeyInArray!0 k!2524))))

(declare-fun res!148361 () Bool)

(assert (=> start!27786 (=> (not res!148361) (not e!181385))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27786 (= res!148361 (validMask!0 mask!3809))))

(assert (=> start!27786 e!181385))

(assert (=> start!27786 true))

(declare-datatypes ((array!14312 0))(
  ( (array!14313 (arr!6791 (Array (_ BitVec 32) (_ BitVec 64))) (size!7143 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14312)

(declare-fun array_inv!4741 (array!14312) Bool)

(assert (=> start!27786 (array_inv!4741 a!3312)))

(declare-fun b!286236 () Bool)

(declare-fun res!148360 () Bool)

(assert (=> b!286236 (=> (not res!148360) (not e!181385))))

(declare-fun arrayContainsKey!0 (array!14312 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286236 (= res!148360 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286234 () Bool)

(declare-fun res!148362 () Bool)

(assert (=> b!286234 (=> (not res!148362) (not e!181385))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286234 (= res!148362 (and (= (size!7143 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7143 a!3312))))))

(declare-fun b!286237 () Bool)

(assert (=> b!286237 (= e!181385 false)))

(declare-datatypes ((SeekEntryResult!1905 0))(
  ( (MissingZero!1905 (index!9790 (_ BitVec 32))) (Found!1905 (index!9791 (_ BitVec 32))) (Intermediate!1905 (undefined!2717 Bool) (index!9792 (_ BitVec 32)) (x!28121 (_ BitVec 32))) (Undefined!1905) (MissingVacant!1905 (index!9793 (_ BitVec 32))) )
))
(declare-fun lt!141087 () SeekEntryResult!1905)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14312 (_ BitVec 32)) SeekEntryResult!1905)

(assert (=> b!286237 (= lt!141087 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!27786 res!148361) b!286234))

(assert (= (and b!286234 res!148362) b!286235))

(assert (= (and b!286235 res!148359) b!286236))

(assert (= (and b!286236 res!148360) b!286237))

(declare-fun m!301131 () Bool)

(assert (=> b!286235 m!301131))

(declare-fun m!301133 () Bool)

(assert (=> start!27786 m!301133))

(declare-fun m!301135 () Bool)

(assert (=> start!27786 m!301135))

(declare-fun m!301137 () Bool)

(assert (=> b!286236 m!301137))

(declare-fun m!301139 () Bool)

(assert (=> b!286237 m!301139))

(push 1)

(assert (not b!286235))

(assert (not start!27786))

(assert (not b!286236))

(assert (not b!286237))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

