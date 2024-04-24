; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28324 () Bool)

(assert start!28324)

(declare-fun b!290352 () Bool)

(declare-fun e!183731 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!290352 (= e!183731 (not (or (bvslt mask!3809 #b00000000000000000000000000000000) (bvsle mask!3809 #b00111111111111111111111111111111))))))

(declare-datatypes ((SeekEntryResult!2063 0))(
  ( (MissingZero!2063 (index!10422 (_ BitVec 32))) (Found!2063 (index!10423 (_ BitVec 32))) (Intermediate!2063 (undefined!2875 Bool) (index!10424 (_ BitVec 32)) (x!28724 (_ BitVec 32))) (Undefined!2063) (MissingVacant!2063 (index!10425 (_ BitVec 32))) )
))
(declare-fun lt!143471 () SeekEntryResult!2063)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290352 (= (index!10424 lt!143471) i!1256)))

(declare-fun b!290353 () Bool)

(declare-fun res!151812 () Bool)

(declare-fun e!183733 () Bool)

(assert (=> b!290353 (=> (not res!151812) (not e!183733))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290353 (= res!151812 (validKeyInArray!0 k0!2524))))

(declare-fun b!290354 () Bool)

(declare-fun res!151808 () Bool)

(assert (=> b!290354 (=> (not res!151808) (not e!183733))))

(declare-datatypes ((array!14643 0))(
  ( (array!14644 (arr!6949 (Array (_ BitVec 32) (_ BitVec 64))) (size!7301 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14643)

(assert (=> b!290354 (= res!151808 (and (= (size!7301 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7301 a!3312))))))

(declare-fun b!290355 () Bool)

(declare-fun e!183734 () Bool)

(declare-fun e!183732 () Bool)

(assert (=> b!290355 (= e!183734 e!183732)))

(declare-fun res!151806 () Bool)

(assert (=> b!290355 (=> (not res!151806) (not e!183732))))

(declare-fun lt!143467 () Bool)

(declare-fun lt!143472 () SeekEntryResult!2063)

(assert (=> b!290355 (= res!151806 (and (not lt!143467) (= lt!143472 (MissingVacant!2063 i!1256))))))

(declare-fun lt!143470 () (_ BitVec 32))

(declare-fun lt!143468 () SeekEntryResult!2063)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14643 (_ BitVec 32)) SeekEntryResult!2063)

(assert (=> b!290355 (= lt!143468 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143470 k0!2524 (array!14644 (store (arr!6949 a!3312) i!1256 k0!2524) (size!7301 a!3312)) mask!3809))))

(assert (=> b!290355 (= lt!143471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143470 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290355 (= lt!143470 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290356 () Bool)

(assert (=> b!290356 (= e!183733 e!183734)))

(declare-fun res!151810 () Bool)

(assert (=> b!290356 (=> (not res!151810) (not e!183734))))

(assert (=> b!290356 (= res!151810 (or lt!143467 (= lt!143472 (MissingVacant!2063 i!1256))))))

(assert (=> b!290356 (= lt!143467 (= lt!143472 (MissingZero!2063 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14643 (_ BitVec 32)) SeekEntryResult!2063)

(assert (=> b!290356 (= lt!143472 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290357 () Bool)

(declare-fun res!151805 () Bool)

(assert (=> b!290357 (=> (not res!151805) (not e!183734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14643 (_ BitVec 32)) Bool)

(assert (=> b!290357 (= res!151805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290358 () Bool)

(declare-fun res!151809 () Bool)

(assert (=> b!290358 (=> (not res!151809) (not e!183733))))

(declare-fun arrayContainsKey!0 (array!14643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290358 (= res!151809 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!151811 () Bool)

(assert (=> start!28324 (=> (not res!151811) (not e!183733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28324 (= res!151811 (validMask!0 mask!3809))))

(assert (=> start!28324 e!183733))

(assert (=> start!28324 true))

(declare-fun array_inv!4899 (array!14643) Bool)

(assert (=> start!28324 (array_inv!4899 a!3312)))

(declare-fun b!290359 () Bool)

(assert (=> b!290359 (= e!183732 e!183731)))

(declare-fun res!151807 () Bool)

(assert (=> b!290359 (=> (not res!151807) (not e!183731))))

(declare-fun lt!143469 () Bool)

(assert (=> b!290359 (= res!151807 (and (or lt!143469 (not (undefined!2875 lt!143471))) (not lt!143469) (= (select (arr!6949 a!3312) (index!10424 lt!143471)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290359 (= lt!143469 (not ((_ is Intermediate!2063) lt!143471)))))

(assert (= (and start!28324 res!151811) b!290354))

(assert (= (and b!290354 res!151808) b!290353))

(assert (= (and b!290353 res!151812) b!290358))

(assert (= (and b!290358 res!151809) b!290356))

(assert (= (and b!290356 res!151810) b!290357))

(assert (= (and b!290357 res!151805) b!290355))

(assert (= (and b!290355 res!151806) b!290359))

(assert (= (and b!290359 res!151807) b!290352))

(declare-fun m!304619 () Bool)

(assert (=> b!290357 m!304619))

(declare-fun m!304621 () Bool)

(assert (=> b!290358 m!304621))

(declare-fun m!304623 () Bool)

(assert (=> b!290359 m!304623))

(declare-fun m!304625 () Bool)

(assert (=> start!28324 m!304625))

(declare-fun m!304627 () Bool)

(assert (=> start!28324 m!304627))

(declare-fun m!304629 () Bool)

(assert (=> b!290356 m!304629))

(declare-fun m!304631 () Bool)

(assert (=> b!290355 m!304631))

(declare-fun m!304633 () Bool)

(assert (=> b!290355 m!304633))

(declare-fun m!304635 () Bool)

(assert (=> b!290355 m!304635))

(declare-fun m!304637 () Bool)

(assert (=> b!290355 m!304637))

(declare-fun m!304639 () Bool)

(assert (=> b!290353 m!304639))

(check-sat (not b!290357) (not b!290358) (not b!290353) (not b!290355) (not start!28324) (not b!290356))
(check-sat)
(get-model)

(declare-fun d!66343 () Bool)

(assert (=> d!66343 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!290353 d!66343))

(declare-fun d!66345 () Bool)

(assert (=> d!66345 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28324 d!66345))

(declare-fun d!66349 () Bool)

(assert (=> d!66349 (= (array_inv!4899 a!3312) (bvsge (size!7301 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28324 d!66349))

(declare-fun d!66351 () Bool)

(declare-fun res!151865 () Bool)

(declare-fun e!183769 () Bool)

(assert (=> d!66351 (=> res!151865 e!183769)))

(assert (=> d!66351 (= res!151865 (= (select (arr!6949 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66351 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!183769)))

(declare-fun b!290412 () Bool)

(declare-fun e!183770 () Bool)

(assert (=> b!290412 (= e!183769 e!183770)))

(declare-fun res!151866 () Bool)

(assert (=> b!290412 (=> (not res!151866) (not e!183770))))

(assert (=> b!290412 (= res!151866 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7301 a!3312)))))

(declare-fun b!290413 () Bool)

(assert (=> b!290413 (= e!183770 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66351 (not res!151865)) b!290412))

(assert (= (and b!290412 res!151866) b!290413))

(declare-fun m!304685 () Bool)

(assert (=> d!66351 m!304685))

(declare-fun m!304687 () Bool)

(assert (=> b!290413 m!304687))

(assert (=> b!290358 d!66351))

(declare-fun b!290422 () Bool)

(declare-fun e!183778 () Bool)

(declare-fun e!183777 () Bool)

(assert (=> b!290422 (= e!183778 e!183777)))

(declare-fun c!46837 () Bool)

(assert (=> b!290422 (= c!46837 (validKeyInArray!0 (select (arr!6949 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!290423 () Bool)

(declare-fun e!183779 () Bool)

(assert (=> b!290423 (= e!183777 e!183779)))

(declare-fun lt!143516 () (_ BitVec 64))

(assert (=> b!290423 (= lt!143516 (select (arr!6949 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9108 0))(
  ( (Unit!9109) )
))
(declare-fun lt!143517 () Unit!9108)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14643 (_ BitVec 64) (_ BitVec 32)) Unit!9108)

(assert (=> b!290423 (= lt!143517 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!143516 #b00000000000000000000000000000000))))

(assert (=> b!290423 (arrayContainsKey!0 a!3312 lt!143516 #b00000000000000000000000000000000)))

(declare-fun lt!143515 () Unit!9108)

(assert (=> b!290423 (= lt!143515 lt!143517)))

(declare-fun res!151871 () Bool)

(assert (=> b!290423 (= res!151871 (= (seekEntryOrOpen!0 (select (arr!6949 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2063 #b00000000000000000000000000000000)))))

(assert (=> b!290423 (=> (not res!151871) (not e!183779))))

(declare-fun bm!25621 () Bool)

(declare-fun call!25624 () Bool)

(assert (=> bm!25621 (= call!25624 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!290424 () Bool)

(assert (=> b!290424 (= e!183779 call!25624)))

(declare-fun b!290425 () Bool)

(assert (=> b!290425 (= e!183777 call!25624)))

(declare-fun d!66353 () Bool)

(declare-fun res!151872 () Bool)

(assert (=> d!66353 (=> res!151872 e!183778)))

(assert (=> d!66353 (= res!151872 (bvsge #b00000000000000000000000000000000 (size!7301 a!3312)))))

(assert (=> d!66353 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!183778)))

(assert (= (and d!66353 (not res!151872)) b!290422))

(assert (= (and b!290422 c!46837) b!290423))

(assert (= (and b!290422 (not c!46837)) b!290425))

(assert (= (and b!290423 res!151871) b!290424))

(assert (= (or b!290424 b!290425) bm!25621))

(assert (=> b!290422 m!304685))

(assert (=> b!290422 m!304685))

(declare-fun m!304689 () Bool)

(assert (=> b!290422 m!304689))

(assert (=> b!290423 m!304685))

(declare-fun m!304691 () Bool)

(assert (=> b!290423 m!304691))

(declare-fun m!304693 () Bool)

(assert (=> b!290423 m!304693))

(assert (=> b!290423 m!304685))

(declare-fun m!304695 () Bool)

(assert (=> b!290423 m!304695))

(declare-fun m!304697 () Bool)

(assert (=> bm!25621 m!304697))

(assert (=> b!290357 d!66353))

(declare-fun b!290456 () Bool)

(declare-fun e!183796 () SeekEntryResult!2063)

(declare-fun lt!143535 () SeekEntryResult!2063)

(assert (=> b!290456 (= e!183796 (Found!2063 (index!10424 lt!143535)))))

(declare-fun b!290457 () Bool)

(declare-fun e!183797 () SeekEntryResult!2063)

(assert (=> b!290457 (= e!183797 Undefined!2063)))

(declare-fun d!66355 () Bool)

(declare-fun lt!143533 () SeekEntryResult!2063)

(assert (=> d!66355 (and (or ((_ is Undefined!2063) lt!143533) (not ((_ is Found!2063) lt!143533)) (and (bvsge (index!10423 lt!143533) #b00000000000000000000000000000000) (bvslt (index!10423 lt!143533) (size!7301 a!3312)))) (or ((_ is Undefined!2063) lt!143533) ((_ is Found!2063) lt!143533) (not ((_ is MissingZero!2063) lt!143533)) (and (bvsge (index!10422 lt!143533) #b00000000000000000000000000000000) (bvslt (index!10422 lt!143533) (size!7301 a!3312)))) (or ((_ is Undefined!2063) lt!143533) ((_ is Found!2063) lt!143533) ((_ is MissingZero!2063) lt!143533) (not ((_ is MissingVacant!2063) lt!143533)) (and (bvsge (index!10425 lt!143533) #b00000000000000000000000000000000) (bvslt (index!10425 lt!143533) (size!7301 a!3312)))) (or ((_ is Undefined!2063) lt!143533) (ite ((_ is Found!2063) lt!143533) (= (select (arr!6949 a!3312) (index!10423 lt!143533)) k0!2524) (ite ((_ is MissingZero!2063) lt!143533) (= (select (arr!6949 a!3312) (index!10422 lt!143533)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2063) lt!143533) (= (select (arr!6949 a!3312) (index!10425 lt!143533)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66355 (= lt!143533 e!183797)))

(declare-fun c!46854 () Bool)

(assert (=> d!66355 (= c!46854 (and ((_ is Intermediate!2063) lt!143535) (undefined!2875 lt!143535)))))

(assert (=> d!66355 (= lt!143535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66355 (validMask!0 mask!3809)))

(assert (=> d!66355 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!143533)))

(declare-fun b!290458 () Bool)

(declare-fun e!183795 () SeekEntryResult!2063)

(assert (=> b!290458 (= e!183795 (MissingZero!2063 (index!10424 lt!143535)))))

(declare-fun b!290459 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14643 (_ BitVec 32)) SeekEntryResult!2063)

(assert (=> b!290459 (= e!183795 (seekKeyOrZeroReturnVacant!0 (x!28724 lt!143535) (index!10424 lt!143535) (index!10424 lt!143535) k0!2524 a!3312 mask!3809))))

(declare-fun b!290460 () Bool)

(assert (=> b!290460 (= e!183797 e!183796)))

(declare-fun lt!143534 () (_ BitVec 64))

(assert (=> b!290460 (= lt!143534 (select (arr!6949 a!3312) (index!10424 lt!143535)))))

(declare-fun c!46853 () Bool)

(assert (=> b!290460 (= c!46853 (= lt!143534 k0!2524))))

(declare-fun b!290461 () Bool)

(declare-fun c!46855 () Bool)

(assert (=> b!290461 (= c!46855 (= lt!143534 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!290461 (= e!183796 e!183795)))

(assert (= (and d!66355 c!46854) b!290457))

(assert (= (and d!66355 (not c!46854)) b!290460))

(assert (= (and b!290460 c!46853) b!290456))

(assert (= (and b!290460 (not c!46853)) b!290461))

(assert (= (and b!290461 c!46855) b!290458))

(assert (= (and b!290461 (not c!46855)) b!290459))

(declare-fun m!304711 () Bool)

(assert (=> d!66355 m!304711))

(assert (=> d!66355 m!304625))

(declare-fun m!304713 () Bool)

(assert (=> d!66355 m!304713))

(assert (=> d!66355 m!304637))

(assert (=> d!66355 m!304637))

(declare-fun m!304715 () Bool)

(assert (=> d!66355 m!304715))

(declare-fun m!304717 () Bool)

(assert (=> d!66355 m!304717))

(declare-fun m!304719 () Bool)

(assert (=> b!290459 m!304719))

(declare-fun m!304721 () Bool)

(assert (=> b!290460 m!304721))

(assert (=> b!290356 d!66355))

(declare-fun d!66367 () Bool)

(declare-fun e!183846 () Bool)

(assert (=> d!66367 e!183846))

(declare-fun c!46879 () Bool)

(declare-fun lt!143557 () SeekEntryResult!2063)

(assert (=> d!66367 (= c!46879 (and ((_ is Intermediate!2063) lt!143557) (undefined!2875 lt!143557)))))

(declare-fun e!183845 () SeekEntryResult!2063)

(assert (=> d!66367 (= lt!143557 e!183845)))

(declare-fun c!46878 () Bool)

(assert (=> d!66367 (= c!46878 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!143558 () (_ BitVec 64))

(assert (=> d!66367 (= lt!143558 (select (arr!6949 (array!14644 (store (arr!6949 a!3312) i!1256 k0!2524) (size!7301 a!3312))) lt!143470))))

(assert (=> d!66367 (validMask!0 mask!3809)))

(assert (=> d!66367 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143470 k0!2524 (array!14644 (store (arr!6949 a!3312) i!1256 k0!2524) (size!7301 a!3312)) mask!3809) lt!143557)))

(declare-fun b!290534 () Bool)

(assert (=> b!290534 (= e!183845 (Intermediate!2063 true lt!143470 #b00000000000000000000000000000000))))

(declare-fun b!290535 () Bool)

(declare-fun e!183843 () SeekEntryResult!2063)

(assert (=> b!290535 (= e!183843 (Intermediate!2063 false lt!143470 #b00000000000000000000000000000000))))

(declare-fun b!290536 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290536 (= e!183843 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!143470 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!14644 (store (arr!6949 a!3312) i!1256 k0!2524) (size!7301 a!3312)) mask!3809))))

(declare-fun b!290537 () Bool)

(assert (=> b!290537 (= e!183846 (bvsge (x!28724 lt!143557) #b01111111111111111111111111111110))))

(declare-fun b!290538 () Bool)

(declare-fun e!183847 () Bool)

(assert (=> b!290538 (= e!183846 e!183847)))

(declare-fun res!151904 () Bool)

(assert (=> b!290538 (= res!151904 (and ((_ is Intermediate!2063) lt!143557) (not (undefined!2875 lt!143557)) (bvslt (x!28724 lt!143557) #b01111111111111111111111111111110) (bvsge (x!28724 lt!143557) #b00000000000000000000000000000000) (bvsge (x!28724 lt!143557) #b00000000000000000000000000000000)))))

(assert (=> b!290538 (=> (not res!151904) (not e!183847))))

(declare-fun b!290539 () Bool)

(assert (=> b!290539 (and (bvsge (index!10424 lt!143557) #b00000000000000000000000000000000) (bvslt (index!10424 lt!143557) (size!7301 (array!14644 (store (arr!6949 a!3312) i!1256 k0!2524) (size!7301 a!3312)))))))

(declare-fun res!151905 () Bool)

(assert (=> b!290539 (= res!151905 (= (select (arr!6949 (array!14644 (store (arr!6949 a!3312) i!1256 k0!2524) (size!7301 a!3312))) (index!10424 lt!143557)) k0!2524))))

(declare-fun e!183844 () Bool)

(assert (=> b!290539 (=> res!151905 e!183844)))

(assert (=> b!290539 (= e!183847 e!183844)))

(declare-fun b!290540 () Bool)

(assert (=> b!290540 (and (bvsge (index!10424 lt!143557) #b00000000000000000000000000000000) (bvslt (index!10424 lt!143557) (size!7301 (array!14644 (store (arr!6949 a!3312) i!1256 k0!2524) (size!7301 a!3312)))))))

(declare-fun res!151906 () Bool)

(assert (=> b!290540 (= res!151906 (= (select (arr!6949 (array!14644 (store (arr!6949 a!3312) i!1256 k0!2524) (size!7301 a!3312))) (index!10424 lt!143557)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!290540 (=> res!151906 e!183844)))

(declare-fun b!290541 () Bool)

(assert (=> b!290541 (and (bvsge (index!10424 lt!143557) #b00000000000000000000000000000000) (bvslt (index!10424 lt!143557) (size!7301 (array!14644 (store (arr!6949 a!3312) i!1256 k0!2524) (size!7301 a!3312)))))))

(assert (=> b!290541 (= e!183844 (= (select (arr!6949 (array!14644 (store (arr!6949 a!3312) i!1256 k0!2524) (size!7301 a!3312))) (index!10424 lt!143557)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!290542 () Bool)

(assert (=> b!290542 (= e!183845 e!183843)))

(declare-fun c!46877 () Bool)

(assert (=> b!290542 (= c!46877 (or (= lt!143558 k0!2524) (= (bvadd lt!143558 lt!143558) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!66367 c!46878) b!290534))

(assert (= (and d!66367 (not c!46878)) b!290542))

(assert (= (and b!290542 c!46877) b!290535))

(assert (= (and b!290542 (not c!46877)) b!290536))

(assert (= (and d!66367 c!46879) b!290537))

(assert (= (and d!66367 (not c!46879)) b!290538))

(assert (= (and b!290538 res!151904) b!290539))

(assert (= (and b!290539 (not res!151905)) b!290540))

(assert (= (and b!290540 (not res!151906)) b!290541))

(declare-fun m!304751 () Bool)

(assert (=> b!290539 m!304751))

(declare-fun m!304753 () Bool)

(assert (=> b!290536 m!304753))

(assert (=> b!290536 m!304753))

(declare-fun m!304755 () Bool)

(assert (=> b!290536 m!304755))

(assert (=> b!290540 m!304751))

(assert (=> b!290541 m!304751))

(declare-fun m!304757 () Bool)

(assert (=> d!66367 m!304757))

(assert (=> d!66367 m!304625))

(assert (=> b!290355 d!66367))

(declare-fun d!66377 () Bool)

(declare-fun e!183851 () Bool)

(assert (=> d!66377 e!183851))

(declare-fun c!46882 () Bool)

(declare-fun lt!143559 () SeekEntryResult!2063)

(assert (=> d!66377 (= c!46882 (and ((_ is Intermediate!2063) lt!143559) (undefined!2875 lt!143559)))))

(declare-fun e!183850 () SeekEntryResult!2063)

(assert (=> d!66377 (= lt!143559 e!183850)))

(declare-fun c!46881 () Bool)

(assert (=> d!66377 (= c!46881 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!143560 () (_ BitVec 64))

(assert (=> d!66377 (= lt!143560 (select (arr!6949 a!3312) lt!143470))))

(assert (=> d!66377 (validMask!0 mask!3809)))

(assert (=> d!66377 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143470 k0!2524 a!3312 mask!3809) lt!143559)))

(declare-fun b!290543 () Bool)

(assert (=> b!290543 (= e!183850 (Intermediate!2063 true lt!143470 #b00000000000000000000000000000000))))

(declare-fun b!290544 () Bool)

(declare-fun e!183848 () SeekEntryResult!2063)

(assert (=> b!290544 (= e!183848 (Intermediate!2063 false lt!143470 #b00000000000000000000000000000000))))

(declare-fun b!290545 () Bool)

(assert (=> b!290545 (= e!183848 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!143470 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!290546 () Bool)

(assert (=> b!290546 (= e!183851 (bvsge (x!28724 lt!143559) #b01111111111111111111111111111110))))

(declare-fun b!290547 () Bool)

(declare-fun e!183852 () Bool)

(assert (=> b!290547 (= e!183851 e!183852)))

(declare-fun res!151907 () Bool)

(assert (=> b!290547 (= res!151907 (and ((_ is Intermediate!2063) lt!143559) (not (undefined!2875 lt!143559)) (bvslt (x!28724 lt!143559) #b01111111111111111111111111111110) (bvsge (x!28724 lt!143559) #b00000000000000000000000000000000) (bvsge (x!28724 lt!143559) #b00000000000000000000000000000000)))))

(assert (=> b!290547 (=> (not res!151907) (not e!183852))))

(declare-fun b!290548 () Bool)

(assert (=> b!290548 (and (bvsge (index!10424 lt!143559) #b00000000000000000000000000000000) (bvslt (index!10424 lt!143559) (size!7301 a!3312)))))

(declare-fun res!151908 () Bool)

(assert (=> b!290548 (= res!151908 (= (select (arr!6949 a!3312) (index!10424 lt!143559)) k0!2524))))

(declare-fun e!183849 () Bool)

(assert (=> b!290548 (=> res!151908 e!183849)))

(assert (=> b!290548 (= e!183852 e!183849)))

(declare-fun b!290549 () Bool)

(assert (=> b!290549 (and (bvsge (index!10424 lt!143559) #b00000000000000000000000000000000) (bvslt (index!10424 lt!143559) (size!7301 a!3312)))))

(declare-fun res!151909 () Bool)

(assert (=> b!290549 (= res!151909 (= (select (arr!6949 a!3312) (index!10424 lt!143559)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!290549 (=> res!151909 e!183849)))

(declare-fun b!290550 () Bool)

(assert (=> b!290550 (and (bvsge (index!10424 lt!143559) #b00000000000000000000000000000000) (bvslt (index!10424 lt!143559) (size!7301 a!3312)))))

(assert (=> b!290550 (= e!183849 (= (select (arr!6949 a!3312) (index!10424 lt!143559)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!290551 () Bool)

(assert (=> b!290551 (= e!183850 e!183848)))

(declare-fun c!46880 () Bool)

(assert (=> b!290551 (= c!46880 (or (= lt!143560 k0!2524) (= (bvadd lt!143560 lt!143560) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!66377 c!46881) b!290543))

(assert (= (and d!66377 (not c!46881)) b!290551))

(assert (= (and b!290551 c!46880) b!290544))

(assert (= (and b!290551 (not c!46880)) b!290545))

(assert (= (and d!66377 c!46882) b!290546))

(assert (= (and d!66377 (not c!46882)) b!290547))

(assert (= (and b!290547 res!151907) b!290548))

(assert (= (and b!290548 (not res!151908)) b!290549))

(assert (= (and b!290549 (not res!151909)) b!290550))

(declare-fun m!304759 () Bool)

(assert (=> b!290548 m!304759))

(assert (=> b!290545 m!304753))

(assert (=> b!290545 m!304753))

(declare-fun m!304761 () Bool)

(assert (=> b!290545 m!304761))

(assert (=> b!290549 m!304759))

(assert (=> b!290550 m!304759))

(declare-fun m!304763 () Bool)

(assert (=> d!66377 m!304763))

(assert (=> d!66377 m!304625))

(assert (=> b!290355 d!66377))

(declare-fun d!66379 () Bool)

(declare-fun lt!143576 () (_ BitVec 32))

(declare-fun lt!143575 () (_ BitVec 32))

(assert (=> d!66379 (= lt!143576 (bvmul (bvxor lt!143575 (bvlshr lt!143575 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66379 (= lt!143575 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66379 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!151910 (let ((h!5172 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28731 (bvmul (bvxor h!5172 (bvlshr h!5172 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28731 (bvlshr x!28731 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!151910 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!151910 #b00000000000000000000000000000000))))))

(assert (=> d!66379 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!143576 (bvlshr lt!143576 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!290355 d!66379))

(check-sat (not b!290413) (not b!290536) (not d!66367) (not b!290545) (not bm!25621) (not d!66377) (not d!66355) (not b!290423) (not b!290422) (not b!290459))
(check-sat)
