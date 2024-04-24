; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30330 () Bool)

(assert start!30330)

(declare-fun b!303894 () Bool)

(declare-fun res!161437 () Bool)

(declare-fun e!191085 () Bool)

(assert (=> b!303894 (=> (not res!161437) (not e!191085))))

(declare-datatypes ((array!15449 0))(
  ( (array!15450 (arr!7312 (Array (_ BitVec 32) (_ BitVec 64))) (size!7664 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15449)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303894 (= res!161437 (and (= (size!7664 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7664 a!3293))))))

(declare-fun b!303895 () Bool)

(declare-fun res!161434 () Bool)

(declare-fun e!191084 () Bool)

(assert (=> b!303895 (=> (not res!161434) (not e!191084))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303895 (= res!161434 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7312 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7312 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7312 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!303896 () Bool)

(declare-fun res!161432 () Bool)

(assert (=> b!303896 (=> (not res!161432) (not e!191084))))

(assert (=> b!303896 (= res!161432 (and (= (select (arr!7312 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7664 a!3293))))))

(declare-fun b!303897 () Bool)

(declare-fun res!161431 () Bool)

(assert (=> b!303897 (=> (not res!161431) (not e!191084))))

(declare-datatypes ((SeekEntryResult!2417 0))(
  ( (MissingZero!2417 (index!11844 (_ BitVec 32))) (Found!2417 (index!11845 (_ BitVec 32))) (Intermediate!2417 (undefined!3229 Bool) (index!11846 (_ BitVec 32)) (x!30207 (_ BitVec 32))) (Undefined!2417) (MissingVacant!2417 (index!11847 (_ BitVec 32))) )
))
(declare-fun lt!150308 () SeekEntryResult!2417)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15449 (_ BitVec 32)) SeekEntryResult!2417)

(assert (=> b!303897 (= res!161431 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150308))))

(declare-fun b!303899 () Bool)

(declare-fun res!161430 () Bool)

(assert (=> b!303899 (=> (not res!161430) (not e!191085))))

(declare-fun arrayContainsKey!0 (array!15449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303899 (= res!161430 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303900 () Bool)

(declare-fun res!161439 () Bool)

(assert (=> b!303900 (=> (not res!161439) (not e!191085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303900 (= res!161439 (validKeyInArray!0 k0!2441))))

(declare-fun b!303901 () Bool)

(declare-fun res!161433 () Bool)

(assert (=> b!303901 (=> (not res!161433) (not e!191085))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15449 (_ BitVec 32)) SeekEntryResult!2417)

(assert (=> b!303901 (= res!161433 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2417 i!1240)))))

(declare-fun b!303902 () Bool)

(assert (=> b!303902 (= e!191085 e!191084)))

(declare-fun res!161435 () Bool)

(assert (=> b!303902 (=> (not res!161435) (not e!191084))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303902 (= res!161435 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150308))))

(assert (=> b!303902 (= lt!150308 (Intermediate!2417 false resIndex!52 resX!52))))

(declare-fun b!303903 () Bool)

(declare-fun lt!150309 () (_ BitVec 32))

(assert (=> b!303903 (= e!191084 (and (bvsge mask!3709 #b00000000000000000000000000000000) (or (bvslt lt!150309 #b00000000000000000000000000000000) (bvsge lt!150309 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303903 (= lt!150309 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!303898 () Bool)

(declare-fun res!161438 () Bool)

(assert (=> b!303898 (=> (not res!161438) (not e!191085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15449 (_ BitVec 32)) Bool)

(assert (=> b!303898 (= res!161438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!161436 () Bool)

(assert (=> start!30330 (=> (not res!161436) (not e!191085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30330 (= res!161436 (validMask!0 mask!3709))))

(assert (=> start!30330 e!191085))

(declare-fun array_inv!5262 (array!15449) Bool)

(assert (=> start!30330 (array_inv!5262 a!3293)))

(assert (=> start!30330 true))

(assert (= (and start!30330 res!161436) b!303894))

(assert (= (and b!303894 res!161437) b!303900))

(assert (= (and b!303900 res!161439) b!303899))

(assert (= (and b!303899 res!161430) b!303901))

(assert (= (and b!303901 res!161433) b!303898))

(assert (= (and b!303898 res!161438) b!303902))

(assert (= (and b!303902 res!161435) b!303896))

(assert (= (and b!303896 res!161432) b!303897))

(assert (= (and b!303897 res!161431) b!303895))

(assert (= (and b!303895 res!161434) b!303903))

(declare-fun m!315307 () Bool)

(assert (=> b!303900 m!315307))

(declare-fun m!315309 () Bool)

(assert (=> b!303899 m!315309))

(declare-fun m!315311 () Bool)

(assert (=> b!303902 m!315311))

(assert (=> b!303902 m!315311))

(declare-fun m!315313 () Bool)

(assert (=> b!303902 m!315313))

(declare-fun m!315315 () Bool)

(assert (=> b!303901 m!315315))

(declare-fun m!315317 () Bool)

(assert (=> b!303898 m!315317))

(declare-fun m!315319 () Bool)

(assert (=> b!303903 m!315319))

(declare-fun m!315321 () Bool)

(assert (=> b!303895 m!315321))

(declare-fun m!315323 () Bool)

(assert (=> start!30330 m!315323))

(declare-fun m!315325 () Bool)

(assert (=> start!30330 m!315325))

(declare-fun m!315327 () Bool)

(assert (=> b!303896 m!315327))

(declare-fun m!315329 () Bool)

(assert (=> b!303897 m!315329))

(check-sat (not b!303902) (not b!303901) (not b!303898) (not b!303903) (not b!303897) (not b!303899) (not b!303900) (not start!30330))
(check-sat)
(get-model)

(declare-fun b!303990 () Bool)

(declare-fun e!191122 () SeekEntryResult!2417)

(assert (=> b!303990 (= e!191122 (Intermediate!2417 false index!1781 x!1427))))

(declare-fun b!303991 () Bool)

(declare-fun e!191120 () SeekEntryResult!2417)

(assert (=> b!303991 (= e!191120 (Intermediate!2417 true index!1781 x!1427))))

(declare-fun b!303992 () Bool)

(declare-fun e!191123 () Bool)

(declare-fun e!191124 () Bool)

(assert (=> b!303992 (= e!191123 e!191124)))

(declare-fun res!161510 () Bool)

(declare-fun lt!150333 () SeekEntryResult!2417)

(get-info :version)

(assert (=> b!303992 (= res!161510 (and ((_ is Intermediate!2417) lt!150333) (not (undefined!3229 lt!150333)) (bvslt (x!30207 lt!150333) #b01111111111111111111111111111110) (bvsge (x!30207 lt!150333) #b00000000000000000000000000000000) (bvsge (x!30207 lt!150333) x!1427)))))

(assert (=> b!303992 (=> (not res!161510) (not e!191124))))

(declare-fun b!303993 () Bool)

(assert (=> b!303993 (= e!191122 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 (bvadd x!1427 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!303994 () Bool)

(assert (=> b!303994 (= e!191123 (bvsge (x!30207 lt!150333) #b01111111111111111111111111111110))))

(declare-fun d!68079 () Bool)

(assert (=> d!68079 e!191123))

(declare-fun c!48840 () Bool)

(assert (=> d!68079 (= c!48840 (and ((_ is Intermediate!2417) lt!150333) (undefined!3229 lt!150333)))))

(assert (=> d!68079 (= lt!150333 e!191120)))

(declare-fun c!48841 () Bool)

(assert (=> d!68079 (= c!48841 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!150332 () (_ BitVec 64))

(assert (=> d!68079 (= lt!150332 (select (arr!7312 a!3293) index!1781))))

(assert (=> d!68079 (validMask!0 mask!3709)))

(assert (=> d!68079 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150333)))

(declare-fun b!303995 () Bool)

(assert (=> b!303995 (and (bvsge (index!11846 lt!150333) #b00000000000000000000000000000000) (bvslt (index!11846 lt!150333) (size!7664 a!3293)))))

(declare-fun e!191121 () Bool)

(assert (=> b!303995 (= e!191121 (= (select (arr!7312 a!3293) (index!11846 lt!150333)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!303996 () Bool)

(assert (=> b!303996 (and (bvsge (index!11846 lt!150333) #b00000000000000000000000000000000) (bvslt (index!11846 lt!150333) (size!7664 a!3293)))))

(declare-fun res!161512 () Bool)

(assert (=> b!303996 (= res!161512 (= (select (arr!7312 a!3293) (index!11846 lt!150333)) k0!2441))))

(assert (=> b!303996 (=> res!161512 e!191121)))

(assert (=> b!303996 (= e!191124 e!191121)))

(declare-fun b!303997 () Bool)

(assert (=> b!303997 (and (bvsge (index!11846 lt!150333) #b00000000000000000000000000000000) (bvslt (index!11846 lt!150333) (size!7664 a!3293)))))

(declare-fun res!161511 () Bool)

(assert (=> b!303997 (= res!161511 (= (select (arr!7312 a!3293) (index!11846 lt!150333)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!303997 (=> res!161511 e!191121)))

(declare-fun b!303998 () Bool)

(assert (=> b!303998 (= e!191120 e!191122)))

(declare-fun c!48839 () Bool)

(assert (=> b!303998 (= c!48839 (or (= lt!150332 k0!2441) (= (bvadd lt!150332 lt!150332) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!68079 c!48841) b!303991))

(assert (= (and d!68079 (not c!48841)) b!303998))

(assert (= (and b!303998 c!48839) b!303990))

(assert (= (and b!303998 (not c!48839)) b!303993))

(assert (= (and d!68079 c!48840) b!303994))

(assert (= (and d!68079 (not c!48840)) b!303992))

(assert (= (and b!303992 res!161510) b!303996))

(assert (= (and b!303996 (not res!161512)) b!303997))

(assert (= (and b!303997 (not res!161511)) b!303995))

(assert (=> d!68079 m!315321))

(assert (=> d!68079 m!315323))

(declare-fun m!315379 () Bool)

(assert (=> b!303997 m!315379))

(declare-fun m!315381 () Bool)

(assert (=> b!303993 m!315381))

(assert (=> b!303993 m!315381))

(declare-fun m!315383 () Bool)

(assert (=> b!303993 m!315383))

(assert (=> b!303995 m!315379))

(assert (=> b!303996 m!315379))

(assert (=> b!303897 d!68079))

(declare-fun b!304003 () Bool)

(declare-fun e!191130 () SeekEntryResult!2417)

(assert (=> b!304003 (= e!191130 (Intermediate!2417 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!304004 () Bool)

(declare-fun e!191128 () SeekEntryResult!2417)

(assert (=> b!304004 (= e!191128 (Intermediate!2417 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!304005 () Bool)

(declare-fun e!191131 () Bool)

(declare-fun e!191132 () Bool)

(assert (=> b!304005 (= e!191131 e!191132)))

(declare-fun res!161515 () Bool)

(declare-fun lt!150338 () SeekEntryResult!2417)

(assert (=> b!304005 (= res!161515 (and ((_ is Intermediate!2417) lt!150338) (not (undefined!3229 lt!150338)) (bvslt (x!30207 lt!150338) #b01111111111111111111111111111110) (bvsge (x!30207 lt!150338) #b00000000000000000000000000000000) (bvsge (x!30207 lt!150338) #b00000000000000000000000000000000)))))

(assert (=> b!304005 (=> (not res!161515) (not e!191132))))

(declare-fun b!304006 () Bool)

(assert (=> b!304006 (= e!191130 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304007 () Bool)

(assert (=> b!304007 (= e!191131 (bvsge (x!30207 lt!150338) #b01111111111111111111111111111110))))

(declare-fun d!68083 () Bool)

(assert (=> d!68083 e!191131))

(declare-fun c!48844 () Bool)

(assert (=> d!68083 (= c!48844 (and ((_ is Intermediate!2417) lt!150338) (undefined!3229 lt!150338)))))

(assert (=> d!68083 (= lt!150338 e!191128)))

(declare-fun c!48845 () Bool)

(assert (=> d!68083 (= c!48845 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!150337 () (_ BitVec 64))

(assert (=> d!68083 (= lt!150337 (select (arr!7312 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68083 (validMask!0 mask!3709)))

(assert (=> d!68083 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150338)))

(declare-fun b!304008 () Bool)

(assert (=> b!304008 (and (bvsge (index!11846 lt!150338) #b00000000000000000000000000000000) (bvslt (index!11846 lt!150338) (size!7664 a!3293)))))

(declare-fun e!191129 () Bool)

(assert (=> b!304008 (= e!191129 (= (select (arr!7312 a!3293) (index!11846 lt!150338)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!304009 () Bool)

(assert (=> b!304009 (and (bvsge (index!11846 lt!150338) #b00000000000000000000000000000000) (bvslt (index!11846 lt!150338) (size!7664 a!3293)))))

(declare-fun res!161517 () Bool)

(assert (=> b!304009 (= res!161517 (= (select (arr!7312 a!3293) (index!11846 lt!150338)) k0!2441))))

(assert (=> b!304009 (=> res!161517 e!191129)))

(assert (=> b!304009 (= e!191132 e!191129)))

(declare-fun b!304010 () Bool)

(assert (=> b!304010 (and (bvsge (index!11846 lt!150338) #b00000000000000000000000000000000) (bvslt (index!11846 lt!150338) (size!7664 a!3293)))))

(declare-fun res!161516 () Bool)

(assert (=> b!304010 (= res!161516 (= (select (arr!7312 a!3293) (index!11846 lt!150338)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!304010 (=> res!161516 e!191129)))

(declare-fun b!304011 () Bool)

(assert (=> b!304011 (= e!191128 e!191130)))

(declare-fun c!48843 () Bool)

(assert (=> b!304011 (= c!48843 (or (= lt!150337 k0!2441) (= (bvadd lt!150337 lt!150337) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!68083 c!48845) b!304004))

(assert (= (and d!68083 (not c!48845)) b!304011))

(assert (= (and b!304011 c!48843) b!304003))

(assert (= (and b!304011 (not c!48843)) b!304006))

(assert (= (and d!68083 c!48844) b!304007))

(assert (= (and d!68083 (not c!48844)) b!304005))

(assert (= (and b!304005 res!161515) b!304009))

(assert (= (and b!304009 (not res!161517)) b!304010))

(assert (= (and b!304010 (not res!161516)) b!304008))

(assert (=> d!68083 m!315311))

(declare-fun m!315397 () Bool)

(assert (=> d!68083 m!315397))

(assert (=> d!68083 m!315323))

(declare-fun m!315399 () Bool)

(assert (=> b!304010 m!315399))

(assert (=> b!304006 m!315311))

(declare-fun m!315401 () Bool)

(assert (=> b!304006 m!315401))

(assert (=> b!304006 m!315401))

(declare-fun m!315403 () Bool)

(assert (=> b!304006 m!315403))

(assert (=> b!304008 m!315399))

(assert (=> b!304009 m!315399))

(assert (=> b!303902 d!68083))

(declare-fun d!68087 () Bool)

(declare-fun lt!150344 () (_ BitVec 32))

(declare-fun lt!150343 () (_ BitVec 32))

(assert (=> d!68087 (= lt!150344 (bvmul (bvxor lt!150343 (bvlshr lt!150343 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68087 (= lt!150343 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68087 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!161518 (let ((h!5246 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30211 (bvmul (bvxor h!5246 (bvlshr h!5246 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30211 (bvlshr x!30211 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!161518 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!161518 #b00000000000000000000000000000000))))))

(assert (=> d!68087 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!150344 (bvlshr lt!150344 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!303902 d!68087))

(declare-fun d!68093 () Bool)

(declare-fun lt!150347 () (_ BitVec 32))

(assert (=> d!68093 (and (bvsge lt!150347 #b00000000000000000000000000000000) (bvslt lt!150347 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68093 (= lt!150347 (choose!52 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(assert (=> d!68093 (validMask!0 mask!3709)))

(assert (=> d!68093 (= (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) lt!150347)))

(declare-fun bs!10725 () Bool)

(assert (= bs!10725 d!68093))

(declare-fun m!315407 () Bool)

(assert (=> bs!10725 m!315407))

(assert (=> bs!10725 m!315323))

(assert (=> b!303903 d!68093))

(declare-fun d!68095 () Bool)

(assert (=> d!68095 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30330 d!68095))

(declare-fun d!68099 () Bool)

(assert (=> d!68099 (= (array_inv!5262 a!3293) (bvsge (size!7664 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30330 d!68099))

(declare-fun e!191185 () SeekEntryResult!2417)

(declare-fun lt!150379 () SeekEntryResult!2417)

(declare-fun b!304099 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15449 (_ BitVec 32)) SeekEntryResult!2417)

(assert (=> b!304099 (= e!191185 (seekKeyOrZeroReturnVacant!0 (x!30207 lt!150379) (index!11846 lt!150379) (index!11846 lt!150379) k0!2441 a!3293 mask!3709))))

(declare-fun d!68101 () Bool)

(declare-fun lt!150380 () SeekEntryResult!2417)

(assert (=> d!68101 (and (or ((_ is Undefined!2417) lt!150380) (not ((_ is Found!2417) lt!150380)) (and (bvsge (index!11845 lt!150380) #b00000000000000000000000000000000) (bvslt (index!11845 lt!150380) (size!7664 a!3293)))) (or ((_ is Undefined!2417) lt!150380) ((_ is Found!2417) lt!150380) (not ((_ is MissingZero!2417) lt!150380)) (and (bvsge (index!11844 lt!150380) #b00000000000000000000000000000000) (bvslt (index!11844 lt!150380) (size!7664 a!3293)))) (or ((_ is Undefined!2417) lt!150380) ((_ is Found!2417) lt!150380) ((_ is MissingZero!2417) lt!150380) (not ((_ is MissingVacant!2417) lt!150380)) (and (bvsge (index!11847 lt!150380) #b00000000000000000000000000000000) (bvslt (index!11847 lt!150380) (size!7664 a!3293)))) (or ((_ is Undefined!2417) lt!150380) (ite ((_ is Found!2417) lt!150380) (= (select (arr!7312 a!3293) (index!11845 lt!150380)) k0!2441) (ite ((_ is MissingZero!2417) lt!150380) (= (select (arr!7312 a!3293) (index!11844 lt!150380)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2417) lt!150380) (= (select (arr!7312 a!3293) (index!11847 lt!150380)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!191187 () SeekEntryResult!2417)

(assert (=> d!68101 (= lt!150380 e!191187)))

(declare-fun c!48877 () Bool)

(assert (=> d!68101 (= c!48877 (and ((_ is Intermediate!2417) lt!150379) (undefined!3229 lt!150379)))))

(assert (=> d!68101 (= lt!150379 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68101 (validMask!0 mask!3709)))

(assert (=> d!68101 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!150380)))

(declare-fun b!304100 () Bool)

(assert (=> b!304100 (= e!191187 Undefined!2417)))

(declare-fun b!304101 () Bool)

(declare-fun e!191186 () SeekEntryResult!2417)

(assert (=> b!304101 (= e!191186 (Found!2417 (index!11846 lt!150379)))))

(declare-fun b!304102 () Bool)

(declare-fun c!48878 () Bool)

(declare-fun lt!150381 () (_ BitVec 64))

(assert (=> b!304102 (= c!48878 (= lt!150381 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!304102 (= e!191186 e!191185)))

(declare-fun b!304103 () Bool)

(assert (=> b!304103 (= e!191187 e!191186)))

(assert (=> b!304103 (= lt!150381 (select (arr!7312 a!3293) (index!11846 lt!150379)))))

(declare-fun c!48876 () Bool)

(assert (=> b!304103 (= c!48876 (= lt!150381 k0!2441))))

(declare-fun b!304104 () Bool)

(assert (=> b!304104 (= e!191185 (MissingZero!2417 (index!11846 lt!150379)))))

(assert (= (and d!68101 c!48877) b!304100))

(assert (= (and d!68101 (not c!48877)) b!304103))

(assert (= (and b!304103 c!48876) b!304101))

(assert (= (and b!304103 (not c!48876)) b!304102))

(assert (= (and b!304102 c!48878) b!304104))

(assert (= (and b!304102 (not c!48878)) b!304099))

(declare-fun m!315427 () Bool)

(assert (=> b!304099 m!315427))

(assert (=> d!68101 m!315323))

(assert (=> d!68101 m!315311))

(declare-fun m!315429 () Bool)

(assert (=> d!68101 m!315429))

(declare-fun m!315431 () Bool)

(assert (=> d!68101 m!315431))

(assert (=> d!68101 m!315311))

(assert (=> d!68101 m!315313))

(declare-fun m!315433 () Bool)

(assert (=> d!68101 m!315433))

(declare-fun m!315435 () Bool)

(assert (=> b!304103 m!315435))

(assert (=> b!303901 d!68101))

(declare-fun d!68105 () Bool)

(assert (=> d!68105 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!303900 d!68105))

(declare-fun b!304147 () Bool)

(declare-fun e!191213 () Bool)

(declare-fun e!191212 () Bool)

(assert (=> b!304147 (= e!191213 e!191212)))

(declare-fun c!48893 () Bool)

(assert (=> b!304147 (= c!48893 (validKeyInArray!0 (select (arr!7312 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!304148 () Bool)

(declare-fun call!25886 () Bool)

(assert (=> b!304148 (= e!191212 call!25886)))

(declare-fun b!304146 () Bool)

(declare-fun e!191214 () Bool)

(assert (=> b!304146 (= e!191212 e!191214)))

(declare-fun lt!150408 () (_ BitVec 64))

(assert (=> b!304146 (= lt!150408 (select (arr!7312 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9353 0))(
  ( (Unit!9354) )
))
(declare-fun lt!150407 () Unit!9353)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15449 (_ BitVec 64) (_ BitVec 32)) Unit!9353)

(assert (=> b!304146 (= lt!150407 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!150408 #b00000000000000000000000000000000))))

(assert (=> b!304146 (arrayContainsKey!0 a!3293 lt!150408 #b00000000000000000000000000000000)))

(declare-fun lt!150406 () Unit!9353)

(assert (=> b!304146 (= lt!150406 lt!150407)))

(declare-fun res!161562 () Bool)

(assert (=> b!304146 (= res!161562 (= (seekEntryOrOpen!0 (select (arr!7312 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2417 #b00000000000000000000000000000000)))))

(assert (=> b!304146 (=> (not res!161562) (not e!191214))))

(declare-fun d!68107 () Bool)

(declare-fun res!161561 () Bool)

(assert (=> d!68107 (=> res!161561 e!191213)))

(assert (=> d!68107 (= res!161561 (bvsge #b00000000000000000000000000000000 (size!7664 a!3293)))))

(assert (=> d!68107 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!191213)))

(declare-fun b!304149 () Bool)

(assert (=> b!304149 (= e!191214 call!25886)))

(declare-fun bm!25883 () Bool)

(assert (=> bm!25883 (= call!25886 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(assert (= (and d!68107 (not res!161561)) b!304147))

(assert (= (and b!304147 c!48893) b!304146))

(assert (= (and b!304147 (not c!48893)) b!304148))

(assert (= (and b!304146 res!161562) b!304149))

(assert (= (or b!304149 b!304148) bm!25883))

(declare-fun m!315471 () Bool)

(assert (=> b!304147 m!315471))

(assert (=> b!304147 m!315471))

(declare-fun m!315473 () Bool)

(assert (=> b!304147 m!315473))

(assert (=> b!304146 m!315471))

(declare-fun m!315475 () Bool)

(assert (=> b!304146 m!315475))

(declare-fun m!315477 () Bool)

(assert (=> b!304146 m!315477))

(assert (=> b!304146 m!315471))

(declare-fun m!315479 () Bool)

(assert (=> b!304146 m!315479))

(declare-fun m!315481 () Bool)

(assert (=> bm!25883 m!315481))

(assert (=> b!303898 d!68107))

(declare-fun d!68123 () Bool)

(declare-fun res!161567 () Bool)

(declare-fun e!191219 () Bool)

(assert (=> d!68123 (=> res!161567 e!191219)))

(assert (=> d!68123 (= res!161567 (= (select (arr!7312 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68123 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!191219)))

(declare-fun b!304154 () Bool)

(declare-fun e!191220 () Bool)

(assert (=> b!304154 (= e!191219 e!191220)))

(declare-fun res!161568 () Bool)

(assert (=> b!304154 (=> (not res!161568) (not e!191220))))

(assert (=> b!304154 (= res!161568 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7664 a!3293)))))

(declare-fun b!304155 () Bool)

(assert (=> b!304155 (= e!191220 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68123 (not res!161567)) b!304154))

(assert (= (and b!304154 res!161568) b!304155))

(assert (=> d!68123 m!315471))

(declare-fun m!315485 () Bool)

(assert (=> b!304155 m!315485))

(assert (=> b!303899 d!68123))

(check-sat (not b!304147) (not b!303993) (not b!304146) (not b!304099) (not d!68083) (not bm!25883) (not d!68079) (not b!304155) (not d!68101) (not b!304006) (not d!68093))
(check-sat)
