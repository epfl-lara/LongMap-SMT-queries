; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29140 () Bool)

(assert start!29140)

(declare-fun res!155538 () Bool)

(declare-fun e!186931 () Bool)

(assert (=> start!29140 (=> (not res!155538) (not e!186931))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29140 (= res!155538 (validMask!0 mask!3809))))

(assert (=> start!29140 e!186931))

(assert (=> start!29140 true))

(declare-datatypes ((array!14946 0))(
  ( (array!14947 (arr!7084 (Array (_ BitVec 32) (_ BitVec 64))) (size!7436 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14946)

(declare-fun array_inv!5034 (array!14946) Bool)

(assert (=> start!29140 (array_inv!5034 a!3312)))

(declare-fun b!295767 () Bool)

(declare-fun res!155539 () Bool)

(declare-fun e!186935 () Bool)

(assert (=> b!295767 (=> (not res!155539) (not e!186935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14946 (_ BitVec 32)) Bool)

(assert (=> b!295767 (= res!155539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295768 () Bool)

(declare-fun res!155542 () Bool)

(assert (=> b!295768 (=> (not res!155542) (not e!186931))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295768 (= res!155542 (and (= (size!7436 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7436 a!3312))))))

(declare-fun b!295769 () Bool)

(declare-fun e!186933 () Bool)

(assert (=> b!295769 (= e!186935 e!186933)))

(declare-fun res!155540 () Bool)

(assert (=> b!295769 (=> (not res!155540) (not e!186933))))

(declare-fun lt!146729 () Bool)

(assert (=> b!295769 (= res!155540 lt!146729)))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun lt!146732 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2198 0))(
  ( (MissingZero!2198 (index!10962 (_ BitVec 32))) (Found!2198 (index!10963 (_ BitVec 32))) (Intermediate!2198 (undefined!3010 Bool) (index!10964 (_ BitVec 32)) (x!29291 (_ BitVec 32))) (Undefined!2198) (MissingVacant!2198 (index!10965 (_ BitVec 32))) )
))
(declare-fun lt!146733 () SeekEntryResult!2198)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14946 (_ BitVec 32)) SeekEntryResult!2198)

(assert (=> b!295769 (= lt!146733 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146732 k0!2524 (array!14947 (store (arr!7084 a!3312) i!1256 k0!2524) (size!7436 a!3312)) mask!3809))))

(declare-fun lt!146731 () SeekEntryResult!2198)

(assert (=> b!295769 (= lt!146731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146732 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295769 (= lt!146732 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295770 () Bool)

(declare-fun res!155544 () Bool)

(assert (=> b!295770 (=> (not res!155544) (not e!186931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295770 (= res!155544 (validKeyInArray!0 k0!2524))))

(declare-fun b!295771 () Bool)

(assert (=> b!295771 (= e!186931 e!186935)))

(declare-fun res!155537 () Bool)

(assert (=> b!295771 (=> (not res!155537) (not e!186935))))

(declare-fun lt!146728 () SeekEntryResult!2198)

(assert (=> b!295771 (= res!155537 (or lt!146729 (= lt!146728 (MissingVacant!2198 i!1256))))))

(assert (=> b!295771 (= lt!146729 (= lt!146728 (MissingZero!2198 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14946 (_ BitVec 32)) SeekEntryResult!2198)

(assert (=> b!295771 (= lt!146728 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295772 () Bool)

(declare-fun e!186934 () Bool)

(assert (=> b!295772 (= e!186934 (not true))))

(assert (=> b!295772 (and (= (select (arr!7084 a!3312) (index!10964 lt!146731)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10964 lt!146731) i!1256))))

(declare-fun b!295773 () Bool)

(declare-fun res!155541 () Bool)

(assert (=> b!295773 (=> (not res!155541) (not e!186931))))

(declare-fun arrayContainsKey!0 (array!14946 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295773 (= res!155541 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295774 () Bool)

(assert (=> b!295774 (= e!186933 e!186934)))

(declare-fun res!155543 () Bool)

(assert (=> b!295774 (=> (not res!155543) (not e!186934))))

(declare-fun lt!146730 () Bool)

(assert (=> b!295774 (= res!155543 (and (or lt!146730 (not (undefined!3010 lt!146731))) (or lt!146730 (not (= (select (arr!7084 a!3312) (index!10964 lt!146731)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146730 (not (= (select (arr!7084 a!3312) (index!10964 lt!146731)) k0!2524))) (not lt!146730)))))

(get-info :version)

(assert (=> b!295774 (= lt!146730 (not ((_ is Intermediate!2198) lt!146731)))))

(assert (= (and start!29140 res!155538) b!295768))

(assert (= (and b!295768 res!155542) b!295770))

(assert (= (and b!295770 res!155544) b!295773))

(assert (= (and b!295773 res!155541) b!295771))

(assert (= (and b!295771 res!155537) b!295767))

(assert (= (and b!295767 res!155539) b!295769))

(assert (= (and b!295769 res!155540) b!295774))

(assert (= (and b!295774 res!155543) b!295772))

(declare-fun m!309017 () Bool)

(assert (=> b!295774 m!309017))

(declare-fun m!309019 () Bool)

(assert (=> b!295767 m!309019))

(declare-fun m!309021 () Bool)

(assert (=> b!295769 m!309021))

(declare-fun m!309023 () Bool)

(assert (=> b!295769 m!309023))

(declare-fun m!309025 () Bool)

(assert (=> b!295769 m!309025))

(declare-fun m!309027 () Bool)

(assert (=> b!295769 m!309027))

(declare-fun m!309029 () Bool)

(assert (=> b!295773 m!309029))

(declare-fun m!309031 () Bool)

(assert (=> b!295771 m!309031))

(assert (=> b!295772 m!309017))

(declare-fun m!309033 () Bool)

(assert (=> start!29140 m!309033))

(declare-fun m!309035 () Bool)

(assert (=> start!29140 m!309035))

(declare-fun m!309037 () Bool)

(assert (=> b!295770 m!309037))

(check-sat (not b!295767) (not b!295769) (not b!295773) (not b!295770) (not start!29140) (not b!295771))
(check-sat)
