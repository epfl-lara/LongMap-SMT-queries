; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27862 () Bool)

(assert start!27862)

(declare-fun b!286658 () Bool)

(declare-fun res!148712 () Bool)

(declare-fun e!181616 () Bool)

(assert (=> b!286658 (=> (not res!148712) (not e!181616))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286658 (= res!148712 (validKeyInArray!0 k0!2524))))

(declare-fun b!286659 () Bool)

(declare-fun res!148713 () Bool)

(assert (=> b!286659 (=> (not res!148713) (not e!181616))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14355 0))(
  ( (array!14356 (arr!6811 (Array (_ BitVec 32) (_ BitVec 64))) (size!7163 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14355)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286659 (= res!148713 (and (= (size!7163 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7163 a!3312))))))

(declare-fun b!286660 () Bool)

(declare-fun e!181614 () Bool)

(assert (=> b!286660 (= e!181616 e!181614)))

(declare-fun res!148711 () Bool)

(assert (=> b!286660 (=> (not res!148711) (not e!181614))))

(declare-datatypes ((SeekEntryResult!1925 0))(
  ( (MissingZero!1925 (index!9870 (_ BitVec 32))) (Found!1925 (index!9871 (_ BitVec 32))) (Intermediate!1925 (undefined!2737 Bool) (index!9872 (_ BitVec 32)) (x!28197 (_ BitVec 32))) (Undefined!1925) (MissingVacant!1925 (index!9873 (_ BitVec 32))) )
))
(declare-fun lt!141222 () SeekEntryResult!1925)

(assert (=> b!286660 (= res!148711 (or (= lt!141222 (MissingZero!1925 i!1256)) (= lt!141222 (MissingVacant!1925 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14355 (_ BitVec 32)) SeekEntryResult!1925)

(assert (=> b!286660 (= lt!141222 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286661 () Bool)

(declare-fun res!148716 () Bool)

(assert (=> b!286661 (=> (not res!148716) (not e!181614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14355 (_ BitVec 32)) Bool)

(assert (=> b!286661 (= res!148716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286662 () Bool)

(assert (=> b!286662 (= e!181614 false)))

(declare-fun lt!141221 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286662 (= lt!141221 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!286663 () Bool)

(declare-fun res!148714 () Bool)

(assert (=> b!286663 (=> (not res!148714) (not e!181616))))

(declare-fun arrayContainsKey!0 (array!14355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286663 (= res!148714 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148715 () Bool)

(assert (=> start!27862 (=> (not res!148715) (not e!181616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27862 (= res!148715 (validMask!0 mask!3809))))

(assert (=> start!27862 e!181616))

(assert (=> start!27862 true))

(declare-fun array_inv!4761 (array!14355) Bool)

(assert (=> start!27862 (array_inv!4761 a!3312)))

(assert (= (and start!27862 res!148715) b!286659))

(assert (= (and b!286659 res!148713) b!286658))

(assert (= (and b!286658 res!148712) b!286663))

(assert (= (and b!286663 res!148714) b!286660))

(assert (= (and b!286660 res!148711) b!286661))

(assert (= (and b!286661 res!148716) b!286662))

(declare-fun m!301451 () Bool)

(assert (=> b!286662 m!301451))

(declare-fun m!301453 () Bool)

(assert (=> b!286661 m!301453))

(declare-fun m!301455 () Bool)

(assert (=> b!286658 m!301455))

(declare-fun m!301457 () Bool)

(assert (=> b!286660 m!301457))

(declare-fun m!301459 () Bool)

(assert (=> start!27862 m!301459))

(declare-fun m!301461 () Bool)

(assert (=> start!27862 m!301461))

(declare-fun m!301463 () Bool)

(assert (=> b!286663 m!301463))

(check-sat (not start!27862) (not b!286663) (not b!286658) (not b!286661) (not b!286660) (not b!286662))
(check-sat)
