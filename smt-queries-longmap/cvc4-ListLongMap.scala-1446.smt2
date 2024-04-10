; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27880 () Bool)

(assert start!27880)

(declare-fun b!286701 () Bool)

(declare-fun res!148784 () Bool)

(declare-fun e!181635 () Bool)

(assert (=> b!286701 (=> (not res!148784) (not e!181635))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286701 (= res!148784 (validKeyInArray!0 k!2524))))

(declare-fun b!286703 () Bool)

(declare-fun e!181637 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!141192 () (_ BitVec 32))

(assert (=> b!286703 (= e!181637 (and (bvsge mask!3809 #b00000000000000000000000000000000) (or (bvslt lt!141192 #b00000000000000000000000000000000) (bvsge lt!141192 (bvadd #b00000000000000000000000000000001 mask!3809)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286703 (= lt!141192 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!286704 () Bool)

(declare-fun res!148780 () Bool)

(assert (=> b!286704 (=> (not res!148780) (not e!181637))))

(declare-datatypes ((array!14368 0))(
  ( (array!14369 (arr!6817 (Array (_ BitVec 32) (_ BitVec 64))) (size!7169 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14368)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14368 (_ BitVec 32)) Bool)

(assert (=> b!286704 (= res!148780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!148782 () Bool)

(assert (=> start!27880 (=> (not res!148782) (not e!181635))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27880 (= res!148782 (validMask!0 mask!3809))))

(assert (=> start!27880 e!181635))

(assert (=> start!27880 true))

(declare-fun array_inv!4780 (array!14368) Bool)

(assert (=> start!27880 (array_inv!4780 a!3312)))

(declare-fun b!286702 () Bool)

(assert (=> b!286702 (= e!181635 e!181637)))

(declare-fun res!148781 () Bool)

(assert (=> b!286702 (=> (not res!148781) (not e!181637))))

(declare-datatypes ((SeekEntryResult!1966 0))(
  ( (MissingZero!1966 (index!10034 (_ BitVec 32))) (Found!1966 (index!10035 (_ BitVec 32))) (Intermediate!1966 (undefined!2778 Bool) (index!10036 (_ BitVec 32)) (x!28246 (_ BitVec 32))) (Undefined!1966) (MissingVacant!1966 (index!10037 (_ BitVec 32))) )
))
(declare-fun lt!141193 () SeekEntryResult!1966)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286702 (= res!148781 (or (= lt!141193 (MissingZero!1966 i!1256)) (= lt!141193 (MissingVacant!1966 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14368 (_ BitVec 32)) SeekEntryResult!1966)

(assert (=> b!286702 (= lt!141193 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286705 () Bool)

(declare-fun res!148785 () Bool)

(assert (=> b!286705 (=> (not res!148785) (not e!181635))))

(declare-fun arrayContainsKey!0 (array!14368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286705 (= res!148785 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286706 () Bool)

(declare-fun res!148783 () Bool)

(assert (=> b!286706 (=> (not res!148783) (not e!181635))))

(assert (=> b!286706 (= res!148783 (and (= (size!7169 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7169 a!3312))))))

(assert (= (and start!27880 res!148782) b!286706))

(assert (= (and b!286706 res!148783) b!286701))

(assert (= (and b!286701 res!148784) b!286705))

(assert (= (and b!286705 res!148785) b!286702))

(assert (= (and b!286702 res!148781) b!286704))

(assert (= (and b!286704 res!148780) b!286703))

(declare-fun m!301315 () Bool)

(assert (=> b!286704 m!301315))

(declare-fun m!301317 () Bool)

(assert (=> b!286702 m!301317))

(declare-fun m!301319 () Bool)

(assert (=> b!286703 m!301319))

(declare-fun m!301321 () Bool)

(assert (=> b!286701 m!301321))

(declare-fun m!301323 () Bool)

(assert (=> start!27880 m!301323))

(declare-fun m!301325 () Bool)

(assert (=> start!27880 m!301325))

(declare-fun m!301327 () Bool)

(assert (=> b!286705 m!301327))

(push 1)

(assert (not b!286701))

(assert (not b!286704))

(assert (not b!286705))

(assert (not b!286702))

(assert (not b!286703))

(assert (not start!27880))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!286769 () Bool)

(declare-fun e!181681 () SeekEntryResult!1966)

(assert (=> b!286769 (= e!181681 Undefined!1966)))

(declare-fun e!181680 () SeekEntryResult!1966)

(declare-fun lt!141230 () SeekEntryResult!1966)

(declare-fun b!286770 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14368 (_ BitVec 32)) SeekEntryResult!1966)

(assert (=> b!286770 (= e!181680 (seekKeyOrZeroReturnVacant!0 (x!28246 lt!141230) (index!10036 lt!141230) (index!10036 lt!141230) k!2524 a!3312 mask!3809))))

(declare-fun d!66007 () Bool)

(declare-fun lt!141231 () SeekEntryResult!1966)

(assert (=> d!66007 (and (or (is-Undefined!1966 lt!141231) (not (is-Found!1966 lt!141231)) (and (bvsge (index!10035 lt!141231) #b00000000000000000000000000000000) (bvslt (index!10035 lt!141231) (size!7169 a!3312)))) (or (is-Undefined!1966 lt!141231) (is-Found!1966 lt!141231) (not (is-MissingZero!1966 lt!141231)) (and (bvsge (index!10034 lt!141231) #b00000000000000000000000000000000) (bvslt (index!10034 lt!141231) (size!7169 a!3312)))) (or (is-Undefined!1966 lt!141231) (is-Found!1966 lt!141231) (is-MissingZero!1966 lt!141231) (not (is-MissingVacant!1966 lt!141231)) (and (bvsge (index!10037 lt!141231) #b00000000000000000000000000000000) (bvslt (index!10037 lt!141231) (size!7169 a!3312)))) (or (is-Undefined!1966 lt!141231) (ite (is-Found!1966 lt!141231) (= (select (arr!6817 a!3312) (index!10035 lt!141231)) k!2524) (ite (is-MissingZero!1966 lt!141231) (= (select (arr!6817 a!3312) (index!10034 lt!141231)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1966 lt!141231) (= (select (arr!6817 a!3312) (index!10037 lt!141231)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66007 (= lt!141231 e!181681)))

(declare-fun c!46536 () Bool)

(assert (=> d!66007 (= c!46536 (and (is-Intermediate!1966 lt!141230) (undefined!2778 lt!141230)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14368 (_ BitVec 32)) SeekEntryResult!1966)

(assert (=> d!66007 (= lt!141230 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66007 (validMask!0 mask!3809)))

(assert (=> d!66007 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!141231)))

(declare-fun b!286771 () Bool)

(declare-fun e!181682 () SeekEntryResult!1966)

(assert (=> b!286771 (= e!181682 (Found!1966 (index!10036 lt!141230)))))

(declare-fun b!286772 () Bool)

(assert (=> b!286772 (= e!181681 e!181682)))

(declare-fun lt!141232 () (_ BitVec 64))

(assert (=> b!286772 (= lt!141232 (select (arr!6817 a!3312) (index!10036 lt!141230)))))

(declare-fun c!46537 () Bool)

(assert (=> b!286772 (= c!46537 (= lt!141232 k!2524))))

(declare-fun b!286773 () Bool)

(declare-fun c!46538 () Bool)

(assert (=> b!286773 (= c!46538 (= lt!141232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!286773 (= e!181682 e!181680)))

(declare-fun b!286774 () Bool)

(assert (=> b!286774 (= e!181680 (MissingZero!1966 (index!10036 lt!141230)))))

(assert (= (and d!66007 c!46536) b!286769))

(assert (= (and d!66007 (not c!46536)) b!286772))

(assert (= (and b!286772 c!46537) b!286771))

(assert (= (and b!286772 (not c!46537)) b!286773))

(assert (= (and b!286773 c!46538) b!286774))

(assert (= (and b!286773 (not c!46538)) b!286770))

(declare-fun m!301359 () Bool)

(assert (=> b!286770 m!301359))

(assert (=> d!66007 m!301319))

(declare-fun m!301361 () Bool)

(assert (=> d!66007 m!301361))

(assert (=> d!66007 m!301319))

(assert (=> d!66007 m!301323))

(declare-fun m!301363 () Bool)

(assert (=> d!66007 m!301363))

(declare-fun m!301365 () Bool)

(assert (=> d!66007 m!301365))

(declare-fun m!301367 () Bool)

(assert (=> d!66007 m!301367))

(declare-fun m!301369 () Bool)

(assert (=> b!286772 m!301369))

(assert (=> b!286702 d!66007))

(declare-fun d!66027 () Bool)

(assert (=> d!66027 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!286701 d!66027))

(declare-fun d!66031 () Bool)

(declare-fun res!148816 () Bool)

(declare-fun e!181690 () Bool)

(assert (=> d!66031 (=> res!148816 e!181690)))

(assert (=> d!66031 (= res!148816 (= (select (arr!6817 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66031 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!181690)))

(declare-fun b!286783 () Bool)

(declare-fun e!181691 () Bool)

(assert (=> b!286783 (= e!181690 e!181691)))

(declare-fun res!148817 () Bool)

(assert (=> b!286783 (=> (not res!148817) (not e!181691))))

(assert (=> b!286783 (= res!148817 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7169 a!3312)))))

(declare-fun b!286784 () Bool)

(assert (=> b!286784 (= e!181691 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66031 (not res!148816)) b!286783))

(assert (= (and b!286783 res!148817) b!286784))

(declare-fun m!301381 () Bool)

(assert (=> d!66031 m!301381))

(declare-fun m!301383 () Bool)

(assert (=> b!286784 m!301383))

(assert (=> b!286705 d!66031))

(declare-fun d!66033 () Bool)

(assert (=> d!66033 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!27880 d!66033))

(declare-fun d!66035 () Bool)

(assert (=> d!66035 (= (array_inv!4780 a!3312) (bvsge (size!7169 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!27880 d!66035))

(declare-fun d!66037 () Bool)

(declare-fun lt!141256 () (_ BitVec 32))

(declare-fun lt!141255 () (_ BitVec 32))

(assert (=> d!66037 (= lt!141256 (bvmul (bvxor lt!141255 (bvlshr lt!141255 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66037 (= lt!141255 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66037 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!148818 (let ((h!5249 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28249 (bvmul (bvxor h!5249 (bvlshr h!5249 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28249 (bvlshr x!28249 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!148818 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!148818 #b00000000000000000000000000000000))))))

(assert (=> d!66037 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!141256 (bvlshr lt!141256 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!286703 d!66037))

(declare-fun d!66039 () Bool)

(declare-fun res!148823 () Bool)

(declare-fun e!181708 () Bool)

(assert (=> d!66039 (=> res!148823 e!181708)))

(assert (=> d!66039 (= res!148823 (bvsge #b00000000000000000000000000000000 (size!7169 a!3312)))))

(assert (=> d!66039 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!181708)))

(declare-fun b!286811 () Bool)

(declare-fun e!181707 () Bool)

(declare-fun call!25606 () Bool)

(assert (=> b!286811 (= e!181707 call!25606)))

(declare-fun b!286812 () Bool)

(declare-fun e!181709 () Bool)

(assert (=> b!286812 (= e!181709 call!25606)))

(declare-fun bm!25603 () Bool)

(assert (=> bm!25603 (= call!25606 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!286813 () Bool)

(assert (=> b!286813 (= e!181709 e!181707)))

(declare-fun lt!141264 () (_ BitVec 64))

(assert (=> b!286813 (= lt!141264 (select (arr!6817 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9060 0))(
  ( (Unit!9061) )
))
(declare-fun lt!141263 () Unit!9060)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14368 (_ BitVec 64) (_ BitVec 32)) Unit!9060)

(assert (=> b!286813 (= lt!141263 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!141264 #b00000000000000000000000000000000))))

(assert (=> b!286813 (arrayContainsKey!0 a!3312 lt!141264 #b00000000000000000000000000000000)))

(declare-fun lt!141265 () Unit!9060)

(assert (=> b!286813 (= lt!141265 lt!141263)))

(declare-fun res!148824 () Bool)

(assert (=> b!286813 (= res!148824 (= (seekEntryOrOpen!0 (select (arr!6817 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!1966 #b00000000000000000000000000000000)))))

(assert (=> b!286813 (=> (not res!148824) (not e!181707))))

(declare-fun b!286814 () Bool)

(assert (=> b!286814 (= e!181708 e!181709)))

(declare-fun c!46551 () Bool)

(assert (=> b!286814 (= c!46551 (validKeyInArray!0 (select (arr!6817 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!66039 (not res!148823)) b!286814))

(assert (= (and b!286814 c!46551) b!286813))

(assert (= (and b!286814 (not c!46551)) b!286812))

(assert (= (and b!286813 res!148824) b!286811))

(assert (= (or b!286811 b!286812) bm!25603))

(declare-fun m!301397 () Bool)

(assert (=> bm!25603 m!301397))

(assert (=> b!286813 m!301381))

(declare-fun m!301399 () Bool)

(assert (=> b!286813 m!301399))

(declare-fun m!301401 () Bool)

(assert (=> b!286813 m!301401))

(assert (=> b!286813 m!301381))

(declare-fun m!301403 () Bool)

(assert (=> b!286813 m!301403))

(assert (=> b!286814 m!301381))

(assert (=> b!286814 m!301381))

(declare-fun m!301405 () Bool)

(assert (=> b!286814 m!301405))

(assert (=> b!286704 d!66039))

(push 1)

(assert (not b!286814))

(assert (not d!66007))

(assert (not b!286770))

(assert (not b!286784))

(assert (not b!286813))

(assert (not bm!25603))

(check-sat)

(pop 1)

(push 1)

(check-sat)

