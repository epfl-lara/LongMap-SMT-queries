; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28508 () Bool)

(assert start!28508)

(declare-fun b!291598 () Bool)

(declare-fun e!184502 () Bool)

(declare-fun e!184499 () Bool)

(assert (=> b!291598 (= e!184502 e!184499)))

(declare-fun res!152854 () Bool)

(assert (=> b!291598 (=> (not res!152854) (not e!184499))))

(declare-datatypes ((SeekEntryResult!2135 0))(
  ( (MissingZero!2135 (index!10710 (_ BitVec 32))) (Found!2135 (index!10711 (_ BitVec 32))) (Intermediate!2135 (undefined!2947 Bool) (index!10712 (_ BitVec 32)) (x!28919 (_ BitVec 32))) (Undefined!2135) (MissingVacant!2135 (index!10713 (_ BitVec 32))) )
))
(declare-fun lt!144180 () SeekEntryResult!2135)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!144179 () Bool)

(assert (=> b!291598 (= res!152854 (or lt!144179 (= lt!144180 (MissingVacant!2135 i!1256))))))

(assert (=> b!291598 (= lt!144179 (= lt!144180 (MissingZero!2135 i!1256)))))

(declare-datatypes ((array!14725 0))(
  ( (array!14726 (arr!6987 (Array (_ BitVec 32) (_ BitVec 64))) (size!7340 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14725)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14725 (_ BitVec 32)) SeekEntryResult!2135)

(assert (=> b!291598 (= lt!144180 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291599 () Bool)

(declare-fun res!152848 () Bool)

(assert (=> b!291599 (=> (not res!152848) (not e!184502))))

(assert (=> b!291599 (= res!152848 (and (= (size!7340 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7340 a!3312))))))

(declare-fun b!291600 () Bool)

(declare-fun res!152853 () Bool)

(assert (=> b!291600 (=> (not res!152853) (not e!184502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291600 (= res!152853 (validKeyInArray!0 k0!2524))))

(declare-fun b!291601 () Bool)

(declare-fun e!184501 () Bool)

(declare-fun e!184500 () Bool)

(assert (=> b!291601 (= e!184501 e!184500)))

(declare-fun res!152847 () Bool)

(assert (=> b!291601 (=> (not res!152847) (not e!184500))))

(declare-fun lt!144175 () Bool)

(declare-fun lt!144177 () SeekEntryResult!2135)

(assert (=> b!291601 (= res!152847 (and (or lt!144175 (not (undefined!2947 lt!144177))) (not lt!144175) (= (select (arr!6987 a!3312) (index!10712 lt!144177)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291601 (= lt!144175 (not ((_ is Intermediate!2135) lt!144177)))))

(declare-fun res!152850 () Bool)

(assert (=> start!28508 (=> (not res!152850) (not e!184502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28508 (= res!152850 (validMask!0 mask!3809))))

(assert (=> start!28508 e!184502))

(assert (=> start!28508 true))

(declare-fun array_inv!4959 (array!14725) Bool)

(assert (=> start!28508 (array_inv!4959 a!3312)))

(declare-fun b!291602 () Bool)

(declare-fun lt!144178 () (_ BitVec 32))

(assert (=> b!291602 (= e!184500 (not (or (not (= lt!144177 (Intermediate!2135 false (index!10712 lt!144177) (x!28919 lt!144177)))) (bvsgt #b00000000000000000000000000000000 (x!28919 lt!144177)) (and (bvsge lt!144178 #b00000000000000000000000000000000) (bvslt lt!144178 (size!7340 a!3312))))))))

(assert (=> b!291602 (= (index!10712 lt!144177) i!1256)))

(declare-fun b!291603 () Bool)

(assert (=> b!291603 (= e!184499 e!184501)))

(declare-fun res!152851 () Bool)

(assert (=> b!291603 (=> (not res!152851) (not e!184501))))

(assert (=> b!291603 (= res!152851 (and (not lt!144179) (= lt!144180 (MissingVacant!2135 i!1256))))))

(declare-fun lt!144176 () SeekEntryResult!2135)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14725 (_ BitVec 32)) SeekEntryResult!2135)

(assert (=> b!291603 (= lt!144176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144178 k0!2524 (array!14726 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7340 a!3312)) mask!3809))))

(assert (=> b!291603 (= lt!144177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144178 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291603 (= lt!144178 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291604 () Bool)

(declare-fun res!152849 () Bool)

(assert (=> b!291604 (=> (not res!152849) (not e!184502))))

(declare-fun arrayContainsKey!0 (array!14725 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291604 (= res!152849 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291605 () Bool)

(declare-fun res!152852 () Bool)

(assert (=> b!291605 (=> (not res!152852) (not e!184499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14725 (_ BitVec 32)) Bool)

(assert (=> b!291605 (= res!152852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28508 res!152850) b!291599))

(assert (= (and b!291599 res!152848) b!291600))

(assert (= (and b!291600 res!152853) b!291604))

(assert (= (and b!291604 res!152849) b!291598))

(assert (= (and b!291598 res!152854) b!291605))

(assert (= (and b!291605 res!152852) b!291603))

(assert (= (and b!291603 res!152851) b!291601))

(assert (= (and b!291601 res!152847) b!291602))

(declare-fun m!304985 () Bool)

(assert (=> b!291600 m!304985))

(declare-fun m!304987 () Bool)

(assert (=> b!291598 m!304987))

(declare-fun m!304989 () Bool)

(assert (=> b!291603 m!304989))

(declare-fun m!304991 () Bool)

(assert (=> b!291603 m!304991))

(declare-fun m!304993 () Bool)

(assert (=> b!291603 m!304993))

(declare-fun m!304995 () Bool)

(assert (=> b!291603 m!304995))

(declare-fun m!304997 () Bool)

(assert (=> start!28508 m!304997))

(declare-fun m!304999 () Bool)

(assert (=> start!28508 m!304999))

(declare-fun m!305001 () Bool)

(assert (=> b!291605 m!305001))

(declare-fun m!305003 () Bool)

(assert (=> b!291604 m!305003))

(declare-fun m!305005 () Bool)

(assert (=> b!291601 m!305005))

(check-sat (not b!291604) (not start!28508) (not b!291605) (not b!291600) (not b!291603) (not b!291598))
(check-sat)
(get-model)

(declare-fun d!66261 () Bool)

(assert (=> d!66261 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28508 d!66261))

(declare-fun d!66263 () Bool)

(assert (=> d!66263 (= (array_inv!4959 a!3312) (bvsge (size!7340 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28508 d!66263))

(declare-fun d!66265 () Bool)

(declare-fun res!152907 () Bool)

(declare-fun e!184538 () Bool)

(assert (=> d!66265 (=> res!152907 e!184538)))

(assert (=> d!66265 (= res!152907 (= (select (arr!6987 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66265 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!184538)))

(declare-fun b!291658 () Bool)

(declare-fun e!184539 () Bool)

(assert (=> b!291658 (= e!184538 e!184539)))

(declare-fun res!152908 () Bool)

(assert (=> b!291658 (=> (not res!152908) (not e!184539))))

(assert (=> b!291658 (= res!152908 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7340 a!3312)))))

(declare-fun b!291659 () Bool)

(assert (=> b!291659 (= e!184539 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66265 (not res!152907)) b!291658))

(assert (= (and b!291658 res!152908) b!291659))

(declare-fun m!305051 () Bool)

(assert (=> d!66265 m!305051))

(declare-fun m!305053 () Bool)

(assert (=> b!291659 m!305053))

(assert (=> b!291604 d!66265))

(declare-fun bm!25627 () Bool)

(declare-fun call!25630 () Bool)

(assert (=> bm!25627 (= call!25630 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!291674 () Bool)

(declare-fun e!184552 () Bool)

(declare-fun e!184554 () Bool)

(assert (=> b!291674 (= e!184552 e!184554)))

(declare-fun lt!144224 () (_ BitVec 64))

(assert (=> b!291674 (= lt!144224 (select (arr!6987 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9102 0))(
  ( (Unit!9103) )
))
(declare-fun lt!144225 () Unit!9102)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14725 (_ BitVec 64) (_ BitVec 32)) Unit!9102)

(assert (=> b!291674 (= lt!144225 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!144224 #b00000000000000000000000000000000))))

(assert (=> b!291674 (arrayContainsKey!0 a!3312 lt!144224 #b00000000000000000000000000000000)))

(declare-fun lt!144223 () Unit!9102)

(assert (=> b!291674 (= lt!144223 lt!144225)))

(declare-fun res!152920 () Bool)

(assert (=> b!291674 (= res!152920 (= (seekEntryOrOpen!0 (select (arr!6987 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2135 #b00000000000000000000000000000000)))))

(assert (=> b!291674 (=> (not res!152920) (not e!184554))))

(declare-fun b!291675 () Bool)

(assert (=> b!291675 (= e!184552 call!25630)))

(declare-fun b!291676 () Bool)

(assert (=> b!291676 (= e!184554 call!25630)))

(declare-fun b!291677 () Bool)

(declare-fun e!184553 () Bool)

(assert (=> b!291677 (= e!184553 e!184552)))

(declare-fun c!46942 () Bool)

(assert (=> b!291677 (= c!46942 (validKeyInArray!0 (select (arr!6987 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!66267 () Bool)

(declare-fun res!152919 () Bool)

(assert (=> d!66267 (=> res!152919 e!184553)))

(assert (=> d!66267 (= res!152919 (bvsge #b00000000000000000000000000000000 (size!7340 a!3312)))))

(assert (=> d!66267 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!184553)))

(assert (= (and d!66267 (not res!152919)) b!291677))

(assert (= (and b!291677 c!46942) b!291674))

(assert (= (and b!291677 (not c!46942)) b!291675))

(assert (= (and b!291674 res!152920) b!291676))

(assert (= (or b!291676 b!291675) bm!25627))

(declare-fun m!305059 () Bool)

(assert (=> bm!25627 m!305059))

(assert (=> b!291674 m!305051))

(declare-fun m!305061 () Bool)

(assert (=> b!291674 m!305061))

(declare-fun m!305063 () Bool)

(assert (=> b!291674 m!305063))

(assert (=> b!291674 m!305051))

(declare-fun m!305065 () Bool)

(assert (=> b!291674 m!305065))

(assert (=> b!291677 m!305051))

(assert (=> b!291677 m!305051))

(declare-fun m!305067 () Bool)

(assert (=> b!291677 m!305067))

(assert (=> b!291605 d!66267))

(declare-fun d!66273 () Bool)

(assert (=> d!66273 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!291600 d!66273))

(declare-fun b!291738 () Bool)

(declare-fun e!184592 () Bool)

(declare-fun e!184590 () Bool)

(assert (=> b!291738 (= e!184592 e!184590)))

(declare-fun res!152933 () Bool)

(declare-fun lt!144254 () SeekEntryResult!2135)

(assert (=> b!291738 (= res!152933 (and ((_ is Intermediate!2135) lt!144254) (not (undefined!2947 lt!144254)) (bvslt (x!28919 lt!144254) #b01111111111111111111111111111110) (bvsge (x!28919 lt!144254) #b00000000000000000000000000000000) (bvsge (x!28919 lt!144254) #b00000000000000000000000000000000)))))

(assert (=> b!291738 (=> (not res!152933) (not e!184590))))

(declare-fun b!291739 () Bool)

(declare-fun e!184591 () SeekEntryResult!2135)

(assert (=> b!291739 (= e!184591 (Intermediate!2135 true lt!144178 #b00000000000000000000000000000000))))

(declare-fun e!184593 () SeekEntryResult!2135)

(declare-fun b!291740 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291740 (= e!184593 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!144178 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14726 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7340 a!3312)) mask!3809))))

(declare-fun b!291742 () Bool)

(assert (=> b!291742 (= e!184592 (bvsge (x!28919 lt!144254) #b01111111111111111111111111111110))))

(declare-fun b!291743 () Bool)

(assert (=> b!291743 (and (bvsge (index!10712 lt!144254) #b00000000000000000000000000000000) (bvslt (index!10712 lt!144254) (size!7340 (array!14726 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7340 a!3312)))))))

(declare-fun e!184589 () Bool)

(assert (=> b!291743 (= e!184589 (= (select (arr!6987 (array!14726 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7340 a!3312))) (index!10712 lt!144254)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!291744 () Bool)

(assert (=> b!291744 (= e!184593 (Intermediate!2135 false lt!144178 #b00000000000000000000000000000000))))

(declare-fun b!291745 () Bool)

(assert (=> b!291745 (= e!184591 e!184593)))

(declare-fun c!46967 () Bool)

(declare-fun lt!144255 () (_ BitVec 64))

(assert (=> b!291745 (= c!46967 (or (= lt!144255 k0!2524) (= (bvadd lt!144255 lt!144255) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291746 () Bool)

(assert (=> b!291746 (and (bvsge (index!10712 lt!144254) #b00000000000000000000000000000000) (bvslt (index!10712 lt!144254) (size!7340 (array!14726 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7340 a!3312)))))))

(declare-fun res!152935 () Bool)

(assert (=> b!291746 (= res!152935 (= (select (arr!6987 (array!14726 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7340 a!3312))) (index!10712 lt!144254)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!291746 (=> res!152935 e!184589)))

(declare-fun b!291741 () Bool)

(assert (=> b!291741 (and (bvsge (index!10712 lt!144254) #b00000000000000000000000000000000) (bvslt (index!10712 lt!144254) (size!7340 (array!14726 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7340 a!3312)))))))

(declare-fun res!152934 () Bool)

(assert (=> b!291741 (= res!152934 (= (select (arr!6987 (array!14726 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7340 a!3312))) (index!10712 lt!144254)) k0!2524))))

(assert (=> b!291741 (=> res!152934 e!184589)))

(assert (=> b!291741 (= e!184590 e!184589)))

(declare-fun d!66275 () Bool)

(assert (=> d!66275 e!184592))

(declare-fun c!46969 () Bool)

(assert (=> d!66275 (= c!46969 (and ((_ is Intermediate!2135) lt!144254) (undefined!2947 lt!144254)))))

(assert (=> d!66275 (= lt!144254 e!184591)))

(declare-fun c!46968 () Bool)

(assert (=> d!66275 (= c!46968 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66275 (= lt!144255 (select (arr!6987 (array!14726 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7340 a!3312))) lt!144178))))

(assert (=> d!66275 (validMask!0 mask!3809)))

(assert (=> d!66275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144178 k0!2524 (array!14726 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7340 a!3312)) mask!3809) lt!144254)))

(assert (= (and d!66275 c!46968) b!291739))

(assert (= (and d!66275 (not c!46968)) b!291745))

(assert (= (and b!291745 c!46967) b!291744))

(assert (= (and b!291745 (not c!46967)) b!291740))

(assert (= (and d!66275 c!46969) b!291742))

(assert (= (and d!66275 (not c!46969)) b!291738))

(assert (= (and b!291738 res!152933) b!291741))

(assert (= (and b!291741 (not res!152934)) b!291746))

(assert (= (and b!291746 (not res!152935)) b!291743))

(declare-fun m!305091 () Bool)

(assert (=> b!291740 m!305091))

(assert (=> b!291740 m!305091))

(declare-fun m!305093 () Bool)

(assert (=> b!291740 m!305093))

(declare-fun m!305095 () Bool)

(assert (=> b!291741 m!305095))

(assert (=> b!291746 m!305095))

(declare-fun m!305097 () Bool)

(assert (=> d!66275 m!305097))

(assert (=> d!66275 m!304997))

(assert (=> b!291743 m!305095))

(assert (=> b!291603 d!66275))

(declare-fun b!291753 () Bool)

(declare-fun e!184600 () Bool)

(declare-fun e!184598 () Bool)

(assert (=> b!291753 (= e!184600 e!184598)))

(declare-fun res!152936 () Bool)

(declare-fun lt!144259 () SeekEntryResult!2135)

(assert (=> b!291753 (= res!152936 (and ((_ is Intermediate!2135) lt!144259) (not (undefined!2947 lt!144259)) (bvslt (x!28919 lt!144259) #b01111111111111111111111111111110) (bvsge (x!28919 lt!144259) #b00000000000000000000000000000000) (bvsge (x!28919 lt!144259) #b00000000000000000000000000000000)))))

(assert (=> b!291753 (=> (not res!152936) (not e!184598))))

(declare-fun b!291754 () Bool)

(declare-fun e!184599 () SeekEntryResult!2135)

(assert (=> b!291754 (= e!184599 (Intermediate!2135 true lt!144178 #b00000000000000000000000000000000))))

(declare-fun b!291755 () Bool)

(declare-fun e!184601 () SeekEntryResult!2135)

(assert (=> b!291755 (= e!184601 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!144178 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!291757 () Bool)

(assert (=> b!291757 (= e!184600 (bvsge (x!28919 lt!144259) #b01111111111111111111111111111110))))

(declare-fun b!291758 () Bool)

(assert (=> b!291758 (and (bvsge (index!10712 lt!144259) #b00000000000000000000000000000000) (bvslt (index!10712 lt!144259) (size!7340 a!3312)))))

(declare-fun e!184597 () Bool)

(assert (=> b!291758 (= e!184597 (= (select (arr!6987 a!3312) (index!10712 lt!144259)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!291759 () Bool)

(assert (=> b!291759 (= e!184601 (Intermediate!2135 false lt!144178 #b00000000000000000000000000000000))))

(declare-fun b!291760 () Bool)

(assert (=> b!291760 (= e!184599 e!184601)))

(declare-fun c!46973 () Bool)

(declare-fun lt!144260 () (_ BitVec 64))

(assert (=> b!291760 (= c!46973 (or (= lt!144260 k0!2524) (= (bvadd lt!144260 lt!144260) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291761 () Bool)

(assert (=> b!291761 (and (bvsge (index!10712 lt!144259) #b00000000000000000000000000000000) (bvslt (index!10712 lt!144259) (size!7340 a!3312)))))

(declare-fun res!152938 () Bool)

(assert (=> b!291761 (= res!152938 (= (select (arr!6987 a!3312) (index!10712 lt!144259)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!291761 (=> res!152938 e!184597)))

(declare-fun b!291756 () Bool)

(assert (=> b!291756 (and (bvsge (index!10712 lt!144259) #b00000000000000000000000000000000) (bvslt (index!10712 lt!144259) (size!7340 a!3312)))))

(declare-fun res!152937 () Bool)

(assert (=> b!291756 (= res!152937 (= (select (arr!6987 a!3312) (index!10712 lt!144259)) k0!2524))))

(assert (=> b!291756 (=> res!152937 e!184597)))

(assert (=> b!291756 (= e!184598 e!184597)))

(declare-fun d!66285 () Bool)

(assert (=> d!66285 e!184600))

(declare-fun c!46975 () Bool)

(assert (=> d!66285 (= c!46975 (and ((_ is Intermediate!2135) lt!144259) (undefined!2947 lt!144259)))))

(assert (=> d!66285 (= lt!144259 e!184599)))

(declare-fun c!46974 () Bool)

(assert (=> d!66285 (= c!46974 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66285 (= lt!144260 (select (arr!6987 a!3312) lt!144178))))

(assert (=> d!66285 (validMask!0 mask!3809)))

(assert (=> d!66285 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144178 k0!2524 a!3312 mask!3809) lt!144259)))

(assert (= (and d!66285 c!46974) b!291754))

(assert (= (and d!66285 (not c!46974)) b!291760))

(assert (= (and b!291760 c!46973) b!291759))

(assert (= (and b!291760 (not c!46973)) b!291755))

(assert (= (and d!66285 c!46975) b!291757))

(assert (= (and d!66285 (not c!46975)) b!291753))

(assert (= (and b!291753 res!152936) b!291756))

(assert (= (and b!291756 (not res!152937)) b!291761))

(assert (= (and b!291761 (not res!152938)) b!291758))

(assert (=> b!291755 m!305091))

(assert (=> b!291755 m!305091))

(declare-fun m!305111 () Bool)

(assert (=> b!291755 m!305111))

(declare-fun m!305113 () Bool)

(assert (=> b!291756 m!305113))

(assert (=> b!291761 m!305113))

(declare-fun m!305115 () Bool)

(assert (=> d!66285 m!305115))

(assert (=> d!66285 m!304997))

(assert (=> b!291758 m!305113))

(assert (=> b!291603 d!66285))

(declare-fun d!66289 () Bool)

(declare-fun lt!144266 () (_ BitVec 32))

(declare-fun lt!144265 () (_ BitVec 32))

(assert (=> d!66289 (= lt!144266 (bvmul (bvxor lt!144265 (bvlshr lt!144265 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66289 (= lt!144265 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66289 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!152939 (let ((h!5233 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28923 (bvmul (bvxor h!5233 (bvlshr h!5233 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28923 (bvlshr x!28923 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!152939 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!152939 #b00000000000000000000000000000000))))))

(assert (=> d!66289 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!144266 (bvlshr lt!144266 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!291603 d!66289))

(declare-fun b!291846 () Bool)

(declare-fun e!184650 () SeekEntryResult!2135)

(declare-fun e!184648 () SeekEntryResult!2135)

(assert (=> b!291846 (= e!184650 e!184648)))

(declare-fun lt!144295 () (_ BitVec 64))

(declare-fun lt!144296 () SeekEntryResult!2135)

(assert (=> b!291846 (= lt!144295 (select (arr!6987 a!3312) (index!10712 lt!144296)))))

(declare-fun c!47007 () Bool)

(assert (=> b!291846 (= c!47007 (= lt!144295 k0!2524))))

(declare-fun b!291847 () Bool)

(declare-fun c!47006 () Bool)

(assert (=> b!291847 (= c!47006 (= lt!144295 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!184649 () SeekEntryResult!2135)

(assert (=> b!291847 (= e!184648 e!184649)))

(declare-fun b!291848 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14725 (_ BitVec 32)) SeekEntryResult!2135)

(assert (=> b!291848 (= e!184649 (seekKeyOrZeroReturnVacant!0 (x!28919 lt!144296) (index!10712 lt!144296) (index!10712 lt!144296) k0!2524 a!3312 mask!3809))))

(declare-fun b!291849 () Bool)

(assert (=> b!291849 (= e!184649 (MissingZero!2135 (index!10712 lt!144296)))))

(declare-fun b!291850 () Bool)

(assert (=> b!291850 (= e!184648 (Found!2135 (index!10712 lt!144296)))))

(declare-fun d!66297 () Bool)

(declare-fun lt!144297 () SeekEntryResult!2135)

(assert (=> d!66297 (and (or ((_ is Undefined!2135) lt!144297) (not ((_ is Found!2135) lt!144297)) (and (bvsge (index!10711 lt!144297) #b00000000000000000000000000000000) (bvslt (index!10711 lt!144297) (size!7340 a!3312)))) (or ((_ is Undefined!2135) lt!144297) ((_ is Found!2135) lt!144297) (not ((_ is MissingZero!2135) lt!144297)) (and (bvsge (index!10710 lt!144297) #b00000000000000000000000000000000) (bvslt (index!10710 lt!144297) (size!7340 a!3312)))) (or ((_ is Undefined!2135) lt!144297) ((_ is Found!2135) lt!144297) ((_ is MissingZero!2135) lt!144297) (not ((_ is MissingVacant!2135) lt!144297)) (and (bvsge (index!10713 lt!144297) #b00000000000000000000000000000000) (bvslt (index!10713 lt!144297) (size!7340 a!3312)))) (or ((_ is Undefined!2135) lt!144297) (ite ((_ is Found!2135) lt!144297) (= (select (arr!6987 a!3312) (index!10711 lt!144297)) k0!2524) (ite ((_ is MissingZero!2135) lt!144297) (= (select (arr!6987 a!3312) (index!10710 lt!144297)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2135) lt!144297) (= (select (arr!6987 a!3312) (index!10713 lt!144297)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66297 (= lt!144297 e!184650)))

(declare-fun c!47008 () Bool)

(assert (=> d!66297 (= c!47008 (and ((_ is Intermediate!2135) lt!144296) (undefined!2947 lt!144296)))))

(assert (=> d!66297 (= lt!144296 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66297 (validMask!0 mask!3809)))

(assert (=> d!66297 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!144297)))

(declare-fun b!291851 () Bool)

(assert (=> b!291851 (= e!184650 Undefined!2135)))

(assert (= (and d!66297 c!47008) b!291851))

(assert (= (and d!66297 (not c!47008)) b!291846))

(assert (= (and b!291846 c!47007) b!291850))

(assert (= (and b!291846 (not c!47007)) b!291847))

(assert (= (and b!291847 c!47006) b!291849))

(assert (= (and b!291847 (not c!47006)) b!291848))

(declare-fun m!305145 () Bool)

(assert (=> b!291846 m!305145))

(declare-fun m!305147 () Bool)

(assert (=> b!291848 m!305147))

(assert (=> d!66297 m!304995))

(declare-fun m!305149 () Bool)

(assert (=> d!66297 m!305149))

(declare-fun m!305151 () Bool)

(assert (=> d!66297 m!305151))

(declare-fun m!305153 () Bool)

(assert (=> d!66297 m!305153))

(assert (=> d!66297 m!304995))

(declare-fun m!305155 () Bool)

(assert (=> d!66297 m!305155))

(assert (=> d!66297 m!304997))

(assert (=> b!291598 d!66297))

(check-sat (not b!291848) (not b!291677) (not d!66275) (not d!66285) (not d!66297) (not b!291740) (not b!291755) (not b!291659) (not bm!25627) (not b!291674))
(check-sat)
