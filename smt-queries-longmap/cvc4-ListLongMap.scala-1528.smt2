; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28862 () Bool)

(assert start!28862)

(declare-fun res!154666 () Bool)

(declare-fun e!185963 () Bool)

(assert (=> start!28862 (=> (not res!154666) (not e!185963))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28862 (= res!154666 (validMask!0 mask!3809))))

(assert (=> start!28862 e!185963))

(assert (=> start!28862 true))

(declare-datatypes ((array!14890 0))(
  ( (array!14891 (arr!7063 (Array (_ BitVec 32) (_ BitVec 64))) (size!7415 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14890)

(declare-fun array_inv!5026 (array!14890) Bool)

(assert (=> start!28862 (array_inv!5026 a!3312)))

(declare-fun lt!145818 () Bool)

(declare-fun b!294150 () Bool)

(declare-fun e!185964 () Bool)

(declare-datatypes ((SeekEntryResult!2212 0))(
  ( (MissingZero!2212 (index!11018 (_ BitVec 32))) (Found!2212 (index!11019 (_ BitVec 32))) (Intermediate!2212 (undefined!3024 Bool) (index!11020 (_ BitVec 32)) (x!29210 (_ BitVec 32))) (Undefined!2212) (MissingVacant!2212 (index!11021 (_ BitVec 32))) )
))
(declare-fun lt!145816 () SeekEntryResult!2212)

(assert (=> b!294150 (= e!185964 (and lt!145818 (let ((bdg!6229 (not (is-Intermediate!2212 lt!145816)))) (and (or bdg!6229 (not (undefined!3024 lt!145816))) (or bdg!6229 (not (= (select (arr!7063 a!3312) (index!11020 lt!145816)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6229) (or (bvslt (index!11020 lt!145816) #b00000000000000000000000000000000) (bvsge (index!11020 lt!145816) (size!7415 a!3312)))))))))

(declare-fun lt!145815 () (_ BitVec 32))

(declare-fun lt!145814 () SeekEntryResult!2212)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14890 (_ BitVec 32)) SeekEntryResult!2212)

(assert (=> b!294150 (= lt!145814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145815 k!2524 (array!14891 (store (arr!7063 a!3312) i!1256 k!2524) (size!7415 a!3312)) mask!3809))))

(assert (=> b!294150 (= lt!145816 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145815 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294150 (= lt!145815 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!294151 () Bool)

(assert (=> b!294151 (= e!185963 e!185964)))

(declare-fun res!154667 () Bool)

(assert (=> b!294151 (=> (not res!154667) (not e!185964))))

(declare-fun lt!145817 () SeekEntryResult!2212)

(assert (=> b!294151 (= res!154667 (or lt!145818 (= lt!145817 (MissingVacant!2212 i!1256))))))

(assert (=> b!294151 (= lt!145818 (= lt!145817 (MissingZero!2212 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14890 (_ BitVec 32)) SeekEntryResult!2212)

(assert (=> b!294151 (= lt!145817 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!294152 () Bool)

(declare-fun res!154664 () Bool)

(assert (=> b!294152 (=> (not res!154664) (not e!185963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294152 (= res!154664 (validKeyInArray!0 k!2524))))

(declare-fun b!294153 () Bool)

(declare-fun res!154668 () Bool)

(assert (=> b!294153 (=> (not res!154668) (not e!185963))))

(assert (=> b!294153 (= res!154668 (and (= (size!7415 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7415 a!3312))))))

(declare-fun b!294154 () Bool)

(declare-fun res!154663 () Bool)

(assert (=> b!294154 (=> (not res!154663) (not e!185963))))

(declare-fun arrayContainsKey!0 (array!14890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294154 (= res!154663 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!294155 () Bool)

(declare-fun res!154665 () Bool)

(assert (=> b!294155 (=> (not res!154665) (not e!185964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14890 (_ BitVec 32)) Bool)

(assert (=> b!294155 (= res!154665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28862 res!154666) b!294153))

(assert (= (and b!294153 res!154668) b!294152))

(assert (= (and b!294152 res!154664) b!294154))

(assert (= (and b!294154 res!154663) b!294151))

(assert (= (and b!294151 res!154667) b!294155))

(assert (= (and b!294155 res!154665) b!294150))

(declare-fun m!307703 () Bool)

(assert (=> b!294151 m!307703))

(declare-fun m!307705 () Bool)

(assert (=> b!294150 m!307705))

(declare-fun m!307707 () Bool)

(assert (=> b!294150 m!307707))

(declare-fun m!307709 () Bool)

(assert (=> b!294150 m!307709))

(declare-fun m!307711 () Bool)

(assert (=> b!294150 m!307711))

(declare-fun m!307713 () Bool)

(assert (=> b!294150 m!307713))

(declare-fun m!307715 () Bool)

(assert (=> b!294152 m!307715))

(declare-fun m!307717 () Bool)

(assert (=> b!294154 m!307717))

(declare-fun m!307719 () Bool)

(assert (=> b!294155 m!307719))

(declare-fun m!307721 () Bool)

(assert (=> start!28862 m!307721))

(declare-fun m!307723 () Bool)

(assert (=> start!28862 m!307723))

(push 1)

(assert (not b!294154))

(assert (not start!28862))

(assert (not b!294150))

(assert (not b!294151))

(assert (not b!294155))

(assert (not b!294152))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!294186 () Bool)

(declare-fun c!47329 () Bool)

(declare-fun lt!145836 () (_ BitVec 64))

(assert (=> b!294186 (= c!47329 (= lt!145836 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185982 () SeekEntryResult!2212)

(declare-fun e!185983 () SeekEntryResult!2212)

(assert (=> b!294186 (= e!185982 e!185983)))

(declare-fun b!294187 () Bool)

(declare-fun lt!145835 () SeekEntryResult!2212)

(assert (=> b!294187 (= e!185983 (MissingZero!2212 (index!11020 lt!145835)))))

(declare-fun b!294188 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14890 (_ BitVec 32)) SeekEntryResult!2212)

(assert (=> b!294188 (= e!185983 (seekKeyOrZeroReturnVacant!0 (x!29210 lt!145835) (index!11020 lt!145835) (index!11020 lt!145835) k!2524 a!3312 mask!3809))))

(declare-fun d!66741 () Bool)

(declare-fun lt!145834 () SeekEntryResult!2212)

(assert (=> d!66741 (and (or (is-Undefined!2212 lt!145834) (not (is-Found!2212 lt!145834)) (and (bvsge (index!11019 lt!145834) #b00000000000000000000000000000000) (bvslt (index!11019 lt!145834) (size!7415 a!3312)))) (or (is-Undefined!2212 lt!145834) (is-Found!2212 lt!145834) (not (is-MissingZero!2212 lt!145834)) (and (bvsge (index!11018 lt!145834) #b00000000000000000000000000000000) (bvslt (index!11018 lt!145834) (size!7415 a!3312)))) (or (is-Undefined!2212 lt!145834) (is-Found!2212 lt!145834) (is-MissingZero!2212 lt!145834) (not (is-MissingVacant!2212 lt!145834)) (and (bvsge (index!11021 lt!145834) #b00000000000000000000000000000000) (bvslt (index!11021 lt!145834) (size!7415 a!3312)))) (or (is-Undefined!2212 lt!145834) (ite (is-Found!2212 lt!145834) (= (select (arr!7063 a!3312) (index!11019 lt!145834)) k!2524) (ite (is-MissingZero!2212 lt!145834) (= (select (arr!7063 a!3312) (index!11018 lt!145834)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2212 lt!145834) (= (select (arr!7063 a!3312) (index!11021 lt!145834)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!185981 () SeekEntryResult!2212)

(assert (=> d!66741 (= lt!145834 e!185981)))

(declare-fun c!47331 () Bool)

(assert (=> d!66741 (= c!47331 (and (is-Intermediate!2212 lt!145835) (undefined!3024 lt!145835)))))

(assert (=> d!66741 (= lt!145835 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66741 (validMask!0 mask!3809)))

(assert (=> d!66741 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!145834)))

(declare-fun b!294189 () Bool)

(assert (=> b!294189 (= e!185981 Undefined!2212)))

(declare-fun b!294190 () Bool)

(assert (=> b!294190 (= e!185982 (Found!2212 (index!11020 lt!145835)))))

(declare-fun b!294191 () Bool)

(assert (=> b!294191 (= e!185981 e!185982)))

(assert (=> b!294191 (= lt!145836 (select (arr!7063 a!3312) (index!11020 lt!145835)))))

(declare-fun c!47330 () Bool)

(assert (=> b!294191 (= c!47330 (= lt!145836 k!2524))))

(assert (= (and d!66741 c!47331) b!294189))

(assert (= (and d!66741 (not c!47331)) b!294191))

(assert (= (and b!294191 c!47330) b!294190))

(assert (= (and b!294191 (not c!47330)) b!294186))

(assert (= (and b!294186 c!47329) b!294187))

(assert (= (and b!294186 (not c!47329)) b!294188))

(declare-fun m!307737 () Bool)

(assert (=> b!294188 m!307737))

(assert (=> d!66741 m!307713))

(declare-fun m!307739 () Bool)

(assert (=> d!66741 m!307739))

(declare-fun m!307741 () Bool)

(assert (=> d!66741 m!307741))

(declare-fun m!307743 () Bool)

(assert (=> d!66741 m!307743))

(assert (=> d!66741 m!307721))

(declare-fun m!307745 () Bool)

(assert (=> d!66741 m!307745))

(assert (=> d!66741 m!307713))

(declare-fun m!307747 () Bool)

(assert (=> b!294191 m!307747))

(assert (=> b!294151 d!66741))

(declare-fun d!66751 () Bool)

(assert (=> d!66751 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294152 d!66751))

(declare-fun d!66753 () Bool)

(assert (=> d!66753 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28862 d!66753))

(declare-fun d!66763 () Bool)

(assert (=> d!66763 (= (array_inv!5026 a!3312) (bvsge (size!7415 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28862 d!66763))

(declare-fun d!66765 () Bool)

(declare-fun res!154679 () Bool)

(declare-fun e!186003 () Bool)

(assert (=> d!66765 (=> res!154679 e!186003)))

(assert (=> d!66765 (= res!154679 (= (select (arr!7063 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66765 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!186003)))

(declare-fun b!294220 () Bool)

(declare-fun e!186004 () Bool)

(assert (=> b!294220 (= e!186003 e!186004)))

(declare-fun res!154680 () Bool)

(assert (=> b!294220 (=> (not res!154680) (not e!186004))))

(assert (=> b!294220 (= res!154680 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7415 a!3312)))))

(declare-fun b!294221 () Bool)

(assert (=> b!294221 (= e!186004 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66765 (not res!154679)) b!294220))

(assert (= (and b!294220 res!154680) b!294221))

(declare-fun m!307765 () Bool)

(assert (=> d!66765 m!307765))

(declare-fun m!307767 () Bool)

(assert (=> b!294221 m!307767))

(assert (=> b!294154 d!66765))

(declare-fun b!294248 () Bool)

(declare-fun e!186023 () Bool)

(declare-fun e!186021 () Bool)

(assert (=> b!294248 (= e!186023 e!186021)))

(declare-fun lt!145857 () (_ BitVec 64))

(assert (=> b!294248 (= lt!145857 (select (arr!7063 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9196 0))(
  ( (Unit!9197) )
))
(declare-fun lt!145858 () Unit!9196)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14890 (_ BitVec 64) (_ BitVec 32)) Unit!9196)

(assert (=> b!294248 (= lt!145858 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145857 #b00000000000000000000000000000000))))

(assert (=> b!294248 (arrayContainsKey!0 a!3312 lt!145857 #b00000000000000000000000000000000)))

(declare-fun lt!145856 () Unit!9196)

(assert (=> b!294248 (= lt!145856 lt!145858)))

(declare-fun res!154691 () Bool)

(assert (=> b!294248 (= res!154691 (= (seekEntryOrOpen!0 (select (arr!7063 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2212 #b00000000000000000000000000000000)))))

(assert (=> b!294248 (=> (not res!154691) (not e!186021))))

(declare-fun d!66767 () Bool)

(declare-fun res!154692 () Bool)

(declare-fun e!186022 () Bool)

(assert (=> d!66767 (=> res!154692 e!186022)))

(assert (=> d!66767 (= res!154692 (bvsge #b00000000000000000000000000000000 (size!7415 a!3312)))))

(assert (=> d!66767 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186022)))

(declare-fun b!294249 () Bool)

(assert (=> b!294249 (= e!186022 e!186023)))

(declare-fun c!47349 () Bool)

(assert (=> b!294249 (= c!47349 (validKeyInArray!0 (select (arr!7063 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!294250 () Bool)

(declare-fun call!25693 () Bool)

(assert (=> b!294250 (= e!186021 call!25693)))

(declare-fun b!294251 () Bool)

(assert (=> b!294251 (= e!186023 call!25693)))

(declare-fun bm!25690 () Bool)

(assert (=> bm!25690 (= call!25693 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!66767 (not res!154692)) b!294249))

(assert (= (and b!294249 c!47349) b!294248))

(assert (= (and b!294249 (not c!47349)) b!294251))

(assert (= (and b!294248 res!154691) b!294250))

(assert (= (or b!294250 b!294251) bm!25690))

(assert (=> b!294248 m!307765))

(declare-fun m!307769 () Bool)

(assert (=> b!294248 m!307769))

(declare-fun m!307771 () Bool)

(assert (=> b!294248 m!307771))

(assert (=> b!294248 m!307765))

(declare-fun m!307773 () Bool)

(assert (=> b!294248 m!307773))

(assert (=> b!294249 m!307765))

(assert (=> b!294249 m!307765))

(declare-fun m!307775 () Bool)

(assert (=> b!294249 m!307775))

(declare-fun m!307777 () Bool)

(assert (=> bm!25690 m!307777))

(assert (=> b!294155 d!66767))

(declare-fun b!294340 () Bool)

(declare-fun e!186078 () Bool)

(declare-fun e!186079 () Bool)

(assert (=> b!294340 (= e!186078 e!186079)))

(declare-fun res!154730 () Bool)

(declare-fun lt!145890 () SeekEntryResult!2212)

(assert (=> b!294340 (= res!154730 (and (is-Intermediate!2212 lt!145890) (not (undefined!3024 lt!145890)) (bvslt (x!29210 lt!145890) #b01111111111111111111111111111110) (bvsge (x!29210 lt!145890) #b00000000000000000000000000000000) (bvsge (x!29210 lt!145890) #b00000000000000000000000000000000)))))

(assert (=> b!294340 (=> (not res!154730) (not e!186079))))

(declare-fun b!294341 () Bool)

(declare-fun e!186081 () SeekEntryResult!2212)

(assert (=> b!294341 (= e!186081 (Intermediate!2212 false lt!145815 #b00000000000000000000000000000000))))

(declare-fun b!294342 () Bool)

(assert (=> b!294342 (and (bvsge (index!11020 lt!145890) #b00000000000000000000000000000000) (bvslt (index!11020 lt!145890) (size!7415 (array!14891 (store (arr!7063 a!3312) i!1256 k!2524) (size!7415 a!3312)))))))

(declare-fun res!154731 () Bool)

(assert (=> b!294342 (= res!154731 (= (select (arr!7063 (array!14891 (store (arr!7063 a!3312) i!1256 k!2524) (size!7415 a!3312))) (index!11020 lt!145890)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186080 () Bool)

(assert (=> b!294342 (=> res!154731 e!186080)))

(declare-fun b!294343 () Bool)

(declare-fun e!186077 () SeekEntryResult!2212)

(assert (=> b!294343 (= e!186077 e!186081)))

(declare-fun c!47378 () Bool)

(declare-fun lt!145891 () (_ BitVec 64))

(assert (=> b!294343 (= c!47378 (or (= lt!145891 k!2524) (= (bvadd lt!145891 lt!145891) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!66773 () Bool)

(assert (=> d!66773 e!186078))

(declare-fun c!47379 () Bool)

(assert (=> d!66773 (= c!47379 (and (is-Intermediate!2212 lt!145890) (undefined!3024 lt!145890)))))

(assert (=> d!66773 (= lt!145890 e!186077)))

(declare-fun c!47377 () Bool)

(assert (=> d!66773 (= c!47377 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66773 (= lt!145891 (select (arr!7063 (array!14891 (store (arr!7063 a!3312) i!1256 k!2524) (size!7415 a!3312))) lt!145815))))

(assert (=> d!66773 (validMask!0 mask!3809)))

(assert (=> d!66773 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145815 k!2524 (array!14891 (store (arr!7063 a!3312) i!1256 k!2524) (size!7415 a!3312)) mask!3809) lt!145890)))

(declare-fun b!294344 () Bool)

(assert (=> b!294344 (= e!186078 (bvsge (x!29210 lt!145890) #b01111111111111111111111111111110))))

(declare-fun b!294345 () Bool)

(assert (=> b!294345 (and (bvsge (index!11020 lt!145890) #b00000000000000000000000000000000) (bvslt (index!11020 lt!145890) (size!7415 (array!14891 (store (arr!7063 a!3312) i!1256 k!2524) (size!7415 a!3312)))))))

(assert (=> b!294345 (= e!186080 (= (select (arr!7063 (array!14891 (store (arr!7063 a!3312) i!1256 k!2524) (size!7415 a!3312))) (index!11020 lt!145890)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294346 () Bool)

(assert (=> b!294346 (= e!186077 (Intermediate!2212 true lt!145815 #b00000000000000000000000000000000))))

(declare-fun b!294347 () Bool)

(assert (=> b!294347 (and (bvsge (index!11020 lt!145890) #b00000000000000000000000000000000) (bvslt (index!11020 lt!145890) (size!7415 (array!14891 (store (arr!7063 a!3312) i!1256 k!2524) (size!7415 a!3312)))))))

(declare-fun res!154729 () Bool)

(assert (=> b!294347 (= res!154729 (= (select (arr!7063 (array!14891 (store (arr!7063 a!3312) i!1256 k!2524) (size!7415 a!3312))) (index!11020 lt!145890)) k!2524))))

(assert (=> b!294347 (=> res!154729 e!186080)))

(assert (=> b!294347 (= e!186079 e!186080)))

(declare-fun b!294348 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294348 (= e!186081 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145815 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14891 (store (arr!7063 a!3312) i!1256 k!2524) (size!7415 a!3312)) mask!3809))))

(assert (= (and d!66773 c!47377) b!294346))

(assert (= (and d!66773 (not c!47377)) b!294343))

(assert (= (and b!294343 c!47378) b!294341))

(assert (= (and b!294343 (not c!47378)) b!294348))

(assert (= (and d!66773 c!47379) b!294344))

(assert (= (and d!66773 (not c!47379)) b!294340))

(assert (= (and b!294340 res!154730) b!294347))

(assert (= (and b!294347 (not res!154729)) b!294342))

(assert (= (and b!294342 (not res!154731)) b!294345))

(declare-fun m!307821 () Bool)

(assert (=> b!294348 m!307821))

(assert (=> b!294348 m!307821))

(declare-fun m!307823 () Bool)

(assert (=> b!294348 m!307823))

(declare-fun m!307825 () Bool)

(assert (=> b!294345 m!307825))

(assert (=> b!294347 m!307825))

(declare-fun m!307827 () Bool)

(assert (=> d!66773 m!307827))

(assert (=> d!66773 m!307721))

(assert (=> b!294342 m!307825))

(assert (=> b!294150 d!66773))

(declare-fun b!294351 () Bool)

(declare-fun e!186085 () Bool)

(declare-fun e!186086 () Bool)

(assert (=> b!294351 (= e!186085 e!186086)))

(declare-fun res!154735 () Bool)

(declare-fun lt!145892 () SeekEntryResult!2212)

(assert (=> b!294351 (= res!154735 (and (is-Intermediate!2212 lt!145892) (not (undefined!3024 lt!145892)) (bvslt (x!29210 lt!145892) #b01111111111111111111111111111110) (bvsge (x!29210 lt!145892) #b00000000000000000000000000000000) (bvsge (x!29210 lt!145892) #b00000000000000000000000000000000)))))

(assert (=> b!294351 (=> (not res!154735) (not e!186086))))

(declare-fun b!294352 () Bool)

(declare-fun e!186088 () SeekEntryResult!2212)

(assert (=> b!294352 (= e!186088 (Intermediate!2212 false lt!145815 #b00000000000000000000000000000000))))

(declare-fun b!294353 () Bool)

(assert (=> b!294353 (and (bvsge (index!11020 lt!145892) #b00000000000000000000000000000000) (bvslt (index!11020 lt!145892) (size!7415 a!3312)))))

(declare-fun res!154736 () Bool)

(assert (=> b!294353 (= res!154736 (= (select (arr!7063 a!3312) (index!11020 lt!145892)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186087 () Bool)

(assert (=> b!294353 (=> res!154736 e!186087)))

(declare-fun b!294354 () Bool)

(declare-fun e!186084 () SeekEntryResult!2212)

(assert (=> b!294354 (= e!186084 e!186088)))

(declare-fun c!47381 () Bool)

(declare-fun lt!145893 () (_ BitVec 64))

(assert (=> b!294354 (= c!47381 (or (= lt!145893 k!2524) (= (bvadd lt!145893 lt!145893) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!66787 () Bool)

(assert (=> d!66787 e!186085))

(declare-fun c!47382 () Bool)

(assert (=> d!66787 (= c!47382 (and (is-Intermediate!2212 lt!145892) (undefined!3024 lt!145892)))))

(assert (=> d!66787 (= lt!145892 e!186084)))

(declare-fun c!47380 () Bool)

(assert (=> d!66787 (= c!47380 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66787 (= lt!145893 (select (arr!7063 a!3312) lt!145815))))

(assert (=> d!66787 (validMask!0 mask!3809)))

(assert (=> d!66787 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145815 k!2524 a!3312 mask!3809) lt!145892)))

(declare-fun b!294355 () Bool)

(assert (=> b!294355 (= e!186085 (bvsge (x!29210 lt!145892) #b01111111111111111111111111111110))))

(declare-fun b!294356 () Bool)

(assert (=> b!294356 (and (bvsge (index!11020 lt!145892) #b00000000000000000000000000000000) (bvslt (index!11020 lt!145892) (size!7415 a!3312)))))

(assert (=> b!294356 (= e!186087 (= (select (arr!7063 a!3312) (index!11020 lt!145892)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294357 () Bool)

(assert (=> b!294357 (= e!186084 (Intermediate!2212 true lt!145815 #b00000000000000000000000000000000))))

(declare-fun b!294358 () Bool)

(assert (=> b!294358 (and (bvsge (index!11020 lt!145892) #b00000000000000000000000000000000) (bvslt (index!11020 lt!145892) (size!7415 a!3312)))))

(declare-fun res!154734 () Bool)

(assert (=> b!294358 (= res!154734 (= (select (arr!7063 a!3312) (index!11020 lt!145892)) k!2524))))

(assert (=> b!294358 (=> res!154734 e!186087)))

(assert (=> b!294358 (= e!186086 e!186087)))

(declare-fun b!294359 () Bool)

(assert (=> b!294359 (= e!186088 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145815 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(assert (= (and d!66787 c!47380) b!294357))

(assert (= (and d!66787 (not c!47380)) b!294354))

(assert (= (and b!294354 c!47381) b!294352))

(assert (= (and b!294354 (not c!47381)) b!294359))

(assert (= (and d!66787 c!47382) b!294355))

(assert (= (and d!66787 (not c!47382)) b!294351))

(assert (= (and b!294351 res!154735) b!294358))

(assert (= (and b!294358 (not res!154734)) b!294353))

(assert (= (and b!294353 (not res!154736)) b!294356))

(assert (=> b!294359 m!307821))

(assert (=> b!294359 m!307821))

(declare-fun m!307829 () Bool)

(assert (=> b!294359 m!307829))

(declare-fun m!307831 () Bool)

(assert (=> b!294356 m!307831))

(assert (=> b!294358 m!307831))

(declare-fun m!307833 () Bool)

(assert (=> d!66787 m!307833))

(assert (=> d!66787 m!307721))

(assert (=> b!294353 m!307831))

(assert (=> b!294150 d!66787))

(declare-fun d!66789 () Bool)

(declare-fun lt!145905 () (_ BitVec 32))

(declare-fun lt!145904 () (_ BitVec 32))

(assert (=> d!66789 (= lt!145905 (bvmul (bvxor lt!145904 (bvlshr lt!145904 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66789 (= lt!145904 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66789 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154737 (let ((h!5279 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29216 (bvmul (bvxor h!5279 (bvlshr h!5279 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29216 (bvlshr x!29216 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154737 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154737 #b00000000000000000000000000000000))))))

(assert (=> d!66789 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!145905 (bvlshr lt!145905 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294150 d!66789))

(push 1)

(assert (not b!294221))

(assert (not b!294359))

(assert (not b!294348))

(assert (not d!66741))

(assert (not d!66773))

(assert (not b!294249))

(assert (not bm!25690))

(assert (not b!294248))

(assert (not d!66787))

(assert (not b!294188))

