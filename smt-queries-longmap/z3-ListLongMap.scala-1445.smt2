; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27872 () Bool)

(assert start!27872)

(declare-fun b!286629 () Bool)

(declare-fun res!148710 () Bool)

(declare-fun e!181601 () Bool)

(assert (=> b!286629 (=> (not res!148710) (not e!181601))))

(declare-datatypes ((array!14360 0))(
  ( (array!14361 (arr!6813 (Array (_ BitVec 32) (_ BitVec 64))) (size!7165 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14360)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14360 (_ BitVec 32)) Bool)

(assert (=> b!286629 (= res!148710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!148712 () Bool)

(declare-fun e!181599 () Bool)

(assert (=> start!27872 (=> (not res!148712) (not e!181599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27872 (= res!148712 (validMask!0 mask!3809))))

(assert (=> start!27872 e!181599))

(assert (=> start!27872 true))

(declare-fun array_inv!4776 (array!14360) Bool)

(assert (=> start!27872 (array_inv!4776 a!3312)))

(declare-fun b!286630 () Bool)

(assert (=> b!286630 (= e!181599 e!181601)))

(declare-fun res!148713 () Bool)

(assert (=> b!286630 (=> (not res!148713) (not e!181601))))

(declare-datatypes ((SeekEntryResult!1962 0))(
  ( (MissingZero!1962 (index!10018 (_ BitVec 32))) (Found!1962 (index!10019 (_ BitVec 32))) (Intermediate!1962 (undefined!2774 Bool) (index!10020 (_ BitVec 32)) (x!28234 (_ BitVec 32))) (Undefined!1962) (MissingVacant!1962 (index!10021 (_ BitVec 32))) )
))
(declare-fun lt!141169 () SeekEntryResult!1962)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286630 (= res!148713 (or (= lt!141169 (MissingZero!1962 i!1256)) (= lt!141169 (MissingVacant!1962 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14360 (_ BitVec 32)) SeekEntryResult!1962)

(assert (=> b!286630 (= lt!141169 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286631 () Bool)

(declare-fun res!148708 () Bool)

(assert (=> b!286631 (=> (not res!148708) (not e!181599))))

(declare-fun arrayContainsKey!0 (array!14360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286631 (= res!148708 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286632 () Bool)

(declare-fun res!148709 () Bool)

(assert (=> b!286632 (=> (not res!148709) (not e!181599))))

(assert (=> b!286632 (= res!148709 (and (= (size!7165 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7165 a!3312))))))

(declare-fun b!286633 () Bool)

(declare-fun res!148711 () Bool)

(assert (=> b!286633 (=> (not res!148711) (not e!181599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286633 (= res!148711 (validKeyInArray!0 k0!2524))))

(declare-fun b!286634 () Bool)

(assert (=> b!286634 (= e!181601 false)))

(declare-fun lt!141168 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286634 (= lt!141168 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!27872 res!148712) b!286632))

(assert (= (and b!286632 res!148709) b!286633))

(assert (= (and b!286633 res!148711) b!286631))

(assert (= (and b!286631 res!148708) b!286630))

(assert (= (and b!286630 res!148713) b!286629))

(assert (= (and b!286629 res!148710) b!286634))

(declare-fun m!301259 () Bool)

(assert (=> b!286633 m!301259))

(declare-fun m!301261 () Bool)

(assert (=> b!286630 m!301261))

(declare-fun m!301263 () Bool)

(assert (=> start!27872 m!301263))

(declare-fun m!301265 () Bool)

(assert (=> start!27872 m!301265))

(declare-fun m!301267 () Bool)

(assert (=> b!286629 m!301267))

(declare-fun m!301269 () Bool)

(assert (=> b!286634 m!301269))

(declare-fun m!301271 () Bool)

(assert (=> b!286631 m!301271))

(check-sat (not b!286631) (not b!286629) (not start!27872) (not b!286630) (not b!286634) (not b!286633))
(check-sat)
