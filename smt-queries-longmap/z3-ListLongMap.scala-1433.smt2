; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27764 () Bool)

(assert start!27764)

(declare-fun b!285999 () Bool)

(declare-fun res!148151 () Bool)

(declare-fun e!181270 () Bool)

(assert (=> b!285999 (=> (not res!148151) (not e!181270))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285999 (= res!148151 (validKeyInArray!0 k0!2524))))

(declare-fun b!286001 () Bool)

(assert (=> b!286001 (= e!181270 false)))

(declare-datatypes ((array!14285 0))(
  ( (array!14286 (arr!6777 (Array (_ BitVec 32) (_ BitVec 64))) (size!7129 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14285)

(declare-datatypes ((SeekEntryResult!1926 0))(
  ( (MissingZero!1926 (index!9874 (_ BitVec 32))) (Found!1926 (index!9875 (_ BitVec 32))) (Intermediate!1926 (undefined!2738 Bool) (index!9876 (_ BitVec 32)) (x!28102 (_ BitVec 32))) (Undefined!1926) (MissingVacant!1926 (index!9877 (_ BitVec 32))) )
))
(declare-fun lt!140992 () SeekEntryResult!1926)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14285 (_ BitVec 32)) SeekEntryResult!1926)

(assert (=> b!286001 (= lt!140992 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286000 () Bool)

(declare-fun res!148149 () Bool)

(assert (=> b!286000 (=> (not res!148149) (not e!181270))))

(declare-fun arrayContainsKey!0 (array!14285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286000 (= res!148149 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148152 () Bool)

(assert (=> start!27764 (=> (not res!148152) (not e!181270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27764 (= res!148152 (validMask!0 mask!3809))))

(assert (=> start!27764 e!181270))

(assert (=> start!27764 true))

(declare-fun array_inv!4740 (array!14285) Bool)

(assert (=> start!27764 (array_inv!4740 a!3312)))

(declare-fun b!285998 () Bool)

(declare-fun res!148150 () Bool)

(assert (=> b!285998 (=> (not res!148150) (not e!181270))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!285998 (= res!148150 (and (= (size!7129 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7129 a!3312))))))

(assert (= (and start!27764 res!148152) b!285998))

(assert (= (and b!285998 res!148150) b!285999))

(assert (= (and b!285999 res!148151) b!286000))

(assert (= (and b!286000 res!148149) b!286001))

(declare-fun m!300775 () Bool)

(assert (=> b!285999 m!300775))

(declare-fun m!300777 () Bool)

(assert (=> b!286001 m!300777))

(declare-fun m!300779 () Bool)

(assert (=> b!286000 m!300779))

(declare-fun m!300781 () Bool)

(assert (=> start!27764 m!300781))

(declare-fun m!300783 () Bool)

(assert (=> start!27764 m!300783))

(check-sat (not b!286001) (not b!285999) (not b!286000) (not start!27764))
