; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29372 () Bool)

(assert start!29372)

(declare-fun b!297243 () Bool)

(declare-fun e!187842 () Bool)

(declare-fun e!187841 () Bool)

(assert (=> b!297243 (= e!187842 e!187841)))

(declare-fun res!156750 () Bool)

(assert (=> b!297243 (=> (not res!156750) (not e!187841))))

(declare-fun lt!147614 () Bool)

(assert (=> b!297243 (= res!156750 lt!147614)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2276 0))(
  ( (MissingZero!2276 (index!11274 (_ BitVec 32))) (Found!2276 (index!11275 (_ BitVec 32))) (Intermediate!2276 (undefined!3088 Bool) (index!11276 (_ BitVec 32)) (x!29510 (_ BitVec 32))) (Undefined!2276) (MissingVacant!2276 (index!11277 (_ BitVec 32))) )
))
(declare-fun lt!147617 () SeekEntryResult!2276)

(declare-fun lt!147616 () (_ BitVec 32))

(declare-datatypes ((array!15043 0))(
  ( (array!15044 (arr!7128 (Array (_ BitVec 32) (_ BitVec 64))) (size!7481 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15043)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15043 (_ BitVec 32)) SeekEntryResult!2276)

(assert (=> b!297243 (= lt!147617 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147616 k0!2524 (array!15044 (store (arr!7128 a!3312) i!1256 k0!2524) (size!7481 a!3312)) mask!3809))))

(declare-fun lt!147618 () SeekEntryResult!2276)

(assert (=> b!297243 (= lt!147618 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147616 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297243 (= lt!147616 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!297245 () Bool)

(assert (=> b!297245 (= e!187841 (not (= lt!147617 lt!147618)))))

(declare-datatypes ((Unit!9214 0))(
  ( (Unit!9215) )
))
(declare-fun lt!147615 () Unit!9214)

(declare-fun e!187839 () Unit!9214)

(assert (=> b!297245 (= lt!147615 e!187839)))

(declare-fun c!47831 () Bool)

(get-info :version)

(assert (=> b!297245 (= c!47831 (or (and ((_ is Intermediate!2276) lt!147618) (undefined!3088 lt!147618)) (and ((_ is Intermediate!2276) lt!147618) (= (select (arr!7128 a!3312) (index!11276 lt!147618)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2276) lt!147618) (= (select (arr!7128 a!3312) (index!11276 lt!147618)) k0!2524))))))

(declare-fun b!297246 () Bool)

(declare-fun e!187843 () Unit!9214)

(assert (=> b!297246 (= e!187839 e!187843)))

(declare-fun c!47830 () Bool)

(assert (=> b!297246 (= c!47830 ((_ is Intermediate!2276) lt!147618))))

(declare-fun b!297247 () Bool)

(declare-fun res!156753 () Bool)

(declare-fun e!187840 () Bool)

(assert (=> b!297247 (=> (not res!156753) (not e!187840))))

(declare-fun arrayContainsKey!0 (array!15043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297247 (= res!156753 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297248 () Bool)

(assert (=> b!297248 (= e!187840 e!187842)))

(declare-fun res!156749 () Bool)

(assert (=> b!297248 (=> (not res!156749) (not e!187842))))

(declare-fun lt!147613 () SeekEntryResult!2276)

(assert (=> b!297248 (= res!156749 (or lt!147614 (= lt!147613 (MissingVacant!2276 i!1256))))))

(assert (=> b!297248 (= lt!147614 (= lt!147613 (MissingZero!2276 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15043 (_ BitVec 32)) SeekEntryResult!2276)

(assert (=> b!297248 (= lt!147613 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!297244 () Bool)

(declare-fun res!156752 () Bool)

(assert (=> b!297244 (=> (not res!156752) (not e!187840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297244 (= res!156752 (validKeyInArray!0 k0!2524))))

(declare-fun res!156754 () Bool)

(assert (=> start!29372 (=> (not res!156754) (not e!187840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29372 (= res!156754 (validMask!0 mask!3809))))

(assert (=> start!29372 e!187840))

(assert (=> start!29372 true))

(declare-fun array_inv!5100 (array!15043) Bool)

(assert (=> start!29372 (array_inv!5100 a!3312)))

(declare-fun b!297249 () Bool)

(declare-fun res!156751 () Bool)

(assert (=> b!297249 (=> (not res!156751) (not e!187840))))

(assert (=> b!297249 (= res!156751 (and (= (size!7481 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7481 a!3312))))))

(declare-fun b!297250 () Bool)

(declare-fun res!156748 () Bool)

(assert (=> b!297250 (=> (not res!156748) (not e!187842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15043 (_ BitVec 32)) Bool)

(assert (=> b!297250 (= res!156748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297251 () Bool)

(assert (=> b!297251 (and (= lt!147617 lt!147618) (= (select (store (arr!7128 a!3312) i!1256 k0!2524) (index!11276 lt!147618)) k0!2524))))

(declare-fun lt!147612 () Unit!9214)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15043 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9214)

(assert (=> b!297251 (= lt!147612 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147616 (index!11276 lt!147618) (x!29510 lt!147618) mask!3809))))

(assert (=> b!297251 (and (= (select (arr!7128 a!3312) (index!11276 lt!147618)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11276 lt!147618) i!1256))))

(declare-fun Unit!9216 () Unit!9214)

(assert (=> b!297251 (= e!187843 Unit!9216)))

(declare-fun b!297252 () Bool)

(assert (=> b!297252 false))

(declare-fun Unit!9217 () Unit!9214)

(assert (=> b!297252 (= e!187843 Unit!9217)))

(declare-fun b!297253 () Bool)

(declare-fun Unit!9218 () Unit!9214)

(assert (=> b!297253 (= e!187839 Unit!9218)))

(assert (=> b!297253 false))

(assert (= (and start!29372 res!156754) b!297249))

(assert (= (and b!297249 res!156751) b!297244))

(assert (= (and b!297244 res!156752) b!297247))

(assert (= (and b!297247 res!156753) b!297248))

(assert (= (and b!297248 res!156749) b!297250))

(assert (= (and b!297250 res!156748) b!297243))

(assert (= (and b!297243 res!156750) b!297245))

(assert (= (and b!297245 c!47831) b!297253))

(assert (= (and b!297245 (not c!47831)) b!297246))

(assert (= (and b!297246 c!47830) b!297251))

(assert (= (and b!297246 (not c!47830)) b!297252))

(declare-fun m!309525 () Bool)

(assert (=> b!297247 m!309525))

(declare-fun m!309527 () Bool)

(assert (=> b!297250 m!309527))

(declare-fun m!309529 () Bool)

(assert (=> b!297251 m!309529))

(declare-fun m!309531 () Bool)

(assert (=> b!297251 m!309531))

(declare-fun m!309533 () Bool)

(assert (=> b!297251 m!309533))

(declare-fun m!309535 () Bool)

(assert (=> b!297251 m!309535))

(declare-fun m!309537 () Bool)

(assert (=> b!297244 m!309537))

(assert (=> b!297243 m!309529))

(declare-fun m!309539 () Bool)

(assert (=> b!297243 m!309539))

(declare-fun m!309541 () Bool)

(assert (=> b!297243 m!309541))

(declare-fun m!309543 () Bool)

(assert (=> b!297243 m!309543))

(assert (=> b!297245 m!309535))

(declare-fun m!309545 () Bool)

(assert (=> start!29372 m!309545))

(declare-fun m!309547 () Bool)

(assert (=> start!29372 m!309547))

(declare-fun m!309549 () Bool)

(assert (=> b!297248 m!309549))

(check-sat (not b!297244) (not start!29372) (not b!297243) (not b!297247) (not b!297251) (not b!297250) (not b!297248))
(check-sat)
