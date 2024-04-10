; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29460 () Bool)

(assert start!29460)

(declare-fun b!298047 () Bool)

(declare-fun e!188323 () Bool)

(declare-fun e!188322 () Bool)

(assert (=> b!298047 (= e!188323 e!188322)))

(declare-fun res!157170 () Bool)

(assert (=> b!298047 (=> (not res!157170) (not e!188322))))

(declare-datatypes ((SeekEntryResult!2292 0))(
  ( (MissingZero!2292 (index!11341 (_ BitVec 32))) (Found!2292 (index!11342 (_ BitVec 32))) (Intermediate!2292 (undefined!3104 Bool) (index!11343 (_ BitVec 32)) (x!29563 (_ BitVec 32))) (Undefined!2292) (MissingVacant!2292 (index!11344 (_ BitVec 32))) )
))
(declare-fun lt!148159 () SeekEntryResult!2292)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!148157 () Bool)

(assert (=> b!298047 (= res!157170 (or lt!148157 (= lt!148159 (MissingVacant!2292 i!1256))))))

(assert (=> b!298047 (= lt!148157 (= lt!148159 (MissingZero!2292 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!15077 0))(
  ( (array!15078 (arr!7143 (Array (_ BitVec 32) (_ BitVec 64))) (size!7495 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15077)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15077 (_ BitVec 32)) SeekEntryResult!2292)

(assert (=> b!298047 (= lt!148159 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!298048 () Bool)

(declare-fun res!157166 () Bool)

(assert (=> b!298048 (=> (not res!157166) (not e!188322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15077 (_ BitVec 32)) Bool)

(assert (=> b!298048 (= res!157166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!298049 () Bool)

(declare-fun res!157167 () Bool)

(assert (=> b!298049 (=> (not res!157167) (not e!188323))))

(declare-fun arrayContainsKey!0 (array!15077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298049 (= res!157167 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!157168 () Bool)

(assert (=> start!29460 (=> (not res!157168) (not e!188323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29460 (= res!157168 (validMask!0 mask!3809))))

(assert (=> start!29460 e!188323))

(assert (=> start!29460 true))

(declare-fun array_inv!5106 (array!15077) Bool)

(assert (=> start!29460 (array_inv!5106 a!3312)))

(declare-fun lt!148160 () SeekEntryResult!2292)

(declare-fun b!298050 () Bool)

(get-info :version)

(assert (=> b!298050 (= e!188322 (and (not lt!148157) (= lt!148159 (MissingVacant!2292 i!1256)) ((_ is Intermediate!2292) lt!148160) (undefined!3104 lt!148160)))))

(declare-fun lt!148158 () SeekEntryResult!2292)

(declare-fun lt!148161 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15077 (_ BitVec 32)) SeekEntryResult!2292)

(assert (=> b!298050 (= lt!148158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148161 k0!2524 (array!15078 (store (arr!7143 a!3312) i!1256 k0!2524) (size!7495 a!3312)) mask!3809))))

(assert (=> b!298050 (= lt!148160 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148161 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298050 (= lt!148161 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!298051 () Bool)

(declare-fun res!157169 () Bool)

(assert (=> b!298051 (=> (not res!157169) (not e!188323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298051 (= res!157169 (validKeyInArray!0 k0!2524))))

(declare-fun b!298052 () Bool)

(declare-fun res!157165 () Bool)

(assert (=> b!298052 (=> (not res!157165) (not e!188323))))

(assert (=> b!298052 (= res!157165 (and (= (size!7495 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7495 a!3312))))))

(assert (= (and start!29460 res!157168) b!298052))

(assert (= (and b!298052 res!157165) b!298051))

(assert (= (and b!298051 res!157169) b!298049))

(assert (= (and b!298049 res!157167) b!298047))

(assert (= (and b!298047 res!157170) b!298048))

(assert (= (and b!298048 res!157166) b!298050))

(declare-fun m!310649 () Bool)

(assert (=> b!298051 m!310649))

(declare-fun m!310651 () Bool)

(assert (=> b!298050 m!310651))

(declare-fun m!310653 () Bool)

(assert (=> b!298050 m!310653))

(declare-fun m!310655 () Bool)

(assert (=> b!298050 m!310655))

(declare-fun m!310657 () Bool)

(assert (=> b!298050 m!310657))

(declare-fun m!310659 () Bool)

(assert (=> start!29460 m!310659))

(declare-fun m!310661 () Bool)

(assert (=> start!29460 m!310661))

(declare-fun m!310663 () Bool)

(assert (=> b!298047 m!310663))

(declare-fun m!310665 () Bool)

(assert (=> b!298048 m!310665))

(declare-fun m!310667 () Bool)

(assert (=> b!298049 m!310667))

(check-sat (not b!298051) (not b!298048) (not b!298050) (not start!29460) (not b!298047) (not b!298049))
(check-sat)
(get-model)

(declare-fun b!298083 () Bool)

(declare-fun e!188341 () SeekEntryResult!2292)

(declare-fun lt!148183 () SeekEntryResult!2292)

(assert (=> b!298083 (= e!188341 (MissingZero!2292 (index!11343 lt!148183)))))

(declare-fun b!298085 () Bool)

(declare-fun c!48033 () Bool)

(declare-fun lt!148185 () (_ BitVec 64))

(assert (=> b!298085 (= c!48033 (= lt!148185 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188340 () SeekEntryResult!2292)

(assert (=> b!298085 (= e!188340 e!188341)))

(declare-fun b!298086 () Bool)

(declare-fun e!188339 () SeekEntryResult!2292)

(assert (=> b!298086 (= e!188339 e!188340)))

(assert (=> b!298086 (= lt!148185 (select (arr!7143 a!3312) (index!11343 lt!148183)))))

(declare-fun c!48031 () Bool)

(assert (=> b!298086 (= c!48031 (= lt!148185 k0!2524))))

(declare-fun b!298087 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15077 (_ BitVec 32)) SeekEntryResult!2292)

(assert (=> b!298087 (= e!188341 (seekKeyOrZeroReturnVacant!0 (x!29563 lt!148183) (index!11343 lt!148183) (index!11343 lt!148183) k0!2524 a!3312 mask!3809))))

(declare-fun b!298088 () Bool)

(assert (=> b!298088 (= e!188339 Undefined!2292)))

(declare-fun b!298084 () Bool)

(assert (=> b!298084 (= e!188340 (Found!2292 (index!11343 lt!148183)))))

(declare-fun d!67291 () Bool)

(declare-fun lt!148184 () SeekEntryResult!2292)

(assert (=> d!67291 (and (or ((_ is Undefined!2292) lt!148184) (not ((_ is Found!2292) lt!148184)) (and (bvsge (index!11342 lt!148184) #b00000000000000000000000000000000) (bvslt (index!11342 lt!148184) (size!7495 a!3312)))) (or ((_ is Undefined!2292) lt!148184) ((_ is Found!2292) lt!148184) (not ((_ is MissingZero!2292) lt!148184)) (and (bvsge (index!11341 lt!148184) #b00000000000000000000000000000000) (bvslt (index!11341 lt!148184) (size!7495 a!3312)))) (or ((_ is Undefined!2292) lt!148184) ((_ is Found!2292) lt!148184) ((_ is MissingZero!2292) lt!148184) (not ((_ is MissingVacant!2292) lt!148184)) (and (bvsge (index!11344 lt!148184) #b00000000000000000000000000000000) (bvslt (index!11344 lt!148184) (size!7495 a!3312)))) (or ((_ is Undefined!2292) lt!148184) (ite ((_ is Found!2292) lt!148184) (= (select (arr!7143 a!3312) (index!11342 lt!148184)) k0!2524) (ite ((_ is MissingZero!2292) lt!148184) (= (select (arr!7143 a!3312) (index!11341 lt!148184)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2292) lt!148184) (= (select (arr!7143 a!3312) (index!11344 lt!148184)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67291 (= lt!148184 e!188339)))

(declare-fun c!48032 () Bool)

(assert (=> d!67291 (= c!48032 (and ((_ is Intermediate!2292) lt!148183) (undefined!3104 lt!148183)))))

(assert (=> d!67291 (= lt!148183 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67291 (validMask!0 mask!3809)))

(assert (=> d!67291 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!148184)))

(assert (= (and d!67291 c!48032) b!298088))

(assert (= (and d!67291 (not c!48032)) b!298086))

(assert (= (and b!298086 c!48031) b!298084))

(assert (= (and b!298086 (not c!48031)) b!298085))

(assert (= (and b!298085 c!48033) b!298083))

(assert (= (and b!298085 (not c!48033)) b!298087))

(declare-fun m!310689 () Bool)

(assert (=> b!298086 m!310689))

(declare-fun m!310691 () Bool)

(assert (=> b!298087 m!310691))

(declare-fun m!310693 () Bool)

(assert (=> d!67291 m!310693))

(declare-fun m!310695 () Bool)

(assert (=> d!67291 m!310695))

(assert (=> d!67291 m!310657))

(declare-fun m!310697 () Bool)

(assert (=> d!67291 m!310697))

(assert (=> d!67291 m!310657))

(declare-fun m!310699 () Bool)

(assert (=> d!67291 m!310699))

(assert (=> d!67291 m!310659))

(assert (=> b!298047 d!67291))

(declare-fun d!67301 () Bool)

(declare-fun res!157193 () Bool)

(declare-fun e!188346 () Bool)

(assert (=> d!67301 (=> res!157193 e!188346)))

(assert (=> d!67301 (= res!157193 (= (select (arr!7143 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67301 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!188346)))

(declare-fun b!298093 () Bool)

(declare-fun e!188347 () Bool)

(assert (=> b!298093 (= e!188346 e!188347)))

(declare-fun res!157194 () Bool)

(assert (=> b!298093 (=> (not res!157194) (not e!188347))))

(assert (=> b!298093 (= res!157194 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7495 a!3312)))))

(declare-fun b!298094 () Bool)

(assert (=> b!298094 (= e!188347 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67301 (not res!157193)) b!298093))

(assert (= (and b!298093 res!157194) b!298094))

(declare-fun m!310701 () Bool)

(assert (=> d!67301 m!310701))

(declare-fun m!310703 () Bool)

(assert (=> b!298094 m!310703))

(assert (=> b!298049 d!67301))

(declare-fun b!298133 () Bool)

(declare-fun e!188369 () Bool)

(declare-fun call!25774 () Bool)

(assert (=> b!298133 (= e!188369 call!25774)))

(declare-fun bm!25771 () Bool)

(assert (=> bm!25771 (= call!25774 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!298134 () Bool)

(declare-fun e!188371 () Bool)

(assert (=> b!298134 (= e!188371 call!25774)))

(declare-fun b!298135 () Bool)

(assert (=> b!298135 (= e!188371 e!188369)))

(declare-fun lt!148205 () (_ BitVec 64))

(assert (=> b!298135 (= lt!148205 (select (arr!7143 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9307 0))(
  ( (Unit!9308) )
))
(declare-fun lt!148206 () Unit!9307)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15077 (_ BitVec 64) (_ BitVec 32)) Unit!9307)

(assert (=> b!298135 (= lt!148206 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148205 #b00000000000000000000000000000000))))

(assert (=> b!298135 (arrayContainsKey!0 a!3312 lt!148205 #b00000000000000000000000000000000)))

(declare-fun lt!148207 () Unit!9307)

(assert (=> b!298135 (= lt!148207 lt!148206)))

(declare-fun res!157199 () Bool)

(assert (=> b!298135 (= res!157199 (= (seekEntryOrOpen!0 (select (arr!7143 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2292 #b00000000000000000000000000000000)))))

(assert (=> b!298135 (=> (not res!157199) (not e!188369))))

(declare-fun d!67303 () Bool)

(declare-fun res!157200 () Bool)

(declare-fun e!188370 () Bool)

(assert (=> d!67303 (=> res!157200 e!188370)))

(assert (=> d!67303 (= res!157200 (bvsge #b00000000000000000000000000000000 (size!7495 a!3312)))))

(assert (=> d!67303 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188370)))

(declare-fun b!298136 () Bool)

(assert (=> b!298136 (= e!188370 e!188371)))

(declare-fun c!48051 () Bool)

(assert (=> b!298136 (= c!48051 (validKeyInArray!0 (select (arr!7143 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!67303 (not res!157200)) b!298136))

(assert (= (and b!298136 c!48051) b!298135))

(assert (= (and b!298136 (not c!48051)) b!298134))

(assert (= (and b!298135 res!157199) b!298133))

(assert (= (or b!298133 b!298134) bm!25771))

(declare-fun m!310717 () Bool)

(assert (=> bm!25771 m!310717))

(assert (=> b!298135 m!310701))

(declare-fun m!310719 () Bool)

(assert (=> b!298135 m!310719))

(declare-fun m!310721 () Bool)

(assert (=> b!298135 m!310721))

(assert (=> b!298135 m!310701))

(declare-fun m!310723 () Bool)

(assert (=> b!298135 m!310723))

(assert (=> b!298136 m!310701))

(assert (=> b!298136 m!310701))

(declare-fun m!310725 () Bool)

(assert (=> b!298136 m!310725))

(assert (=> b!298048 d!67303))

(declare-fun b!298225 () Bool)

(declare-fun e!188425 () Bool)

(declare-fun e!188427 () Bool)

(assert (=> b!298225 (= e!188425 e!188427)))

(declare-fun res!157242 () Bool)

(declare-fun lt!148231 () SeekEntryResult!2292)

(assert (=> b!298225 (= res!157242 (and ((_ is Intermediate!2292) lt!148231) (not (undefined!3104 lt!148231)) (bvslt (x!29563 lt!148231) #b01111111111111111111111111111110) (bvsge (x!29563 lt!148231) #b00000000000000000000000000000000) (bvsge (x!29563 lt!148231) #b00000000000000000000000000000000)))))

(assert (=> b!298225 (=> (not res!157242) (not e!188427))))

(declare-fun d!67307 () Bool)

(assert (=> d!67307 e!188425))

(declare-fun c!48077 () Bool)

(assert (=> d!67307 (= c!48077 (and ((_ is Intermediate!2292) lt!148231) (undefined!3104 lt!148231)))))

(declare-fun e!188428 () SeekEntryResult!2292)

(assert (=> d!67307 (= lt!148231 e!188428)))

(declare-fun c!48078 () Bool)

(assert (=> d!67307 (= c!48078 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148230 () (_ BitVec 64))

(assert (=> d!67307 (= lt!148230 (select (arr!7143 (array!15078 (store (arr!7143 a!3312) i!1256 k0!2524) (size!7495 a!3312))) lt!148161))))

(assert (=> d!67307 (validMask!0 mask!3809)))

(assert (=> d!67307 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148161 k0!2524 (array!15078 (store (arr!7143 a!3312) i!1256 k0!2524) (size!7495 a!3312)) mask!3809) lt!148231)))

(declare-fun b!298226 () Bool)

(assert (=> b!298226 (= e!188428 (Intermediate!2292 true lt!148161 #b00000000000000000000000000000000))))

(declare-fun b!298227 () Bool)

(declare-fun e!188426 () SeekEntryResult!2292)

(assert (=> b!298227 (= e!188428 e!188426)))

(declare-fun c!48076 () Bool)

(assert (=> b!298227 (= c!48076 (or (= lt!148230 k0!2524) (= (bvadd lt!148230 lt!148230) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298228 () Bool)

(assert (=> b!298228 (= e!188425 (bvsge (x!29563 lt!148231) #b01111111111111111111111111111110))))

(declare-fun b!298229 () Bool)

(assert (=> b!298229 (and (bvsge (index!11343 lt!148231) #b00000000000000000000000000000000) (bvslt (index!11343 lt!148231) (size!7495 (array!15078 (store (arr!7143 a!3312) i!1256 k0!2524) (size!7495 a!3312)))))))

(declare-fun res!157243 () Bool)

(assert (=> b!298229 (= res!157243 (= (select (arr!7143 (array!15078 (store (arr!7143 a!3312) i!1256 k0!2524) (size!7495 a!3312))) (index!11343 lt!148231)) k0!2524))))

(declare-fun e!188424 () Bool)

(assert (=> b!298229 (=> res!157243 e!188424)))

(assert (=> b!298229 (= e!188427 e!188424)))

(declare-fun b!298230 () Bool)

(assert (=> b!298230 (= e!188426 (Intermediate!2292 false lt!148161 #b00000000000000000000000000000000))))

(declare-fun b!298231 () Bool)

(assert (=> b!298231 (and (bvsge (index!11343 lt!148231) #b00000000000000000000000000000000) (bvslt (index!11343 lt!148231) (size!7495 (array!15078 (store (arr!7143 a!3312) i!1256 k0!2524) (size!7495 a!3312)))))))

(assert (=> b!298231 (= e!188424 (= (select (arr!7143 (array!15078 (store (arr!7143 a!3312) i!1256 k0!2524) (size!7495 a!3312))) (index!11343 lt!148231)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298232 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298232 (= e!188426 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148161 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15078 (store (arr!7143 a!3312) i!1256 k0!2524) (size!7495 a!3312)) mask!3809))))

(declare-fun b!298233 () Bool)

(assert (=> b!298233 (and (bvsge (index!11343 lt!148231) #b00000000000000000000000000000000) (bvslt (index!11343 lt!148231) (size!7495 (array!15078 (store (arr!7143 a!3312) i!1256 k0!2524) (size!7495 a!3312)))))))

(declare-fun res!157241 () Bool)

(assert (=> b!298233 (= res!157241 (= (select (arr!7143 (array!15078 (store (arr!7143 a!3312) i!1256 k0!2524) (size!7495 a!3312))) (index!11343 lt!148231)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298233 (=> res!157241 e!188424)))

(assert (= (and d!67307 c!48078) b!298226))

(assert (= (and d!67307 (not c!48078)) b!298227))

(assert (= (and b!298227 c!48076) b!298230))

(assert (= (and b!298227 (not c!48076)) b!298232))

(assert (= (and d!67307 c!48077) b!298228))

(assert (= (and d!67307 (not c!48077)) b!298225))

(assert (= (and b!298225 res!157242) b!298229))

(assert (= (and b!298229 (not res!157243)) b!298233))

(assert (= (and b!298233 (not res!157241)) b!298231))

(declare-fun m!310759 () Bool)

(assert (=> b!298233 m!310759))

(assert (=> b!298229 m!310759))

(assert (=> b!298231 m!310759))

(declare-fun m!310761 () Bool)

(assert (=> d!67307 m!310761))

(assert (=> d!67307 m!310659))

(declare-fun m!310763 () Bool)

(assert (=> b!298232 m!310763))

(assert (=> b!298232 m!310763))

(declare-fun m!310765 () Bool)

(assert (=> b!298232 m!310765))

(assert (=> b!298050 d!67307))

(declare-fun b!298238 () Bool)

(declare-fun e!188434 () Bool)

(declare-fun e!188436 () Bool)

(assert (=> b!298238 (= e!188434 e!188436)))

(declare-fun res!157247 () Bool)

(declare-fun lt!148239 () SeekEntryResult!2292)

(assert (=> b!298238 (= res!157247 (and ((_ is Intermediate!2292) lt!148239) (not (undefined!3104 lt!148239)) (bvslt (x!29563 lt!148239) #b01111111111111111111111111111110) (bvsge (x!29563 lt!148239) #b00000000000000000000000000000000) (bvsge (x!29563 lt!148239) #b00000000000000000000000000000000)))))

(assert (=> b!298238 (=> (not res!157247) (not e!188436))))

(declare-fun d!67323 () Bool)

(assert (=> d!67323 e!188434))

(declare-fun c!48082 () Bool)

(assert (=> d!67323 (= c!48082 (and ((_ is Intermediate!2292) lt!148239) (undefined!3104 lt!148239)))))

(declare-fun e!188437 () SeekEntryResult!2292)

(assert (=> d!67323 (= lt!148239 e!188437)))

(declare-fun c!48083 () Bool)

(assert (=> d!67323 (= c!48083 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148238 () (_ BitVec 64))

(assert (=> d!67323 (= lt!148238 (select (arr!7143 a!3312) lt!148161))))

(assert (=> d!67323 (validMask!0 mask!3809)))

(assert (=> d!67323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148161 k0!2524 a!3312 mask!3809) lt!148239)))

(declare-fun b!298239 () Bool)

(assert (=> b!298239 (= e!188437 (Intermediate!2292 true lt!148161 #b00000000000000000000000000000000))))

(declare-fun b!298240 () Bool)

(declare-fun e!188435 () SeekEntryResult!2292)

(assert (=> b!298240 (= e!188437 e!188435)))

(declare-fun c!48081 () Bool)

(assert (=> b!298240 (= c!48081 (or (= lt!148238 k0!2524) (= (bvadd lt!148238 lt!148238) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298241 () Bool)

(assert (=> b!298241 (= e!188434 (bvsge (x!29563 lt!148239) #b01111111111111111111111111111110))))

(declare-fun b!298242 () Bool)

(assert (=> b!298242 (and (bvsge (index!11343 lt!148239) #b00000000000000000000000000000000) (bvslt (index!11343 lt!148239) (size!7495 a!3312)))))

(declare-fun res!157248 () Bool)

(assert (=> b!298242 (= res!157248 (= (select (arr!7143 a!3312) (index!11343 lt!148239)) k0!2524))))

(declare-fun e!188433 () Bool)

(assert (=> b!298242 (=> res!157248 e!188433)))

(assert (=> b!298242 (= e!188436 e!188433)))

(declare-fun b!298243 () Bool)

(assert (=> b!298243 (= e!188435 (Intermediate!2292 false lt!148161 #b00000000000000000000000000000000))))

(declare-fun b!298244 () Bool)

(assert (=> b!298244 (and (bvsge (index!11343 lt!148239) #b00000000000000000000000000000000) (bvslt (index!11343 lt!148239) (size!7495 a!3312)))))

(assert (=> b!298244 (= e!188433 (= (select (arr!7143 a!3312) (index!11343 lt!148239)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298245 () Bool)

(assert (=> b!298245 (= e!188435 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148161 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!298246 () Bool)

(assert (=> b!298246 (and (bvsge (index!11343 lt!148239) #b00000000000000000000000000000000) (bvslt (index!11343 lt!148239) (size!7495 a!3312)))))

(declare-fun res!157246 () Bool)

(assert (=> b!298246 (= res!157246 (= (select (arr!7143 a!3312) (index!11343 lt!148239)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298246 (=> res!157246 e!188433)))

(assert (= (and d!67323 c!48083) b!298239))

(assert (= (and d!67323 (not c!48083)) b!298240))

(assert (= (and b!298240 c!48081) b!298243))

(assert (= (and b!298240 (not c!48081)) b!298245))

(assert (= (and d!67323 c!48082) b!298241))

(assert (= (and d!67323 (not c!48082)) b!298238))

(assert (= (and b!298238 res!157247) b!298242))

(assert (= (and b!298242 (not res!157248)) b!298246))

(assert (= (and b!298246 (not res!157246)) b!298244))

(declare-fun m!310767 () Bool)

(assert (=> b!298246 m!310767))

(assert (=> b!298242 m!310767))

(assert (=> b!298244 m!310767))

(declare-fun m!310769 () Bool)

(assert (=> d!67323 m!310769))

(assert (=> d!67323 m!310659))

(assert (=> b!298245 m!310763))

(assert (=> b!298245 m!310763))

(declare-fun m!310771 () Bool)

(assert (=> b!298245 m!310771))

(assert (=> b!298050 d!67323))

(declare-fun d!67325 () Bool)

(declare-fun lt!148254 () (_ BitVec 32))

(declare-fun lt!148253 () (_ BitVec 32))

(assert (=> d!67325 (= lt!148254 (bvmul (bvxor lt!148253 (bvlshr lt!148253 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67325 (= lt!148253 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67325 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157249 (let ((h!5306 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29570 (bvmul (bvxor h!5306 (bvlshr h!5306 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29570 (bvlshr x!29570 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157249 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157249 #b00000000000000000000000000000000))))))

(assert (=> d!67325 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!148254 (bvlshr lt!148254 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!298050 d!67325))

(declare-fun d!67333 () Bool)

(assert (=> d!67333 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298051 d!67333))

(declare-fun d!67335 () Bool)

(assert (=> d!67335 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29460 d!67335))

(declare-fun d!67341 () Bool)

(assert (=> d!67341 (= (array_inv!5106 a!3312) (bvsge (size!7495 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29460 d!67341))

(check-sat (not b!298136) (not d!67323) (not b!298232) (not b!298135) (not b!298087) (not d!67291) (not d!67307) (not bm!25771) (not b!298245) (not b!298094))
(check-sat)
