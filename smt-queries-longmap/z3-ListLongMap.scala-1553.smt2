; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29378 () Bool)

(assert start!29378)

(declare-fun b!297342 () Bool)

(declare-fun res!156811 () Bool)

(declare-fun e!187893 () Bool)

(assert (=> b!297342 (=> (not res!156811) (not e!187893))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15049 0))(
  ( (array!15050 (arr!7131 (Array (_ BitVec 32) (_ BitVec 64))) (size!7484 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15049)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!297342 (= res!156811 (and (= (size!7484 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7484 a!3312))))))

(declare-fun b!297343 () Bool)

(assert (=> b!297343 false))

(declare-datatypes ((Unit!9229 0))(
  ( (Unit!9230) )
))
(declare-fun e!187896 () Unit!9229)

(declare-fun Unit!9231 () Unit!9229)

(assert (=> b!297343 (= e!187896 Unit!9231)))

(declare-fun b!297344 () Bool)

(declare-fun e!187897 () Bool)

(declare-fun e!187892 () Bool)

(assert (=> b!297344 (= e!187897 e!187892)))

(declare-fun res!156815 () Bool)

(assert (=> b!297344 (=> (not res!156815) (not e!187892))))

(declare-fun lt!147675 () Bool)

(assert (=> b!297344 (= res!156815 lt!147675)))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2279 0))(
  ( (MissingZero!2279 (index!11286 (_ BitVec 32))) (Found!2279 (index!11287 (_ BitVec 32))) (Intermediate!2279 (undefined!3091 Bool) (index!11288 (_ BitVec 32)) (x!29521 (_ BitVec 32))) (Undefined!2279) (MissingVacant!2279 (index!11289 (_ BitVec 32))) )
))
(declare-fun lt!147677 () SeekEntryResult!2279)

(declare-fun lt!147678 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15049 (_ BitVec 32)) SeekEntryResult!2279)

(assert (=> b!297344 (= lt!147677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147678 k0!2524 (array!15050 (store (arr!7131 a!3312) i!1256 k0!2524) (size!7484 a!3312)) mask!3809))))

(declare-fun lt!147676 () SeekEntryResult!2279)

