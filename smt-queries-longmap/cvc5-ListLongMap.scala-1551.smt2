; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29322 () Bool)

(assert start!29322)

(declare-fun b!296999 () Bool)

(declare-fun res!156653 () Bool)

(declare-fun e!187691 () Bool)

(assert (=> b!296999 (=> (not res!156653) (not e!187691))))

(declare-datatypes ((array!15038 0))(
  ( (array!15039 (arr!7127 (Array (_ BitVec 32) (_ BitVec 64))) (size!7480 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15038)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296999 (= res!156653 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297000 () Bool)

(declare-fun res!156658 () Bool)

(declare-fun e!187692 () Bool)

(assert (=> b!297000 (=> (not res!156658) (not e!187692))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15038 (_ BitVec 32)) Bool)

(assert (=> b!297000 (= res!156658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297001 () Bool)

(declare-fun lt!147497 () Bool)

(declare-datatypes ((SeekEntryResult!2275 0))(
  ( (MissingZero!2275 (index!11270 (_ BitVec 32))) (Found!2275 (index!11271 (_ BitVec 32))) (Intermediate!2275 (undefined!3087 Bool) (index!11272 (_ BitVec 32)) (x!29495 (_ BitVec 32))) (Undefined!2275) (MissingVacant!2275 (index!11273 (_ BitVec 32))) )
))
(declare-fun lt!147498 () SeekEntryResult!2275)

(assert (=> b!297001 (= e!187692 (and lt!147497 (not (is-Intermediate!2275 lt!147498))))))

(declare-fun lt!147500 () SeekEntryResult!2275)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!147499 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15038 (_ BitVec 32)) SeekEntryResult!2275)

(assert (=> b!297001 (= lt!147500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147499 k!2524 (array!15039 (store (arr!7127 a!3312) i!1256 k!2524) (size!7480 a!3312)) mask!3809))))

(assert (=> b!297001 (= lt!147498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147499 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297001 (= lt!147499 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!297003 () Bool)

(declare-fun res!156654 () Bool)

(assert (=> b!297003 (=> (not res!156654) (not e!187691))))

(assert (=> b!297003 (= res!156654 (and (= (size!7480 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7480 a!3312))))))

(declare-fun b!297004 () Bool)

(assert (=> b!297004 (= e!187691 e!187692)))

(declare-fun res!156657 () Bool)

(assert (=> b!297004 (=> (not res!156657) (not e!187692))))

(declare-fun lt!147501 () SeekEntryResult!2275)

(assert (=> b!297004 (= res!156657 (or lt!147497 (= lt!147501 (MissingVacant!2275 i!1256))))))

(assert (=> b!297004 (= lt!147497 (= lt!147501 (MissingZero!2275 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15038 (_ BitVec 32)) SeekEntryResult!2275)

(assert (=> b!297004 (= lt!147501 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!156656 () Bool)

(assert (=> start!29322 (=> (not res!156656) (not e!187691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29322 (= res!156656 (validMask!0 mask!3809))))

(assert (=> start!29322 e!187691))

(assert (=> start!29322 true))

(declare-fun array_inv!5099 (array!15038) Bool)

(assert (=> start!29322 (array_inv!5099 a!3312)))

(declare-fun b!297002 () Bool)

(declare-fun res!156655 () Bool)

(assert (=> b!297002 (=> (not res!156655) (not e!187691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297002 (= res!156655 (validKeyInArray!0 k!2524))))

(assert (= (and start!29322 res!156656) b!297003))

(assert (= (and b!297003 res!156654) b!297002))

(assert (= (and b!297002 res!156655) b!296999))

(assert (= (and b!296999 res!156653) b!297004))

(assert (= (and b!297004 res!156657) b!297000))

(assert (= (and b!297000 res!156658) b!297001))

(declare-fun m!309385 () Bool)

(assert (=> b!297002 m!309385))

(declare-fun m!309387 () Bool)

(assert (=> b!297004 m!309387))

(declare-fun m!309389 () Bool)

(assert (=> start!29322 m!309389))

(declare-fun m!309391 () Bool)

(assert (=> start!29322 m!309391))

(declare-fun m!309393 () Bool)

(assert (=> b!297000 m!309393))

(declare-fun m!309395 () Bool)

(assert (=> b!296999 m!309395))

(declare-fun m!309397 () Bool)

(assert (=> b!297001 m!309397))

(declare-fun m!309399 () Bool)

(assert (=> b!297001 m!309399))

(declare-fun m!309401 () Bool)

(assert (=> b!297001 m!309401))

(declare-fun m!309403 () Bool)

(assert (=> b!297001 m!309403))

(push 1)

(assert (not b!296999))

(assert (not b!297002))

(assert (not b!297000))

(assert (not start!29322))

(assert (not b!297004))

(assert (not b!297001))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66969 () Bool)

(assert (=> d!66969 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!297002 d!66969))

(declare-fun d!66973 () Bool)

(assert (=> d!66973 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29322 d!66973))

(declare-fun d!66979 () Bool)

(assert (=> d!66979 (= (array_inv!5099 a!3312) (bvsge (size!7480 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29322 d!66979))

(declare-fun d!66981 () Bool)

(declare-fun res!156669 () Bool)

(declare-fun e!187704 () Bool)

(assert (=> d!66981 (=> res!156669 e!187704)))

(assert (=> d!66981 (= res!156669 (= (select (arr!7127 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66981 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!187704)))

(declare-fun b!297015 () Bool)

(declare-fun e!187705 () Bool)

(assert (=> b!297015 (= e!187704 e!187705)))

(declare-fun res!156670 () Bool)

(assert (=> b!297015 (=> (not res!156670) (not e!187705))))

(assert (=> b!297015 (= res!156670 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7480 a!3312)))))

(declare-fun b!297016 () Bool)

(assert (=> b!297016 (= e!187705 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66981 (not res!156669)) b!297015))

(assert (= (and b!297015 res!156670) b!297016))

(declare-fun m!309409 () Bool)

(assert (=> d!66981 m!309409))

(declare-fun m!309411 () Bool)

(assert (=> b!297016 m!309411))

(assert (=> b!296999 d!66981))

(declare-fun b!297101 () Bool)

(declare-fun e!187753 () SeekEntryResult!2275)

(declare-fun lt!147526 () SeekEntryResult!2275)

(assert (=> b!297101 (= e!187753 (MissingZero!2275 (index!11272 lt!147526)))))

(declare-fun b!297102 () Bool)

(declare-fun e!187754 () SeekEntryResult!2275)

(assert (=> b!297102 (= e!187754 (Found!2275 (index!11272 lt!147526)))))

(declare-fun b!297103 () Bool)

(declare-fun e!187752 () SeekEntryResult!2275)

(assert (=> b!297103 (= e!187752 Undefined!2275)))

(declare-fun d!66987 () Bool)

(declare-fun lt!147525 () SeekEntryResult!2275)

(assert (=> d!66987 (and (or (is-Undefined!2275 lt!147525) (not (is-Found!2275 lt!147525)) (and (bvsge (index!11271 lt!147525) #b00000000000000000000000000000000) (bvslt (index!11271 lt!147525) (size!7480 a!3312)))) (or (is-Undefined!2275 lt!147525) (is-Found!2275 lt!147525) (not (is-MissingZero!2275 lt!147525)) (and (bvsge (index!11270 lt!147525) #b00000000000000000000000000000000) (bvslt (index!11270 lt!147525) (size!7480 a!3312)))) (or (is-Undefined!2275 lt!147525) (is-Found!2275 lt!147525) (is-MissingZero!2275 lt!147525) (not (is-MissingVacant!2275 lt!147525)) (and (bvsge (index!11273 lt!147525) #b00000000000000000000000000000000) (bvslt (index!11273 lt!147525) (size!7480 a!3312)))) (or (is-Undefined!2275 lt!147525) (ite (is-Found!2275 lt!147525) (= (select (arr!7127 a!3312) (index!11271 lt!147525)) k!2524) (ite (is-MissingZero!2275 lt!147525) (= (select (arr!7127 a!3312) (index!11270 lt!147525)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2275 lt!147525) (= (select (arr!7127 a!3312) (index!11273 lt!147525)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66987 (= lt!147525 e!187752)))

(declare-fun c!47786 () Bool)

(assert (=> d!66987 (= c!47786 (and (is-Intermediate!2275 lt!147526) (undefined!3087 lt!147526)))))

(assert (=> d!66987 (= lt!147526 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66987 (validMask!0 mask!3809)))

(assert (=> d!66987 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!147525)))

(declare-fun b!297104 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15038 (_ BitVec 32)) SeekEntryResult!2275)

(assert (=> b!297104 (= e!187753 (seekKeyOrZeroReturnVacant!0 (x!29495 lt!147526) (index!11272 lt!147526) (index!11272 lt!147526) k!2524 a!3312 mask!3809))))

(declare-fun b!297105 () Bool)

(declare-fun c!47785 () Bool)

(declare-fun lt!147524 () (_ BitVec 64))

(assert (=> b!297105 (= c!47785 (= lt!147524 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297105 (= e!187754 e!187753)))

(declare-fun b!297106 () Bool)

(assert (=> b!297106 (= e!187752 e!187754)))

(assert (=> b!297106 (= lt!147524 (select (arr!7127 a!3312) (index!11272 lt!147526)))))

(declare-fun c!47784 () Bool)

(assert (=> b!297106 (= c!47784 (= lt!147524 k!2524))))

(assert (= (and d!66987 c!47786) b!297103))

(assert (= (and d!66987 (not c!47786)) b!297106))

(assert (= (and b!297106 c!47784) b!297102))

(assert (= (and b!297106 (not c!47784)) b!297105))

(assert (= (and b!297105 c!47785) b!297101))

(assert (= (and b!297105 (not c!47785)) b!297104))

(assert (=> d!66987 m!309403))

(declare-fun m!309441 () Bool)

(assert (=> d!66987 m!309441))

(declare-fun m!309443 () Bool)

(assert (=> d!66987 m!309443))

(assert (=> d!66987 m!309403))

(declare-fun m!309445 () Bool)

(assert (=> d!66987 m!309445))

(declare-fun m!309447 () Bool)

(assert (=> d!66987 m!309447))

(assert (=> d!66987 m!309389))

(declare-fun m!309449 () Bool)

(assert (=> b!297104 m!309449))

(declare-fun m!309451 () Bool)

(assert (=> b!297106 m!309451))

(assert (=> b!297004 d!66987))

(declare-fun d!66997 () Bool)

(declare-fun res!156707 () Bool)

(declare-fun e!187768 () Bool)

(assert (=> d!66997 (=> res!156707 e!187768)))

(assert (=> d!66997 (= res!156707 (bvsge #b00000000000000000000000000000000 (size!7480 a!3312)))))

(assert (=> d!66997 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!187768)))

(declare-fun b!297121 () Bool)

(declare-fun e!187769 () Bool)

(declare-fun call!25730 () Bool)

(assert (=> b!297121 (= e!187769 call!25730)))

(declare-fun b!297122 () Bool)

(declare-fun e!187767 () Bool)

(assert (=> b!297122 (= e!187767 call!25730)))

(declare-fun b!297123 () Bool)

(assert (=> b!297123 (= e!187769 e!187767)))

(declare-fun lt!147546 () (_ BitVec 64))

(assert (=> b!297123 (= lt!147546 (select (arr!7127 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9208 0))(
  ( (Unit!9209) )
))
(declare-fun lt!147547 () Unit!9208)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15038 (_ BitVec 64) (_ BitVec 32)) Unit!9208)

(assert (=> b!297123 (= lt!147547 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!147546 #b00000000000000000000000000000000))))

(assert (=> b!297123 (arrayContainsKey!0 a!3312 lt!147546 #b00000000000000000000000000000000)))

(declare-fun lt!147545 () Unit!9208)

(assert (=> b!297123 (= lt!147545 lt!147547)))

(declare-fun res!156708 () Bool)

(assert (=> b!297123 (= res!156708 (= (seekEntryOrOpen!0 (select (arr!7127 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2275 #b00000000000000000000000000000000)))))

(assert (=> b!297123 (=> (not res!156708) (not e!187767))))

(declare-fun bm!25727 () Bool)

(assert (=> bm!25727 (= call!25730 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!297124 () Bool)

(assert (=> b!297124 (= e!187768 e!187769)))

(declare-fun c!47789 () Bool)

(assert (=> b!297124 (= c!47789 (validKeyInArray!0 (select (arr!7127 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!66997 (not res!156707)) b!297124))

(assert (= (and b!297124 c!47789) b!297123))

(assert (= (and b!297124 (not c!47789)) b!297121))

(assert (= (and b!297123 res!156708) b!297122))

(assert (= (or b!297122 b!297121) bm!25727))

(assert (=> b!297123 m!309409))

(declare-fun m!309457 () Bool)

(assert (=> b!297123 m!309457))

(declare-fun m!309459 () Bool)

(assert (=> b!297123 m!309459))

(assert (=> b!297123 m!309409))

(declare-fun m!309461 () Bool)

(assert (=> b!297123 m!309461))

(declare-fun m!309463 () Bool)

(assert (=> bm!25727 m!309463))

(assert (=> b!297124 m!309409))

(assert (=> b!297124 m!309409))

(declare-fun m!309465 () Bool)

(assert (=> b!297124 m!309465))

(assert (=> b!297000 d!66997))

(declare-fun e!187799 () SeekEntryResult!2275)

(declare-fun b!297167 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297167 (= e!187799 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147499 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15039 (store (arr!7127 a!3312) i!1256 k!2524) (size!7480 a!3312)) mask!3809))))

(declare-fun b!297168 () Bool)

(declare-fun e!187802 () Bool)

(declare-fun e!187801 () Bool)

(assert (=> b!297168 (= e!187802 e!187801)))

(declare-fun res!156729 () Bool)

(declare-fun lt!147570 () SeekEntryResult!2275)

(assert (=> b!297168 (= res!156729 (and (is-Intermediate!2275 lt!147570) (not (undefined!3087 lt!147570)) (bvslt (x!29495 lt!147570) #b01111111111111111111111111111110) (bvsge (x!29495 lt!147570) #b00000000000000000000000000000000) (bvsge (x!29495 lt!147570) #b00000000000000000000000000000000)))))

(assert (=> b!297168 (=> (not res!156729) (not e!187801))))

(declare-fun b!297169 () Bool)

(assert (=> b!297169 (and (bvsge (index!11272 lt!147570) #b00000000000000000000000000000000) (bvslt (index!11272 lt!147570) (size!7480 (array!15039 (store (arr!7127 a!3312) i!1256 k!2524) (size!7480 a!3312)))))))

(declare-fun res!156728 () Bool)

(assert (=> b!297169 (= res!156728 (= (select (arr!7127 (array!15039 (store (arr!7127 a!3312) i!1256 k!2524) (size!7480 a!3312))) (index!11272 lt!147570)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187800 () Bool)

(assert (=> b!297169 (=> res!156728 e!187800)))

(declare-fun d!67009 () Bool)

(assert (=> d!67009 e!187802))

(declare-fun c!47804 () Bool)

(assert (=> d!67009 (= c!47804 (and (is-Intermediate!2275 lt!147570) (undefined!3087 lt!147570)))))

(declare-fun e!187798 () SeekEntryResult!2275)

(assert (=> d!67009 (= lt!147570 e!187798)))

(declare-fun c!47802 () Bool)

(assert (=> d!67009 (= c!47802 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!147571 () (_ BitVec 64))

(assert (=> d!67009 (= lt!147571 (select (arr!7127 (array!15039 (store (arr!7127 a!3312) i!1256 k!2524) (size!7480 a!3312))) lt!147499))))

(assert (=> d!67009 (validMask!0 mask!3809)))

(assert (=> d!67009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147499 k!2524 (array!15039 (store (arr!7127 a!3312) i!1256 k!2524) (size!7480 a!3312)) mask!3809) lt!147570)))

(declare-fun b!297170 () Bool)

(assert (=> b!297170 (= e!187802 (bvsge (x!29495 lt!147570) #b01111111111111111111111111111110))))

(declare-fun b!297171 () Bool)

(assert (=> b!297171 (and (bvsge (index!11272 lt!147570) #b00000000000000000000000000000000) (bvslt (index!11272 lt!147570) (size!7480 (array!15039 (store (arr!7127 a!3312) i!1256 k!2524) (size!7480 a!3312)))))))

(assert (=> b!297171 (= e!187800 (= (select (arr!7127 (array!15039 (store (arr!7127 a!3312) i!1256 k!2524) (size!7480 a!3312))) (index!11272 lt!147570)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!297172 () Bool)

(assert (=> b!297172 (= e!187799 (Intermediate!2275 false lt!147499 #b00000000000000000000000000000000))))

(declare-fun b!297173 () Bool)

(assert (=> b!297173 (and (bvsge (index!11272 lt!147570) #b00000000000000000000000000000000) (bvslt (index!11272 lt!147570) (size!7480 (array!15039 (store (arr!7127 a!3312) i!1256 k!2524) (size!7480 a!3312)))))))

(declare-fun res!156727 () Bool)

(assert (=> b!297173 (= res!156727 (= (select (arr!7127 (array!15039 (store (arr!7127 a!3312) i!1256 k!2524) (size!7480 a!3312))) (index!11272 lt!147570)) k!2524))))

(assert (=> b!297173 (=> res!156727 e!187800)))

(assert (=> b!297173 (= e!187801 e!187800)))

(declare-fun b!297174 () Bool)

(assert (=> b!297174 (= e!187798 e!187799)))

(declare-fun c!47803 () Bool)

(assert (=> b!297174 (= c!47803 (or (= lt!147571 k!2524) (= (bvadd lt!147571 lt!147571) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!297175 () Bool)

(assert (=> b!297175 (= e!187798 (Intermediate!2275 true lt!147499 #b00000000000000000000000000000000))))

(assert (= (and d!67009 c!47802) b!297175))

(assert (= (and d!67009 (not c!47802)) b!297174))

(assert (= (and b!297174 c!47803) b!297172))

(assert (= (and b!297174 (not c!47803)) b!297167))

(assert (= (and d!67009 c!47804) b!297170))

(assert (= (and d!67009 (not c!47804)) b!297168))

(assert (= (and b!297168 res!156729) b!297173))

(assert (= (and b!297173 (not res!156727)) b!297169))

(assert (= (and b!297169 (not res!156728)) b!297171))

(declare-fun m!309487 () Bool)

(assert (=> b!297169 m!309487))

(declare-fun m!309489 () Bool)

(assert (=> b!297167 m!309489))

(assert (=> b!297167 m!309489))

(declare-fun m!309491 () Bool)

(assert (=> b!297167 m!309491))

(assert (=> b!297173 m!309487))

(assert (=> b!297171 m!309487))

(declare-fun m!309493 () Bool)

(assert (=> d!67009 m!309493))

(assert (=> d!67009 m!309389))

(assert (=> b!297001 d!67009))

(declare-fun e!187804 () SeekEntryResult!2275)

(declare-fun b!297176 () Bool)

(assert (=> b!297176 (= e!187804 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147499 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!297177 () Bool)

(declare-fun e!187807 () Bool)

(declare-fun e!187806 () Bool)

(assert (=> b!297177 (= e!187807 e!187806)))

(declare-fun res!156732 () Bool)

(declare-fun lt!147572 () SeekEntryResult!2275)

(assert (=> b!297177 (= res!156732 (and (is-Intermediate!2275 lt!147572) (not (undefined!3087 lt!147572)) (bvslt (x!29495 lt!147572) #b01111111111111111111111111111110) (bvsge (x!29495 lt!147572) #b00000000000000000000000000000000) (bvsge (x!29495 lt!147572) #b00000000000000000000000000000000)))))

(assert (=> b!297177 (=> (not res!156732) (not e!187806))))

(declare-fun b!297178 () Bool)

(assert (=> b!297178 (and (bvsge (index!11272 lt!147572) #b00000000000000000000000000000000) (bvslt (index!11272 lt!147572) (size!7480 a!3312)))))

(declare-fun res!156731 () Bool)

(assert (=> b!297178 (= res!156731 (= (select (arr!7127 a!3312) (index!11272 lt!147572)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187805 () Bool)

(assert (=> b!297178 (=> res!156731 e!187805)))

(declare-fun d!67019 () Bool)

(assert (=> d!67019 e!187807))

(declare-fun c!47807 () Bool)

(assert (=> d!67019 (= c!47807 (and (is-Intermediate!2275 lt!147572) (undefined!3087 lt!147572)))))

(declare-fun e!187803 () SeekEntryResult!2275)

(assert (=> d!67019 (= lt!147572 e!187803)))

(declare-fun c!47805 () Bool)

(assert (=> d!67019 (= c!47805 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!147573 () (_ BitVec 64))

(assert (=> d!67019 (= lt!147573 (select (arr!7127 a!3312) lt!147499))))

(assert (=> d!67019 (validMask!0 mask!3809)))

(assert (=> d!67019 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147499 k!2524 a!3312 mask!3809) lt!147572)))

(declare-fun b!297179 () Bool)

(assert (=> b!297179 (= e!187807 (bvsge (x!29495 lt!147572) #b01111111111111111111111111111110))))

(declare-fun b!297180 () Bool)

(assert (=> b!297180 (and (bvsge (index!11272 lt!147572) #b00000000000000000000000000000000) (bvslt (index!11272 lt!147572) (size!7480 a!3312)))))

(assert (=> b!297180 (= e!187805 (= (select (arr!7127 a!3312) (index!11272 lt!147572)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!297181 () Bool)

(assert (=> b!297181 (= e!187804 (Intermediate!2275 false lt!147499 #b00000000000000000000000000000000))))

(declare-fun b!297182 () Bool)

(assert (=> b!297182 (and (bvsge (index!11272 lt!147572) #b00000000000000000000000000000000) (bvslt (index!11272 lt!147572) (size!7480 a!3312)))))

(declare-fun res!156730 () Bool)

(assert (=> b!297182 (= res!156730 (= (select (arr!7127 a!3312) (index!11272 lt!147572)) k!2524))))

(assert (=> b!297182 (=> res!156730 e!187805)))

(assert (=> b!297182 (= e!187806 e!187805)))

(declare-fun b!297183 () Bool)

(assert (=> b!297183 (= e!187803 e!187804)))

(declare-fun c!47806 () Bool)

(assert (=> b!297183 (= c!47806 (or (= lt!147573 k!2524) (= (bvadd lt!147573 lt!147573) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!297184 () Bool)

(assert (=> b!297184 (= e!187803 (Intermediate!2275 true lt!147499 #b00000000000000000000000000000000))))

(assert (= (and d!67019 c!47805) b!297184))

(assert (= (and d!67019 (not c!47805)) b!297183))

(assert (= (and b!297183 c!47806) b!297181))

(assert (= (and b!297183 (not c!47806)) b!297176))

(assert (= (and d!67019 c!47807) b!297179))

(assert (= (and d!67019 (not c!47807)) b!297177))

(assert (= (and b!297177 res!156732) b!297182))

(assert (= (and b!297182 (not res!156730)) b!297178))

(assert (= (and b!297178 (not res!156731)) b!297180))

(declare-fun m!309495 () Bool)

(assert (=> b!297178 m!309495))

(assert (=> b!297176 m!309489))

(assert (=> b!297176 m!309489))

(declare-fun m!309497 () Bool)

(assert (=> b!297176 m!309497))

(assert (=> b!297182 m!309495))

(assert (=> b!297180 m!309495))

(declare-fun m!309499 () Bool)

(assert (=> d!67019 m!309499))

(assert (=> d!67019 m!309389))

(assert (=> b!297001 d!67019))

(declare-fun d!67021 () Bool)

(declare-fun lt!147585 () (_ BitVec 32))

(declare-fun lt!147584 () (_ BitVec 32))

(assert (=> d!67021 (= lt!147585 (bvmul (bvxor lt!147584 (bvlshr lt!147584 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67021 (= lt!147584 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67021 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!156733 (let ((h!5268 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29501 (bvmul (bvxor h!5268 (bvlshr h!5268 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29501 (bvlshr x!29501 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!156733 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!156733 #b00000000000000000000000000000000))))))

(assert (=> d!67021 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!147585 (bvlshr lt!147585 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!297001 d!67021))

(push 1)

(assert (not b!297124))

(assert (not d!67019))

(assert (not d!67009))

(assert (not b!297123))

(assert (not d!66987))

(assert (not b!297176))

(assert (not b!297167))

(assert (not bm!25727))

(assert (not b!297016))

(assert (not b!297104))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

