; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33146 () Bool)

(assert start!33146)

(declare-fun b!329691 () Bool)

(declare-fun e!202495 () Bool)

(declare-fun e!202497 () Bool)

(assert (=> b!329691 (= e!202495 e!202497)))

(declare-fun res!181709 () Bool)

(assert (=> b!329691 (=> (not res!181709) (not e!202497))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3103 0))(
  ( (MissingZero!3103 (index!14588 (_ BitVec 32))) (Found!3103 (index!14589 (_ BitVec 32))) (Intermediate!3103 (undefined!3915 Bool) (index!14590 (_ BitVec 32)) (x!32861 (_ BitVec 32))) (Undefined!3103) (MissingVacant!3103 (index!14591 (_ BitVec 32))) )
))
(declare-fun lt!158307 () SeekEntryResult!3103)

(declare-datatypes ((array!16856 0))(
  ( (array!16857 (arr!7972 (Array (_ BitVec 32) (_ BitVec 64))) (size!8324 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16856)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16856 (_ BitVec 32)) SeekEntryResult!3103)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329691 (= res!181709 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158307))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!329691 (= lt!158307 (Intermediate!3103 false resIndex!58 resX!58))))

(declare-fun b!329692 () Bool)

(declare-datatypes ((Unit!10214 0))(
  ( (Unit!10215) )
))
(declare-fun e!202496 () Unit!10214)

(declare-fun Unit!10216 () Unit!10214)

(assert (=> b!329692 (= e!202496 Unit!10216)))

(assert (=> b!329692 false))

(declare-fun b!329693 () Bool)

(declare-fun res!181707 () Bool)

