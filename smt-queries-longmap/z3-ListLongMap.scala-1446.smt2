; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27868 () Bool)

(assert start!27868)

(declare-fun res!148768 () Bool)

(declare-fun e!181642 () Bool)

(assert (=> start!27868 (=> (not res!148768) (not e!181642))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27868 (= res!148768 (validMask!0 mask!3809))))

(assert (=> start!27868 e!181642))

(assert (=> start!27868 true))

(declare-datatypes ((array!14361 0))(
  ( (array!14362 (arr!6814 (Array (_ BitVec 32) (_ BitVec 64))) (size!7166 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14361)

(declare-fun array_inv!4764 (array!14361) Bool)

(assert (=> start!27868 (array_inv!4764 a!3312)))

(declare-fun b!286712 () Bool)

(declare-fun res!148770 () Bool)

(declare-fun e!181641 () Bool)

(assert (=> b!286712 (=> (not res!148770) (not e!181641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14361 (_ BitVec 32)) Bool)

(assert (=> b!286712 (= res!148770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286713 () Bool)

(declare-fun lt!141240 () (_ BitVec 32))

(assert (=> b!286713 (= e!181641 (and (bvsge mask!3809 #b00000000000000000000000000000000) (or (bvslt lt!141240 #b00000000000000000000000000000000) (bvsge lt!141240 (bvadd #b00000000000000000000000000000001 mask!3809)))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286713 (= lt!141240 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!286714 () Bool)

(assert (=> b!286714 (= e!181642 e!181641)))

(declare-fun res!148765 () Bool)

(assert (=> b!286714 (=> (not res!148765) (not e!181641))))

(declare-datatypes ((SeekEntryResult!1928 0))(
  ( (MissingZero!1928 (index!9882 (_ BitVec 32))) (Found!1928 (index!9883 (_ BitVec 32))) (Intermediate!1928 (undefined!2740 Bool) (index!9884 (_ BitVec 32)) (x!28208 (_ BitVec 32))) (Undefined!1928) (MissingVacant!1928 (index!9885 (_ BitVec 32))) )
))
(declare-fun lt!141239 () SeekEntryResult!1928)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286714 (= res!148765 (or (= lt!141239 (MissingZero!1928 i!1256)) (= lt!141239 (MissingVacant!1928 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14361 (_ BitVec 32)) SeekEntryResult!1928)

(assert (=> b!286714 (= lt!141239 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286715 () Bool)

(declare-fun res!148769 () Bool)

(assert (=> b!286715 (=> (not res!148769) (not e!181642))))

(assert (=> b!286715 (= res!148769 (and (= (size!7166 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7166 a!3312))))))

(declare-fun b!286716 () Bool)

(declare-fun res!148767 () Bool)

(assert (=> b!286716 (=> (not res!148767) (not e!181642))))

(declare-fun arrayContainsKey!0 (array!14361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286716 (= res!148767 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286717 () Bool)

(declare-fun res!148766 () Bool)

(assert (=> b!286717 (=> (not res!148766) (not e!181642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286717 (= res!148766 (validKeyInArray!0 k0!2524))))

(assert (= (and start!27868 res!148768) b!286715))

(assert (= (and b!286715 res!148769) b!286717))

(assert (= (and b!286717 res!148766) b!286716))

(assert (= (and b!286716 res!148767) b!286714))

(assert (= (and b!286714 res!148765) b!286712))

(assert (= (and b!286712 res!148770) b!286713))

(declare-fun m!301493 () Bool)

(assert (=> b!286712 m!301493))

(declare-fun m!301495 () Bool)

(assert (=> b!286714 m!301495))

(declare-fun m!301497 () Bool)

(assert (=> b!286716 m!301497))

(declare-fun m!301499 () Bool)

(assert (=> start!27868 m!301499))

(declare-fun m!301501 () Bool)

(assert (=> start!27868 m!301501))

(declare-fun m!301503 () Bool)

(assert (=> b!286713 m!301503))

(declare-fun m!301505 () Bool)

(assert (=> b!286717 m!301505))

(check-sat (not b!286714) (not b!286713) (not b!286712) (not b!286717) (not start!27868) (not b!286716))
(check-sat)
(get-model)

(declare-fun b!286772 () Bool)

(declare-fun e!181676 () SeekEntryResult!1928)

(declare-fun lt!141259 () SeekEntryResult!1928)

(assert (=> b!286772 (= e!181676 (MissingZero!1928 (index!9884 lt!141259)))))

(declare-fun b!286773 () Bool)

(declare-fun e!181675 () SeekEntryResult!1928)

(declare-fun e!181674 () SeekEntryResult!1928)

(assert (=> b!286773 (= e!181675 e!181674)))

(declare-fun lt!141260 () (_ BitVec 64))

(assert (=> b!286773 (= lt!141260 (select (arr!6814 a!3312) (index!9884 lt!141259)))))

(declare-fun c!46537 () Bool)

(assert (=> b!286773 (= c!46537 (= lt!141260 k0!2524))))

(declare-fun b!286774 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14361 (_ BitVec 32)) SeekEntryResult!1928)

(assert (=> b!286774 (= e!181676 (seekKeyOrZeroReturnVacant!0 (x!28208 lt!141259) (index!9884 lt!141259) (index!9884 lt!141259) k0!2524 a!3312 mask!3809))))

(declare-fun b!286775 () Bool)

(assert (=> b!286775 (= e!181675 Undefined!1928)))

(declare-fun b!286777 () Bool)

(declare-fun c!46536 () Bool)

(assert (=> b!286777 (= c!46536 (= lt!141260 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!286777 (= e!181674 e!181676)))

(declare-fun b!286776 () Bool)

(assert (=> b!286776 (= e!181674 (Found!1928 (index!9884 lt!141259)))))

(declare-fun d!66061 () Bool)

(declare-fun lt!141261 () SeekEntryResult!1928)

(get-info :version)

(assert (=> d!66061 (and (or ((_ is Undefined!1928) lt!141261) (not ((_ is Found!1928) lt!141261)) (and (bvsge (index!9883 lt!141261) #b00000000000000000000000000000000) (bvslt (index!9883 lt!141261) (size!7166 a!3312)))) (or ((_ is Undefined!1928) lt!141261) ((_ is Found!1928) lt!141261) (not ((_ is MissingZero!1928) lt!141261)) (and (bvsge (index!9882 lt!141261) #b00000000000000000000000000000000) (bvslt (index!9882 lt!141261) (size!7166 a!3312)))) (or ((_ is Undefined!1928) lt!141261) ((_ is Found!1928) lt!141261) ((_ is MissingZero!1928) lt!141261) (not ((_ is MissingVacant!1928) lt!141261)) (and (bvsge (index!9885 lt!141261) #b00000000000000000000000000000000) (bvslt (index!9885 lt!141261) (size!7166 a!3312)))) (or ((_ is Undefined!1928) lt!141261) (ite ((_ is Found!1928) lt!141261) (= (select (arr!6814 a!3312) (index!9883 lt!141261)) k0!2524) (ite ((_ is MissingZero!1928) lt!141261) (= (select (arr!6814 a!3312) (index!9882 lt!141261)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1928) lt!141261) (= (select (arr!6814 a!3312) (index!9885 lt!141261)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66061 (= lt!141261 e!181675)))

(declare-fun c!46535 () Bool)

(assert (=> d!66061 (= c!46535 (and ((_ is Intermediate!1928) lt!141259) (undefined!2740 lt!141259)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14361 (_ BitVec 32)) SeekEntryResult!1928)

(assert (=> d!66061 (= lt!141259 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66061 (validMask!0 mask!3809)))

(assert (=> d!66061 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!141261)))

(assert (= (and d!66061 c!46535) b!286775))

(assert (= (and d!66061 (not c!46535)) b!286773))

(assert (= (and b!286773 c!46537) b!286776))

(assert (= (and b!286773 (not c!46537)) b!286777))

(assert (= (and b!286777 c!46536) b!286772))

(assert (= (and b!286777 (not c!46536)) b!286774))

(declare-fun m!301539 () Bool)

(assert (=> b!286773 m!301539))

(declare-fun m!301541 () Bool)

(assert (=> b!286774 m!301541))

(assert (=> d!66061 m!301503))

(declare-fun m!301543 () Bool)

(assert (=> d!66061 m!301543))

(declare-fun m!301545 () Bool)

(assert (=> d!66061 m!301545))

(declare-fun m!301547 () Bool)

(assert (=> d!66061 m!301547))

(assert (=> d!66061 m!301499))

(assert (=> d!66061 m!301503))

(declare-fun m!301549 () Bool)

(assert (=> d!66061 m!301549))

(assert (=> b!286714 d!66061))

(declare-fun d!66069 () Bool)

(assert (=> d!66069 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!27868 d!66069))

(declare-fun d!66079 () Bool)

(assert (=> d!66079 (= (array_inv!4764 a!3312) (bvsge (size!7166 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!27868 d!66079))

(declare-fun d!66081 () Bool)

(declare-fun lt!141282 () (_ BitVec 32))

(declare-fun lt!141281 () (_ BitVec 32))

(assert (=> d!66081 (= lt!141282 (bvmul (bvxor lt!141281 (bvlshr lt!141281 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66081 (= lt!141281 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66081 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!148823 (let ((h!5159 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28211 (bvmul (bvxor h!5159 (bvlshr h!5159 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28211 (bvlshr x!28211 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!148823 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!148823 #b00000000000000000000000000000000))))))

(assert (=> d!66081 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!141282 (bvlshr lt!141282 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!286713 d!66081))

(declare-fun b!286816 () Bool)

(declare-fun e!181707 () Bool)

(declare-fun e!181708 () Bool)

(assert (=> b!286816 (= e!181707 e!181708)))

(declare-fun c!46546 () Bool)

(assert (=> b!286816 (= c!46546 (validKeyInArray!0 (select (arr!6814 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!66085 () Bool)

(declare-fun res!148838 () Bool)

(assert (=> d!66085 (=> res!148838 e!181707)))

(assert (=> d!66085 (= res!148838 (bvsge #b00000000000000000000000000000000 (size!7166 a!3312)))))

(assert (=> d!66085 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!181707)))

(declare-fun b!286817 () Bool)

(declare-fun call!25594 () Bool)

(assert (=> b!286817 (= e!181708 call!25594)))

(declare-fun b!286818 () Bool)

(declare-fun e!181709 () Bool)

(assert (=> b!286818 (= e!181708 e!181709)))

(declare-fun lt!141299 () (_ BitVec 64))

(assert (=> b!286818 (= lt!141299 (select (arr!6814 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9028 0))(
  ( (Unit!9029) )
))
(declare-fun lt!141298 () Unit!9028)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14361 (_ BitVec 64) (_ BitVec 32)) Unit!9028)

(assert (=> b!286818 (= lt!141298 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!141299 #b00000000000000000000000000000000))))

(assert (=> b!286818 (arrayContainsKey!0 a!3312 lt!141299 #b00000000000000000000000000000000)))

(declare-fun lt!141300 () Unit!9028)

(assert (=> b!286818 (= lt!141300 lt!141298)))

(declare-fun res!148837 () Bool)

(assert (=> b!286818 (= res!148837 (= (seekEntryOrOpen!0 (select (arr!6814 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!1928 #b00000000000000000000000000000000)))))

(assert (=> b!286818 (=> (not res!148837) (not e!181709))))

(declare-fun b!286819 () Bool)

(assert (=> b!286819 (= e!181709 call!25594)))

(declare-fun bm!25591 () Bool)

(assert (=> bm!25591 (= call!25594 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!66085 (not res!148838)) b!286816))

(assert (= (and b!286816 c!46546) b!286818))

(assert (= (and b!286816 (not c!46546)) b!286817))

(assert (= (and b!286818 res!148837) b!286819))

(assert (= (or b!286819 b!286817) bm!25591))

(declare-fun m!301575 () Bool)

(assert (=> b!286816 m!301575))

(assert (=> b!286816 m!301575))

(declare-fun m!301577 () Bool)

(assert (=> b!286816 m!301577))

(assert (=> b!286818 m!301575))

(declare-fun m!301579 () Bool)

(assert (=> b!286818 m!301579))

(declare-fun m!301581 () Bool)

(assert (=> b!286818 m!301581))

(assert (=> b!286818 m!301575))

(declare-fun m!301583 () Bool)

(assert (=> b!286818 m!301583))

(declare-fun m!301585 () Bool)

(assert (=> bm!25591 m!301585))

(assert (=> b!286712 d!66085))

(declare-fun d!66091 () Bool)

(assert (=> d!66091 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!286717 d!66091))

(declare-fun d!66093 () Bool)

(declare-fun res!148843 () Bool)

(declare-fun e!181714 () Bool)

(assert (=> d!66093 (=> res!148843 e!181714)))

(assert (=> d!66093 (= res!148843 (= (select (arr!6814 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66093 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!181714)))

(declare-fun b!286824 () Bool)

(declare-fun e!181715 () Bool)

(assert (=> b!286824 (= e!181714 e!181715)))

(declare-fun res!148844 () Bool)

(assert (=> b!286824 (=> (not res!148844) (not e!181715))))

(assert (=> b!286824 (= res!148844 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7166 a!3312)))))

(declare-fun b!286825 () Bool)

(assert (=> b!286825 (= e!181715 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66093 (not res!148843)) b!286824))

(assert (= (and b!286824 res!148844) b!286825))

(assert (=> d!66093 m!301575))

(declare-fun m!301587 () Bool)

(assert (=> b!286825 m!301587))

(assert (=> b!286716 d!66093))

(check-sat (not b!286825) (not d!66061) (not b!286816) (not b!286774) (not bm!25591) (not b!286818))
(check-sat)
