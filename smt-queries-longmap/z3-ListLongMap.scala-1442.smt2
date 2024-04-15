; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27812 () Bool)

(assert start!27812)

(declare-fun b!286194 () Bool)

(declare-fun e!181337 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286194 (= e!181337 (and (bvsge mask!3809 #b00000000000000000000000000000000) (bvsgt mask!3809 #b00111111111111111111111111111111)))))

(declare-fun b!286195 () Bool)

(declare-fun res!148402 () Bool)

(declare-fun e!181336 () Bool)

(assert (=> b!286195 (=> (not res!148402) (not e!181336))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14326 0))(
  ( (array!14327 (arr!6798 (Array (_ BitVec 32) (_ BitVec 64))) (size!7151 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14326)

(assert (=> b!286195 (= res!148402 (and (= (size!7151 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7151 a!3312))))))

(declare-fun b!286196 () Bool)

(assert (=> b!286196 (= e!181336 e!181337)))

(declare-fun res!148400 () Bool)

(assert (=> b!286196 (=> (not res!148400) (not e!181337))))

(declare-datatypes ((SeekEntryResult!1946 0))(
  ( (MissingZero!1946 (index!9954 (_ BitVec 32))) (Found!1946 (index!9955 (_ BitVec 32))) (Intermediate!1946 (undefined!2758 Bool) (index!9956 (_ BitVec 32)) (x!28193 (_ BitVec 32))) (Undefined!1946) (MissingVacant!1946 (index!9957 (_ BitVec 32))) )
))
(declare-fun lt!140880 () SeekEntryResult!1946)

(assert (=> b!286196 (= res!148400 (or (= lt!140880 (MissingZero!1946 i!1256)) (= lt!140880 (MissingVacant!1946 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14326 (_ BitVec 32)) SeekEntryResult!1946)

(assert (=> b!286196 (= lt!140880 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286197 () Bool)

(declare-fun res!148401 () Bool)

(assert (=> b!286197 (=> (not res!148401) (not e!181336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286197 (= res!148401 (validKeyInArray!0 k0!2524))))

(declare-fun b!286198 () Bool)

(declare-fun res!148398 () Bool)

(assert (=> b!286198 (=> (not res!148398) (not e!181337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14326 (_ BitVec 32)) Bool)

(assert (=> b!286198 (= res!148398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286199 () Bool)

(declare-fun res!148399 () Bool)

(assert (=> b!286199 (=> (not res!148399) (not e!181336))))

(declare-fun arrayContainsKey!0 (array!14326 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286199 (= res!148399 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148397 () Bool)

(assert (=> start!27812 (=> (not res!148397) (not e!181336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27812 (= res!148397 (validMask!0 mask!3809))))

(assert (=> start!27812 e!181336))

(assert (=> start!27812 true))

(declare-fun array_inv!4770 (array!14326) Bool)

(assert (=> start!27812 (array_inv!4770 a!3312)))

(assert (= (and start!27812 res!148397) b!286195))

(assert (= (and b!286195 res!148402) b!286197))

(assert (= (and b!286197 res!148401) b!286199))

(assert (= (and b!286199 res!148399) b!286196))

(assert (= (and b!286196 res!148400) b!286198))

(assert (= (and b!286198 res!148398) b!286194))

(declare-fun m!300449 () Bool)

(assert (=> start!27812 m!300449))

(declare-fun m!300451 () Bool)

(assert (=> start!27812 m!300451))

(declare-fun m!300453 () Bool)

(assert (=> b!286197 m!300453))

(declare-fun m!300455 () Bool)

(assert (=> b!286199 m!300455))

(declare-fun m!300457 () Bool)

(assert (=> b!286196 m!300457))

(declare-fun m!300459 () Bool)

(assert (=> b!286198 m!300459))

(check-sat (not b!286198) (not start!27812) (not b!286197) (not b!286199) (not b!286196))
(check-sat)
(get-model)

(declare-fun d!65799 () Bool)

(assert (=> d!65799 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!286197 d!65799))

(declare-fun b!286244 () Bool)

(declare-fun e!181364 () Bool)

(declare-fun call!25567 () Bool)

(assert (=> b!286244 (= e!181364 call!25567)))

(declare-fun b!286245 () Bool)

(declare-fun e!181365 () Bool)

(assert (=> b!286245 (= e!181364 e!181365)))

(declare-fun lt!140895 () (_ BitVec 64))

(assert (=> b!286245 (= lt!140895 (select (arr!6798 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9000 0))(
  ( (Unit!9001) )
))
(declare-fun lt!140894 () Unit!9000)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14326 (_ BitVec 64) (_ BitVec 32)) Unit!9000)

(assert (=> b!286245 (= lt!140894 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!140895 #b00000000000000000000000000000000))))

(assert (=> b!286245 (arrayContainsKey!0 a!3312 lt!140895 #b00000000000000000000000000000000)))

(declare-fun lt!140893 () Unit!9000)

(assert (=> b!286245 (= lt!140893 lt!140894)))

(declare-fun res!148443 () Bool)

(assert (=> b!286245 (= res!148443 (= (seekEntryOrOpen!0 (select (arr!6798 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!1946 #b00000000000000000000000000000000)))))

(assert (=> b!286245 (=> (not res!148443) (not e!181365))))

(declare-fun b!286246 () Bool)

(declare-fun e!181363 () Bool)

(assert (=> b!286246 (= e!181363 e!181364)))

(declare-fun c!46456 () Bool)

(assert (=> b!286246 (= c!46456 (validKeyInArray!0 (select (arr!6798 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25564 () Bool)

(assert (=> bm!25564 (= call!25567 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!65801 () Bool)

(declare-fun res!148444 () Bool)

(assert (=> d!65801 (=> res!148444 e!181363)))

(assert (=> d!65801 (= res!148444 (bvsge #b00000000000000000000000000000000 (size!7151 a!3312)))))

(assert (=> d!65801 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!181363)))

(declare-fun b!286247 () Bool)

(assert (=> b!286247 (= e!181365 call!25567)))

(assert (= (and d!65801 (not res!148444)) b!286246))

(assert (= (and b!286246 c!46456) b!286245))

(assert (= (and b!286246 (not c!46456)) b!286244))

(assert (= (and b!286245 res!148443) b!286247))

(assert (= (or b!286247 b!286244) bm!25564))

(declare-fun m!300485 () Bool)

(assert (=> b!286245 m!300485))

(declare-fun m!300487 () Bool)

(assert (=> b!286245 m!300487))

(declare-fun m!300489 () Bool)

(assert (=> b!286245 m!300489))

(assert (=> b!286245 m!300485))

(declare-fun m!300491 () Bool)

(assert (=> b!286245 m!300491))

(assert (=> b!286246 m!300485))

(assert (=> b!286246 m!300485))

(declare-fun m!300493 () Bool)

(assert (=> b!286246 m!300493))

(declare-fun m!300495 () Bool)

(assert (=> bm!25564 m!300495))

(assert (=> b!286198 d!65801))

(declare-fun d!65809 () Bool)

(assert (=> d!65809 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!27812 d!65809))

(declare-fun d!65819 () Bool)

(assert (=> d!65819 (= (array_inv!4770 a!3312) (bvsge (size!7151 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!27812 d!65819))

(declare-fun d!65821 () Bool)

(declare-fun res!148449 () Bool)

(declare-fun e!181370 () Bool)

(assert (=> d!65821 (=> res!148449 e!181370)))

(assert (=> d!65821 (= res!148449 (= (select (arr!6798 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!65821 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!181370)))

(declare-fun b!286252 () Bool)

(declare-fun e!181371 () Bool)

(assert (=> b!286252 (= e!181370 e!181371)))

(declare-fun res!148450 () Bool)

(assert (=> b!286252 (=> (not res!148450) (not e!181371))))

(assert (=> b!286252 (= res!148450 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7151 a!3312)))))

(declare-fun b!286253 () Bool)

(assert (=> b!286253 (= e!181371 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65821 (not res!148449)) b!286252))

(assert (= (and b!286252 res!148450) b!286253))

(assert (=> d!65821 m!300485))

(declare-fun m!300497 () Bool)

(assert (=> b!286253 m!300497))

(assert (=> b!286199 d!65821))

(declare-fun b!286338 () Bool)

(declare-fun e!181427 () SeekEntryResult!1946)

(declare-fun e!181426 () SeekEntryResult!1946)

(assert (=> b!286338 (= e!181427 e!181426)))

(declare-fun lt!140938 () (_ BitVec 64))

(declare-fun lt!140939 () SeekEntryResult!1946)

(assert (=> b!286338 (= lt!140938 (select (arr!6798 a!3312) (index!9956 lt!140939)))))

(declare-fun c!46487 () Bool)

(assert (=> b!286338 (= c!46487 (= lt!140938 k0!2524))))

(declare-fun b!286339 () Bool)

(declare-fun e!181428 () SeekEntryResult!1946)

(assert (=> b!286339 (= e!181428 (MissingZero!1946 (index!9956 lt!140939)))))

(declare-fun d!65823 () Bool)

(declare-fun lt!140940 () SeekEntryResult!1946)

(get-info :version)

(assert (=> d!65823 (and (or ((_ is Undefined!1946) lt!140940) (not ((_ is Found!1946) lt!140940)) (and (bvsge (index!9955 lt!140940) #b00000000000000000000000000000000) (bvslt (index!9955 lt!140940) (size!7151 a!3312)))) (or ((_ is Undefined!1946) lt!140940) ((_ is Found!1946) lt!140940) (not ((_ is MissingZero!1946) lt!140940)) (and (bvsge (index!9954 lt!140940) #b00000000000000000000000000000000) (bvslt (index!9954 lt!140940) (size!7151 a!3312)))) (or ((_ is Undefined!1946) lt!140940) ((_ is Found!1946) lt!140940) ((_ is MissingZero!1946) lt!140940) (not ((_ is MissingVacant!1946) lt!140940)) (and (bvsge (index!9957 lt!140940) #b00000000000000000000000000000000) (bvslt (index!9957 lt!140940) (size!7151 a!3312)))) (or ((_ is Undefined!1946) lt!140940) (ite ((_ is Found!1946) lt!140940) (= (select (arr!6798 a!3312) (index!9955 lt!140940)) k0!2524) (ite ((_ is MissingZero!1946) lt!140940) (= (select (arr!6798 a!3312) (index!9954 lt!140940)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1946) lt!140940) (= (select (arr!6798 a!3312) (index!9957 lt!140940)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65823 (= lt!140940 e!181427)))

(declare-fun c!46489 () Bool)

(assert (=> d!65823 (= c!46489 (and ((_ is Intermediate!1946) lt!140939) (undefined!2758 lt!140939)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14326 (_ BitVec 32)) SeekEntryResult!1946)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65823 (= lt!140939 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!65823 (validMask!0 mask!3809)))

(assert (=> d!65823 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!140940)))

(declare-fun b!286340 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14326 (_ BitVec 32)) SeekEntryResult!1946)

(assert (=> b!286340 (= e!181428 (seekKeyOrZeroReturnVacant!0 (x!28193 lt!140939) (index!9956 lt!140939) (index!9956 lt!140939) k0!2524 a!3312 mask!3809))))

(declare-fun b!286341 () Bool)

(assert (=> b!286341 (= e!181426 (Found!1946 (index!9956 lt!140939)))))

(declare-fun b!286342 () Bool)

(assert (=> b!286342 (= e!181427 Undefined!1946)))

(declare-fun b!286343 () Bool)

(declare-fun c!46488 () Bool)

(assert (=> b!286343 (= c!46488 (= lt!140938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!286343 (= e!181426 e!181428)))

(assert (= (and d!65823 c!46489) b!286342))

(assert (= (and d!65823 (not c!46489)) b!286338))

(assert (= (and b!286338 c!46487) b!286341))

(assert (= (and b!286338 (not c!46487)) b!286343))

(assert (= (and b!286343 c!46488) b!286339))

(assert (= (and b!286343 (not c!46488)) b!286340))

(declare-fun m!300553 () Bool)

(assert (=> b!286338 m!300553))

(declare-fun m!300557 () Bool)

(assert (=> d!65823 m!300557))

(declare-fun m!300559 () Bool)

(assert (=> d!65823 m!300559))

(declare-fun m!300561 () Bool)

(assert (=> d!65823 m!300561))

(declare-fun m!300563 () Bool)

(assert (=> d!65823 m!300563))

(assert (=> d!65823 m!300449))

(declare-fun m!300565 () Bool)

(assert (=> d!65823 m!300565))

(assert (=> d!65823 m!300561))

(declare-fun m!300567 () Bool)

(assert (=> b!286340 m!300567))

(assert (=> b!286196 d!65823))

(check-sat (not b!286340) (not b!286245) (not d!65823) (not bm!25564) (not b!286253) (not b!286246))
(check-sat)
