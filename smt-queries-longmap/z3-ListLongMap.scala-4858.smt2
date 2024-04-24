; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67036 () Bool)

(assert start!67036)

(declare-fun b!772883 () Bool)

(declare-fun res!522628 () Bool)

(declare-fun e!430316 () Bool)

(assert (=> b!772883 (=> (not res!522628) (not e!430316))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((array!42409 0))(
  ( (array!42410 (arr!20299 (Array (_ BitVec 32) (_ BitVec 64))) (size!20719 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42409)

(assert (=> b!772883 (= res!522628 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20719 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20719 a!3186))))))

(declare-fun b!772884 () Bool)

(declare-datatypes ((SeekEntryResult!7855 0))(
  ( (MissingZero!7855 (index!33788 (_ BitVec 32))) (Found!7855 (index!33789 (_ BitVec 32))) (Intermediate!7855 (undefined!8667 Bool) (index!33790 (_ BitVec 32)) (x!64881 (_ BitVec 32))) (Undefined!7855) (MissingVacant!7855 (index!33791 (_ BitVec 32))) )
))
(declare-fun lt!344092 () SeekEntryResult!7855)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!430314 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42409 (_ BitVec 32)) SeekEntryResult!7855)

(assert (=> b!772884 (= e!430314 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) lt!344092))))

(declare-fun b!772885 () Bool)

(declare-fun res!522639 () Bool)

(declare-fun e!430321 () Bool)

(assert (=> b!772885 (=> (not res!522639) (not e!430321))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!772885 (= res!522639 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20299 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772886 () Bool)

(declare-datatypes ((Unit!26611 0))(
  ( (Unit!26612) )
))
(declare-fun e!430312 () Unit!26611)

(declare-fun Unit!26613 () Unit!26611)

(assert (=> b!772886 (= e!430312 Unit!26613)))

(declare-fun lt!344091 () SeekEntryResult!7855)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42409 (_ BitVec 32)) SeekEntryResult!7855)

(assert (=> b!772886 (= lt!344091 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20299 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!344095 () (_ BitVec 32))

(assert (=> b!772886 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344095 resIntermediateIndex!5 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) (Found!7855 j!159))))

(declare-fun b!772887 () Bool)

(assert (=> b!772887 (= e!430316 e!430321)))

(declare-fun res!522636 () Bool)

(assert (=> b!772887 (=> (not res!522636) (not e!430321))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772887 (= res!522636 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20299 a!3186) j!159) mask!3328) (select (arr!20299 a!3186) j!159) a!3186 mask!3328) lt!344092))))

(assert (=> b!772887 (= lt!344092 (Intermediate!7855 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!772888 () Bool)

(declare-fun res!522642 () Bool)

(declare-fun e!430319 () Bool)

(assert (=> b!772888 (=> (not res!522642) (not e!430319))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!772888 (= res!522642 (validKeyInArray!0 k0!2102))))

(declare-fun b!772889 () Bool)

(assert (=> b!772889 (= e!430314 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) (Found!7855 j!159)))))

(declare-fun b!772890 () Bool)

(declare-fun res!522638 () Bool)

(assert (=> b!772890 (=> (not res!522638) (not e!430316))))

(declare-datatypes ((List!14208 0))(
  ( (Nil!14205) (Cons!14204 (h!15312 (_ BitVec 64)) (t!20515 List!14208)) )
))
(declare-fun arrayNoDuplicates!0 (array!42409 (_ BitVec 32) List!14208) Bool)

(assert (=> b!772890 (= res!522638 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14205))))

(declare-fun b!772891 () Bool)

(declare-fun res!522631 () Bool)

(assert (=> b!772891 (=> (not res!522631) (not e!430319))))

