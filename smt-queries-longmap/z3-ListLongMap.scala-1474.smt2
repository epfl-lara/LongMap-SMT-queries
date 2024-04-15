; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28226 () Bool)

(assert start!28226)

(declare-fun b!288970 () Bool)

(declare-fun e!182952 () Bool)

(declare-fun e!182950 () Bool)

(assert (=> b!288970 (= e!182952 e!182950)))

(declare-fun res!150645 () Bool)

(assert (=> b!288970 (=> (not res!150645) (not e!182950))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142411 () Bool)

(declare-datatypes ((SeekEntryResult!2042 0))(
  ( (MissingZero!2042 (index!10338 (_ BitVec 32))) (Found!2042 (index!10339 (_ BitVec 32))) (Intermediate!2042 (undefined!2854 Bool) (index!10340 (_ BitVec 32)) (x!28566 (_ BitVec 32))) (Undefined!2042) (MissingVacant!2042 (index!10341 (_ BitVec 32))) )
))
(declare-fun lt!142408 () SeekEntryResult!2042)

(assert (=> b!288970 (= res!150645 (or lt!142411 (= lt!142408 (MissingVacant!2042 i!1256))))))

(assert (=> b!288970 (= lt!142411 (= lt!142408 (MissingZero!2042 i!1256)))))

(declare-datatypes ((array!14533 0))(
  ( (array!14534 (arr!6894 (Array (_ BitVec 32) (_ BitVec 64))) (size!7247 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14533)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14533 (_ BitVec 32)) SeekEntryResult!2042)

(assert (=> b!288970 (= lt!142408 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288971 () Bool)

(declare-fun res!150650 () Bool)

(assert (=> b!288971 (=> (not res!150650) (not e!182952))))

(declare-fun arrayContainsKey!0 (array!14533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288971 (= res!150650 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288972 () Bool)

(declare-fun e!182951 () Bool)

(assert (=> b!288972 (= e!182951 (not true))))

(declare-fun lt!142409 () SeekEntryResult!2042)

(assert (=> b!288972 (and (= (select (arr!6894 a!3312) (index!10340 lt!142409)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10340 lt!142409) i!1256))))

(declare-fun b!288973 () Bool)

(declare-fun res!150652 () Bool)

(assert (=> b!288973 (=> (not res!150652) (not e!182952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288973 (= res!150652 (validKeyInArray!0 k0!2524))))

(declare-fun b!288974 () Bool)

(declare-fun res!150651 () Bool)

(assert (=> b!288974 (=> (not res!150651) (not e!182952))))

(assert (=> b!288974 (= res!150651 (and (= (size!7247 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7247 a!3312))))))

(declare-fun b!288975 () Bool)

(declare-fun e!182948 () Bool)

(assert (=> b!288975 (= e!182948 e!182951)))

(declare-fun res!150649 () Bool)

(assert (=> b!288975 (=> (not res!150649) (not e!182951))))

(declare-fun lt!142410 () Bool)

(assert (=> b!288975 (= res!150649 (and (or lt!142410 (not (undefined!2854 lt!142409))) (or lt!142410 (not (= (select (arr!6894 a!3312) (index!10340 lt!142409)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142410 (not (= (select (arr!6894 a!3312) (index!10340 lt!142409)) k0!2524))) (not lt!142410)))))

(get-info :version)

(assert (=> b!288975 (= lt!142410 (not ((_ is Intermediate!2042) lt!142409)))))

(declare-fun res!150648 () Bool)

(assert (=> start!28226 (=> (not res!150648) (not e!182952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28226 (= res!150648 (validMask!0 mask!3809))))

(assert (=> start!28226 e!182952))

(assert (=> start!28226 true))

(declare-fun array_inv!4866 (array!14533) Bool)

(assert (=> start!28226 (array_inv!4866 a!3312)))

(declare-fun b!288976 () Bool)

(assert (=> b!288976 (= e!182950 e!182948)))

(declare-fun res!150647 () Bool)

(assert (=> b!288976 (=> (not res!150647) (not e!182948))))

(assert (=> b!288976 (= res!150647 lt!142411)))

(declare-fun lt!142412 () (_ BitVec 32))

(declare-fun lt!142413 () SeekEntryResult!2042)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14533 (_ BitVec 32)) SeekEntryResult!2042)

(assert (=> b!288976 (= lt!142413 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142412 k0!2524 (array!14534 (store (arr!6894 a!3312) i!1256 k0!2524) (size!7247 a!3312)) mask!3809))))

(assert (=> b!288976 (= lt!142409 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142412 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288976 (= lt!142412 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288977 () Bool)

(declare-fun res!150646 () Bool)

(assert (=> b!288977 (=> (not res!150646) (not e!182950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14533 (_ BitVec 32)) Bool)

(assert (=> b!288977 (= res!150646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28226 res!150648) b!288974))

(assert (= (and b!288974 res!150651) b!288973))

(assert (= (and b!288973 res!150652) b!288971))

(assert (= (and b!288971 res!150650) b!288970))

(assert (= (and b!288970 res!150645) b!288977))

(assert (= (and b!288977 res!150646) b!288976))

(assert (= (and b!288976 res!150647) b!288975))

(assert (= (and b!288975 res!150649) b!288972))

(declare-fun m!302699 () Bool)

(assert (=> b!288975 m!302699))

(declare-fun m!302701 () Bool)

(assert (=> b!288976 m!302701))

(declare-fun m!302703 () Bool)

(assert (=> b!288976 m!302703))

(declare-fun m!302705 () Bool)

(assert (=> b!288976 m!302705))

(declare-fun m!302707 () Bool)

(assert (=> b!288976 m!302707))

(declare-fun m!302709 () Bool)

(assert (=> b!288970 m!302709))

(declare-fun m!302711 () Bool)

(assert (=> start!28226 m!302711))

(declare-fun m!302713 () Bool)

(assert (=> start!28226 m!302713))

(assert (=> b!288972 m!302699))

(declare-fun m!302715 () Bool)

(assert (=> b!288973 m!302715))

(declare-fun m!302717 () Bool)

(assert (=> b!288971 m!302717))

(declare-fun m!302719 () Bool)

(assert (=> b!288977 m!302719))

(check-sat (not b!288976) (not b!288971) (not b!288970) (not start!28226) (not b!288977) (not b!288973))
(check-sat)
