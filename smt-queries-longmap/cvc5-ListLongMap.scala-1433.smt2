; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27762 () Bool)

(assert start!27762)

(declare-fun res!148066 () Bool)

(declare-fun e!181176 () Bool)

(assert (=> start!27762 (=> (not res!148066) (not e!181176))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27762 (= res!148066 (validMask!0 mask!3809))))

(assert (=> start!27762 e!181176))

(assert (=> start!27762 true))

(declare-datatypes ((array!14276 0))(
  ( (array!14277 (arr!6773 (Array (_ BitVec 32) (_ BitVec 64))) (size!7126 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14276)

(declare-fun array_inv!4745 (array!14276) Bool)

(assert (=> start!27762 (array_inv!4745 a!3312)))

(declare-fun b!285866 () Bool)

(assert (=> b!285866 (= e!181176 false)))

(declare-fun k!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1921 0))(
  ( (MissingZero!1921 (index!9854 (_ BitVec 32))) (Found!1921 (index!9855 (_ BitVec 32))) (Intermediate!1921 (undefined!2733 Bool) (index!9856 (_ BitVec 32)) (x!28096 (_ BitVec 32))) (Undefined!1921) (MissingVacant!1921 (index!9857 (_ BitVec 32))) )
))
(declare-fun lt!140814 () SeekEntryResult!1921)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14276 (_ BitVec 32)) SeekEntryResult!1921)

(assert (=> b!285866 (= lt!140814 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!285865 () Bool)

(declare-fun res!148069 () Bool)

(assert (=> b!285865 (=> (not res!148069) (not e!181176))))

(declare-fun arrayContainsKey!0 (array!14276 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285865 (= res!148069 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!285864 () Bool)

(declare-fun res!148068 () Bool)

(assert (=> b!285864 (=> (not res!148068) (not e!181176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285864 (= res!148068 (validKeyInArray!0 k!2524))))

(declare-fun b!285863 () Bool)

(declare-fun res!148067 () Bool)

(assert (=> b!285863 (=> (not res!148067) (not e!181176))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!285863 (= res!148067 (and (= (size!7126 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7126 a!3312))))))

(assert (= (and start!27762 res!148066) b!285863))

(assert (= (and b!285863 res!148067) b!285864))

(assert (= (and b!285864 res!148068) b!285865))

(assert (= (and b!285865 res!148069) b!285866))

(declare-fun m!300193 () Bool)

(assert (=> start!27762 m!300193))

(declare-fun m!300195 () Bool)

(assert (=> start!27762 m!300195))

(declare-fun m!300197 () Bool)

(assert (=> b!285866 m!300197))

(declare-fun m!300199 () Bool)

(assert (=> b!285865 m!300199))

(declare-fun m!300201 () Bool)

(assert (=> b!285864 m!300201))

(push 1)

(assert (not b!285865))

(assert (not start!27762))

(assert (not b!285864))

(assert (not b!285866))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

