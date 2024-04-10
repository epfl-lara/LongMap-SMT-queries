; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67184 () Bool)

(assert start!67184)

(declare-fun b!776984 () Bool)

(declare-fun res!525735 () Bool)

(declare-fun e!432333 () Bool)

(assert (=> b!776984 (=> (not res!525735) (not e!432333))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42539 0))(
  ( (array!42540 (arr!20365 (Array (_ BitVec 32) (_ BitVec 64))) (size!20786 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42539)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!776984 (= res!525735 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20786 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20786 a!3186))))))

(declare-fun b!776985 () Bool)

(declare-fun res!525733 () Bool)

(declare-fun e!432338 () Bool)

(assert (=> b!776985 (=> (not res!525733) (not e!432338))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!776985 (= res!525733 (and (= (size!20786 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20786 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20786 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776986 () Bool)

(declare-fun res!525729 () Bool)

(assert (=> b!776986 (=> (not res!525729) (not e!432338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776986 (= res!525729 (validKeyInArray!0 (select (arr!20365 a!3186) j!159)))))

(declare-fun b!776987 () Bool)

(declare-fun res!525741 () Bool)

(declare-fun e!432336 () Bool)

(assert (=> b!776987 (=> res!525741 e!432336)))

(declare-fun lt!346184 () (_ BitVec 64))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7965 0))(
  ( (MissingZero!7965 (index!34228 (_ BitVec 32))) (Found!7965 (index!34229 (_ BitVec 32))) (Intermediate!7965 (undefined!8777 Bool) (index!34230 (_ BitVec 32)) (x!65164 (_ BitVec 32))) (Undefined!7965) (MissingVacant!7965 (index!34231 (_ BitVec 32))) )
))
(declare-fun lt!346185 () SeekEntryResult!7965)

(assert (=> b!776987 (= res!525741 (or (not (= (select (store (arr!20365 a!3186) i!1173 k0!2102) index!1321) lt!346184)) (undefined!8777 lt!346185)))))

(declare-fun b!776988 () Bool)

(declare-fun e!432335 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42539 (_ BitVec 32)) SeekEntryResult!7965)

(assert (=> b!776988 (= e!432335 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20365 a!3186) j!159) a!3186 mask!3328) (Found!7965 j!159)))))

(declare-fun b!776990 () Bool)

(declare-fun res!525726 () Bool)

(assert (=> b!776990 (=> (not res!525726) (not e!432338))))

(assert (=> b!776990 (= res!525726 (validKeyInArray!0 k0!2102))))

(declare-fun b!776991 () Bool)

(declare-fun res!525736 () Bool)

(declare-fun e!432334 () Bool)

(assert (=> b!776991 (=> (not res!525736) (not e!432334))))

(assert (=> b!776991 (= res!525736 e!432335)))

(declare-fun c!86029 () Bool)

(assert (=> b!776991 (= c!86029 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776992 () Bool)

(assert (=> b!776992 (= e!432333 e!432334)))

(declare-fun res!525727 () Bool)

(assert (=> b!776992 (=> (not res!525727) (not e!432334))))

(declare-fun lt!346189 () SeekEntryResult!7965)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42539 (_ BitVec 32)) SeekEntryResult!7965)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776992 (= res!525727 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20365 a!3186) j!159) mask!3328) (select (arr!20365 a!3186) j!159) a!3186 mask!3328) lt!346189))))

(assert (=> b!776992 (= lt!346189 (Intermediate!7965 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776993 () Bool)

(declare-fun res!525740 () Bool)

(assert (=> b!776993 (=> res!525740 e!432336)))

(assert (=> b!776993 (= res!525740 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20365 a!3186) j!159) a!3186 mask!3328) (Found!7965 j!159))))))

(declare-fun b!776994 () Bool)

(assert (=> b!776994 (= e!432338 e!432333)))

(declare-fun res!525731 () Bool)

(assert (=> b!776994 (=> (not res!525731) (not e!432333))))

(declare-fun lt!346190 () SeekEntryResult!7965)

