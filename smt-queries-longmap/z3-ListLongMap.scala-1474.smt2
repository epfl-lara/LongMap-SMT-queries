; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28222 () Bool)

(assert start!28222)

(declare-fun res!150765 () Bool)

(declare-fun e!183074 () Bool)

(assert (=> start!28222 (=> (not res!150765) (not e!183074))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28222 (= res!150765 (validMask!0 mask!3809))))

(assert (=> start!28222 e!183074))

(assert (=> start!28222 true))

(declare-datatypes ((array!14541 0))(
  ( (array!14542 (arr!6898 (Array (_ BitVec 32) (_ BitVec 64))) (size!7250 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14541)

(declare-fun array_inv!4848 (array!14541) Bool)

(assert (=> start!28222 (array_inv!4848 a!3312)))

(declare-fun b!289164 () Bool)

(declare-fun res!150766 () Bool)

(assert (=> b!289164 (=> (not res!150766) (not e!183074))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289164 (= res!150766 (validKeyInArray!0 k0!2524))))

(declare-fun b!289165 () Bool)

(declare-fun e!183076 () Bool)

(declare-fun e!183073 () Bool)

(assert (=> b!289165 (= e!183076 e!183073)))

(declare-fun res!150768 () Bool)

(assert (=> b!289165 (=> (not res!150768) (not e!183073))))

(declare-datatypes ((SeekEntryResult!2012 0))(
  ( (MissingZero!2012 (index!10218 (_ BitVec 32))) (Found!2012 (index!10219 (_ BitVec 32))) (Intermediate!2012 (undefined!2824 Bool) (index!10220 (_ BitVec 32)) (x!28537 (_ BitVec 32))) (Undefined!2012) (MissingVacant!2012 (index!10221 (_ BitVec 32))) )
))
(declare-fun lt!142652 () SeekEntryResult!2012)

(declare-fun lt!142648 () Bool)

(assert (=> b!289165 (= res!150768 (and (or lt!142648 (not (undefined!2824 lt!142652))) (or lt!142648 (not (= (select (arr!6898 a!3312) (index!10220 lt!142652)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142648 (not (= (select (arr!6898 a!3312) (index!10220 lt!142652)) k0!2524))) (not lt!142648)))))

(get-info :version)

(assert (=> b!289165 (= lt!142648 (not ((_ is Intermediate!2012) lt!142652)))))

(declare-fun b!289166 () Bool)

(declare-fun res!150763 () Bool)

(declare-fun e!183077 () Bool)

(assert (=> b!289166 (=> (not res!150763) (not e!183077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14541 (_ BitVec 32)) Bool)

(assert (=> b!289166 (= res!150763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289167 () Bool)

(assert (=> b!289167 (= e!183073 (not true))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289167 (and (= (select (arr!6898 a!3312) (index!10220 lt!142652)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10220 lt!142652) i!1256))))

(declare-fun b!289168 () Bool)

(declare-fun res!150762 () Bool)

(assert (=> b!289168 (=> (not res!150762) (not e!183074))))

(assert (=> b!289168 (= res!150762 (and (= (size!7250 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7250 a!3312))))))

(declare-fun b!289169 () Bool)

(assert (=> b!289169 (= e!183077 e!183076)))

(declare-fun res!150761 () Bool)

(assert (=> b!289169 (=> (not res!150761) (not e!183076))))

(declare-fun lt!142651 () Bool)

(assert (=> b!289169 (= res!150761 lt!142651)))

(declare-fun lt!142649 () (_ BitVec 32))

(declare-fun lt!142653 () SeekEntryResult!2012)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14541 (_ BitVec 32)) SeekEntryResult!2012)

(assert (=> b!289169 (= lt!142653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142649 k0!2524 (array!14542 (store (arr!6898 a!3312) i!1256 k0!2524) (size!7250 a!3312)) mask!3809))))

(assert (=> b!289169 (= lt!142652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142649 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289169 (= lt!142649 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289170 () Bool)

(assert (=> b!289170 (= e!183074 e!183077)))

(declare-fun res!150767 () Bool)

(assert (=> b!289170 (=> (not res!150767) (not e!183077))))

(declare-fun lt!142650 () SeekEntryResult!2012)

(assert (=> b!289170 (= res!150767 (or lt!142651 (= lt!142650 (MissingVacant!2012 i!1256))))))

(assert (=> b!289170 (= lt!142651 (= lt!142650 (MissingZero!2012 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14541 (_ BitVec 32)) SeekEntryResult!2012)

(assert (=> b!289170 (= lt!142650 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289171 () Bool)

(declare-fun res!150764 () Bool)

(assert (=> b!289171 (=> (not res!150764) (not e!183074))))

(declare-fun arrayContainsKey!0 (array!14541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289171 (= res!150764 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28222 res!150765) b!289168))

(assert (= (and b!289168 res!150762) b!289164))

(assert (= (and b!289164 res!150766) b!289171))

(assert (= (and b!289171 res!150764) b!289170))

(assert (= (and b!289170 res!150767) b!289166))

(assert (= (and b!289166 res!150763) b!289169))

(assert (= (and b!289169 res!150761) b!289165))

(assert (= (and b!289165 res!150768) b!289167))

(declare-fun m!303497 () Bool)

(assert (=> b!289167 m!303497))

(declare-fun m!303499 () Bool)

(assert (=> b!289171 m!303499))

(declare-fun m!303501 () Bool)

(assert (=> start!28222 m!303501))

(declare-fun m!303503 () Bool)

(assert (=> start!28222 m!303503))

(declare-fun m!303505 () Bool)

(assert (=> b!289166 m!303505))

(declare-fun m!303507 () Bool)

(assert (=> b!289169 m!303507))

(declare-fun m!303509 () Bool)

(assert (=> b!289169 m!303509))

(declare-fun m!303511 () Bool)

(assert (=> b!289169 m!303511))

(declare-fun m!303513 () Bool)

(assert (=> b!289169 m!303513))

(declare-fun m!303515 () Bool)

(assert (=> b!289164 m!303515))

(assert (=> b!289165 m!303497))

(declare-fun m!303517 () Bool)

(assert (=> b!289170 m!303517))

(check-sat (not b!289169) (not b!289164) (not b!289171) (not start!28222) (not b!289170) (not b!289166))
(check-sat)
