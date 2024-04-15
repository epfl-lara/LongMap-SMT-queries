; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33008 () Bool)

(assert start!33008)

(declare-fun b!328634 () Bool)

(declare-fun res!181111 () Bool)

(declare-fun e!201924 () Bool)

(assert (=> b!328634 (=> (not res!181111) (not e!201924))))

(declare-datatypes ((array!16818 0))(
  ( (array!16819 (arr!7956 (Array (_ BitVec 32) (_ BitVec 64))) (size!8309 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16818)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328634 (= res!181111 (and (= (size!8309 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8309 a!3305))))))

(declare-fun b!328635 () Bool)

(declare-fun e!201925 () Bool)

(assert (=> b!328635 (= e!201924 e!201925)))

(declare-fun res!181108 () Bool)

(assert (=> b!328635 (=> (not res!181108) (not e!201925))))

(declare-datatypes ((SeekEntryResult!3086 0))(
  ( (MissingZero!3086 (index!14520 (_ BitVec 32))) (Found!3086 (index!14521 (_ BitVec 32))) (Intermediate!3086 (undefined!3898 Bool) (index!14522 (_ BitVec 32)) (x!32800 (_ BitVec 32))) (Undefined!3086) (MissingVacant!3086 (index!14523 (_ BitVec 32))) )
))
(declare-fun lt!157808 () SeekEntryResult!3086)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16818 (_ BitVec 32)) SeekEntryResult!3086)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328635 (= res!181108 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157808))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!328635 (= lt!157808 (Intermediate!3086 false resIndex!58 resX!58))))

(declare-fun b!328636 () Bool)

(declare-fun res!181109 () Bool)

(assert (=> b!328636 (=> (not res!181109) (not e!201924))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328636 (= res!181109 (validKeyInArray!0 k0!2497))))

(declare-fun res!181107 () Bool)

