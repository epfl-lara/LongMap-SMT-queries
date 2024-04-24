; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29638 () Bool)

(assert start!29638)

(declare-fun b!299147 () Bool)

(declare-fun e!188963 () Bool)

(declare-fun e!188964 () Bool)

(assert (=> b!299147 (= e!188963 e!188964)))

(declare-fun res!157762 () Bool)

(assert (=> b!299147 (=> (not res!157762) (not e!188964))))

(declare-datatypes ((SeekEntryResult!2273 0))(
  ( (MissingZero!2273 (index!11265 (_ BitVec 32))) (Found!2273 (index!11266 (_ BitVec 32))) (Intermediate!2273 (undefined!3085 Bool) (index!11267 (_ BitVec 32)) (x!29613 (_ BitVec 32))) (Undefined!2273) (MissingVacant!2273 (index!11268 (_ BitVec 32))) )
))
(declare-fun lt!148801 () SeekEntryResult!2273)

(declare-datatypes ((array!15117 0))(
  ( (array!15118 (arr!7159 (Array (_ BitVec 32) (_ BitVec 64))) (size!7511 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15117)

(declare-fun lt!148798 () Bool)

(assert (=> b!299147 (= res!157762 (and (or lt!148798 (not (undefined!3085 lt!148801))) (not lt!148798) (= (select (arr!7159 a!3312) (index!11267 lt!148801)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!299147 (= lt!148798 (not ((_ is Intermediate!2273) lt!148801)))))

(declare-fun b!299148 () Bool)

(declare-fun res!157765 () Bool)

(declare-fun e!188962 () Bool)

(assert (=> b!299148 (=> (not res!157765) (not e!188962))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299148 (= res!157765 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun b!299149 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!148797 () array!15117)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15117 (_ BitVec 32)) SeekEntryResult!2273)

(assert (=> b!299149 (= e!188964 (not (= (seekEntryOrOpen!0 k0!2524 lt!148797 mask!3809) (Found!2273 i!1256))))))

(declare-fun lt!148802 () (_ BitVec 32))

(declare-datatypes ((Unit!9283 0))(
  ( (Unit!9284) )
))
(declare-fun lt!148800 () Unit!9283)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!15117 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9283)

(assert (=> b!299149 (= lt!148800 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!148802 (index!11267 lt!148801) (x!29613 lt!148801) mask!3809))))

(assert (=> b!299149 (= (index!11267 lt!148801) i!1256)))

(declare-fun res!157761 () Bool)

(assert (=> start!29638 (=> (not res!157761) (not e!188962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29638 (= res!157761 (validMask!0 mask!3809))))

(assert (=> start!29638 e!188962))

(assert (=> start!29638 true))

(declare-fun array_inv!5109 (array!15117) Bool)

(assert (=> start!29638 (array_inv!5109 a!3312)))

(declare-fun b!299150 () Bool)

(declare-fun e!188960 () Bool)

(assert (=> b!299150 (= e!188962 e!188960)))

(declare-fun res!157767 () Bool)

(assert (=> b!299150 (=> (not res!157767) (not e!188960))))

(declare-fun lt!148803 () SeekEntryResult!2273)

(declare-fun lt!148796 () Bool)

(assert (=> b!299150 (= res!157767 (or lt!148796 (= lt!148803 (MissingVacant!2273 i!1256))))))

(assert (=> b!299150 (= lt!148796 (= lt!148803 (MissingZero!2273 i!1256)))))

(assert (=> b!299150 (= lt!148803 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!299151 () Bool)

(assert (=> b!299151 (= e!188960 e!188963)))

(declare-fun res!157763 () Bool)

(assert (=> b!299151 (=> (not res!157763) (not e!188963))))

(assert (=> b!299151 (= res!157763 (and (not lt!148796) (= lt!148803 (MissingVacant!2273 i!1256))))))

(declare-fun lt!148799 () SeekEntryResult!2273)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15117 (_ BitVec 32)) SeekEntryResult!2273)

(assert (=> b!299151 (= lt!148799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148802 k0!2524 lt!148797 mask!3809))))

(assert (=> b!299151 (= lt!148797 (array!15118 (store (arr!7159 a!3312) i!1256 k0!2524) (size!7511 a!3312)))))

(assert (=> b!299151 (= lt!148801 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148802 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299151 (= lt!148802 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!299152 () Bool)

(declare-fun res!157764 () Bool)

(assert (=> b!299152 (=> (not res!157764) (not e!188960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15117 (_ BitVec 32)) Bool)

(assert (=> b!299152 (= res!157764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!299153 () Bool)

(declare-fun res!157766 () Bool)

(assert (=> b!299153 (=> (not res!157766) (not e!188962))))

(assert (=> b!299153 (= res!157766 (and (= (size!7511 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7511 a!3312))))))

(declare-fun b!299154 () Bool)

(declare-fun res!157760 () Bool)

(assert (=> b!299154 (=> (not res!157760) (not e!188962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299154 (= res!157760 (validKeyInArray!0 k0!2524))))

(assert (= (and start!29638 res!157761) b!299153))

(assert (= (and b!299153 res!157766) b!299154))

(assert (= (and b!299154 res!157760) b!299148))

(assert (= (and b!299148 res!157765) b!299150))

(assert (= (and b!299150 res!157767) b!299152))

(assert (= (and b!299152 res!157764) b!299151))

(assert (= (and b!299151 res!157763) b!299147))

(assert (= (and b!299147 res!157762) b!299149))

(declare-fun m!311661 () Bool)

(assert (=> b!299151 m!311661))

(declare-fun m!311663 () Bool)

(assert (=> b!299151 m!311663))

(declare-fun m!311665 () Bool)

(assert (=> b!299151 m!311665))

(declare-fun m!311667 () Bool)

(assert (=> b!299151 m!311667))

(declare-fun m!311669 () Bool)

(assert (=> b!299149 m!311669))

(declare-fun m!311671 () Bool)

(assert (=> b!299149 m!311671))

(declare-fun m!311673 () Bool)

(assert (=> b!299150 m!311673))

(declare-fun m!311675 () Bool)

(assert (=> b!299147 m!311675))

(declare-fun m!311677 () Bool)

(assert (=> b!299148 m!311677))

(declare-fun m!311679 () Bool)

(assert (=> b!299152 m!311679))

(declare-fun m!311681 () Bool)

(assert (=> b!299154 m!311681))

(declare-fun m!311683 () Bool)

(assert (=> start!29638 m!311683))

(declare-fun m!311685 () Bool)

(assert (=> start!29638 m!311685))

(check-sat (not start!29638) (not b!299150) (not b!299152) (not b!299149) (not b!299148) (not b!299151) (not b!299154))
(check-sat)
(get-model)

(declare-fun d!67555 () Bool)

(assert (=> d!67555 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!299154 d!67555))

(declare-fun d!67557 () Bool)

(declare-fun res!157820 () Bool)

(declare-fun e!188999 () Bool)

(assert (=> d!67557 (=> res!157820 e!188999)))

(assert (=> d!67557 (= res!157820 (= (select (arr!7159 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67557 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!188999)))

(declare-fun b!299207 () Bool)

(declare-fun e!189000 () Bool)

(assert (=> b!299207 (= e!188999 e!189000)))

(declare-fun res!157821 () Bool)

(assert (=> b!299207 (=> (not res!157821) (not e!189000))))

(assert (=> b!299207 (= res!157821 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7511 a!3312)))))

(declare-fun b!299208 () Bool)

(assert (=> b!299208 (= e!189000 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67557 (not res!157820)) b!299207))

(assert (= (and b!299207 res!157821) b!299208))

(declare-fun m!311739 () Bool)

(assert (=> d!67557 m!311739))

(declare-fun m!311741 () Bool)

(assert (=> b!299208 m!311741))

(assert (=> b!299148 d!67557))

(declare-fun d!67559 () Bool)

(assert (=> d!67559 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29638 d!67559))

(declare-fun d!67561 () Bool)

(assert (=> d!67561 (= (array_inv!5109 a!3312) (bvsge (size!7511 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29638 d!67561))

(declare-fun b!299217 () Bool)

(declare-fun e!189008 () Bool)

(declare-fun call!25790 () Bool)

(assert (=> b!299217 (= e!189008 call!25790)))

(declare-fun b!299218 () Bool)

(declare-fun e!189009 () Bool)

(assert (=> b!299218 (= e!189009 call!25790)))

(declare-fun b!299219 () Bool)

(declare-fun e!189007 () Bool)

(assert (=> b!299219 (= e!189007 e!189008)))

(declare-fun c!48284 () Bool)

(assert (=> b!299219 (= c!48284 (validKeyInArray!0 (select (arr!7159 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25787 () Bool)

(assert (=> bm!25787 (= call!25790 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!67563 () Bool)

(declare-fun res!157827 () Bool)

(assert (=> d!67563 (=> res!157827 e!189007)))

(assert (=> d!67563 (= res!157827 (bvsge #b00000000000000000000000000000000 (size!7511 a!3312)))))

(assert (=> d!67563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189007)))

(declare-fun b!299220 () Bool)

(assert (=> b!299220 (= e!189008 e!189009)))

(declare-fun lt!148860 () (_ BitVec 64))

(assert (=> b!299220 (= lt!148860 (select (arr!7159 a!3312) #b00000000000000000000000000000000))))

(declare-fun lt!148858 () Unit!9283)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15117 (_ BitVec 64) (_ BitVec 32)) Unit!9283)

(assert (=> b!299220 (= lt!148858 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148860 #b00000000000000000000000000000000))))

(assert (=> b!299220 (arrayContainsKey!0 a!3312 lt!148860 #b00000000000000000000000000000000)))

(declare-fun lt!148859 () Unit!9283)

(assert (=> b!299220 (= lt!148859 lt!148858)))

(declare-fun res!157826 () Bool)

(assert (=> b!299220 (= res!157826 (= (seekEntryOrOpen!0 (select (arr!7159 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2273 #b00000000000000000000000000000000)))))

(assert (=> b!299220 (=> (not res!157826) (not e!189009))))

(assert (= (and d!67563 (not res!157827)) b!299219))

(assert (= (and b!299219 c!48284) b!299220))

(assert (= (and b!299219 (not c!48284)) b!299217))

(assert (= (and b!299220 res!157826) b!299218))

(assert (= (or b!299218 b!299217) bm!25787))

(assert (=> b!299219 m!311739))

(assert (=> b!299219 m!311739))

(declare-fun m!311743 () Bool)

(assert (=> b!299219 m!311743))

(declare-fun m!311745 () Bool)

(assert (=> bm!25787 m!311745))

(assert (=> b!299220 m!311739))

(declare-fun m!311747 () Bool)

(assert (=> b!299220 m!311747))

(declare-fun m!311749 () Bool)

(assert (=> b!299220 m!311749))

(assert (=> b!299220 m!311739))

(declare-fun m!311751 () Bool)

(assert (=> b!299220 m!311751))

(assert (=> b!299152 d!67563))

(declare-fun b!299275 () Bool)

(declare-fun e!189041 () Bool)

(declare-fun lt!148886 () SeekEntryResult!2273)

(assert (=> b!299275 (= e!189041 (bvsge (x!29613 lt!148886) #b01111111111111111111111111111110))))

(declare-fun b!299276 () Bool)

(assert (=> b!299276 (and (bvsge (index!11267 lt!148886) #b00000000000000000000000000000000) (bvslt (index!11267 lt!148886) (size!7511 lt!148797)))))

(declare-fun res!157841 () Bool)

(assert (=> b!299276 (= res!157841 (= (select (arr!7159 lt!148797) (index!11267 lt!148886)) k0!2524))))

(declare-fun e!189043 () Bool)

(assert (=> b!299276 (=> res!157841 e!189043)))

(declare-fun e!189042 () Bool)

(assert (=> b!299276 (= e!189042 e!189043)))

(declare-fun e!189045 () SeekEntryResult!2273)

(declare-fun b!299277 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299277 (= e!189045 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148802 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 lt!148797 mask!3809))))

(declare-fun b!299278 () Bool)

(assert (=> b!299278 (and (bvsge (index!11267 lt!148886) #b00000000000000000000000000000000) (bvslt (index!11267 lt!148886) (size!7511 lt!148797)))))

(assert (=> b!299278 (= e!189043 (= (select (arr!7159 lt!148797) (index!11267 lt!148886)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299279 () Bool)

(assert (=> b!299279 (= e!189041 e!189042)))

(declare-fun res!157842 () Bool)

(assert (=> b!299279 (= res!157842 (and ((_ is Intermediate!2273) lt!148886) (not (undefined!3085 lt!148886)) (bvslt (x!29613 lt!148886) #b01111111111111111111111111111110) (bvsge (x!29613 lt!148886) #b00000000000000000000000000000000) (bvsge (x!29613 lt!148886) #b00000000000000000000000000000000)))))

(assert (=> b!299279 (=> (not res!157842) (not e!189042))))

(declare-fun b!299280 () Bool)

(declare-fun e!189044 () SeekEntryResult!2273)

(assert (=> b!299280 (= e!189044 e!189045)))

(declare-fun c!48307 () Bool)

(declare-fun lt!148887 () (_ BitVec 64))

(assert (=> b!299280 (= c!48307 (or (= lt!148887 k0!2524) (= (bvadd lt!148887 lt!148887) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!299281 () Bool)

(assert (=> b!299281 (= e!189045 (Intermediate!2273 false lt!148802 #b00000000000000000000000000000000))))

(declare-fun b!299282 () Bool)

(assert (=> b!299282 (= e!189044 (Intermediate!2273 true lt!148802 #b00000000000000000000000000000000))))

(declare-fun b!299283 () Bool)

(assert (=> b!299283 (and (bvsge (index!11267 lt!148886) #b00000000000000000000000000000000) (bvslt (index!11267 lt!148886) (size!7511 lt!148797)))))

(declare-fun res!157840 () Bool)

(assert (=> b!299283 (= res!157840 (= (select (arr!7159 lt!148797) (index!11267 lt!148886)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299283 (=> res!157840 e!189043)))

(declare-fun d!67569 () Bool)

(assert (=> d!67569 e!189041))

(declare-fun c!48306 () Bool)

(assert (=> d!67569 (= c!48306 (and ((_ is Intermediate!2273) lt!148886) (undefined!3085 lt!148886)))))

(assert (=> d!67569 (= lt!148886 e!189044)))

(declare-fun c!48308 () Bool)

(assert (=> d!67569 (= c!48308 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67569 (= lt!148887 (select (arr!7159 lt!148797) lt!148802))))

(assert (=> d!67569 (validMask!0 mask!3809)))

(assert (=> d!67569 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148802 k0!2524 lt!148797 mask!3809) lt!148886)))

(assert (= (and d!67569 c!48308) b!299282))

(assert (= (and d!67569 (not c!48308)) b!299280))

(assert (= (and b!299280 c!48307) b!299281))

(assert (= (and b!299280 (not c!48307)) b!299277))

(assert (= (and d!67569 c!48306) b!299275))

(assert (= (and d!67569 (not c!48306)) b!299279))

(assert (= (and b!299279 res!157842) b!299276))

(assert (= (and b!299276 (not res!157841)) b!299283))

(assert (= (and b!299283 (not res!157840)) b!299278))

(declare-fun m!311789 () Bool)

(assert (=> b!299276 m!311789))

(assert (=> b!299283 m!311789))

(declare-fun m!311791 () Bool)

(assert (=> b!299277 m!311791))

(assert (=> b!299277 m!311791))

(declare-fun m!311793 () Bool)

(assert (=> b!299277 m!311793))

(declare-fun m!311795 () Bool)

(assert (=> d!67569 m!311795))

(assert (=> d!67569 m!311683))

(assert (=> b!299278 m!311789))

(assert (=> b!299151 d!67569))

(declare-fun b!299284 () Bool)

(declare-fun e!189046 () Bool)

(declare-fun lt!148888 () SeekEntryResult!2273)

(assert (=> b!299284 (= e!189046 (bvsge (x!29613 lt!148888) #b01111111111111111111111111111110))))

(declare-fun b!299285 () Bool)

(assert (=> b!299285 (and (bvsge (index!11267 lt!148888) #b00000000000000000000000000000000) (bvslt (index!11267 lt!148888) (size!7511 a!3312)))))

(declare-fun res!157844 () Bool)

(assert (=> b!299285 (= res!157844 (= (select (arr!7159 a!3312) (index!11267 lt!148888)) k0!2524))))

(declare-fun e!189048 () Bool)

(assert (=> b!299285 (=> res!157844 e!189048)))

(declare-fun e!189047 () Bool)

(assert (=> b!299285 (= e!189047 e!189048)))

(declare-fun e!189050 () SeekEntryResult!2273)

(declare-fun b!299286 () Bool)

(assert (=> b!299286 (= e!189050 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148802 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!299287 () Bool)

(assert (=> b!299287 (and (bvsge (index!11267 lt!148888) #b00000000000000000000000000000000) (bvslt (index!11267 lt!148888) (size!7511 a!3312)))))

(assert (=> b!299287 (= e!189048 (= (select (arr!7159 a!3312) (index!11267 lt!148888)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299288 () Bool)

(assert (=> b!299288 (= e!189046 e!189047)))

(declare-fun res!157845 () Bool)

(assert (=> b!299288 (= res!157845 (and ((_ is Intermediate!2273) lt!148888) (not (undefined!3085 lt!148888)) (bvslt (x!29613 lt!148888) #b01111111111111111111111111111110) (bvsge (x!29613 lt!148888) #b00000000000000000000000000000000) (bvsge (x!29613 lt!148888) #b00000000000000000000000000000000)))))

(assert (=> b!299288 (=> (not res!157845) (not e!189047))))

(declare-fun b!299289 () Bool)

(declare-fun e!189049 () SeekEntryResult!2273)

(assert (=> b!299289 (= e!189049 e!189050)))

(declare-fun c!48310 () Bool)

(declare-fun lt!148889 () (_ BitVec 64))

(assert (=> b!299289 (= c!48310 (or (= lt!148889 k0!2524) (= (bvadd lt!148889 lt!148889) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!299290 () Bool)

(assert (=> b!299290 (= e!189050 (Intermediate!2273 false lt!148802 #b00000000000000000000000000000000))))

(declare-fun b!299291 () Bool)

(assert (=> b!299291 (= e!189049 (Intermediate!2273 true lt!148802 #b00000000000000000000000000000000))))

(declare-fun b!299292 () Bool)

(assert (=> b!299292 (and (bvsge (index!11267 lt!148888) #b00000000000000000000000000000000) (bvslt (index!11267 lt!148888) (size!7511 a!3312)))))

(declare-fun res!157843 () Bool)

(assert (=> b!299292 (= res!157843 (= (select (arr!7159 a!3312) (index!11267 lt!148888)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299292 (=> res!157843 e!189048)))

(declare-fun d!67577 () Bool)

(assert (=> d!67577 e!189046))

(declare-fun c!48309 () Bool)

(assert (=> d!67577 (= c!48309 (and ((_ is Intermediate!2273) lt!148888) (undefined!3085 lt!148888)))))

(assert (=> d!67577 (= lt!148888 e!189049)))

(declare-fun c!48311 () Bool)

(assert (=> d!67577 (= c!48311 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67577 (= lt!148889 (select (arr!7159 a!3312) lt!148802))))

(assert (=> d!67577 (validMask!0 mask!3809)))

(assert (=> d!67577 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148802 k0!2524 a!3312 mask!3809) lt!148888)))

(assert (= (and d!67577 c!48311) b!299291))

(assert (= (and d!67577 (not c!48311)) b!299289))

(assert (= (and b!299289 c!48310) b!299290))

(assert (= (and b!299289 (not c!48310)) b!299286))

(assert (= (and d!67577 c!48309) b!299284))

(assert (= (and d!67577 (not c!48309)) b!299288))

(assert (= (and b!299288 res!157845) b!299285))

(assert (= (and b!299285 (not res!157844)) b!299292))

(assert (= (and b!299292 (not res!157843)) b!299287))

(declare-fun m!311797 () Bool)

(assert (=> b!299285 m!311797))

(assert (=> b!299292 m!311797))

(assert (=> b!299286 m!311791))

(assert (=> b!299286 m!311791))

(declare-fun m!311799 () Bool)

(assert (=> b!299286 m!311799))

(declare-fun m!311801 () Bool)

(assert (=> d!67577 m!311801))

(assert (=> d!67577 m!311683))

(assert (=> b!299287 m!311797))

(assert (=> b!299151 d!67577))

(declare-fun d!67579 () Bool)

(declare-fun lt!148895 () (_ BitVec 32))

(declare-fun lt!148894 () (_ BitVec 32))

(assert (=> d!67579 (= lt!148895 (bvmul (bvxor lt!148894 (bvlshr lt!148894 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67579 (= lt!148894 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67579 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157846 (let ((h!5225 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29617 (bvmul (bvxor h!5225 (bvlshr h!5225 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29617 (bvlshr x!29617 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157846 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157846 #b00000000000000000000000000000000))))))

(assert (=> d!67579 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!148895 (bvlshr lt!148895 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!299151 d!67579))

(declare-fun e!189085 () SeekEntryResult!2273)

(declare-fun b!299348 () Bool)

(declare-fun lt!148924 () SeekEntryResult!2273)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15117 (_ BitVec 32)) SeekEntryResult!2273)

(assert (=> b!299348 (= e!189085 (seekKeyOrZeroReturnVacant!0 (x!29613 lt!148924) (index!11267 lt!148924) (index!11267 lt!148924) k0!2524 a!3312 mask!3809))))

(declare-fun b!299349 () Bool)

(declare-fun e!189084 () SeekEntryResult!2273)

(declare-fun e!189083 () SeekEntryResult!2273)

(assert (=> b!299349 (= e!189084 e!189083)))

(declare-fun lt!148925 () (_ BitVec 64))

(assert (=> b!299349 (= lt!148925 (select (arr!7159 a!3312) (index!11267 lt!148924)))))

(declare-fun c!48336 () Bool)

(assert (=> b!299349 (= c!48336 (= lt!148925 k0!2524))))

(declare-fun b!299350 () Bool)

(assert (=> b!299350 (= e!189083 (Found!2273 (index!11267 lt!148924)))))

(declare-fun b!299351 () Bool)

(declare-fun c!48337 () Bool)

(assert (=> b!299351 (= c!48337 (= lt!148925 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299351 (= e!189083 e!189085)))

(declare-fun d!67587 () Bool)

(declare-fun lt!148923 () SeekEntryResult!2273)

(assert (=> d!67587 (and (or ((_ is Undefined!2273) lt!148923) (not ((_ is Found!2273) lt!148923)) (and (bvsge (index!11266 lt!148923) #b00000000000000000000000000000000) (bvslt (index!11266 lt!148923) (size!7511 a!3312)))) (or ((_ is Undefined!2273) lt!148923) ((_ is Found!2273) lt!148923) (not ((_ is MissingZero!2273) lt!148923)) (and (bvsge (index!11265 lt!148923) #b00000000000000000000000000000000) (bvslt (index!11265 lt!148923) (size!7511 a!3312)))) (or ((_ is Undefined!2273) lt!148923) ((_ is Found!2273) lt!148923) ((_ is MissingZero!2273) lt!148923) (not ((_ is MissingVacant!2273) lt!148923)) (and (bvsge (index!11268 lt!148923) #b00000000000000000000000000000000) (bvslt (index!11268 lt!148923) (size!7511 a!3312)))) (or ((_ is Undefined!2273) lt!148923) (ite ((_ is Found!2273) lt!148923) (= (select (arr!7159 a!3312) (index!11266 lt!148923)) k0!2524) (ite ((_ is MissingZero!2273) lt!148923) (= (select (arr!7159 a!3312) (index!11265 lt!148923)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2273) lt!148923) (= (select (arr!7159 a!3312) (index!11268 lt!148923)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67587 (= lt!148923 e!189084)))

(declare-fun c!48335 () Bool)

(assert (=> d!67587 (= c!48335 (and ((_ is Intermediate!2273) lt!148924) (undefined!3085 lt!148924)))))

(assert (=> d!67587 (= lt!148924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67587 (validMask!0 mask!3809)))

(assert (=> d!67587 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!148923)))

(declare-fun b!299352 () Bool)

(assert (=> b!299352 (= e!189084 Undefined!2273)))

(declare-fun b!299353 () Bool)

(assert (=> b!299353 (= e!189085 (MissingZero!2273 (index!11267 lt!148924)))))

(assert (= (and d!67587 c!48335) b!299352))

(assert (= (and d!67587 (not c!48335)) b!299349))

(assert (= (and b!299349 c!48336) b!299350))

(assert (= (and b!299349 (not c!48336)) b!299351))

(assert (= (and b!299351 c!48337) b!299353))

(assert (= (and b!299351 (not c!48337)) b!299348))

(declare-fun m!311815 () Bool)

(assert (=> b!299348 m!311815))

(declare-fun m!311817 () Bool)

(assert (=> b!299349 m!311817))

(declare-fun m!311819 () Bool)

(assert (=> d!67587 m!311819))

(assert (=> d!67587 m!311683))

(assert (=> d!67587 m!311667))

(declare-fun m!311821 () Bool)

(assert (=> d!67587 m!311821))

(declare-fun m!311823 () Bool)

(assert (=> d!67587 m!311823))

(assert (=> d!67587 m!311667))

(declare-fun m!311825 () Bool)

(assert (=> d!67587 m!311825))

(assert (=> b!299150 d!67587))

(declare-fun lt!148927 () SeekEntryResult!2273)

(declare-fun b!299362 () Bool)

(declare-fun e!189092 () SeekEntryResult!2273)

(assert (=> b!299362 (= e!189092 (seekKeyOrZeroReturnVacant!0 (x!29613 lt!148927) (index!11267 lt!148927) (index!11267 lt!148927) k0!2524 lt!148797 mask!3809))))

(declare-fun b!299363 () Bool)

(declare-fun e!189091 () SeekEntryResult!2273)

(declare-fun e!189090 () SeekEntryResult!2273)

(assert (=> b!299363 (= e!189091 e!189090)))

(declare-fun lt!148928 () (_ BitVec 64))

(assert (=> b!299363 (= lt!148928 (select (arr!7159 lt!148797) (index!11267 lt!148927)))))

(declare-fun c!48343 () Bool)

(assert (=> b!299363 (= c!48343 (= lt!148928 k0!2524))))

(declare-fun b!299364 () Bool)

(assert (=> b!299364 (= e!189090 (Found!2273 (index!11267 lt!148927)))))

(declare-fun b!299365 () Bool)

(declare-fun c!48344 () Bool)

(assert (=> b!299365 (= c!48344 (= lt!148928 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299365 (= e!189090 e!189092)))

(declare-fun d!67591 () Bool)

(declare-fun lt!148926 () SeekEntryResult!2273)

(assert (=> d!67591 (and (or ((_ is Undefined!2273) lt!148926) (not ((_ is Found!2273) lt!148926)) (and (bvsge (index!11266 lt!148926) #b00000000000000000000000000000000) (bvslt (index!11266 lt!148926) (size!7511 lt!148797)))) (or ((_ is Undefined!2273) lt!148926) ((_ is Found!2273) lt!148926) (not ((_ is MissingZero!2273) lt!148926)) (and (bvsge (index!11265 lt!148926) #b00000000000000000000000000000000) (bvslt (index!11265 lt!148926) (size!7511 lt!148797)))) (or ((_ is Undefined!2273) lt!148926) ((_ is Found!2273) lt!148926) ((_ is MissingZero!2273) lt!148926) (not ((_ is MissingVacant!2273) lt!148926)) (and (bvsge (index!11268 lt!148926) #b00000000000000000000000000000000) (bvslt (index!11268 lt!148926) (size!7511 lt!148797)))) (or ((_ is Undefined!2273) lt!148926) (ite ((_ is Found!2273) lt!148926) (= (select (arr!7159 lt!148797) (index!11266 lt!148926)) k0!2524) (ite ((_ is MissingZero!2273) lt!148926) (= (select (arr!7159 lt!148797) (index!11265 lt!148926)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2273) lt!148926) (= (select (arr!7159 lt!148797) (index!11268 lt!148926)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67591 (= lt!148926 e!189091)))

(declare-fun c!48342 () Bool)

(assert (=> d!67591 (= c!48342 (and ((_ is Intermediate!2273) lt!148927) (undefined!3085 lt!148927)))))

(assert (=> d!67591 (= lt!148927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 lt!148797 mask!3809))))

(assert (=> d!67591 (validMask!0 mask!3809)))

(assert (=> d!67591 (= (seekEntryOrOpen!0 k0!2524 lt!148797 mask!3809) lt!148926)))

(declare-fun b!299366 () Bool)

(assert (=> b!299366 (= e!189091 Undefined!2273)))

(declare-fun b!299367 () Bool)

(assert (=> b!299367 (= e!189092 (MissingZero!2273 (index!11267 lt!148927)))))

(assert (= (and d!67591 c!48342) b!299366))

(assert (= (and d!67591 (not c!48342)) b!299363))

(assert (= (and b!299363 c!48343) b!299364))

(assert (= (and b!299363 (not c!48343)) b!299365))

(assert (= (and b!299365 c!48344) b!299367))

(assert (= (and b!299365 (not c!48344)) b!299362))

(declare-fun m!311827 () Bool)

(assert (=> b!299362 m!311827))

(declare-fun m!311829 () Bool)

(assert (=> b!299363 m!311829))

(declare-fun m!311831 () Bool)

(assert (=> d!67591 m!311831))

(assert (=> d!67591 m!311683))

(assert (=> d!67591 m!311667))

(declare-fun m!311833 () Bool)

(assert (=> d!67591 m!311833))

(declare-fun m!311835 () Bool)

(assert (=> d!67591 m!311835))

(assert (=> d!67591 m!311667))

(declare-fun m!311837 () Bool)

(assert (=> d!67591 m!311837))

(assert (=> b!299149 d!67591))

(declare-fun call!25804 () (_ BitVec 32))

(declare-fun b!299438 () Bool)

(declare-fun e!189133 () Unit!9283)

(assert (=> b!299438 (= e!189133 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) call!25804 (index!11267 lt!148801) (x!29613 lt!148801) mask!3809))))

(declare-fun d!67593 () Bool)

(declare-fun e!189131 () Bool)

(assert (=> d!67593 e!189131))

(declare-fun res!157871 () Bool)

(assert (=> d!67593 (=> (not res!157871) (not e!189131))))

(assert (=> d!67593 (= res!157871 (and (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7511 a!3312))))))

(declare-fun lt!148963 () Unit!9283)

(assert (=> d!67593 (= lt!148963 e!189133)))

(declare-fun c!48375 () Bool)

(assert (=> d!67593 (= c!48375 (= #b00000000000000000000000000000000 (x!29613 lt!148801)))))

(assert (=> d!67593 (validMask!0 mask!3809)))

(assert (=> d!67593 (= (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!148802 (index!11267 lt!148801) (x!29613 lt!148801) mask!3809) lt!148963)))

(declare-fun b!299439 () Bool)

(assert (=> b!299439 (= e!189131 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148802 k0!2524 (array!15118 (store (arr!7159 a!3312) i!1256 k0!2524) (size!7511 a!3312)) mask!3809) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148802 k0!2524 a!3312 mask!3809)))))

(declare-fun b!299440 () Bool)

(declare-fun Unit!9291 () Unit!9283)

(assert (=> b!299440 (= e!189133 Unit!9291)))

(declare-fun c!48374 () Bool)

(assert (=> b!299440 (= c!48374 (not (= (index!11267 lt!148801) lt!148802)))))

(declare-fun lt!148960 () Unit!9283)

(declare-fun e!189135 () Unit!9283)

(assert (=> b!299440 (= lt!148960 e!189135)))

(assert (=> b!299440 (= lt!148802 (index!11267 lt!148801))))

(declare-fun lt!148962 () Unit!9283)

(declare-fun Unit!9293 () Unit!9283)

(assert (=> b!299440 (= lt!148962 Unit!9293)))

(assert (=> b!299440 (= (select (arr!7159 a!3312) lt!148802) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!299441 () Bool)

(declare-fun e!189132 () (_ BitVec 32))

(assert (=> b!299441 (= e!189132 call!25804)))

(declare-fun c!48373 () Bool)

(declare-fun call!25805 () SeekEntryResult!2273)

(declare-fun bm!25801 () Bool)

(assert (=> bm!25801 (= call!25805 (seekKeyOrZeroOrLongMinValue!0 (ite c!48373 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!189132 k0!2524 a!3312 mask!3809))))

(declare-fun c!48376 () Bool)

(assert (=> bm!25801 (= c!48376 c!48373)))

(declare-fun b!299442 () Bool)

(declare-fun e!189136 () Unit!9283)

(declare-fun Unit!9295 () Unit!9283)

(assert (=> b!299442 (= e!189136 Unit!9295)))

(declare-fun b!299443 () Bool)

(assert (=> b!299443 (= c!48373 (or (= (select (arr!7159 a!3312) lt!148802) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7159 a!3312) lt!148802) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!189134 () Unit!9283)

(assert (=> b!299443 (= e!189135 e!189134)))

(declare-fun bm!25802 () Bool)

(assert (=> bm!25802 (= call!25804 (nextIndex!0 lt!148802 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809))))

(declare-fun b!299444 () Bool)

(declare-fun Unit!9297 () Unit!9283)

(assert (=> b!299444 (= e!189135 Unit!9297)))

(declare-fun b!299445 () Bool)

(assert (=> b!299445 false))

(declare-fun Unit!9298 () Unit!9283)

(assert (=> b!299445 (= e!189136 Unit!9298)))

(declare-fun b!299446 () Bool)

(declare-fun Unit!9299 () Unit!9283)

(assert (=> b!299446 (= e!189134 Unit!9299)))

(assert (=> b!299446 (= call!25805 (Intermediate!2273 false lt!148802 (x!29613 lt!148801)))))

(declare-fun lt!148959 () Unit!9283)

(declare-fun Unit!9300 () Unit!9283)

(assert (=> b!299446 (= lt!148959 Unit!9300)))

(assert (=> b!299446 false))

(declare-fun b!299447 () Bool)

(assert (=> b!299447 (= e!189132 lt!148802)))

(declare-fun b!299448 () Bool)

(declare-fun Unit!9301 () Unit!9283)

(assert (=> b!299448 (= e!189134 Unit!9301)))

(declare-fun c!48377 () Bool)

(assert (=> b!299448 (= c!48377 ((_ is Intermediate!2273) call!25805))))

(declare-fun lt!148961 () Unit!9283)

(assert (=> b!299448 (= lt!148961 e!189136)))

(assert (=> b!299448 false))

(assert (= (and d!67593 c!48375) b!299440))

(assert (= (and d!67593 (not c!48375)) b!299438))

(assert (= (and b!299440 c!48374) b!299443))

(assert (= (and b!299440 (not c!48374)) b!299444))

(assert (= (and b!299443 c!48373) b!299446))

(assert (= (and b!299443 (not c!48373)) b!299448))

(assert (= (and b!299448 c!48377) b!299442))

(assert (= (and b!299448 (not c!48377)) b!299445))

(assert (= (or b!299446 b!299448) bm!25801))

(assert (= (and bm!25801 c!48376) b!299447))

(assert (= (and bm!25801 (not c!48376)) b!299441))

(assert (= (or b!299441 b!299438) bm!25802))

(assert (= (and d!67593 res!157871) b!299439))

(assert (=> bm!25802 m!311791))

(assert (=> b!299443 m!311801))

(assert (=> d!67593 m!311683))

(declare-fun m!311873 () Bool)

(assert (=> b!299438 m!311873))

(declare-fun m!311875 () Bool)

(assert (=> bm!25801 m!311875))

(assert (=> b!299439 m!311663))

(declare-fun m!311877 () Bool)

(assert (=> b!299439 m!311877))

(assert (=> b!299439 m!311665))

(assert (=> b!299440 m!311801))

(assert (=> b!299149 d!67593))

(check-sat (not b!299348) (not d!67569) (not b!299208) (not d!67577) (not b!299220) (not bm!25802) (not b!299277) (not b!299362) (not d!67587) (not b!299286) (not bm!25787) (not b!299438) (not b!299219) (not d!67593) (not b!299439) (not d!67591) (not bm!25801))
(check-sat)
