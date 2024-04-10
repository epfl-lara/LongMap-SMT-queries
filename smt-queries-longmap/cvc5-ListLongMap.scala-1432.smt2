; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27756 () Bool)

(assert start!27756)

(declare-fun b!285953 () Bool)

(declare-fun e!181247 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!285953 (= e!181247 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun b!285951 () Bool)

(declare-fun res!148103 () Bool)

(assert (=> b!285951 (=> (not res!148103) (not e!181247))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285951 (= res!148103 (validKeyInArray!0 k!2524))))

(declare-fun b!285952 () Bool)

(declare-fun res!148102 () Bool)

(assert (=> b!285952 (=> (not res!148102) (not e!181247))))

(declare-datatypes ((array!14277 0))(
  ( (array!14278 (arr!6773 (Array (_ BitVec 32) (_ BitVec 64))) (size!7125 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14277)

(declare-fun arrayContainsKey!0 (array!14277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285952 (= res!148102 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!285950 () Bool)

(declare-fun res!148104 () Bool)

(assert (=> b!285950 (=> (not res!148104) (not e!181247))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!285950 (= res!148104 (and (= (size!7125 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7125 a!3312))))))

(declare-fun res!148101 () Bool)

(assert (=> start!27756 (=> (not res!148101) (not e!181247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27756 (= res!148101 (validMask!0 mask!3809))))

(assert (=> start!27756 e!181247))

(assert (=> start!27756 true))

(declare-fun array_inv!4736 (array!14277) Bool)

(assert (=> start!27756 (array_inv!4736 a!3312)))

(assert (= (and start!27756 res!148101) b!285950))

(assert (= (and b!285950 res!148104) b!285951))

(assert (= (and b!285951 res!148103) b!285952))

(assert (= (and b!285952 res!148102) b!285953))

(declare-fun m!300741 () Bool)

(assert (=> b!285951 m!300741))

(declare-fun m!300743 () Bool)

(assert (=> b!285952 m!300743))

(declare-fun m!300745 () Bool)

(assert (=> start!27756 m!300745))

(declare-fun m!300747 () Bool)

(assert (=> start!27756 m!300747))

(push 1)

(assert (not b!285951))

