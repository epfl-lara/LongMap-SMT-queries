; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28784 () Bool)

(assert start!28784)

(declare-fun b!293768 () Bool)

(declare-fun res!154518 () Bool)

(declare-fun e!185738 () Bool)

(assert (=> b!293768 (=> (not res!154518) (not e!185738))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14878 0))(
  ( (array!14879 (arr!7059 (Array (_ BitVec 32) (_ BitVec 64))) (size!7411 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14878)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!293768 (= res!154518 (and (= (size!7411 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7411 a!3312))))))

(declare-fun b!293770 () Bool)

(declare-fun res!154519 () Bool)

(declare-fun e!185736 () Bool)

(assert (=> b!293770 (=> (not res!154519) (not e!185736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14878 (_ BitVec 32)) Bool)

(assert (=> b!293770 (= res!154519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!293771 () Bool)

(declare-fun lt!145671 () Bool)

(declare-datatypes ((SeekEntryResult!2173 0))(
  ( (MissingZero!2173 (index!10862 (_ BitVec 32))) (Found!2173 (index!10863 (_ BitVec 32))) (Intermediate!2173 (undefined!2985 Bool) (index!10864 (_ BitVec 32)) (x!29152 (_ BitVec 32))) (Undefined!2173) (MissingVacant!2173 (index!10865 (_ BitVec 32))) )
))
(declare-fun lt!145667 () SeekEntryResult!2173)

(assert (=> b!293771 (= e!185736 (and lt!145671 (let ((bdg!6223 (not (is-Intermediate!2173 lt!145667)))) (and (or bdg!6223 (not (undefined!2985 lt!145667))) (not bdg!6223) (= (select (arr!7059 a!3312) (index!10864 lt!145667)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!145670 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun lt!145669 () SeekEntryResult!2173)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14878 (_ BitVec 32)) SeekEntryResult!2173)

(assert (=> b!293771 (= lt!145669 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145670 k!2524 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312)) mask!3809))))

(assert (=> b!293771 (= lt!145667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145670 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293771 (= lt!145670 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!293772 () Bool)

(declare-fun res!154520 () Bool)

(assert (=> b!293772 (=> (not res!154520) (not e!185738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293772 (= res!154520 (validKeyInArray!0 k!2524))))

(declare-fun b!293773 () Bool)

(assert (=> b!293773 (= e!185738 e!185736)))

(declare-fun res!154521 () Bool)

(assert (=> b!293773 (=> (not res!154521) (not e!185736))))

(declare-fun lt!145668 () SeekEntryResult!2173)

(assert (=> b!293773 (= res!154521 (or lt!145671 (= lt!145668 (MissingVacant!2173 i!1256))))))

(assert (=> b!293773 (= lt!145671 (= lt!145668 (MissingZero!2173 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14878 (_ BitVec 32)) SeekEntryResult!2173)

(assert (=> b!293773 (= lt!145668 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!154517 () Bool)

(assert (=> start!28784 (=> (not res!154517) (not e!185738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28784 (= res!154517 (validMask!0 mask!3809))))

(assert (=> start!28784 e!185738))

(assert (=> start!28784 true))

(declare-fun array_inv!5009 (array!14878) Bool)

(assert (=> start!28784 (array_inv!5009 a!3312)))

(declare-fun b!293769 () Bool)

(declare-fun res!154516 () Bool)

(assert (=> b!293769 (=> (not res!154516) (not e!185738))))

(declare-fun arrayContainsKey!0 (array!14878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293769 (= res!154516 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28784 res!154517) b!293768))

(assert (= (and b!293768 res!154518) b!293772))

(assert (= (and b!293772 res!154520) b!293769))

(assert (= (and b!293769 res!154516) b!293773))

(assert (= (and b!293773 res!154521) b!293770))

(assert (= (and b!293770 res!154519) b!293771))

(declare-fun m!307555 () Bool)

(assert (=> b!293770 m!307555))

(declare-fun m!307557 () Bool)

(assert (=> b!293771 m!307557))

(declare-fun m!307559 () Bool)

(assert (=> b!293771 m!307559))

(declare-fun m!307561 () Bool)

(assert (=> b!293771 m!307561))

(declare-fun m!307563 () Bool)

(assert (=> b!293771 m!307563))

(declare-fun m!307565 () Bool)

(assert (=> b!293771 m!307565))

(declare-fun m!307567 () Bool)

(assert (=> start!28784 m!307567))

(declare-fun m!307569 () Bool)

(assert (=> start!28784 m!307569))

(declare-fun m!307571 () Bool)

(assert (=> b!293769 m!307571))

(declare-fun m!307573 () Bool)

(assert (=> b!293772 m!307573))

(declare-fun m!307575 () Bool)

(assert (=> b!293773 m!307575))

(push 1)

(assert (not start!28784))

(assert (not b!293770))

(assert (not b!293772))

(assert (not b!293769))

(assert (not b!293771))

(assert (not b!293773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!145699 () SeekEntryResult!2173)

(declare-fun b!293840 () Bool)

(assert (=> b!293840 (and (bvsge (index!10864 lt!145699) #b00000000000000000000000000000000) (bvslt (index!10864 lt!145699) (size!7411 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312)))))))

(declare-fun res!154548 () Bool)

(assert (=> b!293840 (= res!154548 (= (select (arr!7059 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312))) (index!10864 lt!145699)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185778 () Bool)

(assert (=> b!293840 (=> res!154548 e!185778)))

(declare-fun b!293841 () Bool)

(declare-fun e!185779 () Bool)

(assert (=> b!293841 (= e!185779 (bvsge (x!29152 lt!145699) #b01111111111111111111111111111110))))

(declare-fun b!293842 () Bool)

(assert (=> b!293842 (and (bvsge (index!10864 lt!145699) #b00000000000000000000000000000000) (bvslt (index!10864 lt!145699) (size!7411 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312)))))))

(assert (=> b!293842 (= e!185778 (= (select (arr!7059 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312))) (index!10864 lt!145699)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293843 () Bool)

(declare-fun e!185782 () SeekEntryResult!2173)

(assert (=> b!293843 (= e!185782 (Intermediate!2173 true lt!145670 #b00000000000000000000000000000000))))

(declare-fun b!293844 () Bool)

(declare-fun e!185781 () SeekEntryResult!2173)

(assert (=> b!293844 (= e!185781 (Intermediate!2173 false lt!145670 #b00000000000000000000000000000000))))

(declare-fun b!293845 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293845 (= e!185781 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k!2524 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312)) mask!3809))))

(declare-fun b!293846 () Bool)

(assert (=> b!293846 (= e!185782 e!185781)))

(declare-fun c!47218 () Bool)

(declare-fun lt!145700 () (_ BitVec 64))

(assert (=> b!293846 (= c!47218 (or (= lt!145700 k!2524) (= (bvadd lt!145700 lt!145700) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293847 () Bool)

(assert (=> b!293847 (and (bvsge (index!10864 lt!145699) #b00000000000000000000000000000000) (bvslt (index!10864 lt!145699) (size!7411 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312)))))))

(declare-fun res!154549 () Bool)

(assert (=> b!293847 (= res!154549 (= (select (arr!7059 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312))) (index!10864 lt!145699)) k!2524))))

(assert (=> b!293847 (=> res!154549 e!185778)))

(declare-fun e!185780 () Bool)

(assert (=> b!293847 (= e!185780 e!185778)))

(declare-fun b!293848 () Bool)

(assert (=> b!293848 (= e!185779 e!185780)))

(declare-fun res!154547 () Bool)

(assert (=> b!293848 (= res!154547 (and (is-Intermediate!2173 lt!145699) (not (undefined!2985 lt!145699)) (bvslt (x!29152 lt!145699) #b01111111111111111111111111111110) (bvsge (x!29152 lt!145699) #b00000000000000000000000000000000) (bvsge (x!29152 lt!145699) #b00000000000000000000000000000000)))))

(assert (=> b!293848 (=> (not res!154547) (not e!185780))))

(declare-fun d!66691 () Bool)

(assert (=> d!66691 e!185779))

(declare-fun c!47216 () Bool)

(assert (=> d!66691 (= c!47216 (and (is-Intermediate!2173 lt!145699) (undefined!2985 lt!145699)))))

(assert (=> d!66691 (= lt!145699 e!185782)))

(declare-fun c!47217 () Bool)

(assert (=> d!66691 (= c!47217 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66691 (= lt!145700 (select (arr!7059 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312))) lt!145670))))

(assert (=> d!66691 (validMask!0 mask!3809)))

(assert (=> d!66691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145670 k!2524 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312)) mask!3809) lt!145699)))

(assert (= (and d!66691 c!47217) b!293843))

(assert (= (and d!66691 (not c!47217)) b!293846))

(assert (= (and b!293846 c!47218) b!293844))

(assert (= (and b!293846 (not c!47218)) b!293845))

(assert (= (and d!66691 c!47216) b!293841))

(assert (= (and d!66691 (not c!47216)) b!293848))

(assert (= (and b!293848 res!154547) b!293847))

(assert (= (and b!293847 (not res!154549)) b!293840))

(assert (= (and b!293840 (not res!154548)) b!293842))

(declare-fun m!307603 () Bool)

(assert (=> b!293842 m!307603))

(assert (=> b!293840 m!307603))

(assert (=> b!293847 m!307603))

(declare-fun m!307605 () Bool)

(assert (=> b!293845 m!307605))

(assert (=> b!293845 m!307605))

(declare-fun m!307607 () Bool)

(assert (=> b!293845 m!307607))

(declare-fun m!307609 () Bool)

(assert (=> d!66691 m!307609))

(assert (=> d!66691 m!307567))

(assert (=> b!293771 d!66691))

(declare-fun b!293849 () Bool)

(declare-fun lt!145701 () SeekEntryResult!2173)

(assert (=> b!293849 (and (bvsge (index!10864 lt!145701) #b00000000000000000000000000000000) (bvslt (index!10864 lt!145701) (size!7411 a!3312)))))

(declare-fun res!154551 () Bool)

(assert (=> b!293849 (= res!154551 (= (select (arr!7059 a!3312) (index!10864 lt!145701)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185783 () Bool)

(assert (=> b!293849 (=> res!154551 e!185783)))

(declare-fun b!293850 () Bool)

(declare-fun e!185784 () Bool)

(assert (=> b!293850 (= e!185784 (bvsge (x!29152 lt!145701) #b01111111111111111111111111111110))))

(declare-fun b!293851 () Bool)

(assert (=> b!293851 (and (bvsge (index!10864 lt!145701) #b00000000000000000000000000000000) (bvslt (index!10864 lt!145701) (size!7411 a!3312)))))

(assert (=> b!293851 (= e!185783 (= (select (arr!7059 a!3312) (index!10864 lt!145701)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293852 () Bool)

(declare-fun e!185787 () SeekEntryResult!2173)

(assert (=> b!293852 (= e!185787 (Intermediate!2173 true lt!145670 #b00000000000000000000000000000000))))

(declare-fun b!293853 () Bool)

(declare-fun e!185786 () SeekEntryResult!2173)

(assert (=> b!293853 (= e!185786 (Intermediate!2173 false lt!145670 #b00000000000000000000000000000000))))

(declare-fun b!293854 () Bool)

(assert (=> b!293854 (= e!185786 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!293855 () Bool)

(assert (=> b!293855 (= e!185787 e!185786)))

(declare-fun c!47221 () Bool)

(declare-fun lt!145702 () (_ BitVec 64))

(assert (=> b!293855 (= c!47221 (or (= lt!145702 k!2524) (= (bvadd lt!145702 lt!145702) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293856 () Bool)

(assert (=> b!293856 (and (bvsge (index!10864 lt!145701) #b00000000000000000000000000000000) (bvslt (index!10864 lt!145701) (size!7411 a!3312)))))

(declare-fun res!154552 () Bool)

(assert (=> b!293856 (= res!154552 (= (select (arr!7059 a!3312) (index!10864 lt!145701)) k!2524))))

(assert (=> b!293856 (=> res!154552 e!185783)))

(declare-fun e!185785 () Bool)

(assert (=> b!293856 (= e!185785 e!185783)))

(declare-fun b!293857 () Bool)

(assert (=> b!293857 (= e!185784 e!185785)))

(declare-fun res!154550 () Bool)

(assert (=> b!293857 (= res!154550 (and (is-Intermediate!2173 lt!145701) (not (undefined!2985 lt!145701)) (bvslt (x!29152 lt!145701) #b01111111111111111111111111111110) (bvsge (x!29152 lt!145701) #b00000000000000000000000000000000) (bvsge (x!29152 lt!145701) #b00000000000000000000000000000000)))))

(assert (=> b!293857 (=> (not res!154550) (not e!185785))))

(declare-fun d!66703 () Bool)

(assert (=> d!66703 e!185784))

(declare-fun c!47219 () Bool)

(assert (=> d!66703 (= c!47219 (and (is-Intermediate!2173 lt!145701) (undefined!2985 lt!145701)))))

(assert (=> d!66703 (= lt!145701 e!185787)))

(declare-fun c!47220 () Bool)

(assert (=> d!66703 (= c!47220 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66703 (= lt!145702 (select (arr!7059 a!3312) lt!145670))))

(assert (=> d!66703 (validMask!0 mask!3809)))

(assert (=> d!66703 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145670 k!2524 a!3312 mask!3809) lt!145701)))

(assert (= (and d!66703 c!47220) b!293852))

(assert (= (and d!66703 (not c!47220)) b!293855))

(assert (= (and b!293855 c!47221) b!293853))

(assert (= (and b!293855 (not c!47221)) b!293854))

(assert (= (and d!66703 c!47219) b!293850))

(assert (= (and d!66703 (not c!47219)) b!293857))

(assert (= (and b!293857 res!154550) b!293856))

(assert (= (and b!293856 (not res!154552)) b!293849))

(assert (= (and b!293849 (not res!154551)) b!293851))

(declare-fun m!307611 () Bool)

(assert (=> b!293851 m!307611))

(assert (=> b!293849 m!307611))

(assert (=> b!293856 m!307611))

(assert (=> b!293854 m!307605))

(assert (=> b!293854 m!307605))

(declare-fun m!307613 () Bool)

(assert (=> b!293854 m!307613))

(declare-fun m!307615 () Bool)

(assert (=> d!66703 m!307615))

(assert (=> d!66703 m!307567))

(assert (=> b!293771 d!66703))

(declare-fun d!66705 () Bool)

(declare-fun lt!145718 () (_ BitVec 32))

(declare-fun lt!145717 () (_ BitVec 32))

(assert (=> d!66705 (= lt!145718 (bvmul (bvxor lt!145717 (bvlshr lt!145717 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66705 (= lt!145717 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66705 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154553 (let ((h!5187 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29156 (bvmul (bvxor h!5187 (bvlshr h!5187 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29156 (bvlshr x!29156 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154553 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154553 #b00000000000000000000000000000000))))))

(assert (=> d!66705 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!145718 (bvlshr lt!145718 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!293771 d!66705))

(declare-fun d!66707 () Bool)

(assert (=> d!66707 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293772 d!66707))

(declare-fun d!66709 () Bool)

(assert (=> d!66709 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28784 d!66709))

(declare-fun d!66717 () Bool)

(assert (=> d!66717 (= (array_inv!5009 a!3312) (bvsge (size!7411 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28784 d!66717))

(declare-fun d!66719 () Bool)

(declare-fun lt!145749 () SeekEntryResult!2173)

(assert (=> d!66719 (and (or (is-Undefined!2173 lt!145749) (not (is-Found!2173 lt!145749)) (and (bvsge (index!10863 lt!145749) #b00000000000000000000000000000000) (bvslt (index!10863 lt!145749) (size!7411 a!3312)))) (or (is-Undefined!2173 lt!145749) (is-Found!2173 lt!145749) (not (is-MissingZero!2173 lt!145749)) (and (bvsge (index!10862 lt!145749) #b00000000000000000000000000000000) (bvslt (index!10862 lt!145749) (size!7411 a!3312)))) (or (is-Undefined!2173 lt!145749) (is-Found!2173 lt!145749) (is-MissingZero!2173 lt!145749) (not (is-MissingVacant!2173 lt!145749)) (and (bvsge (index!10865 lt!145749) #b00000000000000000000000000000000) (bvslt (index!10865 lt!145749) (size!7411 a!3312)))) (or (is-Undefined!2173 lt!145749) (ite (is-Found!2173 lt!145749) (= (select (arr!7059 a!3312) (index!10863 lt!145749)) k!2524) (ite (is-MissingZero!2173 lt!145749) (= (select (arr!7059 a!3312) (index!10862 lt!145749)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2173 lt!145749) (= (select (arr!7059 a!3312) (index!10865 lt!145749)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!185839 () SeekEntryResult!2173)

(assert (=> d!66719 (= lt!145749 e!185839)))

(declare-fun c!47253 () Bool)

(declare-fun lt!145748 () SeekEntryResult!2173)

(assert (=> d!66719 (= c!47253 (and (is-Intermediate!2173 lt!145748) (undefined!2985 lt!145748)))))

(assert (=> d!66719 (= lt!145748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66719 (validMask!0 mask!3809)))

(assert (=> d!66719 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!145749)))

(declare-fun b!293942 () Bool)

(assert (=> b!293942 (= e!185839 Undefined!2173)))

(declare-fun e!185840 () SeekEntryResult!2173)

(declare-fun b!293943 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14878 (_ BitVec 32)) SeekEntryResult!2173)

(assert (=> b!293943 (= e!185840 (seekKeyOrZeroReturnVacant!0 (x!29152 lt!145748) (index!10864 lt!145748) (index!10864 lt!145748) k!2524 a!3312 mask!3809))))

(declare-fun b!293944 () Bool)

(declare-fun e!185838 () SeekEntryResult!2173)

(assert (=> b!293944 (= e!185838 (Found!2173 (index!10864 lt!145748)))))

(declare-fun b!293945 () Bool)

(assert (=> b!293945 (= e!185839 e!185838)))

(declare-fun lt!145747 () (_ BitVec 64))

(assert (=> b!293945 (= lt!145747 (select (arr!7059 a!3312) (index!10864 lt!145748)))))

(declare-fun c!47252 () Bool)

(assert (=> b!293945 (= c!47252 (= lt!145747 k!2524))))

(declare-fun b!293946 () Bool)

(assert (=> b!293946 (= e!185840 (MissingZero!2173 (index!10864 lt!145748)))))

(declare-fun b!293947 () Bool)

(declare-fun c!47254 () Bool)

(assert (=> b!293947 (= c!47254 (= lt!145747 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293947 (= e!185838 e!185840)))

(assert (= (and d!66719 c!47253) b!293942))

(assert (= (and d!66719 (not c!47253)) b!293945))

(assert (= (and b!293945 c!47252) b!293944))

(assert (= (and b!293945 (not c!47252)) b!293947))

(assert (= (and b!293947 c!47254) b!293946))

(assert (= (and b!293947 (not c!47254)) b!293943))

(assert (=> d!66719 m!307561))

(assert (=> d!66719 m!307561))

(declare-fun m!307657 () Bool)

(assert (=> d!66719 m!307657))

(declare-fun m!307659 () Bool)

(assert (=> d!66719 m!307659))

(assert (=> d!66719 m!307567))

(declare-fun m!307661 () Bool)

(assert (=> d!66719 m!307661))

(declare-fun m!307663 () Bool)

(assert (=> d!66719 m!307663))

(declare-fun m!307665 () Bool)

(assert (=> b!293943 m!307665))

(declare-fun m!307667 () Bool)

(assert (=> b!293945 m!307667))

(assert (=> b!293773 d!66719))

(declare-fun b!293968 () Bool)

(declare-fun e!185853 () Bool)

(declare-fun call!25675 () Bool)

(assert (=> b!293968 (= e!185853 call!25675)))

(declare-fun b!293969 () Bool)

(declare-fun e!185854 () Bool)

(assert (=> b!293969 (= e!185854 e!185853)))

(declare-fun lt!145762 () (_ BitVec 64))

(assert (=> b!293969 (= lt!145762 (select (arr!7059 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9164 0))(
  ( (Unit!9165) )
))
(declare-fun lt!145764 () Unit!9164)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14878 (_ BitVec 64) (_ BitVec 32)) Unit!9164)

(assert (=> b!293969 (= lt!145764 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145762 #b00000000000000000000000000000000))))

(assert (=> b!293969 (arrayContainsKey!0 a!3312 lt!145762 #b00000000000000000000000000000000)))

(declare-fun lt!145763 () Unit!9164)

(assert (=> b!293969 (= lt!145763 lt!145764)))

(declare-fun res!154584 () Bool)

(assert (=> b!293969 (= res!154584 (= (seekEntryOrOpen!0 (select (arr!7059 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2173 #b00000000000000000000000000000000)))))

(assert (=> b!293969 (=> (not res!154584) (not e!185853))))

(declare-fun b!293970 () Bool)

(assert (=> b!293970 (= e!185854 call!25675)))

(declare-fun d!66733 () Bool)

(declare-fun res!154583 () Bool)

(declare-fun e!185855 () Bool)

(assert (=> d!66733 (=> res!154583 e!185855)))

(assert (=> d!66733 (= res!154583 (bvsge #b00000000000000000000000000000000 (size!7411 a!3312)))))

(assert (=> d!66733 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!185855)))

(declare-fun bm!25672 () Bool)

(assert (=> bm!25672 (= call!25675 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!293971 () Bool)

(assert (=> b!293971 (= e!185855 e!185854)))

(declare-fun c!47263 () Bool)

(assert (=> b!293971 (= c!47263 (validKeyInArray!0 (select (arr!7059 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!66733 (not res!154583)) b!293971))

(assert (= (and b!293971 c!47263) b!293969))

(assert (= (and b!293971 (not c!47263)) b!293970))

(assert (= (and b!293969 res!154584) b!293968))

(assert (= (or b!293968 b!293970) bm!25672))

(declare-fun m!307669 () Bool)

(assert (=> b!293969 m!307669))

(declare-fun m!307671 () Bool)

(assert (=> b!293969 m!307671))

(declare-fun m!307673 () Bool)

(assert (=> b!293969 m!307673))

(assert (=> b!293969 m!307669))

(declare-fun m!307675 () Bool)

(assert (=> b!293969 m!307675))

(declare-fun m!307677 () Bool)

(assert (=> bm!25672 m!307677))

(assert (=> b!293971 m!307669))

(assert (=> b!293971 m!307669))

(declare-fun m!307679 () Bool)

(assert (=> b!293971 m!307679))

(assert (=> b!293770 d!66733))

(declare-fun d!66735 () Bool)

(declare-fun res!154589 () Bool)

(declare-fun e!185863 () Bool)

(assert (=> d!66735 (=> res!154589 e!185863)))

(assert (=> d!66735 (= res!154589 (= (select (arr!7059 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66735 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!185863)))

(declare-fun b!293982 () Bool)

(declare-fun e!185864 () Bool)

(assert (=> b!293982 (= e!185863 e!185864)))

(declare-fun res!154590 () Bool)

(assert (=> b!293982 (=> (not res!154590) (not e!185864))))

(assert (=> b!293982 (= res!154590 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7411 a!3312)))))

(declare-fun b!293983 () Bool)

(assert (=> b!293983 (= e!185864 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66735 (not res!154589)) b!293982))

(assert (= (and b!293982 res!154590) b!293983))

(assert (=> d!66735 m!307669))

(declare-fun m!307693 () Bool)

(assert (=> b!293983 m!307693))

(assert (=> b!293769 d!66735))

(push 1)

(assert (not b!293943))

(assert (not b!293854))

(assert (not b!293845))

(assert (not b!293983))

(assert (not bm!25672))

(assert (not b!293971))

(assert (not b!293969))

(assert (not d!66691))

(assert (not d!66703))

(assert (not d!66719))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66739 () Bool)

(assert (=> d!66739 (arrayContainsKey!0 a!3312 lt!145762 #b00000000000000000000000000000000)))

(declare-fun lt!145770 () Unit!9164)

(declare-fun choose!13 (array!14878 (_ BitVec 64) (_ BitVec 32)) Unit!9164)

(assert (=> d!66739 (= lt!145770 (choose!13 a!3312 lt!145762 #b00000000000000000000000000000000))))

(assert (=> d!66739 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!66739 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145762 #b00000000000000000000000000000000) lt!145770)))

(declare-fun bs!10462 () Bool)

(assert (= bs!10462 d!66739))

(assert (=> bs!10462 m!307673))

(declare-fun m!307697 () Bool)

(assert (=> bs!10462 m!307697))

(assert (=> b!293969 d!66739))

(declare-fun d!66741 () Bool)

(declare-fun res!154597 () Bool)

(declare-fun e!185871 () Bool)

(assert (=> d!66741 (=> res!154597 e!185871)))

(assert (=> d!66741 (= res!154597 (= (select (arr!7059 a!3312) #b00000000000000000000000000000000) lt!145762))))

(assert (=> d!66741 (= (arrayContainsKey!0 a!3312 lt!145762 #b00000000000000000000000000000000) e!185871)))

(declare-fun b!293990 () Bool)

(declare-fun e!185872 () Bool)

(assert (=> b!293990 (= e!185871 e!185872)))

(declare-fun res!154598 () Bool)

(assert (=> b!293990 (=> (not res!154598) (not e!185872))))

(assert (=> b!293990 (= res!154598 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7411 a!3312)))))

(declare-fun b!293991 () Bool)

(assert (=> b!293991 (= e!185872 (arrayContainsKey!0 a!3312 lt!145762 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66741 (not res!154597)) b!293990))

(assert (= (and b!293990 res!154598) b!293991))

(assert (=> d!66741 m!307669))

(declare-fun m!307699 () Bool)

(assert (=> b!293991 m!307699))

(assert (=> b!293969 d!66741))

(declare-fun d!66743 () Bool)

(declare-fun lt!145773 () SeekEntryResult!2173)

(assert (=> d!66743 (and (or (is-Undefined!2173 lt!145773) (not (is-Found!2173 lt!145773)) (and (bvsge (index!10863 lt!145773) #b00000000000000000000000000000000) (bvslt (index!10863 lt!145773) (size!7411 a!3312)))) (or (is-Undefined!2173 lt!145773) (is-Found!2173 lt!145773) (not (is-MissingZero!2173 lt!145773)) (and (bvsge (index!10862 lt!145773) #b00000000000000000000000000000000) (bvslt (index!10862 lt!145773) (size!7411 a!3312)))) (or (is-Undefined!2173 lt!145773) (is-Found!2173 lt!145773) (is-MissingZero!2173 lt!145773) (not (is-MissingVacant!2173 lt!145773)) (and (bvsge (index!10865 lt!145773) #b00000000000000000000000000000000) (bvslt (index!10865 lt!145773) (size!7411 a!3312)))) (or (is-Undefined!2173 lt!145773) (ite (is-Found!2173 lt!145773) (= (select (arr!7059 a!3312) (index!10863 lt!145773)) (select (arr!7059 a!3312) #b00000000000000000000000000000000)) (ite (is-MissingZero!2173 lt!145773) (= (select (arr!7059 a!3312) (index!10862 lt!145773)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2173 lt!145773) (= (select (arr!7059 a!3312) (index!10865 lt!145773)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!185874 () SeekEntryResult!2173)

(assert (=> d!66743 (= lt!145773 e!185874)))

(declare-fun c!47268 () Bool)

(declare-fun lt!145772 () SeekEntryResult!2173)

(assert (=> d!66743 (= c!47268 (and (is-Intermediate!2173 lt!145772) (undefined!2985 lt!145772)))))

(assert (=> d!66743 (= lt!145772 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!7059 a!3312) #b00000000000000000000000000000000) mask!3809) (select (arr!7059 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809))))

(assert (=> d!66743 (validMask!0 mask!3809)))

(assert (=> d!66743 (= (seekEntryOrOpen!0 (select (arr!7059 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) lt!145773)))

(declare-fun b!293992 () Bool)

(assert (=> b!293992 (= e!185874 Undefined!2173)))

(declare-fun b!293993 () Bool)

(declare-fun e!185875 () SeekEntryResult!2173)

(assert (=> b!293993 (= e!185875 (seekKeyOrZeroReturnVacant!0 (x!29152 lt!145772) (index!10864 lt!145772) (index!10864 lt!145772) (select (arr!7059 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809))))

(declare-fun b!293994 () Bool)

(declare-fun e!185873 () SeekEntryResult!2173)

(assert (=> b!293994 (= e!185873 (Found!2173 (index!10864 lt!145772)))))

(declare-fun b!293995 () Bool)

(assert (=> b!293995 (= e!185874 e!185873)))

(declare-fun lt!145771 () (_ BitVec 64))

(assert (=> b!293995 (= lt!145771 (select (arr!7059 a!3312) (index!10864 lt!145772)))))

(declare-fun c!47267 () Bool)

(assert (=> b!293995 (= c!47267 (= lt!145771 (select (arr!7059 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!293996 () Bool)

(assert (=> b!293996 (= e!185875 (MissingZero!2173 (index!10864 lt!145772)))))

(declare-fun b!293997 () Bool)

(declare-fun c!47269 () Bool)

(assert (=> b!293997 (= c!47269 (= lt!145771 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293997 (= e!185873 e!185875)))

(assert (= (and d!66743 c!47268) b!293992))

(assert (= (and d!66743 (not c!47268)) b!293995))

(assert (= (and b!293995 c!47267) b!293994))

(assert (= (and b!293995 (not c!47267)) b!293997))

(assert (= (and b!293997 c!47269) b!293996))

(assert (= (and b!293997 (not c!47269)) b!293993))

(assert (=> d!66743 m!307669))

(declare-fun m!307701 () Bool)

(assert (=> d!66743 m!307701))

(assert (=> d!66743 m!307701))

(assert (=> d!66743 m!307669))

(declare-fun m!307703 () Bool)

(assert (=> d!66743 m!307703))

(declare-fun m!307705 () Bool)

(assert (=> d!66743 m!307705))

(assert (=> d!66743 m!307567))

(declare-fun m!307707 () Bool)

(assert (=> d!66743 m!307707))

(declare-fun m!307709 () Bool)

(assert (=> d!66743 m!307709))

(assert (=> b!293993 m!307669))

(declare-fun m!307711 () Bool)

(assert (=> b!293993 m!307711))

(declare-fun m!307713 () Bool)

(assert (=> b!293995 m!307713))

(assert (=> b!293969 d!66743))

(declare-fun d!66745 () Bool)

(declare-fun res!154599 () Bool)

(declare-fun e!185876 () Bool)

(assert (=> d!66745 (=> res!154599 e!185876)))

(assert (=> d!66745 (= res!154599 (= (select (arr!7059 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k!2524))))

(assert (=> d!66745 (= (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!185876)))

(declare-fun b!293998 () Bool)

(declare-fun e!185877 () Bool)

(assert (=> b!293998 (= e!185876 e!185877)))

(declare-fun res!154600 () Bool)

(assert (=> b!293998 (=> (not res!154600) (not e!185877))))

(assert (=> b!293998 (= res!154600 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!7411 a!3312)))))

(declare-fun b!293999 () Bool)

(assert (=> b!293999 (= e!185877 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!66745 (not res!154599)) b!293998))

(assert (= (and b!293998 res!154600) b!293999))

(declare-fun m!307715 () Bool)

(assert (=> d!66745 m!307715))

(declare-fun m!307717 () Bool)

(assert (=> b!293999 m!307717))

(assert (=> b!293983 d!66745))

(declare-fun b!294012 () Bool)

(declare-fun e!185886 () SeekEntryResult!2173)

(assert (=> b!294012 (= e!185886 (Found!2173 (index!10864 lt!145748)))))

(declare-fun d!66747 () Bool)

(declare-fun lt!145778 () SeekEntryResult!2173)

(assert (=> d!66747 (and (or (is-Undefined!2173 lt!145778) (not (is-Found!2173 lt!145778)) (and (bvsge (index!10863 lt!145778) #b00000000000000000000000000000000) (bvslt (index!10863 lt!145778) (size!7411 a!3312)))) (or (is-Undefined!2173 lt!145778) (is-Found!2173 lt!145778) (not (is-MissingVacant!2173 lt!145778)) (not (= (index!10865 lt!145778) (index!10864 lt!145748))) (and (bvsge (index!10865 lt!145778) #b00000000000000000000000000000000) (bvslt (index!10865 lt!145778) (size!7411 a!3312)))) (or (is-Undefined!2173 lt!145778) (ite (is-Found!2173 lt!145778) (= (select (arr!7059 a!3312) (index!10863 lt!145778)) k!2524) (and (is-MissingVacant!2173 lt!145778) (= (index!10865 lt!145778) (index!10864 lt!145748)) (= (select (arr!7059 a!3312) (index!10865 lt!145778)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!185885 () SeekEntryResult!2173)

(assert (=> d!66747 (= lt!145778 e!185885)))

(declare-fun c!47276 () Bool)

(assert (=> d!66747 (= c!47276 (bvsge (x!29152 lt!145748) #b01111111111111111111111111111110))))

(declare-fun lt!145779 () (_ BitVec 64))

(assert (=> d!66747 (= lt!145779 (select (arr!7059 a!3312) (index!10864 lt!145748)))))

(assert (=> d!66747 (validMask!0 mask!3809)))

(assert (=> d!66747 (= (seekKeyOrZeroReturnVacant!0 (x!29152 lt!145748) (index!10864 lt!145748) (index!10864 lt!145748) k!2524 a!3312 mask!3809) lt!145778)))

(declare-fun b!294013 () Bool)

(declare-fun c!47277 () Bool)

(assert (=> b!294013 (= c!47277 (= lt!145779 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185884 () SeekEntryResult!2173)

(assert (=> b!294013 (= e!185886 e!185884)))

(declare-fun b!294014 () Bool)

(assert (=> b!294014 (= e!185884 (MissingVacant!2173 (index!10864 lt!145748)))))

(declare-fun b!294015 () Bool)

(assert (=> b!294015 (= e!185884 (seekKeyOrZeroReturnVacant!0 (bvadd (x!29152 lt!145748) #b00000000000000000000000000000001) (nextIndex!0 (index!10864 lt!145748) (bvadd (x!29152 lt!145748) #b00000000000000000000000000000001) mask!3809) (index!10864 lt!145748) k!2524 a!3312 mask!3809))))

(declare-fun b!294016 () Bool)

(assert (=> b!294016 (= e!185885 e!185886)))

(declare-fun c!47278 () Bool)

(assert (=> b!294016 (= c!47278 (= lt!145779 k!2524))))

(declare-fun b!294017 () Bool)

(assert (=> b!294017 (= e!185885 Undefined!2173)))

(assert (= (and d!66747 c!47276) b!294017))

(assert (= (and d!66747 (not c!47276)) b!294016))

(assert (= (and b!294016 c!47278) b!294012))

(assert (= (and b!294016 (not c!47278)) b!294013))

(assert (= (and b!294013 c!47277) b!294014))

(assert (= (and b!294013 (not c!47277)) b!294015))

(declare-fun m!307719 () Bool)

(assert (=> d!66747 m!307719))

(declare-fun m!307721 () Bool)

(assert (=> d!66747 m!307721))

(assert (=> d!66747 m!307667))

(assert (=> d!66747 m!307567))

(declare-fun m!307723 () Bool)

(assert (=> b!294015 m!307723))

(assert (=> b!294015 m!307723))

(declare-fun m!307725 () Bool)

(assert (=> b!294015 m!307725))

(assert (=> b!293943 d!66747))

(assert (=> d!66691 d!66709))

(declare-fun d!66749 () Bool)

(assert (=> d!66749 (= (validKeyInArray!0 (select (arr!7059 a!3312) #b00000000000000000000000000000000)) (and (not (= (select (arr!7059 a!3312) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7059 a!3312) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293971 d!66749))

(declare-fun b!294018 () Bool)

(declare-fun e!185887 () Bool)

(declare-fun call!25676 () Bool)

(assert (=> b!294018 (= e!185887 call!25676)))

(declare-fun b!294019 () Bool)

(declare-fun e!185888 () Bool)

(assert (=> b!294019 (= e!185888 e!185887)))

(declare-fun lt!145780 () (_ BitVec 64))

(assert (=> b!294019 (= lt!145780 (select (arr!7059 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!145782 () Unit!9164)

(assert (=> b!294019 (= lt!145782 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145780 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!294019 (arrayContainsKey!0 a!3312 lt!145780 #b00000000000000000000000000000000)))

(declare-fun lt!145781 () Unit!9164)

(assert (=> b!294019 (= lt!145781 lt!145782)))

(declare-fun res!154602 () Bool)

(assert (=> b!294019 (= res!154602 (= (seekEntryOrOpen!0 (select (arr!7059 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3312 mask!3809) (Found!2173 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!294019 (=> (not res!154602) (not e!185887))))

(declare-fun b!294020 () Bool)

(assert (=> b!294020 (= e!185888 call!25676)))

(declare-fun d!66751 () Bool)

(declare-fun res!154601 () Bool)

(declare-fun e!185889 () Bool)

(assert (=> d!66751 (=> res!154601 e!185889)))

(assert (=> d!66751 (= res!154601 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7411 a!3312)))))

(assert (=> d!66751 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809) e!185889)))

(declare-fun bm!25673 () Bool)

(assert (=> bm!25673 (= call!25676 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!294021 () Bool)

(assert (=> b!294021 (= e!185889 e!185888)))

(declare-fun c!47279 () Bool)

(assert (=> b!294021 (= c!47279 (validKeyInArray!0 (select (arr!7059 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!66751 (not res!154601)) b!294021))

(assert (= (and b!294021 c!47279) b!294019))

(assert (= (and b!294021 (not c!47279)) b!294020))

(assert (= (and b!294019 res!154602) b!294018))

(assert (= (or b!294018 b!294020) bm!25673))

(assert (=> b!294019 m!307715))

(declare-fun m!307727 () Bool)

(assert (=> b!294019 m!307727))

(declare-fun m!307729 () Bool)

(assert (=> b!294019 m!307729))

(assert (=> b!294019 m!307715))

(declare-fun m!307731 () Bool)

(assert (=> b!294019 m!307731))

(declare-fun m!307733 () Bool)

(assert (=> bm!25673 m!307733))

(assert (=> b!294021 m!307715))

(assert (=> b!294021 m!307715))

(declare-fun m!307735 () Bool)

(assert (=> b!294021 m!307735))

(assert (=> bm!25672 d!66751))

(declare-fun b!294022 () Bool)

(declare-fun lt!145783 () SeekEntryResult!2173)

(assert (=> b!294022 (and (bvsge (index!10864 lt!145783) #b00000000000000000000000000000000) (bvslt (index!10864 lt!145783) (size!7411 a!3312)))))

(declare-fun res!154604 () Bool)

(assert (=> b!294022 (= res!154604 (= (select (arr!7059 a!3312) (index!10864 lt!145783)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185890 () Bool)

(assert (=> b!294022 (=> res!154604 e!185890)))

(declare-fun b!294023 () Bool)

(declare-fun e!185891 () Bool)

(assert (=> b!294023 (= e!185891 (bvsge (x!29152 lt!145783) #b01111111111111111111111111111110))))

(declare-fun b!294024 () Bool)

(assert (=> b!294024 (and (bvsge (index!10864 lt!145783) #b00000000000000000000000000000000) (bvslt (index!10864 lt!145783) (size!7411 a!3312)))))

(assert (=> b!294024 (= e!185890 (= (select (arr!7059 a!3312) (index!10864 lt!145783)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294025 () Bool)

(declare-fun e!185894 () SeekEntryResult!2173)

(assert (=> b!294025 (= e!185894 (Intermediate!2173 true (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!294026 () Bool)

(declare-fun e!185893 () SeekEntryResult!2173)

(assert (=> b!294026 (= e!185893 (Intermediate!2173 false (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!294027 () Bool)

(assert (=> b!294027 (= e!185893 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2524 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!294028 () Bool)

(assert (=> b!294028 (= e!185894 e!185893)))

(declare-fun c!47282 () Bool)

(declare-fun lt!145784 () (_ BitVec 64))

(assert (=> b!294028 (= c!47282 (or (= lt!145784 k!2524) (= (bvadd lt!145784 lt!145784) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294029 () Bool)

(assert (=> b!294029 (and (bvsge (index!10864 lt!145783) #b00000000000000000000000000000000) (bvslt (index!10864 lt!145783) (size!7411 a!3312)))))

(declare-fun res!154605 () Bool)

(assert (=> b!294029 (= res!154605 (= (select (arr!7059 a!3312) (index!10864 lt!145783)) k!2524))))

(assert (=> b!294029 (=> res!154605 e!185890)))

(declare-fun e!185892 () Bool)

(assert (=> b!294029 (= e!185892 e!185890)))

(declare-fun b!294030 () Bool)

(assert (=> b!294030 (= e!185891 e!185892)))

(declare-fun res!154603 () Bool)

(assert (=> b!294030 (= res!154603 (and (is-Intermediate!2173 lt!145783) (not (undefined!2985 lt!145783)) (bvslt (x!29152 lt!145783) #b01111111111111111111111111111110) (bvsge (x!29152 lt!145783) #b00000000000000000000000000000000) (bvsge (x!29152 lt!145783) #b00000000000000000000000000000000)))))

(assert (=> b!294030 (=> (not res!154603) (not e!185892))))

(declare-fun d!66753 () Bool)

(assert (=> d!66753 e!185891))

(declare-fun c!47280 () Bool)

(assert (=> d!66753 (= c!47280 (and (is-Intermediate!2173 lt!145783) (undefined!2985 lt!145783)))))

(assert (=> d!66753 (= lt!145783 e!185894)))

(declare-fun c!47281 () Bool)

(assert (=> d!66753 (= c!47281 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66753 (= lt!145784 (select (arr!7059 a!3312) (toIndex!0 k!2524 mask!3809)))))

(assert (=> d!66753 (validMask!0 mask!3809)))

(assert (=> d!66753 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809) lt!145783)))

(assert (= (and d!66753 c!47281) b!294025))

(assert (= (and d!66753 (not c!47281)) b!294028))

(assert (= (and b!294028 c!47282) b!294026))

(assert (= (and b!294028 (not c!47282)) b!294027))

(assert (= (and d!66753 c!47280) b!294023))

(assert (= (and d!66753 (not c!47280)) b!294030))

(assert (= (and b!294030 res!154603) b!294029))

(assert (= (and b!294029 (not res!154605)) b!294022))

(assert (= (and b!294022 (not res!154604)) b!294024))

(declare-fun m!307737 () Bool)

(assert (=> b!294024 m!307737))

(assert (=> b!294022 m!307737))

(assert (=> b!294029 m!307737))

(assert (=> b!294027 m!307561))

(declare-fun m!307739 () Bool)

(assert (=> b!294027 m!307739))

(assert (=> b!294027 m!307739))

(declare-fun m!307741 () Bool)

(assert (=> b!294027 m!307741))

(assert (=> d!66753 m!307561))

(declare-fun m!307743 () Bool)

(assert (=> d!66753 m!307743))

(assert (=> d!66753 m!307567))

(assert (=> d!66719 d!66753))

(assert (=> d!66719 d!66705))

(assert (=> d!66719 d!66709))

(declare-fun b!294031 () Bool)

(declare-fun lt!145785 () SeekEntryResult!2173)

(assert (=> b!294031 (and (bvsge (index!10864 lt!145785) #b00000000000000000000000000000000) (bvslt (index!10864 lt!145785) (size!7411 a!3312)))))

(declare-fun res!154607 () Bool)

(assert (=> b!294031 (= res!154607 (= (select (arr!7059 a!3312) (index!10864 lt!145785)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185895 () Bool)

(assert (=> b!294031 (=> res!154607 e!185895)))

(declare-fun b!294032 () Bool)

(declare-fun e!185896 () Bool)

(assert (=> b!294032 (= e!185896 (bvsge (x!29152 lt!145785) #b01111111111111111111111111111110))))

(declare-fun b!294033 () Bool)

(assert (=> b!294033 (and (bvsge (index!10864 lt!145785) #b00000000000000000000000000000000) (bvslt (index!10864 lt!145785) (size!7411 a!3312)))))

(assert (=> b!294033 (= e!185895 (= (select (arr!7059 a!3312) (index!10864 lt!145785)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294034 () Bool)

(declare-fun e!185899 () SeekEntryResult!2173)

(assert (=> b!294034 (= e!185899 (Intermediate!2173 true (nextIndex!0 lt!145670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!294035 () Bool)

(declare-fun e!185898 () SeekEntryResult!2173)

(assert (=> b!294035 (= e!185898 (Intermediate!2173 false (nextIndex!0 lt!145670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!294036 () Bool)

(assert (=> b!294036 (= e!185898 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!145670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!294037 () Bool)

(assert (=> b!294037 (= e!185899 e!185898)))

(declare-fun c!47285 () Bool)

(declare-fun lt!145786 () (_ BitVec 64))

(assert (=> b!294037 (= c!47285 (or (= lt!145786 k!2524) (= (bvadd lt!145786 lt!145786) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294038 () Bool)

(assert (=> b!294038 (and (bvsge (index!10864 lt!145785) #b00000000000000000000000000000000) (bvslt (index!10864 lt!145785) (size!7411 a!3312)))))

(declare-fun res!154608 () Bool)

(assert (=> b!294038 (= res!154608 (= (select (arr!7059 a!3312) (index!10864 lt!145785)) k!2524))))

(assert (=> b!294038 (=> res!154608 e!185895)))

(declare-fun e!185897 () Bool)

(assert (=> b!294038 (= e!185897 e!185895)))

(declare-fun b!294039 () Bool)

(assert (=> b!294039 (= e!185896 e!185897)))

(declare-fun res!154606 () Bool)

(assert (=> b!294039 (= res!154606 (and (is-Intermediate!2173 lt!145785) (not (undefined!2985 lt!145785)) (bvslt (x!29152 lt!145785) #b01111111111111111111111111111110) (bvsge (x!29152 lt!145785) #b00000000000000000000000000000000) (bvsge (x!29152 lt!145785) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!294039 (=> (not res!154606) (not e!185897))))

(declare-fun d!66755 () Bool)

(assert (=> d!66755 e!185896))

(declare-fun c!47283 () Bool)

(assert (=> d!66755 (= c!47283 (and (is-Intermediate!2173 lt!145785) (undefined!2985 lt!145785)))))

(assert (=> d!66755 (= lt!145785 e!185899)))

(declare-fun c!47284 () Bool)

(assert (=> d!66755 (= c!47284 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!66755 (= lt!145786 (select (arr!7059 a!3312) (nextIndex!0 lt!145670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809)))))

(assert (=> d!66755 (validMask!0 mask!3809)))

(assert (=> d!66755 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k!2524 a!3312 mask!3809) lt!145785)))

(assert (= (and d!66755 c!47284) b!294034))

(assert (= (and d!66755 (not c!47284)) b!294037))

(assert (= (and b!294037 c!47285) b!294035))

(assert (= (and b!294037 (not c!47285)) b!294036))

(assert (= (and d!66755 c!47283) b!294032))

(assert (= (and d!66755 (not c!47283)) b!294039))

(assert (= (and b!294039 res!154606) b!294038))

(assert (= (and b!294038 (not res!154608)) b!294031))

(assert (= (and b!294031 (not res!154607)) b!294033))

(declare-fun m!307745 () Bool)

(assert (=> b!294033 m!307745))

(assert (=> b!294031 m!307745))

(assert (=> b!294038 m!307745))

(assert (=> b!294036 m!307605))

(declare-fun m!307747 () Bool)

(assert (=> b!294036 m!307747))

(assert (=> b!294036 m!307747))

(declare-fun m!307749 () Bool)

(assert (=> b!294036 m!307749))

(assert (=> d!66755 m!307605))

(declare-fun m!307751 () Bool)

(assert (=> d!66755 m!307751))

(assert (=> d!66755 m!307567))

(assert (=> b!293854 d!66755))

(declare-fun d!66757 () Bool)

(declare-fun lt!145789 () (_ BitVec 32))

(assert (=> d!66757 (and (bvsge lt!145789 #b00000000000000000000000000000000) (bvslt lt!145789 (bvadd mask!3809 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!66757 (= lt!145789 (choose!52 lt!145670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809))))

(assert (=> d!66757 (validMask!0 mask!3809)))

(assert (=> d!66757 (= (nextIndex!0 lt!145670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) lt!145789)))

(declare-fun bs!10463 () Bool)

(assert (= bs!10463 d!66757))

(declare-fun m!307753 () Bool)

(assert (=> bs!10463 m!307753))

(assert (=> bs!10463 m!307567))

(assert (=> b!293854 d!66757))

(declare-fun b!294040 () Bool)

(declare-fun lt!145790 () SeekEntryResult!2173)

(assert (=> b!294040 (and (bvsge (index!10864 lt!145790) #b00000000000000000000000000000000) (bvslt (index!10864 lt!145790) (size!7411 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312)))))))

(declare-fun res!154610 () Bool)

(assert (=> b!294040 (= res!154610 (= (select (arr!7059 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312))) (index!10864 lt!145790)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185900 () Bool)

(assert (=> b!294040 (=> res!154610 e!185900)))

(declare-fun b!294041 () Bool)

(declare-fun e!185901 () Bool)

(assert (=> b!294041 (= e!185901 (bvsge (x!29152 lt!145790) #b01111111111111111111111111111110))))

(declare-fun b!294042 () Bool)

(assert (=> b!294042 (and (bvsge (index!10864 lt!145790) #b00000000000000000000000000000000) (bvslt (index!10864 lt!145790) (size!7411 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312)))))))

(assert (=> b!294042 (= e!185900 (= (select (arr!7059 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312))) (index!10864 lt!145790)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294043 () Bool)

(declare-fun e!185904 () SeekEntryResult!2173)

(assert (=> b!294043 (= e!185904 (Intermediate!2173 true (nextIndex!0 lt!145670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!294044 () Bool)

(declare-fun e!185903 () SeekEntryResult!2173)

(assert (=> b!294044 (= e!185903 (Intermediate!2173 false (nextIndex!0 lt!145670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!294045 () Bool)

(assert (=> b!294045 (= e!185903 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!145670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!3809) k!2524 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312)) mask!3809))))

(declare-fun b!294046 () Bool)

(assert (=> b!294046 (= e!185904 e!185903)))

(declare-fun c!47288 () Bool)

(declare-fun lt!145791 () (_ BitVec 64))

(assert (=> b!294046 (= c!47288 (or (= lt!145791 k!2524) (= (bvadd lt!145791 lt!145791) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294047 () Bool)

(assert (=> b!294047 (and (bvsge (index!10864 lt!145790) #b00000000000000000000000000000000) (bvslt (index!10864 lt!145790) (size!7411 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312)))))))

(declare-fun res!154611 () Bool)

(assert (=> b!294047 (= res!154611 (= (select (arr!7059 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312))) (index!10864 lt!145790)) k!2524))))

(assert (=> b!294047 (=> res!154611 e!185900)))

(declare-fun e!185902 () Bool)

(assert (=> b!294047 (= e!185902 e!185900)))

(declare-fun b!294048 () Bool)

(assert (=> b!294048 (= e!185901 e!185902)))

(declare-fun res!154609 () Bool)

(assert (=> b!294048 (= res!154609 (and (is-Intermediate!2173 lt!145790) (not (undefined!2985 lt!145790)) (bvslt (x!29152 lt!145790) #b01111111111111111111111111111110) (bvsge (x!29152 lt!145790) #b00000000000000000000000000000000) (bvsge (x!29152 lt!145790) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!294048 (=> (not res!154609) (not e!185902))))

(declare-fun d!66759 () Bool)

(assert (=> d!66759 e!185901))

(declare-fun c!47286 () Bool)

(assert (=> d!66759 (= c!47286 (and (is-Intermediate!2173 lt!145790) (undefined!2985 lt!145790)))))

(assert (=> d!66759 (= lt!145790 e!185904)))

(declare-fun c!47287 () Bool)

(assert (=> d!66759 (= c!47287 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!66759 (= lt!145791 (select (arr!7059 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312))) (nextIndex!0 lt!145670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809)))))

(assert (=> d!66759 (validMask!0 mask!3809)))

(assert (=> d!66759 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k!2524 (array!14879 (store (arr!7059 a!3312) i!1256 k!2524) (size!7411 a!3312)) mask!3809) lt!145790)))

(assert (= (and d!66759 c!47287) b!294043))

(assert (= (and d!66759 (not c!47287)) b!294046))

(assert (= (and b!294046 c!47288) b!294044))

(assert (= (and b!294046 (not c!47288)) b!294045))

(assert (= (and d!66759 c!47286) b!294041))

(assert (= (and d!66759 (not c!47286)) b!294048))

(assert (= (and b!294048 res!154609) b!294047))

(assert (= (and b!294047 (not res!154611)) b!294040))

(assert (= (and b!294040 (not res!154610)) b!294042))

(declare-fun m!307755 () Bool)

(assert (=> b!294042 m!307755))

(assert (=> b!294040 m!307755))

(assert (=> b!294047 m!307755))

(assert (=> b!294045 m!307605))

(assert (=> b!294045 m!307747))

(assert (=> b!294045 m!307747))

(declare-fun m!307757 () Bool)

(assert (=> b!294045 m!307757))

(assert (=> d!66759 m!307605))

(declare-fun m!307759 () Bool)

(assert (=> d!66759 m!307759))

(assert (=> d!66759 m!307567))

(assert (=> b!293845 d!66759))

(assert (=> b!293845 d!66757))

(assert (=> d!66703 d!66709))

(push 1)

(assert (not b!294019))

(assert (not b!293999))

(assert (not d!66747))

(assert (not d!66755))

(assert (not d!66757))

(assert (not b!293993))

(assert (not d!66739))

(assert (not b!294036))

(assert (not b!294027))

(assert (not bm!25673))

(assert (not b!294045))

(assert (not d!66753))

(assert (not b!294021))

(assert (not b!294015))

(assert (not d!66759))

(assert (not b!293991))

(assert (not d!66743))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

