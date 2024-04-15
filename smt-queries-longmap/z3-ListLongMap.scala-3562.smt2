; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48930 () Bool)

(assert start!48930)

(declare-fun b!539277 () Bool)

(declare-fun e!312533 () Bool)

(declare-fun e!312532 () Bool)

(assert (=> b!539277 (= e!312533 e!312532)))

(declare-fun res!334624 () Bool)

(assert (=> b!539277 (=> (not res!334624) (not e!312532))))

(declare-datatypes ((SeekEntryResult!4870 0))(
  ( (MissingZero!4870 (index!21704 (_ BitVec 32))) (Found!4870 (index!21705 (_ BitVec 32))) (Intermediate!4870 (undefined!5682 Bool) (index!21706 (_ BitVec 32)) (x!50624 (_ BitVec 32))) (Undefined!4870) (MissingVacant!4870 (index!21707 (_ BitVec 32))) )
))
(declare-fun lt!246925 () SeekEntryResult!4870)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539277 (= res!334624 (or (= lt!246925 (MissingZero!4870 i!1153)) (= lt!246925 (MissingVacant!4870 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34152 0))(
  ( (array!34153 (arr!16415 (Array (_ BitVec 32) (_ BitVec 64))) (size!16780 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34152)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34152 (_ BitVec 32)) SeekEntryResult!4870)

(assert (=> b!539277 (= lt!246925 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539278 () Bool)

(declare-fun res!334626 () Bool)

(declare-fun e!312531 () Bool)

(assert (=> b!539278 (=> (not res!334626) (not e!312531))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun lt!246924 () SeekEntryResult!4870)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34152 (_ BitVec 32)) SeekEntryResult!4870)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539278 (= res!334626 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16415 a!3154) j!147) mask!3216) (select (arr!16415 a!3154) j!147) a!3154 mask!3216) lt!246924))))

(declare-fun b!539279 () Bool)

(declare-fun res!334627 () Bool)

(assert (=> b!539279 (=> (not res!334627) (not e!312532))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539279 (= res!334627 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16780 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16780 a!3154)) (= (select (arr!16415 a!3154) resIndex!32) (select (arr!16415 a!3154) j!147))))))

(declare-fun res!334628 () Bool)

