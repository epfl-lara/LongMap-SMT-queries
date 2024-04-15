; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28956 () Bool)

(assert start!28956)

(declare-fun b!294443 () Bool)

(declare-fun res!154807 () Bool)

(declare-fun e!186122 () Bool)

(assert (=> b!294443 (=> (not res!154807) (not e!186122))))

(declare-datatypes ((array!14897 0))(
  ( (array!14898 (arr!7064 (Array (_ BitVec 32) (_ BitVec 64))) (size!7417 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14897)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14897 (_ BitVec 32)) Bool)

(assert (=> b!294443 (= res!154807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!294444 () Bool)

(declare-fun res!154806 () Bool)

(declare-fun e!186124 () Bool)

(assert (=> b!294444 (=> (not res!154806) (not e!186124))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294444 (= res!154806 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!294445 () Bool)

(declare-fun res!154805 () Bool)

(assert (=> b!294445 (=> (not res!154805) (not e!186124))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!294445 (= res!154805 (and (= (size!7417 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7417 a!3312))))))

(declare-datatypes ((SeekEntryResult!2212 0))(
  ( (MissingZero!2212 (index!11018 (_ BitVec 32))) (Found!2212 (index!11019 (_ BitVec 32))) (Intermediate!2212 (undefined!3024 Bool) (index!11020 (_ BitVec 32)) (x!29234 (_ BitVec 32))) (Undefined!2212) (MissingVacant!2212 (index!11021 (_ BitVec 32))) )
))
(declare-fun lt!145878 () SeekEntryResult!2212)

(declare-fun b!294446 () Bool)

(declare-fun lt!145874 () Bool)

(assert (=> b!294446 (= e!186122 (and lt!145874 (let ((bdg!6241 (not (is-Intermediate!2212 lt!145878)))) (and (or bdg!6241 (not (undefined!3024 lt!145878))) (or bdg!6241 (not (= (select (arr!7064 a!3312) (index!11020 lt!145878)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or bdg!6241 (not (= (select (arr!7064 a!3312) (index!11020 lt!145878)) k!2524))) (not bdg!6241) (or (bvslt (index!11020 lt!145878) #b00000000000000000000000000000000) (bvsge (index!11020 lt!145878) (size!7417 a!3312)))))))))

(declare-fun lt!145877 () (_ BitVec 32))

(declare-fun lt!145875 () SeekEntryResult!2212)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14897 (_ BitVec 32)) SeekEntryResult!2212)

(assert (=> b!294446 (= lt!145875 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145877 k!2524 (array!14898 (store (arr!7064 a!3312) i!1256 k!2524) (size!7417 a!3312)) mask!3809))))

(assert (=> b!294446 (= lt!145878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145877 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294446 (= lt!145877 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!154803 () Bool)

(assert (=> start!28956 (=> (not res!154803) (not e!186124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28956 (= res!154803 (validMask!0 mask!3809))))

(assert (=> start!28956 e!186124))

(assert (=> start!28956 true))

(declare-fun array_inv!5036 (array!14897) Bool)

(assert (=> start!28956 (array_inv!5036 a!3312)))

(declare-fun b!294447 () Bool)

(declare-fun res!154802 () Bool)

(assert (=> b!294447 (=> (not res!154802) (not e!186124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294447 (= res!154802 (validKeyInArray!0 k!2524))))

(declare-fun b!294448 () Bool)

(assert (=> b!294448 (= e!186124 e!186122)))

(declare-fun res!154804 () Bool)

(assert (=> b!294448 (=> (not res!154804) (not e!186122))))

(declare-fun lt!145876 () SeekEntryResult!2212)

(assert (=> b!294448 (= res!154804 (or lt!145874 (= lt!145876 (MissingVacant!2212 i!1256))))))

(assert (=> b!294448 (= lt!145874 (= lt!145876 (MissingZero!2212 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14897 (_ BitVec 32)) SeekEntryResult!2212)

(assert (=> b!294448 (= lt!145876 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28956 res!154803) b!294445))

(assert (= (and b!294445 res!154805) b!294447))

(assert (= (and b!294447 res!154802) b!294444))

(assert (= (and b!294444 res!154806) b!294448))

(assert (= (and b!294448 res!154804) b!294443))

(assert (= (and b!294443 res!154807) b!294446))

(declare-fun m!307379 () Bool)

(assert (=> b!294448 m!307379))

(declare-fun m!307381 () Bool)

(assert (=> start!28956 m!307381))

(declare-fun m!307383 () Bool)

(assert (=> start!28956 m!307383))

(declare-fun m!307385 () Bool)

(assert (=> b!294443 m!307385))

(declare-fun m!307387 () Bool)

(assert (=> b!294444 m!307387))

(declare-fun m!307389 () Bool)

(assert (=> b!294447 m!307389))

(declare-fun m!307391 () Bool)

(assert (=> b!294446 m!307391))

(declare-fun m!307393 () Bool)

(assert (=> b!294446 m!307393))

(declare-fun m!307395 () Bool)

(assert (=> b!294446 m!307395))

(declare-fun m!307397 () Bool)

(assert (=> b!294446 m!307397))

(declare-fun m!307399 () Bool)

(assert (=> b!294446 m!307399))

(push 1)

(assert (not b!294443))

(assert (not b!294446))

(assert (not start!28956))

(assert (not b!294444))

(assert (not b!294447))

(assert (not b!294448))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!294493 () Bool)

(declare-fun e!186153 () Bool)

(declare-fun e!186154 () Bool)

(assert (=> b!294493 (= e!186153 e!186154)))

(declare-fun c!47408 () Bool)

(assert (=> b!294493 (= c!47408 (validKeyInArray!0 (select (arr!7064 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!294494 () Bool)

(declare-fun e!186155 () Bool)

(declare-fun call!25685 () Bool)

(assert (=> b!294494 (= e!186155 call!25685)))

(declare-fun bm!25682 () Bool)

(assert (=> bm!25682 (= call!25685 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!294495 () Bool)

(assert (=> b!294495 (= e!186154 e!186155)))

(declare-fun lt!145901 () (_ BitVec 64))

(assert (=> b!294495 (= lt!145901 (select (arr!7064 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9162 0))(
  ( (Unit!9163) )
))
(declare-fun lt!145900 () Unit!9162)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14897 (_ BitVec 64) (_ BitVec 32)) Unit!9162)

(assert (=> b!294495 (= lt!145900 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145901 #b00000000000000000000000000000000))))

(assert (=> b!294495 (arrayContainsKey!0 a!3312 lt!145901 #b00000000000000000000000000000000)))

(declare-fun lt!145899 () Unit!9162)

(assert (=> b!294495 (= lt!145899 lt!145900)))

(declare-fun res!154828 () Bool)

(assert (=> b!294495 (= res!154828 (= (seekEntryOrOpen!0 (select (arr!7064 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2212 #b00000000000000000000000000000000)))))

(assert (=> b!294495 (=> (not res!154828) (not e!186155))))

(declare-fun b!294496 () Bool)

(assert (=> b!294496 (= e!186154 call!25685)))

(declare-fun d!66667 () Bool)

(declare-fun res!154827 () Bool)

(assert (=> d!66667 (=> res!154827 e!186153)))

(assert (=> d!66667 (= res!154827 (bvsge #b00000000000000000000000000000000 (size!7417 a!3312)))))

(assert (=> d!66667 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186153)))

(assert (= (and d!66667 (not res!154827)) b!294493))

(assert (= (and b!294493 c!47408) b!294495))

(assert (= (and b!294493 (not c!47408)) b!294496))

(assert (= (and b!294495 res!154828) b!294494))

(assert (= (or b!294494 b!294496) bm!25682))

(declare-fun m!307415 () Bool)

(assert (=> b!294493 m!307415))

(assert (=> b!294493 m!307415))

(declare-fun m!307417 () Bool)

(assert (=> b!294493 m!307417))

(declare-fun m!307419 () Bool)

(assert (=> bm!25682 m!307419))

(assert (=> b!294495 m!307415))

(declare-fun m!307421 () Bool)

(assert (=> b!294495 m!307421))

(declare-fun m!307423 () Bool)

(assert (=> b!294495 m!307423))

(assert (=> b!294495 m!307415))

(declare-fun m!307425 () Bool)

(assert (=> b!294495 m!307425))

(assert (=> b!294443 d!66667))

(declare-fun d!66671 () Bool)

(declare-fun res!154835 () Bool)

(declare-fun e!186164 () Bool)

(assert (=> d!66671 (=> res!154835 e!186164)))

(assert (=> d!66671 (= res!154835 (= (select (arr!7064 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66671 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!186164)))

(declare-fun b!294509 () Bool)

(declare-fun e!186165 () Bool)

(assert (=> b!294509 (= e!186164 e!186165)))

(declare-fun res!154836 () Bool)

(assert (=> b!294509 (=> (not res!154836) (not e!186165))))

(assert (=> b!294509 (= res!154836 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7417 a!3312)))))

(declare-fun b!294510 () Bool)

(assert (=> b!294510 (= e!186165 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66671 (not res!154835)) b!294509))

(assert (= (and b!294509 res!154836) b!294510))

(assert (=> d!66671 m!307415))

(declare-fun m!307427 () Bool)

(assert (=> b!294510 m!307427))

(assert (=> b!294444 d!66671))

(declare-fun lt!145930 () SeekEntryResult!2212)

(declare-fun b!294577 () Bool)

(assert (=> b!294577 (and (bvsge (index!11020 lt!145930) #b00000000000000000000000000000000) (bvslt (index!11020 lt!145930) (size!7417 (array!14898 (store (arr!7064 a!3312) i!1256 k!2524) (size!7417 a!3312)))))))

(declare-fun e!186207 () Bool)

(assert (=> b!294577 (= e!186207 (= (select (arr!7064 (array!14898 (store (arr!7064 a!3312) i!1256 k!2524) (size!7417 a!3312))) (index!11020 lt!145930)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294578 () Bool)

(declare-fun e!186209 () SeekEntryResult!2212)

(assert (=> b!294578 (= e!186209 (Intermediate!2212 false lt!145877 #b00000000000000000000000000000000))))

(declare-fun b!294580 () Bool)

(assert (=> b!294580 (and (bvsge (index!11020 lt!145930) #b00000000000000000000000000000000) (bvslt (index!11020 lt!145930) (size!7417 (array!14898 (store (arr!7064 a!3312) i!1256 k!2524) (size!7417 a!3312)))))))

(declare-fun res!154867 () Bool)

(assert (=> b!294580 (= res!154867 (= (select (arr!7064 (array!14898 (store (arr!7064 a!3312) i!1256 k!2524) (size!7417 a!3312))) (index!11020 lt!145930)) k!2524))))

(assert (=> b!294580 (=> res!154867 e!186207)))

(declare-fun e!186210 () Bool)

(assert (=> b!294580 (= e!186210 e!186207)))

(declare-fun d!66673 () Bool)

(declare-fun e!186208 () Bool)

(assert (=> d!66673 e!186208))

(declare-fun c!47431 () Bool)

(assert (=> d!66673 (= c!47431 (and (is-Intermediate!2212 lt!145930) (undefined!3024 lt!145930)))))

(declare-fun e!186211 () SeekEntryResult!2212)

(assert (=> d!66673 (= lt!145930 e!186211)))

(declare-fun c!47430 () Bool)

(assert (=> d!66673 (= c!47430 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145929 () (_ BitVec 64))

(assert (=> d!66673 (= lt!145929 (select (arr!7064 (array!14898 (store (arr!7064 a!3312) i!1256 k!2524) (size!7417 a!3312))) lt!145877))))

(assert (=> d!66673 (validMask!0 mask!3809)))

(assert (=> d!66673 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145877 k!2524 (array!14898 (store (arr!7064 a!3312) i!1256 k!2524) (size!7417 a!3312)) mask!3809) lt!145930)))

(declare-fun b!294581 () Bool)

(assert (=> b!294581 (= e!186208 (bvsge (x!29234 lt!145930) #b01111111111111111111111111111110))))

(declare-fun b!294582 () Bool)

(assert (=> b!294582 (= e!186208 e!186210)))

(declare-fun res!154866 () Bool)

(assert (=> b!294582 (= res!154866 (and (is-Intermediate!2212 lt!145930) (not (undefined!3024 lt!145930)) (bvslt (x!29234 lt!145930) #b01111111111111111111111111111110) (bvsge (x!29234 lt!145930) #b00000000000000000000000000000000) (bvsge (x!29234 lt!145930) #b00000000000000000000000000000000)))))

(assert (=> b!294582 (=> (not res!154866) (not e!186210))))

(declare-fun b!294583 () Bool)

(assert (=> b!294583 (and (bvsge (index!11020 lt!145930) #b00000000000000000000000000000000) (bvslt (index!11020 lt!145930) (size!7417 (array!14898 (store (arr!7064 a!3312) i!1256 k!2524) (size!7417 a!3312)))))))

(declare-fun res!154868 () Bool)

(assert (=> b!294583 (= res!154868 (= (select (arr!7064 (array!14898 (store (arr!7064 a!3312) i!1256 k!2524) (size!7417 a!3312))) (index!11020 lt!145930)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294583 (=> res!154868 e!186207)))

(declare-fun b!294585 () Bool)

(assert (=> b!294585 (= e!186211 (Intermediate!2212 true lt!145877 #b00000000000000000000000000000000))))

(declare-fun b!294586 () Bool)

(assert (=> b!294586 (= e!186211 e!186209)))

(declare-fun c!47432 () Bool)

(assert (=> b!294586 (= c!47432 (or (= lt!145929 k!2524) (= (bvadd lt!145929 lt!145929) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294587 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294587 (= e!186209 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145877 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14898 (store (arr!7064 a!3312) i!1256 k!2524) (size!7417 a!3312)) mask!3809))))

(assert (= (and d!66673 c!47430) b!294585))

(assert (= (and d!66673 (not c!47430)) b!294586))

(assert (= (and b!294586 c!47432) b!294578))

(assert (= (and b!294586 (not c!47432)) b!294587))

(assert (= (and d!66673 c!47431) b!294581))

(assert (= (and d!66673 (not c!47431)) b!294582))

(assert (= (and b!294582 res!154866) b!294580))

(assert (= (and b!294580 (not res!154867)) b!294583))

(assert (= (and b!294583 (not res!154868)) b!294577))

(declare-fun m!307457 () Bool)

(assert (=> d!66673 m!307457))

(assert (=> d!66673 m!307381))

(declare-fun m!307459 () Bool)

(assert (=> b!294583 m!307459))

(declare-fun m!307461 () Bool)

(assert (=> b!294587 m!307461))

(assert (=> b!294587 m!307461))

(declare-fun m!307463 () Bool)

(assert (=> b!294587 m!307463))

(assert (=> b!294580 m!307459))

(assert (=> b!294577 m!307459))

(assert (=> b!294446 d!66673))

(declare-fun b!294592 () Bool)

(declare-fun lt!145938 () SeekEntryResult!2212)

(assert (=> b!294592 (and (bvsge (index!11020 lt!145938) #b00000000000000000000000000000000) (bvslt (index!11020 lt!145938) (size!7417 a!3312)))))

(declare-fun e!186216 () Bool)

(assert (=> b!294592 (= e!186216 (= (select (arr!7064 a!3312) (index!11020 lt!145938)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294593 () Bool)

(declare-fun e!186218 () SeekEntryResult!2212)

(assert (=> b!294593 (= e!186218 (Intermediate!2212 false lt!145877 #b00000000000000000000000000000000))))

(declare-fun b!294594 () Bool)

(assert (=> b!294594 (and (bvsge (index!11020 lt!145938) #b00000000000000000000000000000000) (bvslt (index!11020 lt!145938) (size!7417 a!3312)))))

(declare-fun res!154872 () Bool)

(assert (=> b!294594 (= res!154872 (= (select (arr!7064 a!3312) (index!11020 lt!145938)) k!2524))))

(assert (=> b!294594 (=> res!154872 e!186216)))

(declare-fun e!186219 () Bool)

(assert (=> b!294594 (= e!186219 e!186216)))

(declare-fun d!66691 () Bool)

(declare-fun e!186217 () Bool)

(assert (=> d!66691 e!186217))

(declare-fun c!47436 () Bool)

(assert (=> d!66691 (= c!47436 (and (is-Intermediate!2212 lt!145938) (undefined!3024 lt!145938)))))

(declare-fun e!186220 () SeekEntryResult!2212)

(assert (=> d!66691 (= lt!145938 e!186220)))

(declare-fun c!47435 () Bool)

(assert (=> d!66691 (= c!47435 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145937 () (_ BitVec 64))

(assert (=> d!66691 (= lt!145937 (select (arr!7064 a!3312) lt!145877))))

(assert (=> d!66691 (validMask!0 mask!3809)))

(assert (=> d!66691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145877 k!2524 a!3312 mask!3809) lt!145938)))

(declare-fun b!294595 () Bool)

(assert (=> b!294595 (= e!186217 (bvsge (x!29234 lt!145938) #b01111111111111111111111111111110))))

(declare-fun b!294596 () Bool)

(assert (=> b!294596 (= e!186217 e!186219)))

(declare-fun res!154871 () Bool)

(assert (=> b!294596 (= res!154871 (and (is-Intermediate!2212 lt!145938) (not (undefined!3024 lt!145938)) (bvslt (x!29234 lt!145938) #b01111111111111111111111111111110) (bvsge (x!29234 lt!145938) #b00000000000000000000000000000000) (bvsge (x!29234 lt!145938) #b00000000000000000000000000000000)))))

(assert (=> b!294596 (=> (not res!154871) (not e!186219))))

(declare-fun b!294597 () Bool)

(assert (=> b!294597 (and (bvsge (index!11020 lt!145938) #b00000000000000000000000000000000) (bvslt (index!11020 lt!145938) (size!7417 a!3312)))))

(declare-fun res!154873 () Bool)

(assert (=> b!294597 (= res!154873 (= (select (arr!7064 a!3312) (index!11020 lt!145938)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294597 (=> res!154873 e!186216)))

(declare-fun b!294598 () Bool)

(assert (=> b!294598 (= e!186220 (Intermediate!2212 true lt!145877 #b00000000000000000000000000000000))))

(declare-fun b!294599 () Bool)

(assert (=> b!294599 (= e!186220 e!186218)))

(declare-fun c!47437 () Bool)

(assert (=> b!294599 (= c!47437 (or (= lt!145937 k!2524) (= (bvadd lt!145937 lt!145937) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294600 () Bool)

(assert (=> b!294600 (= e!186218 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145877 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(assert (= (and d!66691 c!47435) b!294598))

(assert (= (and d!66691 (not c!47435)) b!294599))

(assert (= (and b!294599 c!47437) b!294593))

(assert (= (and b!294599 (not c!47437)) b!294600))

(assert (= (and d!66691 c!47436) b!294595))

(assert (= (and d!66691 (not c!47436)) b!294596))

(assert (= (and b!294596 res!154871) b!294594))

(assert (= (and b!294594 (not res!154872)) b!294597))

(assert (= (and b!294597 (not res!154873)) b!294592))

(declare-fun m!307465 () Bool)

(assert (=> d!66691 m!307465))

(assert (=> d!66691 m!307381))

(declare-fun m!307467 () Bool)

(assert (=> b!294597 m!307467))

(assert (=> b!294600 m!307461))

(assert (=> b!294600 m!307461))

(declare-fun m!307469 () Bool)

(assert (=> b!294600 m!307469))

(assert (=> b!294594 m!307467))

(assert (=> b!294592 m!307467))

(assert (=> b!294446 d!66691))

(declare-fun d!66693 () Bool)

(declare-fun lt!145947 () (_ BitVec 32))

(declare-fun lt!145946 () (_ BitVec 32))

(assert (=> d!66693 (= lt!145947 (bvmul (bvxor lt!145946 (bvlshr lt!145946 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66693 (= lt!145946 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66693 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154874 (let ((h!5253 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29240 (bvmul (bvxor h!5253 (bvlshr h!5253 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29240 (bvlshr x!29240 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154874 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154874 #b00000000000000000000000000000000))))))

(assert (=> d!66693 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!145947 (bvlshr lt!145947 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294446 d!66693))

(declare-fun d!66697 () Bool)

(assert (=> d!66697 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28956 d!66697))

(declare-fun d!66699 () Bool)

(assert (=> d!66699 (= (array_inv!5036 a!3312) (bvsge (size!7417 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28956 d!66699))

(declare-fun d!66701 () Bool)

(assert (=> d!66701 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294447 d!66701))

(declare-fun b!294659 () Bool)

(declare-fun e!186256 () SeekEntryResult!2212)

(declare-fun e!186255 () SeekEntryResult!2212)

(assert (=> b!294659 (= e!186256 e!186255)))

(declare-fun lt!145973 () (_ BitVec 64))

(declare-fun lt!145972 () SeekEntryResult!2212)

(assert (=> b!294659 (= lt!145973 (select (arr!7064 a!3312) (index!11020 lt!145972)))))

(declare-fun c!47463 () Bool)

(assert (=> b!294659 (= c!47463 (= lt!145973 k!2524))))

(declare-fun d!66703 () Bool)

(declare-fun lt!145974 () SeekEntryResult!2212)

(assert (=> d!66703 (and (or (is-Undefined!2212 lt!145974) (not (is-Found!2212 lt!145974)) (and (bvsge (index!11019 lt!145974) #b00000000000000000000000000000000) (bvslt (index!11019 lt!145974) (size!7417 a!3312)))) (or (is-Undefined!2212 lt!145974) (is-Found!2212 lt!145974) (not (is-MissingZero!2212 lt!145974)) (and (bvsge (index!11018 lt!145974) #b00000000000000000000000000000000) (bvslt (index!11018 lt!145974) (size!7417 a!3312)))) (or (is-Undefined!2212 lt!145974) (is-Found!2212 lt!145974) (is-MissingZero!2212 lt!145974) (not (is-MissingVacant!2212 lt!145974)) (and (bvsge (index!11021 lt!145974) #b00000000000000000000000000000000) (bvslt (index!11021 lt!145974) (size!7417 a!3312)))) (or (is-Undefined!2212 lt!145974) (ite (is-Found!2212 lt!145974) (= (select (arr!7064 a!3312) (index!11019 lt!145974)) k!2524) (ite (is-MissingZero!2212 lt!145974) (= (select (arr!7064 a!3312) (index!11018 lt!145974)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2212 lt!145974) (= (select (arr!7064 a!3312) (index!11021 lt!145974)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66703 (= lt!145974 e!186256)))

(declare-fun c!47465 () Bool)

(assert (=> d!66703 (= c!47465 (and (is-Intermediate!2212 lt!145972) (undefined!3024 lt!145972)))))

(assert (=> d!66703 (= lt!145972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66703 (validMask!0 mask!3809)))

(assert (=> d!66703 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!145974)))

(declare-fun b!294660 () Bool)

(assert (=> b!294660 (= e!186256 Undefined!2212)))

(declare-fun b!294661 () Bool)

(declare-fun c!47464 () Bool)

(assert (=> b!294661 (= c!47464 (= lt!145973 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!186254 () SeekEntryResult!2212)

(assert (=> b!294661 (= e!186255 e!186254)))

(declare-fun b!294662 () Bool)

(assert (=> b!294662 (= e!186255 (Found!2212 (index!11020 lt!145972)))))

(declare-fun b!294663 () Bool)

(assert (=> b!294663 (= e!186254 (MissingZero!2212 (index!11020 lt!145972)))))

(declare-fun b!294664 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14897 (_ BitVec 32)) SeekEntryResult!2212)

(assert (=> b!294664 (= e!186254 (seekKeyOrZeroReturnVacant!0 (x!29234 lt!145972) (index!11020 lt!145972) (index!11020 lt!145972) k!2524 a!3312 mask!3809))))

(assert (= (and d!66703 c!47465) b!294660))

(assert (= (and d!66703 (not c!47465)) b!294659))

(assert (= (and b!294659 c!47463) b!294662))

(assert (= (and b!294659 (not c!47463)) b!294661))

(assert (= (and b!294661 c!47464) b!294663))

(assert (= (and b!294661 (not c!47464)) b!294664))

(declare-fun m!307509 () Bool)

(assert (=> b!294659 m!307509))

(declare-fun m!307511 () Bool)

(assert (=> d!66703 m!307511))

(assert (=> d!66703 m!307399))

(declare-fun m!307513 () Bool)

(assert (=> d!66703 m!307513))

(declare-fun m!307515 () Bool)

(assert (=> d!66703 m!307515))

(declare-fun m!307517 () Bool)

(assert (=> d!66703 m!307517))

(assert (=> d!66703 m!307381))

(assert (=> d!66703 m!307399))

(declare-fun m!307519 () Bool)

(assert (=> b!294664 m!307519))

(assert (=> b!294448 d!66703))

(push 1)

(assert (not b!294664))

(assert (not d!66691))

(assert (not b!294493))

(assert (not d!66703))

(assert (not b!294587))

(assert (not b!294495))

(assert (not b!294600))

(assert (not bm!25682))

(assert (not d!66673))

(assert (not b!294510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

