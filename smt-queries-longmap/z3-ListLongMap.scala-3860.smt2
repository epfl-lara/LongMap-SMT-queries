; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53064 () Bool)

(assert start!53064)

(declare-fun b!577386 () Bool)

(declare-fun res!365489 () Bool)

(declare-fun e!332069 () Bool)

(assert (=> b!577386 (=> (not res!365489) (not e!332069))))

(declare-datatypes ((array!36063 0))(
  ( (array!36064 (arr!17309 (Array (_ BitVec 32) (_ BitVec 64))) (size!17674 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36063)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36063 (_ BitVec 32)) Bool)

(assert (=> b!577386 (= res!365489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!577387 () Bool)

(declare-fun res!365492 () Bool)

(assert (=> b!577387 (=> (not res!365492) (not e!332069))))

(assert (=> b!577387 (= res!365492 (and (bvsle #b00000000000000000000000000000000 (size!17674 a!2986)) (bvslt (size!17674 a!2986) #b01111111111111111111111111111111)))))

(declare-fun b!577388 () Bool)

(declare-datatypes ((List!11389 0))(
  ( (Nil!11386) (Cons!11385 (h!12430 (_ BitVec 64)) (t!17608 List!11389)) )
))
(declare-fun noDuplicate!230 (List!11389) Bool)

(assert (=> b!577388 (= e!332069 (not (noDuplicate!230 Nil!11386)))))

(declare-fun b!577389 () Bool)

(declare-fun e!332068 () Bool)

(assert (=> b!577389 (= e!332068 e!332069)))

(declare-fun res!365488 () Bool)

(assert (=> b!577389 (=> (not res!365488) (not e!332069))))

(declare-datatypes ((SeekEntryResult!5746 0))(
  ( (MissingZero!5746 (index!25211 (_ BitVec 32))) (Found!5746 (index!25212 (_ BitVec 32))) (Intermediate!5746 (undefined!6558 Bool) (index!25213 (_ BitVec 32)) (x!54130 (_ BitVec 32))) (Undefined!5746) (MissingVacant!5746 (index!25214 (_ BitVec 32))) )
))
(declare-fun lt!263800 () SeekEntryResult!5746)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577389 (= res!365488 (or (= lt!263800 (MissingZero!5746 i!1108)) (= lt!263800 (MissingVacant!5746 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36063 (_ BitVec 32)) SeekEntryResult!5746)

(assert (=> b!577389 (= lt!263800 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!577390 () Bool)

(declare-fun res!365495 () Bool)

(assert (=> b!577390 (=> (not res!365495) (not e!332068))))

(declare-fun arrayContainsKey!0 (array!36063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577390 (= res!365495 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577391 () Bool)

(declare-fun res!365493 () Bool)

(assert (=> b!577391 (=> (not res!365493) (not e!332068))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577391 (= res!365493 (validKeyInArray!0 (select (arr!17309 a!2986) j!136)))))

(declare-fun b!577392 () Bool)

(declare-fun res!365490 () Bool)

(assert (=> b!577392 (=> (not res!365490) (not e!332068))))

(assert (=> b!577392 (= res!365490 (and (= (size!17674 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17674 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17674 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577393 () Bool)

(declare-fun res!365491 () Bool)

(assert (=> b!577393 (=> (not res!365491) (not e!332068))))

(assert (=> b!577393 (= res!365491 (validKeyInArray!0 k0!1786))))

(declare-fun res!365494 () Bool)

(assert (=> start!53064 (=> (not res!365494) (not e!332068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53064 (= res!365494 (validMask!0 mask!3053))))

(assert (=> start!53064 e!332068))

(assert (=> start!53064 true))

(declare-fun array_inv!13192 (array!36063) Bool)

(assert (=> start!53064 (array_inv!13192 a!2986)))

(assert (= (and start!53064 res!365494) b!577392))

(assert (= (and b!577392 res!365490) b!577391))

(assert (= (and b!577391 res!365493) b!577393))

(assert (= (and b!577393 res!365491) b!577390))

(assert (= (and b!577390 res!365495) b!577389))

(assert (= (and b!577389 res!365488) b!577386))

(assert (= (and b!577386 res!365489) b!577387))

(assert (= (and b!577387 res!365492) b!577388))

(declare-fun m!555705 () Bool)

(assert (=> b!577393 m!555705))

(declare-fun m!555707 () Bool)

(assert (=> b!577391 m!555707))

(assert (=> b!577391 m!555707))

(declare-fun m!555709 () Bool)

(assert (=> b!577391 m!555709))

(declare-fun m!555711 () Bool)

(assert (=> b!577389 m!555711))

(declare-fun m!555713 () Bool)

(assert (=> b!577388 m!555713))

(declare-fun m!555715 () Bool)

(assert (=> start!53064 m!555715))

(declare-fun m!555717 () Bool)

(assert (=> start!53064 m!555717))

(declare-fun m!555719 () Bool)

(assert (=> b!577386 m!555719))

(declare-fun m!555721 () Bool)

(assert (=> b!577390 m!555721))

(check-sat (not b!577388) (not b!577390) (not b!577389) (not b!577391) (not b!577393) (not b!577386) (not start!53064))
(check-sat)
(get-model)

(declare-fun d!85373 () Bool)

(assert (=> d!85373 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577393 d!85373))

(declare-fun bm!32734 () Bool)

(declare-fun call!32737 () Bool)

(assert (=> bm!32734 (= call!32737 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!577450 () Bool)

(declare-fun e!332095 () Bool)

(declare-fun e!332097 () Bool)

(assert (=> b!577450 (= e!332095 e!332097)))

(declare-fun c!66318 () Bool)

(assert (=> b!577450 (= c!66318 (validKeyInArray!0 (select (arr!17309 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!577451 () Bool)

(assert (=> b!577451 (= e!332097 call!32737)))

(declare-fun b!577452 () Bool)

(declare-fun e!332096 () Bool)

(assert (=> b!577452 (= e!332097 e!332096)))

(declare-fun lt!263815 () (_ BitVec 64))

(assert (=> b!577452 (= lt!263815 (select (arr!17309 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!18124 0))(
  ( (Unit!18125) )
))
(declare-fun lt!263814 () Unit!18124)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36063 (_ BitVec 64) (_ BitVec 32)) Unit!18124)

(assert (=> b!577452 (= lt!263814 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!263815 #b00000000000000000000000000000000))))

(assert (=> b!577452 (arrayContainsKey!0 a!2986 lt!263815 #b00000000000000000000000000000000)))

(declare-fun lt!263813 () Unit!18124)

(assert (=> b!577452 (= lt!263813 lt!263814)))

(declare-fun res!365548 () Bool)

(assert (=> b!577452 (= res!365548 (= (seekEntryOrOpen!0 (select (arr!17309 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!5746 #b00000000000000000000000000000000)))))

(assert (=> b!577452 (=> (not res!365548) (not e!332096))))

(declare-fun d!85375 () Bool)

(declare-fun res!365549 () Bool)

(assert (=> d!85375 (=> res!365549 e!332095)))

(assert (=> d!85375 (= res!365549 (bvsge #b00000000000000000000000000000000 (size!17674 a!2986)))))

(assert (=> d!85375 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!332095)))

(declare-fun b!577453 () Bool)

(assert (=> b!577453 (= e!332096 call!32737)))

(assert (= (and d!85375 (not res!365549)) b!577450))

(assert (= (and b!577450 c!66318) b!577452))

(assert (= (and b!577450 (not c!66318)) b!577451))

(assert (= (and b!577452 res!365548) b!577453))

(assert (= (or b!577453 b!577451) bm!32734))

(declare-fun m!555759 () Bool)

(assert (=> bm!32734 m!555759))

(declare-fun m!555761 () Bool)

(assert (=> b!577450 m!555761))

(assert (=> b!577450 m!555761))

(declare-fun m!555763 () Bool)

(assert (=> b!577450 m!555763))

(assert (=> b!577452 m!555761))

(declare-fun m!555765 () Bool)

(assert (=> b!577452 m!555765))

(declare-fun m!555767 () Bool)

(assert (=> b!577452 m!555767))

(assert (=> b!577452 m!555761))

(declare-fun m!555769 () Bool)

(assert (=> b!577452 m!555769))

(assert (=> b!577386 d!85375))

(declare-fun d!85381 () Bool)

(assert (=> d!85381 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!53064 d!85381))

(declare-fun d!85385 () Bool)

(assert (=> d!85385 (= (array_inv!13192 a!2986) (bvsge (size!17674 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!53064 d!85385))

(declare-fun d!85387 () Bool)

(assert (=> d!85387 (= (validKeyInArray!0 (select (arr!17309 a!2986) j!136)) (and (not (= (select (arr!17309 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17309 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577391 d!85387))

(declare-fun d!85389 () Bool)

(declare-fun res!365570 () Bool)

(declare-fun e!332121 () Bool)

(assert (=> d!85389 (=> res!365570 e!332121)))

(assert (=> d!85389 (= res!365570 (= (select (arr!17309 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!85389 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!332121)))

(declare-fun b!577480 () Bool)

(declare-fun e!332122 () Bool)

(assert (=> b!577480 (= e!332121 e!332122)))

(declare-fun res!365571 () Bool)

(assert (=> b!577480 (=> (not res!365571) (not e!332122))))

(assert (=> b!577480 (= res!365571 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17674 a!2986)))))

(declare-fun b!577481 () Bool)

(assert (=> b!577481 (= e!332122 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85389 (not res!365570)) b!577480))

(assert (= (and b!577480 res!365571) b!577481))

(assert (=> d!85389 m!555761))

(declare-fun m!555785 () Bool)

(assert (=> b!577481 m!555785))

(assert (=> b!577390 d!85389))

(declare-fun b!577528 () Bool)

(declare-fun e!332157 () SeekEntryResult!5746)

(declare-fun lt!263844 () SeekEntryResult!5746)

(assert (=> b!577528 (= e!332157 (Found!5746 (index!25213 lt!263844)))))

(declare-fun b!577530 () Bool)

(declare-fun e!332155 () SeekEntryResult!5746)

(assert (=> b!577530 (= e!332155 Undefined!5746)))

(declare-fun b!577531 () Bool)

(declare-fun e!332156 () SeekEntryResult!5746)

(assert (=> b!577531 (= e!332156 (MissingZero!5746 (index!25213 lt!263844)))))

(declare-fun b!577532 () Bool)

(assert (=> b!577532 (= e!332155 e!332157)))

(declare-fun lt!263845 () (_ BitVec 64))

(assert (=> b!577532 (= lt!263845 (select (arr!17309 a!2986) (index!25213 lt!263844)))))

(declare-fun c!66338 () Bool)

(assert (=> b!577532 (= c!66338 (= lt!263845 k0!1786))))

(declare-fun b!577533 () Bool)

(declare-fun c!66336 () Bool)

(assert (=> b!577533 (= c!66336 (= lt!263845 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!577533 (= e!332157 e!332156)))

(declare-fun d!85395 () Bool)

(declare-fun lt!263843 () SeekEntryResult!5746)

(get-info :version)

(assert (=> d!85395 (and (or ((_ is Undefined!5746) lt!263843) (not ((_ is Found!5746) lt!263843)) (and (bvsge (index!25212 lt!263843) #b00000000000000000000000000000000) (bvslt (index!25212 lt!263843) (size!17674 a!2986)))) (or ((_ is Undefined!5746) lt!263843) ((_ is Found!5746) lt!263843) (not ((_ is MissingZero!5746) lt!263843)) (and (bvsge (index!25211 lt!263843) #b00000000000000000000000000000000) (bvslt (index!25211 lt!263843) (size!17674 a!2986)))) (or ((_ is Undefined!5746) lt!263843) ((_ is Found!5746) lt!263843) ((_ is MissingZero!5746) lt!263843) (not ((_ is MissingVacant!5746) lt!263843)) (and (bvsge (index!25214 lt!263843) #b00000000000000000000000000000000) (bvslt (index!25214 lt!263843) (size!17674 a!2986)))) (or ((_ is Undefined!5746) lt!263843) (ite ((_ is Found!5746) lt!263843) (= (select (arr!17309 a!2986) (index!25212 lt!263843)) k0!1786) (ite ((_ is MissingZero!5746) lt!263843) (= (select (arr!17309 a!2986) (index!25211 lt!263843)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5746) lt!263843) (= (select (arr!17309 a!2986) (index!25214 lt!263843)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85395 (= lt!263843 e!332155)))

(declare-fun c!66337 () Bool)

(assert (=> d!85395 (= c!66337 (and ((_ is Intermediate!5746) lt!263844) (undefined!6558 lt!263844)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36063 (_ BitVec 32)) SeekEntryResult!5746)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85395 (= lt!263844 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!85395 (validMask!0 mask!3053)))

(assert (=> d!85395 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!263843)))

(declare-fun b!577529 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36063 (_ BitVec 32)) SeekEntryResult!5746)

(assert (=> b!577529 (= e!332156 (seekKeyOrZeroReturnVacant!0 (x!54130 lt!263844) (index!25213 lt!263844) (index!25213 lt!263844) k0!1786 a!2986 mask!3053))))

(assert (= (and d!85395 c!66337) b!577530))

(assert (= (and d!85395 (not c!66337)) b!577532))

(assert (= (and b!577532 c!66338) b!577528))

(assert (= (and b!577532 (not c!66338)) b!577533))

(assert (= (and b!577533 c!66336) b!577531))

(assert (= (and b!577533 (not c!66336)) b!577529))

(declare-fun m!555799 () Bool)

(assert (=> b!577532 m!555799))

(declare-fun m!555801 () Bool)

(assert (=> d!85395 m!555801))

(declare-fun m!555803 () Bool)

(assert (=> d!85395 m!555803))

(assert (=> d!85395 m!555715))

(declare-fun m!555805 () Bool)

(assert (=> d!85395 m!555805))

(assert (=> d!85395 m!555801))

(declare-fun m!555807 () Bool)

(assert (=> d!85395 m!555807))

(declare-fun m!555809 () Bool)

(assert (=> d!85395 m!555809))

(declare-fun m!555811 () Bool)

(assert (=> b!577529 m!555811))

(assert (=> b!577389 d!85395))

(declare-fun d!85407 () Bool)

(declare-fun res!365596 () Bool)

(declare-fun e!332168 () Bool)

(assert (=> d!85407 (=> res!365596 e!332168)))

(assert (=> d!85407 (= res!365596 ((_ is Nil!11386) Nil!11386))))

(assert (=> d!85407 (= (noDuplicate!230 Nil!11386) e!332168)))

(declare-fun b!577548 () Bool)

(declare-fun e!332169 () Bool)

(assert (=> b!577548 (= e!332168 e!332169)))

(declare-fun res!365597 () Bool)

(assert (=> b!577548 (=> (not res!365597) (not e!332169))))

(declare-fun contains!2881 (List!11389 (_ BitVec 64)) Bool)

(assert (=> b!577548 (= res!365597 (not (contains!2881 (t!17608 Nil!11386) (h!12430 Nil!11386))))))

(declare-fun b!577549 () Bool)

(assert (=> b!577549 (= e!332169 (noDuplicate!230 (t!17608 Nil!11386)))))

(assert (= (and d!85407 (not res!365596)) b!577548))

(assert (= (and b!577548 res!365597) b!577549))

(declare-fun m!555837 () Bool)

(assert (=> b!577548 m!555837))

(declare-fun m!555839 () Bool)

(assert (=> b!577549 m!555839))

(assert (=> b!577388 d!85407))

(check-sat (not b!577450) (not b!577549) (not b!577548) (not bm!32734) (not b!577481) (not d!85395) (not b!577529) (not b!577452))
(check-sat)
