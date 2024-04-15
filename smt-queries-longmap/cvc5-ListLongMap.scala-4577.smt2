; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63870 () Bool)

(assert start!63870)

(declare-fun b!717793 () Bool)

(declare-fun res!480508 () Bool)

(declare-fun e!402974 () Bool)

(assert (=> b!717793 (=> (not res!480508) (not e!402974))))

(declare-datatypes ((array!40666 0))(
  ( (array!40667 (arr!19462 (Array (_ BitVec 32) (_ BitVec 64))) (size!19883 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40666)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717793 (= res!480508 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717794 () Bool)

(declare-fun res!480506 () Bool)

(assert (=> b!717794 (=> (not res!480506) (not e!402974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717794 (= res!480506 (validKeyInArray!0 k!2102))))

(declare-fun b!717795 () Bool)

(declare-fun res!480504 () Bool)

(assert (=> b!717795 (=> (not res!480504) (not e!402974))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717795 (= res!480504 (and (= (size!19883 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19883 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19883 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717796 () Bool)

(declare-fun res!480509 () Bool)

(declare-fun e!402976 () Bool)

(assert (=> b!717796 (=> (not res!480509) (not e!402976))))

(declare-datatypes ((List!13503 0))(
  ( (Nil!13500) (Cons!13499 (h!14544 (_ BitVec 64)) (t!19809 List!13503)) )
))
(declare-fun arrayNoDuplicates!0 (array!40666 (_ BitVec 32) List!13503) Bool)

(assert (=> b!717796 (= res!480509 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13500))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!717797 () Bool)

(assert (=> b!717797 (= e!402976 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19883 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19883 a!3186)) (bvsge mask!3328 #b00000000000000000000000000000000) (bvsgt mask!3328 #b00111111111111111111111111111111)))))

(declare-fun b!717799 () Bool)

(declare-fun res!480510 () Bool)

(assert (=> b!717799 (=> (not res!480510) (not e!402974))))

(assert (=> b!717799 (= res!480510 (validKeyInArray!0 (select (arr!19462 a!3186) j!159)))))

(declare-fun b!717800 () Bool)

(assert (=> b!717800 (= e!402974 e!402976)))

(declare-fun res!480503 () Bool)

(assert (=> b!717800 (=> (not res!480503) (not e!402976))))

(declare-datatypes ((SeekEntryResult!7059 0))(
  ( (MissingZero!7059 (index!30604 (_ BitVec 32))) (Found!7059 (index!30605 (_ BitVec 32))) (Intermediate!7059 (undefined!7871 Bool) (index!30606 (_ BitVec 32)) (x!61626 (_ BitVec 32))) (Undefined!7059) (MissingVacant!7059 (index!30607 (_ BitVec 32))) )
))
(declare-fun lt!319016 () SeekEntryResult!7059)

(assert (=> b!717800 (= res!480503 (or (= lt!319016 (MissingZero!7059 i!1173)) (= lt!319016 (MissingVacant!7059 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40666 (_ BitVec 32)) SeekEntryResult!7059)

(assert (=> b!717800 (= lt!319016 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717798 () Bool)

(declare-fun res!480505 () Bool)

(assert (=> b!717798 (=> (not res!480505) (not e!402976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40666 (_ BitVec 32)) Bool)

(assert (=> b!717798 (= res!480505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!480507 () Bool)

(assert (=> start!63870 (=> (not res!480507) (not e!402974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63870 (= res!480507 (validMask!0 mask!3328))))

(assert (=> start!63870 e!402974))

(assert (=> start!63870 true))

(declare-fun array_inv!15345 (array!40666) Bool)

(assert (=> start!63870 (array_inv!15345 a!3186)))

(assert (= (and start!63870 res!480507) b!717795))

(assert (= (and b!717795 res!480504) b!717799))

(assert (= (and b!717799 res!480510) b!717794))

(assert (= (and b!717794 res!480506) b!717793))

(assert (= (and b!717793 res!480508) b!717800))

(assert (= (and b!717800 res!480503) b!717798))

(assert (= (and b!717798 res!480505) b!717796))

(assert (= (and b!717796 res!480509) b!717797))

(declare-fun m!673049 () Bool)

(assert (=> b!717800 m!673049))

(declare-fun m!673051 () Bool)

(assert (=> b!717796 m!673051))

(declare-fun m!673053 () Bool)

(assert (=> b!717793 m!673053))

(declare-fun m!673055 () Bool)

(assert (=> start!63870 m!673055))

(declare-fun m!673057 () Bool)

(assert (=> start!63870 m!673057))

(declare-fun m!673059 () Bool)

(assert (=> b!717799 m!673059))

(assert (=> b!717799 m!673059))

(declare-fun m!673061 () Bool)

(assert (=> b!717799 m!673061))

(declare-fun m!673063 () Bool)

(assert (=> b!717794 m!673063))

(declare-fun m!673065 () Bool)

(assert (=> b!717798 m!673065))

(push 1)

(assert (not b!717799))

(assert (not b!717796))

(assert (not b!717793))

(assert (not b!717798))

(assert (not b!717800))

(assert (not b!717794))

(assert (not start!63870))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98769 () Bool)

(declare-fun res!480524 () Bool)

(declare-fun e!402993 () Bool)

(assert (=> d!98769 (=> res!480524 e!402993)))

(assert (=> d!98769 (= res!480524 (= (select (arr!19462 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!98769 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!402993)))

(declare-fun b!717820 () Bool)

(declare-fun e!402994 () Bool)

(assert (=> b!717820 (= e!402993 e!402994)))

(declare-fun res!480525 () Bool)

(assert (=> b!717820 (=> (not res!480525) (not e!402994))))

(assert (=> b!717820 (= res!480525 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19883 a!3186)))))

(declare-fun b!717821 () Bool)

(assert (=> b!717821 (= e!402994 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!98769 (not res!480524)) b!717820))

(assert (= (and b!717820 res!480525) b!717821))

(declare-fun m!673075 () Bool)

(assert (=> d!98769 m!673075))

(declare-fun m!673077 () Bool)

(assert (=> b!717821 m!673077))

(assert (=> b!717793 d!98769))

(declare-fun d!98771 () Bool)

(assert (=> d!98771 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63870 d!98771))

(declare-fun d!98775 () Bool)

(assert (=> d!98775 (= (array_inv!15345 a!3186) (bvsge (size!19883 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63870 d!98775))

(declare-fun b!717848 () Bool)

(declare-fun e!403015 () Bool)

(declare-fun call!34693 () Bool)

(assert (=> b!717848 (= e!403015 call!34693)))

(declare-fun d!98777 () Bool)

(declare-fun res!480537 () Bool)

(declare-fun e!403013 () Bool)

(assert (=> d!98777 (=> res!480537 e!403013)))

(assert (=> d!98777 (= res!480537 (bvsge #b00000000000000000000000000000000 (size!19883 a!3186)))))

(assert (=> d!98777 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!403013)))

(declare-fun b!717849 () Bool)

(declare-fun e!403014 () Bool)

(assert (=> b!717849 (= e!403013 e!403014)))

(declare-fun c!79023 () Bool)

(assert (=> b!717849 (= c!79023 (validKeyInArray!0 (select (arr!19462 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!717850 () Bool)

(assert (=> b!717850 (= e!403014 e!403015)))

(declare-fun lt!319029 () (_ BitVec 64))

(assert (=> b!717850 (= lt!319029 (select (arr!19462 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24626 0))(
  ( (Unit!24627) )
))
(declare-fun lt!319031 () Unit!24626)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40666 (_ BitVec 64) (_ BitVec 32)) Unit!24626)

(assert (=> b!717850 (= lt!319031 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319029 #b00000000000000000000000000000000))))

(assert (=> b!717850 (arrayContainsKey!0 a!3186 lt!319029 #b00000000000000000000000000000000)))

(declare-fun lt!319030 () Unit!24626)

(assert (=> b!717850 (= lt!319030 lt!319031)))

(declare-fun res!480536 () Bool)

(assert (=> b!717850 (= res!480536 (= (seekEntryOrOpen!0 (select (arr!19462 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7059 #b00000000000000000000000000000000)))))

(assert (=> b!717850 (=> (not res!480536) (not e!403015))))

(declare-fun b!717851 () Bool)

(assert (=> b!717851 (= e!403014 call!34693)))

(declare-fun bm!34690 () Bool)

(assert (=> bm!34690 (= call!34693 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!98777 (not res!480537)) b!717849))

(assert (= (and b!717849 c!79023) b!717850))

(assert (= (and b!717849 (not c!79023)) b!717851))

(assert (= (and b!717850 res!480536) b!717848))

(assert (= (or b!717848 b!717851) bm!34690))

(assert (=> b!717849 m!673075))

(assert (=> b!717849 m!673075))

(declare-fun m!673083 () Bool)

(assert (=> b!717849 m!673083))

(assert (=> b!717850 m!673075))

(declare-fun m!673085 () Bool)

(assert (=> b!717850 m!673085))

(declare-fun m!673087 () Bool)

(assert (=> b!717850 m!673087))

(assert (=> b!717850 m!673075))

(declare-fun m!673089 () Bool)

(assert (=> b!717850 m!673089))

(declare-fun m!673091 () Bool)

(assert (=> bm!34690 m!673091))

(assert (=> b!717798 d!98777))

(declare-fun d!98783 () Bool)

(declare-fun lt!319041 () SeekEntryResult!7059)

(assert (=> d!98783 (and (or (is-Undefined!7059 lt!319041) (not (is-Found!7059 lt!319041)) (and (bvsge (index!30605 lt!319041) #b00000000000000000000000000000000) (bvslt (index!30605 lt!319041) (size!19883 a!3186)))) (or (is-Undefined!7059 lt!319041) (is-Found!7059 lt!319041) (not (is-MissingZero!7059 lt!319041)) (and (bvsge (index!30604 lt!319041) #b00000000000000000000000000000000) (bvslt (index!30604 lt!319041) (size!19883 a!3186)))) (or (is-Undefined!7059 lt!319041) (is-Found!7059 lt!319041) (is-MissingZero!7059 lt!319041) (not (is-MissingVacant!7059 lt!319041)) (and (bvsge (index!30607 lt!319041) #b00000000000000000000000000000000) (bvslt (index!30607 lt!319041) (size!19883 a!3186)))) (or (is-Undefined!7059 lt!319041) (ite (is-Found!7059 lt!319041) (= (select (arr!19462 a!3186) (index!30605 lt!319041)) k!2102) (ite (is-MissingZero!7059 lt!319041) (= (select (arr!19462 a!3186) (index!30604 lt!319041)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7059 lt!319041) (= (select (arr!19462 a!3186) (index!30607 lt!319041)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!403038 () SeekEntryResult!7059)

(assert (=> d!98783 (= lt!319041 e!403038)))

(declare-fun c!79036 () Bool)

(declare-fun lt!319042 () SeekEntryResult!7059)

(assert (=> d!98783 (= c!79036 (and (is-Intermediate!7059 lt!319042) (undefined!7871 lt!319042)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40666 (_ BitVec 32)) SeekEntryResult!7059)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!98783 (= lt!319042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!98783 (validMask!0 mask!3328)))

(assert (=> d!98783 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!319041)))

(declare-fun b!717885 () Bool)

(assert (=> b!717885 (= e!403038 Undefined!7059)))

(declare-fun b!717886 () Bool)

(declare-fun e!403039 () SeekEntryResult!7059)

(assert (=> b!717886 (= e!403039 (MissingZero!7059 (index!30606 lt!319042)))))

(declare-fun b!717887 () Bool)

(declare-fun e!403037 () SeekEntryResult!7059)

(assert (=> b!717887 (= e!403038 e!403037)))

(declare-fun lt!319043 () (_ BitVec 64))

(assert (=> b!717887 (= lt!319043 (select (arr!19462 a!3186) (index!30606 lt!319042)))))

(declare-fun c!79038 () Bool)

(assert (=> b!717887 (= c!79038 (= lt!319043 k!2102))))

(declare-fun b!717888 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40666 (_ BitVec 32)) SeekEntryResult!7059)

(assert (=> b!717888 (= e!403039 (seekKeyOrZeroReturnVacant!0 (x!61626 lt!319042) (index!30606 lt!319042) (index!30606 lt!319042) k!2102 a!3186 mask!3328))))

(declare-fun b!717889 () Bool)

(assert (=> b!717889 (= e!403037 (Found!7059 (index!30606 lt!319042)))))

(declare-fun b!717890 () Bool)

(declare-fun c!79037 () Bool)

(assert (=> b!717890 (= c!79037 (= lt!319043 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!717890 (= e!403037 e!403039)))

(assert (= (and d!98783 c!79036) b!717885))

(assert (= (and d!98783 (not c!79036)) b!717887))

(assert (= (and b!717887 c!79038) b!717889))

(assert (= (and b!717887 (not c!79038)) b!717890))

(assert (= (and b!717890 c!79037) b!717886))

(assert (= (and b!717890 (not c!79037)) b!717888))

(assert (=> d!98783 m!673055))

(declare-fun m!673113 () Bool)

(assert (=> d!98783 m!673113))

(declare-fun m!673115 () Bool)

(assert (=> d!98783 m!673115))

(declare-fun m!673117 () Bool)

(assert (=> d!98783 m!673117))

(declare-fun m!673119 () Bool)

(assert (=> d!98783 m!673119))

(assert (=> d!98783 m!673117))

(declare-fun m!673121 () Bool)

(assert (=> d!98783 m!673121))

(declare-fun m!673123 () Bool)

(assert (=> b!717887 m!673123))

(declare-fun m!673125 () Bool)

(assert (=> b!717888 m!673125))

(assert (=> b!717800 d!98783))

(declare-fun d!98801 () Bool)

(assert (=> d!98801 (= (validKeyInArray!0 (select (arr!19462 a!3186) j!159)) (and (not (= (select (arr!19462 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19462 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717799 d!98801))

(declare-fun d!98803 () Bool)

(assert (=> d!98803 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717794 d!98803))

(declare-fun d!98805 () Bool)

(declare-fun res!480555 () Bool)

(declare-fun e!403048 () Bool)

(assert (=> d!98805 (=> res!480555 e!403048)))

(assert (=> d!98805 (= res!480555 (bvsge #b00000000000000000000000000000000 (size!19883 a!3186)))))

(assert (=> d!98805 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13500) e!403048)))

(declare-fun b!717901 () Bool)

(declare-fun e!403050 () Bool)

(declare-fun e!403051 () Bool)

(assert (=> b!717901 (= e!403050 e!403051)))

(declare-fun c!79041 () Bool)

(assert (=> b!717901 (= c!79041 (validKeyInArray!0 (select (arr!19462 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!717902 () Bool)

(assert (=> b!717902 (= e!403048 e!403050)))

(declare-fun res!480553 () Bool)

(assert (=> b!717902 (=> (not res!480553) (not e!403050))))

(declare-fun e!403049 () Bool)

(assert (=> b!717902 (= res!480553 (not e!403049))))

(declare-fun res!480554 () Bool)

(assert (=> b!717902 (=> (not res!480554) (not e!403049))))

(assert (=> b!717902 (= res!480554 (validKeyInArray!0 (select (arr!19462 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34696 () Bool)

(declare-fun call!34699 () Bool)

(assert (=> bm!34696 (= call!34699 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79041 (Cons!13499 (select (arr!19462 a!3186) #b00000000000000000000000000000000) Nil!13500) Nil!13500)))))

(declare-fun b!717903 () Bool)

(assert (=> b!717903 (= e!403051 call!34699)))

(declare-fun b!717904 () Bool)

(assert (=> b!717904 (= e!403051 call!34699)))

(declare-fun b!717905 () Bool)

(declare-fun contains!4019 (List!13503 (_ BitVec 64)) Bool)

(assert (=> b!717905 (= e!403049 (contains!4019 Nil!13500 (select (arr!19462 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!98805 (not res!480555)) b!717902))

(assert (= (and b!717902 res!480554) b!717905))

(assert (= (and b!717902 res!480553) b!717901))

(assert (= (and b!717901 c!79041) b!717904))

(assert (= (and b!717901 (not c!79041)) b!717903))

(assert (= (or b!717904 b!717903) bm!34696))

(assert (=> b!717901 m!673075))

(assert (=> b!717901 m!673075))

(assert (=> b!717901 m!673083))

(assert (=> b!717902 m!673075))

(assert (=> b!717902 m!673075))

(assert (=> b!717902 m!673083))

(assert (=> bm!34696 m!673075))

(declare-fun m!673127 () Bool)

(assert (=> bm!34696 m!673127))

(assert (=> b!717905 m!673075))

(assert (=> b!717905 m!673075))

(declare-fun m!673129 () Bool)

(assert (=> b!717905 m!673129))

(assert (=> b!717796 d!98805))

(push 1)

(assert (not b!717888))

(assert (not b!717901))

(assert (not b!717905))

(assert (not bm!34690))

(assert (not b!717849))

(assert (not bm!34696))

(assert (not b!717902))

(assert (not b!717821))

(assert (not d!98783))

(assert (not b!717850))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