(assert (=> b!329693 (=> (not res!181707) (not e!202495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329693 (= res!181707 (validKeyInArray!0 k!2497))))

(declare-fun b!329694 () Bool)

(declare-fun Unit!10217 () Unit!10214)

(assert (=> b!329694 (= e!202496 Unit!10217)))

(declare-fun b!329695 () Bool)

(declare-fun res!181703 () Bool)

(assert (=> b!329695 (=> (not res!181703) (not e!202497))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!329695 (= res!181703 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7972 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7972 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7972 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!329696 () Bool)

(declare-fun res!181704 () Bool)

(assert (=> b!329696 (=> (not res!181704) (not e!202495))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!329696 (= res!181704 (and (= (size!8324 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8324 a!3305))))))

(declare-fun b!329697 () Bool)

(declare-fun res!181701 () Bool)

(assert (=> b!329697 (=> (not res!181701) (not e!202495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16856 (_ BitVec 32)) Bool)

(assert (=> b!329697 (= res!181701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!181706 () Bool)

(assert (=> start!33146 (=> (not res!181706) (not e!202495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33146 (= res!181706 (validMask!0 mask!3777))))

(assert (=> start!33146 e!202495))

(declare-fun array_inv!5935 (array!16856) Bool)

(assert (=> start!33146 (array_inv!5935 a!3305)))

(assert (=> start!33146 true))

(declare-fun b!329698 () Bool)

(declare-fun res!181705 () Bool)

(assert (=> b!329698 (=> (not res!181705) (not e!202497))))

(assert (=> b!329698 (= res!181705 (and (= (select (arr!7972 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8324 a!3305))))))

(declare-fun b!329699 () Bool)

(assert (=> b!329699 (= e!202497 true)))

(declare-fun lt!158306 () Unit!10214)

(assert (=> b!329699 (= lt!158306 e!202496)))

(declare-fun c!51636 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329699 (= c!51636 (is-Intermediate!3103 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun b!329700 () Bool)

(declare-fun res!181702 () Bool)

(assert (=> b!329700 (=> (not res!181702) (not e!202497))))

(assert (=> b!329700 (= res!181702 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158307))))

(declare-fun b!329701 () Bool)

(declare-fun res!181708 () Bool)

(assert (=> b!329701 (=> (not res!181708) (not e!202495))))

(declare-fun arrayContainsKey!0 (array!16856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329701 (= res!181708 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!329702 () Bool)

(declare-fun res!181710 () Bool)

(assert (=> b!329702 (=> (not res!181710) (not e!202495))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16856 (_ BitVec 32)) SeekEntryResult!3103)

(assert (=> b!329702 (= res!181710 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3103 i!1250)))))

(assert (= (and start!33146 res!181706) b!329696))

(assert (= (and b!329696 res!181704) b!329693))

(assert (= (and b!329693 res!181707) b!329701))

(assert (= (and b!329701 res!181708) b!329702))

(assert (= (and b!329702 res!181710) b!329697))

(assert (= (and b!329697 res!181701) b!329691))

(assert (= (and b!329691 res!181709) b!329698))

(assert (= (and b!329698 res!181705) b!329700))

(assert (= (and b!329700 res!181702) b!329695))

(assert (= (and b!329695 res!181703) b!329699))

(assert (= (and b!329699 c!51636) b!329694))

(assert (= (and b!329699 (not c!51636)) b!329692))

(declare-fun m!335259 () Bool)

(assert (=> b!329699 m!335259))

(assert (=> b!329699 m!335259))

(declare-fun m!335261 () Bool)

(assert (=> b!329699 m!335261))

(declare-fun m!335263 () Bool)

(assert (=> b!329697 m!335263))

(declare-fun m!335265 () Bool)

(assert (=> b!329700 m!335265))

(declare-fun m!335267 () Bool)

(assert (=> b!329693 m!335267))

(declare-fun m!335269 () Bool)

(assert (=> b!329701 m!335269))

(declare-fun m!335271 () Bool)

(assert (=> start!33146 m!335271))

(declare-fun m!335273 () Bool)

(assert (=> start!33146 m!335273))

(declare-fun m!335275 () Bool)

(assert (=> b!329698 m!335275))

(declare-fun m!335277 () Bool)

(assert (=> b!329702 m!335277))

(declare-fun m!335279 () Bool)

(assert (=> b!329695 m!335279))

(declare-fun m!335281 () Bool)

(assert (=> b!329691 m!335281))

(assert (=> b!329691 m!335281))

(declare-fun m!335283 () Bool)

(assert (=> b!329691 m!335283))

(push 1)

(assert (not b!329699))

(assert (not start!33146))

(assert (not b!329691))

(assert (not b!329697))

(assert (not b!329700))

(assert (not b!329702))

(assert (not b!329701))

(assert (not b!329693))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!70225 () Bool)

(declare-fun res!181721 () Bool)

(declare-fun e!202512 () Bool)

(assert (=> d!70225 (=> res!181721 e!202512)))

(assert (=> d!70225 (= res!181721 (= (select (arr!7972 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!70225 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!202512)))

(declare-fun b!329719 () Bool)

(declare-fun e!202513 () Bool)

(assert (=> b!329719 (= e!202512 e!202513)))

(declare-fun res!181722 () Bool)

(assert (=> b!329719 (=> (not res!181722) (not e!202513))))

(assert (=> b!329719 (= res!181722 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8324 a!3305)))))

(declare-fun b!329720 () Bool)

(assert (=> b!329720 (= e!202513 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70225 (not res!181721)) b!329719))

(assert (= (and b!329719 res!181722) b!329720))

(declare-fun m!335297 () Bool)

(assert (=> d!70225 m!335297))

(declare-fun m!335299 () Bool)

(assert (=> b!329720 m!335299))

(assert (=> b!329701 d!70225))

(declare-fun d!70227 () Bool)

(assert (=> d!70227 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33146 d!70227))

(declare-fun d!70231 () Bool)

(assert (=> d!70231 (= (array_inv!5935 a!3305) (bvsge (size!8324 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33146 d!70231))

(declare-fun b!329805 () Bool)

(declare-fun lt!158342 () SeekEntryResult!3103)

(assert (=> b!329805 (and (bvsge (index!14590 lt!158342) #b00000000000000000000000000000000) (bvslt (index!14590 lt!158342) (size!8324 a!3305)))))

(declare-fun res!181749 () Bool)

(assert (=> b!329805 (= res!181749 (= (select (arr!7972 a!3305) (index!14590 lt!158342)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202562 () Bool)

(assert (=> b!329805 (=> res!181749 e!202562)))

(declare-fun b!329806 () Bool)

(declare-fun e!202564 () Bool)

(declare-fun e!202560 () Bool)

(assert (=> b!329806 (= e!202564 e!202560)))

(declare-fun res!181748 () Bool)

(assert (=> b!329806 (= res!181748 (and (is-Intermediate!3103 lt!158342) (not (undefined!3915 lt!158342)) (bvslt (x!32861 lt!158342) #b01111111111111111111111111111110) (bvsge (x!32861 lt!158342) #b00000000000000000000000000000000) (bvsge (x!32861 lt!158342) x!1490)))))

(assert (=> b!329806 (=> (not res!181748) (not e!202560))))

(declare-fun d!70233 () Bool)

(assert (=> d!70233 e!202564))

(declare-fun c!51670 () Bool)

(assert (=> d!70233 (= c!51670 (and (is-Intermediate!3103 lt!158342) (undefined!3915 lt!158342)))))

(declare-fun e!202561 () SeekEntryResult!3103)

(assert (=> d!70233 (= lt!158342 e!202561)))

(declare-fun c!51671 () Bool)

(assert (=> d!70233 (= c!51671 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!158343 () (_ BitVec 64))

(assert (=> d!70233 (= lt!158343 (select (arr!7972 a!3305) index!1840))))

(assert (=> d!70233 (validMask!0 mask!3777)))

(assert (=> d!70233 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158342)))

(declare-fun b!329807 () Bool)

(assert (=> b!329807 (= e!202561 (Intermediate!3103 true index!1840 x!1490))))

(declare-fun b!329808 () Bool)

(assert (=> b!329808 (and (bvsge (index!14590 lt!158342) #b00000000000000000000000000000000) (bvslt (index!14590 lt!158342) (size!8324 a!3305)))))

(declare-fun res!181747 () Bool)

(assert (=> b!329808 (= res!181747 (= (select (arr!7972 a!3305) (index!14590 lt!158342)) k!2497))))

(assert (=> b!329808 (=> res!181747 e!202562)))

(assert (=> b!329808 (= e!202560 e!202562)))

(declare-fun b!329809 () Bool)

(assert (=> b!329809 (= e!202564 (bvsge (x!32861 lt!158342) #b01111111111111111111111111111110))))

(declare-fun b!329810 () Bool)

(declare-fun e!202563 () SeekEntryResult!3103)

(assert (=> b!329810 (= e!202563 (Intermediate!3103 false index!1840 x!1490))))

(declare-fun b!329811 () Bool)

(assert (=> b!329811 (= e!202561 e!202563)))

(declare-fun c!51672 () Bool)

(assert (=> b!329811 (= c!51672 (or (= lt!158343 k!2497) (= (bvadd lt!158343 lt!158343) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329812 () Bool)

(assert (=> b!329812 (= e!202563 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!329813 () Bool)

(assert (=> b!329813 (and (bvsge (index!14590 lt!158342) #b00000000000000000000000000000000) (bvslt (index!14590 lt!158342) (size!8324 a!3305)))))

(assert (=> b!329813 (= e!202562 (= (select (arr!7972 a!3305) (index!14590 lt!158342)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!70233 c!51671) b!329807))

(assert (= (and d!70233 (not c!51671)) b!329811))

(assert (= (and b!329811 c!51672) b!329810))

(assert (= (and b!329811 (not c!51672)) b!329812))

(assert (= (and d!70233 c!51670) b!329809))

(assert (= (and d!70233 (not c!51670)) b!329806))

(assert (= (and b!329806 res!181748) b!329808))

(assert (= (and b!329808 (not res!181747)) b!329805))

(assert (= (and b!329805 (not res!181749)) b!329813))

(declare-fun m!335315 () Bool)

(assert (=> b!329813 m!335315))

(assert (=> b!329812 m!335259))

(assert (=> b!329812 m!335259))

(declare-fun m!335317 () Bool)

(assert (=> b!329812 m!335317))

(assert (=> b!329808 m!335315))

(assert (=> d!70233 m!335279))

(assert (=> d!70233 m!335271))

(assert (=> b!329805 m!335315))

(assert (=> b!329700 d!70233))

(declare-fun b!329889 () Bool)

(declare-fun e!202610 () SeekEntryResult!3103)

(declare-fun lt!158372 () SeekEntryResult!3103)

(assert (=> b!329889 (= e!202610 (Found!3103 (index!14590 lt!158372)))))

(declare-fun b!329890 () Bool)

(declare-fun e!202611 () SeekEntryResult!3103)

(assert (=> b!329890 (= e!202611 (MissingZero!3103 (index!14590 lt!158372)))))

(declare-fun b!329891 () Bool)

(declare-fun e!202612 () SeekEntryResult!3103)

(assert (=> b!329891 (= e!202612 e!202610)))

(declare-fun lt!158371 () (_ BitVec 64))

(assert (=> b!329891 (= lt!158371 (select (arr!7972 a!3305) (index!14590 lt!158372)))))

(declare-fun c!51700 () Bool)

(assert (=> b!329891 (= c!51700 (= lt!158371 k!2497))))

(declare-fun b!329892 () Bool)

(declare-fun c!51701 () Bool)

(assert (=> b!329892 (= c!51701 (= lt!158371 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329892 (= e!202610 e!202611)))

(declare-fun b!329893 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16856 (_ BitVec 32)) SeekEntryResult!3103)

(assert (=> b!329893 (= e!202611 (seekKeyOrZeroReturnVacant!0 (x!32861 lt!158372) (index!14590 lt!158372) (index!14590 lt!158372) k!2497 a!3305 mask!3777))))

(declare-fun d!70243 () Bool)

(declare-fun lt!158373 () SeekEntryResult!3103)

(assert (=> d!70243 (and (or (is-Undefined!3103 lt!158373) (not (is-Found!3103 lt!158373)) (and (bvsge (index!14589 lt!158373) #b00000000000000000000000000000000) (bvslt (index!14589 lt!158373) (size!8324 a!3305)))) (or (is-Undefined!3103 lt!158373) (is-Found!3103 lt!158373) (not (is-MissingZero!3103 lt!158373)) (and (bvsge (index!14588 lt!158373) #b00000000000000000000000000000000) (bvslt (index!14588 lt!158373) (size!8324 a!3305)))) (or (is-Undefined!3103 lt!158373) (is-Found!3103 lt!158373) (is-MissingZero!3103 lt!158373) (not (is-MissingVacant!3103 lt!158373)) (and (bvsge (index!14591 lt!158373) #b00000000000000000000000000000000) (bvslt (index!14591 lt!158373) (size!8324 a!3305)))) (or (is-Undefined!3103 lt!158373) (ite (is-Found!3103 lt!158373) (= (select (arr!7972 a!3305) (index!14589 lt!158373)) k!2497) (ite (is-MissingZero!3103 lt!158373) (= (select (arr!7972 a!3305) (index!14588 lt!158373)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3103 lt!158373) (= (select (arr!7972 a!3305) (index!14591 lt!158373)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70243 (= lt!158373 e!202612)))

(declare-fun c!51702 () Bool)

(assert (=> d!70243 (= c!51702 (and (is-Intermediate!3103 lt!158372) (undefined!3915 lt!158372)))))

(assert (=> d!70243 (= lt!158372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!70243 (validMask!0 mask!3777)))

(assert (=> d!70243 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!158373)))

(declare-fun b!329894 () Bool)

(assert (=> b!329894 (= e!202612 Undefined!3103)))

(assert (= (and d!70243 c!51702) b!329894))

(assert (= (and d!70243 (not c!51702)) b!329891))

(assert (= (and b!329891 c!51700) b!329889))

(assert (= (and b!329891 (not c!51700)) b!329892))

(assert (= (and b!329892 c!51701) b!329890))

(assert (= (and b!329892 (not c!51701)) b!329893))

(declare-fun m!335367 () Bool)

(assert (=> b!329891 m!335367))

(declare-fun m!335369 () Bool)

(assert (=> b!329893 m!335369))

(assert (=> d!70243 m!335271))

(assert (=> d!70243 m!335281))

(declare-fun m!335371 () Bool)

(assert (=> d!70243 m!335371))

(declare-fun m!335373 () Bool)

(assert (=> d!70243 m!335373))

(assert (=> d!70243 m!335281))

(assert (=> d!70243 m!335283))

(declare-fun m!335375 () Bool)

(assert (=> d!70243 m!335375))

(assert (=> b!329702 d!70243))

(declare-fun b!329915 () Bool)

(declare-fun e!202629 () Bool)

(declare-fun call!26161 () Bool)

(assert (=> b!329915 (= e!202629 call!26161)))

(declare-fun b!329916 () Bool)

(declare-fun e!202628 () Bool)

(assert (=> b!329916 (= e!202628 e!202629)))

(declare-fun c!51708 () Bool)

(assert (=> b!329916 (= c!51708 (validKeyInArray!0 (select (arr!7972 a!3305) #b00000000000000000000000000000000)))))

(declare-fun d!70269 () Bool)

(declare-fun res!181782 () Bool)

(assert (=> d!70269 (=> res!181782 e!202628)))

(assert (=> d!70269 (= res!181782 (bvsge #b00000000000000000000000000000000 (size!8324 a!3305)))))

(assert (=> d!70269 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!202628)))

(declare-fun bm!26158 () Bool)

(assert (=> bm!26158 (= call!26161 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!329917 () Bool)

(declare-fun e!202630 () Bool)

(assert (=> b!329917 (= e!202629 e!202630)))

(declare-fun lt!158397 () (_ BitVec 64))

(assert (=> b!329917 (= lt!158397 (select (arr!7972 a!3305) #b00000000000000000000000000000000))))

(declare-fun lt!158395 () Unit!10214)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16856 (_ BitVec 64) (_ BitVec 32)) Unit!10214)

(assert (=> b!329917 (= lt!158395 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158397 #b00000000000000000000000000000000))))

(assert (=> b!329917 (arrayContainsKey!0 a!3305 lt!158397 #b00000000000000000000000000000000)))

(declare-fun lt!158396 () Unit!10214)

(assert (=> b!329917 (= lt!158396 lt!158395)))

(declare-fun res!181783 () Bool)

(assert (=> b!329917 (= res!181783 (= (seekEntryOrOpen!0 (select (arr!7972 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3103 #b00000000000000000000000000000000)))))

(assert (=> b!329917 (=> (not res!181783) (not e!202630))))

(declare-fun b!329918 () Bool)

(assert (=> b!329918 (= e!202630 call!26161)))

(assert (= (and d!70269 (not res!181782)) b!329916))

(assert (= (and b!329916 c!51708) b!329917))

(assert (= (and b!329916 (not c!51708)) b!329915))

(assert (= (and b!329917 res!181783) b!329918))

(assert (= (or b!329918 b!329915) bm!26158))

(assert (=> b!329916 m!335297))

(assert (=> b!329916 m!335297))

(declare-fun m!335387 () Bool)

(assert (=> b!329916 m!335387))

(declare-fun m!335389 () Bool)

(assert (=> bm!26158 m!335389))

(assert (=> b!329917 m!335297))

(declare-fun m!335391 () Bool)

(assert (=> b!329917 m!335391))

(declare-fun m!335393 () Bool)

(assert (=> b!329917 m!335393))

(assert (=> b!329917 m!335297))

(declare-fun m!335395 () Bool)

(assert (=> b!329917 m!335395))

(assert (=> b!329697 d!70269))

(declare-fun b!329928 () Bool)

(declare-fun lt!158400 () SeekEntryResult!3103)

(assert (=> b!329928 (and (bvsge (index!14590 lt!158400) #b00000000000000000000000000000000) (bvslt (index!14590 lt!158400) (size!8324 a!3305)))))

(declare-fun res!181789 () Bool)

(assert (=> b!329928 (= res!181789 (= (select (arr!7972 a!3305) (index!14590 lt!158400)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202638 () Bool)

(assert (=> b!329928 (=> res!181789 e!202638)))

(declare-fun b!329929 () Bool)

(declare-fun e!202640 () Bool)

(declare-fun e!202636 () Bool)

(assert (=> b!329929 (= e!202640 e!202636)))

(declare-fun res!181788 () Bool)

(assert (=> b!329929 (= res!181788 (and (is-Intermediate!3103 lt!158400) (not (undefined!3915 lt!158400)) (bvslt (x!32861 lt!158400) #b01111111111111111111111111111110) (bvsge (x!32861 lt!158400) #b00000000000000000000000000000000) (bvsge (x!32861 lt!158400) #b00000000000000000000000000000000)))))

(assert (=> b!329929 (=> (not res!181788) (not e!202636))))

(declare-fun d!70273 () Bool)

(assert (=> d!70273 e!202640))

(declare-fun c!51712 () Bool)

(assert (=> d!70273 (= c!51712 (and (is-Intermediate!3103 lt!158400) (undefined!3915 lt!158400)))))

(declare-fun e!202637 () SeekEntryResult!3103)

(assert (=> d!70273 (= lt!158400 e!202637)))

(declare-fun c!51713 () Bool)

(assert (=> d!70273 (= c!51713 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!158401 () (_ BitVec 64))

(assert (=> d!70273 (= lt!158401 (select (arr!7972 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!70273 (validMask!0 mask!3777)))

(assert (=> d!70273 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158400)))

(declare-fun b!329930 () Bool)

(assert (=> b!329930 (= e!202637 (Intermediate!3103 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329931 () Bool)

(assert (=> b!329931 (and (bvsge (index!14590 lt!158400) #b00000000000000000000000000000000) (bvslt (index!14590 lt!158400) (size!8324 a!3305)))))

(declare-fun res!181787 () Bool)

(assert (=> b!329931 (= res!181787 (= (select (arr!7972 a!3305) (index!14590 lt!158400)) k!2497))))

(assert (=> b!329931 (=> res!181787 e!202638)))

(assert (=> b!329931 (= e!202636 e!202638)))

(declare-fun b!329932 () Bool)

(assert (=> b!329932 (= e!202640 (bvsge (x!32861 lt!158400) #b01111111111111111111111111111110))))

(declare-fun b!329933 () Bool)

(declare-fun e!202639 () SeekEntryResult!3103)

(assert (=> b!329933 (= e!202639 (Intermediate!3103 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329934 () Bool)

(assert (=> b!329934 (= e!202637 e!202639)))

(declare-fun c!51714 () Bool)

(assert (=> b!329934 (= c!51714 (or (= lt!158401 k!2497) (= (bvadd lt!158401 lt!158401) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329935 () Bool)

(assert (=> b!329935 (= e!202639 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!329936 () Bool)

(assert (=> b!329936 (and (bvsge (index!14590 lt!158400) #b00000000000000000000000000000000) (bvslt (index!14590 lt!158400) (size!8324 a!3305)))))

(assert (=> b!329936 (= e!202638 (= (select (arr!7972 a!3305) (index!14590 lt!158400)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!70273 c!51713) b!329930))

(assert (= (and d!70273 (not c!51713)) b!329934))

(assert (= (and b!329934 c!51714) b!329933))

(assert (= (and b!329934 (not c!51714)) b!329935))

(assert (= (and d!70273 c!51712) b!329932))

(assert (= (and d!70273 (not c!51712)) b!329929))

(assert (= (and b!329929 res!181788) b!329931))

(assert (= (and b!329931 (not res!181787)) b!329928))

(assert (= (and b!329928 (not res!181789)) b!329936))

(declare-fun m!335405 () Bool)

(assert (=> b!329936 m!335405))

(assert (=> b!329935 m!335281))

(declare-fun m!335407 () Bool)

(assert (=> b!329935 m!335407))

(assert (=> b!329935 m!335407))

(declare-fun m!335409 () Bool)

(assert (=> b!329935 m!335409))

(assert (=> b!329931 m!335405))

(assert (=> d!70273 m!335281))

(declare-fun m!335411 () Bool)

(assert (=> d!70273 m!335411))

(assert (=> d!70273 m!335271))

(assert (=> b!329928 m!335405))

(assert (=> b!329691 d!70273))

(declare-fun d!70277 () Bool)

(declare-fun lt!158413 () (_ BitVec 32))

(declare-fun lt!158412 () (_ BitVec 32))

(assert (=> d!70277 (= lt!158413 (bvmul (bvxor lt!158412 (bvlshr lt!158412 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70277 (= lt!158412 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70277 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!181791 (let ((h!5420 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32869 (bvmul (bvxor h!5420 (bvlshr h!5420 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32869 (bvlshr x!32869 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!181791 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!181791 #b00000000000000000000000000000000))))))

(assert (=> d!70277 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!158413 (bvlshr lt!158413 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!329691 d!70277))

(declare-fun d!70279 () Bool)

(assert (=> d!70279 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!329693 d!70279))

(declare-fun b!329937 () Bool)

(declare-fun lt!158414 () SeekEntryResult!3103)

(assert (=> b!329937 (and (bvsge (index!14590 lt!158414) #b00000000000000000000000000000000) (bvslt (index!14590 lt!158414) (size!8324 a!3305)))))

(declare-fun res!181794 () Bool)

(assert (=> b!329937 (= res!181794 (= (select (arr!7972 a!3305) (index!14590 lt!158414)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202643 () Bool)

(assert (=> b!329937 (=> res!181794 e!202643)))

(declare-fun b!329938 () Bool)

(declare-fun e!202645 () Bool)

(declare-fun e!202641 () Bool)

(assert (=> b!329938 (= e!202645 e!202641)))

(declare-fun res!181793 () Bool)

(assert (=> b!329938 (= res!181793 (and (is-Intermediate!3103 lt!158414) (not (undefined!3915 lt!158414)) (bvslt (x!32861 lt!158414) #b01111111111111111111111111111110) (bvsge (x!32861 lt!158414) #b00000000000000000000000000000000) (bvsge (x!32861 lt!158414) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!329938 (=> (not res!181793) (not e!202641))))

(declare-fun d!70281 () Bool)

(assert (=> d!70281 e!202645))

(declare-fun c!51715 () Bool)

(assert (=> d!70281 (= c!51715 (and (is-Intermediate!3103 lt!158414) (undefined!3915 lt!158414)))))

(declare-fun e!202642 () SeekEntryResult!3103)

(assert (=> d!70281 (= lt!158414 e!202642)))

(declare-fun c!51716 () Bool)

(assert (=> d!70281 (= c!51716 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(declare-fun lt!158415 () (_ BitVec 64))

(assert (=> d!70281 (= lt!158415 (select (arr!7972 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)))))

(assert (=> d!70281 (validMask!0 mask!3777)))

(assert (=> d!70281 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777) lt!158414)))

(declare-fun b!329939 () Bool)

(assert (=> b!329939 (= e!202642 (Intermediate!3103 true (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!329940 () Bool)

(assert (=> b!329940 (and (bvsge (index!14590 lt!158414) #b00000000000000000000000000000000) (bvslt (index!14590 lt!158414) (size!8324 a!3305)))))

(declare-fun res!181792 () Bool)

(assert (=> b!329940 (= res!181792 (= (select (arr!7972 a!3305) (index!14590 lt!158414)) k!2497))))

(assert (=> b!329940 (=> res!181792 e!202643)))

(assert (=> b!329940 (= e!202641 e!202643)))

(declare-fun b!329941 () Bool)

(assert (=> b!329941 (= e!202645 (bvsge (x!32861 lt!158414) #b01111111111111111111111111111110))))

(declare-fun e!202644 () SeekEntryResult!3103)

(declare-fun b!329942 () Bool)

(assert (=> b!329942 (= e!202644 (Intermediate!3103 false (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!329943 () Bool)

(assert (=> b!329943 (= e!202642 e!202644)))

(declare-fun c!51717 () Bool)

(assert (=> b!329943 (= c!51717 (or (= lt!158415 k!2497) (= (bvadd lt!158415 lt!158415) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329944 () Bool)

(assert (=> b!329944 (= e!202644 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!329945 () Bool)

(assert (=> b!329945 (and (bvsge (index!14590 lt!158414) #b00000000000000000000000000000000) (bvslt (index!14590 lt!158414) (size!8324 a!3305)))))

(assert (=> b!329945 (= e!202643 (= (select (arr!7972 a!3305) (index!14590 lt!158414)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!70281 c!51716) b!329939))

(assert (= (and d!70281 (not c!51716)) b!329943))

