; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28160 () Bool)

(assert start!28160)

(declare-fun b!288178 () Bool)

(declare-fun e!182457 () Bool)

(declare-fun e!182454 () Bool)

(assert (=> b!288178 (= e!182457 e!182454)))

(declare-fun res!149859 () Bool)

(assert (=> b!288178 (=> (not res!149859) (not e!182454))))

(declare-fun lt!141817 () Bool)

(assert (=> b!288178 (= res!149859 lt!141817)))

(declare-fun lt!141818 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2009 0))(
  ( (MissingZero!2009 (index!10206 (_ BitVec 32))) (Found!2009 (index!10207 (_ BitVec 32))) (Intermediate!2009 (undefined!2821 Bool) (index!10208 (_ BitVec 32)) (x!28445 (_ BitVec 32))) (Undefined!2009) (MissingVacant!2009 (index!10209 (_ BitVec 32))) )
))
(declare-fun lt!141819 () SeekEntryResult!2009)

(declare-datatypes ((array!14467 0))(
  ( (array!14468 (arr!6861 (Array (_ BitVec 32) (_ BitVec 64))) (size!7214 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14467)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14467 (_ BitVec 32)) SeekEntryResult!2009)

(assert (=> b!288178 (= lt!141819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141818 k0!2524 (array!14468 (store (arr!6861 a!3312) i!1256 k0!2524) (size!7214 a!3312)) mask!3809))))

(declare-fun lt!141816 () SeekEntryResult!2009)

(assert (=> b!288178 (= lt!141816 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141818 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288178 (= lt!141818 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288179 () Bool)

(declare-fun e!182456 () Bool)

(assert (=> b!288179 (= e!182454 e!182456)))

(declare-fun res!149853 () Bool)

(assert (=> b!288179 (=> (not res!149853) (not e!182456))))

(declare-fun lt!141814 () Bool)

(assert (=> b!288179 (= res!149853 (and (or lt!141814 (not (undefined!2821 lt!141816))) (or lt!141814 (not (= (select (arr!6861 a!3312) (index!10208 lt!141816)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!141814 (not (= (select (arr!6861 a!3312) (index!10208 lt!141816)) k0!2524))) (not lt!141814)))))

(get-info :version)

(assert (=> b!288179 (= lt!141814 (not ((_ is Intermediate!2009) lt!141816)))))

(declare-fun b!288180 () Bool)

(declare-fun res!149854 () Bool)

(declare-fun e!182453 () Bool)

(assert (=> b!288180 (=> (not res!149854) (not e!182453))))

(declare-fun arrayContainsKey!0 (array!14467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288180 (= res!149854 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!149860 () Bool)

(assert (=> start!28160 (=> (not res!149860) (not e!182453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28160 (= res!149860 (validMask!0 mask!3809))))

(assert (=> start!28160 e!182453))

(assert (=> start!28160 true))

(declare-fun array_inv!4833 (array!14467) Bool)

(assert (=> start!28160 (array_inv!4833 a!3312)))

(declare-fun b!288181 () Bool)

(assert (=> b!288181 (= e!182453 e!182457)))

(declare-fun res!149858 () Bool)

(assert (=> b!288181 (=> (not res!149858) (not e!182457))))

(declare-fun lt!141815 () SeekEntryResult!2009)

(assert (=> b!288181 (= res!149858 (or lt!141817 (= lt!141815 (MissingVacant!2009 i!1256))))))

(assert (=> b!288181 (= lt!141817 (= lt!141815 (MissingZero!2009 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14467 (_ BitVec 32)) SeekEntryResult!2009)

(assert (=> b!288181 (= lt!141815 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288182 () Bool)

(declare-fun res!149857 () Bool)

(assert (=> b!288182 (=> (not res!149857) (not e!182453))))

(assert (=> b!288182 (= res!149857 (and (= (size!7214 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7214 a!3312))))))

(declare-fun b!288183 () Bool)

(declare-fun res!149855 () Bool)

(assert (=> b!288183 (=> (not res!149855) (not e!182453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288183 (= res!149855 (validKeyInArray!0 k0!2524))))

(declare-fun b!288184 () Bool)

(assert (=> b!288184 (= e!182456 (not true))))

(assert (=> b!288184 (and (= (select (arr!6861 a!3312) (index!10208 lt!141816)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10208 lt!141816) i!1256))))

(declare-fun b!288185 () Bool)

(declare-fun res!149856 () Bool)

(assert (=> b!288185 (=> (not res!149856) (not e!182457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14467 (_ BitVec 32)) Bool)

(assert (=> b!288185 (= res!149856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28160 res!149860) b!288182))

(assert (= (and b!288182 res!149857) b!288183))

(assert (= (and b!288183 res!149855) b!288180))

(assert (= (and b!288180 res!149854) b!288181))

(assert (= (and b!288181 res!149858) b!288185))

(assert (= (and b!288185 res!149856) b!288178))

(assert (= (and b!288178 res!149859) b!288179))

(assert (= (and b!288179 res!149853) b!288184))

(declare-fun m!301973 () Bool)

(assert (=> b!288184 m!301973))

(declare-fun m!301975 () Bool)

(assert (=> b!288183 m!301975))

(declare-fun m!301977 () Bool)

(assert (=> start!28160 m!301977))

(declare-fun m!301979 () Bool)

(assert (=> start!28160 m!301979))

(assert (=> b!288179 m!301973))

(declare-fun m!301981 () Bool)

(assert (=> b!288180 m!301981))

(declare-fun m!301983 () Bool)

(assert (=> b!288185 m!301983))

(declare-fun m!301985 () Bool)

(assert (=> b!288178 m!301985))

(declare-fun m!301987 () Bool)

(assert (=> b!288178 m!301987))

(declare-fun m!301989 () Bool)

(assert (=> b!288178 m!301989))

(declare-fun m!301991 () Bool)

(assert (=> b!288178 m!301991))

(declare-fun m!301993 () Bool)

(assert (=> b!288181 m!301993))

(check-sat (not start!28160) (not b!288181) (not b!288185) (not b!288183) (not b!288178) (not b!288180))
(check-sat)
