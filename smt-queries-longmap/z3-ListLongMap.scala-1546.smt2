; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29248 () Bool)

(assert start!29248)

(declare-fun b!296703 () Bool)

(declare-fun res!156336 () Bool)

(declare-fun e!187516 () Bool)

(assert (=> b!296703 (=> (not res!156336) (not e!187516))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296703 (= res!156336 (validKeyInArray!0 k0!2524))))

(declare-fun b!296704 () Bool)

(declare-fun e!187515 () Bool)

(declare-fun e!187514 () Bool)

(assert (=> b!296704 (= e!187515 e!187514)))

(declare-fun res!156337 () Bool)

(assert (=> b!296704 (=> (not res!156337) (not e!187514))))

(declare-fun lt!147368 () Bool)

(declare-datatypes ((SeekEntryResult!2228 0))(
  ( (MissingZero!2228 (index!11082 (_ BitVec 32))) (Found!2228 (index!11083 (_ BitVec 32))) (Intermediate!2228 (undefined!3040 Bool) (index!11084 (_ BitVec 32)) (x!29407 (_ BitVec 32))) (Undefined!2228) (MissingVacant!2228 (index!11085 (_ BitVec 32))) )
))
(declare-fun lt!147367 () SeekEntryResult!2228)

(declare-datatypes ((array!15009 0))(
  ( (array!15010 (arr!7114 (Array (_ BitVec 32) (_ BitVec 64))) (size!7466 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15009)

(assert (=> b!296704 (= res!156337 (and (or lt!147368 (not (undefined!3040 lt!147367))) (or lt!147368 (not (= (select (arr!7114 a!3312) (index!11084 lt!147367)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147368 (not (= (select (arr!7114 a!3312) (index!11084 lt!147367)) k0!2524))) (not lt!147368)))))

(get-info :version)

(assert (=> b!296704 (= lt!147368 (not ((_ is Intermediate!2228) lt!147367)))))

(declare-fun b!296705 () Bool)

(declare-fun res!156335 () Bool)

(assert (=> b!296705 (=> (not res!156335) (not e!187516))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!296705 (= res!156335 (and (= (size!7466 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7466 a!3312))))))

(declare-fun b!296706 () Bool)

(declare-fun res!156333 () Bool)

(assert (=> b!296706 (=> (not res!156333) (not e!187516))))

(declare-fun arrayContainsKey!0 (array!15009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296706 (= res!156333 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!156332 () Bool)

(assert (=> start!29248 (=> (not res!156332) (not e!187516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29248 (= res!156332 (validMask!0 mask!3809))))

(assert (=> start!29248 e!187516))

(assert (=> start!29248 true))

(declare-fun array_inv!5064 (array!15009) Bool)

(assert (=> start!29248 (array_inv!5064 a!3312)))

(declare-fun b!296707 () Bool)

(declare-fun res!156339 () Bool)

(declare-fun e!187517 () Bool)

(assert (=> b!296707 (=> (not res!156339) (not e!187517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15009 (_ BitVec 32)) Bool)

(assert (=> b!296707 (= res!156339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296708 () Bool)

(declare-fun lt!147366 () (_ BitVec 32))

(assert (=> b!296708 (= e!187514 (not (or (not (= lt!147367 (Intermediate!2228 false (index!11084 lt!147367) (x!29407 lt!147367)))) (bvsgt #b00000000000000000000000000000000 (x!29407 lt!147367)) (and (bvsge lt!147366 #b00000000000000000000000000000000) (bvslt lt!147366 (size!7466 a!3312))))))))

(assert (=> b!296708 (and (= (select (arr!7114 a!3312) (index!11084 lt!147367)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11084 lt!147367) i!1256))))

(declare-fun b!296709 () Bool)

(assert (=> b!296709 (= e!187517 e!187515)))

(declare-fun res!156338 () Bool)

(assert (=> b!296709 (=> (not res!156338) (not e!187515))))

(declare-fun lt!147364 () Bool)

(assert (=> b!296709 (= res!156338 lt!147364)))

(declare-fun lt!147365 () SeekEntryResult!2228)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15009 (_ BitVec 32)) SeekEntryResult!2228)

(assert (=> b!296709 (= lt!147365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147366 k0!2524 (array!15010 (store (arr!7114 a!3312) i!1256 k0!2524) (size!7466 a!3312)) mask!3809))))

(assert (=> b!296709 (= lt!147367 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147366 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296709 (= lt!147366 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!296710 () Bool)

(assert (=> b!296710 (= e!187516 e!187517)))

(declare-fun res!156334 () Bool)

(assert (=> b!296710 (=> (not res!156334) (not e!187517))))

(declare-fun lt!147369 () SeekEntryResult!2228)

(assert (=> b!296710 (= res!156334 (or lt!147364 (= lt!147369 (MissingVacant!2228 i!1256))))))

(assert (=> b!296710 (= lt!147364 (= lt!147369 (MissingZero!2228 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15009 (_ BitVec 32)) SeekEntryResult!2228)

(assert (=> b!296710 (= lt!147369 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!29248 res!156332) b!296705))

(assert (= (and b!296705 res!156335) b!296703))

(assert (= (and b!296703 res!156336) b!296706))

(assert (= (and b!296706 res!156333) b!296710))

(assert (= (and b!296710 res!156334) b!296707))

(assert (= (and b!296707 res!156339) b!296709))

(assert (= (and b!296709 res!156338) b!296704))

(assert (= (and b!296704 res!156337) b!296708))

(declare-fun m!309797 () Bool)

(assert (=> b!296703 m!309797))

(declare-fun m!309799 () Bool)

(assert (=> b!296709 m!309799))

(declare-fun m!309801 () Bool)

(assert (=> b!296709 m!309801))

(declare-fun m!309803 () Bool)

(assert (=> b!296709 m!309803))

(declare-fun m!309805 () Bool)

(assert (=> b!296709 m!309805))

(declare-fun m!309807 () Bool)

(assert (=> start!29248 m!309807))

(declare-fun m!309809 () Bool)

(assert (=> start!29248 m!309809))

(declare-fun m!309811 () Bool)

(assert (=> b!296704 m!309811))

(declare-fun m!309813 () Bool)

(assert (=> b!296710 m!309813))

(declare-fun m!309815 () Bool)

(assert (=> b!296707 m!309815))

(declare-fun m!309817 () Bool)

(assert (=> b!296706 m!309817))

(assert (=> b!296708 m!309811))

(check-sat (not b!296709) (not start!29248) (not b!296703) (not b!296706) (not b!296710) (not b!296707))
(check-sat)
(get-model)

(declare-fun d!67167 () Bool)

(declare-fun e!187562 () Bool)

(assert (=> d!67167 e!187562))

(declare-fun c!47772 () Bool)

(declare-fun lt!147411 () SeekEntryResult!2228)

(assert (=> d!67167 (= c!47772 (and ((_ is Intermediate!2228) lt!147411) (undefined!3040 lt!147411)))))

(declare-fun e!187559 () SeekEntryResult!2228)

(assert (=> d!67167 (= lt!147411 e!187559)))

(declare-fun c!47771 () Bool)

(assert (=> d!67167 (= c!47771 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!147410 () (_ BitVec 64))

(assert (=> d!67167 (= lt!147410 (select (arr!7114 (array!15010 (store (arr!7114 a!3312) i!1256 k0!2524) (size!7466 a!3312))) lt!147366))))

(assert (=> d!67167 (validMask!0 mask!3809)))

(assert (=> d!67167 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147366 k0!2524 (array!15010 (store (arr!7114 a!3312) i!1256 k0!2524) (size!7466 a!3312)) mask!3809) lt!147411)))

(declare-fun b!296777 () Bool)

(declare-fun e!187560 () SeekEntryResult!2228)

(assert (=> b!296777 (= e!187560 (Intermediate!2228 false lt!147366 #b00000000000000000000000000000000))))

(declare-fun b!296778 () Bool)

(assert (=> b!296778 (= e!187562 (bvsge (x!29407 lt!147411) #b01111111111111111111111111111110))))

(declare-fun b!296779 () Bool)

(assert (=> b!296779 (= e!187559 e!187560)))

(declare-fun c!47773 () Bool)

(assert (=> b!296779 (= c!47773 (or (= lt!147410 k0!2524) (= (bvadd lt!147410 lt!147410) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!296780 () Bool)

(assert (=> b!296780 (and (bvsge (index!11084 lt!147411) #b00000000000000000000000000000000) (bvslt (index!11084 lt!147411) (size!7466 (array!15010 (store (arr!7114 a!3312) i!1256 k0!2524) (size!7466 a!3312)))))))

(declare-fun res!156394 () Bool)

(assert (=> b!296780 (= res!156394 (= (select (arr!7114 (array!15010 (store (arr!7114 a!3312) i!1256 k0!2524) (size!7466 a!3312))) (index!11084 lt!147411)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187558 () Bool)

(assert (=> b!296780 (=> res!156394 e!187558)))

(declare-fun b!296781 () Bool)

(assert (=> b!296781 (and (bvsge (index!11084 lt!147411) #b00000000000000000000000000000000) (bvslt (index!11084 lt!147411) (size!7466 (array!15010 (store (arr!7114 a!3312) i!1256 k0!2524) (size!7466 a!3312)))))))

(declare-fun res!156396 () Bool)

(assert (=> b!296781 (= res!156396 (= (select (arr!7114 (array!15010 (store (arr!7114 a!3312) i!1256 k0!2524) (size!7466 a!3312))) (index!11084 lt!147411)) k0!2524))))

(assert (=> b!296781 (=> res!156396 e!187558)))

(declare-fun e!187561 () Bool)

(assert (=> b!296781 (= e!187561 e!187558)))

(declare-fun b!296782 () Bool)

(assert (=> b!296782 (and (bvsge (index!11084 lt!147411) #b00000000000000000000000000000000) (bvslt (index!11084 lt!147411) (size!7466 (array!15010 (store (arr!7114 a!3312) i!1256 k0!2524) (size!7466 a!3312)))))))

(assert (=> b!296782 (= e!187558 (= (select (arr!7114 (array!15010 (store (arr!7114 a!3312) i!1256 k0!2524) (size!7466 a!3312))) (index!11084 lt!147411)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!296783 () Bool)

(assert (=> b!296783 (= e!187559 (Intermediate!2228 true lt!147366 #b00000000000000000000000000000000))))

(declare-fun b!296784 () Bool)

(assert (=> b!296784 (= e!187562 e!187561)))

(declare-fun res!156395 () Bool)

(assert (=> b!296784 (= res!156395 (and ((_ is Intermediate!2228) lt!147411) (not (undefined!3040 lt!147411)) (bvslt (x!29407 lt!147411) #b01111111111111111111111111111110) (bvsge (x!29407 lt!147411) #b00000000000000000000000000000000) (bvsge (x!29407 lt!147411) #b00000000000000000000000000000000)))))

(assert (=> b!296784 (=> (not res!156395) (not e!187561))))

(declare-fun b!296785 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296785 (= e!187560 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147366 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!15010 (store (arr!7114 a!3312) i!1256 k0!2524) (size!7466 a!3312)) mask!3809))))

(assert (= (and d!67167 c!47771) b!296783))

(assert (= (and d!67167 (not c!47771)) b!296779))

(assert (= (and b!296779 c!47773) b!296777))

(assert (= (and b!296779 (not c!47773)) b!296785))

(assert (= (and d!67167 c!47772) b!296778))

(assert (= (and d!67167 (not c!47772)) b!296784))

(assert (= (and b!296784 res!156395) b!296781))

(assert (= (and b!296781 (not res!156396)) b!296780))

(assert (= (and b!296780 (not res!156394)) b!296782))

(declare-fun m!309863 () Bool)

(assert (=> b!296780 m!309863))

(assert (=> b!296781 m!309863))

(assert (=> b!296782 m!309863))

(declare-fun m!309865 () Bool)

(assert (=> d!67167 m!309865))

(assert (=> d!67167 m!309807))

(declare-fun m!309867 () Bool)

(assert (=> b!296785 m!309867))

(assert (=> b!296785 m!309867))

(declare-fun m!309869 () Bool)

(assert (=> b!296785 m!309869))

(assert (=> b!296709 d!67167))

(declare-fun d!67169 () Bool)

(declare-fun e!187567 () Bool)

(assert (=> d!67169 e!187567))

(declare-fun c!47775 () Bool)

(declare-fun lt!147413 () SeekEntryResult!2228)

(assert (=> d!67169 (= c!47775 (and ((_ is Intermediate!2228) lt!147413) (undefined!3040 lt!147413)))))

(declare-fun e!187564 () SeekEntryResult!2228)

(assert (=> d!67169 (= lt!147413 e!187564)))

(declare-fun c!47774 () Bool)

(assert (=> d!67169 (= c!47774 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!147412 () (_ BitVec 64))

(assert (=> d!67169 (= lt!147412 (select (arr!7114 a!3312) lt!147366))))

(assert (=> d!67169 (validMask!0 mask!3809)))

(assert (=> d!67169 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147366 k0!2524 a!3312 mask!3809) lt!147413)))

(declare-fun b!296786 () Bool)

(declare-fun e!187565 () SeekEntryResult!2228)

(assert (=> b!296786 (= e!187565 (Intermediate!2228 false lt!147366 #b00000000000000000000000000000000))))

(declare-fun b!296787 () Bool)

(assert (=> b!296787 (= e!187567 (bvsge (x!29407 lt!147413) #b01111111111111111111111111111110))))

(declare-fun b!296788 () Bool)

(assert (=> b!296788 (= e!187564 e!187565)))

(declare-fun c!47776 () Bool)

(assert (=> b!296788 (= c!47776 (or (= lt!147412 k0!2524) (= (bvadd lt!147412 lt!147412) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!296789 () Bool)

(assert (=> b!296789 (and (bvsge (index!11084 lt!147413) #b00000000000000000000000000000000) (bvslt (index!11084 lt!147413) (size!7466 a!3312)))))

(declare-fun res!156397 () Bool)

(assert (=> b!296789 (= res!156397 (= (select (arr!7114 a!3312) (index!11084 lt!147413)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187563 () Bool)

(assert (=> b!296789 (=> res!156397 e!187563)))

(declare-fun b!296790 () Bool)

(assert (=> b!296790 (and (bvsge (index!11084 lt!147413) #b00000000000000000000000000000000) (bvslt (index!11084 lt!147413) (size!7466 a!3312)))))

(declare-fun res!156399 () Bool)

(assert (=> b!296790 (= res!156399 (= (select (arr!7114 a!3312) (index!11084 lt!147413)) k0!2524))))

(assert (=> b!296790 (=> res!156399 e!187563)))

(declare-fun e!187566 () Bool)

(assert (=> b!296790 (= e!187566 e!187563)))

(declare-fun b!296791 () Bool)

(assert (=> b!296791 (and (bvsge (index!11084 lt!147413) #b00000000000000000000000000000000) (bvslt (index!11084 lt!147413) (size!7466 a!3312)))))

(assert (=> b!296791 (= e!187563 (= (select (arr!7114 a!3312) (index!11084 lt!147413)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!296792 () Bool)

(assert (=> b!296792 (= e!187564 (Intermediate!2228 true lt!147366 #b00000000000000000000000000000000))))

(declare-fun b!296793 () Bool)

(assert (=> b!296793 (= e!187567 e!187566)))

(declare-fun res!156398 () Bool)

(assert (=> b!296793 (= res!156398 (and ((_ is Intermediate!2228) lt!147413) (not (undefined!3040 lt!147413)) (bvslt (x!29407 lt!147413) #b01111111111111111111111111111110) (bvsge (x!29407 lt!147413) #b00000000000000000000000000000000) (bvsge (x!29407 lt!147413) #b00000000000000000000000000000000)))))

(assert (=> b!296793 (=> (not res!156398) (not e!187566))))

(declare-fun b!296794 () Bool)

(assert (=> b!296794 (= e!187565 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147366 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(assert (= (and d!67169 c!47774) b!296792))

(assert (= (and d!67169 (not c!47774)) b!296788))

(assert (= (and b!296788 c!47776) b!296786))

(assert (= (and b!296788 (not c!47776)) b!296794))

(assert (= (and d!67169 c!47775) b!296787))

(assert (= (and d!67169 (not c!47775)) b!296793))

(assert (= (and b!296793 res!156398) b!296790))

(assert (= (and b!296790 (not res!156399)) b!296789))

(assert (= (and b!296789 (not res!156397)) b!296791))

(declare-fun m!309871 () Bool)

(assert (=> b!296789 m!309871))

(assert (=> b!296790 m!309871))

(assert (=> b!296791 m!309871))

(declare-fun m!309873 () Bool)

(assert (=> d!67169 m!309873))

(assert (=> d!67169 m!309807))

(assert (=> b!296794 m!309867))

(assert (=> b!296794 m!309867))

(declare-fun m!309875 () Bool)

(assert (=> b!296794 m!309875))

(assert (=> b!296709 d!67169))

(declare-fun d!67171 () Bool)

(declare-fun lt!147419 () (_ BitVec 32))

(declare-fun lt!147418 () (_ BitVec 32))

(assert (=> d!67171 (= lt!147419 (bvmul (bvxor lt!147418 (bvlshr lt!147418 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67171 (= lt!147418 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67171 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!156400 (let ((h!5207 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29411 (bvmul (bvxor h!5207 (bvlshr h!5207 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29411 (bvlshr x!29411 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!156400 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!156400 #b00000000000000000000000000000000))))))

(assert (=> d!67171 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!147419 (bvlshr lt!147419 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!296709 d!67171))

(declare-fun d!67173 () Bool)

(assert (=> d!67173 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29248 d!67173))

(declare-fun d!67181 () Bool)

(assert (=> d!67181 (= (array_inv!5064 a!3312) (bvsge (size!7466 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29248 d!67181))

(declare-fun b!296831 () Bool)

(declare-fun e!187591 () SeekEntryResult!2228)

(declare-fun lt!147437 () SeekEntryResult!2228)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15009 (_ BitVec 32)) SeekEntryResult!2228)

(assert (=> b!296831 (= e!187591 (seekKeyOrZeroReturnVacant!0 (x!29407 lt!147437) (index!11084 lt!147437) (index!11084 lt!147437) k0!2524 a!3312 mask!3809))))

(declare-fun d!67183 () Bool)

(declare-fun lt!147436 () SeekEntryResult!2228)

(assert (=> d!67183 (and (or ((_ is Undefined!2228) lt!147436) (not ((_ is Found!2228) lt!147436)) (and (bvsge (index!11083 lt!147436) #b00000000000000000000000000000000) (bvslt (index!11083 lt!147436) (size!7466 a!3312)))) (or ((_ is Undefined!2228) lt!147436) ((_ is Found!2228) lt!147436) (not ((_ is MissingZero!2228) lt!147436)) (and (bvsge (index!11082 lt!147436) #b00000000000000000000000000000000) (bvslt (index!11082 lt!147436) (size!7466 a!3312)))) (or ((_ is Undefined!2228) lt!147436) ((_ is Found!2228) lt!147436) ((_ is MissingZero!2228) lt!147436) (not ((_ is MissingVacant!2228) lt!147436)) (and (bvsge (index!11085 lt!147436) #b00000000000000000000000000000000) (bvslt (index!11085 lt!147436) (size!7466 a!3312)))) (or ((_ is Undefined!2228) lt!147436) (ite ((_ is Found!2228) lt!147436) (= (select (arr!7114 a!3312) (index!11083 lt!147436)) k0!2524) (ite ((_ is MissingZero!2228) lt!147436) (= (select (arr!7114 a!3312) (index!11082 lt!147436)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2228) lt!147436) (= (select (arr!7114 a!3312) (index!11085 lt!147436)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!187590 () SeekEntryResult!2228)

(assert (=> d!67183 (= lt!147436 e!187590)))

(declare-fun c!47793 () Bool)

(assert (=> d!67183 (= c!47793 (and ((_ is Intermediate!2228) lt!147437) (undefined!3040 lt!147437)))))

(assert (=> d!67183 (= lt!147437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67183 (validMask!0 mask!3809)))

(assert (=> d!67183 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!147436)))

(declare-fun b!296832 () Bool)

(declare-fun e!187589 () SeekEntryResult!2228)

(assert (=> b!296832 (= e!187589 (Found!2228 (index!11084 lt!147437)))))

(declare-fun b!296833 () Bool)

(assert (=> b!296833 (= e!187590 e!187589)))

(declare-fun lt!147435 () (_ BitVec 64))

(assert (=> b!296833 (= lt!147435 (select (arr!7114 a!3312) (index!11084 lt!147437)))))

(declare-fun c!47792 () Bool)

(assert (=> b!296833 (= c!47792 (= lt!147435 k0!2524))))

(declare-fun b!296834 () Bool)

(declare-fun c!47794 () Bool)

(assert (=> b!296834 (= c!47794 (= lt!147435 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!296834 (= e!187589 e!187591)))

(declare-fun b!296835 () Bool)

(assert (=> b!296835 (= e!187591 (MissingZero!2228 (index!11084 lt!147437)))))

(declare-fun b!296836 () Bool)

(assert (=> b!296836 (= e!187590 Undefined!2228)))

(assert (= (and d!67183 c!47793) b!296836))

(assert (= (and d!67183 (not c!47793)) b!296833))

(assert (= (and b!296833 c!47792) b!296832))

(assert (= (and b!296833 (not c!47792)) b!296834))

(assert (= (and b!296834 c!47794) b!296835))

(assert (= (and b!296834 (not c!47794)) b!296831))

(declare-fun m!309893 () Bool)

(assert (=> b!296831 m!309893))

(declare-fun m!309895 () Bool)

(assert (=> d!67183 m!309895))

(assert (=> d!67183 m!309807))

(declare-fun m!309897 () Bool)

(assert (=> d!67183 m!309897))

(declare-fun m!309899 () Bool)

(assert (=> d!67183 m!309899))

(assert (=> d!67183 m!309805))

(declare-fun m!309901 () Bool)

(assert (=> d!67183 m!309901))

(assert (=> d!67183 m!309805))

(declare-fun m!309903 () Bool)

(assert (=> b!296833 m!309903))

(assert (=> b!296710 d!67183))

(declare-fun bm!25732 () Bool)

(declare-fun call!25735 () Bool)

(assert (=> bm!25732 (= call!25735 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!296881 () Bool)

(declare-fun e!187617 () Bool)

(assert (=> b!296881 (= e!187617 call!25735)))

(declare-fun b!296882 () Bool)

(declare-fun e!187618 () Bool)

(assert (=> b!296882 (= e!187618 e!187617)))

(declare-fun lt!147459 () (_ BitVec 64))

(assert (=> b!296882 (= lt!147459 (select (arr!7114 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9190 0))(
  ( (Unit!9191) )
))
(declare-fun lt!147457 () Unit!9190)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15009 (_ BitVec 64) (_ BitVec 32)) Unit!9190)

(assert (=> b!296882 (= lt!147457 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!147459 #b00000000000000000000000000000000))))

(assert (=> b!296882 (arrayContainsKey!0 a!3312 lt!147459 #b00000000000000000000000000000000)))

(declare-fun lt!147458 () Unit!9190)

(assert (=> b!296882 (= lt!147458 lt!147457)))

(declare-fun res!156417 () Bool)

(assert (=> b!296882 (= res!156417 (= (seekEntryOrOpen!0 (select (arr!7114 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2228 #b00000000000000000000000000000000)))))

(assert (=> b!296882 (=> (not res!156417) (not e!187617))))

(declare-fun d!67187 () Bool)

(declare-fun res!156418 () Bool)

(declare-fun e!187619 () Bool)

(assert (=> d!67187 (=> res!156418 e!187619)))

(assert (=> d!67187 (= res!156418 (bvsge #b00000000000000000000000000000000 (size!7466 a!3312)))))

(assert (=> d!67187 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!187619)))

(declare-fun b!296883 () Bool)

(assert (=> b!296883 (= e!187618 call!25735)))

(declare-fun b!296884 () Bool)

(assert (=> b!296884 (= e!187619 e!187618)))

(declare-fun c!47812 () Bool)

(assert (=> b!296884 (= c!47812 (validKeyInArray!0 (select (arr!7114 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!67187 (not res!156418)) b!296884))

(assert (= (and b!296884 c!47812) b!296882))

(assert (= (and b!296884 (not c!47812)) b!296883))

(assert (= (and b!296882 res!156417) b!296881))

(assert (= (or b!296881 b!296883) bm!25732))

(declare-fun m!309917 () Bool)

(assert (=> bm!25732 m!309917))

(declare-fun m!309919 () Bool)

(assert (=> b!296882 m!309919))

(declare-fun m!309921 () Bool)

(assert (=> b!296882 m!309921))

(declare-fun m!309923 () Bool)

(assert (=> b!296882 m!309923))

(assert (=> b!296882 m!309919))

(declare-fun m!309925 () Bool)

(assert (=> b!296882 m!309925))

(assert (=> b!296884 m!309919))

(assert (=> b!296884 m!309919))

(declare-fun m!309927 () Bool)

(assert (=> b!296884 m!309927))

(assert (=> b!296707 d!67187))

(declare-fun d!67191 () Bool)

(declare-fun res!156429 () Bool)

(declare-fun e!187634 () Bool)

(assert (=> d!67191 (=> res!156429 e!187634)))

(assert (=> d!67191 (= res!156429 (= (select (arr!7114 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67191 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!187634)))

(declare-fun b!296907 () Bool)

(declare-fun e!187635 () Bool)

(assert (=> b!296907 (= e!187634 e!187635)))

(declare-fun res!156430 () Bool)

(assert (=> b!296907 (=> (not res!156430) (not e!187635))))

(assert (=> b!296907 (= res!156430 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7466 a!3312)))))

(declare-fun b!296908 () Bool)

(assert (=> b!296908 (= e!187635 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67191 (not res!156429)) b!296907))

(assert (= (and b!296907 res!156430) b!296908))

(assert (=> d!67191 m!309919))

(declare-fun m!309943 () Bool)

(assert (=> b!296908 m!309943))

(assert (=> b!296706 d!67191))

(declare-fun d!67197 () Bool)

(assert (=> d!67197 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!296703 d!67197))

(check-sat (not d!67169) (not b!296908) (not b!296884) (not b!296794) (not d!67167) (not b!296882) (not d!67183) (not bm!25732) (not b!296831) (not b!296785))
(check-sat)
