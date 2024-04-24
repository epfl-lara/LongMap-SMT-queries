; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29302 () Bool)

(assert start!29302)

(declare-fun b!296991 () Bool)

(declare-fun e!187690 () Bool)

(assert (=> b!296991 (= e!187690 (not true))))

(declare-datatypes ((array!15018 0))(
  ( (array!15019 (arr!7117 (Array (_ BitVec 32) (_ BitVec 64))) (size!7469 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15018)

(declare-datatypes ((SeekEntryResult!2231 0))(
  ( (MissingZero!2231 (index!11094 (_ BitVec 32))) (Found!2231 (index!11095 (_ BitVec 32))) (Intermediate!2231 (undefined!3043 Bool) (index!11096 (_ BitVec 32)) (x!29424 (_ BitVec 32))) (Undefined!2231) (MissingVacant!2231 (index!11097 (_ BitVec 32))) )
))
(declare-fun lt!147518 () SeekEntryResult!2231)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!296991 (and (= (select (arr!7117 a!3312) (index!11096 lt!147518)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11096 lt!147518) i!1256))))

(declare-fun b!296992 () Bool)

(declare-fun e!187691 () Bool)

(declare-fun e!187692 () Bool)

(assert (=> b!296992 (= e!187691 e!187692)))

(declare-fun res!156483 () Bool)

(assert (=> b!296992 (=> (not res!156483) (not e!187692))))

(declare-fun lt!147514 () SeekEntryResult!2231)

(declare-fun lt!147515 () Bool)

(assert (=> b!296992 (= res!156483 (or lt!147515 (= lt!147514 (MissingVacant!2231 i!1256))))))

(assert (=> b!296992 (= lt!147515 (= lt!147514 (MissingZero!2231 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15018 (_ BitVec 32)) SeekEntryResult!2231)

(assert (=> b!296992 (= lt!147514 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!296993 () Bool)

(declare-fun e!187693 () Bool)

(assert (=> b!296993 (= e!187693 e!187690)))

(declare-fun res!156486 () Bool)

(assert (=> b!296993 (=> (not res!156486) (not e!187690))))

(declare-fun lt!147519 () Bool)

(assert (=> b!296993 (= res!156486 (and (or lt!147519 (not (undefined!3043 lt!147518))) (or lt!147519 (not (= (select (arr!7117 a!3312) (index!11096 lt!147518)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147519 (not (= (select (arr!7117 a!3312) (index!11096 lt!147518)) k0!2524))) (not lt!147519)))))

(get-info :version)

(assert (=> b!296993 (= lt!147519 (not ((_ is Intermediate!2231) lt!147518)))))

(declare-fun b!296994 () Bool)

(assert (=> b!296994 (= e!187692 e!187693)))

(declare-fun res!156482 () Bool)

(assert (=> b!296994 (=> (not res!156482) (not e!187693))))

(assert (=> b!296994 (= res!156482 lt!147515)))

(declare-fun lt!147516 () (_ BitVec 32))

(declare-fun lt!147517 () SeekEntryResult!2231)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15018 (_ BitVec 32)) SeekEntryResult!2231)

(assert (=> b!296994 (= lt!147517 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147516 k0!2524 (array!15019 (store (arr!7117 a!3312) i!1256 k0!2524) (size!7469 a!3312)) mask!3809))))

(assert (=> b!296994 (= lt!147518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147516 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296994 (= lt!147516 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!296995 () Bool)

(declare-fun res!156479 () Bool)

(assert (=> b!296995 (=> (not res!156479) (not e!187691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296995 (= res!156479 (validKeyInArray!0 k0!2524))))

(declare-fun b!296996 () Bool)

(declare-fun res!156480 () Bool)

(assert (=> b!296996 (=> (not res!156480) (not e!187691))))

(declare-fun arrayContainsKey!0 (array!15018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296996 (= res!156480 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296997 () Bool)

(declare-fun res!156485 () Bool)

(assert (=> b!296997 (=> (not res!156485) (not e!187692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15018 (_ BitVec 32)) Bool)

(assert (=> b!296997 (= res!156485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!156484 () Bool)

(assert (=> start!29302 (=> (not res!156484) (not e!187691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29302 (= res!156484 (validMask!0 mask!3809))))

(assert (=> start!29302 e!187691))

(assert (=> start!29302 true))

(declare-fun array_inv!5067 (array!15018) Bool)

(assert (=> start!29302 (array_inv!5067 a!3312)))

(declare-fun b!296998 () Bool)

(declare-fun res!156481 () Bool)

(assert (=> b!296998 (=> (not res!156481) (not e!187691))))

(assert (=> b!296998 (= res!156481 (and (= (size!7469 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7469 a!3312))))))

(assert (= (and start!29302 res!156484) b!296998))

(assert (= (and b!296998 res!156481) b!296995))

(assert (= (and b!296995 res!156479) b!296996))

(assert (= (and b!296996 res!156480) b!296992))

(assert (= (and b!296992 res!156483) b!296997))

(assert (= (and b!296997 res!156485) b!296994))

(assert (= (and b!296994 res!156482) b!296993))

(assert (= (and b!296993 res!156486) b!296991))

(declare-fun m!309983 () Bool)

(assert (=> b!296992 m!309983))

(declare-fun m!309985 () Bool)

(assert (=> b!296997 m!309985))

(declare-fun m!309987 () Bool)

(assert (=> b!296995 m!309987))

(declare-fun m!309989 () Bool)

(assert (=> b!296991 m!309989))

(declare-fun m!309991 () Bool)

(assert (=> b!296994 m!309991))

(declare-fun m!309993 () Bool)

(assert (=> b!296994 m!309993))

(declare-fun m!309995 () Bool)

(assert (=> b!296994 m!309995))

(declare-fun m!309997 () Bool)

(assert (=> b!296994 m!309997))

(declare-fun m!309999 () Bool)

(assert (=> b!296996 m!309999))

(assert (=> b!296993 m!309989))

(declare-fun m!310001 () Bool)

(assert (=> start!29302 m!310001))

(declare-fun m!310003 () Bool)

(assert (=> start!29302 m!310003))

(check-sat (not b!296996) (not b!296992) (not start!29302) (not b!296995) (not b!296994) (not b!296997))
(check-sat)
