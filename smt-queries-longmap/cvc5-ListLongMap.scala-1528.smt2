; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28848 () Bool)

(assert start!28848)

(declare-fun b!293903 () Bool)

(declare-fun res!154544 () Bool)

(declare-fun e!185805 () Bool)

(assert (=> b!293903 (=> (not res!154544) (not e!185805))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14879 0))(
  ( (array!14880 (arr!7058 (Array (_ BitVec 32) (_ BitVec 64))) (size!7411 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14879)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!293903 (= res!154544 (and (= (size!7411 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7411 a!3312))))))

(declare-fun e!185806 () Bool)

(declare-fun b!293904 () Bool)

(declare-fun lt!145595 () Bool)

(declare-datatypes ((SeekEntryResult!2206 0))(
  ( (MissingZero!2206 (index!10994 (_ BitVec 32))) (Found!2206 (index!10995 (_ BitVec 32))) (Intermediate!2206 (undefined!3018 Bool) (index!10996 (_ BitVec 32)) (x!29200 (_ BitVec 32))) (Undefined!2206) (MissingVacant!2206 (index!10997 (_ BitVec 32))) )
))
(declare-fun lt!145596 () SeekEntryResult!2206)

(assert (=> b!293904 (= e!185806 (and lt!145595 (let ((bdg!6229 (not (is-Intermediate!2206 lt!145596)))) (and (or bdg!6229 (not (undefined!3018 lt!145596))) (or bdg!6229 (not (= (select (arr!7058 a!3312) (index!10996 lt!145596)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6229) (or (bvslt (index!10996 lt!145596) #b00000000000000000000000000000000) (bvsge (index!10996 lt!145596) (size!7411 a!3312)))))))))

(declare-fun lt!145592 () SeekEntryResult!2206)

(declare-fun lt!145593 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14879 (_ BitVec 32)) SeekEntryResult!2206)

(assert (=> b!293904 (= lt!145592 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145593 k!2524 (array!14880 (store (arr!7058 a!3312) i!1256 k!2524) (size!7411 a!3312)) mask!3809))))

(assert (=> b!293904 (= lt!145596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145593 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293904 (= lt!145593 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!154546 () Bool)

(assert (=> start!28848 (=> (not res!154546) (not e!185805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28848 (= res!154546 (validMask!0 mask!3809))))

(assert (=> start!28848 e!185805))

(assert (=> start!28848 true))

(declare-fun array_inv!5030 (array!14879) Bool)

(assert (=> start!28848 (array_inv!5030 a!3312)))

(declare-fun b!293905 () Bool)

(declare-fun res!154547 () Bool)

(assert (=> b!293905 (=> (not res!154547) (not e!185806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14879 (_ BitVec 32)) Bool)

(assert (=> b!293905 (= res!154547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293906 () Bool)

(declare-fun res!154545 () Bool)

(assert (=> b!293906 (=> (not res!154545) (not e!185805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293906 (= res!154545 (validKeyInArray!0 k!2524))))

(declare-fun b!293907 () Bool)

(declare-fun res!154549 () Bool)

(assert (=> b!293907 (=> (not res!154549) (not e!185805))))

(declare-fun arrayContainsKey!0 (array!14879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293907 (= res!154549 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293908 () Bool)

(assert (=> b!293908 (= e!185805 e!185806)))

(declare-fun res!154548 () Bool)

(assert (=> b!293908 (=> (not res!154548) (not e!185806))))

(declare-fun lt!145594 () SeekEntryResult!2206)

(assert (=> b!293908 (= res!154548 (or lt!145595 (= lt!145594 (MissingVacant!2206 i!1256))))))

(assert (=> b!293908 (= lt!145595 (= lt!145594 (MissingZero!2206 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14879 (_ BitVec 32)) SeekEntryResult!2206)

(assert (=> b!293908 (= lt!145594 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28848 res!154546) b!293903))

(assert (= (and b!293903 res!154544) b!293906))

(assert (= (and b!293906 res!154545) b!293907))

(assert (= (and b!293907 res!154549) b!293908))

(assert (= (and b!293908 res!154548) b!293905))

(assert (= (and b!293905 res!154547) b!293904))

(declare-fun m!307007 () Bool)

(assert (=> b!293905 m!307007))

(declare-fun m!307009 () Bool)

(assert (=> start!28848 m!307009))

(declare-fun m!307011 () Bool)

(assert (=> start!28848 m!307011))

(declare-fun m!307013 () Bool)

(assert (=> b!293904 m!307013))

(declare-fun m!307015 () Bool)

(assert (=> b!293904 m!307015))

(declare-fun m!307017 () Bool)

(assert (=> b!293904 m!307017))

(declare-fun m!307019 () Bool)

(assert (=> b!293904 m!307019))

(declare-fun m!307021 () Bool)

(assert (=> b!293904 m!307021))

(declare-fun m!307023 () Bool)

(assert (=> b!293908 m!307023))

(declare-fun m!307025 () Bool)

(assert (=> b!293906 m!307025))

(declare-fun m!307027 () Bool)

(assert (=> b!293907 m!307027))

(push 1)

(assert (not b!293905))

(assert (not b!293907))

(assert (not b!293908))

(assert (not b!293906))

(assert (not start!28848))

(assert (not b!293904))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66557 () Bool)

(assert (=> d!66557 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28848 d!66557))

(declare-fun d!66563 () Bool)

(assert (=> d!66563 (= (array_inv!5030 a!3312) (bvsge (size!7411 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28848 d!66563))

(declare-fun d!66565 () Bool)

(assert (=> d!66565 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293906 d!66565))

(declare-fun b!294007 () Bool)

(declare-fun c!47283 () Bool)

(declare-fun lt!145643 () (_ BitVec 64))

(assert (=> b!294007 (= c!47283 (= lt!145643 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185869 () SeekEntryResult!2206)

(declare-fun e!185870 () SeekEntryResult!2206)

(assert (=> b!294007 (= e!185869 e!185870)))

(declare-fun d!66569 () Bool)

(declare-fun lt!145642 () SeekEntryResult!2206)

(assert (=> d!66569 (and (or (is-Undefined!2206 lt!145642) (not (is-Found!2206 lt!145642)) (and (bvsge (index!10995 lt!145642) #b00000000000000000000000000000000) (bvslt (index!10995 lt!145642) (size!7411 a!3312)))) (or (is-Undefined!2206 lt!145642) (is-Found!2206 lt!145642) (not (is-MissingZero!2206 lt!145642)) (and (bvsge (index!10994 lt!145642) #b00000000000000000000000000000000) (bvslt (index!10994 lt!145642) (size!7411 a!3312)))) (or (is-Undefined!2206 lt!145642) (is-Found!2206 lt!145642) (is-MissingZero!2206 lt!145642) (not (is-MissingVacant!2206 lt!145642)) (and (bvsge (index!10997 lt!145642) #b00000000000000000000000000000000) (bvslt (index!10997 lt!145642) (size!7411 a!3312)))) (or (is-Undefined!2206 lt!145642) (ite (is-Found!2206 lt!145642) (= (select (arr!7058 a!3312) (index!10995 lt!145642)) k!2524) (ite (is-MissingZero!2206 lt!145642) (= (select (arr!7058 a!3312) (index!10994 lt!145642)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2206 lt!145642) (= (select (arr!7058 a!3312) (index!10997 lt!145642)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!185871 () SeekEntryResult!2206)

(assert (=> d!66569 (= lt!145642 e!185871)))

(declare-fun c!47282 () Bool)

(declare-fun lt!145641 () SeekEntryResult!2206)

(assert (=> d!66569 (= c!47282 (and (is-Intermediate!2206 lt!145641) (undefined!3018 lt!145641)))))

(assert (=> d!66569 (= lt!145641 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66569 (validMask!0 mask!3809)))

(assert (=> d!66569 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!145642)))

(declare-fun b!294008 () Bool)

(assert (=> b!294008 (= e!185871 Undefined!2206)))

(declare-fun b!294009 () Bool)

(assert (=> b!294009 (= e!185870 (MissingZero!2206 (index!10996 lt!145641)))))

(declare-fun b!294010 () Bool)

(assert (=> b!294010 (= e!185869 (Found!2206 (index!10996 lt!145641)))))

(declare-fun b!294011 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14879 (_ BitVec 32)) SeekEntryResult!2206)

(assert (=> b!294011 (= e!185870 (seekKeyOrZeroReturnVacant!0 (x!29200 lt!145641) (index!10996 lt!145641) (index!10996 lt!145641) k!2524 a!3312 mask!3809))))

(declare-fun b!294012 () Bool)

(assert (=> b!294012 (= e!185871 e!185869)))

(assert (=> b!294012 (= lt!145643 (select (arr!7058 a!3312) (index!10996 lt!145641)))))

(declare-fun c!47284 () Bool)

(assert (=> b!294012 (= c!47284 (= lt!145643 k!2524))))

(assert (= (and d!66569 c!47282) b!294008))

(assert (= (and d!66569 (not c!47282)) b!294012))

(assert (= (and b!294012 c!47284) b!294010))

(assert (= (and b!294012 (not c!47284)) b!294007))

(assert (= (and b!294007 c!47283) b!294009))

(assert (= (and b!294007 (not c!47283)) b!294011))

(assert (=> d!66569 m!307009))

(declare-fun m!307073 () Bool)

(assert (=> d!66569 m!307073))

(declare-fun m!307075 () Bool)

(assert (=> d!66569 m!307075))

(assert (=> d!66569 m!307021))

(assert (=> d!66569 m!307021))

(declare-fun m!307077 () Bool)

(assert (=> d!66569 m!307077))

(declare-fun m!307079 () Bool)

(assert (=> d!66569 m!307079))

(declare-fun m!307081 () Bool)

(assert (=> b!294011 m!307081))

(declare-fun m!307083 () Bool)

(assert (=> b!294012 m!307083))

(assert (=> b!293908 d!66569))

(declare-fun d!66583 () Bool)

(declare-fun res!154591 () Bool)

(declare-fun e!185879 () Bool)

(assert (=> d!66583 (=> res!154591 e!185879)))

(assert (=> d!66583 (= res!154591 (= (select (arr!7058 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66583 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!185879)))

(declare-fun b!294021 () Bool)

(declare-fun e!185880 () Bool)

(assert (=> b!294021 (= e!185879 e!185880)))

(declare-fun res!154592 () Bool)

(assert (=> b!294021 (=> (not res!154592) (not e!185880))))

(assert (=> b!294021 (= res!154592 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7411 a!3312)))))

(declare-fun b!294022 () Bool)

(assert (=> b!294022 (= e!185880 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66583 (not res!154591)) b!294021))

(assert (= (and b!294021 res!154592) b!294022))

(declare-fun m!307095 () Bool)

(assert (=> d!66583 m!307095))

(declare-fun m!307097 () Bool)

(assert (=> b!294022 m!307097))

(assert (=> b!293907 d!66583))

(declare-fun b!294095 () Bool)

(declare-fun e!185921 () SeekEntryResult!2206)

(declare-fun e!185924 () SeekEntryResult!2206)

(assert (=> b!294095 (= e!185921 e!185924)))

(declare-fun c!47314 () Bool)

(declare-fun lt!145668 () (_ BitVec 64))

(assert (=> b!294095 (= c!47314 (or (= lt!145668 k!2524) (= (bvadd lt!145668 lt!145668) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294096 () Bool)

(declare-fun lt!145669 () SeekEntryResult!2206)

(assert (=> b!294096 (and (bvsge (index!10996 lt!145669) #b00000000000000000000000000000000) (bvslt (index!10996 lt!145669) (size!7411 (array!14880 (store (arr!7058 a!3312) i!1256 k!2524) (size!7411 a!3312)))))))

(declare-fun e!185920 () Bool)

(assert (=> b!294096 (= e!185920 (= (select (arr!7058 (array!14880 (store (arr!7058 a!3312) i!1256 k!2524) (size!7411 a!3312))) (index!10996 lt!145669)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294097 () Bool)

(assert (=> b!294097 (and (bvsge (index!10996 lt!145669) #b00000000000000000000000000000000) (bvslt (index!10996 lt!145669) (size!7411 (array!14880 (store (arr!7058 a!3312) i!1256 k!2524) (size!7411 a!3312)))))))

(declare-fun res!154613 () Bool)

(assert (=> b!294097 (= res!154613 (= (select (arr!7058 (array!14880 (store (arr!7058 a!3312) i!1256 k!2524) (size!7411 a!3312))) (index!10996 lt!145669)) k!2524))))

(assert (=> b!294097 (=> res!154613 e!185920)))

(declare-fun e!185922 () Bool)

(assert (=> b!294097 (= e!185922 e!185920)))

(declare-fun b!294098 () Bool)

(declare-fun e!185923 () Bool)

(assert (=> b!294098 (= e!185923 e!185922)))

(declare-fun res!154612 () Bool)

(assert (=> b!294098 (= res!154612 (and (is-Intermediate!2206 lt!145669) (not (undefined!3018 lt!145669)) (bvslt (x!29200 lt!145669) #b01111111111111111111111111111110) (bvsge (x!29200 lt!145669) #b00000000000000000000000000000000) (bvsge (x!29200 lt!145669) #b00000000000000000000000000000000)))))

(assert (=> b!294098 (=> (not res!154612) (not e!185922))))

(declare-fun b!294099 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294099 (= e!185924 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145593 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14880 (store (arr!7058 a!3312) i!1256 k!2524) (size!7411 a!3312)) mask!3809))))

(declare-fun b!294100 () Bool)

(assert (=> b!294100 (= e!185924 (Intermediate!2206 false lt!145593 #b00000000000000000000000000000000))))

(declare-fun d!66587 () Bool)

(assert (=> d!66587 e!185923))

(declare-fun c!47313 () Bool)

(assert (=> d!66587 (= c!47313 (and (is-Intermediate!2206 lt!145669) (undefined!3018 lt!145669)))))

(assert (=> d!66587 (= lt!145669 e!185921)))

(declare-fun c!47315 () Bool)

(assert (=> d!66587 (= c!47315 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66587 (= lt!145668 (select (arr!7058 (array!14880 (store (arr!7058 a!3312) i!1256 k!2524) (size!7411 a!3312))) lt!145593))))

(assert (=> d!66587 (validMask!0 mask!3809)))

(assert (=> d!66587 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145593 k!2524 (array!14880 (store (arr!7058 a!3312) i!1256 k!2524) (size!7411 a!3312)) mask!3809) lt!145669)))

(declare-fun b!294101 () Bool)

(assert (=> b!294101 (and (bvsge (index!10996 lt!145669) #b00000000000000000000000000000000) (bvslt (index!10996 lt!145669) (size!7411 (array!14880 (store (arr!7058 a!3312) i!1256 k!2524) (size!7411 a!3312)))))))

(declare-fun res!154614 () Bool)

(assert (=> b!294101 (= res!154614 (= (select (arr!7058 (array!14880 (store (arr!7058 a!3312) i!1256 k!2524) (size!7411 a!3312))) (index!10996 lt!145669)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294101 (=> res!154614 e!185920)))

(declare-fun b!294102 () Bool)

(assert (=> b!294102 (= e!185921 (Intermediate!2206 true lt!145593 #b00000000000000000000000000000000))))

(declare-fun b!294103 () Bool)

(assert (=> b!294103 (= e!185923 (bvsge (x!29200 lt!145669) #b01111111111111111111111111111110))))

(assert (= (and d!66587 c!47315) b!294102))

(assert (= (and d!66587 (not c!47315)) b!294095))

(assert (= (and b!294095 c!47314) b!294100))

(assert (= (and b!294095 (not c!47314)) b!294099))

(assert (= (and d!66587 c!47313) b!294103))

(assert (= (and d!66587 (not c!47313)) b!294098))

(assert (= (and b!294098 res!154612) b!294097))

(assert (= (and b!294097 (not res!154613)) b!294101))

(assert (= (and b!294101 (not res!154614)) b!294096))

(declare-fun m!307125 () Bool)

(assert (=> b!294096 m!307125))

(assert (=> b!294097 m!307125))

(declare-fun m!307127 () Bool)

(assert (=> d!66587 m!307127))

(assert (=> d!66587 m!307009))

(assert (=> b!294101 m!307125))

(declare-fun m!307129 () Bool)

(assert (=> b!294099 m!307129))

(assert (=> b!294099 m!307129))

(declare-fun m!307131 () Bool)

(assert (=> b!294099 m!307131))

(assert (=> b!293904 d!66587))

(declare-fun b!294104 () Bool)

(declare-fun e!185926 () SeekEntryResult!2206)

(declare-fun e!185929 () SeekEntryResult!2206)

(assert (=> b!294104 (= e!185926 e!185929)))

(declare-fun c!47317 () Bool)

(declare-fun lt!145670 () (_ BitVec 64))

(assert (=> b!294104 (= c!47317 (or (= lt!145670 k!2524) (= (bvadd lt!145670 lt!145670) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294105 () Bool)

(declare-fun lt!145671 () SeekEntryResult!2206)

(assert (=> b!294105 (and (bvsge (index!10996 lt!145671) #b00000000000000000000000000000000) (bvslt (index!10996 lt!145671) (size!7411 a!3312)))))

(declare-fun e!185925 () Bool)

(assert (=> b!294105 (= e!185925 (= (select (arr!7058 a!3312) (index!10996 lt!145671)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294106 () Bool)

(assert (=> b!294106 (and (bvsge (index!10996 lt!145671) #b00000000000000000000000000000000) (bvslt (index!10996 lt!145671) (size!7411 a!3312)))))

(declare-fun res!154616 () Bool)

(assert (=> b!294106 (= res!154616 (= (select (arr!7058 a!3312) (index!10996 lt!145671)) k!2524))))

(assert (=> b!294106 (=> res!154616 e!185925)))

(declare-fun e!185927 () Bool)

(assert (=> b!294106 (= e!185927 e!185925)))

(declare-fun b!294107 () Bool)

(declare-fun e!185928 () Bool)

(assert (=> b!294107 (= e!185928 e!185927)))

(declare-fun res!154615 () Bool)

(assert (=> b!294107 (= res!154615 (and (is-Intermediate!2206 lt!145671) (not (undefined!3018 lt!145671)) (bvslt (x!29200 lt!145671) #b01111111111111111111111111111110) (bvsge (x!29200 lt!145671) #b00000000000000000000000000000000) (bvsge (x!29200 lt!145671) #b00000000000000000000000000000000)))))

(assert (=> b!294107 (=> (not res!154615) (not e!185927))))

(declare-fun b!294108 () Bool)

(assert (=> b!294108 (= e!185929 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145593 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!294109 () Bool)

(assert (=> b!294109 (= e!185929 (Intermediate!2206 false lt!145593 #b00000000000000000000000000000000))))

(declare-fun d!66593 () Bool)

(assert (=> d!66593 e!185928))

(declare-fun c!47316 () Bool)

(assert (=> d!66593 (= c!47316 (and (is-Intermediate!2206 lt!145671) (undefined!3018 lt!145671)))))

(assert (=> d!66593 (= lt!145671 e!185926)))

(declare-fun c!47318 () Bool)

(assert (=> d!66593 (= c!47318 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66593 (= lt!145670 (select (arr!7058 a!3312) lt!145593))))

(assert (=> d!66593 (validMask!0 mask!3809)))

(assert (=> d!66593 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145593 k!2524 a!3312 mask!3809) lt!145671)))

(declare-fun b!294110 () Bool)

(assert (=> b!294110 (and (bvsge (index!10996 lt!145671) #b00000000000000000000000000000000) (bvslt (index!10996 lt!145671) (size!7411 a!3312)))))

(declare-fun res!154617 () Bool)

(assert (=> b!294110 (= res!154617 (= (select (arr!7058 a!3312) (index!10996 lt!145671)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294110 (=> res!154617 e!185925)))

(declare-fun b!294111 () Bool)

(assert (=> b!294111 (= e!185926 (Intermediate!2206 true lt!145593 #b00000000000000000000000000000000))))

(declare-fun b!294112 () Bool)

(assert (=> b!294112 (= e!185928 (bvsge (x!29200 lt!145671) #b01111111111111111111111111111110))))

(assert (= (and d!66593 c!47318) b!294111))

(assert (= (and d!66593 (not c!47318)) b!294104))

(assert (= (and b!294104 c!47317) b!294109))

(assert (= (and b!294104 (not c!47317)) b!294108))

(assert (= (and d!66593 c!47316) b!294112))

(assert (= (and d!66593 (not c!47316)) b!294107))

(assert (= (and b!294107 res!154615) b!294106))

(assert (= (and b!294106 (not res!154616)) b!294110))

(assert (= (and b!294110 (not res!154617)) b!294105))

(declare-fun m!307133 () Bool)

(assert (=> b!294105 m!307133))

(assert (=> b!294106 m!307133))

(declare-fun m!307135 () Bool)

(assert (=> d!66593 m!307135))

(assert (=> d!66593 m!307009))

(assert (=> b!294110 m!307133))

(assert (=> b!294108 m!307129))

(assert (=> b!294108 m!307129))

(declare-fun m!307137 () Bool)

(assert (=> b!294108 m!307137))

(assert (=> b!293904 d!66593))

(declare-fun d!66595 () Bool)

(declare-fun lt!145683 () (_ BitVec 32))

(declare-fun lt!145682 () (_ BitVec 32))

(assert (=> d!66595 (= lt!145683 (bvmul (bvxor lt!145682 (bvlshr lt!145682 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66595 (= lt!145682 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66595 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154618 (let ((h!5247 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29206 (bvmul (bvxor h!5247 (bvlshr h!5247 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29206 (bvlshr x!29206 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154618 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154618 #b00000000000000000000000000000000))))))

(assert (=> d!66595 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!145683 (bvlshr lt!145683 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!293904 d!66595))

(declare-fun b!294121 () Bool)

(declare-fun e!185937 () Bool)

(declare-fun call!25673 () Bool)

(assert (=> b!294121 (= e!185937 call!25673)))

(declare-fun b!294122 () Bool)

(declare-fun e!185936 () Bool)

(assert (=> b!294122 (= e!185936 e!185937)))

(declare-fun lt!145692 () (_ BitVec 64))

(assert (=> b!294122 (= lt!145692 (select (arr!7058 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9152 0))(
  ( (Unit!9153) )
))
(declare-fun lt!145691 () Unit!9152)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14879 (_ BitVec 64) (_ BitVec 32)) Unit!9152)

(assert (=> b!294122 (= lt!145691 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145692 #b00000000000000000000000000000000))))

(assert (=> b!294122 (arrayContainsKey!0 a!3312 lt!145692 #b00000000000000000000000000000000)))

(declare-fun lt!145690 () Unit!9152)

(assert (=> b!294122 (= lt!145690 lt!145691)))

(declare-fun res!154624 () Bool)

(assert (=> b!294122 (= res!154624 (= (seekEntryOrOpen!0 (select (arr!7058 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2206 #b00000000000000000000000000000000)))))

(assert (=> b!294122 (=> (not res!154624) (not e!185937))))

(declare-fun bm!25670 () Bool)

(assert (=> bm!25670 (= call!25673 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!66597 () Bool)

(declare-fun res!154623 () Bool)

(declare-fun e!185938 () Bool)

(assert (=> d!66597 (=> res!154623 e!185938)))

(assert (=> d!66597 (= res!154623 (bvsge #b00000000000000000000000000000000 (size!7411 a!3312)))))

(assert (=> d!66597 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!185938)))

(declare-fun b!294123 () Bool)

(assert (=> b!294123 (= e!185938 e!185936)))

(declare-fun c!47321 () Bool)

(assert (=> b!294123 (= c!47321 (validKeyInArray!0 (select (arr!7058 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!294124 () Bool)

(assert (=> b!294124 (= e!185936 call!25673)))

(assert (= (and d!66597 (not res!154623)) b!294123))

(assert (= (and b!294123 c!47321) b!294122))

(assert (= (and b!294123 (not c!47321)) b!294124))

(assert (= (and b!294122 res!154624) b!294121))

(assert (= (or b!294121 b!294124) bm!25670))

(assert (=> b!294122 m!307095))

(declare-fun m!307139 () Bool)

(assert (=> b!294122 m!307139))

(declare-fun m!307141 () Bool)

(assert (=> b!294122 m!307141))

(assert (=> b!294122 m!307095))

(declare-fun m!307143 () Bool)

(assert (=> b!294122 m!307143))

(declare-fun m!307145 () Bool)

(assert (=> bm!25670 m!307145))

(assert (=> b!294123 m!307095))

(assert (=> b!294123 m!307095))

(declare-fun m!307147 () Bool)

(assert (=> b!294123 m!307147))

(assert (=> b!293905 d!66597))

(push 1)

(assert (not d!66569))

(assert (not d!66587))

(assert (not b!294122))

(assert (not b!294123))

(assert (not b!294022))

(assert (not b!294099))

(assert (not d!66593))

(assert (not bm!25670))

(assert (not b!294108))

(assert (not b!294011))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

