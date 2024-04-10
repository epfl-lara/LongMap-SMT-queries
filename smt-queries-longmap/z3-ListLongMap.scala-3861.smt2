; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53130 () Bool)

(assert start!53130)

(declare-fun b!577889 () Bool)

(declare-fun res!365777 () Bool)

(declare-fun e!332375 () Bool)

(assert (=> b!577889 (=> (not res!365777) (not e!332375))))

(declare-datatypes ((List!11355 0))(
  ( (Nil!11352) (Cons!11351 (h!12396 (_ BitVec 64)) (t!17583 List!11355)) )
))
(declare-fun noDuplicate!229 (List!11355) Bool)

(assert (=> b!577889 (= res!365777 (noDuplicate!229 Nil!11352))))

(declare-fun b!577890 () Bool)

(declare-fun res!365778 () Bool)

(declare-fun e!332376 () Bool)

(assert (=> b!577890 (=> (not res!365778) (not e!332376))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36076 0))(
  ( (array!36077 (arr!17314 (Array (_ BitVec 32) (_ BitVec 64))) (size!17678 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36076)

(assert (=> b!577890 (= res!365778 (and (= (size!17678 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17678 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17678 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!365779 () Bool)

(assert (=> start!53130 (=> (not res!365779) (not e!332376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53130 (= res!365779 (validMask!0 mask!3053))))

(assert (=> start!53130 e!332376))

(assert (=> start!53130 true))

(declare-fun array_inv!13110 (array!36076) Bool)

(assert (=> start!53130 (array_inv!13110 a!2986)))

(declare-fun b!577891 () Bool)

(declare-fun res!365785 () Bool)

(assert (=> b!577891 (=> (not res!365785) (not e!332376))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36076 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577891 (= res!365785 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577892 () Bool)

(declare-fun res!365781 () Bool)

(assert (=> b!577892 (=> (not res!365781) (not e!332375))))

(assert (=> b!577892 (= res!365781 (and (bvsle #b00000000000000000000000000000000 (size!17678 a!2986)) (bvslt (size!17678 a!2986) #b01111111111111111111111111111111)))))

(declare-fun b!577893 () Bool)

(declare-fun e!332374 () Bool)

(assert (=> b!577893 (= e!332375 e!332374)))

(declare-fun res!365786 () Bool)

(assert (=> b!577893 (=> res!365786 e!332374)))

(declare-fun contains!2903 (List!11355 (_ BitVec 64)) Bool)

(assert (=> b!577893 (= res!365786 (contains!2903 Nil!11352 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!577894 () Bool)

(declare-fun res!365782 () Bool)

(assert (=> b!577894 (=> (not res!365782) (not e!332376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577894 (= res!365782 (validKeyInArray!0 k0!1786))))

(declare-fun b!577895 () Bool)

(assert (=> b!577895 (= e!332374 (contains!2903 Nil!11352 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!577896 () Bool)

(declare-fun res!365780 () Bool)

(assert (=> b!577896 (=> (not res!365780) (not e!332375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36076 (_ BitVec 32)) Bool)

(assert (=> b!577896 (= res!365780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!577897 () Bool)

(assert (=> b!577897 (= e!332376 e!332375)))

(declare-fun res!365784 () Bool)

(assert (=> b!577897 (=> (not res!365784) (not e!332375))))

(declare-datatypes ((SeekEntryResult!5754 0))(
  ( (MissingZero!5754 (index!25243 (_ BitVec 32))) (Found!5754 (index!25244 (_ BitVec 32))) (Intermediate!5754 (undefined!6566 Bool) (index!25245 (_ BitVec 32)) (x!54151 (_ BitVec 32))) (Undefined!5754) (MissingVacant!5754 (index!25246 (_ BitVec 32))) )
))
(declare-fun lt!264100 () SeekEntryResult!5754)

(assert (=> b!577897 (= res!365784 (or (= lt!264100 (MissingZero!5754 i!1108)) (= lt!264100 (MissingVacant!5754 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36076 (_ BitVec 32)) SeekEntryResult!5754)

(assert (=> b!577897 (= lt!264100 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!577898 () Bool)

(declare-fun res!365783 () Bool)

(assert (=> b!577898 (=> (not res!365783) (not e!332376))))

(assert (=> b!577898 (= res!365783 (validKeyInArray!0 (select (arr!17314 a!2986) j!136)))))

(assert (= (and start!53130 res!365779) b!577890))

(assert (= (and b!577890 res!365778) b!577898))

(assert (= (and b!577898 res!365783) b!577894))

(assert (= (and b!577894 res!365782) b!577891))

(assert (= (and b!577891 res!365785) b!577897))

(assert (= (and b!577897 res!365784) b!577896))

(assert (= (and b!577896 res!365780) b!577892))

(assert (= (and b!577892 res!365781) b!577889))

(assert (= (and b!577889 res!365777) b!577893))

(assert (= (and b!577893 (not res!365786)) b!577895))

(declare-fun m!556649 () Bool)

(assert (=> start!53130 m!556649))

(declare-fun m!556651 () Bool)

(assert (=> start!53130 m!556651))

(declare-fun m!556653 () Bool)

(assert (=> b!577895 m!556653))

(declare-fun m!556655 () Bool)

(assert (=> b!577891 m!556655))

(declare-fun m!556657 () Bool)

(assert (=> b!577893 m!556657))

(declare-fun m!556659 () Bool)

(assert (=> b!577894 m!556659))

(declare-fun m!556661 () Bool)

(assert (=> b!577897 m!556661))

(declare-fun m!556663 () Bool)

(assert (=> b!577898 m!556663))

(assert (=> b!577898 m!556663))

(declare-fun m!556665 () Bool)

(assert (=> b!577898 m!556665))

(declare-fun m!556667 () Bool)

(assert (=> b!577889 m!556667))

(declare-fun m!556669 () Bool)

(assert (=> b!577896 m!556669))

(check-sat (not start!53130) (not b!577893) (not b!577889) (not b!577891) (not b!577897) (not b!577894) (not b!577898) (not b!577896) (not b!577895))
(check-sat)
(get-model)

(declare-fun d!85637 () Bool)

(declare-fun lt!264106 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!231 (List!11355) (InoxSet (_ BitVec 64)))

(assert (=> d!85637 (= lt!264106 (select (content!231 Nil!11352) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!332394 () Bool)

(assert (=> d!85637 (= lt!264106 e!332394)))

(declare-fun res!365822 () Bool)

(assert (=> d!85637 (=> (not res!365822) (not e!332394))))

(get-info :version)

(assert (=> d!85637 (= res!365822 ((_ is Cons!11351) Nil!11352))))

(assert (=> d!85637 (= (contains!2903 Nil!11352 #b0000000000000000000000000000000000000000000000000000000000000000) lt!264106)))

(declare-fun b!577933 () Bool)

(declare-fun e!332393 () Bool)

(assert (=> b!577933 (= e!332394 e!332393)))

(declare-fun res!365821 () Bool)

(assert (=> b!577933 (=> res!365821 e!332393)))

(assert (=> b!577933 (= res!365821 (= (h!12396 Nil!11352) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!577934 () Bool)

(assert (=> b!577934 (= e!332393 (contains!2903 (t!17583 Nil!11352) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!85637 res!365822) b!577933))

(assert (= (and b!577933 (not res!365821)) b!577934))

(declare-fun m!556693 () Bool)

(assert (=> d!85637 m!556693))

(declare-fun m!556695 () Bool)

(assert (=> d!85637 m!556695))

(declare-fun m!556697 () Bool)

(assert (=> b!577934 m!556697))

(assert (=> b!577893 d!85637))

(declare-fun d!85639 () Bool)

(assert (=> d!85639 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577894 d!85639))

(declare-fun b!577965 () Bool)

(declare-fun c!66429 () Bool)

(declare-fun lt!264121 () (_ BitVec 64))

(assert (=> b!577965 (= c!66429 (= lt!264121 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!332421 () SeekEntryResult!5754)

(declare-fun e!332419 () SeekEntryResult!5754)

(assert (=> b!577965 (= e!332421 e!332419)))

(declare-fun b!577966 () Bool)

(declare-fun e!332420 () SeekEntryResult!5754)

(assert (=> b!577966 (= e!332420 e!332421)))

(declare-fun lt!264119 () SeekEntryResult!5754)

(assert (=> b!577966 (= lt!264121 (select (arr!17314 a!2986) (index!25245 lt!264119)))))

(declare-fun c!66431 () Bool)

(assert (=> b!577966 (= c!66431 (= lt!264121 k0!1786))))

(declare-fun b!577967 () Bool)

(assert (=> b!577967 (= e!332419 (MissingZero!5754 (index!25245 lt!264119)))))

(declare-fun b!577968 () Bool)

(assert (=> b!577968 (= e!332420 Undefined!5754)))

(declare-fun b!577969 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36076 (_ BitVec 32)) SeekEntryResult!5754)

(assert (=> b!577969 (= e!332419 (seekKeyOrZeroReturnVacant!0 (x!54151 lt!264119) (index!25245 lt!264119) (index!25245 lt!264119) k0!1786 a!2986 mask!3053))))

(declare-fun b!577970 () Bool)

(assert (=> b!577970 (= e!332421 (Found!5754 (index!25245 lt!264119)))))

(declare-fun d!85641 () Bool)

(declare-fun lt!264120 () SeekEntryResult!5754)

(assert (=> d!85641 (and (or ((_ is Undefined!5754) lt!264120) (not ((_ is Found!5754) lt!264120)) (and (bvsge (index!25244 lt!264120) #b00000000000000000000000000000000) (bvslt (index!25244 lt!264120) (size!17678 a!2986)))) (or ((_ is Undefined!5754) lt!264120) ((_ is Found!5754) lt!264120) (not ((_ is MissingZero!5754) lt!264120)) (and (bvsge (index!25243 lt!264120) #b00000000000000000000000000000000) (bvslt (index!25243 lt!264120) (size!17678 a!2986)))) (or ((_ is Undefined!5754) lt!264120) ((_ is Found!5754) lt!264120) ((_ is MissingZero!5754) lt!264120) (not ((_ is MissingVacant!5754) lt!264120)) (and (bvsge (index!25246 lt!264120) #b00000000000000000000000000000000) (bvslt (index!25246 lt!264120) (size!17678 a!2986)))) (or ((_ is Undefined!5754) lt!264120) (ite ((_ is Found!5754) lt!264120) (= (select (arr!17314 a!2986) (index!25244 lt!264120)) k0!1786) (ite ((_ is MissingZero!5754) lt!264120) (= (select (arr!17314 a!2986) (index!25243 lt!264120)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5754) lt!264120) (= (select (arr!17314 a!2986) (index!25246 lt!264120)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85641 (= lt!264120 e!332420)))

(declare-fun c!66430 () Bool)

(assert (=> d!85641 (= c!66430 (and ((_ is Intermediate!5754) lt!264119) (undefined!6566 lt!264119)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36076 (_ BitVec 32)) SeekEntryResult!5754)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85641 (= lt!264119 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!85641 (validMask!0 mask!3053)))

(assert (=> d!85641 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!264120)))

(assert (= (and d!85641 c!66430) b!577968))

(assert (= (and d!85641 (not c!66430)) b!577966))

(assert (= (and b!577966 c!66431) b!577970))

(assert (= (and b!577966 (not c!66431)) b!577965))

(assert (= (and b!577965 c!66429) b!577967))

(assert (= (and b!577965 (not c!66429)) b!577969))

(declare-fun m!556715 () Bool)

(assert (=> b!577966 m!556715))

(declare-fun m!556717 () Bool)

(assert (=> b!577969 m!556717))

(declare-fun m!556719 () Bool)

(assert (=> d!85641 m!556719))

(declare-fun m!556721 () Bool)

(assert (=> d!85641 m!556721))

(declare-fun m!556723 () Bool)

(assert (=> d!85641 m!556723))

(declare-fun m!556725 () Bool)

(assert (=> d!85641 m!556725))

(assert (=> d!85641 m!556723))

(declare-fun m!556727 () Bool)

(assert (=> d!85641 m!556727))

(assert (=> d!85641 m!556649))

(assert (=> b!577897 d!85641))

(declare-fun d!85653 () Bool)

(assert (=> d!85653 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!53130 d!85653))

(declare-fun d!85667 () Bool)

(assert (=> d!85667 (= (array_inv!13110 a!2986) (bvsge (size!17678 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!53130 d!85667))

(declare-fun d!85669 () Bool)

(assert (=> d!85669 (= (validKeyInArray!0 (select (arr!17314 a!2986) j!136)) (and (not (= (select (arr!17314 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17314 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577898 d!85669))

(declare-fun d!85671 () Bool)

(declare-fun res!365855 () Bool)

(declare-fun e!332449 () Bool)

(assert (=> d!85671 (=> res!365855 e!332449)))

(assert (=> d!85671 (= res!365855 (bvsge #b00000000000000000000000000000000 (size!17678 a!2986)))))

(assert (=> d!85671 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!332449)))

(declare-fun b!578007 () Bool)

(declare-fun e!332448 () Bool)

(declare-fun call!32771 () Bool)

(assert (=> b!578007 (= e!332448 call!32771)))

(declare-fun b!578008 () Bool)

(declare-fun e!332447 () Bool)

(assert (=> b!578008 (= e!332447 call!32771)))

(declare-fun b!578009 () Bool)

(assert (=> b!578009 (= e!332449 e!332447)))

(declare-fun c!66443 () Bool)

(assert (=> b!578009 (= c!66443 (validKeyInArray!0 (select (arr!17314 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32768 () Bool)

(assert (=> bm!32768 (= call!32771 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!578010 () Bool)

(assert (=> b!578010 (= e!332447 e!332448)))

(declare-fun lt!264140 () (_ BitVec 64))

(assert (=> b!578010 (= lt!264140 (select (arr!17314 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!18150 0))(
  ( (Unit!18151) )
))
(declare-fun lt!264141 () Unit!18150)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36076 (_ BitVec 64) (_ BitVec 32)) Unit!18150)

(assert (=> b!578010 (= lt!264141 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!264140 #b00000000000000000000000000000000))))

(assert (=> b!578010 (arrayContainsKey!0 a!2986 lt!264140 #b00000000000000000000000000000000)))

(declare-fun lt!264139 () Unit!18150)

(assert (=> b!578010 (= lt!264139 lt!264141)))

(declare-fun res!365856 () Bool)

(assert (=> b!578010 (= res!365856 (= (seekEntryOrOpen!0 (select (arr!17314 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!5754 #b00000000000000000000000000000000)))))

(assert (=> b!578010 (=> (not res!365856) (not e!332448))))

(assert (= (and d!85671 (not res!365855)) b!578009))

(assert (= (and b!578009 c!66443) b!578010))

(assert (= (and b!578009 (not c!66443)) b!578008))

(assert (= (and b!578010 res!365856) b!578007))

(assert (= (or b!578007 b!578008) bm!32768))

(declare-fun m!556755 () Bool)

(assert (=> b!578009 m!556755))

(assert (=> b!578009 m!556755))

(declare-fun m!556757 () Bool)

(assert (=> b!578009 m!556757))

(declare-fun m!556759 () Bool)

(assert (=> bm!32768 m!556759))

(assert (=> b!578010 m!556755))

(declare-fun m!556761 () Bool)

(assert (=> b!578010 m!556761))

(declare-fun m!556763 () Bool)

(assert (=> b!578010 m!556763))

(assert (=> b!578010 m!556755))

(declare-fun m!556765 () Bool)

(assert (=> b!578010 m!556765))

(assert (=> b!577896 d!85671))

(declare-fun d!85677 () Bool)

(declare-fun res!365867 () Bool)

(declare-fun e!332466 () Bool)

(assert (=> d!85677 (=> res!365867 e!332466)))

(assert (=> d!85677 (= res!365867 (= (select (arr!17314 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!85677 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!332466)))

(declare-fun b!578033 () Bool)

(declare-fun e!332467 () Bool)

(assert (=> b!578033 (= e!332466 e!332467)))

(declare-fun res!365868 () Bool)

(assert (=> b!578033 (=> (not res!365868) (not e!332467))))

(assert (=> b!578033 (= res!365868 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17678 a!2986)))))

(declare-fun b!578034 () Bool)

(assert (=> b!578034 (= e!332467 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85677 (not res!365867)) b!578033))

(assert (= (and b!578033 res!365868) b!578034))

(assert (=> d!85677 m!556755))

(declare-fun m!556771 () Bool)

(assert (=> b!578034 m!556771))

(assert (=> b!577891 d!85677))

(declare-fun d!85681 () Bool)

(declare-fun res!365877 () Bool)

(declare-fun e!332476 () Bool)

(assert (=> d!85681 (=> res!365877 e!332476)))

(assert (=> d!85681 (= res!365877 ((_ is Nil!11352) Nil!11352))))

(assert (=> d!85681 (= (noDuplicate!229 Nil!11352) e!332476)))

(declare-fun b!578043 () Bool)

(declare-fun e!332477 () Bool)

(assert (=> b!578043 (= e!332476 e!332477)))

(declare-fun res!365878 () Bool)

(assert (=> b!578043 (=> (not res!365878) (not e!332477))))

(assert (=> b!578043 (= res!365878 (not (contains!2903 (t!17583 Nil!11352) (h!12396 Nil!11352))))))

(declare-fun b!578044 () Bool)

(assert (=> b!578044 (= e!332477 (noDuplicate!229 (t!17583 Nil!11352)))))

(assert (= (and d!85681 (not res!365877)) b!578043))

(assert (= (and b!578043 res!365878) b!578044))

(declare-fun m!556773 () Bool)

(assert (=> b!578043 m!556773))

(declare-fun m!556775 () Bool)

(assert (=> b!578044 m!556775))

(assert (=> b!577889 d!85681))

(declare-fun d!85687 () Bool)

(declare-fun lt!264148 () Bool)

(assert (=> d!85687 (= lt!264148 (select (content!231 Nil!11352) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!332479 () Bool)

(assert (=> d!85687 (= lt!264148 e!332479)))

(declare-fun res!365880 () Bool)

(assert (=> d!85687 (=> (not res!365880) (not e!332479))))

(assert (=> d!85687 (= res!365880 ((_ is Cons!11351) Nil!11352))))

(assert (=> d!85687 (= (contains!2903 Nil!11352 #b1000000000000000000000000000000000000000000000000000000000000000) lt!264148)))

(declare-fun b!578045 () Bool)

(declare-fun e!332478 () Bool)

(assert (=> b!578045 (= e!332479 e!332478)))

(declare-fun res!365879 () Bool)

(assert (=> b!578045 (=> res!365879 e!332478)))

(assert (=> b!578045 (= res!365879 (= (h!12396 Nil!11352) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!578046 () Bool)

(assert (=> b!578046 (= e!332478 (contains!2903 (t!17583 Nil!11352) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!85687 res!365880) b!578045))

(assert (= (and b!578045 (not res!365879)) b!578046))

(assert (=> d!85687 m!556693))

(declare-fun m!556777 () Bool)

(assert (=> d!85687 m!556777))

(declare-fun m!556779 () Bool)

(assert (=> b!578046 m!556779))

(assert (=> b!577895 d!85687))

(check-sat (not b!577934) (not b!578043) (not b!578046) (not d!85637) (not bm!32768) (not b!577969) (not b!578010) (not b!578034) (not b!578009) (not d!85687) (not b!578044) (not d!85641))
(check-sat)
