; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27766 () Bool)

(assert start!27766)

(declare-fun res!148162 () Bool)

(declare-fun e!181276 () Bool)

(assert (=> start!27766 (=> (not res!148162) (not e!181276))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27766 (= res!148162 (validMask!0 mask!3809))))

(assert (=> start!27766 e!181276))

(assert (=> start!27766 true))

(declare-datatypes ((array!14287 0))(
  ( (array!14288 (arr!6778 (Array (_ BitVec 32) (_ BitVec 64))) (size!7130 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14287)

(declare-fun array_inv!4741 (array!14287) Bool)

(assert (=> start!27766 (array_inv!4741 a!3312)))

(declare-fun b!286011 () Bool)

(declare-fun res!148163 () Bool)

(assert (=> b!286011 (=> (not res!148163) (not e!181276))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286011 (= res!148163 (validKeyInArray!0 k!2524))))

(declare-fun b!286010 () Bool)

(declare-fun res!148164 () Bool)

(assert (=> b!286010 (=> (not res!148164) (not e!181276))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286010 (= res!148164 (and (= (size!7130 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7130 a!3312))))))

(declare-fun b!286013 () Bool)

(assert (=> b!286013 (= e!181276 false)))

(declare-datatypes ((SeekEntryResult!1927 0))(
  ( (MissingZero!1927 (index!9878 (_ BitVec 32))) (Found!1927 (index!9879 (_ BitVec 32))) (Intermediate!1927 (undefined!2739 Bool) (index!9880 (_ BitVec 32)) (x!28103 (_ BitVec 32))) (Undefined!1927) (MissingVacant!1927 (index!9881 (_ BitVec 32))) )
))
(declare-fun lt!140995 () SeekEntryResult!1927)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14287 (_ BitVec 32)) SeekEntryResult!1927)

(assert (=> b!286013 (= lt!140995 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286012 () Bool)

(declare-fun res!148161 () Bool)

(assert (=> b!286012 (=> (not res!148161) (not e!181276))))

(declare-fun arrayContainsKey!0 (array!14287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286012 (= res!148161 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27766 res!148162) b!286010))

(assert (= (and b!286010 res!148164) b!286011))

(assert (= (and b!286011 res!148163) b!286012))

(assert (= (and b!286012 res!148161) b!286013))

(declare-fun m!300785 () Bool)

(assert (=> start!27766 m!300785))

(declare-fun m!300787 () Bool)

(assert (=> start!27766 m!300787))

(declare-fun m!300789 () Bool)

(assert (=> b!286011 m!300789))

(declare-fun m!300791 () Bool)

(assert (=> b!286013 m!300791))

(declare-fun m!300793 () Bool)

(assert (=> b!286012 m!300793))

(push 1)

(assert (not b!286011))

(assert (not start!27766))

