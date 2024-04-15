; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27764 () Bool)

(assert start!27764)

(declare-fun b!285877 () Bool)

(declare-fun res!148082 () Bool)

(declare-fun e!181181 () Bool)

(assert (=> b!285877 (=> (not res!148082) (not e!181181))))

(declare-datatypes ((array!14278 0))(
  ( (array!14279 (arr!6774 (Array (_ BitVec 32) (_ BitVec 64))) (size!7127 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14278)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14278 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285877 (= res!148082 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148084 () Bool)

(assert (=> start!27764 (=> (not res!148084) (not e!181181))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27764 (= res!148084 (validMask!0 mask!3809))))

(assert (=> start!27764 e!181181))

(assert (=> start!27764 true))

(declare-fun array_inv!4746 (array!14278) Bool)

(assert (=> start!27764 (array_inv!4746 a!3312)))

(declare-fun b!285878 () Bool)

(assert (=> b!285878 (= e!181181 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun b!285879 () Bool)

(declare-fun res!148081 () Bool)

(assert (=> b!285879 (=> (not res!148081) (not e!181181))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1922 0))(
  ( (MissingZero!1922 (index!9858 (_ BitVec 32))) (Found!1922 (index!9859 (_ BitVec 32))) (Intermediate!1922 (undefined!2734 Bool) (index!9860 (_ BitVec 32)) (x!28105 (_ BitVec 32))) (Undefined!1922) (MissingVacant!1922 (index!9861 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14278 (_ BitVec 32)) SeekEntryResult!1922)

(assert (=> b!285879 (= res!148081 (not (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) (MissingZero!1922 i!1256))))))

(declare-fun b!285880 () Bool)

(declare-fun res!148083 () Bool)

(assert (=> b!285880 (=> (not res!148083) (not e!181181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285880 (= res!148083 (validKeyInArray!0 k0!2524))))

(declare-fun b!285881 () Bool)

(declare-fun res!148080 () Bool)

(assert (=> b!285881 (=> (not res!148080) (not e!181181))))

(assert (=> b!285881 (= res!148080 (and (= (size!7127 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7127 a!3312))))))

(assert (= (and start!27764 res!148084) b!285881))

(assert (= (and b!285881 res!148080) b!285880))

(assert (= (and b!285880 res!148083) b!285877))

(assert (= (and b!285877 res!148082) b!285879))

(assert (= (and b!285879 res!148081) b!285878))

(declare-fun m!300203 () Bool)

(assert (=> b!285877 m!300203))

(declare-fun m!300205 () Bool)

(assert (=> start!27764 m!300205))

(declare-fun m!300207 () Bool)

(assert (=> start!27764 m!300207))

(declare-fun m!300209 () Bool)

(assert (=> b!285879 m!300209))

(declare-fun m!300211 () Bool)

(assert (=> b!285880 m!300211))

(check-sat (not b!285879) (not b!285880) (not start!27764) (not b!285877))
(check-sat)
