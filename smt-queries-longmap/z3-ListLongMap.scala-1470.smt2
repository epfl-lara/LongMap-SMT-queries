; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28208 () Bool)

(assert start!28208)

(declare-fun b!288853 () Bool)

(declare-fun e!182885 () Bool)

(assert (=> b!288853 (= e!182885 (not true))))

(declare-datatypes ((array!14522 0))(
  ( (array!14523 (arr!6888 (Array (_ BitVec 32) (_ BitVec 64))) (size!7240 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14522)

(declare-datatypes ((SeekEntryResult!2037 0))(
  ( (MissingZero!2037 (index!10318 (_ BitVec 32))) (Found!2037 (index!10319 (_ BitVec 32))) (Intermediate!2037 (undefined!2849 Bool) (index!10320 (_ BitVec 32)) (x!28530 (_ BitVec 32))) (Undefined!2037) (MissingVacant!2037 (index!10321 (_ BitVec 32))) )
))
(declare-fun lt!142394 () SeekEntryResult!2037)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288853 (and (= (select (arr!6888 a!3312) (index!10320 lt!142394)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10320 lt!142394) i!1256))))

(declare-fun b!288854 () Bool)

(declare-fun res!150481 () Bool)

(declare-fun e!182884 () Bool)

(assert (=> b!288854 (=> (not res!150481) (not e!182884))))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!288854 (= res!150481 (and (= (size!7240 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7240 a!3312))))))

(declare-fun b!288855 () Bool)

(declare-fun res!150478 () Bool)

(declare-fun e!182888 () Bool)

(assert (=> b!288855 (=> (not res!150478) (not e!182888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14522 (_ BitVec 32)) Bool)

(assert (=> b!288855 (= res!150478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288857 () Bool)

(declare-fun res!150480 () Bool)

(assert (=> b!288857 (=> (not res!150480) (not e!182884))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288857 (= res!150480 (validKeyInArray!0 k0!2524))))

(declare-fun b!288858 () Bool)

(declare-fun res!150477 () Bool)

(assert (=> b!288858 (=> (not res!150477) (not e!182884))))

(declare-fun arrayContainsKey!0 (array!14522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288858 (= res!150477 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288859 () Bool)

(assert (=> b!288859 (= e!182884 e!182888)))

(declare-fun res!150479 () Bool)

(assert (=> b!288859 (=> (not res!150479) (not e!182888))))

(declare-fun lt!142396 () Bool)

(declare-fun lt!142392 () SeekEntryResult!2037)

(assert (=> b!288859 (= res!150479 (or lt!142396 (= lt!142392 (MissingVacant!2037 i!1256))))))

(assert (=> b!288859 (= lt!142396 (= lt!142392 (MissingZero!2037 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14522 (_ BitVec 32)) SeekEntryResult!2037)

(assert (=> b!288859 (= lt!142392 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288860 () Bool)

(declare-fun e!182887 () Bool)

(assert (=> b!288860 (= e!182887 e!182885)))

(declare-fun res!150482 () Bool)

(assert (=> b!288860 (=> (not res!150482) (not e!182885))))

(declare-fun lt!142393 () Bool)

(assert (=> b!288860 (= res!150482 (and (or lt!142393 (not (undefined!2849 lt!142394))) (or lt!142393 (not (= (select (arr!6888 a!3312) (index!10320 lt!142394)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142393 (not (= (select (arr!6888 a!3312) (index!10320 lt!142394)) k0!2524))) (not lt!142393)))))

(get-info :version)

(assert (=> b!288860 (= lt!142393 (not ((_ is Intermediate!2037) lt!142394)))))

(declare-fun res!150483 () Bool)

(assert (=> start!28208 (=> (not res!150483) (not e!182884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28208 (= res!150483 (validMask!0 mask!3809))))

(assert (=> start!28208 e!182884))

(assert (=> start!28208 true))

(declare-fun array_inv!4851 (array!14522) Bool)

(assert (=> start!28208 (array_inv!4851 a!3312)))

(declare-fun b!288856 () Bool)

(assert (=> b!288856 (= e!182888 e!182887)))

(declare-fun res!150476 () Bool)

(assert (=> b!288856 (=> (not res!150476) (not e!182887))))

(assert (=> b!288856 (= res!150476 lt!142396)))

(declare-fun lt!142391 () SeekEntryResult!2037)

(declare-fun lt!142395 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14522 (_ BitVec 32)) SeekEntryResult!2037)

(assert (=> b!288856 (= lt!142391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142395 k0!2524 (array!14523 (store (arr!6888 a!3312) i!1256 k0!2524) (size!7240 a!3312)) mask!3809))))

(assert (=> b!288856 (= lt!142394 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142395 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288856 (= lt!142395 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28208 res!150483) b!288854))

(assert (= (and b!288854 res!150481) b!288857))

(assert (= (and b!288857 res!150480) b!288858))

(assert (= (and b!288858 res!150477) b!288859))

(assert (= (and b!288859 res!150479) b!288855))

(assert (= (and b!288855 res!150478) b!288856))

(assert (= (and b!288856 res!150476) b!288860))

(assert (= (and b!288860 res!150482) b!288853))

(declare-fun m!303049 () Bool)

(assert (=> b!288857 m!303049))

(declare-fun m!303051 () Bool)

(assert (=> b!288858 m!303051))

(declare-fun m!303053 () Bool)

(assert (=> start!28208 m!303053))

(declare-fun m!303055 () Bool)

(assert (=> start!28208 m!303055))

(declare-fun m!303057 () Bool)

(assert (=> b!288859 m!303057))

(declare-fun m!303059 () Bool)

(assert (=> b!288853 m!303059))

(declare-fun m!303061 () Bool)

(assert (=> b!288855 m!303061))

(declare-fun m!303063 () Bool)

(assert (=> b!288856 m!303063))

(declare-fun m!303065 () Bool)

(assert (=> b!288856 m!303065))

(declare-fun m!303067 () Bool)

(assert (=> b!288856 m!303067))

(declare-fun m!303069 () Bool)

(assert (=> b!288856 m!303069))

(assert (=> b!288860 m!303059))

(check-sat (not b!288857) (not b!288858) (not b!288855) (not b!288859) (not b!288856) (not start!28208))
(check-sat)