(assert (=> start!33008 (=> (not res!181107) (not e!201924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33008 (= res!181107 (validMask!0 mask!3777))))

(assert (=> start!33008 e!201924))

(declare-fun array_inv!5928 (array!16818) Bool)

(assert (=> start!33008 (array_inv!5928 a!3305)))

(assert (=> start!33008 true))

(declare-fun b!328637 () Bool)

(declare-fun res!181112 () Bool)

(assert (=> b!328637 (=> (not res!181112) (not e!201924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16818 (_ BitVec 32)) Bool)

(assert (=> b!328637 (= res!181112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328638 () Bool)

(declare-fun res!181106 () Bool)

(assert (=> b!328638 (=> (not res!181106) (not e!201925))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!328638 (= res!181106 (and (= (select (arr!7956 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8309 a!3305))))))

(declare-fun b!328639 () Bool)

(declare-fun res!181110 () Bool)

(assert (=> b!328639 (=> (not res!181110) (not e!201924))))

(declare-fun arrayContainsKey!0 (array!16818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328639 (= res!181110 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328640 () Bool)

(declare-fun res!181113 () Bool)

(assert (=> b!328640 (=> (not res!181113) (not e!201924))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16818 (_ BitVec 32)) SeekEntryResult!3086)

(assert (=> b!328640 (= res!181113 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3086 i!1250)))))

(declare-fun b!328641 () Bool)

(declare-fun lt!157807 () SeekEntryResult!3086)

(assert (=> b!328641 (= e!201925 (and (= lt!157807 lt!157808) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7956 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7956 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7956 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!157807 (Intermediate!3086 false index!1840 resX!58)))))))

(assert (=> b!328641 (= lt!157807 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(assert (= (and start!33008 res!181107) b!328634))

(assert (= (and b!328634 res!181111) b!328636))

(assert (= (and b!328636 res!181109) b!328639))

(assert (= (and b!328639 res!181110) b!328640))

(assert (= (and b!328640 res!181113) b!328637))

(assert (= (and b!328637 res!181112) b!328635))

(assert (= (and b!328635 res!181108) b!328638))

(assert (= (and b!328638 res!181106) b!328641))

(declare-fun m!334015 () Bool)

(assert (=> b!328641 m!334015))

(declare-fun m!334017 () Bool)

(assert (=> b!328641 m!334017))

(declare-fun m!334019 () Bool)

(assert (=> b!328640 m!334019))

(declare-fun m!334021 () Bool)

(assert (=> b!328637 m!334021))

(declare-fun m!334023 () Bool)

(assert (=> b!328636 m!334023))

(declare-fun m!334025 () Bool)

(assert (=> start!33008 m!334025))

(declare-fun m!334027 () Bool)

(assert (=> start!33008 m!334027))

(declare-fun m!334029 () Bool)

(assert (=> b!328638 m!334029))

(declare-fun m!334031 () Bool)

(assert (=> b!328639 m!334031))

(declare-fun m!334033 () Bool)

(assert (=> b!328635 m!334033))

(assert (=> b!328635 m!334033))

(declare-fun m!334035 () Bool)

(assert (=> b!328635 m!334035))

(check-sat (not b!328641) (not start!33008) (not b!328639) (not b!328637) (not b!328635) (not b!328636) (not b!328640))
(check-sat)
(get-model)

(declare-fun b!328702 () Bool)

(declare-fun e!201952 () SeekEntryResult!3086)

(declare-fun lt!157828 () SeekEntryResult!3086)

(assert (=> b!328702 (= e!201952 (Found!3086 (index!14522 lt!157828)))))

(declare-fun b!328703 () Bool)

(declare-fun e!201951 () SeekEntryResult!3086)

(assert (=> b!328703 (= e!201951 Undefined!3086)))

(declare-fun b!328704 () Bool)

(declare-fun e!201953 () SeekEntryResult!3086)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16818 (_ BitVec 32)) SeekEntryResult!3086)

(assert (=> b!328704 (= e!201953 (seekKeyOrZeroReturnVacant!0 (x!32800 lt!157828) (index!14522 lt!157828) (index!14522 lt!157828) k0!2497 a!3305 mask!3777))))

(declare-fun b!328705 () Bool)

(assert (=> b!328705 (= e!201953 (MissingZero!3086 (index!14522 lt!157828)))))

(declare-fun d!69887 () Bool)

(declare-fun lt!157829 () SeekEntryResult!3086)

(get-info :version)

(assert (=> d!69887 (and (or ((_ is Undefined!3086) lt!157829) (not ((_ is Found!3086) lt!157829)) (and (bvsge (index!14521 lt!157829) #b00000000000000000000000000000000) (bvslt (index!14521 lt!157829) (size!8309 a!3305)))) (or ((_ is Undefined!3086) lt!157829) ((_ is Found!3086) lt!157829) (not ((_ is MissingZero!3086) lt!157829)) (and (bvsge (index!14520 lt!157829) #b00000000000000000000000000000000) (bvslt (index!14520 lt!157829) (size!8309 a!3305)))) (or ((_ is Undefined!3086) lt!157829) ((_ is Found!3086) lt!157829) ((_ is MissingZero!3086) lt!157829) (not ((_ is MissingVacant!3086) lt!157829)) (and (bvsge (index!14523 lt!157829) #b00000000000000000000000000000000) (bvslt (index!14523 lt!157829) (size!8309 a!3305)))) (or ((_ is Undefined!3086) lt!157829) (ite ((_ is Found!3086) lt!157829) (= (select (arr!7956 a!3305) (index!14521 lt!157829)) k0!2497) (ite ((_ is MissingZero!3086) lt!157829) (= (select (arr!7956 a!3305) (index!14520 lt!157829)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3086) lt!157829) (= (select (arr!7956 a!3305) (index!14523 lt!157829)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69887 (= lt!157829 e!201951)))

(declare-fun c!51408 () Bool)

(assert (=> d!69887 (= c!51408 (and ((_ is Intermediate!3086) lt!157828) (undefined!3898 lt!157828)))))

(assert (=> d!69887 (= lt!157828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69887 (validMask!0 mask!3777)))

(assert (=> d!69887 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157829)))

(declare-fun b!328706 () Bool)

(declare-fun c!51409 () Bool)

(declare-fun lt!157827 () (_ BitVec 64))

(assert (=> b!328706 (= c!51409 (= lt!157827 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328706 (= e!201952 e!201953)))

(declare-fun b!328707 () Bool)

(assert (=> b!328707 (= e!201951 e!201952)))

(assert (=> b!328707 (= lt!157827 (select (arr!7956 a!3305) (index!14522 lt!157828)))))

(declare-fun c!51410 () Bool)

(assert (=> b!328707 (= c!51410 (= lt!157827 k0!2497))))

(assert (= (and d!69887 c!51408) b!328703))

(assert (= (and d!69887 (not c!51408)) b!328707))

(assert (= (and b!328707 c!51410) b!328702))

(assert (= (and b!328707 (not c!51410)) b!328706))

(assert (= (and b!328706 c!51409) b!328705))

(assert (= (and b!328706 (not c!51409)) b!328704))

(declare-fun m!334081 () Bool)

(assert (=> b!328704 m!334081))

(assert (=> d!69887 m!334033))

(declare-fun m!334083 () Bool)

(assert (=> d!69887 m!334083))

(assert (=> d!69887 m!334033))

(assert (=> d!69887 m!334035))

(assert (=> d!69887 m!334025))

(declare-fun m!334085 () Bool)

(assert (=> d!69887 m!334085))

(declare-fun m!334087 () Bool)

(assert (=> d!69887 m!334087))

(declare-fun m!334089 () Bool)

(assert (=> b!328707 m!334089))

(assert (=> b!328640 d!69887))

(declare-fun b!328771 () Bool)

(declare-fun lt!157850 () SeekEntryResult!3086)

(assert (=> b!328771 (and (bvsge (index!14522 lt!157850) #b00000000000000000000000000000000) (bvslt (index!14522 lt!157850) (size!8309 a!3305)))))

(declare-fun res!181178 () Bool)

(assert (=> b!328771 (= res!181178 (= (select (arr!7956 a!3305) (index!14522 lt!157850)) k0!2497))))

(declare-fun e!201991 () Bool)

(assert (=> b!328771 (=> res!181178 e!201991)))

(declare-fun e!201992 () Bool)

(assert (=> b!328771 (= e!201992 e!201991)))

(declare-fun b!328772 () Bool)

(assert (=> b!328772 (and (bvsge (index!14522 lt!157850) #b00000000000000000000000000000000) (bvslt (index!14522 lt!157850) (size!8309 a!3305)))))

(assert (=> b!328772 (= e!201991 (= (select (arr!7956 a!3305) (index!14522 lt!157850)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201990 () SeekEntryResult!3086)

(declare-fun b!328773 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328773 (= e!201990 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun d!69893 () Bool)

(declare-fun e!201988 () Bool)

(assert (=> d!69893 e!201988))

(declare-fun c!51436 () Bool)

(assert (=> d!69893 (= c!51436 (and ((_ is Intermediate!3086) lt!157850) (undefined!3898 lt!157850)))))

(declare-fun e!201989 () SeekEntryResult!3086)

(assert (=> d!69893 (= lt!157850 e!201989)))

(declare-fun c!51435 () Bool)

(assert (=> d!69893 (= c!51435 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157849 () (_ BitVec 64))

(assert (=> d!69893 (= lt!157849 (select (arr!7956 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69893 (validMask!0 mask!3777)))

(assert (=> d!69893 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157850)))

(declare-fun b!328774 () Bool)

(assert (=> b!328774 (= e!201988 (bvsge (x!32800 lt!157850) #b01111111111111111111111111111110))))

(declare-fun b!328775 () Bool)

(assert (=> b!328775 (= e!201989 (Intermediate!3086 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328776 () Bool)

(assert (=> b!328776 (= e!201988 e!201992)))

(declare-fun res!181179 () Bool)

(assert (=> b!328776 (= res!181179 (and ((_ is Intermediate!3086) lt!157850) (not (undefined!3898 lt!157850)) (bvslt (x!32800 lt!157850) #b01111111111111111111111111111110) (bvsge (x!32800 lt!157850) #b00000000000000000000000000000000) (bvsge (x!32800 lt!157850) #b00000000000000000000000000000000)))))

(assert (=> b!328776 (=> (not res!181179) (not e!201992))))

(declare-fun b!328777 () Bool)

(assert (=> b!328777 (and (bvsge (index!14522 lt!157850) #b00000000000000000000000000000000) (bvslt (index!14522 lt!157850) (size!8309 a!3305)))))

(declare-fun res!181177 () Bool)

(assert (=> b!328777 (= res!181177 (= (select (arr!7956 a!3305) (index!14522 lt!157850)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328777 (=> res!181177 e!201991)))

(declare-fun b!328778 () Bool)

(assert (=> b!328778 (= e!201989 e!201990)))

(declare-fun c!51437 () Bool)

(assert (=> b!328778 (= c!51437 (or (= lt!157849 k0!2497) (= (bvadd lt!157849 lt!157849) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!328779 () Bool)

(assert (=> b!328779 (= e!201990 (Intermediate!3086 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(assert (= (and d!69893 c!51435) b!328775))

(assert (= (and d!69893 (not c!51435)) b!328778))

(assert (= (and b!328778 c!51437) b!328779))

(assert (= (and b!328778 (not c!51437)) b!328773))

(assert (= (and d!69893 c!51436) b!328774))

(assert (= (and d!69893 (not c!51436)) b!328776))

(assert (= (and b!328776 res!181179) b!328771))

(assert (= (and b!328771 (not res!181178)) b!328777))

(assert (= (and b!328777 (not res!181177)) b!328772))

(declare-fun m!334107 () Bool)

(assert (=> b!328777 m!334107))

(assert (=> b!328772 m!334107))

(assert (=> b!328771 m!334107))

(assert (=> d!69893 m!334033))

(declare-fun m!334109 () Bool)

(assert (=> d!69893 m!334109))

(assert (=> d!69893 m!334025))

(assert (=> b!328773 m!334033))

(declare-fun m!334111 () Bool)

(assert (=> b!328773 m!334111))

(assert (=> b!328773 m!334111))

(declare-fun m!334113 () Bool)

(assert (=> b!328773 m!334113))

(assert (=> b!328635 d!69893))

(declare-fun d!69899 () Bool)

(declare-fun lt!157860 () (_ BitVec 32))

(declare-fun lt!157859 () (_ BitVec 32))

(assert (=> d!69899 (= lt!157860 (bvmul (bvxor lt!157859 (bvlshr lt!157859 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69899 (= lt!157859 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69899 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!181180 (let ((h!5380 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32805 (bvmul (bvxor h!5380 (bvlshr h!5380 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32805 (bvlshr x!32805 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!181180 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!181180 #b00000000000000000000000000000000))))))

(assert (=> d!69899 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157860 (bvlshr lt!157860 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!328635 d!69899))

(declare-fun b!328788 () Bool)

(declare-fun lt!157862 () SeekEntryResult!3086)

(assert (=> b!328788 (and (bvsge (index!14522 lt!157862) #b00000000000000000000000000000000) (bvslt (index!14522 lt!157862) (size!8309 a!3305)))))

(declare-fun res!181182 () Bool)

(assert (=> b!328788 (= res!181182 (= (select (arr!7956 a!3305) (index!14522 lt!157862)) k0!2497))))

(declare-fun e!202000 () Bool)

(assert (=> b!328788 (=> res!181182 e!202000)))

(declare-fun e!202001 () Bool)

(assert (=> b!328788 (= e!202001 e!202000)))

(declare-fun b!328789 () Bool)

(assert (=> b!328789 (and (bvsge (index!14522 lt!157862) #b00000000000000000000000000000000) (bvslt (index!14522 lt!157862) (size!8309 a!3305)))))

(assert (=> b!328789 (= e!202000 (= (select (arr!7956 a!3305) (index!14522 lt!157862)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!328790 () Bool)

(declare-fun e!201999 () SeekEntryResult!3086)

(assert (=> b!328790 (= e!201999 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun d!69901 () Bool)

(declare-fun e!201997 () Bool)

(assert (=> d!69901 e!201997))

(declare-fun c!51443 () Bool)

(assert (=> d!69901 (= c!51443 (and ((_ is Intermediate!3086) lt!157862) (undefined!3898 lt!157862)))))

(declare-fun e!201998 () SeekEntryResult!3086)

(assert (=> d!69901 (= lt!157862 e!201998)))

(declare-fun c!51442 () Bool)

(assert (=> d!69901 (= c!51442 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!157861 () (_ BitVec 64))

(assert (=> d!69901 (= lt!157861 (select (arr!7956 a!3305) index!1840))))

(assert (=> d!69901 (validMask!0 mask!3777)))

(assert (=> d!69901 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157862)))

(declare-fun b!328791 () Bool)

(assert (=> b!328791 (= e!201997 (bvsge (x!32800 lt!157862) #b01111111111111111111111111111110))))

(declare-fun b!328792 () Bool)

(assert (=> b!328792 (= e!201998 (Intermediate!3086 true index!1840 x!1490))))

(declare-fun b!328793 () Bool)

(assert (=> b!328793 (= e!201997 e!202001)))

(declare-fun res!181183 () Bool)

(assert (=> b!328793 (= res!181183 (and ((_ is Intermediate!3086) lt!157862) (not (undefined!3898 lt!157862)) (bvslt (x!32800 lt!157862) #b01111111111111111111111111111110) (bvsge (x!32800 lt!157862) #b00000000000000000000000000000000) (bvsge (x!32800 lt!157862) x!1490)))))

(assert (=> b!328793 (=> (not res!181183) (not e!202001))))

(declare-fun b!328794 () Bool)

(assert (=> b!328794 (and (bvsge (index!14522 lt!157862) #b00000000000000000000000000000000) (bvslt (index!14522 lt!157862) (size!8309 a!3305)))))

(declare-fun res!181181 () Bool)

(assert (=> b!328794 (= res!181181 (= (select (arr!7956 a!3305) (index!14522 lt!157862)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328794 (=> res!181181 e!202000)))

(declare-fun b!328795 () Bool)

(assert (=> b!328795 (= e!201998 e!201999)))

(declare-fun c!51444 () Bool)

(assert (=> b!328795 (= c!51444 (or (= lt!157861 k0!2497) (= (bvadd lt!157861 lt!157861) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!328796 () Bool)

(assert (=> b!328796 (= e!201999 (Intermediate!3086 false index!1840 x!1490))))

(assert (= (and d!69901 c!51442) b!328792))

(assert (= (and d!69901 (not c!51442)) b!328795))

(assert (= (and b!328795 c!51444) b!328796))

(assert (= (and b!328795 (not c!51444)) b!328790))

(assert (= (and d!69901 c!51443) b!328791))

(assert (= (and d!69901 (not c!51443)) b!328793))

(assert (= (and b!328793 res!181183) b!328788))

(assert (= (and b!328788 (not res!181182)) b!328794))

(assert (= (and b!328794 (not res!181181)) b!328789))

(declare-fun m!334115 () Bool)

(assert (=> b!328794 m!334115))

(assert (=> b!328789 m!334115))

(assert (=> b!328788 m!334115))

(assert (=> d!69901 m!334015))

(assert (=> d!69901 m!334025))

(declare-fun m!334117 () Bool)

(assert (=> b!328790 m!334117))

(assert (=> b!328790 m!334117))

(declare-fun m!334119 () Bool)

(assert (=> b!328790 m!334119))

(assert (=> b!328641 d!69901))

(declare-fun d!69903 () Bool)

(assert (=> d!69903 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!328636 d!69903))

(declare-fun d!69905 () Bool)

(assert (=> d!69905 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33008 d!69905))

(declare-fun d!69911 () Bool)

(assert (=> d!69911 (= (array_inv!5928 a!3305) (bvsge (size!8309 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33008 d!69911))

(declare-fun b!328860 () Bool)

(declare-fun e!202039 () Bool)

(declare-fun call!26113 () Bool)

(assert (=> b!328860 (= e!202039 call!26113)))

(declare-fun bm!26110 () Bool)

(assert (=> bm!26110 (= call!26113 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!328861 () Bool)

(declare-fun e!202040 () Bool)

(assert (=> b!328861 (= e!202040 e!202039)))

(declare-fun lt!157895 () (_ BitVec 64))

(assert (=> b!328861 (= lt!157895 (select (arr!7956 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10166 0))(
  ( (Unit!10167) )
))
(declare-fun lt!157894 () Unit!10166)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16818 (_ BitVec 64) (_ BitVec 32)) Unit!10166)

(assert (=> b!328861 (= lt!157894 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157895 #b00000000000000000000000000000000))))

(assert (=> b!328861 (arrayContainsKey!0 a!3305 lt!157895 #b00000000000000000000000000000000)))

(declare-fun lt!157896 () Unit!10166)

(assert (=> b!328861 (= lt!157896 lt!157894)))

(declare-fun res!181205 () Bool)

(assert (=> b!328861 (= res!181205 (= (seekEntryOrOpen!0 (select (arr!7956 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3086 #b00000000000000000000000000000000)))))

(assert (=> b!328861 (=> (not res!181205) (not e!202039))))

(declare-fun b!328862 () Bool)

(assert (=> b!328862 (= e!202040 call!26113)))

(declare-fun b!328859 () Bool)

(declare-fun e!202041 () Bool)

(assert (=> b!328859 (= e!202041 e!202040)))

(declare-fun c!51466 () Bool)

(assert (=> b!328859 (= c!51466 (validKeyInArray!0 (select (arr!7956 a!3305) #b00000000000000000000000000000000)))))

(declare-fun d!69917 () Bool)

(declare-fun res!181206 () Bool)

(assert (=> d!69917 (=> res!181206 e!202041)))

(assert (=> d!69917 (= res!181206 (bvsge #b00000000000000000000000000000000 (size!8309 a!3305)))))

(assert (=> d!69917 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!202041)))

(assert (= (and d!69917 (not res!181206)) b!328859))

(assert (= (and b!328859 c!51466) b!328861))

(assert (= (and b!328859 (not c!51466)) b!328862))

(assert (= (and b!328861 res!181205) b!328860))

(assert (= (or b!328860 b!328862) bm!26110))

(declare-fun m!334145 () Bool)

(assert (=> bm!26110 m!334145))

(declare-fun m!334147 () Bool)

(assert (=> b!328861 m!334147))

(declare-fun m!334149 () Bool)

(assert (=> b!328861 m!334149))

(declare-fun m!334151 () Bool)

(assert (=> b!328861 m!334151))

(assert (=> b!328861 m!334147))

(declare-fun m!334153 () Bool)

(assert (=> b!328861 m!334153))

(assert (=> b!328859 m!334147))

(assert (=> b!328859 m!334147))

(declare-fun m!334155 () Bool)

(assert (=> b!328859 m!334155))

(assert (=> b!328637 d!69917))

(declare-fun d!69923 () Bool)

(declare-fun res!181217 () Bool)

(declare-fun e!202054 () Bool)

(assert (=> d!69923 (=> res!181217 e!202054)))

(assert (=> d!69923 (= res!181217 (= (select (arr!7956 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69923 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!202054)))

(declare-fun b!328880 () Bool)

(declare-fun e!202055 () Bool)

(assert (=> b!328880 (= e!202054 e!202055)))

(declare-fun res!181218 () Bool)

(assert (=> b!328880 (=> (not res!181218) (not e!202055))))

(assert (=> b!328880 (= res!181218 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8309 a!3305)))))

(declare-fun b!328881 () Bool)

(assert (=> b!328881 (= e!202055 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69923 (not res!181217)) b!328880))

(assert (= (and b!328880 res!181218) b!328881))

(assert (=> d!69923 m!334147))

(declare-fun m!334177 () Bool)

(assert (=> b!328881 m!334177))

(assert (=> b!328639 d!69923))

(check-sat (not b!328773) (not b!328861) (not b!328881) (not b!328790) (not bm!26110) (not d!69893) (not b!328704) (not d!69887) (not d!69901) (not b!328859))
(check-sat)