(assert (=> b!772891 (= res!522631 (and (= (size!20719 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20719 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20719 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!772892 () Bool)

(declare-fun e!430317 () Bool)

(declare-fun e!430313 () Bool)

(assert (=> b!772892 (= e!430317 (not e!430313))))

(declare-fun res!522634 () Bool)

(assert (=> b!772892 (=> res!522634 e!430313)))

(declare-fun lt!344098 () SeekEntryResult!7855)

(get-info :version)

(assert (=> b!772892 (= res!522634 (or (not ((_ is Intermediate!7855) lt!344098)) (bvsge x!1131 (x!64881 lt!344098))))))

(declare-fun e!430315 () Bool)

(assert (=> b!772892 e!430315))

(declare-fun res!522630 () Bool)

(assert (=> b!772892 (=> (not res!522630) (not e!430315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42409 (_ BitVec 32)) Bool)

(assert (=> b!772892 (= res!522630 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344093 () Unit!26611)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42409 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26611)

(assert (=> b!772892 (= lt!344093 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!772893 () Bool)

(declare-fun res!522640 () Bool)

(assert (=> b!772893 (=> (not res!522640) (not e!430319))))

(assert (=> b!772893 (= res!522640 (validKeyInArray!0 (select (arr!20299 a!3186) j!159)))))

(declare-fun b!772894 () Bool)

(declare-fun res!522635 () Bool)

(assert (=> b!772894 (=> (not res!522635) (not e!430319))))

(declare-fun arrayContainsKey!0 (array!42409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!772894 (= res!522635 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!772895 () Bool)

(assert (=> b!772895 (= e!430319 e!430316)))

(declare-fun res!522632 () Bool)

(assert (=> b!772895 (=> (not res!522632) (not e!430316))))

(declare-fun lt!344094 () SeekEntryResult!7855)

(assert (=> b!772895 (= res!522632 (or (= lt!344094 (MissingZero!7855 i!1173)) (= lt!344094 (MissingVacant!7855 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42409 (_ BitVec 32)) SeekEntryResult!7855)

(assert (=> b!772895 (= lt!344094 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!522641 () Bool)

(assert (=> start!67036 (=> (not res!522641) (not e!430319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67036 (= res!522641 (validMask!0 mask!3328))))

(assert (=> start!67036 e!430319))

(assert (=> start!67036 true))

(declare-fun array_inv!16158 (array!42409) Bool)

(assert (=> start!67036 (array_inv!16158 a!3186)))

(declare-fun b!772896 () Bool)

(assert (=> b!772896 (= e!430313 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (and (bvsge lt!344095 #b00000000000000000000000000000000) (bvslt lt!344095 (size!20719 a!3186)))))))

(declare-fun lt!344096 () Unit!26611)

(assert (=> b!772896 (= lt!344096 e!430312)))

(declare-fun c!85528 () Bool)

(assert (=> b!772896 (= c!85528 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772896 (= lt!344095 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun e!430320 () Bool)

(declare-fun lt!344090 () SeekEntryResult!7855)

(declare-fun b!772897 () Bool)

(assert (=> b!772897 (= e!430320 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) lt!344090))))

(declare-fun b!772898 () Bool)

(declare-fun Unit!26614 () Unit!26611)

(assert (=> b!772898 (= e!430312 Unit!26614)))

(assert (=> b!772898 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344095 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) lt!344092)))

(declare-fun b!772899 () Bool)

(assert (=> b!772899 (= e!430321 e!430317)))

(declare-fun res!522637 () Bool)

(assert (=> b!772899 (=> (not res!522637) (not e!430317))))

(declare-fun lt!344089 () SeekEntryResult!7855)

(assert (=> b!772899 (= res!522637 (= lt!344089 lt!344098))))

(declare-fun lt!344097 () (_ BitVec 64))

(declare-fun lt!344088 () array!42409)

(assert (=> b!772899 (= lt!344098 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344097 lt!344088 mask!3328))))

(assert (=> b!772899 (= lt!344089 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344097 mask!3328) lt!344097 lt!344088 mask!3328))))

(assert (=> b!772899 (= lt!344097 (select (store (arr!20299 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!772899 (= lt!344088 (array!42410 (store (arr!20299 a!3186) i!1173 k0!2102) (size!20719 a!3186)))))

(declare-fun b!772900 () Bool)

(declare-fun res!522633 () Bool)

(assert (=> b!772900 (=> (not res!522633) (not e!430321))))

(assert (=> b!772900 (= res!522633 e!430314)))

(declare-fun c!85529 () Bool)

(assert (=> b!772900 (= c!85529 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!772901 () Bool)

(declare-fun res!522627 () Bool)

(assert (=> b!772901 (=> (not res!522627) (not e!430316))))

(assert (=> b!772901 (= res!522627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!772902 () Bool)

(assert (=> b!772902 (= e!430315 e!430320)))

(declare-fun res!522629 () Bool)

(assert (=> b!772902 (=> (not res!522629) (not e!430320))))

(assert (=> b!772902 (= res!522629 (= (seekEntryOrOpen!0 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) lt!344090))))

(assert (=> b!772902 (= lt!344090 (Found!7855 j!159))))

(assert (= (and start!67036 res!522641) b!772891))

(assert (= (and b!772891 res!522631) b!772893))

(assert (= (and b!772893 res!522640) b!772888))

(assert (= (and b!772888 res!522642) b!772894))

(assert (= (and b!772894 res!522635) b!772895))

(assert (= (and b!772895 res!522632) b!772901))

(assert (= (and b!772901 res!522627) b!772890))

(assert (= (and b!772890 res!522638) b!772883))

(assert (= (and b!772883 res!522628) b!772887))

(assert (= (and b!772887 res!522636) b!772885))

(assert (= (and b!772885 res!522639) b!772900))

(assert (= (and b!772900 c!85529) b!772884))

(assert (= (and b!772900 (not c!85529)) b!772889))

(assert (= (and b!772900 res!522633) b!772899))

(assert (= (and b!772899 res!522637) b!772892))

(assert (= (and b!772892 res!522630) b!772902))

(assert (= (and b!772902 res!522629) b!772897))

(assert (= (and b!772892 (not res!522634)) b!772896))

(assert (= (and b!772896 c!85528) b!772898))

(assert (= (and b!772896 (not c!85528)) b!772886))

(declare-fun m!718253 () Bool)

(assert (=> b!772901 m!718253))

(declare-fun m!718255 () Bool)

(assert (=> b!772888 m!718255))

(declare-fun m!718257 () Bool)

(assert (=> b!772890 m!718257))

(declare-fun m!718259 () Bool)

(assert (=> b!772897 m!718259))

(assert (=> b!772897 m!718259))

(declare-fun m!718261 () Bool)

(assert (=> b!772897 m!718261))

(declare-fun m!718263 () Bool)

(assert (=> start!67036 m!718263))

(declare-fun m!718265 () Bool)

(assert (=> start!67036 m!718265))

(assert (=> b!772902 m!718259))

(assert (=> b!772902 m!718259))

(declare-fun m!718267 () Bool)

(assert (=> b!772902 m!718267))

(assert (=> b!772884 m!718259))

(assert (=> b!772884 m!718259))

(declare-fun m!718269 () Bool)

(assert (=> b!772884 m!718269))

(assert (=> b!772898 m!718259))

(assert (=> b!772898 m!718259))

(declare-fun m!718271 () Bool)

(assert (=> b!772898 m!718271))

(assert (=> b!772893 m!718259))

(assert (=> b!772893 m!718259))

(declare-fun m!718273 () Bool)

(assert (=> b!772893 m!718273))

(declare-fun m!718275 () Bool)

(assert (=> b!772895 m!718275))

(declare-fun m!718277 () Bool)

(assert (=> b!772885 m!718277))

(declare-fun m!718279 () Bool)

(assert (=> b!772899 m!718279))

(declare-fun m!718281 () Bool)

(assert (=> b!772899 m!718281))

(assert (=> b!772899 m!718281))

(declare-fun m!718283 () Bool)

(assert (=> b!772899 m!718283))

(declare-fun m!718285 () Bool)

(assert (=> b!772899 m!718285))

(declare-fun m!718287 () Bool)

(assert (=> b!772899 m!718287))

(assert (=> b!772887 m!718259))

(assert (=> b!772887 m!718259))

(declare-fun m!718289 () Bool)

(assert (=> b!772887 m!718289))

(assert (=> b!772887 m!718289))

(assert (=> b!772887 m!718259))

(declare-fun m!718291 () Bool)

(assert (=> b!772887 m!718291))

(declare-fun m!718293 () Bool)

(assert (=> b!772896 m!718293))

(declare-fun m!718295 () Bool)

(assert (=> b!772894 m!718295))

(assert (=> b!772889 m!718259))

(assert (=> b!772889 m!718259))

(declare-fun m!718297 () Bool)

(assert (=> b!772889 m!718297))

(declare-fun m!718299 () Bool)

(assert (=> b!772892 m!718299))

(declare-fun m!718301 () Bool)

(assert (=> b!772892 m!718301))

(assert (=> b!772886 m!718259))

(assert (=> b!772886 m!718259))

(assert (=> b!772886 m!718297))

(assert (=> b!772886 m!718259))

(declare-fun m!718303 () Bool)

(assert (=> b!772886 m!718303))

(check-sat (not b!772892) (not b!772890) (not b!772887) (not b!772897) (not b!772901) (not start!67036) (not b!772898) (not b!772893) (not b!772895) (not b!772902) (not b!772889) (not b!772884) (not b!772899) (not b!772886) (not b!772888) (not b!772894) (not b!772896))
(check-sat)
(get-model)

(declare-fun d!102083 () Bool)

(assert (=> d!102083 (= (validKeyInArray!0 (select (arr!20299 a!3186) j!159)) (and (not (= (select (arr!20299 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20299 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!772893 d!102083))

(declare-fun b!773031 () Bool)

(declare-fun e!430390 () Bool)

(declare-fun call!35160 () Bool)

(assert (=> b!773031 (= e!430390 call!35160)))

(declare-fun b!773032 () Bool)

(declare-fun e!430389 () Bool)

(assert (=> b!773032 (= e!430389 call!35160)))

(declare-fun b!773033 () Bool)

(assert (=> b!773033 (= e!430389 e!430390)))

(declare-fun lt!344171 () (_ BitVec 64))

(assert (=> b!773033 (= lt!344171 (select (arr!20299 a!3186) j!159))))

(declare-fun lt!344173 () Unit!26611)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42409 (_ BitVec 64) (_ BitVec 32)) Unit!26611)

(assert (=> b!773033 (= lt!344173 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!344171 j!159))))

(assert (=> b!773033 (arrayContainsKey!0 a!3186 lt!344171 #b00000000000000000000000000000000)))

(declare-fun lt!344172 () Unit!26611)

(assert (=> b!773033 (= lt!344172 lt!344173)))

(declare-fun res!522743 () Bool)

(assert (=> b!773033 (= res!522743 (= (seekEntryOrOpen!0 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) (Found!7855 j!159)))))

(assert (=> b!773033 (=> (not res!522743) (not e!430390))))

(declare-fun d!102085 () Bool)

(declare-fun res!522744 () Bool)

(declare-fun e!430388 () Bool)

(assert (=> d!102085 (=> res!522744 e!430388)))

(assert (=> d!102085 (= res!522744 (bvsge j!159 (size!20719 a!3186)))))

(assert (=> d!102085 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!430388)))

(declare-fun b!773034 () Bool)

(assert (=> b!773034 (= e!430388 e!430389)))

(declare-fun c!85544 () Bool)

(assert (=> b!773034 (= c!85544 (validKeyInArray!0 (select (arr!20299 a!3186) j!159)))))

(declare-fun bm!35157 () Bool)

(assert (=> bm!35157 (= call!35160 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!102085 (not res!522744)) b!773034))

(assert (= (and b!773034 c!85544) b!773033))

(assert (= (and b!773034 (not c!85544)) b!773032))

(assert (= (and b!773033 res!522743) b!773031))

(assert (= (or b!773031 b!773032) bm!35157))

(assert (=> b!773033 m!718259))

(declare-fun m!718409 () Bool)

(assert (=> b!773033 m!718409))

(declare-fun m!718411 () Bool)

(assert (=> b!773033 m!718411))

(assert (=> b!773033 m!718259))

(assert (=> b!773033 m!718267))

(assert (=> b!773034 m!718259))

(assert (=> b!773034 m!718259))

(assert (=> b!773034 m!718273))

(declare-fun m!718413 () Bool)

(assert (=> bm!35157 m!718413))

(assert (=> b!772892 d!102085))

(declare-fun d!102087 () Bool)

(assert (=> d!102087 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!344176 () Unit!26611)

(declare-fun choose!38 (array!42409 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26611)

(assert (=> d!102087 (= lt!344176 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102087 (validMask!0 mask!3328)))

(assert (=> d!102087 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!344176)))

(declare-fun bs!21620 () Bool)

(assert (= bs!21620 d!102087))

(assert (=> bs!21620 m!718299))

(declare-fun m!718415 () Bool)

(assert (=> bs!21620 m!718415))

(assert (=> bs!21620 m!718263))

(assert (=> b!772892 d!102087))

(declare-fun b!773047 () Bool)

(declare-fun e!430399 () SeekEntryResult!7855)

(declare-fun e!430398 () SeekEntryResult!7855)

(assert (=> b!773047 (= e!430399 e!430398)))

(declare-fun lt!344183 () (_ BitVec 64))

(declare-fun lt!344185 () SeekEntryResult!7855)

(assert (=> b!773047 (= lt!344183 (select (arr!20299 a!3186) (index!33790 lt!344185)))))

(declare-fun c!85553 () Bool)

(assert (=> b!773047 (= c!85553 (= lt!344183 (select (arr!20299 a!3186) j!159)))))

(declare-fun d!102089 () Bool)

(declare-fun lt!344184 () SeekEntryResult!7855)

(assert (=> d!102089 (and (or ((_ is Undefined!7855) lt!344184) (not ((_ is Found!7855) lt!344184)) (and (bvsge (index!33789 lt!344184) #b00000000000000000000000000000000) (bvslt (index!33789 lt!344184) (size!20719 a!3186)))) (or ((_ is Undefined!7855) lt!344184) ((_ is Found!7855) lt!344184) (not ((_ is MissingZero!7855) lt!344184)) (and (bvsge (index!33788 lt!344184) #b00000000000000000000000000000000) (bvslt (index!33788 lt!344184) (size!20719 a!3186)))) (or ((_ is Undefined!7855) lt!344184) ((_ is Found!7855) lt!344184) ((_ is MissingZero!7855) lt!344184) (not ((_ is MissingVacant!7855) lt!344184)) (and (bvsge (index!33791 lt!344184) #b00000000000000000000000000000000) (bvslt (index!33791 lt!344184) (size!20719 a!3186)))) (or ((_ is Undefined!7855) lt!344184) (ite ((_ is Found!7855) lt!344184) (= (select (arr!20299 a!3186) (index!33789 lt!344184)) (select (arr!20299 a!3186) j!159)) (ite ((_ is MissingZero!7855) lt!344184) (= (select (arr!20299 a!3186) (index!33788 lt!344184)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7855) lt!344184) (= (select (arr!20299 a!3186) (index!33791 lt!344184)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102089 (= lt!344184 e!430399)))

(declare-fun c!85552 () Bool)

(assert (=> d!102089 (= c!85552 (and ((_ is Intermediate!7855) lt!344185) (undefined!8667 lt!344185)))))

(assert (=> d!102089 (= lt!344185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20299 a!3186) j!159) mask!3328) (select (arr!20299 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102089 (validMask!0 mask!3328)))

(assert (=> d!102089 (= (seekEntryOrOpen!0 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) lt!344184)))

(declare-fun b!773048 () Bool)

(assert (=> b!773048 (= e!430399 Undefined!7855)))

(declare-fun b!773049 () Bool)

(declare-fun c!85551 () Bool)

(assert (=> b!773049 (= c!85551 (= lt!344183 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430397 () SeekEntryResult!7855)

(assert (=> b!773049 (= e!430398 e!430397)))

(declare-fun b!773050 () Bool)

(assert (=> b!773050 (= e!430397 (MissingZero!7855 (index!33790 lt!344185)))))

(declare-fun b!773051 () Bool)

(assert (=> b!773051 (= e!430398 (Found!7855 (index!33790 lt!344185)))))

(declare-fun b!773052 () Bool)

(assert (=> b!773052 (= e!430397 (seekKeyOrZeroReturnVacant!0 (x!64881 lt!344185) (index!33790 lt!344185) (index!33790 lt!344185) (select (arr!20299 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!102089 c!85552) b!773048))

(assert (= (and d!102089 (not c!85552)) b!773047))

(assert (= (and b!773047 c!85553) b!773051))

(assert (= (and b!773047 (not c!85553)) b!773049))

(assert (= (and b!773049 c!85551) b!773050))

(assert (= (and b!773049 (not c!85551)) b!773052))

(declare-fun m!718417 () Bool)

(assert (=> b!773047 m!718417))

(declare-fun m!718419 () Bool)

(assert (=> d!102089 m!718419))

(assert (=> d!102089 m!718263))

(assert (=> d!102089 m!718259))

(assert (=> d!102089 m!718289))

(declare-fun m!718421 () Bool)

(assert (=> d!102089 m!718421))

(declare-fun m!718423 () Bool)

(assert (=> d!102089 m!718423))

(assert (=> d!102089 m!718289))

(assert (=> d!102089 m!718259))

(assert (=> d!102089 m!718291))

(assert (=> b!773052 m!718259))

(declare-fun m!718425 () Bool)

(assert (=> b!773052 m!718425))

(assert (=> b!772902 d!102089))

(declare-fun b!773063 () Bool)

(declare-fun e!430409 () Bool)

(declare-fun contains!4071 (List!14208 (_ BitVec 64)) Bool)

(assert (=> b!773063 (= e!430409 (contains!4071 Nil!14205 (select (arr!20299 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!773064 () Bool)

(declare-fun e!430410 () Bool)

(declare-fun call!35163 () Bool)

(assert (=> b!773064 (= e!430410 call!35163)))

(declare-fun b!773065 () Bool)

(declare-fun e!430408 () Bool)

(assert (=> b!773065 (= e!430408 e!430410)))

(declare-fun c!85556 () Bool)

(assert (=> b!773065 (= c!85556 (validKeyInArray!0 (select (arr!20299 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!773066 () Bool)

(assert (=> b!773066 (= e!430410 call!35163)))

(declare-fun bm!35160 () Bool)

(assert (=> bm!35160 (= call!35163 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!85556 (Cons!14204 (select (arr!20299 a!3186) #b00000000000000000000000000000000) Nil!14205) Nil!14205)))))

(declare-fun d!102091 () Bool)

(declare-fun res!522752 () Bool)

(declare-fun e!430411 () Bool)

(assert (=> d!102091 (=> res!522752 e!430411)))

(assert (=> d!102091 (= res!522752 (bvsge #b00000000000000000000000000000000 (size!20719 a!3186)))))

(assert (=> d!102091 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14205) e!430411)))

(declare-fun b!773067 () Bool)

(assert (=> b!773067 (= e!430411 e!430408)))

(declare-fun res!522751 () Bool)

(assert (=> b!773067 (=> (not res!522751) (not e!430408))))

(assert (=> b!773067 (= res!522751 (not e!430409))))

(declare-fun res!522753 () Bool)

(assert (=> b!773067 (=> (not res!522753) (not e!430409))))

(assert (=> b!773067 (= res!522753 (validKeyInArray!0 (select (arr!20299 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!102091 (not res!522752)) b!773067))

(assert (= (and b!773067 res!522753) b!773063))

(assert (= (and b!773067 res!522751) b!773065))

(assert (= (and b!773065 c!85556) b!773064))

(assert (= (and b!773065 (not c!85556)) b!773066))

(assert (= (or b!773064 b!773066) bm!35160))

(declare-fun m!718427 () Bool)

(assert (=> b!773063 m!718427))

(assert (=> b!773063 m!718427))

(declare-fun m!718429 () Bool)

(assert (=> b!773063 m!718429))

(assert (=> b!773065 m!718427))

(assert (=> b!773065 m!718427))

(declare-fun m!718431 () Bool)

(assert (=> b!773065 m!718431))

(assert (=> bm!35160 m!718427))

(declare-fun m!718433 () Bool)

(assert (=> bm!35160 m!718433))

(assert (=> b!773067 m!718427))

(assert (=> b!773067 m!718427))

(assert (=> b!773067 m!718431))

(assert (=> b!772890 d!102091))

(declare-fun b!773068 () Bool)

(declare-fun e!430414 () Bool)

(declare-fun call!35164 () Bool)

(assert (=> b!773068 (= e!430414 call!35164)))

(declare-fun b!773069 () Bool)

(declare-fun e!430413 () Bool)

(assert (=> b!773069 (= e!430413 call!35164)))

(declare-fun b!773070 () Bool)

(assert (=> b!773070 (= e!430413 e!430414)))

(declare-fun lt!344186 () (_ BitVec 64))

(assert (=> b!773070 (= lt!344186 (select (arr!20299 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!344188 () Unit!26611)

(assert (=> b!773070 (= lt!344188 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!344186 #b00000000000000000000000000000000))))

(assert (=> b!773070 (arrayContainsKey!0 a!3186 lt!344186 #b00000000000000000000000000000000)))

(declare-fun lt!344187 () Unit!26611)

(assert (=> b!773070 (= lt!344187 lt!344188)))

(declare-fun res!522754 () Bool)

(assert (=> b!773070 (= res!522754 (= (seekEntryOrOpen!0 (select (arr!20299 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7855 #b00000000000000000000000000000000)))))

(assert (=> b!773070 (=> (not res!522754) (not e!430414))))

(declare-fun d!102095 () Bool)

(declare-fun res!522755 () Bool)

(declare-fun e!430412 () Bool)

(assert (=> d!102095 (=> res!522755 e!430412)))

(assert (=> d!102095 (= res!522755 (bvsge #b00000000000000000000000000000000 (size!20719 a!3186)))))

(assert (=> d!102095 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!430412)))

(declare-fun b!773071 () Bool)

(assert (=> b!773071 (= e!430412 e!430413)))

(declare-fun c!85557 () Bool)

(assert (=> b!773071 (= c!85557 (validKeyInArray!0 (select (arr!20299 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35161 () Bool)

(assert (=> bm!35161 (= call!35164 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!102095 (not res!522755)) b!773071))

(assert (= (and b!773071 c!85557) b!773070))

(assert (= (and b!773071 (not c!85557)) b!773069))

(assert (= (and b!773070 res!522754) b!773068))

(assert (= (or b!773068 b!773069) bm!35161))

(assert (=> b!773070 m!718427))

(declare-fun m!718435 () Bool)

(assert (=> b!773070 m!718435))

(declare-fun m!718437 () Bool)

(assert (=> b!773070 m!718437))

(assert (=> b!773070 m!718427))

(declare-fun m!718439 () Bool)

(assert (=> b!773070 m!718439))

(assert (=> b!773071 m!718427))

(assert (=> b!773071 m!718427))

(assert (=> b!773071 m!718431))

(declare-fun m!718441 () Bool)

(assert (=> bm!35161 m!718441))

(assert (=> b!772901 d!102095))

(declare-fun b!773102 () Bool)

(declare-fun e!430431 () SeekEntryResult!7855)

(assert (=> b!773102 (= e!430431 (MissingVacant!7855 resIntermediateIndex!5))))

(declare-fun b!773103 () Bool)

(declare-fun e!430430 () SeekEntryResult!7855)

(assert (=> b!773103 (= e!430430 Undefined!7855)))

(declare-fun b!773104 () Bool)

(declare-fun e!430432 () SeekEntryResult!7855)

(assert (=> b!773104 (= e!430432 (Found!7855 index!1321))))

(declare-fun b!773105 () Bool)

(declare-fun c!85575 () Bool)

(declare-fun lt!344200 () (_ BitVec 64))

(assert (=> b!773105 (= c!85575 (= lt!344200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!773105 (= e!430432 e!430431)))

(declare-fun b!773106 () Bool)

(assert (=> b!773106 (= e!430431 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20299 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!773107 () Bool)

(assert (=> b!773107 (= e!430430 e!430432)))

(declare-fun c!85573 () Bool)

(assert (=> b!773107 (= c!85573 (= lt!344200 (select (arr!20299 a!3186) j!159)))))

(declare-fun d!102097 () Bool)

(declare-fun lt!344199 () SeekEntryResult!7855)

(assert (=> d!102097 (and (or ((_ is Undefined!7855) lt!344199) (not ((_ is Found!7855) lt!344199)) (and (bvsge (index!33789 lt!344199) #b00000000000000000000000000000000) (bvslt (index!33789 lt!344199) (size!20719 a!3186)))) (or ((_ is Undefined!7855) lt!344199) ((_ is Found!7855) lt!344199) (not ((_ is MissingVacant!7855) lt!344199)) (not (= (index!33791 lt!344199) resIntermediateIndex!5)) (and (bvsge (index!33791 lt!344199) #b00000000000000000000000000000000) (bvslt (index!33791 lt!344199) (size!20719 a!3186)))) (or ((_ is Undefined!7855) lt!344199) (ite ((_ is Found!7855) lt!344199) (= (select (arr!20299 a!3186) (index!33789 lt!344199)) (select (arr!20299 a!3186) j!159)) (and ((_ is MissingVacant!7855) lt!344199) (= (index!33791 lt!344199) resIntermediateIndex!5) (= (select (arr!20299 a!3186) (index!33791 lt!344199)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102097 (= lt!344199 e!430430)))

(declare-fun c!85574 () Bool)

(assert (=> d!102097 (= c!85574 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102097 (= lt!344200 (select (arr!20299 a!3186) index!1321))))

(assert (=> d!102097 (validMask!0 mask!3328)))

(assert (=> d!102097 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) lt!344199)))

(assert (= (and d!102097 c!85574) b!773103))

(assert (= (and d!102097 (not c!85574)) b!773107))

(assert (= (and b!773107 c!85573) b!773104))

(assert (= (and b!773107 (not c!85573)) b!773105))

(assert (= (and b!773105 c!85575) b!773102))

(assert (= (and b!773105 (not c!85575)) b!773106))

(declare-fun m!718453 () Bool)

(assert (=> b!773106 m!718453))

(assert (=> b!773106 m!718453))

(assert (=> b!773106 m!718259))

(declare-fun m!718455 () Bool)

(assert (=> b!773106 m!718455))

(declare-fun m!718457 () Bool)

(assert (=> d!102097 m!718457))

(declare-fun m!718459 () Bool)

(assert (=> d!102097 m!718459))

(declare-fun m!718461 () Bool)

(assert (=> d!102097 m!718461))

(assert (=> d!102097 m!718263))

(assert (=> b!772889 d!102097))

(declare-fun d!102101 () Bool)

(assert (=> d!102101 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!772888 d!102101))

(declare-fun d!102103 () Bool)

(declare-fun e!430459 () Bool)

(assert (=> d!102103 e!430459))

(declare-fun c!85591 () Bool)

(declare-fun lt!344212 () SeekEntryResult!7855)

(assert (=> d!102103 (= c!85591 (and ((_ is Intermediate!7855) lt!344212) (undefined!8667 lt!344212)))))

(declare-fun e!430462 () SeekEntryResult!7855)

(assert (=> d!102103 (= lt!344212 e!430462)))

(declare-fun c!85593 () Bool)

(assert (=> d!102103 (= c!85593 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!344211 () (_ BitVec 64))

(assert (=> d!102103 (= lt!344211 (select (arr!20299 lt!344088) index!1321))))

(assert (=> d!102103 (validMask!0 mask!3328)))

(assert (=> d!102103 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344097 lt!344088 mask!3328) lt!344212)))

(declare-fun b!773153 () Bool)

(assert (=> b!773153 (and (bvsge (index!33790 lt!344212) #b00000000000000000000000000000000) (bvslt (index!33790 lt!344212) (size!20719 lt!344088)))))

(declare-fun e!430458 () Bool)

(assert (=> b!773153 (= e!430458 (= (select (arr!20299 lt!344088) (index!33790 lt!344212)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!773154 () Bool)

(declare-fun e!430460 () SeekEntryResult!7855)

(assert (=> b!773154 (= e!430460 (Intermediate!7855 false index!1321 x!1131))))

(declare-fun b!773155 () Bool)

(assert (=> b!773155 (and (bvsge (index!33790 lt!344212) #b00000000000000000000000000000000) (bvslt (index!33790 lt!344212) (size!20719 lt!344088)))))

(declare-fun res!522772 () Bool)

(assert (=> b!773155 (= res!522772 (= (select (arr!20299 lt!344088) (index!33790 lt!344212)) lt!344097))))

(assert (=> b!773155 (=> res!522772 e!430458)))

(declare-fun e!430461 () Bool)

(assert (=> b!773155 (= e!430461 e!430458)))

(declare-fun b!773156 () Bool)

(assert (=> b!773156 (= e!430462 e!430460)))

(declare-fun c!85592 () Bool)

(assert (=> b!773156 (= c!85592 (or (= lt!344211 lt!344097) (= (bvadd lt!344211 lt!344211) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773157 () Bool)

(assert (=> b!773157 (= e!430462 (Intermediate!7855 true index!1321 x!1131))))

(declare-fun b!773158 () Bool)

(assert (=> b!773158 (and (bvsge (index!33790 lt!344212) #b00000000000000000000000000000000) (bvslt (index!33790 lt!344212) (size!20719 lt!344088)))))

(declare-fun res!522773 () Bool)

(assert (=> b!773158 (= res!522773 (= (select (arr!20299 lt!344088) (index!33790 lt!344212)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!773158 (=> res!522773 e!430458)))

(declare-fun b!773159 () Bool)

(assert (=> b!773159 (= e!430459 e!430461)))

(declare-fun res!522771 () Bool)

(assert (=> b!773159 (= res!522771 (and ((_ is Intermediate!7855) lt!344212) (not (undefined!8667 lt!344212)) (bvslt (x!64881 lt!344212) #b01111111111111111111111111111110) (bvsge (x!64881 lt!344212) #b00000000000000000000000000000000) (bvsge (x!64881 lt!344212) x!1131)))))

(assert (=> b!773159 (=> (not res!522771) (not e!430461))))

(declare-fun b!773160 () Bool)

(assert (=> b!773160 (= e!430460 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) lt!344097 lt!344088 mask!3328))))

(declare-fun b!773161 () Bool)

(assert (=> b!773161 (= e!430459 (bvsge (x!64881 lt!344212) #b01111111111111111111111111111110))))

(assert (= (and d!102103 c!85593) b!773157))

(assert (= (and d!102103 (not c!85593)) b!773156))

(assert (= (and b!773156 c!85592) b!773154))

(assert (= (and b!773156 (not c!85592)) b!773160))

(assert (= (and d!102103 c!85591) b!773161))

(assert (= (and d!102103 (not c!85591)) b!773159))

(assert (= (and b!773159 res!522771) b!773155))

(assert (= (and b!773155 (not res!522772)) b!773158))

(assert (= (and b!773158 (not res!522773)) b!773153))

(assert (=> b!773160 m!718453))

(assert (=> b!773160 m!718453))

(declare-fun m!718469 () Bool)

(assert (=> b!773160 m!718469))

(declare-fun m!718471 () Bool)

(assert (=> d!102103 m!718471))

(assert (=> d!102103 m!718263))

(declare-fun m!718473 () Bool)

(assert (=> b!773153 m!718473))

(assert (=> b!773155 m!718473))

(assert (=> b!773158 m!718473))

(assert (=> b!772899 d!102103))

(declare-fun d!102107 () Bool)

(declare-fun e!430469 () Bool)

(assert (=> d!102107 e!430469))

(declare-fun c!85597 () Bool)

(declare-fun lt!344216 () SeekEntryResult!7855)

(assert (=> d!102107 (= c!85597 (and ((_ is Intermediate!7855) lt!344216) (undefined!8667 lt!344216)))))

(declare-fun e!430472 () SeekEntryResult!7855)

(assert (=> d!102107 (= lt!344216 e!430472)))

(declare-fun c!85599 () Bool)

(assert (=> d!102107 (= c!85599 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!344215 () (_ BitVec 64))

(assert (=> d!102107 (= lt!344215 (select (arr!20299 lt!344088) (toIndex!0 lt!344097 mask!3328)))))

(assert (=> d!102107 (validMask!0 mask!3328)))

(assert (=> d!102107 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344097 mask!3328) lt!344097 lt!344088 mask!3328) lt!344216)))

(declare-fun b!773171 () Bool)

(assert (=> b!773171 (and (bvsge (index!33790 lt!344216) #b00000000000000000000000000000000) (bvslt (index!33790 lt!344216) (size!20719 lt!344088)))))

(declare-fun e!430468 () Bool)

(assert (=> b!773171 (= e!430468 (= (select (arr!20299 lt!344088) (index!33790 lt!344216)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!773172 () Bool)

(declare-fun e!430470 () SeekEntryResult!7855)

(assert (=> b!773172 (= e!430470 (Intermediate!7855 false (toIndex!0 lt!344097 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!773173 () Bool)

(assert (=> b!773173 (and (bvsge (index!33790 lt!344216) #b00000000000000000000000000000000) (bvslt (index!33790 lt!344216) (size!20719 lt!344088)))))

(declare-fun res!522778 () Bool)

(assert (=> b!773173 (= res!522778 (= (select (arr!20299 lt!344088) (index!33790 lt!344216)) lt!344097))))

(assert (=> b!773173 (=> res!522778 e!430468)))

(declare-fun e!430471 () Bool)

(assert (=> b!773173 (= e!430471 e!430468)))

(declare-fun b!773174 () Bool)

(assert (=> b!773174 (= e!430472 e!430470)))

(declare-fun c!85598 () Bool)

(assert (=> b!773174 (= c!85598 (or (= lt!344215 lt!344097) (= (bvadd lt!344215 lt!344215) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773175 () Bool)

(assert (=> b!773175 (= e!430472 (Intermediate!7855 true (toIndex!0 lt!344097 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!773176 () Bool)

(assert (=> b!773176 (and (bvsge (index!33790 lt!344216) #b00000000000000000000000000000000) (bvslt (index!33790 lt!344216) (size!20719 lt!344088)))))

(declare-fun res!522779 () Bool)

(assert (=> b!773176 (= res!522779 (= (select (arr!20299 lt!344088) (index!33790 lt!344216)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!773176 (=> res!522779 e!430468)))

(declare-fun b!773177 () Bool)

(assert (=> b!773177 (= e!430469 e!430471)))

(declare-fun res!522777 () Bool)

(assert (=> b!773177 (= res!522777 (and ((_ is Intermediate!7855) lt!344216) (not (undefined!8667 lt!344216)) (bvslt (x!64881 lt!344216) #b01111111111111111111111111111110) (bvsge (x!64881 lt!344216) #b00000000000000000000000000000000) (bvsge (x!64881 lt!344216) #b00000000000000000000000000000000)))))

(assert (=> b!773177 (=> (not res!522777) (not e!430471))))

(declare-fun b!773178 () Bool)

(assert (=> b!773178 (= e!430470 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!344097 mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) lt!344097 lt!344088 mask!3328))))

(declare-fun b!773179 () Bool)

(assert (=> b!773179 (= e!430469 (bvsge (x!64881 lt!344216) #b01111111111111111111111111111110))))

(assert (= (and d!102107 c!85599) b!773175))

(assert (= (and d!102107 (not c!85599)) b!773174))

(assert (= (and b!773174 c!85598) b!773172))

(assert (= (and b!773174 (not c!85598)) b!773178))

(assert (= (and d!102107 c!85597) b!773179))

(assert (= (and d!102107 (not c!85597)) b!773177))

(assert (= (and b!773177 res!522777) b!773173))

(assert (= (and b!773173 (not res!522778)) b!773176))

(assert (= (and b!773176 (not res!522779)) b!773171))

(assert (=> b!773178 m!718281))

(declare-fun m!718479 () Bool)

(assert (=> b!773178 m!718479))

(assert (=> b!773178 m!718479))

(declare-fun m!718485 () Bool)

(assert (=> b!773178 m!718485))

(assert (=> d!102107 m!718281))

(declare-fun m!718487 () Bool)

(assert (=> d!102107 m!718487))

(assert (=> d!102107 m!718263))

(declare-fun m!718489 () Bool)

(assert (=> b!773171 m!718489))

(assert (=> b!773173 m!718489))

(assert (=> b!773176 m!718489))

(assert (=> b!772899 d!102107))

(declare-fun d!102111 () Bool)

(declare-fun lt!344226 () (_ BitVec 32))

(declare-fun lt!344225 () (_ BitVec 32))

(assert (=> d!102111 (= lt!344226 (bvmul (bvxor lt!344225 (bvlshr lt!344225 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102111 (= lt!344225 ((_ extract 31 0) (bvand (bvxor lt!344097 (bvlshr lt!344097 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102111 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!522781 (let ((h!15316 ((_ extract 31 0) (bvand (bvxor lt!344097 (bvlshr lt!344097 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64889 (bvmul (bvxor h!15316 (bvlshr h!15316 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64889 (bvlshr x!64889 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!522781 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!522781 #b00000000000000000000000000000000))))))

(assert (=> d!102111 (= (toIndex!0 lt!344097 mask!3328) (bvand (bvxor lt!344226 (bvlshr lt!344226 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!772899 d!102111))

(declare-fun d!102113 () Bool)

(declare-fun e!430474 () Bool)

(assert (=> d!102113 e!430474))

(declare-fun c!85600 () Bool)

(declare-fun lt!344230 () SeekEntryResult!7855)

(assert (=> d!102113 (= c!85600 (and ((_ is Intermediate!7855) lt!344230) (undefined!8667 lt!344230)))))

(declare-fun e!430477 () SeekEntryResult!7855)

(assert (=> d!102113 (= lt!344230 e!430477)))

(declare-fun c!85602 () Bool)

(assert (=> d!102113 (= c!85602 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!344229 () (_ BitVec 64))

(assert (=> d!102113 (= lt!344229 (select (arr!20299 a!3186) lt!344095))))

(assert (=> d!102113 (validMask!0 mask!3328)))

(assert (=> d!102113 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344095 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) lt!344230)))

(declare-fun b!773180 () Bool)

(assert (=> b!773180 (and (bvsge (index!33790 lt!344230) #b00000000000000000000000000000000) (bvslt (index!33790 lt!344230) (size!20719 a!3186)))))

(declare-fun e!430473 () Bool)

(assert (=> b!773180 (= e!430473 (= (select (arr!20299 a!3186) (index!33790 lt!344230)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!773181 () Bool)

(declare-fun e!430475 () SeekEntryResult!7855)

(assert (=> b!773181 (= e!430475 (Intermediate!7855 false lt!344095 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!773182 () Bool)

(assert (=> b!773182 (and (bvsge (index!33790 lt!344230) #b00000000000000000000000000000000) (bvslt (index!33790 lt!344230) (size!20719 a!3186)))))

(declare-fun res!522783 () Bool)

(assert (=> b!773182 (= res!522783 (= (select (arr!20299 a!3186) (index!33790 lt!344230)) (select (arr!20299 a!3186) j!159)))))

(assert (=> b!773182 (=> res!522783 e!430473)))

(declare-fun e!430476 () Bool)

(assert (=> b!773182 (= e!430476 e!430473)))

(declare-fun b!773183 () Bool)

(assert (=> b!773183 (= e!430477 e!430475)))

(declare-fun c!85601 () Bool)

(assert (=> b!773183 (= c!85601 (or (= lt!344229 (select (arr!20299 a!3186) j!159)) (= (bvadd lt!344229 lt!344229) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773184 () Bool)

(assert (=> b!773184 (= e!430477 (Intermediate!7855 true lt!344095 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!773185 () Bool)

(assert (=> b!773185 (and (bvsge (index!33790 lt!344230) #b00000000000000000000000000000000) (bvslt (index!33790 lt!344230) (size!20719 a!3186)))))

(declare-fun res!522784 () Bool)

(assert (=> b!773185 (= res!522784 (= (select (arr!20299 a!3186) (index!33790 lt!344230)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!773185 (=> res!522784 e!430473)))

(declare-fun b!773186 () Bool)

(assert (=> b!773186 (= e!430474 e!430476)))

(declare-fun res!522782 () Bool)

(assert (=> b!773186 (= res!522782 (and ((_ is Intermediate!7855) lt!344230) (not (undefined!8667 lt!344230)) (bvslt (x!64881 lt!344230) #b01111111111111111111111111111110) (bvsge (x!64881 lt!344230) #b00000000000000000000000000000000) (bvsge (x!64881 lt!344230) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!773186 (=> (not res!522782) (not e!430476))))

(declare-fun b!773187 () Bool)

(assert (=> b!773187 (= e!430475 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!344095 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20299 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!773188 () Bool)

(assert (=> b!773188 (= e!430474 (bvsge (x!64881 lt!344230) #b01111111111111111111111111111110))))

(assert (= (and d!102113 c!85602) b!773184))

(assert (= (and d!102113 (not c!85602)) b!773183))

(assert (= (and b!773183 c!85601) b!773181))

(assert (= (and b!773183 (not c!85601)) b!773187))

(assert (= (and d!102113 c!85600) b!773188))

(assert (= (and d!102113 (not c!85600)) b!773186))

(assert (= (and b!773186 res!522782) b!773182))

(assert (= (and b!773182 (not res!522783)) b!773185))

(assert (= (and b!773185 (not res!522784)) b!773180))

(declare-fun m!718491 () Bool)

(assert (=> b!773187 m!718491))

(assert (=> b!773187 m!718491))

(assert (=> b!773187 m!718259))

(declare-fun m!718493 () Bool)

(assert (=> b!773187 m!718493))

(declare-fun m!718495 () Bool)

(assert (=> d!102113 m!718495))

(assert (=> d!102113 m!718263))

(declare-fun m!718497 () Bool)

(assert (=> b!773180 m!718497))

(assert (=> b!773182 m!718497))

(assert (=> b!773185 m!718497))

(assert (=> b!772898 d!102113))

(declare-fun d!102117 () Bool)

(declare-fun e!430479 () Bool)

(assert (=> d!102117 e!430479))

(declare-fun c!85603 () Bool)

(declare-fun lt!344232 () SeekEntryResult!7855)

(assert (=> d!102117 (= c!85603 (and ((_ is Intermediate!7855) lt!344232) (undefined!8667 lt!344232)))))

(declare-fun e!430482 () SeekEntryResult!7855)

(assert (=> d!102117 (= lt!344232 e!430482)))

(declare-fun c!85605 () Bool)

(assert (=> d!102117 (= c!85605 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!344231 () (_ BitVec 64))

(assert (=> d!102117 (= lt!344231 (select (arr!20299 a!3186) (toIndex!0 (select (arr!20299 a!3186) j!159) mask!3328)))))

(assert (=> d!102117 (validMask!0 mask!3328)))

(assert (=> d!102117 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20299 a!3186) j!159) mask!3328) (select (arr!20299 a!3186) j!159) a!3186 mask!3328) lt!344232)))

(declare-fun b!773189 () Bool)

(assert (=> b!773189 (and (bvsge (index!33790 lt!344232) #b00000000000000000000000000000000) (bvslt (index!33790 lt!344232) (size!20719 a!3186)))))

(declare-fun e!430478 () Bool)

(assert (=> b!773189 (= e!430478 (= (select (arr!20299 a!3186) (index!33790 lt!344232)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430480 () SeekEntryResult!7855)

(declare-fun b!773190 () Bool)

(assert (=> b!773190 (= e!430480 (Intermediate!7855 false (toIndex!0 (select (arr!20299 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!773191 () Bool)

(assert (=> b!773191 (and (bvsge (index!33790 lt!344232) #b00000000000000000000000000000000) (bvslt (index!33790 lt!344232) (size!20719 a!3186)))))

(declare-fun res!522786 () Bool)

(assert (=> b!773191 (= res!522786 (= (select (arr!20299 a!3186) (index!33790 lt!344232)) (select (arr!20299 a!3186) j!159)))))

(assert (=> b!773191 (=> res!522786 e!430478)))

(declare-fun e!430481 () Bool)

(assert (=> b!773191 (= e!430481 e!430478)))

(declare-fun b!773192 () Bool)

(assert (=> b!773192 (= e!430482 e!430480)))

(declare-fun c!85604 () Bool)

(assert (=> b!773192 (= c!85604 (or (= lt!344231 (select (arr!20299 a!3186) j!159)) (= (bvadd lt!344231 lt!344231) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773193 () Bool)

(assert (=> b!773193 (= e!430482 (Intermediate!7855 true (toIndex!0 (select (arr!20299 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!773194 () Bool)

(assert (=> b!773194 (and (bvsge (index!33790 lt!344232) #b00000000000000000000000000000000) (bvslt (index!33790 lt!344232) (size!20719 a!3186)))))

(declare-fun res!522787 () Bool)

(assert (=> b!773194 (= res!522787 (= (select (arr!20299 a!3186) (index!33790 lt!344232)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!773194 (=> res!522787 e!430478)))

(declare-fun b!773195 () Bool)

(assert (=> b!773195 (= e!430479 e!430481)))

(declare-fun res!522785 () Bool)

(assert (=> b!773195 (= res!522785 (and ((_ is Intermediate!7855) lt!344232) (not (undefined!8667 lt!344232)) (bvslt (x!64881 lt!344232) #b01111111111111111111111111111110) (bvsge (x!64881 lt!344232) #b00000000000000000000000000000000) (bvsge (x!64881 lt!344232) #b00000000000000000000000000000000)))))

(assert (=> b!773195 (=> (not res!522785) (not e!430481))))

(declare-fun b!773196 () Bool)

(assert (=> b!773196 (= e!430480 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20299 a!3186) j!159) mask!3328) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3328) (select (arr!20299 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!773197 () Bool)

(assert (=> b!773197 (= e!430479 (bvsge (x!64881 lt!344232) #b01111111111111111111111111111110))))

(assert (= (and d!102117 c!85605) b!773193))

(assert (= (and d!102117 (not c!85605)) b!773192))

(assert (= (and b!773192 c!85604) b!773190))

(assert (= (and b!773192 (not c!85604)) b!773196))

(assert (= (and d!102117 c!85603) b!773197))

(assert (= (and d!102117 (not c!85603)) b!773195))

(assert (= (and b!773195 res!522785) b!773191))

(assert (= (and b!773191 (not res!522786)) b!773194))

(assert (= (and b!773194 (not res!522787)) b!773189))

(assert (=> b!773196 m!718289))

(declare-fun m!718499 () Bool)

(assert (=> b!773196 m!718499))

(assert (=> b!773196 m!718499))

(assert (=> b!773196 m!718259))

(declare-fun m!718501 () Bool)

(assert (=> b!773196 m!718501))

(assert (=> d!102117 m!718289))

(declare-fun m!718503 () Bool)

(assert (=> d!102117 m!718503))

(assert (=> d!102117 m!718263))

(declare-fun m!718505 () Bool)

(assert (=> b!773189 m!718505))

(assert (=> b!773191 m!718505))

(assert (=> b!773194 m!718505))

(assert (=> b!772887 d!102117))

(declare-fun d!102119 () Bool)

(declare-fun lt!344234 () (_ BitVec 32))

(declare-fun lt!344233 () (_ BitVec 32))

(assert (=> d!102119 (= lt!344234 (bvmul (bvxor lt!344233 (bvlshr lt!344233 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102119 (= lt!344233 ((_ extract 31 0) (bvand (bvxor (select (arr!20299 a!3186) j!159) (bvlshr (select (arr!20299 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102119 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!522781 (let ((h!15316 ((_ extract 31 0) (bvand (bvxor (select (arr!20299 a!3186) j!159) (bvlshr (select (arr!20299 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64889 (bvmul (bvxor h!15316 (bvlshr h!15316 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64889 (bvlshr x!64889 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!522781 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!522781 #b00000000000000000000000000000000))))))

(assert (=> d!102119 (= (toIndex!0 (select (arr!20299 a!3186) j!159) mask!3328) (bvand (bvxor lt!344234 (bvlshr lt!344234 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!772887 d!102119))

(assert (=> b!772886 d!102097))

(declare-fun b!773198 () Bool)

(declare-fun e!430484 () SeekEntryResult!7855)

(assert (=> b!773198 (= e!430484 (MissingVacant!7855 resIntermediateIndex!5))))

(declare-fun b!773199 () Bool)

(declare-fun e!430483 () SeekEntryResult!7855)

(assert (=> b!773199 (= e!430483 Undefined!7855)))

(declare-fun b!773200 () Bool)

(declare-fun e!430485 () SeekEntryResult!7855)

(assert (=> b!773200 (= e!430485 (Found!7855 lt!344095))))

(declare-fun b!773201 () Bool)

(declare-fun c!85608 () Bool)

(declare-fun lt!344236 () (_ BitVec 64))

(assert (=> b!773201 (= c!85608 (= lt!344236 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!773201 (= e!430485 e!430484)))

(declare-fun b!773202 () Bool)

(assert (=> b!773202 (= e!430484 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!344095 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20299 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!773203 () Bool)

(assert (=> b!773203 (= e!430483 e!430485)))

(declare-fun c!85606 () Bool)

(assert (=> b!773203 (= c!85606 (= lt!344236 (select (arr!20299 a!3186) j!159)))))

(declare-fun d!102121 () Bool)

(declare-fun lt!344235 () SeekEntryResult!7855)

(assert (=> d!102121 (and (or ((_ is Undefined!7855) lt!344235) (not ((_ is Found!7855) lt!344235)) (and (bvsge (index!33789 lt!344235) #b00000000000000000000000000000000) (bvslt (index!33789 lt!344235) (size!20719 a!3186)))) (or ((_ is Undefined!7855) lt!344235) ((_ is Found!7855) lt!344235) (not ((_ is MissingVacant!7855) lt!344235)) (not (= (index!33791 lt!344235) resIntermediateIndex!5)) (and (bvsge (index!33791 lt!344235) #b00000000000000000000000000000000) (bvslt (index!33791 lt!344235) (size!20719 a!3186)))) (or ((_ is Undefined!7855) lt!344235) (ite ((_ is Found!7855) lt!344235) (= (select (arr!20299 a!3186) (index!33789 lt!344235)) (select (arr!20299 a!3186) j!159)) (and ((_ is MissingVacant!7855) lt!344235) (= (index!33791 lt!344235) resIntermediateIndex!5) (= (select (arr!20299 a!3186) (index!33791 lt!344235)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102121 (= lt!344235 e!430483)))

(declare-fun c!85607 () Bool)

(assert (=> d!102121 (= c!85607 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!102121 (= lt!344236 (select (arr!20299 a!3186) lt!344095))))

(assert (=> d!102121 (validMask!0 mask!3328)))

(assert (=> d!102121 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344095 resIntermediateIndex!5 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) lt!344235)))

(assert (= (and d!102121 c!85607) b!773199))

(assert (= (and d!102121 (not c!85607)) b!773203))

(assert (= (and b!773203 c!85606) b!773200))

(assert (= (and b!773203 (not c!85606)) b!773201))

(assert (= (and b!773201 c!85608) b!773198))

(assert (= (and b!773201 (not c!85608)) b!773202))

(assert (=> b!773202 m!718491))

(assert (=> b!773202 m!718491))

(assert (=> b!773202 m!718259))

(declare-fun m!718507 () Bool)

(assert (=> b!773202 m!718507))

(declare-fun m!718509 () Bool)

(assert (=> d!102121 m!718509))

(declare-fun m!718511 () Bool)

(assert (=> d!102121 m!718511))

(assert (=> d!102121 m!718495))

(assert (=> d!102121 m!718263))

(assert (=> b!772886 d!102121))

(declare-fun b!773204 () Bool)

(declare-fun e!430487 () SeekEntryResult!7855)

(assert (=> b!773204 (= e!430487 (MissingVacant!7855 resIntermediateIndex!5))))

(declare-fun b!773205 () Bool)

(declare-fun e!430486 () SeekEntryResult!7855)

(assert (=> b!773205 (= e!430486 Undefined!7855)))

(declare-fun b!773206 () Bool)

(declare-fun e!430488 () SeekEntryResult!7855)

(assert (=> b!773206 (= e!430488 (Found!7855 resIntermediateIndex!5))))

(declare-fun b!773207 () Bool)

(declare-fun c!85611 () Bool)

(declare-fun lt!344238 () (_ BitVec 64))

(assert (=> b!773207 (= c!85611 (= lt!344238 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!773207 (= e!430488 e!430487)))

(declare-fun b!773208 () Bool)

(assert (=> b!773208 (= e!430487 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) mask!3328) resIntermediateIndex!5 (select (arr!20299 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!773209 () Bool)

(assert (=> b!773209 (= e!430486 e!430488)))

(declare-fun c!85609 () Bool)

(assert (=> b!773209 (= c!85609 (= lt!344238 (select (arr!20299 a!3186) j!159)))))

(declare-fun d!102123 () Bool)

(declare-fun lt!344237 () SeekEntryResult!7855)

(assert (=> d!102123 (and (or ((_ is Undefined!7855) lt!344237) (not ((_ is Found!7855) lt!344237)) (and (bvsge (index!33789 lt!344237) #b00000000000000000000000000000000) (bvslt (index!33789 lt!344237) (size!20719 a!3186)))) (or ((_ is Undefined!7855) lt!344237) ((_ is Found!7855) lt!344237) (not ((_ is MissingVacant!7855) lt!344237)) (not (= (index!33791 lt!344237) resIntermediateIndex!5)) (and (bvsge (index!33791 lt!344237) #b00000000000000000000000000000000) (bvslt (index!33791 lt!344237) (size!20719 a!3186)))) (or ((_ is Undefined!7855) lt!344237) (ite ((_ is Found!7855) lt!344237) (= (select (arr!20299 a!3186) (index!33789 lt!344237)) (select (arr!20299 a!3186) j!159)) (and ((_ is MissingVacant!7855) lt!344237) (= (index!33791 lt!344237) resIntermediateIndex!5) (= (select (arr!20299 a!3186) (index!33791 lt!344237)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102123 (= lt!344237 e!430486)))

(declare-fun c!85610 () Bool)

(assert (=> d!102123 (= c!85610 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102123 (= lt!344238 (select (arr!20299 a!3186) resIntermediateIndex!5))))

(assert (=> d!102123 (validMask!0 mask!3328)))

(assert (=> d!102123 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) lt!344237)))

(assert (= (and d!102123 c!85610) b!773205))

(assert (= (and d!102123 (not c!85610)) b!773209))

(assert (= (and b!773209 c!85609) b!773206))

(assert (= (and b!773209 (not c!85609)) b!773207))

(assert (= (and b!773207 c!85611) b!773204))

(assert (= (and b!773207 (not c!85611)) b!773208))

(declare-fun m!718513 () Bool)

(assert (=> b!773208 m!718513))

(assert (=> b!773208 m!718513))

(assert (=> b!773208 m!718259))

(declare-fun m!718515 () Bool)

(assert (=> b!773208 m!718515))

(declare-fun m!718517 () Bool)

(assert (=> d!102123 m!718517))

(declare-fun m!718519 () Bool)

(assert (=> d!102123 m!718519))

(assert (=> d!102123 m!718277))

(assert (=> d!102123 m!718263))

(assert (=> b!772897 d!102123))

(declare-fun d!102125 () Bool)

(declare-fun lt!344247 () (_ BitVec 32))

(assert (=> d!102125 (and (bvsge lt!344247 #b00000000000000000000000000000000) (bvslt lt!344247 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!102125 (= lt!344247 (choose!52 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(assert (=> d!102125 (validMask!0 mask!3328)))

(assert (=> d!102125 (= (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) lt!344247)))

(declare-fun bs!21621 () Bool)

(assert (= bs!21621 d!102125))

(declare-fun m!718521 () Bool)

(assert (=> bs!21621 m!718521))

(assert (=> bs!21621 m!718263))

(assert (=> b!772896 d!102125))

(declare-fun d!102127 () Bool)

(declare-fun e!430496 () Bool)

(assert (=> d!102127 e!430496))

(declare-fun c!85614 () Bool)

(declare-fun lt!344249 () SeekEntryResult!7855)

(assert (=> d!102127 (= c!85614 (and ((_ is Intermediate!7855) lt!344249) (undefined!8667 lt!344249)))))

(declare-fun e!430499 () SeekEntryResult!7855)

(assert (=> d!102127 (= lt!344249 e!430499)))

(declare-fun c!85616 () Bool)

(assert (=> d!102127 (= c!85616 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!344248 () (_ BitVec 64))

(assert (=> d!102127 (= lt!344248 (select (arr!20299 a!3186) index!1321))))

(assert (=> d!102127 (validMask!0 mask!3328)))

(assert (=> d!102127 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20299 a!3186) j!159) a!3186 mask!3328) lt!344249)))

(declare-fun b!773218 () Bool)

(assert (=> b!773218 (and (bvsge (index!33790 lt!344249) #b00000000000000000000000000000000) (bvslt (index!33790 lt!344249) (size!20719 a!3186)))))

(declare-fun e!430495 () Bool)

(assert (=> b!773218 (= e!430495 (= (select (arr!20299 a!3186) (index!33790 lt!344249)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!773219 () Bool)

(declare-fun e!430497 () SeekEntryResult!7855)

(assert (=> b!773219 (= e!430497 (Intermediate!7855 false index!1321 x!1131))))

(declare-fun b!773220 () Bool)

(assert (=> b!773220 (and (bvsge (index!33790 lt!344249) #b00000000000000000000000000000000) (bvslt (index!33790 lt!344249) (size!20719 a!3186)))))

(declare-fun res!522793 () Bool)

(assert (=> b!773220 (= res!522793 (= (select (arr!20299 a!3186) (index!33790 lt!344249)) (select (arr!20299 a!3186) j!159)))))

(assert (=> b!773220 (=> res!522793 e!430495)))

(declare-fun e!430498 () Bool)

(assert (=> b!773220 (= e!430498 e!430495)))

(declare-fun b!773221 () Bool)

(assert (=> b!773221 (= e!430499 e!430497)))

(declare-fun c!85615 () Bool)

(assert (=> b!773221 (= c!85615 (or (= lt!344248 (select (arr!20299 a!3186) j!159)) (= (bvadd lt!344248 lt!344248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773222 () Bool)

(assert (=> b!773222 (= e!430499 (Intermediate!7855 true index!1321 x!1131))))

(declare-fun b!773223 () Bool)

(assert (=> b!773223 (and (bvsge (index!33790 lt!344249) #b00000000000000000000000000000000) (bvslt (index!33790 lt!344249) (size!20719 a!3186)))))

(declare-fun res!522794 () Bool)

(assert (=> b!773223 (= res!522794 (= (select (arr!20299 a!3186) (index!33790 lt!344249)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!773223 (=> res!522794 e!430495)))

(declare-fun b!773224 () Bool)

(assert (=> b!773224 (= e!430496 e!430498)))

(declare-fun res!522792 () Bool)

(assert (=> b!773224 (= res!522792 (and ((_ is Intermediate!7855) lt!344249) (not (undefined!8667 lt!344249)) (bvslt (x!64881 lt!344249) #b01111111111111111111111111111110) (bvsge (x!64881 lt!344249) #b00000000000000000000000000000000) (bvsge (x!64881 lt!344249) x!1131)))))

(assert (=> b!773224 (=> (not res!522792) (not e!430498))))

(declare-fun b!773225 () Bool)

(assert (=> b!773225 (= e!430497 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 (bvadd x!1131 #b00000000000000000000000000000001) mask!3328) (select (arr!20299 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!773226 () Bool)

(assert (=> b!773226 (= e!430496 (bvsge (x!64881 lt!344249) #b01111111111111111111111111111110))))

(assert (= (and d!102127 c!85616) b!773222))

(assert (= (and d!102127 (not c!85616)) b!773221))

(assert (= (and b!773221 c!85615) b!773219))

(assert (= (and b!773221 (not c!85615)) b!773225))

(assert (= (and d!102127 c!85614) b!773226))

(assert (= (and d!102127 (not c!85614)) b!773224))

(assert (= (and b!773224 res!522792) b!773220))

(assert (= (and b!773220 (not res!522793)) b!773223))

(assert (= (and b!773223 (not res!522794)) b!773218))

(assert (=> b!773225 m!718453))

(assert (=> b!773225 m!718453))

(assert (=> b!773225 m!718259))

(declare-fun m!718523 () Bool)

(assert (=> b!773225 m!718523))

(assert (=> d!102127 m!718461))

(assert (=> d!102127 m!718263))

(declare-fun m!718525 () Bool)

(assert (=> b!773218 m!718525))

(assert (=> b!773220 m!718525))

(assert (=> b!773223 m!718525))

(assert (=> b!772884 d!102127))

(declare-fun d!102129 () Bool)

(assert (=> d!102129 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67036 d!102129))

(declare-fun d!102143 () Bool)

(assert (=> d!102143 (= (array_inv!16158 a!3186) (bvsge (size!20719 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67036 d!102143))

(declare-fun b!773250 () Bool)

(declare-fun e!430516 () SeekEntryResult!7855)

(declare-fun e!430515 () SeekEntryResult!7855)

(assert (=> b!773250 (= e!430516 e!430515)))

(declare-fun lt!344265 () (_ BitVec 64))

(declare-fun lt!344267 () SeekEntryResult!7855)

(assert (=> b!773250 (= lt!344265 (select (arr!20299 a!3186) (index!33790 lt!344267)))))

(declare-fun c!85627 () Bool)

(assert (=> b!773250 (= c!85627 (= lt!344265 k0!2102))))

(declare-fun d!102145 () Bool)

(declare-fun lt!344266 () SeekEntryResult!7855)

(assert (=> d!102145 (and (or ((_ is Undefined!7855) lt!344266) (not ((_ is Found!7855) lt!344266)) (and (bvsge (index!33789 lt!344266) #b00000000000000000000000000000000) (bvslt (index!33789 lt!344266) (size!20719 a!3186)))) (or ((_ is Undefined!7855) lt!344266) ((_ is Found!7855) lt!344266) (not ((_ is MissingZero!7855) lt!344266)) (and (bvsge (index!33788 lt!344266) #b00000000000000000000000000000000) (bvslt (index!33788 lt!344266) (size!20719 a!3186)))) (or ((_ is Undefined!7855) lt!344266) ((_ is Found!7855) lt!344266) ((_ is MissingZero!7855) lt!344266) (not ((_ is MissingVacant!7855) lt!344266)) (and (bvsge (index!33791 lt!344266) #b00000000000000000000000000000000) (bvslt (index!33791 lt!344266) (size!20719 a!3186)))) (or ((_ is Undefined!7855) lt!344266) (ite ((_ is Found!7855) lt!344266) (= (select (arr!20299 a!3186) (index!33789 lt!344266)) k0!2102) (ite ((_ is MissingZero!7855) lt!344266) (= (select (arr!20299 a!3186) (index!33788 lt!344266)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7855) lt!344266) (= (select (arr!20299 a!3186) (index!33791 lt!344266)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102145 (= lt!344266 e!430516)))

(declare-fun c!85626 () Bool)

(assert (=> d!102145 (= c!85626 (and ((_ is Intermediate!7855) lt!344267) (undefined!8667 lt!344267)))))

(assert (=> d!102145 (= lt!344267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!102145 (validMask!0 mask!3328)))

(assert (=> d!102145 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!344266)))

(declare-fun b!773251 () Bool)

(assert (=> b!773251 (= e!430516 Undefined!7855)))

(declare-fun b!773252 () Bool)

(declare-fun c!85625 () Bool)

(assert (=> b!773252 (= c!85625 (= lt!344265 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430514 () SeekEntryResult!7855)

(assert (=> b!773252 (= e!430515 e!430514)))

(declare-fun b!773253 () Bool)

(assert (=> b!773253 (= e!430514 (MissingZero!7855 (index!33790 lt!344267)))))

(declare-fun b!773254 () Bool)

(assert (=> b!773254 (= e!430515 (Found!7855 (index!33790 lt!344267)))))

(declare-fun b!773255 () Bool)

(assert (=> b!773255 (= e!430514 (seekKeyOrZeroReturnVacant!0 (x!64881 lt!344267) (index!33790 lt!344267) (index!33790 lt!344267) k0!2102 a!3186 mask!3328))))

(assert (= (and d!102145 c!85626) b!773251))

(assert (= (and d!102145 (not c!85626)) b!773250))

(assert (= (and b!773250 c!85627) b!773254))

(assert (= (and b!773250 (not c!85627)) b!773252))

(assert (= (and b!773252 c!85625) b!773253))

(assert (= (and b!773252 (not c!85625)) b!773255))

(declare-fun m!718565 () Bool)

(assert (=> b!773250 m!718565))

(declare-fun m!718567 () Bool)

(assert (=> d!102145 m!718567))

(assert (=> d!102145 m!718263))

(declare-fun m!718569 () Bool)

(assert (=> d!102145 m!718569))

(declare-fun m!718571 () Bool)

(assert (=> d!102145 m!718571))

(declare-fun m!718573 () Bool)

(assert (=> d!102145 m!718573))

(assert (=> d!102145 m!718569))

(declare-fun m!718575 () Bool)

(assert (=> d!102145 m!718575))

(declare-fun m!718577 () Bool)

(assert (=> b!773255 m!718577))

(assert (=> b!772895 d!102145))

(declare-fun d!102153 () Bool)

(declare-fun res!522810 () Bool)

(declare-fun e!430525 () Bool)

(assert (=> d!102153 (=> res!522810 e!430525)))

(assert (=> d!102153 (= res!522810 (= (select (arr!20299 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!102153 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!430525)))

(declare-fun b!773264 () Bool)

(declare-fun e!430526 () Bool)

(assert (=> b!773264 (= e!430525 e!430526)))

(declare-fun res!522811 () Bool)

(assert (=> b!773264 (=> (not res!522811) (not e!430526))))

(assert (=> b!773264 (= res!522811 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20719 a!3186)))))

(declare-fun b!773265 () Bool)

(assert (=> b!773265 (= e!430526 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102153 (not res!522810)) b!773264))

(assert (= (and b!773264 res!522811) b!773265))

(assert (=> d!102153 m!718427))

(declare-fun m!718579 () Bool)

(assert (=> b!773265 m!718579))

(assert (=> b!772894 d!102153))

(check-sat (not bm!35157) (not d!102123) (not d!102097) (not b!773071) (not b!773187) (not d!102113) (not b!773063) (not d!102125) (not b!773034) (not b!773202) (not b!773052) (not d!102103) (not b!773106) (not b!773265) (not d!102145) (not d!102117) (not b!773065) (not b!773196) (not b!773225) (not d!102121) (not b!773178) (not d!102107) (not b!773067) (not bm!35160) (not b!773255) (not b!773033) (not bm!35161) (not b!773208) (not b!773160) (not d!102087) (not d!102089) (not b!773070) (not d!102127))
(check-sat)
