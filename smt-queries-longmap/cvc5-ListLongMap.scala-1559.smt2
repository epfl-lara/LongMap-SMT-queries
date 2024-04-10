; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29578 () Bool)

(assert start!29578)

(declare-fun res!157517 () Bool)

(declare-fun e!188686 () Bool)

(assert (=> start!29578 (=> (not res!157517) (not e!188686))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29578 (= res!157517 (validMask!0 mask!3809))))

(assert (=> start!29578 e!188686))

(assert (=> start!29578 true))

(declare-datatypes ((array!15105 0))(
  ( (array!15106 (arr!7154 (Array (_ BitVec 32) (_ BitVec 64))) (size!7506 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15105)

(declare-fun array_inv!5117 (array!15105) Bool)

(assert (=> start!29578 (array_inv!5117 a!3312)))

(declare-fun b!298677 () Bool)

(declare-fun res!157518 () Bool)

(assert (=> b!298677 (=> (not res!157518) (not e!188686))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298677 (= res!157518 (validKeyInArray!0 k!2524))))

(declare-fun b!298678 () Bool)

(declare-fun res!157514 () Bool)

(assert (=> b!298678 (=> (not res!157514) (not e!188686))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!298678 (= res!157514 (and (= (size!7506 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7506 a!3312))))))

(declare-fun b!298679 () Bool)

(declare-fun res!157515 () Bool)

(declare-fun e!188685 () Bool)

(assert (=> b!298679 (=> (not res!157515) (not e!188685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15105 (_ BitVec 32)) Bool)

(assert (=> b!298679 (= res!157515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!298680 () Bool)

(declare-datatypes ((SeekEntryResult!2303 0))(
  ( (MissingZero!2303 (index!11385 (_ BitVec 32))) (Found!2303 (index!11386 (_ BitVec 32))) (Intermediate!2303 (undefined!3115 Bool) (index!11387 (_ BitVec 32)) (x!29618 (_ BitVec 32))) (Undefined!2303) (MissingVacant!2303 (index!11388 (_ BitVec 32))) )
))
(declare-fun lt!148496 () SeekEntryResult!2303)

(declare-fun lt!148500 () SeekEntryResult!2303)

(declare-fun lt!148498 () Bool)

(assert (=> b!298680 (= e!188685 (and (not lt!148498) (= lt!148496 (MissingVacant!2303 i!1256)) (let ((bdg!6425 (not (is-Intermediate!2303 lt!148500)))) (and (or bdg!6425 (not (undefined!3115 lt!148500))) (not bdg!6425) (= (select (arr!7154 a!3312) (index!11387 lt!148500)) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (index!11387 lt!148500) i!1256))))))))

(declare-fun lt!148499 () (_ BitVec 32))

(declare-fun lt!148497 () SeekEntryResult!2303)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15105 (_ BitVec 32)) SeekEntryResult!2303)

(assert (=> b!298680 (= lt!148497 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148499 k!2524 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312)) mask!3809))))

(assert (=> b!298680 (= lt!148500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148499 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298680 (= lt!148499 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!298681 () Bool)

(assert (=> b!298681 (= e!188686 e!188685)))

(declare-fun res!157513 () Bool)

(assert (=> b!298681 (=> (not res!157513) (not e!188685))))

(assert (=> b!298681 (= res!157513 (or lt!148498 (= lt!148496 (MissingVacant!2303 i!1256))))))

(assert (=> b!298681 (= lt!148498 (= lt!148496 (MissingZero!2303 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15105 (_ BitVec 32)) SeekEntryResult!2303)

(assert (=> b!298681 (= lt!148496 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!298682 () Bool)

(declare-fun res!157516 () Bool)

(assert (=> b!298682 (=> (not res!157516) (not e!188686))))

(declare-fun arrayContainsKey!0 (array!15105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298682 (= res!157516 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29578 res!157517) b!298678))

(assert (= (and b!298678 res!157514) b!298677))

(assert (= (and b!298677 res!157518) b!298682))

(assert (= (and b!298682 res!157516) b!298681))

(assert (= (and b!298681 res!157513) b!298679))

(assert (= (and b!298679 res!157515) b!298680))

(declare-fun m!311109 () Bool)

(assert (=> start!29578 m!311109))

(declare-fun m!311111 () Bool)

(assert (=> start!29578 m!311111))

(declare-fun m!311113 () Bool)

(assert (=> b!298679 m!311113))

(declare-fun m!311115 () Bool)

(assert (=> b!298677 m!311115))

(declare-fun m!311117 () Bool)

(assert (=> b!298680 m!311117))

(declare-fun m!311119 () Bool)

(assert (=> b!298680 m!311119))

(declare-fun m!311121 () Bool)

(assert (=> b!298680 m!311121))

(declare-fun m!311123 () Bool)

(assert (=> b!298680 m!311123))

(declare-fun m!311125 () Bool)

(assert (=> b!298680 m!311125))

(declare-fun m!311127 () Bool)

(assert (=> b!298682 m!311127))

(declare-fun m!311129 () Bool)

(assert (=> b!298681 m!311129))

(push 1)

(assert (not b!298681))

(assert (not b!298682))

(assert (not b!298677))

(assert (not b!298680))

(assert (not start!29578))

(assert (not b!298679))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!298745 () Bool)

(declare-fun e!188723 () Bool)

(declare-fun e!188721 () Bool)

(assert (=> b!298745 (= e!188723 e!188721)))

(declare-fun c!48177 () Bool)

(assert (=> b!298745 (= c!48177 (validKeyInArray!0 (select (arr!7154 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!298746 () Bool)

(declare-fun e!188722 () Bool)

(declare-fun call!25792 () Bool)

(assert (=> b!298746 (= e!188722 call!25792)))

(declare-fun d!67413 () Bool)

(declare-fun res!157565 () Bool)

(assert (=> d!67413 (=> res!157565 e!188723)))

(assert (=> d!67413 (= res!157565 (bvsge #b00000000000000000000000000000000 (size!7506 a!3312)))))

(assert (=> d!67413 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188723)))

(declare-fun b!298747 () Bool)

(assert (=> b!298747 (= e!188721 e!188722)))

(declare-fun lt!148543 () (_ BitVec 64))

(assert (=> b!298747 (= lt!148543 (select (arr!7154 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9317 0))(
  ( (Unit!9318) )
))
(declare-fun lt!148541 () Unit!9317)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15105 (_ BitVec 64) (_ BitVec 32)) Unit!9317)

(assert (=> b!298747 (= lt!148541 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148543 #b00000000000000000000000000000000))))

(assert (=> b!298747 (arrayContainsKey!0 a!3312 lt!148543 #b00000000000000000000000000000000)))

(declare-fun lt!148542 () Unit!9317)

(assert (=> b!298747 (= lt!148542 lt!148541)))

(declare-fun res!157566 () Bool)

(assert (=> b!298747 (= res!157566 (= (seekEntryOrOpen!0 (select (arr!7154 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2303 #b00000000000000000000000000000000)))))

(assert (=> b!298747 (=> (not res!157566) (not e!188722))))

(declare-fun bm!25789 () Bool)

(assert (=> bm!25789 (= call!25792 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!298748 () Bool)

(assert (=> b!298748 (= e!188721 call!25792)))

(assert (= (and d!67413 (not res!157565)) b!298745))

(assert (= (and b!298745 c!48177) b!298747))

(assert (= (and b!298745 (not c!48177)) b!298748))

(assert (= (and b!298747 res!157566) b!298746))

(assert (= (or b!298746 b!298748) bm!25789))

(declare-fun m!311175 () Bool)

(assert (=> b!298745 m!311175))

(assert (=> b!298745 m!311175))

(declare-fun m!311177 () Bool)

(assert (=> b!298745 m!311177))

(assert (=> b!298747 m!311175))

(declare-fun m!311179 () Bool)

(assert (=> b!298747 m!311179))

(declare-fun m!311181 () Bool)

(assert (=> b!298747 m!311181))

(assert (=> b!298747 m!311175))

(declare-fun m!311183 () Bool)

(assert (=> b!298747 m!311183))

(declare-fun m!311185 () Bool)

(assert (=> bm!25789 m!311185))

(assert (=> b!298679 d!67413))

(declare-fun b!298803 () Bool)

(declare-fun lt!148563 () SeekEntryResult!2303)

(assert (=> b!298803 (and (bvsge (index!11387 lt!148563) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148563) (size!7506 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312)))))))

(declare-fun res!157586 () Bool)

(assert (=> b!298803 (= res!157586 (= (select (arr!7154 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312))) (index!11387 lt!148563)) k!2524))))

(declare-fun e!188754 () Bool)

(assert (=> b!298803 (=> res!157586 e!188754)))

(declare-fun e!188756 () Bool)

(assert (=> b!298803 (= e!188756 e!188754)))

(declare-fun e!188757 () SeekEntryResult!2303)

(declare-fun b!298804 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298804 (= e!188757 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148499 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312)) mask!3809))))

(declare-fun b!298805 () Bool)

(assert (=> b!298805 (= e!188757 (Intermediate!2303 false lt!148499 #b00000000000000000000000000000000))))

(declare-fun b!298806 () Bool)

(declare-fun e!188758 () Bool)

(assert (=> b!298806 (= e!188758 e!188756)))

(declare-fun res!157588 () Bool)

(assert (=> b!298806 (= res!157588 (and (is-Intermediate!2303 lt!148563) (not (undefined!3115 lt!148563)) (bvslt (x!29618 lt!148563) #b01111111111111111111111111111110) (bvsge (x!29618 lt!148563) #b00000000000000000000000000000000) (bvsge (x!29618 lt!148563) #b00000000000000000000000000000000)))))

(assert (=> b!298806 (=> (not res!157588) (not e!188756))))

(declare-fun b!298807 () Bool)

(assert (=> b!298807 (= e!188758 (bvsge (x!29618 lt!148563) #b01111111111111111111111111111110))))

(declare-fun b!298808 () Bool)

(assert (=> b!298808 (and (bvsge (index!11387 lt!148563) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148563) (size!7506 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312)))))))

(assert (=> b!298808 (= e!188754 (= (select (arr!7154 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312))) (index!11387 lt!148563)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298810 () Bool)

(declare-fun e!188755 () SeekEntryResult!2303)

(assert (=> b!298810 (= e!188755 e!188757)))

(declare-fun c!48198 () Bool)

(declare-fun lt!148562 () (_ BitVec 64))

(assert (=> b!298810 (= c!48198 (or (= lt!148562 k!2524) (= (bvadd lt!148562 lt!148562) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298811 () Bool)

(assert (=> b!298811 (= e!188755 (Intermediate!2303 true lt!148499 #b00000000000000000000000000000000))))

(declare-fun d!67417 () Bool)

(assert (=> d!67417 e!188758))

(declare-fun c!48196 () Bool)

(assert (=> d!67417 (= c!48196 (and (is-Intermediate!2303 lt!148563) (undefined!3115 lt!148563)))))

(assert (=> d!67417 (= lt!148563 e!188755)))

(declare-fun c!48197 () Bool)

(assert (=> d!67417 (= c!48197 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67417 (= lt!148562 (select (arr!7154 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312))) lt!148499))))

(assert (=> d!67417 (validMask!0 mask!3809)))

(assert (=> d!67417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148499 k!2524 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312)) mask!3809) lt!148563)))

(declare-fun b!298809 () Bool)

(assert (=> b!298809 (and (bvsge (index!11387 lt!148563) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148563) (size!7506 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312)))))))

(declare-fun res!157587 () Bool)

(assert (=> b!298809 (= res!157587 (= (select (arr!7154 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312))) (index!11387 lt!148563)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298809 (=> res!157587 e!188754)))

(assert (= (and d!67417 c!48197) b!298811))

(assert (= (and d!67417 (not c!48197)) b!298810))

(assert (= (and b!298810 c!48198) b!298805))

(assert (= (and b!298810 (not c!48198)) b!298804))

(assert (= (and d!67417 c!48196) b!298807))

(assert (= (and d!67417 (not c!48196)) b!298806))

(assert (= (and b!298806 res!157588) b!298803))

(assert (= (and b!298803 (not res!157586)) b!298809))

(assert (= (and b!298809 (not res!157587)) b!298808))

(declare-fun m!311201 () Bool)

(assert (=> b!298804 m!311201))

(assert (=> b!298804 m!311201))

(declare-fun m!311203 () Bool)

(assert (=> b!298804 m!311203))

(declare-fun m!311205 () Bool)

(assert (=> b!298808 m!311205))

(assert (=> b!298809 m!311205))

(declare-fun m!311207 () Bool)

(assert (=> d!67417 m!311207))

(assert (=> d!67417 m!311109))

(assert (=> b!298803 m!311205))

(assert (=> b!298680 d!67417))

(declare-fun b!298825 () Bool)

(declare-fun lt!148567 () SeekEntryResult!2303)

(assert (=> b!298825 (and (bvsge (index!11387 lt!148567) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148567) (size!7506 a!3312)))))

(declare-fun res!157596 () Bool)

(assert (=> b!298825 (= res!157596 (= (select (arr!7154 a!3312) (index!11387 lt!148567)) k!2524))))

(declare-fun e!188768 () Bool)

(assert (=> b!298825 (=> res!157596 e!188768)))

(declare-fun e!188770 () Bool)

(assert (=> b!298825 (= e!188770 e!188768)))

(declare-fun b!298826 () Bool)

(declare-fun e!188771 () SeekEntryResult!2303)

(assert (=> b!298826 (= e!188771 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148499 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!298827 () Bool)

(assert (=> b!298827 (= e!188771 (Intermediate!2303 false lt!148499 #b00000000000000000000000000000000))))

(declare-fun b!298828 () Bool)

(declare-fun e!188772 () Bool)

(assert (=> b!298828 (= e!188772 e!188770)))

(declare-fun res!157598 () Bool)

(assert (=> b!298828 (= res!157598 (and (is-Intermediate!2303 lt!148567) (not (undefined!3115 lt!148567)) (bvslt (x!29618 lt!148567) #b01111111111111111111111111111110) (bvsge (x!29618 lt!148567) #b00000000000000000000000000000000) (bvsge (x!29618 lt!148567) #b00000000000000000000000000000000)))))

(assert (=> b!298828 (=> (not res!157598) (not e!188770))))

(declare-fun b!298829 () Bool)

(assert (=> b!298829 (= e!188772 (bvsge (x!29618 lt!148567) #b01111111111111111111111111111110))))

(declare-fun b!298830 () Bool)

(assert (=> b!298830 (and (bvsge (index!11387 lt!148567) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148567) (size!7506 a!3312)))))

(assert (=> b!298830 (= e!188768 (= (select (arr!7154 a!3312) (index!11387 lt!148567)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298832 () Bool)

(declare-fun e!188769 () SeekEntryResult!2303)

(assert (=> b!298832 (= e!188769 e!188771)))

(declare-fun c!48204 () Bool)

(declare-fun lt!148566 () (_ BitVec 64))

(assert (=> b!298832 (= c!48204 (or (= lt!148566 k!2524) (= (bvadd lt!148566 lt!148566) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298833 () Bool)

(assert (=> b!298833 (= e!188769 (Intermediate!2303 true lt!148499 #b00000000000000000000000000000000))))

(declare-fun d!67431 () Bool)

(assert (=> d!67431 e!188772))

(declare-fun c!48202 () Bool)

(assert (=> d!67431 (= c!48202 (and (is-Intermediate!2303 lt!148567) (undefined!3115 lt!148567)))))

(assert (=> d!67431 (= lt!148567 e!188769)))

(declare-fun c!48203 () Bool)

(assert (=> d!67431 (= c!48203 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67431 (= lt!148566 (select (arr!7154 a!3312) lt!148499))))

(assert (=> d!67431 (validMask!0 mask!3809)))

(assert (=> d!67431 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148499 k!2524 a!3312 mask!3809) lt!148567)))

(declare-fun b!298831 () Bool)

(assert (=> b!298831 (and (bvsge (index!11387 lt!148567) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148567) (size!7506 a!3312)))))

(declare-fun res!157597 () Bool)

(assert (=> b!298831 (= res!157597 (= (select (arr!7154 a!3312) (index!11387 lt!148567)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298831 (=> res!157597 e!188768)))

(assert (= (and d!67431 c!48203) b!298833))

(assert (= (and d!67431 (not c!48203)) b!298832))

(assert (= (and b!298832 c!48204) b!298827))

(assert (= (and b!298832 (not c!48204)) b!298826))

(assert (= (and d!67431 c!48202) b!298829))

(assert (= (and d!67431 (not c!48202)) b!298828))

(assert (= (and b!298828 res!157598) b!298825))

(assert (= (and b!298825 (not res!157596)) b!298831))

(assert (= (and b!298831 (not res!157597)) b!298830))

(assert (=> b!298826 m!311201))

(assert (=> b!298826 m!311201))

(declare-fun m!311217 () Bool)

(assert (=> b!298826 m!311217))

(declare-fun m!311219 () Bool)

(assert (=> b!298830 m!311219))

(assert (=> b!298831 m!311219))

(declare-fun m!311223 () Bool)

(assert (=> d!67431 m!311223))

(assert (=> d!67431 m!311109))

(assert (=> b!298825 m!311219))

(assert (=> b!298680 d!67431))

(declare-fun d!67437 () Bool)

(declare-fun lt!148579 () (_ BitVec 32))

(declare-fun lt!148578 () (_ BitVec 32))

(assert (=> d!67437 (= lt!148579 (bvmul (bvxor lt!148578 (bvlshr lt!148578 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67437 (= lt!148578 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67437 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157604 (let ((h!5311 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29625 (bvmul (bvxor h!5311 (bvlshr h!5311 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29625 (bvlshr x!29625 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157604 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157604 #b00000000000000000000000000000000))))))

(assert (=> d!67437 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!148579 (bvlshr lt!148579 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!298680 d!67437))

(declare-fun d!67441 () Bool)

(assert (=> d!67441 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29578 d!67441))

(declare-fun d!67449 () Bool)

(assert (=> d!67449 (= (array_inv!5117 a!3312) (bvsge (size!7506 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29578 d!67449))

(declare-fun b!298919 () Bool)

(declare-fun e!188826 () SeekEntryResult!2303)

(declare-fun lt!148621 () SeekEntryResult!2303)

(assert (=> b!298919 (= e!188826 (MissingZero!2303 (index!11387 lt!148621)))))

(declare-fun b!298920 () Bool)

(declare-fun e!188825 () SeekEntryResult!2303)

(assert (=> b!298920 (= e!188825 Undefined!2303)))

(declare-fun b!298921 () Bool)

(declare-fun e!188827 () SeekEntryResult!2303)

(assert (=> b!298921 (= e!188825 e!188827)))

(declare-fun lt!148622 () (_ BitVec 64))

(assert (=> b!298921 (= lt!148622 (select (arr!7154 a!3312) (index!11387 lt!148621)))))

(declare-fun c!48238 () Bool)

(assert (=> b!298921 (= c!48238 (= lt!148622 k!2524))))

(declare-fun d!67451 () Bool)

(declare-fun lt!148623 () SeekEntryResult!2303)

(assert (=> d!67451 (and (or (is-Undefined!2303 lt!148623) (not (is-Found!2303 lt!148623)) (and (bvsge (index!11386 lt!148623) #b00000000000000000000000000000000) (bvslt (index!11386 lt!148623) (size!7506 a!3312)))) (or (is-Undefined!2303 lt!148623) (is-Found!2303 lt!148623) (not (is-MissingZero!2303 lt!148623)) (and (bvsge (index!11385 lt!148623) #b00000000000000000000000000000000) (bvslt (index!11385 lt!148623) (size!7506 a!3312)))) (or (is-Undefined!2303 lt!148623) (is-Found!2303 lt!148623) (is-MissingZero!2303 lt!148623) (not (is-MissingVacant!2303 lt!148623)) (and (bvsge (index!11388 lt!148623) #b00000000000000000000000000000000) (bvslt (index!11388 lt!148623) (size!7506 a!3312)))) (or (is-Undefined!2303 lt!148623) (ite (is-Found!2303 lt!148623) (= (select (arr!7154 a!3312) (index!11386 lt!148623)) k!2524) (ite (is-MissingZero!2303 lt!148623) (= (select (arr!7154 a!3312) (index!11385 lt!148623)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2303 lt!148623) (= (select (arr!7154 a!3312) (index!11388 lt!148623)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67451 (= lt!148623 e!188825)))

(declare-fun c!48239 () Bool)

(assert (=> d!67451 (= c!48239 (and (is-Intermediate!2303 lt!148621) (undefined!3115 lt!148621)))))

(assert (=> d!67451 (= lt!148621 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67451 (validMask!0 mask!3809)))

(assert (=> d!67451 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!148623)))

(declare-fun b!298922 () Bool)

(declare-fun c!48237 () Bool)

(assert (=> b!298922 (= c!48237 (= lt!148622 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298922 (= e!188827 e!188826)))

(declare-fun b!298923 () Bool)

(assert (=> b!298923 (= e!188827 (Found!2303 (index!11387 lt!148621)))))

(declare-fun b!298924 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15105 (_ BitVec 32)) SeekEntryResult!2303)

(assert (=> b!298924 (= e!188826 (seekKeyOrZeroReturnVacant!0 (x!29618 lt!148621) (index!11387 lt!148621) (index!11387 lt!148621) k!2524 a!3312 mask!3809))))

(assert (= (and d!67451 c!48239) b!298920))

(assert (= (and d!67451 (not c!48239)) b!298921))

(assert (= (and b!298921 c!48238) b!298923))

(assert (= (and b!298921 (not c!48238)) b!298922))

(assert (= (and b!298922 c!48237) b!298919))

(assert (= (and b!298922 (not c!48237)) b!298924))

(declare-fun m!311271 () Bool)

(assert (=> b!298921 m!311271))

(assert (=> d!67451 m!311109))

(declare-fun m!311273 () Bool)

(assert (=> d!67451 m!311273))

(declare-fun m!311275 () Bool)

(assert (=> d!67451 m!311275))

(declare-fun m!311277 () Bool)

(assert (=> d!67451 m!311277))

(assert (=> d!67451 m!311121))

(declare-fun m!311279 () Bool)

(assert (=> d!67451 m!311279))

(assert (=> d!67451 m!311121))

(declare-fun m!311281 () Bool)

(assert (=> b!298924 m!311281))

(assert (=> b!298681 d!67451))

(declare-fun d!67457 () Bool)

(declare-fun res!157628 () Bool)

(declare-fun e!188835 () Bool)

(assert (=> d!67457 (=> res!157628 e!188835)))

(assert (=> d!67457 (= res!157628 (= (select (arr!7154 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67457 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!188835)))

(declare-fun b!298933 () Bool)

(declare-fun e!188836 () Bool)

(assert (=> b!298933 (= e!188835 e!188836)))

(declare-fun res!157629 () Bool)

(assert (=> b!298933 (=> (not res!157629) (not e!188836))))

(assert (=> b!298933 (= res!157629 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7506 a!3312)))))

(declare-fun b!298934 () Bool)

(assert (=> b!298934 (= e!188836 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67457 (not res!157628)) b!298933))

(assert (= (and b!298933 res!157629) b!298934))

(assert (=> d!67457 m!311175))

(declare-fun m!311293 () Bool)

(assert (=> b!298934 m!311293))

(assert (=> b!298682 d!67457))

(declare-fun d!67459 () Bool)

(assert (=> d!67459 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298677 d!67459))

(push 1)

(assert (not d!67451))

(assert (not b!298747))

(assert (not b!298826))

(assert (not b!298745))

(assert (not b!298924))

(assert (not b!298804))

(assert (not d!67417))

(assert (not bm!25789))

(assert (not b!298934))

(assert (not d!67431))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!298947 () Bool)

(declare-fun e!188845 () Bool)

(declare-fun e!188843 () Bool)

(assert (=> b!298947 (= e!188845 e!188843)))

(declare-fun c!48247 () Bool)

(assert (=> b!298947 (= c!48247 (validKeyInArray!0 (select (arr!7154 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!298948 () Bool)

(declare-fun e!188844 () Bool)

(declare-fun call!25799 () Bool)

(assert (=> b!298948 (= e!188844 call!25799)))

(declare-fun d!67463 () Bool)

(declare-fun res!157630 () Bool)

(assert (=> d!67463 (=> res!157630 e!188845)))

(assert (=> d!67463 (= res!157630 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7506 a!3312)))))

(assert (=> d!67463 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809) e!188845)))

(declare-fun b!298949 () Bool)

(assert (=> b!298949 (= e!188843 e!188844)))

(declare-fun lt!148633 () (_ BitVec 64))

(assert (=> b!298949 (= lt!148633 (select (arr!7154 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!148631 () Unit!9317)

(assert (=> b!298949 (= lt!148631 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148633 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!298949 (arrayContainsKey!0 a!3312 lt!148633 #b00000000000000000000000000000000)))

(declare-fun lt!148632 () Unit!9317)

(assert (=> b!298949 (= lt!148632 lt!148631)))

(declare-fun res!157631 () Bool)

(assert (=> b!298949 (= res!157631 (= (seekEntryOrOpen!0 (select (arr!7154 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3312 mask!3809) (Found!2303 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!298949 (=> (not res!157631) (not e!188844))))

(declare-fun bm!25796 () Bool)

(assert (=> bm!25796 (= call!25799 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!298950 () Bool)

(assert (=> b!298950 (= e!188843 call!25799)))

(assert (= (and d!67463 (not res!157630)) b!298947))

(assert (= (and b!298947 c!48247) b!298949))

(assert (= (and b!298947 (not c!48247)) b!298950))

(assert (= (and b!298949 res!157631) b!298948))

(assert (= (or b!298948 b!298950) bm!25796))

(declare-fun m!311295 () Bool)

(assert (=> b!298947 m!311295))

(assert (=> b!298947 m!311295))

(declare-fun m!311297 () Bool)

(assert (=> b!298947 m!311297))

(assert (=> b!298949 m!311295))

(declare-fun m!311299 () Bool)

(assert (=> b!298949 m!311299))

(declare-fun m!311301 () Bool)

(assert (=> b!298949 m!311301))

(assert (=> b!298949 m!311295))

(declare-fun m!311303 () Bool)

(assert (=> b!298949 m!311303))

(declare-fun m!311305 () Bool)

(assert (=> bm!25796 m!311305))

(assert (=> bm!25789 d!67463))

(declare-fun b!298957 () Bool)

(declare-fun lt!148637 () SeekEntryResult!2303)

(assert (=> b!298957 (and (bvsge (index!11387 lt!148637) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148637) (size!7506 a!3312)))))

(declare-fun res!157632 () Bool)

(assert (=> b!298957 (= res!157632 (= (select (arr!7154 a!3312) (index!11387 lt!148637)) k!2524))))

(declare-fun e!188849 () Bool)

(assert (=> b!298957 (=> res!157632 e!188849)))

(declare-fun e!188851 () Bool)

(assert (=> b!298957 (= e!188851 e!188849)))

(declare-fun b!298958 () Bool)

(declare-fun e!188852 () SeekEntryResult!2303)

(assert (=> b!298958 (= e!188852 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!148499 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!298959 () Bool)

(assert (=> b!298959 (= e!188852 (Intermediate!2303 false (nextIndex!0 lt!148499 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!298960 () Bool)

(declare-fun e!188853 () Bool)

(assert (=> b!298960 (= e!188853 e!188851)))

(declare-fun res!157634 () Bool)

(assert (=> b!298960 (= res!157634 (and (is-Intermediate!2303 lt!148637) (not (undefined!3115 lt!148637)) (bvslt (x!29618 lt!148637) #b01111111111111111111111111111110) (bvsge (x!29618 lt!148637) #b00000000000000000000000000000000) (bvsge (x!29618 lt!148637) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!298960 (=> (not res!157634) (not e!188851))))

(declare-fun b!298961 () Bool)

(assert (=> b!298961 (= e!188853 (bvsge (x!29618 lt!148637) #b01111111111111111111111111111110))))

(declare-fun b!298962 () Bool)

(assert (=> b!298962 (and (bvsge (index!11387 lt!148637) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148637) (size!7506 a!3312)))))

(assert (=> b!298962 (= e!188849 (= (select (arr!7154 a!3312) (index!11387 lt!148637)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298964 () Bool)

(declare-fun e!188850 () SeekEntryResult!2303)

(assert (=> b!298964 (= e!188850 e!188852)))

(declare-fun c!48253 () Bool)

(declare-fun lt!148636 () (_ BitVec 64))

(assert (=> b!298964 (= c!48253 (or (= lt!148636 k!2524) (= (bvadd lt!148636 lt!148636) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298965 () Bool)

(assert (=> b!298965 (= e!188850 (Intermediate!2303 true (nextIndex!0 lt!148499 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun d!67465 () Bool)

(assert (=> d!67465 e!188853))

(declare-fun c!48251 () Bool)

(assert (=> d!67465 (= c!48251 (and (is-Intermediate!2303 lt!148637) (undefined!3115 lt!148637)))))

(assert (=> d!67465 (= lt!148637 e!188850)))

(declare-fun c!48252 () Bool)

(assert (=> d!67465 (= c!48252 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!67465 (= lt!148636 (select (arr!7154 a!3312) (nextIndex!0 lt!148499 #b00000000000000000000000000000000 mask!3809)))))

(assert (=> d!67465 (validMask!0 mask!3809)))

(assert (=> d!67465 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148499 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809) lt!148637)))

(declare-fun b!298963 () Bool)

(assert (=> b!298963 (and (bvsge (index!11387 lt!148637) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148637) (size!7506 a!3312)))))

(declare-fun res!157633 () Bool)

(assert (=> b!298963 (= res!157633 (= (select (arr!7154 a!3312) (index!11387 lt!148637)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298963 (=> res!157633 e!188849)))

(assert (= (and d!67465 c!48252) b!298965))

(assert (= (and d!67465 (not c!48252)) b!298964))

(assert (= (and b!298964 c!48253) b!298959))

(assert (= (and b!298964 (not c!48253)) b!298958))

(assert (= (and d!67465 c!48251) b!298961))

(assert (= (and d!67465 (not c!48251)) b!298960))

(assert (= (and b!298960 res!157634) b!298957))

(assert (= (and b!298957 (not res!157632)) b!298963))

(assert (= (and b!298963 (not res!157633)) b!298962))

(assert (=> b!298958 m!311201))

(declare-fun m!311315 () Bool)

(assert (=> b!298958 m!311315))

(assert (=> b!298958 m!311315))

(declare-fun m!311317 () Bool)

(assert (=> b!298958 m!311317))

(declare-fun m!311319 () Bool)

(assert (=> b!298962 m!311319))

(assert (=> b!298963 m!311319))

(assert (=> d!67465 m!311201))

(declare-fun m!311321 () Bool)

(assert (=> d!67465 m!311321))

(assert (=> d!67465 m!311109))

(assert (=> b!298957 m!311319))

(assert (=> b!298826 d!67465))

(declare-fun d!67469 () Bool)

(declare-fun lt!148646 () (_ BitVec 32))

(assert (=> d!67469 (and (bvsge lt!148646 #b00000000000000000000000000000000) (bvslt lt!148646 (bvadd mask!3809 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!67469 (= lt!148646 (choose!52 lt!148499 #b00000000000000000000000000000000 mask!3809))))

(assert (=> d!67469 (validMask!0 mask!3809)))

(assert (=> d!67469 (= (nextIndex!0 lt!148499 #b00000000000000000000000000000000 mask!3809) lt!148646)))

(declare-fun bs!10545 () Bool)

(assert (= bs!10545 d!67469))

(declare-fun m!311339 () Bool)

(assert (=> bs!10545 m!311339))

(assert (=> bs!10545 m!311109))

(assert (=> b!298826 d!67469))

(assert (=> d!67417 d!67441))

(declare-fun b!298974 () Bool)

(declare-fun lt!148648 () SeekEntryResult!2303)

(assert (=> b!298974 (and (bvsge (index!11387 lt!148648) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148648) (size!7506 a!3312)))))

(declare-fun res!157637 () Bool)

(assert (=> b!298974 (= res!157637 (= (select (arr!7154 a!3312) (index!11387 lt!148648)) k!2524))))

(declare-fun e!188859 () Bool)

(assert (=> b!298974 (=> res!157637 e!188859)))

(declare-fun e!188861 () Bool)

(assert (=> b!298974 (= e!188861 e!188859)))

(declare-fun e!188862 () SeekEntryResult!2303)

(declare-fun b!298975 () Bool)

(assert (=> b!298975 (= e!188862 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!298976 () Bool)

(assert (=> b!298976 (= e!188862 (Intermediate!2303 false (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!298977 () Bool)

(declare-fun e!188863 () Bool)

(assert (=> b!298977 (= e!188863 e!188861)))

(declare-fun res!157639 () Bool)

(assert (=> b!298977 (= res!157639 (and (is-Intermediate!2303 lt!148648) (not (undefined!3115 lt!148648)) (bvslt (x!29618 lt!148648) #b01111111111111111111111111111110) (bvsge (x!29618 lt!148648) #b00000000000000000000000000000000) (bvsge (x!29618 lt!148648) #b00000000000000000000000000000000)))))

(assert (=> b!298977 (=> (not res!157639) (not e!188861))))

(declare-fun b!298978 () Bool)

(assert (=> b!298978 (= e!188863 (bvsge (x!29618 lt!148648) #b01111111111111111111111111111110))))

(declare-fun b!298979 () Bool)

(assert (=> b!298979 (and (bvsge (index!11387 lt!148648) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148648) (size!7506 a!3312)))))

(assert (=> b!298979 (= e!188859 (= (select (arr!7154 a!3312) (index!11387 lt!148648)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298981 () Bool)

(declare-fun e!188860 () SeekEntryResult!2303)

(assert (=> b!298981 (= e!188860 e!188862)))

(declare-fun c!48259 () Bool)

(declare-fun lt!148647 () (_ BitVec 64))

(assert (=> b!298981 (= c!48259 (or (= lt!148647 k!2524) (= (bvadd lt!148647 lt!148647) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298982 () Bool)

(assert (=> b!298982 (= e!188860 (Intermediate!2303 true (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun d!67477 () Bool)

(assert (=> d!67477 e!188863))

(declare-fun c!48257 () Bool)

(assert (=> d!67477 (= c!48257 (and (is-Intermediate!2303 lt!148648) (undefined!3115 lt!148648)))))

(assert (=> d!67477 (= lt!148648 e!188860)))

(declare-fun c!48258 () Bool)

(assert (=> d!67477 (= c!48258 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67477 (= lt!148647 (select (arr!7154 a!3312) (toIndex!0 k!2524 mask!3809)))))

(assert (=> d!67477 (validMask!0 mask!3809)))

(assert (=> d!67477 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809) lt!148648)))

(declare-fun b!298980 () Bool)

(assert (=> b!298980 (and (bvsge (index!11387 lt!148648) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148648) (size!7506 a!3312)))))

(declare-fun res!157638 () Bool)

(assert (=> b!298980 (= res!157638 (= (select (arr!7154 a!3312) (index!11387 lt!148648)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298980 (=> res!157638 e!188859)))

(assert (= (and d!67477 c!48258) b!298982))

(assert (= (and d!67477 (not c!48258)) b!298981))

(assert (= (and b!298981 c!48259) b!298976))

(assert (= (and b!298981 (not c!48259)) b!298975))

(assert (= (and d!67477 c!48257) b!298978))

(assert (= (and d!67477 (not c!48257)) b!298977))

(assert (= (and b!298977 res!157639) b!298974))

(assert (= (and b!298974 (not res!157637)) b!298980))

(assert (= (and b!298980 (not res!157638)) b!298979))

(assert (=> b!298975 m!311121))

(declare-fun m!311355 () Bool)

(assert (=> b!298975 m!311355))

(assert (=> b!298975 m!311355))

(declare-fun m!311357 () Bool)

(assert (=> b!298975 m!311357))

(declare-fun m!311359 () Bool)

(assert (=> b!298979 m!311359))

(assert (=> b!298980 m!311359))

(assert (=> d!67477 m!311121))

(declare-fun m!311361 () Bool)

(assert (=> d!67477 m!311361))

(assert (=> d!67477 m!311109))

(assert (=> b!298974 m!311359))

(assert (=> d!67451 d!67477))

(assert (=> d!67451 d!67437))

(assert (=> d!67451 d!67441))

(declare-fun b!298996 () Bool)

(declare-fun lt!148655 () SeekEntryResult!2303)

(assert (=> b!298996 (and (bvsge (index!11387 lt!148655) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148655) (size!7506 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312)))))))

(declare-fun res!157645 () Bool)

(assert (=> b!298996 (= res!157645 (= (select (arr!7154 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312))) (index!11387 lt!148655)) k!2524))))

(declare-fun e!188872 () Bool)

(assert (=> b!298996 (=> res!157645 e!188872)))

(declare-fun e!188874 () Bool)

(assert (=> b!298996 (= e!188874 e!188872)))

(declare-fun e!188875 () SeekEntryResult!2303)

(declare-fun b!298997 () Bool)

(assert (=> b!298997 (= e!188875 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!148499 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k!2524 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312)) mask!3809))))

(declare-fun b!298998 () Bool)

(assert (=> b!298998 (= e!188875 (Intermediate!2303 false (nextIndex!0 lt!148499 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!298999 () Bool)

(declare-fun e!188876 () Bool)

(assert (=> b!298999 (= e!188876 e!188874)))

(declare-fun res!157647 () Bool)

(assert (=> b!298999 (= res!157647 (and (is-Intermediate!2303 lt!148655) (not (undefined!3115 lt!148655)) (bvslt (x!29618 lt!148655) #b01111111111111111111111111111110) (bvsge (x!29618 lt!148655) #b00000000000000000000000000000000) (bvsge (x!29618 lt!148655) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!298999 (=> (not res!157647) (not e!188874))))

(declare-fun b!299000 () Bool)

(assert (=> b!299000 (= e!188876 (bvsge (x!29618 lt!148655) #b01111111111111111111111111111110))))

(declare-fun b!299001 () Bool)

(assert (=> b!299001 (and (bvsge (index!11387 lt!148655) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148655) (size!7506 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312)))))))

(assert (=> b!299001 (= e!188872 (= (select (arr!7154 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312))) (index!11387 lt!148655)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!299003 () Bool)

(declare-fun e!188873 () SeekEntryResult!2303)

(assert (=> b!299003 (= e!188873 e!188875)))

(declare-fun c!48266 () Bool)

(declare-fun lt!148654 () (_ BitVec 64))

(assert (=> b!299003 (= c!48266 (or (= lt!148654 k!2524) (= (bvadd lt!148654 lt!148654) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!299004 () Bool)

(assert (=> b!299004 (= e!188873 (Intermediate!2303 true (nextIndex!0 lt!148499 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun d!67481 () Bool)

(assert (=> d!67481 e!188876))

(declare-fun c!48264 () Bool)

(assert (=> d!67481 (= c!48264 (and (is-Intermediate!2303 lt!148655) (undefined!3115 lt!148655)))))

(assert (=> d!67481 (= lt!148655 e!188873)))

(declare-fun c!48265 () Bool)

(assert (=> d!67481 (= c!48265 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!67481 (= lt!148654 (select (arr!7154 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312))) (nextIndex!0 lt!148499 #b00000000000000000000000000000000 mask!3809)))))

(assert (=> d!67481 (validMask!0 mask!3809)))

(assert (=> d!67481 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148499 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312)) mask!3809) lt!148655)))

(declare-fun b!299002 () Bool)

(assert (=> b!299002 (and (bvsge (index!11387 lt!148655) #b00000000000000000000000000000000) (bvslt (index!11387 lt!148655) (size!7506 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312)))))))

(declare-fun res!157646 () Bool)

(assert (=> b!299002 (= res!157646 (= (select (arr!7154 (array!15106 (store (arr!7154 a!3312) i!1256 k!2524) (size!7506 a!3312))) (index!11387 lt!148655)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299002 (=> res!157646 e!188872)))

(assert (= (and d!67481 c!48265) b!299004))

(assert (= (and d!67481 (not c!48265)) b!299003))

(assert (= (and b!299003 c!48266) b!298998))

(assert (= (and b!299003 (not c!48266)) b!298997))

(assert (= (and d!67481 c!48264) b!299000))

(assert (= (and d!67481 (not c!48264)) b!298999))

(assert (= (and b!298999 res!157647) b!298996))

(assert (= (and b!298996 (not res!157645)) b!299002))

(assert (= (and b!299002 (not res!157646)) b!299001))

(assert (=> b!298997 m!311201))

(assert (=> b!298997 m!311315))

(assert (=> b!298997 m!311315))

(declare-fun m!311371 () Bool)

(assert (=> b!298997 m!311371))

(declare-fun m!311373 () Bool)

(assert (=> b!299001 m!311373))

(assert (=> b!299002 m!311373))

(assert (=> d!67481 m!311201))

(declare-fun m!311375 () Bool)

(assert (=> d!67481 m!311375))

(assert (=> d!67481 m!311109))

(assert (=> b!298996 m!311373))

(assert (=> b!298804 d!67481))

(assert (=> b!298804 d!67469))

(declare-fun d!67485 () Bool)

(assert (=> d!67485 (= (validKeyInArray!0 (select (arr!7154 a!3312) #b00000000000000000000000000000000)) (and (not (= (select (arr!7154 a!3312) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7154 a!3312) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298745 d!67485))

(declare-fun b!299037 () Bool)

(declare-fun e!188895 () SeekEntryResult!2303)

(declare-fun e!188897 () SeekEntryResult!2303)

(assert (=> b!299037 (= e!188895 e!188897)))

(declare-fun c!48281 () Bool)

(declare-fun lt!148667 () (_ BitVec 64))

(assert (=> b!299037 (= c!48281 (= lt!148667 k!2524))))

(declare-fun b!299038 () Bool)

(declare-fun e!188896 () SeekEntryResult!2303)

(assert (=> b!299038 (= e!188896 (MissingVacant!2303 (index!11387 lt!148621)))))

(declare-fun b!299039 () Bool)

(declare-fun c!48279 () Bool)

(assert (=> b!299039 (= c!48279 (= lt!148667 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299039 (= e!188897 e!188896)))

(declare-fun b!299040 () Bool)

(assert (=> b!299040 (= e!188896 (seekKeyOrZeroReturnVacant!0 (bvadd (x!29618 lt!148621) #b00000000000000000000000000000001) (nextIndex!0 (index!11387 lt!148621) (x!29618 lt!148621) mask!3809) (index!11387 lt!148621) k!2524 a!3312 mask!3809))))

(declare-fun b!299041 () Bool)

(assert (=> b!299041 (= e!188895 Undefined!2303)))

(declare-fun d!67487 () Bool)

(declare-fun lt!148668 () SeekEntryResult!2303)

(assert (=> d!67487 (and (or (is-Undefined!2303 lt!148668) (not (is-Found!2303 lt!148668)) (and (bvsge (index!11386 lt!148668) #b00000000000000000000000000000000) (bvslt (index!11386 lt!148668) (size!7506 a!3312)))) (or (is-Undefined!2303 lt!148668) (is-Found!2303 lt!148668) (not (is-MissingVacant!2303 lt!148668)) (not (= (index!11388 lt!148668) (index!11387 lt!148621))) (and (bvsge (index!11388 lt!148668) #b00000000000000000000000000000000) (bvslt (index!11388 lt!148668) (size!7506 a!3312)))) (or (is-Undefined!2303 lt!148668) (ite (is-Found!2303 lt!148668) (= (select (arr!7154 a!3312) (index!11386 lt!148668)) k!2524) (and (is-MissingVacant!2303 lt!148668) (= (index!11388 lt!148668) (index!11387 lt!148621)) (= (select (arr!7154 a!3312) (index!11388 lt!148668)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!67487 (= lt!148668 e!188895)))

(declare-fun c!48280 () Bool)

(assert (=> d!67487 (= c!48280 (bvsge (x!29618 lt!148621) #b01111111111111111111111111111110))))

(assert (=> d!67487 (= lt!148667 (select (arr!7154 a!3312) (index!11387 lt!148621)))))

(assert (=> d!67487 (validMask!0 mask!3809)))

(assert (=> d!67487 (= (seekKeyOrZeroReturnVacant!0 (x!29618 lt!148621) (index!11387 lt!148621) (index!11387 lt!148621) k!2524 a!3312 mask!3809) lt!148668)))

(declare-fun b!299042 () Bool)

(assert (=> b!299042 (= e!188897 (Found!2303 (index!11387 lt!148621)))))

(assert (= (and d!67487 c!48280) b!299041))

(assert (= (and d!67487 (not c!48280)) b!299037))

(assert (= (and b!299037 c!48281) b!299042))

(assert (= (and b!299037 (not c!48281)) b!299039))

(assert (= (and b!299039 c!48279) b!299038))

(assert (= (and b!299039 (not c!48279)) b!299040))

(declare-fun m!311395 () Bool)

(assert (=> b!299040 m!311395))

(assert (=> b!299040 m!311395))

(declare-fun m!311397 () Bool)

(assert (=> b!299040 m!311397))

(declare-fun m!311399 () Bool)

(assert (=> d!67487 m!311399))

(declare-fun m!311401 () Bool)

(assert (=> d!67487 m!311401))

(assert (=> d!67487 m!311271))

(assert (=> d!67487 m!311109))

(assert (=> b!298924 d!67487))

(declare-fun d!67497 () Bool)

(assert (=> d!67497 (arrayContainsKey!0 a!3312 lt!148543 #b00000000000000000000000000000000)))

(declare-fun lt!148671 () Unit!9317)

(declare-fun choose!13 (array!15105 (_ BitVec 64) (_ BitVec 32)) Unit!9317)

(assert (=> d!67497 (= lt!148671 (choose!13 a!3312 lt!148543 #b00000000000000000000000000000000))))

(assert (=> d!67497 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!67497 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148543 #b00000000000000000000000000000000) lt!148671)))

(declare-fun bs!10547 () Bool)

(assert (= bs!10547 d!67497))

(assert (=> bs!10547 m!311181))

(declare-fun m!311403 () Bool)

(assert (=> bs!10547 m!311403))

(assert (=> b!298747 d!67497))

(declare-fun d!67499 () Bool)

(declare-fun res!157656 () Bool)

(declare-fun e!188898 () Bool)

(assert (=> d!67499 (=> res!157656 e!188898)))

(assert (=> d!67499 (= res!157656 (= (select (arr!7154 a!3312) #b00000000000000000000000000000000) lt!148543))))

(assert (=> d!67499 (= (arrayContainsKey!0 a!3312 lt!148543 #b00000000000000000000000000000000) e!188898)))

(declare-fun b!299043 () Bool)

(declare-fun e!188899 () Bool)

(assert (=> b!299043 (= e!188898 e!188899)))

(declare-fun res!157657 () Bool)

(assert (=> b!299043 (=> (not res!157657) (not e!188899))))

(assert (=> b!299043 (= res!157657 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7506 a!3312)))))

(declare-fun b!299044 () Bool)

(assert (=> b!299044 (= e!188899 (arrayContainsKey!0 a!3312 lt!148543 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67499 (not res!157656)) b!299043))

(assert (= (and b!299043 res!157657) b!299044))

(assert (=> d!67499 m!311175))

(declare-fun m!311405 () Bool)

(assert (=> b!299044 m!311405))

(assert (=> b!298747 d!67499))

(declare-fun b!299045 () Bool)

(declare-fun e!188901 () SeekEntryResult!2303)

(declare-fun lt!148672 () SeekEntryResult!2303)

(assert (=> b!299045 (= e!188901 (MissingZero!2303 (index!11387 lt!148672)))))

(declare-fun b!299046 () Bool)

(declare-fun e!188900 () SeekEntryResult!2303)

(assert (=> b!299046 (= e!188900 Undefined!2303)))

(declare-fun b!299047 () Bool)

(declare-fun e!188902 () SeekEntryResult!2303)

(assert (=> b!299047 (= e!188900 e!188902)))

(declare-fun lt!148673 () (_ BitVec 64))

(assert (=> b!299047 (= lt!148673 (select (arr!7154 a!3312) (index!11387 lt!148672)))))

(declare-fun c!48283 () Bool)

(assert (=> b!299047 (= c!48283 (= lt!148673 (select (arr!7154 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67501 () Bool)

(declare-fun lt!148674 () SeekEntryResult!2303)

(assert (=> d!67501 (and (or (is-Undefined!2303 lt!148674) (not (is-Found!2303 lt!148674)) (and (bvsge (index!11386 lt!148674) #b00000000000000000000000000000000) (bvslt (index!11386 lt!148674) (size!7506 a!3312)))) (or (is-Undefined!2303 lt!148674) (is-Found!2303 lt!148674) (not (is-MissingZero!2303 lt!148674)) (and (bvsge (index!11385 lt!148674) #b00000000000000000000000000000000) (bvslt (index!11385 lt!148674) (size!7506 a!3312)))) (or (is-Undefined!2303 lt!148674) (is-Found!2303 lt!148674) (is-MissingZero!2303 lt!148674) (not (is-MissingVacant!2303 lt!148674)) (and (bvsge (index!11388 lt!148674) #b00000000000000000000000000000000) (bvslt (index!11388 lt!148674) (size!7506 a!3312)))) (or (is-Undefined!2303 lt!148674) (ite (is-Found!2303 lt!148674) (= (select (arr!7154 a!3312) (index!11386 lt!148674)) (select (arr!7154 a!3312) #b00000000000000000000000000000000)) (ite (is-MissingZero!2303 lt!148674) (= (select (arr!7154 a!3312) (index!11385 lt!148674)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2303 lt!148674) (= (select (arr!7154 a!3312) (index!11388 lt!148674)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67501 (= lt!148674 e!188900)))

(declare-fun c!48284 () Bool)

(assert (=> d!67501 (= c!48284 (and (is-Intermediate!2303 lt!148672) (undefined!3115 lt!148672)))))

(assert (=> d!67501 (= lt!148672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!7154 a!3312) #b00000000000000000000000000000000) mask!3809) (select (arr!7154 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809))))

(assert (=> d!67501 (validMask!0 mask!3809)))

(assert (=> d!67501 (= (seekEntryOrOpen!0 (select (arr!7154 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) lt!148674)))

(declare-fun b!299048 () Bool)

(declare-fun c!48282 () Bool)

(assert (=> b!299048 (= c!48282 (= lt!148673 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!299048 (= e!188902 e!188901)))

(declare-fun b!299049 () Bool)

(assert (=> b!299049 (= e!188902 (Found!2303 (index!11387 lt!148672)))))

(declare-fun b!299050 () Bool)

(assert (=> b!299050 (= e!188901 (seekKeyOrZeroReturnVacant!0 (x!29618 lt!148672) (index!11387 lt!148672) (index!11387 lt!148672) (select (arr!7154 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809))))

(assert (= (and d!67501 c!48284) b!299046))

(assert (= (and d!67501 (not c!48284)) b!299047))

(assert (= (and b!299047 c!48283) b!299049))

(assert (= (and b!299047 (not c!48283)) b!299048))

(assert (= (and b!299048 c!48282) b!299045))

(assert (= (and b!299048 (not c!48282)) b!299050))

(declare-fun m!311407 () Bool)

(assert (=> b!299047 m!311407))

(assert (=> d!67501 m!311109))

(declare-fun m!311409 () Bool)

(assert (=> d!67501 m!311409))

(declare-fun m!311411 () Bool)

(assert (=> d!67501 m!311411))

(declare-fun m!311413 () Bool)

(assert (=> d!67501 m!311413))

(declare-fun m!311415 () Bool)

(assert (=> d!67501 m!311415))

(assert (=> d!67501 m!311175))

(declare-fun m!311417 () Bool)

(assert (=> d!67501 m!311417))

(assert (=> d!67501 m!311175))

(assert (=> d!67501 m!311415))

(assert (=> b!299050 m!311175))

(declare-fun m!311419 () Bool)

(assert (=> b!299050 m!311419))

(assert (=> b!298747 d!67501))

(declare-fun d!67503 () Bool)

(declare-fun res!157658 () Bool)

(declare-fun e!188903 () Bool)

(assert (=> d!67503 (=> res!157658 e!188903)))

(assert (=> d!67503 (= res!157658 (= (select (arr!7154 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k!2524))))

(assert (=> d!67503 (= (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!188903)))

(declare-fun b!299051 () Bool)

(declare-fun e!188904 () Bool)

(assert (=> b!299051 (= e!188903 e!188904)))

(declare-fun res!157659 () Bool)

(assert (=> b!299051 (=> (not res!157659) (not e!188904))))

(assert (=> b!299051 (= res!157659 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!7506 a!3312)))))

(declare-fun b!299052 () Bool)

(assert (=> b!299052 (= e!188904 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!67503 (not res!157658)) b!299051))

(assert (= (and b!299051 res!157659) b!299052))

(assert (=> d!67503 m!311295))

(declare-fun m!311421 () Bool)

(assert (=> b!299052 m!311421))

(assert (=> b!298934 d!67503))

(assert (=> d!67431 d!67441))

(push 1)

(assert (not b!299040))

(assert (not d!67481))

(assert (not d!67465))

(assert (not b!299052))

(assert (not b!298958))

(assert (not bm!25796))

(assert (not d!67497))

(assert (not b!298949))

(assert (not b!298997))

(assert (not d!67487))

(assert (not b!298947))

(assert (not d!67469))

(assert (not b!299044))

(assert (not b!299050))

(assert (not d!67477))

(assert (not b!298975))

(assert (not d!67501))

(check-sat)

(pop 1)

(push 1)

(check-sat)