(assert (=> start!48930 (=> (not res!334628) (not e!312533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48930 (= res!334628 (validMask!0 mask!3216))))

(assert (=> start!48930 e!312533))

(assert (=> start!48930 true))

(declare-fun array_inv!12298 (array!34152) Bool)

(assert (=> start!48930 (array_inv!12298 a!3154)))

(declare-fun b!539280 () Bool)

(assert (=> b!539280 (= e!312531 (= (select (arr!16415 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!539281 () Bool)

(declare-fun res!334632 () Bool)

(assert (=> b!539281 (=> (not res!334632) (not e!312533))))

(declare-fun arrayContainsKey!0 (array!34152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539281 (= res!334632 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539282 () Bool)

(declare-fun res!334634 () Bool)

(assert (=> b!539282 (=> (not res!334634) (not e!312533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539282 (= res!334634 (validKeyInArray!0 (select (arr!16415 a!3154) j!147)))))

(declare-fun b!539283 () Bool)

(declare-fun res!334631 () Bool)

(assert (=> b!539283 (=> (not res!334631) (not e!312532))))

(declare-datatypes ((List!10573 0))(
  ( (Nil!10570) (Cons!10569 (h!11512 (_ BitVec 64)) (t!16792 List!10573)) )
))
(declare-fun arrayNoDuplicates!0 (array!34152 (_ BitVec 32) List!10573) Bool)

(assert (=> b!539283 (= res!334631 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10570))))

(declare-fun b!539284 () Bool)

(declare-fun res!334625 () Bool)

(assert (=> b!539284 (=> (not res!334625) (not e!312533))))

(assert (=> b!539284 (= res!334625 (validKeyInArray!0 k0!1998))))

(declare-fun b!539285 () Bool)

(declare-fun res!334630 () Bool)

(assert (=> b!539285 (=> (not res!334630) (not e!312533))))

(assert (=> b!539285 (= res!334630 (and (= (size!16780 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16780 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16780 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539286 () Bool)

(declare-fun res!334633 () Bool)

(assert (=> b!539286 (=> (not res!334633) (not e!312532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34152 (_ BitVec 32)) Bool)

(assert (=> b!539286 (= res!334633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539287 () Bool)

(assert (=> b!539287 (= e!312532 e!312531)))

(declare-fun res!334629 () Bool)

(assert (=> b!539287 (=> (not res!334629) (not e!312531))))

(assert (=> b!539287 (= res!334629 (= lt!246924 (Intermediate!4870 false resIndex!32 resX!32)))))

(assert (=> b!539287 (= lt!246924 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16415 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48930 res!334628) b!539285))

(assert (= (and b!539285 res!334630) b!539282))

(assert (= (and b!539282 res!334634) b!539284))

(assert (= (and b!539284 res!334625) b!539281))

(assert (= (and b!539281 res!334632) b!539277))

(assert (= (and b!539277 res!334624) b!539286))

(assert (= (and b!539286 res!334633) b!539283))

(assert (= (and b!539283 res!334631) b!539279))

(assert (= (and b!539279 res!334627) b!539287))

(assert (= (and b!539287 res!334629) b!539278))

(assert (= (and b!539278 res!334626) b!539280))

(declare-fun m!517801 () Bool)

(assert (=> b!539277 m!517801))

(declare-fun m!517803 () Bool)

(assert (=> b!539282 m!517803))

(assert (=> b!539282 m!517803))

(declare-fun m!517805 () Bool)

(assert (=> b!539282 m!517805))

(declare-fun m!517807 () Bool)

(assert (=> b!539286 m!517807))

(declare-fun m!517809 () Bool)

(assert (=> b!539284 m!517809))

(assert (=> b!539287 m!517803))

(assert (=> b!539287 m!517803))

(declare-fun m!517811 () Bool)

(assert (=> b!539287 m!517811))

(declare-fun m!517813 () Bool)

(assert (=> b!539283 m!517813))

(declare-fun m!517815 () Bool)

(assert (=> b!539280 m!517815))

(declare-fun m!517817 () Bool)

(assert (=> b!539281 m!517817))

(assert (=> b!539278 m!517803))

(assert (=> b!539278 m!517803))

(declare-fun m!517819 () Bool)

(assert (=> b!539278 m!517819))

(assert (=> b!539278 m!517819))

(assert (=> b!539278 m!517803))

(declare-fun m!517821 () Bool)

(assert (=> b!539278 m!517821))

(declare-fun m!517823 () Bool)

(assert (=> start!48930 m!517823))

(declare-fun m!517825 () Bool)

(assert (=> start!48930 m!517825))

(declare-fun m!517827 () Bool)

(assert (=> b!539279 m!517827))

(assert (=> b!539279 m!517803))

(check-sat (not start!48930) (not b!539287) (not b!539283) (not b!539284) (not b!539286) (not b!539278) (not b!539282) (not b!539281) (not b!539277))
(check-sat)
(get-model)

(declare-fun b!539372 () Bool)

(declare-fun e!312573 () SeekEntryResult!4870)

(declare-fun e!312572 () SeekEntryResult!4870)

(assert (=> b!539372 (= e!312573 e!312572)))

(declare-fun c!62646 () Bool)

(declare-fun lt!246943 () (_ BitVec 64))

(assert (=> b!539372 (= c!62646 (or (= lt!246943 (select (arr!16415 a!3154) j!147)) (= (bvadd lt!246943 lt!246943) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!539373 () Bool)

(declare-fun lt!246942 () SeekEntryResult!4870)

(assert (=> b!539373 (and (bvsge (index!21706 lt!246942) #b00000000000000000000000000000000) (bvslt (index!21706 lt!246942) (size!16780 a!3154)))))

(declare-fun e!312571 () Bool)

(assert (=> b!539373 (= e!312571 (= (select (arr!16415 a!3154) (index!21706 lt!246942)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!539374 () Bool)

(assert (=> b!539374 (= e!312573 (Intermediate!4870 true index!1177 x!1030))))

(declare-fun b!539375 () Bool)

(declare-fun e!312570 () Bool)

(declare-fun e!312569 () Bool)

(assert (=> b!539375 (= e!312570 e!312569)))

(declare-fun res!334708 () Bool)

(get-info :version)

(assert (=> b!539375 (= res!334708 (and ((_ is Intermediate!4870) lt!246942) (not (undefined!5682 lt!246942)) (bvslt (x!50624 lt!246942) #b01111111111111111111111111111110) (bvsge (x!50624 lt!246942) #b00000000000000000000000000000000) (bvsge (x!50624 lt!246942) x!1030)))))

(assert (=> b!539375 (=> (not res!334708) (not e!312569))))

(declare-fun b!539376 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539376 (= e!312572 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16415 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539377 () Bool)

(assert (=> b!539377 (= e!312572 (Intermediate!4870 false index!1177 x!1030))))

(declare-fun d!81383 () Bool)

(assert (=> d!81383 e!312570))

(declare-fun c!62644 () Bool)

(assert (=> d!81383 (= c!62644 (and ((_ is Intermediate!4870) lt!246942) (undefined!5682 lt!246942)))))

(assert (=> d!81383 (= lt!246942 e!312573)))

(declare-fun c!62645 () Bool)

(assert (=> d!81383 (= c!62645 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81383 (= lt!246943 (select (arr!16415 a!3154) index!1177))))

(assert (=> d!81383 (validMask!0 mask!3216)))

(assert (=> d!81383 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16415 a!3154) j!147) a!3154 mask!3216) lt!246942)))

(declare-fun b!539378 () Bool)

(assert (=> b!539378 (= e!312570 (bvsge (x!50624 lt!246942) #b01111111111111111111111111111110))))

(declare-fun b!539379 () Bool)

(assert (=> b!539379 (and (bvsge (index!21706 lt!246942) #b00000000000000000000000000000000) (bvslt (index!21706 lt!246942) (size!16780 a!3154)))))

(declare-fun res!334707 () Bool)

(assert (=> b!539379 (= res!334707 (= (select (arr!16415 a!3154) (index!21706 lt!246942)) (select (arr!16415 a!3154) j!147)))))

(assert (=> b!539379 (=> res!334707 e!312571)))

(assert (=> b!539379 (= e!312569 e!312571)))

(declare-fun b!539380 () Bool)

(assert (=> b!539380 (and (bvsge (index!21706 lt!246942) #b00000000000000000000000000000000) (bvslt (index!21706 lt!246942) (size!16780 a!3154)))))

(declare-fun res!334709 () Bool)

(assert (=> b!539380 (= res!334709 (= (select (arr!16415 a!3154) (index!21706 lt!246942)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!539380 (=> res!334709 e!312571)))

(assert (= (and d!81383 c!62645) b!539374))

(assert (= (and d!81383 (not c!62645)) b!539372))

(assert (= (and b!539372 c!62646) b!539377))

(assert (= (and b!539372 (not c!62646)) b!539376))

(assert (= (and d!81383 c!62644) b!539378))

(assert (= (and d!81383 (not c!62644)) b!539375))

(assert (= (and b!539375 res!334708) b!539379))

(assert (= (and b!539379 (not res!334707)) b!539380))

(assert (= (and b!539380 (not res!334709)) b!539373))

(assert (=> d!81383 m!517815))

(assert (=> d!81383 m!517823))

(declare-fun m!517885 () Bool)

(assert (=> b!539373 m!517885))

(declare-fun m!517887 () Bool)

(assert (=> b!539376 m!517887))

(assert (=> b!539376 m!517887))

(assert (=> b!539376 m!517803))

(declare-fun m!517889 () Bool)

(assert (=> b!539376 m!517889))

(assert (=> b!539379 m!517885))

(assert (=> b!539380 m!517885))

(assert (=> b!539287 d!81383))

(declare-fun b!539389 () Bool)

(declare-fun e!312581 () Bool)

(declare-fun call!31975 () Bool)

(assert (=> b!539389 (= e!312581 call!31975)))

(declare-fun b!539390 () Bool)

(declare-fun e!312582 () Bool)

(assert (=> b!539390 (= e!312582 call!31975)))

(declare-fun bm!31972 () Bool)

(assert (=> bm!31972 (= call!31975 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!539391 () Bool)

(assert (=> b!539391 (= e!312582 e!312581)))

(declare-fun lt!246950 () (_ BitVec 64))

(assert (=> b!539391 (= lt!246950 (select (arr!16415 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16864 0))(
  ( (Unit!16865) )
))
(declare-fun lt!246951 () Unit!16864)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34152 (_ BitVec 64) (_ BitVec 32)) Unit!16864)

(assert (=> b!539391 (= lt!246951 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!246950 #b00000000000000000000000000000000))))

(assert (=> b!539391 (arrayContainsKey!0 a!3154 lt!246950 #b00000000000000000000000000000000)))

(declare-fun lt!246952 () Unit!16864)

(assert (=> b!539391 (= lt!246952 lt!246951)))

(declare-fun res!334714 () Bool)

(assert (=> b!539391 (= res!334714 (= (seekEntryOrOpen!0 (select (arr!16415 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4870 #b00000000000000000000000000000000)))))

(assert (=> b!539391 (=> (not res!334714) (not e!312581))))

(declare-fun b!539392 () Bool)

(declare-fun e!312580 () Bool)

(assert (=> b!539392 (= e!312580 e!312582)))

(declare-fun c!62649 () Bool)

(assert (=> b!539392 (= c!62649 (validKeyInArray!0 (select (arr!16415 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81389 () Bool)

(declare-fun res!334715 () Bool)

(assert (=> d!81389 (=> res!334715 e!312580)))

(assert (=> d!81389 (= res!334715 (bvsge #b00000000000000000000000000000000 (size!16780 a!3154)))))

(assert (=> d!81389 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!312580)))

(assert (= (and d!81389 (not res!334715)) b!539392))

(assert (= (and b!539392 c!62649) b!539391))

(assert (= (and b!539392 (not c!62649)) b!539390))

(assert (= (and b!539391 res!334714) b!539389))

(assert (= (or b!539389 b!539390) bm!31972))

(declare-fun m!517891 () Bool)

(assert (=> bm!31972 m!517891))

(declare-fun m!517893 () Bool)

(assert (=> b!539391 m!517893))

(declare-fun m!517895 () Bool)

(assert (=> b!539391 m!517895))

(declare-fun m!517897 () Bool)

(assert (=> b!539391 m!517897))

(assert (=> b!539391 m!517893))

(declare-fun m!517899 () Bool)

(assert (=> b!539391 m!517899))

(assert (=> b!539392 m!517893))

(assert (=> b!539392 m!517893))

(declare-fun m!517901 () Bool)

(assert (=> b!539392 m!517901))

(assert (=> b!539286 d!81389))

(declare-fun d!81391 () Bool)

(declare-fun res!334720 () Bool)

(declare-fun e!312587 () Bool)

(assert (=> d!81391 (=> res!334720 e!312587)))

(assert (=> d!81391 (= res!334720 (= (select (arr!16415 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81391 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!312587)))

(declare-fun b!539397 () Bool)

(declare-fun e!312588 () Bool)

(assert (=> b!539397 (= e!312587 e!312588)))

(declare-fun res!334721 () Bool)

(assert (=> b!539397 (=> (not res!334721) (not e!312588))))

(assert (=> b!539397 (= res!334721 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16780 a!3154)))))

(declare-fun b!539398 () Bool)

(assert (=> b!539398 (= e!312588 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81391 (not res!334720)) b!539397))

(assert (= (and b!539397 res!334721) b!539398))

(assert (=> d!81391 m!517893))

(declare-fun m!517903 () Bool)

(assert (=> b!539398 m!517903))

(assert (=> b!539281 d!81391))

(declare-fun d!81393 () Bool)

(assert (=> d!81393 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!539284 d!81393))

(declare-fun b!539407 () Bool)

(declare-fun e!312597 () SeekEntryResult!4870)

(declare-fun e!312596 () SeekEntryResult!4870)

(assert (=> b!539407 (= e!312597 e!312596)))

(declare-fun lt!246958 () (_ BitVec 64))

(declare-fun c!62656 () Bool)

(assert (=> b!539407 (= c!62656 (or (= lt!246958 (select (arr!16415 a!3154) j!147)) (= (bvadd lt!246958 lt!246958) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!539408 () Bool)

(declare-fun lt!246957 () SeekEntryResult!4870)

(assert (=> b!539408 (and (bvsge (index!21706 lt!246957) #b00000000000000000000000000000000) (bvslt (index!21706 lt!246957) (size!16780 a!3154)))))

(declare-fun e!312595 () Bool)

(assert (=> b!539408 (= e!312595 (= (select (arr!16415 a!3154) (index!21706 lt!246957)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!539409 () Bool)

(assert (=> b!539409 (= e!312597 (Intermediate!4870 true (toIndex!0 (select (arr!16415 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!539410 () Bool)

(declare-fun e!312594 () Bool)

(declare-fun e!312593 () Bool)

(assert (=> b!539410 (= e!312594 e!312593)))

(declare-fun res!334723 () Bool)

(assert (=> b!539410 (= res!334723 (and ((_ is Intermediate!4870) lt!246957) (not (undefined!5682 lt!246957)) (bvslt (x!50624 lt!246957) #b01111111111111111111111111111110) (bvsge (x!50624 lt!246957) #b00000000000000000000000000000000) (bvsge (x!50624 lt!246957) #b00000000000000000000000000000000)))))

(assert (=> b!539410 (=> (not res!334723) (not e!312593))))

(declare-fun b!539411 () Bool)

(assert (=> b!539411 (= e!312596 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16415 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16415 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539412 () Bool)

(assert (=> b!539412 (= e!312596 (Intermediate!4870 false (toIndex!0 (select (arr!16415 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun d!81395 () Bool)

(assert (=> d!81395 e!312594))

(declare-fun c!62654 () Bool)

(assert (=> d!81395 (= c!62654 (and ((_ is Intermediate!4870) lt!246957) (undefined!5682 lt!246957)))))

(assert (=> d!81395 (= lt!246957 e!312597)))

(declare-fun c!62655 () Bool)

(assert (=> d!81395 (= c!62655 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81395 (= lt!246958 (select (arr!16415 a!3154) (toIndex!0 (select (arr!16415 a!3154) j!147) mask!3216)))))

(assert (=> d!81395 (validMask!0 mask!3216)))

(assert (=> d!81395 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16415 a!3154) j!147) mask!3216) (select (arr!16415 a!3154) j!147) a!3154 mask!3216) lt!246957)))

(declare-fun b!539413 () Bool)

(assert (=> b!539413 (= e!312594 (bvsge (x!50624 lt!246957) #b01111111111111111111111111111110))))

(declare-fun b!539414 () Bool)

(assert (=> b!539414 (and (bvsge (index!21706 lt!246957) #b00000000000000000000000000000000) (bvslt (index!21706 lt!246957) (size!16780 a!3154)))))

(declare-fun res!334722 () Bool)

(assert (=> b!539414 (= res!334722 (= (select (arr!16415 a!3154) (index!21706 lt!246957)) (select (arr!16415 a!3154) j!147)))))

(assert (=> b!539414 (=> res!334722 e!312595)))

(assert (=> b!539414 (= e!312593 e!312595)))

(declare-fun b!539415 () Bool)

(assert (=> b!539415 (and (bvsge (index!21706 lt!246957) #b00000000000000000000000000000000) (bvslt (index!21706 lt!246957) (size!16780 a!3154)))))

(declare-fun res!334724 () Bool)

(assert (=> b!539415 (= res!334724 (= (select (arr!16415 a!3154) (index!21706 lt!246957)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!539415 (=> res!334724 e!312595)))

(assert (= (and d!81395 c!62655) b!539409))

(assert (= (and d!81395 (not c!62655)) b!539407))

(assert (= (and b!539407 c!62656) b!539412))

(assert (= (and b!539407 (not c!62656)) b!539411))

(assert (= (and d!81395 c!62654) b!539413))

(assert (= (and d!81395 (not c!62654)) b!539410))

(assert (= (and b!539410 res!334723) b!539414))

(assert (= (and b!539414 (not res!334722)) b!539415))

(assert (= (and b!539415 (not res!334724)) b!539408))

(assert (=> d!81395 m!517819))

(declare-fun m!517905 () Bool)

(assert (=> d!81395 m!517905))

(assert (=> d!81395 m!517823))

(declare-fun m!517907 () Bool)

(assert (=> b!539408 m!517907))

(assert (=> b!539411 m!517819))

(declare-fun m!517909 () Bool)

(assert (=> b!539411 m!517909))

(assert (=> b!539411 m!517909))

(assert (=> b!539411 m!517803))

(declare-fun m!517911 () Bool)

(assert (=> b!539411 m!517911))

(assert (=> b!539414 m!517907))

(assert (=> b!539415 m!517907))

(assert (=> b!539278 d!81395))

(declare-fun d!81397 () Bool)

(declare-fun lt!246970 () (_ BitVec 32))

(declare-fun lt!246969 () (_ BitVec 32))

(assert (=> d!81397 (= lt!246970 (bvmul (bvxor lt!246969 (bvlshr lt!246969 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81397 (= lt!246969 ((_ extract 31 0) (bvand (bvxor (select (arr!16415 a!3154) j!147) (bvlshr (select (arr!16415 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81397 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!334731 (let ((h!11515 ((_ extract 31 0) (bvand (bvxor (select (arr!16415 a!3154) j!147) (bvlshr (select (arr!16415 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50630 (bvmul (bvxor h!11515 (bvlshr h!11515 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50630 (bvlshr x!50630 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!334731 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!334731 #b00000000000000000000000000000000))))))

(assert (=> d!81397 (= (toIndex!0 (select (arr!16415 a!3154) j!147) mask!3216) (bvand (bvxor lt!246970 (bvlshr lt!246970 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!539278 d!81397))

(declare-fun b!539489 () Bool)

(declare-fun e!312644 () Bool)

(declare-fun call!31978 () Bool)

(assert (=> b!539489 (= e!312644 call!31978)))

(declare-fun b!539490 () Bool)

(declare-fun e!312646 () Bool)

(declare-fun e!312645 () Bool)

(assert (=> b!539490 (= e!312646 e!312645)))

(declare-fun res!334758 () Bool)

(assert (=> b!539490 (=> (not res!334758) (not e!312645))))

(declare-fun e!312643 () Bool)

(assert (=> b!539490 (= res!334758 (not e!312643))))

(declare-fun res!334759 () Bool)

(assert (=> b!539490 (=> (not res!334759) (not e!312643))))

(assert (=> b!539490 (= res!334759 (validKeyInArray!0 (select (arr!16415 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81401 () Bool)

(declare-fun res!334760 () Bool)

(assert (=> d!81401 (=> res!334760 e!312646)))

(assert (=> d!81401 (= res!334760 (bvsge #b00000000000000000000000000000000 (size!16780 a!3154)))))

(assert (=> d!81401 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10570) e!312646)))

(declare-fun b!539491 () Bool)

(declare-fun contains!2773 (List!10573 (_ BitVec 64)) Bool)

(assert (=> b!539491 (= e!312643 (contains!2773 Nil!10570 (select (arr!16415 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!539492 () Bool)

(assert (=> b!539492 (= e!312644 call!31978)))

(declare-fun bm!31975 () Bool)

(declare-fun c!62678 () Bool)

(assert (=> bm!31975 (= call!31978 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62678 (Cons!10569 (select (arr!16415 a!3154) #b00000000000000000000000000000000) Nil!10570) Nil!10570)))))

(declare-fun b!539493 () Bool)

(assert (=> b!539493 (= e!312645 e!312644)))

(assert (=> b!539493 (= c!62678 (validKeyInArray!0 (select (arr!16415 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81401 (not res!334760)) b!539490))

(assert (= (and b!539490 res!334759) b!539491))

(assert (= (and b!539490 res!334758) b!539493))

(assert (= (and b!539493 c!62678) b!539492))

(assert (= (and b!539493 (not c!62678)) b!539489))

(assert (= (or b!539492 b!539489) bm!31975))

(assert (=> b!539490 m!517893))

(assert (=> b!539490 m!517893))

(assert (=> b!539490 m!517901))

(assert (=> b!539491 m!517893))

(assert (=> b!539491 m!517893))

(declare-fun m!517931 () Bool)

(assert (=> b!539491 m!517931))

(assert (=> bm!31975 m!517893))

(declare-fun m!517935 () Bool)

(assert (=> bm!31975 m!517935))

(assert (=> b!539493 m!517893))

(assert (=> b!539493 m!517893))

(assert (=> b!539493 m!517901))

(assert (=> b!539283 d!81401))

(declare-fun d!81409 () Bool)

(assert (=> d!81409 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48930 d!81409))

(declare-fun d!81419 () Bool)

(assert (=> d!81419 (= (array_inv!12298 a!3154) (bvsge (size!16780 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48930 d!81419))

(declare-fun d!81421 () Bool)

(assert (=> d!81421 (= (validKeyInArray!0 (select (arr!16415 a!3154) j!147)) (and (not (= (select (arr!16415 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16415 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!539282 d!81421))

(declare-fun b!539564 () Bool)

(declare-fun e!312696 () SeekEntryResult!4870)

(assert (=> b!539564 (= e!312696 Undefined!4870)))

(declare-fun b!539565 () Bool)

(declare-fun e!312695 () SeekEntryResult!4870)

(assert (=> b!539565 (= e!312696 e!312695)))

(declare-fun lt!247020 () (_ BitVec 64))

(declare-fun lt!247021 () SeekEntryResult!4870)

(assert (=> b!539565 (= lt!247020 (select (arr!16415 a!3154) (index!21706 lt!247021)))))

(declare-fun c!62701 () Bool)

(assert (=> b!539565 (= c!62701 (= lt!247020 k0!1998))))

(declare-fun b!539566 () Bool)

(declare-fun c!62702 () Bool)

(assert (=> b!539566 (= c!62702 (= lt!247020 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!312694 () SeekEntryResult!4870)

(assert (=> b!539566 (= e!312695 e!312694)))

(declare-fun b!539568 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34152 (_ BitVec 32)) SeekEntryResult!4870)

(assert (=> b!539568 (= e!312694 (seekKeyOrZeroReturnVacant!0 (x!50624 lt!247021) (index!21706 lt!247021) (index!21706 lt!247021) k0!1998 a!3154 mask!3216))))

(declare-fun b!539569 () Bool)

(assert (=> b!539569 (= e!312695 (Found!4870 (index!21706 lt!247021)))))

(declare-fun b!539567 () Bool)

(assert (=> b!539567 (= e!312694 (MissingZero!4870 (index!21706 lt!247021)))))

(declare-fun d!81423 () Bool)

(declare-fun lt!247019 () SeekEntryResult!4870)

(assert (=> d!81423 (and (or ((_ is Undefined!4870) lt!247019) (not ((_ is Found!4870) lt!247019)) (and (bvsge (index!21705 lt!247019) #b00000000000000000000000000000000) (bvslt (index!21705 lt!247019) (size!16780 a!3154)))) (or ((_ is Undefined!4870) lt!247019) ((_ is Found!4870) lt!247019) (not ((_ is MissingZero!4870) lt!247019)) (and (bvsge (index!21704 lt!247019) #b00000000000000000000000000000000) (bvslt (index!21704 lt!247019) (size!16780 a!3154)))) (or ((_ is Undefined!4870) lt!247019) ((_ is Found!4870) lt!247019) ((_ is MissingZero!4870) lt!247019) (not ((_ is MissingVacant!4870) lt!247019)) (and (bvsge (index!21707 lt!247019) #b00000000000000000000000000000000) (bvslt (index!21707 lt!247019) (size!16780 a!3154)))) (or ((_ is Undefined!4870) lt!247019) (ite ((_ is Found!4870) lt!247019) (= (select (arr!16415 a!3154) (index!21705 lt!247019)) k0!1998) (ite ((_ is MissingZero!4870) lt!247019) (= (select (arr!16415 a!3154) (index!21704 lt!247019)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4870) lt!247019) (= (select (arr!16415 a!3154) (index!21707 lt!247019)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81423 (= lt!247019 e!312696)))

(declare-fun c!62703 () Bool)

(assert (=> d!81423 (= c!62703 (and ((_ is Intermediate!4870) lt!247021) (undefined!5682 lt!247021)))))

(assert (=> d!81423 (= lt!247021 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81423 (validMask!0 mask!3216)))

(assert (=> d!81423 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!247019)))

(assert (= (and d!81423 c!62703) b!539564))

(assert (= (and d!81423 (not c!62703)) b!539565))

(assert (= (and b!539565 c!62701) b!539569))

(assert (= (and b!539565 (not c!62701)) b!539566))

(assert (= (and b!539566 c!62702) b!539567))

(assert (= (and b!539566 (not c!62702)) b!539568))

(declare-fun m!517975 () Bool)

(assert (=> b!539565 m!517975))

(declare-fun m!517977 () Bool)

(assert (=> b!539568 m!517977))

(declare-fun m!517979 () Bool)

(assert (=> d!81423 m!517979))

(declare-fun m!517981 () Bool)

(assert (=> d!81423 m!517981))

(assert (=> d!81423 m!517823))

(assert (=> d!81423 m!517979))

(declare-fun m!517983 () Bool)

(assert (=> d!81423 m!517983))

(declare-fun m!517985 () Bool)

(assert (=> d!81423 m!517985))

(declare-fun m!517987 () Bool)

(assert (=> d!81423 m!517987))

(assert (=> b!539277 d!81423))

(check-sat (not b!539411) (not d!81383) (not b!539376) (not b!539490) (not d!81395) (not b!539392) (not b!539391) (not b!539491) (not d!81423) (not bm!31975) (not b!539568) (not b!539493) (not b!539398) (not bm!31972))
(check-sat)
