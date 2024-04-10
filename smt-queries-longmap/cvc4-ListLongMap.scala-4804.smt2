; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65888 () Bool)

(assert start!65888)

(declare-datatypes ((array!42061 0))(
  ( (array!42062 (arr!20144 (Array (_ BitVec 32) (_ BitVec 64))) (size!20565 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42061)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7744 0))(
  ( (MissingZero!7744 (index!33344 (_ BitVec 32))) (Found!7744 (index!33345 (_ BitVec 32))) (Intermediate!7744 (undefined!8556 Bool) (index!33346 (_ BitVec 32)) (x!64222 (_ BitVec 32))) (Undefined!7744) (MissingVacant!7744 (index!33347 (_ BitVec 32))) )
))
(declare-fun lt!338536 () SeekEntryResult!7744)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!759758 () Bool)

(declare-fun e!423513 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42061 (_ BitVec 32)) SeekEntryResult!7744)

(assert (=> b!759758 (= e!423513 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338536))))

(declare-fun b!759759 () Bool)

(declare-fun res!514222 () Bool)

(declare-fun e!423518 () Bool)

(assert (=> b!759759 (=> (not res!514222) (not e!423518))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!759759 (= res!514222 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20144 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759760 () Bool)

(declare-fun e!423512 () Bool)

(assert (=> b!759760 (= e!423512 e!423518)))

(declare-fun res!514230 () Bool)

(assert (=> b!759760 (=> (not res!514230) (not e!423518))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759760 (= res!514230 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338536))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759760 (= lt!338536 (Intermediate!7744 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759761 () Bool)

(declare-fun e!423515 () Bool)

(declare-fun lt!338533 () SeekEntryResult!7744)

(assert (=> b!759761 (= e!423515 (not (or (not (is-Intermediate!7744 lt!338533)) (bvslt x!1131 (x!64222 lt!338533)) (= x!1131 (x!64222 lt!338533)))))))

(declare-fun e!423517 () Bool)

(assert (=> b!759761 e!423517))

(declare-fun res!514232 () Bool)

(assert (=> b!759761 (=> (not res!514232) (not e!423517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42061 (_ BitVec 32)) Bool)

(assert (=> b!759761 (= res!514232 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26328 0))(
  ( (Unit!26329) )
))
(declare-fun lt!338535 () Unit!26328)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42061 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26328)

(assert (=> b!759761 (= lt!338535 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759762 () Bool)

(declare-fun res!514227 () Bool)

(assert (=> b!759762 (=> (not res!514227) (not e!423518))))

(assert (=> b!759762 (= res!514227 e!423513)))

(declare-fun c!83149 () Bool)

(assert (=> b!759762 (= c!83149 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759763 () Bool)

(declare-fun res!514224 () Bool)

(assert (=> b!759763 (=> (not res!514224) (not e!423512))))

(assert (=> b!759763 (= res!514224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759764 () Bool)

(declare-fun res!514221 () Bool)

(declare-fun e!423516 () Bool)

(assert (=> b!759764 (=> (not res!514221) (not e!423516))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759764 (= res!514221 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!759765 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42061 (_ BitVec 32)) SeekEntryResult!7744)

(assert (=> b!759765 (= e!423513 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) (Found!7744 j!159)))))

(declare-fun b!759766 () Bool)

(declare-fun res!514225 () Bool)

(assert (=> b!759766 (=> (not res!514225) (not e!423516))))

(assert (=> b!759766 (= res!514225 (and (= (size!20565 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20565 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20565 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759767 () Bool)

(declare-fun e!423514 () Bool)

(declare-fun lt!338531 () SeekEntryResult!7744)

(assert (=> b!759767 (= e!423514 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338531))))

(declare-fun b!759768 () Bool)

(declare-fun res!514229 () Bool)

(assert (=> b!759768 (=> (not res!514229) (not e!423512))))

(declare-datatypes ((List!14146 0))(
  ( (Nil!14143) (Cons!14142 (h!15214 (_ BitVec 64)) (t!20461 List!14146)) )
))
(declare-fun arrayNoDuplicates!0 (array!42061 (_ BitVec 32) List!14146) Bool)

(assert (=> b!759768 (= res!514229 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14143))))

(declare-fun b!759769 () Bool)

(declare-fun res!514233 () Bool)

(assert (=> b!759769 (=> (not res!514233) (not e!423516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759769 (= res!514233 (validKeyInArray!0 (select (arr!20144 a!3186) j!159)))))

(declare-fun res!514231 () Bool)

(assert (=> start!65888 (=> (not res!514231) (not e!423516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65888 (= res!514231 (validMask!0 mask!3328))))

(assert (=> start!65888 e!423516))

(assert (=> start!65888 true))

(declare-fun array_inv!15940 (array!42061) Bool)

(assert (=> start!65888 (array_inv!15940 a!3186)))

(declare-fun b!759770 () Bool)

(declare-fun res!514235 () Bool)

(assert (=> b!759770 (=> (not res!514235) (not e!423512))))

(assert (=> b!759770 (= res!514235 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20565 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20565 a!3186))))))

(declare-fun b!759771 () Bool)

(declare-fun res!514223 () Bool)

(assert (=> b!759771 (=> (not res!514223) (not e!423516))))

(assert (=> b!759771 (= res!514223 (validKeyInArray!0 k!2102))))

(declare-fun b!759772 () Bool)

(assert (=> b!759772 (= e!423516 e!423512)))

(declare-fun res!514228 () Bool)

(assert (=> b!759772 (=> (not res!514228) (not e!423512))))

(declare-fun lt!338534 () SeekEntryResult!7744)

(assert (=> b!759772 (= res!514228 (or (= lt!338534 (MissingZero!7744 i!1173)) (= lt!338534 (MissingVacant!7744 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42061 (_ BitVec 32)) SeekEntryResult!7744)

(assert (=> b!759772 (= lt!338534 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!759773 () Bool)

(assert (=> b!759773 (= e!423517 e!423514)))

(declare-fun res!514226 () Bool)

(assert (=> b!759773 (=> (not res!514226) (not e!423514))))

(assert (=> b!759773 (= res!514226 (= (seekEntryOrOpen!0 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338531))))

(assert (=> b!759773 (= lt!338531 (Found!7744 j!159))))

(declare-fun b!759774 () Bool)

(assert (=> b!759774 (= e!423518 e!423515)))

(declare-fun res!514234 () Bool)

(assert (=> b!759774 (=> (not res!514234) (not e!423515))))

(declare-fun lt!338532 () SeekEntryResult!7744)

(assert (=> b!759774 (= res!514234 (= lt!338532 lt!338533))))

(declare-fun lt!338537 () (_ BitVec 64))

(declare-fun lt!338530 () array!42061)

(assert (=> b!759774 (= lt!338533 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338537 lt!338530 mask!3328))))

(assert (=> b!759774 (= lt!338532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338537 mask!3328) lt!338537 lt!338530 mask!3328))))

(assert (=> b!759774 (= lt!338537 (select (store (arr!20144 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!759774 (= lt!338530 (array!42062 (store (arr!20144 a!3186) i!1173 k!2102) (size!20565 a!3186)))))

(assert (= (and start!65888 res!514231) b!759766))

(assert (= (and b!759766 res!514225) b!759769))

(assert (= (and b!759769 res!514233) b!759771))

(assert (= (and b!759771 res!514223) b!759764))

(assert (= (and b!759764 res!514221) b!759772))

(assert (= (and b!759772 res!514228) b!759763))

(assert (= (and b!759763 res!514224) b!759768))

(assert (= (and b!759768 res!514229) b!759770))

(assert (= (and b!759770 res!514235) b!759760))

(assert (= (and b!759760 res!514230) b!759759))

(assert (= (and b!759759 res!514222) b!759762))

(assert (= (and b!759762 c!83149) b!759758))

(assert (= (and b!759762 (not c!83149)) b!759765))

(assert (= (and b!759762 res!514227) b!759774))

(assert (= (and b!759774 res!514234) b!759761))

(assert (= (and b!759761 res!514232) b!759773))

(assert (= (and b!759773 res!514226) b!759767))

(declare-fun m!707085 () Bool)

(assert (=> start!65888 m!707085))

(declare-fun m!707087 () Bool)

(assert (=> start!65888 m!707087))

(declare-fun m!707089 () Bool)

(assert (=> b!759768 m!707089))

(declare-fun m!707091 () Bool)

(assert (=> b!759767 m!707091))

(assert (=> b!759767 m!707091))

(declare-fun m!707093 () Bool)

(assert (=> b!759767 m!707093))

(declare-fun m!707095 () Bool)

(assert (=> b!759761 m!707095))

(declare-fun m!707097 () Bool)

(assert (=> b!759761 m!707097))

(assert (=> b!759760 m!707091))

(assert (=> b!759760 m!707091))

(declare-fun m!707099 () Bool)

(assert (=> b!759760 m!707099))

(assert (=> b!759760 m!707099))

(assert (=> b!759760 m!707091))

(declare-fun m!707101 () Bool)

(assert (=> b!759760 m!707101))

(assert (=> b!759773 m!707091))

(assert (=> b!759773 m!707091))

(declare-fun m!707103 () Bool)

(assert (=> b!759773 m!707103))

(declare-fun m!707105 () Bool)

(assert (=> b!759764 m!707105))

(declare-fun m!707107 () Bool)

(assert (=> b!759763 m!707107))

(declare-fun m!707109 () Bool)

(assert (=> b!759759 m!707109))

(declare-fun m!707111 () Bool)

(assert (=> b!759771 m!707111))

(assert (=> b!759765 m!707091))

(assert (=> b!759765 m!707091))

(declare-fun m!707113 () Bool)

(assert (=> b!759765 m!707113))

(assert (=> b!759769 m!707091))

(assert (=> b!759769 m!707091))

(declare-fun m!707115 () Bool)

(assert (=> b!759769 m!707115))

(declare-fun m!707117 () Bool)

(assert (=> b!759772 m!707117))

(assert (=> b!759758 m!707091))

(assert (=> b!759758 m!707091))

(declare-fun m!707119 () Bool)

(assert (=> b!759758 m!707119))

(declare-fun m!707121 () Bool)

(assert (=> b!759774 m!707121))

(declare-fun m!707123 () Bool)

(assert (=> b!759774 m!707123))

(declare-fun m!707125 () Bool)

(assert (=> b!759774 m!707125))

(declare-fun m!707127 () Bool)

(assert (=> b!759774 m!707127))

(declare-fun m!707129 () Bool)

(assert (=> b!759774 m!707129))

(assert (=> b!759774 m!707121))

(push 1)

(assert (not b!759758))

(assert (not b!759772))

(assert (not b!759774))

(assert (not b!759760))

(assert (not start!65888))

(assert (not b!759767))

(assert (not b!759769))

(assert (not b!759765))

(assert (not b!759771))

(assert (not b!759768))

(assert (not b!759764))

(assert (not b!759761))

(assert (not b!759773))

(assert (not b!759763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!759828 () Bool)

(declare-fun e!423554 () Bool)

(declare-fun e!423552 () Bool)

(assert (=> b!759828 (= e!423554 e!423552)))

(declare-fun lt!338560 () (_ BitVec 64))

(assert (=> b!759828 (= lt!338560 (select (arr!20144 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!338562 () Unit!26328)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42061 (_ BitVec 64) (_ BitVec 32)) Unit!26328)

(assert (=> b!759828 (= lt!338562 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338560 #b00000000000000000000000000000000))))

(assert (=> b!759828 (arrayContainsKey!0 a!3186 lt!338560 #b00000000000000000000000000000000)))

(declare-fun lt!338561 () Unit!26328)

(assert (=> b!759828 (= lt!338561 lt!338562)))

(declare-fun res!514257 () Bool)

(assert (=> b!759828 (= res!514257 (= (seekEntryOrOpen!0 (select (arr!20144 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7744 #b00000000000000000000000000000000)))))

(assert (=> b!759828 (=> (not res!514257) (not e!423552))))

(declare-fun b!759829 () Bool)

(declare-fun call!34914 () Bool)

(assert (=> b!759829 (= e!423554 call!34914)))

(declare-fun b!759830 () Bool)

(assert (=> b!759830 (= e!423552 call!34914)))

(declare-fun b!759831 () Bool)

(declare-fun e!423553 () Bool)

(assert (=> b!759831 (= e!423553 e!423554)))

(declare-fun c!83167 () Bool)

(assert (=> b!759831 (= c!83167 (validKeyInArray!0 (select (arr!20144 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34911 () Bool)

(assert (=> bm!34911 (= call!34914 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!100385 () Bool)

(declare-fun res!514256 () Bool)

(assert (=> d!100385 (=> res!514256 e!423553)))

(assert (=> d!100385 (= res!514256 (bvsge #b00000000000000000000000000000000 (size!20565 a!3186)))))

(assert (=> d!100385 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!423553)))

(assert (= (and d!100385 (not res!514256)) b!759831))

(assert (= (and b!759831 c!83167) b!759828))

(assert (= (and b!759831 (not c!83167)) b!759829))

(assert (= (and b!759828 res!514257) b!759830))

(assert (= (or b!759830 b!759829) bm!34911))

(declare-fun m!707143 () Bool)

(assert (=> b!759828 m!707143))

(declare-fun m!707145 () Bool)

(assert (=> b!759828 m!707145))

(declare-fun m!707147 () Bool)

(assert (=> b!759828 m!707147))

(assert (=> b!759828 m!707143))

(declare-fun m!707151 () Bool)

(assert (=> b!759828 m!707151))

(assert (=> b!759831 m!707143))

(assert (=> b!759831 m!707143))

(declare-fun m!707155 () Bool)

(assert (=> b!759831 m!707155))

(declare-fun m!707159 () Bool)

(assert (=> bm!34911 m!707159))

(assert (=> b!759763 d!100385))

(declare-fun b!759904 () Bool)

(declare-fun e!423596 () SeekEntryResult!7744)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759904 (= e!423596 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!338537 lt!338530 mask!3328))))

(declare-fun b!759905 () Bool)

(declare-fun lt!338591 () SeekEntryResult!7744)

(assert (=> b!759905 (and (bvsge (index!33346 lt!338591) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338591) (size!20565 lt!338530)))))

(declare-fun res!514265 () Bool)

(assert (=> b!759905 (= res!514265 (= (select (arr!20144 lt!338530) (index!33346 lt!338591)) lt!338537))))

(declare-fun e!423594 () Bool)

(assert (=> b!759905 (=> res!514265 e!423594)))

(declare-fun e!423593 () Bool)

(assert (=> b!759905 (= e!423593 e!423594)))

(declare-fun b!759906 () Bool)

(assert (=> b!759906 (and (bvsge (index!33346 lt!338591) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338591) (size!20565 lt!338530)))))

(declare-fun res!514266 () Bool)

(assert (=> b!759906 (= res!514266 (= (select (arr!20144 lt!338530) (index!33346 lt!338591)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!759906 (=> res!514266 e!423594)))

(declare-fun b!759907 () Bool)

(declare-fun e!423595 () SeekEntryResult!7744)

(assert (=> b!759907 (= e!423595 (Intermediate!7744 true index!1321 x!1131))))

(declare-fun b!759908 () Bool)

(assert (=> b!759908 (= e!423596 (Intermediate!7744 false index!1321 x!1131))))

(declare-fun b!759909 () Bool)

(declare-fun e!423592 () Bool)

(assert (=> b!759909 (= e!423592 (bvsge (x!64222 lt!338591) #b01111111111111111111111111111110))))

(declare-fun d!100387 () Bool)

(assert (=> d!100387 e!423592))

(declare-fun c!83202 () Bool)

(assert (=> d!100387 (= c!83202 (and (is-Intermediate!7744 lt!338591) (undefined!8556 lt!338591)))))

(assert (=> d!100387 (= lt!338591 e!423595)))

(declare-fun c!83203 () Bool)

(assert (=> d!100387 (= c!83203 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!338592 () (_ BitVec 64))

(assert (=> d!100387 (= lt!338592 (select (arr!20144 lt!338530) index!1321))))

(assert (=> d!100387 (validMask!0 mask!3328)))

(assert (=> d!100387 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338537 lt!338530 mask!3328) lt!338591)))

(declare-fun b!759910 () Bool)

(assert (=> b!759910 (= e!423592 e!423593)))

(declare-fun res!514264 () Bool)

(assert (=> b!759910 (= res!514264 (and (is-Intermediate!7744 lt!338591) (not (undefined!8556 lt!338591)) (bvslt (x!64222 lt!338591) #b01111111111111111111111111111110) (bvsge (x!64222 lt!338591) #b00000000000000000000000000000000) (bvsge (x!64222 lt!338591) x!1131)))))

(assert (=> b!759910 (=> (not res!514264) (not e!423593))))

(declare-fun b!759911 () Bool)

(assert (=> b!759911 (= e!423595 e!423596)))

(declare-fun c!83201 () Bool)

(assert (=> b!759911 (= c!83201 (or (= lt!338592 lt!338537) (= (bvadd lt!338592 lt!338592) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759912 () Bool)

(assert (=> b!759912 (and (bvsge (index!33346 lt!338591) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338591) (size!20565 lt!338530)))))

(assert (=> b!759912 (= e!423594 (= (select (arr!20144 lt!338530) (index!33346 lt!338591)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100387 c!83203) b!759907))

(assert (= (and d!100387 (not c!83203)) b!759911))

(assert (= (and b!759911 c!83201) b!759908))

(assert (= (and b!759911 (not c!83201)) b!759904))

(assert (= (and d!100387 c!83202) b!759909))

(assert (= (and d!100387 (not c!83202)) b!759910))

(assert (= (and b!759910 res!514264) b!759905))

(assert (= (and b!759905 (not res!514265)) b!759906))

(assert (= (and b!759906 (not res!514266)) b!759912))

(declare-fun m!707187 () Bool)

(assert (=> b!759904 m!707187))

(assert (=> b!759904 m!707187))

(declare-fun m!707189 () Bool)

(assert (=> b!759904 m!707189))

(declare-fun m!707191 () Bool)

(assert (=> b!759906 m!707191))

(assert (=> b!759912 m!707191))

(assert (=> b!759905 m!707191))

(declare-fun m!707193 () Bool)

(assert (=> d!100387 m!707193))

(assert (=> d!100387 m!707085))

(assert (=> b!759774 d!100387))

(declare-fun e!423601 () SeekEntryResult!7744)

(declare-fun b!759913 () Bool)

(assert (=> b!759913 (= e!423601 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!338537 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!338537 lt!338530 mask!3328))))

(declare-fun b!759914 () Bool)

(declare-fun lt!338593 () SeekEntryResult!7744)

(assert (=> b!759914 (and (bvsge (index!33346 lt!338593) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338593) (size!20565 lt!338530)))))

(declare-fun res!514268 () Bool)

(assert (=> b!759914 (= res!514268 (= (select (arr!20144 lt!338530) (index!33346 lt!338593)) lt!338537))))

(declare-fun e!423599 () Bool)

(assert (=> b!759914 (=> res!514268 e!423599)))

(declare-fun e!423598 () Bool)

(assert (=> b!759914 (= e!423598 e!423599)))

(declare-fun b!759915 () Bool)

(assert (=> b!759915 (and (bvsge (index!33346 lt!338593) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338593) (size!20565 lt!338530)))))

(declare-fun res!514269 () Bool)

(assert (=> b!759915 (= res!514269 (= (select (arr!20144 lt!338530) (index!33346 lt!338593)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!759915 (=> res!514269 e!423599)))

(declare-fun b!759916 () Bool)

(declare-fun e!423600 () SeekEntryResult!7744)

(assert (=> b!759916 (= e!423600 (Intermediate!7744 true (toIndex!0 lt!338537 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!759917 () Bool)

(assert (=> b!759917 (= e!423601 (Intermediate!7744 false (toIndex!0 lt!338537 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!759918 () Bool)

(declare-fun e!423597 () Bool)

(assert (=> b!759918 (= e!423597 (bvsge (x!64222 lt!338593) #b01111111111111111111111111111110))))

(declare-fun d!100397 () Bool)

(assert (=> d!100397 e!423597))

(declare-fun c!83205 () Bool)

(assert (=> d!100397 (= c!83205 (and (is-Intermediate!7744 lt!338593) (undefined!8556 lt!338593)))))

(assert (=> d!100397 (= lt!338593 e!423600)))

(declare-fun c!83206 () Bool)

(assert (=> d!100397 (= c!83206 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!338594 () (_ BitVec 64))

(assert (=> d!100397 (= lt!338594 (select (arr!20144 lt!338530) (toIndex!0 lt!338537 mask!3328)))))

(assert (=> d!100397 (validMask!0 mask!3328)))

(assert (=> d!100397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338537 mask!3328) lt!338537 lt!338530 mask!3328) lt!338593)))

(declare-fun b!759919 () Bool)

(assert (=> b!759919 (= e!423597 e!423598)))

(declare-fun res!514267 () Bool)

(assert (=> b!759919 (= res!514267 (and (is-Intermediate!7744 lt!338593) (not (undefined!8556 lt!338593)) (bvslt (x!64222 lt!338593) #b01111111111111111111111111111110) (bvsge (x!64222 lt!338593) #b00000000000000000000000000000000) (bvsge (x!64222 lt!338593) #b00000000000000000000000000000000)))))

(assert (=> b!759919 (=> (not res!514267) (not e!423598))))

(declare-fun b!759920 () Bool)

(assert (=> b!759920 (= e!423600 e!423601)))

(declare-fun c!83204 () Bool)

(assert (=> b!759920 (= c!83204 (or (= lt!338594 lt!338537) (= (bvadd lt!338594 lt!338594) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759921 () Bool)

(assert (=> b!759921 (and (bvsge (index!33346 lt!338593) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338593) (size!20565 lt!338530)))))

(assert (=> b!759921 (= e!423599 (= (select (arr!20144 lt!338530) (index!33346 lt!338593)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100397 c!83206) b!759916))

(assert (= (and d!100397 (not c!83206)) b!759920))

(assert (= (and b!759920 c!83204) b!759917))

(assert (= (and b!759920 (not c!83204)) b!759913))

(assert (= (and d!100397 c!83205) b!759918))

(assert (= (and d!100397 (not c!83205)) b!759919))

(assert (= (and b!759919 res!514267) b!759914))

(assert (= (and b!759914 (not res!514268)) b!759915))

(assert (= (and b!759915 (not res!514269)) b!759921))

(assert (=> b!759913 m!707121))

(declare-fun m!707195 () Bool)

(assert (=> b!759913 m!707195))

(assert (=> b!759913 m!707195))

(declare-fun m!707197 () Bool)

(assert (=> b!759913 m!707197))

(declare-fun m!707199 () Bool)

(assert (=> b!759915 m!707199))

(assert (=> b!759921 m!707199))

(assert (=> b!759914 m!707199))

(assert (=> d!100397 m!707121))

(declare-fun m!707205 () Bool)

(assert (=> d!100397 m!707205))

(assert (=> d!100397 m!707085))

(assert (=> b!759774 d!100397))

(declare-fun d!100399 () Bool)

(declare-fun lt!338608 () (_ BitVec 32))

(declare-fun lt!338607 () (_ BitVec 32))

(assert (=> d!100399 (= lt!338608 (bvmul (bvxor lt!338607 (bvlshr lt!338607 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100399 (= lt!338607 ((_ extract 31 0) (bvand (bvxor lt!338537 (bvlshr lt!338537 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100399 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514270 (let ((h!15216 ((_ extract 31 0) (bvand (bvxor lt!338537 (bvlshr lt!338537 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64228 (bvmul (bvxor h!15216 (bvlshr h!15216 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64228 (bvlshr x!64228 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514270 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514270 #b00000000000000000000000000000000))))))

(assert (=> d!100399 (= (toIndex!0 lt!338537 mask!3328) (bvand (bvxor lt!338608 (bvlshr lt!338608 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!759774 d!100399))

(declare-fun d!100403 () Bool)

(declare-fun res!514285 () Bool)

(declare-fun e!423624 () Bool)

(assert (=> d!100403 (=> res!514285 e!423624)))

(assert (=> d!100403 (= res!514285 (= (select (arr!20144 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!100403 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!423624)))

(declare-fun b!759952 () Bool)

(declare-fun e!423625 () Bool)

(assert (=> b!759952 (= e!423624 e!423625)))

(declare-fun res!514286 () Bool)

(assert (=> b!759952 (=> (not res!514286) (not e!423625))))

(assert (=> b!759952 (= res!514286 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20565 a!3186)))))

(declare-fun b!759953 () Bool)

(assert (=> b!759953 (= e!423625 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100403 (not res!514285)) b!759952))

(assert (= (and b!759952 res!514286) b!759953))

(assert (=> d!100403 m!707143))

(declare-fun m!707217 () Bool)

(assert (=> b!759953 m!707217))

(assert (=> b!759764 d!100403))

(declare-fun d!100407 () Bool)

(assert (=> d!100407 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!65888 d!100407))

(declare-fun d!100419 () Bool)

(assert (=> d!100419 (= (array_inv!15940 a!3186) (bvsge (size!20565 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!65888 d!100419))

(declare-fun b!760061 () Bool)

(declare-fun e!423689 () SeekEntryResult!7744)

(assert (=> b!760061 (= e!423689 (MissingVacant!7744 resIntermediateIndex!5))))

(declare-fun b!760062 () Bool)

(declare-fun e!423691 () SeekEntryResult!7744)

(assert (=> b!760062 (= e!423691 Undefined!7744)))

(declare-fun b!760063 () Bool)

(declare-fun e!423690 () SeekEntryResult!7744)

(assert (=> b!760063 (= e!423691 e!423690)))

(declare-fun lt!338653 () (_ BitVec 64))

(declare-fun c!83253 () Bool)

(assert (=> b!760063 (= c!83253 (= lt!338653 (select (arr!20144 a!3186) j!159)))))

(declare-fun b!760064 () Bool)

(assert (=> b!760064 (= e!423690 (Found!7744 index!1321))))

(declare-fun b!760065 () Bool)

(declare-fun c!83254 () Bool)

(assert (=> b!760065 (= c!83254 (= lt!338653 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760065 (= e!423690 e!423689)))

(declare-fun lt!338654 () SeekEntryResult!7744)

(declare-fun d!100421 () Bool)

(assert (=> d!100421 (and (or (is-Undefined!7744 lt!338654) (not (is-Found!7744 lt!338654)) (and (bvsge (index!33345 lt!338654) #b00000000000000000000000000000000) (bvslt (index!33345 lt!338654) (size!20565 a!3186)))) (or (is-Undefined!7744 lt!338654) (is-Found!7744 lt!338654) (not (is-MissingVacant!7744 lt!338654)) (not (= (index!33347 lt!338654) resIntermediateIndex!5)) (and (bvsge (index!33347 lt!338654) #b00000000000000000000000000000000) (bvslt (index!33347 lt!338654) (size!20565 a!3186)))) (or (is-Undefined!7744 lt!338654) (ite (is-Found!7744 lt!338654) (= (select (arr!20144 a!3186) (index!33345 lt!338654)) (select (arr!20144 a!3186) j!159)) (and (is-MissingVacant!7744 lt!338654) (= (index!33347 lt!338654) resIntermediateIndex!5) (= (select (arr!20144 a!3186) (index!33347 lt!338654)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100421 (= lt!338654 e!423691)))

(declare-fun c!83255 () Bool)

(assert (=> d!100421 (= c!83255 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100421 (= lt!338653 (select (arr!20144 a!3186) index!1321))))

(assert (=> d!100421 (validMask!0 mask!3328)))

(assert (=> d!100421 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338654)))

(declare-fun b!760066 () Bool)

(assert (=> b!760066 (= e!423689 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20144 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100421 c!83255) b!760062))

(assert (= (and d!100421 (not c!83255)) b!760063))

(assert (= (and b!760063 c!83253) b!760064))

(assert (= (and b!760063 (not c!83253)) b!760065))

(assert (= (and b!760065 c!83254) b!760061))

(assert (= (and b!760065 (not c!83254)) b!760066))

(declare-fun m!707307 () Bool)

(assert (=> d!100421 m!707307))

(declare-fun m!707309 () Bool)

(assert (=> d!100421 m!707309))

(declare-fun m!707311 () Bool)

(assert (=> d!100421 m!707311))

(assert (=> d!100421 m!707085))

(assert (=> b!760066 m!707187))

(assert (=> b!760066 m!707187))

(assert (=> b!760066 m!707091))

(declare-fun m!707313 () Bool)

(assert (=> b!760066 m!707313))

(assert (=> b!759765 d!100421))

(declare-fun d!100439 () Bool)

(assert (=> d!100439 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!759771 d!100439))

(declare-fun b!760067 () Bool)

(declare-fun e!423694 () Bool)

(declare-fun e!423692 () Bool)

(assert (=> b!760067 (= e!423694 e!423692)))

(declare-fun lt!338655 () (_ BitVec 64))

(assert (=> b!760067 (= lt!338655 (select (arr!20144 a!3186) j!159))))

(declare-fun lt!338657 () Unit!26328)

(assert (=> b!760067 (= lt!338657 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338655 j!159))))

(assert (=> b!760067 (arrayContainsKey!0 a!3186 lt!338655 #b00000000000000000000000000000000)))

(declare-fun lt!338656 () Unit!26328)

(assert (=> b!760067 (= lt!338656 lt!338657)))

(declare-fun res!514319 () Bool)

(assert (=> b!760067 (= res!514319 (= (seekEntryOrOpen!0 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) (Found!7744 j!159)))))

(assert (=> b!760067 (=> (not res!514319) (not e!423692))))

(declare-fun b!760068 () Bool)

(declare-fun call!34925 () Bool)

(assert (=> b!760068 (= e!423694 call!34925)))

(declare-fun b!760069 () Bool)

(assert (=> b!760069 (= e!423692 call!34925)))

(declare-fun b!760070 () Bool)

(declare-fun e!423693 () Bool)

(assert (=> b!760070 (= e!423693 e!423694)))

(declare-fun c!83256 () Bool)

(assert (=> b!760070 (= c!83256 (validKeyInArray!0 (select (arr!20144 a!3186) j!159)))))

(declare-fun bm!34922 () Bool)

(assert (=> bm!34922 (= call!34925 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!100441 () Bool)

(declare-fun res!514318 () Bool)

(assert (=> d!100441 (=> res!514318 e!423693)))

(assert (=> d!100441 (= res!514318 (bvsge j!159 (size!20565 a!3186)))))

(assert (=> d!100441 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!423693)))

(assert (= (and d!100441 (not res!514318)) b!760070))

(assert (= (and b!760070 c!83256) b!760067))

(assert (= (and b!760070 (not c!83256)) b!760068))

(assert (= (and b!760067 res!514319) b!760069))

(assert (= (or b!760069 b!760068) bm!34922))

(assert (=> b!760067 m!707091))

(declare-fun m!707315 () Bool)

(assert (=> b!760067 m!707315))

(declare-fun m!707317 () Bool)

(assert (=> b!760067 m!707317))

(assert (=> b!760067 m!707091))

(assert (=> b!760067 m!707103))

(assert (=> b!760070 m!707091))

(assert (=> b!760070 m!707091))

(assert (=> b!760070 m!707115))

(declare-fun m!707319 () Bool)

(assert (=> bm!34922 m!707319))

(assert (=> b!759761 d!100441))

(declare-fun d!100443 () Bool)

(assert (=> d!100443 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!338668 () Unit!26328)

(declare-fun choose!38 (array!42061 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26328)

(assert (=> d!100443 (= lt!338668 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!100443 (validMask!0 mask!3328)))

(assert (=> d!100443 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!338668)))

(declare-fun bs!21380 () Bool)

(assert (= bs!21380 d!100443))

(assert (=> bs!21380 m!707095))

(declare-fun m!707329 () Bool)

(assert (=> bs!21380 m!707329))

(assert (=> bs!21380 m!707085))

(assert (=> b!759761 d!100443))

(declare-fun b!760141 () Bool)

(declare-fun e!423741 () SeekEntryResult!7744)

(assert (=> b!760141 (= e!423741 Undefined!7744)))

(declare-fun b!760142 () Bool)

(declare-fun c!83279 () Bool)

(declare-fun lt!338690 () (_ BitVec 64))

(assert (=> b!760142 (= c!83279 (= lt!338690 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423742 () SeekEntryResult!7744)

(declare-fun e!423740 () SeekEntryResult!7744)

(assert (=> b!760142 (= e!423742 e!423740)))

(declare-fun b!760143 () Bool)

(declare-fun lt!338689 () SeekEntryResult!7744)

(assert (=> b!760143 (= e!423740 (MissingZero!7744 (index!33346 lt!338689)))))

(declare-fun b!760144 () Bool)

(assert (=> b!760144 (= e!423741 e!423742)))

(assert (=> b!760144 (= lt!338690 (select (arr!20144 a!3186) (index!33346 lt!338689)))))

(declare-fun c!83280 () Bool)

(assert (=> b!760144 (= c!83280 (= lt!338690 k!2102))))

(declare-fun d!100453 () Bool)

(declare-fun lt!338691 () SeekEntryResult!7744)

(assert (=> d!100453 (and (or (is-Undefined!7744 lt!338691) (not (is-Found!7744 lt!338691)) (and (bvsge (index!33345 lt!338691) #b00000000000000000000000000000000) (bvslt (index!33345 lt!338691) (size!20565 a!3186)))) (or (is-Undefined!7744 lt!338691) (is-Found!7744 lt!338691) (not (is-MissingZero!7744 lt!338691)) (and (bvsge (index!33344 lt!338691) #b00000000000000000000000000000000) (bvslt (index!33344 lt!338691) (size!20565 a!3186)))) (or (is-Undefined!7744 lt!338691) (is-Found!7744 lt!338691) (is-MissingZero!7744 lt!338691) (not (is-MissingVacant!7744 lt!338691)) (and (bvsge (index!33347 lt!338691) #b00000000000000000000000000000000) (bvslt (index!33347 lt!338691) (size!20565 a!3186)))) (or (is-Undefined!7744 lt!338691) (ite (is-Found!7744 lt!338691) (= (select (arr!20144 a!3186) (index!33345 lt!338691)) k!2102) (ite (is-MissingZero!7744 lt!338691) (= (select (arr!20144 a!3186) (index!33344 lt!338691)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7744 lt!338691) (= (select (arr!20144 a!3186) (index!33347 lt!338691)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100453 (= lt!338691 e!423741)))

(declare-fun c!83281 () Bool)

(assert (=> d!100453 (= c!83281 (and (is-Intermediate!7744 lt!338689) (undefined!8556 lt!338689)))))

(assert (=> d!100453 (= lt!338689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!100453 (validMask!0 mask!3328)))

(assert (=> d!100453 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!338691)))

(declare-fun b!760145 () Bool)

(assert (=> b!760145 (= e!423740 (seekKeyOrZeroReturnVacant!0 (x!64222 lt!338689) (index!33346 lt!338689) (index!33346 lt!338689) k!2102 a!3186 mask!3328))))

(declare-fun b!760146 () Bool)

(assert (=> b!760146 (= e!423742 (Found!7744 (index!33346 lt!338689)))))

(assert (= (and d!100453 c!83281) b!760141))

(assert (= (and d!100453 (not c!83281)) b!760144))

(assert (= (and b!760144 c!83280) b!760146))

(assert (= (and b!760144 (not c!83280)) b!760142))

(assert (= (and b!760142 c!83279) b!760143))

(assert (= (and b!760142 (not c!83279)) b!760145))

(declare-fun m!707365 () Bool)

(assert (=> b!760144 m!707365))

(assert (=> d!100453 m!707085))

(declare-fun m!707367 () Bool)

(assert (=> d!100453 m!707367))

(declare-fun m!707369 () Bool)

(assert (=> d!100453 m!707369))

(declare-fun m!707371 () Bool)

(assert (=> d!100453 m!707371))

(declare-fun m!707373 () Bool)

(assert (=> d!100453 m!707373))

(declare-fun m!707375 () Bool)

(assert (=> d!100453 m!707375))

(assert (=> d!100453 m!707373))

(declare-fun m!707377 () Bool)

(assert (=> b!760145 m!707377))

(assert (=> b!759772 d!100453))

(declare-fun b!760147 () Bool)

(declare-fun e!423744 () SeekEntryResult!7744)

(assert (=> b!760147 (= e!423744 Undefined!7744)))

(declare-fun b!760148 () Bool)

(declare-fun c!83282 () Bool)

(declare-fun lt!338693 () (_ BitVec 64))

(assert (=> b!760148 (= c!83282 (= lt!338693 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423745 () SeekEntryResult!7744)

(declare-fun e!423743 () SeekEntryResult!7744)

(assert (=> b!760148 (= e!423745 e!423743)))

(declare-fun b!760149 () Bool)

(declare-fun lt!338692 () SeekEntryResult!7744)

(assert (=> b!760149 (= e!423743 (MissingZero!7744 (index!33346 lt!338692)))))

(declare-fun b!760150 () Bool)

(assert (=> b!760150 (= e!423744 e!423745)))

(assert (=> b!760150 (= lt!338693 (select (arr!20144 a!3186) (index!33346 lt!338692)))))

(declare-fun c!83283 () Bool)

(assert (=> b!760150 (= c!83283 (= lt!338693 (select (arr!20144 a!3186) j!159)))))

(declare-fun d!100471 () Bool)

(declare-fun lt!338694 () SeekEntryResult!7744)

(assert (=> d!100471 (and (or (is-Undefined!7744 lt!338694) (not (is-Found!7744 lt!338694)) (and (bvsge (index!33345 lt!338694) #b00000000000000000000000000000000) (bvslt (index!33345 lt!338694) (size!20565 a!3186)))) (or (is-Undefined!7744 lt!338694) (is-Found!7744 lt!338694) (not (is-MissingZero!7744 lt!338694)) (and (bvsge (index!33344 lt!338694) #b00000000000000000000000000000000) (bvslt (index!33344 lt!338694) (size!20565 a!3186)))) (or (is-Undefined!7744 lt!338694) (is-Found!7744 lt!338694) (is-MissingZero!7744 lt!338694) (not (is-MissingVacant!7744 lt!338694)) (and (bvsge (index!33347 lt!338694) #b00000000000000000000000000000000) (bvslt (index!33347 lt!338694) (size!20565 a!3186)))) (or (is-Undefined!7744 lt!338694) (ite (is-Found!7744 lt!338694) (= (select (arr!20144 a!3186) (index!33345 lt!338694)) (select (arr!20144 a!3186) j!159)) (ite (is-MissingZero!7744 lt!338694) (= (select (arr!20144 a!3186) (index!33344 lt!338694)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7744 lt!338694) (= (select (arr!20144 a!3186) (index!33347 lt!338694)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100471 (= lt!338694 e!423744)))

(declare-fun c!83284 () Bool)

(assert (=> d!100471 (= c!83284 (and (is-Intermediate!7744 lt!338692) (undefined!8556 lt!338692)))))

(assert (=> d!100471 (= lt!338692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) (select (arr!20144 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100471 (validMask!0 mask!3328)))

(assert (=> d!100471 (= (seekEntryOrOpen!0 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338694)))

(declare-fun b!760151 () Bool)

(assert (=> b!760151 (= e!423743 (seekKeyOrZeroReturnVacant!0 (x!64222 lt!338692) (index!33346 lt!338692) (index!33346 lt!338692) (select (arr!20144 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760152 () Bool)

(assert (=> b!760152 (= e!423745 (Found!7744 (index!33346 lt!338692)))))

(assert (= (and d!100471 c!83284) b!760147))

(assert (= (and d!100471 (not c!83284)) b!760150))

(assert (= (and b!760150 c!83283) b!760152))

(assert (= (and b!760150 (not c!83283)) b!760148))

(assert (= (and b!760148 c!83282) b!760149))

(assert (= (and b!760148 (not c!83282)) b!760151))

(declare-fun m!707379 () Bool)

(assert (=> b!760150 m!707379))

(assert (=> d!100471 m!707085))

(declare-fun m!707381 () Bool)

(assert (=> d!100471 m!707381))

(declare-fun m!707383 () Bool)

(assert (=> d!100471 m!707383))

(declare-fun m!707385 () Bool)

(assert (=> d!100471 m!707385))

(assert (=> d!100471 m!707099))

(assert (=> d!100471 m!707091))

(assert (=> d!100471 m!707101))

(assert (=> d!100471 m!707091))

(assert (=> d!100471 m!707099))

(assert (=> b!760151 m!707091))

(declare-fun m!707387 () Bool)

(assert (=> b!760151 m!707387))

(assert (=> b!759773 d!100471))

(declare-fun e!423750 () SeekEntryResult!7744)

(declare-fun b!760153 () Bool)

(assert (=> b!760153 (= e!423750 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20144 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760154 () Bool)

(declare-fun lt!338695 () SeekEntryResult!7744)

(assert (=> b!760154 (and (bvsge (index!33346 lt!338695) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338695) (size!20565 a!3186)))))

(declare-fun res!514348 () Bool)

(assert (=> b!760154 (= res!514348 (= (select (arr!20144 a!3186) (index!33346 lt!338695)) (select (arr!20144 a!3186) j!159)))))

(declare-fun e!423748 () Bool)

(assert (=> b!760154 (=> res!514348 e!423748)))

(declare-fun e!423747 () Bool)

(assert (=> b!760154 (= e!423747 e!423748)))

(declare-fun b!760155 () Bool)

(assert (=> b!760155 (and (bvsge (index!33346 lt!338695) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338695) (size!20565 a!3186)))))

(declare-fun res!514349 () Bool)

(assert (=> b!760155 (= res!514349 (= (select (arr!20144 a!3186) (index!33346 lt!338695)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760155 (=> res!514349 e!423748)))

(declare-fun b!760156 () Bool)

(declare-fun e!423749 () SeekEntryResult!7744)

(assert (=> b!760156 (= e!423749 (Intermediate!7744 true index!1321 x!1131))))

(declare-fun b!760157 () Bool)

(assert (=> b!760157 (= e!423750 (Intermediate!7744 false index!1321 x!1131))))

(declare-fun b!760158 () Bool)

(declare-fun e!423746 () Bool)

(assert (=> b!760158 (= e!423746 (bvsge (x!64222 lt!338695) #b01111111111111111111111111111110))))

(declare-fun d!100473 () Bool)

(assert (=> d!100473 e!423746))

(declare-fun c!83286 () Bool)

(assert (=> d!100473 (= c!83286 (and (is-Intermediate!7744 lt!338695) (undefined!8556 lt!338695)))))

(assert (=> d!100473 (= lt!338695 e!423749)))

(declare-fun c!83287 () Bool)

(assert (=> d!100473 (= c!83287 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!338696 () (_ BitVec 64))

(assert (=> d!100473 (= lt!338696 (select (arr!20144 a!3186) index!1321))))

(assert (=> d!100473 (validMask!0 mask!3328)))

(assert (=> d!100473 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338695)))

(declare-fun b!760159 () Bool)

(assert (=> b!760159 (= e!423746 e!423747)))

(declare-fun res!514347 () Bool)

(assert (=> b!760159 (= res!514347 (and (is-Intermediate!7744 lt!338695) (not (undefined!8556 lt!338695)) (bvslt (x!64222 lt!338695) #b01111111111111111111111111111110) (bvsge (x!64222 lt!338695) #b00000000000000000000000000000000) (bvsge (x!64222 lt!338695) x!1131)))))

(assert (=> b!760159 (=> (not res!514347) (not e!423747))))

(declare-fun b!760160 () Bool)

(assert (=> b!760160 (= e!423749 e!423750)))

(declare-fun c!83285 () Bool)

(assert (=> b!760160 (= c!83285 (or (= lt!338696 (select (arr!20144 a!3186) j!159)) (= (bvadd lt!338696 lt!338696) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760161 () Bool)

(assert (=> b!760161 (and (bvsge (index!33346 lt!338695) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338695) (size!20565 a!3186)))))

(assert (=> b!760161 (= e!423748 (= (select (arr!20144 a!3186) (index!33346 lt!338695)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100473 c!83287) b!760156))

(assert (= (and d!100473 (not c!83287)) b!760160))

(assert (= (and b!760160 c!83285) b!760157))

(assert (= (and b!760160 (not c!83285)) b!760153))

(assert (= (and d!100473 c!83286) b!760158))

(assert (= (and d!100473 (not c!83286)) b!760159))

(assert (= (and b!760159 res!514347) b!760154))

(assert (= (and b!760154 (not res!514348)) b!760155))

(assert (= (and b!760155 (not res!514349)) b!760161))

(assert (=> b!760153 m!707187))

(assert (=> b!760153 m!707187))

(assert (=> b!760153 m!707091))

(declare-fun m!707389 () Bool)

(assert (=> b!760153 m!707389))

(declare-fun m!707391 () Bool)

(assert (=> b!760155 m!707391))

(assert (=> b!760161 m!707391))

(assert (=> b!760154 m!707391))

(assert (=> d!100473 m!707311))

(assert (=> d!100473 m!707085))

(assert (=> b!759758 d!100473))

(declare-fun d!100475 () Bool)

(assert (=> d!100475 (= (validKeyInArray!0 (select (arr!20144 a!3186) j!159)) (and (not (= (select (arr!20144 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20144 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!759769 d!100475))

(declare-fun b!760162 () Bool)

(declare-fun e!423755 () SeekEntryResult!7744)

(assert (=> b!760162 (= e!423755 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20144 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760163 () Bool)

(declare-fun lt!338697 () SeekEntryResult!7744)

(assert (=> b!760163 (and (bvsge (index!33346 lt!338697) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338697) (size!20565 a!3186)))))

(declare-fun res!514351 () Bool)

(assert (=> b!760163 (= res!514351 (= (select (arr!20144 a!3186) (index!33346 lt!338697)) (select (arr!20144 a!3186) j!159)))))

(declare-fun e!423753 () Bool)

(assert (=> b!760163 (=> res!514351 e!423753)))

(declare-fun e!423752 () Bool)

(assert (=> b!760163 (= e!423752 e!423753)))

(declare-fun b!760164 () Bool)

(assert (=> b!760164 (and (bvsge (index!33346 lt!338697) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338697) (size!20565 a!3186)))))

(declare-fun res!514352 () Bool)

(assert (=> b!760164 (= res!514352 (= (select (arr!20144 a!3186) (index!33346 lt!338697)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760164 (=> res!514352 e!423753)))

(declare-fun b!760165 () Bool)

(declare-fun e!423754 () SeekEntryResult!7744)

(assert (=> b!760165 (= e!423754 (Intermediate!7744 true (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760166 () Bool)

(assert (=> b!760166 (= e!423755 (Intermediate!7744 false (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760167 () Bool)

(declare-fun e!423751 () Bool)

(assert (=> b!760167 (= e!423751 (bvsge (x!64222 lt!338697) #b01111111111111111111111111111110))))

(declare-fun d!100477 () Bool)

(assert (=> d!100477 e!423751))

(declare-fun c!83289 () Bool)

(assert (=> d!100477 (= c!83289 (and (is-Intermediate!7744 lt!338697) (undefined!8556 lt!338697)))))

(assert (=> d!100477 (= lt!338697 e!423754)))

(declare-fun c!83290 () Bool)

(assert (=> d!100477 (= c!83290 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!338698 () (_ BitVec 64))

(assert (=> d!100477 (= lt!338698 (select (arr!20144 a!3186) (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328)))))

(assert (=> d!100477 (validMask!0 mask!3328)))

(assert (=> d!100477 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338697)))

(declare-fun b!760168 () Bool)

(assert (=> b!760168 (= e!423751 e!423752)))

(declare-fun res!514350 () Bool)

(assert (=> b!760168 (= res!514350 (and (is-Intermediate!7744 lt!338697) (not (undefined!8556 lt!338697)) (bvslt (x!64222 lt!338697) #b01111111111111111111111111111110) (bvsge (x!64222 lt!338697) #b00000000000000000000000000000000) (bvsge (x!64222 lt!338697) #b00000000000000000000000000000000)))))

(assert (=> b!760168 (=> (not res!514350) (not e!423752))))

(declare-fun b!760169 () Bool)

(assert (=> b!760169 (= e!423754 e!423755)))

(declare-fun c!83288 () Bool)

(assert (=> b!760169 (= c!83288 (or (= lt!338698 (select (arr!20144 a!3186) j!159)) (= (bvadd lt!338698 lt!338698) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760170 () Bool)

(assert (=> b!760170 (and (bvsge (index!33346 lt!338697) #b00000000000000000000000000000000) (bvslt (index!33346 lt!338697) (size!20565 a!3186)))))

(assert (=> b!760170 (= e!423753 (= (select (arr!20144 a!3186) (index!33346 lt!338697)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100477 c!83290) b!760165))

(assert (= (and d!100477 (not c!83290)) b!760169))

(assert (= (and b!760169 c!83288) b!760166))

(assert (= (and b!760169 (not c!83288)) b!760162))

(assert (= (and d!100477 c!83289) b!760167))

(assert (= (and d!100477 (not c!83289)) b!760168))

(assert (= (and b!760168 res!514350) b!760163))

(assert (= (and b!760163 (not res!514351)) b!760164))

(assert (= (and b!760164 (not res!514352)) b!760170))

(assert (=> b!760162 m!707099))

(declare-fun m!707393 () Bool)

(assert (=> b!760162 m!707393))

(assert (=> b!760162 m!707393))

(assert (=> b!760162 m!707091))

(declare-fun m!707395 () Bool)

(assert (=> b!760162 m!707395))

(declare-fun m!707397 () Bool)

(assert (=> b!760164 m!707397))

(assert (=> b!760170 m!707397))

(assert (=> b!760163 m!707397))

(assert (=> d!100477 m!707099))

(declare-fun m!707399 () Bool)

(assert (=> d!100477 m!707399))

(assert (=> d!100477 m!707085))

(assert (=> b!759760 d!100477))

(declare-fun d!100479 () Bool)

(declare-fun lt!338700 () (_ BitVec 32))

(declare-fun lt!338699 () (_ BitVec 32))

(assert (=> d!100479 (= lt!338700 (bvmul (bvxor lt!338699 (bvlshr lt!338699 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100479 (= lt!338699 ((_ extract 31 0) (bvand (bvxor (select (arr!20144 a!3186) j!159) (bvlshr (select (arr!20144 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100479 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514270 (let ((h!15216 ((_ extract 31 0) (bvand (bvxor (select (arr!20144 a!3186) j!159) (bvlshr (select (arr!20144 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64228 (bvmul (bvxor h!15216 (bvlshr h!15216 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64228 (bvlshr x!64228 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514270 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514270 #b00000000000000000000000000000000))))))

(assert (=> d!100479 (= (toIndex!0 (select (arr!20144 a!3186) j!159) mask!3328) (bvand (bvxor lt!338700 (bvlshr lt!338700 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!759760 d!100479))

(declare-fun b!760171 () Bool)

(declare-fun e!423756 () SeekEntryResult!7744)

(assert (=> b!760171 (= e!423756 (MissingVacant!7744 resIntermediateIndex!5))))

(declare-fun b!760172 () Bool)

(declare-fun e!423758 () SeekEntryResult!7744)

(assert (=> b!760172 (= e!423758 Undefined!7744)))

(declare-fun b!760173 () Bool)

(declare-fun e!423757 () SeekEntryResult!7744)

(assert (=> b!760173 (= e!423758 e!423757)))

(declare-fun c!83291 () Bool)

(declare-fun lt!338701 () (_ BitVec 64))

(assert (=> b!760173 (= c!83291 (= lt!338701 (select (arr!20144 a!3186) j!159)))))

(declare-fun b!760174 () Bool)

(assert (=> b!760174 (= e!423757 (Found!7744 resIntermediateIndex!5))))

(declare-fun b!760175 () Bool)

(declare-fun c!83292 () Bool)

(assert (=> b!760175 (= c!83292 (= lt!338701 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760175 (= e!423757 e!423756)))

(declare-fun d!100481 () Bool)

(declare-fun lt!338702 () SeekEntryResult!7744)

(assert (=> d!100481 (and (or (is-Undefined!7744 lt!338702) (not (is-Found!7744 lt!338702)) (and (bvsge (index!33345 lt!338702) #b00000000000000000000000000000000) (bvslt (index!33345 lt!338702) (size!20565 a!3186)))) (or (is-Undefined!7744 lt!338702) (is-Found!7744 lt!338702) (not (is-MissingVacant!7744 lt!338702)) (not (= (index!33347 lt!338702) resIntermediateIndex!5)) (and (bvsge (index!33347 lt!338702) #b00000000000000000000000000000000) (bvslt (index!33347 lt!338702) (size!20565 a!3186)))) (or (is-Undefined!7744 lt!338702) (ite (is-Found!7744 lt!338702) (= (select (arr!20144 a!3186) (index!33345 lt!338702)) (select (arr!20144 a!3186) j!159)) (and (is-MissingVacant!7744 lt!338702) (= (index!33347 lt!338702) resIntermediateIndex!5) (= (select (arr!20144 a!3186) (index!33347 lt!338702)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100481 (= lt!338702 e!423758)))

(declare-fun c!83293 () Bool)

(assert (=> d!100481 (= c!83293 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!100481 (= lt!338701 (select (arr!20144 a!3186) resIntermediateIndex!5))))

(assert (=> d!100481 (validMask!0 mask!3328)))

(assert (=> d!100481 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20144 a!3186) j!159) a!3186 mask!3328) lt!338702)))

(declare-fun b!760176 () Bool)

(assert (=> b!760176 (= e!423756 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20144 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!100481 c!83293) b!760172))

(assert (= (and d!100481 (not c!83293)) b!760173))

(assert (= (and b!760173 c!83291) b!760174))

(assert (= (and b!760173 (not c!83291)) b!760175))

(assert (= (and b!760175 c!83292) b!760171))

(assert (= (and b!760175 (not c!83292)) b!760176))

(declare-fun m!707401 () Bool)

(assert (=> d!100481 m!707401))

(declare-fun m!707403 () Bool)

(assert (=> d!100481 m!707403))

(assert (=> d!100481 m!707109))

(assert (=> d!100481 m!707085))

(declare-fun m!707405 () Bool)

(assert (=> b!760176 m!707405))

(assert (=> b!760176 m!707405))

(assert (=> b!760176 m!707091))

(declare-fun m!707407 () Bool)

(assert (=> b!760176 m!707407))

(assert (=> b!759767 d!100481))

(declare-fun b!760187 () Bool)

(declare-fun e!423768 () Bool)

(declare-fun contains!4065 (List!14146 (_ BitVec 64)) Bool)

(assert (=> b!760187 (= e!423768 (contains!4065 Nil!14143 (select (arr!20144 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760188 () Bool)

(declare-fun e!423770 () Bool)

(declare-fun e!423769 () Bool)

(assert (=> b!760188 (= e!423770 e!423769)))

(declare-fun c!83296 () Bool)

(assert (=> b!760188 (= c!83296 (validKeyInArray!0 (select (arr!20144 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760189 () Bool)

(declare-fun e!423767 () Bool)

(assert (=> b!760189 (= e!423767 e!423770)))

(declare-fun res!514360 () Bool)

(assert (=> b!760189 (=> (not res!514360) (not e!423770))))

(assert (=> b!760189 (= res!514360 (not e!423768))))

(declare-fun res!514361 () Bool)

(assert (=> b!760189 (=> (not res!514361) (not e!423768))))

(assert (=> b!760189 (= res!514361 (validKeyInArray!0 (select (arr!20144 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!100483 () Bool)

(declare-fun res!514359 () Bool)

(assert (=> d!100483 (=> res!514359 e!423767)))

(assert (=> d!100483 (= res!514359 (bvsge #b00000000000000000000000000000000 (size!20565 a!3186)))))

(assert (=> d!100483 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14143) e!423767)))

(declare-fun bm!34929 () Bool)

(declare-fun call!34932 () Bool)

(assert (=> bm!34929 (= call!34932 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83296 (Cons!14142 (select (arr!20144 a!3186) #b00000000000000000000000000000000) Nil!14143) Nil!14143)))))