(assert (=> b!776994 (= res!525731 (or (= lt!346190 (MissingZero!7965 i!1173)) (= lt!346190 (MissingVacant!7965 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42539 (_ BitVec 32)) SeekEntryResult!7965)

(assert (=> b!776994 (= lt!346190 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!776995 () Bool)

(declare-fun e!432340 () Bool)

(assert (=> b!776995 (= e!432340 (not e!432336))))

(declare-fun res!525738 () Bool)

(assert (=> b!776995 (=> res!525738 e!432336)))

(get-info :version)

(assert (=> b!776995 (= res!525738 (or (not ((_ is Intermediate!7965) lt!346185)) (bvslt x!1131 (x!65164 lt!346185)) (not (= x!1131 (x!65164 lt!346185))) (not (= index!1321 (index!34230 lt!346185)))))))

(declare-fun e!432337 () Bool)

(assert (=> b!776995 e!432337))

(declare-fun res!525739 () Bool)

(assert (=> b!776995 (=> (not res!525739) (not e!432337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42539 (_ BitVec 32)) Bool)

(assert (=> b!776995 (= res!525739 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26824 0))(
  ( (Unit!26825) )
))
(declare-fun lt!346183 () Unit!26824)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26824)

(assert (=> b!776995 (= lt!346183 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776996 () Bool)

(declare-fun e!432341 () Bool)

(assert (=> b!776996 (= e!432337 e!432341)))

(declare-fun res!525730 () Bool)

(assert (=> b!776996 (=> (not res!525730) (not e!432341))))

(declare-fun lt!346186 () SeekEntryResult!7965)

(assert (=> b!776996 (= res!525730 (= (seekEntryOrOpen!0 (select (arr!20365 a!3186) j!159) a!3186 mask!3328) lt!346186))))

(assert (=> b!776996 (= lt!346186 (Found!7965 j!159))))

(declare-fun b!776997 () Bool)

(declare-fun res!525728 () Bool)

(assert (=> b!776997 (=> (not res!525728) (not e!432338))))

(declare-fun arrayContainsKey!0 (array!42539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776997 (= res!525728 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776998 () Bool)

(declare-fun res!525732 () Bool)

(assert (=> b!776998 (=> (not res!525732) (not e!432334))))

(assert (=> b!776998 (= res!525732 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20365 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776989 () Bool)

(assert (=> b!776989 (= e!432341 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20365 a!3186) j!159) a!3186 mask!3328) lt!346186))))

(declare-fun res!525742 () Bool)

(assert (=> start!67184 (=> (not res!525742) (not e!432338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67184 (= res!525742 (validMask!0 mask!3328))))

(assert (=> start!67184 e!432338))

(assert (=> start!67184 true))

(declare-fun array_inv!16161 (array!42539) Bool)

(assert (=> start!67184 (array_inv!16161 a!3186)))

(declare-fun b!776999 () Bool)

(declare-fun res!525737 () Bool)

(assert (=> b!776999 (=> (not res!525737) (not e!432333))))

(declare-datatypes ((List!14367 0))(
  ( (Nil!14364) (Cons!14363 (h!15471 (_ BitVec 64)) (t!20682 List!14367)) )
))
(declare-fun arrayNoDuplicates!0 (array!42539 (_ BitVec 32) List!14367) Bool)

(assert (=> b!776999 (= res!525737 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14364))))

(declare-fun b!777000 () Bool)

(assert (=> b!777000 (= e!432334 e!432340)))

(declare-fun res!525743 () Bool)

(assert (=> b!777000 (=> (not res!525743) (not e!432340))))

(declare-fun lt!346188 () SeekEntryResult!7965)

(assert (=> b!777000 (= res!525743 (= lt!346188 lt!346185))))

(declare-fun lt!346187 () array!42539)

(assert (=> b!777000 (= lt!346185 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346184 lt!346187 mask!3328))))

(assert (=> b!777000 (= lt!346188 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346184 mask!3328) lt!346184 lt!346187 mask!3328))))

(assert (=> b!777000 (= lt!346184 (select (store (arr!20365 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!777000 (= lt!346187 (array!42540 (store (arr!20365 a!3186) i!1173 k0!2102) (size!20786 a!3186)))))

(declare-fun b!777001 () Bool)

(declare-fun res!525734 () Bool)

(assert (=> b!777001 (=> (not res!525734) (not e!432333))))

(assert (=> b!777001 (= res!525734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!777002 () Bool)

(assert (=> b!777002 (= e!432335 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20365 a!3186) j!159) a!3186 mask!3328) lt!346189))))

(declare-fun b!777003 () Bool)

(assert (=> b!777003 (= e!432336 (= (seekEntryOrOpen!0 lt!346184 lt!346187 mask!3328) (Found!7965 index!1321)))))

(assert (= (and start!67184 res!525742) b!776985))

(assert (= (and b!776985 res!525733) b!776986))

(assert (= (and b!776986 res!525729) b!776990))

(assert (= (and b!776990 res!525726) b!776997))

(assert (= (and b!776997 res!525728) b!776994))

(assert (= (and b!776994 res!525731) b!777001))

(assert (= (and b!777001 res!525734) b!776999))

(assert (= (and b!776999 res!525737) b!776984))

(assert (= (and b!776984 res!525735) b!776992))

(assert (= (and b!776992 res!525727) b!776998))

(assert (= (and b!776998 res!525732) b!776991))

(assert (= (and b!776991 c!86029) b!777002))

(assert (= (and b!776991 (not c!86029)) b!776988))

(assert (= (and b!776991 res!525736) b!777000))

(assert (= (and b!777000 res!525743) b!776995))

(assert (= (and b!776995 res!525739) b!776996))

(assert (= (and b!776996 res!525730) b!776989))

(assert (= (and b!776995 (not res!525738)) b!776993))

(assert (= (and b!776993 (not res!525740)) b!776987))

(assert (= (and b!776987 (not res!525741)) b!777003))

(declare-fun m!720979 () Bool)

(assert (=> b!777001 m!720979))

(declare-fun m!720981 () Bool)

(assert (=> b!776992 m!720981))

(assert (=> b!776992 m!720981))

(declare-fun m!720983 () Bool)

(assert (=> b!776992 m!720983))

(assert (=> b!776992 m!720983))

(assert (=> b!776992 m!720981))

(declare-fun m!720985 () Bool)

(assert (=> b!776992 m!720985))

(assert (=> b!776988 m!720981))

(assert (=> b!776988 m!720981))

(declare-fun m!720987 () Bool)

(assert (=> b!776988 m!720987))

(declare-fun m!720989 () Bool)

(assert (=> b!777000 m!720989))

(declare-fun m!720991 () Bool)

(assert (=> b!777000 m!720991))

(assert (=> b!777000 m!720989))

(declare-fun m!720993 () Bool)

(assert (=> b!777000 m!720993))

(declare-fun m!720995 () Bool)

(assert (=> b!777000 m!720995))

(declare-fun m!720997 () Bool)

(assert (=> b!777000 m!720997))

(declare-fun m!720999 () Bool)

(assert (=> start!67184 m!720999))

(declare-fun m!721001 () Bool)

(assert (=> start!67184 m!721001))

(declare-fun m!721003 () Bool)

(assert (=> b!777003 m!721003))

(assert (=> b!776986 m!720981))

(assert (=> b!776986 m!720981))

(declare-fun m!721005 () Bool)

(assert (=> b!776986 m!721005))

(assert (=> b!777002 m!720981))

(assert (=> b!777002 m!720981))

(declare-fun m!721007 () Bool)

(assert (=> b!777002 m!721007))

(declare-fun m!721009 () Bool)

(assert (=> b!776997 m!721009))

(declare-fun m!721011 () Bool)

(assert (=> b!776998 m!721011))

(assert (=> b!776989 m!720981))

(assert (=> b!776989 m!720981))

(declare-fun m!721013 () Bool)

(assert (=> b!776989 m!721013))

(declare-fun m!721015 () Bool)

(assert (=> b!776994 m!721015))

(assert (=> b!776993 m!720981))

(assert (=> b!776993 m!720981))

(assert (=> b!776993 m!720987))

(assert (=> b!776987 m!720993))

(declare-fun m!721017 () Bool)

(assert (=> b!776987 m!721017))

(assert (=> b!776996 m!720981))

(assert (=> b!776996 m!720981))

(declare-fun m!721019 () Bool)

(assert (=> b!776996 m!721019))

(declare-fun m!721021 () Bool)

(assert (=> b!776990 m!721021))

(declare-fun m!721023 () Bool)

(assert (=> b!776995 m!721023))

(declare-fun m!721025 () Bool)

(assert (=> b!776995 m!721025))

(declare-fun m!721027 () Bool)

(assert (=> b!776999 m!721027))

(check-sat (not b!777003) (not b!776995) (not b!776989) (not b!776993) (not b!777000) (not b!776997) (not start!67184) (not b!776994) (not b!777001) (not b!776996) (not b!776992) (not b!777002) (not b!776986) (not b!776988) (not b!776990) (not b!776999))
(check-sat)
(get-model)

(declare-fun b!777076 () Bool)

(declare-fun e!432377 () SeekEntryResult!7965)

(declare-fun lt!346222 () SeekEntryResult!7965)

(assert (=> b!777076 (= e!432377 (MissingZero!7965 (index!34230 lt!346222)))))

(declare-fun b!777077 () Bool)

(assert (=> b!777077 (= e!432377 (seekKeyOrZeroReturnVacant!0 (x!65164 lt!346222) (index!34230 lt!346222) (index!34230 lt!346222) (select (arr!20365 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777078 () Bool)

(declare-fun e!432375 () SeekEntryResult!7965)

(assert (=> b!777078 (= e!432375 Undefined!7965)))

(declare-fun b!777079 () Bool)

(declare-fun e!432376 () SeekEntryResult!7965)

(assert (=> b!777079 (= e!432375 e!432376)))

(declare-fun lt!346223 () (_ BitVec 64))

(assert (=> b!777079 (= lt!346223 (select (arr!20365 a!3186) (index!34230 lt!346222)))))

(declare-fun c!86039 () Bool)

(assert (=> b!777079 (= c!86039 (= lt!346223 (select (arr!20365 a!3186) j!159)))))

(declare-fun b!777080 () Bool)

(assert (=> b!777080 (= e!432376 (Found!7965 (index!34230 lt!346222)))))

(declare-fun d!102139 () Bool)

(declare-fun lt!346221 () SeekEntryResult!7965)

(assert (=> d!102139 (and (or ((_ is Undefined!7965) lt!346221) (not ((_ is Found!7965) lt!346221)) (and (bvsge (index!34229 lt!346221) #b00000000000000000000000000000000) (bvslt (index!34229 lt!346221) (size!20786 a!3186)))) (or ((_ is Undefined!7965) lt!346221) ((_ is Found!7965) lt!346221) (not ((_ is MissingZero!7965) lt!346221)) (and (bvsge (index!34228 lt!346221) #b00000000000000000000000000000000) (bvslt (index!34228 lt!346221) (size!20786 a!3186)))) (or ((_ is Undefined!7965) lt!346221) ((_ is Found!7965) lt!346221) ((_ is MissingZero!7965) lt!346221) (not ((_ is MissingVacant!7965) lt!346221)) (and (bvsge (index!34231 lt!346221) #b00000000000000000000000000000000) (bvslt (index!34231 lt!346221) (size!20786 a!3186)))) (or ((_ is Undefined!7965) lt!346221) (ite ((_ is Found!7965) lt!346221) (= (select (arr!20365 a!3186) (index!34229 lt!346221)) (select (arr!20365 a!3186) j!159)) (ite ((_ is MissingZero!7965) lt!346221) (= (select (arr!20365 a!3186) (index!34228 lt!346221)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7965) lt!346221) (= (select (arr!20365 a!3186) (index!34231 lt!346221)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102139 (= lt!346221 e!432375)))

(declare-fun c!86040 () Bool)

(assert (=> d!102139 (= c!86040 (and ((_ is Intermediate!7965) lt!346222) (undefined!8777 lt!346222)))))

(assert (=> d!102139 (= lt!346222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20365 a!3186) j!159) mask!3328) (select (arr!20365 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102139 (validMask!0 mask!3328)))

(assert (=> d!102139 (= (seekEntryOrOpen!0 (select (arr!20365 a!3186) j!159) a!3186 mask!3328) lt!346221)))

(declare-fun b!777081 () Bool)

(declare-fun c!86041 () Bool)

(assert (=> b!777081 (= c!86041 (= lt!346223 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!777081 (= e!432376 e!432377)))

(assert (= (and d!102139 c!86040) b!777078))

(assert (= (and d!102139 (not c!86040)) b!777079))

(assert (= (and b!777079 c!86039) b!777080))

(assert (= (and b!777079 (not c!86039)) b!777081))

(assert (= (and b!777081 c!86041) b!777076))

(assert (= (and b!777081 (not c!86041)) b!777077))

(assert (=> b!777077 m!720981))

(declare-fun m!721079 () Bool)

(assert (=> b!777077 m!721079))

(declare-fun m!721081 () Bool)

(assert (=> b!777079 m!721081))

(assert (=> d!102139 m!720983))

(assert (=> d!102139 m!720981))

(assert (=> d!102139 m!720985))

(declare-fun m!721083 () Bool)

(assert (=> d!102139 m!721083))

(declare-fun m!721085 () Bool)

(assert (=> d!102139 m!721085))

(assert (=> d!102139 m!720981))

(assert (=> d!102139 m!720983))

(assert (=> d!102139 m!720999))

(declare-fun m!721087 () Bool)

(assert (=> d!102139 m!721087))

(assert (=> b!776996 d!102139))

(declare-fun call!35175 () Bool)

(declare-fun bm!35172 () Bool)

(assert (=> bm!35172 (= call!35175 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!777090 () Bool)

(declare-fun e!432385 () Bool)

(declare-fun e!432384 () Bool)

(assert (=> b!777090 (= e!432385 e!432384)))

(declare-fun lt!346231 () (_ BitVec 64))

(assert (=> b!777090 (= lt!346231 (select (arr!20365 a!3186) j!159))))

(declare-fun lt!346232 () Unit!26824)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42539 (_ BitVec 64) (_ BitVec 32)) Unit!26824)

(assert (=> b!777090 (= lt!346232 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!346231 j!159))))

(assert (=> b!777090 (arrayContainsKey!0 a!3186 lt!346231 #b00000000000000000000000000000000)))

(declare-fun lt!346230 () Unit!26824)

(assert (=> b!777090 (= lt!346230 lt!346232)))

(declare-fun res!525802 () Bool)

(assert (=> b!777090 (= res!525802 (= (seekEntryOrOpen!0 (select (arr!20365 a!3186) j!159) a!3186 mask!3328) (Found!7965 j!159)))))

(assert (=> b!777090 (=> (not res!525802) (not e!432384))))

(declare-fun b!777091 () Bool)

(assert (=> b!777091 (= e!432384 call!35175)))

(declare-fun b!777092 () Bool)

(assert (=> b!777092 (= e!432385 call!35175)))

(declare-fun b!777093 () Bool)

(declare-fun e!432386 () Bool)

(assert (=> b!777093 (= e!432386 e!432385)))

(declare-fun c!86044 () Bool)

(assert (=> b!777093 (= c!86044 (validKeyInArray!0 (select (arr!20365 a!3186) j!159)))))

(declare-fun d!102141 () Bool)

(declare-fun res!525803 () Bool)

(assert (=> d!102141 (=> res!525803 e!432386)))

(assert (=> d!102141 (= res!525803 (bvsge j!159 (size!20786 a!3186)))))

(assert (=> d!102141 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!432386)))

(assert (= (and d!102141 (not res!525803)) b!777093))

(assert (= (and b!777093 c!86044) b!777090))

(assert (= (and b!777093 (not c!86044)) b!777092))

(assert (= (and b!777090 res!525802) b!777091))

(assert (= (or b!777091 b!777092) bm!35172))

(declare-fun m!721089 () Bool)

(assert (=> bm!35172 m!721089))

(assert (=> b!777090 m!720981))

(declare-fun m!721091 () Bool)

(assert (=> b!777090 m!721091))

(declare-fun m!721093 () Bool)

(assert (=> b!777090 m!721093))

(assert (=> b!777090 m!720981))

(assert (=> b!777090 m!721019))

(assert (=> b!777093 m!720981))

(assert (=> b!777093 m!720981))

(assert (=> b!777093 m!721005))

(assert (=> b!776995 d!102141))

(declare-fun d!102143 () Bool)

(assert (=> d!102143 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!346235 () Unit!26824)

(declare-fun choose!38 (array!42539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26824)

(assert (=> d!102143 (= lt!346235 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102143 (validMask!0 mask!3328)))

(assert (=> d!102143 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!346235)))

(declare-fun bs!21676 () Bool)

(assert (= bs!21676 d!102143))

(assert (=> bs!21676 m!721023))

(declare-fun m!721095 () Bool)

(assert (=> bs!21676 m!721095))

(assert (=> bs!21676 m!720999))

(assert (=> b!776995 d!102143))

(declare-fun d!102145 () Bool)

(declare-fun res!525808 () Bool)

(declare-fun e!432391 () Bool)

(assert (=> d!102145 (=> res!525808 e!432391)))

(assert (=> d!102145 (= res!525808 (= (select (arr!20365 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!102145 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!432391)))

(declare-fun b!777098 () Bool)

(declare-fun e!432392 () Bool)

(assert (=> b!777098 (= e!432391 e!432392)))

(declare-fun res!525809 () Bool)

(assert (=> b!777098 (=> (not res!525809) (not e!432392))))

(assert (=> b!777098 (= res!525809 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20786 a!3186)))))

(declare-fun b!777099 () Bool)

(assert (=> b!777099 (= e!432392 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102145 (not res!525808)) b!777098))

(assert (= (and b!777098 res!525809) b!777099))

(declare-fun m!721097 () Bool)

(assert (=> d!102145 m!721097))

(declare-fun m!721099 () Bool)

(assert (=> b!777099 m!721099))

(assert (=> b!776997 d!102145))

(declare-fun d!102149 () Bool)

(assert (=> d!102149 (= (validKeyInArray!0 (select (arr!20365 a!3186) j!159)) (and (not (= (select (arr!20365 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20365 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!776986 d!102149))

(declare-fun b!777130 () Bool)

(declare-fun e!432409 () SeekEntryResult!7965)

(assert (=> b!777130 (= e!432409 (Found!7965 index!1321))))

(declare-fun b!777131 () Bool)

(declare-fun e!432410 () SeekEntryResult!7965)

(assert (=> b!777131 (= e!432410 Undefined!7965)))

(declare-fun b!777133 () Bool)

(declare-fun c!86062 () Bool)

(declare-fun lt!346246 () (_ BitVec 64))

(assert (=> b!777133 (= c!86062 (= lt!346246 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432408 () SeekEntryResult!7965)

(assert (=> b!777133 (= e!432409 e!432408)))

(declare-fun lt!346247 () SeekEntryResult!7965)

(declare-fun d!102151 () Bool)

(assert (=> d!102151 (and (or ((_ is Undefined!7965) lt!346247) (not ((_ is Found!7965) lt!346247)) (and (bvsge (index!34229 lt!346247) #b00000000000000000000000000000000) (bvslt (index!34229 lt!346247) (size!20786 a!3186)))) (or ((_ is Undefined!7965) lt!346247) ((_ is Found!7965) lt!346247) (not ((_ is MissingVacant!7965) lt!346247)) (not (= (index!34231 lt!346247) resIntermediateIndex!5)) (and (bvsge (index!34231 lt!346247) #b00000000000000000000000000000000) (bvslt (index!34231 lt!346247) (size!20786 a!3186)))) (or ((_ is Undefined!7965) lt!346247) (ite ((_ is Found!7965) lt!346247) (= (select (arr!20365 a!3186) (index!34229 lt!346247)) (select (arr!20365 a!3186) j!159)) (and ((_ is MissingVacant!7965) lt!346247) (= (index!34231 lt!346247) resIntermediateIndex!5) (= (select (arr!20365 a!3186) (index!34231 lt!346247)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102151 (= lt!346247 e!432410)))

(declare-fun c!86061 () Bool)

(assert (=> d!102151 (= c!86061 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102151 (= lt!346246 (select (arr!20365 a!3186) index!1321))))

(assert (=> d!102151 (validMask!0 mask!3328)))

(assert (=> d!102151 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20365 a!3186) j!159) a!3186 mask!3328) lt!346247)))

(declare-fun b!777132 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777132 (= e!432408 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20365 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777134 () Bool)

(assert (=> b!777134 (= e!432410 e!432409)))

(declare-fun c!86060 () Bool)

(assert (=> b!777134 (= c!86060 (= lt!346246 (select (arr!20365 a!3186) j!159)))))

(declare-fun b!777135 () Bool)

(assert (=> b!777135 (= e!432408 (MissingVacant!7965 resIntermediateIndex!5))))

(assert (= (and d!102151 c!86061) b!777131))

(assert (= (and d!102151 (not c!86061)) b!777134))

(assert (= (and b!777134 c!86060) b!777130))

(assert (= (and b!777134 (not c!86060)) b!777133))

(assert (= (and b!777133 c!86062) b!777135))

(assert (= (and b!777133 (not c!86062)) b!777132))

(declare-fun m!721109 () Bool)

(assert (=> d!102151 m!721109))

(declare-fun m!721111 () Bool)

(assert (=> d!102151 m!721111))

(declare-fun m!721113 () Bool)

(assert (=> d!102151 m!721113))

(assert (=> d!102151 m!720999))

(declare-fun m!721115 () Bool)

(assert (=> b!777132 m!721115))

(assert (=> b!777132 m!721115))

(assert (=> b!777132 m!720981))

(declare-fun m!721117 () Bool)

(assert (=> b!777132 m!721117))

(assert (=> b!776993 d!102151))

(declare-fun b!777140 () Bool)

(declare-fun e!432417 () SeekEntryResult!7965)

(declare-fun lt!346249 () SeekEntryResult!7965)

(assert (=> b!777140 (= e!432417 (MissingZero!7965 (index!34230 lt!346249)))))

(declare-fun b!777141 () Bool)

(assert (=> b!777141 (= e!432417 (seekKeyOrZeroReturnVacant!0 (x!65164 lt!346249) (index!34230 lt!346249) (index!34230 lt!346249) lt!346184 lt!346187 mask!3328))))

(declare-fun b!777142 () Bool)

(declare-fun e!432415 () SeekEntryResult!7965)

(assert (=> b!777142 (= e!432415 Undefined!7965)))

(declare-fun b!777143 () Bool)

(declare-fun e!432416 () SeekEntryResult!7965)

(assert (=> b!777143 (= e!432415 e!432416)))

(declare-fun lt!346250 () (_ BitVec 64))

(assert (=> b!777143 (= lt!346250 (select (arr!20365 lt!346187) (index!34230 lt!346249)))))

(declare-fun c!86063 () Bool)

(assert (=> b!777143 (= c!86063 (= lt!346250 lt!346184))))

(declare-fun b!777144 () Bool)

(assert (=> b!777144 (= e!432416 (Found!7965 (index!34230 lt!346249)))))

(declare-fun d!102157 () Bool)

(declare-fun lt!346248 () SeekEntryResult!7965)

(assert (=> d!102157 (and (or ((_ is Undefined!7965) lt!346248) (not ((_ is Found!7965) lt!346248)) (and (bvsge (index!34229 lt!346248) #b00000000000000000000000000000000) (bvslt (index!34229 lt!346248) (size!20786 lt!346187)))) (or ((_ is Undefined!7965) lt!346248) ((_ is Found!7965) lt!346248) (not ((_ is MissingZero!7965) lt!346248)) (and (bvsge (index!34228 lt!346248) #b00000000000000000000000000000000) (bvslt (index!34228 lt!346248) (size!20786 lt!346187)))) (or ((_ is Undefined!7965) lt!346248) ((_ is Found!7965) lt!346248) ((_ is MissingZero!7965) lt!346248) (not ((_ is MissingVacant!7965) lt!346248)) (and (bvsge (index!34231 lt!346248) #b00000000000000000000000000000000) (bvslt (index!34231 lt!346248) (size!20786 lt!346187)))) (or ((_ is Undefined!7965) lt!346248) (ite ((_ is Found!7965) lt!346248) (= (select (arr!20365 lt!346187) (index!34229 lt!346248)) lt!346184) (ite ((_ is MissingZero!7965) lt!346248) (= (select (arr!20365 lt!346187) (index!34228 lt!346248)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7965) lt!346248) (= (select (arr!20365 lt!346187) (index!34231 lt!346248)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102157 (= lt!346248 e!432415)))

(declare-fun c!86064 () Bool)

(assert (=> d!102157 (= c!86064 (and ((_ is Intermediate!7965) lt!346249) (undefined!8777 lt!346249)))))

(assert (=> d!102157 (= lt!346249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346184 mask!3328) lt!346184 lt!346187 mask!3328))))

(assert (=> d!102157 (validMask!0 mask!3328)))

(assert (=> d!102157 (= (seekEntryOrOpen!0 lt!346184 lt!346187 mask!3328) lt!346248)))

(declare-fun b!777145 () Bool)

(declare-fun c!86065 () Bool)

(assert (=> b!777145 (= c!86065 (= lt!346250 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!777145 (= e!432416 e!432417)))

(assert (= (and d!102157 c!86064) b!777142))

(assert (= (and d!102157 (not c!86064)) b!777143))

(assert (= (and b!777143 c!86063) b!777144))

(assert (= (and b!777143 (not c!86063)) b!777145))

(assert (= (and b!777145 c!86065) b!777140))

(assert (= (and b!777145 (not c!86065)) b!777141))

(declare-fun m!721119 () Bool)

(assert (=> b!777141 m!721119))

(declare-fun m!721123 () Bool)

(assert (=> b!777143 m!721123))

(assert (=> d!102157 m!720989))

(assert (=> d!102157 m!720991))

(declare-fun m!721127 () Bool)

(assert (=> d!102157 m!721127))

(declare-fun m!721129 () Bool)

(assert (=> d!102157 m!721129))

(assert (=> d!102157 m!720989))

(assert (=> d!102157 m!720999))

(declare-fun m!721131 () Bool)

(assert (=> d!102157 m!721131))

(assert (=> b!777003 d!102157))

(declare-fun b!777148 () Bool)

(declare-fun e!432422 () SeekEntryResult!7965)

(declare-fun lt!346252 () SeekEntryResult!7965)

(assert (=> b!777148 (= e!432422 (MissingZero!7965 (index!34230 lt!346252)))))

(declare-fun b!777149 () Bool)

(assert (=> b!777149 (= e!432422 (seekKeyOrZeroReturnVacant!0 (x!65164 lt!346252) (index!34230 lt!346252) (index!34230 lt!346252) k0!2102 a!3186 mask!3328))))

(declare-fun b!777150 () Bool)

(declare-fun e!432420 () SeekEntryResult!7965)

(assert (=> b!777150 (= e!432420 Undefined!7965)))

(declare-fun b!777151 () Bool)

(declare-fun e!432421 () SeekEntryResult!7965)

(assert (=> b!777151 (= e!432420 e!432421)))

(declare-fun lt!346253 () (_ BitVec 64))

(assert (=> b!777151 (= lt!346253 (select (arr!20365 a!3186) (index!34230 lt!346252)))))

(declare-fun c!86066 () Bool)

(assert (=> b!777151 (= c!86066 (= lt!346253 k0!2102))))

(declare-fun b!777152 () Bool)

(assert (=> b!777152 (= e!432421 (Found!7965 (index!34230 lt!346252)))))

(declare-fun d!102161 () Bool)

(declare-fun lt!346251 () SeekEntryResult!7965)

(assert (=> d!102161 (and (or ((_ is Undefined!7965) lt!346251) (not ((_ is Found!7965) lt!346251)) (and (bvsge (index!34229 lt!346251) #b00000000000000000000000000000000) (bvslt (index!34229 lt!346251) (size!20786 a!3186)))) (or ((_ is Undefined!7965) lt!346251) ((_ is Found!7965) lt!346251) (not ((_ is MissingZero!7965) lt!346251)) (and (bvsge (index!34228 lt!346251) #b00000000000000000000000000000000) (bvslt (index!34228 lt!346251) (size!20786 a!3186)))) (or ((_ is Undefined!7965) lt!346251) ((_ is Found!7965) lt!346251) ((_ is MissingZero!7965) lt!346251) (not ((_ is MissingVacant!7965) lt!346251)) (and (bvsge (index!34231 lt!346251) #b00000000000000000000000000000000) (bvslt (index!34231 lt!346251) (size!20786 a!3186)))) (or ((_ is Undefined!7965) lt!346251) (ite ((_ is Found!7965) lt!346251) (= (select (arr!20365 a!3186) (index!34229 lt!346251)) k0!2102) (ite ((_ is MissingZero!7965) lt!346251) (= (select (arr!20365 a!3186) (index!34228 lt!346251)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7965) lt!346251) (= (select (arr!20365 a!3186) (index!34231 lt!346251)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102161 (= lt!346251 e!432420)))

(declare-fun c!86067 () Bool)

(assert (=> d!102161 (= c!86067 (and ((_ is Intermediate!7965) lt!346252) (undefined!8777 lt!346252)))))

(assert (=> d!102161 (= lt!346252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!102161 (validMask!0 mask!3328)))

(assert (=> d!102161 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!346251)))

(declare-fun b!777153 () Bool)

(declare-fun c!86068 () Bool)

(assert (=> b!777153 (= c!86068 (= lt!346253 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!777153 (= e!432421 e!432422)))

(assert (= (and d!102161 c!86067) b!777150))

(assert (= (and d!102161 (not c!86067)) b!777151))

(assert (= (and b!777151 c!86066) b!777152))

(assert (= (and b!777151 (not c!86066)) b!777153))

(assert (= (and b!777153 c!86068) b!777148))

(assert (= (and b!777153 (not c!86068)) b!777149))

(declare-fun m!721133 () Bool)

(assert (=> b!777149 m!721133))

(declare-fun m!721135 () Bool)

(assert (=> b!777151 m!721135))

(declare-fun m!721137 () Bool)

(assert (=> d!102161 m!721137))

(declare-fun m!721139 () Bool)

(assert (=> d!102161 m!721139))

(declare-fun m!721141 () Bool)

(assert (=> d!102161 m!721141))

(declare-fun m!721143 () Bool)

(assert (=> d!102161 m!721143))

(assert (=> d!102161 m!721137))

(assert (=> d!102161 m!720999))

(declare-fun m!721145 () Bool)

(assert (=> d!102161 m!721145))

(assert (=> b!776994 d!102161))

(declare-fun d!102163 () Bool)

(assert (=> d!102163 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67184 d!102163))

(declare-fun d!102165 () Bool)

(assert (=> d!102165 (= (array_inv!16161 a!3186) (bvsge (size!20786 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67184 d!102165))

(declare-fun bm!35173 () Bool)

(declare-fun call!35176 () Bool)

(assert (=> bm!35173 (= call!35176 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!777172 () Bool)

(declare-fun e!432433 () Bool)

(declare-fun e!432432 () Bool)

(assert (=> b!777172 (= e!432433 e!432432)))

(declare-fun lt!346264 () (_ BitVec 64))

(assert (=> b!777172 (= lt!346264 (select (arr!20365 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!346265 () Unit!26824)

(assert (=> b!777172 (= lt!346265 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!346264 #b00000000000000000000000000000000))))

(assert (=> b!777172 (arrayContainsKey!0 a!3186 lt!346264 #b00000000000000000000000000000000)))

(declare-fun lt!346263 () Unit!26824)

(assert (=> b!777172 (= lt!346263 lt!346265)))

(declare-fun res!525816 () Bool)

(assert (=> b!777172 (= res!525816 (= (seekEntryOrOpen!0 (select (arr!20365 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7965 #b00000000000000000000000000000000)))))

(assert (=> b!777172 (=> (not res!525816) (not e!432432))))

(declare-fun b!777173 () Bool)

(assert (=> b!777173 (= e!432432 call!35176)))

(declare-fun b!777174 () Bool)

(assert (=> b!777174 (= e!432433 call!35176)))

(declare-fun b!777175 () Bool)

(declare-fun e!432434 () Bool)

(assert (=> b!777175 (= e!432434 e!432433)))

(declare-fun c!86078 () Bool)

(assert (=> b!777175 (= c!86078 (validKeyInArray!0 (select (arr!20365 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102167 () Bool)

(declare-fun res!525817 () Bool)

(assert (=> d!102167 (=> res!525817 e!432434)))

(assert (=> d!102167 (= res!525817 (bvsge #b00000000000000000000000000000000 (size!20786 a!3186)))))

(assert (=> d!102167 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!432434)))

(assert (= (and d!102167 (not res!525817)) b!777175))

(assert (= (and b!777175 c!86078) b!777172))

(assert (= (and b!777175 (not c!86078)) b!777174))

(assert (= (and b!777172 res!525816) b!777173))

(assert (= (or b!777173 b!777174) bm!35173))

(declare-fun m!721147 () Bool)

(assert (=> bm!35173 m!721147))

(assert (=> b!777172 m!721097))

(declare-fun m!721151 () Bool)

(assert (=> b!777172 m!721151))

(declare-fun m!721153 () Bool)

(assert (=> b!777172 m!721153))

(assert (=> b!777172 m!721097))

(declare-fun m!721159 () Bool)

(assert (=> b!777172 m!721159))

(assert (=> b!777175 m!721097))

(assert (=> b!777175 m!721097))

(declare-fun m!721165 () Bool)

(assert (=> b!777175 m!721165))

(assert (=> b!777001 d!102167))

(declare-fun d!102169 () Bool)

(assert (=> d!102169 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!776990 d!102169))

(declare-fun e!432480 () SeekEntryResult!7965)

(declare-fun b!777248 () Bool)

(assert (=> b!777248 (= e!432480 (Intermediate!7965 true (toIndex!0 (select (arr!20365 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!777249 () Bool)

(declare-fun e!432483 () SeekEntryResult!7965)

(assert (=> b!777249 (= e!432483 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20365 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20365 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777250 () Bool)

(declare-fun lt!346293 () SeekEntryResult!7965)

(assert (=> b!777250 (and (bvsge (index!34230 lt!346293) #b00000000000000000000000000000000) (bvslt (index!34230 lt!346293) (size!20786 a!3186)))))

(declare-fun res!525850 () Bool)

(assert (=> b!777250 (= res!525850 (= (select (arr!20365 a!3186) (index!34230 lt!346293)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432484 () Bool)

(assert (=> b!777250 (=> res!525850 e!432484)))

(declare-fun b!777251 () Bool)

(assert (=> b!777251 (and (bvsge (index!34230 lt!346293) #b00000000000000000000000000000000) (bvslt (index!34230 lt!346293) (size!20786 a!3186)))))

(assert (=> b!777251 (= e!432484 (= (select (arr!20365 a!3186) (index!34230 lt!346293)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!777252 () Bool)

(declare-fun e!432481 () Bool)

(assert (=> b!777252 (= e!432481 (bvsge (x!65164 lt!346293) #b01111111111111111111111111111110))))

(declare-fun b!777254 () Bool)

(assert (=> b!777254 (= e!432480 e!432483)))

(declare-fun c!86101 () Bool)

(declare-fun lt!346294 () (_ BitVec 64))

(assert (=> b!777254 (= c!86101 (or (= lt!346294 (select (arr!20365 a!3186) j!159)) (= (bvadd lt!346294 lt!346294) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777255 () Bool)

(declare-fun e!432482 () Bool)

(assert (=> b!777255 (= e!432481 e!432482)))

(declare-fun res!525849 () Bool)

(assert (=> b!777255 (= res!525849 (and ((_ is Intermediate!7965) lt!346293) (not (undefined!8777 lt!346293)) (bvslt (x!65164 lt!346293) #b01111111111111111111111111111110) (bvsge (x!65164 lt!346293) #b00000000000000000000000000000000) (bvsge (x!65164 lt!346293) #b00000000000000000000000000000000)))))

(assert (=> b!777255 (=> (not res!525849) (not e!432482))))

(declare-fun b!777256 () Bool)

(assert (=> b!777256 (= e!432483 (Intermediate!7965 false (toIndex!0 (select (arr!20365 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!777253 () Bool)

(assert (=> b!777253 (and (bvsge (index!34230 lt!346293) #b00000000000000000000000000000000) (bvslt (index!34230 lt!346293) (size!20786 a!3186)))))

(declare-fun res!525851 () Bool)

(assert (=> b!777253 (= res!525851 (= (select (arr!20365 a!3186) (index!34230 lt!346293)) (select (arr!20365 a!3186) j!159)))))

(assert (=> b!777253 (=> res!525851 e!432484)))

(assert (=> b!777253 (= e!432482 e!432484)))

(declare-fun d!102173 () Bool)

(assert (=> d!102173 e!432481))

(declare-fun c!86100 () Bool)

(assert (=> d!102173 (= c!86100 (and ((_ is Intermediate!7965) lt!346293) (undefined!8777 lt!346293)))))

(assert (=> d!102173 (= lt!346293 e!432480)))

(declare-fun c!86102 () Bool)

(assert (=> d!102173 (= c!86102 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102173 (= lt!346294 (select (arr!20365 a!3186) (toIndex!0 (select (arr!20365 a!3186) j!159) mask!3328)))))

(assert (=> d!102173 (validMask!0 mask!3328)))

(assert (=> d!102173 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20365 a!3186) j!159) mask!3328) (select (arr!20365 a!3186) j!159) a!3186 mask!3328) lt!346293)))

(assert (= (and d!102173 c!86102) b!777248))

(assert (= (and d!102173 (not c!86102)) b!777254))

(assert (= (and b!777254 c!86101) b!777256))

(assert (= (and b!777254 (not c!86101)) b!777249))

(assert (= (and d!102173 c!86100) b!777252))

(assert (= (and d!102173 (not c!86100)) b!777255))

(assert (= (and b!777255 res!525849) b!777253))

(assert (= (and b!777253 (not res!525851)) b!777250))

(assert (= (and b!777250 (not res!525850)) b!777251))

(assert (=> b!777249 m!720983))

(declare-fun m!721201 () Bool)

(assert (=> b!777249 m!721201))

(assert (=> b!777249 m!721201))

(assert (=> b!777249 m!720981))

(declare-fun m!721203 () Bool)

(assert (=> b!777249 m!721203))

(declare-fun m!721205 () Bool)

(assert (=> b!777253 m!721205))

(assert (=> b!777250 m!721205))

(assert (=> b!777251 m!721205))

(assert (=> d!102173 m!720983))

(declare-fun m!721207 () Bool)

(assert (=> d!102173 m!721207))

(assert (=> d!102173 m!720999))

(assert (=> b!776992 d!102173))

(declare-fun d!102189 () Bool)

(declare-fun lt!346309 () (_ BitVec 32))

(declare-fun lt!346308 () (_ BitVec 32))

(assert (=> d!102189 (= lt!346309 (bvmul (bvxor lt!346308 (bvlshr lt!346308 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102189 (= lt!346308 ((_ extract 31 0) (bvand (bvxor (select (arr!20365 a!3186) j!159) (bvlshr (select (arr!20365 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102189 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!525852 (let ((h!15474 ((_ extract 31 0) (bvand (bvxor (select (arr!20365 a!3186) j!159) (bvlshr (select (arr!20365 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65171 (bvmul (bvxor h!15474 (bvlshr h!15474 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65171 (bvlshr x!65171 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!525852 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!525852 #b00000000000000000000000000000000))))))

(assert (=> d!102189 (= (toIndex!0 (select (arr!20365 a!3186) j!159) mask!3328) (bvand (bvxor lt!346309 (bvlshr lt!346309 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!776992 d!102189))

(declare-fun b!777269 () Bool)

(declare-fun e!432494 () SeekEntryResult!7965)

(assert (=> b!777269 (= e!432494 (Intermediate!7965 true index!1321 x!1131))))

(declare-fun b!777270 () Bool)

(declare-fun e!432497 () SeekEntryResult!7965)

(assert (=> b!777270 (= e!432497 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20365 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777271 () Bool)

(declare-fun lt!346310 () SeekEntryResult!7965)

(assert (=> b!777271 (and (bvsge (index!34230 lt!346310) #b00000000000000000000000000000000) (bvslt (index!34230 lt!346310) (size!20786 a!3186)))))

(declare-fun res!525860 () Bool)

(assert (=> b!777271 (= res!525860 (= (select (arr!20365 a!3186) (index!34230 lt!346310)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432498 () Bool)

(assert (=> b!777271 (=> res!525860 e!432498)))

(declare-fun b!777272 () Bool)

(assert (=> b!777272 (and (bvsge (index!34230 lt!346310) #b00000000000000000000000000000000) (bvslt (index!34230 lt!346310) (size!20786 a!3186)))))

(assert (=> b!777272 (= e!432498 (= (select (arr!20365 a!3186) (index!34230 lt!346310)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!777273 () Bool)

(declare-fun e!432495 () Bool)

(assert (=> b!777273 (= e!432495 (bvsge (x!65164 lt!346310) #b01111111111111111111111111111110))))

(declare-fun b!777275 () Bool)

(assert (=> b!777275 (= e!432494 e!432497)))

(declare-fun c!86107 () Bool)

(declare-fun lt!346311 () (_ BitVec 64))

(assert (=> b!777275 (= c!86107 (or (= lt!346311 (select (arr!20365 a!3186) j!159)) (= (bvadd lt!346311 lt!346311) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777276 () Bool)

(declare-fun e!432496 () Bool)

(assert (=> b!777276 (= e!432495 e!432496)))

(declare-fun res!525859 () Bool)

(assert (=> b!777276 (= res!525859 (and ((_ is Intermediate!7965) lt!346310) (not (undefined!8777 lt!346310)) (bvslt (x!65164 lt!346310) #b01111111111111111111111111111110) (bvsge (x!65164 lt!346310) #b00000000000000000000000000000000) (bvsge (x!65164 lt!346310) x!1131)))))

(assert (=> b!777276 (=> (not res!525859) (not e!432496))))

(declare-fun b!777277 () Bool)

(assert (=> b!777277 (= e!432497 (Intermediate!7965 false index!1321 x!1131))))

(declare-fun b!777274 () Bool)

(assert (=> b!777274 (and (bvsge (index!34230 lt!346310) #b00000000000000000000000000000000) (bvslt (index!34230 lt!346310) (size!20786 a!3186)))))

(declare-fun res!525861 () Bool)

(assert (=> b!777274 (= res!525861 (= (select (arr!20365 a!3186) (index!34230 lt!346310)) (select (arr!20365 a!3186) j!159)))))

(assert (=> b!777274 (=> res!525861 e!432498)))

(assert (=> b!777274 (= e!432496 e!432498)))

(declare-fun d!102191 () Bool)

(assert (=> d!102191 e!432495))

(declare-fun c!86106 () Bool)

(assert (=> d!102191 (= c!86106 (and ((_ is Intermediate!7965) lt!346310) (undefined!8777 lt!346310)))))

(assert (=> d!102191 (= lt!346310 e!432494)))

(declare-fun c!86108 () Bool)

(assert (=> d!102191 (= c!86108 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102191 (= lt!346311 (select (arr!20365 a!3186) index!1321))))

(assert (=> d!102191 (validMask!0 mask!3328)))

(assert (=> d!102191 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20365 a!3186) j!159) a!3186 mask!3328) lt!346310)))

(assert (= (and d!102191 c!86108) b!777269))

(assert (= (and d!102191 (not c!86108)) b!777275))

(assert (= (and b!777275 c!86107) b!777277))

(assert (= (and b!777275 (not c!86107)) b!777270))

(assert (= (and d!102191 c!86106) b!777273))

(assert (= (and d!102191 (not c!86106)) b!777276))

(assert (= (and b!777276 res!525859) b!777274))

(assert (= (and b!777274 (not res!525861)) b!777271))

(assert (= (and b!777271 (not res!525860)) b!777272))

(assert (=> b!777270 m!721115))

(assert (=> b!777270 m!721115))

(assert (=> b!777270 m!720981))

(declare-fun m!721215 () Bool)

(assert (=> b!777270 m!721215))

(declare-fun m!721217 () Bool)

(assert (=> b!777274 m!721217))

(assert (=> b!777271 m!721217))

(assert (=> b!777272 m!721217))

(assert (=> d!102191 m!721113))

(assert (=> d!102191 m!720999))

(assert (=> b!777002 d!102191))

(assert (=> b!776988 d!102151))

(declare-fun b!777278 () Bool)

(declare-fun e!432500 () SeekEntryResult!7965)

(assert (=> b!777278 (= e!432500 (Found!7965 resIntermediateIndex!5))))

(declare-fun b!777279 () Bool)

(declare-fun e!432501 () SeekEntryResult!7965)

(assert (=> b!777279 (= e!432501 Undefined!7965)))

(declare-fun b!777281 () Bool)

(declare-fun c!86111 () Bool)

(declare-fun lt!346312 () (_ BitVec 64))

(assert (=> b!777281 (= c!86111 (= lt!346312 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432499 () SeekEntryResult!7965)

(assert (=> b!777281 (= e!432500 e!432499)))

(declare-fun lt!346313 () SeekEntryResult!7965)

(declare-fun d!102195 () Bool)

(assert (=> d!102195 (and (or ((_ is Undefined!7965) lt!346313) (not ((_ is Found!7965) lt!346313)) (and (bvsge (index!34229 lt!346313) #b00000000000000000000000000000000) (bvslt (index!34229 lt!346313) (size!20786 a!3186)))) (or ((_ is Undefined!7965) lt!346313) ((_ is Found!7965) lt!346313) (not ((_ is MissingVacant!7965) lt!346313)) (not (= (index!34231 lt!346313) resIntermediateIndex!5)) (and (bvsge (index!34231 lt!346313) #b00000000000000000000000000000000) (bvslt (index!34231 lt!346313) (size!20786 a!3186)))) (or ((_ is Undefined!7965) lt!346313) (ite ((_ is Found!7965) lt!346313) (= (select (arr!20365 a!3186) (index!34229 lt!346313)) (select (arr!20365 a!3186) j!159)) (and ((_ is MissingVacant!7965) lt!346313) (= (index!34231 lt!346313) resIntermediateIndex!5) (= (select (arr!20365 a!3186) (index!34231 lt!346313)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!102195 (= lt!346313 e!432501)))

(declare-fun c!86110 () Bool)

(assert (=> d!102195 (= c!86110 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102195 (= lt!346312 (select (arr!20365 a!3186) resIntermediateIndex!5))))

(assert (=> d!102195 (validMask!0 mask!3328)))

(assert (=> d!102195 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20365 a!3186) j!159) a!3186 mask!3328) lt!346313)))

(declare-fun b!777280 () Bool)

(assert (=> b!777280 (= e!432499 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20365 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!777282 () Bool)

(assert (=> b!777282 (= e!432501 e!432500)))

(declare-fun c!86109 () Bool)

(assert (=> b!777282 (= c!86109 (= lt!346312 (select (arr!20365 a!3186) j!159)))))

(declare-fun b!777283 () Bool)

(assert (=> b!777283 (= e!432499 (MissingVacant!7965 resIntermediateIndex!5))))

(assert (= (and d!102195 c!86110) b!777279))

(assert (= (and d!102195 (not c!86110)) b!777282))

(assert (= (and b!777282 c!86109) b!777278))

(assert (= (and b!777282 (not c!86109)) b!777281))

(assert (= (and b!777281 c!86111) b!777283))

(assert (= (and b!777281 (not c!86111)) b!777280))

(declare-fun m!721219 () Bool)

(assert (=> d!102195 m!721219))

(declare-fun m!721221 () Bool)

(assert (=> d!102195 m!721221))

(assert (=> d!102195 m!721011))

(assert (=> d!102195 m!720999))

(declare-fun m!721223 () Bool)

(assert (=> b!777280 m!721223))

(assert (=> b!777280 m!721223))

(assert (=> b!777280 m!720981))

(declare-fun m!721225 () Bool)

(assert (=> b!777280 m!721225))

(assert (=> b!776989 d!102195))

(declare-fun b!777286 () Bool)

(declare-fun e!432502 () SeekEntryResult!7965)

(assert (=> b!777286 (= e!432502 (Intermediate!7965 true index!1321 x!1131))))

(declare-fun e!432505 () SeekEntryResult!7965)

(declare-fun b!777287 () Bool)

(assert (=> b!777287 (= e!432505 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!346184 lt!346187 mask!3328))))

(declare-fun b!777288 () Bool)

(declare-fun lt!346318 () SeekEntryResult!7965)

(assert (=> b!777288 (and (bvsge (index!34230 lt!346318) #b00000000000000000000000000000000) (bvslt (index!34230 lt!346318) (size!20786 lt!346187)))))

(declare-fun res!525863 () Bool)

(assert (=> b!777288 (= res!525863 (= (select (arr!20365 lt!346187) (index!34230 lt!346318)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432506 () Bool)

(assert (=> b!777288 (=> res!525863 e!432506)))

(declare-fun b!777289 () Bool)

(assert (=> b!777289 (and (bvsge (index!34230 lt!346318) #b00000000000000000000000000000000) (bvslt (index!34230 lt!346318) (size!20786 lt!346187)))))

(assert (=> b!777289 (= e!432506 (= (select (arr!20365 lt!346187) (index!34230 lt!346318)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!777290 () Bool)

(declare-fun e!432503 () Bool)

(assert (=> b!777290 (= e!432503 (bvsge (x!65164 lt!346318) #b01111111111111111111111111111110))))

(declare-fun b!777292 () Bool)

(assert (=> b!777292 (= e!432502 e!432505)))

(declare-fun c!86113 () Bool)

(declare-fun lt!346319 () (_ BitVec 64))

(assert (=> b!777292 (= c!86113 (or (= lt!346319 lt!346184) (= (bvadd lt!346319 lt!346319) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777293 () Bool)

(declare-fun e!432504 () Bool)

(assert (=> b!777293 (= e!432503 e!432504)))

(declare-fun res!525862 () Bool)

(assert (=> b!777293 (= res!525862 (and ((_ is Intermediate!7965) lt!346318) (not (undefined!8777 lt!346318)) (bvslt (x!65164 lt!346318) #b01111111111111111111111111111110) (bvsge (x!65164 lt!346318) #b00000000000000000000000000000000) (bvsge (x!65164 lt!346318) x!1131)))))

(assert (=> b!777293 (=> (not res!525862) (not e!432504))))

(declare-fun b!777294 () Bool)

(assert (=> b!777294 (= e!432505 (Intermediate!7965 false index!1321 x!1131))))

(declare-fun b!777291 () Bool)

(assert (=> b!777291 (and (bvsge (index!34230 lt!346318) #b00000000000000000000000000000000) (bvslt (index!34230 lt!346318) (size!20786 lt!346187)))))

(declare-fun res!525864 () Bool)

(assert (=> b!777291 (= res!525864 (= (select (arr!20365 lt!346187) (index!34230 lt!346318)) lt!346184))))

(assert (=> b!777291 (=> res!525864 e!432506)))

(assert (=> b!777291 (= e!432504 e!432506)))

(declare-fun d!102197 () Bool)

(assert (=> d!102197 e!432503))

(declare-fun c!86112 () Bool)

(assert (=> d!102197 (= c!86112 (and ((_ is Intermediate!7965) lt!346318) (undefined!8777 lt!346318)))))

(assert (=> d!102197 (= lt!346318 e!432502)))

(declare-fun c!86114 () Bool)

(assert (=> d!102197 (= c!86114 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102197 (= lt!346319 (select (arr!20365 lt!346187) index!1321))))

(assert (=> d!102197 (validMask!0 mask!3328)))

(assert (=> d!102197 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346184 lt!346187 mask!3328) lt!346318)))

(assert (= (and d!102197 c!86114) b!777286))

(assert (= (and d!102197 (not c!86114)) b!777292))

(assert (= (and b!777292 c!86113) b!777294))

(assert (= (and b!777292 (not c!86113)) b!777287))

(assert (= (and d!102197 c!86112) b!777290))

(assert (= (and d!102197 (not c!86112)) b!777293))

(assert (= (and b!777293 res!525862) b!777291))

(assert (= (and b!777291 (not res!525864)) b!777288))

(assert (= (and b!777288 (not res!525863)) b!777289))

(assert (=> b!777287 m!721115))

(assert (=> b!777287 m!721115))

(declare-fun m!721227 () Bool)

(assert (=> b!777287 m!721227))

(declare-fun m!721229 () Bool)

(assert (=> b!777291 m!721229))

(assert (=> b!777288 m!721229))

(assert (=> b!777289 m!721229))

(declare-fun m!721231 () Bool)

(assert (=> d!102197 m!721231))

(assert (=> d!102197 m!720999))

(assert (=> b!777000 d!102197))

(declare-fun b!777303 () Bool)

(declare-fun e!432511 () SeekEntryResult!7965)

(assert (=> b!777303 (= e!432511 (Intermediate!7965 true (toIndex!0 lt!346184 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!777304 () Bool)

(declare-fun e!432514 () SeekEntryResult!7965)

(assert (=> b!777304 (= e!432514 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!346184 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!346184 lt!346187 mask!3328))))

(declare-fun b!777305 () Bool)

(declare-fun lt!346320 () SeekEntryResult!7965)

(assert (=> b!777305 (and (bvsge (index!34230 lt!346320) #b00000000000000000000000000000000) (bvslt (index!34230 lt!346320) (size!20786 lt!346187)))))

(declare-fun res!525866 () Bool)

(assert (=> b!777305 (= res!525866 (= (select (arr!20365 lt!346187) (index!34230 lt!346320)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!432515 () Bool)

(assert (=> b!777305 (=> res!525866 e!432515)))

(declare-fun b!777306 () Bool)

(assert (=> b!777306 (and (bvsge (index!34230 lt!346320) #b00000000000000000000000000000000) (bvslt (index!34230 lt!346320) (size!20786 lt!346187)))))

(assert (=> b!777306 (= e!432515 (= (select (arr!20365 lt!346187) (index!34230 lt!346320)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!777307 () Bool)

(declare-fun e!432512 () Bool)

(assert (=> b!777307 (= e!432512 (bvsge (x!65164 lt!346320) #b01111111111111111111111111111110))))

(declare-fun b!777309 () Bool)

(assert (=> b!777309 (= e!432511 e!432514)))

(declare-fun c!86120 () Bool)

(declare-fun lt!346321 () (_ BitVec 64))

(assert (=> b!777309 (= c!86120 (or (= lt!346321 lt!346184) (= (bvadd lt!346321 lt!346321) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777310 () Bool)

(declare-fun e!432513 () Bool)

(assert (=> b!777310 (= e!432512 e!432513)))

(declare-fun res!525865 () Bool)

(assert (=> b!777310 (= res!525865 (and ((_ is Intermediate!7965) lt!346320) (not (undefined!8777 lt!346320)) (bvslt (x!65164 lt!346320) #b01111111111111111111111111111110) (bvsge (x!65164 lt!346320) #b00000000000000000000000000000000) (bvsge (x!65164 lt!346320) #b00000000000000000000000000000000)))))

(assert (=> b!777310 (=> (not res!525865) (not e!432513))))

(declare-fun b!777311 () Bool)

(assert (=> b!777311 (= e!432514 (Intermediate!7965 false (toIndex!0 lt!346184 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!777308 () Bool)

(assert (=> b!777308 (and (bvsge (index!34230 lt!346320) #b00000000000000000000000000000000) (bvslt (index!34230 lt!346320) (size!20786 lt!346187)))))

(declare-fun res!525867 () Bool)

(assert (=> b!777308 (= res!525867 (= (select (arr!20365 lt!346187) (index!34230 lt!346320)) lt!346184))))

(assert (=> b!777308 (=> res!525867 e!432515)))

(assert (=> b!777308 (= e!432513 e!432515)))

(declare-fun d!102199 () Bool)

(assert (=> d!102199 e!432512))

(declare-fun c!86119 () Bool)

(assert (=> d!102199 (= c!86119 (and ((_ is Intermediate!7965) lt!346320) (undefined!8777 lt!346320)))))

(assert (=> d!102199 (= lt!346320 e!432511)))

(declare-fun c!86121 () Bool)

(assert (=> d!102199 (= c!86121 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102199 (= lt!346321 (select (arr!20365 lt!346187) (toIndex!0 lt!346184 mask!3328)))))

(assert (=> d!102199 (validMask!0 mask!3328)))

(assert (=> d!102199 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346184 mask!3328) lt!346184 lt!346187 mask!3328) lt!346320)))

(assert (= (and d!102199 c!86121) b!777303))

(assert (= (and d!102199 (not c!86121)) b!777309))

(assert (= (and b!777309 c!86120) b!777311))

(assert (= (and b!777309 (not c!86120)) b!777304))

(assert (= (and d!102199 c!86119) b!777307))

(assert (= (and d!102199 (not c!86119)) b!777310))

(assert (= (and b!777310 res!525865) b!777308))

(assert (= (and b!777308 (not res!525867)) b!777305))

(assert (= (and b!777305 (not res!525866)) b!777306))

(assert (=> b!777304 m!720989))

(declare-fun m!721233 () Bool)

(assert (=> b!777304 m!721233))

(assert (=> b!777304 m!721233))

(declare-fun m!721235 () Bool)

(assert (=> b!777304 m!721235))

(declare-fun m!721237 () Bool)

(assert (=> b!777308 m!721237))

(assert (=> b!777305 m!721237))

(assert (=> b!777306 m!721237))

(assert (=> d!102199 m!720989))

(declare-fun m!721239 () Bool)

(assert (=> d!102199 m!721239))

(assert (=> d!102199 m!720999))

(assert (=> b!777000 d!102199))

(declare-fun d!102201 () Bool)

(declare-fun lt!346326 () (_ BitVec 32))

(declare-fun lt!346325 () (_ BitVec 32))

(assert (=> d!102201 (= lt!346326 (bvmul (bvxor lt!346325 (bvlshr lt!346325 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102201 (= lt!346325 ((_ extract 31 0) (bvand (bvxor lt!346184 (bvlshr lt!346184 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102201 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!525852 (let ((h!15474 ((_ extract 31 0) (bvand (bvxor lt!346184 (bvlshr lt!346184 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65171 (bvmul (bvxor h!15474 (bvlshr h!15474 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65171 (bvlshr x!65171 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!525852 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!525852 #b00000000000000000000000000000000))))))

(assert (=> d!102201 (= (toIndex!0 lt!346184 mask!3328) (bvand (bvxor lt!346326 (bvlshr lt!346326 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!777000 d!102201))

(declare-fun b!777363 () Bool)

(declare-fun e!432548 () Bool)

(declare-fun e!432550 () Bool)

(assert (=> b!777363 (= e!432548 e!432550)))

(declare-fun c!86138 () Bool)

(assert (=> b!777363 (= c!86138 (validKeyInArray!0 (select (arr!20365 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102205 () Bool)

(declare-fun res!525891 () Bool)

(declare-fun e!432551 () Bool)

(assert (=> d!102205 (=> res!525891 e!432551)))

(assert (=> d!102205 (= res!525891 (bvsge #b00000000000000000000000000000000 (size!20786 a!3186)))))

(assert (=> d!102205 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14364) e!432551)))

(declare-fun bm!35182 () Bool)

(declare-fun call!35185 () Bool)

(assert (=> bm!35182 (= call!35185 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86138 (Cons!14363 (select (arr!20365 a!3186) #b00000000000000000000000000000000) Nil!14364) Nil!14364)))))

(declare-fun b!777364 () Bool)

(declare-fun e!432549 () Bool)

(declare-fun contains!4097 (List!14367 (_ BitVec 64)) Bool)

(assert (=> b!777364 (= e!432549 (contains!4097 Nil!14364 (select (arr!20365 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!777365 () Bool)

(assert (=> b!777365 (= e!432550 call!35185)))

(declare-fun b!777366 () Bool)

(assert (=> b!777366 (= e!432550 call!35185)))

(declare-fun b!777367 () Bool)

(assert (=> b!777367 (= e!432551 e!432548)))

(declare-fun res!525890 () Bool)

(assert (=> b!777367 (=> (not res!525890) (not e!432548))))

(assert (=> b!777367 (= res!525890 (not e!432549))))

(declare-fun res!525892 () Bool)

(assert (=> b!777367 (=> (not res!525892) (not e!432549))))

(assert (=> b!777367 (= res!525892 (validKeyInArray!0 (select (arr!20365 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!102205 (not res!525891)) b!777367))

(assert (= (and b!777367 res!525892) b!777364))

(assert (= (and b!777367 res!525890) b!777363))

(assert (= (and b!777363 c!86138) b!777365))

(assert (= (and b!777363 (not c!86138)) b!777366))

(assert (= (or b!777365 b!777366) bm!35182))

(assert (=> b!777363 m!721097))

(assert (=> b!777363 m!721097))

(assert (=> b!777363 m!721165))

(assert (=> bm!35182 m!721097))

(declare-fun m!721275 () Bool)

(assert (=> bm!35182 m!721275))

(assert (=> b!777364 m!721097))

(assert (=> b!777364 m!721097))

(declare-fun m!721277 () Bool)

(assert (=> b!777364 m!721277))

(assert (=> b!777367 m!721097))

(assert (=> b!777367 m!721097))

(assert (=> b!777367 m!721165))

(assert (=> b!776999 d!102205))

(check-sat (not bm!35173) (not b!777093) (not b!777132) (not b!777175) (not b!777304) (not b!777090) (not b!777149) (not b!777363) (not bm!35172) (not b!777141) (not b!777172) (not d!102161) (not d!102195) (not d!102197) (not b!777364) (not b!777077) (not d!102157) (not b!777287) (not d!102151) (not d!102143) (not d!102199) (not d!102191) (not b!777280) (not b!777367) (not b!777099) (not d!102139) (not bm!35182) (not b!777270) (not b!777249) (not d!102173))
(check-sat)