(assert (=> b!297344 (= lt!147676 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147678 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297344 (= lt!147678 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!297346 () Bool)

(assert (=> b!297346 (= e!187893 e!187897)))

(declare-fun res!156813 () Bool)

(assert (=> b!297346 (=> (not res!156813) (not e!187897))))

(declare-fun lt!147680 () SeekEntryResult!2279)

(assert (=> b!297346 (= res!156813 (or lt!147675 (= lt!147680 (MissingVacant!2279 i!1256))))))

(assert (=> b!297346 (= lt!147675 (= lt!147680 (MissingZero!2279 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15049 (_ BitVec 32)) SeekEntryResult!2279)

(assert (=> b!297346 (= lt!147680 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!297347 () Bool)

(declare-fun res!156814 () Bool)

(assert (=> b!297347 (=> (not res!156814) (not e!187893))))

(declare-fun arrayContainsKey!0 (array!15049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297347 (= res!156814 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297348 () Bool)

(declare-fun e!187894 () Unit!9229)

(assert (=> b!297348 (= e!187894 e!187896)))

(declare-fun c!47848 () Bool)

(get-info :version)

(assert (=> b!297348 (= c!47848 ((_ is Intermediate!2279) lt!147676))))

(declare-fun b!297345 () Bool)

(declare-fun Unit!9232 () Unit!9229)

(assert (=> b!297345 (= e!187894 Unit!9232)))

(assert (=> b!297345 false))

(declare-fun res!156812 () Bool)

(assert (=> start!29378 (=> (not res!156812) (not e!187893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29378 (= res!156812 (validMask!0 mask!3809))))

(assert (=> start!29378 e!187893))

(assert (=> start!29378 true))

(declare-fun array_inv!5103 (array!15049) Bool)

(assert (=> start!29378 (array_inv!5103 a!3312)))

(declare-fun b!297349 () Bool)

(assert (=> b!297349 (and (= lt!147677 lt!147676) (= (select (store (arr!7131 a!3312) i!1256 k0!2524) (index!11288 lt!147676)) k0!2524))))

(declare-fun lt!147679 () Unit!9229)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15049 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9229)

(assert (=> b!297349 (= lt!147679 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147678 (index!11288 lt!147676) (x!29521 lt!147676) mask!3809))))

(assert (=> b!297349 (and (= (select (arr!7131 a!3312) (index!11288 lt!147676)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11288 lt!147676) i!1256))))

(declare-fun Unit!9233 () Unit!9229)

(assert (=> b!297349 (= e!187896 Unit!9233)))

(declare-fun b!297350 () Bool)

(assert (=> b!297350 (= e!187892 false)))

(declare-fun lt!147681 () Unit!9229)

(assert (=> b!297350 (= lt!147681 e!187894)))

(declare-fun c!47849 () Bool)

(assert (=> b!297350 (= c!47849 (or (and ((_ is Intermediate!2279) lt!147676) (undefined!3091 lt!147676)) (and ((_ is Intermediate!2279) lt!147676) (= (select (arr!7131 a!3312) (index!11288 lt!147676)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2279) lt!147676) (= (select (arr!7131 a!3312) (index!11288 lt!147676)) k0!2524))))))

(declare-fun b!297351 () Bool)

(declare-fun res!156816 () Bool)

(assert (=> b!297351 (=> (not res!156816) (not e!187893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297351 (= res!156816 (validKeyInArray!0 k0!2524))))

(declare-fun b!297352 () Bool)

(declare-fun res!156817 () Bool)

(assert (=> b!297352 (=> (not res!156817) (not e!187897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15049 (_ BitVec 32)) Bool)

(assert (=> b!297352 (= res!156817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29378 res!156812) b!297342))

(assert (= (and b!297342 res!156811) b!297351))

(assert (= (and b!297351 res!156816) b!297347))

(assert (= (and b!297347 res!156814) b!297346))

(assert (= (and b!297346 res!156813) b!297352))

(assert (= (and b!297352 res!156817) b!297344))

(assert (= (and b!297344 res!156815) b!297350))

(assert (= (and b!297350 c!47849) b!297345))

(assert (= (and b!297350 (not c!47849)) b!297348))

(assert (= (and b!297348 c!47848) b!297349))

(assert (= (and b!297348 (not c!47848)) b!297343))

(declare-fun m!309603 () Bool)

(assert (=> b!297351 m!309603))

(declare-fun m!309605 () Bool)

(assert (=> b!297346 m!309605))

(declare-fun m!309607 () Bool)

(assert (=> b!297350 m!309607))

(declare-fun m!309609 () Bool)

(assert (=> start!29378 m!309609))

(declare-fun m!309611 () Bool)

(assert (=> start!29378 m!309611))

(declare-fun m!309613 () Bool)

(assert (=> b!297349 m!309613))

(declare-fun m!309615 () Bool)

(assert (=> b!297349 m!309615))

(declare-fun m!309617 () Bool)

(assert (=> b!297349 m!309617))

(assert (=> b!297349 m!309607))

(declare-fun m!309619 () Bool)

(assert (=> b!297352 m!309619))

(assert (=> b!297344 m!309613))

(declare-fun m!309621 () Bool)

(assert (=> b!297344 m!309621))

(declare-fun m!309623 () Bool)

(assert (=> b!297344 m!309623))

(declare-fun m!309625 () Bool)

(assert (=> b!297344 m!309625))

(declare-fun m!309627 () Bool)

(assert (=> b!297347 m!309627))

(check-sat (not b!297346) (not b!297352) (not b!297344) (not start!29378) (not b!297351) (not b!297349) (not b!297347))
(check-sat)
