; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28616 () Bool)

(assert start!28616)

(declare-fun res!153571 () Bool)

(declare-fun e!185005 () Bool)

(assert (=> start!28616 (=> (not res!153571) (not e!185005))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28616 (= res!153571 (validMask!0 mask!3809))))

(assert (=> start!28616 e!185005))

(assert (=> start!28616 true))

(declare-datatypes ((array!14788 0))(
  ( (array!14789 (arr!7017 (Array (_ BitVec 32) (_ BitVec 64))) (size!7370 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14788)

(declare-fun array_inv!4989 (array!14788) Bool)

(assert (=> start!28616 (array_inv!4989 a!3312)))

(declare-fun b!292458 () Bool)

(declare-fun res!153570 () Bool)

(assert (=> b!292458 (=> (not res!153570) (not e!185005))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292458 (= res!153570 (validKeyInArray!0 k0!2524))))

(declare-fun b!292459 () Bool)

(declare-fun res!153568 () Bool)

(assert (=> b!292459 (=> (not res!153568) (not e!185005))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292459 (= res!153568 (and (= (size!7370 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7370 a!3312))))))

(declare-fun b!292460 () Bool)

(declare-fun e!185007 () Bool)

(assert (=> b!292460 (= e!185007 false)))

(declare-datatypes ((SeekEntryResult!2165 0))(
  ( (MissingZero!2165 (index!10830 (_ BitVec 32))) (Found!2165 (index!10831 (_ BitVec 32))) (Intermediate!2165 (undefined!2977 Bool) (index!10832 (_ BitVec 32)) (x!29035 (_ BitVec 32))) (Undefined!2165) (MissingVacant!2165 (index!10833 (_ BitVec 32))) )
))
(declare-fun lt!144773 () SeekEntryResult!2165)

(declare-fun lt!144772 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14788 (_ BitVec 32)) SeekEntryResult!2165)

(assert (=> b!292460 (= lt!144773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144772 k0!2524 (array!14789 (store (arr!7017 a!3312) i!1256 k0!2524) (size!7370 a!3312)) mask!3809))))

(declare-fun lt!144774 () SeekEntryResult!2165)

(assert (=> b!292460 (= lt!144774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144772 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292460 (= lt!144772 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292461 () Bool)

(declare-fun res!153566 () Bool)

(assert (=> b!292461 (=> (not res!153566) (not e!185005))))

(declare-fun arrayContainsKey!0 (array!14788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292461 (= res!153566 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292462 () Bool)

(declare-fun res!153567 () Bool)

(assert (=> b!292462 (=> (not res!153567) (not e!185007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14788 (_ BitVec 32)) Bool)

(assert (=> b!292462 (= res!153567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292463 () Bool)

(assert (=> b!292463 (= e!185005 e!185007)))

(declare-fun res!153569 () Bool)

(assert (=> b!292463 (=> (not res!153569) (not e!185007))))

(declare-fun lt!144771 () SeekEntryResult!2165)

(assert (=> b!292463 (= res!153569 (or (= lt!144771 (MissingZero!2165 i!1256)) (= lt!144771 (MissingVacant!2165 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14788 (_ BitVec 32)) SeekEntryResult!2165)

(assert (=> b!292463 (= lt!144771 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28616 res!153571) b!292459))

(assert (= (and b!292459 res!153568) b!292458))

(assert (= (and b!292458 res!153570) b!292461))

(assert (= (and b!292461 res!153566) b!292463))

(assert (= (and b!292463 res!153569) b!292462))

(assert (= (and b!292462 res!153567) b!292460))

(declare-fun m!305765 () Bool)

(assert (=> b!292460 m!305765))

(declare-fun m!305767 () Bool)

(assert (=> b!292460 m!305767))

(declare-fun m!305769 () Bool)

(assert (=> b!292460 m!305769))

(declare-fun m!305771 () Bool)

(assert (=> b!292460 m!305771))

(declare-fun m!305773 () Bool)

(assert (=> b!292458 m!305773))

(declare-fun m!305775 () Bool)

(assert (=> b!292461 m!305775))

(declare-fun m!305777 () Bool)

(assert (=> b!292462 m!305777))

(declare-fun m!305779 () Bool)

(assert (=> start!28616 m!305779))

(declare-fun m!305781 () Bool)

(assert (=> start!28616 m!305781))

(declare-fun m!305783 () Bool)

(assert (=> b!292463 m!305783))

(check-sat (not b!292463) (not b!292462) (not b!292460) (not b!292461) (not start!28616) (not b!292458))
(check-sat)
