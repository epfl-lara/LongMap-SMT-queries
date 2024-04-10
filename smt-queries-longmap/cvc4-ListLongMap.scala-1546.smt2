; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29258 () Bool)

(assert start!29258)

(declare-fun b!296686 () Bool)

(declare-fun e!187509 () Bool)

(declare-fun e!187512 () Bool)

(assert (=> b!296686 (= e!187509 e!187512)))

(declare-fun res!156354 () Bool)

(assert (=> b!296686 (=> (not res!156354) (not e!187512))))

(declare-fun lt!147337 () Bool)

(assert (=> b!296686 (= res!156354 lt!147337)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2266 0))(
  ( (MissingZero!2266 (index!11234 (_ BitVec 32))) (Found!2266 (index!11235 (_ BitVec 32))) (Intermediate!2266 (undefined!3078 Bool) (index!11236 (_ BitVec 32)) (x!29444 (_ BitVec 32))) (Undefined!2266) (MissingVacant!2266 (index!11237 (_ BitVec 32))) )
))
(declare-fun lt!147339 () SeekEntryResult!2266)

(declare-datatypes ((array!15016 0))(
  ( (array!15017 (arr!7117 (Array (_ BitVec 32) (_ BitVec 64))) (size!7469 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15016)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun lt!147336 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15016 (_ BitVec 32)) SeekEntryResult!2266)

(assert (=> b!296686 (= lt!147339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147336 k!2524 (array!15017 (store (arr!7117 a!3312) i!1256 k!2524) (size!7469 a!3312)) mask!3809))))

(declare-fun lt!147338 () SeekEntryResult!2266)

(assert (=> b!296686 (= lt!147338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147336 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296686 (= lt!147336 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!296687 () Bool)

(declare-fun res!156357 () Bool)

(declare-fun e!187510 () Bool)

(assert (=> b!296687 (=> (not res!156357) (not e!187510))))

(assert (=> b!296687 (= res!156357 (and (= (size!7469 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7469 a!3312))))))

(declare-fun res!156356 () Bool)

(assert (=> start!29258 (=> (not res!156356) (not e!187510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29258 (= res!156356 (validMask!0 mask!3809))))

(assert (=> start!29258 e!187510))

(assert (=> start!29258 true))

(declare-fun array_inv!5080 (array!15016) Bool)

(assert (=> start!29258 (array_inv!5080 a!3312)))

(declare-fun b!296688 () Bool)

(declare-fun res!156353 () Bool)

(assert (=> b!296688 (=> (not res!156353) (not e!187510))))

(declare-fun arrayContainsKey!0 (array!15016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296688 (= res!156353 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296689 () Bool)

(declare-fun res!156360 () Bool)

(assert (=> b!296689 (=> (not res!156360) (not e!187510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296689 (= res!156360 (validKeyInArray!0 k!2524))))

(declare-fun e!187511 () Bool)

(declare-fun b!296690 () Bool)

(assert (=> b!296690 (= e!187511 (not (or (not (= lt!147338 (Intermediate!2266 false (index!11236 lt!147338) (x!29444 lt!147338)))) (bvsgt #b00000000000000000000000000000000 (x!29444 lt!147338)) (and (bvsge lt!147336 #b00000000000000000000000000000000) (bvslt lt!147336 (size!7469 a!3312))))))))

(assert (=> b!296690 (and (= (select (arr!7117 a!3312) (index!11236 lt!147338)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11236 lt!147338) i!1256))))

(declare-fun b!296691 () Bool)

(declare-fun res!156355 () Bool)

(assert (=> b!296691 (=> (not res!156355) (not e!187509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15016 (_ BitVec 32)) Bool)

(assert (=> b!296691 (= res!156355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296692 () Bool)

(assert (=> b!296692 (= e!187510 e!187509)))

(declare-fun res!156358 () Bool)

(assert (=> b!296692 (=> (not res!156358) (not e!187509))))

(declare-fun lt!147335 () SeekEntryResult!2266)

(assert (=> b!296692 (= res!156358 (or lt!147337 (= lt!147335 (MissingVacant!2266 i!1256))))))

(assert (=> b!296692 (= lt!147337 (= lt!147335 (MissingZero!2266 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15016 (_ BitVec 32)) SeekEntryResult!2266)

(assert (=> b!296692 (= lt!147335 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!296693 () Bool)

(assert (=> b!296693 (= e!187512 e!187511)))

(declare-fun res!156359 () Bool)

(assert (=> b!296693 (=> (not res!156359) (not e!187511))))

(declare-fun lt!147334 () Bool)

(assert (=> b!296693 (= res!156359 (and (or lt!147334 (not (undefined!3078 lt!147338))) (or lt!147334 (not (= (select (arr!7117 a!3312) (index!11236 lt!147338)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147334 (not (= (select (arr!7117 a!3312) (index!11236 lt!147338)) k!2524))) (not lt!147334)))))

(assert (=> b!296693 (= lt!147334 (not (is-Intermediate!2266 lt!147338)))))

(assert (= (and start!29258 res!156356) b!296687))

(assert (= (and b!296687 res!156357) b!296689))

(assert (= (and b!296689 res!156360) b!296688))

(assert (= (and b!296688 res!156353) b!296692))

(assert (= (and b!296692 res!156358) b!296691))

(assert (= (and b!296691 res!156355) b!296686))

(assert (= (and b!296686 res!156354) b!296693))

(assert (= (and b!296693 res!156359) b!296690))

(declare-fun m!309611 () Bool)

(assert (=> b!296689 m!309611))

(declare-fun m!309613 () Bool)

(assert (=> b!296686 m!309613))

(declare-fun m!309615 () Bool)

(assert (=> b!296686 m!309615))

(declare-fun m!309617 () Bool)

(assert (=> b!296686 m!309617))

(declare-fun m!309619 () Bool)

(assert (=> b!296686 m!309619))

(declare-fun m!309621 () Bool)

(assert (=> b!296688 m!309621))

(declare-fun m!309623 () Bool)

(assert (=> start!29258 m!309623))

(declare-fun m!309625 () Bool)

(assert (=> start!29258 m!309625))

(declare-fun m!309627 () Bool)

(assert (=> b!296693 m!309627))

(assert (=> b!296690 m!309627))

(declare-fun m!309629 () Bool)

(assert (=> b!296691 m!309629))

(declare-fun m!309631 () Bool)

(assert (=> b!296692 m!309631))

(push 1)

(assert (not b!296689))

(assert (not start!29258))

(assert (not b!296692))

(assert (not b!296686))

(assert (not b!296691))

(assert (not b!296688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!67101 () Bool)

(assert (=> d!67101 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!296689 d!67101))

(declare-fun b!296756 () Bool)

(declare-fun e!187556 () Bool)

(declare-fun call!25750 () Bool)

(assert (=> b!296756 (= e!187556 call!25750)))

(declare-fun bm!25747 () Bool)

(assert (=> bm!25747 (= call!25750 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!296757 () Bool)

(declare-fun e!187557 () Bool)

(assert (=> b!296757 (= e!187557 e!187556)))

(declare-fun lt!147370 () (_ BitVec 64))

(assert (=> b!296757 (= lt!147370 (select (arr!7117 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9234 0))(
  ( (Unit!9235) )
))
(declare-fun lt!147371 () Unit!9234)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15016 (_ BitVec 64) (_ BitVec 32)) Unit!9234)

(assert (=> b!296757 (= lt!147371 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!147370 #b00000000000000000000000000000000))))

(assert (=> b!296757 (arrayContainsKey!0 a!3312 lt!147370 #b00000000000000000000000000000000)))

(declare-fun lt!147369 () Unit!9234)

(assert (=> b!296757 (= lt!147369 lt!147371)))

(declare-fun res!156390 () Bool)

(assert (=> b!296757 (= res!156390 (= (seekEntryOrOpen!0 (select (arr!7117 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2266 #b00000000000000000000000000000000)))))

(assert (=> b!296757 (=> (not res!156390) (not e!187556))))

(declare-fun b!296758 () Bool)

(assert (=> b!296758 (= e!187557 call!25750)))

(declare-fun b!296759 () Bool)

(declare-fun e!187555 () Bool)

(assert (=> b!296759 (= e!187555 e!187557)))

(declare-fun c!47763 () Bool)

(assert (=> b!296759 (= c!47763 (validKeyInArray!0 (select (arr!7117 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67103 () Bool)

(declare-fun res!156391 () Bool)

(assert (=> d!67103 (=> res!156391 e!187555)))

(assert (=> d!67103 (= res!156391 (bvsge #b00000000000000000000000000000000 (size!7469 a!3312)))))

(assert (=> d!67103 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!187555)))

(assert (= (and d!67103 (not res!156391)) b!296759))

(assert (= (and b!296759 c!47763) b!296757))

(assert (= (and b!296759 (not c!47763)) b!296758))

(assert (= (and b!296757 res!156390) b!296756))

(assert (= (or b!296756 b!296758) bm!25747))

(declare-fun m!309661 () Bool)

(assert (=> bm!25747 m!309661))

(declare-fun m!309663 () Bool)

(assert (=> b!296757 m!309663))

(declare-fun m!309665 () Bool)

(assert (=> b!296757 m!309665))

(declare-fun m!309667 () Bool)

(assert (=> b!296757 m!309667))

(assert (=> b!296757 m!309663))

(declare-fun m!309669 () Bool)

(assert (=> b!296757 m!309669))

(assert (=> b!296759 m!309663))

(assert (=> b!296759 m!309663))

(declare-fun m!309671 () Bool)

(assert (=> b!296759 m!309671))

(assert (=> b!296691 d!67103))

(declare-fun b!296826 () Bool)

(declare-fun e!187596 () SeekEntryResult!2266)

(declare-fun lt!147400 () SeekEntryResult!2266)

(assert (=> b!296826 (= e!187596 (Found!2266 (index!11236 lt!147400)))))

(declare-fun b!296827 () Bool)

(declare-fun e!187598 () SeekEntryResult!2266)

(assert (=> b!296827 (= e!187598 Undefined!2266)))

(declare-fun b!296828 () Bool)

(declare-fun e!187597 () SeekEntryResult!2266)

(assert (=> b!296828 (= e!187597 (MissingZero!2266 (index!11236 lt!147400)))))

(declare-fun d!67119 () Bool)

(declare-fun lt!147398 () SeekEntryResult!2266)

(assert (=> d!67119 (and (or (is-Undefined!2266 lt!147398) (not (is-Found!2266 lt!147398)) (and (bvsge (index!11235 lt!147398) #b00000000000000000000000000000000) (bvslt (index!11235 lt!147398) (size!7469 a!3312)))) (or (is-Undefined!2266 lt!147398) (is-Found!2266 lt!147398) (not (is-MissingZero!2266 lt!147398)) (and (bvsge (index!11234 lt!147398) #b00000000000000000000000000000000) (bvslt (index!11234 lt!147398) (size!7469 a!3312)))) (or (is-Undefined!2266 lt!147398) (is-Found!2266 lt!147398) (is-MissingZero!2266 lt!147398) (not (is-MissingVacant!2266 lt!147398)) (and (bvsge (index!11237 lt!147398) #b00000000000000000000000000000000) (bvslt (index!11237 lt!147398) (size!7469 a!3312)))) (or (is-Undefined!2266 lt!147398) (ite (is-Found!2266 lt!147398) (= (select (arr!7117 a!3312) (index!11235 lt!147398)) k!2524) (ite (is-MissingZero!2266 lt!147398) (= (select (arr!7117 a!3312) (index!11234 lt!147398)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2266 lt!147398) (= (select (arr!7117 a!3312) (index!11237 lt!147398)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67119 (= lt!147398 e!187598)))

(declare-fun c!47788 () Bool)

(assert (=> d!67119 (= c!47788 (and (is-Intermediate!2266 lt!147400) (undefined!3078 lt!147400)))))

(assert (=> d!67119 (= lt!147400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67119 (validMask!0 mask!3809)))

(assert (=> d!67119 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!147398)))

(declare-fun b!296829 () Bool)

(declare-fun c!47789 () Bool)

(declare-fun lt!147399 () (_ BitVec 64))

(assert (=> b!296829 (= c!47789 (= lt!147399 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!296829 (= e!187596 e!187597)))

(declare-fun b!296830 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15016 (_ BitVec 32)) SeekEntryResult!2266)

(assert (=> b!296830 (= e!187597 (seekKeyOrZeroReturnVacant!0 (x!29444 lt!147400) (index!11236 lt!147400) (index!11236 lt!147400) k!2524 a!3312 mask!3809))))

(declare-fun b!296831 () Bool)

(assert (=> b!296831 (= e!187598 e!187596)))

(assert (=> b!296831 (= lt!147399 (select (arr!7117 a!3312) (index!11236 lt!147400)))))

(declare-fun c!47790 () Bool)

(assert (=> b!296831 (= c!47790 (= lt!147399 k!2524))))

(assert (= (and d!67119 c!47788) b!296827))

(assert (= (and d!67119 (not c!47788)) b!296831))

(assert (= (and b!296831 c!47790) b!296826))

(assert (= (and b!296831 (not c!47790)) b!296829))

(assert (= (and b!296829 c!47789) b!296828))

(assert (= (and b!296829 (not c!47789)) b!296830))

(assert (=> d!67119 m!309623))

(assert (=> d!67119 m!309619))

(assert (=> d!67119 m!309619))

(declare-fun m!309691 () Bool)

(assert (=> d!67119 m!309691))

(declare-fun m!309693 () Bool)

(assert (=> d!67119 m!309693))

(declare-fun m!309695 () Bool)

(assert (=> d!67119 m!309695))

(declare-fun m!309697 () Bool)

(assert (=> d!67119 m!309697))

(declare-fun m!309699 () Bool)

(assert (=> b!296830 m!309699))

(declare-fun m!309701 () Bool)

(assert (=> b!296831 m!309701))

(assert (=> b!296692 d!67119))

(declare-fun d!67131 () Bool)

(assert (=> d!67131 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29258 d!67131))

(declare-fun d!67139 () Bool)

(assert (=> d!67139 (= (array_inv!5080 a!3312) (bvsge (size!7469 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29258 d!67139))

(declare-fun b!296886 () Bool)

(declare-fun e!187630 () SeekEntryResult!2266)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296886 (= e!187630 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147336 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15017 (store (arr!7117 a!3312) i!1256 k!2524) (size!7469 a!3312)) mask!3809))))

(declare-fun b!296887 () Bool)

(declare-fun e!187632 () SeekEntryResult!2266)

(assert (=> b!296887 (= e!187632 e!187630)))

(declare-fun c!47814 () Bool)

(declare-fun lt!147427 () (_ BitVec 64))

(assert (=> b!296887 (= c!47814 (or (= lt!147427 k!2524) (= (bvadd lt!147427 lt!147427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!296888 () Bool)

(assert (=> b!296888 (= e!187632 (Intermediate!2266 true lt!147336 #b00000000000000000000000000000000))))

(declare-fun b!296889 () Bool)

(declare-fun lt!147426 () SeekEntryResult!2266)

(assert (=> b!296889 (and (bvsge (index!11236 lt!147426) #b00000000000000000000000000000000) (bvslt (index!11236 lt!147426) (size!7469 (array!15017 (store (arr!7117 a!3312) i!1256 k!2524) (size!7469 a!3312)))))))

(declare-fun res!156425 () Bool)

(assert (=> b!296889 (= res!156425 (= (select (arr!7117 (array!15017 (store (arr!7117 a!3312) i!1256 k!2524) (size!7469 a!3312))) (index!11236 lt!147426)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187633 () Bool)

(assert (=> b!296889 (=> res!156425 e!187633)))

(declare-fun d!67141 () Bool)

(declare-fun e!187631 () Bool)

(assert (=> d!67141 e!187631))

(declare-fun c!47812 () Bool)

(assert (=> d!67141 (= c!47812 (and (is-Intermediate!2266 lt!147426) (undefined!3078 lt!147426)))))

(assert (=> d!67141 (= lt!147426 e!187632)))

(declare-fun c!47813 () Bool)

(assert (=> d!67141 (= c!47813 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67141 (= lt!147427 (select (arr!7117 (array!15017 (store (arr!7117 a!3312) i!1256 k!2524) (size!7469 a!3312))) lt!147336))))

(assert (=> d!67141 (validMask!0 mask!3809)))

(assert (=> d!67141 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147336 k!2524 (array!15017 (store (arr!7117 a!3312) i!1256 k!2524) (size!7469 a!3312)) mask!3809) lt!147426)))

(declare-fun b!296890 () Bool)

(assert (=> b!296890 (= e!187631 (bvsge (x!29444 lt!147426) #b01111111111111111111111111111110))))

(declare-fun b!296891 () Bool)

(assert (=> b!296891 (and (bvsge (index!11236 lt!147426) #b00000000000000000000000000000000) (bvslt (index!11236 lt!147426) (size!7469 (array!15017 (store (arr!7117 a!3312) i!1256 k!2524) (size!7469 a!3312)))))))

(assert (=> b!296891 (= e!187633 (= (select (arr!7117 (array!15017 (store (arr!7117 a!3312) i!1256 k!2524) (size!7469 a!3312))) (index!11236 lt!147426)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!296892 () Bool)

(assert (=> b!296892 (and (bvsge (index!11236 lt!147426) #b00000000000000000000000000000000) (bvslt (index!11236 lt!147426) (size!7469 (array!15017 (store (arr!7117 a!3312) i!1256 k!2524) (size!7469 a!3312)))))))

(declare-fun res!156424 () Bool)

(assert (=> b!296892 (= res!156424 (= (select (arr!7117 (array!15017 (store (arr!7117 a!3312) i!1256 k!2524) (size!7469 a!3312))) (index!11236 lt!147426)) k!2524))))

(assert (=> b!296892 (=> res!156424 e!187633)))

(declare-fun e!187634 () Bool)

(assert (=> b!296892 (= e!187634 e!187633)))

(declare-fun b!296893 () Bool)

(assert (=> b!296893 (= e!187630 (Intermediate!2266 false lt!147336 #b00000000000000000000000000000000))))

(declare-fun b!296894 () Bool)

(assert (=> b!296894 (= e!187631 e!187634)))

(declare-fun res!156423 () Bool)

(assert (=> b!296894 (= res!156423 (and (is-Intermediate!2266 lt!147426) (not (undefined!3078 lt!147426)) (bvslt (x!29444 lt!147426) #b01111111111111111111111111111110) (bvsge (x!29444 lt!147426) #b00000000000000000000000000000000) (bvsge (x!29444 lt!147426) #b00000000000000000000000000000000)))))

(assert (=> b!296894 (=> (not res!156423) (not e!187634))))

(assert (= (and d!67141 c!47813) b!296888))

(assert (= (and d!67141 (not c!47813)) b!296887))

(assert (= (and b!296887 c!47814) b!296893))

(assert (= (and b!296887 (not c!47814)) b!296886))

(assert (= (and d!67141 c!47812) b!296890))

(assert (= (and d!67141 (not c!47812)) b!296894))

(assert (= (and b!296894 res!156423) b!296892))

(assert (= (and b!296892 (not res!156424)) b!296889))

(assert (= (and b!296889 (not res!156425)) b!296891))

(declare-fun m!309737 () Bool)

(assert (=> b!296886 m!309737))

(assert (=> b!296886 m!309737))

(declare-fun m!309739 () Bool)

(assert (=> b!296886 m!309739))

(declare-fun m!309741 () Bool)

(assert (=> b!296889 m!309741))

(declare-fun m!309743 () Bool)

(assert (=> d!67141 m!309743))

(assert (=> d!67141 m!309623))

(assert (=> b!296892 m!309741))

(assert (=> b!296891 m!309741))

(assert (=> b!296686 d!67141))

(declare-fun b!296895 () Bool)

(declare-fun e!187635 () SeekEntryResult!2266)

(assert (=> b!296895 (= e!187635 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147336 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!296896 () Bool)

(declare-fun e!187637 () SeekEntryResult!2266)

(assert (=> b!296896 (= e!187637 e!187635)))

(declare-fun c!47817 () Bool)

(declare-fun lt!147429 () (_ BitVec 64))

(assert (=> b!296896 (= c!47817 (or (= lt!147429 k!2524) (= (bvadd lt!147429 lt!147429) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!296897 () Bool)

(assert (=> b!296897 (= e!187637 (Intermediate!2266 true lt!147336 #b00000000000000000000000000000000))))

(declare-fun b!296898 () Bool)

(declare-fun lt!147428 () SeekEntryResult!2266)

(assert (=> b!296898 (and (bvsge (index!11236 lt!147428) #b00000000000000000000000000000000) (bvslt (index!11236 lt!147428) (size!7469 a!3312)))))

(declare-fun res!156428 () Bool)

(assert (=> b!296898 (= res!156428 (= (select (arr!7117 a!3312) (index!11236 lt!147428)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187638 () Bool)

(assert (=> b!296898 (=> res!156428 e!187638)))

(declare-fun d!67147 () Bool)

(declare-fun e!187636 () Bool)

(assert (=> d!67147 e!187636))

(declare-fun c!47815 () Bool)

(assert (=> d!67147 (= c!47815 (and (is-Intermediate!2266 lt!147428) (undefined!3078 lt!147428)))))

(assert (=> d!67147 (= lt!147428 e!187637)))

(declare-fun c!47816 () Bool)

(assert (=> d!67147 (= c!47816 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67147 (= lt!147429 (select (arr!7117 a!3312) lt!147336))))

(assert (=> d!67147 (validMask!0 mask!3809)))

(assert (=> d!67147 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147336 k!2524 a!3312 mask!3809) lt!147428)))

(declare-fun b!296899 () Bool)

(assert (=> b!296899 (= e!187636 (bvsge (x!29444 lt!147428) #b01111111111111111111111111111110))))

(declare-fun b!296900 () Bool)

(assert (=> b!296900 (and (bvsge (index!11236 lt!147428) #b00000000000000000000000000000000) (bvslt (index!11236 lt!147428) (size!7469 a!3312)))))

(assert (=> b!296900 (= e!187638 (= (select (arr!7117 a!3312) (index!11236 lt!147428)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!296901 () Bool)

(assert (=> b!296901 (and (bvsge (index!11236 lt!147428) #b00000000000000000000000000000000) (bvslt (index!11236 lt!147428) (size!7469 a!3312)))))

(declare-fun res!156427 () Bool)

(assert (=> b!296901 (= res!156427 (= (select (arr!7117 a!3312) (index!11236 lt!147428)) k!2524))))

(assert (=> b!296901 (=> res!156427 e!187638)))

(declare-fun e!187639 () Bool)

(assert (=> b!296901 (= e!187639 e!187638)))

(declare-fun b!296902 () Bool)

(assert (=> b!296902 (= e!187635 (Intermediate!2266 false lt!147336 #b00000000000000000000000000000000))))

(declare-fun b!296903 () Bool)

(assert (=> b!296903 (= e!187636 e!187639)))

(declare-fun res!156426 () Bool)

(assert (=> b!296903 (= res!156426 (and (is-Intermediate!2266 lt!147428) (not (undefined!3078 lt!147428)) (bvslt (x!29444 lt!147428) #b01111111111111111111111111111110) (bvsge (x!29444 lt!147428) #b00000000000000000000000000000000) (bvsge (x!29444 lt!147428) #b00000000000000000000000000000000)))))

(assert (=> b!296903 (=> (not res!156426) (not e!187639))))

(assert (= (and d!67147 c!47816) b!296897))

(assert (= (and d!67147 (not c!47816)) b!296896))

(assert (= (and b!296896 c!47817) b!296902))

(assert (= (and b!296896 (not c!47817)) b!296895))

(assert (= (and d!67147 c!47815) b!296899))

(assert (= (and d!67147 (not c!47815)) b!296903))

(assert (= (and b!296903 res!156426) b!296901))

(assert (= (and b!296901 (not res!156427)) b!296898))

(assert (= (and b!296898 (not res!156428)) b!296900))

(assert (=> b!296895 m!309737))

(assert (=> b!296895 m!309737))

(declare-fun m!309745 () Bool)

(assert (=> b!296895 m!309745))

(declare-fun m!309747 () Bool)

(assert (=> b!296898 m!309747))

(declare-fun m!309749 () Bool)

(assert (=> d!67147 m!309749))

(assert (=> d!67147 m!309623))

(assert (=> b!296901 m!309747))

(assert (=> b!296900 m!309747))

(assert (=> b!296686 d!67147))

(declare-fun d!67149 () Bool)

(declare-fun lt!147435 () (_ BitVec 32))

(declare-fun lt!147434 () (_ BitVec 32))

(assert (=> d!67149 (= lt!147435 (bvmul (bvxor lt!147434 (bvlshr lt!147434 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67149 (= lt!147434 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67149 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!156429 (let ((h!5297 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29450 (bvmul (bvxor h!5297 (bvlshr h!5297 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29450 (bvlshr x!29450 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!156429 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!156429 #b00000000000000000000000000000000))))))

(assert (=> d!67149 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!147435 (bvlshr lt!147435 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!296686 d!67149))

(declare-fun d!67151 () Bool)

(declare-fun res!156434 () Bool)

(declare-fun e!187644 () Bool)

(assert (=> d!67151 (=> res!156434 e!187644)))

(assert (=> d!67151 (= res!156434 (= (select (arr!7117 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67151 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!187644)))

(declare-fun b!296908 () Bool)

(declare-fun e!187645 () Bool)

(assert (=> b!296908 (= e!187644 e!187645)))

(declare-fun res!156435 () Bool)

(assert (=> b!296908 (=> (not res!156435) (not e!187645))))

(assert (=> b!296908 (= res!156435 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7469 a!3312)))))

(declare-fun b!296909 () Bool)

(assert (=> b!296909 (= e!187645 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67151 (not res!156434)) b!296908))

(assert (= (and b!296908 res!156435) b!296909))

(assert (=> d!67151 m!309663))

(declare-fun m!309751 () Bool)

(assert (=> b!296909 m!309751))

(assert (=> b!296688 d!67151))

(push 1)

(assert (not b!296759))

(assert (not b!296895))

(assert (not d!67141))

(assert (not bm!25747))

(assert (not b!296757))

(assert (not b!296909))

(assert (not d!67119))

(assert (not b!296830))

(assert (not d!67147))

(assert (not b!296886))

(check-sat)

(pop 1)

(push 1)

(check-sat)

